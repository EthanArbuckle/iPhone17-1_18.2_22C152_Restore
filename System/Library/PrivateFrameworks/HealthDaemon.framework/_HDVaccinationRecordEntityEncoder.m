@interface _HDVaccinationRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDVaccinationRecordEntityEncoder

- (id)orderedProperties
{
  v8[15] = *MEMORY[0x1E4F143B8];
  v8[0] = @"vaccination_codings";
  v8[1] = @"expiration_date";
  v8[2] = @"dose_number";
  v8[3] = @"dose_quantity";
  v8[4] = @"lot_number";
  v8[5] = @"performer";
  v8[6] = @"body_site_codings";
  v8[7] = @"reaction";
  v8[8] = @"not_given";
  v8[9] = @"administration_date";
  v8[10] = @"status_coding";
  v8[11] = @"patient_reported";
  v8[12] = @"route_codings";
  v8[13] = @"reasons_codings";
  v8[14] = @"reasons_not_given_codings";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:15];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B6B0]) _init];

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
    v41 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setVaccinationCodings:v41];
    objc_opt_class();
    v40 = HDSQLiteColumnWithNameAsObject();
    [v10 _setExpirationDate:v40];
    v39 = HDSQLiteColumnWithNameAsString();
    [v10 _setDoseNumber:v39];
    v38 = HDSQLiteColumnWithNameAsString();
    [v10 _setDoseQuantity:v38];
    v37 = HDSQLiteColumnWithNameAsString();
    [v10 _setLotNumber:v37];
    v36 = HDSQLiteColumnWithNameAsString();
    [v10 _setPerformer:v36];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v35 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setBodySiteCodings:v35];
    v34 = HDSQLiteColumnWithNameAsString();
    [v10 _setReaction:v34];
    [v10 _setNotGiven:HDSQLiteColumnWithNameAsBoolean()];
    objc_opt_class();
    v33 = HDSQLiteColumnWithNameAsObject();
    [v10 _setAdministrationDate:v33];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v19];
    [v10 _setPatientReported:HDSQLiteColumnWithNameAsBoolean()];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setRouteCodings:v23];
    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v27 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonsCodings:v27];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v31 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonsNotGivenCodings:v31];
  }

  return v12;
}

@end