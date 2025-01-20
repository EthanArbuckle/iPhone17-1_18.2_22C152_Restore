@interface HDAnchoredObjectQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_shouldListenForUpdates;
- (BOOL)_shouldObserveOnPause;
- (BOOL)prepareToActivateServerWithError:(id *)a3;
- (BOOL)validateConfiguration:(id *)a3;
- (HDAnchoredObjectQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_queue_secureClientTokenWithError:(void *)a1;
- (id)description;
- (id)objectTypes;
- (uint64_t)_batchObjectsWithAnchor:(uint64_t)a3 error:(void *)a4 batchHandler:;
- (uint64_t)_queue_shouldAcceptUpdates;
- (void)_queue_deliverSamples:(void *)a3 deletedObjects:(void *)a4 anchor:(uint64_t)a5 clearPendingSamples:(uint64_t)a6 deliverResults:(void *)a7 description:;
- (void)_queue_didChangeStateFromPreviousState:(int64_t)a3 state:(int64_t)a4;
- (void)_queue_didDeactivate;
- (void)_queue_handleBatchedQueryResult:(void *)a3 error:;
- (void)_queue_runNextUpdateBlock;
- (void)_queue_start;
- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDAnchoredObjectQueryServer

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

- (void)_queue_start
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)HDAnchoredObjectQueryServer;
  [(HDQueryServer *)&v39 _queue_start];
  if (!self->_initialResultsSent)
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x1E4F29F90];
    v10 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Running for initial results", buf, 0xCu);
    }
    v11 = [(HDQueryServer *)self queryQueue];
    dispatch_assert_queue_V2(v11);

    v12 = [(HDQueryServer *)self clientProxy];
    id v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    if (self->_objectsDeleted)
    {
      objc_storeStrong((id *)&self->_anchor, self->_startAnchor);
      self->_deliveredResults = 0;
      self->_objectsDeleted = 0;
      *((unsigned char *)v42 + 24) = 1;
    }
    id v13 = [(HKQueryAnchor *)self->_startAnchor _clientToken];
    v14 = [(HDQueryServer *)self queryQueue];
    dispatch_assert_queue_V2(v14);

    if (v13)
    {
      v15 = -[HDAnchoredObjectQueryServer _queue_secureClientTokenWithError:](self);
      if (v15)
      {
        char v16 = [v13 isEqualToString:v15];

        if (v16)
        {
LABEL_27:
          v24 = self->_anchor;
          v25 = [(HDQueryServer *)self profile];
          v26 = [v25 database];
          *(void *)buf = 0;
          v27 = +[HDHealthEntity maxRowIDForPredicate:0 healthDatabase:v26 error:buf];
          id v28 = *(id *)buf;

          if (v27)
          {
            v29 = 0;
          }
          else
          {
            id v30 = v28;
            v29 = v30;
            if (v30) {
              id v31 = v30;
            }
          }
          id v32 = v29;
          if (v27)
          {
            uint64_t v33 = [(HKQueryAnchor *)v24 _rowid];
            if (v33 > [v27 longLongValue])
            {
              uint64_t v34 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(v27, "longLongValue"));

              v24 = (HKQueryAnchor *)v34;
            }
            id v40 = v32;
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __60__HDAnchoredObjectQueryServer__queue_startForInitialResults__block_invoke;
            v46 = &unk_1E62FC568;
            v47 = self;
            v48 = &v41;
            uint64_t v35 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)self, v24, (uint64_t)&v40, buf);
            id v36 = v40;

            -[HDAnchoredObjectQueryServer _queue_handleBatchedQueryResult:error:](self, v35, v36);
            if (v35 == 2) {
              -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](self, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], self->_startAnchor, 1, 1, @"initial results");
            }
            [(HDQueryServer *)self setDataCount:self->_deliveredResults];
            id v32 = v36;
            goto LABEL_42;
          }
          _HKInitializeLogging();
          v37 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v32;
            _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "%{public}@: encountered error calculating max rowid: %{public}@", buf, 0x16u);
            if (v32) {
              goto LABEL_41;
            }
          }
          else if (v32)
          {
LABEL_41:
            v38 = [(HDQueryServer *)self queryUUID];
            objc_msgSend(v12, "client_deliverError:forQuery:", v32, v38);

LABEL_42:
            _Block_object_dispose(&v41, 8);

            return;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Failed to find maximum row ID but no error was provided.");
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
      }
      else
      {
        int v18 = objc_msgSend(0, "hk_isDatabaseSchemaRolledBackError");
        _HKInitializeLogging();
        v19 = *v9;
        v20 = *v9;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = 0;
            _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Unable to synthesize query anchor token for validation: %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = 0;
          _os_log_fault_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_FAULT, "%{public}@: Unable to synthesize query anchor token for validation: %{public}@", buf, 0x16u);
        }
      }
      _HKInitializeLogging();
      v21 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        startAnchor = self->_startAnchor;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = startAnchor;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating stale query anchor %{public}@", buf, 0x16u);
      }
      v23 = self->_startAnchor;
      self->_startAnchor = 0;

      anchor = self->_anchor;
      self->_anchor = 0;
    }
    else
    {
      anchor = 0;
    }

    goto LABEL_27;
  }
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_INFO, "%{public}@: Running for update", buf, 0xCu);
  }
  if ([(NSMutableArray *)self->_addedSamplesPendingResume count]
    || [(NSMutableArray *)self->_deletedSamplesPendingResume count])
  {
    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](self, self->_addedSamplesPendingResume, self->_deletedSamplesPendingResume, self->_anchor, 0, 1, @"pending updates after resume");
    addedSamplesPendingResume = self->_addedSamplesPendingResume;
    self->_addedSamplesPendingResume = 0;

    deletedSamplesPendingResume = self->_deletedSamplesPendingResume;
    self->_deletedSamplesPendingResume = 0;
  }
  v6 = self->_anchor;
  id v41 = 0;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __52__HDAnchoredObjectQueryServer__queue_startForUpdate__block_invoke;
  v46 = &unk_1E62FC590;
  v47 = self;
  uint64_t v7 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)self, v6, (uint64_t)&v41, buf);
  id v8 = v41;
  -[HDAnchoredObjectQueryServer _queue_handleBatchedQueryResult:error:](self, v7, v8);
}

