@interface HFItemManagerBatchedDelegateAdapter
- (BOOL)hasUncommittedBatchingReasons;
- (HFCharacteristicReadPolicy)readPolicy;
- (HFItemManager)itemManager;
- (HFItemManagerBatchedDelegateAdapter)initWithItemManager:(id)a3 readPolicy:(id)a4;
- (NAFuture)finishExecutingBatchFuture;
- (NAFuture)startExecutingBatchFuture;
- (NSMutableSet)batchedItemProviderInvalidationReasons;
- (NSMutableSet)batchedItemsToUpdate;
- (NSMutableSet)uncommittedBatchingReasons;
- (SEL)batchedSenderSelector;
- (id)_itemProvidersToReloadForInvalidationReasons:(id)a3;
- (id)commitBatchWithReason:(id)a3 senderSelector:(SEL)a4;
- (id)requestUpdateForItems:(id)a3 itemProviderInvalidationReasons:(id)a4 modifiedHome:(id)a5 senderSelector:(SEL)a6;
- (void)_executeBatch;
- (void)_reset;
- (void)beginBatchWithReason:(id)a3;
- (void)setBatchedItemProviderInvalidationReasons:(id)a3;
- (void)setBatchedItemsToUpdate:(id)a3;
- (void)setBatchedSenderSelector:(SEL)a3;
- (void)setFinishExecutingBatchFuture:(id)a3;
- (void)setReadPolicy:(id)a3;
- (void)setStartExecutingBatchFuture:(id)a3;
- (void)setUncommittedBatchingReasons:(id)a3;
@end

@implementation HFItemManagerBatchedDelegateAdapter

uint64_t __84__HFItemManagerBatchedDelegateAdapter__itemProvidersToReloadForInvalidationReasons___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 invalidationReasons];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (id)requestUpdateForItems:(id)a3 itemProviderInvalidationReasons:(id)a4 modifiedHome:(id)a5 senderSelector:(SEL)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 count] && !objc_msgSend(v11, "count"))
  {
LABEL_16:
    v20 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_17;
  }
  v13 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
  v14 = [v13 home];

  if (!v14)
  {
    v28 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a6);
      v30 = (HFItemManagerBatchedDelegateAdapter *)objc_claimAutoreleasedReturnValue();
      int v36 = 138412290;
      v37 = v30;
      _os_log_error_impl(&dword_20B986000, v28, OS_LOG_TYPE_ERROR, "Request to update for %@, but no home set", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_16;
  }
  if (v12)
  {
    v15 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
    id v16 = [v15 home];

    if (v16 != v12)
    {
      v17 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v31 = NSStringFromSelector(a6);
        v32 = objc_msgSend(v12, "hf_prettyDescription");
        v33 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
        v34 = [v33 home];
        v35 = objc_msgSend(v34, "hf_prettyDescription");
        int v36 = 138413314;
        v37 = self;
        __int16 v38 = 2112;
        v39 = v31;
        __int16 v40 = 2112;
        v41 = v32;
        __int16 v42 = 2112;
        v43 = v35;
        __int16 v44 = 2112;
        id v45 = v10;
        _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "Request %@ to update for %@, but home does not match. modifiedHome: %@ itemManager.home: %@. itemsToUpdate: %@", (uint8_t *)&v36, 0x34u);
      }
      goto LABEL_16;
    }
  }
  v18 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemsToUpdate];
  [v18 unionSet:v10];

  v19 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemProviderInvalidationReasons];
  [v19 addObjectsFromArray:v11];

  [(HFItemManagerBatchedDelegateAdapter *)self setBatchedSenderSelector:a6];
  v20 = [(HFItemManagerBatchedDelegateAdapter *)self finishExecutingBatchFuture];
  v21 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a6);
      v24 = (HFItemManagerBatchedDelegateAdapter *)objc_claimAutoreleasedReturnValue();
      v25 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
      v26 = [v25 allObjects];
      v27 = [v26 componentsJoinedByString:@","];
      int v36 = 138412546;
      v37 = v24;
      __int16 v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "Deferring update for: %@ because there are uncommitted delegate batching reasons: %@", (uint8_t *)&v36, 0x16u);
    }
  }
  else
  {
    [(HFItemManagerBatchedDelegateAdapter *)self _executeBatch];
  }
