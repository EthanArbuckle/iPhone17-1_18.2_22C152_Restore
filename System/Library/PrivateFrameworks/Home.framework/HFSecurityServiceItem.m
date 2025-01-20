@interface HFSecurityServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFSecurityServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D7D8]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = [(HFServiceItem *)self service];
  uint64_t v7 = *MEMORY[0x263F0C548];
  v8 = objc_msgSend(v6, "hf_characteristicOfType:", *MEMORY[0x263F0C548]);
  v9 = [v8 metadata];

  v10 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v9];
  v47 = @"title";
  v11 = HFItemOptionalLocalizedString(@"HFServiceSecuritySystemStateStayArm", v4);
  v48[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
  [(HFMultiStateValueSet *)v10 addValue:&unk_26C0F5E68 displayResults:v12];

  v45 = @"title";
  v13 = HFItemOptionalLocalizedString(@"HFServiceSecuritySystemStateAwayArm", v4);
  v46 = v13;
  v14 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  [(HFMultiStateValueSet *)v10 addValue:&unk_26C0F5E80 displayResults:v14];

  v43 = @"title";
  v15 = HFItemOptionalLocalizedString(@"HFServiceSecuritySystemStateNightArm", v4);
  v44 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  [(HFMultiStateValueSet *)v10 addValue:&unk_26C0F5E98 displayResults:v16];

  v41 = @"title";
  v17 = HFItemOptionalLocalizedString(@"HFServiceSecuritySystemStateDisarm", v4);
  v42 = v17;
  v18 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  [(HFMultiStateValueSet *)v10 addValue:&unk_26C0F5EB0 displayResults:v18];

  v19 = [MEMORY[0x263EFFA08] set];
  v20 = [(HFMultiStateValueSet *)v10 allValues];
  unint64_t v21 = [v20 count];

  if (v21 >= 2)
  {
    uint64_t v36 = v7;
    v22 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26C0F8098];
    v23 = +[HFUtilities comparatorWithSortedObjects:v22];
    [(HFMultiStateValueSet *)v10 setValueComparator:v23];

    if ([(HFMultiStateValueSet *)v10 count] == 2)
    {
      v24 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_6 reverseTransformBlock:&__block_literal_global_25];
      v35 = v22;
      v25 = v9;
      v26 = v5;
      v27 = [HFPrimaryStateControlItem alloc];
      v39[0] = @"title";
      v28 = HFItemOptionalLocalizedString(@"HFControlShortTitleSecuritySystemState", v4);
      v39[1] = @"actionRequiresDeviceUnlock";
      v40[0] = v28;
      v40[1] = MEMORY[0x263EFFA88];
      v29 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
      v30 = v27;
      v5 = v26;
      v9 = v25;
      v22 = v35;
      v31 = [(HFPrimaryStateControlItem *)v30 initWithValueSource:v5 characteristicType:v36 valueTransformer:v24 displayResults:v29];
    }
    else
    {
      v32 = [HFMultiStateControlItem alloc];
      v37[0] = @"title";
      v24 = HFItemOptionalLocalizedString(@"HFControlShortTitleSecuritySystemState", v4);
      v37[1] = @"actionRequiresDeviceUnlock";
      v38[0] = v24;
      v38[1] = MEMORY[0x263EFFA88];
      v28 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
      v31 = [(HFMultiStateControlItem *)v32 initWithValueSource:v5 characteristicType:v36 possibleValueSet:v10 displayResults:v28];
    }

    uint64_t v33 = [MEMORY[0x263EFFA08] setWithObject:v31];

    v19 = (void *)v33;
  }

  return v19;
}

id __55__HFSecurityServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = NSNumber;
    unint64_t v4 = [a2 integerValue];
    if (v4 > 3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_20BD13578[v4];
    }
    v6 = [v3 numberWithInteger:v5];
  }
  else
  {
    v6 = &unk_26C0F5E68;
  }
  return v6;
}

uint64_t __55__HFSecurityServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  if ((unint64_t)[a2 integerValue] > 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 3;
  }
  return [v2 numberWithInteger:v3];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C0E8];
  v14[0] = *MEMORY[0x263F0C548];
  v14[1] = v5;
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v14 count:2];
  v9 = [v4 setWithArray:v8];

  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__HFSecurityServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __53__HFSecurityServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C0E8]];
  v6 = [v5 characteristic];
  id v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C548]];
  v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  v10 = [v3 standardResults];

  v11 = (void *)[v10 mutableCopy];
  if (v7)
  {
    v39 = v4;
    uint64_t v40 = a1;
    v12 = v6;
    unint64_t v13 = [v7 integerValue];
    uint64_t v14 = [v9 integerValue];
    uint64_t v15 = v14;
    v38 = v9;
    BOOL v16 = v9 != 0;
    BOOL v17 = v13 != 4;
    if (v14 == v13) {
      BOOL v17 = 0;
    }
    BOOL v18 = v16 && v17;
    if (v16 && v17) {
      unint64_t v19 = v14;
    }
    else {
      unint64_t v19 = v13;
    }
    v20 = [NSNumber numberWithBool:v16 & v17];
    [v11 setObject:v20 forKeyedSubscript:@"isInStateTransition"];

    if (v13 > 4) {
      unint64_t v21 = 0;
    }
    else {
      unint64_t v21 = *off_26408D6D0[v13];
    }
    v37 = v21;
    v22 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierSecuritySystem" state:v21];
    [v11 setObject:v22 forKeyedSubscript:@"icon"];

    v23 = *(void **)(v40 + 32);
    v24 = [NSNumber numberWithInteger:v19];
    id v25 = [v23 descriptionForCharacteristic:v12 withValue:v24];

    v26 = *(void **)(v40 + 32);
    v27 = [NSNumber numberWithInteger:v19];
    v28 = v26;
    v6 = v12;
    v29 = [v28 controlDescriptionForCharacteristic:v12 withValue:v27];

    if (v18)
    {
      if (v15 == 3) {
        v30 = @"HFCharacteristicValueCurrentSecuritySystemStateDisarming";
      }
      else {
        v30 = @"HFCharacteristicValueCurrentSecuritySystemStateArming";
      }
      v31 = _HFLocalizedStringWithDefaultValue(v30, v30, 1);

      id v25 = v31;
      v29 = v25;
    }
    unint64_t v4 = v39;
    v9 = v38;
    if (v25)
    {
      v32 = [v11 objectForKeyedSubscript:@"description"];

      if (!v32) {
        [v11 setObject:v25 forKeyedSubscript:@"description"];
      }
    }
    objc_msgSend(v11, "na_safeSetObject:forKey:", v29, @"controlDescription");

    a1 = v40;
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v11];
  uint64_t v33 = (void *)MEMORY[0x263F58190];
  v34 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  v35 = [v33 futureWithResult:v34];

  return v35;
}

@end