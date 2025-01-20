@interface HKObjectType(HKAdditions)
- (HKTimePeriodNumberFormatter)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:formattingContext:;
- (id)_hk_formatMetadataValueForMetadataKey:()HKAdditions object:unitPreferenceController:;
- (id)hk_formatMetadataValue:()HKAdditions displayType:unitPreferencesController:;
- (id)hk_formatPrimaryMetadataValueForObject:()HKAdditions unitPreferencesController:;
- (id)hk_formatSecondaryMetadataValueForObject:()HKAdditions unitPreferencesController:;
- (id)hk_metadataValueDisplayTypeInStore:()HKAdditions;
- (id)hk_primaryMetadataKey;
- (id)hk_secondaryMetadataKey;
- (id)hk_valueFormatterClass;
- (id)hk_valueFormatterClassForUnit:()HKAdditions;
- (uint64_t)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:;
@end

@implementation HKObjectType(HKAdditions)

- (id)hk_valueFormatterClassForUnit:()HKAdditions
{
  id v4 = a3;
  if ([a1 code] == 256
    && ([MEMORY[0x1E4F2B618] _changeInDegreeCelsiusUnit],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 _isCompatibleWithUnit:v5],
        v5,
        v6))
  {
    uint64_t v7 = objc_opt_class();
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "hk_valueFormatterClass");
  }
  v8 = (void *)v7;

  return v8;
}

- (id)hk_valueFormatterClass
{
  [a1 code];
  v1 = objc_opt_class();
  return v1;
}

- (HKTimePeriodNumberFormatter)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:formattingContext:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 code];
  if (v10 > 137)
  {
    if (v10 <= 293)
    {
      if (v10 != 138)
      {
        if (v10 != 189)
        {
          if (v10 != 256) {
            goto LABEL_26;
          }
          v13 = [MEMORY[0x1E4F2B618] _changeInDegreeCelsiusUnit];
          int v14 = [v8 _isCompatibleWithUnit:v13];

          if (!v14) {
            goto LABEL_26;
          }
          v15 = HKRelativeNumberFormatter;
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else if ((unint64_t)(v10 - 294) >= 4)
    {
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  if (v10 <= 69)
  {
    if (v10 == 2)
    {
      if (_HeightFormatter_oncetoken[0] != -1) {
        dispatch_once(_HeightFormatter_oncetoken, &__block_literal_global_63);
      }
      v16 = (HKTimePeriodNumberFormatter *)(id)_HeightFormatter__heightFormatter;
LABEL_25:
      v12 = v16;
      if (v16) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (v10 != 8)
    {
      if (v10 == 63) {
        goto LABEL_23;
      }
LABEL_26:
      v12 = [v9 numberFormatter];
      goto LABEL_27;
    }
LABEL_21:
    if (a5 == 1)
    {
      v15 = HKNaturalScaleDistanceMeasurementFormatter;
LABEL_24:
      v16 = (HKTimePeriodNumberFormatter *)objc_alloc_init(v15);
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  char v11 = v10 - 70;
  if ((unint64_t)(v10 - 70) > 0x2B) {
    goto LABEL_26;
  }
  if (((1 << v11) & 0x90000002000) != 0) {
    goto LABEL_21;
  }
  if (((1 << v11) & 0x20000200) != 0)
  {
LABEL_23:
    v15 = HKTimePeriodNumberFormatter;
    goto LABEL_24;
  }
  if (v10 != 70) {
    goto LABEL_26;
  }
  v12 = objc_alloc_init(HKTimePeriodNumberFormatter);
  [(HKTimePeriodNumberFormatter *)v12 setShouldRoundToHours:1];
  [(HKTimePeriodNumberFormatter *)v12 setShouldShowDays:0];
  if (!v12) {
    goto LABEL_26;
  }
LABEL_27:

  return v12;
}

- (uint64_t)hk_numberFormatterForUnit:()HKAdditions decimalPrecisionRule:
{
  return objc_msgSend(a1, "hk_numberFormatterForUnit:decimalPrecisionRule:formattingContext:", a3, a4, 0);
}

- (id)hk_primaryMetadataKey
{
  uint64_t v1 = [a1 code];
  id v2 = 0;
  if (v1 > 146)
  {
    v3 = (id *)MEMORY[0x1E4F2A0C8];
    if (v1 == 199 || v1 == 178) {
      goto LABEL_12;
    }
    if (v1 != 147) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  switch(v1)
  {
    case 14:
      v3 = (id *)MEMORY[0x1E4F2A0E0];
      goto LABEL_12;
    case 124:
      v3 = (id *)MEMORY[0x1E4F2A210];
      goto LABEL_12;
    case 140:
LABEL_9:
      v3 = (id *)MEMORY[0x1E4F2A140];
LABEL_12:
      id v2 = *v3;
      break;
  }
LABEL_13:
  return v2;
}

- (id)hk_secondaryMetadataKey
{
  uint64_t v1 = [a1 code];
  id v2 = (id *)MEMORY[0x1E4F2BAB8];
  if (v1 == 178 || v1 == 199) {
    goto LABEL_5;
  }
  if (v1 == 236)
  {
    id v2 = (id *)MEMORY[0x1E4F2A190];
LABEL_5:
    id v3 = *v2;
    goto LABEL_7;
  }
  id v3 = 0;
LABEL_7:
  return v3;
}

- (id)hk_metadataValueDisplayTypeInStore:()HKAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 code];
  if (v5 <= 198)
  {
    if (v5 == 140 || v5 == 147)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A828];
      goto LABEL_16;
    }
    if (v5 == 178)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A7F0];
      goto LABEL_16;
    }
  }
  else if (v5 > 249)
  {
    if (v5 == 250)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A5E8];
      goto LABEL_16;
    }
    if (v5 == 276)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A5D8];
      goto LABEL_16;
    }
  }
  else
  {
    if (v5 == 199)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A820];
      goto LABEL_16;
    }
    if (v5 == 236)
    {
      int v6 = (void *)MEMORY[0x1E4F2B3B8];
      uint64_t v7 = (void *)MEMORY[0x1E4F2A918];
LABEL_16:
      id v8 = [v6 quantityTypeForIdentifier:*v7];
      goto LABEL_17;
    }
  }
  id v8 = a1;
