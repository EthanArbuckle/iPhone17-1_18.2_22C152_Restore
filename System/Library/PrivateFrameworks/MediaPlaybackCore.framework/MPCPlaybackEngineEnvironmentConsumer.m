@interface MPCPlaybackEngineEnvironmentConsumer
+ (NSString)identifier;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackEngineEnvironmentConsumer)initWithPlaybackEngine:(id)a3;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (NSDictionary)signalInfo;
- (NSDictionary)signalStrength;
- (NSNumber)isCurrentNetworkLinkExpensive;
- (NSNumber)isCurrentNetworkLinkHighQuality;
- (NSNumber)isNetworkConstrained;
- (int64_t)networkType;
- (void)_addEventForAccountIdentifier:(id)a3 cursor:(id)a4 event:(id)a5 nudge:(int)a6;
- (void)_allowsExplicitContentDidChange:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillTerminate:(id)a3;
- (void)_devicePrivateListeningDidChange:(id)a3;
- (void)_snapshotAccount:(id)a3 eventType:(id)a4 atTime:(id *)a5;
- (void)_snapshotAccount:(id)a3 eventType:(id)a4 event:(id)a5 nudge:(int)a6;
- (void)_snapshotDeviceAtTime:(id *)a3;
- (void)_snapshotDeviceWithEvent:(id)a3 nudge:(int)a4;
- (void)_snapshotNetworkReachabilityAtTime:(id *)a3 force:(BOOL)a4;
- (void)_snapshotNetworkReachabilityWithEvent:(id)a3 nudge:(int)a4;
- (void)_snapshotNetworkTypeAtTime:(id *)a3;
- (void)_snapshotNetworkTypeWithEvent:(id)a3 nudge:(int)a4;
- (void)_updateNetworkInfo;
- (void)accountManager:(id)a3 didChangeAccounts:(id)a4;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)setIsCurrentNetworkLinkExpensive:(id)a3;
- (void)setIsCurrentNetworkLinkHighQuality:(id)a3;
- (void)setIsNetworkConstrained:(id)a3;
- (void)setNetworkType:(int64_t)a3;
- (void)setSignalInfo:(id)a3;
- (void)setSignalStrength:(id)a3;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCPlaybackEngineEnvironmentConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/environment";
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:@"account-id"];

  if (v8)
  {
    v9 = [v5 payload];
    v10 = [v9 objectForKeyedSubscript:@"queue-delegated-account-id"];

    if (v10) {
      [*(id *)(a1 + 32) _addEventForAccountIdentifier:v10 cursor:v6 event:v5 nudge:1];
    }
    [*(id *)(a1 + 32) _addEventForAccountIdentifier:v8 cursor:v6 event:v5 nudge:2];
  }
  return 1;
}

