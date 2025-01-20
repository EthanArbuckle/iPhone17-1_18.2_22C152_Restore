@interface HDHealthStoreServer
+ (void)_authenticateWithGuard:(id)a3 completion:(id)a4;
+ (void)authenticateWithCompletion:(id)a3;
- (HDDaemon)daemon;
- (HDHealthStoreClient)client;
- (HDHealthStoreServer)initWithClient:(id)a3 profile:(id)a4 configuration:(id)a5 connectionQueue:(id)a6;
- (HDProfile)profile;
- (HKHealthStoreConfiguration)configuration;
- (id)_authorizationPromptHandler;
- (id)_clientRemoteObjectProxy;
- (id)_objectsToInsertWithObjects:(uint64_t)a3 error:;
- (id)_permissionBlockForRestrictedSourceEntities:(void *)a1;
- (id)_queue_objectsByProvenanceForInsertion:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(uint64_t)a5 error:;
- (id)clientDebuggingIdentifier;
- (id)clientSourceWithError:(id *)a3;
- (id)diagnosticDescription;
- (id)objectAuthorizationPromptHandler;
- (uint64_t)_queue_insertObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(char)a5 shouldJournal:(char)a6 skipInsertionFilter:(uint64_t)a7 error:(void *)a8 creationDate:;
- (void)_lock_cancelActiveClientTransaction;
- (void)_performIfAuthorizedToDeleteObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5;
- (void)_performIfAuthorizedToSaveObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5;
- (void)_remote_associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5;
- (void)_remote_saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6;
- (void)_requireEntitlement:(void *)a3 usingBlock:(void *)a4 errorHandler:;
- (void)_saveDataObjects:(id)a3 sourceEntity:(id)a4 sourceVersion:(id)a5 handler:(id)a6;
- (void)_saveDataObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersion:(char)a5 skipInsertionFilter:(void *)a6 handler:(void *)a7 creationDate:;
- (void)_serverActivityChanged;
- (void)conceptIndexManagerDidBecomeQuiescent:(id)a3 samplesProcessedCount:(int64_t)a4;
- (void)invalidate;
- (void)performIfAuthorizedToDeleteObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5;
- (void)performIfAuthorizedToSaveObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5;
- (void)remote_addSamples:(id)a3 toWorkout:(id)a4 completion:(id)a5;
- (void)remote_authorizationStatusForType:(id)a3 completion:(id)a4;
- (void)remote_beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 handler:(id)a4;
- (void)remote_clientResumedWithCompletion:(id)a3;
- (void)remote_clientWillSuspendWithCompletion:(id)a3;
- (void)remote_closeTransactionWithDataTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5 completion:(id)a6;
- (void)remote_createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 completion:(id)a7;
- (void)remote_createTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 completion:(id)a8;
- (void)remote_deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)remote_deleteClientSourceWithCompletion:(id)a3;
- (void)remote_deleteDataObjects:(id)a3 options:(unint64_t)a4 handler:(id)a5;
- (void)remote_deleteDataObjectsOfType:(id)a3 matchingFilter:(id)a4 options:(unint64_t)a5 handler:(id)a6;
- (void)remote_deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_dropEntitlement:(id)a3 completion:(id)a4;
- (void)remote_endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4;
- (void)remote_fetchCharacteristicWithDataType:(id)a3 handler:(id)a4;
- (void)remote_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4;
- (void)remote_fetchModificationDateForCharacteristicWithDataType:(id)a3 handler:(id)a4;
- (void)remote_fetchPluginServiceEndpointWithIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchServerURLForAssetType:(id)a3 completion:(id)a4;
- (void)remote_fetchUnitPreferencesForTypes:(id)a3 version:(int64_t)a4 withCompletion:(id)a5;
- (void)remote_getAllHealthDataAccessForSiriWithCompletion:(id)a3;
- (void)remote_getHealthLiteValueForKey:(id)a3 completion:(id)a4;
- (void)remote_getIsFeatureSetAvailable:(unint64_t)a3 completion:(id)a4;
- (void)remote_getRequestStatusForAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5;
- (void)remote_handleAuthorizationForExtensionWithCompletion:(id)a3;
- (void)remote_isProtectedDataAvailable:(id)a3;
- (void)remote_recalibrateEstimatesForSampleType:(id)a3 atDate:(id)a4 completion:(id)a5;
- (void)remote_recoverActiveWorkoutSessionWithCompletion:(id)a3;
- (void)remote_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 workoutActivity:(id)a5 samples:(id)a6 completion:(id)a7;
- (void)remote_relateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)remote_removePreferredUnitForType:(id)a3 completion:(id)a4;
- (void)remote_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5;
- (void)remote_requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6;
- (void)remote_requestPerObjectReadAuthorizationForType:(id)a3 filter:(id)a4 completion:(id)a5;
- (void)remote_restoreEntitlement:(id)a3 completion:(id)a4;
- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 creationDateOverride:(id)a5 handler:(id)a6;
- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 transactionIdentifier:(id)a5 final:(BOOL)a6 handler:(id)a7;
- (void)remote_setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4;
- (void)remote_setBackgroundDeliveryFrequency:(int64_t)a3 forDataType:(id)a4 handler:(id)a5;
- (void)remote_setCharacteristic:(id)a3 forDataType:(id)a4 handler:(id)a5;
- (void)remote_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 completion:(id)a4;
- (void)remote_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5;
- (void)remote_setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5;
- (void)remote_splitTotalCalories:(double)a3 timeInterval:(double)a4 withCompletion:(id)a5;
- (void)remote_startWatchAppWithWorkoutConfiguration:(id)a3 completion:(id)a4;
- (void)remote_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5;
- (void)remote_unrelateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)saveSamples:(id)a3 withCompletion:(id)a4;
- (void)start;
- (void)taskServerDidFailToInitializeForUUID:(id)a3;
- (void)taskServerDidInvalidate:(id)a3;
- (void)unitPreferencesManagerDidUpdateUnitPreferences:(id)a3;
- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4;
@end

@implementation HDHealthStoreServer

- (void)start
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 addObject:self];

  v4 = [(HDProfile *)self->_profile unitPreferencesManager];
  [v4 addUnitPreferenceObserver:self queue:self->_queue];

  id v5 = [(HDProfile *)self->_profile conceptIndexManager];
  [v5 addObserver:self];
}

- (HKHealthStoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)_requireEntitlement:(void *)a3 usingBlock:(void *)a4 errorHandler:
{
  id v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:sel__requireEntitlement_usingBlock_errorHandler_, a1, @"HDHealthStoreServer.m", 200, @"Invalid parameter not satisfying: %@", @"entitlement != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
LABEL_11:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:sel__requireEntitlement_usingBlock_errorHandler_, a1, @"HDHealthStoreServer.m", 201, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_11;
  }
LABEL_4:
  v10 = *(void **)(a1 + 88);
  id v15 = 0;
  int v11 = [v10 hasRequiredEntitlement:v7 error:&v15];
  id v12 = v15;
  if (v11)
  {
    v8[2](v8);
  }
  else if (v9)
  {
    v9[2](v9, v12);
  }

LABEL_9:
}

- (void)remote_fetchCharacteristicWithDataType:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      clientAuthorizationOracle = self->_clientAuthorizationOracle;
      queue = self->_queue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke;
      v14[3] = &unk_1E630D2F0;
      v14[4] = self;
      id v15 = v7;
      id v16 = v8;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_3;
      v12[3] = &unk_1E62FFD78;
      id v13 = v16;
      [(HDClientAuthorizationOracle *)clientAuthorizationOracle performIfAuthorizedToReadTypes:v9 onQueue:queue usingBlock:v14 errorHandler:v12];
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"dataType may not be nil"");
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v9);
    }
  }
}

void __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__195;
  v17 = __Block_byref_object_dispose__195;
  id v18 = 0;
  v4 = [*(id *)(a1[4] + 72) database];
  int v11 = &v13;
  id v12 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_2;
  v9[3] = &unk_1E62FA2E8;
  id v5 = (void *)a1[5];
  v9[4] = a1[4];
  id v10 = v5;
  [v4 performHighPriorityTransactionsWithError:&v12 block:v9];
  id v6 = v12;

  (*(void (**)(void, uint64_t, id, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v14[5], v6, v7, v8);
  _Block_object_dispose(&v13, 8);
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void)remote_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke;
  v13[3] = &unk_1E62F3CA8;
  id v15 = v7;
  id v8 = v6;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke_2;
  v11[3] = &unk_1E62FFD78;
  id v9 = v15;
  id v12 = v9;
  id v10 = v9;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v13, v11);
    id v10 = v12;
  }
}

void __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F2B898] valueForKey:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)remote_clientResumedWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEBUG))
  {
    client = self->_client;
    id v8 = v5;
    id v9 = [(HDHealthStoreClient *)client process];
    id v10 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "HDHealthStoreServer resuming connection with %{public}@", buf, 0xCu);

    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__HDHealthStoreServer_remote_clientResumedWithCompletion___block_invoke;
    v11[3] = &unk_1E62F4928;
    void v11[4] = self;
    id v12 = v4;
    dispatch_sync(queue, v11);
  }
LABEL_4:
}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEBUG))
  {
    id v6 = "canceled";
    uint64_t v7 = *(void *)(a1 + 32);
    if (a2) {
      id v6 = "timed out";
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2080;
    int v11 = v6;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Client resume transaction timer for %@ %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_serverActivityChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HDHealthStoreServer__serverActivityChanged__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__HDHealthStoreServer__serverActivityChanged__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && ([*(id *)(v1 + 48) hasActiveQueries] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
    -[HDHealthStoreServer _lock_cancelActiveClientTransaction](v1);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  }
}

uint64_t __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_2(void *a1, uint64_t a2)
{
  id v4 = [*(id *)(a1[4] + 72) userCharacteristicsManager];
  uint64_t v5 = [v4 userCharacteristicForType:a1[5] error:a2];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  id v4 = [(HDProfile *)self->_profile unitPreferencesManager];
  [v4 removeUnitPreferenceObserver:self];

  uint64_t v5 = [(HDProfile *)self->_profile conceptIndexManager];
  [v5 removeObserver:self];

  os_unfair_lock_lock(&self->_lock);
  -[HDHealthStoreServer _lock_cancelActiveClientTransaction]((uint64_t)self);
  [(HDHealthStoreClient *)self->_client invalidateAssertions];
  uint64_t v6 = [(HDHealthStoreClient *)self->_client connection];
  [v6 invalidate];

  [(HDQueryControlServer *)self->_queryControlServer invalidate];
  [(HDClientAuthorizationOracle *)self->_clientAuthorizationOracle invalidate];
  uint64_t v7 = [(NSMutableDictionary *)self->_taskServerEndpointsByUUID allValues];
  [(NSMutableDictionary *)self->_taskServerEndpointsByUUID removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "invalidate", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_clientAuthorizationOracle, 0);
  objc_storeStrong((id *)&self->_queryControlServer, 0);
  objc_storeStrong((id *)&self->_taskServerEndpointsByUUID, 0);
  objc_storeStrong((id *)&self->_clientTransactionTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)remote_clientWillSuspendWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29F88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEBUG))
  {
    client = self->_client;
    uint64_t v7 = v5;
    id v8 = [(HDHealthStoreClient *)client process];
    uint64_t v9 = [v8 bundleIdentifier];
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "HDHealthStoreServer suspending connection with %{public}@", (uint8_t *)&v10, 0xCu);

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDHealthStoreServer _lock_cancelActiveClientTransaction]((uint64_t)self);
    os_unfair_lock_unlock(&self->_lock);
  }
  v4[2](v4, 1, 0);
LABEL_6:
}

- (id)clientSourceWithError:(id *)a3
{
  uint64_t v5 = [(HDProfile *)self->_profile sourceManager];
  uint64_t v6 = [v5 createOrUpdateSourceForClient:self->_client error:a3];

  return v6;
}

- (void)_saveDataObjects:(id)a3 sourceEntity:(id)a4 sourceVersion:(id)a5 handler:(id)a6
{
}

