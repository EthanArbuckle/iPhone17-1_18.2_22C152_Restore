@interface HDObserverQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (HDObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_sampleTypesToUpdateWithSamples:(uint64_t)a1;
- (id)objectTypes;
- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5;
- (void)_deliverDataWasUpdatedForTypes:(void *)a3 withAnchor:;
- (void)_queue_start;
- (void)_queue_stop;
- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDObserverQueryServer

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__HDObserverQueryServer_database_protectedDataDidBecomeAvailable___block_invoke;
    v4[3] = &unk_1E62F3208;
    v4[4] = self;
    [(HDQueryServer *)self onQueue:v4];
  }
}

void __66__HDObserverQueryServer_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 200))
  {
    if (*(void *)(v2 + 208) || *(void *)(v2 + 216))
    {
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F2B3D8]) initWithDataAnchor:*(void *)(*(void *)(a1 + 32) + 208) associationAnchor:*(void *)(*(void *)(a1 + 32) + 216)];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      id v7 = 0;
    }
    v3 = [(id)v2 clientProxy];
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[28];
    v6 = [v4 queryUUID];
    objc_msgSend(v3, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v5, v7, v6);
  }
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)HDObserverQueryServer;
  [(HDQueryServer *)&v58 _queue_start];
  self->_deliverOnUnlock = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__114;
  v52 = __Block_byref_object_dispose__114;
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v3 = [(HDObserverQueryServer *)self objectTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v44 objects:v65 count:16];
  if (v4)
  {
    id v5 = 0;
    uint64_t v35 = *(void *)v45;
    uint64_t v34 = *MEMORY[0x1E4F65C70];
    obuint64_t j = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v43 = v5;
        id v8 = v7;
        v9 = [(HDQueryServer *)self readAuthorizationStatusForType:v8 error:&v43];
        if (v9)
        {
          v10 = [(HDQueryServer *)self profile];
          v11 = +[HDSampleEntity entityEnumeratorWithType:v8 profile:v10];

          v12 = [v9 restrictedSourceEntities];
          [v11 setRestrictedSourceEntities:v12];

          v13 = [(HDQueryServer *)self sampleAuthorizationFilter];
          [v11 setAuthorizationFilter:v13];

          v14 = [(NSDictionary *)self->_sampleTypeToFilterMap objectForKeyedSubscript:v8];
          [v11 setFilter:v14];

          [v11 setLimitCount:1];
          v15 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v34 entityClass:objc_opt_class() ascending:0];
          *(void *)buf = v15;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          [v11 setOrderingTerms:v16];
        }
        else
        {
          v11 = 0;
        }

        id v17 = v43;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __37__HDObserverQueryServer__queue_start__block_invoke;
        v41[3] = &unk_1E62FB558;
        v41[4] = &v48;
        v41[5] = &v54;
        id v42 = v17;
        [v11 enumerateWithError:&v42 handler:v41];
        id v5 = v42;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v65 count:16];
    }
    while (v4);

    if (v5)
    {
      if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Can't retrieve observer query anchor while db locked.", buf, 2u);
        }
      }
      else
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v5;
          _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "Unable to pull latest anchor for observer query: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {

    id v5 = 0;
  }
  v20 = [(HDQueryServer *)self profile];
  v21 = [v20 dataManager];
  v36 = [v21 quantitySeriesManager];

  v22 = [(HDQueryServer *)self queryQueue];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = [(HDObserverQueryServer *)self objectTypes];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v64 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && self->_observeUnfrozenSeries) {
          [v36 addObserver:self forType:v27 queue:v22];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v64 count:16];
    }
    while (v24);
  }

  _HKInitializeLogging();
  v28 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = v49[5];
    uint64_t v30 = v55[3];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    __int16 v60 = 2114;
    uint64_t v61 = v29;
    __int16 v62 = 2050;
    uint64_t v63 = v30;
    _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Queue start for types: %{public}@, anchor: %{public}lli", buf, 0x20u);
  }
  v31 = (void *)v49[5];
  v32 = [NSNumber numberWithLongLong:v55[3]];
  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v31, v32);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (void)_queue_stop
{
  v8.receiver = self;
  v8.super_class = (Class)HDObserverQueryServer;
  [(HDQueryServer *)&v8 _queue_stop];
  self->_deliverOnUnlock = 0;
  v3 = [(HDQueryServer *)self quantityType];
  if (v3)
  {
    uint64_t v4 = [(HDQueryServer *)self profile];
    id v5 = [v4 dataManager];
    v6 = [v5 quantitySeriesManager];
    id v7 = [(HDQueryServer *)self quantityType];
    [v6 removeObserver:self forType:v7];
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  objc_super v8 = (os_log_t *)MEMORY[0x1E4F29F90];
  v9 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: samplesAdded: %{public}@, anchor: %{public}@", buf, 0x20u);
  }
  v10 = [(HDQueryServer *)self client];
  v11 = [v10 authorizationOracle];
  id v16 = 0;
  v12 = [v11 filteredObjectsForReadAuthorization:v6 anchor:v7 error:&v16];
  id v13 = v16;

  if (v12)
  {
    v14 = -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:]((uint64_t)self, v12);
    if ([v14 count]) {
      -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v14, v7);
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
    }
  }
}

- (HDObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDObserverQueryServer;
  v12 = [(HDQueryServer *)&v21 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    v12->_observeUnfrozenSeries = [v10 observeUnfrozenSeries];
    uint64_t v13 = [v10 queryDescriptors];
    queryDescriptors = v12->_queryDescriptors;
    v12->_queryDescriptors = (NSArray *)v13;

    v15 = [v10 queryDescriptors];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__HDObserverQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v19[3] = &unk_1E62FC460;
    id v20 = v11;
    uint64_t v16 = objc_msgSend(v15, "hk_mapToDictionary:", v19);
    sampleTypeToFilterMap = v12->_sampleTypeToFilterMap;
    v12->_sampleTypeToFilterMap = (NSDictionary *)v16;
  }
  return v12;
}

