@interface CXCallDirectoryNSExtensionManager
+ (NSDictionary)baseExtensionMatchingAttributes;
- (CXCallDirectoryNSExtensionManager)init;
- (CXCallDirectoryNSExtensionManagerDelegate)delegate;
- (NSDictionary)extensions;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)extensionMatchingContext;
- (void)_beginMatchingExtensionsIfNecessary;
- (void)_extensionForIdentifier:(id)a3 containingAppBundleURL:(id)a4 completion:(id)a5;
- (void)beginMatchingExtensions;
- (void)dealloc;
- (void)extensionWithIdentifier:(id)a3 inContainingAppWithProcessIdentifier:(int)a4 completion:(id)a5;
- (void)extensionsWithCompletionHandler:(id)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setExtensionMatchingContext:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CXCallDirectoryNSExtensionManager

- (CXCallDirectoryNSExtensionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryNSExtensionManager;
  v2 = [(CXCallDirectoryNSExtensionManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.calldirectorynsextensionmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 addObserver:v2];

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [(CXCallDirectoryNSExtensionManager *)self extensionMatchingContext];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28C70];
    v5 = [(CXCallDirectoryNSExtensionManager *)self extensionMatchingContext];
    [v4 endMatchingExtensions:v5];
  }
  v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryNSExtensionManager;
  [(CXCallDirectoryNSExtensionManager *)&v7 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CXCallDirectoryNSExtensionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CXCallDirectoryNSExtensionManager_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __55__CXCallDirectoryNSExtensionManager_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  dispatch_queue_t v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)beginMatchingExtensions
{
  dispatch_queue_t v3 = [(CXCallDirectoryNSExtensionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CXCallDirectoryNSExtensionManager_beginMatchingExtensions__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__CXCallDirectoryNSExtensionManager_beginMatchingExtensions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginMatchingExtensionsIfNecessary];
}

+ (NSDictionary)baseExtensionMatchingAttributes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v11[0] = @"com.apple.callkit.call-directory";
    v11[1] = @"com.apple.live-lookup";
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    dispatch_queue_t v3 = (__CFString **)v11;
    uint64_t v4 = 2;
  }
  else
  {
    id v10 = @"com.apple.callkit.call-directory";
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    dispatch_queue_t v3 = &v10;
    uint64_t v4 = 1;
  }
  v5 = [v2 arrayWithObjects:v3 count:v4];
  uint64_t v8 = *MEMORY[0x1E4F282B0];
  id v9 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return (NSDictionary *)v6;
}

- (void)_beginMatchingExtensionsIfNecessary
{
  dispatch_queue_t v3 = [(CXCallDirectoryNSExtensionManager *)self extensionMatchingContext];

  if (!v3)
  {
    uint64_t v4 = [(id)objc_opt_class() baseExtensionMatchingAttributes];
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E4F28C70];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke;
    v11 = &unk_1E5CAE0C8;
    objc_copyWeak(&v14, &location);
    id v12 = self;
    id v6 = v4;
    id v13 = v6;
    id v7 = [v5 beginMatchingExtensionsWithAttributes:v6 completion:&v8];
    -[CXCallDirectoryNSExtensionManager setExtensionMatchingContext:](self, "setExtensionMatchingContext:", v7, v8, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v9 = CXDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_cold_1();
      }
    }
    else
    {
      id v10 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_2;
      block[3] = &unk_1E5CADD08;
      v11 = v5;
      uint64_t v12 = *(void *)(a1 + 32);
      id v14 = v11;
      uint64_t v15 = v12;
      v16 = v8;
      dispatch_async(v10, block);

      uint64_t v9 = v14;
    }
  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "matchingExtensions=%@", buf, 0xCu);
  }

  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 identifier];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) setExtensions:v4];
  uint64_t v12 = [*(id *)(a1 + 40) delegateQueue];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 40) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_14;
    block[3] = &unk_1E5CADD08;
    long long v15 = *(_OWORD *)(a1 + 40);
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v13, block);
  }
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryNSExtensionManager:*(void *)(a1 + 40) extensionsChanged:*(void *)(a1 + 48)];
}

- (void)extensionsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() baseExtensionMatchingAttributes];
  [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v4 completion:v3];
}

- (void)extensionWithIdentifier:(id)a3 inContainingAppWithProcessIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4E278]);
  v11 = [v10 bundleInfoValueForKey:*MEMORY[0x1E4F1CFF8] PID:v6];
  [v10 invalidate];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForBundleIdentifier:", v11);
    id v13 = [v12 URL];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke;
    v16[3] = &unk_1E5CAE0F0;
    id v17 = v8;
    id v18 = v13;
    id v19 = v9;
    id v14 = v13;
    [(CXCallDirectoryNSExtensionManager *)self _extensionForIdentifier:v17 containingAppBundleURL:v14 completion:v16];
  }
  else
  {
    long long v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryNSExtensionManager extensionWithIdentifier:inContainingAppWithProcessIdentifier:completion:](v6, v15);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke_cold_1(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_extensionForIdentifier:(id)a3 containingAppBundleURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() baseExtensionMatchingAttributes];
  v11 = (void *)[v10 mutableCopy];

  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28290]];
  uint64_t v12 = [v8 path];

  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28260]];
  id v13 = (void *)MEMORY[0x1E4F28C70];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke;
  v16[3] = &unk_1E5CAE118;
  id v17 = v11;
  id v18 = v7;
  id v14 = v7;
  id v15 = v11;
  [v13 extensionsWithMatchingAttributes:v15 completion:v16];
}

void __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 firstObject];
  }
  else
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke_cold_1();
    }

    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pluginsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryNSExtensionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegateQueue];

  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "pluginKitProxies=%@", buf, 0xCu);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
          uint64_t v12 = [*(id *)(a1 + 32) extensions];
          id v13 = [v11 pluginIdentifier];
          id v14 = [v12 objectForKeyedSubscript:v13];

          if (v14) {
            [v3 addObject:v14];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1A6E3A000, v15, OS_LOG_TYPE_DEFAULT, "installedPlugins=%@", buf, 0xCu);
    }

    if ([v3 count])
    {
      id v16 = [*(id *)(a1 + 32) delegateQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke_20;
      v17[3] = &unk_1E5CADC68;
      v17[4] = *(void *)(a1 + 32);
      id v18 = v3;
      dispatch_async(v16, v17);
    }
  }
}

void __55__CXCallDirectoryNSExtensionManager_pluginsDidInstall___block_invoke_20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callDirectoryNSExtensionManager:*(void *)(a1 + 32) extensionsChanged:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXCallDirectoryNSExtensionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallDirectoryNSExtensionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (id)extensionMatchingContext
{
  return self->_extensionMatchingContext;
}

- (void)setExtensionMatchingContext:(id)a3
{
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CXCallDirectoryNSExtensionManager__beginMatchingExtensionsIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A6E3A000, v0, v1, "Error beginning to match extensions with attributes %@: %@");
}

- (void)extensionWithIdentifier:(int)a1 inContainingAppWithProcessIdentifier:(NSObject *)a2 completion:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "No containing app bundle ID found for containingAppPID %d", (uint8_t *)v2, 8u);
}

void __109__CXCallDirectoryNSExtensionManager_extensionWithIdentifier_inContainingAppWithProcessIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "No NSExtension found for identifier %@ containingAppBundleURL %@", (uint8_t *)&v4, 0x16u);
}

void __95__CXCallDirectoryNSExtensionManager__extensionForIdentifier_containingAppBundleURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A6E3A000, v0, v1, "Error matching extensions with attributes %@: %@");
}

@end