@interface BuddyProximityCloudDependentFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
- (BOOL)controllerNeedsToRun;
- (BOOL)presentedPasscodeFlow;
- (BOOL)responsibleForViewController:(id)a3;
- (BuddyAppleIDSignInTask)signInTask;
- (BuddyFeatureFlags)featureFlags;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (BuddyProximityCloudDependentFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (MCProfileConnection)managedConfiguration;
- (ProximitySetupController)proximitySetupController;
- (UIViewController)viewController;
- (id)passcodeFlowCompletion;
- (void)_endFlowPrematurely;
- (void)_flowItemDone;
- (void)_updateClassListWithPasscodeShownInitially:(BOOL)a3;
- (void)configureFlowItem:(id)a3;
- (void)connectionTerminated;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)proximitySetupCompletedWithResult:(id)a3;
- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4;
- (void)proximitySetupSelectedAccountType:(int64_t)a3;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5;
- (void)setFeatureFlags:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPasscodeFlowCompletion:(id)a3;
- (void)setPresentedPasscodeFlow:(BOOL)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSignInTask:(id)a3;
- (void)setViewController:(id)a3;
- (void)setupPasscodeAndBiometricWithCompletion:(id)a3;
- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4;
@end

@implementation BuddyProximityCloudDependentFlow

- (BuddyProximityCloudDependentFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v9 = v17;
  id v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyProximityCloudDependentFlow;
  id v17 = [(BuddyProximityCloudDependentFlow *)&v12 initWithNavigationController:location[0] flowDelegate:v15 flowStarter:v14 dependencyInjector:v13];
  objc_storeStrong(&v17, v17);
  if (v17) {
    [v17 _updateClassListWithPasscodeShownInitially:0];
  }
  v10 = (BuddyProximityCloudDependentFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (void)configureFlowItem:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = location[0];
    v3 = [(BuddyProximityCloudDependentFlow *)v7 viewController];
    [v5 setViewController:v3];

    objc_storeStrong(&v5, 0);
  }
  v4.receiver = v7;
  v4.super_class = (Class)BuddyProximityCloudDependentFlow;
  [(BuddyProximityCloudDependentFlow *)&v4 configureFlowItem:location[0]];
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (BOOL)controllerNeedsToRun
{
  v24 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyProximityCloudDependentFlow *)self managedConfiguration];
  unsigned int v3 = [(MCProfileConnection *)v2 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  if (v3 == 2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = oslog[0];
      os_log_type_t v5 = v22;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Skipping proximity sign in, account modification is restricted", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    v6 = [(BuddyProximityCloudDependentFlow *)v24 networkProvider];
    char v7 = ![(BuddyNetworkProvider *)v6 networkReachable];

    if (v7)
    {
      os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v20;
        os_log_type_t v9 = v19;
        sub_10004B24C(v18);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping proximity sign in, network is not reachable", (uint8_t *)v18, 2u);
      }
      objc_storeStrong((id *)&v20, 0);
      return 0;
    }
    else
    {
      v10 = [(BuddyProximityCloudDependentFlow *)v24 proximitySetupController];
      char v11 = ![(ProximitySetupController *)v10 hasConnection];

      if (v11)
      {
        return 0;
      }
      else
      {
        objc_super v12 = [(BuddyProximityCloudDependentFlow *)v24 proximitySetupController];
        id v13 = [(ProximitySetupController *)v12 dependentController];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          return 0;
        }
        else
        {
          id v15 = +[ACAccountStore defaultStore];
          id v16 = [v15 aa_primaryAppleAccount];

          return v16 == 0;
        }
      }
    }
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  objc_super v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v3 = [(BuddyProximityCloudDependentFlow *)v12 proximitySetupController];
  objc_super v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_10018E350;
  v8 = &unk_1002B1668;
  os_log_type_t v9 = v12;
  id v10 = location[0];
  [(ProximitySetupController *)v3 waitForIntent:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)responsibleForViewController:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityCloudDependentFlow *)v23 controllers];
  id v4 = [v3 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_22;
  }
  id v6 = [(BuddyProximityCloudDependentFlow *)v23 controllers];
  id v21 = [v6 lastObject];

  memset(__b, 0, sizeof(__b));
  id v7 = [v21 controllers];
  id v8 = [v7 countByEnumeratingWithState:__b objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v8; ++i)
      {
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(v7);
        }
        id v20 = *(id *)(__b[1] + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v20 == location[0])
        {
          char v24 = 1;
          int v18 = 1;
          goto LABEL_19;
        }
        char v16 = 0;
        BOOL v11 = 0;
        if (objc_opt_respondsToSelector())
        {
          id v17 = [v20 viewController];
          char v16 = 1;
          BOOL v11 = v17 == location[0];
        }
        if (v16) {

        }
        if (v11)
        {
          char v24 = 1;
          int v18 = 1;
          goto LABEL_19;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:__b objects:v25 count:16];
    }
    while (v8);
  }
  int v18 = 0;
