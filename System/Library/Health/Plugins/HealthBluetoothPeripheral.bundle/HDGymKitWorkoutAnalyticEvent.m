@interface HDGymKitWorkoutAnalyticEvent
- (NSString)manufacturer;
- (int64_t)timeToBeginExperience;
- (int64_t)workoutEndErrorCode;
- (unint64_t)fitnessMachineType;
- (void)setFitnessMachineType:(unint64_t)a3;
- (void)setManufacturer:(id)a3;
- (void)setTimeToBeginExperience:(int64_t)a3;
- (void)setWorkoutEndErrorCode:(int64_t)a3;
@end

@implementation HDGymKitWorkoutAnalyticEvent

- (unint64_t)fitnessMachineType
{
  return self->_fitnessMachineType;
}

- (void)setFitnessMachineType:(unint64_t)a3
{
  self->_fitnessMachineType = a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (int64_t)timeToBeginExperience
{
  return self->_timeToBeginExperience;
}

- (void)setTimeToBeginExperience:(int64_t)a3
{
  self->_timeToBeginExperience = a3;
}

- (int64_t)workoutEndErrorCode
{
  return self->_workoutEndErrorCode;
}

- (void)setWorkoutEndErrorCode:(int64_t)a3
{
  self->_workoutEndErrorCode = a3;
}

- (void).cxx_destruct
{
}

@end