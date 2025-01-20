@interface HKInteractiveChartHandwashingEventFormatter
- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4;
@end

@implementation HKInteractiveChartHandwashingEventFormatter

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v39 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += [*(id *)(*((void *)&v47 + 1) + 8 * i) recordCount];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v16 = [v15 localizedStringForKey:@"WASHES_NUMBERLESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v37 = (void *)v16;
    v41 = objc_msgSend(NSString, "localizedStringWithFormat:", v16, v11);
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v38 = v7;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v44;
      uint64_t v21 = 5;
      if (v11 == 1) {
        uint64_t v21 = 0;
      }
      uint64_t v40 = v21;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = [*(id *)(*((void *)&v43 + 1) + 8 * v22) integerValue];
          if (v23 != 0x40000)
          {
            if (v23 == 0x20000)
            {
              v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:v40];
              [(HKSelectedRangeData *)v24 setDataType:0];
              v25 = [NSNumber numberWithInteger:v11];
              [(HKSelectedRangeData *)v24 setValueAsNumber:v25];

              v26 = self;
              double v27 = (double)v11;
LABEL_25:
              v30 = [(HKInteractiveChartDataFormatter *)v26 formattedStringWithValue:v41 unitString:1 showUnit:v27];
              [(HKSelectedRangeData *)v24 setAttributedString:v30];

              [v14 addObject:v24];
              goto LABEL_29;
            }
            v42.receiver = self;
            v42.super_class = (Class)HKInteractiveChartHandwashingEventFormatter;
            v31 = [(HKInteractiveChartTimePeriodFormatter *)&v42 formattedSelectedRangeLabelDataWithChartData:v8 items:v17];
            [v14 addObjectsFromArray:v31];
            goto LABEL_27;
          }
          if ([v8 count])
          {
            v24 = [[HKSelectedRangeData alloc] initWithStatisticsType:8 * (v11 != 1)];
            [(HKSelectedRangeData *)v24 setDataType:0];
            double v28 = (double)(v11 / (unint64_t)[v8 count]);
            v29 = [NSNumber numberWithDouble:v28];
            [(HKSelectedRangeData *)v24 setValueAsNumber:v29];

            v26 = self;
            double v27 = v28;
            goto LABEL_25;
          }
          _HKInitializeLogging();
          v32 = (void *)*MEMORY[0x1E4F29FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
          {
            v31 = v32;
            v33 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v52 = v33;
            __int16 v53 = 2112;
            id v54 = v8;
            id v34 = v33;
            _os_log_error_impl(&dword_1E0B26000, v31, OS_LOG_TYPE_ERROR, "[%@]: Unable to compute daily average with 0 records: %@", buf, 0x16u);

LABEL_27:
          }
LABEL_29:
          ++v22;
        }
        while (v19 != v22);
        uint64_t v35 = [v17 countByEnumeratingWithState:&v43 objects:v55 count:16];
        uint64_t v19 = v35;
      }
      while (v35);
    }

    id v7 = v38;
    id v6 = v39;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

@end