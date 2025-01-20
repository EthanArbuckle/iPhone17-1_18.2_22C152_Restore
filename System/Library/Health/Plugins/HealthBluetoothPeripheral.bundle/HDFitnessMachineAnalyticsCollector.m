@interface HDFitnessMachineAnalyticsCollector
- (HDFitnessMachineAnalyticsCollector)init;
- (HDGymKitWorkoutAnalyticEvent)gymKitWorkoutEvent;
- (void)setFitnessMachineType:(unint64_t)a3 manufacturer:(id)a4;
- (void)setGymKitWorkoutEvent:(id)a3;
- (void)userBeganPairing;
- (void)workoutEndedSubmitMetricsWith:(id)a3;
- (void)workoutFailedWithError:(id)a3;
@end

@implementation HDFitnessMachineAnalyticsCollector

- (HDFitnessMachineAnalyticsCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)HDFitnessMachineAnalyticsCollector;
  v2 = [(HDFitnessMachineAnalyticsCollector *)&v5 init];
  v3 = v2;
  if (v2) {
    sub_8604(v2);
  }
  return v3;
}

- (void)userBeganPairing
{
}

- (void)setFitnessMachineType:(unint64_t)a3 manufacturer:(id)a4
{
  v6 = [a4 lowercaseString];
  if ((objc_msgSend(&off_643D0, "containsObject:") & 1) == 0)
  {

    v6 = @"other";
  }
  [(HDGymKitWorkoutAnalyticEvent *)self->_gymKitWorkoutEvent setFitnessMachineType:a3];
  [(HDGymKitWorkoutAnalyticEvent *)self->_gymKitWorkoutEvent setManufacturer:v6];
}

- (void)workoutFailedWithError:(id)a3
{
  v4 = sub_87EC((char *)self, a3);
  gymKitWorkoutEvent = self->_gymKitWorkoutEvent;

  [(HDGymKitWorkoutAnalyticEvent *)gymKitWorkoutEvent setWorkoutEndErrorCode:v4];
}

- (void)workoutEndedSubmitMetricsWith:(id)a3
{
  gymKitWorkoutEvent = self->_gymKitWorkoutEvent;
  id v5 = a3;
  [(HDGymKitWorkoutAnalyticEvent *)gymKitWorkoutEvent fitnessMachineType];
  _HKStringForFitnessMachineType();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(HDGymKitWorkoutAnalyticEvent *)self->_gymKitWorkoutEvent manufacturer];
  objc_msgSend(v5, "workout_reportGymKitWorkoutWithFitnessMachineType:manufacturer:timeToBeginExperience:workoutEndError:", v7, v6, -[HDGymKitWorkoutAnalyticEvent timeToBeginExperience](self->_gymKitWorkoutEvent, "timeToBeginExperience"), -[HDGymKitWorkoutAnalyticEvent workoutEndErrorCode](self->_gymKitWorkoutEvent, "workoutEndErrorCode"));

  sub_8604(self);
}

- (HDGymKitWorkoutAnalyticEvent)gymKitWorkoutEvent
{
  return self->_gymKitWorkoutEvent;
}

- (void)setGymKitWorkoutEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gymKitWorkoutEvent, 0);

  objc_storeStrong((id *)&self->_authorizationTimer, 0);
}

@end