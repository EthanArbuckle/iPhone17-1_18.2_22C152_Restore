@interface HKInteractiveChartAFibBurdenFormatter
- (HKInteractiveChartAFibBurdenFormatter)initWithStatisticsType:(int64_t)a3;
- (id)_formattedDataWithLessThan:(double)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (int64_t)statisticsType;
- (void)setStatisticsType:(int64_t)a3;
@end

@implementation HKInteractiveChartAFibBurdenFormatter

- (HKInteractiveChartAFibBurdenFormatter)initWithStatisticsType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
  result = [(HKInteractiveChartAFibBurdenFormatter *)&v5 init];
  if (result) {
    result->_statisticsType = a3;
  }
  return result;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6 || ![v6 count])
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
  v8 = [v7 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
    uint64_t v19 = [(HKInteractiveChartGenericStatFormatter *)&v27 formattedSelectedRangeLabelDataWithChartData:v7 context:a4];
    goto LABEL_17;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v24;
    double v15 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v17 value];
        if (v15 < v18) {
          double v15 = v18;
        }
        v13 |= [v17 clampsLowerData];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);

    if (v13)
    {
      uint64_t v19 = [(HKInteractiveChartAFibBurdenFormatter *)self _formattedDataWithLessThan:v15];
LABEL_17:
      v20 = (void *)v19;
      goto LABEL_20;
    }
  }
  else
  {
  }
  [(HKInteractiveChartGenericStatFormatter *)self setOverrideStatFormatterItemOptions:&unk_1F3C1F330];
  v22.receiver = self;
  v22.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
  v20 = [(HKInteractiveChartGenericStatFormatter *)&v22 formattedSelectedRangeLabelDataWithChartData:v10 context:a4];
  [(HKInteractiveChartAFibBurdenFormatter *)self statisticsType];
LABEL_20:

  return v20;
}

- (id)_formattedDataWithLessThan:(double)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  [v5 setFirstWeekday:2];
  id v6 = [[HKDateCache alloc] initWithCalendar:v5];
  v7 = [(HKInteractiveChartDataFormatter *)self displayType];
  v8 = [v7 presentation];
  v9 = [NSNumber numberWithDouble:a3];
  id v10 = [v8 adjustedValueForDaemonValue:v9];

  uint64_t v11 = [(HKInteractiveChartGenericStatFormatter *)self chartRangeProvider];
  uint64_t v12 = [v11 effectiveVisibleRangeActive];
  int v13 = [v12 endDate];

  uint64_t v14 = [[HKAFibBurdenDataProviderCurrentValue alloc] initWithMaxValue:v10 date:v13];
  double v15 = [(HKInteractiveChartDataFormatter *)self displayType];
  v16 = [(HKInteractiveChartDataFormatter *)self unitController];
  v17 = [(HKInteractiveChartDataFormatter *)self majorFont];
  double v18 = [(HKInteractiveChartDataFormatter *)self minorFont];
  uint64_t v19 = [(HKAFibBurdenDataProviderCurrentValue *)v14 attributedStringWithDisplayType:v15 unitController:v16 valueFont:v17 unitFont:v18 dateCache:v6];

  if (a3 <= 0.02) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = 9;
  }
  v21 = [[HKSelectedRangeData alloc] initWithStatisticsType:v20];
  [(HKSelectedRangeData *)v21 setValueAsNumber:0];
  [(HKSelectedRangeData *)v21 setAttributedString:v19];
  v24[0] = v21;
  objc_super v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

  return v22;
}

- (int64_t)statisticsType
{
  return self->_statisticsType;
}

- (void)setStatisticsType:(int64_t)a3
{
  self->_statisticsType = a3;
}

@end