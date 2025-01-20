@interface HKSleepComparisonDayChartPoint
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

@implementation HKSleepComparisonDayChartPoint

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)minYValue
{
  return (id)[NSNumber numberWithDouble:0.0];
}

- (id)maxYValue
{
  return (id)[NSNumber numberWithDouble:43200.0];
}

- (id)allYValues
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HKSleepComparisonDayChartPoint *)self minYValue];
  v7[0] = v3;
  v4 = [(HKSleepComparisonDayChartPoint *)self maxYValue];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKSleepComparisonDayChartPoint;
  v4 = [(HKSleepComparisonDayChartPoint *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ { %@->%@ %@ }", v4, self->_startDate, self->_endDate, self->_yValue];

  return (NSString *)v5;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = [v8 periods];
        uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v31)
        {
          uint64_t v30 = *(void *)v39;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v29);
              }
              uint64_t v32 = v9;
              v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              v11 = [v10 segments];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v35;
                do
                {
                  for (uint64_t i = 0; i != v13; ++i)
                  {
                    if (*(void *)v35 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                    if ([v16 category] != 2)
                    {
                      v17 = objc_alloc_init(HKSleepComparisonDayChartPoint);
                      v18 = [v16 dateInterval];
                      v19 = [v18 startDate];
                      [(HKSleepComparisonDayChartPoint *)v17 setStartDate:v19];

                      v20 = [v16 dateInterval];
                      v21 = [v20 endDate];
                      [(HKSleepComparisonDayChartPoint *)v17 setEndDate:v21];

                      v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "category"));
                      [(HKSleepComparisonDayChartPoint *)v17 setYValue:v22];

                      v23 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [v6 chartType], v8);
                      [(HKSleepComparisonDayChartPoint *)v17 setUserInfo:v23];

                      [v33 addObject:v17];
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v13);
              }

              uint64_t v9 = v32 + 1;
            }
            while (v32 + 1 != v31);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v31);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v27);
  }

  return v33;
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