void __68__HDObserverQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = [v6 sampleType];
  id v7 = *(void **)(a1 + 32);
  objc_super v8 = [v6 _filter];

  v9 = [v7 filterWithQueryFilter:v8 objectType:v10];
  v5[2](v5, v10, v9);
}

uint64_t __37__HDObserverQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = [a2 sampleType];
  [v5 addObject:v6];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 <= a3) {
    uint64_t v8 = a3;
  }
  *(void *)(v7 + 24) = v8;
  return 0;
}

- (void)_deliverDataWasUpdatedForTypes:(void *)a3 withAnchor:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__HDObserverQueryServer__deliverDataWasUpdatedForTypes_withAnchor___block_invoke;
    v8[3] = &unk_1E62F30F8;
    v8[4] = a1;
    id v9 = v6;
    id v10 = v5;
    [a1 onQueue:v8];
  }
}

- (id)_sampleTypesToUpdateWithSamples:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  __int16 v19 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v12 = [v11 sampleType];
          char v13 = [v5 containsObject:v12];

          if ((v13 & 1) == 0)
          {
            v14 = *(void **)(a1 + 240);
            v15 = [v11 sampleType];
            uint64_t v16 = [v14 objectForKeyedSubscript:v15];

            if ([MEMORY[0x1E4F2B8E8] filter:v16 acceptsDataObject:v11])
            {
              id v17 = [v11 sampleType];
              [v5 addObject:v17];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithArray:v8];

  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v9, v7);
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  id v11 = [a6 arrayByAddingObject:a3];
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E4F29F90];
  char v13 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: associationsUpdated: %{public}@, anchor: %{public}@", buf, 0x20u);
  }
  v14 = [(HDQueryServer *)self client];
  v15 = [v14 authorizationOracle];
  id v23 = 0;
  uint64_t v16 = [v15 filteredObjectsForReadAuthorization:v11 anchor:v10 error:&v23];
  id v17 = v23;

  if (v16)
  {
    v18 = -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:]((uint64_t)self, v16);
    if ([v18 count])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__HDObserverQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke;
      v20[3] = &unk_1E62F30F8;
      v20[4] = self;
      id v21 = v10;
      id v22 = v18;
      [(HDQueryServer *)self onQueue:v20];
    }
  }
  else
  {
    _HKInitializeLogging();
    __int16 v19 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
    }
  }
}

void __84__HDObserverQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  id v3 = [v2 database];
  int v4 = [v3 isProtectedDataAvailable];

  if (v4)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F2B3D8]) initWithDataAnchor:0 associationAnchor:*(void *)(a1 + 40)];
    id v5 = [*(id *)(a1 + 32) clientProxy];
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v5, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v6, v12, v7);

    id v8 = (void *)v12;
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(a1 + 40));
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = v9;
    id v8 = *(void **)(v10 + 224);
    *(void *)(v10 + 224) = v11;
  }
}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  if (a4)
  {
    uint64_t v6 = 0;
    self->_deliverOnUnlock = 1;
  }
  else
  {
    id v7 = [(HDQueryServer *)self client];
    id v8 = [v7 authorizationOracle];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__HDObserverQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
    aBlock[3] = &unk_1E6302DC0;
    id v14 = v9;
    id v15 = v8;
    uint64_t v16 = self;
    id v10 = v8;
    id v11 = v9;
    uint64_t v6 = _Block_copy(aBlock);
  }

  return v6;
}

void __86__HDObserverQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void *)MEMORY[0x1C187C0E0]();
  [*(id *)(a1 + 32) addObject:v16];
  if (a7)
  {
    __int16 v19 = *(void **)(a1 + 40);
    long long v20 = [*(id *)(a1 + 32) allObjects];
    id v29 = 0;
    id v21 = [v19 filteredObjectsForReadAuthorization:v20 anchor:v17 error:&v29];
    id v22 = v29;

    if (v21)
    {
      id v23 = -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:](*(void *)(a1 + 48), v21);
      if ([v23 count])
      {
        __int16 v28 = *(void **)(a1 + 48);
        id v24 = v22;
        uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v14, 0);
        -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](v28, v25, 0);

        id v22 = v24;
      }
    }
    else
    {
      _HKInitializeLogging();
      __int16 v26 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v27;
        __int16 v32 = 2114;
        id v33 = v22;
        _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter series for authorization: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v7, 0);
}

- (id)objectTypes
{
  return (id)[(NSArray *)self->_queryDescriptors hk_mapToSet:&__block_literal_global_125];
}

uint64_t __36__HDObserverQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
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

void __67__HDObserverQueryServer__deliverDataWasUpdatedForTypes_withAnchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  id v3 = [v2 database];
  int v4 = [v3 isProtectedDataAvailable];

  if (v4)
  {
    if (*(void *)(a1 + 40)) {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F2B3D8]) initWithDataAnchor:*(void *)(a1 + 40) associationAnchor:0];
    }
    else {
      uint64_t v12 = 0;
    }
    id v9 = [*(id *)(a1 + 32) clientProxy];
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v9, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v10, v12, v11);

    id v8 = (void *)v12;
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v5;
    id v8 = *(void **)(v6 + 224);
    *(void *)(v6 + 224) = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTypeToFilterMap, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_updatedSampleTypes, 0);
  objc_storeStrong((id *)&self->_subscriptionAnchor, 0);

  objc_storeStrong((id *)&self->_anchor, 0);
}

@end