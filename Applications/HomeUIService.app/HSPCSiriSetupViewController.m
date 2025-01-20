@interface HSPCSiriSetupViewController
- (BOOL)_siriEnabledOnCurrentDevice;
- (HSPCSiriSetupViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (SUICOrbView)siriOrbView;
- (UIView)siriOrbContainerView;
- (id)_disableVoiceRecognition;
- (id)commitConfiguration;
- (void)_handleFooterLabelTouchForOpenURL:(id)a3;
- (void)_launchSiriPrivacySheet;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSiriOrbContainerView:(id)a3;
- (void)setSiriOrbView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCSiriSetupViewController

- (HSPCSiriSetupViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UIView);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v9 = (void *)qword_1000CB560;
  uint64_t v28 = qword_1000CB560;
  if (!qword_1000CB560)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003279C;
    v24[3] = &unk_1000AA500;
    v24[4] = &v25;
    sub_10003279C((uint64_t)v24);
    v9 = (void *)v26[3];
  }
  v10 = v9;
  _Block_object_dispose(&v25, 8);
  id v11 = [[v10 alloc] initWithFrame:0.0, 0.0, 198.0, 198.0];
  [v11 setMode:3];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v11];
  v23.receiver = self;
  v23.super_class = (Class)HSPCSiriSetupViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v23, "initWithCenterContentView:size:", v8, 198.0, 198.0);
  v13 = v12;
  if (v12)
  {
    [(HSPCSiriSetupViewController *)v12 setConfig:v7];
    [(HSPCSiriSetupViewController *)v13 setCoordinator:v6];
    [(HSPCSiriSetupViewController *)v13 setSiriOrbView:v11];
    [(HSPCSiriSetupViewController *)v13 setSiriOrbContainerView:v8];
    [(HSPCSiriSetupViewController *)v13 _siriEnabledOnCurrentDevice];
    v14 = HULocalizedString();
    [(HSPCSiriSetupViewController *)v13 setTitle:v14];

    v15 = HULocalizedString();
    id v16 = [(HSPCSiriSetupViewController *)v13 addProminentButtonWithLocalizedTitle:v15 target:v13 futureSelector:"commitConfiguration"];

    v17 = HULocalizedString();
    id v18 = [(HSPCSiriSetupViewController *)v13 addOptionalButtonWithLocalizedTitle:v17 target:v13 futureSelector:"_disableVoiceRecognition"];

    [(HSPCSiriSetupViewController *)v13 _siriEnabledOnCurrentDevice];
    v19 = [v7 home];
    v20 = HULocalizedSiriTriggerPhrase();
    v21 = HULocalizedStringWithFormat();
    -[HSPCSiriSetupViewController setSubtitle:](v13, "setSubtitle:", v21, v20);
  }
  return v13;
}