- (id)_objectsToInsertWithObjects:(uint64_t)a3 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  if (!a3)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:sel__objectsToInsertWithObjects_error_, a1, @"HDHealthStoreServer.m", 1040, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  if (![v5 count])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 3, @"Array of HKObjects to save cannot be empty");
LABEL_17:
    id v19 = 0;
    goto LABEL_18;
  }
  id v22 = v5;
  objc_msgSend(MEMORY[0x1E4F2B298], "hd_allObjectsToInsertWithObjects:", v5);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id obj = v6;
    uint64_t v24 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = a3;
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v12 = [a1[10] applicationSDKVersionToken];
        [v11 _setSourceRevision:0];
        long long v13 = [a1[11] entitlements];
        long long v14 = [a1 profile];
        long long v15 = [v14 daemon];
        long long v16 = [v15 behavior];
        uint64_t v17 = [v16 isAppleWatch];
        uint64_t v18 = v12;
        a3 = v10;
        LODWORD(v11) = [v11 _validateForSavingWithClientEntitlements:v13 applicationSDKVersionToken:v18 isAppleWatch:v17 error:v10];

        if (!v11)
        {
          id v6 = obj;

          id v19 = 0;
          goto LABEL_15;
        }
      }
      id v6 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v19 = v6;
LABEL_15:

  id v5 = v22;
LABEL_18:

  return v19;
}

- (void)_performIfAuthorizedToSaveObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
}

- (id)_queue_objectsByProvenanceForInsertion:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(uint64_t)a5 error:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    uint64_t v12 = [WeakRetained behavior];

    uint64_t v13 = [v12 currentDeviceProductType];
    long long v14 = (void *)v13;
    long long v15 = @"UnknownDevice";
    if (v13) {
      long long v15 = (__CFString *)v13;
    }
    v59 = v15;

    uint64_t v16 = [v12 currentOSBuild];
    uint64_t v17 = (void *)v16;
    uint64_t v18 = @"UnknownBuild";
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    v58 = v18;

    long long v65 = 0uLL;
    uint64_t v66 = 0;
    if (v12) {
      [v12 currentOSVersionStruct];
    }
    if (v10)
    {
      id v57 = v10;
    }
    else
    {
      id v19 = [a1 client];
      id v57 = [v19 sourceVersion];
    }
    v45 = v12;
    id v42 = v10;
    id v43 = v9;
    v56 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
    v54 = [MEMORY[0x1E4F1CA60] dictionary];
    v50 = [a1[9] deviceManager];
    v55 = [a1[9] contributorManager];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v44 = v8;
    id obj = v8;
    uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v53)
    {
      v48 = 0;
      v49 = 0;
      uint64_t v52 = *(void *)v62;
      uint64_t v51 = *MEMORY[0x1E4F2A200];
      while (2)
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v62 != v52) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v22 = [v21 device];
          if (v22)
          {
            id v23 = [v50 deviceEntityForDevice:v22 error:a5];
            if (!v23) {
              goto LABEL_32;
            }
          }
          else
          {
            uint64_t v24 = v49;
            if (!v49)
            {
              uint64_t v24 = [v50 deviceEntityForNoDeviceWithError:a5];
            }
            id v23 = v24;
            v49 = v23;
            if (!v23)
            {
LABEL_32:
              _HKInitializeLogging();
              v37 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v22;
                _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_INFO, "Failed to retrieve device entity for device %{public}@", buf, 0xCu);
              }

              id v38 = 0;
              id v9 = v43;
              id v8 = v44;
              id v10 = v42;
              v39 = v45;
              v40 = v54;
              goto LABEL_37;
            }
          }
          v60 = v22;
          long long v25 = [v21 metadata];
          uint64_t v26 = [v25 objectForKeyedSubscript:v51];
          if (v26)
          {
            id v27 = (id)v26;
          }
          else
          {
            long long v28 = v48;
            if (!v48)
            {
              v29 = [v45 localTimeZone];
              long long v28 = [v29 name];
            }
            id v27 = v28;
            v48 = v27;
          }
          uint64_t v30 = [v55 defaultContributorReference];
          v31 = a1;
          uint64_t v32 = [a1[9] currentSyncIdentityPersistentID];
          v33 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v23, "persistentID"));
          *(_OWORD *)buf = v65;
          uint64_t v68 = v66;
          v34 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v32 productType:v59 systemBuild:v58 operatingSystemVersion:buf sourceVersion:v57 timeZoneName:v27 sourceID:v56 deviceID:v33 contributorReference:v30];

          v35 = v54;
          id v36 = [v54 objectForKeyedSubscript:v34];
          if (!v36)
          {
            id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v54 setObject:v36 forKeyedSubscript:v34];
          }
          [v36 addObject:v21];

          a1 = v31;
        }
        uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
        if (v53) {
          continue;
        }
        break;
      }
    }
    else
    {
      v48 = 0;
      v49 = 0;
      v35 = v54;
    }

    id v38 = v35;
    v40 = v35;
    id v9 = v43;
    id v8 = v44;
    id v10 = v42;
    v39 = v45;
LABEL_37:
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

+ (void)_authenticateWithGuard:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F4B7E0];
  uint64_t v7 = *MEMORY[0x1E4F2BDC0];
  id v8 = a3;
  id v9 = [v6 applicationWithBundleIdentifier:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke;
  v11[3] = &unk_1E62F29A0;
  id v12 = v5;
  id v10 = v5;
  [v8 authenticateForSubject:v9 completion:v11];
}

void __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (void)authenticateWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4B7E8];
  id v5 = a3;
  id v6 = [v4 sharedGuard];
  [a1 _authenticateWithGuard:v6 completion:v5];
}

- (HDHealthStoreServer)initWithClient:(id)a3 profile:(id)a4 configuration:(id)a5 connectionQueue:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HDHealthStoreServer.m", 138, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"HDHealthStoreServer.m", 137, @"Invalid parameter not satisfying: %@", @"client != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"HDHealthStoreServer.m", 139, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];

LABEL_4:
  v35.receiver = self;
  v35.super_class = (Class)HDHealthStoreServer;
  uint64_t v16 = [(HDHealthStoreServer *)&v35 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_lock._os_unfair_lock_opaque = 0;
    uint64_t v18 = HKCreateSerialDispatchQueue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_connectionQueue, a6);
    objc_storeStrong((id *)&v17->_client, a3);
    uint64_t v20 = [v14 copy];
    configuration = v17->_configuration;
    v17->_configuration = (HKHealthStoreConfiguration *)v20;

    objc_storeStrong((id *)&v17->_profile, a4);
    id v22 = [v13 daemon];
    objc_storeWeak((id *)&v17->_daemon, v22);

    id v23 = [HDClientAuthorizationOracle alloc];
    uint64_t v24 = [v12 sourceBundleIdentifier];
    long long v25 = [(HDHealthStoreClient *)v17->_client process];
    uint64_t v26 = [v25 entitlements];
    uint64_t v27 = [(HDClientAuthorizationOracle *)v23 initWithSourceBundleIdentifier:v24 entitlements:v26 profile:v13];
    clientAuthorizationOracle = v17->_clientAuthorizationOracle;
    v17->_clientAuthorizationOracle = (HDClientAuthorizationOracle *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskServerEndpointsByUUID = v17->_taskServerEndpointsByUUID;
    v17->_taskServerEndpointsByUUID = v29;
  }
  return v17;
}

- (void)_lock_cancelActiveClientTransaction
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"Timer cancelled");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 24) invalidateAndInvokeCompletionWithError:v3];
    id v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (id)clientDebuggingIdentifier
{
  if (a1)
  {
    uint64_t v1 = [a1 configuration];
    id v2 = [v1 debugIdentifier];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)remote_createTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 completion:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (!a8) {
    goto LABEL_21;
  }
  id v44 = 0;
  id v15 = (void (**)(id, void *, id))a8;
  id v16 = v14;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v21 = v20;
  if (!self) {
    goto LABEL_15;
  }
  if (!v16)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = @"Nil task server identifier";
LABEL_14:
    objc_msgSend(v29, "hk_assignError:code:format:", &v44, 3, v30);
LABEL_15:
    id v31 = 0;
    goto LABEL_16;
  }
  if (!v18)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = @"Nil task UUID";
    goto LABEL_14;
  }
  if (!v19)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = @"Nil instance UUID";
    goto LABEL_14;
  }
  id v43 = v20;
  if (v17
    && ([(HDHealthStoreServer *)self daemon],
        id v22 = objc_claimAutoreleasedReturnValue(),
        [v22 taskServerRegistry],
        id v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v23 loadTaskServersFromPluginAtURL:v17 error:&v44],
        v23,
        v22,
        !v24))
  {
    id v31 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    long long v25 = [(NSMutableDictionary *)self->_taskServerEndpointsByUUID objectForKeyedSubscript:v18];
    os_unfair_lock_unlock(&self->_lock);
    if (v25)
    {
LABEL_9:
      uint64_t v26 = [v25 instanceUUID];
      int v27 = [v26 isEqual:v19];

      if (v27)
      {
        id v28 = v25;
      }
      else
      {
        os_unfair_lock_t locka = (os_unfair_lock_t)MEMORY[0x1E4F28C58];
        objc_super v35 = [v18 UUIDString];
        id v36 = [v25 instanceUUID];
        v37 = [v36 UUIDString];
        [(os_unfair_lock_s *)locka hk_assignError:&v44, 3, @"Task server endpoint for '%@' already exists (for instance '%@')", v35, v37 code format];

        id v28 = 0;
      }
      v21 = v43;
      id v31 = v28;

      goto LABEL_16;
    }
    os_unfair_lock_t lock = &self->_lock;
    id v38 = [(HDHealthStoreServer *)self daemon];
    v39 = [v38 taskServerRegistry];
    id v31 = [v39 createTaskServerEndpointForIdentifier:v16 taskUUID:v18 instanceUUID:v19 configuration:v43 client:self->_client connectionQueue:self->_connectionQueue error:&v44];

    if (v31)
    {
      os_unfair_lock_lock(lock);
      uint64_t v40 = [(NSMutableDictionary *)self->_taskServerEndpointsByUUID objectForKeyedSubscript:v18];
      if (v40)
      {
        long long v25 = (void *)v40;
        os_unfair_lock_unlock(lock);

        goto LABEL_9;
      }
      [v31 setDelegate:self];
      [v31 setTaskServerDelegate:self];
      [(NSMutableDictionary *)self->_taskServerEndpointsByUUID setObject:v31 forKeyedSubscript:v18];
      os_unfair_lock_unlock(lock);
      [v31 resume];
    }
  }
  v21 = v43;
LABEL_16:

  id v32 = v44;
  if (!v31)
  {
    _HKInitializeLogging();
    v33 = HKLogInfrastructure();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v46 = v16;
      __int16 v47 = 2114;
      id v48 = v32;
      _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Failed to create task server endpoint for identifier \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  v34 = [v31 listenerEndpoint];
  v15[2](v15, v34, v32);

LABEL_21:
}

- (void)taskServerDidFailToInitializeForUUID:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_taskServerEndpointsByUUID objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_taskServerEndpointsByUUID setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  [v6 invalidate];
}

- (void)taskServerDidInvalidate:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  taskServerEndpointsByUUID = self->_taskServerEndpointsByUUID;
  id v7 = [v5 taskUUID];
  id v10 = [(NSMutableDictionary *)taskServerEndpointsByUUID objectForKeyedSubscript:v7];

  id v8 = self->_taskServerEndpointsByUUID;
  id v9 = [v5 taskUUID];

  [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];
  os_unfair_lock_unlock(p_lock);
  [v10 invalidate];
}

- (void)remote_createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  p_os_unfair_lock_t lock = &self->_lock;
  id v13 = (void (**)(id, void *, id))a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  os_unfair_lock_lock(p_lock);
  queryControlServer = self->_queryControlServer;
  if (!queryControlServer)
  {
    id v18 = [[HDQueryControlServer alloc] initWithParentServer:self connectionQueue:self->_connectionQueue];
    id v19 = self->_queryControlServer;
    self->_queryControlServer = v18;

    queryControlServer = self->_queryControlServer;
  }
  id v20 = queryControlServer;
  os_unfair_lock_unlock(p_lock);
  id v23 = 0;
  v21 = [(HDQueryControlServer *)v20 createQueryServerEndpointForIdentifier:v16 queryUUID:v15 configuration:v14 forceReactivation:v7 error:&v23];

  id v22 = v23;
  v13[2](v13, v21, v22);
}

- (void)performIfAuthorizedToSaveObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 setWithArray:a3];
  [(HDClientAuthorizationOracle *)self->_clientAuthorizationOracle performIfAuthorizedToSaveObjectsWithTypes:v11 onQueue:self->_queue usingBlock:v10 errorHandler:v9];
}

- (void)performIfAuthorizedToDeleteObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 setWithArray:a3];
  [(HDClientAuthorizationOracle *)self->_clientAuthorizationOracle performIfAuthorizedToDeleteObjectsWithTypes:v11 onQueue:self->_queue usingBlock:v10 errorHandler:v9];
}

- (void)saveSamples:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, id))a4;
  id v10 = 0;
  id v8 = [(HDHealthStoreServer *)self clientSourceWithError:&v10];
  id v9 = v10;
  if (v8)
  {
    [(HDHealthStoreServer *)self _saveDataObjects:v6 sourceEntity:v8 sourceVersion:0 handler:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }
}

- (void)remote_fetchPluginServiceEndpointWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  if (v8)
  {
    client = self->_client;
    uint64_t v10 = *MEMORY[0x1E4F2A548];
    id v23 = 0;
    BOOL v11 = [(HDHealthStoreClient *)client hasRequiredEntitlement:v10 error:&v23];
    id v12 = v23;
    if (v11)
    {
      if (v7)
      {
        id v13 = [(HDProfile *)self->_profile profileExtensionWithIdentifier:v7];
        if (v13)
        {
          id v14 = [(HDHealthStoreClient *)self->_client XPCClient];
          id v22 = v12;
          id v15 = [v13 listenerEndpointForClient:v14 error:&v22];
          id v16 = v22;

          v8[2](v8, v15, v16);
          id v12 = v16;
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
          id v15 = [WeakRetained daemonExtensionWithIdentifier:v7];

          if (v15)
          {
            id v18 = [(HDHealthStoreClient *)self->_client XPCClient];
            id v21 = v12;
            id v19 = [v15 listenerEndpointForClient:v18 error:&v21];
            id v20 = v21;

            v8[2](v8, v19, v20);
            id v12 = v20;
          }
          else
          {
            id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Plugin \"%@\" does not export a service"", v7);
            v8[2](v8, 0, v19);
          }
        }
      }
      else
      {
        id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"pluginIdentifier must not be nil"");
        v8[2](v8, 0, v13);
      }
    }
    else
    {
      v8[2](v8, 0, v12);
    }
  }
}

- (void)remote_recalibrateEstimatesForSampleType:(id)a3 atDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v21 = 0;
  BOOL v11 = [(HDHealthStoreServer *)self clientSourceWithError:&v21];
  id v12 = v21;
  if (v11)
  {
    id v13 = (void *)*MEMORY[0x1E4F29E50];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke;
    v16[3] = &unk_1E62FF660;
    v16[4] = self;
    id v17 = v8;
    id v18 = v11;
    id v19 = v9;
    id v20 = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_3;
    v14[3] = &unk_1E62FFD78;
    id v15 = v20;
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v13, v16, v14);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

void __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v1 + 56);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2;
  v6[3] = &unk_1E62F8A00;
  v6[4] = v1;
  id v7 = *(id *)(a1 + 64);
  [v3 createRecalibrateEstimatesRequestRecordForSampleType:v2 sourceEntity:v4 effectiveDate:v5 handler:v6];
}

void __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = -[HDHealthStoreServer _clientRemoteObjectProxy](*(void *)(a1 + 32));
    objc_msgSend(v3, "clientRemote_presentRecalibrateEstimatesRequestWithRecord:completion:", v4, *(void *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_clientRemoteObjectProxy
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 88) connection];
    uint64_t v2 = [v1 remoteObjectProxy];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_authorizationStatusForType:(id)a3 completion:(id)a4
{
  if (a4) {
    -[HDClientAuthorizationOracle authorizationStatusForType:completion:](self->_clientAuthorizationOracle, "authorizationStatusForType:completion:", a3);
  }
}

- (void)remote_getRequestStatusForAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v8 = (void (**)(id, uint64_t, id))a5;
    id v9 = a4;
    id v10 = a3;
    BOOL v11 = [(HDHealthStoreServer *)self profile];
    id v12 = [v11 authorizationManager];

    id v13 = [(HDHealthStoreServer *)self client];
    id v14 = [v13 sourceBundleIdentifier];
    id v17 = 0;
    uint64_t v15 = [v12 authorizationRequestStatusForClientBundleIdentifier:v14 writeTypes:v10 readTypes:v9 error:&v17];

    id v16 = v17;
    v8[2](v8, v15, v16);
  }
}

- (void)remote_requestPerObjectReadAuthorizationForType:(id)a3 filter:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 requiresPerObjectAuthorization])
  {
    BOOL v11 = +[HDSampleEntity entityEnumeratorWithType:v8 profile:self->_profile];
    id v12 = [v9 predicateWithProfile:self->_profile];
    [v11 setPredicate:v12];

    id v13 = [MEMORY[0x1E4F1CA48] array];
    v28[0] = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke;
    v26[3] = &unk_1E6300148;
    id v14 = v13;
    id v27 = v14;
    char v15 = [v11 enumerateWithError:v28 handler:v26];
    id v16 = v28[0];
    if (v15)
    {
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F2B2B0]) initWithExpectedObjectType:v8];
      id v17 = [[HDObjectAuthorizationRequestContext alloc] initWithSamples:v14 metadata:v21];
      [(HDObjectAuthorizationRequestContext *)v17 setPersistSession:0];
      [(HDObjectAuthorizationRequestContext *)v17 setPromptWithNoSamples:1];
      [(HDObjectAuthorizationRequestContext *)v17 setPromptWithAllSamples:1];
      id v25 = 0;
      id v18 = [(HDHealthStoreServer *)self clientSourceWithError:&v25];
      id v19 = v25;
      if (v18)
      {
        clientAuthorizationOracle = self->_clientAuthorizationOracle;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_2;
        v24[3] = &unk_1E6303F28;
        v24[4] = self;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_349;
        v22[3] = &unk_1E6303F50;
        id v23 = v10;
        [(HDClientAuthorizationOracle *)clientAuthorizationOracle enqueueObjectAuthorizationRequestWithContext:v17 sourceEntity:v18 promptIfNeeded:1 authorizationNeededHandler:v24 completion:v22];
      }
      else
      {
        (*((void (**)(id, void, id))v10 + 2))(v10, 0, v19);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v16);
    }
  }
  else
  {
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Object type %@ does not support per-object authorization.", v8);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v11);
  }
}

uint64_t __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to determine object authorization status: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)v7[7];
    id v9 = [v7 objectAuthorizationPromptHandler];
    [v8 handleObjectAuthorizationRequestsWithPromptHandler:v9 completion:&__block_literal_global_232];
  }
}

void __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_347(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to handle object authorization request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_349(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a4 == 0, a4);
}

- (void)remote_requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  if (v12)
  {
    if (v7
      && ([(HDHealthStoreClient *)self->_client process],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isWidgetKitExtension],
          v13,
          v14))
    {
      char v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 111, @"Unable to prompt for authorization using this type of extension ignoring request.");;
      v12[2](v12, 0, v15);
    }
    else
    {
      uint64_t v30 = v10;
      id v16 = [(HDHealthStoreClient *)self->_client process];
      uint64_t v17 = [v16 isExtension];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
      id v19 = [WeakRetained behavior];
      uint64_t v20 = [v19 isAppleWatch];

      id v21 = [(HDHealthStoreClient *)self->_client sourceBundleIdentifier];
      id v22 = objc_loadWeakRetained((id *)&self->_daemon);
      id v23 = [v22 analyticsSubmissionCoordinator];
      objc_msgSend(v23, "authorization_reportAuthRequestsFromBundleIdentifier:isExtension:isAppleWatch:shouldPrompt:", v21, v17, v20, v7);

      int v24 = 0;
      if (v17 && (v20 & 1) == 0)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke;
        aBlock[3] = &unk_1E630D020;
        aBlock[4] = self;
        id v41 = v21;
        int v24 = _Block_copy(aBlock);
      }
      id v39 = 0;
      id v25 = [(HDHealthStoreServer *)self clientSourceWithError:&v39];
      id v26 = v39;
      if (v25)
      {
        v29 = v21;
        clientAuthorizationOracle = self->_clientAuthorizationOracle;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_355;
        v31[3] = &unk_1E630D048;
        v34 = v12;
        v31[4] = self;
        id v32 = v30;
        id v33 = v11;
        id v35 = v24;
        BOOL v36 = v7;
        char v37 = v20;
        char v38 = v17;
        id v10 = v30;
        id v28 = clientAuthorizationOracle;
        id v21 = v29;
        [(HDClientAuthorizationOracle *)v28 updateDefaultAuthorizationStatusesForSource:v25 completion:v31];
      }
      else
      {
        v12[2](v12, 0, v26);
        id v10 = v30;
      }
    }
  }
}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a3)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2;
    id v23 = &unk_1E62F70B0;
    uint64_t v12 = *(void *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v13 = v11;
    id v25 = v13;
    if (v12)
    {
      int v14 = *(void **)(v12 + 88);
      char v15 = &v20;
      id v16 = v9;
      uint64_t v17 = objc_msgSend(v14, "sourceBundleIdentifier", v20, v21, v22, v23, v24);
      id v18 = [*(id *)(v12 + 72) authorizationManager];
      [v18 openAppForAuthorization:v17 sessionIdentifier:v16 completion:v15];

      id v13 = v25;
    }
  }
  else
  {
    if (v10)
    {
      _HKInitializeLogging();
      id v19 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to determine whether authorization is necessary: %{public}@", buf, 0xCu);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 56) handleAuthorizationRequestsWithPromptHandler:0 requestCompletionHandler:0];
  }
}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    int v6 = *MEMORY[0x1E4F29EF8];
    BOOL v7 = *MEMORY[0x1E4F29EF8];
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v10 = 138412546;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Unable to launch host app %@ for authorization: %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Did not launch host app %@ for authorization", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_355(uint64_t a1, char a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) enqueueAuthorizationRequestToWriteTypes:*(void *)(a1 + 40) readTypes:*(void *)(a1 + 48) authorizationNeededHandler:*(void *)(a1 + 64) requestCompletionHandler:*(void *)(a1 + 56)];
    if (*(unsigned char *)(a1 + 72))
    {
      if (*(unsigned char *)(a1 + 73) || !*(unsigned char *)(a1 + 74))
      {
        -[HDHealthStoreServer _authorizationPromptHandler](*(void **)(a1 + 32));
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        [*(id *)(*(void *)(a1 + 32) + 56) handleAuthorizationRequestsWithPromptHandler:v5 requestCompletionHandler:0];
      }
    }
    else
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 56);
      [v4 handleAuthorizationRequestsWithPromptHandler:0 requestCompletionHandler:0];
    }
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

- (id)_authorizationPromptHandler
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke;
    aBlock[3] = &unk_1E630D098;
    aBlock[4] = a1;
    a1 = _Block_copy(aBlock);
    uint64_t v1 = aBlock[6];
  }
  return a1;
}

- (void)remote_handleAuthorizationForExtensionWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  int v6 = [(HDHealthStoreClient *)self->_client process];
  int v7 = [v6 isExtension];

  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Cannot request authorization on behalf of an extension from within an extension."");
    v5[2](v5, 0, v8);
  }
  else
  {
    id v12 = 0;
    uint64_t v9 = [(HDHealthStoreServer *)self clientSourceWithError:&v12];
    id v10 = v12;
    if (v9)
    {
      uint64_t v11 = -[HDHealthStoreServer _authorizationPromptHandler](self);
      [(HDClientAuthorizationOracle *)self->_clientAuthorizationOracle handleAuthorizationRequestsWithPromptHandler:v11 requestCompletionHandler:v5];
    }
    else
    {
      v5[2](v5, 0, v10);
    }
  }
}

- (void)remote_beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  clientAuthorizationOracle = self->_clientAuthorizationOracle;
  client = self->_client;
  id v9 = a3;
  id v10 = [(HDHealthStoreClient *)client process];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__HDHealthStoreServer_remote_beginAuthorizationDelegateTransactionWithSessionIdentifier_handler___block_invoke;
  v12[3] = &unk_1E630D070;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(HDClientAuthorizationOracle *)clientAuthorizationOracle beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:v9 clientProcess:v10 completion:v12];
}

