@interface HFIncrementalStateControlItem
+ (Class)valueClass;
+ (id)na_identity;
+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4;
+ (id)readOnlyCharacteristicTypes;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 incrementalAndPrimaryCharacteristicType:(id)a4 displayResults:(id)a5;
- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 primaryStateControlItem:(id)a4 incrementalCharacteristicType:(id)a5 displayResults:(id)a6;
- (HFPrimaryStateWriter)primaryStateControlItem;
- (NSNumber)stepValue;
- (NSString)incrementalCharacteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)toggleValue;
- (id)updateWithOptions:(id)a3;
- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writeValue:(id)a3;
@end

@implementation HFIncrementalStateControlItem

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 stepValue];
}

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 incrementalCharacteristicType];
}

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 primaryStateControlItem];
}

- (NSNumber)stepValue
{
  v3 = [(HFControlItem *)self valueSource];
  v4 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
  v5 = [v3 metadataForCharacteristicType:v4];

  v6 = [v5 stepValue];
  v7 = objc_msgSend(v5, "hf_percentageForCharacteristicValue:", v6);

  return (NSNumber *)v7;
}

- (NSString)incrementalCharacteristicType
{
  return self->_incrementalCharacteristicType;
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
  if (([v6 isEqualToString:v8] & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = [v7 allResponsesForCharacteristicType:v6];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
LABEL_6:
    v26.receiver = self;
    v26.super_class = (Class)HFIncrementalStateControlItem;
    id v21 = [(HFControlItem *)&v26 valueForCharacteristicType:v6 inBatchReadResponse:v7];
    goto LABEL_11;
  }
  v11 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
  v12 = [v11 characteristicOptions];
  v13 = [v12 allCharacteristicTypes];
  v14 = [v7 allResponsesForCharacteristicTypes:v13];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke;
  v29[3] = &unk_26408FAC8;
  v29[4] = self;
  v15 = objc_msgSend(v14, "na_filter:", v29);
  v16 = objc_msgSend(v15, "na_map:", &__block_literal_global_38);
  v17 = [v7 allResponsesForCharacteristicType:v6];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_3;
  v27[3] = &unk_26408FAC8;
  id v18 = v16;
  id v28 = v18;
  v19 = objc_msgSend(v17, "na_filter:", v27);
  if ([v19 count])
  {
    v20 = +[HFCharacteristicBatchReadResponse aggregatedReadResponseFromResponses:v19 withAggregationPolicy:0];
    id v21 = [v20 value];
  }
  else
  {
    v20 = [(HFControlItem *)self metadataForCharacteristicType:v6];
    uint64_t v22 = [v20 minimumValue];
    v23 = (void *)v22;
    v24 = &unk_26C0F6258;
    if (v22) {
      v24 = (void *)v22;
    }
    id v21 = v24;
  }
LABEL_11:

  return v21;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

void __44__HFIncrementalStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __44__HFIncrementalStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)qword_26AB2E768;
  qword_26AB2E768 = v1;
}

id __44__HFIncrementalStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F58198];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HFIncrementalStateControlItem;
  v2 = objc_msgSendSuper2(&v9, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  v4 = [v3 appendCharacteristic:&__block_literal_global_60];
  v5 = [v4 appendCharacteristic:&__block_literal_global_63_0];
  id v6 = (id)[v5 appendCharacteristic:&__block_literal_global_66_0];

  id v7 = [v3 build];

  return v7;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __44__HFIncrementalStateControlItem_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __44__HFIncrementalStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, block);
  }
  uint64_t v1 = (void *)qword_26AB2E768;
  return v1;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFIncrementalStateControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
    v8 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
    objc_super v9 = [v8 characteristicOptions];
    uint64_t v10 = (void *)[v7 copyWithCharacteristicOptions:v9 valueSource:v6];

    id v11 = objc_alloc((Class)objc_opt_class());
    v12 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
    v13 = [(HFControlItem *)self displayResults];
    v14 = (void *)[v11 initWithValueSource:v6 primaryStateControlItem:v10 incrementalCharacteristicType:v12 displayResults:v13];

    [v14 copyLatestResultsFromItem:self];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 primaryStateControlItem:(id)a4 incrementalCharacteristicType:(id)a5 displayResults:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(id)objc_opt_class() optionsForPrimaryStateControlItem:v11 incrementalCharacteristicType:v12];
  v21.receiver = self;
  v21.super_class = (Class)HFIncrementalStateControlItem;
  v15 = [(HFControlItem *)&v21 initWithValueSource:v10 characteristicOptions:v14 displayResults:v13];

  if (v15)
  {
    uint64_t v16 = [v11 copyWithValueSource:v10];
    primaryStateControlItem = v15->_primaryStateControlItem;
    v15->_primaryStateControlItem = (HFPrimaryStateWriter *)v16;

    uint64_t v18 = [v12 copy];
    incrementalCharacteristicType = v15->_incrementalCharacteristicType;
    v15->_incrementalCharacteristicType = (NSString *)v18;
  }
  return v15;
}

