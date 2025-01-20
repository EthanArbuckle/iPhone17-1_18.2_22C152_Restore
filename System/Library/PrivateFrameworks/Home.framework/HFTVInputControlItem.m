@interface HFTVInputControlItem
+ (Class)valueClass;
+ (id)_inputSourceValueComparatorForTelevisionProfile:(id)a3;
+ (id)inputCharacteristicTypes;
+ (id)readOnlyOptionalInputCharacteristicTypes;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (HFTVInputControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFTVInputControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (NSArray)inputs;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)readValueAndPopulateStandardResults;
- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writeValue:(id)a3;
@end

@implementation HFTVInputControlItem

+ (id)inputCharacteristicTypes
{
  if (_MergedGlobals_302 != -1) {
    dispatch_once(&_MergedGlobals_302, &__block_literal_global_3_28);
  }
  v2 = (void *)qword_26AB2FB88;
  return v2;
}

uint64_t __48__HFTVInputControlItem_inputCharacteristicTypes__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0BEF8], *MEMORY[0x263F0BF08], 0);
  uint64_t v1 = qword_26AB2FB88;
  qword_26AB2FB88 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)readOnlyOptionalInputCharacteristicTypes
{
  if (qword_26AB2FB90 != -1) {
    dispatch_once(&qword_26AB2FB90, &__block_literal_global_7_11);
  }
  v2 = (void *)qword_26AB2FB98;
  return v2;
}

uint64_t __64__HFTVInputControlItem_readOnlyOptionalInputCharacteristicTypes__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C140], *MEMORY[0x263F0C218], 0);
  uint64_t v1 = qword_26AB2FB98;
  qword_26AB2FB98 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)_inputSourceValueComparatorForTelevisionProfile:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HFTVInputControlItem__inputSourceValueComparatorForTelevisionProfile___block_invoke;
  aBlock[3] = &unk_26409A100;
  id v8 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __72__HFTVInputControlItem__inputSourceValueComparatorForTelevisionProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaSourceComparator");
  v7 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  id v8 = [v5 identifier];
  v9 = [v6 identifier];
  uint64_t v10 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v9);

  if (!v10)
  {
    v11 = [v5 name];
    v12 = [v6 name];
    uint64_t v10 = [v11 localizedStandardCompare:v12];
  }
  return v10;
}

- (HFTVInputControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithValueSource_characteristicOptions_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTVInputControlItem.m", 66, @"%s is unavailable; use %@ instead",
    "-[HFTVInputControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFTVInputControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  v15[0] = &unk_26C0F7878;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() inputCharacteristicTypes];
  v15[1] = &unk_26C0F7890;
  v16[0] = v8;
  v9 = [(id)objc_opt_class() readOnlyOptionalInputCharacteristicTypes];
  v16[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v11 = [[HFControlItemCharacteristicOptions alloc] initWithCharacteristicTypesByUsage:v10];
  v14.receiver = self;
  v14.super_class = (Class)HFTVInputControlItem;
  v12 = [(HFControlItem *)&v14 initWithValueSource:v7 characteristicOptions:v11 displayResults:v6];

  return v12;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = [(HFControlItem *)self displayResults];
  id v8 = (void *)[v6 initWithValueSource:v5 displayResults:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_22_8);
}

uint64_t __57__HFTVInputControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 serviceType];
  if ([v3 isEqualToString:*MEMORY[0x263F0D738]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [v2 serviceType];
    uint64_t v4 = [v5 isEqualToString:*MEMORY[0x263F0D850]];
  }
  return v4;
}

- (id)readValueAndPopulateStandardResults
{
  v10.receiver = self;
  v10.super_class = (Class)HFTVInputControlItem;
  id v2 = [(HFControlItem *)&v10 readValueAndPopulateStandardResults];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = _HFLocalizedStringWithDefaultValue(@"HFControlShortTitleInputSelection", @"HFControlShortTitleInputSelection", 1);
  [v3 setObject:v4 forKeyedSubscript:@"title"];

  [v3 setObject:&unk_26C0F78A8 forKeyedSubscript:@"controlItemPurpose"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HFTVInputControlItem_readValueAndPopulateStandardResults__block_invoke;
  v8[3] = &unk_26408E098;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v2 flatMap:v8];

  return v6;
}

