@interface HFAccessoryCategoryItemProvider
- (HFAccessoryCategoryItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)categoryItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setCategoryItems:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HFAccessoryCategoryItemProvider

- (HFAccessoryCategoryItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryCategoryItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    categoryItems = v7->_categoryItems;
    v7->_categoryItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  v3 = objc_msgSend(MEMORY[0x263F0DF40], "hf_standardAccessoryCategoryTypes");
  objc_initWeak(&location, self);
  v4 = [v3 allObjects];
  id v5 = [(HFAccessoryCategoryItemProvider *)self filter];
  v6 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_58 itemAdaptor:&__block_literal_global_4_1 filter:v5 itemMap:&__block_literal_global_7_1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

id __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 categoryType];
}

HFAccessoryCategoryItem *__46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HFAccessoryCategoryItem alloc] initWithCategoryType:v2];

  return v3;
}

id __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained categoryItems];
  v6 = [v3 removedItems];
  [v5 minusSet:v6];

  v7 = [WeakRetained categoryItems];
  uint64_t v8 = [v3 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryCategoryItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"home";
  v7[1] = @"accessory";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSMutableSet)categoryItems
{
  return self->_categoryItems;
}

- (void)setCategoryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end