@interface HKInteractiveChartGenericStatFormatter
+ (int64_t)mapSingleItemToStatisticsType:(id)a3;
- (HKInteractiveChartRangeProvider)chartRangeProvider;
- (NSArray)configuredStatItems;
- (NSArray)overrideStatFormatterItemOptions;
- (id)_formatMin:(double)a3 max:(double)a4 unit:(id)a5;
- (id)_formattedAnnotationForDistributionChartData:(id)a3;
- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4;
- (id)_makeSelectedRangeDataWithAvg:(double)a3 unit:(id)a4 showUnit:(BOOL)a5 statisticsType:(int64_t)a6;
- (id)_makeSelectedRangeDataWithMax:(double)a3 unit:(id)a4 prepend:(id)a5 statisticsType:(int64_t)a6;
- (id)_makeSelectedRangeDataWithMin:(double)a3 max:(double)a4 unit:(id)a5 statisticsType:(int64_t)a6;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)selectedRangeSeparatorString;
- (void)configureFormatterForDisplayType:(id)a3 quantityType:(id)a4 chartRangeProvider:(id)a5 timeScope:(int64_t)a6 context:(int64_t)a7;
- (void)setChartRangeProvider:(id)a3;
- (void)setConfiguredStatItems:(id)a3;
- (void)setOverrideStatFormatterItemOptions:(id)a3;
@end

