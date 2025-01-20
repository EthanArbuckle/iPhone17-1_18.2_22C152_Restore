@interface SOAuthorization
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4;
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6;
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5;
+ (NSString)originatorBundleIdentifier;
+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4;
+ (void)setOriginatorBundleIdentifier:(id)a3;
- (BOOL)enableEmbeddedAuthorizationViewController;
- (BOOL)isUserInteractionEnabled;
- (NSDictionary)authorizationOptions;
- (OS_dispatch_queue)delegateDispatchQueue;
- (SOAuthorization)init;
- (SOAuthorizationDelegate)delegate;
- (id)kerberosProfiles;
- (id)realms;
- (void)_applicationActivationWithTimeout:(BOOL)a3;
- (void)_cancelAuthorization;
- (void)_extensionCleanup;
- (void)_finishAuthorization:(id)a3 completion:(id)a4;
- (void)_finishAuthorizationWithCredential:(id)a3 error:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6;
- (void)beginAuthorizationWithParameters:(id)a3;
- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5;
- (void)cancelAuthorization;
- (void)dealloc;
- (void)debugHintsWithCompletion:(id)a3;
- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5;
- (void)setAuthorizationOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateDispatchQueue:(id)a3;
- (void)setEnableEmbeddedAuthorizationViewController:(BOOL)a3;
- (void)setEnableUserInteraction:(BOOL)a3;
- (void)viewControllerDidCancel:(id)a3;
@end

@implementation SOAuthorization

- (SOAuthorization)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SOAuthorization init]";
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorization;
  v4 = [(SOAuthorization *)&v8 init];
  if (v4)
  {
    if (AppSSOCoreLibraryCore())
    {
      v5 = (SOAuthorizationCore *)objc_alloc_init((Class)getSOAuthorizationCoreClass());
      authorizationCore = v4->_authorizationCore;
      v4->_authorizationCore = v5;
    }
    v4->_enableEmbeddedAuthorizationViewController = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SOAuthorization;
  [(SOAuthorization *)&v4 dealloc];
}

+ (void)setOriginatorBundleIdentifier:(id)a3
{
}

+ (NSString)originatorBundleIdentifier
{
  return (NSString *)(id)_originatorBundleIdentifier;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  id v5 = a3;
  if (AppSSOCoreLibraryCore())
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    if (_originatorBundleIdentifier)
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke;
      activity_block[3] = &unk_26432AAF0;
      v16 = &v18;
      id v15 = v5;
      int64_t v17 = a4;
      _os_activity_initiate(&dword_2185C9000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      v6 = v15;
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke_2;
      v10[3] = &unk_26432AAF0;
      v12 = &v18;
      id v11 = v5;
      int64_t v13 = a4;
      _os_activity_initiate(&dword_2185C9000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v10);
      v6 = v11;
    }

    BOOL v8 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v7 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke(void *a1)
{
  uint64_t result = [getSOAuthorizationCoreClass() canPerformAuthorizationWithURL:a1[4] responseCode:a1[6] callerBundleIdentifier:_originatorBundleIdentifier useInternalExtensions:1];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __63__SOAuthorization_canPerformAuthorizationWithURL_responseCode___block_invoke_2(void *a1)
{
  uint64_t result = [getSOAuthorizationCoreClass() canPerformAuthorizationWithURL:a1[4] responseCode:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5
{
  id v7 = a3;
  if (AppSSOCoreLibraryCore())
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    if (_originatorBundleIdentifier)
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke;
      activity_block[3] = &unk_26432AAF0;
      v19 = &v21;
      id v18 = v7;
      int64_t v20 = a4;
      _os_activity_initiate(&dword_2185C9000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      BOOL v8 = v18;
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke_2;
      v12[3] = &unk_26432AB18;
      v14 = &v21;
      id v13 = v7;
      int64_t v15 = a4;
      BOOL v16 = a5;
      _os_activity_initiate(&dword_2185C9000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v12);
      BOOL v8 = v13;
    }

    BOOL v10 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v9 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke(void *a1)
{
  uint64_t result = [getSOAuthorizationCoreClass() canPerformAuthorizationWithURL:a1[4] responseCode:a1[6] callerBundleIdentifier:_originatorBundleIdentifier useInternalExtensions:1];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __85__SOAuthorization_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke_2(uint64_t a1)
{
  uint64_t result = [getSOAuthorizationCoreClass() canPerformAuthorizationWithURL:*(void *)(a1 + 32) responseCode:*(void *)(a1 + 48) useInternalExtensions:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  if (AppSSOCoreLibraryCore())
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __108__SOAuthorization_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke;
    activity_block[3] = &unk_26432AB40;
    int64_t v17 = &v20;
    id v15 = v9;
    int64_t v18 = a4;
    id v16 = v10;
    BOOL v19 = a6;
    _os_activity_initiate(&dword_2185C9000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __108__SOAuthorization_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke(uint64_t a1)
{
  uint64_t result = [getSOAuthorizationCoreClass() canPerformAuthorizationWithURL:*(void *)(a1 + 32) responseCode:*(void *)(a1 + 56) callerBundleIdentifier:*(void *)(a1 + 40) useInternalExtensions:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(SOAuthorizationCore *)v2->_authorizationCore delegateDispatchQueue];
  objc_sync_exit(v2);

  return (OS_dispatch_queue *)v3;
}

- (void)setDelegateDispatchQueue:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(SOAuthorizationCore *)v4->_authorizationCore setDelegateDispatchQueue:v5];
  objc_sync_exit(v4);
}

- (NSDictionary)authorizationOptions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(SOAuthorizationCore *)v2->_authorizationCore authorizationOptions];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setAuthorizationOptions:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(SOAuthorizationCore *)v4->_authorizationCore setAuthorizationOptions:v5];
  objc_sync_exit(v4);
}

- (BOOL)isUserInteractionEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(SOAuthorizationCore *)v2->_authorizationCore isUserInteractionEnabled];
  objc_sync_exit(v2);

  return v3;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(SOAuthorizationCore *)obj->_authorizationCore setEnableUserInteraction:v3];
  objc_sync_exit(obj);
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SOAuthorization getAuthorizationHintsWithURL:responseCode:completion:]";
    __int16 v17 = 2112;
    int64_t v18 = self;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  authorizationCore = self->_authorizationCore;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__SOAuthorization_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  v13[3] = &unk_26432AB68;
  id v14 = v8;
  id v12 = v8;
  [(SOAuthorizationCore *)authorizationCore getAuthorizationHintsWithURL:v9 responseCode:a4 completion:v13];
}

