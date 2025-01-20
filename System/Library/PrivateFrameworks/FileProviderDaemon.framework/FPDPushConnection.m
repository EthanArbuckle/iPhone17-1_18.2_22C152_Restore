@interface FPDPushConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FPDPushConnection)init;
- (FPDPushConnection)initWithExtensionManager:(id)a3;
- (id)_debugTopicsForApplicationIdentifier:(id)a3;
- (id)_pushConnectionWithEnvironmentName:(id)a3;
- (id)clientConnectionsForApplicationBundleIdentifier:(id)a3;
- (id)topicsForApplicationBundleIdentifier:(id)a3;
- (void)addClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)fileProviderRegister;
- (void)fileProviderUnregister;
- (void)performWithConnection:(id)a3 block:(id)a4;
- (void)removeClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4;
- (void)setMessageDelegate:(id)a3 forApplicationBundleIdentifier:(id)a4;
- (void)start;
- (void)updateTopicsForApplicationBundleIdentifier:(id)a3 providerIdentifier:(id)a4 requestToken:(BOOL)a5 environment:(id)a6;
- (void)updateTopicsForBundleIdentifier:(id)a3;
- (void)updateTopicsForProvider:(id)a3;
@end

@implementation FPDPushConnection

- (FPDPushConnection)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should not call this"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDPushConnection init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDPushConnection.m", 78, (const char *)[v2 UTF8String]);
}

- (FPDPushConnection)initWithExtensionManager:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FPDPushConnection;
  v5 = [(FPDPushConnection *)&v26 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("push worker queue", v7);
    pushQueue = v6->_pushQueue;
    v6->_pushQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("push delivery queue", v10);
    payloadDeliveryQueue = v6->_payloadDeliveryQueue;
    v6->_payloadDeliveryQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    messageDelegates = v6->_messageDelegates;
    v6->_messageDelegates = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    clientConnections = v6->_clientConnections;
    v6->_clientConnections = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    bundleIdentifierForTopic = v6->_bundleIdentifierForTopic;
    v6->_bundleIdentifierForTopic = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    topicsForBundleIdentifier = v6->_topicsForBundleIdentifier;
    v6->_topicsForBundleIdentifier = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    providerMonitor = v6->_providerMonitor;
    v6->_providerMonitor = (FPProviderMonitor *)v21;

    uint64_t v23 = objc_opt_new();
    pushConnectionsByEnvironment = v6->_pushConnectionsByEnvironment;
    v6->_pushConnectionsByEnvironment = (NSMutableDictionary *)v23;
  }
  return v6;
}

- (id)_pushConnectionWithEnvironmentName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  v5 = [(NSMutableDictionary *)self->_pushConnectionsByEnvironment objectForKey:v4];
  if (!v5)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F4E1D0]]) {
      uint64_t v6 = @"com.apple.fileprovider.extension.push";
    }
    else {
      uint64_t v6 = @"com.apple.fileprovider.extension.push.development";
    }
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F4E1E8]) initWithEnvironmentName:v4 namedDelegatePort:v6 queue:self->_pushQueue];
    [v5 setDelegate:self];
    [(NSMutableDictionary *)self->_pushConnectionsByEnvironment setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDPushConnection began listening", v1, 2u);
}

id __26__FPDPushConnection_start__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _pushConnectionWithEnvironmentName:*MEMORY[0x1E4F4E1D0]];
  return (id)[*(id *)(a1 + 32) _pushConnectionWithEnvironmentName:*MEMORY[0x1E4F4E1C8]];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (listener_shouldAcceptNewConnection__once != -1) {
    dispatch_once(&listener_shouldAcceptNewConnection__once, &__block_literal_global_24);
  }
  [v7 setExportedInterface:listener_shouldAcceptNewConnection__serverInterface];
  [v7 setRemoteObjectInterface:listener_shouldAcceptNewConnection__clientInterface];
  [v7 setExportedObject:self];
  [v7 resume];
  dispatch_queue_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPDPushConnection listener:shouldAcceptNewConnection:]();
  }

  return 1;
}

