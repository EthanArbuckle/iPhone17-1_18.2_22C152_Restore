@interface HDWorkoutSessionServer
+ (BOOL)finishAllWorkoutSessionsForClient:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)finishAllWorkoutsExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_sessionControllerClassFromWorkoutConfiguration:(void *)a3 clientApplicationIdentifier:(void *)a4 profile:;
+ (id)recoveredSessionServerWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5;
+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 error:(id *)a4;
+ (id)workoutConfigurationForRecoveryWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5;
+ (void)_finishSessionControllerForSessionEntity:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:;
+ (void)unitTest_setDefaultStopEventGenerationWaitInterval:(double)a3;
- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3;
- (BOOL)_queue_resendWorkoutEventsToDataDestination:(uint64_t)a3 error:;
- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)canBePaused;
- (BOOL)clientDidSetupSession;
- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3 error:(id *)a4;
- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4;
- (BOOL)endWithError:(id *)a3;
- (BOOL)isActive;
- (BOOL)isFirstParty;
- (BOOL)isGymKit;
- (BOOL)isMirroring;
- (BOOL)isPaused;
- (BOOL)pauseWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5;
- (BOOL)shouldStopPreviousSession;
- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4;
- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4;
- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5;
- (BOOL)unitTest_updateLatestActivityDate:(id)a3;
- (HDHealthStoreClient)client;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (HDWorkoutSessionRapportSyncController)syncController;
- (HDWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5;
- (HDWorkoutSessionTaskServer)taskServer;
- (HKDataFlowLink)workoutDataFlowLink;
- (HKSource)clientSource;
- (HKWorkoutActivity)currentActivity;
- (HKWorkoutConfiguration)currentActivityConfiguration;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSArray)activityConfigurations;
- (NSDate)startDate;
- (NSDate)stopDate;
- (NSString)applicationIdentifier;
- (NSString)clientProcessBundleIdentifier;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)workoutDataProcessorUUID;
- (id)currentWorkoutSnapshot;
- (id)taskServerConfigurationForRecoveryWithError:(id *)a3;
- (int64_t)numberOfHeartbeatFailures;
- (int64_t)sessionType;
- (int64_t)state;
- (uint64_t)_queue_endCurrentActivityOnDate:(void *)a3 error:;
- (void)_processTargetStoppingStateWithDate:(uint64_t)a1;
- (void)_queue_evaluateRequestedTargetStateAtDate:(uint64_t)a1;
- (void)_queue_generateConfigurationUpdate:(uint64_t)a1;
- (void)_queue_generateError:(uint64_t)a1;
- (void)_queue_generateEvent:(uint64_t)a1;
- (void)_queue_generateEventWithType:(void *)a3 date:;
- (void)_queue_setIsMirroring:(void *)a3 completion:;
- (void)_queue_setTargetState:(void *)a3 date:(void *)a4 completion:;
- (void)_queue_setupSessionController;
- (void)_queue_startInvalidationTimer;
- (void)_queue_startLatestActivityUpdateTimer;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)autoPauseWithDate:(id)a3;
- (void)autoResumeWithDate:(id)a3;
- (void)dealloc;
- (void)didBecomeCurrent;
- (void)didBeginNewActivity:(id)a3;
- (void)didDetectActivityChange:(id)a3;
- (void)didDisconnectFromRemoteWithError:(id)a3;
- (void)didEndCurrentActivity:(id)a3;
- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)didResignCurrentWithError:(id)a3;
- (void)endHeartRateRecovery;
- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)finish;
- (void)finishAggregationWithDate:(id)a3;
- (void)generateConfigurationUpdate:(id)a3;
- (void)generateError:(id)a3;
- (void)generateEvent:(id)a3;
- (void)generateMetadata:(id)a3;
- (void)invalidateTaskServer:(id)a3;
- (void)recordHeartbeatFailure;
- (void)remoteSessionDidRecover;
- (void)removeObserver:(id)a3;
- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)setAssociatedWorkoutBuilderEntity:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientDidSetupSession:(BOOL)a3;
- (void)setTaskServer:(id)a3;
- (void)setWorkoutDataAccumulator:(id)a3;
- (void)startMirroringToCompanionDeviceWithCompletion:(id)a3;
- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6;
- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8;
- (void)stateMachine:(id)a3 persistTransition:(id)a4;
- (void)stateMachine:(id)a3 willEnterState:(id)a4 date:(id)a5 error:(id)a6;
- (void)stopMirroringToCompanionDeviceWithCompletion:(id)a3;
- (void)syncCurrentActivity:(id)a3 completion:(id)a4;
- (void)syncSessionEvent:(int64_t)a3 date:(id)a4;
- (void)syncWorkoutEvents:(id)a3 completion:(id)a4;
- (void)unitTest_generateStopEvent;
- (void)unitTest_generateWorkoutConfigurationUpdate:(id)a3;
- (void)unitTest_setCMWorkoutManager:(id)a3;
- (void)unitTest_setExtendedPauseInterval:(double)a3;
- (void)unitTest_setSessionController:(id)a3;
- (void)unitTest_setStopEventGenerationWaitInterval:(double)a3;
- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
@end

@implementation HDWorkoutSessionServer

+ (id)recoveredSessionServerWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 workoutConfigurationForRecoveryWithProfile:v8 sessionUUID:v9 error:a5];
  if (v10) {
    v11 = [[HDWorkoutSessionServer alloc] initWithProfile:v8 configuration:v10 sessionUUID:v9];
  }
  else {
    v11 = 0;
  }

  return v11;
}

+ (id)workoutConfigurationForRecoveryWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[HDWorkoutSessionEntity lookupSessionWithIdentifier:v8 profile:v7 error:a5];
  if (v9)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__188;
    v23 = __Block_byref_object_dispose__188;
    id v24 = 0;
    v10 = objc_opt_class();
    v11 = [v7 database];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__HDWorkoutSessionServer_workoutConfigurationForRecoveryWithProfile_sessionUUID_error___block_invoke;
    v16[3] = &unk_1E62F9108;
    v18 = &v19;
    id v17 = v9;
    int v12 = [v10 performReadTransactionWithHealthDatabase:v11 error:a5 block:v16];

    if (v12) {
      v13 = (void *)v20[5];
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __87__HDWorkoutSessionServer_workoutConfigurationForRecoveryWithProfile_sessionUUID_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v13 = 0;
  uint64_t v6 = [v5 workoutConfigurationWithTransaction:a2 error:&v13];
  id v7 = v13;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0;
  }
  uint64_t v11 = v10;
  if (!v10)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v11;
}

+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 error:(id *)a4
{
  return +[HDWorkoutSessionEntity sessionIdentifierForRecoveryInProfile:a3 expirationInterval:a4 error:900.0];
}

+ (BOOL)finishAllWorkoutSessionsForClient:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [v8 sourceManager];
  uint64_t v11 = [v10 sourceForClient:v9 error:a5];

  int v12 = [v8 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__HDWorkoutSessionServer_finishAllWorkoutSessionsForClient_profile_error___block_invoke;
  v16[3] = &unk_1E62F4200;
  id v17 = v11;
  id v18 = v8;
  id v19 = a1;
  id v13 = v8;
  id v14 = v11;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __74__HDWorkoutSessionServer_finishAllWorkoutSessionsForClient_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = +[HDWorkoutSessionEntity sessionsForSource:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  id v7 = v6;
  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          +[HDWorkoutSessionServer _finishSessionControllerForSessionEntity:profile:transaction:error:](*(void *)(a1 + 48), v13, *(void **)(a1 + 40), v5, a3);
          if (!objc_msgSend(v13, "finishWithTransaction:error:", v5, a3, (void)v16))
          {
            uint64_t v14 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (void)_finishSessionControllerForSessionEntity:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  int v12 = [v8 sessionIdentifierWithTransaction:v10 error:a5];
  if (v12)
  {
    id v13 = [v8 workoutConfigurationWithTransaction:v10 error:a5];
    uint64_t v14 = [v9 workoutManager];
    v15 = (void *)[v14 newBiomeInterface];

    [v15 stopSessionWithIdentifier:v12 recoveredWorkoutConfiguration:v13];
    if (v13)
    {
      long long v16 = [v8 clientApplicationIdentifier:v10 error:a5];
      if (v16)
      {
        id v17 = +[HDWorkoutSessionServer _sessionControllerClassFromWorkoutConfiguration:clientApplicationIdentifier:profile:](v11, v13, v16, v9);
        long long v18 = [v17 recoveryIdentifier];
        if (v18)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __93__HDWorkoutSessionServer__finishSessionControllerForSessionEntity_profile_transaction_error___block_invoke;
          v19[3] = &unk_1E630C130;
          id v21 = v17;
          id v20 = v9;
          +[HDWorkoutSessionControllerEntity retrieveArchivedStateFromRecoveryIdentifier:v18 workoutSession:v8 transaction:v10 error:a5 block:v19];
        }
      }
    }
  }
}

+ (id)_sessionControllerClassFromWorkoutConfiguration:(void *)a3 clientApplicationIdentifier:(void *)a4 profile:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = [v8 daemon];
  id v10 = [v9 pluginManager];
  uint64_t v11 = [v10 pluginsConformingToProtocol:&unk_1F18A8948];
  int v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    uint64_t v26 = *(void *)v33;
    id v27 = v8;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v18 = objc_msgSend(v17, "workoutSessionControllerClassesForProfile:", v8, v26);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              if ([v23 supportsWorkoutConfiguration:v6 clientApplicationIdentifier:v7])
              {
                id v24 = v23;

                id v8 = v27;
                goto LABEL_18;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        uint64_t v15 = v26;
        id v8 = v27;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  [v7 isEqualToString:@"com.apple.SessionTrackerApp"];
  objc_opt_class();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v24;
}

void __93__HDWorkoutSessionServer__finishSessionControllerForSessionEntity_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 40) willFinishSessionWithRecoveryData:v6 profile:*(void *)(a1 + 32)];
  }
}

+ (BOOL)finishAllWorkoutsExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__HDWorkoutSessionServer_finishAllWorkoutsExcludingSessions_profile_error___block_invoke;
  v14[3] = &unk_1E62F4200;
  id v15 = v8;
  id v16 = v9;
  id v17 = a1;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a5 block:v14];

  return (char)a5;
}

uint64_t __75__HDWorkoutSessionServer_finishAllWorkoutsExcludingSessions_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = +[HDWorkoutSessionEntity sessionsExcludingIdentifiers:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) error:a3];
  id v7 = v6;
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          +[HDWorkoutSessionServer _finishSessionControllerForSessionEntity:profile:transaction:error:](*(void *)(a1 + 48), v13, *(void **)(a1 + 40), v5, a3);
          if (!objc_msgSend(v13, "finishWithTransaction:error:", v5, a3, (void)v19))
          {

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    uint64_t v14 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v16;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "Finished %ld unrecovered sessions.", buf, 0xCu);
    }
    uint64_t v17 = 1;
  }
  else
  {
LABEL_14:
    uint64_t v17 = 0;
  }

  return v17;
}

