@interface BuddySafetyController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BOOL)controllerNeedsToRun;
- (BYCapabilities)capabilities;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddySafetyController)init;
- (CoreTelephonyClient)coreTelephonyClient;
- (OS_dispatch_queue)stewieSupportQueue;
- (void)_continueTapped;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setRunState:(id)a3;
- (void)setStewieSupportQueue:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddySafetyController

- (BuddySafetyController)init
{
  SEL v15 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"SAFETY_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"SAFETY_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v14.receiver = self;
  v14.super_class = (Class)BuddySafetyController;
  id location = [(BuddySafetyController *)&v14 initWithTitle:v4 detailText:v6 symbolName:0];
  objc_storeStrong(&location, location);

  v7 = dispatch_get_global_queue(0, 0);
  v8 = (void *)*((void *)location + 5);
  *((void *)location + 5) = v7;

  id v9 = objc_alloc((Class)CoreTelephonyClient);
  id v10 = [v9 initWithQueue:*((void *)location + 5)];
  v11 = (void *)*((void *)location + 6);
  *((void *)location + 6) = v10;

  v12 = (BuddySafetyController *)location;
  objc_storeStrong(&location, 0);
  return v12;
}

- (void)viewDidLoad
{
  v41 = self;
  SEL v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)BuddySafetyController;
  [(BuddySafetyController *)&v39 viewDidLoad];
  v2 = v41;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"_continueTapped"];

  id v38 = +[UIImage imageNamed:@"d3x.arrows.left.and.right"];
  if (SBUIIsSystemApertureEnabled())
  {
    v5 = +[UIImage imageNamed:@"d7x.arrows.left.and.right"];
    id v6 = v38;
    id v38 = v5;
  }
  v7 = v41;
  v8 = +[NSBundle mainBundle];
  id v9 = [(NSBundle *)v8 localizedStringForKey:@"PRESS_HOLD_TO_CALL_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  id v10 = +[NSBundle mainBundle];
  v11 = [(NSBundle *)v10 localizedStringForKey:@"PRESS_HOLD_TO_CALL_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddySafetyController *)v7 addBulletedListItemWithTitle:v9 description:v11 image:v38];

  v12 = [(BuddySafetyController *)v41 capabilities];
  LOBYTE(v7) = [(BYCapabilities *)v12 supportsKappaDetection];

  if (v7)
  {
    v13 = v41;
    objc_super v14 = +[NSBundle mainBundle];
    SEL v15 = [(NSBundle *)v14 localizedStringForKey:@"CAR_CRASH_DETECTION_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v16 = +[NSBundle mainBundle];
    v17 = [(NSBundle *)v16 localizedStringForKey:@"CAR_CRASH_DETECTION_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
    v18 = +[UIImage systemImageNamed:@"car"];
    [(BuddySafetyController *)v13 addBulletedListItemWithTitle:v15 description:v17 image:v18];
  }
  id location = 0;
  v19 = [(BuddySafetyController *)v41 coreTelephonyClient];
  id obj = 0;
  id v20 = [(CoreTelephonyClient *)v19 getStewieSupport:&obj];
  objc_storeStrong(&location, obj);
  BOOL v21 = 0;
  if ([v20 hwSupport]) {
    BOOL v21 = location == 0;
  }

  if (v21)
  {
    v22 = v41;
    v23 = +[NSBundle mainBundle];
    v24 = [(NSBundle *)v23 localizedStringForKey:@"SATELLITE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v25 = +[NSBundle mainBundle];
    v26 = [(NSBundle *)v25 localizedStringForKey:@"SATELLITE_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
    id v27 = +[UIImage _systemImageNamed:@"satellite"];
    [(BuddySafetyController *)v22 addBulletedListItemWithTitle:v24 description:v26 image:v27];
  }
  else if (location)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v33 = 0;
      char v31 = 0;
      if (_BYIsInternalInstall())
      {
        v28 = (NSString *)location;
      }
      else if (location)
      {
        id v34 = [location domain];
        char v33 = 1;
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v34, [location code]);
        v32 = v28;
        char v31 = 1;
      }
      else
      {
        v28 = 0;
      }
      sub_10004B238((uint64_t)buf, (uint64_t)v28);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Error fetching Bifrost availibility %@", buf, 0xCu);
      if (v31) {

      }
      if (v33) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v29 = [(BuddySafetyController *)v41 buttonTray];
  uint64_t v42 = BYPrivacySafetyFeaturesIdentifier;
  v30 = +[NSArray arrayWithObjects:&v42 count:1];
  [v29 setPrivacyLinkForBundles:v30];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
}

- (void)_continueTapped
{
  v2 = [(BuddySafetyController *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanTrue forKey:@"SafetyPresented"];

  v3 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSafety;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] runState];
  unsigned __int8 v4 = [v3 hasCompletedInitialRun];

  if ((v4 & 1) == 0)
  {
    id v5 = [location[0] emergencyExecutor];
    [v5 setKappaTriggersEmergencySOS:0];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddySafetyController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 supportsKappaDetection];
  char v6 = 0;
  char v4 = 0;
  if (v3)
  {
    v7 = [(BuddySafetyController *)self buddyPreferences];
    char v6 = 1;
    char v4 = [(BYPreferencesController *)v7 BOOLForKey:@"SafetyPresented"] ^ 1;
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (OS_dispatch_queue)stewieSupportQueue
{
  return self->_stewieSupportQueue;
}

- (void)setStewieSupportQueue:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end