@interface HKInteractiveChartInsulinFormatter
- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4;
- (id)_formattedStringWithBasalValue:(double)a3 bolusValue:(double)a4;
- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 deliveryReason:(int64_t)a5;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKInteractiveChartInsulinFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5 = a3;
  v6 = [(HKInteractiveChartGenericStatFormatter *)self configuredStatItems];
  v7 = [(HKInteractiveChartInsulinFormatter *)self _formattedSelectedRangeLabelDataWithChartData:v5 items:v6];

  return v7;
}

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v44 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          [v14 basalValue];
          double v12 = v12 + v15;
          [v14 bolusValue];
          double v11 = v11 + v16;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
    }

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18 = [MEMORY[0x1E4F2B618] internationalUnit];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v43 = v6;
    obuint64_t j = v6;
    uint64_t v19 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v50;
      uint64_t v45 = *(void *)v50;
      v47 = v17;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(obj);
          }
          *((void *)&v23 + 1) = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "integerValue", v43);
          *(void *)&long long v23 = *((void *)&v23 + 1) - 8;
          switch((unint64_t)(v23 >> 3))
          {
            case 0uLL:
              v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:3];
              double v25 = (v11 + v12) / (double)(unint64_t)[v7 count];
              [(HKSelectedRangeData *)v24 setDataType:5];
              v26 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v18 unit:1 showUnit:v25];
              [(HKSelectedRangeData *)v24 setAttributedString:v26];

              v27 = NSNumber;
              double v28 = v25;
              goto LABEL_29;
            case 1uLL:
              v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:5];
              [(HKSelectedRangeData *)v24 setDataType:5];
              v29 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v18 unit:1 showUnit:v11 + v12];
              [(HKSelectedRangeData *)v24 setAttributedString:v29];

              v27 = NSNumber;
              double v28 = v11 + v12;
              goto LABEL_29;
            case 8uLL:
              if ((unint64_t)[v7 count] <= 1) {
                uint64_t v30 = 0;
              }
              else {
                uint64_t v30 = 3;
              }
              v31 = [[HKSelectedRangeData alloc] initWithStatisticsType:v30];
              [(HKSelectedRangeData *)v31 setDataType:3];
              v32 = -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v12 / (double)(unint64_t)[v7 count]);
              [(HKSelectedRangeData *)v31 setAttributedString:v32];

              v33 = objc_msgSend(NSNumber, "numberWithDouble:", v12 / (double)(unint64_t)objc_msgSend(v7, "count"));
              [(HKSelectedRangeData *)v31 setValueAsNumber:v33];

              [v47 addObject:v31];
              id v17 = v47;
              v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:v30];

              [(HKSelectedRangeData *)v24 setDataType:4];
              uint64_t v21 = v45;
              v34 = -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v11 / (double)(unint64_t)[v7 count]);
              [(HKSelectedRangeData *)v24 setAttributedString:v34];

              v35 = NSNumber;
              double v28 = v11 / (double)(unint64_t)[v7 count];
              v27 = v35;
              goto LABEL_29;
            case 9uLL:
              if ((unint64_t)[v7 count] <= 1) {
                uint64_t v36 = 0;
              }
              else {
                uint64_t v36 = 5;
              }
              v37 = [[HKSelectedRangeData alloc] initWithStatisticsType:v36];
              [(HKSelectedRangeData *)v37 setDataType:3];
              v38 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v18 unit:1 showUnit:v12];
              [(HKSelectedRangeData *)v37 setAttributedString:v38];

              v39 = [NSNumber numberWithDouble:v12];
              [(HKSelectedRangeData *)v37 setValueAsNumber:v39];

              [v47 addObject:v37];
              id v17 = v47;
              v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:v36];

              [(HKSelectedRangeData *)v24 setDataType:4];
              uint64_t v21 = v45;
              v40 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v18 unit:1 showUnit:v11];
              [(HKSelectedRangeData *)v24 setAttributedString:v40];

              v27 = NSNumber;
              double v28 = v11;
LABEL_29:
              v41 = [v27 numberWithDouble:v28];
              [(HKSelectedRangeData *)v24 setValueAsNumber:v41];

              [v17 addObject:v24];
              break;
            default:
              continue;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v20);
    }

    id v6 = v43;
    id v5 = v44;
  }
  else
  {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)_formattedStringWithBasalValue:(double)a3 bolusValue:(double)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F2B618] internationalUnit];
  uint64_t v8 = [(HKInteractiveChartInsulinFormatter *)self _formattedStringWithValue:v7 unit:1 deliveryReason:a3];
  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v11 = [v10 localizedStringForKey:@"CHART_COMMA_SEPARATOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v12 = (void *)[v9 initWithString:v11];

  v13 = [(HKInteractiveChartInsulinFormatter *)self _formattedStringWithValue:v7 unit:2 deliveryReason:a4];
  v17[0] = v8;
  v17[1] = v12;
  v17[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  double v15 = HKUIJoinAttributedStringsForLocale(v14);

  return v15;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 deliveryReason:(int64_t)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(HKInteractiveChartDataFormatter *)self displayType];
  uint64_t v10 = [v9 presentation];
  double v11 = [NSNumber numberWithDouble:a3];
  v35 = [v10 adjustedValueForDaemonValue:v11];

  double v12 = [(HKInteractiveChartDataFormatter *)self displayType];
  v13 = [(HKInteractiveChartDataFormatter *)self unitController];
  v34 = HKFormattedStringFromValue(v35, v12, v13, 0, 0);

  v14 = [(HKInteractiveChartDataFormatter *)self unitController];
  double v15 = [NSNumber numberWithDouble:a3];
  double v16 = [v14 localizedDisplayNameForUnit:v8 value:v15];

  uint64_t v39 = *MEMORY[0x1E4FB06F8];
  uint64_t v17 = v39;
  v18 = [(HKInteractiveChartDataFormatter *)self minorFont];
  v40[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];

  id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v37 = v17;
  uint64_t v21 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v38 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  long long v23 = (void *)[v20 initWithString:v34 attributes:v22];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v19];
  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v19];
  v26 = objc_msgSend(NSString, "stringWithFormat:", @"INSULIN_DELIVERY_REASON_%zd", a5);
  id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v29 = [v28 localizedStringForKey:v26 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v30 = (void *)[v27 initWithString:v29 attributes:v19];

  v36[0] = v23;
  v36[1] = v24;
  v36[2] = v25;
  v36[3] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  v32 = HKUIJoinAttributedStringsForLocale(v31);

  return v32;
}

@end