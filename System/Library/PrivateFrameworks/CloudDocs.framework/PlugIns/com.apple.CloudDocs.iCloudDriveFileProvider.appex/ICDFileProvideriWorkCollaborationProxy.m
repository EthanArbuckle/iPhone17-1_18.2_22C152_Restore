@interface ICDFileProvideriWorkCollaborationProxy
- (ICDFileProvideriWorkCollaborationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
- (id)fetchCollaborationTokenWithCompletionHandler:(id)a3;
- (id)fetchLatestRevisionWithCompletionHandler:(id)a3;
@end

@implementation ICDFileProvideriWorkCollaborationProxy

- (ICDFileProvideriWorkCollaborationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDFileProvideriWorkCollaborationProxy;
  v10 = [(BaseFileProvideriWorkCollaborationProxy *)&v13 initWithItemIdentifier:a4 operationQueue:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
  }

  return v11;
}

- (id)fetchCollaborationTokenWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate distantFuture];
  id v6 = objc_alloc((Class)BRSharingCopyShareTokenOperation);
  v7 = [(BaseFileProvideriWorkCollaborationProxy *)self itemIdentifier];
  id v8 = [v6 initWithItemID:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001D930;
  v17[3] = &unk_100045090;
  id v9 = v4;
  id v19 = v9;
  id v10 = v5;
  id v18 = v10;
  [v8 setShareAndBaseTokenCompletionBlock:v17];
  objc_initWeak(&location, v8);
  v11 = [(BaseFileProvideriWorkCollaborationProxy *)self operationQueue];
  [v11 addOperation:v8];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D9F0;
  v14[3] = &unk_1000446D8;
  objc_copyWeak(&v15, &location);
  id v12 = [(BaseFileProvideriWorkCollaborationProxy *)self newProgressWithCancellationHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

- (id)fetchLatestRevisionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002C0E4(self, (uint64_t)v5, v6);
    }

    v7 = +[BRDaemonConnection defaultConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001DBCC;
    v14[3] = &unk_1000445C0;
    id v8 = v4;
    id v15 = v8;
    id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];

    id v10 = [(BaseFileProvideriWorkCollaborationProxy *)self itemIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001DBDC;
    v12[3] = &unk_100044610;
    id v13 = v8;
    [v9 fetchLatestContentRevisionForItemIdentifier:v10 reply:v12];
  }
  return 0;
}

- (void).cxx_destruct
{
}

@end