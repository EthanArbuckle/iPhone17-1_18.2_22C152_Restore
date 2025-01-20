@interface BuddyProximityAutomatedDeviceEnrollmentCompletionController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)isEphemeral;
- (BOOL)shouldAllowStartOver;
- (BYDeviceProvider)deviceProvider;
- (BuddyProximityAutomatedDeviceEnrollmentCompletionController)init;
- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController;
- (NSString)verboseDescriptionText;
- (OBTrayButton)verboseDescriptionButton;
- (void)configureViewWithViewModel:(id)a3;
- (void)displayVerboseDescriptionButton;
- (void)linkButtonTapped:(id)a3;
- (void)proximityAutomatedDeviceEnrollmentControllerWantsToDisplayShutdownUI:(id)a3;
- (void)removeVerboseDescriptionButton;
- (void)setDeviceProvider:(id)a3;
- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3;
- (void)setVerboseDescriptionButton:(id)a3;
- (void)setVerboseDescriptionText:(id)a3;
- (void)shutdownButtonTapped:(id)a3;
@end

@implementation BuddyProximityAutomatedDeviceEnrollmentCompletionController

- (BuddyProximityAutomatedDeviceEnrollmentCompletionController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentCompletionController;
  id location = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)&v4 initWithTitle:&stru_1002B4E18 detailText:0 symbolName:0];
  v2 = (BuddyProximityAutomatedDeviceEnrollmentCompletionController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_proximityAutomatedDeviceEnrollmentController, location[0]);
  [(BuddyProximityAutomatedDeviceEnrollmentController *)v6->_proximityAutomatedDeviceEnrollmentController setDelegate:v6];
  v3 = [(BuddyProximityAutomatedDeviceEnrollmentController *)v6->_proximityAutomatedDeviceEnrollmentController completionViewModel];
  -[BuddyProximityAutomatedDeviceEnrollmentCompletionController configureViewWithViewModel:](v6, "configureViewWithViewModel:", v3, v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentControllerWantsToDisplayShutdownUI:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SBSPresentPowerDownUI();
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

- (void)configureViewWithViewModel:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 buttonTray];
  [v3 removeAllButtons];

  [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 removeVerboseDescriptionButton];
  id v4 = v17;
  id v5 = [location[0] buttonTitle];
  [(BuddyWelcomeController *)v4 addBoldButton:v5 action:"shutdownButtonTapped:"];

  if ([location[0] hasVerboseDescription])
  {
    v6 = v17;
    id v7 = [location[0] linkButtonTitle];
    id v8 = [(BuddyWelcomeController *)v6 createLinkButtonWithTitle:v7 action:"linkButtonTapped:"];
    [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 setVerboseDescriptionButton:v8];

    [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 displayVerboseDescriptionButton];
  }
  id v9 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 headerView];
  id v10 = [location[0] title];
  [v9 setTitle:v10];

  id v11 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 headerView];
  id v12 = [location[0] detailText];
  [v11 setDetailText:v12];

  id v13 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 headerView];
  id v14 = [location[0] symbolName];
  [v13 setSymbol:v14 accessibilityLabel:0];

  id v15 = [location[0] verboseDescriptionText];
  [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v17 setVerboseDescriptionText:v15];

  objc_storeStrong(location, 0);
}

- (void)shutdownButtonTapped:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v5 proximityAutomatedDeviceEnrollmentController];
  [(BuddyProximityAutomatedDeviceEnrollmentController *)v3 shutdownButtonTapped];

  objc_storeStrong(location, 0);
}