+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [v5 setWithObject:a4];
  v8 = [v6 characteristicOptions];

  objc_super v9 = [v8 optionsByAddingCharacteristicTypes:v7 forUsage:0];

  return v9;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];

  if (v5)
  {
    id v6 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
    char v7 = [v6 canCopyWithCharacteristicOptions:v4];
  }
  else
  {
    char v7 = 1;
  }
  v8 = [v4 objectForKeyedSubscript:&unk_26C0F6240];
  objc_super v9 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
  char v10 = [v8 containsObject:v9];

  return v7 & v10;
}

BOOL __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 value];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) primaryStateControlItem];
    id v6 = [v3 characteristic];
    char v7 = [v6 characteristicType];
    v14 = v7;
    v8 = [v3 value];
    v15[0] = v8;
    objc_super v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    char v10 = [v5 valueForCharacteristicValues:v9];
    uint64_t v11 = [v10 integerValue];

    BOOL v12 = v11 == 2;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  v5 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
  id v6 = [v5 valueForCharacteristicValues:v4];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 2)
  {
    v8 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
    objc_super v9 = [v4 objectForKeyedSubscript:v8];

    char v10 = [(HFControlItem *)self valueSource];
    uint64_t v11 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
    BOOL v12 = [v10 metadataForCharacteristicType:v11];

    if (v9)
    {
      id v13 = objc_msgSend(v12, "hf_percentageForCharacteristicValue:", v9);
    }
    else
    {
      id v13 = &unk_26C0F7F68;
    }
  }
  else
  {
    id v13 = &unk_26C0F7F58;
  }

  return v13;
}

- (id)updateWithOptions:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
  id v6 = [v5 updateWithOptions:v4];

  uint64_t v7 = (void *)MEMORY[0x263F58190];
  v13.receiver = self;
  v13.super_class = (Class)HFIncrementalStateControlItem;
  v8 = [(HFItem *)&v13 updateWithOptions:v4];

  v14[0] = v8;
  v14[1] = v6;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  char v10 = [v7 combineAllFutures:v9];
  uint64_t v11 = [v10 flatMap:&__block_literal_global_33_0];

  return v11;
}

- (HFPrimaryStateWriter)primaryStateControlItem
{
  return self->_primaryStateControlItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementalCharacteristicType, 0);
  objc_storeStrong((id *)&self->_primaryStateControlItem, 0);
}

id __51__HFIncrementalStateControlItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [a2 firstObject];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

uint64_t __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  id v4 = [v3 service];
  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 incrementalAndPrimaryCharacteristicType:(id)a4 displayResults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 metadataForCharacteristicType:v9];
  uint64_t v12 = objc_opt_class();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke_3;
  v18[3] = &unk_26408FA78;
  id v19 = v11;
  id v13 = v11;
  v14 = +[HFValueTransformer transformerForValueClass:v12 transformBlock:&__block_literal_global_37 reverseTransformBlock:v18];
  v15 = [[HFPrimaryStateControlItem alloc] initWithValueSource:v10 characteristicType:v9 valueTransformer:v14 displayResults:0];
  uint64_t v16 = [(HFIncrementalStateControlItem *)self initWithValueSource:v10 primaryStateControlItem:v15 incrementalCharacteristicType:v9 displayResults:v8];

  return v16;
}

id __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = NSNumber;
    if ([a2 integerValue] < 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    v5 = [v3 numberWithInteger:v4];
  }
  else
  {
    v5 = &unk_26C0F6228;
  }
  return v5;
}

