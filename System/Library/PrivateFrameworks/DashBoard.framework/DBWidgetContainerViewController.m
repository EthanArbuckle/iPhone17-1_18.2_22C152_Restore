@interface DBWidgetContainerViewController
- (BOOL)_canChangeSmartWidgetVisible;
- (BOOL)_smartWidgetShouldBeHidden;
- (BOOL)hasActiveNavigation;
- (BOOL)initialConstraintsSetup;
- (BOOL)isInCallWidgetHidden;
- (BOOL)isSmartWidgetHidden;
- (BOOL)sceneWidgetsActive;
- (BOOL)sceneWidgetsEnabled;
- (BOOL)sceneWidgetsForeground;
- (DBEnvironment)environment;
- (DBInCallWidgetViewController)inCallWidgetController;
- (DBNavigationInstructionWidgetViewController)navigationInstructionWidgetViewController;
- (DBNowPlayingWidgetViewController)nowPlayingWidgetController;
- (DBSmartWidgetEngine)engine;
- (DBSmartWidgetViewController)smartWidgetController;
- (DBWidgetContainerViewController)initWithEnvironment:(id)a3 animationManager:(id)a4;
- (DBWidgetStackViewController)primaryWidgetStackViewController;
- (DBWidgetStackViewController)secondaryWidgetStackViewController;
- (NSArray)currentConstraints;
- (NSArray)landscapePortraitConstraints;
- (NSArray)sceneWidgetControllers;
- (NSArray)squareConstraints;
- (NSMutableSet)smartWidgetChangeVisibilityDisabledRequesters;
- (id)linearFocusItems;
- (unint64_t)layoutType;
- (void)_callStatusChanged:(id)a3;
- (void)_reloadConstraints;
- (void)_setupConstraints;
- (void)_smartWidgetHiddenDefaultChanged;
- (void)_updateMapWidgetSizes;
- (void)_updateSmartWidgetVisibleIfNecessary;
- (void)_updateStackViewsWithUpdates:(id)a3 completion:(id)a4;
- (void)animateSmartWidget:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateConstraints;
- (void)requestSizeChange;
- (void)setCurrentConstraints:(id)a3;
- (void)setEngine:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHasActiveNavigation:(BOOL)a3;
- (void)setInCallWidgetHidden:(BOOL)a3;
- (void)setInitialConstraintsSetup:(BOOL)a3;
- (void)setLandscapePortraitConstraints:(id)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setPrimaryWidgetStackViewController:(id)a3;
- (void)setSceneWidgetControllers:(id)a3;
- (void)setSceneWidgetsActive:(BOOL)a3;
- (void)setSceneWidgetsEnabled:(BOOL)a3;
- (void)setSceneWidgetsForeground:(BOOL)a3;
- (void)setSecondaryWidgetStackViewController:(id)a3;
- (void)setSmartWidgetCanChangeVisibilityDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)setSmartWidgetChangeVisibilityDisabledRequesters:(id)a3;
- (void)setSmartWidgetHidden:(BOOL)a3;
- (void)setSquareConstraints:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DBWidgetContainerViewController

