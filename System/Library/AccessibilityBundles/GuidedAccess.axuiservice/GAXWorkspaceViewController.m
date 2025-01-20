@interface GAXWorkspaceViewController
- (BOOL)eventStealerView:(id)a3 shouldStealEventAtPoint:(CGPoint)a4;
- (BOOL)isInterestAreaViewAccessibilityElementWithController:(id)a3;
- (BOOL)isTouchEnabled;
- (BOOL)isTransitionInProgress;
- (BOOL)navigationBarNeedsMiniMetricsInitialized;
- (BOOL)shouldDisplayMiniToolbarForController:(id)a3;
- (BOOL)usesResumeNavigationTitles;
- (CGRect)_adjustedBottomChromeViewFrame:(CGRect)a3;
- (CGRect)_adjustedTopChromeViewFrame:(CGRect)a3;
- (CGRect)boundsForConstrainingFingerPathInInterestAreaViewController:(id)a3;
- (CGSize)_instructionsLabelMaximumSize;
- (GAXFeatureViewController)featureViewController;
- (GAXInterestAreaViewController)interestAreaViewController;
- (GAXOverlayUserInterfaceViewController)overlayUserInterfaceViewController;
- (GAXPassthroughNavigationBar)navigationBar;
- (GAXStyleProvider)styleProvider;
- (GAXUIServer)userInterfaceServer;
- (GAXWorkspaceViewController)initWithCoder:(id)a3;
- (GAXWorkspaceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GAXWorkspaceViewController)initWithOverlayUserInterfaceViewController:(id)a3;
- (NSLayoutConstraint)featureVCOnscreenConstraint;
- (NSMutableArray)transitionContextQueue;
- (UIEdgeInsets)_hostedApplicationViewEdgeInsetsForLayoutMode:(int)a3 interfaceOrientation:(int64_t)a4;
- (UILabel)instructionsLabel;
- (UIStatusBar)statusBar;
- (UIView)hostedApplicationShadowView;
- (_UIBackdropView)statusAndNavigationBarBackgroundView;
- (double)_transitionDuration;
- (double)scaleForSpecialControlsInInterestAreaViewController:(id)a3;
- (double)statusBarHeight;
- (id)_instructionsLabelTextWhenTouchEnabled:(BOOL)a3;
- (id)_instructionsLabelWithText:(id)a3;
- (id)referenceViewForConvertingFromAndToWindowCoordinateSystemForInterestAreaViewController:(id)a3;
- (id)viewForPresentingOverlayUserInterfaceForFeatureViewController:(id)a3;
- (id)viewToCoverWithOutOfBoundsDrawingForInterestAreaViewWithController:(id)a3 edgeInsets:(UIEdgeInsets *)a4;
- (int)layoutMode;
- (int64_t)applicationInterfaceOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_getHostedApplicationViewParametersForLayoutMode:(int)a3 scaleFactor:(double *)a4 frame:(CGRect *)a5 targetSize:(CGSize)a6;
- (void)_handleDismissButtonTapped:(id)a3;
- (void)_handleStartButtonTapped:(id)a3;
- (void)_loadHostedApplicationShadowViewWithContainerView:(id)a3;
- (void)_loadInstructionsLabelWithContainerView:(id)a3;
- (void)_loadInterestAreaViewWithContainerView:(id)a3;
- (void)_loadNavigationBarWithContainerView:(id)a3;
- (void)_loadStatusAndNavigationBarBackgroundViewWithContainerView:(id)a3;
- (void)_loadStatusBarWithContainerView:(id)a3;
- (void)_loadSystemFeatureViewWithContainerView:(id)a3;
- (void)_performOrScheduleTransitionWithType:(int)a3 completion:(id)a4;
- (void)_performTransitionWithType:(int)a3 completion:(id)a4;
- (void)_updateEverythingForLayoutMode:(int)a3;
- (void)_updateHostedApplicationShadowView;
- (void)_updateHostedApplicationViewWithAnimationDuration:(double)a3 targetSize:(CGSize)a4;
- (void)_updateInstructionsLabel;
- (void)_updateInterestAreaView;
- (void)_updateNavigationBar;
- (void)_updateStatusAndNavigationBarBackgroundView;
- (void)_updateStatusBar;
- (void)_updateSystemFeatureView;
- (void)_willBeginTransitionWithType:(int)a3;
- (void)archiveInterestAreaPathsForStorageInterestAreaViewController:(id)a3;
- (void)dealloc;
- (void)featureViewController:(id)a3 touchSystemFeatureDidChange:(BOOL)a4;
- (void)getInterestAreaPathForFingerPath:(id)a3 interestAreaViewController:(id)a4 completion:(id)a5;
- (void)interestAreaViewController:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4;
- (void)interestAreaViewController:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)loadView;
- (void)releaseOutlets;
- (void)setFeatureVCOnscreenConstraint:(id)a3;
- (void)setFeatureViewController:(id)a3;
- (void)setHostedApplicationShadowView:(id)a3;
- (void)setInstructionsLabel:(id)a3;
- (void)setInterestAreaViewController:(id)a3;
- (void)setLayoutMode:(int)a3;
- (void)setNavigationBar:(id)a3;
- (void)setOverlayUserInterfaceViewController:(id)a3;
- (void)setStatusAndNavigationBarBackgroundView:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTransitionContextQueue:(id)a3;
- (void)setTransitionInProgress:(BOOL)a3;
- (void)setUserInterfaceServer:(id)a3;
- (void)setUsesResumeNavigationTitles:(BOOL)a3;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GAXWorkspaceViewController

- (GAXWorkspaceViewController)initWithOverlayUserInterfaceViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GAXWorkspaceViewController;
  v5 = [(GAXViewController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = GAXLocString(@"GUIDED_ACCESS_TITLE");
      [(GAXWorkspaceViewController *)v6 setTitle:v7];

      [(GAXWorkspaceViewController *)v6 setOverlayUserInterfaceViewController:v4];
      v8 = objc_opt_new();
      [v8 setAllowsDimmingInterestAreaPaths:0];
      [v8 setEditing:0];
      [v8 setDelegate:v6];
      [v4 addChildViewController:v8];
      [v8 didMoveToParentViewController:v4];
      [(GAXWorkspaceViewController *)v6 setInterestAreaViewController:v8];
    }
    else
    {
      v8 = v5;
      v6 = 0;
    }
  }
  return v6;
}

