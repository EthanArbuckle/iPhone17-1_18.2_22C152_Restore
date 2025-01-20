@interface AKAuthorizationCredentialStateController
- (AKAccountManager)accountManager;
- (AKAuthorizationCredentialStateController)init;
- (AKAuthorizationCredentialStateController)initWithClient:(id)a3;
- (AKAuthorizationCredentialStateController)initWithClient:(id)a3 accountManager:(id)a4 localAccountsStorageController:(id)a5 sharedAccountsStorageController:(id)a6;
- (AKAuthorizationStoring)localAccountsStorageController;
- (AKClient)client;
- (AKSharedAccountsStoring)sharedAccountsStorageController;
- (BOOL)_demoModeEnabled;
- (BOOL)_isCapableOfSilentAuthForRequest:(id)a3;
- (BOOL)_verifyUserID:(id)a3 forAltDSID:(id)a4;
- (id)_fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4;
- (id)_fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4;
- (int64_t)_internalCredentialStateForUserState:(int64_t)a3 error:(id)a4;
- (int64_t)_sanitizedCredentialStateForExternalClients:(int64_t)a3;
- (int64_t)getInternalCredentialStateForCredentialRequestContext:(id)a3;
- (void)_getLocalAndSharedCredentialStateWithStateRequest:(id)a3 completion:(id)a4;
- (void)_getLocalCredentialStateWithStateRequest:(id)a3 completion:(id)a4;
- (void)_getSharedCredentialStateRequest:(id)a3 completion:(id)a4;
- (void)_verifyClientInformationForRequest:(id)a3 completion:(id)a4;
- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4;
- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setLocalAccountsStorageController:(id)a3;
- (void)setSharedAccountsStorageController:(id)a3;
@end

@implementation AKAuthorizationCredentialStateController

- (AKAuthorizationCredentialStateController)init
{
  return 0;
}

- (AKAuthorizationCredentialStateController)initWithClient:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAuthorizationCredentialStateController;
  v6 = [(AKAuthorizationCredentialStateController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = +[AKAccountManager sharedInstance];
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v8;

    uint64_t v10 = +[AKAuthorizationStoreManager sharedInstance];
    localAccountsStorageController = v7->_localAccountsStorageController;
    v7->_localAccountsStorageController = (AKAuthorizationStoring *)v10;

    sharedAccountsStorageController = v7->_sharedAccountsStorageController;
    v7->_sharedAccountsStorageController = 0;
  }
  return v7;
}