void __97__HDHealthStoreServer_remote_beginAuthorizationDelegateTransactionWithSessionIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 72) sourceManager];
    id v16 = 0;
    id v9 = [v8 localSourceForBundleIdentifier:v5 error:&v16];
    id v10 = v16;
    id v11 = v10;
    if (v9)
    {
      id v15 = v10;
      id v12 = [v8 clientSourceForSourceEntity:v9 error:&v15];
      id v13 = v15;
    }
    else
    {
      if (v7)
      {
        id v12 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"No source for bundle identifier \"%@\"", v5);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = 0;
    }

    id v11 = v13;
LABEL_9:

    goto LABEL_10;
  }
  if (v6)
  {
    id v11 = v6;
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
    id v11 = 0;
  }
LABEL_10:
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v12, v11);
  }
}

- (void)remote_endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
}

- (void)_performIfAuthorizedToDeleteObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
}

void __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke_2;
  v9[3] = &unk_1E62F2A18;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[HDHealthStoreServer authenticateWithCompletion:v9];
}

void __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke_2(uint64_t *a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = -[HDHealthStoreServer _clientRemoteObjectProxy](a1[4]);
    objc_msgSend(v7, "clientRemote_presentAuthorizationWithRequestRecord:completion:", a1[5], a1[6]);
  }
  else
  {
    if (v5)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = a1[4];
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v10, 0x16u);
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)objectAuthorizationPromptHandler
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke;
  aBlock[3] = &unk_1E630D0C0;
  aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);

  return v2;
}

void __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke_2;
  v10[3] = &unk_1E62FAA10;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  v10[4] = v7;
  id v8 = v5;
  id v9 = v6;
  +[HDHealthStoreServer authenticateWithCompletion:v10];
}

void __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke_2(uint64_t *a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_6;
  }
  if ((a2 & 1) == 0)
  {
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_7;
  }
  id v8 = -[HDHealthStoreServer _clientRemoteObjectProxy](a1[4]);
  objc_msgSend(v8, "clientRemote_presentAuthorizationWithSession:completion:", a1[5], a1[6]);

LABEL_7:
}

- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 creationDateOverride:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v16 = 0;
  uint64_t v13 = [(HDHealthStoreServer *)self clientSourceWithError:&v16];
  id v14 = v16;
  BOOL v15 = [(HDHealthStoreClient *)self->_client hasEntitlement:*MEMORY[0x1E4F29930]];
  if (v11 && !v15)
  {

    id v11 = 0;
  }
  if (v13)
  {
    -[HDHealthStoreServer _saveDataObjects:sourceEntity:sourceVersion:skipInsertionFilter:handler:creationDate:]((id *)&self->super.isa, v10, v13, 0, a4 & [(HDHealthStoreClient *)self->_client hasEntitlement:*MEMORY[0x1E4F2A9F8]], v12, v11);
  }
  else if (v12)
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v14);
  }
}

- (void)_saveDataObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersion:(char)a5 skipInsertionFilter:(void *)a6 handler:(void *)a7 creationDate:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (a1)
  {
    if (!v14)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:sel__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate_, a1, @"HDHealthStoreServer.m", 1086, @"Invalid parameter not satisfying: %@", @"sourceEntity != nil" object file lineNumber description];
    }
    id v49 = 0;
    id v18 = -[HDHealthStoreServer _objectsToInsertWithObjects:error:](a1, v13, (uint64_t)&v49);
    id v19 = v49;
    uint64_t v20 = v19;
    if (v18)
    {
      id v35 = v19;
      id v39 = v13;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke;
      v42[3] = &unk_1E630D160;
      v42[4] = a1;
      id v21 = v18;
      id v43 = v21;
      id v38 = v14;
      id v44 = v14;
      id v37 = v15;
      id v45 = v15;
      char v48 = a5;
      id v36 = v17;
      id v46 = v17;
      id v47 = v16;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke_2;
      v40[3] = &unk_1E62FFD78;
      id v41 = v47;
      [a1 _performIfAuthorizedToSaveObjects:v21 usingBlock:v42 errorHandler:v40];
      id v22 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A610]];
      id v23 = v21;
      id v24 = v22;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v51;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v51 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = [v30 quantityType];
              char v32 = [v31 isEqual:v24];

              if (v32)
              {

                id v33 = [a1[9] unitPreferencesManager];
                [v33 setPreferredUnitToDefaultIfNotSetForType:v24];

                goto LABEL_17;
              }
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v54 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

LABEL_17:
      id v14 = v38;
      id v13 = v39;
      id v15 = v37;
      uint64_t v20 = v35;
      id v17 = v36;
    }
    else
    {
      (*((void (**)(id, void, id))v16 + 2))(v16, 0, v19);
    }
  }
}

void __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v17 = 0;
  id v3 = [v2 clientSourceWithError:&v17];
  id v4 = v17;
  id v5 = *(id **)(a1 + 32);
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained(v5 + 8);
    id v11 = [WeakRetained behavior];
    int v12 = [v11 isAppleWatch];

    char v13 = [*(id *)(*(void *)(a1 + 32) + 88) hasEntitlement:*MEMORY[0x1E4F2A548]];
    int v14 = v12 ^ 1;
    if (v4) {
      int v14 = 1;
    }
    if (v14) {
      id v9 = v4;
    }
    else {
      id v9 = 0;
    }
    if ((v14 & 1) == 0 && (v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 4, @"Authorization from parent application required");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  id v6 = *(void **)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 64);
  id v16 = v4;
  char v8 = -[HDHealthStoreServer _queue_insertObjects:sourceEntity:sourceVersionOverride:shouldJournal:skipInsertionFilter:error:creationDate:](v5, v6, v3, 0, 0, v7, (uint64_t)&v16, 0);
  id v9 = v16;

  if ((v8 & 1) == 0 && (objc_msgSend(v9, "hk_isDatabaseAccessibilityError") & 1) == 0)
  {
LABEL_13:
    id v15 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  id v15 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
  v15();
}

- (uint64_t)_queue_insertObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(char)a5 shouldJournal:(char)a6 skipInsertionFilter:(uint64_t)a7 error:(void *)a8 creationDate:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = v18;
  if (!a1) {
    goto LABEL_10;
  }
  if (v18) {
    MEMORY[0x1C1879C50](v18);
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  double v21 = Current;
  id v22 = [a1[9] database];

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 1500, @"Nil healthDatabase");
LABEL_10:
    uint64_t v32 = 0;
    goto LABEL_11;
  }
  v34 = v19;
  char v35 = a6;
  id v23 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v24 = [a1 client];
  id v25 = [v24 accessibilityAssertions];

  if (v25) {
    [v23 addAccessibilityAssertions:v25];
  }
  uint64_t v26 = [a1[9] database];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke;
  v43[3] = &unk_1E63046F0;
  v43[4] = a1;
  id v44 = v15;
  id v45 = v16;
  id v27 = v17;
  id v28 = v17;
  id v29 = v16;
  id v30 = v27;
  id v46 = v27;
  double v47 = v21;
  char v48 = v35;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_3;
  v36[3] = &unk_1E630D1B0;
  char v41 = a5;
  v36[4] = a1;
  id v37 = v44;
  id v38 = v45;
  id v31 = v30;
  id v16 = v29;
  id v17 = v28;
  id v39 = v31;
  double v40 = v21;
  char v42 = v35;
  uint64_t v32 = [v26 performTransactionWithContext:v23 error:a7 block:v43 inaccessibilityHandler:v36];

  id v19 = v34;
LABEL_11:

  return v32;
}

uint64_t __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 transactionIdentifier:(id)a5 final:(BOOL)a6 handler:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v12 = a5;
  id v13 = a7;
  BOOL v14 = [(HDHealthStoreClient *)self->_client hasEntitlement:*MEMORY[0x1E4F2A9F8]];
  if (v13)
  {
    BOOL v15 = v14;
    uint64_t v64 = 0;
    long long v65 = (id *)&v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__195;
    uint64_t v68 = __Block_byref_object_dispose__195;
    id v69 = 0;
    id v63 = 0;
    id v38 = -[HDHealthStoreServer _objectsToInsertWithObjects:error:]((id *)&self->super.isa, v39, (uint64_t)&v63);
    objc_storeStrong(&v69, v63);
    if (!v38)
    {
      (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v65[5]);
LABEL_24:

      _Block_object_dispose(&v64, 8);
      goto LABEL_25;
    }
    profile = self->_profile;
    if (v12)
    {
      id v17 = [(HDProfile *)profile database];
      id v18 = [v17 extendedDatabaseTransactionForIdentifier:v12];

      if (!v18)
      {
        id v19 = 0;
LABEL_20:
        (*((void (**)(id, void, BOOL, id))v13 + 2))(v13, 0, v12 != 0, v19);
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v20 = [(HDProfile *)profile database];
      double v21 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
      id v22 = v65;
      id v62 = v65[5];
      id v18 = [v20 beginExtendedTransactionWithContext:v21 transactionTimeout:&v62 continuationTimeout:30.0 error:2.0];
      objc_storeStrong(v22 + 5, v62);

      if (!v18)
      {
        id v19 = v65[5];
        goto LABEL_20;
      }
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    uint64_t v52 = 0;
    long long v53 = &v52;
    uint64_t v54 = 0x3032000000;
    uint64_t v55 = __Block_byref_object_copy__195;
    v56 = __Block_byref_object_dispose__195;
    id v57 = 0;
    id v23 = v65[5];
    v65[5] = 0;

    id v24 = v65;
    id obj = v65[5];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke;
    v42[3] = &unk_1E630D138;
    v42[4] = self;
    id v43 = v38;
    BOOL v48 = a4;
    BOOL v49 = v15;
    id v25 = v18;
    BOOL v50 = a6;
    id v44 = v25;
    id v45 = &v52;
    id v46 = &v58;
    double v47 = &v64;
    char v26 = [v25 performInTransactionWithErrorOut:&obj block:v42];
    objc_storeStrong(v24 + 5, obj);
    if ((v26 & 1) == 0)
    {
      id v27 = (void *)v53[5];
      v53[5] = 0;
    }
    uint64_t v28 = v53[5];
    if (!v28)
    {
      id v29 = v65;
      if (v65[5])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Rollback due to performInTransactionWithErrorOut:block: failed");
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        id v40 = 0;
        char v31 = [v25 rollbackDueToError:v30 errorOut:&v40];
        id v32 = v40;
        id v33 = v40;
        if ((v31 & 1) == 0)
        {
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v71 = v33;
            _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Failed to roll back extended transaction: %{public}@", buf, 0xCu);
          }
          objc_storeStrong(v65 + 5, v32);
        }
        if (!v65[5])
        {
          uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Save transaction failed with an unknown error.");
          id v36 = v65[5];
          v65[5] = (id)v35;
        }
      }
      else
      {
        id v41 = 0;
        [v25 commitWithErrorOut:&v41];
        id v37 = v41;
        id v30 = v29[5];
        v29[5] = v37;
      }

      uint64_t v28 = v53[5];
    }
    (*((void (**)(id, uint64_t, void, id))v13 + 2))(v13, v28, *((unsigned __int8 *)v59 + 24), v65[5]);

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    goto LABEL_24;
  }
LABEL_25:
}

uint64_t __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 80)) {
    BOOL v4 = *(unsigned char *)(a1 + 81) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = [*(id *)(a1 + 48) transactionIdentifier];
  char v6 = *(unsigned char *)(a1 + 82);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2;
  v15[3] = &unk_1E630D110;
  long long v16 = *(_OWORD *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 72);
  id v7 = v2;
  id v8 = v5;
  id v9 = v15;
  id v10 = v9;
  if (v3)
  {
    id v11 = *(void **)(v3 + 56);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke;
    v20[3] = &unk_1E630D0E8;
    v20[4] = v3;
    id v12 = v9;
    id v23 = v12;
    id v13 = v7;
    id v21 = v13;
    BOOL v24 = v4;
    char v25 = v6;
    id v22 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2;
    v18[3] = &unk_1E62FFD78;
    id v19 = v12;
    [v11 performIfAuthorizedToSaveObjects:v13 onQueue:0 usingBlock:v20 errorHandler:v18];
  }
  return 1;
}

void __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[4] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

void __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  BOOL v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  char v6 = *(unsigned char *)(a1 + 80);
  id v10 = 0;
  uint64_t v7 = -[HDHealthStoreServer _queue_insertObjects:sourceEntity:sourceVersionOverride:shouldJournal:skipInsertionFilter:error:creationDate:](v2, v3, v4, v5, 1, v6, (uint64_t)&v10, *(void **)(a1 + 64));
  id v8 = v10;
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);
  }
}

