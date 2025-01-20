@interface AKDServerUIController
- (AKDServerUIController)initWithClient:(id)a3;
- (AKDServerUIController)initWithLiaison:(id)a3 client:(id)a4 delegate:(id)a5;
- (id)_AKIDSCertificateFetchQueue;
- (id)_errorFromServerResponse:(id)a3;
- (id)_fetchPhoneInformationWithAdditionalInfo:(id)a3 error:(id *)a4;
- (id)resourceLoadDelegateWithContext:(id)a3;
- (id)resourceLoadDelegateWithContext:(id)a3 authResponse:(id)a4;
- (void)_decorateLoadDelegate:(id)a3 withContext:(id)a4;
- (void)_fetchIDSCertificateWithContext:(id)a3 completionHandler:(id)a4;
- (void)_reportPacTelemetryForEvent:(id)a3 context:(id)a4 error:(id)a5;
- (void)_showServerUIWithContext:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithServerContext:(id)a3 completion:(id)a4;
- (void)showServerUIWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKDServerUIController

- (AKDServerUIController)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = [(AKDServerUIController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (AKDServerUIController)initWithLiaison:(id)a3 client:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(AKDServerUIController *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authUILiaison, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_client, a4);
  }

  return v13;
}

- (id)_AKIDSCertificateFetchQueue
{
  if (qword_100272578 != -1) {
    dispatch_once(&qword_100272578, &stru_10022AC28);
  }
  v2 = (void *)qword_100272570;

  return v2;
}

- (void)showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 requestConfiguration];
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asking client to show server UI with %@...", buf, 0xCu);
  }
  id v10 = [v6 requestConfiguration];
  id v11 = [v10 resourceLoadDelegate];

  if (v11)
  {
    [(AKDServerUIController *)self _showServerUIWithContext:v6 completion:v7];
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AB3BC;
    v12[3] = &unk_10022AC50;
    id v15 = v7;
    id v13 = v6;
    v14 = self;
    [(AKDServerUIController *)self getServerUILoadDelegateWithServerContext:v13 completion:v12];
  }
}

- (void)_showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018F860(v6, v8);
  }

  id v9 = [v6 authContext];
  objc_initWeak(&location, self);
  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v12 = [v6 requestConfiguration];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AB5F4;
  v16[3] = &unk_10022ACA0;
  objc_copyWeak(&v21, &location);
  id v13 = v6;
  id v17 = v13;
  id v14 = v7;
  id v20 = v14;
  v18 = self;
  id v15 = v9;
  id v19 = v15;
  [(AKAuthenticationUILiaison *)authUILiaison presentServerProvidedUIForContext:v15 client:client withConfiguration:v12 completion:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)_errorFromServerResponse:(id)a3
{
  id v3 = +[AKAppleIDServerResourceLoadDelegate signalFromServerResponse:a3];
  v4 = 0;
  switch((unint64_t)v3)
  {
    case 0uLL:
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10018FA0C(v5);
      }
      uint64_t v6 = -7039;
      goto LABEL_14;
    case 1uLL:
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server UI has been skipped.", buf, 2u);
      }
      uint64_t v6 = -7038;
      goto LABEL_14;
    case 2uLL:
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server UI-based authentication has been canceled.", v10, 2u);
      }
      uint64_t v6 = -7003;
      goto LABEL_14;
    case 5uLL:
      id v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User elected to try again", v8, 2u);
      }
      uint64_t v6 = -7062;
LABEL_14:

      v4 = +[NSError ak_errorWithCode:v6];
      break;
    default:
      break;
  }

  return v4;
}

- (void)getServerUILoadDelegateWithServerContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 initiatingServerResponse];
  if (v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating resource load delegate with auth response", buf, 2u);
    }

    id v10 = [v6 authContext];
    uint64_t v11 = [(AKDServerUIController *)self resourceLoadDelegateWithContext:v10 authResponse:v8];
  }
  else
  {
    id v10 = [v6 authContext];
    uint64_t v11 = [(AKDServerUIController *)self resourceLoadDelegateWithContext:v10];
  }
  v12 = (void *)v11;

  id v13 = [v6 authContext];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ABEE8;
  v17[3] = &unk_10022ACC8;
  id v18 = v12;
  id v19 = self;
  id v20 = v6;
  id v21 = v7;
  id v14 = v7;
  id v15 = v6;
  id v16 = v12;
  [(AKDServerUIController *)self _fetchIDSCertificateWithContext:v13 completionHandler:v17];
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching resource load delegate", buf, 2u);
  }

  [(AKDServerUIController *)self resourceLoadDelegateWithContext:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AC1BC;
  v12[3] = &unk_10022ACC8;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v13;
  [(AKDServerUIController *)self _fetchIDSCertificateWithContext:v10 completionHandler:v12];
}

- (id)resourceLoadDelegateWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AKAppleIDServerResourceLoadDelegate);
  [(AKDServerUIController *)self _decorateLoadDelegate:v5 withContext:v4];

  return v5;
}

