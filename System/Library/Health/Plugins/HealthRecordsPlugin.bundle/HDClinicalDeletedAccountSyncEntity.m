@interface HDClinicalDeletedAccountSyncEntity
+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3;
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
@end

@implementation HDClinicalDeletedAccountSyncEntity

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] != (char *)&dword_0 + 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:@"com.apple.healthd.healthrecords.sync-schema" entity:2];
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
  v27[2] = sub_562AC;
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
      id v39 = a1;
      __int16 v40 = 2114;
      id v41 = v18;
      __int16 v42 = 2050;
      id v43 = v25;
      __int16 v44 = 1026;
      unsigned int v45 = v20;
      _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ generated %{public}lu sync objects, success: %{public}d", buf, 0x26u);
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

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 database];
  id v11 = +[HDClinicalDeletedAccountEntity nextSyncAnchorWithStartAnchor:a4 predicate:0 session:v9 healthDatabase:v10 error:a6];

  return (int64_t)v11;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)HDCodableClinicalDeletedAccount) initWithData:v3];

  return v4;
}

+ (BOOL)_shouldInsertReceivedCodableAccount:(id)a3
{
  return [a3 hasMessageVersion] ^ 1;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_56ACC;
  v53[3] = &unk_113900;
  id v47 = a1;
  v53[4] = a1;
  id v14 = objc_msgSend(v11, "hk_filter:", v53);
  _HKInitializeLogging();
  id v15 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    id v17 = [v11 count];
    id v18 = [v14 count];
    *(_DWORD *)buf = 138544130;
    id v56 = a1;
    __int16 v57 = 2114;
    uint64_t v58 = (uint64_t)v13;
    __int16 v59 = 2050;
    id v60 = v17;
    __int16 v61 = 2050;
    id v62 = v18;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ received %{public}lu sync objects, will upsert %{public}lu", buf, 0x2Au);
  }
  id v19 = +[HDClinicalDeletedAccountEntity _insertCodableDeletedAccounts:syncProvenance:profile:error:](HDClinicalDeletedAccountEntity, "_insertCodableDeletedAccounts:syncProvenance:profile:error:", v14, [v12 syncProvenance], v13, a7);
  if (v19)
  {
    _HKInitializeLogging();
    unsigned int v20 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      id v22 = [v19 count];
      id v23 = [v14 count];
      *(_DWORD *)buf = 138544130;
      id v56 = a1;
      __int16 v57 = 2114;
      uint64_t v58 = (uint64_t)v13;
      __int16 v59 = 2050;
      id v60 = v22;
      __int16 v61 = 2050;
      id v62 = v23;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ applied %{public}lu sync objects out of %{public}lu, will delete associated accounts if necessary", buf, 0x2Au);
    }
    v24 = [v13 healthRecordsExtension];
    id v25 = [v24 accountManager];

    if (v25)
    {
      __int16 v44 = v14;
      id v45 = v13;
      id v46 = v11;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v43 = v19;
      id v26 = v19;
      id v27 = [v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v50;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v50 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            int64_t v32 = [v31 syncIdentifier];
            int64_t v33 = +[NSUUID hk_UUIDWithData:v32];

            id v34 = [v31 safeDeletionReason];
            id v48 = 0;
            unsigned __int8 v35 = [v25 deleteAccountWithSyncIdentifier:v33 deletionReason:v34 error:&v48];
            id v36 = v48;
            _HKInitializeLogging();
            uint64_t v37 = HKLogHealthRecords;
            if (v35)
            {
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                uint64_t v39 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                id v56 = v47;
                __int16 v57 = 2114;
                uint64_t v58 = v39;
                _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully deleted account with sync identifier %{public}@ from sync: ", buf, 0x16u);
              }
            }
            else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543874;
              id v56 = v47;
              __int16 v57 = 2114;
              uint64_t v58 = (uint64_t)v33;
              __int16 v59 = 2114;
              id v60 = v36;
              _os_log_fault_impl(&dword_0, v37, OS_LOG_TYPE_FAULT, "%{public}@ Failed to delete account with sync identifier %{public}@ from sync: %{public}@", buf, 0x20u);
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v28);
      }

      id v11 = v46;
      id v14 = v44;
      id v13 = v45;
      id v19 = v43;
    }
    else
    {
      _HKInitializeLogging();
      id v41 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_AF75C((uint64_t)v47, v41);
      }
    }

    int64_t v40 = 0;
  }
  else
  {
    int64_t v40 = 1;
  }

  return v40;
}

@end