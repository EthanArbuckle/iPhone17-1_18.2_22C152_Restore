@interface BuddyProximitySetupController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)isEphemeral;
- (BOOL)skippedByCloudConfiguration;
- (BYDeviceProvider)deviceProvider;
- (BuddyProximitySetupController)init;
- (ProximitySetupController)proximitySetupController;
- (id)_secondaryGetStartedContentView;
- (int64_t)preferredStatusBarStyle;
- (void)_cloudConfigurationDidChange:(id)a3;
- (void)_setupManuallyTapped:(id)a3;
- (void)_showAccessibilitySettings;
- (void)loadView;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSkippedByCloudConfiguration:(BOOL)a3;
- (void)startOver;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyProximitySetupController

- (BuddyProximitySetupController)init
{
  id v8 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  location[0] = [(NSBundle *)v2 localizedStringForKey:@"PROXIMITY_SETUP_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyProximitySetupController;
  id v8 = [(BuddyProximitySetupController *)&v6 initWithTitle:location[0] detailText:0 icon:0 contentLayout:4];
  v4 = (BuddyProximitySetupController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)loadView
{
  v37 = self;
  SEL v36 = a2;
  v35.receiver = self;
  v35.super_class = (Class)BuddyProximitySetupController;
  [(BuddyProximitySetupController *)&v35 loadView];
  id v34 = (id)MGCopyAnswer();
  id v33 = [[BuddyPosedDeviceView alloc] initWithPairForProductType:v34];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = [(BuddyProximitySetupController *)v37 contentView];
  [v2 addSubview:v33];

  id v3 = [v33 backgroundColor];
  id v4 = [(BuddyProximitySetupController *)v37 contentView];
  [v4 setBackgroundColor:v3];

  id v30 = [(BuddyProximitySetupController *)v37 contentView];
  id v29 = [v30 leftAnchor];
  id v28 = [v33 leftAnchor];
  id v27 = [v29 constraintEqualToAnchor:];
  v38[0] = v27;
  id v26 = [(BuddyProximitySetupController *)v37 contentView];
  id v25 = [v26 topAnchor];
  id v24 = [v33 topAnchor];
  id v5 = [v25 constraintEqualToAnchor:];
  v38[1] = v5;
  id v6 = [(BuddyProximitySetupController *)v37 contentView];
  id v7 = [v6 rightAnchor];
  id v8 = [v33 rightAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v38[2] = v9;
  id v10 = [(BuddyProximitySetupController *)v37 contentView];
  id v11 = [v10 bottomAnchor];
  id v12 = [v33 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v38[3] = v13;
  v14 = +[NSArray arrayWithObjects:v38 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  v15 = v37;
  v16 = +[NSBundle mainBundle];
  v17 = [(NSBundle *)v16 localizedStringForKey:@"PROXIMITY_SETUP_MANUALLY" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v15 addLinkButton:v17 action:"_setupManuallyTapped:"];

  id v18 = +[BuddyAccessibilityUtilities accessibilityViewController];
  if (v18)
  {
    id location = +[BuddyAccessibilityUtilities navigationBarButton];
    [location addTarget:v37 action:"_showAccessibilitySettings" forControlEvents:64];
    id v19 = +[BuddyAccessibilityUtilities navigationBarButtonItemWithButton:location];
    id v20 = [(BuddyProximitySetupController *)v37 navigationItem];
    [v20 setRightBarButtonItem:v19];

    objc_storeStrong(&location, 0);
  }
  v21 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v21 addObserver:v37 selector:"_cloudConfigurationDidChange:" name:MCCloudConfigurationDidChangeNotification object:0];

  id v31 = [(BuddyProximitySetupController *)v37 _secondaryGetStartedContentView];
  id v22 = [(BuddyProximitySetupController *)v37 secondaryContentView];
  [v22 addSubview:v31];

  id v23 = [(BuddyProximitySetupController *)v37 secondaryContentView];
  [v31 pinToEdges:v23];

  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyProximitySetupController;
  [(BuddyProximitySetupController *)&v6 viewDidAppear:a3];
  id v3 = [(BuddyProximitySetupController *)v9 proximitySetupController];
  [(ProximitySetupController *)v3 setUserSkippedProximity:0];

  if ([(BuddyProximitySetupController *)v9 isMovingToParentViewController])
  {
    id v4 = [(BuddyProximitySetupController *)v9 proximitySetupController];
    [(ProximitySetupController *)v4 setIntentToMigrate:0];
  }
  if (([(BuddyProximitySetupController *)v9 isMovingFromParentViewController] & 1) == 0)
  {
    id v5 = [(BuddyProximitySetupController *)v9 proximitySetupController];
    [(ProximitySetupController *)v5 beginAdvertisingProximitySetup];
  }
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = [(BuddyProximitySetupController *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (v3 == (id)2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)_showAccessibilitySettings
{
  id v3 = self;
  location[1] = (id)a2;
  location[0] = +[BuddyAccessibilityUtilities accessibilityViewController];
  if (location[0]) {
    [(BuddyProximitySetupController *)v3 presentViewController:location[0] animated:1 completion:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_cloudConfigurationDidChange:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_1000DCF50;
  SEL v8 = &unk_1002B0D20;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_setupManuallyTapped:(id)a3
{
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximitySetupController *)v7 proximitySetupController];
  [(ProximitySetupController *)v3 setUserSkippedProximity:1];

  id v4 = [(BuddyProximitySetupController *)v7 proximitySetupController];
  [(ProximitySetupController *)v4 setIntentToMigrate:0];

  int v5 = [(BuddyWelcomeController *)v7 delegate];
  [(BFFFlowItemDelegate *)v5 flowItemDone:v7];

  objc_storeStrong(location, 0);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTapToSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_1000DD334;
  SEL v8 = &unk_1002B1780;
  id v10 = location[0];
  id v9 = v12;
  dispatch_async(v3, &block);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerAllowsNavigatingBack
{
  id v2 = [(BuddyProximitySetupController *)self proximitySetupController];
  char v3 = ![(ProximitySetupController *)v2 hasAppliedSettings];

  return v3 & 1;
}

- (void)startOver
{
  id v2 = [(BuddyProximitySetupController *)self proximitySetupController];
  [(ProximitySetupController *)v2 setUserSkippedProximity:0];

  char v3 = [(BuddyProximitySetupController *)self proximitySetupController];
  [(ProximitySetupController *)v3 setIntentToMigrate:0];
}

- (BOOL)isEphemeral
{
  return [(BuddyProximitySetupController *)self skippedByCloudConfiguration];
}

- (id)_secondaryGetStartedContentView
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[BuddyGetStartedSecondaryContentView initWithFrame:]([BuddyGetStartedSecondaryContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [location[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
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

- (BOOL)skippedByCloudConfiguration
{
  return self->_skippedByCloudConfiguration;
}

- (void)setSkippedByCloudConfiguration:(BOOL)a3
{
  self->_skippedByCloudConfiguration = a3;
}

- (void).cxx_destruct
{
}

@end