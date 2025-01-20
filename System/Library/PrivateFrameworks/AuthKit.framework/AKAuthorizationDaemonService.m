@interface AKAuthorizationDaemonService
- (AKAuthorizationDaemonService)init;
- (AKAuthorizationDaemonService)initWithClient:(id)a3;
- (AKAuthorizationDaemonServiceDelegate)delegate;
- (AKAuthorizationEndorserRapportDiscovery)endorserRapportDiscovery;
- (AKAuthorizationRapportClient)rapportClient;
- (AKAuthorizationStoreManager)localAccountsStorageController;
- (AKClient)client;
- (AKCredentialRequestContext)originalRequestContext;
- (AKSharedAccountsStorageController)sharedAccountsStorageController;
- (BOOL)_isPCSAccessForContext:(id)a3;
- (BOOL)_shouldAllowPCSKeyAccessForContext:(id)a3;
- (BOOL)_shouldEarlyReturnRequest:(id)a3 forCredentialState:(int64_t)a4;
- (BOOL)_shouldStartSatoriVerificationForRequestContext:(id)a3;
- (BOOL)_verifyEntitlementsForRequest:(id)a3;
- (NSArray)safariPasswordCredentials;
- (NSArray)sharedAccounts;
- (id)_accountDisplayNameWithPresentationContext:(id)a3;
- (id)_clientForContext:(id)a3;
- (id)_credentialStateController;
- (id)authorizationContextHelperWithContext:(id)a3 client:(id)a4;
- (id)authorizationContextWithUserResponse:(id)a3 client:(id)a4;
- (int64_t)_credentialStateForRequestContext:(id)a3;
- (void)_completeAuthorizationWithServerResponse:(id)a3 userResponse:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_createAndPerformRequest:(id)a3 completion:(id)a4;
- (void)_determineUIAndPerformRequest:(id)a3 completion:(id)a4;
- (void)_extractWebSessionAuthorizationFromResponse:(id)a3;
- (void)_fetchAuthContextWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_fetchCredentialsForAssociatedDomains:(id)a3 completion:(id)a4;
- (void)_fetchSafariCredentialsWithCompletion:(id)a3;
- (void)_getPresentationContextForRequestContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_initiateAuthorizationWithRequestContext:(id)a3 completion:(id)a4;
- (void)_initiateRapportAuthorizationWithRequestContext:(id)a3 completion:(id)a4;
- (void)_performRequest:(id)a3 completion:(id)a4;
- (void)_performSRPAuthorizationForUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_performSilentRequest:(id)a3 withCompletion:(id)a4;
- (void)_prepareRequestContext:(id)a3 forCredentialState:(int64_t)a4;
- (void)_processUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_requestUserAuthorizationForContext:(id)a3 completion:(id)a4;
- (void)_safePerformSRPWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_sendPermissionRequestWithCompletion:(id)a3;
- (void)_setupLoginChoicesForPresentationContext:(id)a3 sharedAccounts:(id)a4;
- (void)_validateAndProcessUserResponse:(id)a3 client:(id)a4 completion:(id)a5;
- (void)beginAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)cancelAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)continueAuthorizationWithContext:(id)a3 completion:(id)a4;
- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4;
- (void)fetchAppleIDAuthorizationURLSetWithCompletion:(id)a3;
- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3;
- (void)fetchAppleOwnedDomainSetWithCompletion:(id)a3;
- (void)fetchNativeTakeoverURLSetWithCompletion:(id)a3;
- (void)fetchPrimaryApplicationInformationForWebServiceWithInfo:(id)a3 completion:(id)a4;
- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4;
- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4;
- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4;
- (void)performAuthorization:(id)a3 completion:(id)a4;
- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5;
- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4;
- (void)revokeUpgradeWithContext:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEndorserRapportDiscovery:(id)a3;
- (void)setLocalAccountsStorageController:(id)a3;
- (void)setOriginalRequestContext:(id)a3;
- (void)setRapportClient:(id)a3;
- (void)setSafariPasswordCredentials:(id)a3;
- (void)setSharedAccounts:(id)a3;
- (void)setSharedAccountsStorageController:(id)a3;
- (void)startDiscoveryWithCompletion:(id)a3;
- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5;
@end

@implementation AKAuthorizationDaemonService

- (AKAuthorizationDaemonService)init
{
  return 0;
}

- (AKAuthorizationDaemonService)initWithClient:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AKAuthorizationDaemonService;
  v6 = [(AKAuthorizationDaemonService *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v7->_authorizationRealUserLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[AKAuthorizationSessionManager sharedInstance];
    authSessionManager = v7->_authSessionManager;
    v7->_authSessionManager = (AKAuthorizationSessionManager *)v8;

    uint64_t v10 = +[AKAccountManager sharedInstance];
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v10;

    uint64_t v12 = +[AKAuthorizationStoreManager sharedInstance];
    localAccountsStorageController = v7->_localAccountsStorageController;
    v7->_localAccountsStorageController = (AKAuthorizationStoreManager *)v12;

    v14 = [AKSharedAccountsStorageController alloc];
    id v15 = objc_alloc_init((Class)AAFKeychainManager);
    v16 = +[KCSharingGroupManager sharedInstance];
    v17 = [(AKSharedAccountsStorageController *)v14 initWithKeychainStorageController:v15 keychainGroupManager:v16];
    sharedAccountsStorageController = v7->_sharedAccountsStorageController;
    v7->_sharedAccountsStorageController = v17;

    if ([v5 authorizationRequiresRapport])
    {
      v19 = [[AKAuthorizationRapportClient alloc] initWithClient:v5];
      rapportClient = v7->_rapportClient;
      v7->_rapportClient = v19;
    }
    v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Daemon service initialized with client: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10018E020();
  }

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationDaemonService;
  [(AKAuthorizationDaemonService *)&v4 dealloc];
}

- (void)performAuthorization:(id)a3 completion:(id)a4
{
  v6 = (AKClient *)a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    *(_DWORD *)buf = 138412290;
    v30 = client;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client before perform authorization execution %@", buf, 0xCu);
  }

  uint64_t v10 = [(AKClient *)v6 _proxiedClientBundleID];
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = [(AKClient *)v6 _proxiedClientTeamID];
    if (v12)
    {
      v13 = (void *)v12;
      unsigned int v14 = [(AKClient *)self->_client isPermittedToProxyAuthorizationBundleIdentifier];

      if (!v14) {
        goto LABEL_10;
      }
      id v15 = _AKLogSiwa();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(AKClient *)v6 _proxiedClientBundleID];
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Proxied bundle detected (%@), proxying...", buf, 0xCu);
      }
      [(AKClient *)v6 set_shouldUseProxiedClientBundleIDForSRP:1];
      v17 = [AKOwnerProxyClient alloc];
      v11 = [(AKClient *)self->_client xpcConnection];
      v18 = [(AKOwnerProxyClient *)v17 initWithCredentialRequest:v6 connection:v11];
      v19 = self->_client;
      self->_client = v18;
    }
  }
LABEL_10:
  v20 = _AKLogSiwa();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Requesting clearance to authorize with context %@...", buf, 0xCu);
  }

  authSessionManager = self->_authSessionManager;
  v22 = self->_client;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000A1A58;
  v25[3] = &unk_10022A870;
  v27 = self;
  id v28 = v7;
  v26 = v6;
  objc_super v23 = v6;
  id v24 = v7;
  [(AKAuthorizationSessionManager *)authSessionManager beginSessionWithContext:v23 client:v22 completion:v25];
}

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 userID];
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to get credential state for User identifier: %@", buf, 0xCu);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A2240;
  v13[3] = &unk_10022A898;
  id v14 = v7;
  id v10 = v7;
  v11 = objc_retainBlock(v13);
  uint64_t v12 = [(AKAuthorizationDaemonService *)self _credentialStateController];
  [v12 getCredentialStateForRequest:v6 completion:v11];
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAuthorizationDaemonService *)self _credentialStateController];
  [v8 getCredentialStateForClientID:v7 completion:v6];
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    id v5 = [[AKAuthorizationEndorserRapportDiscovery alloc] initWithClient:self->_client];
    endorserRapportDiscovery = self->_endorserRapportDiscovery;
    self->_endorserRapportDiscovery = v5;

    id v7 = self->_endorserRapportDiscovery;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A2484;
    v13[3] = &unk_100228040;
    id v8 = v4;
    id v14 = v8;
    [(AKAuthorizationEndorserRapportDiscovery *)v7 setDidDeactivateBlock:v13];
    v9 = self->_endorserRapportDiscovery;
    id v12 = 0;
    LOBYTE(v7) = [(AKAuthorizationEndorserRapportDiscovery *)v9 activateWithError:&v12];
    id v10 = v12;
    if ((v7 & 1) == 0) {
      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
    }
  }
  else
  {
    v11 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

- (void)fetchAppleIDAuthorizationURLSetWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = +[AKURLBag bagForAltDSID:0];
  id v5 = [v6 appleIDAuthorizationURLs];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)fetchNativeTakeoverURLSetWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon is fetching native takeover urls", buf, 2u);
  }

  id v5 = +[AKURLBag sharedBag];
  uint64_t v6 = AKURLBagKeyAppleIDAuthorizationURLs;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A2638;
  v8[3] = &unk_10022A8E8;
  id v9 = v3;
  id v7 = v3;
  [v5 configurationValueForKey:v6 fromCache:1 completion:v8];
}

- (void)fetchAppleOwnedDomainSetWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon is fetching apple owned domain", buf, 2u);
  }

  id v5 = +[AKURLBag bagForAltDSID:0];
  uint64_t v6 = [v5 appleOwnedDomains];

  id v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Daemon is returning apple owned domain", v8, 2u);
  }

  v3[2](v3, v6, 0);
}

- (void)revokeUpgradeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A2B7C;
  v14[3] = &unk_1002270A8;
  id v7 = a4;
  id v15 = v7;
  id v8 = objc_retainBlock(v14);
  if ([(AKClient *)self->_client hasInternalAccess])
  {
    id v9 = objc_alloc_init(AKAuthorizationRevokeUpgradeController);
    client = self->_client;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A2C3C;
    v11[3] = &unk_100227BD0;
    id v12 = v6;
    v13 = v8;
    [(AKAuthorizationRevokeUpgradeController *)v9 revokeUpgradeWithContext:v12 client:client completion:v11];
  }
  else
  {
    id v9 = +[NSError ak_errorWithCode:-7026];
    ((void (*)(void *, void, AKAuthorizationRevokeUpgradeController *))v8[2])(v8, 0, v9);
  }
}

- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    id v5 = _AKLogSiwa();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to fetch appleIDAuthorizeHTMLResponseURL", buf, 2u);
    }

    id v6 = objc_opt_new();
    id v7 = [(AKAccountManager *)self->_accountManager altDSIDforPrimaryiCloudAccount];
    [v6 setAltDSID:v7];

    id v8 = [AKGrandSlamRequestProvider alloc];
    id v9 = [(AKURLRequestProviderImpl *)v8 initWithContext:v6 urlBagKey:AKURLBagKeyAppleIDAuthorizeHTMLResponse shouldCacheResource:1];
    [v9 setClient:self->_client];
    [v9 setAuthenticatedRequest:1];
    [v9 setExpectedResponseType:2];
    id v10 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A2EC0;
    v11[3] = &unk_100227340;
    id v12 = v4;
    [(AKServiceControllerImpl *)v10 executeRequestWithCompletion:v11];
  }
  else
  {
    id v6 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018E364();
    }
  }
}

- (void)fetchPrimaryApplicationInformationForWebServiceWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasOwnerAccess])
  {
    id v8 = [(AKAccountManager *)self->_accountManager altDSIDforPrimaryiCloudAccount];
    if (v8)
    {
      id v9 = +[AKApplicationInformationController sharedController];
      [v9 fetchPrimaryApplicationInformationForAltDSID:v8 appInformation:v6 client:self->_client completion:v7];
    }
    else
    {
      v11 = _AKLogSiwa();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10018E434();
      }

      id v12 = +[NSError ak_errorWithCode:-7025];
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    id v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100183934();
    }

    id v8 = +[NSError ak_errorWithCode:-7026];
    v7[2](v7, 0, v8);
  }
}

- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)client hasOwnerAccess])
  {
    id v9 = +[AKAuthorizationIconManager sharedManager];
    [v9 continueFetchingIconWithRequestContext:v6 completion:v8];
  }
  else
  {
    id v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10018E468();
    }

    id v9 = +[NSError ak_errorWithCode:-7026];
    v8[2](v8, 0, v9);
  }
}

- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([(AKClient *)self->_client hasSiwaDefaultEntitlementAccess]
    || [(AKClient *)self->_client hasInternalAccess])
  {
    id v8 = [(AKAccountManager *)self->_accountManager primaryAuthKitAccount];
    if (![(AKAccountManager *)self->_accountManager userUnderAgeForAccount:v8]|| [(AKClient *)self->_client hasSiwaUnderageEntitlementAccess]|| [(AKClient *)self->_client hasInternalAccess])
    {
      if (v6)
      {
        id v9 = [(AKClient *)self->_client bundleID];
        if (v9)
        {
          id v10 = _AKLogSiwa();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            v19 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Establishing connection with notification center for client (%@).", (uint8_t *)&v18, 0xCu);
          }

          id v11 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
          id v12 = +[AKAuthorizationNotificationHandlerInterface XPCInterface];
          [v11 setRemoteObjectInterface:v12];

          v13 = +[AKAuthorizationConnectionManager sharedManager];
          [v13 addConnection:v11 forBundleID:v9];

          id v14 = [v11 remoteObjectProxy];
          [v14 activate];

          v7[2](v7, 1, 0);
        }
        else
        {
          id v11 = +[NSError ak_errorWithCode:-7074];
          ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v11);
        }

        goto LABEL_21;
      }
      uint64_t v16 = -7056;
    }
    else
    {
      v17 = _AKLogSiwa();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10018E49C();
      }

      uint64_t v16 = -7026;
    }
    id v9 = +[NSError ak_errorWithCode:v16];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v9);
LABEL_21:

    goto LABEL_22;
  }
  id v15 = _AKLogSiwa();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10018E49C();
  }

  id v8 = +[NSError ak_errorWithCode:-7026];
  ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v8);
LABEL_22:
}

- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (![(AKClient *)self->_client hasPrivateAccess])
  {
    uint64_t v15 = -7026;
LABEL_8:
    uint64_t v16 = +[NSError ak_errorWithCode:v15];
    v7[2](v7, 0, v16);

    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v15 = -7056;
    goto LABEL_8;
  }
  id v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(AKClient *)self->_client bundleID];
    int v17 = 138412290;
    int v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Establishing connection with state broadcast handler for client (%@).", (uint8_t *)&v17, 0xCu);
  }
  id v10 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
  id v11 = +[AKAuthorizationStateBroadcastHandlerInterface XPCInterface];
  [v10 setRemoteObjectInterface:v11];

  id v12 = +[AKAuthorizationConnectionManager sharedManager];
  v13 = [(AKClient *)self->_client bundleID];
  [v12 addConnection:v10 forBundleID:v13];

  id v14 = [v10 remoteObjectProxy];
  [v14 activate];

  v7[2](v7, 1, 0);
LABEL_9:
}

- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKClient *)self->_client hasSiwaAccountListAccess]
    || [(AKClient *)self->_client hasOwnerAccess])
  {
    uint64_t v8 = [v6 authorizationRequest];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [v6 authorizationRequest];
      id v11 = [v10 authkitAccount];

      if (!v11)
      {
        id v12 = _AKLogSiwa();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling request with missing account, default to primary AuthKit account if not data separated account", buf, 2u);
        }

        v13 = +[AKAccountManager sharedInstance];
        id v14 = [v13 authKitAccountRequestingAuthorization];
        uint64_t v15 = [v6 authorizationRequest];
        [v15 setAuthkitAccount:v14];
      }
    }
    if ([(AKClient *)self->_client hasSiwaAccountListAccess]) {
      [(AKAuthorizationDaemonService *)self _prepareRequestContext:v6 forCredentialState:[(AKAuthorizationDaemonService *)self _credentialStateForRequestContext:v6]];
    }
    uint64_t v16 = _AKLogSiwa();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Client owner detected, checking for proxied bundle", v20, 2u);
    }

    int v17 = [(AKAuthorizationDaemonService *)self _clientForContext:v6];
    [(AKAuthorizationDaemonService *)self _getPresentationContextForRequestContext:v6 client:v17 completion:v7];
  }
  else
  {
    int v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Client doesn't have owner or entitlement access, operation not permitted", v19, 2u);
    }

    int v17 = +[NSError ak_errorWithCode:-7026];
    v7[2](v7, 0, v17);
  }
}

- (id)_credentialStateController
{
  id v3 = +[AKFeatureManager sharedManager];
  unsigned int v4 = [v3 isSiwaCredentialSharingEnabled];

  id v5 = [AKAuthorizationCredentialStateController alloc];
  client = self->_client;
  if (v4) {
    id v7 = [(AKAuthorizationCredentialStateController *)v5 initWithClient:client accountManager:self->_accountManager localAccountsStorageController:self->_localAccountsStorageController sharedAccountsStorageController:self->_sharedAccountsStorageController];
  }
  else {
    id v7 = [(AKAuthorizationCredentialStateController *)v5 initWithClient:client];
  }

  return v7;
}

- (id)_clientForContext:(id)a3
{
  unsigned int v4 = [(AKAuthorizationSessionManager *)self->_authSessionManager clientForContext:a3];
  id v5 = _AKLogSiwa();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Existing client found from the session manager and using it %@", (uint8_t *)&v10, 0xCu);
    }

    client = v4;
  }
  else
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using the client initiated with the daemon service's connection", (uint8_t *)&v10, 2u);
    }

    client = self->_client;
  }
  uint64_t v8 = client;

  return v8;
}

