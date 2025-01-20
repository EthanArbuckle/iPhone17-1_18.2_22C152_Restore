@interface MPCFairPlayPerformanceController
+ (id)sharedController;
- (id)_init;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_fetchMiniSINFsWithCompletion:(id)a3;
- (void)_optimisticallyFetchLeaseForAccounts:(id)a3;
- (void)_optimisticallyFetchLeaseWithLeaseManager:(id)a3 accountEnumerator:(id)a4;
- (void)_prewarmMiniSINFEndpointForAccount:(id)a3;
- (void)_prewarmSAPSigningForAccount:(id)a3;
- (void)accountManager:(id)a3 didChangeAccounts:(id)a4;
- (void)dealloc;
- (void)registerLeaseManager:(id)a3;
- (void)scheduleMiniSINFFetch;
- (void)unregisterLeaseManager:(id)a3;
@end

@implementation MPCFairPlayPerformanceController

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MPCFairPlayPerformanceController *)self _prewarmSAPSigningForAccount:*(void *)(*((void *)&v17 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v11 = MPUIApplication();
  if ([v11 applicationState])
  {
    char IsAudioAccessory = MSVDeviceIsAudioAccessory();

    if ((IsAudioAccessory & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  [(MPCFairPlayPerformanceController *)self _optimisticallyFetchLeaseForAccounts:v6];
LABEL_13:
  miniQueue = self->_miniQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__MPCFairPlayPerformanceController_accountManager_didChangeAccounts___block_invoke;
  v15[3] = &unk_2643C5EE8;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  dispatch_async(miniQueue, v15);
}

+ (id)sharedController
{
  if (sharedController_onceToken_24692 != -1) {
    dispatch_once(&sharedController_onceToken_24692, &__block_literal_global_24693);
  }
  v2 = (void *)sharedController___sharedController_24694;

  return v2;
}

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)MPCFairPlayPerformanceController;
  v2 = [(MPCFairPlayPerformanceController *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    leaseManagers = v2->_leaseManagers;
    v2->_leaseManagers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    SAPSignPrewarmingAccounts = v2->_SAPSignPrewarmingAccounts;
    v2->_SAPSignPrewarmingAccounts = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    SAPSignPrewarmedAccounts = v2->_SAPSignPrewarmedAccounts;
    v2->_SAPSignPrewarmedAccounts = (NSMutableSet *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCFairPlayPerformance-miniSinf", v9);
    miniQueue = v2->_miniQueue;
    v2->_miniQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    miniSINFAccounts = v2->_miniSINFAccounts;
    v2->_miniSINFAccounts = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    miniSINFEndpointLoadingAccounts = v2->_miniSINFEndpointLoadingAccounts;
    v2->_miniSINFEndpointLoadingAccounts = (NSMutableSet *)v14;

    id v16 = +[MPCPlaybackAccountManager sharedManager];
    [v16 registerObserver:v2];

    long long v17 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
    [v17 registerObserver:v2];

    long long v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v2 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (void)registerLeaseManager:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_leaseManagers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

void __52__MPCFairPlayPerformanceController_sharedController__block_invoke()
{
  if ((ICCurrentApplicationIsSystemApp() & 1) == 0)
  {
    id v0 = [[MPCFairPlayPerformanceController alloc] _init];
    v1 = (void *)sharedController___sharedController_24694;
    sharedController___sharedController_24694 = (uint64_t)v0;
  }
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543618;
    long long v18 = v8;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v7, "fppc:prewarmSAP:signData", "account=%{public}@ error=%{public}@", buf, 0x16u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_68;
  block[3] = &unk_2643C4718;
  int8x16_t v12 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v12.i64[0];
  int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
  uint64_t v10 = *(void *)(a1 + 48);
  id v15 = v4;
  uint64_t v16 = v10;
  id v11 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_62(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v7, "fppc:prewarmSAP:buildURL", "account=%{public}@ error=%{public}@", buf, 0x16u);
  }
  id v9 = [MEMORY[0x263F892D8] sharedSAPSessionWithVersion:*MEMORY[0x263F88FA8] URLBag:*(void *)(a1 + 40) requestContext:*(void *)(a1 + 48)];
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v13;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "fppc:prewarmSAP:signData", "account=%{public}@", buf, 0xCu);
  }
  int8x16_t v14 = [@" " dataUsingEncoding:4];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_67;
  v17[3] = &unk_2643C4360;
  uint64_t v20 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 56);
  id v18 = v15;
  uint64_t v19 = v16;
  [v9 signData:v14 withCompletionHandler:v17];
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:prewarmSAP:bag", "account=%{public}@ error=%{public}@", buf, 0x16u);
  }
  id v11 = [v5 urlForBagKey:*MEMORY[0x263F89060]];
  os_signpost_id_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [NSURL URLWithString:@"https://itunes.apple.com/"];
  }
  int8x16_t v14 = v13;

  id v15 = (void *)[objc_alloc(MEMORY[0x263F89368]) initWithURL:v14 requestContext:*(void *)(a1 + 40)];
  uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  long long v17 = v16;
  os_signpost_id_t v18 = *(void *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    uint64_t v19 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "fppc:prewarmSAP:buildURL", "account=%{public}@", buf, 0xCu);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_62;
  v23[3] = &unk_2643C4388;
  uint64_t v28 = *(void *)(a1 + 56);
  id v24 = *(id *)(a1 + 32);
  id v25 = v5;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 48);
  id v26 = v20;
  uint64_t v27 = v21;
  id v22 = v5;
  [v15 buildURLRequestWithCompletionHandler:v23];
}

