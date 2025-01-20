@interface AKEducationEnterpriseController
- (AKEducationEnterpriseController)initWithContext:(id)a3 client:(id)a4;
- (void)_handleIdentityProviderResponsePayload:(id)a3 completion:(id)a4;
- (void)_showIdentityProviderUIFromResponse:(id)a3 completion:(id)a4;
- (void)beginFederatedAuthWithInitialResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation AKEducationEnterpriseController

- (AKEducationEnterpriseController)initWithContext:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKEducationEnterpriseController;
  v9 = [(AKEducationEnterpriseController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v10;
}

- (void)beginFederatedAuthWithInitialResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAppleIDAuthenticationContext *)self->_context username];

  if (v8)
  {
    v9 = [(AKAppleIDAuthenticationContext *)self->_context altDSID];
    v10 = +[AKURLBag bagForAltDSID:v9];
    v11 = [v6 secondaryActionURLKey];
    objc_super v12 = [v10 _urlAtKey:v11];

    if (v12)
    {
      id v13 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v12];
      v14 = [(AKAppleIDAuthenticationContext *)self->_context username];
      [v13 setValue:v14 forHTTPHeaderField:AKAccountNameHeaderKey];

      v15 = [v6 federatedAuthSamlRequest];
      v16 = [v15 objectForKeyedSubscript:@"RelayState"];

      if (v16) {
        [v13 setValue:v16 forHTTPHeaderField:@"X-Apple-I-FA-Relay-State"];
      }
      [(AKAppleIDAuthenticationContext *)self->_context set_shouldSendGrandSlamTokensForRemoteUI:0];
      v17 = +[AKDServerUIContext serverUIContextFromResponse:v6 authContext:self->_context urlRequest:v13];
      [v17 setShouldPreventDismissAfterUserSkip:1];
      v18 = [v17 requestConfiguration];
      [v18 setPresentationType:2];

      v19 = [AKDServerUIController alloc];
      v20 = +[AKAuthenticationUILiaison sharedInstance];
      v21 = [(AKDServerUIController *)v19 initWithLiaison:v20 client:self->_client delegate:0];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000D27E4;
      v23[3] = &unk_100228AB8;
      v23[4] = self;
      id v24 = v6;
      id v25 = v7;
      [(AKDServerUIController *)v21 showServerUIWithContext:v17 completion:v23];
    }
    else
    {
      v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1001950F8(v22);
      }

      [(AKEducationEnterpriseController *)self _showIdentityProviderUIFromResponse:v6 completion:v7];
    }
  }
  else
  {
    v9 = +[NSError ak_errorWithCode:-7022];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
}

- (void)_showIdentityProviderUIFromResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 federatedAuthURL];
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Server says to show UI at IDP URL: %@", buf, 0xCu);
  }
  v10 = [v6 federatedAuthURL];
  v11 = +[NSURL URLWithString:v10];

  objc_super v12 = +[NSMutableURLRequest requestWithURL:v11];
  [v12 setHTTPMethod:@"POST"];
  [v12 setHTTPContentType:@"application/x-www-form-urlencoded"];
  id v13 = [v6 federatedAuthRequestPayload];
  [v12 setHTTPBody:v13];

  v14 = +[AKDServerUIContext serverUIContextFromResponse:v6 authContext:self->_context urlRequest:v12];
  v15 = [v14 requestConfiguration];
  [v15 setRequestType:1];

  v16 = [v6 federatedAuthURLWhiteList];
  v17 = [v14 requestConfiguration];
  [v17 setWhitelistedPathURLs:v16];

  v18 = [AKDServerUIController alloc];
  v19 = +[AKAuthenticationUILiaison sharedInstance];
  v20 = [(AKDServerUIController *)v18 initWithLiaison:v19 client:self->_client delegate:0];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000D2B78;
  v22[3] = &unk_10022B720;
  v22[4] = self;
  id v23 = v7;
  id v21 = v7;
  [(AKDServerUIController *)v20 showServerUIWithContext:v14 completion:v22];
}

- (void)_handleIdentityProviderResponsePayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling IDP response: %@", buf, 0xCu);
    }

    v9 = [v6 objectForKeyedSubscript:AKRequestURLKey];
    unsigned int v10 = +[AKFeatureManager isYorktownEnabled];
    v11 = &off_100225E30;
    if (!v10) {
      v11 = &off_100225E78;
    }
    id v12 = [objc_alloc(*v11) initWithContext:self->_context url:v9];
    id v13 = [v6 objectForKeyedSubscript:AKRequestBodyKey];
    v14 = [v13 dataUsingEncoding:4];
    [v12 setAuthKitBodyData:v14];

    [v12 setClient:self->_client];
    v15 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000D2E9C;
    v17[3] = &unk_100227340;
    id v18 = v7;
    [(AKServiceControllerImpl *)v15 executeRequestWithCompletion:v17];
  }
  else
  {
    v16 = +[NSError ak_errorWithCode:-7019];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v16);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end