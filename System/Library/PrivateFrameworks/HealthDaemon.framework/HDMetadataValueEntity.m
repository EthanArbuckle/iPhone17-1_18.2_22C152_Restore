@interface HDMetadataValueEntity
+ (BOOL)_insertMetadataValueWithKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7;
+ (BOOL)_updateMetadataValueForKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)deleteStatementForObjectMetadataWithTransaction:(id)a3;
+ (id)indices;
+ (int64_t)protectionClass;
+ (uint64_t)_determineMetadataTypeForValue:(void *)a3 stringValue:(void *)a4 numberValue:(void *)a5 dateValue:(void *)a6 dataValue:(uint64_t *)a7 type:(uint64_t)a8 error:;
@end

@implementation HDMetadataValueEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)_insertMetadataValueWithKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v32 = 0;
  uint64_t v33 = 0;
  id v30 = 0;
  id v31 = 0;
  id v29 = 0;
  int v13 = +[HDMetadataValueEntity _determineMetadataTypeForValue:stringValue:numberValue:dateValue:dataValue:type:error:]((uint64_t)a1, a5, &v32, &v31, &v30, &v29, &v33, (uint64_t)a7);
  id v14 = v32;
  id v15 = v31;
  id v16 = v30;
  id v17 = v29;
  if (v13)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke;
    v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v28[4] = a1;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke_2;
    v20[3] = &unk_1E62FF978;
    int64_t v25 = a3;
    int64_t v26 = a4;
    id v21 = v14;
    id v22 = v15;
    id v23 = v16;
    id v24 = v17;
    uint64_t v27 = v33;
    char v18 = [v12 executeCachedStatementForKey:&_insertMetadataValueWithKeyID_objectID_value_database_error__insertKey error:a7 SQLGenerator:v28 bindingHandler:v20 enumerationHandler:0];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

id __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke(uint64_t a1)
{
  v5[7] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v5[0] = @"key_id";
  v5[1] = @"object_id";
  v5[2] = @"string_value";
  v5[3] = @"numerical_value";
  v5[4] = @"date_value";
  v5[5] = @"data_value";
  v5[6] = @"value_type";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v3 = [v1 insertSQLForProperties:v2 shouldReplace:0];

  return v3;
}

+ (id)databaseTable
{
  return @"metadata_values";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_49;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v8 = @"object_id";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v5 = (void *)[v2 initWithEntity:v3 name:@"object" columns:v4];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

+ (id)deleteStatementForObjectMetadataWithTransaction:(id)a3
{
  v4 = [a3 databaseForEntityClass:a1];
  v5 = [a1 deleteStatementWithProperty:@"object_id" database:v4];

  return v5;
}

+ (uint64_t)_determineMetadataTypeForValue:(void *)a3 stringValue:(void *)a4 numberValue:(void *)a5 dateValue:(void *)a6 dataValue:(uint64_t *)a7 type:(uint64_t)a8 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v13 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    id v15 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    char v18 = 0;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v18 = v13;
    id v15 = 0;
    id v16 = 0;
    id v14 = 0;
    uint64_t v17 = 1;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v13;
    id v16 = 0;
    char v18 = 0;
    id v14 = 0;
    uint64_t v17 = 2;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = NSNumber;
    v20 = v13;
    id v21 = [(__CFString *)v20 _unit];
    [(__CFString *)v20 doubleValueForUnit:v21];
    objc_msgSend(v19, "numberWithDouble:");
    char v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v22 = [(__CFString *)v20 _unit];

    id v14 = [v22 unitString];

    id v15 = 0;
    id v16 = 0;
    uint64_t v17 = 3;
    if (!a3)
    {
LABEL_13:
      if (a4) {
        *a4 = v18;
      }
      if (a5) {
        *a5 = v15;
      }
      if (a6) {
        *a6 = v16;
      }
      if (a7) {
        *a7 = v17;
      }
      uint64_t v23 = 1;
      goto LABEL_22;
    }
LABEL_12:
    *a3 = v14;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v13;
    id v15 = 0;
    char v18 = 0;
    id v14 = 0;
    uint64_t v17 = 4;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 3, @"Received invalid metadata value type %@ (%@)", v13, objc_opt_class());
  _HKInitializeLogging();
  int64_t v25 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int64_t v26 = (void *)MEMORY[0x1E4F2B860];
    uint64_t v27 = v25;
    if ([v26 isAppleInternalInstall]) {
      v28 = v13;
    }
    else {
      v28 = @"<redacted>";
    }
    *(_DWORD *)buf = 138412546;
    id v32 = v28;
    __int16 v33 = 2112;
    id v34 = (id)objc_opt_class();
    id v29 = v34;
    _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Received invalid value %@ of type %@", buf, 0x16u);
  }
  id v15 = 0;
  id v16 = 0;
  char v18 = 0;
  id v14 = 0;
  uint64_t v23 = 0;
