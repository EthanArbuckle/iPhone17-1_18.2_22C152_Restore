@interface HFTemperatureUnitControlItem
+ (Class)valueClass;
- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5;
- (NSString)temperatureUnitCharacteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFTemperatureUnitControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5
{
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 setWithObject:v8];
  v13 = +[HFControlItemCharacteristicOptions optionsWithReadWriteCharacteristicTypes:v12];

  v18.receiver = self;
  v18.super_class = (Class)HFTemperatureUnitControlItem;
  v14 = [(HFControlItem *)&v18 initWithValueSource:v11 characteristicOptions:v13 displayResults:v10];

  if (v14)
  {
    uint64_t v15 = [v8 copy];
    temperatureUnitCharacteristicType = v14->_temperatureUnitCharacteristicType;
    v14->_temperatureUnitCharacteristicType = (NSString *)v15;
  }
  return v14;
}

- (void).cxx_destruct
{
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  v5 = [(HFTemperatureUnitControlItem *)self temperatureUnitCharacteristicType];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (NSString)temperatureUnitCharacteristicType
{
  return self->_temperatureUnitCharacteristicType;
}

- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithValueSource_characteristicType_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTemperatureUnitControlItem.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFTemperatureUnitControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    id v8 = [(HFTemperatureUnitControlItem *)self temperatureUnitCharacteristicType];
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

- (id)characteristicValuesForValue:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFTemperatureUnitControlItem *)self temperatureUnitCharacteristicType];
  id v8 = v5;
  v9[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

@end