- (void)_snapshotAccount:(id)a3 eventType:(id)a4 atTime:(id *)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v11 = +[MPCPlaybackAccountManager sharedManager];
  v12 = [v11 accountForHashedDSID:v8];

  if (v12)
  {
    v41 = a5;
    id v46 = v9;
    v13 = [MEMORY[0x263F893C8] defaultIdentityStore];
    v14 = [v12 userIdentity];
    uint64_t v15 = [v13 DSIDForUserIdentity:v14 outError:0];

    v16 = [MEMORY[0x263F891E0] sharedController];
    uint64_t v17 = [v16 lastKnownHouseholdID];

    v18 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    unsigned int v19 = [v18 allowsExplicitContent];

    v20 = (void *)v17;
    if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory])
    {
      v21 = (void *)MEMORY[0x263F11DA8];
      v22 = [v12 userIdentity];
      v23 = [MEMORY[0x263F893C8] defaultIdentityStore];
      v24 = [v21 userMonitorWithUserIdentity:v22 fromUserIdentityStore:v23];

      if (v24) {
        unsigned int v19 = [v24 isExplicitSettingEnabled];
      }
      unsigned int v40 = v19;
    }
    else
    {
      unsigned int v40 = v19;
    }
    v45 = [v10 eventStream];
    v51[1] = @"account-metadata";
    v52[0] = v8;
    v51[0] = @"account-id";
    v49[0] = @"store-front-id";
    uint64_t v25 = [v12 storeFrontIdentifier];
    v26 = (void *)v25;
    if (!v25)
    {
      uint64_t v25 = [MEMORY[0x263EFF9D0] null];
    }
    v37 = (void *)v25;
    v50[0] = v25;
    v49[1] = @"store-account-id";
    uint64_t v27 = v15;
    if (!v15)
    {
      uint64_t v27 = [MEMORY[0x263EFF9D0] null];
    }
    v42 = (void *)v15;
    v36 = (void *)v27;
    v50[1] = v27;
    v49[2] = @"active";
    v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isActiveAccount"));
    v50[2] = v39;
    v49[3] = @"delegated";
    v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isDelegated"));
    v50[3] = v38;
    v49[4] = @"subscription-status";
    v28 = [v12 subscriptionStatus];
    v29 = v28;
    if (!v28)
    {
      v29 = [MEMORY[0x263EFF9D0] null];
    }
    v43 = v10;
    id v44 = v8;
    v50[4] = v29;
    v49[5] = @"household-id";
    v30 = v20;
    if (!v20)
    {
      v20 = [MEMORY[0x263EFF9D0] null];
    }
    v50[5] = v20;
    v49[6] = @"private-listening-enabled";
    v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isPrivateListeningEnabled"));
    v50[6] = v31;
    v49[7] = @"explicit-allowed";
    v32 = [NSNumber numberWithBool:v40];
    v50[7] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:8];
    v52[1] = v33;
    v34 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    long long v35 = *(_OWORD *)&v41->var2;
    v47[0] = *(_OWORD *)&v41->var0;
    v47[1] = v35;
    double var4 = v41->var4;
    [v45 emitEventType:v46 payload:v34 atTime:v47];

    if (!v30) {
    v10 = v43;
    }
    id v8 = v44;
    if (!v28) {

    }
    if (!v42) {
    id v9 = v46;
    }
    if (!v26) {
  }
    }
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)subscribeToEventStream:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_subscription, a3);
  id v6 = [MEMORY[0x263F89110] sharedMonitor];
  [v6 registerObserver:self];

  v7 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(v7, block);

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *MEMORY[0x263F11C48];
  [v8 addObserver:self selector:sel__devicePrivateListeningDidChange_ name:*MEMORY[0x263F11C48] object:0];

  v10 = [MEMORY[0x263F087C8] defaultCenter];
  [v10 addObserver:self selector:sel__devicePrivateListeningDidChange_ name:v9 object:0];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel__allowsExplicitContentDidChange_ name:*MEMORY[0x263F11C70] object:0];

  if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory])
  {
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__allowsExplicitContentDidChange_ name:*MEMORY[0x263F111E0] object:0];
  }
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__applicationWillTerminate_ name:*MEMORY[0x263F833C8] object:0];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];

  v16 = +[MPCPlaybackAccountManager sharedManager];
  [v16 registerObserver:self];

  subscription = self->_subscription;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_2;
  v22[3] = &unk_2643C5258;
  v22[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)subscription subscribeToEventType:@"session-begin" options:257 handler:v22];
  v18 = self->_subscription;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_3;
  v21[3] = &unk_2643C5258;
  v21[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v18 subscribeToEventType:@"session-migrate-begin" options:257 handler:v21];
  unsigned int v19 = self->_subscription;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_4;
  v20[3] = &unk_2643C5258;
  v20[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v19 subscribeToEventType:@"queue-add" options:257 handler:v20];
}

- (MPCPlaybackEngineEnvironmentConsumer)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackEngineEnvironmentConsumer;
  id v5 = [(MPCPlaybackEngineEnvironmentConsumer *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_addEventForAccountIdentifier:(id)a3 cursor:(id)a4 event:(id)a5 nudge:(int)a6
{
  v21[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v21[0] = @"session-begin";
  v21[1] = @"session-migrate-begin";
  v21[2] = @"session-restore-begin";
  v12 = (void *)MEMORY[0x263EFF8C0];
  id v13 = a4;
  v14 = [v12 arrayWithObjects:v21 count:3];
  uint64_t v15 = [v13 findPreviousEventWithTypes:v14 matchingPayload:0];

  v16 = [v13 cursorUntilEvent:v15];

  unsigned int v19 = @"account-id";
  id v20 = v10;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v18 = [v16 findPreviousEventWithType:@"account-begin" matchingPayload:v17];

  if (!v18) {
    [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotAccount:v10 eventType:@"account-begin" event:v11 nudge:-a6];
  }
}

- (void)_snapshotAccount:(id)a3 eventType:(id)a4 event:(id)a5 nudge:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    [a5 monotonicTime];
    uint64_t v12 = *(void *)&v16[0];
    int64x2_t v13 = *(int64x2_t *)((char *)v16 + 8);
    uint64_t v14 = *((void *)&v16[1] + 1);
    double v15 = v17;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v12 = 0;
    double v17 = 0.0;
    int64x2_t v13 = 0uLL;
    memset(v16, 0, sizeof(v16));
    double v15 = 0.0;
  }
  uint64_t v18 = v12;
  int64x2_t v19 = vaddq_s64(v13, vdupq_n_s64(a6));
  uint64_t v20 = v14;
  double v21 = (double)a6 / 1000000000.0 + v15;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotAccount:eventType:atTime:](self, "_snapshotAccount:eventType:atTime:", v10, v11, &v18, v16[0], v16[1], *(void *)&v17);
}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v7 = [v6 eventStream];
  objc_super v8 = [v7 eventDeliveryDeferralAssertionOfType:0 forReason:@"Updating Accounts"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) hashedDSID];
        MPCPlaybackEngineEventGetMonotonicTime(v15);
        [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotAccount:v14 eventType:@"account-update" atTime:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v8 invalidate];
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _snapshotDeviceWithEvent:v4 nudge:1];
  [*(id *)(a1 + 32) _snapshotNetworkReachabilityWithEvent:v4 nudge:2];
  [*(id *)(a1 + 32) _snapshotNetworkTypeWithEvent:v4 nudge:3];

  return 1;
}

