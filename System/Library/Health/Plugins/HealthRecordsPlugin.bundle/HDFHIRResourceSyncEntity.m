@interface HDFHIRResourceSyncEntity
+ (BOOL)_shouldInsertReceivedCodableResource:(id)a3;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_syncObjectsGenerationPredicate;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDFHIRResourceSyncEntity

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] != (char *)&dword_0 + 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:4];
}

+ (id)_syncObjectsGenerationPredicate
{
  return +[HDOriginalFHIRResourceEntity predicateForResourcesForLegacySync];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v29 = a6;
  id v12 = [v10 maxEncodedBytesPerCodableChangeForSyncEntityClass:a1];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = [v11 database];
  uint64_t v51 = 0;
  v52[0] = &v51;
  v52[1] = 0x2020000000;
  v52[2] = -1;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v16 = [v11 database];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_A3D2C;
  v31[3] = &unk_114E78;
  id v40 = a1;
  HDSyncAnchorRange v41 = a4;
  id v28 = v10;
  id v32 = v28;
  v37 = &v51;
  id v17 = v15;
  id v33 = v17;
  id v18 = v14;
  id v34 = v18;
  id v19 = v11;
  id v35 = v19;
  v38 = &v47;
  id v42 = v12;
  id v20 = v13;
  id v36 = v20;
  v39 = &v43;
  unsigned int v21 = +[HDOriginalFHIRResourceEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:v31];

  if (v48[3] > (uint64_t)v12)
  {
    if ([v20 count])
    {
      *(void *)(v52[0] + 24) = v44[3];
    }
    else
    {
      _HKInitializeLogging();
      v22 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B52DC((uint64_t)a1, (uint64_t)v52, v22);
      }
    }
  }
  _HKInitializeLogging();
  v23 = HKLogHealthRecords;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v20 count];
    *(_DWORD *)buf = 138543874;
    id v54 = a1;
    __int16 v55 = 2050;
    id v56 = v24;
    __int16 v57 = 1026;
    unsigned int v58 = v21;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ generated %{public}lu sync objects, success: %{public}d", buf, 0x1Cu);
  }

  if (v21) {
    unsigned __int8 v25 = [v29 sendCodableChange:v20 resultAnchor:*(void *)(v52[0] + 24) sequence:0 done:1 error:a7];
  }
  else {
    unsigned __int8 v25 = 0;
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v25;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a1 _syncObjectsGenerationPredicate];
  id v13 = [v10 database];

  id v14 = +[HDOriginalFHIRResourceEntity nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v11 healthDatabase:v13 error:a6];
  return (int64_t)v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)HDCodableFHIRResource) initWithData:v3];

  return v4;
}

+ (BOOL)_shouldInsertReceivedCodableResource:(id)a3
{
  return [a3 hasMessageVersion] ^ 1;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_A45E4;
  v22[3] = &unk_113820;
  v22[4] = a1;
  v22[5] = a2;
  v15 = objc_msgSend(v12, "hk_filter:", v22);
  _HKInitializeLogging();
  v16 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v16;
    id v20 = [v12 count];
    id v21 = [v15 count];
    *(_DWORD *)buf = 138544130;
    id v24 = a1;
    __int16 v25 = 2114;
    id v26 = v14;
    __int16 v27 = 2050;
    id v28 = v20;
    __int16 v29 = 2050;
    id v30 = v21;
    _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ received %{public}lu sync objects, will upsert %{public}lu", buf, 0x2Au);
  }
  unsigned int v17 = +[HDOriginalFHIRResourceEntity _insertCodableFHIRResources:syncProvenance:profile:error:](HDOriginalFHIRResourceEntity, "_insertCodableFHIRResources:syncProvenance:profile:error:", v15, [v13 syncProvenance], v14, a7);

  return v17 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
}

@end