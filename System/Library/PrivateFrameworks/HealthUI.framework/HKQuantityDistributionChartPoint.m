@interface HKQuantityDistributionChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketDate:(id)a4 bucketIncrement:(double)a5 unit:(id)a6 displayType:(id)a7;
- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6;
- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 unit:(id)a4 displayType:(id)a5;
- (NSArray)bucketCounts;
- (NSDate)bucketDate;
- (NSNumber)maximumY;
- (NSNumber)minimumY;
- (NSString)description;
- (double)bucketIncrement;
- (double)minimumBucketValue;
- (id)_quickDate:(id)a3;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HKQuantityDistributionChartPoint

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketDate:(id)a4 bucketIncrement:(double)a5 unit:(id)a6 displayType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)HKQuantityDistributionChartPoint;
  v16 = [(HKQuantityDistributionChartPoint *)&v37 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_bucketDate, a4);
    v18 = [v15 presentation];
    v19 = NSNumber;
    v20 = [v12 minimumValue];
    [v20 doubleValueForUnit:v14];
    v21 = objc_msgSend(v19, "numberWithDouble:");
    uint64_t v22 = [v18 adjustedValueForDaemonValue:v21];
    minimumY = v17->_minimumY;
    v17->_minimumY = (NSNumber *)v22;

    v24 = [v15 presentation];
    v25 = NSNumber;
    v26 = [v12 maximumValue];
    [v26 doubleValueForUnit:v14];
    v27 = objc_msgSend(v25, "numberWithDouble:");
    uint64_t v28 = [v24 adjustedValueForDaemonValue:v27];
    maximumY = v17->_maximumY;
    v17->_maximumY = (NSNumber *)v28;

    v30 = [v15 presentation];
    v31 = [v12 minimumBucketValue];
    [v31 doubleValueForUnit:v14];
    objc_msgSend(v30, "adjustedDoubleForDaemonDouble:");
    v17->_minimumBucketValue = v32;

    v17->_bucketIncrement = a5;
    uint64_t v33 = [v12 histogramCounts];
    bucketCounts = v17->_bucketCounts;
    v17->_bucketCounts = (NSArray *)v33;

    userInfo = v17->_userInfo;
    v17->_userInfo = 0;
  }
  return v17;
}

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v12 startDate];
  id v14 = [v12 endDate];
  id v15 = HKUIMidDate(v13, v14);

  v16 = [(HKQuantityDistributionChartPoint *)self initWithHistogramData:v12 bucketDate:v15 bucketIncrement:v11 unit:v10 displayType:a4];
  return v16;
}

- (HKQuantityDistributionChartPoint)initWithHistogramData:(id)a3 unit:(id)a4 displayType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HKQuantityDistributionDataSource bucketSizeForDisplayType:v8 preferredUnit:v9];
  id v12 = [v10 startDate];
  id v13 = [v10 endDate];
  id v14 = HKUIMidDate(v12, v13);

  [v11 floatValue];
  v16 = [(HKQuantityDistributionChartPoint *)self initWithHistogramData:v10 bucketDate:v14 bucketIncrement:v9 unit:v8 displayType:v15];

  return v16;
}

- (id)_quickDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"MM/dd/YYYY-HH:mm:ss"];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  v7 = [v5 stringFromDate:v4];

  return v7;
}

- (NSString)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v3 setNumberStyle:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_bucketCounts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v3 stringFromNumber:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = [v4 componentsJoinedByString:@","];
  id v12 = NSString;
  id v13 = [(HKQuantityDistributionChartPoint *)self _quickDate:self->_bucketDate];
  id v14 = [v12 stringWithFormat:@"chartpoint{%@ min %@ max %@ bfloor %lg bsize %lg [%@]}", v13, self->_minimumY, self->_maximumY, *(void *)&self->_minimumBucketValue, *(void *)&self->_bucketIncrement, v11, (void)v16];

  return (NSString *)v14;
}

- (id)xValueAsGenericType
{
  return self->_bucketDate;
}

- (id)minXValueAsGenericType
{
  return self->_bucketDate;
}

- (id)maxXValueAsGenericType
{
  return self->_bucketDate;
}

- (id)yValue
{
  return self->_minimumY;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  v5[2] = *MEMORY[0x1E4F143B8];
  maximumY = self->_maximumY;
  v5[0] = self->_minimumY;
  v5[1] = maximumY;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)minYValue
{
  return self->_minimumY;
}

- (id)maxYValue
{
  return self->_maximumY;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (double)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (double)bucketIncrement
{
  return self->_bucketIncrement;
}

- (NSArray)bucketCounts
{
  return self->_bucketCounts;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDate)bucketDate
{
  return self->_bucketDate;
}

- (NSNumber)minimumY
{
  return self->_minimumY;
}

- (NSNumber)maximumY
{
  return self->_maximumY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumY, 0);
  objc_storeStrong((id *)&self->_minimumY, 0);
  objc_storeStrong((id *)&self->_bucketDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bucketCounts, 0);
}

@end