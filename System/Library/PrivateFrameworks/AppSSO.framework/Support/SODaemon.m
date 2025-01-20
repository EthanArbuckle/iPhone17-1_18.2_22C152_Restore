@interface SODaemon
+ (id)_processRequestBlock;
- (BOOL)_doAKshouldProcessURL:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SODaemon)initWithXPCConnection:(id)a3;
- (id)invalidationHandler;
- (void)_doGetAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)_doPerformAuthorizationWithRequestParameters:(id)a3 profile:(id)a4 completion:(id)a5;
- (void)_extensionCleanup;
- (void)_performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)_updateCallerPropertiesFromAuditTokenInParameters:(id)a3;
- (void)_updateUsageOfInternalExtensionsInParameters:(id)a3;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)beginAuthorizationWithCompletion:(id)a3;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)cancelAuthorization:(id)a3 completion:(id)a4;
- (void)configurationWithCompletion:(id)a3;
- (void)connectionInvalidated;
- (void)debugHintsWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4;
- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)realmsWithCompletion:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation SODaemon

- (SODaemon)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SODaemon initWithXPCConnection:]";
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SODaemon;
  v6 = [(SODaemon *)&v8 init];
  if (v6)
  {
    if (qword_100016188 != -1) {
      dispatch_once(&qword_100016188, &stru_100010568);
    }
    objc_storeWeak((id *)&v6->_xpcConnection, v4);
  }

  return v6;
}

- (void)configurationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SODaemon configurationWithCompletion:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = +[SOConfigurationHost defaultManager];
  id v9 = 0;
  v7 = [v6 configurationForClientWithError:&v9];
  id v8 = v9;

  if (v4) {
    v4[2](v4, v7, v8);
  }
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

+ (id)_processRequestBlock
{
  return &stru_1000105A8;
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = sub_1000030E4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136316163;
    __int16 v12 = "-[SODaemon getAuthorizationHintsWithURL:responseCode:completion:]";
    __int16 v13 = 2160;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2117;
    id v16 = v8;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 2112;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s url: %{sensitive, mask.hash}@, responseCode: %d on %@", (uint8_t *)&v11, 0x30u);
  }

  [(SODaemon *)self _doGetAuthorizationHintsWithURL:v8 responseCode:a4 completion:v9];
}

- (void)_doGetAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, uint64_t))a5;
  unsigned int v10 = [(SODaemon *)self _doAKshouldProcessURL:v8];
  if (v10)
  {
    int v11 = +[SOExtensionManager sharedInstance];
    __int16 v12 = [v11 loadedInternalExtension];
  }
  else
  {
    __int16 v13 = +[SOConfigurationHost defaultManager];
    int v11 = [v13 profileForURL:v8 responseCode:a4];

    if (!v11)
    {
      if (!v9)
      {
LABEL_17:
        __int16 v12 = 0;
        goto LABEL_18;
      }
      uint64_t v23 = [sub_10000685C() invalidURLError:v8];
LABEL_16:
      v24 = (void *)v23;
      v9[2](v9, 0, v23);

      goto LABEL_17;
    }
    uint64_t v14 = +[SOExtensionManager sharedInstance];
    __int16 v15 = [v11 extensionBundleIdentifier];
    __int16 v12 = [v14 loadedExtensionWithBundleIdentifer:v15];
  }
  if (!v9) {
    goto LABEL_18;
  }
  if (!v12)
  {
    id v21 = sub_10000685C();
    if (v10) {
      CFStringRef v22 = @"No AppSSO IdP extension found (internal extension)";
    }
    else {
      CFStringRef v22 = @"No AppSSO IdP extension found";
    }
    uint64_t v23 = [v21 internalErrorWithMessage:v22];
    goto LABEL_16;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v16 = (void *)qword_1000161B8;
  uint64_t v29 = qword_1000161B8;
  if (!qword_1000161B8)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100009CA8;
    v25[3] = &unk_100010378;
    v25[4] = &v26;
    sub_100009CA8((uint64_t)v25);
    id v16 = (void *)v27[3];
  }
  __int16 v17 = v16;
  _Block_object_dispose(&v26, 8);
  id v18 = [v17 alloc];
  __int16 v19 = [v12 localizedExtensionDisplayName];
  id v20 = [v18 initWithLocalizedExtensionBundleDisplayName:v19];

  ((void (**)(id, id, uint64_t))v9)[2](v9, v20, 0);