void __69__MPCFairPlayPerformanceController_accountManager_didChangeAccounts___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  [v2 addObjectsFromArray:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  [v2 addObjectsFromArray:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 hashedDSID];
        [v2 removeObject:v11];

        [*(id *)(a1 + 32) _prewarmMiniSINFEndpointForAccount:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v2;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        os_signpost_id_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v17;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_INFO, "[FPPC] engine:didChangeAccounts: removing account=%{public}@", buf, 0xCu);
        }

        [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v17];
        [*(id *)(*(void *)(a1 + 32) + 56) setObject:0 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)_optimisticallyFetchLeaseForAccounts:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_leaseManagers anyObject];
  os_unfair_lock_unlock(&self->_lock);
  if (!v4) {
    id v4 = [[_MPCLeaseManager alloc] initWithPlaybackEngine:0];
  }
  id v5 = [v6 objectEnumerator];
  [(MPCFairPlayPerformanceController *)self _optimisticallyFetchLeaseWithLeaseManager:v4 accountEnumerator:v5];
}

- (void)_optimisticallyFetchLeaseWithLeaseManager:(id)a3 accountEnumerator:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v10 = (void *)v8;
    *(void *)&long long v9 = 138543362;
    long long v24 = v9;
    while (1)
    {
      char v11 = objc_msgSend(v10, "usesLease", v24);
      id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      uint64_t v13 = v12;
      if (v11) {
        break;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v10 hashedDSID];
        *(_DWORD *)buf = v24;
        id v32 = v14;
        _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: skipping [account doesn't use lease] account=%{public}@", buf, 0xCu);
      }
      uint64_t v15 = [v7 nextObject];

      uint64_t v10 = (void *)v15;
      if (!v15) {
        goto LABEL_15;
      }
    }
    os_signpost_id_t v16 = os_signpost_id_generate(v12);

    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    os_signpost_id_t v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      long long v19 = [v10 hashedDSID];
      *(_DWORD *)buf = v24;
      id v32 = v19;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:_optimisticallyFetchLeaseForAccount", "account=%{public}@", buf, 0xCu);
    }
    long long v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    long long v21 = v20;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      long long v22 = [v10 hashedDSID];
      *(_DWORD *)buf = v24;
      id v32 = v22;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:_optimisticallyFetchLeaseForAccount:getHasPreparedLease", "account=%{public}@", buf, 0xCu);
    }
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke;
    v25[3] = &unk_2643C4248;
    os_signpost_id_t v30 = v16;
    id v26 = v10;
    id v27 = v6;
    uint64_t v28 = self;
    id v29 = v7;
    id v23 = v10;
    [v27 getHasPreparedLeaseForAccount:v23 completion:v25];
  }
LABEL_15:
}

- (void)_prewarmMiniSINFEndpointForAccount:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_miniQueue);
  if ([v4 isDelegated])
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 hashedDSID];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v6;
      id v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [delegated]";
