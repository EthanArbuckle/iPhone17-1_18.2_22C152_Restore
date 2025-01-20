@interface MPCPlaybackAccountManager
+ (MPCPlaybackAccountManager)sharedManager;
+ (MPCPlaybackAccountManager)sharedManagerIfExists;
- (BOOL)hasLoadedInitialAccounts;
- (MPCPlaybackAccount)activeAccount;
- (MPCPlaybackAccount)anyDelegationHostingAccount;
- (NSArray)accounts;
- (id)_init;
- (id)accountForDSID:(id)a3;
- (id)accountForHashedDSID:(id)a3;
- (id)accountForUserIdentity:(id)a3;
- (id)getDelegateTokenBWithTokenA:(id)a3 forDSID:(unint64_t)a4 error:(id *)a5;
- (void)_buildAccountFromDelegatedIdentity:(id)a3 completion:(id)a4;
- (void)_buildAccountFromLocalIdentity:(id)a3 completion:(id)a4;
- (void)_enumerateIdentitiesWithCompletion:(id)a3;
- (void)_setNeedsRefreshDueToMissingBag:(BOOL)a3;
- (void)_updateAccounts;
- (void)_updateAccountsWithAttemptCount:(int64_t)a3;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)performAfterLoadingAccounts:(id)a3;
- (void)registerObserver:(id)a3;
- (void)start;
- (void)unregisterObserver:(id)a3;
- (void)updateCredentialsWithDelegateTokenE:(_MPCProtoDelegateInfoTokenE *)a3 forDSID:(unint64_t)a4 completion:(id)a5;
@end

@implementation MPCPlaybackAccountManager

uint64_t __42__MPCPlaybackAccountManager_sharedManager__block_invoke()
{
  id v0 = [[MPCPlaybackAccountManager alloc] _init];
  v1 = (void *)__sharedManager;
  __sharedManager = (uint64_t)v0;

  v2 = (void *)__sharedManager;

  return [v2 start];
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)MPCPlaybackAccountManager;
  v2 = [(MPCPlaybackAccountManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v4 = dispatch_group_create();
    initialAccountGroup = v3->_initialAccountGroup;
    v3->_initialAccountGroup = (OS_dispatch_group *)v4;

    dispatch_group_enter((dispatch_group_t)v3->_initialAccountGroup);
    uint64_t v6 = [NSDictionary dictionary];
    accounts = v3->_accounts;
    v3->_accounts = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v8;

    v3->_observersLock = 0;
  }
  return v3;
}

- (MPCPlaybackAccount)activeAccount
{
  v3 = [MEMORY[0x263F893C0] activeAccount];
  dispatch_group_t v4 = [(MPCPlaybackAccountManager *)self accountForUserIdentity:v3];

  return (MPCPlaybackAccount *)v4;
}

- (id)accountForUserIdentity:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(NSDictionary *)self->_accounts allValues];
  v7 = (void *)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    v19 = p_lock;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_super v11 = [v10 userIdentity];
        v12 = [MEMORY[0x263F893C8] defaultIdentityStore];
        id v13 = v11;
        id v14 = v4;
        id v15 = v12;
        v16 = v15;
        if (v13 == v14)
        {

LABEL_16:
          v7 = (void *)[v10 copy];
          goto LABEL_17;
        }
        if (v4 && v13)
        {
          char v17 = [v13 isEqualToIdentity:v14 inStore:v15];

          if (v17) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
LABEL_17:
    p_lock = v19;
  }

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSArray)accounts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_accounts allValues];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_111];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v8 = v7;

  return v8;
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentityStore:v3];
  [v4 setIdentity:*(void *)(a1 + 40)];
  v5 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  [v4 setClientInfo:v5];

  [v4 setAllowsExpiredBags:*(unsigned char *)(a1 + 48) == 0];
  id v6 = (id)[objc_alloc(MEMORY[0x263F89370]) initWithUserInteractionLevel:1];
  [v4 setAuthenticationProvider:v6];
}

