@interface CNManagedAccountsCache
+ (id)sharedCache;
- (ACAccountStore)accountStore;
- (CNCache)accountsCache;
- (CNManagedAccountsCache)init;
- (id)accountForIdentifier:(id)a3;
- (id)accountsForIdentifiers:(id)a3;
- (void)clearCache;
- (void)setAccountStore:(id)a3;
- (void)setAccountsCache:(id)a3;
@end

@implementation CNManagedAccountsCache

+ (id)sharedCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CNManagedAccountsCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_cn_once_token_2 != -1) {
    dispatch_once(&sharedCache_cn_once_token_2, block);
  }
  v2 = (void *)sharedCache_cn_once_object_2;

  return v2;
}

uint64_t __37__CNManagedAccountsCache_sharedCache__block_invoke(uint64_t a1)
{
  sharedCache_cn_once_object_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CNManagedAccountsCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNManagedAccountsCache;
  v2 = [(CNManagedAccountsCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[CNCache atomicCache];
    accountsCache = v2->_accountsCache;
    v2->_accountsCache = (CNCache *)v3;

    v5 = (ACAccountStore *)objc_alloc_init(getACAccountStoreClass());
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    v7 = v2;
  }

  return v2;
}

- (id)accountForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CNManagedAccountsCache *)self accountsCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CNManagedAccountsCache_accountForIdentifier___block_invoke;
  v9[3] = &unk_1E569FE08;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 objectForKey:v6 onCacheMiss:v9];

  return v7;
}

id __47__CNManagedAccountsCache_accountForIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountStore];
  uint64_t v3 = [v2 accountWithIdentifier:*(void *)(a1 + 40)];

  return v3;
}

- (id)accountsForIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CNManagedAccountsCache accountForIdentifier:](self, "accountForIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)clearCache
{
  id v2 = [(CNManagedAccountsCache *)self accountsCache];
  [v2 removeAllObjects];
}

- (CNCache)accountsCache
{
  return self->_accountsCache;
}

- (void)setAccountsCache:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_accountsCache, 0);
}

@end