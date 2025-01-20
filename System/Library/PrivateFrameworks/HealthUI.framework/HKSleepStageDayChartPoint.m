@interface HKSleepStageDayChartPoint
+ (id)chartPointsForSummaries:(id)a3 context:(id)a4;
- (HKSleepChartPointUserInfo)userInfo;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)yValue;
- (NSString)description;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)yValueForKey:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation HKSleepStageDayChartPoint

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (id)allYValues
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKSleepStageDayChartPoint;
  v4 = [(HKSleepStageDayChartPoint *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ { %@->%@ %@ }", v4, self->_startDate, self->_endDate, self->_yValue];

  return (NSString *)v5;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v73 = a4;
  v6 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:6];
  [v6 canonicalSize];
  double v8 = v7;

  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v5;
  uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v88;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v88 != v59) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v87 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v12 = [v10 morningIndex];
        v13 = [v10 calendar];
        uint64_t v14 = objc_msgSend(v11, "hk_dateOnDayIndex:atHour:calendar:", v12, 0, v13);

        v75 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 duration:v8];
        v74 = objc_msgSend(v10, "hkui_somnogramChartDateInterval");
        id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v16 = HKCategoryValueSleepAnalysisAsleepValues();
        v17 = [v16 allObjects];
        v18 = (void *)[v15 initWithArray:v17];

        [v18 addObject:&unk_1F3C21D00];
        uint64_t v19 = [v10 firstStartDateMatchingSleepValues:v18];
        v78 = v10;
        uint64_t v20 = [v10 lastEndDateMatchingSleepValues:v18];
        v21 = (void *)v20;
        v70 = 0;
        v64 = (void *)v14;
        uint64_t v65 = v9;
        v63 = v18;
        if (v19 && v20)
        {
          v70 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v20];
        }
        v61 = v21;
        v62 = (void *)v19;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v66 = [v10 periods];
        uint64_t v68 = [v66 countByEnumeratingWithState:&v83 objects:v92 count:16];
        if (v68)
        {
          uint64_t v67 = *(void *)v84;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v84 != v67) {
                objc_enumerationMutation(v66);
              }
              uint64_t v69 = v22;
              v23 = *(void **)(*((void *)&v83 + 1) + 8 * v22);
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v71 = [v23 segments];
              uint64_t v77 = [v71 countByEnumeratingWithState:&v79 objects:v91 count:16];
              if (v77)
              {
                uint64_t v76 = *(void *)v80;
                do
                {
                  for (uint64_t i = 0; i != v77; ++i)
                  {
                    if (*(void *)v80 != v76) {
                      objc_enumerationMutation(v71);
                    }
                    v25 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                    v26 = objc_alloc_init(HKSleepStageDayChartPoint);
                    v27 = [v25 dateInterval];
                    v28 = [v27 startDate];
                    v29 = objc_msgSend(v28, "hkui_dateNormalizedFromDateInterval:toDateInterval:", v74, v75);
                    [(HKSleepStageDayChartPoint *)v26 setStartDate:v29];

                    v30 = [v25 dateInterval];
                    v31 = [v30 endDate];
                    v32 = objc_msgSend(v31, "hkui_dateNormalizedFromDateInterval:toDateInterval:", v74, v75);
                    [(HKSleepStageDayChartPoint *)v26 setEndDate:v32];

                    v33 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [v73 chartType], v78);
                    [(HKSleepStageDayChartPoint *)v26 setUserInfo:v33];

                    v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v25, "category"));
                    uint64_t v35 = HKSleepChartPointFormatterOptionsForSleepAnalysis(v34);
                    v36 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                    [v36 setAnnotationOptions:v35];

                    v37 = NSNumber;
                    v38 = [v25 dateInterval];
                    [v38 duration];
                    v39 = objc_msgSend(v37, "numberWithDouble:");
                    v40 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                    [v40 setAnnotationOverrideDuration:v39];

                    v41 = [v25 dateInterval];
                    v42 = [v41 startDate];
                    v43 = [v25 dateInterval];
                    v44 = [v43 endDate];
                    v45 = +[HKValueRange valueRangeWithMinValue:v42 maxValue:v44];
                    v46 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                    [v46 setAnnotationOverrideDateRange:v45];

                    v47 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                    objc_msgSend(v47, "setAnnotationOptions:", objc_msgSend(v47, "annotationOptions") | 0x40);

                    v48 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                    objc_msgSend(v48, "setCurrentValueViewOptions:", objc_msgSend(v48, "currentValueViewOptions") | 0x40);

                    v49 = objc_msgSend(NSNumber, "numberWithInteger:", HKSleepSomnogramStageForSleepAnalysis(objc_msgSend(v25, "category")));
                    [(HKSleepStageDayChartPoint *)v26 setYValue:v49];

                    uint64_t v50 = [v25 category];
                    if (!v50)
                    {
                      if ([v78 hasSleepStageData]) {
                        goto LABEL_30;
                      }
                      uint64_t v51 = 2;
LABEL_28:
                      v52 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                      [v52 setAnnotationOverrideDuration:0];

                      v53 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                      [v53 setAnnotationOverrideDateRange:v70];

                      v54 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                      objc_msgSend(v54, "setAnnotationOptions:", objc_msgSend(v54, "annotationOptions") | v51);

                      v55 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                      objc_msgSend(v55, "setAnnotationOptions:", objc_msgSend(v55, "annotationOptions") & 0xFFFFFFFFFFFFFFBFLL);

                      v56 = [(HKSleepStageDayChartPoint *)v26 userInfo];
                      objc_msgSend(v56, "setCurrentValueViewOptions:", objc_msgSend(v56, "currentValueViewOptions") & 0xFFFFFFFFFFFFFFBFLL);

LABEL_29:
                      [v72 addObject:v26];
                      goto LABEL_30;
                    }
                    if (v50 == 1)
                    {
                      if (([v78 hasSleepStageData] & 1) == 0)
                      {
                        uint64_t v51 = 1;
                        goto LABEL_28;
                      }
                      goto LABEL_29;
                    }
                    if (v50 != 2 || ([v78 hasSleepStageData] & 1) != 0) {
                      goto LABEL_29;
                    }
LABEL_30:
                  }
                  uint64_t v77 = [v71 countByEnumeratingWithState:&v79 objects:v91 count:16];
                }
                while (v77);
              }

              uint64_t v22 = v69 + 1;
            }
            while (v69 + 1 != v68);
            uint64_t v68 = [v66 countByEnumeratingWithState:&v83 objects:v92 count:16];
          }
          while (v68);
        }

        uint64_t v9 = v65 + 1;
      }
      while (v65 + 1 != v60);
      uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
    }
    while (v60);
  }

  return v72;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (HKSleepChartPointUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end