@interface HSPCCameraUserAccessViewController
- (HSPCCameraUserAccessViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCCameraUserAccessViewController

- (HSPCCameraUserAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HSPCCameraUserAccessViewController;
  v9 = [(HSPCMVVMShellViewController *)&v15 initWithTableViewStyle:2 moduleCreator:&stru_1000AB2E8 moduleControllerBuilder:&stru_1000AB308];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString();
    [(HSPCCameraUserAccessViewController *)v10 setTitle:v11];

    v12 = HULocalizedString();
    [(HSPCCameraUserAccessViewController *)v10 setSubtitle:v12];

    id v13 = [(HSPCCameraUserAccessViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0B38];
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
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