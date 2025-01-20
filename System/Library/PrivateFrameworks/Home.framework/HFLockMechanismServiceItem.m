@interface HFLockMechanismServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFLockMechanismServiceItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C510];
  v14[0] = *MEMORY[0x263F0C0B0];
  v14[1] = v5;
  v14[2] = *MEMORY[0x263F0C2B8];
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v14 count:3];
  v9 = [v4 setWithArray:v8];

  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__HFLockMechanismServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __58__HFLockMechanismServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C510]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C0B0]];
  v8 = [v7 characteristic];
  v9 = [v7 valueWithExpectedClass:objc_opt_class()];
  v10 = [v3 standardResults];
  v11 = (void *)[v10 mutableCopy];

  if (v9)
  {
    v31 = v4;
    uint64_t v12 = [v9 integerValue];
    v32 = v6;
    uint64_t v30 = [v6 integerValue];
    uint64_t v13 = a1;
    v14 = *(void **)(a1 + 32);
    [NSNumber numberWithInteger:v12];
    v16 = v15 = v8;
    id v17 = [v14 descriptionForCharacteristic:v15 withValue:v16];

    uint64_t v34 = v13;
    v18 = *(void **)(v13 + 32);
    v19 = [NSNumber numberWithInteger:v12];
    v33 = v15;
    v20 = [v18 controlDescriptionForCharacteristic:v15 withValue:v19];

    v21 = [v3 displayMetadata];
    uint64_t v22 = [v21 transitioningPrimaryState];

    if (!v22)
    {
      v4 = v31;
      v6 = v32;
      if (v17) {
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isInStateTransition"];
    if (v12 || v30 != 1)
    {
      if (v12 != 1)
      {
        v4 = v31;
        v6 = v32;
LABEL_12:
        id v17 = v17;

        v20 = v17;
        if (v17)
        {
LABEL_13:
          v25 = [v11 objectForKeyedSubscript:@"description"];

          if (!v25) {
            [v11 setObject:v17 forKeyedSubscript:@"description"];
          }
        }
LABEL_15:
        objc_msgSend(v11, "na_safeSetObject:forKey:", v20, @"controlDescription");

        v8 = v33;
        a1 = v34;
        goto LABEL_16;
      }
      v4 = v31;
      v6 = v32;
      if (v30) {
        goto LABEL_12;
      }
      v23 = @"HFCharacteristicValueLockMechanismStateUnlocking";
    }
    else
    {
      v23 = @"HFCharacteristicValueLockMechanismStateLocking";
      v4 = v31;
      v6 = v32;
    }
    uint64_t v24 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);

    id v17 = (id)v24;
    goto LABEL_12;
  }
LABEL_16:
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v11];
  v26 = (void *)MEMORY[0x263F58190];
  v27 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  v28 = [v26 futureWithResult:v27];

  return v28;
}

id __60__HFLockMechanismServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = NSNumber;
    unint64_t v4 = [a2 integerValue];
    if (v4 > 3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_20BD13960[v4];
    }
    v6 = [v3 numberWithInteger:v5];
  }
  else
  {
    v6 = &unk_26C0F7740;
  }
  return v6;
}

- (id)createControlItemsWithOptions:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_179 reverseTransformBlock:&__block_literal_global_6_7];
  id v7 = (void *)MEMORY[0x263EFFA08];
  v8 = [HFPrimaryStateControlItem alloc];
  uint64_t v9 = *MEMORY[0x263F0C510];
  v15[0] = @"title";
  v10 = HFItemOptionalLocalizedString(@"HFControlShortTitleLockState", v4);

  v15[1] = @"actionRequiresDeviceUnlock";
  v16[0] = v10;
  v16[1] = MEMORY[0x263EFFA88];
  v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = [(HFPrimaryStateControlItem *)v8 initWithValueSource:v5 characteristicType:v9 valueTransformer:v6 displayResults:v11];
  uint64_t v13 = [v7 setWithObject:v12];

  return v13;
}

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D798]];
}

uint64_t __60__HFLockMechanismServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  if (v3) {
    uint64_t v4 = v3 == 1;
  }
  else {
    uint64_t v4 = 3;
  }
  return [v2 numberWithInteger:v4];
}

@end