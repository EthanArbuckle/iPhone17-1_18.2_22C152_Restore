@interface SOExtension
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForSession;
- (BOOL)hasAssociatedDomainsApproved;
- (BOOL)hasURLApprovedAssociatedDomain:(id)a3 cache:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExtension:(id)a3;
- (NSArray)associatedDomains;
- (NSArray)authenticationMethods;
- (NSExtension)extension;
- (NSObject)associatedDomainLock;
- (NSObject)extensionDelegatesLock;
- (NSObject)requestCountLock;
- (NSObject)sessionIDLock;
- (NSString)containerAppBundleIdentifier;
- (NSString)containerAppPath;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (NSString)localizedExtensionDisplayName;
- (SOExtension)initWithExtension:(id)a3;
- (id)_contextForSession;
- (id)findDelegateForIdentifier:(id)a3;
- (int)requestCount;
- (int64_t)extensionRequestsMode;
- (void)_beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)_beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4;
- (void)_connectContextToSessionWithRequestIdentifier:(id)a3 completion:(id)a4;
- (void)_finishAuthorization:(id)a3 withCompletion:(id)a4;
- (void)_finishedSettingUpSession:(id)a3;
- (void)_setupExtension;
- (void)_setupNonUISessionIfNecessaryWithCompletion:(id)a3;
- (void)_setupNonUISessionWithCompletion:(id)a3;
- (void)_setupSessionHelperForIOSWithCompletion:(id)a3;
- (void)_setupSessionIfNecessaryWithCompletion:(id)a3;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4;
- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5;
- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7;
- (void)canPerformRegistrationCompletion:(id)a3;
- (void)cancelAuthorization:(id)a3 completion:(id)a4;
- (void)checkAssociatedDomainsWithCache:(id)a3;
- (void)checkAssociatedDomainsWithCompletion:(id)a3;
- (void)decrementRequestCount;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)incrementRequestCount;
- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6;
- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5;
- (void)protocolVersionCompletion:(id)a3;
- (void)registrationDidCancelWithCompletion:(id)a3;
- (void)registrationDidCompleteWithCompletion:(id)a3;
- (void)removeDelegateForRequestIdentifier:(id)a3;
- (void)removeExpiredEntriesFromCache:(id)a3;
- (void)requestAuthorizationViewControllerWithCompletion:(id)a3;
- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4;
- (void)saveDelegate:(id)a3 forRequestIdentifier:(id)a4;
- (void)setAssociatedDomainLock:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionDelegatesLock:(id)a3;
- (void)setRequestCountLock:(id)a3;
- (void)setSessionIDLock:(id)a3;
- (void)setupNonUISessionWithCompletion:(id)a3;
- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3;
- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3;
- (void)supportedGrantTypesCompletion:(id)a3;
- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3;
- (void)unload;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SOExtension

- (SOExtension)initWithExtension:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SOExtension;
  v6 = [(SOExtension *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v7->_requestCount = 0;
    associatedDomains = v7->_associatedDomains;
    v7->_associatedDomains = 0;

    v9 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    sessionIDLock = v7->_sessionIDLock;
    v7->_sessionIDLock = v9;

    v11 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    requestCountLock = v7->_requestCountLock;
    v7->_requestCountLock = v11;

    v13 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    associatedDomainLock = v7->_associatedDomainLock;
    v7->_associatedDomainLock = v13;

    v15 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    extensionDelegatesLock = v7->_extensionDelegatesLock;
    v7->_extensionDelegatesLock = v15;

    v17 = NSString;
    v18 = [(SOExtension *)v7 localizedExtensionDisplayName];
    v19 = [v17 stringWithFormat:@"com.apple.AppSSO.extension-queue-(%@)", v18];

    id v20 = v19;
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 cStringUsingEncoding:4], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v21;

    v23 = NSString;
    v24 = [(SOExtension *)v7 localizedExtensionDisplayName];
    v25 = [v23 stringWithFormat:@"com.apple.PlatformSSO.extension-queue-(%@)", v24];

    id v26 = v25;
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 cStringUsingEncoding:4], 0);
    pssoQueue = v7->_pssoQueue;
    v7->_pssoQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    extensionDelegates = v7->_extensionDelegates;
    v7->_extensionDelegates = (NSMapTable *)v29;

    [(SOExtension *)v7 _setupExtension];
  }

  return v7;
}

- (int)requestCount
{
  v2 = self;
  v3 = [(SOExtension *)self requestCountLock];
  objc_sync_enter(v3);
  LODWORD(v2) = v2->_requestCount;
  objc_sync_exit(v3);

  return (int)v2;
}

- (void)incrementRequestCount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(SOExtension *)self requestCountLock];
  objc_sync_enter(v3);
  ++self->_requestCount;
  v4 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithInt:self->_requestCount];
    int v6 = 136315650;
    v7 = "-[SOExtension incrementRequestCount]";
    __int16 v8 = 2114;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "%s count now %{public}@ on %@", (uint8_t *)&v6, 0x20u);
  }
  objc_sync_exit(v3);
}

- (void)decrementRequestCount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(SOExtension *)self requestCountLock];
  objc_sync_enter(v3);
  --self->_requestCount;
  v4 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithInt:self->_requestCount];
    int v6 = 136315650;
    v7 = "-[SOExtension decrementRequestCount]";
    __int16 v8 = 2114;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "%s count now %{public}@ on %@", (uint8_t *)&v6, 0x20u);
  }
  objc_sync_exit(v3);
}

