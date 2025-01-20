@interface HFAccessoryBatteryStatusItem
- (NSMutableDictionary)batteryLevelItems;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (void)setBatteryLevelItems:(id)a3;
@end

@implementation HFAccessoryBatteryStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAccessoryLowBattery", @"HFStatusTitleAccessoryLowBattery", 1);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263F58190];
    v27 = @"hidden";
    v28[0] = MEMORY[0x263EFFA88];
    v8 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v9 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v10 = [v7 futureWithResult:v9];
  }
  else
  {
    v11 = [(HFStatusItem *)self home];
    v12 = [v11 accessories];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke;
    v26[3] = &unk_26408D968;
    v26[4] = self;
    v13 = objc_msgSend(v12, "na_filter:", v26);

    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x263F58190];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_3;
    v22[3] = &unk_26409A438;
    objc_copyWeak(&v24, &location);
    id v23 = v4;
    v15 = objc_msgSend(v13, "na_map:", v22);
    v16 = [v14 combineAllFutures:v15];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_4;
    v19[3] = &unk_264098C30;
    objc_copyWeak(&v21, &location);
    id v17 = v13;
    id v20 = v17;
    v10 = [v16 flatMap:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v10;
}

uint64_t __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  v5 = [a1[4] room];
  if (v5)
  {
    a1 = [a1[4] room];
    v2 = [v4 room];
    if (![a1 isEqual:v2])
    {
      uint64_t v6 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v7 = [v4 services];
  uint64_t v6 = objc_msgSend(v7, "na_any:", &__block_literal_global_195);

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

BOOL __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 serviceType];
  if ([v3 isEqualToString:*MEMORY[0x263F0D640]])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x263F0BF58]);
    BOOL v4 = v5 != 0;
  }
  return v4;
}

id __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [WeakRetained batteryLevelItems];
  uint64_t v6 = [v3 uniqueIdentifier];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [HFAccessoryBatteryLevelItem alloc];
    v9 = [WeakRetained valueSource];
    v7 = [(HFAccessoryBatteryLevelItem *)v8 initWithAccessory:v3 valueSource:v9];

    v10 = [WeakRetained batteryLevelItems];
    v11 = [v3 uniqueIdentifier];
    [v10 setObject:v7 forKeyedSubscript:v11];
  }
  v12 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v13 = [MEMORY[0x263EFFA08] setWithObject:@"batteryLow"];
  [v12 setObject:v13 forKeyedSubscript:@"accessoryBatteryDesiredKeys"];

  v14 = [(HFItem *)v7 updateWithOptions:v12];

  return v14;
}

id __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    v7 = *(void **)(a1 + 32);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_5;
    id v24 = &unk_26409A460;
    id v25 = v3;
    id v8 = v5;
    id v26 = v8;
    id v9 = v6;
    id v27 = v9;
    [v7 enumerateObjectsUsingBlock:&v21];
    v10 = objc_opt_new();
    if (objc_msgSend(v8, "count", v21, v22, v23, v24))
    {
      v11 = [WeakRetained defaultTitleForRepresentedHomeKitObjects:v8];
      [v10 setObject:v11 forKeyedSubscript:@"title"];

      v12 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
      v13 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"battery.25" configuration:v12];
      [v10 setObject:v13 forKeyedSubscript:@"icon"];

      [v10 setObject:&unk_26C0F78C0 forKeyedSubscript:@"statusItemCategory"];
      [v10 setObject:v8 forKeyedSubscript:@"representedHomeKitObjects"];
    }
    else
    {
      [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    v16 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyAccessoryLowBattery", @"HFStatusSortKeyAccessoryLowBattery", 1);
    [v10 setObject:v16 forKeyedSubscript:@"sortKey"];

    [v10 setObject:&unk_26C0F78D8 forKeyedSubscript:@"priority"];
    [v10 setObject:v9 forKeyedSubscript:@"dependentHomeKitObjects"];
    id v17 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v10 setObject:v17 forKeyedSubscript:@"dependentHomeKitClasses"];

    v18 = (void *)MEMORY[0x263F58190];
    v19 = +[HFItemUpdateOutcome outcomeWithResults:v10];
    v15 = [v18 futureWithResult:v19];
  }
  else
  {
    v14 = (void *)MEMORY[0x263F58190];
    v28 = @"hidden";
    v29[0] = MEMORY[0x263EFFA88];
    id v8 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v9 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v15 = [v14 futureWithResult:v9];
  }

  return v15;
}

void __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"batteryLow"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    [*(id *)(a1 + 40) addObject:v10];
  }
  id v8 = *(void **)(a1 + 48);
  id v9 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  [v8 unionSet:v9];
}

- (NSMutableDictionary)batteryLevelItems
{
  return self->_batteryLevelItems;
}

- (void)setBatteryLevelItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end