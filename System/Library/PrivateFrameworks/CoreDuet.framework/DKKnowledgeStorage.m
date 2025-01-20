@interface DKKnowledgeStorage
@end

@implementation DKKnowledgeStorage

BOOL __40___DKKnowledgeStorage_removeBadObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 UUID];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didInsertLocalEventsWithStreamNameCounts:*(void *)(a1 + 48)];
}

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didInsertEventsWithStreamNameCounts:*(void *)(a1 + 48)];
}

void __43___DKKnowledgeStorage__executeQuery_error___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = [_CDMemoryUsageInterval alloc];
  uint64_t v3 = [*(id *)(a1 + 32) clientName];
  BOOL v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"unknown";
  }
  v6 = [(_CDMemoryUsageInterval *)v2 initWithName:@"executeQuery" client:v5];

  [(_CDMemoryUsageInterval *)v6 begin];
  int v7 = _DKQueryLoggingEnabled();
  v8 = +[_CDLogging knowledgeChannel];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_14;
    }
    v10 = [*(id *)(a1 + 32) clientName];
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v10;
    __int16 v40 = 2112;
    *(void *)v41 = v11;
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "[Storage] Starting executeQuery for '%{public}@' with query %@.", buf, 0x16u);
  }
  else
  {
    if (!v9) {
      goto LABEL_14;
    }
    v10 = [*(id *)(a1 + 32) clientName];
    uint64_t v12 = objc_opt_class();
    char v13 = objc_opt_respondsToSelector();
    if (v13)
    {
      v14 = [*(id *)(a1 + 32) explicitEventStreamsOrEventStreamsInPredicate];
    }
    else
    {
      v14 = @"n/a";
    }
    *(_DWORD *)buf = 138543874;
    v39 = v10;
    __int16 v40 = 2114;
    *(void *)v41 = v12;
    *(_WORD *)&v41[8] = 2114;
    *(void *)&v41[10] = v14;
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "[Storage] Starting executeQuery for '%{public}@' with query type %{public}@ over streams %{public}@.", buf, 0x20u);
    if (v13) {
  }
    }
LABEL_14:

  __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 96);
  id v37 = 0;
  v18 = [v16 executeUsingCoreDataStorage:v17 error:&v37];
  id v19 = v37;
  id v20 = v37;
  uint64_t v21 = [*(id *)(a1 + 40) handleResults:v18 error:v20];
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);
  __uint64_t v24 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  if (*(void *)(a1 + 72)) {
    **(void **)(a1 + 72) = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  [(_CDMemoryUsageInterval *)v6 end];
  double v25 = (double)(v24 - v15) / 1000000000.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = +[_CDLogging knowledgeChannel];
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        v27 = [*(id *)(a1 + 32) clientName];
        BOOL v35 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
        uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138544130;
        v39 = v27;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v35;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v36;
        *(_WORD *)&v41[14] = 2048;
        *(double *)&v41[16] = v25;
        v32 = "[Storage] Completed executeQuery for '%{public}@' with success=%d. Error: %@. Elapsed: %.3fs.";
        v33 = v26;
        uint32_t v34 = 38;
        goto LABEL_21;
      }
    }
  }
  v26 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [*(id *)(a1 + 32) clientName];
    v28 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    BOOL v29 = v28 != 0;
    uint64_t v30 = [v28 count];
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    v39 = v27;
    __int16 v40 = 1024;
    *(_DWORD *)v41 = v29;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v30;
    *(_WORD *)&v41[14] = 2112;
    *(void *)&v41[16] = v31;
    __int16 v42 = 2048;
    double v43 = v25;
    v32 = "[Storage] Completed executeQuery for '%{public}@' with success=%d, count=%lu. Error: %@. Elapsed: %.3fs.";
    v33 = v26;
    uint32_t v34 = 48;
LABEL_21:
    _os_log_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
  }
LABEL_22:
}

void __42___DKKnowledgeStorage__saveObjects_error___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v45 = objc_alloc_init(_DKObjectMOConverter);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v48 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v2)
  {
    v41 = 0;
    int v44 = 0;
    uint64_t v47 = *(void *)v51;
    uint64_t v43 = *MEMORY[0x1E4F28568];
    uint64_t v40 = *MEMORY[0x1E4F28358];
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v51 != v47) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(id *)(*((void *)&v50 + 1) + 8 * i);
        v5 = [v4 stream];
        v6 = [v5 name];

        int v7 = _os_feature_enabled_impl();
        LODWORD(v5) = _os_feature_enabled_impl();
        BOOL v8 = +[_DKBiomeQuery canShimDuetStreamNamed:v6];
        if ((v8 & v5 & 1) == 0)
        {
          BOOL v9 = [(_DKObjectMOConverter *)v45 insertObject:v4 inManagedObjectContext:*(void *)(v48 + 40)];
          if (v9)
          {
            [*(id *)(v48 + 40) refreshObject:v9 mergeChanges:1];
          }
          else
          {
            v10 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v4;
              _os_log_fault_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_FAULT, "Unable to convert to MO for saving: %@", buf, 0xCu);
            }

            uint64_t v11 = [NSString stringWithFormat:@"Unable to convert _DKObject to MO for saving: %@", v4];
            uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v56 = v43;
            v57 = v11;
            char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
            uint64_t v14 = [v12 errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:v13];
            uint64_t v15 = *(void *)(*(void *)(v48 + 56) + 8);
            v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;

            *(unsigned char *)(*(void *)(*(void *)(v48 + 64) + 8) + 24) = 0;
            ++v44;
          }
        }
        if ((v8 & v7) != 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v4;
            v18 = [v17 creationDate];
            BOOL v19 = v18 == 0;

            if (v19)
            {
              id v20 = [MEMORY[0x1E4F1C9C8] date];
              [v17 setCreationDate:v20];
            }
            uint64_t v21 = [v17 localCreationDate];
            BOOL v22 = v21 == 0;

            if (v22)
            {
              v23 = [v17 creationDate];
              [v17 setLocalCreationDate:v23];
            }
            __uint64_t v24 = [v17 stream];
            double v25 = [v24 name];

            if (v25 && [v25 length])
            {
              v26 = +[_DKBiomeStreamCache sharedCache];
              v27 = [v26 objectForKey:v25];
              v28 = [v27 source];

              if (!v28)
              {
                BOOL v29 = (void *)[objc_alloc((Class)getBMDKEventStreamClass()) initWithDKStreamIdentifier:v25 contentProtection:v40];
                v28 = [v29 source];
                if (v29)
                {
                  [v26 setObject:v29 forKey:v25];
                }
                else
                {
                  uint64_t v30 = +[_CDLogging knowledgeChannel];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v59 = v25;
                    _os_log_error_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_ERROR, "nil BMDKEventStream for DK stream %@", buf, 0xCu);
                  }
                }
                if (AnalyticsIsEventUsed())
                {
                  uint64_t v31 = v41;
                  if (!v41)
                  {
                    uint64_t v32 = _CDCurrentOrXPCProcessName();
                    v33 = (void *)v32;
                    uint32_t v34 = @"unknown";
                    if (v32) {
                      uint32_t v34 = (__CFString *)v32;
                    }
                    __int16 v42 = v34;

                    uint64_t v31 = v42;
                  }
                  v54[0] = @"client";
                  v54[1] = @"stream";
                  v41 = v31;
                  v55[0] = v31;
                  v55[1] = v25;
                  BOOL v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
                  AnalyticsSendEvent();
                }
              }
              uint64_t v36 = (void *)[objc_alloc((Class)getBMDKEventClass()) initWithDKEvent:v17];
              if (objc_opt_respondsToSelector()) {
                [v28 sendEvent:v36 timestampNumber:0 notifyCompute:0];
              }
              else {
                [v28 sendEvent:v36];
              }
            }
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v2);
  }
  else
  {
    v41 = 0;
  }

  if ([*(id *)(v48 + 40) hasChanges])
  {
    id v37 = *(void **)(v48 + 40);
    uint64_t v38 = *(void *)(*(void *)(v48 + 56) + 8);
    id v49 = *(id *)(v38 + 40);
    char v39 = [v37 save:&v49];
    objc_storeStrong((id *)(v38 + 40), v49);
    *(unsigned char *)(*(void *)(*(void *)(v48 + 64) + 8) + 24) = v39;
  }
  _cdknowledge_signpost_save_end([*(id *)(*(void *)(*(void *)(v48 + 56) + 8) + 40) code]);
  [*(id *)(*(void *)(*(void *)(v48 + 56) + 8) + 40) code];
  kdebug_trace();
  if (*(unsigned char *)(*(void *)(*(void *)(v48 + 64) + 8) + 24)) {
    -[_DKKnowledgeStorage _sendInsertEventsNotificationWithObjects:](*(void *)(v48 + 48), *(void **)(v48 + 32));
  }
}

