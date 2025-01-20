@interface AARemoteServer
+ (AARemoteServer)sharedServer;
+ (AARemoteServer)sharedServerWithNoUrlCache;
- (AARemoteServer)init;
- (AAURLSession)session;
- (AAURLSession)signingSession;
- (id)_bodyDictionaryWithProtocolVersion:(id)a3;
- (id)_configurationCacheInvalidatingIfNecessary;
- (id)_configurationLock_configurationCacheInvalidatingIfNecessary;
- (id)_initRequiringUrlCache:(BOOL)a3;
- (id)_newURLRequestWithURLString:(id)a3;
- (id)_redactedBodyStringWithPropertyList:(id)a3;
- (id)_redactedHeadersFromHTTPHeaders:(id)a3;
- (void)_configurationAndResponseWithCompletion:(id)a3;
- (void)_fetchConfigurationAndResponseWithCompletion:(id)a3;
- (void)_setConfigurationCache:(id)a3;
- (void)_startRequest:(id)a3 responseClass:(Class)a4 mainThread:(BOOL)a5 completion:(id)a6;
- (void)authenticateAccount:(id)a3 completion:(id)a4;
- (void)configurationWithCompletion:(id)a3;
- (void)loginDelegates:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)registerAccount:(id)a3 withHSA:(BOOL)a4 completion:(id)a5;
- (void)setSession:(id)a3;
- (void)urlConfigurationWithCompletion:(id)a3;
@end

@implementation AARemoteServer

+ (AARemoteServer)sharedServerWithNoUrlCache
{
  if (sharedServerWithNoUrlCache_onceToken != -1) {
    dispatch_once(&sharedServerWithNoUrlCache_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)sharedServerWithNoUrlCache_sharedServer;

  return (AARemoteServer *)v2;
}

uint64_t __44__AARemoteServer_sharedServerWithNoUrlCache__block_invoke()
{
  sharedServerWithNoUrlCache_sharedServer = [[AARemoteServer alloc] _initRequiringUrlCache:0];

  return MEMORY[0x1F41817F8]();
}

- (id)_initRequiringUrlCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AARemoteServer;
  v4 = [(AARemoteServer *)&v14 init];
  if (v4)
  {
    if (v3) {
      +[AAURLSession sharedSession];
    }
    else {
    uint64_t v5 = +[AAURLSession sharedSessionWithNoUrlCache];
    }
    session = v4->_session;
    v4->_session = (AAURLSession *)v5;

    v4->_configurationLock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AppleAccount.RemoteServer", v7);
    configurationQueue = v4->_configurationQueue;
    v4->_configurationQueue = (OS_dispatch_queue *)v8;

    configurationCache = v4->_configurationCache;
    v4->_configurationCache = 0;

    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"NO";
      if (v3) {
        v12 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AARemoteServer initiated with requiresUrlCache: %@", buf, 0xCu);
    }
  }
  return v4;
}

+ (AARemoteServer)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)sharedServer_sharedServer;

  return (AARemoteServer *)v2;
}

uint64_t __30__AARemoteServer_sharedServer__block_invoke()
{
  sharedServer_sharedServer = objc_alloc_init(AARemoteServer);

  return MEMORY[0x1F41817F8]();
}

- (AAURLSession)signingSession
{
  return +[AAURLSession sharedSigningSession];
}

- (AARemoteServer)init
{
  return (AARemoteServer *)[(AARemoteServer *)self _initRequiringUrlCache:1];
}

