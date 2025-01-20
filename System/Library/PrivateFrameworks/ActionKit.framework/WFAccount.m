@interface WFAccount
+ (BOOL)allowsMultipleAccounts;
+ (BOOL)deleteAccount:(id)a3;
+ (BOOL)saveAccount:(id)a3;
+ (BOOL)shouldIgnoreNotificationForService:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_accounts;
+ (id)accountCache;
+ (id)accounts;
+ (id)addAccountObserver:(id)a3;
+ (id)localizedServiceName;
+ (id)migrate:(id)a3;
+ (id)pendingIgnoredNotifications;
+ (id)serviceID;
+ (id)serviceName;
+ (unint64_t)_numberOfAccounts;
+ (unint64_t)numberOfAccounts;
+ (void)addAccountObserver:(id)a3 forService:(id)a4;
+ (void)handleChangeForService:(id)a3;
+ (void)notifyAccountsChanged;
+ (void)removeAccountObserver:(id)a3;
+ (void)setShouldIgnoreNotificationForService:(id)a3;
+ (void)useAccountObservers:(id)a3;
- (BOOL)isValid;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)accountID;
- (NSString)localizedName;
- (WFAccount)init;
- (void)invalidateWithCompletionHandler:(id)a3;
- (void)refreshWithCompletionHandler:(id)a3;
@end

@implementation WFAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)refreshWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (BOOL)isValid
{
  return 0;
}

- (NSString)localizedName
{
  return 0;
}

- (WFAccount)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFAccount;
  v2 = [(MTLModel *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    accountID = v2->_accountID;
    v2->_accountID = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x263EFF910] date];
    createdAt = v2->_createdAt;
    v2->_createdAt = (NSDate *)v6;

    uint64_t v8 = [MEMORY[0x263EFF910] date];
    updatedAt = v2->_updatedAt;
    v2->_updatedAt = (NSDate *)v8;

    v10 = v2;
  }

  return v2;
}

+ (BOOL)allowsMultipleAccounts
{
  return 0;
}

+ (id)localizedServiceName
{
  return 0;
}

+ (id)serviceName
{
  return 0;
}

+ (id)serviceID
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)removeAccountObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFAccount_Persistence__removeAccountObserver___block_invoke;
  v6[3] = &unk_264E59280;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 useAccountObservers:v6];
}

void __48__WFAccount_Persistence__removeAccountObserver___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v7 = [v3 serviceID];
  id v5 = [v4 objectForKey:v7];

  uint64_t v6 = _Block_copy(*(const void **)(a1 + 32));
  [v5 removeObject:v6];
}

+ (id)addAccountObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 serviceID];
  [a1 addAccountObserver:v4 forService:v5];

  uint64_t v6 = _Block_copy(v4);
  return v6;
}

+ (void)notifyAccountsChanged
{
  id v4 = [a1 serviceID];
  [a1 handleChangeForService:v4];
  [a1 setShouldIgnoreNotificationForService:v4];
  id v3 = [v4 stringByAppendingString:@".notification"];
  notify_post((const char *)[v3 UTF8String]);
}

+ (BOOL)deleteAccount:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 accountID];

  if (!v6)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFAccount+Persistence.m", 168, @"Invalid parameter not satisfying: %@", @"account.accountID" object file lineNumber description];
  }
  id v7 = [WFKeychain alloc];
  id v8 = [(id)objc_opt_class() serviceID];
  v9 = [(WFKeychain *)v7 initWithService:v8];

  v10 = [v5 accountID];
  BOOL v11 = [(WFKeychain *)v9 setData:0 forKey:v10];

  objc_super v12 = objc_opt_class();
  [v12 notifyAccountsChanged];

  return v11;
}

+ (BOOL)saveAccount:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 accountID];

  if (!v6)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFAccount+Persistence.m", 154, @"Invalid parameter not satisfying: %@", @"account.accountID" object file lineNumber description];
  }
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (v7)
  {
    id v8 = [WFKeychain alloc];
    v9 = [(id)objc_opt_class() serviceID];
    v10 = [(WFKeychain *)v8 initWithService:v9];

    BOOL v11 = [v5 accountID];
    BOOL v12 = [(WFKeychain *)v10 setData:v7 forKey:v11];

    [(id)objc_opt_class() notifyAccountsChanged];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)_accounts
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = [WFKeychain alloc];
  id v4 = [a1 serviceID];
  id v5 = [(WFKeychain *)v3 initWithService:v4];

  uint64_t v6 = [(WFKeychain *)v5 items];
  id v7 = objc_opt_new();
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __35__WFAccount_Persistence___accounts__block_invoke;
  v18 = &unk_264E59258;
  id v19 = v7;
  id v20 = a1;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v15];
  v9 = (void *)MEMORY[0x263F08B30];
  v10 = NSStringFromSelector(sel_createdAt);
  BOOL v11 = objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, 1, v15, v16, v17, v18);
  v21[0] = v11;
  BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v13 = [v8 sortedArrayUsingDescriptors:v12];

  return v13;
}

void __35__WFAccount_Persistence___accounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 40) migrate:v6];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && !v7)
  {
    id v10 = 0;
    id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v10];
    id v9 = v10;
  }
  if (v5) {
    [v8 setValue:v5 forKey:@"accountID"];
  }
  [*(id *)(a1 + 32) addObject:v8];
}