+ (MPCPlaybackAccountManager)sharedManager
{
  if (sharedManager_onceToken_28243 != -1) {
    dispatch_once(&sharedManager_onceToken_28243, &__block_literal_global_28244);
  }
  v2 = (void *)__sharedManager;

  return (MPCPlaybackAccountManager *)v2;
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_116(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) accountManager:*(void *)(a1 + 40) didChangeAccounts:*(void *)(a1 + 48)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __34__MPCPlaybackAccountManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccounts];
}

- (void)_updateAccounts
{
}

- (id)accountForHashedDSID:(id)a3
{
  uint64_t v4 = [a3 substringToIndex:7];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(NSDictionary *)self->_accounts objectForKeyedSubscript:v4];
  long long v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);

  return v7;
}

uint64_t __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2_141(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __46__MPCPlaybackAccountManager_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accountManager:*(void *)(a1 + 40) didChangeAccounts:*(void *)(a1 + 48)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    [(NSHashTable *)self->_observers addObject:v4];
    if ([(MPCPlaybackAccountManager *)self hasLoadedInitialAccounts])
    {
      uint64_t v5 = [(MPCPlaybackAccountManager *)self accounts];
      os_unfair_recursive_lock_unlock();
      if (v5)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __46__MPCPlaybackAccountManager_registerObserver___block_invoke;
        block[3] = &unk_2643C6660;
        id v8 = v4;
        long long v9 = self;
        id v10 = v5;
        id v6 = v5;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
  }
}

- (BOOL)hasLoadedInitialAccounts
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_initialAccountGroup == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)accountForDSID:(id)a3
{
  id v4 = MPCHashedDSIDFromDSID(a3);
  uint64_t v5 = [(MPCPlaybackAccountManager *)self accountForHashedDSID:v4];

  return v5;
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_140(uint64_t a1)
{
  v2 = [[MPCPlaybackAccount alloc] initWithUserIdentity:*(void *)(a1 + 32) subscriptionStatus:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  -[MPCPlaybackAccount setActiveAccount:](v2, "setActiveAccount:", [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 48)]);
  [(MPCPlaybackAccount *)v2 setHashedDSID:*(void *)(a1 + 56)];
  [(MPCPlaybackAccount *)v2 setHasCloudLibraryEnabled:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  [(MPCPlaybackAccount *)v2 setPrivateListeningEnabled:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  [(MPCPlaybackAccount *)v2 setStoreFrontIdentifier:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  [(MPCPlaybackAccount *)v2 setBag:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
  id v3 = [(MPCPlaybackAccount *)v2 _copyStreamerStorage:*(void *)(a1 + 64)];
  [(MPCPlaybackAccount *)v2 set_whaStreamerStorage:v3];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2_141;
  v6[3] = &unk_2643C55A8;
  id v4 = *(id *)(a1 + 72);
  long long v7 = v2;
  id v8 = v4;
  uint64_t v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), MEMORY[0x263EFFA68]);
}

- (void)start
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  if ((ICCurrentApplicationIsSystemApp() & 1) == 0) {
    [v3 addObserver:self selector:sel__subscriptionStatusChangedNotification_ name:*MEMORY[0x263F88F60] object:0];
  }
  [v3 addObserver:self selector:sel__userIdentityStoreChangedNotification_ name:*MEMORY[0x263F89088] object:0];
  if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory]) {
    [v3 addObserver:self selector:sel__homeUserSettingsChangeNotification_ name:*MEMORY[0x263F111E8] object:0];
  }
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__MPCPlaybackAccountManager_start__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)performAfterLoadingAccounts:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v5 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  id v6 = self->_initialAccountGroup;
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    dispatch_group_notify((dispatch_group_t)self->_initialAccountGroup, MEMORY[0x263EF83A0], v5);
  }
  else {
    v5[2](v5);
  }
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_4(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(NSObject **)(v6 + 32);
  if (v7)
  {
    dispatch_group_leave(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    long long v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
  }
  int v10 = *(unsigned __int8 *)(v6 + 24);
  *(unsigned char *)(v6 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if ([v2 isEqual:*(void *)(a1 + 40)])
  {
    objc_super v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [*(id *)(a1 + 32) accounts];
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_INFO, "[AccountManager] - Updated accounts [silent]: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) accounts];
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Updated accounts: %{public}@", buf, 0xCu);
    }

    os_unfair_recursive_lock_lock_with_options();
    id v15 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
    os_unfair_recursive_lock_unlock();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_116;
    block[3] = &unk_2643C6660;
    uint64_t v16 = *(void *)(a1 + 32);
    id v30 = v15;
    uint64_t v31 = v16;
    id v32 = v13;
    id v17 = v13;
    objc_super v11 = v15;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (v10)
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[AccountManager] - Refreshing due to previous timeout", buf, 2u);
    }

    uint64_t v19 = *(void *)(a1 + 48);
    if (v19) {
      int64_t v20 = 1000000000 * (1 << (v19 - 1));
    }
    else {
      int64_t v20 = 0;
    }
    dispatch_time_t v21 = dispatch_time(0, v20);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_117;
    v28[3] = &unk_2643C4F28;
    uint64_t v22 = *(void *)(a1 + 48);
    v28[4] = *(void *)(a1 + 32);
    v28[5] = v22;
    dispatch_after(v21, MEMORY[0x263EF83A0], v28);
  }
  long long v23 = objc_msgSend(*(id *)(a1 + 40), "msv_firstWhere:", &__block_literal_global_121_28225);
  BOOL v24 = v23 != 0;

  [*(id *)(a1 + 32) _setNeedsRefreshDueToMissingBag:v24];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v26 = v25;
    os_signpost_id_t v27 = *(void *)(a1 + 56);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v26, OS_SIGNPOST_INTERVAL_END, v27, "UpdateAccounts", " enableTelemetry=YES ", buf, 2u);
    }
  }
}