- (void)configurationWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AARemoteServer.m", 111, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (_os_feature_enabled_impl())
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AARemoteServer configurationWithCompletion:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke;
    v20[3] = &unk_1E5A486D0;
    v20[4] = self;
    id v21 = v5;
    id v14 = v5;
    [(AARemoteServer *)self urlConfigurationWithCompletion:v20];
    v15 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke_2;
    v18[3] = &unk_1E5A4B0C0;
    id v19 = v5;
    id v16 = v5;
    [(AARemoteServer *)self _configurationAndResponseWithCompletion:v18];
    v15 = v19;
  }
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v11 = v9;
  if ((v10 == 0) != (v11 != 0))
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: configuration ^ error" userInfo:0];
    objc_exception_throw(v16);
  }
  uint64_t v12 = v11;

  uint64_t v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_2((uint64_t)v10, (uint64_t)v12, v13);
  }

  if (v12)
  {
    id v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_1(v14);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__AARemoteServer_configurationWithCompletion___block_invoke_61;
    v17[3] = &unk_1E5A4B0C0;
    v15 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    [v15 _configurationAndResponseWithCompletion:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  id v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: configuration ^ error" userInfo:0];
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  id v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: configuration ^ error" userInfo:0];
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AARemoteServer urlConfigurationWithCompletion:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = objc_alloc_init(AADaemonController);
  [(AADaemonController *)v12 urlConfigurationWithCompletion:v3];
}

- (void)_configurationAndResponseWithCompletion:(id)a3
{
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke;
  v14[3] = &unk_1E5A4B0E8;
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = (void (**)(void, void, void, void))MEMORY[0x1A622F430](v14);
  uint64_t v7 = [(AARemoteServer *)self _configurationCacheInvalidatingIfNecessary];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 configuration];
    uint64_t v10 = [v8 response];
    ((void (**)(void, void *, void *, void))v6)[2](v6, v9, v10, 0);
  }
  else
  {
    configurationQueue = self->_configurationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_2;
    block[3] = &unk_1E5A48470;
    block[4] = self;
    uint64_t v13 = v6;
    dispatch_async(configurationQueue, block);
  }
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  id v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: configuration ^ error" userInfo:0];
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _configurationCacheInvalidatingIfNecessary];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [v2 configuration];
    uint64_t v6 = [v3 response];
    (*(void (**)(uint64_t, void *, void *, void))(v4 + 16))(v4, v5, v6, 0);
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3;
    v8[3] = &unk_1E5A486D0;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 40);
    [v7 _fetchConfigurationAndResponseWithCompletion:v8];
  }
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AALogSystem();
  id v11 = v10;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }

    id v18 = *(void **)(a1 + 32);
    id v11 = +[AARemoteServerConfigurationCache cacheWithConfiguration:v7 response:v8];
    [v18 _setConfigurationCache:v11];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_2((uint64_t)v9, v11);
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setConfigurationCache:(id)a3
{
  uint64_t v4 = (AARemoteServerConfigurationCache *)a3;
  os_unfair_lock_lock(&self->_configurationLock);
  configurationCache = self->_configurationCache;
  self->_configurationCache = v4;

  os_unfair_lock_unlock(&self->_configurationLock);
}

- (id)_configurationCacheInvalidatingIfNecessary
{
  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  uint64_t v4 = [(AARemoteServer *)self _configurationLock_configurationCacheInvalidatingIfNecessary];
  os_unfair_lock_unlock(p_configurationLock);

  return v4;
}

- (id)_configurationLock_configurationCacheInvalidatingIfNecessary
{
  os_unfair_lock_assert_owner(&self->_configurationLock);
  id v3 = [(AARemoteServerConfigurationCache *)self->_configurationCache creationDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (v5 < -600.0)
  {
    configurationCache = self->_configurationCache;
    self->_configurationCache = 0;
  }
  id v7 = self->_configurationCache;

  return v7;
}

- (void)_fetchConfigurationAndResponseWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AARemoteServer.m", 212, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke;
  v17[3] = &unk_1E5A4B0E8;
  id v18 = v5;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1A622F430](v17);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:@"https://setup.icloud.com"];
  [v8 setPath:@"/configurations/init"];
  [v8 setQuery:@"context=settings"];
  id v9 = [v8 URL];

  id v10 = [MEMORY[0x1E4F18D50] requestWithURL:v9];
  id v11 = [(AARemoteServer *)self session];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke_2;
  v15[3] = &unk_1E5A48970;
  id v16 = v7;
  id v12 = v7;
  uint64_t v13 = [v11 bodyTaskWithRequest:v10 completion:v15];
  [v13 resume];
}