void __60__HDAnchoredObjectQueryServer__queue_startForInitialResults__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [*(id *)(a1 + 32) filteredSamplesForClientWithSamples:a2];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(a1 + 32), "sanitizedSampleForQueryClient:", *(void *)(*((void *)&v22 + 1) + 8 * v16), (void)v22);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [MEMORY[0x1E4F2B3C8] _anchorWithRowid:a4];
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 296);
  *(void *)(v19 + 296) = v18;

  uint64_t v21 = [v11 count];
  *(void *)(*(void *)(a1 + 32) + 240) += [v9 count] + v21;
  *(unsigned char *)(*(void *)(a1 + 32) + 217) = a5;
  -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(void **)(a1 + 32), v11, v9, *(void **)(*(void *)(a1 + 32) + 296), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a5, @"initial results");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HDAnchoredObjectQueryServer_samplesAdded_anchor___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(HDQueryServer *)self onQueue:v7];
}

uint64_t __51__HDAnchoredObjectQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 248);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 248);
    *(void *)(v4 + 248) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 248);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObjectsFromArray:v6];
}

- (uint64_t)_queue_shouldAcceptUpdates
{
  if (!*(unsigned char *)(a1 + 217)) {
    return 0;
  }
  if ([(id)a1 queryState] == 2) {
    return 1;
  }
  uint64_t result = [(id)a1 clientHasActiveWorkout];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 256) count];
    return (unint64_t)([*(id *)(a1 + 264) count] + v3) < 0xC8;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSourceUUIDString, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_pendingUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_sampleTypeToFilterMap, 0);
  objc_storeStrong((id *)&self->_deletedSamplesPendingResume, 0);
  objc_storeStrong((id *)&self->_addedSamplesPendingResume, 0);
  objc_storeStrong((id *)&self->_addedSamplesPendingDidAddNotification, 0);
  objc_storeStrong((id *)&self->_secureClientToken, 0);

  objc_storeStrong((id *)&self->_startAnchor, 0);
}