- (void)_setNeedsRefreshDueToMissingBag:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL needsRefreshDueToMissingBag = self->_needsRefreshDueToMissingBag;
  self->_BOOL needsRefreshDueToMissingBag = v3;
  os_unfair_lock_unlock(p_lock);
  if (v3)
  {
    if (!needsRefreshDueToMissingBag)
    {
      long long v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Waiting to refresh accounts due to missing bag", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      uint64_t v8 = [MEMORY[0x263F892E8] sharedSecurityInfo];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __61__MPCPlaybackAccountManager__setNeedsRefreshDueToMissingBag___block_invoke;
      v10[3] = &unk_2643C5FF0;
      objc_copyWeak(&v11, buf);
      [v8 performBlockAfterFirstUnlock:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  else if (needsRefreshDueToMissingBag)
  {
    id v9 = [MEMORY[0x263F89110] sharedMonitor];
    [v9 unregisterObserver:self];
  }
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2810000000;
  v43[3] = &unk_21BF4D291;
  int v44 = 0;
  long long v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
  id v20 = v6;
  uint64_t v8 = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
        dispatch_group_enter(v8);
        id v13 = *(void **)(a1 + 32);
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2;
        v35[3] = &unk_2643C4F00;
        v38 = v43;
        id v36 = v7;
        v37 = v8;
        objc_msgSend(v13, "_buildAccountFromLocalIdentity:completion:", v12, v35, v20);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v20;
  uint64_t v14 = [v21 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v21);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * v16);
        dispatch_group_enter(v8);
        v18 = *(void **)(a1 + 32);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_3;
        v27[3] = &unk_2643C4F00;
        id v30 = v43;
        id v28 = v7;
        v29 = v8;
        [v18 _buildAccountFromDelegatedIdentity:v17 completion:v27];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v21 countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v14);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_4;
  block[3] = &unk_2643C4F70;
  void block[4] = *(void *)(a1 + 32);
  id v24 = v7;
  char v26 = *(unsigned char *)(a1 + 56);
  long long v25 = *(_OWORD *)(a1 + 40);
  id v19 = v7;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v43, 8);
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2(void *a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = (os_unfair_lock_s *)(*(void *)(a1[6] + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = (void *)a1[4];
    id v6 = [v4 hashedDSID];
    [v5 setObject:v4 forKeyedSubscript:v6];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  }
  long long v7 = a1[5];

  dispatch_group_leave(v7);
}

- (void)_buildAccountFromLocalIdentity:(id)a3 completion:(id)a4
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  long long v7 = [MEMORY[0x263F893C8] defaultIdentityStore];
  id v115 = 0;
  uint64_t v8 = [v7 DSIDForUserIdentity:v5 outError:&v115];
  id v9 = v115;
  uint64_t quot = [v8 longLongValue];
  uint64_t v11 = quot;
  uint64_t v12 = (char *)v117 + 1;
  do
  {
    lldiv_t v13 = lldiv(quot, 10);
    uint64_t quot = v13.quot;
    if (v13.rem >= 0) {
      LOBYTE(v14) = v13.rem;
    }
    else {
      uint64_t v14 = -v13.rem;
    }
    *(v12 - 2) = v14 + 48;
    uint64_t v15 = (const UInt8 *)(v12 - 2);
    --v12;
  }
  while (v13.quot);
  if (v11 < 0)
  {
    *(v12 - 2) = 45;
    uint64_t v15 = (const UInt8 *)(v12 - 2);
  }
  v64 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)v117 - (char *)v15, 0x8000100u, 0);

  if (v9)
  {
    uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for identity: %{public}@ error: %{public}@", buf, 0x16u);
    }

    v6[2](v6, 0);
  }
  else
  {
    v61 = MPCHashedDSIDFromDSID(v64);
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v61;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[AccountManager] - DSID found for %{public}@ [%{public}@]", buf, 0x16u);
    }

    v18 = [MEMORY[0x263F893C0] activeAccount];
    id v114 = 0;
    id v19 = [v7 DSIDForUserIdentity:v18 outError:&v114];
    id v62 = v114;
    uint64_t v20 = [v19 longLongValue];
    uint64_t v21 = v20;
    uint64_t v22 = (char *)v117 + 1;
    do
    {
      lldiv_t v23 = lldiv(v20, 10);
      uint64_t v20 = v23.quot;
      if (v23.rem >= 0) {
        LOBYTE(v24) = v23.rem;
      }
      else {
        uint64_t v24 = -v23.rem;
      }
      *(v22 - 2) = v24 + 48;
      long long v25 = (const UInt8 *)(v22 - 2);
      --v22;
    }
    while (v23.quot);
    if (v21 < 0)
    {
      *(v22 - 2) = 45;
      long long v25 = (const UInt8 *)(v22 - 2);
    }
    char v26 = (__CFString *)CFStringCreateWithBytes(0, v25, (char *)v117 - (char *)v25, 0x8000100u, 0);

    os_signpost_id_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v28 = v27;
    if (v62)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v62;
        _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for active identity error: %{public}@", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v5 DSID];
        id v30 = [v29 stringValue];
        long long v31 = MPCHashedDSIDFromDSID(v30);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[AccountManager] - DSID found for %{public}@ [%{public}@]", buf, 0x16u);
      }
      long long v32 = dispatch_group_create();
      dispatch_group_enter(v32);
      v112[0] = 0;
      v112[1] = v112;
      v112[2] = 0x2020000000;
      char v113 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v117[0] = __Block_byref_object_copy__28165;
      v117[1] = __Block_byref_object_dispose__28166;
      id v118 = 0;
      v110[0] = 0;
      v110[1] = v110;
      v110[2] = 0x2020000000;
      char v111 = 1;
      v104[0] = MEMORY[0x263EF8330];
      v104[1] = 3221225472;
      v104[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke;
      v104[3] = &unk_2643C4FC0;
      id v33 = v5;
      id v105 = v33;
      v107 = v110;
      v108 = v112;
      v109 = buf;
      dispatch_group_t group = v32;
      dispatch_group_t v106 = group;
      [v7 getPropertiesForUserIdentity:v33 completionHandler:v104];
      os_unfair_lock_lock(&self->_lock);
      initialAccountGroup = self->_initialAccountGroup;
      v60 = [(NSDictionary *)self->_accounts objectForKeyedSubscript:v61];
      os_unfair_lock_unlock(&self->_lock);
      id v35 = objc_alloc(MEMORY[0x263F89360]);
      v100[0] = MEMORY[0x263EF8330];
      v100[1] = 3221225472;
      v100[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_126;
      v100[3] = &unk_2643C4FE8;
      id v101 = v7;
      id v36 = v33;
      id v102 = v36;
      BOOL v103 = initialAccountGroup == 0;
      v58 = (void *)[v35 initWithBlock:v100];
      if (initialAccountGroup) {
        double v37 = 2.0;
      }
      else {
        double v37 = 20.0;
      }
      v98[0] = 0;
      v98[1] = v98;
      v98[2] = 0x3032000000;
      v98[3] = __Block_byref_object_copy__28165;
      v98[4] = __Block_byref_object_dispose__28166;
      id v99 = [v60 subscriptionStatus];
      unint64_t v38 = 0x263F54000;
      if ((ICCurrentApplicationIsSystemApp() & 1) == 0)
      {
        id v57 = v36;
        dispatch_group_enter(group);
        long long v39 = (void *)[objc_alloc(MEMORY[0x263F89218]) initWithStoreRequestContext:v58];
        [v39 setAllowsFallbackToExpiredStatus:1];
        [v39 setAllowsFallbackToStatusNeedingReload:1];
        [v39 setShouldReturnLastKnownStatusOnly:initialAccountGroup != 0];
        id v40 = objc_alloc(MEMORY[0x263F54ED0]);
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2;
        v93[3] = &unk_2643C5010;
        id v41 = v36;
        id v94 = v41;
        id v42 = v39;
        id v95 = v42;
        v96 = self;
        v43 = group;
        v97 = v43;
        int v44 = (void *)[v40 initWithTimeout:v93 interruptionHandler:v37];
        v45 = [MEMORY[0x263F89208] sharedStatusController];
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_134;
        v88[3] = &unk_2643C5038;
        id v89 = v41;
        v92 = v98;
        id v46 = v44;
        id v90 = v46;
        v91 = v43;
        [v45 performSubscriptionStatusRequest:v42 withCompletionHandler:v88];

        id v36 = v57;
        unint64_t v38 = 0x263F54000uLL;
      }
      dispatch_group_enter(group);
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x3032000000;
      v86[3] = __Block_byref_object_copy__28165;
      v86[4] = __Block_byref_object_dispose__28166;
      id v87 = [v60 bag];
      id v47 = objc_alloc(*(Class *)(v38 + 3792));
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_136;
      v82[3] = &unk_2643C5060;
      id v48 = v36;
      id v83 = v48;
      v84 = self;
      v49 = group;
      v85 = v49;
      v50 = (void *)[v47 initWithTimeout:v82 interruptionHandler:v37];
      v51 = [MEMORY[0x263F893A0] sharedBagProvider];
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_138;
      v77[3] = &unk_2643C5088;
      id v52 = v48;
      id v78 = v52;
      v81 = v86;
      id v53 = v50;
      id v79 = v53;
      v54 = v49;
      v80 = v54;
      [v51 getBagForRequestContext:v58 withCompletionHandler:v77];

      v55 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_140;
      block[3] = &unk_2643C50B0;
      id v66 = v52;
      v72 = v98;
      v67 = v26;
      v68 = v64;
      v73 = v112;
      v74 = v110;
      v75 = buf;
      v76 = v86;
      id v69 = v61;
      id v70 = v60;
      v71 = v6;
      id v56 = v60;
      dispatch_group_notify(v54, v55, block);

      _Block_object_dispose(v86, 8);
      _Block_object_dispose(v98, 8);

      _Block_object_dispose(v110, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v112, 8);
    }
  }
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get properties for identity: %{public}@ error: %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory])
    {
      id v9 = (void *)MEMORY[0x263F11DA8];
      uint64_t v10 = [v5 homeUserIdentifiers];
      uint64_t v11 = [v9 userMonitorWithHomeIdentifiers:v10];

      if (v11) {
        char v12 = [v11 isPrivateListeningEnabledForCurrentAccessory];
      }
      else {
        char v12 = *MEMORY[0x263F111F0] != 0;
      }
    }
    else
    {
      uint64_t v11 = [v5 privateListeningEnabled];
      char v12 = [v11 BOOLValue];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 isActiveLocker];
    uint64_t v13 = [v5 storefrontIdentifier];
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

