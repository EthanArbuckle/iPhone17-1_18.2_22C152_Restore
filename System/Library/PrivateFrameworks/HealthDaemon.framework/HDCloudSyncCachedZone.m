@interface HDCloudSyncCachedZone
- (BOOL)_deleteZoneWithError:(void *)a1;
- (BOOL)_enumerateRecordsAndDeleteWithError:(void *)a1;
- (BOOL)addRecord:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordID:(id)a3 error:(id *)a4;
- (BOOL)deleteZoneWithError:(id *)a3;
- (BOOL)recordsForClass:(Class)a3 epoch:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)resetZoneServerChangeTokenWithError:(id *)a3;
- (BOOL)setServerChangeToken:(id)a3 fetchComplete:(BOOL)a4 error:(id *)a5;
- (HDCloudSyncRepository)repository;
- (HDCloudSyncSerializedRecord)_serializedRecordForUnprotectedDBData:(void *)a3 protectedDBData:(uint64_t)a4 error:;
- (HDCloudSyncZoneIdentifier)zoneIdentifier;
- (id)_recordForEntity:(void *)a3 class:(void *)a4 unprotectedData:(void *)a5 transaction:(void *)a6 error:;
- (id)cloudSyncRecordForCKRecord:(id)a3 error:(id *)a4;
- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5;
- (id)recordForRecordID:(id)a3 class:(Class)a4 error:(id *)a5;
- (id)recordsForClass:(Class)a3 error:(id *)a4;
- (id)recordsForClass:(Class)a3 error:(id *)a4 filter:(id)a5;
- (id)serverChangeTokenWithError:(id *)a3;
- (id)zoneShareWithError:(id *)a3;
- (int64_t)containsRecordWithRecordID:(id)a3 error:(id *)a4;
- (int64_t)containsRecordsWithError:(id *)a3;
- (int64_t)needsFetchWithError:(id *)a3;
- (int64_t)zoneType;
- (void)handleCloudError:(id)a3 operation:(id)a4 container:(id)a5 database:(id)a6;
@end

@implementation HDCloudSyncCachedZone

- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncCachedZone;
  v11 = [(HDCloudSyncCachedZone *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    zoneIdentifier = v11->_zoneIdentifier;
    v11->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v12;

    v11->_zoneType = [(HDCloudSyncZoneIdentifier *)v11->_zoneIdentifier type];
    objc_storeWeak((id *)&v11->_repository, v9);
    objc_storeStrong((id *)&v11->_accessibilityAssertion, a5);
  }

  return v11;
}

- (id)serverChangeTokenWithError:(id *)a3
{
  v19 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  v4 = [v19 containerIdentifier];
  v18 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v5 = [v18 scope];
  v17 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  v6 = [v17 zoneIdentifier];
  v7 = [v6 zoneName];
  id v8 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v9 = [v8 zoneIdentifier];
  id v10 = [v9 ownerName];
  v11 = [(HDCloudSyncCachedZone *)self repository];
  uint64_t v12 = [v11 profile];
  v13 = [v12 legacyRepositoryProfile];
  v14 = +[HDCachedCKRecordZoneEntity serverChangeTokenForContainerIdentifier:v4 databaseScope:v5 zoneName:v7 ownerName:v10 profile:v13 error:a3];

  return v14;
}

- (BOOL)setServerChangeToken:(id)a3 fetchComplete:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    v26 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
    v20 = [v26 containerIdentifier];
    v25 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
    uint64_t v19 = [v25 scope];
    v24 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
    v23 = [v24 zoneIdentifier];
    v18 = [v23 zoneName];
    v22 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
    v21 = [v22 zoneIdentifier];
    id v9 = [v21 ownerName];
    id v10 = [(HDCloudSyncCachedZone *)self repository];
    v11 = [v10 userRecordName];
    uint64_t v12 = [NSNumber numberWithBool:v6];
    v13 = [(HDCloudSyncCachedZone *)self repository];
    v14 = [v13 profile];
    objc_super v15 = [v14 legacyRepositoryProfile];
    BOOL v16 = +[HDCachedCKRecordZoneEntity insertOrUpdateWithContainerIdentifier:v20 databaseScope:v19 zoneName:v18 ownerName:v9 userRecordName:v11 serverChangeToken:v8 fetchComplete:v12 profile:v15 error:a5];
  }
  else
  {
    BOOL v16 = [(HDCloudSyncCachedZone *)self resetZoneServerChangeTokenWithError:a5];
  }

  return v16;
}

- (BOOL)deleteZoneWithError:(id *)a3
{
  uint64_t v5 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  BOOL v6 = v5;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  id v8 = [v5 contextWithAccessibilityAssertion:accessibilityAssertion];

  id v9 = [(HDCloudSyncCachedZone *)self repository];
  id v10 = [v9 profile];
  v11 = [v10 database];
  v14[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke;
  v15[3] = &unk_1E62F6130;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke_2;
  v14[3] = &unk_1E6309C88;
  char v12 = [v11 performTransactionWithContext:v8 error:a3 block:v15 inaccessibilityHandler:v14];

  return v12;
}

BOOL __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _deleteZoneWithError:](*(void **)(a1 + 32), a3);
}

