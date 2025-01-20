@interface PhoneRootViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)hasUpdateStatusLayoutGuide;
- (BOOL)isContentViewLoaded;
- (BOOL)shouldAutorotate;
- (PhoneBaseViewController)baseViewController;
- (PhoneContentView)contentView;
- (STLockoutViewController)lockoutViewController;
- (UIViewController)detailsViewController;
- (UIVisualEffectView)backgroundBlurView;
- (_UIVisualEffectBackdropView)backdropView;
- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3;
- (id)_childViewControllerForWhitePointAdaptivityStyle;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_ensureProperPositionForContentView;
- (void)_getRotationContentSettings:(id *)a3;
- (void)displayUIAnimated:(BOOL)a3;
- (void)ensureBaseViewControllerIsShowing;
- (void)handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleOrientationNotification:(id)a3;
- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)hideDetailsViewController;
- (void)loadView;
- (void)setBackgroundBlurView:(id)a3;
- (void)setContentViewHiddenPosition;
- (void)setContentViewNormalPosition;
- (void)setDetailsViewController:(id)a3;
- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3;
- (void)setLockoutViewController:(id)a3;
- (void)setupContentViewFullSize;
- (void)setupContentViewSidebar;
- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)showDetailsViewController;
- (void)updateVideoViewControllerWithOrientationMonitor:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PhoneRootViewController

- (int64_t)preferredUserInterfaceStyle
{
  return 0;
}

- (void)loadView
{
  v4 = objc_alloc_init(PhoneRootView);
  v3 = +[UIColor clearColor];
  [(PhoneRootView *)v4 setBackgroundColor:v3];

  [(PhoneRootView *)v4 setOpaque:0];
  [(PhoneRootViewController *)self setView:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v4 viewDidAppear:a3];
  [(PhoneRootViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PhoneRootViewController *)self startPreviewIfNeeded];
}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleApplicationWillEnterForegroundNotification", v5, 2u);
  }

  [(PhoneRootViewController *)self showFaceTimeFirstRunViewIfNeeded];
}

- (void)ensureBaseViewControllerIsShowing
{
  if (([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    id v6 = [(PhoneRootViewController *)self view];
    v3 = [(PhoneRootViewController *)self contentView];
    objc_super v4 = [(PhoneRootViewController *)self baseViewController];
    [v4 resetViewController];

    id v5 = [v3 superview];

    if (v5 != v6)
    {
      [(PhoneRootViewController *)self _ensureProperPositionForContentView];
      [v6 addSubview:v3];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v12 viewWillAppear:a3];
  objc_super v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Observing foreground notifications via PhoneRootViewController viewWillAppear", v11, 2u);
  }

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];

  if ([UIApp alwaysShowLocalVideo])
  {
    id v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Observing orientation notifications via PhoneRootViewController viewWillAppear", v11, 2u);
    }

    v7 = +[NSNotificationCenter defaultCenter];
    v8 = +[PHOrientationMonitorKeys notificationEvent];
    [v7 addObserver:self selector:"handleOrientationNotification:" name:v8 object:0];

    v9 = objc_opt_new();
    v10 = [v9 compose];
    [v10 setOrientationEventsEnabled:1];
  }
}

- (void)displayUIAnimated:(BOOL)a3
{
  if (objc_msgSend(UIApp, "tabBarCanSlide", a3))
  {
    [(PhoneRootViewController *)self showContentViewAnimated:0 completionBlock:0];
    objc_super v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v5 = "Showing contents view of PhoneRootViewController.";
      id v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    objc_super v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v5 = "Skipping showing contents view of PhoneRootViewController.";
      id v6 = (uint8_t *)&v7;
      goto LABEL_6;
    }
  }
}

