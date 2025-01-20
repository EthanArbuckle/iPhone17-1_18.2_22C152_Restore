@interface HSPCCenterIconViewController
- (HFIconDescriptor)iconDescriptor;
- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4 iconView:(id)a5;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UIView)iconView;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIconView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCCenterIconViewController

- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)HUIconView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v8 setIconSize:5];
  v9 = [(HSPCCenterIconViewController *)self initWithCoordinator:v7 config:v6 iconView:v8];

  return v9;
}

- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4 iconView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HSPCCenterIconViewController;
  v12 = [(HSPCFixedSizeCenterContentViewController *)&v15 initWithCenterContentView:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    objc_storeStrong((id *)&v13->_iconView, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCCenterIconViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v7 viewDidLoad];
  v3 = [(HSPCCenterIconViewController *)self iconDescriptor];
  if (v3)
  {
    objc_opt_class();
    v4 = [(HSPCCenterIconViewController *)self iconView];
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    [v6 updateWithIconDescriptor:v3 displayStyle:1 animated:1];
  }
}

- (HFIconDescriptor)iconDescriptor
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HSPCCenterIconViewController.m" lineNumber:58 description:@"Subclass to override."];

  return 0;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFEA8];
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end