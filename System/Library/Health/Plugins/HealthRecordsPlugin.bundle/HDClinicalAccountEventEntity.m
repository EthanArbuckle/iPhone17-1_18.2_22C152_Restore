@interface HDClinicalAccountEventEntity
+ (BOOL)_pruneEventsIfNeededInDatabase:(id)a3 error:(id *)a4;
+ (BOOL)_pruneEventsInDatabase:(id)a3 error:(id *)a4;
+ (BOOL)insertEvent:(id)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)insertEvent:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)journalEvent:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_fetchEventsForAccountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_propertiesForModel;
+ (id)_wrapHKOptionalClinicalAccountCredentialStateInNSNumber:(int64_t)a3;
+ (id)fetchEventsForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)_unwrapHKClinicalAccountCredentialStateFromNSNumber:(id)a3;
- (id)_eventInDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDClinicalAccountEventEntity

+ (id)_propertiesForModel
{
  v4[0] = HDClinicalAccountEventEntityPropertyAccountIdentifier;
  v4[1] = HDClinicalAccountEventEntityPropertyType;
  v4[2] = HDClinicalAccountEventEntityPropertyCaller;
  v4[3] = HDClinicalAccountEventEntityPropertyTimestamp;
  v4[4] = HDClinicalAccountEventEntityPropertyEventDescription;
  v4[5] = HDClinicalAccountEventEntityPropertyCredentialStateBefore;
  v4[6] = HDClinicalAccountEventEntityPropertyCredentialStateAfter;
  v2 = +[NSArray arrayWithObjects:v4 count:7];

  return v2;
}

+ (BOOL)insertEvent:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 database];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2BBD0;
  v18[3] = &unk_112AB8;
  id v20 = a1;
  id v19 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2BC7C;
  v14[3] = &unk_112900;
  id v16 = v9;
  id v17 = a1;
  id v15 = v19;
  id v11 = v9;
  id v12 = v19;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v18 inaccessibilityHandler:v14];

  return (char)a5;
}

+ (BOOL)insertEvent:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 _propertiesForModel];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2BDD0;
  v14[3] = &unk_111B40;
  id v15 = v8;
  id v11 = v8;
  id v12 = [a1 insertOrReplaceEntity:0 database:v9 properties:v10 error:a5 bindingHandler:v14];

  return v12 != 0;
}

+ (BOOL)journalEvent:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[HDClinicalAccountEventInsertJournalEntry alloc] initWithEvent:v8];

  LOBYTE(a5) = [v7 addJournalEntry:v9 error:a5];
  return (char)a5;
}

- (id)_eventInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2C184;
  v18 = sub_2C194;
  id v19 = 0;
  id v7 = [(id)objc_opt_class() _propertiesForModel];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2C19C;
  v12[3] = &unk_112AE0;
  v12[4] = self;
  v12[5] = &v14;
  id v13 = 0;
  unsigned __int8 v8 = [(HDClinicalAccountEventEntity *)self getValuesForProperties:v7 database:v6 error:&v13 handler:v12];
  id v9 = v13;

  if (v8)
  {
    id v10 = (id)v15[5];
  }
  else
  {
    +[NSError hk_assignError:a4 code:100 description:@"Unable to create account event model from row." underlyingError:v9];
    id v10 = 0;
  }

  _Block_object_dispose(&v14, 8);

  return v10;
}

+ (id)fetchEventsForAccountWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_2C184;
  v23 = sub_2C194;
  id v24 = 0;
  id v10 = [v9 database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2C4BC;
  v15[3] = &unk_1128B0;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v15];

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

+ (id)_fetchEventsForAccountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_2C184;
  v37 = sub_2C194;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id v12 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEventEntityPropertyAccountIdentifier equalToValue:v9];
  id v27 = a1;
  id v28 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_2C7C8;
  v21[3] = &unk_112B08;
  SEL v26 = a2;
  id v13 = v10;
  id v22 = v13;
  id v24 = &v33;
  v25 = &v29;
  id v14 = v11;
  id v23 = v14;
  unsigned __int8 v15 = [a1 enumerateEntitiesInDatabase:v13 predicate:v12 error:&v28 enumerationHandler:v21];
  id v16 = v28;
  id v17 = v16;
  if (*((unsigned char *)v30 + 24))
  {
    if (v15)
    {
      id v18 = [v14 copy];
      goto LABEL_12;
    }
    id v19 = v16;
    if (v19)
    {
      if (a5) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = (id)v34[5];
    if (v19)
    {
      if (a5)
      {
LABEL_9:
        id v19 = v19;
        *a5 = v19;
        goto LABEL_11;
      }
LABEL_10:
      _HKLogDroppedError();
    }
  }
LABEL_11:

  id v18 = 0;
LABEL_12:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

+ (id)_wrapHKOptionalClinicalAccountCredentialStateInNSNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_112B28[a3 - 1];
  }
}

+ (int64_t)_unwrapHKClinicalAccountCredentialStateFromNSNumber:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
    if ((unint64_t)v5 < 3) {
      int64_t v6 = (int64_t)v5 + 1;
    }
    else {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)_pruneEventsIfNeededInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 doubleForKey:@"HDClinicalAccountEventEntity_HealthRecordsPlugin_LastPrune"];
  double v9 = v8;

  id v10 = +[NSDate date];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  double v13 = v9 + 604800.0;
  if (v9 <= 0.0 || v13 < v12)
  {
    if (!objc_msgSend(a1, "_pruneEventsInDatabase:error:", v6, a4, v13))
    {
      BOOL v16 = 0;
      goto LABEL_10;
    }
    unsigned __int8 v15 = +[NSUserDefaults standardUserDefaults];
    [v15 setDouble:@"HDClinicalAccountEventEntity_HealthRecordsPlugin_LastPrune" forKey:v12];
  }
  BOOL v16 = 1;
LABEL_10:

  return v16;
}

+ (BOOL)_pruneEventsInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = HDClinicalAccountEntityPropertyIdentifier;
  double v8 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  double v9 = +[NSString stringWithFormat:@"SELECT %@ FROM %@", v7, v8];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_2CCF0;
  v27[3] = &unk_1125B0;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v28 = v10;
  if ([v6 executeUncachedSQL:v9 error:a4 bindingHandler:0 enumerationHandler:v27])
  {
    double v11 = [a1 disambiguatedDatabaseTable];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM %@ WHERE %@=? ORDER BY %@ DESC LIMIT -1 OFFSET 50;",
      v11,
      HDClinicalAccountEventEntityPropertyAccountIdentifier,
    double v12 = HDClinicalAccountEventEntityPropertyTimestamp);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      id v21 = v10;
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_2CD3C;
          v22[3] = &unk_111DB8;
          v22[4] = v18;
          if (![v6 executeUncachedSQL:v12 error:a4 bindingHandler:v22 enumerationHandler:0])
          {
            BOOL v19 = 0;
            goto LABEL_13;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      BOOL v19 = 1;
LABEL_13:
      id v10 = v21;
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

@end