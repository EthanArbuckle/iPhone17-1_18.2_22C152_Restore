@interface BuddyEnrollmentCoordinator
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyAppleIDSignInTask)signInTask;
- (BuddyEnrollmentCoordinator)initWithPasscodeCacheManager:(id)a3 buddyPreferences:(id)a4 featureFlags:(id)a5;
- (BuddyFeatureFlags)featureFlags;
- (DMCEnrollmentFlowController)enrollmentFlowController;
- (DMCServiceDiscoveryHelper)servicediscoveryHelper;
- (NSString)profileIdentifier;
- (UINavigationController)navController;
- (UIViewController)baseViewController;
- (id)_cachedAuthenticationResults;
- (id)profileInstallationRequestCompleteHandler;
- (unint64_t)mdmEnrollmentChannel;
- (void)_cacheAuthenticationResults:(id)a3;
- (void)_requestInteractiveMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 completionHandler:(id)a6;
- (void)discoverAndStoreEnrollmentChannelWithEnrollmentURL:(id)a3 certificateDatas:(id)a4 completionHandler:(id)a5;
- (void)interruptEnrollment;
- (void)profileInstallationDone;
- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7;
- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6;
- (void)retrieveProfileDataWithBaseViewController:(id)a3 navigationController:(id)a4 completionHandler:(id)a5;
- (void)setBaseViewController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setEnrollmentFlowController:(id)a3;
- (void)setMdmEnrollmentChannel:(unint64_t)a3;
- (void)setNavController:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfileInstallationRequestCompleteHandler:(id)a3;
- (void)setServicediscoveryHelper:(id)a3;
- (void)setSignInTask:(id)a3;
- (void)showEnrollmentFailure:(id)a3;
- (void)verifyEnrollmentStateWithCompletionHandler:(id)a3;
@end

@implementation BuddyEnrollmentCoordinator

- (BuddyEnrollmentCoordinator)initWithPasscodeCacheManager:(id)a3 buddyPreferences:(id)a4 featureFlags:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v7 = v14;
  id v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)BuddyEnrollmentCoordinator;
  id v14 = [(BuddyEnrollmentCoordinator *)&v10 init];
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)v14 + 10, location[0]);
    objc_storeStrong((id *)v14 + 11, obj);
    objc_storeStrong((id *)v14 + 1, v11);
  }
  v8 = (BuddyEnrollmentCoordinator *)v14;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)retrieveProfileDataWithBaseViewController:(id)a3 navigationController:(id)a4 completionHandler:(id)a5
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  [(BuddyEnrollmentCoordinator *)v37 setBaseViewController:location[0]];
  [(BuddyEnrollmentCoordinator *)v37 setNavController:v35];
  id v7 = +[MDMCloudConfiguration sharedConfiguration];
  id v33 = [v7 enrollmentServerURL];

  id v8 = +[MDMCloudConfiguration sharedConfiguration];
  id v32 = [v8 enrollmentAnchorCertificates];

  id v31 = (id)objc_opt_new();
  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  v27 = sub_1000E3208;
  v28 = &unk_1002B2AE8;
  v29 = v37;
  id v30 = v34;
  [v31 setProfileInstallationRequestHandler:&v24];
  id v23 = +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:v37 managedConfigurationHelper:v31];
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_1000E3370;
  v19 = &unk_1002B2B10;
  v20 = v37;
  id v21 = v34;
  id v22 = objc_retainBlock(&v15);
  id v9 = +[MDMCloudConfiguration sharedConfiguration];
  id v10 = [v9 details];
  id v11 = [v10 objectForKeyedSubscript:kCCRemoteManagementAccountIdentifierKey];
  BOOL v12 = [v11 length] != 0;

  v13 = [(BuddyEnrollmentCoordinator *)v37 buddyPreferences];
  unsigned __int8 v14 = [(BYPreferencesController *)v13 BOOLForKey:@"RestoreChoice"];

  if (v12) {
    [v23 restartORGOEnrollmentWithServiceURL:v33 anchorCertificates:v32 isPostRestoration:v14 & 1 restartIfFail:0 cleanupIfFail:1 completionHandler:v22];
  }
  else {
    [v23 startORGOEnrollmentFlowWithServiceURL:v33 anchorCertificates:v32 restartIfFail:0 completionHandler:v22];
  }
  [(BuddyEnrollmentCoordinator *)v37 setEnrollmentFlowController:v23];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)profileInstallationDone
{
  id v2 = [(BuddyEnrollmentCoordinator *)self profileInstallationRequestCompleteHandler];

  if (v2)
  {
    id v3 = [(BuddyEnrollmentCoordinator *)self profileInstallationRequestCompleteHandler];
    v4 = [(BuddyEnrollmentCoordinator *)self profileIdentifier];
    (*((void (**)(id, NSString *, void, void))v3 + 2))(v3, v4, 0, 0);
  }
  [(BuddyEnrollmentCoordinator *)self _cacheAuthenticationResults:0];
  [(BuddyEnrollmentCoordinator *)self setProfileInstallationRequestCompleteHandler:0];
}

