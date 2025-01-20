@interface HKWorkoutSession
+ (BOOL)_applicationHasRunningWorkout;
+ (BOOL)supportsSecureCoding;
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)targetWorkoutSessionStateMachineForSessionUUID:(id)a3;
+ (void)_unitTest_clearAllRunningWorkouts;
- (BOOL)_isInvalidatedMirroredSession;
- (BOOL)_queue_isInvalidatedMirroredSession;
- (BOOL)_queue_shouldAttemptRecovery;
- (BOOL)isGymKitSession;
- (BOOL)shouldStopPreviousSession;
- (BOOL)supportsAppRelaunchForRecovery;
- (HKHealthStore)healthStore;
- (HKLiveWorkoutBuilder)associatedWorkoutBuilder;
- (HKWorkoutActivity)currentActivity;
- (HKWorkoutActivityType)activityType;
- (HKWorkoutConfiguration)workoutConfiguration;
- (HKWorkoutSession)initWithActivityType:(HKWorkoutActivityType)activityType locationType:(HKWorkoutSessionLocationType)locationType;
- (HKWorkoutSession)initWithCoder:(id)a3;
- (HKWorkoutSession)initWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error;
- (HKWorkoutSession)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error;
- (HKWorkoutSessionLocationType)locationType;
- (HKWorkoutSessionState)state;
- (HKWorkoutSessionType)type;
- (NSArray)activityConfigurations;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSUUID)identifier;
- (id)_initWithHealthStore:(id)a3 taskConfiguration:(id)a4 error:(id *)a5;
- (id)_notMirroringError;
- (id)_privateDelegate;
- (id)associatedWorkoutBuilderWithDevice:(id)a3 goalType:(unint64_t)a4 goal:(id)a5;
- (id)delegate;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_dataUpdateWithUUID:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)_enqueueDataUpdate:(id)a3;
- (void)_queue_enqueueStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5;
- (void)_queue_markRecoveryRequired;
- (void)_queue_pendingDataUpdateDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_resetStateMachineWithNewState:(int64_t)a3;
- (void)_queue_sendPendingDataUpdateToRemoteWorkoutSession;
- (void)_recoverWithCompletion:(id)a3;
- (void)_setAssociatedWorkoutBuilder:(id)a3;
- (void)_setupMirroredSessionTaskServerWithCompletion:(id)a3;
- (void)_setupTaskServerWithCompletion:(id)a3;
- (void)_setupWithHealthStore:(id)a3;
- (void)_unitTest_discardAssociatedWorkoutBuilder;
- (void)beginNewActivityWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration date:(NSDate *)date metadata:(NSDictionary *)metadata;
- (void)client_didBeginActivity:(id)a3 date:(id)a4;
- (void)client_didChangeToState:(int64_t)a3 date:(id)a4;
- (void)client_didDisconnectFromRemoteWithError:(id)a3 completion:(id)a4;
- (void)client_didEndActivity:(id)a3 date:(id)a4;
- (void)client_didFailWithError:(id)a3;
- (void)client_didGenerateEvents:(id)a3;
- (void)client_didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)client_didSuggestWorkoutConfiguration:(id)a3 date:(id)a4;
- (void)client_didSyncCurrentActivity:(id)a3;
- (void)client_didSyncSessionEvent:(int64_t)a3 date:(id)a4;
- (void)client_didUpdateStartDate:(id)a3 endDate:(id)a4;
- (void)client_didUpdateWorkoutConfiguration:(id)a3;
- (void)client_remoteSessionDidRecover;
- (void)client_synchronizeWithCompletion:(id)a3;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)enableAutomaticDetectionForActivityConfigurations:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)end;
- (void)endCurrentActivityOnDate:(NSDate *)date;
- (void)endWithCompletion:(id)a3;
- (void)pause;
- (void)pauseWithCompletion:(id)a3;
- (void)pauseWithDate:(id)a3 completion:(id)a4;
- (void)prepare;
- (void)prepareWithCompletion:(id)a3;
- (void)resume;
- (void)resumeWithCompletion:(id)a3;
- (void)resumeWithDate:(id)a3 completion:(id)a4;
- (void)sendDataToRemoteWorkoutSession:(NSData *)data completion:(void *)completion;
- (void)setDelegate:(id)delegate;
- (void)setShouldStopPreviousSession:(BOOL)a3;
- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3;
- (void)startActivity;
- (void)startActivityWithDate:(NSDate *)date;
- (void)startActivityWithDate:(id)a3 completion:(id)a4;
- (void)startMirroringToCompanionDeviceWithCompletion:(void *)completion;
- (void)stateMachine:(id)a3 didIgnoreEvent:(int64_t)a4 state:(id)a5;
- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8;
- (void)stopActivity;
- (void)stopActivityWithDate:(NSDate *)date;
- (void)stopActivityWithDate:(id)a3 completion:(id)a4;
- (void)stopMirroringToCompanionDeviceWithCompletion:(void *)completion;
@end

@implementation HKWorkoutSession

+ (id)targetWorkoutSessionStateMachineForSessionUUID:(id)a3
{
  id v4 = a3;
  v5 = [HKStateMachine alloc];
  v6 = +[HKStateMachine nameForOwner:a1 UUID:v4 tag:0];

  v7 = [(HKStateMachine *)v5 initWithName:v6];
  v8 = [(HKStateMachine *)v7 addStateWithIndex:1 label:@"NotStarted"];
  v9 = [(HKStateMachine *)v7 addStateWithIndex:2 label:@"Running"];
  v10 = [(HKStateMachine *)v7 addStateWithIndex:3 label:@"Ended"];
  v11 = [(HKStateMachine *)v7 addStateWithIndex:4 label:@"Paused"];
  v12 = [(HKStateMachine *)v7 addStateWithIndex:5 label:@"Prepared"];
  v13 = [(HKStateMachine *)v7 addStateWithIndex:6 label:@"Stopped"];
  id v14 = [(HKStateMachine *)v7 addStateTransitionFrom:v8 to:v12 event:1 label:@"prepare"];
  id v15 = [(HKStateMachine *)v7 addStateTransitionFrom:v8 to:v9 event:2 label:@"start"];
  id v16 = [(HKStateMachine *)v7 addStateTransitionFrom:v12 to:v9 event:2 label:@"start"];
  id v17 = [(HKStateMachine *)v7 addStateTransitionFrom:v12 to:v10 event:6 label:@"start"];
  id v18 = [(HKStateMachine *)v7 addStateTransitionFrom:v9 to:v11 event:3 label:@"pause"];
  id v19 = [(HKStateMachine *)v7 addStateTransitionFrom:v11 to:v9 event:4 label:@"resume"];
  id v20 = [(HKStateMachine *)v7 addStateTransitionFrom:v9 to:v13 event:5 label:@"stop"];
  id v21 = [(HKStateMachine *)v7 addStateTransitionFrom:v11 to:v13 event:5 label:@"stop"];
  id v22 = [(HKStateMachine *)v7 addStateTransitionFrom:v9 to:v10 event:6 label:@"end"];
  id v23 = [(HKStateMachine *)v7 addStateTransitionFrom:v11 to:v10 event:6 label:@"end"];
  id v24 = [(HKStateMachine *)v7 addStateTransitionFrom:v13 to:v10 event:6 label:@"end"];
  id v25 = [(HKStateMachine *)v7 addStateTransitionFrom:v8 to:v10 event:7 label:@"error"];
  id v26 = [(HKStateMachine *)v7 addStateTransitionFrom:v9 to:v10 event:7 label:@"error"];
  id v27 = [(HKStateMachine *)v7 addStateTransitionFrom:v11 to:v10 event:7 label:@"error"];
  id v28 = [(HKStateMachine *)v7 addStateTransitionFrom:v12 to:v10 event:7 label:@"error"];
  id v29 = [(HKStateMachine *)v7 addStateTransitionFrom:v13 to:v10 event:7 label:@"error"];
  id v30 = [(HKStateMachine *)v7 addStateTransitionFrom:v10 to:v10 event:7 label:@"error"];

  return v7;
}

