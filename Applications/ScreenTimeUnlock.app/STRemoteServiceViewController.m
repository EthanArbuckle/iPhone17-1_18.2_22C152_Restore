@interface STRemoteServiceViewController
+ (void)dismissPinController;
- (BOOL)validatePIN:(id)a3 forPINController:(id)a4;
- (NSXPCConnection)clientConnection;
- (STRemoteServiceViewController)init;
- (int64_t)passcodeMode;
- (void)_dismissPINControllerWithCompletionHandler:(id)a3;
- (void)_provideAuthenticationResultToClient:(id)a3;
- (void)_providePINToClient:(id)a3;
- (void)_restrictionsPINControllerDidDismiss:(BOOL)a3;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptEnteredPIN;
- (void)didAcceptSetPIN;
- (void)didCancelEnteringPIN;
- (void)handleButtonActions:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setPIN:(id)a3 forPINController:(id)a4;
- (void)setPasscodeMode:(int64_t)a3;
- (void)showRestrictionsPINControllerWithMode:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STRemoteServiceViewController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STRemoteServiceViewController;
  [(STRemoteServiceViewController *)&v5 viewWillAppear:a3];
  [(STRemoteServiceViewController *)self showRestrictionsPINControllerWithMode:[(STRemoteServiceViewController *)self passcodeMode]];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewWillAppear", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STRemoteServiceViewController;
  [(STRemoteServiceViewController *)&v8 viewDidAppear:a3];
  v4 = [(STRemoteServiceViewController *)self view];
  objc_super v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidAppear", v7, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STRemoteServiceViewController;
  [(STRemoteServiceViewController *)&v5 viewDidDisappear:a3];
  [(STRemoteServiceViewController *)self _providePINToClient:0];
  [(STRemoteServiceViewController *)self _provideAuthenticationResultToClient:0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidDisappear", v4, 2u);
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)STRemoteServiceViewController;
  [(STRemoteServiceViewController *)&v3 viewDidLoad];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "STUI:: STRemoteServiceViewController.viewDidLoad", v2, 2u);
  }
}

+ (void)dismissPinController
{
  v2 = [(id)qword_10000D330 _remoteViewControllerProxy];
  [v2 dismiss];

  objc_super v3 = (void *)qword_10000D330;
  qword_10000D330 = 0;
}

- (STRemoteServiceViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)STRemoteServiceViewController;
  v2 = [(STRemoteServiceViewController *)&v4 init];
  if (v2)
  {
    [(id)objc_opt_class() dismissPinController];
    objc_storeStrong((id *)&qword_10000D330, v2);
  }
  return v2;
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)STRemoteServiceViewController;
  [(STRemoteServiceViewController *)&v4 _willAppearInRemoteViewController];
  objc_super v3 = [(STRemoteServiceViewController *)self _remoteViewControllerProxy];
  [v3 setStyleOverridesToCancel:-1048577 animationSettings:0];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_super v8 = [v6 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"STRemoteServiceUserInfoContextData"];

  if (v9)
  {
    v10 = +[STLockoutAppContext contextWithData:v9];
    appContext = self->_appContext;
    self->_appContext = v10;
  }
  else
  {
    appContext = self->_appContext;
    self->_appContext = 0;
  }

  v12 = [v6 userInfo];
  v13 = [v12 objectForKeyedSubscript:STRemoteAlertConfigurationContextKeyPasscodeMode];

  if (v13)
  {
    id v14 = [v13 integerValue];
    v15 = self;
  }
  else
  {
    v16 = +[STLog remoteViewService];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Defaulting remote view service to auth mode.", v27, 2u);
    }

    v15 = self;
    id v14 = 0;
  }
  [(STRemoteServiceViewController *)v15 setPasscodeMode:v14];
  v17 = [v6 xpcEndpoint];

  if (v17)
  {
    v18 = objc_opt_new();
    v19 = [v6 xpcEndpoint];
    [v18 _setEndpoint:v19];

    id v20 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v18];
    int64_t v21 = [(STRemoteServiceViewController *)self passcodeMode];
    if (v21 == 1)
    {
      int v22 = _os_feature_enabled_impl();
      v23 = &protocolRef_STPasscodeReceiverInterface;
      v24 = &protocolRef_STPasscodeReceiverProtocol;
    }
    else
    {
      if (v21)
      {
LABEL_17:
        [v20 resume];
        [(STRemoteServiceViewController *)self setClientConnection:v20];

        goto LABEL_18;
      }
      int v22 = _os_feature_enabled_impl();
      v23 = &protocolRef_STPasscodeAuthenticationResultReceiverInterface;
      v24 = &protocolRef_STPasscodeAuthenticationResultReceiverProtocol;
    }
    if (v22) {
      v23 = v24;
    }
    v25 = +[NSXPCInterface interfaceWithProtocol:*v23];
    [v20 setRemoteObjectInterface:v25];

    goto LABEL_17;
  }
LABEL_18:
  v26 = [(STRemoteServiceViewController *)self _remoteViewControllerProxy];
  [v26 setDesiredHardwareButtonEvents:16];

  if (v7) {
    v7[2](v7);
  }
}

- (void)handleButtonActions:(id)a3
{
}

