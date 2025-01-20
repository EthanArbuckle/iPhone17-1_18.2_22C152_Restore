@interface BuddyDiagnosticsController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)_writeValuesForKeysToIdMS:(id)a3;
+ (void)clearDeviceAnalyticsSettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4;
+ (void)setDeviceAnalyticsSubmissionEnabled:(BOOL)a3 presented:(BOOL)a4 chronicle:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7;
+ (void)setRequireiCloudAnalyticsOptIn:(BOOL)a3;
+ (void)setiCloudAnalyticsEnabled:(BOOL)a3;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BFFSettingsManager)settingsManager;
- (BOOL)_determineDisplayModeShouldPotentiallyIncludeApps;
- (BOOL)_shouldReportCombinedAnalyticsChoice;
- (BOOL)controllerNeedsToRun;
- (BOOL)imposeSeedPolicy;
- (BOOL)isSeedBuild;
- (BOOL)shouldReportCombinedAnalyticsChoice;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddyDiagnosticsController)init;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyMiscState)miscState;
- (MCProfileConnection)managedConfiguration;
- (OBAnimationController)animationController;
- (id)_detailText;
- (id)_privacyBundlesForDisplayMode:(unint64_t)a3;
- (id)_titleText;
- (int)initialAppAnalyticsUserSetting;
- (int)initialDeviceAnalyticsUserSetting;
- (unint64_t)mode;
- (void)_addButtons;
- (void)_controllerDone:(BOOL)a3;
- (void)_determineDisplayMode:(id)a3;
- (void)_disableAnalytics;
- (void)_enableAnalytics;
- (void)_prepareAnalyticsWithCompletion:(id)a3;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setImposeSeedPolicy:(BOOL)a3;
- (void)setInitialAppAnalyticsUserSetting:(int)a3;
- (void)setInitialDeviceAnalyticsUserSetting:(int)a3;
- (void)setIsSeedBuild:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setShouldReportCombinedAnalyticsChoice:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyDiagnosticsController

- (BuddyDiagnosticsController)init
{
  id location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v9[0] = [(NSBundle *)v2 localizedStringForKey:@"ANALYTICS_TITLE_BOTH" value:&stru_1002B4E18 table:@"Localizable"];

  id v3 = location;
  id location = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BuddyDiagnosticsController;
  id location = [(BuddyDiagnosticsController *)&v8 initWithTitle:v9[0] detailText:0 icon:0];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v4 = +[BYPreferencesController buddyPreferencesInternal];
    char v7 = [v4 BOOLForKey:@"ForceSeedDignostics"] & 1;

    *((unsigned char *)location + 17) = v7 & 1;
  }
  v5 = (BuddyDiagnosticsController *)location;
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyDiagnosticsController;
  [(BuddyDiagnosticsController *)&v9 loadView];
  if ((id)[(BuddyDiagnosticsController *)v11 mode] == (id)4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100046588((uint64_t)buf, [(BuddyDiagnosticsController *)v11 mode]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Unsupported diagnostics display mode %ld", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v2 = [(BuddyDiagnosticsController *)v11 headerView];
  id v3 = [(BuddyDiagnosticsController *)v11 _titleText];
  [v2 setTitle:v3];

  id v4 = [(BuddyDiagnosticsController *)v11 headerView];
  id v5 = [(BuddyDiagnosticsController *)v11 _detailText];
  [v4 setDetailText:v5];

  [(BuddyDiagnosticsController *)v11 _addButtons];
  id v6 = [(BuddyDiagnosticsController *)v11 buttonTray];
  id v7 = [(BuddyDiagnosticsController *)v11 _privacyBundlesForDisplayMode:[(BuddyDiagnosticsController *)v11 mode]];
  [v6 setPrivacyLinkForBundles:v7];
}

- (void)viewDidLoad
{
  objc_super v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyDiagnosticsController;
  [(BuddyDiagnosticsController *)&v6 viewDidLoad];
  id v2 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v9[0] = v2;
  id v3 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.4];
  v9[1] = v3;
  id v5 = +[NSArray arrayWithObjects:v9 count:2];

  id v4 = [(BuddyDiagnosticsController *)v8 buddy_animationController:@"AppAnalytics" animatedStates:v5 startAtFirstState:1];
  [(BuddyDiagnosticsController *)v8 setAnimationController:v4];

  objc_storeStrong((id *)&v5, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BuddyDiagnosticsController;
  [(BuddyDiagnosticsController *)&v19 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, [(BuddyDiagnosticsController *)v22 mode]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Analytics showing mode %ld", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (([(BuddyDiagnosticsController *)v22 isMovingToParentViewController] & 1) == 0)
  {
    id v3 = [(BuddyDiagnosticsController *)v22 buddyPreferences];
    [(BYPreferencesController *)v3 setObject:&__kCFBooleanFalse forKey:@"PBDiagnostics4Presented"];

    if (([(BuddyDiagnosticsController *)v22 mode] & 2) != 0)
    {
      if ([(BuddyDiagnosticsController *)v22 initialDeviceAnalyticsUserSetting])
      {
        if ([(BuddyDiagnosticsController *)v22 initialDeviceAnalyticsUserSetting] == 2)
        {
          objc_super v8 = objc_opt_class();
          objc_super v9 = [(BuddyDiagnosticsController *)v22 chronicle];
          SEL v10 = [(BuddyDiagnosticsController *)v22 settingsManager];
          v11 = [(BuddyDiagnosticsController *)v22 buddyPreferences];
          [v8 setDeviceAnalyticsSubmissionEnabled:0 presented:0 chronicle:v9 settingsManager:v10 buddyPreferences:v11];
        }
      }
      else
      {
        id v4 = objc_opt_class();
        id v5 = [(BuddyDiagnosticsController *)v22 settingsManager];
        objc_super v6 = [(BuddyDiagnosticsController *)v22 buddyPreferences];
        [v4 clearDeviceAnalyticsSettingWithSettingsManager:v5 buddyPreferences:v6];

        SEL v7 = [(BuddyDiagnosticsController *)v22 paneFeatureAnalyticsManager];
        [(BYPaneFeatureAnalyticsManager *)v7 clearActionForFeature:5];
      }
    }
    if (([(BuddyDiagnosticsController *)v22 mode] & 4) != 0)
    {
      if ([(BuddyDiagnosticsController *)v22 initialAppAnalyticsUserSetting])
      {
        if ([(BuddyDiagnosticsController *)v22 initialAppAnalyticsUserSetting] == 2)
        {
          v15 = [(BuddyDiagnosticsController *)v22 settingsManager];
          v16 = [(BuddyDiagnosticsController *)v22 buddyPreferences];
          +[BuddyAppActivityController setAppActivityEnabled:0 presented:0 settingsManager:v15 buddyPreferences:v16];
        }
      }
      else
      {
        v12 = [(BuddyDiagnosticsController *)v22 paneFeatureAnalyticsManager];
        [(BYPaneFeatureAnalyticsManager *)v12 clearActionForFeature:4];

        v13 = [(BuddyDiagnosticsController *)v22 settingsManager];
        v14 = [(BuddyDiagnosticsController *)v22 buddyPreferences];
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:v13 buddyPreferences:v14];
      }
    }
  }
  v17 = [(BuddyDiagnosticsController *)v22 animationController];
  [(OBAnimationController *)v17 startAnimation];
}

- (void)_addButtons
{
  if ([(BuddyDiagnosticsController *)self imposeSeedPolicy])
  {
    id v2 = +[NSBundle mainBundle];
    id v3 = [(NSBundle *)v2 localizedStringForKey:@"ENABLE_DIAGNOSTICS_AUTO_OPT_IN" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)self addBoldButton:v3 action:"_enableAnalytics"];
  }
  else
  {
    unint64_t v4 = [(BuddyDiagnosticsController *)self mode];
    if (v4)
    {
      if (v4 - 1 < 3)
      {
        id v5 = +[NSBundle mainBundle];
        objc_super v6 = [(NSBundle *)v5 localizedStringForKey:@"ENABLE_ANALYTICS" value:&stru_1002B4E18 table:@"Localizable"];
        [(BuddyWelcomeController *)self addBoldButton:v6 action:"_enableAnalytics"];
      }
      else if (v4 != 4 && v4 - 6 < 2)
      {
        SEL v7 = +[NSBundle mainBundle];
        objc_super v8 = [(NSBundle *)v7 localizedStringForKey:@"ENABLE_ANALYTICS_INCLUDING_APPS" value:&stru_1002B4E18 table:@"Localizable"];
        [(BuddyWelcomeController *)self addBoldButton:v8 action:"_enableAnalytics"];
      }
    }
    objc_super v9 = +[NSBundle mainBundle];
    SEL v10 = [(NSBundle *)v9 localizedStringForKey:@"DISABLE_ANALYTICS" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)self addLinkButton:v10 action:"_disableAnalytics"];
  }
}

