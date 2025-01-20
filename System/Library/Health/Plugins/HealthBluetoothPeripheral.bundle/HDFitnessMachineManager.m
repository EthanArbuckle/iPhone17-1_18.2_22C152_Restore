@interface HDFitnessMachineManager
- (HDFitnessMachineConnectionInitiatorProtocol)connectionInitiatorServer;
- (HDFitnessMachineDataProducer)fitnessMachineDataProducer;
- (HDFitnessMachineManager)initWithProfile:(id)a3;
- (HDMetricsCollector)metricsCollector;
- (NSDate)machinePreferredUntilDate;
- (id)currentSessionRecoveryConfiguration;
- (id)pairingManagerRequestsOOBData:(id)a3 error:(id *)a4;
- (id)unitTest_currentFitnessMachineSession;
- (unint64_t)fitnessMachineTypeForSessionUUID:(id)a3;
- (void)_queue_handleBeginPairing:(id)a3;
- (void)_queue_handleReceivedCharacteristic:(id)a3 device:(id)a4 error:(id)a5;
- (void)_queue_registerClient:(id)a3 withConnectionUUID:(id)a4;
- (void)_setQueue:(id)a3;
- (void)addFitnessMachineSessionObserver:(id)a3;
- (void)clientInvalidatedWithConnectionUUID:(id)a3;
- (void)dealloc;
- (void)endFitnessMachineConnectionForFitnessMachineSessionUUID:(id)a3 withConnectionUUID:(id)a4;
- (void)endFitnessMachineConnectionWithUUID:(id)a3;
- (void)endFitnessMachineSessionWithUUID:(id)a3;
- (void)finishSessionWithConfiguration:(id)a3;
- (void)hktest_setMachinePreferredUntilDate:(id)a3;
- (void)markClientReadyWithConnectionUUID:(id)a3;
- (void)pairingManager:(id)a3 didChangeNFCEnabledState:(BOOL)a4;
- (void)pairingManager:(id)a3 discoveredHealthService:(id)a4 machineType:(unint64_t)a5;
- (void)pairingManager:(id)a3 failedPairingWithError:(id)a4;
- (void)pairingManager:(id)a3 updatedConnectionStateFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)pairingManagerDidBeginPairing:(id)a3;
- (void)pairingManagerReadyToConnect:(id)a3;
- (void)pairingManagerReceivedActivityTypeAndPermission:(id)a3;
- (void)pairingManagerUpdatedMachineInformation:(id)a3;
- (void)pairingManagerWillBeginPairing:(id)a3 fitnessMachineToken:(id)a4;
- (void)recoverSessionWithConfiguration:(id)a3;
- (void)registerClient:(id)a3 withConnectionUUID:(id)a4;
- (void)removeFitnessMachineSessionObserver:(id)a3;
- (void)simulateDisconnect;
- (void)stateTimersDisconnectTimeout:(id)a3;
- (void)stateTimersMfaTimeout:(id)a3;
- (void)stateTimersPauseTimeout:(id)a3;
- (void)stateTimersRetryConnectionTimeout:(id)a3;
- (void)stateTimersWaitForMachineStartTimeout:(id)a3;
- (void)unitTest_fakeMachineDiscoveryForType:(unint64_t)a3;
- (void)unitTest_fakeSession:(id)a3;
- (void)unitTest_receiveFakeCharacteristicUpdate:(id)a3;
- (void)unitTest_tearDownFakeSession;
@end

@implementation HDFitnessMachineManager

