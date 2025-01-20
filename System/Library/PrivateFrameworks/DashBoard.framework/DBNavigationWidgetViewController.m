@interface DBNavigationWidgetViewController
- (BKSAnimationFenceHandle)pendingWidgetResizeFenceHandle;
- (BKSTouchDeliveryPolicyAssertion)cancelTouchesInIsolatedViewAssertion;
- (BKSTouchDeliveryPolicyAssertion)touchDeliveryPolicyAssertion;
- (BOOL)debugSnapshotLabelEnabled;
- (BOOL)entireWidgetFocusable;
- (BOOL)isActive;
- (BOOL)isEnabled;
- (BOOL)isForeground;
- (BOOL)isInvalidated;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)proxySceneContentReady;
- (BSAnimationSettings)pendingWidgetResizeAnimationSettings;
- (DBNavigationWidgetViewController)initWithEnvironment:(id)a3 animationManager:(id)a4 widgetSizeManager:(id)a5;
- (DBTodayViewSynchronizedAnimationManager)animationManager;
- (DBWidgetSceneHostViewController)widgetSceneViewController;
- (DBWidgetSizeManaging)widgetSizeManager;
- (NSArray)availableWidgetSizes;
- (NSArray)focusableItemViews;
- (NSMutableSet)touchActionDisabledRequesters;
- (NSString)sceneIdentifierSuffix;
- (NSString)targetBundleIdentifier;
- (NSXPCConnection)widgetWindowServiceConnection;
- (NSXPCListener)widgetWindowServiceListener;
- (UITapGestureRecognizer)selectTapGestureRecognizer;
- (UITapGestureRecognizer)touchTapGestureRecognizer;
- (UIView)loadingView;
- (UIView)touchActionView;
- (double)initialTouchTimestamp;
- (id)linearFocusItems;
- (id)loadingIconImage;
- (id)preferredFocusEnvironments;
- (unint64_t)widgetStyle;
- (unsigned)widgetContextId;
- (void)_addWidgetSceneViewControllerForApplication:(id)a3;
- (void)_animateLoadingViewRemovalIfNecessary;
- (void)_beginTouchCancelation;
- (void)_endTouchCancelation;
- (void)_handleTapGesture:(id)a3;
- (void)_installWidgetSceneViewController:(id)a3;
- (void)_removeWidgetSceneViewController;
- (void)_scrollViewDidEndDragging:(id)a3;
- (void)_scrollViewWillBeginDragging:(id)a3;
- (void)_setTouchActionDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)_updateTouchActionDisabled;
- (void)clientSetContentReady;
- (void)clientSetFocusableItems:(id)a3;
- (void)clientSetWantsLargeSize:(BOOL)a3 fenceHandle:(id)a4 animationSettings:(id)a5;
- (void)connectionReady;
- (void)focusableItem:(id)a3 didChangeFocused:(BOOL)a4;
- (void)focusableItem:(id)a3 didChangePressed:(BOOL)a4;
- (void)invalidate;
- (void)replaceLoadingViewWithView:(id)a3;
- (void)selectedFocusableItem:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAnimationManager:(id)a3;
- (void)setAvailableWidgetSizes:(id)a3;
- (void)setCancelTouchesInIsolatedViewAssertion:(id)a3;
- (void)setDebugSnapshotLabelEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusableItemViews:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setInitialTouchTimestamp:(double)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setPendingWidgetResizeAnimationSettings:(id)a3;
- (void)setPendingWidgetResizeFenceHandle:(id)a3;
- (void)setProxySceneContentReady:(BOOL)a3;
- (void)setSelectTapGestureRecognizer:(id)a3;
- (void)setTargetBundleIdentifier:(id)a3;
- (void)setTouchActionDisabledRequesters:(id)a3;
- (void)setTouchActionView:(id)a3;
- (void)setTouchDeliveryPolicyAssertion:(id)a3;
- (void)setTouchTapGestureRecognizer:(id)a3;
- (void)setWantsLargeSize:(BOOL)a3;
- (void)setWidgetContextId:(unsigned int)a3;
- (void)setWidgetSceneViewController:(id)a3;
- (void)setWidgetSizeManager:(id)a3;
- (void)setWidgetStyle:(unint64_t)a3;
- (void)setWidgetWindowServiceConnection:(id)a3;
- (void)setWidgetWindowServiceListener:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateAppearanceForWallpaper;
- (void)updateContextId:(unsigned int)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)widgetSceneHostViewController:(id)a3 sceneContentStateDidUpdate:(int64_t)a4;
- (void)widgetSceneHostViewControllerSceneWillInvalidate:(id)a3;
@end

@implementation DBNavigationWidgetViewController

- (DBNavigationWidgetViewController)initWithEnvironment:(id)a3 animationManager:(id)a4 widgetSizeManager:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DBNavigationWidgetViewController;
  v11 = [(DBWidgetViewController *)&v19 initWithEnvironment:a3];
  v12 = v11;
  if (v11)
  {
    v11->_active = 1;
    objc_storeStrong((id *)&v11->_animationManager, a4);
    objc_storeWeak((id *)&v12->_widgetSizeManager, v10);
    uint64_t v13 = [MEMORY[0x263F08D88] anonymousListener];
    widgetWindowServiceListener = v12->_widgetWindowServiceListener;
    v12->_widgetWindowServiceListener = (NSXPCListener *)v13;

    [(NSXPCListener *)v12->_widgetWindowServiceListener setDelegate:v12];
    [(NSXPCListener *)v12->_widgetWindowServiceListener resume];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v12 selector:sel__scrollViewWillBeginDragging_ name:*MEMORY[0x263F83DE8] object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v12 selector:sel__scrollViewDidEndDragging_ name:*MEMORY[0x263F83DE0] object:0];

    if (os_variant_has_internal_diagnostics())
    {
      v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v12->_debugSnapshotLabelEnabled = [v17 BOOLForKey:@"CAREnableSnapshotDebugLabel"];
    }
  }

  return v12;
}

