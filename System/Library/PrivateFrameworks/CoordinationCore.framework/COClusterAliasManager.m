@interface COClusterAliasManager
+ (id)aliasManagerWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5;
- (BOOL)_clusterIsBootstrapped:(id)a3;
- (COClusterAliasManagerDelegate)delegate;
- (COClusterAliasManagerMeshProvider)provider;
- (NSDictionary)associations;
- (NSDictionary)identifiers;
- (NSDictionary)meshes;
- (NSDictionary)resolvers;
- (NSDictionary)updates;
- (NSDictionary)waiting;
- (NSSet)resolving;
- (NSSet)starting;
- (NSSet)stopping;
- (NSString)description;
- (OS_dispatch_queue)delegateDispatchQueue;
- (OS_dispatch_queue)dispatchQueue;
- (id)_initWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5;
- (id)_labelForClusters:(id)a3;
- (id)_prepareNewMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4;
- (id)_providerRequestMesh;
- (void)_activateMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4;
- (void)_addWaitingBlock:(id)a3 forCluster:(id)a4;
- (void)_applyUpdates;
- (void)_deactivateMeshWithClusterIdentifier:(id)a3;
- (void)_delegateNotifyActivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6;
- (void)_delegateNotifyDeactivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6;
- (void)_invokeWaitingBlocksForClusters:(id)a3;
- (void)_recomputeAssociations;
- (void)_updateClusterIdentifier:(id)a3 forCluster:(id)a4;
- (void)didStopMeshController:(id)a3;
- (void)resolver:(id)a3 clusterIdentifierChanged:(id)a4;
- (void)setAssociations:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setMeshes:(id)a3;
- (void)setResolvers:(id)a3;
- (void)setResolving:(id)a3;
- (void)setStarting:(id)a3;
- (void)setStopping:(id)a3;
- (void)setUpdates:(id)a3;
- (void)setWaiting:(id)a3;
- (void)startTrackingCluster:(id)a3;
- (void)stopTrackingCluster:(id)a3;
- (void)waitForBootstrapOfCluster:(id)a3 withBlock:(id)a4;
@end

@implementation COClusterAliasManager

- (id)_initWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)COClusterAliasManager;
  v11 = [(COClusterAliasManager *)&v35 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_provider, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_delegateDispatchQueue, a5);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.COClusterAliasManager", v13);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v14;

    v16 = (NSDictionary *)objc_alloc_init(NSDictionary);
    resolvers = v12->_resolvers;
    v12->_resolvers = v16;

    v18 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    resolving = v12->_resolving;
    v12->_resolving = v18;

    v20 = (NSDictionary *)objc_alloc_init(NSDictionary);
    waiting = v12->_waiting;
    v12->_waiting = v20;

    v22 = (NSDictionary *)objc_alloc_init(NSDictionary);
    identifiers = v12->_identifiers;
    v12->_identifiers = v22;

    v24 = (NSDictionary *)objc_alloc_init(NSDictionary);
    updates = v12->_updates;
    v12->_updates = v24;

    v26 = (NSDictionary *)objc_alloc_init(NSDictionary);
    associations = v12->_associations;
    v12->_associations = v26;

    v28 = (NSDictionary *)objc_alloc_init(NSDictionary);
    meshes = v12->_meshes;
    v12->_meshes = v28;

    v30 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    starting = v12->_starting;
    v12->_starting = v30;

    v32 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    stopping = v12->_stopping;
    v12->_stopping = v32;
  }
  return v12;
}

+ (id)aliasManagerWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithProvider:v10 delegate:v9 delegateDispatchQueue:v8];

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(COClusterAliasManager *)self resolvers];
  uint64_t v7 = [v6 count];
  id v8 = [(COClusterAliasManager *)self identifiers];
  uint64_t v9 = [v8 count];
  id v10 = [(COClusterAliasManager *)self associations];
  uint64_t v11 = [v10 count];
  v12 = [(COClusterAliasManager *)self meshes];
  v13 = [v3 stringWithFormat:@"<%@: %p r(%lu) i(%lu) a(%lu) m(%lu)>", v5, self, v7, v9, v11, objc_msgSend(v12, "count")];

  return (NSString *)v13;
}