- (HKWorkoutSession)initWithActivityType:(HKWorkoutActivityType)activityType locationType:(HKWorkoutSessionLocationType)locationType
{
  v7 = objc_alloc_init(HKWorkoutConfiguration);
  [(HKWorkoutConfiguration *)v7 setActivityType:activityType];
  [(HKWorkoutConfiguration *)v7 setLocationType:locationType];
  id v11 = 0;
  v8 = [(HKWorkoutSession *)self initWithConfiguration:v7 error:&v11];
  id v9 = v11;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid activity type/location combination when instantiating HKWorkoutSession: %@", v9 format];
  }

  return v8;
}

- (HKWorkoutSession)initWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error
{
  v6 = workoutConfiguration;
  v7 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  v8 = [MEMORY[0x1E4F29128] UUID];
  [(HKWorkoutSessionTaskConfiguration *)v7 setSessionUUID:v8];

  [(HKWorkoutSessionTaskConfiguration *)v7 setWorkoutConfiguration:v6];
  [(HKWorkoutSessionTaskConfiguration *)v7 setSessionType:0];
  [(HKWorkoutSessionTaskConfiguration *)v7 setShouldStopPreviousSession:1];
  id v9 = [(HKWorkoutSession *)self _initWithHealthStore:0 taskConfiguration:v7 error:error];

  return v9;
}

- (HKWorkoutSession)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error
{
  v8 = healthStore;
  id v9 = workoutConfiguration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
  }
  v10 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  id v11 = [(HKWorkoutConfiguration *)v9 predictionSessionUUID];
  if (v11)
  {
    [(HKWorkoutSessionTaskConfiguration *)v10 setSessionUUID:v11];
  }
  else
  {
    v12 = [MEMORY[0x1E4F29128] UUID];
    [(HKWorkoutSessionTaskConfiguration *)v10 setSessionUUID:v12];
  }
  [(HKWorkoutSessionTaskConfiguration *)v10 setWorkoutConfiguration:v9];
  [(HKWorkoutSessionTaskConfiguration *)v10 setSessionType:0];
  [(HKWorkoutSessionTaskConfiguration *)v10 setShouldStopPreviousSession:1];
  v13 = [(HKWorkoutSession *)self _initWithHealthStore:v8 taskConfiguration:v10 error:error];

  return v13;
}

- (id)_initWithHealthStore:(id)a3 taskConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 workoutConfiguration];
  int v11 = [v10 validateIgnoringDeviceSupport:0 error:a5];

  if (!v11) {
    goto LABEL_4;
  }
  v12 = [v9 workoutConfiguration];
  uint64_t v13 = [v12 activityType];

  if (v13 == 84)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 12, @"Workout session does not support this activity type");
LABEL_4:
    id v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v15 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = [v9 workoutConfiguration];
    *(_DWORD *)buf = 138543618;
    v37 = self;
    __int16 v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_19C023000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Initializing workout session with configuration %@", buf, 0x16u);
  }
  id v18 = [v9 sessionUUID];

  if (!v18)
  {
    id v19 = [MEMORY[0x1E4F29128] UUID];
    [v9 setSessionUUID:v19];
  }
  v35.receiver = self;
  v35.super_class = (Class)HKWorkoutSession;
  id v20 = [(HKWorkoutSession *)&v35 init];
  id v21 = v20;
  if (v20)
  {
    uint64_t v22 = HKCreateSerialDispatchQueue(v20, 0);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v22;

    uint64_t v24 = HKCreateSerialDispatchQueue(v21, @"client");
    clientQueue = v21->_clientQueue;
    v21->_clientQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [v9 copy];
    configuration = v21->_configuration;
    v21->_configuration = (HKWorkoutSessionTaskConfiguration *)v26;

    v21->_state = 1;
    if (v8) {
      [(HKWorkoutSession *)v21 _setupWithHealthStore:v8];
    }
    id v28 = objc_opt_class();
    id v29 = [v9 sessionUUID];
    uint64_t v30 = [v28 targetWorkoutSessionStateMachineForSessionUUID:v29];
    targetStateMachine = v21->_targetStateMachine;
    v21->_targetStateMachine = (HKStateMachine *)v30;

    [(HKStateMachine *)v21->_targetStateMachine setDelegate:v21];
    [(HKStateMachine *)v21->_targetStateMachine enterAtState:1];
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dataUpdateQueue = v21->_dataUpdateQueue;
    v21->_dataUpdateQueue = v32;
  }
  self = v21;
  id v14 = self;
LABEL_14:

  return v14;
}

