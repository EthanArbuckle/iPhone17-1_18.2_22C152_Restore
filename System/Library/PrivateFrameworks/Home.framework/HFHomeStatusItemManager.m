@interface HFHomeStatusItemManager
- (BOOL)_requiresNotificationsForCharacteristic:(id)a3;
- (BOOL)shouldPerformInitialLoadOnMainThread;
- (HFHomeStatusItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HFHomeStatusItemManager)initWithRoom:(id)a3 delegate:(id)a4;
- (HFStatusItemProvider)statusItemProvider;
- (HMRoom)room;
- (NSTimer)invalidationTimer;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)matchingItemForHomeKitObject:(id)a3;
- (id)statusItems;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_invalidateItemsIfNecessary;
- (void)_updateInvalidationTimer;
- (void)setInvalidationTimer:(id)a3;
- (void)setRoom:(id)a3;
- (void)setStatusItemProvider:(id)a3;
- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4;
@end

@implementation HFHomeStatusItemManager

- (HFHomeStatusItemManager)initWithRoom:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeStatusItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a4 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_room, a3);
  }

  return v9;
}

- (HFHomeStatusItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithRoom_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomeStatusItemManager.m", 40, @"%s is unavailable; use %@ instead",
    "-[HFHomeStatusItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithBool:v4];
    int v9 = 138412802;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@ Asked to update needsInvalidation: %@ for status item: %@", (uint8_t *)&v9, 0x20u);
  }
  [v6 setNeedsInvalidation:v4];
  [(HFHomeStatusItemManager *)self _updateInvalidationTimer];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [HFStatusItemProvider alloc];
  id v6 = [(HFHomeStatusItemManager *)self room];
  id v7 = [(HFStatusItemProvider *)v5 initWithHome:v4 room:v6];

  [(HFHomeStatusItemManager *)self setStatusItemProvider:v7];
  v8 = [(HFHomeStatusItemManager *)self statusItemProvider];
  v11[0] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return +[HFStatusItemProvider statusItemComparator];
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = [(HFItemManager *)self allItems];
  v17.receiver = self;
  v17.super_class = (Class)HFHomeStatusItemManager;
  v5 = [(HFItemManager *)&v17 _itemsToHideInSet:v4];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(HFItemManager *)self allItems];
  v8 = objc_msgSend(v7, "na_setByRemovingObjectsFromSet:", v6);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke;
  v14[3] = &unk_2640950D0;
  id v9 = v6;
  id v15 = v9;
  v16 = v8;
  id v10 = v8;
  objc_msgSend(v10, "na_each:", v14);
  __int16 v11 = v16;
  id v12 = v9;

  return v12;
}

void __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke_2;
    v7[3] = &unk_26408EC60;
    id v8 = v3;
    id v6 = objc_msgSend(v4, "na_filter:", v7);
    [v5 unionSet:v6];
  }
}

uint64_t __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldEncapsulateItem:a2];
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HFHomeStatusItemManager;
  [(HFItemManager *)&v4 _didFinishUpdateTransactionWithAffectedItems:a3];
  [(HFHomeStatusItemManager *)self _updateInvalidationTimer];
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  return 1;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  v5 = [(HFItemManager *)self allItems];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke;
  v12[3] = &unk_26408EC60;
  id v6 = v4;
  id v13 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v12);

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HFHomeStatusItemManager;
    id v8 = [(HFItemManager *)&v11 matchingItemForHomeKitObject:v6];
  }
  id v9 = v8;

  return v9;
}

uint64_t __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"representedHomeKitObjects"];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke_2;
  v7[3] = &unk_264091DC0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqual:v3] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v5 = [v3 accessory];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v5 = objc_msgSend(v3, "hf_linkedAccessory");
    }
    id v6 = (void *)v5;
    if (v5)
    {
      uint64_t v4 = [*(id *)(a1 + 32) isEqual:v5];

      goto LABEL_11;
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 1;
LABEL_11:

  return v4;
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 1;
}

- (id)statusItems
{
  v2 = [(HFItemManager *)self allItems];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_163);

  return v3;
}