- (HDWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5
{
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v181 = a4;
  id v184 = a5;
  v190.receiver = self;
  v190.super_class = (Class)HDWorkoutSessionServer;
  id v8 = [(HDWorkoutSessionServer *)&v190 init];
  uint64_t v9 = v8;
  if (v8)
  {
    location = (id *)&v8->_profile;
    objc_storeWeak((id *)&v8->_profile, obj);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v13 = [v12 initWithName:@"sessionserver-observers" loggingCategory:*MEMORY[0x1E4F29FB8]];
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v13;

    p_workoutConfiguration = (id *)&v9->_workoutConfiguration;
    objc_storeStrong((id *)&v9->_workoutConfiguration, a4);
    objc_storeStrong((id *)&v9->_identifier, a5);
    firstActivityConfiguration = v9->_firstActivityConfiguration;
    v9->_firstActivityConfiguration = 0;

    v9->_numberOfHeartbeatFailures = 0;
    double v16 = *(double *)&_defaultUnitTestStopEventWaitInterval;
    if (!_HDIsUnitTesting) {
      double v16 = 20.0;
    }
    v9->_stopEventGenerationWaitInterval = v16;
    v9->_extendedPauseTimeout = 900.0;
    if ([(HDWorkoutSessionServer *)v9 sessionType] != 1)
    {
      id v174 = v184;
      uint64_t v17 = self;
      id v18 = objc_alloc(MEMORY[0x1E4F2B588]);
      long long v19 = [MEMORY[0x1E4F2B588] nameForOwner:v17 UUID:v174 tag:0];

      long long v20 = (void *)[v18 initWithName:v19];
      v183 = [v20 addStateWithIndex:1 label:@"NotStarted"];
      v187 = [v20 addStateWithIndex:2 label:@"CheckingAllowedPrepare"];
      long long v21 = [v20 addStateWithIndex:3 label:@"CheckingAllowedStart"];
      long long v22 = [v20 addStateWithIndex:4 label:@"Preparing"];
      v23 = [v20 addStateWithIndex:5 label:@"Starting"];
      v185 = [v20 addStateWithIndex:6 label:@"Prepared"];
      uint64_t v24 = [v20 addStateWithIndex:7 label:@"Running"];
      v25 = [v20 addStateWithIndex:8 label:@"Paused"];
      uint64_t v26 = [v20 addStateWithIndex:9 label:@"AutoPaused"];
      v182 = [v20 addStateWithIndex:17 label:@"ExtendedPause"];
      id v27 = [v20 addStateWithIndex:10 label:@"AwaitingStopEvent"];
      v173 = [v20 addStateWithIndex:11 label:@"AwaitingFinalData"];
      v175 = [v20 addStateWithIndex:12 label:@"FinalizeActivity"];
      v176 = [v20 addStateWithIndex:13 label:@"Stopped"];
      v179 = [v20 addStateWithIndex:14 label:@"StoppedHeartRateRecovery"];
      v178 = [v20 addStateWithIndex:15 label:@"HeartRateRecovery"];
      long long v28 = [v20 addStateWithIndex:16 label:@"Finished"];
      id v29 = (id)[v20 addStateTransitionFrom:v187 to:v22 event:100 label:@"allow-session"];
      id v30 = (id)[v20 addStateTransitionFrom:v21 to:v23 event:100 label:@"allow-session"];
      id v31 = (id)[v20 addStateTransitionFrom:v22 to:v185 event:101 label:@"become-current"];
      id v32 = (id)[v20 addStateTransitionFrom:v23 to:v24 event:101 label:@"become-current"];
      id v33 = (id)[v20 addStateTransitionFrom:v24 to:v26 event:103 label:@"auto-pause"];
      id v34 = (id)[v20 addStateTransitionFrom:v26 to:v24 event:104 label:@"auto-resume"];
      id v35 = (id)[v20 addStateTransitionFrom:v27 to:v173 event:105 label:@"receive-stop-event"];
      id v36 = (id)[v20 addStateTransitionFrom:v173 to:v175 event:106 label:@"retrieved-final-data"];
      id v37 = (id)[v20 addStateTransitionFrom:v179 to:v176 event:107 label:@"end-heart-recovery"];
      id v38 = (id)[v20 addStateTransitionFrom:v178 to:v28 event:107 label:@"end-heart-recovery"];
      id v39 = (id)[v20 addStateTransitionFrom:v187 to:v28 event:102 label:@"resign-current"];
      id v40 = (id)[v20 addStateTransitionFrom:v21 to:v28 event:102 label:@"resign-current"];
      id v41 = (id)[v20 addStateTransitionFrom:v22 to:v28 event:102 label:@"resign-current"];
      id v42 = (id)[v20 addStateTransitionFrom:v23 to:v28 event:102 label:@"resign-current"];
      id v43 = (id)[v20 addStateTransitionFrom:v185 to:v28 event:102 label:@"resign-current"];
      id v44 = (id)[v20 addStateTransitionFrom:v24 to:v27 event:102 label:@"resign-current"];
      id v45 = (id)[v20 addStateTransitionFrom:v26 to:v27 event:102 label:@"resign-current"];
      id v46 = (id)[v20 addStateTransitionFrom:v25 to:v28 event:102 label:@"resign-current"];
      id v47 = (id)[v20 addStateTransitionFrom:v182 to:v28 event:102 label:@"resign-current"];
      id v48 = (id)[v20 addStateTransitionFrom:v176 to:v28 event:102 label:@"resign-current"];
      id v49 = (id)[v20 addStateTransitionFrom:v179 to:v28 event:102 label:@"resign-current"];
      id v50 = (id)[v20 addStateTransitionFrom:v178 to:v28 event:102 label:@"resign-current"];
      id v51 = (id)[v20 addStateTransitionFrom:v183 to:v187 event:5 label:@"target-prepared"];
      id v52 = (id)[v20 addStateTransitionFrom:v183 to:v21 event:2 label:@"target-running"];
      id v53 = (id)[v20 addStateTransitionFrom:v183 to:v21 event:4 label:@"target-paused"];
      id v54 = (id)[v20 addStateTransitionFrom:v183 to:v21 event:6 label:@"target-stopped"];
      id v55 = (id)[v20 addStateTransitionFrom:v183 to:v28 event:3 label:@"target-ended"];
      id v56 = (id)[v20 addStateTransitionFrom:v187 to:v21 event:2 label:@"target-running"];
      id v57 = (id)[v20 addStateTransitionFrom:v187 to:v21 event:4 label:@"target-paused"];
      id v58 = (id)[v20 addStateTransitionFrom:v187 to:v21 event:6 label:@"target-stopped"];
      id v59 = (id)[v20 addStateTransitionFrom:v187 to:v28 event:3 label:@"target-ended"];
      id v60 = (id)[v20 addStateTransitionFrom:v21 to:v23 event:4 label:@"target-paused"];
      id v61 = (id)[v20 addStateTransitionFrom:v21 to:v23 event:6 label:@"target-stopped"];
      id v62 = (id)[v20 addStateTransitionFrom:v21 to:v28 event:3 label:@"target-ended"];
      id v63 = (id)[v20 addStateTransitionFrom:v22 to:v23 event:2 label:@"target-running"];
      id v64 = (id)[v20 addStateTransitionFrom:v22 to:v23 event:4 label:@"target-paused"];
      id v65 = (id)[v20 addStateTransitionFrom:v22 to:v23 event:6 label:@"target-stopped"];
      id v66 = (id)[v20 addStateTransitionFrom:v22 to:v28 event:3 label:@"target-ended"];
      id v67 = (id)[v20 addStateTransitionFrom:v185 to:v24 event:2 label:@"target-running"];
      id v68 = (id)[v20 addStateTransitionFrom:v185 to:v24 event:4 label:@"target-paused"];
      id v69 = (id)[v20 addStateTransitionFrom:v185 to:v24 event:6 label:@"target-stopped"];
      id v70 = (id)[v20 addStateTransitionFrom:v185 to:v28 event:3 label:@"target-ended"];
      id v71 = (id)[v20 addStateTransitionFrom:v23 to:v28 event:3 label:@"target-ended"];
      id v72 = (id)[v20 addStateTransitionFrom:v24 to:v25 event:4 label:@"target-paused"];
      id v73 = (id)[v20 addStateTransitionFrom:v26 to:v25 event:4 label:@"target-paused"];
      id v74 = (id)[v20 addStateTransitionFrom:v25 to:v182 event:108 label:@"target-extended-paused"];
      id v75 = (id)[v20 addStateTransitionFrom:v25 to:v24 event:2 label:@"target-running"];
      id v76 = (id)[v20 addStateTransitionFrom:v182 to:v24 event:2 label:@"target-running"];
      id v77 = (id)[v20 addStateTransitionFrom:v24 to:v27 event:6 label:@"target-stopped"];
      id v78 = (id)[v20 addStateTransitionFrom:v25 to:v27 event:6 label:@"target-stopped"];
      id v79 = (id)[v20 addStateTransitionFrom:v26 to:v27 event:6 label:@"target-stopped"];
      id v80 = (id)[v20 addStateTransitionFrom:v182 to:v27 event:6 label:@"target-stopped"];
      id v81 = (id)[v20 addStateTransitionFrom:v24 to:v27 event:3 label:@"target-ended"];
      id v82 = (id)[v20 addStateTransitionFrom:v25 to:v27 event:3 label:@"target-ended"];
      id v83 = (id)[v20 addStateTransitionFrom:v26 to:v27 event:3 label:@"target-ended"];
      id v84 = (id)[v20 addStateTransitionFrom:v182 to:v27 event:3 label:@"target-ended"];
      id v85 = (id)[v20 addStateTransitionFrom:v176 to:v28 event:3 label:@"target-ended"];
      id v86 = (id)[v20 addStateTransitionFrom:v179 to:v178 event:3 label:@"target-ended"];
      id v87 = (id)[v20 addStateTransitionFrom:v175 to:v179 event:6 label:@"target-stop"];
      id v88 = (id)[v20 addStateTransitionFrom:v175 to:v178 event:3 label:@"target-end"];

      stateMachine = v9->_stateMachine;
      v9->_stateMachine = (HKStateMachine *)v20;

      [(HKStateMachine *)v9->_stateMachine setDelegate:v9];
      id v90 = v174;
      uint64_t v91 = self;
      id v92 = objc_alloc(MEMORY[0x1E4F2B588]);
      v93 = [MEMORY[0x1E4F2B588] nameForOwner:v91 UUID:v90 tag:@"target"];

      v94 = (void *)[v92 initWithName:v93];
      v95 = [v94 addStateWithIndex:1 label:@"NotStarted"];
      v96 = [v94 addStateWithIndex:2 label:@"Running"];
      v97 = [v94 addStateWithIndex:3 label:@"Ended"];
      v98 = [v94 addStateWithIndex:4 label:@"Paused"];
      v99 = [v94 addStateWithIndex:5 label:@"Prepared"];
      v100 = [v94 addStateWithIndex:6 label:@"Stopped"];
      id v101 = (id)[v94 addStateTransitionFrom:v95 to:v96 event:2 label:@"running"];
      id v102 = (id)[v94 addStateTransitionFrom:v95 to:v98 event:4 label:@"paused"];
      id v103 = (id)[v94 addStateTransitionFrom:v95 to:v97 event:3 label:@"ended"];
      id v104 = (id)[v94 addStateTransitionFrom:v95 to:v99 event:5 label:@"prepared"];
      id v105 = (id)[v94 addStateTransitionFrom:v95 to:v100 event:6 label:@"stopped"];
      id v106 = (id)[v94 addStateTransitionFrom:v99 to:v96 event:2 label:@"running"];
      id v107 = (id)[v94 addStateTransitionFrom:v99 to:v98 event:4 label:@"paused"];
      id v108 = (id)[v94 addStateTransitionFrom:v99 to:v97 event:3 label:@"ended"];
      id v109 = (id)[v94 addStateTransitionFrom:v99 to:v100 event:6 label:@"stopped"];
      id v110 = (id)[v94 addStateTransitionFrom:v96 to:v98 event:4 label:@"paused"];
      id v111 = (id)[v94 addStateTransitionFrom:v96 to:v97 event:3 label:@"ended"];
      id v112 = (id)[v94 addStateTransitionFrom:v96 to:v100 event:6 label:@"stopped"];
      id v113 = (id)[v94 addStateTransitionFrom:v96 to:v96 event:2 label:@"running"];
      id v114 = (id)[v94 addStateTransitionFrom:v98 to:v96 event:2 label:@"running"];
      id v115 = (id)[v94 addStateTransitionFrom:v98 to:v97 event:3 label:@"ended"];
      id v116 = (id)[v94 addStateTransitionFrom:v98 to:v100 event:6 label:@"stopped"];
      id v117 = (id)[v94 addStateTransitionFrom:v98 to:v98 event:4 label:@"paused"];
      id v118 = (id)[v94 addStateTransitionFrom:v100 to:v97 event:3 label:@"ended"];
      id v119 = (id)[v94 addStateTransitionFrom:v100 to:v100 event:6 label:@"stopped"];

      targetStateMachine = v9->_targetStateMachine;
      v9->_targetStateMachine = (HKStateMachine *)v94;

      [(HKStateMachine *)v9->_targetStateMachine setDelegate:v9];
    }
    _HKInitializeLogging();
    id v121 = objc_alloc(MEMORY[0x1E4F2AEC0]);
    uint64_t v122 = [v121 initWithProcessor:v9 sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*MEMORY[0x1E4F29FB8]];
    workoutDataFlowLink = v9->_workoutDataFlowLink;
    v9->_workoutDataFlowLink = (HKDataFlowLink *)v122;

    _HKInitializeLogging();
    v124 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      v125 = v124;
      v126 = (objc_class *)objc_opt_class();
      v127 = NSStringFromClass(v126);
      id v128 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v129 = NSString;
      [(HKWorkoutConfiguration *)v9->_workoutConfiguration activityType];
      v130 = _HKWorkoutActivityNameForActivityType();
      v131 = [v129 stringWithFormat:@"activity=%@", v130];
      [v128 addObject:v131];

      v132 = NSString;
      [(HKWorkoutConfiguration *)v9->_workoutConfiguration locationType];
      v133 = _HKWorkoutSessionLocationTypeName();
      v134 = [v132 stringWithFormat:@"location=%@", v133];
      [v128 addObject:v134];

      v135 = [(HKWorkoutConfiguration *)v9->_workoutConfiguration fitnessMachineSessionUUID];
      if (v135)
      {
        v136 = [NSString stringWithFormat:@"ftm_session=%@", v135];
        [v128 addObject:v136];
      }
      if ([*p_workoutConfiguration activityType] == 46)
      {
        v137 = NSString;
        [*p_workoutConfiguration swimmingLocationType];
        v138 = _HKWorkoutSwimmingLocationTypeName();
        v139 = [v137 stringWithFormat:@"swimming_location=%@", v138];
        [v128 addObject:v139];
      }
      v140 = [*p_workoutConfiguration lapLength];
      if (v140)
      {
        v141 = [NSString stringWithFormat:@"lap_length=%@", v140];
        [v128 addObject:v141];
      }
      v142 = [*p_workoutConfiguration predictionSessionUUID];
      if (v142)
      {
        v143 = [NSString stringWithFormat:@"prediction_uuiud=%@", v142];
        [v128 addObject:v143];
      }
      v144 = [v128 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v127;
      *(_WORD *)&buf[22] = 2048;
      v205 = v9;
      LOWORD(v206) = 2114;
      *(void *)((char *)&v206 + 2) = v144;
      _os_log_impl(&dword_1BCB7D000, v125, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0, #init) %{public}@:%p { %{public}@ }", buf, 0x2Au);
    }
    if ([(HDWorkoutSessionServer *)v9 sessionType] == 1) {
      goto LABEL_34;
    }
    identifier = v9->_identifier;
    id WeakRetained = objc_loadWeakRetained(location);
    id v191 = 0;
    uint64_t v147 = +[HDWorkoutSessionEntity lookupSessionWithIdentifier:identifier profile:WeakRetained error:&v191];
    id v148 = v191;
    persistentEntity = v9->_persistentEntity;
    v9->_persistentEntity = (HDWorkoutSessionEntity *)v147;

    if (v9->_persistentEntity)
    {
      v197[0] = 0;
      v197[1] = v197;
      v197[2] = 0x3032000000;
      v197[3] = __Block_byref_object_copy__188;
      v197[4] = __Block_byref_object_dispose__188;
      id v198 = 0;
      v195[0] = 0;
      v195[1] = v195;
      v195[2] = 0x3032000000;
      v195[3] = __Block_byref_object_copy__188;
      v195[4] = __Block_byref_object_dispose__188;
      id v196 = 0;
      v193[0] = 0;
      v193[1] = v193;
      v193[2] = 0x3032000000;
      v193[3] = __Block_byref_object_copy__188;
      v193[4] = __Block_byref_object_dispose__188;
      id v194 = 0;
      v150 = objc_opt_class();
      id v151 = objc_loadWeakRetained(location);
      v152 = [v151 database];
      id v192 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke;
      v205 = (HDWorkoutSessionServer *)&unk_1E630C180;
      *(void *)&long long v206 = v9;
      *((void *)&v206 + 1) = v197;
      v207 = v195;
      v208 = v193;
      int v153 = [v150 performReadTransactionWithHealthDatabase:v152 error:&v192 block:buf];
      id v154 = v192;

      if (v153)
      {
        v155 = v9->_queue;
        *(void *)block = MEMORY[0x1E4F143A8];
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke_2;
        v200 = &unk_1E62FA0E8;
        v201 = v9;
        v202 = v197;
        v203 = v195;
        dispatch_sync(v155, block);
      }
      else
      {
        _HKInitializeLogging();
        v156 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 138543618;
          *(void *)&block[4] = v9;
          *(_WORD *)&block[12] = 2114;
          *(void *)&block[14] = v154;
          _os_log_error_impl(&dword_1BCB7D000, v156, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover persisted session state: %{public}@", block, 0x16u);
        }
      }

      _Block_object_dispose(v193, 8);
      _Block_object_dispose(v195, 8);

      _Block_object_dispose(v197, 8);
      if (v153)
      {
        id v157 = v148;
LABEL_33:

LABEL_34:
        v166 = [HDWorkoutSessionRapportSyncController alloc];
        id v167 = objc_loadWeakRetained(location);
        v168 = [v167 rapportMessenger];
        uint64_t v169 = [(HDWorkoutSessionRapportSyncController *)v166 initWithRapportMessenger:v168 sessionServer:v9];
        syncController = v9->_syncController;
        v9->_syncController = (HDWorkoutSessionRapportSyncController *)v169;

        v171 = v9->_queue;
        v188[0] = MEMORY[0x1E4F143A8];
        v188[1] = 3221225472;
        v188[2] = __68__HDWorkoutSessionServer_initWithProfile_configuration_sessionUUID___block_invoke;
        v188[3] = &unk_1E62F3208;
        v189 = v9;
        dispatch_sync(v171, v188);

        goto LABEL_35;
      }
      if (v148) {
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to recover persisted state for session %@", v9->_identifier);
      id v148 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v148)
    {
LABEL_29:
      v159 = v9->_identifier;
      workoutConfiguration = v9->_workoutConfiguration;
      id v161 = objc_loadWeakRetained(location);
      *(void *)block = v148;
      uint64_t v162 = +[HDWorkoutSessionEntity createSessionWithIdentifier:v159 source:0 configuration:workoutConfiguration state:1 profile:v161 error:block];
      id v157 = *(id *)block;

      v163 = v9->_persistentEntity;
      v9->_persistentEntity = (HDWorkoutSessionEntity *)v162;

      if (!v9->_persistentEntity)
      {
        _HKInitializeLogging();
        v164 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v157;
          _os_log_error_impl(&dword_1BCB7D000, v164, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create workout session entity: %{public}@", buf, 0x16u);
        }
      }
      v165 = v9->_queue;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __55__HDWorkoutSessionServer__loadOrCreatePersistentEntity__block_invoke;
      v205 = (HDWorkoutSessionServer *)&unk_1E62F3208;
      *(void *)&long long v206 = v9;
      dispatch_sync(v165, buf);
      goto LABEL_33;
    }
LABEL_27:
    _HKInitializeLogging();
    v158 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v148;
      _os_log_error_impl(&dword_1BCB7D000, v158, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup existing workout session entity: %{public}@", buf, 0x16u);
    }
    goto LABEL_29;
  }
LABEL_35:

  return v9;
}

void __68__HDWorkoutSessionServer_initWithProfile_configuration_sessionUUID___block_invoke(uint64_t a1)
{
}

- (void)_queue_startInvalidationTimer
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
    v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = a1;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning invalidation timer.", buf, 0xCu);
    }
    objc_initWeak(&location, (id)a1);
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F2B8E0]) initWithQueue:*(void *)(a1 + 16) completion:&__block_literal_global_692];
    id v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;

    id v6 = *(void **)(a1 + 96);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_2;
    v20[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v21, &location);
    [v6 startWithTimeoutInterval:v20 handler:300.0];
    [*(id *)(a1 + 104) invalidate];
    id v7 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    if (*(void *)(a1 + 232))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v9 = [WeakRetained daemon];
      uint64_t v10 = [v9 processStateManager];
      uint64_t v11 = [v10 processIdentifierForApplicationIdentifier:*(void *)(a1 + 232)];

      if (v11 == -1)
      {
        _HKInitializeLogging();
        uint64_t v17 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 232);
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v18;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Unable to get pid for %{public}@", buf, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        id v12 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 232);
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v13;
          _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "Taking reconnection assertion for process %{public}@", buf, 0xCu);
        }
        id v14 = objc_alloc(MEMORY[0x1E4F4E280]);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_697;
        v19[3] = &unk_1E62F8588;
        void v19[4] = a1;
        uint64_t v15 = [v14 initWithPID:v11 flags:3 reason:19 name:@"HealthKit Background Workout (Reconnect)" withHandler:v19];
        double v16 = *(void **)(a1 + 104);
        *(void *)(a1 + 104) = v15;
      }
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  [(BKSProcessAssertion *)self->_invalidationAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutSessionServer;
  [(HDWorkoutSessionServer *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HDWorkoutSessionServer *)self identifier];
  id v7 = objc_msgSend(v6, "hk_shortRepresentation");
  [(HDWorkoutSessionServer *)self state];
  id v8 = _HKWorkoutSessionServerStateToString();
  [(HDWorkoutSessionServer *)self sessionType];
  uint64_t v9 = HKWorkoutSessionTypeToString();
  uint64_t v10 = [v3 stringWithFormat:@"<%@-%@ [%@] [%@]>", v5, v7, v8, v9];

  return (NSString *)v10;
}

