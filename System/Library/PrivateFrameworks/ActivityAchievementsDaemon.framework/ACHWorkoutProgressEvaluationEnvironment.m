@interface ACHWorkoutProgressEvaluationEnvironment
- (ACHWorkoutProgressEvaluationEnvironment)initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
@end

@implementation ACHWorkoutProgressEvaluationEnvironment

- (ACHWorkoutProgressEvaluationEnvironment)initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ACHWorkoutProgressEvaluationEnvironment;
  result = [(ACHWorkoutProgressEvaluationEnvironment *)&v5 init];
  if (result)
  {
    result->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek = a3;
    result->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek = 0;
  }
  return result;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  v4 = ACHLogWorkouts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ACHWorkoutProgressEvaluationEnvironment valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_FAULT, "Workout Progress Evaluation environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end