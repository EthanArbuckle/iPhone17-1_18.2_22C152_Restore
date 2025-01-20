@interface DBAppDockViewController
- (BOOL)isDockEnabled;
- (BOOL)isFocusHighlightCompositingFilterEnabled;
- (DBAppDockButton)audioAppButton;
- (DBAppDockButton)navigationAppButton;
- (DBAppDockButton)otherAppButton;
- (DBAppDockViewController)initWithAppHistory:(id)a3 iconProvider:(id)a4 environmentConfiguration:(id)a5;
- (DBAppDockViewControllerDelegate)appDockViewControllerDelegate;
- (DBAppHistory)appHistory;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBIconProviding)iconProvider;
- (DBNowPlayingObserver)nowPlayingObserver;
- (NSArray)audioAppButtonSizeConstraints;
- (NSArray)navigationAppButtonSizeConstraints;
- (NSArray)orderedAppItems;
- (NSArray)otherAppButtonSizeConstraints;
- (NSString)activeBundleIdentifier;
- (UIColor)buttonFocusHighlightColor;
- (UIStackView)dockItemStackView;
- (id)_buttonSizeConstraintsForButton:(id)a3;
- (id)_generateOrderedAppItems;
- (id)preferredFocusEnvironments;
- (void)_dockButtonPressed:(id)a3;
- (void)_refreshAppDock;
- (void)_updateAppDockButtonForBundleIdentifier:(id)a3 animated:(BOOL)a4;
- (void)_updateAudioButtonSizeConstraints;
- (void)_updateNavigationBundleIdentifier:(BOOL)a3;
- (void)_updateNavigationButtonSizeConstraints;
- (void)_updateNowPlayingBundleIdentifier:(BOOL)a3;
- (void)_updateOtherButtonSizeConstraints;
- (void)activeIntentWithBundleId:(id)a3;
- (void)dealloc;
- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4;
- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4;
- (void)nowPlayingObserver:(id)a3 didUpdatePlaybackState:(BOOL)a4 inApplication:(id)a5;
- (void)setActiveBundleIdentifier:(id)a3;
- (void)setActiveBundleIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setAppDockViewControllerDelegate:(id)a3;
- (void)setAudioAppButton:(id)a3;
- (void)setAudioAppButtonSizeConstraints:(id)a3;
- (void)setButtonFocusHighlightColor:(id)a3;
- (void)setDockEnabled:(BOOL)a3;
- (void)setDockItemStackView:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setFocusHighlightCompositingFilterEnabled:(BOOL)a3;
- (void)setIconProvider:(id)a3;
- (void)setNavigationAppButton:(id)a3;
- (void)setNavigationAppButtonSizeConstraints:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setOrderedAppItems:(id)a3;
- (void)setOtherAppButton:(id)a3;
- (void)setOtherAppButtonSizeConstraints:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DBAppDockViewController

- (DBAppDockViewController)initWithAppHistory:(id)a3 iconProvider:(id)a4 environmentConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DBAppDockViewController;
  v12 = [(DBAppDockViewController *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environmentConfiguration, a5);
    objc_storeStrong((id *)&v13->_appHistory, a3);
    v14 = [[DBNowPlayingObserver alloc] initWithEnvironmentConfiguration:v11];
    nowPlayingObserver = v13->_nowPlayingObserver;
    v13->_nowPlayingObserver = v14;

    v16 = [(DBAppDockViewController *)v13 nowPlayingObserver];
    [v16 setDelegate:v13];

    objc_storeWeak((id *)&v13->_iconProvider, v10);
    uint64_t v17 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    buttonFocusHighlightColor = v13->_buttonFocusHighlightColor;
    v13->_buttonFocusHighlightColor = (UIColor *)v17;

    v19 = [v11 navigationStateProvider];
    [v19 addObserver:v13];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)_appDockRefreshAppsCallBack, @"com.apple.CarPlay.internal.refreshApps", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v13 selector:sel__refreshAppDock name:@"CARRefreshAppDockNotification" object:0];
  }
  return v13;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)DBAppDockViewController;
  [(DBAppDockViewController *)&v5 dealloc];
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)DBAppDockViewController;
  [(DBAppDockViewController *)&v11 viewWillLayoutSubviews];
  v3 = [(DBAppDockViewController *)self environmentConfiguration];
  int v4 = [v3 hasDualStatusBar];

  if (v4) {
    goto LABEL_6;
  }
  objc_super v5 = [(DBAppDockViewController *)self environmentConfiguration];
  if ([v5 currentStatusBarEdge] != 1)
  {
    v6 = [(DBAppDockViewController *)self environmentConfiguration];
    uint64_t v7 = [v6 currentStatusBarEdge];

    if (v7 == 3) {
      goto LABEL_5;
    }
LABEL_6:
    v8 = [(DBAppDockViewController *)self dockItemStackView];
    id v9 = v8;
    uint64_t v10 = 1;
    goto LABEL_7;
  }

