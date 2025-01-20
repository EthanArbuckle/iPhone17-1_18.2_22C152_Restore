@interface DAAccountMonitor
+ (id)sharedMonitor;
- (DAAccountMonitor)init;
- (NSHashTable)accounts;
- (OS_dispatch_queue)accountsQueue;
- (id)monitoredAccounts;
- (void)monitorAccount:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setAccountsQueue:(id)a3;
- (void)unmonitorAccount:(id)a3;
@end

@implementation DAAccountMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedMonitor___sharedInstance;
  return v2;
}

uint64_t __33__DAAccountMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor___sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (DAAccountMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)DAAccountMonitor;
  v2 = [(DAAccountMonitor *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(DAAccountMonitor *)v2 setAccounts:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dataaccess.accountmonitor", 0);
    [(DAAccountMonitor *)v2 setAccountsQueue:v4];
  }
  return v2;
}

- (void)monitorAccount:(id)a3
{
  id v4 = a3;
  v5 = [(DAAccountMonitor *)self accountsQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__DAAccountMonitor_monitorAccount___block_invoke;
  v7[3] = &unk_1E6211790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __35__DAAccountMonitor_monitorAccount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accounts];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)unmonitorAccount:(id)a3
{
  id v4 = a3;
  v5 = [(DAAccountMonitor *)self accountsQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__DAAccountMonitor_unmonitorAccount___block_invoke;
  v7[3] = &unk_1E6211790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __37__DAAccountMonitor_unmonitorAccount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accounts];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)monitoredAccounts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v3 = [(DAAccountMonitor *)self accountsQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__DAAccountMonitor_monitoredAccounts__block_invoke;
  v6[3] = &unk_1E62117E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__DAAccountMonitor_monitoredAccounts__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accounts];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSHashTable)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (OS_dispatch_queue)accountsQueue
{
  return self->_accountsQueue;
}

- (void)setAccountsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsQueue, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end