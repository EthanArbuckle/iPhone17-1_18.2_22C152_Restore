@interface BuddyMandatoryUpdateController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)_isDEP;
- (BOOL)_updateIsOptional;
- (BYAnalyticsManager)analyticsManager;
- (BYDeviceProvider)deviceProvider;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyMandatoryUpdateController)init;
- (BuddyNetworkProvider)networkProvider;
- (MCProfileConnection)managedConfiguration;
- (NSTimer)autoInstallTimer;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (SUDescriptor)update;
- (SUScanOptions)mdmUpdateOptions;
- (id)_autoInstallAlertMessageForTimeRemaining:(int64_t)a3;
- (id)_makeLearnMoreButton;
- (id)_updateHumanReadableName;
- (int64_t)autoInstallTimeRemaining;
- (void)_beginInstall;
- (void)_learnMoreTapped:(id)a3;
- (void)_showAutoInstallAlert;
- (void)_updateLaterTapped:(id)a3;
- (void)_updateNowTapped:(id)a3;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAutoInstallTimeRemaining:(int64_t)a3;
- (void)setAutoInstallTimer:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMdmUpdateOptions:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
- (void)setUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMandatoryUpdateController

- (BuddyMandatoryUpdateController)init
{
  SEL v8 = a2;
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MANDATORY_UPDATE_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMandatoryUpdateController;
  id location = [(BuddyMandatoryUpdateController *)&v7 initWithTitle:v4 detailText:0 icon:0];
  objc_storeStrong(&location, location);

  v5 = (BuddyMandatoryUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  v29 = self;
  SEL v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)BuddyMandatoryUpdateController;
  [(BuddyMandatoryUpdateController *)&v27 loadView];
  id location = 0;
  id v25 = [(BuddyMandatoryUpdateController *)v29 _updateHumanReadableName];
  if ([(BuddyMandatoryUpdateController *)v29 _updateIsOptional])
  {
    objc_storeStrong(&location, @"MANDATORY_UPDATE_SUBTITLE_OPTIONAL_WITH_UPDATE");
  }
  else
  {
    v2 = [(BuddyMandatoryUpdateController *)v29 mdmUpdateOptions];

    if (v2)
    {
      objc_storeStrong(&location, @"MANDATORY_UPDATE_SUBTITLE_MDM");
    }
    else if (v25)
    {
      objc_storeStrong(&location, @"MANDATORY_UPDATE_SUBTITLE_MANDATORY_WITH_UPDATE");
    }
    else
    {
      objc_storeStrong(&location, @"MANDATORY_UPDATE_SUBTITLE_MANDATORY");
    }
  }
  id v24 = 0;
  v3 = [(BuddyMandatoryUpdateController *)v29 update];
  id v4 = [(SUDescriptor *)v3 documentation];
  id v5 = [v4 mandatoryUpdateBodyString];

  if (v5)
  {
    v6 = [(BuddyMandatoryUpdateController *)v29 update];
    id v7 = [(NSBundle *)v6 documentation];
    id v8 = [v7 mandatoryUpdateBodyString];
    id v9 = v24;
    id v24 = v8;
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location];
    v11 = [(NSBundle *)v6 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v25);
    id v13 = v24;
    id v24 = v12;
  }
  id v14 = [(BuddyMandatoryUpdateController *)v29 headerView];
  [v14 setDetailText:v24];

  v15 = v29;
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [(NSBundle *)v16 localizedStringForKey:@"MANDATORY_UPDATE_INSTALL_NOW" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  [(BuddyWelcomeController *)v15 addBoldButton:v17 action:"_updateNowTapped:"];

  if ([(BuddyMandatoryUpdateController *)v29 _updateIsOptional])
  {
    v18 = v29;
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [(NSBundle *)v19 localizedStringForKey:@"MANDATORY_UPDATE_INSTALL_LATER" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    [(BuddyWelcomeController *)v18 addLinkButton:v20 action:"_updateLaterTapped:"];
  }
  v21 = [(BuddyMandatoryUpdateController *)v29 mdmUpdateOptions];

  if (v21)
  {
    id v22 = [(BuddyMandatoryUpdateController *)v29 headerView];
    id v23 = [(BuddyMandatoryUpdateController *)v29 _makeLearnMoreButton];
    [v22 addAccessoryButton:v23];
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewDidLoad
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateController;
  [(BuddyMandatoryUpdateController *)&v3 viewDidLoad];
  id v2 = [(BuddyMandatoryUpdateController *)v5 buddy_animationController:@"Update"];
  [(BuddyMandatoryUpdateController *)v5 setAnimationController:v2];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateController;
  [(BuddyMandatoryUpdateController *)&v4 viewWillAppear:a3];
  objc_super v3 = [(BuddyMandatoryUpdateController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMandatoryUpdateController;
  [(BuddyMandatoryUpdateController *)&v6 viewDidAppear:a3];
  if ([(BuddyMandatoryUpdateController *)v9 isMovingToParentViewController])
  {
    char v4 = 0;
    BOOL v3 = 0;
    if ([(BuddyMandatoryUpdateController *)v9 _isDEP])
    {
      BOOL v5 = [(BuddyMandatoryUpdateController *)v9 mdmUpdateOptions];
      char v4 = 1;
      BOOL v3 = v5 == 0;
    }
    if (v4) {

    }
    if (v3) {
      [(BuddyMandatoryUpdateController *)v9 _showAutoInstallAlert];
    }
  }
}

- (void)_updateLaterTapped:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

- (void)_updateNowTapped:(id)a3
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyMandatoryUpdateController *)v25 networkProvider];
  unsigned __int8 v4 = [(BuddyNetworkProvider *)v3 networkReachable];

  if (v4)
  {
    [(BuddyMandatoryUpdateController *)v25 _beginInstall];
  }
  else
  {
    BOOL v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = (id)SFLocalizableWAPIStringKeyForKey();
    BOOL v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    id v23 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:1];

    id v8 = v23;
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = (id)SFLocalizableWAPIStringKeyForKey();
    v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    v20 = sub_10016F4DC;
    v21 = &unk_1002B1040;
    id v22 = v25;
    v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&v17];
    [v8 addAction:v12];

    id v13 = v23;
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [(NSBundle *)v14 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
    [v13 addAction:v16];

    [(BuddyMandatoryUpdateController *)v25 presentViewController:v23 animated:1 completion:0];
    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_learnMoreTapped:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [BuddyMandatoryUpdateAboutController alloc];
  unsigned __int8 v4 = [(BuddyMandatoryUpdateController *)v8 mdmUpdateOptions];
  id v6 = [(BuddyMandatoryUpdateAboutController *)v3 initWithScanOptions:v4];

  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [v5 setModalPresentationStyle:2];
  [(BuddyMandatoryUpdateController *)v8 presentViewController:v5 animated:1 completion:0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)_makeLearnMoreButton
{
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = +[OBHeaderAccessoryButton accessoryButton];
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [(NSBundle *)v2 localizedStringForKey:@"MANDATORY_UPDATE_LEARN_MORE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  [location[0] setTitle:v3 forState:0];

  [location[0] addTarget:v7 action:"_learnMoreTapped:" forControlEvents:64];
  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_updateHumanReadableName
{
  BOOL v7 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyMandatoryUpdateController *)self update];
  location[0] = [(SUDescriptor *)v2 humanReadableUpdateName];

  if (location[0])
  {
    id v8 = location[0];
  }
  else
  {
    BOOL v3 = [(BuddyMandatoryUpdateController *)v7 mdmUpdateOptions];
    id v8 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:v3];
  }
  objc_storeStrong(location, 0);
  id v4 = v8;

  return v4;
}

- (BOOL)_updateIsOptional
{
  id v2 = [(BuddyMandatoryUpdateController *)self update];
  unsigned __int8 v3 = [(SUDescriptor *)v2 mandatoryUpdateOptional];
  char v6 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    BOOL v7 = [(BuddyMandatoryUpdateController *)self mdmUpdateOptions];
    char v6 = 1;
    BOOL v4 = v7 == 0;
  }
  BOOL v9 = v4;
  if (v6) {

  }
  return v9;
}

