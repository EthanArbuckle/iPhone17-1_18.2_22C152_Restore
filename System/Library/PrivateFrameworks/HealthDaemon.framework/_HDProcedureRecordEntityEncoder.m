@interface _HDProcedureRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDProcedureRecordEntityEncoder

- (id)orderedProperties
{
  v8[13] = *MEMORY[0x1E4F143B8];
  v8[0] = @"procedure_coding_collection";
  v8[1] = @"performers";
  v8[2] = @"execution_start_date";
  v8[3] = @"execution_end_date";
  v8[4] = @"not_performed";
  v8[5] = @"status_coding";
  v8[6] = @"category_coding_collection";
  v8[7] = @"reason_coding_collections";
  v8[8] = @"reasons_not_performed_coding_collections";
  v8[9] = @"outcome_coding_collection";
  v8[10] = @"complications_coding_collections";
  v8[11] = @"follow_ups_coding_collections";
  v8[12] = @"body_sites_coding_collections";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:13];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B340]) _init];

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
    v43 = HDSQLiteColumnWithNameAsObject();
    [v10 _setProcedureCodingCollection:v43];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v42 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setPerformers:v42];
    objc_opt_class();
    v41 = HDSQLiteColumnWithNameAsObject();
    [v10 _setExecutionStartDate:v41];
    objc_opt_class();
    v40 = HDSQLiteColumnWithNameAsObject();
    [v10 _setExecutionEndDate:v40];
    [v10 _setNotPerformed:HDSQLiteColumnWithNameAsBoolean()];
    objc_opt_class();
    v39 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v39];
    objc_opt_class();
    v38 = HDSQLiteColumnWithNameAsObject();
    [v10 _setCategoryCodingCollection:v38];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v37 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonCodingCollections:v37];
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v22 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setReasonsNotPerformedCodingCollections:v22];
    objc_opt_class();
    v23 = HDSQLiteColumnWithNameAsObject();
    [v10 _setOutcomeCodingCollection:v23];
    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v27 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setComplicationsCodingCollections:v27];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v31 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setFollowUpsCodingCollections:v31];
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v35 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setBodySitesCodingCollections:v35];
  }

  return v12;
}

@end