void __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v12 = v7;
  id v10 = v9;
  if ((v12 == 0) != (v10 != 0))
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: configuration ^ error" userInfo:0];
    objc_exception_throw(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__AARemoteServer__fetchConfigurationAndResponseWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v13)
  {
    objc_opt_class();
    id v9 = v13;
    if (objc_opt_isKindOfClass())
    {
      id v10 = [[AAURLConfiguration alloc] initWithDictionary:v9];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {

      uint64_t v12 = *(void *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:underlyingError:", -4402, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id, id))(v12 + 16))(v12, 0, v7, v9);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, void, id, id))(v11 + 16))(v11, 0, v7, v8);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4402);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id, id))(v11 + 16))(v11, 0, v7, v9);
  }

LABEL_9:
}

- (AAURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);

  objc_storeStrong((id *)&self->_configurationQueue, 0);
}

- (void)authenticateAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"AARemoteServer.m", 260, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"AARemoteServer.m", 261, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "aa_URLWithEndpoint:", @"authenticate");
  uint64_t v11 = [AAAuthenticateRequest alloc];
  uint64_t v12 = [v10 absoluteString];
  id v13 = [v7 username];
  uint64_t v14 = objc_msgSend(v7, "aa_password");
  uint64_t v15 = [(AAAuthenticateRequest *)v11 initWithURLString:v12 username:v13 password:v14];

  id v16 = [AARequester alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__AARemoteServer_Deprecated__authenticateAccount_completion___block_invoke;
  v23[3] = &unk_1E5A4B110;
  id v24 = v7;
  id v25 = v9;
  id v17 = v9;
  id v18 = v7;
  id v19 = [(AARequester *)v16 initWithRequest:v15 handler:v23];
  id v20 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v20 addOperation:v19];
}

void __61__AARemoteServer_Deprecated__authenticateAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = [v5 error];
    id v7 = [v5 personID];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v9 = [v5 personID];
    id v10 = v9;
    if (isKindOfClass)
    {
      uint64_t v11 = [v9 stringValue];

      id v10 = (void *)v11;
    }
    [*(id *)(a1 + 32) setAccountProperty:v10 forKey:@"personID"];
    if (v6)
    {
      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v13 = _AALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v5 authToken];
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "authenticate Succeeded. Token is %@", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v15 = *(void **)(a1 + 32);
      id v16 = [v5 authToken];
      objc_msgSend(v15, "aa_setAuthToken:", v16);

      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v12();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)registerAccount:(id)a3 withHSA:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"AARemoteServer.m", 304, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"AARemoteServer.m", 305, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "registerAccount", buf, 2u);
  }

  id v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "aa_URLWithEndpoint:", @"loginOrCreateAccount");
  uint64_t v14 = [v13 absoluteString];
  id v15 = [(AARemoteServer *)self _newURLRequestWithURLString:v14];

  if (v6)
  {
    id v16 = objc_msgSend(v9, "aa_personID");
    objc_msgSend(v15, "aa_addDeviceProvisioningInfoHeadersWithDSID:sendEmptyValues:", v16, 1);
  }
  int v17 = +[AADeviceInfo udid];
  [v15 setValue:v17 forHTTPHeaderField:@"Device-UDID"];

  [v15 setHTTPMethod:@"POST"];
  objc_msgSend(v15, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", v9, 1);
  id v18 = [(AARemoteServer *)self _bodyDictionaryWithProtocolVersion:@"1.0"];
  id v19 = (id)objc_msgSend(v15, "aa_setXMLBodyWithParameters:", v18);

  objc_msgSend(v15, "aa_addMultiUserDeviceHeaderIfEnabled");
  id v20 = _AASignpostLogSystem();
  os_signpost_id_t v21 = _AASignpostCreate(v20);
  uint64_t v23 = v22;

  id v24 = _AASignpostLogSystem();
  id v25 = v24;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = [v9 accountType];
    v27 = [v26 identifier];
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v42 = (os_signpost_id_t)v27;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v21, "LoginOrCreateAccount", " AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0xCu);
  }
  v28 = _AASignpostLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v9 accountType];
    v30 = [v29 identifier];
    *(_DWORD *)buf = 134218242;
    os_signpost_id_t v42 = v21;
    __int16 v43 = 2114;
    v44 = v30;
    _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginOrCreateAccount  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  enableTelemetry=YES ", buf, 0x16u);
  }
  uint64_t v31 = objc_opt_class();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __65__AARemoteServer_Deprecated__registerAccount_withHSA_completion___block_invoke;
  v36[3] = &unk_1E5A4B138;
  os_signpost_id_t v39 = v21;
  uint64_t v40 = v23;
  id v37 = v9;
  id v38 = v11;
  id v32 = v11;
  id v33 = v9;
  [(AARemoteServer *)self _startRequest:v15 responseClass:v31 mainThread:0 completion:v36];
}