- (BOOL)_deleteZoneWithError:(void *)a1
{
  BOOL v2 = (BOOL)a1;
  if (a1)
  {
    v31 = [a1 zoneIdentifier];
    v24 = [v31 containerIdentifier];
    v29 = [(id)v2 zoneIdentifier];
    uint64_t v22 = [v29 scope];
    v27 = [(id)v2 zoneIdentifier];
    v26 = [v27 zoneIdentifier];
    v4 = [v26 zoneName];
    uint64_t v5 = [(id)v2 zoneIdentifier];
    BOOL v6 = [v5 zoneIdentifier];
    v7 = [v6 ownerName];
    id v8 = [(id)v2 repository];
    id v9 = [v8 profile];
    id v10 = [v9 legacyRepositoryProfile];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __46__HDCloudSyncCachedZone__deleteZoneWithError___block_invoke;
    v33[3] = &unk_1E6309DE8;
    v33[4] = v2;
    uint64_t v11 = v22;
    uint64_t v23 = a2;
    LODWORD(a2) = +[HDCachedCKRecordEntity enumerateRecordIDsWithContainerIdentifier:v24 databaseScope:v11 zoneName:v4 ownerName:v7 profile:v10 error:a2 enumerationHandler:v33];

    if (a2)
    {
      v32 = [(id)v2 zoneIdentifier];
      char v12 = [v32 containerIdentifier];
      v30 = [(id)v2 zoneIdentifier];
      uint64_t v25 = [v30 scope];
      v28 = [(id)v2 zoneIdentifier];
      v13 = [v28 zoneIdentifier];
      v14 = [v13 zoneName];
      objc_super v15 = [(id)v2 zoneIdentifier];
      BOOL v16 = [v15 zoneIdentifier];
      v17 = [v16 ownerName];
      v18 = [(id)v2 repository];
      uint64_t v19 = [v18 profile];
      v20 = [v19 legacyRepositoryProfile];
      BOOL v2 = +[HDCachedCKRecordZoneEntity deleteZoneWithContainerIdentifier:v12 databaseScope:v25 zoneName:v14 ownerName:v17 profile:v20 error:v23];
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

BOOL __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _deleteZoneWithError:](*(void **)(a1 + 32), a3);
}

- (void)handleCloudError:(id)a3 operation:(id)a4 container:(id)a5 database:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (objc_msgSend(v10, "hk_isHealthKitErrorWithCode:", 725))
    {
      id v35 = 0;
      BOOL v14 = [(HDCloudSyncCachedZone *)self resetZoneServerChangeTokenWithError:&v35];
      v32 = (uint64_t (*)(uint64_t, uint64_t))v35;
      if (!v14)
      {
        _HKInitializeLogging();
        objc_super v15 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v30 = v15;
          v31 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2114;
          v37 = v32;
          _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, " %{public}@ Failed to set serverChangeToken to nil for zone %{public}@, %{public}@", buf, 0x20u);
        }
      }
      BOOL v16 = [(HDCloudSyncCachedZone *)self repository];
      v17 = [v16 profile];
      v18 = [v17 daemon];
      uint64_t v19 = [v18 analyticsSubmissionCoordinator];
      v20 = [v12 containerIdentifier];
      v21 = HDCKDatabaseScopeToString([v13 databaseScope]);
      objc_msgSend(v19, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v11, @"Unexpected cache discrepency", v20, v21, v10);
    }
    else
    {
      uint64_t v22 = [v10 domain];
      int v23 = [v22 isEqualToString:*MEMORY[0x1E4F19C40]];

      if (v23)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v37 = __Block_byref_object_copy__169;
        v38 = __Block_byref_object_dispose__169;
        id v39 = 0;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __71__HDCloudSyncCachedZone_handleCloudError_operation_container_database___block_invoke;
        v34[3] = &unk_1E6309CB0;
        v34[4] = self;
        v34[5] = buf;
        objc_msgSend(v10, "hd_enumerateCloudKitPartialErrorsWithHandler:", v34);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          v24 = [(HDCloudSyncCachedZone *)self repository];
          uint64_t v25 = [v24 profile];
          v26 = [v25 daemon];
          v27 = [v26 analyticsSubmissionCoordinator];
          v28 = [v12 containerIdentifier];
          v29 = HDCKDatabaseScopeToString([v13 databaseScope]);
          objc_msgSend(v27, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v11, &stru_1F1728D60, v28, v29, *(void *)(*(void *)&buf[8] + 40));
        }
        _Block_object_dispose(buf, 8);
      }
    }
  }
}

void __71__HDCloudSyncCachedZone_handleCloudError_operation_container_database___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v4 = a2;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = *MEMORY[0x1E4F19C40];
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 26))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    id v8 = *(void **)(a1 + 32);
    id v66 = 0;
    char v9 = [v8 deleteZoneWithError:&v66];
    id v10 = v66;
    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      id v11 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v68 = v43;
        __int16 v69 = 2114;
        id v70 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zone after encountering zone-not-found error: %{public}@", buf, 0x16u);
      }
    }
    *a3 = 1;
  }
  uint64_t v59 = v7;
  v60 = v4;
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 21))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    id v12 = *(void **)(a1 + 32);
    id v65 = 0;
    char v13 = [v12 resetZoneServerChangeTokenWithError:&v65];
    id v14 = v65;
    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      objc_super v15 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v44 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v44;
        __int16 v69 = 2114;
        id v70 = v6;
        __int16 v71 = 2114;
        id v72 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset server change token after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    BOOL v16 = [MEMORY[0x1E4F29128] UUID];
    v17 = [*(id *)(a1 + 32) repository];
    v18 = [v17 profile];
    uint64_t v19 = [v18 legacyRepositoryProfile];
    id v64 = v14;
    char v20 = HDSetCloudSyncAttachmentManagementUUID(v16, v19, (uint64_t)&v64);
    id v21 = v64;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v22 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v45 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v45;
        __int16 v69 = 2114;
        id v70 = v6;
        __int16 v71 = 2114;
        id v72 = v21;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to reset attachment UUID after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    *a3 = 1;

    uint64_t v7 = v59;
    v4 = v60;
  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 11))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    int v23 = *(void **)(a1 + 32);
    id v63 = 0;
    char v24 = [v23 resetZoneServerChangeTokenWithError:&v63];
    id v25 = v63;
    if ((v24 & 1) == 0)
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v46 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v46;
        __int16 v69 = 2114;
        id v70 = v6;
        __int16 v71 = 2114;
        id v72 = v25;
        _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset server change token after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    *a3 = 1;
  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 112))
  {
    id v57 = v6;
    v58 = a3;
    v56 = [*(id *)(a1 + 32) zoneIdentifier];
    v51 = [v56 containerIdentifier];
    v54 = [*(id *)(a1 + 32) zoneIdentifier];
    uint64_t v52 = [v54 scope];
    v53 = [*(id *)(a1 + 32) zoneIdentifier];
    v27 = [v53 zoneIdentifier];
    v28 = [v27 zoneName];
    v29 = [*(id *)(a1 + 32) zoneIdentifier];
    v30 = [v29 zoneIdentifier];
    v31 = [v30 ownerName];
    v32 = [*(id *)(a1 + 32) repository];
    id v33 = [v32 profile];
    v34 = [v33 legacyRepositoryProfile];
    id v62 = 0;
    uint64_t v55 = a1;
    BOOL v35 = +[HDCachedCKRecordZoneEntity setZoneEntityState:1 containerIdentifier:v51 databaseScope:v52 zoneName:v28 ownerName:v31 profile:v34 error:&v62];
    id v36 = v62;

    v37 = v36;
    a1 = v55;

    if (!v35)
    {
      _HKInitializeLogging();
      v38 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v47 = *(void **)(v55 + 32);
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        __int16 v69 = 2114;
        id v70 = v37;
        _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark zone as missing identity: %{public}@", buf, 0x16u);
      }
    }
    a3 = v58;
    unsigned char *v58 = 1;

    id v6 = v57;
    uint64_t v7 = v59;
    v4 = v60;
  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 14))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    id v39 = *(void **)(a1 + 32);
    id v61 = 0;
    char v40 = [v39 resetZoneServerChangeTokenWithError:&v61];
    id v41 = v61;
    if ((v40 & 1) == 0)
    {
      _HKInitializeLogging();
      v42 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v48 = *(void **)(a1 + 32);
        v49 = v42;
        v50 = [v48 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        v68 = v48;
        __int16 v69 = 2114;
        id v70 = v50;
        __int16 v71 = 2114;
        id v72 = v41;
        _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, " %{public}@ Failed to set serverChangeToken to nil for zone %{public}@, %{public}@", buf, 0x20u);
      }
    }
    *a3 = 1;
  }
}

