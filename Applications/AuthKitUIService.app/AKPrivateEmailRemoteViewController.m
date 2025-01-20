@interface AKPrivateEmailRemoteViewController
- (AKPrivateEmailPresenterHostProtocol)hostProxy;
- (AKPrivateEmailRemoteViewController)initWithPrivateEmailContext:(id)a3 altDSID:(id)a4;
- (UINavigationController)navController;
- (id)remoteObjectInterface;
- (id)remoteUIStyle;
- (void)_callFlowEndedCompletionWithPrivateEmail:(id)a3 error:(id)a4;
- (void)_createNavigationController;
- (void)_prepareToPresentPrivateEmailFlow;
- (void)_showPrivateEmailFlow;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleCancellation:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setNavController:(id)a3;
- (void)setUpHostProxy;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKPrivateEmailRemoteViewController

- (AKPrivateEmailRemoteViewController)initWithPrivateEmailContext:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKPrivateEmailRemoteViewController;
  v9 = [(AKPrivateEmailRemoteViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateEmailContext, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKPrivateEmailRemoteViewController;
  [(AKPrivateEmailRemoteViewController *)&v5 viewWillAppear:a3];
  v4 = [(AKPrivateEmailRemoteViewController *)self view];
  [v4 setHidden:1];

  [(AKRemoteViewController *)self setupRemoteProxy];
  [(AKPrivateEmailRemoteViewController *)self _prepareToPresentPrivateEmailFlow];
}

- (void)setUpHostProxy
{
  objc_initWeak(&location, self);
  v3 = [(AKRemoteViewController *)self lookupConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005400;
  v6[3] = &unk_10000C320;
  objc_copyWeak(&v7, &location);
  v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  hostProxy = self->_hostProxy;
  self->_hostProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKPrivateEmailPresenterHostInterface XPCInterface];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 userInfo];
    int v20 = 138412290;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote private email view service\n%@", (uint8_t *)&v20, 0xCu);
  }
  v10 = [v6 userInfo];
  v11 = [v10 objectForKeyedSubscript:AKPrivateEmailIdentifierKey];

  objc_super v12 = [v6 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"X-Apple-I-Private-Email-Client-Bundle"];

  v14 = [v6 userInfo];
  v15 = [v14 objectForKeyedSubscript:AKAltDSID];
  altDSID = self->_altDSID;
  self->_altDSID = v15;

  v17 = (AKPrivateEmailContext *)[objc_alloc((Class)AKPrivateEmailContext) initWithKey:v11 altDSID:self->_altDSID clientAppBundleId:v13];
  privateEmailContext = self->_privateEmailContext;
  self->_privateEmailContext = v17;

  if (self->_altDSID)
  {
    v19 = [v6 xpcEndpoint];
    [(AKRemoteViewController *)self setUpLookupConnection:v19];
  }
  else
  {
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100006370(v19);
    }
  }

  v7[2](v7);
}

- (void)handleCancellation:(id)a3
{
  id v4 = +[NSError ak_errorWithCode:-7003];
  [(AKPrivateEmailRemoteViewController *)self _callFlowEndedCompletionWithPrivateEmail:0 error:v4];
}

- (void)_prepareToPresentPrivateEmailFlow
{
  [(AKPrivateEmailRemoteViewController *)self _createNavigationController];
  navController = self->_navController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005788;
  v4[3] = &unk_10000C398;
  v4[4] = self;
  [(AKPrivateEmailRemoteViewController *)self presentViewController:navController animated:1 completion:v4];
}

- (void)_showPrivateEmailFlow
{
  v3 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  context = self->_context;
  self->_context = v3;

  [(AKAppleIDAuthenticationInAppContext *)self->_context setAltDSID:self->_altDSID];
  [(AKAppleIDAuthenticationInAppContext *)self->_context setForceInlinePresentation:1];
  [(AKAppleIDAuthenticationInAppContext *)self->_context setDelegate:self];
  [(AKAppleIDAuthenticationInAppContext *)self->_context setPresentingViewController:self->_navController];
  objc_super v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    altDSID = self->_altDSID;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = altDSID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing flow for %@", (uint8_t *)&buf, 0xCu);
  }

  id v7 = +[AKURLBag bagForAltDSID:self->_altDSID];
  id v8 = [v7 urlAtKey:AKURLBagKeyPrivateEmailUseAddress];
  v9 = +[NSURLRequest requestWithURL:v8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100005A3C;
  v19 = sub_100005A4C;
  id v20 = [objc_alloc((Class)AKServerRequestConfiguration) initWithRequest:v9 requestType:0];
  id v10 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v11 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v11 _updateWithValuesFromContext:self->_context];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005A54;
  v13[3] = &unk_10000C590;
  p_long long buf = &buf;
  v13[4] = self;
  id v12 = v8;
  id v14 = v12;
  [v10 getServerUILoadDelegateWithContext:v11 completion:v13];

  _Block_object_dispose(&buf, 8);
}

- (void)_callFlowEndedCompletionWithPrivateEmail:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogHme();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006808((uint64_t)v7, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 privateEmailAddress];
    *(_DWORD *)long long buf = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending successful private email selection back to daemon: %@", buf, 0xCu);
  }
  id v11 = _AKLogHme();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100006784((uint64_t)self, v11);
  }

  hostProxy = self->_hostProxy;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006000;
  v13[3] = &unk_10000C348;
  v13[4] = self;
  [(AKPrivateEmailPresenterHostProtocol *)hostProxy privateEmailFetchCompletedWith:v6 error:v7 completion:v13];
}

- (void)_createNavigationController
{
  if (!self->_navController)
  {
    v3 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    navController = self->_navController;
    self->_navController = v3;

    objc_super v5 = [(UINavigationController *)self->_navController navigationItem];
    [v5 setHidesBackButton:1];

    id v6 = [(UINavigationController *)self->_navController navigationController];
    [v6 setNavigationBarHidden:1];

    id v7 = [(UINavigationController *)self->_navController view];
    [v7 setHidden:1];

    id v8 = self->_navController;
    [(UINavigationController *)v8 setModalPresentationStyle:0];
  }
}

- (id)remoteUIStyle
{
  v2 = (void *)sub_100004D60();
  if (v2) {
    v2 = sub_100004F74();
  }

  return [v2 osloStyle];
}

- (AKPrivateEmailPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_privateEmailContext, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end