- (void)_createAndPerformRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [v6 authorizationRequest];
  if (v8)
  {
    id v9 = (void *)v8;
    int v10 = [v6 authorizationRequest];
    id v11 = [v10 authkitAccount];

    if (!v11)
    {
      id v12 = _AKLogSiwa();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling request with missing account, default to primary AuthKit account if not data separated account", buf, 2u);
      }

      v13 = +[AKAccountManager sharedInstance];
      id v14 = [v13 authKitAccountRequestingAuthorization];
      uint64_t v15 = [v6 authorizationRequest];
      [v15 setAuthkitAccount:v14];
    }
  }
  if (![(AKAuthorizationDaemonService *)self _verifyEntitlementsForRequest:v6])
  {
    v22 = +[NSError ak_errorWithCode:-7026];
    v7[2](v7, 0, v22);

    goto LABEL_32;
  }
  uint64_t v16 = [v6 authorizationRequest];

  if (v16)
  {
    int v17 = (AKCredentialRequestContext *)v6;
    int v18 = v17;
    if ([(AKClient *)self->_client authorizationClientProvidesUI])
    {
      int v18 = self->_originalRequestContext;
    }
    int64_t v19 = [(AKAuthorizationDaemonService *)self _credentialStateForRequestContext:v18];
    if ([(AKAuthorizationDaemonService *)self _shouldEarlyReturnRequest:v18 forCredentialState:v19])
    {
      v20 = _AKLogSiwa();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Early returning the request as it meets preferImmediatelyAvailableCredentials criteria.", buf, 2u);
      }

      v21 = +[NSError ak_errorWithCode:-7089];
      v7[2](v7, 0, v21);

      goto LABEL_32;
    }
    [(AKAuthorizationDaemonService *)self _prepareRequestContext:v18 forCredentialState:v19];
    objc_super v23 = [(AKCredentialRequestContext *)v18 authorizationRequest];
    if ([v23 _isSilentAppTransfer])
    {
      id v24 = [(AKCredentialRequestContext *)v18 authorizationRequest];
      id v25 = [v24 userIdentifier];

      if (v25)
      {
        v26 = _AKLogSiwa();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Will attempt to perform silent authorization using provided user ID.", buf, 2u);
        }

        [(AKCredentialRequestContext *)v17 set_shouldSkipAuthorizationUI:1];
      }
    }
    else
    {
    }
  }
  *(void *)buf = 0;
  v45 = buf;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  v27 = [v6 authorizationRequest];
  if (v27)
  {
    id v28 = [v6 passwordRequest];

    if (!v28)
    {
      if ([(AKAuthorizationDaemonService *)self _shouldStartSatoriVerificationForRequestContext:v6])
      {
        v29 = _AKLogSiwa();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Attempting to get real user info...", v43, 2u);
        }

        v30 = [AKCASatoriReporter alloc];
        v31 = [v6 requestIdentifier];
        v32 = [v31 UUIDString];
        v33 = [(AKCASatoriReporter *)v30 initWithRequestID:v32];

        v34 = [[AKSatoriController alloc] initWithClient:self->_client];
        [(AKSatoriController *)v34 setAnalyticsReport:v33];
        v35 = [v6 authorizationRequest];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000A4060;
        v40[3] = &unk_10022A938;
        v40[4] = self;
        v42 = buf;
        v36 = v33;
        v41 = v36;
        [(AKSatoriController *)v34 fetchRealUserLikelihoodForRequest:v35 withCompletionHandler:v40];
      }
      else
      {
        v36 = _AKLogSiwa();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Application has been previously authorized, or originated from web or keychain upgrade to SIWA. Skipping satori verification", v43, 2u);
        }
      }
    }
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000A41C4;
  v37[3] = &unk_10022A988;
  v37[4] = self;
  v39 = buf;
  v38 = v7;
  [(AKAuthorizationDaemonService *)self _determineUIAndPerformRequest:v6 completion:v37];

  _Block_object_dispose(buf, 8);
LABEL_32:
}

- (BOOL)_shouldEarlyReturnRequest:(id)a3 forCredentialState:(int64_t)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [v5 requestOptions];
  id v7 = [v5 passwordRequest];

  if (a4 == 1) {
    return 0;
  }
  else {
    return v6 & (v7 == 0);
  }
}

- (void)_determineUIAndPerformRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 _shouldSkipAuthorizationUI])
  {
    uint64_t v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requested to skip auth UI...", v9, 2u);
    }

    [(AKAuthorizationDaemonService *)self _performSilentRequest:v6 withCompletion:v7];
  }
  else
  {
    [(AKAuthorizationDaemonService *)self _performRequest:v6 completion:v7];
  }
}

- (void)_performRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 passwordRequest];

  if (([v6 _shouldForceUI] & 1) == 0) {
    [(AKClient *)self->_client authorizationRequiresRapport];
  }
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting interactive authorization...", v9, 2u);
  }

  [(AKAuthorizationDaemonService *)self _initiateAuthorizationWithRequestContext:v6 completion:v7];
}

- (void)_performSilentRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v26 = 0;
  unsigned __int8 v8 = +[AKAuthorizationValidator canPerformCredentialRequest:v6 error:&v26];
  id v9 = v26;
  if (v8)
  {
    int v10 = [v6 authorizationRequest];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 authkitAccount];

      if (v12)
      {
        v13 = _AKLogSiwa();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting safe SRP for first object...", v25, 2u);
        }

        id v14 = objc_opt_new();
        [v14 setSelectedRequest:v11];
        id v15 = objc_alloc_init((Class)AKAuthorizationScopesUserSelection);
        [v14 setUserSelection:v15];

        id v16 = [v6 _shouldForcePrivateEmail];
        int v17 = [v14 userSelection];
        [v17 setMakePrivateEmail:v16];

        if ([v11 _isAuthorizingUsingSharedAccount])
        {
          int v18 = [v11 _sharedAccount];

          if (v18)
          {
            id v19 = objc_alloc((Class)AKAuthorizationSharedAccountLoginChoice);
            v20 = [v11 _sharedAccount];
            id v21 = [v19 initWithSignInWithAppleAccount:v20];
            [v14 setLoginChoice:v21];
          }
        }
        [(AKAuthorizationDaemonService *)self _safePerformSRPWithUserResponse:v14 client:self->_client completion:v7];
        goto LABEL_18;
      }
      uint64_t v24 = -7025;
    }
    else
    {
      objc_super v23 = _AKLogSiwa();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10018E4D0();
      }

      uint64_t v24 = -7013;
    }
    id v14 = +[NSError ak_errorWithCode:v24];
    v7[2](v7, 0, v14);
LABEL_18:

    goto LABEL_19;
  }
  v22 = _AKLogSiwa();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10018E504();
  }

  v7[2](v7, 0, v9);
LABEL_19:
}

- (BOOL)_verifyEntitlementsForRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AKClient *)self->_client hasOwnerAccess];
  uint64_t v6 = [(AKClient *)self->_client hasInternalAccess];
  unsigned __int8 v7 = [(AKClient *)self->_client hasPrivateAccess];
  accountManager = self->_accountManager;
  id v9 = [v4 authorizationRequest];
  int v10 = [v9 authkitAccount];
  unsigned int v11 = [(AKAccountManager *)accountManager userUnderAgeForAccount:v10];

  id v12 = [v4 passwordRequest];
  if (v12)
  {
    v13 = [v4 authorizationRequest];
    BOOL v14 = v13 == 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  id v15 = _AKLogSiwa();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    if (v14) {
      CFStringRef v16 = @"YES";
    }
    int v28 = 138412290;
    CFStringRef v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Requesting password only: %@", (uint8_t *)&v28, 0xCu);
  }

  if (v5)
  {
    uint64_t v6 = _AKLogSiwa();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Owner detected!", (uint8_t *)&v28, 2u);
    }

    LOBYTE(v6) = 1;
    goto LABEL_18;
  }
  if (([v4 _shouldSkipBiometrics] & 1) != 0
    || ([v4 _shouldSkipAuthorizationUI] & 1) != 0
    || [v4 _shouldForceUI])
  {
    int v17 = _AKLogSiwa();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = +[NSNumber numberWithBool:v6];
      int v28 = 138412290;
      CFStringRef v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Internal request made by internal client? %@", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_18;
  }
  if ([v4 _isFirstPartyLogin])
  {
LABEL_23:
    LOBYTE(v6) = v6 | v7;
    goto LABEL_18;
  }
  v20 = [v4 _iconData];
  if (v20 || ([v4 _iconName], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_23;
  }
  id v21 = [v4 _upgradeContext];

  if (v21) {
    goto LABEL_23;
  }
  v22 = _AKLogSiwa();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [(AKClient *)self->_client hasSiwaDefaultEntitlementAccess];
    int v28 = 138412290;
    CFStringRef v29 = @"has";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Client %@ default access level in SiwA entitlement", (uint8_t *)&v28, 0xCu);
  }

  objc_super v23 = _AKLogSiwa();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    [(AKClient *)self->_client hasSiwaUnderageEntitlementAccess];
    int v28 = 138412290;
    CFStringRef v29 = @"has";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Client %@ underage-users access level in SiwA entitlement", (uint8_t *)&v28, 0xCu);
  }

  if ([(AKClient *)self->_client hasSiwaUnderageEntitlementAccess]
    || [(AKClient *)self->_client hasSiwaDefaultEntitlementAccess])
  {
    uint64_t v24 = +[AKFeatureManager sharedManager];
    unsigned int v25 = [v24 isTiburonU13Enabled];

    client = self->_client;
    if ((v11 & v25) == 1) {
      unsigned __int8 v27 = [(AKClient *)client hasSiwaUnderageEntitlementAccess];
    }
    else {
      unsigned __int8 v27 = [(AKClient *)client hasSiwaDefaultEntitlementAccess];
    }
    LOBYTE(v6) = v27;
  }
  else
  {
    LOBYTE(v6) = v6 | v7 | v14;
  }
