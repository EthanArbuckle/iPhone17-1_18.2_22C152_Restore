@interface HSPCRestrictedGuestAccessViewController
- (HSPCRestrictedGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCRestrictedGuestAccessViewController

- (HSPCRestrictedGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004D2FC;
  v20[3] = &unk_1000A9BC8;
  id v7 = a4;
  id v21 = v7;
  v8 = objc_retainBlock(v20);
  v19.receiver = self;
  v19.super_class = (Class)HSPCRestrictedGuestAccessViewController;
  v9 = [(HSPCMVVMShellViewController *)&v19 initWithTableViewStyle:2 moduleCreator:v8 moduleControllerBuilder:&stru_1000AAF90];
  v10 = v9;
  if (v9)
  {
    [(HSPCRestrictedGuestAccessViewController *)v9 setConfig:v7];
    [(HSPCRestrictedGuestAccessViewController *)v10 setCoordinator:v6];
    v11 = HULocalizedString();
    [(HSPCRestrictedGuestAccessViewController *)v10 setTitle:v11];

    v12 = [v7 addedAccessory];
    v13 = [v12 hf_categoryOrPrimaryServiceType];

    v14 = +[UIDevice currentDevice];
    v15 = [v14 name];
    v16 = HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat();
    -[HSPCRestrictedGuestAccessViewController setSubtitle:](v10, "setSubtitle:", v16, v15);

    id v17 = [(HSPCRestrictedGuestAccessViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (id)commitConfiguration
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HSPCRestrictedGuestAccessViewController commitConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'continue' button", (uint8_t *)&v5, 0xCu);
  }

  v3 = +[NAFuture futureWithResult:&off_1000B05B0];

  return v3;
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