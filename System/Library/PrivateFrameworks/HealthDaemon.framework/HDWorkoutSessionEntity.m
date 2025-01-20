@interface HDWorkoutSessionEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)createSessionWithIdentifier:(id)a3 source:(id)a4 configuration:(id)a5 state:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)lookupSessionWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)privateSubEntities;
+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 expirationInterval:(double)a4 error:(id *)a5;
+ (id)sessionsExcludingIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)sessionsForSource:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)finishWithTransaction:(id)a3 error:(id *)a4;
- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setActivityConfigurations:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setAssociatedBuilder:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setClientApplicationIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setClientBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setCurrentActivity:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setFirstActivityConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setHasFailed:(BOOL)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setIsMirroring:(BOOL)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setRequestedEndDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setRequestedStartDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setRequestedTargetState:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setSource:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setState:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)updateLatestActivityDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)updateLatestActivityDateWithTransaction:(id)a3 error:(id *)a4;
- (id)activityConfigurationsWithTransaction:(id)a3 error:(id *)a4;
- (id)associatedBuilderWithTransaction:(id)a3 error:(id *)a4;
- (id)clientApplicationIdentifier:(id)a3 error:(id *)a4;
- (id)clientBundleIdentifier:(id)a3 error:(id *)a4;
- (id)currentActivityWithTransaction:(id)a3 error:(id *)a4;
- (id)endDateInTransaction:(id)a3 error:(id *)a4;
- (id)firstActivityConfigurationWithTransaction:(id)a3 error:(id *)a4;
- (id)hasFailedInTransaction:(id)a3 error:(id *)a4;
- (id)isMirroringInTransaction:(id)a3 error:(id *)a4;
- (id)latestActivityDateInTransaction:(id)a3 error:(id *)a4;
- (id)requestedEndDateInTransaction:(id)a3 error:(id *)a4;
- (id)requestedStartDateInTransaction:(id)a3 error:(id *)a4;
- (id)requestedTargetStateWithTransaction:(id)a3 error:(id *)a4;
- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4;
- (id)sourceWithTransaction:(id)a3 error:(id *)a4;
- (id)startDateInTransaction:(id)a3 error:(id *)a4;
- (id)stateWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutConfigurationWithTransaction:(id)a3 error:(id *)a4;
- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDWorkoutSessionEntity

+ (id)lookupSessionWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  v10 = [v8 predicateWithProperty:@"uuid" equalToValue:a3];
  v11 = [v9 database];

  v12 = [a1 anyWithPredicate:v10 healthDatabase:v11 error:a5];

  return v12;
}

+ (id)createSessionWithIdentifier:(id)a3 source:(id)a4 configuration:(id)a5 state:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  v30[7] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v30[0] = @"uuid";
  v30[1] = @"workout_configuration";
  v30[2] = @"source_id";
  v30[3] = @"state";
  v30[4] = @"requested_target_state";
  v30[5] = @"creation_date";
  v30[6] = @"latest_activity_date";
  v16 = (void *)MEMORY[0x1E4F1C978];
  id v17 = a7;
  v18 = [v16 arrayWithObjects:v30 count:7];
  v19 = [v17 database];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__HDWorkoutSessionEntity_createSessionWithIdentifier_source_configuration_state_profile_error___block_invoke;
  v25[3] = &unk_1E62FDFC8;
  id v26 = v13;
  id v27 = v15;
  id v28 = v14;
  int64_t v29 = a6;
  id v20 = v14;
  id v21 = v15;
  id v22 = v13;
  v23 = +[HDHealthEntity insertOrReplaceEntity:0 healthDatabase:v19 properties:v18 error:a8 bindingHandler:v25];

  return v23;
}

void __95__HDWorkoutSessionEntity_createSessionWithIdentifier_source_configuration_state_profile_error___block_invoke(void *a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", a1[4]);
  HDSQLiteBindSecureCodingObjectToProperty();
  v4 = (void *)a1[6];
  if (v4) {
    MEMORY[0x1C1879E80](a2, @"source_id", [v4 persistentID]);
  }
  else {
    MEMORY[0x1C1879E90](a2, @"source_id");
  }
  MEMORY[0x1C1879E80](a2, @"state", a1[7]);
  MEMORY[0x1C1879E80](a2, @"requested_target_state", 1);
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"creation_date", v5);
  MEMORY[0x1C1879E40](a2, @"latest_activity_date", v5);
}

+ (id)sessionsForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v9 = (void *)MEMORY[0x1E4F65D00];
    v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
    a3 = [v9 predicateWithProperty:@"source_id" equalToValue:v10];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = [v8 database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke;
  v19[3] = &unk_1E62F4200;
  id v21 = v11;
  id v22 = a1;
  id v20 = a3;
  id v13 = v11;
  id v14 = a3;
  int v15 = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v19];

  if (v15) {
    v16 = v13;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 48);
  v6 = [a2 databaseForEntityClass:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke_2;
  v10[3] = &unk_1E62FE6F0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = [v5 enumerateEntitiesInDatabase:v6 predicate:v7 error:a3 enumerationHandler:v10];

  return v8;
}

