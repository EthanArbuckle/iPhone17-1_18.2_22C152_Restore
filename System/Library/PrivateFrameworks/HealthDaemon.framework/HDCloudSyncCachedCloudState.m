@interface HDCloudSyncCachedCloudState
- (BOOL)addDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (BOOL)addZoneWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetServerChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (BOOL)setServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6;
- (BOOL)unitTest_deleteDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (HDCloudSyncCachedCloudState)init;
- (HDCloudSyncCachedCloudState)initWithRepository:(id)a3 accessibilityAssertion:(id)a4;
- (HDCloudSyncRepository)repository;
- (HDProfile)profile;
- (id)_singletonZoneOfType:(void *)a1 containerID:(unint64_t)a2 error:(void *)a3 filter:(void *)a4;
- (id)attachmentZoneForContainerID:(id)a3 error:(id *)a4;
- (id)contextSyncZoneForContainerID:(id)a3 error:(id *)a4;
- (id)detailedDescription;
- (id)masterZoneForContainerID:(id)a3 error:(id *)a4;
- (id)privateMetadataZoneForContainerID:(id)a3 error:(id *)a4;
- (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (id)unifiedSyncZoneForContainerID:(id)a3 error:(id *)a4;
- (id)zoneForRecordID:(id)a3 containerIdentifier:(id)a4 error:(id *)a5;
- (id)zoneIdentifiersForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (id)zoneIdentifiersRequiringFetchForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (id)zoneIdentifiersWithIdentityLossForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5;
- (id)zonesByIdentifierForContainers:(id)a3 error:(id *)a4 filter:(id)a5;
- (id)zonesByIdentifierWithError:(id *)a3;
- (id)zonesByIdentifierWithError:(id *)a3 filter:(id)a4;
- (id)zonesForContainerID:(id)a3 error:(id *)a4;
- (int64_t)changedRecordsCount;
- (int64_t)changedZonesCount;
- (int64_t)deletedRecordsCount;
- (int64_t)deletedZonesCount;
- (int64_t)operationCountForAnalytics;
- (uint64_t)_resetServerChangeTokenForContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 error:;
- (void)setChangedRecordsCount:(int64_t)a3;
- (void)setChangedZonesCount:(int64_t)a3;
- (void)setDeletedRecordsCount:(int64_t)a3;
- (void)setDeletedZonesCount:(int64_t)a3;
- (void)setOperationCountForAnalytics:(int64_t)a3;
@end

@implementation HDCloudSyncCachedCloudState

- (HDCloudSyncCachedCloudState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncCachedCloudState)initWithRepository:(id)a3 accessibilityAssertion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HDCloudSyncCachedCloudState;
  v9 = [(HDCloudSyncCachedCloudState *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_repository, a3);
    uint64_t v17 = [v7 profile];
    uint64_t v11 = [(id)v17 legacyRepositoryProfile];
    profile = v10->_profile;
    v10->_profile = (HDProfile *)v11;

    objc_storeStrong((id *)&v10->_accessibilityAssertion, a4);
    id v27 = 0;
    id v13 = v7;
    v14 = [v13 userRecordName];
    v15 = [v13 profile];
    v16 = [v15 legacyRepositoryProfile];
    LODWORD(v17) = +[HDCachedCKDatabaseEntity deleteDatabasesNotMatchingUserRecordName:v14 profile:v16 error:&v27];

    if (v17)
    {
      v18 = [v13 profile];
      v19 = [v18 legacyRepositoryProfile];
      *(void *)buf = 0;
      BOOL v20 = +[HDCachedSecureCKRecordEntity synchronizeRecordsWithProfile:v19 error:buf];
      id v21 = *(id *)buf;

      if (v20 || (objc_msgSend(v21, "hk_isDatabaseAccessibilityError") & 1) != 0)
      {
        LOBYTE(v17) = 1;
      }
      else
      {
        id v23 = v21;
        uint64_t v17 = (uint64_t)v23;
        if (v23) {
          id v27 = v23;
        }

        LOBYTE(v17) = 0;
      }
    }
  }
  else
  {
    id v27 = 0;
    id v22 = v7;
    LOBYTE(v17) = 0;
  }

  id v24 = v27;
  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v10;
      __int16 v30 = 2114;
      id v31 = v24;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error clearing and synchronizing cache %{public}@.", buf, 0x16u);
    }
  }

  return v10;
}