- (void)_snapshotNetworkTypeWithEvent:(id)a3 nudge:(int)a4
{
  if (a3)
  {
    [a3 monotonicTime];
    uint64_t v6 = *(void *)&v10[0];
    int64x2_t v7 = *(int64x2_t *)((char *)v10 + 8);
    uint64_t v8 = *((void *)&v10[1] + 1);
    double v9 = v11;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    double v11 = 0.0;
    int64x2_t v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    double v9 = 0.0;
  }
  uint64_t v12 = v6;
  int64x2_t v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  uint64_t v14 = v8;
  double v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkTypeAtTime:](self, "_snapshotNetworkTypeAtTime:", &v12, v10[0], v10[1], *(void *)&v11);
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateNetworkInfo];
  v2 = *(void **)(a1 + 32);
  MPCPlaybackEngineEventGetMonotonicTime(v4);
  return [v2 _snapshotNetworkTypeAtTime:v4];
}

- (void)_snapshotNetworkTypeAtTime:(id *)a3
{
  v29[6] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_signalStrength;
  int64x2_t v7 = self->_signalInfo;
  int64_t networkType = self->_networkType;
  double v9 = self->_isNetworkConstrained;
  uint64_t v10 = self->_isCurrentNetworkLinkExpensive;
  double v11 = self->_isCurrentNetworkLinkHighQuality;
  os_unfair_lock_unlock(p_lock);
  v24 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v23 = [v24 eventStream];
  v28[0] = @"network-signal-info";
  uint64_t v12 = (uint64_t)v7;
  uint64_t v25 = v7;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  v22 = (void *)v12;
  v29[0] = v12;
  v28[1] = @"network-signal-strength";
  uint64_t v13 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v21 = (void *)v13;
  v29[1] = v13;
  v28[2] = @"network-type";
  uint64_t v14 = [NSNumber numberWithInteger:networkType];
  v29[2] = v14;
  v28[3] = @"network-constrained";
  double v15 = v9;
  if (!v9)
  {
    double v15 = [MEMORY[0x263EFF9D0] null];
  }
  v29[3] = v15;
  v28[4] = @"network-expensive";
  long long v16 = v10;
  if (!v10)
  {
    long long v16 = [MEMORY[0x263EFF9D0] null];
  }
  long long v17 = v6;
  v29[4] = v16;
  v28[5] = @"network-high-quality";
  long long v18 = v11;
  if (!v11)
  {
    long long v18 = [MEMORY[0x263EFF9D0] null];
  }
  v29[5] = v18;
  long long v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  long long v20 = *(_OWORD *)&a3->var2;
  v26[0] = *(_OWORD *)&a3->var0;
  v26[1] = v20;
  double var4 = a3->var4;
  [v23 emitEventType:@"network-type-changed" payload:v19 atTime:v26];

  if (!v11) {
  if (v10)
  }
  {
    if (v9) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_15;
    }
  }

LABEL_15:
  if (!v17)
  {

    if (v25) {
      goto LABEL_17;
    }
LABEL_21:

    goto LABEL_17;
  }
  if (!v25) {
    goto LABEL_21;
  }
LABEL_17:
}