LABEL_18:
}

- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[SODaemon performAuthorizationWithRequestParameters:completion:]";
    __int16 v51 = 2114;
    id v52 = v6;
    __int16 v53 = 2112;
    v54 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  id v9 = [objc_alloc((Class)SOAuthorizationRequestParameters) initWithAuthorizationRequestParametersCore:v6];
  [(SODaemon *)self _updateUsageOfInternalExtensionsInParameters:v9];
  [(SODaemon *)self _updateCallerPropertiesFromAuditTokenInParameters:v9];
  unsigned int v10 = [v9 authorizationOptions];
  int v11 = [v10 objectForKeyedSubscript:SOAuthorizationOptionRemovedProfileExtensionBundleIdentifier];

  if ([v9 useInternalExtensions])
  {
    __int16 v12 = +[SOExtensionManager internalExtensionBundleIdentifier];
    requestQueueIdentifier = self->_requestQueueIdentifier;
    self->_requestQueueIdentifier = v12;
  }
  else if ([v11 length])
  {
    objc_storeStrong((id *)&self->_requestQueueIdentifier, v11);
  }
  else
  {
    v32 = +[SOConfigurationHost defaultManager];
    v33 = [v9 url];
    objc_msgSend(v32, "profileForURL:responseCode:", v33, objc_msgSend(v9, "responseCode"));
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      if (!v7) {
        goto LABEL_43;
      }
      id v43 = sub_10000685C();
      uint64_t v29 = [v9 url];
      v44 = [v43 invalidURLError:v29];
      v7[2](v7, 0, v44);

      goto LABEL_42;
    }
    v34 = [v26 extensionBundleIdentifier];
    v35 = self->_requestQueueIdentifier;
    self->_requestQueueIdentifier = v34;

    if (![(NSString *)self->_requestQueueIdentifier length])
    {
      if (!v7) {
        goto LABEL_43;
      }
      uint64_t v42 = [sub_10000685C() parameterErrorWithMessage:@"profile has no extension bundle identifier"];
      goto LABEL_41;
    }
  }
  uint64_t v14 = [v9 requestedOperation];
  unsigned int v15 = [v14 isEqualToString:SOAuthorizationOperationFetchNetworkCredentials];

  if (!v15
    || (id v16 = sub_100006F60(),
        id v17 = objc_loadWeakRetained((id *)&self->_xpcConnection),
        LOBYTE(v16) = [v16 checkEntitlementFromXPC:v17 entitlement:@"com.apple.private.AppSSO.FetchNetworkCredentials"], v17, (v16 & 1) != 0))
  {
    if ([v11 length] || (objc_msgSend(v9, "useInternalExtensions") & 1) != 0)
    {
LABEL_11:
      uint64_t v18 = [v9 impersonationBundleIdentifier];
      if (!v18
        || (__int16 v19 = (void *)v18,
            id v20 = sub_100006F60(),
            id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection),
            LOBYTE(v20) = [v20 checkEntitlementFromXPC:WeakRetained entitlement:@"com.apple.private.network.socket-delegate"], WeakRetained, v19, (v20 & 1) != 0))
      {
        CFStringRef v22 = +[SOExtensionManager sharedInstance];
        uint64_t v23 = [v22 loadedExtensionWithBundleIdentifer:self->_requestQueueIdentifier];
        id v24 = [v23 extensionRequestsMode];

        v25 = sub_1000030E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_10000A564((uint64_t)&self->_requestQueueIdentifier, (uint64_t)v24);
        }

        if (v24 == (id)2)
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_100007044;
          v47[3] = &unk_100010620;
          v48 = v7;
          [(SODaemon *)self _performAuthorizationWithRequestParameters:v9 completion:v47];
          id v26 = v48;
LABEL_43:

          goto LABEL_44;
        }
        id v26 = [objc_alloc((Class)SORequestQueueItem) initWithService:self requestParameters:v9 completionBlock:v7];
        uint64_t v29 = +[SORequestQueue requestQueueWithIdentifier:self->_requestQueueIdentifier];
        v30 = [v29 processItemBlock];

        if (!v30)
        {
          v31 = +[SODaemon _processRequestBlock];
          [v29 setProcessItemBlock:v31];
        }
        [v29 enqueueRequest:v26];