uint64_t __56__FPDPushConnection_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2EEDAE8];
  v1 = (void *)listener_shouldAcceptNewConnection__serverInterface;
  listener_shouldAcceptNewConnection__serverInterface = v0;

  listener_shouldAcceptNewConnection__clientInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2EF7388];
  return MEMORY[0x1F41817F8]();
}

- (void)performWithConnection:(id)a3 block:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"[ASSERT] ‼️ %s was called with nil completion block!", "-[FPDPushConnection performWithConnection:block:]");
    v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("-[FPDPushConnection performWithConnection:block:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDPushConnection.m", 149, (const char *)[v27 UTF8String]);
  }
  dispatch_queue_t v8 = (void (**)(void, void, void, void, void))v7;
  v9 = [v6 remoteObjectProxy];
  v10 = objc_msgSend(v6, "fp_bundleIdentifier");
  if (v10)
  {
    p_manager = &self->_manager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    uint64_t v13 = [WeakRetained providerWithIdentifier:v10 reason:0];

    if (v13) {
      goto LABEL_7;
    }
    v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDPushConnection performWithConnection:block:].cold.4();
    }

    id v15 = objc_loadWeakRetained((id *)p_manager);
    uint64_t v13 = [v15 defaultProviderWithTopLevelBundleIdentifier:v10];

    if (v13)
    {
LABEL_7:
      v16 = [v13 descriptor];
      uint64_t v17 = [v16 bundleIdentifierForPushes];

      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__15;
      v41 = __Block_byref_object_dispose__15;
      id v42 = 0;
      v18 = [v6 valueForEntitlement:@"aps-environment"];
      uint64_t v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        id v20 = [v6 valueForEntitlement:@"com.apple.developer.aps-environment"];
      }
      id v42 = v20;

      if ([(id)v38[5] isEqualToString:@"serverPreferred"])
      {
        v22 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.CloudDocs"];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __49__FPDPushConnection_performWithConnection_block___block_invoke;
        v29[3] = &unk_1E6A767D8;
        v36 = &v37;
        id v30 = v6;
        id v31 = v10;
        v35 = v8;
        id v32 = v9;
        id v33 = v17;
        id v34 = v13;
        [v22 serverPreferredPushEnvironmentWithCompletionHandler:v29];
      }
      else
      {
        if (([MEMORY[0x1E4F4E1E8] isValidEnvironment:v38[5]] & 1) == 0)
        {
          uint64_t v23 = fp_current_or_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = v38[5];
            [v6 processIdentifier];
            FPExecutableNameForProcessIdentifier();
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            int v26 = [v6 processIdentifier];
            *(_DWORD *)buf = 138413314;
            uint64_t v44 = v24;
            __int16 v45 = 2112;
            v46 = @"aps-environment";
            __int16 v47 = 2112;
            id v48 = v25;
            __int16 v49 = 1024;
            int v50 = v26;
            __int16 v51 = 2112;
            v52 = v10;
            _os_log_error_impl(&dword_1D744C000, v23, OS_LOG_TYPE_ERROR, "[ERROR] invalid push environment %@ specified in %@ from %@[%d] (requested for %@)", buf, 0x30u);
          }
          ((void (**)(void, void *, void, void, void))v8)[2](v8, v9, 0, 0, 0);
          goto LABEL_21;
        }
        v22 = [v13 identifier];
        ((void (**)(void, void *, void *, void *, uint64_t))v8)[2](v8, v9, v17, v22, v38[5]);
      }

LABEL_21:
      _Block_object_dispose(&v37, 8);

      goto LABEL_22;
    }
    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[FPDPushConnection performWithConnection:block:]();
    }
  }
  else
  {
    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[FPDPushConnection performWithConnection:block:]();
    }
  }

  ((void (**)(void, void *, void, void, void))v8)[2](v8, v9, 0, 0, 0);
LABEL_22:
}

