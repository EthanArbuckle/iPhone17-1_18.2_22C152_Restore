@interface HFValveServiceItem
+ (id)supportedServiceTypes;
- (BOOL)containsActions;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
@end

@implementation HFValveServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D880]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v30 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_75 reverseTransformBlock:&__block_literal_global_6_1];
  v36 = @"controlItemPurpose";
  v37[0] = &unk_26C0F6888;
  v29 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  v6 = [HFPrimaryStateControlItem alloc];
  v28 = (void *)v5;
  v27 = [(HFPrimaryStateControlItem *)v6 initWithValueSource:v5 characteristicType:*MEMORY[0x263F0C218] valueTransformer:v30 displayResults:v29];
  v34[0] = @"title";
  v7 = HFItemOptionalLocalizedString(@"HFCharacteristicGroupTitleSetDuration", v4);
  v34[1] = @"controlItemPurpose";
  v35[0] = v7;
  v35[1] = &unk_26C0F6888;
  v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  v9 = [HFSimpleIncrementalControlItem alloc];
  v10 = [(HFSimpleIncrementalControlItem *)v9 initWithValueSource:v5 characteristicType:*MEMORY[0x263F0C3D0] displayResults:v8];
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  v12 = HFItemOptionalLocalizedString(@"HFControlTitleFaucetActive", v4);

  [v11 setObject:v12 forKeyedSubscript:@"title"];
  [v11 setObject:&unk_26C0F68A0 forKeyedSubscript:@"controlItemPurpose"];
  v13 = [(HFServiceItem *)self service];
  v14 = objc_msgSend(v13, "hf_parentService");

  v15 = (void *)MEMORY[0x263EFFA08];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_22;
  v31[3] = &unk_264093688;
  id v32 = v14;
  v33 = self;
  id v16 = v14;
  v17 = __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_22((uint64_t)v31);
  v18 = [v15 setWithArray:v17];

  v19 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v20 = [(HFServiceItem *)self valueSource];
  v21 = [(HFServiceItem *)self service];
  v22 = objc_msgSend(v21, "hf_serviceDescriptor");
  v23 = [(HFSimpleAggregatedCharacteristicValueSource *)v19 initWithValueSource:v20 services:v18 primaryServiceDescriptor:v22];

  v24 = [[HFValveActiveStateControlItem alloc] initWithValueSource:v23 displayResults:v11];
  v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v24, v27, v10, 0);

  return v25;
}

id __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 integerValue] == 1) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    id v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    id v4 = &unk_26C0F6858;
  }
  return v4;
}

uint64_t __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 isEqualToNumber:&unk_26C0F6870];
  return [v2 numberWithInteger:v3];
}

id __52__HFValveServiceItem_createControlItemsWithOptions___block_invoke_22(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2
    && ([v2 serviceType],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqualToString:*MEMORY[0x263F0D740]],
        v3,
        v4))
  {
    uint64_t v5 = [*(id *)(a1 + 40) service];
    uint64_t v6 = *(void *)(a1 + 32);
    v13 = v5;
    uint64_t v14 = v6;
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = &v13;
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) service];
    v12 = v5;
    v7 = (void *)MEMORY[0x263EFF8C0];
    v8 = &v12;
    uint64_t v9 = 1;
  }
  v10 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v12, v13, v14, v15);

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  int v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C218];
  id v6 = a3;
  v7 = [v4 setWithObject:v5];
  v8 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v7 options:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__HFValveServiceItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_26408C9A8;
  v11[4] = self;
  uint64_t v9 = [v8 flatMap:v11];

  return v9;
}

id __50__HFValveServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C218]];

  id v6 = [v5 valueWithExpectedClass:objc_opt_class()];
  v7 = [v3 standardResults];

  v8 = (void *)[v7 mutableCopy];
  if (v6 && ![v6 integerValue])
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"description"];

    if (!v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = [v5 characteristic];
      v12 = [v10 controlDescriptionForCharacteristic:v11 withValue:v6];
      [v8 setObject:v12 forKeyedSubscript:@"description"];
    }
    v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v5 characteristic];
    uint64_t v15 = [v13 descriptionForCharacteristic:v14 withValue:v6];
    [v8 setObject:v15 forKeyedSubscript:@"controlDescription"];

    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isDisabled"];
  }
  [v8 setObject:&unk_26C0F68B8 forKeyedSubscript:@"controlSummaryStyle"];
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v8];
  id v16 = (void *)MEMORY[0x263F58190];
  v17 = +[HFItemUpdateOutcome outcomeWithResults:v8];
  v18 = [v16 futureWithResult:v17];

  return v18;
}

- (BOOL)containsActions
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v3 = (void *)MEMORY[0x263F58190];
  int v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  uint64_t v5 = [v3 futureWithResult:v4];

  return v5;
}

@end