- (void)viewDidLoad
{
  v59.receiver = self;
  v59.super_class = (Class)HSPCSiriSetupViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v59 viewDidLoad];
  v3 = +[PRXLabel labelWithStyle:3];
  uint64_t v4 = HULocalizedString();
  id v5 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v63 = NSForegroundColorAttributeName;
  id v6 = +[UIColor hf_keyColor];
  v64 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v56 = (void *)v4;
  id v58 = [v5 initWithString:v4 attributes:v7];

  id v8 = objc_alloc((Class)NSMutableAttributedString);
  v9 = HULocalizedString();
  id v57 = [v8 initWithString:v9];

  [v57 appendAttributedString:v58];
  id v10 = [v57 copy];
  [v3 setAttributedText:v10];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = v3;
  [v3 setUserInteractionEnabled:1];
  id v12 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  CFStringRef v61 = @"URL_KEY";
  v13 = +[HFURLComponents siriPrivacyURL];
  v62 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  id v55 = [v12 initWithTarget:self action:"_handleFooterLabelTouchForOpenURL:" hitBoxString:v4 userInfo:v14];

  [v11 addGestureRecognizer:v55];
  v15 = [(HSPCSiriSetupViewController *)self contentView];
  [v15 addSubview:v11];

  v54 = [(HSPCSiriSetupViewController *)self siriOrbView];
  v52 = [v54 centerXAnchor];
  v53 = [(HSPCSiriSetupViewController *)self contentView];
  v51 = [v53 mainContentGuide];
  v50 = [v51 centerXAnchor];
  v49 = [v52 constraintEqualToAnchor:v50];
  v60[0] = v49;
  v48 = [(HSPCSiriSetupViewController *)self siriOrbView];
  v45 = [v48 topAnchor];
  v47 = [(HSPCSiriSetupViewController *)self contentView];
  v46 = [v47 subtitleLabel];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-20.0];
  v60[1] = v43;
  v42 = [(HSPCSiriSetupViewController *)self siriOrbView];
  v41 = [v42 widthAnchor];
  v40 = [v41 constraintEqualToConstant:198.0];
  v60[2] = v40;
  v39 = [(HSPCSiriSetupViewController *)self siriOrbView];
  v37 = [v39 heightAnchor];
  v36 = [v37 constraintEqualToConstant:198.0];
  v60[3] = v36;
  v34 = [v11 centerXAnchor];
  v35 = [(HSPCSiriSetupViewController *)self contentView];
  v33 = [v35 mainContentGuide];
  v32 = [v33 centerXAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v60[4] = v31;
  v29 = [v11 topAnchor];
  v30 = [(HSPCSiriSetupViewController *)self siriOrbView];
  uint64_t v28 = [v30 bottomAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28 constant:-20.0];
  v60[5] = v27;
  v38 = v11;
  v26 = [v11 bottomAnchor];
  id v16 = [(HSPCSiriSetupViewController *)self contentView];
  v17 = [v16 mainContentGuide];
  id v18 = [v17 bottomAnchor];
  v19 = [v26 constraintEqualToAnchor:v18];
  v60[6] = v19;
  v20 = [v11 widthAnchor];
  v21 = [(HSPCSiriSetupViewController *)self contentView];
  v22 = [v21 mainContentGuide];
  objc_super v23 = [v22 widthAnchor];
  v24 = [v20 constraintLessThanOrEqualToAnchor:v23];
  v60[7] = v24;
  uint64_t v25 = +[NSArray arrayWithObjects:v60 count:8];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)_handleFooterLabelTouchForOpenURL:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"URL_KEY"];

  if (v5)
  {
    id v6 = +[HFURLComponents siriPrivacyURL];
    unsigned int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Launching Siri privacy sheet", v10, 2u);
      }

      [(HSPCSiriSetupViewController *)self _launchSiriPrivacySheet];
    }
  }
  else
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006603C(v9);
    }

    NSLog(@"Footer link pressed w/ url intention but no url found");
  }
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B02B0];
}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3 = [(HSPCSiriSetupViewController *)self navigationController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (HSPCSiriSetupViewController *)v3;
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  id v7 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:OBPrivacySiriIdentifier];
  [v7 setPresentingViewController:v6];

  [v7 present];
}

- (id)_disableVoiceRecognition
{
  uint64_t v4 = [(HSPCSiriSetupViewController *)self config];
  id v5 = [v4 home];

  id v6 = objc_alloc((Class)HFUserItem);
  id v7 = [v5 currentUser];
  id v8 = [v6 initWithHome:v5 user:v7 nameStyle:0];

  id v9 = [v8 setEnableIdentifyVoice:0];
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromSelector(a2);
    int v21 = 138412290;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Disabling voice recognition", (uint8_t *)&v21, 0xCu);
  }
  id v12 = [(HSPCSiriSetupViewController *)self config];
  [v12 setShouldSkipVoiceProfileSetup:1];

  v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    int v21 = 138412290;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ User has opted to not enable voice recognition. Setting flag to skip voice profile setup flow.", (uint8_t *)&v21, 0xCu);
  }
  v15 = [(HSPCSiriSetupViewController *)self config];
  id v16 = [v15 delegate];
  v17 = [(HSPCSiriSetupViewController *)self config];
  id v18 = [v16 stateMachineConfigurationGetLaunchReason:v17];

  if (v18 == (id)3) {
    +[NAFuture futureWithResult:&off_1000B02C8];
  }
  else {
  v19 = [(HSPCSiriSetupViewController *)self commitConfiguration];
  }

  return v19;
}

- (BOOL)_siriEnabledOnCurrentDevice
{
  uint64_t v4 = +[AFPreferences sharedPreferences];
  unsigned int v5 = [v4 assistantIsEnabled];

  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 1024;
    unsigned int v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Is Siri enabled on this device? %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }
  return v5;
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

- (SUICOrbView)siriOrbView
{
  return self->_siriOrbView;
}

- (void)setSiriOrbView:(id)a3
{
}

- (UIView)siriOrbContainerView
{
  return self->_siriOrbContainerView;
}

- (void)setSiriOrbContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriOrbContainerView, 0);
  objc_storeStrong((id *)&self->_siriOrbView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end