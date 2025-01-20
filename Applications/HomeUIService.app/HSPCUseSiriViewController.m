@interface HSPCUseSiriViewController
- (AFEnablementConfiguration)enablementConfiguration;
- (AFEnablementFlowConfigurationProvider)enablementFlowConfigurationProvider;
- (BOOL)_deviceIsOnAMultiUserLanguage;
- (BOOL)_isVoiceRecognitionEnabled;
- (BOOL)_shouldEnableShareSiriAnalytics;
- (HSPCUseSiriViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UIImageView)siriIconImageView;
- (UIView)siriIconContainerView;
- (id)_applyOnboardingSelections;
- (id)_disableSiri;
- (id)_enableSiriWithUserConfirmation;
- (id)_languageValueMatchingRecognitionLanguage:(id)a3 outputVoice:(id)a4;
- (id)commitConfiguration;
- (id)dismissButtonBlock;
- (void)_applyOnBoardingSelectionsWithFuture:(id)a3;
- (void)_enableSiriWithFuture:(id)a3;
- (void)_handleFooterLabelTouchForOpenURL:(id)a3;
- (void)_launchSiriPrivacySheet;
- (void)_setupOnBoardSelectionsWithLanguageValue:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEnablementConfiguration:(id)a3;
- (void)setEnablementFlowConfigurationProvider:(id)a3;
- (void)setSiriIconContainerView:(id)a3;
- (void)setSiriIconImageView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCUseSiriViewController

- (HSPCUseSiriViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UIView);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed();
  id v11 = [v9 initWithImage:v10];

  [v11 setBounds:0.0, 0.0, 98.0, 98.0];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v11];
  v41.receiver = self;
  v41.super_class = (Class)HSPCUseSiriViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v41, "initWithCenterContentView:size:", v8, 98.0, 98.0);
  v13 = v12;
  if (v12)
  {
    [(HSPCUseSiriViewController *)v12 setConfig:v7];
    [(HSPCUseSiriViewController *)v13 setCoordinator:v6];
    [(HSPCUseSiriViewController *)v13 setSiriIconImageView:v11];
    [(HSPCUseSiriViewController *)v13 setSiriIconContainerView:v8];
    v14 = HULocalizedString();
    [(HSPCUseSiriViewController *)v13 setTitle:v14];

    v15 = HULocalizedString();
    id v16 = [(HSPCUseSiriViewController *)v13 addProminentButtonWithLocalizedTitle:v15 target:v13 futureSelector:"_enableSiriWithUserConfirmation"];

    v17 = HULocalizedString();
    id v18 = [(HSPCUseSiriViewController *)v13 addOptionalButtonWithLocalizedTitle:v17 target:v13 futureSelector:"_disableSiri"];

    v19 = [v7 addedAccessory];
    v20 = [v19 hf_userFriendlyLocalizedLowercaseDescription];
    v21 = [v7 home];
    v22 = HULocalizedSiriTriggerPhrase();
    v23 = HULocalizedStringWithFormat();
    -[HSPCUseSiriViewController setSubtitle:](v13, "setSubtitle:", v23, v20, v22);

    v24 = [(HSPCUseSiriViewController *)v13 config];
    [v24 setIsPlaybackInfluencesForYouEnabled:1];

    v25 = +[AFPreferences sharedPreferences];
    id v26 = [v25 siriDataSharingOptInStatus];

    BOOL v27 = v26 == (id)1;
    v28 = [(HSPCUseSiriViewController *)v13 config];
    [v28 setIsShareSiriAnalyticsEnabled:v27];

    id v29 = +[HFManagedConfigurationUtilities isExplicitContentAllowed];
    v30 = [(HSPCUseSiriViewController *)v13 config];
    [v30 setIsExplicitContentAllowed:v29];

    v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(HSPCUseSiriViewController *)v13 config];
      unsigned int v33 = [v32 isPlaybackInfluencesForYouEnabled];
      v34 = [(HSPCUseSiriViewController *)v13 config];
      unsigned int v35 = [v34 isShareSiriAnalyticsEnabled];
      [(HSPCUseSiriViewController *)v13 config];
      id v40 = v7;
      v37 = id v36 = v6;
      unsigned int v38 = [v37 isExplicitContentAllowed];
      *(_DWORD *)buf = 67109632;
      unsigned int v43 = v33;
      __int16 v44 = 1024;
      unsigned int v45 = v35;
      __int16 v46 = 1024;
      unsigned int v47 = v38;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "isPlaybackInfluencesForYouEnabled = %{BOOL}d | isShareSiriAnalyticsEnabled = %{BOOL}d | isExplicitContentAllowed = %{BOOL}d", buf, 0x14u);

      id v6 = v36;
      id v7 = v40;
    }
  }

  return v13;
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)HSPCUseSiriViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v53 viewDidLoad];
  v3 = +[PRXLabel labelWithStyle:3];
  uint64_t v4 = HULocalizedString();
  id v5 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v57 = NSForegroundColorAttributeName;
  id v6 = +[UIColor hf_keyColor];
  v58 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v50 = (void *)v4;
  id v52 = [v5 initWithString:v4 attributes:v7];

  id v8 = objc_alloc((Class)NSMutableAttributedString);
  id v9 = HULocalizedString();
  id v51 = [v8 initWithString:v9];

  [v51 appendAttributedString:v52];
  id v10 = [v51 copy];
  [v3 setAttributedText:v10];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = v3;
  [v3 setUserInteractionEnabled:1];
  id v12 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  CFStringRef v55 = @"URL_KEY";
  v13 = +[HFURLComponents siriPrivacyURL];
  v56 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  id v49 = [v12 initWithTarget:self action:"_handleFooterLabelTouchForOpenURL:" hitBoxString:v4 userInfo:v14];

  v15 = v11;
  [v11 addGestureRecognizer:v49];
  id v16 = [(HSPCUseSiriViewController *)self contentView];
  [v16 addSubview:v11];

  v17 = [(HSPCUseSiriViewController *)self contentView];
  id v18 = [v17 mainContentGuide];

  v48 = [(HSPCUseSiriViewController *)self siriIconImageView];
  unsigned int v47 = [v48 centerXAnchor];
  __int16 v46 = [v18 centerXAnchor];
  unsigned int v45 = [v47 constraintEqualToAnchor:v46];
  v54[0] = v45;
  __int16 v44 = [(HSPCUseSiriViewController *)self siriIconImageView];
  unsigned int v43 = [v44 topAnchor];
  v42 = [v18 topAnchor];
  objc_super v41 = [v43 constraintEqualToAnchor:v42];
  v54[1] = v41;
  id v40 = [(HSPCUseSiriViewController *)self siriIconImageView];
  v39 = [v40 widthAnchor];
  unsigned int v38 = [v39 constraintEqualToConstant:98.0];
  v54[2] = v38;
  v37 = [(HSPCUseSiriViewController *)self siriIconImageView];
  unsigned int v35 = [v37 heightAnchor];
  v34 = [v35 constraintEqualToConstant:98.0];
  v54[3] = v34;
  v32 = [v11 centerXAnchor];
  v31 = [v18 centerXAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v54[4] = v30;
  id v36 = v11;
  id v29 = [v11 topAnchor];
  v19 = [(HSPCUseSiriViewController *)self siriIconImageView];
  v20 = [v19 bottomAnchor];
  v21 = [v29 constraintEqualToAnchor:v20 constant:20.0];
  v54[5] = v21;
  v22 = [v11 bottomAnchor];
  unsigned int v33 = v18;
  v23 = [v18 bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v54[6] = v24;
  v25 = [v15 widthAnchor];
  id v26 = [v18 widthAnchor];
  BOOL v27 = [v25 constraintLessThanOrEqualToAnchor:v26];
  v54[7] = v27;
  v28 = +[NSArray arrayWithObjects:v54 count:8];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (id)commitConfiguration
{
  v3 = [(HSPCUseSiriViewController *)self config];
  uint64_t v4 = [v3 delegate];
  id v5 = [(HSPCUseSiriViewController *)self config];
  id v6 = [v4 stateMachineConfigurationGetLaunchReason:v5];

  if (v6 == (id)3
    && ([(HSPCUseSiriViewController *)self _isVoiceRecognitionEnabled]
     || ![(HSPCUseSiriViewController *)self _deviceIsOnAMultiUserLanguage]))
  {
    id v7 = &off_1000AFFE0;
  }
  else
  {
    id v7 = &off_1000AFFF8;
  }
  id v8 = +[NAFuture futureWithResult:v7];

  return v8;
}

- (id)dismissButtonBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001368C;
  v4[3] = &unk_1000A90B0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
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

      [(HSPCUseSiriViewController *)self _launchSiriPrivacySheet];
    }
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006603C(v9);
    }

    NSLog(@"Footer link pressed w/ url intention but no url found");
  }
}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3 = [(HSPCUseSiriViewController *)self navigationController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (HSPCUseSiriViewController *)v3;
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  id v7 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:OBPrivacySiriIdentifier];
  [v7 setPresentingViewController:v6];

  [v7 present];
}