- (void)setTargetBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSString *)self->_targetBundleIdentifier isEqualToString:v4])
  {
    v5 = (NSString *)[v4 copy];
    targetBundleIdentifier = self->_targetBundleIdentifier;
    self->_targetBundleIdentifier = v5;

    v7 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v13 = 138543618;
      v14 = v9;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set target bundle ID: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    [(DBNavigationWidgetViewController *)self setProxySceneContentReady:0];
    [(DBNavigationWidgetViewController *)self _removeWidgetSceneViewController];
    BOOL v10 = [(DBNavigationWidgetViewController *)self isEnabled];
    if (v4 && v10)
    {
      v11 = +[DBApplicationController sharedInstance];
      v12 = [v11 applicationWithBundleIdentifier:v4];

      [(DBNavigationWidgetViewController *)self _addWidgetSceneViewControllerForApplication:v12];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v4 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      v7 = NSStringFromBOOL();
      int v12 = 138543618;
      int v13 = v6;
      __int16 v14 = 2114;
      __int16 v15 = v7;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (self->_enabled
      && ([(DBNavigationWidgetViewController *)self targetBundleIdentifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      id v9 = +[DBApplicationController sharedInstance];
      BOOL v10 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
      v11 = [v9 applicationWithBundleIdentifier:v10];

      [(DBNavigationWidgetViewController *)self _addWidgetSceneViewControllerForApplication:v11];
    }
    else
    {
      [(DBNavigationWidgetViewController *)self _removeWidgetSceneViewController];
    }
  }
}

- (void)setForeground:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_foreground != a3)
  {
    BOOL v3 = a3;
    self->_foreground = a3;
    v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = NSStringFromBOOL();
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2114;
      int v13 = v8;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foreground: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v9 setForeground:v3];
  }
}

- (void)setActive:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = NSStringFromBOOL();
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2114;
      int v13 = v8;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Active: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v9 setActive:v3];
  }
}

- (void)setWidgetStyle:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_widgetStyle != a3)
  {
    self->_unint64_t widgetStyle = a3;
    v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      unint64_t widgetStyle = self->_widgetStyle;
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2050;
      unint64_t v13 = widgetStyle;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Widget style: %{public}ld", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v9 setWidgetStyle:a3];
  }
}

- (void)setAvailableWidgetSizes:(id)a3
{
  id v8 = a3;
  v5 = [(DBNavigationWidgetViewController *)self widgetSizeManager];

  if (v5 && (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_availableWidgetSizes, a3);
    v6 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
    v7 = [v6 remoteObjectProxy];
    [v7 hostSetWidgetSizes:v8];
  }
}

- (void)connectionReady
{
  BOOL v3 = [(DBWidgetViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  v5 = [v4 wallpaperPreferences];
  id v10 = [v5 currentWallpaper];

  v6 = [v10 traits];
  uint64_t v7 = [v6 supportsDashboardPlatterMaterials];

  id v8 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
  id v9 = [v8 remoteObjectProxy];
  [v9 hostSetUseSystemPrimaryFocusColor:v7];
}

- (void)replaceLoadingViewWithView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting loading view: %@", buf, 0x16u);
  }
  id v8 = [(DBNavigationWidgetViewController *)self loadingView];
  [v8 removeFromSuperview];

  [(DBNavigationWidgetViewController *)self setLoadingView:v4];
  objc_initWeak((id *)buf, self);
  id v9 = [(DBNavigationWidgetViewController *)self animationManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke;
  v11[3] = &unk_2649B49E0;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  [v9 registerAnimation:@"DBWidgetSceneSplashScreenAnimationIdentifier" client:self animation:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained loadingView];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    [WeakRetained setLoadingView:0];
  }
  v5 = [*(id *)(a1 + 32) superview];

  v6 = DBLogForCategory(2uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Animating out loading view: %@", buf, 0x16u);
    }
    v11 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke_136;
    v17[3] = &unk_2649B3D30;
    uint64_t v18 = *(id *)(a1 + 32);
    id v19 = WeakRetained;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke_2;
    v15[3] = &unk_2649B3FA8;
    id v16 = *(id *)(a1 + 32);
    [v11 animateWithDuration:544 delay:v17 options:v15 animations:0.25 completion:0.0];

    v6 = v18;
  }
  else if (v7)
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading view: %@ is not in hierarchy, skipping animation", buf, 0x16u);
  }
}

void __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke_136(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v3 = [*(id *)(a1 + 40) widgetSceneViewController];
  v2 = [v3 view];
  [v2 setAlpha:1.0];
}

uint64_t __63__DBNavigationWidgetViewController_replaceLoadingViewWithView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)loadingIconImage
{
  id v3 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
  id v4 = [(DBNavigationWidgetViewController *)self traitCollection];
  [v4 displayScale];
  double v5 = DBIconImageInfoForScale();
  id v9 = DBIconImageForBundleIdentifierWithInfoAndBorder(v3, 0, v5, v6, v7, v8);

  return v9;
}

