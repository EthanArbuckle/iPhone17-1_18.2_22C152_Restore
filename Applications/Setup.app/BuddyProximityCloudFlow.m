@interface BuddyProximityCloudFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (BuddyProximityCloudFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (MCProfileConnection)managedConfiguration;
- (ProximitySetupController)proximitySetupController;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setProximitySetupController:(id)a3;
@end

@implementation BuddyProximityCloudFlow

- (BuddyProximityCloudFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v9 = v18;
  id v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyProximityCloudFlow;
  id v18 = [(BuddyProximityCloudFlow *)&v13 initWithNavigationController:location[0] flowDelegate:v16 flowStarter:v15 dependencyInjector:v14];
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v19 count:2];
    [v18 setClassList:v10];
  }
  v11 = (BuddyProximityCloudFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:2];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyProximityCloudFlow *)v38 managedConfiguration];
  unsigned int v4 = [(MCProfileConnection *)v3 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  if (v4 == 2)
  {
    id v36 = (id)_BYLoggingFacility();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v36;
      os_log_type_t v6 = v35;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Skipping proximity sign in, account modification is restricted", buf, 2u);
    }
    objc_storeStrong(&v36, 0);
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v33 = 1;
  }
  else
  {
    v7 = [(BuddyProximityCloudFlow *)v38 networkProvider];
    char v8 = ![(BuddyNetworkProvider *)v7 networkReachable];

    if (v8)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = oslog;
        os_log_type_t v10 = v31;
        sub_10004B24C(v30);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Skipping proximity sign in, network is not reachable", v30, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v33 = 1;
    }
    else
    {
      v11 = [(BuddyProximityCloudFlow *)v38 proximitySetupController];
      v12 = [(ProximitySetupController *)v11 information];
      id v13 = [(SASProximityInformation *)v12 appleID];
      BOOL v14 = v13 != 0;

      BOOL v29 = v14;
      id v15 = [(BuddyProximityCloudFlow *)v38 proximitySetupController];
      LOBYTE(v12) = [(ProximitySetupController *)v15 hasConnection];

      char v28 = v12 & 1;
      id v16 = +[ACAccountStore defaultStore];
      id v17 = [v16 aa_primaryAppleAccount];
      LOBYTE(v12) = v17 != 0;

      char v27 = v12 & 1;
      char v26 = 0;
      char v18 = 0;
      if (v14)
      {
        char v18 = 0;
        if (v28) {
          char v18 = v27 ^ 1;
        }
      }
      char v26 = v18 & 1;
      if (v18)
      {
        v19 = [(BuddyProximityCloudFlow *)v38 miscState];
        id v25 = [(BuddyMiscState *)v19 migrationManager];

        if (([v25 requiresUpdateToMigrate] & 1) != 0
          && ([v25 willMigrate] & 1) != 0)
        {
          os_log_t v24 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v24;
            os_log_type_t v21 = v23;
            sub_10004B24C(v22);
            _os_log_impl((void *)&_mh_execute_header, v20, v21, "Skipping proximity sign in, update required to migrate", (uint8_t *)v22, 2u);
          }
          objc_storeStrong((id *)&v24, 0);
          char v26 = 0;
        }
        objc_storeStrong(&v25, 0);
      }
      (*((void (**)(id, void))location[0] + 2))(location[0], v26 & 1);
      int v33 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end