@interface HDWorkoutSessionTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
+ (uint64_t)_getRecoveredWorkoutSessionServer:(void *)a3 forConfiguration:(void *)a4 client:(void *)a5 error:;
- (BOOL)requiresCoreLocationAssertion;
- (BOOL)shouldStopPreviousSession;
- (BOOL)supports3rdPartyAOT;
- (BOOL)supportsAppRelaunchForRecovery;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (HKDataFlowLink)workoutDataFlowLink;
- (HKSource)clientSource;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)sessionType;
- (unint64_t)workoutDataDestinationState;
- (void)_fetchOrSetupServerWithCompletion:(uint64_t)a1;
- (void)addMetadata:(id)a3 dataSource:(id)a4;
- (void)addOtherSamples:(id)a3 dataSource:(id)a4;
- (void)addQuantities:(id)a3 dataSource:(id)a4;
- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4;
- (void)connectionConfigured;
- (void)connectionInvalidated;
- (void)didBeginActivity:(id)a3 dataSource:(id)a4;
- (void)didDisconnectFromRemoteWithError:(id)a3;
- (void)didEndActivity:(id)a3 dataSource:(id)a4;
- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)didSuggestActivity:(id)a3 dataSource:(id)a4;
- (void)didSyncCurrentActivity:(id)a3;
- (void)didSyncStateEvent:(int64_t)a3 date:(id)a4;
- (void)didSyncTransitionToNewState:(int64_t)a3 date:(id)a4;
- (void)observeWorkoutSessionServer:(id)a3;
- (void)remoteSessionDidRecover;
- (void)remote_beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 completion:(id)a6;
- (void)remote_enableAutomaticDetectionForActivityConfigurations:(id)a3 completion:(id)a4;
- (void)remote_endCurrentActivityOnDate:(id)a3 completion:(id)a4;
- (void)remote_recoverWithCompletion:(id)a3;
- (void)remote_sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4;
- (void)remote_setTargetState:(int64_t)a3 date:(id)a4 completion:(id)a5;
- (void)remote_setupMirroredSessionWithHandler:(id)a3;
- (void)remote_setupTaskServerWithCompletion:(id)a3;
- (void)remote_startMirroringToCompanionDeviceWithCompletion:(id)a3;
- (void)remote_stopMirroringToCompanionDeviceWithCompletion:(id)a3;
- (void)remote_syncSessionEvent:(int64_t)a3 date:(id)a4;
- (void)setAssociatedWorkoutBuilderEntity:(id)a3;
- (void)setWorkoutDataAccumulator:(id)a3;
- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4;
- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4;
- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
- (void)workoutSession:(id)a3 didFailWithError:(id)a4;
@end