- (void)showRestrictionsPINControllerWithMode:(int64_t)a3
{
  if ((byte_10000D338 & 1) == 0)
  {
    objc_super v5 = +[UIColor labelColor];
    id v6 = +[PSListController appearance];
    [v6 setTextColor:v5];

    byte_10000D338 = 1;
  }
  v7 = objc_opt_new();
  [v7 setPinDelegate:self];
  if (a3 == 1)
  {
    objc_super v8 = +[STLog remoteViewService];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing restrictions controller in Set mode", v11, 2u);
    }
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  if (!a3)
  {
    objc_super v8 = +[STLog remoteViewService];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing restrictions controller in Auth mode", buf, 2u);
    }
    uint64_t v9 = 3;
LABEL_11:

    [v7 setMode:v9];
  }
  v10 = [[STRestrictionsPINNavigationController alloc] initWithRootViewController:v7];
  NSLog(@"presenting restrictions PIN controller");
  [(STRemoteServiceViewController *)self presentViewController:v10 animated:+[STRestrictionsPINNavigationController st_shouldAnimate] completion:&stru_1000082D0];
}

- (void)didAcceptEnteredPIN
{
  objc_super v3 = [(STRemoteServiceViewController *)self presentedViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003D9C;
  v4[3] = &unk_1000082F8;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:[STRestrictionsPINNavigationController st_shouldAnimate] completion:v4];
}

- (void)didAcceptSetPIN
{
}

- (void)didCancelEnteringPIN
{
  [(STRemoteServiceViewController *)self _dismissPINControllerWithCompletionHandler:0];
  [(STRemoteServiceViewController *)self _providePINToClient:0];

  [(STRemoteServiceViewController *)self _provideAuthenticationResultToClient:0];
}

- (void)_dismissPINControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRemoteServiceViewController *)self presentedViewController];
  BOOL v6 = +[STRestrictionsPINNavigationController st_shouldAnimate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003EFC;
  v8[3] = &unk_100008320;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 dismissViewControllerAnimated:v6 completion:v8];
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  -[STRemoteServiceViewController _restrictionsPINControllerDidDismiss:](self, "_restrictionsPINControllerDidDismiss:", [a3 success]);
  [(STRemoteServiceViewController *)self _providePINToClient:0];

  [(STRemoteServiceViewController *)self _provideAuthenticationResultToClient:0];
}

- (void)_restrictionsPINControllerDidDismiss:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v6 = STRestrictionsPINControllerDidFinishNotification;
  uint64_t v10 = STNotificationKeyPINSuccess;
  id v7 = +[NSNumber numberWithBool:v3];
  v11 = v7;
  objc_super v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v5 postNotificationName:v6 object:0 userInfo:v8 deliverImmediately:1];

  id v9 = [(STRemoteServiceViewController *)self _remoteViewControllerProxy];
  [v9 dismiss];
}

- (void)_providePINToClient:(id)a3
{
  id v4 = a3;
  if ([(STRemoteServiceViewController *)self passcodeMode])
  {
    objc_super v5 = [(STRemoteServiceViewController *)self clientConnection];

    if (v5)
    {
      if (v4) {
        uint64_t v6 = [objc_alloc((Class)STOpaquePasscode) initWithPasscode:v4];
      }
      else {
        uint64_t v6 = 0;
      }
      int v7 = _os_feature_enabled_impl();
      objc_super v8 = [(STRemoteServiceViewController *)self clientConnection];
      id v9 = v8;
      if (v7)
      {
        uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&stru_100008360];

        v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        id v20 = sub_100004318;
        int64_t v21 = &unk_100008388;
        int v22 = self;
        v11 = &v18;
      }
      else
      {
        uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000083A8];

        v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        v15 = sub_10000445C;
        v16 = &unk_100008388;
        v17 = self;
        v11 = &v13;
      }
      [v10 receivePasscode:v6 completionHandler:v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22];

      v12 = [(STRemoteServiceViewController *)self clientConnection];
      [v12 invalidate];

      [(STRemoteServiceViewController *)self setClientConnection:0];
    }
    else
    {
      uint64_t v6 = +[STLog remoteViewService];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100005108();
      }
    }
  }
}

- (void)_provideAuthenticationResultToClient:(id)a3
{
  id v12 = a3;
  BOOL v4 = (id)[(STRemoteServiceViewController *)self passcodeMode] == (id)1;
  objc_super v5 = v12;
  if (!v4)
  {
    if (v12) {
      id v6 = [objc_alloc((Class)STAuthenticationResult) initWithResult:[v12 BOOLValue]];
    }
    else {
      id v6 = 0;
    }
    int v7 = _os_feature_enabled_impl();
    objc_super v8 = [(STRemoteServiceViewController *)self clientConnection];
    id v9 = v8;
    if (v7)
    {
      uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000083C8];

      v11 = &stru_1000083E8;
    }
    else
    {
      uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&stru_100008408];

      v11 = &stru_100008428;
    }
    [v10 receivePasscodeAuthenticationResult:v6 completionHandler:v11];

    objc_super v5 = v12;
  }
}

- (BOOL)validatePIN:(id)a3 forPINController:(id)a4
{
  unsigned int v5 = +[SFRestrictionsPasscodeController validatePIN:](SFRestrictionsPasscodeController, "validatePIN:", a3, a4);
  id v6 = +[STLog remoteViewService];
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User did successfully authenticate pin - making call to client", v9, 2u);
    }

    int v7 = +[NSNumber numberWithBool:1];
    [(STRemoteServiceViewController *)self _provideAuthenticationResultToClient:v7];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000052AC(v7);
  }

  return v5;
}

- (void)setPIN:(id)a3 forPINController:(id)a4
{
  id v5 = a3;
  id v6 = +[STLog remoteViewService];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User did set pin - making call to client", v7, 2u);
  }

  [(STRemoteServiceViewController *)self _providePINToClient:v5];
}

- (NSXPCConnection)clientConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientConnection:(id)a3
{
}

- (int64_t)passcodeMode
{
  return self->_passcodeMode;
}

- (void)setPasscodeMode:(int64_t)a3
{
  self->_passcodeMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);

  objc_storeStrong((id *)&self->_appContext, 0);
}

@end