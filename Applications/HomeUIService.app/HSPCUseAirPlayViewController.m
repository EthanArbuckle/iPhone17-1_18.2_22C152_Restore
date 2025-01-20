@interface HSPCUseAirPlayViewController
- (HSPCUseAirPlayViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UIImageView)speakerIconImageView;
- (UIView)airplayIconView;
- (UIView)containerView;
- (id)_applyOnboardingSelections;
- (id)_applyOnboardingSelectionsIfNeeded;
- (id)_enableAirPlay;
- (id)commitConfiguration;
- (void)setAirplayIconView:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSpeakerIconImageView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCUseAirPlayViewController

- (HSPCUseAirPlayViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UIView);
  id v9 = objc_alloc((Class)UIImageView);
  v10 = +[UIImage hu_airPlaySpeakerImage];
  id v11 = [v9 initWithImage:v10];

  v12 = [v11 layer];
  [v12 setMasksToBounds:1];

  [v11 setContentMode:2];
  v13 = -[HUAirPlayIconView initWithFrame:]([HUAirPlayIconView alloc], "initWithFrame:", 0.0, 0.0, 34.0, 34.0);
  [v8 addSubview:v11];
  [v8 addSubview:v13];
  v25.receiver = self;
  v25.super_class = (Class)HSPCUseAirPlayViewController;
  v14 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v25, "initWithCenterContentView:size:", v8, 75.0, 75.0);
  v15 = v14;
  if (v14)
  {
    [(HSPCUseAirPlayViewController *)v14 setConfig:v7];
    [(HSPCUseAirPlayViewController *)v15 setCoordinator:v6];
    [(HSPCUseAirPlayViewController *)v15 setContainerView:v8];
    [(HSPCUseAirPlayViewController *)v15 setSpeakerIconImageView:v11];
    [(HSPCUseAirPlayViewController *)v15 setAirplayIconView:v13];
    v16 = HULocalizedString();
    [(HSPCUseAirPlayViewController *)v15 setTitle:v16];

    v17 = HULocalizedString();
    id v18 = [(HSPCUseAirPlayViewController *)v15 addProminentButtonWithLocalizedTitle:v17 target:v15 futureSelector:"_enableAirPlay"];

    v19 = HULocalizedString();
    id v20 = [(HSPCUseAirPlayViewController *)v15 addOptionalButtonWithLocalizedTitle:v19 target:v15 futureSelector:"_applyOnboardingSelectionsIfNeeded"];

    v21 = [v7 addedAccessory];
    v22 = [v21 hf_userFriendlyLocalizedLowercaseDescription];
    v23 = HULocalizedStringWithFormat();
    -[HSPCUseAirPlayViewController setSubtitle:](v15, "setSubtitle:", v23, v22);
  }
  return v15;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0B68];
}

- (void)viewDidLoad
{
  v55.receiver = self;
  v55.super_class = (Class)HSPCUseAirPlayViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v55 viewDidLoad];
  v54 = [(HSPCUseAirPlayViewController *)self containerView];
  v52 = [v54 centerXAnchor];
  v53 = [(HSPCUseAirPlayViewController *)self contentView];
  v51 = [v53 mainContentGuide];
  v50 = [v51 centerXAnchor];
  v49 = [v52 constraintEqualToAnchor:v50];
  v56[0] = v49;
  v48 = [(HSPCUseAirPlayViewController *)self containerView];
  v46 = [v48 centerYAnchor];
  v47 = [(HSPCUseAirPlayViewController *)self contentView];
  v45 = [v47 mainContentGuide];
  v44 = [v45 centerYAnchor];
  v43 = [v46 constraintEqualToAnchor:v44];
  v56[1] = v43;
  v42 = [(HSPCUseAirPlayViewController *)self speakerIconImageView];
  v40 = [v42 centerXAnchor];
  v41 = [(HSPCUseAirPlayViewController *)self contentView];
  v39 = [v41 mainContentGuide];
  v38 = [v39 centerXAnchor];
  v37 = [v40 constraintEqualToAnchor:v38];
  v56[2] = v37;
  v36 = [(HSPCUseAirPlayViewController *)self speakerIconImageView];
  v34 = [v36 centerYAnchor];
  v35 = [(HSPCUseAirPlayViewController *)self contentView];
  v33 = [v35 mainContentGuide];
  v3 = [v33 centerYAnchor];
  v4 = [v34 constraintEqualToAnchor:v3];
  v56[3] = v4;
  v5 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  id v6 = [v5 widthAnchor];
  id v7 = [v6 constraintEqualToConstant:34.0];
  v56[4] = v7;
  id v8 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  id v9 = [v8 heightAnchor];
  v10 = [v9 constraintEqualToConstant:34.0];
  v56[5] = v10;
  id v11 = +[NSArray arrayWithObjects:v56 count:6];
  +[NSLayoutConstraint activateConstraints:v11];

  v12 = [(HSPCUseAirPlayViewController *)self speakerIconImageView];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v57.origin.x = v14;
  v57.origin.y = v16;
  v57.size.width = v18;
  v57.size.height = v20;
  CGRectGetMidX(v57);
  HURoundToScreenScale();
  double v22 = v21;
  v58.origin.x = v14;
  v58.origin.y = v16;
  v58.size.width = v18;
  v58.size.height = v20;
  CGRectGetMaxY(v58);
  v23 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  [v23 intrinsicContentSize];
  HURoundToScreenScale();
  double v25 = v24;

  v26 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  [v26 intrinsicContentSize];
  double v28 = v27;
  v29 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  [v29 intrinsicContentSize];
  double v31 = v30;
  v32 = [(HSPCUseAirPlayViewController *)self airplayIconView];
  [v32 setFrame:v22, v25, v28, v31];
}