- (void)linkButtonTapped:(id)a3
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 removeVerboseDescriptionButton];
  id v40 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v40 _setCornerRadius:8.0];
  id v3 = +[UIColor systemGroupedBackgroundColor];
  [v40 setBackgroundColor:v3];

  id v4 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  [v4 addSubview:v40];

  id v39 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v39 setNumberOfLines:0];
  id v5 = +[UIFont monospacedSystemFontOfSize:12.0 weight:UIFontWeightRegular];
  [v39 setFont:v5];

  v6 = +[UIColor secondaryLabelColor];
  [v39 setTextColor:v6];

  id v7 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 verboseDescriptionText];
  [v39 setText:v7];

  [v39 sizeToFit];
  [v40 addSubview:v39];
  id v31 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  id v37 = [v40 topAnchor];
  id v38 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  id v36 = [v38 topAnchor];
  id v35 = [v37 constraintEqualToAnchor:];
  v43[0] = v35;
  id v33 = [v40 bottomAnchor];
  id v34 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  id v32 = [v34 bottomAnchor];
  id v30 = [v33 constraintEqualToAnchor:];
  v43[1] = v30;
  id v28 = [v40 leadingAnchor];
  id v29 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  id v27 = [v29 leadingAnchor];
  id v26 = [v28 constraintEqualToAnchor:];
  v43[2] = v26;
  id v24 = [v40 trailingAnchor];
  id v25 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 contentView];
  id v23 = [v25 trailingAnchor];
  id v22 = [v24 constraintEqualToAnchor:];
  v43[3] = v22;
  id v21 = [v39 topAnchor];
  id v20 = [v40 topAnchor];
  id v19 = [v21 constraintEqualToSystemSpacingBelowAnchor:1.0];
  v43[4] = v19;
  id v18 = [v39 bottomAnchor];
  id v8 = [v40 bottomAnchor];
  id v9 = [v18 constraintEqualToSystemSpacingBelowAnchor:v8 multiplier:-1.0];
  v43[5] = v9;
  id v10 = [v39 leadingAnchor];
  id v11 = [v40 leadingAnchor];
  id v12 = [v10 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:1.0];
  v43[6] = v12;
  id v13 = [v39 trailingAnchor];
  id v14 = [v40 trailingAnchor];
  id v15 = [v13 constraintEqualToSystemSpacingAfterAnchor:v14 multiplier:-1.0];
  v43[7] = v15;
  v16 = +[NSArray arrayWithObjects:v43 count:8];
  [v31 addConstraints:v16];

  id v17 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v42 view];
  [v17 layoutIfNeeded];

  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

- (void)removeVerboseDescriptionButton
{
  v2 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)self verboseDescriptionButton];
  [(OBTrayButton *)v2 removeFromSuperview];

  [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)self setVerboseDescriptionButton:0];
}

- (void)displayVerboseDescriptionButton
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)self verboseDescriptionButton];
  id v2 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  [v2 addSubview:location[0]];

  id v3 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v23 = [location[0] leadingAnchor];
  id v24 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v22 = [v24 leadingAnchor];
  id v21 = [v23 constraintEqualToAnchor:];
  v27[0] = v21;
  id v19 = [location[0] trailingAnchor];
  id v20 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v18 = [v20 trailingAnchor];
  id v17 = [v19 constraintEqualToAnchor:];
  v27[1] = v17;
  id v15 = [location[0] topAnchor];
  id v16 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v14 = [v16 topAnchor];
  id v13 = [v15 constraintEqualToAnchor:];
  v27[2] = v13;
  id v4 = [location[0] bottomAnchor];
  id v5 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v6 = [v5 bottomAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  v27[3] = v7;
  id v8 = [location[0] centerXAnchor];
  id v9 = [(BuddyProximityAutomatedDeviceEnrollmentCompletionController *)v26 contentView];
  id v10 = [v9 centerXAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v27[4] = v11;
  id v12 = +[NSArray arrayWithObjects:v27 count:5];
  [v3 addConstraints:v12];

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

- (OBTrayButton)verboseDescriptionButton
{
  return self->_verboseDescriptionButton;
}

- (void)setVerboseDescriptionButton:(id)a3
{
}

- (NSString)verboseDescriptionText
{
  return self->_verboseDescriptionText;
}

- (void)setVerboseDescriptionText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end