@interface DRSConfigPersistedStore
- (BOOL)addConfigMetdata:(id)a3 errorOut:(id *)a4;
- (BOOL)applyWaitingConfigWithUUID:(id)a3 appliedDate:(id)a4 errorOut:(id *)a5;
- (BOOL)clearStoreWithErrorOut:(id *)a3;
- (BOOL)completeConfigWithUUID:(id)a3 completedDate:(id)a4 completionType:(unint64_t)a5 completionDescription:(id)a6 errorOut:(id *)a7;
- (BOOL)isReadOnly;
- (BOOL)updateCloudChannelConfig:(id)a3 errorOut:(id *)a4;
- (DRSConfigPersistedStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 cloudKitHelper:(id)a5 errorOut:(id *)a6;
- (DRSTaskingCloudKitHelper)cloudKitHelper;
- (NSManagedObjectContext)context;
- (NSPersistentContainer)container;
- (NSString)workingDirectory;
- (id)_ON_MOC_cloudChannelConfigMOs;
- (id)cloudChannelConfig;
- (id)configMetadataForUUID:(id)a3 errorOut:(id *)a4;
- (id)configMetadatasForPredicate:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6;
- (unint64_t)_countForFetchRequest:(id)a3 withPredicate:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6;
- (unint64_t)configCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5;
- (unint64_t)metadataCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5;
- (void)_ON_MOC_deleteCloudChannelConfigMOs:(id)a3;
@end

@implementation DRSConfigPersistedStore

- (id)configMetadataForUUID:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v7 = [(DRSConfigPersistedStore *)self context];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__DRSConfigPersistedStore_configMetadataForUUID_errorOut___block_invoke;
  v11[3] = &unk_263FC9AA0;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  [v7 performBlockAndWait:v11];

  if (a4) {
    *a4 = (id) v17[5];
  }
  id v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __58__DRSConfigPersistedStore_configMetadataForUUID_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) context];
  id v11 = 0;
  v4 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:v2 context:v3 errorOut:&v11];
  id v5 = v11;
  id v6 = v11;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  if (v4)
  {
    v7 = [DRSConfigMetadata alloc];
    uint64_t v8 = [(DRSConfigMetadata *)v7 _ON_CONTEXT_QUEUE_initWithConfigMetadataMO:v4];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)addConfigMetdata:(id)a3 errorOut:(id *)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(DRSConfigPersistedStore *)self isReadOnly])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v10 = [(DRSConfigPersistedStore *)self context];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__DRSConfigPersistedStore_addConfigMetdata_errorOut___block_invoke;
    v20[3] = &unk_263FC9AA0;
    id v11 = v6;
    id v21 = v11;
    uint64_t v22 = self;
    v23 = &v25;
    uint64_t v24 = &v31;
    [v10 performBlockAndWait:v20];

    if (a4) {
      *a4 = (id) v26[5];
    }
    if (!v26[5])
    {
      if (!*((unsigned char *)v32 + 24))
      {
        BOOL v9 = 1;
        goto LABEL_13;
      }
      if (a4)
      {
        id v12 = NSString;
        v13 = [v11 configUUID];
        v14 = [v12 stringWithFormat:@"Attempted to add already existing metadata with config UUID %@", v13];

        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08320];
        v38 = v14;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        *a4 = [v15 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v16];
      }
      v17 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v17))
      {
        uint64_t v18 = [v11 configUUID];
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataCollision", "Attempted to add already existing metadata with config UUID %@", buf, 0xCu);
      }
    }
    BOOL v9 = 0;
LABEL_13:

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
    goto LABEL_14;
  }
  v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v39 = *MEMORY[0x263F08320];
  v40[0] = @"Attempted write operation on read-only ConfigPersistedStore";
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
  *a4 = [v7 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v8];

  BOOL v9 = 0;
LABEL_14:

  return v9;
}

