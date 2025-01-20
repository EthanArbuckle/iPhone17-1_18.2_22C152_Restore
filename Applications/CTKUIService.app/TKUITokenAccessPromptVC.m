@interface TKUITokenAccessPromptVC
- (TKUITokenAccessPromptVC)init;
- (int64_t)preferredStatusBarStyle;
- (void)_connectToHostWithEndpoint:(id)a3;
- (void)_denyTokenAccess;
- (void)_finishTokenAccess;
- (void)_grantTokenAccess;
- (void)_invalidate;
- (void)_presentAlert;
- (void)_presentAlertWithClientName:(id)a3 providerName:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TKUITokenAccessPromptVC

- (TKUITokenAccessPromptVC)init
{
  v3.receiver = self;
  v3.super_class = (Class)TKUITokenAccessPromptVC;
  result = [(TKUITokenAccessPromptVC *)&v3 init];
  if (result) {
    result->_tokenAccess = 0;
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKUITokenAccessPromptVC;
  [(TKUITokenAccessPromptVC *)&v4 viewDidAppear:a3];
  [(TKUITokenAccessPromptVC *)self _presentAlert];
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(TKUITokenAccessPromptVC *)self traitCollection];
  objc_super v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  unsigned int v4 = [v2 containsTraitsInCollection:v3];

  if (v4) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v7 = (void (**)(void))a4;
  v8 = [v11 xpcEndpoint];

  if (!v8)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"TKUITokenAccessPromptVC.m" lineNumber:57 description:@"Host must inject endpoint to receive user choice"];
  }
  v9 = [v11 xpcEndpoint];
  [(TKUITokenAccessPromptVC *)self _connectToHostWithEndpoint:v9];

  if (v7) {
    v7[2](v7);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v7 = (void (**)(void))a4;
  id v8 = a3;
  v9 = [v8 userInfo];

  if (!v9)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"TKUITokenAccessPromptVC.m" lineNumber:65 description:@"Host must provide request info"];
  }
  uint64_t v10 = objc_opt_class();
  id v11 = [v8 userInfo];

  v12 = [v11 objectForKeyedSubscript:kTKTokenAccessUserPromptInfo];
  id v13 = v12;
  if (!v12) {
    id v13 = objc_alloc_init((Class)NSData);
  }
  id v19 = 0;
  v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v13 error:&v19];
  id v15 = v19;
  info = self->_info;
  self->_info = v14;

  if (!v12) {
  if (!self->_info)
  }
  {
    v17 = sub_100004F50();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000058F4((uint64_t)v15, v17);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

- (void)_presentAlert
{
  info = self->_info;
  if (info)
  {
    id v5 = [(TKTokenAccessUserPromptInfo *)info clientDisplayName];
    unsigned int v4 = [(TKTokenAccessUserPromptInfo *)self->_info providerDisplayName];
    [(TKUITokenAccessPromptVC *)self _presentAlertWithClientName:v5 providerName:v4];
  }
  else
  {
    [(TKUITokenAccessPromptVC *)self _invalidate];
  }
}

- (void)_presentAlertWithClientName:(id)a3 providerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"CTKUI.TOKEN_ACCESS_PROMPT.TITLE" value:&stru_100008410 table:@"ctkui"];

  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CTKUI.TOKEN_ACCESS_PROMPT.MESSAGE" value:&stru_100008410 table:@"ctkui"];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6, v7);

  v20 = (void *)v9;
  id v13 = +[UIAlertController alertControllerWithTitle:v9 message:v12 preferredStyle:1];
  objc_initWeak(&location, self);
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"CTKUI.TOKEN_ACCESS_PROMPT.ACCESS_DENY" value:&stru_100008410 table:@"ctkui"];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000053B4;
  v23[3] = &unk_1000081D8;
  objc_copyWeak(&v24, &location);
  v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v23];
  [v13 addAction:v16];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"CTKUI.TOKEN_ACCESS_PROMPT.ACCESS_GRANT" value:&stru_100008410 table:@"ctkui"];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000053F4;
  v21[3] = &unk_1000081D8;
  objc_copyWeak(&v22, &location);
  id v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v21];
  [v13 addAction:v19];

  [(TKUITokenAccessPromptVC *)self presentViewController:v13 animated:1 completion:&stru_100008218];
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_connectToHostWithEndpoint:(id)a3
{
  id v10 = a3;
  if (self->_uiServerConnection)
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"TKUITokenAccessPromptVC.m" lineNumber:121 description:@"Multiple connections to the the UI server are not supported"];
  }
  id v5 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v5 _setEndpoint:v10];
  id v6 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
  uiServerConnection = self->_uiServerConnection;
  self->_uiServerConnection = v6;

  id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKUIServerProtocol];
  [(NSXPCConnection *)self->_uiServerConnection setRemoteObjectInterface:v8];

  [(NSXPCConnection *)self->_uiServerConnection resume];
}

- (void)_denyTokenAccess
{
  self->_tokenAccess = 2;
  [(TKUITokenAccessPromptVC *)self _finishTokenAccess];
}

- (void)_grantTokenAccess
{
  self->_tokenAccess = 1;
  [(TKUITokenAccessPromptVC *)self _finishTokenAccess];
}

- (void)_finishTokenAccess
{
  objc_super v3 = sub_100004F50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000596C((uint64_t)self, v3);
  }

  uiServerConnection = self->_uiServerConnection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000056B0;
  v9[3] = &unk_100008240;
  v9[4] = self;
  id v5 = [(NSXPCConnection *)uiServerConnection synchronousRemoteObjectProxyWithErrorHandler:v9];
  id v6 = [(TKTokenAccessUserPromptInfo *)self->_info correlationID];
  int64_t tokenAccess = self->_tokenAccess;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005718;
  v8[3] = &unk_100008268;
  v8[4] = self;
  [v5 registerTokenAccessRequestCorrelationID:v6 access:tokenAccess reply:v8];
}

- (void)_invalidate
{
  uiServerConnection = self->_uiServerConnection;
  if (uiServerConnection)
  {
    [(NSXPCConnection *)uiServerConnection invalidate];
    unsigned int v4 = self->_uiServerConnection;
    self->_uiServerConnection = 0;
  }
  id v5 = [(TKUITokenAccessPromptVC *)self _remoteViewControllerProxy];
  [v5 deactivate];

  id v6 = [(TKUITokenAccessPromptVC *)self _remoteViewControllerProxy];
  [v6 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiServerConnection, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end