- (void)startTrackingCluster:(id)a3
{
  id v4 = a3;
  v5 = [(COClusterAliasManager *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__COClusterAliasManager_startTrackingCluster___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__COClusterAliasManager_startTrackingCluster___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) resolvers];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 134218498;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      __int16 v17 = 2048;
      v18 = v3;
      _os_log_debug_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEBUG, "%p already tracking %@ with %p", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    v3 = +[COClusterResolver resolverForCluster:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
    uint64_t v7 = [*(id *)(a1 + 32) resolvers];
    id v4 = [v7 mutableCopy];

    [v4 setObject:v3 forKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setResolvers:v4];
    id v8 = [*(id *)(a1 + 32) resolving];
    uint64_t v9 = (void *)[v8 mutableCopy];

    [v9 addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setResolving:v9];
    id v10 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 134218498;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      v18 = v3;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p will track %@ with %p", (uint8_t *)&v13, 0x20u);
    }

    [v3 activate];
  }
}

- (void)stopTrackingCluster:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COClusterAliasManager *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__COClusterAliasManager_stopTrackingCluster___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__COClusterAliasManager_stopTrackingCluster___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) resolvers];
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = (void *)(a1 + 40);
  id v6 = [v3 objectForKey:v5];

  uint64_t v7 = COCoreLogForCategory(13);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *v2;
      uint64_t v10 = *v4;
      int v12 = 134218242;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p stopping tracking %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v11 = [*v2 resolvers];
    id v8 = [v11 mutableCopy];

    [v8 removeObjectForKey:*v4];
    [*v2 setResolvers:v8];
    [*v2 _updateClusterIdentifier:0 forCluster:*v4];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __45__COClusterAliasManager_stopTrackingCluster___block_invoke_cold_1();
  }
}

- (void)waitForBootstrapOfCluster:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke;
  v18[3] = &unk_2645CBA10;
  v18[4] = self;
  id v8 = v7;
  id v19 = v8;
  id v9 = (void *)MEMORY[0x223C8B4A0](v18);
  uint64_t v10 = [(COClusterAliasManager *)self dispatchQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2;
  v14[3] = &unk_2645CBA38;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, v14);
}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegateDispatchQueue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) resolvers];
  id v4 = (void *)(a1 + 40);
  uint64_t v5 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    if (![*v2 _clusterIsBootstrapped:*v4])
    {
      [*(id *)(a1 + 32) _addWaitingBlock:*(void *)(a1 + 56) forCluster:*(void *)(a1 + 40)];
      goto LABEL_9;
    }
    id v6 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *v2;
      uint64_t v8 = *v4;
      int v9 = 134218242;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p already bootstrapped Cluster %@, invoking bootstrap block inline", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v6 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

