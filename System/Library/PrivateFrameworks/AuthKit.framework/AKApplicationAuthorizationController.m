@interface AKApplicationAuthorizationController
- (AKApplicationAuthorizationController)init;
- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3;
- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3 sharedAccountsStorageController:(id)a4;
- (BOOL)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 error:(id *)a4;
- (id)currentAuthorizationListVersionWithAltDSID:(id)a3;
- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4 withHandlerBundleID:(id)a5;
- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4 clientIDsInKeychain:(id)a5;
- (void)_notifyCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4;
- (void)_processCredentialStateChanges:(id)a3;
- (void)_processCredentialStateChanges:(id)a3 completion:(id)a4;
- (void)removeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
@end

@implementation AKApplicationAuthorizationController

- (AKApplicationAuthorizationController)init
{
  return [(AKApplicationAuthorizationController *)self initWithStoreManager:0];
}

- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKApplicationAuthorizationController;
  v5 = [(AKApplicationAuthorizationController *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (AKAuthorizationStoreManager *)v4;
    }
    else
    {
      v6 = +[AKAuthorizationStoreManager sharedInstance];
    }
    storeManager = v5->_storeManager;
    v5->_storeManager = v6;
  }
  return v5;
}

- (AKApplicationAuthorizationController)initWithStoreManager:(id)a3 sharedAccountsStorageController:(id)a4
{
  id v7 = a4;
  v8 = [(AKApplicationAuthorizationController *)self initWithStoreManager:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_sharedAccountsStorageController, a4);
  }

  return v9;
}

- (id)currentAuthorizationListVersionWithAltDSID:(id)a3
{
  return [(AKAuthorizationStoreManager *)self->_storeManager fetchAuthorizationListVersionWithAltDSID:a3];
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  storeManager = self->_storeManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000943F4;
  v11[3] = &unk_100229158;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(AKAuthorizationStoreManager *)storeManager updateAuthorizationListWithMetadataInfo:a3 withAltDSID:a4 completion:v11];
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4
{
  storeManager = self->_storeManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000944EC;
  v5[3] = &unk_1002299D8;
  v5[4] = self;
  [(AKAuthorizationStoreManager *)storeManager updateAuthorizationListWithMetadataInfo:a3 withAltDSID:a4 completion:v5];
}

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  storeManager = self->_storeManager;
  id v9 = a5;
  [(AKAuthorizationStoreManager *)storeManager storeAuthorization:a3 withAltDSID:a4 forClient:v9];
  id v10 = [v9 bundleID];

  [(AKApplicationAuthorizationController *)self _credentialStateDidChange:1 forApplicationWithClientID:v10];
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storeManager = self->_storeManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100094658;
  v11[3] = &unk_1002286A8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKAuthorizationStoreManager *)storeManager revokeAuthorizationForApplicationWithClientID:v10 completion:v11];
}

- (void)removeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
}

- (BOOL)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000F940;
  v15 = sub_10000F7F0;
  id v16 = 0;
  storeManager = self->_storeManager;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100094818;
  v10[3] = &unk_10022A220;
  v10[4] = self;
  v10[5] = &v11;
  [(AKAuthorizationStoreManager *)storeManager revokeAuthorizationForAllApplicationsWithAltDSID:v6 completion:v10];
  if (a4) {
    *a4 = (id) v12[5];
  }
  [(AKAuthorizationStoreManager *)self->_storeManager setListVersionToVersion:@"0" withAltDSID:v6];
  BOOL v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)_processCredentialStateChanges:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000948EC;
  v3[3] = &unk_10022A270;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)_processCredentialStateChanges:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedAccountsStorageController = self->_sharedAccountsStorageController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100094A64;
  v11[3] = &unk_10022A328;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKSharedAccountsStoring *)sharedAccountsStorageController fetchAllAccountsSharedByCurrentUserWithCompletionHandler:v11];
}

- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v6 = a4;
  [(AKApplicationAuthorizationController *)self _notifyCredentialStateChange:a3 forApplicationWithClientID:v6];
  [(AKApplicationAuthorizationController *)self _broadcastCredentialStateChange:a3 forApplicationWithClientID:v6];
}

- (void)_credentialStateDidChange:(int64_t)a3 forApplicationWithClientID:(id)a4 clientIDsInKeychain:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(AKApplicationAuthorizationController *)self _credentialStateDidChange:a3 forApplicationWithClientID:v8];
  unsigned int v10 = [v9 containsObject:v8];

  uint64_t v11 = +[AKFeatureManager sharedManager];
  unsigned int v12 = [v11 isSiwaCredentialSharingEnabled];

  if (!a3 && v12 && v10 != 0)
  {
    id v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ was revoked. Removing shared credential.", (uint8_t *)&v15, 0xCu);
    }

    [(AKSharedAccountsStoring *)self->_sharedAccountsStorageController removeSharedAccountBelongingToCurrentUserWithClientID:v8 completionHandler:&stru_10022A348];
  }
}

- (void)_notifyCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v5 = a4;
  id v6 = +[AKAuthorizationConnectionManager sharedManager];
  id v7 = [v6 remoteObjectProxyWithProtocol:&OBJC_PROTOCOL___AKAuthorizationNotificationHandler forBundleID:v5 errorHandler:&stru_10022A368];

  if (v7)
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notifying client (%@) of credential state change %d.", buf, 0x12u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100094F8C;
    v9[3] = &unk_100228018;
    id v10 = v5;
    [v7 credentialStateDidChange:a3 completion:v9];
  }
}

- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4
{
  id v6 = a4;
  id v7 = +[AKAuthorizationConnectionManager sharedManager];
  id v8 = [v7 bundleIDs];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100095154;
  v10[3] = &unk_10022A2D8;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void)_broadcastCredentialStateChange:(int64_t)a3 forApplicationWithClientID:(id)a4 withHandlerBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[AKAuthorizationConnectionManager sharedManager];
  id v10 = [v9 remoteObjectProxyWithProtocol:&OBJC_PROTOCOL___AKAuthorizationStateBroadcastHandler forBundleID:v8 errorHandler:&stru_10022A388];

  if (v10)
  {
    id v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 1024;
      int v15 = a3;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notifying client (%@) of credential state change (%d) for client ID (%@).", (uint8_t *)&v12, 0x1Cu);
    }

    [v10 credentialStateDidChange:a3 forApplicationWithClientID:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAccountsStorageController, 0);

  objc_storeStrong((id *)&self->_storeManager, 0);
}

@end