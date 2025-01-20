@interface HFTargetControlItemProvider
- (HFTargetControlItemProvider)init;
- (HFTargetControlItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)remoteControlAccessoryItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setRemoteControlAccessoryItems:(id)a3;
@end

@implementation HFTargetControlItemProvider

- (HFTargetControlItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFTargetControlItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = objc_opt_new();
    remoteControlAccessoryItems = v7->_remoteControlAccessoryItems;
    v7->_remoteControlAccessoryItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFTargetControlItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTargetControlItemProvider.m", 32, @"%s is unavailable; use %@ instead",
    "-[HFTargetControlItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFTargetControlItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HFTargetControlItemProvider *)self home];
  id v4 = objc_msgSend(v3, "hf_allTargetControlAccessories");

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFTargetControlItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F990;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v6 = [(HFTargetControlItemProvider *)self filter];
  v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:v6 itemMap:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__HFTargetControlItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

HFTargetControlAccessoryItem *__42__HFTargetControlItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HFTargetControlAccessoryItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");
  v7 = [(HFTargetControlAccessoryItem *)v4 initWithAccessory:v3 valueSource:v6];

  return v7;
}

id __42__HFTargetControlItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained remoteControlAccessoryItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained remoteControlAccessoryItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)items
{
  v2 = [(HFTargetControlItemProvider *)self remoteControlAccessoryItems];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFTargetControlItemProvider;
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

- (NSMutableSet)remoteControlAccessoryItems
{
  return self->_remoteControlAccessoryItems;
}

- (void)setRemoteControlAccessoryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteControlAccessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end