- (void)resolver:(id)a3 clusterIdentifierChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 cluster];
  int v9 = [(COClusterAliasManager *)self dispatchQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__COClusterAliasManager_resolver_clusterIdentifierChanged___block_invoke;
  v13[3] = &unk_2645CB458;
  id v14 = v6;
  id v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __59__COClusterAliasManager_resolver_clusterIdentifierChanged___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) resolvers];
  id v4 = [v3 objectForKey:*(void *)(a1 + 48)];
  LODWORD(v2) = [v2 isEqual:v4];

  if (v2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v7 = *(void **)(a1 + 40);
    [v7 _updateClusterIdentifier:v5 forCluster:v6];
  }
  else
  {
    uint64_t v8 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 134218754;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_error_impl(&dword_2217C1000, v8, OS_LOG_TYPE_ERROR, "%p ignoring change to %@ for %@ from %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)_updateClusterIdentifier:(id)a3 forCluster:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(COClusterAliasManager *)self identifiers];
  uint64_t v10 = [v9 objectForKey:v7];

  uint64_t v11 = [(COClusterAliasManager *)self updates];
  uint64_t v12 = [v11 objectForKey:v7];

  id v13 = v6;
  uint64_t v14 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134219010;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    v26 = v10;
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p identifier updated to %@ from %@ (pending %@) for %@", (uint8_t *)&v21, 0x34u);
  }

  __int16 v15 = [(COClusterAliasManager *)self resolving];
  int v16 = [v15 containsObject:v7];

  if (v16)
  {
    __int16 v17 = [(COClusterAliasManager *)self resolving];
    uint64_t v18 = (void *)[v17 mutableCopy];

    [v18 removeObject:v7];
    [(COClusterAliasManager *)self setResolving:v18];
  }
  if ((v13 || v10 || v12)
    && (![v12 isEqual:v13] || !objc_msgSend(v10, "isEqual:", v13)))
  {
    uint64_t v20 = [(COClusterAliasManager *)self updates];
    __int16 v19 = (void *)[v20 mutableCopy];

    if (v13) {
      [v19 setObject:v13 forKey:v7];
    }
    else {
      [v19 removeObjectForKey:v7];
    }
    [(COClusterAliasManager *)self setUpdates:v19];
    if (v10) {
      [(COClusterAliasManager *)self _deactivateMeshWithClusterIdentifier:v10];
    }
    if (v13) {
      [(COClusterAliasManager *)self _deactivateMeshWithClusterIdentifier:v13];
    }
    [(COClusterAliasManager *)self _applyUpdates];
  }
  else
  {
    __int16 v19 = [MEMORY[0x263EFFA08] setWithObject:v7];
    [(COClusterAliasManager *)self _invokeWaitingBlocksForClusters:v19];
  }
}

- (void)_applyUpdates
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(COClusterAliasManager *)self stopping];
  uint64_t v5 = [v4 count];

  id v6 = COCoreLogForCategory(13);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [(COClusterAliasManager *)self stopping];
      *(_DWORD *)buf = 134218498;
      __int16 v27 = self;
      __int16 v28 = 2048;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p deferring updates, waiting for %lu (%@) to stop", buf, 0x20u);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      __int16 v27 = self;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p applying updates", buf, 0xCu);
    }

    uint64_t v9 = [(COClusterAliasManager *)self updates];
    uint64_t v10 = (void *)[v9 copy];
    [(COClusterAliasManager *)self setIdentifiers:v10];

    [(COClusterAliasManager *)self _recomputeAssociations];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [(COClusterAliasManager *)self associations];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
          __int16 v17 = [(COClusterAliasManager *)self meshes];
          uint64_t v18 = [v17 objectForKey:v16];

          if (!v18)
          {
            __int16 v19 = [(COClusterAliasManager *)self associations];
            uint64_t v20 = [v19 objectForKey:v16];

            [(COClusterAliasManager *)self _activateMeshWithClusterIdentifier:v16 forClusters:v20];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v6 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v27 = self;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p finished applying updates", buf, 0xCu);
    }
  }
}

- (void)_recomputeAssociations
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  __int16 v17 = self;
  uint64_t v5 = [(COClusterAliasManager *)self identifiers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
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
        uint64_t v11 = [v5 objectForKey:v10];
        uint64_t v12 = [v4 objectForKey:v11];
        id v13 = (id)[v12 mutableCopy];

        if (!v13) {
          id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        }
        [v13 addObject:v10];
        [v4 setObject:v13 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v7);
  }
  [(COClusterAliasManager *)v17 setAssociations:v4];
  uint64_t v14 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v4 count];
    uint64_t v16 = [v5 count];
    *(_DWORD *)buf = 134218496;
    long long v23 = v17;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    uint64_t v27 = v16;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p recomputed associations, %lu meshes for %lu Clusters", buf, 0x20u);
  }
}

