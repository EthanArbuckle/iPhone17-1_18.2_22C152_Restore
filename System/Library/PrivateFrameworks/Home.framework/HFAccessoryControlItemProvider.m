@interface HFAccessoryControlItemProvider
- (HFAccessoryControlItemProvider)initWithAccessoryItem:(id)a3;
- (HFAccessoryItem)accessoryItem;
- (HFCharacteristicValueSource)valueSource;
- (HMAccessory)accessory;
- (NSSet)previousControlItems;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setAccessory:(id)a3;
- (void)setAccessoryItem:(id)a3;
- (void)setPreviousControlItems:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFAccessoryControlItemProvider

- (HFAccessoryControlItemProvider)initWithAccessoryItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryControlItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryItem, a3);
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    previousControlItems = v7->_previousControlItems;
    v7->_previousControlItems = (NSSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  v3 = [(HFAccessoryControlItemProvider *)self valueSource];
  v4 = +[HFStaticReadPolicy policyWithDecision:0];
  [v3 beginTransactionWithReason:@"HFAccessoryControlItemProviderDisableReads" readPolicy:v4 logger:0];

  objc_initWeak(&location, self);
  id v5 = [(HFAccessoryControlItemProvider *)self accessoryItem];
  v6 = [v5 updateWithOptions:MEMORY[0x263EFFA78]];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __45__HFAccessoryControlItemProvider_reloadItems__block_invoke;
  v13 = &unk_26408FB70;
  objc_copyWeak(&v14, &location);
  v7 = [v6 flatMap:&v10];

  uint64_t v8 = [(HFAccessoryControlItemProvider *)self valueSource];
  [v8 commitTransactionWithReason:@"HFAccessoryControlItemProviderDisableReads"];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v7;
}

id __45__HFAccessoryControlItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 results];

  v6 = [v5 objectForKeyedSubscript:@"collatedChildItems"];

  v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_220);
  uint64_t v8 = [WeakRetained previousControlItems];
  v9 = objc_msgSend(v8, "na_setByDiffingWithSet:", v7);

  uint64_t v10 = [WeakRetained previousControlItems];
  uint64_t v11 = +[HFSetDiff diffFromSet:v10 toSet:v9];

  v12 = [HFItemProviderReloadResults alloc];
  v13 = [v11 additions];
  id v14 = [v11 deletions];
  v15 = [v11 updates];
  v16 = [(HFItemProviderReloadResults *)v12 initWithAddedItems:v13 removedItems:v14 existingItems:v15];

  [WeakRetained setPreviousControlItems:v9];
  v17 = [MEMORY[0x263F58190] futureWithResult:v16];

  return v17;
}

uint64_t __45__HFAccessoryControlItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryControlItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"service";
  v7[1] = @"accessory";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HFAccessoryItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
}

- (NSSet)previousControlItems
{
  return self->_previousControlItems;
}

- (void)setPreviousControlItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousControlItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end