void __72__SOAuthorization_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "hints: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v5)
    {
      id v9 = [[SOAuthorizationHints alloc] initWithAuthorizationHintsCore:v5];
      uint64_t v8 = *(void *)(a1 + 32);
    }
    else
    {
      id v9 = 0;
    }
    (*(void (**)(uint64_t, SOAuthorizationHints *, id))(v8 + 16))(v8, v9, v6);
  }
}

- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[SOAuthorization beginAuthorizationWithURL:httpHeaders:httpBody:]";
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v13, 0x16u);
  }

  __int16 v12 = objc_alloc_init(SOAuthorizationParameters);
  [(SOAuthorizationParameters *)v12 setUrl:v10];

  [(SOAuthorizationParameters *)v12 setHttpHeaders:v9];
  [(SOAuthorizationParameters *)v12 setHttpBody:v8];

  [(SOAuthorizationParameters *)v12 setUseInternalExtensions:1];
  [(SOAuthorization *)self beginAuthorizationWithParameters:v12];
}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[SOAuthorization beginAuthorizationWithOperation:url:httpHeaders:httpBody:]";
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_impl(&dword_2185C9000, v14, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v16, 0x16u);
  }

  __int16 v15 = objc_alloc_init(SOAuthorizationParameters);
  [(SOAuthorizationParameters *)v15 setOperation:v13];

  [(SOAuthorizationParameters *)v15 setUrl:v12];
  [(SOAuthorizationParameters *)v15 setHttpHeaders:v11];

  [(SOAuthorizationParameters *)v15 setHttpBody:v10];
  [(SOAuthorizationParameters *)v15 setUseInternalExtensions:1];
  [(SOAuthorization *)self beginAuthorizationWithParameters:v15];
}

