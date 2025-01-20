@interface HFEventBuilderItemProvider
- (HFEventBuilderItemProvider)initWithEventBuilders:(id)a3 inHome:(id)a4;
- (HFEventBuilderItemProvider)initWithTriggerBuilder:(id)a3;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions;
- (HMHome)home;
- (NSMutableSet)eventBuilderItems;
- (NSSet)eventBuilders;
- (NSSet)lastUpdateEventBuilders;
- (NSSet)lastUpdateEventGroups;
- (id)_reloadItems;
- (id)eventBuilderGroupsForEventBuilders:(id)a3;
- (id)reloadBuilderGroups;
- (id)reloadItems;
- (unint64_t)nameType;
- (void)setEventBuilderItems:(id)a3;
- (void)setEventBuilders:(id)a3;
- (void)setLastUpdateEventBuilders:(id)a3;
- (void)setLastUpdateEventGroups:(id)a3;
- (void)setNameType:(unint64_t)a3;
- (void)setNaturalLanguageOptions:(id)a3;
@end

@implementation HFEventBuilderItemProvider

- (HFEventBuilderItemProvider)initWithTriggerBuilder:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFEventBuilderItemProvider;
  v6 = [(HFItemProvider *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 home];
    home = v6->_home;
    v6->_home = (HMHome *)v7;

    objc_storeStrong((id *)&v6->_triggerBuilder, a3);
    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    eventBuilderItems = v6->_eventBuilderItems;
    v6->_eventBuilderItems = (NSMutableSet *)v9;
  }
  return v6;
}

- (HFEventBuilderItemProvider)initWithEventBuilders:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFEventBuilderItemProvider;
  uint64_t v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_eventBuilders, a3);
    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    eventBuilderItems = v10->_eventBuilderItems;
    v10->_eventBuilderItems = (NSMutableSet *)v11;
  }
  return v10;
}

- (NSSet)eventBuilders
{
  eventBuilders = self->_eventBuilders;
  if (!eventBuilders)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = [(HFEventBuilderItemProvider *)self triggerBuilder];
    v6 = [v5 eventBuilders];
    id v7 = [v4 setWithArray:v6];
    id v8 = self->_eventBuilders;
    self->_eventBuilders = v7;

    eventBuilders = self->_eventBuilders;
  }
  return eventBuilders;
}

- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions
{
  naturalLanguageOptions = self->_naturalLanguageOptions;
  if (!naturalLanguageOptions)
  {
    v4 = [HFTriggerNaturalLanguageOptions alloc];
    id v5 = [(HFEventBuilderItemProvider *)self home];
    v6 = [(HFTriggerNaturalLanguageOptions *)v4 initWithHome:v5 nameType:2];
    id v7 = self->_naturalLanguageOptions;
    self->_naturalLanguageOptions = v6;

    naturalLanguageOptions = self->_naturalLanguageOptions;
  }
  return naturalLanguageOptions;
}

- (unint64_t)nameType
{
  v2 = [(HFEventBuilderItemProvider *)self naturalLanguageOptions];
  unint64_t v3 = [v2 nameType];

  return v3;
}

- (void)setNameType:(unint64_t)a3
{
  id v4 = [(HFEventBuilderItemProvider *)self naturalLanguageOptions];
  [v4 setNameType:a3];
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(HFEventBuilderItemProvider *)self _reloadItems];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__HFEventBuilderItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_26408D198;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __41__HFEventBuilderItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained eventBuilderItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained eventBuilderItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  uint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)_reloadItems
{
  id v3 = [(HFEventBuilderItemProvider *)self reloadBuilderGroups];
  id v4 = [v3 allObjects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HFEventBuilderItemProvider__reloadItems__block_invoke_4;
  v7[3] = &unk_2640939C0;
  v7[4] = self;
  id v5 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_77 itemAdaptor:&__block_literal_global_7_3 filter:&__block_literal_global_10_3 itemMap:v7];

  return v5;
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 comparisonKey];
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 comparisonKey];
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke_3()
{
  return 1;
}

id __42__HFEventBuilderItemProvider__reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBuilders];
  id v5 = +[HFEventBuilderItem eventBuilderItemForEventBuilders:v4];

  v6 = [v3 comparisonKey];

  [v5 setComparisonKey:v6];
  id v7 = [*(id *)(a1 + 32) naturalLanguageOptions];
  id v8 = (void *)[v7 copy];
  [v5 setNaturalLanguageOptions:v8];

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  objc_super v12 = [*(id *)(a1 + 32) triggerBuilder];
  [v11 setContainingTriggerBuilder:v12];

  return v9;
}

- (id)reloadBuilderGroups
{
  id v3 = [(HFEventBuilderItemProvider *)self lastUpdateEventBuilders];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFFA08] set];
  }
  v6 = v5;

  id v7 = [(HFEventBuilderItemProvider *)self eventBuilders];
  id v8 = +[HFSetDiff diffFromSet:v6 toSet:v7];

  id v9 = [(HFEventBuilderItemProvider *)self lastUpdateEventGroups];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __49__HFEventBuilderItemProvider_reloadBuilderGroups__block_invoke;
  v24[3] = &unk_2640939E8;
  id v10 = v8;
  id v25 = v10;
  id v11 = objc_msgSend(v9, "na_filter:", v24);

  objc_super v12 = (void *)[v11 mutableCopy];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x263EFF9C0] set];
  }
  v15 = v14;

  v16 = [v10 additions];
  v17 = (void *)[v16 mutableCopy];

  v18 = [v10 updates];
  [v17 unionSet:v18];

  v19 = [(HFEventBuilderItemProvider *)self eventBuilderGroupsForEventBuilders:v17];
  [v15 unionSet:v19];

  v20 = (void *)[v15 copy];
  [(HFEventBuilderItemProvider *)self setLastUpdateEventGroups:v20];

  v21 = [(HFEventBuilderItemProvider *)self eventBuilders];
  v22 = (void *)[v21 copy];
  [(HFEventBuilderItemProvider *)self setLastUpdateEventBuilders:v22];

  return v15;
}