@implementation HDWorkoutSessionTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2AB48];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 sessionUUID];

  if (v10)
  {
    v10 = [v8 workoutConfiguration];
    int v11 = [v10 validateIgnoringDeviceSupport:0 error:a5];

    LOBYTE(v10) = 0;
    if (v11)
    {
      v12 = [v8 workoutConfiguration];
      v13 = [v12 fitnessPlusCatalogWorkoutId];

      if (v13 && ![v9 hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:a5]) {
        LOBYTE(v10) = 0;
      }
      else {
        LOBYTE(v10) = +[HDWorkoutSessionTaskServer _getRecoveredWorkoutSessionServer:forConfiguration:client:error:]((uint64_t)a1, &v15, v8, v9, a5);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing session UUID");
  }

  return (char)v10;
}

+ (uint64_t)_getRecoveredWorkoutSessionServer:(void *)a3 forConfiguration:(void *)a4 client:(void *)a5 error:
{
  id v8 = a3;
  id v9 = a4;
  self;
  v10 = [v9 profile];

  int v11 = [v10 workoutManager];
  v12 = [v8 sessionUUID];
  id v18 = 0;
  v13 = [v11 recoveredWorkoutSessionServerWithIdentifier:v12 error:&v18];
  id v14 = v18;

  if (v13 || !v14)
  {
    int v16 = [v8 requiresRecovery];
    if (v13 || !v16)
    {
      *a2 = v13;
      uint64_t v15 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Session requires recovery but no matching session record was found.");
LABEL_10:
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  if (!a5)
  {
    _HKLogDroppedError();
    goto LABEL_10;
  }
  uint64_t v15 = 0;
  *a5 = v14;
LABEL_11:

  return v15;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v37 = 0;
  int v16 = +[HDWorkoutSessionTaskServer _getRecoveredWorkoutSessionServer:forConfiguration:client:error:]((uint64_t)a1, &v37, v13, v14, a7);
  id v17 = v37;
  id v18 = v37;
  v19 = 0;
  if (v16)
  {
    v20 = [v14 profile];
    v21 = [v20 sourceManager];

    v22 = [v21 createOrUpdateSourceForClient:v14 error:a7];
    if (v22)
    {
      v23 = [v21 clientSourceForSourceEntity:v22 error:a7];
      if (v23)
      {
        v19 = [HDWorkoutSessionTaskServer alloc];
        id v24 = v13;
        v25 = v23;
        id v26 = v24;
        v33 = v25;
        id v36 = v25;
        v34 = v26;
        id v35 = v18;
        if (v19)
        {
          v38.receiver = v19;
          v38.super_class = (Class)HDWorkoutSessionTaskServer;
          v27 = objc_msgSendSuper2(&v38, sel_initWithUUID_configuration_client_delegate_, v12, v26, v14, v15);
          v19 = v27;
          if (v27)
          {
            v27->_lock._os_unfair_lock_opaque = 0;
            uint64_t v28 = [v26 copy];
            taskConfiguration = v19->_taskConfiguration;
            v19->_taskConfiguration = (HKWorkoutSessionTaskConfiguration *)v28;

            uint64_t v30 = [v36 copy];
            clientSource = v19->_clientSource;
            v19->_clientSource = (HKSource *)v30;

            if (v35) {
              objc_storeStrong((id *)&v19->_sessionServer, v17);
            }
          }
        }
        v23 = v33;
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (void)connectionConfigured
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)MEMORY[0x1E4F29FB8];
  v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    sessionServer = self->_sessionServer;
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = sessionServer;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection configured with session server: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  _HKInitializeLogging();
  v6 = (HKDataFlowLink *)[objc_alloc(MEMORY[0x1E4F2AEC0]) initWithProcessor:self sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*v3];
  workoutDataFlowLink = self->_workoutDataFlowLink;
  self->_workoutDataFlowLink = v6;

  id v8 = self->_sessionServer;
  if (v8)
  {
    id v9 = self->_workoutDataFlowLink;
    v10 = [(HDWorkoutSessionServer *)v8 workoutDataFlowLink];
    [(HKDataFlowLink *)v9 addSource:v10];

    [(HDWorkoutSessionServer *)self->_sessionServer setTaskServer:self];
    [(HDWorkoutSessionServer *)self->_sessionServer addObserver:self queue:0];
  }
}

- (int64_t)sessionType
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration sessionType];
}

- (BOOL)requiresCoreLocationAssertion
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration requiresCoreLocationAssertion];
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration supportsAppRelaunchForRecovery];
}

- (BOOL)shouldStopPreviousSession
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration shouldStopPreviousSession];
}

- (BOOL)supports3rdPartyAOT
{
  return [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration supports3rdPartyAOT];
}

- (void)setAssociatedWorkoutBuilderEntity:(id)a3
{
  v4 = (HDWorkoutBuilderEntity *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  builderEntity = self->_builderEntity;
  self->_builderEntity = v4;
  id v8 = v4;

  v7 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  [(HDWorkoutSessionServer *)v7 setAssociatedWorkoutBuilderEntity:v8];
}

- (void)setWorkoutDataAccumulator:(id)a3
{
  p_lock = &self->_lock;
  id obj = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_accumulator, obj);
  v5 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  [(HDWorkoutSessionServer *)v5 setWorkoutDataAccumulator:obj];
}

- (void)remote_setupTaskServerWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HDWorkoutSessionTaskServer_remote_setupTaskServerWithCompletion___block_invoke;
  v6[3] = &unk_1E62FA1A8;
  id v7 = v4;
  id v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);
}

uint64_t __67__HDWorkoutSessionTaskServer_remote_setupTaskServerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

