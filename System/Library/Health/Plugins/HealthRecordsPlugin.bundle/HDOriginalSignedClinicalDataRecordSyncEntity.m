@interface HDOriginalSignedClinicalDataRecordSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDOriginalSignedClinicalDataRecordSyncEntity

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] != (char *)&dword_0 + 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:10];
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)HDCodableOriginalSignedClinicalDataRecord) initWithData:v3];

  return v4;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = -1;
  v16 = [v13 database];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_7557C;
  v27[3] = &unk_111780;
  id v17 = v12;
  int64_t v32 = var0;
  int64_t v33 = var1;
  id v28 = v17;
  v31 = &v34;
  id v18 = v13;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  unsigned int v20 = +[HDOriginalSignedClinicalDataRecordEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:v27];

  _HKInitializeLogging();
  v21 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    v22 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [v19 count];
      *(_DWORD *)buf = 138544130;
      id v39 = a1;
      __int16 v40 = 2114;
      id v41 = v18;
      __int16 v42 = 2048;
      id v43 = v25;
      __int16 v44 = 1026;
      unsigned int v45 = v20;
      _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ generated %lu sync objects, success: %{public}d", buf, 0x26u);
    }
  }
  if (v20) {
    unsigned __int8 v23 = [v14 sendCodableChange:v19 resultAnchor:v35[3] sequence:0 done:1 error:a7];
  }
  else {
    unsigned __int8 v23 = 0;
  }

  _Block_object_dispose(&v34, 8);
  return v23;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = objc_msgSend(a3, "hk_filter:", &stru_114270);
  id v13 = [v11 syncProvenance];

  LODWORD(a7) = +[HDOriginalSignedClinicalDataRecordEntity insertCodableOriginalRecordsFromSync:v12 syncProvenance:v13 profile:v10 error:a7];
  return a7 ^ 1;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a5 database];
  id v11 = +[HDOriginalSignedClinicalDataRecordEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return (int64_t)v11;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
}

@end