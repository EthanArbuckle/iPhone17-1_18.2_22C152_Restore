@interface HDClinicalDeletedAccountEntity
+ (BOOL)_insertOrUpdateTombstoneWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 error:(id *)a9;
+ (BOOL)_insertTombstoneWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 error:(id *)a9;
+ (BOOL)_validateCodableDeletedAccount:(id)a3 error:(id *)a4;
+ (BOOL)insertTombstoneWithSyncIdentifierIfNotExists:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (id)_codableDeletedAccountWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 error:(id *)a6;
+ (id)_codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)_currentCodableMessageVersion;
+ (id)_entityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_insertCodableDeletedAccounts:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)_predicateForSyncIdentifier:(id)a3;
+ (id)_propertiesForEntity;
+ (id)tombstoneExistsWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
@end

@implementation HDClinicalDeletedAccountEntity

+ (id)_propertiesForEntity
{
  v4[0] = HDClinicalDeletedAccountEntityPropertySyncIdentifier;
  v4[1] = HDClinicalDeletedAccountEntityPropertyDeletionDate;
  v4[2] = HDClinicalDeletedAccountEntityPropertyDeletionReason;
  v4[3] = HDClinicalDeletedAccountEntityPropertySyncProvenance;
  v4[4] = HDClinicalDeletedAccountEntityPropertySyncIdentity;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)_predicateForSyncIdentifier:(id)a3
{
  uint64_t v3 = HDClinicalDeletedAccountEntityPropertySyncIdentifier;
  v4 = _HDSQLiteValueForUUID();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_currentCodableMessageVersion
{
  return +[HDClinicalAccountEntity _currentCodableMessageVersion];
}

+ (id)_codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  v6 = HDSQLiteColumnWithNameAsUUID();
  v7 = HDSQLiteColumnWithNameAsDate();
  v8 = [a1 _codableDeletedAccountWithSyncIdentifier:v6 deletionDate:v7 deletionReason:HDSQLiteColumnWithNameAsInt64() error:a4];

  return v8;
}

+ (id)_entityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForSyncIdentifier:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)tombstoneExistsWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v10 = 0;
  v6 = [a1 _entityWithSyncIdentifier:a3 database:a4 error:&v10];
  id v7 = v10;
  if (v7)
  {
    if (a5)
    {
      id v8 = 0;
      *a5 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v8 = 0;
    }
  }
  else
  {
    id v8 = +[NSNumber numberWithInt:v6 != 0];
  }

  return v8;
}

+ (BOOL)insertTombstoneWithSyncIdentifierIfNotExists:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v18 = [v17 protectedDatabase];
  id v25 = 0;
  v19 = [a1 _entityWithSyncIdentifier:v14 database:v18 error:&v25];
  id v20 = v25;

  if (v19)
  {
    unsigned __int8 v21 = 1;
  }
  else if (v20)
  {
    if (a8)
    {
      unsigned __int8 v21 = 0;
      *a8 = v20;
    }
    else
    {
      _HKLogDroppedError();
      unsigned __int8 v21 = 0;
    }
  }
  else
  {
    id v24 = [v16 currentSyncIdentityPersistentID];
    v23 = [v17 protectedDatabase];
    unsigned __int8 v21 = [a1 _insertTombstoneWithSyncIdentifier:v14 deletionDate:v15 deletionReason:a5 syncProvenance:0 syncIdentity:v24 database:v23 error:a8];
  }
  return v21;
}

+ (BOOL)_insertTombstoneWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v18 = [a1 _propertiesForEntity];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_5543C;
  v23[3] = &unk_1138C0;
  id v24 = v15;
  id v25 = v16;
  int64_t v26 = a5;
  int64_t v27 = a6;
  int64_t v28 = a7;
  id v19 = v16;
  id v20 = v15;
  unsigned __int8 v21 = [a1 insertOrReplaceEntity:0 database:v17 properties:v18 error:a9 bindingHandler:v23];

  return v21 != 0;
}

