@interface HDClinicalAuthorizationSessionEntity
+ (BOOL)deleteSessionWithState:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)pruneAuthorizationSessionsInDatabase:(id)a3 error:(id *)a4;
+ (id)_entityWithState:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_insertEntityInDatabase:(id)a3 loginSession:(id)a4 gatewayID:(id)a5 accountID:(id)a6 error:(id *)a7;
+ (id)_predicateForEntityWithState:(id)a3;
+ (id)_propertiesForEntity;
+ (id)_propertiesForTokenSession;
+ (id)createInitialLoginSessionForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)createReloginSessionForAccountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)existingEntityWithState:(id)a3 database:(id)a4 error:(id *)a5;
- (BOOL)updateWithCode:(id)a3 database:(id)a4 error:(id *)a5;
- (id)accountIdentifierInDatabase:(id)a3;
- (id)gatewayExternalIDInDatabase:(id)a3;
- (id)tokenSessionInDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDClinicalAuthorizationSessionEntity

+ (id)_propertiesForEntity
{
  v4[0] = HDClinicalAuthorizationSessionEntityPropertyCode;
  v4[1] = HDClinicalAuthorizationSessionEntityPropertyQuery;
  v4[2] = HDClinicalAuthorizationSessionEntityPropertyState;
  v4[3] = HDClinicalAuthorizationSessionEntityPropertyPKCEVerifier;
  v4[4] = HDClinicalAuthorizationSessionEntityPropertyCreationDate;
  v4[5] = HDClinicalAuthorizationSessionEntityPropertyGatewayID;
  v4[6] = HDClinicalAuthorizationSessionEntityPropertyAccountID;
  v4[7] = HDClinicalAuthorizationSessionEntityPropertyRequestedScope;
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

+ (id)_propertiesForTokenSession
{
  v4[0] = HDClinicalAuthorizationSessionEntityPropertyCode;
  v4[1] = HDClinicalAuthorizationSessionEntityPropertyQuery;
  v4[2] = HDClinicalAuthorizationSessionEntityPropertyState;
  v4[3] = HDClinicalAuthorizationSessionEntityPropertyPKCEVerifier;
  v4[4] = HDClinicalAuthorizationSessionEntityPropertyRequestedScope;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)_predicateForEntityWithState:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAuthorizationSessionEntityPropertyState equalToValue:a3];
}

+ (id)_insertEntityInDatabase:(id)a3 loginSession:(id)a4 gatewayID:(id)a5 accountID:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if ((v15 != 0) != (v16 == 0))
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"HDClinicalAuthorizationSessionEntity+HealthRecordsPlugin.m", 68, @"Invalid parameter not satisfying: %@", @"(gatewayID != nil && accountID == nil) || (gatewayID == nil && accountID != nil)" object file lineNumber description];
  }
  id v17 = objc_alloc_init((Class)NSDate);
  v18 = [a1 _propertiesForEntity];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_92158;
  v26[3] = &unk_111D50;
  id v27 = v14;
  id v28 = v17;
  id v29 = v15;
  id v30 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  v23 = [a1 insertOrReplaceEntity:0 database:v13 properties:v18 error:a7 bindingHandler:v26];

  return v23;
}

