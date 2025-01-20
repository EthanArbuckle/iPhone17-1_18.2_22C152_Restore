@interface HDCloudSyncModifyRecordZonesOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 recordZonesToSave:(id)a5 recordZoneIDsToDelete:(id)a6;
- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordZonesToSave:(id)a6 recordZoneIDsToDelete:(id)a7;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (void)_limitExceededForSavingRecordZones:(id)a3 deletingRecordZoneIDs:(id)a4 error:(id)a5;
- (void)_saveRecordZones:(id)a3 deleteRecordZoneIDs:(id)a4;
- (void)main;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncModifyRecordZonesOperation

- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 recordZonesToSave:(id)a5 recordZoneIDsToDelete:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 repository];
  v15 = [v14 profileIdentifier];
  v16 = HDDatabaseForContainer(v12, v15);
  v17 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:](self, "initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:", v13, v12, [v16 databaseScope], v11, v10);

  return v17;
}

- (HDCloudSyncModifyRecordZonesOperation)initWithConfiguration:(id)a3 container:(id)a4 scope:(int64_t)a5 recordZonesToSave:(id)a6 recordZoneIDsToDelete:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDCloudSyncModifyRecordZonesOperation;
  v16 = [(HDCloudSyncOperation *)&v23 initWithConfiguration:a3 cloudState:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a4);
    uint64_t v18 = [v13 databaseWithDatabaseScope:a5];
    database = v17->_database;
    v17->_database = (CKDatabase *)v18;

    objc_storeStrong((id *)&v17->_recordZonesToSave, a6);
    objc_storeStrong((id *)&v17->_recordZoneIDsToDelete, a7);
    v20 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v17->_taskGroup;
    v17->_taskGroup = v20;

    [(HDSynchronousTaskGroup *)v17->_taskGroup setDelegate:v17];
  }

  return v17;
}

- (void)main
{
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)_saveRecordZones:(id)a3 deleteRecordZoneIDs:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  uint64_t v8 = [v6 count];
  uint64_t v9 = [v7 count] + v8;
  if (!v9)
  {
LABEL_10:
    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
    goto LABEL_14;
  }
  if (v9 >= 400)
  {
    if (v6) {
      id v10 = v6;
    }
    else {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    if (v7) {
      id v11 = v7;
    }
    else {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F19C40];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Synthesized error for preemptive split.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v15 = [v12 errorWithDomain:v13 code:27 userInfo:v14];
    [(HDCloudSyncModifyRecordZonesOperation *)self _limitExceededForSavingRecordZones:v10 deletingRecordZoneIDs:v11 error:v15];

    goto LABEL_10;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    *(_DWORD *)buf = 138543874;
    v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = [v6 count];
    __int16 v30 = 2048;
    uint64_t v31 = [v7 count];
    _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld zones, deleting %ld zones", buf, 0x20u);
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A180]) initWithRecordZonesToSave:v6 recordZoneIDsToDelete:v7];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__HDCloudSyncModifyRecordZonesOperation__saveRecordZones_deleteRecordZoneIDs___block_invoke;
  v23[3] = &unk_1E62F6688;
  v23[4] = self;
  id v24 = v6;
  id v25 = v7;
  [v18 setModifyRecordZonesCompletionBlock:v23];
  v19 = [(HDCloudSyncOperation *)self configuration];
  v20 = [v19 cachedCloudState];
  objc_msgSend(v20, "setOperationCountForAnalytics:", objc_msgSend(v20, "operationCountForAnalytics") + 1);

  v21 = [(HDCloudSyncOperation *)self configuration];
  v22 = [v21 operationGroup];
  [v18 setGroup:v22];

  [(CKDatabase *)self->_database hd_addOperation:v18];
LABEL_14:
}

