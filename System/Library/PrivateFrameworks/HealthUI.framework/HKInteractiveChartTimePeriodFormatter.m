@interface HKInteractiveChartTimePeriodFormatter
- (double)_boundedTimePeriodFromDataPoint:(id)a3 boundedValueRange:(id)a4;
- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 boundedValueRange:(id)a6;
- (id)_formattedStringWithData:(id)a3 roundToHours:(BOOL)a4 displayUnit:(BOOL)a5;
- (id)formattedBoundedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 chartRangeProvider:(id)a6;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5;
@end

@implementation HKInteractiveChartTimePeriodFormatter

- (id)_formattedStringWithData:(id)a3 roundToHours:(BOOL)a4 displayUnit:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  timePeriodFormatter = self->_timePeriodFormatter;
  if (!timePeriodFormatter)
  {
    v9 = [(HKInteractiveChartDataFormatter *)self unitController];
    v10 = [(HKInteractiveChartDataFormatter *)self displayType];
    v11 = [v9 unitForDisplayType:v10];

    v12 = [(HKInteractiveChartDataFormatter *)self displayType];
    v13 = objc_msgSend(v12, "hk_numberFormatterForUnit:", v11);

    v14 = [(HKDisplayTypeValueFormatter *)[HKTimePeriodDisplayTypeValueFormatter alloc] initWithNumberFormatter:v13];
    v15 = self->_timePeriodFormatter;
    self->_timePeriodFormatter = v14;

    timePeriodFormatter = self->_timePeriodFormatter;
  }
  v16 = NSNumber;
  [v7 timePeriod];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = [(HKInteractiveChartDataFormatter *)self displayType];
  v19 = [(HKInteractiveChartDataFormatter *)self unitController];
  v20 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v21 = [(HKInteractiveChartDataFormatter *)self minorFont];
  LOBYTE(v24) = 1;
  v22 = [(HKTimePeriodDisplayTypeValueFormatter *)timePeriodFormatter attributedStringFromValue:v17 roundToHours:v5 displayType:v18 unitController:v19 valueFont:v20 unitFont:v21 formatForChart:v24];

  return v22;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5
{
  return [(HKInteractiveChartTimePeriodFormatter *)self _formattedSelectedRangeLabelDataWithChartData:a3 items:a4 customDataType:a5 boundedValueRange:0];
}

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 boundedValueRange:(id)a6
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v9 || ![v9 count])
  {
    id v81 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_60;
  }
  v12 = [v9 firstObject];
  if ([v9 count] == 1)
  {
    uint64_t v13 = [v12 recordCount];
    if (!v11 && v13 <= 1)
    {
      v14 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
      [(HKSelectedRangeData *)v14 setDataType:a5];
      v15 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v12 roundToHours:0 displayUnit:1];
      [(HKSelectedRangeData *)v14 setAttributedString:v15];

      v16 = NSNumber;
      [v12 timePeriod];
      v17 = objc_msgSend(v16, "numberWithDouble:");
      [(HKSelectedRangeData *)v14 setValueAsNumber:v17];

      v102[0] = v14;
      id v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
LABEL_58:

      goto LABEL_59;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = v12;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v101 count:16];
    id v87 = v11;
    id v78 = v9;
    id v79 = v10;
    v77 = v12;
    id obj = v18;
    if (v19)
    {
      uint64_t v20 = v19;
      int64_t v82 = a5;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      id v85 = *(id *)v95;
      double v23 = (double)(unint64_t)*MEMORY[0x1E4F296E8];
      double v24 = 0.0;
      double v25 = 0.0;
      v26 = v14;
      v27 = v14;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(id *)v95 != v85) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          [v29 timePeriod];
          if (v11) {
            [(HKInteractiveChartTimePeriodFormatter *)self _boundedTimePeriodFromDataPoint:v29 boundedValueRange:v11];
          }
          double v31 = v30;
          [(HKSelectedRangeData *)v26 timePeriod];
          if (v31 - v32 < 2.22044605e-16)
          {
            v33 = v29;

            v26 = v33;
          }
          [(HKSelectedRangeData *)v27 timePeriod];
          if (v31 - v34 <= 2.22044605e-16)
          {
            v89 = v27;
          }
          else
          {
            v35 = v29;

            v89 = v35;
          }
          uint64_t v36 = [v29 recordCount];
          uint64_t v37 = [v29 recordCount];
          v38 = [v29 statisticsInterval];
          objc_msgSend(v38, "hk_approximateDuration");
          BOOL v40 = HKUIEqualDoubles(v39, v23);

          if (v40)
          {
            double v24 = v24 + v31 * (double)[v29 recordCount];
            v22 += [v29 recordCount];
          }
          else
          {
            uint64_t v22 = 0;
          }
          id v11 = v87;
          double v25 = v25 + v31 * (double)v36;
          v21 += v37;
          v27 = v89;
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
      }
      while (v20);

      double v41 = v25 / (double)v21;
      id v10 = v79;
      if (v22 < 1)
      {
        int v80 = 0;
      }
      else
      {
        double v24 = v24 / (double)v22;
        int v80 = 1;
      }
      a5 = v82;
      v14 = v26;
    }
    else
    {

      int v80 = 0;
      double v25 = 0.0;
      double v41 = NAN;
      v89 = v14;
      double v24 = 0.0;
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v43 = v10;
    v44 = v42;
    id v86 = v43;
    uint64_t v45 = [v43 countByEnumeratingWithState:&v90 objects:v100 count:16];
    id v81 = v42;
    if (!v45)
    {
LABEL_57:

      id v11 = v87;
      id v9 = v78;
      id v10 = v79;
      v12 = v77;
      goto LABEL_58;
    }
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v91;
    v83 = v14;
LABEL_34:
    uint64_t v48 = 0;
    while (1)
    {
      if (*(void *)v91 != v47) {
        objc_enumerationMutation(v86);
      }
      uint64_t v49 = [*(id *)(*((void *)&v90 + 1) + 8 * v48) integerValue];
      if (v49 <= 7)
      {
        if (v49 == 2)
        {
          v50 = [[HKSelectedRangeData alloc] initWithStatisticsType:1];
          [(HKSelectedRangeData *)v50 setDataType:a5];
          v72 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v14 roundToHours:0 displayUnit:0];
          [(HKSelectedRangeData *)v50 setAttributedString:v72];

          v58 = NSNumber;
          v59 = v14;
LABEL_50:
          [(HKSelectedRangeData *)v59 timePeriod];
          v73 = objc_msgSend(v58, "numberWithDouble:");
          [(HKSelectedRangeData *)v50 setValueAsNumber:v73];

          [v44 addObject:v50];
LABEL_51:

          goto LABEL_52;
        }
        if (v49 == 4)
        {
          v50 = [[HKSelectedRangeData alloc] initWithStatisticsType:2];
          [(HKSelectedRangeData *)v50 setDataType:a5];
          v57 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v89 roundToHours:0 displayUnit:0];
          [(HKSelectedRangeData *)v50 setAttributedString:v57];

          v58 = NSNumber;
          v59 = v89;
          v44 = v81;
          goto LABEL_50;
        }
      }
      else
      {
        switch(v49)
        {
          case 8:
            v50 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            [(HKSelectedRangeData *)v50 setTimePeriod:v41];
            v60 = [(HKSelectedRangeData *)v14 timePeriodPrefix];
            [(HKSelectedRangeData *)v50 setTimePeriodPrefix:v60];

            v61 = [(HKInteractiveChartDataFormatter *)self displayType];
            BOOL v62 = [v61 displayTypeIdentifier] == 70;

            v63 = [[HKSelectedRangeData alloc] initWithStatisticsType:3];
            [(HKSelectedRangeData *)v63 setDataType:a5];
            v64 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v50 roundToHours:v62 displayUnit:0];
            [(HKSelectedRangeData *)v63 setAttributedString:v64];

            v65 = NSNumber;
            double v66 = v41;
LABEL_48:
            v71 = [v65 numberWithDouble:v66];
            [(HKSelectedRangeData *)v63 setValueAsNumber:v71];

            v14 = v83;
            [v44 addObject:v63];

            goto LABEL_51;
          case 16:
            v50 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            [(HKSelectedRangeData *)v50 setTimePeriod:v25];
            v67 = [(HKSelectedRangeData *)v14 timePeriodPrefix];
            [(HKSelectedRangeData *)v50 setTimePeriodPrefix:v67];

            v68 = [(HKInteractiveChartDataFormatter *)self displayType];
            BOOL v69 = [v68 displayTypeIdentifier] == 70;

            v63 = [[HKSelectedRangeData alloc] initWithStatisticsType:5];
            [(HKSelectedRangeData *)v63 setDataType:a5];
            v70 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v50 roundToHours:v69 displayUnit:0];
            [(HKSelectedRangeData *)v63 setAttributedString:v70];

            v65 = NSNumber;
            double v66 = v25;
            goto LABEL_48;
          case 128:
            if (!v80)
            {
              _HKInitializeLogging();
              v74 = *MEMORY[0x1E4F29FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v99 = obj;
                _os_log_error_impl(&dword_1E0B26000, v74, OS_LOG_TYPE_ERROR, "Error formatting daily average with incoming chart data: %@", buf, 0xCu);
              }
              break;
            }
            v50 = [[HKSelectedRangeData alloc] initWithStatisticsType:8];
            [(HKSelectedRangeData *)v50 setDataType:a5];
            v51 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            [(HKInteractiveChartTimePeriodData *)v51 setTimePeriod:v24];
            v52 = [(HKSelectedRangeData *)v83 timePeriodPrefix];
            [(HKInteractiveChartTimePeriodData *)v51 setTimePeriodPrefix:v52];

            v53 = [(HKInteractiveChartDataFormatter *)self displayType];
            BOOL v54 = [v53 displayTypeIdentifier] == 70;

            v44 = v81;
            v55 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedStringWithData:v51 roundToHours:v54 displayUnit:0];
            [(HKSelectedRangeData *)v50 setAttributedString:v55];

            v56 = [NSNumber numberWithDouble:v24];
            [(HKSelectedRangeData *)v50 setValueAsNumber:v56];

            [v81 addObject:v50];
            v14 = v83;
            goto LABEL_51;
        }
      }
