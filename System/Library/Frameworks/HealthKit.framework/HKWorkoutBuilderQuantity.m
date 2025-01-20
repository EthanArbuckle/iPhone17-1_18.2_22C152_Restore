@interface HKWorkoutBuilderQuantity
+ (BOOL)supportsSecureCoding;
- (HKQuantity)quantity;
- (HKWorkoutBuilderQuantity)initWithCoder:(id)a3;
- (HKWorkoutBuilderQuantity)initWithQuantity:(id)a3 dateInterval:(id)a4;
- (NSDateInterval)dateInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutBuilderQuantity

- (HKWorkoutBuilderQuantity)initWithQuantity:(id)a3 dateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutBuilderQuantity;
  v8 = [(HKWorkoutBuilderQuantity *)&v14 init];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  quantity = self->_quantity;
  id v5 = a3;
  [v5 encodeObject:quantity forKey:@"quantity"];
  [v5 encodeObject:self->_dateInterval forKey:@"date_interval"];
}

- (HKWorkoutBuilderQuantity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date_interval"];

  id v7 = [(HKWorkoutBuilderQuantity *)self initWithQuantity:v5 dateInterval:v6];
  return v7;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

@end