- (HDAnchoredObjectQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HDAnchoredObjectQueryServer;
  id v12 = [(HDQueryServer *)&v25 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    uint64_t v13 = [v10 anchor];
    startAnchor = v12->_startAnchor;
    v12->_startAnchor = (HKQueryAnchor *)v13;

    objc_storeStrong((id *)&v12->_anchor, v12->_startAnchor);
    v12->_limit = [v10 limit];
    v12->_deliversUpdates = [v10 shouldDeactivateAfterInitialResults] ^ 1;
    v12->_includeDeletedObjects = [v10 includeDeletedObjects];
    v12->_includeAutomaticTimeZones = [v10 includeAutomaticTimeZones];
    [v10 collectionInterval];
    -[HDQueryServer setCollectionInterval:](v12, "setCollectionInterval:");
    v12->_includeContributorInformation = [v10 includeContributorInformation];
    uint64_t v15 = [v10 queryDescriptors];
    queryDescriptors = v12->_queryDescriptors;
    v12->_queryDescriptors = (NSArray *)v15;

    v17 = [v10 queryDescriptors];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__HDAnchoredObjectQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v23[3] = &unk_1E62FC460;
    id v24 = v11;
    uint64_t v18 = objc_msgSend(v17, "hk_mapToDictionary:", v23);
    sampleTypeToFilterMap = v12->_sampleTypeToFilterMap;
    v12->_sampleTypeToFilterMap = (NSDictionary *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingUpdateBlocks = v12->_pendingUpdateBlocks;
    v12->_pendingUpdateBlocks = v20;
  }
  return v12;
}

void __74__HDAnchoredObjectQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = [v6 sampleType];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 _filter];

  id v9 = [v7 filterWithQueryFilter:v8 objectType:v10];
  v5[2](v5, v10, v9);
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HDAnchoredObjectQueryServer;
  uint64_t v4 = [(HDQueryServer *)&v10 description];
  id v5 = [(HDQueryServer *)self client];
  id v6 = [v5 process];
  uint64_t v7 = [v6 bundleIdentifier];
  id v8 = [v3 stringWithFormat:@"<%@ %@>", v4, v7];

  return v8;
}

- (id)objectTypes
{
  if (self) {
    self = (HDAnchoredObjectQueryServer *)self->_queryDescriptors;
  }
  return (id)[(HDAnchoredObjectQueryServer *)self hk_mapToSet:&__block_literal_global_69];
}