- (BOOL)addDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  repository = self->_repository;
  id v9 = a3;
  v10 = [(HDCloudSyncRepository *)repository userRecordName];
  uint64_t v11 = [(HDCloudSyncCachedCloudState *)self profile];
  LOBYTE(a5) = +[HDCachedCKDatabaseEntity insertIfDoesNotExistWithContainerIdentifier:v9 databaseScope:a4 userRecordName:v10 serverChangeToken:0 profile:v11 error:a5];

  return (char)a5;
}

- (BOOL)setServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6
{
  repository = self->_repository;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(HDCloudSyncRepository *)repository userRecordName];
  v14 = [(HDCloudSyncCachedCloudState *)self profile];
  LOBYTE(a6) = +[HDCachedCKDatabaseEntity insertOrUpdateWithContainerIdentifier:v11 databaseScope:a5 userRecordName:v13 serverChangeToken:v12 profile:v14 error:a6];

  return (char)a6;
}

- (BOOL)resetServerChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  v10 = v9;
  if (self) {
    accessibilityAssertion = self->_accessibilityAssertion;
  }
  else {
    accessibilityAssertion = 0;
  }
  id v12 = [v9 contextWithAccessibilityAssertion:accessibilityAssertion];

  id v13 = [(HDCloudSyncCachedCloudState *)self repository];
  v14 = [v13 profile];
  v15 = [v14 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke;
  v22[3] = &unk_1E62F4200;
  v22[4] = self;
  id v23 = v8;
  int64_t v24 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke_2;
  v19[3] = &unk_1E62F4228;
  v19[4] = self;
  id v20 = v23;
  int64_t v21 = a4;
  id v16 = v23;
  char v17 = [v15 performTransactionWithContext:v12 error:a5 block:v22 inaccessibilityHandler:v19];

  return v17;
}

uint64_t __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return -[HDCloudSyncCachedCloudState _resetServerChangeTokenForContainerIdentifier:databaseScope:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48), a3);
}

- (uint64_t)_resetServerChangeTokenForContainerIdentifier:(uint64_t)a3 databaseScope:(void *)a4 error:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    id v48 = 0;
    id v8 = [(id)a1 zoneIdentifiersForContainerIdentifier:v7 databaseScope:a3 error:&v48];
    id v9 = v48;
    v10 = v9;
    if (v8 || !v9)
    {
      v37 = a4;
      id v38 = v9;
      v39 = v8;
      id v40 = v7;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v45 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            char v17 = [HDCloudSyncCachedZone alloc];
            uint64_t v18 = [(id)a1 repository];
            id v19 = [(HDCloudSyncCachedZone *)v17 initForZoneIdentifier:v16 repository:v18 accessibilityAssertion:*(void *)(a1 + 64)];

            id v43 = 0;
            LOBYTE(v18) = [v19 deleteZoneWithError:&v43];
            id v20 = v43;
            if ((v18 & 1) == 0)
            {
              id v30 = v20;
              id v31 = v30;
              id v8 = v39;
              id v7 = v40;
              v10 = v38;
              if (v30)
              {
                if (v37) {
                  void *v37 = v30;
                }
                else {
                  _HKLogDroppedError();
                }
              }

              goto LABEL_26;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v42 = 0;
      id v7 = v40;
      char v21 = [(id)a1 setServerChangeToken:0 containerIdentifier:v40 databaseScope:a3 error:&v42];
      id v22 = v42;
      id v23 = v22;
      if (v21)
      {
        id v36 = v22;
        int64_t v24 = [MEMORY[0x1E4F29128] UUID];
        v25 = [(id)a1 repository];
        v26 = [v25 profile];
        id v27 = [v26 legacyRepositoryProfile];
        id v41 = 0;
        char v28 = HDSetCloudSyncAttachmentManagementUUID(v24, v27, (uint64_t)&v41);
        id v29 = v41;

        if (v28)
        {
          a1 = 1;
          v10 = v38;
          id v8 = v39;
          id v23 = v36;
        }
        else
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E4F29FA8];
          v10 = v38;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v50 = a1;
            __int16 v51 = 2114;
            id v52 = v29;
            _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to reset attachment UUID in response to a reset change token, %{public}@", buf, 0x16u);
          }
          id v34 = v29;
          id v29 = v34;
          a1 = v34 == 0;
          id v8 = v39;
          id v23 = v36;
          if (v34)
          {
            if (v37) {
              void *v37 = v34;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
      }
      else
      {
        id v32 = v22;
        id v29 = v32;
        if (v32)
        {
          v10 = v38;
          if (v37)
          {
            id v29 = v32;
            a1 = 0;
            void *v37 = v29;
          }
          else
          {
            _HKLogDroppedError();
            a1 = 0;
          }
          id v8 = v39;
        }
        else
        {
          a1 = 0;
          v10 = v38;
          id v8 = v39;
        }
      }
    }
    else if (a4)
    {
      a1 = 0;
      *a4 = v9;
    }
    else
    {
      _HKLogDroppedError();
LABEL_26:
      a1 = 0;
    }
  }
  return a1;
}