- (void)beginAuthorizationWithParameters:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v4 identifier];
    id v6 = [v4 operation];
    id v7 = [v4 url];
    id v8 = [v4 httpHeaders];
    id v9 = [v4 httpBody];
    id v10 = [v4 auditTokenData];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL enableEmbeddedAuthorizationViewController = self->_enableEmbeddedAuthorizationViewController;
    *(_DWORD *)buf = 136317955;
    *(void *)&uint8_t buf[4] = "-[SOAuthorization beginAuthorizationWithParameters:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2114;
    v36 = v6;
    strcpy(v37, "p\bhash");
    v37[7] = 0;
    *(_WORD *)&v37[8] = 0;
    __int16 v38 = 2117;
    v39 = v7;
    __int16 v40 = 2113;
    v41 = v8;
    __int16 v42 = 2113;
    v43 = v9;
    __int16 v44 = 2114;
    v45 = v10;
    __int16 v46 = 2114;
    id v47 = WeakRetained;
    __int16 v48 = 1024;
    BOOL v49 = enableEmbeddedAuthorizationViewController;
    __int16 v50 = 1024;
    BOOL v51 = [(SOAuthorization *)self isUserInteractionEnabled];
    __int16 v52 = 2112;
    v53 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@, operation = %{public}@, url = %{sensitive, mask.hash}@, httpHeaders = %{private}@, httpBody = %{private}@, auditToken = %{public}@, delegate = %{public}@, enableEmbeddedAVC = %d, enableUI = %d on %@", buf, 0x72u);
  }
  if (_CFMZEnabled()) {
    self->_BOOL enableEmbeddedAuthorizationViewController = 0;
  }
  if (![(SOAuthorization *)self isUserInteractionEnabled])
  {
    id v13 = dispatch_get_global_queue(0, 0);
    [(SOAuthorizationCore *)self->_authorizationCore setDelegateDispatchQueue:v13];
  }
  if (self->_enableEmbeddedAuthorizationViewController
    && (id v14 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
    && (id v15 = objc_loadWeakRetained((id *)&self->_delegate),
        char v16 = objc_opt_respondsToSelector(),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    uint64_t v17 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2185C9000, v17, OS_LOG_TYPE_DEFAULT, "originator will present authorization view controller", buf, 2u);
    }

    __int16 v18 = self;
    objc_sync_enter(v18);
    uint64_t v19 = [(SOAuthorizationCore *)v18->_authorizationCore requestParametersCore];

    if (v19)
    {
      uint64_t v20 = SO_LOG_SOAuthorization();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_2185C9000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already authorizing => ignoring a new authorization request", buf, 0xCu);
      }

      objc_sync_exit(v18);
    }
    else
    {
      objc_sync_exit(v18);

      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2050000000;
      uint64_t v21 = (void *)getSOAuthorizationRequestParametersCoreClass_softClass;
      uint64_t v34 = getSOAuthorizationRequestParametersCoreClass_softClass;
      if (!getSOAuthorizationRequestParametersCoreClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getSOAuthorizationRequestParametersCoreClass_block_invoke;
        v36 = &unk_26432A2A8;
        *(void *)v37 = &v31;
        __getSOAuthorizationRequestParametersCoreClass_block_invoke((uint64_t)buf);
        uint64_t v21 = (void *)v32[3];
      }
      uint64_t v22 = v21;
      _Block_object_dispose(&v31, 8);
      char v23 = (void *)[[v22 alloc] initWithAuthorizationParameters:v4];
      char v24 = [(SOAuthorization *)v18 authorizationOptions];
      [v23 setAuthorizationOptions:v24];

      objc_msgSend(v23, "setEnableUserInteraction:", -[SOAuthorization isUserInteractionEnabled](v18, "isUserInteractionEnabled"));
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke;
      v29[3] = &unk_26432A408;
      v29[4] = v18;
      id v30 = v23;
      id v25 = v23;
      _os_activity_initiate(&dword_2185C9000, "beginAuthorizationWithParametersEmbedded", OS_ACTIVITY_FLAG_DEFAULT, v29);
    }
  }
  else
  {
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_41;
    activity_block[3] = &unk_26432A408;
    void activity_block[4] = self;
    id v28 = v4;
    _os_activity_initiate(&dword_2185C9000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2;
  v6[3] = &unk_26432AC08;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 beginAuthorizationWithRequestParameters:v4 completion:v6];
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithRequestParameters: identifier = %{public}@, extensionBundleId = %{public}@, endpoint = %{public}@, error = %{public}@", buf, 0x2Au);
  }
  if (v7 && v8)
  {
    id v12 = +[SOExtensionManager sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_31;
    v15[3] = &unk_26432ABE0;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v16 = v13;
    uint64_t v17 = v14;
    id v18 = v8;
    [v12 loadExtensionWithBundleIdentifer:v7 completion:v15];
  }
  else
  {
    [*(id *)(a1 + 40) _finishAuthorizationWithCredential:0 error:v9];
  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) identifier];
    id v10 = [*(id *)(*(void *)(a1 + 40) + 16) localizedExtensionDisplayName];
    *(_DWORD *)buf = 138543874;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v7;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "loadExtensionWithBundleIdentifer: identifier = %{public}@, extension = %{public}@, error = %{public}@", buf, 0x20u);
  }
  id v11 = *(id **)(a1 + 40);
  if (v6)
  {
    objc_storeStrong(v11 + 2, a2);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 16);
    uint64_t v14 = [*(id *)(a1 + 32) identifier];
    [v13 saveDelegate:v12 forRequestIdentifier:v14];

    id v15 = *(void **)(*(void *)(a1 + 40) + 16);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_32;
    v19[3] = &unk_26432ABB8;
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = *(void **)(a1 + 48);
    id v20 = v16;
    uint64_t v21 = v17;
    id v22 = v18;
    [v15 requestAuthorizationViewControllerWithCompletion:v19];
  }
  else
  {
    [v11 _finishAuthorizationWithCredential:0 error:v7];
  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543874;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "requestAuthorizationViewControllerWithCompletion: identifier = %{public}@, remoteViewController = %{public}@, error = %{public}@", buf, 0x20u);
  }
  id v10 = *(id **)(a1 + 40);
  if (v6)
  {
    objc_storeStrong(v10 + 3, a2);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 16);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_36;
    v16[3] = &unk_26432AB90;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v17 = v13;
    uint64_t v18 = v14;
    [v12 beginAuthorizationWithServiceXPCEndpoint:v11 completion:v16];
    id v15 = v17;
  }
  else
  {
    id v15 = [getSOErrorHelperClass_2() errorWithCode:-1000 message:@"Missing remote view controller" suberror:v7];
    [v10 _finishAuthorizationWithCredential:0 error:v15];
  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_36(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) identifier];
    int v8 = 138543874;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2185C9000, v6, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithServiceXPCEndpoint: identifier = %{public}@, success = %d, error = %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 40) _finishAuthorizationWithCredential:0 error:v5];
  }
}