void __53__DRSConfigPersistedStore_addConfigMetdata_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _uuidPredicate];
  v3 = [*(id *)(a1 + 40) context];
  id v21 = 0;
  unint64_t v4 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_countForFilterPredicate:v2 context:v3 errorOut:&v21];
  id v5 = v21;
  id v6 = v21;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) context];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v9 + 40);
      v10 = objc_msgSend(v7, "_ON_CONTEXT_QUEUE_moRepresentationInContext:createIfMissing:errorOut:", v8, 1, &obj);
      objc_storeStrong((id *)(v9 + 40), obj);

      if (v10)
      {
        id v11 = [*(id *)(a1 + 40) context];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        id v19 = *(id *)(v12 + 40);
        char v13 = [v11 save:&v19];
        objc_storeStrong((id *)(v12 + 40), v19);

        if (v13)
        {
          v14 = DPLogHandle_ConfigPersistedStore();
          if (os_signpost_enabled(v14))
          {
            v15 = [*(id *)(a1 + 32) configUUID];
            [*(id *)(a1 + 32) state];
            uint64_t v16 = DRConfigStringForState();
            *(_DWORD *)buf = 138543618;
            v23 = v15;
            __int16 v24 = 2114;
            uint64_t v25 = v16;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataSaveSuccess", "Saved %{public}@ with state %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v14 = DPLogHandle_ConfigPersistedStoreError();
          if (os_signpost_enabled(v14))
          {
            v17 = [*(id *)(a1 + 32) configUUID];
            uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            *(_DWORD *)buf = 138543618;
            v23 = v17;
            __int16 v24 = 2114;
            uint64_t v25 = v18;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataSaveFailed", "Could not save %{public}@ due to error %{public}@", buf, 0x16u);
          }
        }
      }
    }
  }
}

- (BOOL)applyWaitingConfigWithUUID:(id)a3 appliedDate:(id)a4 errorOut:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(DRSConfigPersistedStore *)self isReadOnly])
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = @"Attempted write operation on read-only ConfigPersistedStore";
    id v11 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    *a5 = [v10 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__7;
    v28 = __Block_byref_object_dispose__7;
    id v29 = 0;
    char v13 = [(DRSConfigPersistedStore *)self context];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__DRSConfigPersistedStore_applyWaitingConfigWithUUID_appliedDate_errorOut___block_invoke;
    v19[3] = &unk_263FCA460;
    id v14 = v8;
    id v20 = v14;
    id v21 = self;
    v23 = &v24;
    id v22 = v9;
    [v13 performBlockAndWait:v19];

    uint64_t v15 = v25[5];
    BOOL v12 = v15 == 0;
    if (v15)
    {
      uint64_t v16 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v16))
      {
        uint64_t v17 = v25[5];
        *(_DWORD *)buf = 138543618;
        id v31 = v14;
        __int16 v32 = 2114;
        uint64_t v33 = v17;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ApplyWaitingConfigFailed", "Could not apply waiting config %{public}@ due to error %{public}@", buf, 0x16u);
      }

      *a5 = (id) v25[5];
    }

    _Block_object_dispose(&v24, 8);
  }

  return v12;
}