- (BOOL)resetZoneServerChangeTokenWithError:(id *)a3
{
  v29 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  int v23 = [v29 containerIdentifier];
  v28 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v22 = [v28 scope];
  v27 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  v26 = [v27 zoneIdentifier];
  uint64_t v5 = [v26 zoneName];
  char v24 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v6 = [v24 zoneIdentifier];
  uint64_t v7 = [v6 ownerName];
  id v8 = [(HDCloudSyncCachedZone *)self repository];
  char v9 = [v8 userRecordName];
  id v10 = [(HDCloudSyncCachedZone *)self repository];
  id v11 = [v10 profile];
  id v12 = [v11 legacyRepositoryProfile];
  BOOL v25 = +[HDCachedCKRecordZoneEntity insertOrUpdateWithContainerIdentifier:v23 databaseScope:v22 zoneName:v5 ownerName:v7 userRecordName:v9 serverChangeToken:0 fetchComplete:MEMORY[0x1E4F1CC28] profile:v12 error:a3];

  if (!v25) {
    return 0;
  }
  char v13 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v14 = v13;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  BOOL v16 = [v13 contextWithAccessibilityAssertion:accessibilityAssertion];

  v17 = [(HDCloudSyncCachedZone *)self repository];
  v18 = [v17 profile];
  uint64_t v19 = [v18 database];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke;
  v31[3] = &unk_1E62F6130;
  v31[4] = self;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke_2;
  v30[3] = &unk_1E6309C88;
  v30[4] = self;
  char v20 = [v19 performTransactionWithContext:v16 error:a3 block:v31 inaccessibilityHandler:v30];

  return v20;
}

BOOL __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _enumerateRecordsAndDeleteWithError:](*(void **)(a1 + 32), a3);
}

- (BOOL)_enumerateRecordsAndDeleteWithError:(void *)a1
{
  BOOL v2 = (BOOL)a1;
  if (a1)
  {
    BOOL v16 = [a1 zoneIdentifier];
    char v13 = [v16 containerIdentifier];
    objc_super v15 = [(id)v2 zoneIdentifier];
    uint64_t v12 = [v15 scope];
    id v14 = [(id)v2 zoneIdentifier];
    v3 = [v14 zoneIdentifier];
    v4 = [v3 zoneName];
    uint64_t v5 = [(id)v2 zoneIdentifier];
    id v6 = [v5 zoneIdentifier];
    uint64_t v7 = [v6 ownerName];
    id v8 = [(id)v2 repository];
    char v9 = [v8 profile];
    id v10 = [v9 legacyRepositoryProfile];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__HDCloudSyncCachedZone__enumerateRecordsAndDeleteWithError___block_invoke;
    v18[3] = &unk_1E6309DE8;
    v18[4] = v2;
    BOOL v2 = +[HDCachedCKRecordEntity enumerateRecordIDsWithContainerIdentifier:v13 databaseScope:v12 zoneName:v4 ownerName:v7 profile:v10 error:a2 enumerationHandler:v18];
  }
  return v2;
}

BOOL __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _enumerateRecordsAndDeleteWithError:](*(void **)(a1 + 32), a3);
}

- (int64_t)needsFetchWithError:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v5 = [(HDCloudSyncCachedZone *)self repository];
  id v6 = [v5 profile];
  uint64_t v7 = [v6 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__HDCloudSyncCachedZone_needsFetchWithError___block_invoke;
  v10[3] = &unk_1E62F9108;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:v10];

  if (a3) {
    int64_t v8 = v12[3];
  }
  else {
    int64_t v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __45__HDCloudSyncCachedZone_needsFetchWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v18 = [v4 zoneIdentifier];
  id v6 = [v18 containerIdentifier];
  v17 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v7 = [v17 scope];
  int64_t v8 = [*(id *)(a1 + 32) zoneIdentifier];
  char v9 = [v8 zoneIdentifier];
  id v10 = [v9 zoneName];
  uint64_t v11 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v12 = [v11 zoneIdentifier];
  uint64_t v13 = [v12 ownerName];
  int64_t v14 = +[HDCachedCKRecordZoneEntity requiresFetchForZoneWithContainerIdentifier:v6 databaseScope:v7 zoneName:v10 ownerName:v13 transaction:v5 error:a3];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
  return 1;
}

- (id)zoneShareWithError:(id *)a3
{
  uint64_t v22 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  v18 = [v22 containerIdentifier];
  id v21 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v17 = [v21 scope];
  char v20 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v19 = [v20 zoneIdentifier];
  v4 = [v19 zoneName];
  id v5 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v6 = [v5 zoneIdentifier];
  uint64_t v7 = [v6 ownerName];
  uint64_t v8 = *MEMORY[0x1E4F19D48];
  char v9 = [(HDCloudSyncCachedZone *)self repository];
  id v10 = [v9 profile];
  uint64_t v11 = [v10 legacyRepositoryProfile];
  id v23 = 0;
  uint64_t v12 = +[HDCachedCKRecordEntity recordDataWithContainerIdentifier:v18 databaseScope:v17 zoneName:v4 ownerName:v7 recordName:v8 profile:v11 error:&v23];
  id v13 = v23;

  if (v12 || !v13)
  {
    if (v12)
    {
      int64_t v14 = objc_msgSend(MEMORY[0x1E4F1A390], "hd_shareWithSystemData:error:", v12, a3);
      goto LABEL_9;
    }
  }
  else
  {
    if (a3)
    {
      int64_t v14 = 0;
      *a3 = v13;
      goto LABEL_9;
    }
    _HKLogDroppedError();
  }
  int64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)recordsForClass:(Class)a3 error:(id *)a4
{
  return [(HDCloudSyncCachedZone *)self recordsForClass:a3 error:a4 filter:&__block_literal_global_207];
}

uint64_t __47__HDCloudSyncCachedZone_recordsForClass_error___block_invoke()
{
  return 1;
}