- (BOOL)_clusterIsBootstrapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(COClusterAliasManager *)self resolving];
  char v7 = [v6 containsObject:v4];

  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v9 = [(COClusterAliasManager *)self identifiers];
    uint64_t v10 = [v9 objectForKey:v4];

    uint64_t v11 = [(COClusterAliasManager *)self updates];
    uint64_t v12 = [v11 objectForKey:v4];

    if (v12 | v10)
    {
      int v8 = [(id)v10 isEqual:v12];
      if (v8 && v10)
      {
        id v13 = [(COClusterAliasManager *)self starting];
        char v14 = [v13 containsObject:v10];

        LOBYTE(v8) = v14 ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (void)_addWaitingBlock:(id)a3 forCluster:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(COClusterAliasManager *)self waiting];
  uint64_t v10 = [v9 objectForKey:v7];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x223C8B4A0](v6);
    uint64_t v12 = [v10 arrayByAddingObject:v11];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v11 = (void *)MEMORY[0x223C8B4A0](v6);
    uint64_t v12 = objc_msgSend(v13, "initWithObjects:", v11, 0);
  }

  char v14 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    long long v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = [v12 count];
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p now %lu blocks waiting for bootstrap of Cluster %@", buf, 0x20u);
  }

  uint64_t v15 = [(COClusterAliasManager *)self waiting];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 setObject:v12 forKey:v7];
  [(COClusterAliasManager *)self setWaiting:v16];
}

- (void)_invokeWaitingBlocksForClusters:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COClusterAliasManager *)self waiting];
  id v7 = (void *)[v6 mutableCopy];

  int v8 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v26;
    *(void *)&long long v11 = 134218242;
    long long v22 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (-[COClusterAliasManager _clusterIsBootstrapped:](self, "_clusterIsBootstrapped:", v15, v22))
        {
          uint64_t v16 = [(COClusterAliasManager *)self waiting];
          __int16 v17 = [v16 objectForKey:v15];

          if (v17)
          {
            long long v18 = COCoreLogForCategory(13);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = [v17 count];
              *(_DWORD *)buf = 134218498;
              __int16 v30 = self;
              __int16 v31 = 2048;
              uint64_t v32 = v19;
              __int16 v33 = 2112;
              uint64_t v34 = v15;
              _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p now invoking %lu blocks waiting for bootstrap of Cluster %@", buf, 0x20u);
            }

            [v8 addObjectsFromArray:v17];
            [v7 removeObjectForKey:v15];
          }
        }
        else
        {
          __int16 v17 = COCoreLogForCategory(13);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            __int16 v30 = self;
            __int16 v31 = 2112;
            uint64_t v32 = v15;
            _os_log_error_impl(&dword_2217C1000, v17, OS_LOG_TYPE_ERROR, "%p NOT invoking blocks waiting for bootstrap of Cluster %@, not bootstrapped", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v12);
  }

  [(COClusterAliasManager *)self setWaiting:v7];
  uint64_t v20 = [(COClusterAliasManager *)self delegateDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__COClusterAliasManager__invokeWaitingBlocksForClusters___block_invoke;
  block[3] = &unk_2645CB288;
  id v24 = v8;
  id v21 = v8;
  dispatch_async(v20, block);
}