LABEL_18:

  return v6;
}

- (void)_initiateAuthorizationWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[AKAuthorizationIconManager sharedManager];
  [v8 startFetchingIconWithRequestContext:v6];

  if ([(AKClient *)self->_client authorizationRequiresRapport])
  {
    [(AKAuthorizationDaemonService *)self _initiateRapportAuthorizationWithRequestContext:v6 completion:v7];
  }
  else if ([(AKClient *)self->_client authorizationClientProvidesUI])
  {
    [(AKAuthorizationDaemonService *)self presentAuthorizationUIForContext:self->_originalRequestContext completion:v7];
  }
  else
  {
    client = self->_client;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A4CB4;
    v10[3] = &unk_10022A9B0;
    v10[4] = self;
    id v11 = v7;
    [(AKAuthorizationDaemonService *)self _getPresentationContextForRequestContext:v6 client:client completion:v10];
  }
}

- (void)_initiateRapportAuthorizationWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  unsigned __int8 v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rapport authorization is required for request %@", buf, 0xCu);
  }

  id v13 = 0;
  unsigned int v9 = +[AKAuthorizationValidator canPerformCredentialRequest:v6 error:&v13];
  id v10 = v13;
  if (v9)
  {
    id v11 = [v6 authorizationRequest];
    [v11 setAuthkitAccount:0];

    [(AKAuthorizationRapportClient *)self->_rapportClient performAuthorization:v6 completion:v7];
  }
  else
  {
    id v12 = _AKLogSiwa();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rapport request is not eligible for authorization", buf, 2u);
    }

    v7[2](v7, 0, v10);
  }
}

- (BOOL)_shouldStartSatoriVerificationForRequestContext:(id)a3
{
  id v4 = a3;
  if ((id)-[AKAuthorizationDaemonService _credentialStateForRequestContext:](self, "_credentialStateForRequestContext:", v4) == (id)2&& ([v4 _isWebLogin] & 1) == 0)
  {
    unsigned int v5 = [v4 _isEligibleForUpgradeFromPassword] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, AKOwnerProxyClient *))a5;
  if (![(AKClient *)self->_client hasPrivateAccess])
  {
    int v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10018E56C();
    }

    uint64_t v19 = -7026;
    goto LABEL_12;
  }
  id v11 = [v9 _proxiedClientBundleID];

  id v12 = _AKLogSiwa();
  id v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018E538();
    }

    uint64_t v19 = -7044;
LABEL_12:
    BOOL v14 = +[NSError ak_errorWithCode:v19];
    v10[2](v10, 0, v14);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Storing authorization for proxied request (%@).", (uint8_t *)&v20, 0xCu);
  }

  BOOL v14 = [[AKOwnerProxyClient alloc] initWithCredentialRequest:v9];
  id v15 = objc_alloc_init(AKApplicationAuthorizationController);
  CFStringRef v16 = [v9 authorizationRequest];
  int v17 = [v16 altDSID];
  [(AKApplicationAuthorizationController *)v15 storeAuthorization:v8 withAltDSID:v17 forClient:v14];

  v10[2](v10, 1, 0);
LABEL_13:
}

- (void)_getPresentationContextForRequestContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  uint64_t v11 = [v8 authorizationRequest];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [v8 passwordRequest];

    if (v13)
    {
      BOOL v14 = [v8 authorizationRequest];
      [v14 setRequestedScopes:0];
    }
  }
  v69[0] = 0;
  unsigned __int8 v15 = +[AKAuthorizationValidator canPerformCredentialRequest:v8 error:v69];
  id v16 = v69[0];
  if (v15)
  {
    v59 = v9;
    int v17 = +[AKAuthorizationPresentationContext presentationContextForRequestContext:v8 client:v9];
    objc_msgSend(v17, "setSignInAllowsPCSKeyAccess:", -[AKAuthorizationDaemonService _shouldAllowPCSKeyAccessForContext:](self, "_shouldAllowPCSKeyAccessForContext:", v8));
    int v18 = objc_alloc_init(AKUserInfoController);
    uint64_t v19 = [v17 credentialRequestContext];
    id v68 = 0;
    unsigned int v20 = +[AKAuthorizationValidator canPerformAuthorizationRequest:v19 error:&v68];
    id v57 = v68;

    char v67 = 0;
    if ((v20 & 1) == 0)
    {
      id v21 = [v17 credentialRequestContext];
      [v21 setAuthorizationRequest:0];
    }
    v22 = [v17 credentialRequestContext];
    objc_super v23 = [v22 authorizationRequest];

    uint64_t v24 = [v17 credentialRequestContext];
    v60 = [v24 passwordRequest];

    group = dispatch_group_create();
    if (v23) {
      unsigned int v25 = v20;
    }
    else {
      unsigned int v25 = 0;
    }
    unsigned int v55 = v25;
    v58 = v18;
    if (v25 == 1)
    {
      id v66 = 0;
      id v26 = [(AKUserInfoController *)v18 authorizationUserInformationForRequest:v23 shouldRequestUpdate:&v67 error:&v66];
      id v27 = v66;
      [v17 setUserInformation:v26];

      int v28 = [v23 requestedScopes];
      if ([v28 count])
      {
      }
      else
      {
        v31 = [v17 credentialRequestContext];
        unsigned int v32 = [v31 _isFirstPartyLogin];

        if (!v32)
        {
LABEL_26:
          v36 = +[AKFeatureManager sharedManager];
          unsigned int v37 = [v36 isSiwaCredentialSharingEnabled];
          id v56 = v27;
          if (v23 && v37)
          {
            unsigned int v38 = [v23 _hasSharedAccounts];

            if (!v38) {
              goto LABEL_34;
            }
            dispatch_group_enter(group);
            v39 = [v23 clientID];
            v40 = v39;
            if (v39)
            {
              id v41 = v39;
            }
            else
            {
              id v41 = [v59 bundleID];
            }
            v36 = v41;

            sharedAccountsStorageController = self->_sharedAccountsStorageController;
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1000A5814;
            v64[3] = &unk_10022A9F8;
            v64[4] = self;
            v65 = group;
            [(AKSharedAccountsStorageController *)sharedAccountsStorageController fetchAccountsSharedWithCurrentUserWithClientID:v36 completionHandler:v64];
          }
LABEL_34:
          if (v60)
          {
            dispatch_group_enter(group);
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_1000A58AC;
            v62[3] = &unk_10022AA20;
            v62[4] = self;
            v43 = group;
            v63 = v43;
            v44 = objc_retainBlock(v62);
            v45 = [v17 credentialRequestContext];
            uint64_t v46 = [v45 _proxiedAssociatedDomains];

            if (v46) {
              [(AKAuthorizationDaemonService *)self _fetchCredentialsForAssociatedDomains:v46 completion:v44];
            }
            else {
              [(AKAuthorizationDaemonService *)self _fetchSafariCredentialsWithCompletion:v44];
            }

            dispatch_group_wait(v43, 0xFFFFFFFFFFFFFFFFLL);
            [(AKAuthorizationDaemonService *)self _setupLoginChoicesForPresentationContext:v17 sharedAccounts:self->_sharedAccounts];
            v48 = [v17 loginChoices];
            id v49 = [v48 count];

            if (v49) {
              goto LABEL_44;
            }
            v50 = _AKLogSiwa();
            v34 = v57;
            v33 = v58;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              sub_10018E5D4();
            }

            if (v55)
            {
              v51 = [v17 credentialRequestContext];
              unsigned int v52 = [v51 _isRapportLogin];

              if (v52)
              {
                v53 = [v17 credentialRequestContext];
                [v53 setPasswordRequest:0];

                v10[2](v10, v17, 0);
                goto LABEL_53;
              }
            }
            v54 = +[NSError ak_errorWithCode:-7089];
            ((void (**)(id, void *, void *))v10)[2](v10, 0, v54);
          }
          else
          {
            dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
            [(AKAuthorizationDaemonService *)self _setupLoginChoicesForPresentationContext:v17 sharedAccounts:self->_sharedAccounts];
            if (v55)
            {
LABEL_44:
              v10[2](v10, v17, 0);
              v34 = v57;
              v33 = v58;
              goto LABEL_53;
            }
            char v47 = _AKLogSiwa();
            v34 = v57;
            v33 = v58;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_10018E5A0();
            }

            if (v57)
            {
              ((void (**)(id, void *, id))v10)[2](v10, 0, v57);
LABEL_53:
              id v27 = v56;
              goto LABEL_54;
            }
            v54 = +[NSError ak_errorWithCode:-7044];
            ((void (**)(id, void *, void *))v10)[2](v10, 0, v54);
          }

          goto LABEL_53;
        }
      }
      if (v27)
      {
        ((void (**)(id, void *, id))v10)[2](v10, 0, v27);
        v34 = v57;
        v33 = v58;
LABEL_54:

        id v9 = v59;
        goto LABEL_55;
      }
      if (v67)
      {
        v35 = [v23 altDSID];
        [(AKUserInfoController *)v58 fetchUserInformationForAltDSID:v35 client:v59 completion:&stru_10022A9D0];
      }
    }
    id v27 = 0;
    goto LABEL_26;
  }
  CFStringRef v29 = _AKLogSiwa();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10018E63C((uint64_t)v16, v29);
  }

  if (!v16)
  {
    v30 = _AKLogSiwa();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10018E608();
    }

    id v16 = +[NSError ak_errorWithCode:-7001];
  }
  ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
