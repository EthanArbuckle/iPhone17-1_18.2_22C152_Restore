@interface GEOMapDataSubscriptionRemotePersistence
- (GEOMapDataSubscriptionPersistenceDelegate)delegate;
- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11;
- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)pruneShiftEntries;
- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation GEOMapDataSubscriptionRemotePersistence

- (void).cxx_destruct
{
}

- (void)calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[GEOMapSubscriptionTotalOfflineDataSizeRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__GEOMapDataSubscriptionRemotePersistence_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue_completionHandler___block_invoke;
  v9[3] = &unk_1E53E3098;
  id v10 = v5;
  id v8 = v5;
  [(GEOXPCRequest *)v7 send:0 withReply:v6 handler:v9];
}

- (void)fetchExpiredSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[GEOMapSubscriptionsFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionsFetchRequest *)v10 setIdentifiersFilter:v9];

  [(GEOMapSubscriptionsFetchRequest *)v10 setFetchExpired:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __116__GEOMapDataSubscriptionRemotePersistence_fetchExpiredSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E53E3020;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(GEOXPCRequest *)v10 send:0 withReply:v12 handler:v13];
}

- (void)fetchSubscriptionsWithIdentifiers:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[GEOMapSubscriptionsFetchRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionsFetchRequest *)v10 setIdentifiersFilter:v9];

  [(GEOMapSubscriptionsFetchRequest *)v10 setFetchExpired:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__GEOMapDataSubscriptionRemotePersistence_fetchSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E53E3020;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(GEOXPCRequest *)v10 send:0 withReply:v12 handler:v13];
}

- (void)setDelegate:(id)a3
{
}

void __109__GEOMapDataSubscriptionRemotePersistence_fetchSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a3;
  id v6 = [a2 subscriptions];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __116__GEOMapDataSubscriptionRemotePersistence_fetchExpiredSubscriptionsWithIdentifiers_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a3;
  id v6 = [a2 subscriptions];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __119__GEOMapDataSubscriptionRemotePersistence_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 sizeInBytes], v5);
}

- (void)addSubscriptionWithIdentifier:(id)a3 auditToken:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 region:(id)a7 displayName:(id)a8 expirationDate:(id)a9 callbackQueue:(id)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v23 = [[GEOMapSubscriptionAddRequest alloc] initWithTraits:0 auditToken:v17 throttleToken:0];
  [(GEOMapSubscriptionAddRequest *)v23 setIdentifier:v16];
  [(GEOMapSubscriptionAddRequest *)v23 setDataTypes:a5];
  [(GEOMapSubscriptionAddRequest *)v23 setPolicy:a6];
  [(GEOMapSubscriptionAddRequest *)v23 setRegion:v18];
  [(GEOMapSubscriptionAddRequest *)v23 setDisplayName:v19];
  [(GEOMapSubscriptionAddRequest *)v23 setExpirationDate:v20];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __167__GEOMapDataSubscriptionRemotePersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke;
  v27[3] = &unk_1E53E3048;
  id v24 = v21;
  id v28 = v24;
  id v25 = v22;
  id v30 = v25;
  objc_copyWeak(&v31, &location);
  v29 = self;
  [(GEOXPCRequest *)v23 send:0 withReply:v24 handler:v27];
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
}

void __167__GEOMapDataSubscriptionRemotePersistence_addSubscriptionWithIdentifier_auditToken_dataTypes_policy_region_displayName_expirationDate_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a3;
  id v7 = [v14 subscription];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  id v8 = [v14 subscription];

  if (v8)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    id v10 = WeakRetained;
    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained(WeakRetained + 1);
      uint64_t v12 = *(void *)(a1 + 40);
      v13 = [v14 subscription];
      [v11 subscriptionPersistence:v12 didAddSubscription:v13];
    }
  }
}

- (void)removeSubscriptionWithIdentifier:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[GEOMapSubscriptionRemoveRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOMapSubscriptionRemoveRequest *)v10 setIdentifier:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__GEOMapDataSubscriptionRemotePersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_1E53E3070;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(GEOXPCRequest *)v10 send:0 withReply:v12 handler:v13];
}

uint64_t __108__GEOMapDataSubscriptionRemotePersistence_removeSubscriptionWithIdentifier_callbackQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 != 0);
}

- (void)pruneShiftEntries
{
  v2 = [[GEOLocationShiftingPruneCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOXPCRequest *)v2 send:0];
}

- (GEOMapDataSubscriptionPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionPersistenceDelegate *)WeakRetained;
}

@end