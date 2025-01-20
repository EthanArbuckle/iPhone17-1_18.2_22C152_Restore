@interface HFMediaDispatcher
+ (id)sharedDispatcher;
- (ACAccountStore)appleMusicAccountStore;
- (BOOL)_reloadAppleMusicMagicAuthCapableAccounts;
- (BOOL)isUsingiCloud;
- (HFMediaDispatcher)init;
- (NSArray)appleMusicMagicAuthCapableAccounts;
- (NSHashTable)appleMusicAccountObservers;
- (void)_accountsStoreWasUpdated:(id)a3;
- (void)_setupAppleMusicAccountStoreIfNecessary;
- (void)addAppleMusicAccountObserver:(id)a3;
- (void)removeAppleMusicAccountObserver:(id)a3;
- (void)setAppleMusicAccountObservers:(id)a3;
- (void)setAppleMusicMagicAuthCapableAccounts:(id)a3;
@end

@implementation HFMediaDispatcher

+ (id)sharedDispatcher
{
  if (_MergedGlobals_226 != -1) {
    dispatch_once(&_MergedGlobals_226, &__block_literal_global_3_4);
  }
  v2 = (void *)qword_26AB2EDF8;
  return v2;
}

uint64_t __37__HFMediaDispatcher_sharedDispatcher__block_invoke_2()
{
  v0 = objc_alloc_init(HFMediaDispatcher);
  uint64_t v1 = qword_26AB2EDF8;
  qword_26AB2EDF8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFMediaDispatcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFMediaDispatcher;
  v2 = [(HFMediaDispatcher *)&v8 init];
  if (v2)
  {
    v3 = HFLogForCategory(0x47uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Initializing HomeKit Media Dispatcher", v7, 2u);
    }

    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    appleMusicAccountObservers = v2->_appleMusicAccountObservers;
    v2->_appleMusicAccountObservers = (NSHashTable *)v4;
  }
  return v2;
}

- (ACAccountStore)appleMusicAccountStore
{
  appleMusicAccountStore = self->_appleMusicAccountStore;
  if (!appleMusicAccountStore)
  {
    uint64_t v4 = [MEMORY[0x263EFB210] defaultStore];
    v5 = self->_appleMusicAccountStore;
    self->_appleMusicAccountStore = v4;

    appleMusicAccountStore = self->_appleMusicAccountStore;
  }
  v6 = appleMusicAccountStore;
  return v6;
}

- (void)addAppleMusicAccountObserver:(id)a3
{
  id v4 = a3;
  [(HFMediaDispatcher *)self _setupAppleMusicAccountStoreIfNecessary];
  id v5 = [(HFMediaDispatcher *)self appleMusicAccountObservers];
  [v5 addObject:v4];
}

- (void)removeAppleMusicAccountObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaDispatcher *)self appleMusicAccountObservers];
  [v5 removeObject:v4];
}

- (BOOL)isUsingiCloud
{
  v2 = [(HFMediaDispatcher *)self appleMusicAccountStore];
  char v3 = objc_msgSend(v2, "aa_isUsingiCloud");

  return v3;
}

- (BOOL)_reloadAppleMusicMagicAuthCapableAccounts
{
  char v3 = [(HFMediaDispatcher *)self appleMusicAccountStore];
  id v4 = [v3 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];
  id v5 = [v3 accountsWithAccountType:v4];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_8];

  v7 = [(HFMediaDispatcher *)self appleMusicMagicAuthCapableAccounts];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(HFMediaDispatcher *)self setAppleMusicMagicAuthCapableAccounts:v6];
  }

  return v8 ^ 1;
}

uint64_t __62__HFMediaDispatcher__reloadAppleMusicMagicAuthCapableAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 username];
  v6 = [v4 username];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_accountsStoreWasUpdated:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HFMediaDispatcher *)self _reloadAppleMusicMagicAuthCapableAccounts])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(HFMediaDispatcher *)self appleMusicAccountObservers];
    id v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector())
          {
            v11 = [(HFMediaDispatcher *)self appleMusicMagicAuthCapableAccounts];
            [v10 dispatcher:self appleMusicAccountsDidUpdate:v11];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setupAppleMusicAccountStoreIfNecessary
{
  if (!self->_appleMusicAccountStore)
  {
    [(HFMediaDispatcher *)self _reloadAppleMusicMagicAuthCapableAccounts];
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__accountsStoreWasUpdated_ name:*MEMORY[0x263EFAE28] object:0];
  }
}

- (NSArray)appleMusicMagicAuthCapableAccounts
{
  return self->_appleMusicMagicAuthCapableAccounts;
}

- (void)setAppleMusicMagicAuthCapableAccounts:(id)a3
{
}

- (NSHashTable)appleMusicAccountObservers
{
  return self->_appleMusicAccountObservers;
}

- (void)setAppleMusicAccountObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountObservers, 0);
  objc_storeStrong((id *)&self->_appleMusicMagicAuthCapableAccounts, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountStore, 0);
}

@end