- (void)_setupExtension
{
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x263EF8330];
  objc_copyWeak(&v5, &location);
  v3 = [(SOExtension *)self extension];
  [v3 setRequestInterruptionBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__SOExtension__setupExtension__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = WeakRetained[2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__SOExtension__setupExtension__block_invoke_2;
    v7[3] = &unk_26432A408;
    __int16 v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __30__SOExtension__setupExtension__block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__SOExtension__setupExtension__block_invoke_2_cold_2();
  }

  id v3 = [*(id *)(a1 + 32) sessionIDLock];
  objc_sync_enter(v3);
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_exit(v3);

  if ([v4 isEqual:*(void *)(a1 + 40)])
  {
    id v5 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __30__SOExtension__setupExtension__block_invoke_2_cold_1();
    }

    int v6 = [*(id *)(a1 + 32) sessionIDLock];
    objc_sync_enter(v6);
    v7 = *(void **)(*(void *)(a1 + 32) + 8);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;

    objc_sync_exit(v6);
    __int16 v8 = [*(id *)(a1 + 32) extensionDelegatesLock];
    objc_sync_enter(v8);
    id v9 = NSAllMapTableKeys(*(NSMapTable **)(*(void *)(a1 + 32) + 40));
    objc_sync_exit(v8);

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          v15 = *(void **)(a1 + 32);
          v16 = objc_msgSend(getSOErrorHelperClass_0(), "errorWithCode:message:", -3, @"connection to extension interrupted", (void)v17);
          [v15 authorization:v14 didCompleteWithCredential:0 error:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

- (void)saveDelegate:(id)a3 forRequestIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[SOExtension saveDelegate:forRequestIdentifier:]";
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2112;
    long long v17 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v12, 0x20u);
  }

  id v9 = [(SOExtension *)self extensionDelegatesLock];
  objc_sync_enter(v9);
  [(NSMapTable *)self->_extensionDelegates setObject:v6 forKey:v7];
  id v10 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMapTable count](self->_extensionDelegates, "count"));
    int v12 = 136315650;
    uint64_t v13 = "-[SOExtension saveDelegate:forRequestIdentifier:]";
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2112;
    long long v17 = self;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "%s current delegate: %{public}@ on %@", (uint8_t *)&v12, 0x20u);
  }
  objc_sync_exit(v9);
}

- (id)findDelegateForIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[SOExtension findDelegateForIdentifier:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v9, 0x20u);
  }

  id v6 = [(SOExtension *)self extensionDelegatesLock];
  objc_sync_enter(v6);
  id v7 = [(NSMapTable *)self->_extensionDelegates objectForKey:v4];
  objc_sync_exit(v6);

  return v7;
}

- (void)removeDelegateForRequestIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[SOExtension removeDelegateForRequestIdentifier:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v9, 0x20u);
  }

  id v6 = [(SOExtension *)self extensionDelegatesLock];
  objc_sync_enter(v6);
  [(NSMapTable *)self->_extensionDelegates removeObjectForKey:v4];
  id v7 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMapTable count](self->_extensionDelegates, "count"));
    int v9 = 136315650;
    id v10 = "-[SOExtension removeDelegateForRequestIdentifier:]";
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s current delegates: %{public}@ on %@", (uint8_t *)&v9, 0x20u);
  }
  objc_sync_exit(v6);
}

- (void)setupNonUISessionWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SOExtension setupNonUISessionWithCompletion:]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SOExtension_setupNonUISessionWithCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __47__SOExtension_setupNonUISessionWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupNonUISessionIfNecessaryWithCompletion:*(void *)(a1 + 40)];
}

- (void)requestAuthorizationViewControllerWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SOExtension requestAuthorizationViewControllerWithCompletion:]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SOExtension_requestAuthorizationViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __64__SOExtension_requestAuthorizationViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupSessionIfNecessaryWithCompletion:*(void *)(a1 + 40)];
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 136315650;
    long long v17 = "-[SOExtension beginAuthorizationWithRequestParameters:completion:]";
    __int16 v18 = 2114;
    long long v19 = v9;
    __int16 v20 = 2112;
    dispatch_queue_t v21 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SOExtension_beginAuthorizationWithRequestParameters_completion___block_invoke;
  block[3] = &unk_26432A4E0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

uint64_t __66__SOExtension_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginAuthorizationWithRequestParameters:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SOExtension beginAuthorizationWithServiceXPCEndpoint:completion:]";
    __int16 v17 = 2112;
    __int16 v18 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SOExtension_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
  block[3] = &unk_26432A4E0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __67__SOExtension_beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginAuthorizationWithServiceXPCEndpoint:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SOExtension cancelAuthorization:completion:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke;
  block[3] = &unk_26432A558;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v16 = 0;
  id v3 = [v2 remoteContextWithError:&v16];
  id v4 = v16;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_2(a1, v6);
    }

    id v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke_13;
    v12[3] = &unk_26432A530;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v14 = v9;
    id v15 = *(id *)(a1 + 48);
    [v3 cancelAuthorization:v8 completion:v12];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      id v11 = [getSOErrorHelperClass_0() errorWithCode:-2];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

      [*(id *)(a1 + 32) decrementRequestCount];
    }
  }
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_cancelAuthorization_completion___block_invoke_2;
  block[3] = &unk_26432A508;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__SOExtension_cancelAuthorization_completion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__SOExtension_cancelAuthorization_completion___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 56) decrementRequestCount];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke;
  v14[3] = &unk_26432A580;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) findDelegateForIdentifier:*(void *)(a1 + 40)];
  id v3 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1();
  }

  [v2 presentAuthorizationViewControllerWithHints:*(void *)(a1 + 48) requestIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SOExtension *)self findDelegateForIdentifier:v8];
  id v12 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413059;
    v24 = v11;
    __int16 v25 = 2113;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    id v30 = v10;
    _os_log_impl(&dword_2185C9000, v12, OS_LOG_TYPE_DEFAULT, "Notifying delegate %@ that extension has finished with credential: %{private}@, identifier: %{public}@, error: %{public}@", buf, 0x2Au);
  }

  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__SOExtension_authorization_didCompleteWithCredential_error___block_invoke;
  v18[3] = &unk_26432A5A8;
  id v19 = v11;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v11;
  dispatch_async(queue, v18);
}

