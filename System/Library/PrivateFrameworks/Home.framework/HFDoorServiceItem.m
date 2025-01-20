@interface HFDoorServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFDoorServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6A8]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v15[0] = @"title";
  v6 = HFItemOptionalLocalizedString(@"HFControlShortTitleDoorState", v4);

  v16[0] = v6;
  v16[1] = MEMORY[0x263EFFA88];
  v15[1] = @"preferReversedInteractionDirection";
  v15[2] = @"actionRequiresDeviceUnlock";
  v16[2] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  v8 = [HFIncrementalStateControlItem alloc];
  v9 = [(HFIncrementalStateControlItem *)v8 initWithValueSource:v5 incrementalAndPrimaryCharacteristicType:*MEMORY[0x263F0C520] displayResults:v7];
  v10 = (void *)MEMORY[0x263EFFA08];
  v14 = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v12 = [v10 setWithArray:v11];

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C520];
  v14[0] = *MEMORY[0x263F0C0D0];
  v14[1] = v5;
  v14[2] = *MEMORY[0x263F0C2B8];
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v14 count:3];
  v9 = [v4 setWithArray:v8];

  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__HFDoorServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __49__HFDoorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C0D0]];
  v6 = [v5 characteristic];
  id v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C520]];
  v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  v10 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C2B8]];
  v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  v12 = [v3 standardResults];

  v13 = (void *)[v12 mutableCopy];
  if (v7)
  {
    uint64_t v36 = [v7 integerValue];
    uint64_t v14 = 0;
    v35 = v5;
    if (([v11 BOOLValue] & 1) == 0 && v9)
    {
      uint64_t v15 = [v9 integerValue];
      if (v15 == [v7 integerValue])
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v36 = [v9 integerValue];
        uint64_t v14 = 1;
      }
    }
    v16 = [NSNumber numberWithBool:v14];
    [v13 setObject:v16 forKeyedSubscript:@"isInStateTransition"];

    uint64_t v34 = a1;
    v17 = *(void **)(a1 + 32);
    v18 = [NSNumber numberWithInteger:v36];
    v19 = [v17 descriptionForCharacteristic:v6 withValue:v18];

    if (v14)
    {
      if ([v7 compare:v9] == -1) {
        v20 = @"HFCharacteristicValueDoorStateOpening";
      }
      else {
        v20 = @"HFCharacteristicValueDoorStateClosing";
      }
      uint64_t v21 = _HFLocalizedStringWithDefaultValue(v20, v20, 1);

      v19 = (void *)v21;
    }
    v22 = objc_msgSend(v6, "metadata", v11);
    v23 = objc_msgSend(v22, "hf_percentageForCharacteristicValue:", v7);
    [v13 setObject:v23 forKeyedSubscript:@"subPriority"];

    if (v19)
    {
      v24 = [v13 objectForKeyedSubscript:@"description"];

      if (!v24) {
        [v13 setObject:v19 forKeyedSubscript:@"description"];
      }
    }
    v25 = *(void **)(v34 + 32);
    v26 = [NSNumber numberWithInteger:v36];
    v27 = [v25 controlDescriptionForCharacteristic:v6 withValue:v26];
    objc_msgSend(v13, "na_safeSetObject:forKey:", v27, @"controlDescription");

    a1 = v34;
    uint64_t v5 = v35;
    v11 = v33;
  }
  if ([v11 BOOLValue])
  {
    v28 = _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneObstructed", @"HFStatusDescriptionDoor_OneObstructed", 1);
    [v13 setObject:v28 forKeyedSubscript:@"description"];
    [v13 setObject:v28 forKeyedSubscript:@"detailedControlDescription"];
    [v13 setObject:&unk_26C0F6AE0 forKeyedSubscript:@"badge"];
    [v13 setObject:&unk_26C0F6AF8 forKeyedSubscript:@"descriptionBadge"];
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v13];
  v29 = (void *)MEMORY[0x263F58190];
  v30 = +[HFItemUpdateOutcome outcomeWithResults:v13];
  v31 = [v29 futureWithResult:v30];

  return v31;
}

@end