LABEL_22:

  return v23;
}

uint64_t __85__HDMetadataValueEntity__insertMetadataValueWithKeyID_objectID_value_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[8]);
  sqlite3_bind_int64(a2, 2, a1[9]);
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = a1[10];

  return sqlite3_bind_int64(a2, 7, v4);
}

+ (BOOL)_updateMetadataValueForKeyID:(int64_t)a3 objectID:(int64_t)a4 value:(id)a5 database:(id)a6 error:(id *)a7
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v52 = 0;
  uint64_t v53 = 0;
  id v51 = 0;
  id v49 = 0;
  id v50 = 0;
  int v13 = +[HDMetadataValueEntity _determineMetadataTypeForValue:stringValue:numberValue:dateValue:dataValue:type:error:]((uint64_t)a1, a5, &v52, &v51, &v50, &v49, &v53, (uint64_t)a7);
  id v14 = v52;
  id v15 = v51;
  id v16 = v50;
  id v17 = v49;
  if (v13)
  {
    char v18 = [NSNumber numberWithLongLong:a3];
    [NSNumber numberWithLongLong:a4];
    v37 = v12;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = v18;
    self;
    id v21 = (void *)MEMORY[0x1E4F65D08];
    id v22 = v20;
    self;
    v36 = v17;
    id v23 = v16;
    id v24 = v15;
    id v25 = v14;
    int64_t v26 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"key_id" equalToValue:v22];

    v54[0] = v26;
    id v27 = v19;
    self;
    v28 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"object_id" equalToValue:v27];

    v54[1] = v28;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    id v30 = [v21 predicateMatchingAllPredicates:v29];

    id v14 = v25;
    id v15 = v24;
    id v16 = v23;
    id v17 = v36;

    id v12 = v37;
    id v47 = a1;
    id v48 = 0;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke;
    v45[3] = &unk_1E62F8BA0;
    id v46 = v30;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke_2;
    v38[3] = &unk_1E62FF9A0;
    id v39 = v14;
    id v40 = v15;
    id v41 = v16;
    id v31 = v36;
    id v43 = v46;
    uint64_t v44 = v53;
    id v42 = v31;
    id v32 = v46;
    char v33 = [v37 executeCachedStatementForKey:&_updateMetadataValueForKeyID_objectID_value_database_error__updateKey error:&v48 SQLGenerator:v45 bindingHandler:v38 enumerationHandler:0];
    id v34 = v48;
  }
  else
  {
    char v33 = 0;
  }

  return v33;
}

id __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke(uint64_t a1)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 40);
  v6[0] = @"string_value";
  v6[1] = @"numerical_value";
  v6[2] = @"date_value";
  v6[3] = @"data_value";
  v6[4] = @"value_type";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  sqlite3_int64 v4 = [v2 updateSQLForProperties:v3 predicate:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __84__HDMetadataValueEntity__updateMetadataValueForKeyID_objectID_value_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  int v5 = 6;
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 72));
  return [*(id *)(a1 + 64) bindToStatement:a2 bindingIndex:&v5];
}

@end