LABEL_42:

        goto LABEL_43;
      }
      if (v7)
      {
        id v27 = sub_10000685C();
        CFStringRef v28 = @"com.apple.private.network.socket-delegate";
        goto LABEL_27;
      }
      goto LABEL_44;
    }
    v36 = +[SOConfigurationHost defaultManager];
    v37 = [v9 url];
    id v38 = [v9 responseCode];
    v39 = [v9 callerBundleIdentifier];
    id v40 = [v36 willHandleURL:v37 responseCode:v38 callerBundleIdentifier:v39];

    if (v40 == (id)3)
    {
      if (!v7) {
        goto LABEL_44;
      }
      id v45 = sub_10000685C();
      id v26 = [v9 callerBundleIdentifier];
      uint64_t v42 = [v45 deniedBundleIdentifier:v26];
    }
    else if (v40 == (id)2)
    {
      if (!v7) {
        goto LABEL_44;
      }
      id v46 = sub_10000685C();
      id v26 = [v9 callerBundleIdentifier];
      uint64_t v42 = [v46 doNotHandleBreakingRecursionWithCallerBundleIdentifier:v26];
    }
    else
    {
      if (v40 != (id)1) {
        goto LABEL_11;
      }
      if (!v7) {
        goto LABEL_44;
      }
      id v41 = sub_10000685C();
      id v26 = [v9 url];
      uint64_t v42 = [v41 invalidURLError:v26];
    }
LABEL_41:
    uint64_t v29 = (void *)v42;
    v7[2](v7, 0, (void *)v42);
    goto LABEL_42;
  }
  if (v7)
  {
    id v27 = sub_10000685C();
    CFStringRef v28 = @"com.apple.private.AppSSO.FetchNetworkCredentials";
LABEL_27:
    id v26 = [v27 missingEntitlementError:v28];
    v7[2](v7, 0, v26);
    goto LABEL_43;
  }
LABEL_44:
}

- (void)_performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315394;
    v25 = "-[SODaemon _performAuthorizationWithRequestParameters:completion:]";
    __int16 v26 = 2112;
    id v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v24, 0x16u);
  }

  if ([v6 useInternalExtensions])
  {
    id v9 = 0;
LABEL_12:
    [(SODaemon *)self _doPerformAuthorizationWithRequestParameters:v6 profile:v9 completion:v7];
    __int16 v12 = v9;
    goto LABEL_13;
  }
  unsigned int v10 = [v6 authorizationOptions];
  uint64_t v11 = SOAuthorizationOptionRemovedProfileExtensionBundleIdentifier;
  __int16 v12 = [v10 objectForKeyedSubscript:SOAuthorizationOptionRemovedProfileExtensionBundleIdentifier];

  if (v12)
  {
    __int16 v13 = [v6 authorizationOptions];
    id v14 = [v13 mutableCopy];

    [v14 removeObjectForKey:v11];
    [v6 setAuthorizationOptions:v14];
  }
  id v15 = [v12 length];
  id v16 = +[SOConfigurationHost defaultManager];
  id v17 = v16;
  if (v15)
  {
    id v9 = [v16 removedProfileForExtensionBundleIdentifier:v12];
  }
  else
  {
    uint64_t v18 = [v6 url];
    id v9 = objc_msgSend(v17, "profileForURL:responseCode:", v18, objc_msgSend(v6, "responseCode"));
  }
  if (v9)
  {
    __int16 v19 = [v9 extensionData];
    [v6 setExtensionData:v19];

    id v20 = [v9 realm];
    [v6 setRealm:v20];

    goto LABEL_12;
  }
  if (v7)
  {
    id v21 = sub_10000685C();
    CFStringRef v22 = [v6 url];
    uint64_t v23 = [v21 invalidURLError:v22];
    v7[2](v7, 0, v23);
  }
