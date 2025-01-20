@interface HDClinicalAccountSyncEntity
+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)_syncObjectsGenerationPredicate;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDClinicalAccountSyncEntity

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] != (char *)&dword_0 + 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:1];
}

+ (id)_syncObjectsGenerationPredicate
{
  return +[HDClinicalAccountEntity predicateForAccountsForLegacySync];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v13 = a3;
  id v14 = a5;
  id v26 = a6;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = -1;
  v16 = [v14 database];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_4F4F8;
  v27[3] = &unk_112A18;
  id v32 = a1;
  id v17 = v13;
  int64_t v33 = var0;
  int64_t v34 = var1;
  id v28 = v17;
  v31 = &v35;
  id v18 = v14;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  unsigned int v20 = +[HDClinicalAccountEntity performReadTransactionWithHealthDatabase:v16 error:a7 block:v27];

  _HKInitializeLogging();
  v21 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    v22 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v25 = [v19 count];
      *(_DWORD *)buf = 138544130;
      id v40 = a1;
      __int16 v41 = 2114;
      id v42 = v18;
      __int16 v43 = 2050;
      id v44 = v25;
      __int16 v45 = 1026;
      unsigned int v46 = v20;
      _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ generated %{public}lu sync objects, success: %{public}d", buf, 0x26u);
    }
  }
  if (v20) {
    unsigned __int8 v23 = [v26 sendCodableChange:v19 resultAnchor:v36[3] sequence:0 done:1 error:a7];
  }
  else {
    unsigned __int8 v23 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v23;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = [a1 _syncObjectsGenerationPredicate];
  id v13 = [v10 database];

  id v14 = +[HDClinicalAccountEntity nextSyncAnchorWithStartAnchor:a4 predicate:v12 session:v11 healthDatabase:v13 error:a6];
  return (int64_t)v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)HDCodableClinicalAccount) initWithData:v3];

  return v4;
}

+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3
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
  v22[2] = sub_4FA5C;
  v22[3] = &unk_113820;
  v22[4] = a1;
  v22[5] = a2;
  id v15 = objc_msgSend(v12, "hk_filter:", v22);
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
  unsigned int v17 = +[HDClinicalAccountEntity _insertCodableAccounts:syncProvenance:profile:error:](HDClinicalAccountEntity, "_insertCodableAccounts:syncProvenance:profile:error:", v15, [v13 syncProvenance], v14, a7);

  return v17 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

@end