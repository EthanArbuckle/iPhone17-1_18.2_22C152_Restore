@interface AKPrivateEmailDaemonService
- (AKClient)client;
- (AKPrivateEmailDaemonService)init;
- (AKPrivateEmailDaemonService)initWithClient:(id)a3;
- (BOOL)_verifyEntitlements;
- (void)_cacheFetchedPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)_performFetchSiwAHmeRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performRegisterRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performRequestForContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3;
- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)getContextForRequestContext:(id)a3 completion:(id)a4;
- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4;
- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4;
- (void)privateEmailListVersionWithCompletion:(id)a3;
- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5;
- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4;
- (void)removePrivateEmailKey:(id)a3 completion:(id)a4;
- (void)removePrivateEmailWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKPrivateEmailDaemonService

- (AKPrivateEmailDaemonService)init
{
  return 0;
}

- (AKPrivateEmailDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKPrivateEmailDaemonService;
  v6 = [(AKPrivateEmailDaemonService *)&v10 init];
  if (v6)
  {
    v7 = _AKLogHme();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 bundleID];
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Private email service initialized with client id %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v6;
}

- (void)dealloc
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Private email service deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AKPrivateEmailDaemonService;
  [(AKPrivateEmailDaemonService *)&v4 dealloc];
}

- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)AKPrivateEmailContext) initWithKey:v9 altDSID:v10];

  [(AKPrivateEmailDaemonService *)self lookupPrivateEmailWithContext:v11 completion:v8];
}

- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v7 = +[AKAccountManager sharedInstance];
  id v8 = [v5 altDSID];
  id v9 = [v7 authKitAccountWithAltDSID:v8 error:0];

  if (v9)
  {
    [v5 sanitiseInternalState];
    id v10 = +[AKPrivateEmailStoreManager sharedInstance];
    id v19 = 0;
    id v11 = [v10 emailForContext:v5 error:&v19];
    id v12 = v19;
    v13 = _AKLogHme();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        v15 = [v5 key];
        v16 = [v5 clientAppBundleId];
        *(_DWORD *)buf = 138412802;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = v11;
        __int16 v24 = 2112;
        v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Email found for %@: %@ [bundle:%@]", buf, 0x20u);
LABEL_10:
      }
    }
    else if (v14)
    {
      v15 = [v5 altDSID];
      v16 = [v5 key];
      v18 = [v5 clientAppBundleId];
      *(_DWORD *)buf = 138412802;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No match found with given altDSID: %@ for key %@ [bundle:%@]", buf, 0x20u);

      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v17 = _AKLogHme();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1001869AC(v5);
  }

  id v12 = +[NSError ak_errorWithCode:-7025];
  id v11 = 0;
LABEL_12:
  v6[2](v6, v11, v12);
}

- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)AKPrivateEmailContext) initWithKey:v9 altDSID:v10];

  [(AKPrivateEmailDaemonService *)self fetchPrivateEmailWithContext:v11 completion:v8];
}

- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKPrivateEmailDaemonService *)self _verifyEntitlements])
  {
    id v8 = +[AKAccountManager sharedInstance];
    id v9 = [v6 altDSID];
    id v10 = [v8 authKitAccountWithAltDSID:v9 error:0];

    if (v10)
    {
      [v6 sanitiseInternalState];
      id v32 = 0;
      unsigned __int8 v11 = +[AKPrivateEmailValidator canPerformRequestWithAccount:v10 error:&v32];
      id v12 = v32;
      if (v11)
      {
        v13 = _AKLogHme();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[ios] requesting for %@", buf, 0xCu);
        }

        [(AKPrivateEmailDaemonService *)self _performRequestForContext:v6 completion:v7];
      }
      else
      {
        v36[0] = NSLocalizedDescriptionKey;
        v28 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        v27 = [v28 localizedStringForKey:@"HME_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_TITLE" value:&stru_100233250 table:@"Localizable"];
        v37[0] = v27;
        v36[1] = NSLocalizedFailureReasonErrorKey;
        v26 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        v25 = [v26 localizedStringForKey:@"HME_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_MESSAGE" value:&stru_100233250 table:@"Localizable"];
        v37[1] = v25;
        v36[2] = NSLocalizedRecoveryOptionsErrorKey;
        v16 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        v17 = [v16 localizedStringForKey:@"HME_ERROR_ALERT_BUTTON_CONTINUE" value:&stru_100233250 table:@"Localizable"];
        v35[0] = v17;
        v18 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
        id v19 = [v18 localizedStringForKey:@"HME_ERROR_ALERT_BUTTON_CLOSE" value:&stru_100233250 table:@"Localizable"];
        v35[1] = v19;
        v20 = +[NSArray arrayWithObjects:v35 count:2];
        v37[2] = v20;
        v21 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];

        __int16 v22 = [v12 domain];
        v23 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, [v12 code], v21);

        __int16 v24 = +[AKAlertHandler sharedInstance];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10006B9B8;
        v29[3] = &unk_100227250;
        id v31 = v7;
        id v12 = v12;
        id v30 = v12;
        [v24 showAlertForError:v23 withCompletion:v29];
      }
    }
    else
    {
      v15 = _AKLogHme();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100186A30(v6);
      }

      id v12 = +[NSError ak_errorWithCode:-7025];
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
    }
  }
  else
  {
    BOOL v14 = _AKLogHme();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100186AB4(v6);
    }

    id v10 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)AKPrivateEmailContext);
  id v12 = [v11 initWithKey:v9 altDSID:v10 originType:AKPrivateEmailOriginTypeMailApp originIdentifier:0];

  [(AKPrivateEmailDaemonService *)self registerPrivateEmailWithContext:v12 completion:v8];
}

- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(AKPrivateEmailDaemonService *)self _verifyEntitlements])
  {
    id v8 = +[AKAccountManager sharedInstance];
    id v9 = [v6 altDSID];
    id v10 = [v8 authKitAccountWithAltDSID:v9 error:0];

    if (v10)
    {
      id v16 = 0;
      unsigned int v11 = +[AKPrivateEmailValidator canPerformRequestWithAccount:v10 error:&v16];
      id v12 = v16;
      if (v11)
      {
        [(AKPrivateEmailDaemonService *)self _performRegisterRequestWithContext:v6 completion:v7];
LABEL_15:

        goto LABEL_16;
      }
      v15 = _AKLogHme();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100186BBC(v6);
      }
    }
    else
    {
      BOOL v14 = _AKLogHme();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100186B38(v6);
      }

      id v12 = +[NSError ak_errorWithCode:-7055];
    }
    v7[2](v7, 0, v12);
    goto LABEL_15;
  }
  v13 = _AKLogHme();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100186C40(v6);
  }

  id v10 = +[NSError ak_errorWithCode:-7026];
  v7[2](v7, 0, v10);
LABEL_16:
}

- (void)getContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![(AKPrivateEmailDaemonService *)self _verifyEntitlements])
  {
    v13 = _AKLogHme();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100186E08();
    }

    uint64_t v14 = -7026;
    goto LABEL_15;
  }
  id v8 = [v6 altDSID];

  if (!v8)
  {
    v15 = _AKLogHme();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100186CC4();
    }

    uint64_t v14 = -7025;
    goto LABEL_15;
  }
  id v9 = +[AKAccountManager sharedInstance];
  id v10 = [v6 altDSID];
  unsigned int v11 = [v9 authKitAccountWithAltDSID:v10 error:0];

  if (!v11)
  {
    id v16 = _AKLogHme();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100186D30();
    }

    uint64_t v14 = -7044;
LABEL_15:
    id v12 = +[NSError ak_errorWithCode:v14];
    v7[2](v7, 0, v12);
    goto LABEL_16;
  }

  [v6 sanitiseInternalState];
  id v12 = [objc_alloc((Class)AKPrivateEmailContext) initWithContext:v6 client:self->_client];
  if (v12)
  {
    ((void (**)(id, id, id))v7)[2](v7, v12, 0);
  }
  else
  {
    v17 = _AKLogHme();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100186D9C();
    }

    v18 = +[NSError ak_errorWithCode:-7011];
    v7[2](v7, 0, v18);
  }
LABEL_16:
}

- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  if ([(AKPrivateEmailDaemonService *)self _verifyEntitlements])
  {
    id v8 = +[AKAccountManager sharedInstance];
    id v9 = [v8 authKitAccountWithAltDSID:v6 error:0];

    if (v9)
    {
      id v10 = +[AKPrivateEmailStoreManager sharedInstance];
      id v17 = 0;
      uint64_t v11 = [v10 fetchAllPrivateEmailsWithError:&v17];
      id v12 = v17;
      v13 = _AKLogHme();
      uint64_t v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100186EE0();
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Private Emails found: %@", buf, 0xCu);
      }
    }
    else
    {
      id v16 = _AKLogHme();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100186E74();
      }

      id v12 = +[NSError ak_errorWithCode:-7055];
      uint64_t v11 = 0;
    }
    v7[2](v7, v11, v12);

    id v7 = (void (**)(id, uint64_t, id))v11;
  }
  else
  {
    v15 = _AKLogHme();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100186F48();
    }

    id v12 = +[NSError ak_errorWithCode:-7026];
    v7[2](v7, 0, v12);
  }
}

- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100186FB4(v8);
  }

  client = self->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006C1D4;
  v12[3] = &unk_100228DD8;
  id v13 = v6;
  id v10 = v6;
  uint64_t v11 = [(AKClient *)client proxyWithErrorHandler:v12];
  [v11 presentPrivateEmailUIForContext:v7 completion:v10];
}

- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3
{
  objc_super v4 = a3;
  if (![(AKClient *)self->_client hasInternalAccess]
    && ![(AKClient *)self->_client hasOwnerAccess])
  {
    uint64_t v11 = _AKLogHme();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100183968();
    }

    id v6 = +[NSError ak_errorWithCode:-7026];
    id v7 = (void (*)(void *, uint64_t, id))v4[2];
    goto LABEL_8;
  }
  id v5 = +[AKPrivateEmailStoreManager sharedInstance];
  id v12 = 0;
  [v5 clearDatabase:&v12];
  id v6 = v12;

  id v7 = (void (*)(void *, uint64_t, id))v4[2];
  if (v6)
  {
LABEL_8:
    id v8 = v4;
    uint64_t v9 = 0;
    id v10 = v6;
    goto LABEL_9;
  }
  id v8 = v4;
  uint64_t v9 = 1;
  id v10 = 0;
LABEL_9:
  v7(v8, v9, v10);
}

- (void)privateEmailListVersionWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  if ([(AKClient *)self->_client hasInternalAccess]
    || [(AKClient *)self->_client hasOwnerAccess])
  {
    id v5 = +[AKPrivateEmailStoreManager sharedInstance];
    id v6 = [v5 currentEmailListVersion];

    v4[2](v4, v6, 0);
  }
  else
  {
    id v7 = _AKLogHme();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100183968();
    }

    id v8 = +[NSError ak_errorWithCode:-7026];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v8);
  }
}

- (void)removePrivateEmailKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)AKPrivateEmailContext) initWithKey:v7];

  [(AKPrivateEmailDaemonService *)self removePrivateEmailWithContext:v8 completion:v6];
}

- (void)removePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (![(AKClient *)self->_client hasPrivateAccess]
    && ![(AKClient *)self->_client hasOwnerAccess])
  {
    id v13 = _AKLogHme();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100187188();
    }

    id v10 = +[NSError ak_errorWithCode:-7026];
    goto LABEL_15;
  }
  id v8 = _AKLogHme();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100187154();
  }

  uint64_t v9 = +[AKPrivateEmailStoreManager sharedInstance];
  id v14 = 0;
  [v9 removePrivateEmailForContext:v6 error:&v14];
  id v10 = v14;

  uint64_t v11 = _AKLogHme();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12) {
      sub_1001870E8();
    }

LABEL_15:
    v7[2](v7, v10);
    goto LABEL_16;
  }
  if (v12) {
    sub_1001870B4();
  }

  v7[2](v7, 0);
LABEL_16:
}

- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKPrivateEmailDaemonService *)self _verifyEntitlements])
  {
    id v8 = +[AKAccountManager sharedInstance];
    uint64_t v9 = [v6 altDSID];
    id v10 = [v8 authKitAccountWithAltDSID:v9 error:0];

    if (v10)
    {
      id v22 = 0;
      unsigned int v11 = +[AKPrivateEmailValidator canPerformRequestWithAccount:v10 error:&v22];
      id v12 = v22;
      if (v11)
      {
        id v13 = +[AKURLBag sharedBag];
        id v14 = [v13 urlAtKey:AKURLBagKeyPrivateEmailFetchSIWAHme];

        if (v14
          && ([v14 absoluteString],
              v15 = objc_claimAutoreleasedReturnValue(),
              id v16 = [v15 length],
              v15,
              v16))
        {
          [(AKPrivateEmailDaemonService *)self _performFetchSiwAHmeRequestWithContext:v6 completion:v7];
        }
        else
        {
          v20 = _AKLogHme();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100187240();
          }

          v21 = +[NSError errorWithDomain:AKPrivateEmailErrorDomain code:-11013 userInfo:0];
          v7[2](v7, 0, v21);
        }
        goto LABEL_21;
      }
      uint64_t v19 = _AKLogHme();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100187274(v6);
      }
    }
    else
    {
      v18 = _AKLogHme();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001871BC(v6);
      }

      id v12 = +[NSError ak_errorWithCode:-7055];
    }
    v7[2](v7, 0, v12);
LABEL_21:

    goto LABEL_22;
  }
  id v17 = _AKLogHme();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1001872F8(v6);
  }

  id v10 = +[NSError ak_errorWithCode:-7026];
  v7[2](v7, 0, v10);
LABEL_22:
}

- (void)_performRequestForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogHme();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 key];
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting UI for key %@", buf, 0xCu);
  }
  id v10 = objc_alloc_init(AKPrivateEmailPresenter);
  client = self->_client;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006CA78;
  v14[3] = &unk_100229588;
  v15 = v10;
  id v16 = v7;
  v14[4] = self;
  id v12 = v10;
  id v13 = v7;
  [(AKPrivateEmailPresenter *)v12 presentPrivateEmailWithContext:v6 client:client completion:v14];
}

- (void)_performRegisterRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v8 = [v7 altDSID];
  [v13 setAltDSID:v8];

  uint64_t v9 = [AKPrivateEmailRegistrationRequestProvider alloc];
  id v10 = [(AKPrivateEmailRegistrationRequestProvider *)v9 initWithContext:v13 urlBagKey:AKURLBagKeyPrivateEmailRegister];
  [(AKURLRequestProviderImpl *)v10 setClient:self->_client];
  [(AKGrandSlamRequestProvider *)v10 setAuthenticatedRequest:1];
  unsigned int v11 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v10];
  id v12 = [[AKPrivateEmailRegistrationService alloc] initWithServiceController:v11];
  [(AKPrivateEmailRegistrationService *)v12 performRegistrationWith:v7 completionHandler:v6];
}

- (void)_performFetchSiwAHmeRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogHme();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018737C();
  }

  id v9 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v10 = [v7 altDSID];
  [v9 setAltDSID:v10];

  unsigned int v11 = [AKPrivateEmailRegistrationRequestProvider alloc];
  id v12 = [(AKPrivateEmailRegistrationRequestProvider *)v11 initWithContext:v9 urlBagKey:AKURLBagKeyPrivateEmailFetchSIWAHme];
  [(AKURLRequestProviderImpl *)v12 setClient:self->_client];
  [(AKGrandSlamRequestProvider *)v12 setAuthenticatedRequest:1];
  id v13 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
  id v14 = [[AKPrivateEmailRegistrationService alloc] initWithServiceController:v13];
  [(AKPrivateEmailRegistrationService *)v14 fetchSignInWithApplePrivateEmailWith:v7 completionHandler:v6];
}

- (void)_cacheFetchedPrivateEmail:(id)a3 keyAlreadyHashed:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  unsigned int v11 = (void (**)(id, id, id))a6;
  if (v9)
  {
    id v12 = +[AKPrivateEmailStoreManager sharedInstance];
    id v15 = 0;
    [v12 setPrivateEmail:v9 keyAlreadyHashed:v8 error:&v15];
    id v13 = v15;
    if (v13)
    {
      id v14 = _AKLogHme();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001873BC();
      }
    }
  }
  v11[2](v11, v9, v10);
}

- (BOOL)_verifyEntitlements
{
  unsigned int v3 = [(AKClient *)self->_client hasOwnerAccess];
  unsigned int v4 = [(AKClient *)self->_client hasInternalAccess];
  BOOL result = [(AKClient *)self->_client hasPrivateAccess];
  if (v3)
  {
    id v6 = _AKLogHme();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Owner detected!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (!v4) {
      return result;
    }
    id v6 = _AKLogHme();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[NSNumber numberWithBool:1];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Internal request made by internal client? %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return 1;
}

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end