@interface HDCloudSyncModifyRecordsOperation
+ (BOOL)shouldLogAtOperationStart;
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (BOOL)permitNonAtomicZoneSaves;
- (BOOL)treatAnyErrorAsFatal;
- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6;
- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordsToSave:(id)a6 recordIDsToDelete:(id)a7;
- (NSArray)deletedRecordIDs;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSArray)savedRecords;
- (int64_t)savePolicy;
- (void)_limitExceededSavingRecords:(void *)a3 deletingRecordIDs:(void *)a4 error:;
- (void)_saveRecords:(void *)a3 deleteRecords:;
- (void)main;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
- (void)setPermitNonAtomicZoneSaves:(BOOL)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
- (void)setTreatAnyErrorAsFatal:(BOOL)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncModifyRecordsOperation

- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 repository];
  v15 = [v14 profileIdentifier];
  v16 = HDDatabaseForContainer(v12, v15);
  v17 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:](self, "initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:", v13, v12, [v16 databaseScope], v11, v10);

  return v17;
}

- (HDCloudSyncModifyRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordsToSave:(id)a6 recordIDsToDelete:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDCloudSyncModifyRecordsOperation;
  v16 = [(HDCloudSyncOperation *)&v27 initWithConfiguration:a3 cloudState:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a4);
    uint64_t v18 = [v13 databaseWithDatabaseScope:a5];
    database = v17->_database;
    v17->_database = (CKDatabase *)v18;

    objc_storeStrong((id *)&v17->_recordsToSave, a6);
    objc_storeStrong((id *)&v17->_recordIDsToDelete, a7);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    savedRecords = v17->_savedRecords;
    v17->_savedRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedRecordIDs = v17->_deletedRecordIDs;
    v17->_deletedRecordIDs = v22;

    v17->_savePolicy = 0;
    v24 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v17->_taskGroup;
    v17->_taskGroup = v24;

    [(HDSynchronousTaskGroup *)v17->_taskGroup setDelegate:v17];
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

- (void)main
{
}

- (void)_saveRecords:(void *)a3 deleteRecords:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = [v6 count] + v7;
    if (v8)
    {
      if (v8 >= 375)
      {
        objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_290_0);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          id v10 = objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_293_0);
          id v11 = v10;
          if (v9)
          {
            uint64_t v12 = [v9 setByAddingObjectsFromSet:v10];

            id v9 = (id)v12;
          }
          else
          {
            id v9 = v10;
          }
        }
        if ((unint64_t)[v9 count] >= 2)
        {
          v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = *MEMORY[0x1E4F19C40];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v33[0] = @"Synthesized error for preemptive split.";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
          v22 = [v19 errorWithDomain:v20 code:27 userInfo:v21];
          -[HDCloudSyncModifyRecordsOperation _limitExceededSavingRecords:deletingRecordIDs:error:]((id *)a1, v5, v6, v22);

LABEL_18:
          goto LABEL_19;
        }
      }
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = a1;
        __int16 v28 = 2048;
        uint64_t v29 = [v5 count];
        __int16 v30 = 2048;
        uint64_t v31 = [v6 count];
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld records and deleting %ld records.", buf, 0x20u);
      }
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v5 recordIDsToDelete:v6];
      if ([(id)a1 markAsParticipantNeedsNewInvitationToken]) {
        objc_msgSend(v9, "setMarkAsParticipantNeedsNewInvitationToken:", objc_msgSend((id)a1, "markAsParticipantNeedsNewInvitationToken"));
      }
      [v9 setSavePolicy:*(void *)(a1 + 168)];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_300;
      v23[3] = &unk_1E62F6688;
      v23[4] = a1;
      id v24 = v5;
      id v25 = v6;
      [v9 setModifyRecordsCompletionBlock:v23];
      id v15 = [(id)a1 configuration];
      v16 = [v15 cachedCloudState];
      objc_msgSend(v16, "setOperationCountForAnalytics:", objc_msgSend(v16, "operationCountForAnalytics") + 1);

      v17 = [(id)a1 configuration];
      uint64_t v18 = [v17 operationGroup];
      [v9 setGroup:v18];

      [*(id *)(a1 + 136) beginTask];
      objc_msgSend(*(id *)(a1 + 112), "hd_addOperation:", v9);

      goto LABEL_18;
    }
    [*(id *)(a1 + 136) beginTask];
    [*(id *)(a1 + 136) finishTask];
  }
