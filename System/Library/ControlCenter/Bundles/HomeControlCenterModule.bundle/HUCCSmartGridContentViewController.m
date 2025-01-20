@interface HUCCSmartGridContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldDisplayHomeControlService;
- (BOOL)accessAllowedForCurrentLockState;
- (BOOL)isDeviceUnlockedForGridViewController:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isTransitioningToHomeControlService;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldPerformClickInteraction;
- (BOOL)shouldPerformHoverInteraction;
- (BOOL)shouldUseCompactContentFrameForExpandedContent;
- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3;
- (CGRect)_homeNameLabelInHomeGridCellFrame;
- (CGRect)_homeNameLabelInNavigationHeaderViewFrame;
- (CGRect)_iconViewInHomeGridCellFrame;
- (CGRect)_iconViewInNavigationHeaderViewFrame;
- (CGRect)_roomNameLabelInHomeGridCellFrame;
- (CGRect)_roomNameLabelInNavigationHeaderViewFrame;
- (CGRect)transitionCompressedViewFrame;
- (HUCCAccessoryControlsHosting)accessoryControlsViewController;
- (HUCCDashboardContainerViewController)dashboardContainerViewController;
- (HUCCSmartGridContentViewController)initWithDelegate:(id)a3;
- (HUCCSmartGridContentViewControllerDelegate)delegate;
- (HUCCSmartGridPropertyAnimator)transitionAnimator;
- (HUCCSmartGridViewController)smartGridViewController;
- (HUOpenURLHandling)URLHandler;
- (NSDictionary)transitionLargeTitleTextAttributes;
- (NSDictionary)transitionSubviewFrames;
- (NSObject)activeAssertion;
- (UILabel)transitionGridCellHomeNameLabel;
- (UILabel)transitionGridCellRoomNameLabel;
- (UILabel)transitionNavigationHeaderHomeNameLabel;
- (UILabel)transitionNavigationHeaderRoomNameLabel;
- (UIView)transitionIconView;
- (UIViewPropertyAnimator)customAnimator;
- (UIVisualEffectView)transitionGridCellHomeNameLabelEffectView;
- (UIVisualEffectView)transitionGridCellRoomNameLabelEffectView;
- (UIVisualEffectView)transitionNavigationHeaderHomeNameLabelEffectView;
- (UIVisualEffectView)transitionNavigationHeaderRoomNameLabelEffectView;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (double)transitionDeviceCornerRadius;
- (id)prepareForActionRequiringDeviceUnlockForGridViewController:(id)a3;
- (unint64_t)expandedContentMode;
- (void)_cleanupTransitionSubviews;
- (void)_openHomeApp;
- (void)_prepareTransitionSubviews;
- (void)_setUpSmartGridContent;
- (void)_showLockSecurityView:(BOOL)a3;
- (void)_tearDownSmartGridContent;
- (void)dealloc;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)displayHome:(id)a3;
- (void)displayWillTurnOff;
- (void)gridSizeMayHaveChanged;
- (void)loadView;
- (void)propertyAnimatorDidStartAnimating:(id)a3;
- (void)quickControlsPresentationDidUpdate:(BOOL)a3;
- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3;
- (void)requestDismissal;
- (void)setAccessAllowedForCurrentLockState:(BOOL)a3;
- (void)setAccessoryControlsViewController:(id)a3;
- (void)setActiveAssertion:(id)a3;
- (void)setDashboardContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedContentMode:(unint64_t)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsTransitioningToHomeControlService:(BOOL)a3;
- (void)setSmartGridViewController:(id)a3;
- (void)setTransitionAnimator:(id)a3;
- (void)setTransitionCompressedViewFrame:(CGRect)a3;
- (void)setTransitionDeviceCornerRadius:(double)a3;
- (void)setTransitionGridCellHomeNameLabel:(id)a3;
- (void)setTransitionGridCellHomeNameLabelEffectView:(id)a3;
- (void)setTransitionGridCellRoomNameLabel:(id)a3;
- (void)setTransitionGridCellRoomNameLabelEffectView:(id)a3;
- (void)setTransitionIconView:(id)a3;
- (void)setTransitionLargeTitleTextAttributes:(id)a3;
- (void)setTransitionNavigationHeaderHomeNameLabel:(id)a3;
- (void)setTransitionNavigationHeaderHomeNameLabelEffectView:(id)a3;
- (void)setTransitionNavigationHeaderRoomNameLabel:(id)a3;
- (void)setTransitionNavigationHeaderRoomNameLabelEffectView:(id)a3;
- (void)setTransitionSubviewFrames:(id)a3;
- (void)setURLHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissAccessoryControlsViewController:(id)a3;
- (void)willPresentAccessoryControlsViewController:(id)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation HUCCSmartGridContentViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    v30 = v7;
    __int16 v31 = 2080;
    v32 = "-[HUCCSmartGridContentViewController viewWillAppear:]";
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  v10 = objc_msgSend_delegate(self, v8, v9);
  objc_msgSend_smartGridContentViewController_viewWillAppear_(v10, v11, (uint64_t)self, v3);

  v28.receiver = self;
  v28.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v28 viewWillAppear:v3];
  v14 = objc_msgSend_view(self, v12, v13);
  uint64_t v17 = objc_msgSend_frame(v14, v15, v16);
  uint64_t v21 = HUCCSizeSubclassForModuleViewWidth(v17, v18, v19, v20);

  v24 = objc_msgSend_smartGridViewController(self, v22, v23);
  objc_msgSend_setSizeSubclass_(v24, v25, v21);

  objc_msgSend__setUpSmartGridContent(self, v26, v27);
}

- (HUCCSmartGridContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCSmartGridContentViewControllerDelegate *)WeakRetained;
}

- (void)_tearDownSmartGridContent
{
  v4 = objc_msgSend_activeAssertion(self, a2, v2);

  if (v4)
  {
    objc_msgSend_setIsExpanded_(self, v5, 0);
    v8 = objc_msgSend_dashboardContainerViewController(self, v6, v7);
    objc_msgSend_stopRemoteViewController(v8, v9, v10);

    uint64_t v13 = objc_msgSend_view(self, v11, v12);
    objc_msgSend_resetToInitialState(v13, v14, v15);

    v18 = objc_msgSend_dashboardContainerViewController(self, v16, v17);
    objc_msgSend_removeFromParentViewController(v18, v19, v20);

    objc_msgSend_setDashboardContainerViewController_(self, v21, 0);
    objc_msgSend_setIsTransitioningToHomeControlService_(self, v22, 0);
    uint64_t v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_24065C000, v23, OS_LOG_TYPE_DEFAULT, "Terminating HomeControlService", v64, 2u);
    }

    v26 = objc_msgSend_sharedInstance(MEMORY[0x263F49B60], v24, v25);
    objc_msgSend_dismissService(v26, v27, v28);

    v30 = objc_msgSend_policyWithDecision_(MEMORY[0x263F47C30], v29, 0);
    uint64_t v33 = objc_msgSend_smartGridViewController(self, v31, v32);
    v36 = objc_msgSend_itemManager(v33, v34, v35);
    objc_msgSend_setReadPolicy_(v36, v37, (uint64_t)v30);

    v40 = objc_msgSend_smartGridViewController(self, v38, v39);
    id v42 = (id)objc_msgSend_dismissQuickControlAnimated_wasDismissed_(v40, v41, 0, 0);

    v45 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v43, v44);
    v48 = objc_msgSend_homeManager(v45, v46, v47);
    v51 = objc_msgSend_homes(v48, v49, v50);
    objc_msgSend_na_each_(v51, v52, (uint64_t)&unk_26F4C80A0);

    v55 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v53, v54);
    v58 = objc_msgSend_homeManager(v55, v56, v57);
    v61 = objc_msgSend_activeAssertion(self, v59, v60);
    objc_msgSend__endActiveAssertion_(v58, v62, (uint64_t)v61);

    objc_msgSend_setActiveAssertion_(self, v63, 0);
  }
}

