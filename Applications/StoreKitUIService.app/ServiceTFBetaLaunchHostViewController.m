@interface ServiceTFBetaLaunchHostViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)prefersStatusBarHidden;
- (TFBetaLaunchHandleConfiguration)activeConfiguration;
- (TFHostedBetaAppLaunchScreenView)launchViewController;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissViewService;
- (void)_presentLaunchViewControllerForIdentifier:(id)a3;
- (void)_setupViewController:(id)a3 forPresentationInTraitEnvironment:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setActiveConfiguration:(id)a3;
- (void)setLaunchViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ServiceTFBetaLaunchHostViewController

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ServiceTFBetaLaunchHostViewController;
  [(ServiceTFBetaLaunchHostViewController *)&v7 viewDidAppear:a3];
  v4 = [(ServiceTFBetaLaunchHostViewController *)self activeConfiguration];

  if (v4)
  {
    v5 = [(ServiceTFBetaLaunchHostViewController *)self activeConfiguration];
    v6 = [v5 bundleIdentifier];
    [(ServiceTFBetaLaunchHostViewController *)self _presentLaunchViewControllerForIdentifier:v6];
  }
  else
  {
    [(ServiceTFBetaLaunchHostViewController *)self _dismissViewService];
  }
}

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

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ServiceTFBetaLaunchHostViewController;
  [(ServiceTFBetaLaunchHostViewController *)&v6 traitCollectionDidChange:a3];
  v4 = [(ServiceTFBetaLaunchHostViewController *)self launchViewController];
  v5 = [(ServiceTFBetaLaunchHostViewController *)self traitCollection];
  [v4 launchScreenHost:self traitCollectionDidChange:v5];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v16 = a3;
  objc_super v6 = (void (**)(void))a4;
  objc_super v7 = [(ServiceTFBetaLaunchHostViewController *)self _remoteViewControllerProxy];
  [v7 setDesiredHardwareButtonEvents:16];
  [v7 setAllowsMenuButtonDismissal:1];
  [v7 setWallpaperTunnelActive:0];
  [v7 setAllowsAlertStacking:1];
  [v7 setDismissalAnimationStyle:2];
  [v7 setReachabilityDisabled:1];
  v8 = +[UIDevice currentDevice];
  unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

  [v7 setSwipeDismissalStyle:(v9 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  v10 = +[UIDevice currentDevice];
  unint64_t v11 = (unint64_t)[v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v12 = +[UIApplication sharedApplication];
    id v13 = [v12 statusBarOrientation];

    [v7 setLaunchingInterfaceOrientation:v13];
  }
  v14 = [v16 userInfo];
  v15 = +[TFBetaLaunchHandleConfiguration configurationFromUserInfo:v14];
  [(ServiceTFBetaLaunchHostViewController *)self setActiveConfiguration:v15];

  if (v6) {
    v6[2](v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
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
          [(ServiceTFBetaLaunchHostViewController *)self _dismissViewService];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_presentLaunchViewControllerForIdentifier:(id)a3
{
  id v4 = [(ServiceTFBetaLaunchHostViewController *)self activeConfiguration];
  id v5 = [v4 bundleIdentifier];
  id v6 = [(ServiceTFBetaLaunchHostViewController *)self activeConfiguration];
  uint64_t v7 = [v6 launchInfo];
  id v11 = +[TFBetaAppLaunchScreenProvider createBetaAppLaunchViewControllerForIdentifier:v5 hostedIn:self withSidepackLaunchInfo:v7];

  [(ServiceTFBetaLaunchHostViewController *)self setLaunchViewController:v11];
  id v8 = objc_alloc((Class)UINavigationController);
  long long v9 = [(ServiceTFBetaLaunchHostViewController *)self launchViewController];
  id v10 = [v8 initWithRootViewController:v9];

  [v10 setDelegate:self];
  [(ServiceTFBetaLaunchHostViewController *)self _setupViewController:v10 forPresentationInTraitEnvironment:self];
  [(ServiceTFBetaLaunchHostViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)_setupViewController:(id)a3 forPresentationInTraitEnvironment:(id)a4
{
  id v7 = a3;
  id v5 = [a4 traitCollection];
  id v6 = [v5 horizontalSizeClass];

  if (v6 == (id)1)
  {
    [v7 setModalPresentationStyle:0];
    [v7 setModalTransitionStyle:2];
  }
  else
  {
    [v7 setModalPresentationStyle:2];
  }
}

- (void)_dismissViewService
{
  unint64_t v3 = [(ServiceTFBetaLaunchHostViewController *)self _remoteViewControllerProxy];
  id v4 = [(ServiceTFBetaLaunchHostViewController *)self presentedViewController];

  if (v4)
  {
    id v5 = [(ServiceTFBetaLaunchHostViewController *)self presentedViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000B288;
    v6[3] = &unk_10004CEB0;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [v3 dismiss];
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

- (TFBetaLaunchHandleConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (TFHostedBetaAppLaunchScreenView)launchViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchViewController);

  return (TFHostedBetaAppLaunchScreenView *)WeakRetained;
}

- (void)setLaunchViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_launchViewController);

  objc_storeStrong((id *)&self->_activeConfiguration, 0);
}

@end