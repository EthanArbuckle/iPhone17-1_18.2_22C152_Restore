@interface _HDDiagnosticTestResultEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDDiagnosticTestResultEntityEncoder

- (id)orderedProperties
{
  v8[15] = *MEMORY[0x1E4F143B8];
  v8[0] = @"diagnostic_test_coding_collection";
  v8[1] = @"value";
  v8[2] = @"reference_ranges";
  v8[3] = @"effective_start_date";
  v8[4] = @"category";
  v8[5] = @"categories_coding_collections";
  v8[6] = @"issue_date";
  v8[7] = @"effective_end_date";
  v8[8] = @"status_coding";
  v8[9] = @"interpretation_coding_collections";
  v8[10] = @"comments";
  v8[11] = @"body_site_coding_collection";
  v8[12] = @"method_coding_collection";
  v8[13] = @"performers";
  v8[14] = @"reference_range_status";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:15];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AF58]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a6) = [v10 applyPropertiesToObject:v9 persistentID:a4 row:a5 error:a6];

  if (a6)
  {
    char v38 = (char)a6;
    objc_opt_class();
    v37 = HDSQLiteColumnWithNameAsObject();
    [v9 _setDiagnosticTestCodingCollection:v37];
    objc_opt_class();
    v36 = HDSQLiteColumnWithNameAsObject();
    [v9 _setValue:v36];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v35 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v9 _setReferenceRanges:v35];
    objc_opt_class();
    v34 = HDSQLiteColumnWithNameAsObject();
    [v9 _setEffectiveStartDate:v34];
    v33 = HDSQLiteColumnWithNameAsString();
    [v9 _setCategory:v33];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v32 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v9 _setCategoriesCodingCollections:v32];
    objc_opt_class();
    v31 = HDSQLiteColumnWithNameAsObject();
    [v9 _setIssueDate:v31];
    objc_opt_class();
    v18 = HDSQLiteColumnWithNameAsObject();
    [v9 _setEffectiveEndDate:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v9 _setStatusCoding:v19];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v9 _setInterpretationCodingCollections:v23];
    v24 = HDSQLiteColumnWithNameAsString();
    [v9 _setComments:v24];
    objc_opt_class();
    v25 = HDSQLiteColumnWithNameAsObject();
    [v9 _setBodySiteCodingCollection:v25];
    objc_opt_class();
    v26 = HDSQLiteColumnWithNameAsObject();
    [v9 _setMethodCodingCollection:v26];
    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
    v29 = HDSQLiteColumnWithNameAsObjectWithClasses();

    LOBYTE(a6) = v38;
    [v9 _setPerformers:v29];
    [v9 _setReferenceRangeStatus:HDSQLiteColumnWithNameAsInt64()];
  }
  return (char)a6;
}

@end