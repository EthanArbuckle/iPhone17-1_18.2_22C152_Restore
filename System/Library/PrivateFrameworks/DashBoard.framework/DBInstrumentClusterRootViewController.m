@interface DBInstrumentClusterRootViewController
- (BOOL)_showDisclaimerLabel;
- (BOOL)_showSerialNumber;
- (BOOL)isGaugeCluster;
- (CARDisplayInfo)displayInfo;
- (DBEnvironment)environment;
- (DBInstrumentClusterApplicationViewController)applicationViewController;
- (DBInstrumentClusterRootViewController)initWithEnvironment:(id)a3;
- (NSString)lastTargetBundleIdentifier;
- (NSString)targetBundleIdentifier;
- (NSURL)lastClusterURL;
- (UILabel)appleConfidentialLabel;
- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)clusterLayoutViewController;
- (id)_disclaimerLabelWithText:(id)a3;
- (id)snapshotAppSceneView;
- (void)_createDisclaimerLabel;
- (void)_installClusterLayoutViewControllerIfNeeded;
- (void)_setupGaugeClusterLayoutViewController;
- (void)_showAssetErrorViewWithError:(id)a3;
- (void)backgroundScene;
- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3;
- (void)foregroundSceneWithURL:(id)a3;
- (void)invalidate;
- (void)setAppleConfidentialLabel:(id)a3;
- (void)setApplicationViewController:(id)a3;
- (void)setClusterLayoutViewController:(id)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setGaugeCluster:(BOOL)a3;
- (void)setLastClusterURL:(id)a3;
- (void)setLastTargetBundleIdentifier:(id)a3;
- (void)setTargetBundleIdentifier:(id)a3;
- (void)updateSceneWithAnimationSettings:(id)a3;
- (void)viewDidLoad;
@end

@implementation DBInstrumentClusterRootViewController

- (DBInstrumentClusterRootViewController)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DBInstrumentClusterRootViewController;
  v5 = [(DBInstrumentClusterRootViewController *)&v36 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_environment, v4);
    v8 = [v4 environmentConfiguration];
    [v8 addObserver:v6];

    v9 = [v4 environmentConfiguration];
    v10 = [v9 session];
    v11 = [v10 configuration];

    v12 = [v11 screens];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __61__DBInstrumentClusterRootViewController_initWithEnvironment___block_invoke;
    v34[3] = &unk_2649B3F28;
    id v13 = v4;
    id v35 = v13;
    v14 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v34);

    v15 = [v13 environmentConfiguration];
    int v16 = [v15 supportsGaugeCluster];

    uint64_t v17 = objc_msgSend(v11, "db_displayInfoForScreenInfo:", v14);
    displayInfo = v6->_displayInfo;
    v6->_displayInfo = (CARDisplayInfo *)v17;

    if (v16 && [(CARDisplayInfo *)v6->_displayInfo supportsDDPContent])
    {
      v6->_gaugeCluster = 1;
      v19 = DBLogForCategory(8uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Creating gauge cluster", v33, 2u);
      }

      [(DBInstrumentClusterRootViewController *)v6 _setupGaugeClusterLayoutViewController];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_showDisclaimerCallback, @"com.apple.CarPlay.internal.showDisclaimer", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v21 = [(DBInstrumentClusterRootViewController *)v6 environment];
      v22 = [v21 environmentConfiguration];
      v23 = [v22 themeController];
      applicationViewController = [v23 themeAssetDocument];

      v25 = [applicationViewController documentInfo];
      v26 = [v25 objectForKey:@"removeDisclaimerLabelOverride"];

      v27 = DBLogForCategory(8uLL);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "removeDisclaimerLabel value present - not creating disclaimer label", v33, 2u);
        }

        if (CRIsInternalInstall())
        {
          v29 = [MEMORY[0x263F30E28] showDisclaimerLabel];
          [v29 setInternalSettingsState:0];

          v30 = [MEMORY[0x263F30E28] showSerialNumber];
          [v30 setInternalSettingsState:0];
        }
      }
      else
      {
        if (v28)
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "removeDisclaimerLabel value not present - creating disclaimer label", v33, 2u);
        }

        [(DBInstrumentClusterRootViewController *)v6 _createDisclaimerLabel];
      }
    }
    else
    {
      v31 = [[DBInstrumentClusterApplicationViewController alloc] initWithEnvironment:v13];
      applicationViewController = v6->_applicationViewController;
      v6->_applicationViewController = v31;
    }
  }
  return v6;
}

