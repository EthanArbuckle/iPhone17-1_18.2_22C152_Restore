@interface HUTriggerConditionSummaryItem
- (HMHome)home;
- (HUTriggerConditionSummaryItem)initWithConditions:(id)a3 home:(id)a4;
- (NSArray)conditions;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUTriggerConditionSummaryItem

- (HUTriggerConditionSummaryItem)initWithConditions:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerConditionSummaryItem;
  v9 = [(HUTriggerConditionSummaryItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditions, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F69080]);
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(HUTriggerConditionSummaryItem *)self conditions];
  id v8 = [v6 setWithArray:v7];
  v9 = [(HUTriggerConditionSummaryItem *)self home];
  v10 = (void *)[v5 initWithConditions:v8 home:v9];

  v11 = [v10 reloadItems];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke;
  v15[3] = &unk_1E6390FC0;
  v15[4] = self;
  id v16 = v4;
  id v12 = v4;
  v13 = [v11 flatMap:v15];

  return v13;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 allItems];
  id v4 = [v3 allObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_1E6390F50;
  v17[4] = *(void *)(a1 + 32);
  id v5 = [v4 sortedArrayUsingComparator:v17];

  v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"triggerConditionSummaryStyle"];
  id v7 = v6;
  if (!v6) {
    v6 = &unk_1F19B5198;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_5;
  v14[3] = &unk_1E6390F78;
  id v15 = v5;
  uint64_t v16 = v8;
  id v9 = v5;
  v10 = objc_msgSend(v9, "na_map:", v14);
  v11 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v10];
  id v12 = [v11 flatMap:&__block_literal_global_251];

  return v12;
}

uint64_t __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F69758];
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 conditions];
  id v9 = [v4 comparatorWithSortedObjects:v8];
  v10 = [v7 condition];

  v11 = [v6 condition];

  uint64_t v12 = ((uint64_t (**)(void, void *, void *))v9)[2](v9, v10, v11);
  return v12;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 firstObject];

  if (v5 == v4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  uint64_t v7 = *MEMORY[0x1E4F68708];
  v15[0] = &unk_1F19B51B0;
  uint64_t v8 = *MEMORY[0x1E4F68710];
  v14[0] = v7;
  v14[1] = v8;
  id v9 = [NSNumber numberWithInteger:v6];
  v15[1] = v9;
  v14[2] = *MEMORY[0x1E4F68718];
  v10 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v12 = [v4 updateWithOptions:v11];

  return v12;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  if ([v2 count])
  {
    id v4 = objc_msgSend(v2, "na_map:", &__block_literal_global_19_1);
    if (_MergedGlobals_2_1 != -1) {
      dispatch_once(&_MergedGlobals_2_1, &__block_literal_global_25_4);
    }
    id v5 = (id)qword_1EA12E170;
    uint64_t v6 = [v5 stringForObjectValue:v4];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  uint64_t v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v7;
}

uint64_t __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2_16(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
}

void __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_4()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F69240]);
  v1 = (void *)qword_1EA12E170;
  qword_1EA12E170 = (uint64_t)v0;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

@end