LABEL_55:
}

- (BOOL)_shouldAllowPCSKeyAccessForContext:(id)a3
{
  unsigned int v3 = [(AKAuthorizationDaemonService *)self _isPCSAccessForContext:a3];
  if (v3)
  {
    LOBYTE(v3) = +[AKCDPFactory isEligibleToArmDeviceForPCSAuth];
  }
  return v3;
}

- (BOOL)_isPCSAccessForContext:(id)a3
{
  unsigned int v3 = [a3 authorizationRequest];
  id v4 = [v3 appProvidedData];
  unsigned int v5 = [v4 objectForKeyedSubscript:@"originURL"];
  id v6 = +[NSURL URLWithString:v5];

  id v7 = [v6 host];
  LOBYTE(v4) = [v7 containsString:@"icloud.com"];

  return (char)v4;
}

- (void)_prepareRequestContext:(id)a3 forCredentialState:(int64_t)a4
{
  id v6 = a3;
  id v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking for genesis event!", (uint8_t *)&v21, 2u);
  }

  id v8 = [v6 authorizationRequest];
  objc_msgSend(v8, "set_isSilentAppTransfer:", 0);
  [v8 setExistingStatus:a4];
  id v9 = [(AKAccountManager *)self->_accountManager primaryAuthKitAccount];
  unsigned int v10 = [(AKAccountManager *)self->_accountManager userUnderAgeForAccount:v9];
  uint64_t v11 = +[AKFeatureManager sharedManager];
  unsigned int v12 = [v11 isTiburonU13Enabled];

  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    id v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [v8 clientID];
      int v21 = 138412290;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Previous credential for client %@ is authorized", (uint8_t *)&v21, 0xCu);
    }
    if ((a4 | 4) == 5) {
      [v8 setRequestedScopes:&__NSArray0__struct];
    }
    objc_msgSend(v8, "set_hasSharedAccounts:", (a4 & 0xFFFFFFFFFFFFFFFELL) == 4);
    goto LABEL_10;
  }
  if ([v6 _isEligibleForUpgradeFromPassword])
  {
    unsigned __int8 v15 = _AKLogSiwa();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:

      [v8 setRequestedScopes:&__NSArray0__struct];
      goto LABEL_10;
    }
    id v16 = [v8 requestedScopes];
    int v21 = 138412290;
    v22 = v16;
    int v17 = "Resetting scopes %@ for upgrade from keychain";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, 0xCu);

    goto LABEL_15;
  }
  if (a4 != 3)
  {
    if ((v10 & v12) != 1) {
      goto LABEL_10;
    }
    unsigned __int8 v15 = _AKLogSiwa();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    id v16 = [v8 requestedScopes];
    int v21 = 138412290;
    v22 = v16;
    int v17 = "Resetting scopes %@ for underage user.";
    goto LABEL_14;
  }
  int v18 = _AKLogSiwa();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v8 clientID];
    int v21 = 138412290;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Previous credential for client %@ is in transfer state", (uint8_t *)&v21, 0xCu);
  }
  [v8 setRequestedScopes:&__NSArray0__struct];
  unsigned int v20 = [v8 userIdentifier];
  objc_msgSend(v8, "set_isSilentAppTransfer:", v20 != 0);

LABEL_10:
}

- (int64_t)_credentialStateForRequestContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AKAuthorizationDaemonService *)self _credentialStateController];
  id v6 = [v5 getInternalCredentialStateForCredentialRequestContext:v4];

  return (int64_t)v6;
}

- (void)_setupLoginChoicesForPresentationContext:(id)a3 sharedAccounts:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 credentialRequestContext];
  id v8 = [v7 authorizationRequest];

  BOOL v9 = [v8 existingStatus] == (id)1 || objc_msgSend(v8, "existingStatus") == (id)5;
  BOOL v10 = [v8 existingStatus] == (id)4 || objc_msgSend(v8, "existingStatus") == (id)5;
  id v49 = self;
  v50 = v8;
  BOOL v48 = v10;
  if (v8)
  {
    uint64_t v11 = _AKLogSiwa();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v12) {
        sub_10018E81C();
      }

      id v13 = objc_alloc((Class)AKAuthorizationLoginChoice);
      BOOL v14 = [(AKAuthorizationDaemonService *)self _accountDisplayNameWithPresentationContext:v5];
      id v15 = [v13 initWithUser:v14 site:&stru_100233250];

      [v15 setAppleIDAuth:1];
      [v6 addObject:v15];

      unsigned int v16 = 0;
    }
    else
    {
      if (v12) {
        sub_10018E850();
      }

      unsigned int v16 = [v8 shouldHideCreateOption] ^ 1;
    }
    int v17 = +[AKFeatureManager sharedManager];
    unsigned int v18 = [v17 isSiwaCredentialSharingEnabled] & v10;

    if (v18 == 1)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v19 = self->_sharedAccounts;
      id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v56;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v56 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = [objc_alloc((Class)AKAuthorizationSharedAccountLoginChoice) initWithSignInWithAppleAccount:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            unsigned int v25 = _AKLogSiwa();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              sub_10018E7C0((uint64_t)v61, (uint64_t)v24);
            }

            [v6 addObject:v24];
          }
          id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v21);
      }

      self = v49;
      id v8 = v50;
      BOOL v10 = v48;
    }
  }
  else
  {
    unsigned int v16 = 0;
  }
  NSUInteger v26 = [(NSArray *)self->_safariPasswordCredentials count];
  NSUInteger v27 = v26;
  if (v26)
  {
    NSUInteger v45 = v26;
    id v46 = v5;
    unsigned int v47 = v16;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    int v28 = self->_safariPasswordCredentials;
    id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v52;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
          id v34 = objc_alloc((Class)AKAuthorizationLoginChoice);
          v35 = [v33 user];
          v36 = [v33 site];
          id v37 = [v34 initWithUser:v35 site:v36];

          unsigned int v38 = _AKLogSiwa();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            sub_10018E764((uint64_t)v59, (uint64_t)v37);
          }

          [v6 addObject:v37];
        }
        id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v30);
    }

    NSUInteger v27 = v45;
    id v5 = v46;
    self = v49;
    id v8 = v50;
    unsigned int v16 = v47;
    BOOL v10 = v48;
  }
  if (v16)
  {
    v39 = [v5 credentialRequestContext];
    unsigned int v40 = [v39 _isRapportLogin];
    if (v27) {
      unsigned int v41 = v40;
    }
    else {
      unsigned int v41 = 0;
    }

    if ((v41 | v10) == 1)
    {
      id v42 = objc_alloc((Class)AKAuthorizationLoginChoice);
      v43 = [(AKAuthorizationDaemonService *)self _accountDisplayNameWithPresentationContext:v5];
      id v44 = [v42 initWithUser:v43 site:@"create"];

      [v44 setAppleIDAuth:1];
      [v44 setCreateAppleID:1];
      [v6 addObject:v44];
    }
  }
  objc_msgSend(v5, "setLoginChoices:", v6, v45, v46);
}

- (void)_fetchSafariCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018E884((uint64_t)self);
  }

  if (sub_10003039C()) {
    id v6 = sub_100030828();
  }
  else {
    id v6 = 0;
  }
  id v7 = [(AKClient *)self->_client appID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A6380;
  v9[3] = &unk_10022AA48;
  id v10 = v4;
  id v8 = v4;
  [v6 getCredentialsForAppWithAppID:v7 completionHandler:v9];
}

- (void)_fetchCredentialsForAssociatedDomains:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _AKLogSiwa();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching credentials for proxied associated domains. {proxiedAssociatedDomains=%@}", buf, 0xCu);
  }

  if (sub_10003039C()) {
    id v8 = sub_100030828();
  }
  else {
    id v8 = 0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A6540;
  v10[3] = &unk_10022AA48;
  id v11 = v6;
  id v9 = v6;
  [v8 getCredentialsForAppWithAppID:0 externallyVerifiedAndApprovedSharedWebCredentialDomains:v5 completionHandler:v10];
}

- (void)_requestUserAuthorizationForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presenting authorization UI for request %@", buf, 0xCu);
  }

  id v9 = objc_alloc_init(AKAuthorizationPresenter);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A673C;
  v18[3] = &unk_10022AA70;
  id v19 = v6;
  id v20 = self;
  id v10 = v6;
  [(AKAuthorizationPresenter *)v9 setAuthorizationResponseValidator:v18];
  id v11 = +[AKAuthorizationIconManager sharedManager];
  [v11 setFetchIconBlockForPresenter:v9 withContext:v10];

  client = self->_client;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A6834;
  v15[3] = &unk_10022AA98;
  unsigned int v16 = v9;
  id v17 = v7;
  id v13 = v9;
  id v14 = v7;
  [(AKAuthorizationPresenter *)v13 presentAuthorizationWithContext:v10 client:client completion:v15];
}

