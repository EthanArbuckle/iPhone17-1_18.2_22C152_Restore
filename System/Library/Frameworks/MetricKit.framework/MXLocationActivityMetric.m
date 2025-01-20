@interface MXLocationActivityMetric
+ (BOOL)supportsSecureCoding;
- (MXLocationActivityMetric)initWithCoder:(id)a3;
- (MXLocationActivityMetric)initWithCumulativeBestAccuracyTimeMeasurement:(id)a3 cumulativeBestAccuracyForNavigationTimeMeasurement:(id)a4 nearestTenMetersAccuracyTimeMeasurement:(id)a5 hundredMetersAccuracyTimeMeasurement:(id)a6 kilometerAccuracyTimeMeasurement:(id)a7 threeKilometerAccuracyTimeMeasurement:(id)a8;
- (NSMeasurement)cumulativeBestAccuracyForNavigationTime;
- (NSMeasurement)cumulativeBestAccuracyTime;
- (NSMeasurement)cumulativeHundredMetersAccuracyTime;
- (NSMeasurement)cumulativeKilometerAccuracyTime;
- (NSMeasurement)cumulativeNearestTenMetersAccuracyTime;
- (NSMeasurement)cumulativeThreeKilometersAccuracyTime;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXLocationActivityMetric

- (MXLocationActivityMetric)initWithCumulativeBestAccuracyTimeMeasurement:(id)a3 cumulativeBestAccuracyForNavigationTimeMeasurement:(id)a4 nearestTenMetersAccuracyTimeMeasurement:(id)a5 hundredMetersAccuracyTimeMeasurement:(id)a6 kilometerAccuracyTimeMeasurement:(id)a7 threeKilometerAccuracyTimeMeasurement:(id)a8
{
  id v15 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)MXLocationActivityMetric;
  v18 = [(MXMetric *)&v30 init];
  if (!v18) {
    goto LABEL_10;
  }
  [v15 doubleValue];
  if (v19 >= 0.0)
  {
    [v29 doubleValue];
    if (v20 >= 0.0)
    {
      [v28 doubleValue];
      if (v21 >= 0.0)
      {
        [v27 doubleValue];
        if (v22 >= 0.0)
        {
          [v16 doubleValue];
          if (v23 >= 0.0)
          {
            [v17 doubleValue];
            if (v24 >= 0.0)
            {
              objc_storeStrong((id *)&v18->_cumulativeBestAccuracyTime, a3);
              objc_storeStrong((id *)&v18->_cumulativeBestAccuracyForNavigationTime, a4);
              objc_storeStrong((id *)&v18->_cumulativeNearestTenMetersAccuracyTime, a5);
              objc_storeStrong((id *)&v18->_cumulativeHundredMetersAccuracyTime, a6);
              objc_storeStrong((id *)&v18->_cumulativeKilometerAccuracyTime, a7);
              objc_storeStrong((id *)&v18->_cumulativeThreeKilometersAccuracyTime, a8);
LABEL_10:
              v25 = v18;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
  v25 = 0;
LABEL_11:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  cumulativeBestAccuracyTime = self->_cumulativeBestAccuracyTime;
  id v5 = a3;
  [v5 encodeObject:cumulativeBestAccuracyTime forKey:@"cumulativeBestAccuracyTime"];
  [v5 encodeObject:self->_cumulativeBestAccuracyForNavigationTime forKey:@"cumulativeBestAccuracyForNavigationTime"];
  [v5 encodeObject:self->_cumulativeNearestTenMetersAccuracyTime forKey:@"cumulativeNearestTenMetersAccuracyTime"];
  [v5 encodeObject:self->_cumulativeHundredMetersAccuracyTime forKey:@"cumulativeHundredMetersAccuracyTime"];
  [v5 encodeObject:self->_cumulativeKilometerAccuracyTime forKey:@"cumulativeKilometerAccuracyTime"];
  [v5 encodeObject:self->_cumulativeThreeKilometersAccuracyTime forKey:@"cumulativeThreeKilometersAccuracyTime"];
}

- (MXLocationActivityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXLocationActivityMetric;
  id v5 = [(MXMetric *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeBestAccuracyTime"];
    cumulativeBestAccuracyTime = v5->_cumulativeBestAccuracyTime;
    v5->_cumulativeBestAccuracyTime = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeBestAccuracyForNavigationTime"];
    cumulativeBestAccuracyForNavigationTime = v5->_cumulativeBestAccuracyForNavigationTime;
    v5->_cumulativeBestAccuracyForNavigationTime = (NSMeasurement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeNearestTenMetersAccuracyTime"];
    cumulativeNearestTenMetersAccuracyTime = v5->_cumulativeNearestTenMetersAccuracyTime;
    v5->_cumulativeNearestTenMetersAccuracyTime = (NSMeasurement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeHundredMetersAccuracyTime"];
    cumulativeHundredMetersAccuracyTime = v5->_cumulativeHundredMetersAccuracyTime;
    v5->_cumulativeHundredMetersAccuracyTime = (NSMeasurement *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeKilometerAccuracyTime"];
    cumulativeKilometerAccuracyTime = v5->_cumulativeKilometerAccuracyTime;
    v5->_cumulativeKilometerAccuracyTime = (NSMeasurement *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeThreeKilometersAccuracyTime"];
    cumulativeThreeKilometersAccuracyTime = v5->_cumulativeThreeKilometersAccuracyTime;
    v5->_cumulativeThreeKilometersAccuracyTime = (NSMeasurement *)v16;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_cumulativeBestAccuracyTime)
  {
    id v4 = [(MXMetric *)self measurementFormatter];
    id v5 = [v4 stringFromMeasurement:self->_cumulativeBestAccuracyTime];
    [v3 setObject:v5 forKey:@"cumulativeBestAccuracyTime"];
  }
  if (self->_cumulativeBestAccuracyForNavigationTime)
  {
    uint64_t v6 = [(MXMetric *)self measurementFormatter];
    v7 = [v6 stringFromMeasurement:self->_cumulativeBestAccuracyForNavigationTime];
    [v3 setObject:v7 forKey:@"cumulativeBestAccuracyForNavigationTime"];
  }
  if (self->_cumulativeNearestTenMetersAccuracyTime)
  {
    uint64_t v8 = [(MXMetric *)self measurementFormatter];
    v9 = [v8 stringFromMeasurement:self->_cumulativeNearestTenMetersAccuracyTime];
    [v3 setObject:v9 forKey:@"cumulativeNearestTenMetersAccuracyTime"];
  }
  if (self->_cumulativeHundredMetersAccuracyTime)
  {
    uint64_t v10 = [(MXMetric *)self measurementFormatter];
    v11 = [v10 stringFromMeasurement:self->_cumulativeHundredMetersAccuracyTime];
    [v3 setObject:v11 forKey:@"cumulativeHundredMetersAccuracyTime"];
  }
  if (self->_cumulativeKilometerAccuracyTime)
  {
    uint64_t v12 = [(MXMetric *)self measurementFormatter];
    v13 = [v12 stringFromMeasurement:self->_cumulativeKilometerAccuracyTime];
    [v3 setObject:v13 forKey:@"cumulativeKilometerAccuracyTime"];
  }
  if (self->_cumulativeThreeKilometersAccuracyTime)
  {
    uint64_t v14 = [(MXMetric *)self measurementFormatter];
    id v15 = [v14 stringFromMeasurement:self->_cumulativeThreeKilometersAccuracyTime];
    [v3 setObject:v15 forKey:@"cumulativeThreeKilometersAccuracyTime"];
  }

  return v3;
}

- (NSMeasurement)cumulativeBestAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeBestAccuracyForNavigationTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeNearestTenMetersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeHundredMetersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (NSMeasurement)cumulativeKilometerAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)cumulativeThreeKilometersAccuracyTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeThreeKilometersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeKilometerAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeHundredMetersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeNearestTenMetersAccuracyTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBestAccuracyForNavigationTime, 0);

  objc_storeStrong((id *)&self->_cumulativeBestAccuracyTime, 0);
}

@end