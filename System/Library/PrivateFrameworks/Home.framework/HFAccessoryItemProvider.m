@interface HFAccessoryItemProvider
- (HFAccessoryItemProvider)init;
- (HFAccessoryItemProvider)initWithHome:(id)a3;
- (HFCharacteristicValueSource)overrideValueSource;
- (HFCharacteristicValueSource)valueSource;
- (HMHome)home;
- (NSMutableSet)accessoryItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setAccessoryItems:(id)a3;
- (void)setFilter:(id)a3;
- (void)setOverrideValueSource:(id)a3;
@end

@implementation HFAccessoryItemProvider

- (HFAccessoryItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    accessoryItems = v7->_accessoryItems;
    v7->_accessoryItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFAccessoryItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryItemProvider.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFAccessoryItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__HFAccessoryItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v13, &location);
  v3 = _Block_copy(aBlock);
  id v4 = [(HFAccessoryItemProvider *)self home];
  id v5 = [v4 accessories];
  v6 = [(HFAccessoryItemProvider *)self filter];
  v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:v6 itemMap:v3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__HFAccessoryItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v8;
}

HFAccessoryItem *__38__HFAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [HFAccessoryItem alloc];
  v6 = [WeakRetained valueSource];
  v7 = [(HFAccessoryItem *)v5 initWithAccessory:v3 valueSource:v6];

  return v7;
}

id __38__HFAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained accessoryItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained accessoryItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HFCharacteristicValueSource)valueSource
{
  id v3 = [(HFAccessoryItemProvider *)self overrideValueSource];

  if (v3)
  {
    id v4 = [(HFAccessoryItemProvider *)self overrideValueSource];
  }
  else
  {
    id v5 = [(HFAccessoryItemProvider *)self home];
    id v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }
  return (HFCharacteristicValueSource *)v4;
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

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_accessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end