void __65__AARemoteServer_Deprecated__registerAccount_withHSA_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v9 = _AASignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v12 = _AAErrorUnderlyingError(v6);
    int v28 = 67240192;
    LODWORD(v29) = [v12 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "LoginOrCreateAccount", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v28, 8u);
  }
  id v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    id v15 = *(__CFString **)(a1 + 48);
    id v16 = _AAErrorUnderlyingError(v6);
    int v17 = [v16 code];
    int v28 = 134218496;
    v29 = v15;
    __int16 v30 = 2048;
    double v31 = v14;
    __int16 v32 = 1026;
    int v33 = v17;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginOrCreateAccount  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v28, 0x1Cu);
  }
  id v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = @"YES";
    if (!v7) {
      id v19 = @"NO";
    }
    int v28 = 138412290;
    v29 = v19;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "Register Completed - Response: %@", (uint8_t *)&v28, 0xCu);
  }

  if (v7)
  {
    uint64_t v20 = [v7 personID];
    if (v20)
    {
      os_signpost_id_t v21 = (void *)v20;
      uint64_t v22 = objc_msgSend(*(id *)(a1 + 32), "aa_personID");

      if (!v22)
      {
        uint64_t v23 = *(void **)(a1 + 32);
        id v24 = [v7 personID];
        [v23 setAccountProperty:v24 forKey:@"personID"];
      }
    }
    id v25 = [v7 error];
    v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = @"NO";
      if (!v25) {
        v27 = @"YES";
      }
      int v28 = 138412290;
      v29 = v27;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Account Authenticated: %@", (uint8_t *)&v28, 0xCu);
    }

    if (!v25) {
      objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)loginDelegates:(id)a3 parameters:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v31 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"AARemoteServer.m", 356, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  __int16 v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"AARemoteServer.m", 357, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

LABEL_3:
  os_signpost_id_t v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "loginDelegates called", buf, 2u);
  }

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "aa_URLWithEndpoint:", @"loginDelegates");
  id v13 = [v12 absoluteString];
  id v14 = [(AARemoteServer *)self _newURLRequestWithURLString:v13];

  id v15 = objc_msgSend(v9, "aa_personID");

  if (v15)
  {
    id v16 = objc_msgSend(v9, "aa_personID");
    objc_msgSend(v14, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v16);
  }
  [v14 setHTTPMethod:@"POST"];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v17 setValue:v10 forKey:@"delegates"];
  id v18 = [v9 username];
  [v17 setValue:v18 forKey:@"apple-id"];

  id v19 = [v9 credential];
  uint64_t v20 = [v19 password];
  [v17 setValue:v20 forKey:@"password"];

  os_signpost_id_t v21 = +[AADeviceInfo appleIDClientIdentifier];
  [v17 setValue:v21 forKey:@"client-id"];

  objc_msgSend(v14, "aa_setBodyWithParameters:", v17);
  uint64_t v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(AARemoteServer *)self _redactedBodyStringWithPropertyList:v10];
    *(_DWORD *)buf = 138412290;
    v35 = v23;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  [v14 addValue:@"text/plist" forHTTPHeaderField:@"Content-Type"];
  objc_msgSend(v14, "aa_addAltDSIDAndRepairStateWithAccount:", v9);
  id v24 = +[AADeviceInfo udid];
  [v14 setValue:v24 forHTTPHeaderField:@"Device-UDID"];

  id v25 = _AALogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v14 description];
    *(_DWORD *)buf = 138412290;
    v35 = v26;
    _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "request is: %@", buf, 0xCu);
  }
  uint64_t v27 = objc_opt_class();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__AARemoteServer_Deprecated__loginDelegates_parameters_completion___block_invoke;
  v32[3] = &unk_1E5A4B160;
  id v33 = v31;
  id v28 = v31;
  [(AARemoteServer *)self _startRequest:v14 responseClass:v27 mainThread:0 completion:v32];
}

