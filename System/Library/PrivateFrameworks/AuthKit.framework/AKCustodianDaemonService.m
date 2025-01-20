@interface AKCustodianDaemonService
- (AKClient)client;
- (AKCustodianDaemonService)init;
- (AKCustodianDaemonService)initWithClient:(id)a3;
- (BOOL)verifyRecoveryTransactionWithContext:(id)a3 verifySessionID:(BOOL)a4 error:(id *)a5;
- (id)_trustedContactOperationsByIDFromArray:(id)a3;
- (void)dealloc;
- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4;
- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3;
- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4;
- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4;
- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4;
- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5;
- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4;
- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4;
- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKCustodianDaemonService

- (AKCustodianDaemonService)init
{
  return 0;
}

- (AKCustodianDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKCustodianDaemonService;
  v6 = [(AKCustodianDaemonService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10018C380();
  }

  v4.receiver = self;
  v4.super_class = (Class)AKCustodianDaemonService;
  [(AKCustodianDaemonService *)&v4 dealloc];
}

- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    v8 = [v6 custodianUUID];

    if (v8)
    {
      objc_super v9 = [v6 custodianSetupToken];

      if (v9)
      {
        v10 = [AKCustodianRequestProvider alloc];
        v11 = [(AKCustodianRequestProvider *)v10 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianInitiation];
        [(AKCustodianRequestProvider *)v11 setAuthenticatedRequest:1];
        [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
        v12 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10009891C;
        v17[3] = &unk_100228838;
        v18 = v11;
        id v19 = v6;
        id v20 = v7;
        v13 = v11;
        [(AKServiceControllerImpl *)v12 executeRequestWithCompletion:v17];

LABEL_16:
        goto LABEL_17;
      }
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10018C428();
      }
    }
    else
    {
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10018C3F4();
      }
    }

    if (v7)
    {
      uint64_t v15 = -7044;
      goto LABEL_15;
    }
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018C45C();
    }

    if (v7)
    {
      uint64_t v15 = -7026;
LABEL_15:
      v12 = +[NSError ak_errorWithCode:v15];
      (*((void (**)(id, void, AKServiceControllerImpl *))v7 + 2))(v7, 0, v12);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    v8 = [v6 custodianUUID];

    if (v8)
    {
      objc_super v9 = [v6 altDSID];

      if (v9)
      {
        v10 = [AKCustodianRequestProvider alloc];
        v11 = [(AKCustodianRequestProvider *)v10 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianApproval];
        [(AKCustodianRequestProvider *)v11 setAuthenticatedRequest:1];
        [(AKCustodianRequestProvider *)v11 setSignWithIdentityToken:1];
        [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
        v12 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
        id v13 = objc_alloc_init((Class)AKAuthHandlerImpl);
        [v13 setForceSilentAuth:1];
        [(AKServiceControllerImpl *)v12 setAuthenticationDelegate:v13];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100098DE4;
        v18[3] = &unk_100226C30;
        id v21 = v7;
        id v19 = v11;
        id v20 = v6;
        v14 = v11;
        [(AKServiceControllerImpl *)v12 executeRequestWithCompletion:v18];

LABEL_16:
        goto LABEL_17;
      }
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018C52C();
      }
    }
    else
    {
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018C4F8();
      }
    }

    if (v7)
    {
      uint64_t v16 = -7044;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018C560();
    }

    if (v7)
    {
      uint64_t v16 = -7026;
LABEL_15:
      v12 = +[NSError ak_errorWithCode:v16];
      (*((void (**)(id, AKServiceControllerImpl *))v7 + 2))(v7, v12);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    v8 = [v6 custodianUUID];

    if (v8)
    {
      objc_super v9 = [v6 altDSID];

      if (v9)
      {
        v10 = [AKCustodianRequestProvider alloc];
        v11 = [(AKCustodianRequestProvider *)v10 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianDeletion];
        [(AKCustodianRequestProvider *)v11 setAuthenticatedRequest:1];
        [(AKCustodianRequestProvider *)v11 setSignWithIdentityToken:1];
        [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
        v12 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
        id v13 = objc_alloc_init((Class)AKAuthHandlerImpl);
        [v13 setForceSilentAuth:1];
        [(AKServiceControllerImpl *)v12 setAuthenticationDelegate:v13];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000991E4;
        v18[3] = &unk_100226C30;
        id v21 = v7;
        id v19 = v11;
        id v20 = v6;
        v14 = v11;
        [(AKServiceControllerImpl *)v12 executeRequestWithCompletion:v18];

LABEL_16:
        goto LABEL_17;
      }
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018C52C();
      }
    }
    else
    {
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018C5FC();
      }
    }

    if (v7)
    {
      uint64_t v16 = -7044;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018C630();
    }

    if (v7)
    {
      uint64_t v16 = -7026;
LABEL_15:
      v12 = +[NSError ak_errorWithCode:v16];
      (*((void (**)(id, AKServiceControllerImpl *))v7 + 2))(v7, v12);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    v8 = [v6 custodianUUID];

    if (v8)
    {
      objc_super v9 = [v6 altDSID];

      if (v9)
      {
        v10 = [v6 wrappingKeyRKC];

        if (v10)
        {
          v11 = [AKCustodianRequestProvider alloc];
          v12 = [(AKCustodianRequestProvider *)v11 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianUpdateRecoveryKey];
          [(AKCustodianRequestProvider *)v12 setAuthenticatedRequest:1];
          [(AKCustodianRequestProvider *)v12 setSignWithIdentityToken:1];
          [(AKURLRequestProviderImpl *)v12 setClient:self->_client];
          id v13 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
          id v14 = objc_alloc_init((Class)AKAuthHandlerImpl);
          [v14 setForceSilentAuth:1];
          [(AKServiceControllerImpl *)v13 setAuthenticationDelegate:v14];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10009960C;
          v18[3] = &unk_100228748;
          id v20 = v7;
          id v19 = v6;
          [(AKServiceControllerImpl *)v13 executeRequestWithCompletion:v18];

LABEL_19:
          goto LABEL_20;
        }
        v17 = _AKLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10018C734();
        }
      }
      else
      {
        v17 = _AKLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10018C700();
        }
      }
    }
    else
    {
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018C6CC();
      }
    }

    if (v7)
    {
      uint64_t v16 = -7044;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018C768();
    }

    if (v7)
    {
      uint64_t v16 = -7026;
LABEL_18:
      v12 = +[NSError ak_errorWithCode:v16];
      (*((void (**)(id, AKCustodianRequestProvider *))v7 + 2))(v7, v12);
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018C844();
  }

  id v24 = 0;
  unsigned __int8 v9 = [(AKCustodianDaemonService *)self verifyRecoveryTransactionWithContext:v6 verifySessionID:0 error:&v24];
  id v10 = v24;
  if (v9)
  {
    v11 = [AKCustodianRequestProvider alloc];
    v12 = [(AKCustodianRequestProvider *)v11 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianRecoveryRequest];
    id v13 = +[AKAccountManager sharedInstance];
    id v14 = [v13 primaryAuthKitAccount];
    [(AKCustodianRequestProvider *)v12 setAuthenticatedRequest:0];
    if (v14)
    {
      uint64_t v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10018C804();
      }

      [(AKCustodianRequestProvider *)v12 setAuthenticatedRequest:1];
      uint64_t v16 = [v13 altDSIDForAccount:v14];
      [v6 setAltDSID:v16];
    }
    [(AKURLRequestProviderImpl *)v12 setClient:self->_client];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_10000F960;
    v22[4] = sub_10000F800;
    id v23 = 0;
    v17 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000999FC;
    v18[3] = &unk_10022A5A8;
    id v19 = v6;
    id v21 = v22;
    id v20 = v7;
    [(AKServiceControllerImpl *)v17 executeRequestWithCompletion:v18];

    _Block_object_dispose(v22, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
}

- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v5 = +[AKURLBag bagForAltDSID:0];
    id v6 = [v5 custodianCodeConfiguration];

    if (v4) {
      v4[2](v4, v6, 0);
    }
    goto LABEL_8;
  }
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10018C920();
  }

  if (v4)
  {
    id v6 = +[NSError ak_errorWithCode:-7026];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v6);
LABEL_8:
  }
}

- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  unsigned __int8 v8 = [(AKCustodianDaemonService *)self verifyRecoveryTransactionWithContext:v6 verifySessionID:0 error:&v20];
  id v9 = v20;
  if (v8)
  {
    id v10 = [AKCustodianRequestProvider alloc];
    v11 = [(AKCustodianRequestProvider *)v10 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianRecoveryCircle];
    [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
    if ([v6 ownerDevice])
    {
      [(AKCustodianRequestProvider *)v11 setAuthenticatedRequest:0];
    }
    else
    {
      v12 = +[AKAccountManager sharedInstance];
      id v13 = [v12 altDSIDforPrimaryiCloudAccount];

      [v6 setAltDSID:v13];
      [(AKCustodianRequestProvider *)v11 setAuthenticatedRequest:1];
    }
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    id v14 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100099E44;
    v15[3] = &unk_10022A5D0;
    v17 = v18;
    id v16 = v7;
    [(AKServiceControllerImpl *)v14 executeRequestWithCompletion:v15];

    _Block_object_dispose(v18, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = sub_10000F960;
  id v20 = sub_10000F800;
  id v21 = 0;
  id obj = 0;
  unsigned __int8 v8 = [(AKCustodianDaemonService *)self verifyRecoveryTransactionWithContext:v6 verifySessionID:1 error:&obj];
  objc_storeStrong(&v21, obj);
  if (v8)
  {
    id v9 = [AKCustodianRequestProvider alloc];
    id v10 = [(AKCustodianRequestProvider *)v9 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianPostCircle];
    [(AKURLRequestProviderImpl *)v10 setClient:self->_client];
    [(AKCustodianRequestProvider *)v10 setAuthenticatedRequest:0];
    v11 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v10];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009A150;
    v12[3] = &unk_10022A5F8;
    id v13 = v7;
    id v14 = &v16;
    [(AKServiceControllerImpl *)v11 executeRequestWithCompletion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, v17[5]);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    uint64_t v8 = [v6 recoverySessionID];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [v6 custodianRecoveryToken];

      if (v10)
      {
        v11 = +[AKAccountManager sharedInstance];
        v12 = [v11 altDSIDforPrimaryiCloudAccount];

        if (v12)
        {
          [v6 setAltDSID:v12];
          id v13 = [AKCustodianRequestProvider alloc];
          id v14 = [(AKCustodianRequestProvider *)v13 initWithContext:v6 urlBagKey:AKURLBagKeyCustodianRecoveryWrappingKey];
          [(AKCustodianRequestProvider *)v14 setAuthenticatedRequest:1];
          [(AKCustodianRequestProvider *)v14 setSignWithIdentityToken:1];
          [(AKURLRequestProviderImpl *)v14 setClient:self->_client];
          v24[0] = 0;
          v24[1] = v24;
          v24[2] = 0x3032000000;
          v24[3] = sub_10000F960;
          v24[4] = sub_10000F800;
          id v25 = 0;
          uint64_t v15 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v14];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10009A908;
          v20[3] = &unk_10022A5A8;
          id v21 = v12;
          id v23 = v24;
          id v22 = v7;
          [(AKServiceControllerImpl *)v15 executeRequestWithCompletion:v20];

          _Block_object_dispose(v24, 8);
        }
        else
        {
          char v19 = _AKLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_10018CA58();
          }

          if (!v7) {
            goto LABEL_20;
          }
          id v14 = +[NSError ak_errorWithCode:-7055];
          (*((void (**)(id, void, AKCustodianRequestProvider *))v7 + 2))(v7, 0, v14);
        }

LABEL_20:
        goto LABEL_21;
      }
    }
    uint64_t v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10018CA24();
    }

    if (v7)
    {
      uint64_t v17 = -7044;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10018CA8C();
    }

    if (v7)
    {
      uint64_t v17 = -7026;
LABEL_14:
      v12 = +[NSError ak_errorWithCode:v17];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (![(AKClient *)self->_client hasInternalPrivateAccess])
  {
    uint64_t v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10018CBA0();
    }

    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v18 = -7026;
LABEL_21:
    id v13 = +[NSError ak_errorWithCode:v18];
    v10[2](v10, v13);
LABEL_22:

    goto LABEL_23;
  }
  v11 = [v8 altDSID];

  if (!v11)
  {
    char v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10018CAC0();
    }

    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v18 = -7025;
    goto LABEL_21;
  }
  v12 = [v8 recoverySessionID];

  if (v12)
  {
    id v13 = v9;
    if (!v13) {
      id v13 = AKURLBagKeyCustodianRecoveryFeedback;
    }
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10018CB28();
    }

    uint64_t v15 = [[AKCustodianRequestProvider alloc] initWithContext:v8 urlBagKey:v13];
    [(AKCustodianRequestProvider *)v15 setAuthenticatedRequest:0];
    [(AKURLRequestProviderImpl *)v15 setClient:self->_client];
    uint64_t v16 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v15];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10009ACF0;
    v21[3] = &unk_100227340;
    id v22 = v10;
    [(AKServiceControllerImpl *)v16 executeRequestWithCompletion:v21];

    goto LABEL_22;
  }
  id v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10018CAF4();
  }

  if (v10)
  {
    uint64_t v18 = -7044;
    goto LABEL_21;
  }
