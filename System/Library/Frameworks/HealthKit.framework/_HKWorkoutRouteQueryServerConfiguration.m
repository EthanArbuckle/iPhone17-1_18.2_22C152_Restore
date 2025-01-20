@interface _HKWorkoutRouteQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKWorkoutRoute)workoutRoute;
- (NSDateInterval)dateInterval;
- (NSUUID)workoutUUID;
- (_HKWorkoutRouteQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setWorkoutRoute:(id)a3;
- (void)setWorkoutUUID:(id)a3;
@end

@implementation _HKWorkoutRouteQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setWorkoutRoute:self->_workoutRoute];
  [v4 setWorkoutUUID:self->_workoutUUID];
  [v4 setDateInterval:self->_dateInterval];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutRouteQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"series"];
    workoutRoute = v5->_workoutRoute;
    v5->_workoutRoute = (HKWorkoutRoute *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout_uuid"];
    workoutUUID = v5->_workoutUUID;
    v5->_workoutUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date_interval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutRoute, @"series", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_workoutUUID forKey:@"workout_uuid"];
  [v4 encodeObject:self->_dateInterval forKey:@"date_interval"];
}

- (HKWorkoutRoute)workoutRoute
{
  return self->_workoutRoute;
}

- (void)setWorkoutRoute:(id)a3
{
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_workoutRoute, 0);
}

@end