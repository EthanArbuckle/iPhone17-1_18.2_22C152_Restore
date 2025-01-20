@interface AKAccountRecoveryController
+ (BOOL)shouldProcessServerUIRequest:(id)a3;
- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4;
- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4 requestDispatcher:(id)a5;
- (id)_recoveryContextFromServerInfo:(id)a3 error:(id *)a4;
- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5;
- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)retrieveRecoveryDataForServerContext:(id)a3 recoveryInfo:(id)a4 completion:(id)a5;
- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation AKAccountRecoveryController

- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4 requestDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKAccountRecoveryController;
  v12 = [(AKAccountRecoveryController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authUILiaison, a3);
    objc_storeStrong((id *)&v13->_client, a4);
    objc_storeStrong((id *)&v13->_requestDispatcher, a5);
  }

  return v13;
}

- (AKAccountRecoveryController)initWithUILiaison:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AKRequestDispatcher sharedDispatcher];
  id v9 = [(AKAccountRecoveryController *)self initWithUILiaison:v7 client:v6 requestDispatcher:v8];

  return v9;
}

+ (BOOL)shouldProcessServerUIRequest:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:AKActionHeaderKey];
  if ([v3 isEqualToString:AKActionValidateMK]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:AKActionStartICSC];
  }

  return v4;
}

- (void)retrieveRecoveryDataForServerContext:(id)a3 recoveryInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v24 = 0;
  id v11 = [(AKAccountRecoveryController *)self _recoveryContextFromServerInfo:v9 error:&v24];
  id v12 = v24;
  v13 = _AKLogSystem();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v15 = [v11 description];
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AKAccountRecoveryController recoveryContext is valid %@:", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    authUILiaison = self->_authUILiaison;
    v17 = [v8 authContext];
    client = self->_client;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100024C18;
    v19[3] = &unk_1002272A0;
    objc_copyWeak(&v23, (id *)buf);
    id v20 = v8;
    id v21 = v11;
    id v22 = v10;
    [(AKAuthenticationUILiaison *)authUILiaison presentNativeRecoveryUIForContext:v17 recoveryContext:v21 client:client completion:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10017D784();
    }

    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v12);
  }
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 decodedRecoveryIdentityTokenString];
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10017D8C8();
    }

    uint64_t v23 = -7026;
    goto LABEL_12;
  }
  if (![v8 length])
  {
    id v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10017D894();
    }

    uint64_t v23 = -7056;
LABEL_12:
    id v10 = +[NSError ak_errorWithCode:v23];
    v7[2](v7, 0, v10);
    goto LABEL_13;
  }
  id v9 = [v6 authContext];
  id v10 = [v9 altDSID];

  id v11 = +[AKURLBag bagForAltDSID:v10];
  id v12 = [v11 renewRecoveryTokenURL];

  id v13 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v12];
  [v13 setHTTPMethod:@"POST"];
  v14 = [(AKClient *)self->_client name];
  objc_msgSend(v13, "ak_addClientApp:", v14);

  objc_super v15 = [(AKClient *)self->_client bundleID];
  objc_msgSend(v13, "ak_addClientBundleIDHeader:", v15);

  objc_msgSend(v13, "ak_addClientInfoHeader");
  objc_msgSend(v13, "ak_addDeviceUDIDHeader");
  objc_msgSend(v13, "ak_addInternalBuildHeader");
  objc_msgSend(v13, "ak_addSeedBuildHeader");
  objc_msgSend(v13, "ak_addFeatureMaskHeader");
  v16 = [v6 authContext];
  v17 = [v16 altDSID];
  objc_msgSend(v13, "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:", v8, v17);

  v28[0] = AKRequestBodyKey;
  v28[1] = AKRequestHeadersKey;
  v29[0] = &__NSDictionary0__struct;
  v29[1] = &__NSDictionary0__struct;
  v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  objc_msgSend(v13, "ak_setBodyWithParameters:", v18);
  v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Recovery token renewal will start.", buf, 2u);
  }

  id v20 = +[AKURLSession sharedURLSession];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000255E0;
  v25[3] = &unk_1002272C8;
  v26 = v7;
  id v21 = [v20 beginDataTaskWithRequest:v13 completionHandler:v25];

LABEL_13:
}

- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v11 = [AKSRPAuthenticationContextHelper alloc];
    id v12 = [v9 authContext];
    id v13 = [(AKSRPAuthenticationContextHelper *)v11 initWithContext:v12];

    [(AKSRPContextHelper *)v13 setAccountRecoveryMasterKey:v8];
    v14 = [v9 decodedRecoveryIdentityTokenString];
    [(AKSRPContextHelper *)v13 setDecodedRecoveryIdentityToken:v14];

    objc_super v15 = [v9 decodedRecoveryPETString];
    [(AKSRPContextHelper *)v13 setDecodedRecoveryPET:v15];

    [(AKSRPContextHelper *)v13 setClient:self->_client];
    [(AKSRPContextHelper *)v13 setIgnoreInternalTokens:1];
    v16 = [v9 authContext];
    v17 = [v16 altDSID];

    v18 = +[AKURLBag bagForAltDSID:v17];
    uint64_t v19 = AKURLBagKeyBasicAuthKey;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100025AA0;
    v22[3] = &unk_100227318;
    uint64_t v23 = v13;
    id v24 = v9;
    v25 = self;
    id v26 = v10;
    id v20 = v13;
    [v18 urlForKey:v19 completion:v22];
  }
  else
  {
    id v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10017D8C8();
    }

    v17 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to persist verifier", buf, 2u);
  }

  id v11 = [v7 keyType];
  BOOL v12 = v11 != (id)1;
  BOOL v13 = v11 == (id)1;
  v14 = (id *)&AKURLBagKeyStoreModernRecovery;
  if (v11 == (id)1) {
    v14 = (id *)&AKURLBagKeyStoreEDPToken;
  }
  id v15 = *v14;
  v16 = [(AKURLRequestProviderImpl *)[AKGrandSlamRequestProvider alloc] initWithContext:v9 urlBagKey:v15];

  v17 = [v7 verifier];
  [(AKURLRequestProviderImpl *)v16 setAuthKitBody:v17];

  [(AKGrandSlamRequestProvider *)v16 setShouldSendIdentityToken:v12];
  [(AKGrandSlamRequestProvider *)v16 setRequestBodyType:v13];
  [(AKGrandSlamRequestProvider *)v16 setExpectedResponseType:v13];
  v18 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v16];
  id v19 = objc_alloc_init((Class)AKAuthHandlerImpl);
  [(AKServiceControllerImpl *)v18 setAuthenticationDelegate:v19];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002615C;
  v21[3] = &unk_100227340;
  id v22 = v8;
  id v20 = v8;
  [(AKServiceControllerImpl *)v18 executeRequestWithCompletion:v21];
}

- (id)_recoveryContextFromServerInfo:(id)a3 error:(id *)a4
{
  v5 = +[AKAccountRecoveryContext recoveryContextWithServerInfo:a3];
  unsigned int v6 = [v5 isValid];
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Recovery context is valid...", v17, 2u);
    }

    a4 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10017DAD8();
    }

    if (a4)
    {
      *a4 = +[NSError ak_errorWithCode:-7059];
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10017DA68((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
      }

      a4 = 0;
    }
  }

  return a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDispatcher, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_authUILiaison, 0);
}

@end