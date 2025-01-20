@interface GKExtensionRootViewController
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)adjustTopConstraint;
- (BOOL)alwaysShowDoneButton;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasInitialData;
- (BOOL)requiresNavigationController;
- (BOOL)shouldAddScrollToTopView;
- (GKExtensionRootViewController)initWithCoder:(id)a3;
- (GKExtensionRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSLayoutConstraint)effectBottomConstraint;
- (NSLayoutConstraint)effectTopConstraint;
- (UIEdgeInsets)_gkAdditionalSafeAreaInset;
- (UINavigationController)navigationController;
- (UIViewController)contentViewController;
- (UIVisualEffectView)effectView;
- (double)_statusBarHeightForCurrentInterfaceOrientation;
- (double)statusBarHeight;
- (id)daemonProxy;
- (id)hostObjectProxy;
- (int)hostPID;
- (int64_t)hostUserInterfaceIdiom;
- (int64_t)preferredStatusBarStyle;
- (void)addDoneButtonToViewController:(id)a3;
- (void)addVisualEffectViewForView:(id)a3;
- (void)configureContentViewController;
- (void)constructContentViewController;
- (void)extensionIsCanceling;
- (void)extensionIsFinishing;
- (void)logOnceGameControllerUsedInGameLayer;
- (void)messageFromClient:(id)a3;
- (void)messageFromExtension:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)scrollToTopPressed:(id)a3;
- (void)sendMessageToClient:(id)a3;
- (void)setAdjustTopConstraint:(BOOL)a3;
- (void)setAlwaysShowDoneButton:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setEffectBottomConstraint:(id)a3;
- (void)setEffectTopConstraint:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHasInitialData:(BOOL)a3;
- (void)setHostPID:(int)a3;
- (void)setHostUserInterfaceIdiom:(int64_t)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setNavigationController:(id)a3;
- (void)setRequiresNavigationController:(BOOL)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)setToDarkBackground;
- (void)setToLightBackground;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setup;
- (void)setupVisualEffects;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateScrollToTopViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKExtensionRootViewController

- (GKExtensionRootViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKExtensionRootViewController;
  v3 = [(GKExtensionRootViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GKExtensionRootViewController *)v3 setup];
  }
  return v4;
}

- (GKExtensionRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRootViewController;
  v4 = [(GKExtensionRootViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(GKExtensionRootViewController *)v4 setup];
  }
  return v5;
}

- (void)setup
{
  GKUISetRemote();
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    [(GKExtensionRootViewController *)self setModalPresentationStyle:16];
    v5 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v5 formSheetSize];
    -[GKExtensionRootViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    *MEMORY[0x1E4F63A38] = 0;
  }
  else
  {
    [(GKExtensionRootViewController *)self setModalPresentationStyle:17];
  }
  self->_alwaysShowDoneButton = 1;
  self->_adjustTopConstraint = 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v4 viewDidLoad];
  [(GKExtensionRootViewController *)self setOverrideUserInterfaceStyle:2];
  if ([(GKExtensionRootViewController *)self _useBackdropViewForWindowBackground])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    [(GKExtensionRootViewController *)self setEffectView:v3];

    [(GKExtensionRootViewController *)self setupVisualEffects];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)setupVisualEffects
{
  id v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  objc_super v4 = [(GKExtensionRootViewController *)self effectView];
  [v4 setBackgroundEffects:v3];

  id v5 = [(GKExtensionRootViewController *)self effectView];
  [v5 _setGroupName:@"gameLayerGroup"];
}