- (void)viewDidLoad
{
  v54[4] = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)DBNavigationWidgetViewController;
  [(DBNavigationWidgetViewController *)&v52 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F82740]);
  id v4 = [(DBNavigationWidgetViewController *)self view];
  [v4 addLayoutGuide:v3];

  v35 = (void *)MEMORY[0x263F08938];
  v47 = [v3 topAnchor];
  v49 = [(DBNavigationWidgetViewController *)self view];
  v45 = [v49 topAnchor];
  v43 = [v47 constraintEqualToAnchor:v45];
  v54[0] = v43;
  v39 = [v3 bottomAnchor];
  v41 = [(DBNavigationWidgetViewController *)self view];
  v37 = [v41 bottomAnchor];
  v33 = [v39 constraintEqualToAnchor:v37];
  v54[1] = v33;
  double v5 = [v3 leftAnchor];
  double v6 = [(DBNavigationWidgetViewController *)self view];
  double v7 = [v6 leftAnchor];
  double v8 = [v5 constraintEqualToAnchor:v7];
  v54[2] = v8;
  v51 = v3;
  id v9 = [v3 rightAnchor];
  uint64_t v10 = [(DBNavigationWidgetViewController *)self view];
  v11 = [v10 rightAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v54[3] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
  [v35 activateConstraints:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  __int16 v15 = [v14 layer];
  [v15 setHitTestsAsOpaque:1];

  id v16 = [(DBNavigationWidgetViewController *)self view];
  [v16 addSubview:v14];

  [(DBNavigationWidgetViewController *)self setTouchActionView:v14];
  v36 = (void *)MEMORY[0x263F08938];
  v48 = [v14 topAnchor];
  v50 = [(DBNavigationWidgetViewController *)self view];
  v46 = [v50 topAnchor];
  v44 = [v48 constraintEqualToAnchor:v46];
  v53[0] = v44;
  v40 = [v14 bottomAnchor];
  v42 = [(DBNavigationWidgetViewController *)self view];
  v38 = [v42 bottomAnchor];
  v34 = [v40 constraintEqualToAnchor:v38];
  v53[1] = v34;
  v32 = [v14 leftAnchor];
  id v17 = [(DBNavigationWidgetViewController *)self view];
  uint64_t v18 = [v17 leftAnchor];
  id v19 = [v32 constraintEqualToAnchor:v18];
  v53[2] = v19;
  v20 = [v14 rightAnchor];
  v21 = [(DBNavigationWidgetViewController *)self view];
  __int16 v22 = [v21 rightAnchor];
  uint64_t v23 = [v20 constraintEqualToAnchor:v22];
  v53[3] = v23;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
  [v36 activateConstraints:v24];

  v25 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleTapGesture_];
  [v25 setAllowedTouchTypes:&unk_26E17EEE8];
  [v14 addGestureRecognizer:v25];
  [(DBNavigationWidgetViewController *)self setTouchTapGestureRecognizer:v25];
  v26 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleTapGesture_];
  [v26 setAllowedPressTypes:&unk_26E17EF00];
  v27 = [(DBNavigationWidgetViewController *)self view];
  [v27 addGestureRecognizer:v26];

  [(DBNavigationWidgetViewController *)self setSelectTapGestureRecognizer:v26];
  if ([(DBNavigationWidgetViewController *)self isEnabled])
  {
    v28 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];

    if (v28)
    {
      v29 = +[DBApplicationController sharedInstance];
      v30 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
      v31 = [v29 applicationWithBundleIdentifier:v30];

      [(DBNavigationWidgetViewController *)self _addWidgetSceneViewControllerForApplication:v31];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DBNavigationWidgetViewController;
  [(DBNavigationWidgetViewController *)&v8 viewWillAppear:a3];
  uint64_t v4 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  if (!v4) {
    goto LABEL_5;
  }
  double v5 = (void *)v4;
  double v6 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  if ([v6 sceneContentState] == 2)
  {

    return;
  }
  double v7 = [(DBNavigationWidgetViewController *)self loadingView];

  if (!v7) {
LABEL_5:
  }
    [(DBNavigationWidgetViewController *)self prepareLoadingViewAnimated:0];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)DBNavigationWidgetViewController;
  [(DBNavigationWidgetViewController *)&v10 viewDidLayoutSubviews];
  id v3 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] viewDidLayoutSubviews", buf, 0xCu);
  }
  double v6 = [(DBNavigationWidgetViewController *)self pendingWidgetResizeFenceHandle];
  double v7 = [(DBNavigationWidgetViewController *)self pendingWidgetResizeAnimationSettings];
  [(DBNavigationWidgetViewController *)self setPendingWidgetResizeFenceHandle:0];
  [(DBNavigationWidgetViewController *)self setPendingWidgetResizeAnimationSettings:0];
  objc_super v8 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  id v9 = [(DBNavigationWidgetViewController *)self view];
  [v9 frame];
  objc_msgSend(v8, "updateSceneFrame:animationSettings:fenceHandle:", v7, v6);
}

- (id)preferredFocusEnvironments
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(DBNavigationWidgetViewController *)self focusableItemViews];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    double v6 = [(DBNavigationWidgetViewController *)self focusableItemViews];
    [v3 addObjectsFromArray:v6];
  }
  [v3 addObject:self];
  return v3;
}

- (BOOL)entireWidgetFocusable
{
  v2 = [(DBNavigationWidgetViewController *)self focusableItemViews];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)linearFocusItems
{
  v8[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(DBNavigationWidgetViewController *)self focusableItemViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(DBNavigationWidgetViewController *)self focusableItemViews];
  }
  else
  {
    double v6 = [(DBNavigationWidgetViewController *)self view];
    v8[0] = v6;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  return v5;
}