+ (unint64_t)_numberOfAccounts
{
  id v3 = [WFKeychain alloc];
  id v4 = [a1 serviceID];
  id v5 = [(WFKeychain *)v3 initWithService:v4];

  unint64_t v6 = [(WFKeychain *)v5 numberOfItems];
  return v6;
}

+ (id)accounts
{
  id v3 = [a1 accountCache];
  id v4 = [a1 serviceID];
  id v5 = [v3 accountsForService:v4];
  if (!v5)
  {
    id v5 = [a1 _accounts];
    [v3 setAccounts:v5 forService:v4];
    [a1 addAccountObserver:0 forService:v4];
  }

  return v5;
}

+ (unint64_t)numberOfAccounts
{
  id v3 = [a1 accountCache];
  id v4 = [a1 serviceID];
  id v5 = [v3 numberOfAccountsForService:v4];
  unint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = [a1 _numberOfAccounts];
    id v8 = [NSNumber numberWithUnsignedInteger:v7];
    [v3 setNumberOfAccounts:v8 forService:v4];

    [a1 addAccountObserver:0 forService:v4];
  }

  return v7;
}

+ (void)handleChangeForService:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 accountCache];
  [v5 clearCacheForService:v4];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23406;
  v23 = __Block_byref_object_dispose__23407;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__WFAccount_Persistence__handleChangeForService___block_invoke;
  v16[3] = &unk_264E59230;
  v18 = &v19;
  id v6 = v4;
  id v17 = v6;
  [a1 useAccountObservers:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)v20[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    id v10 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        dispatch_async(v10, *(dispatch_block_t *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v8 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v25 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
}

void __49__WFAccount_Persistence__handleChangeForService___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)addAccountObserver:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke;
  v10[3] = &unk_264E59208;
  id v12 = v6;
  id v13 = a1;
  id v11 = v7;
  id v8 = v6;
  id v9 = v7;
  [a1 useAccountObservers:v10];
}

void __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  if (!v4)
  {
    uint64_t v4 = objc_opt_new();
    [v3 setObject:v4 forKey:*(void *)(a1 + 32)];
    int out_token = 0;
    id v5 = [*(id *)(a1 + 32) stringByAppendingString:@".notification"];
    id v6 = (const char *)[v5 UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke_2;
    handler[3] = &unk_264E591E0;
    uint64_t v11 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    notify_register_dispatch(v6, &out_token, MEMORY[0x263EF83A0], handler);
  }
  id v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    id v8 = _Block_copy(v7);
    [v4 addObject:v8];
  }
}

uint64_t __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) shouldIgnoreNotificationForService:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 handleChangeForService:v4];
  }
  return result;
}

+ (void)setShouldIgnoreNotificationForService:(id)a3
{
  id v4 = a3;
  id v5 = [a1 pendingIgnoredNotifications];
  [v5 addObject:v4];
}

+ (BOOL)shouldIgnoreNotificationForService:(id)a3
{
  id v4 = a3;
  id v5 = [a1 pendingIgnoredNotifications];
  uint64_t v6 = [v5 countForObject:v4];
  if (v6) {
    [v5 removeObject:v4];
  }

  return v6 != 0;
}

+ (void)useAccountObservers:(id)a3
{
  uint64_t v3 = useAccountObservers__onceToken[0];
  id v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1) {
    dispatch_once(useAccountObservers__onceToken, &__block_literal_global_51);
  }
  id v5 = useAccountObservers__accountObserversLock;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  v4[2](v4, useAccountObservers__accountObservers);

  id v7 = useAccountObservers__accountObserversLock;
  dispatch_semaphore_signal(v7);
}

void __46__WFAccount_Persistence__useAccountObservers___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)useAccountObservers__accountObservers;
  useAccountObservers__accountObservers = v0;

  dispatch_semaphore_t v2 = dispatch_semaphore_create(1);
  uint64_t v3 = (void *)useAccountObservers__accountObserversLock;
  useAccountObservers__accountObserversLock = (uint64_t)v2;
}

+ (id)pendingIgnoredNotifications
{
  if (pendingIgnoredNotifications_onceToken != -1) {
    dispatch_once(&pendingIgnoredNotifications_onceToken, &__block_literal_global_48);
  }
  dispatch_semaphore_t v2 = (void *)pendingIgnoredNotifications_pendingIgnoredNotifications;
  return v2;
}

void __53__WFAccount_Persistence__pendingIgnoredNotifications__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)pendingIgnoredNotifications_pendingIgnoredNotifications;
  pendingIgnoredNotifications_pendingIgnoredNotifications = v0;
}

+ (id)accountCache
{
  if (accountCache_onceToken != -1) {
    dispatch_once(&accountCache_onceToken, &__block_literal_global_23409);
  }
  dispatch_semaphore_t v2 = (void *)accountCache_accountCache;
  return v2;
}

void __38__WFAccount_Persistence__accountCache__block_invoke()
{
  uint64_t v0 = objc_alloc_init(WFAccountCache);
  v1 = (void *)accountCache_accountCache;
  accountCache_accountCache = (uint64_t)v0;
}

+ (id)migrate:(id)a3
{
  return 0;
}

@end