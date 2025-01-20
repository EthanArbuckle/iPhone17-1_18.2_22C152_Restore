@interface HDWorkoutEventEntity
+ (BOOL)enumerateEventsForOwner:(int64_t)a3 withStatement:(id)a4 error:(id *)a5 eventHandler:(id)a6;
+ (BOOL)insertWorkoutEventsFromWorkout:(id)a3 ownerID:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (Class)ownerEntityClass;
+ (Class)workoutEventClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)deleteStatementForWorkoutEventsWithTransaction:(id)a3;
+ (id)foreignKeys;
+ (id)indices;
+ (id)insertPersistableWorkoutEvent:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)ownerEntityReferenceColumn;
+ (id)statementForEnumeratingEventsForOwnerInDatabase:(id)a3 error:(id *)a4;
+ (id)workoutEventsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)workoutEventsWithOwnerID:(id)a3 database:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDWorkoutEventEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"workout_events";
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return @"data_id";
}

+ (Class)workoutEventClass
{
  return (Class)objc_opt_class();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_51;
}

+ (id)foreignKeys
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"owner_id";
  id v3 = objc_alloc(MEMORY[0x1E4F65D20]);
  uint64_t v4 = [a1 ownerEntityClass];
  v5 = [a1 ownerEntityReferenceColumn];
  v6 = (void *)[v3 initWithEntityClass:v4 property:v5 deletionAction:2];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

+ (id)indices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v4 = NSString;
  v5 = [a1 databaseTable];
  v6 = [v4 stringWithFormat:@"%@_owners", v5];
  v11 = @"owner_id";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v8 = (void *)[v3 initWithEntity:a1 name:v6 columns:v7];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (id)insertPersistableWorkoutEvent:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6
{
  v22[7] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v22[0] = @"owner_id";
  v22[1] = @"date";
  v22[2] = @"type";
  v22[3] = @"duration";
  v22[4] = @"metadata";
  v22[5] = @"session_uuid";
  v22[6] = @"error";
  v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a5;
  v14 = [v12 arrayWithObjects:v22 count:7];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__HDWorkoutEventEntity_insertPersistableWorkoutEvent_ownerID_database_error___block_invoke;
  v19[3] = &unk_1E62F3A88;
  id v20 = v11;
  id v21 = v10;
  id v15 = v10;
  id v16 = v11;
  v17 = [a1 insertOrReplaceEntity:1 database:v13 properties:v14 error:a6 bindingHandler:v19];

  return v17;
}

void __77__HDWorkoutEventEntity_insertPersistableWorkoutEvent_ownerID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EA0](a2, @"owner_id", *(void *)(a1 + 32));
  id v10 = [*(id *)(a1 + 40) dateInterval];
  uint64_t v4 = [v10 startDate];
  MEMORY[0x1C1879E40](a2, @"date", v4);

  MEMORY[0x1C1879E80](a2, @"type", [*(id *)(a1 + 40) workoutEventType]);
  [v10 duration];
  MEMORY[0x1C1879E50](a2, @"duration");
  v5 = [*(id *)(a1 + 40) metadata];
  if ([v5 count])
  {
    v6 = objc_msgSend(v5, "hk_codableMetadata");
    v7 = [v6 data];
    MEMORY[0x1C1879E30](a2, @"metadata", v7);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"metadata");
  }
  v8 = [*(id *)(a1 + 40) sessionUUID];
  MEMORY[0x1C1879EF0](a2, @"session_uuid", v8);

  v9 = [*(id *)(a1 + 40) error];
  HDSQLiteBindSecureCodingObjectToProperty();
}