uint64_t __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return -[HDCloudSyncCachedCloudState _resetServerChangeTokenForContainerIdentifier:databaseScope:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48), a3);
}

- (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(HDCloudSyncCachedCloudState *)self profile];
  v10 = +[HDCachedCKDatabaseEntity serverChangeTokenForContainerIdentifier:v8 databaseScope:a4 profile:v9 error:a5];

  return v10;
}

- (BOOL)addZoneWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDProfile *)self->_profile database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HDCloudSyncCachedCloudState_addZoneWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E62F2AE0;
  id v11 = v6;
  uint64_t v12 = self;
  id v8 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:a4 block:v10];

  return (char)a4;
}

BOOL __59__HDCloudSyncCachedCloudState_addZoneWithIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v23 = a2;
  v5 = [*(id *)(a1 + 32) containerIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) scope];
  id v7 = [*(id *)(a1 + 32) zoneIdentifier];
  id v8 = [v7 zoneName];
  id v9 = [*(id *)(a1 + 32) zoneIdentifier];
  v10 = [v9 ownerName];
  id v11 = [*(id *)(*(void *)(a1 + 40) + 16) userRecordName];
  uint64_t v12 = [*(id *)(a1 + 40) profile];
  uint64_t v22 = a3;
  LODWORD(a3) = +[HDCachedCKRecordZoneEntity insertIfDoesNotExistWithContainerIdentifier:v5 databaseScope:v6 zoneName:v8 ownerName:v10 userRecordName:v11 serverChangeToken:0 profile:v12 error:a3];

  if (a3)
  {
    uint64_t v13 = [*(id *)(a1 + 32) containerIdentifier];
    uint64_t v14 = [*(id *)(a1 + 32) scope];
    v15 = [*(id *)(a1 + 32) zoneIdentifier];
    uint64_t v16 = [v15 zoneName];
    char v17 = [*(id *)(a1 + 32) zoneIdentifier];
    uint64_t v18 = [v17 ownerName];
    id v19 = v23;
    BOOL v20 = +[HDCachedCKRecordZoneEntity setRequiresFetch:1 containerIdentifier:v13 databaseScope:v14 zoneName:v16 ownerName:v18 transaction:v23 error:v22];
  }
  else
  {
    BOOL v20 = 0;
    id v19 = v23;
  }

  return v20;
}