LABEL_13:
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = 136315650;
    id v45 = "-[SODaemon beginAuthorizationWithRequestParameters:completion:]";
    __int16 v46 = 2112;
    id v47 = v6;
    __int16 v48 = 2112;
    v49 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@ on %@", (uint8_t *)&v44, 0x20u);
  }

  id v9 = [objc_alloc((Class)SOAuthorizationRequestParameters) initWithAuthorizationRequestParametersCore:v6];
  [(SODaemon *)self _updateUsageOfInternalExtensionsInParameters:v9];
  [(SODaemon *)self _updateCallerPropertiesFromAuditTokenInParameters:v9];
  unsigned int v10 = [v9 requestedOperation];
  unsigned int v11 = [v10 isEqualToString:SOAuthorizationOperationFetchNetworkCredentials];

  if (v11)
  {
    id v12 = sub_100006F60();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    LOBYTE(v12) = [v12 checkEntitlementFromXPC:WeakRetained entitlement:@"com.apple.private.AppSSO.FetchNetworkCredentials"];

    if ((v12 & 1) == 0)
    {
      if (v7)
      {
        CFStringRef v22 = [sub_10000685C() missingEntitlementError:@"com.apple.private.AppSSO.FetchNetworkCredentials"];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v22);
LABEL_34:
        id v15 = 0;
        id v16 = 0;
        goto LABEL_35;
      }
      goto LABEL_36;
    }
  }
  if (([v9 useInternalExtensions] & 1) == 0)
  {
    id v17 = +[SOConfigurationHost defaultManager];
    uint64_t v18 = [v9 url];
    id v19 = [v9 responseCode];
    id v20 = [v9 callerBundleIdentifier];
    id v21 = [v17 willHandleURL:v18 responseCode:v19 callerBundleIdentifier:v20];

    if (v21 == (id)3)
    {
      if (v7)
      {
        id v41 = sub_10000685C();
        CFStringRef v22 = [v9 callerBundleIdentifier];
        uint64_t v40 = [v41 deniedBundleIdentifier:v22];
        goto LABEL_33;
      }
LABEL_36:
      id v15 = 0;
      id v16 = 0;
      goto LABEL_37;
    }
    if (v21 == (id)2)
    {
      if (v7)
      {
        id v42 = sub_10000685C();
        CFStringRef v22 = [v9 callerBundleIdentifier];
        uint64_t v40 = [v42 doNotHandleBreakingRecursionWithCallerBundleIdentifier:v22];
        goto LABEL_33;
      }
      goto LABEL_36;
    }
    if (v21 == (id)1) {
      goto LABEL_25;
    }
  }
  if ([v9 useInternalExtensions])
  {
    id v14 = +[SOExtensionManager sharedInstance];
    id v15 = [v14 loadedInternalExtension];
    id v16 = 0;
    goto LABEL_16;
  }
  uint64_t v23 = +[SOConfigurationHost defaultManager];
  int v24 = [v9 url];
  id v16 = objc_msgSend(v23, "profileForURL:responseCode:", v24, objc_msgSend(v9, "responseCode"));

  if (!v16)
  {
LABEL_25:
    if (v7)
    {
      id v39 = sub_10000685C();
      CFStringRef v22 = [v9 url];
      uint64_t v40 = [v39 invalidURLError:v22];
LABEL_33:
      id v43 = (void *)v40;
      (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0, 0, v40);

      goto LABEL_34;
    }
    goto LABEL_36;
  }
  id v14 = +[SOExtensionManager sharedInstance];
  v25 = [v16 extensionBundleIdentifier];
  id v15 = [v14 loadedExtensionWithBundleIdentifer:v25];

