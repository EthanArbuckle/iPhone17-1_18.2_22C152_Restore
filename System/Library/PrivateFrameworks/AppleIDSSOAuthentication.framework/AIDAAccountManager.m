@interface AIDAAccountManager
+ (id)_accountStoreChangeQueue;
- (ACAccountStore)accountStore;
- (AIDAAccountManager)init;
- (AIDAAccountManager)initWithAccountStore:(id)a3;
- (AIDAAccountManagerDelegate)delegate;
- (NSDictionary)accounts;
- (id)_delegate_accountsForAccountManager;
- (id)aidaAccountForService:(id)a3;
- (void)_accountStoreDidChange:(id)a3;
- (void)_delegate_accountsForAccountManager;
- (void)addAccountChangeObserver:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)removeAccountChangeObserver:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AIDAAccountManager

- (void)setDelegate:(id)a3
{
}

- (void)addAccountChangeObserver:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
  v8 = +[AIDAAccountManager _accountStoreChangeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AIDAAccountManager_addAccountChangeObserver_handler___block_invoke;
  block[3] = &unk_1E6CBECF8;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (id)_accountStoreChangeQueue
{
  if (_accountStoreChangeQueue_onceToken != -1) {
    dispatch_once(&_accountStoreChangeQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)_accountStoreChangeQueue__accountStoreChangeQueue;
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AIDAAccountManager;
  [(AIDAAccountManager *)&v4 dealloc];
}

void __46__AIDAAccountManager__accountStoreChangeQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("AIDAAccountChangeQueue", v2);
  v1 = (void *)_accountStoreChangeQueue__accountStoreChangeQueue;
  _accountStoreChangeQueue__accountStoreChangeQueue = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_handlerByObserver, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
}

- (AIDAAccountManager)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AIDAAccountManager;
  id v6 = [(AIDAAccountManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = [[AIDAServiceOwnersManager alloc] initWithAccountStore:v5];
    serviceOwnersManager = v7->_serviceOwnersManager;
    v7->_serviceOwnersManager = (AIDAServiceOwnerProtocol *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    handlerByObserver = v7->_handlerByObserver;
    v7->_handlerByObserver = (NSMutableDictionary *)v10;

    v7->_accountManagerLock._os_unfair_lock_opaque = 0;
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:0];
  }
  return v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

void __55__AIDAAccountManager_addAccountChangeObserver_handler___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  id v3 = (id)MEMORY[0x1E01B3300](a1[6]);
  [v2 setObject:v3 forKey:a1[5]];
}

- (AIDAAccountManager)init
{
  return 0;
}

- (NSDictionary)accounts
{
  p_accountManagerLock = &self->_accountManagerLock;
  os_unfair_lock_lock(&self->_accountManagerLock);
  accounts = self->_accounts;
  if (!accounts)
  {
    id v5 = [(AIDAAccountManager *)self _delegate_accountsForAccountManager];
    id v6 = (NSDictionary *)[v5 copy];
    v7 = self->_accounts;
    self->_accounts = v6;

    accounts = self->_accounts;
  }
  v8 = (void *)[(NSDictionary *)accounts copy];
  os_unfair_lock_unlock(p_accountManagerLock);
  return (NSDictionary *)v8;
}

- (void)setAccounts:(id)a3
{
  objc_super v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_accountManagerLock);
  accounts = self->_accounts;
  self->_accounts = v4;

  os_unfair_lock_unlock(&self->_accountManagerLock);
}

- (id)aidaAccountForService:(id)a3
{
  id v4 = a3;
  id v5 = [(AIDAAccountManager *)self accounts];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v6 service:v4];
    if (v7)
    {
      v8 = [(AIDAAccountManager *)self accountStore];
      id v9 = objc_msgSend(v8, "aida_accountForAltDSID:", v7);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_delegate_accountsForAccountManager
{
  id v3 = [(AIDAAccountManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AIDAAccountManager *)self delegate];
    id v6 = [v5 accountsForAccountManager:self];
  }
  else
  {
    v7 = _AIDALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(AIDAAccountManager *)self _delegate_accountsForAccountManager];
    }

    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

- (void)_accountStoreDidChange:(id)a3
{
  char v4 = +[AIDAAccountManager _accountStoreChangeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AIDAAccountManager__accountStoreDidChange___block_invoke;
  block[3] = &unk_1E6CBECD0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __45__AIDAAccountManager__accountStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accounts];
  [*(id *)(a1 + 32) setAccounts:0];
  id v3 = [*(id *)(a1 + 32) accounts];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v4 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    v8 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__AIDAAccountManager__accountStoreDidChange___block_invoke_2;
        block[3] = &unk_1E6CBECA8;
        uint64_t v14 = v10;
        id v12 = v2;
        id v13 = v3;
        dispatch_async(v8, block);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

uint64_t __45__AIDAAccountManager__accountStoreDidChange___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeAccountChangeObserver:(id)a3
{
  char v4 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
  uint64_t v5 = +[AIDAAccountManager _accountStoreChangeQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AIDAAccountManager_removeAccountChangeObserver___block_invoke;
  v7[3] = &unk_1E6CBED20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__AIDAAccountManager_removeAccountChangeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (AIDAAccountManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIDAAccountManagerDelegate *)WeakRetained;
}

- (void)_delegate_accountsForAccountManager
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 delegate];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DD36A000, a2, OS_LOG_TYPE_ERROR, "Delegate %{public}@ failed respond to -accountsForAccountManager: !", (uint8_t *)&v4, 0xCu);
}

@end