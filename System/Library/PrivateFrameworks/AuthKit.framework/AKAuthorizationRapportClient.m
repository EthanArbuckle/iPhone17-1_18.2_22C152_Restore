@interface AKAuthorizationRapportClient
- (AKAuthorizationRapportClient)init;
- (AKAuthorizationRapportClient)initWithClient:(id)a3;
- (AKAuthorizationTVServicePresenter)companionServicePresenter;
- (AKClient)client;
- (AKCredentialRequestContext)credentialRequestContext;
- (BOOL)hasEndorserAuthorizing;
- (NSData)tvAppIconData;
- (NSNumber)tvAppIconScale;
- (RPAppSignInService)advertisingService;
- (RPCompanionLinkClient)linkClient;
- (id)authorizationCompletion;
- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4;
- (void)_configureLinkClientWithService:(id)a3 companionLinkClient:(id)a4 requestContext:(id)a5;
- (void)_fetchAssociatedDomainsWithCompletionHandler:(id)a3;
- (void)_handleAuthorizationDidFinishWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleStartAuthorizingWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_invalidate;
- (void)_presentUI;
- (void)_presentUIWithControllerClassName:(id)a3 extraOptions:(id)a4 presentationServiceCompletion:(id)a5;
- (void)_verifyAccountTrustWithRequestContext:(id)a3 completion:(id)a4;
- (void)performAuthorization:(id)a3 companionLinkClient:(id)a4 advertisingService:(id)a5 completion:(id)a6;
- (void)performAuthorization:(id)a3 completion:(id)a4;
- (void)setAdvertisingService:(id)a3;
- (void)setAuthorizationCompletion:(id)a3;
- (void)setCompanionServicePresenter:(id)a3;
- (void)setCredentialRequestContext:(id)a3;
- (void)setHasEndorserAuthorizing:(BOOL)a3;
- (void)setLinkClient:(id)a3;
- (void)setTvAppIconData:(id)a3;
- (void)setTvAppIconScale:(id)a3;
@end

@implementation AKAuthorizationRapportClient

- (AKAuthorizationRapportClient)init
{
  return 0;
}

- (AKAuthorizationRapportClient)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationRapportClient;
  v6 = [(AKAuthorizationRapportClient *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = (AKAuthorizationTVServicePresenter *)objc_alloc_init((Class)AKAuthorizationTVServicePresenter);
    companionServicePresenter = v7->_companionServicePresenter;
    v7->_companionServicePresenter = v8;
  }
  return v7;
}