void __75__DRSConfigPersistedStore_applyWaitingConfigWithUUID_appliedDate_errorOut___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) context];
  id v31 = 0;
  unint64_t v4 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:v2 context:v3 errorOut:&v31];
  id v5 = v31;
  id v6 = v31;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (v4)
    {
      if ([v4 state] == 1)
      {
        uint64_t v7 = [v4 completionType];
        id v8 = [v4 receivedDate];
        uint64_t v9 = *(void *)(a1 + 48);
        v10 = [v4 completedDate];
        id v11 = [v4 completionDescription];
        BOOL v12 = +[DRSConfigMetadata _isValidState:2 completionType:v7 receivedDate:v8 appliedDate:v9 completedDate:v10 completionDescription:v11];

        if (v12)
        {
          [v4 setState:2];
          [v4 setAppliedDate:*(void *)(a1 + 48)];
          char v13 = [*(id *)(a1 + 40) context];
          uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
          id v30 = *(id *)(v14 + 40);
          [v13 save:&v30];
          id v15 = v30;
          uint64_t v16 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v15;
LABEL_10:

          goto LABEL_11;
        }
        uint64_t v25 = NSString;
        uint64_t v26 = [*(id *)(a1 + 32) UUIDString];
        char v13 = [v25 stringWithFormat:@"Failed to apply config %@", v26];

        id v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08320];
        uint64_t v33 = v13;
        id v20 = NSDictionary;
        id v21 = &v33;
        id v22 = &v32;
      }
      else
      {
        v23 = NSString;
        uint64_t v24 = [*(id *)(a1 + 32) UUIDString];
        char v13 = [v23 stringWithFormat:@"Attempted to apply non-waiting config %@", v24];

        id v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = *MEMORY[0x263F08320];
        v35 = v13;
        id v20 = NSDictionary;
        id v21 = &v35;
        id v22 = &v34;
      }
    }
    else
    {
      uint64_t v17 = NSString;
      uint64_t v18 = [*(id *)(a1 + 32) UUIDString];
      char v13 = [v17 stringWithFormat:@"Attempting to update missing config %@", v18];

      id v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08320];
      v37[0] = v13;
      id v20 = NSDictionary;
      id v21 = (void **)v37;
      id v22 = &v36;
    }
    uint64_t v16 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    uint64_t v27 = [v19 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v16];
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)completeConfigWithUUID:(id)a3 completedDate:(id)a4 completionType:(unint64_t)a5 completionDescription:(id)a6 errorOut:(id *)a7
{
  v47[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ([(DRSConfigPersistedStore *)self isReadOnly])
  {
    if (a7)
    {
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v47[0] = @"Attempted write operation on read-only ConfigPersistedStore";
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a7 = [v15 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v16];
    }
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = __Block_byref_object_copy__7;
    v38 = __Block_byref_object_dispose__7;
    id v39 = 0;
    uint64_t v18 = [(DRSConfigPersistedStore *)self context];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke;
    v27[3] = &unk_263FCA4B0;
    id v19 = v12;
    id v28 = v19;
    id v29 = self;
    uint64_t v32 = &v34;
    id v30 = v13;
    unint64_t v33 = a5;
    id v20 = v14;
    id v31 = v20;
    [v18 performBlockAndWait:v27];

    uint64_t v21 = v35[5];
    BOOL v17 = v21 == 0;
    if (v21)
    {
      id v22 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v22))
      {
        v23 = (void *)v35[5];
        *(_DWORD *)buf = 138543618;
        id v41 = v19;
        __int16 v42 = 2114;
        v43 = v23;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CompleteConfigFailed", "Could not complete active config %{public}@ due to error %{public}@", buf, 0x16u);
      }

      if (a7) {
        *a7 = (id) v35[5];
      }
    }
    else
    {
      uint64_t v24 = DPLogHandle_ConfigPersistedStore();
      if (os_signpost_enabled(v24))
      {
        uint64_t v25 = DRConfigCompletionTypeString(a5);
        *(_DWORD *)buf = 138543874;
        id v41 = v19;
        __int16 v42 = 2114;
        v43 = v25;
        __int16 v44 = 2114;
        id v45 = v20;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CompleteConfigSuceeded", "Completed config with UUID %{public}@ with type %{public}@, description %{public}@", buf, 0x20u);
      }
    }

    _Block_object_dispose(&v34, 8);
  }

  return v17;
}

