@interface ServiceBackgroundAssetConsentViewController
- (BSAction)didProvideConsentAction;
- (NSNumber)consentProvided;
- (UIViewController)childViewController;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissViewService;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setChildViewController:(id)a3;
- (void)setConsentProvided:(id)a3;
- (void)setDidProvideConsentAction:(id)a3;
@end

@implementation ServiceBackgroundAssetConsentViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (!+[objc_LockscreenStatus isDeviceUnlocked])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002D830();
    }
    exit(0);
  }
  v8 = [v6 actions];
  v9 = [v8 allObjects];
  v10 = [v9 firstObject];
  [(ServiceBackgroundAssetConsentViewController *)self setDidProvideConsentAction:v10];

  v11 = [(ServiceBackgroundAssetConsentViewController *)self _remoteViewControllerProxy];
  [v11 setDesiredHardwareButtonEvents:16];
  [v11 setAllowsMenuButtonDismissal:1];
  [v11 setAllowsBanners:1];
  [v11 setWallpaperTunnelActive:1];
  [v11 setAllowsAlertStacking:1];
  [v11 setDismissalAnimationStyle:2];
  [v11 setReachabilityDisabled:1];
  v12 = +[UIDevice currentDevice];
  unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v14 = +[UIApplication sharedApplication];
    id v15 = [v14 statusBarOrientation];

    [v11 setLaunchingInterfaceOrientation:v15];
  }
  id v16 = objc_alloc_init((Class)SKBackgroundAssetConsentViewController);
  objc_initWeak(&location, self);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100009FE0;
  v21 = &unk_10004CE68;
  objc_copyWeak(&v22, &location);
  [v16 setResponseBlock:&v18];
  -[ServiceBackgroundAssetConsentViewController setChildViewController:](self, "setChildViewController:", v16, v18, v19, v20, v21);
  v17 = [(ServiceBackgroundAssetConsentViewController *)self childViewController];
  [v17 setModalPresentationStyle:2];

  [(ServiceBackgroundAssetConsentViewController *)self presentViewController:v16 animated:1 completion:&stru_10004CE88];
  if (v7) {
    v7[2](v7);
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(ServiceBackgroundAssetConsentViewController *)self _dismissViewService];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  unint64_t v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_dismissViewService
{
  unint64_t v3 = [(ServiceBackgroundAssetConsentViewController *)self didProvideConsentAction];
  unsigned int v4 = [v3 canSendResponse];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)BSMutableSettings);
    id v6 = [(ServiceBackgroundAssetConsentViewController *)self consentProvided];
    [v5 setObject:v6 forSetting:1];

    uint64_t v7 = [(ServiceBackgroundAssetConsentViewController *)self didProvideConsentAction];
    v8 = +[BSActionResponse responseWithInfo:v5];
    [v7 sendResponse:v8];
  }
  long long v9 = [(ServiceBackgroundAssetConsentViewController *)self childViewController];

  if (v9)
  {
    long long v10 = [(ServiceBackgroundAssetConsentViewController *)self childViewController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000A328;
    v12[3] = &unk_10004CEB0;
    v12[4] = self;
    [v10 dismissViewControllerAnimated:1 completion:v12];
  }
  else
  {
    id v11 = [(ServiceBackgroundAssetConsentViewController *)self _remoteViewControllerProxy];
    [v11 deactivate];
  }
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (BSAction)didProvideConsentAction
{
  return self->_didProvideConsentAction;
}

- (void)setDidProvideConsentAction:(id)a3
{
}

- (NSNumber)consentProvided
{
  return self->_consentProvided;
}

- (void)setConsentProvided:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentProvided, 0);
  objc_storeStrong((id *)&self->_didProvideConsentAction, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end