@interface _HDDiagnosticTestReportEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDDiagnosticTestReportEntityEncoder

- (id)orderedProperties
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"diagnostic_test_coding_collection";
  v8[1] = @"results";
  v8[2] = @"effective_start_date";
  v8[3] = @"status_coding";
  v8[4] = @"effective_end_date";
  v8[5] = @"issue_date";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:6];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AF48]) _init];

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
    v13 = HDSQLiteColumnWithNameAsObject();
    [v10 _setDiagnosticTestCodingCollection:v13];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v17 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setResults:v17];
    objc_opt_class();
    v18 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEffectiveStartDate:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v19];
    objc_opt_class();
    v20 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEffectiveEndDate:v20];
    objc_opt_class();
    v21 = HDSQLiteColumnWithNameAsObject();
    [v10 _setIssueDate:v21];
  }
  return v12;
}

@end