LABEL_5:
  v8 = [(DBAppDockViewController *)self dockItemStackView];
  id v9 = v8;
  uint64_t v10 = 0;
LABEL_7:
  [v8 setAxis:v10];

  [(DBAppDockViewController *)self _updateNavigationButtonSizeConstraints];
  [(DBAppDockViewController *)self _updateAudioButtonSizeConstraints];
  [(DBAppDockViewController *)self _updateOtherButtonSizeConstraints];
}

- (void)viewDidLoad
{
  v17[2] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBAppDockViewController;
  [(DBAppDockViewController *)&v16 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAlignment:3];
  [v3 setAccessibilityLabel:@"CARAppDockStackView"];
  int v4 = [(DBAppDockViewController *)self view];
  [v4 addSubview:v3];

  v14 = (void *)MEMORY[0x263F08938];
  v15 = [(DBAppDockViewController *)self view];
  objc_super v5 = [v15 centerYAnchor];
  v6 = [v3 centerYAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  v17[0] = v7;
  v8 = [(DBAppDockViewController *)self view];
  id v9 = [v8 widthAnchor];
  uint64_t v10 = [v3 widthAnchor];
  objc_super v11 = [v9 constraintEqualToAnchor:v10];
  v17[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [v14 activateConstraints:v12];

  [(DBAppDockViewController *)self setDockItemStackView:v3];
  v13 = [(DBAppDockViewController *)self _generateOrderedAppItems];
  [(DBAppDockViewController *)self setOrderedAppItems:v13];

  [(DBAppDockViewController *)self setDockEnabled:1];
}

- (void)setDockEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(DBAppDockViewController *)self navigationAppButton];
  [v5 setEnabled:v3];

  v6 = [(DBAppDockViewController *)self audioAppButton];
  [v6 setEnabled:v3];

  id v7 = [(DBAppDockViewController *)self otherAppButton];
  [v7 setEnabled:v3];
}

- (void)setButtonFocusHighlightColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DBAppDockViewController *)self navigationAppButton];
  [v5 setFocusHighlightColor:v4];

  v6 = [(DBAppDockViewController *)self audioAppButton];
  [v6 setFocusHighlightColor:v4];

  id v7 = [(DBAppDockViewController *)self otherAppButton];
  [v7 setFocusHighlightColor:v4];
}

- (void)setFocusHighlightCompositingFilterEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(DBAppDockViewController *)self navigationAppButton];
  [v5 setCompositingFilterEnabled:v3];

  v6 = [(DBAppDockViewController *)self audioAppButton];
  [v6 setCompositingFilterEnabled:v3];

  id v7 = [(DBAppDockViewController *)self otherAppButton];
  [v7 setCompositingFilterEnabled:v3];
}

- (id)_buttonSizeConstraintsForButton:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  double v4 = 45.0;
  id v5 = a3;
  v6 = [(DBAppDockViewController *)self environmentConfiguration];
  uint64_t v7 = [v6 currentStatusBarEdge];

  if (v7 == 2) {
    double v8 = 45.0;
  }
  else {
    double v8 = 37.0;
  }
  if (v7 == 2) {
    double v4 = 37.0;
  }
  id v9 = [v5 widthAnchor];
  uint64_t v10 = [v9 constraintEqualToConstant:v8];
  v15[0] = v10;
  objc_super v11 = [v5 heightAnchor];

  v12 = [v11 constraintEqualToConstant:v4];
  v15[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  return v13;
}