LABEL_17:

  return v20;
}

- (void)beginBatchWithReason:(id)a3
{
  id v5 = a3;
  v6 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    v8 = [(HFItemManagerBatchedDelegateAdapter *)self startExecutingBatchFuture];
    objc_initWeak(&location, self);
    v9 = [MEMORY[0x263F581B8] mainThreadScheduler];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __60__HFItemManagerBatchedDelegateAdapter_beginBatchWithReason___block_invoke;
    id v16 = &unk_26408DB60;
    objc_copyWeak(v18, &location);
    id v10 = v8;
    id v17 = v10;
    v18[1] = (id)a2;
    id v11 = (id)[v9 afterDelay:&v13 performBlock:15.0];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  id v12 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  [v12 addObject:v5];
}

- (id)commitBatchWithReason:(id)a3 senderSelector:(SEL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  char v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0)
  {
    v9 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Requested to commit a HFItemManagerBatchedDelegateAdapter batch with a reason that wasn't in flight: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v10 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  [v10 removeObject:v6];

  id v11 = [(HFItemManagerBatchedDelegateAdapter *)self finishExecutingBatchFuture];
  id v12 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    [(HFItemManagerBatchedDelegateAdapter *)self setBatchedSenderSelector:a4];
    [(HFItemManagerBatchedDelegateAdapter *)self _executeBatch];
  }

  return v11;
}

- (NSMutableSet)uncommittedBatchingReasons
{
  return self->_uncommittedBatchingReasons;
}

- (void)_executeBatch
{
  v21[2] = *MEMORY[0x263EF8340];
  v3 = [(HFItemManagerBatchedDelegateAdapter *)self startExecutingBatchFuture];
  uint64_t v4 = NAEmptyResult();
  [v3 finishWithResult:v4];

  id v5 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemsToUpdate];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemProviderInvalidationReasons];
  char v8 = (void *)[v7 copy];

  v9 = [(HFItemManagerBatchedDelegateAdapter *)self batchedSenderSelector];
  id v10 = [(HFItemManagerBatchedDelegateAdapter *)self finishExecutingBatchFuture];
  [(HFItemManagerBatchedDelegateAdapter *)self _reset];
  id v11 = [(HFItemManagerBatchedDelegateAdapter *)self _itemProvidersToReloadForInvalidationReasons:v8];
  if ([v11 count])
  {
    id v12 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
    uint64_t v13 = [(HFItemManagerBatchedDelegateAdapter *)self readPolicy];
    uint64_t v14 = [v12 _reloadItemProviders:v11 updateItems:v6 shouldUpdateExistingItems:0 senderSelector:v9 readPolicy:v13];
  }
  else
  {
    if (![v6 count])
    {
      [v10 finishWithNoResult];
      goto LABEL_6;
    }
    id v12 = objc_opt_new();
    [v12 setSenderSelector:v9];
    int v15 = [(HFItemManagerBatchedDelegateAdapter *)self readPolicy];
    [v12 setReadPolicy:v15];

    v20[0] = HFItemUpdateOptionFullUpdateIndicated;
    v20[1] = HFItemUpdateOptionDelegateDispatched;
    v21[0] = MEMORY[0x263EFFA88];
    v21[1] = MEMORY[0x263EFFA88];
    id v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    [v12 setUpdateOptions:v16];

    uint64_t v13 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
    uint64_t v14 = [v13 _updateResultsForItems:v6 context:v12];
  }
  uint64_t v17 = (void *)v14;
  v18 = [v10 completionHandlerAdapter];
  id v19 = (id)[v17 addCompletionBlock:v18];

LABEL_6:
}

- (NAFuture)finishExecutingBatchFuture
{
  return self->_finishExecutingBatchFuture;
}

- (NAFuture)startExecutingBatchFuture
{
  return self->_startExecutingBatchFuture;
}

- (SEL)batchedSenderSelector
{
  if (self->_batchedSenderSelector) {
    return self->_batchedSenderSelector;
  }
  else {
    return 0;
  }
}