- (GAXWorkspaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)GAXWorkspaceViewController;
  id v4 = [(GAXViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {

  }
  return 0;
}

- (GAXWorkspaceViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GAXWorkspaceViewController;
  v3 = [(GAXViewController *)&v5 initWithCoder:a3];
  if (v3) {

  }
  return 0;
}

- (void)dealloc
{
  v3 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  [v3 setDelegate:0];

  id v4 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  if ([v4 isViewLoaded])
  {
    objc_super v5 = [v4 interestAreaView];
    [v5 setEventStealerViewDelegate:0];

    objc_super v6 = [v4 view];
    [v6 removeFromSuperview];
  }
  [v4 willMoveToParentViewController:0];
  [v4 removeFromParentViewController];

  v7.receiver = self;
  v7.super_class = (Class)GAXWorkspaceViewController;
  [(GAXViewController *)&v7 dealloc];
}

- (void)setUserInterfaceServer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceServer);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_userInterfaceServer, obj);
    objc_super v5 = [(GAXWorkspaceViewController *)self featureViewController];
    [v5 setUserInterfaceServer:obj];

    uint64_t v6 = [(GAXWorkspaceViewController *)self isTouchEnabled] ^ 1;
    objc_super v7 = [(GAXWorkspaceViewController *)self interestAreaViewController];
    [v7 setBackgroundShouldCoverEverything:v6];
  }
}

- (void)setStyleProvider:(id)a3
{
  uint64_t v6 = (GAXStyleProvider *)a3;
  if (self->_styleProvider != v6)
  {
    objc_storeStrong((id *)&self->_styleProvider, a3);
    objc_super v5 = [(GAXWorkspaceViewController *)self interestAreaViewController];
    [v5 setStyleProvider:v6];
  }
}