- (void)dealloc
{
  v3 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionUUID];
  _HKRemoveRunningWorkoutSessionUUID(v3);

  v4.receiver = self;
  v4.super_class = (Class)HKWorkoutSession;
  [(HKWorkoutSession *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionUUID];
  v6 = HKWorkoutSessionStateToString(self->_state);
  v7 = HKWorkoutSessionTypeToString([(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionType]);
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ %@ [%@]>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (void)_setupWithHealthStore:(id)a3
{
  v5 = (HKHealthStore *)a3;
  p_healthStore = &self->_healthStore;
  if (self->_healthStore != v5)
  {
    id v21 = v5;
    objc_storeStrong((id *)p_healthStore, a3);
    [(HKWorkoutSessionTaskConfiguration *)self->_configuration setRequiresCoreLocationAssertion:HKProgramSDKAtLeast() ^ 1];
    if (HKProgramSDKAtLeast())
    {
      v7 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        id v9 = [v8 extensionPointRecord];
        v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:@"com.apple.watchkit"];

        v7 = v8;
        if (v11)
        {
          v7 = [v8 containingBundleRecord];
        }
      }
      v12 = [v7 infoDictionary];
      uint64_t v13 = [v12 objectForKey:@"WKSupportsAlwaysOnDisplay" ofClass:objc_opt_class()];

      unsigned int v14 = [v13 BOOLValue];
      if (v13) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    [(HKWorkoutSessionTaskConfiguration *)self->_configuration setSupports3rdPartyAOT:v15];
    id v16 = [HKTaskServerProxyProvider alloc];
    healthStore = self->_healthStore;
    id v18 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionUUID];
    id v19 = [(HKTaskServerProxyProvider *)v16 initWithHealthStore:healthStore taskIdentifier:@"HKWorkoutSessionTaskServer" exportedObject:self taskUUID:v18];
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = v19;

    p_healthStore = (HKHealthStore **)[(HKTaskServerProxyProvider *)self->_proxyProvider setTaskConfiguration:self->_configuration];
    v5 = v21;
  }

  MEMORY[0x1F41817F8](p_healthStore, v5);
}

- (void)_recoverWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke;
  v9[3] = &unk_1E58C4F20;
  v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_3;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

void __43__HKWorkoutSession__recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning post-client-crash recovery.", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_81;
  v7[3] = &unk_1E58BBA50;
  id v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  objc_msgSend(v3, "remote_recoverWithCompletion:", v7);
}

void __43__HKWorkoutSession__recoverWithCompletion___block_invoke_81(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_2;
  v10[3] = &unk_1E58C4EF8;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_sync(v7, v10);
}

uint64_t __43__HKWorkoutSession__recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_class();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) sessionUUID];
  uint64_t v4 = [v2 targetWorkoutSessionStateMachineForSessionUUID:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 96) enterAtState:*(void *)(*(void *)(a1 + 32) + 32)];
  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

uint64_t __43__HKWorkoutSession__recoverWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_markRecoveryRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(HKWorkoutSessionTaskConfiguration *)self->_configuration requiresRecovery])
  {
    [(HKWorkoutSessionTaskConfiguration *)self->_configuration setRequiresRecovery:1];
    configuration = self->_configuration;
    proxyProvider = self->_proxyProvider;
    [(HKTaskServerProxyProvider *)proxyProvider setTaskConfiguration:configuration];
  }
}

- (BOOL)_queue_shouldAttemptRecovery
{
  return (self->_state < 7uLL) & (0x76u >> self->_state);
}

- (void)_queue_resetStateMachineWithNewState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  uint64_t v5 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    v7 = HKWorkoutSessionStateToString(a3);
    int v12 = 138543618;
    char v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Resetting target state machine after state update to to %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = objc_opt_class();
  id v9 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionUUID];
  uint64_t v10 = [v8 targetWorkoutSessionStateMachineForSessionUUID:v9];
  targetStateMachine = self->_targetStateMachine;
  self->_targetStateMachine = v10;

  [(HKStateMachine *)self->_targetStateMachine setDelegate:self];
  [(HKStateMachine *)self->_targetStateMachine enterAtState:a3];
}

- (id)_privateDelegate
{
  v2 = [(HKWorkoutSession *)self delegate];
  if ([v2 conformsToProtocol:&unk_1EED53210]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)_applicationHasRunningWorkout
{
  os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  BOOL v2 = [(id)_HKRunningWorkoutSessionUUIDs count] != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  return v2;
}

+ (id)clientInterface
{
  BOOL v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53270];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_didGenerateEvents_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  v8[6] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED532D0];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_enableAutomaticDetectionForActivityConfigurations_completion_, 0, 0);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:6];
  uint64_t v6 = [v4 setWithArray:v5];

  [v2 setClasses:v6 forSelector:sel_remote_beginNewActivityWithConfiguration_date_metadata_completion_ argumentIndex:2 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  return +[HKWorkoutSession clientInterface];
}

- (id)remoteInterface
{
  return +[HKWorkoutSession serverInterface];
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __41__HKWorkoutSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_shouldAttemptRecovery");
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_2;
    v6[3] = &unk_1E58BBF38;
    v6[4] = v3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_213;
    v5[3] = &unk_1E58BBCC0;
    v5[4] = v3;
    return [v4 fetchProxyWithHandler:v6 errorHandler:v5];
  }
  return result;
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning recovery after server interruption.", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_209;
  v10[3] = &unk_1E58BBE28;
  v10[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "remote_recoverWithCompletion:", v10);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 96) currentState];
  uint64_t v7 = [v6 index];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_211;
  v9[3] = &unk_1E58BBE28;
  v9[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "remote_setTargetState:date:completion:", v7, v8, v9);
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_209(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed recovery after server interruption.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __41__HKWorkoutSession_connectionInterrupted__block_invoke_209_cold_1();
    }
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
    if ([*(id *)(a1 + 32) type] == 1) {
      objc_msgSend(*(id *)(a1 + 32), "client_didDisconnectFromRemoteWithError:completion:", v5, &__block_literal_global_79);
    }
  }
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_211(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated target state after server interruption.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __41__HKWorkoutSession_connectionInterrupted__block_invoke_211_cold_1();
    }
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
  }
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_213(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __41__HKWorkoutSession_connectionInterrupted__block_invoke_213_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v3);
  if ([*(id *)(a1 + 32) type] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "client_didDisconnectFromRemoteWithError:completion:", v3, &__block_literal_global_216);
  }
}

- (void)client_didUpdateStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HKWorkoutSession_client_didUpdateStartDate_endDate___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __54__HKWorkoutSession_client_didUpdateStartDate_endDate___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1[4], "_queue_markRecoveryRequired");
  _HKInitializeLogging();
  BOOL v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = a1[6];
    int v12 = 138543874;
    id v13 = v3;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Update interval: %{public}@ - %{public}@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v6 = [a1[5] copy];
  id v7 = a1[4];
  int v8 = (void *)v7[5];
  void v7[5] = v6;

  uint64_t v9 = [a1[6] copy];
  id v10 = a1[4];
  id v11 = (void *)v10[6];
  v10[6] = v9;
}

