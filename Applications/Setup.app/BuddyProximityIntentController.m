@interface BuddyProximityIntentController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)didAppear;
- (BOOL)hasIntent;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (BuddyProximityIntentController)init;
- (ProximitySetupController)proximitySetupController;
- (UIActivityIndicatorView)activityIndicator;
- (int64_t)_activityIndicatorViewStyle;
- (void)_updateLayout;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setDidAppear:(BOOL)a3;
- (void)setHasIntent:(BOOL)a3;
- (void)setProximitySetupController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyProximityIntentController

- (BuddyProximityIntentController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"PROXIMITY_INTENT_TITLE_IPHONE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"PROXIMITY_INTENT_DETAIL_OTHER_IPHONE" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyProximityIntentController;
  id location = [(BuddyProximityIntentController *)&v9 initWithTitle:v4 detailText:v6 icon:0];
  objc_storeStrong(&location, location);

  v7 = (BuddyProximityIntentController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)BuddyProximityIntentController;
  [(BuddyProximityIntentController *)&v21 viewDidLoad];
  id v2 = [(BuddyProximityIntentController *)v23 navigationItem];
  [v2 setHidesBackButton:1 animated:0];

  v3 = [(BuddyProximityIntentController *)v23 proximitySetupController];
  v4 = [(ProximitySetupController *)v3 information];
  id location = [(SASProximityInformation *)v4 deviceClass];

  id v5 = [(BuddyProximityIntentController *)v23 headerView];
  v6 = +[NSBundle mainBundle];
  id v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_INTENT_TITLE" deviceClass:location];
  v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
  [v5 setTitle:v8];

  id v9 = [(BuddyProximityIntentController *)v23 headerView];
  SEL v10 = +[NSBundle mainBundle];
  id v11 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:@"PROXIMITY_INTENT_DETAIL" deviceClass:location];
  v12 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"Localizable"];
  [v9 setDetailText:v12];

  id v13 = objc_alloc((Class)UIActivityIndicatorView);
  id v14 = [v13 initWithActivityIndicatorStyle:[v23 _activityIndicatorViewStyle]];
  [(BuddyProximityIntentController *)v23 setActivityIndicator:v14];

  v15 = [(BuddyProximityIntentController *)v23 activityIndicator];
  [(UIActivityIndicatorView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(BuddyProximityIntentController *)v23 activityIndicator];
  LODWORD(v17) = 1148846080;
  [(UIActivityIndicatorView *)v16 setContentCompressionResistancePriority:1 forAxis:v17];

  id v18 = [(BuddyProximityIntentController *)v23 contentView];
  v19 = [(BuddyProximityIntentController *)v23 activityIndicator];
  [v18 addSubview:v19];

  [(BuddyProximityIntentController *)v23 _updateLayout];
  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityIntentController;
  [(BuddyProximityIntentController *)&v4 viewWillAppear:a3];
  v3 = [(BuddyProximityIntentController *)v7 activityIndicator];
  [(UIActivityIndicatorView *)v3 startAnimating];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyProximityIntentController;
  [(BuddyProximityIntentController *)&v11 viewDidAppear:a3];
  if ([(BuddyProximityIntentController *)v14 hasIntent])
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    objc_super v4 = &_dispatch_main_q;
    BOOL v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_1000479D0;
    id v9 = &unk_1002B0D20;
    SEL v10 = v14;
    dispatch_after(v3, (dispatch_queue_t)v4, &v5);

    objc_storeStrong((id *)&v10, 0);
  }
  else
  {
    [(BuddyProximityIntentController *)v14 setDidAppear:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyProximityIntentController *)v4 _updateLayout];
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  v45 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyProximityIntentController *)self activityIndicator];
  [(UIActivityIndicatorView *)v2 removeFromSuperview];

  id v3 = [(BuddyProximityIntentController *)v45 contentView];
  objc_super v4 = [(BuddyProximityIntentController *)v45 activityIndicator];
  [v3 addSubview:v4];

  id v5 = [(BuddyProximityIntentController *)v45 _activityIndicatorViewStyle];
  int v6 = [(BuddyProximityIntentController *)v45 activityIndicator];
  [(UIActivityIndicatorView *)v6 setActivityIndicatorViewStyle:v5];

  id v7 = [(BuddyProximityIntentController *)v45 view];
  id v8 = [v7 centerYAnchor];
  id v9 = [(BuddyProximityIntentController *)v45 activityIndicator];
  id v10 = [(UIActivityIndicatorView *)v9 centerYAnchor];
  location[0] = [v8 constraintEqualToAnchor:v10];

  LODWORD(v11) = 1132068864;
  [location[0] setPriority:v11];
  if ([(BuddyProximityIntentController *)v45 isContentCenterAligned])
  {
    id v42 = [(BuddyProximityIntentController *)v45 contentView];
    id v38 = [v42 centerXAnchor];
    v40 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v36 = [(UIActivityIndicatorView *)v40 centerXAnchor];
    id v34 = [v38 constraintEqualToAnchor:];
    v47[0] = v34;
    v47[1] = location[0];
    v32 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v12 = [(UIActivityIndicatorView *)v32 topAnchor];
    id v13 = [(BuddyProximityIntentController *)v45 contentView];
    id v14 = [v13 topAnchor];
    id v15 = [v12 constraintGreaterThanOrEqualToAnchor:v14];
    v47[2] = v15;
    id v16 = [(BuddyProximityIntentController *)v45 contentView];
    id v17 = [v16 bottomAnchor];
    id v18 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v19 = [(UIActivityIndicatorView *)v18 bottomAnchor];
    id v20 = [v17 constraintEqualToAnchor:v19];
    v47[3] = v20;
    objc_super v21 = +[NSArray arrayWithObjects:v47 count:4];
    +[NSLayoutConstraint activateConstraints:v21];
  }
  else
  {
    id v43 = [(BuddyProximityIntentController *)v45 contentView];
    id v39 = [v43 leadingAnchor];
    v41 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v37 = [(UIActivityIndicatorView *)v41 leadingAnchor];
    id v35 = [v39 constraintEqualToAnchor:];
    v46[0] = v35;
    v46[1] = location[0];
    v33 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v22 = [(UIActivityIndicatorView *)v33 topAnchor];
    id v23 = [(BuddyProximityIntentController *)v45 contentView];
    id v24 = [v23 topAnchor];
    id v25 = [v22 constraintGreaterThanOrEqualToAnchor:v24];
    v46[2] = v25;
    id v26 = [(BuddyProximityIntentController *)v45 contentView];
    id v27 = [v26 bottomAnchor];
    v28 = [(BuddyProximityIntentController *)v45 activityIndicator];
    id v29 = [(UIActivityIndicatorView *)v28 bottomAnchor];
    id v30 = [v27 constraintEqualToAnchor:v29];
    v46[3] = v30;
    v31 = +[NSArray arrayWithObjects:v46 count:4];
    +[NSLayoutConstraint activateConstraints:v31];
  }
  objc_storeStrong(location, 0);
}

- (int64_t)_activityIndicatorViewStyle
{
  if ([(BuddyProximityIntentController *)self isContentCenterAligned]) {
    return 100;
  }
  else {
    return 101;
  }
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  id v2 = [(BuddyProximityIntentController *)self proximitySetupController];
  unsigned __int8 v3 = [(ProximitySetupController *)v2 supportsIntent];
  char v6 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    id v7 = [(BuddyProximityIntentController *)self proximitySetupController];
    char v6 = 1;
    unsigned __int8 v4 = [(ProximitySetupController *)v7 hasConnection];
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyProximityIntentController *)v11 proximitySetupController];
  unsigned __int8 v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100048268;
  id v8 = &unk_1002B0D48;
  char v9 = v11;
  [(ProximitySetupController *)v3 waitForIntent:&v4];

  if (location[0]) {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BOOL)didAppear
{
  return self->_didAppear;
}

- (void)setDidAppear:(BOOL)a3
{
  self->_didAppear = a3;
}

- (BOOL)hasIntent
{
  return self->_hasIntent;
}

- (void)setHasIntent:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end