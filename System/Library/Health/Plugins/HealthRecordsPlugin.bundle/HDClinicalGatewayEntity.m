@interface HDClinicalGatewayEntity
+ (BOOL)_insertCodableGateways:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertGateway:(id)a3 syncAnchor:(id)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 database:(id)a7 error:(id *)a8;
+ (BOOL)_insertOrUpdateGateway:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)_insertOrUpdateGateway:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8 insertionBlock:(id)a9;
+ (BOOL)_updateCodableGateways:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_updateGatewayEntity:(id)a3 withGateway:(id)a4 syncAnchor:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)_updateGatewayIfExists:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)_updateSourcesForGatewayIfNeeded:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_validateCodableGateway:(id)a3 error:(id *)a4;
+ (BOOL)insertOrUpdateGateway:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)insertOrUpdateGateway:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)insertOrUpdateGateways:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)pruneUnusedGatewaysInDatabase:(id)a3 error:(id *)a4;
+ (BOOL)updateGateways:(id)a3 profile:(id)a4 error:(id *)a5;
+ (HDClinicalGatewayEntity)gatewayEntityWithExternalID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_codableGatewayFromGateway:(id)a3 error:(id *)a4;
+ (id)_codableGatewayWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)_codableGatewaysFromGateways:(id)a3 syncIdentity:(id)a4 error:(id *)a5;
+ (id)_currentCodableMessageVersionForFHIRVersion:(id)a3;
+ (id)_gatewayFromCodableGateway:(id)a3 error:(id *)a4;
+ (id)_gatewayWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)_gatewaysFromCodableGateways:(id)a3 profile:(id)a4 transaction:(id)a5;
+ (id)_predicateForGatewayWithExternalID:(id)a3;
+ (id)_predicateForGatewaysWithAccounts;
+ (id)_propertiesForCodable;
+ (id)_propertiesForModel;
+ (id)_propertiesForModelInsert;
+ (id)_propertiesForModelUpdate;
+ (id)_propertiesForSync;
+ (id)existingGatewayEntityWithExternalID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)gatewayWithExternalID:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)predicateForFHIRDSTU2Gateways;
+ (id)predicateForGatewaysForLegacySync;
+ (id)predicateForUSGateways;
+ (void)_bindSyncAnchor:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 binder:(HDSQLiteStatementBinder *)a6;
- (BOOL)setNeedsSyncWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)gatewayInDatabase:(id)a3 error:(id *)a4;
- (id)newLoginSessionWithEntityInDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDClinicalGatewayEntity

+ (id)_propertiesForModel
{
  v4[0] = HDClinicalGatewayEntityPropertyExternalID;
  v4[1] = HDClinicalGatewayEntityPropertyLastReportedStatus;
  v4[2] = HDClinicalGatewayEntityPropertyRevision;
  v4[3] = HDClinicalGatewayEntityPropertyRawContent;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)_propertiesForSync
{
  v3 = [a1 propertyForSyncAnchor];
  v4 = objc_msgSend(a1, "propertyForSyncProvenance", v3);
  v7[1] = v4;
  v7[2] = HDClinicalGatewayEntityPropertySyncIdentity;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)_propertiesForModelInsert
{
  v7[0] = HDClinicalGatewayEntityPropertyExternalID;
  v7[1] = HDClinicalGatewayEntityPropertyLastReportedStatus;
  v7[2] = HDClinicalGatewayEntityPropertyRevision;
  void v7[3] = HDClinicalGatewayEntityPropertyRawContent;
  v3 = +[NSArray arrayWithObjects:v7 count:4];
  v4 = [a1 _propertiesForSync];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)_propertiesForModelUpdate
{
  v7[0] = HDClinicalGatewayEntityPropertyLastReportedStatus;
  v7[1] = HDClinicalGatewayEntityPropertyRevision;
  v7[2] = HDClinicalGatewayEntityPropertyRawContent;
  v3 = +[NSArray arrayWithObjects:v7 count:3];
  v4 = [a1 _propertiesForSync];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)_propertiesForCodable
{
  v4[0] = HDClinicalGatewayEntityPropertyRawContent;
  v4[1] = HDClinicalGatewayEntityPropertySyncIdentity;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_predicateForGatewayWithExternalID:(id)a3
{
  uint64_t v3 = HDClinicalGatewayEntityPropertyExternalID;
  v4 = _HDSQLiteValueForString();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForGatewaysWithAccounts
{
  v2 = [a1 disambiguatedDatabaseTable];
  uint64_t v3 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v2 toTargetEntity:objc_opt_class() as:0 localReference:HDSQLEntityPropertyPersistentID targetKey:HDClinicalAccountEntityPropertyGatewayID];

  v4 = +[NSSet setWithObject:v3];
  v5 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v4];

  return v5;
}

