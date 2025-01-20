@interface HFRangeControlItem
+ (BOOL)_hasWritableCharacteristicsOfType:(id)a3 valueSource:(id)a4;
+ (Class)valueClass;
+ (id)readOnlyCharacteristicTypes;
- (HFNumberValueConstraints)maximumValueConstraints;
- (HFNumberValueConstraints)minimumValueConstraints;
- (HFNumberValueConstraints)targetValueConstraints;
- (HFRangeControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFRangeControlItem)initWithValueSource:(id)a3 targetCharacteristicTypes:(id)a4 minimumCharacteristicType:(id)a5 maximumCharacteristicType:(id)a6 displayResults:(id)a7;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSSet)targetCharacteristicTypes;
- (NSString)maximumCharacteristicType;
- (NSString)minimumCharacteristicType;
- (id)_maximumCharacteristicTypeMetadata;
- (id)_minimumCharacteristicTypeMetadata;
- (id)_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:(id)a3;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)maximumCharacteristicTypeStepValue;
- (id)minimumCharacteristicTypeStepValue;
- (id)numberValueFormatter;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3;
@end

@implementation HFRangeControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

uint64_t __68__HFRangeControlItem__hasWritableCharacteristicsOfType_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isReadable")) {
    uint64_t v3 = objc_msgSend(v2, "hf_isWritable");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (BOOL)_hasWritableCharacteristicsOfType:(id)a3 valueSource:(id)a4
{
  v4 = [a4 allCharacteristicsForCharacteristicType:a3];
  if ([v4 count]) {
    char v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_72);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (HFRangeControlItem)initWithValueSource:(id)a3 targetCharacteristicTypes:(id)a4 minimumCharacteristicType:(id)a5 maximumCharacteristicType:(id)a6 displayResults:(id)a7
{
  v32[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13 && [v13 count])
  {
    id obj = a6;
    v17 = [MEMORY[0x263EFF9C0] set];
    id v29 = v14;
    objc_msgSend(v17, "na_safeAddObject:", v14);
    id v28 = v15;
    objc_msgSend(v17, "na_safeAddObject:", v15);
    [v17 unionSet:v13];
    v18 = [HFControlItemCharacteristicOptions alloc];
    v31[0] = &unk_26C0F6828;
    v31[1] = &unk_26C0F6840;
    v32[0] = v17;
    v19 = [(id)objc_opt_class() readOnlyCharacteristicTypes];
    v32[1] = v19;
    [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    v21 = id v20 = v12;
    v22 = [(HFControlItemCharacteristicOptions *)v18 initWithCharacteristicTypesByUsage:v21];

    id v12 = v20;
    v30.receiver = self;
    v30.super_class = (Class)HFRangeControlItem;
    v23 = [(HFControlItem *)&v30 initWithValueSource:v20 characteristicOptions:v22 displayResults:v16];
    p_isa = (id *)&v23->super.super.super.isa;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_targetCharacteristicTypes, a4);
      objc_storeStrong(p_isa + 11, a5);
      objc_storeStrong(p_isa + 12, obj);
    }
    self = p_isa;

    v25 = self;
    id v15 = v28;
    id v14 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

id __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "allCharacteristicTypes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = [*(id *)(a1 + 32) responseForCharacteristicType:v8];
        v10 = [v9 value];
        [v2 setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v11 = [*(id *)(a1 + 40) valueForCharacteristicValues:v2];

  return v11;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItem *)self latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"characteristicValuesByType"];
  v7 = v6;
  if (!v6) {
    uint64_t v6 = (void *)MEMORY[0x263EFFA78];
  }
  uint64_t v8 = (void *)[v6 mutableCopy];

  [v8 addEntriesFromDictionary:v4];
  v9 = objc_alloc_init(HFRangeControlItemValue);
  v10 = [(HFRangeControlItem *)self targetCharacteristicTypeWithCharacteristicValuesKeyedByType:v8];
  if (v10)
  {
    v11 = [(HFRangeControlItem *)self targetCharacteristicTypes];
    char v12 = [v11 containsObject:v10];

    if ((v12 & 1) == 0)
    {
      long long v13 = [(HFRangeControlItem *)self targetCharacteristicTypes];
      NSLog(&cfstr_Hfrangecontrol_1.isa, v10, v13, self);
    }
    long long v14 = [v4 objectForKeyedSubscript:v10];
    [(HFRangeControlItemValue *)v9 setTargetValue:v14];
  }
  long long v15 = [(HFRangeControlItem *)self minimumCharacteristicType];

  if (v15)
  {
    long long v16 = [(HFRangeControlItem *)self minimumCharacteristicType];
    v17 = [v4 objectForKeyedSubscript:v16];
    [(HFRangeControlItemValue *)v9 setMinimumValue:v17];
  }
  uint64_t v18 = [(HFRangeControlItem *)self maximumCharacteristicType];

  if (v18)
  {
    v19 = [(HFRangeControlItem *)self maximumCharacteristicType];
    id v20 = [v4 objectForKeyedSubscript:v19];
    [(HFRangeControlItemValue *)v9 setMaximumValue:v20];
  }
  [(HFRangeControlItemValue *)v9 setMode:[(HFRangeControlItem *)self rangeModeWithCharacteristicValuesKeyedByType:v8]];

  return v9;
}

