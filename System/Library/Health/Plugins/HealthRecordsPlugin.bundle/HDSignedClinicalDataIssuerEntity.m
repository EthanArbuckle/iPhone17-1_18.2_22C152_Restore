@interface HDSignedClinicalDataIssuerEntity
+ (BOOL)insertCodableIssuers:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)updateIssuerTitlesUsingRegistry:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)validateCodable:(id)a3 error:(id *)a4;
+ (HDSignedClinicalDataIssuerEntity)issuerEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_issuerWithRow:(HDSQLiteRow *)a3;
+ (id)codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)insertCodableIssuer:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)insertIssuer:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (id)insertOrIgnoreCodableIssuer:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)issuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)issuerWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)newCompatibleCodableSignedClinicalDataIssuer;
+ (id)newCompatibleCodableSignedClinicalDataIssuerWithIdentifier:(id)a3;
+ (id)predicateForIssuerWithIdentifier:(id)a3;
- (BOOL)updateTitleUsingRegistry:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)issuerInDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDSignedClinicalDataIssuerEntity

+ (id)predicateForIssuerWithIdentifier:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDSignedClinicalDataIssuerEntityPropertyIdentifier equalToValue:a3];
}

+ (id)newCompatibleCodableSignedClinicalDataIssuer
{
  return [a1 newCompatibleCodableSignedClinicalDataIssuerWithIdentifier:0];
}

+ (id)newCompatibleCodableSignedClinicalDataIssuerWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)HDCodableSignedClinicalDataIssuer);
  id v5 = objc_alloc_init((Class)HDCodableMessageVersion);
  [v4 setMessageVersion:v5];

  v6 = [v4 messageVersion];
  [v6 setEntityVersion:1];

  v7 = [v4 messageVersion];
  [v7 setCompatibilityVersion:0];

  if ([v3 hasPrefix:HKSignedClinicalDataEUDCCIssuerPrefix])
  {
    v8 = [v4 messageVersion];
    [v8 setCompatibilityVersion:1];
  }
  [v4 setIdentifier:v3];

  return v4;
}

+ (BOOL)validateCodable:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v5 hasMessageVersion])
  {
    v7 = [v5 messageVersion];
    int v8 = [v7 compatibilityVersion];

    if (v8 >= 2)
    {
      v9 = [v5 messageVersion];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"compatibility version is higher (%lu) than what we support (%lu)", (int)[v9 compatibilityVersion], 1);
      [v6 addObject:v10];
    }
  }
  else
  {
    [v6 addObject:@"no compatibility version"];
  }
  if (([v5 hasTitle] & 1) == 0) {
    [v6 addObject:@"no title"];
  }
  if (([v5 hasIdentifier] & 1) == 0) {
    [v6 addObject:@"no issuer identifier"];
  }
  id v11 = [v6 count];
  if (v11)
  {
    v12 = [v6 componentsJoinedByString:@"; "];
    +[NSError hk_assignError:a4, 3, @"codable signed clinical data issuer is invalid: %@", v12 code format];
  }
  return v11 == 0;
}

- (id)issuerInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _propertiesForModel];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_25AE8;
  v19 = sub_25AF8;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_25B00;
  v14[3] = &unk_112888;
  v14[4] = self;
  v14[5] = &v15;
  if ([(HDSignedClinicalDataIssuerEntity *)self getValuesForProperties:v7 database:v6 handler:v14])
  {
    int v8 = (void *)v16[5];
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(HDSignedClinicalDataIssuerEntity *)self persistentID];
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2048;
        id v24 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@ Failed to instantiate SCD Issuer for entity with ID %lld", buf, 0x16u);
      }
    }
    +[NSError hk_assignError:a4, 100, @"Failed to populate SCD Issuer object from issuer entity %lld", [(HDSignedClinicalDataIssuerEntity *)self persistentID] code format];
    int v8 = 0;
  }
  id v12 = v8;
  _Block_object_dispose(&v15, 8);

  return v12;
}

+ (id)issuerWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_25AE8;
  __int16 v23 = sub_25AF8;
  id v24 = 0;
  v10 = [v9 database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_25CD0;
  v15[3] = &unk_1128B0;
  uint64_t v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 context:0 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

+ (HDSignedClinicalDataIssuerEntity)issuerEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 predicateForIssuerWithIdentifier:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return (HDSignedClinicalDataIssuerEntity *)v10;
}

