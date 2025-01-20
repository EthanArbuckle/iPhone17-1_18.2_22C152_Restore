@interface HDQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (Class)queryClass;
+ (id)builtInQueryServerClasses;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (BOOL)_shouldObserveAllSampleTypes;
- (BOOL)_shouldObserveDatabaseProtectedDataAvailability;
- (BOOL)_shouldObserveOnPause;
- (BOOL)_shouldStopProcessingQuery;
- (BOOL)_shouldSuspendQuery;
- (BOOL)clientHasActiveWorkout;
- (BOOL)hasActiveDaemonTransaction;
- (BOOL)prepareToActivateServerWithError:(id *)a3;
- (BOOL)validateConfiguration:(id *)a3;
- (HDHealthStoreClient)client;
- (HDProfile)profile;
- (HDQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDQueryServerClientState)clientState;
- (HDQueryServerDelegate)delegate;
- (HKObjectType)objectType;
- (HKQuantityType)quantityType;
- (HKQueryClientInterface)clientProxy;
- (HKQueryServerConfiguration)configuration;
- (HKSampleType)sampleType;
- (NSSet)objectTypes;
- (NSString)description;
- (NSUUID)queryUUID;
- (OS_dispatch_queue)queryQueue;
- (_HKFilter)filter;
- (__CFString)_queryStateString;
- (double)activationTime;
- (double)collectionInterval;
- (id)_queue_collectionObserverState;
- (id)_queue_sampleTypesForObservation;
- (id)createDatabaseTransactionContext;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)filteredSamplesForClientWithSamples:(id)a3;
- (id)newDataEntityEnumerator;
- (id)predicateForQueryClient;
- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4;
- (id)remoteInterface;
- (id)sampleAuthorizationFilter;
- (id)sanitizedSampleForQueryClient:(id)a3;
- (id)taskUUID;
- (id)unitTest_queryServerDidFinishStateTransitionHandler;
- (id)unitTest_queryServerSetShouldPauseHandler;
- (id)unitTest_queryServerWillChangeStateHandler;
- (int64_t)dataCount;
- (int64_t)queryState;
- (uint64_t)_backgroundRunningCollectionSupportedForClient;
- (void)_queue_activateServerWithClientState:(void *)a3 error:;
- (void)_queue_beginObservingDataTypes;
- (void)_queue_didFinishTransitionFromState:(uint64_t)a1;
- (void)_queue_endObservingDataTypes;
- (void)_queue_invalidateActiveQueryTransaction;
- (void)_queue_setQueryState:(uint64_t)a1;
- (void)_queue_start;
- (void)_queue_startDataCollection;
- (void)_queue_stop;
- (void)_queue_stopDataCollection;
- (void)_queue_takeActiveQueryTransaction;
- (void)_queue_transitionToFinished;
- (void)_queue_transitionToPaused;
- (void)_queue_transitionToSuspendedState:(id *)a1;
- (void)_queue_updateSampleTypeObservationAssertions;
- (void)_setShouldPause:(uint64_t)a1;
- (void)activateServerWithClientState:(id)a3 error:(id)a4;
- (void)clientStateDidChange:(id)a3;
- (void)clientStateWillChange:(id)a3;
- (void)connectionInvalidated;
- (void)deactivateServerWithCompletion:(id)a3;
- (void)dealloc;
- (void)onQueue:(id)a3;
- (void)remote_deactivateServer;
- (void)remote_startQueryWithCompletion:(id)a3;
- (void)scheduleDatabaseAccessOnQueueWithBlock:(id)a3;
- (void)schedulePause;
- (void)setClientState:(id)a3;
- (void)setCollectionInterval:(double)a3;
- (void)setDataCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setQueryDidFinishHandler:(id)a3;
- (void)setUnitTest_queryServerDidFinishStateTransitionHandler:(id)a3;
- (void)setUnitTest_queryServerSetShouldPauseHandler:(id)a3;
- (void)setUnitTest_queryServerWillChangeStateHandler:(id)a3;
@end

@implementation HDQueryServer

- (NSUUID)queryUUID
{
  return self->_queryUUID;
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HKSampleType)sampleType
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_objectType;
  }
  else {
    v3 = 0;
  }

  return (HKSampleType *)v3;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void)setQueryDidFinishHandler:(id)a3
{
  id v4 = a3;
  queryQueue = self->_queryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HDQueryServer_setQueryDidFinishHandler___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queryQueue, v7);
}

- (void)onQueue:(id)a3
{
}

void __42__HDQueryServer_setQueryDidFinishHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)_queue_setQueryState:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    signed int v4 = atomic_exchange((atomic_uint *volatile)(a1 + 72), a2);
    uint64_t v5 = v4;
    if (v4 != a2) {
      objc_msgSend((id)a1, "_queue_didChangeStateFromPreviousState:state:", v4, a2);
    }
    id v6 = _Block_copy(*(const void **)(a1 + 184));
    v7 = v6;
    if (v6)
    {
      id v8 = *(NSObject **)(a1 + 88);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__HDQueryServer__queue_setQueryState___block_invoke;
      v9[3] = &unk_1E63053B0;
      v9[4] = a1;
      id v10 = v6;
      uint64_t v11 = v5;
      uint64_t v12 = a2;
      dispatch_async(v8, v9);
    }
  }
}

- (void)scheduleDatabaseAccessOnQueueWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained daemon];
  v7 = [v6 queryManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke;
  v9[3] = &unk_1E62FB2F8;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v7 scheduleDatabaseAccessForQueryServer:self block:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained _shouldStopProcessingQuery] & 1) == 0)
  {
    id v4 = v3[17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke_2;
    block[3] = &unk_1E62F2F20;
    id v6 = *(id *)(a1 + 32);
    dispatch_sync(v4, block);
  }
}

- (BOOL)_shouldStopProcessingQuery
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldFinish);
  return v2 & 1;
}

