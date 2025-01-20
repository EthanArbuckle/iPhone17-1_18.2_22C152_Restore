@interface _HDSignedClinicalDataRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDSignedClinicalDataRecordEntityEncoder

- (id)orderedProperties
{
  v8[10] = *MEMORY[0x1E4F143B8];
  v8[0] = @"credential_types";
  v8[1] = @"issuer_identifier";
  v8[2] = @"issued_date";
  v8[3] = @"relevant_date";
  v8[4] = @"expiration_date";
  v8[5] = @"signature_status";
  v8[6] = @"subject";
  v8[7] = @"items";
  v8[8] = @"data_value";
  v8[9] = @"source_type";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B510]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v27 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setCredentialTypes:v27];
    v16 = HDSQLiteColumnWithNameAsString();
    [v10 _setIssuerIdentifier:v16];
    v17 = HDSQLiteColumnWithNameAsDate();
    [v10 _setIssuedDate:v17];
    v18 = HDSQLiteColumnWithNameAsDate();
    [v10 _setRelevantDate:v18];
    v19 = HDSQLiteColumnWithNameAsDate();
    [v10 _setExpirationDate:v19];
    [v10 _setSignatureStatus:HDSQLiteColumnWithNameAsInt64()];
    objc_opt_class();
    v20 = HDSQLiteColumnWithNameAsObject();
    [v10 _setSubject:v20];
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setItems:v24];
    v25 = HDSQLiteColumnWithNameAsData();
    [v10 _setDataValue:v25];
    [v10 _setSourceType:HDSQLiteColumnWithNameAsInt64()];
  }
  return v12;
}

@end