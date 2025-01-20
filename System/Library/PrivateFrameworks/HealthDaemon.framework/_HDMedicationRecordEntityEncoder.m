@interface _HDMedicationRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDMedicationRecordEntityEncoder

- (id)orderedProperties
{
  v8[12] = *MEMORY[0x1E4F143B8];
  v8[0] = @"medication_coding_collection";
  v8[1] = @"assertion_type";
  v8[2] = @"asserter";
  v8[3] = @"assertion_date";
  v8[4] = @"status_coding";
  v8[5] = @"dosages";
  v8[6] = @"earliest_dosage_date";
  v8[7] = @"reason_for_use_coding_collections";
  v8[8] = @"not_taken";
  v8[9] = @"reasons_not_taken_coding_collections";
  v8[10] = @"effective_start_date";
  v8[11] = @"effective_end_date";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:12];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B220]) _init];

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
    v32 = HDSQLiteColumnWithNameAsObject();
    [v10 _setMedicationCodingCollection:v32];
    [v10 _setAssertionType:HDSQLiteColumnWithNameAsInt64()];
    v31 = HDSQLiteColumnWithNameAsString();
    [v10 _setAsserter:v31];
    objc_opt_class();
    v30 = HDSQLiteColumnWithNameAsObject();
    [v10 _setAssertionDate:v30];
    objc_opt_class();
    v29 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v29];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setDosages:v16];
    objc_opt_class();
    v17 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEarliestDosageDate:v17];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonForUseCodingCollections:v21];
    [v10 _setNotTaken:HDSQLiteColumnWithNameAsBoolean()];
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v25 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonsNotTakenCodingCollections:v25];
    objc_opt_class();
    v26 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEffectiveStartDate:v26];
    objc_opt_class();
    v27 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEffectiveEndDate:v27];
  }
  return v12;
}

@end