- (id)_disableSiri
{
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User opted to not enable Siri, saving onboarding selection", v27, 2u);
  }

  uint64_t v4 = [(HSPCUseSiriViewController *)self config];
  id v5 = [v4 addedAccessory];

  id v6 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
  id v7 = [v5 hf_isDumbSpeaker];
  id v8 = [(HSPCUseSiriViewController *)self config];
  id v9 = [v8 isPlaybackInfluencesForYouEnabled];
  id v10 = [(HSPCUseSiriViewController *)self config];
  id v11 = [v6 initWithSiriEnabled:1 allowHeySiri:0 airPlayEnabled:v7 playbackInfluencesForYouEnabled:v9 shareSiriAnalyticsEnabled:0 explicitContentAllowed:[v10 isExplicitContentAllowed]];
  id v12 = [(HSPCUseSiriViewController *)self config];
  [v12 setOnboardingSelections:v11];

  v13 = [(HSPCUseSiriViewController *)self config];
  v14 = [v13 delegate];
  v15 = [(HSPCUseSiriViewController *)self config];
  id v16 = [v14 stateMachineConfigurationGetLaunchReason:v15];

  if (v16 == (id)3) {
    v17 = &off_1000AFFE0;
  }
  else {
    v17 = &off_1000AFFF8;
  }
  id v18 = +[NAFuture futureWithResult:v17];
  if ([(HSPCUseSiriViewController *)self _shouldEnableShareSiriAnalytics])
  {
    v19 = [(HSPCUseSiriViewController *)self config];
    v20 = [v19 addedAccessory];
    v21 = [v20 name];
    v22 = +[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:self accessoryName:v21];
  }
  else
  {
    v22 = +[NAFuture futureWithNoResult];
  }
  v23 = [(HSPCUseSiriViewController *)self _applyOnboardingSelections];
  v28[0] = v23;
  v28[1] = v22;
  v28[2] = v18;
  v24 = +[NSArray arrayWithObjects:v28 count:3];
  v25 = +[NAFuture chainFutures:v24];

  return v25;
}

- (id)_enableSiriWithUserConfirmation
{
  id v3 = objc_alloc_init((Class)NAFuture);
  uint64_t v4 = [(HSPCUseSiriViewController *)self config];
  id v5 = [v4 addedAccessory];

  id v6 = [v5 hf_siriEndpointProfile];
  if ([v6 supportsOnboarding])
  {
    id v7 = [v6 currentAssistant];
    id v8 = v7;
    if (v7 && ([v7 isSiriAssistant] & 1) == 0)
    {
      id v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      v19 = [v8 name];
      v22 = HULocalizedStringWithFormat();

      v20 = [v8 name];
      v21 = HULocalizedStringWithFormat();

      id v12 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v22, v21, 1, v20);
      v13 = HULocalizedString();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100013EE0;
      v25[3] = &unk_1000A9480;
      v25[4] = self;
      id v14 = v3;
      id v26 = v14;
      v15 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v25];
      [v12 addAction:v15];

      id v16 = HULocalizedString();
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100013EEC;
      v23[3] = &unk_1000A94A8;
      id v24 = v14;
      v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v23];
      [v12 addAction:v17];

      [(HSPCUseSiriViewController *)self presentViewController:v12 animated:1 completion:0];
    }
    else
    {
      [(HSPCUseSiriViewController *)self _enableSiriWithFuture:v3];
    }
    id v10 = v3;
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri onboarding is not supported, will skip remainder of Siri flow", buf, 2u);
    }

    id v10 = [(HSPCUseSiriViewController *)self commitConfiguration];
  }

  return v10;
}

