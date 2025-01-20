@interface HFDemoModeAccessoryItemProvider
- (HFDemoModeAccessoryItemProvider)init;
- (HFDemoModeAccessoryItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSSet)demoItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setDemoItems:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HFDemoModeAccessoryItemProvider

- (HFDemoModeAccessoryItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDemoModeAccessoryItemProvider;
  v6 = [(HFItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (HFDemoModeAccessoryItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDemoModeAccessoryItemProvider.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFDemoModeAccessoryItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFDemoModeAccessoryItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [(HFDemoModeAccessoryItemProvider *)self demoItems];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke;
  v26[3] = &unk_264093D98;
  id v27 = v3;
  id v6 = v4;
  id v28 = v6;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v26];

  v8 = [MEMORY[0x263EFF9C0] set];
  objc_super v9 = [(HFDemoModeAccessoryItemProvider *)self filter];
  v10 = objc_msgSend(v7, "na_filter:", v9);

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke_2;
  v23 = &unk_264093DC0;
  id v24 = v6;
  id v25 = v8;
  id v11 = v8;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:&v20];
  v13 = [HFItemProviderReloadResults alloc];
  v14 = objc_msgSend(MEMORY[0x263EFFA08], "set", v20, v21, v22, v23);
  v15 = [(HFItemProviderReloadResults *)v13 initWithAddedItems:v11 removedItems:v14 existingItems:v11];

  v16 = [MEMORY[0x263EFFA08] setWithSet:v11];
  demoItems = self->_demoItems;
  self->_demoItems = v16;

  v18 = [MEMORY[0x263F58190] futureWithResult:v15];

  return v18;
}

void __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 accessory];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v8 = [v4 accessory];
  id v7 = [v8 uniqueIdentifier];
  [v6 setObject:v4 forKey:v7];
}

void __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a2 uniqueIdentifier];
  id v6 = [v3 objectForKeyedSubscript:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v5 = v6;
  }
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFDemoModeAccessoryItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (NSSet)demoItems
{
  BOOL v3 = +[HFUtilities isPressDemoModeEnabled];
  demoItems = self->_demoItems;
  if (!v3)
  {
    self->_demoItems = 0;

    id v5 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    goto LABEL_5;
  }
  if (demoItems)
  {
    id v5 = demoItems;
LABEL_5:
    objc_super v6 = v5;
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x263EFF9C0] set];
  id v8 = +[HFDemoModeAccessoryManager sharedManager];
  objc_super v9 = [v8 accessories];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__HFDemoModeAccessoryItemProvider_demoItems__block_invoke;
  v14[3] = &unk_264093DE8;
  id v15 = v7;
  id v10 = v7;
  [v9 enumerateObjectsUsingBlock:v14];
  id v11 = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithSet:v10];
  id v12 = self->_demoItems;
  self->_demoItems = v11;

  objc_super v6 = self->_demoItems;
LABEL_7:
  return v6;
}

uint64_t __44__HFDemoModeAccessoryItemProvider_demoItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[HFDemoModeAccessoryItem accessoryItemForAccessory:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
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

- (void)setHome:(id)a3
{
}

- (void)setDemoItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end