- (id)_titleText
{
  switch([(BuddyDiagnosticsController *)self mode])
  {
    case 1uLL:
      unint64_t v4 = +[NSBundle mainBundle];
      SEL v7 = [(NSBundle *)v4 localizedStringForKey:@"ANALYTICS_TITLE_ICLOUD" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 2uLL:
    case 6uLL:
      id v2 = +[NSBundle mainBundle];
      id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ANALYTICS_TITLE_DEVICE"];
      SEL v7 = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 3uLL:
    case 7uLL:
      id v5 = +[NSBundle mainBundle];
      SEL v7 = [(NSBundle *)v5 localizedStringForKey:@"ANALYTICS_TITLE_BOTH" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    default:
      break;
  }

  return v7;
}

- (id)_detailText
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  char v27 = 0;
  char v26 = 0;
  switch([(BuddyDiagnosticsController *)self mode])
  {
    case 1uLL:
      objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_ICLOUD");
      char v26 = 1;
      break;
    case 2uLL:
      if ([(BuddyDiagnosticsController *)v29 imposeSeedPolicy])
      {
        objc_storeStrong(location, @"DIAGNOSTICS_DESCRIPTION_AUTO_OPT_IN");
      }
      else
      {
        objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_DEVICE");
        char v27 = 1;
        char v26 = 1;
      }
      break;
    case 3uLL:
      objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_BOTH");
      char v27 = 1;
      char v26 = 1;
      break;
    case 6uLL:
      if ([(BuddyDiagnosticsController *)v29 imposeSeedPolicy])
      {
        objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_AUTO_OPT_IN_DEVICE_AND_APPS");
      }
      else
      {
        objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_DEVICE_AND_APPS");
        char v27 = 1;
        char v26 = 1;
      }
      break;
    case 7uLL:
      objc_storeStrong(location, @"ANALYTICS_DESCRIPTION_DEVICE_AND_APPS_AND_ICLOUD");
      char v27 = 1;
      char v26 = 1;
      break;
    default:
      break;
  }
  id v25 = 0;
  if (v26)
  {
    id v2 = [(BuddyDiagnosticsController *)v29 flowItemDispositionProvider];
    id v3 = [(BuddyFlowItemDispositionProvider *)v2 dispositions];

    id v24 = v3;
    id v4 = +[BYPreferencesController buddyPreferencesInternal];
    id v23 = [v4 objectForKey:@"PBAnalyticsForceDisposition"];

    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = [v23 unsignedIntegerValue];
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          sub_100046588((uint64_t)buf, (uint64_t)v24);
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Analytics forcing disposition %lu", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    if (v24 && v24 != (id)4)
    {
      id v5 = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:location[0] disposition:v24];
      id v6 = location[0];
      location[0] = v5;
    }
    objc_storeStrong(&v23, 0);
  }
  if (v27)
  {
    SEL v7 = +[NSBundle mainBundle];
    id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location[0]];
    objc_super v9 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Localizable"];
    id v10 = v25;
    id v25 = v9;
  }
  else
  {
    SEL v7 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v7 localizedStringForKey:location[0] value:&stru_1002B4E18 table:@"Localizable"];
    id v12 = v25;
    id v25 = v11;
  }
  v13 = +[UIDevice currentDevice];
  unsigned __int8 v14 = [(UIDevice *)v13 sf_isChinaRegionCellularDevice];

  if (v14)
  {
    id v15 = v25;
    v16 = +[NSBundle mainBundle];
    v17 = [(NSBundle *)v16 localizedStringForKey:@"ANALYTICS_CELLULAR_DATA_NOTICE" value:&stru_1002B4E18 table:@"Localizable"];
    id v18 = [v15 stringByAppendingFormat:@"\n\n%@", v17];
    id v19 = v25;
    id v25 = v18;
  }
  id v20 = v25;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v20;
}