void __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke(uint64_t a1)
{
  v68[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) context];
  id v60 = 0;
  unint64_t v4 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:v2 context:v3 errorOut:&v60];
  id v5 = v60;
  id v6 = v60;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (v4)
    {
      if ([v4 state] != 3)
      {
        if ([v4 state] == 2)
        {
          id v20 = [v4 appliedDate];
        }
        else
        {
          id v20 = *(id *)(a1 + 48);
        }
        uint64_t v9 = v20;
        uint64_t v21 = *(void *)(a1 + 72);
        id v22 = [v4 receivedDate];
        BOOL v23 = +[DRSConfigMetadata _isValidState:3 completionType:v21 receivedDate:v22 appliedDate:v9 completedDate:*(void *)(a1 + 48) completionDescription:*(void *)(a1 + 56)];

        if (v23)
        {
          [v4 setState:3];
          [v4 setAppliedDate:v9];
          [v4 setCompletionType:*(void *)(a1 + 72)];
          [v4 setCompletedDate:*(void *)(a1 + 48)];
          [v4 setCompletionDescription:*(void *)(a1 + 56)];
          [*(id *)(a1 + 48) timeIntervalSinceDate:v9];
          double v25 = v24;
          if ([v4 logTelemetry])
          {
            v61[0] = kUUIDKey;
            v54 = [v4 configUUID];
            v52 = [v54 UUIDString];
            v62[0] = v52;
            v61[1] = kTeamIDKey;
            uint64_t v26 = [v4 teamID];
            v62[1] = v26;
            v61[2] = kConfigCompletedEventKey_CompletionType;
            uint64_t v27 = DRConfigCompletionTypeString(*(void *)(a1 + 72));
            v62[2] = v27;
            v61[3] = kConfigCompletedEventKey_ActiveDuration;
            id v28 = [NSNumber numberWithDouble:v25];
            v62[3] = v28;
            v61[4] = kConfigCompletedEventKey_ReceivedToCompletedDuration;
            id v29 = NSNumber;
            id v30 = *(void **)(a1 + 48);
            id v31 = [v4 receivedDate];
            [v30 timeIntervalSinceDate:v31];
            uint64_t v32 = objc_msgSend(v29, "numberWithDouble:");
            v62[4] = v32;
            unint64_t v33 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:5];

            DRSCoreAnalyticsSendEvent(kConfigCompletedEventName, v33);
            if ([v4 reportToDecisionServer])
            {
              uint64_t v34 = [v4 configUUID];
              v51 = [*(id *)(a1 + 40) cloudKitHelper];
              v53 = [v4 teamID];
              v55 = [v4 configUUID];
              v35 = [v55 UUIDString];
              uint64_t v36 = DRConfigCompletionTypeString(*(void *)(a1 + 72));
              uint64_t v37 = [v4 completionDescription];
              v38 = (void *)os_transaction_create();
              v57[0] = MEMORY[0x263EF8330];
              v57[1] = 3221225472;
              v57[2] = __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke_2;
              v57[3] = &unk_263FCA488;
              uint64_t v39 = *(void *)(a1 + 64);
              id v58 = v34;
              uint64_t v59 = v39;
              id v50 = v34;
              [v51 reportTaskingConfigCompletion:v53 uuidString:v35 completionType:v36 completionDescription:v37 activeDuration:v38 transaction:v57 completionHandler:v25];
            }
          }
          v40 = [*(id *)(a1 + 40) context];
          id v41 = [v4 configMO];
          [v40 deleteObject:v41];

          uint64_t v16 = [*(id *)(a1 + 40) context];
          uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
          id v56 = *(id *)(v42 + 40);
          [v16 save:&v56];
          id v43 = v56;
          id v19 = *(void **)(v42 + 40);
          *(void *)(v42 + 40) = v43;
        }
        else
        {
          __int16 v44 = NSString;
          id v45 = [*(id *)(a1 + 32) UUIDString];
          uint64_t v16 = [v44 stringWithFormat:@"Failed to complete config %@", v45];

          uint64_t v46 = (void *)MEMORY[0x263F087E8];
          uint64_t v63 = *MEMORY[0x263F08320];
          v64 = v16;
          id v19 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          uint64_t v47 = [v46 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v19];
          uint64_t v48 = *(void *)(*(void *)(a1 + 64) + 8);
          v49 = *(void **)(v48 + 40);
          *(void *)(v48 + 40) = v47;
        }
        goto LABEL_7;
      }
      uint64_t v7 = NSString;
      id v8 = [*(id *)(a1 + 32) UUIDString];
      uint64_t v9 = [v7 stringWithFormat:@"Attempted to complete already-completed config %@", v8];

      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v65 = *MEMORY[0x263F08320];
      v66 = v9;
      id v11 = NSDictionary;
      id v12 = &v66;
      id v13 = &v65;
    }
    else
    {
      id v14 = NSString;
      id v15 = [*(id *)(a1 + 32) UUIDString];
      uint64_t v9 = [v14 stringWithFormat:@"Attempting to update missing config %@", v15];

      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v67 = *MEMORY[0x263F08320];
      v68[0] = v9;
      id v11 = NSDictionary;
      id v12 = (void **)v68;
      id v13 = &v67;
    }
    uint64_t v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    uint64_t v17 = [v10 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
LABEL_7:
  }
}

