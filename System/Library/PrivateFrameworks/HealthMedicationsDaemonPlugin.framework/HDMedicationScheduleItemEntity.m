@interface HDMedicationScheduleItemEntity
+ (BOOL)deleteMedicationScheduleItemsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)enumerateItemsWithPredicate:(id)a3 orderingTerms:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)updateNotification:(BOOL)a3 itemIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)insertMedicationScheduleItem:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)medicationScheduleItemEntityPropertiesForModel;
+ (id)medicationScheduleItemFromRow:error:;
+ (id)medicationScheduleItemWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDMedicationScheduleItemEntity

+ (id)medicationScheduleItemEntityPropertiesForModel
{
  v2[4] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"identifier";
  v2[1] = @"scheduled_date_time";
  v2[2] = @"notification_sent";
  v2[3] = @"doses";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  return v0;
}

+ (id)medicationScheduleItemFromRow:error:
{
  self;
  v0 = HDSQLiteColumnWithNameAsDate();
  uint64_t v1 = HDSQLiteColumnWithNameAsBoolean();
  objc_opt_class();
  v2 = HDSQLiteColumnWithNameAsArrayOfClass();
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F66B50]) initWithScheduledDateTime:v0 notificationSent:v1 doses:v2];

  return v3;
}

+ (id)medicationScheduleItemWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  v10 = [v9 databaseForEntityClass:a1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_2;
  v16[3] = &unk_1E6337B30;
  id v11 = v8;
  id v17 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_3;
  v15[3] = &unk_1E6337B58;
  v15[4] = &v19;
  v15[5] = a1;
  LODWORD(a5) = [v10 executeCachedStatementForKey:&medicationScheduleItemWithIdentifier_transaction_error__lookupKey error:a5 SQLGenerator:v18 bindingHandler:v16 enumerationHandler:v15];

  if (a5) {
    v12 = (void *)v20[5];
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

id __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"identifier", @"scheduled_date_time", @"notification_sent", @"doses", v1, @"identifier", 0];

  return v2;
}

uint64_t __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = +[HDMedicationScheduleItemEntity medicationScheduleItemFromRow:error:]();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)enumerateItemsWithPredicate:(id)a3 orderingTerms:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  v15 = [a5 databaseForEntityClass:a1];
  v16 = [a1 queryWithDatabase:v15 predicate:v14 limit:0 orderingTerms:v13 groupBy:0];

  id v17 = +[HDMedicationScheduleItemEntity medicationScheduleItemEntityPropertiesForModel]();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __113__HDMedicationScheduleItemEntity_enumerateItemsWithPredicate_orderingTerms_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6337B80;
  id v21 = v12;
  id v22 = a1;
  id v18 = v12;
  LOBYTE(a6) = [v16 enumeratePersistentIDsAndProperties:v17 error:a6 enumerationHandler:v20];

  return (char)a6;
}

uint64_t __113__HDMedicationScheduleItemEntity_enumerateItemsWithPredicate_orderingTerms_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HDMedicationScheduleItemEntity medicationScheduleItemFromRow:error:]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)insertMedicationScheduleItem:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  v10 = +[HDMedicationScheduleItemEntity medicationScheduleItemEntityPropertiesForModel]();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__HDMedicationScheduleItemEntity_insertMedicationScheduleItem_transaction_error___block_invoke;
  v14[3] = &unk_1E6337AE0;
  id v15 = v8;
  id v11 = v8;
  id v12 = [a1 insertOrReplaceEntity:1 database:v9 properties:v10 error:a5 bindingHandler:v14];

  return v12;
}

void __81__HDMedicationScheduleItemEntity_insertMedicationScheduleItem_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) identifier];
  MEMORY[0x1C187CE60](a2, @"identifier", v4);

  v5 = [*(id *)(a1 + 32) scheduledDateTime];
  MEMORY[0x1C187CDF0](a2, @"scheduled_date_time", v5);

  MEMORY[0x1C187CDE0](a2, @"notification_sent", [*(id *)(a1 + 32) notificationSent]);
  id v6 = [*(id *)(a1 + 32) doses];
  HDSQLiteBindSecureCodingObjectToProperty();
}

+ (BOOL)updateNotification:(BOOL)a3 itemIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = a5;
  id v12 = [v10 predicateWithProperty:@"identifier" equalToValue:a4];
  v18[0] = @"notification_sent";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v14 = [v11 databaseForEntityClass:objc_opt_class()];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HDMedicationScheduleItemEntity_updateNotification_itemIdentifier_transaction_error___block_invoke;
  v16[3] = &__block_descriptor_33_e34_v16__0__HDSQLiteStatementBinder__8l;
  BOOL v17 = a3;
  LOBYTE(a6) = [a1 updateProperties:v13 predicate:v12 database:v14 error:a6 bindingHandler:v16];

  return (char)a6;
}

void __86__HDMedicationScheduleItemEntity_updateNotification_itemIdentifier_transaction_error___block_invoke()
{
}

+ (BOOL)deleteMedicationScheduleItemsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 databaseForEntityClass:a1];
  LOBYTE(a5) = [a1 deleteEntitiesInDatabase:v9 predicate:v8 error:a5];

  return (char)a5;
}

+ (id)databaseTable
{
  return @"medication_schedule_items";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end