- (void)_showAutoInstallAlert
{
  SEL v28 = self;
  v27[1] = (id)a2;
  [(BuddyMandatoryUpdateController *)self setAutoInstallTimeRemaining:60];
  v27[0] = [(BuddyMandatoryUpdateController *)v28 _autoInstallAlertMessageForTimeRemaining:[(BuddyMandatoryUpdateController *)v28 autoInstallTimeRemaining]];
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v3 = [(NSBundle *)v2 localizedStringForKey:@"MANDATORY_UPDATE_AUTO_ALERT_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id location = +[UIAlertController alertControllerWithTitle:v3 message:v27[0] preferredStyle:1];

  id v4 = location;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  char v6 = [(NSBundle *)v5 localizedStringForKey:@"MANDATORY_UPDATE_AUTO_ALERT_BUTTON_INSTALL_NOW" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  id v23 = sub_10016FCB8;
  id v24 = &unk_1002B1040;
  id v25 = v28;
  BOOL v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:&v20];
  [v4 addAction:v7];

  id v8 = location;
  BOOL v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [(NSBundle *)v9 localizedStringForKey:@"MANDATORY_UPDATE_AUTO_ALERT_BUTTON_LATER" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&stru_1002B3DF8];
  [v8 addAction:v11];

  [(BuddyMandatoryUpdateController *)v28 presentViewController:location animated:1 completion:0];
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  v16 = sub_10016FD50;
  v17 = &unk_1002B3E20;
  int v18 = v28;
  id v19 = location;
  v12 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v13 block:1.0];
  [(BuddyMandatoryUpdateController *)v28 setAutoInstallTimer:v12];

  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v27, 0);
}

