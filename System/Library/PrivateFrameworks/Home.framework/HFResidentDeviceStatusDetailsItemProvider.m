@interface HFResidentDeviceStatusDetailsItemProvider
- (HFResidentDeviceStatusDetailsItemProvider)init;
- (HFResidentDeviceStatusDetailsItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)residentDeviceItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setResidentDeviceItems:(id)a3;
@end

@implementation HFResidentDeviceStatusDetailsItemProvider

- (HFResidentDeviceStatusDetailsItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFResidentDeviceStatusDetailsItemProvider.m", 24, @"%s is unavailable; use %@ instead",
    "-[HFResidentDeviceStatusDetailsItemProvider init]",
    v5);

  return 0;
}

- (HFResidentDeviceStatusDetailsItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFResidentDeviceStatusDetailsItemProvider;
  v6 = [(HFItemProvider *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    residentDeviceItems = v6->_residentDeviceItems;
    v6->_residentDeviceItems = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFResidentDeviceStatusDetailsItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFResidentDeviceStatusDetailsItemProvider *)self home];
  id v4 = [v3 residentDevices];
  id v5 = [(HFResidentDeviceStatusDetailsItemProvider *)self filter];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke;
  v11[3] = &unk_26408D170;
  v11[4] = self;
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:v5 itemMap:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFResidentDeviceStatusDetailsItem *__56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HFResidentDeviceStatusDetailsItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  v6 = [(HFResidentDeviceStatusDetailsItem *)v4 initWithHome:v5 residentDevice:v3];

  return v6;
}

id __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained residentDeviceItems];
  v6 = [v3 removedItems];
  [v5 minusSet:v6];

  uint64_t v7 = [WeakRetained residentDeviceItems];
  v8 = [v3 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFResidentDeviceStatusDetailsItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"residentDevice"];

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
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
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end