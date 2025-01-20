@interface HFValveActiveStateControlItem
- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6;
- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (id)_faucetValveSubtypeToIconIdentifierMap;
- (id)_iconDescriptorForServiceSubtype:(id)a3 inUse:(BOOL)a4 active:(BOOL)a5 hasFaucetAsParentService:(BOOL)a6;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4;
- (id)writeValue:(id)a3;
@end

@implementation HFValveActiveStateControlItem

- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263EFFA08];
  v25[0] = *MEMORY[0x263F0C200];
  v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v25 count:1];
  v11 = [v6 setWithArray:v10];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = *MEMORY[0x263F0C350];
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v14 = [v12 setWithArray:v13];

  v15 = [HFControlItemCharacteristicOptions alloc];
  v22[0] = &unk_26C0F79E0;
  v22[1] = &unk_26C0F79F8;
  v23[0] = v11;
  v23[1] = v14;
  v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v17 = [(HFControlItemCharacteristicOptions *)v15 initWithCharacteristicTypesByUsage:v16];

  v18 = [MEMORY[0x263EFFA08] set];
  v21.receiver = self;
  v21.super_class = (Class)HFValveActiveStateControlItem;
  v19 = [(HFPowerStateControlItem *)&v21 initWithValueSource:v9 auxiliaryTargetValueTuples:v18 additionalCharacteristicOptions:v17 displayResults:v8];

  return v19;
}

- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  id v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  id v9 = NSStringFromSelector(sel_initWithValueSource_displayResults_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFValveActiveStateControlItem.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFValveActiveStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:]",
    v9);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = [(HFControlItem *)self displayResults];
  id v8 = (void *)[v6 initWithValueSource:v5 displayResults:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  return +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x263F0D880], a4);
}

- (id)writeValue:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 integerValue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__HFValveActiveStateControlItem_writeValue___block_invoke;
  v20[3] = &__block_descriptor_40_e5__8__0l;
  v20[4] = v8;
  id v9 = __44__HFValveActiveStateControlItem_writeValue___block_invoke((uint64_t)v20);
  v10 = [HFServiceTreeTypePredicate alloc];
  v11 = [MEMORY[0x263EFFA08] set];
  v12 = [(HFServiceTreeTypePredicate *)v10 initWithServiceTypes:v9 serviceSubtypes:v11 includeChildServices:0];

  v13 = [HFServiceStateCharacteristicRecipe alloc];
  v14 = [(HFServiceStateCharacteristicRecipe *)v13 initWithCharacteristicType:*MEMORY[0x263F0BEF8] servicePredicate:v12 required:1];
  v15 = [(HFControlItem *)self valueSource];
  v16 = &unk_26C0F7A28;
  if (v8 == 2) {
    v16 = &unk_26C0F7A10;
  }
  objc_super v21 = v14;
  v22[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v18 = [v15 writeValuesForCharacteristicRecipes:v17];

  return v18;
}

id __44__HFValveActiveStateControlItem_writeValue___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == 2)
  {
    if (_MergedGlobals_313 == -1)
    {
      v1 = &qword_26AB2FD10;
      goto LABEL_6;
    }
    id v4 = &_MergedGlobals_313;
    id v5 = &__block_literal_global_18_9;
  }
  else
  {
    if (qword_26AB2FD18 == -1)
    {
      v1 = &qword_26AB2FD20;
      goto LABEL_6;
    }
    id v4 = &qword_26AB2FD18;
    id v5 = &__block_literal_global_22_10;
  }
  dispatch_once(v4, v5);
  v1 = v4 + 1;
LABEL_6:
  v2 = (void *)*v1;
  return v2;
}

void __44__HFValveActiveStateControlItem_writeValue___block_invoke_3()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D740];
  v5[0] = *MEMORY[0x263F0D880];
  v5[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_26AB2FD10;
  qword_26AB2FD10 = v3;
}