- (HDFitnessMachineManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDFitnessMachineManager;
  v5 = [(HDFitnessMachineManager *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v6->_connections;
    v6->_connections = v9;

    v11 = [[HDGymKitPairingManager alloc] initWithProfile:v4];
    pairingManager = v6->_pairingManager;
    v6->_pairingManager = v11;

    [(HDGymKitPairingManager *)v6->_pairingManager setDelegate:v6];
    v13 = [[HDFitnessMachineDataProducer alloc] initWithProfile:v4];
    fitnessMachineDataProducer = v6->_fitnessMachineDataProducer;
    v6->_fitnessMachineDataProducer = v13;

    v15 = [[HDFitnessMachineStateTimers alloc] initWithQueue:v6->_queue delegate:v6];
    fitnessMachineStateTimers = v6->_fitnessMachineStateTimers;
    v6->_fitnessMachineStateTimers = v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    characteristicDataBuffer = v6->_characteristicDataBuffer;
    v6->_characteristicDataBuffer = v17;

    v19 = objc_alloc_init(HDFitnessMachineAnalyticsCollector);
    analyticsCollector = v6->_analyticsCollector;
    v6->_analyticsCollector = v19;

    id v21 = objc_alloc((Class)HKSynchronousObserverSet);
    v22 = (HKSynchronousObserverSet *)[v21 initWithName:@"fitness-machine-session-observer" loggingCategory:HKLogWorkouts];
    fitnessMachineSessionObservers = v6->_fitnessMachineSessionObservers;
    v6->_fitnessMachineSessionObservers = v22;
  }
  return v6;
}

- (void)dealloc
{
  [(HDFitnessMachineStateTimers *)self->_fitnessMachineStateTimers cancelAllTimers];
  v3.receiver = self;
  v3.super_class = (Class)HDFitnessMachineManager;
  [(HDFitnessMachineManager *)&v3 dealloc];
}

- (void)_setQueue:(id)a3
{
}

- (NSDate)machinePreferredUntilDate
{
  return [(HDFitnessMachineSession *)self->_fitnessMachineSession machinePreferredUntilDate];
}

- (void)registerClient:(id)a3 withConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23D60;
  block[3] = &unk_607A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)markClientReadyWithConnectionUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_23E08;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endFitnessMachineConnectionWithUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_241E0;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endFitnessMachineConnectionForFitnessMachineSessionUUID:(id)a3 withConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_244B4;
  block[3] = &unk_607A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)endFitnessMachineSessionWithUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24560;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clientInvalidatedWithConnectionUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24918;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unint64_t)fitnessMachineTypeForSessionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24D28;
  block[3] = &unk_61320;
  id v10 = v4;
  v11 = self;
  id v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)currentSessionRecoveryConfiguration
{
  return [(HDFitnessMachineSession *)self->_fitnessMachineSession recoveryConfiguration];
}

- (void)recoverSessionWithConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24E70;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)finishSessionWithConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2514C;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)addFitnessMachineSessionObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_25388;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeFitnessMachineSessionObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2542C;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_handleReceivedCharacteristic:(id)a3 device:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v12 = &stru_61AE0;
  if (isKindOfClass) {
    id v12 = @"(#w0) ";
  }
  uint64_t v13 = v12;
  _HKInitializeLogging();
  v14 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543618;
    v30 = v13;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Received fitness machine characteristic %{public}@", (uint8_t *)&v29, 0x16u);
  }
  uint64_t v15 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];
  uint64_t v16 = [v15 device];
  v17 = [v16 localIdentifier];

  v18 = [v9 localIdentifier];
  LODWORD(v16) = [v18 isEqualToString:v17];

  if (v16)
  {
    if (v10)
    {
      sub_257C0((uint64_t)self, v10);
    }
    else
    {
      v19 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];
      v20 = [v19 device];
      id v21 = [v20 manufacturer];

      if (!v21)
      {
        v22 = [v9 manufacturer];

        if (!v22)
        {
          v28 = +[NSError hk_error:310 description:@"Fitness Machine brand not detected"];
          sub_257C0((uint64_t)self, v28);
          sub_24574((uint64_t)self, 0);

          goto LABEL_8;
        }
        sub_26644(self, v9);
      }
      v23 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];
      id v24 = [v23 type];
      id v25 = v8;
      switch((unint64_t)v24)
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 6uLL:
          objc_opt_class();
          char v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) == 0) {
            goto LABEL_18;
          }
          sub_26768((uint64_t)self, v25);
          break;
        default:
          _HKInitializeLogging();
          v26 = (void *)HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
            sub_41080(v26);
          }