uint64_t __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __36__HDQueryServer__scheduleStartQuery__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  uint64_t v3 = [WeakRetained daemon];
  id v4 = [v3 behavior];
  int v5 = [v4 isAppleInternalInstall];

  if (v5)
  {
    id v6 = objc_alloc_init(HDDatabaseTransactionContextStatistics);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 96);
    *(void *)(v7 + 96) = v6;
  }
  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__HDQueryServer__scheduleStartQuery__block_invoke_2;
  v10[3] = &unk_1E62F7308;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10[4] = *(void *)(a1 + 32);
  [v9 scheduleDatabaseAccessOnQueueWithBlock:v10];
  objc_destroyWeak(&v11);
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  unsigned __int8 v2 = [(HDQueryServer *)self client];
  uint64_t v3 = [v2 accessibilityAssertions];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)_shouldListenForUpdates
{
  return 0;
}

- (HKQueryClientInterface)clientProxy
{
  unsigned __int8 v2 = [(HDHealthStoreClient *)self->_client connection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return (HKQueryClientInterface *)v3;
}

- (NSString)description
{
  uint64_t v3 = [(HDHealthStoreClient *)self->_client process];
  BOOL v4 = [v3 name];
  int v5 = [(HKQueryServerConfiguration *)self->_configuration debugIdentifier];
  [(HKQueryServerConfiguration *)self->_configuration qualityOfService];
  id v6 = -[HDQueryServer _queryStateString]((__CFString *)self);
  uint64_t v7 = HKCopyQueryDescription();

  return (NSString *)v7;
}

- (__CFString)_queryStateString
{
  if (result)
  {
    unint64_t v1 = [(__CFString *)result queryState];
    if (v1 > 4) {
      return @"Unknown state";
    }
    else {
      return off_1E6305418[v1];
    }
  }
  return result;
}

- (void)_queue_start
{
  if ([(HDQueryServer *)self queryState] != 2)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HDQueryServer.m", 801, @"Invalid parameter not satisfying: %@", @"self.queryState == HDQueryServerStateRunning" object file lineNumber description];
  }
  if ([(HDQueryServer *)self _shouldListenForUpdates])
  {
    -[HDQueryServer _queue_beginObservingDataTypes]((uint64_t)self);
  }
}

- (void)_queue_beginObservingDataTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 77))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    uint64_t v3 = [WeakRetained dataManager];

    id v4 = objc_loadWeakRetained((id *)(a1 + 128));
    int v5 = [v4 associationManager];

    if ([(id)a1 _shouldObserveAllSampleTypes])
    {
      [v3 addObserverForAllTypes:a1];
      [v5 addObserverForAllTypes:a1];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = objc_msgSend((id)a1, "objectTypes", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            [v3 addObserver:a1 forDataType:v11];
            [v5 addObserver:a1 forDataType:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    *(unsigned char *)(a1 + 77) = 1;
  }
}

- (BOOL)_shouldObserveAllSampleTypes
{
  return 0;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (void)_queue_transitionToPaused
{
  if (!a1) {
    return;
  }
  uint64_t v2 = [a1 queryState];
  if (v2 == 3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:sel__queue_transitionToPaused, a1, @"HDQueryServer.m", 489, @"Invalid parameter not satisfying: %@", @"queryServerState != HDQueryServerStatePaused" object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  if (v2 == 4)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:sel__queue_transitionToPaused, a1, @"HDQueryServer.m", 490, @"Invalid parameter not satisfying: %@", @"queryServerState != HDQueryServerStateFinished" object file lineNumber description];
    goto LABEL_9;
  }
LABEL_4:

  -[HDQueryServer _queue_transitionToSuspendedState:]((id *)a1, 3);
}

- (void)_queue_transitionToSuspendedState:(id *)a1
{
  uint64_t v4 = [a1 queryState];
  -[HDQueryServer _queue_setQueryState:]((uint64_t)a1, a2);
  if (([a1 _shouldExecuteWhenProtectedDataIsUnavailable] & 1) != 0
    || [a1 _shouldObserveDatabaseProtectedDataAvailability])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 16);
    id v6 = [WeakRetained database];
    [v6 removeProtectedDataObserver:a1];
  }
  if (v4 == 2)
  {
    objc_msgSend(a1, "_queue_stop");
    if ([a1 _shouldListenForUpdates]
      && ([a1 queryState] == 4 || (objc_msgSend(a1, "_shouldObserveOnPause") & 1) == 0))
    {
      objc_msgSend(a1, "_queue_stopDataCollection");
    }
    -[HDQueryServer _queue_invalidateActiveQueryTransaction](a1);
  }

  -[HDQueryServer _queue_didFinishTransitionFromState:]((uint64_t)a1, v4);
}

- (void)_queue_stop
{
  int64_t v4 = [(HDQueryServer *)self queryState];
  if ((unint64_t)(v4 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDQueryServer.m", 809, @"Invalid parameter not satisfying: %@", @"(queryState == HDQueryServerStateFinished) || (queryState == HDQueryServerStatePaused)" object file lineNumber description];
  }
  else if (v4 == 3 && [(HDQueryServer *)self _shouldObserveOnPause])
  {
    -[HDQueryServer _queue_beginObservingDataTypes]((uint64_t)self);
    return;
  }

  -[HDQueryServer _queue_endObservingDataTypes]((uint64_t)self);
}

- (BOOL)_shouldObserveOnPause
{
  return 0;
}

- (void)_queue_endObservingDataTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 77))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    uint64_t v3 = [WeakRetained dataManager];

    id v4 = objc_loadWeakRetained((id *)(a1 + 128));
    int v5 = [v4 associationManager];

    if ([(id)a1 _shouldObserveAllSampleTypes])
    {
      [v3 removeObserverForAllTypes:a1];
      [v5 removeObserverForAllTypes:a1];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = objc_msgSend((id)a1, "objectTypes", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            [v3 removeObserver:a1 forDataType:v11];
            [v5 removeObserver:a1 forDataType:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    *(unsigned char *)(a1 + 77) = 0;
  }
}

- (BOOL)clientHasActiveWorkout
{
  uint64_t v3 = [(HDQueryServer *)self client];
  id v4 = [v3 process];
  int v5 = [v4 bundleIdentifier];

  id v6 = [(HDQueryServer *)self profile];
  uint64_t v7 = [v6 workoutManager];
  uint64_t v8 = [v7 currentWorkoutClient];
  uint64_t v9 = [v8 process];
  id v10 = [v9 bundleIdentifier];
  char v11 = [v10 isEqualToString:v5];

  return v11;
}

- (id)newDataEntityEnumerator
{
  objectType = self->_objectType;
  if (objectType)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objectType = +[HDSampleEntity entityEnumeratorWithType:objectType profile:WeakRetained];

    [objectType addEncodingOptionsFromDictionary:self->_baseDataEntityEncodingOptions];
  }
  return objectType;
}