LABEL_23:
}

- (BOOL)verifyRecoveryTransactionWithContext:(id)a3 verifySessionID:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(AKClient *)self->_client hasInternalPrivateAccess])
  {
    id v9 = [v8 ownerAppleID];
    if (v9 || ([v8 ownerCustodianAltDSID], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      char v19 = [v8 custodianUUID];

      if (!v19)
      {
        id v20 = _AKLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10018CC3C();
        }

        if (a5)
        {
          uint64_t v12 = -7022;
          goto LABEL_12;
        }
        goto LABEL_33;
      }
    }
    id v10 = [v8 pushToken];

    if (v10)
    {
      if (!v6) {
        goto LABEL_18;
      }
    }
    else
    {
      id v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Custodian context does not provide a pushToken, fetching pushToken...", v23, 2u);
      }

      uint64_t v15 = +[AKAppleIDPushHelperService sharedService];
      uint64_t v16 = [v15 publicAPSTokenString];

      if (![v16 length])
      {
        id v21 = _AKLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10018CC70();
        }

        if (a5)
        {
          *a5 = +[NSError ak_errorWithCode:-7041];
        }

        goto LABEL_33;
      }
      [v8 setPushToken:v16];

      if (!v6)
      {
LABEL_18:
        BOOL v13 = 1;
        goto LABEL_34;
      }
    }
    uint64_t v17 = [v8 recoverySessionID];

    if (v17) {
      goto LABEL_18;
    }
    uint64_t v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10018CCA4();
    }

    if (a5)
    {
      uint64_t v12 = -7044;
      goto LABEL_12;
    }
