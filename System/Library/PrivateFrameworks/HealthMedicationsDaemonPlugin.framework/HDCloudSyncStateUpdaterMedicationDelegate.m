@interface HDCloudSyncStateUpdaterMedicationDelegate
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ (id)_deletedConceptPredicateWithUUIDs:(uint64_t)a1;
+ (id)_medicationsPredicate;
+ (id)_medsListOrderingTerms;
+ (id)_mergeCloudConcept:(void *)a3 localConcept:(void *)a4 profile:;
+ (uint64_t)_didAddNewLocalConcepts:(void *)a3 toMergedConcepts:;
+ (uint64_t)_didUpdateMergedConcepts:(uint64_t)a1 cloudState:(void *)a2 localState:(void *)a3 profile:(void *)a4 nonDeletedCloudConceptUUIDs:(void *)a5 error:(void *)a6;
+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:;
+ (uint64_t)_fetchPersistedMeds:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:;
+ (uint64_t)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:;
+ (uint64_t)_replaceDeletedConceptIn:(void *)a3 nonDeletedCloudConceptUUIDs:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:;
+ (uint64_t)_shouldUpdateWithMergedState:(void *)a3 cloudState:(void *)a4 localState:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:;
+ (uint64_t)_updateCodableSyncState:(uint64_t)a1 withMergeState:(void *)a2 profile:(void *)a3 error:(void *)a4;
- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6;
- (NSString)description;
- (NSString)domain;
- (NSString)key;
- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6;
- (int64_t)shouldUpdateWithMergedState:(id *)a3 cloudState:(id)a4 localState:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
@end

@implementation HDCloudSyncStateUpdaterMedicationDelegate

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDCloudSyncStateUpdaterMedicationDelegate *)self domain];
  v6 = [(HDCloudSyncStateUpdaterMedicationDelegate *)self key];
  v7 = [v3 stringWithFormat:@"[%@:%p (%@, %@)]", v4, self, v5, v6];

  return (NSString *)v7;
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (NSString)domain
{
  return (NSString *)@"CloudSyncStateEntityDomainMedications";
}

- (NSString)key
{
  return (NSString *)@"cloudSyncStateUpdaterDelegateKeyMedications";
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedicationDelegate supportedSyncVersionRange];
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationDelegate _fetchPersistedMeds:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_fetchPersistedMeds:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  v11 = (void *)MEMORY[0x1E4F65C30];
  v12 = +[HDCloudSyncStateUpdaterMedicationDelegate _medicationsPredicate]();
  v13 = +[HDCloudSyncStateUpdaterMedicationDelegate _medsListOrderingTerms]();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__HDCloudSyncStateUpdaterMedicationDelegate__fetchPersistedMeds_profile_transaction_error___block_invoke;
  v25[3] = &unk_1E6336D08;
  v25[4] = &v26;
  LOBYTE(a5) = [v11 enumerateCodableObjectsForPredicate:v12 limit:500 orderingTerms:v13 profile:v8 transaction:v9 error:a5 handler:v25];

  if ((a5 & 1) == 0)
  {
LABEL_8:
    uint64_t v18 = 0;
    goto LABEL_14;
  }
  v14 = [(id)v27[5] concepts];
  BOOL v15 = (unint64_t)[v14 count] > 0x1F3;

  if (v15)
  {
    if (!*MEMORY[0x1E4F65C50])
    {
      _HKInitializeLogging();
      v16 = HKLogMedication();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v23 = [(id)v27[5] concepts];
        uint64_t v24 = [v23 count];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v10;
        __int16 v34 = 2048;
        uint64_t v35 = v24;
        _os_log_fault_impl(&dword_1BD54A000, v16, OS_LOG_TYPE_FAULT, "[%{public}@] Trying to query for at least %ld medications for state sync, but this is too many!", buf, 0x16u);
      }
    }
    id v17 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 13, @"%@ Unable to update the cloud state because max medication count (%ld) exceeded", v10, 500);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v19 = HKLogMedication();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(id)v27[5] concepts];
    uint64_t v21 = [v20 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v21;
    _os_log_impl(&dword_1BD54A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetch %ld local medications for state sync", buf, 0x16u);
  }
  if (a2) {
    *a2 = (id) v27[5];
  }
  uint64_t v18 = 1;
LABEL_14:
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = self;
  id v15 = 0;
  int v9 = [v7 decodedObjectOfClass:objc_opt_class() version:0 decodedObject:&v15 error:a5];

  id v10 = v15;
  uint64_t v11 = 0;
  if (v9)
  {
    _HKInitializeLogging();
    v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v10 conceptsCount];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %ld cloud medications for state sync", buf, 0x16u);
    }

    if (a2) {
      *a2 = v10;
    }
    uint64_t v11 = 1;
  }

  return v11;
}

