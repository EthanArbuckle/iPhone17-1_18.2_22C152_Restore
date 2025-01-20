@interface _HDCoreMotionAssertion
@end

@implementation _HDCoreMotionAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_cmWorkout, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end