LABEL_18:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            HKSessionTrackerAriadneTrigger();
            sub_267D4((uint64_t)self, v25);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              sub_26A00((uint64_t)self, v25);
            }
          }
          break;
      }
    }
  }
LABEL_8:
}

- (void)_queue_handleBeginPairing:(id)a3
{
  id v4 = (HDFitnessMachineSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fitnessMachineSession = self->_fitnessMachineSession;
  self->_fitnessMachineSession = v4;
  id v6 = v4;

  unint64_t v7 = sub_23C3C((uint64_t)self);
  id v8 = [(HDFitnessMachineSession *)self->_fitnessMachineSession nfcSessionID];
  [v7 enablePrivateModeForSessionWithIdentifier:v8];

  id v9 = [(HDFitnessMachineSession *)v6 fitnessMachineSessionUUID];
  sub_27340((uint64_t)self, v9);

  id v10 = sub_23C3C((uint64_t)self);
  v11 = (objc_class *)self;
  id v12 = NSStringFromClass(v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_273E0;
  v13[3] = &unk_60E10;
  v13[4] = self;
  [v10 sendBluetoothStatusUpdatesForServer:v12 updateHandler:v13 completion:0];
}

- (void)stateTimersPauseTimeout:(id)a3
{
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_41128();
  }
  sub_27128((uint64_t)self);
}

- (void)stateTimersWaitForMachineStartTimeout:(id)a3
{
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_4115C();
  }
  sub_27128((uint64_t)self);
}

- (void)stateTimersDisconnectTimeout:(id)a3
{
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_41190();
  }
  sub_26014((uint64_t)self);
}

- (void)stateTimersRetryConnectionTimeout:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_411C4();
  }
  id v4 = +[NSError hk_error:803 description:@"Failed to connect to fitness machine within allotted time."];
  sub_257C0((uint64_t)self, v4);
  sub_24574((uint64_t)self, 1);
}

- (void)stateTimersMfaTimeout:(id)a3
{
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_411F8();
  }
  id v4 = +[NSError hk_error:204 description:@"(#w0) Failed to complete MFA within allotted time."];
  sub_257C0((uint64_t)self, v4);
  sub_24574((uint64_t)self, 0);
}

- (void)_queue_registerClient:(id)a3 withConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sub_24AF8((uint64_t)self, v7);
  id v8 = (HDFitnessMachineConnection *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = +[NSError hk_error:108 description:@"Client already registered"];
    _HKInitializeLogging();
    id v10 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138413058;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2114;
      __int16 v31 = v9;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Error registering client connection: %@ client: %@, connection UUID: %@, error: %{public}@", (uint8_t *)&v24, 0x2Au);
    }
    objc_msgSend(v6, "clientRemote_deliverFailedWithError:", v9);
  }
  else
  {
    id v9 = [[HDFitnessMachineConnection alloc] initWithUUID:v7 client:v6];
    _HKInitializeLogging();
    v11 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412802;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Registering client connection: %@, client: %@ for connection UUID %@", (uint8_t *)&v24, 0x20u);
    }
    sub_286D0((uint64_t)self, v9);
    id v12 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachineSessionUUID];

    if (v12)
    {
      uint64_t v13 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];

      if (v13)
      {
        v14 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];
        objc_msgSend(v6, "clientRemote_deliverMachineInformationUpdated:", v14);
      }
      unint64_t v15 = [(HDFitnessMachineSession *)self->_fitnessMachineSession connectionState];
      uint64_t v16 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachineSessionUUID];
      objc_msgSend(v6, "clientRemote_deliverConnectionChangedToState:fromState:fitnessMachineSessionUUID:error:", v15, 0, v16, 0);

      unint64_t v17 = [(HDFitnessMachineSession *)self->_fitnessMachineSession machineState];
      v18 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachine];

      if (v18 && v17)
      {
        if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          v19 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachineSessionUUID];
          v20 = [(HDFitnessMachineSession *)self->_fitnessMachineSession machineStartDate];
          uint64_t v21 = 1;
          objc_msgSend(v6, "clientRemote_deliverMachineChangedToState:fromState:fitnessMachineSessionUUID:date:", 1, 0, v19, v20);
        }
        else
        {
          uint64_t v21 = 0;
        }
        v22 = [(HDFitnessMachineSession *)self->_fitnessMachineSession fitnessMachineSessionUUID];
        v23 = [(HDFitnessMachineSession *)self->_fitnessMachineSession machineStateUpdateDate];
        objc_msgSend(v6, "clientRemote_deliverMachineChangedToState:fromState:fitnessMachineSessionUUID:date:", v17, v21, v22, v23);
      }
    }
  }
}