- (id)resourceLoadDelegateWithContext:(id)a3 authResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 proxiedDevice];

  if (v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Auth response received is for proxy, initializing resource load delegate accordingly", v23, 2u);
    }

    id v10 = +[AKAccountManager sharedInstance];
    id v11 = [v10 altDSIDforPrimaryiCloudAccount];

    v12 = +[AKAccountManager sharedInstance];
    id v13 = [v12 authKitAccountWithAltDSID:v11 error:0];

    id v14 = +[AKAccountManager sharedInstance];
    id v15 = [v14 masterTokenForAccount:v13];
    id v16 = [v15 stringValue];

    id v17 = [v6 altDSID];
    id v18 = [v6 masterToken];
    id v19 = [v18 stringValue];
  }
  else
  {
    id v11 = [v6 altDSID];
    id v20 = [v6 masterToken];
    id v16 = [v20 stringValue];

    id v19 = 0;
    id v17 = 0;
  }
  id v21 = [objc_alloc((Class)AKAppleIDServerResourceLoadDelegate) initWithAltDSID:v11 identityToken:v16];
  [v21 setProxiedAltDSID:v17];
  [v21 setProxiedIdentityToken:v19];
  objc_msgSend(v21, "setShouldSendSigningHeaders:", objc_msgSend(v6, "requireSigningHeaders"));
  [(AKDServerUIController *)self _decorateLoadDelegate:v21 withContext:v7];

  return v21;
}

- (void)_decorateLoadDelegate:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 decorateWithContext:v7];
  v8 = [(AKClient *)self->_client name];
  [v6 setClientAppName:v8];

  id v9 = [(AKClient *)self->_client bundleID];
  [v6 setClientBundleID:v9];

  id v24 = 0;
  id v10 = [v7 authKitAccount:&v24];
  id v11 = v24;
  if (!v10)
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not find an existing AuthKit account, so we can't attach account specific headers: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (![v7 _shouldSendGrandSlamTokensForRemoteUI])
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10018FAB8(v22);
    }
    goto LABEL_13;
  }
  v12 = +[AKAccountManager sharedInstance];
  id v13 = [v12 hearbeatTokenForAccount:v10];
  [v6 setHeartbeatToken:v13];

  id v14 = +[AKAccountManager sharedInstance];
  id v15 = [v14 activeServiceNamesForAccount:v10];
  [v6 setLoggedInServices:v15];

  if ([v7 _shouldSendIdentityTokenForRemoteUI])
  {
    id v16 = [v6 identityToken];

    if (!v16)
    {
      id v17 = +[AKAccountManager sharedInstance];
      id v18 = [v17 masterTokenForAccount:v10];
      id v19 = [v18 stringValue];
      [v6 setIdentityToken:v19];
    }
  }
  if (([v7 needsCredentialRecovery] & 1) != 0
    || [v7 needsPasswordChange])
  {
    id v20 = +[AKAccountManager sharedInstance];
    id v21 = [v20 continuationTokenForAccount:v10];
    [v6 setContinuationToken:v21];

    v22 = +[AKAccountManager sharedInstance];
    v23 = [v22 passwordResetTokenForAccount:v10];
    [v6 setPasswordResetToken:v23];

LABEL_13:
  }
}

- (void)_fetchIDSCertificateWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[AKDevice currentDevice];
  unsigned int v9 = [v8 isMultiUserMode];

  if (v9)
  {
    id v10 = +[NSError ak_errorWithCode:-7027];
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v10);
  }
  else
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to fetch IDS certificate...", buf, 2u);
    }

    v12 = _AKSignpostLogSystem();
    os_signpost_id_t v13 = _AKSignpostCreate();
    uint64_t v15 = v14;

    id v16 = _AKSignpostLogSystem();
    id v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FetchIDSPhoneCertificate", " enableTelemetry=YES ", buf, 2u);
    }

    id v18 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchIDSPhoneCertificate  enableTelemetry=YES ", buf, 0xCu);
    }

    id v19 = objc_alloc((Class)IDSPhoneCertificateVendor);
    id v20 = [(AKDServerUIController *)self _AKIDSCertificateFetchQueue];
    id v21 = [v19 initWithQueue:v20];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000ACB5C;
    v22[3] = &unk_10022ACF0;
    os_signpost_id_t v26 = v13;
    uint64_t v27 = v15;
    v22[4] = self;
    id v23 = v6;
    id v24 = v21;
    id v25 = v7;
    id v10 = v21;
    [v10 generatePhoneAuthenticationSignatureOverData:0 withCompletion:v22];
  }
}

- (id)_fetchPhoneInformationWithAdditionalInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[AKCarrierBundleUtilities sharedInstance];
  id v7 = [v6 phoneBundleInfoWithAdditionalInfo:v5 error:a4];

  return v7;
}

- (void)_reportPacTelemetryForEvent:(id)a3 context:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10018FC40();
  }

  id v11 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v9 eventName:v7 error:v8];

  if (v8) {
    v12 = &__kCFBooleanFalse;
  }
  else {
    v12 = &__kCFBooleanTrue;
  }
  [v11 setObject:v12 forKeyedSubscript:kAAFDidSucceed];
  os_signpost_id_t v13 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v13 sendEvent:v11];

  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10018FBCC();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_authUILiaison, 0);
}

@end