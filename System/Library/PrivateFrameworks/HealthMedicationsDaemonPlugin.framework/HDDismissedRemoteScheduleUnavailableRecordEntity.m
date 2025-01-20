@interface HDDismissedRemoteScheduleUnavailableRecordEntity
+ (BOOL)_insertRemoteScheduleUnavailableRecord:(void *)a3 transaction:(uint64_t)a4 error:;
+ (BOOL)enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertDismissedRemoteScheduleUnavailableRecords:(id)a3 profile:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_propertiesForEntity;
+ (id)databaseTable;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDDismissedRemoteScheduleUnavailableRecordEntity

+ (id)databaseTable
{
  return @"medication_dismissed_remote_schedule_unavailable_records";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__HDDismissedRemoteScheduleUnavailableRecordEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"medication_identifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (BOOL)enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [a4 databaseForEntityClass:a1];
  v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v14 = +[HDDismissedRemoteScheduleUnavailableRecordEntity _propertiesForEntity]();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __160__HDDismissedRemoteScheduleUnavailableRecordEntity_enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6337AB8;
  id v18 = v10;
  id v15 = v10;
  LOBYTE(a5) = [v13 enumerateProperties:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

+ (id)_propertiesForEntity
{
  v2[5] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"medication_identifier";
  v2[1] = @"schedule_type";
  v2[2] = @"schedule_compatibility_version";
  v2[3] = @"device_identifiers";
  v2[4] = @"creation_date";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  return v0;
}

uint64_t __160__HDDismissedRemoteScheduleUnavailableRecordEntity_enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = HDSQLiteColumnWithNameAsString();
  v6 = HDSQLiteColumnWithNameAsDate();
  v7 = [v5 componentsSeparatedByString:*MEMORY[0x1E4F66BC8]];
  v8 = objc_msgSend(v7, "hk_map:", &__block_literal_global_10);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F66AB0]) _initWithMedicationIdentifier:v2 scheduleType:v3 scheduleCompatibilityVersion:v4 deviceIdentifiers:v8 creationDate:v6];
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v10;
}

id __160__HDDismissedRemoteScheduleUnavailableRecordEntity_enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

+ (BOOL)insertDismissedRemoteScheduleUnavailableRecords:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[HDDismissedRemoteScheduleUnavailableRecordInsertOperation alloc] initWithRemoteScheduleUnavailableRecords:v8];

  LOBYTE(a5) = [(HDJournalableOperation *)v9 performOrJournalWithProfile:v7 error:a5];
  return (char)a5;
}

+ (BOOL)_insertRemoteScheduleUnavailableRecord:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = self;
  v9 = [v7 databaseForEntityClass:v8];

  uint64_t v10 = +[HDDismissedRemoteScheduleUnavailableRecordEntity _propertiesForEntity]();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__HDDismissedRemoteScheduleUnavailableRecordEntity__insertRemoteScheduleUnavailableRecord_transaction_error___block_invoke;
  v15[3] = &unk_1E6337AE0;
  id v16 = v6;
  id v11 = v6;
  v12 = [v8 insertOrReplaceEntity:1 database:v9 properties:v10 error:a4 bindingHandler:v15];
  BOOL v13 = v12 != 0;

  return v13;
}

void __109__HDDismissedRemoteScheduleUnavailableRecordEntity__insertRemoteScheduleUnavailableRecord_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) medicationIdentifier];
  MEMORY[0x1C187CE60](a2, @"medication_identifier", v4);

  MEMORY[0x1C187CE20](a2, @"schedule_type", [*(id *)(a1 + 32) scheduleType]);
  MEMORY[0x1C187CE20](a2, @"schedule_compatibility_version", [*(id *)(a1 + 32) scheduleCompatibilityVersion]);
  v5 = [*(id *)(a1 + 32) deviceIdentifiersDatabaseString];
  MEMORY[0x1C187CE60](a2, @"device_identifiers", v5);

  id v6 = [*(id *)(a1 + 32) creationDate];
  MEMORY[0x1C187CDF0](a2, @"creation_date", v6);
}

@end