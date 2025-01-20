@interface BuddyAppActivityController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)clearAppActivitySettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4;
+ (void)setAppActivityEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferences:(id)a6;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BOOL)settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed;
- (BYCapabilities)capabilities;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyAppActivityController)init;
- (MCProfileConnection)managedConfiguration;
- (OBAnimationController)animationController;
- (int)initialAppAnalyticsUserSetting;
- (void)_disableAppAnalytics:(id)a3;
- (void)_enableAppAnalytics:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setInitialAppAnalyticsUserSetting:(int)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyAppActivityController

- (BuddyAppActivityController)init
{
  id location = self;
  v15[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v15[0] = [(NSBundle *)v2 localizedStringForKey:@"APP_ANALYTICS" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  id v14 = [(NSBundle *)v3 localizedStringForKey:@"APP_ANALYTICS_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];

  v4 = +[UIDevice currentDevice];
  unsigned __int8 v5 = [(UIDevice *)v4 sf_isChinaRegionCellularDevice];

  if (v5)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [(NSBundle *)v6 localizedStringForKey:@"ANALYTICS_CELLULAR_DATA_NOTICE" value:&stru_1002B4E18 table:@"Localizable"];
    id v8 = [v14 stringByAppendingFormat:@"\n\n%@", v7];
    id v9 = v14;
    id v14 = v8;
  }
  id v10 = location;
  id location = 0;
  v13.receiver = v10;
  v13.super_class = (Class)BuddyAppActivityController;
  id location = [(BuddyAppActivityController *)&v13 initWithTitle:v15[0] detailText:v14 icon:0];
  objc_storeStrong(&location, location);
  v11 = (BuddyAppActivityController *)location;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

- (BYPreferencesController)buddyPreferences
{
  id v9 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_buddyPreferences)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v7 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v2 = oslog[0];
      os_log_type_t v3 = v7;
      sub_10004B24C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "Preferences controller is nil", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  buddyPreferences = v9->_buddyPreferences;

  return buddyPreferences;
}

- (void)viewDidLoad
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)BuddyAppActivityController;
  [(BuddyAppActivityController *)&v17 viewDidLoad];
  id v2 = [(BuddyAppActivityController *)v19 headerView];
  [v2 setIconInheritsTint:1];

  os_log_type_t v3 = [(BuddyAppActivityController *)v19 managedConfiguration];
  id v4 = [(MCProfileConnection *)v3 userBoolValueForSetting:MCFeatureAppAnalyticsAllowed];
  [(BuddyAppActivityController *)v19 setInitialAppAnalyticsUserSetting:v4];

  unsigned __int8 v5 = v19;
  v6 = +[NSBundle mainBundle];
  char v7 = [(NSBundle *)v6 localizedStringForKey:@"ENABLE_SHARE_APP_ANALYTICS_WITH_DEVELOPERS" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v5 addBoldButton:v7 action:"_enableAppAnalytics:"];

  id v8 = v19;
  id v9 = +[NSBundle mainBundle];
  id v10 = [(NSBundle *)v9 localizedStringForKey:@"DISABLE_SHARE_APP_ANALYTICS_WITH_DEVELOPERS" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v8 addLinkButton:v10 action:"_disableAppAnalytics:"];

  id v11 = [(BuddyAppActivityController *)v19 buttonTray];
  uint64_t v21 = BYPrivacyAnalyticsAppIdentifier;
  v12 = +[NSArray arrayWithObjects:&v21 count:1];
  [v11 setPrivacyLinkForBundles:v12];

  id v13 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v20[0] = v13;
  id v14 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.4];
  v20[1] = v14;
  id location = +[NSArray arrayWithObjects:v20 count:2];

  id v15 = [(BuddyAppActivityController *)v19 buddy_animationController:@"AppAnalytics" animatedStates:location startAtFirstState:1];
  [(BuddyAppActivityController *)v19 setAnimationController:v15];

  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyAppActivityController;
  [(BuddyAppActivityController *)&v12 viewDidAppear:a3];
  if (([(BuddyAppActivityController *)v15 isMovingToParentViewController] & 1) == 0)
  {
    os_log_type_t v3 = [(BuddyAppActivityController *)v15 buddyPreferences];
    [(BYPreferencesController *)v3 setObject:&__kCFBooleanFalse forKey:@"PBAppActivity2Presented"];

    if ([(BuddyAppActivityController *)v15 initialAppAnalyticsUserSetting])
    {
      if ([(BuddyAppActivityController *)v15 initialAppAnalyticsUserSetting] == 2)
      {
        id v8 = objc_opt_class();
        id v9 = [(BuddyAppActivityController *)v15 settingsManager];
        id v10 = [(BuddyAppActivityController *)v15 buddyPreferences];
        [v8 setAppActivityEnabled:0 presented:0 settingsManager:v9 buddyPreferences:v10];
      }
    }
    else
    {
      id v4 = [(BuddyAppActivityController *)v15 paneFeatureAnalyticsManager];
      [(BYPaneFeatureAnalyticsManager *)v4 clearActionForFeature:4];

      unsigned __int8 v5 = objc_opt_class();
      v6 = [(BuddyAppActivityController *)v15 settingsManager];
      char v7 = [(BuddyAppActivityController *)v15 buddyPreferences];
      [v5 clearAppActivitySettingWithSettingsManager:v6 buddyPreferences:v7];
    }
  }
  id v11 = [(BuddyAppActivityController *)v15 animationController];
  [(OBAnimationController *)v11 startAnimation];
}