uint64_t __42__HDAnchoredObjectQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sampleType];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (BOOL)validateConfiguration:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDAnchoredObjectQueryServer;
  BOOL v5 = -[HDQueryServer validateConfiguration:](&v9, sel_validateConfiguration_);
  if (v5)
  {
    if (self->_includeAutomaticTimeZones
      && ([(HDQueryServer *)self client],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 hasPrivateMetadataAccess],
          v6,
          (v7 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 4, @"Unauthorized use of includeAutomaticTimeZones");
      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)prepareToActivateServerWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HDAnchoredObjectQueryServer;
  if (!-[HDQueryServer prepareToActivateServerWithError:](&v26, sel_prepareToActivateServerWithError_)) {
    return 0;
  }
  BOOL v5 = [(HDQueryServer *)self client];
  id v6 = [v5 entitlements];
  char v7 = [v6 hasEntitlement:*MEMORY[0x1E4F29728]];

  if (v7) {
    return 1;
  }
  objc_super v9 = [(HDQueryServer *)self profile];
  objc_super v10 = [v9 sourceManager];
  id v11 = [(HDQueryServer *)self client];
  id v25 = 0;
  id v12 = [v10 createOrUpdateSourceForClient:v11 error:&v25];
  id v13 = v25;

  if (objc_msgSend(v13, "hk_isAuthorizationDeniedError"))
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = self;
      _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Client has no source bundle identifier", buf, 0xCu);
    }
    BOOL v8 = 1;
    id v15 = v13;
  }
  else if (v12)
  {
    uint64_t v16 = [(HDQueryServer *)self profile];
    id v24 = v13;
    v17 = [v12 sourceUUIDWithProfile:v16 error:&v24];
    id v15 = v24;

    BOOL v8 = v17 != 0;
    if (v17)
    {
      id v19 = [v17 UUIDString];
      if (self) {
        objc_setProperty_atomic_copy(self, v18, v19, 320);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = self;
        __int16 v29 = 2114;
        id v30 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve source UUID: %{public}@", buf, 0x16u);
      }
      id v22 = v15;
      id v19 = v22;
      if (v22)
      {
        if (a3)
        {
          id v19 = v22;
          *a3 = v19;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = self;
      __int16 v29 = 2114;
      id v30 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch/create local client source: %{public}@", buf, 0x16u);
    }
    id v15 = v13;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldObserveOnPause
{
  if (self->_initialResultsSent)
  {
    BOOL v3 = [(HDQueryServer *)self clientHasActiveWorkout];
    if (v3)
    {
      uint64_t v4 = [(NSMutableArray *)self->_addedSamplesPendingResume count];
      LOBYTE(v3) = (unint64_t)([(NSMutableArray *)self->_deletedSamplesPendingResume count] + v4) < 0xC8;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_queue_didDeactivate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    BOOL v5 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: did deactivate", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableArray *)self->_pendingUpdateBlocks removeAllObjects];
}

- (void)_queue_didChangeStateFromPreviousState:(int64_t)a3 state:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HDAnchoredObjectQueryServer;
  -[HDQueryServer _queue_didChangeStateFromPreviousState:state:](&v11, sel__queue_didChangeStateFromPreviousState_state_);
  _HKInitializeLogging();
  char v7 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    objc_super v9 = HDStringFromQueryServerState(a3);
    objc_super v10 = HDStringFromQueryServerState(a4);
    *(_DWORD *)buf = 138543874;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: changed state (%@) -> (%@)", buf, 0x20u);
  }
}

- (void)_queue_runNextUpdateBlock
{
  if (a1 && !*(unsigned char *)(a1 + 288))
  {
    v2 = [*(id *)(a1 + 280) firstObject];
    if (v2)
    {
      [*(id *)(a1 + 280) removeObjectAtIndex:0];
      *(unsigned char *)(a1 + 288) = 1;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke;
      v3[3] = &unk_1E62F3208;
      v3[4] = a1;
      ((void (**)(void, void *))v2)[2](v2, v3);
    }
  }
}

uint64_t __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke_2;
  v3[3] = &unk_1E62F3208;
  v3[4] = v1;
  return [v1 onQueue:v3];
}

uint64_t __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 288) = 0;
  return -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(void *)(a1 + 32));
}

void __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 280);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke_2;
  v5[3] = &unk_1E62FC4A8;
  id v6 = *(id *)(a1 + 40);
  BOOL v3 = (void *)[v5 copy];
  int v4 = _Block_copy(v3);
  [v2 addObject:v4];

  -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(void *)(a1 + 32));
}

void __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void (**)(uint64_t))(v2 + 16);
  int v4 = a2;
  v3(v2);
  v4[2]();
}

void __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 280);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_2;
  BOOL v8 = &unk_1E62FC4F8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  BOOL v3 = (void *)[&v5 copy];
  int v4 = _Block_copy(v3);
  objc_msgSend(v2, "addObject:", v4, v5, v6, v7, v8);

  -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(void *)(a1 + 32));
  objc_destroyWeak(&v10);
}

void __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_3;
  v6[3] = &unk_1E62FC4D0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [WeakRetained scheduleDatabaseAccessOnQueueWithBlock:v6];
}

uint64_t __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_queue_deliverSamples:(void *)a3 deletedObjects:(void *)a4 anchor:(uint64_t)a5 clearPendingSamples:(uint64_t)a6 deliverResults:(void *)a7 description:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v22 = a7;
  if (a1)
  {
    __int16 v16 = [a1 queryQueue];
    dispatch_assert_queue_V2(v16);

    v17 = -[HDAnchoredObjectQueryServer _queue_secureClientTokenWithError:](a1);
    if (v17) {
      [v15 _setClientToken:v17];
    }
    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F2B3C8] latestAnchor];
    }
    _HKInitializeLogging();
    uint64_t v18 = (void *)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      *(_DWORD *)buf = 138544898;
      id v24 = a1;
      __int16 v25 = 2114;
      id v26 = v22;
      __int16 v27 = 2048;
      uint64_t v28 = [v13 count];
      __int16 v29 = 2048;
      uint64_t v30 = [v14 count];
      __int16 v31 = 2048;
      uint64_t v32 = [v15 _rowid];
      __int16 v33 = 1024;
      int v34 = a5;
      __int16 v35 = 1024;
      int v36 = a6;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering %{public}@: %lu samples, %lu deleted objects (anchor:%llu clear-pending:%{BOOL}d deliver:%{BOOL}d)", buf, 0x40u);
    }
    v20 = [a1 clientProxy];
    uint64_t v21 = [a1 queryUUID];
    objc_msgSend(v20, "client_deliverSampleObjects:deletedObjects:anchor:clearPendingSamples:deliverResults:query:", v13, v14, v15, a5, a6, v21);
  }
}