+ (void)setRequireiCloudAnalyticsOptIn:(BOOL)a3
{
  byte_100321E50 = a3;
}

+ (void)setDeviceAnalyticsSubmissionEnabled:(BOOL)a3 presented:(BOOL)a4 chronicle:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7
{
  id v18 = a1;
  SEL v17 = a2;
  BOOL v16 = a3;
  BOOL v15 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v12 = 0;
  objc_storeStrong(&v12, a7);
  [v13 setBool:v16 forManagedConfigurationSetting:MCFeatureDiagnosticsSubmissionAllowed];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DiagnosticsShouldSubmitNotification, 0, 0, 0);
  id v10 = v12;
  v11 = +[NSNumber numberWithBool:v15];
  [v10 setObject:v11 forKey:@"PBDiagnostics4Presented"];

  if (v15) {
    [location recordFeatureShown:2];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearDeviceAnalyticsSettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [location[0] removeBoolSettingForManagedConfigurationSetting:MCFeatureDiagnosticsSubmissionAllowed];
  [v5 removeObjectForKey:@"PBDiagnostics4Presented"];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (void)setiCloudAnalyticsEnabled:(BOOL)a3
{
  id v8 = a1;
  SEL v7 = a2;
  BOOL v6 = a3;
  if (a3) {
    id v3 = @"1";
  }
  else {
    id v3 = @"0";
  }
  id location = v3;
  CFStringRef v9 = @"com.apple.idms.config.privacy.icloud.data";
  id v10 = location;
  id v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v8 _writeValuesForKeysToIdMS:v4];

  CFPreferencesSetAppValue(@"AllowiCloudAnalytics", +[NSNumber numberWithBool:v6], @"com.apple.Preferences");
  objc_storeStrong(&location, 0);
}

- (id)_privacyBundlesForDisplayMode:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      id v4 = 0;
      break;
    case 1uLL:
      uint64_t v8 = BYPrivacyAnalyticsiCloudIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1, a3, a2, self);
      break;
    case 2uLL:
      uint64_t v9 = BYPrivacyAnalyticsDeviceIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, a3, a2, self);
      break;
    case 3uLL:
      v7[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v7[1] = BYPrivacyAnalyticsiCloudIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2, a3, a2, self);
      break;
    case 6uLL:
      v6[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v6[1] = BYPrivacyAnalyticsAppIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2, a3, a2, self);
      break;
    case 7uLL:
      v5[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v5[1] = BYPrivacyAnalyticsAppIdentifier;
      v5[2] = BYPrivacyAnalyticsiCloudIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a3, a2, self);
      break;
    default:
      break;
  }

  return v4;
}

- (void)_enableAnalytics
{
}

- (void)_disableAnalytics
{
}