- (int64_t)shouldUpdateWithMergedState:(id *)a3 cloudState:(id)a4 localState:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationDelegate.m", 90, @"Invalid parameter not satisfying: %@", @"[cloudState isKindOfClass:HDCodableUserDomainConceptCollection.class]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationDelegate.m", 91, @"Invalid parameter not satisfying: %@", @"[localState isKindOfClass:HDCodableUserDomainConceptCollection.class]" object file lineNumber description];
  }
  int64_t v19 = +[HDCloudSyncStateUpdaterMedicationDelegate _shouldUpdateWithMergedState:cloudState:localState:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, a3, v15, v16, v17, v18, (uint64_t)a8);

  return v19;
}

+ (uint64_t)_shouldUpdateWithMergedState:(void *)a3 cloudState:(void *)a4 localState:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = objc_alloc_init(MEMORY[0x1E4F65AE8]);
  id v29 = 0;
  uint64_t v17 = +[HDCloudSyncStateUpdaterMedicationDelegate _didUpdateMergedConcepts:cloudState:localState:profile:nonDeletedCloudConceptUUIDs:error:](v15, v16, v14, v13, v11, &v29);

  id v18 = v29;
  _HKInitializeLogging();
  int64_t v19 = HKLogMedication();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = HKStringFromStateSyncMergeResult();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    uint64_t v33 = v20;
    _os_log_impl(&dword_1BD54A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ merge result \"%{public}@\"", buf, 0x16u);
  }
  BOOL v21 = v17 == 3;
  BOOL v22 = v17 == 2;
  uint64_t v23 = +[HDCloudSyncStateUpdaterMedicationDelegate _replaceDeletedConceptIn:nonDeletedCloudConceptUUIDs:profile:transaction:error:](v15, v16, v18, v11, v12, a7);

  _HKInitializeLogging();
  uint64_t v24 = HKLogMedication();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = HKStringFromStateSyncMergeResult();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    uint64_t v33 = v25;
    _os_log_impl(&dword_1BD54A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ replace deleted concepts result \"%{public}@\"", buf, 0x16u);
  }
  if (v23)
  {
    if (v23 == 3)
    {
      BOOL v21 = 1;
    }
    else if (v23 == 2)
    {
      BOOL v22 = 1;
    }
    if (a2) {
      *a2 = v16;
    }
    uint64_t v26 = 1;
    if (v22) {
      uint64_t v26 = 2;
    }
    if (v21) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = v26;
    }
  }

  return v23;
}

- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationDelegate.m", 106, @"Invalid parameter not satisfying: %@", @"[mergeState isKindOfClass:HDCodableUserDomainConceptCollection.class]" object file lineNumber description];
  }
  +[HDCloudSyncStateUpdaterMedicationDelegate _updateCodableSyncState:withMergeState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, v10, v11, v12);

  return 1;
}

