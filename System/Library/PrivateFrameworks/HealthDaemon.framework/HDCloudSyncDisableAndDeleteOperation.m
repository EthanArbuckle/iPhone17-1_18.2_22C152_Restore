@interface HDCloudSyncDisableAndDeleteOperation
- (BOOL)_isSecureSecondaryContainer:(id)a3;
- (id)_createZonesOperationForContainer:(id)a3;
- (id)_deleteUnifiedZoneRecordsOperationForContainer:(id)a3 zones:(id)a4;
- (id)_deleteZonesOperationForContainer:(id)a3 zones:(id)a4;
- (id)_leaveSharesOperationForContainer:(id)a3;
- (void)main;
@end

@implementation HDCloudSyncDisableAndDeleteOperation

- (void)main
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v3 = [HDCloudSyncCompoundOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v51 = [(HDCloudSyncCompoundOperation *)v3 initWithConfiguration:v4 cloudState:0 name:@"Disable & Delete" continueOnSubOperationError:0];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 allCKContainers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v58;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v57 + 1) + 8 * v11);
        v13 = [(HDCloudSyncOperation *)self configuration];
        v14 = [v13 repository];
        v15 = [v14 profileIdentifier];
        v16 = HDDatabaseForContainer(v12, v15);

        uint64_t v17 = [v16 databaseScope];
        if (v17 == 2)
        {
          v18 = [(HDCloudSyncDisableAndDeleteOperation *)self _createZonesOperationForContainer:v12];
          [(HDCloudSyncCompoundOperation *)v51 addOperation:v18 transitionHandler:0];
        }
        else
        {
          if (v17 != 1) {
            goto LABEL_11;
          }
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"HDCloudSyncDisableAndDeleteOperation.m" lineNumber:68 description:@"Public database scope not handled for disable and delete."];
        }

LABEL_11:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v9);
  }

  [(HDCloudSyncCompoundOperation *)v51 addOperationOfClass:objc_opt_class() transitionHandler:0];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v19 = [(HDCloudSyncOperation *)self configuration];
  v20 = [v19 repository];
  v21 = [v20 allCKContainers];

  id obj = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v49 = *(void *)v54;
    *(void *)&long long v23 = 138543618;
    long long v47 = v23;
LABEL_15:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v54 != v49) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v53 + 1) + 8 * v25);
      v27 = [(HDCloudSyncOperation *)self configuration];
      v28 = [v27 repository];
      v29 = [v28 profileIdentifier];
      v30 = HDDatabaseForContainer(v26, v29);

      v31 = [(HDCloudSyncOperation *)self configuration];
      v32 = [v31 cachedCloudState];
      v33 = [v26 containerIdentifier];
      id v52 = 0;
      v34 = [v32 zonesForContainerID:v33 error:&v52];
      id v35 = v52;

      if (!v34 && v35)
      {
        _HKInitializeLogging();
        v44 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v45 = v44;
          v46 = [v26 containerIdentifier];
          *(_DWORD *)buf = 138543874;
          v62 = self;
          __int16 v63 = 2114;
          v64 = v46;
          __int16 v65 = 2114;
          id v66 = v35;
          _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zones for container %{public}@, %{public}@", buf, 0x20u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v35];

        v43 = v51;
        goto LABEL_37;
      }
      if (v34)
      {
        uint64_t v36 = [v30 databaseScope];
        switch(v36)
        {
          case 3:
            v37 = [(HDCloudSyncDisableAndDeleteOperation *)self _leaveSharesOperationForContainer:v26];
            v40 = v51;
LABEL_29:
            [(HDCloudSyncCompoundOperation *)v40 addOperation:v37 transitionHandler:0];
            goto LABEL_30;
          case 2:
            v41 = [(HDCloudSyncDisableAndDeleteOperation *)self _deleteZonesOperationForContainer:v26 zones:v34];
            [(HDCloudSyncCompoundOperation *)v51 addOperation:v41 transitionHandler:0];

            v37 = [(HDCloudSyncDisableAndDeleteOperation *)self _deleteUnifiedZoneRecordsOperationForContainer:v26 zones:v34];
            v40 = v51;
            goto LABEL_29;
          case 1:
            v37 = [MEMORY[0x1E4F28B00] currentHandler];
            [v37 handleFailureInMethod:a2 object:self file:@"HDCloudSyncDisableAndDeleteOperation.m" lineNumber:100 description:@"Public database scope not handled for disable and delete."];
LABEL_30:

            break;
        }
      }
      else
      {
        _HKInitializeLogging();
        v38 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          v37 = v38;
          v39 = [v26 containerIdentifier];
          *(_DWORD *)buf = v47;
          v62 = self;
          __int16 v63 = 2114;
          v64 = v39;
          _os_log_debug_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found for container %{public}@.", buf, 0x16u);

          goto LABEL_30;
        }
      }

      if (v24 == ++v25)
      {
        uint64_t v24 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v24) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  v42 = self;
  v43 = v51;
  [(HDCloudSyncOperation *)v42 delegateToOperation:v51];