- (DBWidgetContainerViewController)initWithEnvironment:(id)a3 animationManager:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)DBWidgetContainerViewController;
  v8 = [(DBWidgetContainerViewController *)&v26 init];
  if (v8)
  {
    v9 = [[DBSmartWidgetEngine alloc] initWithEnvironment:v6];
    engine = v8->_engine;
    v8->_engine = v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    v11 = [[DBNavigationInstructionWidgetViewController alloc] initWithEnvironment:v6 animationManager:v7 widgetSizeManager:v8];
    navigationInstructionWidgetViewController = v8->_navigationInstructionWidgetViewController;
    v8->_navigationInstructionWidgetViewController = v11;

    v13 = [(DBWidgetViewController *)[DBNowPlayingWidgetViewController alloc] initWithEnvironment:v6];
    nowPlayingWidgetController = v8->_nowPlayingWidgetController;
    v8->_nowPlayingWidgetController = v13;

    v15 = [(DBWidgetViewController *)[DBInCallWidgetViewController alloc] initWithEnvironment:v6];
    inCallWidgetController = v8->_inCallWidgetController;
    v8->_inCallWidgetController = v15;

    [(DBInCallWidgetViewController *)v8->_inCallWidgetController setHidden:1];
    v17 = [[DBSmartWidgetViewController alloc] initWithEnvironment:v6 engine:v8->_engine animationDelegate:v8];
    smartWidgetController = v8->_smartWidgetController;
    v8->_smartWidgetController = v17;

    [(DBWidgetViewController *)v8->_smartWidgetController setHidden:1];
    v19 = objc_alloc_init(DBWidgetStackViewController);
    primaryWidgetStackViewController = v8->_primaryWidgetStackViewController;
    v8->_primaryWidgetStackViewController = v19;

    v21 = objc_alloc_init(DBWidgetStackViewController);
    secondaryWidgetStackViewController = v8->_secondaryWidgetStackViewController;
    v8->_secondaryWidgetStackViewController = v21;

    v27[0] = v8->_navigationInstructionWidgetViewController;
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    sceneWidgetControllers = v8->_sceneWidgetControllers;
    v8->_sceneWidgetControllers = (NSArray *)v23;

    v8->_smartWidgetHidden = 1;
    v8->_inCallWidgetHidden = 1;
  }

  return v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CARSmartWidgetHiddenDefaultChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)DBWidgetContainerViewController;
  [(DBWidgetContainerViewController *)&v4 dealloc];
}

- (void)setLayoutType:(unint64_t)a3
{
  if (self->_layoutType != a3)
  {
    self->_layoutType = a3;
    [(DBWidgetContainerViewController *)self _reloadConstraints];
  }
}

- (void)setInCallWidgetHidden:(BOOL)a3
{
  if (self->_inCallWidgetHidden != a3)
  {
    BOOL v3 = a3;
    self->_inCallWidgetHidden = a3;
    v5 = [(DBWidgetContainerViewController *)self environment];
    id v6 = [v5 environmentConfiguration];
    id v7 = [v6 analytics];
    v8 = v7;
    v9 = (__CFString **)MEMORY[0x263F31298];
    if (!v3) {
      v9 = DBMobilePhoneBundleIdentifier;
    }
    [v7 dashboardAudioWidgetDidChangeToBundleIdentifier:*v9];

    if ([(DBWidgetContainerViewController *)self _canChangeSmartWidgetVisible])
    {
      BOOL v10 = [(DBWidgetContainerViewController *)self _smartWidgetShouldBeHidden];
      if (v10 != [(DBWidgetContainerViewController *)self isSmartWidgetHidden]) {
        [(DBWidgetContainerViewController *)self setSmartWidgetHidden:v10];
      }
    }
    [(DBWidgetContainerViewController *)self _updateStackViewsWithUpdates:0 completion:0];
  }
}

- (void)setSceneWidgetsEnabled:(BOOL)a3
{
  objc_super v4 = [(DBWidgetContainerViewController *)self sceneWidgetControllers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__DBWidgetContainerViewController_setSceneWidgetsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e49_v32__0__DBNavigationWidgetViewController_8Q16_B24l;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __58__DBWidgetContainerViewController_setSceneWidgetsEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSceneWidgetsForeground:(BOOL)a3
{
  objc_super v4 = [(DBWidgetContainerViewController *)self sceneWidgetControllers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__DBWidgetContainerViewController_setSceneWidgetsForeground___block_invoke;
  v5[3] = &__block_descriptor_33_e49_v32__0__DBNavigationWidgetViewController_8Q16_B24l;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __61__DBWidgetContainerViewController_setSceneWidgetsForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSceneWidgetsActive:(BOOL)a3
{
  objc_super v4 = [(DBWidgetContainerViewController *)self sceneWidgetControllers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__DBWidgetContainerViewController_setSceneWidgetsActive___block_invoke;
  v5[3] = &__block_descriptor_33_e49_v32__0__DBNavigationWidgetViewController_8Q16_B24l;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __57__DBWidgetContainerViewController_setSceneWidgetsActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSmartWidgetCanChangeVisibilityDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBWidgetContainerViewController *)self smartWidgetChangeVisibilityDisabledRequesters];
  v8 = v7;
  if (v4)
  {

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBWidgetContainerViewController *)self setSmartWidgetChangeVisibilityDisabledRequesters:v9];
    }
    v8 = [(DBWidgetContainerViewController *)self smartWidgetChangeVisibilityDisabledRequesters];
    [v8 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }

  [(DBWidgetContainerViewController *)self _updateSmartWidgetVisibleIfNecessary];
}

- (id)linearFocusItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = [(DBWidgetContainerViewController *)self environment];
  uint64_t v5 = [v4 environmentConfiguration];
  int v6 = [(id)v5 isRightHandDrive];

  id v7 = [(DBWidgetContainerViewController *)self traitCollection];
  BOOL v8 = [v7 layoutDirection] == 1;

  id v9 = [MEMORY[0x263F30E20] flipDashboardLayout];
  LODWORD(v5) = [v9 valueBool];

  int v10 = v6 ^ v8 ^ v5;
  if ([(DBWidgetContainerViewController *)self layoutType] != 2 || (v10 & 1) == 0)
  {
    v11 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v12 = [v11 linearFocusItems];
    [v3 addObjectsFromArray:v12];
  }
  v13 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  v14 = [v13 linearFocusItems];
  [v3 addObjectsFromArray:v14];

  if ([(DBWidgetContainerViewController *)self layoutType] == 2) {
    int v15 = v10;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    v16 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v17 = [v16 linearFocusItems];
    [v3 addObjectsFromArray:v17];
  }
  return v3;
}

