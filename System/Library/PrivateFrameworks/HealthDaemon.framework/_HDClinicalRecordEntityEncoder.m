@interface _HDClinicalRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDClinicalRecordEntityEncoder

- (id)orderedProperties
{
  v8[11] = *MEMORY[0x1E4F143B8];
  v8[0] = @"display_name";
  v8[1] = @"fhir_resource_fhir_version_major";
  v8[2] = @"fhir_resource_fhir_version_minor";
  v8[3] = @"fhir_resource_fhir_version_patch";
  v8[4] = @"fhir_resource_resource_type";
  v8[5] = @"fhir_resource_identifier";
  v8[6] = @"fhir_resource_data";
  v8[7] = @"fhir_resource_source_url";
  v8[8] = @"fhir_resource_last_updated_date";
  v8[9] = @"original_fhir_resource_rowid";
  v8[10] = @"original_signed_clinical_data_rowid";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:11];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AD08]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = HDSQLiteColumnWithNameAsString();
    [v10 _setDisplayName:v13];
    if (HDSQLiteColumnWithNameIsNull())
    {
      v14 = 0;
    }
    else
    {
      v22[0] = HDSQLiteColumnWithNameAsInt64();
      v22[1] = HDSQLiteColumnWithNameAsInt64();
      v22[2] = HDSQLiteColumnWithNameAsInt64();
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F2AFE0]) initWithSemanticVersion:v22];
      v16 = HDSQLiteColumnWithNameAsString();
      v17 = HDSQLiteColumnWithNameAsString();
      v18 = HDSQLiteColumnWithNameAsData();
      v19 = HDSQLiteColumnWithNameAsURL();
      v20 = HDSQLiteColumnWithNameAsDate();
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F2AFD8]) initWithResourceType:v16 identifier:v17 FHIRVersion:v15 data:v18 sourceURL:v19 lastUpdatedDate:v20];
    }
    [v10 _setFHIRResource:v14];
  }
  return v12;
}

@end