- (void)_enableSiriWithFuture:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding Enable Siri selection", buf, 2u);
  }

  id v6 = [(HSPCUseSiriViewController *)self config];
  id v7 = [v6 addedAccessory];

  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 accessorySettingsDataSource];

  id v10 = +[AFPreferences sharedPreferences];
  id v11 = [v10 languageCode];

  if (!v11)
  {
    id v12 = +[AFPreferences sharedPreferences];
    id v11 = [v12 bestSupportedLanguageCodeForLanguageCode:0];
  }
  v13 = +[AFPreferences sharedPreferences];
  id v14 = [v13 outputVoice];

  v15 = [(HSPCUseSiriViewController *)self config];
  [v15 setRecognitionLanguage:v11];

  id v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v11;
    __int16 v32 = 2112;
    unsigned int v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iOSSiriRecognitionLanguage = [%@], iOSSiriOutputVoice = [%@]", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v17 = [v7 home];
  id v18 = [v17 uniqueIdentifier];
  v19 = [v7 uniqueIdentifier];
  uint64_t v29 = HFSiriAvailableLanguagesSettingKeyPath;
  v20 = +[NSArray arrayWithObjects:&v29 count:1];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100014258;
  v24[3] = &unk_1000A95B0;
  objc_copyWeak(&v28, (id *)buf);
  id v21 = v14;
  id v25 = v21;
  id v22 = v11;
  id v26 = v22;
  id v23 = v4;
  id v27 = v23;
  [v9 hf_fetchAccessorySettingsWithHomeIdentifier:v18 accessoryIdentifier:v19 keyPaths:v20 completionHandler:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_isVoiceRecognitionEnabled
{
  id v4 = objc_alloc((Class)HFUserItem);
  id v5 = [(HSPCUseSiriViewController *)self config];
  id v6 = [v5 home];
  id v7 = [(HSPCUseSiriViewController *)self config];
  id v8 = [v7 home];
  id v9 = [v8 currentUser];
  id v10 = [v4 initWithHome:v6 user:v9 nameStyle:0];

  unsigned int v11 = [v10 isIdentifyVoiceEnabled];
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    int v15 = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
  }
  return v11;
}

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  id v3 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (v3)
  {
    unsigned __int8 v4 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v3 shouldFallbackToBestSupportedLanguage:1];
  }
  else
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000660E8(a2, v5);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_applyOnboardingSelections
{
  id v3 = [(HSPCUseSiriViewController *)self config];
  unsigned __int8 v4 = [v3 addedAccessory];

  id v5 = [v4 hf_siriEndpointProfile];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HSPCUseSiriViewController *)self config];
    id v8 = [v7 onboardingSelections];
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);
  }
  id v16 = v5;
  __int16 v17 = self;
  id v9 = v5;
  id v10 = +[NAScheduler globalAsyncScheduler];
  unsigned int v11 = +[NAFuture futureWithBlock:&v15 scheduler:v10];
  id v12 = +[NAScheduler mainThreadScheduler];
  v13 = [v11 reschedule:v12];

  return v13;
}