- (AKAuthorizationCredentialStateController)initWithClient:(id)a3 accountManager:(id)a4 localAccountsStorageController:(id)a5 sharedAccountsStorageController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AKAuthorizationCredentialStateController;
  v15 = [(AKAuthorizationCredentialStateController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_client, a3);
    objc_storeStrong((id *)&v16->_accountManager, a4);
    objc_storeStrong((id *)&v16->_localAccountsStorageController, a5);
    objc_storeStrong((id *)&v16->_sharedAccountsStorageController, a6);
  }

  return v16;
}

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(AKAuthorizationCredentialStateController *)self _demoModeEnabled])
  {
    v9 = [v6 clientID];

    if (!v9)
    {
      uint64_t v10 = _AKLogSiwa();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Credential state request does not contain clientID, reverting to XPC client information.", buf, 2u);
      }

      id v11 = _AKLogSiwa();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(AKClient *)self->_client bundleID];
        *(_DWORD *)buf = 138412290;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting clientID to %@", buf, 0xCu);
      }
      id v13 = [(AKClient *)self->_client bundleID];
      [v6 setClientID:v13];
    }
    id v14 = [v6 teamID];

    if (!v14)
    {
      v15 = _AKLogSiwa();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Credential state does not contain teamID, reverting to XPC client information.", buf, 2u);
      }

      v16 = _AKLogSiwa();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(AKClient *)self->_client teamID];
        *(_DWORD *)buf = 138412290;
        v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting teamID to %@", buf, 0xCu);
      }
      objc_super v18 = [(AKClient *)self->_client teamID];
      [v6 setTeamID:v18];
    }
    if ([(AKClient *)self->_client hasOwnerAccess]) {
      goto LABEL_20;
    }
    v19 = [v6 clientID];
    v20 = [(AKClient *)self->_client bundleID];
    if ([v19 isEqualToString:v20])
    {
      v21 = [v6 teamID];
      v22 = [(AKClient *)self->_client teamID];
      unsigned __int8 v23 = [v21 isEqualToString:v22];

      if (v23)
      {
LABEL_20:
        v24 = [v6 altDSID];

        if (v24)
        {
          v25 = _AKLogSiwa();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AltDSID is included in the State Request,this should only be happening in testing", buf, 2u);
          }
          goto LABEL_30;
        }
        uint64_t v31 = [(AKAccountManager *)self->_accountManager altDSIDForAuthKitAccountRequestingAuthorization];
        if (v31)
        {
          v25 = v31;
          [v6 setAltDSID:v31];
LABEL_30:

          [v6 setShouldIgnoreUserID:0];
          [v6 setShouldIgnoreTeamID:0];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_100083530;
          v32[3] = &unk_100229A78;
          v32[4] = self;
          id v33 = v6;
          id v34 = v7;
          [(AKAuthorizationCredentialStateController *)self _verifyClientInformationForRequest:v33 completion:v32];

          goto LABEL_31;
        }
        uint64_t v29 = -7022;
LABEL_27:
        v30 = +[NSError ak_errorWithCode:v29];
        (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2, v30);

        goto LABEL_31;
      }
    }
    else
    {
    }
    v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(AKClient *)self->_client bundleID];
      v28 = [(AKClient *)self->_client teamID];
      *(_DWORD *)buf = 138412546;
      v36 = v27;
      __int16 v37 = 2112;
      v38 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Requested Credential state does not match XPC client's bundleID (%@) or teamID (%@), returning AKAuthenticationErrorInvalidContext", buf, 0x16u);
    }
    uint64_t v29 = -7044;
    goto LABEL_27;
  }
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "This is an internal build with Demo mode for Authorization activated, returning 'NOT FOUND' credential state", buf, 2u);
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 2, 0);
LABEL_31:
}

- (int64_t)getInternalCredentialStateForCredentialRequestContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AKAuthorizationCredentialStateRequest);
  id v6 = [v4 authorizationRequest];
  id v7 = [v6 teamID];
  [v5 setTeamID:v7];

  uint64_t v8 = [v6 userIdentifier];
  [v5 setUserID:v8];

  v9 = [v6 clientID];
  [v5 setClientID:v9];

  objc_msgSend(v5, "setShouldIgnoreTeamID:", objc_msgSend(v4, "_isWebLogin"));
  [v5 setShouldIgnoreUserID:1];
  uint64_t v10 = [v5 clientID];

  if (!v10)
  {
    id v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Credential state request does not contain clientID, reverting to XPC client information.", (uint8_t *)&buf, 2u);
    }

    id v12 = _AKLogSiwa();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(AKClient *)self->_client bundleID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting clientID to %@", (uint8_t *)&buf, 0xCu);
    }
    id v14 = [(AKClient *)self->_client bundleID];
    [v5 setClientID:v14];
  }
  v15 = [v5 teamID];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    v17 = _AKLogSiwa();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Credential state does not contain teamID, reverting to XPC client information.", (uint8_t *)&buf, 2u);
    }

    objc_super v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(AKClient *)self->_client teamID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting teamID to %@", (uint8_t *)&buf, 0xCu);
    }
    v20 = [(AKClient *)self->_client teamID];
    [v5 setTeamID:v20];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 2;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000839AC;
  v23[3] = &unk_100229AA0;
  v23[4] = self;
  v23[5] = &buf;
  [(AKAuthorizationCredentialStateController *)self _verifyClientInformationForRequest:v5 completion:v23];
  int64_t v21 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);

  return v21;
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting private call to fetch credential state for clientID: %@", buf, 0xCu);
  }

  id v9 = objc_alloc_init((Class)AKAuthorizationCredentialStateRequest);
  [v9 setClientID:v6];
  [v9 setShouldIgnoreTeamID:1];
  [v9 setShouldIgnoreUserID:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100083B4C;
  v11[3] = &unk_100229AC8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(AKAuthorizationCredentialStateController *)self _verifyClientInformationForRequest:v9 completion:v11];
}