uint64_t __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v31 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v31];
  id v5 = v31;
  if ([v4 count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = *(void *)(a1[6] + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v26 = v5;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = objc_opt_new();
          v16 = [v14 cloudID];
          [v15 setZoneName:v16];

          id v17 = [v14 deviceID];
          [v15 setSourceDeviceID:v17];

          v18 = [v14 rapportID];
          [v15 setIdsDeviceIdentifier:v18];

          BOOL v19 = [v14 lastSeenDate];
          [v15 setLastSeenDate:v19];

          id v20 = [v14 model];
          [v15 setModel:v20];

          uint64_t v21 = [v14 uuid];
          [v15 setUuid:v21];

          BOOL v22 = [v14 version];
          [v15 setVersion:v22];

          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
      id v5 = v26;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v5)
  {
    v23 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2_cold_1();
    }

    uint64_t v24 = *(void *)(a1[7] + 8);
    id v25 = v5;
    id v9 = *(id *)(v24 + 40);
    *(void *)(v24 + 40) = v25;
    goto LABEL_14;
  }
LABEL_15:
}

void __62___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_error___block_invoke(void *a1)
{
  uint64_t v2 = (dispatch_queue_t *)a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = -[_DKKnowledgeStorage _deleteAllEventsMatchingPredicate:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

void __74___DKKnowledgeStorage__tombstoneObjectsMatchingPredicate_batchSize_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[_DKEventMO entity];
  uint64_t v4 = [v3 name];
  id v5 = [v2 fetchRequestWithEntityName:v4];

  [v5 setPredicate:*(void *)(a1 + 32)];
  [v5 setFetchOffset:*(void *)(a1 + 104)];
  [v5 setFetchLimit:*(void *)(a1 + 112)];
  [v5 setSortDescriptors:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 48) tombstonePolicy];
  uint64_t v7 = [v6 propertiesToFetchForTombstones];
  [v5 setPropertiesToFetch:v7];

  [v5 setResultType:2];
  [v5 setAllocationType:1];
  BOOL v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = [v8 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10 && [v10 count])
  {
    uint64_t v11 = *(void **)(a1 + 64);
    uint64_t v12 = [v10 valueForKey:@"objectID"];
    [v11 addObjectsFromArray:v12];

    char v13 = [*(id *)(a1 + 48) tombstonePolicy];
    uint64_t v14 = [v13 predicateForEventsRequiredToBeTombstoned];
    uint64_t v15 = [v10 filteredArrayUsingPredicate:v14];

    if ([v15 count])
    {
      v16 = [*(id *)(a1 + 48) tombstonePolicy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
      id v21 = *(id *)(v17 + 40);
      uint64_t v18 = [v16 tombstonesForPartialEvents:v10 resultingFromRequirementsWithIdentifiers:&v21];
      objc_storeStrong((id *)(v17 + 40), v21);
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v10 count];
}

void __42___DKKnowledgeStorage_executeQuery_error___block_invoke(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    dispatch_queue_set_specific(*(dispatch_queue_t *)(a1[4] + 88), (const void *)(a1[4] + 88), (void *)(a1[4] + 88), 0);
  }
  uint64_t v2 = (dispatch_queue_t *)a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = -[_DKKnowledgeStorage _executeQuery:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    dispatch_queue_set_specific(*(dispatch_queue_t *)(a1[4] + 88), (const void *)(a1[4] + 88), 0, 0);
  }
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"SyncPeer" inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) zoneName];
  [v2 setCloudID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) sourceDeviceID];
  [v2 setDeviceID:v4];

  uint64_t v5 = [*(id *)(a1 + 40) lastSeenDate];
  [v2 setLastSeenDate:v5];

  uint64_t v6 = [*(id *)(a1 + 40) model];
  [v2 setModel:v6];

  uint64_t v7 = [*(id *)(a1 + 40) idsDeviceIdentifier];
  [v2 setRapportID:v7];

  BOOL v8 = [*(id *)(a1 + 40) uuid];
  [v2 setUuid:v8];

  uint64_t v9 = [*(id *)(a1 + 40) version];
  [v2 setVersion:v9];

  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v16 = 0;
    [v10 save:&v16];
    id v11 = v16;
    if (v11)
    {
      uint64_t v12 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_1((id *)(a1 + 40));
      }

      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;
      id v15 = v11;
    }
  }
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  char v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v16);
  id v5 = v16;
  uint64_t v6 = (void *)a1[8];
  if (v6)
  {
    uint64_t v7 = a1[6];
    if (!v7) {
      uint64_t v7 = *(NSObject **)(a1[4] + 32);
    }
    BOOL v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_3;
    v12[3] = &unk_1E560F140;
    id v14 = v6;
    char v15 = v4;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2;
    v15[3] = &unk_1E560F168;
    char v4 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v5 = &v16;
    id v16 = v4;
    uint64_t v6 = &v19;
    id v19 = *(id *)(a1 + 72);
    uint64_t v7 = &v17;
    id v17 = *(id *)(a1 + 48);
    BOOL v8 = &v18;
    id v18 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v15);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4;
    v10[3] = &unk_1E560F168;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v5 = &v11;
    id v11 = v9;
    uint64_t v6 = &v14;
    id v14 = *(id *)(a1 + 72);
    uint64_t v7 = &v12;
    id v12 = *(id *)(a1 + 48);
    BOOL v8 = &v13;
    id v13 = *(id *)(a1 + 56);
    __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4(v10);
  }
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740(uint64_t a1)
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v118 = a1;
  id v151 = 0;
  id v5 = [v3 executeRequest:v4 error:&v151];
  id v6 = v151;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v13 = fetchSyncChangesSinceDate_error__executeRequestTimerCounter;
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v13, (uint64_t)v2, (void *)v14);

    v116 = [MEMORY[0x1E4F1C9C8] date];
    v117 = [v5 performSelector:sel_result];
    LOBYTE(v14) = [v117 conformsToProtocol:&unk_1EDE494D0];
    char v15 = +[_CDLogging syncChannel];
    id v16 = v15;
    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_5();
      }

      uint64_t v44 = +[_DKSyncErrors failedToFetchChanges];
      id v8 = 0;
      uint64_t v45 = *(void *)(*(void *)(v118 + 72) + 8);
      char v39 = *(void **)(v45 + 40);
      *(void *)(v45 + 40) = v44;
      id v12 = v116;
      goto LABEL_101;
    }
    v114 = v2;
    v115 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v117, "count"));
      *(_DWORD *)buf = 138412290;
      v153 = v17;
      _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "Processing %@ sync change transactions", buf, 0xCu);
    }
    v130 = objc_opt_new();
    v128 = objc_opt_new();
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id obj = v117;
    uint64_t v125 = [obj countByEnumeratingWithState:&v147 objects:v165 count:16];
    if (v125)
    {
      uint64_t v124 = *(void *)v148;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v148 != v124) {
            objc_enumerationMutation(obj);
          }
          uint64_t v126 = v18;
          id v19 = *(void **)(*((void *)&v147 + 1) + 8 * v18);
          long long v143 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v131 = [v19 changes];
          uint64_t v20 = [v131 countByEnumeratingWithState:&v143 objects:v164 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v144;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v144 != v22) {
                  objc_enumerationMutation(v131);
                }
                uint64_t v24 = *(_DKChangeSet **)(*((void *)&v143 + 1) + 8 * v23);
                id v25 = (void *)MEMORY[0x192FB2F20]();
                id v26 = [(_DKChangeSet *)v24 changedObjectID];
                long long v27 = [v26 URIRepresentation];
                long long v28 = [v27 absoluteString];

                if ([(_DKChangeSet *)v24 changeType])
                {
                  [(_DKChangeSet *)v24 changeType];
                  goto LABEL_33;
                }
                long long v29 = [(_DKChangeSet *)v24 changedObjectID];
                long long v30 = [v29 entity];
                id v31 = [v30 name];

                uint64_t v32 = +[_DKChangeSet additionChangeSetEntityName];
                LODWORD(v30) = [v31 isEqualToString:v32];

                if (v30)
                {
                  uint64_t v33 = +[_CDLogging syncChannel];
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v153 = v28;
                    __int16 v154 = 2112;
                    v155 = v24;
                    _os_log_debug_impl(&dword_18ECEB000, v33, OS_LOG_TYPE_DEBUG, "May fetch inserted addition change set %@: %@", buf, 0x16u);
                  }

                  uint32_t v34 = [(_DKChangeSet *)v24 changedObjectID];
                  BOOL v35 = v130;
