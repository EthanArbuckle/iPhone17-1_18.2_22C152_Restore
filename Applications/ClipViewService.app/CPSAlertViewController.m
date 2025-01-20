@interface CPSAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureRemoteAlertWithURL:(id)a3;
- (void)_dismiss;
- (void)_displayLaunchContentViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CPSAlertViewController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)CPSAlertViewController;
  [(CPSAlertViewController *)&v15 viewDidLoad];
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 delegate];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [v4 viewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) _dismiss];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [v4 viewControllers];
  [v10 addObject:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAlertViewController;
  [(CPSAlertViewController *)&v7 viewDidDisappear:a3];
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 delegate];

  id v6 = [v5 viewControllers];
  [v6 removeObject:self];
}

- (void)_displayLaunchContentViewController
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)qword_10000D308;
  uint64_t v11 = qword_10000D308;
  if (!qword_10000D308)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004C84;
    v7[3] = &unk_100008428;
    v7[4] = &v8;
    sub_100004C84((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [v4 defaultConfiguration];
  [v5 setSupportsDarkMode:1];
  id v6 = [(CPSAlertViewController *)self presentProxCardFlowWithDelegate:self initialViewController:self->_launchContentViewController configuration:v5];
}

- (void)_configureRemoteAlertWithURL:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000046B0;
  v4[3] = &unk_100008360;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_dismiss
{
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  long long v13 = (void (**)(void))a4;
  id v6 = a3;
  objc_super v7 = [(CPSAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000083A8];
  uint64_t v8 = [v6 actions];

  v9 = [v8 anyObject];
  action = self->_action;
  self->_action = v9;

  uint64_t v11 = [(BSAction *)self->_action info];
  long long v12 = [v11 objectForSetting:0];
  [(CPSAlertViewController *)self _configureRemoteAlertWithURL:v12];
  [v7 setReachabilityDisabled:1];
  [v7 setAllowsAlertStacking:1];
  if (+[CPSUtilities deviceHasHomeButton]) {
    [v7 setDesiredHardwareButtonEvents:16];
  }
  if (v13) {
    v13[2]();
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v5 = [(CPSAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000083C8];
  [v5 setStatusBarHidden:1 withDuration:0.4];
  if (v6) {
    v6[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (uint64_t (*)(CPSAlertViewController *, uint64_t))off_10000D310;
  uint64_t v10 = off_10000D310;
  if (!off_10000D310)
  {
    id v4 = (void *)sub_100004220();
    v8[3] = (uint64_t)dlsym(v4, "PRXSupportedInterfaceOrientations");
    off_10000D310 = (_UNKNOWN *)v8[3];
    id v3 = (uint64_t (*)(CPSAlertViewController *, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    sub_100004F8C();
  }
  unint64_t v5 = v3(v2, 1);

  return v5;
}

- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(BSAction *)self->_action canSendResponse])
  {
    action = self->_action;
    uint64_t v7 = +[CPSOpenClipCardPresenter responseForOpenClipAction:v4];
    [(BSAction *)action sendResponse:v7];
  }
  uint64_t v8 = self->_action;
  self->_action = 0;

  id v9 = [(CPSAlertViewController *)self _remoteViewControllerProxy];
  [v9 dismiss];
}

- (void)proxCardFlowDidDismiss
{
  if (([(CPSLaunchContentViewController *)self->_launchContentViewController dismissalInProgress] & 1) == 0)
  {
    [(CPSAlertViewController *)self launchContentViewControllerDidDisappear:self->_launchContentViewController didOpenClip:0];
    launchContentViewController = self->_launchContentViewController;
    [(CPSLaunchContentViewController *)launchContentViewController logDismissalFromCloseButton:0];
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_launchContentViewController, 0);
}

@end