uint64_t __38__HFHomeStatusItemManager_statusItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateInvalidationTimer
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HFHomeStatusItemManager *)self statusItems];
  uint64_t v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_25_11);
  uint64_t v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_28_3];

  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    id v8 = [v7 invalidationDate];

    id v9 = [(HFHomeStatusItemManager *)self invalidationTimer];
    if (v9
      && ([(HFHomeStatusItemManager *)self invalidationTimer],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isValid],
          v10,
          v9,
          v11))
    {
      id v12 = [(HFHomeStatusItemManager *)self invalidationTimer];
      id v13 = [v12 fireDate];
      char v14 = [v13 isEqualToDate:v8];

      if ((v14 & 1) == 0)
      {
        id v15 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = self;
          __int16 v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@ Updating item invalidation timer to fire at date: %@", buf, 0x16u);
        }

        v16 = [(HFHomeStatusItemManager *)self invalidationTimer];
        [v16 setFireDate:v8];
      }
    }
    else
    {
      objc_super v17 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = self;
        __int16 v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@ Scheduling item invalidation timer to fire at date: %@", buf, 0x16u);
      }

      [v8 timeIntervalSinceNow];
      double v19 = v18;
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x263EFFA20];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_30;
      v25[3] = &unk_264093C20;
      objc_copyWeak(&v26, (id *)buf);
      v21 = [v20 scheduledTimerWithTimeInterval:0 repeats:v25 block:v19];
      [(HFHomeStatusItemManager *)self setInvalidationTimer:v21];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v22 = [(HFHomeStatusItemManager *)self invalidationTimer];

    if (v22)
    {
      v23 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = self;
        _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "%@ Clearing item invalidation timer due to reason: No items pending invalidation.", buf, 0xCu);
      }

      v24 = [(HFHomeStatusItemManager *)self invalidationTimer];
      [v24 invalidate];

      [(HFHomeStatusItemManager *)self setInvalidationTimer:0];
    }
  }
}

BOOL __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isInvalidationPending])
  {
    id v3 = [v2 invalidationDate];
    if (v3)
    {
    }
    else if ([v2 canScheduleInvalidation])
    {
      [v2 scheduleInvalidation];
    }
    uint64_t v5 = [v2 latestResults];
    id v6 = [v5 objectForKeyedSubscript:@"state"];
    uint64_t v7 = [v6 integerValue];

    id v8 = [v2 latestResults];
    id v9 = [v8 objectForKeyedSubscript:@"transitioningState"];
    uint64_t v10 = [v9 integerValue];

    int v11 = [v2 invalidationDate];
    if (v11)
    {

      if (v7 == 2 || v10 == 2) {
        [v2 setNeedsInvalidation:0];
      }
    }
    id v12 = [v2 invalidationDate];
    BOOL v4 = v12 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 invalidationDate];
  id v6 = [v4 invalidationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInvalidationTimer:0];
  [WeakRetained _invalidateItemsIfNecessary];
  [WeakRetained _updateInvalidationTimer];
}

- (void)_invalidateItemsIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(HFHomeStatusItemManager *)self statusItems];
  uint64_t v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_33_4);

  objc_msgSend(v5, "na_each:", &__block_literal_global_37_4);
  id v6 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    int v11 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@ Invalidating status items: %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(HFItemManager *)self updateResultsForItems:v5 senderSelector:a2];
}

BOOL __54__HFHomeStatusItemManager__invalidateItemsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsInvalidation])
  {
    id v3 = [v2 invalidationDate];
    if (v3)
    {
      id v4 = [v2 invalidationDate];
      uint64_t v5 = [MEMORY[0x263EFF910] date];
      BOOL v6 = [v4 compare:v5] != 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __54__HFHomeStatusItemManager__invalidateItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setNeedsInvalidation:0];
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setRoom:(id)a3
{
}

- (HFStatusItemProvider)statusItemProvider
{
  return self->_statusItemProvider;
}

- (void)setStatusItemProvider:(id)a3
{
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_statusItemProvider, 0);
  objc_storeStrong((id *)&self->_room, 0);
}

@end