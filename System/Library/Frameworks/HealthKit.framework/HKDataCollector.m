@interface HKDataCollector
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)_datumsInDateOrder:(id)a3 secondDatum:(id)a4;
- (BOOL)_validateDatums:(id)a3 error:(id *)a4;
- (HKDataCollector)initWithHealthStore:(id)a3 bundleIdentifier:(id)a4 quantityType:(id)a5;
- (HKDataCollectorCollectionConfiguration)collectionConfiguration;
- (HKDataCollectorDelegate)delegate;
- (HKDataCollectorState)state;
- (HKDevice)device;
- (HKQuantityType)quantityType;
- (NSString)bundleIdentifier;
- (NSString)description;
- (id)_prunedBatch:(id)a3 maximumLength:(int64_t)a4;
- (id)_queue_callToDelegateAndEnqueueForClientFlushRequest:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTest_pendingBatches;
- (id)unitTest_unconfirmedBatches;
- (id)unitTest_unpersistedBatches;
- (void)_queue_batchDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)_queue_checkForFinish;
- (void)_queue_considerCompletingFlushRequests;
- (void)_queue_considerSendingBatches;
- (void)_queue_pruneOldDatums;
- (void)_queue_requestRegistration;
- (void)_queue_resetUnpersistedBatches;
- (void)_queue_sendBatch:(id)a3;
- (void)_queue_sendState:(id)a3;
- (void)_queue_taskServer_insertBatch:(id)a3 completion:(id)a4;
- (void)_queue_updateReconsiderationTimer;
- (void)_removeBatch:(id)a3;
- (void)_requestRegistration;
- (void)clientRemote_beginCollectionWithConfiguration:(id)a3 lastPersistedDatum:(id)a4 registrationUUID:(id)a5;
- (void)clientRemote_collectThroughDate:(id)a3 completion:(id)a4;
- (void)clientRemote_collectionConfigurationDidChange:(id)a3;
- (void)clientRemote_finishedPersistenceForBatch:(id)a3 error:(id)a4;
- (void)clientRemote_receivedBatch:(id)a3 error:(id)a4;
- (void)clientRemote_synchronizeWithCompletion:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)finishWithCompletion:(id)a3;
- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 completion:(id)a6;
- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)resumeWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(id)a3;
- (void)unitTest_preSetStateHandler:(id)a3;
- (void)unitTest_setClientFlushRequestTimeoutOverride:(double)a3;
- (void)unitTest_setConnectionInterruptedHandler:(id)a3;
- (void)unitTest_setMaxDatumAgeOverride:(double)a3;
- (void)unitTest_setRegistrationCompleteHandler:(id)a3;
@end

@implementation HKDataCollector

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_quantityType];
}

- (HKDataCollector)initWithHealthStore:(id)a3 bundleIdentifier:(id)a4 quantityType:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)HKDataCollector;
  v11 = [(HKDataCollector *)&v47 init];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
    }
    uint64_t v12 = HKCreateSerialDispatchQueue(v11, @"resource");
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    v14 = [[HKRetryableOperation alloc] initWithQueue:*((void *)v11 + 1) retryCount:5];
    v15 = (void *)*((void *)v11 + 6);
    *((void *)v11 + 6) = v14;

    v11[176] = 1;
    v16 = objc_alloc_init(HKDataCollectorState);
    v17 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v16;

    uint64_t v18 = [v10 copy];
    v19 = (void *)*((void *)v11 + 26);
    *((void *)v11 + 26) = v18;

    uint64_t v20 = [v9 copy];
    v21 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v20;

    uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
    v23 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v22;

    v24 = [[HKDataCollectorTaskServerConfiguration alloc] initWithQuantityType:*((void *)v11 + 26) bundleIdentifier:*((void *)v11 + 5) canResumeFromLastDatum:0];
    v25 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v8 taskIdentifier:@"HKDataCollectorTaskServerIdentifier" exportedObject:v11 taskUUID:*((void *)v11 + 3)];
    v26 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v25;

    [*((id *)v11 + 4) setShouldRetryOnInterruption:0];
    [*((id *)v11 + 4) setTaskConfiguration:v24];
    objc_initWeak(&location, v11);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __69__HKDataCollector_initWithHealthStore_bundleIdentifier_quantityType___block_invoke;
    v44[3] = &unk_1E58BE428;
    objc_copyWeak(&v45, &location);
    [*((id *)v11 + 4) setAutomaticProxyReconnectionHandler:v44];
    [*((id *)v11 + 4) setShouldRetryOnInterruption:1];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28 = (void *)*((void *)v11 + 18);
    *((void *)v11 + 18) = v27;

    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v30 = (void *)*((void *)v11 + 20);
    *((void *)v11 + 20) = v29;

    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v32 = (void *)*((void *)v11 + 19);
    *((void *)v11 + 19) = v31;

    v33 = [[HKDataCollectorCollectionConfiguration alloc] initWithCollectionInterval:1 collectionLatency:600.0 collectionType:600.0];
    v34 = (void *)*((void *)v11 + 10);
    *((void *)v11 + 10) = v33;

    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v36 = (void *)*((void *)v11 + 17);
    *((void *)v11 + 17) = v35;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v11 + 88) = _Q0;
    *((CFAbsoluteTime *)v11 + 25) = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v42 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v11;
      _os_log_impl(&dword_19C023000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Initialized.", buf, 0xCu);
    }
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
  return (HKDataCollector *)v11;
}

void __69__HKDataCollector_initWithHealthStore_bundleIdentifier_quantityType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestRegistration];
}

- (HKDataCollectorCollectionConfiguration)collectionConfiguration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__38;
  id v10 = __Block_byref_object_dispose__38;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HKDataCollector_collectionConfiguration__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKDataCollectorCollectionConfiguration *)v3;
}

void __42__HKDataCollector_collectionConfiguration__block_invoke(uint64_t a1)
{
}

- (void)resumeWithCompletion:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke;
  block[3] = &unk_1E58C5A30;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __40__HKDataCollector_resumeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 178))
  {
    id v3 = [*(id *)(v2 + 32) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke_2;
    block[3] = &unk_1E58BDD40;
    id v4 = *(id *)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v17 = v4;
    uint64_t v18 = *(void *)(a1 + 48);
    dispatch_async(v3, block);

    id v5 = v17;
LABEL_5:

    return;
  }
  if (*(unsigned char *)(v2 + 177))
  {
    uint64_t v6 = [*(id *)(v2 + 32) clientQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__HKDataCollector_resumeWithCompletion___block_invoke_3;
    v13[3] = &unk_1E58BDD40;
    id v7 = *(id *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = *(void *)(a1 + 48);
    dispatch_async(v6, v13);

    id v5 = v14;
    goto LABEL_5;
  }
  *(unsigned char *)(v2 + 177) = 1;
  uint64_t v8 = [[HKDataCollectorTaskServerConfiguration alloc] initWithQuantityType:*(void *)(*(void *)(a1 + 32) + 208) bundleIdentifier:*(void *)(*(void *)(a1 + 32) + 40) canResumeFromLastDatum:1];
  [*(id *)(*(void *)(a1 + 32) + 32) setTaskConfiguration:v8];

  uint64_t v9 = [*(id *)(a1 + 40) copy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 184);
  *(void *)(v10 + 184) = v9;

  uint64_t v12 = *(void **)(a1 + 32);
  if (!v12[9])
  {
    objc_msgSend(v12, "_queue_requestRegistration");
  }
}

void __40__HKDataCollector_resumeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v4, v5, @"This %@ has already been invalidated."", v8);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
}

void __40__HKDataCollector_resumeWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v8 = objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v4, v5, @"%@ has already been resumed. %@ must be called only once, and before any calls to insertDatums:device:metadata:completion:"", v9, v7);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v8);
}

- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 completion:(id)a6
{
}

- (void)insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v16) {
    id v17 = v16;
  }
  else {
    id v17 = &__block_literal_global_90;
  }
  if (a6)
  {
    _HKInitializeLogging();
    uint64_t v18 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      quantityType = self->_quantityType;
      uint64_t v20 = v18;
      v21 = [(HKObjectType *)quantityType identifier];
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      id v38 = v21;
      _os_log_impl(&dword_19C023000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Transient data collection on type %{public}@", buf, 0x16u);
    }
  }
  uint64_t v22 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v17];

  if ([v13 count])
  {
    id v34 = 0;
    BOOL v23 = [(HKDataCollector *)self _validateDatums:v13 error:&v34];
    id v24 = v34;
    if (v23)
    {
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A valid %@ object is required.", objc_opt_class() format];
        }
      }
      else
      {
        id v14 = +[HKDevice localDevice];
      }
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__HKDataCollector_insertDatums_device_metadata_options_completion___block_invoke_41;
      block[3] = &unk_1E58C5A58;
      block[4] = self;
      id v31 = v22;
      SEL v32 = a2;
      id v28 = v13;
      id v14 = v14;
      id v29 = v14;
      id v30 = v15;
      unint64_t v33 = a6;
      dispatch_sync(queue, block);
    }
    else
    {
      ((void (**)(void, void, id))v22)[2](v22, 0, v24);
    }
  }
  else
  {
    _HKInitializeLogging();
    v25 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_19C023000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring empty batch with device: %@", buf, 0x16u);
    }
    v22[2](v22, 1, 0);
  }
}

void __67__HKDataCollector_insertDatums_device_metadata_options_completion___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 178))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 72);
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = objc_msgSend(v4, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v5, v6, @"This %@ has already been invalidated."", v12);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v8);
  }
  else
  {
    if (!*(unsigned char *)(v2 + 177) && !*(void *)(v2 + 72))
    {
      objc_msgSend((id)v2, "_queue_requestRegistration");
      uint64_t v2 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v2 + 177) = 1;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = [*(id *)(a1 + 40) lastObject];
    [v10 setSaveCompletion:v9];

    objc_msgSend(*(id *)(a1 + 32), "_queue_batchDatums:device:metadata:options:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 80), *(void *)(a1 + 64));
    if (*(unsigned char *)(a1 + 80)) {
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 1;
    }
    id v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "_queue_considerSendingBatches");
  }
}

- (void)_queue_batchDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!self->_pendingBatches)
  {
    id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingBatches = self->_pendingBatches;
    self->_pendingBatches = v17;
  }
  self->_totalDatumCount += [v13 count];
  v19 = [(NSMutableArray *)self->_pendingBatches lastObject];
  v74 = v19;
  if (!v19) {
    goto LABEL_28;
  }
  uint64_t v20 = v19;
  id v69 = v16;
  id v21 = [v19 device];
  if (v21 != v14)
  {
    uint64_t v22 = [v20 device];
    if (!v22) {
      goto LABEL_18;
    }
    a4 = v22;
    id v7 = [v20 device];
    if (![v14 isEqual:v7])
    {
LABEL_17:

      goto LABEL_18;
    }
  }
  id v23 = [v20 metadata];
  if (v23 == v15)
  {
    id v63 = a4;
    v66 = v7;
    id v71 = v14;
    goto LABEL_12;
  }
  uint64_t v24 = [v20 metadata];
  if (!v24)
  {

    if (v21 != v14) {
      goto LABEL_17;
    }
LABEL_18:

    id v16 = v69;
    goto LABEL_28;
  }
  v25 = v20;
  uint64_t v20 = (void *)v24;
  id v63 = a4;
  v66 = v7;
  id v71 = v14;
  a4 = [v25 metadata];
  if (![v15 isEqual:a4])
  {
    unsigned int v26 = 0;
    goto LABEL_13;
  }
LABEL_12:
  unsigned int v26 = ((a6 & 1) == 0) ^ [v74 isTransient];
  if (v23 == v15)
  {

    id v14 = v71;
    if (v21 == v71)
    {

LABEL_21:
      id v16 = v69;
      id v27 = v74;
      if (v26) {
        goto LABEL_22;
      }
LABEL_28:
      uint64_t v39 = [_HKDataCollectorPendingBatch alloc];
      v40 = [MEMORY[0x1E4F29128] UUID];
      id v28 = [(_HKDataCollectorPendingBatch *)v39 initWithIdentifier:v40 data:v13 metadata:v15 device:v14 options:a6 completion:v16];

      [(NSMutableArray *)self->_pendingBatches addObject:v28];
      if (self->_totalDatumCount >= 5001) {
        [(HKDataCollector *)self _queue_pruneOldDatums];
      }
      _HKInitializeLogging();
      v41 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        v60 = v41;
        v65 = [(_HKDataCollectorPendingBatch *)v28 batchUUID];
        v42 = HKDiagnosticStringFromUUID(v65);
        uint64_t v56 = [v13 count];
        v62 = [v13 firstObject];
        os_log_t loga = [v62 dateInterval];
        v43 = [loga startDate];
        HKDiagnosticStringFromDate(v43);
        v44 = id v73 = v14;
        [v13 lastObject];
        id v45 = v68 = v28;
        v46 = [v45 dateInterval];
        [v46 endDate];
        id v47 = v16;
        v49 = id v48 = v15;
        HKDiagnosticStringFromDate(v49);
        uint64_t v50 = v70 = v13;
        *(_DWORD *)buf = 138544642;
        v76 = self;
        __int16 v77 = 2114;
        v78 = v42;
        __int16 v79 = 2048;
        uint64_t v80 = v56;
        __int16 v81 = 2114;
        v82 = v44;
        __int16 v83 = 2114;
        v84 = v50;
        __int16 v85 = 2112;
        id v86 = v73;
        _os_log_impl(&dword_19C023000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Inserting %lu datums from %{public}@ -> %{public}@, device: %@", buf, 0x3Eu);

        id v15 = v48;
        id v16 = v47;

        id v28 = v68;
        id v13 = v70;

        id v14 = v73;
      }
      id v27 = v74;
      goto LABEL_33;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_13:

  id v14 = v71;
  if (v21 != v71) {
    goto LABEL_20;
  }

  id v16 = v69;
  id v27 = v74;
  if (!v26) {
    goto LABEL_28;
  }
LABEL_22:
  id v28 = [v27 batchByAddingData:v13 completion:v16];
  [(NSMutableArray *)self->_pendingBatches removeLastObject];
  [(NSMutableArray *)self->_pendingBatches addObject:v28];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastLogTime > 120.0)
  {
    _HKInitializeLogging();
    id v30 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      log = v30;
      v64 = [(_HKDataCollectorPendingBatch *)v28 batchUUID];
      v52 = HKDiagnosticStringFromUUID(v64);
      v61 = [(_HKDataCollectorPendingBatch *)v28 data];
      uint64_t v51 = [v61 count];
      os_log_t v59 = [(_HKDataCollectorPendingBatch *)v28 data];
      v55 = [v59 firstObject];
      v54 = [v55 dateInterval];
      v53 = [v54 startDate];
      id v31 = HKDiagnosticStringFromDate(v53);
      SEL v32 = [(_HKDataCollectorPendingBatch *)v28 data];
      [v32 lastObject];
      unint64_t v33 = v67 = v28;
      id v34 = [v33 dateInterval];
      [v34 endDate];
      id v35 = v15;
      __int16 v37 = v36 = v13;
      HKDiagnosticStringFromDate(v37);
      id v38 = v72 = v14;
      *(_DWORD *)buf = 138544386;
      v76 = self;
      __int16 v77 = 2114;
      v78 = v52;
      __int16 v79 = 2048;
      uint64_t v80 = v51;
      __int16 v81 = 2114;
      v82 = v31;
      __int16 v83 = 2114;
      v84 = v38;
      _os_log_impl(&dword_19C023000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Now contains %ld datums from %{public}@ -> %{public}@.", buf, 0x34u);

      id v13 = v36;
      id v15 = v35;
      id v16 = v69;

      id v28 = v67;
      id v14 = v72;
    }
    self->_lastLogTime = Current;
    id v27 = v74;
  }
  if (self->_totalDatumCount >= 5001) {
    [(HKDataCollector *)self _queue_pruneOldDatums];
  }
LABEL_33:
}

