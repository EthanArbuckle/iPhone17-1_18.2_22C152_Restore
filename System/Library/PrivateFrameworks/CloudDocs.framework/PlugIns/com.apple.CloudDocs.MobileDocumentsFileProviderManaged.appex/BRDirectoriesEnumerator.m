@interface BRDirectoriesEnumerator
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation BRDirectoriesEnumerator

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "br_pageTokenSortOrder");
  v8 = +[BRDaemonConnection defaultConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007E94;
  v16[3] = &unk_1000385D0;
  id v9 = v5;
  id v17 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v16];
  id v11 = objc_msgSend(v6, "br_pageTokenOffset");

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007EA0;
  v13[3] = &unk_100038808;
  id v14 = v9;
  char v15 = (char)v7;
  id v12 = v9;
  [v10 enumerateAllFoldersWithSortOrder:v7 offset:v11 limit:200 completion:v13];
}

@end