LABEL_10:
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
    }
  }
  else if ([v4 usesLease])
  {
    miniSINFEndpointLoadingAccounts = self->_miniSINFEndpointLoadingAccounts;
    long long v9 = [v4 hashedDSID];
    LODWORD(miniSINFEndpointLoadingAccounts) = [(NSMutableSet *)miniSINFEndpointLoadingAccounts containsObject:v9];

    if (miniSINFEndpointLoadingAccounts)
    {
      id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [v4 hashedDSID];
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v6;
        id v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [account already loading]";
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v10 = self->_miniSINFEndpointLoadingAccounts;
      char v11 = [v4 hashedDSID];
      [(NSMutableSet *)v10 addObject:v11];

      id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v4);

      uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      uint64_t v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        os_signpost_id_t v16 = [v4 hashedDSID];
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v16;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:prewarmMiniSINF", "account=%{public}@", buf, 0xCu);
      }
      id v17 = objc_alloc(MEMORY[0x263F89360]);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke;
      v30[3] = &unk_2643C4310;
      os_signpost_id_t v18 = v4;
      uint64_t v31 = v18;
      long long v19 = (void *)[v17 initWithBlock:v30];
      long long v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      long long v21 = v20;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        long long v22 = [v18 hashedDSID];
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v22;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:prewarmMiniSINF:bag", "account=%{public}@", buf, 0xCu);
      }
      id v23 = [MEMORY[0x263F893A0] sharedBagProvider];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_50;
      v25[3] = &unk_2643C4338;
      os_signpost_id_t v29 = v13;
      id v26 = v18;
      id v27 = self;
      id v28 = v19;
      id v24 = v19;
      [v23 getBagForRequestContext:v24 withCompletionHandler:v25];

      id v5 = v31;
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 hashedDSID];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v6;
      id v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [account doesn't use lease]";
      goto LABEL_10;
    }
  }
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_68(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) hashedDSID];
  [v2 removeObject:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [*(id *)(a1 + 40) hashedDSID];
  [v4 addObject:v5];

  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    long long v9 = [*(id *)(a1 + 40) hashedDSID];
    int v16 = 138543362;
    id v17 = v9;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_END, v8, "fppc:prewarmSAP", "account=%{public}@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      os_signpost_id_t v13 = [*(id *)(a1 + 40) hashedDSID];
      uint64_t v14 = *(void *)(a1 + 48);
      int v16 = 138543618;
      id v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_INFO, "[FPPC] _prewarmSAPSigningForAccount: failed account=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (v12)
  {
    uint64_t v15 = [*(id *)(a1 + 40) hashedDSID];
    int v16 = 138543362;
    id v17 = v15;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_INFO, "[FPPC] _prewarmSAPSigningForAccount: done account=%{public}@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_prewarmSAPSigningForAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([v4 isDelegated])
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 hashedDSID];
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      id v7 = "[FPPC] _prewarmSAPSigningForAccount: skipping account=%{public}@ [delegated]";
LABEL_10:
      uint64_t v10 = v5;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      goto LABEL_11;
    }
  }
  else
  {
    SAPSignPrewarmedAccounts = self->_SAPSignPrewarmedAccounts;
    long long v9 = [v4 hashedDSID];
    LODWORD(SAPSignPrewarmedAccounts) = [(NSMutableSet *)SAPSignPrewarmedAccounts containsObject:v9];

    if (SAPSignPrewarmedAccounts)
    {
      id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v4 hashedDSID];
        *(_DWORD *)buf = 138543362;
        id v34 = v6;
        id v7 = "[FPPC] _prewarmSAPSigningForAccount: ignoring account=%{public}@ [already prewarmed]";
        uint64_t v10 = v5;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl(&dword_21BB87000, v10, v11, v7, buf, 0xCu);
LABEL_19:
      }
    }
    else
    {
      SAPSignPrewarmingAccounts = self->_SAPSignPrewarmingAccounts;
      os_signpost_id_t v13 = [v4 hashedDSID];
      int v14 = [(NSMutableSet *)SAPSignPrewarmingAccounts containsObject:v13];

      uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v5 = v15;
      if (!v14)
      {
        os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v4);

        id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        __int16 v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          uint64_t v19 = [v4 hashedDSID];
          *(_DWORD *)buf = 138543362;
          id v34 = v19;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:prewarmSAP", "account=%{public}@", buf, 0xCu);
        }
        uint64_t v20 = self->_SAPSignPrewarmingAccounts;
        long long v21 = [v4 hashedDSID];
        [(NSMutableSet *)v20 addObject:v21];

        long long v22 = [v4 userIdentity];
        id v5 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v22];

        id v23 = [v5 _createStoreRequestContext];
        id v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        long long v25 = v24;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          id v26 = [v4 hashedDSID];
          *(_DWORD *)buf = 138543362;
          id v34 = v26;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:prewarmSAP:bag", "account=%{public}@", buf, 0xCu);
        }
        id v27 = [MEMORY[0x263F893A0] sharedBagProvider];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke;
        v28[3] = &unk_2643C4338;
        os_signpost_id_t v32 = v16;
        id v29 = v4;
        id v30 = v23;
        uint64_t v31 = self;
        id v6 = v23;
        [v27 getBagForRequestContext:v6 withCompletionHandler:v28];

        goto LABEL_19;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v6 = [v4 hashedDSID];
        *(_DWORD *)buf = 138543362;
        id v34 = v6;
        id v7 = "[FPPC] _prewarmSAPSigningForAccount: skipping account=%{public}@ [already prewarming]";
        goto LABEL_10;
      }
    }
  }
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = +[MPCPlaybackAccountManager sharedManager];
  id v5 = [v4 activeAccount];

  if (v5)
  {
    v7[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [(MPCFairPlayPerformanceController *)self _optimisticallyFetchLeaseForAccounts:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniSINFAccounts, 0);
  objc_storeStrong((id *)&self->_miniSINFEndpointLoadingAccounts, 0);
  objc_storeStrong((id *)&self->_miniQueue, 0);
  objc_storeStrong((id *)&self->_SAPSignPrewarmedAccounts, 0);
  objc_storeStrong((id *)&self->_SAPSignPrewarmingAccounts, 0);

  objc_storeStrong((id *)&self->_leaseManagers, 0);
}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userIdentity];
  [v3 setIdentity:v4];

  id v5 = (id)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  [v3 setClientInfo:v5];
}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = [*(id *)(a1 + 32) hashedDSID];
    *(_DWORD *)buf = 138543618;
    long long v22 = v10;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:prewarmMiniSINF:bag", "account=%{public}@ error=%{public}@", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  BOOL v12 = *(NSObject **)(v11 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_51;
  block[3] = &unk_2643C4220;
  void block[4] = v11;
  id v13 = *(id *)(a1 + 32);
  int v14 = *(void **)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  id v17 = v13;
  id v18 = v5;
  id v19 = v14;
  id v15 = v5;
  dispatch_async(v12, block);
}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_51(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [*(id *)(a1 + 40) hashedDSID];
  LOBYTE(v2) = [v2 containsObject:v3];

  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    id v5 = [*(id *)(a1 + 40) hashedDSID];
    [v4 removeObject:v5];

    id v6 = [*(id *)(a1 + 48) urlForBagKey:*MEMORY[0x263F89040]];
    uint64_t v7 = [*(id *)(a1 + 48) int64ValueForBagKey:@"max-mini-sinf-batch-size"];
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [*(id *)(a1 + 40) hashedDSID];
        int v28 = 138543874;
        id v29 = v11;
        __int16 v30 = 2114;
        uint64_t v31 = v6;
        __int16 v32 = 2048;
        uint64_t v33 = v8;
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_INFO, "[FPPC] _prewarmMiniSINFEndpointForAccount: ignoring account=%{public}@ [missing endpointURL or batch size] endpointURL=%{public}@ batchSize=%lld", (uint8_t *)&v28, 0x20u);
      }
      BOOL v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v13 = (_MPCMiniSINFEndpointInfo *)v12;
      os_signpost_id_t v14 = *(void *)(a1 + 64);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        id v15 = [*(id *)(a1 + 40) hashedDSID];
        int v28 = 138543362;
        id v29 = v15;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, &v13->super, OS_SIGNPOST_INTERVAL_END, v14, "fppc:prewarmMiniSINF", "account=%{public}@ [failed]", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      if (v7 >= 50) {
        uint64_t v21 = 50;
      }
      else {
        uint64_t v21 = v7;
      }
      id v13 = [[_MPCMiniSINFEndpointInfo alloc] initWithEndpointURL:v6 maximumBatchSize:v21 requestContext:*(void *)(a1 + 56)];
      long long v22 = *(void **)(*(void *)(a1 + 32) + 56);
      __int16 v23 = [*(id *)(a1 + 40) hashedDSID];
      [v22 setObject:v13 forKeyedSubscript:v23];

      id v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      uint64_t v25 = v24;
      os_signpost_id_t v26 = *(void *)(a1 + 64);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        id v27 = [*(id *)(a1 + 40) hashedDSID];
        int v28 = 138543362;
        id v29 = v27;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v25, OS_SIGNPOST_INTERVAL_END, v26, "fppc:prewarmMiniSINF", "account=%{public}@", (uint8_t *)&v28, 0xCu);
      }
      [*(id *)(a1 + 32) scheduleMiniSINFFetch];
    }
  }
  else
  {
    os_signpost_id_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [*(id *)(a1 + 40) hashedDSID];
      int v28 = 138543362;
      id v29 = v17;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_INFO, "[FPPC] _prewarmMiniSINFEndpointForAccount: ignoring account=%{public}@ [account removed while loading]", (uint8_t *)&v28, 0xCu);
    }
    id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v6 = v18;
    os_signpost_id_t v19 = *(void *)(a1 + 64);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      uint64_t v20 = [*(id *)(a1 + 40) hashedDSID];
      int v28 = 138543362;
      id v29 = v20;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v19, "fppc:prewarmMiniSINF", "account=%{public}@ [removed]", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)_fetchMiniSINFsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_miniQueue);
  dispatch_group_t v5 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "fppc:fetchMiniSINFs", "", buf, 2u);
  }

  miniSINFAccounts = self->_miniSINFAccounts;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke;
  v18[3] = &unk_2643C42C0;
  uint64_t v20 = v23;
  os_signpost_id_t v21 = v7;
  uint64_t v11 = v5;
  os_signpost_id_t v19 = v11;
  [(NSMutableDictionary *)miniSINFAccounts enumerateKeysAndObjectsUsingBlock:v18];
  miniQueue = self->_miniQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_45;
  block[3] = &unk_2643C42E8;
  os_signpost_id_t v16 = v23;
  os_signpost_id_t v17 = v7;
  void block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_group_notify(v11, miniQueue, block);

  _Block_object_dispose(v23, 8);
}