- (void)_verifyClientInformationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  uint64_t v8 = [v6 teamID];
  if (!v8 || (v9 = (void *)v8, unsigned int v10 = [v6 shouldIgnoreTeamID], v9, v10))
  {
    unsigned __int8 v11 = [(AKClient *)self->_client hasInternalEntitledAccess];
    id v12 = _AKLogSiwa();
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100189940(v13, v15, v16, v17, v18, v19, v20, v21);
      }

      uint64_t v22 = -7073;
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client has internal entitlements and does not have a teamID", v32, 2u);
    }
  }
  id v14 = [v6 clientID];

  if (!v14)
  {
    unsigned __int8 v23 = _AKLogSiwa();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100189908(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    uint64_t v22 = -7074;
LABEL_15:
    uint64_t v31 = +[NSError ak_errorWithCode:v22];
    v7[2](v7, 2, v31);

    goto LABEL_16;
  }
  [(AKAuthorizationCredentialStateController *)self _getLocalAndSharedCredentialStateWithStateRequest:v6 completion:v7];
LABEL_16:
}

- (int64_t)_internalCredentialStateForUserState:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 != 3 || v5)
  {
    if (a3 == 2 && (objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7083) & 1) != 0) {
      a3 = 0;
    }
  }
  else
  {
    a3 = 3;
  }

  return a3;
}

- (void)_getLocalAndSharedCredentialStateWithStateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10000F920;
  v39 = sub_10000F7E0;
  id v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 2;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000841C0;
  v27[3] = &unk_100229AF0;
  uint64_t v29 = &v35;
  uint64_t v30 = &v31;
  id v9 = v8;
  uint64_t v28 = v9;
  [(AKAuthorizationCredentialStateController *)self _getLocalCredentialStateWithStateRequest:v6 completion:v27];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000F920;
  v25[4] = sub_10000F7E0;
  id v26 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 2;
  if (self->_sharedAccountsStorageController)
  {
    dispatch_group_enter(v9);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100084244;
    v17[3] = &unk_100229AF0;
    uint64_t v19 = v25;
    uint64_t v20 = &v21;
    uint64_t v18 = v9;
    [(AKAuthorizationCredentialStateController *)self _getSharedCredentialStateRequest:v6 completion:v17];
  }
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v22[3] == 1)
  {
    if ((v32[3] | 2) == 3)
    {
      unsigned int v10 = _AKLogSiwa();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We have both shared and personal credentials", buf, 2u);
      }

      uint64_t v11 = 0;
      uint64_t v12 = 5;
    }
    else
    {
      uint64_t v16 = _AKLogSiwa();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "We have a shared credential but no personal credential", buf, 2u);
      }

      uint64_t v11 = 0;
      uint64_t v12 = 4;
    }
  }
  else
  {
    id v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v32[3];
      uint64_t v15 = v36[5];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Using personal credential state - %ld, error - %@", buf, 0x16u);
    }

    uint64_t v12 = v32[3];
    uint64_t v11 = v36[5];
  }
  v7[2](v7, v12, v11);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

- (void)_getLocalCredentialStateWithStateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = [(AKAccountManager *)self->_accountManager altDSIDForAuthKitAccountRequestingAuthorization];
  id v9 = [v6 clientID];
  unsigned int v10 = [(AKAuthorizationCredentialStateController *)self _fetchDeveloperTeamWithClientID:v9 withAltDSID:v8];

  uint64_t v11 = [v10 apps];
  uint64_t v12 = [v6 clientID];
  id v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    uint64_t v14 = [v10 teamID];
    uint64_t v15 = [v6 teamID];
    unsigned int v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      id v17 = v10;
      if (v17)
      {
LABEL_4:
        v87 = v7;
        uint64_t v18 = [v10 userIdentifier];
        uint64_t v19 = [v6 userID];
        unsigned int v88 = [v18 isEqualToString:v19];

        id v90 = v17;
        uint64_t v20 = [v17 userIdentifier];
        uint64_t v21 = [v6 userID];
        unsigned int v22 = [v20 isEqualToString:v21];

        uint64_t v23 = [v13 transferState];
        unsigned int v24 = [v23 isEqualToString:AKAuthorizationTransferStateTransferred];

        uint64_t v25 = [v13 transferState];
        unsigned int v26 = [v25 isEqualToString:AKAuthorizationTransferStateExpired];

        id v27 = [v13 state];
        unsigned int v86 = v26;
        if ((v24 & 1) != 0 || v26)
        {
          [v6 userID];
          unsigned int v36 = v22;
          id v37 = v6;
          v38 = v13;
          v39 = v10;
          v41 = id v40 = v8;
          unsigned int v28 = [(AKAuthorizationCredentialStateController *)self _verifyUserID:v41 forAltDSID:v40];

          uint64_t v8 = v40;
          unsigned int v10 = v39;
          id v13 = v38;
          id v6 = v37;
          unsigned int v22 = v36;
        }
        else
        {
          unsigned int v28 = 0;
        }
        unsigned int v42 = v88;
        if (v27 == (id)3)
        {
          __int16 v43 = _AKLogSiwa();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_100189A3C(v43, v44, v45, v46, v47, v48, v49, v50);
          }

          v51 = _AKLogSiwa();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            sub_100189978(v13, v10, v51);
          }

          unsigned int v28 = 0;
          unsigned int v86 = 0;
          unsigned int v24 = 0;
          unsigned int v42 = 0;
          int v52 = 1;
          uint64_t v84 = 1;
