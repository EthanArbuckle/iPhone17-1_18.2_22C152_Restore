@interface HDVersionedMedicationScheduleSyncEntity
+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange;
+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3;
+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)receiveCodableSchedules:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_pruningPredicateThroughAnchor:(void *)a3 nowDate:;
+ (id)_syncPredicateForSyncSession:(uint64_t)a1;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (uint64_t)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:;
@end

@implementation HDVersionedMedicationScheduleSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)[MEMORY[0x1E4F65C08] identifierWithSchema:*MEMORY[0x1E4F66938] entity:2];
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
  v27[2] = __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
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

BOOL __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = +[HDMedicationScheduleEntity entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:0 encodingOptions:0 authorizationFilter:0];
  v5 = [v4 orderedProperties];
  v6 = +[HDVersionedMedicationScheduleSyncEntity _syncPredicateForSyncSession:](*(void *)(a1 + 72), *(void **)(a1 + 40));
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6336D30;
  id v19 = v4;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v20 = v10;
  uint64_t v21 = v11;
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  id v14 = v4;
  BOOL v15 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDMedicationScheduleEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v5, v6, v8, v13, v12, 0, v7, v9, a3, v18);

  return v15;
}

+ (id)_syncPredicateForSyncSession:(uint64_t)a1
{
  id v2 = a2;
  self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v2 nanoSyncStore],
        v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isMaster],
        v3,
        (v4 & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    v5 = +[HDMedicationScheduleEntity availableSchedulePredicate];
  }

  return v5;
}

BOOL __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  id v10 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v10 encodedByteCount];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56)) {
      *a7 = 1;
    }
  }

  return v10 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = +[HDVersionedMedicationScheduleSyncEntity _syncPredicateForSyncSession:]((uint64_t)a1, v11);
  uint64_t v13 = [v10 database];

  int64_t v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v11 healthDatabase:v13 error:a6];
  return v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  char v4 = [[HDCodableMedicationSchedule alloc] initWithData:v3];

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  _HKInitializeLogging();
  BOOL v15 = HKLogMedication();
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
      char v24 = v20;
      __int16 v25 = 1026;
      int var0 = a4.var0;
      __int16 v27 = 1026;
      int var1 = a4.var1;
      _os_log_debug_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Received %{public}@ sync objects for version: minimum=%{public}u, current=%{public}u", (uint8_t *)&v21, 0x22u);
    }
  }
  int v18 = +[HDVersionedMedicationScheduleSyncEntity _insertCodableMedicationSchedules:version:syncStore:profile:error:]((uint64_t)a1, v12, a4.var0, v13, v14, (uint64_t)a7);

  return v18 ^ 1u;
}

+ (uint64_t)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  if (a3 < 3)
  {
    uint64_t v18 = objc_msgSend(v13, "receiveCodableSchedules:syncProvenance:profile:error:", v10, objc_msgSend(v11, "syncProvenance"), v12, a6);
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v10 count];
      BOOL v16 = HDSyncVersionRangeToString();
      v17 = HDSyncVersionRangeToString();
      int v20 = 138544386;
      int v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      id v25 = v11;
      __int16 v26 = 2114;
      __int16 v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %lu sync objects from sync store %{public}@ with version %{public}@ because our current version is %{public}@", (uint8_t *)&v20, 0x34u);
    }
    uint64_t v18 = 0;
  }

  return v18;
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

+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v19 = +[HDMedicationScheduleEntity entityEncoderForProfile:a6 transaction:v16 purpose:0 encodingOptions:0 authorizationFilter:0];
  int v20 = [v16 protectedDatabase];

  int v21 = +[HDSQLiteEntity queryWithDatabase:v20 predicate:v18 limit:a4 orderingTerms:v17 groupBy:0];

  __int16 v22 = [v19 orderedProperties];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __133__HDVersionedMedicationScheduleSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke;
  v26[3] = &unk_1E6336D80;
  id v27 = v19;
  id v28 = v15;
  id v23 = v15;
  id v24 = v19;
  LOBYTE(a8) = [v21 enumeratePersistentIDsAndProperties:v22 error:a8 enumerationHandler:v26];

  return (char)a8;
}