uint64_t __61__SOExtension_authorization_didCompleteWithCredential_error___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 authorization:v4 didCompleteWithCredential:v5 error:v6];
  }
  return result;
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v16 = "-[SOExtension finishAuthorization:completion:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SOExtension_finishAuthorization_completion___block_invoke;
  block[3] = &unk_26432A4E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __46__SOExtension_finishAuthorization_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishAuthorization:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_finishAuthorization:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[SOExtension _finishAuthorization:withCompletion:]";
    __int16 v20 = 2114;
    id v21 = v6;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  id v9 = [(SOExtension *)self _contextForSession];
  id v17 = 0;
  id v10 = [v9 remoteContextWithError:&v17];
  id v11 = v17;
  id v12 = SO_LOG_SOExtension();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    v7[2](v7, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SOExtension _finishAuthorization:withCompletion:]();
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__SOExtension__finishAuthorization_withCompletion___block_invoke;
    v14[3] = &unk_26432A5F8;
    v14[4] = self;
    id v16 = v7;
    id v15 = v6;
    [v10 finishAuthorization:v15 completion:v14];
  }
}

void __51__SOExtension__finishAuthorization_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2;
  block[3] = &unk_26432A5D0;
  char v14 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  id v13 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) decrementRequestCount];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  return [*(id *)(a1 + 40) removeDelegateForRequestIdentifier:*(void *)(a1 + 48)];
}

- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  uint64_t v6 = [(SOExtension *)self findDelegateForIdentifier:a3];
  if (self->_remoteViewController && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 requestReauthenticationWithCompletion:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

- (void)_setupNonUISessionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = (SOExtension *)"-[SOExtension _setupNonUISessionIfNecessaryWithCompletion:]";
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  [(SOExtension *)self incrementRequestCount];
  uint64_t v6 = [(SOExtension *)self sessionIDLock];
  objc_sync_enter(v6);
  sessionID = self->_sessionID;
  objc_sync_exit(v6);

  id v8 = SO_LOG_SOExtension();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (sessionID)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Using existing session for extension %@", buf, 0xCu);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Setting up new session for extension %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__SOExtension__setupNonUISessionIfNecessaryWithCompletion___block_invoke;
    v10[3] = &unk_26432A620;
    v10[4] = self;
    uint64_t v11 = v4;
    [(SOExtension *)self _setupNonUISessionWithCompletion:v10];
  }
}

void __59__SOExtension__setupNonUISessionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Finished setting up new session for extension %{public}@ with error %{public}@ and session ID %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) decrementRequestCount];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) sessionIDLock];
    objc_sync_enter(v10);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = [v11 _contextForSession];
    [v12 setContextExtension:v11];

    objc_sync_exit(v10);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_setupSessionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, SORemoteExtensionViewController *, void))a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOExtension _setupSessionIfNecessaryWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  [(SOExtension *)self incrementRequestCount];
  id v6 = [(SOExtension *)self sessionIDLock];
  objc_sync_enter(v6);
  id v7 = self->_sessionID;
  objc_sync_exit(v6);

  if (!v7) {
    goto LABEL_8;
  }
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Using existing session for extension %@", buf, 0xCu);
  }

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    v4[2](v4, remoteViewController, 0);
  }
  else
  {
LABEL_8:
    id v10 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "Setting up new session for extension %@", buf, 0xCu);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v17 = __Block_byref_object_copy__0;
    id v18 = __Block_byref_object_dispose__0;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__SOExtension__setupSessionIfNecessaryWithCompletion___block_invoke;
    v13[3] = &unk_26432A648;
    v13[4] = self;
    uint64_t v14 = v4;
    __int16 v15 = buf;
    [(SOExtension *)self _setupSessionWithCompletion:v13];
    uint64_t v11 = *(NSObject **)(*(void *)&buf[8] + 40);
    dispatch_time_t v12 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v11, v12);

    _Block_object_dispose(buf, 8);
  }
}

void __54__SOExtension__setupSessionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Finished setting up new session for extension %{public}@ with error %{public}@ and session ID %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) decrementRequestCount];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) sessionIDLock];
    objc_sync_enter(v10);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    uint64_t v11 = *(void **)(a1 + 32);
    dispatch_time_t v12 = [v11 _contextForSession];
    [v12 setContextExtension:v11];

    objc_sync_exit(v10);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (void)_finishedSettingUpSession:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[SOExtension _finishedSettingUpSession:]";
    __int16 v11 = 2112;
    dispatch_time_t v12 = self;
    _os_log_impl(&dword_2185C9000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [(SOExtension *)self sessionIDLock];
  objc_sync_enter(v7);
  objc_storeStrong((id *)&self->_sessionID, a3);
  id v8 = [(SOExtension *)self _contextForSession];
  [v8 setContextExtension:self];

  objc_sync_exit(v7);
}

- (void)_setupNonUISessionWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SOExtension *)self extension];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "Beginning request for extension %@", buf, 0xCu);
  }
  id v7 = [(SOExtension *)self extension];
  id v11 = 0;
  id v8 = [v7 beginExtensionRequestWithInputItems:0 error:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(SOExtension *)self _setupNonUISessionWithCompletion:v10];
    }

    v4[2](v4, 0, v9);
  }
  else if (v4)
  {
    ((void (**)(id, void *, id))v4)[2](v4, v8, 0);
  }
}

- (void)_setupSessionHelperForIOSWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SOExtension *)self extension];
    *(_DWORD *)buf = 138412290;
    dispatch_time_t v12 = v6;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "Instantiating view controller %@", buf, 0xCu);
  }
  id v7 = [(SOExtension *)self extension];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke;
  v9[3] = &unk_26432A670;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] listenerEndpoint:0 connectionHandler:v9];
}

