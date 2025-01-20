@interface TrustMeRotatingViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)dismissSheetAndDismissAlert;
- (void)handleHomeButtonPressed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TrustMeRotatingViewController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)TrustMeRotatingViewController;
  [(TrustMeRotatingViewController *)&v5 viewDidLoad];
  unsigned __int8 v2 = [UIApp _getSpringBoardOrientation];
  v7->_mask = 1 << v2;
  v3 = +[UIApplication sharedApplication];
  id v4 = [(UIApplication *)v3 delegate];

  [v4 setCurrentRemoteAlertController:v7];
  objc_storeStrong(&v4, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_mask;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TrustMeRotatingViewController;
  [(TrustMeRotatingViewController *)&v6 viewDidAppear:a3];
  v3 = +[UIApplication sharedApplication];
  id v5 = [(UIApplication *)v3 delegate];

  id v4 = [v5 trustControllerToBePresentedByRemoteAlertViewController];
  if (sub_100005200() == UIUserInterfaceIdiomPad) {
    [v4 setModalPresentationStyle:2];
  }
  -[TrustMeRotatingViewController presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v4, 1);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
}

- (void)handleHomeButtonPressed
{
  v3[2] = self;
  v3[1] = (id)a2;
  unsigned __int8 v2 = +[UIApplication sharedApplication];
  v3[0] = [(UIApplication *)v2 delegate];

  [v3[0] homeButtonWasPressed];
  objc_storeStrong(v3, 0);
}

- (void)_willAppearInRemoteViewController
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)TrustMeRotatingViewController;
  [(TrustMeRotatingViewController *)&v3 _willAppearInRemoteViewController];
  id v2 = [(TrustMeRotatingViewController *)v5 _remoteViewControllerProxy];
  [v2 setDesiredHardwareButtonEvents:16];
  [v2 setSwipeDismissalStyle:1];
  [v2 setSupportedInterfaceOrientationOverride:v5->_mask];
  [v2 setShouldDisableFadeInAnimation:1];
  objc_storeStrong(&v2, 0);
}

- (void)dismissSheetAndDismissAlert
{
  v8[2] = self;
  v8[1] = (id)a2;
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  objc_super v6 = sub_1000054D0;
  BOOL v7 = &unk_1000081A8;
  v8[0] = self;
  -[TrustMeRotatingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

@end