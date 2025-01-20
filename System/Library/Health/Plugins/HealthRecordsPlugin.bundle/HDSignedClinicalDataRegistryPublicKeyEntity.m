@interface HDSignedClinicalDataRegistryPublicKeyEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForNonRemovedPublicKeyEntities;
+ (id)_predicateForPublicKeyEntityWithKeyID:(id)a3;
+ (id)databaseTable;
+ (id)entityForPublicKeyWithKeyID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)insertOrReplacePublicKeyWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwk:(id)a7 database:(id)a8 error:(id *)a9;
+ (id)publicKeyWithKeyID:(id)a3 database:(id)a4;
+ (id)publicKeysInDatabase:(id)a3 error:(id *)a4;
+ (id)removePublicKeyWithKeyID:(id)a3 removedDate:(id)a4 database:(id)a5 error:(id *)a6;
@end

@implementation HDSignedClinicalDataRegistryPublicKeyEntity

+ (id)_predicateForPublicKeyEntityWithKeyID:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:@"kid" equalToValue:a3];
}

+ (id)_predicateForNonRemovedPublicKeyEntities
{
  return +[HDSQLiteNullPredicate isNullPredicateWithProperty:@"removed"];
}

+ (id)publicKeysInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v18[0] = @"kid";
  v18[1] = @"added";
  v8 = +[NSArray arrayWithObjects:v18 count:2];
  v9 = [a1 _predicateForNonRemovedPublicKeyEntities];
  uint64_t v10 = kHDSQLiteQueryNoLimit;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_F200;
  v15[3] = &unk_111AC8;
  id v16 = v7;
  id v17 = a1;
  id v11 = v7;
  LODWORD(a1) = [a1 enumerateQueryResultsFromColumns:v8 properties:v8 predicate:v9 groupBy:0 orderingTerms:0 limit:v10 database:v6 error:a4 enumerationHandler:v15];

  if (a1) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)entityForPublicKeyWithKeyID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForPublicKeyEntityWithKeyID:a3];
  uint64_t v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)publicKeyWithKeyID:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v39 = 0;
  id v8 = [a1 entityForPublicKeyWithKeyID:v6 database:v7 error:&v39];
  id v9 = v39;
  uint64_t v10 = v9;
  if (v8)
  {
    *(void *)v46 = 0;
    *(void *)&v46[8] = v46;
    *(void *)&v46[16] = 0x3032000000;
    v47 = sub_F7A0;
    v48 = sub_F7B0;
    id v49 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_F7A0;
    v37 = sub_F7B0;
    id v38 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_F7A0;
    v31 = sub_F7B0;
    id v32 = 0;
    v25[6] = &v27;
    id v26 = v9;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_F7B8;
    v25[3] = &unk_111AF0;
    v25[4] = v46;
    v25[5] = &v33;
    unsigned __int8 v11 = [v8 getValuesForProperties:&off_11D660 database:v7 error:&v26 handler:v25];
    id v12 = v26;

    if (v11)
    {
      if (v34[5])
      {
        id v13 = objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult);
        uint64_t v14 = 0;
        uint64_t v15 = 3;
      }
      else
      {
        id v13 = objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult);
        uint64_t v14 = v28[5];
        uint64_t v15 = 1;
      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = HKLogHealthRecords;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138543874;
        v41 = v21;
        __int16 v42 = 2114;
        id v43 = v6;
        __int16 v44 = 2114;
        id v45 = v12;
        _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed to get property values for kid %{public}@, error: %{public}@", buf, 0x20u);
      }
      id v13 = objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult);
      uint64_t v14 = 0;
      uint64_t v15 = 4;
    }
    id v17 = [v13 initWithKeyID:v6 outcome:v15 jwkData:v14];
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(v46, 8);
  }
  else if (v9)
  {
    _HKInitializeLogging();
    id v16 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      v22 = v16;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)v46 = 138543874;
      *(void *)&v46[4] = v24;
      *(_WORD *)&v46[12] = 2114;
      *(void *)&v46[14] = v6;
      *(_WORD *)&v46[22] = 2114;
      v47 = (uint64_t (*)(uint64_t, uint64_t))v10;
      _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to get entity for kid %{public}@, error: %{public}@", v46, 0x20u);
    }
    id v17 = [objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult) initWithKeyID:v6 outcome:4 jwkData:0];
  }
  else
  {
    id v17 = [objc_alloc((Class)HKSignedClinicalDataRegistryPublicKeyFetchResult) initWithKeyID:v6 outcome:2 jwkData:0];
  }

  return v17;
}

+ (id)insertOrReplacePublicKeyWithKeyID:(id)a3 added:(id)a4 removed:(id)a5 source:(id)a6 jwk:(id)a7 database:(id)a8 error:(id *)a9
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_F9CC;
  v22[3] = &unk_111B18;
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a7;
  id v15 = v27;
  id v16 = v26;
  id v17 = v25;
  id v18 = v24;
  id v19 = v23;
  v20 = [a1 insertOrReplaceEntity:1 database:a8 properties:&off_11D678 error:a9 bindingHandler:v22];

  return v20;
}

+ (id)removePublicKeyWithKeyID:(id)a3 removedDate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = 0;
  id v13 = [a1 entityForPublicKeyWithKeyID:v10 database:v12 error:&v27];
  id v14 = v27;
  if (v13)
  {
    v28[0] = @"removed";
    v28[1] = @"updated_locally";
    v28[2] = @"jwk";
    id v15 = +[NSArray arrayWithObjects:v28 count:3];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_FD40;
    v25[3] = &unk_111B40;
    id v26 = v11;
    unsigned int v16 = [v13 updateProperties:v15 database:v12 error:a6 bindingHandler:v25];

    if (v16) {
      id v17 = v13;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    goto LABEL_16;
  }
  _HKInitializeLogging();
  id v19 = (void *)HKLogHealthRecords;
  BOOL v20 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v20)
    {
      v22 = v19;
      id v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      __int16 v31 = 2114;
      id v32 = v10;
      __int16 v33 = 2114;
      id v34 = v14;
      _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to get entity for kid %{public}@, error: %{public}@", buf, 0x20u);
    }
    if (a6)
    {
      id v18 = 0;
      *a6 = v14;
      goto LABEL_16;
    }
    _HKLogDroppedError();
  }
  else
  {
    if (v20) {
      sub_AA9E4(v19, (uint64_t)a1, (uint64_t)v10);
    }
    +[NSError hk_assignError:a6, 118, @"there is no public key with kid %@", v10 code format];
  }
  id v18 = 0;
LABEL_16:

  return v18;
}

+ (id)databaseTable
{
  return @"public_keys";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $3277B6B2C620D6D29E09CE5B70810548 *)off_111B60;
}

@end