- (id)daemonProxy
{
  return (id)[MEMORY[0x1E4F636C8] daemonProxy];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKExtensionRootViewController *)self daemonProxy];
  [v5 setDataUpdateDelegate:self];

  v28.receiver = self;
  v28.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v28 viewWillAppear:v3];
  if ([(GKExtensionRootViewController *)self hasInitialData])
  {
    objc_super v6 = [(GKExtensionRootViewController *)self contentViewController];

    if (!v6) {
      [(GKExtensionRootViewController *)self constructContentViewController];
    }
  }
  if ([(GKExtensionRootViewController *)self _useBackdropViewForWindowBackground])
  {
    [(GKExtensionRootViewController *)self setupVisualEffects];
    objc_super v7 = [(GKExtensionRootViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(GKExtensionRootViewController *)self effectView];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    v17 = [(GKExtensionRootViewController *)self effectView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(GKExtensionRootViewController *)self parentViewController];
    v19 = [v18 view];
    v20 = [v19 window];
    v21 = [v20 rootViewController];
    v22 = [v21 view];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      v25 = [(GKExtensionRootViewController *)self parentViewController];
      v26 = [v25 view];
      id v24 = [v26 window];
    }
    [(GKExtensionRootViewController *)self addVisualEffectViewForView:v24];
  }
  if ([(GKExtensionRootViewController *)self hasInitialData])
  {
    v27 = [(GKExtensionRootViewController *)self contentViewController];

    if (!v27) {
      [(GKExtensionRootViewController *)self constructContentViewController];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v23 viewWillLayoutSubviews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = [(GKExtensionRootViewController *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        double v9 = [(GKExtensionRootViewController *)self view];
        [v9 bounds];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        v18 = [v8 view];
        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v11 viewDidAppear:a3];
  uint64_t v4 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F63880];
  uint64_t v7 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "GKExtensionRootViewController viewDidAppear called", v10, 2u);
  }
  [(GKExtensionRootViewController *)self becomeFirstResponder];
  if (!*v4) {
    id v8 = (id)GKOSLoggers();
  }
  double v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "ControllerSupport: Focus system activated by calling becomeFirstResponder", v10, 2u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)addVisualEffectViewForView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewWithTag:678];
  [v5 removeFromSuperview];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  uint64_t v6 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v8 setBackgroundEffects:v6];

  uint64_t v7 = [(GKExtensionRootViewController *)self effectView];
  [v7 _setGroupName:@"gameLayerGroup"];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setTag:678];
  [v4 insertSubview:v8 atIndex:0];
  [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v8 containedWithinParentView:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v7 viewDidDisappear:a3];
  [(GKExtensionRootViewController *)self setViewControllers:MEMORY[0x1E4F1CBF0] animated:0];
  [(GKExtensionRootViewController *)self setContentViewController:0];
  id v4 = [(GKExtensionRootViewController *)self daemonProxy];
  id v5 = [v4 dataUpdateDelegate];

  if (v5 == self)
  {
    uint64_t v6 = [(GKExtensionRootViewController *)self daemonProxy];
    [v6 setDataUpdateDelegate:0];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  if ([(GKExtensionRootViewController *)self requiresNavigationController])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__GKExtensionRootViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v7[3] = &unk_1E5F63B68;
    v7[4] = self;
    [v6 animateAlongsideTransition:v7 completion:&__block_literal_global_7];
  }
}

void __91__GKExtensionRootViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double Height = 0.0;
  if ([*(id *)(a1 + 32) adjustTopConstraint])
  {
    BOOL v3 = [*(id *)(a1 + 32) navigationController];
    id v4 = [v3 navigationBar];
    [v4 bounds];
    double Height = CGRectGetHeight(v7);
  }
  id v5 = [*(id *)(a1 + 32) effectTopConstraint];
  [v5 setConstant:Height];
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 1;
}

- (void)constructContentViewController
{
  BOOL v3 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v4 = [v3 profileServicePrivate];

  [v4 startContactsIntegrationSyncWithOptions:2 completionHandler:&__block_literal_global_21];
  [(GKExtensionRootViewController *)self configureContentViewController];
}

void __63__GKExtensionRootViewController_constructContentViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = *MEMORY[0x1E4F63840];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63840], OS_LOG_TYPE_DEBUG)) {
    __63__GKExtensionRootViewController_constructContentViewController__block_invoke_cold_1((uint64_t)v2, v4);
  }
}

