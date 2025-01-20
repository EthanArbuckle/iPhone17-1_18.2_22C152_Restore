@interface HFBridgeItemProvider
- (HFBridgeItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)accessoryItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setAccessoryItems:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation HFBridgeItemProvider

- (HFBridgeItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFBridgeItemProvider;
  v6 = [(HFItemProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    [(HFBridgeItemProvider *)v7 setAccessoryItems:v8];
  }
  return v7;
}

- (id)reloadItems
{
  v3 = [(HFBridgeItemProvider *)self home];
  v4 = objc_msgSend(v3, "hf_allBridgeAccessories");
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_144);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFBridgeItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_26408F990;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = [(HFBridgeItemProvider *)self filter];
  v8 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:v7 itemMap:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__HFBridgeItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, &location);
  v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

uint64_t __35__HFBridgeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAsBridge");
}

HFAccessoryItem *__35__HFBridgeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HFAccessoryItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");
  v7 = [(HFAccessoryItem *)v4 initWithAccessory:v3 valueSource:v6];

  return v7;
}

id __35__HFBridgeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained accessoryItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained accessoryItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFBridgeItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"accessory"];

  return v3;
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

- (NSMutableSet)accessoryItems
{
  return self->_accessoryItems;
}

- (void)setAccessoryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end