- (void)_updateNetworkInfo
{
  id v18 = [MEMORY[0x263F89110] sharedMonitor];
  v3 = [v18 signalStrength];
  id v4 = [v18 signalInfo];
  int64_t v5 = [v18 networkType];
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "isNetworkConstrained"));
  uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "isCurrentNetworkLinkExpensive"));
  int64x2_t v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "isCurrentNetworkLinkHighQuality"));
  uint64_t v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  signalInfo = self->_signalInfo;
  self->_signalInfo = v4;
  uint64_t v10 = v4;

  signalStrength = self->_signalStrength;
  self->_signalStrength = v3;
  uint64_t v12 = v3;

  isNetworkConstrained = self->_isNetworkConstrained;
  self->_int64_t networkType = v5;
  self->_isNetworkConstrained = v6;
  uint64_t v14 = v6;

  isCurrentNetworkLinkExpensive = self->_isCurrentNetworkLinkExpensive;
  self->_isCurrentNetworkLinkExpensive = v7;
  long long v16 = v7;

  isCurrentNetworkLinkHighQuality = self->_isCurrentNetworkLinkHighQuality;
  self->_isCurrentNetworkLinkHighQuality = v8;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_snapshotNetworkReachabilityWithEvent:(id)a3 nudge:(int)a4
{
  if (a3)
  {
    [a3 monotonicTime];
    uint64_t v6 = *(void *)&v10[0];
    int64x2_t v7 = *(int64x2_t *)((char *)v10 + 8);
    uint64_t v8 = *((void *)&v10[1] + 1);
    double v9 = v11;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    double v11 = 0.0;
    int64x2_t v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    double v9 = 0.0;
  }
  uint64_t v12 = v6;
  int64x2_t v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  uint64_t v14 = v8;
  double v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkReachabilityAtTime:force:](self, "_snapshotNetworkReachabilityAtTime:force:", &v12, 1, v10[0], v10[1], *(void *)&v11);
}

- (void)_snapshotNetworkReachabilityAtTime:(id *)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  v22[3] = *MEMORY[0x263EF8340];
  int64x2_t v7 = [MEMORY[0x263F89110] sharedMonitor];
  if ([v7 isRemoteServerReachable]) {
    int64_t v8 = 2;
  }
  else {
    int64_t v8 = [v7 isRemoteServerLikelyReachable];
  }
  os_unfair_lock_lock(&self->_lock);
  int v9 = self->_reachability != v8 || v4;
  if (v9 == 1) {
    self->_reachability = v8;
  }
  uint64_t v10 = self->_signalStrength;
  double v11 = self->_signalInfo;
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    uint64_t v12 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
    int64x2_t v13 = [v12 eventStream];
    v21[0] = @"network-signal-info";
    uint64_t v14 = v11;
    if (!v11)
    {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
    }
    v22[0] = v14;
    v21[1] = @"network-signal-strength";
    double v15 = v10;
    if (!v10)
    {
      double v15 = [MEMORY[0x263EFF9D0] null];
    }
    v22[1] = v15;
    v21[2] = @"network-reachability";
    long long v16 = [NSNumber numberWithInteger:v8];
    v22[2] = v16;
    long long v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    long long v18 = *(_OWORD *)&a3->var2;
    v19[0] = *(_OWORD *)&a3->var0;
    v19[1] = v18;
    double var4 = a3->var4;
    [v13 emitEventType:@"network-reachability-changed" payload:v17 atTime:v19];

    if (v10)
    {
      if (v11)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

      if (v11) {
        goto LABEL_16;
      }
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (void)_snapshotDeviceWithEvent:(id)a3 nudge:(int)a4
{
  if (a3)
  {
    [a3 monotonicTime];
    uint64_t v6 = *(void *)&v10[0];
    int64x2_t v7 = *(int64x2_t *)((char *)v10 + 8);
    uint64_t v8 = *((void *)&v10[1] + 1);
    double v9 = v11;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    double v11 = 0.0;
    int64x2_t v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    double v9 = 0.0;
  }
  uint64_t v12 = v6;
  int64x2_t v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  uint64_t v14 = v8;
  double v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotDeviceAtTime:](self, "_snapshotDeviceAtTime:", &v12, v10[0], v10[1], *(void *)&v11);
}

