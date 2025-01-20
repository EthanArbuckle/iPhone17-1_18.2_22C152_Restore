@interface GEOMapDataSubscriptionLocalPersistence
- (GEOMapDataSubscriptionLocalPersistence)init;
- (GEOMapDataSubscriptionLocalPersistence)initWithTileDB:(id)a3 offlineDataConfiguration:(id)a4;
- (GEOMapDataSubscriptionPersistenceDelegate)delegate;
- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11;
- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)protectedDataDidBecomeAvailable:(id)a3;
- (void)pruneShiftEntries;
- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)tileDB:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4;
@end

@implementation GEOMapDataSubscriptionLocalPersistence

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
}

- (GEOMapDataSubscriptionLocalPersistence)init
{
  result = (GEOMapDataSubscriptionLocalPersistence *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapDataSubscriptionLocalPersistence)initWithTileDB:(id)a3 offlineDataConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapDataSubscriptionLocalPersistence;
  v9 = [(GEOMapDataSubscriptionLocalPersistence *)&v17 init];
  if (v9)
  {
    uint64_t v10 = geo_isolater_create();
    isolation = v9->_isolation;
    v9->_isolation = (geo_isolater *)v10;

    objc_storeStrong((id *)&v9->_db, a3);
    db = v9->_db;
    global_queue = (void *)geo_get_global_queue();
    [(GEOTileDB *)db registerObserver:v9 queue:global_queue];

    objc_storeStrong((id *)&v9->_offlineDataConfiguration, a4);
    v14 = +[GEOKeyBagNotification sharedObject];
    [v14 addDataDidBecomeAvailableAfterFirstUnlockObserver:v9];

    v15 = v9;
  }

  return v9;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
  v3 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;

  notify_post(v3);
}

- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
  id v27 = a3;
  id v28 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = a10;
  id v21 = a11;
  if ((a5 & 0x400) != 0 && a6 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: !isNonUserInitiatedOfflineSubscription", (uint8_t *)&location, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v35 = v21;
    dispatch_async(v20, block);
  }
  else
  {
    objc_initWeak(&location, self);
    v22 = [GEOMapDataSubscription alloc];
    v23 = [v28 bundleId];
    v24 = [(GEOMapDataSubscription *)v22 initWithIdentifier:v27 originatingBundleIdentifier:v23 dataTypes:a5 policy:a6 expirationDate:v19 region:v17 displayName:v18];

    db = self->_db;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke_2;
    v29[3] = &unk_1E53F5E30;
    id v31 = v21;
    v26 = v24;
    v30 = v26;
    objc_copyWeak(&v32, &location);
    [(GEOTileDB *)db addSubscription:v26 queue:v20 callback:v29];
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
}

void __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"Non-user-initiated offline subscriptions are not supported"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __166__GEOMapDataSubscriptionLocalPersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v10 = 0x1ED5A1BB0;
    v11[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v4 postNotificationName:0x1ED5A1B70 object:0 userInfo:v6];

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained(WeakRetained + 2);
      [v9 subscriptionPersistence:v8 didAddSubscription:*(void *)(a1 + 32)];
    }
  }
}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__GEOMapDataSubscriptionLocalPersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E53F5E30;
  id v12 = v10;
  id v16 = v12;
  objc_copyWeak(&v17, &location);
  id v13 = v8;
  id v15 = v13;
  [(GEOTileDB *)db removeSubscriptionWithIdentifier:v13 queue:v9 callback:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __107__GEOMapDataSubscriptionLocalPersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, int a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained(WeakRetained + 2);
      [v6 subscriptionPersistence:v5 didRemoveSubscriptionWithIdentifier:*(void *)(a1 + 32)];
    }
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v10 = 0x1ED5A1BD0;
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:0x1ED5A1B90 object:0 userInfo:v9];

    notify_post(GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification);
    notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
  }
}

- (void)pruneShiftEntries
{
}

- (void)tileDB:(id)a3 didUpdateSubscriptionWithIdentifier:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained subscriptionPersistence:self didUpdateSubscriptionWithIdentifier:v6];
}

- (GEOMapDataSubscriptionPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionPersistenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end