@interface HMDSoftwareUpdateDocumentationManager
+ (HMDSoftwareUpdateDocumentationManager)sharedManager;
+ (id)logCategory;
- (HMDFileManager)fileManager;
- (HMDSoftwareUpdateDocumentationManager)init;
- (HMDSoftwareUpdateDocumentationManager)initWithFileManager:(id)a3;
- (NSArray)assets;
- (NSMutableSet)registeredMetadata;
- (OS_dispatch_queue)workQueue;
- (id)assetForDocumentationMetadata:(id)a3;
- (void)addAsset:(id)a3;
- (void)auditAsset:(id)a3;
- (void)networkMonitorIsReachable:(id)a3;
- (void)parseCachedAssets;
- (void)registerDocumentationMetadata:(id)a3;
- (void)removeAsset:(id)a3;
- (void)unregisterDocumentationMetadata:(id)a3;
@end

@implementation HMDSoftwareUpdateDocumentationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_registeredMetadata, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableSet)registeredMetadata
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)networkMonitorIsReachable:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v18 = a3;
  v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network is reachable, starting automatic caching", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(HMDSoftwareUpdateDocumentationManager *)v5 assets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 shouldAutomaticallyCache] && objc_msgSend(v13, "state") <= 3)
        {
          v14 = (void *)MEMORY[0x230FBD990]();
          v15 = v5;
          v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            __int16 v25 = 2112;
            v26 = v13;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting automatic caching for asset: %@", buf, 0x16u);
          }
          [v13 startCaching];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v10);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_queue;
}

- (void)auditAsset:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Auditing asset: %@", buf, 0x16u);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [(HMDSoftwareUpdateDocumentationManager *)v6 registeredMetadata];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v25 + 1) + 8 * v13) observedObject];
          v15 = [v4 metadata];
          char v16 = [v14 isEqual:v15];

          if (v16)
          {

            long long v21 = (void *)MEMORY[0x230FBD990]();
            long long v22 = v6;
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v31 = v24;
              __int16 v32 = 2112;
              id v33 = v4;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Asset still in use: %@", buf, 0x16u);
            }
            goto LABEL_18;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v6;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Asset no longer in use, removing: %@", buf, 0x16u);
    }
    [v4 purgeWithError:0];
    [(HMDSoftwareUpdateDocumentationManager *)v18 removeAsset:v4];
  }
LABEL_18:
}

- (id)assetForDocumentationMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDSoftwareUpdateDocumentationManager *)self assets];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 metadata];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v5 = [(NSMutableOrderedSet *)self->_assets indexOfObject:v9];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [MEMORY[0x263F088D0] indexSetWithIndex:v5];
      uint64_t v7 = NSStringFromSelector(sel_assets);
      [(HMDSoftwareUpdateDocumentationManager *)self willChange:3 valuesAtIndexes:v6 forKey:v7];

      [(NSMutableOrderedSet *)self->_assets removeObject:v9];
      v8 = NSStringFromSelector(sel_assets);
      [(HMDSoftwareUpdateDocumentationManager *)self didChange:3 valuesAtIndexes:v6 forKey:v8];
    }
    os_unfair_recursive_lock_unlock();
    id v4 = v9;
  }
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if (([(NSMutableOrderedSet *)self->_assets containsObject:v8] & 1) == 0)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", -[NSMutableOrderedSet count](self->_assets, "count"));
      id v6 = NSStringFromSelector(sel_assets);
      [(HMDSoftwareUpdateDocumentationManager *)self willChange:2 valuesAtIndexes:v5 forKey:v6];

      [(NSMutableOrderedSet *)self->_assets addObject:v8];
      uint64_t v7 = NSStringFromSelector(sel_assets);
      [(HMDSoftwareUpdateDocumentationManager *)self didChange:2 valuesAtIndexes:v5 forKey:v7];
    }
    os_unfair_recursive_lock_unlock();
    id v4 = v8;
  }
}

- (NSArray)assets
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(NSMutableOrderedSet *)self->_assets array];
  id v4 = (void *)[v3 copy];

  os_unfair_recursive_lock_unlock();
  return (NSArray *)v4;
}

- (void)unregisterDocumentationMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__HMDSoftwareUpdateDocumentationManager_unregisterDocumentationMetadata___block_invoke;
    v7[3] = &unk_264A2F820;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __73__HMDSoftwareUpdateDocumentationManager_unregisterDocumentationMetadata___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "registeredMetadata", 0);
  v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [v8 observedObject];
        uint64_t v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          char v11 = (void *)MEMORY[0x230FBD990]();
          id v12 = *(id *)(a1 + 32);
          long long v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            long long v14 = HMFGetLogIdentifier();
            uint64_t v15 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            long long v22 = v14;
            __int16 v23 = 2112;
            uint64_t v24 = v15;
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Unregistering metadata: %@", buf, 0x16u);
          }
          long long v16 = [*(id *)(a1 + 32) registeredMetadata];
          [v16 removeObject:v8];

          v3 = [*(id *)(a1 + 32) assetForDocumentationMetadata:*(void *)(a1 + 40)];
          if (v3) {
            [*(id *)(a1 + 32) auditAsset:v3];
          }
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)registerDocumentationMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke;
    v7[3] = &unk_264A2F820;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
  }
}