uint64_t __67__AARemoteServer_Deprecated__loginDelegates_parameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_bodyDictionaryWithProtocolVersion:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  [v5 setObject:v4 forKey:@"protocolVersion"];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v8 = [v7 name];

  [v6 setObject:v8 forKey:@"timezone"];
  id v9 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v10 = [v9 firstObject];

  if (v10) {
    os_signpost_id_t v11 = (__CFString *)v10;
  }
  else {
    os_signpost_id_t v11 = @"en";
  }
  [v6 setObject:v11 forKey:@"language"];
  uint64_t v12 = +[AADeviceInfo appleIDClientIdentifier];
  [v6 setObject:v12 forKey:@"client-id"];

  [v5 setObject:v6 forKey:@"userInfo"];

  return v5;
}

- (id)_redactedBodyStringWithPropertyList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [&unk_1EF483DF8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(&unk_1EF483DF8);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v3 valueForKey:v8];
        uint64_t v10 = v9;
        if (v9)
        {
          os_signpost_id_t v11 = [v9 unredactedSuffixOfLength:4];
          uint64_t v12 = [NSString stringWithFormat:@"...%@", v11];
          [v3 setValue:v12 forKey:v8];
        }
      }
      uint64_t v5 = [&unk_1EF483DF8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  id v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:0];
  id v14 = [NSString alloc];
  id v15 = v13;
  id v16 = objc_msgSend(v14, "initWithBytes:length:encoding:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 4);

  return v16;
}

- (id)_redactedHeadersFromHTTPHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [&unk_1EF483E10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(&unk_1EF483E10);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v3 valueForKey:v8];
        uint64_t v10 = v9;
        if (v9)
        {
          os_signpost_id_t v11 = [v9 unredactedSuffixOfLength:4];
          uint64_t v12 = [NSString stringWithFormat:@"...%@", v11];
          [v3 setValue:v12 forKey:v8];
        }
      }
      uint64_t v5 = [&unk_1EF483E10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)_startRequest:(id)a3 responseClass:(Class)a4 mainThread:(BOOL)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Sending request...", buf, 2u);
  }

  id v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = [v10 description];
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "HTTP Request: %@", buf, 0xCu);
  }
  long long v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = [v10 allHTTPHeaderFields];
    long long v17 = [(AARemoteServer *)self _redactedHeadersFromHTTPHeaders:v16];
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "HTTP Headers:\n%@", buf, 0xCu);
  }
  long long v18 = [(AARemoteServer *)self signingSession];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke;
  v21[3] = &unk_1E5A4B1B0;
  BOOL v24 = a5;
  id v22 = v11;
  Class v23 = a4;
  id v19 = v11;
  long long v20 = [v18 dataTaskWithRequest:v10 completion:v21];
  [v20 resume];
}

void __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v9;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Remote request completed with error %@", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithHTTPResponse:v8 data:v7];
    id v9 = [v11 error];
  }
  uint64_t v12 = objc_msgSend(v9, "_aa_userReadableError");

  if (*(unsigned char *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke_215;
    block[3] = &unk_1E5A4B188;
    id v16 = *(id *)(a1 + 32);
    id v14 = v11;
    id v15 = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __80__AARemoteServer_Deprecated___startRequest_responseClass_mainThread_completion___block_invoke_215(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_newURLRequestWithURLString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithString:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F18D50];
  id v7 = [v5 URL];
  id v8 = [v6 requestWithURL:v7];

  return v8;
}

- (void)configurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "XPC connection failed. Continuing fetching urlConfiguration in process", v1, 2u);
}

void __46__AARemoteServer_configurationWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[AARemoteServer configurationWithCompletion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "%s completion: %@, error: %@", (uint8_t *)&v3, 0x20u);
}

- (void)urlConfigurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__AARemoteServer__configurationAndResponseWithCompletion___block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch URL configuration, error: %@", (uint8_t *)&v2, 0xCu);
}

@end