- (void)_reset
{
  v3 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemsToUpdate];
  [v3 removeAllObjects];

  uint64_t v4 = [(HFItemManagerBatchedDelegateAdapter *)self batchedItemProviderInvalidationReasons];
  [v4 removeAllObjects];

  [(HFItemManagerBatchedDelegateAdapter *)self setBatchedSenderSelector:0];
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  [(HFItemManagerBatchedDelegateAdapter *)self setStartExecutingBatchFuture:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F58190]);
  [(HFItemManagerBatchedDelegateAdapter *)self setFinishExecutingBatchFuture:v6];
}

- (NSMutableSet)batchedItemsToUpdate
{
  return self->_batchedItemsToUpdate;
}

- (NSMutableSet)batchedItemProviderInvalidationReasons
{
  return self->_batchedItemProviderInvalidationReasons;
}

- (void)setBatchedSenderSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_batchedSenderSelector = v3;
}

- (void)setStartExecutingBatchFuture:(id)a3
{
}

- (void)setFinishExecutingBatchFuture:(id)a3
{
}

- (id)_itemProvidersToReloadForInvalidationReasons:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemManagerBatchedDelegateAdapter *)self itemManager];
  id v6 = [v5 itemProviders];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__HFItemManagerBatchedDelegateAdapter__itemProvidersToReloadForInvalidationReasons___block_invoke;
  v10[3] = &unk_264090A00;
  id v11 = v4;
  id v7 = v4;
  char v8 = objc_msgSend(v6, "na_filter:", v10);

  return v8;
}

- (HFItemManager)itemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemManager);
  return (HFItemManager *)WeakRetained;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (HFItemManagerBatchedDelegateAdapter)initWithItemManager:(id)a3 readPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HFItemManagerBatchedDelegateAdapter;
  char v8 = [(HFItemManagerBatchedDelegateAdapter *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_itemManager, v6);
    objc_storeStrong((id *)&v9->_readPolicy, a4);
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    uncommittedBatchingReasons = v9->_uncommittedBatchingReasons;
    v9->_uncommittedBatchingReasons = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    batchedItemsToUpdate = v9->_batchedItemsToUpdate;
    v9->_batchedItemsToUpdate = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    batchedItemProviderInvalidationReasons = v9->_batchedItemProviderInvalidationReasons;
    v9->_batchedItemProviderInvalidationReasons = (NSMutableSet *)v14;

    id v16 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    startExecutingBatchFuture = v9->_startExecutingBatchFuture;
    v9->_startExecutingBatchFuture = v16;

    v18 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    finishExecutingBatchFuture = v9->_finishExecutingBatchFuture;
    v9->_finishExecutingBatchFuture = v18;
  }
  return v9;
}

void __60__HFItemManagerBatchedDelegateAdapter_beginBatchWithReason___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && ([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v3 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [WeakRetained uncommittedBatchingReasons];
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_INFO, "Waited 15s to start executing a batch delegate operation, but it never committed. Will recover by forcibly committing batch. Remaining uncommittedBatchingReasons: %@", buf, 0xCu);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(WeakRetained, "uncommittedBatchingReasons", 0);
    id v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (id)[WeakRetained commitBatchWithReason:*(void *)(*((void *)&v12 + 1) + 8 * v10++) senderSelector:*(void *)(a1 + 48)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)hasUncommittedBatchingReasons
{
  v2 = [(HFItemManagerBatchedDelegateAdapter *)self uncommittedBatchingReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setReadPolicy:(id)a3
{
}

- (void)setUncommittedBatchingReasons:(id)a3
{
}

- (void)setBatchedItemsToUpdate:(id)a3
{
}

- (void)setBatchedItemProviderInvalidationReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishExecutingBatchFuture, 0);
  objc_storeStrong((id *)&self->_startExecutingBatchFuture, 0);
  objc_storeStrong((id *)&self->_batchedItemProviderInvalidationReasons, 0);
  objc_storeStrong((id *)&self->_batchedItemsToUpdate, 0);
  objc_storeStrong((id *)&self->_uncommittedBatchingReasons, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_destroyWeak((id *)&self->_itemManager);
}

@end