- (void)finishWithCompletion:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_finishWithCompletion___block_invoke;
  block[3] = &unk_1E58C5A30;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __40__HKDataCollector_finishWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 178))
  {
    uint64_t v3 = [*(id *)(v2 + 32) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_2;
    block[3] = &unk_1E58BDD40;
    id v4 = *(id *)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v25 = v4;
    uint64_t v26 = *(void *)(a1 + 48);
    dispatch_async(v3, block);

    id v5 = v25;
  }
  else
  {
    *(unsigned char *)(v2 + 178) = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_3;
    aBlock[3] = &unk_1E58BBA50;
    uint64_t v6 = *(void **)(a1 + 40);
    aBlock[4] = *(void *)(a1 + 32);
    id v23 = v6;
    id v7 = _Block_copy(aBlock);
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 152) count];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 144) count];
    _HKInitializeLogging();
    SEL v10 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v9 + v8;
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 160);
      id v14 = v10;
      uint64_t v15 = [v13 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      uint64_t v30 = v11;
      __int16 v31 = 2048;
      uint64_t v32 = v15;
      _os_log_impl(&dword_19C023000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing data collection with %ld unsent batches and %ld unpersisted batches.", buf, 0x20u);
    }
    if ([*(id *)(*(void *)(a1 + 32) + 152) count]
      || [*(id *)(*(void *)(a1 + 32) + 144) count])
    {
      uint64_t v16 = [v7 copy];
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void **)(v17 + 192);
      *(void *)(v17 + 192) = v16;

      objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
    }
    else
    {
      v19 = [*(id *)(*(void *)(a1 + 32) + 32) clientQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__HKDataCollector_finishWithCompletion___block_invoke_43;
      v20[3] = &unk_1E58BBEC0;
      id v21 = v7;
      dispatch_async(v19, v20);
    }
    id v5 = v23;
  }
}

void __40__HKDataCollector_finishWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v4, v5, @"This %@ has already been invalidated."", v8);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v7);
}

void __40__HKDataCollector_finishWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: All data successfully flushed.", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __40__HKDataCollector_finishWithCompletion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_considerSendingBatches
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_unconfirmedBatchesByUUID count])
  {
    _HKInitializeLogging();
    uint64_t v3 = (void *)HKLogDataCollection;
    if (!os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    unconfirmedBatchesByUUID = self->_unconfirmedBatchesByUUID;
    uint64_t v5 = v3;
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = [(NSMutableDictionary *)unconfirmedBatchesByUUID count];
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %lu unconfirmed batches; delaying next send.",
      buf,
      0x16u);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(HKDataCollectorCollectionConfiguration *)self->_collectionConfiguration collectionLatency];
    if (self->_unitTest_maxDatumAgeOverride >= 0.0) {
      double unitTest_maxDatumAgeOverride = self->_unitTest_maxDatumAgeOverride;
    }
    double v8 = Current - unitTest_maxDatumAgeOverride;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v9 = self->_flushRequests;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v38 + 1) + 8 * i) date];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;

          if (v16 >= v8) {
            double v8 = v16;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v53 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [(NSMutableArray *)self->_pendingBatches firstObject];
    uint64_t v5 = v17;
    if (v17)
    {
      uint64_t v18 = [v17 data];
      v19 = [v18 firstObject];
      uint64_t v20 = [v19 dateInterval];
      id v21 = [v20 startDate];

      if (self->_shouldFlushAll
        || ([v21 timeIntervalSinceReferenceDate], v22 < v8)
        || self->_totalDatumCount > 4999
        || self->_invalidated)
      {
        _HKInitializeLogging();
        id v23 = (void *)HKLogDataCollection;
        if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F1C9C8];
          id v25 = v23;
          uint64_t v26 = [v24 dateWithTimeIntervalSinceReferenceDate:v8];
          int64_t totalDatumCount = self->_totalDatumCount;
          *(_DWORD *)buf = 138544386;
          v44 = self;
          __int16 v45 = 2114;
          uint64_t v46 = (uint64_t)v5;
          __int16 v47 = 2112;
          id v48 = v21;
          __int16 v49 = 2112;
          uint64_t v50 = v26;
          __int16 v51 = 2048;
          int64_t v52 = totalDatumCount;
          _os_log_impl(&dword_19C023000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending batch %{public}@ (start date %@, latest start %@, datum count %ld)", buf, 0x34u);
        }
        if (!self->_registrationUUID)
        {
          [(HKDataCollector *)self _queue_requestRegistration];

          goto LABEL_35;
        }
        [(HKDataCollector *)self _queue_sendBatch:v5];
      }
    }
    else
    {
      [(HKDataCollector *)self _queue_checkForFinish];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v28 = self->_flushRequests;
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v35 != v31) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "completion", (void)v34);
            uint64_t v33 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            v33[2](v33, 1, 0);
          }
          uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v30);
      }

      [(NSMutableArray *)self->_flushRequests removeAllObjects];
      self->_shouldFlushAll = 0;
    }
    [(HKDataCollector *)self _queue_considerCompletingFlushRequests];
    [(HKDataCollector *)self _queue_updateReconsiderationTimer];
  }
LABEL_35:
}