- (int64_t)state
{
  v2 = [(HKStateMachine *)self->_stateMachine currentState];
  int64_t v3 = [v2 index];

  return v3;
}

- (BOOL)isActive
{
  unint64_t v2 = [(HDWorkoutSessionServer *)self state];
  return (v2 < 0x12) & (0x21FF0u >> v2);
}

- (BOOL)canBePaused
{
  unint64_t v2 = [(HDWorkoutSessionServer *)self state];
  return (v2 < 0xA) & (0x2A0u >> v2);
}

- (BOOL)isGymKit
{
  unint64_t v2 = [(HKWorkoutConfiguration *)self->_workoutConfiguration fitnessMachineSessionUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPaused
{
  return [(HDWorkoutSessionServer *)self state] == 8
      || [(HDWorkoutSessionServer *)self state] == 9
      || [(HDWorkoutSessionServer *)self state] == 17;
}

- (HDHealthStoreClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  BOOL v3 = [WeakRetained client];

  return (HDHealthStoreClient *)v3;
}

- (void)setTaskServer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HDWorkoutSessionServer_setTaskServer___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __40__HDWorkoutSessionServer_setTaskServer___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 240), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    if (!v2) {
      goto LABEL_27;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 240));
    id v4 = [WeakRetained client];
    id v5 = [v4 process];

    id v6 = [v5 applicationIdentifier];
    uint64_t v7 = [v6 copy];
    id v8 = *(void **)(v2 + 232);
    *(void *)(v2 + 232) = v7;

    id v9 = objc_loadWeakRetained((id *)(v2 + 240));
    uint64_t v10 = [v9 clientSource];
    uint64_t v11 = [v10 copy];
    id v12 = *(void **)(v2 + 256);
    *(void *)(v2 + 256) = v11;

    uint64_t v13 = [v5 applicationIdentifier];
    id v14 = [v5 bundleIdentifier];
    id v15 = *(id *)(v2 + 256);
    double v16 = *(void **)(v2 + 24);
    uint64_t v17 = (os_log_t *)MEMORY[0x1E4F29FB8];
    if (v16 != v14 && (!v14 || ![v16 isEqualToString:v14])
      || (uint64_t v18 = *(void **)(v2 + 232), v18 != v13) && (!v13 || ([v18 isEqualToString:v13] & 1) == 0))
    {
      _HKInitializeLogging();
      long long v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(v2 + 232);
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v2;
        __int16 v51 = 2114;
        uint64_t v52 = v20;
        __int16 v53 = 2114;
        id v54 = v13;
        _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Client application identifier change: %{public}@ -> %{public}@", buf, 0x20u);
      }
      _HKInitializeLogging();
      id v21 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(v2 + 24);
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v2;
        __int16 v51 = 2114;
        uint64_t v52 = v22;
        __int16 v53 = 2114;
        id v54 = v14;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Client process bundle identifier change: %{public}@ -> %{public}@", buf, 0x20u);
      }
      uint64_t v23 = objc_opt_class();
      id v24 = objc_loadWeakRetained((id *)(v2 + 8));
      uint64_t v25 = [v24 database];
      id v41 = 0;
      *(void *)&long long v42 = MEMORY[0x1E4F143A8];
      *((void *)&v42 + 1) = 3221225472;
      id v43 = __55__HDWorkoutSessionServer__queue_cacheClientIdentifiers__block_invoke;
      id v44 = &unk_1E62FB0D0;
      uint64_t v45 = v2;
      id v40 = v15;
      id v46 = v15;
      id v26 = v14;
      id v47 = v26;
      id v27 = v13;
      id v48 = v27;
      LOBYTE(v23) = [(id)v23 performWriteTransactionWithHealthDatabase:v25 error:&v41 block:&v42];
      id v39 = v41;

      uint64_t v17 = (os_log_t *)MEMORY[0x1E4F29FB8];
      if ((v23 & 1) == 0)
      {
        _HKInitializeLogging();
        long long v28 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v50 = v2;
          _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client process bundle identifier and source. Client may not correctly recover after a full crash.", buf, 0xCu);
        }
      }
      uint64_t v29 = [v26 copy];
      id v30 = *(void **)(v2 + 24);
      *(void *)(v2 + 24) = v29;

      uint64_t v31 = [v27 copy];
      id v32 = *(void **)(v2 + 232);
      *(void *)(v2 + 232) = v31;

      id v15 = v40;
    }

    uint64_t v33 = *(void *)(a1 + 32);
    if (v33)
    {
      _HKInitializeLogging();
      id v34 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v42) = 138543362;
        *(void *)((char *)&v42 + 4) = v33;
        _os_log_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping invalidation timer.", (uint8_t *)&v42, 0xCu);
      }
      [*(id *)(v33 + 96) invalidate];
      [*(id *)(v33 + 104) invalidate];
      id v35 = *(void **)(v33 + 104);
      *(void *)(v33 + 104) = 0;

      uint64_t v36 = *(void *)(a1 + 32);
    }
    else
    {
LABEL_27:
      uint64_t v36 = 0;
    }
    -[HDWorkoutSessionServer _queue_setupSessionController](v36);
    id v37 = *(dispatch_queue_t **)(a1 + 32);
    -[HDWorkoutSessionServer _queue_startLatestActivityUpdateTimer](v37);
  }
  else
  {
    uint64_t v38 = *(void *)(a1 + 32);
    -[HDWorkoutSessionServer _queue_startInvalidationTimer](v38);
  }
}

- (void)_queue_setupSessionController
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (![(id)a1 sessionType])
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      long long v42 = [HDWorkoutSessionConfiguration alloc];
      id v43 = [(id)a1 identifier];
      uint64_t v39 = *(void *)(a1 + 224);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      uint64_t v38 = [WeakRetained sessionType];
      id v40 = objc_loadWeakRetained((id *)(a1 + 240));
      uint64_t v2 = [v40 client];
      uint64_t v3 = *(void *)(a1 + 24);
      uint64_t v4 = *(void *)(a1 + 232);
      id v5 = objc_loadWeakRetained((id *)(a1 + 240));
      char v6 = [v5 requiresCoreLocationAssertion];
      id v7 = objc_loadWeakRetained((id *)(a1 + 240));
      char v8 = [v7 supportsAppRelaunchForRecovery];
      id v9 = objc_loadWeakRetained((id *)(a1 + 240));
      char v10 = [v9 supports3rdPartyAOT];
      BYTE3(v37) = [(id)a1 isFirstParty];
      BYTE2(v37) = v10;
      BYTE1(v37) = v8;
      LOBYTE(v37) = v6;
      uint64_t v11 = -[HDWorkoutSessionConfiguration initWithSessionIdentifier:workoutConfiguration:sessionType:client:processBundleIdentifier:applicationIdentifier:requiresCoreLocationAssertion:supportsAppRelaunchForRecovery:supports3rdPartyAOT:enableWorkoutChangeDetection:activityConfigurations:](v42, "initWithSessionIdentifier:workoutConfiguration:sessionType:client:processBundleIdentifier:applicationIdentifier:requiresCoreLocationAssertion:supportsAppRelaunchForRecovery:supports3rdPartyAOT:enableWorkoutChangeDetection:activityConfigurations:", v43, v39, v38, v2, v3, v4, v37, *(void *)(a1 + 264));

      id v12 = *(void **)(a1 + 88);
      if (v12)
      {
        [v12 workoutSessionServer:a1 didChangeConfiguration:v11];
      }
      else
      {
        uint64_t v13 = *(void **)(a1 + 224);
        id v14 = *(void **)(a1 + 232);
        id v15 = objc_loadWeakRetained((id *)(a1 + 8));
        double v16 = (objc_class *)+[HDWorkoutSessionServer _sessionControllerClassFromWorkoutConfiguration:clientApplicationIdentifier:profile:]((uint64_t)HDWorkoutSessionServer, v13, v14, v15);

        _HKInitializeLogging();
        uint64_t v17 = (os_log_t *)MEMORY[0x1E4F29FB8];
        uint64_t v18 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = v18;
          uint64_t v20 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating session controller of class %{public}@", buf, 0x16u);
        }
        id v21 = [(objc_class *)v16 recoveryIdentifier];
        uint64_t v22 = v21;
        if (v21)
        {
          id v44 = 0;
          id v23 = v21;
          uint64_t v45 = 0;
          id v46 = &v45;
          uint64_t v47 = 0x3032000000;
          id v48 = __Block_byref_object_copy__188;
          id v49 = __Block_byref_object_dispose__188;
          id v50 = 0;
          id v24 = objc_loadWeakRetained((id *)(a1 + 8));
          uint64_t v25 = [v24 database];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke;
          uint64_t v52 = &unk_1E62F5CB0;
          id v26 = v23;
          id v53 = v26;
          uint64_t v54 = a1;
          uint64_t v55 = &v45;
          BOOL v27 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v25 error:&v44 block:buf];

          if (v27) {
            long long v28 = (void *)v46[5];
          }
          else {
            long long v28 = 0;
          }
          id v29 = v28;

          _Block_object_dispose(&v45, 8);
          id v30 = v44;
          uint64_t v31 = v30;
          if (!v29 && v30)
          {
            _HKInitializeLogging();
            id v32 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v31;
              _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve recovery state with error: %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v29 = 0;
        }
        id v33 = [v16 alloc];
        id v34 = objc_loadWeakRetained((id *)(a1 + 8));
        uint64_t v35 = [v33 initWithProfile:v34 sessionConfiguration:v11 sessionStateController:a1 recoveryState:v29];
        uint64_t v36 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = v35;

        objc_msgSend(*(id *)(a1 + 88), "workoutSessionServer:didTransitionFromState:toState:date:", a1, 1, objc_msgSend((id)a1, "state"), 0);
      }
    }
  }
}

- (void)_queue_startLatestActivityUpdateTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = a1;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting latest activity update timer.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    uint64_t v3 = a1[21];
    if (v3) {
      dispatch_source_cancel(v3);
    }
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1[2]);
    dispatch_queue_t v5 = a1[21];
    a1[21] = v4;

    char v6 = a1[21];
    dispatch_time_t v7 = dispatch_walltime(0, 180000000000);
    dispatch_source_set_timer(v6, v7, 0x29E8D60800uLL, 0x3B9ACA00uLL);
    char v8 = a1[21];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__HDWorkoutSessionServer__queue_startLatestActivityUpdateTimer__block_invoke;
    handler[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_activate(a1[21]);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __40__HDWorkoutSessionServer_setTaskServer___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (void)invalidateTaskServer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained == v3)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 240), 0);
    uint64_t v4 = *(void *)(a1 + 32);
    -[HDWorkoutSessionServer _queue_startInvalidationTimer](v4);
  }
}