void __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_41(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v3 = [*(id *)(a1 + 40) authorizationParametersCore];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2_42;
  v4[3] = &unk_26432AC30;
  v4[4] = *(void *)(a1 + 32);
  [v2 beginAuthorizationWithParameters:v3 completion:v4];
}

uint64_t __52__SOAuthorization_beginAuthorizationWithParameters___block_invoke_2_42(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishAuthorizationWithCredential:a2 error:a3];
}

- (void)cancelAuthorization
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SOAuthorization cancelAuthorization]";
    __int16 v7 = 2112;
    int v8 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (self->_extension)
  {
    [(SOAuthorization *)self _cancelAuthorization];
  }
  else
  {
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __38__SOAuthorization_cancelAuthorization__block_invoke;
    activity_block[3] = &unk_26432AC58;
    void activity_block[4] = self;
    _os_activity_initiate(&dword_2185C9000, "cancelAuthorization", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

uint64_t __38__SOAuthorization_cancelAuthorization__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) cancelAuthorization];
}

- (void)debugHintsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[SOAuthorization debugHintsWithCompletion:]";
    __int16 v11 = 2112;
    __int16 v12 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SOAuthorization_debugHintsWithCompletion___block_invoke;
  v7[3] = &unk_26432A4B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  _os_activity_initiate(&dword_2185C9000, "debugHintsWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v7);
}

uint64_t __44__SOAuthorization_debugHintsWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) debugHintsWithCompletion:*(void *)(a1 + 40)];
}

- (void)_finishAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorization _finishAuthorization:completion:]((uint64_t)self, v8);
  }

  extension = self->_extension;
  if (extension)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__SOAuthorization__finishAuthorization_completion___block_invoke;
    v10[3] = &unk_26432AC80;
    void v10[4] = self;
    id v11 = v7;
    [(SOExtension *)extension finishAuthorization:v6 completion:v10];
  }
  else
  {
    [(SOAuthorizationCore *)self->_authorizationCore finishAuthorization:v6 completion:v7];
  }
}

void __51__SOAuthorization__finishAuthorization_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _extensionCleanup];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_cancelAuthorization
{
  OUTLINED_FUNCTION_1(&dword_2185C9000, a2, a3, "%@ already finished => ignoring cancel request", a5, a6, a7, a8, 2u);
}

void __39__SOAuthorization__cancelAuthorization__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = a2;
    a2 = (void *)[objc_alloc((Class)getSOAuthorizationCredentialCoreClass()) initWithAuthorizationCredential:v5];
  }
  [*(id *)(a1 + 32) _finishAuthorizationWithCredential:a2 error:v6];
}