- (void)_fetchOrSetupServerWithCompletion:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(id *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v4)
    {
      v3[2](v3, v4, 0);
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke;
      aBlock[3] = &unk_1E62FA270;
      aBlock[4] = a1;
      id v5 = _Block_copy(aBlock);
      uint64_t v6 = [*(id *)(a1 + 48) sessionType];
      id v7 = [(id)a1 profile];
      id v8 = [v7 workoutManager];
      if (v6 == 1)
      {
        id v9 = [(id)a1 taskUUID];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke_424;
        v12[3] = &unk_1E62FA298;
        id v13 = v5;
        id v14 = v3;
        [v8 mirroredSessionServerWithUUID:v9 completion:v12];

        id v4 = 0;
      }
      else
      {
        v10 = [*(id *)(a1 + 48) workoutConfiguration];
        int v11 = [(id)a1 taskUUID];
        id v4 = [v8 sessionServerWithConfiguration:v10 sessionUUID:v11 clientBundleIdentifier:0 taskServer:a1];

        (*((void (**)(void *, id))v5 + 2))(v5, v4);
        v3[2](v3, v4, 0);
      }
    }
  }
}

- (void)remote_setupMirroredSessionWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__HDWorkoutSessionTaskServer_remote_setupMirroredSessionWithHandler___block_invoke;
  v6[3] = &unk_1E62FA220;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);
}

void __69__HDWorkoutSessionTaskServer_remote_setupMirroredSessionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F2B9B0];
    id v7 = a3;
    id v8 = [v6 alloc];
    [v5 state];
    uint64_t v9 = HKWorkoutSessionStateFromServerState();
    v10 = [v5 startDate];
    int v11 = [v5 stopDate];
    id v12 = [v5 currentActivity];
    id v13 = (id)[v8 _initWithSessionState:v9 startDate:v10 endDate:v11 currentActivity:v12];

    _HKInitializeLogging();
    id v14 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = v14;
      int v19 = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = [v13 sessionState];
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Setting up mirrored session server with session state:%ld", (uint8_t *)&v19, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = *(void (**)(uint64_t, void, id))(v17 + 16);
    id v13 = a3;
    v18(v17, 0, v13);
  }
}

- (void)remote_setTargetState:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionTaskServer_remote_setTargetState_date_completion___block_invoke;
  v12[3] = &unk_1E62FA1D0;
  id v14 = v9;
  int64_t v15 = a3;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v12);
}

void __68__HDWorkoutSessionTaskServer_remote_setTargetState_date_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    id v10 = v5;
    [a2 setTargetState:v7 date:v8 error:&v10];
    id v9 = v10;

    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v6 = v9;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)remote_syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HDWorkoutSessionTaskServer_remote_syncSessionEvent_date___block_invoke;
  v8[3] = &unk_1E62FA1F8;
  id v10 = self;
  int64_t v11 = a3;
  id v9 = v6;
  id v7 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v8);
}

void __59__HDWorkoutSessionTaskServer_remote_syncSessionEvent_date___block_invoke(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[4];
    [a2 syncSessionEvent:v3 date:v4];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[5];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to sync session event because there is no session server", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke;
  v6[3] = &unk_1E62FA220;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);
}

void __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_2;
    v13[3] = &unk_1E62F3170;
    v13[4] = v4;
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v13];
    [v3 state];
    uint64_t v6 = HKWorkoutSessionStateFromServerState();
    id v7 = [v3 startDate];
    if (!v7)
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_fault_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_FAULT, "Session server %{public}@ start date is nil", buf, 0xCu);
      }
    }
    objc_msgSend(v5, "client_didChangeToState:date:", v6, v7);
    uint64_t v9 = [v3 startDate];
    id v10 = [v3 stopDate];
    objc_msgSend(v5, "client_didUpdateStartDate:endDate:", v9, v10);

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_394;
    v11[3] = &unk_1E62F29A0;
    id v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "client_synchronizeWithCompletion:", v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of start date: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_394(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__HDWorkoutSessionTaskServer_remote_beginNewActivityWithConfiguration_date_metadata_completion___block_invoke;
  v18[3] = &unk_1E62FA248;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v18);
}

void __96__HDWorkoutSessionTaskServer_remote_beginNewActivityWithConfiguration_date_metadata_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (a2)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    id v11 = v5;
    [a2 beginNewActivityWithConfiguration:v7 date:v8 metadata:v9 error:&v11];
    id v10 = v11;

    int v6 = v10;
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)remote_endCurrentActivityOnDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HDWorkoutSessionTaskServer_remote_endCurrentActivityOnDate_completion___block_invoke;
  v10[3] = &unk_1E62FA220;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);
}

