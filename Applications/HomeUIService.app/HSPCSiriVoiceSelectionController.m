@interface HSPCSiriVoiceSelectionController
- (BOOL)_isVoiceRecognitionEnabled;
- (BOOL)_shouldEnableShareSiriAnalytics;
- (HSPCSiriVoiceSelectionController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (VTUIVoiceSelectionViewController)voiceSelectionViewController;
- (id)commitConfiguration;
- (id)subtitle;
- (void)_applyOnboardingSelectionsIfNeededForSelectedLanguageValue:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setVoiceSelectionViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
- (void)voiceSelectionControllerRequestsDismissal:(id)a3;
@end

@implementation HSPCSiriVoiceSelectionController

- (HSPCSiriVoiceSelectionController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)PRXCardContentView) initWithCardStyle:0];
  v21.receiver = self;
  v21.super_class = (Class)HSPCSiriVoiceSelectionController;
  v10 = [(HSPCSiriVoiceSelectionController *)&v21 initWithContentView:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    id v11 = objc_alloc((Class)HUVoiceSelectionDataManager);
    v12 = [v8 recognitionLanguage];
    v13 = [v8 listOfVoices];
    id v14 = [v11 initWithInputLanguageCode:v12 listOfVoices:v13];

    id v15 = v14;
    id v16 = objc_alloc((Class)VTUIVoiceSelectionViewController);
    v17 = [v8 recognitionLanguage];
    v18 = [v16 initCompactWithRecognitionLanguage:v17 allowsRandomSelection:[v8 allowsRandomVoiceSelection] dataManager:v15 customVoicePreviewer:0 forSelectionStyle:1 delegate:v10];

    voiceSelectionViewController = v10->_voiceSelectionViewController;
    v10->_voiceSelectionViewController = v18;

    [(VTUIVoiceSelectionViewController *)v10->_voiceSelectionViewController setShouldHideCompactBackgroundCardView:1];
  }

  return v10;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)HSPCSiriVoiceSelectionController;
  [(HSPCSiriVoiceSelectionController *)&v27 viewDidLoad];
  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController willMoveToParentViewController:self];
  [(HSPCSiriVoiceSelectionController *)self addChildViewController:self->_voiceSelectionViewController];
  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController didMoveToParentViewController:self];
  v3 = [(HSPCSiriVoiceSelectionController *)self view];
  v4 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v3 addSubview:v4];

  v5 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = [(HSPCSiriVoiceSelectionController *)self view];
  v24 = [v26 topAnchor];
  v25 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v28[0] = v22;
  objc_super v21 = [(HSPCSiriVoiceSelectionController *)self view];
  v19 = [v21 leftAnchor];
  v20 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  v18 = [v20 leftAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v28[1] = v17;
  id v16 = [(HSPCSiriVoiceSelectionController *)self view];
  v6 = [v16 rightAnchor];
  id v7 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  id v8 = [v7 rightAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  v28[2] = v9;
  v10 = [(HSPCSiriVoiceSelectionController *)self view];
  id v11 = [v10 bottomAnchor];
  v12 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v28[3] = v14;
  id v15 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCSiriVoiceSelectionController;
  [(HSPCSiriVoiceSelectionController *)&v7 viewDidLayoutSubviews];
  v3 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v3 layoutIfNeeded];

  v4 = [(HSPCSiriVoiceSelectionController *)self contentView];
  [v4 setNeedsUpdateConstraints];

  v5 = [(HSPCSiriVoiceSelectionController *)self view];
  [v5 bounds];
  [(HSPCSiriVoiceSelectionController *)self updatePreferredContentSizeForCardWidth:v6];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000AFEF0];
}

