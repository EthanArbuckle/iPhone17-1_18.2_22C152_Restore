@interface HDCloudSyncStateUpdaterMedsListDelegate
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ (id)_medsListOrderingTerms;
+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:;
+ (uint64_t)_fetchPersistedMedsList:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:;
+ (uint64_t)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:;
- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6;
- (NSString)description;
- (NSString)domain;
- (NSString)key;
- (id)_mergeCloudList:(void *)a3 localList:;
- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6;
- (int64_t)shouldUpdateWithMergedState:(id *)a3 cloudState:(id)a4 localState:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
@end

@implementation HDCloudSyncStateUpdaterMedsListDelegate

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDCloudSyncStateUpdaterMedsListDelegate *)self domain];
  v6 = [(HDCloudSyncStateUpdaterMedsListDelegate *)self key];
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
  return (NSString *)@"cloudSyncStateUpdaterDelegateKeyMedsList";
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedsListDelegate supportedSyncVersionRange];
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _fetchPersistedMedsList:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_fetchPersistedMedsList:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v11 = (void *)MEMORY[0x1E4F65C30];
  self;
  v12 = [MEMORY[0x1E4F65C28] predicateForListUserDomainConceptWithType:2];
  v13 = +[HDCloudSyncStateUpdaterMedsListDelegate _medsListOrderingTerms]();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__HDCloudSyncStateUpdaterMedsListDelegate__fetchPersistedMedsList_profile_transaction_error___block_invoke;
  v18[3] = &unk_1E6336D08;
  v18[4] = &v19;
  uint64_t v14 = [v11 enumerateCodableObjectsForPredicate:v12 limit:1 orderingTerms:v13 profile:v8 transaction:v9 error:a5 handler:v18];

  if (v14)
  {
    _HKInitializeLogging();
    v15 = HKLogMedication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v20[5]) {
        v16 = @"non-nil";
      }
      else {
        v16 = @"nil";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %@ local meds list for state sync", buf, 0x16u);
    }

    if (a2) {
      *a2 = (id) v20[5];
    }
  }
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
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
      v13 = @"non-nil";
      if (!v10) {
        v13 = @"nil";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %@ cloud meds list for state sync", buf, 0x16u);
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
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  HKWithAutoreleasePool();
  if (a3) {
    *a3 = (id) v22[5];
  }
  if (*((unsigned char *)v32 + 24))
  {
    int64_t v19 = 3;
  }
  else if (*((unsigned char *)v28 + 24))
  {
    int64_t v19 = 2;
  }
  else
  {
    int64_t v19 = 1;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

uint64_t __119__HDCloudSyncStateUpdaterMedsListDelegate_shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F2B148] createWithCodableConcept:a1[4] profile:a1[5]];
  v3 = [MEMORY[0x1E4F2B148] createWithCodableConcept:a1[6] profile:a1[5]];
  uint64_t v4 = -[HDCloudSyncStateUpdaterMedsListDelegate _mergeCloudList:localList:](a1[7], v2, v3);
  if (v4 != v2)
  {
    uint64_t v5 = a1[8];
LABEL_10:
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
    goto LABEL_11;
  }
  v6 = [v2 linkCollection];
  uint64_t v7 = [v3 linkCollection];
  if (v6 != (void *)v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [v3 linkCollection];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = [v2 linkCollection];
      id v12 = [v3 linkCollection];
      char v13 = [v11 isEqual:v12];

      if (v13) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v5 = a1[9];
    goto LABEL_10;
  }

LABEL_11:
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24) || *(unsigned char *)(*(void *)(a1[9] + 8) + 24))
  {
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = a1[7];
      int v20 = 138544130;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = v4;
      __int16 v24 = 2114;
      v25 = v3;
      __int16 v26 = 2114;
      uint64_t v27 = v2;
      _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: result %{public}@ from merging %{public}@ and %{public}@", (uint8_t *)&v20, 0x2Au);
    }

    uint64_t v16 = [v4 codableRepresentationForSyncWithProfile:a1[5]];
    uint64_t v17 = *(void *)(a1[10] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  return 1;
}

- (id)_mergeCloudList:(void *)a3 localList:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = v5;
    id v8 = v6;
    uint64_t v9 = [v8 modificationDate];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [v7 modificationDate];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;

    if (v11 > v14)
    {

      id v15 = v7;
      id v7 = v8;
      id v8 = v15;
    }
    uint64_t v16 = (void *)[v7 copyUserDomainConceptByMergingInConcept:v8];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)updateCodableSyncState:(id)a3 withMergeState:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  _HKInitializeLogging();
  id v12 = HKLogMedication();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = self;
    _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set meds list in cloud state for state sync", (uint8_t *)&v14, 0xCu);
  }

  [v11 setCodableObject:v10 version:0 profile:v9];
  return 1;
}

- (BOOL)persistCloudState:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDCloudSyncStateUpdaterMedsListDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedsListDelegate, a3, a4, (uint64_t)a5);
}

+ (uint64_t)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist meds list for state sync", buf, 0xCu);
  }

  id v10 = (void *)MEMORY[0x1E4F65C30];
  id v14 = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  uint64_t v12 = objc_msgSend(v10, "receiveSyncObjects:version:syncProvenance:profile:error:", v11, objc_msgSend(MEMORY[0x1E4F65C30], "supportedSyncVersionRange"), 0, v6, a4);

  return v12;
}

+ (id)_medsListOrderingTerms
{
  v4[1] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F65D50]);
  v1 = (void *)[v0 initWithExpression:*MEMORY[0x1E4F65A40] ascending:0];
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

uint64_t __93__HDCloudSyncStateUpdaterMedsListDelegate__fetchPersistedMedsList_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

@end