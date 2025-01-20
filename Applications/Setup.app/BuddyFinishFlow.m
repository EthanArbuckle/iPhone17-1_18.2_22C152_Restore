@interface BuddyFinishFlow
+ (id)allowedFlowItems;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BuddyFinishFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (BuddySetupMethod)setupMethod;
- (BuddySuspendTask)suspendTask;
- (_TtC5Setup28SetupUserDispositionProvider)userDispositionProvider;
- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider;
- (unint64_t)allowedTerminationSources;
- (void)_updateClassList;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setSuspendTask:(id)a3;
- (void)setUserDispositionProvider:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddyFinishFlow

- (BuddyFinishFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
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
  v12.super_class = (Class)BuddyFinishFlow;
  id v17 = [(BuddyFinishFlow *)&v12 initWithNavigationController:location[0] flowDelegate:v15 flowStarter:v14 dependencyInjector:v13];
  objc_storeStrong(&v17, v17);
  if (v17) {
    [v17 _updateClassList];
  }
  v10 = (BuddyFinishFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

+ (id)allowedFlowItems
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

- (void)startFlowAnimated:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(BuddyFinishFlow *)self _updateClassList];
  v3.receiver = v6;
  v3.super_class = (Class)BuddyFinishFlow;
  [(BuddyFinishFlow *)&v3 startFlowAnimated:v4];
}

- (void)_updateClassList
{
  v2 = [(BuddyFinishFlow *)self suspendTask];
  objc_super v3 = [(BuddySuspendTask *)v2 launchURL];
  char v7 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    v8 = [(BuddyFinishFlow *)self buddyPreferencesExcludedFromBackup];
    char v7 = 1;
    unsigned __int8 v4 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
  }
  if (v7) {

  }
  if (v4)
  {
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    SEL v5 = +[NSArray arrayWithObjects:v11 count:3];
    [(BuddyFinishFlow *)self setClassList:v5];
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:&v10 count:1];
    [(BuddyFinishFlow *)self setClassList:v6];
  }
}

- (unint64_t)allowedTerminationSources
{
  return 3;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  oslog[1] = 0;
  char v3 = SADSUninstallIneligibleAppsWithError();
  objc_storeStrong(&v35, 0);
  char v34 = v3 & 1;
  if ((v3 & 1) != 0 || !v35)
  {
    if ((v34 & 1) == 0)
    {
      os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
      char v26 = 16;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        SEL v5 = v27;
        os_log_type_t v6 = v26;
        sub_10004B24C(v25);
        _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "Error deleting ineligible apps but no error provided.", v25, 2u);
      }
      objc_storeStrong((id *)&v27, 0);
    }
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      char v30 = 0;
      char v28 = 0;
      if (_BYIsInternalInstall())
      {
        unsigned __int8 v4 = (NSString *)v35;
      }
      else if (v35)
      {
        id v31 = [v35 domain];
        char v30 = 1;
        unsigned __int8 v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v31, [v35 code]);
        id v29 = v4;
        char v28 = 1;
      }
      else
      {
        unsigned __int8 v4 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog[0], v32, "Error deleting ineligible apps: %{public}@", buf, 0xCu);
      if (v28) {

      }
      if (v30) {
    }
      }
    objc_storeStrong((id *)oslog, 0);
  }
  if (location[0])
  {
    char v7 = [(BuddyFinishFlow *)v37 lockdownModeProvider];
    unsigned __int8 v8 = [(LockdownModeProvider *)v7 hasStagedEnablement];

    if (v8)
    {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v24 = 1;
    }
    else
    {
      id v9 = [(BuddyFinishFlow *)v37 runState];
      unsigned __int8 v10 = [(BYRunState *)v9 hasCompletedInitialRun];

      if (v10)
      {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        int v24 = 1;
      }
      else
      {
        id v23 = +[BYDevice currentDevice];
        v11 = [(BuddyFinishFlow *)v37 userDispositionProvider];
        objc_super v12 = [(BuddyFinishFlow *)v37 setupMethod];
        id v13 = [(BuddySetupMethod *)v12 dataTransferMethod];
        id v14 = [v23 deviceClass];
        id v15 = [v23 serialNumber];
        v16 = _NSConcreteStackBlock;
        int v17 = -1073741824;
        int v18 = 0;
        v19 = sub_10013653C;
        v20 = &unk_1002B37C8;
        v21 = v37;
        id v22 = location[0];
        [(SetupUserDispositionProvider *)v11 isNewUserWithDataTransferMethod:v13 deviceClass:v14 serialNumber:v15 completionHandler:&v16];

        objc_storeStrong(&v22, 0);
        objc_storeStrong((id *)&v21, 0);
        objc_storeStrong(&v23, 0);
        int v24 = 0;
      }
    }
  }
  else
  {
    int v24 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (_TtC5Setup28SetupUserDispositionProvider)userDispositionProvider
{
  return self->_userDispositionProvider;
}

- (void)setUserDispositionProvider:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end