- (void)_controllerDone:(BOOL)a3
{
  id v23 = self;
  SEL v22 = a2;
  BOOL v21 = a3;
  [(BuddyDiagnosticsController *)self imposeSeedPolicy];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001853EC((uint64_t)buf, [(BuddyDiagnosticsController *)v23 mode], v21, [(BuddyDiagnosticsController *)v23 imposeSeedPolicy]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Analytics opt-in done, mode = %ld, choice = %d, automatic = %d", buf, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (([(BuddyDiagnosticsController *)v23 mode] & 2) != 0)
  {
    BOOL v3 = v21;
    id v4 = [(BuddyDiagnosticsController *)v23 chronicle];
    id v5 = [(BuddyDiagnosticsController *)v23 settingsManager];
    BOOL v6 = [(BuddyDiagnosticsController *)v23 buddyPreferences];
    +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:v3 presented:1 chronicle:v4 settingsManager:v5 buddyPreferences:v6];

    if ([(BuddyDiagnosticsController *)v23 imposeSeedPolicy])
    {
      SEL v7 = [(BuddyDiagnosticsController *)v23 buddyPreferences];
      [(BYPreferencesController *)v7 setObject:&__kCFBooleanTrue forKey:@"DiagnosticsAutoOptInSet"];
    }
    if (![(BuddyDiagnosticsController *)v23 imposeSeedPolicy])
    {
      uint64_t v8 = [(BuddyDiagnosticsController *)v23 paneFeatureAnalyticsManager];
      uint64_t v9 = +[NSNumber numberWithBool:v21];
      [(BYPaneFeatureAnalyticsManager *)v8 recordActionWithValue:v9 forFeature:5];
    }
  }
  else
  {
    id v10 = [(BuddyDiagnosticsController *)v23 buddyPreferences];
    [(BYPreferencesController *)v10 setObject:&__kCFBooleanTrue forKey:@"PBDiagnostics4Presented"];
  }
  if (([(BuddyDiagnosticsController *)v23 mode] & 4) != 0)
  {
    BOOL v11 = v21;
    id v12 = [(BuddyDiagnosticsController *)v23 settingsManager];
    id v13 = [(BuddyDiagnosticsController *)v23 buddyPreferences];
    +[BuddyAppActivityController setAppActivityEnabled:v11 presented:1 settingsManager:v12 buddyPreferences:v13];

    unsigned __int8 v14 = [(BuddyDiagnosticsController *)v23 paneFeatureAnalyticsManager];
    BOOL v15 = +[NSNumber numberWithBool:v21];
    [(BYPaneFeatureAnalyticsManager *)v14 recordActionWithValue:v15 forFeature:4];
  }
  if ([(BuddyDiagnosticsController *)v23 mode])
  {
    [(id)objc_opt_class() setiCloudAnalyticsEnabled:v21];
    BOOL v16 = [(BuddyDiagnosticsController *)v23 paneFeatureAnalyticsManager];
    SEL v17 = +[NSNumber numberWithBool:v21];
    [(BYPaneFeatureAnalyticsManager *)v16 recordActionWithValue:v17 forFeature:3];
  }
  if ([(BuddyDiagnosticsController *)v23 shouldReportCombinedAnalyticsChoice])
  {
    id v18 = [(BuddyDiagnosticsController *)v23 analyticsManager];
    [(BYAnalyticsManager *)v18 setCombinedAnalyticsRepromptChoice:v21];
  }
  id v19 = [(BuddyWelcomeController *)v23 delegate];
  [(BFFFlowItemDelegate *)v19 flowItemDone:v23];
}