LABEL_16:
  __int16 v26 = sub_1000030E4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v15 localizedExtensionDisplayName];
    int v44 = 138543362;
    id v45 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "loadedExtensionWithBundleIdentifer: extension = %{public}@", (uint8_t *)&v44, 0xCu);
  }
  if (!v15)
  {
    if (!v7)
    {
      id v15 = 0;
      goto LABEL_37;
    }
    CFStringRef v22 = [sub_10000685C() internalErrorWithMessage:@"No AppSSO IdP extension found"];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v22);
    id v15 = 0;
    goto LABEL_35;
  }
  uint64_t v28 = [v9 impersonationBundleIdentifier];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    id v30 = sub_100006F60();
    id v31 = objc_loadWeakRetained((id *)&self->_xpcConnection);
    LOBYTE(v30) = [v30 checkEntitlementFromXPC:v31 entitlement:@"com.apple.private.network.socket-delegate"];

    if ((v30 & 1) == 0)
    {
      if (!v7) {
        goto LABEL_37;
      }
      CFStringRef v22 = [sub_10000685C() missingEntitlementError:@"com.apple.private.network.socket-delegate"];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v22);
      goto LABEL_35;
    }
  }
  objc_storeStrong((id *)&self->_requestParameters, v9);
  v32 = [v16 extensionData];
  [(SOAuthorizationRequestParameters *)self->_requestParameters setExtensionData:v32];

  v33 = [v16 realm];
  [(SOAuthorizationRequestParameters *)self->_requestParameters setRealm:v33];

  v34 = +[NSXPCListener anonymousListener];
  p_extensionXpcListener = &self->_extensionXpcListener;
  extensionXpcListener = self->_extensionXpcListener;
  self->_extensionXpcListener = v34;

  [(NSXPCListener *)self->_extensionXpcListener setDelegate:self];
  [(NSXPCListener *)self->_extensionXpcListener resume];
  v37 = sub_1000030E4();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_10000A610(v15, (id *)p_extensionXpcListener);
  }

  if (v7)
  {
    CFStringRef v22 = [v15 extensionBundleIdentifier];
    id v38 = [(NSXPCListener *)*p_extensionXpcListener endpoint];
    (*((void (**)(id, void *, void *, void))v7 + 2))(v7, v22, v38, 0);

LABEL_35:
  }
LABEL_37:
}

- (void)_doPerformAuthorizationWithRequestParameters:(id)a3 profile:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_retainBlock(v10);
  id authenticateCompletion = self->_authenticateCompletion;
  self->_id authenticateCompletion = v11;

  if ([v8 isUserInteractionEnabled])
  {
    __int16 v13 = (SODaemonUIManager *)objc_opt_new();
    daemonUIManager = self->_daemonUIManager;
    self->_daemonUIManager = v13;

    [(SODaemonUIManager *)self->_daemonUIManager setDelegate:self];
    id v15 = self->_daemonUIManager;
    id v31 = 0;
    unsigned __int8 v16 = [(SODaemonUIManager *)v15 beginAuthorizationWithRequestParameters:v8 profile:v9 error:&v31];
    id v17 = v31;
    if ((v16 & 1) == 0)
    {
      id v18 = self->_authenticateCompletion;
      self->_id authenticateCompletion = 0;

      if (v10) {
        (*((void (**)(id, void, id))v10 + 2))(v10, 0, v17);
      }
    }
    goto LABEL_13;
  }
  unsigned int v19 = [v8 useInternalExtensions];
  id v20 = +[SOExtensionManager sharedInstance];
  id v21 = v20;
  if (v19)
  {
    CFStringRef v22 = [v20 loadInternalExtension];
    extension = self->_extension;
    self->_extension = v22;
  }
  else
  {
    extension = [v9 extensionBundleIdentifier];
    int v24 = [v21 loadExtensionWithBundleIdentifier:extension];
    v25 = self->_extension;
    self->_extension = v24;
  }
  __int16 v26 = sub_1000030E4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [(SOExtension *)self->_extension localizedExtensionDisplayName];
    *(_DWORD *)buf = 138543362;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "loadedExtensionWithBundleIdentifer: extension = %{public}@", buf, 0xCu);
  }
  uint64_t v28 = self->_extension;
  id v17 = [v8 identifier];
  if (!v28)
  {
    id v30 = [sub_10000685C() internalErrorWithMessage:@"No active AppSSO IdP extension"];
    [(SODaemon *)self authorization:v17 didCompleteWithCredential:0 error:v30];

LABEL_13:
    goto LABEL_14;
  }
  [(SOExtension *)v28 saveDelegate:self forRequestIdentifier:v17];

  uint64_t v29 = self->_extension;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100007BD8;
  v32[3] = &unk_100010648;
  v32[4] = self;
  id v33 = v8;
  [(SOExtension *)v29 setupNonUISessionWithCompletion:v32];