- (void)_finishAuthorizationWithCredential:(id)a3 error:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SOAuthorizationCore *)self->_authorizationCore requestParametersCore];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136316419;
    *(void *)&uint8_t buf[4] = "-[SOAuthorization _finishAuthorizationWithCredential:error:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    __int16 v48 = v7;
    *(_WORD *)BOOL v49 = 2114;
    *(void *)&v49[2] = v9;
    __int16 v50 = 2114;
    id v51 = WeakRetained;
    __int16 v52 = 2112;
    v53 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s credentialCore = %{private}@, error = %{public}@, requestParametersCore = %{public}@, delegate = %{public}@ on %@", buf, 0x3Eu);
  }
  id v11 = self;
  objc_sync_enter(v11);
  __int16 v12 = [(SOAuthorizationCore *)v11->_authorizationCore requestParametersCore];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    uint64_t v29 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorization _finishAuthorizationWithCredential:error:]((uint64_t)v11, v29, v30, v31, v32, v33, v34, v35);
    }

    objc_sync_exit(v11);
  }
  else
  {
    if (v11->_extension || ![(SOAuthorization *)v11 isUserInteractionEnabled])
    {
      int v23 = 0;
    }
    else
    {
      uint64_t v43 = 0;
      __int16 v44 = &v43;
      uint64_t v45 = 0x2050000000;
      uint64_t v14 = (void *)getSOConfigurationClientClass_softClass;
      uint64_t v46 = getSOConfigurationClientClass_softClass;
      if (!getSOConfigurationClientClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getSOConfigurationClientClass_block_invoke;
        __int16 v48 = &unk_26432A2A8;
        *(void *)BOOL v49 = &v43;
        __getSOConfigurationClientClass_block_invoke((uint64_t)buf);
        uint64_t v14 = (void *)v44[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v43, 8);
      id v16 = [v15 defaultClient];
      id v17 = [(SOAuthorizationCore *)v11->_authorizationCore requestParametersCore];
      uint64_t v18 = [v17 url];
      uint64_t v19 = [(SOAuthorizationCore *)v11->_authorizationCore requestParametersCore];
      id v20 = objc_msgSend(v16, "profileForURL:responseCode:", v18, objc_msgSend(v19, "responseCode"));

      if (v20)
      {
        __int16 v21 = [v20 extensionBundleIdentifier];
        BOOL v22 = +[SOExtensionManager isInternalExtensionBundleIdentifier:v21];

        int v23 = !v22;
      }
      else
      {
        int v23 = 0;
      }
      v36 = SO_LOG_SOAuthorization();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[SOAuthorization _finishAuthorizationWithCredential:error:](v23, (uint64_t)v20, v36);
      }
    }
    id v24 = [(SOAuthorizationCore *)v11->_authorizationCore requestParametersCore];
    uint64_t v25 = [v24 identifier];

    [(SOAuthorizationCore *)v11->_authorizationCore setRequestParametersCore:0];
    objc_sync_exit(v11);

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke;
    v39[3] = &unk_26432A5A8;
    v39[4] = v11;
    id v26 = v25;
    __int16 v40 = v26;
    id v41 = v7;
    id v42 = v6;
    __int16 v27 = (void *)MEMORY[0x21D46DFC0](v39);
    id v28 = v27;
    if (v23)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_64;
      v37[3] = &unk_26432A4B8;
      v37[4] = v11;
      id v38 = v27;
      dispatch_async(MEMORY[0x263EF83A0], v37);
    }
    else
    {
      [(SOAuthorizationCore *)v11->_authorizationCore performBlockOnDelegateQueue:v27];
    }

    id v11 = v26;
  }
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    BOOL v3 = (void *)(a1 + 48);
    if (*(void *)(a1 + 48))
    {
      if ([getSOErrorHelperClass_2() error:*v3 hasCode:-2])
      {
        if (objc_opt_respondsToSelector())
        {
          id v4 = SO_LOG_SOAuthorization();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_10();
          }

          [v2 authorizationDidCancel:*(void *)(a1 + 32)];
        }
        goto LABEL_53;
      }
      if ([getSOErrorHelperClass_2() error:*v3 hasCode:-5])
      {
        if (objc_opt_respondsToSelector())
        {
          id v17 = SO_LOG_SOAuthorization();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
      else
      {
        if (![getSOErrorHelperClass_2() error:*v3 hasCode:-9])
        {
          if (objc_opt_respondsToSelector())
          {
            BOOL v22 = SO_LOG_SOAuthorization();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_13();
            }

            [v2 authorization:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 48)];
          }
          goto LABEL_53;
        }
        if (objc_opt_respondsToSelector())
        {
          id v17 = SO_LOG_SOAuthorization();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
LABEL_25:
          }
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_11();
LABEL_26:

          [v2 authorizationDidNotHandle:*(void *)(a1 + 32)];
        }
      }