- (double)statusBarHeight
{
  v2 = [(GAXWorkspaceViewController *)self statusBar];
  [v2 bounds];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (int64_t)applicationInterfaceOrientation
{
  v2 = +[AXUIDisplayManager sharedDisplayManager];
  id v3 = [v2 activeInterfaceOrientation];

  return (int64_t)v3;
}

- (BOOL)navigationBarNeedsMiniMetricsInitialized
{
  id v3 = [(GAXWorkspaceViewController *)self styleProvider];
  id v4 = v3;
  if (v3)
  {
    if ([v3 workspaceNavigationBarNeedsMiniMetricsInitialized])
    {
      int64_t v5 = [(GAXWorkspaceViewController *)self applicationInterfaceOrientation];
      char v6 = (unint64_t)(v5 - 1) > 3 || (unint64_t)(v5 - 3) < 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isTouchEnabled
{
  v2 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  unsigned __int8 v3 = [v2 allowsTouch];

  return v3;
}

- (void)loadView
{
  unsigned __int8 v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double Width = v10;

  if ((char *)[(GAXWorkspaceViewController *)self interfaceOrientation] - 3 <= (unsigned char *)&dword_0 + 1)
  {
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = Width;
    CGFloat Height = CGRectGetHeight(v20);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = Width;
    double Width = CGRectGetWidth(v21);
    double v9 = Height;
  }
  id v18 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, Width);
  [v18 setAutoresizingMask:18];
  [v18 setUserInteractionEnabled:1];
  v13 = [v18 layer];
  [v13 setHitTestsAsOpaque:1];

  [(GAXWorkspaceViewController *)self _loadNavigationBarWithContainerView:v18];
  [(GAXWorkspaceViewController *)self _loadStatusAndNavigationBarBackgroundViewWithContainerView:v18];
  v14 = [(GAXWorkspaceViewController *)self styleProvider];
  unsigned int v15 = [v14 workspaceInstructionsLabelShouldBeDisplayed];

  if (v15) {
    [(GAXWorkspaceViewController *)self _loadInstructionsLabelWithContainerView:v18];
  }
  [(GAXWorkspaceViewController *)self _loadSystemFeatureViewWithContainerView:v18];
  [(GAXWorkspaceViewController *)self _loadStatusBarWithContainerView:v18];
  [(GAXWorkspaceViewController *)self _loadHostedApplicationShadowViewWithContainerView:v18];
  v16 = [(GAXWorkspaceViewController *)self overlayUserInterfaceViewController];
  v17 = [v16 view];
  [(GAXWorkspaceViewController *)self _loadInterestAreaViewWithContainerView:v17];

  [(GAXWorkspaceViewController *)self _updateEverythingForLayoutMode:1];
  [(GAXViewController *)self setView:v18];
}

- (void)viewDidUnload
{
  v3.receiver = self;
  v3.super_class = (Class)GAXWorkspaceViewController;
  [(GAXViewController *)&v3 viewDidUnload];
  [(GAXWorkspaceViewController *)self setLayoutMode:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GAXWorkspaceViewController;
  [(GAXWorkspaceViewController *)&v7 viewWillAppear:a3];
  int64_t v4 = [(GAXWorkspaceViewController *)self applicationInterfaceOrientation];
  if ((unint64_t)(v4 - 1) <= 3)
  {
    int64_t v5 = v4;
    double v6 = [(GAXWorkspaceViewController *)self statusBar];
    [v6 setOrientation:v5];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GAXWorkspaceViewController;
  [(GAXWorkspaceViewController *)&v3 viewDidLayoutSubviews];
  [(GAXWorkspaceViewController *)self _updateInterestAreaView];
  [(GAXWorkspaceViewController *)self _updateHostedApplicationShadowView];
  [(GAXWorkspaceViewController *)self _updateInstructionsLabel];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GAXWorkspaceViewController;
  -[GAXWorkspaceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  double v9 = [v8 view];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2301C;
  v11[3] = &unk_5D998;
  v11[4] = self;
  id v12 = v7;
  double v13 = width;
  double v14 = height;
  id v10 = v7;
  [v10 animateAlongsideTransitionInView:v9 animation:v11 completion:&stru_5D9D8];
}

- (void)releaseOutlets
{
  v4.receiver = self;
  v4.super_class = (Class)GAXWorkspaceViewController;
  [(GAXViewController *)&v4 releaseOutlets];
  objc_super v3 = [(GAXWorkspaceViewController *)self featureViewController];
  [v3 setDelegate:0];
  [(GAXWorkspaceViewController *)self setFeatureViewController:0];
  [(GAXWorkspaceViewController *)self setStatusBar:0];
  [(GAXWorkspaceViewController *)self setNavigationBar:0];
  [(GAXWorkspaceViewController *)self setStatusAndNavigationBarBackgroundView:0];
  [(GAXWorkspaceViewController *)self setInstructionsLabel:0];
  [(GAXWorkspaceViewController *)self setHostedApplicationShadowView:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)_handleStartButtonTapped:(id)a3
{
  id v3 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v3 transitionToMode:2];
}

- (void)_handleDismissButtonTapped:(id)a3
{
  id v3 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v3 transitionToMode:0];
}

- (id)_instructionsLabelWithText:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(GAXWorkspaceViewController *)self styleProvider];
  double v6 = [v5 workspaceInstructionsLabelFont];
  id v7 = +[GAXInterfaceUtilities labelWithText:v4 font:v6 allowMultipleLines:1 styleProvider:v5];

  [v7 setAutoresizingMask:0];

  return v7;
}

- (id)_instructionsLabelTextWhenTouchEnabled:(BOOL)a3
{
  if (a3)
  {
    GAXLocString(@"HELP_INTEREST_AREA");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_5E940;
  }
  return v4;
}

- (CGSize)_instructionsLabelMaximumSize
{
  uint64_t v3 = [(GAXWorkspaceViewController *)self instructionsLabel];
  id v4 = [v3 superview];

  int64_t v5 = [(GAXWorkspaceViewController *)self styleProvider];
  objc_msgSend(v5, "hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:", -[GAXWorkspaceViewController interfaceOrientation](self, "interfaceOrientation"));
  double v7 = v6;
  double v9 = v8;
  [v5 workspaceInstructionsLabelEdgeInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v4 bounds];
  double v19 = v18;
  double v21 = v20;
  v22 = [(GAXWorkspaceViewController *)self navigationBar];
  [v22 frame];
  double v23 = v21 - CGRectGetMaxY(v43);

  double v24 = v23 - v7 - v9 - v11 - v15;
  double v25 = v19 - v13 - v17;
  v26 = [(GAXWorkspaceViewController *)self featureViewController];
  v27 = [v26 view];
  [v27 frame];
  double v28 = v24 - CGRectGetHeight(v44);

  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  v31 = [v5 workspaceInstructionsLabelFont];
  v41[0] = [(GAXWorkspaceViewController *)self _instructionsLabelTextWhenTouchEnabled:0];
  char v32 = 1;
  uint64_t v33 = [(GAXWorkspaceViewController *)self _instructionsLabelTextWhenTouchEnabled:1];
  uint64_t v34 = 0;
  v41[1] = v33;
  do
  {
    char v35 = v32;
    +[GAXInterfaceUtilities labelSizeThatFitsText:constrainedToSize:font:styleProvider:](GAXInterfaceUtilities, "labelSizeThatFitsText:constrainedToSize:font:styleProvider:", v41[v34], v31, v5, v25, v28);
    char v32 = 0;
    if (width < v36) {
      double width = v36;
    }
    if (height < v37) {
      double height = v37;
    }
    uint64_t v34 = 1;
  }
  while ((v35 & 1) != 0);
  for (uint64_t i = 1; i != -1; --i)

  double v39 = width;
  double v40 = height;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (UIEdgeInsets)_hostedApplicationViewEdgeInsetsForLayoutMode:(int)a3 interfaceOrientation:(int64_t)a4
{
  double top = UIEdgeInsetsZero.top;
  CGFloat left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  CGFloat right = UIEdgeInsetsZero.right;
  double v11 = [(GAXWorkspaceViewController *)self styleProvider];
  double v12 = v11;
  if (a3 == 2 && v11)
  {
    [v11 hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:a4];
    double v14 = v13;
    CGFloat left = v15;
    double v17 = v16;
    CGFloat right = v18;
    double v19 = [(GAXWorkspaceViewController *)self navigationBar];
    [v19 frame];
    double MaxY = CGRectGetMaxY(v36);

    if ([v12 workspaceInstructionsLabelShouldBeDisplayed])
    {
      [v12 workspaceInstructionsLabelEdgeInsets];
      double v22 = v17 + v21;
      [v12 workspaceInstructionsLabelEdgeInsets];
      double v24 = v22 + v23;
      [(GAXWorkspaceViewController *)self _instructionsLabelMaximumSize];
      double v17 = v24 + v25;
    }
    double top = v14 + MaxY;
    v26 = [(GAXWorkspaceViewController *)self featureViewController];
    v27 = [v26 view];
    double v28 = [(GAXWorkspaceViewController *)self viewIfLoaded];
    [v28 frame];
    objc_msgSend(v27, "systemLayoutSizeFittingSize:", v29, 0.0);
    double v31 = v30;

    double bottom = v17 + v31;
  }

  double v32 = top;
  double v33 = left;
  double v34 = bottom;
  double v35 = right;
  result.CGFloat right = v35;
  result.double bottom = v34;
  result.CGFloat left = v33;
  result.double top = v32;
  return result;
}

- (void)_getHostedApplicationViewParametersForLayoutMode:(int)a3 scaleFactor:(double *)a4 frame:(CGRect *)a5 targetSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v10 = *(void *)&a3;
  id v33 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  double v12 = [v33 view];
  [v12 bounds];
  BOOL v15 = CGSizeZero.width == width;
  BOOL v16 = CGSizeZero.height == height;
  if (v15 && v16) {
    double v17 = v14;
  }
  else {
    double v17 = height;
  }
  if (v15 && v16) {
    double v18 = v13;
  }
  else {
    double v18 = width;
  }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double v21 = [(GAXWorkspaceViewController *)self styleProvider];
  if (v21)
  {
    double v22 = [v12 window];
    double v23 = [v22 safeValueForKey:@"_toWindowOrientation"];
    uint64_t v24 = (int)[v23 intValue];

    [(GAXWorkspaceViewController *)self _hostedApplicationViewEdgeInsetsForLayoutMode:v10 interfaceOrientation:v24];
    double x = CGRectZero.origin.x + v25;
    double y = y + v26;
    double v28 = v18 - (v25 + v27);
    double v30 = v17 - (v26 + v29);
    v35.origin.double x = CGRectZero.origin.x + v25;
    v35.origin.double y = y;
    v35.size.double width = v28;
    v35.size.double height = v30;
    double v31 = CGRectGetWidth(v35) / v18;
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = v28;
    v36.size.double height = v30;
    CGFloat v32 = CGRectGetHeight(v36) / v17;
    if (v31 < v32) {
      CGFloat v32 = v31;
    }
    double v17 = v30;
    double v18 = v28;
    if (a4) {
      goto LABEL_11;
    }
  }
  else
  {
    CGFloat v32 = 1.0;
    if (a4) {
LABEL_11:
    }
      *a4 = v32;
  }
  if (a5)
  {
    a5->origin.double x = x;
    a5->origin.double y = y;
    a5->size.double width = v18;
    a5->size.double height = v17;
  }
}

- (CGRect)_adjustedTopChromeViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(GAXWorkspaceViewController *)self layoutMode] == 1)
  {
    [(GAXWorkspaceViewController *)self _hostedApplicationViewEdgeInsetsForLayoutMode:2 interfaceOrientation:[(GAXWorkspaceViewController *)self interfaceOrientation]];
    double y = y - v8;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.double y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)_adjustedBottomChromeViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(GAXWorkspaceViewController *)self layoutMode] == 1)
  {
    [(GAXWorkspaceViewController *)self _hostedApplicationViewEdgeInsetsForLayoutMode:2 interfaceOrientation:[(GAXWorkspaceViewController *)self interfaceOrientation]];
    double y = y + v8;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.double y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)_loadStatusBarWithContainerView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  +[GAXInterfaceUtilities statusBarWithStyle:containerViewBounds:](GAXInterfaceUtilities, "statusBarWithStyle:containerViewBounds:", 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addSubview:v5];

  [(GAXWorkspaceViewController *)self setStatusBar:v5];
}