LABEL_14:
}

- (BOOL)_doAKshouldProcessURL:(id)a3
{
  id v4 = a3;
  if (v4) {
    unsigned int v5 = +[AKAuthorizationController shouldProcessURL:v4];
  }
  else {
    unsigned int v5 = 0;
  }
  id v6 = sub_1000030E4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v10 = "-[SODaemon _doAKshouldProcessURL:]";
    __int16 v11 = 2160;
    CFStringRef v8 = @"NO";
    uint64_t v12 = 1752392040;
    __int16 v13 = 2117;
    int v9 = 136316163;
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    id v14 = v4;
    __int16 v15 = 2112;
    CFStringRef v16 = v8;
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s URL = %{sensitive, mask.hash}@, result = %@ on %@", (uint8_t *)&v9, 0x34u);
  }

  return v5;
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[SODaemon cancelAuthorization:completion:]";
    __int16 v21 = 2112;
    CFStringRef v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extension = self->_extension;
  if (extension)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000081AC;
    v16[3] = &unk_100010670;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(SOExtension *)extension cancelAuthorization:v17 completion:v16];
  }
  else
  {
    daemonUIManager = self->_daemonUIManager;
    id v15 = 0;
    BOOL v11 = [(SODaemonUIManager *)daemonUIManager cancelAuthorization:v6 error:&v15];
    id v12 = v15;
    if (!v11 && self->_requestQueueIdentifier)
    {
      __int16 v13 = +[SORequestQueue requestQueueWithIdentifier:](SORequestQueue, "requestQueueWithIdentifier:");
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100008214;
      v14[3] = &unk_100010698;
      v14[4] = self;
      [v13 removeRequestWithIdentifier:v6 block:v14];
    }
    if (v7) {
      (*((void (**)(id, BOOL, id))v7 + 2))(v7, v11, v12);
    }
  }
}

- (void)realmsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  unsigned int v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[SODaemon realmsWithCompletion:]";
    __int16 v10 = 2112;
    BOOL v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = +[SOConfigurationHost defaultManager];
  id v7 = [v6 realms];

  if (v4) {
    v4[2](v4, v7, 0);
  }
}

- (void)debugHintsWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[SODaemon debugHintsWithCompletion:]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = +[SODebugHints sharedInstance];
  [v6 debugHintsWithCompletion:v4];
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    requestQueueIdentifier = self->_requestQueueIdentifier;
    extension = self->_extension;
    *(_DWORD *)buf = 136315906;
    id v30 = "-[SODaemon finishAuthorization:completion:]";
    __int16 v31 = 2114;
    v32 = extension;
    __int16 v33 = 2114;
    v34 = requestQueueIdentifier;
    __int16 v35 = 2112;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@, queue = %{public}@ on %@", buf, 0x2Au);
  }

  [(SOExtension *)self->_extension removeDelegateForRequestIdentifier:v6];
  if (self->_requestQueueIdentifier)
  {
    BOOL v11 = +[SORequestQueue requestQueueWithIdentifier:](SORequestQueue, "requestQueueWithIdentifier:");
  }
  else
  {
    BOOL v11 = 0;
  }
  daemonUIManager = self->_extension;
  if (daemonUIManager)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000086D0;
    v26[3] = &unk_1000106C0;
    __int16 v13 = (id *)v27;
    v27[0] = v11;
    v27[1] = self;
    id v14 = &v28;
    id v28 = v7;
    id v15 = v7;
    id v16 = v11;
    id v17 = (void ***)v26;
  }
  else
  {
    daemonUIManager = self->_daemonUIManager;
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    CFStringRef v22 = sub_10000878C;
    uint64_t v23 = &unk_1000106C0;
    __int16 v13 = (id *)v24;
    v24[0] = v11;
    v24[1] = self;
    id v14 = &v25;
    id v25 = v7;
    id v18 = v7;
    id v19 = v11;
    id v17 = &v20;
  }
  objc_msgSend(daemonUIManager, "finishAuthorization:completion:", v6, v17, v20, v21, v22, v23);
}

- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  id v7 = sub_1000030E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v19 = 136315394;
    *(void *)&v19[4] = "-[SODaemon isExtensionProcessWithAuditToken:completion:]";
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", v19, 0x16u);
  }

  id v8 = sub_100006F60();
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)id v19 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v19[16] = v9;
  unsigned int v10 = [v8 pidFromAuditToken:v19];
  id v11 = sub_100006F60();
  long long v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)id v19 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v19[16] = v12;
  __int16 v13 = [v11 bundleIdentifierFromAuditToken:v19];
  if (v13)
  {
    id v14 = +[SOExtensionManager sharedInstance];
    id v15 = [v14 loadedExtensionWithBundleIdentifer:v13];
    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  id v17 = sub_1000030E4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    *(_DWORD *)id v19 = 138478339;
    *(void *)&v19[4] = v13;
    if (v16) {
      CFStringRef v18 = @"YES";
    }
    *(_WORD *)&v19[12] = 1024;
    *(_DWORD *)&v19[14] = v10;
    *(_WORD *)&v19[18] = 2114;
    *(void *)&v19[20] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{private}@(%u) isExtensionProcess = %{public}@", v19, 0x1Cu);
  }

  if (v6) {
    v6[2](v6, v16, 0);
  }
}

- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SODaemon isConfigurationActiveForExtensionIdentifier:completion:]";
    __int16 v15 = 2112;
    BOOL v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  long long v9 = +[SOConfigurationHost defaultManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008BFC;
  v11[3] = &unk_100010728;
  id v12 = v6;
  id v10 = v6;
  [v9 isConfigurationActiveForExtensionIdentifier:v7 completion:v11];
}

- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = sub_1000030E4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_retainBlock(self->_authenticateCompletion);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SODaemon authorizationDidCompleteWithCredential:error:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    id v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s id authenticateCompletion = %@ on %@", buf, 0x20u);
  }
  id authenticateCompletion = (void (**)(id, id, id))self->_authenticateCompletion;
  if (authenticateCompletion)
  {
    if (v8)
    {
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2050000000;
      id v14 = (void *)qword_1000161C8;
      uint64_t v23 = qword_1000161C8;
      if (!qword_1000161C8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100009D58;
        id v25 = (SODaemon *)&unk_100010378;
        __int16 v26 = &v20;
        sub_100009D58((uint64_t)buf);
        id v14 = (void *)v21[3];
      }
      __int16 v15 = v14;
      _Block_object_dispose(&v20, 8);
      id v16 = [v15 alloc];
      id v17 = objc_msgSend(v16, "initWithAuthorizationCredential:", v8, v20);
      id authenticateCompletion = (void (**)(id, id, id))self->_authenticateCompletion;
    }
    else
    {
      id v17 = 0;
    }
    authenticateCompletion[2](authenticateCompletion, v17, v9);
    id v19 = self->_authenticateCompletion;
    self->_id authenticateCompletion = 0;

    if (v10) {
      v10[2](v10, 1, 0);
    }
    goto LABEL_15;
  }
  CFStringRef v18 = sub_1000030E4();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "authorization already finished => ignoring complete request", buf, 2u);
  }

  if (v10)
  {
    [sub_10000685C() silentInternalErrorWithMessage:@"authorization already finished => ignoring complete request"];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v17);
