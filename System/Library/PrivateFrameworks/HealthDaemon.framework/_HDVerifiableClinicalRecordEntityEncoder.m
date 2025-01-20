@interface _HDVerifiableClinicalRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDVerifiableClinicalRecordEntityEncoder

- (id)orderedProperties
{
  v8[10] = *MEMORY[0x1E4F143B8];
  v8[0] = @"record_types";
  v8[1] = @"issued_date";
  v8[2] = @"relevant_date";
  v8[3] = @"expiration_date";
  v8[4] = @"issuer_identifier";
  v8[5] = @"subject";
  v8[6] = @"item_names";
  v8[7] = @"jws_representation";
  v8[8] = @"origin_identifier";
  v8[9] = @"source_type";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B6E0]) _init];

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
    v28 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setRecordTypes:v28];
    v27 = HDSQLiteColumnWithNameAsDate();
    [v10 _setIssuedDate:v27];
    v16 = HDSQLiteColumnWithNameAsDate();
    [v10 _setRelevantDate:v16];
    v17 = HDSQLiteColumnWithNameAsDate();
    [v10 _setExpirationDate:v17];
    v18 = HDSQLiteColumnWithNameAsString();
    [v10 _setIssuerIdentifier:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setSubject:v19];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setItemNames:v23];
    v24 = HDSQLiteColumnWithNameAsData();
    [v10 _setDataRepresentation:v24];
    v25 = HDSQLiteColumnWithNameAsUUID();
    [v10 _setOriginIdentifier:v25];
    [v10 _setSourceType:HDSQLiteColumnWithNameAsInt64()];
  }
  return v12;
}

@end