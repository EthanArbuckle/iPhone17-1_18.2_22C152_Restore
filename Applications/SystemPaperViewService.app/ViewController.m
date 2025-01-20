@interface ViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)didPresent;
- (BOOL)didTeardown;
- (NSData)userActivityData;
- (id)extensionHostViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissalDidEnd:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setDidPresent:(BOOL)a3;
- (void)setDidTeardown:(BOOL)a3;
- (void)setUserActivityData:(id)a3;
- (void)teardown;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  v5 = [(ViewController *)self _remoteViewControllerProxy];
  [v5 setAllowsAlertStacking:1];
  [v5 setAllowsBanners:1];
  [v5 setAllowsSiri:1];
  [v5 setAllowsControlCenter:1];
  [v5 setAllowsAlertItems:1];
  [v5 setShouldDisableFadeInAnimation:1];
  [v5 setSwipeDismissalStyle:1];
  [v5 setDesiredHardwareButtonEvents:16];
  [v5 setSceneDeactivationReason:&off_100008298];
  if (v6) {
    v6[2]();
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) events] & 0x10) != 0)
        {
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_1000049AC;
          v9[3] = &unk_100008148;
          v9[4] = self;
          [(ViewController *)self dismissViewControllerAnimated:1 completion:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v23 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [(ViewController *)self _remoteViewControllerProxy];
  v8 = [v23 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"renderID"];
  id v10 = [v9 unsignedLongLongValue];

  long long v11 = [v23 userInfo];
  long long v12 = [v11 objectForKeyedSubscript:@"contextID"];
  id v13 = [v12 unsignedIntValue];

  if (v10 && v13)
  {
    v14 = [PortalView alloc];
    v15 = [(ViewController *)self view];
    [v15 bounds];
    v16 = -[PortalView initWithFrame:](v14, "initWithFrame:");

    [(PortalView *)v16 setAutoresizingMask:18];
    [(PortalView *)v16 setSourceLayerRenderId:v10];
    [(PortalView *)v16 setSourceContextId:v13];
    v17 = [(ViewController *)self view];
    [v17 addSubview:v16];

    v18 = +[UIColor systemBlackColor];
    v19 = [(ViewController *)self view];
    v20 = [v19 window];
    [v20 setBackgroundColor:v18];
  }
  else
  {
    v16 = [(ViewController *)self view];
    v18 = [(PortalView *)v16 window];
    v19 = [v18 _rootSheetPresentationController];
    [v19 _setShouldScaleDownBehindDescendantSheets:0];
  }

  v21 = [v23 userInfo];
  v22 = [v21 objectForKeyedSubscript:@"userActivityData"];
  [(ViewController *)self setUserActivityData:v22];

  if (v6) {
    v6[2](v6);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ViewController;
  [(ViewController *)&v9 viewDidAppear:a3];
  if (![(ViewController *)self didPresent])
  {
    [(ViewController *)self setDidPresent:1];
    id v4 = [UIApp activeInterfaceOrientation];
    id v5 = [(ViewController *)self view];
    id v6 = [v5 window];
    [v6 _setWindowInterfaceOrientation:v4];

    uint64_t v7 = [(ViewController *)self userActivityData];
    +[ICSystemPaperPresenter presentSystemPaperWithUserActivityData:v7 presentingViewController:self completion:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"dismissalDidEnd:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ViewController;
  [(ViewController *)&v4 viewDidDisappear:a3];
  [(ViewController *)self teardown];
}

- (void)dismissalDidEnd:(id)a3
{
  id v8 = a3;
  objc_super v4 = [v8 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v8 userInfo];
    id v6 = [v5 objectForKeyedSubscript:UIPresentationControllerDismissalTransitionDidEndCompletedKey];
    unsigned int v7 = [v6 BOOLValue];

    if (v7) {
      [(ViewController *)self teardown];
    }
  }
  else
  {
  }
}

- (void)teardown
{
  if (![(ViewController *)self didTeardown])
  {
    [(ViewController *)self setDidTeardown:1];
    v3 = +[NSProcessInfo processInfo];
    [v3 performExpiringActivityWithReason:@"Extending runtime for teardown" usingBlock:&stru_100008188];

    id v7 = [(ViewController *)self extensionHostViewController];
    [v7 setConfiguration:0];
    objc_super v4 = [v7 valueForKey:@"connection"];
    [v4 invalidate];

    id v5 = [v7 presentingViewController];
    [v5 dismissViewControllerAnimated:0 completion:0];

    id v6 = [(ViewController *)self _remoteViewControllerProxy];
    [v6 invalidate];
  }
}

- (id)extensionHostViewController
{
  v2 = [(ViewController *)self view];
  v3 = [v2 window];
  objc_super v4 = [v3 rootViewController];

  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 presentedViewController];

      objc_super v4 = (void *)v5;
    }
    while (v5);
  }

  return v4;
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (BOOL)didTeardown
{
  return self->_didTeardown;
}

- (void)setDidTeardown:(BOOL)a3
{
  self->_didTeardown = a3;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end