void __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v47 = a2;
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v47;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "fppc:fetchMiniSINFs:account", "accountID=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v9 = [MEMORY[0x263EFF9C0] setWithCapacity:4];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "maximumBatchSize"));
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v47;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:fetchMiniSINFs:account:enumerateAsset", "accountID=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  os_signpost_id_t v14 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_18;
  v53[3] = &unk_2643C4270;
  id v15 = v9;
  id v54 = v15;
  id v16 = v10;
  id v55 = v16;
  id v17 = v5;
  id v56 = v17;
  p_long long buf = &buf;
  [v14 enumerateAssetsMissingSINFsForHashedPersonID:v47 usingBlock:v53];

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v18 + 24)) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  }
  *(unsigned char *)(v18 + 24) = v19;
  uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v21 = v20;
  os_signpost_id_t v22 = *(void *)(a1 + 48);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    int v23 = [v15 count];
    int v24 = [v16 count];
    int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)v60 = 138544130;
    id v61 = v47;
    __int16 v62 = 1024;
    int v63 = v23;
    __int16 v64 = 1024;
    int v65 = v24;
    __int16 v66 = 1024;
    int v67 = v25;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_END, v22, "fppc:fetchMiniSINFs:account:enumerateAsset", "accountID=%{public}@ flavors=%d assets=%d hasMoreAssets=%{BOOL}u", v60, 0x1Eu);
  }

  if ([v16 count])
  {
    id v26 = objc_alloc(MEMORY[0x263F089E0]);
    id v27 = [v17 endpointURL];
    int v28 = [v26 initWithURL:v27];

    [v28 setHTTPMethod:@"POST"];
    v58[0] = @"guid";
    id v29 = [v17 requestContext];
    __int16 v30 = [v29 deviceInfo];
    uint64_t v31 = [v30 deviceGUID];
    __int16 v32 = (void *)v31;
    uint64_t v33 = &stru_26CBCA930;
    if (v31) {
      uint64_t v33 = (__CFString *)v31;
    }
    v59[0] = v33;
    v58[1] = @"flavors";
    uint64_t v34 = [v15 allObjects];
    v58[2] = @"adamIds";
    v59[1] = v34;
    v59[2] = v16;
    uint64_t v35 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];

    v36 = [MEMORY[0x263F08900] dataWithJSONObject:v35 options:0 error:0];
    [v28 setHTTPBody:v36];

    [v28 addValue:@"application/json" forHTTPHeaderField:*MEMORY[0x263F88F20]];
    id v37 = objc_alloc(MEMORY[0x263F89368]);
    v38 = [v17 requestContext];
    v39 = (void *)[v37 initWithURLRequest:v28 requestContext:v38];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v41 = v40;
    os_signpost_id_t v42 = *(void *)(a1 + 48);
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_DWORD *)v60 = 138543362;
      id v61 = v47;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v42, "fppc:fetchMiniSINFs:account:request", "accountID=%{public}@", v60, 0xCu);
    }

    v43 = [MEMORY[0x263F893B8] defaultSession];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_41;
    v48[3] = &unk_2643C4298;
    uint64_t v52 = *(void *)(a1 + 48);
    id v49 = v47;
    id v50 = *(id *)(a1 + 32);
    id v44 = v35;
    id v51 = v44;
    [v43 enqueueDataRequest:v39 withCompletionHandler:v48];
  }
  else
  {
    v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    int v28 = v45;
    os_signpost_id_t v46 = *(void *)(a1 + 48);
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_DWORD *)v60 = 138543362;
      id v61 = v47;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v28, OS_SIGNPOST_INTERVAL_END, v46, "fppc:fetchMiniSINFs:account", "accountID=%{public}@", v60, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_45(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fppc:fetchMiniSINFs", "hasMoreAssets=%{BOOL}u", (uint8_t *)v7, 8u);
  }

  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return [*(id *)(a1 + 32) scheduleMiniSINFFetch];
  }
  return result;
}

