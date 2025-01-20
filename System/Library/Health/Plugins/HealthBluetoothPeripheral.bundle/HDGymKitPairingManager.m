@interface HDGymKitPairingManager
- (HDGymKitPairingManager)initWithProfile:(id)a3;
- (HDGymKitPairingManagerDelegate)delegate;
- (id)_newNearFieldInterface;
- (id)_newWatchAppStateMonitor;
- (void)dealloc;
- (void)deliverError:(id)a3;
- (void)forbidConnectionForFitnessMachineSessionUUID:(id)a3 withConnectionUUID:(id)a4;
- (void)gymKitSettings:(id)a3 didChangeFromNFCPermission:(unint64_t)a4 toNFCPermission:(unint64_t)a5;
- (void)handleBLEConnectionCompletedSuccessfully:(BOOL)a3;
- (void)monitorDidDetectAppActivate:(id)a3;
- (void)monitorDidDetectAppDeactivate:(id)a3;
- (void)nearFieldInterfaceDidEnterField:(id)a3;
- (void)nearFieldInterfaceDidReadTag:(id)a3;
- (void)nearFieldInterfaceFieldDetectionDidEndUnexpectedly:(id)a3;
- (void)nearFieldInterfaceTagSessionDidEndUnexpectedly:(id)a3;
- (void)permitConnectionForFitnessMachineSessionUUID:(id)a3 activityType:(unint64_t)a4 withConnectionUUID:(id)a5;
- (void)registerConnectionInitiatorClient:(id)a3 withConnectionUUID:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)simulateAccept;
- (void)simulateTapWithFitnessMachineType:(unint64_t)a3;
- (void)stateTimersFieldDetectTimeout:(id)a3;
- (void)stateTimersTagReadTimeout:(id)a3;
- (void)stateTimersUserAcceptanceTimeout:(id)a3;
- (void)updatedConnectionStateWithError:(id)a3;
- (void)updatedFitnessMachine;
- (void)updatedFitnessMachineState:(unint64_t)a3 fitnessMachineSessionUUID:(id)a4;
- (void)workoutAppIsReady;
- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5;
- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4;
@end

@implementation HDGymKitPairingManager

- (HDGymKitPairingManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDGymKitPairingManager;
  v5 = [(HDGymKitPairingManager *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueueWithQOSClass();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionInitiatorClients = v6->_connectionInitiatorClients;
    v6->_connectionInitiatorClients = v9;

    v11 = [(HDGymKitPairingManager *)v6 _newNearFieldInterface];
    nearFieldInterface = v6->_nearFieldInterface;
    v6->_nearFieldInterface = v11;

    [(HDNearFieldInterface *)v6->_nearFieldInterface setDelegate:v6];
    v13 = [HDGymKitSettings alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v15 = [(HDGymKitSettings *)v13 initWithProfile:WeakRetained];
    gymKitSettings = v6->_gymKitSettings;
    v6->_gymKitSettings = v15;

    [(HDGymKitSettings *)v6->_gymKitSettings setDelegate:v6];
    v6->_bluetoothState = 0;
    v17 = [[HDFitnessMachineStateTimers alloc] initWithQueue:v6->_queue delegate:v6];
    fitnessMachineStateTimers = v6->_fitnessMachineStateTimers;
    v6->_fitnessMachineStateTimers = v17;

    v19 = [(HDGymKitPairingManager *)v6 _newWatchAppStateMonitor];
    workoutAppStateMonitor = v6->_workoutAppStateMonitor;
    v6->_workoutAppStateMonitor = v19;

    [(HDWatchAppStateMonitor *)v6->_workoutAppStateMonitor setDelegate:v6];
    id v21 = objc_loadWeakRetained((id *)&v6->_profile);
    v22 = [v21 workoutManager];
    [v22 registerCurrentWorkoutObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained workoutManager];
  [v4 unregisterCurrentWorkoutObserver:self];

  [(HDFitnessMachineStateTimers *)self->_fitnessMachineStateTimers cancelAllTimers];
  [(HDPowerAssertion *)self->_tagReadPowerAssertion invalidate];
  [(HDNearFieldInterface *)self->_nearFieldInterface endFieldDetectSession];
  [(HDNearFieldInterface *)self->_nearFieldInterface endNdefTagSession];
  v5.receiver = self;
  v5.super_class = (Class)HDGymKitPairingManager;
  [(HDGymKitPairingManager *)&v5 dealloc];
}

- (id)_newNearFieldInterface
{
  return objc_alloc_init(HDNearFieldInterface);
}

- (id)_newWatchAppStateMonitor
{
  id v2 = objc_alloc((Class)HDWatchAppStateMonitor);

  return [v2 initWithFirstPartyWorkoutApp];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DBC0;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleBLEConnectionCompletedSuccessfully:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E118;
  v4[3] = &unk_60B40;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)gymKitSettings:(id)a3 didChangeFromNFCPermission:(unint64_t)a4 toNFCPermission:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E1E8;
  v6[3] = &unk_609D0;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)nearFieldInterfaceDidEnterField:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received a field detect event", buf, 0xCu);
  }
  HKSessionTrackerAriadneTrigger();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F060;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)nearFieldInterfaceFieldDetectionDidEndUnexpectedly:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: NDefTagSession ended unexpectedly", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F164;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)nearFieldInterfaceDidReadTag:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F1E0;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)nearFieldInterfaceTagSessionDidEndUnexpectedly:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
    sub_40068((uint64_t)self, v4);
  }
  [(HDGymKitPairingManager *)self reset];
}

- (void)monitorDidDetectAppActivate:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F66C;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)monitorDidDetectAppDeactivate:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F71C;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F7F0;
  v8[3] = &unk_608E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_F910;
  v9[3] = &unk_608E8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)stateTimersFieldDetectTimeout:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sub_E260((uint64_t)self);

  sub_E37C((uint64_t)self);
}

- (void)stateTimersTagReadTimeout:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  sub_EE2C((uint64_t)self);
}

- (void)stateTimersUserAcceptanceTimeout:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = +[NSError hk_error:805 description:@"No user acceptance within the required timeout"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pairingManager:self failedPairingWithError:v5];
}

- (void)registerConnectionInitiatorClient:(id)a3 withConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10420;
  block[3] = &unk_607A8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)permitConnectionForFitnessMachineSessionUUID:(id)a3 activityType:(unint64_t)a4 withConnectionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_106DC;
  v13[3] = &unk_60C08;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)forbidConnectionForFitnessMachineSessionUUID:(id)a3 withConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10968;
  block[3] = &unk_607A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)workoutAppIsReady
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10B70;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updatedFitnessMachine
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10BFC;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updatedFitnessMachineState:(unint64_t)a3 fitnessMachineSessionUUID:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10E6C;
  block[3] = &unk_60C98;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)updatedConnectionStateWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1106C;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deliverError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_113D8;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)simulateTapWithFitnessMachineType:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11464;
  v4[3] = &unk_609D0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)simulateAccept
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1172C;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (HDGymKitPairingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDGymKitPairingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gymKitSettings, 0);
  objc_storeStrong((id *)&self->_simulatorSupport, 0);
  objc_storeStrong((id *)&self->_connectionInitiatorClients, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_fitnessMachineSession, 0);
  objc_storeStrong((id *)&self->_workoutAppStateMonitor, 0);
  objc_storeStrong((id *)&self->_fitnessMachineStateTimers, 0);
  objc_storeStrong((id *)&self->_tagReadPowerAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nearFieldInterface, 0);
}

@end