- (void)client_didChangeToState:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HKWorkoutSession_client_didChangeToState_date___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __49__HKWorkoutSession_client_didChangeToState_date___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  _HKInitializeLogging();
  BOOL v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 32);
    id v5 = v2;
    id v6 = HKWorkoutSessionStateToString(v4);
    id v7 = HKWorkoutSessionStateToString(*(void *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v3;
    __int16 v28 = 2114;
    id v29 = v6;
    __int16 v30 = 2114;
    v31 = v7;
    __int16 v32 = 2114;
    uint64_t v33 = v8;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) State changed from %{public}@ -> %{public}@ at %{public}@", buf, 0x2Au);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 32);
  if (v9 != v11)
  {
    *(void *)(v10 + 32) = v9;
    uint64_t v12 = *(void *)(a1 + 32);
    unint64_t v13 = *(void *)(v12 + 32);
    if (v13 <= 6)
    {
      if (((1 << v13) & 0x74) != 0)
      {
        __int16 v14 = [*(id *)(v12 + 56) sessionUUID];
        if (v14)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
          id v15 = (void *)_HKRunningWorkoutSessionUUIDs;
          if (!_HKRunningWorkoutSessionUUIDs)
          {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v17 = (void *)_HKRunningWorkoutSessionUUIDs;
            _HKRunningWorkoutSessionUUIDs = (uint64_t)v16;

            id v15 = (void *)_HKRunningWorkoutSessionUUIDs;
          }
          [v15 addObject:v14];
          os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
        }
        goto LABEL_12;
      }
      if (((1 << v13) & 0xA) != 0)
      {
        __int16 v14 = [*(id *)(v12 + 56) sessionUUID];
        _HKRemoveRunningWorkoutSessionUUID(v14);
LABEL_12:
      }
    }
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(NSObject **)(v18 + 16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__HKWorkoutSession_client_didChangeToState_date___block_invoke_217;
    v22[3] = &unk_1E58C4F48;
    id v21 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 48);
    v22[4] = v18;
    uint64_t v24 = v20;
    uint64_t v25 = v11;
    id v23 = v21;
    dispatch_async(v19, v22);
  }
}

void __49__HKWorkoutSession_client_didChangeToState_date___block_invoke_217(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[4];
  id v7 = WeakRetained;
  if (a1[5])
  {
    objc_msgSend(WeakRetained, "workoutSession:didChangeToState:fromState:date:", v5, v3, v4);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v7 workoutSession:v5 didChangeToState:v3 fromState:v4 date:v6];
  }
}

- (void)client_didGenerateEvents:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HKWorkoutSession_client_didGenerateEvents___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__HKWorkoutSession_client_didGenerateEvents___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    uint64_t v12 = v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[HKWorkoutEvent _workoutEventWithInternalEvent:](HKWorkoutEvent, "_workoutEventWithInternalEvent:", *(void *)(*((void *)&v18 + 1) + 8 * v6), v12);
        if (v7)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
          if (objc_opt_respondsToSelector())
          {
            uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v14[0] = __45__HKWorkoutSession_client_didGenerateEvents___block_invoke_2;
            v14[1] = &unk_1E58BB9C8;
            id v10 = WeakRetained;
            uint64_t v11 = *(void *)(a1 + 32);
            id v15 = v10;
            uint64_t v16 = v11;
            id v17 = v7;
            dispatch_async(v9, block);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __45__HKWorkoutSession_client_didGenerateEvents___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didGenerateEvent:*(void *)(a1 + 48)];
}

- (void)client_didFailWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HKWorkoutSession_client_didFailWithError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__HKWorkoutSession_client_didFailWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) sessionUUID];
  _HKRemoveRunningWorkoutSessionUUID(v2);

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__HKWorkoutSession_client_didFailWithError___block_invoke_2;
  v5[3] = &unk_1E58BBBD0;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);
}

void __44__HKWorkoutSession_client_didFailWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained workoutSession:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)client_synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __53__HKWorkoutSession_client_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E58BBEC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __53__HKWorkoutSession_client_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)client_didSyncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void **)(v2 + 96);
  uint64_t v4 = a1[6];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke_2;
  v6[3] = &unk_1E58BBE28;
  v6[4] = v2;
  return [v3 enqueueEvent:v4 date:v1 error:0 completion:v6];
}

void __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Enqueued synced event with success: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)client_didSyncCurrentActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKWorkoutSession_client_didSyncCurrentActivity___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__HKWorkoutSession_client_didSyncCurrentActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) endDate];
  if (v2)
  {
  }
  else
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) currentActivity];

    if (!v3)
    {
      id v8 = *(void **)(a1 + 40);
      id v11 = [*(id *)(a1 + 32) workoutConfiguration];
      int v9 = [*(id *)(a1 + 32) startDate];
      uint64_t v10 = [*(id *)(a1 + 32) metadata];
      [v8 beginNewActivityWithConfiguration:v11 date:v9 metadata:v10];

      goto LABEL_9;
    }
  }
  uint64_t v4 = [*(id *)(a1 + 32) endDate];
  if (!v4) {
    return;
  }
  id v5 = (void *)v4;
  id v6 = [*(id *)(*(void *)(a1 + 40) + 56) currentActivity];

  if (!v6) {
    return;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) endDate];
  objc_msgSend(v7, "endCurrentActivityOnDate:");
LABEL_9:
}

- (void)client_didUpdateWorkoutConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setWorkoutConfiguration:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke_2;
    block[3] = &unk_1E58BB9C8;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    dispatch_async(v3, block);
  }
}

uint64_t __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didUpdateWorkoutConfiguration:*(void *)(a1 + 48)];
}

- (void)client_didBeginActivity:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(*(void *)(a1 + 32) + 56) setCurrentActivity:v2];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke_2;
    block[3] = &unk_1E58BB9C8;
    void block[4] = v5;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
  }
}

void __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) workoutConfiguration];
  [WeakRetained workoutSession:v2 didBeginActivityWithConfiguration:v3 date:*(void *)(a1 + 48)];
}

- (void)client_didEndActivity:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __47__HKWorkoutSession_client_didEndActivity_date___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __47__HKWorkoutSession_client_didEndActivity_date___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setCurrentActivity:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __47__HKWorkoutSession_client_didEndActivity_date___block_invoke_2;
    block[3] = &unk_1E58BB9C8;
    void block[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
}

void __47__HKWorkoutSession_client_didEndActivity_date___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) workoutConfiguration];
  [WeakRetained workoutSession:v2 didEndActivityWithConfiguration:v3 date:*(void *)(a1 + 48)];
}

- (void)client_didSuggestWorkoutConfiguration:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    char v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke_2;
    v7[3] = &unk_1E58C0930;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v3, v7);
  }
}