- (void)setURLHandler:(id)a3
{
  objc_storeStrong((id *)&self->_URLHandler, a3);
  id v5 = a3;
  objc_msgSend_smartGridViewController(self, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setURLHandler_(v9, v8, (uint64_t)v5);
}

- (HUCCSmartGridContentViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCCSmartGridContentViewController;
  id v5 = [(HUCCSmartGridContentViewController *)&v12 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_expandedContentMode = 0;
    uint64_t v7 = [HUCCSmartGridViewController alloc];
    uint64_t v9 = objc_msgSend_initWithItemType_delegate_(v7, v8, 0, v6);
    smartGridViewController = v6->_smartGridViewController;
    v6->_smartGridViewController = (HUCCSmartGridViewController *)v9;
  }
  return v6;
}

- (void)loadView
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(HUCCSmartContainerView);
  objc_msgSend_setView_(self, v4, (uint64_t)v3);

  uint64_t v7 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v5, v6);
  uint64_t v10 = objc_msgSend_view(self, v8, v9);
  objc_msgSend_setTintColor_(v10, v11, (uint64_t)v7);

  v14 = objc_msgSend_smartGridViewController(self, v12, v13);
  objc_msgSend_beginAppearanceTransition_animated_(v14, v15, 1, 0);

  v18 = objc_msgSend_smartGridViewController(self, v16, v17);
  objc_msgSend_addChildViewController_(self, v19, (uint64_t)v18);

  v22 = objc_msgSend_smartGridViewController(self, v20, v21);
  uint64_t v25 = objc_msgSend_view(v22, v23, v24);
  uint64_t v28 = objc_msgSend_view(self, v26, v27);
  objc_msgSend_setCompressedView_(v28, v29, (uint64_t)v25);

  uint64_t v32 = objc_msgSend_smartGridViewController(self, v30, v31);
  objc_msgSend_didMoveToParentViewController_(v32, v33, (uint64_t)self);

  v36 = objc_msgSend_smartGridViewController(self, v34, v35);
  objc_msgSend_beginAppearanceTransition_animated_(v36, v37, 0, 0);

  v40 = objc_msgSend_smartGridViewController(self, v38, v39);
  objc_msgSend_endAppearanceTransition(v40, v41, v42);

  v43 = HFLogForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    int v46 = 138412546;
    uint64_t v47 = v45;
    __int16 v48 = 2080;
    v49 = "-[HUCCSmartGridContentViewController loadView]";
    _os_log_impl(&dword_24065C000, v43, OS_LOG_TYPE_DEFAULT, "%@:%s", (uint8_t *)&v46, 0x16u);
  }
}

- (void)viewDidLoad
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2080;
    v18 = "-[HUCCSmartGridContentViewController viewDidLoad]";
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v14 viewDidLoad];
  id v6 = objc_alloc_init(MEMORY[0x263F1C7E8]);
  uint64_t v9 = objc_msgSend_largeTitleTextAttributes(v6, v7, v8);
  objc_msgSend_setTransitionLargeTitleTextAttributes_(self, v10, (uint64_t)v9);

  MGGetFloat32Answer();
  objc_msgSend_setTransitionDeviceCornerRadius_(self, v12, v13, v11);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v14 viewDidAppear:a3];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v9 = objc_msgSend_view(self, v7, v8);
    objc_super v12 = objc_msgSend_window(v9, v10, v11);
    uint64_t v13 = @"yes";
    if (!v12) {
      uint64_t v13 = @"no";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v6;
    __int16 v17 = 2080;
    v18 = "-[HUCCSmartGridContentViewController viewDidAppear:]";
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_24065C000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v7;
    __int16 v25 = 2080;
    v26 = "-[HUCCSmartGridContentViewController viewWillDisappear:]";
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  uint64_t v10 = objc_msgSend_accessoryControlsViewController(self, v8, v9);

  if (v10)
  {
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      objc_msgSend_accessoryControlsViewController(self, v14, v15);
      uint64_t v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_24065C000, v11, OS_LOG_TYPE_DEFAULT, "%@ was asked to dismiss while accessory controls were still presented: %@", buf, 0x16u);
    }
    __int16 v19 = objc_msgSend_accessoryControlsViewController(self, v17, v18);
    objc_msgSend_dismissAccessoryControlsAnimated_completion_(v19, v20, v3, 0);

    objc_msgSend_setAccessoryControlsViewController_(self, v21, 0);
  }
  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v22 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v7;
    __int16 v32 = 2080;
    uint64_t v33 = "-[HUCCSmartGridContentViewController viewDidDisappear:]";
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  objc_msgSend__tearDownSmartGridContent(self, v8, v9);
  objc_super v12 = objc_msgSend_accessoryControlsViewController(self, v10, v11);

  if (v12)
  {
    objc_super v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      objc_msgSend_accessoryControlsViewController(self, v17, v18);
      __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_impl(&dword_24065C000, v14, OS_LOG_TYPE_DEFAULT, "%@ disappeared while accessory controls were still presented: %@", buf, 0x16u);
    }
    objc_super v22 = objc_msgSend_accessoryControlsViewController(self, v20, v21);
    objc_msgSend_dismissAccessoryControlsAnimated_completion_(v22, v23, 0, 0);

    objc_msgSend_setAccessoryControlsViewController_(self, v24, 0);
  }
  objc_msgSend_setExpandedContentMode_(self, v13, 0);
  v29.receiver = self;
  v29.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v29 viewDidDisappear:v3];
  uint64_t v27 = objc_msgSend_delegate(self, v25, v26);
  objc_msgSend_smartGridContentViewController_viewDidDisappear_(v27, v28, (uint64_t)self, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (objc_msgSend_expandedContentMode(self, v8, v9) == 1)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_240669CFC;
    v11[3] = &unk_2650CC348;
    v11[4] = self;
    objc_msgSend_animateAlongsideTransition_completion_(v7, v10, (uint64_t)v11, 0);
  }
}

- (void)dealloc
{
  objc_msgSend__tearDownSmartGridContent(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)HUCCSmartGridContentViewController;
  [(HUCCSmartGridContentViewController *)&v4 dealloc];
}

- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HUCCStringForOrientation(a3);
    int v19 = 138412290;
    uint64_t v20 = v7;
    _os_log_impl(&dword_24065C000, v6, OS_LOG_TYPE_DEFAULT, "Computing module layout size for orientiation: %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v10 = objc_msgSend_smartGridViewController(self, v8, v9);
  uint64_t v12 = objc_msgSend_occupiedGridSizeForOrientation_(v10, v11, a3);
  unint64_t v14 = v13;

  uint64_t v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = NSStringFromSelector(a2);
    int v19 = 138412802;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    unint64_t v24 = v14;
    _os_log_impl(&dword_24065C000, v15, OS_LOG_TYPE_DEFAULT, "%@ - height: %ld, width: %ld", (uint8_t *)&v19, 0x20u);
  }
  unint64_t v17 = v14;
  unint64_t v18 = v12;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldUseCompactContentFrameForExpandedContent
{
  return objc_msgSend_expandedContentMode(self, a2, v2) != 2;
}

