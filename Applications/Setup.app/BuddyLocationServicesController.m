@interface BuddyLocationServicesController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hiddenFromMultiUser;
+ (BOOL)hiddenFromStoreDemoMode;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)_setPersistentPresentedKey:(BOOL)a3;
+ (void)setSettingEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5;
+ (void)setSettingsFromArchivedPreferences:(id)a3 settingsManager:(id)a4;
+ (void)skippedByCloudConfig;
- (BFFSettingsManager)settingsManager;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyLocationServicesController)init;
- (BuddyPendingRestoreState)pendingRestoreState;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (void)_disableButtonPressed:(id)a3;
- (void)_enableButtonTapped:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)startOver;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyLocationServicesController

- (BuddyLocationServicesController)init
{
  id location = self;
  v8[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"LOCATION_SERVICES"];
  v8[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  id v4 = location;
  id location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyLocationServicesController;
  id location = [(BuddyLocationServicesController *)&v7 initWithTitle:v8[0] detailText:0 symbolName:0];
  objc_storeStrong(&location, location);
  v5 = (BuddyLocationServicesController *)location;
  objc_storeStrong(v8, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  v35 = self;
  SEL v34 = a2;
  v33.receiver = self;
  v33.super_class = (Class)BuddyLocationServicesController;
  [(BuddyLocationServicesController *)&v33 viewDidLoad];
  v2 = [(BuddyLocationServicesController *)v35 flowItemDispositionProvider];
  unint64_t v3 = [(BuddyFlowItemDispositionProvider *)v2 dispositions];

  if (v3)
  {
    id v4 = [(BuddyLocationServicesController *)v35 flowItemDispositionProvider];
    id location = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:@"LOCATION_SERVICES_DESCRIPTION" disposition:[(BuddyFlowItemDispositionProvider *)v4 dispositions]];

    v5 = [(BuddyLocationServicesController *)v35 flowItemDispositionProvider];
    id v6 = [(BuddyFlowItemDispositionProvider *)v5 dispositions];

    if (v6 == (id)8)
    {
      id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location];
      id v8 = location;
      id location = v7;
    }
    id v9 = [(BuddyLocationServicesController *)v35 headerView];
    v10 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v10 localizedStringForKey:location value:&stru_1002B4E18 table:@"Localizable"];
    [v9 setDetailText:v11];

    objc_storeStrong(&location, 0);
  }
  else
  {
    id v12 = [(BuddyLocationServicesController *)v35 headerView];
    v13 = +[NSBundle mainBundle];
    v14 = [(NSBundle *)v13 localizedStringForKey:@"LOCATION_SERVICES_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
    [v12 setDetailText:v14];
  }
  id v15 = [(BuddyLocationServicesController *)v35 headerView];
  [v15 setIconInheritsTint:1];

  v16 = v35;
  v17 = +[NSBundle mainBundle];
  id v18 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ENABLE_LOCATION_SERVICES"];
  v19 = [(NSBundle *)v17 localizedStringForKey:v18 value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v16 addBoldButton:v19 action:"_enableButtonTapped:"];

  v20 = v35;
  v21 = +[NSBundle mainBundle];
  id v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DISABLE_LOCATION_SERVICES"];
  v23 = [(NSBundle *)v21 localizedStringForKey:v22 value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v20 addLinkButton:v23 action:"_disableButtonPressed:"];

  id v24 = [(BuddyLocationServicesController *)v35 buttonTray];
  uint64_t v37 = BYPrivacyLocationServicesIdentifier;
  v25 = +[NSArray arrayWithObjects:&v37 count:1];
  [v24 setPrivacyLinkForBundles:v25];

  id v26 = [(BuddyLocationServicesController *)v35 headerView];
  LODWORD(v27) = 1045220557;
  [v26 setTitleHyphenationFactor:v27];

  id v28 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v36[0] = v28;
  id v29 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.0 transitionSpeed:0.7];
  v36[1] = v29;
  v31 = +[NSArray arrayWithObjects:v36 count:2];

  id v30 = [(BuddyLocationServicesController *)v35 buddy_animationController:@"Location" animatedStates:v31 startAtFirstState:1];
  [(BuddyLocationServicesController *)v35 setAnimationController:v30];

  objc_storeStrong((id *)&v31, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyLocationServicesController;
  [(BuddyLocationServicesController *)&v5 viewWillAppear:a3];
  +[BuddyLocationServicesController _setPersistentPresentedKey:0];
  unint64_t v3 = [(BuddyLocationServicesController *)v8 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v3 clearActionForFeature:6];

  id v4 = [(BuddyLocationServicesController *)v8 animationController];
  [(OBAnimationController *)v4 startAnimation];
}