uint64_t __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didSuggestWorkoutConfiguration:*(void *)(a1 + 48) date:*(void *)(a1 + 56)];
}

- (void)client_didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(a1[4] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_2;
    block[3] = &unk_1E58BB9C8;
    id v5 = WeakRetained;
    uint64_t v6 = a1[4];
    id v7 = (void *)a1[5];
    id v18 = v5;
    uint64_t v19 = v6;
    id v20 = v7;
    dispatch_async(v4, block);
    (*(void (**)(void))(a1[6] + 16))();

    id v8 = v18;
  }
  else
  {
    _HKInitializeLogging();
    id v9 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_cold_1(v2, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = a1[6];
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Remote session delegate is not set up.");
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v8);
  }
}

uint64_t __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didReceiveDataFromRemoteWorkoutSession:*(void *)(a1 + 48)];
}

- (void)client_remoteSessionDidRecover
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __50__HKWorkoutSession_client_remoteSessionDidRecover__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __50__HKWorkoutSession_client_remoteSessionDidRecover__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 112))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to send data to remote session.");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_pendingDataUpdateDidCompleteWithSuccess:error:", 0, v2);
  }
}

- (void)client_didDisconnectFromRemoteWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke(void *a1)
{
  id v2 = (id *)(a1 + 4);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_storeStrong((id *)*v2 + 9, v2[1]);
  char v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_cold_1((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = a1[6];
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 125, @"Workout session doesn't have a delegate.");
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  if ([*v2 type] == 1)
  {
    [*((id *)*v2 + 8) invalidate];
    uint64_t v14 = (void *)*((void *)*v2 + 8);
    *((void *)*v2 + 8) = 0;
  }
  if (v4)
  {
    uint64_t v15 = *(NSObject **)(a1[4] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_241;
    block[3] = &unk_1E58BB9C8;
    id v16 = WeakRetained;
    uint64_t v17 = a1[4];
    id v18 = (void *)a1[5];
    id v20 = v16;
    uint64_t v21 = v17;
    id v22 = v18;
    dispatch_async(v15, block);
  }
}

uint64_t __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_241(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didDisconnectFromRemoteDeviceWithError:*(void *)(a1 + 48)];
}

- (void)_queue_enqueueStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKWorkoutSession *)self type])
  {
    proxyProvider = self->_proxyProvider;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke;
    v14[3] = &unk_1E58C4F70;
    int64_t v17 = a3;
    id v15 = v8;
    id v16 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke_2;
    v11[3] = &unk_1E58BED18;
    v11[4] = self;
    id v12 = v16;
    int64_t v13 = a3;
    [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v11];
  }
  else
  {
    [(HKStateMachine *)self->_targetStateMachine enqueueEvent:a3 date:v8 error:0 completion:v9];
  }
}

uint64_t __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke(void *a1, void *a2)
{
  objc_msgSend(a2, "remote_syncSessionEvent:date:", a1[6], a1[4]);
  char v3 = *(uint64_t (**)(void))(a1[5] + 16);

  return v3();
}

void __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isInvalidatedMirroredSession])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) _notMirroringError];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_error_impl(&dword_19C023000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to sync state event %li with error: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to sync state transition to the primary session.");
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

- (void)stateMachine:(id)a3 didIgnoreEvent:(int64_t)a4 state:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  _HKInitializeLogging();
  uint64_t v9 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    int v11 = HKWorkoutSessionEventToString(a4);
    *(_DWORD *)buf = 138543874;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Invalid event %{public}@ from current state %{public}@", buf, 0x20u);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = HKWorkoutSessionEventToString(a4);
  __int16 v15 = [v8 label];
  id v16 = objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v13, a2, @"Unable to perform '%@' from current state '%@'"", v14, v15);
  [(HKWorkoutSession *)self client_didFailWithError:v16];
}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  _HKInitializeLogging();
  id v20 = HKLogWorkouts;
  BOOL v21 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (!v21) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v15;
    id v22 = "%{public}@: (#w2) %{public}@";
  }
  else
  {
    if (!v21) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v17;
    id v22 = "%{public}@: (#w2) Entered at %{public}@";
  }
  _os_log_impl(&dword_19C023000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_7:
  if ([v17 index] != 1)
  {
    proxyProvider = self->_proxyProvider;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke;
    v26[3] = &unk_1E58C4F98;
    id v27 = v17;
    id v28 = v18;
    id v29 = self;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_251;
    v24[3] = &unk_1E58C4FC0;
    v24[4] = self;
    id v25 = v27;
    [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v26 errorHandler:v24];
  }
}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) index];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2;
  v7[3] = &unk_1E58BBC70;
  void v7[4] = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "remote_setTargetState:date:completion:", v4, v6, v7);
  if (!v5) {
}
  }

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1();
    }
    if (objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 4)) {
      objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
    }
  }
}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_251(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1();
  }
  if (objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 4)) {
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v3);
  }
}

- (void)prepare
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __27__HKWorkoutSession_prepare__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKWorkoutSession *)self prepareWithCompletion:v2];
}

void __27__HKWorkoutSession_prepare__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Prepared", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __27__HKWorkoutSession_prepare__block_invoke_cold_1();
  }
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HKWorkoutSession_prepareWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __42__HKWorkoutSession_prepareWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 1, v3, *(void *)(a1 + 40));
}

- (void)startActivityWithDate:(NSDate *)date
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__HKWorkoutSession_startActivityWithDate___block_invoke;
  v3[3] = &unk_1E58BBE28;
  v3[4] = self;
  [(HKWorkoutSession *)self startActivityWithDate:date completion:v3];
}

void __42__HKWorkoutSession_startActivityWithDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Started", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __42__HKWorkoutSession_startActivityWithDate___block_invoke_cold_1();
  }
}

- (void)startActivityWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __53__HKWorkoutSession_startActivityWithDate_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __53__HKWorkoutSession_startActivityWithDate_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (a1[5])
  {
    id v3 = (void *)a1[4];
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 2);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 2, v4, a1[6]);
  }
}

- (void)stopActivityWithDate:(NSDate *)date
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__HKWorkoutSession_stopActivityWithDate___block_invoke;
  v3[3] = &unk_1E58BBE28;
  v3[4] = self;
  [(HKWorkoutSession *)self stopActivityWithDate:date completion:v3];
}

void __41__HKWorkoutSession_stopActivityWithDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __41__HKWorkoutSession_stopActivityWithDate___block_invoke_cold_1();
  }
}

- (void)stopActivityWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __52__HKWorkoutSession_stopActivityWithDate_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __52__HKWorkoutSession_stopActivityWithDate_completion___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (a1[5])
  {
    id v3 = (void *)a1[4];
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 5);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 5, v4, a1[6]);
  }
}