- (id)_languageValueMatchingRecognitionLanguage:(id)a3 outputVoice:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (a3 && v6)
  {
    id v9 = [(HSPCUseSiriViewController *)self config];
    id v10 = [v9 availableSiriLanguageValues];

    if (v10)
    {
      unsigned int v11 = [(HSPCUseSiriViewController *)self config];
      id v12 = [v11 availableSiriLanguageValues];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000152F8;
      v14[3] = &unk_1000A8E80;
      v14[4] = self;
      id v15 = v7;
      id v8 = [v12 na_firstObjectPassingTest:v14];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_setupOnBoardSelectionsWithLanguageValue:(id)a3
{
  id v17 = a3;
  unsigned __int8 v4 = [(HSPCUseSiriViewController *)self config];
  id v5 = [v4 addedAccessory];

  id v6 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
  id v7 = [v5 hf_isDumbSpeaker];
  id v8 = [(HSPCUseSiriViewController *)self config];
  id v9 = [v8 isPlaybackInfluencesForYouEnabled];
  id v10 = [(HSPCUseSiriViewController *)self config];
  id v11 = [v10 isShareSiriAnalyticsEnabled];
  id v12 = [(HSPCUseSiriViewController *)self config];
  id v13 = [v12 isExplicitContentAllowed];
  if (v17) {
    id v14 = [v6 initWithSiriEnabled:1 allowHeySiri:1 airPlayEnabled:v7 playbackInfluencesForYouEnabled:v9 shareSiriAnalyticsEnabled:v11 explicitContentAllowed:v13 languageValue:v17];
  }
  else {
    id v14 = [v6 initWithSiriEnabled:1 allowHeySiri:1 airPlayEnabled:v7 playbackInfluencesForYouEnabled:v9 shareSiriAnalyticsEnabled:v11 explicitContentAllowed:v13];
  }
  id v15 = v14;
  id v16 = [(HSPCUseSiriViewController *)self config];
  [v16 setOnboardingSelections:v15];
}

- (void)_applyOnBoardingSelectionsWithFuture:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCUseSiriViewController *)self config];
  id v6 = [v5 addedAccessory];

  id v7 = [v6 hf_siriEndpointProfile];
  id v8 = objc_opt_new();
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(HSPCUseSiriViewController *)self config];
    id v11 = [v10 onboardingSelections];
    *(_DWORD *)buf = 138412290;
    unsigned int v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);
  }
  id v12 = &AnalyticsSendEvent_ptr;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001597C;
  v31[3] = &unk_1000A9600;
  id v13 = v7;
  id v32 = v13;
  unsigned int v33 = self;
  id v14 = +[NAScheduler globalAsyncScheduler];
  id v15 = +[NAFuture futureWithBlock:v31 scheduler:v14];
  id v16 = +[NAScheduler mainThreadScheduler];
  id v17 = [v15 reschedule:v16];

  [v8 addObject:v17];
  if ([(HSPCUseSiriViewController *)self _shouldEnableShareSiriAnalytics])
  {
    id v18 = [(HSPCUseSiriViewController *)self config];
    __int16 v19 = [v18 addedAccessory];
    [v19 name];
    id v21 = v20 = v6;
    id v22 = +[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForSingleAccessory:self accessoryName:v21];

    id v6 = v20;
    id v12 = &AnalyticsSendEvent_ptr;
  }
  else
  {
    id v22 = +[NAFuture futureWithNoResult];
  }
  [v8 addObject:v22];
  id v23 = [(HSPCUseSiriViewController *)self commitConfiguration];
  [v8 addObject:v23];

  id v24 = v12[335];
  id v25 = [v8 copy];
  id v26 = [v24 chainFutures:v25];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100015B54;
  v29[3] = &unk_1000A8D98;
  id v30 = v4;
  id v27 = v4;
  id v28 = [v26 addCompletionBlock:v29];
}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HSPCUseSiriViewController *)self config];
    unsigned int v5 = [v4 isShareSiriAnalyticsEnabled];
    id v6 = [(HSPCUseSiriViewController *)self config];
    id v7 = [v6 onboardingSelections];
    int v13 = 136315650;
    id v14 = "-[HSPCUseSiriViewController _shouldEnableShareSiriAnalytics]";
    __int16 v15 = 1024;
    unsigned int v16 = v5;
    __int16 v17 = 1024;
    unsigned int v18 = [v7 allowHeySiri];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s *** Value for  self.config.isShareSiriAnalyticsEnabled *** = %{BOOL}d, allowHeySiri = %{BOOL}d", (uint8_t *)&v13, 0x18u);
  }
  id v8 = [(HSPCUseSiriViewController *)self config];
  if ([v8 isShareSiriAnalyticsEnabled])
  {
    id v9 = [(HSPCUseSiriViewController *)self config];
    id v10 = [v9 onboardingSelections];
    unsigned __int8 v11 = [v10 allowHeySiri];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
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

- (AFEnablementFlowConfigurationProvider)enablementFlowConfigurationProvider
{
  return self->_enablementFlowConfigurationProvider;
}

- (void)setEnablementFlowConfigurationProvider:(id)a3
{
}

- (AFEnablementConfiguration)enablementConfiguration
{
  return self->_enablementConfiguration;
}

- (void)setEnablementConfiguration:(id)a3
{
}

- (UIImageView)siriIconImageView
{
  return self->_siriIconImageView;
}

- (void)setSiriIconImageView:(id)a3
{
}

- (UIView)siriIconContainerView
{
  return self->_siriIconContainerView;
}

- (void)setSiriIconContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIconContainerView, 0);
  objc_storeStrong((id *)&self->_siriIconImageView, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_enablementFlowConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end