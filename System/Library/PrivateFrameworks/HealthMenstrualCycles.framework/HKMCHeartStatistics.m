@interface HKMCHeartStatistics
+ (BOOL)supportsSecureCoding;
+ (id)heartStatisticsFromStatistics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKMCHeartStatistics)initWithCoder:(id)a3;
- (HKMCHeartStatistics)initWithPercentileQuantityValue:(double)a3 sampleCount:(int64_t)a4;
- (double)percentileQuantityValue;
- (id)description;
- (int64_t)sampleCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCHeartStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCHeartStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKMCHeartStatistics;
  v5 = [(HKMCHeartStatistics *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"PercentileQuantityValue"];
    v5->_percentileQuantityValue = v6;
    v5->_sampleCount = [v4 decodeIntegerForKey:@"SampleCount"];
  }

  return v5;
}

- (HKMCHeartStatistics)initWithPercentileQuantityValue:(double)a3 sampleCount:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMCHeartStatistics;
  result = [(HKMCHeartStatistics *)&v7 init];
  if (result)
  {
    result->_percentileQuantityValue = a3;
    result->_sampleCount = a4;
  }
  return result;
}

+ (id)heartStatisticsFromStatistics:(id)a3
{
  id v4 = a3;
  v5 = [v4 percentileQuantity];
  [v5 _value];
  double v7 = v6;

  if (v7 == 0.0)
  {
    v12 = 0;
  }
  else
  {
    id v8 = objc_alloc((Class)a1);
    v9 = [v4 percentileQuantity];
    v10 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
    [v9 doubleValueForUnit:v10];
    v12 = objc_msgSend(v8, "initWithPercentileQuantityValue:sampleCount:", objc_msgSend(v4, "dataCount"), v11);
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  double percentileQuantityValue = self->_percentileQuantityValue;
  id v5 = a3;
  [v5 encodeDouble:@"PercentileQuantityValue" forKey:percentileQuantityValue];
  [v5 encodeInteger:self->_sampleCount forKey:@"SampleCount"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithDouble:self->_percentileQuantityValue];
  double v6 = [NSNumber numberWithInteger:self->_sampleCount];
  double v7 = [v3 stringWithFormat:@"<%@:%p percentileQuantity:%@ sampleCount:%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCHeartStatistics *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(HKMCHeartStatistics *)self percentileQuantityValue],
          double v6 = v5,
          [(HKMCHeartStatistics *)v4 percentileQuantityValue],
          v6 == v7))
    {
      int64_t v8 = [(HKMCHeartStatistics *)self sampleCount];
      BOOL v9 = v8 == [(HKMCHeartStatistics *)v4 sampleCount];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_percentileQuantityValue];
  uint64_t v4 = [v3 hash];
  double v5 = [NSNumber numberWithInteger:self->_sampleCount];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (double)percentileQuantityValue
{
  return self->_percentileQuantityValue;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

@end