- (void)end
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __23__HKWorkoutSession_end__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKWorkoutSession *)self endWithCompletion:v2];
}

void __23__HKWorkoutSession_end__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __23__HKWorkoutSession_end__block_invoke_cold_1();
  }
}

- (void)endWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HKWorkoutSession_endWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __38__HKWorkoutSession_endWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 6, v3, *(void *)(a1 + 40));
}

- (void)pause
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __25__HKWorkoutSession_pause__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKWorkoutSession *)self pauseWithCompletion:v2];
}

void __25__HKWorkoutSession_pause__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Paused", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __25__HKWorkoutSession_pause__block_invoke_cold_1();
  }
}

- (void)pauseWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(HKWorkoutSession *)self pauseWithDate:v6 completion:v5];
}

- (void)pauseWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKHealthStore *)self->_healthStore _actionCompletionOnClientQueue:a4];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __45__HKWorkoutSession_pauseWithDate_completion___block_invoke;
  block[3] = &unk_1E58BD808;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __45__HKWorkoutSession_pauseWithDate_completion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession"))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) _notMirroringError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v6);
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 3, v4, v5);
  }
}

- (void)resume
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__HKWorkoutSession_resume__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKWorkoutSession *)self resumeWithCompletion:v2];
}

void __26__HKWorkoutSession_resume__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Resumed", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __26__HKWorkoutSession_resume__block_invoke_cold_1();
  }
}

- (void)resumeWithCompletion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(HKWorkoutSession *)self resumeWithDate:v6 completion:v5];
}

- (void)resumeWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKHealthStore *)self->_healthStore _actionCompletionOnClientQueue:a4];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __46__HKWorkoutSession_resumeWithDate_completion___block_invoke;
  block[3] = &unk_1E58BD808;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __46__HKWorkoutSession_resumeWithDate_completion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession"))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) _notMirroringError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v6);
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 4, v4, v5);
  }
}

- (NSUUID)identifier
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionUUID];
}

- (HKWorkoutSessionType)type
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration sessionType];
}

- (HKWorkoutActivityType)activityType
{
  uint64_t v2 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
  HKWorkoutActivityType v3 = [v2 activityType];

  return v3;
}

- (HKWorkoutSessionLocationType)locationType
{
  uint64_t v2 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
  HKWorkoutSessionLocationType v3 = [v2 locationType];

  return v3;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  id v5 = delegate;
  objc_storeWeak((id *)&self->_delegate, v5);
  if ((HKProgramSDKAtLeast() & 1) == 0) {
    objc_storeStrong((id *)&self->_strongDelegate, delegate);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([(HKWorkoutSession *)self _isInvalidatedMirroredSession]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    clientQueue = self->_clientQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__HKWorkoutSession_setDelegate___block_invoke;
    v8[3] = &unk_1E58BBBD0;
    id v9 = WeakRetained;
    id v10 = self;
    dispatch_async(clientQueue, v8);
  }
}

uint64_t __32__HKWorkoutSession_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didDisconnectFromRemoteDeviceWithError:*(void *)(*(void *)(a1 + 40) + 72)];
}

- (HKWorkoutSessionState)state
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 3;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__HKWorkoutSession_state__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  HKWorkoutSessionState v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__HKWorkoutSession_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (NSDate)startDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__34;
  id v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HKWorkoutSession_startDate__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __29__HKWorkoutSession_startDate__block_invoke(uint64_t a1)
{
}

- (NSDate)endDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__34;
  id v10 = __Block_byref_object_dispose__34;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__HKWorkoutSession_endDate__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__HKWorkoutSession_endDate__block_invoke(uint64_t a1)
{
}

- (BOOL)isGymKitSession
{
  uint64_t v2 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
  id v3 = [v2 fitnessMachineSessionUUID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldStopPreviousSession
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration shouldStopPreviousSession];
}

- (void)setShouldStopPreviousSession:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__HKWorkoutSession_setShouldStopPreviousSession___block_invoke;
  v4[3] = &unk_1E58BDA20;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __49__HKWorkoutSession_setShouldStopPreviousSession___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setShouldStopPreviousSession:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 56);
  id v3 = *(void **)(v2 + 64);

  return [v3 setTaskConfiguration:v4];
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration supportsAppRelaunchForRecovery];
}

- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__HKWorkoutSession_setSupportsAppRelaunchForRecovery___block_invoke;
  v4[3] = &unk_1E58BDA20;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __54__HKWorkoutSession_setSupportsAppRelaunchForRecovery___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setSupportsAppRelaunchForRecovery:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 56);
  id v3 = *(void **)(v2 + 64);

  return [v3 setTaskConfiguration:v4];
}

- (HKWorkoutActivity)currentActivity
{
  id v3 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration currentActivity];

  if (v3)
  {
    uint64_t v4 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration currentActivity];
    uint64_t v5 = [v4 copy];
  }
  else
  {
    uint64_t v6 = [HKWorkoutActivity alloc];
    uint64_t v4 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
    uint64_t v5 = [(HKWorkoutActivity *)v6 initWithWorkoutConfiguration:v4 startDate:self->_startDate endDate:0 metadata:0];
  }
  uint64_t v7 = (void *)v5;

  return (HKWorkoutActivity *)v7;
}

- (HKLiveWorkoutBuilder)associatedWorkoutBuilder
{
  id v3 = +[HKDevice localDevice];
  uint64_t v4 = [(HKWorkoutSession *)self associatedWorkoutBuilderWithDevice:v3 goalType:0 goal:0];

  return (HKLiveWorkoutBuilder *)v4;
}

- (id)associatedWorkoutBuilderWithDevice:(id)a3 goalType:(unint64_t)a4 goal:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  associatedWorkoutBuilder = self->_associatedWorkoutBuilder;
  if (associatedWorkoutBuilder) {
    goto LABEL_4;
  }
  if (self->_healthStore)
  {
    id v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
    [(HKWorkoutBuilderConfiguration *)v11 setDevice:v8];
    [(HKWorkoutBuilderConfiguration *)v11 setGoal:v9];
    [(HKWorkoutBuilderConfiguration *)v11 setGoalType:a4];
    id v12 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
    [(HKWorkoutBuilderConfiguration *)v11 setWorkoutConfiguration:v12];

    [(HKWorkoutBuilderConfiguration *)v11 setShouldCollectWorkoutEvents:1];
    id v13 = [HKLiveWorkoutBuilder alloc];
    healthStore = self->_healthStore;
    id v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [(HKLiveWorkoutBuilder *)v13 initWithHealthStore:healthStore session:self builderConfiguration:v11 builderIdentifier:v15];
    id v17 = self->_associatedWorkoutBuilder;
    self->_associatedWorkoutBuilder = v16;

    [(HKWorkoutSession *)self _setupTaskServerWithCompletion:&__block_literal_global_260];
    associatedWorkoutBuilder = self->_associatedWorkoutBuilder;
LABEL_4:
    id v18 = associatedWorkoutBuilder;
    goto LABEL_5;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"An associated workout builder can only be created for HKWorkoutSession objects created via initWithHealthStore:configuration:error"];
  id v18 = 0;