void __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
    [*(id *)(a1 + 32) _connectContextToSessionWithRequestIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (void)_connectContextToSessionWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "Passing session ID to remote view", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  remoteViewController = self->_remoteViewController;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke;
  v16[3] = &unk_26432A698;
  id v10 = v6;
  id v17 = v10;
  id v18 = buf;
  id v11 = [(_UIRemoteViewController *)remoteViewController serviceViewControllerProxyWithErrorHandler:v16];
  if (v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_23;
    v13[3] = &unk_26432A6C0;
    id v15 = v7;
    id v14 = v10;
    [v11 connectToContextWithSessionID:v14 completion:v13];
  }
  else
  {
    dispatch_time_t v12 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SOExtension _connectContextToSessionWithRequestIdentifier:completion:]();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, *((void *)v20 + 5));
  }

  _Block_object_dispose(buf, 8);
}

void __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [(SOExtension *)self _contextForSession];
  id v15 = 0;
  id v9 = [v8 remoteContextWithError:&v15];
  id v10 = v15;
  id v11 = SO_LOG_SOExtension();
  dispatch_time_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SOExtension _beginAuthorizationWithRequestParameters:completion:]();
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke;
    v13[3] = &unk_26432A710;
    id v14 = v7;
    [v9 beginAuthorizationWithRequestParameters:v6 completion:v13];
  }
}

void __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2;
  block[3] = &unk_26432A6E8;
  char v10 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_beginAuthorizationWithServiceXPCEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = [(SOExtension *)self _contextForSession];
  id v15 = 0;
  id v9 = [v8 remoteContextWithError:&v15];
  id v10 = v15;
  id v11 = SO_LOG_SOExtension();
  dispatch_time_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    v7[2](v7, 0, v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SOExtension _beginAuthorizationWithServiceXPCEndpoint:completion:]();
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke;
    v13[3] = &unk_26432A710;
    id v14 = v7;
    [v9 beginAuthorizationWithServiceXPCEndpoint:v6 completion:v13];
  }
}

void __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2;
  block[3] = &unk_26432A6E8;
  char v10 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_contextForSession
{
  id v3 = [(SOExtension *)self sessionIDLock];
  objc_sync_enter(v3);
  id v4 = [(SOExtension *)self extension];
  id v5 = [v4 _extensionContextForUUID:self->_sessionID];

  objc_sync_exit(v3);
  return v5;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForSession
{
  id v7 = [(SOExtension *)self _contextForSession];
  id v4 = [v7 _auxiliaryConnection];
  id v5 = v4;
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (void)unload
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SOExtension unload]";
    __int16 v10 = 2112;
    id v11 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  id v4 = [(SOExtension *)self sessionIDLock];
  objc_sync_enter(v4);
  if (self->_sessionID)
  {
    id v5 = [(SOExtension *)self extension];
    [v5 cancelExtensionRequestWithIdentifier:self->_sessionID];

    sessionID = self->_sessionID;
    self->_sessionID = 0;

    remoteViewController = self->_remoteViewController;
    self->_remoteViewController = 0;
  }
  objc_sync_exit(v4);
}

- (NSString)containerAppPath
{
  v2 = [(SOExtension *)self extension];
  id v3 = [v2 _plugIn];
  id v4 = [v3 containingUrl];
  id v5 = [v4 path];

  return (NSString *)v5;
}

- (NSString)localizedExtensionDisplayName
{
  v2 = [(NSExtension *)self->_extension objectForInfoDictionaryKey:*MEMORY[0x263EFFA90]];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)containerAppBundleIdentifier
{
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = [(SOExtension *)self containerAppPath];
  id v4 = [v2 bundleWithPath:v3];
  id v5 = [v4 bundleIdentifier];

  return (NSString *)v5;
}

- (NSString)extensionBundleIdentifier
{
  v2 = [(SOExtension *)self extension];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (int64_t)extensionRequestsMode
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (!_os_feature_enabled_impl()
      || ([(SOExtension *)self extensionBundleIdentifier],
          id v3 = objc_claimAutoreleasedReturnValue(),
          BOOL v4 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v3], v3, !v4))
    {
      id v7 = [(NSExtension *)self->_extension infoDictionary];
      int v8 = [v7 objectForKeyedSubscript:@"NSExtension"];
      id v5 = [v8 objectForKeyedSubscript:@"SOExtensionRequestsMode"];

      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        if ([v5 isEqualToString:@"Concurrent"]) {
          goto LABEL_9;
        }
        if (([v5 isEqualToString:@"Queue"] & 1) == 0)
        {
LABEL_11:
          id v9 = SO_LOG_SOExtension();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 138543362;
            uint64_t v12 = v5;
            _os_log_impl(&dword_2185C9000, v9, OS_LOG_TYPE_DEFAULT, "invalid SOExtensionRequestsMode: %{public}@, using default", (uint8_t *)&v11, 0xCu);
          }
        }
      }
      int64_t v6 = 1;
      goto LABEL_15;
    }
  }
  id v5 = SO_LOG_SOExtension();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
LABEL_9:
    int64_t v6 = 2;
    goto LABEL_15;
  }
  LOWORD(v11) = 0;
  int64_t v6 = 2;
  _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "SOExtensionRequestsModeConcurrent enabled by the feature flag", (uint8_t *)&v11, 2u);
LABEL_15:

  return v6;
}