LABEL_22:
          v89 = v10;
          if (((v42 | v22) & 1) == 0
            && (v28 & 1) == 0
            && ([v6 shouldIgnoreUserID] & 1) == 0)
          {
            v68 = v8;
            v69 = _AKLogSiwa();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Application has a credential, failed user identifier validation.", buf, 2u);
            }

            v70 = +[NSError ak_errorWithCode:-7091];
            id v7 = v87;
            ((void (**)(id, id, void *))v87)[2](v87, (id)2, v70);

            uint64_t v8 = v68;
            goto LABEL_61;
          }
          v85 = v8;
          int v53 = v42 | v52;
          int v54 = v24 ^ 1;
          int v55 = v53 | v24 ^ 1;
          int v56 = v28 ^ 1;
          if ((v55 & 1) == 0 && (v56 & 1) == 0)
          {
            v57 = _AKLogSiwa();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Application in transferred state with unsafe matching user identifier (to be verified by IdMS).", buf, 2u);
            }

            id v7 = v87;
            v87[2](v87, (id)3, 0);
            goto LABEL_30;
          }
          if (((v55 | v28) & 1) == 0 && ([v6 shouldIgnoreUserID] & 1) == 0)
          {
            v71 = _AKLogSiwa();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Application in transferred state with no matching user identifier.", buf, 2u);
            }

            v72 = +[NSError ak_errorWithCode:-7091];
            id v7 = v87;
            ((void (**)(id, id, void *))v87)[2](v87, (id)2, v72);

            goto LABEL_30;
          }
          unsigned int v62 = v42;
          int v63 = v86 ^ 1;
          int v64 = v53 | v86 ^ 1;
          if ((v64 | v56) & 1) != 0 || ([v6 shouldIgnoreUserID])
          {
            id v17 = v90;
            if (((v64 | v28) & 1) == 0 && ([v6 shouldIgnoreUserID] & 1) == 0)
            {
              v76 = _AKLogSiwa();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Application in expired state with no matching user identifier.", buf, 2u);
              }

              uint64_t v77 = -7091;
              goto LABEL_82;
            }
            int v65 = HIDWORD(v84) | v22 ^ 1;
            if (((v65 | v54) & 1) == 0)
            {
              v73 = _AKLogSiwa();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Application in transfered state with strongly matching alternate user identifier.", buf, 2u);
              }

              id v7 = v87;
              v87[2](v87, (id)3, 0);
              goto LABEL_88;
            }
            if ((v65 | v63) & 1) != 0 || ([v6 shouldIgnoreUserID])
            {
              if ((HIDWORD(v84) | v84 | v54))
              {
                if ((HIDWORD(v84) | v84 | v63))
                {
                  if (((v62 | HIDWORD(v84) | v63) & 1) == 0 && [v6 shouldIgnoreUserID])
                  {
                    v66 = _AKLogSiwa();
                    id v7 = v87;
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      v67 = "Application in expired state with no matching user identifier but user identifier match is b"
                            "eing ignored (for internal credential state) and No match for Team Identifier, directly retu"
                            "rning application's credential state.";
LABEL_95:
                      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, v67, buf, 2u);
                      goto LABEL_96;
                    }
                    goto LABEL_96;
                  }
                  id v7 = v87;
                  if ((v64 & 1) == 0 && [v6 shouldIgnoreUserID])
                  {
                    v66 = _AKLogSiwa();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      v67 = "Application in expired state with no matching user identifier but user identifier match is b"
                            "eing ignored (for internal credential state), directly returning application's credential state.";
                      goto LABEL_95;
                    }
LABEL_96:

                    v7[2](v7, [v13 state], 0);
LABEL_30:
                    uint64_t v8 = v85;
LABEL_61:
                    unsigned int v10 = v89;
                    id v17 = v90;
                    goto LABEL_90;
                  }
                  if (((v62 | HIDWORD(v84) | v54) & 1) == 0 && [v6 shouldIgnoreUserID])
                  {
                    v81 = _AKLogSiwa();
                    uint64_t v8 = v85;
                    id v17 = v90;
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      v82 = "Application in transferred state with no matching user identifier but user identifier match "
                            "is being ignored (for internal credential state) and No match for Team Identifier, directly "
                            "returning application's credential state.";
LABEL_105:
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, v82, buf, 2u);
                      goto LABEL_106;
                    }
                    goto LABEL_106;
                  }
                  uint64_t v8 = v85;
                  id v17 = v90;
                  if ((v55 & 1) == 0 && [v6 shouldIgnoreUserID])
                  {
                    v81 = _AKLogSiwa();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      v82 = "Application in transferred state with no matching user identifier but user identifier match "
                            "is being ignored (for internal credential state), directly returning application's credential state.";
                      goto LABEL_105;
                    }