LABEL_52:
      if (v46 == ++v48)
      {
        uint64_t v75 = [v86 countByEnumeratingWithState:&v90 objects:v100 count:16];
        uint64_t v46 = v75;
        if (!v75) {
          goto LABEL_57;
        }
        goto LABEL_34;
      }
    }
  }
  id v81 = (id)MEMORY[0x1E4F1CBF0];
LABEL_59:

LABEL_60:
  return v81;
}

- (double)_boundedTimePeriodFromDataPoint:(id)a3 boundedValueRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 startDate];
  double v8 = 0.0;
  double v9 = 0.0;
  if (v7)
  {
    id v10 = (void *)v7;
    id v11 = [v6 startDate];
    v12 = [v5 startDate];
    int v13 = objc_msgSend(v11, "hk_isAfterDate:", v12);

    if (v13)
    {
      v14 = [v6 startDate];
      v15 = [v5 startDate];
      [v14 timeIntervalSinceDate:v15];
      double v9 = v16;
    }
  }
  uint64_t v17 = [v5 endDate];
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = [v6 endDate];
    uint64_t v20 = [v5 endDate];
    int v21 = objc_msgSend(v19, "hk_isBeforeDate:", v20);

    if (v21)
    {
      uint64_t v22 = [v5 endDate];
      double v23 = [v6 endDate];
      [v22 timeIntervalSinceDate:v23];
      double v8 = v24;
    }
  }
  [v5 timePeriod];
  double v26 = v25 - v9 - v8;

  return v26;
}

- (id)formattedBoundedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 chartRangeProvider:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [a6 actualVisibleRange];
  int v13 = [(HKInteractiveChartTimePeriodFormatter *)self _formattedSelectedRangeLabelDataWithChartData:v11 items:v10 customDataType:a5 boundedValueRange:v12];

  return v13;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  return [(HKInteractiveChartTimePeriodFormatter *)self formattedSelectedRangeLabelDataWithChartData:a3 items:a4 customDataType:0];
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  return [(HKInteractiveChartTimePeriodFormatter *)self formattedSelectedRangeLabelDataWithChartData:a3 items:&unk_1F3C1F2A0];
}

- (void).cxx_destruct
{
}

@end