+ (id)predicateForUSGateways
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalGatewayContentCountryKey ifNullValue:@"US" value:@"US" comparisonType:1];
}

+ (id)predicateForFHIRDSTU2Gateways
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalGatewayContentFHIRVersionKey ifNullValue:@"1.0.2" value:@"1.0.2" comparisonType:1];
}

+ (id)predicateForGatewaysForLegacySync
{
  uint64_t v3 = [a1 predicateForUSGateways];
  v8[0] = v3;
  v4 = [a1 predicateForFHIRDSTU2Gateways];
  v8[1] = v4;
  v5 = +[NSArray arrayWithObjects:v8 count:2];
  v6 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (HDClinicalGatewayEntity)gatewayEntityWithExternalID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForGatewayWithExternalID:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return (HDClinicalGatewayEntity *)v10;
}

+ (id)existingGatewayEntityWithExternalID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = 0;
  v6 = [a1 gatewayEntityWithExternalID:a3 database:a4 error:&v9];
  id v7 = v9;
  if (!v6) {
    +[NSError hk_assignError:a5 code:118 description:@"Failed to fetch gateway entity" underlyingError:v7];
  }

  return v6;
}

+ (id)_gatewayWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  if (!a3)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDClinicalGatewayEntity+HealthRecordsPlugin.m", 157, @"Invalid parameter not satisfying: %@", @"row != NULL" object file lineNumber description];
  }
  id v7 = HDSQLiteColumnWithNameAsData();
  if (!v7)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDClinicalGatewayEntity+HealthRecordsPlugin.m", 160, @"Invalid parameter not satisfying: %@", @"data != nil" object file lineNumber description];
  }
  id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:a4];
  if (v8) {
    id v9 = [[HDClinicalGateway alloc] initWithRawContent:v8];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)newLoginSessionWithEntityInDatabase:(id)a3 error:(id *)a4
{
  v5 = -[HDClinicalGatewayEntity gatewayInDatabase:error:](self, "gatewayInDatabase:error:", a3);
  if (v5) {
    id v6 = +[HKOAuth2LoginSession newLoginSessionWithGateway:v5 error:a4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)pruneUnusedGatewaysInDatabase:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_5CDFC;
  v36 = sub_5CE0C;
  id v37 = +[NSMutableArray array];
  v5 = +[HDClinicalGatewayEntity disambiguatedDatabaseTable];
  id v6 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  id v7 = +[HDClinicalAuthorizationSessionEntity disambiguatedDatabaseTable];
  v22 = +[NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE ROWID NOT IN (SELECT b.%@ FROM %@ b) AND ROWID NOT IN (SELECT c.%@ FROM %@ c)", HDClinicalGatewayEntityPropertyExternalID, v5, HDClinicalAccountEntityPropertyGatewayID, v6, HDClinicalAccountEntityPropertyGatewayID, v7];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_5CE14;
  v31[3] = &unk_1126E0;
  v31[4] = &v32;
  if ([v4 executeUncachedSQL:v22 error:a4 bindingHandler:0 enumerationHandler:v31])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = (id)v33[5];
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (!v9)
    {
      char v11 = 1;
      goto LABEL_26;
    }
    uint64_t v10 = *(void *)v28;
    char v11 = 1;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v26 = 0;
        v14 = +[HDClinicalGatewayEntity existingGatewayEntityWithExternalID:v13 database:v4 error:&v26];
        id v15 = v26;
        v16 = v15;
        if (!v14)
        {
          _HKInitializeLogging();
          v20 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v39 = a1;
            __int16 v40 = 2114;
            id v41 = v16;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%{public}@ Error retrieving bad gateway for pruning: %{public}@", buf, 0x16u);
          }
          id v18 = v16;
          if (!v18) {
            goto LABEL_20;
          }
          if (!a4)
          {
LABEL_19:
            _HKLogDroppedError();
            goto LABEL_20;
          }
          goto LABEL_18;
        }
        id v25 = v15;
        unsigned __int8 v17 = [v14 deleteFromDatabase:v4 error:&v25];
        id v18 = v25;

        if (v17) {
          goto LABEL_21;
        }
        _HKInitializeLogging();
        v19 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v39 = a1;
          __int16 v40 = 2114;
          id v41 = v18;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%{public}@ Error retrieving bad gateway for pruning: %{public}@", buf, 0x16u);
        }
        id v18 = v18;
        if (v18)
        {
          if (!a4) {
            goto LABEL_19;
          }
LABEL_18:
          id v18 = v18;
          *a4 = v18;
        }
LABEL_20:

        char v11 = 0;
LABEL_21:
      }
      id v9 = [v8 countByEnumeratingWithState:&v27 objects:v42 count:16];
      if (!v9)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }
  char v11 = 0;