- (id)sampleAuthorizationFilter
{
  uint64_t v3 = [(HDQueryServer *)self client];
  id v4 = [v3 authorizationOracle];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__HDQueryServer_sampleAuthorizationFilter__block_invoke;
  v8[3] = &unk_1E63053F8;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDQueryServer *)self client];
  uint64_t v8 = [v7 authorizationOracle];
  id v9 = [v8 readAuthorizationStatusForType:v6 error:a4];

  return v9;
}

- (BOOL)_shouldSuspendQuery
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldPause);
  return v2 & 1;
}

- (void)_queue_startDataCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v19 = [WeakRetained dataCollectionManager];

  id v4 = -[HDQueryServer _queue_sampleTypesForObservation](self);
  id v5 = NSString;
  id v6 = [(HDQueryServer *)self client];
  uint64_t v7 = [v6 process];
  uint64_t v8 = [v7 bundleIdentifier];
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  char v11 = [(HDQueryServer *)self queryUUID];
  long long v12 = [v11 UUIDString];
  long long v13 = [v12 substringToIndex:4];
  long long v14 = [v5 stringWithFormat:@"%@-%@-%@", v8, v10, v13];

  long long v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v16 = -[HDQueryServer _queue_collectionObserverState](self);
  uint64_t v17 = [v19 takeCollectionAssertionWithOwnerIdentifier:v14 sampleTypes:v15 observerState:v16 collectionInterval:self->_collectionInterval];

  [(HDAssertion *)self->_dataCollectionAssertion invalidate];
  dataCollectionAssertion = self->_dataCollectionAssertion;
  self->_dataCollectionAssertion = v17;

  self->_isCollectingData = 1;
  -[HDQueryServer _queue_updateSampleTypeObservationAssertions]((id *)&self->super.isa);
}

- (void)remote_deactivateServer
{
}

- (void)deactivateServerWithCompletion:(id)a3
{
  id v4 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_shouldFinish);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HDQueryServer_deactivateServerWithCompletion___block_invoke;
  v6[3] = &unk_1E62F4928;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HDQueryServer *)self onQueue:v6];
}

uint64_t __48__HDQueryServer_deactivateServerWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queryState] != 4)
  {
    -[HDQueryServer _queue_transitionToFinished](*(void *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      [*(id *)(v2 + 48) invalidate];
      uint64_t v3 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = 0;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_queue_transitionToFinished
{
  if (a1)
  {
    if ([(id)a1 queryState] == 4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__queue_transitionToFinished, a1, @"HDQueryServer.m", 465, @"Invalid parameter not satisfying: %@", @"self.queryState != HDQueryServerStateFinished" object file lineNumber description];
    }
    -[HDQueryServer _queue_transitionToSuspendedState:]((id *)a1, 4);
    id v7 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(a1 + 24));
    uint64_t v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    if (v7) {
      v7[2](v7, a1);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    [WeakRetained queryServerDidFinish:a1];

    objc_msgSend((id)a1, "_queue_stopDataCollection");
    id v4 = objc_loadWeakRetained((id *)(a1 + 128));
    id v5 = [v4 database];
    [v5 removeProtectedDataObserver:a1];

    -[HDQueryServer _queue_endObservingDataTypes](a1);
    -[HDQueryServer _queue_invalidateActiveQueryTransaction]((id *)a1);
    objc_msgSend((id)a1, "_queue_didDeactivate");
  }
}

- (void)_queue_stopDataCollection
{
  [(HDAssertion *)self->_dataCollectionAssertion invalidate];
  dataCollectionAssertion = self->_dataCollectionAssertion;
  self->_dataCollectionAssertion = 0;

  self->_isCollectingData = 0;

  -[HDQueryServer _queue_updateSampleTypeObservationAssertions]((id *)&self->super.isa);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(HDAssertion *)self->_dataCollectionAssertion invalidate];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_dataObservationAssertions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)HDQueryServer;
  [(HDQueryServer *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerDidFinishStateTransitionHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerWillChangeStateHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerSetShouldPauseHandler, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queryUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionStatistics, 0);
  objc_storeStrong((id *)&self->_unitTestQueryQueue, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_runningTransaction, 0);
  objc_storeStrong((id *)&self->_activationTransaction, 0);
  objc_storeStrong((id *)&self->_dataCollectionAssertion, 0);
  objc_storeStrong((id *)&self->_dataObservationAssertions, 0);
  objc_storeStrong(&self->_queryDidFinishHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_baseDataEntityEncodingOptions, 0);
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (int64_t)queryState
{
  return (int)atomic_load((unsigned int *)&self->_queryState);
}

- (HDQueryServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDQueryServerDelegate *)WeakRetained;
}

+ (id)builtInQueryServerClasses
{
  v4[35] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v4[20] = objc_opt_class();
  v4[21] = objc_opt_class();
  v4[22] = objc_opt_class();
  v4[23] = objc_opt_class();
  v4[24] = objc_opt_class();
  v4[25] = objc_opt_class();
  v4[26] = objc_opt_class();
  v4[27] = objc_opt_class();
  v4[28] = objc_opt_class();
  v4[29] = objc_opt_class();
  v4[30] = objc_opt_class();
  v4[31] = objc_opt_class();
  v4[32] = objc_opt_class();
  v4[33] = objc_opt_class();
  v4[34] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:35];

  return v2;
}