- (void)updateAppearanceForWallpaper
{
  v11.receiver = self;
  v11.super_class = (Class)DBNavigationWidgetViewController;
  [(DBWidgetViewController *)&v11 updateAppearanceForWallpaper];
  BOOL v3 = [(DBWidgetViewController *)self environment];
  uint64_t v4 = [v3 environmentConfiguration];
  uint64_t v5 = [v4 wallpaperPreferences];
  double v6 = [v5 currentWallpaper];

  double v7 = [v6 traits];
  uint64_t v8 = [v7 supportsDashboardPlatterMaterials];

  id v9 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
  objc_super v10 = [v9 remoteObjectProxy];
  [v10 hostSetUseSystemPrimaryFocusColor:v8];
}

- (void)setWantsLargeSize:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DBWidgetViewController *)self wantsLargeSize] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)DBNavigationWidgetViewController;
    [(DBWidgetViewController *)&v6 setWantsLargeSize:v3];
    uint64_t v5 = [(DBNavigationWidgetViewController *)self widgetSizeManager];
    [v5 requestSizeChange];
  }
}

- (void)invalidate
{
  [(DBNavigationWidgetViewController *)self setInvalidated:1];
  BOOL v3 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  [v3 invalidate];

  uint64_t v4 = [(DBNavigationWidgetViewController *)self widgetWindowServiceListener];
  [v4 invalidate];

  [(DBNavigationWidgetViewController *)self setWidgetWindowServiceListener:0];
}

- (void)updateContextId:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    objc_super v11 = v7;
    __int16 v12 = 1024;
    unsigned int v13 = a3;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_INFO, "[%{public}@ Context id updated: %x", buf, 0x12u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __52__DBNavigationWidgetViewController_updateContextId___block_invoke;
  v8[3] = &unk_2649B5770;
  v8[4] = self;
  unsigned int v9 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __52__DBNavigationWidgetViewController_updateContextId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWidgetContextId:*(unsigned int *)(a1 + 40)];
}

- (void)clientSetFocusableItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke;
  v6[3] = &unk_2649B3D30;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = [*(id *)(a1 + 32) targetBundleIdentifier];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v16 = v4;
    __int16 v17 = 2114;
    uint64_t v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] New focusable items for client: %{public}@, items: %{public}@", buf, 0x20u);
  }
  id v7 = [*(id *)(a1 + 32) focusableItemViews];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_15];

  [*(id *)(a1 + 32) setFocusableItemViews:0];
  uint64_t v8 = [*(id *)(a1 + 40) count];
  unsigned int v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [v9 _setTouchActionDisabled:1 forRequester:@"FocusItems"];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke_2;
    v14[3] = &unk_2649B57B8;
    objc_super v10 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    objc_super v11 = objc_msgSend(v10, "bs_map:", v14);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke_3;
    v13[3] = &unk_2649B57E0;
    v13[4] = *(void *)(a1 + 32);
    [v11 enumerateObjectsUsingBlock:v13];
    [*(id *)(a1 + 32) setFocusableItemViews:v11];
  }
  else
  {
    [v9 _setTouchActionDisabled:0 forRequester:@"FocusItems"];
  }
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

uint64_t __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke_162(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

DBWidgetFocusableView *__60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(DBWidgetFocusableView);
  [(DBWidgetFocusableView *)v4 setFocusableItem:v3];
  [(DBWidgetFocusableView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 frameInWindow];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[DBWidgetFocusableView setFrame:](v4, "setFrame:", v6, v8, v10, v12);
  [(DBWidgetFocusableView *)v4 setDelegate:*(void *)(a1 + 32)];
  return v4;
}

void __60__DBNavigationWidgetViewController_clientSetFocusableItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contentView];
  [v4 addSubview:v3];
}

- (void)clientSetWantsLargeSize:(BOOL)a3 fenceHandle:(id)a4 animationSettings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__DBNavigationWidgetViewController_clientSetWantsLargeSize_fenceHandle_animationSettings___block_invoke;
  v12[3] = &unk_2649B5808;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a3;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __90__DBNavigationWidgetViewController_clientSetWantsLargeSize_fenceHandle_animationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingWidgetResizeFenceHandle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPendingWidgetResizeAnimationSettings:*(void *)(a1 + 48)];
  [MEMORY[0x263F82E90] _synchronizeDrawingWithFence:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__DBNavigationWidgetViewController_clientSetWantsLargeSize_fenceHandle_animationSettings___block_invoke_2;
  v4[3] = &unk_2649B4110;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 56);
  return [MEMORY[0x263F29D20] animateWithSettings:v2 actions:v4];
}

uint64_t __90__DBNavigationWidgetViewController_clientSetWantsLargeSize_fenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsLargeSize:*(unsigned __int8 *)(a1 + 40)];
}

- (void)clientSetContentReady
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DBNavigationWidgetViewController_clientSetContentReady__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__DBNavigationWidgetViewController_clientSetContentReady__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProxySceneContentReady:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _animateLoadingViewRemovalIfNecessary];
}

- (void)focusableItem:(id)a3 didChangePressed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
  double v7 = [v8 remoteObjectProxy];
  [v7 hostFocusableItem:v6 pressed:v4];
}

- (void)focusableItem:(id)a3 didChangeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
  double v7 = [v8 remoteObjectProxy];
  [v7 hostFocusableItem:v6 focused:v4];
}

- (void)selectedFocusableItem:(id)a3
{
  id v4 = a3;
  id v6 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
  char v5 = [v6 remoteObjectProxy];
  [v5 hostSelectedFocusableItem:v4];
}

