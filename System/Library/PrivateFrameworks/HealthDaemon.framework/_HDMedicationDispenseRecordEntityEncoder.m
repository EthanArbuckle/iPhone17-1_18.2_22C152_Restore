@interface _HDMedicationDispenseRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDMedicationDispenseRecordEntityEncoder

- (id)orderedProperties
{
  v8[8] = *MEMORY[0x1E4F143B8];
  v8[0] = @"medication_codings";
  v8[1] = @"quantity_dispensed";
  v8[2] = @"preparation_date";
  v8[3] = @"hand_over_date";
  v8[4] = @"dosages";
  v8[5] = @"earliest_dosage_date";
  v8[6] = @"status_coding";
  v8[7] = @"days_supply_quantity";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B1D0]) _init];

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
    v16 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setMedicationCodings:v16];
    objc_opt_class();
    v17 = HDSQLiteColumnWithNameAsObject();
    [v10 _setQuantityDispensed:v17];
    objc_opt_class();
    v18 = HDSQLiteColumnWithNameAsObject();
    [v10 _setPreparationDate:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setHandOverDate:v19];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setDosages:v23];
    objc_opt_class();
    v24 = HDSQLiteColumnWithNameAsObject();
    [v10 _setEarliestDosageDate:v24];
    objc_opt_class();
    v25 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v25];
    objc_opt_class();
    v26 = HDSQLiteColumnWithNameAsObject();
    [v10 _setDaysSupplyQuantity:v26];
  }
  return v12;
}

@end