- (NSString)minimumCharacteristicType
{
  return self->_minimumCharacteristicType;
}

- (NSString)maximumCharacteristicType
{
  return self->_maximumCharacteristicType;
}

- (NSSet)targetCharacteristicTypes
{
  return self->_targetCharacteristicTypes;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HFRangeControlItem;
  uint64_t v5 = [(HFControlItem *)&v20 resultsForBatchReadResponse:v4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"preferLiveWritesDuringInteraction"];
  [v6 setObject:&unk_26C0F6840 forKeyedSubscript:@"preferredInteractionFidelity"];
  v7 = [(HFRangeControlItem *)self numberValueFormatter];
  if (v7)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    long long v16 = __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke;
    v17 = &unk_264091A08;
    id v18 = v4;
    v19 = self;
    uint64_t v8 = __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke((uint64_t)&v14);
    if (v8)
    {
      v9 = [HFNumberRangeFormatter alloc];
      v10 = -[HFNumberRangeFormatter initWithNumberFormatter:](v9, "initWithNumberFormatter:", v7, v14, v15, v16, v17);
      v11 = [v8 numberRange];
      char v12 = [(HFNumberRangeFormatter *)v10 stringForObjectValue:v11];
      [v6 setObject:v12 forKeyedSubscript:@"description"];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumCharacteristicType, 0);
  objc_storeStrong((id *)&self->_minimumCharacteristicType, 0);
  objc_storeStrong((id *)&self->_targetCharacteristicTypes, 0);
}

- (HFRangeControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  uint64_t v8 = NSStringFromSelector(sel_initWithValueSource_targetCharacteristicTypes_minimumCharacteristicType_maximumCharacteristicType_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFRangeControlItem.m", 79, @"%s is unavailable; use %@ instead",
    "-[HFRangeControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    uint64_t v8 = [(HFRangeControlItem *)self targetCharacteristicTypes];
    v9 = [(HFRangeControlItem *)self minimumCharacteristicType];
    v10 = [(HFRangeControlItem *)self maximumCharacteristicType];
    v11 = [(HFControlItem *)self displayResults];
    char v12 = (void *)[v7 initWithValueSource:v6 targetCharacteristicTypes:v8 minimumCharacteristicType:v9 maximumCharacteristicType:v10 displayResults:v11];

    [v12 copyLatestResultsFromItem:self];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  id v6 = [(HFItem *)self latestResults];
  id v7 = [v6 objectForKeyedSubscript:@"characteristicValuesByType"];
  uint64_t v8 = [(HFRangeControlItem *)self targetCharacteristicTypeWithCharacteristicValuesKeyedByType:v7];

  v9 = [v4 targetValue];

  if (v9 && v8)
  {
    v10 = [v4 targetValue];
    [v5 setObject:v10 forKey:v8];
  }
  uint64_t v11 = [v4 minimumValue];
  if (v11)
  {
    char v12 = (void *)v11;
    long long v13 = [(HFRangeControlItem *)self minimumCharacteristicType];

    if (v13)
    {
      uint64_t v14 = [v4 minimumValue];
      uint64_t v15 = [(HFRangeControlItem *)self minimumCharacteristicType];
      [v5 setObject:v14 forKey:v15];
    }
  }
  uint64_t v16 = [v4 maximumValue];
  if (v16)
  {
    v17 = (void *)v16;
    id v18 = [(HFRangeControlItem *)self maximumCharacteristicType];

    if (v18)
    {
      v19 = [v4 maximumValue];
      objc_super v20 = [(HFRangeControlItem *)self maximumCharacteristicType];
      [v5 setObject:v19 forKey:v20];
    }
  }
  v21 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v5];

  return v21;
}

- (HFNumberValueConstraints)minimumValueConstraints
{
  id v2 = [(HFRangeControlItem *)self _minimumCharacteristicTypeMetadata];
  uint64_t v3 = objc_msgSend(v2, "hf_numericValueConstraints");

  return (HFNumberValueConstraints *)v3;
}