- (void)_snapshotDeviceAtTime:(id *)a3
{
  v68[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = MGCopyAnswer();
  int64_t v5 = [MEMORY[0x263F89108] currentDeviceInfo];
  uint64_t v6 = [MEMORY[0x263F890C0] defaultInfo];
  int64x2_t v7 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v8 = [v7 isDevicePrivateListeningEnabled];
  unsigned int v60 = [v8 BOOLValue];

  double v9 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v10 = [v9 isFocusModePrivateListeningEnabled];

  id v11 = objc_alloc(MEMORY[0x263F89360]);
  uint64_t v12 = [MEMORY[0x263F893C0] activeAccount];
  int64x2_t v13 = (void *)[v11 initWithIdentity:v12];
  uint64_t v14 = [v13 userAgent];

  double v15 = [MEMORY[0x263F086E0] mainBundle];
  long long v16 = [v15 infoDictionary];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"CFBundleVersion"];

  long long v18 = MSVProcessCopyUUID();
  v58 = [v18 UUIDString];

  uint64_t v19 = MSVProcessCopyMediaFrameworksDescriptions();
  unsigned int IsInternalCarry = MSVDeviceIsInternalCarry();
  if (v10)
  {
    if ([v10 BOOLValue]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  v54 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v62 = [v54 eventStream];
  v67 = @"device-metadata";
  v65[0] = @"device-name";
  v53 = [v5 deviceName];
  v66[0] = v53;
  v65[1] = @"device-model";
  v52 = [v5 deviceModel];
  v66[1] = v52;
  v65[2] = @"device-software-variant";
  uint64_t v21 = v4;
  if (!v4)
  {
    uint64_t v21 = [MEMORY[0x263EFF9D0] null];
  }
  v43 = (void *)v21;
  v66[2] = v21;
  v65[3] = @"application-name";
  uint64_t v22 = [v6 processName];
  v23 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x263EFF9D0] null];
  }
  v42 = (void *)v22;
  v66[3] = v22;
  v65[4] = @"application-bundle-id";
  uint64_t v24 = [v6 bundleIdentifier];
  v50 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x263EFF9D0] null];
  }
  v51 = v23;
  v41 = (void *)v24;
  v66[4] = v24;
  v65[5] = @"application-version";
  uint64_t v25 = [v6 clientVersion];
  v49 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x263EFF9D0] null];
  }
  unsigned int v40 = (void *)v25;
  v66[5] = v25;
  v65[6] = @"system-name";
  v47 = [v5 productPlatform];
  v66[6] = v47;
  v65[7] = @"system-version";
  uint64_t v26 = [v5 productVersion];
  uint64_t v27 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x263EFF9D0] null];
  }
  v39 = (void *)v26;
  v66[7] = v26;
  v65[8] = @"system-build";
  id v46 = [v5 buildVersion];
  v66[8] = v46;
  v65[9] = @"private-listening-enabled";
  v45 = [NSNumber numberWithBool:v60];
  v66[9] = v45;
  v65[10] = @"focus-mode-private-listening-enabled";
  if (v10) {
    [NSNumber numberWithInteger:v20];
  }
  else {
    [MEMORY[0x263EFF9D0] null];
  }
  id v44 = v61 = (void *)v4;
  v66[10] = v44;
  v65[11] = @"user-agent";
  uint64_t v28 = v14;
  if (!v14)
  {
    uint64_t v28 = [MEMORY[0x263EFF9D0] null];
  }
  v38 = (void *)v28;
  v66[11] = v28;
  v65[12] = @"media-frameworks";
  v29 = (void *)v19;
  if (!v19)
  {
    v29 = [MEMORY[0x263EFF9D0] null];
  }
  v56 = (void *)v19;
  v57 = (void *)v17;
  v59 = v10;
  v66[12] = v29;
  v65[13] = @"application-source-version";
  v30 = (void *)v17;
  if (!v17)
  {
    v30 = [MEMORY[0x263EFF9D0] null];
  }
  v31 = (void *)v14;
  v32 = v6;
  v66[13] = v30;
  v65[14] = @"application-uuid";
  v33 = v58;
  if (!v58)
  {
    v33 = [MEMORY[0x263EFF9D0] null];
  }
  v66[14] = v33;
  v65[15] = @"internal-carry";
  v34 = [NSNumber numberWithBool:IsInternalCarry];
  v66[15] = v34;
  long long v35 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:16];
  v68[0] = v35;
  v36 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
  long long v37 = *(_OWORD *)&a3->var2;
  v63[0] = *(_OWORD *)&a3->var0;
  v63[1] = v37;
  double var4 = a3->var4;
  [v62 emitEventType:@"device-changed" payload:v36 atTime:v63];

  if (!v58) {
  if (!v57)
  }

  if (v56)
  {
    if (v31) {
      goto LABEL_33;
    }
  }
  else
  {

    if (v31) {
      goto LABEL_33;
    }
  }

