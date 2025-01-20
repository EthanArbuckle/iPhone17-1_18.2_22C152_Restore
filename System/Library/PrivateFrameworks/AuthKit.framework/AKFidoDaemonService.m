@interface AKFidoDaemonService
- (id)authorizationController;
- (id)exportedProtocol;
- (id)serverHandler;
- (id)serviceName;
- (void)_handleGrandSlamFidoAuthorizationResponse:(id)a3 context:(id)a4 recoveryToken:(id)a5 error:(id)a6 completion:(id)a7;
- (void)configureExportedInterface:(id)a3;
- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4;
- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4;
- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5;
@end

@implementation AKFidoDaemonService

- (id)serviceName
{
  return @"com.apple.ak.puffin.xpc";
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKFidoInterface;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v13[7] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v13 count:8];
  v5 = +[NSSet setWithArray:v4];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v6 = +[NSArray arrayWithObjects:&v8 count:5];
  v7 = +[NSSet setWithArray:](NSSet, "setWithArray:", v6, v8, v9, v10, v11);

  [v3 setClasses:v5 forSelector:"registerFidoKeyWithContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"registerFidoKeyWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"verifyFidoKeyWithContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"verifyFidoKeyWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"verifyFidoRecoveryWithContext:recoveryToken:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"verifyFidoRecoveryWithContext:recoveryToken:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"verifyFidoKeyWithFidoContext:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"verifyFidoKeyWithFidoContext:completion:" argumentIndex:0 ofReply:1];
}

- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017A4C4(v6);
  }

  uint64_t v9 = [(AKFidoDaemonService *)self authorizationController];
  [v9 performRegistrationRequestWithContext:v6 completion:v7];
}

- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017A548();
  }

  uint64_t v9 = [(AKFidoDaemonService *)self authorizationController];
  [v9 performAuthenticationRequestWithContext:v6 completion:v7];
}

- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017A5BC(v6);
  }

  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100010054;
  v16 = &unk_100226A30;
  objc_copyWeak(&v19, &location);
  id v9 = v7;
  id v18 = v9;
  id v10 = v6;
  id v17 = v10;
  uint64_t v11 = objc_retainBlock(&v13);
  uint64_t v12 = [(AKFidoDaemonService *)self serverHandler];
  [v12 startFidoAuthWithContext:v10 recoveryToken:0 client:0 completion:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogFido();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10017A6AC(v8);
  }

  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001035C;
  v17[3] = &unk_100226A80;
  objc_copyWeak(&v21, &location);
  id v12 = v10;
  id v20 = v12;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  v15 = objc_retainBlock(v17);
  v16 = [(AKFidoDaemonService *)self serverHandler];
  [v16 startFidoAuthWithContext:v13 recoveryToken:v14 client:0 completion:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_handleGrandSlamFidoAuthorizationResponse:(id)a3 context:(id)a4 recoveryToken:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    id v17 = _AKLogFido();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10017A734();
    }

    (*((void (**)(id, void, void, id))v16 + 2))(v16, 0, 0, v15);
  }
  else
  {
    id v18 = [(AKFidoDaemonService *)self serverHandler];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001065C;
    v19[3] = &unk_100226AA8;
    id v22 = v16;
    id v20 = 0;
    id v21 = v12;
    [v18 finishFidoAuthWithResponse:v21 client:0 context:v13 recoveryToken:v14 completion:v19];
  }
}

- (id)authorizationController
{
  authorizationController = self->_authorizationController;
  if (!authorizationController)
  {
    v4 = (AKFidoAuthorizationController *)objc_alloc_init((Class)AKFidoAuthorizationController);
    v5 = self->_authorizationController;
    self->_authorizationController = v4;

    authorizationController = self->_authorizationController;
  }

  return authorizationController;
}

- (id)serverHandler
{
  serverHandler = self->_serverHandler;
  if (!serverHandler)
  {
    v4 = objc_alloc_init(AKFidoDaemonServerHandler);
    v5 = self->_serverHandler;
    self->_serverHandler = v4;

    serverHandler = self->_serverHandler;
  }

  return serverHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHandler, 0);

  objc_storeStrong((id *)&self->_authorizationController, 0);
}

@end