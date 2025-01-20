@interface AKSRPService
- (AKSRPService)initWithClient:(id)a3;
- (AKSRPService)initWithClient:(id)a3 requestDispatcher:(id)a4;
- (BOOL)_shouldClearCKForFailedMagicAuthWithError:(int64_t)a3 authContextHelper:(id)a4;
- (id)_anisetteActionTargetForServerResponse:(id)a3 andContext:(id)a4;
- (void)_continueSRPContractWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_doURLSwitchWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_handleError:(id)a3 withServerResponse:(id)a4 context:(id)a5 andCompletion:(id)a6;
- (void)_parseFailedServerResponse:(id)a3 withError:(id)a4 context:(id)a5 completion:(id)a6;
- (void)_reprovisionAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_resyncAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)performSRPContractWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKSRPService

- (AKSRPService)initWithClient:(id)a3 requestDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKSRPService;
  v9 = [(AKSRPService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_requestDispatcher, a4);
  }

  return v10;
}

- (AKSRPService)initWithClient:(id)a3
{
  id v4 = a3;
  v5 = +[AKRequestDispatcher sharedDispatcher];
  v6 = [(AKSRPService *)self initWithClient:v4 requestDispatcher:v5];

  return v6;
}

- (void)performSRPContractWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 altDSID];
  v9 = +[AKURLBag bagForAltDSID:v8];
  uint64_t v10 = AKURLBagKeyBasicAuthKey;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081628;
  v13[3] = &unk_100229A00;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 urlForKey:v10 completion:v13];
}

- (void)_continueSRPContractWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [AKSRPRequest alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000817F0;
  v15[3] = &unk_100229A28;
  id v16 = v8;
  id v17 = v9;
  v15[4] = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = [(AKSRPRequest *)v11 initWithURL:v10 contextHelper:v12 completionHandler:v15];

  [(AKRequestDispatcher *)self->_requestDispatcher submitDispatchableRequest:v14];
}

- (void)_parseFailedServerResponse:(id)a3 withError:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1001897EC((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
  }

  if ([v10 isAnisetteResyncRequired])
  {
    [(AKSRPService *)self _resyncAnisetteWithServerResponse:v10 context:v12 completion:v13];
    goto LABEL_24;
  }
  if ([v10 isAnisetteReprovisioningRequired])
  {
    v21 = +[NSError ak_generalErrorWithCode:-8027 errorDomain:AKAnisetteErrorDomain underlyingError:v11];
    v22 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.midInvalidated" error:v21];
    v23 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v23 sendEvent:v22];

    [(AKSRPService *)self _reprovisionAnisetteWithServerResponse:v10 context:v12 completion:v13];
LABEL_7:

    goto LABEL_24;
  }
  if ([v10 isURLSwitchingRequired])
  {
    [(AKSRPService *)self _doURLSwitchWithServerResponse:v10 context:v12 completion:v13];
    goto LABEL_24;
  }
  if ([v10 isRetryRequired] && (objc_msgSend(v12, "retryAuth") & 1) == 0)
  {
    v25 = _AKLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Server told us to retry. Retrying auth...", v29, 2u);
    }

    [v12 setRetryAuth:1];
    [(AKSRPService *)self performSRPContractWithContext:v12 completion:v13];
  }
  else
  {
    if (![v10 isSecondaryActionRequired])
    {
      if (!v11 || [v11 code] != (id)6)
      {
        [(AKSRPService *)self _handleError:v11 withServerResponse:v10 context:v12 andCompletion:v13];
        goto LABEL_24;
      }
      v21 = +[NSError ak_errorWithCode:-7005 underlyingError:v11];
      +[AKCAAuthEventReporter reportAuthEventOfType:AKAuthEventType_SRP_AUTH_FAILURE success:0 error:v21];
      if ([v12 retryAuth])
      {
        v13[2](v13, 0, v21);
      }
      else
      {
        v26 = _AKLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Network error. Retrying auth once...", (uint8_t *)v27, 2u);
        }

        [v12 setRetryAuth:1];
        [(AKSRPService *)self performSRPContractWithContext:v12 completion:v13];
      }
      goto LABEL_7;
    }
    v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Auth failed but the server says to try a secondary auth action anyway. Let's how this goes...", buf, 2u);
    }

    ((void (**)(id, id, void *))v13)[2](v13, v10, 0);
  }
