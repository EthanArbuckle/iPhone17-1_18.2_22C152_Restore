@interface HCSRemoteAlertServiceViewController
- (BOOL)isWakingToLockScreen;
- (HCSRemoteViewController)remoteViewController;
- (NSString)activationReason;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setActivationReason:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HCSRemoteAlertServiceViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HCSRemoteAlertServiceViewController;
  [(HCSRemoteAlertServiceViewController *)&v11 viewDidLoad];
  v3 = objc_alloc_init(HCSRemoteViewController);
  [(HCSRemoteAlertServiceViewController *)self setRemoteViewController:v3];

  v4 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  v5 = [v4 view];
  [v5 setClipsToBounds:1];

  v6 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  [(HCSRemoteAlertServiceViewController *)self addChildViewController:v6];

  v7 = [(HCSRemoteAlertServiceViewController *)self view];
  v8 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  v9 = [v8 view];
  [v7 addSubview:v9];

  v10 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  [v10 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HCSRemoteAlertServiceViewController;
  [(HCSRemoteAlertServiceViewController *)&v15 viewWillAppear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Disabling idle timer", buf, 0x16u);
  }
  v9 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  v10 = [v9 serviceContext];
  id v11 = [v10 serviceType];

  if (v11 == (id)2)
  {
    v12 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
    v13 = [v12 serviceContext];
    v14 = [v13 remoteViewControllerProxy];
    [v14 setIdleTimerDisabled:1 forReason:@"DropIn"];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HCSRemoteAlertServiceViewController;
  [(HCSRemoteAlertServiceViewController *)&v15 viewWillDisappear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Enabling idle timer", buf, 0x16u);
  }
  v9 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  v10 = [v9 serviceContext];
  id v11 = [v10 serviceType];

  if (v11 == (id)2)
  {
    v12 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
    v13 = [v12 serviceContext];
    v14 = [v13 remoteViewControllerProxy];
    [v14 setIdleTimerDisabled:0 forReason:@"DropIn"];
  }
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)HCSRemoteAlertServiceViewController;
  [(HCSRemoteAlertServiceViewController *)&v9 viewWillLayoutSubviews];
  v3 = [(HCSRemoteAlertServiceViewController *)self view];
  [v3 bounds];
  CGFloat v4 = CGRectGetWidth(v10) * 0.5;
  v5 = [(HCSRemoteAlertServiceViewController *)self view];
  [v5 bounds];
  CGFloat v6 = CGRectGetHeight(v11) * 0.5;
  v7 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
  v8 = [v7 view];
  [v8 setCenter:v4, v6];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(HCSRemoteAlertServiceViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == (id)1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v10 = [v7 userInfo];
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Configure remote view service with userInfo: %@", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003820;
  v15[3] = &unk_100008290;
  v15[4] = a2;
  CGRect v11 = [(HCSRemoteAlertServiceViewController *)self _remoteViewControllerProxyWithErrorHandler:v15];
  if (v11)
  {
    v12 = [objc_alloc((Class)HUHomeControlServiceContext) initWithAlertConfigurationContext:v7];
    [v12 setRemoteViewControllerProxy:v11];
    v13 = [(HCSRemoteAlertServiceViewController *)self remoteViewController];
    [v13 configureHomeControlServiceWithContext:v12];

    [v11 setAllowsBanners:1];
    [v11 setAllowsAlertItems:1];
    [v11 setAllowsControlCenter:1];
    [v11 setAllowsSiri:1];
    [v11 setDismissalAnimationStyle:0];
    [v11 setAllowsMenuButtonDismissal:1];
    [v11 setDesiredHardwareButtonEvents:16];
    if ([v12 serviceType] == (id)1 || [v12 serviceType] == (id)2)
    {
      [v11 setAllowsMenuButtonDismissal:0];
      [v11 setAllowsControlCenter:0];
      [v11 setAllowsAlertStacking:1];
      [v11 setStatusBarHidden:1 withDuration:-1.0];
      [v11 setWallpaperStyle:2 withDuration:-1.0];
    }
    v14.receiver = self;
    v14.super_class = (Class)HCSRemoteAlertServiceViewController;
    [(HCSRemoteAlertServiceViewController *)&v14 configureWithContext:v7 completion:v8];
  }
  else
  {
    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100003D74(a2, v12);
    }
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  CGRect v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003A3C;
  v9[3] = &unk_1000082B8;
  v9[4] = &v14;
  v9[5] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];
  int v5 = *((unsigned __int8 *)v11 + 24);
  if (!*((unsigned char *)v15 + 24))
  {
    if (!*((unsigned char *)v11 + 24)) {
      goto LABEL_7;
    }
    int v5 = 1;
  }
  double v6 = 0.0;
  if (!v5) {
    double v6 = 0.5;
  }
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003B34;
  v8[3] = &unk_1000082E0;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003C0C;
  v7[3] = &unk_100008308;
  +[UIView animateWithDuration:0 delay:v8 options:v7 animations:v6 completion:0.0];
LABEL_7:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(void))a4;
  double v6 = [a3 reason];
  [(HCSRemoteAlertServiceViewController *)self setActivationReason:v6];

  v7[2]();
}

- (NSString)activationReason
{
  return self->_activationReason;
}

- (void)setActivationReason:(id)a3
{
}

- (BOOL)isWakingToLockScreen
{
  return self->_isWakingToLockScreen;
}

- (HCSRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_activationReason, 0);
}

@end