+ (id)issuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 issuerEntityWithIdentifier:a3 database:v8 error:a5];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 issuerInDatabase:v8 error:a5];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_issuerWithRow:(HDSQLiteRow *)a3
{
  if (!a3)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HDSignedClinicalDataIssuerEntity+HealthRecordsPlugin.m", 153, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v3 = HDSQLiteColumnWithNameAsString();
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_alloc((Class)HKSignedClinicalDataIssuer);
  id v6 = HDSQLiteColumnWithNameAsString();
  v7 = HDSQLiteColumnWithNameAsString();
  id v8 = HDSQLiteColumnWithNameAsString();
  id v9 = [v5 initWithIdentifier:v6 title:v7 subtitle:v8 wellKnownURL:v4];

  return v9;
}

+ (id)codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  if (!a3)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDSignedClinicalDataIssuerEntity+HealthRecordsPlugin.m", 164, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v6 = HDSQLiteColumnWithNameAsString();
  id v7 = +[HDSignedClinicalDataIssuerEntity newCompatibleCodableSignedClinicalDataIssuerWithIdentifier:v6];
  id v8 = HDSQLiteColumnWithNameAsString();
  [v7 setTitle:v8];

  id v9 = HDSQLiteColumnWithNameAsString();
  [v7 setSubtitle:v9];

  v10 = HDSQLiteColumnWithNameAsString();
  [v7 setWellKnownURL:v10];

  if ([a1 validateCodable:v7 error:a4]) {
    id v11 = v7;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)insertCodableIssuers:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_26340;
  v20[3] = &unk_1128D8;
  id v21 = v10;
  id v23 = a1;
  int64_t v24 = a4;
  id v22 = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_265CC;
  v16[3] = &unk_112900;
  id v18 = v22;
  int64_t v19 = a4;
  id v17 = v21;
  id v13 = v22;
  id v14 = v21;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

+ (id)insertOrIgnoreCodableIssuer:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v12 identifier];
  id v16 = [v14 protectedDatabase];
  id v22 = 0;
  id v17 = [a1 issuerEntityWithIdentifier:v15 database:v16 error:&v22];
  id v18 = v22;

  if (v17 || !v18)
  {
    if (v17)
    {
      id v20 = v17;
    }
    else
    {
      id v20 = [a1 insertCodableIssuer:v12 syncProvenance:a4 profile:v13 transaction:v14 error:a7];
    }
    int64_t v19 = v20;
  }
  else if (a7)
  {
    int64_t v19 = 0;
    *a7 = v18;
  }
  else
  {
    _HKLogDroppedError();
    int64_t v19 = 0;
  }

  return v19;
}

+ (id)insertCodableIssuer:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v47 = a5;
  id v13 = a6;
  id v54 = 0;
  unsigned __int8 v14 = [a1 validateCodable:v12 error:&v54];
  id v15 = v54;
  if (v14)
  {
    id v16 = [v47 syncIdentityManager];
    id v17 = [v16 legacySyncIdentity];

    if ([v12 hasSyncIdentity])
    {
      v46 = a7;
      id v18 = [v12 syncIdentity];
      id v53 = 0;
      int64_t v19 = +[HDSyncIdentity syncIdentityWithCodable:v18 error:&v53];
      id v20 = v53;

      if (v19)
      {
        id v21 = [v47 syncIdentityManager];
        id v52 = v20;
        uint64_t v22 = [v21 concreteIdentityForIdentity:v19 shouldCreate:1 transaction:v13 error:&v52];
        id v45 = v52;

        if (v22)
        {

          id v17 = (id)v22;
          a7 = v46;
          goto LABEL_6;
        }
        _HKInitializeLogging();
        v41 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_AC5A4((uint64_t)v45, v41);
        }
        id v42 = v45;
        id v32 = v42;
        if (v42)
        {
          v43 = v19;
          if (v46)
          {
            id v32 = v42;
            id v17 = 0;
            id *v46 = v32;
          }
          else
          {
            _HKLogDroppedError();
            id v17 = 0;
          }
        }
        else
        {
          id v17 = 0;
          v43 = v19;
        }
      }
      else
      {
        _HKInitializeLogging();
        v39 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_AC52C((uint64_t)v20, v39);
        }
        id v40 = v20;
        id v32 = v40;
        if (v40)
        {
          if (v46)
          {
            id v32 = v40;
            id *v46 = v32;
          }
          else
          {
            _HKLogDroppedError();
          }
        }
        v43 = 0;
      }

      v31 = 0;
