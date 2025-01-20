@interface EMAccountRepository
+ (OS_os_log)log;
+ (id)remoteInterface;
- (EMAccountRepository)initWithRemoteConnection:(id)a3;
- (NSArray)allAccounts;
- (NSArray)deliveryAccounts;
- (NSArray)receivingAccounts;
- (id)_currentAccountsByObjectIDMap;
- (id)accountForAccountIdentifier:(id)a3;
- (id)accountForIdentifier:(id)a3;
- (void)_currentAccountsByObjectIDMap;
- (void)_fetchAccountsAndObserveChanges;
- (void)_postAccountChangedNotification;
- (void)accountsAdded:(id)a3;
- (void)accountsChanged:(id)a3;
- (void)accountsRemoved:(id)a3;
- (void)dealloc;
- (void)requestAccounts;
@end

@implementation EMAccountRepository

- (id)accountForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(EMAccountRepository *)self _currentAccountsByObjectIDMap];
    v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __38__EMAccountRepository_requestAccounts__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _currentAccountsByObjectIDMap];
}

- (id)_currentAccountsByObjectIDMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_accounts && self->_cancelable)
  {
    id v4 = +[EMAccountRepository log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(EMAccountRepository *)(uint64_t)self _currentAccountsByObjectIDMap];
    }
  }
  else
  {
    v5 = +[EMAccountRepository log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(EMAccountRepository *)(uint64_t)self _currentAccountsByObjectIDMap];
    }

    [(EMAccountRepository *)self _fetchAccountsAndObserveChanges];
  }
  v6 = (void *)[(NSMutableDictionary *)self->_accounts copy];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EMAccountRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

- (void)_fetchAccountsAndObserveChanges
{
  v3 = [(EMRepository *)self connection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  v5 = [(EMRepository *)self observerScheduler];
  v6 = [(EMAccountRepository *)self ef_onScheduler:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_81;
  v7[3] = &unk_1E63E26F8;
  v7[4] = self;
  [v4 registerObserver:v6 completionHandler:v7];
}

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64288];
  [v7 setClasses:v6 forSelector:sel_accountsAdded_ argumentIndex:0 ofReply:0];
  [v7 setClasses:v6 forSelector:sel_accountsRemoved_ argumentIndex:0 ofReply:0];
  [v7 setClasses:v6 forSelector:sel_accountsChanged_ argumentIndex:0 ofReply:0];
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A866F0];
  [v8 setClasses:v6 forSelector:sel_registerObserver_completionHandler_ argumentIndex:0 ofReply:1];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64B98];
  [v8 setInterface:v9 forSelector:sel_registerObserver_completionHandler_ argumentIndex:1 ofReply:1];

  [v8 setInterface:v7 forSelector:sel_registerObserver_completionHandler_ argumentIndex:0 ofReply:0];
  return v8;
}

- (EMAccountRepository)initWithRemoteConnection:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMAccountRepository;
  uint64_t v5 = [(EMRepository *)&v18 initWithRemoteConnection:v4];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x1E4F60F28];
    v8 = [NSString stringWithFormat:@"com.apple.email.%@.recoveryHandler", objc_opt_class()];
    uint64_t v9 = [v7 serialDispatchQueueSchedulerWithName:v8];
    recoveryHandlerScheduler = v6->_recoveryHandlerScheduler;
    v6->_recoveryHandlerScheduler = (EFScheduler *)v9;

    v19[0] = @"name";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    +[EMQuery addValidSortDescriptorKeyPaths:v11 forTargetClass:objc_opt_class()];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke;
    v15[3] = &unk_1E63E2688;
    objc_copyWeak(&v16, &location);
    [v4 addResetHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke_2;
    v13[3] = &unk_1E63E2688;
    objc_copyWeak(&v14, &location);
    [v4 addRecoveryHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_81(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = +[EMAccountRepository log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = objc_msgSend(v9, "ef_publicDescription");
      __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_81_cold_1(v11, v12, (uint8_t *)&v21, v10);
    }
  }
  else
  {
    v13 = +[EMAccountRepository log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      id v22 = v7;
      _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "Initialized with accounts: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    id v14 = (void *)MEMORY[0x1E4F1CA60];
    v15 = objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
    uint64_t v16 = [v14 dictionaryWithObjects:v7 forKeys:v15];
    uint64_t v17 = *(void *)(a1 + 32);
    objc_super v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v8;
    v10 = *(NSObject **)(v19 + 56);
    *(void *)(v19 + 56) = v20;
  }
}

- (void)requestAccounts
{
  recoveryHandlerScheduler = self->_recoveryHandlerScheduler;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__EMAccountRepository_requestAccounts__block_invoke;
  v3[3] = &unk_1E63E26B0;
  v3[4] = self;
  [(EFScheduler *)recoveryHandlerScheduler performBlock:v3];
}

void __26__EMAccountRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[6];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__EMAccountRepository_initWithRemoteConnection___block_invoke_3;
    v4[3] = &unk_1E63E26B0;
    uint64_t v5 = WeakRetained;
    [v3 performBlock:v4];
  }
}