- (void)_updateNavigationButtonSizeConstraints
{
  BOOL v3 = [(DBAppDockViewController *)self navigationAppButtonSizeConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F08938];
    id v5 = [(DBAppDockViewController *)self navigationAppButtonSizeConstraints];
    [v4 deactivateConstraints:v5];
  }
  v6 = [(DBAppDockViewController *)self navigationAppButton];

  if (v6)
  {
    uint64_t v7 = [(DBAppDockViewController *)self navigationAppButton];
    double v8 = [(DBAppDockViewController *)self _buttonSizeConstraintsForButton:v7];
    [(DBAppDockViewController *)self setNavigationAppButtonSizeConstraints:v8];

    id v9 = (void *)MEMORY[0x263F08938];
    id v10 = [(DBAppDockViewController *)self navigationAppButtonSizeConstraints];
    [v9 activateConstraints:v10];
  }
  else
  {
    [(DBAppDockViewController *)self setNavigationAppButtonSizeConstraints:0];
  }
}

- (void)_updateAudioButtonSizeConstraints
{
  BOOL v3 = [(DBAppDockViewController *)self audioAppButtonSizeConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F08938];
    id v5 = [(DBAppDockViewController *)self audioAppButtonSizeConstraints];
    [v4 deactivateConstraints:v5];
  }
  v6 = [(DBAppDockViewController *)self audioAppButton];

  if (v6)
  {
    uint64_t v7 = [(DBAppDockViewController *)self audioAppButton];
    double v8 = [(DBAppDockViewController *)self _buttonSizeConstraintsForButton:v7];
    [(DBAppDockViewController *)self setAudioAppButtonSizeConstraints:v8];

    id v9 = (void *)MEMORY[0x263F08938];
    id v10 = [(DBAppDockViewController *)self audioAppButtonSizeConstraints];
    [v9 activateConstraints:v10];
  }
  else
  {
    [(DBAppDockViewController *)self setAudioAppButtonSizeConstraints:0];
  }
}

- (void)_updateOtherButtonSizeConstraints
{
  BOOL v3 = [(DBAppDockViewController *)self otherAppButtonSizeConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F08938];
    id v5 = [(DBAppDockViewController *)self otherAppButtonSizeConstraints];
    [v4 deactivateConstraints:v5];
  }
  v6 = [(DBAppDockViewController *)self otherAppButton];

  if (v6)
  {
    uint64_t v7 = [(DBAppDockViewController *)self otherAppButton];
    double v8 = [(DBAppDockViewController *)self _buttonSizeConstraintsForButton:v7];
    [(DBAppDockViewController *)self setOtherAppButtonSizeConstraints:v8];

    id v9 = (void *)MEMORY[0x263F08938];
    id v10 = [(DBAppDockViewController *)self otherAppButtonSizeConstraints];
    [v9 activateConstraints:v10];
  }
  else
  {
    [(DBAppDockViewController *)self setOtherAppButtonSizeConstraints:0];
  }
}

- (id)_generateOrderedAppItems
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  double v4 = [(DBAppDockViewController *)self appHistory];
  id v5 = [v4 orderedAppsMatchingDockCategory:1];

  v6 = [(DBAppDockViewController *)self appHistory];
  uint64_t v7 = [v6 orderedAppsMatchingDockCategory:2];

  double v8 = [(DBAppDockViewController *)self appHistory];
  id v9 = [v8 orderedAppsMatchingDockCategory:0];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__DBAppDockViewController__generateOrderedAppItems__block_invoke;
  aBlock[3] = &unk_2649B5F30;
  aBlock[4] = self;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [v5 indexOfObjectPassingTest:v10];
  v12 = 0;
  v13 = 0;
  v74 = v9;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [v5 objectAtIndexedSubscript:v11];
    if (v12)
    {
      v14 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v12 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        v77 = v15;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Resolved maps app dock item to %@", buf, 0xCu);
      }
      objc_super v16 = [DBAppDockItem alloc];
      uint64_t v17 = [v12 bundleIdentifier];
      v13 = [(DBAppDockItem *)v16 initWithBundleIdentifier:v17 category:1 active:0];

      [v3 addObject:v13];
      id v9 = v74;
    }
    else
    {
      v13 = 0;
    }
  }
  uint64_t v18 = [v7 indexOfObjectPassingTest:v10];
  v72 = v7;
  v73 = v5;
  v71 = v12;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  v19 = [v7 objectAtIndexedSubscript:v18];
  if (!v19) {
    goto LABEL_13;
  }
  v20 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v19 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v77 = v21;
    _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Resolved audio app dock item to %@", buf, 0xCu);
  }
  v22 = [DBAppDockItem alloc];
  objc_super v23 = [v19 bundleIdentifier];
  v24 = [(DBAppDockItem *)v22 initWithBundleIdentifier:v23 category:2 active:0];

  [v3 addObject:v24];
  id v9 = v74;
