@interface HDClinicalAPIReminderEntity
+ (BOOL)_insertReminder:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)deleteReminder:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)deleteRemindersForSourceWithBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_entityForAnyReminderWithSource:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_entityForReminder:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_firstQueryResultAsReminder:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)_predicateForPostedReminders;
+ (id)_predicateForReminderWithSourceBundleIdentifier:(id)a3;
+ (id)_predicateForReminderWithSourceEntity:(id)a3;
+ (id)_predicateForRemindersWithNotDeletedSources;
+ (id)_predicateForUnpostedReminders;
+ (id)_queryForLastPostedReminderInTransaction:(id)a3;
+ (id)_queryForNextScheduledReminderInTransaction:(id)a3;
+ (id)_reminderForSource:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_reminderForSource:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (id)lastPostedReminderWithProfile:(id)a3 error:(id *)a4;
+ (id)nextScheduledReminderWithProfile:(id)a3 error:(id *)a4;
+ (id)reminderForSource:(id)a3 createIfNecessary:(BOOL)a4 profile:(id)a5 error:(id *)a6;
+ (id)setReminderPosted:(id)a3 postDate:(id)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
- (id)_instantiateObjectWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
@end

@implementation HDClinicalAPIReminderEntity

+ (id)databaseTable
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@_api_reminders", @"HealthRecordsPlugin"];

  return v2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $3277B6B2C620D6D29E09CE5B70810548 *)off_114780;
}

+ (id)foreignKeys
{
  CFStringRef v5 = @"source_id";
  id v2 = +[HDSourceEntity defaultForeignKey];
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  if (([v4 isEqualToString:@"logical_sources.bundle_id"] & 1) != 0
    || [v4 isEqualToString:@"sources.deleted"])
  {
    v6 = [a1 disambiguatedDatabaseTable];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = HDSQLEntityPropertyPersistentID;
    v9 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v6 toTargetEntity:v7 as:0 localReference:@"source_id" targetKey:HDSQLEntityPropertyPersistentID];
    [v5 addObject:v9];

    v10 = [(id)objc_opt_class() disambiguatedDatabaseTable];
    v11 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v10 toTargetEntity:objc_opt_class() as:0 localReference:HDSourceEntityPropertyLogicalSourceID targetKey:v8];
    [v5 addObject:v11];
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___HDClinicalAPIReminderEntity;
  v12 = objc_msgSendSuper2(&v16, "joinClausesForProperty:", v4);
  if (v12) {
    [v5 unionSet:v12];
  }
  if ([v5 count]) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (id)nextScheduledReminderWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_86224;
  v20 = sub_86234;
  id v21 = 0;
  uint64_t v7 = [v6 database];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8623C;
  v12[3] = &unk_1128B0;
  id v14 = &v16;
  id v15 = a1;
  id v8 = v6;
  id v13 = v8;
  LODWORD(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v12];

  if (a4) {
    v9 = (void *)v17[5];
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)lastPostedReminderWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_86224;
  v20 = sub_86234;
  id v21 = 0;
  uint64_t v7 = [v6 database];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_86480;
  v12[3] = &unk_1128B0;
  id v14 = &v16;
  id v15 = a1;
  id v8 = v6;
  id v13 = v8;
  LODWORD(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v12];

  if (a4) {
    v9 = (void *)v17[5];
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)_entityForReminder:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 source];
  id v10 = [a1 _entityForAnyReminderWithSource:v9 transaction:v8 error:a5];

  return v10;
}

- (id)_instantiateObjectWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() entityEncoderForProfile:v8 transaction:v9 purpose:1 encodingOptions:0 authorizationFilter:0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_86224;
  v36 = sub_86234;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_86224;
  v30 = sub_86234;
  id v31 = 0;
  v11 = [v10 orderedProperties];
  v12 = [v9 unprotectedDatabase];
  id v25 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_86874;
  v20[3] = &unk_1147E8;
  v23 = &v32;
  id v13 = v10;
  id v21 = v13;
  v22 = self;
  v24 = &v26;
  unsigned int v14 = [(HDClinicalAPIReminderEntity *)self getValuesForProperties:v11 database:v12 error:&v25 handler:v20];
  id v15 = v25;

  if (!v33[5])
  {
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = (id)v27[5];
      if (!v17) {
        goto LABEL_10;
      }
    }
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
    else
    {
      _HKLogDroppedError();
    }