- (void)invalidateConstraints
{
  id v3 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
  [v3 invalidateConstraints];

  BOOL v4 = [(DBWidgetContainerViewController *)self view];
  [v4 invalidateIntrinsicContentSize];

  [(DBWidgetContainerViewController *)self _reloadConstraints];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)DBWidgetContainerViewController;
  [(DBWidgetContainerViewController *)&v17 viewDidLoad];
  id v3 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  [(DBWidgetContainerViewController *)self addChildViewController:v3];

  BOOL v4 = [(DBWidgetContainerViewController *)self view];
  uint64_t v5 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  int v6 = [v5 view];
  [v4 addSubview:v6];

  id v7 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  [v7 didMoveToParentViewController:self];

  BOOL v8 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  [(DBWidgetContainerViewController *)self addChildViewController:v8];

  id v9 = [(DBWidgetContainerViewController *)self view];
  int v10 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  v11 = [v10 view];
  [v9 addSubview:v11];

  v12 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  [v12 didMoveToParentViewController:self];

  v13 = [MEMORY[0x263F7E1A0] sharedInstance];
  v14 = [v13 displayedAudioAndVideoCalls];

  if ([v14 count]) {
    [(DBWidgetContainerViewController *)self setInCallWidgetHidden:0];
  }
  else {
    [(DBWidgetContainerViewController *)self _updateSmartWidgetVisibleIfNecessary];
  }
  int v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__callStatusChanged_ name:*MEMORY[0x263F7E310] object:0];
  [v15 addObserver:self selector:sel__callStatusChanged_ name:*MEMORY[0x263F7E328] object:0];
  [v15 addObserver:self selector:sel__callStatusChanged_ name:*MEMORY[0x263F7E350] object:0];
  [v15 addObserver:self selector:sel__callStatusChanged_ name:*MEMORY[0x263F7E318] object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DBSmartWidgetHiddenChangedHandler, @"CARSmartWidgetHiddenDefaultChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DBWidgetContainerViewController;
  [(DBWidgetContainerViewController *)&v3 viewDidLayoutSubviews];
  [(DBWidgetContainerViewController *)self _setupConstraints];
  [(DBWidgetContainerViewController *)self _updateMapWidgetSizes];
}

- (void)invalidate
{
  objc_super v3 = [(DBWidgetContainerViewController *)self sceneWidgetControllers];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_45];

  BOOL v4 = [(DBWidgetContainerViewController *)self inCallWidgetController];
  [v4 invalidate];

  [(DBWidgetContainerViewController *)self setEngine:0];
}