- (BOOL)recordsForClass:(Class)a3 epoch:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v11 = a6;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"HDCloudSyncCachedZone.m" lineNumber:312 description:@"recordsForClass must be called with the subclass of HDCloudSyncRecord"];
  }
  uint64_t v12 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v13 = v12;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  objc_super v15 = [v12 contextWithAccessibilityAssertion:accessibilityAssertion];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke;
  aBlock[3] = &unk_1E6309D20;
  aBlock[4] = self;
  Class v35 = a3;
  int64_t v36 = a4;
  id v16 = v11;
  id v34 = v16;
  uint64_t v17 = _Block_copy(aBlock);
  v18 = [(HDCloudSyncCachedZone *)self repository];
  uint64_t v19 = [v18 profile];
  char v20 = [v19 database];
  id v32 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_314;
  v30[3] = &unk_1E62FA3D0;
  id v31 = v17;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2_315;
  v28[3] = &unk_1E62F8610;
  id v21 = v31;
  id v29 = v21;
  char v22 = [v20 performTransactionWithContext:v15 error:&v32 block:v30 inaccessibilityHandler:v28];
  id v23 = v32;

  if (v22)
  {
    BOOL v24 = 1;
  }
  else
  {
    id v25 = v23;
    BOOL v24 = v25 == 0;
    if (v25)
    {
      if (a5) {
        *a5 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v24;
}

BOOL __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v25 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v19 = [v25 containerIdentifier];
  BOOL v24 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v18 = [v24 scope];
  id v23 = [*(id *)(a1 + 32) zoneIdentifier];
  char v22 = [v23 zoneIdentifier];
  uint64_t v17 = [v22 zoneName];
  char v20 = [*(id *)(a1 + 32) zoneIdentifier];
  id v5 = [v20 zoneIdentifier];
  id v6 = [v5 ownerName];
  uint64_t v7 = [*(id *)(a1 + 48) recordType];
  uint64_t v8 = *(void *)(a1 + 56);
  char v9 = [*(id *)(a1 + 32) repository];
  id v10 = [v9 profile];
  id v11 = [v10 legacyRepositoryProfile];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2;
  v26[3] = &unk_1E6309CF8;
  v26[4] = *(void *)(a1 + 32);
  id v27 = v4;
  long long v16 = *(_OWORD *)(a1 + 40);
  id v12 = (id)v16;
  long long v28 = v16;
  id v13 = v4;
  BOOL v14 = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:v19 databaseScope:v18 zoneName:v17 ownerName:v6 recordType:v7 recordName:0 epoch:v8 profile:v11 error:a3 enumerationHandler:v26];

  return v14;
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = *(void **)(a1 + 56);
  id v12 = *(void **)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v29 = 0;
  BOOL v14 = -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v29);
  id v15 = v29;
  long long v16 = v15;
  if (v14) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v15 == 0;
  }
  if (v17)
  {
    if (v14)
    {
      uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v19 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        if (*(void *)(a1 + 40)) {
          id v25 = "protected";
        }
        else {
          id v25 = "unprotected";
        }
        v26 = v19;
        id v27 = [v10 recordName];
        long long v28 = [*(id *)(a1 + 32) zoneIdentifier];
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v24;
        __int16 v32 = 2080;
        id v33 = v25;
        __int16 v34 = 2114;
        Class v35 = v27;
        __int16 v36 = 2114;
        v37 = v28;
        _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);
      }
      char v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = [v10 recordName];
      objc_msgSend(v20, "hk_error:format:", 118, @"No cloud sync record found during protected transaction for record name: %@", v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = v22 == 0;
      if (v22)
      {
        if (a6) {
          *a6 = v22;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a6)
  {
    uint64_t v18 = 0;
    *a6 = v15;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)_recordForEntity:(void *)a3 class:(void *)a4 unprotectedData:(void *)a5 transaction:(void *)a6 error:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  BOOL v14 = v13;
  if (a1)
  {
    id v15 = [v13 protectedDatabase];

    if (v15)
    {
      id v15 = +[HDCachedSecureCKRecordEntity protectedRecordDataForUnprotectedEntity:v11 transaction:v14 error:a6];
    }
    long long v16 = -[HDCloudSyncCachedZone _serializedRecordForUnprotectedDBData:protectedDBData:error:]((uint64_t)a1, v12, v15, (uint64_t)a6);
    if (v16)
    {
      if ([a3 isEqual:objc_opt_class()])
      {
        id v46 = v12;
        id v47 = v11;
        id v17 = +[HDCloudSyncRecord initWithSerializedRecord:v16 error:a6];
        uint64_t v18 = [a1 zoneIdentifier];
        uint64_t v19 = [v18 type];

        switch(v19)
        {
          case 0:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for Master zone.";
            goto LABEL_18;
          case 1:
            uint64_t v24 = [a1 zoneIdentifier];
            id v25 = [v24 zoneIdentifier];
            v26 = +[HDCloudSyncSequenceRecord recordIDsWithIndividualZoneID:v25];
            goto LABEL_24;
          case 2:
            uint64_t v24 = [v17 ownerIdentifier];
            id v25 = [v17 storeIdentifier];
            v44 = [a1 zoneIdentifier];
            id v27 = [v44 zoneIdentifier];
            v26 = +[HDCloudSyncSequenceRecord recordIDsForOwnerIdentifier:v24 storeIdentifier:v25 zoneID:v27];

            goto LABEL_24;
          case 3:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for Shared Summary zone.";
            goto LABEL_18;
          case 4:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for Private Metadata zone.";
            goto LABEL_18;
          case 5:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for Attachment zone.";
            goto LABEL_18;
          case 6:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for State Sync zone.";
            goto LABEL_18;
          case 7:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for Context sync zone.";
            goto LABEL_18;
          default:
            char v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = objc_opt_class();
            id v22 = @"Attempt to fetch sequence records for unknown zone type.";
LABEL_18:
            objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v21, sel__sequenceRecordIDsForStoreRecord_error_, v22);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            id v25 = v28;
            if (v28)
            {
              if (a6)
              {
                id v25 = v28;
                v26 = 0;
                *a6 = v25;
              }
              else
              {
                _HKLogDroppedError();
                v26 = 0;
              }
              uint64_t v24 = v25;
            }
            else
            {
              uint64_t v24 = 0;
              v26 = 0;
            }
LABEL_24:

            if (v26)
            {
              v43 = v14;
              v45 = v15;
              id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v30 = [a1 repository];
              uint64_t v31 = [v30 profile];
              __int16 v32 = [v31 database];
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __64__HDCloudSyncCachedZone__addSequenceRecordsToStoreRecord_error___block_invoke;
              v52[3] = &unk_1E62F5A88;
              id v42 = v26;
              id v53 = v42;
              v54 = a1;
              id v33 = v29;
              id v55 = v33;
              BOOL v34 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v32 error:a6 block:v52];

              if (v34)
              {
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id v35 = v33;
                uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
                id v12 = v46;
                BOOL v14 = v43;
                if (v36)
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = *(void *)v49;
                  do
                  {
                    for (uint64_t i = 0; i != v37; ++i)
                    {
                      if (*(void *)v49 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      [v17 addSequenceHeaderRecord:*(void *)(*((void *)&v48 + 1) + 8 * i)];
                    }
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
                  }
                  while (v37);
                }

                char v40 = v17;
              }
              else
              {
                char v40 = 0;
                id v12 = v46;
                BOOL v14 = v43;
              }

              id v15 = v45;
            }
            else
            {

              char v40 = 0;
              id v12 = v46;
            }
            id v23 = v40;

            id v11 = v47;
            break;
        }
      }
      else
      {
        id v23 = [a3 initWithSerializedRecord:v16 error:a6];
      }
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2_315(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)recordsForClass:(Class)a3 error:(id *)a4 filter:(id)a5
{
  id v9 = a5;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"HDCloudSyncCachedZone.m" lineNumber:372 description:@"recordsForClass must be called with the subclass of HDCloudSyncRecord"];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = v11;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  BOOL v14 = [v11 contextWithAccessibilityAssertion:accessibilityAssertion];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke;
  aBlock[3] = &unk_1E6309D70;
  aBlock[4] = self;
  Class v36 = a3;
  id v15 = v9;
  id v35 = v15;
  id v16 = v10;
  id v34 = v16;
  id v17 = _Block_copy(aBlock);
  uint64_t v18 = [(HDCloudSyncCachedZone *)self repository];
  uint64_t v19 = [v18 profile];
  char v20 = [v19 database];
  id v32 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_319;
  v30[3] = &unk_1E62FA3D0;
  id v31 = v17;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2_320;
  v28[3] = &unk_1E62F8610;
  id v21 = v31;
  id v29 = v21;
  char v22 = [v20 performTransactionWithContext:v14 error:&v32 block:v30 inaccessibilityHandler:v28];
  id v23 = v32;

  if (v22)
  {
    id v24 = v16;
  }
  else
  {
    id v25 = v23;
    if (v25)
    {
      if (a4) {
        *a4 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v24 = 0;
  }

  return v24;
}

BOOL __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v24 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v19 = [v24 containerIdentifier];
  id v23 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v18 = [v23 scope];
  char v22 = [*(id *)(a1 + 32) zoneIdentifier];
  id v21 = [v22 zoneIdentifier];
  id v17 = [v21 zoneName];
  char v20 = [*(id *)(a1 + 32) zoneIdentifier];
  id v6 = [v20 zoneIdentifier];
  uint64_t v7 = [v6 ownerName];
  uint64_t v8 = [*(id *)(a1 + 56) recordType];
  id v9 = [*(id *)(a1 + 32) repository];
  id v10 = [v9 profile];
  id v11 = [v10 legacyRepositoryProfile];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2;
  v25[3] = &unk_1E6309D48;
  v25[4] = *(void *)(a1 + 32);
  id v26 = v5;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v16;
  long long v28 = v16;
  id v27 = *(id *)(a1 + 40);
  id v13 = v5;
  BOOL v14 = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:v19 databaseScope:v18 zoneName:v17 ownerName:v7 recordType:v8 recordName:0 epoch:0 profile:v11 error:a3 enumerationHandler:v25];

  return v14;
}

BOOL __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = *(void **)(a1 + 64);
  id v12 = *(void **)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v29 = 0;
  BOOL v14 = -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v29);
  id v15 = v29;
  long long v16 = v15;
  if (v14) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v15 == 0;
  }
  if (v17)
  {
    if (v14)
    {
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
        [*(id *)(a1 + 48) addObject:v14];
      }
      BOOL v18 = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v19 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        if (*(void *)(a1 + 40)) {
          id v25 = "protected";
        }
        else {
          id v25 = "unprotected";
        }
        id v26 = v19;
        id v27 = [v10 recordName];
        long long v28 = [*(id *)(a1 + 32) zoneIdentifier];
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v24;
        __int16 v32 = 2080;
        id v33 = v25;
        __int16 v34 = 2114;
        id v35 = v27;
        __int16 v36 = 2114;
        uint64_t v37 = v28;
        _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);
      }
      char v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = [v10 recordName];
      objc_msgSend(v20, "hk_error:format:", 118, @"No cloud sync record found during protected transaction for record name: %@", v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v18 = v22 == 0;
      if (v22)
      {
        if (a6) {
          *a6 = v22;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a6)
  {
    BOOL v18 = 0;
    *a6 = v15;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v18 = 0;
  }

  return v18;
}

uint64_t __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_319(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2_320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)recordForRecordID:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v9 = a3;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"HDCloudSyncCachedZone.m" lineNumber:438 description:@"recordForRecordID must be called with the subclass of HDCloudSyncRecord"];
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__169;
  char v40 = __Block_byref_object_dispose__169;
  id v41 = 0;
  id v10 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  id v12 = accessibilityAssertion;
  id v13 = [v10 contextWithAccessibilityAssertion:v12];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke;
  aBlock[3] = &unk_1E6309DC0;
  aBlock[4] = self;
  Class v35 = a4;
  id v14 = v9;
  id v33 = v14;
  __int16 v34 = &v36;
  id v15 = _Block_copy(aBlock);
  long long v16 = [(HDCloudSyncCachedZone *)self repository];
  BOOL v17 = [v16 profile];
  BOOL v18 = [v17 database];
  id v31 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_329;
  v29[3] = &unk_1E62FA3D0;
  id v30 = v15;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2_330;
  v27[3] = &unk_1E62F8610;
  id v19 = v30;
  id v28 = v19;
  char v20 = [v18 performTransactionWithContext:v13 error:&v31 block:v29 inaccessibilityHandler:v27];
  id v21 = v31;

  if (v20)
  {
    id v22 = (id)v37[5];
  }
  else
  {
    id v23 = v21;
    uint64_t v24 = v23;
    if (v23)
    {
      if (a5) {
        *a5 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v22 = 0;
  }

  _Block_object_dispose(&v36, 8);

  return v22;
}

uint64_t __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v23 = [*(id *)(a1 + 32) zoneIdentifier];
  BOOL v17 = [v23 containerIdentifier];
  id v22 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v16 = [v22 scope];
  id v21 = [*(id *)(a1 + 32) zoneIdentifier];
  char v20 = [v21 zoneIdentifier];
  id v15 = [v20 zoneName];
  BOOL v18 = [*(id *)(a1 + 32) zoneIdentifier];
  id v5 = [v18 zoneIdentifier];
  id v6 = [v5 ownerName];
  uint64_t v7 = [*(id *)(a1 + 56) recordType];
  uint64_t v8 = [*(id *)(a1 + 40) recordName];
  id v9 = [*(id *)(a1 + 32) repository];
  id v10 = [v9 profile];
  id v11 = [v10 legacyRepositoryProfile];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2;
  v24[3] = &unk_1E6309D98;
  uint64_t v12 = *(void *)(a1 + 32);
  long long v26 = *(_OWORD *)(a1 + 48);
  v24[4] = v12;
  id v25 = v4;
  id v13 = v4;
  LODWORD(a3) = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:v17 databaseScope:v16 zoneName:v15 ownerName:v6 recordType:v7 recordName:v8 epoch:0 profile:v11 error:a3 enumerationHandler:v24];

  return a3;
}