void __49__FPDPushConnection_performWithConnection_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      [*(id *)(a1 + 32) processIdentifier];
      v9 = FPExecutableNameForProcessIdentifier();
      int v10 = [*(id *)(a1 + 32) processIdentifier];
      uint64_t v11 = *(void *)(a1 + 40);
      int v17 = 138413570;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = @"aps-environment";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] could not get push environment %@ specified in %@ from %@[%d] (requested for %@): %@", (uint8_t *)&v17, 0x3Au);
    }
  }
  if (v5) {
    v12 = v5;
  }
  else {
    v12 = (void *)*MEMORY[0x1E4F4E1D0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v12);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  v16 = [*(id *)(a1 + 64) identifier];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v15 + 16))(v15, v13, v14, v16, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
}

- (void)addClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  id v7 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_opt_new();
    [(NSMutableDictionary *)self->_clientConnections setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

- (void)removeClientConnection:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v9 = a4;
  pushQueue = self->_pushQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(pushQueue);
  id v8 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v9];
  [v8 removeObject:v7];

  if (![v8 count]) {
    [(NSMutableDictionary *)self->_clientConnections removeObjectForKey:v9];
  }
}

- (id)clientConnectionsForApplicationBundleIdentifier:(id)a3
{
  pushQueue = self->_pushQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(pushQueue);
  id v6 = [(NSMutableDictionary *)self->_clientConnections objectForKeyedSubscript:v5];

  id v7 = (void *)[v6 copy];
  return v7;
}

- (void)fileProviderRegister
{
}

void __41__FPDPushConnection_fileProviderRegister__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(NSObject **)(v12 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__FPDPushConnection_fileProviderRegister__block_invoke_2;
    block[3] = &unk_1E6A73AC8;
    block[4] = v12;
    id v15 = v9;
    id v16 = v10;
    id v17 = *(id *)(a1 + 32);
    id v18 = v11;
    dispatch_async(v13, block);
  }
  else
  {
    [a2 fileProviderRegistrationFailed];
    [*(id *)(a1 + 32) invalidate];
  }
}

uint64_t __41__FPDPushConnection_fileProviderRegister__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTopicsForBundleIdentifier:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) clientConnectionsForApplicationBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 count];

  if (!v3) {
    [*(id *)(*(void *)(a1 + 32) + 80) addObserver:*(void *)(a1 + 32) forProviderID:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) addClientConnection:*(void *)(a1 + 56) forApplicationBundleIdentifier:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v4 updateTopicsForApplicationBundleIdentifier:v5 providerIdentifier:v6 requestToken:1 environment:v7];
}

- (void)fileProviderUnregister
{
}

void __43__FPDPushConnection_fileProviderUnregister__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(NSObject **)(v12 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__FPDPushConnection_fileProviderUnregister__block_invoke_2;
    block[3] = &unk_1E6A73AC8;
    block[4] = v12;
    id v15 = *(id *)(a1 + 32);
    id v16 = v9;
    id v17 = v10;
    id v18 = v11;
    dispatch_async(v13, block);
  }
  else
  {
    [a2 fileProviderRegistrationFailed];
    [*(id *)(a1 + 32) invalidate];
  }
}

