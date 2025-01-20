@interface HFResidentDeviceItemProvider
- (HFResidentDeviceItemProvider)init;
- (HFResidentDeviceItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)residentDeviceItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setResidentDeviceItems:(id)a3;
@end

@implementation HFResidentDeviceItemProvider

- (HFResidentDeviceItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFResidentDeviceItemProvider.m", 24, @"%s is unavailable; use %@ instead",
    "-[HFResidentDeviceItemProvider init]",
    v5);

  return 0;
}

- (HFResidentDeviceItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFResidentDeviceItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    residentDeviceItems = v7->_residentDeviceItems;
    v7->_residentDeviceItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFResidentDeviceItemProvider *)self home];
  v4 = [v3 residentDevices];
  id v5 = [(HFResidentDeviceItemProvider *)self filter];
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:v5 itemMap:&__block_literal_global_176];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__HFResidentDeviceItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFResidentDeviceItem *__43__HFResidentDeviceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HFResidentDeviceItem alloc] initWithResidentDevice:v2];

  return v3;
}

id __43__HFResidentDeviceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained residentDeviceItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained residentDeviceItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFResidentDeviceItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"residentDevice"];

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

- (NSMutableSet)residentDeviceItems
{
  return self->_residentDeviceItems;
}

- (void)setResidentDeviceItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDeviceItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end