- (void)discoverAndStoreEnrollmentChannelWithEnrollmentURL:(id)a3 certificateDatas:(id)a4 completionHandler:(id)a5
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v7 = +[MCProfileConnection sharedConnection];
  id v18 = [v7 getMachineInfo];

  id v17 = (id)certificatesFromDERCertificateDataArray();
  id v8 = [(BuddyEnrollmentCoordinator *)v22 servicediscoveryHelper];
  id v9 = location[0];
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1000E37B4;
  unsigned __int8 v14 = &unk_1002B2B38;
  v15 = v22;
  id v16 = v19;
  [(DMCServiceDiscoveryHelper *)v8 determineEnrollmentMethodWithServiceURL:v9 enrollmentType:1 machineInfo:v18 anchorCertificateRefs:v17 completionHandler:&v10];

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)verifyEnrollmentStateWithCompletionHandler:(id)a3
{
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned __int8 v4 = [v3 isStoredProfileInstalled];

  if (v4)
  {
    id v51 = (id)_BYLoggingFacility();
    os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v51;
      os_log_type_t v6 = v50;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Stored profile has been installed already, return.", buf, 2u);
    }
    objc_storeStrong(&v51, 0);
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v48 = 1;
  }
  else
  {
    id v7 = +[MDMCloudConfiguration sharedConfiguration];
    id v8 = [v7 details];
    id v47 = [v8 objectForKeyedSubscript:kCCRemoteManagementAccountIdentifierKey];

    if ([v47 length])
    {
      id v11 = +[ACAccountStore defaultStore];
      id v43 = [v11 dmc_remoteManagementAccountForIdentifier:v47];

      if (v43)
      {
        id v39 = [v43 dmc_bearerToken];
        if ([v39 length])
        {
          os_log_t v35 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = v35;
            os_log_type_t v17 = v34;
            sub_10004B24C(v33);
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cloud config indicates that there's a RMAccount with bearer token.", v33, 2u);
          }
          objc_storeStrong((id *)&v35, 0);
          id v18 = +[MDMCloudConfiguration sharedConfiguration];
          id v32 = [v18 enrollmentServerURL];

          id v19 = +[MCProfileConnection sharedConnection];
          id v31 = [v19 getMachineInfo];

          id v20 = +[MDMCloudConfiguration sharedConfiguration];
          id v30 = [v20 enrollmentAnchorCertificates];

          id v29 = (id)certificatesFromDERCertificateDataArray();
          id v21 = [(BuddyEnrollmentCoordinator *)v53 servicediscoveryHelper];
          uint64_t v54 = MDMBearerAuthTokensToken;
          id v55 = v39;
          id v22 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          id v23 = _NSConcreteStackBlock;
          int v24 = -1073741824;
          int v25 = 0;
          int v26 = sub_1000E3F70;
          v27 = &unk_1002B2B60;
          id v28 = location[0];
          [(DMCServiceDiscoveryHelper *)v21 fetchEnrollmentProfileWithServiceURL:v32 authTokens:v22 enrollmentMethod:1 machineInfo:v31 anchorCertificateRefs:v29 completionHandler:&v23];

          objc_storeStrong(&v28, 0);
          objc_storeStrong(&v29, 0);
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v31, 0);
          objc_storeStrong(&v32, 0);
          int v48 = 0;
        }
        else
        {
          os_log_t v38 = (os_log_t)(id)_BYLoggingFacility();
          char v37 = 16;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v14 = v38;
            os_log_type_t v15 = v37;
            sub_10004B24C(v36);
            _os_log_error_impl((void *)&_mh_execute_header, v14, v15, "No bearer token.", v36, 2u);
          }
          objc_storeStrong((id *)&v38, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
          int v48 = 1;
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        char v41 = 16;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          int v12 = oslog;
          os_log_type_t v13 = v41;
          sub_10004B24C(v40);
          _os_log_error_impl((void *)&_mh_execute_header, v12, v13, "Cloud config has RMAccount id but there's no RM Account locally.", v40, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        int v48 = 1;
      }
      objc_storeStrong(&v43, 0);
    }
    else
    {
      id v46 = (id)_BYLoggingFacility();
      os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v46;
        os_log_type_t v10 = v45;
        sub_10004B24C(v44);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "No RM Account in the cloud config, return.", v44, 2u);
      }
      objc_storeStrong(&v46, 0);
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v48 = 1;
    }
    objc_storeStrong(&v47, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)interruptEnrollment
{
  -[BuddyEnrollmentCoordinator _cacheAuthenticationResults:](self, "_cacheAuthenticationResults:", 0, a2);
  id v2 = [(BuddyEnrollmentCoordinator *)self enrollmentFlowController];
  [(DMCEnrollmentFlowController *)v2 terminateEnrollmentFlow];
}