void __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (void)setAssociatedWorkoutBuilderEntity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  dispatch_time_t v7 = [WeakRetained database];
  id v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HDWorkoutSessionServer_setAssociatedWorkoutBuilderEntity___block_invoke;
  v12[3] = &unk_1E62F2AE0;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  char v9 = [v5 performWriteTransactionWithHealthDatabase:v7 error:&v14 block:v12];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      double v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save associated workout builder entity: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __60__HDWorkoutSessionServer_setAssociatedWorkoutBuilderEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setAssociatedBuilder:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (void)setWorkoutDataAccumulator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) workoutSessionServer:*(void *)(a1 + 32) accumulatorDidChange:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke_2;
  v4[3] = &unk_1E630C158;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  [v3 notifyObservers:v4];
}

void __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutSession:*(void *)(a1 + 32) didUpdateDataAccumulator:*(void *)(a1 + 40)];
  }
}

- (id)currentWorkoutSnapshot
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(HDWorkoutSessionServer *)self isActive])
  {
    id v3 = [(HDWorkoutSessionServer *)self client];
    id v4 = [v3 process];

    if ([v4 isExtension]) {
      [v4 containerAppBundleIdentifier];
    }
    else {
    uint64_t v22 = [v4 applicationIdentifier];
    }
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    dispatch_time_t v7 = [(HDWorkoutSessionServer *)self workoutDataAccumulator];
    id v8 = [v7 startDate];

    char v9 = [(HDWorkoutSessionServer *)self workoutDataAccumulator];
    id v10 = [v9 currentEvents];

    id v23 = v4;
    if (v8)
    {
      _HKCalculateWorkoutDuration();
      double v12 = v11;
    }
    else
    {
      double v12 = 0.0;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = [v10 reverseObjectEnumerator];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
        uint64_t v19 = [v18 workoutEventType];
        BOOL v20 = v19 == 1;
        if (v19 == 1 || [v18 workoutEventType] == 2) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          BOOL v20 = 0;
          if (v15) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
    else
    {
      BOOL v20 = 0;
    }

    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B890]), "_initWithSessionIdentifier:workoutConfiguration:sessionServerState:isBuilderPaused:applicationIdentifier:elapsedTime:snapshotDate:builderStartDate:", self->_identifier, self->_workoutConfiguration, -[HDWorkoutSessionServer state](self, "state"), v20, v22, v6, v12, v8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)sessionType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  int64_t v3 = [WeakRetained sessionType];

  return v3;
}

- (BOOL)isFirstParty
{
  if ([(NSString *)self->_applicationIdentifier isEqualToString:@"com.apple.SessionTrackerApp"])
  {
    return 1;
  }
  client = self->_client;
  uint64_t v5 = *MEMORY[0x1E4F29930];

  return [(HDHealthStoreClient *)client hasEntitlement:v5];
}

- (BOOL)shouldStopPreviousSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  char v3 = [WeakRetained shouldStopPreviousSession];

  return v3;
}

- (HKWorkoutConfiguration)currentActivityConfiguration
{
  workoutConfiguration = [(HKWorkoutActivity *)self->_currentActivity workoutConfiguration];
  id v4 = workoutConfiguration;
  if (!workoutConfiguration) {
    workoutConfiguration = self->_workoutConfiguration;
  }
  uint64_t v5 = workoutConfiguration;

  return v5;
}

uint64_t __55__HDWorkoutSessionServer__loadOrCreatePersistentEntity__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 144) enterAtState:1];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);

  return [v2 enterAtState:1];
}

uint64_t __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1[4] + 112) requestedTargetStateWithTransaction:v5 error:a3];
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v9 = [*(id *)(a1[4] + 112) stateWithTransaction:v5 error:a3];
    uint64_t v10 = *(void *)(a1[6] + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      double v12 = [*(id *)(a1[4] + 112) isMirroringInTransaction:v5 error:a3];
      id v13 = v12;
      if (!v12)
      {
        uint64_t v22 = 0;
LABEL_73:

        goto LABEL_74;
      }
      *(unsigned char *)(a1[4] + 64) = [v12 BOOLValue];
      uint64_t v14 = [*(id *)(a1[4] + 112) hasFailedInTransaction:v5 error:a3];
      uint64_t v15 = v14;
      if (!v14)
      {
        uint64_t v22 = 0;
LABEL_72:

        goto LABEL_73;
      }
      *(unsigned char *)(a1[4] + 152) = [v14 BOOLValue];
      uint64_t v16 = *(void **)(a1[4] + 112);
      id v98 = 0;
      uint64_t v17 = [v16 requestedStartDateInTransaction:v5 error:&v98];
      id v18 = v98;
      uint64_t v19 = a1[4];
      BOOL v20 = *(void **)(v19 + 184);
      *(void *)(v19 + 184) = v17;

      uint64_t v21 = a1[4];
      if (!*(void *)(v21 + 184) && v18)
      {
        if (a3)
        {
          uint64_t v22 = 0;
          *a3 = v18;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v22 = 0;
        }
        goto LABEL_71;
      }
      id v23 = *(void **)(v21 + 112);
      id v97 = 0;
      uint64_t v24 = [v23 startDateInTransaction:v5 error:&v97];
      id v25 = v97;
      uint64_t v26 = a1[4];
      long long v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v24;

      uint64_t v28 = a1[4];
      if (!*(void *)(v28 + 40) && v25)
      {
        if (a3)
        {
          uint64_t v22 = 0;
          *a3 = v25;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v22 = 0;
        }
        goto LABEL_70;
      }
      uint64_t v29 = *(void **)(v28 + 112);
      id v96 = 0;
      uint64_t v30 = [v29 requestedEndDateInTransaction:v5 error:&v96];
      id v31 = v96;
      uint64_t v32 = a1[4];
      id v33 = *(void **)(v32 + 192);
      *(void *)(v32 + 192) = v30;

      uint64_t v34 = a1[4];
      if (!*(void *)(v34 + 192) && v31)
      {
        if (a3)
        {
          uint64_t v22 = 0;
          *a3 = v31;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v22 = 0;
        }
        goto LABEL_69;
      }
      uint64_t v35 = *(void **)(v34 + 112);
      id v95 = 0;
      uint64_t v36 = [v35 clientBundleIdentifier:v5 error:&v95];
      id v37 = v95;
      uint64_t v38 = a1[4];
      uint64_t v39 = *(void **)(v38 + 24);
      *(void *)(v38 + 24) = v36;

      if (!*(void *)(a1[4] + 24) && v37)
      {
        if (a3)
        {
LABEL_24:
          id v37 = v37;
          uint64_t v22 = 0;
          *a3 = v37;
LABEL_68:

LABEL_69:
LABEL_70:

LABEL_71:
          goto LABEL_72;
        }
LABEL_29:
        _HKLogDroppedError();
        uint64_t v22 = 0;
        goto LABEL_68;
      }

      id v40 = *(void **)(a1[4] + 112);
      id v94 = 0;
      uint64_t v41 = [v40 clientApplicationIdentifier:v5 error:&v94];
      id v37 = v94;
      uint64_t v42 = a1[4];
      id v43 = *(void **)(v42 + 232);
      *(void *)(v42 + 232) = v41;

      uint64_t v44 = a1[4];
      if (!*(void *)(v44 + 232) && v37)
      {
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_29;
      }
      uint64_t v45 = [*(id *)(v44 + 112) sourceWithTransaction:v5 error:a3];
      if (v45)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
        id v46 = [WeakRetained sourceManager];
        uint64_t v47 = v45;
        id v48 = v46;
        id v86 = v47;
        uint64_t v49 = objc_msgSend(v46, "clientSourceForSourceEntity:error:");
        uint64_t v50 = a1[4];
        __int16 v51 = *(void **)(v50 + 256);
        *(void *)(v50 + 256) = v49;

        uint64_t v52 = a1[4];
        if (*(void *)(v52 + 256))
        {
          id v53 = *(void **)(v52 + 112);
          id v93 = 0;
          uint64_t v88 = [v53 latestActivityDateInTransaction:v5 error:&v93];
          id v54 = v93;
          uint64_t v55 = *(void *)(a1[7] + 8);
          uint64_t v56 = *(void **)(v55 + 40);
          *(void *)(v55 + 40) = v88;

          if (!*(void *)(*(void *)(a1[7] + 8) + 40) && v54)
          {
            if (a3)
            {
              uint64_t v22 = 0;
              *a3 = v54;
              id v57 = v54;
            }
            else
            {
              id v57 = v54;
              _HKLogDroppedError();
              uint64_t v22 = 0;
            }
            uint64_t v45 = v86;
            goto LABEL_66;
          }
          id v89 = v54;
          id v58 = *(void **)(a1[4] + 112);
          id v92 = 0;
          uint64_t v82 = [v58 currentActivityWithTransaction:v5 error:&v92];
          id v59 = v92;
          uint64_t v60 = a1[4];
          id v61 = *(void **)(v60 + 56);
          *(void *)(v60 + 56) = v82;

          id v62 = v59;
          uint64_t v63 = a1[4];
          if (!*(void *)(v63 + 56) && v59)
          {
            uint64_t v45 = v86;
            if (!a3)
            {
              id v76 = v62;
              _HKLogDroppedError();
              uint64_t v22 = 0;
LABEL_65:

              id v57 = v89;
LABEL_66:

              goto LABEL_67;
            }
            id v81 = v62;
            uint64_t v22 = 0;
            *a3 = v62;
LABEL_64:
            id v76 = v81;
            goto LABEL_65;
          }
          id v81 = v59;
          id v64 = *(void **)(v63 + 112);
          id v91 = 0;
          uint64_t v83 = [v64 activityConfigurationsWithTransaction:v5 error:&v91];
          id v65 = v91;
          uint64_t v66 = a1[4];
          id v67 = *(void **)(v66 + 264);
          *(void *)(v66 + 264) = v83;

          id v68 = v65;
          uint64_t v69 = a1[4];
          if (*(void *)(v69 + 264) || !v65)
          {
            id v70 = *(void **)(v69 + 112);
            id v90 = 0;
            uint64_t v84 = objc_msgSend(v70, "firstActivityConfigurationWithTransaction:error:", v5, &v90, v65);
            id v71 = v90;
            uint64_t v72 = a1[4];
            id v73 = *(void **)(v72 + 200);
            *(void *)(v72 + 200) = v84;

            id v74 = v71;
            if (*(void *)(a1[4] + 200)) {
              BOOL v75 = 1;
            }
            else {
              BOOL v75 = v71 == 0;
            }
            uint64_t v22 = v75;
            uint64_t v45 = v86;
            if (!v75)
            {
              if (a3)
              {
                id v85 = v74;
                *a3 = v74;
                id v74 = v85;
              }
              else
              {
                id v78 = v74;
                _HKLogDroppedError();
                id v74 = v78;
              }
            }
          }
          else
          {
            uint64_t v45 = v86;
            if (!a3)
            {
              id v77 = v68;
              _HKLogDroppedError();
              uint64_t v22 = 0;
LABEL_63:

              goto LABEL_64;
            }
            id v80 = v68;
            uint64_t v22 = 0;
            *a3 = v68;
          }
          id v77 = v80;
          goto LABEL_63;
        }
        uint64_t v22 = 0;
        uint64_t v45 = v86;
      }
      else
      {
        uint64_t v22 = 0;
      }
LABEL_67:

      goto LABEL_68;
    }
  }
  uint64_t v22 = 0;
LABEL_74:

  return v22;
}

void __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke_2(uint64_t *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(a1[4] + 153) = 1;
  objc_msgSend(*(id *)(a1[4] + 144), "enterAtState:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "integerValue"));
  objc_msgSend(*(id *)(a1[4] + 136), "enterAtState:", objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "integerValue"));
  *(unsigned char *)(a1[4] + 153) = 0;
  _HKInitializeLogging();
  uint64_t v2 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 136);
    id v5 = v2;
    uint64_t v6 = [v4 currentState];
    [v6 index];
    uint64_t v7 = _HKWorkoutSessionServerStateToString();
    uint64_t v8 = *(void *)(a1[4] + 40);
    int v9 = 138543874;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    double v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Recovered with state %{public}@ with start date %{public}@", (uint8_t *)&v9, 0x20u);
  }
  -[HDWorkoutSessionServer _queue_setupSessionController](a1[4]);
  -[HDWorkoutSessionServer _queue_startLatestActivityUpdateTimer]((dispatch_queue_t *)a1[4]);
}

- (id)taskServerConfigurationForRecoveryWithError:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F2B7C8]);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HDWorkoutSessionServer_taskServerConfigurationForRecoveryWithError___block_invoke;
  v9[3] = &unk_1E62F31C0;
  id v6 = v4;
  id v10 = v6;
  __int16 v11 = self;
  dispatch_sync(queue, v9);
  id v7 = v6;

  return v7;
}

uint64_t __70__HDWorkoutSessionServer_taskServerConfigurationForRecoveryWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSessionUUID:*(void *)(*(void *)(a1 + 40) + 216)];
  [*(id *)(a1 + 32) setWorkoutConfiguration:*(void *)(*(void *)(a1 + 40) + 224)];
  [*(id *)(a1 + 32) setCurrentActivity:*(void *)(*(void *)(a1 + 40) + 56)];
  [*(id *)(a1 + 32) setActivityConfigurations:*(void *)(*(void *)(a1 + 40) + 264)];
  [*(id *)(a1 + 32) setSupportsAppRelaunchForRecovery:1];
  uint64_t v2 = [*(id *)(a1 + 40) sessionType];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setSessionType:v2];
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (NSUUID)workoutDataProcessorUUID
{
  return self->_identifier;
}

- (BOOL)_queue_resendWorkoutEventsToDataDestination:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__188;
    uint64_t v15 = __Block_byref_object_dispose__188;
    id v16 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v7 = [WeakRetained database];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__HDWorkoutSessionServer__queue_resendWorkoutEventsToDataDestination_error___block_invoke;
    v10[3] = &unk_1E62F9108;
    v10[4] = a1;
    v10[5] = &v11;
    BOOL v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:v10];

    if (v8) {
      [v5 addWorkoutEvents:v12[5] dataSource:a1];
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __76__HDWorkoutSessionServer__queue_resendWorkoutEventsToDataDestination_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 112) workoutEventsInTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HDWorkoutSessionServer_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v9[3] = &unk_1E62F31C0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __69__HDWorkoutSessionServer_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v8 = 0;
  BOOL v4 = -[HDWorkoutSessionServer _queue_resendWorkoutEventsToDataDestination:error:](v2, v3, (uint64_t)&v8);
  id v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send persisted workout events to data destination upon request: %{public}@", buf, 0x16u);
    }
  }
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HDWorkoutSessionServer_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

