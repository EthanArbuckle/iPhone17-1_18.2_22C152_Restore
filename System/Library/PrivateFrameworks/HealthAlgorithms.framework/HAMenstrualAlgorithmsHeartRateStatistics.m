@interface HAMenstrualAlgorithmsHeartRateStatistics
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsHeartRateStatistics)initWithCoder:(id)a3;
- (NSNumber)lowerPercentile;
- (int64_t)sampleCount;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerPercentile:(id)a3;
- (void)setSampleCount:(int64_t)a3;
@end

@implementation HAMenstrualAlgorithmsHeartRateStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  lowerPercentile = self->_lowerPercentile;
  v5 = NSStringFromSelector(sel_lowerPercentile);
  [v8 encodeObject:lowerPercentile forKey:v5];

  int64_t sampleCount = self->_sampleCount;
  v7 = NSStringFromSelector(sel_sampleCount);
  [v8 encodeInteger:sampleCount forKey:v7];
}

- (HAMenstrualAlgorithmsHeartRateStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsHeartRateStatistics *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_lowerPercentile);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    lowerPercentile = v5->_lowerPercentile;
    v5->_lowerPercentile = (NSNumber *)v8;

    v10 = NSStringFromSelector(sel_sampleCount);
    v5->_int64_t sampleCount = [v4 decodeIntegerForKey:v10];

    v11 = v5;
  }

  return v5;
}

- (NSNumber)lowerPercentile
{
  return self->_lowerPercentile;
}

- (void)setLowerPercentile:(id)a3
{
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_int64_t sampleCount = a3;
}

- (void).cxx_destruct
{
}

@end