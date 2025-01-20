@interface WebSheetRemoteAlertPresentationViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)shouldAutorotate;
- (BOOL)shouldPresentInFullscreen;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)dismissPresentationController:(BOOL)a3;
- (void)handleHomeButtonPressed;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WebSheetRemoteAlertPresentationViewController

- (void)dismissPresentationController:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000049C8;
  v3[3] = &unk_100008340;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)handleHomeButtonPressed
{
  id v2 = [(WebSheetRemoteAlertPresentationViewController *)self presentedViewController];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v2 dismissViewController:1];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_willAppearInRemoteViewController
{
  id v5 = [(WebSheetRemoteAlertPresentationViewController *)self _remoteViewControllerProxy];
  [v5 setDesiredHardwareButtonEvents:16];
  [v5 setSwipeDismissalStyle:1];
  [v5 setLaunchingInterfaceOrientation:[UIApp activeInterfaceOrientation]];
  [v5 setAllowsAlertStacking:1];
  [v5 setAllowsBanners:1];
  [v5 setShouldDisableFadeInAnimation:1];
  v3 = +[UIApplication sharedApplication];
  BOOL v4 = [v3 delegate];

  [v4 setRemotePresentationController:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WebSheetRemoteAlertPresentationViewController;
  [(WebSheetRemoteAlertPresentationViewController *)&v9 viewDidAppear:a3];
  BOOL v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];

  v6 = [v5 webSheetCont];
  [v6 setModalPresentationStyle:0];

  v7 = [v5 webSheetCont];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004D30;
  v8[3] = &unk_100008318;
  v8[4] = self;
  [(WebSheetRemoteAlertPresentationViewController *)self presentViewController:v7 animated:1 completion:v8];
}

@end