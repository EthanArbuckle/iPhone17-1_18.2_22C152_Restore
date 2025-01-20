@interface HSPCSiriVoiceTrainingViewController
- (BOOL)hasCompletedSiriSetup;
- (HSPCSiriVoiceTrainingViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)commitConfiguration;
- (void)_continueSetup;
- (void)_disableVoiceRecognition;
- (void)_dismissSetup;
- (void)continueSetup;
- (void)dismissSetup;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setHasCompletedSiriSetup:(BOOL)a3;
- (void)showLearnMore;
- (void)skipSetup;
@end

@implementation HSPCSiriVoiceTrainingViewController

- (HSPCSiriVoiceTrainingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HSPCSiriVoiceTrainingViewController;
  v9 = [(HSPCSiriVoiceTrainingViewController *)&v12 initWithEnrollmentMode:5];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    [(HSPCSiriVoiceTrainingViewController *)v10 setDelegate:v10];
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFF08];
}

- (void)skipSetup
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Skipping Siri voice training setup", v4, 2u);
  }

  [(HSPCSiriVoiceTrainingViewController *)self _disableVoiceRecognition];
  [(HSPCSiriVoiceTrainingViewController *)self _continueSetup];
}

- (void)continueSetup
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training setup complete", v4, 2u);
  }

  if (![(HSPCSiriVoiceTrainingViewController *)self hasCompletedSiriSetup])
  {
    [(HSPCSiriVoiceTrainingViewController *)self setHasCompletedSiriSetup:1];
    [(HSPCSiriVoiceTrainingViewController *)self _continueSetup];
  }
}

- (void)showLearnMore
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training show learn more", v3, 2u);
  }
}

- (void)dismissSetup
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training setup has been dismissed", v4, 2u);
  }

  [(HSPCSiriVoiceTrainingViewController *)self _dismissSetup];
}

- (void)_continueSetup
{
  v4 = [(HSPCSiriVoiceTrainingViewController *)self config];
  v5 = [v4 delegate];
  v6 = [(HSPCSiriVoiceTrainingViewController *)self config];
  id v7 = [v5 stateMachineConfigurationGetLaunchReason:v6];

  id v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)3)
  {
    if (v9)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ We are launched for Siri Endpoint setup only so must actually dismiss now", buf, 0x16u);
    }
    [(HSPCSiriVoiceTrainingViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (v9)
    {
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Continuing setup", buf, 0x16u);
    }
    objc_super v12 = [(HSPCSiriVoiceTrainingViewController *)self coordinator];
    v13 = [v12 nextViewController];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100008088;
    v15[3] = &unk_1000A8ED0;
    v15[4] = self;
    id v14 = [v13 addSuccessBlock:v15];
  }
}

- (void)_dismissSetup
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    BOOL v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Dismissing setup", (uint8_t *)&v6, 0x16u);
  }
  [(HSPCSiriVoiceTrainingViewController *)self _disableVoiceRecognition];
  [(HSPCSiriVoiceTrainingViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_disableVoiceRecognition
{
  v4 = [(HSPCSiriVoiceTrainingViewController *)self config];
  v5 = [v4 home];

  id v6 = objc_alloc((Class)HFUserItem);
  id v7 = [v5 currentUser];
  id v8 = [v6 initWithHome:v5 user:v7 nameStyle:0];

  id v9 = [v8 setEnableIdentifyVoice:0];
  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    int v15 = 138412290;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Disabling voice recognition", (uint8_t *)&v15, 0xCu);
  }
  objc_super v12 = [(HSPCSiriVoiceTrainingViewController *)self config];
  [v12 setShouldSkipVoiceProfileSetup:1];

  v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NSStringFromSelector(a2);
    int v15 = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ User has opted to skip voice training. Setting flag to skip remainder of voice profile related setup flow.", (uint8_t *)&v15, 0xCu);
  }
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

- (BOOL)hasCompletedSiriSetup
{
  return self->_hasCompletedSiriSetup;
}

- (void)setHasCompletedSiriSetup:(BOOL)a3
{
  self->_hasCompletedSiriSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end