LABEL_10:

    if (v14) {
      goto LABEL_3;
    }
    goto LABEL_11;
  }
  if (v14)
  {
LABEL_3:
    uint64_t v16 = (void *)v33[5];
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v16 = 0;
LABEL_12:
  id v18 = v16;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

+ (id)_entityForAnyReminderWithSource:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 bundleIdentifier];
  id v10 = [a1 _predicateForReminderWithSourceBundleIdentifier:v9];

  v11 = [v8 unprotectedDatabase];

  v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];

  return v12;
}

+ (id)_reminderForSource:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [a1 _entityForAnyReminderWithSource:a3 transaction:v10 error:a6];
  id v13 = [v12 _instantiateObjectWithProfile:v11 transaction:v10 error:a6];

  return v13;
}

+ (id)_reminderForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_86224;
  id v25 = sub_86234;
  id v26 = 0;
  id v10 = [v9 database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_86BF4;
  v16[3] = &unk_114810;
  v19 = &v21;
  id v20 = a1;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v16];

  if (a5) {
    id v13 = (void *)v22[5];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);

  return v14;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [[_HDClinicalAPIReminderEntityEncoder alloc] initWithHealthEntityClass:a1 profile:v15 transaction:v14 purpose:a5 encodingOptions:v13 authorizationFilter:v12];

  return v16;
}

+ (BOOL)_insertReminder:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 source];
  id v14 = [v12 sourceManager];

  id v28 = 0;
  id v15 = [v14 sourceEntityForClientSource:v13 createOrUpdateIfNecessary:0 error:&v28];
  id v16 = v28;

  if (v15)
  {
    v29[0] = @"source_id";
    v29[1] = @"date_created";
    v29[2] = @"date_posted";
    id v17 = +[NSArray arrayWithObjects:v29 count:3];
    id v18 = [v11 unprotectedDatabase];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_86FF4;
    v25[3] = &unk_1126B8;
    id v26 = v15;
    id v27 = v10;
    v19 = [a1 insertOrReplaceEntity:0 database:v18 properties:v17 error:a6 bindingHandler:v25];
    BOOL v20 = v19 != 0;
  }
  else
  {
    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      uint64_t v21 = HKSensitiveLogItem();
      v22 = HKSensitiveLogItem();
      uint64_t v23 = +[NSError hk_error:100, @"Failed to insert reminder %@: source %@ not found.", v21, v22 format];

      id v17 = v23;
      if (!v17)
      {
        id v16 = 0;
        BOOL v20 = 0;
        goto LABEL_11;
      }
    }
    if (a6)
    {
      id v17 = v17;
      BOOL v20 = 0;
      *a6 = v17;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v20 = 0;
    }
    id v16 = v17;
  }

LABEL_11:
  return v20;
}

+ (id)reminderForSource:(id)a3 createIfNecessary:(BOOL)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = v11;
  if (a4)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = sub_86224;
    id v27 = sub_86234;
    id v28 = 0;
    id v13 = [v11 database];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_87250;
    v18[3] = &unk_114810;
    uint64_t v21 = &v23;
    id v22 = a1;
    id v19 = v10;
    id v20 = v12;
    unsigned int v14 = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v18];

    if (v14) {
      id v15 = (void *)v24[5];
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v16 = [a1 _reminderForSource:v10 profile:v11 error:a6];
  }

  return v16;
}

