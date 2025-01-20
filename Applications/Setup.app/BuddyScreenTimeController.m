@interface BuddyScreenTimeController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)clearScreenTimeSetting:(id)a3;
+ (void)setScreenTimeEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5;
- (BFFFlowItemDelegate)delegate;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BYCapabilities)capabilities;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddyPendingRestoreState)pendingRestoreState;
- (STManagementState)managementState;
- (STSetupAssistantViewController)screenTimeViewController;
- (id)viewController;
- (int64_t)screenTimeState;
- (void)continueSetup;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagementState:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setRunState:(id)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setScreenTimeState:(int64_t)a3;
- (void)setScreenTimeViewController:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setupSkipped;
@end

@implementation BuddyScreenTimeController

+ (void)setScreenTimeEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  id v16 = a1;
  SEL v15 = a2;
  BOOL v14 = a3;
  BOOL v13 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v11 = objc_alloc_init((Class)STManagementState);
  id v10 = 0;
  id obj = 0;
  unsigned __int8 v5 = [v11 setScreenTimeEnabled:v14 error:&obj];
  objc_storeStrong(&v10, obj);
  if ((v5 & 1) == 0)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10004BB7C((uint64_t)buf, (uint64_t)v10);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to set Screen Time enabled: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v6 = location;
  v7 = +[NSNumber numberWithBool:v13];
  [v6 setObject:v7 forKey:@"ScreenTimePresented"];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearScreenTimeSetting:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(id)objc_opt_class() setScreenTimeEnabled:0 presented:0 buddyPreferences:location[0]];
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipScreenTime;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyScreenTimeController *)self buddyPreferences];
  unsigned __int8 v3 = [(BYPreferencesController *)v2 BOOLForKey:@"ScreenTimePresented"];

  char v6 = 0;
  BOOL v4 = 0;
  if ((v3 & 1) == 0)
  {
    v7 = [(BuddyScreenTimeController *)self capabilities];
    char v6 = 1;
    BOOL v4 = ([(BYCapabilities *)v7 isScreenTimeRestricted] & 1) == 0;
  }
  BOOL v9 = v4;
  if (v6) {

  }
  return v9;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BOOL v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc_init((Class)STManagementState);
  [(BuddyScreenTimeController *)v14 setManagementState:v3];

  objc_initWeak(&from, v14);
  BOOL v4 = [(BuddyScreenTimeController *)v14 managementState];
  unsigned __int8 v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_10010A708;
  BOOL v9 = &unk_1002B32D0;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  [(STManagementState *)v4 screenTimeStateWithCompletionHandler:&v5];

  objc_storeStrong(&v10, 0);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return [(BuddyScreenTimeController *)self screenTimeViewController];
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  id v3 = [(BuddyScreenTimeController *)self screenTimeViewController];
  BOOL v4 = (objc_class *)objc_opt_class();
  unsigned __int8 v5 = NSStringFromClass(v4);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v3 identifier:v5];

  int v6 = [(BuddyScreenTimeController *)v20 screenTimeViewController];
  id v7 = [(STSetupAssistantViewController *)v6 view];
  id v8 = [v7 window];
  [v8 setUserInteractionEnabled:0];

  objc_initWeak(&location, v20);
  BOOL v9 = [(BuddyScreenTimeController *)v20 managementState];
  LOBYTE(v8) = v18;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  BOOL v13 = sub_10010AB1C;
  BOOL v14 = &unk_1002B3320;
  objc_copyWeak(&v15, &location);
  BOOL v16 = v18;
  [(STManagementState *)v9 setScreenTimeEnabled:v8 & 1 completionHandler:&v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)controllerWasPopped
{
  v2 = [(BuddyScreenTimeController *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanFalse forKey:@"ScreenTimePresented"];

  id v3 = [(BuddyScreenTimeController *)self paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v3 clearActionForFeature:0];
}

- (void)continueSetup
{
}

- (void)setupSkipped
{
  v2 = [(BuddyScreenTimeController *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

  if (v3)
  {
    BOOL v4 = [(BuddyScreenTimeController *)self buddyPreferences];
    [(BYPreferencesController *)v4 setObject:&__kCFBooleanTrue forKey:@"ScreenTimePresented"];

    unsigned __int8 v5 = [(BuddyScreenTimeController *)self delegate];
    [(BFFFlowItemDelegate *)v5 flowItemDone:self];
  }
  else
  {
    [(BuddyScreenTimeController *)self setScreenTimeEnabled:0];
  }
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (STSetupAssistantViewController)screenTimeViewController
{
  return self->_screenTimeViewController;
}

- (void)setScreenTimeViewController:(id)a3
{
}

- (int64_t)screenTimeState
{
  return self->_screenTimeState;
}

- (void)setScreenTimeState:(int64_t)a3
{
  self->_screenTimeState = a3;
}

- (STManagementState)managementState
{
  return self->_managementState;
}

- (void)setManagementState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end