- (id)zoneIdentifiersForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = [(HDCloudSyncCachedCloudState *)self repository];
  id v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__HDCloudSyncCachedCloudState_zoneIdentifiersForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E62F4250;
  int64_t v21 = a4;
  id v18 = v8;
  id v19 = self;
  id v13 = v9;
  id v20 = v13;
  id v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:v14 databaseScope:a4 profile:v12 error:a5 enumerationHandler:v17];

  if (a5) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __89__HDCloudSyncCachedCloudState_zoneIdentifiersForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [[HDCloudSyncZoneIdentifier alloc] initForZone:v6 container:*(void *)(a1 + 32) scope:*(void *)(a1 + 56)];

  if (a4 == 1)
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = v8;
      id v11 = [v7 zoneIdentifier];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = HDCKDatabaseScopeToString(*(void *)(a1 + 56));
      int v15 = 138544130;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_debug_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; with state Identity Lost, container %{public}@, database %{public}@",
        (uint8_t *)&v15,
        0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v7];
  }

  return 1;
}

- (id)zoneIdentifiersRequiringFetchForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = [(HDCloudSyncCachedCloudState *)self repository];
  id v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__HDCloudSyncCachedCloudState_zoneIdentifiersRequiringFetchForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E62F4278;
  id v18 = v8;
  int64_t v20 = a4;
  id v13 = v9;
  id v19 = v13;
  id v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:v14 databaseScope:a4 profile:v12 error:a5 enumerationHandler:v17];

  if (a5) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __103__HDCloudSyncCachedCloudState_zoneIdentifiersRequiringFetchForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (a4 != 1 && a3)
  {
    id v5 = a2;
    id v6 = [[HDCloudSyncZoneIdentifier alloc] initForZone:v5 container:*(void *)(a1 + 32) scope:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) addObject:v6];
  }
  return 1;
}

- (id)zoneIdentifiersWithIdentityLossForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = [(HDCloudSyncCachedCloudState *)self repository];
  id v11 = [v10 profile];
  uint64_t v12 = [v11 legacyRepositoryProfile];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__HDCloudSyncCachedCloudState_zoneIdentifiersWithIdentityLossForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E62F4278;
  id v18 = v8;
  int64_t v20 = a4;
  id v13 = v9;
  id v19 = v13;
  id v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:v14 databaseScope:a4 profile:v12 error:a5 enumerationHandler:v17];

  if (a5) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __105__HDCloudSyncCachedCloudState_zoneIdentifiersWithIdentityLossForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 1)
  {
    id v5 = a2;
    id v6 = [[HDCloudSyncZoneIdentifier alloc] initForZone:v5 container:*(void *)(a1 + 32) scope:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) addObject:v6];
  }
  return 1;
}

- (id)zonesByIdentifierWithError:(id *)a3
{
  return [(HDCloudSyncCachedCloudState *)self zonesByIdentifierWithError:a3 filter:&__block_literal_global_9];
}

uint64_t __58__HDCloudSyncCachedCloudState_zonesByIdentifierWithError___block_invoke()
{
  return 1;
}

- (id)zonesByIdentifierWithError:(id *)a3 filter:(id)a4
{
  id v6 = a4;
  id v7 = [(HDCloudSyncCachedCloudState *)self repository];
  id v8 = [v7 allCKContainers];
  id v9 = [(HDCloudSyncCachedCloudState *)self zonesByIdentifierForContainers:v8 error:a3 filter:v6];

  return v9;
}

- (id)zonesByIdentifierForContainers:(id)a3 error:(id *)a4 filter:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v43 = a5;
  id v56 = 0;
  long long v45 = self;
  if (!self)
  {
    __int16 v17 = 0;
    long long v44 = 0;
    goto LABEL_17;
  }
  id v7 = [(HDCloudSyncCachedCloudState *)self profile];
  id v8 = [v7 cloudSyncManager];
  *(void *)buf = 0;
  id v9 = [v8 shareOwnerParticipantWithError:buf];
  id v10 = *(id *)buf;
  id v11 = [v9 userIdentity];
  uint64_t v12 = [v11 userRecordID];
  id v13 = [v12 recordName];

  if (!v13)
  {
    if (v10)
    {
      long long v44 = 0;
      id v56 = v10;
      goto LABEL_16;
    }
    id v15 = [(HDCloudSyncCachedCloudState *)v45 profile];
    uint64_t v16 = [v15 profileType];

    if (v16 > 3)
    {
      if (v16 != 100 && v16 != 4) {
        goto LABEL_14;
      }
    }
    else
    {
      if ((unint64_t)(v16 - 2) < 2)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v56, 729, @"Profile type %ld requires a zone owner name but none was present.", v16, v38);
LABEL_15:
        long long v44 = 0;
        goto LABEL_16;
      }
      if (v16 != 1)
      {
LABEL_14:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v56, 729, @"Unexpected profile type %ld; requiring zone owner to be safe.",
          v16,
          v38);
        goto LABEL_15;
      }
    }
    id v14 = (id)*MEMORY[0x1E4F19C08];
    goto LABEL_4;
  }
  id v14 = v13;
