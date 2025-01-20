@interface VOTQuickSettingsViewServiceAdaptorViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (VOTQuickSettingsViewController)rootViewController;
- (void)_dismiss;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setRootViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VOTQuickSettingsViewServiceAdaptorViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  [(VOTQuickSettingsViewServiceAdaptorViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(VOTQuickSettingsViewController);
  [(VOTQuickSettingsViewServiceAdaptorViewController *)self setRootViewController:v3];

  v4 = [(VOTQuickSettingsViewServiceAdaptorViewController *)self rootViewController];
  [v4 setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  [(VOTQuickSettingsViewServiceAdaptorViewController *)&v9 viewDidAppear:a3];
  [(VOTQuickSettingsViewServiceAdaptorViewController *)self _setupRemoteProxy];
  id v4 = objc_alloc((Class)UINavigationController);
  objc_super v5 = [(VOTQuickSettingsViewServiceAdaptorViewController *)self rootViewController];
  id v6 = [v4 initWithRootViewController:v5];

  [v6 setModalPresentationStyle:2];
  [v6 setModalTransitionStyle:2];
  v7 = [(VOTQuickSettingsViewServiceAdaptorViewController *)self rootViewController];
  v8 = [v6 presentationController];
  [v8 setDelegate:v7];

  [(VOTQuickSettingsViewServiceAdaptorViewController *)self presentViewController:v6 animated:1 completion:&stru_100024700];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  [(VOTQuickSettingsViewServiceAdaptorViewController *)&v4 viewDidDisappear:a3];
  [(VOTQuickSettingsViewServiceAdaptorViewController *)self _dismiss];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = VOTLogQuickSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100012E2C((uint64_t)self, (uint64_t)v6, v8);
  }

  if (v7) {
    v7[2](v7);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = VOTLogQuickSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100012F58((uint64_t)self, v6, v8);
  }

  objc_super v9 = [v6 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"data"];

  id v15 = 0;
  v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v15];
  id v12 = v15;
  if (v12)
  {
    v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100012EE0((uint64_t)v12, v13);
    }
  }
  v14 = [(VOTQuickSettingsViewServiceAdaptorViewController *)self rootViewController];
  [v14 setData:v11];

  if (v7) {
    v7[2](v7);
  }
}

- (void)_setupRemoteProxy
{
  id v2 = [(VOTQuickSettingsViewServiceAdaptorViewController *)self _remoteViewControllerProxy];
  [v2 setDismissalAnimationStyle:2];
  [v2 setOrientationChangedEventsEnabled:0];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setWallpaperTunnelActive:0];
}

- (void)_dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100001E48;
  v2[3] = &unk_100024748;
  v2[4] = self;
  [(VOTQuickSettingsViewServiceAdaptorViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (VOTQuickSettingsViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end