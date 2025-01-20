@interface HKHeartRateSummaryStatisticsBucket
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryStatisticsBucket)initWithBucketIndex:(int64_t)a3;
- (HKHeartRateSummaryStatisticsBucket)initWithCoder:(id)a3;
- (NSIndexSet)heartRatesInBeatsPerMinute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bucketIndex;
- (unint64_t)hash;
- (void)addHeartRateInBeatsPerMinute:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHeartRateSummaryStatisticsBucket

- (int64_t)bucketIndex
{
  return self->_bucketIndex;
}

- (void)addHeartRateInBeatsPerMinute:(int64_t)a3
{
}

- (HKHeartRateSummaryStatisticsBucket)initWithBucketIndex:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryStatisticsBucket;
  v4 = [(HKHeartRateSummaryStatisticsBucket *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_bucketIndex = a3;
    uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
    heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
    v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHeartRateSummaryStatisticsBucket *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(HKHeartRateSummaryStatisticsBucket *)self bucketIndex],
          v5 == [(HKHeartRateSummaryStatisticsBucket *)v4 bucketIndex]))
    {
      uint64_t v6 = [(HKHeartRateSummaryStatisticsBucket *)self heartRatesInBeatsPerMinute];
      v7 = [(HKHeartRateSummaryStatisticsBucket *)v4 heartRatesInBeatsPerMinute];
      if (v6 == v7)
      {
        char v11 = 1;
      }
      else
      {
        v8 = [(HKHeartRateSummaryStatisticsBucket *)v4 heartRatesInBeatsPerMinute];
        if (v8)
        {
          objc_super v9 = [(HKHeartRateSummaryStatisticsBucket *)self heartRatesInBeatsPerMinute];
          v10 = [(HKHeartRateSummaryStatisticsBucket *)v4 heartRatesInBeatsPerMinute];
          char v11 = [v9 isEqual:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [[HKHeartRateSummaryStatisticsBucket alloc] initWithBucketIndex:self->_bucketIndex];
  uint64_t v6 = [(NSMutableIndexSet *)self->_heartRatesInBeatsPerMinute mutableCopyWithZone:a3];
  heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
  v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bucketIndex = self->_bucketIndex;
  id v5 = a3;
  [v5 encodeInteger:bucketIndex forKey:@"BucketIndex"];
  [v5 encodeObject:self->_heartRatesInBeatsPerMinute forKey:@"HeartRatesInBeatsPerMinute"];
}

- (HKHeartRateSummaryStatisticsBucket)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryStatisticsBucket;
  id v5 = [(HKHeartRateSummaryStatisticsBucket *)&v9 init];
  if (v5)
  {
    v5->_int64_t bucketIndex = [v4 decodeIntegerForKey:@"BucketIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HeartRatesInBeatsPerMinute"];
    heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
    v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_bucketIndex];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p bucketIndex:%@ heartRatesInBeatsPerMinute:%@>", v4, self, v5, self->_heartRatesInBeatsPerMinute];

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKHeartRateSummaryStatisticsBucket *)self bucketIndex];
  uint64_t v4 = [(HKHeartRateSummaryStatisticsBucket *)self heartRatesInBeatsPerMinute];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSIndexSet)heartRatesInBeatsPerMinute
{
  return &self->_heartRatesInBeatsPerMinute->super;
}

@end