LABEL_53:
      uint64_t v29 = SO_LOG_SOAuthorization();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_2();
      }

      uint64_t v31 = *(void **)(a1 + 32);
      uint64_t v30 = *(void **)(a1 + 40);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_63;
      v34[3] = &unk_26432AB90;
      v34[4] = v31;
      id v35 = v30;
      [v31 _finishAuthorization:v35 completion:v34];

      goto LABEL_56;
    }
    id v6 = *(void **)(a1 + 56);
    if (!v6)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v18 = SO_LOG_SOAuthorization();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_3();
        }

        [v2 authorizationDidComplete:*(void *)(a1 + 32)];
      }
      goto LABEL_53;
    }
    id v7 = [v6 secKeyProxyEndpoints];

    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_53;
      }
      id v8 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = [*(id *)(a1 + 56) secKeyProxyEndpoints];
      id v36 = 0;
      __int16 v10 = [v8 createSecKeysFromSecKeyProxyEndpoints:v9 error:&v36];
      id v11 = v36;

      if (v10)
      {
        __int16 v12 = objc_alloc_init(SOAuthorizationResult);
        BOOL v13 = [*(id *)(a1 + 56) httpAuthorizationHeaders];
        [(SOAuthorizationResult *)v12 setHttpAuthorizationHeaders:v13];

        uint64_t v14 = [*(id *)(a1 + 56) httpResponse];
        [(SOAuthorizationResult *)v12 setHttpResponse:v14];

        id v15 = [*(id *)(a1 + 56) httpBody];
        [(SOAuthorizationResult *)v12 setHttpBody:v15];

        [(SOAuthorizationResult *)v12 setPrivateKeys:v10];
        id v16 = SO_LOG_SOAuthorization();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_9();
        }

        [v2 authorization:*(void *)(a1 + 32) didCompleteWithAuthorizationResult:v12];
      }
      else
      {
        __int16 v27 = SO_LOG_SOAuthorization();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_8((uint64_t)v11, v27);
        }

        if (objc_opt_respondsToSelector())
        {
          id v28 = SO_LOG_SOAuthorization();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4();
          }

          [v2 authorization:*(void *)(a1 + 32) didCompleteWithError:v11];
        }
      }
    }
    else
    {
      uint64_t v19 = [*(id *)(a1 + 56) httpAuthorizationHeaders];

      if (v19)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_53;
        }
        id v20 = SO_LOG_SOAuthorization();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_6();
        }

        uint64_t v21 = *(void *)(a1 + 32);
        id v11 = [*(id *)(a1 + 56) httpAuthorizationHeaders];
        [v2 authorization:v21 didCompleteWithHTTPAuthorizationHeaders:v11];
      }
      else
      {
        int v23 = [*(id *)(a1 + 56) httpResponse];

        if (!v23)
        {
          if (objc_opt_respondsToSelector())
          {
            uint64_t v32 = [getSOErrorHelperClass_2() errorWithCode:-1000 message:@"Invalid credential"];
            uint64_t v33 = SO_LOG_SOAuthorization();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4();
            }

            [v2 authorization:*(void *)(a1 + 32) didCompleteWithError:v32];
          }
          goto LABEL_53;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_53;
        }
        id v24 = SO_LOG_SOAuthorization();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_5();
        }

        uint64_t v25 = *(void *)(a1 + 32);
        id v11 = [*(id *)(a1 + 56) httpResponse];
        id v26 = [*(id *)(a1 + 56) httpBody];
        [v2 authorization:v25 didCompleteWithHTTPResponse:v11 httpBody:v26];
      }
    }

    goto LABEL_53;
  }
  id v5 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_1();
  }

LABEL_56:
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_63()
{
  v0 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_63_cold_1();
  }
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_64(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v3 = [v2 applicationState];

  if (v3)
  {
    id v4 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_64_cold_1();
    }

    uint64_t v5 = MEMORY[0x21D46DFC0](*(void *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:*(void *)(a1 + 32) selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

    uint64_t v9 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v10 = [v9 applicationState];

    if (v10)
    {
      dispatch_time_t v11 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_68;
      block[3] = &unk_26432AC58;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v11, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [*(id *)(a1 + 32) _applicationActivationWithTimeout:0];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    BOOL v13 = *(void **)(*(void *)(a1 + 32) + 8);
    [v13 performBlockOnDelegateQueue:v12];
  }
}

uint64_t __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationActivationWithTimeout:1];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorization applicationDidBecomeActive:]((uint64_t)self, v4);
  }

  [(SOAuthorization *)self _applicationActivationWithTimeout:0];
}

