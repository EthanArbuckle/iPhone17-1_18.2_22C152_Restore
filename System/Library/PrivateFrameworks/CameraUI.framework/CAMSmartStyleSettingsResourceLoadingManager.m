@interface CAMSmartStyleSettingsResourceLoadingManager
- (BOOL)isWaitingOnLoadingForAssetIdentifiers:(id)a3;
- (CAMSmartStyleSettingsResourceLoader)_activeResourceLoader;
- (CAMSmartStyleSettingsResourceLoadingManager)init;
- (CAMSmartStyleSettingsResourceLoadingManagerDelegate)delegate;
- (NSMutableArray)_pendingResourceLoaders;
- (NSMutableDictionary)_allResourceLoaders;
- (NSMutableDictionary)_logIdentifiers;
- (OS_dispatch_queue)_loadingQueue;
- (double)_activeLoadStartTime;
- (id)logIdentifierForAssetIdentifier:(id)a3;
- (id)logIdentifierForAssetIdentifiers:(id)a3;
- (id)resourceLoaderForAssetIdentifier:(id)a3;
- (void)_loadNextResourceIfPossible;
- (void)_unloadResourcesForAssetIdentifier:(id)a3 allowLoadingNextResource:(BOOL)a4;
- (void)loadResourcesForAssetIdentifier:(id)a3;
- (void)loadResourcesForAssetIdentifiers:(id)a3 unloadAllOthers:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)set_activeLoadStartTime:(double)a3;
- (void)set_activeResourceLoader:(id)a3;
- (void)smartStyleSettingsResourceLoaderDidFinishLoading:(id)a3;
- (void)unloadResourcesForAssetIdentifier:(id)a3;
@end

@implementation CAMSmartStyleSettingsResourceLoadingManager

- (CAMSmartStyleSettingsResourceLoadingManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)CAMSmartStyleSettingsResourceLoadingManager;
  v2 = [(CAMSmartStyleSettingsResourceLoadingManager *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.style-settings-resource-loading-manager.loading-queue", v3);
    loadingQueue = v2->__loadingQueue;
    v2->__loadingQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    allResourceLoaders = v2->__allResourceLoaders;
    v2->__allResourceLoaders = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingResourceLoaders = v2->__pendingResourceLoaders;
    v2->__pendingResourceLoaders = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    logIdentifiers = v2->__logIdentifiers;
    v2->__logIdentifiers = v10;

    v12 = v2;
  }

  return v2;
}

- (void)loadResourcesForAssetIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(CAMSmartStyleSettingsResourceLoadingManager *)self logIdentifierForAssetIdentifier:v4];
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifier:]();
    }

    v9 = [CAMSmartStyleSettingsResourceLoader alloc];
    v10 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _loadingQueue];
    v11 = [(CAMSmartStyleSettingsResourceLoader *)v9 initWithDelegate:self loadingQueue:v10 assetIdentifier:v4 logIdentifier:v7];

    v12 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _pendingResourceLoaders];
    [v12 addObject:v11];

    v13 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
    [v13 setObject:v11 forKeyedSubscript:v4];

    [(CAMSmartStyleSettingsResourceLoadingManager *)self _loadNextResourceIfPossible];
  }
}

- (void)loadResourcesForAssetIdentifiers:(id)a3 unloadAllOthers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    id v8 = objc_alloc(MEMORY[0x263EFF9C0]);
    v9 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
    v10 = [v9 allKeys];
    v11 = (void *)[v8 initWithArray:v10];

    [v11 minusSet:v7];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [(CAMSmartStyleSettingsResourceLoadingManager *)self _unloadResourcesForAssetIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * v16++) allowLoadingNextResource:0];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v14);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[CAMSmartStyleSettingsResourceLoadingManager loadResourcesForAssetIdentifier:](self, "loadResourcesForAssetIdentifier:", *(void *)(*((void *)&v22 + 1) + 8 * v21++), (void)v22);
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }

  [(CAMSmartStyleSettingsResourceLoadingManager *)self _loadNextResourceIfPossible];
}

- (void)unloadResourcesForAssetIdentifier:(id)a3
{
}

- (void)_unloadResourcesForAssetIdentifier:(id)a3 allowLoadingNextResource:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(CAMSmartStyleSettingsResourceLoadingManager *)self logIdentifierForAssetIdentifier:v6];
  id v8 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [v9 setDelegate:0];
    v10 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _pendingResourceLoaders];
    [v10 removeObject:v9];

    v11 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
    [v11 setObject:0 forKeyedSubscript:v6];

    id v12 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _activeResourceLoader];

    uint64_t v13 = os_log_create("com.apple.camera", "SmartStyleSettings");
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12 == v9)
    {
      if (v14) {
        -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:]();
      }

      [(CAMSmartStyleSettingsResourceLoadingManager *)self set_activeResourceLoader:0];
      if (v4) {
        [(CAMSmartStyleSettingsResourceLoadingManager *)self _loadNextResourceIfPossible];
      }
    }
    else
    {
      if (v14) {
        -[CAMSmartStyleSettingsResourceLoadingManager _unloadResourcesForAssetIdentifier:allowLoadingNextResource:]();
      }
    }
  }
  else
  {
    uint64_t v15 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): could not cancel untracked asset identifier", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_loadNextResourceIfPossible
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "ResourceLoadingManager (%{public}@): starting load", v4, 0xCu);
}