uint64_t __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_18(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v6 flavor] - 1;
  if (v7 > 3) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = off_2643C43A8[v7];
  }
  [v5 addObject:v8];
  BOOL v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v6 identifier];

  [v9 addObject:v10];
  uint64_t v11 = [*(id *)(a1 + 40) count];
  uint64_t result = [*(id *)(a1 + 48) maximumBatchSize];
  if (v11 == result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

void __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    id v46 = v10;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:fetchMiniSINFs:account:request", "accountID=%{public}@", buf, 0xCu);
  }

  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v12 = v11;
  if (!v6)
  {
    os_signpost_id_t v16 = *(void *)(a1 + 56);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      id v17 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      id v46 = v17;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@", buf, 0xCu);
    }

    uint64_t v18 = [v5 parsedBodyDictionary];
    BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F12228]) initWithPayload:v18 requestPayload:*(void *)(a1 + 48) hashedPersonID:*(void *)(a1 + 32)];
    uint64_t v20 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
    id v44 = 0;
    [v20 importAssetsFromRequest:v19 error:&v44];
    id v21 = v44;

    os_signpost_id_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    int v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v46 = v21;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_FAULT, "[FPPC] _fetchMiniSINFs: failed [import failure] error=%{public}@", buf, 0xCu);
      }

      int v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      int v25 = v24;
      os_signpost_id_t v26 = *(void *)(a1 + 56);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        id v27 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        id v46 = v27;
        __int16 v47 = 2114;
        id v48 = v21;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v25, OS_SIGNPOST_INTERVAL_END, v26, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@ error=%{public}@", buf, 0x16u);
      }

      int v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v29 = v28;
      os_signpost_id_t v30 = *(void *)(a1 + 56);
      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
        goto LABEL_32;
      }
      uint64_t v31 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      id v46 = v31;
      __int16 v47 = 2114;
      id v48 = v21;
      __int16 v32 = "accountID=%{public}@ error=%{public}@";
      uint64_t v33 = v29;
      os_signpost_id_t v34 = v30;
      uint32_t v35 = 22;
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v36 = [v18 count];
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v46) = v36;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_INFO, "[FPPC] _fetchMiniSINFs: finished importing sinfs for %d identifiers", buf, 8u);
      }

      id v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v38 = v37;
      os_signpost_id_t v39 = *(void *)(a1 + 56);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        v40 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        id v46 = v40;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v38, OS_SIGNPOST_INTERVAL_END, v39, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@", buf, 0xCu);
      }

      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v29 = v41;
      os_signpost_id_t v42 = *(void *)(a1 + 56);
      if (v42 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41)) {
        goto LABEL_32;
      }
      v43 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      id v46 = v43;
      __int16 v32 = "accountID=%{public}@";
      uint64_t v33 = v29;
      os_signpost_id_t v34 = v42;
      uint32_t v35 = 12;
    }
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v33, OS_SIGNPOST_INTERVAL_END, v34, "fppc:fetchMiniSINFs:account", v32, buf, v35);
LABEL_32:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_33;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v46 = v6;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "[FPPC] _fetchMiniSINFs: failed [network failure] error=%{public}@", buf, 0xCu);
  }

  os_signpost_id_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 56);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138543362;
    id v46 = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v14, OS_SIGNPOST_INTERVAL_END, v15, "fppc:fetchMiniSINFs:account", "error=%{public}@", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_33:
}

