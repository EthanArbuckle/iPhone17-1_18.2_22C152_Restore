@interface CPSLocationAlertViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureRemoteAlertWithSettings:(id)a3;
- (void)_dismissLocationContentViewControllerAnimated:(BOOL)a3 response:(unint64_t)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)handleButtonActions:(id)a3;
@end

@implementation CPSLocationAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v12 = (void (**)(void))a4;
  id v6 = a3;
  v7 = [(CPSLocationAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000082E8];
  v8 = [v6 actions];

  v9 = [v8 anyObject];
  action = self->_action;
  self->_action = v9;

  v11 = [(BSAction *)self->_action info];
  [(CPSLocationAlertViewController *)self _configureRemoteAlertWithSettings:v11];
  if (+[CPSUtilities deviceHasHomeButton]) {
    [v7 setDesiredHardwareButtonEvents:16];
  }
  if (v12) {
    v12[2]();
  }
}

- (void)_configureRemoteAlertWithSettings:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003C10;
  v5[3] = &unk_100008360;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_dismissLocationContentViewControllerAnimated:(BOOL)a3 response:(unint64_t)a4
{
  if (self->_lcViewController)
  {
    BOOL v4 = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003FE0;
    v11[3] = &unk_100008388;
    v11[4] = self;
    v11[5] = a4;
    id v6 = objc_retainBlock(v11);
    v7 = v6;
    if (v4)
    {
      lcViewController = self->_lcViewController;
      uint64_t v9 = 1;
      v10 = v7;
    }
    else
    {
      ((void (*)(void *))v6[2])(v6);
      lcViewController = self->_lcViewController;
      uint64_t v9 = 0;
      v10 = 0;
    }
    [(CPSLocationConsentViewController *)lcViewController dismissViewControllerAnimated:v9 completion:v10];
  }
}

- (void)didInvalidateForRemoteAlert
{
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)handleButtonActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lcViewController, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end