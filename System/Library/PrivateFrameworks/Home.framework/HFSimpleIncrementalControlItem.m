@interface HFSimpleIncrementalControlItem
+ (Class)valueClass;
- (HFSimpleIncrementalControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFSimpleIncrementalControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)stepValue;
- (NSString)incrementalCharacteristicType;
- (id)_metadata;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writeValue:(id)a3;
@end

@implementation HFSimpleIncrementalControlItem

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  v5 = [(HFSimpleIncrementalControlItem *)self incrementalCharacteristicType];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSString)incrementalCharacteristicType
{
  return self->_incrementalCharacteristicType;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFSimpleIncrementalControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5
{
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 setWithObject:v8];
  v13 = +[HFControlItemCharacteristicOptions optionsWithReadWriteCharacteristicTypes:v12];
  v18.receiver = self;
  v18.super_class = (Class)HFSimpleIncrementalControlItem;
  v14 = [(HFControlItem *)&v18 initWithValueSource:v11 characteristicOptions:v13 displayResults:v10];

  if (v14)
  {
    uint64_t v15 = [v8 copy];
    incrementalCharacteristicType = v14->_incrementalCharacteristicType;
    v14->_incrementalCharacteristicType = (NSString *)v15;
  }
  return v14;
}

- (void).cxx_destruct
{
}

- (HFSimpleIncrementalControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithValueSource_characteristicOptions_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSimpleIncrementalControlItem.m", 38, @"%s is unavailable; use %@ instead",
    "-[HFSimpleIncrementalControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    id v8 = [(HFSimpleIncrementalControlItem *)self incrementalCharacteristicType];
    v9 = [(HFControlItem *)self displayResults];
    id v10 = (void *)[v7 initWithValueSource:v6 characteristicType:v8 displayResults:v9];

    [v10 copyLatestResultsFromItem:self];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)writeValue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFSimpleIncrementalControlItem;
  v3 = [(HFControlItem *)&v5 writeValue:a3];
  return v3;
}

- (id)characteristicValuesForValue:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(HFSimpleIncrementalControlItem *)self incrementalCharacteristicType];
  v9 = v5;
  v10[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v6];

  return v7;
}

- (id)_metadata
{
  v3 = [(HFControlItem *)self valueSource];
  id v4 = [(HFSimpleIncrementalControlItem *)self incrementalCharacteristicType];
  objc_super v5 = [v3 metadataForCharacteristicType:v4];

  return v5;
}

- (NSNumber)minValue
{
  v2 = [(HFSimpleIncrementalControlItem *)self _metadata];
  v3 = [v2 minimumValue];

  return (NSNumber *)v3;
}

- (NSNumber)maxValue
{
  v2 = [(HFSimpleIncrementalControlItem *)self _metadata];
  v3 = [v2 maximumValue];

  return (NSNumber *)v3;
}

- (NSNumber)stepValue
{
  v2 = [(HFSimpleIncrementalControlItem *)self _metadata];
  v3 = [v2 stepValue];

  return (NSNumber *)v3;
}

@end