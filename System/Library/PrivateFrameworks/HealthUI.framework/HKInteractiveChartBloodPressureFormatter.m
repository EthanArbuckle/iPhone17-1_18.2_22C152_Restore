@interface HKInteractiveChartBloodPressureFormatter
- (BOOL)_higherMaximum:(id)a3 currentMaximum:(id)a4;
- (BOOL)_lowerMinimum:(id)a3 currentMinimum:(id)a4;
- (id)_formattedStringWithRange:(id)a3 displayUnit:(BOOL)a4;
- (id)_stringFromRange:(id)a3 numberFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKInteractiveChartBloodPressureFormatter

- (id)_formattedStringWithRange:(id)a3 displayUnit:(BOOL)a4
{
  BOOL v4 = a4;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HKInteractiveChartDataFormatter *)self unitController];
  v8 = [(HKInteractiveChartDataFormatter *)self displayType];
  uint64_t v9 = [v7 unitForDisplayType:v8];

  v10 = [(HKInteractiveChartDataFormatter *)self displayType];
  v34 = (void *)v9;
  v11 = objc_msgSend(v10, "hk_numberFormatterForUnit:", v9);

  v12 = [(HKInteractiveChartDataFormatter *)self displayType];
  v13 = [(HKInteractiveChartDataFormatter *)self unitController];
  v14 = [(HKInteractiveChartBloodPressureFormatter *)self _stringFromRange:v6 numberFormatter:v11 displayType:v12 unitController:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  v38[0] = *MEMORY[0x1E4FB06F8];
  v17 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v39[0] = v17;
  uint64_t v18 = *MEMORY[0x1E4FB0700];
  v38[1] = *MEMORY[0x1E4FB0700];
  v19 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v39[1] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v21 = (void *)[v15 initWithString:v14 attributes:v20];

  v22 = [(HKInteractiveChartDataFormatter *)self unitController];
  v23 = [(HKInteractiveChartDataFormatter *)self displayType];
  v24 = HKUIUnitDisplayName(v22, v23, (uint64_t)&unk_1F3C205F0);

  if (v4 && [v24 length])
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
    v36[0] = v16;
    v27 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v36[1] = v18;
    v37[0] = v27;
    v28 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v37[1] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    v30 = (void *)[v26 initWithString:v24 attributes:v29];

    v35[0] = v21;
    v35[1] = v25;
    v35[2] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    HKUIJoinAttributedStringsForLocale(v31);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v32 = v21;
  }

  return v32;
}

