@interface EDClientState
+ (OS_os_log)log;
+ (id)sharedInstance;
- (BOOL)isForeground;
- (BOOL)isRunningTests;
- (EDClientState)init;
- (NSArray)visibleMailboxObjectIDs;
- (id)giveBoostWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)exitDaemon;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsRunningTests:(BOOL)a3;
- (void)setStateForDemoMode:(id)a3;
- (void)setVisibleMailboxObjectIDs:(id)a3;
@end

@implementation EDClientState

- (id)giveBoostWithCompletionBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EDClientState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client Requested Boost", buf, 0xCu);
  }

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E08]) initWithBoost:v4];
  v7 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__EDClientState_giveBoostWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E6BFFAF0;
  id v8 = v6;
  id v11 = v8;
  v12 = self;
  [v7 setCancellationHandler:v10];

  return v7;
}

- (void)setVisibleMailboxObjectIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 copy];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v9 = +[EDClientState log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "ef_mapSelector:", sel_ef_publicDescription);
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting visible mailboxes to %{public}@", buf, 0x16u);
  }
  id v11 = [(EFLocked *)self->_visibleMailboxObjectIDs replaceObject:v8];
  if (([v11 isEqualToArray:v8] & 1) == 0)
  {
    v14 = @"visibleMailboxObjectIDs";
    id v15 = v8;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"EDClientStateForegroundStateVisibleMailboxesDidChange" object:self userInfo:v12];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EDClientState_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1) {
    dispatch_once(&log_onceToken_22, block);
  }
  v2 = (void *)log_log_22;

  return (OS_os_log *)v2;
}

- (NSArray)visibleMailboxObjectIDs
{
  return (NSArray *)[(EFLocked *)self->_visibleMailboxObjectIDs getObject];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

- (void)setIsForeground:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = !a3;
  EFContentProtectionValidateObservedStateIsUnlocked();
  int v6 = v5;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isForeground, (unsigned __int8 *)&v6, v3);
  if (v6 == v5)
  {
    v10 = @"EDClientStateForegroundStateDidChangeKeyIsForeground";
    v7 = [NSNumber numberWithBool:v3];
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"EDClientStateForegroundStateDidChange" object:self userInfo:v8];
  }
}

void __20__EDClientState_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;
}

void __31__EDClientState_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(EDClientState);
  os_log_t v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;
}

- (EDClientState)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDClientState;
  v2 = [(EDClientState *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F60DA0]);
    uint64_t v4 = [v3 initWithObject:MEMORY[0x1E4F1CBF0]];
    visibleMailboxObjectIDs = v2->_visibleMailboxObjectIDs;
    v2->_visibleMailboxObjectIDs = (EFLocked *)v4;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDClientState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v6 = self;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: deallocating client state", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)EDClientState;
  [(EDClientState *)&v4 dealloc];
}

- (BOOL)isForeground
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isForeground);
  return v2 & 1;
}

- (BOOL)isRunningTests
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isRunningTests);
  return v2 & 1;
}

- (void)setIsRunningTests:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = !a3;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isRunningTests, (unsigned __int8 *)&v3, a3);
  if (v3 == !a3)
  {
    BOOL v4 = a3;
    int v6 = +[EDClientState log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = v4;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed testing state. isRunningTests=%{BOOL}d", (uint8_t *)&v7, 0x12u);
    }
  }
}

void __46__EDClientState_giveBoostWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) drop];
  unsigned __int8 v2 = +[EDClientState log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Client Cancelled Boost", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setStateForDemoMode:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = +[EDClientState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting demo mode state", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v6 enableMailTrackingProtection:1];

  v4[2](v4, 1, 0);
}

- (void)exitDaemon
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[EDClientState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Exit daemon", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

- (void).cxx_destruct
{
}

@end