LABEL_33:
  if (!v27) {

  }
  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v61)
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCurrentNetworkLinkHighQuality, 0);
  objc_storeStrong((id *)&self->_isCurrentNetworkLinkExpensive, 0);
  objc_storeStrong((id *)&self->_isNetworkConstrained, 0);
  objc_storeStrong((id *)&self->_signalInfo, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_subscription, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setIsCurrentNetworkLinkHighQuality:(id)a3
{
}

- (NSNumber)isCurrentNetworkLinkHighQuality
{
  return self->_isCurrentNetworkLinkHighQuality;
}

- (void)setIsCurrentNetworkLinkExpensive:(id)a3
{
}

- (NSNumber)isCurrentNetworkLinkExpensive
{
  return self->_isCurrentNetworkLinkExpensive;
}

- (void)setIsNetworkConstrained:(id)a3
{
}

- (NSNumber)isNetworkConstrained
{
  return self->_isNetworkConstrained;
}

- (void)setNetworkType:(int64_t)a3
{
  self->_int64_t networkType = a3;
}

- (int64_t)networkType
{
  return self->_networkType;
}

- (void)setSignalInfo:(id)a3
{
}

- (NSDictionary)signalInfo
{
  return self->_signalInfo;
}

- (void)setSignalStrength:(id)a3
{
}

- (NSDictionary)signalStrength
{
  return self->_signalStrength;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (void)_allowsExplicitContentDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = +[MPCPlaybackAccountManager sharedManager];
  int64_t v5 = [v4 accounts];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v10 isDelegated] & 1) == 0)
        {
          id v11 = [v10 hashedDSID];
          MPCPlaybackEngineEventGetMonotonicTime(v12);
          [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotAccount:v11 eventType:@"account-update" atTime:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_devicePrivateListeningDidChange:(id)a3
{
  uint64_t v4 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  int64_t v5 = [v4 eventStream];
  uint64_t v6 = [v5 eventDeliveryDeferralAssertionOfType:0 forReason:@"Updating Device"];

  MPCPlaybackEngineEventGetMonotonicTime(v7);
  [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotDeviceAtTime:v7];
  [v6 invalidate];
}

- (void)_applicationWillTerminate:(id)a3
{
  id v5 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v3 = [v5 eventStream];
  [v3 emitEventType:@"application-termination" payload:0];

  uint64_t v4 = [v5 eventStream];
  [v4 flushEvents];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v3 = [v4 eventStream];
  [v3 emitEventType:@"application-background" payload:0];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  v3 = [v4 eventStream];
  [v3 emitEventType:@"application-foreground" payload:0];
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  id v5 = [v4 eventStream];
  uint64_t v6 = [v5 eventDeliveryDeferralAssertionOfType:0 forReason:@"Updating NetworkType"];

  [(MPCPlaybackEngineEnvironmentConsumer *)self _updateNetworkInfo];
  MPCPlaybackEngineEventGetMonotonicTime(v7);
  [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotNetworkTypeAtTime:v7];
  [v6 invalidate];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = [(MPCPlaybackEngineEnvironmentConsumer *)self playbackEngine];
  id v5 = [v4 eventStream];
  uint64_t v6 = [v5 eventDeliveryDeferralAssertionOfType:0 forReason:@"Updating NetworkReachability"];

  [(MPCPlaybackEngineEnvironmentConsumer *)self _updateNetworkInfo];
  MPCPlaybackEngineEventGetMonotonicTime(v7);
  [(MPCPlaybackEngineEnvironmentConsumer *)self _snapshotNetworkReachabilityAtTime:v7 force:0];
  [v6 invalidate];
}

- (void)unsubscribeFromEventStream:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F89110], "sharedMonitor", a3);
  [v4 unregisterObserver:self];

  id v5 = +[MPCPlaybackAccountManager sharedManager];
  [v5 unregisterObserver:self];

  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _snapshotDeviceWithEvent:v4 nudge:1];
  [*(id *)(a1 + 32) _snapshotNetworkReachabilityWithEvent:v4 nudge:2];
  [*(id *)(a1 + 32) _snapshotNetworkTypeWithEvent:v4 nudge:3];

  return 1;
}

- (void)dealloc
{
  v3 = +[MPCPlaybackAccountManager sharedManager];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCPlaybackEngineEnvironmentConsumer;
  [(MPCPlaybackEngineEnvironmentConsumer *)&v4 dealloc];
}

@end