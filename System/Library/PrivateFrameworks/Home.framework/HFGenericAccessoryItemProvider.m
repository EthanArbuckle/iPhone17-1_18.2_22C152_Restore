@interface HFGenericAccessoryItemProvider
- (HFGenericAccessoryItemProvider)init;
- (HFGenericAccessoryItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)genericItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setGenericItems:(id)a3;
@end

@implementation HFGenericAccessoryItemProvider

- (HFGenericAccessoryItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFGenericAccessoryItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = objc_opt_new();
    genericItems = v7->_genericItems;
    v7->_genericItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFGenericAccessoryItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFGenericAccessoryItemProvider.m", 38, @"%s is unavailable; use %@ instead",
    "-[HFGenericAccessoryItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFGenericAccessoryItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFGenericAccessoryItemProvider *)self home];
  id v4 = [v3 accessories];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_237);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_26408F990;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = [(HFGenericAccessoryItemProvider *)self filter];
  uint64_t v8 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:v7 itemMap:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, &location);
  v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

uint64_t __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSupportedAccessory") ^ 1;
}

HFGenericAccessoryItem *__45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HFGenericAccessoryItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");
  v7 = [(HFGenericAccessoryItem *)v4 initWithAccessory:v3 valueSource:v6];

  return v7;
}

id __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained genericItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained genericItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFGenericAccessoryItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)genericItems
{
  return self->_genericItems;
}

- (void)setGenericItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end