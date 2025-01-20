@interface HSPCLockAccessUpdateViewController
- (HSPCLockAccessUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (HULockAccessUpdateViewController)lockAccessUpdateViewController;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCLockAccessUpdateViewController

- (HSPCLockAccessUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)HULockAccessUpdateViewController);
  v10 = [v8 home];
  v11 = (HULockAccessUpdateViewController *)[v9 initWithHome:v10];
  lockAccessUpdateViewController = self->_lockAccessUpdateViewController;
  self->_lockAccessUpdateViewController = v11;

  v28.receiver = self;
  v28.super_class = (Class)HSPCLockAccessUpdateViewController;
  v13 = [(HSPCLockAccessUpdateViewController *)&v28 initWithContentView:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = sub_100060C64(@"HSLockAccessUpdate_Title");
    [(HSPCLockAccessUpdateViewController *)v14 setTitle:v15];

    v16 = sub_100060C64(@"HSLockAccessUpdate_Description");
    [(HSPCLockAccessUpdateViewController *)v14 setSubtitle:v16];

    v17 = [v8 home];
    v18 = [v17 name];
    v25 = sub_100060D80(@"HSLockAccessUpdate_Enable_Format", @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    id v26 = [(HSPCLockAccessUpdateViewController *)v14 addProminentButtonWithLocalizedTitle:v25 target:v14 futureSelector:"commitConfiguration"];
  }
  return v14;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)HSPCLockAccessUpdateViewController;
  [(HSPCLockAccessUpdateViewController *)&v38 viewDidLoad];
  v3 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  [(HSPCLockAccessUpdateViewController *)self addChildViewController:v3];

  v4 = [(HSPCLockAccessUpdateViewController *)self contentView];
  v5 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  v6 = [v5 contentView];
  [v4 addSubview:v6];

  id v7 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  id v8 = [v7 contentView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  v36 = [v37 contentView];
  v34 = [v36 topAnchor];
  v35 = [(HSPCLockAccessUpdateViewController *)self contentView];
  v33 = [v35 mainContentGuide];
  v32 = [v33 topAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v39[0] = v31;
  v30 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  v29 = [v30 contentView];
  v27 = [v29 bottomAnchor];
  objc_super v28 = [(HSPCLockAccessUpdateViewController *)self contentView];
  id v26 = [v28 mainContentGuide];
  v25 = [v26 bottomAnchor];
  uint64_t v24 = [v27 constraintEqualToAnchor:v25];
  v39[1] = v24;
  uint64_t v23 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  uint64_t v22 = [v23 contentView];
  uint64_t v20 = [v22 leadingAnchor];
  uint64_t v21 = [(HSPCLockAccessUpdateViewController *)self contentView];
  uint64_t v19 = [v21 mainContentGuide];
  id v9 = [v19 leadingAnchor];
  v10 = [v20 constraintEqualToAnchor:v9];
  v39[2] = v10;
  v11 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
  v12 = [v11 contentView];
  v13 = [v12 trailingAnchor];
  v14 = [(HSPCLockAccessUpdateViewController *)self contentView];
  v15 = [v14 mainContentGuide];
  v16 = [v15 trailingAnchor];
  v17 = [v13 constraintEqualToAnchor:v16];
  v39[3] = v17;
  v18 = +[NSArray arrayWithObjects:v39 count:4];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFF38];
}

- (id)hu_preloadContent
{
  v2 = [(HSPCLockAccessUpdateViewController *)self lockAccessUpdateViewController];
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

- (HULockAccessUpdateViewController)lockAccessUpdateViewController
{
  return self->_lockAccessUpdateViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockAccessUpdateViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end