- (void)widgetSceneHostViewController:(id)a3 sceneContentStateDidUpdate:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = DBLogForCategory(2uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v8)
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v30 = 138543362;
      v31 = v10;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Widget scene content ready", (uint8_t *)&v30, 0xCu);
    }
    [(DBNavigationWidgetViewController *)self _animateLoadingViewRemovalIfNecessary];
  }
  else
  {
    if (v8)
    {
      id v11 = (objc_class *)objc_opt_class();
      double v12 = NSStringFromClass(v11);
      int v30 = 138543362;
      v31 = v12;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Widget scene content not ready", (uint8_t *)&v30, 0xCu);
    }
    id v13 = [(DBNavigationWidgetViewController *)self loadingView];

    if (!v13)
    {
      id v14 = DBLogForCategory(2uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        int v30 = 138543362;
        v31 = v16;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Taking snapshot", (uint8_t *)&v30, 0xCu);
      }
      __int16 v17 = [(DBWidgetViewController *)self contentView];
      uint64_t v18 = [v17 snapshotViewAfterScreenUpdates:0];

      __int16 v19 = [(DBWidgetViewController *)self contentView];
      [v19 addSubview:v18];

      [(DBNavigationWidgetViewController *)self replaceLoadingViewWithView:v18];
      if ([(DBNavigationWidgetViewController *)self debugSnapshotLabelEnabled])
      {
        uint64_t v20 = DBLogForCategory(2uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = (objc_class *)objc_opt_class();
          __int16 v22 = NSStringFromClass(v21);
          int v30 = 138543362;
          v31 = v22;
          _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Displaying snapshot debug label", (uint8_t *)&v30, 0xCu);
        }
        id v23 = objc_alloc_init(MEMORY[0x263F828E0]);
        [v23 setText:@"Snapshot placeholder..."];
        uint64_t v24 = [MEMORY[0x263F825C8] redColor];
        [v23 setTextColor:v24];

        v25 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [v23 setFont:v25];

        [v23 sizeToFit];
        v26 = [(DBNavigationWidgetViewController *)self loadingView];
        [v26 addSubview:v23];
      }
      v27 = DBLogForCategory(2uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        int v30 = 138543618;
        v31 = v29;
        __int16 v32 = 2112;
        v33 = v18;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using snapshot view: %@", (uint8_t *)&v30, 0x16u);
      }
    }
  }
}

- (void)widgetSceneHostViewControllerSceneWillInvalidate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [a3 application];
  char v5 = [v4 bundleIdentifier];
  id v6 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
  int v7 = [v5 isEqualToString:v6];

  BOOL v8 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = NSStringFromBOOL();
    int v16 = 138543618;
    __int16 v17 = v10;
    __int16 v18 = 2114;
    __int16 v19 = v11;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Widget scene will invalidate, same target: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  [(DBNavigationWidgetViewController *)self setProxySceneContentReady:0];
  double v12 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  id v13 = [v12 view];
  [v13 setAlpha:0.0];

  [(DBNavigationWidgetViewController *)self clientSetFocusableItems:MEMORY[0x263EFFA68]];
  if (![(DBNavigationWidgetViewController *)self isInvalidated] && ((v7 ^ 1) & 1) == 0)
  {
    id v14 = [(DBNavigationWidgetViewController *)self loadingView];

    if (!v14)
    {
      BOOL v15 = [(DBNavigationWidgetViewController *)self view];
      -[DBNavigationWidgetViewController prepareLoadingViewAnimated:](self, "prepareLoadingViewAnimated:", [v15 isHidden] ^ 1);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];

  if (v6)
  {
    int v7 = [(DBNavigationWidgetViewController *)self widgetWindowServiceConnection];
    [v7 invalidate];

    [(DBNavigationWidgetViewController *)self setWidgetWindowServiceConnection:0];
  }
  BOOL v8 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v10;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Incoming connection for widget window service", buf, 0xCu);
  }
  id v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1C4C38];
  double v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v11 setClasses:v14 forSelector:sel_clientSetFocusableItems_ argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v11];
  [v5 setExportedObject:self];
  BOOL v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E239B78];
  int v16 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  __int16 v18 = [v16 setWithArray:v17];
  [v15 setClasses:v18 forSelector:sel_hostSetWidgetSizes_ argumentIndex:0 ofReply:0];

  [v5 setRemoteObjectInterface:v15];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke;
  v21[3] = &unk_2649B3E90;
  v21[4] = self;
  [v5 setInterruptionHandler:v21];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_244;
  v20[3] = &unk_2649B3E90;
  v20[4] = self;
  [v5 setInvalidationHandler:v20];
  [v5 resume];
  [(DBNavigationWidgetViewController *)self setWidgetWindowServiceConnection:v5];

  [(DBNavigationWidgetViewController *)self connectionReady];
  return 1;
}

void __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_244()
{
  v0 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_244_cold_1();
  }
}

- (void)_addWidgetSceneViewControllerForApplication:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(DBNavigationWidgetViewController *)self isInvalidated])
  {
    id v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      int v7 = NSStringFromClass(v6);
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Widget is invalidated, not creating widget scene.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v5 = [v4 appPolicy];
    if ([v5 launchUsingTemplateUI])
    {
      BOOL v8 = +[DBApplicationController sharedInstance];
      id v9 = [v8 templateUIHostApplication];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [DBWidgetSceneHostViewController alloc];
    id v11 = [(DBWidgetViewController *)self environment];
    double v12 = [(DBWidgetSceneHostViewController *)v10 initWithApplication:v4 proxyApplication:v9 environment:v11];

    [(DBNavigationWidgetViewController *)self _installWidgetSceneViewController:v12];
  }
}

