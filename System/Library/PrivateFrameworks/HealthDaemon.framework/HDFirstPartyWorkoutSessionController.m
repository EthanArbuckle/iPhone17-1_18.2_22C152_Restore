@interface HDFirstPartyWorkoutSessionController
+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4;
+ (id)recoveryIdentifier;
+ (void)willFinishSessionWithRecoveryData:(id)a3 profile:(id)a4;
- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3;
- (BOOL)endWithError:(id *)a3;
- (BOOL)pauseWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4;
- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4;
- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5;
- (HDFirstPartyWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (void)autoPauseWithDate:(id)a3;
- (void)autoResumeWithDate:(id)a3;
- (void)beginNewActivity:(id)a3;
- (void)didBeginNewActivity:(id)a3;
- (void)didDetectActivityChange:(id)a3;
- (void)didEndCurrentActivity:(id)a3;
- (void)endCurrentActivity:(id)a3;
- (void)endHeartRateRecovery;
- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4;
- (void)finish;
- (void)finishAggregationWithDate:(id)a3;
- (void)generateConfigurationUpdate:(id)a3;
- (void)generateError:(id)a3;
- (void)generateEvent:(id)a3;
- (void)generateMetadata:(id)a3;
- (void)hktest_setStateTransitionCompletionHandler:(id)a3;
- (void)unitTest_setCMWorkoutManager:(id)a3;
- (void)workoutSessionServer:(id)a3 accumulatorDidChange:(id)a4;
- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4;
- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6;
@end

@implementation HDFirstPartyWorkoutSessionController

- (HDFirstPartyWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDFirstPartyWorkoutSessionController;
  v14 = [(HDFirstPartyWorkoutSessionController *)&v18 init];
  if (v14)
  {
    v15 = [[HDDefaultWorkoutSessionController alloc] initWithProfile:v10 sessionConfiguration:v11 sessionStateController:v14 recoveryState:v13];
    defaultSessionController = v14->_defaultSessionController;
    v14->_defaultSessionController = v15;

    objc_storeWeak((id *)&v14->_sessionStateController, v12);
  }

  return v14;
}

- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4
{
}

- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6
{
  self->_currentState = a5;
  -[HDDefaultWorkoutSessionController workoutSessionServer:didTransitionFromState:toState:date:](self->_defaultSessionController, "workoutSessionServer:didTransitionFromState:toState:date:", a3, a4);
}

- (void)workoutSessionServer:(id)a3 accumulatorDidChange:(id)a4
{
}

+ (id)recoveryIdentifier
{
  return @"com.apple.SessionController.FirstParty";
}

- (void)hktest_setStateTransitionCompletionHandler:(id)a3
{
}

+ (void)willFinishSessionWithRecoveryData:(id)a3 profile:(id)a4
{
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
}

- (void)beginNewActivity:(id)a3
{
}

- (void)endCurrentActivity:(id)a3
{
}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  return [(HDDefaultWorkoutSessionController *)self->_defaultSessionController enableAutomaticDetectionForActivityConfigurations:a3];
}

- (BOOL)prepareWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = [WeakRetained prepareWithError:a3];

  return (char)a3;
}

- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4
{
  p_sessionStateController = &self->_sessionStateController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a4) = [WeakRetained startActivityWithDate:v6 error:a4];

  return (char)a4;
}

- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4
{
  p_sessionStateController = &self->_sessionStateController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a4) = [WeakRetained startActivityWithDate:v6 error:a4];

  return (char)a4;
}

- (BOOL)endWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = [WeakRetained endWithError:a3];

  return (char)a3;
}

- (BOOL)pauseWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = [WeakRetained pauseWithError:a3];

  return (char)a3;
}

- (BOOL)resumeWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = [WeakRetained resumeWithError:a3];

  return (char)a3;
}

- (void)autoPauseWithDate:(id)a3
{
  id v8 = a3;
  if (self)
  {
    v4 = HKObjectForNanoPreferencesUserDefaultsKey();
    if (v4)
    {
      v5 = v4;
      int v6 = [v4 BOOLValue];

      if (!v6) {
        goto LABEL_7;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
      [WeakRetained autoPauseWithDate:v8];
    }
    else
    {
      id WeakRetained = 0;
    }
  }
LABEL_7:
}

- (void)autoResumeWithDate:(id)a3
{
  if (self->_currentState == 9)
  {
    p_sessionStateController = &self->_sessionStateController;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
    [WeakRetained autoResumeWithDate:v4];
  }
}

- (void)endHeartRateRecovery
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  [WeakRetained endHeartRateRecovery];
}

- (void)finish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  [WeakRetained finish];
}

- (void)finishAggregationWithDate:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained finishAggregationWithDate:v4];
}

- (void)generateEvent:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained generateEvent:v4];
}

- (void)generateError:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained generateError:v4];
}

- (void)generateMetadata:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained generateMetadata:v4];
}

- (void)generateConfigurationUpdate:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained generateConfigurationUpdate:v4];
}

- (void)didBeginNewActivity:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained didBeginNewActivity:v4];
}

- (void)didEndCurrentActivity:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained didEndCurrentActivity:v4];
}

- (void)didDetectActivityChange:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained didDetectActivityChange:v4];
}

- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5
{
  p_sessionStateController = &self->_sessionStateController;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a5) = [WeakRetained storeSessionControllerState:v9 forRecoveryIdentifier:v8 error:a5];

  return (char)a5;
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  v3 = [WeakRetained workoutDataAccumulator];

  return (HDWorkoutDataAccumulator *)v3;
}

+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4
{
  return [a4 isEqualToString:@"com.apple.SessionTrackerApp"];
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSessionController, 0);

  objc_destroyWeak((id *)&self->_sessionStateController);
}

@end