BOOL __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = *(void **)(a1 + 56);
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v31 = 0;
  uint64_t v14 = -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v31);
  id v15 = v31;
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v18) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v15 == 0;
  }
  if (v19)
  {
    if (v18)
    {
      BOOL v20 = 1;
    }
    else
    {
      _HKInitializeLogging();
      id v21 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        if (*(void *)(a1 + 40)) {
          id v27 = "protected";
        }
        else {
          id v27 = "unprotected";
        }
        id v28 = v21;
        id v29 = [v10 recordName];
        id v30 = [*(id *)(a1 + 32) zoneIdentifier];
        *(_DWORD *)buf = 138544130;
        uint64_t v33 = v26;
        __int16 v34 = 2080;
        Class v35 = v27;
        __int16 v36 = 2114;
        uint64_t v37 = v29;
        __int16 v38 = 2114;
        id v39 = v30;
        _os_log_fault_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);
      }
      id v22 = (void *)MEMORY[0x1E4F28C58];
      id v23 = [v10 recordName];
      objc_msgSend(v22, "hk_error:format:", 118, @"No cloud sync record found during transaction for record name: %@", v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v20 = v24 == 0;
      if (v24)
      {
        if (a6) {
          *a6 = v24;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a6)
  {
    BOOL v20 = 0;
    *a6 = v15;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_329(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2_330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)cloudSyncRecordForCKRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = HDCloudSyncRecordClassForRecord(v6, a4);
  if (!v7)
  {
    id v23 = 0;
    goto LABEL_38;
  }
  if (!self) {
    goto LABEL_19;
  }
  id v34 = 0;
  uint64_t v8 = [v7 recordWithCKRecord:v6 error:&v34];
  id v9 = v34;
  id v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 709, @"Record initialization failed.", v9);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_19:
    id v11 = 0;
LABEL_36:
    id v23 = 0;
    goto LABEL_37;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  id v11 = v8;
  uint64_t v12 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  if (![v12 type])
  {

    goto LABEL_15;
  }
  id v13 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v14 = [v13 type];

  if (v14 == 3)
  {
LABEL_15:
    id v25 = (void *)MEMORY[0x1E4F28C58];
    id v22 = [v11 storeIdentifier];
    objc_msgSend(v25, "hk_assignError:code:format:", a4, 719, @"%@: Unexpected store record %@ in master zone.", self, v22, v33);
    goto LABEL_16;
  }
  id v15 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  if ([v15 type] == 1)
  {
    uint64_t v16 = [v11 storeIdentifier];
    BOOL v17 = [(HDCloudSyncZoneIdentifier *)self->_zoneIdentifier zoneIdentifier];
    uint64_t v18 = objc_msgSend(v17, "hd_storeIdentifier");
    char v19 = [v16 isEqual:v18];

    if ((v19 & 1) == 0)
    {
      BOOL v20 = (void *)MEMORY[0x1E4F28C58];
      zoneIdentifier = self->_zoneIdentifier;
      id v22 = [v11 storeIdentifier];
      objc_msgSend(v20, "hk_assignError:code:format:", a4, 719, @"%@: Store record for zone %@ has unexpected store identifier %@", self, zoneIdentifier, v22);
LABEL_16:

LABEL_35:
      goto LABEL_36;
    }
  }
  else
  {
  }
LABEL_22:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  id v11 = v8;
  uint64_t v26 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  if (![v26 type])
  {

    goto LABEL_32;
  }
  id v27 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v28 = [v27 type];

  if (v28 == 3)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected sequence record %@ in master zone.", self, v11);
    goto LABEL_35;
  }

LABEL_26:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v29 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
    if ([v29 type])
    {
      id v30 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
      uint64_t v31 = [v30 type];

      if (v31 != 3)
      {

        goto LABEL_30;
      }
    }
    else
    {
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 719, @"%@: Unexpected change record %@ in master zone.", self, v11);
    goto LABEL_35;
  }