uint64_t __62__HDAnchoredObjectQueryServer__queue_didAddSamplesWithAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 sampleType];
  uint64_t v3 = [v2 requiresPerObjectAuthorization] ^ 1;

  return v3;
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDAnchoredObjectQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v11[3] = &unk_1E62F7308;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v11;
  id v10 = v9;
  if (self)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke;
    v15[3] = &unk_1E62F4928;
    v15[4] = self;
    __int16 v16 = v9;
    [(HDQueryServer *)self onQueue:v15];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __59__HDAnchoredObjectQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    id v3 = WeakRetained[31];
    int v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_307_0);
    if ([v4 count])
    {
      id v5 = WeakRetained[31];
      WeakRetained[31] = 0;

      id v6 = v4;
      id v7 = v2;
      if (-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained))
      {
        uint64_t v8 = [v7 longLongValue];
        if (v8 <= [WeakRetained[37] _rowid])
        {
          _HKInitializeLogging();
          uint64_t v37 = (void *)*MEMORY[0x1E4F29F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            uint64_t v39 = [v7 longLongValue];
            uint64_t v40 = [WeakRetained[37] _rowid];
            *(_DWORD *)v68 = 138543874;
            v69 = WeakRetained;
            __int16 v70 = 2048;
            uint64_t v71 = v39;
            __int16 v72 = 2048;
            uint64_t v73 = v40;
            _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: skip samples added update because anchor %lld <= current anchor %lld", v68, 0x20u);
          }
        }
        else
        {
          id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v9 = [WeakRetained client];
          id v10 = [v9 authorizationOracle];
          id v61 = 0;
          objc_super v11 = [v10 filteredObjectsForReadAuthorization:v6 anchor:v7 error:&v61];
          id v12 = v61;

          if (v11)
          {
            id v48 = v12;
            uint64_t v49 = v4;
            v52 = v6;
            id v53 = v7;
            id v50 = v3;
            id v51 = v2;
            id v13 = [WeakRetained filteredSamplesForClientWithSamples:v11];

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id obj = v13;
            uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v58;
              v17 = (os_log_t *)MEMORY[0x1E4F29F90];
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v58 != v16) {
                    objc_enumerationMutation(obj);
                  }
                  id v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  id v20 = WeakRetained[34];
                  uint64_t v21 = [v19 sampleType];
                  id v22 = [v20 objectForKeyedSubscript:v21];

                  if ([MEMORY[0x1E4F2B8E8] filter:v22 acceptsDataObject:v19])
                  {
                    long long v23 = [WeakRetained sanitizedSampleForQueryClient:v19];
                    [v54 addObject:v23];
                  }
                  else
                  {
                    _HKInitializeLogging();
                    id v24 = *v17;
                    if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v63 = WeakRetained;
                      __int16 v64 = 2112;
                      uint64_t v65 = (uint64_t)v19;
                      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "%{public}@: samples added filter does not accept sample %@", buf, 0x16u);
                    }
                  }
                }
                uint64_t v15 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
              }
              while (v15);
            }
            __int16 v25 = obj;

            id v6 = v52;
            uint64_t v26 = [v52 count];
            if (v26 != [v54 count])
            {
              _HKInitializeLogging();
              __int16 v27 = (void *)*MEMORY[0x1E4F29F90];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = v27;
                uint64_t v29 = [v52 count];
                uint64_t v30 = [v54 count];
                *(_DWORD *)buf = 138543874;
                v63 = WeakRetained;
                __int16 v64 = 2048;
                uint64_t v65 = v29;
                __int16 v66 = 2048;
                uint64_t v67 = v30;
                _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: samples added count %lu != updatedObjects count %lu", buf, 0x20u);
              }
            }
            if ([v54 count])
            {
              __int16 v31 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(v7, "longLongValue"));
              if ([WeakRetained queryState] == 2)
              {
                unint64_t v32 = [v54 count];
                if (v32 < 0xC9)
                {
                  uint64_t v33 = 0;
                }
                else
                {
                  uint64_t v33 = 0;
                  int v34 = (void *)MEMORY[0x1E4F1CBF0];
                  do
                  {
                    __int16 v35 = objc_msgSend(v54, "subarrayWithRange:", v33, 200);
                    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](WeakRetained, v35, v34, WeakRetained[37], 0, 0, @"updates after samples added");
                    v33 += 200;
                    v32 -= 200;
                  }
                  while (v32 > 0xC8);
                }
                v46 = objc_msgSend(v54, "subarrayWithRange:", v33, v32);
                -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](WeakRetained, v46, MEMORY[0x1E4F1CBF0], v31, 0, 1, @"updates after samples added");

                id v7 = v53;
                __int16 v25 = obj;
              }
              else
              {
                id v42 = WeakRetained[32];
                if (!v42)
                {
                  uint64_t v43 = objc_opt_new();
                  id v44 = WeakRetained[32];
                  WeakRetained[32] = (id)v43;

                  id v42 = WeakRetained[32];
                }
                [v42 addObjectsFromArray:v54];
                if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) == 0)
                {
                  _HKInitializeLogging();
                  v45 = *MEMORY[0x1E4F29F90];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    v63 = WeakRetained;
                    _os_log_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_INFO, "%{public}@: Pausing after accumulating samples", buf, 0xCu);
                  }
                  [WeakRetained schedulePause];
                }
              }
              id v47 = WeakRetained[37];
              WeakRetained[37] = v31;
            }
            id v3 = v50;
            id v2 = v51;
            id v12 = v48;
            int v4 = v49;
          }
          else
          {
            _HKInitializeLogging();
            id v41 = *MEMORY[0x1E4F29F90];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v68 = 138543618;
              v69 = WeakRetained;
              __int16 v70 = 2114;
              uint64_t v71 = (uint64_t)v12;
              _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", v68, 0x16u);
            }
            __int16 v25 = 0;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        int v36 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v68 = 138543362;
          v69 = WeakRetained;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_INFO, "%{public}@: Samples added while not accepting updates", v68, 0xCu);
        }
      }
    }
  }
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HDAnchoredObjectQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v10[3] = &unk_1E62F7308;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  id v9 = v10;
  if (self)
  {
    objc_initWeak(&from, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke;
    v14[3] = &unk_1E62FC520;
    v14[4] = self;
    objc_copyWeak(&v16, &from);
    uint64_t v15 = v9;
    [(HDQueryServer *)self onQueue:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __64__HDAnchoredObjectQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained && ([WeakRetained _shouldStopProcessingQuery] & 1) == 0)
  {
    if (-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained))
    {
      uint64_t v3 = [v2 longLongValue];
      if (v3 > [WeakRetained[37] _rowid])
      {
        int v4 = [WeakRetained sampleType];
        id v31 = 0;
        id v5 = [WeakRetained readAuthorizationStatusForType:v4 error:&v31];
        id v6 = v31;

        if (v5)
        {
          if ([v5 canRead])
          {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v27 = 0;
            uint64_t v28 = &v27;
            uint64_t v29 = 0x2020000000;
            uint64_t v30 = -1;
            id v9 = WeakRetained[37];
            id v26 = v6;
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __67__HDAnchoredObjectQueryServer__queue_samplesWereRemovedWithAnchor___block_invoke;
            uint64_t v37 = &unk_1E62FC5B8;
            v38 = WeakRetained;
            id v10 = v7;
            id v39 = v10;
            id v11 = v8;
            id v40 = v11;
            id v41 = &v27;
            uint64_t v12 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)WeakRetained, v9, (uint64_t)&v26, buf);
            id v13 = v26;

            if (v12)
            {
              _HKInitializeLogging();
              uint64_t v14 = *MEMORY[0x1E4F29F90];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)unint64_t v32 = 138543618;
                uint64_t v33 = WeakRetained;
                __int16 v34 = 2114;
                id v35 = v13;
                _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while enumerating after object deletion: %{public}@", v32, 0x16u);
              }
            }
            if (([v10 count] || objc_msgSend(v11, "count"))
              && [WeakRetained queryState] != 2)
            {
              if ([v11 count])
              {
                id v15 = WeakRetained[33];
                if (!v15)
                {
                  uint64_t v16 = objc_opt_new();
                  id v17 = WeakRetained[33];
                  WeakRetained[33] = (id)v16;

                  id v15 = WeakRetained[33];
                }
                [v15 addObjectsFromArray:v11];
              }
              if ([v10 count])
              {
                id v18 = WeakRetained[32];
                if (!v18)
                {
                  uint64_t v19 = objc_opt_new();
                  id v20 = WeakRetained[32];
                  WeakRetained[32] = (id)v19;

                  id v18 = WeakRetained[32];
                }
                [v18 addObjectsFromArray:v10];
              }
              if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) == 0) {
                [WeakRetained schedulePause];
              }
              uint64_t v21 = [MEMORY[0x1E4F2B3C8] _anchorWithRowid:v28[3]];
              id v22 = WeakRetained[37];
              WeakRetained[37] = (id)v21;
            }
            _Block_object_dispose(&v27, 8);

            id v6 = v13;
          }
        }
        else
        {
          _HKInitializeLogging();
          id v24 = *MEMORY[0x1E4F29F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v6;
            _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve authorization status; ignoring removed samples: %{public}@",
              buf,
              0x16u);
          }
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      long long v23 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = WeakRetained;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_INFO, "%{public}@: Samples removed while not accepting updates", buf, 0xCu);
      }
      *((unsigned char *)WeakRetained + 218) = 1;
    }
  }
}

