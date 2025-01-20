@interface HDGymKitWorkoutSessionController
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
- (HDGymKitWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (void)autoPauseWithDate:(id)a3;
- (void)autoResumeWithDate:(id)a3;
- (void)endHeartRateRecovery;
- (void)finish;
- (void)finishAggregationWithDate:(id)a3;
- (void)fitnessMachineSessionUUID:(id)a3 updatedRecoveryConfiguration:(id)a4;
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

@implementation HDGymKitWorkoutSessionController

- (HDGymKitWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDGymKitWorkoutSessionController;
  v14 = [(HDGymKitWorkoutSessionController *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    v16 = [v11 workoutConfiguration];
    uint64_t v17 = [v16 fitnessMachineSessionUUID];
    fitnessMachineSessionUUID = v15->_fitnessMachineSessionUUID;
    v15->_fitnessMachineSessionUUID = (NSUUID *)v17;

    v19 = (HDDefaultWorkoutSessionController *)[objc_alloc((Class)HDDefaultWorkoutSessionController) initWithProfile:v10 sessionConfiguration:v11 sessionStateController:v15 recoveryState:v13];
    defaultSessionController = v15->_defaultSessionController;
    v15->_defaultSessionController = v19;

    objc_storeWeak((id *)&v15->_sessionStateController, v12);
    uint64_t v21 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v21;

    v15->_acceptsDataAccumulators = 1;
    sub_1F260((uint64_t)v15, v13);
  }

  return v15;
}

- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6
{
  [(HDDefaultWorkoutSessionController *)self->_defaultSessionController workoutSessionServer:a3 didTransitionFromState:a4 toState:a5 date:a6];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F3C4;
  block[3] = &unk_612B0;
  block[5] = a5;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1F7BC;
  v8[3] = &unk_608E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)workoutSessionServer:(id)a3 accumulatorDidChange:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1F860;
  v8[3] = &unk_608E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

+ (id)recoveryIdentifier
{
  return @"com.apple.SessionController.GymKit";
}

+ (void)willFinishSessionWithRecoveryData:(id)a3 profile:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v10];

  id v8 = v10;
  if (v7)
  {
    id v9 = [v5 fitnessMachineManager];
    [v9 finishSessionWithConfiguration:v7];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_40B0C();
    }
  }
}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  return 0;
}

- (void)fitnessMachineSessionUUID:(id)a3 updatedRecoveryConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2007C;
  block[3] = &unk_607A8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
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
  LOBYTE(a4) = [WeakRetained stopActivityWithDate:v6 error:a4];

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
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Auto-pause is ignore during GymKit workouts", v4, 2u);
  }
}

- (void)autoResumeWithDate:(id)a3
{
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Auto-pause is ignore during GymKit workouts", v4, 2u);
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

- (void)generateEvent:(id)a3
{
  id v4 = a3;
  if ([v4 eventType] == (char *)&dword_4 + 3 || objc_msgSend(v4, "eventType") == &dword_8)
  {
    _HKInitializeLogging();
    id v5 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Auto-pause is ignore during GymKit workouts", v7, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
    [WeakRetained generateEvent:v4];
  }
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

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  v3 = [WeakRetained workoutDataAccumulator];

  return (HDWorkoutDataAccumulator *)v3;
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

- (void)finishAggregationWithDate:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained finishAggregationWithDate:v4];
}

+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4
{
  id v4 = [a3 fitnessMachineSessionUUID];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)hktest_setStateTransitionCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2079C;
  v7[3] = &unk_609F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentAccumulator);
  objc_storeStrong((id *)&self->_fitnessMachineSessionUUID, 0);
  objc_storeStrong((id *)&self->_defaultSessionController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_sessionStateController);

  objc_destroyWeak((id *)&self->_profile);
}

@end