- (void)_queue_considerCompletingFlushRequests
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(NSMutableArray *)self->_pendingBatches firstObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 data];
    uint64_t v6 = [v5 firstObject];
    int v7 = [v6 dateInterval];
    double v8 = [v7 startDate];
  }
  else
  {
    double v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v30 = self;
  uint64_t v9 = [(NSMutableDictionary *)self->_unconfirmedBatchesByUUID allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) data];
        double v15 = [v14 firstObject];
        double v16 = [v15 dateInterval];
        uint64_t v17 = [v16 startDate];

        if (objc_msgSend(v17, "hk_isBeforeDate:", v8))
        {
          id v18 = v17;

          double v8 = v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v19 = v30->_flushRequests;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (!v20)
  {
    double v22 = v19;
    goto LABEL_27;
  }
  uint64_t v21 = v20;
  uint64_t v29 = v4;
  double v22 = 0;
  uint64_t v23 = *(void *)v32;
  do
  {
    for (uint64_t j = 0; j != v21; ++j)
    {
      if (*(void *)v32 != v23) {
        objc_enumerationMutation(v19);
      }
      id v25 = *(void **)(*((void *)&v31 + 1) + 8 * j);
      uint64_t v26 = objc_msgSend(v25, "date", v29);
      int v27 = objc_msgSend(v26, "hk_isBeforeDate:", v8);

      if (v27)
      {
        uint64_t v28 = [v25 completion];
        v28[2](v28, 1, 0);

        if (!v22) {
          double v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [(NSMutableArray *)v22 addObject:v25];
      }
    }
    uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
  }
  while (v21);

  id v4 = v29;
  if (v22)
  {
    [(NSMutableArray *)v30->_flushRequests removeObjectsInArray:v22];
LABEL_27:
  }
}

- (void)_queue_requestRegistration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_requiresRegistration)
  {
    self->_requiresRegistration = 0;
    _HKInitializeLogging();
    uint64_t v3 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v8 = self;
      _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering with healthd", buf, 0xCu);
    }
    retryableOperation = self->_retryableOperation;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke;
    v6[3] = &unk_1E58C4960;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_5;
    v5[3] = &unk_1E58BBE28;
    v5[4] = self;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v6 completion:v5];
  }
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_2;
  v8[3] = &unk_1E58C5A80;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_4;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [v4 fetchProxyWithHandler:v8 errorHandler:v6];
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__HKDataCollector__queue_requestRegistration__block_invoke_3;
  v3[3] = &unk_1E58BBD38;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_registerWithCompletion:", v3);
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend(v4, "hk_isHealthKitErrorWithCode:", 101);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__HKDataCollector__queue_requestRegistration__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    uint64_t v6 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished registration; awaiting registration complete.",
        buf,
        0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendState:", *(void *)(*(void *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    double v8 = (void *)(a1 + 32);
    *(unsigned char *)(v9 + 176) = 1;
    _HKInitializeLogging();
    uint64_t v10 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
      __45__HKDataCollector__queue_requestRegistration__block_invoke_5_cold_1(v8, (uint64_t)v5, v10);
    }
    uint64_t v11 = (void *)[*(id *)(*v8 + 144) copy];
    [*(id *)(*v8 + 144) removeAllObjects];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "callCompletionsWithSuccess:error:", 0, v5, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }

    objc_msgSend((id)*v8, "_queue_checkForFinish");
  }
}

- (void)_requestRegistration
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HKDataCollector__requestRegistration__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __39__HKDataCollector__requestRegistration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRegistration");
}

- (void)_queue_checkForFinish
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    id finishCompletion = self->_finishCompletion;
    if (finishCompletion)
    {
      id v4 = _Block_copy(finishCompletion);
      id v5 = self->_finishCompletion;
      self->_id finishCompletion = 0;

      uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__HKDataCollector__queue_checkForFinish__block_invoke;
      block[3] = &unk_1E58BBEC0;
      id v9 = v4;
      id v7 = v4;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __40__HKDataCollector__queue_checkForFinish__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_sendBatch:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unconfirmedBatchesByUUID = self->_unconfirmedBatchesByUUID;
  uint64_t v6 = [v4 batchUUID];
  [(NSMutableDictionary *)unconfirmedBatchesByUUID setObject:v4 forKeyedSubscript:v6];

  [(NSMutableArray *)self->_pendingBatches removeObject:v4];
  id v7 = [v4 data];
  self->_totalDatumCount -= [v7 count];

  self->_shouldFlushAll = 1;
  _HKInitializeLogging();
  double v8 = (void *)HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    double v22 = [v4 batchUUID];
    long long v18 = HKDiagnosticStringFromUUID(v22);
    uint64_t v21 = [v4 data];
    uint64_t v17 = [v21 count];
    long long v20 = [v4 data];
    id v9 = [v20 firstObject];
    uint64_t v10 = [v9 dateInterval];
    uint64_t v11 = [v10 startDate];
    id v12 = [v4 data];
    uint64_t v13 = [v12 lastObject];
    uint64_t v14 = [v13 dateInterval];
    uint64_t v15 = [v14 endDate];
    *(_DWORD *)buf = 138544386;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    uint64_t v28 = v18;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    __int16 v31 = 2114;
    long long v32 = v11;
    __int16 v33 = 2114;
    long long v34 = v15;
    _os_log_impl(&dword_19C023000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Sending %ld datums from %{public}@ to %{public}@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __36__HKDataCollector__queue_sendBatch___block_invoke;
  v23[3] = &unk_1E58BBC70;
  v23[4] = self;
  id v24 = v4;
  id v16 = v4;
  [(HKDataCollector *)self _queue_taskServer_insertBatch:v16 completion:v23];
}

void __36__HKDataCollector__queue_sendBatch___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    _HKInitializeLogging();
    id v7 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      double v8 = *(void **)(a1 + 40);
      uint64_t v10 = v7;
      uint64_t v11 = [v8 batchUUID];
      id v12 = HKDiagnosticStringFromUUID(v11);
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      long long v20 = v12;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "%{public}@: Batch %{public}@: successfully sent to daemon.", (uint8_t *)&v17, 0x16u);

LABEL_11:
    }
  }
  else
  {
    if ((objc_msgSend(v5, "hk_isXPCConnectionError") & 1) == 0
      && !objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 114))
    {
      _HKInitializeLogging();
      uint64_t v14 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
        __36__HKDataCollector__queue_sendBatch___block_invoke_cold_2(a1, v14);
      }
      uint64_t v15 = *(void **)(a1 + 40);
      id v16 = *(void **)(*(void *)(a1 + 32) + 152);
      uint64_t v10 = [v15 batchUUID];
      [v16 removeObjectForKey:v10];
      goto LABEL_11;
    }
    _HKInitializeLogging();
    uint64_t v13 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
      __36__HKDataCollector__queue_sendBatch___block_invoke_cold_1(a1, v13);
    }
  }
}

- (void)_queue_updateReconsiderationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_pendingBatches count]
    && ![(NSMutableDictionary *)self->_unconfirmedBatchesByUUID count])
  {
    if (!self->_reconsiderationSource)
    {
      id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
      reconsiderationSource = self->_reconsiderationSource;
      self->_reconsiderationSource = v3;

      objc_initWeak(&location, self);
      id v5 = self->_reconsiderationSource;
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __52__HKDataCollector__queue_updateReconsiderationTimer__block_invoke;
      id v24 = &unk_1E58BD6C0;
      objc_copyWeak(&v25, &location);
      dispatch_source_set_event_handler(v5, &v21);
      dispatch_resume((dispatch_object_t)self->_reconsiderationSource);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    uint64_t v6 = [(NSMutableArray *)self->_pendingBatches firstObject];
    id v7 = [v6 data];
    double v8 = [v7 firstObject];
    uint64_t v9 = [v8 dateInterval];
    uint64_t v10 = [v9 startDate];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;
    [(HKDataCollectorCollectionConfiguration *)self->_collectionConfiguration collectionLatency];
    double v14 = v12 + v13;

    double v15 = v14 - CFAbsoluteTimeGetCurrent();
    double v16 = v15 * 1000000000.0;
    int v17 = self->_reconsiderationSource;
    BOOL v18 = v15 <= 0.25;
    double v19 = 250000000.0;
    if (!v18) {
      double v19 = v16;
    }
    dispatch_time_t v20 = dispatch_time(0, (unint64_t)v19);
    dispatch_source_set_timer(v17, v20, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
}

void __52__HKDataCollector__queue_updateReconsiderationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_considerSendingBatches");
}

- (void)_queue_pruneOldDatums
{
  [(HKDataCollector *)self _queue_considerSendingBatches];
  unint64_t v3 = 0;
  do
  {
    if (v3 >= [(NSMutableArray *)self->_pendingBatches count]) {
      break;
    }
    id v4 = [(NSMutableArray *)self->_pendingBatches objectAtIndexedSubscript:v3];
    unint64_t v5 = self->_totalDatumCount - 5000;
    uint64_t v6 = [v4 data];
    unint64_t v7 = [v6 count];

    if (v7 <= v5)
    {
      [(HKDataCollector *)self _removeBatch:v4];
    }
    else
    {
      double v8 = [v4 data];
      uint64_t v9 = -[HKDataCollector _prunedBatch:maximumLength:](self, "_prunedBatch:maximumLength:", v4, [v8 count] - v5);

      if (v9)
      {
        [(NSMutableArray *)self->_pendingBatches replaceObjectAtIndex:v3 withObject:v9];
        uint64_t v10 = [v4 data];
        uint64_t v11 = [v10 count];
        double v12 = [v9 data];
        self->_totalDatumCount += [v12 count] - v11;

        ++v3;
      }
      else
      {
        [(HKDataCollector *)self _removeBatch:v4];
      }
    }
    int64_t totalDatumCount = self->_totalDatumCount;
  }
  while (totalDatumCount > 5000);
}

- (void)_queue_resetUnpersistedBatches
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v3 = [(NSMutableDictionary *)self->_unpersistedBatchesByUUID allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMutableArray *)self->_pendingBatches addObject:*(void *)(*((void *)&v17 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_unpersistedBatchesByUUID removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(NSMutableDictionary *)self->_unconfirmedBatchesByUUID allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
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
        [(NSMutableArray *)self->_pendingBatches addObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_unconfirmedBatchesByUUID removeAllObjects];
  [(NSMutableArray *)self->_pendingBatches sortUsingComparator:&__block_literal_global_50];
}

uint64_t __49__HKDataCollector__queue_resetUnpersistedBatches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 data];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 dateInterval];
  double v8 = [v7 startDate];
  uint64_t v9 = [v4 data];

  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v10 dateInterval];
  uint64_t v12 = [v11 startDate];
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