LABEL_31:
                  [v35 addObject:v34];

                  goto LABEL_32;
                }
                uint64_t v36 = +[_DKChangeSet deletionChangeSetEntityName];
                int v37 = [v31 isEqualToString:v36];

                if (v37)
                {
                  uint64_t v38 = +[_CDLogging syncChannel];
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v153 = v28;
                    __int16 v154 = 2112;
                    v155 = v24;
                    _os_log_debug_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_DEBUG, "May fetch inserted deletion change set %@: %@", buf, 0x16u);
                  }

                  uint32_t v34 = [(_DKChangeSet *)v24 changedObjectID];
                  BOOL v35 = v128;
                  goto LABEL_31;
                }
LABEL_32:

LABEL_33:
                ++v23;
              }
              while (v21 != v23);
              uint64_t v21 = [v131 countByEnumeratingWithState:&v143 objects:v164 count:16];
            }
            while (v21);
          }

          ++v18;
        }
        while (v126 + 1 != v125);
        uint64_t v125 = [obj countByEnumeratingWithState:&v147 objects:v165 count:16];
      }
      while (v125);
    }

    char v39 = v130;
    uint64_t v40 = v128;
    if (![v130 count] && !objc_msgSend(v128, "count"))
    {
      id v8 = 0;
      uint64_t v2 = v114;
      id v5 = v115;
      id v12 = v116;
LABEL_100:

LABEL_101:
      goto LABEL_102;
    }
    uint64_t v41 = v118;
    __int16 v42 = *(void **)(v118 + 56);
    if (v42)
    {
      id v112 = v42;
      unint64_t v43 = 0x1E4F1C000;
    }
    else
    {
      unint64_t v43 = 0x1E4F1C000uLL;
      id v112 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v113 = [*(id *)(v43 + 2504) date];
    if ([v130 count])
    {
      id v46 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
      uint64_t v47 = (void *)MEMORY[0x1E4F1C0A8];
      uint64_t v48 = +[_DKChangeSet additionChangeSetEntityName];
      id v49 = [v47 entityForName:v48 inManagedObjectContext:*(void *)(v118 + 40)];
      [v46 setEntity:v49];

      long long v50 = (void *)MEMORY[0x1E4F28F60];
      long long v51 = [*(id *)(v118 + 64) deviceUUID];
      long long v52 = [v51 UUIDString];
      long long v53 = [v50 predicateWithFormat:@"SELF IN %@ AND deviceIdentifier != %@", v130, v52];
      [v46 setPredicate:v53];

      uint64_t v41 = v118;
      v54 = *(void **)(v118 + 40);
      id v142 = 0;
      v55 = [v54 executeFetchRequest:v46 error:&v142];
      id v8 = v142;

      if (v8)
      {
        uint64_t v56 = 0;
        id v5 = v115;
        id v12 = v116;
        goto LABEL_52;
      }
    }
    else
    {
      v55 = 0;
    }
    v111 = v55;
    if ([v128 count])
    {
      id v57 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
      v58 = (void *)MEMORY[0x1E4F1C0A8];
      id v59 = +[_DKChangeSet deletionChangeSetEntityName];
      v60 = [v58 entityForName:v59 inManagedObjectContext:*(void *)(v41 + 40)];
      [v57 setEntity:v60];

      uint64_t v61 = (void *)MEMORY[0x1E4F28F60];
      v62 = [*(id *)(v41 + 64) deviceUUID];
      v63 = [v62 UUIDString];
      v64 = [v61 predicateWithFormat:@"SELF IN %@ AND deviceIdentifier != %@", v128, v63];
      [v57 setPredicate:v64];

      v65 = *(void **)(v118 + 40);
      id v141 = 0;
      uint64_t v56 = [v65 executeFetchRequest:v57 error:&v141];
      id v8 = v141;

      if (v8)
      {
        id v5 = v115;
        id v12 = v116;
        v55 = v111;
LABEL_52:
        v127 = +[_CDLogging syncChannel];
        uint64_t v2 = v114;
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG)) {
          __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_2();
        }
LABEL_99:

        goto LABEL_100;
      }
      id v5 = v115;
      v55 = v111;
    }
    else
    {
      uint64_t v56 = 0;
      id v5 = v115;
    }
    uint64_t v66 = fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter;
    v67 = [MEMORY[0x1E4F1C9C8] date];
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v66, (uint64_t)v113, v67);

    v68 = +[_CDLogging syncChannel];
    uint64_t v2 = v114;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v69 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "count") + objc_msgSend(v55, "count"));
      v70 = NSNumber;
      uint64_t v71 = [v130 count];
      uint64_t v72 = [v128 count] + v71;
      id v5 = v115;
      v73 = [v70 numberWithUnsignedInteger:v72];
      *(_DWORD *)buf = 138412546;
      v153 = v69;
      __int16 v154 = 2112;
      v155 = v73;
      _os_log_impl(&dword_18ECEB000, v68, OS_LOG_TYPE_INFO, "Fetched %@ of %@ insertion changes", buf, 0x16u);

      v55 = v111;
    }

    if ([v55 count] || objc_msgSend(v56, "count"))
    {
      uint64_t v74 = [MEMORY[0x1E4F1CA48] array];
      v129 = [MEMORY[0x1E4F1CA48] array];
      v75 = objc_opt_new();
      if ([v55 count]) {
        [v75 addObject:v55];
      }
      v127 = v74;
      if ([v56 count]) {
        [v75 addObject:v56];
      }
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v119 = v75;
      id v132 = v56;
      uint64_t v121 = [v119 countByEnumeratingWithState:&v137 objects:v163 count:16];
      if (v121)
      {
        uint64_t v120 = *(void *)v138;
        do
        {
          uint64_t v76 = 0;
          do
          {
            if (*(void *)v138 != v120) {
              objc_enumerationMutation(v119);
            }
            uint64_t v122 = v76;
            id v77 = *(id *)(*((void *)&v137 + 1) + 8 * v76);
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            long long v136 = 0u;
            id v78 = v77;
            uint64_t v79 = [v78 countByEnumeratingWithState:&v133 objects:v162 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              uint64_t v81 = *(void *)v134;
              do
              {
                uint64_t v82 = 0;
                do
                {
                  if (*(void *)v134 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  v83 = *(void **)(*((void *)&v133 + 1) + 8 * v82);
                  v84 = [MEMORY[0x1E4F1C9C8] date];
                  v85 = [[_DKChangeSet alloc] initWithManagedObject:v83];
                  if (v85)
                  {
                    uint64_t v86 = fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
                    v87 = [MEMORY[0x1E4F1C9C8] date];
                    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v86, (uint64_t)v84, v87);

                    v88 = +[_CDLogging syncChannel];
                    BOOL v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG);
                    uint64_t v56 = v132;
                    if (v77 == v132)
                    {
                      if (v89)
                      {
                        v94 = [v83 objectID];
                        *(_DWORD *)buf = 138412546;
                        v153 = v94;
                        __int16 v154 = 2112;
                        v155 = v85;
                        _os_log_debug_impl(&dword_18ECEB000, v88, OS_LOG_TYPE_DEBUG, "Fetched inserted deletion change set %@: %@", buf, 0x16u);
                      }
                      v90 = v127;
                    }
                    else
                    {
                      if (v89)
                      {
                        v93 = [v83 objectID];
                        *(_DWORD *)buf = 138412546;
                        v153 = v93;
                        __int16 v154 = 2112;
                        v155 = v85;
                        _os_log_debug_impl(&dword_18ECEB000, v88, OS_LOG_TYPE_DEBUG, "Fetched inserted addition change set %@: %@", buf, 0x16u);
                      }
                      v90 = v129;
                    }
                    [v90 addObject:v85];
                  }
                  else
                  {
                    v91 = +[_CDLogging syncChannel];
                    BOOL v92 = os_log_type_enabled(v91, OS_LOG_TYPE_ERROR);
                    uint64_t v56 = v132;
                    if (v77 == v132)
                    {
                      if (v92) {
                        __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_2((uint64_t)v161, (uint64_t)v83);
                      }
                    }
                    else if (v92)
                    {
                      __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_3((uint64_t)v160, (uint64_t)v83);
                    }
                  }
                  ++v82;
                }
                while (v80 != v82);
                uint64_t v80 = [v78 countByEnumeratingWithState:&v133 objects:v162 count:16];
              }
              while (v80);
            }

            uint64_t v76 = v122 + 1;
          }
          while (v122 + 1 != v121);
          uint64_t v121 = [v119 countByEnumeratingWithState:&v137 objects:v163 count:16];
        }
        while (v121);
      }

      v95 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        v96 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v127, "count") + -[NSObject count](v129, "count"));
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "count") + objc_msgSend(v111, "count"));
        v97 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v153 = v96;
        __int16 v154 = 2112;
        v155 = v97;
        _os_log_impl(&dword_18ECEB000, v95, OS_LOG_TYPE_INFO, "Converted %@ of %@ inserted change sets", buf, 0x16u);
      }
      id v12 = v116;
      v98 = -[_DKSyncChanges initWithAdditionChangeSets:deletionChangeSets:startDate:endDate:]((id *)[_DKSyncChanges alloc], v129, v127, v112, v116);
      uint64_t v99 = *(void *)(*(void *)(v118 + 80) + 8);
      v100 = *(void **)(v99 + 40);
      *(void *)(v99 + 40) = v98;

      v101 = +[_CDLogging syncChannel];
      uint64_t v2 = v114;
      char v39 = v130;
      uint64_t v40 = v128;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        v102 = NSNumber;
        v103 = [*(id *)(*(void *)(*(void *)(v118 + 80) + 8) + 40) additionChangeSets];
        v104 = objc_msgSend(v102, "numberWithUnsignedInteger:", objc_msgSend(v103, "count"));
        v105 = NSNumber;
        v106 = [*(id *)(*(void *)(*(void *)(v118 + 80) + 8) + 40) deletionChangeSets];
        objc_msgSend(v105, "numberWithUnsignedInteger:", objc_msgSend(v106, "count"));
        v107 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();
        v108 = [*(id *)(*(void *)(*(void *)(v118 + 80) + 8) + 40) startDate];
        v109 = [*(id *)(*(void *)(*(void *)(v118 + 80) + 8) + 40) endDate];
        *(_DWORD *)buf = 138413058;
        v153 = v104;
        __int16 v154 = 2112;
        v155 = v107;
        __int16 v156 = 2112;
        v157 = v108;
        __int16 v158 = 2112;
        v159 = v109;
        _os_log_impl(&dword_18ECEB000, v101, OS_LOG_TYPE_INFO, "Created sync changes object with %@ addition change sets, and %@ deletion change sets for period %@ to %@", buf, 0x2Au);

        uint64_t v56 = v132;
        id v12 = v116;
      }

      id v8 = 0;
      id v5 = v115;
      v55 = v111;
    }
    else
    {
      v110 = +[_CDLogging syncChannel];
      id v12 = v116;
      v127 = v110;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18ECEB000, v110, OS_LOG_TYPE_INFO, "No inserted remote change sets to process", buf, 2u);
      }
      id v8 = 0;
    }
    goto LABEL_99;
  }
  id v8 = v6;
  id v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_1();
  }

  uint64_t v10 = +[_DKSyncErrors failedToFetchChanges];
  uint64_t v11 = *(void *)(*(void *)(v118 + 72) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
LABEL_102:
}

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didDeleteEventsWithStreamNameCounts:*(void *)(a1 + 48)];
}