LABEL_5:

  return v18;
}

- (void)_setAssociatedWorkoutBuilder:(id)a3
{
}

- (NSArray)activityConfigurations
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_configuration activityConfigurations];
}

- (void)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke;
  v8[3] = &unk_1E58C4FE8;
  id v9 = v4;
  id v10 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_264;
  v7[3] = &unk_1E58BBCC0;
  void v7[4] = self;
  id v6 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v7];
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke(int8x16_t *a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2;
  v3[3] = &unk_1E58BBC70;
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "remote_enableAutomaticDetectionForActivityConfigurations:completion:", (id)v2.i64[0], v3);
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Automatic detection for activities enabled", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_261;
    v10[3] = &unk_1E58BBBD0;
    v10[4] = v8;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v9, v10);
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1();
  }
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_261(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setActivityConfigurations:*(void *)(a1 + 40)];
  int8x16_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_263;
    block[3] = &unk_1E58BB9C8;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    dispatch_async(v3, block);
  }
}

uint64_t __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_263(uint64_t a1)
{
  return [*(id *)(a1 + 32) workoutSession:*(void *)(a1 + 40) didEnableAutomaticDetectionForActivityConfigurations:*(void *)(a1 + 48)];
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_264(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1();
  }
}

- (void)beginNewActivityWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration date:(NSDate *)date metadata:(NSDictionary *)metadata
{
  id v8 = workoutConfiguration;
  uint64_t v9 = date;
  id v10 = metadata;
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke;
  v16[3] = &unk_1E58C5010;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_265;
  v15[3] = &unk_1E58BBCC0;
  v15[4] = self;
  id v12 = v10;
  uint64_t v13 = v9;
  uint64_t v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v16 errorHandler:v15];
}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke(void *a1, void *a2)
{
  uint64_t v4 = a1[4];
  id v3 = (void *)a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2;
  v6[3] = &unk_1E58BBC70;
  uint64_t v5 = a1[6];
  v6[4] = a1[7];
  id v7 = v3;
  objc_msgSend(a2, "remote_beginNewActivityWithConfiguration:date:metadata:completion:", v4, v7, v5, v6);
}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) New activity began with date: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1();
  }
}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_265(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1();
  }
}

- (void)endCurrentActivityOnDate:(NSDate *)date
{
  uint64_t v4 = date;
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke;
  v8[3] = &unk_1E58C4FE8;
  int v9 = v4;
  uint64_t v10 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_266;
  v7[3] = &unk_1E58BBCC0;
  void v7[4] = self;
  id v6 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v7];
}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke(int8x16_t *a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2;
  v3[3] = &unk_1E58BBC70;
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "remote_endCurrentActivityOnDate:completion:", (id)v2.i64[0], v3);
}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Current activity ended with date: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1();
  }
}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_266(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1();
  }
}

- (void)startMirroringToCompanionDeviceWithCompletion:(void *)completion
{
  id v5 = completion;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKWorkoutSession.m", 1092, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke;
  v12[3] = &unk_1E58C4F20;
  v12[4] = self;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_277;
  v10[3] = &unk_1E58BBC48;
  v10[4] = self;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58BBA50;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "remote_startMirroringToCompanionDeviceWithCompletion:", v4);
}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Started mirroring to remote session", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_277(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopMirroringToCompanionDeviceWithCompletion:(void *)completion
{
  id v5 = completion;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKWorkoutSession.m", 1112, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v5];

  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
  v12[3] = &unk_1E58C4F20;
  v12[4] = self;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_278;
  v10[3] = &unk_1E58BBC48;
  v10[4] = self;
  id v11 = v13;
  id v8 = v13;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v12 errorHandler:v10];
}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58BBA50;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "remote_stopMirroringToCompanionDeviceWithCompletion:", v4);
}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Stopped mirroring to remote session", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_278(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendDataToRemoteWorkoutSession:(NSData *)data completion:(void *)completion
{
  uint64_t v12 = data;
  uint64_t v7 = completion;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKWorkoutSession.m", 1140, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"HKWorkoutSession.m", 1141, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  if ([(HKWorkoutSession *)self _isInvalidatedMirroredSession])
  {
    int v8 = [(HKHealthStore *)self->_healthStore _actionCompletionOnClientQueue:v7];

    uint64_t v9 = [(HKWorkoutSession *)self _notMirroringError];
    ((void (**)(void, void, HKWorkoutMirroringDataUpdate *))v8)[2](v8, 0, v9);
  }
  else
  {
    int v8 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v7];

    uint64_t v9 = [[HKWorkoutMirroringDataUpdate alloc] initWithData:v12 completion:v8];
    [(HKWorkoutSession *)self _enqueueDataUpdate:v9];
  }
}

- (void)_queue_sendPendingDataUpdateToRemoteWorkoutSession
{
  if (self->_pendingDataUpdate)
  {
    objc_initWeak(&location, self);
    proxyProvider = self->_proxyProvider;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke;
    v6[3] = &unk_1E58C5060;
    v6[4] = self;
    objc_copyWeak(&v7, &location);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_283;
    v4[3] = &unk_1E58C5088;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v6 errorHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = [*(id *)(*(void *)(a1 + 32) + 112) data];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2;
  v5[3] = &unk_1E58C5038;
  v5[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 40));
  objc_msgSend(v3, "remote_sendDataToRemoteWorkoutSession:completion:", v4, v5);

  objc_destroyWeak(&v6);
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sent data to remote session", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 112) UUID];
  [WeakRetained _dataUpdateWithUUID:v9 didCompleteWithSuccess:a2 error:v5];
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1();
  }
  if ([*(id *)(a1 + 32) _isInvalidatedMirroredSession])
  {
    id v4 = [*(id *)(a1 + 32) _notMirroringError];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 112) UUID];
  [WeakRetained _dataUpdateWithUUID:v7 didCompleteWithSuccess:0 error:v5];
}

