@interface BuddyDemoController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (BYDeviceConfiguration)deviceConfiguration;
- (BYRunState)runState;
- (BuddyActivationRecord)activationRecord;
- (BuddyMiscState)miscState;
- (MCProfileConnection)managedConfiguration;
- (MSDWelcomeViewController)demoViewController;
- (id)exitBuddyForDemoSetUpBlock;
- (id)viewController;
- (void)_setupCompleted:(BOOL)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setActivationRecord:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDemoViewController:(id)a3;
- (void)setDeviceConfiguration:(id)a3;
- (void)setExitBuddyForDemoSetUpBlock:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setRunState:(id)a3;
@end

@implementation BuddyDemoController

- (void)_setupCompleted:(BOOL)a3
{
  v35 = self;
  SEL v34 = a2;
  BOOL v33 = a3;
  if (a3)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      os_log_type_t v4 = v31;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Demo setup completed", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v5 = [(BuddyDemoController *)v35 activationRecord];
    char v28 = 0;
    unsigned __int8 v6 = 1;
    if (![(BuddyActivationRecord *)v5 impliesEarlyExit])
    {
      id v29 = [(BuddyDemoController *)v35 deviceConfiguration];
      char v28 = 1;
      unsigned __int8 v6 = [v29 inStoreDemoMode];
    }
    if (v28) {

    }
    if (v6)
    {
      v7 = (void (**)(void))[(BuddyDemoController *)v35 exitBuddyForDemoSetUpBlock];
      v7[2](v7);

      return;
    }
  }
  else
  {
    os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
    char v26 = 16;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v8 = v27;
      os_log_type_t v9 = v26;
      sub_10004B24C(v25);
      _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "Demo setup failed!", v25, 2u);
    }
    objc_storeStrong((id *)&v27, 0);
  }
  v10 = [(BuddyDemoController *)v35 miscState];
  [(BuddyMiscState *)v10 setCompletedDemoSetup:1];

  v11 = [(BuddyDemoController *)v35 demoViewController];
  id v24 = [(MSDWelcomeViewController *)v11 navigationController];

  id v12 = [v24 viewControllers];
  v13 = [(BuddyDemoController *)v35 demoViewController];
  v14 = [v12 indexOfObject:v13];

  v23 = v14;
  id v15 = [v24 viewControllers];
  id v16 = v14;
  id v17 = [v24 viewControllers];
  v18 = (char *)[v17 count];
  id v37 = v16;
  v36 = (char *)(v18 - v23);
  id v38 = v16;
  v39 = (char *)(v18 - v23);
  v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v16, v18 - v23);
  id location = [v15 objectsAtIndexes:v19];

  v20 = [(BuddyDemoController *)v35 delegate];
  [(BFFFlowItemDelegate *)v20 removeViewControllersOnNextPush:location];

  v21 = [(BuddyDemoController *)v35 delegate];
  [(BFFFlowItemDelegate *)v21 flowItemDone:v35];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v24, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  v30 = self;
  SEL v29 = a2;
  v2 = [(BuddyDemoController *)self runState];
  char v3 = 0;
  if ([(BYRunState *)v2 hasCompletedInitialRun]) {
    char v3 = BYIsRunningInStoreDemoMode() ^ 1;
  }

  if (v3) {
    return 0;
  }
  char v28 = 0;
  os_log_type_t v4 = [(BuddyDemoController *)v30 deviceConfiguration];
  char v26 = 0;
  unsigned __int8 v5 = 1;
  if (([(BYDeviceConfiguration *)v4 inStoreDemoMode] & 1) == 0)
  {
    id v27 = [(BuddyDemoController *)v30 activationRecord];
    char v26 = 1;
    unsigned __int8 v5 = [v27 impliesDemod];
  }
  if (v26) {

  }
  char v28 = v5 & 1;
  if (v5)
  {
    v8 = [(BuddyDemoController *)v30 managedConfiguration];
    unsigned __int8 v9 = [(MCProfileConnection *)v8 activationRecordIndicatesCloudConfigurationIsAvailable];

    if (v9)
    {
      os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v22;
        os_log_type_t v11 = v21;
        sub_10004B24C(v20);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Skipping demo setup due to cloud configuration", v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
      return 0;
    }
    else
    {
      id v12 = [(BuddyDemoController *)v30 miscState];
      unsigned __int8 v13 = [(BuddyMiscState *)v12 completedDemoSetup];

      if (v13)
      {
        os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v19;
          os_log_type_t v15 = v18;
          sub_10004B24C(v17);
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Skipping demo setup because it has completed", (uint8_t *)v17, 2u);
        }
        objc_storeStrong((id *)&v19, 0);
        return 0;
      }
      else
      {
        return 1;
      }
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = oslog;
      os_log_type_t v7 = v24;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Skipping demo setup because this isn't a demo device", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [sub_100159170() needsToRun:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (id)viewController
{
  v14 = self;
  location[1] = (id)a2;
  v2 = [(BuddyDemoController *)self demoViewController];

  if (v2)
  {
    os_log_type_t v15 = [(BuddyDemoController *)v14 demoViewController];
  }
  else
  {
    objc_initWeak(location, v14);
    id v3 = objc_alloc_init((Class)sub_100159170());
    [(BuddyDemoController *)v14 setDemoViewController:v3];

    os_log_type_t v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_100159460;
    os_log_type_t v11 = &unk_1002B0DC0;
    objc_copyWeak(&v12, location);
    os_log_type_t v4 = [(BuddyDemoController *)v14 demoViewController];
    [(MSDWelcomeViewController *)v4 setCompletionHandler:&v7];

    os_log_type_t v15 = [(BuddyDemoController *)v14 demoViewController];
    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  unsigned __int8 v5 = v15;

  return v5;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyActivationRecord)activationRecord
{
  return self->_activationRecord;
}

- (void)setActivationRecord:(id)a3
{
}

- (id)exitBuddyForDemoSetUpBlock
{
  return self->_exitBuddyForDemoSetUpBlock;
}

- (void)setExitBuddyForDemoSetUpBlock:(id)a3
{
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

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BYDeviceConfiguration)deviceConfiguration
{
  return self->_deviceConfiguration;
}

- (void)setDeviceConfiguration:(id)a3
{
}

- (MSDWelcomeViewController)demoViewController
{
  return self->_demoViewController;
}

- (void)setDemoViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end