- (void)configureContentViewController
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(GKExtensionRootViewController *)self contentViewController];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      [(GKExtensionRootViewController *)self setModalPresentationStyle:16];
      id v6 = [MEMORY[0x1E4F63A10] sharedTheme];
      [v6 formSheetSize];
      -[GKExtensionRootViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
    else
    {
      [(GKExtensionRootViewController *)self setModalPresentationStyle:17];
    }
    CGRect v7 = [(GKExtensionRootViewController *)self view];
    [v7 setClipsToBounds:0];
    objc_super v8 = [MEMORY[0x1E4F639B0] sharedPalette];
    double v9 = [v8 systemInteractionColor];
    [v7 setTintColor:v9];

    if ([(GKExtensionRootViewController *)self alwaysShowDoneButton])
    {
      double v10 = [(GKExtensionRootViewController *)self contentViewController];
      [(GKExtensionRootViewController *)self addDoneButtonToViewController:v10];
    }
    if ([(GKExtensionRootViewController *)self requiresNavigationController])
    {
      objc_super v11 = [(GKExtensionRootViewController *)self navigationController];

      if (!v11)
      {
        double v12 = [(GKExtensionRootViewController *)self contentViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v14 = [(GKExtensionRootViewController *)self contentViewController];
          [(GKExtensionRootViewController *)self setNavigationController:v14];
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
          [(GKExtensionRootViewController *)self setNavigationController:v15];

          double v16 = [(GKExtensionRootViewController *)self navigationController];
          [v16 setDelegate:self];

          double v17 = [(GKExtensionRootViewController *)self navigationController];
          [v17 _setClipUnderlapWhileTransitioning:1];

          v18 = [(GKExtensionRootViewController *)self navigationController];
          [v18 _setPositionBarsExclusivelyWithSafeArea:1];

          long long v19 = [(GKExtensionRootViewController *)self navigationController];
          long long v20 = [v19 navigationBar];
          [v20 setBarStyle:0];

          long long v21 = [(GKExtensionRootViewController *)self navigationController];
          long long v22 = [v21 navigationBar];
          [v22 setTranslucent:1];

          objc_super v23 = [(GKExtensionRootViewController *)self navigationController];
          [v23 beginAppearanceTransition:1 animated:0];

          id v24 = [(GKExtensionRootViewController *)self navigationController];
          [(GKExtensionRootViewController *)self addChildViewController:v24];

          uint64_t v25 = [(GKExtensionRootViewController *)self view];
          v26 = [(GKExtensionRootViewController *)self navigationController];
          v27 = [v26 view];
          [v25 addSubview:v27];

          objc_super v28 = [(GKExtensionRootViewController *)self view];
          [v28 bounds];
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;
          v37 = [(GKExtensionRootViewController *)self navigationController];
          v38 = [v37 view];
          objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);

          double v14 = [(GKExtensionRootViewController *)self navigationController];
          [v14 endAppearanceTransition];
        }

        if ([(GKExtensionRootViewController *)self shouldAddScrollToTopView])
        {
          [(GKExtensionRootViewController *)self _gkAdditionalSafeAreaInset];
          double v40 = v39;
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;
          v47 = [(GKExtensionRootViewController *)self navigationController];
          objc_msgSend(v47, "setAdditionalSafeAreaInsets:", v40, v42, v44, v46);
        }
      }
    }
    v48 = [(GKExtensionRootViewController *)self contentViewController];
    v50[0] = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [(GKExtensionRootViewController *)self setViewControllers:v49 animated:0];
  }
}