- (void)_removeBatch:(id)a3
{
  pendingBatches = self->_pendingBatches;
  id v5 = a3;
  [(NSMutableArray *)pendingBatches removeObject:v5];
  uint64_t v6 = [v5 data];
  self->_totalDatumCount -= [v6 count];

  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1300, @"Reached datum buffer limit, pruning datums.");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 callCompletionsWithSuccess:0 error:v7];
}

- (id)_prunedBatch:(id)a3 maximumLength:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 data];
  double v8 = [v6 data];
  uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v8, "count") + ~a4, a4 + 1);
  uint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_56];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _HKInitializeLogging();
    uint64_t v11 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
      -[HKDataCollector _prunedBatch:maximumLength:]((uint64_t)self, (uint64_t)v6, v11);
    }
    goto LABEL_5;
  }
  uint64_t v12 = [v6 data];
  uint64_t v13 = [v12 count] - a4 + v10;

  long long v14 = [v6 data];
  uint64_t v15 = [v14 count];

  if (v13 == v15)
  {
LABEL_5:
    long long v16 = 0;
    goto LABEL_12;
  }
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      long long v18 = [v6 data];
      long long v19 = [v18 objectAtIndexedSubscript:i];
      long long v20 = [v19 saveCompletion];

      if (v20)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1300, @"Reached datum buffer limit, pruning datums.");
        uint64_t v22 = [v6 data];
        uint64_t v23 = [v22 objectAtIndexedSubscript:i];
        id v24 = [v23 saveCompletion];
        ((void (**)(void, void, void *))v24)[2](v24, 0, v21);
      }
    }
  }
  id v25 = [v6 data];
  uint64_t v26 = [v6 data];
  __int16 v27 = objc_msgSend(v25, "subarrayWithRange:", v13, objc_msgSend(v26, "count") - v13);

  uint64_t v28 = objc_msgSend(v27, "hk_map:", &__block_literal_global_60_0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_2;
  aBlock[3] = &unk_1E58BBE28;
  id v37 = v28;
  id v29 = v28;
  uint64_t v30 = _Block_copy(aBlock);
  __int16 v31 = [_HKDataCollectorPendingBatch alloc];
  long long v32 = [v6 batchUUID];
  __int16 v33 = [v6 metadata];
  long long v34 = [v6 device];
  long long v16 = [(_HKDataCollectorPendingBatch *)v31 initWithIdentifier:v32 data:v27 metadata:v33 device:v34 options:0 completion:v30];

LABEL_12:

  return v16;
}

BOOL __46__HKDataCollector__prunedBatch_maximumLength___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 saveCompletion];
  BOOL v3 = v2 != 0;

  return v3;
}

id __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 saveCompletion];
  BOOL v3 = _Block_copy(v2);

  return v3;
}

void __46__HKDataCollector__prunedBatch_maximumLength___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setState:(id)a3
{
  id v4 = a3;
  id v5 = (HKDataCollectorState *)[v4 copy];
  state = self->_state;
  self->_state = v5;

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__HKDataCollector_setState___block_invoke;
  v9[3] = &unk_1E58BBBD0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

uint64_t __28__HKDataCollector_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendState:", *(void *)(a1 + 40));
}

- (void)_queue_sendState:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryableOperation = self->_retryableOperation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__HKDataCollector__queue_sendState___block_invoke;
  v7[3] = &unk_1E58BBDB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v7 completion:&__block_literal_global_62];
}

void __36__HKDataCollector__queue_sendState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__HKDataCollector__queue_sendState___block_invoke_2;
  v9[3] = &unk_1E58C5B08;
  v9[4] = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__HKDataCollector__queue_sendState___block_invoke_4;
  v7[3] = &unk_1E58BBD88;
  id v8 = v11;
  id v6 = v11;
  [v5 fetchProxyWithHandler:v9 errorHandler:v7];
}

void __36__HKDataCollector__queue_sendState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HKDataCollector__queue_sendState___block_invoke_3;
  v6[3] = &unk_1E58BBD38;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remote_setCollectionState:completion:", v5, v6);
}

uint64_t __36__HKDataCollector__queue_sendState___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __36__HKDataCollector__queue_sendState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__HKDataCollector_setDelegate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void *__31__HKDataCollector_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 216), *(id *)(a1 + 40));
  result = *(void **)(a1 + 32);
  if (!result[9])
  {
    return objc_msgSend(result, "_queue_requestRegistration");
  }
  return result;
}

- (void)_queue_taskServer_insertBatch:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_registrationUUID)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKDataCollector.m", 770, @"Invalid parameter not satisfying: %@", @"_registrationUUID" object file lineNumber description];
  }
  retryableOperation = self->_retryableOperation;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke;
  v12[3] = &unk_1E58BBDB0;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v12 completion:v8];
}

void __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_2;
  v10[3] = &unk_1E58C5B08;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_4;
  v8[3] = &unk_1E58BBD88;
  id v9 = v13;
  id v7 = v13;
  [v4 fetchProxyWithHandler:v10 errorHandler:v8];
}

void __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 data];
  uint64_t v6 = [*(id *)(a1 + 32) device];
  id v7 = [*(id *)(a1 + 32) metadata];
  uint64_t v8 = [*(id *)(a1 + 32) options];
  id v9 = [*(id *)(a1 + 32) batchUUID];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_3;
  v11[3] = &unk_1E58BBD38;
  id v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "remote_insertDatums:device:metadata:options:batchUUID:registrationUUID:completion:", v5, v6, v7, v8, v9, v10, v11);
}