LABEL_27:

  _Block_object_dispose(&v32, 8);
  return v11 & 1;
}

- (id)gatewayInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _propertiesForModel];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_5CDFC;
  id v25 = sub_5CE0C;
  id v26 = 0;
  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = sub_5CDFC;
  v19[3] = sub_5CE0C;
  id v20 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5D174;
  v17[3] = &unk_1133D0;
  v17[4] = self;
  v17[5] = &v21;
  v17[6] = &v18;
  unsigned int v8 = [(HDClinicalGatewayEntity *)self getValuesForProperties:v7 database:v6 handler:v17];
  if (!v22[5])
  {
    if (objc_msgSend(*(id *)(v19[0] + 40), "hk_isDatabaseAccessibilityError"))
    {
      _HKInitializeLogging();
      id v9 = HKLogHealthRecords;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(HDClinicalGatewayEntity *)self persistentID];
        uint64_t v11 = *(void *)(v19[0] + 40);
        *(_DWORD *)buf = 138543874;
        long long v28 = self;
        __int16 v29 = 2048;
        id v30 = v10;
        __int16 v31 = 2114;
        uint64_t v32 = v11;
        _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@ was unable to retrieve gateway entity %lld: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v9 = HKLogHealthRecords;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_AFE1C((uint64_t)v19, buf, (uint64_t)[(HDClinicalGatewayEntity *)self persistentID], v9);
      }
    }

    id v12 = *(id *)(v19[0] + 40);
    uint64_t v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v8) {
    v14 = (void *)v22[5];
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v21, 8);

  return v15;
}

+ (id)gatewayWithExternalID:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_5CDFC;
  v22 = sub_5CE0C;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5D35C;
  v14[3] = &unk_1139F0;
  id v17 = a1;
  id v10 = v8;
  id v15 = v10;
  v16 = &v18;
  if ([a1 performReadTransactionWithHealthDatabase:v9 error:a5 block:v14]) {
    uint64_t v11 = (void *)v19[5];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

+ (BOOL)insertOrUpdateGateway:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];

  LOBYTE(a5) = objc_msgSend(a1, "insertOrUpdateGateways:profile:error:", v10, v8, a5, v12);
  return (char)a5;
}

+ (BOOL)_updateSourcesForGatewayIfNeeded:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 externalID];
  id v22 = 0;
  v14 = +[HDClinicalAccountEntity accountEntityForGatewayWithExternalID:v13 database:v11 error:&v22];
  id v15 = v22;

  if (v14)
  {
    id v16 = [v14 UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v11];
    if (v16)
    {
      id v17 = [v10 externalID];
      uint64_t v18 = [v10 title];
      unsigned __int8 v19 = +[HDClinicalAccountEntity updateSourcesForAccountWithIdentifier:v16 wasAccountInsert:0 clinicalExternalID:v17 externalTitle:v18 profile:v12 error:a6];
    }
    else
    {
      id v17 = NSStringFromClass((Class)a1);
      +[NSError hk_assignError:code:format:](NSError, "hk_assignError:code:format:", a6, 100, @"%@ failed to retrieve account identifier for account entity with ROWID %lld, cannot update sources", v17, [v14 persistentID]);
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    id v20 = v15;
    id v16 = v20;
    unsigned __int8 v19 = v20 == 0;
    if (v20)
    {
      if (a6)
      {
        id v16 = v20;
        unsigned __int8 v19 = 0;
        *a6 = v16;
      }
      else
      {
        _HKLogDroppedError();
        unsigned __int8 v19 = 0;
      }
    }
  }

  return v19;
}