- (NSArray)authenticationMethods
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(NSExtension *)self->_extension infoDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"NSExtension"];
  BOOL v4 = [v3 objectForKeyedSubscript:@"SOExtensionSSOGrantTypes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v13 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 isEqualToString:@"password"]) {
            [v5 addObject:&unk_26C9B5710];
          }
          if ([v11 isEqualToString:@"urn:ietf:params:oauth:grant-type:jwt-bearer"])
          {
            [v5 addObject:&unk_26C9B5728];
            [v5 addObject:&unk_26C9B5740];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    BOOL v4 = v13;
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)removeExpiredEntriesFromCache:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = objc_msgSend(v3, "allKeys", 0);
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = (void *)MEMORY[0x263EFF910];
          [v11 doubleValue];
          uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
          [v13 timeIntervalSinceNow];
          double v15 = v14;
          [&unk_26C9B56F8 doubleValue];
          if (v15 < v16 || ([v13 timeIntervalSinceNow], v17 > 0.0)) {
            [v3 removeObjectForKey:v10];
          }
        }
        else
        {
          [v3 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)checkAssociatedDomainsWithCache:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v53 = a3;
  if (![(SOExtension *)self hasAssociatedDomainsApproved])
  {
    BOOL v4 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[SOExtension checkAssociatedDomainsWithCache:]";
      __int16 v61 = 2112;
      v62 = self;
      _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
    }

    [(SOExtension *)self removeExpiredEntriesFromCache:v53];
    id v5 = [(SOExtension *)self associatedDomainLock];
    objc_sync_enter(v5);
    associatedDomains = self->_associatedDomains;
    self->_associatedDomains = (NSArray *)MEMORY[0x263EFFA68];

    objc_sync_exit(v5);
    uint64_t v7 = (void *)MEMORY[0x263F018C0];
    uint64_t v8 = [(SOExtension *)self extension];
    uint64_t v9 = [v8 _extensionBundle];
    uint64_t v10 = [v9 bundleURL];
    int v11 = [v7 pluginKitProxyForURL:v10];

    if (v11)
    {
      uint64_t v12 = [v11 containingBundle];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x263F6BD78]);
          double v15 = [v14 initWithServiceType:*MEMORY[0x263F6BD98] applicationIdentifier:v13 domain:0];
          id v58 = 0;
          double v16 = [MEMORY[0x263F6BD70] serviceDetailsWithServiceSpecifier:v15 error:&v58];
          id v17 = v58;
          long long v18 = v17;
          if (v16)
          {
            id v45 = v17;
            id location = (id *)&self->_associatedDomains;
            v48 = v15;
            v49 = self;
            v50 = v13;
            v51 = v12;
            v52 = v11;
            long long v19 = [MEMORY[0x263EFF980] array];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v46 = v16;
            id v20 = v16;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v67 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v55 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  __int16 v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  id v26 = [v25 serviceSpecifier];
                  __int16 v27 = [v26 domainHost];

                  id v28 = [v25 serviceSpecifier];
                  __int16 v29 = [v28 domainPort];

                  if (v29)
                  {
                    id v30 = [v25 serviceSpecifier];
                    uint64_t v31 = [v30 domainPort];
                    uint64_t v32 = [v27 stringByAppendingFormat:@":%@", v31];

                    __int16 v27 = (void *)v32;
                  }
                  if ([v25 isUpdating])
                  {
                    v33 = SO_LOG_SOExtension();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v60 = (const char *)v27;
                      _os_log_impl(&dword_2185C9000, v33, OS_LOG_TYPE_INFO, "Associated domain: %{public}@ is waiting for an update", buf, 0xCu);
                    }
                  }
                  if ([v25 isApproved])
                  {
                    v34 = SO_LOG_SOExtension();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v60 = (const char *)v27;
                      _os_log_impl(&dword_2185C9000, v34, OS_LOG_TYPE_INFO, "Associated domain: %{public}@ is approved", buf, 0xCu);
                    }

                    [v19 addObject:v27];
                    v35 = NSNumber;
                    v36 = [MEMORY[0x263EFF910] date];
                    [v36 timeIntervalSince1970];
                    v37 = objc_msgSend(v35, "numberWithDouble:");
                    [v53 setObject:v37 forKeyedSubscript:v27];
                  }
                  else
                  {
                    v38 = [v53 objectForKeyedSubscript:v27];

                    v39 = SO_LOG_SOExtension();
                    v40 = v39;
                    if (v38)
                    {
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v60 = (const char *)v27;
                        _os_log_impl(&dword_2185C9000, v40, OS_LOG_TYPE_INFO, "Associated domain: %{public}@ is cached", buf, 0xCu);
                      }

                      [v19 addObject:v27];
                    }
                    else
                    {
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v60 = (const char *)v27;
                        _os_log_error_impl(&dword_2185C9000, v40, OS_LOG_TYPE_ERROR, "Associated domain: %{public}@ is not approved", buf, 0xCu);
                      }
                    }
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v67 count:16];
              }
              while (v22);
            }

            v41 = [(SOExtension *)v49 associatedDomainLock];
            objc_sync_enter(v41);
            objc_storeStrong(location, v19);
            objc_sync_exit(v41);

            v42 = SO_LOG_SOExtension();
            int v11 = v52;
            uint64_t v13 = v50;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              v43 = [v52 containingBundle];
              v44 = [v43 bundleURL];
              *(_DWORD *)buf = 138413058;
              v60 = v44;
              __int16 v61 = 2112;
              v62 = (SOExtension *)v19;
              __int16 v63 = 2112;
              v64 = v50;
              __int16 v65 = 2112;
              id v66 = v20;
              _os_log_impl(&dword_2185C9000, v42, OS_LOG_TYPE_INFO, "Associated domain: for app %@: %@, appID: %@, services: %@", buf, 0x2Au);
            }
            uint64_t v12 = v51;
            double v15 = v48;
            long long v18 = v45;
            double v16 = v46;
          }
          else
          {
            long long v19 = SO_LOG_SOExtension();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[SOExtension checkAssociatedDomainsWithCache:]();
            }
          }
        }
        else
        {
          double v15 = SO_LOG_SOExtension();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[SOExtension checkAssociatedDomainsWithCache:](v12, v15);
          }
        }
      }
      else
      {
        uint64_t v13 = SO_LOG_SOExtension();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SOExtension checkAssociatedDomainsWithCache:].cold.4();
        }
      }
    }
    else
    {
      uint64_t v12 = SO_LOG_SOExtension();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOExtension checkAssociatedDomainsWithCache:](self, v12);
      }
    }
  }
}

