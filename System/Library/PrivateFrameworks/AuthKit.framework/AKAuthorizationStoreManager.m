@interface AKAuthorizationStoreManager
+ (id)sharedInstance;
- (AKAuthorizationProviding)storeProvider;
- (AKAuthorizationStoreManager)init;
- (NSMutableDictionary)stores;
- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3;
- (id)storeForAltDSID:(id)a3;
- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4;
- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4;
- (void)setStoreProvider:(id)a3;
- (void)setStores:(id)a3;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5;
@end

@implementation AKAuthorizationStoreManager

+ (id)sharedInstance
{
  if (qword_100272288 != -1) {
    dispatch_once(&qword_100272288, &stru_1002270F0);
  }
  v2 = (void *)qword_100272280;

  return v2;
}

- (AKAuthorizationStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationStoreManager;
  v2 = [(AKAuthorizationStoreManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AKAuthorizationStoreProvider);
    storeProvider = v2->_storeProvider;
    v2->_storeProvider = (AKAuthorizationProviding *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    stores = v2->_stores;
    v2->_stores = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)storeForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finding AKAuthorizationStore for altDSID: %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = [(NSMutableDictionary *)self->_stores objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_stores objectForKeyedSubscript:v4];
  }
  else
  {
    objc_super v8 = [(AKAuthorizationStoreManager *)self storeProvider];
    v7 = [v8 storeForAltDSID:v4];

    if (v4 && v7)
    {
      v9 = [(AKAuthorizationStoreManager *)self stores];
      [v9 setObject:v7 forKeyedSubscript:v4];
    }
    else
    {
      v9 = _AKLogSiwa();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10017CF34(v9);
      }
    }
  }

  return v7;
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000217E8;
  v15[3] = &unk_100227118;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000218FC;
  v15[3] = &unk_100227118;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021A10;
  v15[3] = &unk_100227140;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021B24;
  v15[3] = &unk_100227118;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021C38;
  v15[3] = &unk_100227118;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021D4C;
  v15[3] = &unk_100227118;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 perform:v15];
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 altDSIDForAuthKitAccountRequestingAuthorization];

  id v10 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021E64;
  v13[3] = &unk_100227168;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 perform:v13];
}

- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 altDSIDForAuthKitAccountRequestingAuthorization];

  id v10 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021F78;
  v13[3] = &unk_100227168;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 perform:v13];
}

- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002205C;
  v11[3] = &unk_100227168;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022140;
  v11[3] = &unk_100227168;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022224;
  v11[3] = &unk_100227168;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10000F850;
  id v16 = sub_10000F778;
  id v17 = 0;
  uint64_t v5 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022378;
  v9[3] = &unk_100227190;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 perform:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000224A0;
  v11[3] = &unk_1002271B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 perform:v11];
}

- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AKAuthorizationStoreManager *)self storeForAltDSID:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022568;
  v9[3] = &unk_1002271E0;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  [v7 perform:v9];
}

- (NSMutableDictionary)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (AKAuthorizationProviding)storeProvider
{
  return self->_storeProvider;
}

- (void)setStoreProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeProvider, 0);

  objc_storeStrong((id *)&self->_stores, 0);
}

@end