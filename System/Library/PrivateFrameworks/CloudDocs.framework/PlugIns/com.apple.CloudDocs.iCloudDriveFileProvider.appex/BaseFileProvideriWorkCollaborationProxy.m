@interface BaseFileProvideriWorkCollaborationProxy
- (BaseFileProvideriWorkCollaborationProxy)initWithItemIdentifier:(id)a3 operationQueue:(id)a4;
- (NSOperationQueue)operationQueue;
- (NSString)itemIdentifier;
- (id)fetchCollaborationTokenWithCompletionHandler:(id)a3;
- (id)fetchFolderSharingStateWithCompletionHandler:(id)a3;
- (id)fetchLatestRevisionWithCompletionHandler:(id)a3;
- (id)fetchSharedFolderInfoWithCompletionHandler:(id)a3;
- (id)newProgressWithCancellationHandler:(id)a3;
- (id)refreshSharingStateWithCompletionHandler:(id)a3;
- (void)fetchAccountIdentifierWithCompletionHandler:(id)a3;
- (void)fetchFileProviderIdentifierWithCompletionHandler:(id)a3;
- (void)fetchURLForSharingFileWithCompletionHandler:(id)a3;
- (void)fetchVersionAndCapabilitiesWithCompletionHandler:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation BaseFileProvideriWorkCollaborationProxy

- (BaseFileProvideriWorkCollaborationProxy)initWithItemIdentifier:(id)a3 operationQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BaseFileProvideriWorkCollaborationProxy;
  v9 = [(BaseFileProvideriWorkCollaborationProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemIdentifier, a3);
    objc_storeStrong((id *)&v10->_operationQueue, a4);
  }

  return v10;
}

- (void)fetchVersionAndCapabilitiesWithCompletionHandler:(id)a3
{
}

- (id)fetchCollaborationTokenWithCompletionHandler:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002AA20();
  }

  return 0;
}

- (id)fetchLatestRevisionWithCompletionHandler:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002AA20();
  }

  return 0;
}

- (id)refreshSharingStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_itemIdentifier;
  v6 = +[BRDaemonConnection defaultConnection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018B9C;
  v17[3] = &unk_1000445C0;
  id v7 = v4;
  id v18 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v17];

  itemIdentifier = self->_itemIdentifier;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100018BAC;
  v14[3] = &unk_1000448A8;
  v15 = v5;
  id v16 = v7;
  id v10 = v7;
  v11 = v5;
  [v8 refreshSharingStateForItemIdentifier:itemIdentifier reply:v14];
  objc_super v12 = +[NSProgress progressWithTotalUnitCount:0];

  return v12;
}

- (void)fetchFileProviderIdentifierWithCompletionHandler:(id)a3
{
}

- (void)fetchURLForSharingFileWithCompletionHandler:(id)a3
{
}

- (id)fetchFolderSharingStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[BRDaemonConnection defaultConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018E68;
  v13[3] = &unk_1000445C0;
  id v6 = v4;
  id v14 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];

  itemIdentifier = self->_itemIdentifier;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018E80;
  v11[3] = &unk_100044F18;
  id v12 = v6;
  id v9 = v6;
  [v7 getShareOptionsOfItemIdentifier:itemIdentifier reply:v11];

  return 0;
}

- (id)fetchSharedFolderInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[BRDaemonConnection defaultConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018FCC;
  v13[3] = &unk_1000445C0;
  id v6 = v4;
  id v14 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];

  itemIdentifier = self->_itemIdentifier;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018FE8;
  v11[3] = &unk_100044F18;
  id v12 = v6;
  id v9 = v6;
  [v7 getShareOptionsOfItemIdentifier:itemIdentifier reply:v11];

  return 0;
}

- (id)newProgressWithCancellationHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[NSProgress progressWithTotalUnitCount:0];
  [v4 setCancellationHandler:v3];

  return v4;
}

- (void)fetchAccountIdentifierWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = +[ACAccountStore defaultStore];
  v5 = objc_msgSend(v4, "br_accountForCurrentPersona");
  id v6 = [v5 identifier];
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002BBD8();
  }

  if (v6)
  {
    v3[2](v3, v6, 0);
  }
  else
  {
    id v9 = +[NSError brc_errorLoggedOut];
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v9);
  }
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end