LABEL_19:

  if (!v18) {
    int v18 = 0;
  }
  objc_storeStrong(&v21, 0);
  if (!v18)
  {
LABEL_22:
    objc_super v12 = [(BuddyProximityCloudDependentFlow *)v23 viewController];
    id v13 = (UIViewController *)location[0];

    if (v12 == v13)
    {
      char v24 = 1;
    }
    else
    {
      v15.receiver = v23;
      v15.super_class = (Class)BuddyProximityCloudDependentFlow;
      char v24 = [(BuddyProximityCloudDependentFlow *)&v15 responsibleForViewController:location[0]];
    }
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (void)_updateClassListWithPasscodeShownInitially:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (!v5) {
    [v4 addObject:objc_opt_class()];
  }
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  id v3 = +[NSArray arrayWithObjects:v8 count:3];
  [v4 addObjectsFromArray:v3];

  [(BuddyProximityCloudDependentFlow *)v7 setClassList:v4];
  objc_storeStrong(&v4, 0);
}

- (void)_flowItemDone
{
  char v16 = self;
  v15[1] = (id)a2;
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  v15[0] = [(BuddyProximityCloudDependentFlow *)v16 navigationController];
  id v3 = [v15[0] viewControllers];
  id v4 = [(BuddyProximityCloudDependentFlow *)v16 viewController];
  BOOL v5 = [v3 indexOfObject:v4];

  BOOL v14 = v5;
  id v6 = [v15[0] viewControllers];
  id v7 = v5;
  id v8 = [v15[0] viewControllers];
  id v18 = v7;
  id v17 = (char *)((unsigned char *)[v8 count] - v14);
  id v19 = v7;
  id v20 = v17;
  uint64_t v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v17);
  id location = [v6 objectsAtIndexes:v9];

  id v10 = [(BuddyProximityCloudDependentFlow *)v16 navigationFlowDelegate];
  [v10 removeViewControllersOnNextPush:location];

  BOOL v11 = [(BuddyProximityCloudDependentFlow *)v16 proximitySetupController];
  [(ProximitySetupController *)v11 removeObserver:v16];

  id v12 = [(BuddyProximityCloudDependentFlow *)v16 flowItemDelegate];
  [v12 flowItemDone:v16];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)_endFlowPrematurely
{
  char v16 = self;
  v15[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10018EE2C;
  BOOL v14 = &unk_1002B0D20;
  v15[0] = v16;
  dispatch_async(v2, &block);

  id v3 = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10018EE7C;
  id v8 = &unk_1002B0D20;
  uint64_t v9 = v16;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(v15, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v19 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = location[0];
    id v5 = [(BuddyProximityCloudDependentFlow *)v21 passcodeFlowCompletion];

    if (v5)
    {
      int v6 = [(BuddyProximityCloudDependentFlow *)v21 miscState];
      [(BuddyMiscState *)v6 setHasPresentedPasscodeFlow:1];

      id v7 = [(BuddyProximityCloudDependentFlow *)v21 proximitySetupController];
      unsigned __int8 v8 = [(ProximitySetupController *)v7 hasConnection];

      if (v8)
      {
        uint64_t v9 = v21;
        id v10 = [v18 viewControllers];
        [(BuddyProximityCloudDependentFlow *)v9 removeViewControllersOnNextPush:v10];

        int v11 = (void (**)(id, uint64_t))[(BuddyProximityCloudDependentFlow *)v21 passcodeFlowCompletion];
        v11[2](v11, 1);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = oslog;
          os_log_type_t v13 = v16;
          sub_10004B24C(buf);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Prematurely ending dependent flow after passcode/biometrics due to loss of proximity connection", buf, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        [(BuddyProximityCloudDependentFlow *)v21 _endFlowPrematurely];
      }
      [(BuddyProximityCloudDependentFlow *)v21 setPasscodeFlowCompletion:0];
    }
    objc_storeStrong(&v18, 0);
  }
  v14.receiver = v21;
  v14.super_class = (Class)BuddyProximityCloudDependentFlow;
  [(BuddyProximityCloudDependentFlow *)&v14 flowItemDone:location[0] nextItemClass:v19];
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  Class v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  BOOL v16 = a5;
  objc_opt_class();
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v15 = [(BuddyProximityCloudDependentFlow *)v19 navigationController];
    char v14 = 1;
    id v13 = [v15 topViewController];
    char v12 = 1;
    id v11 = [(BuddyProximityCloudDependentFlow *)v19 viewController];
    char v10 = 1;
    BOOL v7 = v13 == v11;
  }
  if (v10) {

  }
  if (v12) {
  if (v14)
  }

  if (v7)
  {
    int v9 = 1;
  }
  else
  {
    v8.receiver = v19;
    v8.super_class = (Class)BuddyProximityCloudDependentFlow;
    [(BuddyProximityCloudDependentFlow *)&v8 pushFlowItem:location[0] inFlow:v17 animated:v16];
    int v9 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_10018F36C;
  objc_super v8 = &unk_1002B0CD0;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] error];

  if (v3)
  {
    id v51 = (id)_BYLoggingFacility();
    os_log_type_t v50 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
    {
      id v4 = [location[0] accountType];
      char v48 = 0;
      char v46 = 0;
      char v44 = 0;
      char v42 = 0;
      char v40 = 0;
      char v38 = 0;
      if (_BYIsInternalInstall())
      {
        int v5 = (NSString *)[location[0] error];
        v49 = v5;
        char v48 = 1;
      }
      else
      {
        id v47 = [location[0] error];
        char v46 = 1;
        if (v47)
        {
          id v45 = [location[0] error];
          char v44 = 1;
          id v43 = [v45 domain];
          char v42 = 1;
          id v41 = [location[0] error];
          char v40 = 1;
          int v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v43, [v41 code]);
          id v39 = v5;
          char v38 = 1;
        }
        else
        {
          int v5 = 0;
        }
      }
      sub_10007D958((uint64_t)buf, (uint64_t)v4, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v51, v50, "Sign-in failed for account type (%ld): %{public}@", buf, 0x16u);
      if (v38) {

      }
      if (v40) {
      if (v42)
      }

      if (v44) {
      if (v46)
      }

      if (v48) {
    }
      }
    objc_storeStrong(&v51, 0);
    int v6 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v33 = -1073741824;
    int v34 = 0;
    v35 = sub_10018FDC4;
    v36 = &unk_1002B0D20;
    v37 = v53;
    dispatch_async(v6, &block);

    objc_storeStrong((id *)&v37, 0);
  }
  else
  {
    BOOL v7 = (char *)[location[0] accountType];
    if (v7)
    {
      if ((unint64_t)(v7 - 1) < 2)
      {
        os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          sub_100046588((uint64_t)v54, (uint64_t)[location[0] accountType]);
          _os_log_impl((void *)&_mh_execute_header, v22, v21, "Sign-in unnecessary for account type (%ld)", v54, 0xCu);
        }
        objc_storeStrong((id *)&v22, 0);
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v8 = oslog;
        os_log_type_t v9 = v30;
        sub_10004B24C(v29);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Sign-in succeeded!", v29, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v10 = +[BFFAppleAccountInfo primaryAccountInfo];
      id v11 = [location[0] authResults];
      [v10 updateWithAuthenticationResults:v11];

      char v12 = [(BuddyProximityCloudDependentFlow *)v53 proximitySetupController];
      [(ProximitySetupController *)v12 setSignedIniCloudAccount:1];

      id v13 = dispatch_get_global_queue(0, 0);
      v23 = _NSConcreteStackBlock;
      int v24 = -1073741824;
      int v25 = 0;
      v26 = sub_10018FE14;
      v27 = &unk_1002B0D20;
      v28 = v53;
      dispatch_async(v13, &v23);

      objc_storeStrong((id *)&v28, 0);
    }
  }
  char v14 = &_dispatch_main_q;
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_10018FE64;
  Class v19 = &unk_1002B0D20;
  id v20 = v53;
  dispatch_async((dispatch_queue_t)v14, &v15);

  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupSelectedAccountType:(int64_t)a3
{
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
  v4[3]  = self;
  v4[2]  = (id)a2;
  v4[1]  = (id)a3;
  v4[0]  = 0;
  objc_storeStrong(v4, a4);
  objc_storeStrong(v4, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  int v24 = self;
  location[1]  = (id)a2;
  location[0]  = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  int v5 = [BuddyAppleIDSignInTask alloc];
  int v6 = [(BuddyProximityCloudDependentFlow *)v24 featureFlags];
  id v7 = +[BuddyAccountTools sharedBuddyAccountTools];
  objc_super v8 = [(BuddyAppleIDSignInTask *)v5 initWithFeatureFlags:v6 accountTools:v7];
  [(BuddyProximityCloudDependentFlow *)v24 setSignInTask:v8];

  id v9 = [(BuddyProximityCloudDependentFlow *)v24 navigationController];
  id v10 = [(BuddyProximityCloudDependentFlow *)v24 signInTask];
  [(BuddyAppleIDSignInTask *)v10 setNavigationController:v9];

  id v11 = [(BuddyProximityCloudDependentFlow *)v24 signInTask];
  [(BuddyAppleIDSignInTask *)v11 setEnableFindMy:0];

  char v12 = [(BuddyProximityCloudDependentFlow *)v24 signInTask];
  [(BuddyAppleIDSignInTask *)v12 setRestoreFromBackupMode:1];

  id v13 = [(BuddyProximityCloudDependentFlow *)v24 signInTask];
  id v14 = location[0];
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_100190134;
  Class v19 = &unk_1002B37C8;
  id v20 = v24;
  id v21 = v22;
  [(BuddyAppleIDSignInTask *)v13 signInToAllServicesWithAuthenticationResults:v14 completion:&v15];

  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  id v9 = self;
  v8[1]  = (id)a2;
  v2  = &_dispatch_main_q;
  block  = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_100190320;
  id v7 = &unk_1002B0D20;
  v8[0]  = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (id)passcodeFlowCompletion
{
  return self->_passcodeFlowCompletion;
}

- (void)setPasscodeFlowCompletion:(id)a3
{
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
}

- (BOOL)presentedPasscodeFlow
{
  return self->_presentedPasscodeFlow;
}

- (void)setPresentedPasscodeFlow:(BOOL)a3
{
  self->_presentedPasscodeFlow  = a3;
}

- (void).cxx_destruct
{
}

@end