- (id)_autoInstallAlertMessageForTimeRemaining:(int64_t)a3
{
  v12 = self;
  SEL v11 = a2;
  int64_t v10 = a3;
  id location = (id)objc_opt_new();
  [location setUnitsStyle:3];
  [location setAllowedUnits:128];
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(NSBundle *)v3 localizedStringForKey:@"MANDATORY_UPDATE_AUTO_ALERT_MESSAGE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v5 = [(BuddyMandatoryUpdateController *)v12 _updateHumanReadableName];
  id v6 = [location stringFromTimeInterval:(double)v10];
  BOOL v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6);

  objc_storeStrong(&location, 0);

  return v7;
}

- (void)_beginInstall
{
  v17 = self;
  v16[1] = (id)a2;
  id v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  int v14 = sub_1001701E0;
  int v15 = &unk_1002B0D20;
  v16[0] = v17;
  dispatch_async(v2, &block);

  char v10 = [(BuddyMandatoryUpdateController *)v17 _isDEP];
  unsigned __int8 v3 = [BuddyMandatoryUpdateProgressController alloc];
  char v4 = ![(BuddyMandatoryUpdateController *)v17 _updateIsOptional];
  id v5 = [(BuddyMandatoryUpdateController *)v17 mdmUpdateOptions];
  id location = [(BuddyMandatoryUpdateProgressController *)v3 initWithAllowCellularOverride:v4 & 1 bypassTermsAndConditions:v10 & 1 updateOptions:v5];

  id v6 = [(BuddyMandatoryUpdateController *)v17 deviceProvider];
  [location setDeviceProvider:v6];

  BOOL v7 = [(BuddyWelcomeController *)v17 delegate];
  [location setDelegate:v7];

  id v8 = [(BuddyMandatoryUpdateController *)v17 navigationController];
  [v8 pushViewController:location animated:1];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
}

- (BOOL)_isDEP
{
  id v2 = [(BuddyMandatoryUpdateController *)self managedConfiguration];
  unsigned __int8 v3 = [(MCProfileConnection *)v2 activationRecordIndicatesCloudConfigurationIsAvailable];

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    unsigned __int8 v3 = dispatch_get_global_queue(25, 0);
    char v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    BOOL v7 = sub_1001703FC;
    id v8 = &unk_1002B1780;
    id v10 = location[0];
    BOOL v9 = v13;
    dispatch_async(v3, &v4);

    objc_storeStrong((id *)&v9, 0);
    objc_storeStrong(&v10, 0);
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (SUScanOptions)mdmUpdateOptions
{
  return self->_mdmUpdateOptions;
}

- (void)setMdmUpdateOptions:(id)a3
{
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdate:(id)a3
{
}

- (int64_t)autoInstallTimeRemaining
{
  return self->_autoInstallTimeRemaining;
}

- (void)setAutoInstallTimeRemaining:(int64_t)a3
{
  self->_autoInstallTimeRemaining = a3;
}

- (NSTimer)autoInstallTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAutoInstallTimer:(id)a3
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