LABEL_30:
  id v11 = v8;
  id v23 = v11;
LABEL_37:

LABEL_38:

  return v23;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend(v6, "hd_isCKShare"))
  {
    long long v50 = a4;
    if (self)
    {
      id v7 = v6;
      id v46 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
      uint64_t v40 = [v46 containerIdentifier];
      v45 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
      uint64_t v39 = [v45 scope];
      v44 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
      v43 = [v44 zoneIdentifier];
      uint64_t v8 = [v43 zoneName];
      id v42 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
      id v41 = [v42 zoneIdentifier];
      id v9 = [v41 ownerName];
      id v10 = objc_msgSend(v7, "hd_systemData");
      id v11 = [v7 recordType];
      [v7 recordID];
      uint64_t v12 = v48 = v6;

      id v13 = [v12 recordName];
      uint64_t v14 = [(HDCloudSyncCachedZone *)self repository];
      id v15 = [v14 profile];
      uint64_t v16 = [v15 legacyRepositoryProfile];
      char v51 = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:v40 databaseScope:v39 zoneName:v8 ownerName:v9 recordData:v10 recordType:v11 recordName:v13 profile:v16 error:v50];

      id v6 = v48;
      goto LABEL_20;
    }
LABEL_9:
    char v51 = 0;
    goto LABEL_20;
  }
  id v17 = HDCloudSyncRecordClassForRecord(v6, a4);
  if (!v17) {
    goto LABEL_9;
  }
  if ([v17 hasFutureSchema:v6])
  {
    _HKInitializeLogging();
    uint64_t v18 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v61 = self;
      __int16 v62 = 2114;
      id v63 = v6;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Record: %{public}@ is from the future", buf, 0x16u);
    }
    char v51 = 1;
  }
  else
  {
    char v19 = [(HDCloudSyncCachedZone *)self cloudSyncRecordForCKRecord:v6 error:a4];
    BOOL v20 = v19;
    if (v19)
    {
      id v21 = [v19 serialize];
      id v22 = v21;
      if (!self) {
        goto LABEL_15;
      }
      id v23 = (objc_class *)MEMORY[0x1E4F28DB0];
      id v24 = v21;
      id v25 = (void *)[[v23 alloc] initRequiringSecureCoding:1];
      uint64_t v26 = [v24 systemData];
      [v25 encodeObject:v26 forKey:@"CloudSyncCacheSystemFieldsKey"];

      id v27 = [v24 unprotectedDBData];

      [v25 encodeObject:v27 forKey:@"CloudSyncCacheUnprotectedDataKey"];
      [v25 finishEncoding];
      uint64_t v28 = [v25 encodedData];

      if (v28)
      {
        id v29 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
        id v47 = [v29 contextWithAccessibilityAssertion:self->_accessibilityAssertion];

        [(HDCloudSyncCachedZone *)self repository];
        v30 = id v49 = v6;
        [v30 profile];
        uint64_t v31 = v22;
        uint64_t v33 = v32 = a4;
        id v34 = [v33 database];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __41__HDCloudSyncCachedZone_addRecord_error___block_invoke;
        v56[3] = &unk_1E62FB0D0;
        v56[4] = self;
        id v57 = v28;
        id v58 = v20;
        id v59 = v24;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __41__HDCloudSyncCachedZone_addRecord_error___block_invoke_2;
        v52[3] = &unk_1E62FB0F8;
        void v52[4] = self;
        id v35 = v57;
        id v53 = v35;
        id v54 = v58;
        id v55 = v59;
        __int16 v36 = v32;
        id v22 = v31;
        char v51 = [v34 performTransactionWithContext:v47 error:v36 block:v56 inaccessibilityHandler:v52];

        id v6 = v49;
      }
      else
      {
LABEL_15:
        _HKInitializeLogging();
        uint64_t v37 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v61 = self;
          __int16 v62 = 2114;
          id v63 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Unable to cache cloud sync record '%{public}@' because no serialized data was generated.", buf, 0x16u);
        }
        id v35 = 0;
        char v51 = 0;
      }
    }
    else
    {
      char v51 = 0;
    }
  }
