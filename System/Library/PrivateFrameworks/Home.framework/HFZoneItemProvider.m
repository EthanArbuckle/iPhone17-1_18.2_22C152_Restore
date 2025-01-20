@interface HFZoneItemProvider
- (HFZoneItemProvider)init;
- (HFZoneItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)zoneItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setZoneItems:(id)a3;
@end

@implementation HFZoneItemProvider

- (HFZoneItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFZoneItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    zoneItems = v7->_zoneItems;
    v7->_zoneItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFZoneItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFZoneItemProvider.m", 31, @"%s is unavailable; use %@ instead",
    "-[HFZoneItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFZoneItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__HFZoneItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v14, &location);
  v3 = _Block_copy(aBlock);
  id v4 = [(HFZoneItemProvider *)self home];
  id v5 = [v4 zones];
  v6 = (void *)[v5 copy];

  v7 = [(HFZoneItemProvider *)self filter];
  uint64_t v8 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v6 filter:v7 itemMap:v3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__HFZoneItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, &location);
  v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

HFZoneItem *__33__HFZoneItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [HFZoneItem alloc];
  v6 = [WeakRetained home];
  v7 = [(HFZoneItem *)v5 initWithHome:v6 zone:v3];

  return v7;
}

id __33__HFZoneItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained zoneItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained zoneItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFZoneItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"room"];

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

- (NSMutableSet)zoneItems
{
  return self->_zoneItems;
}

- (void)setZoneItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end