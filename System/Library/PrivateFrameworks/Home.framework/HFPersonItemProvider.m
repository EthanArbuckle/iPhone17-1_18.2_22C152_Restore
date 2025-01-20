@interface HFPersonItemProvider
- (HFPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4;
- (HMHome)home;
- (HMPersonManager)personManager;
- (NSMutableSet)personItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setHome:(id)a3;
- (void)setPersonItems:(id)a3;
- (void)setPersonManager:(id)a3;
@end

@implementation HFPersonItemProvider

- (HFPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFPersonItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_personManager, a4);
    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    personItems = v10->_personItems;
    v10->_personItems = (NSMutableSet *)v11;
  }
  return v10;
}

- (id)reloadItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  v4 = [(HFPersonItemProvider *)self personManager];

  if (v4)
  {
    v5 = [(HFPersonItemProvider *)self personManager];
    v6 = [v3 completionHandlerAdapter];
    [v5 fetchAllPersonsWithCompletion:v6];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__HFPersonItemProvider_reloadItems__block_invoke;
    v11[3] = &unk_2640967E0;
    v11[4] = self;
    id v7 = [v3 flatMap:v11];
  }
  else
  {
    id v8 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@: Person manager is nil", buf, 0xCu);
    }

    v9 = [[HFItemProviderReloadResults alloc] initWithAddedItems:0 removedItems:0 existingItems:0];
    [v3 finishWithResult:v9];
    id v7 = v3;
  }
  return v7;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 allObjects];
  v5 = [*(id *)(a1 + 32) filter];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__HFPersonItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_26408F990;
  v11[4] = *(void *)(a1 + 32);
  v6 = [v3 reloadItemsWithHomeKitObjects:v4 filter:v5 itemMap:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__HFPersonItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_264090AC8;
  v10[4] = *(void *)(a1 + 32);
  id v7 = [v6 flatMap:v10];
  id v8 = [v7 recover:&__block_literal_global_177];

  return v8;
}

HFPersonItem *__35__HFPersonItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [HFPersonItem alloc];
  id v8 = [*(id *)(a1 + 32) personManager];
  v9 = [*(id *)(a1 + 32) home];
  v10 = [(HFPersonItem *)v7 initWithPerson:v6 fromPersonManager:v8 home:v9];

  return v10;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 personItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  id v7 = [*(id *)(a1 + 32) personItems];
  id v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Person fetch failed with error %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [[HFItemProviderReloadResults alloc] initWithAddedItems:0 removedItems:0 existingItems:0];
  v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFPersonItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"person"];

  return v3;
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

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (void)setPersonManager:(id)a3
{
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end