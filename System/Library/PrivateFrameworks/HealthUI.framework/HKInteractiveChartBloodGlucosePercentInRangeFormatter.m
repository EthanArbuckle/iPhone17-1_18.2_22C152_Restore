@interface HKInteractiveChartBloodGlucosePercentInRangeFormatter
- (HKInteractiveChartBloodGlucosePercentInRangeFormatter)init;
- (NSNumberFormatter)percentageFormatter;
- (double)_fractionForHighlightedClassificationFromDataPoint:(id)a3;
- (id)_overallFractionInEuglycemiaForChartData:(id)a3;
- (id)_rangeOfFractionInHighlightedClassificationForChartData:(id)a3;
- (id)_stringFromFraction:(id)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (int64_t)_selectedRangeDataTypeForContext:(int64_t)a3;
- (int64_t)highlightedClassification;
- (void)setHighlightedClassification:(int64_t)a3;
@end

@implementation HKInteractiveChartBloodGlucosePercentInRangeFormatter

- (HKInteractiveChartBloodGlucosePercentInRangeFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartBloodGlucosePercentInRangeFormatter;
  v2 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)&v7 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentDecimalNumberFormatter");
    uint64_t v4 = [v3 copy];
    percentageFormatter = v2->_percentageFormatter;
    v2->_percentageFormatter = (NSNumberFormatter *)v4;
  }
  return v2;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = v6;
  if (!v6 || ![v6 count])
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    v11 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _rangeOfFractionInHighlightedClassificationForChartData:v7];
    v12 = [v11 minValue];
    v13 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _stringFromFraction:v12];

    v14 = [v11 maxValue];
    v15 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _stringFromFraction:v14];

    if ([v13 isEqualToString:v15])
    {
      v8 = [v11 minValue];
      id v9 = v13;
    }
    else
    {
      v16 = NSString;
      v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v18 = [v17 localizedStringForKey:@"OVERLAY_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      objc_msgSend(v16, "stringWithFormat:", v18, v13, v15);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      v8 = 0;
    }

    if (!v9) {
      goto LABEL_6;
    }
LABEL_12:
    v19 = [(HKInteractiveChartDataFormatter *)self unitController];
    v20 = [MEMORY[0x1E4F2B618] percentUnit];
    v40 = [v19 localizedDisplayNameForUnit:v20 value:0];

    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    int64_t v41 = a4;
    v22 = v8;
    uint64_t v46 = *MEMORY[0x1E4FB06F8];
    uint64_t v23 = v46;
    v24 = [(HKInteractiveChartDataFormatter *)self majorFont];
    v48[0] = v24;
    uint64_t v47 = *MEMORY[0x1E4FB0700];
    uint64_t v25 = v47;
    v26 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
    v48[1] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v46 count:2];
    v28 = (void *)[v21 initWithString:v9 attributes:v27];

    id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
    v44[0] = v23;
    v8 = v22;
    v30 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v44[1] = v25;
    v45[0] = v30;
    v31 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v45[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    v33 = (void *)[v29 initWithString:v40 attributes:v32];

    v34 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    [(HKSelectedRangeData *)v34 setDataType:[(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _selectedRangeDataTypeForContext:v41]];
    v43[0] = v28;
    v43[1] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v37 = [v36 localizedStringForKey:@"PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v38 = HKUIJoinAttributedStringsWithFormat(v35, v37);
    [(HKSelectedRangeData *)v34 setAttributedString:v38];

    [(HKSelectedRangeData *)v34 setValueAsNumber:v8];
    v42 = v34;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];

    goto LABEL_13;
  }
  v8 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _overallFractionInEuglycemiaForChartData:v7];
  if (v8)
  {
    id v9 = [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _stringFromFraction:v8];
    if (v9) {
      goto LABEL_12;
    }
  }
LABEL_6:
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_13:

LABEL_14:
  return v10;
}

- (id)_overallFractionInEuglycemiaForChartData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v6 += [v9 countForClassification:2];
        v5 += [v9 totalCount];
      }
      uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
    if (v5)
    {
      uint64_t v4 = [NSNumber numberWithDouble:(double)v6 / (double)v5];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)_rangeOfFractionInHighlightedClassificationForChartData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HKInteractiveChartBloodGlucosePercentInRangeFormatter *)self _fractionForHighlightedClassificationFromDataPoint:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v11 < v8) {
          double v8 = v11;
        }
        if (v11 > v9) {
          double v9 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
  }
  long long v12 = [NSNumber numberWithDouble:v8];
  long long v13 = [NSNumber numberWithDouble:v9];
  long long v14 = +[HKValueRange valueRangeWithMinValue:v12 maxValue:v13];

  return v14;
}

- (double)_fractionForHighlightedClassificationFromDataPoint:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  int64_t highlightedClassification = self->_highlightedClassification;
  if ((unint64_t)(highlightedClassification - 2) < 2 || highlightedClassification == 0)
  {
    objc_msgSend(v5, "fractionForClassification:");
    double v3 = v9;
  }
  else if (highlightedClassification == 1)
  {
    objc_msgSend(v5, "fractionForClassification:");
    double v11 = v10;
    [v6 fractionForClassification:0];
    double v3 = v11 + v12;
  }

  return v3;
}

- (id)_stringFromFraction:(id)a3
{
  id v4 = a3;
  [v4 doubleValue];
  BOOL v7 = 0;
  if (v5 > 0.0)
  {
    [v4 doubleValue];
    if (v6 < 0.01) {
      BOOL v7 = 1;
    }
  }
  [(NSNumberFormatter *)self->_percentageFormatter setMaximumFractionDigits:v7];
  double v8 = [(NSNumberFormatter *)self->_percentageFormatter stringFromNumber:v4];

  return v8;
}

- (int64_t)_selectedRangeDataTypeForContext:(int64_t)a3
{
  if (a3 == 1) {
    return 22;
  }
  int64_t highlightedClassification = self->_highlightedClassification;
  unint64_t v5 = highlightedClassification - 1;
  int64_t v6 = highlightedClassification + 20;
  if (v5 >= 3) {
    return 20;
  }
  else {
    return v6;
  }
}

- (int64_t)highlightedClassification
{
  return self->_highlightedClassification;
}

- (void)setHighlightedClassification:(int64_t)a3
{
  self->_int64_t highlightedClassification = a3;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
}

@end