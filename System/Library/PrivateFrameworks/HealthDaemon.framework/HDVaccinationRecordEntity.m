@interface HDVaccinationRecordEntity
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDVaccinationRecordEntity

+ (id)databaseTable
{
  return @"vaccination_record_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 16;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_71;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[16] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDVaccinationRecordEntity.m", 81, @"Subclasses must override %s", "+[HDVaccinationRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"vaccination_codings";
  v27[2] = @"expiration_date";
  v27[3] = @"dose_number";
  v27[4] = @"dose_quantity";
  v27[5] = @"lot_number";
  v27[6] = @"performer";
  v27[7] = @"body_site_codings";
  v27[8] = @"reaction";
  v27[9] = @"not_given";
  v27[10] = @"administration_date";
  v27[11] = @"status_coding";
  v27[12] = @"patient_reported";
  v27[13] = @"route_codings";
  v27[14] = @"reasons_codings";
  v27[15] = @"reasons_not_given_codings";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:16];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__HDVaccinationRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __91__HDVaccinationRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) vaccinationCodings];
  HDSQLiteBindSecureCodingObjectToProperty();

  v5 = [*(id *)(a1 + 40) expirationDate];
  HDSQLiteBindSecureCodingObjectToProperty();

  v6 = [*(id *)(a1 + 40) doseNumber];
  MEMORY[0x1C1879EC0](a2, @"dose_number", v6);

  v7 = [*(id *)(a1 + 40) doseQuantity];
  MEMORY[0x1C1879EC0](a2, @"dose_quantity", v7);

  v8 = [*(id *)(a1 + 40) lotNumber];
  MEMORY[0x1C1879EC0](a2, @"lot_number", v8);

  v9 = [*(id *)(a1 + 40) performer];
  MEMORY[0x1C1879EC0](a2, @"performer", v9);

  v10 = [*(id *)(a1 + 40) bodySiteCodings];
  HDSQLiteBindSecureCodingObjectToProperty();

  v11 = [*(id *)(a1 + 40) reaction];
  MEMORY[0x1C1879EC0](a2, @"reaction", v11);

  MEMORY[0x1C1879E20](a2, @"not_given", [*(id *)(a1 + 40) notGiven]);
  id v12 = [*(id *)(a1 + 40) administrationDate];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v13 = [*(id *)(a1 + 40) statusCoding];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C1879E20](a2, @"patient_reported", [*(id *)(a1 + 40) patientReported]);
  id v14 = [*(id *)(a1 + 40) routeCodings];
  HDSQLiteBindSecureCodingObjectToProperty();

  v15 = [*(id *)(a1 + 40) reasonsCodings];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v16 = [*(id *)(a1 + 40) reasonsNotGivenCodings];
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
  v15 = [(_HDMedicalRecordEntityEncoder *)[_HDVaccinationRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end