- (BOOL)shouldPerformClickInteraction
{
  BOOL v3 = objc_msgSend_view(self, a2, v2);
  char isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v3, v4, v5);

  return isShowingLockSecurity;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (UIViewPropertyAnimator)customAnimator
{
  if (objc_msgSend_expandedContentMode(self, a2, v2) == 1)
  {
    id v6 = 0;
  }
  else
  {
    objc_msgSend__prepareTransitionSubviews(self, v4, v5);
    if (objc_msgSend_isExpanded(self, v7, v8))
    {
      id v15 = objc_alloc(MEMORY[0x263F1C9B0]);
      unint64_t v18 = objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(v15, v16, v17, 1.0, 205.7182, 22.85739, 0.0, 0.0);
      int v19 = [HUCCSmartGridPropertyAnimator alloc];
      id v6 = objc_msgSend_initWithDuration_timingParameters_(v19, v20, (uint64_t)v18, 0.0);
      objc_msgSend_setDelegate_(v6, v21, (uint64_t)self);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = sub_24066A26C;
      v41[3] = &unk_2650CC370;
      v41[4] = self;
      objc_msgSend_addAnimations_(v6, v22, (uint64_t)v41);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = sub_24066A724;
      v40[3] = &unk_2650CC370;
      v40[4] = self;
      objc_msgSend_addAnimations_(v6, v23, (uint64_t)v40);
    }
    else
    {
      LODWORD(v11) = 1048168144;
      LODWORD(v12) = 1053104274;
      LODWORD(v13) = 1057634019;
      LODWORD(v14) = 1064730781;
      unint64_t v18 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x263F15808], v9, v10, v11, v12, v13, v14);
      id v24 = objc_alloc(MEMORY[0x263F1C5A0]);
      uint64_t v26 = objc_msgSend_initWithCustomCurve_(v24, v25, (uint64_t)v18);
      id v27 = objc_alloc(MEMORY[0x263F1C9B0]);
      v30 = objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(v27, v28, v29, 3.0, 500.0, 1000.0, 0.0, 0.0);
      objc_msgSend_setSpringTimingParameters_(v26, v31, (uint64_t)v30);

      __int16 v32 = [HUCCSmartGridPropertyAnimator alloc];
      id v6 = objc_msgSend_initWithDuration_timingParameters_(v32, v33, (uint64_t)v26, 0.45);
      objc_msgSend_setDelegate_(v6, v34, (uint64_t)self);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = sub_24066B004;
      v39[3] = &unk_2650CC370;
      v39[4] = self;
      objc_msgSend_addAnimations_(v6, v35, (uint64_t)v39);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_24066B494;
      v38[3] = &unk_2650CC370;
      v38[4] = self;
      objc_msgSend_addAnimations_(v6, v36, (uint64_t)v38);
    }
  }

  return (UIViewPropertyAnimator *)v6;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  uint64_t v4 = objc_msgSend_expandedContentMode(self, a2, v2);
  if (v4 != 1)
  {
    if (objc_msgSend_isTransitioningToHomeControlService(self, v5, v6))
    {
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v9 = objc_msgSend_view(self, v7, v8);
    int isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v9, v10, v11);

    if (isShowingLockSecurity)
    {
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = sub_24066BDE0;
      v35[3] = &unk_2650CC048;
      objc_copyWeak(&v36, &location);
      dispatch_async(MEMORY[0x263EF83A0], v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    if (!objc_msgSend__shouldDisplayHomeControlService(self, v13, v14))
    {
      objc_msgSend__openHomeApp(self, v15, v16);
      goto LABEL_10;
    }
    uint64_t v17 = objc_msgSend_view(self, v15, v16);
    objc_msgSend_hu_frameInGlobalCoordinateSpace(v17, v18, v19);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    int isAnIPad = objc_msgSend_isAnIPad(MEMORY[0x263F47C58], v28, v29);
    double v33 = 0.0;
    if (!isAnIPad) {
      double v33 = v21;
    }
    objc_msgSend_setTransitionCompressedViewFrame_(self, v31, v32, v33, v23, v25, v27);
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_setIsExpanded_(self, a2, a3);
  if (v3 && objc_msgSend_expandedContentMode(self, v5, v6) != 1)
  {
    id v7 = objc_msgSend_delegate(self, v5, v6);
    uint64_t v10 = objc_msgSend_contentModuleContext(v7, v12, v13);
    objc_msgSend_setHomeGestureDismissalAllowed_(v10, v14, 1);
  }
  else
  {
    id v7 = objc_msgSend_delegate(self, v5, v6);
    uint64_t v10 = objc_msgSend_contentModuleContext(v7, v8, v9);
    objc_msgSend_setHomeGestureDismissalAllowed_(v10, v11, 0);
  }

  if (objc_msgSend_expandedContentMode(self, v15, v16) != 1 && UIAccessibilityIsReduceMotionEnabled())
  {
    uint64_t isExpanded = objc_msgSend_isExpanded(self, v17, v18);
    double v22 = objc_msgSend_view(self, v20, v21);
    double v25 = objc_msgSend_compressedView(v22, v23, v24);
    objc_msgSend_setHidden_(v25, v26, isExpanded);

    uint64_t v29 = objc_msgSend_isExpanded(self, v27, v28);
    uint64_t v32 = objc_msgSend_smartGridViewController(self, v30, v31);
    uint64_t v35 = objc_msgSend_homeCell(v32, v33, v34);
    objc_msgSend_setHidden_(v35, v36, v29);

    uint64_t v39 = objc_msgSend_isExpanded(self, v37, v38) ^ 1;
    uint64_t v42 = objc_msgSend_view(self, v40, v41);
    v45 = objc_msgSend_animationView(v42, v43, v44);
    objc_msgSend_setHidden_(v45, v46, v39);

    uint64_t v49 = objc_msgSend_isExpanded(self, v47, v48) ^ 1;
    v52 = objc_msgSend_view(self, v50, v51);
    v55 = objc_msgSend_expandedView(v52, v53, v54);
    objc_msgSend_setHidden_(v55, v56, v49);

    v59 = objc_msgSend_dashboardContainerViewController(self, v57, v58);
    objc_msgSend_expandedContentFrame(v59, v60, v61);
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    v72 = objc_msgSend_view(self, v70, v71);
    v75 = objc_msgSend_expandedView(v72, v73, v74);
    objc_msgSend_setFrame_(v75, v76, v77, v63, v65, v67, v69);

    if (objc_msgSend_isAnIPad(MEMORY[0x263F47C58], v78, v79)) {
      CCUIExpandedModuleContinuousCornerRadius();
    }
    else {
      objc_msgSend_transitionDeviceCornerRadius(self, v80, v81);
    }
    double v85 = v84;
    v86 = objc_msgSend_view(self, v82, v83);
    v89 = objc_msgSend_expandedView(v86, v87, v88);
    objc_msgSend__setContinuousCornerRadius_(v89, v90, v91, v85);

    v94 = objc_msgSend_view(self, v92, v93);
    v97 = objc_msgSend_expandedView(v94, v95, v96);
    objc_msgSend_frame(v97, v98, v99);
    double v101 = v100;
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    v110 = objc_msgSend_view(self, v108, v109);
    v113 = objc_msgSend_animationView(v110, v111, v112);
    objc_msgSend_setFrame_(v113, v114, v115, v101, v103, v105, v107);

    v118 = objc_msgSend_view(self, v116, v117);
    v121 = objc_msgSend_expandedView(v118, v119, v120);
    objc_msgSend__continuousCornerRadius(v121, v122, v123);
    double v125 = v124;
    v128 = objc_msgSend_view(self, v126, v127);
    v131 = objc_msgSend_animationView(v128, v129, v130);
    objc_msgSend__setContinuousCornerRadius_(v131, v132, v133, v125);

    if (objc_msgSend_isExpanded(self, v134, v135)) {
      double v138 = 0.0;
    }
    else {
      double v138 = 1.0;
    }
    v139 = objc_msgSend_view(self, v136, v137);
    v142 = objc_msgSend_compressedView(v139, v140, v141);
    objc_msgSend_setAlpha_(v142, v143, v144, v138);

    if (objc_msgSend_isExpanded(self, v145, v146)) {
      double v149 = 1.0;
    }
    else {
      double v149 = 0.0;
    }
    v150 = objc_msgSend_view(self, v147, v148);
    v153 = objc_msgSend_animationView(v150, v151, v152);
    objc_msgSend_setAlpha_(v153, v154, v155, v149);

    if (objc_msgSend_isExpanded(self, v156, v157)) {
      double v160 = 1.0;
    }
    else {
      double v160 = 0.0;
    }
    v161 = objc_msgSend_view(self, v158, v159);
    v164 = objc_msgSend_expandedView(v161, v162, v163);
    objc_msgSend_setAlpha_(v164, v165, v166, v160);

    v169 = objc_msgSend_dashboardContainerViewController(self, v167, v168);
    uint64_t v172 = objc_msgSend_isExpanded(self, v170, v171);
    objc_msgSend_willBeginTransition_forCompactModule_(v169, v173, v172, 0);

    objc_msgSend_dashboardContainerViewController(self, v174, v175);
    id v180 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v178 = objc_msgSend_isExpanded(self, v176, v177);
    objc_msgSend_willFinishTransition_forCompactModule_(v180, v179, v178, 0);
  }
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  if (!a3) {
    objc_msgSend_setExpandedContentMode_(self, a2, 0);
  }
}

- (void)displayWillTurnOff
{
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v6 = objc_msgSend_view(self, a2, v2);
  uint64_t v9 = objc_msgSend_compressedView(v6, v7, v8);
  objc_msgSend_setFrameOrigin_(v9, v10, v11, v4, v5);

  uint64_t v14 = objc_msgSend_view(self, v12, v13);
  uint64_t v17 = objc_msgSend_compressedView(v14, v15, v16);
  objc_msgSend_setAlpha_(v17, v18, v19, 1.0);

  double v22 = objc_msgSend_view(self, v20, v21);
  double v25 = objc_msgSend_animationView(v22, v23, v24);
  objc_msgSend_setHidden_(v25, v26, 1);

  objc_msgSend_smartGridViewController(self, v27, v28);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_homeCell(v33, v29, v30);
  objc_msgSend_setHidden_(v31, v32, 0);
}

- (void)propertyAnimatorDidStartAnimating:(id)a3
{
  objc_msgSend_dashboardContainerViewController(self, a2, (uint64_t)a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t isExpanded = objc_msgSend_isExpanded(self, v4, v5);
  objc_msgSend_willBeginTransition_forCompactModule_(v8, v7, isExpanded, 0);
}

- (void)_prepareTransitionSubviews
{
  double v4 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, a2, v2);

  if (!v4)
  {
    id v7 = objc_alloc(MEMORY[0x263F1CB98]);
    uint64_t v10 = objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x263F1CB58], v8, v9);
    double v12 = objc_msgSend_initWithEffect_(v7, v11, (uint64_t)v10);
    objc_msgSend_setTransitionNavigationHeaderHomeNameLabelEffectView_(self, v13, (uint64_t)v12);

    uint64_t v16 = objc_msgSend_view(self, v14, v15);
    uint64_t v19 = objc_msgSend_animationView(v16, v17, v18);
    double v22 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v20, v21);
    objc_msgSend_addSubview_(v19, v23, (uint64_t)v22);

    uint64_t v24 = objc_opt_new();
    objc_msgSend_setTransitionNavigationHeaderHomeNameLabel_(self, v25, (uint64_t)v24);

    uint64_t v28 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v26, v27);
    uint64_t v31 = objc_msgSend_contentView(v28, v29, v30);
    uint64_t v34 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v32, v33);
    objc_msgSend_addSubview_(v31, v35, (uint64_t)v34);

    v37 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], v36, *MEMORY[0x263F1D298]);
    v40 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v38, v39);
    objc_msgSend_setFont_(v40, v41, (uint64_t)v37);

    uint64_t v44 = objc_msgSend_smartGridViewController(self, v42, v43);
    uint64_t v47 = objc_msgSend_homeCell(v44, v45, v46);
    uint64_t v50 = objc_msgSend_primaryLabel(v47, v48, v49);
    v53 = objc_msgSend_text(v50, v51, v52);
    v56 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v54, v55);
    objc_msgSend_setText_(v56, v57, (uint64_t)v53);

    uint64_t v60 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v58, v59);
    double v63 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v61, v62);
    objc_msgSend_setTextColor_(v63, v64, (uint64_t)v60);

    if (objc_msgSend_isExpanded(self, v65, v66))
    {
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v67, v68);
      double v70 = v69;
      double v72 = v71;
      double v74 = v73;
      double v76 = v75;
      uint64_t v79 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v77, v78);
      objc_msgSend_setFrame_(v79, v80, v81, v70, v72, v74, v76);

      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v82, v83);
      double v85 = v84;
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v86, v87);
      double v89 = v88;
      v92 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v90, v91);
      objc_msgSend_setFrame_(v92, v93, v94, 0.0, 0.0, v85, v89);

      v97 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v95, v96);
      objc_msgSend_setAlpha_(v97, v98, v99, 0.0);

      double v102 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v100, v101);
      objc_msgSend_setAlpha_(v102, v103, v104, 0.0);
    }
    else
    {
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v67, v68);
      double v106 = v105;
      double v108 = v107;
      double v110 = v109;
      double v112 = v111;
      uint64_t v115 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v113, v114);
      objc_msgSend_setFrame_(v115, v116, v117, v106, v108, v110, v112);

      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v118, v119);
      double v121 = v120;
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v122, v123);
      double v125 = v124;
      v128 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v126, v127);
      objc_msgSend_setFrame_(v128, v129, v130, 0.0, 0.0, v121, v125);

      uint64_t v133 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v131, v132);
      objc_msgSend_setAlpha_(v133, v134, v135, 1.0);

      double v102 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v136, v137);
      objc_msgSend_setAlpha_(v102, v138, v139, 1.0);
    }
  }
  v140 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v5, v6);

  if (!v140)
  {
    id v143 = objc_alloc(MEMORY[0x263F1CB98]);
    uint64_t v146 = objc_msgSend_controlCenterPrimaryVibrancyEffect(MEMORY[0x263F1CB58], v144, v145);
    uint64_t v148 = objc_msgSend_initWithEffect_(v143, v147, (uint64_t)v146);
    objc_msgSend_setTransitionGridCellHomeNameLabelEffectView_(self, v149, (uint64_t)v148);

    uint64_t v152 = objc_msgSend_view(self, v150, v151);
    uint64_t v155 = objc_msgSend_animationView(v152, v153, v154);
    v158 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v156, v157);
    objc_msgSend_addSubview_(v155, v159, (uint64_t)v158);

    double v160 = objc_opt_new();
    objc_msgSend_setTransitionGridCellHomeNameLabel_(self, v161, (uint64_t)v160);

    v164 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v162, v163);
    v167 = objc_msgSend_contentView(v164, v165, v166);
    v170 = objc_msgSend_transitionGridCellHomeNameLabel(self, v168, v169);
    objc_msgSend_addSubview_(v167, v171, (uint64_t)v170);

    v174 = objc_msgSend_smartGridViewController(self, v172, v173);
    uint64_t v177 = objc_msgSend_homeCell(v174, v175, v176);
    id v180 = objc_msgSend_primaryLabel(v177, v178, v179);
    v183 = objc_msgSend_font(v180, v181, v182);
    v186 = objc_msgSend_transitionGridCellHomeNameLabel(self, v184, v185);
    objc_msgSend_setFont_(v186, v187, (uint64_t)v183);

    v190 = objc_msgSend_smartGridViewController(self, v188, v189);
    v193 = objc_msgSend_homeCell(v190, v191, v192);
    v196 = objc_msgSend_primaryLabel(v193, v194, v195);
    v199 = objc_msgSend_text(v196, v197, v198);
    v202 = objc_msgSend_transitionGridCellHomeNameLabel(self, v200, v201);
    objc_msgSend_setText_(v202, v203, (uint64_t)v199);

    v206 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v204, v205);
    v209 = objc_msgSend_transitionGridCellHomeNameLabel(self, v207, v208);
    objc_msgSend_setTextColor_(v209, v210, (uint64_t)v206);

    if (objc_msgSend_isExpanded(self, v211, v212))
    {
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v213, v214);
      double v216 = v215;
      double v218 = v217;
      double v220 = v219;
      double v222 = v221;
      v225 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v223, v224);
      objc_msgSend_setFrame_(v225, v226, v227, v216, v218, v220, v222);

      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v228, v229);
      double v231 = v230;
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v232, v233);
      double v235 = v234;
      v238 = objc_msgSend_transitionGridCellHomeNameLabel(self, v236, v237);
      objc_msgSend_setFrame_(v238, v239, v240, 0.0, 0.0, v231, v235);

      v243 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v241, v242);
      objc_msgSend_setAlpha_(v243, v244, v245, 1.0);

      v248 = objc_msgSend_transitionGridCellHomeNameLabel(self, v246, v247);
      objc_msgSend_setAlpha_(v248, v249, v250, 1.0);
    }
    else
    {
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v213, v214);
      double v252 = v251;
      double v254 = v253;
      double v256 = v255;
      double v258 = v257;
      v261 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v259, v260);
      objc_msgSend_setFrame_(v261, v262, v263, v252, v254, v256, v258);

      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v264, v265);
      double v267 = v266;
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v268, v269);
      double v271 = v270;
      v274 = objc_msgSend_transitionGridCellHomeNameLabel(self, v272, v273);
      objc_msgSend_setFrame_(v274, v275, v276, 0.0, 0.0, v267, v271);

      v279 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v277, v278);
      objc_msgSend_setAlpha_(v279, v280, v281, 0.0);

      v248 = objc_msgSend_transitionGridCellHomeNameLabel(self, v282, v283);
      objc_msgSend_setAlpha_(v248, v284, v285, 0.0);
    }
  }
  v286 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v141, v142);

  if (!v286)
  {
    id v289 = objc_alloc(MEMORY[0x263F1CB98]);
    v292 = objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x263F1CB58], v290, v291);
    v294 = objc_msgSend_initWithEffect_(v289, v293, (uint64_t)v292);
    objc_msgSend_setTransitionGridCellRoomNameLabelEffectView_(self, v295, (uint64_t)v294);

    v298 = objc_msgSend_view(self, v296, v297);
    v301 = objc_msgSend_animationView(v298, v299, v300);
    v304 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v302, v303);
    objc_msgSend_addSubview_(v301, v305, (uint64_t)v304);

    v306 = objc_opt_new();
    objc_msgSend_setTransitionGridCellRoomNameLabel_(self, v307, (uint64_t)v306);

    v310 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v308, v309);
    v313 = objc_msgSend_contentView(v310, v311, v312);
    v316 = objc_msgSend_transitionGridCellRoomNameLabel(self, v314, v315);
    objc_msgSend_addSubview_(v313, v317, (uint64_t)v316);

    v320 = objc_msgSend_smartGridViewController(self, v318, v319);
    v323 = objc_msgSend_homeCell(v320, v321, v322);
    v326 = objc_msgSend_secondaryLabel(v323, v324, v325);
    v329 = objc_msgSend_font(v326, v327, v328);
    v332 = objc_msgSend_transitionGridCellRoomNameLabel(self, v330, v331);
    objc_msgSend_setFont_(v332, v333, (uint64_t)v329);

    v336 = objc_msgSend_smartGridViewController(self, v334, v335);
    v339 = objc_msgSend_homeCell(v336, v337, v338);
    v342 = objc_msgSend_secondaryLabel(v339, v340, v341);
    v345 = objc_msgSend_text(v342, v343, v344);
    v348 = objc_msgSend_transitionGridCellRoomNameLabel(self, v346, v347);
    objc_msgSend_setText_(v348, v349, (uint64_t)v345);

    v352 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v350, v351);
    v355 = objc_msgSend_transitionGridCellRoomNameLabel(self, v353, v354);
    objc_msgSend_setTextColor_(v355, v356, (uint64_t)v352);

    if (objc_msgSend_isExpanded(self, v357, v358))
    {
      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v359, v360);
      double v362 = v361;
      double v364 = v363;
      double v366 = v365;
      double v368 = v367;
      v371 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v369, v370);
      objc_msgSend_setFrame_(v371, v372, v373, v362, v364, v366, v368);

      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v374, v375);
      double v377 = v376;
      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v378, v379);
      double v381 = v380;
      v384 = objc_msgSend_transitionGridCellRoomNameLabel(self, v382, v383);
      objc_msgSend_setFrame_(v384, v385, v386, 0.0, 0.0, v377, v381);

      v389 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v387, v388);
      objc_msgSend_setAlpha_(v389, v390, v391, 1.0);

      v394 = objc_msgSend_transitionGridCellRoomNameLabel(self, v392, v393);
      objc_msgSend_setAlpha_(v394, v395, v396, 1.0);
    }
    else
    {
      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v359, v360);
      double v398 = v397;
      double v400 = v399;
      double v402 = v401;
      double v404 = v403;
      v407 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v405, v406);
      objc_msgSend_setFrame_(v407, v408, v409, v398, v400, v402, v404);

      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v410, v411);
      double v413 = v412;
      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v414, v415);
      double v417 = v416;
      v420 = objc_msgSend_transitionGridCellRoomNameLabel(self, v418, v419);
      objc_msgSend_setFrame_(v420, v421, v422, 0.0, 0.0, v413, v417);

      v425 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v423, v424);
      objc_msgSend_setAlpha_(v425, v426, v427, 0.0);

      v394 = objc_msgSend_transitionGridCellRoomNameLabel(self, v428, v429);
      objc_msgSend_setAlpha_(v394, v430, v431, 0.0);
    }
  }
  v432 = objc_msgSend_transitionIconView(self, v287, v288);

  if (!v432)
  {
    v435 = objc_msgSend_smartGridViewController(self, v433, v434);
    v438 = objc_msgSend_homeCell(v435, v436, v437);
    v441 = objc_msgSend_iconView(v438, v439, v440);
    v443 = objc_msgSend_snapshotViewAfterScreenUpdates_(v441, v442, 0);
    objc_msgSend_setTransitionIconView_(self, v444, (uint64_t)v443);

    v447 = objc_msgSend_view(self, v445, v446);
    v450 = objc_msgSend_animationView(v447, v448, v449);
    v453 = objc_msgSend_transitionIconView(self, v451, v452);
    objc_msgSend_addSubview_(v450, v454, (uint64_t)v453);

    if (objc_msgSend_isExpanded(self, v455, v456)) {
      objc_msgSend__iconViewInHomeGridCellFrame(self, v457, v458);
    }
    else {
      objc_msgSend__iconViewInNavigationHeaderViewFrame(self, v457, v458);
    }
    double v465 = v461;
    double v466 = v462;
    double v467 = v463;
    double v468 = v464;
    v469 = objc_msgSend_transitionIconView(self, v459, v460);
    objc_msgSend_setFrame_(v469, v470, v471, v465, v466, v467, v468);
  }
  if ((objc_msgSend_isExpanded(self, v433, v434) & 1) == 0)
  {
    v474 = objc_msgSend_view(self, v472, v473);
    v477 = objc_msgSend_compressedView(v474, v475, v476);
    objc_msgSend_frame(v477, v478, v479);
    double v481 = v480;
    double v483 = v482;

    objc_msgSend_transitionCompressedViewFrame(self, v484, v485);
    double v487 = v486;
    double v489 = v488;
    objc_msgSend_view(self, v490, v491);
    id v497 = (id)objc_claimAutoreleasedReturnValue();
    v494 = objc_msgSend_compressedView(v497, v492, v493);
    objc_msgSend_setFrame_(v494, v495, v496, v487, v489, v481, v483);
  }
}

