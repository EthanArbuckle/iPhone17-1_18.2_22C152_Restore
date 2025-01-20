@interface AKWalrusDaemonService
- (AKClient)client;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedProtocol;
- (id)serviceName;
- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)configureExportedInterface:(id)a3;
- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7;
- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3;
- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKWalrusDaemonService

- (id)serviceName
{
  return AKWalrusMachService;
}

- (id)exportedProtocol
{
  return &OBJC_PROTOCOL___AKWalrusDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v3 = a3;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  v9[5] = objc_opt_class();
  v9[6] = objc_opt_class();
  v9[7] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v9 count:8];
  v5 = +[NSSet setWithArray:v4];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v6 = +[NSArray arrayWithObjects:v8 count:6];
  v7 = +[NSSet setWithArray:v6];

  [v3 setClasses:v5 forSelector:"PCSAuthContextForWebSessionIdentifier:serviceName:completion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"PCSAuthContextForWebSessionIdentifier:serviceName:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"removeAllPCSAuthCredentialWithCompletion:" argumentIndex:0 ofReply:0];
  [v3 setClasses:v7 forSelector:"removeAllPCSAuthCredentialWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"verifyEnableWalrusAllowedWithContext:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:"postWalrusStateUpdateToServerWithContext:urlBagKey:username:password:completion:" argumentIndex:0 ofReply:1];
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10000F860;
  v21 = sub_10000F780;
  v10 = [AKPCSAuthController alloc];
  v11 = +[AKWebSessionPCSKeyProvider sharedInstance];
  v22 = [(AKPCSAuthController *)v10 initWithPCSKeyProvider:v11];

  v12 = (void *)v18[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100028474;
  v14[3] = &unk_100227440;
  v16 = &v17;
  id v13 = v9;
  id v15 = v13;
  [v12 PCSAuthContextForWebSessionIdentifier:v7 serviceName:v8 completion:v14];

  _Block_object_dispose(&v17, 8);
}

- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  v4 = [AKPCSAuthController alloc];
  v5 = +[AKWebSessionPCSKeyProvider sharedInstance];
  v6 = [(AKPCSAuthController *)v4 initWithPCSKeyProvider:v5];

  [(AKPCSAuthController *)v6 removeAllPCSAuthCredential];
  v3[2](v3, 0);
}

- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v8 = [AKWalrusRequestProvider alloc];
    id v9 = [(AKWalrusRequestProvider *)v8 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianDataRecoveryServiceDisable];
    v10 = v9;
    if (self->_client) {
      -[AKURLRequestProviderImpl setClient:](v9, "setClient:");
    }
    v11 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v10];
    id v12 = objc_alloc_init((Class)AKAuthHandlerImpl);
    [v12 setForceSilentAuth:1];
    [(AKServiceControllerImpl *)v11 setAuthenticationDelegate:v12];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002873C;
    v14[3] = &unk_100227340;
    id v15 = v7;
    [(AKServiceControllerImpl *)v11 executeRequestWithCompletion:v14];
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10017DD30();
    }

    v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v13 = [[AKWalrusRequestProvider alloc] initWithContext:v10 urlBagKey:v11];
    CFStringRef v20 = @"success";
    CFStringRef v21 = @"1";
    v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [(AKURLRequestProviderImpl *)v13 setAuthKitBody:v14];

    if (self->_client) {
      -[AKURLRequestProviderImpl setClient:](v13, "setClient:");
    }
    id v15 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v13];
    id v16 = objc_alloc_init((Class)AKAuthHandlerImpl);
    [v16 setForceSilentAuth:1];
    [(AKServiceControllerImpl *)v15 setAuthenticationDelegate:v16];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100028A00;
    v18[3] = &unk_100227340;
    id v19 = v12;
    [(AKServiceControllerImpl *)v15 executeRequestWithCompletion:v18];
  }
  else
  {
    uint64_t v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10017DD30();
    }

    id v13 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, AKWalrusRequestProvider *))v12 + 2))(v12, v13);
  }
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKWalrusDaemonService;
  BOOL v5 = [(AKWalrusDaemonService *)&v9 shouldAcceptNewConnection:v4];
  if (v5)
  {
    id v6 = [[AKClient alloc] initWithConnection:v4];
    client = self->_client;
    self->_client = v6;
  }
  return v5;
}

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end