LABEL_19:
}

void __57__HDCloudSyncModifyRecordsOperation__recordsSplitByZone___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void, void))
{
  uint64_t v7 = a4;
  id v8 = a2;
  id v9 = (id)[a3 copy];
  ((void (**)(void, id, id))a4)[2](v7, v8, v9);
}

void __59__HDCloudSyncModifyRecordsOperation__recordIDsSplitByZone___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void, void))
{
  uint64_t v7 = a4;
  id v8 = a2;
  id v9 = (id)[a3 copy];
  ((void (**)(void, id, id))a4)[2](v7, v8, v9);
}

- (void)_limitExceededSavingRecords:(void *)a3 deletingRecordIDs:(void *)a4 error:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v75 = a4;
  v76 = a1;
  if (a1)
  {
    id v9 = v7;
    id v73 = v7;
    id v74 = v8;
    if (v9)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v12 = v9;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v81 objects:buf count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v82 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            v19 = [v18 recordID];
            uint64_t v20 = [v19 zoneID];

            id v21 = [v11 objectForKeyedSubscript:v20];
            if (!v21)
            {
              id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v11 setObject:v21 forKeyedSubscript:v20];
            }
            [v21 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v81 objects:buf count:16];
        }
        while (v15);
      }

      id v10 = objc_msgSend(v11, "hk_map:", &__block_literal_global_32);

      id v9 = v12;
      id v7 = v73;
    }
    else
    {
      id v10 = 0;
    }

    id v22 = v8;
    if (v22)
    {
      id v71 = v9;
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v25 = v22;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:buf count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v82 != v28) {
              objc_enumerationMutation(v25);
            }
            __int16 v30 = *(void **)(*((void *)&v81 + 1) + 8 * j);
            uint64_t v31 = [v30 zoneID];
            id v32 = [v24 objectForKeyedSubscript:v31];
            if (!v32)
            {
              id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v24 setObject:v32 forKeyedSubscript:v31];
            }
            [v32 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v81 objects:buf count:16];
        }
        while (v27);
      }

      v23 = objc_msgSend(v24, "hk_map:", &__block_literal_global_281);

      id v7 = v73;
      id v8 = v74;
      id v9 = v71;
    }
    else
    {
      v23 = 0;
    }

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v34 = [v10 allKeys];
    [v33 addObjectsFromArray:v34];

    v35 = [v23 allKeys];
    [v33 addObjectsFromArray:v35];

    if ([v33 count] == 1)
    {
      id v36 = v9;
      id v37 = v22;
      id v38 = v75;
      uint64_t v39 = [v36 count];
      if ((unint64_t)([v37 count] + v39) > 1)
      {
        id v72 = v38;
        v52 = [v36 firstObject];
        v53 = [v52 recordID];
        v54 = [v53 zoneID];
        v55 = v54;
        if (v54)
        {
          id v70 = v54;
        }
        else
        {
          [v37 firstObject];
          id v69 = v37;
          v57 = id v56 = v8;
          id v70 = [v57 zoneID];

          id v8 = v56;
          id v37 = v69;
        }

        if ([v76 permitNonAtomicZoneSaves])
        {
          id v38 = v72;
          if ([v36 count] && objc_msgSend(v37, "count"))
          {
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v36, 0);
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, 0, v37);
          }
          else
          {
            _HKInitializeLogging();
            v59 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v87 = v76;
              __int16 v88 = 2114;
              uint64_t v89 = (uint64_t)v70;
              _os_log_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting into multiple operations for zone %{public}@.",
                buf,
                0x16u);
            }
            v60 = objc_msgSend(v36, "hk_splitWithBucketCount:", 2);
            v61 = objc_msgSend(v37, "hk_splitWithBucketCount:", 2);
            v62 = [v60 objectAtIndexedSubscript:0];
            v63 = [v61 objectAtIndexedSubscript:0];
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v62, v63);

            v64 = [v60 objectAtIndexedSubscript:1];
            v65 = [v61 objectAtIndexedSubscript:1];
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v64, v65);

            id v8 = v74;
            id v38 = v72;
          }
        }
        else
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E4F29FA8];
          id v38 = v72;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v87 = v76;
            __int16 v88 = 2114;
            uint64_t v89 = (uint64_t)v70;
            _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Limit exceeded when syncing to a single zone (%{public}@), but non-atomic saves are not permitted.", buf, 0x16u);
          }
          [v76[17] beginTask];
          [v76[17] failTaskWithError:v72];
        }
      }
      else
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          v66 = v40;
          uint64_t v67 = [v36 count];
          uint64_t v68 = [v37 count];
          *(_DWORD *)buf = 138544130;
          v87 = v76;
          __int16 v88 = 2048;
          uint64_t v89 = v67;
          __int16 v90 = 2048;
          uint64_t v91 = v68;
          __int16 v92 = 2114;
          id v93 = v38;
          _os_log_fault_impl(&dword_1BCB7D000, v66, OS_LOG_TYPE_FAULT, "%{public}@: Limit exceeded when we've already dropped down to minimal records per zone (%ld, %ld): %{public}@.", buf, 0x2Au);
        }
        [v76[17] beginTask];
        [v76[17] failTaskWithError:v38];
      }
    }
    else
    {
      _HKInitializeLogging();
      v41 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        uint64_t v43 = [v33 count];
        *(_DWORD *)buf = 138543618;
        v87 = v76;
        __int16 v88 = 2048;
        uint64_t v89 = v43;
        _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying with one operation per zone (%ld zones).",
          buf,
          0x16u);
      }
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v36 = v33;
      uint64_t v44 = [v36 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        id v46 = v7;
        uint64_t v47 = *(void *)v78;
        do
        {
          for (uint64_t k = 0; k != v45; ++k)
          {
            if (*(void *)v78 != v47) {
              objc_enumerationMutation(v36);
            }
            uint64_t v49 = *(void *)(*((void *)&v77 + 1) + 8 * k);
            v50 = [v10 objectForKeyedSubscript:v49];
            v51 = [v23 objectForKeyedSubscript:v49];
            -[HDCloudSyncModifyRecordsOperation _saveRecords:deleteRecords:](v76, v50, v51);
          }
          uint64_t v45 = [v36 countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v45);
        id v7 = v46;
        id v8 = v74;
      }
    }
  }
}

