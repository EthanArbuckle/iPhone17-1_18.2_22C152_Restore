@interface HSPCSiriUpdateRequiredViewController
- (HSPCSiriUpdateRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCSiriUpdateRequiredViewController

- (HSPCSiriUpdateRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed();
  id v11 = [v9 initWithImage:v10];

  [v11 setContentMode:2];
  v19.receiver = self;
  v19.super_class = (Class)HSPCSiriUpdateRequiredViewController;
  v12 = [(HSPCFixedSizeCenterContentViewController *)&v19 initWithCenterContentView:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HULocalizedString();
    [(HSPCSiriUpdateRequiredViewController *)v13 setTitle:v14];

    v15 = HULocalizedString();
    id v16 = [(HSPCSiriUpdateRequiredViewController *)v13 addProminentButtonWithLocalizedTitle:v15 target:v13 futureSelector:"commitConfiguration"];

    v17 = HULocalizedString();
    [(HSPCSiriUpdateRequiredViewController *)v13 setSubtitle:v17];
  }
  return v13;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFF20];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end