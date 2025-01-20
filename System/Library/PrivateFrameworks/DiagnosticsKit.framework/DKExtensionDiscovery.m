@interface DKExtensionDiscovery
+ (id)discoveryUsingExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5;
- (BOOL)discoveryComplete;
- (DKExtensionDiscovery)initWithExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5;
- (DKExtensionRegistry)registry;
- (NSCondition)discoveryLock;
- (NSSet)services;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)discoveryQueue;
- (void)_beginExtensionDiscovery;
- (void)_registerExtensions:(id)a3 error:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setDiscoveryComplete:(BOOL)a3;
- (void)setDiscoveryLock:(id)a3;
- (void)setDiscoveryQueue:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setServices:(id)a3;
- (void)waitUntilComplete;
@end

@implementation DKExtensionDiscovery

+ (id)discoveryUsingExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[DKExtensionDiscovery alloc] initWithExtensionRegistry:v9 services:v8 bundleIdentifier:v7];

  return v10;
}

- (DKExtensionDiscovery)initWithExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DKExtensionDiscovery;
  v12 = [(DKExtensionDiscovery *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.DiagnosticsKit.discovery", MEMORY[0x263EF83A8]);
    discoveryQueue = v13->_discoveryQueue;
    v13->_discoveryQueue = (OS_dispatch_queue *)v14;

    v16 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    discoveryLock = v13->_discoveryLock;
    v13->_discoveryLock = v16;

    v13->_discoveryComplete = 0;
    objc_storeStrong((id *)&v13->_services, a4);
    if (!v13->_bundleIdentifier) {
      objc_storeStrong((id *)&v13->_bundleIdentifier, @"Default");
    }
    [(DKExtensionDiscovery *)v13 _beginExtensionDiscovery];
  }

  return v13;
}

- (void)_beginExtensionDiscovery
{
  v3 = [(DKExtensionDiscovery *)self discoveryLock];
  [v3 lock];

  [(DKExtensionDiscovery *)self setDiscoveryComplete:0];
  v4 = [(DKExtensionDiscovery *)self discoveryLock];
  [v4 unlock];

  v5 = [(DKExtensionDiscovery *)self discoveryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke;
  block[3] = &unk_264E86710;
  block[4] = self;
  dispatch_async(v5, block);
}

void __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_group_t v2 = dispatch_group_create();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke_2;
  v23[3] = &unk_264E867D8;
  objc_copyWeak(&v25, &location);
  dispatch_group_t group = v2;
  dispatch_group_t v24 = group;
  v3 = (void *)MEMORY[0x23ECF6C10](v23);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [*v1 services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = *MEMORY[0x263F07FF8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        dispatch_group_enter(group);
        id v10 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "Starting extension matching...", buf, 2u);
        }

        id v11 = (void *)MEMORY[0x263F08800];
        uint64_t v27 = v7;
        uint64_t v28 = v9;
        v12 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        [v11 extensionsWithMatchingAttributes:v12 completion:v3];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v5);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v13 = [*(id *)(a1 + 32) discoveryLock];
  [v13 lock];

  [*(id *)(a1 + 32) setDiscoveryComplete:1];
  dispatch_queue_t v14 = [*(id *)(a1 + 32) discoveryLock];
  [v14 broadcast];

  v15 = [*(id *)(a1 + 32) discoveryLock];
  [v15 unlock];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_23D039000, v9, OS_LOG_TYPE_DEFAULT, "Finished extension matching.", v10, 2u);
  }

  [WeakRetained _registerExtensions:v7 error:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)waitUntilComplete
{
  v3 = [(DKExtensionDiscovery *)self discoveryLock];
  [v3 lock];

  if (![(DKExtensionDiscovery *)self discoveryComplete])
  {
    do
    {
      v4 = [(DKExtensionDiscovery *)self discoveryLock];
      [v4 wait];
    }
    while (![(DKExtensionDiscovery *)self discoveryComplete]);
  }
  id v5 = [(DKExtensionDiscovery *)self discoveryLock];
  [v5 unlock];
}

- (void)_registerExtensions:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v21 = v6;
  id v22 = a4;
  if (v6)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v12 = [(DKExtensionDiscovery *)self registry];
          v13 = objc_msgSend(objc_alloc((Class)objc_msgSend(v12, "extensionClass")), "initWithExtension:", v11);

          if (!v13)
          {
            v18 = DiagnosticsKitLogHandleForCategory(1);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[DKExtensionDiscovery _registerExtensions:error:](&buf, v24, v18);
            }
            goto LABEL_13;
          }
          dispatch_queue_t v14 = [v13 bundleIdentifier];
          if (!v14) {
            goto LABEL_10;
          }
          v15 = [v13 bundleIdentifier];
          v16 = [(DKExtensionDiscovery *)self bundleIdentifier];
          int v17 = [v15 isEqual:v16];

          if (v17)
          {
LABEL_10:
            v18 = +[DKExtensionAdapter extensionAdapterWithExtensionAttributes:v13];
            long long v19 = [(DKExtensionDiscovery *)self registry];
            objc_sync_enter(v19);
            long long v20 = [(DKExtensionDiscovery *)self registry];
            [v20 addExtensionAdapter:v18];

            objc_sync_exit(v19);
LABEL_13:
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v7 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DKExtensionDiscovery _registerExtensions:error:](v7);
    }
  }
}

- (DKExtensionRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (OS_dispatch_queue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
}

- (NSCondition)discoveryLock
{
  return self->_discoveryLock;
}

- (void)setDiscoveryLock:(id)a3
{
}

- (BOOL)discoveryComplete
{
  return self->_discoveryComplete;
}

- (void)setDiscoveryComplete:(BOOL)a3
{
  self->_discoveryComplete = a3;
}

- (NSSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_discoveryLock, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

- (void)_registerExtensions:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D039000, log, OS_LOG_TYPE_ERROR, "Failed to perform extension matching.", v1, 2u);
}

- (void)_registerExtensions:(os_log_t)log error:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23D039000, log, OS_LOG_TYPE_ERROR, "Extension info not valid, ignoring.", buf, 2u);
}

@end