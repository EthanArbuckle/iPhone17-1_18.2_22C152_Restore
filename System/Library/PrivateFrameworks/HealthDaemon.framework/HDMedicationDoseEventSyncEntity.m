@interface HDMedicationDoseEventSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (Class)_syncedSampleTypeClass;
+ (Class)healthEntityClass;
+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4;
+ (id)_objectWithCodable:(id)a3 collection:(id)a4;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (id)syncEntityIdentifier;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
@end

@implementation HDMedicationDoseEventSyncEntity

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:63];
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B1F0], "createWithCodable:", a3, a4);
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a4 daemon];
  v7 = [v6 behavior];
  int v8 = [v7 supportsSampleExpiration];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v12 = objc_msgSend(v9, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v11, v5, *MEMORY[0x1E4F2AB00]);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a5;
  v16 = [a1 _predicateForSyncSession:v13];
  char v17 = objc_msgSend((id)objc_msgSend(a1, "healthEntityClass"), "generateSyncObjectsForSession:syncEntityClass:predicate:syncAnchorRange:profile:messageHandler:error:", v13, a1, v16, start, end, v15, v14, a7);

  v18 = [v13 syncStore];
  uint64_t v19 = [v18 syncStoreType];

  if (v19 == 1)
  {
    _HKInitializeLogging();
    v20 = HKLogMedication();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HKStringFromBool();
      *(_DWORD *)buf = 138544642;
      id v24 = a1;
      __int16 v25 = 2048;
      int64_t v26 = start;
      __int16 v27 = 2048;
      int64_t v28 = end;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      v34 = v16;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: objects for (%ld, %ld) %{public}@ session %{public}@ predicate %{public}@", buf, 0x3Eu);
    }
  }

  return v17;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = [a1 _predicateForSyncSession:v10];
  id v13 = (void *)[a1 healthEntityClass];
  id v14 = [v11 database];

  int64_t v15 = [v13 nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v10 healthDatabase:v14 error:a6];
  v16 = [v10 syncStore];
  uint64_t v17 = [v16 syncStoreType];

  if (v17 == 1)
  {
    _HKInitializeLogging();
    v18 = HKLogMedication();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138544386;
      id v21 = a1;
      __int16 v22 = 2048;
      int64_t v23 = v15;
      __int16 v24 = 2048;
      int64_t v25 = a4;
      __int16 v26 = 2114;
      id v27 = v10;
      __int16 v28 = 2114;
      __int16 v29 = v12;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: next %ld for start %ld session %{public}@ predicate %{public}@", (uint8_t *)&v20, 0x34u);
    }
  }
  return v15;
}

@end