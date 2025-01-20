@interface HKHeartRateSummaryWorkoutRecoveryStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithCoder:(id)a3;
- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6;
- (NSDictionary)perMinuteReadings;
- (id)description;
- (id)initFromStatistics:(id)a3;
- (unint64_t)hash;
- (unint64_t)workoutActivityType;
- (void)_setPerMinuteReadings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHeartRateSummaryWorkoutRecoveryStatistics

- (void).cxx_destruct
{
}

- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  result = [(HKHeartRateSummaryStatistics *)&v8 initWithDateInterval:a3 numberOfBuckets:a4 sessionUUID:a5];
  if (result) {
    result->_workoutActivityType = a6;
  }
  return result;
}

- (id)initFromStatistics:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  v5 = [(HKHeartRateSummaryStatistics *)&v10 initFromStatistics:v4];
  v6 = v5;
  if (v5)
  {
    v5[7] = *((void *)v4 + 7);
    uint64_t v7 = [*((id *)v4 + 8) copy];
    objc_super v8 = (void *)v6[8];
    v6[8] = v7;
  }
  return v6;
}

- (void)_setPerMinuteReadings:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  perMinuteReadings = self->_perMinuteReadings;
  self->_perMinuteReadings = v4;

  MEMORY[0x1F41817F8](v4, perMinuteReadings);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  id v4 = a3;
  [(HKHeartRateSummaryStatistics *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType", v5.receiver, v5.super_class), @"WorkoutActivityTypeKey");
  [v4 encodeObject:self->_perMinuteReadings forKey:@"PerMinuteReadings"];
}

- (HKHeartRateSummaryWorkoutRecoveryStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  objc_super v5 = [(HKHeartRateSummaryStatistics *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_workoutActivityType = [v4 decodeIntegerForKey:@"WorkoutActivityTypeKey"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"PerMinuteReadings"];
    perMinuteReadings = v5->_perMinuteReadings;
    v5->_perMinuteReadings = (NSDictionary *)v10;
  }
  return v5;
}

- (id)description
{
  v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  id v4 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKHeartRateSummaryWorkoutRecoveryStatistics workoutActivityType](self, "workoutActivityType"));
  v6 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  uint64_t v7 = [v6 startDate];
  uint64_t v8 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  v9 = [v8 endDate];
  uint64_t v10 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self perMinuteReadings];
  v11 = [v10 allKeys];
  v12 = [v15 stringWithFormat:@"<%@:%p count:%@ session:%@ activityType:%@ (%@ - %@) minutes:%@>", v14, self, v3, v4, v5, v7, v9, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKHeartRateSummaryWorkoutRecoveryStatistics *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v13.receiver = self,
          v13.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics,
          [(HKHeartRateSummaryStatistics *)&v13 isEqual:v4])
      && (unint64_t v5 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self workoutActivityType],
          v5 == [(HKHeartRateSummaryWorkoutRecoveryStatistics *)v4 workoutActivityType]))
    {
      v6 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self perMinuteReadings];
      uint64_t v7 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)v4 perMinuteReadings];
      if (v6 == v7)
      {
        char v11 = 1;
      }
      else
      {
        uint64_t v8 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)v4 perMinuteReadings];
        if (v8)
        {
          v9 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self perMinuteReadings];
          uint64_t v10 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)v4 perMinuteReadings];
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

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutRecoveryStatistics;
  unint64_t v3 = [(HKHeartRateSummaryStatistics *)&v8 hash];
  unint64_t v4 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self workoutActivityType];
  unint64_t v5 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)self perMinuteReadings];
  unint64_t v6 = v4 ^ [v5 hash] ^ v3;

  return v6;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSDictionary)perMinuteReadings
{
  return self->_perMinuteReadings;
}

@end