BOOL __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2_118(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = [a3 bag];
  BOOL v4 = v3 == 0;

  return v4;
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get subscription status for identity: %{public}@ error: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [v5 subscriptionStatus];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  if ([*(id *)(a1 + 40) disarm]) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get URL bag for identity: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  if ([*(id *)(a1 + 40) disarm]) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (void)_updateAccountsWithAttemptCount:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 < 4)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    BOOL v8 = [(MPCPlaybackAccountManager *)self hasLoadedInitialAccounts];
    BOOL v9 = !v8;
    if (!v8)
    {
      int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      uint64_t v11 = v10;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateAccounts", "", buf, 2u);
      }
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke;
    v12[3] = &unk_2643C4F98;
    v12[4] = self;
    v12[5] = a3;
    BOOL v13 = v9;
    v12[6] = v7;
    [(MPCPlaybackAccountManager *)self _enumerateIdentitiesWithCompletion:v12];
  }
  else
  {
    BOOL v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      int64_t v15 = a3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "[AccountManager] - Dropped account refresh because too many (%{public}ld) attempts have been made", buf, 0xCu);
    }
  }
}

- (void)_enumerateIdentitiesWithCompletion:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F893C8] defaultIdentityStore];
  id v51 = 0;
  id v5 = [v4 userIdentitiesForManageableAccountsWithError:&v51];
  id v6 = v51;
  os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = v6;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get user identities: %{public}@", buf, 0xCu);
    }

    uint64_t v46 = MEMORY[0x263EF8330];
    uint64_t v47 = 3221225472;
    id v48 = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke;
    v49 = &unk_2643C54B8;
    id v50 = v3;
    msv_dispatch_on_main_queue();
    BOOL v9 = v50;
  }
  else
  {
    char v26 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = v5;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Manageable user identities: %{public}@", buf, 0xCu);
    }

    BOOL v9 = [MEMORY[0x263F893C0] activeAccount];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v42 + 1) + 8 * i);
          id v16 = v9;
          id v17 = v4;
          __int16 v18 = v17;
          if (v15 == v16)
          {

            id v5 = v10;
            goto LABEL_22;
          }
          if (v9 && v15)
          {
            char v19 = [v15 isEqualToIdentity:v16 inStore:v17];

            if (v19)
            {
              id v5 = v10;
              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = [MEMORY[0x263F893C0] activeAccount];
    id v5 = [v10 arrayByAddingObject:v20];
    id v16 = v10;
    id v10 = (id)v20;
LABEL_22:

LABEL_23:
    id v3 = v26;

    if (MSVDeviceSupportsDelegatedIdentities())
    {
      uint64_t v21 = dispatch_group_create();
      uint64_t v22 = [MEMORY[0x263EFF980] array];
      dispatch_group_enter(v21);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_2;
      v34[3] = &unk_2643C5150;
      id v35 = v22;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_3;
      v31[3] = &unk_2643C5EE8;
      id v23 = v35;
      id v32 = v23;
      id v33 = v21;
      uint64_t v24 = v21;
      [v4 enumerateDelegateTokensWithType:1 usingBlock:v34 completionHandler:v31];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_148;
      block[3] = &unk_2643C5620;
      id v30 = v26;
      id v28 = v5;
      id v29 = v23;
      id v25 = v23;
      dispatch_group_notify(v24, MEMORY[0x263EF83A0], block);
    }
    else
    {
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      unint64_t v38 = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_145;
      long long v39 = &unk_2643C55A8;
      id v41 = v26;
      id v40 = v5;
      msv_dispatch_on_main_queue();

      uint64_t v24 = v41;
    }

    id v6 = 0;
  }
}