- (PhoneContentView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    +[UIView setAnimationsEnabled:0];
    objc_super v4 = -[PhoneContentView initWithFrame:]([PhoneContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_contentView;
    self->_contentView = v4;

    [(PhoneContentView *)self->_contentView setContentMode:3];
    [(PhoneContentView *)self->_contentView setAutoresizesSubviews:1];
    if ([UIApp tabBarFillsScreen]) {
      [(PhoneRootViewController *)self setupContentViewFullSize];
    }
    else {
      [(PhoneRootViewController *)self setupContentViewSidebar];
    }
    if ([UIApp userInterfaceStyle] == 1)
    {
      if (!self->_backdropView)
      {
        id v6 = objc_alloc((Class)_UIVisualEffectBackdropView);
        [(PhoneContentView *)self->_contentView bounds];
        __int16 v7 = (_UIVisualEffectBackdropView *)[v6 initWithFrame:];
        backdropView = self->_backdropView;
        self->_backdropView = v7;

        [(_UIVisualEffectBackdropView *)self->_backdropView setAutoresizingMask:18];
        [(_UIVisualEffectBackdropView *)self->_backdropView setRenderMode:1];
        v9 = [(_UIVisualEffectBackdropView *)self->_backdropView captureGroup];
        [v9 setGroupName:@"RootControllerBackgroundBackdrop"];
      }
      if (!self->_backgroundBlurView)
      {
        id v10 = objc_alloc((Class)UIVisualEffectView);
        v11 = +[UIBlurEffect effectWithStyle:2];
        objc_super v12 = (UIVisualEffectView *)[v10 initWithEffect:v11];
        backgroundBlurView = self->_backgroundBlurView;
        self->_backgroundBlurView = v12;

        [(PhoneContentView *)self->_contentView bounds];
        -[UIVisualEffectView setFrame:](self->_backgroundBlurView, "setFrame:");
        [(UIVisualEffectView *)self->_backgroundBlurView setAutoresizingMask:18];
        v14 = [(_UIVisualEffectBackdropView *)self->_backdropView captureGroup];
        v15 = [v14 groupName];
        [(UIVisualEffectView *)self->_backgroundBlurView _setGroupName:v15];

        [(UIVisualEffectView *)self->_backgroundBlurView _setCaptureView:self->_backdropView];
      }
      [(PhoneContentView *)self->_contentView addSubview:self->_backdropView];
      [(PhoneContentView *)self->_contentView addSubview:self->_backgroundBlurView];
    }
    if ([UIApp usesUnifiedInterface])
    {
      v16 = 0;
    }
    else
    {
      v17 = [(PhoneRootViewController *)self baseViewController];
      v16 = [v17 view];
    }
    unsigned int v18 = [UIApp tabBarFillsScreen];
    [(PhoneContentView *)self->_contentView bounds];
    double v20 = v19;
    if (v18)
    {
      [v16 setFrame:];
    }
    else
    {
      [(PhoneContentView *)self->_contentView bounds];
      [v16 setBounds:0.0, 0.0, v20];
      [(PhoneContentView *)self->_contentView bounds];
      double MaxX = CGRectGetMaxX(v30);
      [v16 bounds];
      double v23 = MaxX - floor(v22 * 0.5);
      [(PhoneContentView *)self->_contentView bounds];
      [v16 setCenter:v23, floor(v24 * 0.5)];
    }
    [v16 setAutoresizingMask:18];
    v25 = [(PhoneRootViewController *)self detailsViewController];

    if (v25)
    {
      v26 = [(PhoneRootViewController *)self detailsViewController];
      [(PhoneRootViewController *)self addChildViewController:v26];

      [(PhoneContentView *)self->_contentView addSubview:v16];
      v27 = [(PhoneRootViewController *)self detailsViewController];
      [v27 didMoveToParentViewController:self];
    }
    else
    {
      [(PhoneContentView *)self->_contentView addSubview:v16];
    }
    +[UIView setAnimationsEnabled:1];

    contentView = self->_contentView;
  }

  return contentView;
}

- (void)_ensureProperPositionForContentView
{
  unsigned int v3 = [UIApp tabBarFillsScreen];
  objc_super v4 = [(PhoneRootViewController *)self view];
  [v4 bounds];
  double v9 = v7;
  double v10 = v8;
  if (v3)
  {
    double x = v5;
    double y = v6;

    v13 = [(PhoneRootViewController *)self view];
    [v13 center];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    -[PhoneRootViewController _contentViewWidthForApplicationBoundsSize:](self, "_contentViewWidthForApplicationBoundsSize:", v7, v8);
    double v9 = v18;

    double v19 = [(PhoneRootViewController *)self view];
    [v19 bounds];
    double v10 = v20;

    if ([UIApp userInterfaceLayoutDirection])
    {
      v21 = [(PhoneRootViewController *)self view];
      [v21 bounds];
      double v15 = floor(v22 + v9 * -0.5);
    }
    else
    {
      double v15 = floor(v9 * 0.5);
    }
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    v13 = [(PhoneRootViewController *)self view];
    [v13 bounds];
    double v17 = floor(v23 * 0.5);
  }

  -[PhoneContentView setBounds:](self->_contentView, "setBounds:", x, y, v9, v10);
  contentView = self->_contentView;

  -[PhoneContentView setCenter:](contentView, "setCenter:", v15, v17);
}

- (void)setupContentViewFullSize
{
  [(PhoneContentView *)self->_contentView setOpaque:0];
  unsigned int v3 = +[UIColor clearColor];
  [(PhoneContentView *)self->_contentView setBackgroundColor:v3];

  [(PhoneContentView *)self->_contentView setAutoresizingMask:18];

  [(PhoneRootViewController *)self _ensureProperPositionForContentView];
}

- (UIViewController)detailsViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v2 viewDidLoad];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __78__PhoneRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_10027D7A0;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