+ (BOOL)insertOrUpdateGateways:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5D7F0;
  v18[3] = &unk_1125D8;
  id v21 = a1;
  id v19 = v8;
  id v20 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5D924;
  v14[3] = &unk_112900;
  id v16 = v20;
  id v17 = a1;
  id v15 = v19;
  id v11 = v20;
  id v12 = v19;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v18 inaccessibilityHandler:v14];

  return (char)a5;
}

+ (BOOL)updateGateways:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5DB40;
  v18[3] = &unk_1125D8;
  id v21 = a1;
  id v19 = v8;
  id v20 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5DC94;
  v14[3] = &unk_112900;
  id v16 = v20;
  id v17 = a1;
  id v15 = v19;
  id v11 = v20;
  id v12 = v19;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v18 inaccessibilityHandler:v14];

  return (char)a5;
}

+ (BOOL)insertOrUpdateGateway:(id)a3 database:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(a6) = objc_msgSend(a1, "_insertOrUpdateGateway:syncProvenance:syncIdentity:database:profile:error:", v12, 0, objc_msgSend(v10, "currentSyncIdentityPersistentID"), v11, v10, a6);

  return (char)a6;
}

+ (BOOL)_updateGatewayIfExists:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8
{
  return [a1 _insertOrUpdateGateway:a3 syncProvenance:a4 syncIdentity:a5 database:a6 profile:a7 error:a8 insertionBlock:&stru_113A30];
}

+ (BOOL)_insertOrUpdateGateway:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8 insertionBlock:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = (uint64_t (**)(id, id, int64_t, void *, id *))a9;
  uint64_t v18 = [v14 externalID];
  id v26 = 0;
  id v19 = [a1 gatewayEntityWithExternalID:v18 database:v15 error:&v26];
  id v20 = v26;

  if (v20)
  {
    if (a8)
    {
      BOOL v21 = 0;
      *a8 = v20;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v21 = 0;
    }
  }
  else
  {
    id v22 = +[HDClinicalEntitySyncAnchor nextClinicalGatewaySyncAnchorWithProfile:v16 error:a8];
    if (v22)
    {
      if (v19) {
        unsigned __int8 v23 = [a1 _updateGatewayEntity:v19 withGateway:v14 syncAnchor:v22 syncProvenance:a4 syncIdentity:a5 database:v15 profile:v16 error:a8];
      }
      else {
        unsigned __int8 v23 = v17[2](v17, v15, a4, v22, a8);
      }
      BOOL v21 = v23;
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  return v21;
}

+ (BOOL)_insertOrUpdateGateway:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 profile:(id)a7 error:(id *)a8
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5E0A4;
  v16[3] = &unk_113A58;
  id v17 = a3;
  id v18 = a1;
  int64_t v19 = a4;
  int64_t v20 = a5;
  id v14 = v17;
  LOBYTE(a8) = [a1 _insertOrUpdateGateway:v14 syncProvenance:a4 syncIdentity:a5 database:a6 profile:a7 error:a8 insertionBlock:v16];

  return (char)a8;
}

