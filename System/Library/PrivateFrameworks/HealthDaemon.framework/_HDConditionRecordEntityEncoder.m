@interface _HDConditionRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDConditionRecordEntityEncoder

- (id)orderedProperties
{
  v8[10] = *MEMORY[0x1E4F143B8];
  v8[0] = @"condition_coding_collection";
  v8[1] = @"categories_coding_collections";
  v8[2] = @"asserter";
  v8[3] = @"abatement";
  v8[4] = @"onset";
  v8[5] = @"recorded_date";
  v8[6] = @"clinical_status_coding";
  v8[7] = @"verification_status_coding";
  v8[8] = @"severity_coding_collection";
  v8[9] = @"body_sites_coding_collections";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AE20]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    objc_opt_class();
    v29 = HDSQLiteColumnWithNameAsObject();
    [v10 _setConditionCodingCollection:v29];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v28 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setCategoriesCodingCollections:v28];
    v27 = HDSQLiteColumnWithNameAsString();
    [v10 _setAsserter:v27];
    objc_opt_class();
    v26 = HDSQLiteColumnWithNameAsObject();
    [v10 _setAbatement:v26];
    objc_opt_class();
    v25 = HDSQLiteColumnWithNameAsObject();
    [v10 _setOnset:v25];
    objc_opt_class();
    v16 = HDSQLiteColumnWithNameAsObject();
    [v10 _setRecordedDate:v16];
    objc_opt_class();
    v17 = HDSQLiteColumnWithNameAsObject();
    [v10 _setClinicalStatusCoding:v17];
    objc_opt_class();
    v18 = HDSQLiteColumnWithNameAsObject();
    [v10 _setVerificationStatusCoding:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setSeverityCodingCollection:v19];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setBodySitesCodingCollections:v23];
  }

  return v12;
}

@end