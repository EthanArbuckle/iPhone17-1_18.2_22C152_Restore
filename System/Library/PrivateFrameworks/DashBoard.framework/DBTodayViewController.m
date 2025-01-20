@interface DBTodayViewController
+ (BOOL)isEnabledAndSupportedForIconProvider:(id)a3;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBEnvironment)environment;
- (DBLayoutHelperView)layoutHelperView;
- (DBNavigationMapWidgetViewController)navigationMapWidgetViewController;
- (DBTodayViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4;
- (DBTodayViewSynchronizedAnimationManager)animationManager;
- (DBWidgetContainerViewController)widgetContainerViewController;
- (NSArray)currentConstraints;
- (NSArray)landscapeConstraints;
- (NSArray)portraitConstraints;
- (NSArray)squareConstraints;
- (NSLayoutConstraint)landscapeContainerWidthConstraint;
- (NSLayoutConstraint)squareContainerHeightConstraint;
- (NSMutableSet)sceneWidgetsDisabledRequesters;
- (NSString)navigationWidgetBundleIdentifier;
- (_UILegibilitySettings)legibilitySettings;
- (id)linearFocusItems;
- (id)preferredFocusEnvironments;
- (unint64_t)_layout;
- (unint64_t)currentLayoutType;
- (unint64_t)preferredFocusHeading;
- (void)_updateNavigationWidgetsForIdentifier:(id)a3;
- (void)didChangeLayout:(id)a3;
- (void)invalidate;
- (void)navigationStateProvider:(id)a3 frontmostIdentifierDidChange:(id)a4;
- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4;
- (void)reloadConstraints;
- (void)setActive:(BOOL)a3;
- (void)setAnimationManager:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setCurrentLayoutType:(unint64_t)a3;
- (void)setEnvironment:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setLandscapeConstraints:(id)a3;
- (void)setLandscapeContainerWidthConstraint:(id)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setLayoutHelperView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNavigationMapWidgetViewController:(id)a3;
- (void)setNavigationWidgetBundleIdentifier:(id)a3;
- (void)setPortraitConstraints:(id)a3;
- (void)setPreferredFocusHeading:(unint64_t)a3;
- (void)setSceneWidgetsDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)setSceneWidgetsDisabledRequesters:(id)a3;
- (void)setSmartWidgetCanChangeVisibilityDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)setSquareConstraints:(id)a3;
- (void)setSquareContainerHeightConstraint:(id)a3;
- (void)setWidgetContainerViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DBTodayViewController

- (DBTodayViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DBTodayViewController;
  v8 = [(DBTodayViewController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    v10 = objc_alloc_init(DBTodayViewSynchronizedAnimationManager);
    animationManager = v9->_animationManager;
    v9->_animationManager = v10;

    objc_storeStrong((id *)&v9->_layoutEngine, a4);
    [(DBTodayViewController *)v9 setSmartWidgetCanChangeVisibilityDisabled:1 forRequester:@"DBTodayViewSetupRequester"];
    v12 = [v6 environmentConfiguration];
    v13 = [v12 navigationStateProvider];

    [v13 addObserver:v9];
  }

  return v9;
}

+ (BOOL)isEnabledAndSupportedForIconProvider:(id)a3
{
  id v3 = a3;
  if (DBIsInternalInstall_onceToken_4 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_4, &__block_literal_global_47);
  }
  if (!DBIsInternalInstall_isInternal_4
    || ([MEMORY[0x263EFFA40] standardUserDefaults],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 BOOLForKey:@"CARDisableDashboard"],
        v4,
        !v5))
  {
    v8 = +[DBApplicationController sharedInstance];
    id v6 = [v8 mapsApplication];

    v9 = [MEMORY[0x263F41770] sharedConfiguration];
    int v10 = [v9 currentCountrySupportsCarIntegration];
    v11 = DBLogForCategory(0);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Geo services are supported.", buf, 2u);
      }

      if (!v6)
      {
        char v13 = 0;
        goto LABEL_17;
      }
      v9 = [v6 bundleIdentifier];
      char v13 = [v3 isIconVisibleForIdentifier:v9];
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Geo services are not supported in this country.", buf, 2u);
      }

      char v13 = 0;
    }