- (void)_enqueueDataUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HKWorkoutSession__enqueueDataUpdate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __39__HKWorkoutSession__enqueueDataUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 112))
  {
    id v3 = *(void **)(v2 + 104);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 addObject:v4];
  }
  else
  {
    objc_storeStrong((id *)(v2 + 112), *(id *)(a1 + 40));
    id v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "_queue_sendPendingDataUpdateToRemoteWorkoutSession");
  }
}

- (void)_dataUpdateWithUUID:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HKWorkoutSession__dataUpdateWithUUID_didCompleteWithSuccess_error___block_invoke;
  v13[3] = &unk_1E58BD7D8;
  id v14 = v8;
  id v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __69__HKWorkoutSession__dataUpdateWithUUID_didCompleteWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 112) UUID];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    objc_msgSend(v5, "_queue_pendingDataUpdateDidCompleteWithSuccess:error:", v4, v6);
  }
}

- (void)_queue_pendingDataUpdateDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  pendingDataUpdate = self->_pendingDataUpdate;
  id v7 = a4;
  id v8 = [(HKWorkoutMirroringDataUpdate *)pendingDataUpdate completionHandler];
  ((void (**)(void, BOOL, id))v8)[2](v8, v4, v7);

  id v9 = [(NSMutableArray *)self->_dataUpdateQueue hk_dequeue];
  int v10 = self->_pendingDataUpdate;
  self->_pendingDataUpdate = v9;

  [(HKWorkoutSession *)self _queue_sendPendingDataUpdateToRemoteWorkoutSession];
}

- (void)_setupTaskServerWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke;
  v8[3] = &unk_1E58C50B0;
  id v9 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBCC0;
  void v7[4] = self;
  id v6 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v8 errorHandler:v7];
}

uint64_t __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupTaskServerWithCompletion:", *(void *)(a1 + 32));
}

void __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2_cold_1();
  }
}

- (void)_setupMirroredSessionTaskServerWithCompletion:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke;
  v9[3] = &unk_1E58C4F20;
  v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3;
  v7[3] = &unk_1E58BBC48;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58C50D8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "remote_setupMirroredSessionWithHandler:", v4);
}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v20 = v3;
  if (v3)
  {
    if ([v3 sessionState] != *(void *)(*(void *)(a1 + 32) + 32))
    {
      *(void *)(*(void *)(a1 + 32) + 32) = [v20 sessionState];
      id v4 = objc_opt_class();
      id v5 = [*(id *)(*(void *)(a1 + 32) + 56) sessionUUID];
      uint64_t v6 = [v4 targetWorkoutSessionStateMachineForSessionUUID:v5];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 96);
      *(void *)(v7 + 96) = v6;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "enterAtState:", objc_msgSend(v20, "sessionState"));
    }
    id v9 = [v20 currentActivity];
    id v10 = (void *)[v9 copy];
    [*(id *)(*(void *)(a1 + 32) + 56) setCurrentActivity:v10];

    id v11 = [v20 startDate];
    uint64_t v12 = [v11 copy];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = [v20 endDate];
    uint64_t v16 = [v15 copy];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 48);
    *(void *)(v17 + 48) = v16;

    id v19 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v19 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v19();
}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isInvalidatedMirroredSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HKWorkoutSession__isInvalidatedMirroredSession__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__HKWorkoutSession__isInvalidatedMirroredSession__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isInvalidatedMirroredSession
{
  return !self->_proxyProvider && [(HKWorkoutSession *)self type] == HKWorkoutSessionTypeMirrored;
}

- (id)_notMirroringError
{
  return (id)objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Workout session is not currently mirroring to the companion device.");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  configuration = self->_configuration;
  id v7 = a3;
  id v5 = [(HKWorkoutSessionTaskConfiguration *)configuration sessionUUID];
  [v7 encodeObject:v5 forKey:@"UUID"];

  uint64_t v6 = [(HKWorkoutSessionTaskConfiguration *)self->_configuration workoutConfiguration];
  [v7 encodeObject:v6 forKey:@"workoutConfiguration"];

  [v7 encodeInteger:self->_state forKey:@"state"];
  [v7 encodeObject:self->_startDate forKey:@"startDate"];
  [v7 encodeObject:self->_endDate forKey:@"endDate"];
}

- (HKWorkoutSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  [(HKWorkoutSessionTaskConfiguration *)v5 setSessionUUID:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workoutConfiguration"];
  [(HKWorkoutSessionTaskConfiguration *)v5 setWorkoutConfiguration:v7];

  id v22 = 0;
  uint64_t v8 = [(HKWorkoutSession *)self _initWithHealthStore:0 taskConfiguration:v5 error:&v22];
  id v9 = v22;
  if (v8)
  {
    v8->_state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v8->_endDate;
    v8->_endDate = (NSDate *)v12;
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      -[HKWorkoutSession initWithCoder:]((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  return v8;
}

- (void)startActivity
{
}

- (void)stopActivity
{
}

+ (void)_unitTest_clearAllRunningWorkouts
{
  os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  [(id)_HKRunningWorkoutSessionUUIDs removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
}

- (void)_unitTest_discardAssociatedWorkoutBuilder
{
  self->_associatedWorkoutBuilder = 0;
  MEMORY[0x1F41817F8]();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_pendingDataUpdate, 0);
  objc_storeStrong((id *)&self->_dataUpdateQueue, 0);
  objc_storeStrong((id *)&self->_targetStateMachine, 0);
  objc_storeStrong((id *)&self->_associatedWorkoutBuilder, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_disconnectionError, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_209_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to recover after connection invalidation: %{public}@");
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_211_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to reset target state connection invalidation: %{public}@");
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_213_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to restart task server after connection invalidation: %{public}@");
}

void __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to update requested target state to %{public}@: %{public}@");
}

void __27__HKWorkoutSession_prepare__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to prepare: %{public}@");
}

void __42__HKWorkoutSession_startActivityWithDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to start: %{public}@");
}

void __41__HKWorkoutSession_stopActivityWithDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to stop: %{public}@");
}

void __23__HKWorkoutSession_end__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to end: %{public}@");
}

void __25__HKWorkoutSession_pause__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to pause: %{public}@");
}

void __26__HKWorkoutSession_resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to resume: %{public}@");
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to enable automatic detection for activities: %{public}@");
}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to begin new activity: %{public}@");
}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to end current activity: %{public}@");
}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[mirroring] %{public}@: Failed to start mirroring with error: %{public}@");
}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[mirroring] %{public}@: Failed to stop mirroring with error: %{public}@");
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[mirroring] %{public}@: Failed to send data to remote session with error: %{public}@");
}

void __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to setup task server with error: %{public}@");
}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[mirroring] %{public}@: Failed to setup task server with error: %{public}@");
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end