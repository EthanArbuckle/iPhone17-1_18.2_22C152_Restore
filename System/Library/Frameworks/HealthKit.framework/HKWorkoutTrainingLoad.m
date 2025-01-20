@interface HKWorkoutTrainingLoad
+ (BOOL)supportsSecureCoding;
- (HKQuantity)quantity;
- (HKWorkoutTrainingLoad)initWithCoder:(id)a3;
- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4;
- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4 count:(int64_t)a5;
- (NSDateInterval)dateInterval;
- (int64_t)workoutsCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutTrainingLoad

- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoad;
  v8 = [(HKWorkoutTrainingLoad *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    quantity = v8->_quantity;
    v8->_quantity = (HKQuantity *)v9;

    uint64_t v11 = [v7 copy];
    dateInterval = v8->_dateInterval;
    v8->_dateInterval = (NSDateInterval *)v11;
  }
  return v8;
}

- (HKWorkoutTrainingLoad)initWithQuantity:(id)a3 dateInterval:(id)a4 count:(int64_t)a5
{
  self->_workoutsCount = a5;
  return [(HKWorkoutTrainingLoad *)self initWithQuantity:a3 dateInterval:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  quantity = self->_quantity;
  id v5 = a3;
  [v5 encodeObject:quantity forKey:@"quantity"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeInteger:self->_workoutsCount forKey:@"workoutsCount"];
}

- (HKWorkoutTrainingLoad)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"workoutsCount"];

  v8 = [(HKWorkoutTrainingLoad *)self initWithQuantity:v5 dateInterval:v6 count:v7];
  return v8;
}

- (HKQuantity)quantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)workoutsCount
{
  return self->_workoutsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

@end