LABEL_17:
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v14 = +[DBApplicationController sharedInstance];
    objc_super v15 = [v14 allApplications];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__DBTodayViewController_isEnabledAndSupportedForIconProvider___block_invoke;
    v17[3] = &unk_2649B6E20;
    id v18 = v3;
    v19 = buf;
    [v15 enumerateObjectsUsingBlock:v17];

    BOOL v7 = (v13 & 1) != 0 || v21[24] != 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  id v6 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Dashboard has been disabled with user default", buf, 2u);
  }
  BOOL v7 = 0;
LABEL_21:

  return v7;
}

void __62__DBTodayViewController_isEnabledAndSupportedForIconProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 supportsDashboardNavigation])
  {
    id v6 = *(void **)(a1 + 32);
    BOOL v7 = [v8 bundleIdentifier];
    LODWORD(v6) = [v6 isIconVisibleForIdentifier:v7];

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (void)setSceneWidgetsDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(DBTodayViewController *)self sceneWidgetsDisabledRequesters];
  id v8 = v7;
  if (v4)
  {

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(DBTodayViewController *)self setSceneWidgetsDisabledRequesters:v9];
    }
    id v8 = [(DBTodayViewController *)self sceneWidgetsDisabledRequesters];
    [v8 addObject:v6];
  }
  else
  {
    [v7 removeObject:v6];
  }

  int v10 = [(DBTodayViewController *)self sceneWidgetsDisabledRequesters];
  BOOL v11 = [v10 count] == 0;

  BOOL v12 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [v12 setEnabled:v11];

  id v13 = [(DBTodayViewController *)self widgetContainerViewController];
  [v13 setSceneWidgetsEnabled:v11];
}

- (void)setSmartWidgetCanChangeVisibilityDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBTodayViewController *)self widgetContainerViewController];
  [v7 setSmartWidgetCanChangeVisibilityDisabled:v4 forRequester:v6];
}