- (id)_applyOnboardingSelections
{
  v3 = [(HSPCUseAirPlayViewController *)self config];
  v4 = [v3 addedAccessory];

  v5 = [v4 hf_siriEndpointProfile];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HSPCUseAirPlayViewController *)self config];
    id v8 = [v7 onboardingSelections];
    *(_DWORD *)buf = 138412290;
    double v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections: %@", buf, 0xCu);
  }
  id v16 = v5;
  double v17 = self;
  id v9 = v5;
  v10 = +[NAScheduler globalAsyncScheduler];
  id v11 = +[NAFuture futureWithBlock:&v15 scheduler:v10];
  v12 = +[NAScheduler mainThreadScheduler];
  double v13 = [v11 reschedule:v12];

  return v13;
}

- (id)_applyOnboardingSelectionsIfNeeded
{
  v3 = [(HSPCUseAirPlayViewController *)self config];
  v4 = [v3 onboardingSelections];

  v5 = HFLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = [(HSPCUseAirPlayViewController *)self config];
      id v8 = [v7 onboardingSelections];
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will not enable AirPlay selection but will apply existing selections: %@", buf, 0xCu);
    }
    id v9 = [(HSPCUseAirPlayViewController *)self _applyOnboardingSelections];
    v10 = [(HSPCUseAirPlayViewController *)self commitConfiguration];
    v14[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v14 count:2];
    v12 = +[NAFuture chainFutures:v11];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No onboarding selections to apply", buf, 2u);
    }

    v12 = [(HSPCUseAirPlayViewController *)self commitConfiguration];
  }

  return v12;
}

- (id)_enableAirPlay
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Adding Enable AirPlay selection", buf, 2u);
  }

  v4 = [(HSPCUseAirPlayViewController *)self config];
  v5 = [v4 onboardingSelections];

  if (v5)
  {
    BOOL v6 = [v5 languageValue];

    id v36 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    v41 = [(HSPCUseAirPlayViewController *)self config];
    v40 = [v41 onboardingSelections];
    id v7 = [v40 isSiriEnabled];
    v39 = [(HSPCUseAirPlayViewController *)self config];
    v38 = [v39 onboardingSelections];
    id v8 = [v38 allowHeySiri];
    id v9 = [(HSPCUseAirPlayViewController *)self config];
    id v10 = [v9 isPlaybackInfluencesForYouEnabled];
    [(HSPCUseAirPlayViewController *)self config];
    id v11 = v37 = v5;
    id v12 = [v11 isShareSiriAnalyticsEnabled];
    double v13 = [(HSPCUseAirPlayViewController *)self config];
    id v14 = [v13 isExplicitContentAllowed];
    if (v6)
    {
      uint64_t v15 = [v37 languageValue];
      id v16 = [v36 initWithSiriEnabled:v7 allowHeySiri:v8 airPlayEnabled:1 playbackInfluencesForYouEnabled:v10 shareSiriAnalyticsEnabled:v12 explicitContentAllowed:v14 languageValue:v15];
      double v17 = [(HSPCUseAirPlayViewController *)self config];
      [v17 setOnboardingSelections:v16];
    }
    else
    {
      id v29 = [v36 initWithSiriEnabled:v7 allowHeySiri:v8 airPlayEnabled:1 playbackInfluencesForYouEnabled:v10 shareSiriAnalyticsEnabled:v12 explicitContentAllowed:v14];
      double v30 = [(HSPCUseAirPlayViewController *)self config];
      [v30 setOnboardingSelections:v29];
    }
    v5 = v37;
    v26 = v41;
  }
  else
  {
    id v18 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
    double v19 = [(HSPCUseAirPlayViewController *)self config];
    id v20 = [v19 isPlaybackInfluencesForYouEnabled];
    double v21 = [(HSPCUseAirPlayViewController *)self config];
    id v22 = [v21 isShareSiriAnalyticsEnabled];
    v23 = [(HSPCUseAirPlayViewController *)self config];
    id v24 = [v18 initWithSiriEnabled:1 allowHeySiri:0 airPlayEnabled:1 playbackInfluencesForYouEnabled:v20 shareSiriAnalyticsEnabled:v22 explicitContentAllowed:[v23 isExplicitContentAllowed]];
    double v25 = [(HSPCUseAirPlayViewController *)self config];
    [v25 setOnboardingSelections:v24];

    v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = [(HSPCUseAirPlayViewController *)self config];
      double v28 = [v27 onboardingSelections];
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No existing onboarding selections found. This is unexpected. Will assume Siri should be disabled. Onboarding selections: %@", buf, 0xCu);
    }
  }

  double v31 = [(HSPCUseAirPlayViewController *)self _applyOnboardingSelections];
  v42[0] = v31;
  v32 = [(HSPCUseAirPlayViewController *)self commitConfiguration];
  v42[1] = v32;
  v33 = +[NSArray arrayWithObjects:v42 count:2];
  v34 = +[NAFuture chainFutures:v33];

  return v34;
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

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIImageView)speakerIconImageView
{
  return self->_speakerIconImageView;
}

- (void)setSpeakerIconImageView:(id)a3
{
}

- (UIView)airplayIconView
{
  return self->_airplayIconView;
}

- (void)setAirplayIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayIconView, 0);
  objc_storeStrong((id *)&self->_speakerIconImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end