void __57__COClusterAliasManager__invokeWaitingBlocksForClusters___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_deactivateMeshWithClusterIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  long long v6 = [(COClusterAliasManager *)self stopping];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    long long v8 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(COClusterAliasManager *)(uint64_t)self _deactivateMeshWithClusterIdentifier:v8];
    }
  }
  else
  {
    long long v9 = [(COClusterAliasManager *)self meshes];
    long long v8 = [v9 objectForKey:v4];

    if (v8)
    {
      uint64_t v10 = [(COClusterAliasManager *)self stopping];
      uint64_t v11 = [v10 setByAddingObject:v4];

      [(COClusterAliasManager *)self setStopping:v11];
      uint64_t v12 = COCoreLogForCategory(13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134218754;
        __int16 v17 = self;
        __int16 v18 = 2048;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        id v21 = v4;
        __int16 v22 = 2048;
        uint64_t v23 = [v11 count];
        _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p deactivating %p with %@ (%lu stopping)", (uint8_t *)&v16, 0x2Au);
      }

      uint64_t v13 = [(COClusterAliasManager *)self starting];
      char v14 = [v13 containsObject:v4];

      if (v14)
      {
        uint64_t v15 = COCoreLogForCategory(13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 134218498;
          __int16 v17 = self;
          __int16 v18 = 2048;
          uint64_t v19 = v8;
          __int16 v20 = 2112;
          id v21 = v4;
          _os_log_debug_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEBUG, "%p deferring deactivation of %p with %@", (uint8_t *)&v16, 0x20u);
        }
      }
      else
      {
        [v8 stop];
      }
    }
  }
}

- (void)_activateMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  long long v9 = [(COClusterAliasManager *)self meshes];
  uint64_t v10 = [v9 objectForKey:v6];

  if (v10)
  {
    uint64_t v11 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      id v21 = self;
      __int16 v22 = 2048;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p found existing %p with %@ for %@ to activate", buf, 0x2Au);
    }

    goto LABEL_6;
  }
  uint64_t v10 = [(COClusterAliasManager *)self _prepareNewMeshWithClusterIdentifier:v6 forClusters:v7];
  if (v10)
  {
LABEL_6:
    uint64_t v12 = [(COClusterAliasManager *)self starting];
    uint64_t v13 = [v12 setByAddingObject:v6];

    [(COClusterAliasManager *)self setStarting:v13];
    char v14 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      id v21 = self;
      __int16 v22 = 2048;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p activating %p with %@ for %@", buf, 0x2Au);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__COClusterAliasManager__activateMeshWithClusterIdentifier_forClusters___block_invoke;
    v16[3] = &unk_2645CB458;
    v16[4] = self;
    id v17 = v6;
    id v18 = v10;
    id v19 = v7;
    uint64_t v15 = v10;
    [(COClusterAliasManager *)self _delegateNotifyActivatingMesh:v15 withClusterIdentifier:v17 forClusters:v19 completion:v16];

    goto LABEL_9;
  }
  uint64_t v15 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_error_impl(&dword_2217C1000, v15, OS_LOG_TYPE_ERROR, "%p unable to activate with %@ for %@", buf, 0x20u);
  }
LABEL_9:
}

void __72__COClusterAliasManager__activateMeshWithClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) starting];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setStarting:v3];
  id v4 = [*(id *)(a1 + 32) stopping];
  char v5 = [v4 containsObject:*(void *)(a1 + 40)];

  if (v5)
  {
    [*(id *)(a1 + 32) didStopMeshController:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v11 = 134219010;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = [v3 count];
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p starting %p with %@ for %@ (%lu starting)", (uint8_t *)&v11, 0x34u);
    }

    [*(id *)(a1 + 48) start];
    [*(id *)(a1 + 32) _invokeWaitingBlocksForClusters:*(void *)(a1 + 56)];
  }
}

