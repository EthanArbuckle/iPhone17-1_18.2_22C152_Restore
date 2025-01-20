@interface HSPCCameraSetupViewController
- (HSPCCameraSetupViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)launchCameraRecordingLearnMore;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCCameraSetupViewController

- (HSPCCameraSetupViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 addedAccessory];
  [v9 cameraProfiles];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100024480;
  v19[3] = &unk_1000A9BC8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  v11 = objc_retainBlock(v19);
  v18.receiver = self;
  v18.super_class = (Class)HSPCCameraSetupViewController;
  v12 = [(HSPCMVVMShellViewController *)&v18 initWithTableViewStyle:2 moduleCreator:v11 moduleControllerBuilder:&stru_1000A9C08];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HULocalizedString();
    [(HSPCCameraSetupViewController *)v13 setTitle:v14];

    v15 = HULocalizedString();
    [(HSPCCameraSetupViewController *)v13 setSubtitle:v15];

    id v16 = [(HSPCCameraSetupViewController *)v13 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v13 futureSelector:"commitConfiguration"];
    [(HSPCCameraSetupViewController *)v13 addLearnMoreButtonWithTarget:v13 action:"launchCameraRecordingLearnMore" userInfo:0];
  }

  return v13;
}

- (void)launchCameraRecordingLearnMore
{
  id v3 = objc_alloc_init((Class)HUCameraRecordingLearnMoreViewController);
  [(HSPCCameraSetupViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0160];
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