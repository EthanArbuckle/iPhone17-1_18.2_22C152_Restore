@interface HKWorkoutEffortRelationship
+ (BOOL)supportsSecureCoding;
- (HKWorkout)workout;
- (HKWorkoutActivity)activity;
- (HKWorkoutEffortRelationship)initWithCoder:(id)a3;
- (HKWorkoutEffortRelationship)initWithWorkout:(id)a3 activity:(id)a4 samples:(id)a5;
- (NSArray)samples;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutEffortRelationship

- (HKWorkoutEffortRelationship)initWithWorkout:(id)a3 activity:(id)a4 samples:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutEffortRelationship;
  v11 = [(HKWorkoutEffortRelationship *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    workout = v11->_workout;
    v11->_workout = (HKWorkout *)v12;

    uint64_t v14 = [v10 copy];
    samples = v11->_samples;
    v11->_samples = (NSArray *)v14;

    uint64_t v16 = [v9 copy];
    activity = v11->_activity;
    v11->_activity = (HKWorkoutActivity *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  samples = self->_samples;
  v7 = [(HKWorkoutActivity *)self->_activity UUID];
  id v8 = [(HKObject *)self->_workout UUID];
  id v9 = [v3 stringWithFormat:@"<%@:%p samples=%@, activity=%@, workout=%@>", v5, self, samples, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  workout = self->_workout;
  id v5 = a3;
  [v5 encodeObject:workout forKey:@"Workout"];
  [v5 encodeObject:self->_samples forKey:@"Samples"];
  [v5 encodeObject:self->_activity forKey:@"Activity"];
}

- (HKWorkoutEffortRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Workout"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Activity"];
  v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"Samples"];

  id v8 = [(HKWorkoutEffortRelationship *)self initWithWorkout:v5 activity:v6 samples:v7];
  return v8;
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (HKWorkoutActivity)activity
{
  return self->_activity;
}

- (NSArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_workout, 0);
}

@end