uint64_t __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__HKDataCollector__queue_taskServer_insertBatch_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HKDataCollector_clientRemote_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E58BBEC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __58__HKDataCollector_clientRemote_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_beginCollectionWithConfiguration:(id)a3 lastPersistedDatum:(id)a4 registrationUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke;
  v15[3] = &unk_1E58C0930;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke(id *a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = a1[6];
    *(_DWORD *)buf = 138543874;
    id v71 = v3;
    __int16 v72 = 2114;
    id v73 = v4;
    __int16 v74 = 2114;
    id v75 = v5;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning client-side data collection with configuration %{public}@, last datum %{public}@", buf, 0x20u);
  }
  uint64_t v6 = [a1[7] copy];
  id v7 = a1[4];
  id v8 = (void *)v7[9];
  v7[9] = v6;

  uint64_t v9 = [a1[5] copy];
  id v10 = a1[4];
  id v11 = (void *)v10[10];
  v10[10] = v9;

  id v12 = _Block_copy(*((const void **)a1[4] + 23));
  id v13 = a1[4];
  id v14 = (void *)v13[23];
  v13[23] = 0;

  if (v12)
  {
    uint64_t v15 = [*((id *)a1[4] + 4) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_73;
    block[3] = &unk_1E58BBF10;
    id v67 = v12;
    id v66 = a1[6];
    dispatch_async(v15, block);
  }
  objc_msgSend(a1[4], "_queue_resetUnpersistedBatches");
  if (a1[6])
  {
    __int16 v51 = v12;
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = [a1[6] dateInterval];
    id v17 = [v16 endDate];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = *((id *)a1[4] + 18);
    uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v54 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          uint64_t v21 = a1;
          if (*(void *)v62 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v23 = [v22 data];
          id v24 = [v23 firstObject];
          id v25 = [v24 dateInterval];
          uint64_t v26 = [v25 startDate];
          int v27 = objc_msgSend(v26, "hk_isAfterOrEqualToDate:", v17);

          if (v27)
          {
            [v53 addObject:v22];
          }
          else
          {
            uint64_t v28 = [v22 data];
            id v29 = [v28 lastObject];
            uint64_t v30 = [v29 dateInterval];
            __int16 v31 = [v30 endDate];
            int v32 = objc_msgSend(v31, "hk_isBeforeOrEqualToDate:", v17);

            if (v32)
            {
              [v22 callCompletionsWithSuccess:1 error:0];
            }
            else
            {
              __int16 v33 = [v22 data];
              v59[0] = MEMORY[0x1E4F143A8];
              v59[1] = 3221225472;
              v59[2] = __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_2;
              v59[3] = &unk_1E58C5B30;
              id v60 = v17;
              long long v34 = objc_msgSend(v33, "hk_filter:", v59);

              uint64_t v35 = [_HKDataCollectorPendingBatch alloc];
              long long v36 = [MEMORY[0x1E4F29128] UUID];
              id v37 = [v22 metadata];
              long long v38 = [v22 device];
              long long v39 = [v22 completions];
              long long v40 = [(_HKDataCollectorPendingBatch *)v35 initWithIdentifier:v36 data:v34 metadata:v37 device:v38 options:0 completions:v39];

              [v53 addObject:v40];
            }
          }
          a1 = v21;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v19);
    }

    objc_storeStrong((id *)a1[4] + 18, v53);
    *((void *)a1[4] + 7) = 0;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = *((id *)a1[4] + 18);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v56 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = [*(id *)(*((void *)&v55 + 1) + 8 * j) data];
          *((void *)a1[4] + 7) += [v46 count];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v43);
    }

    id v12 = v51;
  }
  __int16 v47 = (const void **)a1[4];
  if (v47[13])
  {
    id v48 = (void (**)(void *, void))_Block_copy(v47[13]);
    __int16 v49 = a1[4];
    uint64_t v50 = (void *)v49[13];
    v49[13] = 0;

    ((void (**)(void *, id))v48)[2](v48, a1[4]);
    __int16 v47 = (const void **)a1[4];
  }
  objc_msgSend(v47, "_queue_considerSendingBatches");
}

uint64_t __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __101__HKDataCollector_clientRemote_beginCollectionWithConfiguration_lastPersistedDatum_registrationUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 dateInterval];
  id v4 = [v3 startDate];
  uint64_t v5 = objc_msgSend(v4, "hk_isAfterOrEqualToDate:", *(void *)(a1 + 32));

  return v5;
}

- (void)clientRemote_collectionConfigurationDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__38;
  uint64_t v15 = __Block_byref_object_dispose__38;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HKDataCollector_clientRemote_collectionConfigurationDidChange___block_invoke;
  block[3] = &unk_1E58C0688;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  dispatch_sync(queue, block);
  if (v12[5])
  {
    id v7 = [(HKDataCollector *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 dataCollector:self didUpdateCollectionConfiguration:v12[5]];
    }
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __65__HKDataCollector_clientRemote_collectionConfigurationDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 80) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v2 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received updated configuration: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 40) copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = [*(id *)(a1 + 40) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
}

- (void)clientRemote_receivedBatch:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKDataCollector_clientRemote_receivedBatch_error___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __52__HKDataCollector_clientRemote_receivedBatch_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 152) removeObjectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:*(void *)(a1 + 40)];

    _HKInitializeLogging();
    uint64_t v4 = (void *)HKLogDataCollection;
    BOOL v5 = os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v5) {
        goto LABEL_8;
      }
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = v4;
      uint64_t v8 = [0 batchUUID];
      id v9 = HKDiagnosticStringFromUUID(v8);
      *(_DWORD *)uint64_t v23 = 138543618;
      *(void *)&v23[4] = v6;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v9;
      id v10 = "%{public}@: Duplicate receipt confirmation of batch %{public}@, ignoring.";
    }
    else
    {
      if (!v5) {
        goto LABEL_8;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      id v7 = v4;
      uint64_t v8 = [0 batchUUID];
      id v9 = HKDiagnosticStringFromUUID(v8);
      *(_DWORD *)uint64_t v23 = 138543618;
      *(void *)&v23[4] = v11;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v9;
      id v10 = "%{public}@: Received receipt confirmation for unknown batch %{public}@, ignoring.";
    }
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, v10, v23, 0x16u);
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 48);
  _HKInitializeLogging();
  id v13 = (void *)HKLogDataCollection;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v18 = *(void **)(a1 + 40);
      long long v20 = v13;
      uint64_t v21 = HKDiagnosticStringFromUUID(v18);
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)uint64_t v23 = 138543874;
      *(void *)&v23[4] = v19;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v21;
      *(_WORD *)&v23[22] = 2114;
      uint64_t v24 = v22;
      _os_log_error_impl(&dword_19C023000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Batch %{public}@: Fatal error sending batch, failing send: %{public}@", v23, 0x20u);
    }
    objc_msgSend(v2, "callCompletionsWithSuccess:error:", 0, *(void *)(a1 + 48), *(_OWORD *)v23, *(void *)&v23[16]);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = v13;
      uint64_t v16 = [v2 batchUUID];
      id v17 = HKDiagnosticStringFromUUID(v16);
      *(_DWORD *)uint64_t v23 = 138543618;
      *(void *)&v23[4] = v14;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v17;
      _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: confirmed receipt.", v23, 0x16u);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", v2, *(void *)(a1 + 40), *(void *)v23, *(_OWORD *)&v23[8]);
    objc_msgSend(*(id *)(a1 + 32), "_queue_considerCompletingFlushRequests");
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_considerSendingBatches");
}