LABEL_4:
  long long v44 = v14;
LABEL_16:

  __int16 v17 = v56;
LABEL_17:
  id v18 = v17;
  v39 = v18;
  if (v44 || !v18)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__9;
    v60 = __Block_byref_object_dispose__9;
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v38;
    uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    uint64_t v22 = v45;
    if (v21)
    {
      uint64_t v41 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(obj);
          }
          int64_t v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v25 = [(HDCloudSyncCachedCloudState *)v22 repository];
          v26 = [v25 profileIdentifier];
          uint64_t v27 = HDDatabaseForContainer(v24, v26);

          char v28 = [v24 containerIdentifier];
          uint64_t v29 = [(id)v27 databaseScope];
          id v30 = [(HDCloudSyncCachedCloudState *)v45 repository];
          id v31 = [v30 profile];
          id v32 = [v31 legacyRepositoryProfile];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __75__HDCloudSyncCachedCloudState_zonesByIdentifierForContainers_error_filter___block_invoke;
          v46[3] = &unk_1E62F42C0;
          v46[4] = v24;
          id v33 = (id)v27;
          id v47 = v33;
          id v48 = v45;
          id v49 = v44;
          id v50 = v43;
          __int16 v51 = buf;
          LOBYTE(v27) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:v28 databaseScope:v29 profile:v32 error:a4 enumerationHandler:v46];

          if ((v27 & 1) == 0)
          {

            id v20 = 0;
            goto LABEL_33;
          }
          uint64_t v22 = v45;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v20 = *(id *)(*(void *)&buf[8] + 40);
LABEL_33:
    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    id v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      profile = v45->_profile;
      id v36 = v19;
      v37 = [(HDProfile *)profile profileIdentifier];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2114;
      v59 = v39;
      _os_log_error_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Cannot get zone owner name for profile %{public}@ with error %{public}@", buf, 0x20u);
    }
    if (a4)
    {
      id v20 = 0;
      *a4 = v39;
    }
    else
    {
      _HKLogDroppedError();
      id v20 = 0;
    }
  }

  return v20;
}