- (void)checkAssociatedDomainsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F018C0];
  uint64_t v6 = [(SOExtension *)self extension];
  uint64_t v7 = [v6 _extensionBundle];
  uint64_t v8 = [v7 bundleURL];
  uint64_t v9 = [v5 pluginKitProxyForURL:v8];

  if (v9)
  {
    uint64_t v10 = [v9 containingBundle];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [v10 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x263F6BD78]);
        uint64_t v13 = (void *)[v12 initWithServiceType:*MEMORY[0x263F6BD98] applicationIdentifier:v11 domain:0];
        id v23 = 0;
        id v14 = [MEMORY[0x263F6BD70] serviceDetailsWithServiceSpecifier:v13 error:&v23];
        id v15 = v23;
        if ([v14 count])
        {
          double v16 = [v14 firstObject];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __52__SOExtension_checkAssociatedDomainsWithCompletion___block_invoke;
          v21[3] = &unk_26432A738;
          id v22 = v4;
          [v16 waitForSiteApprovalWithCompletionHandler:v21];
        }
        else
        {
          id v20 = SO_LOG_SOExtension();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[SOExtension checkAssociatedDomainsWithCache:]();
          }

          (*((void (**)(id, void, id))v4 + 2))(v4, 0, v15);
        }
      }
      else
      {
        long long v19 = SO_LOG_SOExtension();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SOExtension checkAssociatedDomainsWithCache:](v10, v19);
        }

        uint64_t v13 = [getSOErrorHelperClass_0() errorWithCode:-14 message:@"Failed to find extension appID"];
        (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v13);
      }
    }
    else
    {
      long long v18 = SO_LOG_SOExtension();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SOExtension checkAssociatedDomainsWithCache:].cold.4();
      }

      int v11 = [getSOErrorHelperClass_0() errorWithCode:-14 message:@"Failed to find app proxy"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    }
  }
  else
  {
    id v17 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SOExtension checkAssociatedDomainsWithCache:](self, v17);
    }

    uint64_t v10 = [getSOErrorHelperClass_0() errorWithCode:-14 message:@"Failed to find bundle proxy"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __52__SOExtension_checkAssociatedDomainsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 siteApprovalState] || objc_msgSend(v9, "userApprovalState"))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id SOErrorHelperClass_0 = getSOErrorHelperClass_0();
    if (v5) {
      [SOErrorHelperClass_0 errorWithCode:-15 message:@"Associated domain check failed" suberror:v5];
    }
    else {
    uint64_t v8 = [SOErrorHelperClass_0 errorWithCode:-15 message:@"Associated domain check failed"];
    }
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
}

- (BOOL)hasURLApprovedAssociatedDomain:(id)a3 cache:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    __int16 v25 = "-[SOExtension hasURLApprovedAssociatedDomain:cache:]";
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2117;
    id v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s url: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  id v9 = [v6 host];
  uint64_t v10 = [v6 port];

  if (v10)
  {
    int v11 = [v6 port];
    uint64_t v12 = [v9 stringByAppendingFormat:@":%@", v11];

    id v9 = (void *)v12;
  }
  uint64_t v13 = [(SOExtension *)self associatedDomains];
  char v14 = [v13 containsObject:v9];

  if (v14)
  {
    BOOL v15 = 1;
  }
  else
  {
    double v16 = [v7 objectForKeyedSubscript:v9];
    id v17 = v16;
    if (v16)
    {
      long long v18 = (void *)MEMORY[0x263EFF910];
      [v16 doubleValue];
      long long v19 = objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
      [v19 timeIntervalSinceNow];
      double v21 = v20;
      [&unk_26C9B56F8 doubleValue];
      BOOL v15 = v21 > v22;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (BOOL)hasAssociatedDomainsApproved
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SOExtension *)self associatedDomainLock];
  objc_sync_enter(v3);
  NSUInteger v4 = [(NSArray *)self->_associatedDomains count];
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(SOExtension *)self extensionBundleIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 1024;
    BOOL v11 = v4 != 0;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_INFO, "%{public}@ hasAssociatedDomainsApproved = %d", (uint8_t *)&v8, 0x12u);
  }
  objc_sync_exit(v3);

  return v4 != 0;
}

- (BOOL)isEqualToExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(SOExtension *)self extensionBundleIdentifier];
  id v6 = [v4 extensionBundleIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SOExtension *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SOExtension *)self isEqualToExtension:v5];

  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SOExtension *)self extensionBundleIdentifier];
  BOOL v6 = [(NSExtension *)self->_extension _extensionBundle];
  id v7 = [v6 bundleURL];
  int v8 = [v7 path];
  id v9 = [v3 stringWithFormat:@"<%@:%p, bundleID=%@, path=%@, associatedDomains=%@>", v4, self, v5, v8, self->_associatedDomains];

  return (NSString *)v9;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v20 = "-[SOExtension viewServiceDidTerminateWithError:]";
    __int16 v21 = 2112;
    double v22 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (v4)
  {
    BOOL v6 = [(SOExtension *)self extensionDelegatesLock];
    objc_sync_enter(v6);
    id v7 = NSAllMapTableKeys(self->_extensionDelegates);
    objc_sync_exit(v6);

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          uint64_t v13 = objc_msgSend(getSOErrorHelperClass_0(), "errorWithCode:message:", -3, @"connection to extension interrupted", (void)v14);
          [(SOExtension *)self authorization:v12 didCompleteWithCredential:0 error:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[SOExtension beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = self;
    _os_log_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke;
  v14[3] = &unk_26432A7B0;
  id v16 = v9;
  int64_t v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(pssoQueue, v14);
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v11 = 0;
  id v3 = [v2 remoteContextWithError:&v11];
  id v4 = v11;
  id v5 = SO_LOG_SOExtension();
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) decrementRequestCount];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_cold_1();
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_86;
    v9[3] = &unk_26432A788;
    uint64_t v7 = *(void *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    [v3 beginDeviceRegistrationUsingOptions:v8 extensionData:v7 completion:v9];
  }
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_86(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2;
  block[3] = &unk_26432A760;
  uint64_t v7 = a2;
  id v4 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, block);
}