- (id)_prepareNewMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COClusterAliasManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v7 anyObject];
  uint64_t v10 = [v9 configuration];

  uint64_t v11 = [v10 options];
  uint64_t v12 = [(COClusterAliasManager *)self _providerRequestMesh];
  [v12 setClusterOptions:v11];
  __int16 v13 = [v10 globalServiceName];
  [v12 setGlobalServiceName:v13];

  if (v12)
  {
    uint64_t v14 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = (uint64_t)v12;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v6;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v7;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p created %p with %@ for %@", buf, 0x2Au);
    }

    [v12 setMeshName:v6];
    __int16 v15 = [(COClusterAliasManager *)self _labelForClusters:v7];
    [v12 setLabel:v15];

    uint64_t v16 = objc_alloc_init(_COClusterAliasManagerStateTrackingAddOn);
    [(_COClusterAliasManagerStateTrackingAddOn *)v16 setAliasManager:self];
    v37 = v16;
    [v12 addAddOn:v16];
    __int16 v17 = [(COClusterAliasManager *)self meshes];
    uint64_t v36 = v17;
    if ([MEMORY[0x263F33F80] isSharedCompanionLinkClientEnabled])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v18 = [v17 allValues];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v39 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = [*(id *)(*((void *)&v38 + 1) + 8 * i) companionLinkClientFactory];
            if (v23)
            {
              __int16 v24 = (COCompanionLinkClientFactory *)v23;

              goto LABEL_15;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      __int16 v24 = objc_alloc_init(COCompanionLinkClientFactory);
LABEL_15:
      [v12 setCompanionLinkClientFactory:v24];

      __int16 v17 = v36;
    }
    id v25 = (void *)[v17 mutableCopy];
    [v25 setObject:v12 forKey:v6];
    [(COClusterAliasManager *)self setMeshes:v25];
    __int16 v26 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v25 count];
      id v27 = [(COClusterAliasManager *)self starting];
      uint64_t v28 = v10;
      id v29 = v7;
      id v30 = v6;
      uint64_t v31 = [v27 count];
      uint64_t v32 = [(COClusterAliasManager *)self stopping];
      uint64_t v33 = [v32 count];
      *(_DWORD *)buf = 134218752;
      v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = v35;
      __int16 v47 = 2048;
      uint64_t v48 = v31;
      id v6 = v30;
      id v7 = v29;
      uint64_t v10 = v28;
      __int16 v49 = 2048;
      uint64_t v50 = v33;
      _os_log_impl(&dword_2217C1000, v26, OS_LOG_TYPE_DEFAULT, "%p now %lu meshes (%lu starting, %lu stopping)", buf, 0x2Au);

      __int16 v17 = v36;
    }
  }
  return v12;
}

- (void)didStopMeshController:(id)a3
{
  id v4 = a3;
  char v5 = [v4 meshName];
  id v6 = [(COClusterAliasManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__COClusterAliasManager_didStopMeshController___block_invoke;
  block[3] = &unk_2645CAEF8;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __47__COClusterAliasManager_didStopMeshController___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) associations];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v4 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v3;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p deactivating stopped %p with %@ for %@", buf, 0x2Au);
  }

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__COClusterAliasManager_didStopMeshController___block_invoke_22;
  v11[3] = &unk_2645CAEF8;
  v11[4] = v10;
  id v12 = v8;
  id v13 = *(id *)(a1 + 48);
  [v10 _delegateNotifyDeactivatingMesh:v9 withClusterIdentifier:v12 forClusters:v3 completion:v11];
}

void __47__COClusterAliasManager_didStopMeshController___block_invoke_22(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) meshes];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMeshes:v3];
  id v4 = [*(id *)(a1 + 32) stopping];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setStopping:v5];
  uint64_t v6 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v3 count];
    id v11 = [*(id *)(a1 + 32) starting];
    int v12 = 134219266;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = [v11 count];
    __int16 v22 = 2048;
    uint64_t v23 = [v5 count];
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p removing deactivated %p with %@ (now %lu meshes, %lu starting, %lu stopping)", (uint8_t *)&v12, 0x3Eu);
  }
  [*(id *)(a1 + 32) _applyUpdates];
}

