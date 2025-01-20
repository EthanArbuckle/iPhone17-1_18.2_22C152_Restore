@interface HKInteractiveChartHearingSensitivityFormatter
- (HKInteractiveChartHearingSensitivityFormatter)initWithUnitController:(id)a3;
- (id)_attributedStringWithChartData:(id)a3;
- (id)_clampedUnitStringForChartData:(id)a3;
- (id)_formattedFrequencyValue:(double)a3;
- (id)_formattedTitleWithSensitivityData:(id)a3 isLeftEar:(BOOL)a4;
- (id)_selectedRangeDataForSensitivityData:(id)a3 isLeftEar:(BOOL)a4;
- (id)_selectedRangeMetadataWithSensitivityData:(id)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
- (id)valueStringFromNumber:(id)a3;
@end

@implementation HKInteractiveChartHearingSensitivityFormatter

- (HKInteractiveChartHearingSensitivityFormatter)initWithUnitController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartHearingSensitivityFormatter;
  v5 = [(HKInteractiveChartHearingSensitivityFormatter *)&v9 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    [(HKInteractiveChartDataFormatter *)v5 setMajorFont:v6];

    v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueKindFont");
    [(HKInteractiveChartDataFormatter *)v5 setMinorFont:v7];

    [(HKInteractiveChartDataFormatter *)v5 setUnitController:v4];
    [(HKInteractiveChartDataFormatter *)v5 setDisplayType:0];
  }

  return v5;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    objc_super v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          int v14 = [v13 isLeftEar];
          if (v14) {
            v15 = v9;
          }
          else {
            v15 = v8;
          }
          if (v14) {
            objc_super v9 = v13;
          }
          else {
            v8 = v13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    objc_super v9 = 0;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = [(HKInteractiveChartHearingSensitivityFormatter *)self _selectedRangeDataForSensitivityData:v9 isLeftEar:1];
  objc_msgSend(v16, "hk_addNonNilObject:", v17);

  v18 = [(HKInteractiveChartHearingSensitivityFormatter *)self _selectedRangeDataForSensitivityData:v8 isLeftEar:0];
  objc_msgSend(v16, "hk_addNonNilObject:", v18);

  return v16;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HKInteractiveChartDataFormatter *)self unitController];
  objc_super v9 = [v8 localizedDisplayNameForUnit:v7 value:v6];

  return v9;
}

- (id)valueStringFromNumber:(id)a3
{
  v3 = NSNumber;
  [a3 doubleValue];
  id v5 = [v3 numberWithDouble:HKRoundWithPositiveZeroForDoubleValue(v4)];
  id v6 = HKIntegerFormatter();
  id v7 = [v6 stringFromNumber:v5];

  return v7;
}

- (id)_selectedRangeDataForSensitivityData:(id)a3 isLeftEar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    v8 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    objc_super v9 = v8;
    if (v4) {
      uint64_t v10 = 7;
    }
    else {
      uint64_t v10 = 8;
    }
    [(HKSelectedRangeData *)v8 setDataType:v10];
    v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v12 = [v11 features];
    int v13 = [v12 yodel];

    if (v13)
    {
      int v14 = [(HKInteractiveChartHearingSensitivityFormatter *)self _formattedTitleWithSensitivityData:v6 isLeftEar:v4];
      [(HKSelectedRangeData *)v9 setTitleOverride:v14];

      v15 = [(HKInteractiveChartHearingSensitivityFormatter *)self _attributedStringWithChartData:v6];
      [(HKSelectedRangeData *)v9 setAttributedString:v15];

      id v16 = [v6 clampedSensitivityDBHL];
      if (v16)
      {
        [(HKSelectedRangeData *)v9 setValueAsNumber:v16];
      }
      else
      {
        long long v20 = NSNumber;
        [v6 sensitivityDBHL];
        long long v21 = objc_msgSend(v20, "numberWithDouble:");
        [(HKSelectedRangeData *)v9 setValueAsNumber:v21];
      }
      v19 = [(HKInteractiveChartHearingSensitivityFormatter *)self _selectedRangeMetadataWithSensitivityData:v6];
      [(HKSelectedRangeData *)v9 setMetadata:v19];
    }
    else
    {
      [v6 sensitivityDBHL];
      v17 = -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v7, 1);
      [(HKSelectedRangeData *)v9 setAttributedString:v17];

      v18 = NSNumber;
      [v6 sensitivityDBHL];
      v19 = objc_msgSend(v18, "numberWithDouble:");
      [(HKSelectedRangeData *)v9 setValueAsNumber:v19];
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)_attributedStringWithChartData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clampedSensitivityDBHL];

  if (v5)
  {
    id v6 = [(HKInteractiveChartHearingSensitivityFormatter *)self _clampedUnitStringForChartData:v4];
    id v7 = [v4 clampedSensitivityDBHL];
    [v7 doubleValue];
    v8 = -[HKInteractiveChartDataFormatter formattedStringWithValue:unitString:showUnit:](self, "formattedStringWithValue:unitString:showUnit:", v6, 1);
  }
  else
  {
    [v4 sensitivityDBHL];
    double v10 = v9;
    id v6 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    v8 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v6 unit:1 showUnit:v10];
  }

  return v8;
}