uint64_t __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) decrementRequestCount];
}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[SOExtension beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    __int16 v28 = 2112;
    id v29 = self;
    _os_log_impl(&dword_2185C9000, v15, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke;
  v20[3] = &unk_26432A7D8;
  v20[4] = self;
  id v21 = v12;
  int v25 = a4;
  id v23 = v14;
  int64_t v24 = a5;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  dispatch_async(pssoQueue, v20);
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v13 = 0;
  id v3 = [v2 remoteContextWithError:&v13];
  id v4 = v13;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_cold_1();
    }

    uint64_t v7 = *(unsigned int *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_88;
    v11[3] = &unk_26432A788;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 64);
    id v12 = *(id *)(a1 + 56);
    [v3 beginUserRegistrationUsingUserName:v8 authenticationMethod:v7 options:v10 extensionData:v9 completion:v11];
  }
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_88(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2;
  block[3] = &unk_26432A760;
  uint64_t v7 = a2;
  id v4 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, block);
}

uint64_t __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) decrementRequestCount];
}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension registrationDidCompleteWithCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  pssoQueue = self->_pssoQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(pssoQueue, v8);
}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_89;
    v8[3] = &unk_26432A6C0;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 registrationDidCompleteWithCompletion:v8];
  }
}

uint64_t __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_89(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_89_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) decrementRequestCount];
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension registrationDidCancelWithCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  [(SOExtension *)self incrementRequestCount];
  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SOExtension_registrationDidCancelWithCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_90;
    v8[3] = &unk_26432A6C0;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 registrationDidCancelWithCompletion:v8];
  }
}

uint64_t __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_90(uint64_t a1)
{
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_90_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) decrementRequestCount];
}

- (void)supportedGrantTypesCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension supportedGrantTypesCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SOExtension_supportedGrantTypesCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __45__SOExtension_supportedGrantTypesCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__SOExtension_supportedGrantTypesCompletion___block_invoke_91;
    v8[3] = &unk_26432A800;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 supportedGrantTypesCompletion:v8];
  }
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_91(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__SOExtension_supportedGrantTypesCompletion___block_invoke_91_cold_1();
  }
}

- (void)protocolVersionCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension protocolVersionCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SOExtension_protocolVersionCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__SOExtension_protocolVersionCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) decrementRequestCount];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __41__SOExtension_protocolVersionCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__SOExtension_protocolVersionCompletion___block_invoke_92;
    v8[3] = &unk_26432A800;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 protocolVersionCompletion:v8];
  }
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_92(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__SOExtension_protocolVersionCompletion___block_invoke_92_cold_1();
  }
}

- (void)canPerformRegistrationCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension canPerformRegistrationCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SOExtension_canPerformRegistrationCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v11 = 0;
  id v3 = [v2 remoteContextWithError:&v11];
  id v4 = v11;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) decrementRequestCount];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_2();
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__SOExtension_canPerformRegistrationCompletion___block_invoke_93;
    v9[3] = &unk_26432A828;
    id v7 = *(id *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v3 canPerformRegistrationCompletion:v9];
    uint64_t v8 = SO_LOG_SOExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_1();
    }
  }
}

uint64_t __48__SOExtension_canPerformRegistrationCompletion___block_invoke_93(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 decrementRequestCount];
}

- (void)supportedDeviceSigningAlgorithmsCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension supportedDeviceSigningAlgorithmsCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_95;
    v8[3] = &unk_26432A850;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 supportedDeviceSigningAlgorithmsCompletion:v8];
  }
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_95(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_95_cold_1();
  }
}

- (void)supportedDeviceEncryptionAlgorithmsCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension supportedDeviceEncryptionAlgorithmsCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_97;
    v8[3] = &unk_26432A850;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 supportedDeviceEncryptionAlgorithmsCompletion:v8];
  }
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_97(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_97_cold_1();
  }
}

- (void)supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SOExtension supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v10 = 0;
  id v3 = [v2 remoteContextWithError:&v10];
  id v4 = v10;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_cold_1();
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_98;
    v8[3] = &unk_26432A850;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v3 supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:v8];
  }
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_98(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_98_cold_1();
  }
}

- (void)keyWillRotateForKeyType:(int64_t)a3 keyProxyEndpoint:(id)a4 extensionData:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke;
  block[3] = &unk_26432A878;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _contextForSession];
  id v13 = 0;
  id v3 = [v2 remoteContextWithError:&v13];
  id v4 = v13;
  id v5 = SO_LOG_SOExtension();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) decrementRequestCount];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_99;
    v11[3] = &unk_26432A800;
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = *(id *)(a1 + 56);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    [v3 keyWillRotateForKeyType:v9 keyProxyEndpoint:v7 extensionData:v8 completion:v11];
  }
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_99(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) decrementRequestCount];
  v2 = SO_LOG_SOExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_99_cold_1();
  }
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSObject)sessionIDLock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionIDLock:(id)a3
{
}

- (NSObject)requestCountLock
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setRequestCountLock:(id)a3
{
}

- (NSObject)associatedDomainLock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setAssociatedDomainLock:(id)a3
{
}

- (NSObject)extensionDelegatesLock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setExtensionDelegatesLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionDelegatesLock, 0);
  objc_storeStrong((id *)&self->_associatedDomainLock, 0);
  objc_storeStrong((id *)&self->_requestCountLock, 0);
  objc_storeStrong((id *)&self->_sessionIDLock, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionDelegates, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_pssoQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

void __30__SOExtension__setupExtension__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2185C9000, v0, OS_LOG_TYPE_ERROR, "Extension interrupted. Nilling out session ID", v1, 2u);
}