- (HFNumberValueConstraints)maximumValueConstraints
{
  id v2 = [(HFRangeControlItem *)self _maximumCharacteristicTypeMetadata];
  uint64_t v3 = objc_msgSend(v2, "hf_numericValueConstraints");

  return (HFNumberValueConstraints *)v3;
}

- (HFNumberValueConstraints)targetValueConstraints
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"characteristicValuesByType"];

  uint64_t v5 = [(HFRangeControlItem *)self _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:v4];
  id v6 = objc_msgSend(v5, "hf_numericValueConstraints");

  return (HFNumberValueConstraints *)v6;
}

- (NSNumber)minimumValue
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"characteristicValuesByType"];

  if ([(HFRangeControlItem *)self rangeModeWithCharacteristicValuesKeyedByType:v4] == 2)
  {
    uint64_t v5 = [(HFRangeControlItem *)self _minimumCharacteristicTypeMetadata];
    id v6 = [v5 minimumValue];

    id v7 = [(HFRangeControlItem *)self _maximumCharacteristicTypeMetadata];
    uint64_t v8 = [v7 minimumValue];

    if ([v6 compare:v8] == -1) {
      v9 = v8;
    }
    else {
      v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    id v6 = [(HFRangeControlItem *)self _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:v4];
    id v10 = [v6 minimumValue];
  }

  return (NSNumber *)v10;
}

- (NSNumber)maximumValue
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"characteristicValuesByType"];

  if ([(HFRangeControlItem *)self rangeModeWithCharacteristicValuesKeyedByType:v4] == 2)
  {
    uint64_t v5 = [(HFRangeControlItem *)self _minimumCharacteristicTypeMetadata];
    id v6 = [v5 maximumValue];

    id v7 = [(HFRangeControlItem *)self _maximumCharacteristicTypeMetadata];
    uint64_t v8 = [v7 maximumValue];

    if ([v6 compare:v8] == 1) {
      v9 = v8;
    }
    else {
      v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    id v6 = [(HFRangeControlItem *)self _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:v4];
    id v10 = [v6 maximumValue];
  }

  return (NSNumber *)v10;
}

- (NSNumber)stepValue
{
  uint64_t v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"characteristicValuesByType"];

  if ([(HFRangeControlItem *)self rangeModeWithCharacteristicValuesKeyedByType:v4] == 2)
  {
    uint64_t v5 = [(HFRangeControlItem *)self minimumCharacteristicTypeStepValue];
    id v6 = [(HFRangeControlItem *)self maximumCharacteristicTypeStepValue];
    if ([v5 compare:v6] == 1) {
      id v7 = v6;
    }
    else {
      id v7 = v5;
    }
    id v8 = v7;
  }
  else
  {
    uint64_t v5 = [(HFRangeControlItem *)self _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:v4];
    id v8 = [v5 stepValue];
  }

  return (NSNumber *)v8;
}

- (id)maximumCharacteristicTypeStepValue
{
  id v2 = [(HFRangeControlItem *)self _maximumCharacteristicTypeMetadata];
  uint64_t v3 = [v2 stepValue];

  return v3;
}

- (id)minimumCharacteristicTypeStepValue
{
  id v2 = [(HFRangeControlItem *)self _minimumCharacteristicTypeMetadata];
  uint64_t v3 = [v2 stepValue];

  return v3;
}

+ (id)readOnlyCharacteristicTypes
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFRangeControlItem.m", 276, @"%s is an abstract method that must be overriden by subclass %@", "+[HFRangeControlItem readOnlyCharacteristicTypes]", objc_opt_class() object file lineNumber description];

  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

- (id)numberValueFormatter
{
  return 0;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFRangeControlItem.m", 287, @"%s is an abstract method that must be overriden by subclass %@", "-[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFRangeControlItem.m", 293, @"%s is an abstract method that must be overriden by subclass %@", "-[HFRangeControlItem targetCharacteristicTypeWithCharacteristicValuesKeyedByType:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_minimumCharacteristicTypeMetadata
{
  uint64_t v3 = [(HFControlItem *)self valueSource];
  id v4 = [(HFRangeControlItem *)self minimumCharacteristicType];
  uint64_t v5 = [v3 metadataForCharacteristicType:v4];

  return v5;
}

- (id)_maximumCharacteristicTypeMetadata
{
  uint64_t v3 = [(HFControlItem *)self valueSource];
  id v4 = [(HFRangeControlItem *)self maximumCharacteristicType];
  uint64_t v5 = [v3 metadataForCharacteristicType:v4];

  return v5;
}

- (id)_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4 = [(HFRangeControlItem *)self targetCharacteristicTypeWithCharacteristicValuesKeyedByType:a3];
  if (v4)
  {
    uint64_t v5 = [(HFControlItem *)self valueSource];
    id v6 = [v5 metadataForCharacteristicType:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end