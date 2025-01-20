@interface HSPCAccessoryUpdateViewController
- (HSPCAccessoryUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)config;
- (id)displayAutomaticUpdatesAlert;
- (id)handleInstallUpdate;
- (id)handleNotNowButtonTapped;
- (id)iconDescriptor;
- (void)setConfig:(id)a3;
@end

@implementation HSPCAccessoryUpdateViewController

- (HSPCAccessoryUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HSPCAccessoryUpdateViewController;
  v8 = [(HSPCCenterIconViewController *)&v15 initWithCoordinator:a3 config:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    v10 = HULocalizedString();
    [(HSPCAccessoryUpdateViewController *)v9 setTitle:v10];

    v11 = HULocalizedString();
    [(HSPCAccessoryUpdateViewController *)v9 setSubtitle:v11];

    id v12 = [(HSPCAccessoryUpdateViewController *)v9 addProminentButtonWithTitleKey:@"HUInstallUpdateTitle" target:v9 futureSelector:"handleInstallUpdate"];
    id v13 = [(HSPCAccessoryUpdateViewController *)v9 addOptionalButtonWithTitleKey:@"HUNotNowTitle" target:v9 futureSelector:"handleNotNowButtonTapped"];
  }

  return v9;
}

- (id)iconDescriptor
{
  v2 = +[UIColor hf_keyColor];
  v8 = v2;
  v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v4 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v3];

  id v5 = objc_alloc((Class)HFImageIconDescriptor);
  id v6 = [v5 initWithSystemImageNamed:HFSymbolIconIdentifierInstallUpdate configuration:v4];

  return v6;
}

- (id)handleInstallUpdate
{
  v2 = [(HSPCAccessoryUpdateViewController *)self config];
  v3 = [v2 addedAccessory];
  id v4 = [v3 hf_startSoftwareUpdate];

  return +[NAFuture futureWithResult:&off_1000B0B50];
}

- (id)handleNotNowButtonTapped
{
  v3 = [(HSPCAccessoryUpdateViewController *)self config];
  id v4 = [v3 home];
  if (objc_msgSend(v4, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter"))
  {
    id v5 = [(HSPCAccessoryUpdateViewController *)self config];
    id v6 = [v5 home];
    unsigned __int8 v7 = [v6 hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];

    if ((v7 & 1) == 0)
    {
      v8 = [(HSPCAccessoryUpdateViewController *)self displayAutomaticUpdatesAlert];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(HSPCAccessoryUpdateViewController *)self config];
    v11 = [v10 home];
    unsigned int v12 = [v11 hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter];
    id v13 = [(HSPCAccessoryUpdateViewController *)self config];
    v14 = [v13 home];
    int v16 = 136315650;
    v17 = "-[HSPCAccessoryUpdateViewController handleNotNowButtonTapped]";
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    __int16 v20 = 1024;
    unsigned int v21 = [v14 hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Did not display automatic software updates popup: hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter - [%d], hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled - [%d]", (uint8_t *)&v16, 0x18u);
  }
  v8 = +[NAFuture futureWithResult:&off_1000B0B50];
LABEL_8:

  return v8;
}

- (id)displayAutomaticUpdatesAlert
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100057F20;
  v4[3] = &unk_1000A96F8;
  v4[4] = self;
  v2 = +[NAFuture futureWithBlock:v4];

  return v2;
}

- (id)config
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end