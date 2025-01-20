@interface BuddyBetaReEnrollmentController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFSettingsManager)settingsManager;
- (BOOL)fakeBetaReEnrollment;
- (BOOL)requiresBetaReEnrollment;
- (BYAnalyticsManager)analyticsManager;
- (BYBackupMetadata)backupMetadata;
- (BYPreferencesController)buddyPreferencesInternal;
- (BYSeedProgramManager)seedProgramManager;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyBetaReEnrollmentController)init;
- (BuddyExistingSettings)existingSettings;
- (BuddyMiscState)miscState;
- (BuddyPendingRestoreState)pendingRestoreState;
- (NSString)sourceDeviceClass;
- (NSString)sourceSystemVersion;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (void)_dontEnrollTapped:(id)a3;
- (void)_enrollTapped:(id)a3;
- (void)_learnMoreTapped:(id)a3;
- (void)_presentReEnrollFailureAlert;
- (void)_recordAnalyticsEventForEnrollment:(BOOL)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBackupMetadata:(id)a3;
- (void)setBuddyPreferencesInternal:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setFakeBetaReEnrollment:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRequiresBetaReEnrollment:(BOOL)a3;
- (void)setSeedProgramManager:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
- (void)setSourceDeviceClass:(id)a3;
- (void)setSourceSystemVersion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyBetaReEnrollmentController

