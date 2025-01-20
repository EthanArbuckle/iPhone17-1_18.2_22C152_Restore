@interface ACHWorkoutEvaluationEnvironment
- (ACHWorkoutEvaluationEnvironment)initWithWorkout:(id)a3 numberOfFirstPartyWorkoutsOver5MinutesWithType:(unint64_t)a4 numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a5 bestKilocaloriesForType:(double)a6 bestKilometersForType:(double)a7 bestElevationGainedForType:(double)a8 best5KDuration:(double)a9 best10KDuration:(double)a10 bestWheelchair5KDuration:(double)a11 bestWheelchair10KDuration:(double)a12 bestHalfMarathonDuration:(double)a13 bestMarathonDuration:(double)a14 bestWheelchairHalfMarathonDuration:(double)a15 bestWheelchairMarathonDuration:(double)a16 experienceType:(unint64_t)a17 isMetricLocale:(BOOL)a18;
- (ACHWorkoutEvaluationWorkoutProperties)workout;
- (BOOL)isMetricLocale;
- (double)best10KDuration;
- (double)best5KDuration;
- (double)bestElevationGainedForType;
- (double)bestHalfMarathonDuration;
- (double)bestKilocaloriesForType;
- (double)bestKilometersForType;
- (double)bestMarathonDuration;
- (double)bestWheelchair10KDuration;
- (double)bestWheelchair5KDuration;
- (double)bestWheelchairHalfMarathonDuration;
- (double)bestWheelchairMarathonDuration;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)experienceType;
- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesWithType;
- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesWithType;
@end

@implementation ACHWorkoutEvaluationEnvironment

- (ACHWorkoutEvaluationEnvironment)initWithWorkout:(id)a3 numberOfFirstPartyWorkoutsOver5MinutesWithType:(unint64_t)a4 numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a5 bestKilocaloriesForType:(double)a6 bestKilometersForType:(double)a7 bestElevationGainedForType:(double)a8 best5KDuration:(double)a9 best10KDuration:(double)a10 bestWheelchair5KDuration:(double)a11 bestWheelchair10KDuration:(double)a12 bestHalfMarathonDuration:(double)a13 bestMarathonDuration:(double)a14 bestWheelchairHalfMarathonDuration:(double)a15 bestWheelchairMarathonDuration:(double)a16 experienceType:(unint64_t)a17 isMetricLocale:(BOOL)a18
{
  id v31 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ACHWorkoutEvaluationEnvironment;
  v32 = [(ACHWorkoutEvaluationEnvironment *)&v36 init];
  if (v32)
  {
    v33 = [[ACHWorkoutEvaluationWorkoutProperties alloc] initWithWorkout:v31];
    workout = v32->_workout;
    v32->_workout = v33;

    v32->_numberOfFirstPartyWorkoutsOver5MinutesWithType = a4;
    v32->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek = a5;
    v32->_numberOfFirstPartyWorkoutsOver15MinutesWithType = 0;
    v32->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek = 0;
    v32->_bestKilocaloriesForType = a6;
    v32->_bestKilometersForType = a7;
    v32->_bestElevationGainedForType = a8;
    v32->_best5KDuration = a9;
    v32->_best10KDuration = a10;
    v32->_bestWheelchair5KDuration = a11;
    v32->_bestWheelchair10KDuration = a12;
    v32->_bestHalfMarathonDuration = a13;
    v32->_bestMarathonDuration = a14;
    v32->_bestWheelchairHalfMarathonDuration = a15;
    v32->_bestWheelchairMarathonDuration = a16;
    v32->_experienceType = a17;
    v32->_isMetricLocale = a18;
  }

  return v32;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  v4 = ACHLogWorkouts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ACHWorkoutEvaluationEnvironment valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (ACHWorkoutEvaluationWorkoutProperties)workout
{
  return self->_workout;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesWithType
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesWithType;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesWithType
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesWithType;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
}

- (double)bestKilocaloriesForType
{
  return self->_bestKilocaloriesForType;
}

- (double)bestKilometersForType
{
  return self->_bestKilometersForType;
}

- (double)bestElevationGainedForType
{
  return self->_bestElevationGainedForType;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (unint64_t)experienceType
{
  return self->_experienceType;
}

- (BOOL)isMetricLocale
{
  return self->_isMetricLocale;
}

- (void).cxx_destruct
{
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_FAULT, "Workout Evaluation environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end