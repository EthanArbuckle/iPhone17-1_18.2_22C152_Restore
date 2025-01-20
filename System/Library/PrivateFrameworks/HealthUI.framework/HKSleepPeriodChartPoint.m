@interface HKSleepPeriodChartPoint
+ (id)chartPointsForSummaries:(id)a3 context:(id)a4;
- (BOOL)highlighted;
- (HKSleepChartPointUserInfo)userInfo;
- (NSArray)asleepOffsets;
- (NSArray)inBedOffsets;
- (NSDate)xValue;
- (NSNumber)lowerGoal;
- (NSNumber)upperGoal;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)xValueAsGenericType;
- (void)setAsleepOffsets:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInBedOffsets:(id)a3;
- (void)setLowerGoal:(id)a3;
- (void)setUpperGoal:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXValue:(id)a3;
@end

@implementation HKSleepPeriodChartPoint

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)minYValue
{
  v2 = [(HKSleepPeriodChartPoint *)self allYValues];
  v3 = [v2 lastObject];

  if (v3)
  {
    [v3 doubleValue];
    if (v4 > 1.79769313e308) {
      double v4 = 1.79769313e308;
    }
  }
  else
  {
    double v4 = 1.79769313e308;
  }
  v5 = [NSNumber numberWithDouble:v4];

  return v5;
}

- (id)maxYValue
{
  v2 = [(HKSleepPeriodChartPoint *)self allYValues];
  v3 = [v2 firstObject];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = fmax(v4, -1.79769313e308);
  }
  else
  {
    double v5 = -1.79769313e308;
  }
  v6 = [NSNumber numberWithDouble:v5];

  return v6;
}

- (id)allYValues
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_inBedOffsets];
  [v3 addObjectsFromArray:self->_asleepOffsets];
  double v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"value" ascending:0];
  v8[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 sortUsingDescriptors:v5];

  v6 = objc_msgSend(v3, "hk_map:", &__block_literal_global_48);

  return v6;
}

uint64_t __37__HKSleepPeriodChartPoint_allYValues__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKSleepPeriodChartPoint_chartPointsForSummaries_context___block_invoke;
  v9[3] = &unk_1E6D540D0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

HKSleepPeriodChartPoint *__59__HKSleepPeriodChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = a1;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [v2 periods];
  uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v54;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v3;
        double v4 = *(void **)(*((void *)&v53 + 1) + 8 * v3);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        objc_msgSend(v4, "segments", v39);
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v48 = [v45 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v48)
        {
          uint64_t v47 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v50 != v47) {
                objc_enumerationMutation(v45);
              }
              id v6 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v7 = [v6 dateInterval];
              v8 = [v7 startDate];
              v9 = [v2 dateInterval];
              id v10 = [v9 startDate];
              uint64_t v11 = objc_msgSend(v8, "hk_isBeforeDate:", v10);

              v12 = [v6 dateInterval];
              v13 = [v12 endDate];
              v14 = [v2 dateInterval];
              v15 = [v14 endDate];
              uint64_t v16 = objc_msgSend(v13, "hk_isAfterDate:", v15);

              v17 = [v2 dateInterval];
              v18 = [v6 dateInterval];
              v19 = [v17 intersectionWithDateInterval:v18];

              v20 = [v19 startDate];
              v21 = [v2 dateInterval];
              v22 = [v21 startDate];
              [v20 timeIntervalSinceDate:v22];
              double v24 = v23;

              [v19 duration];
              double v26 = v24 + v25;
              v27 = [NSNumber numberWithDouble:v24];
              v28 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v27 continuation:v11];

              v29 = [NSNumber numberWithDouble:v26];
              v30 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v29 continuation:v16];

              uint64_t v31 = [v6 category];
              if ((unint64_t)(v31 - 3) < 3) {
                goto LABEL_14;
              }
              v32 = v44;
              if (v31)
              {
                if (v31 != 1) {
                  goto LABEL_16;
                }
LABEL_14:
                v32 = v46;
              }
              [v32 addObject:v28];
              [v32 addObject:v30];
LABEL_16:
            }
            uint64_t v48 = [v45 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v48);
        }

        uint64_t v3 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v42);
  }

  v33 = objc_alloc_init(HKSleepPeriodChartPoint);
  [(HKSleepPeriodChartPoint *)v33 setAsleepOffsets:v46];
  [(HKSleepPeriodChartPoint *)v33 setInBedOffsets:v44];
  v34 = +[HKSleepUtilities sleepDaySummaryNoonAlignedXValue:v2];
  [(HKSleepPeriodChartPoint *)v33 setXValue:v34];

  [(HKSleepPeriodChartPoint *)v33 setHighlighted:0];
  v35 = objc_msgSend(v2, "hk_bedtimeGoalValue");
  [(HKSleepPeriodChartPoint *)v33 setLowerGoal:v35];

  v36 = objc_msgSend(v2, "hk_wakeTimeGoalValue");
  [(HKSleepPeriodChartPoint *)v33 setUpperGoal:v36];

  v37 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [*(id *)(v39 + 32) chartType], v2);
  [(HKSleepPeriodChartPoint *)v33 setUserInfo:v37];

  return v33;
}

- (NSArray)asleepOffsets
{
  return self->_asleepOffsets;
}

- (void)setAsleepOffsets:(id)a3
{
}

- (NSArray)inBedOffsets
{
  return self->_inBedOffsets;
}

- (void)setInBedOffsets:(id)a3
{
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (NSNumber)upperGoal
{
  return self->_upperGoal;
}

- (void)setUpperGoal:(id)a3
{
}

- (NSNumber)lowerGoal
{
  return self->_lowerGoal;
}

- (void)setLowerGoal:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
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
  objc_storeStrong((id *)&self->_lowerGoal, 0);
  objc_storeStrong((id *)&self->_upperGoal, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
  objc_storeStrong((id *)&self->_inBedOffsets, 0);
  objc_storeStrong((id *)&self->_asleepOffsets, 0);
}

@end