uint64_t __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a3);
  if (v4)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 72) dataManager];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = v6;
          id v15 = v5;
          int v12 = HKWithAutoreleasePool();

          if (!v12)
          {
            uint64_t v13 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 1;
    }
LABEL_14:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 48) insertDataObjects:v4 withProvenance:*(void *)(a1 + 40) creationDate:*(unsigned __int8 *)(a1 + 64) skipInsertionFilter:1 updateSourceOrder:0 resolveAssociations:a2 error:*(double *)(a1 + 56)];

  return v5;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (*(unsigned char *)(a1 + 72))
  {
    -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), (uint64_t)a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = v7;
          int v13 = HKWithAutoreleasePool();

          if (!v13)
          {
            uint64_t v14 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 1;
    }
LABEL_16:
  }
  else
  {
    id v15 = v5;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v14 = 0;
  }

  return v14;
}

BOOL __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = [[HDDataEntityInsertionContext alloc] initWithProvenance:*(void *)(a1 + 40) creationDate:*(unsigned __int8 *)(a1 + 64) skipInsertionFilter:0 resolveAssociations:*(void *)(*(void *)(a1 + 48) + 72) profile:*(double *)(a1 + 56)];
  BOOL v6 = +[HDDataEntity journalObjects:v4 insertionContext:v5 profile:*(void *)(*(void *)(a1 + 48) + 72) error:a2];

  return v6;
}

- (id)_permissionBlockForRestrictedSourceEntities:(void *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    id v5 = objc_msgSend(v3, "hk_map:", &__block_literal_global_410_0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_2;
    aBlock[3] = &unk_1E630D200;
    id v10 = v4;
    id v11 = v5;
    id v12 = a1;
    id v6 = v5;
    id v7 = _Block_copy(aBlock);
    a1 = _Block_copy(v7);
  }

  return a1;
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  int v13 = __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_3;
  uint64_t v14 = &unk_1E630D1D8;
  long long v18 = &v19;
  id v15 = *(id *)(a1 + 32);
  id v7 = v6;
  id v16 = v7;
  id v17 = *(id *)(a1 + 40);
  uint64_t v8 = _Block_copy(&v11);
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 56), "performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:", v5, 0, v8, &__block_literal_global_413_0, v11, v12, v13, v14);
  uint64_t v9 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_3(uint64_t result, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = 1;
  if (a2)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 32))
    {
      uint64_t result = [*(id *)(result + 40) isSubsetOfSet:*(void *)(result + 48)];
      *(unsigned char *)(*(void *)(*(void *)(v2 + 56) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)remote_deleteDataObjects:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke;
  aBlock[3] = &unk_1E62F29A0;
  id v23 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  if ([v9 count])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_2;
    v18[3] = &unk_1E630D228;
    void v18[4] = self;
    unint64_t v21 = a4;
    id v19 = v9;
    id v20 = v11;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_3;
    v16[3] = &unk_1E62FFD78;
    id v17 = v20;
    [(HDHealthStoreServer *)self _performIfAuthorizedToDeleteObjects:v19 usingBlock:v18 errorHandler:v16];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = "empty";
    if (!v9) {
      uint64_t v14 = "nil";
    }
    id v15 = objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v13, a2, @"dataObjects cannot be %s"", v14);
    (*((void (**)(void *, void, void *))v11 + 2))(v11, 0, v15);
  }
}

uint64_t __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 88) sourceBundleIdentifier];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 72) sourceManager];
    id v14 = 0;
    uint64_t v6 = [v5 allSourcesForBundleIdentifier:v4 error:&v14];
    id v7 = v14;
    id v8 = v7;
    if (!v6) {
      goto LABEL_11;
    }

    BOOL v4 = (void *)v6;
  }
  else
  {
    BOOL v4 = 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 32), v4);
  }
  else
  {
    id v5 = 0;
  }
  id v9 = objc_alloc_init(HDDataDeletionConfiguration);
  [(HDDataDeletionConfiguration *)v9 setSecureDelete:1];
  [(HDDataDeletionConfiguration *)v9 setFailIfNotFound:1];
  [(HDDataDeletionConfiguration *)v9 setRecursiveDeleteAuthorizationBlock:v5];
  if (a2)
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 88) sourceBundleIdentifier];
    [(HDDataDeletionConfiguration *)v9 setRestrictedSourceBundleIdentifier:v10];
  }
  [(HDDataDeletionConfiguration *)v9 setUserRequested:(*(void *)(a1 + 56) >> 1) & 1];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 72) dataManager];
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = 0;
  [v11 deleteObjectsWithUUIDCollection:v12 configuration:v9 error:&v13];
  id v8 = v13;

LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_deleteDataObjectsOfType:(id)a3 matchingFilter:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    clientAuthorizationOracle = self->_clientAuthorizationOracle;
    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = v11;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v17 = [v15 setWithArray:v16];
    queue = self->_queue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke;
    v22[3] = &unk_1E630D250;
    void v22[4] = self;
    id v25 = v13;
    id v23 = v12;
    id v24 = v11;
    unint64_t v26 = a5;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_3;
    v20[3] = &unk_1E62FFD78;
    id v21 = v25;
    [(HDClientAuthorizationOracle *)clientAuthorizationOracle performIfAuthorizedToDeleteObjectsWithTypes:v17 onQueue:queue usingBlock:v22 errorHandler:v20];
  }
  else
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"objectType cannot be nil"");
    if (v13) {
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v19);
    }
  }
}

void __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    uint64_t v3 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) sourceBundleIdentifier];
  if (!v3)
  {
LABEL_8:
    id v5 = 0;
    char v22 = 0;
    goto LABEL_9;
  }
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 72) sourceManager];
  id v28 = 0;
  id v5 = [v4 allSourcesForBundleIdentifier:v3 error:&v28];
  id v6 = v28;

  char v22 = v6;
  if (!v5)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v6);
    }
    id v5 = 0;
  }
LABEL_9:
  id v8 = objc_msgSend(v5, "hk_map:", &__block_literal_global_426_0);
  id v25 = (void *)v3;
  if (v8)
  {
    uint64_t v9 = HDDataEntityPredicateForSourceIdentifierSet(7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [*(id *)(a1 + 40) predicateWithProfile:*(void *)(*(void *)(a1 + 32) + 72)];
  id v23 = (void *)v9;
  id v11 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v9 otherPredicate:v10];
  id v12 = HDSampleEntityPredicateForDataType(*(void **)(a1 + 48));
  id v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v12];

  id v24 = v5;
  if (*(unsigned char *)(a1 + 64))
  {
    id v14 = -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 32), v5);
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v27 = 0;
  id v15 = [*(id *)(*(void *)(a1 + 32) + 72) dataManager];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "dataObjectClass"), "hd_dataEntityClass");
  uint64_t v17 = *MEMORY[0x1E4F65DE0];
  id v26 = v22;
  LOBYTE(v21) = 1;
  uint64_t v18 = [v15 deleteDataObjectsOfClass:v16 predicate:v13 limit:v17 deletedSampleCount:&v27 notifyObservers:1 generateDeletedObjects:1 userRequested:v21 recursiveDeleteAuthorizationBlock:v14 error:&v26];
  id v19 = v26;

  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v20 + 16))(v20, v18, v27, v19);
  }
}

uint64_t __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

uint64_t __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)remote_isProtectedDataAvailable:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke;
  v9[3] = &unk_1E62F3CA8;
  v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke_2;
  v7[3] = &unk_1E62FFD78;
  id v5 = v10;
  id v8 = v5;
  id v6 = v5;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v9, v7);
    id v6 = v8;
  }
}

void __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = [v7 database];
  uint64_t v4 = [v3 isProtectedDataAvailable];
  id v5 = [*(id *)(a1 + 32) profile];
  id v6 = [v5 database];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 16))(v2, v4, [v6 isInSession], 0);
}

uint64_t __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_remote_associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke;
  v17[3] = &unk_1E62F2F48;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  uint64_t v20 = self;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2;
  v15[3] = &unk_1E62FFD78;
  id v13 = v21;
  id v16 = v13;
  id v14 = v13;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v17, v15);
    id v14 = v16;
  }
}

void __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v4 = [*(id *)(a1 + 48) profile];
  id v9 = 0;
  BOOL v5 = +[HDAssociationEntity associateSampleUUIDs:v2 withSampleUUID:v3 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v10 profile:v4 error:&v9];
  id v6 = v10;
  id v7 = v9;

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v5, v7);
  }
}

uint64_t __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)_remote_saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke;
  v21[3] = &unk_1E6301620;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  id v25 = v13;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke_2;
  v19[3] = &unk_1E62FFD78;
  id v17 = v25;
  id v20 = v17;
  id v18 = v17;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v21, v19);
    id v18 = v20;
  }
}

void __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    id v17 = 0;
    uint64_t v4 = [v2 clientSourceWithError:&v17];
    id v5 = v17;
    id v6 = v5;
    if (v4)
    {
      id v16 = 0;
      uint64_t v2 = -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:]((id *)v2, v3, v4, 0, (uint64_t)&v16);
      id v7 = v16;
      if (v2)
      {
        uint64_t v8 = 0;
      }
      else
      {
        id v9 = v7;
        uint64_t v8 = v9;
        if (v9) {
          id v10 = v9;
        }

        uint64_t v2 = 0;
        id v7 = v8;
      }
    }
    else
    {
      id v7 = v5;
      if (v7)
      {
        id v7 = v7;
        uint64_t v8 = v7;
      }
      else
      {
        uint64_t v8 = 0;
      }
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v11 = v8;
  if (v2)
  {
    id v12 = [[HDInsertDeleteAndAssociateObjectsOperation alloc] initWithObjectsToInsertByDataProvenance:v2 objectsToDelete:*(void *)(a1 + 48) associations:*(void *)(a1 + 56)];
    id v13 = [*(id *)(a1 + 32) profile];
    id v15 = v11;
    [(HDJournalableOperation *)v12 performOrJournalWithProfile:v13 error:&v15];
    id v14 = v15;

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v11 = v14;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setBackgroundDeliveryFrequency:(int64_t)a3 forDataType:(id)a4 handler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HKHealthStoreConfiguration *)self->_configuration applicationSDKVersionToken];
  int v12 = dyld_version_token_at_least();
  id v13 = [(HDHealthStoreClient *)self->_client entitlements];
  int v14 = [v13 hasBackgroundDeliveryAPIAccess];

  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v12 == 0;
  }
  if (!v15)
  {
    _HKInitializeLogging();
    id v21 = *MEMORY[0x1E4F29F00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
    {
      id v32 = (void *)*MEMORY[0x1E4F29E38];
      *(_DWORD *)buf = 138543362;
      id v40 = v32;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Missing %{public}@ entitlement.", buf, 0xCu);
    }
    id v23 = [(HDProfile *)self->_profile dataManager];
    client = self->_client;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke;
    v37[3] = &unk_1E62F2F20;
    id v38 = v10;
    [v23 setBackgroundObserverFrequency:client forDataType:0 frequency:a3 appSDKVersionToken:v11 completion:v37];

    id v20 = v38;
    goto LABEL_19;
  }
  if (HDBackgroundObservationSupportedForDataTypeCode([v9 code]) & 1) != 0 || ((v12 ^ 1))
  {
    id v25 = [(HDHealthStoreClient *)self->_client process];
    id v26 = [v25 applicationIdentifier];

    if (!v26)
    {
      id v29 = [(HDHealthStoreClient *)self->_client process];
      id v20 = [v29 name];

      _HKInitializeLogging();
      id v30 = *MEMORY[0x1E4F29F00];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v20;
        _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Unable to get bundle ID for %{public}@", buf, 0xCu);
        if (!v10) {
          goto LABEL_19;
        }
      }
      else if (!v10)
      {
        goto LABEL_19;
      }
      char v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Unable to get bundle ID for %@."", v20);
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v31);

      goto LABEL_19;
    }
    uint64_t v27 = [(HDProfile *)self->_profile dataManager];
    id v28 = self->_client;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke_436;
    v35[3] = &unk_1E62F2F20;
    id v36 = v10;
    [v27 setBackgroundObserverFrequency:v28 forDataType:v9 frequency:a3 appSDKVersionToken:v11 completion:v35];

    id v20 = v36;