- (void)scheduleMiniSINFFetch
{
  miniQueue = self->_miniQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(miniQueue, block);
}

void __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 64))
  {
    *(unsigned char *)(v1 + 64) = 1;
    dispatch_time_t v3 = dispatch_time(0, 500000000);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_2;
    block[3] = &unk_2643C5FC8;
    void block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

unsigned char *__57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[64])
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_3;
    v2[3] = &unk_2643C5FC8;
    v2[4] = result;
    return (unsigned char *)[result _fetchMiniSINFsWithCompletion:v2];
  }
  return result;
}

uint64_t __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 0;
  return result;
}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  unint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)long long buf = 138543362;
    id v25 = v5;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_END, v8, "fppc:_optimisticallyFetchLeaseForAccount:getHasPreparedLease", "error=%{public}@", buf, 0xCu);
  }

  os_signpost_id_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (a2)
  {
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_END, v11, "fppc:_optimisticallyFetchLeaseForAccount", "already had lease", buf, 2u);
    }

    BOOL v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      os_signpost_id_t v13 = [*(id *)(a1 + 32) hashedDSID];
      *(_DWORD *)long long buf = 138543362;
      id v25 = v13;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: already has lease account=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      os_signpost_id_t v14 = [*(id *)(a1 + 32) hashedDSID];
      *(_DWORD *)long long buf = 138543362;
      id v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "fppc:_optimisticallyFetchLeaseForAccount:prepareLease", "account=%{public}@", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_14;
    block[3] = &unk_2643C4220;
    BOOL v19 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    os_signpost_id_t v16 = *(void **)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 48);
    id v20 = v15;
    uint64_t v21 = v17;
    id v22 = v16;
    dispatch_async(MEMORY[0x263EF83A0], block);

    BOOL v12 = v19;
  }
}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_14(uint64_t a1)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_2;
  v6[3] = &unk_2643C41F8;
  uint64_t v11 = *(void *)(a1 + 64);
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  [v3 prepareForPlaybackWithAccount:v4 completion:v6];
}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v3)
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      int v11 = 138543362;
      id v12 = v3;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fppc:_optimisticallyFetchLeaseForAccount:prepareLease", "error=%{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) hashedDSID];
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: failed to fetch account=%{public}@ error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) _optimisticallyFetchLeaseWithLeaseManager:*(void *)(a1 + 48) accountEnumerator:*(void *)(a1 + 56)];
  }
  else
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fppc:_optimisticallyFetchLeaseForAccount", "fetched lease", (uint8_t *)&v11, 2u);
    }

    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 32) hashedDSID];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: fetched lease account=%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)dealloc
{
  id v3 = +[MPCPlaybackAccountManager sharedManager];
  [v3 unregisterObserver:self];

  id v4 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MPCFairPlayPerformanceController;
  [(MPCFairPlayPerformanceController *)&v5 dealloc];
}

- (void)unregisterLeaseManager:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_leaseManagers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

@end