void __73__HDWorkoutSessionTaskServer_remote_endCurrentActivityOnDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v5;
    [a2 endCurrentActivityOnDate:v7 error:&v9];
    id v8 = v9;

    id v6 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remote_enableAutomaticDetectionForActivityConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__HDWorkoutSessionTaskServer_remote_enableAutomaticDetectionForActivityConfigurations_completion___block_invoke;
  v10[3] = &unk_1E62FA220;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);
}

void __98__HDWorkoutSessionTaskServer_remote_enableAutomaticDetectionForActivityConfigurations_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v5;
    [a2 enableAutomaticDetectionForActivityConfigurations:v7 error:&v9];
    id v8 = v9;

    id v6 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remote_startMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ([(HDWorkoutSessionTaskServer *)self sessionType])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot start mirroring from a mirrored session");
    v4[2](v4, 0, v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__HDWorkoutSessionTaskServer_remote_startMirroringToCompanionDeviceWithCompletion___block_invoke;
    v6[3] = &unk_1E62FA1A8;
    uint64_t v7 = v4;
    -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);
  }
}

void __83__HDWorkoutSessionTaskServer_remote_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    [a2 startMirroringToCompanionDeviceWithCompletion:*(void *)(a1 + 32)];
    id v5 = v7;
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Session server is nil.");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = (void *)v6;
  }
}

- (void)remote_stopMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ([(HDWorkoutSessionTaskServer *)self sessionType])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot stop mirroring from a mirrored session");
    v4[2](v4, 0, v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__HDWorkoutSessionTaskServer_remote_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
    v6[3] = &unk_1E62FA1A8;
    id v7 = v4;
    -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);
  }
}

void __82__HDWorkoutSessionTaskServer_remote_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    [a2 stopMirroringToCompanionDeviceWithCompletion:*(void *)(a1 + 32)];
    id v5 = v7;
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Session server is nil.");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = (void *)v6;
  }
}

- (void)remote_sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HDWorkoutSessionTaskServer_remote_sendDataToRemoteWorkoutSession_completion___block_invoke;
  v10[3] = &unk_1E62FA220;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);
}

void __79__HDWorkoutSessionTaskServer_remote_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    [a2 sendDataToRemoteWorkoutSession:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id v5 = v7;
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Session server is nil.");

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = (void *)v6;
  }
}

- (void)observeWorkoutSessionServer:(id)a3
{
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__HDWorkoutSessionTaskServer_workoutSession_didChangeToState_fromState_date___block_invoke;
  v15[3] = &unk_1E62F3170;
  v15[4] = self;
  id v10 = a3;
  id v11 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v15];
  id v12 = [v10 startDate];
  id v13 = [v10 stopDate];

  objc_msgSend(v11, "client_didUpdateStartDate:endDate:", v12, v13);
  if ((unint64_t)a4 <= 0x11 && ((1 << a4) & 0x3E1C2) != 0)
  {
    objc_msgSend(v11, "client_didChangeToState:date:", HKWorkoutSessionStateFromServerState(), v9);
    if (!v9)
    {
      _HKInitializeLogging();
      id v14 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = self;
        _os_log_fault_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_FAULT, "Session task server %{public}@ state change date is nil", buf, 0xCu);
      }
    }
  }
}

void __77__HDWorkoutSessionTaskServer_workoutSession_didChangeToState_fromState_date___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of state change: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HDWorkoutSessionTaskServer_workoutSession_didFailWithError___block_invoke;
  v7[3] = &unk_1E62F3170;
  v7[4] = self;
  id v5 = a4;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v7];
  objc_msgSend(v6, "client_didFailWithError:", v5);
}

void __62__HDWorkoutSessionTaskServer_workoutSession_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of failure: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (unint64_t)workoutDataDestinationState
{
  return 1;
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accumulator);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id WeakRetained = 0;
  }

  return (HDWorkoutDataAccumulator *)WeakRetained;
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HDWorkoutSessionTaskServer_addQuantities_dataSource___block_invoke;
  v8[3] = &unk_1E62F3148;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