uint64_t __45__DBWidgetContainerViewController_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)animateSmartWidget:(id)a3 completion:(id)a4
{
  int v6 = (void (**)(void))a3;
  id v7 = a4;
  BOOL v8 = [(DBWidgetContainerViewController *)self _smartWidgetShouldBeHidden];
  id v9 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[DBWidgetContainerViewController animateSmartWidget:completion:](v8, self, v9);
  }

  if (v8 == [(DBWidgetContainerViewController *)self isSmartWidgetHidden])
  {
    if ([(DBWidgetContainerViewController *)self isSmartWidgetHidden])
    {
      if (v6) {
        v6[2](v6);
      }
    }
    else
    {
      if ([(DBWidgetContainerViewController *)self layoutType] == 2) {
        [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
      }
      else {
      int v10 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
      }
      v11 = [(DBWidgetContainerViewController *)self smartWidgetController];
      [v10 animateUpdateForWidgetViewController:v11 updateBlock:v6 completion:v7];
    }
  }
  else
  {
    [(DBWidgetContainerViewController *)self setSmartWidgetHidden:v8];
    [(DBWidgetContainerViewController *)self _updateStackViewsWithUpdates:v6 completion:v7];
  }
}

- (void)_setupConstraints
{
  if (![(DBWidgetContainerViewController *)self initialConstraintsSetup])
  {
    [(DBWidgetContainerViewController *)self setInitialConstraintsSetup:1];
    objc_super v3 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    BOOL v4 = [v3 view];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    uint64_t v5 = [v6 view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)_reloadConstraints
{
  v48[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [(DBWidgetContainerViewController *)self currentConstraints];

  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x263F08938];
    uint64_t v5 = [(DBWidgetContainerViewController *)self currentConstraints];
    [v4 deactivateConstraints:v5];

    [(DBWidgetContainerViewController *)self setCurrentConstraints:0];
  }
  id v6 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  uint64_t v7 = MEMORY[0x263EFFA68];
  [v6 setWidgetViewControllers:MEMORY[0x263EFFA68]];

  BOOL v8 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  [v8 setWidgetViewControllers:v7];

  unint64_t v9 = [(DBWidgetContainerViewController *)self layoutType];
  if (v9 == 3)
  {
    BOOL v23 = [(DBWidgetContainerViewController *)self isSmartWidgetHidden];
    v24 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
    [v24 setWantsLargeSize:v23];

    v25 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    [v25 setWidgetViewControllers:MEMORY[0x263EFFA68]];

    objc_super v26 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v27 = [v26 view];
    uint64_t v22 = 1;
    [v27 setHidden:1];

    v28 = [(DBWidgetContainerViewController *)self navigationInstructionWidgetViewController];
    v45[0] = v28;
    v29 = [(DBWidgetContainerViewController *)self inCallWidgetController];
    v45[1] = v29;
    v30 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
    v45[2] = v30;
    v31 = [(DBWidgetContainerViewController *)self smartWidgetController];
    v45[3] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
    v33 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    [v33 setWidgetViewControllers:v32];

    v21 = [(DBWidgetContainerViewController *)self landscapePortraitConstraints];
    if (!v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v9 == 2)
  {
    v34 = [(DBWidgetContainerViewController *)self navigationInstructionWidgetViewController];
    v47[0] = v34;
    v35 = [(DBWidgetContainerViewController *)self smartWidgetController];
    v47[1] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    v37 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    [v37 setWidgetViewControllers:v36];

    v38 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v39 = [v38 view];
    [v39 setHidden:0];

    v40 = [(DBWidgetContainerViewController *)self inCallWidgetController];
    v46[0] = v40;
    v41 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
    v46[1] = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    v43 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    [v43 setWidgetViewControllers:v42];

    v21 = [(DBWidgetContainerViewController *)self squareConstraints];
    if ([(DBWidgetContainerViewController *)self isSmartWidgetHidden]) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 1;
    }
    if (!v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v9 != 1) {
    return;
  }
  BOOL v10 = [(DBWidgetContainerViewController *)self isSmartWidgetHidden];
  v11 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
  [v11 setWantsLargeSize:v10];

  v12 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  [v12 setWidgetViewControllers:MEMORY[0x263EFFA68]];

  v13 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
  v14 = [v13 view];
  [v14 setHidden:1];

  int v15 = [(DBWidgetContainerViewController *)self navigationInstructionWidgetViewController];
  v48[0] = v15;
  v16 = [(DBWidgetContainerViewController *)self inCallWidgetController];
  v48[1] = v16;
  objc_super v17 = [(DBWidgetContainerViewController *)self nowPlayingWidgetController];
  v48[2] = v17;
  v18 = [(DBWidgetContainerViewController *)self smartWidgetController];
  v48[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
  v20 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
  [v20 setWidgetViewControllers:v19];

  v21 = [(DBWidgetContainerViewController *)self landscapePortraitConstraints];
  if ([(DBWidgetContainerViewController *)self isSmartWidgetHidden]) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  if (v21)
  {
LABEL_17:
    [MEMORY[0x263F08938] activateConstraints:v21];
    [(DBWidgetContainerViewController *)self setCurrentConstraints:v21];
  }
LABEL_18:
  v44 = [(DBWidgetContainerViewController *)self navigationInstructionWidgetViewController];
  [v44 setWidgetStyle:v22];
}

- (NSArray)landscapePortraitConstraints
{
  v32[4] = *MEMORY[0x263EF8340];
  if (!self->_landscapePortraitConstraints)
  {
    v31 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    v30 = [v31 view];
    v28 = [v30 leadingAnchor];
    v29 = [(DBWidgetContainerViewController *)self view];
    v27 = [v29 leadingAnchor];
    objc_super v26 = [v28 constraintEqualToAnchor:v27];
    v32[0] = v26;
    v25 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    v24 = [v25 view];
    uint64_t v22 = [v24 trailingAnchor];
    BOOL v23 = [(DBWidgetContainerViewController *)self view];
    v21 = [v23 trailingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v32[1] = v20;
    v19 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    v18 = [v19 view];
    v16 = [v18 topAnchor];
    objc_super v17 = [(DBWidgetContainerViewController *)self view];
    objc_super v3 = [v17 topAnchor];
    BOOL v4 = [v16 constraintEqualToAnchor:v3];
    v32[2] = v4;
    uint64_t v5 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    id v6 = [v5 view];
    uint64_t v7 = [v6 bottomAnchor];
    BOOL v8 = [(DBWidgetContainerViewController *)self view];
    unint64_t v9 = [v8 bottomAnchor];
    BOOL v10 = [v7 constraintEqualToAnchor:v9];
    v32[3] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
    landscapePortraitConstraints = self->_landscapePortraitConstraints;
    self->_landscapePortraitConstraints = v11;
  }
  v13 = [(DBWidgetContainerViewController *)self view];
  [v13 setAccessibilityValue:@"Landscape Layout"];

  v14 = self->_landscapePortraitConstraints;
  return v14;
}

- (NSArray)squareConstraints
{
  v51[8] = *MEMORY[0x263EF8340];
  squareConstraints = self->_squareConstraints;
  if (!squareConstraints)
  {
    BOOL v4 = [(DBWidgetContainerViewController *)self environment];
    uint64_t v5 = [v4 environmentConfiguration];
    int v6 = [v5 isRightHandDrive];

    uint64_t v7 = [MEMORY[0x263F30E20] flipDashboardLayout];
    LODWORD(v5) = [v7 valueBool];

    if (v6 == v5)
    {
      BOOL v10 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
      unint64_t v9 = [v10 view];

      [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    }
    else
    {
      BOOL v8 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
      unint64_t v9 = [v8 view];

      [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v11 = };
    v35 = v9;
    v12 = [v11 view];

    v13 = [(DBWidgetContainerViewController *)self view];
    [v13 setAccessibilityValue:@"Square Layout"];

    [v9 setAccessibilityIdentifier:@"CARDashboardWidgetLeftStack"];
    [v12 setAccessibilityIdentifier:@"CARDashboardWidgetRightStack;"];
    v49 = [v9 leftAnchor];
    v50 = [(DBWidgetContainerViewController *)self view];
    v48 = [v50 leftAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v51[0] = v47;
    v45 = [v9 rightAnchor];
    v46 = [(DBWidgetContainerViewController *)self view];
    v44 = [v46 centerXAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-4.0];
    v51[1] = v43;
    v41 = [v9 topAnchor];
    v42 = [(DBWidgetContainerViewController *)self view];
    v40 = [v42 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v51[2] = v39;
    v37 = [v9 bottomAnchor];
    v38 = [(DBWidgetContainerViewController *)self view];
    v36 = [v38 bottomAnchor];
    v34 = [v37 constraintEqualToAnchor:v36];
    v51[3] = v34;
    v31 = [v12 leftAnchor];
    v32 = [(DBWidgetContainerViewController *)self view];
    v30 = [v32 centerXAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:4.0];
    v51[4] = v29;
    v27 = [v12 rightAnchor];
    v28 = [(DBWidgetContainerViewController *)self view];
    objc_super v26 = [v28 rightAnchor];
    v14 = [v27 constraintEqualToAnchor:v26];
    v51[5] = v14;
    v33 = v12;
    int v15 = [v12 topAnchor];
    v16 = [(DBWidgetContainerViewController *)self view];
    objc_super v17 = [v16 topAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    v51[6] = v18;
    v19 = [v12 bottomAnchor];
    v20 = [(DBWidgetContainerViewController *)self view];
    v21 = [v20 bottomAnchor];
    uint64_t v22 = [v19 constraintEqualToAnchor:v21];
    v51[7] = v22;
    BOOL v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:8];
    v24 = self->_squareConstraints;
    self->_squareConstraints = v23;

    squareConstraints = self->_squareConstraints;
  }
  return squareConstraints;
}

- (BOOL)_canChangeSmartWidgetVisible
{
  v2 = [(DBWidgetContainerViewController *)self smartWidgetChangeVisibilityDisabledRequesters];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)_smartWidgetShouldBeHidden
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"CARSmartWidgetHidden"];

  uint64_t v5 = [(DBWidgetContainerViewController *)self smartWidgetController];
  int v6 = [v5 wantsToShowPrediction];

  if ([(DBWidgetContainerViewController *)self isInCallWidgetHidden])
  {
    int v7 = 0;
  }
  else
  {
    unint64_t v8 = [(DBWidgetContainerViewController *)self layoutType];
    unint64_t v9 = [(DBWidgetContainerViewController *)self view];
    [v9 bounds];
    double Width = CGRectGetWidth(v24);

    int v7 = 0;
    if (v8 == 1 && Width < 265.0)
    {
      v11 = [(DBWidgetContainerViewController *)self smartWidgetController];
      int v7 = [v11 isHighPriority] ^ 1;
    }
  }
  v12 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = @"NO";
    if (v4) {
      int v15 = @"YES";
    }
    else {
      int v15 = @"NO";
    }
    if (v6) {
      v16 = @"NO";
    }
    else {
      v16 = @"YES";
    }
    int v17 = 138412802;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    if (v7) {
      v14 = @"YES";
    }
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_debug_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEBUG, "Smart widget should be hidden? smartWidgetHiddenOverride=%@ noPredictions=%@ hiddenForActiveCall=%@", (uint8_t *)&v17, 0x20u);
  }

  return v4 | v6 ^ 1 | v7;
}

- (void)_updateSmartWidgetVisibleIfNecessary
{
  if ([(DBWidgetContainerViewController *)self _canChangeSmartWidgetVisible])
  {
    BOOL v3 = [(DBWidgetContainerViewController *)self _smartWidgetShouldBeHidden];
    if (v3 != [(DBWidgetContainerViewController *)self isSmartWidgetHidden])
    {
      [(DBWidgetContainerViewController *)self setSmartWidgetHidden:v3];
      [(DBWidgetContainerViewController *)self _updateStackViewsWithUpdates:0 completion:0];
    }
  }
}

- (void)_smartWidgetHiddenDefaultChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 BOOLForKey:@"CARSmartWidgetHidden"];
    uint64_t v5 = NSStringFromBOOL();
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Smart widget hidden default changed: %@", (uint8_t *)&v6, 0xCu);
  }
  [(DBWidgetContainerViewController *)self _updateSmartWidgetVisibleIfNecessary];
}

- (void)_updateStackViewsWithUpdates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DBWidgetContainerViewController *)self layoutType] == 2)
  {
    uint64_t v8 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke;
    v17[3] = &unk_2649B55D8;
    unint64_t v9 = &v18;
    v17[4] = self;
    id v18 = v6;
    id v10 = v6;
    [v8 animateWithUpdates:v17 completion:v7];

    v11 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke_2;
    v16[3] = &unk_2649B3E90;
    v16[4] = self;
    [v11 animateWithUpdates:v16 completion:0];
  }
  else
  {
    v12 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke_3;
    v14[3] = &unk_2649B55D8;
    unint64_t v9 = &v15;
    v14[4] = self;
    id v15 = v6;
    id v13 = v6;
    [v12 animateWithUpdates:v14 completion:v7];
  }
  [(DBWidgetContainerViewController *)self _updateMapWidgetSizes];
}

