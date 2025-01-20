@interface HDClientDataCollectionTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (BOOL)canResumeCollectionFromLastSensorDatum;
- (Class)sensorDatumClassForAggregator:(id)a3;
- (HDClientDataCollectionTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSString)description;
- (id)_loggingClientProxy;
- (id)exportedInterface;
- (id)identifierForDataAggregator:(id)a3;
- (id)remoteInterface;
- (id)sourceForDataAggregator:(id)a3;
- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4;
- (void)connectionConfigured;
- (void)connectionInvalidated;
- (void)dataAggregator:(id)a3 didPersistDatums:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)dataAggregator:(id)a3 requestsCollectionThroughDate:(id)a4 completion:(id)a5;
- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4;
- (void)remote_insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 batchUUID:(id)a7 registrationUUID:(id)a8 completion:(id)a9;
- (void)remote_registerWithCompletion:(id)a3;
- (void)remote_setCollectionState:(id)a3 completion:(id)a4;
- (void)remote_synchronizeWithCompletion:(id)a3;
@end

@implementation HDClientDataCollectionTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29978];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (HDClientDataCollectionTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HDClientDataCollectionTaskServer.m", 66, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)HDClientDataCollectionTaskServer;
  v15 = [(HDStandardTaskServer *)&v32 initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
  if (v15)
  {
    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_configuration, a4);
    id v18 = objc_alloc(MEMORY[0x1E4F2AEA8]);
    v19 = [(HKDataCollectorTaskServerConfiguration *)v15->_configuration quantityType];
    [v19 code];
    HKDefaultAggregationIntervalForType();
    double v21 = v20;
    v22 = [(HKDataCollectorTaskServerConfiguration *)v15->_configuration quantityType];
    [v22 code];
    HKDefaultCollectionLatencyForType();
    uint64_t v24 = [v18 initWithCollectionInterval:1 collectionLatency:v21 collectionType:v23];
    collectionConfiguration = v15->_collectionConfiguration;
    v15->_collectionConfiguration = (HKDataCollectorCollectionConfiguration *)v24;

    v26 = (void *)MEMORY[0x1E4F2B560];
    v27 = [(HDStandardTaskServer *)v15 client];
    uint64_t v28 = objc_msgSend(v26, "hd_sourceForClient:", v27);
    clientSource = v15->_clientSource;
    v15->_clientSource = (HKSource *)v28;
  }
  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  if (!a3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"HKDataCollectorTaskServerConfiguration is nil");
  }
  return a3 != 0;
}

- (void)connectionConfigured
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDClientDataCollectionTaskServer_connectionConfigured__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __56__HDClientDataCollectionTaskServer_connectionConfigured__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) profile];
  v3 = [v2 dataCollectionManager];
  v4 = [*(id *)(*(void *)(a1 + 32) + 72) quantityType];
  uint64_t v5 = [v3 aggregatorForType:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29F10];
  v10 = *MEMORY[0x1E4F29F10];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 88);
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering aggregator for client data collection: %@", (uint8_t *)&v17, 0x16u);
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = v13;

    [*(id *)(*(void *)(a1 + 32) + 88) registerDataCollector:*(void *)(a1 + 32) state:*(void *)(*(void *)(a1 + 32) + 48)];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = 138543362;
    uint64_t v18 = v16;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: No aggregator available for data collection.", (uint8_t *)&v17, 0xCu);
  }
}

- (void)remote_setCollectionState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HDClientDataCollectionTaskServer_remote_setCollectionState_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __73__HDClientDataCollectionTaskServer_remote_setCollectionState_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 88) dataCollector:a1[4] didChangeState:a1[5]];
  v2 = *(uint64_t (**)(void))(a1[6] + 16);

  return v2();
}

- (void)remote_insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 batchUUID:(id)a7 registrationUUID:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  queue = self->_queue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __118__HDClientDataCollectionTaskServer_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke;
  v28[3] = &unk_1E630CE50;
  v28[4] = self;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  unint64_t v35 = a6;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  dispatch_sync(queue, v28);
}

