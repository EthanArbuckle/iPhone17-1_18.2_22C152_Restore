@interface ASCAppOfferStateCenter
+ (ASCAppOfferStateCenter)sharedCenter;
+ (OS_os_log)log;
- (AMSPromise)service;
- (ASCAppOfferStateCenter)initWithConnection:(id)a3 workspace:(id)a4;
- (ASCJitterBackoff)reconnectBackoff;
- (ASCPendingPromises)pendingActionPromises;
- (ASCServices)connection;
- (ASCWorkspace)workspace;
- (NSMapTable)stateMachines;
- (NSString)description;
- (id)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4;
- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5;
- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 usingService:(id)a6;
- (id)performFallbackActionForOffer:(id)a3;
- (id)reinstallWatchAppWithID:(id)a3;
- (id)reinstallWatchSystemAppWithBundleID:(id)a3;
- (id)stateMachineForOffer:(id)a3;
- (void)connectToService;
- (void)daemonConnectionWasLost:(id)a3;
- (void)daemonDidRebootstrap:(id)a3;
- (void)dealloc;
- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6;
- (void)offer:(id)a3 didChangeStatusText:(id)a4;
- (void)scheduleTryReconnect;
- (void)setService:(id)a3;
- (void)stopObservingStateForOffer:(id)a3;
- (void)tryReconnect;
- (void)useOfferStateMachineFallback;
- (void)viewAppForAppDistributionOffer:(id)a3;
@end

@implementation ASCAppOfferStateCenter

+ (OS_os_log)log
{
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)log_log_1;

  return (OS_os_log *)v2;
}

uint64_t __29__ASCAppOfferStateCenter_log__block_invoke()
{
  log_log_1 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCAppOfferStateCenter");

  return MEMORY[0x1F41817F8]();
}

+ (ASCAppOfferStateCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedCenter_sharedCenter;

  return (ASCAppOfferStateCenter *)v2;
}

void __38__ASCAppOfferStateCenter_sharedCenter__block_invoke()
{
  v0 = [ASCAppOfferStateCenter alloc];
  id v4 = +[ASCServicesConnection sharedConnection];
  v1 = +[ASCWorkspace sharedWorkspace];
  uint64_t v2 = [(ASCAppOfferStateCenter *)v0 initWithConnection:v4 workspace:v1];
  v3 = (void *)sharedCenter_sharedCenter;
  sharedCenter_sharedCenter = v2;
}

- (ASCAppOfferStateCenter)initWithConnection:(id)a3 workspace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ASCAppOfferStateCenter;
  v9 = [(ASCAppOfferStateCenter *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_workspace, a4);
    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    stateMachines = v10->_stateMachines;
    v10->_stateMachines = (NSMapTable *)v11;

    v13 = [[ASCJitterBackoff alloc] initWithBaseSleepTimeInterval:0.1 maxSleepTimeInterval:5.0];
    reconnectBackoff = v10->_reconnectBackoff;
    v10->_reconnectBackoff = v13;

    v15 = objc_alloc_init(ASCPendingPromises);
    pendingActionPromises = v10->_pendingActionPromises;
    v10->_pendingActionPromises = v15;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v10 selector:sel_daemonConnectionWasLost_ name:0x1F1E052D8 object:v7];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v10 selector:sel_daemonConnectionWasLost_ name:0x1F1E052F8 object:v7];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v20 = +[ASCRebootstrapNotifier sharedNotifier];
    [v19 addObserver:v10 selector:sel_daemonDidRebootstrap_ name:0x1F1E05278 object:v20];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCAppOfferStateCenter;
  [(ASCAppOfferStateCenter *)&v4 dealloc];
}

- (void)connectToService
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C2B8D000, v0, OS_LOG_TYPE_DEBUG, "%@ asked to connect, but it already has a connection", v1, 0xCu);
}

uint64_t __42__ASCAppOfferStateCenter_connectToService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Resuming observation of changes to %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [v3 startObservingStateOfOffers:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) reset];
}

void __42__ASCAppOfferStateCenter_connectToService__block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__ASCAppOfferStateCenter_connectToService__block_invoke_20_cold_1(a1);
  }
}

