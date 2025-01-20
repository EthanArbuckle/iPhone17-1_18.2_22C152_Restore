@interface HKInteractiveChartCardioFitnessFormatter
- (id)_attributedCurrentCardioFitnessClassificationForChartData:(id)a3;
- (id)_formattedCurrentValueForChartData:(id)a3 context:(int64_t)a4;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKInteractiveChartCardioFitnessFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v8 = v7;
  if (v7 && [v7 count])
  {
    if (a4 == 1)
    {
      uint64_t v9 = [(HKInteractiveChartCardioFitnessFormatter *)self _formattedCurrentValueForChartData:v8 context:1];
    }
    else
    {
      if (a4) {
        goto LABEL_9;
      }
      v11.receiver = self;
      v11.super_class = (Class)HKInteractiveChartCardioFitnessFormatter;
      uint64_t v9 = [(HKInteractiveChartGenericStatFormatter *)&v11 formattedSelectedRangeLabelDataWithChartData:v8 context:0];
    }
    v4 = (void *)v9;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_9:

  return v4;
}

- (id)_formattedCurrentValueForChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "sampleCount", (void)v19);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);

      if (v11 <= 1) {
        uint64_t v14 = 22;
      }
      else {
        uint64_t v14 = 23;
      }
    }
    else
    {

      uint64_t v14 = 22;
    }
    v16 = [[HKSelectedRangeData alloc] initWithStatisticsType:v14];
    v17 = [(HKInteractiveChartCardioFitnessFormatter *)self _attributedCurrentCardioFitnessClassificationForChartData:v8];
    [(HKSelectedRangeData *)v16 setAttributedString:v17];

    [(HKSelectedRangeData *)v16 setValueAsNumber:0];
    v24 = v16;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)HKInteractiveChartCardioFitnessFormatter;
    v15 = [(HKInteractiveChartGenericStatFormatter *)&v23 formattedSelectedRangeLabelDataWithChartData:v6 context:a4];
  }

  return v15;
}

- (id)_attributedCurrentCardioFitnessClassificationForChartData:(id)a3
{
  id v4 = a3;
  v5 = [HKDateCache alloc];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [(HKDateCache *)v5 initWithCalendar:v6];

  id v8 = [(HKInteractiveChartGenericStatFormatter *)self chartRangeProvider];
  uint64_t v9 = [v8 effectiveVisibleRangeActive];
  uint64_t v10 = [v9 endDate];

  uint64_t v11 = +[HKCardioFitnessUtilities cardioFitnessLookupPropertiesForChartData:v4];

  if (v11)
  {
    uint64_t v12 = [HKCardioFitnessDataProviderCurrentValue alloc];
    v13 = [v11 vo2MaxQuantity];
    uint64_t v14 = -[HKCardioFitnessDataProviderCurrentValue initWithVO2MaxQuantity:biologicalSex:age:date:](v12, "initWithVO2MaxQuantity:biologicalSex:age:date:", v13, [v11 biologicalSex], objc_msgSend(v11, "age"), v10);
  }
  else
  {
    uint64_t v14 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  v15 = [(HKInteractiveChartDataFormatter *)self displayType];
  v16 = [(HKInteractiveChartDataFormatter *)self unitController];
  v17 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v18 = [(HKDataProviderNoDataCurrentValue *)v14 attributedStringWithDisplayType:v15 unitController:v16 valueFont:v17 unitFont:0 dateCache:v7];

  return v18;
}

@end