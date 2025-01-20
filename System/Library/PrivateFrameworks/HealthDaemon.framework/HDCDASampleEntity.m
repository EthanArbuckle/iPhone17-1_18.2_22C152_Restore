@interface HDCDASampleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDCDASampleEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"cda_documents";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_102;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDCDASampleEntity.m", 74, @"Subclasses must override %s", "+[HDCDASampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  if (![v12 prepareForSaving:a7])
  {
    id v19 = 0;
    goto LABEL_15;
  }
  v16 = [v12 document];
  v17 = [v16 _compressedDocumentData];
  v18 = v17;
  if (v17)
  {
    if ((unint64_t)[v17 length] <= 0x300000)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
      v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v28[4] = a1;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
      v24[3] = &unk_1E62F2DF0;
      id v20 = v14;
      id v25 = v20;
      id v26 = v18;
      id v27 = v16;
      if ([v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_5 error:a7 SQLGenerator:v28 bindingHandler:v24 enumerationHandler:0])v21 = v20; {
      else
      }
        v21 = 0;
      id v19 = v21;

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Unable to save CDA sample with document data length (%ld) which is greater than maximum allowed data length (%ld)", objc_msgSend(v18, "length"), 3145728);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 3, @"Unable to save CDA samples without document data.");
  }
  id v19 = 0;
LABEL_14:

LABEL_15:

  return v19;
}

id __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)", v2, @"data_id", @"document_data", @"title", @"patient_name", @"author_name", @"custodian_name", 0];

  return v3;
}

void __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  v3 = _HDSQLiteValueForData();
  HDSQLiteBindFoundationValueToStatement();

  v4 = [*(id *)(a1 + 48) title];
  v5 = _HDSQLiteValueForString();
  HDSQLiteBindFoundationValueToStatement();

  v6 = [*(id *)(a1 + 48) patientName];
  v7 = _HDSQLiteValueForString();
  HDSQLiteBindFoundationValueToStatement();

  v8 = [*(id *)(a1 + 48) authorName];
  v9 = _HDSQLiteValueForString();
  HDSQLiteBindFoundationValueToStatement();

  id v11 = [*(id *)(a1 + 48) custodianName];
  v10 = _HDSQLiteValueForString();
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addCdaDocumentSamples:a3];
  }
  return a3 != 0;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 cdaDocumentSamples];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDCDASampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end