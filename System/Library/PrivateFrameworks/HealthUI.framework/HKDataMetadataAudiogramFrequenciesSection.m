@interface HKDataMetadataAudiogramFrequenciesSection
- (HKDataMetadataAudiogramFrequenciesSection)initWithSample:(id)a3 leftEar:(BOOL)a4 unitController:(id)a5;
- (id)_formattedFrequencyStringFromSensitivityPoint:(id)a3;
- (id)_formattedSensitivityStringFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4 unitController:(id)a5;
- (id)_sensitivityQuantityFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4;
- (void)_addCellsFromAudiogramSample:(id)a3 forLeftEar:(BOOL)a4 unitController:(id)a5;
@end

@implementation HKDataMetadataAudiogramFrequenciesSection

- (HKDataMetadataAudiogramFrequenciesSection)initWithSample:(id)a3 leftEar:(BOOL)a4 unitController:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = v11;
    if (v6) {
      v13 = @"LEFT_FULL";
    }
    else {
      v13 = @"RIGHT_FULL";
    }
    v14 = [v11 localizedStringForKey:v13 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v19.receiver = self;
    v19.super_class = (Class)HKDataMetadataAudiogramFrequenciesSection;
    v15 = [(HKDataMetadataSimpleSection *)&v19 initWithTitle:v14];
    v16 = v15;
    if (v15) {
      [(HKDataMetadataAudiogramFrequenciesSection *)v15 _addCellsFromAudiogramSample:v10 forLeftEar:v6 unitController:v9];
    }
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_sensitivityQuantityFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4
{
  BOOL v4 = !a4;
  v5 = [a3 tests];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__HKDataMetadataAudiogramFrequenciesSection__sensitivityQuantityFromSensitivityPoint_isLeftEar___block_invoke;
  v10[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v10[4] = v4;
  BOOL v6 = objc_msgSend(v5, "hk_filter:", v10);
  v7 = [v6 firstObject];

  id v8 = [v7 sensitivity];

  return v8;
}

BOOL __96__HKDataMetadataAudiogramFrequenciesSection__sensitivityQuantityFromSensitivityPoint_isLeftEar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (void)_addCellsFromAudiogramSample:(id)a3 forLeftEar:(BOOL)a4 unitController:(id)a5
{
  BOOL v5 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [a3 sensitivityPoints];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = [(HKDataMetadataAudiogramFrequenciesSection *)self _sensitivityQuantityFromSensitivityPoint:v12 isLeftEar:v5];
        if (v13)
        {
          v14 = [(HKDataMetadataAudiogramFrequenciesSection *)self _formattedFrequencyStringFromSensitivityPoint:v12];
          v15 = [(HKDataMetadataAudiogramFrequenciesSection *)self _formattedSensitivityStringFromSensitivityPoint:v12 isLeftEar:v5 unitController:v19];
          v24[0] = @"HKAudiogramSample";
          v24[1] = @"Sensitivity";
          v24[2] = v15;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
          v17 = HKUIJoinStringsForAutomationIdentifier(v16);
          [(HKDataMetadataSimpleSection *)self addText:v15 detail:v14 baseIdentifier:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }
}

- (id)_formattedFrequencyStringFromSensitivityPoint:(id)a3
{
  v3 = [a3 frequency];
  BOOL v4 = [MEMORY[0x1E4F2B618] hertzUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  v7 = HKNumberFormatterWithDecimalPrecision(5, 0);
  if (v6 / 1000.0 >= 1.0)
  {
    v13 = [NSNumber numberWithDouble:v6 / 1000.0];
    uint64_t v9 = [v7 stringFromNumber:v13];

    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v11 = v10;
    uint64_t v12 = @"KILOHERTZ_NUMBERLESS_UNIT";
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithDouble:v6];
    uint64_t v9 = [v7 stringFromNumber:v8];

    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v11 = v10;
    uint64_t v12 = @"HERTZ_NUMBERLESS_UNIT";
  }
  v14 = [v10 localizedStringForKey:v12 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = HKFormatValueAndUnit(v9, v14);

  return v15;
}

- (id)_formattedSensitivityStringFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4 unitController:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
  v11 = [(HKDataMetadataAudiogramFrequenciesSection *)self _sensitivityQuantityFromSensitivityPoint:v8 isLeftEar:v6];
  uint64_t v12 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v13 = [v12 features];
  int v14 = [v13 yodel];

  if (v14)
  {
    v15 = [v8 tests];
    v16 = v15;
    if (v6) {
      v17 = &__block_literal_global_9;
    }
    else {
      v17 = &__block_literal_global_311;
    }
    v18 = objc_msgSend(v15, "hk_filter:", v17);

    id v19 = [v18 firstObject];
    long long v20 = [v19 clampedSensitivity];

    long long v21 = [v18 firstObject];
    long long v22 = [v21 clampingRange];

    if (v20)
    {
      long long v23 = NSNumber;
      [v20 doubleValueForUnit:v10];
      v25 = [v23 numberWithDouble:HKRoundWithPositiveZeroForDoubleValue(v24)];
      uint64_t v26 = HKNumberFormatterFromTemplate(0);
      int v27 = 1;
      v44 = HKFormattedStringFromValue(v25, 0, v9, 1, v26);

      v28 = [v22 lowerBound];
      if ((objc_msgSend(v28, "hk_isGreaterThanQuantity:", v11) & 1) == 0)
      {
        v29 = [v22 lowerBound];
        int v27 = [v29 isEqual:v11];
      }
      v30 = [v22 upperBound];
      if (objc_msgSend(v30, "hk_isLessThanQuantity:", v11))
      {

        if (!v27) {
          goto LABEL_14;
        }
LABEL_12:
        id v43 = v8;
        v32 = NSString;
        v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v34 = v33;
        v35 = @"AUDIOGRAM_SENSITIVITY_POINT_VALUE_WITH_UNIT_CLAMPED_FROM_BELOW_%@";
LABEL_15:
        v36 = [v33 localizedStringForKey:v35 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
        v37 = objc_msgSend(v32, "localizedStringWithFormat:", v36, v44);

        id v8 = v43;
        goto LABEL_19;
      }
      v31 = [v22 upperBound];
      int v42 = [v31 isEqual:v11];

      if (v27) {
        goto LABEL_12;
      }
      if (v42)
      {
LABEL_14:
        id v43 = v8;
        v32 = NSString;
        v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v34 = v33;
        v35 = @"AUDIOGRAM_SENSITIVITY_POINT_VALUE_WITH_UNIT_CLAMPED_FROM_ABOVE_%@";
        goto LABEL_15;
      }
    }
  }
  v38 = NSNumber;
  [v11 doubleValueForUnit:v10];
  long long v20 = [v38 numberWithDouble:HKRoundWithPositiveZeroForDoubleValue(v39)];
  v40 = HKNumberFormatterFromTemplate(0);
  long long v22 = HKFormattedStringFromValue(v20, 0, v9, 1, v40);

  v25 = [v9 localizedDisplayNameForUnit:v10 value:v20];
  v37 = HKFormatValueAndUnit(v22, v25);
LABEL_19:

  return v37;
}

BOOL __118__HKDataMetadataAudiogramFrequenciesSection__formattedSensitivityStringFromSensitivityPoint_isLeftEar_unitController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 0;
  }

  return v3;
}

BOOL __118__HKDataMetadataAudiogramFrequenciesSection__formattedSensitivityStringFromSensitivityPoint_isLeftEar_unitController___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 1;
  }

  return v3;
}

@end