LABEL_106:

                    v87[2](v87, [v13 state], 0);
                    goto LABEL_89;
                  }
                  v83 = _AKLogSiwa();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Application state cannot be securely determined.", buf, 2u);
                  }

                  v80 = +[NSError ak_errorWithCode:-7084];
                  goto LABEL_83;
                }
                v78 = _AKLogSiwa();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  v79 = "Application in expired state with strongly matching user identifier. Directly returning applicat"
                        "ion's credential state.";
                  goto LABEL_86;
                }
              }
              else
              {
                v78 = _AKLogSiwa();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  v79 = "Application in transferred state with strongly matching user identifier. Directly returning appl"
                        "ication's credential state.";
LABEL_86:
                  _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
                }
              }

              id v7 = v87;
              v87[2](v87, [v13 state], 0);
              goto LABEL_88;
            }
            v74 = _AKLogSiwa();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              v75 = "Application in expired state with strongly matching alternate user identifier.";
              goto LABEL_80;
            }
          }
          else
          {
            v74 = _AKLogSiwa();
            id v17 = v90;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              v75 = "Application in expired state with unsafe matching user identifier.";
LABEL_80:
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 2u);
            }
          }

          uint64_t v77 = -7083;
LABEL_82:
          v80 = +[NSError ak_errorWithCode:](NSError, "ak_errorWithCode:", v77, v84);
          id v7 = v87;
LABEL_83:
          ((void (**)(id, id, void *))v7)[2](v7, (id)2, v80);

LABEL_88:
          uint64_t v8 = v85;
