@interface _HKQuantityDistributionData
+ (BOOL)supportsSecureCoding;
- (HKQuantity)averageValue;
- (HKQuantity)duration;
- (HKQuantity)maximumValue;
- (HKQuantity)minimumBucketValue;
- (HKQuantity)minimumValue;
- (NSArray)contextIdentifiers;
- (NSArray)histogramCounts;
- (NSDate)endDate;
- (NSDate)startDate;
- (_HKQuantityDistributionData)initWithCoder:(id)a3;
- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10;
- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10 contextIdentifiers:(id)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKQuantityDistributionData

- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10
{
  return [(_HKQuantityDistributionData *)self initWithStartDate:a3 endDate:a4 minimumBucketValue:a5 minimumValue:a6 maximumValue:a7 averageValue:a8 duration:a9 histogramCounts:a10 contextIdentifiers:0];
}

- (_HKQuantityDistributionData)initWithStartDate:(id)a3 endDate:(id)a4 minimumBucketValue:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 averageValue:(id)a8 duration:(id)a9 histogramCounts:(id)a10 contextIdentifiers:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_HKQuantityDistributionData;
  v19 = [(_HKQuantityDistributionData *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_startDate, a3);
    objc_storeStrong((id *)&v20->_endDate, a4);
    objc_storeStrong((id *)&v20->_minimumBucketValue, a5);
    objc_storeStrong((id *)&v20->_minimumValue, a6);
    objc_storeStrong((id *)&v20->_maximumValue, a7);
    objc_storeStrong((id *)&v20->_averageValue, a8);
    objc_storeStrong((id *)&v20->_duration, a9);
    objc_storeStrong((id *)&v20->_histogramCounts, a10);
    objc_storeStrong((id *)&v20->_contextIdentifiers, a11);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantityDistributionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_HKQuantityDistributionData;
  v5 = [(_HKQuantityDistributionData *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumBucketValue"];
    minimumBucketValue = v5->_minimumBucketValue;
    v5->_minimumBucketValue = (HKQuantity *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumValueKey"];
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (HKQuantity *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumValueKey"];
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (HKQuantity *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageValueKey"];
    averageValue = v5->_averageValue;
    v5->_averageValue = (HKQuantity *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"durationKey"];
    duration = v5->_duration;
    v5->_duration = (HKQuantity *)v18;

    v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"histogramCounts"];
    histogramCounts = v5->_histogramCounts;
    v5->_histogramCounts = (NSArray *)v21;

    id v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"contextIdentifiers"];
    contextIdentifiers = v5->_contextIdentifiers;
    v5->_contextIdentifiers = (NSArray *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_minimumBucketValue forKey:@"minimumBucketValue"];
  [v5 encodeObject:self->_minimumValue forKey:@"minimumValueKey"];
  [v5 encodeObject:self->_maximumValue forKey:@"maximumValueKey"];
  [v5 encodeObject:self->_averageValue forKey:@"averageValueKey"];
  [v5 encodeObject:self->_duration forKey:@"durationKey"];
  [v5 encodeObject:self->_histogramCounts forKey:@"histogramCounts"];
  [v5 encodeObject:self->_contextIdentifiers forKey:@"contextIdentifiers"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDate *)self->_endDate copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HKQuantity *)self->_minimumBucketValue copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(HKQuantity *)self->_minimumValue copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(HKQuantity *)self->_maximumValue copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(HKQuantity *)self->_averageValue copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = [(HKQuantity *)self->_duration copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  uint64_t v20 = [(NSArray *)self->_histogramCounts copyWithZone:a3];
  uint64_t v21 = (void *)v5[8];
  v5[8] = v20;

  uint64_t v22 = [(NSArray *)self->_contextIdentifiers copyWithZone:a3];
  id v23 = (void *)v5[9];
  v5[9] = v22;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (HKQuantity)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (HKQuantity)minimumValue
{
  return self->_minimumValue;
}

- (HKQuantity)maximumValue
{
  return self->_maximumValue;
}

- (HKQuantity)averageValue
{
  return self->_averageValue;
}

- (HKQuantity)duration
{
  return self->_duration;
}

- (NSArray)histogramCounts
{
  return self->_histogramCounts;
}

- (NSArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_histogramCounts, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_minimumBucketValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end