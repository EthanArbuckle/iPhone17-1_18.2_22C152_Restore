@interface HDCloudSyncStateUpdaterMedicationScheduleDelegate
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ (BOOL)_fetchLocalState:(void *)a3 predicate:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:;
+ (BOOL)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)_finalScheduleFromCloudSchedule:(void *)a3 localSchedule:;
+ (id)_unavailableSchedulesPredicate;
+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:;
+ (uint64_t)_newLocalSchedulesGivenCloudState:(void *)a3 localState:;
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

@implementation HDCloudSyncStateUpdaterMedicationScheduleDelegate

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDCloudSyncStateUpdaterMedicationScheduleDelegate *)self domain];
  v6 = [(HDCloudSyncStateUpdaterMedicationScheduleDelegate *)self key];
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
  return (NSString *)@"cloudSyncStateUpdaterDelegateKeyMedicationSchedules";
}

- ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)+[HDCloudSyncStateUpdaterMedicationScheduleDelegate supportedSyncVersionRange];
}

- (BOOL)fetchLocalState:(id *)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  self;
  v11 = +[HDMedicationScheduleEntity availableSchedulePredicate];
  LOBYTE(a6) = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchLocalState:predicate:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, v11, v10, v9, (uint64_t)a6);

  return (char)a6;
}

+ (BOOL)_fetchLocalState:(void *)a3 predicate:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__11;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__HDCloudSyncStateUpdaterMedicationScheduleDelegate__fetchLocalState_predicate_profile_transaction_error___block_invoke;
  v19[3] = &unk_1E6338038;
  v19[4] = &v20;
  BOOL v14 = +[HDVersionedMedicationScheduleSyncEntity enumerateCodableObjectsForPredicate:v10 limit:0 orderingTerms:0 profile:v11 transaction:v12 error:a6 handler:v19];
  if (v14)
  {
    _HKInitializeLogging();
    v15 = HKLogMedication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(id)v21[5] schedules];
      uint64_t v17 = [v16 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %ld local medication schedules for state sync", buf, 0x16u);
    }
    if (a2) {
      *a2 = (id) v21[5];
    }
  }
  _Block_object_dispose(&v20, 8);

  return v14;
}

- (int64_t)fetchCloudState:(id *)a3 codableSyncState:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchCloudState:codableSyncState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, a4, (uint64_t)a4, (uint64_t)a6);
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(uint64_t)a4 profile:(uint64_t)a5 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = self;
  id v16 = 0;
  int v9 = [v7 decodedObjectOfClass:objc_opt_class() version:0 decodedObject:&v16 error:a5];

  id v10 = v16;
  uint64_t v11 = 0;
  if (v9)
  {
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v10 schedules];
      uint64_t v14 = [v13 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode %ld cloud medication schedules for state sync", buf, 0x16u);
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
    [v21 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationScheduleDelegate.m", 103, @"Invalid parameter not satisfying: %@", @"[cloudState isKindOfClass:HDCodableMedicationScheduleCollection.class]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationScheduleDelegate.m", 104, @"Invalid parameter not satisfying: %@", @"[localState isKindOfClass:HDCodableMedicationScheduleCollection.class]" object file lineNumber description];
  }
  int64_t v19 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _shouldUpdateWithMergedState:cloudState:localState:profile:transaction:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, a3, v15, v16, v17, v18, (uint64_t)a8);

  return v19;
}

+ (uint64_t)_shouldUpdateWithMergedState:(void *)a3 cloudState:(void *)a4 localState:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = self;
  v48 = objc_alloc_init(HDCodableMedicationScheduleCollection);
  id v54 = 0;
  id v17 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _unavailableSchedulesPredicate]();
  LODWORD(a7) = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _fetchLocalState:predicate:profile:transaction:error:](v16, &v54, v17, v14, v15, a7);
  id v18 = v54;

  uint64_t v19 = 0;
  if (a7)
  {
    v42 = a2;
    id v43 = v15;
    id v44 = v14;
    uint64_t v20 = v13;
    uint64_t v21 = [v13 schedules];
    id v41 = v18;
    uint64_t v22 = [v18 schedules];
    [v21 addObjectsFromArray:v22];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v45 = v12;
    id obj = [v12 schedules];
    uint64_t v23 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      char v25 = 0;
      char v46 = 0;
      uint64_t v26 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(obj);
          }
          __int16 v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v29 = [v20 schedules];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __130__HDCloudSyncStateUpdaterMedicationScheduleDelegate__shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke;
          v49[3] = &unk_1E6338060;
          v49[4] = v28;
          uint64_t v30 = objc_msgSend(v29, "hk_firstObjectPassingTest:", v49);

          v31 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _finalScheduleFromCloudSchedule:localSchedule:](v16, v28, v30);
          if (v31 == v28)
          {
            [v28 creationDate];
            double v33 = v32;
            [v30 creationDate];
            if (v33 > v34
              || ([v28 hasFutureCompatibilityVersion] & 1) == 0
              && [v30 isLocallyUnavailable])
            {
              char v46 = 1;
            }
          }
          else
          {
            char v25 = 1;
          }
          [(HDCodableMedicationScheduleCollection *)v48 addSchedules:v31];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v24);
    }
    else
    {
      char v25 = 0;
      char v46 = 0;
    }

    id v12 = v45;
    id v13 = v20;
    v35 = (void *)+[HDCloudSyncStateUpdaterMedicationScheduleDelegate _newLocalSchedulesGivenCloudState:localState:](v16, v45, v20);
    id v15 = v43;
    id v14 = v44;
    id v18 = v41;
    if ([v35 count])
    {
      _HKInitializeLogging();
      v36 = HKLogMedication();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v35 count];
        *(_DWORD *)buf = 138543618;
        uint64_t v56 = v16;
        __int16 v57 = 2048;
        uint64_t v58 = v37;
        _os_log_impl(&dword_1BD54A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld new local schedules, update the cloud state", buf, 0x16u);
      }

      v38 = [(HDCodableMedicationScheduleCollection *)v48 schedules];
      [v38 addObjectsFromArray:v35];

      char v25 = 1;
    }
    if (v42) {
      void *v42 = v48;
    }
    uint64_t v39 = 1;
    if (v46) {
      uint64_t v39 = 2;
    }
    if (v25) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = v39;
    }
  }
  return v19;
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
    [v14 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationScheduleDelegate.m", 119, @"Invalid parameter not satisfying: %@", @"[mergeState isKindOfClass:HDCodableMedicationScheduleCollection.class]" object file lineNumber description];
  }
  +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _updateCodableSyncState:withMergeState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, v10, v11, v12);

  return 1;
}