LABEL_31:

      goto LABEL_32;
    }
LABEL_6:
    _HKInitializeLogging();
    id v23 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v24 = v23;
      v25 = [v12 identifier];
      HKSensitiveLogItem();
      id v26 = v13;
      v28 = v27 = a7;
      *(_DWORD *)buf = 138543618;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = v28;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting signed clinical data issuer %{public}@", buf, 0x16u);

      a7 = v27;
      id v13 = v26;
    }
    v29 = [v13 protectedDatabase];
    v30 = [a1 propertiesForCodable];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_26CA0;
    v48[3] = &unk_112928;
    int64_t v51 = a4;
    id v49 = v12;
    id v17 = v17;
    id v50 = v17;
    v31 = [a1 insertOrReplaceEntity:0 database:v29 properties:v30 error:a7 bindingHandler:v48];

    id v32 = v49;
    goto LABEL_31;
  }
  _HKInitializeLogging();
  v33 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    v35 = [v12 identifier];
    v36 = HKSensitiveLogItem();
    v37 = [v15 localizedDescription];
    *(_DWORD *)buf = 138543874;
    id v56 = a1;
    __int16 v57 = 2114;
    v58 = v36;
    __int16 v59 = 2114;
    v60 = v37;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ validation failed, not inserting signed clinical data issuer %{public}@: %{public}@", buf, 0x20u);
  }
  id v38 = v15;
  id v17 = v38;
  if (v38)
  {
    if (a7)
    {
      id v17 = v38;
      v31 = 0;
      *a7 = v17;
      goto LABEL_32;
    }
    _HKLogDroppedError();
  }
  v31 = 0;
LABEL_32:

  return v31;
}

+ (id)insertIssuer:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  id v17 = [a5 codableSyncIdentity];
  id v18 = [v16 asCodableIssuerWithSyncIdentity:v17];

  int64_t v19 = [a1 insertCodableIssuer:v18 syncProvenance:a4 profile:v15 transaction:v14 error:a8];

  return v19;
}

+ (BOOL)updateIssuerTitlesUsingRegistry:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_27010;
  v16[3] = &unk_1125D8;
  id v19 = a1;
  id v17 = v8;
  id v18 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_27198;
  v14[3] = &unk_112978;
  id v15 = v18;
  id v11 = v18;
  id v12 = v8;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v16 inaccessibilityHandler:v14];

  return (char)a5;
}

- (BOOL)updateTitleUsingRegistry:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = HDSignedClinicalDataIssuerEntityPropertyIdentifier;
  id v13 = a3;
  id v14 = [(HDSignedClinicalDataIssuerEntity *)self stringForProperty:v12 database:v10];
  id v15 = [v13 titleForIssuerWithIdentifier:v14];

  id v16 = +[HKSignedClinicalDataIssuer titleForTitle:v15 identifier:v14];
  uint64_t v34 = HDSignedClinicalDataIssuerEntityPropertyTitle;
  id v17 = +[NSArray arrayWithObjects:&v34 count:1];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_274B8;
  v32[3] = &unk_111B40;
  id v18 = v16;
  id v33 = v18;
  unsigned int v19 = [(HDSignedClinicalDataIssuerEntity *)self updateProperties:v17 database:v10 error:a6 bindingHandler:v32];

  if (v19)
  {
    id v20 = +[NSNumber numberWithLongLong:[(HDSignedClinicalDataIssuerEntity *)self persistentID]];
    id v21 = +[HDClinicalAccountEntity _predicateForAccountWithSignedClinicalDataIssuerID:v20];

    id v31 = 0;
    uint64_t v22 = +[HDClinicalAccountEntity anyInDatabase:v10 predicate:v21 error:&v31];
    id v23 = v31;
    int64_t v24 = v23;
    if (v22)
    {
      uint64_t v25 = [v22 UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v10];
      id v26 = a6;
      id v27 = v11;
      v28 = (void *)v25;
      BOOL v29 = +[HDClinicalAccountEntity updateSourcesForAccountWithIdentifier:v25 wasAccountInsert:0 clinicalExternalID:v14 externalTitle:v18 profile:v27 error:v26];

      id v11 = v27;
    }
    else if (v23)
    {
      if (a6)
      {
        BOOL v29 = 0;
        *a6 = v23;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v29 = 0;
      }
    }
    else
    {
      BOOL v29 = 1;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

@end