void __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F425D8]) initWithObservedObject:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) registeredMetadata];
  char v4 = [v3 containsObject:v2];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = *(HMDSoftwareUpdateDocumentationAsset **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v8;
      __int16 v24 = 2112;
      long long v25 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering metadata: %@", buf, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 40) registeredMetadata];
    [v10 addObject:v2];

    char v11 = [*(id *)(a1 + 40) assetForDocumentationMetadata:*(void *)(a1 + 32)];
    if (!v11)
    {
      char v11 = [[HMDSoftwareUpdateDocumentationAsset alloc] initWithDocumentationMetadata:*(void *)(a1 + 32)];
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 40);
      long long v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v23 = v15;
        __int16 v24 = 2112;
        long long v25 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new documentation asset: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) addAsset:v11];
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_initWeak(&location, v11);
    objc_initWeak(&from, v2);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_12;
    v16[3] = &unk_264A25168;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    [v2 setDeallocationBlock:v16];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_12(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = objc_loadWeakRetained(a1 + 5);
  id v4 = objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = v4;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_2;
      block[3] = &unk_264A2F2F8;
      id v8 = v4;
      id v9 = WeakRetained;
      id v10 = v3;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) registeredMetadata];
    [v2 removeObject:*(void *)(a1 + 32)];
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 auditAsset:v4];
}

- (void)parseCachedAssets
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing cached assets", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) fileManager];
  uint64_t v7 = +[HMDSoftwareUpdateDocumentationAsset assetDirectoryURL];
  id v49 = 0;
  id v8 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:&v49];
  id v9 = v49;

  if (v8)
  {
    id v39 = v9;
    id v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v40 = v8;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    p_superclass = HMDRemotelyAddedAccessoryReachabilityObserver.superclass;
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v17 = [*(id *)(a1 + 32) fileManager];
          id v18 = [p_superclass + 369 assetWithURL:v16 fileManager:v17];

          if (v18)
          {
            [*(id *)(a1 + 32) addAsset:v18];
            [v10 addObject:v18];
            if ([v18 shouldAutomaticallyCache])
            {
              if ([v18 state] <= 3)
              {
                id v19 = (void *)MEMORY[0x230FBD990]();
                id v20 = *(id *)(a1 + 32);
                long long v21 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v23 = long long v22 = v10;
                  *(_DWORD *)buf = 138543618;
                  v52 = v23;
                  __int16 v53 = 2112;
                  id v54 = v18;
                  _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Starting automatic caching of asset: %@", buf, 0x16u);

                  id v10 = v22;
                  p_superclass = (__objc2_class **)(HMDRemotelyAddedAccessoryReachabilityObserver + 8);
                }

                [v18 startCaching];
              }
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v13);
    }

    __int16 v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v27;
      __int16 v53 = 2112;
      id v54 = v10;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Found cached assets: %@", buf, 0x16u);
    }
    long long v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 32);
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Will purge unregistered assets in 60s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_time_t v32 = dispatch_time(0, 60000000000);
    id v33 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke_10;
    block[3] = &unk_264A2C148;
    objc_copyWeak(&v44, (id *)buf);
    id v43 = v10;
    id v34 = v10;
    dispatch_after(v32, v33, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
    id v9 = v39;
    id v8 = v40;
  }
  else
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = *(id *)(a1 + 32);
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v38;
      __int16 v53 = 2112;
      id v54 = v9;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get cached assets with error: %@", buf, 0x16u);
    }
  }
}

void __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke_10(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = WeakRetained;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing cached assets: %@", buf, 0x16u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v4, "auditAsset:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (HMDSoftwareUpdateDocumentationManager)initWithFileManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDSoftwareUpdateDocumentationManager;
  id v6 = [(HMDSoftwareUpdateDocumentationManager *)&v19 init];
  if (v6)
  {
    HMDispatchQueueNameString();
    id v7 = objc_claimAutoreleasedReturnValue();
    id v8 = (const char *)[v7 UTF8String];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_fileManager, a3);
    uint64_t v12 = [MEMORY[0x263EFF9B0] orderedSet];
    assets = v6->_assets;
    v6->_assets = (NSMutableOrderedSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    registeredMetadata = v6->_registeredMetadata;
    v6->_registeredMetadata = (NSMutableSet *)v14;

    long long v16 = (HMFNetMonitor *)objc_alloc_init(MEMORY[0x263F425B0]);
    netMonitor = v6->_netMonitor;
    v6->_netMonitor = v16;

    [(HMFNetMonitor *)v6->_netMonitor setDelegate:v6];
    [(HMDSoftwareUpdateDocumentationManager *)v6 parseCachedAssets];
  }

  return v6;
}

- (HMDSoftwareUpdateDocumentationManager)init
{
  id v3 = objc_alloc_init(HMDFileManager);
  id v4 = [(HMDSoftwareUpdateDocumentationManager *)self initWithFileManager:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_190514 != -1) {
    dispatch_once(&logCategory__hmf_once_t15_190514, &__block_literal_global_190515);
  }
  v2 = (void *)logCategory__hmf_once_v16_190516;
  return v2;
}

void __52__HMDSoftwareUpdateDocumentationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v16_190516;
  logCategory__hmf_once_v16_190516 = v0;
}

+ (HMDSoftwareUpdateDocumentationManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_onceToken_190521 != -1) {
    dispatch_once(&sharedManager_onceToken_190521, block);
  }
  v2 = (void *)sharedManager_sharedManager_190522;
  return (HMDSoftwareUpdateDocumentationManager *)v2;
}

void __54__HMDSoftwareUpdateDocumentationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_190522;
  sharedManager_sharedManager_190522 = (uint64_t)v1;
}

@end