@implementation HKInteractiveChartGenericStatFormatter

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v106 = v5;
  if (v5 && [v5 count])
  {
    v109 = v6;
    v107 = [v5 firstObject];
    v7 = [(HKInteractiveChartGenericStatFormatter *)self overrideStatFormatterItemOptions];
    v8 = [v7 firstObject];
    int v9 = [v8 integerValue];

    if ([v5 count] != 1
      || (v9 & 0x100000) != 0
      || [v107 representsRange]
      && ([v107 maxValue], double v11 = v10, objc_msgSend(v107, "minValue"), v11 - v12 > 2.22044605e-16))
    {
      if ([v107 representsRange]) {
        [v107 minValue];
      }
      else {
        [v107 value];
      }
      double v24 = v13;
      if ([v107 representsRange]) {
        [v107 maxValue];
      }
      else {
        [v107 value];
      }
      double v26 = v25;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id obj = v5;
      uint64_t v27 = [obj countByEnumeratingWithState:&v116 objects:v123 count:16];
      if (v27)
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        uint64_t v30 = *(void *)v117;
        double v31 = (double)(unint64_t)*MEMORY[0x1E4F296E8];
        double v32 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v117 != v30) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            if ([v34 representsRange])
            {
              [v34 minValue];
              if (v35 < v24) {
                double v24 = v35;
              }
              [v34 maxValue];
            }
            else
            {
              [v34 value];
              if (v37 < v24) {
                double v24 = v37;
              }
              [v34 value];
            }
            if (v36 >= v26) {
              double v26 = v36;
            }
            [v34 value];
            double v39 = v38;
            uint64_t v40 = [v34 recordCount];
            uint64_t v41 = [v34 recordCount];
            v42 = [v34 statisticsInterval];
            objc_msgSend(v42, "hk_approximateDuration");
            BOOL v44 = HKUIEqualDoubles(v43, v31);

            if (v44) {
              v29 += [v34 recordCount];
            }
            else {
              uint64_t v29 = 0;
            }
            double v32 = v32 + v39 * (double)v40;
            v28 += v41;
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v116 objects:v123 count:16];
        }
        while (v27);
        double v45 = (double)v28;
      }
      else
      {
        uint64_t v29 = 0;
        double v45 = 0.0;
        double v32 = 0.0;
      }

      v46 = [obj lastObject];
      [v46 value];
      double v48 = v47;
      v49 = [obj firstObject];
      [v49 value];
      double v51 = v50;

      if (v29 < 1) {
        double v52 = 0.0;
      }
      else {
        double v52 = v32 / (double)v29;
      }
      v14 = [MEMORY[0x1E4F1CA48] array];
      if ([v109 count])
      {
        v53 = v109;
      }
      else
      {

        v53 = &unk_1F3C1F168;
      }
      v109 = v53;
      if ([v53 count])
      {
        unint64_t v55 = 0;
        uint64_t v56 = 0;
        double v57 = v48 - v51;
        BOOL v58 = v48 - v51 < 0.0;
        if (v48 - v51 >= 0.0) {
          uint64_t v59 = 6;
        }
        else {
          uint64_t v59 = 7;
        }
        uint64_t v105 = 9;
        double v60 = v32 / v45;
        if (v58) {
          double v61 = -v57;
        }
        else {
          double v61 = v57;
        }
        *(void *)&long long v54 = 138412290;
        long long v104 = v54;
        do
        {
          v62 = objc_msgSend(v109, "objectAtIndexedSubscript:", v55, v104);
          uint64_t v63 = [v109 count];
          uint64_t v64 = [v62 integerValue];
          uint64_t v65 = v63 - 1;
          if (v64 > 2047)
          {
            if (v64 >= 0x8000)
            {
              if (v64 >= 0x80000)
              {
                if (v64 == 0x80000)
                {
                  BOOL v96 = v55 == v65;
                  if ([obj count] == 1) {
                    uint64_t v97 = 24;
                  }
                  else {
                    uint64_t v97 = 3;
                  }
                  v98 = [v107 unit];
                  v99 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v98 unit:v96 showUnit:v97 statisticsType:v60];
                  [v14 addObject:v99];

                  goto LABEL_111;
                }
                if (v64 == 0x100000)
                {
                  *(void *)&long long buf = 0;
                  *((void *)&buf + 1) = &buf;
                  uint64_t v121 = 0x2020000000;
                  char v122 = 0;
                  uint64_t v112 = 0;
                  v113 = (double *)&v112;
                  uint64_t v114 = 0x2020000000;
                  uint64_t v115 = 0;
                  v111[0] = MEMORY[0x1E4F143A8];
                  v111[1] = 3221225472;
                  v111[2] = __94__HKInteractiveChartGenericStatFormatter__formattedSelectedRangeLabelDataWithChartData_items___block_invoke;
                  v111[3] = &unk_1E6D52808;
                  v111[4] = &buf;
                  v111[5] = &v112;
                  [obj enumerateObjectsUsingBlock:v111];
                  if ([obj count] == 1)
                  {
                    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
                    {
                      v81 = [v107 unit];
                      v82 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithMin:v81 max:9 unit:v24 statisticsType:v26];
                      [v14 addObject:v82];
LABEL_110:

                      _Block_object_dispose(&v112, 8);
                      _Block_object_dispose(&buf, 8);
                      goto LABEL_111;
                    }
LABEL_104:
                    if (v113[3] >= v26)
                    {
                      v101 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                      v81 = [v101 localizedStringForKey:@"BELOW_MAXIMUM_DEPTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Charon"];
                    }
                    else
                    {
LABEL_105:
                      v81 = 0;
                    }
                    v82 = [v107 unit];
                    v102 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithMax:v82 unit:v81 prepend:29 statisticsType:v26];
                    [v14 addObject:v102];

                    goto LABEL_110;
                  }
                  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
                    goto LABEL_104;
                  }
                  goto LABEL_105;
                }
              }
              else
              {
                if (v64 == 0x8000)
                {
                  uint64_t v69 = 18;
                  goto LABEL_95;
                }
                if (v64 == 0x10000)
                {
                  uint64_t v69 = 19;
LABEL_95:
                  uint64_t v105 = v69;
                }
              }
            }
            else
            {
              if (v64 < 0x2000)
              {
                if (v64 == 2048)
                {
                  BOOL v85 = v55 == v65;
                  v86 = [v107 unit];
                  v87 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v86 unit:v85 showUnit:14 statisticsType:v60];
                  [v14 addObject:v87];

                  goto LABEL_111;
                }
                if (v64 != 4096) {
                  goto LABEL_111;
                }
                goto LABEL_81;
              }
              if (v64 == 0x2000) {
                goto LABEL_81;
              }
              if (v64 == 0x4000)
              {
                uint64_t v69 = 17;
                goto LABEL_95;
              }
            }
          }
          else
          {
            if (v64 > 31)
            {
              if (v64 > 511)
              {
                if (v64 == 512)
                {
                  BOOL v93 = v55 == v65;
                  v94 = [v107 unit];
                  v95 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v94 unit:v93 showUnit:13 statisticsType:v60];
                  [v14 addObject:v95];
                }
                else if (v64 == 1024)
                {
                  BOOL v78 = v55 == v65;
                  v79 = [v107 unit];
                  v80 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v79 unit:v78 showUnit:12 statisticsType:v60];
                  [v14 addObject:v80];
                }
              }
              else if (v64 == 32)
              {
                BOOL v88 = v55 == v65;
                v89 = [[HKSelectedRangeData alloc] initWithStatisticsType:v59];
                v90 = [v107 unit];
                v91 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v90 unit:v88 showUnit:v61];
                [(HKSelectedRangeData *)v89 setAttributedString:v91];

                v92 = [NSNumber numberWithDouble:v61];
                [(HKSelectedRangeData *)v89 setValueAsNumber:v92];

                [v14 addObject:v89];
              }
              else if (v64 == 128)
              {
                if (v29 < 1)
                {
                  _HKInitializeLogging();
                  v100 = *MEMORY[0x1E4F29FB0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = v104;
                    *(void *)((char *)&buf + 4) = obj;
                    _os_log_error_impl(&dword_1E0B26000, v100, OS_LOG_TYPE_ERROR, "Error formatting daily average with incoming chart data: %@", (uint8_t *)&buf, 0xCu);
                  }
                }
                else
                {
                  BOOL v66 = v55 == v65;
                  v67 = [v107 unit];
                  v68 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v67 unit:v66 showUnit:8 statisticsType:v52];
                  [v14 addObject:v68];
                }
              }
              goto LABEL_111;
            }
            if (v64 > 7)
            {
              if (v64 != 8)
              {
                if (v64 == 16)
                {
                  BOOL v70 = v55 == v65;
                  v71 = [[HKSelectedRangeData alloc] initWithStatisticsType:5];
                  v72 = [v107 unit];
                  v73 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v72 unit:v70 showUnit:v32];
                  [(HKSelectedRangeData *)v71 setAttributedString:v73];

                  v74 = [NSNumber numberWithDouble:v32];
                  [(HKSelectedRangeData *)v71 setValueAsNumber:v74];

                  [v14 addObject:v71];
                }
                goto LABEL_111;
              }