id __78__PhoneRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureProperPositionForContentView];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return [UIApp contentViewCanRotate];
}

- (void)_getRotationContentSettings:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController _getRotationContentSettings:](&v7, "_getRotationContentSettings:");
  double v5 = [(PhoneRootViewController *)self baseViewController];
  unsigned int v6 = [v5 shouldDisableEdgeClip];

  if (v6) {
    a3->var6 = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PhoneRootViewController;
  [(PhoneRootViewController *)&v3 viewWillDisappear:a3];
}

- (void)handleOrientationNotification:(id)a3
{
  objc_super v4 = [(PhoneRootViewController *)self view];
  double v5 = [v4 _screen];

  objc_super v6 = +[UIScreen mainScreen];
  if ([UIApp alwaysShowLocalVideo]) {
    BOOL v7 = v5 == v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    objc_super v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleOrientationNotification", buf, 2u);
    }

    double v9 = objc_opt_new();
    double v10 = [v9 compose];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __57__PhoneRootViewController_handleOrientationNotification___block_invoke;
    v12[3] = &unk_10027C940;
    v12[4] = self;
    id v13 = v10;
    id v11 = v10;
    +[UIView animateWithDuration:v12 animations:0.300000012];
  }
}

id __57__PhoneRootViewController_handleOrientationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVideoViewControllerWithOrientationMonitor:*(void *)(a1 + 40)];
}

- (void)updateVideoViewControllerWithOrientationMonitor:(id)a3
{
  if (objc_msgSend(UIApp, "alwaysShowLocalVideo", a3))
  {
    objc_super v4 = [(PhoneRootViewController *)self view];
    double v5 = [v4 window];
    objc_super v6 = [v5 windowScene];

    if (!v6)
    {
      BOOL v7 = PHDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to orient video view controller because there's no window scene to determine a valid fallback orientation", v8, 2u);
      }
    }
  }
}

- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3
{
  unint64_t v3 = +[PHUIConfiguration contentViewSizeForFaceTime];
  if (v3 > 2) {
    return 320.0;
  }
  else {
    return dbl_100204220[v3];
  }
}

- (void)setupContentViewSidebar
{
  unint64_t v3 = +[UIColor clearColor];
  [(PhoneContentView *)self->_contentView setBackgroundColor:v3];

  [(PhoneContentView *)self->_contentView setAutoresizingMask:20];
  [(PhoneRootViewController *)self _ensureProperPositionForContentView];
  if (([UIApp tabBarFillsScreen] & 1) == 0)
  {
    [(PhoneRootViewController *)self setContentViewHiddenPosition];
    contentView = self->_contentView;
    [(PhoneContentView *)contentView setHidden:1];
  }
}

- (BOOL)isContentViewLoaded
{
  return self->_contentView != 0;
}

- (void)setContentViewNormalPosition
{
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {
    unint64_t v3 = [(PhoneRootViewController *)self contentView];
    if ([UIApp contentViewAnimationsFadeInsteadOfMove])
    {
      [v3 setAlpha:1.0];
    }
    else
    {
      long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v5[1] = v4;
      v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v3 setTransform:v5];
    }
  }
}

- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([UIApp tabBarCanSlide] & 1) == 0)
  {
    double v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:556 description:@"Requested tab bar slide animation when not supported"];
  }
  objc_super v8 = [(PhoneRootViewController *)self contentView];
  [v8 setHidden:0];
  double v9 = [(PhoneRootViewController *)self view];
  double v10 = [v8 superview];

  if (v10 != v9)
  {
    +[UIView disableAnimation];
    [(PhoneRootViewController *)self _ensureProperPositionForContentView];
    [v9 addSubview:v8];
    +[UIView enableAnimation];
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __67__PhoneRootViewController_showContentViewAnimated_completionBlock___block_invoke;
  v18[3] = &unk_10027D7C8;
  id v19 = v8;
  id v20 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = objc_retainBlock(v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __67__PhoneRootViewController_showContentViewAnimated_completionBlock___block_invoke_2;
  v17[3] = &unk_10027C670;
  v17[4] = self;
  double v14 = objc_retainBlock(v17);
  if (v4) {
    double v15 = 0.300000012;
  }
  else {
    double v15 = 0.0;
  }
  +[UIView animateWithDuration:v14 animations:v13 completion:v15];
  +[UIView animateWithDuration:0 delay:v14 options:v13 animations:v15 completion:0.0];
}

uint64_t __67__PhoneRootViewController_showContentViewAnimated_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  if (CGAffineTransformIsIdentity(&v6)) {
    [*(id *)(a1 + 32) setHidden:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

id __67__PhoneRootViewController_showContentViewAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentViewNormalPosition];
}

- (void)setContentViewHiddenPosition
{
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {
    unint64_t v3 = [(PhoneRootViewController *)self contentView];
    if ([UIApp contentViewAnimationsFadeInsteadOfMove])
    {
      [v3 setAlpha:0.0];
    }
    else
    {
      id v4 = [UIApp userInterfaceLayoutDirection];
      unsigned int v5 = [UIApp contentViewOffscreenEdge];
      [v3 bounds];
      if (v5 == 1)
      {
        double Height = CGRectGetHeight(*(CGRect *)&v6);
        CGFloat v11 = Height;
      }
      else
      {
        double Height = CGRectGetWidth(*(CGRect *)&v6);
        CGFloat v11 = 0.0;
      }
      if (v4 != (id)1) {
        double Height = -Height;
      }
      memset(&v13.c, 0, 32);
      if (v5 == 1) {
        double Height = 0.0;
      }
      *(_OWORD *)&v13.a = 0uLL;
      CGAffineTransformMakeTranslation(&v13, Height, v11);
      CGAffineTransform v12 = v13;
      [v3 setTransform:&v12];
    }
  }
}

- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([UIApp tabBarCanSlide] & 1) == 0)
  {
    CGFloat v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PhoneRootViewController.m" lineNumber:624 description:@"Requested tab bar slide animation when not supported"];
  }
  if ([(PhoneRootViewController *)self isContentViewLoaded])
  {

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __67__PhoneRootViewController_hideContentViewAnimated_completionBlock___block_invoke;
    v13[3] = &unk_10027D7C8;
    v13[4] = self;
    id v14 = v7;
    objc_super v8 = objc_retainBlock(v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __67__PhoneRootViewController_hideContentViewAnimated_completionBlock___block_invoke_2;
    v12[3] = &unk_10027C670;
    v12[4] = self;
    double v9 = objc_retainBlock(v12);
    double v10 = 0.300000012;
    if (!v4) {
      double v10 = 0.0;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v9, v8, v10);
  }
}

void __67__PhoneRootViewController_hideContentViewAnimated_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) contentView];
  unsigned int v5 = v4;
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  if (!CGAffineTransformIsIdentity(&v7)) {
    [v5 setHidden:1];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

id __67__PhoneRootViewController_hideContentViewAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentViewHiddenPosition];
}

- (void)showDetailsViewController
{
  if ([UIApp userInterfaceStyle] == 1)
  {
    id v8 = [(PhoneRootViewController *)self detailsViewController];
    uint64_t v3 = [v8 presentedViewController];
    if (v3)
    {
      BOOL v4 = (void *)v3;
    }
    else
    {
      BOOL faceTimeRegistrationViewIsShowing = self->_faceTimeRegistrationViewIsShowing;

      if (faceTimeRegistrationViewIsShowing) {
        return;
      }
      uint64_t v6 = [(PhoneRootViewController *)self detailsViewController];
      unsigned int v7 = [v6 isViewLoaded];

      if (!v7) {
        return;
      }
      id v8 = [(PhoneRootViewController *)self detailsViewController];
      BOOL v4 = [v8 view];
      [v4 setAlpha:1.0];
    }
  }
}

- (void)hideDetailsViewController
{
  if ([UIApp userInterfaceStyle] == 1)
  {
    id v4 = [(PhoneRootViewController *)self detailsViewController];
    uint64_t v3 = [v4 view];
    [v3 setAlpha:0.0];
  }
}

- (_UIVisualEffectBackdropView)backdropView
{
  return self->_backdropView;
}

- (PhoneBaseViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setDetailsViewController:(id)a3
{
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (BOOL)hasUpdateStatusLayoutGuide
{
  return self->_hasUpdateStatusLayoutGuide;
}

- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3
{
  self->_hasUpdateStatusLayoutGuide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_localVideoViewController, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end