LABEL_20:

  return v51;
}

uint64_t __41__HDCloudSyncCachedZone_addRecord_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v40 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v28 = [v40 containerIdentifier];
  __int16 v38 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v27 = [v38 scope];
  __int16 v36 = [*(id *)(a1 + 32) zoneIdentifier];
  id v34 = [v36 zoneIdentifier];
  id v25 = [v34 zoneName];
  __int16 v32 = [*(id *)(a1 + 32) zoneIdentifier];
  id v30 = [v32 zoneIdentifier];
  id v5 = [v30 ownerName];
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v26 = [*(id *)(a1 + 48) record];
  id v6 = [v26 recordType];
  id v7 = [*(id *)(a1 + 48) recordID];
  uint64_t v8 = [v7 recordName];
  id v9 = [*(id *)(a1 + 32) repository];
  id v10 = [v9 profile];
  id v11 = [v10 legacyRepositoryProfile];
  uint64_t v23 = a3;
  LODWORD(v27) = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:v28 databaseScope:v27 zoneName:v25 ownerName:v5 recordData:v24 recordType:v6 recordName:v8 profile:v11 error:a3];

  if (!v27) {
    return 0;
  }
  uint64_t v12 = [*(id *)(a1 + 56) protectedDBData];

  if (!v12) {
    return 1;
  }
  id v41 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v31 = [v41 containerIdentifier];
  uint64_t v39 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v29 = [v39 scope];
  uint64_t v37 = [*(id *)(a1 + 32) zoneIdentifier];
  id v35 = [v37 zoneIdentifier];
  id v13 = [v35 zoneName];
  uint64_t v33 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v14 = [v33 zoneIdentifier];
  id v15 = [v14 ownerName];
  uint64_t v16 = [*(id *)(a1 + 56) protectedDBData];
  id v17 = [*(id *)(a1 + 48) recordID];
  uint64_t v18 = [v17 recordName];
  char v19 = [*(id *)(a1 + 32) repository];
  BOOL v20 = [v19 profile];
  id v21 = [v20 legacyRepositoryProfile];
  LODWORD(v29) = +[HDCachedSecureCKRecordEntity insertOrUpdateWithContainerIdentifier:v31 databaseScope:v29 zoneName:v13 ownerName:v15 recordData:v16 recordName:v18 profile:v21 error:v23];

  return v29;
}

uint64_t __41__HDCloudSyncCachedZone_addRecord_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v40 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v28 = [v40 containerIdentifier];
  __int16 v38 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v27 = [v38 scope];
  __int16 v36 = [*(id *)(a1 + 32) zoneIdentifier];
  id v34 = [v36 zoneIdentifier];
  id v25 = [v34 zoneName];
  __int16 v32 = [*(id *)(a1 + 32) zoneIdentifier];
  id v30 = [v32 zoneIdentifier];
  id v5 = [v30 ownerName];
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v26 = [*(id *)(a1 + 48) record];
  id v6 = [v26 recordType];
  id v7 = [*(id *)(a1 + 48) recordID];
  uint64_t v8 = [v7 recordName];
  id v9 = [*(id *)(a1 + 32) repository];
  id v10 = [v9 profile];
  id v11 = [v10 legacyRepositoryProfile];
  uint64_t v23 = a3;
  LODWORD(v27) = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:v28 databaseScope:v27 zoneName:v25 ownerName:v5 recordData:v24 recordType:v6 recordName:v8 profile:v11 error:a3];

  if (!v27) {
    return 0;
  }
  uint64_t v12 = [*(id *)(a1 + 56) protectedDBData];

  if (!v12) {
    return 1;
  }
  id v41 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v31 = [v41 containerIdentifier];
  uint64_t v39 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v29 = [v39 scope];
  uint64_t v37 = [*(id *)(a1 + 32) zoneIdentifier];
  id v35 = [v37 zoneIdentifier];
  id v13 = [v35 zoneName];
  uint64_t v33 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v14 = [v33 zoneIdentifier];
  id v15 = [v14 ownerName];
  uint64_t v16 = [*(id *)(a1 + 56) protectedDBData];
  id v17 = [*(id *)(a1 + 48) recordID];
  uint64_t v18 = [v17 recordName];
  char v19 = [*(id *)(a1 + 32) repository];
  BOOL v20 = [v19 profile];
  id v21 = [v20 legacyRepositoryProfile];
  LODWORD(v29) = +[HDCachedSecureCKRecordEntity insertOrUpdateWithContainerIdentifier:v31 databaseScope:v29 zoneName:v13 ownerName:v15 recordData:v16 recordName:v18 profile:v21 error:v23];

  return v29;
}

- (int64_t)containsRecordsWithError:(id *)a3
{
  char v19 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v4 = [v19 containerIdentifier];
  uint64_t v18 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v5 = [v18 scope];
  id v17 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v6 = [v17 zoneIdentifier];
  id v7 = [v6 zoneName];
  uint64_t v8 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v9 = [v8 zoneIdentifier];
  id v10 = [v9 ownerName];
  id v11 = [(HDCloudSyncCachedZone *)self repository];
  uint64_t v12 = [v11 profile];
  id v13 = [v12 legacyRepositoryProfile];
  int64_t v14 = +[HDCachedCKRecordEntity containsRecordsWithContainerIdentifier:v4 databaseScope:v5 zoneName:v7 ownerName:v10 profile:v13 error:a3];

  return v14;
}

- (int64_t)containsRecordWithRecordID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v22 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v17 = [v22 containerIdentifier];
  id v21 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  uint64_t v18 = [v21 scope];
  BOOL v20 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v6 = [v20 zoneIdentifier];
  id v7 = [v6 zoneName];
  uint64_t v8 = [(HDCloudSyncCachedZone *)self zoneIdentifier];
  id v9 = [v8 zoneIdentifier];
  id v10 = [v9 ownerName];
  id v11 = [v5 recordName];

  uint64_t v12 = [(HDCloudSyncCachedZone *)self repository];
  id v13 = [v12 profile];
  int64_t v14 = [v13 legacyRepositoryProfile];
  int64_t v15 = +[HDCachedCKRecordEntity containsRecordWithContainerIdentifier:v17 databaseScope:v18 zoneName:v7 ownerName:v10 recordName:v11 profile:v14 error:a4];

  return v15;
}

- (BOOL)deleteRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  uint64_t v8 = v7;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  id v10 = [v7 contextWithAccessibilityAssertion:accessibilityAssertion];

  id v11 = [(HDCloudSyncCachedZone *)self repository];
  uint64_t v12 = [v11 profile];
  id v13 = [v12 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke;
  v19[3] = &unk_1E62F2AE0;
  v19[4] = self;
  id v20 = v6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke_2;
  v17[3] = &unk_1E62F6C20;
  v17[4] = self;
  id v18 = v20;
  id v14 = v20;
  char v15 = [v13 performTransactionWithContext:v10 error:a4 block:v19 inaccessibilityHandler:v17];

  return v15;
}

