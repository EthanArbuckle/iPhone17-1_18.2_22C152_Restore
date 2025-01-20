@interface HUTriggerItemProvider
- (BOOL)usesRichIconDescriptors;
- (HMHome)home;
- (HUTriggerItemProvider)init;
- (HUTriggerItemProvider)initWithHome:(id)a3;
- (NSMutableSet)triggerItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setTriggerItems:(id)a3;
- (void)setUsesRichIconDescriptors:(BOOL)a3;
@end

@implementation HUTriggerItemProvider

- (HUTriggerItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerItemProvider.m", 28, @"%s is unavailable; use %@ instead",
    "-[HUTriggerItemProvider init]",
    v5);

  return 0;
}

- (HUTriggerItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_usesRichIconDescriptors = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    triggerItems = v7->_triggerItems;
    v7->_triggerItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUTriggerItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6385A98;
  objc_copyWeak(&v13, &location);
  v3 = _Block_copy(aBlock);
  id v4 = [(HUTriggerItemProvider *)self home];
  id v5 = [v4 triggers];
  v6 = [(HUTriggerItemProvider *)self filter];
  v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:v6 itemMap:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6385B38;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

HUTriggerItem *__36__HUTriggerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [HUTriggerItem alloc];
  v6 = [WeakRetained home];
  v7 = [(HUTriggerItem *)v5 initWithHome:v6 trigger:v3];

  return v7;
}

id __36__HUTriggerItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 addedItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1E638F2E8;
  v12[4] = WeakRetained;
  objc_msgSend(v5, "na_each:", v12);

  v6 = [WeakRetained triggerItems];
  v7 = [v3 addedItems];
  [v6 unionSet:v7];

  uint64_t v8 = [WeakRetained triggerItems];
  v9 = [v3 removedItems];
  [v8 minusSet:v9];

  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v10;
}

void __36__HUTriggerItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setUsesRichIconDescriptors:", objc_msgSend(v2, "usesRichIconDescriptors"));
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686B8];
  v8[0] = *MEMORY[0x1E4F686F8];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (BOOL)usesRichIconDescriptors
{
  return self->_usesRichIconDescriptors;
}

- (void)setUsesRichIconDescriptors:(BOOL)a3
{
  self->_usesRichIconDescriptors = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)triggerItems
{
  return self->_triggerItems;
}

- (void)setTriggerItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerItems, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong(&self->_filter, 0);
}

@end