- (void)_loadNavigationBarWithContainerView:(id)a3
{
  id v27 = a3;
  id v4 = -[GAXPassthroughNavigationBar initWithFrame:]([GAXPassthroughNavigationBar alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(GAXPassthroughNavigationBar *)v4 sizeToFit];
  [(GAXPassthroughNavigationBar *)v4 setAutoresizingMask:34];
  v30.CGFloat width = 1.0;
  v30.CGFloat height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  id v5 = UIGraphicsGetImageFromCurrentImageContext();
  double v26 = objc_msgSend(v5, "resizableImageWithCapInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  UIGraphicsEndImageContext();
  [(GAXPassthroughNavigationBar *)v4 setBackgroundImage:v26 forBarMetrics:0];
  [(GAXPassthroughNavigationBar *)v4 setBackgroundImage:v26 forBarMetrics:1];
  double v6 = [(GAXWorkspaceViewController *)self styleProvider];
  v28[0] = NSFontAttributeName;
  double v7 = [v6 workspaceNavigationBarTitleFont];
  v29[0] = v7;
  v28[1] = NSForegroundColorAttributeName;
  double v8 = [v6 defaultLabelTextColor];
  v29[1] = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  [(GAXPassthroughNavigationBar *)v4 setTitleTextAttributes:v9];

  id v10 = objc_alloc((Class)UINavigationItem);
  double v11 = [(GAXWorkspaceViewController *)self title];
  id v12 = [v10 initWithTitle:v11];

  [v12 setHidesBackButton:1];
  unsigned int v13 = [(GAXWorkspaceViewController *)self usesResumeNavigationTitles];
  BOOL v14 = v13 == 0;
  if (v13) {
    BOOL v15 = @"END";
  }
  else {
    BOOL v15 = @"CANCEL";
  }
  if (v14) {
    BOOL v16 = @"START";
  }
  else {
    BOOL v16 = @"RESUME";
  }
  double v25 = GAXLocString(v15);
  id v17 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v25 style:0 target:self action:"_handleDismissButtonTapped:"];
  double v18 = [v6 workspaceNavigationBarButtonTextAttributes];
  [v17 setTitleTextAttributes:v18 forState:0];

  [v6 workspaceNavigationBarDismissButtonMinimumWidth];
  objc_msgSend(v17, "_setMinimumWidth:");
  id v19 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v17, 0);
  [v12 setLeftBarButtonItems:v19 animated:0];
  double v20 = GAXLocString(v16);
  id v21 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v20 style:2 target:self action:"_handleStartButtonTapped:"];
  double v22 = [v6 workspaceNavigationBarButtonTextAttributes];
  [v21 setTitleTextAttributes:v22 forState:0];

  id v23 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v21, 0);
  [v12 setRightBarButtonItems:v23 animated:0];
  id v24 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v12, 0);
  [(GAXPassthroughNavigationBar *)v4 setItems:v24 animated:0];
  [v27 addSubview:v4];

  [(GAXWorkspaceViewController *)self setNavigationBar:v4];
}

- (void)_loadStatusAndNavigationBarBackgroundViewWithContainerView:(id)a3
{
  id v6 = a3;
  id v4 = [objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2030];
  [v4 setAutoresizingMask:34];
  id v5 = [(GAXWorkspaceViewController *)self navigationBar];
  if (v5 && [v6 containsView:v5]) {
    [v6 insertSubview:v4 belowSubview:v5];
  }
  else {
    [v6 addSubview:v4];
  }
  [(GAXWorkspaceViewController *)self setStatusAndNavigationBarBackgroundView:v4];
}

- (void)_loadHostedApplicationShadowViewWithContainerView:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  [v7 setAutoresizingMask:0];
  id v5 = [(GAXWorkspaceViewController *)self styleProvider];
  id v6 = [v5 hostedApplicationShadowColor];
  [v7 setBackgroundColor:v6];

  [v7 setAlpha:0.0];
  [v4 addSubview:v7];

  [(GAXWorkspaceViewController *)self setHostedApplicationShadowView:v7];
}

- (void)_loadInterestAreaViewWithContainerView:(id)a3
{
  id v4 = a3;
  id v8 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  id v5 = [v8 interestAreaView];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:0];
  [v4 bounds];
  objc_msgSend(v5, "setContentsBounds:");
  id v6 = [(GAXWorkspaceViewController *)self styleProvider];
  [v6 applicationViewRoundedCornerRadius];
  objc_msgSend(v5, "setContentsCornerRadius:");

  [v5 setShouldStealAllEvents:0];
  [v5 setEventStealerViewDelegate:self];
  id v7 = [v5 layer];
  [v7 setHitTestsAsOpaque:1];

  [v4 addSubview:v5];
}

- (void)_loadInstructionsLabelWithContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXWorkspaceViewController *)self _instructionsLabelTextWhenTouchEnabled:[(GAXWorkspaceViewController *)self isTouchEnabled]];
  id v6 = [(GAXWorkspaceViewController *)self _instructionsLabelWithText:v5];

  [v4 addSubview:v6];
  [(GAXWorkspaceViewController *)self setInstructionsLabel:v6];
}

- (void)_loadSystemFeatureViewWithContainerView:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(GAXWorkspaceViewController *)self styleProvider];
  [v5 setStyleProvider:v6];

  [v5 setDelegate:self];
  id v7 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v5 setUserInterfaceServer:v7];

  id v8 = [v5 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXWorkspaceViewController *)self addChildViewController:v5];
  [v4 addSubview:v8];
  [v5 didMoveToParentViewController:self];
  [(GAXWorkspaceViewController *)self setFeatureViewController:v5];
  double v9 = [(GAXWorkspaceViewController *)self styleProvider];
  [v9 featureViewControllerHeight];
  double v11 = v10;

  id v12 = [v8 heightAnchor];
  unsigned int v13 = [v12 constraintLessThanOrEqualToConstant:v11];

  CGSize v30 = v13;
  LODWORD(v14) = 1132068864;
  [v13 setPriority:v14];
  BOOL v15 = [v8 bottomAnchor];
  BOOL v16 = [v4 bottomAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];
  [(GAXWorkspaceViewController *)self setFeatureVCOnscreenConstraint:v17];

  double v18 = [v8 topAnchor];
  id v19 = [v4 bottomAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19];

  LODWORD(v21) = 1132068864;
  [v20 setPriority:v21];
  v31[0] = v13;
  double v29 = [v8 widthAnchor];
  double v22 = [v4 widthAnchor];
  id v23 = [v29 constraintEqualToAnchor:v22];
  v31[1] = v23;
  id v24 = [v8 leadingAnchor];
  double v25 = [v4 leadingAnchor];

  double v26 = [v24 constraintEqualToAnchor:v25];
  v31[2] = v26;
  id v27 = [(GAXWorkspaceViewController *)self featureVCOnscreenConstraint];
  v31[3] = v27;
  v31[4] = v20;
  double v28 = +[NSArray arrayWithObjects:v31 count:5];

  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)_updateStatusBar
{
  id v15 = [(GAXWorkspaceViewController *)self statusBar];
  [v15 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[GAXWorkspaceViewController _adjustedTopChromeViewFrame:](self, "_adjustedTopChromeViewFrame:", CGPointZero.x, CGPointZero.y);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  if (!CGRectEqualToRect(v17, v18)) {
    objc_msgSend(v15, "setFrame:", x, y, width, height);
  }
}

- (void)_updateNavigationBar
{
  id v22 = [(GAXWorkspaceViewController *)self navigationBar];
  [v22 frame];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(GAXWorkspaceViewController *)self viewIfLoaded];
  [v11 safeAreaInsets];
  double v13 = v12 + 0.0;

  -[GAXWorkspaceViewController _adjustedTopChromeViewFrame:](self, "_adjustedTopChromeViewFrame:", v4, v13, v8, v10);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [v22 superview];
  [v20 bounds];
  double Width = CGRectGetWidth(v24);

  v25.origin.double x = v15;
  v25.origin.double y = v17;
  v25.size.double width = Width;
  v25.size.double height = v19;
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  if (!CGRectEqualToRect(v25, v26)) {
    objc_msgSend(v22, "setFrame:", v15, v17, Width, v19);
  }
}

- (void)_updateStatusAndNavigationBarBackgroundView
{
  id v25 = [(GAXWorkspaceViewController *)self navigationBar];
  [v25 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(GAXWorkspaceViewController *)self statusBar];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v27.origin.double x = v4;
  v27.origin.double y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  v30.origin.double x = v13;
  v30.origin.double y = v15;
  v30.size.double width = v17;
  v30.size.double height = v19;
  CGRect v28 = CGRectUnion(v27, v30);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  CGRect v24 = [(GAXWorkspaceViewController *)self statusAndNavigationBarBackgroundView];
  [v24 frame];
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  if (!CGRectEqualToRect(v29, v31)) {
    objc_msgSend(v24, "setFrame:", x, y, width, height);
  }
}

- (void)_updateHostedApplicationShadowView
{
  double v3 = [(GAXWorkspaceViewController *)self hostedApplicationShadowView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  CGFloat v8 = [v3 superview];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setBounds:", v5, v7, v10, v12);
  uint64_t v13 = [(GAXWorkspaceViewController *)self layoutMode];
  CGSize size = CGRectZero.size;
  v20.origin = CGRectZero.origin;
  v20.CGSize size = size;
  sdouble x = 1.0;
  -[GAXWorkspaceViewController _getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:](self, "_getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:", v13, &sx, &v20, CGSizeZero.width, CGSizeZero.height);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, sx, sx);
  double MidX = CGRectGetMidX(v20);
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v20));
  CGAffineTransform v17 = v18;
  [v3 setTransform:&v17];
  double v16 = 0.0;
  if (v13 == 2) {
    double v16 = 1.0;
  }
  [v3 setAlpha:v16];
}

- (void)_updateInterestAreaView
{
  double v3 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  double v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v4 superview];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v4, "setBounds:", v6, v8, v11, v13);
  uint64_t v14 = [(GAXWorkspaceViewController *)self layoutMode];
  CGSize size = CGRectZero.size;
  v23.origin = CGRectZero.origin;
  v23.CGSize size = size;
  sdouble x = 1.0;
  -[GAXWorkspaceViewController _getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:](self, "_getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:", v14, &sx, &v23, CGSizeZero.width, CGSizeZero.height);
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, sx, sx);
  double MidX = CGRectGetMidX(v23);
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v23));
  CGAffineTransform v20 = v21;
  [v4 setTransform:&v20];
  [(GAXWorkspaceViewController *)self scaleForSpecialControlsInInterestAreaViewController:v3];
  double v18 = v17;
  CGFloat v19 = [v3 interestAreaView];
  [v19 setBackgroundPatternScaleFactor:v18];
}