- (void)clientRemote_finishedPersistenceForBatch:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKDataCollector_clientRemote_finishedPersistenceForBatch_error___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __66__HKDataCollector_clientRemote_finishedPersistenceForBatch_error___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    [*(id *)(a1[4] + 160) removeObjectForKey:a1[5]];
    if (a1[6])
    {
      _HKInitializeLogging();
      uint64_t v3 = (void *)HKLogDataCollection;
      if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = a1[4];
        uint64_t v8 = (void *)a1[5];
        id v10 = v3;
        uint64_t v11 = HKDiagnosticStringFromUUID(v8);
        uint64_t v12 = a1[6];
        int v13 = 138543874;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v11;
        __int16 v17 = 2114;
        uint64_t v18 = v12;
        _os_log_error_impl(&dword_19C023000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Batch %{public}@: Persistence failed: %{public}@.", (uint8_t *)&v13, 0x20u);
      }
      uint64_t v4 = a1[6];
    }
    else
    {
      uint64_t v4 = 0;
    }
    objc_msgSend(v2, "callCompletionsWithSuccess:error:", v4 == 0);
  }
  else
  {
    _HKInitializeLogging();
    BOOL v5 = HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      id v7 = (void *)a1[5];
      int v13 = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon reported persistence finished for batch %{public}@, but no record of that batch exists.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)clientRemote_collectThroughDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received flush request through %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__38;
  long long v20 = __Block_byref_object_dispose__38;
  id v21 = 0;
  BOOL v5 = [_HKDataCollectorFlushRequest alloc];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_78;
  id v13 = &unk_1E58C5B58;
  id v6 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v6;
  __int16 v17 = buf;
  id v16 = *(id *)(a1 + 48);
  id v7 = [(_HKDataCollectorFlushRequest *)v5 initWithDate:v15 completion:&v10];
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_queue_callToDelegateAndEnqueueForClientFlushRequest:", v7, v10, v11, v12, v13, v14);
  id v9 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v8;

  _Block_object_dispose(buf, 8);
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_78(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_2;
  v15[3] = &unk_1E58C5B80;
  v15[4] = v4;
  id v16 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v9;
  long long v17 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_79;
  v11[3] = &unk_1E58C5BA8;
  id v7 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v10;
  long long v13 = v10;
  char v14 = a2;
  [v5 fetchProxyWithHandler:v15 errorHandler:v11];
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_3;
  v7[3] = &unk_1E58C5B58;
  uint64_t v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  objc_msgSend(a2, "remote_synchronizeWithCompletion:", v7);
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Flush request through %{public}@ complete.", (uint8_t *)&v11, 0x16u);
  }
  id v8 = *(NSObject **)(*(void *)(a1[7] + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    uint64_t v9 = *(void *)(a1[7] + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __62__HKDataCollector_clientRemote_collectThroughDate_completion___block_invoke_79(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Flush request through %{public}@ complete but synchronization failed; reporting completion anyway.",
      (uint8_t *)&v10,
      0x16u);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1[7] + 8) + 40);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(a1[7] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_queue_callToDelegateAndEnqueueForClientFlushRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double unitTest_clientFlushRequestTimeoutOverride = self->_unitTest_clientFlushRequestTimeoutOverride;
  if (unitTest_clientFlushRequestTimeoutOverride >= 0.0) {
    int64_t v6 = (unint64_t)(unitTest_clientFlushRequestTimeoutOverride * 1000000000.0);
  }
  else {
    int64_t v6 = 1000000000;
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke;
  aBlock[3] = &unk_1E58C5BD0;
  void aBlock[4] = self;
  uint64_t v30 = v31;
  id v7 = v4;
  id v29 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = [(HKDataCollector *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_3;
    v24[3] = &unk_1E58BBB10;
    int v10 = (id *)v25;
    v25[0] = v9;
    v25[1] = self;
    id v26 = v7;
    id v27 = v8;
    uint64_t v11 = _Block_copy(v24);

    __int16 v12 = v26;
LABEL_8:

    uint64_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_time_t v14 = dispatch_time(0, v6);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v15 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
    dispatch_async(v15, v11);

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_5;
    handler[3] = &unk_1E58BBAC8;
    uint64_t v19 = v31;
    handler[4] = self;
    id v18 = v7;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(v13);

    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_4;
    v20[3] = &unk_1E58BBA78;
    int v10 = &v21;
    id v21 = v9;
    id v22 = v7;
    id v23 = v8;
    uint64_t v11 = _Block_copy(v20);

    __int16 v12 = v22;
    goto LABEL_8;
  }
  [(NSMutableArray *)self->_flushRequests addObject:v7];
  [(HKDataCollector *)self _queue_considerSendingBatches];
  uint64_t v13 = 0;
LABEL_10:

  _Block_object_dispose(v31, 8);

  return v13;
}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_2;
  block[3] = &unk_1E58BBAC8;
  void block[4] = v1;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

uint64_t __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  [*(id *)(a1[4] + 136) addObject:a1[5]];
  uint64_t v2 = (void *)a1[4];

  return objc_msgSend(v2, "_queue_considerSendingBatches");
}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) date];
  [v2 dataCollector:v3 didRequestCollectionThroughDate:v4 completion:*(void *)(a1 + 56)];
}

void __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) date];
  [v2 dataCollectorDidRequestCollectionThroughDate:v3 completion:*(void *)(a1 + 48)];
}

uint64_t __72__HKDataCollector__queue_callToDelegateAndEnqueueForClientFlushRequest___block_invoke_5(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 32);
      id v3 = *(void **)(v1 + 40);
      uint64_t v5 = v2;
      long long v6 = [v3 date];
      int v7 = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      int v10 = v6;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to get data flushed through %{public}@ from client in a timely fashion. Continuing to flush data to healthd.", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(*(void *)(v1 + 32) + 136) addObject:*(void *)(v1 + 40)];
    return objc_msgSend(*(id *)(v1 + 32), "_queue_considerSendingBatches");
  }
  return result;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED18100];
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53510];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_ argumentIndex:0 ofReply:0];
  long long v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v2 setClasses:v6 forSelector:sel_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_ argumentIndex:2 ofReply:0];

  return v2;
}

- (void)connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogDataCollection;
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  [(HKDataCollector *)self connectionInterrupted];
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HKDataCollector_connectionInterrupted__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_sync(queue, block);
  id unitTest_connectionInterruptedHandler = self->_unitTest_connectionInterruptedHandler;
  if (unitTest_connectionInterruptedHandler)
  {
    uint64_t v5 = (void (**)(void *, HKDataCollector *))_Block_copy(unitTest_connectionInterruptedHandler);
    v5[2](v5, self);
  }
}

uint64_t __40__HKDataCollector_connectionInterrupted__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
  [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
  objc_msgSend(*(id *)(a1 + 32), "_queue_resetUnpersistedBatches");
  int v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_queue_updateReconsiderationTimer");
}

- (id)exportedInterface
{
  return +[HKDataCollector clientInterface];
}

- (id)remoteInterface
{
  return +[HKDataCollector serverInterface];
}