void __118__HDClientDataCollectionTaskServer_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 72);
  id v6 = *(void **)(a1 + 80);
  uint64_t v46 = *(void *)(a1 + 88);
  id v53 = *(id *)(a1 + 40);
  id v45 = v3;
  id v49 = v3;
  id v48 = v2;
  id v50 = v4;
  id v52 = v5;
  v51 = v6;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    if ([v52 isEqual:*(void *)(v1 + 80)])
    {
      _HKInitializeLogging();
      id v7 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v7;
        id v9 = HKDiagnosticStringFromUUID();
        *(_DWORD *)buf = 138543874;
        uint64_t v67 = v1;
        __int16 v68 = 2114;
        v69 = v9;
        __int16 v70 = 2048;
        uint64_t v71 = [v53 count];
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Received %ld datums.", buf, 0x20u);
      }
      if ([v53 count])
      {
        if (v48)
        {
          id v65 = 0;
          id v10 = v48;
          uint64_t v11 = [(id)v1 client];
          char v12 = objc_msgSend(v10, "hd_validateMetadataKeysAndValuesWithClient:error:", v11, &v65);

          id v13 = v65;
          v44 = v13;
          if ((v12 & 1) == 0)
          {
            if (!v13)
            {
              v44 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, @"Failed to validate provided metadata"");
            }
            uint64_t v14 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
            objc_msgSend(v14, "clientRemote_receivedBatch:error:", v50, v44);

            v51[2](v51, 1, 0);
LABEL_34:

            goto LABEL_35;
          }
        }
        else
        {
          v44 = 0;
        }
        v54 = [*(id *)(v1 + 104) objectForKeyedSubscript:v49];
        if (v54)
        {
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id obj = v53;
          uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:buf count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v62;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v62 != v19) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                id v22 = [v21 dateInterval];
                id v23 = [v22 endDate];
                id v24 = [v54 dateInterval];
                id v25 = [v24 endDate];
                int v26 = objc_msgSend(v23, "hk_isBeforeOrEqualToDate:", v25);

                if (v26)
                {
                  id v29 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
                  id v30 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v31 = objc_opt_class();
                  id v32 = [v21 dateInterval];
                  id v33 = [v32 endDate];
                  id v34 = [v54 dateInterval];
                  unint64_t v35 = [v34 endDate];
                  v36 = objc_msgSend(v30, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v31, sel__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, @"Out-of-order data received: got an end date of %@ but our last datum was %@"", v33, v35);
                  objc_msgSend(v29, "clientRemote_receivedBatch:error:", v50, v36);

                  v51[2](v51, 1, 0);
                  goto LABEL_33;
                }
              }
              uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:buf count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
        }
        id v27 = [*(id *)(v1 + 72) quantityType];
        BOOL v28 = [v27 code] == 5;

        if (v28)
        {
          objc_msgSend(v53, "hk_map:", &__block_literal_global_230);
          id obj = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_2;
          v59[3] = &unk_1E630CE98;
          id v60 = v48;
          objc_msgSend(v53, "hk_map:", v59);
          id obj = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!*(void *)(v1 + 104))
        {
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v38 = *(void **)(v1 + 104);
          *(void *)(v1 + 104) = v37;
        }
        v39 = [obj lastObject];
        [*(id *)(v1 + 104) setObject:v39 forKeyedSubscript:v49];

        objc_initWeak(&location, (id)v1);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_3;
        v55[3] = &unk_1E630CEC0;
        objc_copyWeak(&v57, &location);
        id v40 = v50;
        id v56 = v40;
        v41 = [obj lastObject];
        [v41 setSaveCompletion:v55];

        objc_storeStrong((id *)(v1 + 56), v45);
        [*(id *)(v1 + 88) dataCollector:v1 didCollectSensorData:obj device:v49 options:v46];
        v42 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
        objc_msgSend(v42, "clientRemote_receivedBatch:error:", v40, 0);

        if (v46)
        {
          v43 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
          objc_msgSend(v43, "clientRemote_finishedPersistenceForBatch:error:", v40, 0);
        }
        v51[2](v51, 1, 0);

        objc_destroyWeak(&v57);
        objc_destroyWeak(&location);
LABEL_33:

        goto LABEL_34;
      }
      id v16 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
      objc_msgSend(v16, "clientRemote_receivedBatch:error:", v50, 0);

      id v17 = -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
      objc_msgSend(v17, "clientRemote_finishedPersistenceForBatch:error:", v50, 0);

      v51[2](v51, 1, 0);
    }
    else
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 114, @"Server synchronization failed (expected %@, got %@)", *(void *)(v1 + 80), v52);
      ((void (**)(id, uint64_t, void *))v51)[2](v51, 0, v15);
    }
  }
LABEL_35:
}

- (void)remote_registerWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke;
  v9[3] = &unk_1E62F3170;
  v9[4] = self;
  uint64_t v5 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke_297;
  v7[3] = &unk_1E62F70B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "clientRemote_synchronizeWithCompletion:", v7);
}