id __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3 == 2)
  {
    v5 = [v4 maximumValue];
    uint64_t v6 = v5;
    uint64_t v7 = &unk_26C0F7F48;
  }
  else
  {
    v5 = [v4 minimumValue];
    uint64_t v6 = v5;
    uint64_t v7 = &unk_26C0F7F58;
  }
  if (!v5) {
    v5 = v7;
  }
  id v8 = v5;

  return v8;
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithValueSource_primaryStateControlItem_incrementalCharacteristicType_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFIncrementalStateControlItem.m", 79, @"%s is unavailable; use %@ instead",
    "-[HFIncrementalStateControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)toggleValue
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v4 = [v3 homeManager];
  [v4 hasOptedToHH2];
  v5 = objc_opt_new();

  uint64_t v6 = [(HFControlItem *)self valueSource];
  [v6 beginTransactionWithReason:@"HFIncrementalStateControlItem-Toggle" readPolicy:v5 logger:0];

  uint64_t v7 = [(HFControlItem *)self valueSource];
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
  id v10 = [v8 setWithObject:v9];
  uint64_t v11 = [v7 readValuesForCharacteristicTypes:v10];
  v20[0] = v11;
  uint64_t v12 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
  id v13 = [v12 readValueAndPopulateStandardResults];
  v20[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

  v15 = [MEMORY[0x263F58190] combineAllFutures:v14];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__HFIncrementalStateControlItem_toggleValue__block_invoke;
  v19[3] = &unk_26408FAA0;
  v19[4] = self;
  uint64_t v16 = [v15 flatMap:v19];

  v17 = [(HFControlItem *)self valueSource];
  [v17 commitTransactionWithReason:@"HFIncrementalStateControlItem-Toggle"];

  return v16;
}

id __44__HFIncrementalStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v3 objectAtIndexedSubscript:1];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"value"];
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) incrementalCharacteristicType];
    id v8 = [v4 responseForCharacteristicType:v7];
    id v9 = [v8 value];

    id v10 = [*(id *)(a1 + 32) primaryStateControlItem];
    uint64_t v11 = [v10 characteristicOptions];
    uint64_t v12 = [v11 objectForKeyedSubscript:&unk_26C0F6240];
    id v13 = [*(id *)(a1 + 32) incrementalCharacteristicType];
    char v14 = [v12 containsObject:v13];

    if ((v14 & 1) != 0
      || [v6 integerValue] != 1
      || !v9
      || ([v9 floatValue], v15 >= 0.00000011921))
    {
      v17 = [*(id *)(a1 + 32) primaryStateControlItem];
      uint64_t v18 = [v6 integerValue];
      if (v18 == 2) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = 2 * (v18 == 1);
      }
      v20 = [v17 writePrimaryState:v19];

      goto LABEL_13;
    }
    uint64_t v16 = [*(id *)(a1 + 32) writeValue:&unk_26C0F82F0];
  }
  else
  {
    objc_super v21 = (void *)MEMORY[0x263F58190];
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    uint64_t v16 = [v21 futureWithError:v9];
  }
  v20 = (void *)v16;
LABEL_13:

  return v20;
}

- (id)writeValue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFIncrementalStateControlItem;
  id v3 = [(HFControlItem *)&v5 writeValue:a3];
  return v3;
}

id __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 characteristic];
  id v3 = [v2 service];
  uint64_t v4 = [v3 uniqueIdentifier];

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedDisp.isa, v4);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(HFControlItem *)self valueSource];
    uint64_t v6 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
    uint64_t v7 = [v5 metadataForCharacteristicType:v6];

    [v4 floatValue];
    id v9 = objc_msgSend(v7, "hf_characteristicValueForPercentage:", v8);
    if (v9)
    {
      v24 = v7;
      [v4 floatValue];
      float v11 = v10;
      uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
      id v13 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
      char v14 = [v13 characteristicOptions];
      float v15 = [v14 objectForKeyedSubscript:&unk_26C0F6240];
      uint64_t v16 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
      char v17 = [v15 containsObject:v16];

      if ((v17 & 1) == 0)
      {
        if (v11 <= 0.00000011921) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 2;
        }
        uint64_t v19 = [(HFIncrementalStateControlItem *)self primaryStateControlItem];
        v20 = [NSNumber numberWithInteger:v18];
        objc_super v21 = [v19 characteristicValuesForValue:v20];
        [v12 addEntriesFromDictionary:v21];
      }
      uint64_t v22 = [(HFIncrementalStateControlItem *)self incrementalCharacteristicType];
      [v12 setObject:v9 forKeyedSubscript:v22];

      uint64_t v7 = v24;
    }
    else
    {
      NSLog(&cfstr_CouldNotConver.isa, v4, v7);
      uint64_t v12 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA78];
  }

  return v12;
}

+ (id)readOnlyCharacteristicTypes
{
  return (id)[MEMORY[0x263EFFA08] set];
}

@end