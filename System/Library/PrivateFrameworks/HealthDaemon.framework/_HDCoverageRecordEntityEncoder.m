@interface _HDCoverageRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDCoverageRecordEntityEncoder

- (id)orderedProperties
{
  v8[14] = *MEMORY[0x1E4F143B8];
  v8[0] = @"status_coding";
  v8[1] = @"coverage_type_coding_collection";
  v8[2] = @"subscriber";
  v8[3] = @"subscriber_id";
  v8[4] = @"beneficiary";
  v8[5] = @"policy_holder";
  v8[6] = @"payor";
  v8[7] = @"relationship_coding_collection";
  v8[8] = @"classification";
  v8[9] = @"network";
  v8[10] = @"period_start_date";
  v8[11] = @"period_end_date";
  v8[12] = @"subscriber_identifier";
  v8[13] = @"beneficiary_identifier";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:14];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AE80]) _init];

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
    v33 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v33];
    objc_opt_class();
    v32 = HDSQLiteColumnWithNameAsObject();
    [v10 _setCoverageTypeCodingCollection:v32];
    v31 = HDSQLiteColumnWithNameAsString();
    [v10 _setSubscriber:v31];
    v30 = HDSQLiteColumnWithNameAsString();
    [v10 _setSubscriberId:v30];
    v29 = HDSQLiteColumnWithNameAsString();
    [v10 _setBeneficiary:v29];
    v28 = HDSQLiteColumnWithNameAsString();
    [v10 _setPolicyHolder:v28];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v27 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setPayor:v27];
    objc_opt_class();
    v16 = HDSQLiteColumnWithNameAsObject();
    [v10 _setRelationshipCodingCollection:v16];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v20 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setClassification:v20];
    v21 = HDSQLiteColumnWithNameAsString();
    [v10 _setNetwork:v21];
    objc_opt_class();
    v22 = HDSQLiteColumnWithNameAsObject();
    [v10 _setPeriodStartDate:v22];
    objc_opt_class();
    v23 = HDSQLiteColumnWithNameAsObject();
    [v10 _setPeriodEndDate:v23];
    objc_opt_class();
    v24 = HDSQLiteColumnWithNameAsObject();
    [v10 _setSubscriberIdentifier:v24];
    objc_opt_class();
    v25 = HDSQLiteColumnWithNameAsObject();
    [v10 _setBeneficiaryIdentifier:v25];
  }
  return v12;
}

@end