LABEL_17:
  id v9 = v8;
  uint64_t v10 = +[HKDisplayTypeController sharedInstanceForHealthStore:v4];
  char v11 = [v10 displayTypeForObjectType:v9];

  return v11;
}

- (id)hk_formatPrimaryMetadataValueForObject:()HKAdditions unitPreferencesController:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(a1, "hk_primaryMetadataKey");
  id v9 = objc_msgSend(a1, "_hk_formatMetadataValueForMetadataKey:object:unitPreferenceController:", v8, v7, v6);

  return v9;
}

- (id)hk_formatSecondaryMetadataValueForObject:()HKAdditions unitPreferencesController:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(a1, "hk_secondaryMetadataKey");
  id v9 = objc_msgSend(a1, "_hk_formatMetadataValueForMetadataKey:object:unitPreferenceController:", v8, v7, v6);

  return v9;
}

- (id)_hk_formatMetadataValueForMetadataKey:()HKAdditions object:unitPreferenceController:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v10 healthStore];
  v12 = objc_msgSend(a1, "hk_metadataValueDisplayTypeInStore:", v11);

  v13 = 0;
  if (v8 && v12)
  {
    int v14 = [v9 metadata];
    v15 = [v14 objectForKey:v8];

    v13 = objc_msgSend(a1, "hk_formatMetadataValue:displayType:unitPreferencesController:", v15, v12, v10);
  }
  return v13;
}

- (id)hk_formatMetadataValue:()HKAdditions displayType:unitPreferencesController:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    char v11 = [v9 unitForDisplayType:v8];
    v12 = NSNumber;
    [v10 doubleValueForUnit:v11];
    double v14 = v13;

    v15 = [v12 numberWithDouble:v14];
    v16 = [v8 presentation];
    v17 = [v16 adjustedValueForDaemonValue:v15];

    v18 = objc_msgSend(v8, "hk_valueFormatterForUnit:", v11);
    id v19 = [v18 stringFromValue:v17 displayType:v8 unitController:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v7;
      v21 = [v8 presentation];
      v22 = [v21 adjustedValueForDaemonValue:v20];

      id v19 = [v22 stringValue];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v7;
      }
      else {
        id v19 = 0;
      }
    }
  }

  return v19;
}

@end