+ (id)setReminderPosted:(id)a3 postDate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_86224;
  v30 = sub_86234;
  id v31 = 0;
  id v13 = [v12 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_87540;
  v20[3] = &unk_114838;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  v24 = &v26;
  id v16 = v12;
  id v23 = v16;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a6 block:v20];

  if (a6) {
    id v17 = (void *)v27[5];
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

+ (BOOL)deleteReminder:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 source];
  id v10 = [v9 bundleIdentifier];
  LOBYTE(a5) = [a1 deleteRemindersForSourceWithBundleIdentifier:v10 profile:v8 error:a5];

  return (char)a5;
}

+ (BOOL)deleteRemindersForSourceWithBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_87908;
  v14[3] = &unk_1125D8;
  id v15 = v9;
  id v16 = v8;
  id v17 = a1;
  id v11 = v8;
  id v12 = v9;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v14];

  return (char)a5;
}

+ (id)_queryForLastPostedReminderInTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)HDSQLiteQueryDescriptor);
  [v5 setEntityClass:a1];
  [v5 setLimitCount:1];
  id v6 = +[HDSQLiteOrderingTerm orderingTermWithProperty:@"date_posted" entityClass:a1 ascending:0];
  id v13 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v13 count:1];
  [v5 setOrderingTerms:v7];

  id v8 = [a1 _predicateForPostedReminders];
  [v5 setPredicate:v8];

  id v9 = objc_alloc((Class)HDSQLiteQuery);
  id v10 = [v4 unprotectedDatabase];

  id v11 = [v9 initWithDatabase:v10 descriptor:v5];

  return v11;
}

+ (id)_queryForNextScheduledReminderInTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)HDSQLiteQueryDescriptor);
  [v5 setEntityClass:a1];
  [v5 setLimitCount:1];
  id v6 = +[HDSQLiteOrderingTerm orderingTermWithProperty:@"date_created" entityClass:a1 ascending:1];
  id v13 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v13 count:1];
  [v5 setOrderingTerms:v7];

  id v8 = [a1 _predicateForUnpostedReminders];
  [v5 setPredicate:v8];

  id v9 = objc_alloc((Class)HDSQLiteQuery);
  id v10 = [v4 unprotectedDatabase];

  id v11 = [v9 initWithDatabase:v10 descriptor:v5];

  return v11;
}

+ (id)_firstQueryResultAsReminder:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_86224;
  id v25 = sub_86234;
  id v26 = 0;
  id v12 = [(id)objc_opt_class() entityEncoderForProfile:v10 transaction:v11 purpose:1 encodingOptions:0 authorizationFilter:0];
  id v13 = [v12 orderedProperties];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_87EA0;
  v18[3] = &unk_114860;
  id v20 = &v21;
  id v14 = v12;
  id v19 = v14;
  LODWORD(a6) = [v9 enumeratePersistentIDsAndProperties:v13 error:a6 enumerationHandler:v18];

  if (a6) {
    id v15 = (void *)v22[5];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v21, 8);

  return v16;
}

+ (id)_predicateForReminderWithSourceBundleIdentifier:(id)a3
{
  id v4 = +[HDSQLiteComparisonPredicate predicateWithProperty:@"logical_sources.bundle_id" equalToValue:a3];
  id v5 = [a1 _predicateForRemindersWithNotDeletedSources];
  id v6 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v4 otherPredicate:v5];

  return v6;
}

+ (id)_predicateForReminderWithSourceEntity:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[HDSQLiteComparisonPredicate predicateWithProperty:@"source_id" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPostedReminders
{
  v3 = +[HDSQLiteNullPredicate isNotNullPredicateWithProperty:@"date_posted"];
  id v4 = [a1 _predicateForRemindersWithNotDeletedSources];
  id v5 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForUnpostedReminders
{
  v3 = +[HDSQLiteNullPredicate isNullPredicateWithProperty:@"date_posted"];
  id v4 = [a1 _predicateForRemindersWithNotDeletedSources];
  id v5 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForRemindersWithNotDeletedSources
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:@"sources.deleted" equalToValue:&__kCFBooleanFalse];
}

@end