- (void)performAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)sub_100077970();
  if (v8) {
    v8 = (objc_class *)sub_100077B84();
  }
  id v9 = objc_alloc_init(v8);
  v10 = (objc_class *)sub_100077970();
  if (v10) {
    v10 = (objc_class *)sub_100078258();
  }
  id v11 = objc_alloc_init(v10);
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000CEA24;
  v16[3] = &unk_10022B5C0;
  objc_copyWeak(&v21, &location);
  id v12 = v6;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v15 = v7;
  id v20 = v15;
  [(AKAuthorizationRapportClient *)self _verifyAccountTrustWithRequestContext:v12 completion:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_verifyAccountTrustWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 authorizationRequest];
  id v9 = [v8 authkitAccount];

  if (v9
    && (+[AKAccountManager sharedInstance],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 continuationTokenForAccount:v9],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    id v12 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    id v13 = [v6 authorizationRequest];
    id v14 = [v13 authkitAccount];
    id v15 = [v14 username];
    [v12 setUsername:v15];

    [v12 setIsUsernameEditable:0];
    id v16 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000CEC84;
    v17[3] = &unk_100227DB0;
    v17[4] = self;
    id v18 = v7;
    [v16 authenticateWithContext:v12 completion:v17];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_configureLinkClientWithService:(id)a3 companionLinkClient:(id)a4 requestContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_linkClient = &self->_linkClient;
  objc_storeStrong((id *)&self->_linkClient, a4);
  [(RPCompanionLinkClient *)self->_linkClient setControlFlags:12];
  objc_initWeak(location, self);
  linkClient = self->_linkClient;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000CF074;
  v29[3] = &unk_100227678;
  objc_copyWeak(&v30, location);
  [(RPCompanionLinkClient *)linkClient setInvalidationHandler:v29];
  id v13 = self->_linkClient;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000CF0F4;
  v27[3] = &unk_10022B5E8;
  objc_copyWeak(&v28, location);
  [(RPCompanionLinkClient *)v13 registerRequestID:@"com.apple.AuthKit.StartAuthorization" options:0 handler:v27];
  id v14 = *p_linkClient;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000CF180;
  v25[3] = &unk_10022B5E8;
  objc_copyWeak(&v26, location);
  [(RPCompanionLinkClient *)v14 registerRequestID:@"com.apple.AuthKit.AuthorizationDidFinish" options:0 handler:v25];
  id v15 = *p_linkClient;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000CF20C;
  v23[3] = &unk_10022B610;
  objc_copyWeak(&v24, location);
  [(RPCompanionLinkClient *)v15 registerEventID:@"com.apple.AuthKit.DidStartServerAuthorization" options:0 handler:v23];
  id v16 = *p_linkClient;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CF284;
  v19[3] = &unk_10022B638;
  objc_copyWeak(&v22, location);
  id v17 = v8;
  id v20 = v17;
  id v18 = v10;
  id v21 = v18;
  [(RPCompanionLinkClient *)v16 activateWithCompletion:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (void)performAuthorization:(id)a3 companionLinkClient:(id)a4 advertisingService:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (self->_advertisingService || self->_linkClient)
  {
    id v15 = _AKLogSiwa();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100194B14();
    }

    uint64_t v16 = -7071;
  }
  else
  {
    id v18 = [v11 passwordRequest];

    if (!v18)
    {
      objc_storeStrong((id *)&self->_credentialRequestContext, a3);
      id v20 = [v14 copy];
      id authorizationCompletion = self->_authorizationCompletion;
      self->_id authorizationCompletion = v20;

      [(AKAuthorizationRapportClient *)self _presentUI];
      [(AKAuthorizationRapportClient *)self _configureLinkClientWithService:v13 companionLinkClient:v12 requestContext:v11];
      goto LABEL_7;
    }
    id v19 = _AKLogSiwa();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[AKAuthorizationRapportClient performAuthorization:companionLinkClient:advertisingService:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Unable to satisfy password request", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v16 = -7027;
  }
  id v17 = +[NSError ak_errorWithCode:v16];
  (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v17);

LABEL_7:
}

- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AKAuthorizationRapportClient *)self _dismissUI];
  id v8 = (void (**)(id, id, id))objc_retainBlock(self->_authorizationCompletion);
  [(AKAuthorizationRapportClient *)self _invalidate];
  id v9 = objc_opt_new();
  id v10 = [v6 authorizedRequest];
  id v11 = [v10 altDSID];
  [v9 storeAuthorization:v6 withAltDSID:v11 forClient:self->_client];

  if (v8)
  {
    v8[2](v8, v6, v7);
  }
  else
  {
    id v12 = _AKLogSiwa();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v7 domain];
      int v14 = 138413058;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v13;
      __int16 v18 = 2048;
      id v19 = [v7 code];
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rapport authorization called with no completion callback. {authorization=%@, errorDomain=%{public}@, errorCode=%ld, error=%@}", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (void)_presentUIWithControllerClassName:(id)a3 extraOptions:(id)a4 presentationServiceCompletion:(id)a5
{
  +[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", -7014, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(AKAuthorizationRapportClient *)self _callCompletionWithAuthorization:0 error:v6];
}

- (void)_presentUI
{
  uint64_t v8 = AKAuthorizationTVServicePresenterOptionsKeyBundleID;
  v3 = [(AKClient *)self->_client bundleID];
  id v9 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CF9B0;
  v5[3] = &unk_10022B660;
  objc_copyWeak(&v6, &location);
  [(AKAuthorizationRapportClient *)self _presentUIWithControllerClassName:@"AKAuthorizationRemoteViewController" extraOptions:v4 presentationServiceCompletion:v5];
  [(AKAuthorizationRapportClient *)self _fetchTVAppIcon];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_handleStartAuthorizingWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received StartAuthorization. {request=%@, options=%@}", buf, 0x16u);
  }

  if (self->_hasEndorserAuthorizing)
  {
    id v12 = _AKLogSiwa();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring StartAuthorization, one is already in progress.", buf, 2u);
    }

    id v13 = +[NSError ak_errorWithCode:-7071];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
  }
  else
  {
    self->_hasEndorserAuthorizing = 1;
    [(RPAppSignInService *)self->_advertisingService invalidate];
    advertisingService = self->_advertisingService;
    self->_advertisingService = 0;

    [(AKAuthorizationRapportClient *)self _sendDidTapNotificationMessage];
    id v15 = [(AKClient *)self->_client localizedAppName];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedClientAppName:v15];

    __int16 v16 = [(AKClient *)self->_client bundleID];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedClientBundleID:v16];

    id v17 = [(AKClient *)self->_client appID];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedClientAppID:v17];

    __int16 v18 = [(AKClient *)self->_client teamID];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedClientTeamID:v18];

    id v19 = MCLockdownGetDeviceName();
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedDeviceName:v19];

    __int16 v20 = (void *)MGGetStringAnswer();
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_proxiedDeviceClass:v20];

    [(AKCredentialRequestContext *)self->_credentialRequestContext set_iconData:self->_tvAppIconData];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_iconScale:self->_tvAppIconScale];
    [(AKCredentialRequestContext *)self->_credentialRequestContext set_requirePassword:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000CFDA4;
    v25[3] = &unk_100227BA8;
    void v25[4] = self;
    id v26 = v10;
    id v21 = objc_retainBlock(v25);
    int v22 = [(AKCredentialRequestContext *)self->_credentialRequestContext passwordRequest];

    if (v22)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000CFEEC;
      v23[3] = &unk_10022B688;
      void v23[4] = self;
      id v24 = v21;
      [(AKAuthorizationRapportClient *)self _fetchAssociatedDomainsWithCompletionHandler:v23];
    }
    else
    {
      ((void (*)(void *))v21[2])(v21);
    }
  }
}

- (void)_handleAuthorizationDidFinishWithRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received AuthorizationDidFinish. {request=%@, options=%@}", buf, 0x16u);
  }

  id v12 = [v8 objectForKeyedSubscript:@"Error"];
  if (v12)
  {
    id v21 = 0;
    id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v21];
    id v14 = v21;
    if (!v13)
    {
      id v15 = _AKLogSiwa();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100194CE4();
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  __int16 v16 = [v8 objectForKeyedSubscript:@"Authorization"];
  if (v16)
  {
    id v20 = 0;
    id v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v20];
    id v18 = v20;
    if (!v17)
    {
      id v19 = _AKLogSiwa();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100194C7C();
      }
    }
  }
  else
  {
    id v17 = 0;
  }
  (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  [(AKAuthorizationRapportClient *)self _callCompletionWithAuthorization:v17 error:v13];
}

- (void)_invalidate
{
  [(RPAppSignInService *)self->_advertisingService invalidate];
  advertisingService = self->_advertisingService;
  self->_advertisingService = 0;

  [(RPCompanionLinkClient *)self->_linkClient invalidate];
  linkClient = self->_linkClient;
  self->_linkClient = 0;

  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)_fetchAssociatedDomainsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (sub_10003039C()) {
    id v5 = sub_100030828();
  }
  else {
    id v5 = 0;
  }
  id v6 = [(AKClient *)self->_client appID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D02E0;
  v8[3] = &unk_10022AA48;
  id v9 = v4;
  id v7 = v4;
  [v5 getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:v6 completionHandler:v8];
}

- (AKClient)client
{
  return self->_client;
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
}

- (id)authorizationCompletion
{
  return self->_authorizationCompletion;
}

- (void)setAuthorizationCompletion:(id)a3
{
}

- (AKAuthorizationTVServicePresenter)companionServicePresenter
{
  return self->_companionServicePresenter;
}

- (void)setCompanionServicePresenter:(id)a3
{
}

- (RPAppSignInService)advertisingService
{
  return self->_advertisingService;
}

- (void)setAdvertisingService:(id)a3
{
}

- (BOOL)hasEndorserAuthorizing
{
  return self->_hasEndorserAuthorizing;
}

- (void)setHasEndorserAuthorizing:(BOOL)a3
{
  self->_hasEndorserAuthorizing = a3;
}

- (AKCredentialRequestContext)credentialRequestContext
{
  return self->_credentialRequestContext;
}

- (void)setCredentialRequestContext:(id)a3
{
}

- (NSData)tvAppIconData
{
  return self->_tvAppIconData;
}

- (void)setTvAppIconData:(id)a3
{
}

- (NSNumber)tvAppIconScale
{
  return self->_tvAppIconScale;
}

- (void)setTvAppIconScale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvAppIconScale, 0);
  objc_storeStrong((id *)&self->_tvAppIconData, 0);
  objc_storeStrong((id *)&self->_credentialRequestContext, 0);
  objc_storeStrong((id *)&self->_advertisingService, 0);
  objc_storeStrong((id *)&self->_companionServicePresenter, 0);
  objc_storeStrong(&self->_authorizationCompletion, 0);
  objc_storeStrong((id *)&self->_linkClient, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end