- (void)_updateInstructionsLabel
{
  double v3 = [(GAXWorkspaceViewController *)self instructionsLabel];
  uint64_t v4 = [(GAXWorkspaceViewController *)self styleProvider];
  double v5 = (void *)v4;
  if (v3 && v4)
  {
    CGSize size = CGRectZero.size;
    v40.origin = CGRectZero.origin;
    v40.CGSize size = size;
    -[GAXWorkspaceViewController _getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:](self, "_getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:", 2, 0, &v40, CGSizeZero.width, CGSizeZero.height);
    double v7 = [v3 superview];
    [v7 bounds];
    CGFloat v9 = v8;
    CGFloat v36 = v10;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    [v5 workspaceInstructionsLabelEdgeInsets];
    double v16 = v15;
    CGFloat v18 = v17;
    double v37 = v20;
    double v39 = v19;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    double MaxY = CGRectGetMaxY(v40);
    objc_msgSend(v5, "hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:", -[GAXWorkspaceViewController interfaceOrientation](self, "interfaceOrientation"));
    CGFloat v25 = v16 + MaxY + v24;
    v41.origin.double x = v9;
    v41.origin.double y = v36;
    v41.size.CGFloat width = v12;
    v41.size.CGFloat height = v14;
    double v35 = CGRectGetWidth(v41);
    v42.origin.double x = v18;
    v42.origin.double y = v25;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double v38 = v35 - CGRectGetMinX(v42) - v37;
    v43.origin.double x = v9;
    v43.origin.double y = v36;
    v43.size.CGFloat width = v12;
    v43.size.CGFloat height = v14;
    double v26 = CGRectGetHeight(v43);
    v44.origin.double x = v18;
    v44.origin.double y = v25;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v27 = v26 - CGRectGetMinY(v44) - v39;
    CGRect v28 = [(GAXWorkspaceViewController *)self featureViewController];
    CGRect v29 = [v28 view];
    [v29 frame];
    double v30 = v27 - CGRectGetHeight(v45);

    v46.origin.double x = v18;
    v46.origin.double y = v25;
    v46.size.CGFloat width = v38;
    v46.size.CGFloat height = v30;
    double MidX = CGRectGetMidX(v46);
    v47.origin.double x = v18;
    v47.origin.double y = v25;
    v47.size.CGFloat width = v38;
    v47.size.CGFloat height = v30;
    double MidY = CGRectGetMidY(v47);
    if ((char *)[(GAXWorkspaceViewController *)self applicationInterfaceOrientation]
       - 3 < (unsigned char *)&dword_0 + 2)
      double MidY = MidY + 7.0;
    objc_msgSend(v3, "sizeThatFits:", v38, v30, *(void *)&v35);
    -[GAXWorkspaceViewController _adjustedBottomChromeViewFrame:](self, "_adjustedBottomChromeViewFrame:", MidX - v33 * 0.5, MidY - v34 * 0.5, v33);
    CGRect v49 = CGRectIntegral(v48);
    objc_msgSend(v3, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  }
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)GAXWorkspaceViewController;
  [(GAXWorkspaceViewController *)&v3 updateViewConstraints];
  [(GAXWorkspaceViewController *)self _updateSystemFeatureView];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v4 = [(GAXWorkspaceViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)_updateSystemFeatureView
{
  BOOL v3 = [(GAXWorkspaceViewController *)self layoutMode] != 1;
  id v4 = [(GAXWorkspaceViewController *)self featureVCOnscreenConstraint];
  [v4 setActive:v3];
}

- (void)_updateHostedApplicationViewWithAnimationDuration:(double)a3 targetSize:(CGSize)a4
{
  double width = a4.width;
  CGSize size = CGRectZero.size;
  v19.origin = CGRectZero.origin;
  v19.CGSize size = size;
  double v18 = 1.0;
  -[GAXWorkspaceViewController _getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:](self, "_getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:", [(GAXWorkspaceViewController *)self layoutMode], &v18, &v19, width, a4.height);
  double MidX = CGRectGetMidX(v19);
  double MidY = CGRectGetMidY(v19);
  double v10 = [(GAXWorkspaceViewController *)self overlayUserInterfaceViewController];
  double v11 = [v10 view];

  CGFloat v12 = [v11 window];
  objc_msgSend(v11, "convertPoint:toView:", v12, MidX, MidY);
  objc_msgSend(v12, "convertPoint:toWindow:", 0);
  double v14 = v13;
  double v16 = v15;
  double v17 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  objc_msgSend(v17, "updateHostedApplicationStateWithScaleFactor:center:animationDuration:", v18, v14, v16, a3);
}

- (void)_updateEverythingForLayoutMode:(int)a3
{
  [(GAXWorkspaceViewController *)self setLayoutMode:*(void *)&a3];
  [(GAXWorkspaceViewController *)self _updateStatusBar];
  [(GAXWorkspaceViewController *)self _updateNavigationBar];
  [(GAXWorkspaceViewController *)self _updateStatusAndNavigationBarBackgroundView];
  [(GAXWorkspaceViewController *)self _updateInterestAreaView];
  [(GAXWorkspaceViewController *)self _updateHostedApplicationShadowView];
  [(GAXWorkspaceViewController *)self _updateInstructionsLabel];

  [(GAXWorkspaceViewController *)self _updateSystemFeatureView];
}

- (void)_willBeginTransitionWithType:(int)a3
{
  id v9 = [(GAXWorkspaceViewController *)self featureViewController];
  double v5 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  double v6 = v5;
  switch(a3)
  {
    case 1:
    case 3:
      [v5 transitionIn];
      break;
    case 2:
      [v9 dismissOptionsAnimated:1];
      uint64_t v7 = [(GAXWorkspaceViewController *)self isTouchEnabled] ^ 1;
      double v8 = v6;
      goto LABEL_5;
    case 4:
      [v9 dismissOptionsAnimated:1];
      double v8 = v6;
      uint64_t v7 = 1;
LABEL_5:
      [v8 transitionOutIncludingBackground:v7];
      break;
    default:
      break;
  }
}

- (double)_transitionDuration
{
  v2 = [(GAXWorkspaceViewController *)self styleProvider];
  [v2 defaultAnimationDuration];
  double v4 = v3;

  return v4;
}

- (void)_performTransitionWithType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  double v6 = (void (**)(id, uint64_t))a4;
  if ((v4 - 1) > 3) {
    int v7 = 0;
  }
  else {
    int v7 = dword_45940[(int)v4 - 1];
  }
  if (v7 == [(GAXWorkspaceViewController *)self layoutMode])
  {
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else
  {
    [(GAXWorkspaceViewController *)self _willBeginTransitionWithType:v4];
    [(GAXWorkspaceViewController *)self _transitionDuration];
    double v9 = v8;
    if (GAXUserInterfaceIdiomIsPhone())
    {
      double v10 = [(GAXWorkspaceViewController *)self overlayUserInterfaceViewController];
      double v11 = [v10 parentViewController];

      if (v11)
      {
        do
        {
          CGFloat v12 = [v10 parentViewController];

          double v13 = [v12 parentViewController];

          double v10 = v12;
        }
        while (v13);
      }
      else
      {
        CGFloat v12 = v10;
      }
      id v14 = [v12 interfaceOrientation];
      double v15 = +[AXUIDisplayManager sharedDisplayManager];
      id v16 = [v15 activeInterfaceOrientation];

      if (v14 != v16)
      {
        double v17 = +[AXUIDisplayManager sharedDisplayManager];
        objc_msgSend(v12, "setInterfaceOrientation:", objc_msgSend(v17, "activeInterfaceOrientation"));

        [v12 setNeedsUpdateOfSupportedInterfaceOrientations];
      }
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2513C;
    v21[3] = &unk_5DA00;
    v21[4] = self;
    int v22 = v7;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_25198;
    v18[3] = &unk_5DA28;
    v18[4] = self;
    int v20 = v4;
    CGRect v19 = v6;
    +[UIView animateWithDuration:v21 animations:v18 completion:v9];
    -[GAXWorkspaceViewController _updateHostedApplicationViewWithAnimationDuration:targetSize:](self, "_updateHostedApplicationViewWithAnimationDuration:targetSize:", v9, CGSizeZero.width, CGSizeZero.height);
  }
}

- (void)_performOrScheduleTransitionWithType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(GAXWorkspaceViewController *)self isTransitionInProgress])
  {
    int v7 = [(GAXWorkspaceViewController *)self transitionContextQueue];
    if (!v7)
    {
      int v7 = objc_opt_new();
      [(GAXWorkspaceViewController *)self setTransitionContextQueue:v7];
    }
    double v8 = objc_opt_new();
    [v8 setType:v4];
    [v8 setCompletion:v6];
    objc_msgSend(v7, "ax_enqueueObject:", v8);
  }
  else
  {
    [(GAXWorkspaceViewController *)self setTransitionInProgress:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_25320;
    v9[3] = &unk_5DA50;
    v9[4] = self;
    id v10 = v6;
    [(GAXWorkspaceViewController *)self _performTransitionWithType:v4 completion:v9];
  }
}

- (BOOL)shouldDisplayMiniToolbarForController:(id)a3
{
  return [(GAXWorkspaceViewController *)self navigationBarNeedsMiniMetricsInitialized];
}

- (void)featureViewController:(id)a3 touchSystemFeatureDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  [v6 setBackgroundShouldCoverEverything:v4 ^ 1 animated:1];

  int v7 = [(GAXWorkspaceViewController *)self instructionsLabel];

  if (v7)
  {
    double v8 = [(GAXWorkspaceViewController *)self _instructionsLabelTextWhenTouchEnabled:v4];
    double v9 = [(GAXWorkspaceViewController *)self instructionsLabel];
    id v10 = [v9 text];
    unsigned __int8 v11 = [v10 isEqualToString:v8];

    if ((v11 & 1) == 0)
    {
      CGFloat v12 = [(GAXWorkspaceViewController *)self _instructionsLabelWithText:v8];
      double v13 = [v9 superview];
      [v13 insertSubview:v12 belowSubview:v9];

      [(GAXWorkspaceViewController *)self setInstructionsLabel:v12];
      [(GAXWorkspaceViewController *)self _updateInstructionsLabel];
      [v12 setAlpha:0.0];
      id v14 = [(GAXWorkspaceViewController *)self styleProvider];
      [v14 defaultAnimationDuration];
      double v16 = v15;

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_25640;
      v22[3] = &unk_5CD28;
      id v23 = v9;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_2564C;
      v18[3] = &unk_5DA78;
      double v21 = v16;
      id v19 = v12;
      id v20 = v23;
      id v17 = v12;
      +[UIView animateWithDuration:v22 animations:v18 completion:v16 * 0.5];
    }
  }
}