- (void)setForeground:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [v5 setForeground:v3];

  id v6 = [(DBTodayViewController *)self widgetContainerViewController];
  [v6 setSceneWidgetsForeground:v3];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [v5 setActive:v3];

  id v6 = [(DBTodayViewController *)self widgetContainerViewController];
  [v6 setSceneWidgetsActive:v3];
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)DBTodayViewController;
  [(DBTodayViewController *)&v42 viewDidLoad];
  BOOL v3 = objc_alloc_init(DBLayoutHelperView);
  [(DBLayoutHelperView *)v3 setLayoutDelegate:self];
  BOOL v4 = [(DBTodayViewController *)self view];
  [v4 addSubview:v3];

  [(DBTodayViewController *)self setLayoutHelperView:v3];
  int v5 = [DBNavigationMapWidgetViewController alloc];
  id v6 = [(DBTodayViewController *)self environment];
  id v7 = [(DBTodayViewController *)self animationManager];
  id v8 = [(DBNavigationWidgetViewController *)v5 initWithEnvironment:v6 animationManager:v7 widgetSizeManager:0];
  [(DBTodayViewController *)self setNavigationMapWidgetViewController:v8];

  id v9 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [(DBTodayViewController *)self addChildViewController:v9];

  int v10 = [(DBTodayViewController *)self view];
  BOOL v11 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  BOOL v12 = [v11 view];
  [v10 addSubview:v12];

  id v13 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [v13 didMoveToParentViewController:self];

  v14 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  objc_super v15 = [v14 view];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  v17 = [v16 view];
  [v17 setAccessibilityIdentifier:@"CARAppTodayViewMapView"];

  id v18 = [DBWidgetContainerViewController alloc];
  v19 = [(DBTodayViewController *)self environment];
  v20 = [(DBTodayViewController *)self animationManager];
  v21 = [(DBWidgetContainerViewController *)v18 initWithEnvironment:v19 animationManager:v20];
  [(DBTodayViewController *)self setWidgetContainerViewController:v21];

  uint64_t v22 = [(DBTodayViewController *)self widgetContainerViewController];
  [(DBTodayViewController *)self addChildViewController:v22];

  char v23 = [(DBTodayViewController *)self view];
  v24 = [(DBTodayViewController *)self widgetContainerViewController];
  v25 = [v24 view];
  [v23 addSubview:v25];

  v26 = [(DBTodayViewController *)self widgetContainerViewController];
  [v26 didMoveToParentViewController:self];

  v27 = [(DBTodayViewController *)self widgetContainerViewController];
  v28 = [v27 view];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(DBTodayViewController *)self widgetContainerViewController];
  v30 = [v29 view];
  [v30 setAccessibilityIdentifier:@"CARAppTodayViewWidgetContainer"];

  v31 = [(DBTodayViewController *)self environment];
  v32 = [v31 environmentConfiguration];
  v33 = [v32 navigationStateProvider];

  if (DBIsInternalInstall_onceToken_4 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_4, &__block_literal_global_47);
  }
  if (!DBIsInternalInstall_isInternal_4
    || ([MEMORY[0x263EFFA40] standardUserDefaults],
        v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = [v34 BOOLForKey:@"CARDisableAutoLaunchNavigation"],
        v34,
        (v35 & 1) == 0))
  {
    v36 = [v33 navigatingIdentifiers];
    [(DBTodayViewController *)self navigationStateProvider:v33 navigatingIdentifiersDidChange:v36];

    v37 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    v38 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
    [v37 setTargetBundleIdentifier:v38];

    v39 = [(DBTodayViewController *)self widgetContainerViewController];
    v40 = [v39 navigationInstructionWidgetViewController];
    v41 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
    [v40 setTargetBundleIdentifier:v41];
  }
}

- (id)linearFocusItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = [(DBTodayViewController *)self environment];
  uint64_t v5 = [v4 environmentConfiguration];
  int v6 = [(id)v5 isRightHandDrive];

  id v7 = [(DBTodayViewController *)self traitCollection];
  BOOL v8 = [v7 layoutDirection] == 1;

  id v9 = [MEMORY[0x263F30E20] flipDashboardLayout];
  LODWORD(v5) = [v9 valueBool];

  int v10 = v6 ^ v8 ^ v5;
  if ([(DBTodayViewController *)self _layout] != 1 || (v10 & 1) == 0)
  {
    BOOL v11 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    BOOL v12 = [v11 viewIfLoaded];

    if (v12)
    {
      id v13 = [(DBTodayViewController *)self navigationMapWidgetViewController];
      v14 = [v13 linearFocusItems];
      [v3 addObjectsFromArray:v14];
    }
  }
  objc_super v15 = [(DBTodayViewController *)self widgetContainerViewController];
  v16 = [v15 linearFocusItems];
  [v3 addObjectsFromArray:v16];

  if ([(DBTodayViewController *)self _layout] == 1) {
    int v17 = v10;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    id v18 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    v19 = [v18 viewIfLoaded];

    if (v19)
    {
      v20 = [(DBTodayViewController *)self navigationMapWidgetViewController];
      v21 = [v20 linearFocusItems];
      [v3 addObjectsFromArray:v21];
    }
  }
  return v3;
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(DBTodayViewController *)self linearFocusItems];
  if ([v3 count])
  {
    if ([(DBTodayViewController *)self preferredFocusHeading] == 1)
    {
      BOOL v4 = [v3 lastObject];
      v9[0] = v4;
      uint64_t v5 = (void **)v9;
    }
    else
    {
      BOOL v4 = [v3 firstObject];
      BOOL v8 = v4;
      uint64_t v5 = &v8;
    }
    int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    int v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBTodayViewController;
  [(DBTodayViewController *)&v4 viewDidAppear:a3];
  [(DBTodayViewController *)self reloadConstraints];
}

