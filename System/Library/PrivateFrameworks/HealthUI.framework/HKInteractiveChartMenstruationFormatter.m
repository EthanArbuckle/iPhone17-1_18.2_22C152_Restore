@interface HKInteractiveChartMenstruationFormatter
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKInteractiveChartMenstruationFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5 || ![v5 count])
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_27;
  }
  v7 = [(HKInteractiveChartDataFormatter *)self displayType];
  v8 = objc_msgSend(v7, "hk_enumeratedValueLabels");

  if (v8 && [v6 count] == 1)
  {
    v9 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    v10 = [v6 firstObject];
    v11 = [(HKInteractiveChartCategoryValueFormatter *)self _formattedStringWithValue:[(HKSelectedRangeData *)v10 value] useColorAttributes:1];
    [(HKSelectedRangeData *)v9 setAttributedString:v11];

    if ([(HKSelectedRangeData *)v10 startOfCycle]) {
      uint64_t v12 = 12;
    }
    else {
      uint64_t v12 = 11;
    }
    [(HKSelectedRangeData *)v9 setDataType:v12];
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKSelectedRangeData value](v10, "value"));
    [(HKSelectedRangeData *)v9 setValueAsNumber:v13];

    v36[0] = v9;
    v14 = (void *)MEMORY[0x1E4F1C978];
    v15 = (HKSelectedRangeData **)v36;
    goto LABEL_25;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    char v21 = 0;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v17);
        }
        char v24 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "startOfCycle", (void)v28);
        v20 |= v24;
        v21 |= v24 ^ 1;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v19);
  }
  else
  {
    char v20 = 0;
    char v21 = 0;
  }

  -[HKInteractiveChartCategoryValueFormatter _formattedStringWithCount:](self, "_formattedStringWithCount:", [v17 count]);
  v9 = (HKSelectedRangeData *)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) != 0 && (v20 & 1) == 0)
  {
    v10 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
    [(HKSelectedRangeData *)v10 setAttributedString:v9];
    [(HKSelectedRangeData *)v10 setDataType:11];
    [(HKSelectedRangeData *)v10 setValueAsNumber:0];
    v34 = v10;
    v14 = (void *)MEMORY[0x1E4F1C978];
    v15 = &v34;
LABEL_25:
    v16 = objc_msgSend(v14, "arrayWithObjects:count:", v15, 1, (void)v28);
    goto LABEL_26;
  }
  v10 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
  [(HKSelectedRangeData *)v10 setAttributedString:v9];
  if (!(v21 & 1 | ((v20 & 1) == 0)))
  {
    [(HKSelectedRangeData *)v10 setDataType:12];
    [(HKSelectedRangeData *)v10 setValueAsNumber:0];
    v33 = v10;
    v14 = (void *)MEMORY[0x1E4F1C978];
    v15 = &v33;
    goto LABEL_25;
  }
  [(HKSelectedRangeData *)v10 setDataType:11];
  [(HKSelectedRangeData *)v10 setValueAsNumber:0];
  v25 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
  [(HKSelectedRangeData *)v25 setDataType:12];
  v26 = [(HKInteractiveChartCategoryValueFormatter *)self _formattedStringWithText:@" "];
  [(HKSelectedRangeData *)v25 setAttributedString:v26];

  [(HKSelectedRangeData *)v25 setValueAsNumber:0];
  v32[0] = v10;
  v32[1] = v25;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

LABEL_26:
LABEL_27:

  return v16;
}

@end