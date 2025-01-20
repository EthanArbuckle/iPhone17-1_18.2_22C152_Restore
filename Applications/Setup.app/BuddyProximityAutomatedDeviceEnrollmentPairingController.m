@interface BuddyProximityAutomatedDeviceEnrollmentPairingController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BOOL)isLandscape;
- (BOOL)shouldAllowStartOver;
- (BuddyProximityAutomatedDeviceEnrollmentController)enrollmentController;
- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController;
- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)priorDelegate;
- (BuddyProximityAutomatedDeviceEnrollmentPairingController)initWithPairingCode:(id)a3;
- (BuddyProximityBackingViewController)backingViewController;
- (NSString)pairingCode;
- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToDismissPairingWithError:(id)a4;
- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToEnrollmentWithInitialViewModel:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPriorDelegate:(id)a3;
- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyProximityAutomatedDeviceEnrollmentPairingController

- (BuddyProximityAutomatedDeviceEnrollmentPairingController)initWithPairingCode:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v13;
  id v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  id v13 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)&v11 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v10 = objc_alloc_init(BuddyProximityAutomatedDeviceEnrollmentStringProvider);
    v4 = [[BuddyProximityBackingViewController alloc] initWithStringProvider:v10];
    v5 = (void *)*((void *)v13 + 5);
    *((void *)v13 + 5) = v4;

    [*((id *)v13 + 5) setPairingCode:location[0]];
    v6 = +[NSLocale currentLocale];
    v7 = [(NSLocale *)v6 localeIdentifier];
    [*((id *)v13 + 5) setLanguage:v7];

    objc_storeStrong((id *)&v10, 0);
  }
  v8 = (BuddyProximityAutomatedDeviceEnrollmentPairingController *)v13;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)viewDidLoad
{
  v31 = self;
  SEL v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)&v29 viewDidLoad];
  id location = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 backingViewController];
  [location loadViewIfNeeded];
  id v2 = [location view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 addChildViewController:location];
  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  id v4 = [location view];
  [v3 addSubview:v4];

  [location didMoveToParentViewController:v31];
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  [v5 layoutIfNeeded];

  id v27 = [location view];
  id v25 = [v27 leadingAnchor];
  id v26 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  id v24 = [v26 leadingAnchor];
  id v23 = [v25 constraintEqualToAnchor:];
  v32[0] = v23;
  id v22 = [location view];
  id v20 = [v22 trailingAnchor];
  id v21 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  id v19 = [v21 trailingAnchor];
  id v18 = [v20 constraintEqualToAnchor:];
  v32[1] = v18;
  id v17 = [location view];
  id v16 = [v17 topAnchor];
  id v6 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  id v7 = [v6 safeAreaLayoutGuide];
  id v8 = [v7 topAnchor];
  id v9 = [v16 constraintEqualToAnchor:v8];
  v32[2] = v9;
  id v10 = [location view];
  id v11 = [v10 bottomAnchor];
  id v12 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v31 view];
  id v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v32[3] = v14;
  v15 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  objc_storeStrong(&location, 0);
}

- (void)viewDidLayoutSubviews
{
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)&v4 viewDidLayoutSubviews];
  id v2 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v6 backingViewController];
  id v3 = [(BuddyProximityBackingViewController *)v2 view];
  [v3 layoutIfNeeded];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)&v6 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v7];
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v9 view];
  [v5 setNeedsLayout];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v8 = a3;
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5.receiver = v7;
  v5.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  objc_super v4 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v7 backingViewController];
  -[BuddyProximityBackingViewController viewWillTransitionToSize:withTransitionCoordinator:](v4, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);

  objc_storeStrong(location, 0);
}

- (BOOL)isLandscape
{
  id v2 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)self navigationController];
  id v3 = [v2 view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  BOOL v6 = sub_10011A624((uint64_t)[v5 interfaceOrientation]);

  return v6;
}

- (NSString)pairingCode
{
  id v2 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)self backingViewController];
  id v3 = [(BuddyProximityBackingViewController *)v2 pairingCode];

  return v3;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_proximityAutomatedDeviceEnrollmentController, location[0]);
  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v7->_proximityAutomatedDeviceEnrollmentController delegate];
  [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v7 setPriorDelegate:v3];

  [(BuddyProximityAutomatedDeviceEnrollmentController *)v7->_proximityAutomatedDeviceEnrollmentController setDelegate:v7];
  proximityAutomatedDeviceEnrollmentController = v7->_proximityAutomatedDeviceEnrollmentController;
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v7 backingViewController];
  [(BuddyProximityBackingViewController *)v5 setDelegate:proximityAutomatedDeviceEnrollmentController];

  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToDismissPairingWithError:(id)a4
{
  id v14 = self;
  SEL aSelector = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  if (v11)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(aSelector);
      id v5 = [v11 debugDescription];
      sub_10004CECC((uint64_t)buf, (uint64_t)v8, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v9, "%{public}@ %{public}@", buf, 0x16u);

      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    BOOL v6 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v14 priorDelegate];
    [location setDelegate:v6];
  }
  id v7 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v14 delegate];
  [(BFFFlowItemDelegate *)v7 presentWiFiPaneForFlowItem:v14];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToEnrollmentWithInitialViewModel:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentPairingController *)v8 delegate];
  [(BFFFlowItemDelegate *)v5 flowItemDone:v8];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 30;
}

- (BOOL)controllerNeedsToRun
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BuddyProximityAutomatedDeviceEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)priorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_priorDelegate);

  return (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *)WeakRetained;
}

- (void)setPriorDelegate:(id)a3
{
}

- (BuddyProximityBackingViewController)backingViewController
{
  return self->_backingViewController;
}

- (void).cxx_destruct
{
}

@end