uint64_t __75__HDCloudSyncCachedCloudState_zonesByIdentifierForContainers_error_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [HDCloudSyncZoneIdentifier alloc];
  id v8 = [*(id *)(a1 + 32) containerIdentifier];
  id v9 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v7, "initForZone:container:scope:", v6, v8, [*(id *)(a1 + 40) databaseScope]);

  if (a4)
  {
    if (a4 == 1)
    {
      _HKInitializeLogging();
      id v10 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t v12 = v10;
        id v13 = [v9 zoneIdentifier];
        id v14 = [*(id *)(a1 + 32) containerIdentifier];
        id v15 = HDCKDatabaseScopeToString([*(id *)(a1 + 40) databaseScope]);
        int v43 = 138544130;
        uint64_t v44 = v11;
        __int16 v45 = 2114;
        long long v46 = v13;
        __int16 v47 = 2114;
        id v48 = v14;
        __int16 v49 = 2114;
        id v50 = v15;
        _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; with state Identity Lost, container %{public}@, database %{public}@",
          (uint8_t *)&v43,
          0x2Au);

LABEL_16:
        goto LABEL_17;
      }
    }
    goto LABEL_17;
  }
  if (!*(void *)(a1 + 56))
  {
LABEL_8:
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
    {
      int64_t v24 = [HDCloudSyncCachedZone alloc];
      v25 = [*(id *)(a1 + 48) repository];
      uint64_t v26 = *(void *)(a1 + 48);
      if (v26) {
        uint64_t v27 = *(void *)(v26 + 64);
      }
      else {
        uint64_t v27 = 0;
      }
      id v28 = [(HDCloudSyncCachedZone *)v24 initForZoneIdentifier:v9 repository:v25 accessibilityAssertion:v27];

      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v28 forKeyedSubscript:v9];
    }
    goto LABEL_17;
  }
  uint64_t v16 = [v9 zoneIdentifier];
  __int16 v17 = [v16 ownerName];
  char v18 = [v17 isEqualToString:*(void *)(a1 + 56)];

  if (v18)
  {
    id v19 = [v9 zoneIdentifier];
    id v20 = objc_msgSend(v19, "hd_syncCircleIdentifier");
    uint64_t v21 = [*(id *)(a1 + 48) repository];
    uint64_t v22 = [v21 syncCircleIdentifier];
    char v23 = [v20 isEqualToString:v22];

    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = *(void *)(a1 + 48);
        uint64_t v12 = v35;
        v37 = [v9 zoneIdentifier];
        id v38 = [v9 zoneIdentifier];
        v39 = objc_msgSend(v38, "hd_syncCircleIdentifier");
        id v40 = [*(id *)(a1 + 48) repository];
        uint64_t v41 = [v40 syncCircleIdentifier];
        int v43 = 138544130;
        uint64_t v44 = v36;
        __int16 v45 = 2114;
        long long v46 = v37;
        __int16 v47 = 2114;
        id v48 = v39;
        __int16 v49 = 2114;
        id v50 = v41;
        _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; syncCircleIdentifier %{public}@ does not match our expected syncCircleId"
          "entifier %{public}@",
          (uint8_t *)&v43,
          0x2Au);

        goto LABEL_16;
      }
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  _HKInitializeLogging();
  uint64_t v29 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v12 = v29;
    id v31 = [v9 zoneIdentifier];
    id v32 = [v9 zoneIdentifier];
    id v33 = [v32 ownerName];
    id v34 = *(void **)(a1 + 56);
    int v43 = 138544130;
    uint64_t v44 = v30;
    __int16 v45 = 2114;
    long long v46 = v31;
    __int16 v47 = 2114;
    id v48 = v33;
    __int16 v49 = 2114;
    id v50 = v34;
    _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; owner %{public}@ does not match our expected zone owner name %{public}@",
      (uint8_t *)&v43,
      0x2Au);

    goto LABEL_16;
  }
LABEL_17:

  return 1;
}

- (id)_singletonZoneOfType:(void *)a1 containerID:(unint64_t)a2 error:(void *)a3 filter:(void *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a1)
  {
    unint64_t v25 = a2;
    id v26 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __77__HDCloudSyncCachedCloudState__singletonZoneOfType_containerID_error_filter___block_invoke;
    uint64_t v22 = &unk_1E62F42E8;
    id v9 = v7;
    id v23 = v9;
    id v24 = 0;
    id v10 = [a1 zonesByIdentifierWithError:&v26 filter:&v19];
    id v11 = v26;
    uint64_t v12 = v11;
    if (v10 || !v11)
    {
      id v13 = objc_msgSend(v10, "allValues", v19, v20, v21, v22);
      if ((unint64_t)[v13 count] >= 2)
      {
        _HKInitializeLogging();
        id v14 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          uint64_t v16 = v14;
          __int16 v17 = HDCloudSyncZoneTypeToString(a2);
          char v18 = [a1 profile];
          *(_DWORD *)buf = 138544386;
          id v28 = a1;
          __int16 v29 = 2114;
          uint64_t v30 = v17;
          __int16 v31 = 2114;
          id v32 = v18;
          __int16 v33 = 2114;
          id v34 = v9;
          __int16 v35 = 2112;
          uint64_t v36 = v13;
          _os_log_fault_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple cached zones of type %{public}@ for profile %{public}@, container %{public}@. This is unexpected. (%@)", buf, 0x34u);
        }
      }
      a1 = [v13 firstObject];
    }
    else if (a4)
    {
      a1 = 0;
      *a4 = v11;
    }
    else
    {
      _HKLogDroppedError();
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __77__HDCloudSyncCachedCloudState__singletonZoneOfType_containerID_error_filter___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == a1[6])
  {
    uint64_t v4 = [v3 containerIdentifier];
    if ([v4 isEqualToString:a1[4]])
    {
      uint64_t v5 = a1[5];
      if (v5) {
        uint64_t v6 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v3);
      }
      else {
        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)masterZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 0, a3, a4);
}