- (void)_safePerformSRPWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  id v11 = [v8 selectedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v13 = _AKLogSiwa();
  id v14 = v13;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting authorization with response %@, and client: %@", (uint8_t *)&v16, 0x16u);
    }

    [(AKAuthorizationDaemonService *)self _performSRPAuthorizationForUserResponse:v8 client:v9 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018E9EC(v8, v14);
    }

    uint64_t v15 = +[NSError ak_errorWithCode:-7027];
    v10[2](v10, 0, v15);

    id v10 = (void (**)(id, void, uint64_t))v15;
  }
}

- (void)_performSRPAuthorizationForUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A6AF8;
  v15[3] = &unk_10022AAC0;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  __int16 v18 = [[AKSRPService alloc] initWithClient:v9];
  id v19 = v10;
  id v11 = v10;
  BOOL v12 = v18;
  id v13 = v8;
  id v14 = v9;
  [(AKAuthorizationDaemonService *)self _fetchAuthContextWithUserResponse:v13 client:v14 completion:v15];
}

- (void)_fetchAuthContextWithUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(AKAuthorizationDaemonService *)self authorizationContextWithUserResponse:v8 client:a4];
  id v11 = [v8 userSelection];
  [v10 setUserSelection:v11];

  if ([(AKCredentialRequestContext *)self->_originalRequestContext _isWebLogin]) {
    id v12 = [(AKCredentialRequestContext *)self->_originalRequestContext _isFirstPartyLogin];
  }
  else {
    id v12 = 0;
  }
  id v13 = _AKLogSiwa();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10018EC28((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (v12)
  {
    id v20 = +[AKCDPFactory walrusStatusLiveValue];
    id v21 = [v20 captureCurrentValue];

    if ([v21 unsignedIntegerValue] == (id)1)
    {
      id v22 = _AKLogSiwa();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10018EAE8();
      }

      objc_msgSend(v10, "set_shouldRequestToArmDeviceToAllowPCSKeyUpload:", 1);
      v9[2](v9, v10);
      goto LABEL_29;
    }
    id v24 = [v8 selectedRequest];
    accountManager = self->_accountManager;
    NSUInteger v26 = [v24 altDSID];
    id v46 = 0;
    NSUInteger v27 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v26 error:&v46];
    id v28 = v46;

    if (v27)
    {
      id v29 = [(AKAccountManager *)self->_accountManager edpStateValueForAccount:v27];
      id v30 = _AKLogSiwa();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        sub_10018EBB8(v29 == (id)1, v30, v31, v32, v33, v34, v35, v36);
      }

      id v37 = _AKLogSiwa();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
      if (v29 == (id)1)
      {
        if (v38) {
          sub_10018EB50();
        }

        v39 = [v24 altDSID];
        unsigned int v40 = +[AKCDPFactory contextForAltDSID:v39];

        unsigned int v41 = objc_opt_new();
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000A6FF8;
        v43[3] = &unk_10022AAE8;
        id v44 = v10;
        NSUInteger v45 = v9;
        [v41 isEDPHealthyForCDPContext:v40 completion:v43];

        goto LABEL_28;
      }
      if (v38) {
        sub_10018EB84();
      }
    }
    else
    {
      id v42 = _AKLogSiwa();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_10018EB1C();
      }
    }
    v9[2](v9, v10);
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  objc_super v23 = _AKLogSiwa();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10018EAB4();
  }

  v9[2](v9, v10);
LABEL_30:
}

- (void)_completeAuthorizationWithServerResponse:(id)a3 userResponse:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v48 = a6;
  if (![v10 isUnderAgeOfMajority]
    || ([v10 isFirstPartyApp] & 1) != 0)
  {
LABEL_9:
    uint64_t v15 = objc_msgSend(v11, "selectedRequest", v12);
    id v17 = objc_alloc_init((Class)AKAuthorization);
    id v19 = [objc_alloc((Class)AKAuthorizationCredential) initWithServerResponse:v10];
    [v17 setCredential:v19];
    [v17 setAuthorizedRequest:v15];
    [(AKAuthorizationDaemonService *)self _extractWebSessionAuthorizationFromResponse:v10];
    id v20 = [v19 userInformation];
    id v21 = [v15 requestedScopes];
    unsigned int v22 = [v21 containsObject:AKAuthorizationScopeEmail];

    if (v22)
    {
      objc_super v23 = [v11 userSelection];
      unsigned __int8 v24 = [v23 makePrivateEmail];

      if ((v24 & 1) == 0)
      {
        unsigned int v25 = [v11 userSelection];
        NSUInteger v26 = [v25 userInformation];
        NSUInteger v27 = [v26 selectedEmail];
        [v20 setSelectedEmail:v27];
      }
    }
    else
    {
      [v20 setSelectedEmail:0];
    }
    id v28 = [v15 requestedScopes];
    unsigned int v29 = [v28 containsObject:AKAuthorizationScopeFullName];

    if (v29)
    {
      id v30 = [v11 userSelection];
      uint64_t v31 = [v30 userInformation];
      uint64_t v32 = [v31 givenName];
      [v20 setGivenName:v32];

      uint64_t v33 = [v11 userSelection];
      uint64_t v34 = [v33 userInformation];
      uint64_t v35 = [v34 familyName];
      [v20 setFamilyName:v35];
    }
    if ([(AKClient *)self->_client hasSiwaUnderageEntitlementAccess]) {
      uint64_t v36 = [v10 isUnderAgeOfMajority];
    }
    else {
      uint64_t v36 = 0;
    }
    [v20 setUserAgeRange:v36];
    if ([v15 isEligibleForUpgradeFromPassword])
    {
      id v37 = [[AKOwnerProxyClient alloc] initWithCredentialRequest:self->_originalRequestContext];
      BOOL v38 = objc_opt_new();
      v39 = [v11 selectedRequest];
      unsigned int v40 = [v39 altDSID];
      [v38 storeAuthorization:v17 withAltDSID:v40 forClient:v37];

      id v12 = v47;
    }
    else
    {
      id v12 = v47;
      if ([v11 hasSelectedSharedAccountForLogin])
      {
        unsigned int v41 = [v10 signInWithAppleSharedAccountGroupID];
        if (v41)
        {
          id v42 = _AKLogSiwa();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "SRP with shared account was successful", buf, 2u);
          }

          v43 = _AKLogSiwa();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v55 = v41;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Verifying if user is a member of group - %@", buf, 0xCu);
          }

          sharedAccountsStorageController = self->_sharedAccountsStorageController;
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000A7670;
          v49[3] = &unk_100228C48;
          NSUInteger v45 = v48;
          id v52 = v48;
          id v50 = v17;
          id v51 = v41;
          [(AKSharedAccountsStorageController *)sharedAccountsStorageController isMemberOfGroupWithGroupID:v51 completion:v49];

          id v46 = v52;
        }
        else
        {
          id v46 = +[NSError ak_errorWithCode:-7026];
          NSUInteger v45 = v48;
          (*((void (**)(id, void, void *))v48 + 2))(v48, 0, v46);
        }

        goto LABEL_32;
      }
      id v37 = (AKOwnerProxyClient *)objc_opt_new();
      BOOL v38 = [v11 selectedRequest];
      v39 = [v38 altDSID];
      [(AKOwnerProxyClient *)v37 storeAuthorization:v17 withAltDSID:v39 forClient:v47];
    }

    NSUInteger v45 = v48;
    (*((void (**)(id, id, void))v48 + 2))(v48, v17, 0);
LABEL_32:

    goto LABEL_33;
  }
  accountManager = self->_accountManager;
  uint64_t v14 = [v10 altDSID];
  uint64_t v15 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v14 error:0];

  -[AKAccountManager setUserUnderage:forAccount:](self->_accountManager, "setUserUnderage:forAccount:", [v10 isUnderAgeOfMajority], v15);
  uint64_t v16 = self->_accountManager;
  id v53 = 0;
  LOBYTE(accountManager) = [(AKAccountManager *)v16 saveAccount:v15 error:&v53];
  id v17 = v53;
  if ((accountManager & 1) == 0)
  {
    uint64_t v18 = _AKLogSiwa();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10018ED04();
    }
  }
  if ([(AKClient *)self->_client hasSiwaUnderageEntitlementAccess])
  {

    goto LABEL_9;
  }
  id v19 = +[NSError ak_errorWithCode:-7076];
  NSUInteger v45 = v48;
  (*((void (**)(id, void, id))v48 + 2))(v48, 0, v19);
LABEL_33:
}

- (id)authorizationContextHelperWithContext:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AKSRPAuthorizationContextHelper alloc] initWithContext:v6];

  if (+[AKCDPFactory isWalrusEnabled])
  {
    [(AKSRPContextHelper *)v7 setWalrusEnabled:1];
    [(AKSRPContextHelper *)v7 setWalrusWebAccessEnabled:+[AKCDPFactory isWebAccessEnabled]];
  }
  [(AKSRPContextHelper *)v7 setClient:v5];

  return v7;
}

