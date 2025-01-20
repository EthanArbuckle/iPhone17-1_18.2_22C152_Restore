@interface CNContainerCache
+ (id)os_log;
- (ACAccountStore)accountStore;
- (CNCache)cachedAccounts;
- (CNContactStore)contactStore;
- (CNContainer)primaryiCloudContainer;
- (CNContainerCache)initWithContactStore:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)accountForContainer:(id)a3;
- (id)cnAccountForContainer:(id)a3;
- (id)onWorkQueue_findPrimaryiCloudContainer;
- (void)accountStoreDidChange;
- (void)contactStoreDidChange;
- (void)dealloc;
- (void)onWorkQueue_findPrimaryiCloudContainer;
- (void)resetAccountCache;
- (void)resetPrimaryiCloudContainer;
- (void)setAccountStore:(id)a3;
- (void)setCachedAccounts:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setPrimaryiCloudContainer:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CNContainerCache

+ (id)os_log
{
  if (os_log_cn_once_token_0_20 != -1) {
    dispatch_once(&os_log_cn_once_token_0_20, &__block_literal_global_129);
  }
  v2 = (void *)os_log_cn_once_object_0_20;

  return v2;
}

uint64_t __26__CNContainerCache_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNContainerCache");
  uint64_t v1 = os_log_cn_once_object_0_20;
  os_log_cn_once_object_0_20 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNContainerCache)initWithContactStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContainerCache;
  v5 = [(CNContainerCache *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contactStore, v4);
    accountStore = v6->_accountStore;
    v6->_accountStore = 0;

    v8 = (CNCache *)objc_alloc_init(MEMORY[0x1E4F5A360]);
    cachedAccounts = v6->_cachedAccounts;
    v6->_cachedAccounts = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Contacts.CNContainerCache", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel_accountStoreDidChange name:*MEMORY[0x1E4F178D8] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel_contactStoreDidChange name:@"CNContactStoreDidChangeNotification" object:0];

    v14 = v6;
  }

  return v6;
}

- (void)accountStoreDidChange
{
  v3 = [(CNContainerCache *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CNContainerCache_accountStoreDidChange__block_invoke;
  block[3] = &unk_1E56B4530;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__CNContainerCache_accountStoreDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAccountCache];
}

- (void)contactStoreDidChange
{
  v3 = [(CNContainerCache *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CNContainerCache_contactStoreDidChange__block_invoke;
  block[3] = &unk_1E56B4530;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__CNContainerCache_contactStoreDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetPrimaryiCloudContainer];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContainerCache;
  [(CNContainerCache *)&v4 dealloc];
}

- (ACAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_super v4 = [MEMORY[0x1E4F179C8] defaultStore];
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (CNContainer)primaryiCloudContainer
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__31;
  v11 = __Block_byref_object_dispose__31;
  id v12 = 0;
  v3 = [(CNContainerCache *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CNContainerCache_primaryiCloudContainer__block_invoke;
  v6[3] = &unk_1E56B85F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNContainer *)v4;
}

void __42__CNContainerCache_primaryiCloudContainer__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(v2, "onWorkQueue_findPrimaryiCloudContainer");
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

- (id)onWorkQueue_findPrimaryiCloudContainer
{
  v3 = +[CNContainer predicateForContainersIncludingDisabled:0];
  uint64_t v4 = [(CNContainerCache *)self contactStore];
  id v11 = 0;
  uint64_t v5 = [v4 containersMatchingPredicate:v3 error:&v11];
  id v6 = v11;

  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CNContainerCache *)(uint64_t)v6 onWorkQueue_findPrimaryiCloudContainer];
    }
    v8 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_15_0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke_2;
    v10[3] = &unk_1E56B8DB8;
    v10[4] = self;
    v8 = [v7 _cn_firstObjectPassingTest:v10];
  }

  return v8;
}

BOOL __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

uint64_t __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) accountForContainer:a2];
  int v3 = objc_msgSend(v2, "_cn_isPrimaryAccount");
  uint64_t v4 = [v2 accountType];
  uint64_t v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:*MEMORY[0x1E4F17750]];

  return v3 & v6;
}

- (id)accountForContainer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CNContainerCache *)self cachedAccounts];
    unsigned int v6 = [v4 identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__CNContainerCache_accountForContainer___block_invoke;
    v13[3] = &unk_1E56B8DE0;
    v13[4] = self;
    id v14 = v4;
    uint64_t v7 = [v5 objectForKey:v6 onCacheMiss:v13];

    id v11 = (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A2B0] + 16))(*MEMORY[0x1E4F5A2B0], v7, v8, v9, v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

id __40__CNContainerCache_accountForContainer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cnAccountForContainer:*(void *)(a1 + 40)];
  int v3 = [*(id *)(a1 + 32) accountStore];
  id v4 = [v2 externalIdentifierString];
  uint64_t v5 = [v3 accountWithIdentifier:v4];

  if (v5)
  {
    unsigned int v6 = [v5 displayAccount];

    uint64_t v7 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  }
  else
  {
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __40__CNContainerCache_accountForContainer___block_invoke_cold_1(v8);
    }

    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }

  return v7;
}

- (id)cnAccountForContainer:(id)a3
{
  id v4 = [a3 identifier];
  uint64_t v5 = +[CNAccount predicateForAccountForContainerWithIdentifier:v4];

  unsigned int v6 = [(CNContainerCache *)self contactStore];
  id v12 = 0;
  uint64_t v7 = [v6 accountsMatchingPredicate:v5 error:&v12];
  id v8 = v12;

  if (v8)
  {
    uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CNContainerCache cnAccountForContainer:]((uint64_t)v8, v9);
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v7 firstObject];
  }

  return v10;
}

- (void)resetAccountCache
{
}

- (void)resetPrimaryiCloudContainer
{
}

- (void)setPrimaryiCloudContainer:(id)a3
{
}

- (CNContactStore)contactStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactStore);

  return (CNContactStore *)WeakRetained;
}

- (void)setContactStore:(id)a3
{
}

- (void)setAccountStore:(id)a3
{
}

- (CNCache)cachedAccounts
{
  return self->_cachedAccounts;
}

- (void)setCachedAccounts:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_contactStore);

  objc_storeStrong((id *)&self->_primaryiCloudContainer, 0);
}

- (void)onWorkQueue_findPrimaryiCloudContainer
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error when fetching CNContainers: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __40__CNContainerCache_accountForContainer___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error when fetching expected ACAccount, received nil", v1, 2u);
}

- (void)cnAccountForContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error when fetching CNAccounts: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end