- (DMCServiceDiscoveryHelper)servicediscoveryHelper
{
  if (!self->_servicediscoveryHelper)
  {
    id v2 = (DMCServiceDiscoveryHelper *)objc_opt_new();
    servicediscoveryHelper = self->_servicediscoveryHelper;
    self->_servicediscoveryHelper = v2;
  }
  unsigned __int8 v4 = self->_servicediscoveryHelper;

  return v4;
}

- (unint64_t)mdmEnrollmentChannel
{
  return self->_mdmEnrollmentChannel;
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  BOOL v25 = a5;
  BOOL v24 = a6;
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  id v22 = [(BuddyEnrollmentCoordinator *)v28 _cachedAuthenticationResults];
  if ([v22 count])
  {
    char v11 = 0;
    if (v24) {
      char v11 = +[DMCFeatureOverrides allowAnyMAIDToSignIn] ^ 1;
    }
    int v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    os_log_type_t v15 = sub_1000E4420;
    id v16 = &unk_1002B2B88;
    id v20 = v23;
    os_log_type_t v17 = v28;
    id v18 = location[0];
    id v19 = v26;
    BOOL v21 = v25;
    +[BuddyAppleIDAuthManager silentAuthenticationWithAuthenticationResults:v22 requiresAppleMAID:v11 & 1 completion:&v12];
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    [(BuddyEnrollmentCoordinator *)v28 _requestInteractiveMAIDAuthenticationWithManagedAppleID:location[0] personaID:v26 ephemeral:v25 completionHandler:v23];
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)_requestInteractiveMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 completionHandler:(id)a6
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  BOOL v19 = a5;
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_1000E4780;
  int v14 = &unk_1002B1758;
  os_log_type_t v15 = v22;
  id v16 = location[0];
  id v17 = v18;
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  id v9 = &_dispatch_main_q;
  os_log_type_t v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_1000E554C;
  int v14 = &unk_1002B2C00;
  os_log_type_t v15 = v23;
  id v16 = location[0];
  id v18 = v19;
  id v17 = v21;
  dispatch_async((dispatch_queue_t)v9, &v10);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)showEnrollmentFailure:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  unsigned __int8 v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000E5F1C;
  id v8 = &unk_1002B0D20;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_cacheAuthenticationResults:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)MDMAuthenticationResultsCacheFilePath();
  if ([location[0] count])
  {
    id v8 = (id)objc_opt_new();
    id v4 = [location[0] objectForKeyedSubscript:AKAuthenticationUsernameKey];
    [v8 setObject:v4 forKeyedSubscript:AKAuthenticationUsernameKey];

    id v5 = [location[0] objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
    [v8 setObject:v5 forKeyedSubscript:AKAuthenticationAlternateDSIDKey];

    id v6 = [location[0] objectForKeyedSubscript:AKAuthenticationIdentityTokenKey];
    [v8 setObject:v6 forKeyedSubscript:AKAuthenticationIdentityTokenKey];

    id v7 = [v8 copy];
    [v7 DMCWriteToBinaryFile:v14];

    DMCSetSkipBackupAttributeToItemAtPath();
    objc_storeStrong(&v8, 0);
    int v9 = 0;
  }
  else
  {
    id v13 = 0;
    id v3 = +[NSFileManager defaultManager];
    id obj = 0;
    [(NSFileManager *)v3 removeItemAtPath:v14 error:&obj];
    objc_storeStrong(&v13, obj);

    if (v13)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_10004BB7C((uint64_t)buf, (uint64_t)v13);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v10, "Failed to remove cached authentication results with error: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    int v9 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_cachedAuthenticationResults
{
  v9[2] = self;
  v9[1] = (id)a2;
  v9[0] = (id)MDMAuthenticationResultsCacheFilePath();
  id v2 = +[NSFileManager defaultManager];
  char v3 = ![(NSFileManager *)v2 fileExistsAtPath:v9[0]];

  if (v3)
  {
    id v10 = 0;
    int v8 = 1;
  }
  else
  {
    id location = +[NSDictionary DMCDictionaryFromFile:v9[0]];
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Cached authentication results: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v10 = location;
    int v8 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v9, 0);
  id v4 = v10;

  return v4;
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
}

- (UIViewController)baseViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setBaseViewController:(id)a3
{
}

- (UINavigationController)navController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavController:(id)a3
{
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
}

- (id)profileInstallationRequestCompleteHandler
{
  return self->_profileInstallationRequestCompleteHandler;
}

- (void)setProfileInstallationRequestCompleteHandler:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void)setServicediscoveryHelper:(id)a3
{
}

- (void)setMdmEnrollmentChannel:(unint64_t)a3
{
  self->_mdmEnrollmentChannel = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end