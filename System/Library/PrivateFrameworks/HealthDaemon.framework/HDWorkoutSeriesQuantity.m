@interface HDWorkoutSeriesQuantity
- (HDWorkoutSeriesQuantity)initWithQuantity:(id)a3 dateInterval:(id)a4 series:(id)a5;
- (HKQuantity)hdw_quantity;
- (HKQuantitySample)hdw_sample;
- (HKQuantityType)hdw_type;
- (NSDateInterval)hdw_dateInterval;
- (double)hdw_endTimestamp;
- (double)hdw_startTimestamp;
- (id)description;
@end

@implementation HDWorkoutSeriesQuantity

- (HDWorkoutSeriesQuantity)initWithQuantity:(id)a3 dateInterval:(id)a4 series:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutSeriesQuantity;
  v12 = [(HDWorkoutSeriesQuantity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quantity, a3);
    objc_storeStrong((id *)&v13->_dateInterval, a4);
    objc_storeStrong((id *)&v13->_series, a5);
  }

  return v13;
}

- (HKQuantity)hdw_quantity
{
  return self->_quantity;
}

- (HKQuantityType)hdw_type
{
  return [(HKQuantitySample *)self->_series quantityType];
}

- (NSDateInterval)hdw_dateInterval
{
  return self->_dateInterval;
}

- (double)hdw_startTimestamp
{
  v2 = [(NSDateInterval *)self->_dateInterval startDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (double)hdw_endTimestamp
{
  v2 = [(NSDateInterval *)self->_dateInterval endDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (HKQuantitySample)hdw_sample
{
  return self->_series;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ @ %@, from %@>", self->_quantity, self->_dateInterval, self->_series];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

@end