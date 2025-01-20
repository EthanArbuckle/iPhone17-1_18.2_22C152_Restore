@interface HDSourceQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_shouldListenForUpdates;
- (HDSourceQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
@end

@implementation HDSourceQueryServer

- (HDSourceQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSourceQueryServer;
  v11 = [(HDQueryServer *)&v13 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11) {
    v11->_deliversUpdates = [v10 shouldDeactivateAfterInitialResults];
  }

  return v11;
}

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)HDSourceQueryServer;
  [(HDQueryServer *)&v50 _queue_start];
  if (self)
  {
    v3 = [(HDQueryServer *)self clientProxy];
  }
  else
  {
    v3 = 0;
  }
  v4 = [(HDQueryServer *)self sampleType];
  v5 = [(HDQueryServer *)self filter];
  v49 = 0;
  id v6 = v4;
  id v7 = v5;
  if (self)
  {
    v8 = [(HDQueryServer *)self profile];
    v9 = [v8 sourceManager];

    id v10 = [(HDQueryServer *)self profile];
    v11 = [v7 predicateWithProfile:v10];

    v12 = [(HDQueryServer *)self readAuthorizationStatusForType:v6 error:&v49];
    objc_super v13 = v12;
    if (!v12)
    {
      v30 = 0;
LABEL_44:

      goto LABEL_45;
    }
    if (![v12 canRead])
    {
      if ([(HDQueryServer *)self _shouldStopProcessingQuery])
      {
        id v17 = 0;
        v18 = 0;
        v30 = 0;
        goto LABEL_43;
      }
      goto LABEL_40;
    }
    v48 = v13;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v15 = objc_msgSend((id)objc_msgSend(v6, "dataObjectClass"), "hd_dataEntityClass");
    v16 = [(HDQueryServer *)self profile];
    id v58 = 0;
    id v17 = [v15 sourceIDsForSamplesWithType:v6 profile:v16 predicate:v11 error:&v58];
    v18 = (NSMutableSet *)v58;

    if (!v17)
    {

      v30 = 0;
      objc_super v13 = v48;
      goto LABEL_43;
    }
    v47 = v18;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke;
    aBlock[3] = &unk_1E62F6B88;
    id v56 = v9;
    id obj = v14;
    id v45 = v14;
    id v57 = v45;
    v19 = (void (**)(void *, void))_Block_copy(aBlock);
    objc_super v13 = v48;
    v20 = [v48 restrictedSourceEntities];

    v46 = v17;
    if (v20)
    {
      v43 = v11;
      id v44 = v7;
      v41 = v3;
      v21 = [v48 restrictedSourceEntities];
      objc_msgSend(v21, "hk_map:", &__block_literal_global_35);
      v22 = v17;
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v52 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            if ([v23 containsObject:v29]) {
              v19[2](v19, v29);
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v26);
      }

      v3 = v41;
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v23 = v17;
      uint64_t v31 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (!v31) {
        goto LABEL_19;
      }
      uint64_t v32 = v31;
      v43 = v11;
      id v44 = v7;
      uint64_t v33 = *(void *)v52;
LABEL_30:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v23);
        }
        uint64_t v35 = *(void *)(*((void *)&v51 + 1) + 8 * v34);
        if ([(HDQueryServer *)self _shouldStopProcessingQuery]) {
          break;
        }
        v19[2](v19, v35);
        if (v32 == ++v34)
        {
          uint64_t v32 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v32) {
            goto LABEL_30;
          }
          break;
        }
      }
    }
    v11 = v43;
    id v7 = v44;
    objc_super v13 = v48;
LABEL_19:

    id v17 = v45;
    v18 = v47;
    if ([(HDQueryServer *)self _shouldStopProcessingQuery])
    {
      v30 = 0;
LABEL_43:

      goto LABEL_44;
    }
    if (v17)
    {
      objc_storeStrong((id *)&self->_sources, obj);
      if (!v47)
      {
        v18 = 0;
LABEL_42:
        v30 = self->_sources;
        goto LABEL_43;
      }
      goto LABEL_39;
    }
    if (v47)
    {
      v36 = v47;
LABEL_39:
      sources = v47;
      v49 = sources;
      v18 = sources;
LABEL_41:

      goto LABEL_42;
    }
LABEL_40:
    v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v18 = 0;
    id v17 = 0;
    sources = self->_sources;
    self->_sources = v38;
    goto LABEL_41;
  }
  v30 = 0;
LABEL_45:

  v39 = v49;
  v40 = [(HDQueryServer *)self queryUUID];
  if (v39) {
    objc_msgSend(v3, "client_deliverError:forQuery:", v39, v40);
  }
  else {
    objc_msgSend(v3, "client_deliverSources:forQuery:", v30, v40);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  if (![(HDQueryServer *)self _shouldStopProcessingQuery])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__HDSourceQueryServer_samplesAdded_anchor___block_invoke;
    v6[3] = &unk_1E62F31C0;
    id v7 = v5;
    v8 = self;
    [(HDQueryServer *)self onQueue:v6];
  }
}

void __43__HDSourceQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    v3 = [v2 _source];

    if (!v3 || ([*(id *)(*(void *)(a1 + 40) + 208) containsObject:v3] & 1) != 0) {
      goto LABEL_32;
    }
    v4 = *(void **)(a1 + 40);
    id v5 = [v4 sampleType];
    id v33 = 0;
    id v6 = [v4 readAuthorizationStatusForType:v5 error:&v33];
    id v7 = v33;

    if (!v6)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; ignoring added samples: %{public}@",
          buf,
          0xCu);
      }
      goto LABEL_31;
    }
    if (![v6 canRead])
    {
LABEL_31:

LABEL_32:
      return;
    }
    v8 = [v6 restrictedSourceEntities];

    if (v8)
    {
      v9 = [v6 restrictedSourceEntities];
      id v10 = [v9 anyObject];

      if (!v10) {
        goto LABEL_30;
      }
      v11 = [*(id *)(a1 + 40) profile];
      v12 = [v11 sourceManager];
      id v32 = 0;
      objc_super v13 = [v12 clientSourceForSourceEntity:v10 error:&v32];
      id v14 = v32;

      if (!v13)
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve client source: %{public}@:", buf, 0xCu);
        }
      }
      char v16 = [v13 isEqual:v3];

      if ((v16 & 1) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }
    }
    id v10 = [*(id *)(a1 + 40) filter];
    if (v10)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            if ([v10 acceptsDataObject:*(void *)(*((void *)&v28 + 1) + 8 * i)])
            {

              goto LABEL_26;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_26:
      id v23 = *(id **)(a1 + 40);
      id v17 = v3;
      if (v23)
      {
        if (([v23 _shouldStopProcessingQuery] & 1) == 0)
        {
          [v23[26] addObject:v17];
          id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v17, 0);
          uint64_t v25 = [v23 clientProxy];
          id v26 = v23[26];
          uint64_t v27 = [v23 queryUUID];
          objc_msgSend(v25, "client_deliverUpdatedSources:added:forQuery:", v26, v24, v27);
        }
      }
    }

    goto LABEL_30;
  }
}

void __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) clientSourceForPersistentID:a2 error:0];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    v3 = v4;
  }
}

uint64_t __61__HDSourceQueryServer__sourcesForObjectsOfType_filter_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 persistentID];

  return [v2 numberWithLongLong:v3];
}

- (void).cxx_destruct
{
}

@end