- (HDQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = v14;
  if (v14 && ([v14 conformsToProtocol:&unk_1F183E478] & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HDQueryServer.m", 85, @"Invalid parameter not satisfying: %@", @"[delegate conformsToProtocol:@protocol(HDQueryServerDelegate)]" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)HDQueryServer;
  v16 = [(HDQueryServer *)&v42 init];
  if (v16)
  {
    uint64_t v17 = [v11 copy];
    queryUUID = v16->_queryUUID;
    v16->_queryUUID = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_client, a5);
    id v19 = [v13 profile];
    objc_storeWeak((id *)&v16->_profile, v19);

    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeWeak((id *)&v16->_delegate, v15);
    v20 = [v13 process];
    v21 = NSString;
    uint64_t v22 = [v20 processIdentifier];
    v23 = [v20 name];
    v24 = [v11 UUIDString];
    v25 = [v21 stringWithFormat:@"%d.%@.%@", v22, v23, v24];

    uint64_t v26 = HKCreateSerialDispatchQueue();
    queryQueue = v16->_queryQueue;
    v16->_queryQueue = (OS_dispatch_queue *)v26;

    if (_HDIsUnitTesting)
    {
      v28 = [v25 stringByAppendingString:@".UnitTesting"];
      uint64_t v29 = HKCreateSerialDispatchQueue();
      unitTestQueryQueue = v16->_unitTestQueryQueue;
      v16->_unitTestQueryQueue = (OS_dispatch_queue *)v29;
    }
    atomic_store(0, (unsigned int *)&v16->_queryState);
    uint64_t v31 = [v12 objectType];
    objectType = v16->_objectType;
    v16->_objectType = (HKObjectType *)v31;

    v33 = [v12 filter];
    uint64_t v34 = [v13 filterWithQueryFilter:v33 objectType:v16->_objectType];
    filter = v16->_filter;
    v16->_filter = (_HKFilter *)v34;

    uint64_t v36 = [v13 baseDataEntityEncodingOptions];
    baseDataEntityEncodingOptions = v16->_baseDataEntityEncodingOptions;
    v16->_baseDataEntityEncodingOptions = (NSDictionary *)v36;

    v16->_collectionInterval = 5.0;
    uint64_t v38 = +[HKDaemonTransaction transactionWithOwner:v16 activityName:@"Activate"];
    activationTransaction = v16->_activationTransaction;
    v16->_activationTransaction = (HDDaemonTransaction *)v38;
  }
  return v16;
}

- (id)sanitizedSampleForQueryClient:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  client = self->_client;
  id v5 = a3;
  uint64_t v6 = [(HDHealthStoreClient *)client entitlements];
  uint64_t v7 = [v5 sanitizedSample:v5 forEntitlements:v6];

  if ([(HDHealthStoreClient *)self->_client hasPrivateMetadataAccess])
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v9 = objc_msgSend(v7, "workoutEvents", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = 0;
        uint64_t v13 = *(void *)v25;
        do
        {
          uint64_t v14 = 0;
          long long v15 = v12;
          do
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v9);
            }
            v16 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
            id v12 = [v16 metadata];

            if ([v12 count])
            {
              uint64_t v17 = objc_msgSend(v12, "hk_copySanitizedForPublicClient");
              v18 = (void *)v17;
              if (v12 != (void *)v17 && (!v17 || ([v12 isEqual:v17] & 1) == 0)) {
                [v16 _setWorkoutEventMetadata:v18];
              }
            }
            ++v14;
            long long v15 = v12;
          }
          while (v11 != v14);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }
    }
    id v19 = [v7 metadata];
    uint64_t v20 = objc_msgSend(v19, "hk_copySanitizedForPublicClient");
    v21 = (void *)v20;
    if (v19 != (void *)v20 && (!v20 || ([v19 isEqual:v20] & 1) == 0))
    {
      uint64_t v22 = (void *)[v7 _copyByArchiving];

      [v22 _setMetadata:v21];
      uint64_t v7 = v22;
    }
    id v8 = v7;
  }

  return v8;
}

- (id)filteredSamplesForClientWithSamples:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HDHealthStoreClient *)self->_client hasEntitlement:*MEMORY[0x1E4F2A548]])
  {
    id v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "hk_filter:", &__block_literal_global_163);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [(HDQueryServer *)self client];
    id v8 = [v7 authorizationOracle];
    int v9 = [v8 clientHasAuthorizationForAllTypes];

    if (v9)
    {
      id v5 = v6;
    }
    else
    {
      uint64_t v10 = objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_362_0);
      if ([v10 count])
      {
        id v23 = v4;
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v11 = dispatch_group_create();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v22 = v10;
        id obj = v10;
        uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(obj);
              }
              long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_2;
              v32[3] = &unk_1E62F78D8;
              v32[4] = v15;
              v16 = objc_msgSend(v6, "hk_filter:", v32, v22);
              dispatch_group_enter(v11);
              uint64_t v17 = [[HDObjectAuthorizationRequestContext alloc] initWithSamples:v16 metadata:0];
              [(HDObjectAuthorizationRequestContext *)v17 setPersistSession:0];
              [(HDObjectAuthorizationRequestContext *)v17 setPromptWithNoSamples:0];
              v18 = [(HDQueryServer *)self delegate];
              [v15 code];
              uint64_t v19 = HKPromptForLegacyPerObjectAuthorizationDuringQueries();
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_3;
              v29[3] = &unk_1E62FB370;
              v29[4] = v15;
              id v30 = v26;
              uint64_t v31 = v11;
              [v18 queryServer:self requestsAuthorizationWithContext:v17 promptIfNeeded:v19 completion:v29];
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v13);
        }

        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_366;
        v27[3] = &unk_1E62F78D8;
        id v28 = v26;
        id v20 = v26;
        objc_msgSend(v6, "hk_filter:", v27);
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v10 = v22;
        id v4 = v23;
      }
      else
      {
        id v5 = v6;
      }
    }
  }

  return v5;
}

uint64_t __53__HDQueryServer_filteredSamplesForClientWithSamples___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _requiresPrivateEntitlementForQueries] ^ 1;
}

id __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 sampleType];
  if ([v3 requiresPerObjectAuthorization])
  {
    id v4 = [v2 sampleType];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sampleType];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) UUID];
          [v11 addObject:v12];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Failed to obtain authorized samples for %{public}@: %{public}@", buf, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_366(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sampleType];
  int v5 = [v4 requiresPerObjectAuthorization];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 UUID];
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)predicateForQueryClient
{
  id v3 = [(HDQueryServer *)self filter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v5 = [v3 predicateWithProfile:WeakRetained];

  return v5;
}

- (id)createDatabaseTransactionContext
{
  id v3 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  [(HDMutableDatabaseTransactionContext *)v3 setCacheScope:1];
  [(HDMutableDatabaseTransactionContext *)v3 setStatistics:self->_transactionStatistics];

  return v3;
}

- (BOOL)prepareToActivateServerWithError:(id *)a3
{
  int64_t v5 = [(HDQueryServer *)self queryState];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v8 = [WeakRetained database];
    v12[4] = self;
    id v13 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__HDQueryServer_prepareToActivateServerWithError___block_invoke;
    v12[3] = &unk_1E62F6A18;
    char v6 = [v8 performHighPriorityTransactionsWithError:&v13 block:v12];
    id v9 = v13;

    if (v6)
    {
LABEL_12:

      return v6;
    }
    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 124, @"Unknown query validation error");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (a3) {
      *a3 = v10;
    }
    else {
      _HKLogDroppedError();
    }

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 126, @"Invalid query state %ld", v5);
  return 0;
}