- (void)_installWidgetSceneViewController:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(DBNavigationWidgetViewController *)self isEnabled])
  {
    v37 = DBLogForCategory(2uLL);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    *(_DWORD *)buf = 138543362;
    v58 = v39;
    v40 = "[%{public}@] Widget is not enabled, not creating widget scene.";
LABEL_10:
    _os_log_impl(&dword_22D6F0000, v37, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);

    goto LABEL_11;
  }
  if (([(DBNavigationWidgetViewController *)self isViewLoaded] & 1) == 0)
  {
    v37 = DBLogForCategory(2uLL);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v41 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v41);
    *(_DWORD *)buf = 138543362;
    v58 = v39;
    v40 = "[%{public}@] Widget view is not loaded, not creating widget scene.";
    goto LABEL_10;
  }
  [v4 setDelegate:self];
  id v5 = [(DBNavigationWidgetViewController *)self widgetWindowServiceListener];
  id v6 = [v5 endpoint];
  int v7 = [v6 _endpoint];
  [v4 setWidgetWindowServiceEndpoint:v7];

  objc_msgSend(v4, "setWidgetStyle:", -[DBNavigationWidgetViewController widgetStyle](self, "widgetStyle"));
  BOOL v8 = [(DBNavigationWidgetViewController *)self sceneIdentifierSuffix];
  [v4 setSceneIdentifierSuffix:v8];

  [(DBNavigationWidgetViewController *)self addChildViewController:v4];
  id v9 = [(DBWidgetViewController *)self contentView];
  id v10 = [v4 view];
  [v9 insertSubview:v10 atIndex:0];

  [v4 didMoveToParentViewController:self];
  id v11 = [v4 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v12 = [v4 view];
  [v12 setAlpha:0.0];

  int v13 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    int v16 = [(DBWidgetViewController *)self contentView];
    [v16 bounds];
    __int16 v17 = NSStringFromCGRect(v62);
    *(_DWORD *)buf = 138543618;
    v58 = v15;
    __int16 v59 = 2114;
    v60 = v17;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding widget scene view controller, frame: %{public}@", buf, 0x16u);
  }
  __int16 v18 = [(DBWidgetViewController *)self contentView];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [v4 view];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  v46 = (void *)MEMORY[0x263F08938];
  v55 = [v4 view];
  v53 = [v55 leadingAnchor];
  v54 = [(DBWidgetViewController *)self contentView];
  objc_super v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v56[0] = v51;
  v50 = [v4 view];
  v48 = [v50 trailingAnchor];
  v49 = [(DBWidgetViewController *)self contentView];
  v47 = [v49 trailingAnchor];
  v45 = [v48 constraintEqualToAnchor:v47];
  v56[1] = v45;
  v44 = [v4 view];
  v42 = [v44 topAnchor];
  v43 = [(DBWidgetViewController *)self contentView];
  v28 = [v43 topAnchor];
  v29 = [v42 constraintEqualToAnchor:v28];
  v56[2] = v29;
  int v30 = [v4 view];
  v31 = [v30 bottomAnchor];
  __int16 v32 = [(DBWidgetViewController *)self contentView];
  v33 = [v32 bottomAnchor];
  uint64_t v34 = [v31 constraintEqualToAnchor:v33];
  v56[3] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
  [v46 activateConstraints:v35];

  v36 = [(DBWidgetViewController *)self contentView];
  [v36 layoutIfNeeded];

  [(DBNavigationWidgetViewController *)self setWidgetSceneViewController:v4];
  v37 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
  [v37 initializeSceneForeground:[(DBNavigationWidgetViewController *)self isForeground] active:[(DBNavigationWidgetViewController *)self isActive]];
LABEL_11:
}

- (void)_removeWidgetSceneViewController
{
  id v3 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];

  if (v3)
  {
    id v4 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v4 invalidate];

    id v5 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    int v7 = [v6 view];
    [v7 removeFromSuperview];

    BOOL v8 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    [v8 removeFromParentViewController];

    [(DBNavigationWidgetViewController *)self setWidgetSceneViewController:0];
  }
}

- (void)_handleTapGesture:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Scene widget selected", (uint8_t *)&v14, 0xCu);
  }
  int v7 = +[DBApplicationController sharedInstance];
  BOOL v8 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
  id v9 = [v7 applicationWithBundleIdentifier:v8];

  id v10 = objc_alloc_init(DBActivationSettings);
  [(DBActivationSettings *)v10 setLaunchSource:5];
  id v11 = +[DBApplicationLaunchInfo launchInfoForApplication:v9 withActivationSettings:v10];
  double v12 = [(DBWidgetViewController *)self environment];
  int v13 = +[DBEvent eventWithType:4 context:v11];
  [v12 handleEvent:v13];
}