LABEL_19:

    goto LABEL_20;
  }
  _HKInitializeLogging();
  id v16 = (void *)*MEMORY[0x1E4F29F00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F00], OS_LOG_TYPE_ERROR))
  {
    id v33 = v16;
    v34 = [v9 description];
    *(_DWORD *)buf = 138543362;
    id v40 = v34;
    _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "%{public}@ data type is not supported for Background Delivery", buf, 0xCu);

    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    id v19 = [v9 description];
    id v20 = objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v18, a2, @"Background Delivery is not available for %@"", v19);

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
    goto LABEL_19;
  }
LABEL_20:
}

void __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Missing %@ entitlement.", *MEMORY[0x1E4F29E38]);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke_436(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)remote_closeTransactionWithDataTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5 completion:(id)a6
{
  id v19 = a3;
  id v11 = a4;
  id v12 = a5;
  client = self->_client;
  int v14 = (void (**)(id, uint64_t, void))a6;
  BOOL v15 = [(HDHealthStoreClient *)client process];
  id v16 = [v15 applicationIdentifier];

  if (v16)
  {
    id v17 = [(HDProfile *)self->_profile appSubscriptionManager];
    [v17 ackForBundleID:v16 dataTypes:v19 anchor:v11 ackTime:v12];

    v14[2](v14, 1, 0);
  }
  else
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No valid application identifier found."");
    v14[2](v14, 0, v18);

    int v14 = (void (**)(id, uint64_t, void))v18;
  }
}

- (void)remote_deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void, uint64_t))a6;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__195;
  id v29 = __Block_byref_object_dispose__195;
  id v30 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke;
  v17[3] = &unk_1E630D278;
  id v14 = v11;
  id v18 = v14;
  unint64_t v23 = a5;
  id v15 = v12;
  id v19 = v15;
  id v20 = self;
  id v21 = &v25;
  id v22 = &v31;
  SEL v24 = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2;
  v16[3] = &unk_1E630D2A0;
  void v16[4] = &v25;
  if (self) {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v17, v16);
  }
  if (v13) {
    v13[2](v13, *((unsigned __int8 *)v32 + 24), v26[5]);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      if (*(void *)(a1 + 40))
      {
        id v6 = [*(id *)(*(void *)(a1 + 48) + 72) sourceManager];
        uint64_t v7 = *(void *)(a1 + 40);
        id v19 = 0;
        uint64_t v8 = [v6 allSourcesForBundleIdentifier:v7 error:&v19];
        id v9 = v19;
        id v10 = v19;

        BOOL v11 = v8 != 0;
        if (!v8) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
        }
      }
      else
      {
        uint64_t v8 = 0;
        BOOL v11 = 1;
      }
      id v2 = -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 48), v8);

      if (!v11) {
        goto LABEL_14;
      }
    }
    else
    {
      id v2 = 0;
    }
    id v12 = [*(id *)(*(void *)(a1 + 48) + 72) dataManager];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = (*(void *)(a1 + 72) >> 1) & 1;
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v16 + 40);
    char v17 = [v12 deleteSamplesWithTypes:v13 sourceBundleIdentifier:v14 userRequested:v15 recursiveDeleteAuthorizationBlock:v2 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17;

LABEL_14:
    return;
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 80), @"sampleTypes may not be empty"");
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)remote_deleteClientSourceWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4F2AA18];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke;
    v10[3] = &unk_1E62FFD00;
    v10[4] = self;
    id v11 = v5;
    SEL v12 = a2;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke_449;
    v8[3] = &unk_1E62FFD78;
    id v9 = v11;
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v7, v10, v8);
  }
}

void __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [v2 sourceBundleIdentifier];

  if (v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) sourceManager];
    id v16 = 0;
    int v5 = [v4 deleteSourceWithBundleIdentifier:v3 error:&v16];
    id v6 = v16;

    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F18];
    uint64_t v8 = *MEMORY[0x1E4F29F18];
    if (v5)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_9;
      }
      id v9 = *(void **)(*(void *)(a1 + 32) + 88);
      id v10 = v7;
      id v11 = [v9 process];
      SEL v12 = [v11 name];
      *(_DWORD *)buf = 138543618;
      id v18 = v12;
      __int16 v19 = 2114;
      id v20 = v3;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" deleted source %{public}@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 88);
      id v10 = v7;
      id v11 = [v15 process];
      SEL v12 = [v11 name];
      *(_DWORD *)buf = 138543874;
      id v18 = v12;
      __int16 v19 = 2114;
      id v20 = v3;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" failed to deleted source %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"bundleIdentifier", objc_opt_class(), *(void *)(a1 + 48));
  (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

LABEL_9:
}

uint64_t __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke_449(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__195;
  SEL v24 = __Block_byref_object_dispose__195;
  id v25 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke;
  v13[3] = &unk_1E630D2C8;
  id v11 = v9;
  id v14 = v11;
  uint64_t v15 = self;
  id v16 = &v26;
  char v17 = &v20;
  unint64_t v18 = a4;
  SEL v19 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke_2;
  v12[3] = &unk_1E630D2A0;
  void v12[4] = &v20;
  if (self) {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v13, v12);
  }
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v27 + 24), v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

void __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v2 = -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 40), 0);
    }
    else
    {
      id v2 = 0;
    }
    id v6 = [*(id *)(*(void *)(a1 + 40) + 72) dataManager];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = (*(void *)(a1 + 64) >> 1) & 1;
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    char v10 = [v6 deleteSamplesWithUUIDs:v7 userRequested:v8 recursiveDeleteAuthorizationBlock:v2 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
  else
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 72), @"uuids array may not be empty"");
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

void __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hk_isAuthorizationDeniedError")) {
    id v3 = 0;
  }
  else {
    id v3 = v4;
  }
  (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v3);
}

- (void)remote_setCharacteristic:(id)a3 forDataType:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke;
  v18[3] = &unk_1E62F70D8;
  id v12 = v10;
  id v19 = v12;
  uint64_t v20 = self;
  id v13 = v9;
  id v21 = v13;
  id v22 = v11;
  SEL v23 = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke_457;
  v16[3] = &unk_1E62FFD78;
  id v14 = v22;
  id v17 = v14;
  uint64_t v15 = v14;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v18, v16);
    uint64_t v15 = v17;
  }
}

void __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [*(id *)(a1[5] + 72) userCharacteristicsManager];
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[4];
    id v10 = 0;
    [v2 setUserCharacteristic:v3 forType:v4 error:&v10];
    id v5 = v10;

    id v6 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[8], @"dataType may not be nil"");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)a1[4];
      id v9 = v7;
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = [v8 code];
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Error setting characteristic for data type %ld: %{public}@", buf, 0x16u);
    }
    id v6 = *(void (**)(void))(a1[7] + 16);
  }
  v6();
}

uint64_t __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke_457(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_fetchModificationDateForCharacteristicWithDataType:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke;
  v14[3] = &unk_1E62F7100;
  id v9 = v7;
  id v15 = v9;
  id v16 = self;
  id v17 = v8;
  SEL v18 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke_458;
  v12[3] = &unk_1E62FFD78;
  id v10 = v17;
  id v13 = v10;
  id v11 = v10;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v14, v12);
    id v11 = v13;
  }
}

void __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [*(id *)(a1[5] + 72) userCharacteristicsManager];
    uint64_t v3 = a1[4];
    id v7 = 0;
    uint64_t v4 = [v2 modificationDateForCharacteristicWithType:v3 error:&v7];
    id v5 = v7;

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"dataType may not be nil"");
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Error retrieving modification date for data type: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke_458(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)*MEMORY[0x1E4F29E60];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke;
  v17[3] = &unk_1E62F2F48;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E62FFD78;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v11, v17, v15);
}

void __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  uint64_t v3 = [WeakRetained healthLiteUserDefaultsDomain];

  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v13 = 0;
  uint64_t v6 = [v3 setNumber:v4 forKey:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)(a1[4] + 64));
    id v9 = [v8 behavior];
    int v10 = [v9 isAppleWatch];

    if (v10)
    {
      id v11 = [*(id *)(a1[4] + 72) nanoSyncManager];
      [v11 syncHealthDataWithOptions:0 reason:@"HealthLite key/value update" completion:0];
    }
  }
  uint64_t v12 = a1[7];
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v6, v7);
  }
}

uint64_t __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)remote_getHealthLiteValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4F29E60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke;
  v13[3] = &unk_1E62F4E40;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke_2;
  v11[3] = &unk_1E62FFD78;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v8, v13, v11);
}

void __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  uint64_t v3 = [WeakRetained healthLiteUserDefaultsDomain];

  uint64_t v4 = a1[5];
  id v8 = 0;
  uint64_t v5 = [v3 numberForKey:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);
  }
}

uint64_t __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)remote_fetchServerURLForAssetType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke;
  v13[3] = &unk_1E62F4928;
  id v8 = v6;
  id v14 = v8;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke_2;
  v11[3] = &unk_1E62FFD78;
  id v9 = v15;
  id v12 = v9;
  id v10 = v9;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v13, v11);
    id v10 = v12;
  }
}

void __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke(uint64_t a1)
{
  id v2 = ASServerURLForAssetType();
  id v3 = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v2, v3);
  }
}

uint64_t __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)remote_setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke;
  v17[3] = &unk_1E62F4E40;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke_2;
  v15[3] = &unk_1E62FFD78;
  id v13 = v20;
  id v16 = v13;
  id v14 = v13;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v17, v15);
    id v14 = v16;
  }
}

uint64_t __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke(uint64_t a1)
{
  ASSetAssetServerURLForAssetType();
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (id)diagnosticDescription
{
  id v3 = -[HDHealthStoreServer clientDebuggingIdentifier](self);
  if (v3)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = -[HDHealthStoreServer clientDebuggingIdentifier](self);
    id v6 = [v4 stringWithFormat:@" [%@]", v5];
  }
  else
  {
    id v6 = &stru_1F1728D60;
  }

  id v7 = [(HDHealthStoreClient *)self->_client process];
  id v8 = NSString;
  id v9 = [v7 name];
  id v10 = [v8 stringWithFormat:@"%@ (%d)%@", v9, objc_msgSend(v7, "processIdentifier"), v6];

  return v10;
}

void __58__HDHealthStoreServer_remote_clientResumedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && [*(id *)(v2 + 48) hasActiveQueries])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = (os_unfair_lock_s *)(v3 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 32));
      -[HDHealthStoreServer _lock_cancelActiveClientTransaction](v3);
      id v6 = [*(id *)(v3 + 88) process];
      id v7 = [v6 name];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke;
      aBlock[3] = &unk_1E62FFD50;
      id v23 = v7;
      id v24 = v4;
      id v8 = v7;
      id v9 = _Block_copy(aBlock);
      id v10 = objc_alloc(MEMORY[0x1E4F2B8E0]);
      uint64_t v11 = *(void *)(v3 + 16);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_475;
      v20[3] = &unk_1E62F29A0;
      id v12 = v9;
      id v21 = v12;
      uint64_t v13 = [v10 initWithQueue:v11 completion:v20];
      id v14 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v13;

      id v15 = *(void **)(v3 + 24);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_2;
      v18[3] = &unk_1E62F2F20;
      id v19 = v12;
      id v16 = v12;
      [v15 startWithTimeoutInterval:v18 handler:29.0];
      os_unfair_lock_unlock(v5);
    }
  }
  else
  {
    id v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v17();
  }
}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_475(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, HDHealthStoreServer *, id))a5;
  id v16 = 0;
  if (self)
  {
    BOOL v11 = [(HDHealthStoreClient *)self->_client hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:&v16];
    id v12 = v16;
    id v13 = v12;
    if (v11)
    {

      id v14 = [(HDProfile *)self->_profile unitPreferencesManager];
      id v15 = 0;
      self = (HDHealthStoreServer *)[v14 setPreferredUnit:v8 forType:v9 error:&v15];
      id v13 = v15;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  v10[2](v10, self, v13);
}

- (void)remote_removePreferredUnitForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, HDHealthStoreServer *, void))a4;
  id v15 = 0;
  if (self)
  {
    BOOL v8 = [(HDHealthStoreClient *)self->_client hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:&v15];
    id v9 = v15;
    id v10 = v9;
    if (v8)
    {
      BOOL v11 = [(HDProfile *)self->_profile unitPreferencesManager];
      id v14 = v10;
      self = (HDHealthStoreServer *)[v11 removePreferredUnitForType:v6 error:&v14];
      id v12 = v14;

      if (self) {
        id v13 = 0;
      }
      else {
        id v13 = v12;
      }
      id v10 = v12;
    }
    else
    {
      self = 0;
      id v13 = v9;
    }
  }
  else
  {
    id v10 = 0;
    id v13 = 0;
  }
  ((void (**)(id, HDHealthStoreServer *, id))v7)[2](v7, self, v13);
}

