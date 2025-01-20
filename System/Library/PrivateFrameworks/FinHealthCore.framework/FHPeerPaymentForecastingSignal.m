@interface FHPeerPaymentForecastingSignal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHPeerPaymentForecastingSignal)initWithCoder:(id)a3;
- (NSDate)signalDate;
- (NSDecimalNumber)frequency;
- (NSSet)peerPaymentHeuristicIds;
- (NSString)dayOfWeek;
- (NSString)periodicCategory;
- (id)description;
- (unint64_t)forecastingType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDayOfWeek:(id)a3;
- (void)setForecastingType:(unint64_t)a3;
- (void)setFrequency:(id)a3;
- (void)setPeerPaymentHeuristicIds:(id)a3;
- (void)setPeriodicCategory:(id)a3;
- (void)setSignalDate:(id)a3;
@end

@implementation FHPeerPaymentForecastingSignal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t forecastingType = self->_forecastingType;
  id v5 = a3;
  [v5 encodeInteger:forecastingType forKey:@"forecastingType"];
  [v5 encodeObject:self->_frequency forKey:@"frequency"];
  [v5 encodeObject:self->_signalDate forKey:@"signalDate"];
  [v5 encodeObject:self->_peerPaymentHeuristicIds forKey:@"peerPaymentHeuristicIds"];
  [v5 encodeObject:self->_dayOfWeek forKey:@"dayOfWeek"];
  [v5 encodeObject:self->_periodicCategory forKey:@"periodicCategory"];
}

- (FHPeerPaymentForecastingSignal)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FHPeerPaymentForecastingSignal;
  id v5 = [(FHPeerPaymentForecastingSignal *)&v20 init];
  if (v5)
  {
    v5->_unint64_t forecastingType = [v4 decodeIntegerForKey:@"forecastingType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frequency"];
    frequency = v5->_frequency;
    v5->_frequency = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signalDate"];
    signalDate = v5->_signalDate;
    v5->_signalDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"peerPaymentHeuristicIds"];
    peerPaymentHeuristicIds = v5->_peerPaymentHeuristicIds;
    v5->_peerPaymentHeuristicIds = (NSSet *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dayOfWeek"];
    dayOfWeek = v5->_dayOfWeek;
    v5->_dayOfWeek = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"periodicCategory"];
    periodicCategory = v5->_periodicCategory;
    v5->_periodicCategory = (NSString *)v17;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_27001CD40];
  [v3 appendFormat:@"%@: '%lu'; ", @"forecastingType", self->_forecastingType];
  [v3 appendFormat:@"%@: '%@'; ", @"frequency", self->_frequency];
  [v3 appendFormat:@"%@: '%@'; ", @"signalDate", self->_signalDate];
  id v4 = [(NSSet *)self->_peerPaymentHeuristicIds allObjects];
  id v5 = [v4 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@: '{%@}'; ", @"peerPaymentHeuristicIds", v5];

  [v3 appendFormat:@"%@: '%@'; ", @"dayOfWeek", self->_dayOfWeek];
  [v3 appendFormat:@"%@: '%@'; ", @"periodicCategory", self->_periodicCategory];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FHPeerPaymentForecastingSignal *)self forecastingType];
  id v4 = [(FHPeerPaymentForecastingSignal *)self frequency];
  uint64_t v5 = [v4 hash] + 43 * v3 + 1849;

  uint64_t v6 = [(FHPeerPaymentForecastingSignal *)self signalDate];
  uint64_t v7 = [v6 hash] + 43 * v5;

  uint64_t v8 = [(FHPeerPaymentForecastingSignal *)self peerPaymentHeuristicIds];
  uint64_t v9 = [v8 hash] + 43 * v7;

  v10 = [(FHPeerPaymentForecastingSignal *)self dayOfWeek];
  uint64_t v11 = [v10 hash] + 43 * v9;

  v12 = [(FHPeerPaymentForecastingSignal *)self periodicCategory];
  unint64_t v13 = [v12 hash] + 43 * v11;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FHPeerPaymentForecastingSignal *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t v6 = [(FHPeerPaymentForecastingSignal *)self forecastingType],
             v6 == [(FHPeerPaymentForecastingSignal *)v5 forecastingType]))
  {
    uint64_t v7 = [(FHPeerPaymentForecastingSignal *)self frequency];
    uint64_t v8 = [(FHPeerPaymentForecastingSignal *)v5 frequency];
    if ([v7 isEqualToNumber:v8])
    {
      uint64_t v9 = [(FHPeerPaymentForecastingSignal *)self signalDate];
      v10 = [(FHPeerPaymentForecastingSignal *)v5 signalDate];
      if ([v9 isEqualToDate:v10])
      {
        uint64_t v11 = [(FHPeerPaymentForecastingSignal *)self peerPaymentHeuristicIds];
        v12 = [(FHPeerPaymentForecastingSignal *)v5 peerPaymentHeuristicIds];
        if ([v11 isEqualToSet:v12])
        {
          unint64_t v13 = [(FHPeerPaymentForecastingSignal *)self dayOfWeek];
          v14 = [(FHPeerPaymentForecastingSignal *)v5 dayOfWeek];
          if ([v13 isEqualToString:v14])
          {
            v18 = [(FHPeerPaymentForecastingSignal *)self periodicCategory];
            [(FHPeerPaymentForecastingSignal *)v5 periodicCategory];
            uint64_t v15 = v19 = v13;
            char v16 = [v18 isEqualToString:v15];

            unint64_t v13 = v19;
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)setSignalDate:(id)a3
{
  objc_storeStrong((id *)&self->_signalDate, a3);
  id v7 = a3;
  GetDayOfWeekFromSignalDate(v7);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  dayOfWeek = self->_dayOfWeek;
  self->_dayOfWeek = v5;
}

- (void)setFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_frequency, a3);
  id v7 = a3;
  GetPeriodicCategoryFromFrequency(v7);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  periodicCategory = self->_periodicCategory;
  self->_periodicCategory = v5;
}

- (unint64_t)forecastingType
{
  return self->_forecastingType;
}

- (void)setForecastingType:(unint64_t)a3
{
  self->_unint64_t forecastingType = a3;
}

- (NSDecimalNumber)frequency
{
  return self->_frequency;
}

- (NSDate)signalDate
{
  return self->_signalDate;
}

- (NSSet)peerPaymentHeuristicIds
{
  return self->_peerPaymentHeuristicIds;
}

- (void)setPeerPaymentHeuristicIds:(id)a3
{
}

- (NSString)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(id)a3
{
}

- (NSString)periodicCategory
{
  return self->_periodicCategory;
}

- (void)setPeriodicCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicCategory, 0);
  objc_storeStrong((id *)&self->_dayOfWeek, 0);
  objc_storeStrong((id *)&self->_peerPaymentHeuristicIds, 0);
  objc_storeStrong((id *)&self->_signalDate, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end