- (BOOL)_lowerMinimum:(id)a3 currentMinimum:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      BOOL v8 = [v5 compare:v6] == -1;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_higherMaximum:(id)a3 currentMaximum:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      BOOL v8 = [v5 compare:v6] == 1;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v6;
    uint64_t v52 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v49 = v6;
    v7 = 0;
    BOOL v8 = 0;
    if (!v52) {
      goto LABEL_28;
    }
    uint64_t v51 = *(void *)v54;
    while (1)
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v54 != v51) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "systolicRange", v49);
        v12 = v11;
        if (v8)
        {
          v13 = [v11 minValue];
          v14 = [v8 minValue];
          BOOL v15 = [(HKInteractiveChartBloodPressureFormatter *)self _lowerMinimum:v13 currentMinimum:v14];

          if (v15)
          {
            uint64_t v16 = [v10 systolicRange];
            v17 = [v16 minValue];
            [v8 setMinValue:v17];
          }
          uint64_t v18 = [v10 systolicRange];
          v19 = [v18 maxValue];
          v20 = [v8 maxValue];
          BOOL v21 = [(HKInteractiveChartBloodPressureFormatter *)self _higherMaximum:v19 currentMaximum:v20];

          if (v21)
          {
            v22 = [v10 systolicRange];
            v23 = [v22 maxValue];
            [v8 setMaxValue:v23];
LABEL_15:
          }
        }
        else
        {

          if (v12)
          {
            v22 = [v10 systolicRange];
            v23 = [v22 minValue];
            v24 = [v10 systolicRange];
            v25 = [v24 maxValue];
            BOOL v8 = +[HKValueRange valueRangeWithMinValue:v23 maxValue:v25];

            goto LABEL_15;
          }
          BOOL v8 = 0;
        }
        id v26 = [v10 diastolicRange];
        v27 = v26;
        if (v7)
        {
          v28 = [v26 minValue];
          v29 = [v7 minValue];
          BOOL v30 = [(HKInteractiveChartBloodPressureFormatter *)self _lowerMinimum:v28 currentMinimum:v29];

          if (v30)
          {
            v31 = [v10 diastolicRange];
            id v32 = [v31 minValue];
            [v7 setMinValue:v32];
          }
          v33 = [v10 diastolicRange];
          v34 = [v33 maxValue];
          v35 = [v7 maxValue];
          BOOL v36 = [(HKInteractiveChartBloodPressureFormatter *)self _higherMaximum:v34 currentMaximum:v35];

          if (v36)
          {
            v37 = [v10 diastolicRange];
            v38 = [v37 maxValue];
            [v7 setMaxValue:v38];
LABEL_24:

            continue;
          }
        }
        else
        {

          if (v27)
          {
            v37 = [v10 diastolicRange];
            v38 = [v37 minValue];
            v39 = [v10 diastolicRange];
            v40 = [v39 maxValue];
            v7 = +[HKValueRange valueRangeWithMinValue:v38 maxValue:v40];

            goto LABEL_24;
          }
          v7 = 0;
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (!v52)
      {
LABEL_28:

        v41 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
        [(HKSelectedRangeData *)v41 setDataType:1];
        v42 = [(HKInteractiveChartBloodPressureFormatter *)self _formattedStringWithRange:v8 displayUnit:0];
        [(HKSelectedRangeData *)v41 setAttributedString:v42];

        v43 = [v8 maxValue];
        [(HKSelectedRangeData *)v41 setValueAsNumber:v43];

        v44 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
        [(HKSelectedRangeData *)v44 setDataType:2];
        v45 = [(HKInteractiveChartBloodPressureFormatter *)self _formattedStringWithRange:v7 displayUnit:1];
        [(HKSelectedRangeData *)v44 setAttributedString:v45];

        v46 = [v7 maxValue];
        [(HKSelectedRangeData *)v44 setValueAsNumber:v46];

        v57[0] = v41;
        v57[1] = v44;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];

        id v6 = v49;
        goto LABEL_30;
      }
    }
  }
  v47 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_30:

  return v47;
}

- (id)_stringFromRange:(id)a3 numberFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = HKLocalizedNoDataString();
  if (v9)
  {
    v14 = [v11 presentation];
    BOOL v15 = [v9 minValue];
    uint64_t v16 = [v14 adjustedValueForDaemonValue:v15];

    v17 = [v11 presentation];
    uint64_t v18 = [v9 maxValue];
    v19 = [v17 adjustedValueForDaemonValue:v18];

    if (v16)
    {
      if (v19)
      {
        [v16 doubleValue];
        double v21 = v20;
        [v19 doubleValue];
        double v23 = vabdd_f64(v21, v22);
        uint64_t v24 = [v10 stringFromNumber:v16 displayType:v11 unitController:v12];
        if (v23 >= 0.00000011920929)
        {
          v25 = [v10 stringFromNumber:v19 displayType:v11 unitController:v12];
          BOOL v30 = NSString;
          id v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v26 = [v32 localizedStringForKey:@"RANGE_STRING %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          uint64_t v31 = objc_msgSend(v30, "stringWithFormat:", v26, v24, v25);

          v13 = (void *)v24;
          uint64_t v24 = v31;
        }
        goto LABEL_10;
      }
      v27 = v10;
      v28 = v16;
    }
    else
    {
      if (!v19)
      {
LABEL_11:

        goto LABEL_12;
      }
      v27 = v10;
      v28 = v19;
    }
    uint64_t v24 = [v27 stringFromNumber:v28 displayType:v11 unitController:v12];
LABEL_10:

    v13 = (void *)v24;
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

@end