- (void)remote_fetchUnitPreferencesForTypes:(id)a3 version:(int64_t)a4 withCompletion:(id)a5
{
  profile = self->_profile;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = a3;
  BOOL v11 = [(HDProfile *)profile unitPreferencesManager];
  clientAuthorizationOracle = self->_clientAuthorizationOracle;
  id v15 = 0;
  id v13 = [v11 unitPreferencesDictionaryForTypes:v10 version:a4 authorizationOracle:clientAuthorizationOracle error:&v15];

  id v14 = v15;
  v9[2](v9, v13, v14);
}

- (void)unitPreferencesManagerDidUpdateUnitPreferences:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"HDHealthStoreServerUserPreferencesDidChangeNotification" object:self];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDHealthStoreServer_unitPreferencesManagerDidUpdateUnitPreferences___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __70__HDHealthStoreServer_unitPreferencesManagerDidUpdateUnitPreferences___block_invoke(uint64_t a1)
{
  -[HDHealthStoreServer _clientRemoteObjectProxy](*(void *)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientRemote_unitPreferencesDidUpdate");
}

- (void)remote_setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, void))a4;
  client = self->_client;
  uint64_t v8 = *MEMORY[0x1E4F29748];
  uint64_t v9 = *MEMORY[0x1E4F29B28];
  id v24 = 0;
  BOOL v10 = [(HDHealthStoreClient *)client hasRequiredArrayEntitlement:v8 containing:v9 error:&v24];
  id v11 = v24;
  if (v10)
  {
    id v12 = [HDKeyValueDomain alloc];
    uint64_t v13 = *MEMORY[0x1E4F2BF40];
    id v14 = [(HDHealthStoreServer *)self profile];
    id v15 = [(HDKeyValueDomain *)v12 initWithCategory:5 domainName:v13 profile:v14];

    id v16 = [NSNumber numberWithInteger:a3];
    uint64_t v17 = *MEMORY[0x1E4F2BF48];
    id v23 = v11;
    BOOL v18 = [(HDKeyValueDomain *)v15 setNumber:v16 forKey:v17 error:&v23];
    id v19 = v23;

    if (v18)
    {
      id v20 = [(HDProfile *)self->_profile nanoSyncManager];
      [v20 syncHealthDataWithOptions:0 reason:@"Siri authorization changed" completion:0];

      _HKInitializeLogging();
      id v21 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = self;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfuly saved the authorization status for Siri", buf, 0xCu);
      }
      v6[2](v6, 1, 0);
    }
    else
    {
      _HKInitializeLogging();
      id v22 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = self;
        __int16 v27 = 2114;
        uint64_t v28 = v17;
        __int16 v29 = 2114;
        id v30 = v19;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
      }
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v19);
    }
  }
  else
  {
    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v11);
    id v19 = v11;
  }
}

- (void)remote_getAllHealthDataAccessForSiriWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, id))a3;
  uint64_t v5 = [(HDHealthStoreClient *)self->_client sourceBundleIdentifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2BF50]];

  if (!v6)
  {
    id v8 = 0;
LABEL_5:
    client = self->_client;
    uint64_t v10 = *MEMORY[0x1E4F29748];
    uint64_t v11 = *MEMORY[0x1E4F29B18];
    id v29 = 0;
    BOOL v12 = [(HDHealthStoreClient *)client hasRequiredArrayEntitlement:v10 containing:v11 error:&v29];
    id v13 = v29;
    if (!v12)
    {
      v4[2](v4, 0, v13);
      id v20 = v13;
LABEL_18:

      goto LABEL_19;
    }
    id v14 = [HDKeyValueDomain alloc];
    uint64_t v15 = *MEMORY[0x1E4F2BF40];
    id v16 = [(HDHealthStoreServer *)self profile];
    uint64_t v17 = [(HDKeyValueDomain *)v14 initWithCategory:5 domainName:v15 profile:v16];

    uint64_t v18 = *MEMORY[0x1E4F2BF48];
    id v28 = v13;
    id v19 = [(HDKeyValueDomain *)v17 numberForKey:v18 error:&v28];
    id v20 = v28;

    if (v19)
    {
      _HKInitializeLogging();
      id v21 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = self;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfuly returned the authorization status for Siri", buf, 0xCu);
      }
      uint64_t v22 = [v19 integerValue];
      id v23 = v4[2];
      id v24 = v4;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v26 = *MEMORY[0x1E4F29EF8];
      __int16 v27 = *MEMORY[0x1E4F29EF8];
      if (v20)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v32 = self;
          __int16 v33 = 2114;
          id v34 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Getting the value for key value domain failed with error: %{public}@", buf, 0x16u);
        }
        id v23 = v4[2];
        id v24 = v4;
        uint64_t v22 = 0;
        id v25 = v20;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = self;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Found no existing authorization status for Siri, and returning not determined status.", buf, 0xCu);
      }
      id v23 = v4[2];
      id v24 = v4;
      uint64_t v22 = 3;
    }
    id v25 = 0;
LABEL_17:
    v23(v24, v22, v25);

    goto LABEL_18;
  }
  id v30 = 0;
  id v7 = [(HDHealthStoreServer *)self clientSourceWithError:&v30];
  id v8 = v30;
  if (v7)
  {

    goto LABEL_5;
  }
  v4[2](v4, 0, v8);
LABEL_19:
}

- (void)conceptIndexManagerDidBecomeQuiescent:(id)a3 samplesProcessedCount:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  client = self->_client;
  id v13 = 0;
  BOOL v7 = [(HDHealthStoreClient *)client verifyHealthRecordsPermissionGrantedWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    uint64_t v9 = -[HDHealthStoreServer _clientRemoteObjectProxy]((uint64_t)self);
    objc_msgSend(v9, "clientRemote_conceptIndexManagerDidBecomeQuiescentWithSamplesProcessedCount:", a4);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v10;
      BOOL v12 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Dropping concept index manager quiescence notification with permission error %{public}@", buf, 0xCu);
    }
  }
}

- (void)remote_splitTotalCalories:(double)a3 timeInterval:(double)a4 withCompletion:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke;
  aBlock[3] = &unk_1E630D318;
  void aBlock[4] = self;
  double v27 = a3;
  double v28 = a4;
  id v9 = v8;
  id v26 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = (void *)MEMORY[0x1E4F2B388];
  BOOL v12 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A630]];
  id v13 = (void *)MEMORY[0x1E4F2B370];
  id v14 = [MEMORY[0x1E4F2B618] unitFromString:@"kg"];
  uint64_t v15 = [v13 quantityWithUnit:v14 doubleValue:0.0];
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v18 = [v11 quantitySampleWithType:v12 quantity:v15 startDate:v16 endDate:v17];

  v29[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_2;
  v23[3] = &unk_1E630D340;
  id v24 = v10;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_3;
  v21[3] = &unk_1E62FFD78;
  id v20 = v24;
  id v22 = v20;
  if (self) {
    [(HDClientAuthorizationOracle *)self->_clientAuthorizationOracle performIfAuthorizedToReadObjects:v19 onQueue:self->_queue usingBlock:v23 errorHandler:v21];
  }
}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 72) userCharacteristicsManager];
  [v4 restingCaloriesFromTotalCalories:a2 timeInterval:*(double *)(a1 + 48) authorizedToRead:*(double *)(a1 + 56)];
  unint64_t v6 = v5;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v9 = *(uint64_t (**)(__n128))(result + 16);
    v7.n128_u64[0] = v6;
    return v9(v7);
  }
  return result;
}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke;
  v17[3] = &unk_1E62F61D0;
  id v20 = v10;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E62FFD78;
  id v13 = v20;
  id v16 = v13;
  id v14 = v13;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E4F2A548], v17, v15);
    id v14 = v16;
  }
}

uint64_t __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = [MEMORY[0x1E4F2B898] setValue:a1[4] forKey:a1[5]];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

uint64_t __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remote_dropEntitlement:(id)a3 completion:(id)a4
{
  id v9 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  __n128 v7 = [(HDHealthStoreServer *)self client];
  id v8 = [v7 process];
  [v8 dropEntitlement:v6];

  v9[2](v9, 1, 0);
}

- (void)remote_restoreEntitlement:(id)a3 completion:(id)a4
{
  id v9 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  __n128 v7 = [(HDHealthStoreServer *)self client];
  id v8 = [v7 process];
  [v8 restoreEntitlement:v6];

  v9[2](v9, 1, 0);
}

- (void)remote_getIsFeatureSetAvailable:(unint64_t)a3 completion:(id)a4
{
  id v17 = 0;
  id v6 = (void (**)(id, void, id))a4;
  if (!self) {
    goto LABEL_13;
  }
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__getIsFeatureSetAvailable_error_, @"Unsupported feature."", v17);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v12;
    if (v12) {
      id v17 = v12;
    }

    goto LABEL_13;
  }
  if (![(HDHealthStoreClient *)self->_client verifyHealthRecordsPermissionGrantedWithError:&v17])
  {
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  __n128 v7 = -[HDProfile profileExtensionsConformingToProtocol:](self->_profile, "profileExtensionsConformingToProtocol:", &unk_1F18A8528, v17);
  id v8 = [v7 firstObject];

  if (v8)
  {
    char v18 = 0;
    int v9 = [v8 deviceConfigurationSupportsHealthRecords:&v18 error:&v17];
    uint64_t v10 = 1;
    if (!v18) {
      uint64_t v10 = 2;
    }
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Health Records plugin unavailable.");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v14;
    if (v14) {
      id v17 = v14;
    }

    uint64_t v11 = 0;
  }

LABEL_18:
  id v16 = v17;
  v6[2](v6, v11, v16);
}

- (void)remote_addSamples:(id)a3 toWorkout:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 UUID];
  id v12 = HDDataEntityPredicateForDataUUID();
  id v13 = [(HDHealthStoreServer *)self profile];
  id v14 = [v13 database];
  id v29 = 0;
  uint64_t v15 = +[HDHealthEntity anyWithPredicate:v12 healthDatabase:v14 error:&v29];
  unint64_t v16 = (unint64_t)v29;

  if (v15 | v16)
  {
    id v28 = 0;
    char v21 = [MEMORY[0x1E4F2B718] _validateObjects:v8 forClass:objc_opt_class() error:&v28];
    id v19 = v28;

    if (v21)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke;
      v23[3] = &unk_1E62F9580;
      id v27 = v10;
      id v24 = v8;
      id v25 = v9;
      id v26 = self;
      [(HDHealthStoreServer *)self remote_saveDataObjects:v24 skipInsertionFilter:0 creationDateOverride:0 handler:v23];
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v19);
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    id v19 = [v9 UUID];
    id v20 = objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v18, a2, @"Workout with UUID (%@) has not yet been saved"", v19);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
  }
}

void __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_532);
    id v4 = [*(id *)(a1 + 40) UUID];
    id v12 = 0;
    unint64_t v5 = [*(id *)(a1 + 48) profile];
    id v11 = 0;
    BOOL v6 = +[HDAssociationEntity associateSampleUUIDs:v3 withSampleUUID:v4 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v12 profile:v5 error:&v11];
    id v7 = v12;
    id v8 = v11;

    if (v6)
    {
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"HDHealthStoreServerDidAssociateWorkoutSamples" object:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
}

