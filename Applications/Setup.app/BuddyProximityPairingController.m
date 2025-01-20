@interface BuddyProximityPairingController
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)isEphemeral;
- (BOOL)isLandscape;
- (BOOL)isShowingVisualPairing;
- (BOOL)nonUserInitiatedDismissal;
- (BOOL)shouldAllowStartOver;
- (BuddyProximityBackingViewController)proxBackingController;
- (BuddyProximityPairingController)init;
- (NSString)language;
- (NSString)pairingCode;
- (ProximitySetupController)proximitySetupController;
- (void)prepareForLanguageChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNonUserInitiatedDismissal:(BOOL)a3;
- (void)setPairingCode:(id)a3;
- (void)setProxBackingController:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)showPairingCode;
- (void)showVisualPairing;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyProximityPairingController

- (BuddyProximityPairingController)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyProximityPairingController;
  id location = [(BuddyProximityPairingController *)&v7 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v6 = objc_alloc_init(BuddyProximityPairingControllerStringProvider);
    v2 = [[BuddyProximityBackingViewController alloc] initWithStringProvider:v6];
    v3 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v2;

    objc_storeStrong(&v6, 0);
  }
  v4 = (BuddyProximityPairingController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  v42 = self;
  SEL v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)BuddyProximityPairingController;
  [(BuddyProximityPairingController *)&v40 viewDidLoad];
  id v2 = [(BuddyProximityPairingController *)v42 parentViewController];

  if (v2)
  {
    id v3 = [(BuddyProximityPairingController *)v42 parentViewController];
    v4 = [(BuddyProximityPairingController *)v42 proxBackingController];
    [v3 addChildViewController:v4];
  }
  else
  {
    v5 = v42;
    id v6 = [(BuddyProximityPairingController *)v42 proxBackingController];
    [(BuddyProximityPairingController *)v5 addChildViewController:v6];
  }
  objc_super v7 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v8 = [(BuddyProximityBackingViewController *)v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(BuddyProximityPairingController *)v42 view];
  v10 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v11 = [(BuddyProximityBackingViewController *)v10 view];
  [v9 addSubview:v11];

  v12 = [(BuddyProximityPairingController *)v42 proxBackingController];
  [(BuddyProximityBackingViewController *)v12 didMoveToParentViewController:v42];

  id v13 = [(BuddyProximityPairingController *)v42 view];
  [v13 layoutIfNeeded];

  v39 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v38 = [(BuddyProximityBackingViewController *)v39 view];
  id v36 = [v38 leadingAnchor];
  id v37 = [(BuddyProximityPairingController *)v42 view];
  id v35 = [v37 leadingAnchor];
  id v34 = [v36 constraintEqualToAnchor:];
  v43[0] = v34;
  v33 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v32 = [(BuddyProximityBackingViewController *)v33 view];
  id v30 = [v32 trailingAnchor];
  id v31 = [(BuddyProximityPairingController *)v42 view];
  id v29 = [v31 trailingAnchor];
  id v28 = [v30 constraintEqualToAnchor:];
  v43[1] = v28;
  v27 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v26 = [(BuddyProximityBackingViewController *)v27 view];
  id v24 = [v26 bottomAnchor];
  id v25 = [(BuddyProximityPairingController *)v42 view];
  id v14 = [v25 bottomAnchor];
  id v15 = [v24 constraintEqualToAnchor:v14];
  v43[2] = v15;
  v16 = [(BuddyProximityPairingController *)v42 proxBackingController];
  id v17 = [(BuddyProximityBackingViewController *)v16 view];
  id v18 = [v17 topAnchor];
  id v19 = [(BuddyProximityPairingController *)v42 view];
  id v20 = [v19 safeAreaLayoutGuide];
  id v21 = [v20 topAnchor];
  id v22 = [v18 constraintEqualToAnchor:v21];
  v43[3] = v22;
  v23 = +[NSArray arrayWithObjects:v43 count:4];
  +[NSLayoutConstraint activateConstraints:v23];
}

- (void)showVisualPairing
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  [(BuddyProximityBackingViewController *)v2 showVisualPairing];
}

- (void)showPairingCode
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  [(BuddyProximityBackingViewController *)v2 showPairingCode];
}

- (void)prepareForLanguageChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityPairingController *)v5 proxBackingController];
  [(BuddyProximityBackingViewController *)v3 prepareForLanguageChange:location[0]];

  objc_storeStrong(location, 0);
}

- (NSString)language
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  id v3 = [(BuddyProximityBackingViewController *)v2 language];

  return v3;
}

- (void)setLanguage:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityPairingController *)v5 proxBackingController];
  [(BuddyProximityBackingViewController *)v3 setLanguage:location[0]];

  objc_storeStrong(location, 0);
}

- (NSString)pairingCode
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  id v3 = [(BuddyProximityBackingViewController *)v2 pairingCode];

  return v3;
}

- (void)setPairingCode:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityPairingController *)v5 proxBackingController];
  [(BuddyProximityBackingViewController *)v3 setPairingCode:location[0]];

  objc_storeStrong(location, 0);
}

- (BOOL)isShowingVisualPairing
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  unsigned __int8 v3 = [(BuddyProximityBackingViewController *)v2 isShowingVisualPairing];

  return v3 & 1;
}

- (BOOL)nonUserInitiatedDismissal
{
  id v2 = [(BuddyProximityPairingController *)self proxBackingController];
  unsigned __int8 v3 = [(BuddyProximityBackingViewController *)v2 nonUserInitiatedDismissal];

  return v3 & 1;
}

- (void)setNonUserInitiatedDismissal:(BOOL)a3
{
  unsigned __int8 v3 = [(BuddyProximityPairingController *)self proxBackingController];
  [(BuddyProximityBackingViewController *)v3 setNonUserInitiatedDismissal:a3];
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
  v6.super_class = (Class)BuddyProximityPairingController;
  [(BuddyProximityPairingController *)&v6 willTransitionToTraitCollection:location[0] withTransitionCoordinator:v7];
  id v5 = [(BuddyProximityPairingController *)v9 view];
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
  v5.super_class = (Class)BuddyProximityPairingController;
  -[BuddyProximityPairingController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  v4 = [(BuddyProximityPairingController *)v7 proxBackingController];
  -[BuddyProximityBackingViewController viewWillTransitionToSize:withTransitionCoordinator:](v4, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);

  objc_storeStrong(location, 0);
}

- (BOOL)isLandscape
{
  id v2 = [(BuddyProximityPairingController *)self navigationController];
  id v3 = [v2 view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  BOOL v6 = sub_1001AE704((uint64_t)[v5 interfaceOrientation]);

  return v6;
}

- (void)setProximitySetupController:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_proximitySetupController, location[0]);
  [(BuddyProximityBackingViewController *)v4->_proxBackingController setDelegate:location[0]];
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)isEphemeral
{
  return 1;
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

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (BuddyProximityBackingViewController)proxBackingController
{
  return self->_proxBackingController;
}

- (void)setProxBackingController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end