@interface HKHRAFibBurdenSevenDaySampleProperties
+ (BOOL)supportsSecureCoding;
- (HKHRAFibBurdenSevenDaySampleProperties)initWithBurdenPercentage:(id)a3 timeZone:(id)a4;
- (HKHRAFibBurdenSevenDaySampleProperties)initWithCoder:(id)a3;
- (NSNumber)burdenPercentage;
- (NSTimeZone)timeZone;
- (void)encodeWithCoder:(id)a3;
- (void)setBurdenPercentage:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation HKHRAFibBurdenSevenDaySampleProperties

- (HKHRAFibBurdenSevenDaySampleProperties)initWithBurdenPercentage:(id)a3 timeZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenSevenDaySampleProperties;
  v9 = [(HKHRAFibBurdenSevenDaySampleProperties *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_burdenPercentage, a3);
    objc_storeStrong((id *)&v10->_timeZone, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  burdenPercentage = self->_burdenPercentage;
  id v5 = a3;
  [v5 encodeObject:burdenPercentage forKey:@"burdenPercentage"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (HKHRAFibBurdenSevenDaySampleProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenSevenDaySampleProperties;
  id v5 = [(HKHRAFibBurdenSevenDaySampleProperties *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"burdenPercentage"];
    burdenPercentage = v5->_burdenPercentage;
    v5->_burdenPercentage = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;
  }
  return v5;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (void)setBurdenPercentage:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_burdenPercentage, 0);
}

@end