uint64_t __61__DBInstrumentClusterRootViewController_initWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) environmentConfiguration];
  v5 = [v4 displayConfiguration];
  v6 = [v5 hardwareIdentifier];
  uint64_t v7 = [v3 isEqualToString:v6];

  return v7;
}

- (void)viewDidLoad
{
  v42[4] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)DBInstrumentClusterRootViewController;
  [(DBInstrumentClusterRootViewController *)&v41 viewDidLoad];
  [(DBInstrumentClusterRootViewController *)self _installClusterLayoutViewControllerIfNeeded];
  v3 = [(DBInstrumentClusterRootViewController *)self applicationViewController];

  if (v3)
  {
    id v4 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    [(DBInstrumentClusterRootViewController *)self addChildViewController:v4];

    v5 = [(DBInstrumentClusterRootViewController *)self view];
    v6 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    uint64_t v7 = [v6 view];
    [v5 addSubview:v7];

    v8 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    [v8 didMoveToParentViewController:self];

    v9 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    v10 = [v9 view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    BOOL v28 = (void *)MEMORY[0x263F08938];
    v40 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    v39 = [v40 view];
    v37 = [v39 leadingAnchor];
    v38 = [(DBInstrumentClusterRootViewController *)self view];
    objc_super v36 = [v38 safeAreaLayoutGuide];
    id v35 = [v36 leadingAnchor];
    v34 = [v37 constraintEqualToAnchor:v35];
    v42[0] = v34;
    v33 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    v32 = [v33 view];
    v30 = [v32 trailingAnchor];
    v31 = [(DBInstrumentClusterRootViewController *)self view];
    v29 = [v31 safeAreaLayoutGuide];
    v27 = [v29 trailingAnchor];
    v26 = [v30 constraintEqualToAnchor:v27];
    v42[1] = v26;
    v25 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    v24 = [v25 view];
    v22 = [v24 topAnchor];
    v23 = [(DBInstrumentClusterRootViewController *)self view];
    v21 = [v23 safeAreaLayoutGuide];
    v11 = [v21 topAnchor];
    v12 = [v22 constraintEqualToAnchor:v11];
    v42[2] = v12;
    id v13 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
    v14 = [v13 view];
    v15 = [v14 bottomAnchor];
    int v16 = [(DBInstrumentClusterRootViewController *)self view];
    uint64_t v17 = [v16 safeAreaLayoutGuide];
    v18 = [v17 bottomAnchor];
    v19 = [v15 constraintEqualToAnchor:v18];
    v42[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    [v28 activateConstraints:v20];
  }
}

- (id)snapshotAppSceneView
{
  v2 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
  v3 = [v2 view];
  id v4 = [v3 snapshotViewAfterScreenUpdates:0];

  return v4;
}

- (void)foregroundSceneWithURL:(id)a3
{
  id v4 = a3;
  [(DBInstrumentClusterRootViewController *)self setLastClusterURL:v4];
  id v5 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
  [v5 foregroundSceneWithURL:v4];
}

- (void)updateSceneWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
  [v5 updateSceneWithAnimationSettings:v4];
}

- (void)backgroundScene
{
  id v2 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
  [v2 backgroundScene];
}

- (void)setTargetBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[DBApplicationController sharedInstance];
  v6 = [v5 applicationWithBundleIdentifier:v4];

  if (([v6 supportsInstrumentClusterNavigation] & 1) != 0
    || [v6 isCertificationApp] && objc_msgSend(v6, "presentsFullScreen"))
  {
    uint64_t v7 = [(DBInstrumentClusterRootViewController *)self applicationViewController];

    if (v7)
    {
      v8 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
      int v9 = [v8 sceneViewControllerIsForeground];

      v10 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
      [v10 setTargetBundleIdentifier:v4];

      if (v9)
      {
        v11 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
        v12 = [(DBInstrumentClusterRootViewController *)self lastClusterURL];
        [v11 foregroundSceneWithURL:v12];
      }
    }
    else
    {
      id v13 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];

      if (v13)
      {
        v14 = DBLogForCategory(8uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v4;
          _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Should update active navigating app to: %@", (uint8_t *)&v16, 0xCu);
        }

        v15 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
        [v15 setActiveNavigatingApp:v4];
      }
    }
  }
}