- (uint64_t)_batchObjectsWithAnchor:(uint64_t)a3 error:(void *)a4 batchHandler:
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 312) count] == 1)
  {
    id v37 = v7;
    id v36 = v8;
    id v9 = [(id)a1 queryQueue];
    dispatch_assert_queue_V2(v9);

    id v10 = (void *)[(id)a1 newDataEntityEnumerator];
    id v11 = [(id)a1 filter];
    [v10 setFilter:v11];

    uint64_t v12 = [(id)a1 sampleAuthorizationFilter];
    [v10 setAuthorizationFilter:v12];

    id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A280] ascending:1];
    v41[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [v10 setSortDescriptors:v14];

    id v15 = [(id)a1 client];
    uint64_t v16 = [v15 authorizationOracle];
    id v17 = [(id)a1 objectType];
    id v40 = 0;
    id v18 = [v16 additionalAuthorizationPredicateForObjectType:v17 error:&v40];
    id v19 = v40;

    if (v18)
    {
      [v10 setPredicate:v18];
      if (*(unsigned char *)(a1 + 289)) {
        [v10 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:@"IncludeAutomaticTimeZone"];
      }
      if (*(unsigned char *)(a1 + 290))
      {
        id v20 = [(id)a1 client];
        int v21 = [v20 hasEntitlement:*MEMORY[0x1E4F29928]];

        if (v21) {
          [v10 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:@"IncludeContributorInformation"];
        }
      }
      id v22 = v10;
    }
    else
    {
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_configuredEntityEnumerator, @"Unable to determine authorization status."");
      uint64_t v28 = [(id)a1 clientProxy];
      uint64_t v29 = [(id)a1 queryUUID];
      objc_msgSend(v28, "client_deliverError:forQuery:", v27, v29);

      id v22 = 0;
    }

    if (v22)
    {
      uint64_t v30 = *(void *)(a1 + 304);
      if (v30 && !*(unsigned char *)(a1 + 217)) {
        [v22 setLimitCount:v30 - *(void *)(a1 + 240)];
      }
      id v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v37, "_rowid"));
      [v22 setAnchor:v31];

      uint64_t v32 = *(unsigned __int8 *)(a1 + 219);
      uint64_t v33 = (void *)a1;
      __int16 v34 = v36;
      uint64_t v26 = [v33 batchObjectsWithEnumerator:v22 includeDeletedObjects:v32 error:a3 batchHandler:v36];
    }
    else
    {
      uint64_t v26 = 1;
      __int16 v34 = v36;
    }
  }
  else
  {
    long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F2B438]) initWithQueryDescriptors:*(void *)(a1 + 312) sortDescriptors:0 followingAnchor:v7 upToAndIncludingAnchor:0 distinctByKeyPaths:0 state:0];
    uint64_t v24 = *(unsigned __int8 *)(a1 + 219);
    uint64_t v25 = *(void *)(a1 + 304);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __74__HDAnchoredObjectQueryServer__batchObjectsWithAnchor_error_batchHandler___block_invoke;
    v38[3] = &unk_1E62FC5E0;
    id v39 = v8;
    uint64_t v26 = [(id)a1 batchObjectsWithMultitypeQueryCursor:v23 includeDeletedObjects:v24 limit:v25 error:a3 batchHandler:v38];
  }
  return v26;
}

