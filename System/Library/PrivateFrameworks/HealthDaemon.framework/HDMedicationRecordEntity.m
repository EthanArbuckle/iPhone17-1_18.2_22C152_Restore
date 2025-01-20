@interface HDMedicationRecordEntity
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDMedicationRecordEntity

+ (id)databaseTable
{
  return @"medication_record_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_14;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[13] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDMedicationRecordEntity.m", 75, @"Subclasses must override %s", "+[HDMedicationRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"medication_coding_collection";
  v27[2] = @"assertion_type";
  v27[3] = @"asserter";
  v27[4] = @"assertion_date";
  v27[5] = @"status_coding";
  v27[6] = @"dosages";
  v27[7] = @"earliest_dosage_date";
  v27[8] = @"reason_for_use_coding_collections";
  v27[9] = @"not_taken";
  v27[10] = @"reasons_not_taken_coding_collections";
  v27[11] = @"effective_start_date";
  v27[12] = @"effective_end_date";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:13];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__HDMedicationRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E62F3A88;
  id v25 = v13;
  id v26 = v12;
  id v17 = v12;
  id v18 = v13;
  v19 = [a1 insertOrReplaceEntity:1 database:v14 properties:v16 error:a7 bindingHandler:v24];

  if (v19) {
    v20 = v18;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __90__HDMedicationRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) medicationCodingCollection];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C1879E80](a2, @"assertion_type", [*(id *)(a1 + 40) assertionType]);
  v5 = [*(id *)(a1 + 40) asserter];
  MEMORY[0x1C1879EC0](a2, @"asserter", v5);

  v6 = [*(id *)(a1 + 40) assertionDate];
  HDSQLiteBindSecureCodingObjectToProperty();

  v7 = [*(id *)(a1 + 40) statusCoding];
  HDSQLiteBindSecureCodingObjectToProperty();

  v8 = [*(id *)(a1 + 40) dosages];
  HDSQLiteBindSecureCodingObjectToProperty();

  v9 = [*(id *)(a1 + 40) earliestDosageDate];
  HDSQLiteBindSecureCodingObjectToProperty();

  v10 = [*(id *)(a1 + 40) reasonForUseCodingCollections];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C1879E20](a2, @"not_taken", [*(id *)(a1 + 40) notTaken]);
  v11 = [*(id *)(a1 + 40) reasonsNotTakenCodingCollections];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v12 = [*(id *)(a1 + 40) effectiveStartDate];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v13 = [*(id *)(a1 + 40) effectiveEndDate];
  HDSQLiteBindSecureCodingObjectToProperty();
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(_HDMedicalRecordEntityEncoder *)[_HDMedicationRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end