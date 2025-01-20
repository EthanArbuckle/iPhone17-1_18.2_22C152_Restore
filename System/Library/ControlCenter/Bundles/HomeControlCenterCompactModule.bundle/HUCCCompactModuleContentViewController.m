@interface HUCCCompactModuleContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessAllowedForCurrentLockState;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (CGRect)_expandedContentFrame;
- (CGRect)_iconViewInHomeGridCellFrame;
- (CGRect)_iconViewInNavigationHeaderViewFrame;
- (CGRect)transitionCompressedAnimationStartFrame;
- (CGSize)preferredExpandedSize;
- (HUCCCompactModuleContentViewController)initWithDelegate:(id)a3;
- (HUCCCompactModuleContentViewControllerDelegate)delegate;
- (HUCCDashboardContainerViewController)dashboardContainerViewController;
- (NSObject)activeAssertion;
- (UIView)expandedView;
- (UIView)transitionIconView;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContinuousCornerRadius;
- (double)transitionDeviceCornerRadius;
- (id)customAnimator;
- (void)_openHomeApp;
- (void)_setUpHomeControlService;
- (void)_tearDownHomeControlService;
- (void)dealloc;
- (void)propertyAnimatorDidStartAnimating:(id)a3;
- (void)quickControlsPresentationDidUpdate:(BOOL)a3;
- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3;
- (void)requestDismissal;
- (void)resetToInitialState;
- (void)setAccessAllowedForCurrentLockState:(BOOL)a3;
- (void)setActiveAssertion:(id)a3;
- (void)setDashboardContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedView:(id)a3;
- (void)setTransitionCompressedAnimationStartFrame:(CGRect)a3;
- (void)setTransitionDeviceCornerRadius:(double)a3;
- (void)setTransitionIconView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation HUCCCompactModuleContentViewController

- (HUCCCompactModuleContentViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCCCompactModuleContentViewController;
  v5 = [(CCUIButtonModuleViewController *)&v12 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:32.0];
    v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"homekit"];
    v9 = [v8 imageWithConfiguration:v7];
    v10 = [v9 imageWithRenderingMode:2];
    [(CCUIButtonModuleViewController *)v6 setGlyphImage:v10];
  }
  return v6;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HUCCCompactModuleContentViewController;
  [(CCUIButtonModuleViewController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemWhiteColor];
  id v4 = [(HUCCCompactModuleContentViewController *)self view];
  [v4 setTintColor:v3];

  MGGetFloat32Answer();
  [(HUCCCompactModuleContentViewController *)self setTransitionDeviceCornerRadius:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  [v5 moduleContentViewController:self viewWillAppear:v3];

  v7.receiver = self;
  v7.super_class = (Class)HUCCCompactModuleContentViewController;
  [(HUCCCompactModuleContentViewController *)&v7 viewWillAppear:v3];
  [(HUCCCompactModuleContentViewController *)self _setUpHomeControlService];
  objc_super v6 = [(CCUIButtonModuleViewController *)self buttonView];
  [v6 frame];
  -[HUCCCompactModuleContentViewController setTransitionCompressedAnimationStartFrame:](self, "setTransitionCompressedAnimationStartFrame:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUCCCompactModuleContentViewController *)self _tearDownHomeControlService];
  v6.receiver = self;
  v6.super_class = (Class)HUCCCompactModuleContentViewController;
  [(HUCCCompactModuleContentViewController *)&v6 viewDidDisappear:v3];
  float v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  [v5 moduleContentViewController:self viewDidDisappear:v3];
}

- (void)dealloc
{
  [(HUCCCompactModuleContentViewController *)self _tearDownHomeControlService];
  v3.receiver = self;
  v3.super_class = (Class)HUCCCompactModuleContentViewController;
  [(HUCCCompactModuleContentViewController *)&v3 dealloc];
}

- (void)setExpandedView:(id)a3
{
  id v8 = a3;
  p_expandedView = &self->_expandedView;
  expandedView = self->_expandedView;
  if (expandedView) {
    [(UIView *)expandedView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_expandedView, a3);
  if (*p_expandedView)
  {
    [(UIView *)*p_expandedView setAlpha:0.0];
    objc_super v7 = [(HUCCCompactModuleContentViewController *)self view];
    [v7 addSubview:*p_expandedView];
  }
}

- (void)resetToInitialState
{
  objc_super v3 = [(HUCCCompactModuleContentViewController *)self expandedView];
  [v3 setAlpha:0.0];

  [(HUCCCompactModuleContentViewController *)self setExpandedView:0];
  id v4 = [(CCUIButtonModuleViewController *)self buttonView];
  [v4 setAlpha:1.0];

  float v5 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
  [v5 removeFromParentViewController];

  [(HUCCCompactModuleContentViewController *)self setDashboardContainerViewController:0];
}

- (void)_setUpHomeControlService
{
  objc_super v3 = [(HUCCCompactModuleContentViewController *)self activeAssertion];
  if (!v3)
  {
    if (_os_feature_enabled_impl()) {
      return;
    }
    id v4 = [MEMORY[0x263F47B60] sharedDispatcher];
    float v5 = [v4 homeManager];
    objc_super v6 = [v5 _beginActiveAssertionWithReason:@"HUCCCompactModuleVisible"];
    [(HUCCCompactModuleContentViewController *)self setActiveAssertion:v6];

    objc_super v7 = [(HUCCCompactModuleContentViewController *)self activeAssertion];

    if (!v7) {
      return;
    }
    id v8 = [MEMORY[0x263F49B60] sharedInstance];
    [v8 launchServiceSuspendedWithUserInfo:MEMORY[0x263EFFA78]];

    v9 = [[HUCCDashboardContainerViewController alloc] initWithDelegate:self];
    [(HUCCCompactModuleContentViewController *)self setDashboardContainerViewController:v9];

    v10 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    v11 = [v10 view];
    [(HUCCCompactModuleContentViewController *)self setExpandedView:v11];

    objc_super v12 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    [(HUCCCompactModuleContentViewController *)self addChildViewController:v12];

    v13 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    [v13 didMoveToParentViewController:self];
    objc_super v3 = v13;
  }
}

- (void)_tearDownHomeControlService
{
  objc_super v3 = [(HUCCCompactModuleContentViewController *)self activeAssertion];

  if (v3)
  {
    [(CCUIButtonModuleViewController *)self setExpanded:0];
    id v4 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    [v4 stopRemoteViewController];

    [(HUCCCompactModuleContentViewController *)self resetToInitialState];
    float v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_240652000, v5, OS_LOG_TYPE_DEFAULT, "Terminating HomeControlService", v10, 2u);
    }

    objc_super v6 = [MEMORY[0x263F49B60] sharedInstance];
    [v6 dismissService];

    objc_super v7 = [MEMORY[0x263F47B60] sharedDispatcher];
    id v8 = [v7 homeManager];
    v9 = [(HUCCCompactModuleContentViewController *)self activeAssertion];
    [v8 _endActiveAssertion:v9];

    [(HUCCCompactModuleContentViewController *)self setActiveAssertion:0];
  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  BOOL v4 = [(HUCCCompactModuleContentViewController *)self accessAllowedForCurrentLockState];
  if (v4)
  {
    float v5 = [(HUCCCompactModuleContentViewController *)self expandedView];
    [v5 setAlpha:1.0];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2406544C0;
    v7[3] = &unk_2650CB3A0;
    v7[4] = self;
    [(HUCCCompactModuleContentViewController *)self requestAuthenticationIfLockedWithCompletionHandler:v7];
  }
  return v4;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  objc_super v3 = [MEMORY[0x263F47B60] sharedDispatcher];
  BOOL v4 = [v3 home];

  if ((_os_feature_enabled_impl() & 1) != 0 || (objc_msgSend(v4, "hf_hasVisibleAccessories") & 1) == 0)
  {
    [(HUCCCompactModuleContentViewController *)self _openHomeApp];
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)customAnimator
{
  objc_super v3 = [(UIViewPropertyAnimator *)[HUCCCompactModulePropertyAnimator alloc] initWithDuration:0 curve:0 animations:0.4];
  [(HUCCCompactModulePropertyAnimator *)v3 setDelegate:self];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:0 curve:0 animations:0.1];
  BOOL v5 = [(HUCCCompactModuleContentViewController *)self transitionIconView];

  if (!v5)
  {
    objc_super v6 = [(CCUIButtonModuleViewController *)self buttonView];
    objc_super v7 = [v6 snapshotViewAfterScreenUpdates:0];
    [(HUCCCompactModuleContentViewController *)self setTransitionIconView:v7];

    id v8 = [(HUCCCompactModuleContentViewController *)self transitionIconView];
    [v8 setContentMode:4];

    v9 = [(HUCCCompactModuleContentViewController *)self view];
    v10 = [(HUCCCompactModuleContentViewController *)self transitionIconView];
    [v9 addSubview:v10];
  }
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    v11 = [(CCUIButtonModuleViewController *)self buttonView];
    [v11 setAlpha:0.0];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_240654884;
    v18[3] = &unk_2650CB3C8;
    v18[4] = self;
    [(UIViewPropertyAnimator *)v3 addAnimations:v18];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_240654CFC;
    v16[3] = &unk_2650CB3F0;
    v16[4] = self;
    id v17 = v4;
    [(UIViewPropertyAnimator *)v3 addAnimations:v16];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_240654FB0;
  v14[3] = &unk_2650CB418;
  v14[4] = self;
  id v15 = v4;
  id v12 = v4;
  [(UIViewPropertyAnimator *)v3 addCompletion:v14];

  return v3;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HUCCCompactModuleContentViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v26, sel_willTransitionToExpandedContentMode_);
  BOOL v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  objc_super v6 = [v5 contentModuleContext];
  [v6 setHomeGestureDismissalAllowed:v3];

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    BOOL v7 = [(CCUIButtonModuleViewController *)self isExpanded];
    id v8 = [(CCUIButtonModuleViewController *)self buttonView];
    [v8 setHidden:v7];

    if ([(CCUIButtonModuleViewController *)self isExpanded]) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    v10 = [(CCUIButtonModuleViewController *)self buttonView];
    [v10 setAlpha:v9];

    uint64_t v11 = [(CCUIButtonModuleViewController *)self isExpanded] ^ 1;
    id v12 = [(HUCCCompactModuleContentViewController *)self expandedView];
    [v12 setHidden:v11];

    if ([(CCUIButtonModuleViewController *)self isExpanded]) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    v14 = [(HUCCCompactModuleContentViewController *)self expandedView];
    [v14 setAlpha:v13];

    [(HUCCCompactModuleContentViewController *)self _expandedContentFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [(HUCCCompactModuleContentViewController *)self expandedView];
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    v24 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    objc_msgSend(v24, "willBeginTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);

    v25 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    objc_msgSend(v25, "willFinishTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);
  }
}

- (CGRect)_iconViewInHomeGridCellFrame
{
  MEMORY[0x270F9A6D0](self, sel_transitionCompressedAnimationStartFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_iconViewInNavigationHeaderViewFrame
{
  double v4 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
  double v5 = [v4 transitionSubviewFrames];

  if ([v5 count])
  {
    objc_super v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F49AD0]];
    [v6 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2406573FC((uint64_t)self, a2, v15);
    }

    [(HUCCCompactModuleContentViewController *)self _iconViewInHomeGridCellFrame];
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
  }

  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_expandedContentFrame
{
  [(HUCCCompactModuleContentViewController *)self preferredExpandedContentWidth];
  double v4 = v3;
  [(HUCCCompactModuleContentViewController *)self preferredExpandedContentHeight];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)preferredExpandedContinuousCornerRadius
{
  if ([MEMORY[0x263F47C58] isAnIPad])
  {
    MEMORY[0x270F18850]();
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_transitionDeviceCornerRadius);
  }
  return result;
}

- (double)preferredExpandedContentHeight
{
  [(HUCCCompactModuleContentViewController *)self preferredExpandedSize];
  return v2;
}

- (CGSize)preferredExpandedSize
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    double v5 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    double v6 = [v5 view];
    [v6 frame];
    CGFloat Width = v7;
    double v9 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
    double v10 = [v9 view];
    [v10 frame];
    CGFloat Height = v11;
  }
  else
  {
    CCUIScreenBounds();
    CGFloat Width = CGRectGetWidth(v16);
    CCUIScreenBounds();
    CGFloat Height = CGRectGetHeight(v17);
  }
  double v13 = Width;
  double v14 = Height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_openHomeApp
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_24065552C;
  v2[3] = &unk_2650CB440;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)propertyAnimatorDidStartAnimating:(id)a3
{
  id v4 = [(HUCCCompactModuleContentViewController *)self dashboardContainerViewController];
  objc_msgSend(v4, "willBeginTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);
}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  id v4 = [v5 contentModuleContext];
  [v4 setHomeGestureDismissalAllowed:1];
}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  int v6 = [v5 isDeviceUnlockedForModuleContentViewController:self];

  if (v6)
  {
    v4[2](v4, 1);
  }
  else
  {
    double v7 = [(HUCCCompactModuleContentViewController *)self delegate];
    double v8 = [v7 contentModuleContext];

    if (v8)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = sub_24065575C;
      v9[3] = &unk_2650CB468;
      double v10 = v4;
      [v8 requestAuthenticationWithCompletionHandler:v9];
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

- (void)requestDismissal
{
  id v3 = [(HUCCCompactModuleContentViewController *)self delegate];
  double v2 = [v3 contentModuleContext];
  [v2 dismissModule];
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUCCCompactModuleContentViewController *)self delegate];
  id v4 = [v5 contentModuleContext];
  [v4 setHomeGestureDismissalAllowed:!v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)accessAllowedForCurrentLockState
{
  return self->_accessAllowedForCurrentLockState;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  self->_accessAllowedForCurrentLockState = a3;
}

- (NSObject)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(id)a3
{
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (HUCCDashboardContainerViewController)dashboardContainerViewController
{
  return self->_dashboardContainerViewController;
}

- (void)setDashboardContainerViewController:(id)a3
{
}

- (HUCCCompactModuleContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCCompactModuleContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
}

- (double)transitionDeviceCornerRadius
{
  return self->_transitionDeviceCornerRadius;
}

- (void)setTransitionDeviceCornerRadius:(double)a3
{
  self->_transitionDeviceCornerRadius = a3;
}

- (CGRect)transitionCompressedAnimationStartFrame
{
  double x = self->_transitionCompressedAnimationStartFrame.origin.x;
  double y = self->_transitionCompressedAnimationStartFrame.origin.y;
  double width = self->_transitionCompressedAnimationStartFrame.size.width;
  double height = self->_transitionCompressedAnimationStartFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTransitionCompressedAnimationStartFrame:(CGRect)a3
{
  self->_transitionCompressedAnimationStartFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dashboardContainerViewController, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);

  objc_storeStrong((id *)&self->_activeAssertion, 0);
}

@end