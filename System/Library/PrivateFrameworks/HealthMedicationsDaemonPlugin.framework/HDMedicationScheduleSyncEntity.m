@interface HDMedicationScheduleSyncEntity
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3;
+ (BOOL)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_syncPredicate;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDMedicationScheduleSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)[MEMORY[0x1E4F65C08] identifierWithSchema:*MEMORY[0x1E4F66938] entity:1];
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x200000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x200000000;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v26 = a6;
  _HKInitializeLogging();
  v15 = HKLogMedication();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = var0;
      *(_WORD *)&buf[22] = 2050;
      uint64_t v39 = var1;
      _os_log_debug_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Generating sync objects for session with sync anchor: start=%{public}lld, end=%{public}lld", buf, 0x20u);
    }
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v39 = -1;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  uint64_t v19 = [v13 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  v20 = [v14 database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v27[3] = &unk_1E6336D58;
  id v21 = v14;
  id v28 = v21;
  id v33 = a1;
  id v22 = v13;
  int64_t v34 = var0;
  int64_t v35 = var1;
  id v29 = v22;
  v31 = buf;
  id v23 = v18;
  id v30 = v23;
  v32 = v37;
  uint64_t v36 = v19;
  LOBYTE(v19) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a7 block:v27];

  if (v19) {
    char v24 = [v26 sendCodableChange:v23 version:0x200000000 resultAnchor:*(void *)(*(void *)&buf[8] + 24) sequence:0 done:1 error:a7];
  }
  else {
    char v24 = 0;
  }

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(buf, 8);

  return v24;
}

BOOL __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = +[HDMedicationScheduleEntity entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:0 encodingOptions:0 authorizationFilter:0];
  v5 = [v4 orderedProperties];
  v6 = +[HDMedicationScheduleSyncEntity _syncPredicate]();
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v19[3] = &unk_1E63380D0;
  uint64_t v10 = *(void *)(a1 + 72);
  id v20 = v4;
  uint64_t v23 = v10;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  id v21 = v11;
  uint64_t v22 = v12;
  uint64_t v24 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  id v15 = v4;
  BOOL v16 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDMedicationScheduleEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v14, v13, 0, v7, v9, a3, v19);

  return v16;
}

+ (id)_syncPredicate
{
  self;
  v0 = (void *)MEMORY[0x1E4F65D58];
  v1 = +[HDMedicationScheduleEntity availableSchedulePredicate];
  v2 = +[HDMedicationScheduleEntity compatibilityVersion0ScheduleTypesPredicate];
  v3 = [v0 compoundPredicateWithPredicate:v1 otherPredicate:v2];

  return v3;
}

BOOL __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  [v10 setDuplicate:1];
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v10 encodedByteCount];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64)) {
      *a7 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(a1, v11);
    }
  }
  return v10 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = +[HDMedicationScheduleSyncEntity _syncPredicate]();
  uint64_t v12 = [v9 database];

  int64_t v13 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v11 session:v10 healthDatabase:v12 error:a6];
  return v13;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HDCodableMedicationSchedule alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  _HKInitializeLogging();
  id v15 = HKLogMedication();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      int v21 = 138544130;
      id v22 = a1;
      __int16 v23 = 2114;
      uint64_t v24 = v20;
      __int16 v25 = 1026;
      int var0 = a4.var0;
      __int16 v27 = 1026;
      int var1 = a4.var1;
      _os_log_debug_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Received %{public}@ sync objects, for version: minimum=%{public}d, current=%{public}d", (uint8_t *)&v21, 0x22u);
    }
  }
  BOOL v18 = +[HDMedicationScheduleSyncEntity _insertCodableMedicationSchedules:version:syncStore:profile:error:]((uint64_t)a1, v12, a4.var0, v13, v14, (uint64_t)a7);

  return !v18;
}

+ (BOOL)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  if (a3 < 3)
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F66B28], "hd_medicationSchedulesFromCodables:profile:ignoreDuplicates:", v10, v12, 1);
    int v21 = [v12 healthMedicationsProfileExtension];
    id v22 = [v21 medicationScheduleManager];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke;
    v32[3] = &unk_1E63380F8;
    id v33 = v20;
    id v34 = v22;
    id v35 = v11;
    id v23 = v22;
    id v15 = v20;
    uint64_t v24 = (void *)MEMORY[0x1C187D5B0](v32);
    __int16 v25 = [v12 database];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_2;
    v30[3] = &unk_1E6336DD0;
    id v31 = v24;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_3;
    v28[3] = &unk_1E6336DF8;
    id v29 = v31;
    id v26 = v31;
    BOOL v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v25 error:a6 block:v30 inaccessibilityHandler:v28];
  }
  else
  {
    uint64_t v14 = v13;
    _HKInitializeLogging();
    id v15 = HKLogMedication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v10 count];
      v17 = HDSyncVersionRangeToString();
      BOOL v18 = HDSyncVersionRangeToString();
      *(_DWORD *)buf = 138544386;
      uint64_t v37 = v14;
      __int16 v38 = 2048;
      uint64_t v39 = v16;
      __int16 v40 = 2114;
      id v41 = v11;
      __int16 v42 = 2114;
      v43 = v17;
      __int16 v44 = 2114;
      v45 = v18;
      _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %lu sync objects from sync store %{public}@ with version %{public}@ because our current version is %{public}@", buf, 0x34u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 setWithObject:v4];
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 40);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (void)v16);
        uint64_t v12 = [*(id *)(a1 + 48) syncProvenance];
        uint64_t v13 = [v9 entity];
        LODWORD(v10) = objc_msgSend(v10, "insertMedicationSchedules:syncProvenance:syncIdentity:error:", v11, v12, objc_msgSend(v13, "persistentID"), a2);

        if (!v10)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Codeable is nil", (uint8_t *)&v3, 0xCu);
}

@end