void __48__EMAccountRepository_initWithRemoteConnection___block_invoke_3(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_lock(v2);
  [*(id *)(a1 + 32) _fetchAccountsAndObserveChanges];
  os_unfair_lock_unlock(v2);
}

- (void)dealloc
{
  [(EFCancelable *)self->_cancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)EMAccountRepository;
  [(EMAccountRepository *)&v3 dealloc];
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = +[EMAccountRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (NSArray)allAccounts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(EMAccountRepository *)self _currentAccountsByObjectIDMap];
  objc_super v3 = [v2 allValues];

  id v4 = +[EMAccount sortDescriptorForNameAscending:1];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [v3 sortedArrayUsingDescriptors:v5];

  return (NSArray *)v6;
}

- (NSArray)receivingAccounts
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(EMAccountRepository *)self allAccounts];
  objc_super v3 = [EMQuery alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[EMAccount predicateForReceivingAccounts];
  v6 = +[EMAccount sortDescriptorForNameAscending:1];
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = [(EMQuery *)v3 initWithTargetClass:v4 predicate:v5 sortDescriptors:v7];

  id v9 = [(EMQuery *)v8 predicate];
  v10 = [v2 filteredArrayUsingPredicate:v9];

  uint64_t v11 = objc_msgSend(v10, "ef_map:", &__block_literal_global_88);

  return (NSArray *)v11;
}

id __40__EMAccountRepository_receivingAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (NSArray)deliveryAccounts
{
  id v2 = [(EMAccountRepository *)self receivingAccounts];
  objc_super v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_91);

  return (NSArray *)v3;
}

id __39__EMAccountRepository_deliveryAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 deliveryAccount];
  return v2;
}

- (id)accountForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[EMObjectID alloc] initWithRepresentedObjectID:v4];
  v6 = [(EMAccountRepository *)self accountForIdentifier:v5];

  return v6;
}

- (void)accountsAdded:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EMAccountRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Processing added accounts: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accounts = self->_accounts;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  id v9 = [v7 dictionaryWithObjects:v4 forKeys:v8];
  [(NSMutableDictionary *)accounts addEntriesFromDictionary:v9];

  os_unfair_lock_unlock(&self->_lock);
  [(EMAccountRepository *)self _postAccountChangedNotification];
}

- (void)accountsRemoved:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EMAccountRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Processing removed accounts: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accounts = self->_accounts;
  id v7 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  [(NSMutableDictionary *)accounts removeObjectsForKeys:v7];

  os_unfair_lock_unlock(&self->_lock);
  [(EMAccountRepository *)self _postAccountChangedNotification];
}

- (void)accountsChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = +[EMAccountRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v12;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Processing changed accounts: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v12;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        accounts = self->_accounts;
        id v11 = [v9 objectID];
        [(NSMutableDictionary *)accounts setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  [(EMAccountRepository *)self _postAccountChangedNotification];
}

- (void)_postAccountChangedNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"EMAccountsChangedNotification" object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_recoveryHandlerScheduler, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch accounts %{public}@", (uint8_t *)&v2, 0xCu);
}

void __54__EMAccountRepository__fetchAccountsAndObserveChanges__block_invoke_81_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "EMAccountRepository<%p> Registering observer for account changes failed with error: %{public}@", buf, 0x16u);
}

- (void)_currentAccountsByObjectIDMap
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_DEBUG, "EMAccountRepository<%p> already observing account changes", (uint8_t *)&v2, 0xCu);
}

@end