- (void)_queue_handleBatchedQueryResult:(void *)a3 error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a2)
  {
    case 1:
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          goto LABEL_5;
        }
        goto LABEL_4;
      }
      int v11 = 138543618;
      uint64_t v12 = a1;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", (uint8_t *)&v11, 0x16u);
      if (!v5)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sample enumeration failed without reporting an error.");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_5:
      id v7 = [a1 clientProxy];
      id v8 = [a1 queryUUID];
      objc_msgSend(v7, "client_deliverError:forQuery:", v5, v8);

LABEL_13:
      return;
    case 2:
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        int v11 = 138543362;
        uint64_t v12 = a1;
        id v10 = "%{public}@: Client no longer authorized";
        goto LABEL_12;
      }
      goto LABEL_13;
    case 3:
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        int v11 = 138543362;
        uint64_t v12 = a1;
        id v10 = "%{public}@: Suspended during enumeration";
        goto LABEL_12;
      }
      goto LABEL_13;
    case 4:
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        int v11 = 138543362;
        uint64_t v12 = a1;
        id v10 = "%{public}@: Canceled during enumeration";
LABEL_12:
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_13;
    default:
      goto LABEL_13;
  }
}

void __52__HDAnchoredObjectQueryServer__queue_startForUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v11 = a3;
  id v7 = [*(id *)(a1 + 32) filteredSamplesForClientWithSamples:a2];
  uint64_t v8 = [MEMORY[0x1E4F2B3C8] _anchorWithRowid:a4];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 296);
  *(void *)(v9 + 296) = v8;

  if ([v7 count] || objc_msgSend(v11, "count")) {
    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(void **)(a1 + 32), v7, v11, *(void **)(*(void *)(a1 + 32) + 296), 0, 1, @"updates after resume");
  }
}