- (BOOL)_validateDatums:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v40 = a4;
    id v9 = 0;
    uint64_t v10 = *(void *)v42;
    while (2)
    {
      uint64_t v11 = 0;
      __int16 v12 = v9;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        if (v12
          && ![(HKDataCollector *)self _datumsInDateOrder:v12 secondDatum:*(void *)(*((void *)&v41 + 1) + 8 * v11)])
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v40, 3, @"Datums must be in date order. Incorrect date ranges for datums: (%@), (%@)", v12, v13);
          BOOL v27 = 0;
          goto LABEL_27;
        }
        id v9 = v13;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v40, 3, @"A valid %@ object is required.", objc_opt_class(), v39);
          goto LABEL_25;
        }
        quantityType = self->_quantityType;
        uint64_t v15 = [v9 quantity];
        id v16 = [v15 _unit];
        LOBYTE(quantityType) = [(HKQuantityType *)quantityType isCompatibleWithUnit:v16];

        if ((quantityType & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v40, 3, @"Quantity (%@) does not have a unit compatible with data stream quantity type %@", v9, self->_quantityType);
          goto LABEL_25;
        }
        if ([(HKSampleType *)self->_quantityType isMaximumDurationRestricted])
        {
          long long v17 = [v9 dateInterval];
          [v17 duration];
          double v19 = v18;
          [(HKSampleType *)self->_quantityType maximumAllowedDuration];
          double v21 = v20;

          if (v19 > v21)
          {
            uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
            id v29 = [v9 dateInterval];
            uint64_t v30 = [v29 startDate];
            __int16 v31 = [v9 dateInterval];
            char v32 = [v31 endDate];
            __int16 v33 = self->_quantityType;
            [(HKSampleType *)v33 maximumAllowedDuration];
            objc_msgSend(v28, "hk_assignError:code:format:", v40, 3, @"Duration between startDate (%@) and endDate (%@) is above the maximum allowed duration for this sample type. Maximum duration for type %@ is %f", v30, v32, v33, v34);
            goto LABEL_24;
          }
        }
        if ([(HKSampleType *)self->_quantityType isMinimumDurationRestricted])
        {
          id v22 = [v9 dateInterval];
          [v22 duration];
          double v24 = v23;
          [(HKSampleType *)self->_quantityType minimumAllowedDuration];
          double v26 = v25;

          if (v24 < v26)
          {
            uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
            id v29 = [v9 dateInterval];
            uint64_t v30 = [v29 startDate];
            __int16 v31 = [v9 dateInterval];
            char v32 = [v31 endDate];
            long long v36 = self->_quantityType;
            [(HKSampleType *)v36 minimumAllowedDuration];
            objc_msgSend(v35, "hk_assignError:code:format:", v40, 3, @"Duration between startDate (%@) and endDate (%@) is below the minimum allowed duration for this sample type. Minimum duration for type %@ is %f", v30, v32, v36, v37);
LABEL_24:

LABEL_25:
            BOOL v27 = 0;
            goto LABEL_26;
          }
        }
        ++v11;
        __int16 v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v27 = 1;
LABEL_26:
    __int16 v12 = v9;
LABEL_27:
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (BOOL)_datumsInDateOrder:(id)a3 secondDatum:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 dateInterval];
  uint64_t v8 = [v7 startDate];

  id v9 = [v6 dateInterval];

  uint64_t v10 = [v9 endDate];

  uint64_t v11 = [v5 dateInterval];
  __int16 v12 = [v11 startDate];

  uint64_t v13 = [v5 dateInterval];

  dispatch_time_t v14 = [v13 endDate];

  if (objc_msgSend(v8, "hk_isAfterDate:", v12) & 1) != 0 || (objc_msgSend(v10, "hk_isAfterDate:", v14)) {
    LOBYTE(v15) = 0;
  }
  else {
    int v15 = objc_msgSend(v10, "hk_isAfterDate:", v12) ^ 1;
  }

  return v15;
}

- (void)unitTest_setMaxDatumAgeOverride:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__HKDataCollector_unitTest_setMaxDatumAgeOverride___block_invoke;
  v4[3] = &unk_1E58BD9D0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __51__HKDataCollector_unitTest_setMaxDatumAgeOverride___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 88) = result;
  return result;
}

- (void)unitTest_setClientFlushRequestTimeoutOverride:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HKDataCollector_unitTest_setClientFlushRequestTimeoutOverride___block_invoke;
  v4[3] = &unk_1E58BD9D0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __65__HKDataCollector_unitTest_setClientFlushRequestTimeoutOverride___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 96) = result;
  return result;
}

- (void)unitTest_setRegistrationCompleteHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HKDataCollector_unitTest_setRegistrationCompleteHandler___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __59__HKDataCollector_unitTest_setRegistrationCompleteHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void *)(v3 + 72))
  {
    id v4 = (uint64_t (*)(void))v2[2];
    return v4();
  }
  else
  {
    uint64_t v6 = [v2 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 104);
    *(void *)(v7 + 104) = v6;
    return MEMORY[0x1F41817F8](v6, v8);
  }
}

- (void)unitTest_setConnectionInterruptedHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id unitTest_connectionInterruptedHandler = self->_unitTest_connectionInterruptedHandler;
  self->_id unitTest_connectionInterruptedHandler = v4;

  MEMORY[0x1F41817F8](v4, unitTest_connectionInterruptedHandler);
}

- (void)unitTest_preSetStateHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id unitTest_preSetStateHandler = self->_unitTest_preSetStateHandler;
  self->_id unitTest_preSetStateHandler = v4;

  MEMORY[0x1F41817F8](v4, unitTest_preSetStateHandler);
}

- (id)unitTest_pendingBatches
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__38;
  uint64_t v11 = __Block_byref_object_dispose__38;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__HKDataCollector_unitTest_pendingBatches__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = (void *)v8[5];
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__HKDataCollector_unitTest_pendingBatches__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)unitTest_unconfirmedBatches
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__38;
  uint64_t v11 = __Block_byref_object_dispose__38;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HKDataCollector_unitTest_unconfirmedBatches__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = (void *)v8[5];
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__HKDataCollector_unitTest_unconfirmedBatches__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)unitTest_unpersistedBatches
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__38;
  uint64_t v11 = __Block_byref_object_dispose__38;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HKDataCollector_unitTest_unpersistedBatches__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  uint64_t v3 = (void *)v8[5];
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__HKDataCollector_unitTest_unpersistedBatches__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (HKDataCollectorState)state
{
  return self->_state;
}

- (HKQuantityType)quantityType
{
  return (HKQuantityType *)objc_getProperty(self, a2, 208, 1);
}

- (HKDevice)device
{
  return (HKDevice *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HKDataCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKDataCollectorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong(&self->_finishCompletion, 0);
  objc_storeStrong(&self->_resumeCompletion, 0);
  objc_storeStrong((id *)&self->_reconsiderationSource, 0);
  objc_storeStrong((id *)&self->_unpersistedBatchesByUUID, 0);
  objc_storeStrong((id *)&self->_unconfirmedBatchesByUUID, 0);
  objc_storeStrong((id *)&self->_pendingBatches, 0);
  objc_storeStrong((id *)&self->_flushRequests, 0);
  objc_storeStrong(&self->_unitTest_preSetStateHandler, 0);
  objc_storeStrong(&self->_unitTest_connectionInterruptedHandler, 0);
  objc_storeStrong(&self->_unitTest_registrationCompleteHandler, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_registrationUUID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__HKDataCollector__queue_requestRegistration__block_invoke_5_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "%{public}@: Failed to initiate registration: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __36__HKDataCollector__queue_sendBatch___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = a2;
  uint64_t v4 = [v2 batchUUID];
  id v5 = HKDiagnosticStringFromUUID(v4);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_2_3(&dword_19C023000, v6, v7, "%{public}@: Batch %{public}@: Connection error sending batch, will retry: %{public}@", v8, v9, v10, v11, v12);
}

void __36__HKDataCollector__queue_sendBatch___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = a2;
  uint64_t v4 = [v2 batchUUID];
  id v5 = HKDiagnosticStringFromUUID(v4);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_2_3(&dword_19C023000, v6, v7, "%{public}@: Batch %{public}@: Unexpected fatal error sending batch; dropping: %{public}@",
    v8,
    v9,
    v10,
    v11,
    v12);
}

- (void)_prunedBatch:(NSObject *)a3 maximumLength:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "%{public}@: Error: Failed to find a completion block in batch to be pruned: %{public}@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end