- (void)_cleanupTransitionSubviews
{
  double v4 = objc_msgSend_transitionIconView(self, a2, v2);
  objc_msgSend_removeFromSuperview(v4, v5, v6);

  objc_msgSend_setTransitionIconView_(self, v7, 0);
  uint64_t v10 = objc_msgSend_transitionGridCellRoomNameLabel(self, v8, v9);
  objc_msgSend_removeFromSuperview(v10, v11, v12);

  objc_msgSend_setTransitionGridCellRoomNameLabel_(self, v13, 0);
  uint64_t v16 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v14, v15);
  objc_msgSend_removeFromSuperview(v16, v17, v18);

  objc_msgSend_setTransitionGridCellRoomNameLabelEffectView_(self, v19, 0);
  double v22 = objc_msgSend_transitionGridCellHomeNameLabel(self, v20, v21);
  objc_msgSend_removeFromSuperview(v22, v23, v24);

  objc_msgSend_setTransitionGridCellHomeNameLabel_(self, v25, 0);
  uint64_t v28 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v26, v27);
  objc_msgSend_removeFromSuperview(v28, v29, v30);

  objc_msgSend_setTransitionGridCellHomeNameLabelEffectView_(self, v31, 0);
  uint64_t v34 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(self, v32, v33);
  objc_msgSend_removeFromSuperview(v34, v35, v36);

  objc_msgSend_setTransitionNavigationHeaderRoomNameLabel_(self, v37, 0);
  v40 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(self, v38, v39);
  objc_msgSend_removeFromSuperview(v40, v41, v42);

  objc_msgSend_setTransitionNavigationHeaderRoomNameLabelEffectView_(self, v43, 0);
  uint64_t v46 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v44, v45);
  objc_msgSend_removeFromSuperview(v46, v47, v48);

  objc_msgSend_setTransitionNavigationHeaderHomeNameLabel_(self, v49, 0);
  uint64_t v52 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v50, v51);
  objc_msgSend_removeFromSuperview(v52, v53, v54);

  objc_msgSend_setTransitionNavigationHeaderHomeNameLabelEffectView_(self, v55, 0);
}

