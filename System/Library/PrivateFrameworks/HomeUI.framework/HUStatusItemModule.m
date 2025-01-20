@interface HUStatusItemModule
- (HFItem)placeholderItem;
- (HFStatusItemProvider)statusItemProvider;
- (HUDashboardContext)context;
- (HUStatusItemModule)initWithContext:(id)a3 itemUpdater:(id)a4;
- (NSTimer)invalidationTimer;
- (id)_itemsToHideInSet:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)statusItems;
- (void)_invalidateItemsIfNecessary;
- (void)_updateInvalidationTimer;
- (void)setContext:(id)a3;
- (void)setInvalidationTimer:(id)a3;
- (void)setPlaceholderItem:(id)a3;
- (void)setStatusItemProvider:(id)a3;
- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4;
@end

@implementation HUStatusItemModule

- (void)_updateInvalidationTimer
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(HUStatusItemModule *)self statusItems];
  v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_92_1);
  v5 = [v4 allObjects];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_95_2];

  if ([v6 count])
  {
    v7 = [v6 firstObject];
    v8 = [v7 invalidationDate];

    v9 = [(HUStatusItemModule *)self invalidationTimer];
    if (v9
      && ([(HUStatusItemModule *)self invalidationTimer],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isValid],
          v10,
          v9,
          v11))
    {
      v12 = [(HUStatusItemModule *)self invalidationTimer];
      v13 = [v12 fireDate];
      char v14 = [v13 isEqualToDate:v8];

      if ((v14 & 1) == 0)
      {
        v15 = HFLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = self;
          __int16 v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@ Updating item invalidation timer to fire at date: %@", buf, 0x16u);
        }

        v16 = [(HUStatusItemModule *)self invalidationTimer];
        [v16 setFireDate:v8];
      }
    }
    else
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = self;
        __int16 v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@ Scheduling item invalidation timer to fire at date: %@", buf, 0x16u);
      }

      [v8 timeIntervalSinceNow];
      double v19 = v18;
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x1E4F1CB00];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_97;
      v25[3] = &unk_1E6389EE0;
      objc_copyWeak(&v26, (id *)buf);
      v21 = [v20 scheduledTimerWithTimeInterval:0 repeats:v25 block:v19];
      [(HUStatusItemModule *)self setInvalidationTimer:v21];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v22 = [(HUStatusItemModule *)self invalidationTimer];

    if (v22)
    {
      v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = self;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@ Clearing item invalidation timer due to reason: No items pending invalidation.", buf, 0xCu);
      }

      v24 = [(HUStatusItemModule *)self invalidationTimer];
      [v24 invalidate];

      [(HUStatusItemModule *)self setInvalidationTimer:0];
    }
  }
}

- (id)statusItems
{
  v2 = [(HFItemModule *)self allItems];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_271);

  return v3;
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

uint64_t __33__HUStatusItemModule_statusItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __40__HUStatusItemModule__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__HUStatusItemModule__itemsToHideInSet___block_invoke_2;
    v7[3] = &unk_1E6386108;
    id v8 = v3;
    v6 = objc_msgSend(v4, "na_filter:", v7);
    [v5 unionSet:v6];
  }
}

- (id)_itemsToHideInSet:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  v5 = [(HFItemModule *)self allItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__HUStatusItemModule__itemsToHideInSet___block_invoke;
  v11[3] = &unk_1E6389D10;
  id v6 = v4;
  id v12 = v6;
  v13 = v5;
  id v7 = v5;
  objc_msgSend(v7, "na_each:", v11);
  id v8 = v13;
  id v9 = v6;

  return v9;
}

BOOL __46__HUStatusItemModule__updateInvalidationTimer__block_invoke(uint64_t a1, void *a2)
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
    v5 = [v2 latestResults];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    uint64_t v7 = [v6 integerValue];

    id v8 = [v2 latestResults];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68C20]];
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

