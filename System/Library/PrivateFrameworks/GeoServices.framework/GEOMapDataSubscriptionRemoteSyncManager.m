@interface GEOMapDataSubscriptionRemoteSyncManager
- (GEOMapDataSubscriptionRemoteSyncManager)init;
- (GEOMapDataSubscriptionSyncManagerDelegate)delegate;
- (id)_connection;
- (void)_handleEvent:(id)a3;
- (void)_receivedStateUpdate:(id)a3;
- (void)_reconnectIfNecessary;
- (void)_startObservingStateForIdentifier:(id)a3;
- (void)_stopObservingStateForIdentifier:(id)a3;
- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3;
- (void)dealloc;
- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4;
@end

@implementation GEOMapDataSubscriptionRemoteSyncManager

- (void)fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v9 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __119__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53ED830;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:v9 withReply:v7 handler:v11];
}

- (void)fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[GEOMapSubscriptionFetchLastUpdatedDateRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionFetchLastUpdatedDateRequest *)v8 setOnPairedDevice:1];
  v9 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __126__GEOMapDataSubscriptionRemoteSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53DF8E8;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:v9 withReply:v7 handler:v11];
}

- (void)setDelegate:(id)a3
{
}

- (GEOMapDataSubscriptionRemoteSyncManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)GEOMapDataSubscriptionRemoteSyncManager;
  v2 = [(GEOMapDataSubscriptionRemoteSyncManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_configuredConnection.lock._os_unfair_lock_opaque = 0;
    v2->_configuredConnection.didRun = 0;
    uint64_t v4 = geo_dispatch_queue_create_with_workloop_qos();
    incomingMessageQueue = v3->_incomingMessageQueue;
    v3->_incomingMessageQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = geo_isolater_create();
    statesLock = v3->_statesLock;
    v3->_statesLock = (geo_isolater *)v6;

    objc_initWeak(&location, v3);
    global_queue = geo_get_global_queue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__GEOMapDataSubscriptionRemoteSyncManager_init__block_invoke;
    v11[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v3->_geodLaunchedNotifyToken, global_queue, v11);

    v9 = v3;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  notify_cancel(self->_geodLaunchedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapDataSubscriptionRemoteSyncManager;
  [(GEOMapDataSubscriptionRemoteSyncManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_statesLock, 0);
  objc_storeStrong((id *)&self->_incomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __126__GEOMapDataSubscriptionRemoteSyncManager_fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  [v10 timestamp];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5 || v6 <= 0.0)
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v10 timestamp];
    v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0);
  }
}

void __119__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 identifiers];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)_connection
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke;
  v4[3] = &unk_1E53D79D8;
  v4[4] = self;
  GEOOnce((uint64_t)&self->_configuredConnection, v4);
  return self->_connection;
}

void __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke_2;
  v6[3] = &unk_1E53DF960;
  objc_copyWeak(&v7, &location);
  uint64_t v3 = +[GEOXPCConnection createServerConnectionFor:14 debugIdentifier:@"MapDataSubscriptionSyncManager" queue:v2 eventHandler:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__GEOMapDataSubscriptionRemoteSyncManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reconnectIfNecessary];
}

void __54__GEOMapDataSubscriptionRemoteSyncManager__connection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

- (void)_handleEvent:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x18C1213B0]();
  if (v5 == MEMORY[0x1E4F145A8])
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__93;
    v29 = __Block_byref_object_dispose__93;
    id v30 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __56__GEOMapDataSubscriptionRemoteSyncManager__handleEvent___block_invoke;
    v22 = &unk_1E53D89C0;
    v23 = self;
    v24 = &v25;
    geo_isolate_sync_data();
    if ([(id)v26[5] count])
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
      v8 = (void *)MEMORY[0x1E4F28C58];
      v9 = [NSString stringWithUTF8String:string];
      id v10 = [v8 GEOErrorWithCode:-15 reason:v9];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v11 = (id)v26[5];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v11);
            }
            -[GEOMapDataSubscriptionState _handleXPCError:](*(void *)(*((void *)&v15 + 1) + 8 * v14++), v10);
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v31 count:16];
        }
        while (v12);
      }
    }
    _Block_object_dispose(&v25, 8);
  }
  else if (v5 == MEMORY[0x1E4F14590])
  {
    id v6 = xpc_dictionary_get_string(v4, "message");
    if (!strcmp(v6, "subscription_state_did_change")) {
      [(GEOMapDataSubscriptionRemoteSyncManager *)self _receivedStateUpdate:v4];
    }
  }
}

void __56__GEOMapDataSubscriptionRemoteSyncManager__handleEvent___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectEnumerator];
  uint64_t v2 = [v6 allObjects];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)fetchSubscriptionsForSyncToWatchWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest *)v11 setDeviceIdentifier:v10];

  uint64_t v12 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __122__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53ED7B8;
  id v15 = v8;
  id v13 = v8;
  [(GEOXPCRequest *)v11 send:v12 withReply:v9 handler:v14];
}