- (id)viewForPresentingOverlayUserInterfaceForFeatureViewController:(id)a3
{
  double v3 = [(GAXWorkspaceViewController *)self overlayUserInterfaceViewController];
  BOOL v4 = [v3 view];

  return v4;
}

- (void)getInterestAreaPathForFingerPath:(id)a3 interestAreaViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(GAXWorkspaceViewController *)self view];
  CGFloat v12 = objc_opt_new();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_25918;
  v26[3] = &unk_5DAA0;
  id v13 = v11;
  id v27 = v13;
  id v28 = v12;
  id v14 = v12;
  [v8 enumerateElementsUsingBlock:v26];
  double v15 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_259C4;
  v20[3] = &unk_5DAC8;
  id v21 = v9;
  id v22 = v8;
  id v23 = v13;
  double v24 = self;
  id v25 = v10;
  id v16 = v10;
  id v17 = v13;
  id v18 = v8;
  id v19 = v9;
  [v15 getContainedViewsInFrontmostApplicationForFingerPath:v14 completion:v20];
}

- (double)scaleForSpecialControlsInInterestAreaViewController:(id)a3
{
  double v4 = 1.0;
  -[GAXWorkspaceViewController _getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:](self, "_getHostedApplicationViewParametersForLayoutMode:scaleFactor:frame:targetSize:", [(GAXWorkspaceViewController *)self layoutMode], &v4, 0, CGSizeZero.width, CGSizeZero.height);
  if (v4 <= 0.0) {
    return 1.0;
  }
  else {
    return 1.0 / v4;
  }
}