void __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = DPLogHandle_ConfigPersistedStoreError();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigPersistedStoreConfigCompletionTelemetryError", "Telemetry reporting for %{public}@ failed %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)configMetadatasForPredicate:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [MEMORY[0x263EFF980] array];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__7;
  id v31 = __Block_byref_object_dispose__7;
  id v32 = 0;
  id v13 = [(DRSConfigPersistedStore *)self context];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__DRSConfigPersistedStore_configMetadatasForPredicate_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v20[3] = &unk_263FCA4D8;
  id v14 = v10;
  id v21 = v14;
  id v22 = self;
  id v15 = v11;
  double v25 = &v27;
  unint64_t v26 = a5;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  [v13 performBlockAndWait:v20];

  if (a6) {
    *a6 = (id) v28[5];
  }
  uint64_t v17 = v24;
  id v18 = v16;

  _Block_object_dispose(&v27, 8);

  return v18;
}

void __91__DRSConfigPersistedStore_configMetadatasForPredicate_sortDescriptors_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) context];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v31 = 0;
  uint64_t v6 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:v2 context:v3 sortDescriptors:v4 fetchLimit:v5 errorOut:&v31];
  id v7 = v31;

  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = v7;
    id v10 = *(id *)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v26 = v6;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v16 = [DRSConfigMetadata alloc];
          uint64_t v17 = [(DRSConfigMetadata *)v16 _ON_CONTEXT_QUEUE_initWithConfigMetadataMO:v15];

          if (!v17)
          {
            id v18 = NSString;
            id v19 = [v15 configUUID];
            id v20 = [v18 stringWithFormat:@"Failed to create ConfigMetadata from backing MO for %@", v19];

            id v21 = (void *)MEMORY[0x263F087E8];
            uint64_t v32 = *MEMORY[0x263F08320];
            unint64_t v33 = v20;
            id v22 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            uint64_t v23 = [v21 errorWithDomain:@"DRSConfigPersistenceError" code:0 userInfo:v22];
            uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
            double v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            goto LABEL_13;
          }
          [*(id *)(a1 + 56) addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_13:
      uint64_t v6 = v26;
    }
  }
}

- (DRSConfigPersistedStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 cloudKitHelper:(id)a5 errorOut:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = DRSTaskingPersistentContainer(v11, v8, a6);
  id v14 = v13;
  if (v13)
  {
    id v15 = (void *)[v13 newBackgroundContext];
    v20.receiver = self;
    v20.super_class = (Class)DRSConfigPersistedStore;
    id v16 = [(DRSConfigPersistedStore *)&v20 init];
    uint64_t v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_workingDirectory, a3);
      v17->_isReadOnly = v8;
      objc_storeStrong((id *)&v17->_container, v14);
      objc_storeStrong((id *)&v17->_context, v15);
      objc_storeStrong((id *)&v17->_cloudKitHelper, a5);
    }
    self = v17;

    id v18 = self;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (unint64_t)_countForFetchRequest:(id)a3 withPredicate:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  [v10 setPredicate:v11];
  if (a5) {
    [v10 setFetchLimit:a5];
  }
  id v12 = [(DRSConfigPersistedStore *)self context];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__DRSConfigPersistedStore__countForFetchRequest_withPredicate_fetchLimit_errorOut___block_invoke;
  v16[3] = &unk_263FC9750;
  id v18 = &v26;
  v16[4] = self;
  id v13 = v10;
  id v17 = v13;
  id v19 = &v20;
  [v12 performBlockAndWait:v16];

  if (a6) {
    *a6 = (id) v21[5];
  }
  if (v21[5]) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = v27[3];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __83__DRSConfigPersistedStore__countForFetchRequest_withPredicate_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&v8];
  id v5 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)metadataCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5
{
  id v8 = a3;
  id v9 = +[DRSConfigMetadataMO fetchRequest];
  unint64_t v10 = [(DRSConfigPersistedStore *)self _countForFetchRequest:v9 withPredicate:v8 fetchLimit:a4 errorOut:a5];

  return v10;
}

- (unint64_t)configCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5
{
  id v8 = a3;
  id v9 = +[DRConfigMO fetchRequest];
  unint64_t v10 = [(DRSConfigPersistedStore *)self _countForFetchRequest:v9 withPredicate:v8 fetchLimit:a4 errorOut:a5];

  return v10;
}

