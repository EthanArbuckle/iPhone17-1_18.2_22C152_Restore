@interface BuddyProximityExpressController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerAllowsNavigatingBack;
- (ProximitySetupController)proximitySetupController;
- (void)_nextTapped;
- (void)_showAccessibilitySettings;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyProximityExpressController

- (void)viewDidLoad
{
  v42 = self;
  SEL v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)BuddyProximityExpressController;
  [(BuddyProximityExpressController *)&v40 viewDidLoad];
  id v39 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v39 setText:@"FPO"];
  [v39 setTextAlignment:1];
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v39 setFont:v2];

  id v38 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v38 setText:@"Bring other iPhone nearby"];
  [v38 setTextAlignment:1];
  id v3 = [(BuddyProximityExpressController *)v42 view];
  [v3 addSubview:v39];

  id v4 = [(BuddyProximityExpressController *)v42 view];
  [v4 addSubview:v38];

  id v33 = [v39 centerYAnchor];
  id v34 = [(BuddyProximityExpressController *)v42 view];
  id v32 = [v34 centerYAnchor];
  id v31 = [v33 constraintEqualToAnchor:];
  v43[0] = v31;
  id v29 = [v39 leadingAnchor];
  id v30 = [(BuddyProximityExpressController *)v42 view];
  id v28 = [v30 leadingAnchor];
  id v27 = [v29 constraintEqualToAnchor:];
  v43[1] = v27;
  id v25 = [v39 trailingAnchor];
  id v26 = [(BuddyProximityExpressController *)v42 view];
  id v24 = [v26 trailingAnchor];
  id v23 = [v25 constraintEqualToAnchor:];
  v43[2] = v23;
  id v21 = [v38 leadingAnchor];
  id v22 = [(BuddyProximityExpressController *)v42 view];
  id v20 = [v22 leadingAnchor];
  id v5 = [v21 constraintEqualToAnchor:];
  v43[3] = v5;
  id v6 = [v38 trailingAnchor];
  id v7 = [(BuddyProximityExpressController *)v42 view];
  id v8 = [v7 trailingAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  v43[4] = v9;
  id v10 = [(BuddyProximityExpressController *)v42 view];
  id v11 = [v10 bottomAnchor];
  id v12 = [v38 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:100.0];
  v43[5] = v13;
  v14 = +[NSArray arrayWithObjects:v43 count:6];
  +[NSLayoutConstraint activateConstraints:v14];

  id v15 = +[BuddyAccessibilityUtilities accessibilityViewController];
  if (v15)
  {
    id v37 = +[BuddyAccessibilityUtilities navigationBarButton];
    id location = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v37];
    [location setStyle:0];
    [v37 addTarget:v42 action:"_showAccessibilitySettings" forControlEvents:64];
    id v16 = [(BuddyProximityExpressController *)v42 navigationItem];
    [v16 setLeftBarButtonItem:location];

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v37, 0);
  }
  id v35 = +[UIImage systemImageNamed:@"chevron.right.circle"];
  id v17 = objc_alloc((Class)UIBarButtonItem);
  id v18 = [v17 initWithImage:v35 style:0 target:v42 action:"_nextTapped"];
  id v19 = [(BuddyProximityExpressController *)v42 navigationItem];
  [v19 setRightBarButtonItem:v18];

  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
}

- (void)_showAccessibilitySettings
{
  id v3 = self;
  location[1] = (id)a2;
  location[0] = +[BuddyAccessibilityUtilities accessibilityViewController];
  if (location[0]) {
    [(BuddyProximityExpressController *)v3 presentViewController:location[0] animated:1 completion:0];
  }
  objc_storeStrong(location, 0);
}

- (void)_nextTapped
{
  v2 = [(BuddyProximityExpressController *)self delegate];
  [(BFFFlowItemDelegate *)v2 flowItemDone:self];
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
  id v7 = sub_1001220A0;
  id v8 = &unk_1002B1780;
  id v10 = location[0];
  id v9 = v12;
  dispatch_async(v3, &block);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerAllowsNavigatingBack
{
  v2 = [(BuddyProximityExpressController *)self proximitySetupController];
  char v3 = ![(ProximitySetupController *)v2 hasAppliedSettings];

  return v3 & 1;
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

- (void)setProximitySetupController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end