LABEL_81:
              BOOL v75 = v55 == v65;
              v76 = [v107 unit];
              v77 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithAvg:v76 unit:v75 showUnit:3 statisticsType:v60];
              [v14 addObject:v77];

              goto LABEL_111;
            }
            if (v64 == 2)
            {
              if ((v56 | 1) != 3)
              {
                v56 |= 1uLL;
                goto LABEL_111;
              }
LABEL_91:
              v83 = [v107 unit];
              v84 = [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithMin:v83 max:v105 unit:v24 statisticsType:v26];
              [v14 addObject:v84];

              uint64_t v56 = 0;
              goto LABEL_111;
            }
            if (v64 == 4)
            {
              if ((v56 & 0xFFFFFFFFFFFFFFFDLL) != 1)
              {
                uint64_t v56 = 2;
                goto LABEL_111;
              }
              goto LABEL_91;
            }
          }
LABEL_111:

          ++v55;
        }
        while (v55 < [v109 count]);
      }
    }
    else
    {
      v15 = [v109 firstObject];
      int64_t v16 = +[HKInteractiveChartGenericStatFormatter mapSingleItemToStatisticsType:v15];

      if (!v16)
      {
        if ([v107 recordCount] <= 1) {
          int64_t v16 = 0;
        }
        else {
          int64_t v16 = 3;
        }
      }
      v17 = [[HKSelectedRangeData alloc] initWithStatisticsType:v16];
      [v107 minValue];
      double v19 = v18;
      v20 = [v107 unit];
      v21 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v20 unit:1 showUnit:v19];
      [(HKSelectedRangeData *)v17 setAttributedString:v21];

      [(HKSelectedRangeData *)v17 setDataType:0];
      v22 = NSNumber;
      [v107 minValue];
      v23 = objc_msgSend(v22, "numberWithDouble:");
      [(HKSelectedRangeData *)v17 setValueAsNumber:v23];

      v124[0] = v17;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:1];
    }
    id v6 = v109;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

uint64_t __94__HKInteractiveChartGenericStatFormatter__formattedSelectedRangeLabelDataWithChartData_items___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v10;
  if (isKindOfClass)
  {
    id v5 = [v10 metadata];
    id v6 = [v5 valueForKey:*MEMORY[0x1E4F2A1C0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 BOOLValue];
      [v10 maxValue];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v7 < *(double *)(v8 + 24)) {
        double v7 = *(double *)(v8 + 24);
      }
      *(double *)(v8 + 24) = v7;
    }

    id v4 = v10;
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v4);
}