- (id)unifiedSyncZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 2uLL, a3, a4);
}

- (id)privateMetadataZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 4uLL, a3, a4);
}

- (id)attachmentZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 5uLL, a3, a4);
}

- (id)contextSyncZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 7uLL, a3, a4);
}

- (id)zoneForRecordID:(id)a3 containerIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __73__HDCloudSyncCachedCloudState_zoneForRecordID_containerIdentifier_error___block_invoke;
  uint64_t v19 = &unk_1E62F4310;
  id v20 = v8;
  id v21 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(HDCloudSyncCachedCloudState *)self zonesByIdentifierWithError:a5 filter:&v16];
  id v13 = objc_msgSend(v12, "allValues", v16, v17, v18, v19);
  id v14 = [v13 firstObject];

  return v14;
}

uint64_t __73__HDCloudSyncCachedCloudState_zoneForRecordID_containerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 zoneIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) zoneID];
  if ([v4 isEqual:v5])
  {
    uint64_t v6 = [v3 containerIdentifier];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)zonesForContainerID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0;
  uint64_t v7 = [(HDCloudSyncCachedCloudState *)self zonesByIdentifierWithError:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7 || !v8)
  {
    id v11 = [v7 allValues];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__HDCloudSyncCachedCloudState_zonesForContainerID_error___block_invoke;
    v13[3] = &unk_1E62F4338;
    id v14 = v6;
    id v10 = objc_msgSend(v11, "hk_filter:", v13);
  }
  else if (a4)
  {
    id v10 = 0;
    *a4 = v8;
  }
  else
  {
    _HKLogDroppedError();
    id v10 = 0;
  }

  return v10;
}