LABEL_37:
}

- (BOOL)_isSecureSecondaryContainer:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerIdentifier];
  if ([v5 isEqualToString:@"com.apple.health.sync.secure"])
  {
    v6 = [v4 containerIdentifier];
    v7 = [(HDCloudSyncOperation *)self configuration];
    uint64_t v8 = [v7 repository];
    uint64_t v9 = [v8 primaryCKContainer];
    uint64_t v10 = [v9 containerIdentifier];
    int v11 = [v6 isEqualToString:v10] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)_createZonesOperationForContainer:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1A310];
  id v26 = a3;
  id v5 = [v4 alloc];
  v6 = (void *)MEMORY[0x1E4F1A320];
  uint64_t v25 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v24 = [v25 repository];
  v7 = [v24 syncCircleIdentifier];
  uint64_t v8 = objc_msgSend(v6, "hd_masterZoneIDForSyncCircleIdentifier:", v7);
  uint64_t v9 = (void *)[v5 initWithZoneID:v8];
  v27[0] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F1A310]);
  int v11 = (void *)MEMORY[0x1E4F1A320];
  v12 = [(HDCloudSyncOperation *)self configuration];
  v13 = [v12 repository];
  v14 = [v13 syncCircleIdentifier];
  v15 = objc_msgSend(v11, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v14);
  v16 = (void *)[v10 initWithZoneID:v15];
  v27[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  v18 = [HDCloudSyncCreateZonesOperation alloc];
  v19 = [(HDCloudSyncOperation *)self configuration];
  v20 = [(HDCloudSyncCreateZonesOperation *)v18 initWithConfiguration:v19 cloudState:0 zones:v17 container:v26];

  LOBYTE(self) = [(HDCloudSyncDisableAndDeleteOperation *)self _isSecureSecondaryContainer:v26];
  if (self)
  {
    v21 = [(HDCloudSyncOperation *)v20 operationIgnoringErrors];
  }
  else
  {
    v21 = v20;
  }
  uint64_t v22 = v21;

  return v22;
}

- (id)_deleteZonesOperationForContainer:(id)a3 zones:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HDCloudSyncDeleteZonesOperation alloc];
  uint64_t v9 = [(HDCloudSyncOperation *)self configuration];
  id v10 = [(HDCloudSyncDeleteZonesOperation *)v8 initWithConfiguration:v9 cloudState:0];

  int v11 = objc_msgSend(v6, "hk_map:", &__block_literal_global_174);

  [(HDCloudSyncDeleteZonesOperation *)v10 setZonesToDelete:v11];
  LOBYTE(self) = [(HDCloudSyncDisableAndDeleteOperation *)self _isSecureSecondaryContainer:v7];

  if (self)
  {
    v12 = [(HDCloudSyncOperation *)v10 operationIgnoringErrors];
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;

  return v13;
}