LABEL_14:
  uint64_t v25 = [v9 indexOfObjectPassingTest:v10];
  v69 = v19;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = 0;
LABEL_20:
    v31 = 0;
    goto LABEL_21;
  }
  v26 = objc_msgSend(v9, "objectAtIndexedSubscript:", v25, v19, v71, v7, v5);
  if (!v26) {
    goto LABEL_20;
  }
  v27 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v26 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v77 = v28;
    _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Resolved other app dock item to %@", buf, 0xCu);
  }
  v29 = [DBAppDockItem alloc];
  v30 = [v26 bundleIdentifier];
  v31 = [(DBAppDockItem *)v29 initWithBundleIdentifier:v30 category:0 active:0];

  [v3 addObject:v31];
LABEL_21:
  v32 = [(DBAppDockViewController *)self navigationAppButton];
  v33 = v32;
  if (v13)
  {

    if (!v33)
    {
      v34 = [DBAppDockButton alloc];
      [(DBAppDockViewController *)self iconProvider];
      v36 = v35 = v3;
      v37 = [(DBAppDockButton *)v34 initWithIconProvider:v36];

      BOOL v3 = v35;
      [(DBAppDockViewController *)self _updateNavigationButtonSizeConstraints];
      v38 = [NSString stringWithFormat:@"CARAppDockButton-Navigation"];
      [(DBAppDockButton *)v37 setAccessibilityLabel:v38];

      [(DBAppDockViewController *)self setNavigationAppButton:v37];
      v39 = [(DBAppDockViewController *)self navigationAppButton];
      [v39 addTarget:self action:sel__dockButtonPressed_ forControlEvents:64];

      v40 = [(DBAppDockViewController *)self dockItemStackView];
      [v40 insertArrangedSubview:v37 atIndex:0];
    }
    v41 = [(DBAppDockViewController *)self navigationAppButton];
    v42 = [(DBAppDockItem *)v13 bundleIdentifier];
    [v41 setBundleIdentifier:v42];

    v33 = [(DBAppDockViewController *)self navigationAppButton];
    [v33 setHidden:0];
    uint64_t v43 = 1;
  }
  else
  {
    [v32 setHidden:1];
    uint64_t v43 = 0;
  }

  v44 = [(DBAppDockViewController *)self audioAppButton];
  v45 = v44;
  if (v24)
  {
    v46 = v3;

    if (!v45)
    {
      v47 = [DBAppDockButton alloc];
      v48 = [(DBAppDockViewController *)self iconProvider];
      v49 = [(DBAppDockButton *)v47 initWithIconProvider:v48];

      [(DBAppDockViewController *)self _updateAudioButtonSizeConstraints];
      v50 = [NSString stringWithFormat:@"CARAppDockButton-Audio"];
      [(DBAppDockButton *)v49 setAccessibilityLabel:v50];

      [(DBAppDockViewController *)self setAudioAppButton:v49];
      v51 = [(DBAppDockViewController *)self audioAppButton];
      [v51 addTarget:self action:sel__dockButtonPressed_ forControlEvents:64];

      v52 = [(DBAppDockViewController *)self dockItemStackView];
      [v52 insertArrangedSubview:v49 atIndex:v43];
    }
    ++v43;
    v53 = [(DBAppDockViewController *)self audioAppButton];
    v54 = [(DBAppDockItem *)v24 bundleIdentifier];
    [v53 setBundleIdentifier:v54];

    v45 = [(DBAppDockViewController *)self audioAppButton];
    [v45 setHidden:0];
    BOOL v3 = v46;
  }
  else
  {
    [v44 setHidden:1];
  }

  v55 = [(DBAppDockViewController *)self otherAppButton];
  v56 = v55;
  if (v31)
  {

    if (!v56)
    {
      v57 = [DBAppDockButton alloc];
      [(DBAppDockViewController *)self iconProvider];
      v59 = v58 = v3;
      v60 = [(DBAppDockButton *)v57 initWithIconProvider:v59];

      [(DBAppDockViewController *)self _updateOtherButtonSizeConstraints];
      v61 = [NSString stringWithFormat:@"CARAppDockButton-Other"];
      [(DBAppDockButton *)v60 setAccessibilityLabel:v61];

      [(DBAppDockViewController *)self setOtherAppButton:v60];
      v62 = [(DBAppDockViewController *)self otherAppButton];
      [v62 addTarget:self action:sel__dockButtonPressed_ forControlEvents:64];

      v63 = [(DBAppDockViewController *)self dockItemStackView];
      [v63 insertArrangedSubview:v60 atIndex:v43];

      BOOL v3 = v58;
    }
    v64 = [(DBAppDockViewController *)self otherAppButton];
    v65 = [(DBAppDockItem *)v31 bundleIdentifier];
    [v64 setBundleIdentifier:v65];

    v55 = [(DBAppDockViewController *)self otherAppButton];
    v56 = v55;
    uint64_t v66 = 0;
  }
  else
  {
    uint64_t v66 = 1;
  }
  [v55 setHidden:v66];

  v67 = (void *)[v3 copy];
  return v67;
}