- (void)_applicationActivationWithTimeout:(BOOL)a3
{
  if (self->_pendingFinishAuthorizationBlock)
  {
    id v4 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorization _applicationActivationWithTimeout:]();
    }

    [(SOAuthorizationCore *)self->_authorizationCore performBlockOnDelegateQueue:self->_pendingFinishAuthorizationBlock];
    id pendingFinishAuthorizationBlock = self->_pendingFinishAuthorizationBlock;
    self->_id pendingFinishAuthorizationBlock = 0;

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self];
  }
}

- (void)_extensionCleanup
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    extensionViewController = self->_extensionViewController;
    authorizationViewController = self->_authorizationViewController;
    int v11 = 136316162;
    uint64_t v12 = "-[SOAuthorization _extensionCleanup]";
    __int16 v13 = 2114;
    uint64_t v14 = extension;
    __int16 v15 = 2114;
    id v16 = extensionViewController;
    __int16 v17 = 2114;
    uint64_t v18 = authorizationViewController;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@, extensionViewController = %{public}@, authorizationViewController = %{public}@ on %@", (uint8_t *)&v11, 0x34u);
  }

  id v7 = self->_extension;
  if (v7)
  {
    [(SOExtension *)v7 unload];
    id v8 = self->_extension;
    self->_extension = 0;
  }
  uint64_t v9 = self->_extensionViewController;
  self->_extensionViewController = 0;

  uint64_t v10 = self->_authorizationViewController;
  self->_authorizationViewController = 0;
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315907;
    uint64_t v12 = "-[SOAuthorization authorization:didCompleteWithCredential:error:]";
    __int16 v13 = 2113;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = self;
    _os_log_impl(&dword_2185C9000, v9, OS_LOG_TYPE_DEFAULT, "%s %{private}@, %{public}@ on %@", (uint8_t *)&v11, 0x2Au);
  }

  if (v7) {
    uint64_t v10 = (void *)[objc_alloc((Class)getSOAuthorizationCredentialCoreClass()) initWithAuthorizationCredential:v7];
  }
  else {
    uint64_t v10 = 0;
  }
  [(SOAuthorization *)self _finishAuthorizationWithCredential:v10 error:v8];
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2050000000;
    __int16 v13 = (void *)getSOUIAuthorizationViewControllerClass_softClass;
    uint64_t v27 = getSOUIAuthorizationViewControllerClass_softClass;
    if (!getSOUIAuthorizationViewControllerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSOUIAuthorizationViewControllerClass_block_invoke;
      uint64_t v29 = &unk_26432A2A8;
      uint64_t v30 = &v24;
      __getSOUIAuthorizationViewControllerClass_block_invoke((uint64_t)buf);
      __int16 v13 = (void *)v25[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v24, 8);
    __int16 v15 = (SOUIAuthorizationViewController *)[[v14 alloc] initWithExtensionViewController:self->_extensionViewController hints:v8];
    authorizationViewController = self->_authorizationViewController;
    self->_authorizationViewController = v15;

    [(SOUIAuthorizationViewController *)self->_authorizationViewController setDelegate:self];
    __int16 v17 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]();
    }

    uint64_t v18 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]();
    }

    uint64_t v19 = self->_authorizationViewController;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke;
    v22[3] = &unk_26432A710;
    id v23 = v10;
    [WeakRetained authorization:self presentViewController:v19 withCompletion:v22];
    id v20 = v23;
    goto LABEL_15;
  }
  uint64_t v21 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[SOAuthorization presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]();
  }

  if (v10)
  {
    id v20 = [getSOErrorHelperClass_2() internalErrorWithMessage:@"no authorization delegate"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
LABEL_15:
  }
}

void __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1(a2, (uint64_t)v5, v6);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)viewControllerDidCancel:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (SOUIAuthorizationViewController *)a3;
  id v5 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    authorizationViewController = self->_authorizationViewController;
    int v7 = 136315906;
    id v8 = "-[SOAuthorization viewControllerDidCancel:]";
    __int16 v9 = 2114;
    id v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = authorizationViewController;
    __int16 v13 = 2112;
    id v14 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s viewController = %{public}@, authorizationViewController = %{public}@ on %@", (uint8_t *)&v7, 0x2Au);
  }

  if (self->_authorizationViewController == v4) {
    [(SOAuthorization *)self _cancelAuthorization];
  }
}