- (void)_determineDisplayMode:(id)a3
{
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyDiagnosticsController *)v50 buddyPreferences];
  unsigned __int8 v4 = [(BYPreferencesController *)v3 BOOLForKey:@"PBDiagnostics4Presented"];

  char v48 = v4 & 1;
  id v5 = [(BuddyDiagnosticsController *)v50 capabilities];
  unsigned __int8 v6 = [(BYCapabilities *)v5 isDeviceAnalyticsRestricted];

  char v47 = v6 & 1;
  SEL v7 = [(BuddyDiagnosticsController *)v50 managedConfiguration];
  BOOL v8 = [(MCProfileConnection *)v7 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed] == 1;

  BOOL v46 = v8;
  BOOL v45 = 0;
  uint64_t v9 = [(BuddyDiagnosticsController *)v50 miscState];
  unsigned __int8 v10 = [(BuddyMiscState *)v9 launchedWithCombinedAnalyticsMismatch];

  BOOL v45 = (v10 & 1) == 0 && v46;
  char v44 = 0;
  char v11 = 1;
  if ((v47 & 1) == 0)
  {
    char v11 = 1;
    if (!v45) {
      char v11 = v48;
    }
  }
  char v44 = (v11 ^ 1) & 1;
  uint64_t v39 = 0;
  v40 = &v39;
  int v41 = 0x20000000;
  int v42 = 32;
  uint64_t v43 = 0;
  if (v44)
  {
    v40[3] |= 2uLL;
    if ([(BuddyDiagnosticsController *)v50 _determineDisplayModeShouldPotentiallyIncludeApps])
    {
      id v12 = [(BuddyDiagnosticsController *)v50 capabilities];
      unsigned __int8 v13 = [(BYCapabilities *)v12 isAppAnalyticsRestricted];

      char v38 = v13 & 1;
      BOOL v37 = !(v13 & 1);
      if ((v13 & 1) == 0) {
        v40[3] |= 4uLL;
      }
    }
  }
  id v14 = +[ACAccountStore defaultStore];
  id v36 = [v14 aa_primaryAppleAccount];

  char v34 = 0;
  char v15 = 0;
  if (![(BuddyDiagnosticsController *)v50 imposeSeedPolicy])
  {
    char v15 = 0;
    if ((v48 & 1) == 0)
    {
      char v15 = 0;
      if (v36)
      {
        v35 = [(BuddyDiagnosticsController *)v50 capabilities];
        char v34 = 1;
        char v15 = [(BYCapabilities *)v35 isCloudAnalyticsRestricted] ^ 1;
      }
    }
  }
  if (v34) {

  }
  if (v15)
  {
    id v16 = +[BuddyAccountTools sharedBuddyAccountTools];
    id v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    char v27 = sub_100185A04;
    v28 = &unk_1002B4088;
    v30[1] = &v39;
    v30[0] = location[0];
    char v31 = v47 & 1;
    BOOL v32 = v46;
    v29 = v50;
    char v33 = v48 & 1;
    [v16 primaryAccountIsChildAccount:&v24];

    int v23 = 1;
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong(v30, 0);
  }
  else
  {
    if (location[0])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v40[3];
        int v18 = v47 & 1;
        int v19 = v46;
        id v20 = [(BuddyDiagnosticsController *)v50 miscState];
        unsigned __int8 v21 = [(BuddyMiscState *)v20 launchedWithCombinedAnalyticsMismatch];
        sub_100185EA0((uint64_t)buf, v17, v18, v19, v21 & 1, v48 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Diagnostics display mode = %ld, factors: Restricted = %d, AlreadyYes = %d, Mismatch = %d, AlreadyPresented = %d", buf, 0x24u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v40[3]);
    }
    int v23 = 0;
  }
  objc_storeStrong(&v36, 0);
  _Block_object_dispose(&v39, 8);
  objc_storeStrong(location, 0);
}