uint64_t __51__DBAppDockViewController__generateOrderedAppItems__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 iconProvider];
  v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 iconForIdentifier:v6];

  if (v7)
  {
    double v8 = [*(id *)(a1 + 32) iconProvider];
    uint64_t v9 = [v8 isIconVisible:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_dockButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 bundleIdentifier];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Selected app dock item for bundle identifier %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(DBAppDockViewController *)self appDockViewControllerDelegate];
  double v8 = [v4 bundleIdentifier];
  [v7 appDockViewController:self didSelectBundleID:v8];
}

- (void)_updateAppDockButtonForBundleIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(DBAppDockViewController *)self appHistory];
  uint64_t v8 = [v7 appDockCategoryForBundleIdentifier:v6];

  if (v8)
  {
    if (v8 == 2)
    {
      v12 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Updating audio bundle identifier in dock to %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v10 = [(DBAppDockViewController *)self audioAppButton];
    }
    else
    {
      if (v8 != 1)
      {
        v13 = 0;
        goto LABEL_15;
      }
      int v9 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Updating navigation bundle identifier in dock to %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v10 = [(DBAppDockViewController *)self navigationAppButton];
    }
  }
  else
  {
    uint64_t v11 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Updating other bundle identifier in dock to %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = [(DBAppDockViewController *)self otherAppButton];
  }
  v13 = (void *)v10;
LABEL_15:
  [v13 setBundleIdentifier:v6 animated:v4];
}

- (void)setActiveBundleIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = (NSString *)a3;
  uint64_t v7 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    v30 = v6;
    _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Evaluating active dock bundle identifier %@", (uint8_t *)&v29, 0xCu);
  }

  if ([(NSString *)v6 isEqualToString:@"com.apple.InCallService"])
  {
    uint64_t v8 = [MEMORY[0x263F7E1A0] sharedInstance];
    int v9 = [v8 displayedAudioAndVideoCalls];

    if ((unint64_t)[v9 count] < 2) {
      [v9 firstObject];
    }
    else {
    uint64_t v10 = objc_msgSend(v9, "bs_firstObjectPassingTest:", &__block_literal_global_23);
    }
    uint64_t v11 = [v10 provider];
    uint64_t v12 = [v11 displayAppBundleIdentifier];

    id v6 = (NSString *)v12;
  }
  if (!v6
    || ([(DBAppDockViewController *)self appHistory],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isBundleIdentifierValidForDock:v6],
        v13,
        (v14 & 1) != 0))
  {
    id v15 = [(DBAppDockViewController *)self iconProvider];
    uint64_t v16 = [v15 iconForIdentifier:v6];

    if (!v6
      || v16
      && ([(DBAppDockViewController *)self iconProvider],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isIconVisible:v16],
          v17,
          (v18 & 1) != 0))
    {
      if (self->_activeBundleIdentifier != v6)
      {
        v19 = (NSString *)[(NSString *)v6 copy];
        activeBundleIdentifier = self->_activeBundleIdentifier;
        self->_activeBundleIdentifier = v19;

        v21 = [(DBAppDockViewController *)self nowPlayingObserver];
        int v22 = [v21 isPlaying];

        objc_super v23 = [(DBAppDockViewController *)self environmentConfiguration];
        v24 = [v23 navigationStateProvider];
        uint64_t v25 = [v24 navigatingIdentifiers];
        uint64_t v26 = [v25 count];

        if (v6)
        {
          [(DBAppDockViewController *)self _updateAppDockButtonForBundleIdentifier:v6 animated:v4];
          [(DBAppDockViewController *)self _updateNowPlayingBundleIdentifier:v4];
        }
        if (v22) {
          [(DBAppDockViewController *)self _updateNowPlayingBundleIdentifier:v4];
        }
        if (v26) {
          [(DBAppDockViewController *)self _updateNavigationBundleIdentifier:v4];
        }
        goto LABEL_28;
      }
      v27 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v28 = "No need for dock bundle identifier update - already visible.";
        goto LABEL_26;
      }
    }
    else
    {
      v27 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v28 = "Bundle identifier is not visible in layout.";
LABEL_26:
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v29, 2u);
      }
    }

    goto LABEL_28;
  }
  uint64_t v16 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Bundle identifier is not valid for dock.", (uint8_t *)&v29, 2u);
  }