uint64_t __50__HDQueryServer_prepareToActivateServerWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) validateConfiguration:a2];
}

- (void)activateServerWithClientState:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSuspended]) {
    -[HDQueryServer _setShouldPause:]((uint64_t)self, 1u);
  }
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HDQueryServer_activateServerWithClientState_error___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queryQueue, block);
}

- (void)_setShouldPause:(uint64_t)a1
{
  if (a1)
  {
    atomic_store(a2, (unsigned __int8 *)(a1 + 80));
    uint64_t v4 = _Block_copy(*(const void **)(a1 + 176));
    int64_t v5 = v4;
    if (v4)
    {
      id v6 = *(NSObject **)(a1 + 88);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__HDQueryServer__setShouldPause___block_invoke;
      block[3] = &unk_1E62F61A8;
      void block[4] = a1;
      id v8 = v4;
      unsigned __int8 v9 = a2;
      dispatch_async(v6, block);
    }
  }
}

void __53__HDQueryServer_activateServerWithClientState_error___block_invoke(uint64_t a1)
{
}

- (void)_queue_activateServerWithClientState:(void *)a3 error:
{
  v20[2] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [(id)a1 queryState];
    if (v7 != 4)
    {
      uint64_t v8 = v7;
      if (!v7) {
        -[HDQueryServer _queue_setQueryState:](a1, 1);
      }
      [(id)a1 setClientState:v5];
      int v9 = [v5 isSuspended];
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v6 == 0;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: activated successfully: %{BOOL}d, paused: %{BOOL}d", buf, 0x18u);
      }
      if (v6)
      {
        -[HDQueryServer _queue_transitionToFinished](a1);
      }
      else if (v9)
      {
        -[HDQueryServer _queue_transitionToPaused]((void *)a1);
      }
      else
      {
        -[HDQueryServer _queue_takeActiveQueryTransaction](a1);
        if (!*(unsigned char *)(a1 + 78)
          && [(id)a1 _shouldListenForUpdates]
          && ([*(id *)(a1 + 16) shouldSuppressDataCollection] & 1) == 0)
        {
          objc_msgSend((id)a1, "_queue_startDataCollection");
        }
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
        uint64_t v11 = [(id)a1 objectTypes];
        id v12 = objc_msgSend(v11, "hk_anyObjectPassingTest:", &__block_literal_global_420);

        if (v12)
        {
          id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v13 postNotificationName:@"HDQueryServerDidReceiveHealthRecordsQueryNotification" object:a1];
        }
        objc_initWeak(&location, (id)a1);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __36__HDQueryServer__scheduleStartQuery__block_invoke;
        long long v18 = &unk_1E62F74E0;
        uint64_t v19 = a1;
        objc_copyWeak(v20, &location);
        uint64_t v14 = (void (**)(void))_Block_copy(buf);
        v14[2]();

        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
      }
      [*(id *)(a1 + 48) invalidate];
      long long v15 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      -[HDQueryServer _queue_didFinishTransitionFromState:](a1, v8);
    }
  }
}

- (void)_queue_takeActiveQueryTransaction
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  id v2 = [WeakRetained daemon];
  id v3 = [v2 behavior];
  if ([v3 supportsActiveQueryDaemonTransactions])
  {
    char v4 = [(id)a1 hasActiveDaemonTransaction];

    if (v4) {
      return;
    }
    id WeakRetained = [NSString stringWithFormat:@"Running-%@", *(void *)(a1 + 112)];
    uint64_t v5 = +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1);
    id v2 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v5;
  }
  else
  {
  }
}

- (void)_queue_didFinishTransitionFromState:(uint64_t)a1
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  uint64_t v4 = [(id)a1 queryState];
  uint64_t v5 = _Block_copy(*(const void **)(a1 + 192));
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(NSObject **)(a1 + 88);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__HDQueryServer__queue_didFinishTransitionFromState___block_invoke;
    v8[3] = &unk_1E63053B0;
    void v8[4] = a1;
    id v9 = v5;
    uint64_t v10 = a2;
    uint64_t v11 = v4;
    dispatch_async(v7, v8);
  }
}

