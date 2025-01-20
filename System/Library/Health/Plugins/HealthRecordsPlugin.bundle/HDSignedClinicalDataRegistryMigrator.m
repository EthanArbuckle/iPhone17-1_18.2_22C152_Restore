@interface HDSignedClinicalDataRegistryMigrator
- (BOOL)migrateDatabase:(id)a3 fromVersion:(unint64_t)a4 toVersion:(int64_t)a5 error:(id *)a6;
- (BOOL)runMigrationFunction:(void *)a3 database:(id)a4 error:(id *)a5;
- (int64_t)executeStatements:(id)a3 database:(id)a4 error:(id *)a5;
@end

@implementation HDSignedClinicalDataRegistryMigrator

- (BOOL)migrateDatabase:(id)a3 fromVersion:(unint64_t)a4 toVersion:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  if (a4 >= a5)
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HDSignedClinicalDataRegistryMigrator.m", 22, @"Invalid parameter not satisfying: %@", @"from < to" object file lineNumber description];
  }
  _HKInitializeLogging();
  v12 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543874;
    v38 = v15;
    __int16 v39 = 2048;
    unint64_t v40 = a4;
    __int16 v41 = 2048;
    int64_t v42 = a5;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating registry from version %lld to %lld", buf, 0x20u);
  }
  if (!a4 && a5 >= 1)
  {
    id v36 = 0;
    unsigned __int8 v16 = [(HDSignedClinicalDataRegistryMigrator *)self runMigrationFunction:sub_1C5A4 database:v11 error:&v36];
    id v17 = v36;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      _HKInitializeLogging();
      v29 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_ABAB0(v29);
      }
      goto LABEL_23;
    }
  }
  if (a4 > 1 || a5 < 2) {
    goto LABEL_13;
  }
  id v35 = 0;
  unsigned __int8 v19 = [(HDSignedClinicalDataRegistryMigrator *)self runMigrationFunction:sub_1C678 database:v11 error:&v35];
  id v20 = v35;
  v18 = v20;
  if (v19)
  {

LABEL_13:
    v33[4] = a5;
    id v34 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1C754;
    v33[3] = &unk_1123C8;
    unsigned __int8 v21 = [v11 performTransactionWithType:1 error:&v34 usingBlock:v33];
    id v22 = v34;
    if ((v21 & 1) == 0)
    {
      _HKInitializeLogging();
      v23 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AB968(v23);
      }
    }
    _HKInitializeLogging();
    v24 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138543874;
      v38 = v27;
      __int16 v39 = 2048;
      unint64_t v40 = a4;
      __int16 v41 = 2048;
      int64_t v42 = a5;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Migration from version %lld to %lld done", buf, 0x20u);
    }
    BOOL v28 = 1;
    goto LABEL_28;
  }
  _HKInitializeLogging();
  v30 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_ABA0C(v30);
  }
LABEL_23:
  id v22 = v18;
  if (v22)
  {
    if (a6) {
      *a6 = v22;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v28 = 0;
LABEL_28:

  return v28;
}

- (BOOL)runMigrationFunction:(void *)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v16 = 0;
  uint64_t v9 = ((uint64_t (*)(HDSignedClinicalDataRegistryMigrator *, id, id *))a3)(self, v8, &v16);
  id v10 = v16;
  id v11 = v10;
  if (v9 == 1)
  {
    id v15 = v10;
    uint64_t v9 = ((uint64_t (*)(HDSignedClinicalDataRegistryMigrator *, id, id *))a3)(self, v8, &v15);
    id v12 = v15;

    id v11 = v12;
  }
  if (v9)
  {
    id v13 = v11;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9 == 0;
}

- (int64_t)executeStatements:(id)a3 database:(id)a4 error:(id *)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C8F8;
  v10[3] = &unk_1123F0;
  id v11 = a3;
  id v7 = v11;
  int64_t v8 = [a4 performTransactionWithType:1 error:a5 usingBlock:v10] ^ 1;

  return v8;
}

@end