LABEL_33:
    BOOL v13 = 0;
    goto LABEL_34;
  }
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10018CBA0();
  }

  if (!a5) {
    goto LABEL_33;
  }
  uint64_t v12 = -7026;
LABEL_12:
  +[NSError ak_errorWithCode:v12];
  BOOL v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v13;
}

- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = +[AKURLBag sharedBag];
  uint64_t v9 = AKURLBagKeyTrustedContactsDataSync;
  id v10 = [v8 urlAtKey:AKURLBagKeyTrustedContactsDataSync];

  if (!v10)
  {
    id v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10018CCD8();
    }

    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v21 = -7097;
LABEL_18:
    BOOL v13 = +[NSError ak_errorWithCode:v21];
    v7[2](v7, 0, v13);
LABEL_25:

    goto LABEL_26;
  }
  v11 = [v6 lastDataSyncTimestamp];

  if (!v11)
  {
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10018CD0C();
    }

    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v21 = -7044;
    goto LABEL_18;
  }
  uint64_t v12 = [v6 altDSID];

  if (v12)
  {
    BOOL v13 = +[AKAccountManager sharedInstance];
    id v14 = [v6 altDSID];
    uint64_t v15 = [v13 authKitAccountWithAltDSID:v14 error:0];

    uint64_t v16 = [v13 hearbeatTokenForAccount:v15];
    if (v16)
    {
      [v6 _setHeartbeatToken:v16];
      uint64_t v17 = [[AKCustodianRequestProvider alloc] initWithContext:v6 urlBagKey:v9];
      [(AKCustodianRequestProvider *)v17 setAuthenticatedRequest:1];
      [(AKURLRequestProviderImpl *)v17 setClient:self->_client];
      uint64_t v18 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v17];
      id v19 = objc_alloc_init((Class)AKAuthHandlerImpl);
      [v19 setForceSilentAuth:1];
      [(AKServiceControllerImpl *)v18 setAuthenticationDelegate:v19];
      objc_initWeak(&location, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10009B514;
      v25[3] = &unk_100229820;
      objc_copyWeak(&v29, &location);
      id v26 = v13;
      id v27 = v15;
      v28 = v7;
      [(AKServiceControllerImpl *)v18 executeRequestWithCompletion:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      id v24 = _AKLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10018CD74();
      }

      if (!v7) {
        goto LABEL_24;
      }
      uint64_t v17 = +[NSError ak_errorWithCode:-7042];
      v7[2](v7, 0, v17);
    }

LABEL_24:
    goto LABEL_25;
  }
  id v23 = _AKLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10018CD40();
  }

  if (v7)
  {
    uint64_t v21 = -7025;
    goto LABEL_18;
  }
LABEL_26:
}

- (id)_trustedContactOperationsByIDFromArray:(id)a3
{
  id v3 = a3;
  uint64_t v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v7);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }

        objc_opt_class();
        id v11 = [v10 objectForKeyedSubscript:@"uuid"];
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }

        objc_opt_class();
        id v13 = [v10 objectForKeyedSubscript:@"op"];
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }

        id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:v12];
        [v14 integerValue];
        uint64_t v16 = AKTrustedContactSyncOperationFromIntegerValue();
        uint64_t v17 = (void *)v16;
        if (v15 && v16)
        {
          [v21 setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          uint64_t v18 = _AKLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unexpected IdMS trusted contact operation response: %@", buf, 0xCu);
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v5);
  }

  id v19 = [v21 copy];

  return v19;
}

- (AKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end