void __85__HDWorkoutSessionServer_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v5 = 0;
  -[HDWorkoutSessionServer _queue_resendWorkoutEventsToDataDestination:error:](v2, v3, (uint64_t)&v5);
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self->_isMirroring)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending background runtime request for event: %{public}@.", buf, 0x16u);
    }
    syncController = self->_syncController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__HDWorkoutSessionServer_workoutDataDestination_didInsertEvent___block_invoke;
    v8[3] = &unk_1E62F2978;
    v8[4] = self;
    [(HDWorkoutSessionRapportSyncController *)syncController sendBackgroundRuntimeRequestWithCompletion:v8];
  }
}

void __64__HDWorkoutSessionServer_workoutDataDestination_didInsertEvent___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send background runtime request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)stateMachine:(id)a3 persistTransition:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  __int16 v10 = [WeakRetained database];
  id v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HDWorkoutSessionServer_stateMachine_persistTransition___block_invoke;
  v15[3] = &unk_1E62F5A88;
  id v11 = v6;
  id v16 = v11;
  uint64_t v17 = self;
  id v12 = v7;
  id v18 = v12;
  LOBYTE(v8) = [(id)v8 performWriteTransactionWithHealthDatabase:v10 error:&v19 block:v15];
  id v13 = v19;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update persisted session state: %{public}@.", buf, 0x16u);
    }
  }
}

uint64_t __57__HDWorkoutSessionServer_stateMachine_persistTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  if (v7 == v6[17])
  {
    uint64_t v9 = (void *)v6[14];
    __int16 v10 = [*(id *)(a1 + 48) toState];
    uint64_t v11 = objc_msgSend(v9, "setState:transaction:error:", objc_msgSend(v10, "index"), v5, a3);
LABEL_6:
    uint64_t v8 = v11;

    goto LABEL_7;
  }
  if (v7 == v6[18])
  {
    id v12 = (void *)v6[14];
    __int16 v10 = [*(id *)(a1 + 48) toState];
    uint64_t v11 = objc_msgSend(v12, "setRequestedTargetState:transaction:error:", objc_msgSend(v10, "index"), v5, a3);
    goto LABEL_6;
  }
  uint64_t v8 = 1;
LABEL_7:

  return v8;
}

uint64_t __61__HDWorkoutSessionServer__processTargetRunningStateWithDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setRequestedStartDate:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (void)_processTargetStoppingStateWithDate:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && !*(void *)(a1 + 192) && !*(void *)(a1 + 48))
  {
    id v5 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [WeakRetained database];
    id v17 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke;
    v15[3] = &unk_1E62F2AE0;
    void v15[4] = a1;
    id v8 = v4;
    id v16 = v8;
    char v9 = [v5 performWriteTransactionWithHealthDatabase:v7 error:&v17 block:v15];
    id v10 = v17;

    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v11 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        id v21 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update requested end date: %{public}@.", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)(a1 + 192), a2);
    id v12 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke_565;
    block[3] = &unk_1E62F31C0;
    block[4] = a1;
    id v14 = v8;
    dispatch_async(v12, block);
  }
}

uint64_t __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setRequestedEndDate:*(void *)(a1 + 40) transaction:a2 error:a3];
}

void __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke_565(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    uint64_t v3 = [v2 endDate];

    if (!v3)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(a1 + 40);
      -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](v4, v5, 0);
    }
  }
}

- (uint64_t)_queue_endCurrentActivityOnDate:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v6 = *(void **)(a1 + 56);
    if (v6)
    {
      uint64_t v7 = [v6 startDate];
      char v8 = objc_msgSend(v7, "hk_isBeforeDate:", v5);

      if (v8)
      {
        if ([(id)a1 isActive])
        {
          id v9 = *(id *)(a1 + 56);
          [v9 _setEndDate:v5];
          [*(id *)(a1 + 88) endCurrentActivity:v9];
          id v10 = *(id *)(a1 + 56);
          *(void *)(a1 + 56) = 0;
          goto LABEL_14;
        }
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        id v12 = @"No active session to end current activity";
      }
      else
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        id v12 = @"Activity end date before start date";
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      id v12 = @"No current activity to end";
    }
    id v13 = objc_msgSend(v11, "hk_error:description:", 3, v12);
    -[HDWorkoutSessionServer _queue_generateError:](a1, v13);
    id v14 = v13;
    id v10 = v14;
    if (v14)
    {
      if (a3)
      {
        id v10 = v14;
        a1 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        a1 = 0;
      }
      id v9 = v10;
      goto LABEL_16;
    }
    id v9 = 0;
LABEL_14:
    a1 = 1;
LABEL_16:
  }
  return a1;
}

- (void)stateMachine:(id)a3 willEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = (HKStateMachine *)a3;
  id v11 = a4;
  id v12 = (NSDate *)a5;
  id v13 = a6;
  targetStateMachine = self->_targetStateMachine;
  uint64_t v15 = [v11 index];
  if (targetStateMachine == v10)
  {
    if (v15 == 6 || v15 == 3)
    {
      -[HDWorkoutSessionServer _processTargetStoppingStateWithDate:]((uint64_t)self, v12);
    }
    else if (v15 == 2)
    {
      long long v27 = v12;
      if (!self->_startDate && !self->_requestedStartDate)
      {
        uint64_t v28 = objc_opt_class();
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v29 = [WeakRetained database];
        id v39 = 0;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __61__HDWorkoutSessionServer__processTargetRunningStateWithDate___block_invoke;
        uint64_t v45 = &unk_1E62F2AE0;
        id v46 = self;
        uint64_t v47 = v27;
        uint64_t v30 = (void *)v28;
        id v31 = (void *)v29;
        char v34 = [v30 performWriteTransactionWithHealthDatabase:v29 error:&v39 block:buf];
        id v32 = v39;

        if ((v34 & 1) == 0)
        {
          _HKInitializeLogging();
          id v33 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v40 = 138543618;
            uint64_t v41 = self;
            __int16 v42 = 2114;
            id v43 = v32;
            _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update start date: %{public}@.", v40, 0x16u);
          }
        }
        objc_storeStrong((id *)&self->_requestedStartDate, a5);
      }
    }
  }
  else if (v15 == 7 && !self->_startDate)
  {
    requestedStartDate = self->_requestedStartDate;
    if (!requestedStartDate) {
      requestedStartDate = v12;
    }
    id v17 = requestedStartDate;
    id v18 = objc_opt_class();
    id v19 = objc_loadWeakRetained((id *)&self->_profile);
    __int16 v20 = [v19 database];
    id v38 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __65__HDWorkoutSessionServer_stateMachine_willEnterState_date_error___block_invoke;
    v36[3] = &unk_1E62F2AE0;
    v36[4] = self;
    id v21 = v17;
    id v37 = v21;
    char v22 = [v18 performWriteTransactionWithHealthDatabase:v20 error:&v38 block:v36];
    id v23 = v38;

    if ((v22 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v24 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update start date: %{public}@.", buf, 0x16u);
      }
    }
    startDate = self->_startDate;
    self->_startDate = v21;
    uint64_t v26 = v21;
  }
}

uint64_t __65__HDWorkoutSessionServer_stateMachine_willEnterState_date_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setStartDate:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = (NSDate *)a5;
  if (self->_stateMachine == a3)
  {
    switch([a4 index])
    {
      case 2:
      case 3:
        id v51 = 0;
        BOOL v10 = [(HDWorkoutSessionServer *)self _queue_clientApplicationCanStartWorkoutSessionWithError:&v51];
        id v11 = v51;
        if (v10) {
          [(HKStateMachine *)self->_stateMachine enqueueEvent:100 date:v9 error:0 completion:&__block_literal_global_569];
        }
        else {
          [(HDWorkoutSessionServer *)self didResignCurrentWithError:v11];
        }

        break;
      case 7:
        if (self->_extendedPauseTimer)
        {
          _HKInitializeLogging();
          uint64_t v30 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = self;
            _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Extended Pause timer.", (uint8_t *)&buf, 0xCu);
          }
          dispatch_source_cancel((dispatch_source_t)self->_extendedPauseTimer);
          extendedPauseTimer = self->_extendedPauseTimer;
          self->_extendedPauseTimer = 0;
        }
        break;
      case 8:
        _HKInitializeLogging();
        id v32 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Extended Pause timer.", (uint8_t *)&buf, 0xCu);
        }
        objc_initWeak(location, self);
        id v33 = self->_extendedPauseTimer;
        if (v33) {
          dispatch_source_cancel(v33);
        }
        char v34 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
        p_extendedPauseTimer = (dispatch_object_t *)&self->_extendedPauseTimer;
        uint64_t v35 = self->_extendedPauseTimer;
        self->_extendedPauseTimer = v34;

        unint64_t v37 = (unint64_t)(self->_extendedPauseTimeout * 1000000000.0);
        id v38 = *p_extendedPauseTimer;
        dispatch_time_t v39 = dispatch_walltime(0, v37);
        dispatch_source_set_timer(v38, v39, v37, 0x3B9ACA00uLL);
        id v40 = *p_extendedPauseTimer;
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v57 = (uint64_t)__56__HDWorkoutSessionServer__queue_startExtendedPauseTimer__block_invoke;
        id v58 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F6BD0;
        objc_copyWeak((id *)&v59, location);
        dispatch_source_set_event_handler(v40, &buf);
        dispatch_activate(*p_extendedPauseTimer);
        objc_destroyWeak((id *)&v59);
        objc_destroyWeak(location);
        break;
      case 14:
      case 15:
        startDate = self->_startDate;
        if (startDate)
        {
          double v13 = *MEMORY[0x1E4F2BFB8];
          [(NSDate *)startDate timeIntervalSinceNow];
          if (v13 >= -v14 || self->_hasFailed) {
            [(HKStateMachine *)self->_stateMachine enqueueEvent:107 date:v9 error:0 completion:&__block_literal_global_567];
          }
        }
        break;
      case 16:
        stopDate = self->_stopDate;
        if (!stopDate)
        {
          stopDate = self->_requestedEndDate;
          if (!stopDate) {
            stopDate = v9;
          }
        }
        id v16 = stopDate;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        _HKInitializeLogging();
        id v17 = (os_log_t *)MEMORY[0x1E4F29FB8];
        id v18 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping latest activity update timer.", (uint8_t *)&buf, 0xCu);
        }
        latestActivityUpdateTimer = self->_latestActivityUpdateTimer;
        if (latestActivityUpdateTimer)
        {
          dispatch_source_cancel(latestActivityUpdateTimer);
          __int16 v20 = self->_latestActivityUpdateTimer;
          self->_latestActivityUpdateTimer = 0;
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v57 = 0x3032000000;
        id v58 = __Block_byref_object_copy__188;
        id v59 = __Block_byref_object_dispose__188;
        id v60 = 0;
        id v21 = objc_opt_class();
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        id v23 = [WeakRetained database];
        location[0] = (id)MEMORY[0x1E4F143A8];
        location[1] = (id)3221225472;
        location[2] = __79__HDWorkoutSessionServer__queue_deleteSessionAndFinishAssociatedBuilderAtDate___block_invoke;
        location[3] = &unk_1E62F9108;
        location[5] = &buf;
        id v53 = 0;
        location[4] = self;
        char v24 = [v21 performWriteTransactionWithHealthDatabase:v23 error:&v53 block:location];
        id v25 = v53;

        if ((v24 & 1) == 0)
        {
          _HKInitializeLogging();
          uint64_t v26 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v54 = 138543362;
            uint64_t v55 = self;
            _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete session entity when finishing.", v54, 0xCu);
          }
        }
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          _HKInitializeLogging();
          long long v27 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v54 = 138543362;
            uint64_t v55 = self;
            _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing associated builder.", v54, 0xCu);
          }
          uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
          id v29 = objc_loadWeakRetained((id *)&self->_profile);
          +[HDWorkoutBuilderServer finishDetachedBuilderForEntity:v28 sessionEndDate:v16 profile:v29];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v41 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v54 = 138543362;
            uint64_t v55 = self;
            _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: No associated builder entity found during finish; workout will not be automatically saved.",
              v54,
              0xCu);
          }
        }
        if (self->_sendHeartBeatFailureAnalytics)
        {
          id v42 = objc_loadWeakRetained((id *)&self->_profile);
          id v43 = [v42 workoutManager];
          uint64_t v44 = [v43 mirroringManager];

          if (self->_startDate)
          {
            -[NSDate timeIntervalSinceDate:](v16, "timeIntervalSinceDate:");
            double v46 = v45;
          }
          else
          {
            double v46 = -1.0;
          }
          uint64_t v47 = [v44 analyticsCollector];
          id v48 = objc_loadWeakRetained((id *)&self->_profile);
          uint64_t v49 = [v48 daemon];
          uint64_t v50 = [v49 analyticsSubmissionCoordinator];
          objc_msgSend(v47, "submitHeartBeatFailuresWithCoordinator:numOfHeartbeatFailures:workoutDuration:isFirstParty:", v50, self->_numberOfHeartbeatFailures, -[HDWorkoutSessionServer isFirstParty](self, "isFirstParty"), v46);
        }
        _Block_object_dispose(&buf, 8);

        break;
      default:
        break;
    }
  }
}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  double v14 = (HKStateMachine *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  targetStateMachine = self->_targetStateMachine;
  _HKInitializeLogging();
  id v21 = *MEMORY[0x1E4F29FB8];
  BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (targetStateMachine != v14)
  {
    if (v15)
    {
      if (!v22) {
        goto LABEL_11;
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v56 = self;
      __int16 v57 = 2114;
      id v58 = v15;
      id v23 = "%{public}@: (#w0) %{public}@.";
    }
    else
    {
      if (!v22) {
        goto LABEL_11;
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v56 = self;
      __int16 v57 = 2114;
      id v58 = v17;
      id v23 = "%{public}@: (#w0) Enter at %{public}@.";
    }
    _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
LABEL_11:
    if (!v18)
    {
      id v18 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v48 = v14;
    if (v16) {
      uint64_t v25 = [v16 index];
    }
    else {
      uint64_t v25 = 1;
    }
    uint64_t v26 = [v17 index];
    uint64_t v27 = v26;
    uint64_t v28 = &off_1BD324000;
    if (v26 == 7)
    {
      if (v25 != 17 && v25 != 8) {
        goto LABEL_34;
      }
      uint64_t v30 = self;
      uint64_t v31 = 3;
    }
    else
    {
      if (v26 == 10)
      {
        if (v25 == 17 || v25 == 8)
        {
          id v29 = [MEMORY[0x1E4F1C9C8] date];
          -[HDWorkoutSessionServer _queue_generateEventWithType:date:](self, 1, v29);

          uint64_t v28 = &off_1BD324000;
        }
        else
        {
          dispatch_time_t v33 = dispatch_time(0, (uint64_t)(self->_stopEventGenerationWaitInterval * 1000000000.0));
          queue = self->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke;
          block[3] = &unk_1E62F3208;
          block[4] = self;
          dispatch_after(v33, queue, block);
        }
        goto LABEL_34;
      }
      if (!v16 || v26 != 8)
      {
LABEL_34:
        if ((v27 & 0xFFFFFFFFFFFFFFFELL) != 0xE && (v25 & 0xFFFFFFFFFFFFFFFELL) == 0xE)
        {
          id v46 = v16;
          id v47 = v15;
          id v35 = v17;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          unint64_t v37 = [WeakRetained nanoSyncManager];
          [v37 syncHealthDataWithOptions:1 reason:@"syncing after heart rate recovery" completion:&__block_literal_global_575];

          id v38 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
          id v39 = objc_loadWeakRetained((id *)&self->_profile);
          id v40 = [v39 cloudSyncManager];
          id v41 = v19;
          id v42 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v38];
          [v40 syncWithRequest:v42 reason:@"Heart rate recovery completed" completion:&__block_literal_global_583];

          id v19 = v41;
          uint64_t v28 = &off_1BD324000;

          id v17 = v35;
          id v16 = v46;
          id v15 = v47;
        }
        if (self->_isMirroring)
        {
          _HKInitializeLogging();
          id v43 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v56 = self;
            _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending session state update", buf, 0xCu);
          }
          syncController = self->_syncController;
          v53[0] = MEMORY[0x1E4F143A8];
          uint64_t v28 = &off_1BD324000;
          v53[1] = 3221225472;
          v53[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_584;
          v53[3] = &unk_1E62F2978;
          v53[4] = self;
          [(HDWorkoutSessionRapportSyncController *)syncController sendStateUpdate:v27 date:v18 completion:v53];
          if (HKWorkoutSessionStateFromServerState() == 3) {
            [(HDWorkoutSessionServer *)self stopMirroringToCompanionDeviceWithCompletion:0];
          }
        }
        [(HDWorkoutSessionController *)self->_sessionController workoutSessionServer:self didTransitionFromState:v25 toState:v27 date:v18];
        observers = self->_observers;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = *((void *)v28 + 454);
        v49[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_585;
        v49[3] = &unk_1E630C1A8;
        v49[4] = self;
        uint64_t v51 = v27;
        uint64_t v52 = v25;
        id v18 = v18;
        id v50 = v18;
        [(HKObserverSet *)observers notifyObservers:v49];
        if (v19) {
          -[HDWorkoutSessionServer _queue_generateError:]((uint64_t)self, v19);
        }
        -[HDWorkoutSessionServer _queue_evaluateRequestedTargetStateAtDate:]((uint64_t)self, v18);

        double v14 = v48;
        goto LABEL_45;
      }
      uint64_t v30 = self;
      uint64_t v31 = 2;
    }
    -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v30, v31, v18);
    goto LABEL_34;
  }
  if (v15)
  {
    if (!v22) {
      goto LABEL_31;
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v56 = self;
    __int16 v57 = 2114;
    id v58 = v15;
    char v24 = "%{public}@: (#w0) Target State: %{public}@.";
  }
  else
  {
    if (!v22) {
      goto LABEL_31;
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v56 = self;
    __int16 v57 = 2114;
    id v58 = v17;
    char v24 = "%{public}@: (#w0) Target State Initialized at %{public}@.";
  }
  _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
LABEL_31:
  id v32 = [(HKStateMachine *)self->_stateMachine currentState];

  if (v32) {
    -[HDWorkoutSessionServer _queue_evaluateRequestedTargetStateAtDate:]((uint64_t)self, v18);
  }
LABEL_45:
}

- (void)_queue_evaluateRequestedTargetStateAtDate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!v3)
    {
      id v3 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v4 = [*(id *)(a1 + 144) currentState];
    uint64_t v5 = [v4 index];

    id v6 = *(void **)(a1 + 136);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__HDWorkoutSessionServer__queue_evaluateRequestedTargetStateAtDate___block_invoke;
    v7[3] = &unk_1E62FDAC0;
    v7[4] = a1;
    void v7[5] = v5;
    [v6 enqueueEvent:v5 date:v3 error:0 completion:v7];
  }
}

- (void)_queue_generateEventWithType:(void *)a3 date:
{
  if (a1)
  {
    uint64_t v5 = a1[2];
    id v6 = a3;
    dispatch_assert_queue_V2(v5);
    id v7 = objc_alloc(MEMORY[0x1E4F2B990]);
    char v8 = [a1 identifier];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 duration:0.0];

    id v10 = (id)[v7 initWithEventType:a2 sessionId:v8 dateInterval:v9 metadata:0];
    -[HDWorkoutSessionServer _queue_generateEvent:]((uint64_t)a1, v10);
  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 10)
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 120);
      int v7 = 138543618;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Failed to receive CM stop event with expected interval (%0.2lfs); generating simulated stop event",
        (uint8_t *)&v7,
        0x16u);
    }
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v5, 1, v6);
  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_573(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      int v7 = [v4 localizedDescription];
      int v8 = 138543362;
      __int16 v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to sync after heart rate recovery: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_581(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      int v7 = [v4 localizedDescription];
      int v8 = 138543362;
      __int16 v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after heart rate recovery: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_584(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send session updates to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_585(void *a1, void *a2)
{
  return [a2 workoutSession:a1[4] didChangeToState:a1[6] fromState:a1[7] date:a1[5]];
}

- (void)_queue_generateError:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v4 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v6 = [WeakRetained database];
    v13[4] = a1;
    id v14 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__HDWorkoutSessionServer__queue_generateError___block_invoke;
    v13[3] = &unk_1E62F6130;
    char v7 = [v4 performWriteTransactionWithHealthDatabase:v6 error:&v14 block:v13];
    id v8 = v14;

    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v9 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record workout session failure: %{public}@", buf, 0x16u);
      }
    }
    *(unsigned char *)(a1 + 152) = 1;
    __int16 v10 = *(void **)(a1 + 80);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__HDWorkoutSessionServer__queue_generateError___block_invoke_686;
    v11[3] = &unk_1E630C158;
    v11[4] = a1;
    id v12 = v3;
    [v10 notifyObservers:v11];
  }
}

- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5
{
  id v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__188;
  char v24 = __Block_byref_object_dispose__188;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke;
  block[3] = &unk_1E630C1D0;
  block[4] = self;
  int64_t v19 = a3;
  id v10 = v8;
  id v16 = v10;
  __int16 v17 = &v26;
  id v18 = &v20;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v27 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    id v12 = (id)v21[5];
    double v13 = v12;
    if (v12)
    {
      if (a5) {
        *a5 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v11 = *((unsigned char *)v27 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke_2;
  v4[3] = &unk_1E62F5DB8;
  long long v5 = *(_OWORD *)(a1 + 48);
  v4[4] = v3;
  -[HDWorkoutSessionServer _queue_setTargetState:date:completion:](v3, v1, v2, v4);
}

void __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke_2(uint64_t *a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    -[HDWorkoutSessionServer _queue_generateError:](a1[4], v6);
  }
}

- (void)_queue_setTargetState:(void *)a3 date:(void *)a4 completion:
{
  id v10 = a3;
  char v7 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v8 = [*(id *)(a1 + 144) currentState];
    uint64_t v9 = [v8 index];

    if (v9 == a2) {
      v7[2](v7, 1, 0);
    }
    else {
      [*(id *)(a1 + 144) enqueueEvent:a2 date:v10 error:0 completion:v7];
    }
  }
}

- (void)didBecomeCurrent
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HDWorkoutSessionServer_didBecomeCurrent__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__HDWorkoutSessionServer_didBecomeCurrent__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v1 enqueueEvent:101 date:v2 error:0 completion:&__block_literal_global_587];
}

- (void)didResignCurrentWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  long long v5 = *(void **)(v3 + 136);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke_2;
  v7[3] = &unk_1E62F5D48;
  v7[4] = v3;
  id v8 = v2;
  id v6 = v2;
  [v5 enqueueEvent:102 date:v6 error:v4 completion:v7];
}

void __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke_2(uint64_t a1)
{
}

- (BOOL)prepareWithError:(id *)a3
{
  long long v5 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a3) = [(HDWorkoutSessionServer *)self setTargetState:5 date:v5 error:a3];

  return (char)a3;
}

- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return [(HDWorkoutSessionServer *)self setTargetState:2 date:a3 error:a4];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v8 = [(HDWorkoutSessionServer *)self setTargetState:2 date:v7 error:a4];

    return v8;
  }
}

- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return [(HDWorkoutSessionServer *)self setTargetState:6 date:a3 error:a4];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v8 = [(HDWorkoutSessionServer *)self setTargetState:6 date:v7 error:a4];

    return v8;
  }
}

- (BOOL)endWithError:(id *)a3
{
  long long v5 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a3) = [(HDWorkoutSessionServer *)self setTargetState:3 date:v5 error:a3];

  return (char)a3;
}

- (BOOL)pauseWithError:(id *)a3
{
  long long v5 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a3) = [(HDWorkoutSessionServer *)self setTargetState:4 date:v5 error:a3];

  return (char)a3;
}

- (BOOL)resumeWithError:(id *)a3
{
  long long v5 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a3) = [(HDWorkoutSessionServer *)self setTargetState:2 date:v5 error:a3];

  return (char)a3;
}

- (void)autoPauseWithDate:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HDWorkoutSessionServer_autoPauseWithDate___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__HDWorkoutSessionServer_autoPauseWithDate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v1 enqueueEvent:103 date:v2 error:0 completion:&__block_literal_global_591];
}

- (void)autoResumeWithDate:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HDWorkoutSessionServer_autoResumeWithDate___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __45__HDWorkoutSessionServer_autoResumeWithDate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v1 enqueueEvent:104 date:v2 error:0 completion:&__block_literal_global_593_1];
}

- (void)endHeartRateRecovery
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HDWorkoutSessionServer_endHeartRateRecovery__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__HDWorkoutSessionServer_endHeartRateRecovery__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 136);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v1 enqueueEvent:107 date:v2 error:0 completion:&__block_literal_global_595];
}

- (void)finish
{
}

- (void)finishAggregationWithDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_finishAggregationWithDate___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__HDWorkoutSessionServer_finishAggregationWithDate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) enqueueEvent:106 date:*(void *)(a1 + 40) error:0 completion:&__block_literal_global_597];
}

- (void)generateEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HDWorkoutSessionServer_generateEvent___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __40__HDWorkoutSessionServer_generateEvent___block_invoke(uint64_t a1)
{
}

- (void)_queue_generateEvent:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v4 = (os_log_t *)MEMORY[0x1E4F29FB8];
    long long v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v39 = a1;
      __int16 v40 = 2114;
      id v41 = v3;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Generated event: %{public}@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    char v7 = [WeakRetained database];
    id v37 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke;
    v35[3] = &unk_1E62F2AE0;
    v35[4] = a1;
    id v8 = v3;
    id v36 = v8;
    BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v37 block:v35];
    id v10 = v37;

    if (!v9)
    {
      _HKInitializeLogging();
      BOOL v11 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v39 = a1;
        __int16 v40 = 2114;
        id v41 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist workout event: %{public}@", buf, 0x16u);
      }
    }
    id v12 = *(void **)(a1 + 80);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_680;
    v33[3] = &unk_1E630C158;
    v33[4] = a1;
    id v13 = v8;
    id v34 = v13;
    [v12 notifyObservers:v33];
    id v14 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_2;
    v30[3] = &unk_1E62F3148;
    id v15 = v13;
    id v31 = v15;
    uint64_t v32 = a1;
    [v14 sendToDestinationProcessors:v30];
    if ([v15 eventType] == 1)
    {
      id v16 = *(NSObject **)(a1 + 16);
      id v17 = v15;
      dispatch_assert_queue_V2(v16);
      id v18 = *(void **)(a1 + 192);
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v19;
      }
      else
      {
        uint64_t v20 = [v17 dateInterval];
        uint64_t v21 = [v20 endDate];
        uint64_t v22 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v21;
      }
      id v23 = *(void **)(a1 + 136);
      char v24 = [v17 dateInterval];

      id v25 = [v24 startDate];
      [v23 enqueueEvent:105 date:v25 error:0 completion:&__block_literal_global_689_0];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v26 = [MEMORY[0x1E4F2B798] _workoutEventWithInternalEvent:v15];
      if (v26)
      {
        _HKInitializeLogging();
        uint64_t v27 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v39 = a1;
          __int16 v40 = 2114;
          id v41 = v26;
          _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending update for event: %{public}@", buf, 0x16u);
        }
        uint64_t v28 = *(void **)(a1 + 72);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_683;
        v29[3] = &unk_1E62F2978;
        v29[4] = a1;
        [v28 sendEventUpdate:v26 completion:v29];
      }
    }
  }
}

- (void)generateError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HDWorkoutSessionServer_generateError___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __40__HDWorkoutSessionServer_generateError___block_invoke(uint64_t a1)
{
}

- (void)generateMetadata:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HDWorkoutSessionServer_generateMetadata___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__HDWorkoutSessionServer_generateMetadata___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v1)
  {
    id v4 = *(void **)(v1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__HDWorkoutSessionServer__queue_generateMetadata___block_invoke;
    v5[3] = &unk_1E62F3148;
    id v6 = v2;
    uint64_t v7 = v1;
    [v4 sendToDestinationProcessors:v5];
  }
}

- (void)generateConfigurationUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke(uint64_t a1)
{
}

- (void)_queue_generateConfigurationUpdate:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v4 = (os_log_t *)MEMORY[0x1E4F29FB8];
    long long v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = a1;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Generated configuration update : %{public}@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [WeakRetained database];
    id v18 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke;
    v16[3] = &unk_1E62F2AE0;
    void v16[4] = a1;
    id v8 = v3;
    id v17 = v8;
    BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v18 block:v16];
    id v10 = v18;

    if (!v9)
    {
      _HKInitializeLogging();
      BOOL v11 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist workout configuration update: %{public}@", buf, 0x16u);
      }
    }
    id v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke_687;
    v13[3] = &unk_1E62F3148;
    id v14 = v8;
    uint64_t v15 = a1;
    [v12 sendToDestinationProcessors:v13];
  }
}

void __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (void)didBeginNewActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  id v17 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke;
  v15[3] = &unk_1E62F2AE0;
  void v15[4] = self;
  id v7 = v4;
  id v16 = v7;
  BOOL v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v17 block:v15];
  id v9 = v17;

  if (!v8)
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist current activity: %{public}@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_600;
  block[3] = &unk_1E62F31C0;
  block[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setCurrentActivity:*(void *)(a1 + 40) transaction:a2 error:a3];
}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_600(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_2;
  v9[3] = &unk_1E62F3148;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 sendToDestinationProcessors:v9];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_3;
  v7[3] = &unk_1E630C158;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  [v6 notifyObservers:v7];
}