uint64_t __71___DKKnowledgeStorage__sendTombstoneNotificationsWithStreamNameCounts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didTombstoneEventsWithStreamNameCounts:*(void *)(a1 + 48)];
}

void __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  char v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v16);
  id v5 = v16;
  id v6 = (void *)a1[8];
  if (v6)
  {
    BOOL v7 = a1[6];
    if (!v7) {
      BOOL v7 = *(NSObject **)(a1[4] + 32);
    }
    id v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke_2;
    v12[3] = &unk_1E560F140;
    id v14 = v6;
    char v15 = v4;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

uint64_t __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  char v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v16);
  id v5 = v16;
  id v6 = (void *)a1[8];
  if (v6)
  {
    BOOL v7 = a1[6];
    if (!v7) {
      BOOL v7 = *(NSObject **)(a1[4] + 32);
    }
    id v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_5;
    v12[3] = &unk_1E560F140;
    id v14 = v6;
    char v15 = v4;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

uint64_t __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __41___DKKnowledgeStorage_saveObjects_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

void __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  BOOL v4 = -[_DKKnowledgeStorage _deleteObjects:error:](v2, v3, &v16);
  id v5 = v16;
  id v6 = (void *)a1[8];
  if (v6)
  {
    BOOL v7 = a1[6];
    if (!v7) {
      BOOL v7 = *(NSObject **)(a1[4] + 32);
    }
    id v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke_2;
    v12[3] = &unk_1E560F140;
    id v14 = v6;
    BOOL v15 = v4;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

uint64_t __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __43___DKKnowledgeStorage_deleteObjects_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = -[_DKKnowledgeStorage _deleteObjects:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t __47___DKKnowledgeStorage__tombstoneObjects_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke(void *a1)
{
  id v2 = (dispatch_queue_t *)a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  uint64_t v4 = -[_DKKnowledgeStorage _deleteAllEventsMatchingPredicate:error:](v2, v3, &v16);
  id v5 = v16;
  id v6 = (void *)a1[8];
  if (v6)
  {
    BOOL v7 = a1[6];
    if (!v7) {
      BOOL v7 = *(NSObject **)(a1[4] + 32);
    }
    id v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke_2;
    v12[3] = &unk_1E560F250;
    id v14 = v6;
    BOOL v15 = v4;
    id v13 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

uint64_t __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke(void *a1)
{
  id v2 = (dispatch_queue_t *)a1[4];
  uint64_t v3 = (void *)a1[5];
  id v16 = 0;
  uint64_t v4 = -[_DKKnowledgeStorage _executeQuery:error:](v2, v3, &v16);
  id v5 = v16;
  id v6 = (void *)a1[8];
  if (v6)
  {
    BOOL v7 = a1[6];
    if (!v7) {
      BOOL v7 = *(NSObject **)(a1[4] + 32);
    }
    id v8 = (void *)a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke_2;
    v12[3] = &unk_1E560F278;
    id v15 = v6;
    id v13 = v4;
    id v14 = v5;
    id v9 = v8;
    uint64_t v10 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E560D978;
    id v18 = v9;
    id v19 = v10;
    id v11 = v9;
    dispatch_async(v7, block);
  }
}

uint64_t __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke(uint64_t a1)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0A8];
  uint64_t v4 = +[_DKEvent entityName];
  id v5 = [v3 entityForName:v4 inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v5];

  [v2 setIncludesSubentities:0];
  [v2 setIncludesPendingChanges:0];
  [v2 setResultType:2];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v6 setName:@"eventCount"];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  v44[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  uint64_t v10 = [v7 expressionForFunction:@"count:" arguments:v9];
  [v6 setExpression:v10];

  [v6 setExpressionResultType:200];
  v43[0] = @"streamName";
  v43[1] = v6;
  BOOL v35 = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  [v2 setPropertiesToFetch:v11];

  __int16 v42 = @"streamName";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  [v2 setPropertiesToGroupBy:v12];

  id v13 = *(void **)(a1 + 32);
  id v40 = 0;
  id v14 = [v13 executeFetchRequest:v2 error:&v40];
  id v15 = v40;
  if (v15)
  {
    id obj = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v14;
    uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v33 = v14;
      uint64_t v21 = a1;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v25 = [v35 name];
          uint64_t v26 = [v24 objectForKeyedSubscript:v25];
          long long v27 = (void *)v26;
          if (v26) {
            long long v28 = (void *)v26;
          }
          else {
            long long v28 = &unk_1EDE1DCB8;
          }
          long long v29 = *(void **)(*(void *)(*(void *)(v21 + 40) + 8) + 40);
          uint64_t v30 = [v24 objectForKeyedSubscript:@"streamName"];
          id v31 = (void *)v30;
          if (v30) {
            uint64_t v32 = (__CFString *)v30;
          }
          else {
            uint64_t v32 = @"nil";
          }
          [v29 setObject:v28 forKeyedSubscript:v32];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v20);
      id v14 = v33;
      id v15 = 0;
    }
  }
}

uint64_t __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

id __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"streamName"];
  if (+[_DKBiomeQuery canShimDuetStreamNamed:v2])
  {
    uint64_t v3 = +[_DKEventStream eventStreamWithName:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __115___DKKnowledgeStorage_migrateEventBatchToBiomeStream_fetchRequest_managedObjectContex_converter_eventCount_offset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  uint64_t v9 = [*(id *)(a1 + 48) objectsFromManagedObjects:v4];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __63___DKKnowledgeStorage_verifyBiomeMigration_expectedEventCount___block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __50___DKKnowledgeStorage_biomeStreamContainsEntries___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 32) + 72)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2;
  v6[3] = &unk_1E560F168;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v11 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = v2;
  [v5 performWithOptions:4 andBlock:v6];
}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) insertInManagedObjectContext:*(void *)(a1 + 40)];

  if (v2)
  {
    if ([*(id *)(a1 + 40) hasChanges])
    {
      id v3 = *(void **)(a1 + 40);
      id v22 = 0;
      char v4 = [v3 save:&v22];
      id v5 = v22;
    }
    else
    {
      id v5 = 0;
      char v4 = 1;
    }
    id v12 = *(void **)(a1 + 64);
    if (v12)
    {
      id v13 = *(void **)(a1 + 48);
      if (!v13) {
        id v13 = *(void **)(*(void *)(a1 + 56) + 32);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_686;
      v18[3] = &unk_1E560F140;
      id v20 = v12;
      char v21 = v4;
      id v5 = v5;
      id v19 = v5;
      id v14 = v18;
      id v15 = v13;
      uint64_t v16 = (void *)os_transaction_create();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      long long v27 = __cd_dispatch_async_capture_tx_block_invoke_6;
      long long v28 = &unk_1E560D978;
      id v29 = v16;
      id v30 = v14;
      id v17 = v16;
      dispatch_async(v15, &block);
    }
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 64);
    if (!v6) {
      return;
    }
    id v7 = *(void **)(a1 + 48);
    if (!v7) {
      id v7 = *(void **)(*(void *)(a1 + 56) + 32);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_3;
    v23[3] = &unk_1E560D950;
    id v24 = v6;
    id v8 = v23;
    id v9 = v7;
    uint64_t v10 = (void *)os_transaction_create();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    long long v27 = __cd_dispatch_async_capture_tx_block_invoke_6;
    long long v28 = &unk_1E560D978;
    id v29 = v10;
    id v30 = v8;
    id v11 = v10;
    dispatch_async(v9, &block);

    id v5 = v24;
  }
}