- (id)authorizationContextWithUserResponse:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 selectedRequest];
  id v9 = [objc_alloc((Class)AKAuthorizationContext) initWithRequest:v8];
  [v9 setAppProvidedContext:@"AuthorizationServices"];
  id v10 = [v8 altDSID];
  [v9 setAltDSID:v10];

  id v11 = [v7 bundleID];
  [v9 setClientID:v11];

  id v12 = [v7 teamID];
  [v9 setTeamID:v12];

  [v9 setRealUserVerificationData:self->_realUserVerificationResults];
  unsigned int v13 = [v7 hasInternalEntitledAccess];
  uint64_t v14 = _AKLogSiwa();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v7;
      unsigned int v25 = "Client do not have special access, so not overriding the context. Using the given client: %@";
      NSUInteger v26 = v14;
      uint32_t v27 = 12;
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Client has special access, populating context with overrides...", buf, 2u);
  }

  uint64_t v16 = [v8 appProvidedData];
  id v17 = [v16 copy];
  [v9 setAppProvidedData:v17];

  uint64_t v18 = [v8 clientID];

  if (v18)
  {
    id v19 = _AKLogSiwa();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Applying request client ID override", buf, 2u);
    }

    id v20 = [v8 clientID];
    [v9 setClientID:v20];
  }
  id v21 = [v8 teamID];

  if (v21)
  {
    unsigned int v22 = _AKLogSiwa();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Applying request team ID override", buf, 2u);
    }

    objc_super v23 = [v8 teamID];
    [v9 setTeamID:v23];
  }
  unsigned __int8 v24 = [v9 teamID];

  if (!v24)
  {
    uint64_t v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v25 = "Authorization is for an internal application without teamID";
      NSUInteger v26 = v14;
      uint32_t v27 = 2;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
LABEL_19:
  if ([v8 _clientAuthenticatedExternallyWithPassword])
  {
    id v28 = _AKLogSiwa();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Client has authenticated externally, populating authToken...", buf, 2u);
    }

    objc_msgSend(v9, "set_clientAuthenticatedExternallyWithPassword:", 1);
    unsigned int v29 = [v8 _externalAuthToken];
    objc_msgSend(v9, "set_externalAuthToken:", v29);
  }
  if ([v6 hasSelectedSharedAccountForLogin])
  {
    id v30 = _AKLogSiwa();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Client is using a shared account, populating share info...", buf, 2u);
    }

    objc_msgSend(v9, "set_isAuthorizingForSharedSIWAAccount:", 1);
    uint64_t v31 = [v6 loginChoice];
    uint64_t v32 = [v31 sharedAccount];
    uint64_t v33 = [v32 shareInfo];
    uint64_t v34 = [v33 groupID];

    sharedAccountsStorageController = self->_sharedAccountsStorageController;
    uint64_t v36 = [v31 sharedAccount];
    id v45 = 0;
    id v37 = [(AKSharedAccountsStorageController *)sharedAccountsStorageController shareTokenForAccount:v36 inGroup:v34 error:&v45];
    id v38 = v45;
    objc_msgSend(v9, "set_sharedSIWAAccountShareToken:", v37);

    v39 = [v31 sharedAccount];
    unsigned int v40 = [v39 shareInfo];
    unsigned int v41 = [v40 groupID];
    objc_msgSend(v9, "set_sharedSIWAAccountGroupID:", v41);

    if (v38)
    {
      id v42 = _AKLogSiwa();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10018EE40();
      }
    }
  }
  v43 = _AKLogSiwa();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_10018EDD8();
  }

  return v9;
}

- (void)_extractWebSessionAuthorizationFromResponse:(id)a3
{
  id v4 = a3;
  if ([v4 isFirstPartyApp])
  {
    id v5 = +[AKCDPFactory walrusStatusLiveValue];
    id v6 = [v5 captureCurrentValue];

    if ([v6 unsignedIntegerValue] == (id)1)
    {
      id v7 = [v4 serverProvidedData];
      id v8 = +[AKPCSAuthContext contextFromSRPServerResponseWithShorterTTL:v7];

      if (v8) {
        goto LABEL_13;
      }
    }
    accountManager = self->_accountManager;
    id v10 = [v4 altDSID];
    id v18 = 0;
    id v11 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v10 error:&v18];
    id v12 = v18;

    if (v12)
    {
      unsigned int v13 = _AKLogSiwa();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10018EEA8();
      }
    }
    id v14 = [(AKAccountManager *)self->_accountManager edpStateValueForAccount:v11];
    BOOL v15 = [v4 serverProvidedData];
    if (v11 && v14 == (id)1)
    {
      uint64_t v16 = +[AKPCSAuthContext contextFromSRPServerResponseWithShorterTTL:v15];
    }
    else
    {
      uint64_t v16 = +[AKPCSAuthContext contextFromSRPServerResponse:v15];
    }
    id v8 = v16;

    if (v8)
    {
LABEL_13:
      id v17 = +[AKWebSessionPCSKeyProvider sharedInstance];
      [v17 saveContext:v8 completion:&stru_10022AB08];
    }
    else
    {
      id v8 = _AKLogSiwa();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10018EE74();
      }
    }
  }
}

- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018EF78();
  }

  client = self->_client;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A8124;
  v16[3] = &unk_100228DD8;
  id v10 = v7;
  id v17 = v10;
  id v11 = [(AKClient *)client proxyWithErrorHandler:v16];
  id v12 = v11;
  if (v11)
  {
    [v11 presentAuthorizationUIForContext:v6 completion:v10];
  }
  else
  {
    unsigned int v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client proxy object to present UI is not created", v15, 2u);
    }

    id v14 = +[NSError ak_errorWithCode:-7061];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if (!self->_originalRequestContext) {
    objc_storeStrong((id *)&self->_originalRequestContext, a3);
  }
  id v12 = _AKLogSiwa();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    int v18 = 138412290;
    id v19 = client;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client before perform authorization for user info execution %@", (uint8_t *)&v18, 0xCu);
  }

  unsigned int v14 = [(AKClient *)self->_client hasOwnerAccess];
  BOOL v15 = _AKLogSiwa();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client owner detected", (uint8_t *)&v18, 2u);
    }

    id v17 = [(AKAuthorizationDaemonService *)self _clientForContext:v9];
    [(AKAuthorizationDaemonService *)self _validateAndProcessUserResponse:v10 client:v17 completion:v11];
  }
  else
  {
    if (v16)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client doesn't have owner access, operation not permitted", (uint8_t *)&v18, 2u);
    }

    id v17 = +[NSError ak_errorWithCode:-7026];
    v11[2](v11, 0, v17);
  }
}

- (void)_validateAndProcessUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [AKCATiburonRequestAttemptReporter alloc];
  id v12 = [v8 selectedRequest];
  unsigned int v13 = [v12 requestIdentifier];
  unsigned int v14 = [v13 UUIDString];
  BOOL v15 = [(AKCATiburonRequestAttemptReporter *)v11 initWithRequestID:v14];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A85AC;
  v24[3] = &unk_10022AB30;
  BOOL v16 = v15;
  unsigned int v25 = v16;
  id v17 = v10;
  id v26 = v17;
  int v18 = objc_retainBlock(v24);
  id v23 = 0;
  unsigned int v19 = +[AKAuthorizationValidator shouldContinueWithResponse:v8 error:&v23];
  id v20 = v23;
  id v21 = _AKLogSiwa();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10018F008();
  }

  if (v19)
  {
    [(AKAuthorizationDaemonService *)self _processUserResponse:v8 client:v9 completion:v18];
  }
  else if (v20)
  {
    ((void (*)(void *, void, id))v18[2])(v18, 0, v20);
  }
  else
  {
    unsigned int v22 = +[NSError ak_errorWithCode:-7062];
    ((void (*)(void *, void, void *))v18[2])(v18, 0, v22);
  }
}

- (void)_processUserResponse:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationDaemonServiceWillProcessUserResponse:self];
  }
  id v12 = +[AKFeatureManager sharedManager];
  unsigned int v13 = [v12 isTiburonU13Enabled];

  unsigned int v14 = [v8 selectedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v16 = _AKLogSiwa();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = 138412546;
      id v45 = v8;
      __int16 v46 = 2112;
      id v47 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Got a response from user: %@ and client: %@", (uint8_t *)&v44, 0x16u);
    }

    [(AKAuthorizationDaemonService *)self _safePerformSRPWithUserResponse:v8 client:v9 completion:v10];
    goto LABEL_23;
  }
  id v17 = [v8 selectedRequest];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    if (([v8 requestParentalPermission] & v13) == 1)
    {
      [(AKAuthorizationDaemonService *)self _sendPermissionRequestWithCompletion:v10];
      goto LABEL_23;
    }
    uint64_t v34 = _AKLogSiwa();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10018F108();
    }

    uint64_t v35 = -7012;