- (void)_applyOnboardingSelectionsIfNeededForSelectedLanguageValue:(id)a3
{
  id v4 = a3;
  v5 = [(HSPCSiriVoiceSelectionController *)self config];
  double v6 = [v5 addedAccessory];

  objc_super v7 = [v6 hf_siriEndpointProfile];
  if (v4)
  {
    v22 = v7;
    id v8 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    id v9 = [v6 hf_isDumbSpeaker];
    v10 = [(HSPCSiriVoiceSelectionController *)self config];
    id v11 = [v10 isPlaybackInfluencesForYouEnabled];
    v12 = [(HSPCSiriVoiceSelectionController *)self config];
    id v13 = [v12 isShareSiriAnalyticsEnabled];
    id v14 = [(HSPCSiriVoiceSelectionController *)self config];
    id v15 = [v8 initWithSiriEnabled:1 allowHeySiri:1 airPlayEnabled:v9 playbackInfluencesForYouEnabled:v11 shareSiriAnalyticsEnabled:v13 explicitContentAllowed:[v14 isExplicitContentAllowed] languageValue:v4];
    id v16 = [(HSPCSiriVoiceSelectionController *)self config];
    [v16 setOnboardingSelections:v15];

    objc_super v7 = v22;
  }
  v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(HSPCSiriVoiceSelectionController *)self config];
    v19 = [v18 onboardingSelections];
    *(_DWORD *)buf = 138412546;
    v24 = v19;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@. selectedLanguageValue = %@", buf, 0x16u);
  }
  v20 = [(HSPCSiriVoiceSelectionController *)self config];
  objc_super v21 = [v20 onboardingSelections];
  [v7 applyOnboardingSelections:v21 completionHandler:&stru_1000A8E58];
}

- (BOOL)_isVoiceRecognitionEnabled
{
  id v4 = objc_alloc((Class)HFUserItem);
  v5 = [(HSPCSiriVoiceSelectionController *)self config];
  double v6 = [v5 home];
  objc_super v7 = [(HSPCSiriVoiceSelectionController *)self config];
  id v8 = [v7 home];
  id v9 = [v8 currentUser];
  id v10 = [v4 initWithHome:v6 user:v9 nameStyle:0];

  unsigned int v11 = [v10 isIdentifyVoiceEnabled];
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(a2);
    int v15 = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
  }
  return v11;
}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  v3 = [(HSPCSiriVoiceSelectionController *)self config];
  if ([v3 isShareSiriAnalyticsEnabled])
  {
    id v4 = [(HSPCSiriVoiceSelectionController *)self config];
    v5 = [v4 onboardingSelections];
    unsigned __int8 v6 = [v5 allowHeySiri];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(HSPCSiriVoiceSelectionController *)self config];
  objc_super v7 = [v6 availableSiriLanguageValues];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100007738;
  v27[3] = &unk_1000A8E80;
  v27[4] = self;
  id v8 = v5;
  id v28 = v8;
  id v9 = [v7 na_firstObjectPassingTest:v27];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v8;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VTUIVoiceSelectionViewControllerDelegate: didSelectVoice %@ with selectedLanguageValue %@", buf, 0x16u);
  }

  [(HSPCSiriVoiceSelectionController *)self _applyOnboardingSelectionsIfNeededForSelectedLanguageValue:v9];
  unsigned int v11 = [(HSPCSiriVoiceSelectionController *)self config];
  v12 = [v11 delegate];
  id v13 = [(HSPCSiriVoiceSelectionController *)self config];
  id v14 = [v12 stateMachineConfigurationGetLaunchReason:v13];

  if ([(HSPCSiriVoiceSelectionController *)self _shouldEnableShareSiriAnalytics])
  {
    int v15 = [(HSPCSiriVoiceSelectionController *)self config];
    id v16 = [v15 addedAccessory];
    __int16 v17 = [v16 name];
    v18 = +[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:self accessoryName:v17];
  }
  else
  {
    v18 = +[NAFuture futureWithNoResult];
  }
  if (v14 == (id)3
    && [(HSPCSiriVoiceSelectionController *)self _isVoiceRecognitionEnabled])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100007900;
    v26[3] = &unk_1000A8EA8;
    v26[4] = self;
    id v19 = [v18 addSuccessBlock:v26];
  }
  else
  {
    unsigned int v20 = [(HSPCSiriVoiceSelectionController *)self coordinator];
    objc_super v21 = [v20 nextViewController];

    v29[0] = v18;
    v29[1] = v21;
    v22 = +[NSArray arrayWithObjects:v29 count:2];
    v23 = +[NAFuture chainFutures:v22];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100007910;
    v25[3] = &unk_1000A8EA8;
    v25[4] = self;
    id v24 = [v23 addSuccessBlock:v25];
  }
}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
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

- (id)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (VTUIVoiceSelectionViewController)voiceSelectionViewController
{
  return self->_voiceSelectionViewController;
}

- (void)setVoiceSelectionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end