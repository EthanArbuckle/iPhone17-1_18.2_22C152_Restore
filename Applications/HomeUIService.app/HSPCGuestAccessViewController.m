@interface HSPCGuestAccessViewController
- (HSPCGuestAccessTableViewController)guestsTableVC;
- (HSPCGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setGuestsTableVC:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCGuestAccessViewController

- (HSPCGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[HSPCGuestAccessTableViewController alloc] initWithCoordinator:v7 config:v8];
  [(HSPCGuestAccessViewController *)self setGuestsTableVC:v9];
  id v10 = objc_alloc((Class)PRXScrollableContentView);
  v11 = [(HSPCGuestAccessTableViewController *)v9 tableView];
  id v12 = [v10 initWithCardStyle:0 scrollView:v11];

  v21.receiver = self;
  v21.super_class = (Class)HSPCGuestAccessViewController;
  v13 = [(HSPCGuestAccessViewController *)&v21 initWithContentView:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = sub_100060C64(@"HSProximityCardGuestAccessTitle");
    [(HSPCGuestAccessViewController *)v14 setTitle:v15];

    v16 = sub_100060C64(@"HSProximityCardGuestAccessSubitle");
    [(HSPCGuestAccessViewController *)v14 setSubtitle:v16];

    v17 = sub_100060C64(@"HSProximityCardGuestAccessFooter");
    [(HSPCGuestAccessViewController *)v14 setBottomTrayTitle:v17];

    v18 = HULocalizedString();
    id v19 = [(HSPCGuestAccessViewController *)v14 addProminentButtonWithTitleKey:v18 target:v14 futureSelector:"commitConfiguration"];
  }
  return v14;
}

- (id)commitConfiguration
{
  v2 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v3 = [v2 commitConfiguration];

  return v3;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCGuestAccessViewController;
  [(HSPCGuestAccessViewController *)&v8 viewDidLoad];
  v3 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  [(HSPCGuestAccessViewController *)self addChildViewController:v3];

  v4 = [(HSPCGuestAccessViewController *)self contentView];
  v5 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v6 = [v5 view];
  [v4 addSubview:v6];

  id v7 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  [v7 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v38.receiver = self;
  v38.super_class = (Class)HSPCGuestAccessViewController;
  [(HSPCGuestAccessViewController *)&v38 viewWillAppear:a3];
  v4 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v5 = [v4 tableView];
  [v5 layoutIfNeeded];

  v6 = [(HSPCGuestAccessViewController *)self contentView];
  [v6 setNeedsUpdateConstraints];

  id v7 = [(HSPCGuestAccessViewController *)self contentView];
  objc_super v8 = [v7 actionButtons];
  v9 = [v8 na_firstObjectPassingTest:&stru_1000AA410];

  id v10 = [(HSPCGuestAccessViewController *)self contentView];
  v11 = [v10 mainContentGuide];

  id v12 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v13 = [v12 view];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v36 = [v37 view];
  v35 = [v36 topAnchor];
  v33 = v11;
  v34 = [v11 topAnchor];
  v32 = [v35 constraintEqualToAnchor:v34];
  v39[0] = v32;
  v31 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v30 = [v31 view];
  v29 = [v30 bottomAnchor];
  v28 = [v11 bottomAnchor];
  v26 = [v29 constraintEqualToAnchor:v28];
  v39[1] = v26;
  v25 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v14 = [v25 view];
  v15 = [v14 leadingAnchor];
  v16 = v9;
  v27 = v9;
  v17 = [v9 leadingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v39[2] = v18;
  id v19 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v20 = [v19 view];
  objc_super v21 = [v20 trailingAnchor];
  v22 = [v16 trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v39[3] = v23;
  v24 = +[NSArray arrayWithObjects:v39 count:4];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (id)hu_preloadContent
{
  v2 = [(HSPCGuestAccessViewController *)self guestsTableVC];
  v3 = [v2 hu_preloadContent];

  return v3;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSPCGuestAccessTableViewController)guestsTableVC
{
  return self->_guestsTableVC;
}

- (void)setGuestsTableVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestsTableVC, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end