- (void)useOfferStateMachineFallback
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(ASCAppOfferStateCenter *)self service];

  if (!v3)
  {
    uint64_t v5 = ASCLocalizedString(@"OFFER_BUTTON_TITLE_VIEW", v4);
    v6 = +[ASCOfferMetadata textMetadataWithTitle:v5 subtitle:0];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v7 = [(ASCAppOfferStateCenter *)self stateMachines];
    uint64_t v8 = [v7 objectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) offerStateDidChange:@"unknown" withMetadata:v6 flags:2];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)scheduleTryReconnect
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(ASCAppOfferStateCenter *)self service];

  if (!v3)
  {
    id v4 = [(ASCAppOfferStateCenter *)self reconnectBackoff];
    [v4 nextSleepTimeInterval];
    -[ASCAppOfferStateCenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_tryReconnect, 0);
  }
}

- (void)tryReconnect
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(ASCAppOfferStateCenter *)self service];

  if (!v3)
  {
    id v4 = +[ASCAppOfferStateCenter log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Performing test before reconnecting to service", (uint8_t *)buf, 2u);
    }

    uint64_t v5 = [(ASCAppOfferStateCenter *)self connection];
    v6 = [v5 testConnection];

    objc_initWeak(buf, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke;
    v9[3] = &unk_1E645D710;
    v9[4] = self;
    [v6 addSuccessBlock:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2;
    v7[3] = &unk_1E645D810;
    objc_copyWeak(&v8, buf);
    [v6 addErrorBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v2, OS_LOG_TYPE_INFO, "Connection test successful, reconnecting to service", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_28;
  block[3] = &unk_1E645D710;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectToService];
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2_cold_1();
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_29;
  block[3] = &unk_1E645D7E8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained useOfferStateMachineFallback];
}

- (void)daemonConnectionWasLost:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ASCAppOfferStateCenter_daemonConnectionWasLost___block_invoke;
  block[3] = &unk_1E645D710;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__ASCAppOfferStateCenter_daemonConnectionWasLost___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pendingActionPromises];
    [v3 cancelAll];

    [*(id *)(a1 + 32) setService:0];
    id v4 = *(void **)(a1 + 32);
    [v4 scheduleTryReconnect];
  }
}

- (void)daemonDidRebootstrap:(id)a3
{
  id v4 = [(ASCAppOfferStateCenter *)self service];

  if (v4)
  {
    [(ASCAppOfferStateCenter *)self setService:0];
    [(ASCAppOfferStateCenter *)self tryReconnect];
  }
}

- (id)stateMachineForOffer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(ASCAppOfferStateCenter *)self service];

  if (!v5) {
    [(ASCAppOfferStateCenter *)self connectToService];
  }
  id v6 = [(ASCAppOfferStateCenter *)self stateMachines];
  int v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [[ASCAppOfferStateMachine alloc] initWithOffer:v4 stateCenter:self];
    uint64_t v9 = [(ASCAppOfferStateCenter *)self stateMachines];
    [v9 setObject:v8 forKey:v4];

    uint64_t v10 = [(ASCAppOfferStateCenter *)self service];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke;
    v16[3] = &unk_1E645D838;
    id v11 = v4;
    id v17 = v11;
    [v10 addSuccessBlock:v16];

    uint64_t v12 = [(ASCAppOfferStateCenter *)self service];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_32;
    v14[3] = &unk_1E645D738;
    id v15 = v11;
    [v12 addErrorBlock:v14];
  }

  return v8;
}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Starting observation of changes to %{public}@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v3 startObservingStateOfOffers:v6];
}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_32_cold_1(a1);
  }
}

- (void)stopObservingStateForOffer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(ASCAppOfferStateCenter *)self service];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke;
  v15[3] = &unk_1E645D838;
  id v6 = v4;
  id v16 = v6;
  [v5 addSuccessBlock:v15];

  uint64_t v7 = [(ASCAppOfferStateCenter *)self service];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_33;
  long long v13 = &unk_1E645D738;
  id v14 = v6;
  id v8 = v6;
  [v7 addErrorBlock:&v10];

  uint64_t v9 = [(ASCAppOfferStateCenter *)self stateMachines];
  [v9 removeObjectForKey:v8];
}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Stopping observation of changes to %{public}@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  [v3 stopObservingStateOfOffers:v6];
}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_33_cold_1(a1);
  }
}

- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 usingService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v14, OS_LOG_TYPE_INFO, "Performing action", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke;
  v27[3] = &unk_1E645D860;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  id v16 = v15;
  id v31 = v16;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v13 addSuccessBlock:v27];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_35;
  v25[3] = &unk_1E645D738;
  id v20 = v16;
  id v26 = v20;
  [v13 addErrorBlock:v25];

  v21 = [(ASCAppOfferStateCenter *)self pendingActionPromises];
  [v21 addBinaryPromise:v20];

  objc_super v22 = v26;
  id v23 = v20;

  return v23;
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_2;
  v6[3] = &unk_1E645D738;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [a2 performActionOfOffer:v3 withActivity:v4 inContext:v5 withReplyHandler:v6];
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Performed action", v6, 2u);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v3) {
    [v5 finishWithError:v3];
  }
  else {
    [v5 finishWithSuccess];
  }
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_35_cold_1();
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

- (id)performFallbackActionForOffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "Performing fallback action", v12, 2u);
  }

  id v6 = [v4 id];
  uint64_t v7 = [v4 flags];

  id v8 = +[ASCLockupProductDetails URLForLockupID:v6 ofKind:@"app" withOfferFlags:v7];

  uint64_t v9 = [(ASCAppOfferStateCenter *)self workspace];
  id v10 = [v9 openURL:v8];

  return v10;
}

- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = [(ASCAppOfferStateCenter *)self service];
  if (v11) {
    [(ASCAppOfferStateCenter *)self performActionOfOffer:v10 withActivity:v8 inContext:v9 usingService:v11];
  }
  else {
  id v12 = [(ASCAppOfferStateCenter *)self performFallbackActionForOffer:v10];
  }

  return v12;
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "Viewing app for app distribution offer", buf, 2u);
  }

  id v6 = [(ASCAppOfferStateCenter *)self service];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke;
  v9[3] = &unk_1E645D838;
  id v10 = v4;
  id v7 = v4;
  [v6 addSuccessBlock:v9];

  id v8 = [(ASCAppOfferStateCenter *)self service];
  [v8 addErrorBlock:&__block_literal_global_38];
}

uint64_t __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 viewAppForAppDistributionOffer:*(void *)(a1 + 32)];
}

void __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2_cold_1();
  }
}

- (id)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [(ASCAppOfferStateCenter *)self service];

  if (!v8) {
    [(ASCAppOfferStateCenter *)self connectToService];
  }
  id v9 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2B8D000, v9, OS_LOG_TYPE_INFO, "Decorating buy params", buf, 2u);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  id v11 = [(ASCAppOfferStateCenter *)self service];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke;
  v26[3] = &unk_1E645D8A8;
  id v27 = v6;
  id v28 = v7;
  id v12 = v10;
  id v29 = v12;
  id v13 = v7;
  id v14 = v6;
  [v11 addSuccessBlock:v26];

  id v15 = [(ASCAppOfferStateCenter *)self service];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke_2;
  v24 = &unk_1E645D738;
  id v16 = v12;
  id v25 = v16;
  [v15 addErrorBlock:&v21];

  id v17 = [(ASCAppOfferStateCenter *)self pendingActionPromises];
  [v17 addPromise:v16];

  id v18 = v25;
  id v19 = v16;

  return v19;
}

void __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v5 = a2;
  id v6 = [v4 completionHandlerAdapter];
  [v5 decorateBuyParamsForOffer:v2 withActivity:v3 withReplyHandler:v6];
}

void __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ASCAppOfferStateCenter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

- (id)reinstallWatchAppWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(ASCAppOfferStateCenter *)self service];

  if (!v5) {
    [(ASCAppOfferStateCenter *)self connectToService];
  }
  id v6 = [(ASCAppOfferStateCenter *)self service];
  id v7 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke;
  v17[3] = &unk_1E645D7C0;
  id v18 = v4;
  id v8 = v7;
  id v19 = v8;
  id v9 = v4;
  [v6 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_3;
  v15[3] = &unk_1E645D738;
  id v10 = v8;
  id v16 = v10;
  [v6 addErrorBlock:v15];
  id v11 = [(ASCAppOfferStateCenter *)self pendingActionPromises];
  [v11 addBinaryPromise:v10];

  id v12 = v16;
  id v13 = v10;

  return v13;
}