uint64_t __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_686(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchLocalChanges");
  v1 = (void *)fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter;
  fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchLocalChangesExecuteRequest");
  id v3 = (void *)fetchLocalChangesSinceDate_error__executeRequestTimerCounter;
  fetchLocalChangesSinceDate_error__executeRequestTimerCounter = v2;

  uint64_t v4 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchLocalChangesExistingObjectWithID");
  id v5 = (void *)fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter;
  fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter = v4;

  uint64_t v6 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchLocalChangesObjectsFromManagedObjects");
  uint64_t v7 = fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
  fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter = v6;
  return MEMORY[0x1F41817F8](v6, v7);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v110 = 0;
  id v5 = [v3 executeRequest:v4 error:&v110];
  id v6 = v110;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_6();
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
    id v11 = v7;

    goto LABEL_74;
  }
  if (v5)
  {
    uint64_t v12 = fetchLocalChangesSinceDate_error__executeRequestTimerCounter;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v12, (uint64_t)v2, (void *)v13);

    v90 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v5 performSelector:sel_result];
    LOBYTE(v13) = [v14 conformsToProtocol:&unk_1EDE494D0];
    id v15 = +[_CDLogging syncChannel];
    uint64_t v16 = v15;
    BOOL v89 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        *(_DWORD *)buf = 138412290;
        id v112 = v17;
        _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "Processing %@ persistent history change transactions", buf, 0xCu);
      }
      if ((unint64_t)[v14 count] <= 5)
      {
        id v18 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_4();
        }
      }
      uint64_t v86 = a1;
      v87 = v2;
      v88 = v5;
      v97 = objc_opt_new();
      v96 = objc_opt_new();
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obj = v14;
      uint64_t v93 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
      if (v93)
      {
        uint64_t v92 = *(void *)v107;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v107 != v92) {
              objc_enumerationMutation(obj);
            }
            uint64_t v95 = v19;
            id v20 = *(void **)(*((void *)&v106 + 1) + 8 * v19);
            context = (void *)MEMORY[0x192FB2F20]();
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            id v98 = [v20 changes];
            uint64_t v21 = [v98 countByEnumeratingWithState:&v102 objects:v119 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v103;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v103 != v23) {
                    objc_enumerationMutation(v98);
                  }
                  id v25 = *(void **)(*((void *)&v102 + 1) + 8 * i);
                  uint64_t v26 = (void *)MEMORY[0x192FB2F20]();
                  long long v27 = [v25 changedObjectID];
                  long long v28 = [v27 URIRepresentation];
                  id v29 = [v28 absoluteString];

                  if (![v25 changeType])
                  {
                    BOOL v35 = [v25 changedObjectID];
                    long long v36 = [v35 entity];
                    id v31 = [v36 name];

                    long long v37 = +[_DKEvent entityName];
                    LODWORD(v36) = [v31 isEqualToString:v37];

                    if (v36)
                    {
                      long long v38 = +[_CDLogging syncChannel];
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v112 = v29;
                        __int16 v113 = 2112;
                        v114 = v25;
                        _os_log_debug_impl(&dword_18ECEB000, v38, OS_LOG_TYPE_DEBUG, "May fetch insertion change %@: %@", buf, 0x16u);
                      }

                      uint64_t v33 = [v25 changedObjectID];
                      [v97 addObject:v33];
LABEL_39:
                    }
                    goto LABEL_41;
                  }
                  if ([v25 changeType] == 2)
                  {
                    id v30 = [v25 tombstone];
                    if (v30)
                    {
                      id v31 = v30;
                      uint64_t v32 = [v30 objectForKeyedSubscript:@"shouldSync"];
                      uint64_t v33 = v32;
                      if (v32) {
                        int v34 = [v32 BOOLValue];
                      }
                      else {
                        int v34 = 0;
                      }
                      uint64_t v39 = [v31 objectForKeyedSubscript:@"uuid"];
                      id v40 = (void *)v39;
                      if (v34 && v39)
                      {
                        uint64_t v41 = +[_CDLogging syncChannel];
                        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v112 = v29;
                          __int16 v113 = 2112;
                          v114 = v25;
                          _os_log_debug_impl(&dword_18ECEB000, v41, OS_LOG_TYPE_DEBUG, "Fetched tombstone %@: %@", buf, 0x16u);
                        }

                        [v96 addObject:v31];
                      }

                      goto LABEL_39;
                    }
                  }
LABEL_41:
                }
                uint64_t v22 = [v98 countByEnumeratingWithState:&v102 objects:v119 count:16];
              }
              while (v22);
            }

            uint64_t v19 = v95 + 1;
          }
          while (v95 + 1 != v93);
          uint64_t v93 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
        }
        while (v93);
      }

      __int16 v42 = v97;
      if ([v97 count] || objc_msgSend(v96, "count"))
      {
        uint64_t v43 = v86;
        uint64_t v2 = v87;
        uint64_t v44 = *(void **)(v86 + 56);
        id v5 = v88;
        if (v44)
        {
          id v45 = v44;
          unint64_t v46 = 0x1E4F1C000;
        }
        else
        {
          unint64_t v46 = 0x1E4F1C000uLL;
          id v45 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        if ([v97 count])
        {
          id v52 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
          long long v53 = (void *)MEMORY[0x1E4F1C0A8];
          v54 = +[_DKEvent entityName];
          v55 = [v53 entityForName:v54 inManagedObjectContext:*(void *)(v86 + 40)];
          [v52 setEntity:v55];

          uint64_t v56 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@ AND shouldSync == YES", v97];
          [v52 setPredicate:v56];

          id v57 = [*(id *)(v46 + 2504) date];
          v58 = *(void **)(v86 + 40);
          id v101 = 0;
          id v59 = [v58 executeFetchRequest:v52 error:&v101];
          id v60 = v101;
          id v11 = v60;
          if (!v59 || v60)
          {
            v64 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
              __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_2();
            }
            uint64_t v66 = 0;
          }
          else
          {
            id v99 = v45;
            uint64_t v61 = fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter;
            v62 = [MEMORY[0x1E4F1C9C8] date];
            -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v61, (uint64_t)v57, v62);

            v63 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
              __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_3(v59, v97);
            }

            v64 = [MEMORY[0x1E4F1C9C8] date];
            v65 = objc_alloc_init(_DKObjectMOConverter);
            uint64_t v66 = [(_DKObjectMOConverter *)v65 objectsFromManagedObjects:v59];

            uint64_t v67 = fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
            v68 = [MEMORY[0x1E4F1C9C8] date];
            -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v67, (uint64_t)v64, v68);

            v69 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v66, "count"));
              uint64_t v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v59, "count"));
              *(_DWORD *)buf = 138412546;
              id v112 = v70;
              __int16 v113 = 2112;
              v114 = v71;
              _os_log_impl(&dword_18ECEB000, v69, OS_LOG_TYPE_INFO, "Converted %@ of %@ insertion changes", buf, 0x16u);
            }
            id v45 = v99;
          }

          uint64_t v2 = v87;
          id v5 = v88;
          uint64_t v43 = v86;
        }
        else
        {
          uint64_t v66 = 0;
          id v11 = 0;
        }
        uint64_t v72 = -[_DKLocalChanges initWithInsertedObjects:tombstones:startDate:endDate:]((id *)[_DKLocalChanges alloc], v66, v96, v45, v90);
        uint64_t v73 = *(void *)(*(void *)(v43 + 72) + 8);
        uint64_t v74 = *(void **)(v73 + 40);
        *(void *)(v73 + 40) = v72;

        v75 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          uint64_t v76 = v43;
          id v77 = NSNumber;
          id v78 = [*(id *)(*(void *)(*(void *)(v76 + 72) + 8) + 40) insertedObjects];
          uint64_t v79 = objc_msgSend(v77, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
          id v100 = v66;
          id v80 = v45;
          uint64_t v81 = NSNumber;
          uint64_t v82 = [*(id *)(*(void *)(*(void *)(v76 + 72) + 8) + 40) tombstones];
          v83 = objc_msgSend(v81, "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
          v84 = [*(id *)(*(void *)(*(void *)(v76 + 72) + 8) + 40) startDate];
          v85 = [*(id *)(*(void *)(*(void *)(v76 + 72) + 8) + 40) endDate];
          *(_DWORD *)buf = 138413058;
          id v112 = v79;
          __int16 v113 = 2112;
          v114 = v83;
          __int16 v115 = 2112;
          v116 = v84;
          __int16 v117 = 2112;
          uint64_t v118 = v85;
          _os_log_impl(&dword_18ECEB000, v75, OS_LOG_TYPE_INFO, "Created local changes object with %@ inserted objects, %@ tombstones for period %@ to %@", buf, 0x2Au);

          id v45 = v80;
          uint64_t v66 = v100;

          id v5 = v88;
        }

        __int16 v42 = v97;
      }
      else
      {
        id v11 = 0;
        uint64_t v2 = v87;
        id v5 = v88;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_5();
      }

      uint64_t v50 = +[_DKSyncErrors failedToFetchChanges];
      id v11 = 0;
      uint64_t v51 = *(void *)(*(void *)(a1 + 64) + 8);
      __int16 v42 = *(void **)(v51 + 40);
      *(void *)(v51 + 40) = v50;
    }

    goto LABEL_74;
  }
  uint64_t v47 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_1();
  }

  uint64_t v48 = +[_DKSyncErrors failedToFetchChanges];
  uint64_t v49 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(id *)(v49 + 40);
  *(void *)(v49 + 40) = v48;