LABEL_28:
}

- (void)setActiveBundleIdentifier:(id)a3
{
}

- (void)_updateNavigationBundleIdentifier:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(DBAppDockViewController *)self activeBundleIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(DBAppDockViewController *)self appHistory];
    uint64_t v8 = [(DBAppDockViewController *)self activeBundleIdentifier];
    uint64_t v9 = [v7 appDockCategoryForBundleIdentifier:v8];

    if (v9 == 1)
    {
      uint64_t v10 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(DBAppDockViewController *)self activeBundleIdentifier];
        int v28 = 138543362;
        int v29 = v11;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Active bundle identifier is a maps app; not updating app dock. %{public}@",
          (uint8_t *)&v28,
          0xCu);
      }
      goto LABEL_19;
    }
  }
  uint64_t v12 = [(DBAppDockViewController *)self activeBundleIdentifier];
  if (!v12) {
    goto LABEL_7;
  }
  v13 = (void *)v12;
  char v14 = [(DBAppDockViewController *)self appHistory];
  id v15 = [(DBAppDockViewController *)self activeBundleIdentifier];
  uint64_t v16 = [v14 appDockCategoryForBundleIdentifier:v15];

  if (v16 != 1)
  {
LABEL_7:
    uint64_t v17 = [(DBAppDockViewController *)self environmentConfiguration];
    char v18 = [v17 navigationStateProvider];
    uint64_t v10 = [v18 mostRecentDashboardNavigatingApp];

    if (!v10)
    {
      v19 = [(DBAppDockViewController *)self environmentConfiguration];
      v20 = [v19 navigationStateProvider];
      uint64_t v10 = [v20 mostRecentNavigatingApp];

      if (!v10)
      {
        uint64_t v10 = DBLogForCategory(4uLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "No available navigation application; not updating app dock.",
            (uint8_t *)&v28,
            2u);
        }
        goto LABEL_19;
      }
    }
    v21 = [(DBAppDockViewController *)self iconProvider];
    int v22 = [v21 iconForIdentifier:v10];

    if (v22)
    {
      objc_super v23 = [(DBAppDockViewController *)self iconProvider];
      if ([v23 isIconVisible:v22])
      {
        v24 = [(DBAppDockViewController *)self appHistory];
        int v25 = [v24 isBundleIdentifierValidForDock:v10];

        if (v25)
        {
          uint64_t v26 = DBLogForCategory(4uLL);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 138412290;
            int v29 = v10;
            _os_log_impl(&dword_22D6F0000, v26, OS_LOG_TYPE_DEFAULT, "Updating navigation app dock bundle identifier to %@", (uint8_t *)&v28, 0xCu);
          }

          v27 = [(DBAppDockViewController *)self navigationAppButton];
          [v27 setBundleIdentifier:v10 animated:v3];
LABEL_18:

LABEL_19:
          return;
        }
      }
      else
      {
      }
    }
    v27 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Unable to update navigation bundle identifier.", (uint8_t *)&v28, 2u);
    }
    goto LABEL_18;
  }
}