- (CGRect)_iconViewInHomeGridCellFrame
{
  BOOL v3 = objc_msgSend_smartGridViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_homeCell(v3, v4, v5);
  uint64_t v9 = objc_msgSend_iconView(v6, v7, v8);
  objc_msgSend_frame(v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_homeNameLabelInHomeGridCellFrame
{
  uint64_t v57 = objc_msgSend_smartGridViewController(self, a2, v2);
  v56 = objc_msgSend_homeCell(v57, v4, v5);
  uint64_t v8 = objc_msgSend_verticalStackView(v56, v6, v7);
  objc_msgSend_frame(v8, v9, v10);
  double v12 = v11;
  double v15 = objc_msgSend_smartGridViewController(self, v13, v14);
  double v18 = objc_msgSend_homeCell(v15, v16, v17);
  double v21 = objc_msgSend_verticalStackView(v18, v19, v20);
  objc_msgSend_frame(v21, v22, v23);
  double v25 = v24;
  uint64_t v28 = objc_msgSend_smartGridViewController(self, v26, v27);
  uint64_t v31 = objc_msgSend_homeCell(v28, v29, v30);
  uint64_t v34 = objc_msgSend_primaryLabel(v31, v32, v33);
  objc_msgSend_frame(v34, v35, v36);
  double v38 = v37;
  uint64_t v41 = objc_msgSend_smartGridViewController(self, v39, v40);
  uint64_t v44 = objc_msgSend_homeCell(v41, v42, v43);
  uint64_t v47 = objc_msgSend_primaryLabel(v44, v45, v46);
  objc_msgSend_frame(v47, v48, v49);
  double v51 = v50;

  double v52 = v12;
  double v53 = v25;
  double v54 = v38;
  double v55 = v51;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)_roomNameLabelInHomeGridCellFrame
{
  double v4 = objc_msgSend_smartGridViewController(self, a2, v2);
  uint64_t v7 = objc_msgSend_homeCell(v4, v5, v6);
  uint64_t v10 = objc_msgSend_verticalStackView(v7, v8, v9);
  objc_msgSend_frame(v10, v11, v12);
  double v14 = v13;
  uint64_t v17 = objc_msgSend_smartGridViewController(self, v15, v16);
  uint64_t v20 = objc_msgSend_homeCell(v17, v18, v19);
  uint64_t v23 = objc_msgSend_verticalStackView(v20, v21, v22);
  objc_msgSend_spacing(v23, v24, v25);
  double v27 = v14 + v26;
  uint64_t v30 = objc_msgSend_smartGridViewController(self, v28, v29);
  uint64_t v33 = objc_msgSend_homeCell(v30, v31, v32);
  uint64_t v36 = objc_msgSend_primaryLabel(v33, v34, v35);
  objc_msgSend_frame(v36, v37, v38);
  double v40 = v27 + v39;

  uint64_t v43 = objc_msgSend_smartGridViewController(self, v41, v42);
  uint64_t v46 = objc_msgSend_homeCell(v43, v44, v45);
  uint64_t v49 = objc_msgSend_verticalStackView(v46, v47, v48);
  objc_msgSend_frame(v49, v50, v51);
  double v53 = v52;
  v56 = objc_msgSend_smartGridViewController(self, v54, v55);
  uint64_t v59 = objc_msgSend_homeCell(v56, v57, v58);
  uint64_t v62 = objc_msgSend_secondaryLabel(v59, v60, v61);
  objc_msgSend_frame(v62, v63, v64);
  double v66 = v65;
  double v69 = objc_msgSend_smartGridViewController(self, v67, v68);
  double v72 = objc_msgSend_homeCell(v69, v70, v71);
  double v75 = objc_msgSend_secondaryLabel(v72, v73, v74);
  objc_msgSend_frame(v75, v76, v77);
  double v79 = v78;

  double v80 = v53;
  double v81 = v40;
  double v82 = v66;
  double v83 = v79;
  result.size.double height = v83;
  result.size.double width = v82;
  result.origin.y = v81;
  result.origin.x = v80;
  return result;
}

- (CGRect)_iconViewInNavigationHeaderViewFrame
{
  BOOL v3 = objc_msgSend_dashboardContainerViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F49AD0]);
  objc_msgSend_CGRectValue(v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_roomNameLabelInNavigationHeaderViewFrame
{
  BOOL v3 = objc_msgSend_dashboardContainerViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F49AE0]);
  objc_msgSend_CGRectValue(v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_homeNameLabelInNavigationHeaderViewFrame
{
  BOOL v3 = objc_msgSend_dashboardContainerViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F49AD8]);
  objc_msgSend_CGRectValue(v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)isDeviceUnlockedForGridViewController:(id)a3
{
  BOOL v3 = self;
  double v4 = objc_msgSend_delegate(self, a2, (uint64_t)a3);
  LOBYTE(v3) = objc_msgSend_isDeviceUnlockedForSmartGridContentViewController_(v4, v5, (uint64_t)v3);

  return (char)v3;
}

- (id)prepareForActionRequiringDeviceUnlockForGridViewController:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  uint64_t v10 = objc_msgSend_contentModuleContext(v7, v8, v9);

  if (v10)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_24066D910;
    v15[3] = &unk_2650CC320;
    id v16 = v4;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v10, v11, (uint64_t)v15);
  }
  else
  {
    double v12 = NAEmptyResult();
    objc_msgSend_finishWithResult_(v4, v13, (uint64_t)v12);
  }

  return v4;
}

