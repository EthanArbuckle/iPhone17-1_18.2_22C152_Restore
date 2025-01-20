@interface HFConditionItemProvider
- (HFConditionItemProvider)init;
- (HFConditionItemProvider)initWithConditions:(id)a3 home:(id)a4;
- (HMHome)home;
- (NSMutableSet)conditionItems;
- (NSSet)conditions;
- (id)reloadItems;
- (void)setConditions:(id)a3;
@end

@implementation HFConditionItemProvider

- (HFConditionItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithConditions_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFConditionItemProvider.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFConditionItemProvider init]",
    v5);

  return 0;
}

- (HFConditionItemProvider)initWithConditions:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFConditionItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditions, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    conditionItems = v10->_conditionItems;
    v10->_conditionItems = (NSMutableSet *)v11;
  }
  return v10;
}

- (id)reloadItems
{
  v3 = [(HFConditionItemProvider *)self home];
  objc_initWeak(&location, self);
  v4 = [(HFConditionItemProvider *)self conditions];
  v5 = [v4 allObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__HFConditionItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_26409ADB0;
  id v6 = v3;
  id v13 = v6;
  id v7 = [(HFItemProvider *)self reloadItemsWithObjects:v5 keyAdaptor:&__block_literal_global_210 itemAdaptor:&__block_literal_global_10_11 filter:0 itemMap:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__HFConditionItemProvider_reloadItems__block_invoke_4;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, &location);
  id v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __38__HFConditionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 predicate];
}

id __38__HFConditionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 condition];
  v3 = [v2 predicate];

  return v3;
}

HFPresenceConditionItem *__38__HFConditionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = HFTimeConditionItem;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = HFCharacteristicConditionItem;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = [[HFPresenceConditionItem alloc] initWithCondition:v3 home:*(void *)(a1 + 32)];
        goto LABEL_9;
      }
      v4 = HFUnknownConditionItem;
    }
  }
  v5 = (HFPresenceConditionItem *)[[v4 alloc] initWithCondition:v3];
LABEL_9:
  id v6 = v5;

  return v6;
}

id __38__HFConditionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained conditionItems];
  id v6 = [v3 removedItems];
  [v5 minusSet:v6];

  id v7 = [WeakRetained conditionItems];
  id v8 = [v3 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)conditionItems
{
  return self->_conditionItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end