+ (id)createInitialLoginSessionForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[HDClinicalGatewayEntity existingGatewayEntityWithExternalID:a3 database:v8 error:a5];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 newLoginSessionWithEntityInDatabase:v8 error:a5];
    if (v11)
    {
      v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 persistentID]);
      id v13 = [a1 _insertEntityInDatabase:v8 loginSession:v11 gatewayID:v12 accountID:0 error:a5];

      if (v13) {
        id v14 = v11;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)createReloginSessionForAccountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a4;
  v10 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:a3 database:v9 error:a5];
  id v11 = v10;
  if (v10)
  {
    v12 = [v10 numberForProperty:HDClinicalAccountEntityPropertyGatewayID database:v9];
    if (v12)
    {
      id v13 = +[HDClinicalGatewayEntity entityWithPersistentID:v12];
      if (!v13)
      {
        id v20 = +[NSAssertionHandler currentHandler];
        [v20 handleFailureInMethod:a2, a1, @"HDClinicalAuthorizationSessionEntity+HealthRecordsPlugin.m", 132, @"Unable to init gateway entity with %@", v12 object file lineNumber description];
      }
      id v14 = [v13 newLoginSessionWithEntityInDatabase:v9 error:a5];
      if (v14)
      {
        id v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
        id v16 = [a1 _insertEntityInDatabase:v9 loginSession:v14 gatewayID:0 accountID:v15 error:a5];

        if (v16) {
          id v17 = v14;
        }
        else {
          id v17 = 0;
        }
        id v18 = v17;
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      +[NSError hk_assignError:a5, 118, @"account %@ does not have a gateway", v11 code format];
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)updateWithCode:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = HDClinicalAuthorizationSessionEntityPropertyCode;
  id v11 = [(HDClinicalAuthorizationSessionEntity *)self valueForProperty:v10 database:v9];
  if (v11)
  {
    +[NSError hk_assignError:a5 code:100 description:@"Attempting to add authorization code to session with existing authorization code"];
    unsigned __int8 v12 = 0;
  }
  else
  {
    id v18 = v10;
    id v13 = +[NSArray arrayWithObjects:&v18 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_9273C;
    v15[3] = &unk_1126B8;
    id v16 = v10;
    id v17 = v8;
    unsigned __int8 v12 = [(HDClinicalAuthorizationSessionEntity *)self updateProperties:v13 database:v9 error:a5 bindingHandler:v15];
  }
  return v12;
}

+ (BOOL)deleteSessionWithState:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  [a1 _predicateForEntityWithState:v8];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_9289C;
  v17[3] = &unk_112AB8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = a1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_92900;
  v14[3] = &unk_112FF8;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v18;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v17 inaccessibilityHandler:v14];

  return (char)a5;
}

+ (id)_entityWithState:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForEntityWithState:a3];
  id v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)existingEntityWithState:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v13 = 0;
  id v9 = [a1 _entityWithState:v8 database:a4 error:&v13];
  if (!v9)
  {
    id v10 = v13;
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to fetch authorization session entity with state: %@", v8];
    +[NSError hk_assignError:a5 code:100 description:v11 underlyingError:v10];
  }

  return v9;
}

- (id)accountIdentifierInDatabase:(id)a3
{
  return [(HDClinicalAuthorizationSessionEntity *)self UUIDForProperty:HDClinicalAuthorizationSessionEntityPropertyAccountIdentifier database:a3];
}

- (id)gatewayExternalIDInDatabase:(id)a3
{
  return [(HDClinicalAuthorizationSessionEntity *)self stringForProperty:HDClinicalAuthorizationSessionEntityPropertyGatewayExternalID database:a3];
}

- (id)tokenSessionInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_92C80;
  id v17 = sub_92C90;
  id v18 = 0;
  v7 = [(id)objc_opt_class() _propertiesForTokenSession];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_92C98;
  v12[3] = &unk_114930;
  v12[4] = &v13;
  unsigned int v8 = [(HDClinicalAuthorizationSessionEntity *)self getValuesForProperties:v7 database:v6 handler:v12];

  if (!v8 || (id v9 = (void *)v14[5]) == 0)
  {
    +[NSError hk_assignError:a4, 100, @"Unable to instantiate token session from auth session entity at row %lld", [(HDClinicalAuthorizationSessionEntity *)self persistentID] code format];
    if (v8) {
      id v9 = (void *)v14[5];
    }
    else {
      id v9 = 0;
    }
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

+ (BOOL)pruneAuthorizationSessionsInDatabase:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[HDClinicalAuthorizationSessionEntity disambiguatedDatabaseTable];
  uint64_t v7 = HDClinicalAuthorizationSessionEntityPropertyAccountID;
  unsigned int v8 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  uint64_t v9 = HDClinicalAuthorizationSessionEntityPropertyGatewayID;
  id v10 = +[HDClinicalGatewayEntity disambiguatedDatabaseTable];
  id v11 = +[NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ NOT IN (SELECT ROWID FROM %@) AND %@ NOT IN (SELECT ROWID FROM %@)", v6, v7, v8, v9, v10];

  LOBYTE(v6) = [v5 executeUncachedSQL:v11 error:a4 bindingHandler:0 enumerationHandler:0];
  id v12 = +[NSDate date];
  uint64_t v13 = [v12 dateByAddingTimeInterval:-86400.0];

  [v13 timeIntervalSinceReferenceDate];
  uint64_t v15 = +[NSString stringWithFormat:@"DELETE FROM clinical_authorization_sessions WHERE creation_date < %f", v14];
  LOBYTE(a4) = [v5 executeUncachedSQL:v15 error:a4 bindingHandler:0 enumerationHandler:0];

  return v6 & a4;
}

@end