- (void)addDoneButtonToViewController:(id)a3
{
  id v9 = a3;
  if (([v9 _gkExtensionWantsCustomRightBarButtonItemInViewService] & 1) == 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v5 = GKGameCenterUIFrameworkBundle();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    CGRect v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_donePressed_];
    objc_super v8 = [v9 navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
}

- (BOOL)shouldAddScrollToTopView
{
  [(GKExtensionRootViewController *)self statusBarHeight];
  return v2 == 0.0;
}

- (UIEdgeInsets)_gkAdditionalSafeAreaInset
{
  double v2 = 5.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if ([(GKExtensionRootViewController *)self alwaysShowDoneButton]) {
          [(GKExtensionRootViewController *)self addDoneButtonToViewController:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }
  if ([(GKExtensionRootViewController *)self requiresNavigationController])
  {
    id v12 = [(GKExtensionRootViewController *)self navigationController];
    [v12 setViewControllers:v6 animated:v4];
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          objc_msgSend(v17, "beginAppearanceTransition:animated:", 1, v4, (void)v35);
          if ([(GKExtensionRootViewController *)self shouldAddScrollToTopView])
          {
            [(GKExtensionRootViewController *)self _gkAdditionalSafeAreaInset];
            objc_msgSend(v17, "setAdditionalSafeAreaInsets:");
          }
          [(GKExtensionRootViewController *)self addChildViewController:v17];
          v18 = [(GKExtensionRootViewController *)self view];
          long long v19 = [v17 view];
          [v18 addSubview:v19];

          long long v20 = [(GKExtensionRootViewController *)self view];
          [v20 bounds];
          double v22 = v21;
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v29 = [v17 view];
          objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

          [v17 endAppearanceTransition];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v14);
    }
  }

  if ([(GKExtensionRootViewController *)self shouldAddScrollToTopView])
  {
    double v30 = [(GKExtensionRootViewController *)self view];
    double v31 = [v30 viewWithTag:8400];

    if (!v31)
    {
      double v32 = objc_opt_new();
      [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v32 setTag:8400];
      double v33 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_scrollToTopPressed_];
      [v33 setNumberOfTapsRequired:1];
      [v32 addGestureRecognizer:v33];
      double v34 = [(GKExtensionRootViewController *)self view];
      [v34 addSubview:v32];

      [(GKExtensionRootViewController *)self updateScrollToTopViewConstraints];
    }
  }
}