void __122__GEOMapDataSubscriptionRemoteSyncManager_fetchSubscriptionsForSyncToWatchWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 subscriptionsInfo];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[GEOMapSubscriptionSetPairedDeviceSyncRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionSetPairedDeviceSyncRequest *)v13 setIdentifier:v10];
  [(GEOMapSubscriptionSetPairedDeviceSyncRequest *)v13 setShouldSync:v8];
  objc_initWeak(&location, self);
  uint64_t v14 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E53ED7E0;
  BOOL v21 = v8;
  objc_copyWeak(&v20, &location);
  v17[4] = self;
  id v15 = v10;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [(GEOXPCRequest *)v13 send:v14 withReply:v11 handler:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6 && !*(unsigned char *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      id v8 = *(id *)(a1 + 40);
      geo_isolate_sync_data();
      if (*((unsigned char *)v10 + 24)) {
        [*(id *)(a1 + 32) _stopObservingStateForIdentifier:*(void *)(a1 + 40)];
      }

      _Block_object_dispose(&v9, 8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __130__GEOMapDataSubscriptionRemoteSyncManager_setSubscriptionWithIdentifier_shouldSyncToPairedDevice_callbackQueue_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  uint64_t v4 = *(void **)(a1[4] + 56);

  return [v4 removeObjectForKey:v3];
}

- (void)startDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3 mode:(unint64_t)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    id v6 = [[GEOMapSubscriptionStartDownloadRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
    [(GEOMapSubscriptionStartDownloadRequest *)v6 setIdentifiers:v8];
    [(GEOMapSubscriptionStartDownloadRequest *)v6 setDownloadMode:a4];
    [(GEOMapSubscriptionStartDownloadRequest *)v6 setOnPairedDevice:1];
    id v7 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
    [(GEOXPCRequest *)v6 send:v7];
  }
}

- (void)cancelDownloadForPairedDeviceSubscriptionIdentifiers:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v4 = [[GEOMapSubscriptionCancelDownloadRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
    [(GEOMapSubscriptionCancelDownloadRequest *)v4 setIdentifiers:v6];
    [(GEOMapSubscriptionCancelDownloadRequest *)v4 setOnPairedDevice:1];
    id v5 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
    [(GEOXPCRequest *)v4 send:v5];
  }
}

- (void)fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[GEOMapSubscriptionFetchPairedDeviceAvailableOfflineStorageRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v9 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__GEOMapDataSubscriptionRemoteSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53ED808;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:v9 withReply:v7 handler:v11];
}

void __129__GEOMapDataSubscriptionRemoteSyncManager_fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v6 = [a2 availableBytes];
  }
  else {
    uint64_t v6 = -1;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

- (void)fetchStateForPairedDeviceSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__93;
  v33 = __Block_byref_object_dispose__93;
  id v34 = 0;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  uint64_t v25 = &unk_1E53DC248;
  v28 = &v29;
  v26 = self;
  id v11 = v8;
  id v27 = v11;
  geo_isolate_sync_data();
  if (v30[5])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E53DBFB0;
    id v20 = (GEOMapSubscriptionStateRequest *)v10;
    BOOL v21 = &v29;
    dispatch_async(v9, block);
    id v12 = v20;
  }
  else
  {
    id v12 = [[GEOMapSubscriptionStateRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
    [(GEOMapSubscriptionStateRequest *)v12 setIdentifier:v11];
    [(GEOMapSubscriptionStateRequest *)v12 setFromPairedDevice:1];
    id v13 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3;
    v14[3] = &unk_1E53DF938;
    id v15 = v9;
    id v16 = self;
    id v17 = v11;
    id v18 = v10;
    [(GEOXPCRequest *)v12 send:v13 withReply:v15 handler:v14];
  }
  _Block_object_dispose(&v29, 8);
}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__93;
  id v12 = __Block_byref_object_dispose__93;
  id v13 = [v5 state];
  if (v9[5])
  {
    id v7 = *(id *)(a1 + 48);
    geo_isolate_sync_data();
    [*(id *)(a1 + 40) _startObservingStateForIdentifier:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(&v8, 8);
}

void __127__GEOMapDataSubscriptionRemoteSyncManager_fetchStateForPairedDeviceSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke_4(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];

  uint64_t v3 = *(void **)(a1[4] + 56);
  if (v2)
  {
    uint64_t v4 = [v3 objectForKey:a1[5]];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    if (!v3)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:517 capacity:5];
      uint64_t v8 = a1[4];
      uint64_t v9 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = v7;

      uint64_t v3 = *(void **)(a1[4] + 56);
    }
    uint64_t v10 = a1[5];
    uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
    [v3 setObject:v11 forKey:v10];
  }
}

- (void)fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[GEOMapSubscriptionGetPairedDeviceSubscriptionsToObserveRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v9 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __138__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53ED858;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:v9 withReply:v7 handler:v11];
}

void __138__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 serializedReply];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)handleSerializedPairedDeviceStateUpdate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateRequest *)v11 setSerializedState:v10];

  id v12 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __115__GEOMapDataSubscriptionRemoteSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53ED880;
  id v15 = v8;
  id v13 = v8;
  [(GEOXPCRequest *)v11 send:v12 withReply:v9 handler:v14];
}