- (BOOL)settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed
{
  id v2 = [(BuddyAppActivityController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 isAppAnalyticsRestricted];
  char v9 = 0;
  char v7 = 0;
  BOOL v4 = 1;
  if ((v3 & 1) == 0)
  {
    id v10 = [(BuddyAppActivityController *)self managedConfiguration];
    char v9 = 1;
    unsigned int v5 = [(MCProfileConnection *)v10 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];
    BOOL v4 = 1;
    if (v5 == 1)
    {
      id v8 = [(BuddyAppActivityController *)self managedConfiguration];
      char v7 = 1;
      BOOL v4 = [(MCProfileConnection *)v8 effectiveBoolValueForSetting:MCFeatureAppAnalyticsAllowed] == 1;
    }
  }
  BOOL v12 = v4;
  if (v7) {

  }
  if (v9) {
  return v12;
  }
}

+ (void)setAppActivityEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferences:(id)a6
{
  id v14 = a1;
  SEL v13 = a2;
  BOOL v12 = a3;
  BOOL v11 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v9 = 0;
  objc_storeStrong(&v9, a6);
  [location setBool:v12 forManagedConfigurationSetting:MCFeatureAppAnalyticsAllowed];
  id v7 = v9;
  id v8 = +[NSNumber numberWithBool:v11];
  [v7 setObject:v8 forKey:@"PBAppActivity2Presented"];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearAppActivitySettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [location[0] removeBoolSettingForManagedConfigurationSetting:MCFeatureAppAnalyticsAllowed];
  [v5 removeObjectForKey:@"PBAppActivity2Presented"];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_enableAppAnalytics:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyAppActivityController *)v8 settingsManager];
  BOOL v4 = [(BuddyAppActivityController *)v8 buddyPreferences];
  +[BuddyAppActivityController setAppActivityEnabled:1 presented:1 settingsManager:v3 buddyPreferences:v4];

  id v5 = [(BuddyAppActivityController *)v8 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:&__kCFBooleanTrue forFeature:4];

  v6 = [(BuddyWelcomeController *)v8 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v8];

  objc_storeStrong(location, 0);
}

- (void)_disableAppAnalytics:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyAppActivityController *)v8 settingsManager];
  BOOL v4 = [(BuddyAppActivityController *)v8 buddyPreferences];
  +[BuddyAppActivityController setAppActivityEnabled:0 presented:1 settingsManager:v3 buddyPreferences:v4];

  id v5 = [(BuddyAppActivityController *)v8 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:&__kCFBooleanFalse forFeature:4];

  v6 = [(BuddyWelcomeController *)v8 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v8];

  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  id v15 = self;
  oslog[1] = (os_log_t)a2;
  if ([(BuddyAppActivityController *)self settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v13;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Skipping App Analytics because it is not allowed", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    BOOL v4 = [(BuddyAppActivityController *)v15 buddyPreferences];
    unsigned __int8 v5 = [(BYPreferencesController *)v4 BOOLForKey:@"PBAppActivity2Presented"];

    if (v5)
    {
      os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v11;
        os_log_type_t v7 = v10;
        sub_10004B24C(v9);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Skipping App Analytics because it's already been offered", (uint8_t *)v9, 2u);
      }
      objc_storeStrong((id *)&v11, 0);
      return 0;
    }
    else
    {
      return 1;
    }
  }
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupDiagnostics;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = v7;
  id v4 = [location[0] settingsManager];
  id v5 = [location[0] buddyPreferences];
  [v3 setAppActivityEnabled:0 presented:0 settingsManager:v4 buddyPreferences:v5];

  objc_storeStrong(location, 0);
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (int)initialAppAnalyticsUserSetting
{
  return self->_initialAppAnalyticsUserSetting;
}

- (void)setInitialAppAnalyticsUserSetting:(int)a3
{
  self->_initialAppAnalyticsUserSetting = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end