void __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) isSmartWidgetHidden];
  id v4 = [*(id *)(a1 + 32) smartWidgetController];
  [v4 setHidden:v3];
}

void __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inCallWidgetController];
  [v2 setWantsLargeSize:0];

  uint64_t v3 = [*(id *)(a1 + 32) isInCallWidgetHidden];
  id v4 = [*(id *)(a1 + 32) inCallWidgetController];
  [v4 setHidden:v3];

  uint64_t v5 = [*(id *)(a1 + 32) isInCallWidgetHidden] ^ 1;
  id v6 = [*(id *)(a1 + 32) nowPlayingWidgetController];
  [v6 setHidden:v5];
}

void __75__DBWidgetContainerViewController__updateStackViewsWithUpdates_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) isSmartWidgetHidden];
  id v4 = [*(id *)(a1 + 32) smartWidgetController];
  [v4 setHidden:v3];

  uint64_t v5 = (void *)[*(id *)(a1 + 32) isInCallWidgetHidden];
  id v6 = [*(id *)(a1 + 32) inCallWidgetController];
  [v6 setHidden:v5];

  if (([*(id *)(a1 + 32) isInCallWidgetHidden] & 1) != 0
    || ![*(id *)(a1 + 32) isSmartWidgetHidden])
  {
    int v8 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) navigationInstructionWidgetViewController];
    uint64_t v7 = [v5 wantsLargeSize] ^ 1;
    int v8 = 1;
  }
  unint64_t v9 = [*(id *)(a1 + 32) inCallWidgetController];
  [v9 setWantsLargeSize:v7];

  if (v8) {
  uint64_t v10 = [*(id *)(a1 + 32) isInCallWidgetHidden] ^ 1;
  }
  v11 = [*(id *)(a1 + 32) nowPlayingWidgetController];
  [v11 setHidden:v10];

  if ([*(id *)(a1 + 32) isInCallWidgetHidden]
    && [*(id *)(a1 + 32) isSmartWidgetHidden])
  {
    id v15 = [*(id *)(a1 + 32) navigationInstructionWidgetViewController];
    if ([v15 wantsLargeSize]) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = [*(id *)(a1 + 32) hasActiveNavigation] ^ 1;
    }
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    uint64_t v12 = 0;
  }
  v14 = [*(id *)(a1 + 32) nowPlayingWidgetController];
  [v14 setWantsLargeSize:v12];

  if (v13)
  {
  }
}

