@interface EDAccountRepository
+ (OS_os_log)log;
- (EDAccountECAccountTransformer)transformer;
- (EDAccountRepository)initWithAccountsProvider:(id)a3 hookRegistry:(id)a4;
- (EDAccountsProvider)accountsProvider;
- (EDPersistenceHookRegistry)hookRegistry;
- (id)allAccounts;
- (id)transformAccounts:(id)a3;
- (void)accountsAdded:(id)a3;
- (void)accountsChanged:(id)a3;
- (void)accountsRemoved:(id)a3;
- (void)allAccountsWithCompletionHandler:(id)a3;
- (void)registerObserver:(id)a3 completionHandler:(id)a4;
- (void)setAccountsProvider:(id)a3;
- (void)setHookRegistry:(id)a3;
- (void)setTransformer:(id)a3;
@end

@implementation EDAccountRepository

id __41__EDAccountRepository_transformAccounts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) transformer];
  v5 = [v4 transformAccount:v3];

  return v5;
}

- (EDAccountECAccountTransformer)transformer
{
  return self->_transformer;
}

uint64_t __41__EDAccountRepository_transformAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F35FE498]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 isLocalAccount] ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

- (void)registerObserver:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, id, void))a4;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_observers addObject:v6];
  os_unfair_lock_unlock(&self->_lock);
  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__EDAccountRepository_registerObserver_completionHandler___block_invoke;
  v13[3] = &unk_1E6BFF198;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v14 = v9;
  [v8 addCancelationBlock:v13];
  v10 = [(EDAccountRepository *)self allAccounts];
  v11 = +[EDAccountRepository log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134218498;
    id v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_INFO, "Registered EMAccountRepositoryObserver<%p> - Current observing accounts: Count: %lu\n %@ ", buf, 0x20u);
  }

  v7[2](v7, v10, v8, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)allAccounts
{
  id v3 = [(EDAccountRepository *)self accountsProvider];
  id v4 = [v3 mailAccounts];

  v5 = [(EDAccountRepository *)self transformAccounts:v4];

  return v5;
}

- (id)transformAccounts:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ef_filter:", &__block_literal_global);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__EDAccountRepository_transformAccounts___block_invoke_2;
  v8[3] = &unk_1E6BFF1E0;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "ef_map:", v8);

  return v6;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EDAccountRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  id v2 = (void *)log_log;

  return (OS_os_log *)v2;
}

- (EDAccountRepository)initWithAccountsProvider:(id)a3 hookRegistry:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDAccountRepository;
  id v9 = [(EDAccountRepository *)&v18 init];
  if (v9)
  {
    v10 = objc_alloc_init(EDAccountECAccountTransformer);
    transformer = v9->_transformer;
    v9->_transformer = v10;

    objc_storeStrong((id *)&v9->_accountsProvider, a3);
    objc_storeWeak((id *)&v9->_hookRegistry, v8);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v9->_observers;
    v9->_observers = v12;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_hookRegistry);
    [WeakRetained registerAccountChangeHookResponder:v9];

    id v15 = (void *)MEMORY[0x1E4F60418];
    v19[0] = *MEMORY[0x1E4F60080];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v15 addValidSortDescriptorKeyPaths:v16 forTargetClass:objc_opt_class()];
  }
  return v9;
}

void __26__EDAccountRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

void __58__EDAccountRepository_registerObserver_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 4;
    id v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    [v4[1] removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3);
    id WeakRetained = (os_unfair_lock_s *)v4;
  }
}

- (void)allAccountsWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  v5 = [(EDAccountRepository *)self allAccounts];
  id v6 = +[EDAccountRepository log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = [v5 count];
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "Returning %lu accounts", (uint8_t *)&v7, 0xCu);
  }

  v4[2](v4, v5, 0);
}

- (void)accountsAdded:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EDAccountRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "Handling accounts added: %@", buf, 0xCu);
  }

  id v6 = [(EDAccountRepository *)self transformAccounts:v4];
  if ([v6 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = (void *)[(NSMutableSet *)self->_observers copy];
    os_unfair_lock_unlock(p_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "accountsAdded:", v6, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)accountsRemoved:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EDAccountRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "Handling accounts removed: %@", buf, 0xCu);
  }

  id v6 = [(EDAccountRepository *)self transformAccounts:v4];
  if ([v6 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = (void *)[(NSMutableSet *)self->_observers copy];
    os_unfair_lock_unlock(p_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "accountsRemoved:", v6, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)accountsChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EDAccountRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "Handling accounts changed: %@", buf, 0xCu);
  }

  id v6 = [(EDAccountRepository *)self transformAccounts:v4];
  if ([v6 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = (void *)[(NSMutableSet *)self->_observers copy];
    os_unfair_lock_unlock(p_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "accountsChanged:", v6, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setTransformer:(id)a3
{
}

- (void)setAccountsProvider:(id)a3
{
}

- (EDPersistenceHookRegistry)hookRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hookRegistry);

  return (EDPersistenceHookRegistry *)WeakRetained;
}

- (void)setHookRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hookRegistry);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_transformer, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end