@interface HFHumidifierDehumidifierThresholdControlItem
+ (id)readOnlyCharacteristicTypes;
- (HFHumidifierDehumidifierThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (id)numberValueFormatter;
- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3;
- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3;
@end

@implementation HFHumidifierDehumidifierThresholdControlItem

- (HFHumidifierDehumidifierThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v9 = (void *)*MEMORY[0x263F0C1C8];
  int v10 = [v8 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C1C8] valueSource:v6];
  v11 = objc_opt_class();
  v12 = (void *)*MEMORY[0x263F0C148];
  int v13 = [v11 _hasWritableCharacteristicsOfType:*MEMORY[0x263F0C148] valueSource:v6];
  if (v10) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v10)
    {
      v15 = (void *)MEMORY[0x263EFFA08];
      v16 = v9;
    }
    else
    {
      if (!v13)
      {
        v20 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "A humidifier/dehumidifier service has neither a humidify threshold nor a dehumidify threshold characteristic. We can't do anything with that.", buf, 2u);
        }

        v19 = 0;
        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x263EFFA08];
      v16 = v12;
    }
    v19 = [v15 setWithObject:v16];
LABEL_14:
    id v17 = 0;
    id v18 = 0;
    goto LABEL_15;
  }
  id v17 = v9;
  id v18 = v12;
  v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v17, v18, 0);
LABEL_15:
  v23.receiver = self;
  v23.super_class = (Class)HFHumidifierDehumidifierThresholdControlItem;
  v21 = [(HFRangeControlItem *)&v23 initWithValueSource:v6 targetCharacteristicTypes:v19 minimumCharacteristicType:v17 maximumCharacteristicType:v18 displayResults:v7];

  return v21;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_2676B6A68 != -1) {
    dispatch_once(&qword_2676B6A68, &__block_literal_global_103);
  }
  v2 = (void *)qword_2676B6A70;
  return v2;
}

void __75__HFHumidifierDehumidifierThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C0E0];
  v5[0] = *MEMORY[0x263F0C4F8];
  v5[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)qword_2676B6A70;
  qword_2676B6A70 = v3;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C4F8]];
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
      int v10 = (void *)v9;
      v11 = [(HFRangeControlItem *)self maximumCharacteristicType];

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
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C4F8]];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_23;
  }
  unint64_t v8 = objc_opt_class();
  uint64_t v9 = (void *)*MEMORY[0x263F0C1C8];
  int v10 = [(HFControlItem *)self valueSource];
  int v11 = [v8 _hasWritableCharacteristicsOfType:v9 valueSource:v10];

  v12 = objc_opt_class();
  int v13 = (void *)*MEMORY[0x263F0C148];
  BOOL v14 = [(HFControlItem *)self valueSource];
  int v15 = [v12 _hasWritableCharacteristicsOfType:v13 valueSource:v14];

  uint64_t v16 = [v7 integerValue];
  if (v16 == 1)
  {
    if (v11)
    {
      id v17 = v9;
      goto LABEL_11;
    }
    v20 = HFLogForCategory(0x2AuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)v25 = 0;
    v21 = "Humidifer service is in the state HMCharacteristicValueTargetHumidifierDehumidifierStateHumidify, but has no h"
          "umidify threshold characteristic";
    v22 = v25;
  }
  else if (v16 == 2)
  {
    if (v15)
    {
      id v17 = v13;
LABEL_11:
      id v18 = v17;
      goto LABEL_24;
    }
    v20 = HFLogForCategory(0x2AuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    __int16 v24 = 0;
    v21 = "Dehumidifier service is in the state HMCharacteristicValueTargetHumidifierDehumidifierStateDehumidify, but has"
          " no dehumidify threshold characteristic";
    v22 = (uint8_t *)&v24;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      v19 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "A humidifier/dehumidifier is in Auto mode, but it doesn't have a HumidifierThreshold characteristic. This is not supported in the spec.", buf, 2u);
      }
    }
    if (v15) {
      goto LABEL_23;
    }
    v20 = HFLogForCategory(0x2AuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    __int16 v26 = 0;
    v21 = "A humidifier/dehumidifier is in Auto mode, but it doesn't have a DehumidifierThreshold characteristic. This is"
          " not supported in the spec.";
    v22 = (uint8_t *)&v26;
  }
  _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
LABEL_22:

LABEL_23:
  id v18 = 0;
LABEL_24:

  return v18;
}

- (id)numberValueFormatter
{
  v2 = +[HFFormatterManager sharedInstance];
  uint64_t v3 = [v2 percentFormatter];

  return v3;
}

@end