id __80__HDCloudSyncDisableAndDeleteOperation__deleteZonesOperationForContainer_zones___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 zoneIdentifier];
  uint64_t v4 = [v3 type];

  if ((unint64_t)(v4 - 3) < 5 || v4 == 1)
  {
    id v7 = [v2 zoneIdentifier];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_deleteUnifiedZoneRecordsOperationForContainer:(id)a3 zones:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v6 = a4;
  id v7 = [HDCloudSyncDeleteRecordsOperation alloc];
  v43 = self;
  uint64_t v8 = [(HDCloudSyncOperation *)self configuration];
  v41 = [(HDCloudSyncDeleteRecordsOperation *)v7 initWithConfiguration:v8 cloudState:0];

  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v50;
    *(void *)&long long v11 = 138543874;
    long long v40 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "zoneIdentifier", v40);
        uint64_t v17 = [v16 type];

        if (v17 == 2)
        {
          uint64_t v18 = objc_opt_class();
          id v48 = 0;
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __93__HDCloudSyncDisableAndDeleteOperation__deleteUnifiedZoneRecordsOperationForContainer_zones___block_invoke;
          v46[3] = &unk_1E6301838;
          id v19 = v44;
          id v47 = v19;
          LOBYTE(v18) = [v15 recordsForClass:v18 epoch:0 error:&v48 enumerationHandler:v46];
          id v20 = v48;
          if ((v18 & 1) == 0)
          {
            _HKInitializeLogging();
            id v35 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v38 = v35;
              v39 = [v15 zoneIdentifier];
              *(_DWORD *)buf = v40;
              long long v54 = v43;
              __int16 v55 = 2114;
              long long v56 = v39;
              __int16 v57 = 2114;
              id v58 = v20;
              _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
            }
            [(HDCloudSyncOperation *)v43 finishWithSuccess:0 error:v20];

            uint64_t v36 = 0;
            v32 = v41;
            v33 = v42;
            goto LABEL_24;
          }
          id v21 = v9;
          uint64_t v22 = [v15 zoneIdentifier];
          long long v23 = [v22 zoneIdentifier];

          uint64_t v24 = +[HDCloudSyncMedicalIDRecord recordIDWithZoneID:v23];
          [v19 addObject:v24];

          id v45 = 0;
          uint64_t v25 = [v15 zoneShareWithError:&v45];
          id v26 = v45;
          v27 = v26;
          if (v25 || !v26)
          {
            if (v25)
            {
              v31 = [v25 recordID];
              [v19 addObject:v31];
            }
          }
          else
          {
            _HKInitializeLogging();
            v28 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v29 = v28;
              v30 = [v15 zoneIdentifier];
              *(_DWORD *)buf = v40;
              long long v54 = v43;
              __int16 v55 = 2114;
              long long v56 = v30;
              __int16 v57 = 2114;
              id v58 = v27;
              _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);
            }
          }

          id v9 = v21;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v32 = v41;
  [(HDCloudSyncDeleteRecordsOperation *)v41 setRecordIDsToDelete:v44];
  v33 = v42;
  if ([(HDCloudSyncDisableAndDeleteOperation *)v43 _isSecureSecondaryContainer:v42])
  {
    v34 = [(HDCloudSyncOperation *)v41 operationIgnoringErrors];
  }
  else
  {
    v34 = v41;
  }
  uint64_t v36 = v34;
LABEL_24:

  return v36;
}

uint64_t __93__HDCloudSyncDisableAndDeleteOperation__deleteUnifiedZoneRecordsOperationForContainer_zones___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 recordID];
  [v2 addObject:v3];

  return 1;
}

- (id)_leaveSharesOperationForContainer:(id)a3
{
  uint64_t v4 = [HDCloudSyncLeaveAllSharesOperation alloc];
  id v5 = [(HDCloudSyncOperation *)self configuration];
  id v6 = [(HDCloudSyncOperation *)v4 initWithConfiguration:v5 cloudState:0];

  return v6;
}

@end