- (void)_updateMapWidgetSizes
{
  v26[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DBWidgetContainerViewController *)self layoutType];
  if (v3 == 1 || v3 == 3)
  {
    v14 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    id v15 = [v14 view];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    v20 = [(DBWidgetContainerViewController *)self primaryWidgetStackViewController];
    uint64_t v21 = [v20 visibleCount];

    if (v21 == 3)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v17, (v19 + -16.0) * 0.5);
      v25 = v12;
      int v13 = &v25;
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v17, (v19 + -8.0 + v19 + -8.0) / 3.0);
      CGRect v24 = v12;
      int v13 = &v24;
    }
    goto LABEL_10;
  }
  if (v3 == 2)
  {
    id v4 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    uint64_t v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    uint64_t v10 = [(DBWidgetContainerViewController *)self secondaryWidgetStackViewController];
    uint64_t v11 = [v10 visibleCount];

    if (v11 == 2)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v7, (v9 + -8.0 + v9 + -8.0) / 3.0);
      v26[0] = v12;
      int v13 = (void **)v26;
LABEL_10:
      uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v13, 1, v24, v25, v26[0]);

      goto LABEL_11;
    }
  }
  uint64_t v22 = (void *)MEMORY[0x263EFFA68];
LABEL_11:
  uint64_t v23 = [(DBWidgetContainerViewController *)self navigationInstructionWidgetViewController];
  [v23 setAvailableWidgetSizes:v22];
}

