@interface HKHealthChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKHealthChartPoint)initWithDataSourceValue:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6;
- (HKHealthChartPoint)initWithStatistics:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6 sourceTimeZone:(id)a7;
- (NSString)description;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HKHealthChartPoint

- (NSString)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sum = self->_sum;
  if (sum) {
    [v3 setObject:sum forKeyedSubscript:@"sum"];
  }
  min = self->_min;
  if (min) {
    [v4 setObject:min forKeyedSubscript:@"min"];
  }
  max = self->_max;
  if (max) {
    [v4 setObject:max forKeyedSubscript:@"max"];
  }
  avg = self->_avg;
  if (avg) {
    [v4 setObject:avg forKeyedSubscript:@"avg"];
  }
  mostRecent = self->_mostRecent;
  if (mostRecent) {
    [v4 setObject:mostRecent forKeyedSubscript:@"mostRecent"];
  }
  v10 = [MEMORY[0x1E4F28E78] string];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = [v4 allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v17 = [v4 objectForKeyedSubscript:v16];
        [v10 appendFormat:@"%@=%@ ", v16, v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  v23.receiver = self;
  v23.super_class = (Class)HKHealthChartPoint;
  v18 = [(HKHealthChartPoint *)&v23 description];
  v19 = v18;
  date = self->_date;
  if (!date) {
    date = (NSDate *)&stru_1F3B9CF20;
  }
  v21 = [v18 stringByAppendingFormat:@";%@;%@", date, v10];

  return (NSString *)v21;
}

- (HKHealthChartPoint)initWithStatistics:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6 sourceTimeZone:(id)a7
{
  char v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v63.receiver = self;
  v63.super_class = (Class)HKHealthChartPoint;
  uint64_t v16 = [(HKHealthChartPoint *)&v63 init];
  if (!v16) {
    goto LABEL_23;
  }
  v17 = [v12 startDate];
  v18 = [v12 endDate];
  v19 = HKUIMidDate(v17, v18);
  uint64_t v20 = objc_msgSend(v19, "hk_dateFromSourceTimeZone:", v15);
  date = v16->_date;
  v16->_date = (NSDate *)v20;

  if ((v10 & 0x10) != 0)
  {
    v22 = [v12 sumQuantity];
    objc_super v23 = v22;
    if (v22)
    {
      long long v24 = NSNumber;
      [v22 doubleValueForUnit:v13];
      uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
      sum = v16->_sum;
      v16->_sum = (NSNumber *)v25;

      long long v27 = [v14 presentation];
      uint64_t v28 = [v27 adjustedValueForDaemonValue:v16->_sum];
      uint64_t v29 = v16->_sum;
      v16->_sum = (NSNumber *)v28;
    }
    if ((v10 & 2) == 0)
    {
LABEL_4:
      if ((v10 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_4;
  }
  v30 = [v12 averageQuantity];
  v31 = v30;
  if (v30)
  {
    v32 = NSNumber;
    [v30 doubleValueForUnit:v13];
    uint64_t v33 = objc_msgSend(v32, "numberWithDouble:");
    avg = v16->_avg;
    v16->_avg = (NSNumber *)v33;

    v35 = [v14 presentation];
    uint64_t v36 = [v35 adjustedValueForDaemonValue:v16->_avg];
    v37 = v16->_avg;
    v16->_avg = (NSNumber *)v36;
  }
  if ((v10 & 4) == 0)
  {
LABEL_5:
    if ((v10 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_14:
  v38 = [v12 minimumQuantity];
  v39 = v38;
  if (v38)
  {
    v40 = NSNumber;
    [v38 doubleValueForUnit:v13];
    uint64_t v41 = objc_msgSend(v40, "numberWithDouble:");
    min = v16->_min;
    v16->_min = (NSNumber *)v41;

    v43 = [v14 presentation];
    uint64_t v44 = [v43 adjustedValueForDaemonValue:v16->_min];
    v45 = v16->_min;
    v16->_min = (NSNumber *)v44;
  }
  if ((v10 & 8) == 0)
  {
LABEL_6:
    if ((v10 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
LABEL_17:
  v46 = [v12 maximumQuantity];
  v47 = v46;
  if (v46)
  {
    v48 = NSNumber;
    [v46 doubleValueForUnit:v13];
    uint64_t v49 = objc_msgSend(v48, "numberWithDouble:");
    max = v16->_max;
    v16->_max = (NSNumber *)v49;

    v51 = [v14 presentation];
    uint64_t v52 = [v51 adjustedValueForDaemonValue:v16->_max];
    v53 = v16->_max;
    v16->_max = (NSNumber *)v52;
  }
  if ((v10 & 0x20) != 0)
  {
LABEL_20:
    v54 = [v12 mostRecentQuantity];
    v55 = v54;
    if (v54)
    {
      v56 = NSNumber;
      [v54 doubleValueForUnit:v13];
      uint64_t v57 = objc_msgSend(v56, "numberWithDouble:");
      mostRecent = v16->_mostRecent;
      v16->_mostRecent = (NSNumber *)v57;

      v59 = [v14 presentation];
      uint64_t v60 = [v59 adjustedValueForDaemonValue:v16->_mostRecent];
      v61 = v16->_mostRecent;
      v16->_mostRecent = (NSNumber *)v60;
    }
  }
LABEL_23:

  return v16;
}

- (HKHealthChartPoint)initWithDataSourceValue:(id)a3 options:(unint64_t)a4 unit:(id)a5 displayType:(id)a6
{
  char v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v59.receiver = self;
  v59.super_class = (Class)HKHealthChartPoint;
  id v13 = [(HKHealthChartPoint *)&v59 init];
  if (!v13) {
    goto LABEL_23;
  }
  id v14 = [v10 startDate];
  id v15 = [v10 endDate];
  uint64_t v16 = HKUIMidDate(v14, v15);
  date = v13->_date;
  v13->_date = (NSDate *)v16;

  if ((v8 & 0x10) != 0)
  {
    v18 = [v10 sumQuantity];
    v19 = v18;
    if (v18)
    {
      uint64_t v20 = NSNumber;
      [v18 doubleValueForUnit:v11];
      uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
      sum = v13->_sum;
      v13->_sum = (NSNumber *)v21;

      objc_super v23 = [v12 presentation];
      uint64_t v24 = [v23 adjustedValueForDaemonValue:v13->_sum];
      uint64_t v25 = v13->_sum;
      v13->_sum = (NSNumber *)v24;
    }
    if ((v8 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  long long v26 = [v10 averageQuantity];
  long long v27 = v26;
  if (v26)
  {
    uint64_t v28 = NSNumber;
    [v26 doubleValueForUnit:v11];
    uint64_t v29 = objc_msgSend(v28, "numberWithDouble:");
    avg = v13->_avg;
    v13->_avg = (NSNumber *)v29;

    v31 = [v12 presentation];
    uint64_t v32 = [v31 adjustedValueForDaemonValue:v13->_avg];
    uint64_t v33 = v13->_avg;
    v13->_avg = (NSNumber *)v32;
  }
  if ((v8 & 4) == 0)
  {
LABEL_5:
    if ((v8 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_14:
  v34 = [v10 minQuantity];
  v35 = v34;
  if (v34)
  {
    uint64_t v36 = NSNumber;
    [v34 doubleValueForUnit:v11];
    uint64_t v37 = objc_msgSend(v36, "numberWithDouble:");
    min = v13->_min;
    v13->_min = (NSNumber *)v37;

    v39 = [v12 presentation];
    uint64_t v40 = [v39 adjustedValueForDaemonValue:v13->_min];
    uint64_t v41 = v13->_min;
    v13->_min = (NSNumber *)v40;
  }
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
LABEL_17:
  v42 = [v10 maxQuantity];
  v43 = v42;
  if (v42)
  {
    uint64_t v44 = NSNumber;
    [v42 doubleValueForUnit:v11];
    uint64_t v45 = objc_msgSend(v44, "numberWithDouble:");
    max = v13->_max;
    v13->_max = (NSNumber *)v45;

    v47 = [v12 presentation];
    uint64_t v48 = [v47 adjustedValueForDaemonValue:v13->_max];
    uint64_t v49 = v13->_max;
    v13->_max = (NSNumber *)v48;
  }
  if ((v8 & 0x20) != 0)
  {
LABEL_20:
    v50 = [v10 mostRecentQuantity];
    v51 = v50;
    if (v50)
    {
      uint64_t v52 = NSNumber;
      [v50 doubleValueForUnit:v11];
      uint64_t v53 = objc_msgSend(v52, "numberWithDouble:");
      mostRecent = v13->_mostRecent;
      v13->_mostRecent = (NSNumber *)v53;

      v55 = [v12 presentation];
      uint64_t v56 = [v55 adjustedValueForDaemonValue:v13->_mostRecent];
      uint64_t v57 = v13->_mostRecent;
      v13->_mostRecent = (NSNumber *)v56;
    }
  }
LABEL_23:

  return v13;
}

- (id)xValueAsGenericType
{
  return self->_date;
}

- (id)yValue
{
  avg = self->_avg;
  if (!avg)
  {
    avg = self->_sum;
    if (!avg)
    {
      avg = self->_max;
      if (!avg)
      {
        avg = self->_min;
        if (!avg) {
          avg = self->_mostRecent;
        }
      }
    }
  }
  return avg;
}

- (id)yValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"min"])
  {
    uint64_t v5 = 24;
LABEL_11:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"max"])
  {
    uint64_t v5 = 32;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"avg"])
  {
    uint64_t v5 = 40;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"sum"])
  {
    uint64_t v5 = 16;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"mostRecent"])
  {
    uint64_t v5 = 48;
    goto LABEL_11;
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

- (id)allYValues
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_avg) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_sum) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_max) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_min) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_mostRecent) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)minYValue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_min = &self->_min;
  min = self->_min;
  if (min)
  {
    id v4 = min;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(HKHealthChartPoint *)self allYValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v4 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!v4 || [*(id *)(*((void *)&v13 + 1) + 8 * i) compare:v4] == -1)
          {
            id v11 = v10;

            id v4 = v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      id v4 = 0;
    }

    objc_storeStrong((id *)p_min, v4);
  }
  return v4;
}

- (id)maxYValue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_max = &self->_max;
  max = self->_max;
  if (max)
  {
    id v4 = max;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(HKHealthChartPoint *)self allYValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v4 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!v4 || [*(id *)(*((void *)&v13 + 1) + 8 * i) compare:v4] == 1)
          {
            id v11 = v10;

            id v4 = v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      id v4 = 0;
    }

    objc_storeStrong((id *)p_max, v4);
  }
  return v4;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_mostRecent, 0);
  objc_storeStrong((id *)&self->_avg, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
  objc_storeStrong((id *)&self->_sum, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end