id __59__HFTVInputControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  uint64_t v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x263F0BF08]];
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HFTVInputControlItem;
  id v8 = [(HFControlItem *)&v31 valueForCharacteristicType:v6 inBatchReadResponse:v7];
  if (![v6 isEqualToString:*MEMORY[0x263F0C1D8]]
    && (uint64_t v9 = *MEMORY[0x263F0BF08], [v6 isEqualToString:*MEMORY[0x263F0BF08]])
    && ([v7 responseForCharacteristicType:v9],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        [v10 value],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [v7 responseForCharacteristicType:v9];
    v13 = [v12 valueWithExpectedClass:objc_opt_class()];

    if (v13)
    {
      objc_super v14 = [v7 servicesWithValue:v13 forCharacteristicType:v9];
      v15 = [v14 anyObject];

      v27 = v15;
      v16 = [v15 accessory];
      v17 = [v16 televisionProfiles];
      uint64_t v18 = [v17 firstObject];

      v19 = objc_msgSend(v15, "hf_childServices");
      v20 = objc_msgSend(v19, "na_filter:", &__block_literal_global_37_5);

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2;
      v28[3] = &unk_264095448;
      id v29 = v13;
      id v30 = v7;
      v21 = objc_msgSend(v20, "na_map:", v28);
      v22 = [v21 allObjects];
      v23 = (void *)v18;
      v24 = [(id)objc_opt_class() _inputSourceValueComparatorForTelevisionProfile:v18];
      id v25 = [v22 sortedArrayUsingComparator:v24];
    }
    else
    {
      id v25 = v8;
    }
  }
  else
  {
    id v25 = v8;
  }

  return v25;
}

uint64_t __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D738]];

  return v3;
}

id __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 name];
  id v5 = [v3 mediaSourceIdentifier];
  id v6 = v5;
  if (!v4)
  {
    objc_super v10 = HFLogForCategory(0);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    v12 = "No name for input source service: %@";
LABEL_17:
    _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
    goto LABEL_8;
  }
  if (v5)
  {
    uint64_t v7 = [v5 isEqualToNumber:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) responseForCharacteristicType:*MEMORY[0x263F0C140] inService:v3];
    uint64_t v9 = [v8 valueWithExpectedClass:objc_opt_class()];

    uint64_t v15 = MEMORY[0x263EF8330];
    id v16 = v3;
    objc_super v10 = v9;
    if (objc_msgSend(v16, "configurationState", v15, 3221225472, __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_38, &unk_264091060) == 2)
    {
      BOOL v11 = 1;
    }
    else if (v9)
    {
      BOOL v11 = [v9 integerValue] == 1;
    }
    else
    {
      BOOL v11 = 0;
    }
    v13 = +[HFTVInputControlItemValue valueWithInputName:v4 identifier:v6 isHidden:v11 isSelected:v7];

    goto LABEL_13;
  }
  objc_super v10 = HFLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    v12 = "No media source identifier for input source service: %@";
    goto LABEL_17;
  }
LABEL_8:
  v13 = 0;
LABEL_13:

  return v13;
}

uint64_t __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_38(uint64_t a1)
{
  if ([*(id *)(a1 + 32) configurationState] == 2) {
    return 1;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return [(id)result integerValue] == 1;
  }
  return result;
}

- (id)writeValue:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
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

  if (v7)
  {
    id v8 = +[HFServiceTreeTypePredicate predicateWithServiceType:*MEMORY[0x263F0D850]];
    uint64_t v9 = [HFServiceStateCharacteristicRecipe alloc];
    objc_super v10 = [(HFServiceStateCharacteristicRecipe *)v9 initWithCharacteristicType:*MEMORY[0x263F0BF08] servicePredicate:v8 required:1];
    BOOL v11 = [(HFControlItem *)self valueSource];
    id v16 = v10;
    v12 = [v7 identifier];
    v17[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_super v14 = [v11 writeValuesForCharacteristicRecipes:v13];
  }
  else
  {
    objc_super v14 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v14;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (void).cxx_destruct
{
}

@end