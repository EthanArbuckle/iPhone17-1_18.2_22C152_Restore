@interface BuddyCloudConfigController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (Class)disclosureViewControllerClass;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)initialize;
- (BFFFlowItemDelegate)delegate;
- (BOOL)shouldAllowStartOver;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddyCloudConfigDisclosureViewController)disclosureViewController;
- (BuddyCloudConfigLoginViewController)loginViewController;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (BuddyNetworkProvider)networkProvider;
- (BuddyPendingRestoreState)pendingRestoreState;
- (MCProfileConnection)managedConfiguration;
- (NSMutableArray)controllersToRemove;
- (UINavigationController)navController;
- (id)view;
- (id)viewController;
- (int)cloudConfigState;
- (void)_completeCloudConfig;
- (void)_suggestSoftwareUpdateWithOSVersion:(id)a3 buildVersion:(id)a4 navigationController:(id)a5;
- (void)_suggestSoftwareUpdateWithSoftwareUpdateRequiredError:(id)a3 navigationController:(id)a4;
- (void)cloudConfigDidFinishFromViewController:(id)a3 wasApplied:(BOOL)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)removeControllersToRemove;
- (void)removeViewControllers:(id)a3 fromNavHierarchyOf:(id)a4;
- (void)setCloudConfigState:(int)a3;
- (void)setControllersToRemove:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureViewController:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setLoginViewController:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNavController:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)startOver;
- (void)transitionToDisclosureViewFromController:(id)a3;
- (void)transitionToErrorViewInDisclosureViewControllerFromController:(id)a3 lastError:(id)a4;
- (void)transitionToLoginViewControllerFromController:(id)a3 lastError:(id)a4;
- (void)transitionToSoftwareUpdateControllerFromController:(id)a3 lastError:(id)a4;
@end

@implementation BuddyCloudConfigController

+ (void)initialize
{
  if (BFFIsiPad()) {
    qword_100321F00 = 0x404C800000000000;
  }
  else {
    qword_100321F00 = 18.0;
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyCloudConfigController *)v21 pendingRestoreState];
  v4 = [(BuddyPendingRestoreState *)v3 backupItem];
  BOOL v5 = v4 != 0;

  BOOL v19 = v5;
  if (v5)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      os_log_type_t v7 = v17;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Skipping cloud configuration due to pending restore", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  }
  else
  {
    v8 = dispatch_get_global_queue(25, 0);
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_1001D0900;
    v13 = &unk_1002B0CD0;
    v14 = v21;
    id v15 = location[0];
    dispatch_async(v8, &v9);

    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)startOver
{
  v2 = [(BuddyCloudConfigController *)self enrollmentCoordinator];
  [(BuddyEnrollmentCoordinator *)v2 interruptEnrollment];
}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (void)removeViewControllers:(id)a3 fromNavHierarchyOf:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = [v13 viewControllers];
  id v12 = [v5 mutableCopy];

  memset(__b, 0, sizeof(__b));
  id v6 = location[0];
  id v7 = [v6 countByEnumeratingWithState:__b objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(__b[1] + 8 * i);
        [v12 removeObject:v11];
      }
      id v7 = [v6 countByEnumeratingWithState:__b objects:v15 count:16];
    }
    while (v7);
  }

  [v13 setViewControllers:v12 animated:0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)setDelegate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  objc_storeStrong(location, 0);
}

- (int)cloudConfigState
{
  return self->_cloudConfigState;
}