- (HDFitnessMachineConnectionInitiatorProtocol)connectionInitiatorServer
{
  return (HDFitnessMachineConnectionInitiatorProtocol *)self->_pairingManager;
}

- (HDMetricsCollector)metricsCollector
{
  return (HDMetricsCollector *)self->_collector;
}

- (void)pairingManagerWillBeginPairing:(id)a3 fitnessMachineToken:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
    sub_4122C(v6);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_288CC;
  v9[3] = &unk_608E8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)pairingManager:(id)a3 failedPairingWithError:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    sub_412B0((uint64_t)v5, v6);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_289AC;
  v9[3] = &unk_608E8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)pairingManager:(id)a3 didChangeNFCEnabledState:(BOOL)a4
{
  _HKInitializeLogging();
  id v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
    sub_41328(a4, v5);
  }
}

- (id)pairingManagerRequestsOOBData:(id)a3 error:(id *)a4
{
  id v5 = sub_23C3C((uint64_t)self);
  id v6 = [v5 retrieveOOBData:a4];

  return v6;
}

- (void)pairingManagerUpdatedMachineInformation:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28B04;
  block[3] = &unk_60820;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pairingManager:(id)a3 updatedConnectionStateFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28B88;
  block[3] = &unk_612B0;
  void block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)pairingManagerReceivedActivityTypeAndPermission:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28C14;
  block[3] = &unk_60820;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pairingManager:(id)a3 discoveredHealthService:(id)a4 machineType:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_28CD4;
  v6[3] = &unk_609D0;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)pairingManagerReadyToConnect:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28DF4;
  block[3] = &unk_60820;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)pairingManagerDidBeginPairing:(id)a3
{
}

- (void)simulateDisconnect
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28E7C;
  block[3] = &unk_60820;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)hktest_setMachinePreferredUntilDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_28FE4;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)unitTest_fakeMachineDiscoveryForType:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_29064;
  v4[3] = &unk_609D0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)unitTest_fakeSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_291A8;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)unitTest_currentFitnessMachineSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_293B0;
  id v10 = sub_293C0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_293C8;
  v5[3] = &unk_60A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)unitTest_receiveFakeCharacteristicUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_29474;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)unitTest_tearDownFakeSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29560;
  block[3] = &unk_60820;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (HDFitnessMachineDataProducer)fitnessMachineDataProducer
{
  return self->_fitnessMachineDataProducer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_fitnessMachineStateTimers, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_fitnessMachineDataProducer, 0);
  objc_storeStrong((id *)&self->_fitnessMachineSessionObservers, 0);
  objc_storeStrong((id *)&self->_characteristicDataBuffer, 0);
  objc_storeStrong((id *)&self->_fitnessMachineSession, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_collector, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end