LABEL_74:
}

uint64_t __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchSyncChanges");
  v1 = (void *)fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter;
  fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter = v0;

  uint64_t v2 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchSyncChangesExecuteRequest");
  id v3 = (void *)fetchSyncChangesSinceDate_error__executeRequestTimerCounter;
  fetchSyncChangesSinceDate_error__executeRequestTimerCounter = v2;

  uint64_t v4 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchSyncChangesExistingObjectWithID");
  id v5 = (void *)fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter;
  fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter = v4;

  uint64_t v6 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"fetchSyncChangesObjectsFromManagedObjects");
  uint64_t v7 = fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
  fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter = v6;
  return MEMORY[0x1F41817F8](v6, v7);
}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[_DKKnowledgeStorage syncStorageIfAvailable](*(id **)(a1 + 32));
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 32) + 72)];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2;
    v7[3] = &unk_1E560F388;
    id v8 = *(id *)(a1 + 40);
    id v9 = v4;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = v5;
    id v6 = v4;
    [v6 performWithOptions:4 andBlock:v7];
  }
}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v14 + 1) + 8 * v5) insertInManagedObjectContext:*(void *)(a1 + 40)];
        BOOL v7 = v6 == 0;

        if (v7)
        {
          uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:MEMORY[0x1E4F1CC08]];
          uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          return;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  if ([*(id *)(a1 + 40) hasChanges])
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    [v8 save:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
  }
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke(uint64_t a1)
{
  id v2 = -[_DKKnowledgeStorage syncStorageIfAvailable](*(id **)(a1 + 32));
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2;
    v9[3] = &unk_1E560F3B0;
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    long long v12 = *(_OWORD *)(a1 + 48);
    [v10 performWithOptions:4 andBlock:v9];
  }
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v11 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v11];
  id v5 = v11;
  if ([v4 count] == 1)
  {
    uint64_t v6 = [v4 objectAtIndex:0];
    uint64_t v7 = [v6 sequenceNumber];
    *(void *)(*(void *)(a1[6] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v7 integerValue];

LABEL_7:
    goto LABEL_8;
  }
  if (!v4)
  {
    id v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1();
    }

    uint64_t v9 = *(void *)(a1[7] + 8);
    id v10 = v5;
    uint64_t v6 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
    goto LABEL_7;
  }
LABEL_8:
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v2 = -[_DKKnowledgeStorage syncStorageIfAvailable](*(id **)(a1 + 40));
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 40) + 72)];
  uint64_t v4 = +[_CDLogging syncChannel];
  id v5 = v4;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = +[_DKSyncErrors unavailableForCurrentUser];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Starting sync down from the cloud", buf, 2u);
  }

  if (!+[_DKCloudUtilities isUnitTesting])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_2;
    v21[3] = &unk_1E560F400;
    id v25 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 40);
    id v22 = v17;
    uint64_t v23 = v18;
    id v19 = v3;
    uint64_t v20 = *(void *)(a1 + 64);
    id v24 = v19;
    uint64_t v26 = v20;
    [v19 performBlockAndWait:v21];

    uint64_t v9 = v25;
LABEL_17:

    goto LABEL_18;
  }
  id v11 = *(void **)(a1 + 56);
  if (v11)
  {
    long long v12 = *(void **)(a1 + 48);
    if (!v12) {
      long long v12 = *(void **)(*(void *)(a1 + 40) + 32);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_756;
    v27[3] = &unk_1E560D950;
    id v28 = v11;
    uint64_t v13 = v27;
    long long v14 = v12;
    long long v15 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __cd_dispatch_async_capture_tx_block_invoke_6;
    uint64_t v32 = &unk_1E560D978;
    id v33 = v15;
    id v34 = v13;
    id v16 = v15;
    dispatch_async(v14, buf);

    uint64_t v9 = v28;
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_756(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 setQualityOfService:25];
  id v3 = objc_alloc(MEMORY[0x1E4F1C080]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3;
  v11[3] = &unk_1E560F3D8;
  id v14 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = v4;
  uint64_t v13 = v5;
  BOOL v6 = (void *)[v3 initWithOptions:v2 completionBlock:v11];
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = (id)[v7 executeRequest:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 success];
  uint64_t v5 = +[_CDLogging syncChannel];
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Finished sync down from the cloud", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(v3, v6);
  }

  uint64_t v7 = (void *)a1[6];
  if (v7)
  {
    uint64_t v8 = (void *)a1[4];
    if (!v8) {
      uint64_t v8 = *(void **)(a1[5] + 32);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_759;
    v13[3] = &unk_1E560D978;
    id v15 = v7;
    id v14 = v3;
    id v9 = v13;
    id v10 = v8;
    id v11 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __cd_dispatch_async_capture_tx_block_invoke_6;
    id v19 = &unk_1E560D978;
    id v20 = v11;
    id v21 = v9;
    id v12 = v11;
    dispatch_async(v10, buf);
  }
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_759(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) success];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

uint64_t __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_761(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  uint64_t v2 = -[_DKKnowledgeStorage syncStorageIfAvailable](*(id **)(a1 + 40));
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 40) + 72)];
  id v4 = +[_CDLogging syncChannel];
  uint64_t v5 = v4;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = +[_DKSyncErrors unavailableForCurrentUser];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Starting sync up to the cloud", buf, 2u);
  }

  if (!+[_DKCloudUtilities isUnitTesting])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_2;
    v21[3] = &unk_1E560F400;
    id v25 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 40);
    id v22 = v17;
    uint64_t v23 = v18;
    id v19 = v3;
    uint64_t v20 = *(void *)(a1 + 64);
    id v24 = v19;
    uint64_t v26 = v20;
    [v19 performBlockAndWait:v21];

    id v9 = v25;
LABEL_17:

    goto LABEL_18;
  }
  id v11 = *(void **)(a1 + 56);
  if (v11)
  {
    id v12 = *(void **)(a1 + 48);
    if (!v12) {
      id v12 = *(void **)(*(void *)(a1 + 40) + 32);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_765;
    v27[3] = &unk_1E560D950;
    id v28 = v11;
    uint64_t v13 = v27;
    id v14 = v12;
    id v15 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __cd_dispatch_async_capture_tx_block_invoke_6;
    uint64_t v32 = &unk_1E560D978;
    id v33 = v15;
    id v34 = v13;
    id v16 = v15;
    dispatch_async(v14, buf);

    id v9 = v28;
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_765(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  [v2 setQualityOfService:25];
  id v3 = objc_alloc(MEMORY[0x1E4F1C070]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3;
  v11[3] = &unk_1E560F3D8;
  id v14 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = v4;
  uint64_t v13 = v5;
  BOOL v6 = (void *)[v3 initWithOptions:v2 completionBlock:v11];
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = (id)[v7 executeRequest:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 success];
  uint64_t v5 = +[_CDLogging syncChannel];
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Finished sync up to the cloud", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(v3, v6);
  }

  uint64_t v7 = (void *)a1[6];
  if (v7)
  {
    uint64_t v8 = (void *)a1[4];
    if (!v8) {
      uint64_t v8 = *(void **)(a1[5] + 32);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_767;
    v13[3] = &unk_1E560D978;
    id v15 = v7;
    id v14 = v3;
    id v9 = v13;
    id v10 = v8;
    id v11 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __cd_dispatch_async_capture_tx_block_invoke_6;
    id v19 = &unk_1E560D978;
    id v20 = v11;
    id v21 = v9;
    id v12 = v11;
    dispatch_async(v10, buf);
  }
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_767(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) success];
  id v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

uint64_t __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_768(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[_DKKnowledgeStorage syncStorageIfAvailable](*(id **)(a1 + 32));
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358] identifier:*(void *)(*(void *)(a1 + 32) + 72)];
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke_2;
    v9[3] = &unk_1E560F3B0;
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    long long v12 = *(_OWORD *)(a1 + 48);
    [v10 performWithOptions:4 andBlock:v9];
  }
}