uint64_t __115__GEOMapDataSubscriptionRemoteSyncManager_handleSerializedPairedDeviceStateUpdate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSerializedPairedDeviceSubscriptionsSummary:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionSetPairedDeviceSubscriptionsSummaryRequest *)v11 setSerializedSummary:v10];

  id v12 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __121__GEOMapDataSubscriptionRemoteSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53ED8A8;
  id v15 = v8;
  id v13 = v8;
  [(GEOXPCRequest *)v11 send:v12 withReply:v9 handler:v14];
}

uint64_t __121__GEOMapDataSubscriptionRemoteSyncManager_setSerializedPairedDeviceSubscriptionsSummary_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reconnectIfNecessary
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__93;
  id v17 = __Block_byref_object_dispose__93;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __64__GEOMapDataSubscriptionRemoteSyncManager__reconnectIfNecessary__block_invoke;
  id v10 = &unk_1E53D89C0;
  uint64_t v11 = self;
  id v12 = &v13;
  geo_isolate_sync_data();
  if ([(id)v14[5] count])
  {
    uint64_t v3 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[PairedDevice] geod has launched. Reconnecting to refresh paired device states", v6, 2u);
    }

    uint64_t v4 = [[GEOMapSubscriptionStateStartObservingRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
    [(GEOMapSubscriptionStateStartObservingRequest *)v4 setPairedDeviceIdentifiers:v14[5]];
    [(GEOMapSubscriptionStateStartObservingRequest *)v4 setSendInitialUpdate:1];
    id v5 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
    [(GEOXPCRequest *)v4 send:v5];
  }
  _Block_object_dispose(&v13, 8);
}

void __64__GEOMapDataSubscriptionRemoteSyncManager__reconnectIfNecessary__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) keyEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_startObservingStateForIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[GEOMapSubscriptionStateStartObservingRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [(GEOMapSubscriptionStateStartObservingRequest *)v5 setPairedDeviceIdentifiers:v6];
  [(GEOMapSubscriptionStateStartObservingRequest *)v5 setSendInitialUpdate:1];
  uint64_t v7 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  [(GEOXPCRequest *)v5 send:v7];
}

- (void)_stopObservingStateForIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[GEOMapSubscriptionStateStopObservingRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [(GEOMapSubscriptionStateStopObservingRequest *)v5 setPairedDeviceIdentifiers:v6];
  uint64_t v7 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  [(GEOXPCRequest *)v5 send:v7];
}

- (void)_receivedStateUpdate:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x18C1213B0]() != MEMORY[0x1E4F14590])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v9 = MEMORY[0x1E4F14500];
    id v10 = "Assertion failed: xpc_get_type(message) == (&_xpc_type_dictionary)";
LABEL_14:
    _os_log_fault_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, v10, buf, 2u);
    goto LABEL_7;
  }
  if (!xpc_dictionary_get_BOOL(v4, "paired_device"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v9 = MEMORY[0x1E4F14500];
    id v10 = "Assertion failed: xpc_dictionary_get_BOOL(message, \"paired_device\")";
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v4, "id");
  if (!string)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v9 = MEMORY[0x1E4F14500];
    id v10 = "Assertion failed: rawIdentifier != ((void *)0)";
    goto LABEL_14;
  }
  id v6 = (void *)[[NSString alloc] initWithUTF8String:string];
  if (v6)
  {
    uint64_t v7 = xpc_dictionary_get_dictionary(v4, "state");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke;
    block[3] = &unk_1E53D99F0;
    id v12 = v6;
    uint64_t v13 = self;
    id v14 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", buf, 2u);
  }

LABEL_7:
}

void __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOGetSubscriptionsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 141558275;
    *(void *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "[PairedDevice] Received state update for subscription '%{private, mask.hash}@'", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v8 = __Block_byref_object_copy__93;
  id v9 = __Block_byref_object_dispose__93;
  id v10 = 0;
  id v6 = a1[4];
  geo_isolate_sync_data();
  uint64_t v4 = *(void *)(*(void *)&buf[8] + 40);
  if (v4)
  {
    -[GEOMapDataSubscriptionState _updateWithXPCDictionary:](v4, a1[6]);
    id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 1);
    [WeakRetained syncManager:a1[5] didUpdatePairedDeviceState:*(void *)(*(void *)&buf[8] + 40) forIdentifier:a1[4]];
  }
  else
  {
    [a1[5] _stopObservingStateForIdentifier:a1[4]];
  }

  _Block_object_dispose(buf, 8);
}

void __64__GEOMapDataSubscriptionRemoteSyncManager__receivedStateUpdate___block_invoke_40(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  id v9 = [(GEOMapDataSubscriptionRemoteSyncManager *)self _connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __126__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke;
  v11[3] = &unk_1E53ED8D0;
  id v12 = v6;
  id v10 = v6;
  [(GEOXPCRequest *)v8 send:v9 withReply:v7 handler:v11];
}

void __126__GEOMapDataSubscriptionRemoteSyncManager_fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 serializedSummary];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (GEOMapDataSubscriptionSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionSyncManagerDelegate *)WeakRetained;
}

@end