void __43__FPDPushConnection_fileProviderUnregister__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeClientConnection:*(void *)(a1 + 40) forApplicationBundleIdentifier:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) clientConnectionsForApplicationBundleIdentifier:*(void *)(a1 + 48)];
  if (![v2 count]) {
    [*(id *)(*(void *)(a1 + 32) + 80) removeObserver:*(void *)(a1 + 32) forProviderID:*(void *)(a1 + 56)];
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 48)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:MEMORY[0x1E4F1CBF0] forKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) updateTopicsForApplicationBundleIdentifier:*(void *)(a1 + 48) providerIdentifier:*(void *)(a1 + 56) requestToken:0 environment:*(void *)(a1 + 64)];
  id v8 = [*(id *)(a1 + 32) _pushConnectionWithEnvironmentName:*(void *)(a1 + 64)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "invalidateTokenForTopic:identifier:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), &stru_1F2EC3618, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)topicsForApplicationBundleIdentifier:(id)a3
{
  pushQueue = self->_pushQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(pushQueue);
  uint64_t v6 = [(NSMutableDictionary *)self->_topicsForBundleIdentifier objectForKey:v5];

  return v6;
}

- (id)_debugTopicsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  pushQueue = self->_pushQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E6A73418;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(pushQueue, block);
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = [v2 setWithArray:v3];

  id v5 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_2;
  v13[3] = &unk_1E6A76828;
  id v14 = v4;
  id v6 = v4;
  id v7 = [v5 predicateWithBlock:v13];
  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_3;
  v10[3] = &unk_1E6A76850;
  id v11 = *(id *)(a1 + 48);
  id v12 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

uint64_t __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __58__FPDPushConnection__debugTopicsForApplicationIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v6 enabledTopics];
  id v9 = [v8 filteredArrayUsingPredicate:*(void *)(a1 + 40)];
  id v10 = [NSString stringWithFormat:@"%@", v7];
  [v5 setValue:v9 forKey:v10];

  id v11 = *(void **)(a1 + 32);
  id v14 = [v6 opportunisticTopics];

  id v12 = [v14 filteredArrayUsingPredicate:*(void *)(a1 + 40)];
  id v13 = [NSString stringWithFormat:@"%@, opportunistic", v7];

  [v11 setValue:v12 forKey:v13];
}

- (void)updateTopicsForBundleIdentifier:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  id v5 = [NSString stringWithFormat:@"%@.%@", v4, @"pushkit.fileprovider"];
  v30[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  if ([v4 isEqualToString:@"com.apple.FileProvider.TestingHarness"])
  {
    id v7 = [(NSMutableDictionary *)self->_messageDelegates objectForKey:v4];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 customPushTopics];

      id v6 = (void *)v9;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(NSMutableDictionary *)self->_topicsForBundleIdentifier objectForKeyedSubscript:v4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NSMutableDictionary *)self->_bundleIdentifierForTopic removeObjectForKey:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NSMutableDictionary *)self->_bundleIdentifierForTopic setObject:v4 forKey:*(void *)(*((void *)&v20 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_topicsForBundleIdentifier setObject:v15 forKey:v4];
}

- (void)setMessageDelegate:(id)a3 forApplicationBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pushQueue = self->_pushQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__FPDPushConnection_setMessageDelegate_forApplicationBundleIdentifier___block_invoke;
  block[3] = &unk_1E6A73418;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(pushQueue, block);
}

uint64_t __71__FPDPushConnection_setMessageDelegate_forApplicationBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 48) setValue:a1[5] forKey:a1[6]];
}

