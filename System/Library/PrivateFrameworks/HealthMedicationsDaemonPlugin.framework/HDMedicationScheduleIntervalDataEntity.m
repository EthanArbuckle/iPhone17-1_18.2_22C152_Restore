@interface HDMedicationScheduleIntervalDataEntity
+ (BOOL)addIntervalDataToCodable:(id)a3 withScheduleID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateMedicationScheduleIntervalDataWithOwnerID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_codableRepresentationForMedicationScheduleIntervalData:(id)a3;
+ (id)_medicationScheduleIntervalDataEntityPropertiesForModel;
+ (id)_medicationScheduleIntervalDataFromRow:(HDSQLiteRow *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertPersistableMedicationScheduleIntervalData:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
@end

@implementation HDMedicationScheduleIntervalDataEntity

+ (int64_t)protectionClass
{
  return 2;
}

uint64_t __130__HDMedicationScheduleIntervalDataEntity_enumerateMedicationScheduleIntervalDataWithOwnerID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 40), "_medicationScheduleIntervalDataFromRow:");
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (id)_medicationScheduleIntervalDataFromRow:(HDSQLiteRow *)a3
{
  objc_opt_class();
  uint64_t v3 = HDSQLiteColumnWithNameAsObject();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = HDSQLiteColumnWithNameAsNumber();
  v6 = HDSQLiteColumnWithNameAsNumber();
  v7 = HDSQLiteColumnWithNameAsNumber();
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F66B48]) initWithStartTimeComponent:v3 daysOfWeek:v4 cycleIndex:v5 cycleIntervalDays:v6 dose:v7];

  return v8;
}

+ (BOOL)enumerateMedicationScheduleIntervalDataWithOwnerID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = (void *)MEMORY[0x1E4F65D00];
  v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = a4;
  v14 = [v12 numberWithLongLong:a3];
  v15 = [v11 predicateWithProperty:@"schedule_id" equalToValue:v14];

  v16 = [v13 databaseForEntityClass:a1];

  v17 = [a1 queryWithDatabase:v16 predicate:v15];

  v24[0] = @"schedule_id";
  v24[1] = @"start_time_components";
  v24[2] = @"day_of_week";
  v24[3] = @"cycle_index";
  v24[4] = @"cycle_interval_days";
  v24[5] = @"dose";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:6];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __130__HDMedicationScheduleIntervalDataEntity_enumerateMedicationScheduleIntervalDataWithOwnerID_transaction_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6338898;
  id v22 = v10;
  id v23 = a1;
  id v19 = v10;
  LOBYTE(a5) = [v17 enumerateProperties:v18 error:a5 enumerationHandler:v21];

  return (char)a5;
}

+ (id)_medicationScheduleIntervalDataEntityPropertiesForModel
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"schedule_id";
  v4[1] = @"start_time_components";
  v4[2] = @"day_of_week";
  v4[3] = @"cycle_index";
  v4[4] = @"cycle_interval_days";
  v4[5] = @"dose";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

+ (id)databaseTable
{
  return @"medication_schedule_interval_data";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_2;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"schedule_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)insertPersistableMedicationScheduleIntervalData:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [a1 _medicationScheduleIntervalDataEntityPropertiesForModel];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__HDMedicationScheduleIntervalDataEntity_insertPersistableMedicationScheduleIntervalData_ownerID_database_error___block_invoke;
  v18[3] = &unk_1E63388C0;
  id v19 = v11;
  id v20 = v10;
  id v14 = v10;
  id v15 = v11;
  v16 = [a1 insertOrReplaceEntity:0 database:v12 properties:v13 error:a6 bindingHandler:v18];

  return v16;
}

void __113__HDMedicationScheduleIntervalDataEntity_insertPersistableMedicationScheduleIntervalData_ownerID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C187CE40](a2, @"schedule_id", *(void *)(a1 + 32));
  uint64_t v4 = [*(id *)(a1 + 40) startTimeComponent];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C187CE20](a2, @"day_of_week", [*(id *)(a1 + 40) daysOfWeek]);
  v5 = [*(id *)(a1 + 40) cycleIndex];
  id v10 = v5;
  if (v5) {
    MEMORY[0x1C187CE00](a2, @"cycle_index", (double)[v5 integerValue]);
  }
  else {
    MEMORY[0x1C187CE30](a2, @"cycle_index");
  }
  v6 = [*(id *)(a1 + 40) cycleIntervalDays];
  v7 = v6;
  if (v6) {
    MEMORY[0x1C187CE00](a2, @"cycle_interval_days", (double)[v6 integerValue]);
  }
  else {
    MEMORY[0x1C187CE30](a2, @"cycle_interval_days");
  }
  v8 = [*(id *)(a1 + 40) dose];
  v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    MEMORY[0x1C187CE00](a2, @"dose");
  }
  else
  {
    MEMORY[0x1C187CE30](a2, @"dose");
  }
}

+ (BOOL)addIntervalDataToCodable:(id)a3 withScheduleID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__HDMedicationScheduleIntervalDataEntity_addIntervalDataToCodable_withScheduleID_transaction_error___block_invoke;
  v13[3] = &unk_1E63388E8;
  id v14 = v10;
  id v15 = a1;
  id v11 = v10;
  LOBYTE(a6) = [a1 enumerateMedicationScheduleIntervalDataWithOwnerID:a4 transaction:a5 error:a6 enumerationHandler:v13];

  return (char)a6;
}

uint64_t __100__HDMedicationScheduleIntervalDataEntity_addIntervalDataToCodable_withScheduleID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _codableRepresentationForMedicationScheduleIntervalData:a2];
  [v2 addIntervalData:v3];

  return 1;
}

+ (id)_codableRepresentationForMedicationScheduleIntervalData:(id)a3
{
  return (id)objc_msgSend(a3, "hd_codableFromIntervalData");
}

@end