LABEL_89:
          unsigned int v10 = v89;
          goto LABEL_90;
        }
        id v17 = v90;
        if ((v16 & v88) == 1)
        {
          v58 = _AKLogSiwa();
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
LABEL_35:

            id v35 = [v13 state];
            id v7 = v87;
LABEL_36:
            v7[2](v7, v35, 0);
            goto LABEL_90;
          }
          *(_WORD *)long long buf = 0;
          v59 = "Application has a credential, directly returning application's credential state.";
        }
        else
        {
          LODWORD(v84) = v88 ^ 1;
          if (!v16)
          {
            HIDWORD(v84) = 0;
            int v52 = 1;
            goto LABEL_22;
          }
          if (([v6 shouldIgnoreUserID] ^ 1 | v24 | v86))
          {
            int v52 = 0;
            HIDWORD(v84) = 1;
            goto LABEL_22;
          }
          v58 = _AKLogSiwa();
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          *(_WORD *)long long buf = 0;
          v59 = "Application has a credential but user identifier match is being ignored (for internal credential state),"
                " directly returning application's credential state.";
        }
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 2u);
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v31 = [v6 teamID];
      id v17 = [(AKAuthorizationCredentialStateController *)self _fetchDeveloperTeamWithTeamID:v31 withAltDSID:v8];

      if (v17) {
        goto LABEL_4;
      }
    }
    unsigned int v32 = [v6 shouldIgnoreTeamID];
    uint64_t v33 = _AKLogSiwa();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v32)
    {
      if (v34)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Credential State Request has an ignore flag on the TeamID returning Credential State", buf, 2u);
      }

      id v35 = [v13 state];
      goto LABEL_36;
    }
    if (v34)
    {
      v60 = [v6 teamID];
      *(_DWORD *)long long buf = 138412290;
      v92 = v60;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No developer teams were found with the Team ID: %@", buf, 0xCu);
    }
    v61 = +[NSError ak_errorWithCode:-7073];
    ((void (**)(id, id, void *))v7)[2](v7, (id)2, v61);
  }
  else
  {
    uint64_t v29 = _AKLogSiwa();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v6 clientID];
      *(_DWORD *)long long buf = 138412290;
      v92 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No applications were found with the provided Client ID: %@", buf, 0xCu);
    }
    id v17 = +[NSError ak_errorWithCode:-7074];
    ((void (**)(id, id, id))v7)[2](v7, (id)2, v17);
  }
LABEL_90:
}

- (void)_getSharedCredentialStateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedAccountsStorageController = self->_sharedAccountsStorageController;
  id v9 = [v6 clientID];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100084F8C;
  v12[3] = &unk_100229B18;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(AKSharedAccountsStoring *)sharedAccountsStorageController fetchAccountsSharedWithCurrentUserWithClientID:v9 completionHandler:v12];
}

- (BOOL)_demoModeEnabled
{
  v2 = +[AKConfiguration sharedConfiguration];
  BOOL v3 = [v2 shouldAllowDemoMode] == (id)1;

  return v3;
}

- (BOOL)_isCapableOfSilentAuthForRequest:(id)a3
{
  BOOL v3 = self;
  accountManager = self->_accountManager;
  id v5 = [a3 altDSID];
  id v6 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v5 error:0];

  id v7 = [(AKAccountManager *)v3->_accountManager continuationTokenForAccount:v6];
  LOBYTE(v3) = v7 != 0;

  return (char)v3;
}

- (int64_t)_sanitizedCredentialStateForExternalClients:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    return 1;
  }
  else {
    return a3;
  }
}

- (id)_fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching developer team with id: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000F920;
  unsigned int v16 = sub_10000F7E0;
  id v17 = 0;
  localAccountsStorageController = self->_localAccountsStorageController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000855C0;
  v12[3] = &unk_100229B40;
  void v12[4] = &buf;
  [(AKAuthorizationStoring *)localAccountsStorageController fetchDeveloperTeamWithTeamID:v6 withAltDSID:v7 completion:v12];
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (id)_fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching developer team for client with ID: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000F920;
  unsigned int v16 = sub_10000F7E0;
  id v17 = 0;
  localAccountsStorageController = self->_localAccountsStorageController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100085808;
  v12[3] = &unk_100229B40;
  void v12[4] = &buf;
  [(AKAuthorizationStoring *)localAccountsStorageController fetchDeveloperTeamWithClientID:v6 withAltDSID:v7 completion:v12];
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (BOOL)_verifyUserID:(id)a3 forAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing unsafe verification with User ID: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    localAccountsStorageController = self->_localAccountsStorageController;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100085A60;
    v13[3] = &unk_100229B68;
    v13[4] = &buf;
    [(AKAuthorizationStoring *)localAccountsStorageController performUnsafeVerificationWithUserID:v6 withAltDSID:v7 completion:v13];
    BOOL v11 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v9)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unsafe verification failed due to nil User ID.", (uint8_t *)&buf, 2u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (AKClient)client
{
  return self->_client;
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AKAuthorizationStoring)localAccountsStorageController
{
  return self->_localAccountsStorageController;
}

- (void)setLocalAccountsStorageController:(id)a3
{
}

- (AKSharedAccountsStoring)sharedAccountsStorageController
{
  return self->_sharedAccountsStorageController;
}

- (void)setSharedAccountsStorageController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAccountsStorageController, 0);
  objc_storeStrong((id *)&self->_localAccountsStorageController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end