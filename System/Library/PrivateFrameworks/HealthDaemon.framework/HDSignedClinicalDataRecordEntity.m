@interface HDSignedClinicalDataRecordEntity
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDSignedClinicalDataRecordEntity

+ (id)databaseTable
{
  return @"signed_clinical_data_record_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_25;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[11] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDSignedClinicalDataRecordEntity.m", 71, @"Subclasses must override %s", "+[HDSignedClinicalDataRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"credential_types";
  v27[2] = @"issuer_identifier";
  v27[3] = @"issued_date";
  v27[4] = @"relevant_date";
  v27[5] = @"expiration_date";
  v27[6] = @"signature_status";
  v27[7] = @"subject";
  v27[8] = @"items";
  v27[9] = @"data_value";
  v27[10] = @"source_type";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__HDSignedClinicalDataRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __98__HDSignedClinicalDataRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) credentialTypes];
  HDSQLiteBindSecureCodingObjectToProperty();

  v5 = [*(id *)(a1 + 40) issuerIdentifier];
  MEMORY[0x1C1879EC0](a2, @"issuer_identifier", v5);

  v6 = [*(id *)(a1 + 40) issuedDate];
  MEMORY[0x1C1879E40](a2, @"issued_date", v6);

  v7 = [*(id *)(a1 + 40) relevantDate];
  MEMORY[0x1C1879E40](a2, @"relevant_date", v7);

  v8 = [*(id *)(a1 + 40) expirationDate];
  MEMORY[0x1C1879E40](a2, @"expiration_date", v8);

  MEMORY[0x1C1879E80](a2, @"signature_status", [*(id *)(a1 + 40) signatureStatus]);
  v9 = [*(id *)(a1 + 40) subject];
  HDSQLiteBindSecureCodingObjectToProperty();

  v10 = [*(id *)(a1 + 40) items];
  HDSQLiteBindSecureCodingObjectToProperty();

  v11 = [*(id *)(a1 + 40) dataValue];
  MEMORY[0x1C1879E30](a2, @"data_value", v11);

  [*(id *)(a1 + 40) sourceType];

  JUMPOUT(0x1C1879E80);
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
  v15 = [(_HDMedicalRecordEntityEncoder *)[_HDSignedClinicalDataRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end