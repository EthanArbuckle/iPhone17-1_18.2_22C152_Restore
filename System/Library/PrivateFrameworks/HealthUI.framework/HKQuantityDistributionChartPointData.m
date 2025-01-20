@interface HKQuantityDistributionChartPointData
- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6;
- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 unit:(id)a4 displayType:(id)a5;
- (HKUnit)unit;
- (NSArray)bucketCounts;
- (NSArray)contextIdentifiers;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)averageValue;
- (double)bucketIncrement;
- (double)duration;
- (double)maximumValue;
- (double)minimumBucketValue;
- (double)minimumValue;
@end

@implementation HKQuantityDistributionChartPointData

- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 unit:(id)a4 displayType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[HKQuantityDistributionDataSource bucketSizeForDisplayType:v8 preferredUnit:v9];
  [v11 floatValue];
  v13 = [(HKQuantityDistributionChartPointData *)self initWithDistributionData:v10 bucketIncrement:v9 unit:v8 displayType:v12];

  return v13;
}

- (HKQuantityDistributionChartPointData)initWithDistributionData:(id)a3 bucketIncrement:(double)a4 unit:(id)a5 displayType:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HKQuantityDistributionChartPointData;
  v11 = [(HKQuantityDistributionChartPointData *)&v32 init];
  if (v11)
  {
    uint64_t v12 = [v9 startDate];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    uint64_t v14 = [v9 endDate];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    v16 = [v9 minimumValue];
    v17 = (objc_class *)objc_opt_class();
    v11->_minimumValue = _doubleValueIfCompatibleForQuantity(v16, v10, v17);

    v18 = [v9 maximumValue];
    v19 = (objc_class *)objc_opt_class();
    v11->_maximumValue = _doubleValueIfCompatibleForQuantity(v18, v10, v19);

    v20 = [v9 minimumBucketValue];
    v21 = (objc_class *)objc_opt_class();
    v11->_minimumBucketValue = _doubleValueIfCompatibleForQuantity(v20, v10, v21);

    v22 = [v9 averageValue];
    v23 = (objc_class *)objc_opt_class();
    v11->_averageValue = _doubleValueIfCompatibleForQuantity(v22, v10, v23);

    v24 = [v9 duration];
    v25 = [MEMORY[0x1E4F2B618] secondUnit];
    v26 = (objc_class *)objc_opt_class();
    v11->_duration = _doubleValueIfCompatibleForQuantity(v24, v25, v26);

    v11->_bucketIncrement = a4;
    uint64_t v27 = [v9 histogramCounts];
    bucketCounts = v11->_bucketCounts;
    v11->_bucketCounts = (NSArray *)v27;

    uint64_t v29 = [v9 contextIdentifiers];
    contextIdentifiers = v11->_contextIdentifiers;
    v11->_contextIdentifiers = (NSArray *)v29;

    objc_storeStrong((id *)&v11->_unit, a5);
  }

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)averageValue
{
  return self->_averageValue;
}

- (double)duration
{
  return self->_duration;
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

- (NSArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_bucketCounts, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end