uint64_t __57__HDCloudSyncCachedCloudState_zonesForContainerID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 zoneIdentifier];
  uint64_t v4 = [v3 containerIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)detailedDescription
{
  v2 = self;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  if (self)
  {
    id v81 = 0;
    uint64_t v4 = [(HDCloudSyncCachedCloudState *)self zonesByIdentifierWithError:&v81];
    id v5 = v81;
    id v6 = v5;
    if (v4 || !v5)
    {
      id v56 = v5;
      v57 = v4;
      v59 = v3;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id obj = [v4 allValues];
      uint64_t v9 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v78;
        int v8 = 1;
        do
        {
          uint64_t v12 = 0;
          uint64_t v63 = v10;
          do
          {
            if (*(void *)v78 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
            uint64_t v14 = objc_opt_class();
            id v76 = 0;
            id v15 = [v13 recordsForClass:v14 error:&v76];
            id v16 = v76;
            uint64_t v17 = v16;
            if (v15) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v16 == 0;
            }
            if (v18)
            {
              uint64_t v19 = v11;
              long long v75 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              long long v72 = 0u;
              id v20 = v15;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v83 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v73;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v73 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    unint64_t v25 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                    if (v25)
                    {
                      int v26 = [v25 supportedProtocolVersion];
                      if (v8 >= v26) {
                        int v8 = v26;
                      }
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v72 objects:v83 count:16];
                }
                while (v22);
              }

              uint64_t v11 = v19;
              uint64_t v10 = v63;
            }
            else
            {
              _HKInitializeLogging();
              uint64_t v27 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                __int16 v29 = v27;
                uint64_t v30 = [v13 zoneIdentifier];
                *(_DWORD *)buf = 138543874;
                v85 = self;
                __int16 v86 = 2114;
                v87 = v30;
                __int16 v88 = 2114;
                v89 = v17;
                _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
              }
            }

            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
        }
        while (v10);
      }
      else
      {
        int v8 = 1;
      }

      v2 = self;
      uint64_t v4 = v57;
      id v3 = v59;
      id v6 = v56;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v7 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138543618;
        v91 = v2;
        __int16 v92 = 2114;
        v93 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating push targets, %{public}@", v90, 0x16u);
      }
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 0;
  }
  id obja = [v3 stringWithFormat:@"%@\nMinimum supported protocol: %ld\n\n", v2, v8];
  id v71 = 0;
  __int16 v31 = [(HDCloudSyncCachedCloudState *)v2 zonesByIdentifierWithError:&v71];
  id v32 = v71;
  __int16 v33 = v32;
  if (!v31)
  {
    if (v32)
    {
      _HKInitializeLogging();
      id v34 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138543618;
        v91 = v2;
        __int16 v92 = 2114;
        v93 = v33;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve zone identifiers for cached cloud state description, %{public}@", v90, 0x16u);
      }
    }
  }
  __int16 v35 = [v31 allValues];
  uint64_t v36 = objc_msgSend(v35, "hk_filter:", &__block_literal_global_298);

  if ([v36 count])
  {
    v60 = v33;
    id v61 = v31;
    objc_msgSend(obja, "appendFormat:", @"Master Records (%ld):\n", objc_msgSend(v36, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v58 = v36;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v67 objects:v82 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v68 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          uint64_t v43 = objc_opt_class();
          id v66 = 0;
          uint64_t v44 = [v42 recordsForClass:v43 error:&v66];
          id v45 = v66;
          long long v46 = v45;
          if (v44) {
            BOOL v47 = 1;
          }
          else {
            BOOL v47 = v45 == 0;
          }
          if (v47)
          {
            id v48 = [v44 firstObject];
            __int16 v49 = [v48 description];
            id v50 = objc_msgSend(v49, "hk_stringIndentedBy:", 4);
            [obja appendFormat:@"%@\n\n", v50];
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v51 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              long long v53 = v51;
              long long v54 = [v42 zoneIdentifier];
              *(_DWORD *)v90 = 138543874;
              v91 = self;
              __int16 v92 = 2114;
              v93 = v54;
              __int16 v94 = 2114;
              v95 = v46;
              _os_log_error_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", v90, 0x20u);
            }
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v67 objects:v82 count:16];
      }
      while (v39);
    }

    __int16 v33 = v60;
    __int16 v31 = v61;
    uint64_t v36 = v58;
  }

  return obja;
}

BOOL __50__HDCloudSyncCachedCloudState_detailedDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 zoneIdentifier];
  BOOL v3 = [v2 type] == 0;

  return v3;
}

- (BOOL)unitTest_deleteDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)a3, a4);
  int v8 = [(HDCloudSyncCachedCloudState *)self profile];
  uint64_t v9 = [v8 database];
  LOBYTE(a5) = +[HDHealthEntity deleteEntitiesWithPredicate:v7 healthDatabase:v9 error:a5];

  return (char)a5;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (int64_t)changedZonesCount
{
  return self->_changedZonesCount;
}

- (void)setChangedZonesCount:(int64_t)a3
{
  self->_changedZonesCount = a3;
}

- (int64_t)deletedZonesCount
{
  return self->_deletedZonesCount;
}

- (void)setDeletedZonesCount:(int64_t)a3
{
  self->_deletedZonesCount = a3;
}

- (int64_t)changedRecordsCount
{
  return self->_changedRecordsCount;
}

- (void)setChangedRecordsCount:(int64_t)a3
{
  self->_changedRecordsCount = a3;
}

- (int64_t)deletedRecordsCount
{
  return self->_deletedRecordsCount;
}

- (void)setDeletedRecordsCount:(int64_t)a3
{
  self->_deletedRecordsCount = a3;
}

- (int64_t)operationCountForAnalytics
{
  return self->_operationCountForAnalytics;
}

- (void)setOperationCountForAnalytics:(int64_t)a3
{
  self->_operationCountForAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_repository, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end