- (void)invalidate
{
  v3 = [(DBInstrumentClusterRootViewController *)self applicationViewController];
  [v3 invalidate];

  id v4 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
  [v4 invalidate];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = [WeakRetained environmentConfiguration];
  [v6 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3
{
  if ([(DBInstrumentClusterRootViewController *)self isGaugeCluster])
  {
    id v4 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Cluster received pairedVehiclesDidChange: Creating gauge cluster", v5, 2u);
    }

    [(DBInstrumentClusterRootViewController *)self _setupGaugeClusterLayoutViewController];
  }
}

- (void)_setupGaugeClusterLayoutViewController
{
}

- (void)_showAssetErrorViewWithError:(id)a3
{
  v44[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (DBIsInternalInstall_onceToken_0 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_0, &__block_literal_global_1);
  }
  if (DBIsInternalInstall_isInternal_0)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    v6 = [MEMORY[0x263F825C8] blackColor];
    [v5 setBackgroundColor:v6];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [(DBInstrumentClusterRootViewController *)self view];
    [v7 addSubview:v5];

    v8 = [v4 userInfo];
    v42 = [v8 objectForKey:*MEMORY[0x263EFFB70]];

    int v9 = [v4 userInfo];
    objc_super v41 = [v9 objectForKey:*MEMORY[0x263EFFB58]];

    id v10 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v10 setNumberOfLines:0];
    [v10 setTextAlignment:1];
    v11 = [NSString stringWithFormat:@"Unable to load layout from layout document.\nAsset version: %@, identifier: %@", v42, v41];
    [v10 setText:v11];

    v12 = [MEMORY[0x263F825C8] whiteColor];
    [v10 setTextColor:v12];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 sizeToFit];
    id v13 = [(DBInstrumentClusterRootViewController *)self view];
    [v13 addSubview:v10];

    v29 = (void *)MEMORY[0x263F08938];
    v40 = [(DBInstrumentClusterRootViewController *)self view];
    v39 = [v40 leftAnchor];
    v38 = [v5 leftAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v44[0] = v37;
    objc_super v36 = [(DBInstrumentClusterRootViewController *)self view];
    id v35 = [v36 rightAnchor];
    v33 = [v5 rightAnchor];
    v32 = [v35 constraintEqualToAnchor:v33];
    v44[1] = v32;
    v31 = [(DBInstrumentClusterRootViewController *)self view];
    v30 = [v31 topAnchor];
    v34 = v5;
    BOOL v28 = [v5 topAnchor];
    v27 = [v30 constraintEqualToAnchor:v28];
    v44[2] = v27;
    v26 = [(DBInstrumentClusterRootViewController *)self view];
    v25 = [v26 bottomAnchor];
    v24 = [v5 bottomAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v44[3] = v23;
    v14 = [(DBInstrumentClusterRootViewController *)self view];
    v15 = [v14 centerXAnchor];
    [v10 centerXAnchor];
    int v16 = v43 = v4;
    id v17 = [v15 constraintEqualToAnchor:v16];
    v44[4] = v17;
    uint64_t v18 = [(DBInstrumentClusterRootViewController *)self view];
    v19 = [v18 centerYAnchor];
    v20 = [v10 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v44[5] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:6];
    [v29 activateConstraints:v22];

    id v4 = v43;
  }
}

- (void)_installClusterLayoutViewControllerIfNeeded
{
  v40[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
    v6 = [v5 parentViewController];

    if (!v6)
    {
      uint64_t v7 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      [(DBInstrumentClusterRootViewController *)self addChildViewController:v7];

      v8 = [(DBInstrumentClusterRootViewController *)self view];
      int v9 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      id v10 = [v9 view];
      [v8 addSubview:v10];

      v11 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      [v11 didMoveToParentViewController:self];

      v12 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      id v13 = [v12 view];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      BOOL v28 = (void *)MEMORY[0x263F08938];
      v39 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      v38 = [v39 view];
      objc_super v36 = [v38 leadingAnchor];
      v37 = [(DBInstrumentClusterRootViewController *)self view];
      id v35 = [v37 leadingAnchor];
      v34 = [v36 constraintEqualToAnchor:v35];
      v40[0] = v34;
      v33 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      v32 = [v33 view];
      v30 = [v32 trailingAnchor];
      v31 = [(DBInstrumentClusterRootViewController *)self view];
      v29 = [v31 trailingAnchor];
      v27 = [v30 constraintEqualToAnchor:v29];
      v40[1] = v27;
      v26 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      v25 = [v26 view];
      v24 = [v25 topAnchor];
      v14 = [(DBInstrumentClusterRootViewController *)self view];
      v15 = [v14 topAnchor];
      int v16 = [v24 constraintEqualToAnchor:v15];
      v40[2] = v16;
      id v17 = [(DBInstrumentClusterRootViewController *)self clusterLayoutViewController];
      uint64_t v18 = [v17 view];
      v19 = [v18 bottomAnchor];
      v20 = [(DBInstrumentClusterRootViewController *)self view];
      v21 = [v20 bottomAnchor];
      v22 = [v19 constraintEqualToAnchor:v21];
      v40[3] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
      [v28 activateConstraints:v23];
    }
  }
}