+ (BOOL)controllerNeedsToRun
{
  location[2] = a1;
  location[1] = (id)a2;
  id v6 = (id)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  location[0] = v6;
  char v4 = ([location[0] containsObject:@"location"] ^ 1) & 1;
  char v2 = 0;
  if (!CFPreferencesGetAppBooleanValue(@"LocationServices5Presented", BYBuddyNotBackedUpIdentifier, 0)) {
    char v2 = v4;
  }
  objc_storeStrong(location, 0);
  return v2 & 1;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupLocation;
}

+ (void)skippedByCloudConfig
{
  if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0) {
    +[CLLocationManager setLocationServicesEnabled:](CLLocationManager, "setLocationServicesEnabled:", 0, a2, a1);
  }
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)startOver
{
}

+ (void)_setPersistentPresentedKey:(BOOL)a3
{
  if (a3) {
    CFBooleanRef v3 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v3 = kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"LocationServices5Presented", v3, BYBuddyNotBackedUpIdentifier);
  CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
}

+ (void)setSettingEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5
{
  id v9 = a1;
  SEL v8 = a2;
  BOOL v7 = a3;
  BOOL v6 = a4;
  id v5 = 0;
  objc_storeStrong(&v5, a5);
  +[CLLocationManager setLocationServicesEnabled:v7];
  [v5 stashLocationServicesChoice:v7];
  [v9 _setPersistentPresentedKey:v6];
  objc_storeStrong(&v5, 0);
}

+ (void)setSettingsFromArchivedPreferences:(id)a3 settingsManager:(id)a4
{
  id v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  if (location[0])
  {
    id v5 = +[CLLocationManager _applyArchivedAuthorizationDecisions:location[0]];
    id v6 = v14;
    id v14 = v5;
  }
  else
  {
    id v7 = +[CLLocationManager sharedManager];
    [v7 resetApps];
  }
  if (v14)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v11 = 0;
      char v9 = 0;
      if (_BYIsInternalInstall())
      {
        SEL v8 = (NSString *)v14;
      }
      else
      {
        id v12 = [v14 domain];
        char v11 = 1;
        SEL v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v12, [v14 code]);
        v10 = v8;
        char v9 = 1;
      }
      sub_10004B238((uint64_t)buf, (uint64_t)v8);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to set location services settings: %@", buf, 0xCu);
      if (v9) {

      }
      if (v11) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    [v15 stashLocationServicesSettings:location[0]];
    [v17 _setPersistentPresentedKey:location[0] != 0];
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_enableButtonTapped:(id)a3
{
  SEL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  CFBooleanRef v3 = objc_opt_class();
  char v4 = [(BuddyLocationServicesController *)v8 settingsManager];
  [v3 setSettingEnabled:1 presented:1 settingsManager:v4];

  id v5 = [(BuddyLocationServicesController *)v8 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:&__kCFBooleanTrue forFeature:6];

  id v6 = [(BuddyWelcomeController *)v8 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v8];

  objc_storeStrong(location, 0);
}

- (void)_disableButtonPressed:(id)a3
{
  uint64_t v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v35 = 0;
  CFBooleanRef v3 = [(BuddyLocationServicesController *)v37 proximitySetupController];
  unsigned __int8 v4 = [(ProximitySetupController *)v3 hasAppliedSettings];

  char v34 = v4 & 1;
  char v32 = 0;
  char v30 = 0;
  BOOL v5 = 0;
  if (v4)
  {
    id v33 = [(BuddyLocationServicesController *)v37 pendingRestoreState];
    char v32 = 1;
    id v31 = [v33 backupItem];
    char v30 = 1;
    BOOL v5 = v31 == 0;
  }
  BOOL v35 = v5;
  if (v30) {

  }
  if (v32) {
  id v29 = 0;
  }
  id v6 = +[NSBundle mainBundle];
  if (v35)
  {
    id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"LOCATION_SERVICES_DISABLED_MESSAGE_FMIP"];
    SEL v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
    id v9 = v29;
    id v29 = v8;
  }
  else
  {
    v10 = [(NSBundle *)v6 localizedStringForKey:@"LOCATION_SERVICES_DISABLED_MESSAGE" value:&stru_1002B4E18 table:@"Localizable"];
    id v11 = v29;
    id v29 = v10;
  }
  id v12 = +[NSBundle mainBundle];
  v13 = [(NSBundle *)v12 localizedStringForKey:@"LOCATION_SERVICES_DISABLED_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  id v28 = +[UIAlertController alertControllerWithTitle:v13 message:v29 preferredStyle:1];

  id v14 = v28;
  id v15 = +[NSBundle mainBundle];
  v16 = [(NSBundle *)v15 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
  id v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  v25 = sub_10014BD84;
  id v26 = &unk_1002B1040;
  double v27 = v37;
  id v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v22];
  [v14 addAction:v17];

  id v18 = v28;
  v19 = +[NSBundle mainBundle];
  v20 = [(NSBundle *)v19 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];
  [v18 addAction:v21];

  [(BuddyLocationServicesController *)v37 presentViewController:v28 animated:1 completion:0];
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
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

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
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