- (void)_animateLoadingViewRemovalIfNecessary
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(DBNavigationWidgetViewController *)self loadingView];

  if (v3)
  {
    id v4 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    uint64_t v5 = [v4 sceneContentState];

    id v6 = [(DBNavigationWidgetViewController *)self widgetSceneViewController];
    int v7 = [v6 proxyApplication];

    if (v5 == 2 && v7)
    {
      if (![(DBNavigationWidgetViewController *)self proxySceneContentReady]) {
        goto LABEL_5;
      }
    }
    else if (v5 != 2)
    {
LABEL_5:
      BOOL v8 = DBLogForCategory(2uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = NSStringFromBOOL();
        double v12 = NSStringFromBOOL();
        [(DBNavigationWidgetViewController *)self proxySceneContentReady];
        int v13 = NSStringFromBOOL();
        int v18 = 138544130;
        double v19 = v10;
        __int16 v20 = 2114;
        double v21 = v11;
        __int16 v22 = 2114;
        double v23 = v12;
        __int16 v24 = 2114;
        double v25 = v13;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading view present but scene not ready yet. Content state ready: %{public}@, proxied: %{public}@, proxy scene content ready: %{public}@", (uint8_t *)&v18, 0x2Au);
      }
LABEL_11:

      return;
    }
    int v14 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      __int16 v17 = [(DBNavigationWidgetViewController *)self loadingView];
      int v18 = 138543618;
      double v19 = v16;
      __int16 v20 = 2112;
      double v21 = v17;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading view present, will attempt animating removal: %@", (uint8_t *)&v18, 0x16u);
    }
    BOOL v8 = [(DBNavigationWidgetViewController *)self animationManager];
    [v8 runAnimationIfPossible:@"DBWidgetSceneSplashScreenAnimationIdentifier" client:self];
    goto LABEL_11;
  }
}

- (void)_setTouchActionDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (v4)
  {
    if (!self->_touchActionDisabledRequesters)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      touchActionDisabledRequesters = self->_touchActionDisabledRequesters;
      self->_touchActionDisabledRequesters = v6;
    }
    BOOL v8 = [(DBNavigationWidgetViewController *)self touchActionDisabledRequesters];
    [v8 addObject:v9];
  }
  else
  {
    BOOL v8 = [(DBNavigationWidgetViewController *)self touchActionDisabledRequesters];
    [v8 removeObject:v9];
  }

  [(DBNavigationWidgetViewController *)self _updateTouchActionDisabled];
}

- (void)_updateTouchActionDisabled
{
  id v3 = [(DBNavigationWidgetViewController *)self touchActionDisabledRequesters];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(DBNavigationWidgetViewController *)self touchTapGestureRecognizer];
  id v6 = v5;
  if (v4)
  {
    [v5 setEnabled:0];

    id v10 = [(DBNavigationWidgetViewController *)self touchActionView];
    int v7 = [v10 layer];
    BOOL v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    [v5 setEnabled:1];

    id v10 = [(DBNavigationWidgetViewController *)self touchActionView];
    int v7 = [v10 layer];
    BOOL v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHitTestsAsOpaque:v9];
}

- (void)setWidgetContextId:(unsigned int)a3
{
  if (self->_widgetContextId != a3)
  {
    self->_uint64_t widgetContextId = a3;
    uint64_t v4 = [(DBNavigationWidgetViewController *)self touchDeliveryPolicyAssertion];
    [v4 invalidate];

    [(DBNavigationWidgetViewController *)self setTouchDeliveryPolicyAssertion:0];
    id v5 = objc_alloc_init(MEMORY[0x263F298B8]);
    [(DBNavigationWidgetViewController *)self setTouchDeliveryPolicyAssertion:v5];

    id v6 = (void *)MEMORY[0x263F298B0];
    uint64_t widgetContextId = self->_widgetContextId;
    BOOL v8 = [(DBNavigationWidgetViewController *)self view];
    uint64_t v9 = [v8 window];
    id v10 = objc_msgSend(v6, "policyRequiringSharingOfTouchesDeliveredToChildContextId:withHostContextId:", widgetContextId, objc_msgSend(v9, "_contextId"));

    id v11 = [(DBNavigationWidgetViewController *)self touchDeliveryPolicyAssertion];
    double v12 = [v11 endpoint];
    [v10 setAssertionEndpoint:v12];

    int v13 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    int v14 = v13;
    if (v13) {
      objc_msgSend(v13, "ipc_addPolicy:", v10);
    }
  }
}

void __55__DBNavigationWidgetViewController_setWidgetContextId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__DBNavigationWidgetViewController_setWidgetContextId___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBNavigationWidgetViewController;
  id v6 = a4;
  [(DBNavigationWidgetViewController *)&v9 touchesBegan:a3 withEvent:v6];
  objc_msgSend(v6, "_initialTouchTimestamp", v9.receiver, v9.super_class);
  double v8 = v7;

  [(DBNavigationWidgetViewController *)self setInitialTouchTimestamp:v8];
}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  id v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }

  double v7 = [(DBNavigationWidgetViewController *)self view];
  int v8 = [v9 containsView:v7];

  if (v8) {
    [(DBNavigationWidgetViewController *)self _beginTouchCancelation];
  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  id v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }

  double v7 = [(DBNavigationWidgetViewController *)self view];
  int v8 = [v9 containsView:v7];

  if (v8) {
    [(DBNavigationWidgetViewController *)self _endTouchCancelation];
  }
}

- (void)_beginTouchCancelation
{
  id v3 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  if (v3)
  {
    id v11 = v3;
    [(DBNavigationWidgetViewController *)self initialTouchTimestamp];
    id v3 = v11;
    if (v4 > 0.0)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F298B8]);
      id v6 = (void *)MEMORY[0x263F298B0];
      uint64_t v7 = [(DBNavigationWidgetViewController *)self widgetContextId];
      [(DBNavigationWidgetViewController *)self initialTouchTimestamp];
      int v8 = objc_msgSend(v6, "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v7);
      id v9 = [v5 endpoint];
      [v8 setAssertionEndpoint:v9];

      objc_msgSend(v11, "ipc_addPolicy:", v8);
      cancelTouchesInIsolatedViewAssertion = self->_cancelTouchesInIsolatedViewAssertion;
      self->_cancelTouchesInIsolatedViewAssertion = (BKSTouchDeliveryPolicyAssertion *)v5;

      id v3 = v11;
    }
  }
}

