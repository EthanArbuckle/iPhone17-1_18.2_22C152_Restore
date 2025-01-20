@interface AKApplicationInformationController
+ (id)sharedController;
- (id)_buildApplicationAuthorizationController;
- (id)_buildApplicationMetadataServiceForAltDSID:(id)a3 client:(id)a4;
- (void)_updatePrimaryApplicationsMetadataForAltDSID:(id)a3 metadataInfo:(id)a4;
- (void)fetchAppInformationWithAltDSID:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchPrimaryApplicationInformationForAltDSID:(id)a3 appInformation:(id)a4 client:(id)a5 completion:(id)a6;
@end

@implementation AKApplicationInformationController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7C7C;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272680 != -1) {
    dispatch_once(&qword_100272680, block);
  }
  v2 = (void *)qword_100272678;

  return v2;
}

- (void)fetchAppInformationWithAltDSID:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting to fetch app info for %@", buf, 0xCu);
  }

  v12 = objc_opt_new();
  [v12 setAltDSID:v8];
  v13 = [AKGrandSlamRequestProvider alloc];
  v14 = [(AKURLRequestProviderImpl *)v13 initWithContext:v12 urlBagKey:AKURLBagKeyFetchAppInfo];
  [(AKURLRequestProviderImpl *)v14 setClient:v10];

  [(AKGrandSlamRequestProvider *)v14 setAuthenticatedRequest:1];
  v15 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C7E80;
  v18[3] = &unk_100226C30;
  v20 = self;
  id v21 = v9;
  id v19 = v8;
  id v16 = v8;
  id v17 = v9;
  [(AKServiceControllerImpl *)v15 executeRequestWithCompletion:v18];
}

- (void)fetchPrimaryApplicationInformationForAltDSID:(id)a3 appInformation:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v11 objectForKeyedSubscript:@"client_id"];
    *(_DWORD *)buf = 138412546;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting to fetch bundle id for Primary application for serviceID: %@, altDSID: %@", buf, 0x16u);
  }
  id v16 = [(AKApplicationInformationController *)self _buildApplicationMetadataServiceForAltDSID:v10 client:v13];

  id v17 = [v11 objectForKeyedSubscript:@"client_id"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C82E0;
  v20[3] = &unk_100229158;
  id v21 = v10;
  id v22 = v12;
  id v18 = v10;
  id v19 = v12;
  [v16 performFetchPrimaryApplicationInformationForClientBundleID:v17 completion:v20];
}

- (void)_updatePrimaryApplicationsMetadataForAltDSID:(id)a3 metadataInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init((Class)AKMediaServicesController);
  id v8 = +[AKAuthorizationStoreManager sharedInstance];
  id v9 = [(AKApplicationInformationController *)self _buildApplicationMetadataServiceForAltDSID:v7 client:0];
  id v10 = [[AKAccountsMetadataController alloc] initWithMediaServiceController:v13 localStorageController:v8 metadataService:v9];
  id v11 = [v6 teams];

  id v12 = [v11 allValues];

  [(AKAccountsMetadataController *)v10 updatePrimaryAppsMetadataWithDeveloperTeams:v12 forAltDSID:v7 completionHandler:&stru_10022B388];
}

- (id)_buildApplicationAuthorizationController
{
  v2 = [AKSharedAccountsStorageController alloc];
  id v3 = objc_alloc_init((Class)AAFKeychainManager);
  v4 = +[KCSharingGroupManager sharedInstance];
  v5 = [(AKSharedAccountsStorageController *)v2 initWithKeychainStorageController:v3 keychainGroupManager:v4];

  id v6 = [AKApplicationAuthorizationController alloc];
  id v7 = +[AKAuthorizationStoreManager sharedInstance];
  id v8 = [(AKApplicationAuthorizationController *)v6 initWithStoreManager:v7 sharedAccountsStorageController:v5];

  return v8;
}

- (id)_buildApplicationMetadataServiceForAltDSID:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setAltDSID:v6];

  id v8 = [AKApplicationMetadataRequestProvider alloc];
  id v9 = [(AKApplicationMetadataRequestProvider *)v8 initWithContext:v7 urlBagKey:AKURLBagKeyFetchPrimaryBundleID];
  [(AKURLRequestProviderImpl *)v9 setClient:v5];

  [(AKGrandSlamRequestProvider *)v9 setAuthenticatedRequest:1];
  id v10 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v9];
  id v11 = [[AKApplicationMetadataService alloc] initWithServiceController:v10];

  return v11;
}

@end