- (void)_callStatusChanged:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7E1A0], "sharedInstance", a3);
  id v7 = [v4 displayedAudioAndVideoCalls];

  uint64_t v5 = [v7 count];
  [(DBWidgetContainerViewController *)self setInCallWidgetHidden:v5 == 0];
  if (v5)
  {
    double v6 = [(DBWidgetContainerViewController *)self inCallWidgetController];
    [v6 handleCallStatusChanged];
  }
}

- (void)requestSizeChange
{
}

- (void)setLandscapePortraitConstraints:(id)a3
{
}

- (void)setSquareConstraints:(id)a3
{
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (BOOL)isSmartWidgetHidden
{
  return self->_smartWidgetHidden;
}

- (void)setSmartWidgetHidden:(BOOL)a3
{
  self->_smartWidgetHidden = a3;
}

- (BOOL)isInCallWidgetHidden
{
  return self->_inCallWidgetHidden;
}

- (BOOL)sceneWidgetsEnabled
{
  return self->_sceneWidgetsEnabled;
}

- (BOOL)sceneWidgetsForeground
{
  return self->_sceneWidgetsForeground;
}

- (BOOL)sceneWidgetsActive
{
  return self->_sceneWidgetsActive;
}

- (BOOL)hasActiveNavigation
{
  return self->_hasActiveNavigation;
}

- (void)setHasActiveNavigation:(BOOL)a3
{
  self->_hasActiveNavigation = a3;
}

- (DBNavigationInstructionWidgetViewController)navigationInstructionWidgetViewController
{
  return self->_navigationInstructionWidgetViewController;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBNowPlayingWidgetViewController)nowPlayingWidgetController
{
  return self->_nowPlayingWidgetController;
}

- (DBInCallWidgetViewController)inCallWidgetController
{
  return self->_inCallWidgetController;
}

- (DBSmartWidgetViewController)smartWidgetController
{
  return self->_smartWidgetController;
}

- (DBWidgetStackViewController)primaryWidgetStackViewController
{
  return self->_primaryWidgetStackViewController;
}

- (void)setPrimaryWidgetStackViewController:(id)a3
{
}

- (DBWidgetStackViewController)secondaryWidgetStackViewController
{
  return self->_secondaryWidgetStackViewController;
}

- (void)setSecondaryWidgetStackViewController:(id)a3
{
}

- (NSArray)sceneWidgetControllers
{
  return self->_sceneWidgetControllers;
}

- (void)setSceneWidgetControllers:(id)a3
{
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (DBSmartWidgetEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (NSMutableSet)smartWidgetChangeVisibilityDisabledRequesters
{
  return self->_smartWidgetChangeVisibilityDisabledRequesters;
}

- (void)setSmartWidgetChangeVisibilityDisabledRequesters:(id)a3
{
}

- (BOOL)initialConstraintsSetup
{
  return self->_initialConstraintsSetup;
}

- (void)setInitialConstraintsSetup:(BOOL)a3
{
  self->_initialConstraintsSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartWidgetChangeVisibilityDisabledRequesters, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_sceneWidgetControllers, 0);
  objc_storeStrong((id *)&self->_secondaryWidgetStackViewController, 0);
  objc_storeStrong((id *)&self->_primaryWidgetStackViewController, 0);
  objc_storeStrong((id *)&self->_smartWidgetController, 0);
  objc_storeStrong((id *)&self->_inCallWidgetController, 0);
  objc_storeStrong((id *)&self->_nowPlayingWidgetController, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_navigationInstructionWidgetViewController, 0);
  objc_storeStrong((id *)&self->_squareConstraints, 0);
  objc_storeStrong((id *)&self->_landscapePortraitConstraints, 0);
}

- (void)animateSmartWidget:(NSObject *)a3 completion:.cold.1(char a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1) {
    id v4 = @"hidden";
  }
  else {
    id v4 = @"unhidden";
  }
  if ([a2 isSmartWidgetHidden]) {
    uint64_t v5 = @"hidden";
  }
  else {
    uint64_t v5 = @"unhidden";
  }
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "[Update Prediction] Animating smart widget to be %@, currently it is %@", (uint8_t *)&v6, 0x16u);
}

@end