- (id)resourceLoaderForAssetIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isWaitingOnLoadingForAssetIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (([v11 status] | 2) == 2)
        {

          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)logIdentifierForAssetIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _logIdentifiers];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = NSString;
    id v8 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _logIdentifiers];
    uint64_t v6 = objc_msgSend(v7, "stringWithFormat:", @"Asset:%ld", objc_msgSend(v8, "count"));

    uint64_t v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:]();
    }

    v10 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _logIdentifiers];
    [v10 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (id)logIdentifierForAssetIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        v11 = -[CAMSmartStyleSettingsResourceLoadingManager logIdentifierForAssetIdentifier:](self, "logIdentifierForAssetIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  BOOL v12 = [v5 componentsJoinedByString:@","];

  return v12;
}

- (void)smartStyleSettingsResourceLoaderDidFinishLoading:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _allResourceLoaders];
  id v6 = [v4 assetIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _activeResourceLoader];

  uint64_t v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != v4)
  {
    if (v7 != v4)
    {
      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }
      v11 = [v4 logIdentifier];
      BOOL v12 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _activeResourceLoader];
      uint64_t v13 = [v12 logIdentifier];
      int v18 = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading for asset that was not activeResourceLoader %{public}@. Will not notify delegate.", (uint8_t *)&v18, 0x16u);

LABEL_13:
      goto LABEL_14;
    }
    if (v10)
    {
      long long v15 = [v4 logIdentifier];
      long long v16 = [(CAMSmartStyleSettingsResourceLoadingManager *)self _activeResourceLoader];
      long long v17 = [v16 logIdentifier];
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading for asset that was not activeResourceLoader %{public}@", (uint8_t *)&v18, 0x16u);
    }
LABEL_12:
    uint64_t v9 = [(CAMSmartStyleSettingsResourceLoadingManager *)self delegate];
    v11 = [v4 assetIdentifier];
    [v9 smartStyleSettingsResourceLoadingManager:self didFinishLoadingForAssetIdentifier:v11];
    goto LABEL_13;
  }
  if (v10)
  {
    long long v14 = [v4 logIdentifier];
    int v18 = 138543362;
    uint64_t v19 = v14;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoadingManager (%{public}@): Did finish loading", (uint8_t *)&v18, 0xCu);
  }
  [(CAMSmartStyleSettingsResourceLoadingManager *)self set_activeResourceLoader:0];
  if (v7 == v4) {
    goto LABEL_12;
  }
LABEL_15:
  [(CAMSmartStyleSettingsResourceLoadingManager *)self _loadNextResourceIfPossible];
}

- (CAMSmartStyleSettingsResourceLoadingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStyleSettingsResourceLoadingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)_loadingQueue
{
  return self->__loadingQueue;
}

- (NSMutableDictionary)_allResourceLoaders
{
  return self->__allResourceLoaders;
}

- (NSMutableArray)_pendingResourceLoaders
{
  return self->__pendingResourceLoaders;
}

- (CAMSmartStyleSettingsResourceLoader)_activeResourceLoader
{
  return self->__activeResourceLoader;
}

- (void)set_activeResourceLoader:(id)a3
{
}

- (double)_activeLoadStartTime
{
  return self->__activeLoadStartTime;
}

- (void)set_activeLoadStartTime:(double)a3
{
  self->__activeLoadStartTime = a3;
}

- (NSMutableDictionary)_logIdentifiers
{
  return self->__logIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__logIdentifiers, 0);
  objc_storeStrong((id *)&self->__activeResourceLoader, 0);
  objc_storeStrong((id *)&self->__pendingResourceLoaders, 0);
  objc_storeStrong((id *)&self->__allResourceLoaders, 0);
  objc_storeStrong((id *)&self->__loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)loadResourcesForAssetIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "ResourceLoadingManager (%{public}@): start tracking", v2, v3, v4, v5, v6);
}

- (void)_unloadResourcesForAssetIdentifier:allowLoadingNextResource:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "ResourceLoadingManager (%{public}@): canceling tracking while actively loading", v2, v3, v4, v5, v6);
}

- (void)_unloadResourcesForAssetIdentifier:allowLoadingNextResource:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_2099F8000, v0, v1, "ResourceLoadingManager (%{public}@): stop tracking", v2, v3, v4, v5, v6);
}

- (void)logIdentifierForAssetIdentifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2099F8000, v1, OS_LOG_TYPE_DEBUG, "ResourceLoadingManager: mapping %{public}@ as %{public}@", v2, 0x16u);
}

@end