- (id)getDelegateTokenBWithTokenA:(id)a3 forDSID:(unint64_t)a4 error:(id *)a5
{
  id v6 = a3;
  os_signpost_id_t v7 = self;
  id v8 = sub_21BC62D68((uint64_t)v6);

  return v8;
}

- (void)updateCredentialsWithDelegateTokenE:(_MPCProtoDelegateInfoTokenE *)a3 forDSID:(unint64_t)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  BOOL v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  id v10 = a3;
  uint64_t v11 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C63B70, (uint64_t)v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_initialAccountGroup, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

void __61__MPCPlaybackAccountManager__setNeedsRefreshDueToMissingBag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x263F89110] sharedMonitor];
    [v1 registerObserver:WeakRetained];

    id v2 = [MEMORY[0x263F89110] sharedMonitor];
    int v3 = [v2 isRemoteServerLikelyReachable];

    if (v3) {
      [WeakRetained _updateAccounts];
    }
  }
}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = [a3 identityAllowingDelegation:1];
  [v3 addObject:v4];
}

void __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Delegated user identities: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_148(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_buildAccountFromDelegatedIdentity:(id)a3 completion:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = (void (**)(id, void))a4;
  id v8 = [MEMORY[0x263F893C8] defaultIdentityStore];
  id v62 = 0;
  BOOL v9 = [v8 DSIDForUserIdentity:v6 outError:&v62];
  id v10 = v62;
  uint64_t quot = [v9 longLongValue];
  uint64_t v12 = quot;
  uint64_t v13 = (char *)v65 + 1;
  do
  {
    lldiv_t v14 = lldiv(quot, 10);
    uint64_t quot = v14.quot;
    if (v14.rem >= 0) {
      LOBYTE(v15) = v14.rem;
    }
    else {
      uint64_t v15 = -v14.rem;
    }
    *(v13 - 2) = v15 + 48;
    id v16 = (const UInt8 *)(v13 - 2);
    --v13;
  }
  while (v14.quot);
  if (v12 < 0)
  {
    *(v13 - 2) = 45;
    id v16 = (const UInt8 *)(v13 - 2);
  }
  id v17 = (__CFString *)CFStringCreateWithBytes(0, v16, (char *)v65 - (char *)v16, 0x8000100u, 0);

  if (v10)
  {
    __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for delegated identity: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v7[2](v7, 0);
  }
  char v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v64 = 0x3032000000;
  v65[0] = __Block_byref_object_copy__28165;
  v65[1] = __Block_byref_object_dispose__28166;
  id v66 = 0;
  uint64_t v20 = [MEMORY[0x263F893C8] defaultIdentityStore];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke;
  v58[3] = &unk_2643C50D8;
  id v21 = v6;
  id v59 = v21;
  p_long long buf = &buf;
  uint64_t v22 = v19;
  v60 = v22;
  [v20 getPropertiesForUserIdentity:v21 completionHandler:v58];

  os_unfair_lock_lock(&self->_lock);
  initialAccountGroup = self->_initialAccountGroup;
  os_unfair_lock_unlock(&self->_lock);
  id v24 = objc_alloc(MEMORY[0x263F89360]);
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_142;
  v55[3] = &unk_2643C5100;
  BOOL v57 = initialAccountGroup == 0;
  id v25 = v21;
  id v56 = v25;
  char v26 = (void *)[v24 initWithBlock:v55];
  dispatch_group_enter(v22);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__28165;
  v53[4] = __Block_byref_object_dispose__28166;
  id v54 = 0;
  id v27 = objc_alloc(MEMORY[0x263F54ED0]);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_2;
  v49[3] = &unk_2643C5060;
  id v28 = v25;
  id v50 = v28;
  id v51 = self;
  id v29 = v22;
  id v52 = v29;
  id v30 = (void *)[v27 initWithTimeout:v49 interruptionHandler:2.0];
  long long v31 = [MEMORY[0x263F893A0] sharedBagProvider];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_143;
  v44[3] = &unk_2643C5088;
  id v32 = v28;
  id v45 = v32;
  id v48 = v53;
  id v33 = v30;
  id v46 = v33;
  long long v34 = v29;
  uint64_t v47 = v34;
  [v31 getBagForRequestContext:v26 withCompletionHandler:v44];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_144;
  v38[3] = &unk_2643C5128;
  id v39 = v32;
  id v40 = v17;
  long long v42 = &buf;
  long long v43 = v53;
  id v41 = v7;
  id v35 = v7;
  uint64_t v36 = v17;
  id v37 = v32;
  dispatch_group_notify(v34, MEMORY[0x263EF83A0], v38);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&buf, 8);
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get properties for delegated identity: %{public}@ error:%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [a2 storefrontIdentifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F893C0];
  id v8 = a2;
  int v4 = [v3 activeAccount];
  [v8 setIdentity:v4];

  id v5 = [MEMORY[0x263F893C8] defaultIdentityStore];
  [v8 setIdentityStore:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  [v8 setClientInfo:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F89370]) initWithUserInteractionLevel:1];
  [v8 setAuthenticationProvider:v7];

  [v8 setAllowsExpiredBags:*(unsigned char *)(a1 + 40) == 0];
  [v8 setDelegatedIdentity:*(void *)(a1 + 32)];
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] URL bag timed out. identity=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get URL bag for identity: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  if ([*(id *)(a1 + 40) disarm]) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_144(uint64_t a1)
{
  uint64_t v3 = [[MPCPlaybackAccount alloc] initWithDelegatedUserIdentity:*(void *)(a1 + 32)];
  id v2 = MPCHashedDSIDFromDSID(*(void **)(a1 + 40));
  [(MPCPlaybackAccount *)v3 setHashedDSID:v2];

  [(MPCPlaybackAccount *)v3 setHasCloudLibraryEnabled:1];
  [(MPCPlaybackAccount *)v3 setStoreFrontIdentifier:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [(MPCPlaybackAccount *)v3 setBag:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = [*(id *)(a1 + 40) shouldReturnLastKnownStatusOnly];
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 1024;
      int v9 = v5;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] Subscription status timed out. identity=%{public}@ firstLoad=%{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
    *(unsigned char *)(*(void *)(a1 + 48) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_136(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] URL bag timed out. identity=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_3(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1[6] + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    int v5 = (void *)a1[4];
    uint64_t v6 = [v4 hashedDSID];
    [v5 setObject:v4 forKeyedSubscript:v6];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  }
  uint64_t v7 = a1[5];

  dispatch_group_leave(v7);
}

uint64_t __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_117(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountsWithAttemptCount:*(void *)(a1 + 40) + 1];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if ([a3 isRemoteServerReachable])
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL needsRefreshDueToMissingBag = self->_needsRefreshDueToMissingBag;
    os_unfair_lock_unlock(&self->_lock);
    if (needsRefreshDueToMissingBag)
    {
      int v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Network is reachable - Refreshing due to missing bag", v6, 2u);
      }

      [(MPCPlaybackAccountManager *)self _updateAccounts];
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(NSHashTable *)self->_observers removeObject:v4];

  os_unfair_recursive_lock_unlock();
}

- (MPCPlaybackAccount)anyDelegationHostingAccount
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(NSDictionary *)self->_accounts allValues];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 hasDelegationCapability])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (MPCPlaybackAccount *)v3;
}

uint64_t __37__MPCPlaybackAccountManager_accounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isActiveAccount] && !objc_msgSend(v5, "isActiveAccount")) {
    goto LABEL_10;
  }
  if ([v5 isActiveAccount] && !objc_msgSend(v4, "isActiveAccount")
    || [v4 isDelegated] && !objc_msgSend(v5, "isDelegated"))
  {
    uint64_t v8 = 1;
    goto LABEL_12;
  }
  if ([v5 isDelegated] && !objc_msgSend(v4, "isDelegated"))
  {
LABEL_10:
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v6 = [v4 hashedDSID];
    uint64_t v7 = [v5 hashedDSID];
    uint64_t v8 = [v6 compare:v7];
  }
LABEL_12:

  return v8;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F89110] sharedMonitor];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCPlaybackAccountManager;
  [(MPCPlaybackAccountManager *)&v4 dealloc];
}

+ (MPCPlaybackAccountManager)sharedManagerIfExists
{
  return (MPCPlaybackAccountManager *)(id)__sharedManager;
}

@end