uint64_t __133__HDVersionedMedicationScheduleSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", a2);
  if (v3) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)receiveCodableSchedules:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  v9 = (void *)MEMORY[0x1E4F66B28];
  id v10 = a5;
  id v11 = objc_msgSend(v9, "hd_medicationSchedulesFromCodables:profile:ignoreDuplicates:", a3, v10, 0);
  id v12 = [v10 healthMedicationsProfileExtension];
  id v13 = [v12 medicationScheduleManager];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke;
  v24[3] = &unk_1E6336DA8;
  id v25 = v11;
  id v26 = v13;
  int64_t v27 = a4;
  id v14 = v13;
  id v15 = v11;
  id v16 = (void *)MEMORY[0x1C187D5B0](v24);
  id v17 = [v10 database];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_2;
  v22[3] = &unk_1E6336DD0;
  id v23 = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_3;
  v20[3] = &unk_1E6336DF8;
  id v21 = v23;
  id v18 = v23;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v17 error:a6 block:v22 inaccessibilityHandler:v20];

  return (char)a6;
}

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke(uint64_t a1, uint64_t a2)
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
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 40);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (void)v16);
        uint64_t v12 = *(void *)(a1 + 48);
        id v13 = [v9 entity];
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

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  _HKInitializeLogging();
  id v15 = HKLogMedication();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    long long v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int64_t v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      *(_DWORD *)uint64_t v36 = 138544130;
      *(void *)&v36[4] = a1;
      *(_WORD *)&v36[12] = 2114;
      *(void *)&v36[14] = v12;
      *(_WORD *)&v36[22] = 2114;
      v37 = v27;
      LOWORD(v38) = 2114;
      *(void *)((char *)&v38 + 2) = v13;
      _os_log_debug_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Pruning sync objects through anchor limit: %{public}@, limit: %{public}@, now date: %{public}@", v36, 0x2Au);
    }
  }
  long long v18 = +[HDVersionedMedicationScheduleSyncEntity _pruningPredicateThroughAnchor:nowDate:]((uint64_t)a1, v12, v13);
  *(void *)uint64_t v36 = 0;
  *(void *)&v36[8] = v36;
  *(void *)&v36[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  *(void *)&long long v38 = __Block_byref_object_dispose__0;
  *((void *)&v38 + 1) = &unk_1F17FC0F0;
  long long v19 = [v14 database];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __103__HDVersionedMedicationScheduleSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke;
  v28[3] = &unk_1E6336E20;
  id v20 = v18;
  uint64_t v30 = v36;
  unint64_t v31 = a4;
  id v29 = v20;
  BOOL v21 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v19 error:a7 block:v28];

  _HKInitializeLogging();
  __int16 v22 = HKLogMedication();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(*(void *)&v36[8] + 40);
    *(_DWORD *)buf = 138543618;
    id v33 = a1;
    __int16 v34 = 2112;
    uint64_t v35 = v23;
    _os_log_impl(&dword_1BD54A000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ schedules", buf, 0x16u);
  }

  if (v21) {
    id v24 = *(void **)(*(void *)&v36[8] + 40);
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  _Block_object_dispose(v36, 8);
  return v25;
}

+ (id)_pruningPredicateThroughAnchor:(void *)a3 nowDate:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = [v5 dateByAddingTimeInterval:-31536000.0];

  uint64_t v7 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"creation_date" lessThanValue:v6];
  uint64_t v8 = (void *)v7;
  if (v4)
  {
    v9 = (void *)MEMORY[0x1E4F65D08];
    v17[0] = v7;
    id v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65C70] lessThanOrEqualToValue:v4];
    v17[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    uint64_t v12 = [v9 predicateMatchingAnyPredicates:v11];

    uint64_t v8 = (void *)v12;
  }
  id v13 = (void *)MEMORY[0x1E4F65D58];
  id v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC38]];
  id v15 = [v13 compoundPredicateWithPredicate:v8 otherPredicate:v14];

  return v15;
}

uint64_t __103__HDVersionedMedicationScheduleSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = [a2 protectedDatabase];
  uint64_t v6 = +[HDSQLiteEntity queryWithDatabase:v5 predicate:a1[4] limit:a1[6] orderingTerms:0 groupBy:0];
  uint64_t v7 = [v6 deleteAllEntitiesWithError:a3];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "getChangesCount"));
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return v7;
}

@end