- (id)_clampedUnitStringForChartData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 lowerClampedSensitivityDBHL];
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = (void *)v4;
  id v6 = [v3 clampedSensitivityDBHL];
  [v6 doubleValue];
  double v8 = v7;
  double v9 = [v3 lowerClampedSensitivityDBHL];
  [v9 doubleValue];
  double v11 = v10;

  if (v8 <= v11)
  {
    long long v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v20 = v22;
    long long v23 = @"DECIBEL_HEARING_LEVEL_NUMBERLESS_UNIT_CLAMPED_FROM_BELOW";
  }
  else
  {
LABEL_3:
    uint64_t v12 = [v3 upperClampedSensitivityDBHL];
    if (!v12) {
      goto LABEL_5;
    }
    int v13 = (void *)v12;
    int v14 = [v3 clampedSensitivityDBHL];
    [v14 doubleValue];
    double v16 = v15;
    v17 = [v3 upperClampedSensitivityDBHL];
    [v17 doubleValue];
    double v19 = v18;

    if (v16 < v19)
    {
LABEL_5:
      long long v20 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
      uint64_t v21 = [v20 unitString];
      goto LABEL_9;
    }
    long long v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v20 = v22;
    long long v23 = @"DECIBEL_HEARING_LEVEL_NUMBERLESS_UNIT_CLAMPED_FROM_ABOVE";
  }
  uint64_t v21 = [v22 localizedStringForKey:v23 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
LABEL_9:
  v24 = (void *)v21;

  return v24;
}

- (id)_formattedTitleWithSensitivityData:(id)a3 isLeftEar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 frequencyHertz];
  double v7 = -[HKInteractiveChartHearingSensitivityFormatter _formattedFrequencyValue:](self, "_formattedFrequencyValue:");
  int v8 = [v6 isMasked];

  double v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v10 = v9;
  if (v8) {
    double v11 = @"MASKED_AUDIOGRAM_POINT";
  }
  else {
    double v11 = @"UNMASKED_AUDIOGRAM_POINT";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];

  int v13 = NSString;
  int v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v15 = v14;
  if (v4) {
    double v16 = @"LEFT_ABBREVIATED_WITH_MASKING_AND_FREQUENCY";
  }
  else {
    double v16 = @"RIGHT_ABBREVIATED_WITH_MASKING_AND_FREQUENCY";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  double v18 = objc_msgSend(v13, "stringWithFormat:", v17, v12, v7);

  double v19 = [v18 localizedUppercaseString];

  return v19;
}

- (id)_selectedRangeMetadataWithSensitivityData:(id)a3
{
  return +[HKAudiogramLineSeries selectedRangeMetadataWith:a3];
}

- (id)_formattedFrequencyValue:(double)a3
{
  BOOL v4 = HKNumberFormatterWithDecimalPrecision(5, 0);
  if (a3 / 1000.0 >= 1.0)
  {
    double v10 = [NSNumber numberWithDouble:a3 / 1000.0];
    id v6 = [v4 stringFromNumber:v10];

    double v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int v8 = v7;
    double v9 = @"KILOHERTZ_NUMBERLESS_UNIT";
  }
  else
  {
    id v5 = [NSNumber numberWithDouble:a3];
    id v6 = [v4 stringFromNumber:v5];

    double v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int v8 = v7;
    double v9 = @"HERTZ_NUMBERLESS_UNIT";
  }
  double v11 = [v7 localizedStringForKey:v9 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v12 = HKFormatValueAndUnit(v6, v11);

  return v12;
}

@end