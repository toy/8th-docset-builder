build : 8th.docset.tgz

8th.docset.tgz : 8th.docset
	docker run --rm -it -v "$$(pwd)":/here -w /here ubuntu tar --exclude='.DS_Store' -cvzf "$@" "$<"

8th.docset : out
	rm -rf "$@"
	dashing build --source "$<"

out : basis prepare
	rm -rf "$@"
	./prepare

basis :
	rm -rf "$@"
	mkdir "$@"
	(cd "$@" && curl -O https://8th-dev.com/words.html)

clean:
	rm -rf 8th.docset.tgz 8th.docset out basis
