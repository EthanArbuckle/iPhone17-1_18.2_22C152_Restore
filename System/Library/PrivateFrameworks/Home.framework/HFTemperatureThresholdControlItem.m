@interface HFTemperatureThresholdControlItem
+ (id)readOnlyCharacteristicTypes;
- (HFTemperatureThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (id)numberValueFormatter;
- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3;
- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3;
@end

@implementation HFTemperatureThresholdControlItem

- (HFTemperatureThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v9 = (void *)*MEMORY[0x263F0C550];
  if ([v8 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C550] valueSource:v6]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  if (!v11)
  {
    v12 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "This thermostat doesn't have a writable HMCharacteristicTypeTargetTemperature characteristic, which is required in the spec", buf, 2u);
    }
  }
  v13 = objc_opt_class();
  v14 = (void *)*MEMORY[0x263F0C1A0];
  if ([v13 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C1A0] valueSource:v6]) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  v17 = objc_opt_class();
  v18 = (void *)*MEMORY[0x263F0C020];
  if ([v17 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C020] valueSource:v6]) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x263EFFA08];
  id v21 = v19;
  v22 = objc_msgSend(v20, "na_setWithSafeObject:", v11);
  v25.receiver = self;
  v25.super_class = (Class)HFTemperatureThresholdControlItem;
  v23 = [(HFRangeControlItem *)&v25 initWithValueSource:v6 targetCharacteristicTypes:v22 minimumCharacteristicType:v16 maximumCharacteristicType:v21 displayResults:v7];

  return v23;
}

+ (id)readOnlyCharacteristicTypes
{
  if (_MergedGlobals_4 != -1) {
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_82_0);
  }
  v2 = (void *)qword_2676B6A50;
  return v2;
}

- (id)numberValueFormatter
{
  v2 = +[HFFormatterManager sharedInstance];
  v3 = [v2 temperatureFormatter];

  [v3 setInputIsCelsius:1];
  return v3;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  v3 = [(HFRangeControlItem *)self targetCharacteristicTypes];
  v4 = [v3 anyObject];

  return v4;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C4D8]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if ([v7 integerValue] == 3
      && ([(HFRangeControlItem *)self minimumCharacteristicType],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      v10 = [(HFRangeControlItem *)self maximumCharacteristicType];

      if (v10) {
        unint64_t v11 = 2;
      }
      else {
        unint64_t v11 = 1;
      }
    }
    else
    {
      unint64_t v11 = 1;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

void __64__HFTemperatureThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C110];
  v5[0] = *MEMORY[0x263F0C4D8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F0C068];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_2676B6A50;
  qword_2676B6A50 = v3;
}

@end