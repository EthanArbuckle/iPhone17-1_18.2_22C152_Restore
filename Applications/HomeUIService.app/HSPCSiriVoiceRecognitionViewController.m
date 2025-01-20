@interface HSPCSiriVoiceRecognitionViewController
- (HSPCSiriVoiceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)_checkForiCloudSiriEnabledAndEnableVoiceRecognition;
- (id)_enableVoiceRecognitionAndCommitConfiguration;
- (id)_showVoiceRecognitionConfirmation;
- (id)commitConfiguration;
- (void)_enableVoiceRecognition;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCSiriVoiceRecognitionViewController

- (HSPCSiriVoiceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)PRXCardContentView) initWithCardStyle:0];
  v19.receiver = self;
  v19.super_class = (Class)HSPCSiriVoiceRecognitionViewController;
  v9 = [(HSPCSiriVoiceRecognitionViewController *)&v19 initWithContentView:v8];
  v10 = v9;
  if (v9)
  {
    [(HSPCSiriVoiceRecognitionViewController *)v9 setConfig:v7];
    [(HSPCSiriVoiceRecognitionViewController *)v10 setCoordinator:v6];
    v11 = HULocalizedString();
    [(HSPCSiriVoiceRecognitionViewController *)v10 setTitle:v11];

    v12 = HULocalizedString();
    id v13 = [(HSPCSiriVoiceRecognitionViewController *)v10 addProminentButtonWithLocalizedTitle:v12 target:v10 futureSelector:"_enableVoiceRecognitionAndCommitConfiguration"];

    v14 = HULocalizedString();
    id v15 = [(HSPCSiriVoiceRecognitionViewController *)v10 addOptionalButtonWithLocalizedTitle:v14 target:v10 futureSelector:"_showVoiceRecognitionConfirmation"];

    v16 = HULocalizedString();
    [(HSPCSiriVoiceRecognitionViewController *)v10 setSubtitle:v16];

    v17 = HULocalizedString();
    [(HSPCSiriVoiceRecognitionViewController *)v10 setBottomTrayTitle:v17];
  }
  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0100];
}

- (void)_enableVoiceRecognition
{
  v3 = [(HSPCSiriVoiceRecognitionViewController *)self config];
  v4 = [v3 home];

  id v5 = objc_alloc((Class)HFUserItem);
  id v6 = [v4 currentUser];
  id v7 = [v5 initWithHome:v4 user:v6 nameStyle:0];

  id v8 = [v7 setEnableIdentifyVoice:1];
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Enabling voice recognition", (uint8_t *)&v11, 0xCu);
  }
}

- (id)_checkForiCloudSiriEnabledAndEnableVoiceRecognition
{
  v3 = +[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:self];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000213A4;
  v6[3] = &unk_1000A9A88;
  v6[4] = self;
  v4 = [v3 flatMap:v6];

  return v4;
}

- (id)_enableVoiceRecognitionAndCommitConfiguration
{
  v4 = [(HSPCSiriVoiceRecognitionViewController *)self _checkForiCloudSiriEnabledAndEnableVoiceRecognition];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000214BC;
  v7[3] = &unk_1000A9218;
  v7[4] = self;
  v7[5] = a2;
  id v5 = [v4 flatMap:v7];

  return v5;
}

- (id)_showVoiceRecognitionConfirmation
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Showing voice recognition confirmation alert", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = sub_100021BCC;
  v20 = sub_100021BDC;
  id v21 = (id)objc_opt_new();
  id v6 = HULocalizedString();
  id v7 = HULocalizedString();
  id v8 = HULocalizedString();
  v9 = HULocalizedString();
  v10 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100021BE4;
  v16[3] = &unk_1000A9AD8;
  v16[4] = self;
  v16[5] = &buf;
  v16[6] = a2;
  int v11 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v16];
  [v10 addAction:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021D3C;
  v15[3] = &unk_1000A9AD8;
  v15[4] = self;
  v15[5] = &buf;
  v15[6] = a2;
  v12 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v15];
  [v10 addAction:v12];

  [(HSPCSiriVoiceRecognitionViewController *)self presentViewController:v10 animated:1 completion:0];
  id v13 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v13;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end