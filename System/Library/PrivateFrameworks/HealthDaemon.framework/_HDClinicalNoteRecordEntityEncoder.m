@interface _HDClinicalNoteRecordEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDClinicalNoteRecordEntityEncoder

- (id)orderedProperties
{
  v8[7] = *MEMORY[0x1E4F143B8];
  v8[0] = @"status_coding";
  v8[1] = @"document_type_coding_collection";
  v8[2] = @"note_creation_date";
  v8[3] = @"categories_coding_collections";
  v8[4] = @"relevant_start_date";
  v8[5] = @"relevant_end_date";
  v8[6] = @"authors";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ACF8]) _init];

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
    v26 = HDSQLiteColumnWithNameAsObject();
    [v10 _setStatusCoding:v26];
    objc_opt_class();
    v13 = HDSQLiteColumnWithNameAsObject();
    [v10 _setDocumentTypeCodingCollection:v13];
    objc_opt_class();
    v14 = HDSQLiteColumnWithNameAsObject();
    [v10 _setNoteCreationDate:v14];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setCategoriesCodingCollections:v18];
    objc_opt_class();
    v19 = HDSQLiteColumnWithNameAsObject();
    [v10 _setRelevantStartDate:v19];
    objc_opt_class();
    v20 = HDSQLiteColumnWithNameAsObject();
    [v10 _setRelevantEndDate:v20];
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = HDSQLiteColumnWithNameAsObjectWithClasses();

    [v10 _setAuthors:v24];
  }

  return v12;
}

@end