LABEL_15:
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SODaemon listener:shouldAcceptNewConnection:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v16 = (void *)qword_1000161D0;
  uint64_t v27 = qword_1000161D0;
  if (!qword_1000161D0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100009DB0;
    uint64_t v29 = &unk_100010378;
    id v30 = &v24;
    sub_100009DB0((uint64_t)buf, v9, v10, v11, v12, v13, v14, v15, v21);
    id v16 = (void *)v25[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v24, 8);
  CFStringRef v18 = [v17 interfaceWithInternalProtocol:&OBJC_PROTOCOL___SORemoteExtensionServiceProtocol];
  [v7 setExportedInterface:v18];

  [v7 setExportedObject:self];
  [v7 resume];
  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100009140;
  v22[3] = &unk_100010310;
  objc_copyWeak(&v23, (id *)buf);
  [(SODaemon *)self setInvalidationHandler:v22];
  id v19 = [(SODaemon *)self invalidationHandler];
  [v7 setInvalidationHandler:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)connectionInvalidated
{
  v3 = sub_1000030E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unsigned int v5 = "-[SODaemon connectionInvalidated]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)beginAuthorizationWithCompletion:(id)a3
{
  int v4 = (void (**)(id, SOAuthorizationRequestParameters *, void))a3;
  unsigned int v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SODaemon beginAuthorizationWithCompletion:]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  if (v4) {
    v4[2](v4, self->_requestParameters, 0);
  }
}

- (void)_updateUsageOfInternalExtensionsInParameters:(id)a3
{
  id v5 = a3;
  if ([v5 useInternalExtensions])
  {
    int v4 = [v5 url];
    objc_msgSend(v5, "setUseInternalExtensions:", -[SODaemon _doAKshouldProcessURL:](self, "_doAKshouldProcessURL:", v4));
  }
}

- (void)_updateCallerPropertiesFromAuditTokenInParameters:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [v4 auditTokenData];

  if (!v5
    || (id v6 = sub_100006F60(),
        [v4 auditTokenData],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v6) = [v6 auditTokenFromData:v7 auditToken:&v27],
        v7,
        (v6 & 1) == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    uint64_t v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    long long v27 = *(_OWORD *)buf;
    long long v28 = *(_OWORD *)&buf[16];

    uint64_t v10 = +[NSData dataWithBytes:&v27 length:32];
    [v4 setAuditTokenData:v10];
  }
  id v11 = sub_100006F60();
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  uint64_t v12 = [v11 bundleIdentifierFromAuditToken:buf];
  [v4 setCallerBundleIdentifier:v12];

  id v13 = sub_100006F60();
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  id v14 = [v13 pidFromAuditToken:buf];
  uint64_t v15 = [v4 callerBundleIdentifier];
  objc_msgSend(v4, "setCallerManaged:", +[SODaemonUtils isAppManagedWithBundleIdentifier:](SODaemonUtils, "isAppManagedWithBundleIdentifier:", v15));

  id v16 = sub_100006F60();
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  id v17 = [v16 teamIdentifierFromAuditToken:buf];
  [v4 setCallerTeamIdentifier:v17];

  CFStringRef v18 = [v4 callerBundleIdentifier];
  id v19 = +[SODaemonUtils localizedAppNameWithBundleIdentifier:v18 pid:v14];
  [v4 setLocalizedCallerDisplayName:v19];

  uint64_t v20 = sub_1000030E4();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint8_t v21 = [v4 auditTokenData];
    if (v21) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    id v23 = [v4 callerBundleIdentifier];
    if ([v4 isCallerManaged]) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    id v25 = [v4 callerTeamIdentifier];
    uint64_t v26 = [v4 localizedCallerDisplayName];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v22;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v23;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v24;
    __int16 v30 = 2112;
    __int16 v31 = v25;
    __int16 v32 = 2112;
    __int16 v33 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PID: %u has auditToken: %@, callerBundleIdentifier: %@, callerManaged: %@, callerTeamIdentifier: %@, localizedCallerDisplayName: %@", buf, 0x3Au);
  }
}

- (void)_extensionCleanup
{
  v3 = sub_1000030E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    int v7 = 136315650;
    __int16 v8 = "-[SODaemon _extensionCleanup]";
    __int16 v9 = 2114;
    uint64_t v10 = extension;
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@ on %@", (uint8_t *)&v7, 0x20u);
  }

  id v5 = self->_extension;
  if (v5)
  {
    [(SOExtension *)v5 unload];
    id v6 = self->_extension;
    self->_extension = 0;
  }
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = sub_1000030E4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "-[SODaemon authorization:didCompleteWithCredential:error:]";
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2112;
    CFStringRef v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s credential: %{public}@, %{public}@ on %@", buf, 0x2Au);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000098CC;
  v10[3] = &unk_100010750;
  v10[4] = self;
  [(SODaemon *)self authorizationDidCompleteWithCredential:v7 error:v8 completion:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_extensionXpcListener, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requestQueueIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonUIManager, 0);
  objc_storeStrong(&self->_authenticateCompletion, 0);
}

@end