+ (BOOL)_insertOrUpdateTombstoneWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v25 = 0;
  v18 = [a1 _entityWithSyncIdentifier:v15 database:v17 error:&v25];
  id v19 = v25;
  if (!v19)
  {
    if (!v18) {
      goto LABEL_9;
    }
    int64_t v24 = a7;
    unsigned __int8 v21 = [v18 dateForProperty:HDClinicalDeletedAccountEntityPropertyDeletionDate database:v17];
    if (objc_msgSend(v21, "hk_isBeforeDate:", v16))
    {

      unsigned __int8 v20 = 1;
      goto LABEL_11;
    }
    unsigned int v23 = [v18 deleteFromDatabase:v17 error:a9];

    a7 = v24;
    if (v23)
    {
LABEL_9:
      unsigned __int8 v20 = [a1 _insertTombstoneWithSyncIdentifier:v15 deletionDate:v16 deletionReason:a5 syncProvenance:a6 syncIdentity:a7 database:v17 error:a9];
      goto LABEL_11;
    }
LABEL_10:
    unsigned __int8 v20 = 0;
    goto LABEL_11;
  }
  if (!a9)
  {
    _HKLogDroppedError();
    goto LABEL_10;
  }
  unsigned __int8 v20 = 0;
  *a9 = v19;
LABEL_11:

  return v20;
}

+ (id)_insertCodableDeletedAccounts:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_55844;
  v27[3] = &unk_1138E0;
  v27[4] = a1;
  objc_msgSend(v10, "hk_filter:", v27);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ([v12 count])
  {
    v13 = [v11 database];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_558D8;
    v22[3] = &unk_1128D8;
    id v25 = a1;
    id v23 = v12;
    id v24 = v11;
    int64_t v26 = a4;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_55C90;
    v18[3] = &unk_112900;
    id v20 = v13;
    int64_t v21 = a4;
    id v19 = v10;
    id v14 = v13;
    id v15 = v12;
    if ([a1 performWriteTransactionWithHealthDatabase:v14 error:a6 block:v22 inaccessibilityHandler:v18])id v16 = v15; {
    else
    }
      id v16 = 0;
    id v12 = v16;
  }

  return v12;
}

+ (id)_codableDeletedAccountWithSyncIdentifier:(id)a3 deletionDate:(id)a4 deletionReason:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)HDCodableClinicalDeletedAccount);
  v13 = [a1 _currentCodableMessageVersion];
  [v12 setMessageVersion:v13];

  if (a5 == 3)
  {
    id v14 = [v12 messageVersion];
    int v15 = [v14 compatibilityVersion];

    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    id v17 = [v12 messageVersion];
    [v17 setCompatibilityVersion:v16];
  }
  v18 = objc_msgSend(v10, "hk_dataForUUIDBytes");
  [v12 setSyncIdentifier:v18];

  [v11 timeIntervalSinceReferenceDate];
  double v20 = v19;

  [v12 setDeletionDate:v20];
  [v12 setDeletionReason:a5];
  if ([a1 _validateCodableDeletedAccount:v12 error:a6]) {
    id v21 = v12;
  }
  else {
    id v21 = 0;
  }

  return v21;
}

+ (BOOL)_validateCodableDeletedAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 hasMessageVersion]
    || ([v5 messageVersion],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 compatibilityVersion],
        v6,
        v7 < 3))
  {
    id v8 = [v5 syncIdentifier];
    v9 = +[NSUUID hk_UUIDWithData:v8];

    if (!v9)
    {
      +[NSError hk_assignError:a4, 3, @"%@: invalid sync identifier", objc_opt_class() code format];
      goto LABEL_11;
    }
    if (([v5 hasDeletionDate] & 1) == 0)
    {
      +[NSError hk_assignError:a4, 3, @"%@: missing deletion date", objc_opt_class() code format];
      goto LABEL_11;
    }
    id v10 = [v5 messageVersion];
    if ((int)[v10 entityVersion] < 2)
    {
    }
    else
    {
      unsigned __int8 v11 = [v5 hasDeletionReason];

      if ((v11 & 1) == 0)
      {
        +[NSError hk_assignError:a4, 3, @"%@: missing deletion reason", objc_opt_class() code format];
        goto LABEL_11;
      }
    }
    BOOL v12 = 1;
    goto LABEL_12;
  }
  +[NSError hk_assignError:a4 code:3 description:@"Codable deleted account compatibilty version is higher than what we support"];
LABEL_11:
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

@end