- (void)scrollToTopPressed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(GKExtensionRootViewController *)self requiresNavigationController])
  {
    BOOL v4 = [(GKExtensionRootViewController *)self navigationController];
    double v5 = [v4 topViewController];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(v5, "view", 0);
    uint64_t v7 = [v6 subviews];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            if ([v13 scrollsToTop])
            {
              [v13 adjustedContentInset];
              objc_msgSend(v13, "setContentOffset:animated:", 1, 0.0, -v14);
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)updateScrollToTopViewConstraints
{
  v27[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(GKExtensionRootViewController *)self view];
  BOOL v4 = [v3 viewWithTag:8400];

  if (v4)
  {
    [v4 _gkRemoveAllConstraints];
    double v5 = [(GKExtensionRootViewController *)self view];
    id v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7)
    {
      uint64_t v8 = 100;
    }
    else
    {
      uint64_t v9 = [(GKExtensionRootViewController *)self view];
      uint64_t v10 = [v9 traitCollection];
      if ([v10 verticalSizeClass] == 1) {
        uint64_t v8 = 150;
      }
      else {
        uint64_t v8 = 50;
      }
    }
    double v25 = objc_msgSend(v4, "leadingAnchor", MEMORY[0x1E4F28DC8]);
    double v26 = [(GKExtensionRootViewController *)self view];
    double v24 = [v26 leadingAnchor];
    double v23 = [v25 constraintEqualToAnchor:v24 constant:(double)v8];
    v27[0] = v23;
    double v21 = [v4 trailingAnchor];
    double v22 = [(GKExtensionRootViewController *)self view];
    uint64_t v11 = [v22 trailingAnchor];
    id v12 = [v21 constraintEqualToAnchor:v11 constant:(double)-v8];
    v27[1] = v12;
    id v13 = [v4 topAnchor];
    double v14 = [(GKExtensionRootViewController *)self view];
    long long v15 = [v14 topAnchor];
    long long v16 = [v13 constraintEqualToAnchor:v15];
    v27[2] = v16;
    long long v17 = [v4 heightAnchor];
    long long v18 = [v17 constraintEqualToConstant:20.0];
    v27[3] = v18;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v20 activateConstraints:v19];

    [v4 setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKExtensionRootViewController;
  [(GKExtensionRootViewController *)&v4 traitCollectionDidChange:a3];
  [(GKExtensionRootViewController *)self updateScrollToTopViewConstraints];
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  return self->_statusBarHeight;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  if ([(GKExtensionRootViewController *)self alwaysShowDoneButton]) {
    [(GKExtensionRootViewController *)self addDoneButtonToViewController:v6];
  }
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (-[GKExtensionRootViewController _gkShouldRefreshContentsForDataType:userInfo:](self, "_gkShouldRefreshContentsForDataType:userInfo:", v4))[(GKExtensionRootViewController *)self _gkRefreshContentsForDataType:v4 userInfo:v7]; {
  if (v4 == 16)
  }
  {
    id v6 = [MEMORY[0x1E4F63760] local];
    [v6 clearInMemoryCachedAvatars];
  }
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GKExtensionRootViewController *)self setRequiresNavigationController:1];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"StatusBarHeightKey"];
  [v8 floatValue];
  [(GKExtensionRootViewController *)self setStatusBarHeight:v9];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"HostPIDKey"];
  -[GKExtensionRootViewController setHostPID:](self, "setHostPID:", [v10 integerValue]);

  uint64_t v11 = [v7 objectForKeyedSubscript:@"CurrentGameKey"];
  id v12 = (void *)MEMORY[0x1E4F636F0];
  id v13 = [v11 internal];
  objc_msgSend(v12, "setCurrentGameFromInternal:serverEnvironment:", v13, objc_msgSend(v11, "environment"));

  double v14 = [MEMORY[0x1E4F63760] localPlayer];
  long long v15 = [v7 objectForKeyedSubscript:@"LocalPlayerKey"];
  [v14 updateFromLocalPlayer:v15];

  long long v16 = [v7 objectForKeyedSubscript:@"RTLKey"];
  char v17 = [v16 BOOLValue];
  *MEMORY[0x1E4F63A30] = v17;

  long long v18 = [v7 objectForKeyedSubscript:@"HostUserInterfaceIdiom"];

  -[GKExtensionRootViewController setHostUserInterfaceIdiom:](self, "setHostUserInterfaceIdiom:", [v18 integerValue]);
  [(GKExtensionRootViewController *)self hostUserInterfaceIdiom];
  GKSetHostUserInterfaceIdiom();
  long long v19 = [(GKExtensionRootViewController *)self daemonProxy];
  objc_msgSend(v19, "setHostPID:", -[GKExtensionRootViewController hostPID](self, "hostPID"));

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__GKExtensionRootViewController_setInitialState_withReply___block_invoke;
  v21[3] = &unk_1E5F63E30;
  v21[4] = self;
  id v22 = v6;
  id v20 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v21);
}

uint64_t __59__GKExtensionRootViewController_setInitialState_withReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasInitialData:1];
  double v2 = [*(id *)(a1 + 32) contentViewController];
  if (v2)
  {
  }
  else if ([*(id *)(a1 + 32) isViewLoaded])
  {
    [*(id *)(a1 + 32) constructContentViewController];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)messageFromClient:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v6 = GKExtensionProtocolSecureCodedClasses();
  id v13 = 0;
  id v7 = [v4 unarchivedObjectOfClasses:v6 fromData:v5 error:&v13];

  id v8 = v13;
  if (v8)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v9 = (id)GKOSLoggers();
    }
    uint64_t v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKExtensionRootViewController messageFromClient:]((uint64_t)v8, v10);
    }
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:@"MessageCommandKey"];
  uint64_t v12 = [v11 integerValue];

  switch(v12)
  {
    case 47:
      [(GKExtensionRootViewController *)self clientWillTerminate];
      break;
    case 4:
      [(GKExtensionRootViewController *)self clientDidCancel];
      break;
    case 3:
      [(GKExtensionRootViewController *)self clientDidFinish];
      break;
  }
}