- (BOOL)clearStoreWithErrorOut:(id *)a3
{
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  id v13 = __Block_byref_object_dispose__7;
  id v14 = 0;
  id v5 = [(DRSConfigPersistedStore *)self context];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__DRSConfigPersistedStore_clearStoreWithErrorOut___block_invoke;
  v8[3] = &unk_263FCA2B8;
  v8[4] = self;
  v8[5] = &v9;
  [v5 performBlockAndWait:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__DRSConfigPersistedStore_clearStoreWithErrorOut___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[DRSConfigMetadataMO fetchRequest];
  uint64_t v3 = [*(id *)(a1 + 32) context];
  id v50 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v50];
  id v5 = v50;
  id v6 = v50;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    id v7 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v7))
    {
      uint64_t v8 = [v6 localizedDescription];
      uint64_t v9 = (void *)v8;
      unint64_t v10 = @"Unknown";
      if (v8) {
        unint64_t v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v52 = (uint64_t)v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to fetch config metadatas due to error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = [v4 count];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v47;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8 * v16);
          id v18 = [*(id *)(a1 + 32) context];
          [v18 deleteObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v14);
    }

    uint64_t v2 = +[DRConfigMO fetchRequest];
    id v19 = [*(id *)(a1 + 32) context];
    id v45 = 0;
    uint64_t v20 = [v19 executeFetchRequest:v2 error:&v45];
    id v21 = v45;
    id v6 = v45;

    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v21);
      uint64_t v22 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v22))
      {
        uint64_t v23 = [v6 localizedDescription];
        uint64_t v24 = (void *)v23;
        id v25 = @"Unknown";
        if (v23) {
          id v25 = (__CFString *)v23;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v52 = (uint64_t)v25;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to fetch configs due to error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v39 = [v20 count];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v26 = v20;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v42;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * v30);
            uint64_t v32 = objc_msgSend(*(id *)(a1 + 32), "context", v39);
            [v32 deleteObject:v31];

            ++v30;
          }
          while (v28 != v30);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v28);
      }

      unint64_t v33 = [*(id *)(a1 + 32) context];
      id v40 = 0;
      char v34 = [v33 save:&v40];
      id v35 = v40;
      id v6 = v40;

      if (v34)
      {
        uint64_t v2 = DPLogHandle_ConfigPersistedStore();
        if (os_signpost_enabled(v2))
        {
          *(_DWORD *)buf = 134349312;
          uint64_t v52 = v11;
          __int16 v53 = 2050;
          uint64_t v54 = v39;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreSuccess", "Deleted %{public}llu config metadatas and %{public}llu configs", buf, 0x16u);
        }
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v35);
        uint64_t v2 = DPLogHandle_ConfigPersistedStoreError();
        if (os_signpost_enabled(v2))
        {
          uint64_t v36 = [v6 localizedDescription];
          uint64_t v37 = (void *)v36;
          v38 = @"Unknown";
          if (v36) {
            v38 = (__CFString *)v36;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v52 = (uint64_t)v38;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to save deletion of records due to error: %{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)_ON_MOC_cloudChannelConfigMOs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[DRSCloudChannelConfigMO fetchRequest];
  uint64_t v4 = [(DRSConfigPersistedStore *)self context];
  id v13 = 0;
  id v5 = [v4 executeFetchRequest:v3 error:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = DPLogHandle_ConfigPersistedStoreError();
    if (os_signpost_enabled(v7))
    {
      uint64_t v8 = [v6 localizedDescription];
      uint64_t v9 = (void *)v8;
      unint64_t v10 = @"Unknown";
      if (v8) {
        unint64_t v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigError", "Failed to fetch cloud channel config due to error: %{public}@", buf, 0xCu);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (void)_ON_MOC_deleteCloudChannelConfigMOs:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
          id v11 = [(DRSConfigPersistedStore *)self context];
          [v11 deleteObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }
    id v12 = [(DRSConfigPersistedStore *)self context];
    id v19 = 0;
    char v13 = [v12 save:&v19];
    id v14 = v19;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v15))
      {
        uint64_t v16 = [v14 localizedDescription];
        uint64_t v17 = (void *)v16;
        id v18 = @"Unknown";
        if (v16) {
          id v18 = (__CFString *)v16;
        }
        *(_DWORD *)buf = 138543362;
        id v25 = v18;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigDeleteFailed", "Failed to save deletion of cloud channel configs due to error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (id)cloudChannelConfig
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  uint64_t v3 = [(DRSConfigPersistedStore *)self context];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__DRSConfigPersistedStore_cloudChannelConfig__block_invoke;
  v6[3] = &unk_263FCA2B8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__DRSConfigPersistedStore_cloudChannelConfig__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_cloudChannelConfigMOs");
  if ([v2 count])
  {
    if ((unint64_t)[v2 count] < 2)
    {
      id v5 = [DRSCloudChannelConfig alloc];
      uint64_t v6 = [v2 firstObject];
      uint64_t v7 = [(DRSCloudChannelConfig *)v5 initWithMO:v6];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      uint64_t v3 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MultipleConfigs", "Multiple configs specified. Reverting to default", v10, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v2);
    }
  }
  else
  {
    id v4 = DPLogHandle_ConfigPersistedStore();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DefaultConfig", "Not subscribing to any channel by default.", buf, 2u);
    }
  }
}

- (BOOL)updateCloudChannelConfig:(id)a3 errorOut:(id *)a4
{
  unint64_t v6 = (unint64_t)a3;
  *a4 = 0;
  uint64_t v7 = [(DRSConfigPersistedStore *)self cloudChannelConfig];
  uint64_t v8 = (void *)v7;
  if (!(v6 | v7) || v7 && ([(id)v7 isEqual:v6] & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__7;
    long long v20 = __Block_byref_object_dispose__7;
    id v21 = 0;
    uint64_t v10 = [(DRSConfigPersistedStore *)self context];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__DRSConfigPersistedStore_updateCloudChannelConfig_errorOut___block_invoke;
    v12[3] = &unk_263FC9AA0;
    v12[4] = self;
    id v13 = (id)v6;
    id v14 = &v22;
    uint64_t v15 = &v16;
    [v10 performBlockAndWait:v12];

    *a4 = (id) v17[5];
    BOOL v9 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

void __61__DRSConfigPersistedStore_updateCloudChannelConfig_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_cloudChannelConfigMOs");
  uint64_t v3 = v2;
  if (*(void *)(a1 + 40))
  {
    if ((unint64_t)[v2 count] >= 2)
    {
      id v4 = DPLogHandle_ConfigPersistedStoreError();
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MultipleConfigsWhenUpdating", "Multiple configs specified. Deleting all", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v3);
      uint64_t v3 = (void *)MEMORY[0x263EFFA68];
    }
    if ([v3 count])
    {
      id v5 = [v3 firstObject];
    }
    else
    {
      unint64_t v6 = [DRSCloudChannelConfigMO alloc];
      uint64_t v7 = [*(id *)(a1 + 32) context];
      id v5 = [(DRSCloudChannelConfigMO *)v6 initWithContext:v7];
    }
    -[DRSCloudChannelConfigMO setEnvironment:](v5, "setEnvironment:", [*(id *)(a1 + 40) environment]);
    -[DRSCloudChannelConfigMO setChannelType:](v5, "setChannelType:", [*(id *)(a1 + 40) type]);
    -[DRSCloudChannelConfigMO setPlatform:](v5, "setPlatform:", [*(id *)(a1 + 40) platform]);
    uint64_t v8 = [*(id *)(a1 + 40) populationSliceNumber];
    [(DRSCloudChannelConfigMO *)v5 setPopulationSliceNumber:v8];

    -[DRSCloudChannelConfigMO setOverridesDeviceDefault:](v5, "setOverridesDeviceDefault:", [*(id *)(a1 + 40) overridesDeviceDefault]);
    BOOL v9 = [*(id *)(a1 + 32) context];
    id v19 = 0;
    char v10 = [v9 save:&v19];
    id v11 = v19;
    id v12 = v19;

    id v13 = DPLogHandle_ConfigPersistedStoreError();
    BOOL v14 = os_signpost_enabled(v13);
    if (v10)
    {
      if (v14)
      {
        uint64_t v15 = [*(id *)(a1 + 40) debugDescription];
        *(_DWORD *)buf = 138543362;
        id v21 = v15;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfigUpdated", "Updated persisted config to:\n%{public}@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (v14)
      {
        uint64_t v16 = [v12 localizedDescription];
        uint64_t v17 = (void *)v16;
        uint64_t v18 = @"Unknown";
        if (v16) {
          uint64_t v18 = (__CFString *)v16;
        }
        *(_DWORD *)buf = 138543362;
        id v21 = v18;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfigUpdateFailed", "Failed to save cloud channel config due to error: %{public}@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);

  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end