void __36__HDQueryServer__scheduleStartQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (uint64_t)WeakRetained;
  if (WeakRetained
    && [WeakRetained queryState] == 1
    && ([(id)v3 _shouldStopProcessingQuery] & 1) == 0)
  {
    if (([(id)v3 _shouldExecuteWhenProtectedDataIsUnavailable] & 1) != 0
      || (id v4 = objc_loadWeakRetained((id *)(v3 + 128)),
          [v4 database],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isProtectedDataAvailable],
          v5,
          v4,
          v6))
    {
      uint64_t v7 = [(id)v3 queryState];
      if (v7 != 1)
      {
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        [v47 handleFailureInMethod:sel__queue_transitionToRunning, v3, @"HDQueryServer.m", 416, @"Invalid parameter not satisfying: %@", @"previousState == HDQueryServerStateActivated" object file lineNumber description];
      }
      -[HDQueryServer _queue_setQueryState:](v3, 2);
      if (([(id)v3 _shouldExecuteWhenProtectedDataIsUnavailable] & 1) != 0
        || [(id)v3 _shouldObserveDatabaseProtectedDataAvailability])
      {
        id v8 = objc_loadWeakRetained((id *)(v3 + 128));
        id v9 = [v8 database];
        [v9 addProtectedDataObserver:v3 queue:*(void *)(v3 + 136)];
      }
      -[HDQueryServer _queue_takeActiveQueryTransaction](v3);
      if (!*(unsigned char *)(v3 + 78)
        && [(id)v3 _shouldListenForUpdates]
        && ([*(id *)(v3 + 16) shouldSuppressDataCollection] & 1) == 0)
      {
        objc_msgSend((id)v3, "_queue_startDataCollection");
      }
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v11 = [(id)v3 client];
      id v12 = [v11 accessibilityAssertions];

      if ([v12 count])
      {
        id v13 = objc_alloc_init(HDMutableDatabaseTransactionContext);
        [(HDMutableDatabaseTransactionContext *)v13 setCacheScope:1];
        [(HDMutableDatabaseTransactionContext *)v13 addAccessibilityAssertions:v12];
        uint64_t v14 = [(id)v3 profile];
        long long v15 = [v14 database];
        v48[4] = v3;
        id v49 = 0;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __43__HDQueryServer__queue_transitionToRunning__block_invoke;
        v48[3] = &unk_1E62F6A18;
        [v15 performWithTransactionContext:v13 error:&v49 block:v48];
        id v16 = v49;
      }
      else
      {
        objc_msgSend((id)v3, "_queue_start");
      }
      double v17 = CFAbsoluteTimeGetCurrent() - Current;
      [*(id *)(v3 + 96) totalDuration];
      double v19 = v18;
      id v20 = [(id)v3 clientState];
      int v21 = [v20 isBackgroundRunning];

      if (v21)
      {
        if (v19 <= 0.0) {
          double v19 = v17;
        }
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
        if (v19 != 0.0)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v23 = (objc_class *)objc_opt_class();
          uint64_t v24 = NSStringFromClass(v23);
          [v22 setObject:v24 forKeyedSubscript:@"queryType"];

          uint64_t v25 = [(id)v3 queryUUID];
          id v26 = [v25 UUIDString];
          [v22 setObject:v26 forKeyedSubscript:@"queryId"];

          long long v27 = [NSNumber numberWithDouble:v19];
          [v22 setObject:v27 forKeyedSubscript:@"totalDuration"];

          [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isBackgroundQuery"];
          id v28 = [(id)v3 sampleType];
          uint64_t v29 = v28;
          if (v28)
          {
            id v30 = [v28 description];
            [v22 setObject:v30 forKeyedSubscript:@"dataType"];
          }
          uint64_t v31 = kHDEventNameQuery;
          v32 = [(id)v3 client];
          HDPowerLogForClient(v31, v32, v22);
        }
      }
      id v33 = objc_loadWeakRetained((id *)(v3 + 128));
      long long v34 = [v33 daemon];
      long long v35 = [v34 behavior];
      int v36 = [v35 isAppleInternalInstall];

      _HKInitializeLogging();
      v37 = *MEMORY[0x1E4F29F90];
      BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO);
      if (v36)
      {
        if (v38)
        {
          v39 = *(void **)(v3 + 96);
          v40 = v37;
          [v39 totalDuration];
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = v3;
          __int16 v52 = 2048;
          double v53 = v17;
          __int16 v54 = 2048;
          uint64_t v55 = v41;
          _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_INFO, "%{public}@: Ran in %.3fs (%.3fs in database transactions)", buf, 0x20u);
        }
      }
      else if (v38)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v3;
        __int16 v52 = 2048;
        double v53 = v17;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_INFO, "%{public}@: Ran in %.3fs", buf, 0x16u);
      }
      -[HDQueryServer _queue_didFinishTransitionFromState:](v3, v7);
    }
    else
    {
      objc_super v42 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
      v43 = [(id)v3 clientProxy];
      if (v43)
      {
        v44 = [(id)v3 queryUUID];
        objc_msgSend(v43, "client_deliverError:forQuery:", v42, v44);
      }
    }
  }

  uint64_t v45 = *(void *)(a1 + 32);
  v46 = *(void **)(v45 + 96);
  *(void *)(v45 + 96) = 0;
}

- (void)schedulePause
{
  -[HDQueryServer _setShouldPause:]((uint64_t)self, 1u);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__HDQueryServer_schedulePause__block_invoke;
  v3[3] = &unk_1E62F3208;
  v3[4] = self;
  [(HDQueryServer *)self onQueue:v3];
}

void __30__HDQueryServer_schedulePause__block_invoke(uint64_t a1)
{
  if ((unint64_t)([*(id *)(a1 + 32) queryState] - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v2 = *(void **)(a1 + 32);
    -[HDQueryServer _queue_transitionToPaused](v2);
  }
}

- (void)clientStateWillChange:(id)a3
{
  queryQueue = self->_queryQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(queryQueue);
  unsigned __int8 v6 = [v5 isSuspended];

  -[HDQueryServer _setShouldPause:]((uint64_t)self, v6);
}

- (void)clientStateDidChange:(id)a3
{
  id v4 = a3;
  queryQueue = self->_queryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HDQueryServer_clientStateDidChange___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queryQueue, v7);
}

void __38__HDQueryServer_clientStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) queryState];
  if ([*(id *)(a1 + 40) isSuspended])
  {
    if ((unint64_t)(v5 - 5) <= 0xFFFFFFFFFFFFFFFDLL) {
      -[HDQueryServer _queue_transitionToPaused](*(void **)(a1 + 32));
    }
  }
  else if ([*(id *)(a1 + 32) queryState] == 3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(void *)(v6 + 48))
    {
      uint64_t v7 = +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:");
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 48);
      *(void *)(v8 + 48) = v7;

      uint64_t v6 = *(void *)(a1 + 32);
    }
    -[HDQueryServer _queue_setQueryState:](v6, 0);
    -[HDQueryServer _queue_activateServerWithClientState:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0);
  }
  uint64_t v10 = -[HDQueryServer _queue_collectionObserverState](*(id *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 32) + 40) setObserverState:v10];

  uint64_t v11 = *(id **)(a1 + 32);

  -[HDQueryServer _queue_updateSampleTypeObservationAssertions](v11);
}