- (void)updateTopicsForApplicationBundleIdentifier:(id)a3 providerIdentifier:(id)a4 requestToken:(BOOL)a5 environment:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  pushQueue = self->_pushQueue;
  id v13 = a6;
  dispatch_assert_queue_V2(pushQueue);
  uint64_t v14 = [(FPDPushConnection *)self _pushConnectionWithEnvironmentName:v13];

  id v15 = self->_pushQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke;
  block[3] = &unk_1E6A76878;
  block[4] = self;
  id v20 = v10;
  BOOL v23 = a5;
  id v21 = v14;
  id v22 = v11;
  id v16 = v11;
  id v17 = v14;
  id v18 = v10;
  dispatch_async(v15, block);
}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = a1 + 40;
  id v4 = [*(id *)(a1 + 32) topicsForApplicationBundleIdentifier:*(void *)(a1 + 40)];
  id v5 = [v2 setWithArray:v4];

  uint64_t v6 = [*(id *)(v3 + 8) opportunisticTopics];
  id v7 = (void *)v6;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v9 = (void *)v6;
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  uint64_t v11 = [*(id *)(v3 + 8) enabledTopics];
  id v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v8;
  }
  id v14 = v13;

  if (*(unsigned char *)(v3 + 24))
  {
    id v15 = [v5 anyObject];
    int v16 = objc_msgSend(v15, "fp_isCloudDocsPushTopic");

    if (v16)
    {
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_1(v3, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v24 = v5;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_msgSend(*(id *)(a1 + 48), "requestTokenForTopic:identifier:", *(void *)(*((void *)&v36 + 1) + 8 * i), &stru_1F2EC3618, (void)v36);
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v26);
      }

      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_2();
      }
    }
  }
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", v10, (void)v36);
  id v30 = [MEMORY[0x1E4F1CA80] setWithArray:v14];
  if ([MEMORY[0x1E4F25D70] isProviderIDForeground:*(void *)(a1 + 56)])
  {
    [v30 unionSet:v5];
    [v29 minusSet:v5];
  }
  else
  {
    [v30 minusSet:v5];
    [v29 unionSet:v5];
  }
  uint64_t v31 = [v10 count];
  if (v31 != [v29 count] || (uint64_t v32 = objc_msgSend(v14, "count"), v32 != objc_msgSend(v30, "count")))
  {
    id v33 = *(void **)(a1 + 48);
    id v34 = [v30 allObjects];
    v35 = [v29 allObjects];
    [v33 setEnabledTopics:v34 ignoredTopics:MEMORY[0x1E4F1CBF0] opportunisticTopics:v35];
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  id v10 = [(NSMutableDictionary *)self->_bundleIdentifierForTopic objectForKey:v9];
  uint64_t v11 = [(FPDPushConnection *)self clientConnectionsForApplicationBundleIdentifier:v10];
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FPDPushConnection connection:didReceiveToken:forTopic:identifier:]((uint64_t)v9, v11, v12);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "remoteObjectProxy", (void)v19);
        [v18 fileProviderRegistrationSucceededWithDeviceToken:v8];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushQueue);
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPDPushConnection connection:didReceiveIncomingMessage:](v7, v8);
  }

  id v9 = [v7 topic];
  id v10 = [(NSMutableDictionary *)self->_bundleIdentifierForTopic objectForKey:v9];
  if (v10) {
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "fp_isCloudDocsPushTopic"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    id v10 = [WeakRetained clouddocsExtensionIdentifier];

LABEL_8:
    id v12 = [(NSMutableDictionary *)self->_messageDelegates objectForKey:v10];
    id v13 = v12;
    if (v12)
    {
      payloadDeliveryQueue = self->_payloadDeliveryQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke;
      v17[3] = &unk_1E6A73648;
      uint64_t v18 = v12;
      id v19 = v7;
      long long v20 = self;
      long long v21 = v10;
      id v22 = v9;
      id v23 = v6;
      dispatch_async(payloadDeliveryQueue, v17);

      uint64_t v15 = v18;
    }
    else
    {
      uint64_t v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[FPDPushConnection connection:didReceiveIncomingMessage:]();
      }
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v9, "fp_isTestPushTopic"))
  {
    id v10 = @"com.apple.FileProvider.TestingHarness";
    goto LABEL_8;
  }
  uint64_t v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[FPDPushConnection connection:didReceiveIncomingMessage:]();
  }

  [v6 invalidateTokenForTopic:v9 identifier:&stru_1F2EC3618];
LABEL_13:
}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_2;
  v5[3] = &unk_1E6A73AC8;
  id v4 = *(void **)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  [v2 didReceiveMessage:v3 completionHandler:v5];
}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_3;
  block[3] = &unk_1E6A73AC8;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  dispatch_async(v3, block);
}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_3(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) clientConnectionsForApplicationBundleIdentifier:*(void *)(a1 + 40)];
  if ([v2 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v16 = v2;
    id obj = v2;
    uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v8 = objc_msgSend(v7, "remoteObjectProxy", v16);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_86;
          v18[3] = &unk_1E6A768A0;
          id v9 = *(id *)(a1 + 48);
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void **)(a1 + 40);
          id v19 = v9;
          uint64_t v20 = v10;
          long long v21 = v7;
          id v22 = v11;
          id v12 = [v8 remoteObjectProxyWithErrorHandler:v18];
          id v13 = [*(id *)(a1 + 64) userInfo];
          [v12 fileProviderPayloadReceived:v13];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v4);
    }

    uint64_t v2 = v16;
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Missing push connection for topic %@. This can happen if the provider doesn't register for pushes on startup. Invalidating push topic.", buf, 0xCu);
    }

    [*(id *)(a1 + 56) invalidateTokenForTopic:*(void *)(a1 + 48) identifier:&stru_1F2EC3618];
  }
}