- (BuddyCloudConfigDisclosureViewController)disclosureViewController
{
  if (!self->_disclosureViewController)
  {
    v2 = objc_alloc_init(BuddyCloudConfigDisclosureViewController);
    disclosureViewController = self->_disclosureViewController;
    self->_disclosureViewController = v2;

    -[BuddyCloudConfigDisclosureViewController setConfigController:](self->_disclosureViewController, "setConfigController:", self, a2);
    v4 = [(BuddyCloudConfigController *)self enrollmentCoordinator];
    [(BuddyCloudConfigDisclosureViewController *)self->_disclosureViewController setEnrollmentCoordinator:v4];

    id v5 = [(BuddyCloudConfigController *)self managedConfiguration];
    [(BuddyCloudConfigDisclosureViewController *)self->_disclosureViewController setManagedConfiguration:v5];

    id v6 = [(BuddyCloudConfigController *)self networkProvider];
    [(BuddyCloudConfigDisclosureViewController *)self->_disclosureViewController setNetworkProvider:v6];

    id v7 = [(BuddyCloudConfigController *)self delegate];
    [(BuddyWelcomeController *)self->_disclosureViewController setDelegate:v7];
  }
  uint64_t v8 = self->_disclosureViewController;

  return v8;
}

- (BuddyCloudConfigLoginViewController)loginViewController
{
  if (!self->_loginViewController)
  {
    v2 = objc_alloc_init(BuddyCloudConfigLoginViewController);
    loginViewController = self->_loginViewController;
    self->_loginViewController = v2;

    -[BuddyCloudConfigLoginViewController setConfigController:](self->_loginViewController, "setConfigController:", self, a2);
    v4 = [(BuddyCloudConfigController *)self managedConfiguration];
    [(BuddyCloudConfigLoginViewController *)self->_loginViewController setManagedConfiguration:v4];
  }
  id v5 = self->_loginViewController;

  return v5;
}

- (id)viewController
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  unsigned int v2 = [(BuddyCloudConfigController *)self cloudConfigState];
  if (v2 < 2) {
    goto LABEL_6;
  }
  if (v2 == 2) {
    goto LABEL_8;
  }
  if (v2 - 3 < 2)
  {
LABEL_6:
    v3 = [(BuddyCloudConfigController *)v10 disclosureViewController];
    id v4 = location[0];
    location[0] = v3;

    goto LABEL_8;
  }
  if (v2 == 6)
  {
    id v5 = [(BuddyCloudConfigController *)v10 loginViewController];
    id v6 = location[0];
    location[0] = v5;
  }
LABEL_8:
  id v7 = location[0];
  objc_storeStrong(location, 0);
  return v7;
}

- (id)view
{
  id v2 = [(BuddyCloudConfigController *)self viewController];
  id v3 = [v2 view];

  return v3;
}

- (NSMutableArray)controllersToRemove
{
  if (!self->_controllersToRemove)
  {
    id v2 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controllersToRemove = self->_controllersToRemove;
    self->_controllersToRemove = v2;
  }
  id v4 = self->_controllersToRemove;

  return v4;
}

- (void)_completeCloudConfig
{
  int v10 = self;
  location[1] = (id)a2;
  [(BuddyCloudConfigController *)self setCloudConfigState:8];
  location[0] = +[NSMutableArray array];
  id v2 = [(BuddyCloudConfigController *)v10 disclosureViewController];

  if (v2)
  {
    id v3 = [(BuddyCloudConfigController *)v10 disclosureViewController];
    [location[0] addObject:v3];

    id v4 = [(BuddyCloudConfigController *)v10 disclosureViewController];
    [(BuddyCloudConfigDisclosureViewController *)v4 setConfigController:0];
  }
  id v5 = [(BuddyCloudConfigController *)v10 loginViewController];

  if (v5)
  {
    id v6 = [(BuddyCloudConfigController *)v10 loginViewController];
    [location[0] addObject:v6];
  }
  id v7 = [(BuddyCloudConfigController *)v10 delegate];
  [(BFFFlowItemDelegate *)v7 removeViewControllersOnNextPush:location[0]];

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  [WeakRetained flowItemDone:v10];

  objc_storeStrong(location, 0);
}

- (void)cloudConfigDidFinishFromViewController:(id)a3 wasApplied:(BOOL)a4
{
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Completed cloud configuration. Was applied: %d", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v15)
  {
    id v5 = [(BuddyCloudConfigController *)v17 managedConfiguration];
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_1001D1618;
    int v10 = &unk_1002B4948;
    id v11 = location[0];
    id v12 = v17;
    [(MCProfileConnection *)v5 cloudConfigurationUIDidCompleteWasApplied:1 completionHandler:&v6];

    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    [(BuddyCloudConfigController *)v17 _completeCloudConfig];
  }
  objc_storeStrong(location, 0);
}