- (BOOL)_shouldDisplayHomeControlService
{
  BOOL v3 = objc_msgSend_smartGridViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_itemManager(v3, v4, v5);
  uint64_t v9 = objc_msgSend_allDisplayedItems(v6, v7, v8);
  BOOL v12 = (unint64_t)objc_msgSend_count(v9, v10, v11) > 1;

  return v12;
}

- (void)displayHome:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int shouldDisplayHomeControlService = objc_msgSend__shouldDisplayHomeControlService(self, v5, v6);
  uint64_t v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (shouldDisplayHomeControlService)
  {
    if (v9)
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v38 = 138412802;
      double v39 = v11;
      __int16 v40 = 2080;
      uint64_t v41 = "-[HUCCSmartGridContentViewController displayHome:]";
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_24065C000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s displaying Home Control Service for %@", (uint8_t *)&v38, 0x20u);
    }
    objc_msgSend_setExpandedContentMode_(self, v12, 2);
    double v15 = objc_msgSend_view(self, v13, v14);
    double v18 = objc_msgSend_smartGridViewController(self, v16, v17);
    double v21 = objc_msgSend_homeCell(v18, v19, v20);
    objc_msgSend_frame(v21, v22, v23);
    objc_msgSend_willMoveToExpandedStateWithAnimationStartFrame_(v15, v24, v25);

    uint64_t v28 = objc_msgSend_delegate(self, v26, v27);
    uint64_t v31 = objc_msgSend_contentModuleContext(v28, v29, v30);
    objc_msgSend_requestExpandModule(v31, v32, v33);
  }
  else
  {
    if (v9)
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      int v38 = 138412802;
      double v39 = v35;
      __int16 v40 = 2080;
      uint64_t v41 = "-[HUCCSmartGridContentViewController displayHome:]";
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_24065C000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s Opening Home app for %@", (uint8_t *)&v38, 0x20u);
    }
    objc_msgSend__openHomeApp(self, v36, v37);
  }
}