- (id)_providerRequestMesh
{
  uint64_t v3 = [(COClusterAliasManager *)self provider];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 aliasManagerRequestsNewMesh:self];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_delegateNotifyActivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke;
  v25[3] = &unk_2645CBA60;
  objc_copyWeak(&v27, &location);
  id v14 = v13;
  id v26 = v14;
  uint64_t v15 = (void (**)(void))MEMORY[0x223C8B4A0](v25);
  __int16 v16 = [(COClusterAliasManager *)self delegate];
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v17 = [(COClusterAliasManager *)self delegateDispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2;
    block[3] = &unk_2645CAF70;
    id v19 = v16;
    __int16 v20 = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    uint64_t v24 = v15;
    dispatch_async(v17, block);
  }
  else
  {
    v15[2](v15);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained dispatchQueue];
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));

    id WeakRetained = v4;
  }
}

uint64_t __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) aliasManager:*(void *)(a1 + 40) activatingMesh:*(void *)(a1 + 48) withClusterIdentifier:*(void *)(a1 + 56) forClusters:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (void)_delegateNotifyDeactivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke;
  v25[3] = &unk_2645CBA60;
  objc_copyWeak(&v27, &location);
  id v14 = v13;
  id v26 = v14;
  uint64_t v15 = (void (**)(void))MEMORY[0x223C8B4A0](v25);
  __int16 v16 = [(COClusterAliasManager *)self delegate];
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v17 = [(COClusterAliasManager *)self delegateDispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2;
    block[3] = &unk_2645CAF70;
    id v19 = v16;
    __int16 v20 = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    uint64_t v24 = v15;
    dispatch_async(v17, block);
  }
  else
  {
    v15[2](v15);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained dispatchQueue];
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));

    id WeakRetained = v4;
  }
}

uint64_t __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) aliasManager:*(void *)(a1 + 40) deactivatingMesh:*(void *)(a1 + 48) withClusterIdentifier:*(void *)(a1 + 56) forClusters:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
}

- (id)_labelForClusters:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) label];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *MEMORY[0x263F33DB8];
  v31[0] = *MEMORY[0x263F33DB0];
  v31[1] = v11;
  uint64_t v12 = *MEMORY[0x263F33DA8];
  v31[2] = *MEMORY[0x263F33DA0];
  v31[3] = v12;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
LABEL_10:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v13);
      }
      __int16 v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
      if (objc_msgSend(v4, "containsObject:", v18, (void)v22)) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    id v19 = v18;

    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_16:
  }
  __int16 v20 = objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_, (void)v22);
  id v19 = [v20 componentsJoinedByString:@"|"];

LABEL_19:
  return v19;
}

- (COClusterAliasManagerMeshProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (COClusterAliasManagerMeshProvider *)WeakRetained;
}

- (COClusterAliasManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COClusterAliasManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  return self->_delegateDispatchQueue;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSDictionary)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
}

- (NSSet)resolving
{
  return self->_resolving;
}

- (void)setResolving:(id)a3
{
}

- (NSDictionary)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(id)a3
{
}

- (NSDictionary)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (NSDictionary)associations
{
  return self->_associations;
}

- (void)setAssociations:(id)a3
{
}

- (NSDictionary)meshes
{
  return self->_meshes;
}

- (void)setMeshes:(id)a3
{
}

- (NSSet)starting
{
  return self->_starting;
}

- (void)setStarting:(id)a3
{
}

- (NSSet)stopping
{
  return self->_stopping;
}

- (void)setStopping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopping, 0);
  objc_storeStrong((id *)&self->_starting, 0);
  objc_storeStrong((id *)&self->_meshes, 0);
  objc_storeStrong((id *)&self->_associations, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
  objc_storeStrong((id *)&self->_resolving, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegateDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_provider);
}

void __45__COClusterAliasManager_stopTrackingCluster___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p not tracking %@");
}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%p no resolver for Cluster %@, invoking bootstrap block inline");
}

- (void)_deactivateMeshWithClusterIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%p already deactivating %@", (uint8_t *)&v3, 0x16u);
}

@end