- (BOOL)_determineDisplayModeShouldPotentiallyIncludeApps
{
  uint64_t v17 = self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(BuddyDiagnosticsController *)self miscState];
  unsigned __int8 v3 = [(BuddyMiscState *)v2 launchedWithCombinedAnalyticsMismatch];

  if (v3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v4 = oslog[0];
      os_log_type_t v5 = v15;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Diagnostics display mode potentially including apps (via mismatch)", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 1;
  }
  else
  {
    unsigned __int8 v6 = [(BuddyDiagnosticsController *)v17 capabilities];
    unsigned __int8 v7 = [(BYCapabilities *)v6 eligibleForChlorine];

    if (v7)
    {
      os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = v13;
        os_log_type_t v9 = v12;
        sub_10004B24C(v11);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Diagnostics display mode potentially including apps (via eligibility)", (uint8_t *)v11, 2u);
      }
      objc_storeStrong((id *)&v13, 0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
}

+ (void)_writeValuesForKeysToIdMS:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v27 = [v3 aa_primaryAppleAccount];

  if (v27)
  {
    id v26 = [v27 aa_altDSID];
    id v25 = (id)objc_opt_new();
    memset(__b, 0, sizeof(__b));
    id v4 = location[0];
    id v5 = [v4 countByEnumeratingWithState:__b objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(void *)__b[2] != v6) {
            objc_enumerationMutation(v4);
          }
          id v24 = *(id *)(__b[1] + 8 * i);
          id v22 = [location[0] objectForKeyedSubscript:v24];
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v8 = oslog;
            os_log_type_t v9 = v20;
            sub_100051470((uint64_t)buf, (uint64_t)v24, (uint64_t)v22);
            _os_log_impl((void *)&_mh_execute_header, v8, v9, "Writing value to IdMS '%@' = '%@'...", buf, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v10 = v25;
          id v11 = v22;
          id v12 = v24;
          id v13 = v26;
          id v14 = _NSConcreteStackBlock;
          int v15 = -1073741824;
          int v16 = 0;
          uint64_t v17 = sub_100186368;
          int v18 = &unk_1002B15C8;
          id v19 = v24;
          [v10 setConfigurationInfo:v11 forIdentifier:v12 forAltDSID:v13 completion:&v14];
          objc_storeStrong(&v19, 0);
          objc_storeStrong(&v22, 0);
        }
        id v5 = [v4 countByEnumeratingWithState:__b objects:v30 count:16];
      }
      while (v5);
    }

    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_prepareAnalyticsWithCompletion:(id)a3
{
  unsigned __int8 v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyDiagnosticsController *)v7 _shouldReportCombinedAnalyticsChoice];
  [(BuddyDiagnosticsController *)v7 setShouldReportCombinedAnalyticsChoice:v3 & 1];
  if ([(BuddyDiagnosticsController *)v7 shouldReportCombinedAnalyticsChoice])
  {
    id v4 = [(BuddyDiagnosticsController *)v7 analyticsManager];

    if (!v4) {
      objc_exception_throw(+[NSException exceptionWithName:@"Missing analytics manager" reason:0 userInfo:0]);
    }
    id v5 = [(BuddyDiagnosticsController *)v7 analyticsManager];
    [(BYAnalyticsManager *)v5 prepareForCombinedAnalyticsRepromptWithCompletion:location[0]];
  }
  else
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldReportCombinedAnalyticsChoice
{
  id v2 = [(BuddyDiagnosticsController *)self runState];
  char v3 = [(BYRunState *)v2 hasCompletedInitialRun] ^ 1;

  if (v3) {
    return 0;
  }
  id v4 = [(BuddyDiagnosticsController *)self miscState];
  char v5 = ![(BuddyMiscState *)v4 launchedWithCombinedAnalyticsMismatch];

  return (v5 & 1) == 0 && ([(BuddyDiagnosticsController *)self mode] & 6) == 6;
}

