@interface HFInputSourceServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFInputSourceServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D738]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v4 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_151 reverseTransformBlock:&__block_literal_global_7_5];
  v10 = @"controlItemPurpose";
  v11[0] = &unk_26C0F7008;
  v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v6 = [HFPrimaryStateControlItem alloc];
  v7 = [(HFPrimaryStateControlItem *)v6 initWithValueSource:v3 characteristicType:*MEMORY[0x263F0C570] valueTransformer:v4 displayResults:v5];
  v8 = [MEMORY[0x263EFFA08] setWithObject:v7];

  return v8;
}

id __58__HFInputSourceServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 integerValue]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    v4 = &unk_26C0F6FD8;
  }
  return v4;
}

uint64_t __58__HFInputSourceServiceItem_createControlItemsWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 isEqualToNumber:&unk_26C0F6FF0] ^ 1;
  return [v2 numberWithInteger:v3];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C218];
  uint64_t v6 = *MEMORY[0x263F0C140];
  uint64_t v7 = *MEMORY[0x263F0C570];
  id v8 = a3;
  v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, 0);
  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HFInputSourceServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __56__HFInputSourceServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C218]];

  uint64_t v34 = [v5 valueWithExpectedClass:objc_opt_class()];
  uint64_t v6 = [v3 standardResults];
  uint64_t v7 = (void *)[v6 mutableCopy];

  id v8 = [v3 readResponse];
  v9 = [v8 responseForCharacteristicType:*MEMORY[0x263F0C570]];

  v10 = [v3 readResponse];

  v11 = [v10 responseForCharacteristicType:*MEMORY[0x263F0C140]];

  v35 = [v11 valueWithExpectedClass:objc_opt_class()];
  uint64_t v12 = MEMORY[0x263EFFA80];
  uint64_t v13 = MEMORY[0x263EFFA88];
  if (v9)
  {
    v14 = [v9 characteristic];
    int v15 = objc_msgSend(v14, "hf_isWritable");

    uint64_t v16 = MEMORY[0x263EFFA80];
    if (v15 && ![v35 isEqualToNumber:&unk_26C0F7020]) {
      uint64_t v16 = v13;
    }
  }
  else
  {
    uint64_t v16 = MEMORY[0x263EFFA80];
  }
  [v7 setObject:v16 forKeyedSubscript:@"HFInputSourceCanHideKey"];
  v17 = [*(id *)(a1 + 32) service];
  if ([v17 isNameModifiable]) {
    uint64_t v18 = v12;
  }
  else {
    uint64_t v18 = v13;
  }
  [v7 setObject:v18 forKeyedSubscript:@"isDisabled"];

  v19 = [*(id *)(a1 + 32) service];
  uint64_t v20 = [v19 configurationState];

  if (v20 == 3 && v5)
  {
    v21 = [v7 objectForKeyedSubscript:@"suspendedState"];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (objc_msgSend(MEMORY[0x263F0DF00], "hf_isSuspendedStateSuspended:", v22)) {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isDisabled"];
    }
    v23 = *(void **)(a1 + 32);
    v24 = [v5 characteristic];
    v25 = (void *)v34;
    v26 = [v23 controlDescriptionForCharacteristic:v24 withValue:v34];
    [v7 setObject:v26 forKeyedSubscript:@"description"];

    v27 = *(void **)(a1 + 32);
    v28 = [v5 characteristic];
    v29 = [v27 descriptionForCharacteristic:v28 withValue:v34];
    [v7 setObject:v29 forKeyedSubscript:@"controlDescription"];
  }
  else
  {
    v28 = [NSNumber numberWithBool:1];
    [v7 setObject:v28 forKeyedSubscript:@"hidden"];
    v25 = (void *)v34;
  }

  [v7 setObject:&unk_26C0F7038 forKeyedSubscript:@"controlSummaryStyle"];
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v7];
  v30 = (void *)MEMORY[0x263F58190];
  v31 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v32 = [v30 futureWithResult:v31];

  return v32;
}

@end