void __58__DBNavigationWidgetViewController__beginTouchCancelation__block_invoke()
{
  v0 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __58__DBNavigationWidgetViewController__beginTouchCancelation__block_invoke_cold_1(v0);
  }
}

- (void)_endTouchCancelation
{
  id v3 = [(DBNavigationWidgetViewController *)self cancelTouchesInIsolatedViewAssertion];
  [v3 invalidate];

  cancelTouchesInIsolatedViewAssertion = self->_cancelTouchesInIsolatedViewAssertion;
  self->_cancelTouchesInIsolatedViewAssertion = 0;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (unint64_t)widgetStyle
{
  return self->_widgetStyle;
}

- (NSString)sceneIdentifierSuffix
{
  return self->_sceneIdentifierSuffix;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSArray)availableWidgetSizes
{
  return self->_availableWidgetSizes;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (UIView)touchActionView
{
  return self->_touchActionView;
}

- (void)setTouchActionView:(id)a3
{
}

- (DBWidgetSceneHostViewController)widgetSceneViewController
{
  return self->_widgetSceneViewController;
}

- (void)setWidgetSceneViewController:(id)a3
{
}

- (NSArray)focusableItemViews
{
  return self->_focusableItemViews;
}

- (void)setFocusableItemViews:(id)a3
{
}

- (DBTodayViewSynchronizedAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
}

- (DBWidgetSizeManaging)widgetSizeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetSizeManager);
  return (DBWidgetSizeManaging *)WeakRetained;
}

- (void)setWidgetSizeManager:(id)a3
{
}

- (BKSAnimationFenceHandle)pendingWidgetResizeFenceHandle
{
  return self->_pendingWidgetResizeFenceHandle;
}

- (void)setPendingWidgetResizeFenceHandle:(id)a3
{
}

- (BSAnimationSettings)pendingWidgetResizeAnimationSettings
{
  return self->_pendingWidgetResizeAnimationSettings;
}

- (void)setPendingWidgetResizeAnimationSettings:(id)a3
{
}

- (NSXPCListener)widgetWindowServiceListener
{
  return self->_widgetWindowServiceListener;
}

- (void)setWidgetWindowServiceListener:(id)a3
{
}

- (NSXPCConnection)widgetWindowServiceConnection
{
  return self->_widgetWindowServiceConnection;
}

- (void)setWidgetWindowServiceConnection:(id)a3
{
}

- (NSMutableSet)touchActionDisabledRequesters
{
  return self->_touchActionDisabledRequesters;
}

- (void)setTouchActionDisabledRequesters:(id)a3
{
}

- (UITapGestureRecognizer)touchTapGestureRecognizer
{
  return self->_touchTapGestureRecognizer;
}

- (void)setTouchTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)selectTapGestureRecognizer
{
  return self->_selectTapGestureRecognizer;
}

- (void)setSelectTapGestureRecognizer:(id)a3
{
}

- (BKSTouchDeliveryPolicyAssertion)touchDeliveryPolicyAssertion
{
  return self->_touchDeliveryPolicyAssertion;
}

- (void)setTouchDeliveryPolicyAssertion:(id)a3
{
}

- (BKSTouchDeliveryPolicyAssertion)cancelTouchesInIsolatedViewAssertion
{
  return self->_cancelTouchesInIsolatedViewAssertion;
}

- (void)setCancelTouchesInIsolatedViewAssertion:(id)a3
{
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

- (void)setInitialTouchTimestamp:(double)a3
{
  self->_initialTouchTimestamp = a3;
}

- (unsigned)widgetContextId
{
  return self->_widgetContextId;
}

- (BOOL)proxySceneContentReady
{
  return self->_proxySceneContentReady;
}

- (void)setProxySceneContentReady:(BOOL)a3
{
  self->_proxySceneContentReady = a3;
}

- (BOOL)debugSnapshotLabelEnabled
{
  return self->_debugSnapshotLabelEnabled;
}

- (void)setDebugSnapshotLabelEnabled:(BOOL)a3
{
  self->_debugSnapshotLabelEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTouchesInIsolatedViewAssertion, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_selectTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchActionDisabledRequesters, 0);
  objc_storeStrong((id *)&self->_widgetWindowServiceConnection, 0);
  objc_storeStrong((id *)&self->_widgetWindowServiceListener, 0);
  objc_storeStrong((id *)&self->_pendingWidgetResizeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pendingWidgetResizeFenceHandle, 0);
  objc_destroyWeak((id *)&self->_widgetSizeManager);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_focusableItemViews, 0);
  objc_storeStrong((id *)&self->_widgetSceneViewController, 0);
  objc_storeStrong((id *)&self->_touchActionView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_availableWidgetSizes, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierSuffix, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
}

void __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "[%{public}@] Widget window service interrupted", v4, v5, v6, v7, 2u);
}

void __71__DBNavigationWidgetViewController_listener_shouldAcceptNewConnection___block_invoke_244_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "[%{public}@] Widget window service invalidated", v4, v5, v6, v7, 2u);
}

void __55__DBNavigationWidgetViewController_setWidgetContextId___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  int v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to retrieve touch policy server (%@)", (uint8_t *)&v7, 0x16u);
}

void __58__DBNavigationWidgetViewController__beginTouchCancelation__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Unable to retrieve touch policy server", v1, 2u);
}

@end