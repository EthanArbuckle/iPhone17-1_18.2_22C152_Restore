@interface BRFileProvideriWorkCollaborationProxy
- (BRFileProvideriWorkCollaborationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
- (id)fetchCollaborationTokenWithCompletionHandler:(id)a3;
- (id)fetchLatestRevisionWithCompletionHandler:(id)a3;
@end

@implementation BRFileProvideriWorkCollaborationProxy

- (BRFileProvideriWorkCollaborationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRFileProvideriWorkCollaborationProxy;
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
  fileProviderExtension = self->_fileProviderExtension;
  v7 = [(BaseFileProvideriWorkCollaborationProxy *)self itemIdentifier];
  v8 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v7];

  id v9 = [objc_alloc((Class)BRSharingCopyShareTokenOperation) initWithURL:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001EABC;
  v18[3] = &unk_100045090;
  id v10 = v4;
  id v20 = v10;
  id v11 = v5;
  id v19 = v11;
  [v9 setShareAndBaseTokenCompletionBlock:v18];
  objc_initWeak(&location, v9);
  v12 = [(BaseFileProvideriWorkCollaborationProxy *)self operationQueue];
  [v12 addOperation:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001EB7C;
  v15[3] = &unk_1000446D8;
  objc_copyWeak(&v16, &location);
  id v13 = [(BaseFileProvideriWorkCollaborationProxy *)self newProgressWithCancellationHandler:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v13;
}

- (id)fetchLatestRevisionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  fileProviderExtension = self->_fileProviderExtension;
  v6 = [(BaseFileProvideriWorkCollaborationProxy *)self itemIdentifier];
  v7 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v6];

  v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(BaseFileProvideriWorkCollaborationProxy *)self itemIdentifier];
    *(_DWORD *)buf = 138412802;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] fetchLatestRevisionWithCompletionHandler: %@, %@%@", buf, 0x20u);
  }
  id v10 = [objc_alloc((Class)BRFileProvidingOperation) initWithURL:v7 readingOptions:0];
  [v10 setWantsCurrentVersion:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001EE24;
  v19[3] = &unk_1000445C0;
  id v20 = v4;
  id v11 = v4;
  [v10 setFileProvidingCompletion:v19];
  v12 = [(BaseFileProvideriWorkCollaborationProxy *)self operationQueue];
  [v12 addOperation:v10];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001EE34;
  v17[3] = &unk_1000446B0;
  id v18 = v10;
  id v13 = v10;
  id v14 = [(BaseFileProvideriWorkCollaborationProxy *)self newProgressWithCancellationHandler:v17];

  return v14;
}

- (void).cxx_destruct
{
}

@end