- (NSString)navigationWidgetBundleIdentifier
{
  id v3 = [MEMORY[0x263F30E28] useNightModeTester];
  char v4 = [v3 valueBool];

  if (v4) {
    p_navigationWidgetBundleIdentifier = (NSString **)DBNightModeTesterBundleIdentifier;
  }
  else {
    p_navigationWidgetBundleIdentifier = &self->_navigationWidgetBundleIdentifier;
  }
  int v6 = *p_navigationWidgetBundleIdentifier;
  return v6;
}

- (NSArray)portraitConstraints
{
  portraitConstraints = self->_portraitConstraints;
  if (!portraitConstraints)
  {
    char v4 = (NSArray *)objc_opt_new();
    uint64_t v5 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    int v6 = [v5 view];

    id v7 = [(DBTodayViewController *)self widgetContainerViewController];
    BOOL v8 = [v7 view];

    id v9 = [v6 leadingAnchor];
    int v10 = [(DBTodayViewController *)self view];
    BOOL v11 = [v10 leadingAnchor];
    BOOL v12 = [v9 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:1.0];
    [(NSArray *)v4 addObject:v12];

    id v13 = [(DBTodayViewController *)self view];
    v14 = [v13 trailingAnchor];
    objc_super v15 = [v6 trailingAnchor];
    v16 = [v14 constraintEqualToSystemSpacingAfterAnchor:v15 multiplier:1.0];
    [(NSArray *)v4 addObject:v16];

    int v17 = [v6 topAnchor];
    id v18 = [(DBTodayViewController *)self view];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0];
    [(NSArray *)v4 addObject:v20];

    v21 = [v8 leadingAnchor];
    uint64_t v22 = [(DBTodayViewController *)self view];
    char v23 = [v22 leadingAnchor];
    v24 = [v21 constraintEqualToSystemSpacingAfterAnchor:v23 multiplier:1.0];
    [(NSArray *)v4 addObject:v24];

    v25 = [(DBTodayViewController *)self view];
    v26 = [v25 trailingAnchor];
    v27 = [v8 trailingAnchor];
    v28 = [v26 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
    [(NSArray *)v4 addObject:v28];

    v29 = [v8 topAnchor];
    v30 = [v6 bottomAnchor];
    v31 = [v29 constraintEqualToSystemSpacingBelowAnchor:v30 multiplier:1.0];
    [(NSArray *)v4 addObject:v31];

    v32 = [(DBTodayViewController *)self view];
    v33 = [v32 bottomAnchor];
    v34 = [v8 bottomAnchor];
    char v35 = [v33 constraintEqualToSystemSpacingBelowAnchor:v34 multiplier:1.0];
    [(NSArray *)v4 addObject:v35];

    v36 = [v8 heightAnchor];
    v37 = [v36 constraintGreaterThanOrEqualToConstant:166.0];

    LODWORD(v38) = 1148846080;
    [v8 setContentHuggingPriority:1 forAxis:v38];
    [(NSArray *)v4 addObject:v37];
    v39 = [v6 heightAnchor];
    v40 = [(DBTodayViewController *)self view];
    v41 = [v40 heightAnchor];
    objc_super v42 = [v39 constraintEqualToAnchor:v41 multiplier:0.5 constant:-24.0];

    LODWORD(v43) = 1148829696;
    [v42 setPriority:v43];
    [(NSArray *)v4 addObject:v42];
    v44 = self->_portraitConstraints;
    self->_portraitConstraints = v4;

    portraitConstraints = self->_portraitConstraints;
  }
  return portraitConstraints;
}