void __44__HFValveActiveStateControlItem_writeValue___block_invoke_5()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0D880];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2FD20;
  qword_26AB2FD20 = v2;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)HFValveActiveStateControlItem;
  id v4 = a3;
  id v5 = [(HFControlItem *)&v36 resultsForBatchReadResponse:v4];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(HFControlItem *)self valueForCharacteristicType:*MEMORY[0x263F0BEF8] inBatchReadResponse:v4];
  uint64_t v8 = [(HFControlItem *)self valueForCharacteristicType:*MEMORY[0x263F0C200] inBatchReadResponse:v4];
  id v9 = [HFServiceStateCharacteristicRecipe alloc];
  uint64_t v10 = *MEMORY[0x263F0C350];
  v11 = [(HFValveActiveStateControlItem *)self servicePredicateForCharacteristicType:*MEMORY[0x263F0C350] withUsage:0];
  v12 = [(HFServiceStateCharacteristicRecipe *)v9 initWithCharacteristicType:v10 servicePredicate:v11 required:0];

  v13 = [v4 responseForCharacteristicRecipe:v12];

  v14 = [v13 valueWithExpectedClass:objc_opt_class()];
  if (v14 && [v7 BOOLValue] && objc_msgSend(v8, "BOOLValue"))
  {
    v15 = [v13 characteristic];
    v16 = [v15 valueUpdatedTime];

    if (!v16)
    {
      v17 = [v13 characteristic];
      objc_msgSend(v17, "hf_prettyDescription");
      v19 = v18 = v6;
      NSLog(&cfstr_MissingValueup.isa, v19);

      id v6 = v18;
    }
    [v14 doubleValue];
    uint64_t v20 = +[HFFormattedTimeRemainingValue valueWithRemainingDuration:relativeToDate:](HFFormattedTimeRemainingValue, "valueWithRemainingDuration:relativeToDate:", v16);
    goto LABEL_10;
  }
  if ([v7 BOOLValue] && (objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    objc_super v21 = [HFSimpleFormattedValue alloc];
    v16 = _HFLocalizedStringWithDefaultValue(@"HFControlSupplementaryDescription.Valve.Waiting", @"HFControlSupplementaryDescription.Valve.Waiting", 1);
    uint64_t v20 = [(HFSimpleFormattedValue *)v21 initWithFormattedValue:v16];
LABEL_10:
    v22 = (void *)v20;
    [v6 setObject:v20 forKeyedSubscript:@"supplementaryFormattedValue"];
  }
  v23 = [(HFControlItem *)self valueSource];
  uint64_t v24 = [v23 primaryServiceDescriptor];

  if (v24)
  {
    v25 = [v24 parentServiceDescriptor];
    [v25 serviceType];
    v35 = v12;
    v27 = v26 = v6;
    uint64_t v28 = [v27 isEqualToString:*MEMORY[0x263F0D6D8]];

    v29 = [v24 serviceSubtype];
    uint64_t v30 = [v8 BOOLValue];
    uint64_t v31 = [v7 BOOLValue];
    uint64_t v32 = v30;
    id v6 = v26;
    v12 = v35;
    v33 = [(HFValveActiveStateControlItem *)self _iconDescriptorForServiceSubtype:v29 inUse:v32 active:v31 hasFaucetAsParentService:v28];
    [v6 setObject:v33 forKeyedSubscript:@"decorationIconDescriptor"];
  }
  return v6;
}

- (id)_faucetValveSubtypeToIconIdentifierMap
{
  if (qword_26AB2FD28 != -1) {
    dispatch_once(&qword_26AB2FD28, &__block_literal_global_42_2);
  }
  uint64_t v2 = (void *)qword_26AB2FD30;
  return v2;
}

void __71__HFValveActiveStateControlItem__faucetValveSubtypeToIconIdentifierMap__block_invoke_2()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D5F0];
  v4[0] = *MEMORY[0x263F0D5D8];
  v4[1] = v0;
  v5[0] = @"HFCAPackageIconIdentifierValveShowerHead";
  v5[1] = @"HFCAPackageIconIdentifierFaucet";
  uint64_t v1 = *MEMORY[0x263F0D5C0];
  void v4[2] = *MEMORY[0x263F0D5B8];
  v4[3] = v1;
  v5[2] = @"HFCAPackageIconIdentifierFaucet";
  void v5[3] = @"HFCAPackageIconIdentifierFaucet";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v3 = (void *)qword_26AB2FD30;
  qword_26AB2FD30 = v2;
}

- (id)_iconDescriptorForServiceSubtype:(id)a3 inUse:(BOOL)a4 active:(BOOL)a5 hasFaucetAsParentService:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v18[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (([v9 isEqualToString:*MEMORY[0x263F0D5C0]] & 1) != 0 || !v6)
  {
    uint64_t v10 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
    v11 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"drop.fill" configuration:v10];
    v17 = &unk_26C0F7A40;
    v18[0] = v11;
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v14 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v13];
LABEL_8:
    v15 = v14;

    goto LABEL_9;
  }
  uint64_t v10 = [(HFValveActiveStateControlItem *)self _faucetValveSubtypeToIconIdentifierMap];
  v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    v12 = &HFCAPackageStateOn;
    if (!v7) {
      v12 = &HFCAPackageStateOff;
    }
    v13 = *v12;
    v14 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:v11 state:v13];
    goto LABEL_8;
  }
  v15 = 0;
LABEL_9:

  return v15;
}

@end