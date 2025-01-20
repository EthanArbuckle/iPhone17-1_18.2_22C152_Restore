@interface HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter
- (id)_attributedBreathingDisturbancesClassification:(id)a3;
- (id)_formattedAnnotationValueForChartData:(id)a3;
- (id)_formattedCurrentValueForChartData:(id)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (int64_t)_statisticsTypeForChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v8 = v7;
  if (!v7 || ![v7 count])
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  v9 = [v8 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
    uint64_t v10 = [(HKInteractiveChartGenericStatFormatter *)&v12 formattedSelectedRangeLabelDataWithChartData:v8 context:a4];
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    uint64_t v10 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _formattedCurrentValueForChartData:v8];
    goto LABEL_10;
  }
  if (!a4)
  {
    uint64_t v10 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _formattedAnnotationValueForChartData:v8];
LABEL_10:
    v4 = (void *)v10;
  }

LABEL_12:
  return v4;
}

- (id)_formattedAnnotationValueForChartData:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[HKSleepApneaUtilities averageBreathingDisturbancesForChartData:v4];
  int64_t v6 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _statisticsTypeForChartData:v4 context:0];

  id v7 = [[HKSelectedRangeData alloc] initWithStatisticsType:v6];
  v8 = HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v9 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _attributedBreathingDisturbancesClassification:v8];
  [(HKSelectedRangeData *)v7 setAttributedString:v9];

  uint64_t v10 = NSNumber;
  v11 = [MEMORY[0x1E4F2B618] countUnit];
  [v5 doubleValueForUnit:v11];
  objc_super v12 = objc_msgSend(v10, "numberWithDouble:");
  [(HKSelectedRangeData *)v7 setValueAsNumber:v12];

  v15[0] = v7;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (id)_formattedCurrentValueForChartData:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[HKSleepApneaUtilities mostFrequentBreathingDisturbancesClassificationForChartData:v4];
  int64_t v6 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _statisticsTypeForChartData:v4 context:1];

  id v7 = [[HKSelectedRangeData alloc] initWithStatisticsType:v6];
  v8 = [(HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter *)self _attributedBreathingDisturbancesClassification:v5];
  [(HKSelectedRangeData *)v7 setAttributedString:v8];

  [(HKSelectedRangeData *)v7 setValueAsNumber:0];
  v11[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_attributedBreathingDisturbancesClassification:(id)a3
{
  id v4 = a3;
  v5 = [HKDateCache alloc];
  int64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [(HKDateCache *)v5 initWithCalendar:v6];

  v8 = [(HKInteractiveChartGenericStatFormatter *)self chartRangeProvider];
  v9 = [v8 effectiveVisibleRangeActive];
  uint64_t v10 = [v9 endDate];

  if (v4) {
    v11 = -[_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider initWithBreathingDisturbancesClassification:date:]([_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider alloc], "initWithBreathingDisturbancesClassification:date:", (int)[v4 intValue], v10);
  }
  else {
    v11 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  objc_super v12 = v11;
  v13 = [(HKInteractiveChartDataFormatter *)self displayType];
  v14 = [(HKInteractiveChartDataFormatter *)self unitController];
  v15 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v16 = [(_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *)v12 attributedStringWithDisplayType:v13 unitController:v14 valueFont:v15 unitFont:0 dateCache:v7];

  return v16;
}

- (int64_t)_statisticsTypeForChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v15 + 1) + 8 * i) recordCount];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
    uint64_t v11 = 25;
    if (v8 > 1) {
      uint64_t v11 = 28;
    }
    uint64_t v12 = 31;
    if (v8 > 1) {
      uint64_t v12 = 3;
    }
  }
  else
  {
    uint64_t v12 = 31;
    uint64_t v11 = 25;
  }
  if (a4 == 1) {
    int64_t v13 = v11;
  }
  else {
    int64_t v13 = v12;
  }

  return v13;
}

@end