- (id)buildItemProviders
{
  v26[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUStatusItemModule_buildItemProviders__block_invoke;
  aBlock[3] = &unk_1E638CF88;
  objc_copyWeak(&v23, &location);
  id v3 = _Block_copy(aBlock);
  id v4 = objc_alloc(MEMORY[0x1E4F695E8]);
  v5 = [(HUStatusItemModule *)self context];
  id v6 = [v5 home];
  uint64_t v7 = [(HUStatusItemModule *)self context];
  id v8 = [v7 room];
  id v9 = (void *)[v4 initWithHome:v6 room:v8 filter:v3];
  [(HUStatusItemModule *)self setStatusItemProvider:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v25 = *MEMORY[0x1E4F68A08];
  v26[0] = MEMORY[0x1E4F1CC38];
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v12 = (void *)[v10 initWithResults:v11];
  [(HUStatusItemModule *)self setPlaceholderItem:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
  char v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [(HUStatusItemModule *)self placeholderItem];
  v16 = [v14 setWithObject:v15];
  v17 = (void *)[v13 initWithItems:v16];

  double v18 = (void *)MEMORY[0x1E4F1CAD0];
  double v19 = [(HUStatusItemModule *)self statusItemProvider];
  v20 = objc_msgSend(v18, "setWithObjects:", v19, v17, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v20;
}

uint64_t __40__HUStatusItemModule_buildItemProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained context];
  uint64_t v5 = [v4 shouldHideStatusItemClass:a2] ^ 1;

  return v5;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (HFStatusItemProvider)statusItemProvider
{
  return self->_statusItemProvider;
}

- (void)setStatusItemProvider:(id)a3
{
}

- (void)setPlaceholderItem:(id)a3
{
}

- (HFItem)placeholderItem
{
  return self->_placeholderItem;
}

- (HUStatusItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUStatusItemModule;
  id v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a3);
  }

  return v9;
}

uint64_t __40__HUStatusItemModule__itemsToHideInSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldEncapsulateItem:a2];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUStatusItemModule *)self statusItemProvider];
  id v6 = [v5 items];
  id v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"statusSection"];
  id v9 = [v7 allObjects];
  id v10 = [MEMORY[0x1E4F695E8] statusItemComparator];
  objc_super v11 = [v9 sortedArrayUsingComparator:v10];
  [v8 setItems:v11];

  id v12 = [v8 items];
  if ([v12 count])
  {
  }
  else
  {
    id v13 = [(HUStatusItemModule *)self statusItemProvider];
    char v14 = [v13 items];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = [(HUStatusItemModule *)self placeholderItem];
      v23[0] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v8 setItems:v17];
    }
  }
  double v18 = (void *)MEMORY[0x1E4F69220];
  v22 = v8;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v20 = [v18 filterSections:v19 toDisplayedItems:v4];

  return v20;
}

- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:v4];
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@ Asked to update needsInvalidation: %@ for status item: %@", (uint8_t *)&v9, 0x20u);
  }
  [v6 setNeedsInvalidation:v4];
  [(HUStatusItemModule *)self _updateInvalidationTimer];
}

uint64_t __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 invalidationDate];
  id v6 = [v4 invalidationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_97(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInvalidationTimer:0];
  [WeakRetained _invalidateItemsIfNecessary];
  [WeakRetained _updateInvalidationTimer];
}

- (void)_invalidateItemsIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUStatusItemModule *)self statusItems];
  uint64_t v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_100_1);

  objc_msgSend(v5, "na_each:", &__block_literal_global_104);
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Invalidating status items: %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v7 = [MEMORY[0x1E4F69230] requestToUpdateItems:v5 senderSelector:a2];
  id v8 = [(HFItemModule *)self itemUpdater];
  id v9 = (id)[v8 performItemUpdateRequest:v7];
}

BOOL __49__HUStatusItemModule__invalidateItemsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsInvalidation])
  {
    id v3 = [v2 invalidationDate];
    if (v3)
    {
      id v4 = [v2 invalidationDate];
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
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

uint64_t __49__HUStatusItemModule__invalidateItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setNeedsInvalidation:0];
}

- (void)setContext:(id)a3
{
}

- (void)setInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_statusItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_placeholderItem, 0);
}

@end