uint64_t __55__HDWorkoutSessionTaskServer_addQuantities_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addQuantities:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HDWorkoutSessionTaskServer_addOtherSamples_dataSource___block_invoke;
  v8[3] = &unk_1E62F3148;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

uint64_t __57__HDWorkoutSessionTaskServer_addOtherSamples_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addOtherSamples:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke;
  v13[3] = &unk_1E62F3170;
  v13[4] = self;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v13];
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = self;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Notifying client of generated event", buf, 0xCu);
  }
  objc_msgSend(v6, "client_didGenerateEvents:", v5);
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke_406;
  v10[3] = &unk_1E62F3148;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v10];
}

void __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of generated events: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke_406(uint64_t a1, void *a2)
{
  return [a2 addWorkoutEvents:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HDWorkoutSessionTaskServer_addMetadata_dataSource___block_invoke;
  v8[3] = &unk_1E62F3148;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

uint64_t __53__HDWorkoutSessionTaskServer_addMetadata_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke;
  v12[3] = &unk_1E62F3170;
  void v12[4] = self;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v12];
  objc_msgSend(v6, "client_didUpdateWorkoutConfiguration:", v5);
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke_407;
  v9[3] = &unk_1E62F3148;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v9];
}

void __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke_407(uint64_t a1, void *a2)
{
  return [a2 updateWorkoutConfiguration:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)didBeginActivity:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke;
  v13[3] = &unk_1E62F3170;
  v13[4] = self;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v13];
  uint64_t v7 = [v5 startDate];
  objc_msgSend(v6, "client_didBeginActivity:date:", v5, v7);

  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke_408;
  v10[3] = &unk_1E62F3148;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v10];
}

void __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke_408(uint64_t a1, void *a2)
{
  return [a2 didBeginActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)didEndActivity:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke;
  v13[3] = &unk_1E62F3170;
  v13[4] = self;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v13];
  uint64_t v7 = [v5 endDate];
  objc_msgSend(v6, "client_didEndActivity:date:", v5, v7);

  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke_409;
  v10[3] = &unk_1E62F3148;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v10];
}

void __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke_409(uint64_t a1, void *a2)
{
  return [a2 didEndActivity:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)didSuggestActivity:(id)a3 dataSource:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HDWorkoutSessionTaskServer_didSuggestActivity_dataSource___block_invoke;
  v9[3] = &unk_1E62F3170;
  void v9[4] = self;
  id v5 = a3;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v9];
  uint64_t v7 = [v5 workoutConfiguration];
  __int16 v8 = [v5 startDate];

  objc_msgSend(v6, "client_didSuggestWorkoutConfiguration:date:", v7, v8);
}

void __60__HDWorkoutSessionTaskServer_didSuggestActivity_dataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of suggested workout configuration : %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __80__HDWorkoutSessionTaskServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  id v15 = &unk_1E62F6C98;
  uint64_t v16 = self;
  id v8 = v7;
  id v17 = v8;
  id v9 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:&v12];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "client_didReceiveDataFromRemoteWorkoutSession:completion:", v6, v8, v12, v13, v14, v15, v16);
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"No client to notify of received data from remote session", v12, v13, v14, v15, v16);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

void __80__HDWorkoutSessionTaskServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of received data from remote session: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)didSyncStateEvent:(int64_t)a3 date:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HDWorkoutSessionTaskServer_didSyncStateEvent_date___block_invoke;
  v9[3] = &unk_1E62F3170;
  void v9[4] = self;
  id v6 = a4;
  uint64_t v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v9];
  _HKInitializeLogging();
  __int16 v8 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2048;
    int64_t v13 = a3;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of synced state event: %ld ", buf, 0x16u);
  }
  objc_msgSend(v7, "client_didSyncSessionEvent:date:", a3, v6);
}

void __53__HDWorkoutSessionTaskServer_didSyncStateEvent_date___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of synced state event: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didSyncTransitionToNewState:(int64_t)a3 date:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HDWorkoutSessionTaskServer_didSyncTransitionToNewState_date___block_invoke;
  v15[3] = &unk_1E62F3170;
  v15[4] = self;
  uint64_t v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v15];
  _HKInitializeLogging();
  __int16 v8 = (os_log_t *)MEMORY[0x1E4F29FB8];
  id v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = HKWorkoutSessionStateToString();
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of state: %{public}@ update from remote session", buf, 0x16u);
  }
  if (!v6)
  {
    _HKInitializeLogging();
    os_log_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      int64_t v13 = v12;
      uint64_t v14 = HKWorkoutSessionStateToString();
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v14;
      _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "Task server %{public}@ received a nil state change from mirrored session for state: %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v7, "client_didChangeToState:date:", a3, v6);
}