- (void)gridSizeMayHaveChanged
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "Requesting layout size update", v12, 2u);
  }

  uint64_t v6 = objc_msgSend_delegate(self, v4, v5);
  BOOL v9 = objc_msgSend_contentModuleContext(v6, v7, v8);
  objc_msgSend_requestLayoutSizeUpdate(v9, v10, v11);
}

- (void)willPresentAccessoryControlsViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "Accessory controls will present: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_setExpandedContentMode_(self, v6, 1);
  objc_msgSend_setAccessoryControlsViewController_(self, v7, (uint64_t)v4);
  uint64_t v10 = objc_msgSend_delegate(self, v8, v9);
  double v13 = objc_msgSend_contentModuleContext(v10, v11, v12);
  objc_msgSend_requestExpandModule(v13, v14, v15);
}

- (void)willDismissAccessoryControlsViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "Accessory controls will dismiss: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_setAccessoryControlsViewController_(self, v6, 0);
  uint64_t v9 = objc_msgSend_delegate(self, v7, v8);
  uint64_t v12 = objc_msgSend_contentModuleContext(v9, v10, v11);
  objc_msgSend_dismissModule(v12, v13, v14);
}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_contentModuleContext(v8, v4, v5);
  objc_msgSend_setHomeGestureDismissalAllowed_(v6, v7, 1);
}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  int isDeviceUnlockedForSmartGridContentViewController = objc_msgSend_isDeviceUnlockedForSmartGridContentViewController_(v7, v8, (uint64_t)self);

  if (isDeviceUnlockedForSmartGridContentViewController)
  {
    v4[2](v4, 1);
  }
  else
  {
    uint64_t v12 = objc_msgSend_delegate(self, v10, v11);
    int v15 = objc_msgSend_contentModuleContext(v12, v13, v14);

    if (v15)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_24066DFEC;
      v17[3] = &unk_2650CC070;
      uint64_t v18 = v4;
      objc_msgSend_requestAuthenticationWithCompletionHandler_(v15, v16, (uint64_t)v17);
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

- (void)requestDismissal
{
  objc_msgSend_delegate(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_contentModuleContext(v8, v3, v4);
  objc_msgSend_dismissModule(v5, v6, v7);
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_contentModuleContext(v8, v4, v5);
  objc_msgSend_setHomeGestureDismissalAllowed_(v6, v7, !v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  self->_accessAllowedForCurrentLockState = a3;
  objc_msgSend__showLockSecurityView_(self, a2, !a3);
}

- (void)_setUpSmartGridContent
{
  uint64_t v4 = objc_msgSend_activeAssertion(self, a2, v2);

  if (!v4)
  {
    uint64_t v7 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v5, v6);
    uint64_t v10 = objc_msgSend_homeManager(v7, v8, v9);
    uint64_t v12 = objc_msgSend__beginActiveAssertionWithReason_(v10, v11, @"HUCCSmartGridModuleVisible");
    objc_msgSend_setActiveAssertion_(self, v13, (uint64_t)v12);

    id v16 = objc_msgSend_activeAssertion(self, v14, v15);

    if (v16)
    {
      double v19 = objc_msgSend_sharedInstance(MEMORY[0x263F49B60], v17, v18);
      objc_msgSend_launchServiceSuspendedWithUserInfo_(v19, v20, MEMORY[0x263EFFA78]);

      double v22 = objc_msgSend_policyWithDecision_(MEMORY[0x263F47C30], v21, 1);
      uint64_t v25 = objc_msgSend_smartGridViewController(self, v23, v24);
      uint64_t v28 = objc_msgSend_itemManager(v25, v26, v27);
      objc_msgSend_setReadPolicy_(v28, v29, (uint64_t)v22);

      uint64_t v30 = [HUCCDashboardContainerViewController alloc];
      uint64_t v32 = objc_msgSend_initWithDelegate_(v30, v31, (uint64_t)self);
      objc_msgSend_setDashboardContainerViewController_(self, v33, (uint64_t)v32);

      uint64_t v36 = objc_msgSend_dashboardContainerViewController(self, v34, v35);
      double v39 = objc_msgSend_view(v36, v37, v38);
      __int16 v42 = objc_msgSend_view(self, v40, v41);
      objc_msgSend_setExpandedView_(v42, v43, (uint64_t)v39);

      uint64_t v46 = objc_msgSend_dashboardContainerViewController(self, v44, v45);
      objc_msgSend_addChildViewController_(self, v47, (uint64_t)v46);

      double v50 = objc_msgSend_dashboardContainerViewController(self, v48, v49);
      objc_msgSend_didMoveToParentViewController_(v50, v51, (uint64_t)self);

      double v54 = objc_msgSend_smartGridViewController(self, v52, v53);
      uint64_t v57 = objc_msgSend_homeCell(v54, v55, v56);
      objc_msgSend_setHidden_(v57, v58, 0);

      objc_msgSend_setIsTransitioningToHomeControlService_(self, v59, 0);
    }
  }
}

- (double)preferredExpandedContentHeight
{
  BOOL v3 = objc_msgSend_dashboardContainerViewController(self, a2, v2);
  objc_msgSend_preferredExpandedSize(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)preferredExpandedContentWidth
{
  BOOL v3 = objc_msgSend_dashboardContainerViewController(self, a2, v2);
  objc_msgSend_preferredExpandedSize(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)_openHomeApp
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_24066E43C;
  v2[3] = &unk_2650CC048;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_showLockSecurityView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_view(self, a2, a3);
  int isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v5, v6, v7);

  if (v3)
  {
    if (isShowingLockSecurity) {
      return;
    }
    objc_msgSend_view(self, v9, v10);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    double v13 = objc_msgSend_smartGridViewController(self, v11, v12);
    id v16 = objc_msgSend_mosaicLayout(v13, v14, v15);
    objc_msgSend_showLockSecurityWithFrameDelegate_(v20, v17, (uint64_t)v16);
  }
  else
  {
    if (!isShowingLockSecurity) {
      return;
    }
    objc_msgSend_view(self, v9, v10);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hideLockSecurity(v20, v18, v19);
  }
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)accessAllowedForCurrentLockState
{
  return self->_accessAllowedForCurrentLockState;
}

- (HUOpenURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (HUCCSmartGridViewController)smartGridViewController
{
  return self->_smartGridViewController;
}

- (void)setSmartGridViewController:(id)a3
{
}

- (HUCCDashboardContainerViewController)dashboardContainerViewController
{
  return self->_dashboardContainerViewController;
}

- (void)setDashboardContainerViewController:(id)a3
{
}

- (HUCCAccessoryControlsHosting)accessoryControlsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryControlsViewController);

  return (HUCCAccessoryControlsHosting *)WeakRetained;
}

- (void)setAccessoryControlsViewController:(id)a3
{
}

- (unint64_t)expandedContentMode
{
  return self->_expandedContentMode;
}

- (void)setExpandedContentMode:(unint64_t)a3
{
  self->_expandedContentMode = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_uint64_t isExpanded = a3;
}

- (BOOL)isTransitioningToHomeControlService
{
  return self->_isTransitioningToHomeControlService;
}

- (void)setIsTransitioningToHomeControlService:(BOOL)a3
{
  self->_isTransitioningToHomeControlService = a3;
}

- (NSObject)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(id)a3
{
}

- (HUCCSmartGridPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
}

- (UIView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
}

- (UIVisualEffectView)transitionGridCellHomeNameLabelEffectView
{
  return self->_transitionGridCellHomeNameLabelEffectView;
}

- (void)setTransitionGridCellHomeNameLabelEffectView:(id)a3
{
}

- (UILabel)transitionGridCellHomeNameLabel
{
  return self->_transitionGridCellHomeNameLabel;
}

- (void)setTransitionGridCellHomeNameLabel:(id)a3
{
}

- (UIVisualEffectView)transitionGridCellRoomNameLabelEffectView
{
  return self->_transitionGridCellRoomNameLabelEffectView;
}

- (void)setTransitionGridCellRoomNameLabelEffectView:(id)a3
{
}

- (UILabel)transitionGridCellRoomNameLabel
{
  return self->_transitionGridCellRoomNameLabel;
}

- (void)setTransitionGridCellRoomNameLabel:(id)a3
{
}

- (UIVisualEffectView)transitionNavigationHeaderHomeNameLabelEffectView
{
  return self->_transitionNavigationHeaderHomeNameLabelEffectView;
}

- (void)setTransitionNavigationHeaderHomeNameLabelEffectView:(id)a3
{
}

- (UILabel)transitionNavigationHeaderHomeNameLabel
{
  return self->_transitionNavigationHeaderHomeNameLabel;
}

- (void)setTransitionNavigationHeaderHomeNameLabel:(id)a3
{
}

- (UIVisualEffectView)transitionNavigationHeaderRoomNameLabelEffectView
{
  return self->_transitionNavigationHeaderRoomNameLabelEffectView;
}

- (void)setTransitionNavigationHeaderRoomNameLabelEffectView:(id)a3
{
}

- (UILabel)transitionNavigationHeaderRoomNameLabel
{
  return self->_transitionNavigationHeaderRoomNameLabel;
}

- (void)setTransitionNavigationHeaderRoomNameLabel:(id)a3
{
}

- (NSDictionary)transitionLargeTitleTextAttributes
{
  return self->_transitionLargeTitleTextAttributes;
}

- (void)setTransitionLargeTitleTextAttributes:(id)a3
{
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
}

- (CGRect)transitionCompressedViewFrame
{
  double x = self->_transitionCompressedViewFrame.origin.x;
  double y = self->_transitionCompressedViewFrame.origin.y;
  double width = self->_transitionCompressedViewFrame.size.width;
  double height = self->_transitionCompressedViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransitionCompressedViewFrame:(CGRect)a3
{
  self->_transitionCompressedViewFrame = a3;
}

- (double)transitionDeviceCornerRadius
{
  return self->_transitionDeviceCornerRadius;
}

- (void)setTransitionDeviceCornerRadius:(double)a3
{
  self->_transitionDeviceCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
  objc_storeStrong((id *)&self->_transitionLargeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_activeAssertion, 0);
  objc_destroyWeak((id *)&self->_accessoryControlsViewController);
  objc_storeStrong((id *)&self->_dashboardContainerViewController, 0);
  objc_storeStrong((id *)&self->_smartGridViewController, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end