- (NSArray)squareConstraints
{
  squareConstraints = self->_squareConstraints;
  if (!squareConstraints)
  {
    char v4 = (NSArray *)objc_opt_new();
    uint64_t v5 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    int v6 = [v5 view];

    id v7 = [(DBTodayViewController *)self widgetContainerViewController];
    BOOL v8 = [v7 view];

    id v9 = [v6 leadingAnchor];
    int v10 = [(DBTodayViewController *)self view];
    BOOL v11 = [v10 leadingAnchor];
    BOOL v12 = [v9 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:1.0];
    [(NSArray *)v4 addObject:v12];

    id v13 = [(DBTodayViewController *)self view];
    v14 = [v13 trailingAnchor];
    objc_super v15 = [v6 trailingAnchor];
    v16 = [v14 constraintEqualToSystemSpacingAfterAnchor:v15 multiplier:1.0];
    [(NSArray *)v4 addObject:v16];

    int v17 = [v6 topAnchor];
    id v18 = [(DBTodayViewController *)self view];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0];
    [(NSArray *)v4 addObject:v20];

    v21 = [v8 leadingAnchor];
    uint64_t v22 = [(DBTodayViewController *)self view];
    char v23 = [v22 leadingAnchor];
    v24 = [v21 constraintEqualToSystemSpacingAfterAnchor:v23 multiplier:1.0];
    [(NSArray *)v4 addObject:v24];

    v25 = [(DBTodayViewController *)self view];
    v26 = [v25 trailingAnchor];
    v27 = [v8 trailingAnchor];
    v28 = [v26 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
    [(NSArray *)v4 addObject:v28];

    v29 = [v8 topAnchor];
    v30 = [v6 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:8.0];
    [(NSArray *)v4 addObject:v31];

    v32 = [(DBTodayViewController *)self view];
    v33 = [v32 bottomAnchor];
    v34 = [v8 bottomAnchor];
    char v35 = [v33 constraintEqualToSystemSpacingBelowAnchor:v34 multiplier:1.0];
    [(NSArray *)v4 addObject:v35];

    v36 = [v8 heightAnchor];
    v37 = [v36 constraintEqualToConstant:0.0];
    [(DBTodayViewController *)self setSquareContainerHeightConstraint:v37];

    double v38 = [(DBTodayViewController *)self squareContainerHeightConstraint];
    LODWORD(v39) = 1148846080;
    [v38 setPriority:v39];

    v40 = [(DBTodayViewController *)self squareContainerHeightConstraint];
    [(NSArray *)v4 addObject:v40];

    v41 = self->_squareConstraints;
    self->_squareConstraints = v4;

    squareConstraints = self->_squareConstraints;
  }
  return squareConstraints;
}