void __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_2;
  v4[3] = &unk_1E645D738;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 reinstallWatchAppWithID:v3 withReplyHandler:v4];
}

uint64_t __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)reinstallWatchSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(ASCAppOfferStateCenter *)self service];

  if (!v5) {
    [(ASCAppOfferStateCenter *)self connectToService];
  }
  id v6 = [(ASCAppOfferStateCenter *)self service];
  id v7 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke;
  v17[3] = &unk_1E645D7C0;
  id v18 = v4;
  id v8 = v7;
  id v19 = v8;
  id v9 = v4;
  [v6 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_3;
  v15[3] = &unk_1E645D738;
  id v10 = v8;
  id v16 = v10;
  [v6 addErrorBlock:v15];
  id v11 = [(ASCAppOfferStateCenter *)self pendingActionPromises];
  [v11 addBinaryPromise:v10];

  id v12 = v16;
  id v13 = v10;

  return v13;
}

void __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_2;
  v4[3] = &unk_1E645D738;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 reinstallWatchSystemAppWithBundleID:v3 withReplyHandler:v4];
}

uint64_t __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v13 = [(ASCAppOfferStateCenter *)self stateMachines];
  id v14 = [v13 objectForKey:v10];

  if (v14)
  {
    [v14 offerStateDidChange:v11 withMetadata:v12 flags:a6];
  }
  else
  {
    id v15 = +[ASCAppOfferStateCenter log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v10 id];
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_1C2B8D000, v15, OS_LOG_TYPE_INFO, "No state machine for to notify for change to %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)offer:(id)a3 didChangeStatusText:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v8 = [(ASCAppOfferStateCenter *)self stateMachines];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    [v9 offerStatusTextDidChange:v7];
  }
  else
  {
    id v10 = +[ASCAppOfferStateCenter log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v6 id];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "No state machine for to notify for change to %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (NSString)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCAppOfferStateCenter *)self connection];
  [(ASCDescriber *)v3 addSensitiveObject:v4 withName:@"connection"];

  id v5 = [(ASCAppOfferStateCenter *)self stateMachines];
  [(ASCDescriber *)v3 addSensitiveObject:v5 withName:@"stateMachines"];

  id v6 = [(ASCAppOfferStateCenter *)self service];
  [(ASCDescriber *)v3 addSensitiveObject:v6 withName:@"service"];

  id v7 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v7;
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCWorkspace)workspace
{
  return self->_workspace;
}

- (NSMapTable)stateMachines
{
  return self->_stateMachines;
}

- (ASCJitterBackoff)reconnectBackoff
{
  return self->_reconnectBackoff;
}

- (ASCPendingPromises)pendingActionPromises
{
  return self->_pendingActionPromises;
}

- (AMSPromise)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingActionPromises, 0);
  objc_storeStrong((id *)&self->_reconnectBackoff, 0);
  objc_storeStrong((id *)&self->_stateMachines, 0);
  objc_storeStrong((id *)&self->_workspace, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __42__ASCAppOfferStateCenter_connectToService__block_invoke_20_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) arrayByApplyingSelector:&sel_id];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C2B8D000, v2, v3, "Could not resume observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2_cold_1()
{
  os_log_t v0 = AMSLogableError();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C2B8D000, v1, v2, "Connection test failed, reason: %{public}@", v3, v4, v5, v6, v7);
}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_32_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) id];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C2B8D000, v2, v3, "Could not start observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);
}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_33_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) id];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C2B8D000, v2, v3, "Could not stop observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_35_cold_1()
{
  os_log_t v0 = AMSLogableError();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C2B8D000, v1, v2, "Could not perform action, reason: %{public}@", v3, v4, v5, v6, v7);
}

void __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2_cold_1()
{
  os_log_t v0 = AMSLogableError();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C2B8D000, v1, v2, "Could not view app, reason: %{public}@", v3, v4, v5, v6, v7);
}

void __65__ASCAppOfferStateCenter_decorateBuyParamsForOffer_withActivity___block_invoke_2_cold_1()
{
  os_log_t v0 = AMSLogableError();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C2B8D000, v1, v2, "Could not decorate buy params, reason: %{public}@", v3, v4, v5, v6, v7);
}

@end