void __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke_297(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) profile];
  id v3 = [v2 daemon];
  id v4 = [v3 contentProtectionManager];
  char v5 = [v4 deviceUnlockedSinceBoot];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 88))
    {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v7();
      return;
    }
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [*(id *)(v6 + 72) quantityType];
    objc_msgSend(v9, "hk_error:format:", 1301, @"%@ does not appear to be a collectible type.", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseInaccessibleBeforeFirstUnlockError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (void)remote_synchronizeWithCompletion:(id)a3
{
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AEA0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AEA0] clientInterface];
}

- (void)connectionInvalidated
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HDStandardTaskServer *)self profile];
  id v4 = [v3 daemon];
  char v5 = [v4 isTerminating];

  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      __int16 v8 = [(HDClientDataCollectionTaskServer *)self description];
      id v9 = [(HKDataCollectorTaskServerConfiguration *)self->_configuration bundleIdentifier];
      uint64_t v10 = [(HDDataAggregator *)self->_aggregator description];
      *(_DWORD *)buf = 138543874;
      id v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering data collector %{public}@ with bundle identifier %{public}@ from data aggregator: %{public}@", buf, 0x20u);
    }
    [(HDDataAggregator *)self->_aggregator unregisterDataCollector:self];
    v11.receiver = self;
    v11.super_class = (Class)HDClientDataCollectionTaskServer;
    [(HDStandardTaskServer *)&v11 connectionInvalidated];
  }
}

- (id)_loggingClientProxy
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 client];
    id v3 = [v2 connection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__HDClientDataCollectionTaskServer__loggingClientProxy__block_invoke;
    v5[3] = &unk_1E62F3170;
    v5[4] = v1;
    id v1 = [v3 remoteObjectProxyWithErrorHandler:v5];
  }

  return v1;
}

id __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HDHeartRateSensorDatum quantityDatumWithHKQuantityDatum:a2];
}

HDQuantityDatum *__118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HDQuantityDatum quantityDatumWithHKQuantityDatum:a2 metadata:*(void *)(a1 + 32)];
}

void __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 40);
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  id v6 = *(id *)(a1 + 32);
  id v7 = v5;
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained[5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HDClientDataCollectionTaskServer__didFinishPersistenceForBatch_error___block_invoke;
    block[3] = &unk_1E62F30F8;
    block[4] = WeakRetained;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

void __72__HDClientDataCollectionTaskServer__didFinishPersistenceForBatch_error___block_invoke(uint64_t a1)
{
  -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientRemote_finishedPersistenceForBatch:error:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __55__HDClientDataCollectionTaskServer__loggingClientProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error during XPC call to client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__HDClientDataCollectionTaskServer_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke;
  block[3] = &unk_1E62F30F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __94__HDClientDataCollectionTaskServer_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29F10];
  id v4 = *MEMORY[0x1E4F29F10];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring duplicate registration request", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning collection for aggregator: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [MEMORY[0x1E4F2B378] quantityDatumWithHDQuantityDatum:*(void *)(a1 + 48)];
    }
    else
    {
      id v11 = 0;
    }
    id v12 = -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
    objc_msgSend(v12, "clientRemote_beginCollectionWithConfiguration:lastPersistedDatum:registrationUUID:", *(void *)(*(void *)(a1 + 32) + 96), v11, *(void *)(*(void *)(a1 + 32) + 80));
  }
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HDClientDataCollectionTaskServer_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  v8[3] = &unk_1E62F31C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __84__HDClientDataCollectionTaskServer_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t a1)
{
  -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) collectionInterval];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setCollectionInterval:");
  [*(id *)(a1 + 40) collectionLatency];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setCollectionLatency:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setCollectionType:", objc_msgSend(*(id *)(a1 + 40), "collectionType"));
  objc_msgSend(v2, "clientRemote_collectionConfigurationDidChange:", *(void *)(*(void *)(a1 + 32) + 96));
}

- (id)identifierForDataAggregator:(id)a3
{
  id v4 = NSString;
  id v5 = [(HKDataCollectorTaskServerConfiguration *)self->_configuration bundleIdentifier];
  uint64_t v6 = [(HKDataCollectorTaskServerConfiguration *)self->_configuration quantityType];
  id v7 = [v4 stringWithFormat:@"%@%@", v5, v6];

  return v7;
}

- (id)sourceForDataAggregator:(id)a3
{
  return self->_clientSource;
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)dataAggregator:(id)a3 didPersistDatums:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__HDClientDataCollectionTaskServer_dataAggregator_didPersistDatums_success_error___block_invoke;
  v14[3] = &unk_1E62F7780;
  BOOL v17 = a5;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

