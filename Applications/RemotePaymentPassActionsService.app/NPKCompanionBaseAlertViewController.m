@interface NPKCompanionBaseAlertViewController
- (NPKRemotePassActionUIServicePresenterInterface)viewServicePresenter;
- (SBUIRemoteAlertHostInterface)viewServiceHost;
- (void)_establishPresenterConnectionWithEndpoint:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss;
@end

@implementation NPKCompanionBaseAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v8 = a4;
  v6 = [a3 xpcEndpoint];
  [(NPKCompanionBaseAlertViewController *)self _establishPresenterConnectionWithEndpoint:v6];

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }
}

- (SBUIRemoteAlertHostInterface)viewServiceHost
{
  return (SBUIRemoteAlertHostInterface *)[(NPKCompanionBaseAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000105A8];
}

- (NPKRemotePassActionUIServicePresenterInterface)viewServicePresenter
{
  return (NPKRemotePassActionUIServicePresenterInterface *)[(NSXPCConnection *)self->_presenterConnection remoteObjectProxyWithErrorHandler:&stru_1000105C8];
}

- (void)dismiss
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009AE4;
  v5[3] = &unk_100010390;
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  v4 = [(NPKCompanionBaseAlertViewController *)self presentedViewController];
  if (v4) {
    [(NPKCompanionBaseAlertViewController *)self dismissViewControllerAnimated:1 completion:v3];
  }
  else {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)_establishPresenterConnectionWithEndpoint:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v10 = (id)objc_opt_new();
    [v10 _setEndpoint:v4];

    v5 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v10];
    presenterConnection = self->_presenterConnection;
    self->_presenterConnection = v5;

    [(NSXPCConnection *)self->_presenterConnection _setQueue:&_dispatch_main_q];
    v7 = self->_presenterConnection;
    id v8 = +[NPKRemotePassActionUIServicePresenterInterface interface];
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_presenterConnection resume];
    v9 = [(NPKCompanionBaseAlertViewController *)self viewServicePresenter];
    [v9 establishConnection];
  }
}

- (void).cxx_destruct
{
}

@end