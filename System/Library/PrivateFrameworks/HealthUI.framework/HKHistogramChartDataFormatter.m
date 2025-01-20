@interface HKHistogramChartDataFormatter
- (HKHistogramChartDataFormatter)initWithUnit:(id)a3;
- (HKUnit)unit;
- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKHistogramChartDataFormatter

- (HKHistogramChartDataFormatter)initWithUnit:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHistogramChartDataFormatter;
  v6 = [(HKHistogramChartDataFormatter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unit, a3);
    v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopValueFont");
    [(HKInteractiveChartDataFormatter *)v7 setMajorFont:v8];

    v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
    [(HKInteractiveChartDataFormatter *)v7 setMinorFont:v9];

    [(HKInteractiveChartDataFormatter *)v7 setDisplayType:0];
  }

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;

        v9 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  }
  while (v8);
  if (v9)
  {
    v14 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    [(HKSelectedRangeData *)v14 setDataType:0];
    [v9 yValue];
    double v16 = v15;
    v17 = [(HKHistogramChartDataFormatter *)self unit];
    v18 = [(HKHistogramChartDataFormatter *)self _formattedStringWithValue:v17 unit:1 showUnit:v16];
    [(HKSelectedRangeData *)v14 setAttributedString:v18];

    v25 = v14;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  }
  else
  {
LABEL_13:
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  BOOL v5 = a5;
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = NSNumber;
  id v9 = a4;
  uint64_t v10 = [v8 numberWithDouble:a3];
  objc_super v11 = [v9 unitString];

  v12 = [v10 stringValue];
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  uint64_t v34 = *MEMORY[0x1E4FB06F8];
  double v15 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v35[0] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  v17 = (void *)[v13 initWithString:v12 attributes:v16];

  if (v5 && [v11 length])
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v32 = v14;
    v19 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v33 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    long long v21 = (void *)[v18 initWithString:@" " attributes:v20];

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v30 = v14;
    long long v23 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v31 = v23;
    long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v25 = (void *)[v22 initWithString:v11 attributes:v24];

    v29[0] = v17;
    v29[1] = v21;
    v29[2] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    HKUIJoinAttributedStringsForLocale(v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v27 = v17;
  }

  return v27;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
}

@end