uint64_t __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)remote_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v53 = 0;
  if (!self)
  {
    id v12 = 0;
    goto LABEL_18;
  }
  BOOL v11 = [(HDHealthStoreClient *)self->_client hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:&v53];
  id v12 = v53;
  if (!v11)
  {
LABEL_18:
    v10[2](v10, 0, v12);
    goto LABEL_19;
  }
  BOOL v48 = v8;
  BOOL v49 = v9;
  id v13 = [v8 UUID];
  id v14 = HDDataEntityPredicateForDataUUID();
  uint64_t v15 = [(HDHealthStoreServer *)self profile];
  unint64_t v16 = [v15 database];
  id v52 = 0;
  id v17 = +[HDHealthEntity anyWithPredicate:v14 healthDatabase:v16 error:&v52];
  id v18 = v52;

  if (v17 || !v18)
  {
    id v46 = v17;
    id v47 = v12;
    id v19 = [v9 UUID];
    id v20 = HDDataEntityPredicateForDataUUID();
    char v21 = [(HDHealthStoreServer *)self profile];
    id v22 = [v21 database];
    id v51 = v18;
    id v23 = +[HDHealthEntity anyWithPredicate:v20 healthDatabase:v22 error:&v51];
    id v24 = v51;

    if (v24)
    {
      v10[2](v10, 0, v24);
      id v18 = v24;
      id v9 = v49;
      id v8 = v48;
      id v17 = v46;
    }
    else
    {
      id v25 = v48;
      id v26 = v49;
      id v27 = v10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __93__HDHealthStoreServer__completionHandlerForReplaceWithOriginalWorkout_newWorkout_completion___block_invoke;
      aBlock[3] = &unk_1E62F95D0;
      id v28 = v25;
      id v55 = v28;
      id v29 = v26;
      id v56 = v29;
      id v57 = self;
      id v30 = v27;
      id v58 = v30;
      uint64_t v31 = _Block_copy(aBlock);
      id v32 = v23;
      __int16 v33 = (void (**)(void *, uint64_t, void))_Block_copy(v31);

      id v45 = v32;
      if (v32)
      {
        v33[2](v33, 1, 0);
        id v18 = 0;
        id v8 = v48;
        id v9 = v49;
        id v17 = v46;
        id v12 = v47;
      }
      else
      {
        id v34 = [v28 sourceRevision];
        uint64_t v35 = [v34 source];
        uint64_t v36 = [v35 bundleIdentifier];

        id v37 = [(HDHealthStoreServer *)self profile];
        id v38 = [v37 sourceManager];
        id v50 = 0;
        id v44 = (void *)v36;
        uint64_t v39 = [v38 localSourceForBundleIdentifier:v36 copyIfNecessary:1 error:&v50];
        id v18 = v50;

        id v12 = v47;
        if (v39)
        {
          id v59 = v29;
          id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          uint64_t v41 = [v28 sourceRevision];
          char v42 = [v41 version];
          [(HDHealthStoreServer *)self _saveDataObjects:v40 sourceEntity:v39 sourceVersion:v42 handler:v33];
        }
        else
        {
          v60[0] = v29;
          id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
          [(HDHealthStoreServer *)self remote_saveDataObjects:v40 skipInsertionFilter:0 creationDateOverride:0 handler:v33];
        }
        id v43 = (void *)v39;
        id v8 = v48;
        id v9 = v49;
        id v17 = v46;
      }
      id v23 = v45;
    }
  }
  else
  {
    v10[2](v10, 0, v18);
    id v8 = v48;
  }

LABEL_19:
}

void __93__HDHealthStoreServer__completionHandlerForReplaceWithOriginalWorkout_newWorkout_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v5 = [*(id *)(a1 + 48) profile];
    id v15 = 0;
    LOBYTE(v3) = +[HDWorkoutEntity copySampleAssociationsFromWorkout:v3 toWorkout:v4 profile:v5 error:&v15];
    id v6 = v15;

    if (v3)
    {
      id v7 = *(void **)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      objc_msgSend(v7, "remote_deleteDataObjects:options:handler:", v8, 0, *(void *)(a1 + 56));
    }
    else
    {
      _HKInitializeLogging();
      id v10 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = *(void **)(a1 + 32);
        id v12 = v10;
        id v13 = [v11 UUID];
        id v14 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543874;
        id v18 = v13;
        __int16 v19 = 2114;
        id v20 = v14;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Unable to copy sample associations from workout with UUID %{public}@ to workout with UUID %{public}@: %{public}@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v9();
  }
}

- (void)remote_startWatchAppWithWorkoutConfiguration:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(HDHealthStoreServer *)self profile];
  id v8 = [v7 workoutManager];

  if (v8)
  {
    id v9 = [(HDHealthStoreServer *)self client];
    [v8 startWatchAppWithWorkoutConfiguration:v10 client:v9 completion:v6];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    v6[2](v6, 0, v9);
  }
}

- (void)remote_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v12 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = [(HDHealthStoreServer *)self profile];
  id v10 = [v9 workoutManager];

  if (v10)
  {
    [v10 startWatchAppWithWorkoutPlanData:v12 processIdentifier:v6 completion:v8];
  }
  else
  {
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    v8[2](v8, 0, v11);
  }
}

- (void)remote_recoverActiveWorkoutSessionWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HDHealthStoreServer *)self profile];
  uint64_t v6 = [v5 workoutManager];

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke;
    block[3] = &unk_1E62F4E40;
    id v10 = v6;
    BOOL v11 = self;
    id v12 = v4;
    dispatch_sync(queue, block);
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v8);
  }
}

void __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) client];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke_2;
  v6[3] = &unk_1E630D388;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [v2 recoverWorkoutSessionForClient:v3 server:v4 completion:v6];
}

void __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) client];
    id v8 = [v5 sessionUUID];
    id v14 = 0;
    id v9 = [*(id *)(a1 + 32) profile];
    id v13 = v6;
    id v10 = +[HDWorkoutBuilderServer recoveredWorkoutBuilderConfigurationForClient:v7 sessionIdentifier:v8 builderIdentifierOut:&v14 profile:v9 error:&v13];
    id v11 = v14;
    id v12 = v13;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v12 = v6;
  }
}

- (void)remote_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HDHealthStoreServer *)self profile];
  id v8 = [v7 workoutManager];

  if (v8)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__HDHealthStoreServer_remote_setMirroredWorkoutSessionObserverStateToEnabled_completion___block_invoke;
    v12[3] = &unk_1E630D3B0;
    BOOL v16 = a3;
    id v13 = v8;
    id v14 = self;
    id v15 = v6;
    dispatch_async(queue, v12);

    id v10 = v13;
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = self;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to update remote workout session observer state.", buf, 0xCu);
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_featureUnavailableForProfileError");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

uint64_t __89__HDHealthStoreServer_remote_setMirroredWorkoutSessionObserverStateToEnabled_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    [v3 registerCurrentWorkoutObserver:v4];
  }
  else {
    [v3 unregisterCurrentWorkoutObserver:v4];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

- (void)remote_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 workoutActivity:(id)a5 samples:(id)a6 completion:(id)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, void, id))a7;
  id v30 = 0;
  if (!self)
  {
    id v19 = 0;
    goto LABEL_11;
  }
  BOOL v18 = [(HDHealthStoreClient *)self->_client hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:&v30];
  id v19 = v30;
  if (!v18)
  {
LABEL_11:
    v17[2](v17, 0, v19);
    goto LABEL_12;
  }
  id v20 = [v13 quantityType];
  uint64_t v21 = [v20 code];

  if (v21 != 304)
  {
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Sample is expected to be of type HKQuantityTypeIdentifierWorkoutEffortScore"");
LABEL_9:
    id v27 = (void *)v26;
    v17[2](v17, 0, (id)v26);

    goto LABEL_12;
  }
  if (v15)
  {
    id v22 = [v14 workoutActivities];
    char v23 = [v22 containsObject:v15];

    if ((v23 & 1) == 0)
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Activity must be inside workout activities.");
      goto LABEL_9;
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  id v28[2] = __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke;
  v28[3] = &unk_1E630D3D8;
  v28[4] = self;
  id v24 = v17;
  id v29 = v24;
  [v16 enumerateObjectsUsingBlock:v28];
  v31[0] = v13;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [(HDHealthStoreServer *)self remote_relateSamples:v25 withObject:v14 subObject:v15 type:1 completion:v24];

LABEL_12:
}

void __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 quantityType];
  uint64_t v5 = [v4 code];

  if (v5 == 304)
  {
    id v6 = [v3 sourceRevision];
    id v7 = [v6 source];

    if (([v7 _isAppleWatch] & 1) != 0
      || ([v7 bundleIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqual:*MEMORY[0x1E4F2BD50]],
          v8,
          v9))
    {
      id v10 = *(void **)(a1 + 32);
      v14[0] = v3;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke_2;
      v12[3] = &unk_1E62F29A0;
      id v13 = *(id *)(a1 + 40);
      objc_msgSend(v10, "remote_deleteDataObjects:options:handler:", v11, 0, v12);
    }
  }
}

uint64_t __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)remote_relateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v25 = a5;
  id v13 = a7;
  id v14 = [v12 UUID];
  id v15 = HDDataEntityPredicateForDataUUID();
  id v16 = [(HDHealthStoreServer *)self profile];
  id v17 = [v16 database];
  id v32 = 0;
  uint64_t v18 = +[HDHealthEntity anyWithPredicate:v15 healthDatabase:v17 error:&v32];
  uint64_t v19 = (uint64_t)v32;

  if (v18 | v19)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __81__HDHealthStoreServer_remote_relateSamples_withObject_subObject_type_completion___block_invoke;
    v26[3] = &unk_1E630D400;
    id v30 = v13;
    void v26[4] = self;
    id v27 = v11;
    id v28 = v12;
    unint64_t v31 = a6;
    id v29 = v25;
    [(HDHealthStoreServer *)self remote_saveDataObjects:v27 skipInsertionFilter:0 creationDateOverride:0 handler:v26];

    id v22 = v30;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = objc_opt_class();
    uint64_t v19 = [v12 UUID];
    id v22 = objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v21, a2, @"Workout with UUID (%@) has not yet been saved"", v19);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v22);
  }
}

void __81__HDHealthStoreServer_remote_relateSamples_withObject_subObject_type_completion___block_invoke(void *a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1[4] + 72) associationManager];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[9];
    uint64_t v7 = a1[7];
    id v10 = 0;
    [v3 associateObjects:v4 withObject:v5 type:v6 destinationSubObject:v7 error:&v10];
    id v8 = v10;

    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    int v9 = *(void (**)(void))(a1[8] + 16);
    v9();
  }
}

- (void)remote_unrelateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  profile = self->_profile;
  id v12 = (void (**)(id, uint64_t, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(HDProfile *)profile associationManager];
  id v19 = 0;
  uint64_t v17 = [v16 disassociateObjects:v15 withObject:v14 type:a6 destinationSubObject:v13 error:&v19];

  id v18 = v19;
  v12[2](v12, v17, v18);
}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (HDHealthStoreServer *)a4;
  if ([(HDHealthStoreServer *)v5 sessionType] == 1)
  {
    uint64_t v6 = [(HDHealthStoreClient *)self->_client sourceBundleIdentifier];
    uint64_t v7 = [(HDHealthStoreServer *)v5 clientProcessBundleIdentifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      os_unfair_lock_lock(&self->_lock);
      taskServerEndpointsByUUID = self->_taskServerEndpointsByUUID;
      id v10 = [(HDHealthStoreServer *)v5 identifier];
      id v11 = [(NSMutableDictionary *)taskServerEndpointsByUUID objectForKeyedSubscript:v10];

      id v12 = (os_log_t *)MEMORY[0x1E4F29FB8];
      if (v11)
      {
        _HKInitializeLogging();
        id v13 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v5;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[mirroring] Will invalidate previous task server for workout %@", buf, 0xCu);
        }
        id v14 = self->_taskServerEndpointsByUUID;
        id v15 = [(HDHealthStoreServer *)v5 identifier];
        [(NSMutableDictionary *)v14 setObject:0 forKeyedSubscript:v15];
      }
      os_unfair_lock_unlock(&self->_lock);
      [v11 invalidate];
      id v20 = 0;
      id v16 = [(HDHealthStoreServer *)v5 taskServerConfigurationForRecoveryWithError:&v20];
      id v17 = v20;
      if (v16)
      {
        id v18 = -[HDHealthStoreServer _clientRemoteObjectProxy]((uint64_t)self);
        objc_msgSend(v18, "clientRemote_didCreateRemoteSessionWithConfiguration:", v16);

        [(HDHealthStoreServer *)v5 setClientDidSetupSession:1];
      }
      else
      {
        _HKInitializeLogging();
        id v19 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v22 = self;
          __int16 v23 = 2112;
          id v24 = v17;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Error occurred while retrieving task configuration for remote session: %@", buf, 0x16u);
        }
      }
    }
  }
}

@end