uint64_t __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)sessionsExcludingIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F65D10];
  id v9 = a4;
  v10 = [v8 doesNotContainPredicateWithProperty:@"uuid" values:a3];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = [v9 database];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke;
  v18[3] = &unk_1E62F4200;
  id v20 = v11;
  id v21 = a1;
  id v19 = v10;
  id v13 = v11;
  id v14 = v10;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v18];

  if (a5) {
    int v15 = v13;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 48);
  v6 = [a2 databaseForEntityClass:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke_2;
  v10[3] = &unk_1E62FE6F0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = [v5 enumerateEntitiesInDatabase:v6 predicate:v7 error:a3 enumerationHandler:v10];

  return v8;
}

uint64_t __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 expirationInterval:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = NSString;
  v10 = [a1 disambiguatedDatabaseTable];
  id v11 = [v9 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ >= ? ORDER BY %@ DESC LIMIT 1", @"uuid", v10, @"latest_activity_date", @"creation_date"];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__168;
  id v26 = __Block_byref_object_dispose__168;
  id v27 = 0;
  v12 = [v8 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke;
  v17[3] = &unk_1E62FE6C8;
  id v20 = a1;
  id v13 = v11;
  double v21 = a4;
  id v18 = v13;
  id v19 = &v22;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v17];

  if (a5) {
    id v14 = (void *)v23[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = [a2 databaseForEntityClass:a1[6]];
  uint64_t v6 = a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v10[4] = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_3;
  v9[3] = &unk_1E62F3640;
  v9[4] = a1[5];
  uint64_t v7 = [v5 executeSQL:v6 error:a3 bindingHandler:v10 enumerationHandler:v9];

  return v7;
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 32);

  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"uuid";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutSessionEntity_sessionIdentifierWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__HDWorkoutSessionEntity_sessionIdentifierWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)workoutConfigurationWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"workout_configuration";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionEntity_workoutConfigurationWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __68__HDWorkoutSessionEntity_workoutConfigurationWithTransaction_error___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = HDSQLiteColumnWithNameAsObject();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"workout_configuration";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HDWorkoutSessionEntity_setWorkoutConfiguration_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

uint64_t __68__HDWorkoutSessionEntity_setWorkoutConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)currentActivityWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"current_activity";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HDWorkoutSessionEntity_currentActivityWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__HDWorkoutSessionEntity_currentActivityWithTransaction_error___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = HDSQLiteColumnWithNameAsObject();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setCurrentActivity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"current_activity";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HDWorkoutSessionEntity_setCurrentActivity_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

uint64_t __63__HDWorkoutSessionEntity_setCurrentActivity_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)activityConfigurationsWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"activity_configurations";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HDWorkoutSessionEntity_activityConfigurationsWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __70__HDWorkoutSessionEntity_activityConfigurationsWithTransaction_error___block_invoke(uint64_t a1)
{
  if (HDSQLiteColumnWithNameIsNull())
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = HDSQLiteColumnWithNameAsObjectWithClasses();
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v3 = v9;
  }
}

- (BOOL)setActivityConfigurations:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"activity_configurations";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HDWorkoutSessionEntity_setActivityConfigurations_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

uint64_t __70__HDWorkoutSessionEntity_setActivityConfigurations_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)firstActivityConfigurationWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"first_activity_configuration";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDWorkoutSessionEntity_firstActivityConfigurationWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __74__HDWorkoutSessionEntity_firstActivityConfigurationWithTransaction_error___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = HDSQLiteColumnWithNameAsObject();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setFirstActivityConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"first_activity_configuration";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HDWorkoutSessionEntity_setFirstActivityConfiguration_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

uint64_t __74__HDWorkoutSessionEntity_setFirstActivityConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)isMirroringInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self numberForProperty:@"is_mirroring" transaction:a3 error:a4];
}

- (BOOL)setIsMirroring:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = [v8 numberWithBool:v6];
  LOBYTE(a5) = [(HDHealthEntity *)self setNumber:v10 forProperty:@"is_mirroring" transaction:v9 error:a5];

  return (char)a5;
}

- (id)requestedStartDateInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"requested_start_date" transaction:a3 error:a4];
}

- (BOOL)setRequestedStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"requested_start_date" transaction:a4 error:a5];
}

- (id)startDateInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"start_date" transaction:a3 error:a4];
}

- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"start_date" transaction:a4 error:a5];
}

- (id)requestedEndDateInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"requested_end_date" transaction:a3 error:a4];
}

- (BOOL)setRequestedEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"requested_end_date" transaction:a4 error:a5];
}