+ (BOOL)_insertGateway:(id)a3 syncAnchor:(id)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [v14 createRawContentWithError:a8];
  if (v17)
  {
    id v18 = [a1 _propertiesForModelInsert];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_5E224;
    v22[3] = &unk_113A80;
    id v23 = v14;
    id v24 = v17;
    id v26 = a1;
    id v25 = v15;
    int64_t v27 = a5;
    int64_t v28 = a6;
    int64_t v19 = [a1 insertOrReplaceEntity:0 database:v16 properties:v18 error:a8 bindingHandler:v22];

    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)_updateGatewayEntity:(id)a3 withGateway:(id)a4 syncAnchor:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 database:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  BOOL v20 = [v15 numberForProperty:HDClinicalGatewayEntityPropertyRevision database:v18];
  BOOL v21 = v20;
  if (v20)
  {
    id v22 = [v20 longLongValue];
    if ((uint64_t)v22 >= (uint64_t)[v16 revision])
    {
      _HKInitializeLogging();
      __int16 v31 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
      {
        v33 = v31;
        *(_DWORD *)buf = 138544387;
        uint64_t v48 = objc_opt_class();
        __int16 v49 = 2114;
        uint64_t v50 = objc_opt_class();
        __int16 v51 = 2050;
        id v52 = v16;
        __int16 v53 = 2049;
        id v54 = [v21 longLongValue];
        __int16 v55 = 2049;
        id v56 = [v16 revision];
        _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%{public}@ not updating <%{public}@:%{public}p> existing revision %{private}lld is at least as new as incoming revision %{private}lld", buf, 0x34u);
      }
      unsigned __int8 v27 = v15 != 0;
    }
    else
    {
      id v23 = [v16 createRawContentWithError:a10];
      if (v23)
      {
        int64_t v34 = a7;
        id v24 = v23;
        [a1 _propertiesForModelUpdate];
        id v25 = v36 = v19;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_5E674;
        v40[3] = &unk_113A80;
        id v26 = v16;
        id v41 = v26;
        v35 = v24;
        id v42 = v24;
        id v44 = a1;
        id v37 = v17;
        id v43 = v17;
        int64_t v45 = a6;
        int64_t v46 = v34;
        unsigned __int8 v27 = [v15 updateProperties:v25 database:v18 error:a10 bindingHandler:v40];

        id v19 = v36;
        id v39 = 0;
        unsigned __int8 v28 = [a1 _updateSourcesForGatewayIfNeeded:v26 database:v18 profile:v36 error:&v39];
        id v29 = v39;
        if ((v28 & 1) == 0)
        {
          _HKInitializeLogging();
          id v30 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
            sub_AFE7C((uint64_t)a1, (uint64_t)v29, v30);
          }
        }

        id v17 = v37;
        id v23 = v35;
      }
      else
      {
        unsigned __int8 v27 = 0;
      }
    }
  }
  else
  {
    +[NSError hk_assignError:code:format:](NSError, "hk_assignError:code:format:", a10, 100, @"Unable to retrieve existing revision for gateway at row %lld", [v15 persistentID]);
    unsigned __int8 v27 = 0;
  }

  return v27;
}

+ (void)_bindSyncAnchor:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 binder:(HDSQLiteStatementBinder *)a6
{
  id v7 = a3;
  id v8 = [a1 propertyForSyncAnchor];
  HDSQLiteBindNumberToProperty();

  id v9 = [a1 propertyForSyncProvenance];
  HDSQLiteBindInt64ToProperty();

  HDSQLiteBindInt64ToProperty();
}

+ (BOOL)_insertCodableGateways:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_5E938;
  v20[3] = &unk_1128D8;
  id v23 = a1;
  id v21 = v10;
  id v22 = v11;
  int64_t v24 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5EAEC;
  v16[3] = &unk_112900;
  id v18 = v22;
  int64_t v19 = a4;
  id v17 = v21;
  id v13 = v22;
  id v14 = v21;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

+ (BOOL)_updateCodableGateways:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_5ECC8;
  v20[3] = &unk_1128D8;
  id v23 = a1;
  id v21 = v10;
  id v22 = v11;
  int64_t v24 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5EE78;
  v16[3] = &unk_112900;
  id v18 = v22;
  int64_t v19 = a4;
  id v17 = v21;
  id v13 = v22;
  id v14 = v21;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

- (BOOL)setNeedsSyncWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 protectedDatabase];
  id v10 = +[HDClinicalEntitySyncAnchor nextClinicalGatewaySyncAnchorWithProfile:v8 error:a5];
  if (v10)
  {
    id v11 = [(id)objc_opt_class() _propertiesForSync];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_5F018;
    v14[3] = &unk_113AA8;
    void v14[4] = self;
    id v15 = v10;
    id v16 = v8;
    unsigned __int8 v12 = [(HDClinicalGatewayEntity *)self updateProperties:v11 database:v9 error:a5 bindingHandler:v14];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

+ (id)_currentCodableMessageVersionForFHIRVersion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)HDCodableMessageVersion);
  [v4 setEntityVersion:1];
  unsigned int v5 = [v3 isEqualToString:@"1.0.2"];

  [v4 setCompatibilityVersion:v5 ^ 1];

  return v4;
}

