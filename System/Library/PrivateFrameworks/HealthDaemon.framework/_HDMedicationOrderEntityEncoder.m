@interface _HDMedicationOrderEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDMedicationOrderEntityEncoder

- (id)orderedProperties
{
  v8[11] = *MEMORY[0x1E4F143B8];
  v8[0] = @"medication_coding_collection";
  v8[1] = @"prescriber";
  v8[2] = @"number_of_fills";
  v8[3] = @"dosages";
  v8[4] = @"earliest_dosage_date";
  v8[5] = @"written_date";
  v8[6] = @"ended_date";
  v8[7] = @"status_coding";
  v8[8] = @"reason_coding_collections";
  v8[9] = @"reason_ended_coding_collection";
  v8[10] = @"status_reason_coding_collection";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:11];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B210]) _init];

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
    [v10 _setMedicationCodingCollection:v29];
    v28 = HDSQLiteColumnWithNameAsString();
    [v10 _setPrescriber:v28];
    [v10 _setNumberOfFills:HDSQLiteColumnWithNameAsInt64()];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v27 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setDosages:v27];
    objc_opt_class();
    v16 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEarliestDosageDate:v16];
    objc_opt_class();
    v17 = HDSQLiteColumnWithNameAsObject();
    [v10 _setWrittenDate:v17];
    objc_opt_class();
    v18 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEndedDate:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v19];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonCodingCollections:v23];
    objc_opt_class();
    v24 = HDSQLiteColumnWithNameAsObject();
    [v10 _setReasonEndedCodingCollection:v24];
    objc_opt_class();
    v25 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusReasonCodingCollection:v25];
  }
  return v12;
}

@end