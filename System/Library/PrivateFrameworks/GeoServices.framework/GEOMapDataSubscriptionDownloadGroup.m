@interface GEOMapDataSubscriptionDownloadGroup
- (BGSystemTask)backgroundTask;
- (GEOApplicationAuditToken)auditToken;
- (GEOMapDataSubscriptionDownloadGroup)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 auditToken:(id)a5 backgroundTask:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (GEOMapDataSubscriptionDownloadGroupDelegate)delegate;
- (NSArray)completedSubscriptions;
- (NSArray)remainingSubscriptions;
- (NSArray)subscriptions;
- (unint64_t)downloadMode;
- (void)finishedDownloadingSubscription:(id)a3 withError:(id)a4;
- (void)removeSubscriptionWithIdentifier:(id)a3;
- (void)restartedSubscriptions:(id)a3;
@end

@implementation GEOMapDataSubscriptionDownloadGroup

- (GEOMapDataSubscriptionDownloadGroup)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 auditToken:(id)a5 backgroundTask:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v35.receiver = self;
  v35.super_class = (Class)GEOMapDataSubscriptionDownloadGroup;
  v19 = [(GEOMapDataSubscriptionDownloadGroup *)&v35 init];
  if (v19)
  {
    uint64_t v20 = geo_isolater_create();
    isolation = v19->_isolation;
    v19->_isolation = (geo_isolater *)v20;

    uint64_t v22 = [v14 copy];
    subscriptions = v19->_subscriptions;
    v19->_subscriptions = (NSArray *)v22;

    uint64_t v24 = [v14 mutableCopy];
    remainingSubscriptions = v19->_remainingSubscriptions;
    v19->_remainingSubscriptions = (NSMutableArray *)v24;

    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    completedSubscriptions = v19->_completedSubscriptions;
    v19->_completedSubscriptions = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    failedSubscriptions = v19->_failedSubscriptions;
    v19->_failedSubscriptions = (NSMutableArray *)v28;

    v19->_downloadMode = a4;
    objc_storeStrong((id *)&v19->_auditToken, a5);
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_delegateQueue, a8);
    objc_storeStrong((id *)&v19->_backgroundTask, a6);
    if (v19->_backgroundTask)
    {
      objc_initWeak(&location, v19);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __123__GEOMapDataSubscriptionDownloadGroup_initWithSubscriptions_downloadMode_auditToken_backgroundTask_delegate_delegateQueue___block_invoke;
      v32[3] = &unk_1E53D7B90;
      objc_copyWeak(&v33, &location);
      [(BGSystemTask *)v19->_backgroundTask setExpirationHandler:v32];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    v30 = v19;
  }

  return v19;
}

void __123__GEOMapDataSubscriptionDownloadGroup_initWithSubscriptions_downloadMode_auditToken_backgroundTask_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (WeakRetained[5])
    {
      v3 = WeakRetained[7];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__GEOMapDataSubscriptionDownloadGroup__backgroundTaskNeedsDeferral__block_invoke;
      block[3] = &unk_1E53D79D8;
      block[4] = v2;
      dispatch_async(v3, block);
LABEL_4:
      v2 = v5;
      goto LABEL_5;
    }
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    v2 = v5;
    if (v4)
    {
      LOWORD(block[0]) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _backgroundTask != ((void *)0)", (uint8_t *)block, 2u);
      goto LABEL_4;
    }
  }
LABEL_5:
}

void __67__GEOMapDataSubscriptionDownloadGroup__backgroundTaskNeedsDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained subscriptionDownloadGroupDidDefer:*(void *)(a1 + 32)];
}

- (NSArray)remainingSubscriptions
{
  v5 = self->_isolation;
  _geo_isolate_lock_data();
  v3 = (void *)[(NSMutableArray *)self->_remainingSubscriptions copy];
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (NSArray)completedSubscriptions
{
  v5 = self->_isolation;
  _geo_isolate_lock_data();
  v3 = (void *)[(NSMutableArray *)self->_completedSubscriptions copy];
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (void)removeSubscriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v14 = self->_isolation;
  _geo_isolate_lock_data();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __72__GEOMapDataSubscriptionDownloadGroup_removeSubscriptionWithIdentifier___block_invoke;
  v12 = &unk_1E53D96D0;
  id v5 = v4;
  id v13 = v5;
  v6 = (void *)MEMORY[0x18C120660](&v9);
  -[NSArray _geo_filtered:](self->_subscriptions, "_geo_filtered:", v6, v9, v10, v11, v12);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subscriptions = self->_subscriptions;
  self->_subscriptions = v7;

  [(NSMutableArray *)self->_remainingSubscriptions _geo_filter:v6];
  [(NSMutableArray *)self->_completedSubscriptions _geo_filter:v6];
  [(NSMutableArray *)self->_failedSubscriptions _geo_filter:v6];

  _geo_isolate_unlock();
}

uint64_t __72__GEOMapDataSubscriptionDownloadGroup_removeSubscriptionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)finishedDownloadingSubscription:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = self->_isolation;
  _geo_isolate_lock_data();
  if ([(NSMutableArray *)self->_remainingSubscriptions containsObject:v6])
  {
    [(NSMutableArray *)self->_remainingSubscriptions removeObject:v6];
    if (v7)
    {
      failedSubscriptions = self->_failedSubscriptions;
      p_failedSubscriptions = &self->_failedSubscriptions;
      if (![(NSMutableArray *)failedSubscriptions containsObject:v6]
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        goto LABEL_7;
      }
      __int16 v15 = 0;
      uint64_t v10 = MEMORY[0x1E4F14500];
      v11 = "Assertion failed: ![_failedSubscriptions containsObject:subscription]";
      v12 = (uint8_t *)&v15;
    }
    else
    {
      completedSubscriptions = self->_completedSubscriptions;
      p_failedSubscriptions = &self->_completedSubscriptions;
      if (![(NSMutableArray *)completedSubscriptions containsObject:v6]
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        goto LABEL_7;
      }
      LOWORD(v14) = 0;
      uint64_t v10 = MEMORY[0x1E4F14500];
      v11 = "Assertion failed: ![_completedSubscriptions containsObject:subscription]";
      v12 = (uint8_t *)&v14;
    }
    _os_log_fault_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, v11, v12, 2u);
LABEL_7:
    -[NSMutableArray addObject:](*p_failedSubscriptions, "addObject:", v6, v14);
  }
  _geo_isolate_unlock();
}

- (void)restartedSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = self->_isolation;
  _geo_isolate_lock_data();
  [(NSMutableArray *)self->_completedSubscriptions removeObjectsInArray:v4];
  [(NSMutableArray *)self->_remainingSubscriptions addObjectsFromArray:v4];
  _geo_isolate_unlock();
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (unint64_t)downloadMode
{
  return self->_downloadMode;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOMapDataSubscriptionDownloadGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDownloadGroupDelegate *)WeakRetained;
}

- (BGSystemTask)backgroundTask
{
  return self->_backgroundTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSubscriptions, 0);
  objc_storeStrong((id *)&self->_completedSubscriptions, 0);
  objc_storeStrong((id *)&self->_remainingSubscriptions, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundTask, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end