void __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v13 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v13];
  id v5 = v13;
  if ([v4 count] == 1)
  {
    uint64_t v6 = [v4 objectAtIndex:0];
    uint64_t v7 = [[_DKChangeSet alloc] initWithManagedObject:v6];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

LABEL_7:
    goto LABEL_8;
  }
  if (!v4)
  {
    id v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1();
    }

    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = v5;
    uint64_t v6 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, @"portraitknowledge", @"databaseChangedObjectsFromManagedObjects");
  uint64_t v1 = _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
  _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 valueForKey:*MEMORY[0x1E4F1BDF8]];
  id v4 = [v2 valueForKey:*MEMORY[0x1E4F1BDC0]];
  if ([v3 count] && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v6 = [(id)objc_opt_class() entityName];
    uint64_t v7 = [v5 predicateWithFormat:@"entity.name == %@ && shouldSync == %@", v6, MEMORY[0x1E4F1CC38]];

    uint64_t v8 = [v3 filteredSetUsingPredicate:v7];
    id v9 = [v8 allObjects];

    if ([*(id *)(a1 + 40) count] && objc_msgSend(v9, "count"))
    {
      id v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_2(v9);
      }

      uint64_t v11 = objc_opt_new();
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      long long v37 = v11;
      uint64_t v13 = [v11 objectsFromManagedObjects:v9];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v16 = _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v16, (uint64_t)v12, v17);

      uint64_t v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
        id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v19;
        __int16 v40 = 2112;
        uint64_t v41 = v20;
        _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "Converted %@ of %@ inserted synced event objects", buf, 0x16u);
      }
    }
  }
  if ([v4 count] && objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    id v21 = (void *)MEMORY[0x1E4F28F60];
    id v22 = [(id)objc_opt_class() entityName];
    uint64_t v23 = [v21 predicateWithFormat:@"entity.name == %@ && shouldSync == %@", v22, MEMORY[0x1E4F1CC38]];

    id v24 = [v4 filteredSetUsingPredicate:v23];
    id v25 = [v24 allObjects];

    if ([*(id *)(a1 + 48) count] && objc_msgSend(v25, "count"))
    {
      uint64_t v26 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_1(v25);
      }

      long long v27 = objc_opt_new();
      id v28 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v29 = [v27 objectsFromManagedObjects:v25];
      uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      id v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;

      uint64_t v32 = _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
      id v33 = [MEMORY[0x1E4F1C9C8] date];
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v32, (uint64_t)v28, v33);

      id v34 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        BOOL v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "count"));
        long long v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v35;
        __int16 v40 = 2112;
        uint64_t v41 = v36;
        _os_log_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_INFO, "Converted %@ of %@ deleted synced event objects", buf, 0x16u);
      }
    }
  }
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_781(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v32 = *(id *)(*(void *)(a1 + 32) + 56);
  objc_sync_enter(v32);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v2 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v48;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v48 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v47 + 1) + 8 * v4);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = *(void **)(v6 + 32);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_784;
          v46[3] = &unk_1E560F4A0;
          v46[4] = v5;
          v46[5] = v6;
          v46[6] = *(void *)(a1 + 72);
          uint64_t v8 = v46;
          id v9 = v7;
          id v10 = (void *)os_transaction_create();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          long long v53 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v54 = &unk_1E560D978;
          id v55 = v10;
          id v56 = v8;
          id v11 = v10;
          dispatch_async(v9, &block);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v2);
  }

  objc_sync_exit(v32);
  if ([*(id *)(a1 + 40) count]
    && [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obja = *(id *)(a1 + 40);
    uint64_t v12 = [obja countByEnumeratingWithState:&v42 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v43;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(obja);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * v14);
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v17 = *(void **)(v16 + 32);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_3;
          v41[3] = &unk_1E560E960;
          v41[4] = v15;
          v41[5] = v16;
          v41[6] = *(void *)(a1 + 56);
          uint64_t v18 = v41;
          id v19 = v17;
          id v20 = (void *)os_transaction_create();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          long long v53 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v54 = &unk_1E560D978;
          id v55 = v20;
          id v56 = v18;
          id v21 = v20;
          dispatch_async(v19, &block);

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obja countByEnumeratingWithState:&v42 objects:v58 count:16];
      }
      while (v12);
    }
  }
  if ([*(id *)(a1 + 48) count]
    && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id objb = *(id *)(a1 + 48);
    uint64_t v22 = [objb countByEnumeratingWithState:&v37 objects:v57 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(objb);
          }
          uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * v24);
          uint64_t v26 = *(void *)(a1 + 32);
          long long v27 = *(void **)(v26 + 32);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_4;
          v36[3] = &unk_1E560E960;
          v36[4] = v25;
          v36[5] = v26;
          v36[6] = *(void *)(a1 + 64);
          id v28 = v36;
          uint64_t v29 = v27;
          uint64_t v30 = (void *)os_transaction_create();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          long long v53 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v54 = &unk_1E560D978;
          id v55 = v30;
          id v56 = v28;
          id v31 = v30;
          dispatch_async(v29, &block);

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [objb countByEnumeratingWithState:&v37 objects:v57 count:16];
      }
      while (v22);
    }
  }
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_784(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didHaveInsertsAndDeletesWithCount:*(void *)(a1 + 48)];
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didInsertSyncedEvents:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) knowledgeStorage:*(void *)(a1 + 40) didDeleteSyncedEvents:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __62___DKKnowledgeStorage_incrementInsertsAndDeletesObserverCount__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 64);
  if (!v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel__databaseChangedWithNotification_ name:*MEMORY[0x1E4F1BE20] object:0];

    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(v1 + 64);
  }
  *(void *)(v1 + 64) = v2 + 1;
}

void __62___DKKnowledgeStorage_decrementInsertsAndDeletesObserverCount__block_invoke(uint64_t a1)
{
  if (!--*(void *)(*(void *)(a1 + 32) + 64))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x1E4F1BE20] object:0];
  }
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2;
    v10[3] = &unk_1E560F3B0;
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 48);
    [v11 performWithOptions:4 andBlock:v10];

    uint64_t v4 = v11;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v6 = a1 + 56;
    uint64_t v8 = *(void *)(v7 + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v5;

    uint64_t v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_cold_1(v6, v4);
    }
  }
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2;
    v10[3] = &unk_1E560E058;
    id v11 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v12 = v4;
    uint64_t v13 = v5;
    uint64_t v14 = *(void *)(a1 + 48);
    [v11 performWithOptions:4 andBlock:v10];

    uint64_t v6 = v11;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduet.knowledge" code:6 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_cold_1(a1);
    }
  }
}

void __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    LOBYTE(v5) = 1;
    +[_DKCoreDataStorage deleteObjectsInContext:v3 entityName:@"SyncPeer" predicate:*(void *)(a1 + 40) sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:1 includePendingChanges:v5];
  }
  else
  {
    id v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke_cold_1(a1, v4);
    }
  }
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2;
    v7[3] = &unk_1E56103A0;
    uint64_t v8 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 64);
    id v9 = v4;
    uint64_t v12 = v5;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v8 performWithOptions:4 andBlock:v7];

    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_cold_1();
    }
  }
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v10];
  id v5 = v10;
  if ([v4 count] == 1)
  {
    uint64_t v6 = [v4 objectAtIndex:0];
    uint64_t v7 = [v6 value];
    uint64_t v8 = *(void *)(a1[8] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

LABEL_6:
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t v6 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2_cold_1();
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke(id *a1)
{
  id v2 = [a1[4] storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2;
    v7[3] = &unk_1E560EC48;
    uint64_t v8 = v3;
    id v9 = a1[5];
    id v10 = a1[6];
    id v4 = a1[7];
    id v5 = a1[4];
    id v11 = v4;
    id v12 = v5;
    [v8 performWithOptions:4 andBlock:v7];

    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_cold_1();
    }
  }
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"KeyValue" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setDomain:*(void *)(a1 + 40)];
  [v2 setKey:*(void *)(a1 + 48)];
  [v2 setValue:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v8 = 0;
    [v3 save:&v8];
    id v4 = v8;
    if (v4)
    {
      id v5 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v10 = v6;
        __int16 v11 = 2112;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        id v14 = v4;
        _os_log_error_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_ERROR, "Failed to save '%@' in domain '%@': %@", buf, 0x20u);
      }
    }
  }
}

