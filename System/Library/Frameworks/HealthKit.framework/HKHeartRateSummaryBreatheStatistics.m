@interface HKHeartRateSummaryBreatheStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryBreatheStatistics)initWithCoder:(id)a3;
- (HKHeartRateSummaryReading)finalReading;
- (id)description;
- (id)initFromStatistics:(id)a3;
- (unint64_t)hash;
- (void)_setFinalReading:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHeartRateSummaryBreatheStatistics

- (id)initFromStatistics:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  v5 = [(HKHeartRateSummaryStatistics *)&v8 initFromStatistics:v4];
  v6 = v5;
  if (v5) {
    objc_storeStrong(v5 + 7, v4[7]);
  }

  return v6;
}

- (void)_setFinalReading:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  id v4 = a3;
  [(HKHeartRateSummaryStatistics *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_finalReading, @"FinalReading", v5.receiver, v5.super_class);
}

- (HKHeartRateSummaryBreatheStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  objc_super v5 = [(HKHeartRateSummaryStatistics *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FinalReading"];
    finalReading = v5->_finalReading;
    v5->_finalReading = (HKHeartRateSummaryReading *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  uint64_t v6 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
  v7 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  objc_super v8 = [v7 startDate];
  objc_super v9 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  v10 = [v9 endDate];
  v11 = [(HKHeartRateSummaryBreatheStatistics *)self finalReading];
  v12 = [v3 stringWithFormat:@"<%@:%p count:%@ session:%@ (%@ - %@) finalReading:%@>", v4, self, v5, v6, v8, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKHeartRateSummaryBreatheStatistics *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)HKHeartRateSummaryBreatheStatistics,
          [(HKHeartRateSummaryStatistics *)&v12 isEqual:v4]))
    {
      objc_super v5 = [(HKHeartRateSummaryBreatheStatistics *)self finalReading];
      uint64_t v6 = [(HKHeartRateSummaryBreatheStatistics *)v4 finalReading];
      if (v5 == v6)
      {
        char v10 = 1;
      }
      else
      {
        v7 = [(HKHeartRateSummaryBreatheStatistics *)v4 finalReading];
        if (v7)
        {
          objc_super v8 = [(HKHeartRateSummaryBreatheStatistics *)self finalReading];
          objc_super v9 = [(HKHeartRateSummaryBreatheStatistics *)v4 finalReading];
          char v10 = [v8 isEqual:v9];
        }
        else
        {
          char v10 = 0;
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HKHeartRateSummaryBreatheStatistics;
  unint64_t v3 = [(HKHeartRateSummaryStatistics *)&v7 hash];
  uint64_t v4 = [(HKHeartRateSummaryBreatheStatistics *)self finalReading];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (HKHeartRateSummaryReading)finalReading
{
  return self->_finalReading;
}

- (void).cxx_destruct
{
}

@end