- (BOOL)controllerNeedsToRun
{
  id v14 = self;
  SEL v13 = a2;
  if (![(BuddyDiagnosticsController *)self imposeSeedPolicy]) {
    return 1;
  }
  if (![(BuddyDiagnosticsController *)v14 isSeedBuild]) {
    return 0;
  }
  id v2 = [(BuddyDiagnosticsController *)v14 capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 isDeviceAnalyticsRestricted];

  char v12 = v3 & 1;
  id v4 = [(BuddyDiagnosticsController *)v14 managedConfiguration];
  BOOL v5 = [(MCProfileConnection *)v4 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed] == 1;

  BOOL v11 = v5;
  uint64_t v6 = [(BuddyDiagnosticsController *)v14 buddyPreferences];
  unsigned __int8 v7 = [(BYPreferencesController *)v6 BOOLForKey:@"PBDiagnostics4Presented"];

  char v10 = v7 & 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100186970((uint64_t)buf, v12 & 1, v11, v10 & 1);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Seed diagnostics preemptors: Restricted = %d, IsAlreadyYes = %d, already presented = %d", buf, 0x14u);
  }
  objc_storeStrong((id *)&oslog, 0);
  return (v12 & 1) == 0 && !v11 && (v10 & 1) == 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyDiagnosticsController *)v30 managedConfiguration];
  id v4 = [(MCProfileConnection *)v3 userBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed];
  [(BuddyDiagnosticsController *)v30 setInitialDeviceAnalyticsUserSetting:v4];

  BOOL v5 = [(BuddyDiagnosticsController *)v30 managedConfiguration];
  id v6 = [(MCProfileConnection *)v5 userBoolValueForSetting:MCFeatureAppAnalyticsAllowed];
  [(BuddyDiagnosticsController *)v30 setInitialAppAnalyticsUserSetting:v6];

  id v7 = +[BYPreferencesController buddyPreferencesInternal];
  id v28 = [v7 objectForKey:@"PBAnalyticsForceMode"];

  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v28 unsignedIntegerValue];
      [(BuddyDiagnosticsController *)v30 setMode:v8];
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_100046588((uint64_t)buf, [(BuddyDiagnosticsController *)v30 mode]);
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, v26, "Analytics forcing mode %lu", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  int v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  unsigned __int8 v21 = sub_100186D3C;
  id v22 = &unk_1002B0CF8;
  int v23 = v30;
  id v24 = location[0];
  id v25 = objc_retainBlock(&v18);
  if ([(BuddyDiagnosticsController *)v30 mode])
  {
    (*((void (**)(id, uint64_t))v25 + 2))(v25, 1);
    int v17 = 1;
  }
  else
  {
    os_log_type_t v9 = dispatch_get_global_queue(2, 0);
    char v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    SEL v13 = sub_100186E74;
    id v14 = &unk_1002B0CD0;
    int v15 = v30;
    id v16 = v25;
    dispatch_async(v9, &v10);

    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    int v17 = 0;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
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
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = v9;
  id v4 = [location[0] chronicle];
  id v5 = [location[0] settingsManager];
  id v6 = [location[0] buddyPreferences];
  [v3 setDeviceAnalyticsSubmissionEnabled:0 presented:0 chronicle:v4 settingsManager:v5 buddyPreferences:v6];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DiagnosticsShouldSubmitNotification, 0, 0, 0);
  objc_storeStrong(location, 0);
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
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

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BOOL)imposeSeedPolicy
{
  return self->_imposeSeedPolicy;
}

- (void)setImposeSeedPolicy:(BOOL)a3
{
  self->_imposeSeedPolicy = a3;
}

- (BOOL)isSeedBuild
{
  return self->_isSeedBuild;
}

- (void)setIsSeedBuild:(BOOL)a3
{
  self->_isSeedBuild = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (int)initialDeviceAnalyticsUserSetting
{
  return self->_initialDeviceAnalyticsUserSetting;
}

- (void)setInitialDeviceAnalyticsUserSetting:(int)a3
{
  self->_initialDeviceAnalyticsUserSetting = a3;
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

- (BOOL)shouldReportCombinedAnalyticsChoice
{
  return self->_shouldReportCombinedAnalyticsChoice;
}

- (void)setShouldReportCombinedAnalyticsChoice:(BOOL)a3
{
  self->_shouldReportCombinedAnalyticsChoice = a3;
}

- (void).cxx_destruct
{
}

@end