- (CGRect)boundsForConstrainingFingerPathInInterestAreaViewController:(id)a3
{
  id v4 = a3;
  if ([(GAXWorkspaceViewController *)self isViewLoaded])
  {
    double v5 = [(GAXWorkspaceViewController *)self navigationBar];
    [v5 frame];
    double v7 = v6;
    CGFloat v9 = v8;
    double v11 = v10;
    CGFloat v13 = v12;
    id v14 = [(GAXWorkspaceViewController *)self featureViewController];
    double v15 = [v14 view];
    [v15 frame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    v40.origin.CGFloat x = v7;
    v40.origin.CGFloat y = v9;
    v40.size.CGFloat width = v11;
    v40.size.CGFloat height = v13;
    double MaxY = CGRectGetMaxY(v40);
    v41.origin.CGFloat x = v17;
    v41.origin.CGFloat y = v19;
    v41.size.CGFloat width = v21;
    v41.size.CGFloat height = v23;
    CGFloat v25 = CGRectGetMinY(v41) - MaxY;
    double v26 = [v5 superview];
    id v27 = [v4 view];
    objc_msgSend(v26, "convertRect:toView:", v27, v7, MaxY, v11, v25);
    CGFloat x = v28;
    CGFloat y = v30;
    CGFloat width = v32;
    CGFloat height = v34;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
  return result;
}

- (id)referenceViewForConvertingFromAndToWindowCoordinateSystemForInterestAreaViewController:(id)a3
{
  if ([(GAXWorkspaceViewController *)self isViewLoaded])
  {
    id v4 = [(GAXWorkspaceViewController *)self view];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)viewToCoverWithOutOfBoundsDrawingForInterestAreaViewWithController:(id)a3 edgeInsets:(UIEdgeInsets *)a4
{
  double top = UIEdgeInsetsZero.top;
  double bottom = UIEdgeInsetsZero.bottom;
  if (![(GAXWorkspaceViewController *)self isViewLoaded])
  {
    double v8 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v8 = [(GAXWorkspaceViewController *)self view];
  CGFloat v9 = [(GAXWorkspaceViewController *)self navigationBar];
  [v9 frame];
  double top = UIEdgeInsetsZero.top + CGRectGetMaxY(v17);

  [v8 bounds];
  double MaxY = CGRectGetMaxY(v18);
  double v11 = [(GAXWorkspaceViewController *)self featureViewController];
  double v12 = [v11 view];
  [v12 frame];
  double bottom = bottom + MaxY - CGRectGetMinY(v19);

  if (a4)
  {
LABEL_5:
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat right = UIEdgeInsetsZero.right;
    a4->double top = top;
    a4->CGFloat left = left;
    a4->double bottom = bottom;
    a4->CGFloat right = right;
  }
LABEL_6:

  return v8;
}

- (BOOL)isInterestAreaViewAccessibilityElementWithController:(id)a3
{
  double v3 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  unsigned __int8 v4 = [v3 isInWorkspace];

  return v4;
}

- (void)interestAreaViewController:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  id v9 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v9 interestAreaViewController:v8 willRotateToInterfaceOrientation:a4 duration:a5];
}

- (void)interestAreaViewController:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v7 interestAreaViewController:v6 didRotateFromInterfaceOrientation:a4];
}

- (void)archiveInterestAreaPathsForStorageInterestAreaViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXWorkspaceViewController *)self userInterfaceServer];
  [v5 archiveInterestAreaPathsForStorageInterestAreaViewController:v4];
}

- (BOOL)eventStealerView:(id)a3 shouldStealEventAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(GAXWorkspaceViewController *)self interestAreaViewController];
  if ([v8 isViewLoaded])
  {
    [(GAXWorkspaceViewController *)self boundsForConstrainingFingerPathInInterestAreaViewController:v8];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGRect v17 = [v8 view];
    objc_msgSend(v17, "convertPoint:fromView:", v7, x, y);
    v22.double x = v18;
    v22.double y = v19;
    v23.origin.double x = v10;
    v23.origin.double y = v12;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v16;
    BOOL v20 = CGRectContainsPoint(v23, v22);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (GAXUIServer)userInterfaceServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceServer);

  return (GAXUIServer *)WeakRetained;
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (BOOL)usesResumeNavigationTitles
{
  return self->_usesResumeNavigationTitles;
}

- (void)setUsesResumeNavigationTitles:(BOOL)a3
{
  self->_usesResumeNavigationTitles = a3;
}

- (GAXOverlayUserInterfaceViewController)overlayUserInterfaceViewController
{
  return self->_overlayUserInterfaceViewController;
}

- (void)setOverlayUserInterfaceViewController:(id)a3
{
}

- (UIView)hostedApplicationShadowView
{
  return self->_hostedApplicationShadowView;
}

- (void)setHostedApplicationShadowView:(id)a3
{
}

- (GAXInterestAreaViewController)interestAreaViewController
{
  return self->_interestAreaViewController;
}

- (void)setInterestAreaViewController:(id)a3
{
}

- (GAXFeatureViewController)featureViewController
{
  return self->_featureViewController;
}

- (void)setFeatureViewController:(id)a3
{
}

- (UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
}

- (GAXPassthroughNavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (_UIBackdropView)statusAndNavigationBarBackgroundView
{
  return self->_statusAndNavigationBarBackgroundView;
}

- (void)setStatusAndNavigationBarBackgroundView:(id)a3
{
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
}

- (int)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int)a3
{
  self->_layoutMode = a3;
}

- (NSMutableArray)transitionContextQueue
{
  return self->_transitionContextQueue;
}

- (void)setTransitionContextQueue:(id)a3
{
}

- (BOOL)isTransitionInProgress
{
  return self->_transitionInProgress;
}

- (void)setTransitionInProgress:(BOOL)a3
{
  self->_transitionInProgress = a3;
}

- (NSLayoutConstraint)featureVCOnscreenConstraint
{
  return self->_featureVCOnscreenConstraint;
}

- (void)setFeatureVCOnscreenConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVCOnscreenConstraint, 0);
  objc_storeStrong((id *)&self->_transitionContextQueue, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_statusAndNavigationBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_featureViewController, 0);
  objc_storeStrong((id *)&self->_interestAreaViewController, 0);
  objc_storeStrong((id *)&self->_hostedApplicationShadowView, 0);
  objc_storeStrong((id *)&self->_overlayUserInterfaceViewController, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);

  objc_destroyWeak((id *)&self->_userInterfaceServer);
}

@end