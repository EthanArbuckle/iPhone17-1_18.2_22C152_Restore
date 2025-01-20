@interface HKInteractiveChartNumberFormatter
- (HKInteractiveChartNumberFormatter)init;
- (NSString)unitFormatString;
- (id)_formattedStringWithValue:(id)a3 formatter:(id)a4;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (void)setUnitFormatString:(id)a3;
@end

@implementation HKInteractiveChartNumberFormatter

- (HKInteractiveChartNumberFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartNumberFormatter;
  v2 = [(HKInteractiveChartNumberFormatter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    unitFormatString = v2->_unitFormatString;
    v2->_unitFormatString = 0;
  }
  return v3;
}

- (id)_formattedStringWithValue:(id)a3 formatter:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = [a4 stringFromNumber:a3];
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v12[0] = *MEMORY[0x1E4FB06F8];
  v7 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4FB0700];
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithString:v5 attributes:v9];

  return v10;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = [*(id *)(*((void *)&v36 + 1) + 8 * i) value];
          [v13 doubleValue];
          double v11 = v11 + v14;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    v16 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    v17 = [NSNumber numberWithDouble:v11];
    v18 = [v7 firstObject];
    v19 = [v18 numberFormatter];
    v20 = [(HKInteractiveChartNumberFormatter *)self _formattedStringWithValue:v17 formatter:v19];

    v21 = [(HKInteractiveChartNumberFormatter *)self unitFormatString];

    if (v21)
    {
      v22 = NSString;
      v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v24 = [(HKInteractiveChartNumberFormatter *)self unitFormatString];
      v25 = [v23 localizedStringForKey:v24 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v26 = objc_msgSend(v22, "localizedStringWithFormat:", v25, *(void *)&v11);

      id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
      v42[0] = *MEMORY[0x1E4FB06F8];
      v28 = [(HKInteractiveChartDataFormatter *)self minorFont];
      v43[0] = v28;
      v42[1] = *MEMORY[0x1E4FB0700];
      v29 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
      v43[1] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      v31 = (void *)[v27 initWithString:v26 attributes:v30];

      v41[0] = v20;
      v41[1] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
      v33 = HKUIJoinAttributedStringsWithFormat(v32, @"%1$@ %2$@");
      [(HKSelectedRangeData *)v16 setAttributedString:v33];
    }
    else
    {
      [(HKSelectedRangeData *)v16 setAttributedString:v20];
    }
    v34 = [NSNumber numberWithDouble:v11];
    [(HKSelectedRangeData *)v16 setValueAsNumber:v34];

    v40 = v16;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (NSString)unitFormatString
{
  return self->_unitFormatString;
}

- (void)setUnitFormatString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end