- (id)_queue_secureClientTokenWithError:(void *)a1
{
  id v2 = [a1 queryQueue];
  dispatch_assert_queue_V2(v2);

  int v4 = (void *)a1[29];
  if (!v4)
  {
    id v5 = objc_getProperty(a1, v3, 320, 1);
    if (!v5) {
      goto LABEL_5;
    }
    id v6 = v5;
    uint64_t v7 = objc_msgSend(v5, "hk_SHA512Hash");
    uint64_t v8 = (void *)a1[29];
    a1[29] = v7;

    int v4 = (void *)a1[29];
  }
  id v5 = v4;
LABEL_5:

  return v5;
}

void __67__HDAnchoredObjectQueryServer__queue_samplesWereRemovedWithAnchor___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v14 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 queryState];
  id v10 = [*(id *)(a1 + 32) filteredSamplesForClientWithSamples:v8];

  if (v9 == 2)
  {
    uint64_t v11 = [MEMORY[0x1E4F2B3C8] _anchorWithRowid:a4];
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(void **)(v12 + 296);
    *(void *)(v12 + 296) = v11;

    if ([v10 count] || objc_msgSend(v14, "count")) {
      -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(void **)(a1 + 32), v10, v14, *(void **)(*(void *)(a1 + 32) + 296), 0, 1, @"updates after resume");
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObjectsFromArray:v10];
    [*(id *)(a1 + 48) addObjectsFromArray:v14];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  }
}

uint64_t __74__HDAnchoredObjectQueryServer__batchObjectsWithAnchor_error_batchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end