- (BuddyBetaReEnrollmentController)init
{
  SEL v21 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"TITLE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
  id location = 0;
  v20.receiver = self;
  v20.super_class = (Class)BuddyBetaReEnrollmentController;
  id location = [(BuddyBetaReEnrollmentController *)&v20 initWithTitle:v4 detailText:@" " icon:0 contentLayout:2];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v5 = +[BYPreferencesController buddyPreferencesInternal];
    [location setBuddyPreferencesInternal:v5];

    [location setRequiresBetaReEnrollment:0];
    id v19 = +[OBHeaderAccessoryButton accessoryButton];
    v6 = +[NSBundle mainBundle];
    v7 = [(NSBundle *)v6 localizedStringForKey:@"LEARN_MORE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    [v19 setTitle:v7 forState:0];

    [v19 addTarget:location action:"_learnMoreTapped:" forControlEvents:64];
    id v8 = [location headerView];
    [v8 addAccessoryButton:v19];

    id v18 = +[OBBoldTrayButton boldButton];
    v9 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v9 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
    [v18 setTitle:v10 forState:0];

    [v18 addTarget:location action:"_enrollTapped:" forControlEvents:64];
    id v11 = [location buttonTray];
    [v11 addButton:v18];

    id v17 = +[OBLinkTrayButton linkButton];
    v12 = +[NSBundle mainBundle];
    v13 = [(NSBundle *)v12 localizedStringForKey:@"DONT_CONTINUE_BETA_PROGRAM" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    [v17 setTitle:v13 forState:0];

    [v17 addTarget:location action:"_dontEnrollTapped:" forControlEvents:64];
    id v14 = [location buttonTray];
    [v14 addButton:v17];

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  v15 = (BuddyBetaReEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)viewDidLoad
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyBetaReEnrollmentController;
  [(BuddyBetaReEnrollmentController *)&v3 viewDidLoad];
  id v2 = [(BuddyBetaReEnrollmentController *)v5 buddy_animationController:@"Update"];
  [(BuddyBetaReEnrollmentController *)v5 setAnimationController:v2];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BuddyBetaReEnrollmentController;
  [(BuddyBetaReEnrollmentController *)&v17 viewWillAppear:a3];
  objc_super v3 = [(BuddyBetaReEnrollmentController *)v20 animationController];
  [(OBAnimationController *)v3 startAnimation];

  if ([(BuddyBetaReEnrollmentController *)v20 requiresBetaReEnrollment])
  {
    SEL v4 = +[NSBundle mainBundle];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DETAIL_START"];
    id v16 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    v6 = +[NSBundle mainBundle];
    v7 = [(BuddyBetaReEnrollmentController *)v20 sourceDeviceClass];
    id v8 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:@"DETAIL_END" deviceClass:v7];
    id location = [(NSBundle *)v6 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    id v9 = [(BuddyBetaReEnrollmentController *)v20 headerView];
    v10 = +[NSString localizedStringWithFormat:@"%@\n\n%@", v16, location];
    [v9 setDetailText:v10];

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v11 = [(BuddyBetaReEnrollmentController *)v20 headerView];
    v12 = +[NSBundle mainBundle];
    id v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DETAIL_START"];
    id v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    [v11 setDetailText:v14];
  }
}

- (void)_learnMoreTapped:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = objc_alloc_init(BuddyBetaReEnrollmentLearnMoreController);
  id v3 = [objc_alloc((Class)BFFNavigationController) initWithRootViewController:v4];
  [v3 setModalPresentationStyle:2];
  [(BuddyBetaReEnrollmentController *)v6 presentViewController:v3 animated:1 completion:0];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_enrollTapped:(id)a3
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyBetaReEnrollmentController *)v24 view];
  id v4 = [v3 window];
  [v4 setUserInteractionEnabled:0];

  id v5 = [(BuddyBetaReEnrollmentController *)v24 navigationController];
  id v6 = [v5 topViewController];
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v6 identifier:@"beta re-enroll spinner"];

  [(BuddyBetaReEnrollmentController *)v24 _recordAnalyticsEventForEnrollment:1];
  v7 = [(BuddyBetaReEnrollmentController *)v24 backupMetadata];
  id v22 = [(BYBackupMetadata *)v7 seedEnrollmentProgram];

  id v8 = [(BuddyBetaReEnrollmentController *)v24 backupMetadata];
  id v21 = [(BYBackupMetadata *)v8 seedEnrollmentAssetAudience];

  id v9 = [(BuddyBetaReEnrollmentController *)v24 backupMetadata];
  id v20 = [(BYBackupMetadata *)v9 seedEnrollmentCatalogID];

  v10 = [(BuddyBetaReEnrollmentController *)v24 seedProgramManager];
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1001F0220;
  v15 = &unk_1002B4CD8;
  id v16 = v24;
  id v17 = v22;
  id v18 = v21;
  id v19 = v20;
  [(BYSeedProgramManager *)v10 enrollInSeedProgramNamed:v22 withAssetAudience:v21 programID:v20 completion:&v11];

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_dontEnrollTapped:(id)a3
{
  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyBetaReEnrollmentController *)v57 requiresBetaReEnrollment])
  {
    id v14 = +[NSBundle mainBundle];
    id v40 = [(NSBundle *)v14 localizedStringForKey:@"DONT_CONTINUE_BETA_PROGRAM_REQUIRED_ALERT_TITLE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    v15 = +[NSBundle mainBundle];
    id v16 = [(BuddyBetaReEnrollmentController *)v57 sourceDeviceClass];
    id v17 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:@"DONT_CONTINUE_BETA_PROGRAM_REQUIRED_ALERT_MESSAGE" deviceClass:v16];
    id v39 = [(NSBundle *)v15 localizedStringForKey:v17 value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    id v38 = +[UIAlertController alertControllerWithTitle:v40 message:v39 preferredStyle:1];
    id v18 = v38;
    id v19 = +[NSBundle mainBundle];
    id v20 = [(NSBundle *)v19 localizedStringForKey:@"CONTINUE_BETA_PROGRAM" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    v32 = _NSConcreteStackBlock;
    int v33 = -1073741824;
    int v34 = 0;
    v35 = sub_1001F0D84;
    v36 = &unk_1002B1040;
    v37 = v57;
    id v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:&v32];
    [v18 addAction:v21];

    id v22 = v38;
    v23 = +[NSBundle mainBundle];
    v24 = [(NSBundle *)v23 localizedStringForKey:@"DONT_CONTINUE_BETA_PROGRAM" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    v26 = _NSConcreteStackBlock;
    int v27 = -1073741824;
    int v28 = 0;
    v29 = sub_1001F0DD8;
    v30 = &unk_1002B1040;
    v31 = v57;
    v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:&v26];
    [v22 addAction:v25];

    [(BuddyBetaReEnrollmentController *)v57 presentViewController:v38 animated:1 completion:0];
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    id v3 = +[NSBundle mainBundle];
    id v55 = [(NSBundle *)v3 localizedStringForKey:@"DONT_CONTINUE_BETA_PROGRAM_OPTIONAL_ALERT_TITLE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    id v4 = +[NSBundle mainBundle];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DONT_CONTINUE_BETA_PROGRAM_OPTIONAL_ALERT_MESSAGE"];
    id v54 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"BetaReEnrollment"];

    id v53 = +[UIAlertController alertControllerWithTitle:v55 message:v54 preferredStyle:1];
    id v6 = v53;
    v7 = +[NSBundle mainBundle];
    id v8 = [(NSBundle *)v7 localizedStringForKey:@"CONTINUE_BETA_PROGRAM" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    v47 = _NSConcreteStackBlock;
    int v48 = -1073741824;
    int v49 = 0;
    v50 = sub_1001F0CB0;
    v51 = &unk_1002B1040;
    v52 = v57;
    id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:&v47];
    [v6 addAction:v9];

    id v10 = v53;
    id v11 = +[NSBundle mainBundle];
    int v12 = [(NSBundle *)v11 localizedStringForKey:@"DONT_CONTINUE_BETA_PROGRAM" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
    v41 = _NSConcreteStackBlock;
    int v42 = -1073741824;
    int v43 = 0;
    v44 = sub_1001F0D04;
    v45 = &unk_1002B1040;
    v46 = v57;
    int v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v41];
    [v10 addAction:v13];

    [(BuddyBetaReEnrollmentController *)v57 presentViewController:v53 animated:1 completion:0];
    objc_storeStrong((id *)&v46, 0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_presentReEnrollFailureAlert
{
  id v8 = self;
  location[1] = (id)a2;
  id v2 = +[NSBundle mainBundle];
  id v3 = [(NSBundle *)v2 localizedStringForKey:@"RE_ENROLL_FAILED_ALERT_TITLE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];
  location[0] = +[UIAlertController alertControllerWithTitle:v3 message:0 preferredStyle:1];

  id v4 = +[NSBundle mainBundle];
  id v5 = [(NSBundle *)v4 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
  id v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:&stru_1002B4CF8];
  [location[0] addAction:v6];

  [(BuddyBetaReEnrollmentController *)v8 presentViewController:location[0] animated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (void)_recordAnalyticsEventForEnrollment:(BOOL)a3
{
  id v3 = [(BuddyBetaReEnrollmentController *)self analyticsManager];
  v9[0] = @"didEnroll";
  id v4 = +[NSNumber numberWithBool:a3];
  v10[0] = v4;
  v9[1] = @"enrollmentRequired";
  id v5 = +[NSNumber numberWithBool:[(BuddyBetaReEnrollmentController *)self requiresBetaReEnrollment]];
  v10[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [(BYAnalyticsManager *)v3 addEvent:@"com.apple.setupassistant.ios.betaEnrollment" withPayload:v6 persist:1];
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1001F135C;
  id v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
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

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (BYSeedProgramManager)seedProgramManager
{
  return self->_seedProgramManager;
}

- (void)setSeedProgramManager:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesInternal
{
  return self->_buddyPreferencesInternal;
}

- (void)setBuddyPreferencesInternal:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (NSString)sourceSystemVersion
{
  return self->_sourceSystemVersion;
}

- (void)setSourceSystemVersion:(id)a3
{
}

- (NSString)sourceDeviceClass
{
  return self->_sourceDeviceClass;
}

- (void)setSourceDeviceClass:(id)a3
{
}

- (BOOL)requiresBetaReEnrollment
{
  return self->_requiresBetaReEnrollment;
}

- (void)setRequiresBetaReEnrollment:(BOOL)a3
{
  self->_requiresBetaReEnrollment = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BOOL)fakeBetaReEnrollment
{
  return self->_fakeBetaReEnrollment;
}

- (void)setFakeBetaReEnrollment:(BOOL)a3
{
  self->_fakeBetaReEnrollment = a3;
}

- (BYBackupMetadata)backupMetadata
{
  return self->_backupMetadata;
}

- (void)setBackupMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end