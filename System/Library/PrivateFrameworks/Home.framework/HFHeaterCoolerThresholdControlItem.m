@interface HFHeaterCoolerThresholdControlItem
+ (id)readOnlyCharacteristicTypes;
- (HFHeaterCoolerThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (id)numberValueFormatter;
- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3;
- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3;
@end

@implementation HFHeaterCoolerThresholdControlItem

- (HFHeaterCoolerThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFFA08] set];
  v9 = objc_opt_class();
  v10 = (void *)*MEMORY[0x263F0C1A0];
  int v11 = [v9 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C1A0] valueSource:v6];
  v12 = objc_opt_class();
  v13 = (void *)*MEMORY[0x263F0C020];
  int v14 = [v12 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C020] valueSource:v6];
  if (v11) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (v11)
    {
      v16 = (void *)MEMORY[0x263EFFA08];
      v17 = v10;
    }
    else
    {
      if (!v14)
      {
        id v18 = 0;
        id v19 = 0;
        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x263EFFA08];
      v17 = v13;
    }
    uint64_t v20 = [v16 setWithObject:v17];
    id v18 = 0;
    id v19 = 0;
  }
  else
  {
    id v18 = v10;
    id v19 = v13;
    uint64_t v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v18, v19, 0);
  }

  v8 = (void *)v20;
LABEL_12:
  v23.receiver = self;
  v23.super_class = (Class)HFHeaterCoolerThresholdControlItem;
  v21 = [(HFRangeControlItem *)&v23 initWithValueSource:v6 targetCharacteristicTypes:v8 minimumCharacteristicType:v18 maximumCharacteristicType:v19 displayResults:v7];

  return v21;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_2676B6A58 != -1) {
    dispatch_once(&qword_2676B6A58, &__block_literal_global_94);
  }
  v2 = (void *)qword_2676B6A60;
  return v2;
}

void __65__HFHeaterCoolerThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BEF8];
  v6[0] = *MEMORY[0x263F0C4D0];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C058];
  v6[2] = *MEMORY[0x263F0C110];
  v6[3] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_2676B6A60;
  qword_2676B6A60 = v4;
}

- (id)numberValueFormatter
{
  uint64_t v2 = +[HFFormatterManager sharedInstance];
  v3 = [v2 temperatureFormatter];

  [v3 setInputIsCelsius:1];
  return v3;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C4D0]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if ([v7 integerValue]
      || ([(HFRangeControlItem *)self minimumCharacteristicType],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      unint64_t v8 = 1;
    }
    else
    {
      v10 = (void *)v9;
      int v11 = [(HFRangeControlItem *)self maximumCharacteristicType];

      if (v11) {
        unint64_t v8 = 2;
      }
      else {
        unint64_t v8 = 1;
      }
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C4D0]];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_20;
  }
  unint64_t v8 = objc_opt_class();
  uint64_t v9 = (void *)*MEMORY[0x263F0C1A0];
  v10 = [(HFControlItem *)self valueSource];
  int v11 = [v8 _hasWritableCharacteristicsOfType:v9 valueSource:v10];

  v12 = objc_opt_class();
  v13 = (void *)*MEMORY[0x263F0C020];
  int v14 = [(HFControlItem *)self valueSource];
  int v15 = [v12 _hasWritableCharacteristicsOfType:v13 valueSource:v14];

  uint64_t v16 = [v7 integerValue];
  if (v16 == 1)
  {
    if (!v11)
    {
      id v18 = HFLogForCategory(0x2AuLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      __int16 v27 = 0;
      id v19 = "Heater/Cooler service is in the state HMCharacteristicValueTargetHeaterCoolerStateHeat, but has no heating t"
            "hreshold characteristic";
      uint64_t v20 = (uint8_t *)&v27;
LABEL_32:
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
      goto LABEL_19;
    }
LABEL_17:
    id v17 = v9;
    goto LABEL_27;
  }
  if (v16 != 2)
  {
    if ((v11 & 1) == 0)
    {
      objc_super v23 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v23, OS_LOG_TYPE_ERROR, "A heater/cooler is in Auto mode, but it doesn't have a HeatingThreshold characteristic. This is not supported in the spec.", buf, 2u);
      }

      if (v15) {
        v24 = v13;
      }
      else {
        v24 = 0;
      }
      id v17 = v24;
      goto LABEL_27;
    }
    if (v15)
    {
LABEL_20:
      v22 = 0;
      goto LABEL_28;
    }
    v21 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "A heater/cooler is in Auto mode, but it doesn't have a CoolingThreshold characteristic. This is not supported in the spec.", v28, 2u);
    }

    goto LABEL_17;
  }
  if (!v15)
  {
    id v18 = HFLogForCategory(0x2AuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    __int16 v26 = 0;
    id v19 = "Heater/Cooler service is in the state HMCharacteristicValueTargetHeaterCoolerStateCool, but has no cooling thr"
          "eshold characteristic";
    uint64_t v20 = (uint8_t *)&v26;
    goto LABEL_32;
  }
  id v17 = v13;
LABEL_27:
  v22 = v17;
LABEL_28:

  return v22;
}

@end