uint64_t __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didBeginActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutSession:*(void *)(a1 + 32) didBeginActivity:*(void *)(a1 + 40)];
  }
}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_4()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (void)didEndCurrentActivity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  void v14[4] = self;
  id v15 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke;
  v14[3] = &unk_1E62F6130;
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v15 block:v14];
  id v8 = v15;

  if (!v7)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist current activity: %{public}@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_606;
  v12[3] = &unk_1E62F31C0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_sync(queue, v12);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setCurrentActivity:0 transaction:a2 error:a3];
}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_606(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_2;
  v9[3] = &unk_1E62F3148;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 sendToDestinationProcessors:v9];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_3;
  v7[3] = &unk_1E630C158;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  [v6 notifyObservers:v7];
}

uint64_t __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didEndActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutSession:*(void *)(a1 + 32) didEndActivity:*(void *)(a1 + 40)];
  }
}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_4()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (void)didDetectActivityChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_2;
  v5[3] = &unk_1E62F3148;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 sendToDestinationProcessors:v5];
}

uint64_t __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didSuggestActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  id v3 = [WeakRetained workoutDataAccumulator];

  return (HDWorkoutDataAccumulator *)v3;
}

- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__188;
  uint64_t v26 = __Block_byref_object_dispose__188;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke;
  block[3] = &unk_1E6301AC8;
  uint64_t v20 = &v28;
  block[4] = self;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v21 = &v22;
  dispatch_sync(queue, block);
  id v13 = (id)v23[5];
  id v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v15 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  obuint64_t j = v7;
  id v8 = v2;
  id v9 = v4;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    id v11 = [WeakRetained database];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__HDWorkoutSessionServer__queue_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke;
    v18[3] = &unk_1E62F5A88;
    id v19 = v9;
    id v20 = v8;
    uint64_t v21 = v3;
    BOOL v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:&obj block:v18];
  }
  else
  {
    BOOL v12 = 0;
  }

  objc_storeStrong(v6, obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 80);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E630C158;
  void v15[4] = v13;
  id v16 = *(id *)(a1 + 48);
  [v14 notifyObservers:v15];
}

void __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutSession:*(void *)(a1 + 32) didUpdateControllerStateForRecoveryIdentifier:*(void *)(a1 + 40)];
  }
}

BOOL __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 112);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke_2;
  v7[3] = &unk_1E630C1F8;
  v7[4] = a1[6];
  return +[HDWorkoutSessionControllerEntity retrieveArchivedStateFromRecoveryIdentifier:v4 workoutSession:v5 transaction:a2 error:a3 block:v7];
}

void __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke_2(uint64_t a1, int a2, int a3, id obj)
{
}

BOOL __89__HDWorkoutSessionServer__queue_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutSessionControllerEntity storeArchivedStateWithRecoveryIdentifier:a1[4] archivedState:a1[5] workoutSession:*(void *)(a1[6] + 112) transaction:a2 error:a3];
}

- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__188;
  id v35 = __Block_byref_object_dispose__188;
  id v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
  block[3] = &unk_1E630C220;
  block[4] = self;
  id v14 = v10;
  id v26 = v14;
  char v29 = &v31;
  id v15 = v11;
  id v27 = v15;
  uint64_t v30 = &v37;
  id v16 = v12;
  id v28 = v16;
  dispatch_sync(queue, block);
  id v17 = (id)v32[5];
  id v18 = v17;
  if (v17)
  {
    if (a6) {
      *a6 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (self->_isMirroring)
  {
    _HKInitializeLogging();
    id v19 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = self;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending current activity update", buf, 0xCu);
    }
    syncController = self->_syncController;
    currentActivity = self->_currentActivity;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke_619;
    v24[3] = &unk_1E62F2978;
    v24[4] = self;
    [(HDWorkoutSessionRapportSyncController *)syncController sendCurrentActivityUpdate:currentActivity completion:v24];
  }
  BOOL v22 = *((unsigned char *)v38 + 24) != 0;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F2B718], "_workoutWithActivityType:acceptsSubActivityType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "activityType"), objc_msgSend(*(id *)(a1 + 40), "activityType")))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 56))
    {
      id v3 = *(void **)(a1 + 48);
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      obuint64_t j = *(id *)(v4 + 40);
      int v5 = -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](v2, v3, &obj);
      objc_storeStrong((id *)(v4 + 40), obj);
      if (!v5) {
        return;
      }
      uint64_t v2 = *(void *)(a1 + 32);
    }
    uint64_t v7 = *(void **)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v8 = *(void **)(a1 + 56);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    id v45 = v11;
    id v12 = v7;
    id v13 = v6;
    id v14 = v8;
    if (!v2)
    {
      BOOL v18 = 0;
      goto LABEL_17;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    if (objc_msgSend(*(id *)(v2 + 40), "hk_isAfterDate:", v13))
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Activity start date before session start");
      -[HDWorkoutSessionServer _queue_generateError:](v2, v15);
      id v16 = v15;
      id v17 = v16;
      BOOL v18 = v16 == 0;
      if (v16) {
        id v45 = v16;
      }
LABEL_32:

      goto LABEL_17;
    }
    unint64_t v26 = [(id)v2 state];
    if (v26 > 0x11 || ((1 << v26) & 0x203A0) == 0)
    {
      uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"No active session to begin new activity");
      -[HDWorkoutSessionServer _queue_generateError:](v2, v39);
      id v40 = v39;
      id v17 = v40;
      BOOL v18 = v40 == 0;
      if (v40) {
        id v45 = v40;
      }
      goto LABEL_32;
    }
    if (!*(void *)(v2 + 200) && [*(id *)(v2 + 264) count])
    {
      uint64_t v29 = [v12 activityType];
      uint64_t v30 = [*(id *)(v2 + 264) firstObject];
      LODWORD(v29) = v29 == [v30 activityType];

      if (!v29)
      {
        id v41 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"First activity configuration does not match with the list of configurations");
        -[HDWorkoutSessionServer _queue_generateError:](v2, v41);
        id v42 = v41;
        id v17 = v42;
        BOOL v18 = v42 == 0;
        if (v42) {
          id v45 = v42;
        }
        goto LABEL_32;
      }
      uint64_t v31 = [*(id *)(v2 + 264) firstObject];
      uint64_t v32 = [v31 suggestedActivityUUID];
      [v12 setSuggestedActivityUUID:v32];

      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
      id v34 = [WeakRetained database];
      id v49 = 0;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __87__HDWorkoutSessionServer__queue_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
      v47[3] = &unk_1E62F2AE0;
      v47[4] = v2;
      id v48 = v12;
      BOOL v43 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v34 error:&v49 block:v47];
      id v44 = v49;

      id v35 = (os_log_t *)MEMORY[0x1E4F29FB8];
      if (!v43)
      {
        _HKInitializeLogging();
        id v36 = *v35;
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v51 = v2;
          __int16 v52 = 2114;
          id v53 = v44;
          _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist first activity configuration : %{public}@", buf, 0x16u);
        }
      }
      objc_storeStrong((id *)(v2 + 200), v7);
      _HKInitializeLogging();
      uint64_t v37 = *v35;
      if (os_log_type_enabled(*v35, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = *(void **)(v2 + 200);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v51 = v2;
        __int16 v52 = 2114;
        id v53 = v38;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: First activity configuration %{public}@", buf, 0x16u);
      }
    }
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F2B720]) initWithWorkoutConfiguration:v12 startDate:v13 endDate:0 metadata:v14];
    id v28 = *(void **)(v2 + 56);
    *(void *)(v2 + 56) = v27;

    [*(id *)(v2 + 88) beginNewActivity:*(void *)(v2 + 56)];
    BOOL v18 = 1;
LABEL_17:

    objc_storeStrong(v10, v45);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
    return;
  }
  id v19 = (void *)MEMORY[0x1E4F28C58];
  id v20 = objc_msgSend(MEMORY[0x1E4F2B718], "_stringFromWorkoutActivityType:", objc_msgSend(*(id *)(a1 + 40), "activityType"));
  uint64_t v21 = objc_msgSend(v19, "hk_error:format:", 3, @"Cannot add subactivity of type %@", v20);
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  -[HDWorkoutSessionServer _queue_generateError:](v24, v25);
}

void __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke_619(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__188;
  uint64_t v32 = __Block_byref_object_dispose__188;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__188;
  unint64_t v26 = __Block_byref_object_dispose__188;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke;
  block[3] = &unk_1E630B368;
  id v19 = &v28;
  block[4] = self;
  id v8 = v6;
  id v18 = v8;
  id v20 = &v34;
  uint64_t v21 = &v22;
  dispatch_sync(queue, block);
  id v9 = (id)v23[5];
  __int16 v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (self->_isMirroring && v29[5])
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v39 = self;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending current activity end", buf, 0xCu);
    }
    syncController = self->_syncController;
    uint64_t v13 = v29[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_620;
    v16[3] = &unk_1E62F2978;
    void v16[4] = self;
    [(HDWorkoutSessionRapportSyncController *)syncController sendCurrentActivityUpdate:v13 completion:v16];
  }
  BOOL v14 = *((unsigned char *)v35 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v14;
}

void __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) _deepCopy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1[6] + 8) + 40) _setEndDate:a1[5]];
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  uint64_t v7 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  char v8 = -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8;
}

void __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_620(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        __int16 v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v11 = [v10 suggestedActivityUUID];
        BOOL v12 = v11 == 0;

        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
          [v10 setSuggestedActivityUUID:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v7);
  }
  _HKInitializeLogging();
  BOOL v14 = (os_log_t *)MEMORY[0x1E4F29FB8];
  id v15 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Enabling automatic detection for configurations %{public}@", buf, 0x16u);
  }
  uint64_t v16 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v18 = [WeakRetained database];
  id v37 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke;
  v35[3] = &unk_1E62F2AE0;
  v35[4] = self;
  id v19 = v6;
  id v36 = v19;
  LOBYTE(v16) = [(id)v16 performWriteTransactionWithHealthDatabase:v18 error:&v37 block:v35];
  id v20 = v37;

  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v21 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist activity configurations: %{public}@", buf, 0x16u);
    }
    id v22 = v20;
    uint64_t v23 = v22;
    if (v22)
    {
      if (a4) {
        *a4 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v43 = 0;
  queue = self->_queue;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke_622;
  uint64_t v31 = &unk_1E62FEE30;
  uint64_t v34 = buf;
  uint64_t v32 = self;
  id v25 = v19;
  id v33 = v25;
  dispatch_sync(queue, &v28);
  int v26 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Not supported with the current workout session", v28, v29, v30, v31, v32);
  }

  _Block_object_dispose(buf, 8);
  return v26 != 0;
}

uint64_t __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setActivityConfigurations:*(void *)(a1 + 40) transaction:a2 error:a3];
}

void __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke_622(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 88) enableAutomaticDetectionForActivityConfigurations:a1[5]];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = (void *)a1[5];
    uint64_t v3 = (id *)(a1[4] + 264);
    objc_storeStrong(v3, v2);
  }
}

- (void)startMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v5 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  block[3] = &unk_1E62F4928;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 16)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot start mirroring for an ended workout session.");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 64))
    {
      _HKInitializeLogging();
      id v4 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v17 = v5;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Session is already mirroring, ignoring mirroring start request", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      -[HDWorkoutSessionServer _queue_setIsMirroring:completion:](v3, 1, *(void **)(a1 + 40));
      *(unsigned char *)(*(void *)(a1 + 32) + 208) = 1;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v7 = [WeakRetained workoutManager];
      uint64_t v8 = [v7 mirroringManager];

      id v9 = [v8 analyticsCollector];
      [v9 startMirroring];

      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 72);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_629;
      v14[3] = &unk_1E62F5D48;
      void v14[4] = v10;
      id v15 = v8;
      id v12 = v8;
      [v11 sendMirroringStartRequestWithCompletion:v14];
    }
  }
}

- (void)_queue_setIsMirroring:(void *)a3 completion:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (a1)
  {
    id v6 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v8 = [WeakRetained database];
    id v14 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__HDWorkoutSessionServer__queue_setIsMirroring_completion___block_invoke;
    v12[3] = &unk_1E630C270;
    v12[4] = a1;
    char v13 = a2;
    uint64_t v9 = [v6 performWriteTransactionWithHealthDatabase:v8 error:&v14 block:v12];
    id v10 = v14;

    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      id v11 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        id v18 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to persist mirroring state with error: %{public}@", buf, 0x16u);
      }
    }
    *(unsigned char *)(a1 + 64) = a2;
    if (v5) {
      v5[2](v5, v9, v10);
    }
  }
}

void __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_629(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    *(_DWORD *)id v10 = 138543874;
    if (a2) {
      uint64_t v8 = @"YES";
    }
    *(void *)&v10[4] = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Started mirroring with success: %{public}@, error: %{public}@", v10, 0x20u);
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "analyticsCollector", *(void *)v10);
  [v9 startedMirroring];
}

- (void)stopMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v5 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  block[3] = &unk_1E62F4928;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 64))
  {
    -[HDWorkoutSessionServer _queue_setIsMirroring:completion:](v2, 0, *(void **)(a1 + 40));
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v4 = [WeakRetained workoutManager];
    id v5 = [v4 mirroringManager];

    id v6 = [v5 analyticsCollector];
    [v6 stopMirroring];

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 72);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_639;
    v13[3] = &unk_1E62F5D48;
    void v13[4] = v7;
    id v14 = v5;
    id v9 = v5;
    [v8 sendMirroringStopRequestWithCompletion:v13];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Session is not mirroring, ignoring mirroring stop request", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Session is not mirroring.");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v9);
  }
}

void __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_639(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    *(_DWORD *)id v14 = 138543874;
    if (a2) {
      uint64_t v8 = @"YES";
    }
    *(void *)&void v14[4] = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Stopped mirroring with success: %{public}@, error: %{public}@", v14, 0x20u);
  }
  id v9 = objc_msgSend(*(id *)(a1 + 40), "analyticsCollector", *(void *)v14);
  [v9 stoppedMirroring];

  id v10 = [*(id *)(a1 + 40) analyticsCollector];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v12 = [WeakRetained daemon];
  __int16 v13 = [v12 analyticsSubmissionCoordinator];
  objc_msgSend(v10, "submitMirroringMetricsWithCoordinator:isFirstParty:", v13, objc_msgSend(*(id *)(a1 + 32), "isFirstParty"));
}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  id v4 = a3;
  if (self)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HDWorkoutSessionServer_setIsMirroring___block_invoke;
    block[3] = &unk_1E62F8638;
    block[4] = self;
    char v11 = 0;
    dispatch_async(queue, block);
  }
  id v6 = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke;
  v8[3] = &unk_1E62F31C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2;
  v2[3] = &unk_1E6300A20;
  id v3 = *(id *)(a1 + 40);
  [v1 sendToDestinationProcessors:v2];
}

