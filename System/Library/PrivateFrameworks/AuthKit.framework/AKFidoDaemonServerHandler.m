@interface AKFidoDaemonServerHandler
- (void)_handleFinishFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_handleStartFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8;
- (void)finishFidoAuthWithResponse:(id)a3 client:(id)a4 context:(id)a5 recoveryToken:(id)a6 completion:(id)a7;
- (void)startFidoAuthWithContext:(id)a3 recoveryToken:(id)a4 client:(id)a5 completion:(id)a6;
@end

@implementation AKFidoDaemonServerHandler

- (void)startFidoAuthWithContext:(id)a3 recoveryToken:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 _identityToken];

  if (!v14)
  {
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "GS token is missing, giving it a shot to receive it from the account", (uint8_t *)buf, 2u);
    }

    v16 = +[AKAccountManager sharedInstance];
    v17 = [v10 altDSID];
    v18 = [v16 authKitAccountWithAltDSID:v17 error:0];

    if (v18)
    {
      v19 = [v16 masterTokenForAccount:v18];
      v20 = [v19 stringValue];
      [v10 _setIdentityToken:v20];
    }
    else
    {
      v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100188A88();
      }
    }
  }
  v21 = (id *)&AKURLBagKeyFidoStartRecoveryAuthKey;
  if (!v11) {
    v21 = (id *)&AKURLBagKeyFidoStartAuthKey;
  }
  id v22 = *v21;
  v23 = [(AKURLRequestProviderImpl *)[AKFidoRequestProvider alloc] initWithContext:v10 urlBagKey:v22];
  v24 = v23;
  if (v12) {
    [(AKURLRequestProviderImpl *)v23 setClient:v12];
  }
  if (v11) {
    [(AKFidoRequestProvider *)v24 setRecoveryToken:v11];
  }
  v25 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v24];
  v26 = _AKLogFido();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100188A54();
  }

  objc_initWeak(buf, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100078C38;
  v30[3] = &unk_100229820;
  objc_copyWeak(&v34, buf);
  id v27 = v10;
  id v31 = v27;
  id v28 = v11;
  id v32 = v28;
  id v29 = v13;
  id v33 = v29;
  [(AKServiceControllerImpl *)v25 executeRequestWithCompletion:v30];

  objc_destroyWeak(&v34);
  objc_destroyWeak(buf);
}

- (void)_handleStartFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8
{
  id v10 = a4;
  id v11 = a7;
  id v12 = (void (**)(id, void, id))a8;
  id v13 = _AKLogFido();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100185240();
    }

    v12[2](v12, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100188BA4();
    }

    v15 = +[AAFSerialization dictionaryFromObject:v10 ofType:@"application/json"];
    v16 = _AKLogFido();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100188B30();
    }

    id v17 = [objc_alloc((Class)AKFidoContext) initWithParameters:v15];
    if (v17)
    {
      id v11 = 0;
    }
    else
    {
      v18 = _AKLogFido();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100188AC8();
      }

      id v11 = +[NSError ak_errorWithCode:-7010];
    }
    ((void (**)(id, id, id))v12)[2](v12, v17, v11);
  }
}

- (void)finishFidoAuthWithResponse:(id)a3 client:(id)a4 context:(id)a5 recoveryToken:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v31 = a7;
  v15 = (id *)&AKURLBagKeyFidoFinishRecoveryAuthKey;
  if (!v14) {
    v15 = (id *)&AKURLBagKeyFidoFinishAuthKey;
  }
  id v30 = *v15;
  v16 = [(AKURLRequestProviderImpl *)[AKFidoRequestProvider alloc] initWithContext:v13 urlBagKey:v30];
  id v17 = v16;
  if (v12) {
    [(AKURLRequestProviderImpl *)v16 setClient:v12];
  }
  id v29 = v12;
  if (v14) {
    [(AKFidoRequestProvider *)v17 setRecoveryToken:v14];
  }
  v39[0] = @"authenticatorData";
  v18 = [v11 authenticatorData];
  v40[0] = v18;
  v39[1] = @"clientData";
  v19 = [v11 clientData];
  v40[1] = v19;
  v39[2] = @"signature";
  v20 = [v11 signature];
  v40[2] = v20;
  v39[3] = @"credentialId";
  v21 = [v11 credentialID];
  v40[3] = v21;
  v39[4] = @"userHandle";
  id v22 = [v11 userIdentifier];
  v40[4] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];

  [(AKURLRequestProviderImpl *)v17 setAuthKitBody:v23];
  v24 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v17];
  v25 = _AKLogFido();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_100188BD8();
  }

  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000791BC;
  v33[3] = &unk_100229820;
  objc_copyWeak(&v37, &location);
  id v26 = v13;
  id v34 = v26;
  id v27 = v14;
  id v35 = v27;
  id v28 = v31;
  id v36 = v28;
  [(AKServiceControllerImpl *)v24 executeRequestWithCompletion:v33];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)_handleFinishFidoResponse:(id)a3 data:(id)a4 context:(id)a5 recoveryToken:(id)a6 error:(id)a7 completion:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a8;
  v15 = _AKLogFido();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100188C40();
    }

    (*((void (**)(id, void, void, id))v14 + 2))(v14, 0, 0, v13);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100188C0C();
    }

    uint64_t v17 = +[AAFSerialization dictionaryFromObject:v12 ofType:@"application/json"];
    v18 = [[AKAuthenticationServerResponse alloc] initWithServerResponse:v11 responseBody:v17];
    (*((void (**)(id, AKAuthenticationServerResponse *, uint64_t, void))v14 + 2))(v14, v18, v17, 0);

    id v14 = (id)v17;
  }
}

@end