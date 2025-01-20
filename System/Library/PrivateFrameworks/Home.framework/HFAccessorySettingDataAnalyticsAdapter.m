@interface HFAccessorySettingDataAnalyticsAdapter
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFAccessorySettingDataAnalyticsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
- (id)customizeSections:(id)a3 forEntity:(id)a4;
@end

@implementation HFAccessorySettingDataAnalyticsAdapter

- (HFAccessorySettingDataAnalyticsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  if (a4)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HFAccessorySettingDataAnalyticsAdapter.m" lineNumber:21 description:@"Data Analytics adapter does not do what you think it does."];
  }
  v8 = [MEMORY[0x263EFFA08] set];
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingDataAnalyticsAdapter;
  v9 = [(HFAccessorySettingAdapter *)&v12 initWithHomeKitSettingsVendor:v7 keyPaths:v8 mode:a4 updateHandler:0];

  return v9;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  v4 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  if ([v4 isItemGroup])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    if ([v6 conformsToProtocol:&unk_26C155B48]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    v9 = objc_msgSend(v8, "hf_idsDeviceIdentifierWithError:", 0);

    BOOL v5 = v9 != 0;
  }

  return v5;
}

- (id)customizeSections:(id)a3 forEntity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 keyPath];
  int v8 = [v7 isEqualToString:@"root.general.analytics"];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF980] array];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    id v27 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke;
    v19 = &unk_26408EC88;
    id v10 = v9;
    id v20 = v10;
    v21 = &v22;
    objc_msgSend(v5, "na_each:", &v16);
    if (v23[5])
    {
      v11 = [HFMutableItemSection alloc];
      objc_super v12 = [(HFItemSection *)v11 initWithIdentifier:@"COLLECT_SYSDIAGNOSE_SECTION", v16, v17, v18, v19];
      v13 = [MEMORY[0x263EFF8C0] arrayWithObject:v23[5]];
      [(HFItemSection *)v12 setItems:v13];

      [v10 addObject:v12];
    }
    id v14 = v10;

    _Block_object_dispose(&v22, 8);
    id v5 = v14;
  }

  return v5;
}

void __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 items];
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_24);

  if (v5)
  {
    id v6 = (void *)[v3 mutableCopy];

    id v7 = [v6 items];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_3;
    v9[3] = &unk_26408EC60;
    id v10 = v5;
    int v8 = objc_msgSend(v7, "na_filter:", v9);
    [v6 setItems:v8];

    [*(id *)(a1 + 32) addObject:v6];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);

    id v3 = v6;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"HFAccessorySettingGroupKeyPathKey"];
  uint64_t v4 = [v3 isEqualToString:@"root.general.analytics.sysdiagnose"];

  return v4;
}

BOOL __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

@end