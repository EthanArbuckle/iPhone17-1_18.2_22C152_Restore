@interface WFHKWorkoutContainer
+ (BOOL)supportsSecureCoding;
- (HKUnit)caloriesUnit;
- (HKUnit)distanceUnit;
- (HKWorkout)workout;
- (NSString)wfName;
- (WFHKWorkoutContainer)initWithCoder:(id)a3;
- (WFHKWorkoutContainer)initWithWorkout:(id)a3;
- (WFHKWorkoutContainer)initWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5;
- (double)caloriesValue;
- (double)distanceValue;
- (void)encodeWithCoder:(id)a3;
- (void)setCaloriesUnit:(id)a3;
- (void)setDistanceUnit:(id)a3;
- (void)setWorkout:(id)a3;
@end

@implementation WFHKWorkoutContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caloriesUnit, 0);
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

- (void)setCaloriesUnit:(id)a3
{
}

- (HKUnit)caloriesUnit
{
  return self->_caloriesUnit;
}

- (void)setDistanceUnit:(id)a3
{
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setWorkout:(id)a3
{
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFHKWorkoutContainer *)self workout];
  [v4 encodeObject:v5 forKey:@"workout"];

  v6 = [(WFHKWorkoutContainer *)self distanceUnit];
  [v4 encodeObject:v6 forKey:@"distanceUnit"];

  id v7 = [(WFHKWorkoutContainer *)self caloriesUnit];
  [v4 encodeObject:v7 forKey:@"caloriesUnit"];
}

- (WFHKWorkoutContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distanceUnit"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caloriesUnit"];

  v8 = [(WFHKWorkoutContainer *)self initWithWorkout:v5 distanceUnit:v6 caloriesUnit:v7];
  return v8;
}

- (NSString)wfName
{
  id v4 = [(WFHKWorkoutContainer *)self workout];
  v5 = +[WFHealthKitHelper readableWorkoutActivityTypeFromWorkoutActivityType:](WFHealthKitHelper, "readableWorkoutActivityTypeFromWorkoutActivityType:", [v4 workoutActivityType]);

  v6 = [(WFHKWorkoutContainer *)self workout];
  id v7 = [v6 totalDistance];
  if (v7)
  {
    v2 = [(WFHKWorkoutContainer *)self distanceUnit];
    if (!v2)
    {

LABEL_8:
      v12 = NSString;
      WFLocalizedString(@"%@ Workout, no unit data");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v5);
      goto LABEL_17;
    }
  }
  v8 = [(WFHKWorkoutContainer *)self workout];
  uint64_t v9 = [v8 totalEnergyBurned];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(WFHKWorkoutContainer *)self caloriesUnit];

    if (v7)
    {
    }
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {

    if (v7)
    {
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v13 setNumberStyle:1];
  [v13 setUsesGroupingSeparator:0];
  id v15 = objc_alloc_init(MEMORY[0x263F08780]);
  [v15 setUnitsStyle:1];
  v16 = (void *)MEMORY[0x263F089D8];
  v17 = WFLocalizedString(@"%1$@ Workout, %2$@");
  v18 = [(WFHKWorkoutContainer *)self workout];
  [v18 duration];
  v19 = objc_msgSend(v15, "stringFromTimeInterval:");
  v20 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v5, v19);

  v21 = [(WFHKWorkoutContainer *)self workout];
  v22 = [v21 totalDistance];

  if (v22)
  {
    v23 = [(WFHKWorkoutContainer *)self workout];
    v24 = [v23 totalDistance];
    v25 = [(WFHKWorkoutContainer *)self distanceUnit];
    [v24 doubleValueForUnit:v25];
    double v27 = v26;

    v28 = WFLocalizedString(@", total distance %1$@ %2$@");
    v29 = [NSNumber numberWithDouble:v27];
    v30 = [v13 stringFromNumber:v29];
    v31 = [(WFHKWorkoutContainer *)self distanceUnit];
    v32 = [v31 unitString];
    objc_msgSend(v20, "appendFormat:", v28, v30, v32);
  }
  v33 = [(WFHKWorkoutContainer *)self workout];
  v34 = [v33 totalEnergyBurned];

  if (v34)
  {
    v35 = [(WFHKWorkoutContainer *)self workout];
    v36 = [v35 totalEnergyBurned];
    v37 = [(WFHKWorkoutContainer *)self caloriesUnit];
    [v36 doubleValueForUnit:v37];
    double v39 = v38;

    v40 = WFLocalizedString(@", total calories %1$@ %2$@");
    v41 = [NSNumber numberWithDouble:v39];
    v42 = [v13 stringFromNumber:v41];
    v43 = [(WFHKWorkoutContainer *)self caloriesUnit];
    v44 = [v43 unitString];
    objc_msgSend(v20, "appendFormat:", v40, v42, v44);
  }
  v14 = (void *)[v20 copy];

LABEL_17:
  return (NSString *)v14;
}

- (double)distanceValue
{
  v3 = [(WFHKWorkoutContainer *)self workout];
  uint64_t v4 = [v3 totalDistance];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFHKWorkoutContainer *)self distanceUnit];

    if (!v6) {
      return 0.0;
    }
    v3 = [(WFHKWorkoutContainer *)self workout];
    id v7 = [v3 totalDistance];
    v8 = [(WFHKWorkoutContainer *)self distanceUnit];
    [v7 doubleValueForUnit:v8];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)caloriesValue
{
  v3 = [(WFHKWorkoutContainer *)self workout];
  uint64_t v4 = [v3 totalEnergyBurned];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFHKWorkoutContainer *)self caloriesUnit];

    if (!v6) {
      return 0.0;
    }
    v3 = [(WFHKWorkoutContainer *)self workout];
    id v7 = [v3 totalEnergyBurned];
    v8 = [(WFHKWorkoutContainer *)self caloriesUnit];
    [v7 doubleValueForUnit:v8];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (WFHKWorkoutContainer)initWithWorkout:(id)a3 distanceUnit:(id)a4 caloriesUnit:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WFHKWorkoutContainer;
  id v10 = a3;
  v11 = [(WFHKWorkoutContainer *)&v14 init];
  -[WFHKWorkoutContainer setWorkout:](v11, "setWorkout:", v10, v14.receiver, v14.super_class);

  v12 = [(WFHKWorkoutContainer *)v11 workout];

  if (v12)
  {
    [(WFHKWorkoutContainer *)v11 setDistanceUnit:v8];
    [(WFHKWorkoutContainer *)v11 setCaloriesUnit:v9];
  }

  return v11;
}

- (WFHKWorkoutContainer)initWithWorkout:(id)a3
{
  return [(WFHKWorkoutContainer *)self initWithWorkout:a3 distanceUnit:0 caloriesUnit:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end