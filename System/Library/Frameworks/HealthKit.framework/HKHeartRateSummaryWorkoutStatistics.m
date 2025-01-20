@interface HKHeartRateSummaryWorkoutStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryWorkoutStatistics)initWithCoder:(id)a3;
- (HKHeartRateSummaryWorkoutStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6;
- (HKQuantity)averageHeartRate;
- (HKQuantity)maximumHeartRate;
- (id)description;
- (id)initFromStatistics:(id)a3;
- (unint64_t)hash;
- (unint64_t)workoutActivityType;
- (void)_setAverageHeartRate:(id)a3;
- (void)_setMaximumHeartRate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHeartRateSummaryWorkoutStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumHeartRate, 0);

  objc_storeStrong((id *)&self->_averageHeartRate, 0);
}

- (HKHeartRateSummaryWorkoutStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 workoutUUID:(id)a5 workoutActivityType:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  result = [(HKHeartRateSummaryStatistics *)&v8 initWithDateInterval:a3 numberOfBuckets:a4 sessionUUID:a5];
  if (result) {
    result->_workoutActivityType = a6;
  }
  return result;
}

- (id)initFromStatistics:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v5 = [(HKHeartRateSummaryStatistics *)&v8 initFromStatistics:v4];
  v6 = v5;
  if (v5)
  {
    v5[7] = (id)*((void *)v4 + 7);
    objc_storeStrong(v5 + 8, *((id *)v4 + 8));
    objc_storeStrong(v6 + 9, *((id *)v4 + 9));
  }

  return v6;
}

- (void)_setAverageHeartRate:(id)a3
{
}

- (void)_setMaximumHeartRate:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  id v4 = a3;
  [(HKHeartRateSummaryStatistics *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType", v7.receiver, v7.super_class), @"WorkoutActivityTypeKey");
  v5 = [(HKHeartRateSummaryWorkoutStatistics *)self averageHeartRate];
  [v4 encodeObject:v5 forKey:@"AverageHeartRateKey"];

  v6 = [(HKHeartRateSummaryWorkoutStatistics *)self maximumHeartRate];
  [v4 encodeObject:v6 forKey:@"MaximumHeartRateKey"];
}

- (HKHeartRateSummaryWorkoutStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  v5 = [(HKHeartRateSummaryStatistics *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_workoutActivityType = [v4 decodeIntegerForKey:@"WorkoutActivityTypeKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AverageHeartRateKey"];
    averageHeartRate = v5->_averageHeartRate;
    v5->_averageHeartRate = (HKQuantity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaximumHeartRateKey"];
    maximumHeartRate = v5->_maximumHeartRate;
    v5->_maximumHeartRate = (HKQuantity *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKHeartRateSummaryWorkoutStatistics *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25.receiver = self;
      v25.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
      if ([(HKHeartRateSummaryStatistics *)&v25 isEqual:v5])
      {
        unint64_t v6 = [(HKHeartRateSummaryWorkoutStatistics *)self workoutActivityType];
        if (v6 == [(HKHeartRateSummaryWorkoutStatistics *)v5 workoutActivityType])
        {
          objc_super v7 = [(HKHeartRateSummaryWorkoutStatistics *)self averageHeartRate];
          uint64_t v8 = [(HKHeartRateSummaryWorkoutStatistics *)v5 averageHeartRate];
          if (v7 == v8)
          {
            [(HKHeartRateSummaryWorkoutStatistics *)self maximumHeartRate];
          }
          else
          {
            uint64_t v9 = [(HKHeartRateSummaryWorkoutStatistics *)v5 averageHeartRate];
            if (!v9)
            {
              char v12 = 0;
LABEL_22:

              goto LABEL_11;
            }
            v3 = (void *)v9;
            v10 = [(HKHeartRateSummaryWorkoutStatistics *)self averageHeartRate];
            objc_super v11 = [(HKHeartRateSummaryWorkoutStatistics *)v5 averageHeartRate];
            if (![v10 isEqual:v11])
            {
              char v12 = 0;
LABEL_21:

              goto LABEL_22;
            }
            [(HKHeartRateSummaryWorkoutStatistics *)self maximumHeartRate];
          v14 = };
          uint64_t v15 = [(HKHeartRateSummaryWorkoutStatistics *)v5 maximumHeartRate];
          if (v14 == (void *)v15)
          {

            char v12 = 1;
          }
          else
          {
            v16 = (void *)v15;
            uint64_t v17 = [(HKHeartRateSummaryWorkoutStatistics *)v5 maximumHeartRate];
            if (v17)
            {
              v18 = (void *)v17;
              v19 = [(HKHeartRateSummaryWorkoutStatistics *)self maximumHeartRate];
              v20 = [(HKHeartRateSummaryWorkoutStatistics *)v5 maximumHeartRate];
              char v12 = [v19 isEqual:v20];
            }
            else
            {

              char v12 = 0;
            }
          }
          objc_super v11 = v22;
          v10 = v24;
          if (v7 == v8) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
      }
    }
    char v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateSummaryWorkoutStatistics;
  unint64_t v3 = [(HKHeartRateSummaryStatistics *)&v10 hash];
  unint64_t v4 = [(HKHeartRateSummaryWorkoutStatistics *)self workoutActivityType];
  v5 = [(HKHeartRateSummaryWorkoutStatistics *)self averageHeartRate];
  uint64_t v6 = v4 ^ [v5 hash];
  objc_super v7 = [(HKHeartRateSummaryWorkoutStatistics *)self maximumHeartRate];
  unint64_t v8 = v6 ^ [v7 hash] ^ v3;

  return v8;
}

- (id)description
{
  v20 = NSString;
  uint64_t v19 = objc_opt_class();
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  unint64_t v3 = [(HKHeartRateSummaryStatistics *)self sessionUUID];
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKHeartRateSummaryWorkoutStatistics workoutActivityType](self, "workoutActivityType"));
  v5 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  uint64_t v6 = [v5 startDate];
  objc_super v7 = [(HKHeartRateSummaryStatistics *)self dateInterval];
  unint64_t v8 = [v7 endDate];
  averageHeartRate = self->_averageHeartRate;
  objc_super v10 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)averageHeartRate doubleValueForUnit:v10];
  uint64_t v12 = v11;
  maximumHeartRate = self->_maximumHeartRate;
  v14 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)maximumHeartRate doubleValueForUnit:v14];
  v16 = [v20 stringWithFormat:@"<%@:%p count:%@ session:%@ activityType:%@ (%@ - %@) average:%.1fbpm max:%.1fbpm>", v19, self, v18, v3, v4, v6, v8, v12, v15];

  return v16;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (HKQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (HKQuantity)maximumHeartRate
{
  return self->_maximumHeartRate;
}

@end