uint64_t __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didDisconnectFromRemoteWithError:*(void *)(a1 + 32)];
}

- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HDWorkoutSessionServer_sendDataToRemoteWorkoutSession_completion___block_invoke;
    block[3] = &unk_1E62F69F0;
    block[4] = self;
    id v13 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      __int16 v15 = self;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Data is nil. Nothing to send", buf, 0xCu);
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"No data to send.");
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __68__HDWorkoutSessionServer_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 64))
    {

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v5 = [WeakRetained workoutManager];
      id v8 = [v5 mirroringManager];

      id v6 = [v8 analyticsCollector];
      [v6 sendData];

      [*(id *)(*(void *)(a1 + 32) + 72) sendDataToRemoteWorkoutSession:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      id v7 = [v8 analyticsCollector];
      [v7 sentData];
    }
    else
    {
      id v8 = v3;
      id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Workout session is not currently mirroring to the companion device.");
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v7);
    }
  }
  else
  {
    id v8 = v3;
  }
}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));

  if (WeakRetained)
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)long long buf = 138543618;
      __int16 v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      id v7 = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client %@ of received data ", buf, 0x16u);
    }
    id v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_646;
    v11[3] = &unk_1E630C248;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    [v8 sendToDestinationProcessors:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Session client is not set up.");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

uint64_t __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_646(uint64_t a1, void *a2)
{
  return [a2 didReceiveDataFromRemoteWorkoutSession:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (BOOL)isMirroring
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__HDWorkoutSessionServer_isMirroring__block_invoke;
  v5[3] = &unk_1E62F3230;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__HDWorkoutSessionServer_isMirroring__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

void __41__HDWorkoutSessionServer_setIsMirroring___block_invoke(uint64_t a1)
{
}

uint64_t __59__HDWorkoutSessionServer__queue_setIsMirroring_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setIsMirroring:*(unsigned __int8 *)(a1 + 40) transaction:a2 error:a3];
}

- (void)syncCurrentActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HDWorkoutSessionServer_syncCurrentActivity_completion___block_invoke;
  v10[3] = &unk_1E6300A20;
  id v11 = v6;
  id v8 = v6;
  char v9 = (void (**)(id, uint64_t, void))a4;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v10];
  v9[2](v9, 1, 0);
}

uint64_t __57__HDWorkoutSessionServer_syncCurrentActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didSyncCurrentActivity:*(void *)(a1 + 32)];
}

- (void)syncWorkoutEvents:(id)a3 completion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = (void (**)(id, void, id))a4;
  objc_msgSend(v4, "hk_error:description:", 3, @"Cannot add events from remote session");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);
}

- (void)syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke;
  block[3] = &unk_1E62F4978;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 240));

  if (WeakRetained)
  {
    char v3 = *(void **)(a1[4] + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke_650;
    v7[3] = &unk_1E6300A48;
    id v4 = (void *)a1[5];
    uint64_t v9 = a1[6];
    id v8 = v4;
    [v3 sendToDestinationProcessors:v7];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v11 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Workout session client is not set up.", buf, 0xCu);
    }
  }
}

uint64_t __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke_650(uint64_t a1, void *a2)
{
  return [a2 didSyncStateEvent:*(void *)(a1 + 40) date:*(void *)(a1 + 32)];
}

- (void)remoteSessionDidRecover
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));

  if (WeakRetained)
  {
    char v3 = *(void **)(*(void *)(a1 + 32) + 32);
    [v3 sendToDestinationProcessors:&__block_literal_global_653];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Workout session client is not set up.", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke_651(uint64_t a1, void *a2)
{
  return [a2 remoteSessionDidRecover];
}

- (void)recordHeartbeatFailure
{
}

- (void)unitTest_setSessionController:(id)a3
{
}

- (void)unitTest_setStopEventGenerationWaitInterval:(double)a3
{
  if (a3 >= 0.0)
  {
    v6[6] = v3;
    v6[7] = v4;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__HDWorkoutSessionServer_unitTest_setStopEventGenerationWaitInterval___block_invoke;
    v6[3] = &unk_1E62F3198;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

double __70__HDWorkoutSessionServer_unitTest_setStopEventGenerationWaitInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 120) = result;
  return result;
}

+ (void)unitTest_setDefaultStopEventGenerationWaitInterval:(double)a3
{
  _defaultUnitTestStopEventWaitInterval = *(void *)&a3;
}

- (void)unitTest_generateStopEvent
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDWorkoutSessionServer_unitTest_generateStopEvent__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __52__HDWorkoutSessionServer_unitTest_generateStopEvent__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v1, 1, v2);
}

- (void)unitTest_generateWorkoutConfigurationUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HDWorkoutSessionServer_unitTest_generateWorkoutConfigurationUpdate___block_invoke;
  v7[3] = &unk_1E62F31C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __70__HDWorkoutSessionServer_unitTest_generateWorkoutConfigurationUpdate___block_invoke(uint64_t a1)
{
}

- (BOOL)unitTest_updateLatestActivityDate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke;
  block[3] = &unk_1E62FEE30;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke(void *a1)
{
  id v2 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  id v4 = [WeakRetained database];
  id v9 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke_2;
  v7[3] = &unk_1E62F2AE0;
  uint64_t v5 = (void *)a1[5];
  void v7[4] = a1[4];
  id v8 = v5;
  LOBYTE(v2) = [v2 performWriteTransactionWithHealthDatabase:v4 error:&v9 block:v7];
  id v6 = v9;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v2;
}

uint64_t __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) updateLatestActivityDate:*(void *)(a1 + 40) transaction:a2 error:a3];
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
}

- (void)unitTest_setExtendedPauseInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__HDWorkoutSessionServer_unitTest_setExtendedPauseInterval___block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __60__HDWorkoutSessionServer_unitTest_setExtendedPauseInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  if (a4)
  {
    sessionController = self->_sessionController;
    id v11 = a5;
    [(HDWorkoutSessionController *)sessionController fakeActivityDetection:a3 workoutActivity:a4];
    (*((void (**)(id, uint64_t, void))a5 + 2))(v11, 1, 0);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v10 = a5;
    objc_msgSend(v9, "hk_error:description:", 3, @"Workout Activity is nil");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void))a5 + 2))(v10, 0);
  }
}

uint64_t __87__HDWorkoutSessionServer__queue_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setFirstActivityConfiguration:*(void *)(a1 + 40) transaction:a2 error:a3];
}

void __68__HDWorkoutSessionServer__queue_evaluateRequestedTargetStateAtDate___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = v6;
      id v9 = HKWorkoutSessionStateToString();
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to make progress toward requested target state %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

uint64_t __79__HDWorkoutSessionServer__queue_deleteSessionAndFinishAssociatedBuilderAtDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 112);
  id v18 = 0;
  uint64_t v7 = [v6 associatedBuilderWithTransaction:v5 error:&v18];
  id v8 = v18;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v8 == 0;
  }
  if (!v11)
  {
    _HKInitializeLogging();
    __int16 v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup associated builder while finishing session: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 112);
  __int16 v14 = [v5 databaseForEntity:v13];
  uint64_t v15 = [v13 deleteFromDatabase:v14 error:a3];

  return v15;
}

uint64_t __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) insertWorkoutEvent:*(void *)(a1 + 40) transaction:a2 error:a3];
}

uint64_t __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_680(uint64_t a1, void *a2)
{
  return [a2 workoutSession:*(void *)(a1 + 32) didGenerateEvent:*(void *)(a1 + 40)];
}

void __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "addWorkoutEvents:dataSource:", v5, *(void *)(a1 + 40), v6, v7);
}

void __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_683(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __47__HDWorkoutSessionServer__queue_generateError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setHasFailed:1 transaction:a2 error:a3];
}

uint64_t __47__HDWorkoutSessionServer__queue_generateError___block_invoke_686(uint64_t a1, void *a2)
{
  return [a2 workoutSession:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

uint64_t __50__HDWorkoutSessionServer__queue_generateMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

uint64_t __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setWorkoutConfiguration:*(void *)(a1 + 40) transaction:a2 error:a3];
}

uint64_t __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke_687(uint64_t a1, void *a2)
{
  return [a2 updateWorkoutConfiguration:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

BOOL __55__HDWorkoutSessionServer__queue_cacheClientIdentifiers__block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v7 = [WeakRetained sourceManager];
  int v8 = [v7 sourceEntityForClientSource:a1[5] createOrUpdateIfNecessary:1 error:a3];

  if (v8)
  {
    char v9 = [*(id *)(a1[4] + 112) setSource:v8 transaction:v5 error:a3];
    __int16 v10 = (os_log_t *)MEMORY[0x1E4F29FB8];
    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      id v11 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = a1[4];
        int v18 = 138543362;
        uint64_t v19 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client source. Client may not be able to recover correctly after a full crash.", (uint8_t *)&v18, 0xCu);
      }
    }
    if (([*(id *)(a1[4] + 112) setClientBundleIdentifier:a1[6] transaction:v5 error:a3] & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v12 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = a1[4];
        int v18 = 138543362;
        uint64_t v19 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client process bundle identifier. Client may not be correctly relaunched after a full crash.", (uint8_t *)&v18, 0xCu);
      }
    }
    if (([*(id *)(a1[4] + 112) setClientApplicationIdentifier:a1[7] transaction:v5 error:a3] & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = a1[4];
        int v18 = 138543362;
        uint64_t v19 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client application identifier. Client may not be able to recover this workout after a crash.", (uint8_t *)&v18, 0xCu);
      }
    }
  }

  return v8 != 0;
}

void __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    uint64_t v1 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v6 = WeakRetained;
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidation timer fired; finishing session for client loss.",
        buf,
        0xCu);
    }
    id v2 = [MEMORY[0x1E4F1C9C8] date];
    -[HDWorkoutSessionServer _queue_setTargetState:date:completion:]((uint64_t)WeakRetained, 3, v2, &__block_literal_global_700);

    [WeakRetained[13] invalidate];
    id v3 = WeakRetained[13];
    WeakRetained[13] = 0;
  }
}

void __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_697(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 232);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire reconnection assertion for : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __56__HDWorkoutSessionServer__queue_startExtendedPauseTimer__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    int v8 = WeakRetained;
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Extended Pause timer fired.", buf, 0xCu);
    }
    if ([v8 state] == 8)
    {
      uint64_t v4 = (void *)v8[17];
      int v5 = [MEMORY[0x1E4F1C9C8] date];
      [v4 enqueueEvent:108 date:v5 error:0 completion:&__block_literal_global_702];
    }
    id v2 = v8;
    uint64_t v6 = v8[22];
    if (v6)
    {
      dispatch_source_cancel(v6);
      uint64_t v7 = (void *)v8[22];
      v8[22] = 0;

      id v2 = v8;
    }
  }
}

void __63__HDWorkoutSessionServer__queue_startLatestActivityUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = objc_opt_class();
    id v2 = objc_loadWeakRetained(WeakRetained + 1);
    id v3 = [v2 database];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__HDWorkoutSessionServer__queue_latestActivityUpdateTimerDidFire__block_invoke;
    v8[3] = &unk_1E62F6130;
    v8[4] = WeakRetained;
    id v9 = 0;
    char v4 = [v1 performWriteTransactionWithHealthDatabase:v3 error:&v9 block:v8];
    id v5 = v9;

    if ((v4 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v6 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v11 = WeakRetained;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update latest activity date in workout session entity: %{public}@", buf, 0x16u);
      }
    }
  }
}

uint64_t __65__HDWorkoutSessionServer__queue_latestActivityUpdateTimerDidFire__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) updateLatestActivityDateWithTransaction:a2 error:a3];
}

- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(HDHealthStoreClient *)self->_client hasEntitlement:*MEMORY[0x1E4F29750]])
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      applicationIdentifier = self->_applicationIdentifier;
      int v23 = 138543618;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      int v26 = applicationIdentifier;
      uint64_t v7 = "%{public}@: Workout session allowed to start for %{public}@ because it has private entitlement";
LABEL_7:
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v23, 0x16u);
      return 1;
    }
    return 1;
  }
  if (self->_isRecovering)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_applicationIdentifier;
      int v23 = 138543618;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      int v26 = v8;
      uint64_t v7 = "%{public}@: Workout session allowed to start for %{public}@ because it is in recovery";
      goto LABEL_7;
    }
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  __int16 v12 = [WeakRetained workoutManager];
  char v13 = [v12 allowBackgroundStartForApplicationIdentifier:self->_applicationIdentifier];

  if (v13) {
    return 1;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v15 = [v14 daemon];
  uint64_t v16 = [v15 processStateManager];

  if ([v16 isApplicationFrontBoardVisibleForBundleIdentifier:self->_applicationIdentifier])
  {
    _HKInitializeLogging();
    uint64_t v17 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = self->_applicationIdentifier;
      int v23 = 138543618;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      int v26 = v18;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@", (uint8_t *)&v23, 0x16u);
    }
    BOOL v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 14, @"Client application cannot start a workout session while in the background");
    uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    uint64_t v20 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v23 = 138543618;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      int v26 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    __int16 v21 = v19;
    id v22 = v21;
    BOOL v9 = v21 == 0;
    if (v21)
    {
      if (a3) {
        *a3 = v21;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (HDWorkoutSessionTaskServer)taskServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);

  return (HDWorkoutSessionTaskServer *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (HDWorkoutSessionRapportSyncController)syncController
{
  return self->_syncController;
}

- (BOOL)clientDidSetupSession
{
  return self->_clientDidSetupSession;
}

- (void)setClientDidSetupSession:(BOOL)a3
{
  self->_clientDidSetupSession = a3;
}

- (NSString)clientProcessBundleIdentifier
{
  return self->_clientProcessBundleIdentifier;
}

- (HKSource)clientSource
{
  return self->_clientSource;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (int64_t)numberOfHeartbeatFailures
{
  return self->_numberOfHeartbeatFailures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_taskServer);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstActivityConfiguration, 0);
  objc_storeStrong((id *)&self->_requestedEndDate, 0);
  objc_storeStrong((id *)&self->_requestedStartDate, 0);
  objc_storeStrong((id *)&self->_extendedPauseTimer, 0);
  objc_storeStrong((id *)&self->_latestActivityUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentWorkoutSnapshot, 0);
  objc_storeStrong((id *)&self->_targetStateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_persistentEntity, 0);
  objc_storeStrong((id *)&self->_invalidationAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end