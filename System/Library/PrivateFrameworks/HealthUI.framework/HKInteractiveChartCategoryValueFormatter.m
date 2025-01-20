@interface HKInteractiveChartCategoryValueFormatter
- (HKInteractiveChartCategoryValueFormatter)initWithLocalizedCategoryName:(id)a3;
- (NSString)localizedCategoryName;
- (id)_formattedStringWithCount:(int64_t)a3;
- (id)_formattedStringWithText:(id)a3;
- (id)_formattedStringWithValue:(int64_t)a3 useColorAttributes:(BOOL)a4;
- (id)_uniqueChartPoints:(id)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (void)setLocalizedCategoryName:(id)a3;
@end

@implementation HKInteractiveChartCategoryValueFormatter

- (HKInteractiveChartCategoryValueFormatter)initWithLocalizedCategoryName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartCategoryValueFormatter;
  v5 = [(HKInteractiveChartCategoryValueFormatter *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HKInteractiveChartCategoryValueFormatter *)v5 setLocalizedCategoryName:v4];
  }

  return v6;
}

- (id)_formattedStringWithValue:(int64_t)a3 useColorAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  v22[2] = *MEMORY[0x1E4F143B8];
  v7 = [(HKInteractiveChartDataFormatter *)self displayType];
  objc_super v8 = objc_msgSend(v7, "hk_enumeratedValueLabels");

  if (v4)
  {
    v21[0] = *MEMORY[0x1E4FB06F8];
    v9 = [(HKInteractiveChartDataFormatter *)self majorFont];
    v22[0] = v9;
    v21[1] = *MEMORY[0x1E4FB0700];
    v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
    v22[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4FB06F8];
    v9 = [(HKInteractiveChartDataFormatter *)self majorFont];
    v20 = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  }

  if (v8)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13 = [NSNumber numberWithInteger:a3];
    v14 = [v8 objectForKeyedSubscript:v13];
    v15 = (void *)[v12 initWithString:v14 attributes:v11];
  }
  else
  {
    v16 = [(HKInteractiveChartDataFormatter *)self displayType];
    v17 = [v16 localization];
    v13 = [v17 displayName];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v11];
  }

  return v15;
}

- (id)_formattedStringWithCount:(int64_t)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"ENTRIES_NUMBERLESS_VALUE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  objc_super v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, a3);
  uint64_t v29 = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = v29;
  v10 = [(HKInteractiveChartDataFormatter *)self minorFont];
  v31[0] = v10;
  uint64_t v30 = *MEMORY[0x1E4FB0700];
  uint64_t v11 = v30;
  id v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  v31[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v29 count:2];
  v14 = (void *)[v7 initWithString:v8 attributes:v13];

  v15 = HKIntegerFormatter();
  v16 = [NSNumber numberWithInteger:a3];
  v17 = [v15 stringFromNumber:v16];

  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  v27[0] = v9;
  uint64_t v19 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v27[1] = v11;
  v28[0] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v28[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v22 = (void *)[v18 initWithString:v17 attributes:v21];

  v26[0] = v22;
  v26[1] = v14;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v24 = HKUIJoinAttributedStringsWithFormat(v23, @"%1$@ %2$@");

  return v24;
}

- (id)_formattedStringWithText:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v12[0] = *MEMORY[0x1E4FB06F8];
  id v7 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4FB0700];
  objc_super v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithString:v5 attributes:v9];

  return v10;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    objc_super v8 = [(HKInteractiveChartCategoryValueFormatter *)self _uniqueChartPoints:v7];
    uint64_t v9 = [(HKInteractiveChartDataFormatter *)self displayType];
    v10 = objc_msgSend(v9, "hk_enumeratedValueLabels");

    if ([v8 count] == 1)
    {
      uint64_t v11 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
      if (v10)
      {
        id v12 = [v8 firstObject];
        v13 = -[HKInteractiveChartCategoryValueFormatter _formattedStringWithValue:useColorAttributes:](self, "_formattedStringWithValue:useColorAttributes:", [v12 value], 1);
        [(HKSelectedRangeData *)v11 setAttributedString:v13];

        v14 = [(HKInteractiveChartDataFormatter *)self displayType];
        v15 = [v14 displayCategory];
        uint64_t v16 = [v15 categoryID];

        if (v16 == 26) {
          [(HKSelectedRangeData *)v11 setStatisticsType:20];
        }
      }
      else
      {
        id v12 = [(HKInteractiveChartCategoryValueFormatter *)self localizedCategoryName];
        v21 = [(HKInteractiveChartCategoryValueFormatter *)self _formattedStringWithText:v12];
        [(HKSelectedRangeData *)v11 setAttributedString:v21];
      }
    }
    else
    {
      if ((unint64_t)[v8 count] > 1 || a4 == 1) {
        uint64_t v19 = 5;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v11 = [[HKSelectedRangeData alloc] initWithStatisticsType:v19];
      v20 = -[HKInteractiveChartCategoryValueFormatter _formattedStringWithCount:](self, "_formattedStringWithCount:", [v8 count]);
      [(HKSelectedRangeData *)v11 setAttributedString:v20];

      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      [(HKSelectedRangeData *)v11 setValueAsNumber:v12];
    }

    v23[0] = v11;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)_uniqueChartPoints:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          if ((objc_msgSend(v5, "containsObject:", v12, (void)v14) & 1) == 0)
          {
            [v4 addObject:v12];
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end