void __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(v3, "fp_prettyDescription");
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Error sending push for topic %@: %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v8 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  block[2] = __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_87;
  block[3] = &unk_1E6A73418;
  long long v10 = v7;
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v8, block);
}

uint64_t __58__FPDPushConnection_connection_didReceiveIncomingMessage___block_invoke_87(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeClientConnection:*(void *)(a1 + 40) forApplicationBundleIdentifier:*(void *)(a1 + 48)];
}

- (void)updateTopicsForProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDPushConnection updateTopicsForProvider:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  pushQueue = self->_pushQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke;
  v15[3] = &unk_1E6A736C0;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_async(pushQueue, v15);
}

void __45__FPDPushConnection_updateTopicsForProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [WeakRetained providerWithIdentifier:*(void *)(a1 + 40) reason:0];

  id v4 = [v3 descriptor];
  uint64_t v5 = [v4 bundleIdentifierForPushes];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) clientConnectionsForApplicationBundleIdentifier:v5];
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 firstObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke_2;
    v11[3] = &unk_1E6A76800;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    [v7 performWithConnection:v8 block:v11];
  }
}

void __45__FPDPushConnection_updateTopicsForProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__FPDPushConnection_updateTopicsForProvider___block_invoke_89;
    v14[3] = &unk_1E6A750F0;
    v14[4] = v10;
    id v15 = *(id *)(a1 + 32);
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D744C000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Invalid push connection for app bundle identifier %@, not updating topics", buf, 0xCu);
    }
  }
}

uint64_t __45__FPDPushConnection_updateTopicsForProvider___block_invoke_89(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTopicsForApplicationBundleIdentifier:*(void *)(a1 + 40) providerIdentifier:*(void *)(a1 + 48) requestToken:0 environment:*(void *)(a1 + 56)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMonitor, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_topicsForBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForTopic, 0);
  objc_storeStrong((id *)&self->_messageDelegates, 0);
  objc_storeStrong((id *)&self->_pushConnectionsByEnvironment, 0);
  objc_storeStrong((id *)&self->_payloadDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] FPDPushConnection accepted connection %@", v2, v3, v4, v5, v6);
}

- (void)performWithConnection:block:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_4(&dword_1D744C000, v0, v1, "[ERROR] Couldn't find valid provider for connection %@", v2, v3, v4, v5, v6);
}

- (void)performWithConnection:block:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_4(&dword_1D744C000, v0, v1, "[ERROR] Couldn't find provider for registering bundle %@", v2, v3, v4, v5, v6);
}

- (void)performWithConnection:block:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] couldn't find extension with identifier %@, trying application", v2, v3, v4, v5, v6);
}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__FPDPushConnection_updateTopicsForApplicationBundleIdentifier_providerIdentifier_requestToken_environment___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D744C000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] requested tokens for topics %@ for application %@", v2, 0x16u);
}

- (void)connection:(NSObject *)a3 didReceiveToken:forTopic:identifier:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] received token for topic %@, informing %lu clients", (uint8_t *)&v4, 0x16u);
}

- (void)connection:didReceiveIncomingMessage:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1D744C000, v1, OS_LOG_TYPE_FAULT, "[CRIT] No delegate found for topic %@ for bundle identifier %@", v2, 0x16u);
}

- (void)connection:didReceiveIncomingMessage:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_4(&dword_1D744C000, v0, v1, "[ERROR] Received push for unregistered topic %@; invalidating token.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)connection:(void *)a1 didReceiveIncomingMessage:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 topic];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] received push for topic %@", v4, 0xCu);
}

- (void)updateTopicsForProvider:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end