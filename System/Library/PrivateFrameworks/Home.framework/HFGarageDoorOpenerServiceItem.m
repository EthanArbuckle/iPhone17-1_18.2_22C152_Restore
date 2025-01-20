@interface HFGarageDoorOpenerServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFGarageDoorOpenerServiceItem

id __61__HFGarageDoorOpenerServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 readResponse];
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C4A8]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C2B8]];
  v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  v9 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C040]];
  v10 = [v9 characteristic];
  v11 = [v9 valueWithExpectedClass:objc_opt_class()];
  v12 = [v3 standardResults];

  v13 = (void *)[v12 mutableCopy];
  if (v11) {
    BOOL v14 = v6 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    v33 = v10;
    uint64_t v15 = [v11 integerValue];
    uint64_t v16 = [v6 integerValue];
    v31 = v8;
    v32 = v6;
    if (v15 == 4)
    {
      uint64_t v15 = 0;
    }
    else if (v15 != v16)
    {
      if (v16) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 2;
      }
    }
    v17 = [NSNumber numberWithInt:(v15 & 0xFFFFFFFFFFFFFFFELL) == 2];
    [v13 setObject:v17 forKeyedSubscript:@"isInStateTransition"];

    uint64_t v18 = a1;
    v19 = *(void **)(a1 + 32);
    v20 = [NSNumber numberWithInteger:v15];
    v21 = [v19 descriptionForCharacteristic:v33 withValue:v20];

    if (v21)
    {
      v22 = [v13 objectForKeyedSubscript:@"description"];

      if (!v22) {
        [v13 setObject:v21 forKeyedSubscript:@"description"];
      }
    }
    v23 = *(void **)(v18 + 32);
    v24 = [NSNumber numberWithInteger:v15];
    v10 = v33;
    v25 = [v23 controlDescriptionForCharacteristic:v33 withValue:v24];

    a1 = v18;
    objc_msgSend(v13, "na_safeSetObject:forKey:", v25, @"controlDescription");

    v8 = v31;
    v6 = v32;
  }
  if ([v8 BOOLValue])
  {
    v26 = _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneObstructed", @"HFStatusDescriptionGarageDoor_OneObstructed", 1);
    [v13 setObject:v26 forKeyedSubscript:@"description"];
    [v13 setObject:v26 forKeyedSubscript:@"detailedControlDescription"];
    [v13 setObject:&unk_26C0F6C90 forKeyedSubscript:@"badge"];
    [v13 setObject:&unk_26C0F6CA8 forKeyedSubscript:@"descriptionBadge"];
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v13];
  v27 = (void *)MEMORY[0x263F58190];
  v28 = +[HFItemUpdateOutcome outcomeWithResults:v13];
  v29 = [v27 futureWithResult:v28];

  return v29;
}

id __63__HFGarageDoorOpenerServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = NSNumber;
    unint64_t v4 = [a2 integerValue];
    if (v4 > 4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_20BD13850[v4];
    }
    v6 = [v3 numberWithInteger:v5];
  }
  else
  {
    v6 = &unk_26C0F6C78;
  }
  return v6;
}

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6F8]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_128 reverseTransformBlock:&__block_literal_global_6_5];
  v7 = (void *)MEMORY[0x263EFFA08];
  v8 = [HFPrimaryStateControlItem alloc];
  uint64_t v9 = *MEMORY[0x263F0C4A8];
  v16[0] = @"title";
  v10 = HFItemOptionalLocalizedString(@"HFControlShortTitleDoorState", v4);

  v16[1] = @"actionRequiresDeviceUnlock";
  v17[0] = v10;
  v17[1] = MEMORY[0x263EFFA88];
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v12 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v8, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v5, v9, v6, v11, v16[0]);
  v18[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  BOOL v14 = [v7 setWithArray:v13];

  return v14;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C4A8];
  v14[0] = *MEMORY[0x263F0C040];
  v14[1] = v5;
  v14[2] = *MEMORY[0x263F0C2B8];
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v14 count:3];
  uint64_t v9 = [v4 setWithArray:v8];

  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__HFGarageDoorOpenerServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

uint64_t __63__HFGarageDoorOpenerServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  BOOL v3 = (unint64_t)[a2 integerValue] < 2;
  return [v2 numberWithInteger:v3];
}

@end