- (void)configureFormatterForDisplayType:(id)a3 quantityType:(id)a4 chartRangeProvider:(id)a5 timeScope:(int64_t)a6 context:(int64_t)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_storeStrong((id *)&self->_chartRangeProvider, a5);
  v15 = [v12 chartingRules];
  if ([v15 chartStyleForTimeScope:a6] == 3)
  {

LABEL_4:
    double v18 = &unk_1F3C1F180;
LABEL_5:
    [(HKInteractiveChartGenericStatFormatter *)self setConfiguredStatItems:v18];
    goto LABEL_6;
  }
  int64_t v16 = [v12 chartingRules];
  uint64_t v17 = [v16 chartStyleForTimeScope:a6];

  if (v17 == 9) {
    goto LABEL_4;
  }
  double v19 = [v13 identifier];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F2A8A0]];

  if (v20)
  {
    double v18 = &unk_1F3C1F198;
    goto LABEL_5;
  }
  v21 = [v13 identifier];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F2A930]];

  if (v22)
  {
    double v18 = &unk_1F3C1F1B0;
    goto LABEL_5;
  }
  if ([v12 displayTypeIdentifier] != 125)
  {
    if ([v13 aggregationStyle])
    {
      if (a6 == 2 || a7 == 1) {
        double v18 = &unk_1F3C1F228;
      }
      else {
        double v18 = &unk_1F3C1F240;
      }
    }
    else
    {
      if ((unint64_t)a6 > 8) {
        goto LABEL_6;
      }
      if (((1 << a6) & 0x1C3) != 0)
      {
        double v18 = &unk_1F3C1F210;
      }
      else if (((1 << a6) & 0xC) != 0)
      {
        double v18 = &unk_1F3C1F1F8;
      }
      else if (a7 == 1)
      {
        double v18 = &unk_1F3C1F1C8;
      }
      else
      {
        double v18 = &unk_1F3C1F1E0;
      }
    }
    goto LABEL_5;
  }
  unint64_t v23 = (unint64_t)(a7 == 0) << 6;
  uint64_t v24 = v23 | 8;
  if ((unint64_t)(a6 - 6) < 3) {
    v23 |= 0x10uLL;
  }
  if ((unint64_t)a6 >= 6) {
    unint64_t v25 = v23;
  }
  else {
    unint64_t v25 = v24;
  }
  double v26 = [NSNumber numberWithUnsignedInteger:v25];
  v28[0] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(HKInteractiveChartGenericStatFormatter *)self setConfiguredStatItems:v27];

LABEL_6:
}

- (id)_makeSelectedRangeDataWithAvg:(double)a3 unit:(id)a4 showUnit:(BOOL)a5 statisticsType:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  double v11 = [[HKSelectedRangeData alloc] initWithStatisticsType:a6];
  id v12 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v10 unit:v7 showUnit:a3];

  [(HKSelectedRangeData *)v11 setAttributedString:v12];
  id v13 = [NSNumber numberWithDouble:a3];
  [(HKSelectedRangeData *)v11 setValueAsNumber:v13];

  return v11;
}

- (id)_makeSelectedRangeDataWithMin:(double)a3 max:(double)a4 unit:(id)a5 statisticsType:(int64_t)a6
{
  id v10 = a5;
  double v11 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v10 unit:1 showUnit:a3];
  id v12 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v10 unit:1 showUnit:a4];
  id v13 = [NSNumber numberWithDouble:a3];
  id v14 = [(HKInteractiveChartDataFormatter *)self unitStringFromUnit:v10 number:v13];

  v15 = [NSNumber numberWithDouble:a4];
  int64_t v16 = [(HKInteractiveChartDataFormatter *)self unitStringFromUnit:v10 number:v15];

  unsigned __int8 v26 = 0;
  uint64_t v17 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  double v18 = [(HKInteractiveChartDataFormatter *)self majorFont];
  double v19 = [(HKInteractiveChartNumberRangeFormatter *)v17 attributedStringForMinimumString:v11 maximumString:v12 minimumUnitString:v14 maximumUnitString:v16 valueFont:v18 formatForChart:1 resultIsASingleValue:&v26];

  LODWORD(v18) = v26;
  int v20 = [HKSelectedRangeData alloc];
  if (v18)
  {
    v21 = [(HKSelectedRangeData *)v20 initWithStatisticsType:0];
    int v22 = NSNumber;
    double v23 = a3;
  }
  else
  {
    v21 = [(HKSelectedRangeData *)v20 initWithStatisticsType:a6];
    int v22 = NSNumber;
    double v23 = a4;
  }
  uint64_t v24 = [v22 numberWithDouble:v23];
  [(HKSelectedRangeData *)v21 setValueAsNumber:v24];

  [(HKSelectedRangeData *)v21 setAttributedString:v19];
  return v21;
}