LABEL_24:
}

- (id)_anisetteActionTargetForServerResponse:(id)a3 andContext:(id)a4
{
  id v5 = a4;
  if ([a3 shouldProxyAnisetteAction])
  {
    id v6 = [v5 authContext];
    id v7 = [v6 proxiedDevice];
  }
  else
  {
    id v7 = +[AKDevice currentDevice];
  }

  return v7;
}

- (void)_resyncAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Need Anisette resync...", buf, 2u);
  }

  id v12 = [(AKSRPService *)self _anisetteActionTargetForServerResponse:v10 andContext:v8];
  id v13 = [AKAnisetteProvisioningService alloc];
  client = self->_client;
  uint64_t v15 = [v8 authContext];
  uint64_t v16 = [(AKAnisetteProvisioningService *)v13 initWithClient:client authenticationContext:v15];

  uint64_t v17 = [v10 anisetteResyncData];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100081E70;
  v20[3] = &unk_1002286A8;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  [(AKAnisetteProvisioningService *)v16 syncAnisetteWithSIMData:v17 device:v12 completion:v20];
}

- (void)_reprovisionAnisetteWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Need Anisette reprovisioning...", buf, 2u);
  }

  id v12 = [(AKSRPService *)self _anisetteActionTargetForServerResponse:v10 andContext:v8];

  id v13 = [AKAnisetteProvisioningService alloc];
  client = self->_client;
  uint64_t v15 = [v8 authContext];
  uint64_t v16 = [(AKAnisetteProvisioningService *)v13 initWithClient:client authenticationContext:v15];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000821EC;
  v19[3] = &unk_1002286A8;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v17 = v9;
  id v18 = v8;
  [(AKAnisetteProvisioningService *)v16 eraseAnisetteForDevice:v12 completion:v19];
}

- (void)_doURLSwitchWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "URLSwitching needed...", buf, 2u);
  }

  id v12 = [v8 urlSwitchingData];

  if (v12)
  {
    id v13 = [v9 altDSID];
    id v14 = +[AKURLBag bagForAltDSID:v13];
    uint64_t v15 = [v8 urlSwitchingData];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000825C8;
    v18[3] = &unk_1002286A8;
    v18[4] = self;
    id v19 = v9;
    id v20 = v10;
    [v14 forceUpdateBagWithUrlSwitchData:v15 completion:v18];
  }
  else
  {
    uint64_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100189858(v16);
    }

    id v17 = +[NSError ak_errorWithCode:-7087];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