- (NSArray)landscapeConstraints
{
  v69[6] = *MEMORY[0x263EF8340];
  landscapeConstraints = self->_landscapeConstraints;
  if (!landscapeConstraints)
  {
    char v4 = [(DBTodayViewController *)self navigationMapWidgetViewController];
    uint64_t v5 = [v4 view];

    int v6 = [(DBTodayViewController *)self widgetContainerViewController];
    id v7 = [v6 view];

    BOOL v8 = [(DBTodayViewController *)self environment];
    id v9 = [v8 environmentConfiguration];
    int v10 = [v9 isRightHandDrive];

    BOOL v11 = [MEMORY[0x263F30E20] flipDashboardLayout];
    int v12 = [v11 valueBool];

    if (v10 != v12) {
      id v13 = v7;
    }
    else {
      id v13 = (void *)v5;
    }
    v63 = (void *)v5;
    if (v10 != v12) {
      v14 = (void *)v5;
    }
    else {
      v14 = v7;
    }
    id v15 = v13;
    id v16 = v14;
    v62 = v7;
    int v17 = [v7 widthAnchor];
    id v18 = [v17 constraintEqualToConstant:0.0];
    [(DBTodayViewController *)self setLandscapeContainerWidthConstraint:v18];

    id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
    v58 = [v15 topAnchor];
    v60 = [(DBTodayViewController *)self view];
    v57 = [v60 topAnchor];
    v56 = [v58 constraintEqualToSystemSpacingBelowAnchor:v57 multiplier:1.0];
    v69[0] = v56;
    v55 = [(DBTodayViewController *)self view];
    v54 = [v55 bottomAnchor];
    v65 = v15;
    v53 = [v15 bottomAnchor];
    v52 = [v54 constraintEqualToSystemSpacingBelowAnchor:v53 multiplier:1.0];
    v69[1] = v52;
    v51 = [v16 leftAnchor];
    v50 = [v15 rightAnchor];
    v49 = [v51 constraintEqualToSystemSpacingAfterAnchor:v50 multiplier:1.0];
    v69[2] = v49;
    v48 = [v16 topAnchor];
    v19 = [(DBTodayViewController *)self view];
    v20 = [v19 topAnchor];
    v21 = [v48 constraintEqualToSystemSpacingBelowAnchor:v20 multiplier:1.0];
    v69[3] = v21;
    uint64_t v22 = [(DBTodayViewController *)self view];
    char v23 = [v22 bottomAnchor];
    v64 = v16;
    v24 = [v16 bottomAnchor];
    v25 = [v23 constraintEqualToSystemSpacingBelowAnchor:v24 multiplier:1.0];
    v69[4] = v25;
    v26 = [(DBTodayViewController *)self landscapeContainerWidthConstraint];
    v69[5] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:6];
    [v66 addObjectsFromArray:v27];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v29 = [WeakRetained environmentConfiguration];
    LODWORD(v23) = [v29 hasDualStatusBar];

    v30 = [v65 leftAnchor];
    v31 = [(DBTodayViewController *)self view];
    v32 = [v31 leftAnchor];
    if (v23)
    {
      v61 = [(DBTodayViewController *)self layoutEngine];
      [v61 todayViewAdditionalHorizontalInset];
      uint64_t v59 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
      v68[0] = v59;
      v33 = [v64 rightAnchor];
      v34 = [(DBTodayViewController *)self view];
      char v35 = [v34 rightAnchor];
      v36 = [(DBTodayViewController *)self layoutEngine];
      [v36 todayViewAdditionalHorizontalInset];
      [v33 constraintEqualToAnchor:v35 constant:-v37];
      v39 = double v38 = v30;
      v68[1] = v39;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
      v40 = v32;
      objc_super v42 = v41 = v31;
      [v66 addObjectsFromArray:v42];

      v31 = v41;
      v32 = v40;
      double v43 = v61;

      v30 = v38;
      v44 = (void *)v59;
    }
    else
    {
      double v43 = [v30 constraintEqualToSystemSpacingAfterAnchor:v32 multiplier:1.0];
      v67[0] = v43;
      v44 = [(DBTodayViewController *)self view];
      v33 = [v44 rightAnchor];
      v34 = [v64 rightAnchor];
      char v35 = [v33 constraintEqualToSystemSpacingAfterAnchor:v34 multiplier:1.0];
      v67[1] = v35;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
      [v66 addObjectsFromArray:v36];
    }

    v45 = (NSArray *)[v66 copy];
    v46 = self->_landscapeConstraints;
    self->_landscapeConstraints = v45;

    landscapeConstraints = self->_landscapeConstraints;
  }
  return landscapeConstraints;
}