- (id)hostObjectProxy
{
  uint64_t v4 = [(GKExtensionRootViewController *)self extensionContext];
  id v5 = [v4 _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_41];

  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"GKExtensionRootViewController.m" lineNumber:552 description:@"GKExtensionContext remote object proxy is nil!"];
  }

  return v6;
}

void __48__GKExtensionRootViewController_hostObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __48__GKExtensionRootViewController_hostObjectProxy__block_invoke_cold_1(v4, v2);
  }
}

- (void)sendMessageToClient:(id)a3
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v4 = [(GKExtensionRootViewController *)self hostObjectProxy];
  [v4 messageFromExtension:v5];
}

- (void)messageFromExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(GKExtensionRootViewController *)self hostObjectProxy];
  [v5 messageFromExtension:v4];
}

- (void)extensionIsCanceling
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0811D18;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionRootViewController *)self sendMessageToClient:v3];
}

- (void)extensionIsFinishing
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"MessageCommandKey";
  v5[0] = &unk_1F0811D30;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(GKExtensionRootViewController *)self sendMessageToClient:v3];
}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken != -1) {
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken, &__block_literal_global_55);
  }
}

void __69__GKExtensionRootViewController_logOnceGameControllerUsedInGameLayer__block_invoke()
{
  id v4 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v0 = *MEMORY[0x1E4F63520];
  uint64_t v1 = *MEMORY[0x1E4F63588];
  id v2 = [MEMORY[0x1E4F636F0] currentGame];
  id v3 = [v2 bundleIdentifier];
  [v4 reportEvent:v0 type:v1 bundleID:v3];
}

- (void)setToLightBackground
{
  id v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:0];
  [(UIVisualEffectView *)self->_effectView setEffect:v3];
}

- (void)setToDarkBackground
{
  id v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:2];
  [(UIVisualEffectView *)self->_effectView setEffect:v3];
}

- (BOOL)alwaysShowDoneButton
{
  return self->_alwaysShowDoneButton;
}

- (void)setAlwaysShowDoneButton:(BOOL)a3
{
  self->_alwaysShowDoneButton = a3;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBardouble Height = a3;
}

- (BOOL)requiresNavigationController
{
  return self->_requiresNavigationController;
}

- (void)setRequiresNavigationController:(BOOL)a3
{
  self->_requiresNavigationController = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

- (int64_t)hostUserInterfaceIdiom
{
  return self->_hostUserInterfaceIdiom;
}

- (void)setHostUserInterfaceIdiom:(int64_t)a3
{
  self->_hostUserInterfaceIdiom = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (BOOL)adjustTopConstraint
{
  return self->_adjustTopConstraint;
}

- (void)setAdjustTopConstraint:(BOOL)a3
{
  self->_adjustTopConstraint = a3;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (void)setHasInitialData:(BOOL)a3
{
  self->_hasInitialData = a3;
}

- (NSLayoutConstraint)effectBottomConstraint
{
  return self->_effectBottomConstraint;
}

- (void)setEffectBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)effectTopConstraint
{
  return self->_effectTopConstraint;
}

- (void)setEffectTopConstraint:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_effectTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectBottomConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __63__GKExtensionRootViewController_constructContentViewController__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "Starting cache updates from extension. error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)messageFromClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromClient archive in GKExtensionRootViewController:%@", (uint8_t *)&v2, 0xCu);
}

void __48__GKExtensionRootViewController_hostObjectProxy__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1AF250000, v3, OS_LOG_TYPE_DEBUG, "error calling host - %@", (uint8_t *)&v5, 0xCu);
}

@end