- (void)_handleError:(id)a3 withServerResponse:(id)a4 context:(id)a5 andCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v52 = (void (**)(id, void, id))a6;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v14 = [v10 errorMessage];
  if (v14
    && (uint64_t v15 = (void *)v14,
        [v10 errorMessageTitle],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    id v17 = [v10 errorMessageTitle];
    [v13 setObject:v17 forKeyedSubscript:NSLocalizedFailureErrorKey];

    id v18 = &NSLocalizedFailureReasonErrorKey;
  }
  else
  {
    id v19 = [v10 errorMessage];

    if (!v19) {
      goto LABEL_7;
    }
    id v18 = &NSLocalizedDescriptionKey;
  }
  id v20 = [v10 errorMessage];
  [v13 setObject:v20 forKeyedSubscript:*v18];

LABEL_7:
  v53 = v12;
  if (![v10 errorCode])
  {
    id v22 = 0;
    v27 = 0;
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  uint64_t v21 = AKAppleIDAuthenticationServerErrorDomain;
  id v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKAppleIDAuthenticationServerErrorDomain, [v10 errorCode], 0);
  if ([v10 subErrorCode])
  {
    v23 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, [v10 subErrorCode], 0);
    NSErrorUserInfoKey v54 = NSUnderlyingErrorKey;
    v55 = v23;
    v24 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    objc_msgSend(v22, "ak_errorByAppendingUserInfo:", v24);
    v26 = id v25 = v13;

    id v22 = (void *)v26;
    id v13 = v25;
  }
  if (v9)
  {
LABEL_15:
    v28 = [v9 underlyingErrors];
    id v29 = [v28 count];

    if (v29 || !v22)
    {
      NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    }
    else
    {
      id v30 = objc_alloc_init((Class)NSMutableDictionary);
      NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
      [v30 setObject:v22 forKeyedSubscript:NSUnderlyingErrorKey];
      [v30 addEntriesFromDictionary:v13];
      objc_msgSend(v9, "ak_errorByAppendingUserInfo:", v30);
      v33 = id v32 = v13;

      id v9 = (id)v33;
      id v13 = v32;
    }
    [v53 setObject:v9 forKeyedSubscript:v31];
    v27 = v9;
    goto LABEL_20;
  }
  if (v22) {
    [v12 setObject:v22 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  v27 = 0;
LABEL_20:
  if ([v10 errorCode] == (id)-20101
    || [v10 errorCode] == (id)-22406
    || [v10 errorCode] == (id)-22407)
  {
    uint64_t v34 = -7006;
  }
  else
  {
    uint64_t v34 = -7018;
  }
  if ([v10 errorCode] == (id)-28043) {
    uint64_t v34 = -7093;
  }
  if ([v10 errorCode] == (id)-28044) {
    uint64_t v34 = -7094;
  }
  if ([v10 errorCode] == (id)-80039) {
    uint64_t v34 = -7120;
  }
  v35 = [v11 authKitAccount];
  if (v35)
  {
    v36 = +[AKAccountManager sharedInstance];
    if ([v36 isManagedAppleIDForAccount:v35])
    {
      id v50 = v13;
      v37 = [v36 managedOrganizationNameForAccount:v35];
      v38 = [v11 client];
      v39 = [v38 localizedAppName];

      [v53 setObject:&__kCFBooleanTrue forKeyedSubscript:AKIsManagedAccountKey];
      if ([v37 length]) {
        [v53 setObject:v37 forKeyedSubscript:AKManagedOrganizationNameKey];
      }
      if ([v39 length]) {
        [v53 setObject:v39 forKeyedSubscript:AKManagedLocalizedAppNameKey];
      }
      if ([v10 errorCode] == (id)-24019) {
        uint64_t v34 = -7027;
      }

      id v13 = v50;
    }
  }
  if ([v10 errorCode] == (id)-310003) {
    uint64_t v34 = -7100;
  }
  if ([v10 errorCode] == (id)-27420) {
    uint64_t v40 = -7095;
  }
  else {
    uint64_t v40 = v34;
  }
  if (v22 && v40 == -7018)
  {
    v41 = v27;
    id v42 = v27;
  }
  else
  {
    [v53 addEntriesFromDictionary:v13];
    id v42 = +[NSError errorWithDomain:AKAppleIDAuthenticationErrorDomain code:v40 userInfo:v53];
    v41 = v27;
  }
  +[AKCAAuthEventReporter reportAuthEventOfType:AKAuthEventType_SRP_AUTH_FAILURE success:0 error:v42];
  if ([v10 errorCode] == (id)-22406
    || [v10 errorCode] == (id)-22407
    || -[AKSRPService _shouldClearCKForFailedMagicAuthWithError:authContextHelper:](self, "_shouldClearCKForFailedMagicAuthWithError:authContextHelper:", [v10 errorCode], v11))
  {
    [v11 clearContinuationTokenIfSupportedWithError:v42];
  }
  if ([v10 errorCode] == (id)-22446)
  {
    v43 = [v11 passwordResetToken];

    if (v43)
    {
      v44 = [v11 authContext];
      if (v44)
      {
        id v45 = v13;
        v46 = [v11 authContext];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v48 = [v11 authContext];
          v44 = [v48 telemetryFlowID];
        }
        else
        {
          v44 = 0;
        }
        id v13 = v45;
      }
      v49 = +[AKAccountManager sharedInstance];
      [v49 removePasswordResetTokenForAccount:v35 telemetryFlowID:v44 error:v42];

      v41 = v27;
    }
  }
  if (v52) {
    v52[2](v52, 0, v42);
  }
}

- (BOOL)_shouldClearCKForFailedMagicAuthWithError:(int64_t)a3 authContextHelper:(id)a4
{
  if (a3 != -22446) {
    return 0;
  }
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  id v6 = [a4 authContext];
  id v7 = [v6 companionDevice];

  if (!v7) {
    return 0;
  }
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invalid PRK returned from server and we're doing a companion auth. We should clear CK", v10, 2u);
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDispatcher, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end