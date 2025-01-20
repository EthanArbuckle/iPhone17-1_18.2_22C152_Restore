@interface HFHomeItemProvider
- (HFHomeItemProvider)initWithHomeManager:(id)a3;
- (HMHomeManager)homeManager;
- (NSMutableSet)homeItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setHomeItems:(id)a3;
- (void)setHomeManager:(id)a3;
@end

@implementation HFHomeItemProvider

- (HFHomeItemProvider)initWithHomeManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_homeManager, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    homeItems = v7->_homeItems;
    v7->_homeItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  v3 = [(HFHomeItemProvider *)self homeManager];
  v4 = [v3 homes];

  objc_initWeak(&location, self);
  id v5 = [(HFHomeItemProvider *)self filter];
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v4 filter:v5 itemMap:&__block_literal_global_198];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__HFHomeItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFHomeItem *__33__HFHomeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HFHomeItem alloc] initWithHome:v2];

  return v3;
}

id __33__HFHomeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained homeItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained homeItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFHomeItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"home"];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (NSMutableSet)homeItems
{
  return self->_homeItems;
}

- (void)setHomeItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeItems, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end