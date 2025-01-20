@interface COClusterResolver
+ (id)resolverForCluster:(id)a3 delegate:(id)a4;
- (BOOL)_updateIdentifier:(id)a3;
- (BOOL)activatedCluster;
- (BOOL)bootstrapCompleted;
- (COCluster)cluster;
- (COClusterResolverDelegate)delegate;
- (NSArray)waitingForBootstrap;
- (NSString)currentIdentifier;
- (id)_initWithCluster:(id)a3 delegate:(id)a4;
- (id)description;
- (void)_activate;
- (void)_delegateNotifyClusterIdentifierChanged:(id)a3;
- (void)_invokeBootstrapBlocks;
- (void)_withLock:(id)a3;
- (void)activate;
- (void)setActivatedCluster:(BOOL)a3;
- (void)setBootstrapCompleted:(BOOL)a3;
- (void)setCurrentIdentifier:(id)a3;
- (void)setWaitingForBootstrap:(id)a3;
@end

@implementation COClusterResolver

- (id)_initWithCluster:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterResolver;
  v9 = [(COClusterResolver *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_cluster, a3);
    objc_storeWeak(p_isa + 3, v8);
  }

  return p_isa;
}

+ (id)resolverForCluster:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithCluster:v7 delegate:v6];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COClusterResolver *)self currentIdentifier];
  id v7 = [(COClusterResolver *)self cluster];
  BOOL v8 = [(COClusterResolver *)self activatedCluster];
  BOOL v9 = [(COClusterResolver *)self bootstrapCompleted];
  uint64_t v10 = 78;
  if (v9) {
    uint64_t v11 = 89;
  }
  else {
    uint64_t v11 = 78;
  }
  if (v8) {
    uint64_t v10 = 89;
  }
  objc_super v12 = [v3 stringWithFormat:@"<%@: %p, i(%@) c(%@) a(%c) b(%c)>"], v5, self, v6, v7, v10, v11);

  return v12;
}

- (void)activate
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __29__COClusterResolver_activate__block_invoke;
  v3[3] = &unk_2645CB120;
  v3[4] = self;
  v3[5] = &v4;
  [(COClusterResolver *)self _withLock:v3];
  if (*((unsigned char *)v5 + 24)) {
    [(COClusterResolver *)self _activate];
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __29__COClusterResolver_activate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) activatedCluster];
  if (result)
  {
    char v3 = 0;
  }
  else
  {
    uint64_t v4 = COCoreLogForCategory(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v5 cluster];
      int v7 = 134218242;
      BOOL v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p activating resolver for Cluster %@", (uint8_t *)&v7, 0x16u);
    }
    char v3 = 1;
    uint64_t result = [*(id *)(a1 + 32) setActivatedCluster:1];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)_activate
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_initWeak(&location, self);
  char v3 = [(COClusterResolver *)self cluster];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__COClusterResolver__activate__block_invoke;
  v4[3] = &unk_2645CB4A8;
  objc_copyWeak(&v5, &location);
  [v3 activate:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__COClusterResolver__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__COClusterResolver__activate__block_invoke_2;
    v7[3] = &unk_2645CAED0;
    v7[4] = WeakRetained;
    id v6 = v3;
    id v8 = v6;
    __int16 v9 = &v10;
    [v5 _withLock:v7];
    [v5 _delegateNotifyClusterIdentifierChanged:v6];
    if (*((unsigned char *)v11 + 24)) {
      [v5 _invokeBootstrapBlocks];
    }

    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __30__COClusterResolver__activate__block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) bootstrapCompleted];
  [*(id *)(a1 + 32) setBootstrapCompleted:1];
  uint64_t result = [*(id *)(a1 + 32) _updateIdentifier:*(void *)(a1 + 40)];
  if ((v2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_invokeBootstrapBlocks
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__COClusterResolver__invokeBootstrapBlocks__block_invoke;
  v10[3] = &unk_2645CAE08;
  v10[4] = self;
  v10[5] = &v11;
  [(COClusterResolver *)self _withLock:v10];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = (id)v12[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v17 count:16];
    }
    while (v3);
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __43__COClusterResolver__invokeBootstrapBlocks__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) waitingForBootstrap];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 setWaitingForBootstrap:0];
}

- (BOOL)_updateIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = [(COClusterResolver *)self currentIdentifier];
  long long v6 = COCoreLogForCategory(13);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    unint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p identifier updated to %@ from %@", (uint8_t *)&v9, 0x20u);
  }

  if (v4 | v5 && ([(id)v5 isEqual:v4] & 1) == 0)
  {
    [(COClusterResolver *)self setCurrentIdentifier:v4];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_delegateNotifyClusterIdentifierChanged:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  unint64_t v4 = [(COClusterResolver *)self delegate];
  uint64_t v5 = v4;
  if (v4) {
    [v4 resolver:self clusterIdentifierChanged:v6];
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  unint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (COClusterResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COClusterResolverDelegate *)WeakRetained;
}

- (NSString)currentIdentifier
{
  return self->_currentIdentifier;
}

- (void)setCurrentIdentifier:(id)a3
{
}

- (BOOL)activatedCluster
{
  return self->_activatedCluster;
}

- (void)setActivatedCluster:(BOOL)a3
{
  self->_activatedCluster = a3;
}

- (BOOL)bootstrapCompleted
{
  return self->_bootstrapCompleted;
}

- (void)setBootstrapCompleted:(BOOL)a3
{
  self->_bootstrapCompleted = a3;
}

- (NSArray)waitingForBootstrap
{
  return self->_waitingForBootstrap;
}

- (void)setWaitingForBootstrap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForBootstrap, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cluster, 0);
}

@end