- (void)_updateNowPlayingBundleIdentifier:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(DBAppDockViewController *)self activeBundleIdentifier];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(DBAppDockViewController *)self appHistory];
  uint64_t v8 = [(DBAppDockViewController *)self activeBundleIdentifier];
  uint64_t v9 = [v7 appDockCategoryForBundleIdentifier:v8];

  if (v9 != 2)
  {
LABEL_3:
    uint64_t v10 = [(DBAppDockViewController *)self nowPlayingObserver];
    uint64_t v11 = [v10 nowPlayingApplication];
    uint64_t v12 = [v11 bundleIdentifier];

    if (v12)
    {
      v13 = [(DBAppDockViewController *)self nowPlayingObserver];
      char v14 = [v13 isPlaying];

      if (v14)
      {
        id v15 = [(DBAppDockViewController *)self iconProvider];
        uint64_t v16 = [v15 iconForIdentifier:v12];

        if (v16)
        {
          uint64_t v17 = [(DBAppDockViewController *)self iconProvider];
          if ([v17 isIconVisible:v16])
          {
            char v18 = [(DBAppDockViewController *)self appHistory];
            int v19 = [v18 isBundleIdentifierValidForDock:v12];

            if (v19)
            {
              v20 = DBLogForCategory(4uLL);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                int v23 = 138412290;
                v24 = v12;
                _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Updating now playing app dock bundle identifier to %@", (uint8_t *)&v23, 0xCu);
              }

              [(DBAppDockViewController *)self _updateAppDockButtonForBundleIdentifier:v12 animated:v3];
              goto LABEL_20;
            }
          }
          else
          {
          }
        }
        int v22 = DBLogForCategory(4uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Unable to update now playing bundle identifier.", (uint8_t *)&v23, 2u);
        }

        goto LABEL_20;
      }
      uint64_t v16 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v21 = "Now playing app is not playing; not updating app dock.";
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v16 = DBLogForCategory(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v21 = "No available now playing application; not updating app dock.";
LABEL_15:
        _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v23, 2u);
      }
    }
LABEL_20:
  }
}

- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4
{
  if (a4)
  {
    uint64_t v5 = objc_msgSend(a4, "appPolicy", a3);
    if ([v5 isCarPlaySupported])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __77__DBAppDockViewController_nowPlayingObserver_didChangeNowPlayingApplication___block_invoke;
      block[3] = &unk_2649B3E90;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __77__DBAppDockViewController_nowPlayingObserver_didChangeNowPlayingApplication___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNowPlayingBundleIdentifier:1];
}

- (void)nowPlayingObserver:(id)a3 didUpdatePlaybackState:(BOOL)a4 inApplication:(id)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__DBAppDockViewController_nowPlayingObserver_didUpdatePlaybackState_inApplication___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__DBAppDockViewController_nowPlayingObserver_didUpdatePlaybackState_inApplication___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNowPlayingBundleIdentifier:1];
}

- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BSDispatchQueueAssertMain();
  id v6 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Navigating identifiers did change: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(DBAppDockViewController *)self _updateNavigationBundleIdentifier:1];
}

- (void)activeIntentWithBundleId:(id)a3
{
  id v4 = a3;
  [(DBAppDockViewController *)self setActiveBundleIdentifier:v4 animated:1];
  id v6 = [(DBAppDockViewController *)self environmentConfiguration];
  id v5 = [v6 analytics];
  [v5 siriDidStartHostingBundleIdentifier:v4];
}

- (id)preferredFocusEnvironments
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(DBAppDockViewController *)self navigationAppButton];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(DBAppDockViewController *)self navigationAppButton];
    if ([v6 isHidden])
    {
    }
    else
    {
      int v7 = [(DBAppDockViewController *)self navigationAppButton];
      id v8 = [v7 superview];

      if (!v8) {
        goto LABEL_7;
      }
      id v5 = [(DBAppDockViewController *)self navigationAppButton];
      [v3 addObject:v5];
    }
  }
LABEL_7:
  uint64_t v9 = [(DBAppDockViewController *)self audioAppButton];
  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(DBAppDockViewController *)self audioAppButton];
  if ([v11 isHidden])
  {
  }
  else
  {
    uint64_t v12 = [(DBAppDockViewController *)self audioAppButton];
    v13 = [v12 superview];

    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v10 = [(DBAppDockViewController *)self audioAppButton];
    [v3 addObject:v10];
  }

LABEL_13:
  uint64_t v14 = [(DBAppDockViewController *)self otherAppButton];
  if (!v14) {
    goto LABEL_19;
  }
  id v15 = (void *)v14;
  uint64_t v16 = [(DBAppDockViewController *)self otherAppButton];
  if ([v16 isHidden])
  {
  }
  else
  {
    uint64_t v17 = [(DBAppDockViewController *)self otherAppButton];
    char v18 = [v17 superview];

    if (!v18) {
      goto LABEL_19;
    }
    id v15 = [(DBAppDockViewController *)self otherAppButton];
    [v3 addObject:v15];
  }

