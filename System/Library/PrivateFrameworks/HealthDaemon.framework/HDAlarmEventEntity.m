@interface HDAlarmEventEntity
+ (BOOL)deleteAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)deleteAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 enumerationHandler:(id)a5 error:(id *)a6;
+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)enumerateAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)enumerateAllAlarmEventsWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
+ (BOOL)insertOrReplaceAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_alarmEventFromAllPropertiesRow:;
+ (id)checkConstraints;
+ (id)databaseTable;
+ (id)insertOrReplaceAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateAllAlarmEventsWithTransaction:(void *)a3 predicate:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
- (id)alarmEventWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDAlarmEventEntity

+ (BOOL)enumerateAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = a6;
  id v12 = a4;
  v13 = [v10 predicateWithProperty:@"client_identifier" equalToValue:a3];
  LOBYTE(a5) = +[HDAlarmEventEntity _enumerateAllAlarmEventsWithTransaction:predicate:error:enumerationHandler:]((uint64_t)a1, v12, v13, (uint64_t)a5, v11);

  return (char)a5;
}

+ (uint64_t)_enumerateAllAlarmEventsWithTransaction:(void *)a3 predicate:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  id v11 = self;
  id v12 = [v10 databaseForEntityClass:v11];

  v13 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:v11 ascending:1];
  v23[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v15 = [v11 queryWithDatabase:v12 predicate:v9 limit:0 orderingTerms:v14 groupBy:0];

  v16 = HDAlarmEventEntityAllProperties();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__HDAlarmEventEntity__enumerateAllAlarmEventsWithTransaction_predicate_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E62F87F8;
  id v21 = v8;
  v22 = v11;
  id v17 = v8;
  uint64_t v18 = [v15 enumerateProperties:v16 error:a4 enumerationHandler:v20];

  return v18;
}

+ (BOOL)enumerateAllAlarmEventsWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return +[HDAlarmEventEntity _enumerateAllAlarmEventsWithTransaction:predicate:error:enumerationHandler:]((uint64_t)a1, a3, 0, (uint64_t)a4, a5);
}

uint64_t __97__HDAlarmEventEntity__enumerateAllAlarmEventsWithTransaction_predicate_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)_alarmEventFromAllPropertiesRow:
{
  self;
  v0 = HDSQLiteColumnWithNameAsString();
  v1 = HDSQLiteColumnWithNameAsString();
  v2 = HDSQLiteColumnWithNameAsDate();
  objc_opt_class();
  uint64_t v3 = HDSQLiteColumnWithNameAsObject();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  id v5 = [[HDAlarmEvent alloc] _initWithClientIdentifier:v0 eventIdentifier:v1 dueDate:v2 dueDateComponents:v3 eventOptions:v4 clientOptions:HDSQLiteColumnWithNameAsInt64()];

  return v5;
}

+ (id)insertOrReplaceAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  id v10 = HDAlarmEventEntityAllProperties();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HDAlarmEventEntity_insertOrReplaceAlarmEvent_transaction_error___block_invoke;
  v14[3] = &unk_1E62F35C8;
  id v15 = v8;
  id v11 = v8;
  id v12 = [a1 insertOrReplaceEntity:1 database:v9 properties:v10 error:a5 bindingHandler:v14];

  return v12;
}

void __66__HDAlarmEventEntity_insertOrReplaceAlarmEvent_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) clientIdentifier];
  MEMORY[0x1C1879EC0](a2, @"client_identifier", v4);

  id v5 = [*(id *)(a1 + 32) eventIdentifier];
  MEMORY[0x1C1879EC0](a2, @"event_identifier", v5);

  v6 = [*(id *)(a1 + 32) dueDate];
  MEMORY[0x1C1879E40](a2, @"due_date", v6);

  v7 = [*(id *)(a1 + 32) dueDateComponents];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C1879E80](a2, @"event_options", [*(id *)(a1 + 32) eventOptions]);
  [*(id *)(a1 + 32) clientOptions];

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)insertOrReplaceAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(a1, "insertOrReplaceAlarmEvent:transaction:error:", *(void *)(*((void *)&v18 + 1) + 8 * i), v9, a5, (void)v18);

        if (!v15)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

+ (BOOL)deleteAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 clientIdentifier];
  uint64_t v12 = [v8 predicateWithProperty:@"client_identifier" equalToValue:v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F65D00];
  v14 = [v10 eventIdentifier];

  id v15 = [v13 predicateWithProperty:@"event_identifier" equalToValue:v14];

  BOOL v16 = (void *)MEMORY[0x1E4F65D08];
  v21[0] = v12;
  v21[1] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  long long v18 = [v16 predicateMatchingAllPredicates:v17];

  long long v19 = [v9 databaseForEntityClass:a1];

  LOBYTE(a5) = [a1 deleteEntitiesInDatabase:v19 predicate:v18 error:a5];
  return (char)a5;
}

+ (BOOL)deleteAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!objc_msgSend(a1, "deleteAlarmEvent:transaction:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), v9, a5, (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 enumerationHandler:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [a4 databaseForEntityClass:a1];
  uint64_t v13 = NSString;
  v14 = [a1 disambiguatedDatabaseTable];
  BOOL v15 = [v13 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? RETURNING *", v14, @"client_identifier"];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke;
  v22[3] = &unk_1E62F43C8;
  id v23 = v10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke_2;
  v19[3] = &unk_1E62F8820;
  id v20 = v11;
  id v21 = a1;
  id v16 = v11;
  id v17 = v10;
  LOBYTE(a6) = [v12 executeSQL:v15 error:a6 bindingHandler:v22 enumerationHandler:v19];

  return (char)a6;
}

uint64_t __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke_2(uint64_t a1)
{
  v2 = +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = [v8 predicateWithProperty:@"client_identifier" equalToValue:a3];
  id v11 = [v9 databaseForEntityClass:a1];

  LOBYTE(a5) = [a1 deleteEntitiesInDatabase:v11 predicate:v10 error:a5];
  return (char)a5;
}

- (id)alarmEventWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__38;
  id v17 = __Block_byref_object_dispose__38;
  id v18 = 0;
  v7 = HDAlarmEventEntityAllProperties();
  id v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__HDAlarmEventEntity_alarmEventWithTransaction_error___block_invoke;
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

void __54__HDAlarmEventEntity_alarmEventWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return @"alarm_events";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_19;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"client_identifier";
  v4[1] = @"event_identifier";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)checkConstraints
{
  uint64_t v2 = [MEMORY[0x1E4F65D70] checkConstraintWithSQL:@"(due_date IS NULL AND due_date_components IS NOT NULL) OR (due_date IS NOT NULL AND due_date_components IS NULL)"];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];

  return v3;
}

@end