LABEL_22:
    v43 = +[NSError ak_errorWithCode:v35];
    v10[2](v10, 0, v43);

    goto LABEL_23;
  }
  unsigned int v19 = _AKLogSiwa();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v44) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Detected password request", (uint8_t *)&v44, 2u);
  }

  id v20 = [v8 loginChoice];

  id v21 = _AKLogSiwa();
  unsigned int v22 = v21;
  if (!v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F098(v22, v36, v37, v38, v39, v40, v41, v42);
    }

    uint64_t v35 = -7044;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v8 userSelection];
    int v44 = 138412802;
    id v45 = v8;
    __int16 v46 = 2112;
    id v47 = v23;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Got a response from user: %@, userSelection: %@ and client: %@", (uint8_t *)&v44, 0x20u);
  }
  id v24 = objc_alloc_init((Class)AKAuthorization);
  unsigned int v25 = [v8 loginChoiceIndex];
  uint64_t v26 = (int)[v25 intValue];

  id v27 = objc_alloc((Class)AKPasswordCredential);
  id v28 = [(NSArray *)self->_safariPasswordCredentials objectAtIndexedSubscript:v26];
  unsigned int v29 = [v28 user];
  id v30 = [(NSArray *)self->_safariPasswordCredentials objectAtIndexedSubscript:v26];
  uint64_t v31 = [v30 password];
  id v32 = [v27 initWithUser:v29 password:v31];
  [v24 setCredential:v32];

  uint64_t v33 = [v8 selectedRequest];
  [v24 setAuthorizedRequest:v33];

  ((void (**)(id, id, void *))v10)[2](v10, v24, 0);
LABEL_23:
}

- (void)beginAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (![(AKAuthorizationDaemonService *)self _verifyEntitlementsForRequest:v6])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F1A4();
    }
    goto LABEL_14;
  }
  if (![(AKClient *)self->_client isPermittedToProxyAuthorizationBundleIdentifier])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F170();
    }
LABEL_14:

    uint64_t v22 = -7026;
LABEL_15:
    id v20 = +[NSError ak_errorWithCode:v22];
    v7[2](v7, 0, v20);
    goto LABEL_16;
  }
  uint64_t v8 = [v6 _proxiedClientBundleID];
  if (!v8
    || (id v9 = (void *)v8,
        [v6 _proxiedClientTeamID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    id v23 = _AKLogSiwa();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10018F13C();
    }

    uint64_t v22 = -7044;
    goto LABEL_15;
  }
  id v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 _proxiedClientBundleID];
    *(_DWORD *)buf = 138412290;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "beginAuthorization - Proxied bundle detected (%@), proxying...", buf, 0xCu);
  }
  objc_msgSend(v6, "set_clientShouldAuthenticateExternally:", 1);
  unsigned int v13 = [AKOwnerProxyClient alloc];
  unsigned int v14 = [(AKClient *)self->_client xpcConnection];
  BOOL v15 = [(AKOwnerProxyClient *)v13 initWithCredentialRequest:v6 connection:v14];
  client = self->_client;
  self->_client = v15;

  id v17 = _AKLogSiwa();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "beginAuthorization - Requesting clearance to authorize with context %@...", buf, 0xCu);
  }

  authSessionManager = self->_authSessionManager;
  unsigned int v19 = self->_client;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A8D78;
  v24[3] = &unk_100228BD0;
  id v25 = v6;
  uint64_t v26 = self;
  id v27 = v7;
  [(AKAuthorizationSessionManager *)authSessionManager beginSessionWithContext:v25 client:v19 completion:v24];

  id v20 = v25;
LABEL_16:
}

- (void)continueAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (![(AKAuthorizationDaemonService *)self _verifyEntitlementsForRequest:v6])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F3B8();
    }
    goto LABEL_13;
  }
  if (![(AKClient *)self->_client isPermittedToProxyAuthorizationBundleIdentifier])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F384();
    }
LABEL_13:

    uint64_t v22 = -7026;
LABEL_17:
    id v20 = +[NSError ak_errorWithCode:v22];
    v7[2](v7, 0, v20);
    goto LABEL_18;
  }
  uint64_t v8 = [v6 _proxiedClientBundleID];
  if (!v8
    || (id v9 = (void *)v8,
        [v6 _proxiedClientTeamID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    id v23 = _AKLogSiwa();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10018F31C();
    }
    goto LABEL_16;
  }
  id v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 _proxiedClientBundleID];
    *(_DWORD *)buf = 138412290;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "continueAuthorization - Proxied bundle detected (%@), proxying...", buf, 0xCu);
  }
  objc_msgSend(v6, "set_clientShouldAuthenticateExternally:", 1);
  unsigned int v13 = [AKOwnerProxyClient alloc];
  unsigned int v14 = [(AKClient *)self->_client xpcConnection];
  BOOL v15 = [(AKOwnerProxyClient *)v13 initWithCredentialRequest:v6 connection:v14];
  client = self->_client;
  self->_client = v15;

  id v17 = [v6 _continuationRequestIdentifier];

  if (!v17)
  {
    id v23 = _AKLogSiwa();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10018F350();
    }
LABEL_16:

    uint64_t v22 = -7044;
    goto LABEL_17;
  }
  objc_msgSend(v6, "set_clientShouldAuthenticateExternally:", 1);
  authSessionManager = self->_authSessionManager;
  unsigned int v19 = self->_client;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A94BC;
  v24[3] = &unk_10022AB80;
  id v25 = v6;
  uint64_t v26 = self;
  id v27 = v7;
  [(AKAuthorizationSessionManager *)authSessionManager continueSessionWithContext:v25 client:v19 completion:v24];

  id v20 = v25;
LABEL_18:
}

- (void)cancelAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cancelAuthorization with context - %@", buf, 0xCu);
  }

  if (![(AKAuthorizationDaemonService *)self _verifyEntitlementsForRequest:v6])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F69C();
    }
    goto LABEL_14;
  }
  if (![(AKClient *)self->_client isPermittedToProxyAuthorizationBundleIdentifier])
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018F668();
    }
LABEL_14:

    uint64_t v22 = -7026;
LABEL_15:
    id v20 = +[NSError ak_errorWithCode:v22];
    v7[2](v7, v20);
    goto LABEL_16;
  }
  uint64_t v9 = [v6 _proxiedClientBundleID];
  if (!v9
    || (id v10 = (void *)v9,
        [v6 _proxiedClientTeamID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    id v23 = _AKLogSiwa();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10018F634();
    }

    uint64_t v22 = -7044;
    goto LABEL_15;
  }
  id v12 = _AKLogSiwa();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v6 _proxiedClientBundleID];
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "cancelAuthorization - Proxied bundle detected (%@), proxying...", buf, 0xCu);
  }
  unsigned int v14 = [AKOwnerProxyClient alloc];
  BOOL v15 = [(AKClient *)self->_client xpcConnection];
  BOOL v16 = [(AKOwnerProxyClient *)v14 initWithCredentialRequest:v6 connection:v15];
  client = self->_client;
  self->_client = v16;

  authSessionManager = self->_authSessionManager;
  unsigned int v19 = self->_client;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A9DA0;
  v24[3] = &unk_100228DD8;
  id v25 = v7;
  [(AKAuthorizationSessionManager *)authSessionManager endSessionWithContext:v6 client:v19 completion:v24];
  id v20 = v25;
LABEL_16:
}

- (void)_sendPermissionRequestWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending permission request", v5, 2u);
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (id)_accountDisplayNameWithPresentationContext:(id)a3
{
  id v3 = +[AKAccountManager sharedInstance];
  id v4 = [v3 primaryiCloudAccount];
  id v5 = objc_alloc_init((Class)NSPersonNameComponents);
  id v6 = [v3 givenNameForAccount:v4];
  [v5 setGivenName:v6];

  id v7 = [v3 familyNameForAccount:v4];
  [v5 setFamilyName:v7];

  uint64_t v8 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v5 style:0 options:0];

  return v8;
}

- (AKClient)client
{
  return self->_client;
}

- (AKAuthorizationDaemonServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationDaemonServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationRapportClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (AKAuthorizationEndorserRapportDiscovery)endorserRapportDiscovery
{
  return self->_endorserRapportDiscovery;
}

- (void)setEndorserRapportDiscovery:(id)a3
{
}

- (NSArray)safariPasswordCredentials
{
  return self->_safariPasswordCredentials;
}

- (void)setSafariPasswordCredentials:(id)a3
{
}

- (AKCredentialRequestContext)originalRequestContext
{
  return self->_originalRequestContext;
}

- (void)setOriginalRequestContext:(id)a3
{
}

- (AKAuthorizationStoreManager)localAccountsStorageController
{
  return self->_localAccountsStorageController;
}

- (void)setLocalAccountsStorageController:(id)a3
{
}

- (AKSharedAccountsStorageController)sharedAccountsStorageController
{
  return self->_sharedAccountsStorageController;
}

- (void)setSharedAccountsStorageController:(id)a3
{
}

- (NSArray)sharedAccounts
{
  return self->_sharedAccounts;
}

- (void)setSharedAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAccounts, 0);
  objc_storeStrong((id *)&self->_sharedAccountsStorageController, 0);
  objc_storeStrong((id *)&self->_localAccountsStorageController, 0);
  objc_storeStrong((id *)&self->_originalRequestContext, 0);
  objc_storeStrong((id *)&self->_safariPasswordCredentials, 0);
  objc_storeStrong((id *)&self->_endorserRapportDiscovery, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_realUserVerificationResults, 0);
  objc_storeStrong((id *)&self->_authSessionManager, 0);

  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end