void __30__SOExtension__setupExtension__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "interruption handler running", v2, v3, v4, v5, v6);
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to get remote context with error %{public}@", v2, v3, v4, v5, v6);
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2185C9000, a2, OS_LOG_TYPE_DEBUG, "Calling cancelAuthorizationWithCompletion on extension requestIdentifier: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __46__SOExtension_cancelAuthorization_completion___block_invoke_2_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEBUG, "Finished cancelAuthorizationWithCompletion result: %{private}@, error: %{public}@, requestIdentifier: %{public}@ ", v4, 0x20u);
}

void __88__SOExtension_presentAuthorizationViewControllerWithHints_requestIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2185C9000, v1, OS_LOG_TYPE_DEBUG, "Notifying delegate %{public}@ that extension wants to show UI, hints = %{private}@", v2, 0x16u);
}

- (void)_finishAuthorization:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling finishAuthorizationWithCompletion on extension", v2, v3, v4, v5, v6);
}

void __51__SOExtension__finishAuthorization_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_2185C9000, v0, v1, "Finished finishAuthorizationWithCompletion result: %d, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupNonUISessionWithCompletion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 extension];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2185C9000, a3, OS_LOG_TYPE_ERROR, "Request for extension %{public}@ failed with error %{public}@", (uint8_t *)&v6, 0x16u);
}

void __55__SOExtension__setupSessionHelperForIOSWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Failed to instantiate view controller because of %{public}@", v2, v3, v4, v5, v6);
}

- (void)_connectContextToSessionWithRequestIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Session with ID %{public}@ was unable to get remote view service", v2, v3, v4, v5, v6);
}

void __72__SOExtension__connectContextToSessionWithRequestIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "Session with ID %{public}@ was unable to communicate with the remote service because of %{public}@");
}

- (void)_beginAuthorizationWithRequestParameters:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling beginAuthorizationWithRequestParameters on extension", v2, v3, v4, v5, v6);
}

void __67__SOExtension__beginAuthorizationWithRequestParameters_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_2185C9000, v0, v1, "Finished beginAuthorizationWithRequestParameters result: %d, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_beginAuthorizationWithServiceXPCEndpoint:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling beginAuthorizationWithServiceXPCEndpoint on extension", v2, v3, v4, v5, v6);
}

void __68__SOExtension__beginAuthorizationWithServiceXPCEndpoint_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_2185C9000, v0, v1, "Finished beginAuthorizationWithServiceXPCEndpoint result: %d, error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)checkAssociatedDomainsWithCache:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 extension];
  uint64_t v4 = [v3 _extensionBundle];
  uint64_t v5 = [v4 bundleURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, a2, v6, "Associated domain: failed to get extension bundle proxy at path: %{public}@", v7);
}

- (void)checkAssociatedDomainsWithCache:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 bundleURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, a2, v4, "Associated domain: failed to get appID for the app at path: %{public}@", v5);
}

- (void)checkAssociatedDomainsWithCache:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "Associated domain: failed to get service details for the appID: %{public}@ with error: %{public}@");
}

- (void)checkAssociatedDomainsWithCache:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_2185C9000, v0, v1, "Associated domain: failed to get app proxy for extension: %{public}@", v2, v3, v4, v5, v6);
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling beginDeviceRegistrationUsingLoginManager on extension", v2, v3, v4, v5, v6);
}

void __76__SOExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_2185C9000, v2, v3, "Finished beginDeviceRegistrationUsingLoginManager, uint64_t result = %{public}@", v4, v5, v6, v7, v8);
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling beginUserRegistrationUsingLoginManager on extension", v2, v3, v4, v5, v6);
}

void __104__SOExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_2185C9000, v2, v3, "Finished beginUserRegistrationUsingLoginManager, uint64_t result = %{public}@", v4, v5, v6, v7, v8);
}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling registrationDidComplete on extension", v2, v3, v4, v5, v6);
}

void __53__SOExtension_registrationDidCompleteWithCompletion___block_invoke_89_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished registrationDidComplete", v2, v3, v4, v5, v6);
}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling registrationDidCancelWithCompletion on extension", v2, v3, v4, v5, v6);
}

void __51__SOExtension_registrationDidCancelWithCompletion___block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished registrationDidCancelWithCompletion", v2, v3, v4, v5, v6);
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling supportedGrantTypesCompletion on extension", v2, v3, v4, v5, v6);
}

void __45__SOExtension_supportedGrantTypesCompletion___block_invoke_91_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished supportedGrantTypesCompletion", v2, v3, v4, v5, v6);
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling protocolVersionCompletion on extension", v2, v3, v4, v5, v6);
}

void __41__SOExtension_protocolVersionCompletion___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished protocolVersionCompletion", v2, v3, v4, v5, v6);
}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished canPerformRegistration", v2, v3, v4, v5, v6);
}

void __48__SOExtension_canPerformRegistrationCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling canPerformRegistration on extension", v2, v3, v4, v5, v6);
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling supportedDeviceSigningAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
}

void __58__SOExtension_supportedDeviceSigningAlgorithmsCompletion___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished supportedDeviceSigningAlgorithmsCompletion", v2, v3, v4, v5, v6);
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling supportedDeviceEncryptionAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
}

void __61__SOExtension_supportedDeviceEncryptionAlgorithmsCompletion___block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished supportedDeviceEncryptionAlgorithmsCompletion", v2, v3, v4, v5, v6);
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling supportedUserSecureEnclaveKeySigningAlgorithmsCompletion on extension", v2, v3, v4, v5, v6);
}

void __72__SOExtension_supportedUserSecureEnclaveKeySigningAlgorithmsCompletion___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished supportedUserSecureEnclaveKeySigningAlgorithmsCompletion", v2, v3, v4, v5, v6);
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Calling keyWillRotateForKeyType on extension", v2, v3, v4, v5, v6);
}

void __81__SOExtension_keyWillRotateForKeyType_keyProxyEndpoint_extensionData_completion___block_invoke_99_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_2185C9000, v0, v1, "Finished keyWillRotateForKeyType", v2, v3, v4, v5, v6);
}

@end