- (void)transitionToDisclosureViewFromController:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v20;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Showing disclosure view controller.", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigController *)v23 setCloudConfigState:0];
  id v5 = [location[0] navigationController];
  id v6 = [v5 viewControllers];
  id v18 = [v6 mutableCopy];

  if ([v18 count])
  {
    id v7 = [v18 lastObject];
    id v8 = location[0];

    if (v7 == v8)
    {
      v9 = [(BuddyCloudConfigController *)v23 disclosureViewController];
      [v18 insertObject:v9 atIndex:[v18 count] - 1];

      id v10 = [location[0] navigationController];
      [v10 setViewControllers:v18];

      id v11 = (NSMutableArray *)[location[0] navigationController];
      id v12 = [(BuddyCloudConfigController *)v23 disclosureViewController];
      id v13 = [(NSMutableArray *)v11 popToViewController:v12 animated:1];
    }
    else
    {
      id v14 = [location[0] navigationController];
      BOOL v15 = [(BuddyCloudConfigController *)v23 disclosureViewController];
      [v14 pushViewController:v15 animated:0];

      id v11 = [(BuddyCloudConfigController *)v23 controllersToRemove];
      [(NSMutableArray *)v11 addObject:location[0]];
    }
  }
  else
  {
    id v16 = [location[0] navigationController];
    os_log_type_t v17 = [(BuddyCloudConfigController *)v23 disclosureViewController];
    [v16 pushViewController:v17 animated:0];
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToErrorViewInDisclosureViewControllerFromController:(id)a3 lastError:(id)a4
{
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = oslog;
    os_log_type_t v6 = v13;
    sub_10004B24C(v12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Showing disclosure view controller to show error.", (uint8_t *)v12, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigController *)v17 setCloudConfigState:5];
  id v7 = [(BuddyCloudConfigController *)v17 controllersToRemove];
  [(NSMutableArray *)v7 addObject:location[0]];

  id v8 = v15;
  v9 = [(BuddyCloudConfigController *)v17 disclosureViewController];
  [(BuddyCloudConfigDisclosureViewController *)v9 setLastRetrievalError:v8];

  id v10 = [location[0] navigationController];
  id v11 = [(BuddyCloudConfigController *)v17 disclosureViewController];
  [v10 pushViewController:v11 animated:0];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToLoginViewControllerFromController:(id)a3 lastError:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = oslog;
    os_log_type_t v6 = v14;
    sub_10004B24C(v13);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Showing login view contoller.", (uint8_t *)v13, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigController *)v18 setCloudConfigState:6];
  id v7 = [(BuddyCloudConfigController *)v18 controllersToRemove];
  [(NSMutableArray *)v7 addObject:location[0]];

  id v8 = [(BuddyCloudConfigController *)v18 loginViewController];
  [(BuddyCloudConfigLoginViewController *)v8 clearInput];

  id v9 = v16;
  id v10 = [(BuddyCloudConfigController *)v18 loginViewController];
  [(BuddyCloudConfigLoginViewController *)v10 setLastError:v9];

  id v11 = [location[0] navigationController];
  id v12 = [(BuddyCloudConfigController *)v18 loginViewController];
  [v11 pushViewController:v12 animated:1];

  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToSoftwareUpdateControllerFromController:(id)a3 lastError:(id)a4
{
  os_log_type_t v17 = self;
  SEL v16 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  if (!sub_1001D2104(obj))
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v5 handleFailureInMethod:v16 object:v17 file:@"BuddyCloudConfigController.m" lineNumber:391 description:@"This method should only be called with a Software Update error."];
  }
  [(BuddyCloudConfigController *)v17 setCloudConfigState:3];
  os_log_type_t v6 = (BuddyCloudConfigDisclosureViewController *)location;
  id v7 = [(BuddyCloudConfigController *)v17 disclosureViewController];

  if (v6 != v7)
  {
    id v8 = [(BuddyCloudConfigController *)v17 controllersToRemove];
    [(NSMutableArray *)v8 addObject:location];

    id v9 = [location navigationController];
    id v10 = [(BuddyCloudConfigController *)v17 disclosureViewController];
    [v9 pushViewController:v10 animated:0];
  }
  id v11 = v17;
  id v12 = obj;
  os_log_type_t v13 = [(BuddyCloudConfigController *)v17 navController];
  [(BuddyCloudConfigController *)v11 _suggestSoftwareUpdateWithSoftwareUpdateRequiredError:v12 navigationController:v13];

  objc_storeStrong(&obj, 0);
  objc_storeStrong(&location, 0);
}

- (void)removeControllersToRemove
{
  id v3 = [(BuddyCloudConfigController *)self controllersToRemove];
  os_log_type_t v4 = [(BuddyCloudConfigController *)self navController];
  [(BuddyCloudConfigController *)self removeViewControllers:v3 fromNavHierarchyOf:v4];

  id v5 = [(BuddyCloudConfigController *)self controllersToRemove];
  [(NSMutableArray *)v5 removeAllObjects];
}

+ (Class)disclosureViewControllerClass
{
  return (Class)objc_opt_class();
}

- (void)_suggestSoftwareUpdateWithSoftwareUpdateRequiredError:(id)a3 navigationController:(id)a4
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v5 = [location[0] userInfo];
  id v6 = [v5 objectForKeyedSubscript:kDMCErrorDetailsSUInfoKey];
  id v24 = [v6 objectForKeyedSubscript:@"OSVersion"];

  id v7 = [location[0] userInfo];
  id v8 = [v7 objectForKeyedSubscript:kDMCErrorDetailsSUInfoKey];
  id v23 = [v8 objectForKeyedSubscript:@"BuildVersion"];

  id v9 = [location[0] userInfo];
  id v10 = [v9 objectForKeyedSubscript:kDMCErrorDetailsSUInfoKey];
  id v22 = [v10 objectForKeyedSubscript:@"RequireBetaProgram"];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v22);
    _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Required Beta Program: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v22)
  {
    id v11 = [v22 objectForKeyedSubscript:@"Token"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = sub_1001D25D4();
      id v14 = [v22 objectForKeyedSubscript:@"Token"];
      [v13 enrollInProgramWithMDMToken:v14 completion:&stru_1002B4968];
    }
    else
    {
      os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
      char v18 = 17;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v15 = v19;
        os_log_type_t v16 = v18;
        sub_10004B24C(v17);
        _os_log_fault_impl((void *)&_mh_execute_header, v15, v16, "Required Beta Program but no valid token provided, skipping beta enrollment", (uint8_t *)v17, 2u);
      }
      objc_storeStrong((id *)&v19, 0);
    }
  }
  [(BuddyCloudConfigController *)v27 _suggestSoftwareUpdateWithOSVersion:v24 buildVersion:v23 navigationController:v25];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)_suggestSoftwareUpdateWithOSVersion:(id)a3 buildVersion:(id)a4 navigationController:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = objc_alloc_init((Class)SUScanOptions);
  [v10 setForced:1];
  [v10 setIdentifier:@"com.apple.purplebuddy.software_update"];
  [v10 setRequestedPMV:location[0]];
  [v10 setRequestedBuild:v12];
  id v9 = objc_alloc_init(BuddyMandatoryUpdateController);
  [v9 setMdmUpdateOptions:v10];
  id v7 = [(BuddyCloudConfigController *)v14 networkProvider];
  [v9 setNetworkProvider:v7];

  id v8 = [(BuddyCloudConfigController *)v14 delegate];
  [v9 setDelegate:v8];

  [v11 pushViewController:v9 animated:1];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (UINavigationController)navController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavController:(id)a3
{
}

- (void)setDisclosureViewController:(id)a3
{
}

- (void)setLoginViewController:(id)a3
{
}

- (void)setCloudConfigState:(int)a3
{
  self->_cloudConfigState = a3;
}

- (void)setControllersToRemove:(id)a3
{
}

- (void).cxx_destruct
{
}

@end