- (id)_makeSelectedRangeDataWithMax:(double)a3 unit:(id)a4 prepend:(id)a5 statisticsType:(int64_t)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = [[HKSelectedRangeData alloc] initWithStatisticsType:a6];
  id v13 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v11 unit:1 showUnit:a3];

  if (v10)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v13];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
    [v14 insertAttributedString:v15 atIndex:0];

    id v13 = v14;
  }
  v20[0] = v13;
  int64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v17 = HKUIJoinAttributedStringsForLocale(v16);
  [(HKSelectedRangeData *)v12 setAttributedString:v17];

  double v18 = [NSNumber numberWithDouble:a3];
  [(HKSelectedRangeData *)v12 setValueAsNumber:v18];

  return v12;
}

- (id)selectedRangeSeparatorString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"RANGE_SEPARATOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(HKInteractiveChartGenericStatFormatter *)self overrideStatFormatterItemOptions];

  if (v6) {
    [(HKInteractiveChartGenericStatFormatter *)self overrideStatFormatterItemOptions];
  }
  else {
  BOOL v7 = [(HKInteractiveChartGenericStatFormatter *)self configuredStatItems];
  }
  uint64_t v8 = [(HKInteractiveChartGenericStatFormatter *)self _formattedSelectedRangeLabelDataWithChartData:v5 items:v7];

  return v8;
}

+ (int64_t)mapSingleItemToStatisticsType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    uint64_t v6 = 18;
    uint64_t v7 = 19;
    uint64_t v8 = 24;
    if (v5 != 0x80000) {
      uint64_t v8 = 0;
    }
    if (v5 != 0x10000) {
      uint64_t v7 = v8;
    }
    if (v5 != 0x8000) {
      uint64_t v6 = v7;
    }
    uint64_t v9 = 15;
    uint64_t v10 = 16;
    uint64_t v11 = 17;
    if (v5 != 0x4000) {
      uint64_t v11 = 0;
    }
    if (v5 != 0x2000) {
      uint64_t v10 = v11;
    }
    if (v5 != 4096) {
      uint64_t v9 = v10;
    }
    if (v5 < 0x8000) {
      uint64_t v6 = v9;
    }
    uint64_t v12 = 13;
    uint64_t v13 = 12;
    uint64_t v14 = 14;
    if (v5 != 2048) {
      uint64_t v14 = 0;
    }
    if (v5 != 1024) {
      uint64_t v13 = v14;
    }
    if (v5 != 512) {
      uint64_t v12 = v13;
    }
    uint64_t v15 = 5;
    uint64_t v16 = 8;
    uint64_t v17 = 11;
    if (v5 != 256) {
      uint64_t v17 = 0;
    }
    if (v5 != 128) {
      uint64_t v16 = v17;
    }
    if (v5 != 16) {
      uint64_t v15 = v16;
    }
    if (v5 <= 511) {
      uint64_t v12 = v15;
    }
    if (v5 <= 4095) {
      int64_t v18 = v12;
    }
    else {
      int64_t v18 = v6;
    }
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (NSArray)overrideStatFormatterItemOptions
{
  return self->_overrideStatFormatterItemOptions;
}

- (void)setOverrideStatFormatterItemOptions:(id)a3
{
}

- (HKInteractiveChartRangeProvider)chartRangeProvider
{
  return self->_chartRangeProvider;
}

- (void)setChartRangeProvider:(id)a3
{
}

- (NSArray)configuredStatItems
{
  return self->_configuredStatItems;
}

- (void)setConfiguredStatItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredStatItems, 0);
  objc_storeStrong((id *)&self->_chartRangeProvider, 0);
  objc_storeStrong((id *)&self->_overrideStatFormatterItemOptions, 0);
}

- (id)_formattedAnnotationForDistributionChartData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  [v5 minimumValue];
  double v7 = v6;
  [v5 maximumValue];
  double v9 = v8;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "minimumValue", (void)v22);
        if (v16 < v7) {
          double v7 = v16;
        }
        [v15 maximumValue];
        if (v17 >= v9) {
          double v9 = v17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }

  int64_t v18 = [v5 unit];
  double v19 = [(HKInteractiveChartGenericStatFormatter *)self _formatMin:v18 max:v7 unit:v9];

  unsigned __int8 v26 = v19;
  int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];

  return v20;
}

- (id)_formatMin:(double)a3 max:(double)a4 unit:(id)a5
{
  return [(HKInteractiveChartGenericStatFormatter *)self _makeSelectedRangeDataWithMin:a5 max:9 unit:a3 statisticsType:a4];
}

@end