- (unint64_t)_layout
{
  v2 = [(DBTodayViewController *)self view];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  if (CGRectEqualToRect(v13, *MEMORY[0x263F001A8])) {
    return 0;
  }
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  double Width = CGRectGetWidth(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  if (Width / CGRectGetHeight(v15) > 1.3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)reloadConstraints
{
  unint64_t v3 = [(DBTodayViewController *)self _layout];
  if (v3 == [(DBTodayViewController *)self currentLayoutType]) {
    return;
  }
  [(DBTodayViewController *)self setCurrentLayoutType:v3];
  switch(v3)
  {
    case 1uLL:
      uint64_t v4 = [(DBTodayViewController *)self landscapeConstraints];
      break;
    case 2uLL:
      uint64_t v4 = [(DBTodayViewController *)self squareConstraints];
      break;
    case 3uLL:
      uint64_t v4 = [(DBTodayViewController *)self portraitConstraints];
      break;
    default:
      id v11 = 0;
      goto LABEL_10;
  }
  id v11 = (id)v4;
LABEL_10:
  double v5 = [(DBTodayViewController *)self currentConstraints];

  if (v5)
  {
    CGFloat v6 = (void *)MEMORY[0x263F08938];
    double v7 = [(DBTodayViewController *)self currentConstraints];
    [v6 deactivateConstraints:v7];

    [(DBTodayViewController *)self setCurrentConstraints:0];
  }
  CGFloat v8 = [(DBTodayViewController *)self widgetContainerViewController];
  [v8 setLayoutType:v3];

  double v9 = [(DBTodayViewController *)self widgetContainerViewController];
  [v9 invalidateConstraints];

  CGFloat v10 = v11;
  if (v11)
  {
    [MEMORY[0x263F08938] activateConstraints:v11];
    [(DBTodayViewController *)self setCurrentConstraints:v11];
    CGFloat v10 = v11;
  }
}

- (void)invalidate
{
  unint64_t v3 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];

  if (v3)
  {
    uint64_t v4 = [(DBTodayViewController *)self environment];
    double v5 = [v4 environmentConfiguration];
    CGFloat v6 = [v5 appHistory];
    double v7 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
    [v6 setDashboardAppOnDisconnect:v7];
  }
  CGFloat v8 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  [v8 invalidate];

  double v9 = [(DBTodayViewController *)self widgetContainerViewController];
  [v9 invalidate];

  id v10 = [(DBTodayViewController *)self animationManager];
  [v10 invalidate];
}

- (void)didChangeLayout:(id)a3
{
  [(DBTodayViewController *)self reloadConstraints];
  unint64_t v4 = [(DBTodayViewController *)self currentLayoutType];
  double v5 = [(DBTodayViewController *)self view];
  [v5 bounds];
  if (v4 == 2)
  {
    double v10 = fmin((CGRectGetHeight(*(CGRect *)&v6) + -24.0) * 0.5, 200.0);

    [(DBTodayViewController *)self squareContainerHeightConstraint];
  }
  else
  {
    CGFloat v11 = CGRectGetWidth(*(CGRect *)&v6) + -24.0;

    int v12 = [(DBTodayViewController *)self layoutEngine];
    [v12 dualStatusBarTotalHorizontalWidth];
    CGFloat v14 = v11 - v13;

    double v10 = fmin(v14 * 0.5, 240.0);
    [(DBTodayViewController *)self landscapeContainerWidthConstraint];
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 setConstant:v10];
}

- (void)navigationStateProvider:(id)a3 frontmostIdentifierDidChange:(id)a4
{
  id v5 = [a3 mostRecentDashboardNavigatingApp];
  [(DBTodayViewController *)self _updateNavigationWidgetsForIdentifier:v5];
}

- (void)navigationStateProvider:(id)a3 navigatingIdentifiersDidChange:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Active navigation identifiers changed", (uint8_t *)&v23, 2u);
  }

  double v9 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
  char v10 = [v7 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    CGFloat v11 = [(DBTodayViewController *)self widgetContainerViewController];
    int v12 = [v11 navigationInstructionWidgetViewController];
    [v12 setWantsLargeSize:0];
  }
  double v13 = [v6 mostRecentDashboardNavigatingApp];
  uint64_t v14 = [v7 containsObject:v13];
  id v15 = [(DBTodayViewController *)self widgetContainerViewController];
  [v15 setHasActiveNavigation:v14];

  id v16 = [(DBTodayViewController *)self widgetContainerViewController];
  [v16 requestSizeChange];

  int v17 = DBLogForCategory(2uLL);
  id v18 = v17;
  if (v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
      int v23 = 138543618;
      v24 = v13;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Resolved target dashboard identifier is %{public}@, current identifier is: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    v20 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
    char v21 = [v13 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = DBLogForCategory(2uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "Updating navigation widgets to new identifier", (uint8_t *)&v23, 2u);
      }

      [(DBTodayViewController *)self _updateNavigationWidgetsForIdentifier:v13];
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DBTodayViewController navigationStateProvider:navigatingIdentifiersDidChange:](self, v18);
    }
  }
}