+ (id)_codableGatewayFromGateway:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)HDCodableClinicalGateway);
  id v8 = [v6 createRawContentWithError:a4];
  [v7 setRawContent:v8];

  id v9 = [v6 FHIRVersion];

  id v10 = [v9 stringRepresentation];
  id v11 = [a1 _currentCodableMessageVersionForFHIRVersion:v10];
  [v7 setMessageVersion:v11];

  if ([a1 _validateCodableGateway:v7 error:a4]) {
    id v12 = v7;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (id)_codableGatewaysFromGateways:(id)a3 syncIdentity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(a1, "_codableGatewayFromGateway:error:", *(void *)(*((void *)&v21 + 1) + 8 * i), a5, (void)v21);
        if (!v16)
        {

          id v19 = 0;
          goto LABEL_11;
        }
        id v17 = (void *)v16;
        id v18 = [v9 codableSyncIdentity];
        [v17 setSyncIdentity:v18];

        [v10 addObject:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v19 = v10;
LABEL_11:

  return v19;
}

+ (id)_gatewayFromCodableGateway:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 _validateCodableGateway:v6 error:a4])
  {
    id v7 = [v6 rawContent];
    id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:a4];

    if (v8
      && +[HDClinicalGateway validateContent:v8 error:a4])
    {
      id v9 = [[HDClinicalGateway alloc] initWithRawContent:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_gatewaysFromCodableGateways:(id)a3 profile:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  id v11 = v9;
  id v37 = a5;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v46;
    *(void *)&long long v13 = 138543362;
    long long v34 = v13;
    id v35 = v11;
    id v36 = a1;
    uint64_t v38 = *(void *)v46;
    do
    {
      uint64_t v16 = 0;
      id v39 = v14;
      do
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v16);
        id v44 = 0;
        id v18 = objc_msgSend(v10, "_gatewayFromCodableGateway:error:", v17, &v44, v34);
        id v19 = v44;
        if (v18)
        {
          BOOL v20 = [v11 syncIdentityManager];
          long long v21 = [v20 legacySyncIdentity];

          if (![v17 hasSyncIdentity]) {
            goto LABEL_11;
          }
          long long v22 = [v17 syncIdentity];
          id v43 = 0;
          long long v23 = +[HDSyncIdentity syncIdentityWithCodable:v22 error:&v43];
          id v24 = v43;

          if (v23)
          {
            id v25 = [v11 syncIdentityManager];
            id v42 = v24;
            uint64_t v26 = [v25 concreteIdentityForIdentity:v23 shouldCreate:1 transaction:v37 error:&v42];
            id v27 = v42;

            if (v26)
            {

              long long v21 = (void *)v26;
              id v11 = v35;
              id v10 = v36;
              uint64_t v15 = v38;
              id v14 = v39;
LABEL_11:
              [v18 setSyncIdentity:v21];
              [v40 addObject:v18];
LABEL_20:

              goto LABEL_21;
            }
            _HKInitializeLogging();
            uint64_t v32 = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v34;
              id v50 = v27;
              _os_log_fault_impl(&dword_0, v32, OS_LOG_TYPE_FAULT, "HDClinicalGatewayEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
            long long v21 = 0;
            id v24 = v27;
            id v11 = v35;
            id v10 = v36;
          }
          else
          {
            _HKInitializeLogging();
            __int16 v31 = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v34;
              id v50 = v24;
              _os_log_fault_impl(&dword_0, v31, OS_LOG_TYPE_FAULT, "HDClinicalGatewayEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
            }
          }
          uint64_t v15 = v38;

          id v14 = v39;
          goto LABEL_20;
        }
        _HKInitializeLogging();
        unsigned __int8 v28 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          id v29 = v28;
          id v30 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          id v50 = v10;
          __int16 v51 = 2112;
          id v52 = v30;
          __int16 v53 = 2114;
          id v54 = v19;
          _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to deserialize codable gateway %@: %{public}@", buf, 0x20u);
        }
LABEL_21:

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v14);
  }

  return v40;
}

+ (id)_codableGatewayWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)HDCodableClinicalGateway);
  id v7 = HDSQLiteColumnWithNameAsData();
  [v6 setRawContent:v7];

  id v8 = [v6 FHIRVersionString];
  id v9 = [a1 _currentCodableMessageVersionForFHIRVersion:v8];
  [v6 setMessageVersion:v9];

  if ([a1 _validateCodableGateway:v6 error:a4]) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateCodableGateway:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasMessageVersion])
  {
    id v6 = [v5 messageVersion];
    int v7 = [v6 compatibilityVersion];

    if (v7 > 1)
    {
      CFStringRef v8 = @"Codable gateway compatibilty version is higher than what we support";
LABEL_7:
      +[NSError hk_assignError:a4 code:3 description:v8];
      BOOL v9 = 0;
      goto LABEL_8;
    }
  }
  if (([v5 hasRawContent] & 1) == 0)
  {
    CFStringRef v8 = @"Codable gateway missing raw content";
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

@end