uint64_t __100__HDCloudSyncModifyRecordsOperation__didFinishSavingRecords_deletingRecordIDs_operationError_error___block_invoke()
{
  return 0;
}

id __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 recordID];
  v3 = [v2 zoneID];

  return v3;
}

uint64_t __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

void __64__HDCloudSyncModifyRecordsOperation__saveRecords_deleteRecords___block_invoke_300(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  id v11 = (void *)MEMORY[0x1E4F19C40];
  if (v9 && objc_msgSend(v9, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 27))
  {
    -[HDCloudSyncModifyRecordsOperation _limitExceededSavingRecords:deletingRecordIDs:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v10);
    [*(id *)(*(void *)(a1 + 32) + 136) finishTask];
    goto LABEL_54;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v99 = 0;
  id v90 = v7;
  id v89 = v8;
  id v91 = v10;
  if (!v12) {
    goto LABEL_28;
  }
  if (!v10) {
    goto LABEL_29;
  }
  if (objc_msgSend(v91, "hk_isErrorInDomain:code:", *v11, 2))
  {
    uint64_t v81 = a1;
    long long v83 = v10;
    id v85 = v7;
    id v87 = v8;
    id v13 = [v91 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    obuint64_t j = v14;
    id v94 = (id)[obj countByEnumeratingWithState:&v108 objects:v121 count:16];
    if (v94)
    {
      id v92 = *(id *)v109;
      do
      {
        for (uint64_t i = 0; i != v94; uint64_t i = (char *)i + 1)
        {
          if (*(id *)v109 != v92) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v17 = [obj objectForKeyedSubscript:v16];
          _HKInitializeLogging();
          uint64_t v18 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *(void **)(v12 + 104);
            __int16 v30 = v18;
            uint64_t v31 = [v29 containerIdentifier];
            [*(id *)(v12 + 112) databaseScope];
            id v32 = CKDatabaseScopeString();
            *(_DWORD *)buf = 138544130;
            uint64_t v114 = v12;
            __int16 v115 = 2114;
            v116 = v31;
            __int16 v117 = 2114;
            v118 = v32;
            __int16 v119 = 2114;
            id v120 = v91;
            _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify records in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);
          }
          v19 = [HDCloudSyncZoneIdentifier alloc];
          uint64_t v20 = [v16 zoneID];
          id v21 = [*(id *)(v12 + 104) containerIdentifier];
          id v22 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v19, "initForZone:container:scope:", v20, v21, [*(id *)(v12 + 112) databaseScope]);

          v23 = [HDCloudSyncCachedZone alloc];
          id v24 = [(id)v12 configuration];
          id v25 = [v24 repository];
          uint64_t v26 = [(id)v12 configuration];
          uint64_t v27 = [v26 accessibilityAssertion];
          id v28 = [(HDCloudSyncCachedZone *)v23 initForZoneIdentifier:v22 repository:v25 accessibilityAssertion:v27];

          [v28 handleCloudError:v17 operation:v12 container:*(void *)(v12 + 104) database:*(void *)(v12 + 112)];
        }
        id v94 = (id)[obj countByEnumeratingWithState:&v108 objects:v121 count:16];
      }
      while (v94);
    }

    id v7 = v85;
    id v8 = v87;
    a1 = v81;
    id v10 = v83;
  }
  _HKInitializeLogging();
  id v33 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    id v72 = *(void **)(v12 + 104);
    id v73 = v33;
    id v74 = [v72 containerIdentifier];
    [*(id *)(v12 + 112) databaseScope];
    id v75 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138544130;
    uint64_t v114 = v12;
    __int16 v115 = 2114;
    v116 = v74;
    __int16 v117 = 2114;
    v118 = v75;
    __int16 v119 = 2114;
    id v120 = v91;
    _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify records in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);
  }
  v34 = objc_msgSend(v91, "hd_errorSurfacingFatalCloudKitPartialFailure");
  v35 = v34;
  if (!v34)
  {
    if ([(id)v12 treatAnyErrorAsFatal])
    {
      _HKInitializeLogging();
      id v36 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        id v76 = v7;
        long long v77 = *(void **)(v12 + 104);
        long long v78 = v36;
        long long v79 = [v77 containerIdentifier];
        [*(id *)(v12 + 112) databaseScope];
        long long v80 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138544130;
        uint64_t v114 = v12;
        __int16 v115 = 2114;
        v116 = v79;
        __int16 v117 = 2114;
        v118 = v80;
        __int16 v119 = 2114;
        id v120 = v91;
        _os_log_error_impl(&dword_1BCB7D000, v78, OS_LOG_TYPE_ERROR, "%{public}@ Treating error as fatal for %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);

        id v7 = v76;
      }
      id v37 = objc_msgSend(v91, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_287_0);
      id v38 = v37;
      if (!v37) {
        id v37 = v91;
      }
      id v99 = v37;

      goto LABEL_27;
    }
LABEL_29:
    uint64_t v82 = a1;
    long long v84 = v10;
    id v86 = v7;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v95 = v90;
    uint64_t v40 = [v95 countByEnumeratingWithState:&v104 objects:buf count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      id obja = *(id *)v105;
      id v88 = v8;
      while (2)
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(id *)v105 != obja) {
            objc_enumerationMutation(v95);
          }
          uint64_t v43 = *(void **)(*((void *)&v104 + 1) + 8 * j);
          uint64_t v44 = [HDCloudSyncZoneIdentifier alloc];
          uint64_t v45 = [v43 recordID];
          id v46 = [v45 zoneID];
          uint64_t v47 = [*(id *)(v12 + 104) containerIdentifier];
          id v48 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v44, "initForZone:container:scope:", v46, v47, [*(id *)(v12 + 112) databaseScope]);

          uint64_t v49 = [HDCloudSyncCachedZone alloc];
          uint64_t v50 = [(id)v12 configuration];
          v51 = [(id)v50 repository];
          v52 = [(id)v12 configuration];
          v53 = [v52 accessibilityAssertion];
          id v54 = [(HDCloudSyncCachedZone *)v49 initForZoneIdentifier:v48 repository:v51 accessibilityAssertion:v53];

          LOBYTE(v50) = [v54 addRecord:v43 error:&v99];
          if ((v50 & 1) == 0)
          {
            id v69 = v95;
LABEL_48:

            int v39 = 0;
            id v7 = v86;
            id v8 = v88;
            goto LABEL_49;
          }
        }
        uint64_t v41 = [v95 countByEnumeratingWithState:&v104 objects:buf count:16];
        id v8 = v88;
        if (v41) {
          continue;
        }
        break;
      }
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v93 = v89;
    uint64_t v55 = [v93 countByEnumeratingWithState:&v100 objects:v112 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      id objb = *(id *)v101;
      id v88 = v8;
      while (2)
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(id *)v101 != objb) {
            objc_enumerationMutation(v93);
          }
          v58 = *(void **)(*((void *)&v100 + 1) + 8 * k);
          v59 = [HDCloudSyncZoneIdentifier alloc];
          v60 = [v58 zoneID];
          v61 = [*(id *)(v12 + 104) containerIdentifier];
          id v62 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v59, "initForZone:container:scope:", v60, v61, [*(id *)(v12 + 112) databaseScope]);

          v63 = [HDCloudSyncCachedZone alloc];
          uint64_t v64 = [(id)v12 configuration];
          v65 = [(id)v64 repository];
          v66 = [(id)v12 configuration];
          uint64_t v67 = [v66 accessibilityAssertion];
          id v68 = [(HDCloudSyncCachedZone *)v63 initForZoneIdentifier:v62 repository:v65 accessibilityAssertion:v67];

          LOBYTE(v64) = [v68 deleteRecordID:v58 error:&v99];
          if ((v64 & 1) == 0)
          {
            id v69 = v93;
            goto LABEL_48;
          }
        }
        uint64_t v56 = [v93 countByEnumeratingWithState:&v100 objects:v112 count:16];
        id v8 = v88;
        if (v56) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 144));
    [*(id *)(v12 + 120) addObjectsFromArray:v95];
    [*(id *)(v12 + 128) addObjectsFromArray:v93];
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 144));
    int v39 = 1;
    id v7 = v86;
LABEL_49:
    a1 = v82;
    id v10 = v84;
    goto LABEL_50;
  }
  id v99 = v34;
LABEL_27:

LABEL_28:
  int v39 = 0;
LABEL_50:

  id v70 = v99;
  id v71 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v39) {
    [v71 finishTask];
  }
  else {
    [v71 failTaskWithError:v70];
  }

LABEL_54:
}

- (NSArray)savedRecords
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableArray *)self->_savedRecords copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSArray)deletedRecordIDs
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableArray *)self->_deletedRecordIDs copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (BOOL)permitNonAtomicZoneSaves
{
  return self->_permitNonAtomicZoneSaves;
}

- (void)setPermitNonAtomicZoneSaves:(BOOL)a3
{
  self->_permitNonAtomicZoneSaves = a3;
}

- (BOOL)treatAnyErrorAsFatal
{
  return self->_treatAnyErrorAsFatal;
}

- (void)setTreatAnyErrorAsFatal:(BOOL)a3
{
  self->_treatAnyErrorAsFatal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end