@interface _HDCDASampleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDCDASampleEntityEncoder

- (id)orderedProperties
{
  v11[5] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(HDEntityEncoder *)self purpose];
  if (v3 == 1)
  {
    v10 = @"document_data";
    v4 = &v10;
    goto LABEL_5;
  }
  if (!v3)
  {
    v11[0] = @"document_data";
    v4 = (__CFString **)v11;
LABEL_5:
    v4[1] = @"title";
    v4[2] = @"patient_name";
    v4[3] = @"author_name";
    v4[4] = @"custodian_name";
    v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  v6 = [(HDEntityEncoder *)self superclassEncoder];
  v7 = [v6 orderedProperties];
  v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableCDADocumentSample);
    [(HDCodableCDADocumentSample *)v10 setSample:v9];
    v11 = HDSQLiteColumnWithNameAsData();
    v12 = HDSQLiteColumnWithNameAsString();
    v13 = HDSQLiteColumnWithNameAsString();
    v14 = HDSQLiteColumnWithNameAsString();
    v15 = HDSQLiteColumnWithNameAsString();
    [(HDCodableCDADocumentSample *)v10 setDocumentData:v11];
    [(HDCodableCDADocumentSample *)v10 setTitle:v12];
    [(HDCodableCDADocumentSample *)v10 setPatientName:v13];
    [(HDCodableCDADocumentSample *)v10 setAuthorName:v14];
    [(HDCodableCDADocumentSample *)v10 setCustodianName:v15];
    [(HDCodableCDADocumentSample *)v10 setOmittedContent:1];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  v13 = (uint64_t (**)(id, void *, int64_t, uint64_t, id *))a7;
  v14 = [(_HDCDASampleEntityEncoder *)self codableRepresentationForPersistentID:a3 row:a4 error:a6];
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  int64_t v16 = [v14 encodedByteCount];
  uint64_t v17 = [(id)objc_opt_class() estimatedEncodedSize];
  if (v16 <= v17) {
    int64_t v16 = v17;
  }
  if (v16 > a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"encoded size (%ld) > maximum (%ld) so this entity will by skipped"", v16, a5);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a6) {
        *a6 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_11;
  }
  BOOL v19 = v13[2](v13, v15, v16, 1, a6) != 2;
LABEL_12:

  return v19;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AC90]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = [(HDEntityEncoder *)self encodingOptions];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 objectForKey:@"IncludeCDADocument"];
      uint64_t v16 = v15 == 0;

      uint64_t v17 = [v14 objectForKey:@"IncludeCDADocumentData"];

      if (!v17) {
        v16 |= 2uLL;
      }
      if ((v16 & 2) == 0)
      {
        id v18 = HDSQLiteColumnWithNameAsData();
LABEL_9:
        BOOL v19 = HDSQLiteColumnWithNameAsString();
        v20 = HDSQLiteColumnWithNameAsString();
        v21 = HDSQLiteColumnWithNameAsString();
        v22 = HDSQLiteColumnWithNameAsString();
        [v10 _applyPropertiesWithOmittedFlags:v16 compressedDocumentData:v18 title:v19 patientName:v20 authorName:v21 custodianName:v22];

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v16 = 3;
    }
    id v18 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

@end