+ (uint64_t)_updateCodableSyncState:(uint64_t)a1 withMergeState:(void *)a2 profile:(void *)a3 error:(void *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  uint64_t v9 = self;
  _HKInitializeLogging();
  id v10 = HKLogMedication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 conceptsCount];
    _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld medications in cloud state for state sync", (uint8_t *)&v12, 0x16u);
  }

  [v8 setCodableObject:v6 version:0 profile:v7];
  return 1;
}

- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationDelegate.m", 118, @"Invalid parameter not satisfying: %@", @"[codableCloudState isKindOfClass:HDCodableUserDomainConceptCollection.class]" object file lineNumber description];
  }
  char v11 = +[HDCloudSyncStateUpdaterMedicationDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationDelegate, v9, v10, (uint64_t)a5);

  return v11;
}

+ (uint64_t)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 conceptsCount];
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %ld medication concepts for state sync", (uint8_t *)&v14, 0x16u);
  }

  id v10 = (void *)MEMORY[0x1E4F65C30];
  char v11 = [v6 concepts];
  uint64_t v12 = objc_msgSend(v10, "receiveSyncObjects:version:syncProvenance:profile:error:", v11, objc_msgSend(MEMORY[0x1E4F65C30], "supportedSyncVersionRange"), 0, v7, a4);

  return v12;
}

+ (id)_medicationsPredicate
{
  self;
  v0 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
  v1 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();

  return v1;
}

+ (id)_medsListOrderingTerms
{
  v4[1] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F65D50]);
  v1 = (void *)[v0 initWithExpression:*MEMORY[0x1E4F65A48] ascending:1];
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

uint64_t __91__HDCloudSyncStateUpdaterMedicationDelegate__fetchPersistedMeds_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F65AE8]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addConcepts:v3];

  return 1;
}

+ (uint64_t)_didUpdateMergedConcepts:(uint64_t)a1 cloudState:(void *)a2 localState:(void *)a3 profile:(void *)a4 nonDeletedCloudConceptUUIDs:(void *)a5 error:(void *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v9 = a3;
  id v10 = a4;
  id v37 = a5;
  uint64_t v36 = self;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  __int16 v32 = v9;
  id obj = [v9 concepts];
  uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    char v33 = 0;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(obj);
        }
        __int16 v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1C187D3A0]();
        if (([v16 deleted] & 1) == 0)
        {
          uint64_t v18 = (void *)MEMORY[0x1E4F29128];
          int64_t v19 = [v16 uuid];
          uint64_t v20 = objc_msgSend(v18, "hk_UUIDWithData:", v19);
          [v34 addObject:v20];
        }
        BOOL v21 = [v10 concepts];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __134__HDCloudSyncStateUpdaterMedicationDelegate__didUpdateMergedConcepts_cloudState_localState_profile_nonDeletedCloudConceptUUIDs_error___block_invoke;
        v39[3] = &unk_1E6337150;
        v39[4] = v16;
        BOOL v22 = objc_msgSend(v21, "hk_firstObjectPassingTest:", v39);

        if (v22)
        {
          uint64_t v23 = +[HDCloudSyncStateUpdaterMedicationDelegate _mergeCloudConcept:localConcept:profile:](v36, v16, v22, v37);
          if (v23 == v16)
          {
            [v16 modificationDate];
            double v25 = v24;
            [v22 modificationDate];
            if (v25 > v26) {
              int v13 = 1;
            }
          }
          else
          {
            char v33 = 1;
          }
          [v38 addConcepts:v23];
        }
        else
        {
          [v38 addConcepts:v16];
          v13 |= [v16 deleted] ^ 1;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
    char v33 = 0;
  }

  if (a6) {
    *a6 = v34;
  }
  char v27 = v33 | +[HDCloudSyncStateUpdaterMedicationDelegate _didAddNewLocalConcepts:toMergedConcepts:](v36, v10, v38);
  uint64_t v28 = 1;
  if (v13) {
    uint64_t v28 = 2;
  }
  if (v27) {
    uint64_t v29 = 3;
  }
  else {
    uint64_t v29 = v28;
  }

  return v29;
}