+ (BOOL)insertWorkoutEventsFromWorkout:(id)a3 ownerID:(id)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [a5 databaseForEntityClass:a1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = objc_msgSend(v10, "workoutEvents", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [a1 insertPersistableWorkoutEvent:*(void *)(*((void *)&v21 + 1) + 8 * i) ownerID:v11 database:v12 error:a6];

        if (!v18)
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

+ (id)workoutEventsWithOwnerID:(id)a3 database:(id)a4 error:(id *)a5
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v25[0] = @"date";
  v25[1] = @"type";
  v25[2] = @"duration";
  v25[3] = @"metadata";
  v25[4] = @"session_uuid";
  v25[5] = @"error";
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:v25 count:6];
  v12 = (void *)MEMORY[0x1E4F65D00];
  id v13 = _HDSQLiteValueForNumber();

  uint64_t v14 = [v12 predicateWithProperty:@"owner_id" equalToValue:v13];

  uint64_t v15 = [a1 queryWithDatabase:v9 predicate:v14];

  uint64_t v16 = [a1 workoutEventClass];
  v17 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__HDWorkoutEventEntity_workoutEventsWithOwnerID_database_error___block_invoke;
  v22[3] = &unk_1E6300B58;
  id v23 = v17;
  uint64_t v24 = v16;
  id v18 = v17;
  if ([v15 enumerateProperties:v11 error:a5 enumerationHandler:v22]) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }
  id v20 = v19;

  return v20;
}

uint64_t __64__HDWorkoutEventEntity_workoutEventsWithOwnerID_database_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsDate();
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v5 = v4;
  v6 = HDSQLiteColumnWithNameAsData();
  v7 = +[HDCodableMetadataDictionary decodeMetadataFromData:v6];
  v8 = HDSQLiteColumnWithNameAsUUID();
  objc_opt_class();
  id v9 = HDSQLiteColumnWithNameAsObject();
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v2 duration:v5];
  id v11 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithWorkoutEventType:v3 sessionUUID:v8 dateInterval:v10 metadata:v7 error:v9];
  [*(id *)(a1 + 32) addObject:v11];

  return 1;
}

+ (id)deleteStatementForWorkoutEventsWithTransaction:(id)a3
{
  double v4 = [a3 databaseForEntityClass:a1];
  double v5 = [a1 deleteStatementWithProperty:@"owner_id" database:v4];

  return v5;
}

+ (id)statementForEnumeratingEventsForOwnerInDatabase:(id)a3 error:(id *)a4
{
  double v5 = NSString;
  id v6 = a3;
  v7 = [a1 disambiguatedDatabaseTable];
  v8 = [v5 stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"date", @"type", @"duration", @"metadata", @"session_uuid", @"error", v7, @"owner_id"];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65D80]) initWithSQL:v8 database:v6];

  return v9;
}

+ (BOOL)enumerateEventsForOwner:(int64_t)a3 withStatement:(id)a4 error:(id *)a5 eventHandler:(id)a6
{
  id v12 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke_2;
  v11[3] = &unk_1E62F33D0;
  id v9 = v12;
  LOBYTE(a5) = [a4 enumerateStatementWithError:a5 bindingHandler:v13 block:v11];

  return (char)a5;
}

uint64_t __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke_2(uint64_t a1)
{
  HDSQLiteColumnWithNameAsDouble();
  double v3 = v2;
  HDSQLiteColumnWithNameAsDouble();
  double v5 = v4;
  HDSQLiteColumnWithNameAsInt64();
  id v6 = HDSQLiteColumnWithNameAsData();
  v7 = +[HDCodableMetadataDictionary decodeMetadataFromData:v6];
  v8 = HDSQLiteColumnWithNameAsUUID();
  objc_opt_class();
  id v9 = HDSQLiteColumnWithNameAsObject();
  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(v3, v5);

  return 1;
}

+ (id)workoutEventsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  id v10 = [a1 statementForEnumeratingEventsForOwnerInDatabase:v9 error:a5];

  if (v10)
  {
    uint64_t v11 = [a1 workoutEventClass];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = [v8 persistentID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HDWorkoutEventEntity_workoutEventsForOwner_transaction_error___block_invoke;
    v18[3] = &unk_1E6300B80;
    id v19 = v12;
    uint64_t v20 = v11;
    id v14 = v12;
    if ([a1 enumerateEventsForOwner:v13 withStatement:v10 error:a5 eventHandler:v18]) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __64__HDWorkoutEventEntity_workoutEventsForOwner_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, double a6, double a7)
{
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F28C18];
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v13 alloc];
  id v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a6];
  id v20 = (id)[v17 initWithStartDate:v18 duration:a7];

  id v19 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithWorkoutEventType:a2 sessionUUID:v15 dateInterval:v20 metadata:v16 error:v14];
  [*(id *)(a1 + 32) addObject:v19];
}

@end