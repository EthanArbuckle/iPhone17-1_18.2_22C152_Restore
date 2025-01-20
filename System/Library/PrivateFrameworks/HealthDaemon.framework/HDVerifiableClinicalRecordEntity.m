@interface HDVerifiableClinicalRecordEntity
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDVerifiableClinicalRecordEntity

+ (id)databaseTable
{
  return @"verifiable_clinical_record_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_41;
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
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDVerifiableClinicalRecordEntity.m", 67, @"Subclasses must override %s", "+[HDVerifiableClinicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"record_types";
  v27[2] = @"issued_date";
  v27[3] = @"relevant_date";
  v27[4] = @"expiration_date";
  v27[5] = @"issuer_identifier";
  v27[6] = @"subject";
  v27[7] = @"item_names";
  v27[8] = @"jws_representation";
  v27[9] = @"origin_identifier";
  v27[10] = @"source_type";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:11];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__HDVerifiableClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __98__HDVerifiableClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) recordTypes];
  HDSQLiteBindSecureCodingObjectToProperty();

  v5 = [*(id *)(a1 + 40) issuedDate];
  MEMORY[0x1C1879E40](a2, @"issued_date", v5);

  v6 = [*(id *)(a1 + 40) relevantDate];
  MEMORY[0x1C1879E40](a2, @"relevant_date", v6);

  v7 = [*(id *)(a1 + 40) expirationDate];
  MEMORY[0x1C1879E40](a2, @"expiration_date", v7);

  v8 = [*(id *)(a1 + 40) issuerIdentifier];
  MEMORY[0x1C1879EC0](a2, @"issuer_identifier", v8);

  v9 = [*(id *)(a1 + 40) subject];
  HDSQLiteBindSecureCodingObjectToProperty();

  v10 = [*(id *)(a1 + 40) itemNames];
  HDSQLiteBindSecureCodingObjectToProperty();

  v11 = [*(id *)(a1 + 40) dataRepresentation];
  MEMORY[0x1C1879E30](a2, @"jws_representation", v11);

  id v12 = [*(id *)(a1 + 40) originIdentifier];
  MEMORY[0x1C1879EF0](a2, @"origin_identifier", v12);

  id v13 = (void *)MEMORY[0x1E4F2B6E0];
  id v14 = [*(id *)(a1 + 40) sourceType];
  MEMORY[0x1C1879E80](a2, @"source_type", [v13 _privateSourceTypeForExternalType:v14]);
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
  v15 = [(HDEntityEncoder *)[_HDVerifiableClinicalRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end