+ (uint64_t)_updateCodableSyncState:(uint64_t)a1 withMergeState:(void *)a2 profile:(void *)a3 error:(void *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  uint64_t v9 = self;
  _HKInitializeLogging();
  id v10 = HKLogMedication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 schedules];
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = [v11 count];
    _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld medication schedules in cloud state for state sync", (uint8_t *)&v13, 0x16u);
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
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncStateUpdaterMedicationScheduleDelegate.m", 131, @"Invalid parameter not satisfying: %@", @"[codableCloudState isKindOfClass:HDCodableMedicationScheduleCollection.class]" object file lineNumber description];
  }
  BOOL v11 = +[HDCloudSyncStateUpdaterMedicationScheduleDelegate _persistCloudState:profile:error:]((uint64_t)HDCloudSyncStateUpdaterMedicationScheduleDelegate, v9, v10, (uint64_t)a5);

  return v11;
}

+ (BOOL)_persistCloudState:(void *)a3 profile:(uint64_t)a4 error:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  id v9 = [v7 schedules];

  id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_13);

  _HKInitializeLogging();
  BOOL v11 = HKLogMedication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = [v10 count];
    _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %ld medication schedules for state sync", (uint8_t *)&v14, 0x16u);
  }

  BOOL v12 = +[HDVersionedMedicationScheduleSyncEntity receiveCodableSchedules:v10 syncProvenance:0 profile:v6 error:a4];
  return v12;
}

uint64_t __106__HDCloudSyncStateUpdaterMedicationScheduleDelegate__fetchLocalState_predicate_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = objc_alloc_init(HDCodableMedicationScheduleCollection);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = objc_alloc_init(HDCodableMedicationScheduleData);
  uint64_t v8 = [v3 uuid];
  [(HDCodableMedicationScheduleData *)v7 setUuid:v8];

  [v3 creationDate];
  -[HDCodableMedicationScheduleData setCreationDate:](v7, "setCreationDate:");
  id v9 = [v3 compatibilityVersionRange];
  [(HDCodableMedicationScheduleData *)v7 setCompatibilityVersionRange:v9];

  id v10 = [v3 data];
  [(HDCodableMedicationScheduleData *)v7 setScheduleData:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addSchedules:v7];
  return 1;
}

+ (id)_unavailableSchedulesPredicate
{
  self;
  v0 = (void *)MEMORY[0x1E4F65D08];
  v1 = +[HDMedicationScheduleEntity availableSchedulePredicate];
  v2 = [v0 negatedPredicate:v1];

  return v2;
}

uint64_t __130__HDCloudSyncStateUpdaterMedicationScheduleDelegate__shouldUpdateWithMergedState_cloudState_localState_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToData:v4];

  return v5;
}

+ (id)_finalScheduleFromCloudSchedule:(void *)a3 localSchedule:
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = v4;
  if (v5)
  {
    char v7 = [v5 isLocallyUnavailable];
    id v6 = v4;
    if ((v7 & 1) == 0)
    {
      [v4 creationDate];
      double v9 = v8;
      [v5 creationDate];
      if (v9 < v10) {
        id v6 = v5;
      }
      else {
        id v6 = v4;
      }
    }
  }
  id v11 = v6;

  return v11;
}

+ (uint64_t)_newLocalSchedulesGivenCloudState:(void *)a3 localState:
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = [v5 schedules];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke;
  v10[3] = &unk_1E6338060;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "hk_filter:", v10);

  return v8;
}

uint64_t __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocallyUnavailable])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) schedules];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke_2;
    v7[3] = &unk_1E6338060;
    id v8 = v3;
    uint64_t v4 = objc_msgSend(v5, "hk_containsObjectPassingTest:", v7) ^ 1;
  }
  return v4;
}

uint64_t __98__HDCloudSyncStateUpdaterMedicationScheduleDelegate__newLocalSchedulesGivenCloudState_localState___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 uuid];
  id v5 = [v3 uuid];

  uint64_t v6 = [v4 isEqualToData:v5];
  return v6;
}

HDCodableMedicationSchedule *__86__HDCloudSyncStateUpdaterMedicationScheduleDelegate__persistCloudState_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [HDCodableMedicationSchedule alloc];
  uint64_t v4 = [v2 scheduleData];

  id v5 = [(HDCodableMedicationSchedule *)v3 initWithData:v4];
  return v5;
}

@end