void __63__HDWorkoutSessionTaskServer_didSyncTransitionToNewState_date___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of state update from remote session : %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didSyncCurrentActivity:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __53__HDWorkoutSessionTaskServer_didSyncCurrentActivity___block_invoke;
  uint64_t v10 = &unk_1E62F91D0;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  int v6 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:&v7];
  objc_msgSend(v6, "client_didSyncCurrentActivity:", v5, v7, v8, v9, v10, v11);
}

void __53__HDWorkoutSessionTaskServer_didSyncCurrentActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of synced activity: %{public}@, error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)remoteSessionDidRecover
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__HDWorkoutSessionTaskServer_remoteSessionDidRecover__block_invoke;
  v3[3] = &unk_1E62F3170;
  v3[4] = self;
  v2 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v3];
  objc_msgSend(v2, "client_remoteSessionDidRecover");
}

void __53__HDWorkoutSessionTaskServer_remoteSessionDidRecover__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of remote session recovery: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke;
  v7[3] = &unk_1E62F3170;
  v7[4] = self;
  id v4 = a3;
  uint64_t v5 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke_413;
  v6[3] = &unk_1E62F2978;
  void v6[4] = self;
  objc_msgSend(v5, "client_didDisconnectFromRemoteWithError:completion:", v4, v6);
}

void __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of remote session disconnection: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke_413(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  int v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    __int16 v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      __int16 v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notified client of remote session disconnection with success: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  p_lock = &self->_lock;
  __int16 v13 = (void (**)(id, uint64_t, void))a6;
  os_unfair_lock_lock(&self->_lock);
  id v14 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  if (v14) {
    [(HDWorkoutSessionServer *)v14 workoutDataDestination:v15 requestsFinalDataFrom:v10 to:v11 completion:v13];
  }
  else {
    v13[2](v13, 1, 0);
  }
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HKWorkoutSessionTaskConfiguration *)self->_taskConfiguration setWorkoutConfiguration:a4];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    taskConfiguration = self->_taskConfiguration;
    uint64_t v7 = v5;
    __int16 v8 = [(HKWorkoutSessionTaskConfiguration *)taskConfiguration workoutConfiguration];
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@:Updated workout configuration : %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int16 v8 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  if (v8) {
    [(HDWorkoutSessionServer *)v8 workoutDataDestination:v9 didInsertEvent:v6];
  }
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B7C0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B7C0] clientInterface];
}

- (void)connectionInvalidated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    sessionServer = self->_sessionServer;
    *(_DWORD *)buf = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = sessionServer;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated with current session server: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_sessionServer;
  self->_sessionServer = 0;
  id v6 = v5;

  os_unfair_lock_unlock(&self->_lock);
  [(HDWorkoutSessionServer *)v6 invalidateTaskServer:self];
  v7.receiver = self;
  v7.super_class = (Class)HDWorkoutSessionTaskServer;
  [(HDStandardTaskServer *)&v7 connectionInvalidated];
}

void __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v4 || *(void *)(v5 + 56))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  }
  else
  {
    objc_storeStrong((id *)(v5 + 56), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(v7 + 56);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: New session server set %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [v4 setTaskServer:*(void *)(a1 + 32)];
    [v4 addObserver:*(void *)(a1 + 32) queue:0];
    id v9 = *(void **)(*(void *)(a1 + 32) + 64);
    __int16 v10 = [v4 workoutDataFlowLink];
    [v9 addSource:v10];

    if (*(void *)(*(void *)(a1 + 32) + 72)) {
      objc_msgSend(v4, "setAssociatedWorkoutBuilderEntity:");
    }
  }
}

void __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke_424(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, id))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5, v8);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HKSource)clientSource
{
  return self->_clientSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_destroyWeak((id *)&self->_accumulator);
  objc_storeStrong((id *)&self->_builderEntity, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_sessionServer, 0);

  objc_storeStrong((id *)&self->_taskConfiguration, 0);
}

@end