LABEL_19:
  int v19 = (void *)[v3 copy];
  v20 = [(DBAppDockViewController *)self environmentConfiguration];
  if ([v20 currentStatusBarEdge] == 3)
  {
  }
  else
  {
    v21 = [(DBAppDockViewController *)self environmentConfiguration];
    uint64_t v22 = [v21 currentStatusBarEdge];

    if (v22 != 1) {
      goto LABEL_24;
    }
  }
  int v23 = [(DBAppDockViewController *)self traitCollection];
  int v24 = [v23 layoutDirection] != 1;
  uint64_t v25 = [(DBAppDockViewController *)self environmentConfiguration];
  int v26 = [v25 isRightHandDrive];

  if (v24 != v26)
  {
    objc_msgSend(v19, "bs_reverse");
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_24:
  id v27 = v19;
LABEL_25:
  int v28 = v27;

  return v28;
}

- (void)_refreshAppDock
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__DBAppDockViewController__refreshAppDock__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__DBAppDockViewController__refreshAppDock__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _generateOrderedAppItems];
  [v1 setOrderedAppItems:v2];
}

- (DBAppHistory)appHistory
{
  return self->_appHistory;
}

- (DBAppDockViewControllerDelegate)appDockViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDockViewControllerDelegate);
  return (DBAppDockViewControllerDelegate *)WeakRetained;
}

- (void)setAppDockViewControllerDelegate:(id)a3
{
}

- (NSString)activeBundleIdentifier
{
  return self->_activeBundleIdentifier;
}

- (BOOL)isDockEnabled
{
  return self->_dockEnabled;
}

- (UIColor)buttonFocusHighlightColor
{
  return self->_buttonFocusHighlightColor;
}

- (BOOL)isFocusHighlightCompositingFilterEnabled
{
  return self->_focusHighlightCompositingFilterEnabled;
}

- (DBAppDockButton)navigationAppButton
{
  return self->_navigationAppButton;
}

- (void)setNavigationAppButton:(id)a3
{
}

- (NSArray)navigationAppButtonSizeConstraints
{
  return self->_navigationAppButtonSizeConstraints;
}

- (void)setNavigationAppButtonSizeConstraints:(id)a3
{
}

- (DBAppDockButton)audioAppButton
{
  return self->_audioAppButton;
}

- (void)setAudioAppButton:(id)a3
{
}

- (NSArray)audioAppButtonSizeConstraints
{
  return self->_audioAppButtonSizeConstraints;
}

- (void)setAudioAppButtonSizeConstraints:(id)a3
{
}

- (DBAppDockButton)otherAppButton
{
  return self->_otherAppButton;
}

- (void)setOtherAppButton:(id)a3
{
}

- (NSArray)otherAppButtonSizeConstraints
{
  return self->_otherAppButtonSizeConstraints;
}

- (void)setOtherAppButtonSizeConstraints:(id)a3
{
}

- (UIStackView)dockItemStackView
{
  return self->_dockItemStackView;
}

- (void)setDockItemStackView:(id)a3
{
}

- (NSArray)orderedAppItems
{
  return self->_orderedAppItems;
}

- (void)setOrderedAppItems:(id)a3
{
}

- (DBNowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (DBIconProviding)iconProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconProvider);
  return (DBIconProviding *)WeakRetained;
}

- (void)setIconProvider:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_destroyWeak((id *)&self->_iconProvider);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_orderedAppItems, 0);
  objc_storeStrong((id *)&self->_dockItemStackView, 0);
  objc_storeStrong((id *)&self->_otherAppButtonSizeConstraints, 0);
  objc_storeStrong((id *)&self->_otherAppButton, 0);
  objc_storeStrong((id *)&self->_audioAppButtonSizeConstraints, 0);
  objc_storeStrong((id *)&self->_audioAppButton, 0);
  objc_storeStrong((id *)&self->_navigationAppButtonSizeConstraints, 0);
  objc_storeStrong((id *)&self->_navigationAppButton, 0);
  objc_storeStrong((id *)&self->_buttonFocusHighlightColor, 0);
  objc_storeStrong((id *)&self->_activeBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_appDockViewControllerDelegate);
  objc_storeStrong((id *)&self->_appHistory, 0);
}

@end