uint64_t __49__HFEventBuilderItemProvider_reloadBuilderGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBuilders];
  id v5 = [*(id *)(a1 + 32) additions];
  if ([v4 intersectsSet:v5])
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [v3 eventBuilders];
    id v8 = [*(id *)(a1 + 32) deletions];
    if ([v7 intersectsSet:v8])
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v9 = [v3 eventBuilders];
      id v10 = [*(id *)(a1 + 32) updates];
      uint64_t v6 = [v9 intersectsSet:v10] ^ 1;
    }
  }

  return v6;
}

- (id)eventBuilderGroupsForEventBuilders:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  uint64_t v6 = [v4 set];
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke;
  v21[3] = &unk_264093A38;
  v21[4] = self;
  id v22 = v7;
  id v8 = v7;
  objc_msgSend(v5, "na_each:", v21);
  id v9 = (void *)[v5 mutableCopy];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_3;
  v18[3] = &unk_264093AC8;
  v18[4] = self;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  id v11 = v9;
  objc_msgSend(v8, "na_each:", v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_7;
  v16[3] = &unk_26408EED0;
  id v12 = v10;
  id v17 = v12;
  objc_msgSend(v11, "na_each:", v16);
  v13 = v17;
  id v14 = v12;

  return v14;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) home];
    id v8 = [v6 characteristic];
    id v9 = [v8 service];
    id v10 = objc_msgSend(v7, "hf_serviceGroupsForService:", v9);

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_2;
    v11[3] = &unk_264093A10;
    id v12 = *(id *)(a1 + 40);
    id v13 = v4;
    objc_msgSend(v10, "na_each:", v11);
  }
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v3 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  id v11 = v8;

  [v11 addObject:*(void *)(a1 + 40)];
  id v9 = *(void **)(a1 + 32);
  id v10 = [v4 uniqueIdentifier];

  [v9 setObject:v11 forKeyedSubscript:v10];
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 home];
  id v9 = objc_msgSend(v8, "hf_serviceGroupWithIdentifier:", v7);

  if ((unint64_t)[v5 count] >= 2)
  {
    id v10 = objc_msgSend(v5, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_22_3);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_5;
    v11[3] = &unk_264093AA0;
    id v12 = v5;
    id v13 = v9;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

id __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 triggerValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = 0;
      id v10 = 0;
      id v11 = 0;
      goto LABEL_9;
    }
    id v4 = NSString;
    id v5 = v2;
    id v6 = [v5 thresholdRange];
    id v7 = [v6 minValue];
    id v8 = [v5 thresholdRange];
    id v9 = [v8 maxValue];
    id v3 = [v4 stringWithFormat:@"%@-%@", v7, v9];
  }
  id v10 = [v2 characteristic];

  id v11 = 0;
  if (v3 && v10)
  {
    id v12 = NSString;
    uint64_t v13 = objc_opt_class();
    id v14 = [v10 characteristicType];
    id v11 = [v12 stringWithFormat:@"%@:%@:%@", v13, v14, v3];
  }
LABEL_9:

  return v11;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    id v6 = [MEMORY[0x263EFFA08] setWithArray:v5];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_32);
    id v8 = (void *)MEMORY[0x263EFFA08];
    id v9 = [*(id *)(a1 + 40) services];
    id v10 = [v8 setWithArray:v9];
    int v11 = [v7 isEqualToSet:v10];

    if (v11)
    {
      id v12 = *(void **)(a1 + 48);
      uint64_t v13 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
      [v12 minusSet:v13];

      id v14 = +[HFEventBuilderItemProviderEventGroup eventGroupWithBuilders:v6];
      [v14 setComparisonKey:v15];
      [*(id *)(a1 + 56) addObject:v14];
    }
  }
}

id __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristic];
  id v3 = [v2 service];

  return v3;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a2;
  id v5 = [v3 setWithObject:v4];
  id v7 = +[HFEventBuilderItemProviderEventGroup eventGroupWithBuilders:v5];

  id v6 = [v4 comparisonKey];

  [v7 setComparisonKey:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

- (void)setEventBuilders:(id)a3
{
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)lastUpdateEventBuilders
{
  return self->_lastUpdateEventBuilders;
}

- (void)setLastUpdateEventBuilders:(id)a3
{
}

- (NSSet)lastUpdateEventGroups
{
  return self->_lastUpdateEventGroups;
}

- (void)setLastUpdateEventGroups:(id)a3
{
}

- (void)setNaturalLanguageOptions:(id)a3
{
}

- (NSMutableSet)eventBuilderItems
{
  return self->_eventBuilderItems;
}

- (void)setEventBuilderItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilderItems, 0);
  objc_storeStrong((id *)&self->_naturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventGroups, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventBuilders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilders, 0);
}

@end