- (void)_updateNavigationWidgetsForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  [(DBTodayViewController *)self setNavigationWidgetBundleIdentifier:v5];

  id v6 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Active navigation identifier is different: %@", (uint8_t *)&v16, 0xCu);
  }

  id v7 = [(DBTodayViewController *)self widgetContainerViewController];
  CGFloat v8 = [v7 navigationInstructionWidgetViewController];
  double v9 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
  [v8 setTargetBundleIdentifier:v9];

  char v10 = [(DBTodayViewController *)self navigationMapWidgetViewController];
  CGFloat v11 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
  [v10 setTargetBundleIdentifier:v11];

  int v12 = [(DBTodayViewController *)self environment];
  double v13 = [v12 environmentConfiguration];
  uint64_t v14 = [v13 analytics];
  id v15 = [(DBTodayViewController *)self navigationWidgetBundleIdentifier];
  [v14 dashboardNavigationDidChangeToBundleIdentifier:v15];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setPortraitConstraints:(id)a3
{
}

- (void)setSquareConstraints:(id)a3
{
}

- (void)setLandscapeConstraints:(id)a3
{
}

- (unint64_t)preferredFocusHeading
{
  return self->_preferredFocusHeading;
}

- (void)setPreferredFocusHeading:(unint64_t)a3
{
  self->_preferredFocusHeading = a3;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBNavigationMapWidgetViewController)navigationMapWidgetViewController
{
  return self->_navigationMapWidgetViewController;
}

- (void)setNavigationMapWidgetViewController:(id)a3
{
}

- (DBWidgetContainerViewController)widgetContainerViewController
{
  return self->_widgetContainerViewController;
}

- (void)setWidgetContainerViewController:(id)a3
{
}

- (unint64_t)currentLayoutType
{
  return self->_currentLayoutType;
}

- (void)setCurrentLayoutType:(unint64_t)a3
{
  self->_currentLayoutType = a3;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (NSLayoutConstraint)landscapeContainerWidthConstraint
{
  return self->_landscapeContainerWidthConstraint;
}

- (void)setLandscapeContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)squareContainerHeightConstraint
{
  return self->_squareContainerHeightConstraint;
}

- (void)setSquareContainerHeightConstraint:(id)a3
{
}

- (DBTodayViewSynchronizedAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
}

- (NSMutableSet)sceneWidgetsDisabledRequesters
{
  return self->_sceneWidgetsDisabledRequesters;
}

- (void)setSceneWidgetsDisabledRequesters:(id)a3
{
}

- (DBLayoutHelperView)layoutHelperView
{
  return self->_layoutHelperView;
}

- (void)setLayoutHelperView:(id)a3
{
}

- (void)setNavigationWidgetBundleIdentifier:(id)a3
{
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_storeStrong((id *)&self->_navigationWidgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutHelperView, 0);
  objc_storeStrong((id *)&self->_sceneWidgetsDisabledRequesters, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_squareContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_widgetContainerViewController, 0);
  objc_storeStrong((id *)&self->_navigationMapWidgetViewController, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_landscapeConstraints, 0);
  objc_storeStrong((id *)&self->_squareConstraints, 0);
  objc_storeStrong((id *)&self->_portraitConstraints, 0);
  objc_storeStrong((id *)&self->legibilitySettings, 0);
}

- (void)navigationStateProvider:(void *)a1 navigatingIdentifiersDidChange:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unint64_t v3 = [a1 navigationWidgetBundleIdentifier];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Target dashboard identifier is nil, keeping identifer as %{public}@", (uint8_t *)&v4, 0xCu);
}

@end