void __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  uint64_t v3 = [v2 managedObjectContextFor:*MEMORY[0x1E4F28358]];

  if (v3)
  {
    LOBYTE(v5) = 1;
    +[_DKCoreDataStorage deleteObjectsInContext:v3 entityName:@"KeyValue" predicate:*(void *)(a1 + 40) sortDescriptors:0 fetchLimit:0x7FFFFFFFFFFFFFFFLL includeSubentities:1 includePendingChanges:v5];
  }
  else
  {
    id v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke_cold_1();
    }
  }
}

void __60___DKKnowledgeStorage_DataMigration__updateToFinalMetadata___block_invoke()
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"serializedInteraction";
  uint64_t v0 = +[_DKIntentMetadataKey serializedInteraction];
  v16[0] = v0;
  v15[1] = @"decayRate";
  uint64_t v1 = +[_CDPortraitMetadataKey decayRate];
  v16[1] = v1;
  v15[2] = @"algorithm";
  id v2 = +[_CDPortraitMetadataKey algorithm];
  v16[2] = v2;
  v15[3] = @"score";
  uint64_t v3 = +[_CDPortraitMetadataKey score];
  v16[3] = v3;
  v15[4] = @"sentimentScore";
  id v4 = +[_CDPortraitMetadataKey sentimentScore];
  v16[4] = v4;
  void v15[5] = @"osBuild";
  uint64_t v5 = +[_CDPortraitMetadataKey osBuild];
  v16[5] = v5;
  v15[6] = @"assetVersion";
  uint64_t v6 = +[_CDPortraitMetadataKey assetVersion];
  v16[6] = v6;
  v15[7] = @"compatibilityVersion";
  uint64_t v7 = +[_CDPortraitMetadataKey compatibilityVersion];
  v16[7] = v7;
  v15[8] = @"name";
  id v8 = +[_CDEntityMetadataKey name];
  v16[8] = v8;
  v15[9] = @"bestLanguage";
  id v9 = +[_CDEntityMetadataKey bestLanguage];
  v16[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];
  __int16 v11 = (void *)updateToFinalMetadata__metadataTranslation;
  updateToFinalMetadata__metadataTranslation = v10;

  v14[0] = @"_DKGlanceLaunchMetadataKey-deviceIdentifier";
  v14[1] = @"_DKSunriseSunsetMetadataKey__previousSunset";
  v14[2] = @"_DKSunriseSunsetMetadataKey__previousSunrise";
  v14[3] = @"_DKSunriseSunsetMetadataKey__currentSunset";
  v14[4] = @"_DKSunriseSunsetMetadataKey__currentSunrise";
  v14[5] = @"_DKSunriseSunsetMetadataKey__nextSunset";
  v14[6] = @"_DKSunriseSunsetMetadataKey__nextSunrise";
  v14[7] = @"_DKSunriseSunsetMetadataKey__isDaylight";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:8];
  __int16 v13 = (void *)updateToFinalMetadata__metadataRemoval;
  updateToFinalMetadata__metadataRemoval = v12;
}

id __98___DKKnowledgeStorage_DataMigration__updateDataBeforeAutoMigrationFromVersion_inStoreAtURL_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  id v4 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  return v4;
}

uint64_t __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = -[_DKKnowledgeStorage copyValueToManagedObject:](a1[6], v4);
      int v12 = 1;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 customMetadata];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        id v8 = (void *)a1[4];
        id v9 = [v5 valueForKey:@"objectAttributeValue"];
        uint64_t v10 = [v8 metadataFromCustomMetadata:v9 cache:a1[5]];

        [v5 setValue:0 forKey:@"objectAttributeValue"];
        __int16 v11 = (void *)[v10 mutableCopy];
        -[_DKKnowledgeStorage updateToFinalMetadata:](a1[6], v11);
        int v12 = [(id)objc_opt_class() copyMetadata:v11 toManagedObject:v5];
      }
      else
      {
        int v12 = 1;
      }
    }
    else
    {
      int v12 = 1;
    }
    uint64_t v15 = [v4 valueForKey:@"metadata"];
    if (!v15)
    {
      int v25 = 1;
      goto LABEL_23;
    }
    int v28 = v12;
    id v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v32, "setWithObjects:", v31, v30, v29, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    id v33 = 0;
    uint64_t v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v22 fromData:v15 error:&v33];
    id v24 = v33;
    if (v24)
    {
      if ([v15 length] != 135)
      {
        int v12 = v28;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke_cold_1();
        }
        int v25 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = (void *)[v23 mutableCopy];
        -[_DKKnowledgeStorage updateToFinalMetadata:](a1[6], v26);
        int v25 = [(id)objc_opt_class() copyMetadata:v26 toManagedObject:v4];

LABEL_21:
        int v12 = v28;
LABEL_22:
        [v4 setValue:0 forKey:@"metadata"];

LABEL_23:
        BOOL v14 = -[_DKKnowledgeStorage copyValueToManagedObject:](a1[6], v4);
        if (!v25)
        {
          uint64_t v13 = 0;
          goto LABEL_26;
        }
LABEL_24:
        uint64_t v13 = v14 & v12;
LABEL_26:

        goto LABEL_27;
      }
    }
    int v25 = 1;
    goto LABEL_21;
  }
  uint64_t v13 = 0;
LABEL_27:

  return v13;
}

void __42___DKKnowledgeStorage__saveObjects_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "saveObjects caught %@", v2, v3, v4, v5, v6);
}

void __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Failed to get event count per stream: %@", v2, v3, v4, v5, v6);
}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "saveHistogram caught %@", v2, v3, v4, v5, v6);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "No changes to fetch", v2, v3, v4, v5, v6);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Ignoring insertion changes: %@", v2, v3, v4, v5, v6);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_3(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v5, v6, "Fetched %@ of %@ insertion changes", v7, v8, v9, v10, 2u);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Transactions: %@", v2, v3, v4, v5, v6);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Missing transactions, unable to fetch local changes", v2, v3, v4, v5, v6);
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_715_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Failed to fetch changes: %@", v2, v3, v4, v5, v6);
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Missing context: device is locked", v2, v3, v4, v5, v6);
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_14_1(a1, a2), "objectID");
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_11_2(&dword_18ECEB000, v5, v6, "Unable to instatiate deletion change set %@");
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_14_1(a1, a2), "objectID");
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_11_2(&dword_18ECEB000, v5, v6, "Unable to instatiate addition change set %@");
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_740_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Missing transactions, unable to fetch sync changes", v2, v3, v4, v5, v6);
}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "saveChangesForSync caught %@", v2, v3, v4, v5, v6);
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "error fetching the results: %@", v2, v3, v4, v5, v6);
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Skipping sync down from the cloud, cloud currently unavailable", v2, v3, v4, v5, v6);
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "Failed to sync down from the cloud: %@", v5);
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Skipping sync up to the cloud, cloud currently unavailable", v2, v3, v4, v5, v6);
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "Failed to sync up to the cloud: %@", v5);
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "Notified of %@ synced events deleted", v4, v5, v6, v7, v8);
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "Notified of %@ synced event(s) inserted", v4, v5, v6, v7, v8);
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch sync peers: %@", (uint8_t *)&v3, 0xCu);
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch sync peers: %@", v1, 0xCu);
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v2, v3, "Failed to save sync peer '%@': %@", v4, v5, v6, v7, v8);
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_1(id *a1)
{
  uint64_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v2, v3, "Failed to save sync peer '%@': %@", v4, v5, v6, v7, v8);
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "saveSyncPeer caught %@", v1, 0xCu);
}

void __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 48) identifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failed to remove sync peer '%@' due to unavailable store", v4, 0xCu);
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, v0, v1, "Failed to fetch '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_13();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_ERROR, "Failed to fetch '%@' in domain '%@': %@", v3, 0x20u);
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, v0, v1, "Failed to save '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_FAULT, "setKeyValueObject caught %@", (uint8_t *)&v2, 0xCu);
}

void __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_8(&dword_18ECEB000, v0, v1, "Failed to remove '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
}

void __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Error unarchiving object %@", v1, v2, v3, v4, v5);
}

@end