- (SOAuthorizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SOAuthorizationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableEmbeddedAuthorizationViewController
{
  return self->_enableEmbeddedAuthorizationViewController;
}

- (void)setEnableEmbeddedAuthorizationViewController:(BOOL)a3
{
  self->_BOOL enableEmbeddedAuthorizationViewController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_pendingFinishAuthorizationBlock, 0);
  objc_storeStrong((id *)&self->_authorizationViewController, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_authorizationCore, 0);
}

+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v5 = a4;
  if (AppSSOCoreLibraryCore())
  {
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    long long v6 = *(_OWORD *)&a3->var0[4];
    long long v10 = *(_OWORD *)a3->var0;
    long long v11 = v6;
    activity_block[2] = __72__SOAuthorization_Process__isExtensionProcessWithAuditToken_completion___block_invoke;
    activity_block[3] = &unk_26432ACD0;
    id v9 = v5;
    _os_activity_initiate(&dword_2185C9000, "isExtensionProcessWithAuditToken", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    int v7 = SO_LOG_SOAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v5) {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
}

uint64_t __72__SOAuthorization_Process__isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1)
{
  id SOAuthorizationCoreClass = getSOAuthorizationCoreClass();
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  return [SOAuthorizationCoreClass isExtensionProcessWithAuditToken:v6 completion:v3];
}

- (id)realms
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SOAuthorization(Kerberos) realms]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  long long v4 = [(SOAuthorizationCore *)self->_authorizationCore realms];
  return v4;
}

- (id)kerberosProfiles
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SO_LOG_SOAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SOAuthorization(Kerberos) kerberosProfiles]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  long long v4 = [(SOAuthorizationCore *)self->_authorizationCore kerberosProfiles];
  return v4;
}

+ (void)canPerformAuthorizationWithURL:responseCode:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "AppSSOCore is not available", v2, v3, v4, v5, v6);
}

- (void)_finishAuthorization:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 136315650;
  uint64_t v4 = "-[SOAuthorization _finishAuthorization:completion:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "%s extension = %@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)_finishAuthorizationWithCredential:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2185C9000, a2, a3, "%@ already finished => ignoring finish request", a5, a6, a7, a8, 2u);
}

- (void)_finishAuthorizationWithCredential:(NSObject *)a3 error:.cold.2(char a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109379;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2113;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_8_0(&dword_2185C9000, a2, a3, "checkApplicationStateBeforeFinishing = %d, profile = %{private}@", v3, (void)v4, HIWORD(a2), *MEMORY[0x263EF8340]);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_2185C9000, v0, OS_LOG_TYPE_ERROR, "no SPI authorization delegate, identifier = %{public}@", v1, 0xCu);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "finished SPI authorization delegate call: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorizationDidComplete: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError:  identifier = %{public}@ (error = %{public}@)");
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPResponse:httpBody: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPAuthorizationHeaders: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2185C9000, a2, OS_LOG_TYPE_ERROR, "failed to create SecKeys from SecKeyProxyEndpoints: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_9()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithAuthorizationResult: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorizationDidCancel: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorizationDidNotHandle: identifier = %{public}@", v2, v3, v4, v5, v6);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_cold_13()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError: identifier = %{public}@ (error = %{public}@)");
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_63_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_1();
  _os_log_debug_impl(&dword_2185C9000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ has finished: identifier = %{public}@", v1, 0x16u);
}

void __60__SOAuthorization__finishAuthorizationWithCredential_error___block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2185C9000, v0, OS_LOG_TYPE_DEBUG, "application not active => authorization pending until application activation", v1, 2u);
}

- (void)applicationDidBecomeActive:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SOAuthorization applicationDidBecomeActive:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)_applicationActivationWithTimeout:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "application activation %@=> finishing pending authorization", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "no SPI authorization delegate", v2, v3, v4, v5, v6);
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2185C9000, v0, OS_LOG_TYPE_DEBUG, "calling SPI authorization delegate authorization:presentViewController:withCompletion:", v1, 2u);
}

- (void)presentAuthorizationViewControllerWithHints:requestIdentifier:completion:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "extensionViewController = %{public}@, authorizationViewController = %{public}@");
}

void __92__SOAuthorization_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2114;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_8_0(&dword_2185C9000, a2, a3, "finished SPI authorization delegate authorization:presentViewController:withCompletion: (success = %d, error = %{public}@)", v3, (void)v4, HIWORD(a2), *MEMORY[0x263EF8340]);
}

@end