- (BOOL)_showDisclaimerLabel
{
  if (!CRIsInternalInstall()) {
    return 1;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showDisclaimerLabel", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)_showSerialNumber
{
  if (!CRIsInternalInstall()) {
    return 1;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showSerialNumber", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)_createDisclaimerLabel
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];

  if (v3)
  {
    id v4 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];
    [v4 removeFromSuperview];

    [(DBInstrumentClusterRootViewController *)self setAppleConfidentialLabel:0];
  }
  if ([(DBInstrumentClusterRootViewController *)self _showDisclaimerLabel])
  {
    id v5 = [NSString stringWithFormat:@"Apple Confidential: This test UI is for development purposes only and is not representative of the actual UI"];
  }
  else
  {
    id v5 = &stru_26E13A820;
  }
  if ([(DBInstrumentClusterRootViewController *)self _showSerialNumber])
  {
    v6 = (void *)MGCopyAnswer();
    if ([(__CFString *)v5 length]) {
      uint64_t v7 = @" - %@";
    }
    else {
      uint64_t v7 = @"%@";
    }
    uint64_t v8 = -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", v7, v6);

    id v5 = (__CFString *)v8;
  }
  if ([(__CFString *)v5 length])
  {
    int v9 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Created Disclaimer Label: %@", buf, 0xCu);
    }

    id v10 = [(DBInstrumentClusterRootViewController *)self _disclaimerLabelWithText:v5];
    [(DBInstrumentClusterRootViewController *)self setAppleConfidentialLabel:v10];

    v11 = [(DBInstrumentClusterRootViewController *)self view];
    v12 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];
    [v11 addSubview:v12];

    v23 = (void *)MEMORY[0x263F08938];
    v29 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];
    v27 = [v29 topAnchor];
    BOOL v28 = [(DBInstrumentClusterRootViewController *)self view];
    v26 = [v28 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];
    v22 = [v24 bottomAnchor];
    id v13 = [(DBInstrumentClusterRootViewController *)self view];
    v14 = [v13 topAnchor];
    v15 = [v22 constraintEqualToAnchor:v14 constant:10.0];
    v30[1] = v15;
    int v16 = [(DBInstrumentClusterRootViewController *)self appleConfidentialLabel];
    id v17 = [v16 centerXAnchor];
    uint64_t v18 = [(DBInstrumentClusterRootViewController *)self view];
    v19 = [v18 centerXAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v30[2] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    [v23 activateConstraints:v21];
  }
}

- (id)_disclaimerLabelWithText:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setText:v4];

  v6 = [MEMORY[0x263F825C8] redColor];
  [v5 setTextColor:v6];

  uint64_t v7 = [v5 font];
  uint64_t v8 = [v7 fontWithSize:10.0];
  [v5 setFont:v8];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTextAlignment:1];
  return v5;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (CARDisplayInfo)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (DBInstrumentClusterApplicationViewController)applicationViewController
{
  return self->_applicationViewController;
}

- (void)setApplicationViewController:(id)a3
{
}

- (NSURL)lastClusterURL
{
  return self->_lastClusterURL;
}

- (void)setLastClusterURL:(id)a3
{
}

- (NSString)lastTargetBundleIdentifier
{
  return self->_lastTargetBundleIdentifier;
}

- (void)setLastTargetBundleIdentifier:(id)a3
{
}

- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)clusterLayoutViewController
{
  return self->_clusterLayoutViewController;
}

- (void)setClusterLayoutViewController:(id)a3
{
}

- (BOOL)isGaugeCluster
{
  return self->_gaugeCluster;
}

- (void)setGaugeCluster:(BOOL)a3
{
  self->_gaugeCluster = a3;
}

- (UILabel)appleConfidentialLabel
{
  return self->_appleConfidentialLabel;
}

- (void)setAppleConfidentialLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleConfidentialLabel, 0);
  objc_storeStrong((id *)&self->_clusterLayoutViewController, 0);
  objc_storeStrong((id *)&self->_lastTargetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastClusterURL, 0);
  objc_storeStrong((id *)&self->_applicationViewController, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
}

@end