- (id)_queue_collectionObserverState
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 clientState];
    +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:hasRunningWorkout:hasBackgroundObserver:](HDDataCollectionObserverState, "dataCollectionObserverStateInForeground:hasRunningWorkout:hasBackgroundObserver:", [v2 isForeground], 0, -[HDQueryServer _backgroundRunningCollectionSupportedForClient](v1));
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (void)_queue_updateSampleTypeObservationAssertions
{
  v50[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = [a1 profile];
    uint64_t v3 = [v2 sessionAssertionManager];

    v40 = (void *)v3;
    if (v3)
    {
      id v4 = -[HDQueryServer _queue_sampleTypesForObservation](v1);
      if (*((unsigned char *)v1 + 78))
      {
        uint64_t v5 = [v1 clientState];
        if (([v5 isForeground] & 1) != 0
          || (-[HDQueryServer _backgroundRunningCollectionSupportedForClient](v1) & 1) != 0)
        {
          uint64_t v6 = [v4 count];

          if (v6)
          {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v8 = [v1 client];
            id v9 = [v8 process];
            uint64_t v10 = [v9 bundleIdentifier];

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v35 = v4;
            id obj = v4;
            uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (!v11) {
              goto LABEL_18;
            }
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v42;
            uint64_t v36 = *MEMORY[0x1E4F2A828];
            uint64_t v37 = *(void *)v42;
            while (1)
            {
              uint64_t v14 = 0;
              uint64_t v38 = v12;
              do
              {
                if (*(void *)v42 != v13) {
                  objc_enumerationMutation(obj);
                }
                long long v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
                id v16 = HDQueryServerSampleTypeObservationAssertionName(v15);
                double v17 = (void *)[objc_alloc(MEMORY[0x1E4F65CC8]) initWithAssertionIdentifier:v16 ownerIdentifier:v10];
                double v18 = [v1 clientState];
                if ([v18 isForeground])
                {
                }
                else
                {
                  [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v36];
                  double v19 = v10;
                  id v20 = v1;
                  id v22 = v21 = v7;
                  v50[0] = v22;
                  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];

                  id v7 = v21;
                  id v1 = v20;
                  uint64_t v10 = v19;
                  uint64_t v12 = v38;
                  int v24 = [v23 containsObject:v15];

                  uint64_t v13 = v37;
                  if (!v24) {
                    goto LABEL_16;
                  }
                }
                objc_msgSend(v40, "takeAssertion:", v17, v35);
                [v7 addObject:v17];
LABEL_16:

                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (!v12)
              {
LABEL_18:

                id v4 = v35;
                goto LABEL_21;
              }
            }
          }
        }
        else
        {
        }
      }
      id v7 = 0;
LABEL_21:
      id v25 = v1[4];
      id v26 = v1;
      long long v27 = v7;
      uint64_t v28 = [v7 copy];
      id v29 = v26[4];
      v26[4] = (id)v28;

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v30 = v25;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v46 != v33) {
              objc_enumerationMutation(v30);
            }
            objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "invalidate", v35);
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v32);
      }
    }
  }
}

BOOL __43__HDQueryServer__queue_transitionToRunning__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 0;
}

- (void)_queue_invalidateActiveQueryTransaction
{
  id WeakRetained = objc_loadWeakRetained(a1 + 16);
  uint64_t v2 = [WeakRetained daemon];
  uint64_t v3 = [v2 behavior];
  if ([v3 supportsActiveQueryDaemonTransactions])
  {
    char v4 = [a1 hasActiveDaemonTransaction];

    if ((v4 & 1) == 0) {
      return;
    }
    [a1[7] invalidate];
    id v5 = a1[7];
    a1[7] = 0;
  }
  else
  {

    id v5 = WeakRetained;
  }
}

uint64_t __38__HDQueryServer__queue_setQueryState___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

- (id)_queue_sampleTypesForObservation
{
  id v1 = a1;
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a1 _shouldObserveAllSampleTypes])
    {
      uint64_t v2 = HKAllCollectibleTypesWithStoreDemoModeEnabled();
      uint64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_406_1);
      id v1 = [v3 allObjects];

LABEL_6:
      goto LABEL_7;
    }
    char v4 = [v1 sampleType];

    if (v4)
    {
      uint64_t v2 = [v1 sampleType];
      v6[0] = v2;
      id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      goto LABEL_6;
    }
    id v1 = (id)MEMORY[0x1E4F1CBF0];
  }
LABEL_7:

  return v1;
}

id __49__HDQueryServer__queue_sampleTypesForObservation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __53__HDQueryServer__queue_didFinishTransitionFromState___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

- (uint64_t)_backgroundRunningCollectionSupportedForClient
{
  id v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isRealityDevice])
  {
    uint64_t v3 = 0;
LABEL_9:

    return v3;
  }
  id v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v5 = [v4 isAppleWatch];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [a1 client];
    id v7 = [v6 entitlements];
    id v2 = [v7 valueForEntitlement:*MEMORY[0x1E4F296E0]];

    uint64_t v8 = [a1 clientState];
    int v9 = [v8 isBackgroundRunning];

    if (v2) {
      unsigned int v10 = [v2 hasPrefix:@"com.apple"] ^ 1;
    }
    else {
      unsigned int v10 = 0;
    }
    uint64_t v3 = v9 & v10;
    goto LABEL_9;
  }
  return 0;
}

uint64_t __56__HDQueryServer__queue_notifyIfQueryingForHealthRecords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHealthRecordsType];
}

- (void)remote_startQueryWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void, void *))a3;
  id v4 = [(HDQueryServer *)self delegate];
  char v5 = v4;
  if (v4)
  {
    [v4 queryServer:self shouldStartWithCompletion:v7];
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"nil query server delegate");
    v7[2](v7, 0, v6);
  }
}

- (NSSet)objectTypes
{
  if (self->_objectType) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
  }
  else {
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v2;
}

- (HKQuantityType)quantityType
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self->_objectType;
  }
  else {
    uint64_t v3 = 0;
  }

  return (HKQuantityType *)v3;
}

uint64_t __33__HDQueryServer__setShouldPause___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (double)activationTime
{
  [(HKQueryServerConfiguration *)self->_configuration activationTime];
  return result;
}

- (BOOL)hasActiveDaemonTransaction
{
  return self->_runningTransaction != 0;
}

id __42__HDQueryServer_sampleAuthorizationFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v9 = 0;
  id v4 = [v3 filteredObjectsForReadAuthorization:a2 anchor:0 error:&v9];
  id v5 = v9;
  if (!v4)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Sample authorization failed: %{public}@", buf, 0x16u);
    }
  }

  return v4;
}