+ (uint64_t)_replaceDeletedConceptIn:(void *)a3 nonDeletedCloudConceptUUIDs:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = self;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 1;
  uint64_t v15 = +[HDCloudSyncStateUpdaterMedicationDelegate _deletedConceptPredicateWithUUIDs:](v14, v11);
  __int16 v16 = (void *)MEMORY[0x1E4F65C30];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke;
  v20[3] = &unk_1E6337178;
  BOOL v22 = &v23;
  id v17 = v10;
  id v21 = v17;
  if ([v16 enumerateCodableObjectsForPredicate:v15 limit:0 orderingTerms:0 profile:v12 transaction:v13 error:a6 handler:v20])uint64_t v18 = v24[3]; {
  else
  }
    uint64_t v18 = 0;

  _Block_object_dispose(&v23, 8);
  return v18;
}

uint64_t __134__HDCloudSyncStateUpdaterMedicationDelegate__didUpdateMergedConcepts_cloudState_localState_profile_nonDeletedCloudConceptUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToData:v4];

  return v5;
}

+ (id)_mergeCloudConcept:(void *)a3 localConcept:(void *)a4 profile:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  char v9 = [v6 deleted];
  id v10 = v6;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    id v12 = v7;
    [v12 modificationDate];
    double v14 = v13;
    [v10 modificationDate];
    if (v14 <= v15)
    {
      id v16 = v12;
      id v12 = v10;
    }
    else
    {

      id v16 = v10;
    }
    id v17 = [MEMORY[0x1E4F2B630] createWithCodableConcept:v12 profile:v8];
    uint64_t v18 = [MEMORY[0x1E4F2B630] createWithCodableConcept:v16 profile:v8];
    int64_t v19 = (void *)[v17 copyUserDomainConceptByMergingInConcept:v18];
    uint64_t v20 = v19;
    if (v19 == v17)
    {
      id v21 = v12;
    }
    else
    {
      id v21 = [v19 codableRepresentationForSyncWithProfile:v8];
    }
    id v11 = v21;
  }
  return v11;
}

+ (uint64_t)_didAddNewLocalConcepts:(void *)a3 toMergedConcepts:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v4 concepts];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v14 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v5 concepts];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __86__HDCloudSyncStateUpdaterMedicationDelegate__didAddNewLocalConcepts_toMergedConcepts___block_invoke;
        v16[3] = &unk_1E6337150;
        v16[4] = v10;
        char v12 = objc_msgSend(v11, "hk_containsObjectPassingTest:", v16);

        if ((v12 & 1) == 0)
        {
          [v5 addConcepts:v10];
          char v14 = 1;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

uint64_t __86__HDCloudSyncStateUpdaterMedicationDelegate__didAddNewLocalConcepts_toMergedConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToData:v4];

  return v5;
}

+ (id)_deletedConceptPredicateWithUUIDs:(uint64_t)a1
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = (void *)MEMORY[0x1E4F65D08];
  id v4 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65A28] equalToValue:MEMORY[0x1E4F1CC38]];
  v9[0] = v4;
  uint64_t v5 = HDUserDomainConceptEntityPredicateForConceptUUIDs();

  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v3 predicateMatchingAllPredicates:v6];

  return v7;
}

uint64_t __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 3;
  id v4 = [*(id *)(a1 + 32) concepts];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke_2;
  v7[3] = &unk_1E6337150;
  id v8 = v3;
  id v5 = v3;
  objc_msgSend(v4, "hk_removeObjectsPassingTest:", v7);

  [*(id *)(a1 + 32) addConcepts:v5];
  return 1;
}

uint64_t __124__HDCloudSyncStateUpdaterMedicationDelegate__replaceDeletedConceptIn_nonDeletedCloudConceptUUIDs_profile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToData:v4];

  return v5;
}

@end