@interface BuddyProximityAutomatedDeviceEnrollmentInProgressController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BYDeviceProvider)deviceProvider;
- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController;
- (BuddyProximityAutomatedDeviceEnrollmentInProgressController)init;
- (OBAnimationController)animationController;
- (UILabel)spinnerStatusLabel;
- (void)configureFromViewModel:(id)a3;
- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 hasEnrollmentStatusViewModelUpdate:(id)a4;
- (void)proximityAutomatedDeviceEnrollmentControllerWantsToTransitionToCompletion:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyProximityAutomatedDeviceEnrollmentInProgressController

- (BuddyProximityAutomatedDeviceEnrollmentInProgressController)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  id location = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)&v6 initWithTitle:&stru_1002B4E18 detailText:0 symbolName:0];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = [location buddy_animationController:@"Update"];
    v3 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v2;
  }
  v4 = (BuddyProximityAutomatedDeviceEnrollmentInProgressController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  v39 = self;
  SEL v38 = a2;
  v37.receiver = self;
  v37.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)&v37 viewDidLoad];
  id v2 = v39;
  v3 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 proximityAutomatedDeviceEnrollmentController];
  v4 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v3 currentEnrollmentStatusViewModel];
  [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v2 configureFromViewModel:v4];

  id location = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  [location startAnimating];
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  [v5 addSubview:location];

  objc_super v6 = (UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  spinnerStatusLabel = v39->_spinnerStatusLabel;
  v39->_spinnerStatusLabel = v6;

  [(UILabel *)v39->_spinnerStatusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v39->_spinnerStatusLabel setNumberOfLines:0];
  v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)v39->_spinnerStatusLabel setFont:v8];

  [(UILabel *)v39->_spinnerStatusLabel setTextAlignment:1];
  id v9 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  [v9 addSubview:v39->_spinnerStatusLabel];

  id v34 = [location centerXAnchor];
  id v35 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  id v33 = [v35 centerXAnchor];
  id v32 = [v34 constraintEqualToAnchor:];
  v40[0] = v32;
  id v30 = [location topAnchor];
  id v31 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  id v29 = [v31 topAnchor];
  [v30 constraintEqualToAnchor:];
  v40[1] = v28;
  id v27 = [location widthAnchor];
  id v26 = [v27 constraintEqualToConstant:50.0];
  v40[2] = v26;
  id v25 = [location heightAnchor];
  id v24 = [v25 constraintEqualToConstant:50.0];
  v40[3] = v24;
  id v21 = [(UILabel *)v39->_spinnerStatusLabel leadingAnchor];
  id v23 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  id v22 = [v23 layoutMarginsGuide];
  id v20 = [v22 leadingAnchor];
  id v10 = [v21 constraintEqualToAnchor:];
  v40[4] = v10;
  id v11 = [(UILabel *)v39->_spinnerStatusLabel trailingAnchor];
  id v12 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v39 contentView];
  id v13 = [v12 layoutMarginsGuide];
  id v14 = [v13 trailingAnchor];
  id v15 = [v11 constraintEqualToAnchor:v14];
  v40[5] = v15;
  id v16 = [(UILabel *)v39->_spinnerStatusLabel topAnchor];
  id v17 = [location bottomAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17 constant:20.0];
  v40[6] = v18;
  v19 = +[NSArray arrayWithObjects:v40 count:7];
  +[NSLayoutConstraint activateConstraints:v19];

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  SEL v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)&v4 viewWillAppear:a3];
  v3 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_proximityAutomatedDeviceEnrollmentController, location[0]);
  [(BuddyProximityAutomatedDeviceEnrollmentController *)v4->_proximityAutomatedDeviceEnrollmentController setDelegate:v4];
  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentControllerWantsToTransitionToCompletion:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 hasEnrollmentStatusViewModelUpdate:(id)a4
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v7 configureFromViewModel:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 30;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  id v11 = self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)self proximityAutomatedDeviceEnrollmentController];

  if (v2)
  {
    id v5 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v11 proximityAutomatedDeviceEnrollmentController];
    SEL v6 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v5 completionViewModel];
    BOOL v12 = v6 == 0;
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    char v9 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v3 = oslog[0];
      os_log_type_t v4 = v9;
      sub_10004B24C(v8);
      _os_log_fault_impl((void *)&_mh_execute_header, v3, v4, "proximityAutomatedDeviceEnrollmentController not yet in place when asked -controllerNeedsToRun", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 1;
  }
  return v12;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)configureFromViewModel:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v10 headerView];
  id v4 = [location[0] title];
  [v3 setTitle:v4];

  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v10 headerView];
  id v6 = [location[0] detailText];
  [v5 setDetailText:v6];

  id v7 = [location[0] statusMessage];
  v8 = [(BuddyProximityAutomatedDeviceEnrollmentInProgressController *)v10 spinnerStatusLabel];
  [(UILabel *)v8 setText:v7];

  objc_storeStrong(location, 0);
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (UILabel)spinnerStatusLabel
{
  return self->_spinnerStatusLabel;
}

- (void).cxx_destruct
{
}

@end