+ (Class)queryClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return (Class)objc_opt_class();
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 0;
}

- (BOOL)validateConfiguration:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = [(id)objc_opt_class() requiredEntitlements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![(HDHealthStoreClient *)self->_client hasRequiredEntitlement:*(void *)(*((void *)&v33 + 1) + 8 * i) error:a3])
        {
          BOOL v13 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unsigned int v10 = [(HDQueryServer *)self client];
  uint64_t v11 = [v10 authorizationOracle];
  char v12 = [v11 clientHasAuthorizationForAllTypes];

  id v5 = [(HDQueryServer *)self objectTypes];
  BOOL v13 = 1;
  if ([v5 count] && (v12 & 1) == 0)
  {
    uint64_t v14 = [(HDQueryServer *)self client];
    long long v15 = [v14 authorizationOracle];
    id v32 = 0;
    id v16 = [v15 readAuthorizationStatusesForTypes:v5 error:&v32];
    id v17 = v32;

    if (v16)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v18 = v5;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
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
            id v23 = objc_msgSend(v16, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * j), (void)v28);
            int v24 = v23;
            if (!v23 || ![v23 isAuthorizationDetermined])
            {
              id v26 = @"Authorization not determined";
LABEL_31:
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 5, v26);

              BOOL v13 = 0;
              goto LABEL_32;
            }
            if ([v24 authorizationMode] == 1
              && ([(id)objc_opt_class() supportsAnchorBasedAuthorization] & 1) == 0)
            {
              id v26 = @"Authorization not supported";
              goto LABEL_31;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
          BOOL v13 = 1;
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_32:

      goto LABEL_35;
    }
    _HKInitializeLogging();
    id v25 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      __int16 v40 = 2114;
      id v41 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error determining authorization status: %{public}@", buf, 0x16u);
    }
    id v16 = v17;
    if (v16)
    {
      if (a3)
      {
        BOOL v13 = 0;
        *a3 = v16;
LABEL_35:

        goto LABEL_36;
      }
      _HKLogDroppedError();
    }
    BOOL v13 = 0;
    goto LABEL_35;
  }
LABEL_36:

  return v13;
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 0;
}

+ (id)taskIdentifier
{
  id v2 = (void *)[a1 queryClass];

  return (id)[v2 taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)taskUUID
{
  return self->_queryUUID;
}

+ (Class)configurationClass
{
  id v2 = (void *)[a1 queryClass];

  return (Class)[v2 configurationClass];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  id v2 = (void *)[(id)objc_opt_class() queryClass];

  return (id)[v2 serverInterface];
}

- (id)remoteInterface
{
  id v2 = (void *)[(id)objc_opt_class() queryClass];

  return (id)[v2 clientInterface];
}

- (void)connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: connection invalidated, deactivating", (uint8_t *)&v4, 0xCu);
  }
  [(HDQueryServer *)self deactivateServerWithCompletion:0];
}

- (id)diagnosticDescription
{
  if (self
    && ([(HDQueryServer *)self filter], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    int v4 = [(HDQueryServer *)self filter];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v6 = [v4 predicateWithProfile:WeakRetained];
    uint64_t v7 = [v6 description];

    uint64_t v8 = [v7 componentsSeparatedByString:@"\n"];
    id v9 = [v8 componentsJoinedByString:@"\n\t"];
    long long v28 = [@"\t" stringByAppendingString:v9];
  }
  else
  {
    long long v28 = 0;
  }
  unsigned int v10 = [(HKQueryServerConfiguration *)self->_configuration debugIdentifier];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(HDQueryServer *)self activationTime];
  long long v31 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  char v12 = (void *)0x1E4F29000;
  BOOL v13 = NSString;
  uint64_t v14 = [(HDQueryServer *)self queryUUID];
  long long v15 = [v14 UUIDString];
  uint64_t v16 = objc_opt_class();
  if (v10)
  {
    long long v30 = [NSString stringWithFormat:@" \"%@\"", v10];
  }
  else
  {
    long long v30 = &stru_1F1728D60;
  }
  id v17 = [(HDQueryServer *)self sampleType];
  long long v29 = v14;
  uint64_t v18 = v16;
  if (v17)
  {
    uint64_t v19 = NSString;
    char v12 = [(HDQueryServer *)self sampleType];
    uint64_t v20 = [v19 stringWithFormat:@" (%@)", v12];
  }
  else
  {
    uint64_t v20 = &stru_1F1728D60;
  }
  uint64_t v21 = -[HDQueryServer _queryStateString]((__CFString *)self);
  if ([(HDQueryServer *)self _shouldStopProcessingQuery]) {
    id v22 = @" (finishing)";
  }
  else {
    id v22 = &stru_1F1728D60;
  }
  id v23 = HKDiagnosticStringFromDate();
  int v24 = [v13 stringWithFormat:@"%@ %@%@%@ - %@%@, activated %@", v15, v18, v30, v20, v21, v22, v23];

  if (v17)
  {
  }
  if (v10) {

  }
  if (v28)
  {
    id v25 = [v24 stringByAppendingFormat:@"\n%@", v28];
  }
  else
  {
    id v25 = v24;
  }
  id v26 = v25;

  return v26;
}

- (void)setDelegate:(id)a3
{
}

- (HKQueryServerConfiguration)configuration
{
  return self->_configuration;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (void)setDataCount:(int64_t)a3
{
  self->_dataCount = a3;
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (HDQueryServerClientState)clientState
{
  return self->_clientState;
}

- (void)setClientState:(id)a3
{
}

- (id)unitTest_queryServerSetShouldPauseHandler
{
  return self->_unitTest_queryServerSetShouldPauseHandler;
}

- (void)setUnitTest_queryServerSetShouldPauseHandler:(id)a3
{
}

- (id)unitTest_queryServerWillChangeStateHandler
{
  return self->_unitTest_queryServerWillChangeStateHandler;
}

- (void)setUnitTest_queryServerWillChangeStateHandler:(id)a3
{
}

- (id)unitTest_queryServerDidFinishStateTransitionHandler
{
  return self->_unitTest_queryServerDidFinishStateTransitionHandler;
}

- (void)setUnitTest_queryServerDidFinishStateTransitionHandler:(id)a3
{
}

@end