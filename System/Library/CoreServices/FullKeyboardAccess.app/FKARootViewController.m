@interface FKARootViewController
- (AXUIBannerPresenter)bannerPresenter;
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverridingNativeFocus;
- (FKAGestureViewController)gestureViewController;
- (FKARootViewController)initWithDelegate:(id)a3 displayUUID:(id)a4;
- (FKARootViewControllerDelegate)delegate;
- (void)_notifySceneDidBecomeFocused;
- (void)_setFocusEnabledInScene:(BOOL)a3;
- (void)_startOverridingNativeFocus;
- (void)_stopOverridingNativeFocus;
- (void)dismissChildViewController:(id)a3 animated:(BOOL)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 inPopoverFromRect:(CGRect)a4;
- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5;
- (void)setBannerPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureViewController:(id)a3;
- (void)setIsOverridingNativeFocus:(BOOL)a3;
- (void)showChildViewController:(id)a3 animated:(BOOL)a4;
- (void)updateRequiresNativeFocus;
- (void)viewDidLoad;
@end

@implementation FKARootViewController

- (FKARootViewController)initWithDelegate:(id)a3 displayUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FKARootViewController;
  v8 = [(FKARootViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = [[FKAGestureViewController alloc] initWithDisplayUUID:v7];
    gestureViewController = v9->_gestureViewController;
    v9->_gestureViewController = v10;

    [(FKARootViewController *)v9 showChildViewController:v9->_gestureViewController animated:0];
  }

  return v9;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)FKARootViewController;
  [(FKARootViewController *)&v2 viewDidLoad];
  +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:1];
}

- (void)showChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(FKARootViewController *)self addChildViewController:v6];
  id v7 = [v6 view];
  [v7 setAutoresizingMask:18];

  v8 = [(FKARootViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v6 view];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = [(FKARootViewController *)self view];
  v19 = [v6 view];
  [v18 addSubview:v19];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000A528;
  v28[3] = &unk_100024778;
  id v20 = v6;
  id v29 = v20;
  v30 = self;
  v21 = objc_retainBlock(v28);
  v22 = v21;
  if (v4)
  {
    v23 = [v20 view];
    [v23 setAlpha:0.0];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000A568;
    v26[3] = &unk_100024878;
    id v27 = v20;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000A5B0;
    v24[3] = &unk_1000248A0;
    id v25 = v22;
    +[UIView animateWithDuration:v26 animations:v24 completion:0.3];
  }
  else
  {
    ((void (*)(void *))v21[2])(v21);
  }
}