- (id)endDateInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"end_date" transaction:a3 error:a4];
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"end_date" transaction:a4 error:a5];
}

- (id)hasFailedInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self numberForProperty:@"has_failed" transaction:a3 error:a4];
}

- (BOOL)setHasFailed:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = [v8 numberWithBool:v6];
  LOBYTE(a5) = [(HDHealthEntity *)self setNumber:v10 forProperty:@"has_failed" transaction:v9 error:a5];

  return (char)a5;
}

- (id)clientBundleIdentifier:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"client_bundle_id" transaction:a3 error:a4];
}

- (BOOL)setClientBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setString:a3 forProperty:@"client_bundle_id" transaction:a4 error:a5];
}

- (id)clientApplicationIdentifier:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self stringForProperty:@"client_application_id" transaction:a3 error:a4];
}

- (BOOL)setClientApplicationIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setString:a3 forProperty:@"client_application_id" transaction:a4 error:a5];
}

- (id)sourceWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthEntity *)self foreignKeyEntity:objc_opt_class() forProperty:@"source_id" transaction:v6 error:a4];

  return v7;
}

- (BOOL)setSource:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setForeignKeyEntity:a3 forProperty:@"source_id" transaction:a4 error:a5];
}

- (id)associatedBuilderWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDHealthEntity *)self foreignKeyEntity:objc_opt_class() forProperty:@"builder_id" transaction:v6 error:a4];

  return v7;
}

- (BOOL)setAssociatedBuilder:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setForeignKeyEntity:a3 forProperty:@"builder_id" transaction:a4 error:a5];
}

- (id)stateWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"state";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HDWorkoutSessionEntity_stateWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __53__HDWorkoutSessionEntity_stateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"state";
  v14[1] = @"latest_activity_date";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = [v8 arrayWithObjects:v14 count:2];
  id v11 = [v9 databaseForEntity:self];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HDWorkoutSessionEntity_setState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v13];

  return (char)a5;
}

void __53__HDWorkoutSessionEntity_setState_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"state", *(void *)(a1 + 32));
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"latest_activity_date", v3);
}

- (id)requestedTargetStateWithTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__168;
  id v17 = __Block_byref_object_dispose__168;
  id v18 = 0;
  v19[0] = @"requested_target_state";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionEntity_requestedTargetStateWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __68__HDWorkoutSessionEntity_requestedTargetStateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)setRequestedTargetState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"requested_target_state";
  v14[1] = @"latest_activity_date";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = [v8 arrayWithObjects:v14 count:2];
  id v11 = [v9 databaseForEntity:self];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDWorkoutSessionEntity_setRequestedTargetState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v10 database:v11 error:a5 bindingHandler:v13];

  return (char)a5;
}

void __68__HDWorkoutSessionEntity_setRequestedTargetState_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"requested_target_state", *(void *)(a1 + 32));
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  MEMORY[0x1C1879E40](a2, @"latest_activity_date", v3);
}

- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend(v8, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  v12 = [v9 databaseForEntity:self];

  uint64_t v13 = +[HDWorkoutEventEntity insertPersistableWorkoutEvent:v10 ownerID:v11 database:v12 error:a5];

  return v13 != 0;
}

- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4
{
  return +[HDWorkoutSessionEventEntity workoutEventsWithWorkoutSession:self transaction:a3 error:a4];
}

- (BOOL)finishWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = [a3 databaseForEntity:self];
  LOBYTE(a4) = [(HDSQLiteEntity *)self deleteFromDatabase:v6 error:a4];

  return (char)a4;
}

- (id)latestActivityDateInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"latest_activity_date" transaction:a3 error:a4];
}

- (BOOL)updateLatestActivityDateWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 date];
  LOBYTE(a4) = [(HDWorkoutSessionEntity *)self updateLatestActivityDate:v8 transaction:v7 error:a4];

  return (char)a4;
}

- (BOOL)updateLatestActivityDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17[0] = @"latest_activity_date";
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v17 count:1];
  v12 = [v10 databaseForEntity:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HDWorkoutSessionEntity_updateLatestActivityDate_transaction_error___block_invoke;
  v15[3] = &unk_1E62F35C8;
  id v16 = v8;
  id v13 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v12 error:a5 bindingHandler:v15];

  return (char)a5;
}

void __69__HDWorkoutSessionEntity_updateLatestActivityDate_transaction_error___block_invoke()
{
}

+ (id)databaseTable
{
  return @"workout_sessions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_88;
}

+ (id)foreignKeys
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"source_id";
  uint64_t v2 = +[HDHealthEntity defaultForeignKey];
  v7[1] = @"builder_id";
  v8[0] = v2;
  id v3 = objc_alloc(MEMORY[0x1E4F65D20]);
  v4 = (void *)[v3 initWithEntityClass:objc_opt_class() property:*MEMORY[0x1E4F65C70] deletionAction:3];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)privateSubEntities
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

@end