void __78__HDCloudSyncModifyRecordZonesOperation__saveRecordZones_deleteRecordZoneIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    id v10 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(a1 + 32);
      v40 = *(void **)(v39 + 104);
      v41 = v10;
      v42 = [v40 containerIdentifier];
      [*(id *)(*(void *)(a1 + 32) + 112) databaseScope];
      v43 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544130;
      uint64_t v65 = v39;
      __int16 v66 = 2114;
      v67 = v42;
      __int16 v68 = 2114;
      v69 = v43;
      __int16 v70 = 2114;
      id v71 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@ Failed to modify record zones in container %{public}@, database %{public}@, error %{public}@", buf, 0x2Au);
    }
    if (objc_msgSend(v9, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 27))
    {
      [*(id *)(a1 + 32) _limitExceededForSavingRecordZones:*(void *)(a1 + 40) deletingRecordZoneIDs:*(void *)(a1 + 48) error:v9];
      [*(id *)(*(void *)(a1 + 32) + 120) finishTask];
      goto LABEL_31;
    }
    uint64_t v11 = objc_msgSend(v9, "hd_errorSurfacingFatalCloudKitPartialFailure");
    if (v11)
    {
      id v12 = (void *)v11;
      [*(id *)(*(void *)(a1 + 32) + 120) failTaskWithError:v11];

      goto LABEL_31;
    }
  }
  id v44 = v9;
  id v45 = v7;
  v46 = v8;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v50 = *(void *)v59;
    while (2)
    {
      uint64_t v16 = 0;
      v17 = v15;
      do
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v58 + 1) + 8 * v16);
        v19 = [HDCloudSyncZoneIdentifier alloc];
        v20 = [v18 zoneID];
        v21 = [*(id *)(*(void *)(a1 + 32) + 104) containerIdentifier];
        id v22 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v19, "initForZone:container:scope:", v20, v21, [*(id *)(*(void *)(a1 + 32) + 112) databaseScope]);

        objc_super v23 = [*(id *)(a1 + 32) configuration];
        id v24 = [v23 cachedCloudState];
        id v57 = v17;
        int v25 = [v24 addZoneWithIdentifier:v22 error:&v57];
        id v15 = v57;

        if (!v25)
        {
          [*(id *)(*(void *)(a1 + 32) + 120) failTaskWithError:v15];

          v26 = obj;
LABEL_29:

          goto LABEL_30;
        }

        ++v16;
        v17 = v15;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v47 = v46;
  uint64_t v51 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v51)
  {
    id obja = *(id *)v54;
    while (2)
    {
      uint64_t v27 = 0;
      __int16 v28 = v15;
      do
      {
        if (*(id *)v54 != obja) {
          objc_enumerationMutation(v47);
        }
        uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * v27);
        __int16 v30 = [HDCloudSyncZoneIdentifier alloc];
        uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 104) containerIdentifier];
        id v32 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v30, "initForZone:container:scope:", v29, v31, [*(id *)(*(void *)(a1 + 32) + 112) databaseScope]);

        v33 = [HDCloudSyncCachedZone alloc];
        v34 = [*(id *)(a1 + 32) configuration];
        v35 = [v34 repository];
        v36 = [*(id *)(a1 + 32) configuration];
        v37 = [v36 accessibilityAssertion];
        id v38 = [(HDCloudSyncCachedZone *)v33 initForZoneIdentifier:v32 repository:v35 accessibilityAssertion:v37];

        id v52 = v28;
        LODWORD(v36) = [v38 deleteZoneWithError:&v52];
        id v15 = v52;

        if (!v36)
        {
          [*(id *)(*(void *)(a1 + 32) + 120) failTaskWithError:v15];

          v26 = v47;
          goto LABEL_29;
        }

        ++v27;
        __int16 v28 = v15;
      }
      while (v51 != v27);
      uint64_t v51 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v51) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 120) finishTask];
LABEL_30:

  id v7 = v45;
  id v8 = v46;
  id v9 = v44;
LABEL_31:
}

- (void)_limitExceededForSavingRecordZones:(id)a3 deletingRecordZoneIDs:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  if ((unint64_t)([v9 count] + v11) > 1)
  {
    if ([v8 count] && objc_msgSend(v9, "count"))
    {
      [(HDCloudSyncModifyRecordZonesOperation *)self _saveRecordZones:v8 deleteRecordZoneIDs:0];
      [(HDCloudSyncModifyRecordZonesOperation *)self _saveRecordZones:0 deleteRecordZoneIDs:v9];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        int v21 = 138543874;
        id v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = [v8 count];
        __int16 v25 = 2048;
        uint64_t v26 = [v9 count];
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Received limit exceeded error; retrying by splitting record zone request in half and re-fetching ("
          "%ld zone saves, %ld zone deletions).",
          (uint8_t *)&v21,
          0x20u);
      }
      id v15 = objc_msgSend(v8, "hk_splitWithBucketCount:", 2);
      uint64_t v16 = objc_msgSend(v9, "hk_splitWithBucketCount:", 2);
      v17 = [v15 objectAtIndexedSubscript:0];
      uint64_t v18 = [v16 objectAtIndexedSubscript:0];
      [(HDCloudSyncModifyRecordZonesOperation *)self _saveRecordZones:v17 deleteRecordZoneIDs:v18];

      v19 = [v15 objectAtIndexedSubscript:1];
      v20 = [v16 objectAtIndexedSubscript:1];
      [(HDCloudSyncModifyRecordZonesOperation *)self _saveRecordZones:v19 deleteRecordZoneIDs:v20];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = self;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Received limit exceeded error for a single record zone modification. This is unexpected.", (uint8_t *)&v21, 0xCu);
    }
    [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
    [(HDSynchronousTaskGroup *)self->_taskGroup failTaskWithError:v10];
  }
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end