void __82__HDClientDataCollectionTaskServer_dataAggregator_didPersistDatums_success_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v22;
      id v7 = (os_log_t *)MEMORY[0x1E4F29F10];
      *(void *)&long long v4 = 138543362;
      long long v20 = v4;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v2);
          }
          id v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            id v11 = [v10 saveCompletion];

            if (v11)
            {
              _HKInitializeLogging();
              id v12 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v13 = *(void *)(a1 + 32);
                *(_DWORD *)buf = v20;
                uint64_t v27 = v13;
                _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling completion for datum(s) inserted via HKDataCollector", buf, 0xCu);
              }
              objc_msgSend(v10, "saveCompletion", v20, (void)v21);
              uint64_t v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
              v14[2](v14, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
            }
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  id v15 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    id v2 = v15;
    uint64_t v18 = [v16 count];
    uint64_t v19 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 2114;
    uint64_t v31 = v19;
    _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failed persistence for %ld datums: %{public}@", buf, 0x20u);
LABEL_15:
  }
}

- (void)dataAggregator:(id)a3 requestsCollectionThroughDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__194;
  v41 = __Block_byref_object_dispose__194;
  id v42 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke;
  aBlock[3] = &unk_1E630CEE8;
  aBlock[4] = self;
  unint64_t v35 = v43;
  v36 = &v37;
  id v11 = v10;
  id v34 = v11;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(HDStandardTaskServer *)self client];
  uint64_t v14 = [v13 process];

  uint64_t v15 = [v14 processIdentifier];
  id v16 = objc_alloc(MEMORY[0x1E4F4E280]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2;
  v27[3] = &unk_1E630CF10;
  id v17 = v14;
  int v32 = v15;
  id v28 = v17;
  uint64_t v29 = self;
  id v18 = v12;
  id v31 = v18;
  id v19 = v9;
  id v30 = v19;
  uint64_t v20 = [v16 initWithPID:v15 flags:3 reason:4 name:@"HealthKit Background Data Collection Flush" withHandler:v27];
  long long v21 = (void *)v38[5];
  v38[5] = v20;

  dispatch_time_t v22 = dispatch_time(0, 2000000000);
  queue = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_4;
  v25[3] = &unk_1E62F2F20;
  id v26 = v18;
  id v24 = v18;
  dispatch_after(v22, queue, v25);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v43, 8);
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    [*(id *)(*(void *)(a1[7] + 8) + 40) invalidate];
    uint64_t v4 = *(void *)(a1[7] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x1E4F29F10];
  uint64_t v5 = *MEMORY[0x1E4F29F10];
  if (!a2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    id v7 = v4;
    id v8 = [v14 bundleIdentifier];
    int v15 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    long long v21 = v8;
    __int16 v22 = 1024;
    int v23 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Failed to acquire data collection flush assertion for %{public}@ (%d)", buf, 0x12u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v4;
    id v8 = [v6 bundleIdentifier];
    int v9 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    long long v21 = v8;
    __int16 v22 = 1024;
    int v23 = v9;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "Acquired data collection flush assertion for %{public}@ (%d)", buf, 0x12u);
LABEL_4:
  }
LABEL_6:
  id v10 = [*(id *)(a1 + 40) client];
  id v11 = [v10 connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_333;
  v18[3] = &unk_1E62F6C98;
  v18[4] = *(void *)(a1 + 40);
  id v19 = *(id *)(a1 + 56);
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2_335;
  v16[3] = &unk_1E62F70B0;
  uint64_t v13 = *(void *)(a1 + 48);
  v16[4] = *(void *)(a1 + 40);
  id v17 = *(id *)(a1 + 56);
  objc_msgSend(v12, "clientRemote_collectThroughDate:completion:", v13, v16);
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_333(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to request data collection flush from client: %{public}@", buf, 0x16u);
  }
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_334;
  v9[3] = &unk_1E62F3CA8;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_sync(v5, v9);
}

uint64_t __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_334(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2_335(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_3;
  block[3] = &unk_1E62F61A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_sync(v6, block);
}

uint64_t __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 103, @"Failed to finish client-side flush in a timely fashion.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return [(HKDataCollectorTaskServerConfiguration *)self->_configuration canResumeFromLastDatum];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HKDataCollectorTaskServerConfiguration *)self->_configuration bundleIdentifier];
  id v7 = [(HKDataCollectorTaskServerConfiguration *)self->_configuration quantityType];
  id v8 = [v3 stringWithFormat:@"<%@:%p %@: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_storeStrong((id *)&self->_lastDatumByDevice, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_registrationUUID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_dataCollectorState, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end