- (void)dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A73C;
  v13[3] = &unk_100024778;
  id v6 = a3;
  id v14 = v6;
  double v15 = self;
  id v7 = objc_retainBlock(v13);
  v8 = v7;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A79C;
    v11[3] = &unk_100024878;
    id v12 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000A7E4;
    v9[3] = &unk_1000248A0;
    id v10 = v8;
    +[UIView animateWithDuration:v11 animations:v9 completion:0.3];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (void)presentViewController:(id)a3 inPopoverFromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [v9 setModalPresentationStyle:7];
  id v16 = [v9 popoverPresentationController];
  [v16 setDelegate:self];
  id v10 = [(FKARootViewController *)self view];
  [v16 setSourceView:v10];

  double v11 = [(FKARootViewController *)self view];
  id v12 = [v11 window];
  double v13 = [v12 screen];
  id v14 = [v13 fixedCoordinateSpace];
  double v15 = [(FKARootViewController *)self view];
  objc_msgSend(v14, "convertRect:toCoordinateSpace:", v15, x, y, width, height);
  objc_msgSend(v16, "setSourceRect:");

  [(FKARootViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000AA28;
  v12[3] = &unk_1000248C8;
  v12[4] = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = a3;
  id v10 = objc_retainBlock(v12);
  v11.receiver = self;
  v11.super_class = (Class)FKARootViewController;
  [(FKARootViewController *)&v11 presentViewController:v9 animated:v5 completion:v10];
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000AB54;
  v12[3] = &unk_1000248C8;
  v12[4] = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = a3;
  id v10 = objc_retainBlock(v12);
  v11.receiver = self;
  v11.super_class = (Class)FKARootViewController;
  [(FKARootViewController *)&v11 presentViewController:v9 withTransition:v5 completion:v10];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AC64;
  v9[3] = &unk_1000248C8;
  void v9[4] = self;
  id v10 = a4;
  id v6 = v10;
  id v7 = objc_retainBlock(v9);
  v8.receiver = self;
  v8.super_class = (Class)FKARootViewController;
  [(FKARootViewController *)&v8 dismissViewControllerWithTransition:v4 completion:v7];
}

- (void)updateRequiresNativeFocus
{
  v3 = [(FKARootViewController *)self childViewControllers];
  if ([v3 indexOfObjectPassingTest:&stru_100024908] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(FKARootViewController *)self presentedViewController];
    uint64_t v5 = (uint64_t)[v4 requiresNativeFocus];
  }
  else
  {
    uint64_t v5 = 1;
  }

  id v6 = FKALogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(FKARootViewController *)self presentedViewController];
    objc_super v8 = [(FKARootViewController *)self childViewControllers];
    v9[0] = 67109634;
    v9[1] = v5;
    __int16 v10 = 2112;
    objc_super v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Update requires native focus: %i. Presented: %@. Child: %@", (uint8_t *)v9, 0x1Cu);
  }
  [(FKARootViewController *)self setIsOverridingNativeFocus:v5];
}

- (void)_startOverridingNativeFocus
{
  v3 = [(FKARootViewController *)self delegate];
  [v3 willAquireNativeFocus];

  [(FKARootViewController *)self _setFocusEnabledInScene:1];
  uint64_t v4 = [(FKARootViewController *)self view];
  uint64_t v5 = [v4 window];
  id v6 = [v5 windowScene];
  id v7 = [v6 _FBSScene];
  objc_super v8 = [v7 identifier];

  if (!v8)
  {
    id v9 = FKALogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = [(FKARootViewController *)self view];
      objc_super v11 = [v10 window];
      __int16 v12 = [v11 windowScene];
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No identifier for window scene: %@", buf, 0xCu);
    }
    objc_super v8 = &stru_100024CA0;
  }
  id v13 = +[AXElement systemWideElement];
  id v14 = [v13 systemApplication];
  double v15 = +[NSNumber numberWithInt:getpid()];
  v17[0] = v15;
  v17[1] = v8;
  id v16 = +[NSArray arrayWithObjects:v17 count:2];
  [v14 performAction:5301 withValue:v16];

  [(FKARootViewController *)self _notifySceneDidBecomeFocused];
}

- (void)_stopOverridingNativeFocus
{
  v3 = +[AXElement systemWideElement];
  uint64_t v4 = [v3 systemApplication];
  [v4 performAction:5301 withValue:0];

  [(FKARootViewController *)self _setFocusEnabledInScene:0];
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)setIsOverridingNativeFocus:(BOOL)a3
{
  if (self->_isOverridingNativeFocus != a3)
  {
    self->_isOverridingNativeFocus = a3;
    if (a3) {
      [(FKARootViewController *)self _startOverridingNativeFocus];
    }
    else {
      [(FKARootViewController *)self _stopOverridingNativeFocus];
    }
  }
}

- (void)_setFocusEnabledInScene:(BOOL)a3
{
}

- (void)_notifySceneDidBecomeFocused
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isOverridingNativeFocus
{
  return self->_isOverridingNativeFocus;
}

- (FKAGestureViewController)gestureViewController
{
  return self->_gestureViewController;
}

- (void)setGestureViewController:(id)a3
{
}

- (AXUIBannerPresenter)bannerPresenter
{
  return self->_bannerPresenter;
}

- (void)setBannerPresenter:(id)a3
{
}

- (FKARootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FKARootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bannerPresenter, 0);

  objc_storeStrong((id *)&self->_gestureViewController, 0);
}

@end