BOOL __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v35 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v26 = [v35 containerIdentifier];
  uint64_t v33 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v25 = [v33 scope];
  uint64_t v31 = [*(id *)(a1 + 32) zoneIdentifier];
  id v30 = [v31 zoneIdentifier];
  id v5 = [v30 zoneName];
  id v6 = [*(id *)(a1 + 32) zoneIdentifier];
  id v7 = [v6 zoneIdentifier];
  uint64_t v8 = [v7 ownerName];
  id v9 = [*(id *)(a1 + 40) recordName];
  id v10 = [*(id *)(a1 + 32) repository];
  id v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  uint64_t v24 = a3;
  BOOL v28 = +[HDCachedSecureCKRecordEntity deleteRecordWithContainerIdentifier:v26 databaseScope:v25 zoneName:v5 ownerName:v8 recordName:v9 profile:v12 error:a3];

  if (!v28) {
    return 0;
  }
  __int16 v36 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v27 = [v36 containerIdentifier];
  id v34 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v29 = [v34 scope];
  __int16 v32 = [*(id *)(a1 + 32) zoneIdentifier];
  id v13 = [v32 zoneIdentifier];
  id v14 = [v13 zoneName];
  char v15 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v16 = [v15 zoneIdentifier];
  id v17 = [v16 ownerName];
  id v18 = [*(id *)(a1 + 40) recordName];
  char v19 = [*(id *)(a1 + 32) repository];
  id v20 = [v19 profile];
  id v21 = [v20 legacyRepositoryProfile];
  BOOL v22 = +[HDCachedCKRecordEntity deleteRecordWithContainerIdentifier:v27 databaseScope:v29 zoneName:v14 ownerName:v17 recordName:v18 profile:v21 error:v24];

  return v22;
}

BOOL __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v35 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v26 = [v35 containerIdentifier];
  uint64_t v33 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v25 = [v33 scope];
  uint64_t v31 = [*(id *)(a1 + 32) zoneIdentifier];
  id v30 = [v31 zoneIdentifier];
  id v5 = [v30 zoneName];
  id v6 = [*(id *)(a1 + 32) zoneIdentifier];
  id v7 = [v6 zoneIdentifier];
  uint64_t v8 = [v7 ownerName];
  id v9 = [*(id *)(a1 + 40) recordName];
  id v10 = [*(id *)(a1 + 32) repository];
  id v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  uint64_t v24 = a3;
  BOOL v28 = +[HDCachedSecureCKRecordEntity deleteRecordWithContainerIdentifier:v26 databaseScope:v25 zoneName:v5 ownerName:v8 recordName:v9 profile:v12 error:a3];

  if (!v28) {
    return 0;
  }
  __int16 v36 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v27 = [v36 containerIdentifier];
  id v34 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v29 = [v34 scope];
  __int16 v32 = [*(id *)(a1 + 32) zoneIdentifier];
  id v13 = [v32 zoneIdentifier];
  id v14 = [v13 zoneName];
  char v15 = [*(id *)(a1 + 32) zoneIdentifier];
  uint64_t v16 = [v15 zoneIdentifier];
  id v17 = [v16 ownerName];
  id v18 = [*(id *)(a1 + 40) recordName];
  char v19 = [*(id *)(a1 + 32) repository];
  id v20 = [v19 profile];
  id v21 = [v20 legacyRepositoryProfile];
  BOOL v22 = +[HDCachedCKRecordEntity deleteRecordWithContainerIdentifier:v27 databaseScope:v29 zoneName:v14 ownerName:v17 recordName:v18 profile:v21 error:v24];

  return v22;
}

- (HDCloudSyncSerializedRecord)_serializedRecordForUnprotectedDBData:(void *)a3 protectedDBData:(uint64_t)a4 error:
{
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F28DC0];
    id v9 = a2;
    id v10 = (void *)[[v8 alloc] initForReadingFromData:v9 error:a4];

    if (v10)
    {
      id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CloudSyncCacheSystemFieldsKey"];
      uint64_t v12 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CloudSyncCacheUnprotectedDataKey"];
      [v10 finishDecoding];
      id v13 = [[HDCloudSyncSerializedRecord alloc] initWithEncodedSystemData:v11 unprotectedDBData:v12 protectedDBData:v7];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __64__HDCloudSyncCachedZone__addSequenceRecordsToStoreRecord_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    uint64_t v26 = a3;
    uint64_t v24 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v34 = [*(id *)(v4 + 40) zoneIdentifier];
        uint64_t v29 = [v34 containerIdentifier];
        uint64_t v33 = [*(id *)(v4 + 40) zoneIdentifier];
        uint64_t v28 = [v33 scope];
        __int16 v32 = [*(id *)(v4 + 40) zoneIdentifier];
        uint64_t v31 = [v32 zoneIdentifier];
        uint64_t v7 = [v31 zoneName];
        id v30 = [*(id *)(v4 + 40) zoneIdentifier];
        uint64_t v8 = [v30 zoneIdentifier];
        id v9 = [v8 ownerName];
        id v10 = [v6 recordName];
        id v11 = [*(id *)(v4 + 40) repository];
        uint64_t v12 = [v11 profile];
        id v13 = [v12 legacyRepositoryProfile];
        id v35 = 0;
        id v14 = (void *)v7;
        char v15 = +[HDCachedCKRecordEntity recordDataWithContainerIdentifier:v29 databaseScope:v28 zoneName:v7 ownerName:v9 recordName:v10 profile:v13 error:&v35];
        id v16 = v35;

        if (!v15 && v16)
        {
          if (v26) {
            void *v26 = v16;
          }
          else {
            _HKLogDroppedError();
          }
          goto LABEL_21;
        }
        uint64_t v4 = v24;
        if (v15)
        {
          uint64_t v17 = -[HDCloudSyncCachedZone _serializedRecordForUnprotectedDBData:protectedDBData:error:](*(void *)(v24 + 40), v15, 0, (uint64_t)v26);
          if (!v17) {
            goto LABEL_19;
          }
          id v18 = (void *)v17;
          uint64_t v19 = +[HDCloudSyncRecord initWithSerializedRecord:v17 error:v26];
          if (!v19)
          {

LABEL_19:
LABEL_21:

            uint64_t v21 = 0;
            goto LABEL_22;
          }
          id v20 = (void *)v19;
          [*(id *)(v24 + 48) addObject:v19];
        }
      }
      uint64_t v21 = 1;
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v21 = 1;
  }
LABEL_22:

  return v21;
}

uint64_t __46__HDCloudSyncCachedZone__deleteZoneWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) deleteRecordID:a2 error:a3];
}

uint64_t __61__HDCloudSyncCachedZone__enumerateRecordsAndDeleteWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) deleteRecordID:a2 error:a3];
}

- (HDCloudSyncRepository)repository
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repository);

  return (HDCloudSyncRepository *)WeakRetained;
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)zoneType
{
  return self->_zoneType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);

  objc_destroyWeak((id *)&self->_repository);
}

@end