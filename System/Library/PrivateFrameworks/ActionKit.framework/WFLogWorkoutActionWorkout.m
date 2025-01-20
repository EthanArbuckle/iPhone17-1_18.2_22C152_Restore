@interface WFLogWorkoutActionWorkout
- (HKQuantitySample)caloriesSample;
- (HKQuantitySample)distanceSample;
- (HKUnit)calorieUnit;
- (HKUnit)distanceUnit;
- (NSDate)endDate;
- (NSDate)startDate;
- (WFLogWorkoutActionWorkout)initWithStartDate:(id)a3 endDate:(id)a4 caloriesSample:(id)a5 calorieUnit:(id)a6 distanceSample:(id)a7 distanceUnit:(id)a8;
- (void)setCalorieUnit:(id)a3;
- (void)setCaloriesSample:(id)a3;
- (void)setDistanceSample:(id)a3;
- (void)setDistanceUnit:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation WFLogWorkoutActionWorkout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_calorieUnit, 0);
  objc_storeStrong((id *)&self->_distanceSample, 0);
  objc_storeStrong((id *)&self->_caloriesSample, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setDistanceUnit:(id)a3
{
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setCalorieUnit:(id)a3
{
}

- (HKUnit)calorieUnit
{
  return self->_calorieUnit;
}

- (void)setDistanceSample:(id)a3
{
}

- (HKQuantitySample)distanceSample
{
  return self->_distanceSample;
}

- (void)setCaloriesSample:(id)a3
{
}

- (HKQuantitySample)caloriesSample
{
  return self->_caloriesSample;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (WFLogWorkoutActionWorkout)initWithStartDate:(id)a3 endDate:(id)a4 caloriesSample:(id)a5 calorieUnit:(id)a6 distanceSample:(id)a7 distanceUnit:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WFLogWorkoutActionWorkout;
  v18 = [(WFLogWorkoutActionWorkout *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_caloriesSample, a5);
    objc_storeStrong((id *)&v19->_calorieUnit, a6);
    objc_storeStrong((id *)&v19->_distanceSample, a7);
    objc_storeStrong((id *)&v19->_distanceUnit, a8);
    v20 = v19;
  }

  return v19;
}

@end