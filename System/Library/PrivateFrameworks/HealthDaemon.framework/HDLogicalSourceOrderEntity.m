@interface HDLogicalSourceOrderEntity
+ (BOOL)enumerateOrderedLogicalSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)saveOrderedLogicalSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 syncIdentity:(int64_t)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)updateOrderedLogicalSourcesForType:(id)a3 transaction:(id)a4 error:(id *)a5 updateHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (id)joinClausesForProperty:(id)a3;
+ (id)orderedLogicalSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)sourceIDsWithDataType:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)sourceIDsWithDataType:(id)a3 unorderedIDs:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)syncIdentityForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDLogicalSourceOrderEntity

+ (id)databaseTable
{
  return @"logical_source_order";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_97;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"logical_source";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)indices
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *MEMORY[0x1E4F65C70];
  v10[0] = @"data_type";
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = (void *)[v2 initWithEntity:v3 name:@"data_type" columns:v5];

  v9 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"data_type";
  v4[1] = @"logical_source";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"sources.ROWID"] & 1) != 0
    || ([v4 isEqualToString:@"sources.uuid"] & 1) != 0
    || ([v4 isEqualToString:@"sources.provenance"] & 1) != 0
    || [v4 isEqualToString:@"sources.deleted"])
  {
    v5 = (void *)MEMORY[0x1E4F65D38];
    v6 = [a1 disambiguatedDatabaseTable];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *MEMORY[0x1E4F65C70];
    v9 = [v5 innerJoinClauseFromTable:v6 toTargetEntity:v7 as:0 localReference:@"logical_source" targetKey:*MEMORY[0x1E4F65C70]];

    v10 = (void *)MEMORY[0x1E4F65D38];
    v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    v12 = [v10 innerJoinClauseFromTable:v11 toTargetEntity:objc_opt_class() as:0 localReference:v8 targetKey:@"logical_source_id"];

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v9, v12, 0);
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___HDLogicalSourceOrderEntity;
    v13 = objc_msgSendSuper2(&v15, sel_joinClausesForProperty_, v4);
  }

  return v13;
}

+ (BOOL)updateOrderedLogicalSourcesForType:(id)a3 transaction:(id)a4 error:(id *)a5 updateHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *))a6;
  uint64_t v13 = [v10 code];
  v14 = [v11 databaseForEntityClass:a1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke;
  v36[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v36[4] = a1;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v35[4] = v13;
  if ([v14 executeCachedStatementForKey:&updateOrderedLogicalSourcesForType_transaction_error_updateHandler__deleteKey error:a5 SQLGenerator:v36 bindingHandler:v35 enumerationHandler:0])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 1;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__192;
    v29 = __Block_byref_object_dispose__192;
    id v30 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_336;
    v19[3] = &unk_1E630CBD0;
    v21 = &v31;
    id v20 = v14;
    v22 = &v25;
    id v23 = a1;
    uint64_t v24 = v13;
    v12[2](v12, v19);
    if (*((unsigned char *)v32 + 24))
    {
      BOOL v15 = 1;
    }
    else
    {
      id v16 = (id)v26[5];
      v17 = v16;
      BOOL v15 = v16 == 0;
      if (v16)
      {
        if (a5) {
          *a5 = v16;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

id __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v4 = (void *)[v2 initWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v3, @"data_type", 0];

  return v4;
}

uint64_t __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

void __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_336(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, double a6)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v15 = *(id *)(v8 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2_337;
    v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v14[4] = a1[7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_3;
    v12[3] = &__block_descriptor_73_e23_v16__0__sqlite3_stmt__8l;
    v12[4] = a1[8];
    v12[5] = a2;
    char v13 = a3;
    v12[6] = a4;
    *(double *)&v12[7] = a6;
    v12[8] = a5;
    char v9 = [v7 executeCachedStatementForKey:&_DataTypeSourceOrderPropertyDeleted_block_invoke_insertKey error:&v15 SQLGenerator:v14 bindingHandler:v12 enumerationHandler:0];
    objc_storeStrong((id *)(v8 + 40), v15);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      uint64_t v10 = *(void *)(a1[6] + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
  }
}

id __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_2_337(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  id v4 = (void *)[v2 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)", v3, @"data_type", @"logical_source", @"user_preferred", @"provenance", @"modification_date", @"sync_identity", 0];

  return v4;
}

uint64_t __97__HDLogicalSourceOrderEntity_updateOrderedLogicalSourcesForType_transaction_error_updateHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(unsigned __int8 *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 48));
  sqlite3_bind_double(a2, 5, *(double *)(a1 + 56));
  sqlite3_int64 v4 = *(void *)(a1 + 64);

  return sqlite3_bind_int64(a2, 6, v4);
}

+ (BOOL)saveOrderedLogicalSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 syncIdentity:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = [a7 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke;
  v20[3] = &unk_1E630CC20;
  id v21 = v15;
  id v22 = v14;
  BOOL v25 = a5;
  id v23 = a1;
  int64_t v24 = a6;
  id v17 = v14;
  id v18 = v15;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v16 error:a8 block:v20];

  return (char)a8;
}

uint64_t __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke_2;
  v11[3] = &unk_1E630CBF8;
  uint64_t v8 = *(void **)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 64);
  CFAbsoluteTime v13 = Current;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v9 = [v8 updateOrderedLogicalSourcesForType:v7 transaction:v5 error:a3 updateHandler:v11];

  return v9;
}

void __102__HDLogicalSourceOrderEntity_saveOrderedLogicalSourceIDs_type_userOrdered_syncIdentity_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*((void (**)(id, uint64_t, void, void, void, double))v3 + 2))(v3, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "longLongValue", (void)v9), *(unsigned __int8 *)(a1 + 56), 0, *(void *)(a1 + 48), *(double *)(a1 + 40));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (BOOL)enumerateOrderedLogicalSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [a3 code];
  CFAbsoluteTime v13 = [v11 databaseForEntityClass:objc_opt_class()];

  v18[4] = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v19[4] = a1;
  id v17 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E62F33D0;
  id v14 = v10;
  LOBYTE(a5) = [v13 executeCachedStatementForKey:&enumerateOrderedLogicalSourceIDsForType_transaction_error_block__lookupKey error:a5 SQLGenerator:v19 bindingHandler:v18 enumerationHandler:v16];

  return (char)a5;
}

id __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC", @"logical_source", @"user_preferred", @"modification_date", v1, @"data_type", *MEMORY[0x1E4F65C70], 0];

  return v2;
}

uint64_t __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __94__HDLogicalSourceOrderEntity_enumerateOrderedLogicalSourceIDsForType_transaction_error_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1C1879F00](a2, 1);
  MEMORY[0x1C1879F40](a2, 2);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

+ (id)sourceIDsWithDataType:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HDLogicalSourceOrderEntity_sourceIDsWithDataType_transaction_error___block_invoke;
  v16[3] = &unk_1E630CC48;
  id v17 = v11;
  id v12 = v11;
  LODWORD(a5) = [a1 enumerateOrderedSourceIDsForType:v10 transaction:v9 error:a5 block:v16];

  if (a5) {
    CFAbsoluteTime v13 = v12;
  }
  else {
    CFAbsoluteTime v13 = 0;
  }
  id v14 = v13;

  return v14;
}

uint64_t __70__HDLogicalSourceOrderEntity_sourceIDsWithDataType_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];

  return 1;
}

+ (id)sourceIDsWithDataType:(id)a3 unorderedIDs:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v35 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v34 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(v8, "hk_arrayWithCount:generator:", objc_msgSend(v35, "count"), &__block_literal_global_229);
  v37 = [v10 componentsJoinedByString:@", "];

  uint64_t v33 = [v9 code];
  v32 = NSString;
  uint64_t v31 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v11 = *MEMORY[0x1E4F65C70];
  id v30 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  v29 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v27 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  v26 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  BOOL v25 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v28 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v12 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  CFAbsoluteTime v13 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v14 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  char v15 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v16 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  objc_msgSend(v32, "stringWithFormat:", @"SELECT %@.%@ FROM %@ JOIN %@ ON %@.%@ = %@.%@ JOIN %@ ON %@.%@ = %@.%@ WHERE %@.%@ = ? AND %@.%@ IN (%@) ORDER BY %@.%@ ASC, %@.%@ ASC", v31, v11, v30, v29, v27, @"logical_source", v26, v11, v25, v28, v11, v12, @"logical_source_id", v13, @"data_type", v14,
    v11,
    v37,
    v15,
    v11,
    v16,
    @"uuid",
  id v17 = 0);

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19 = [v34 databaseForEntityClass:objc_opt_class()];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_2;
  v40[3] = &unk_1E62F33F8;
  id v41 = v35;
  uint64_t v42 = v33;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_3;
  v38[3] = &unk_1E62F3D38;
  id v39 = v18;
  id v20 = v18;
  id v21 = v35;
  if ([v19 executeSQL:v17 error:a6 bindingHandler:v40 enumerationHandler:v38]) {
    id v22 = v20;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  return v23;
}

__CFString *__83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke()
{
  return @"?";
}

void __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    int v8 = 2;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_int64(a2, v8 + v9, objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "longLongValue", (void)v10));
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v8 += v9;
    }
    while (v6);
  }
}

uint64_t __83__HDLogicalSourceOrderEntity_sourceIDsWithDataType_unorderedIDs_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithLongLong:v2];
  [v3 addObject:v4];

  return 1;
}

+ (id)orderedLogicalSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  long long v11 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v12 = a5;
  id v13 = objc_alloc_init(v11);
  id v14 = [v12 database];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke;
  v20[3] = &unk_1E62F5200;
  id v23 = a1;
  int64_t v24 = a4;
  id v21 = v10;
  id v22 = v13;
  id v15 = v13;
  id v16 = v10;
  LODWORD(a6) = [a1 performReadTransactionWithHealthDatabase:v14 error:a6 block:v20];

  if (a6) {
    id v17 = v15;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

uint64_t __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke_2;
  v9[3] = &unk_1E6304968;
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v7 = [v5 enumerateOrderedLogicalSourceIDsForType:v6 transaction:a2 error:a3 block:v9];

  return v7;
}

uint64_t __87__HDLogicalSourceOrderEntity_orderedLogicalSourceIDsForType_userOrdered_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id v3 = *(unsigned char **)(a1 + 40);
  if (v3) {
    unsigned char *v3 = a3;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithLongLong:a2];
  [v4 addObject:v5];

  return 1;
}

+ (id)propertyForSyncProvenance
{
  return @"provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [a3 code];
  id v13 = [v11 databaseForEntityClass:objc_opt_class()];

  v18[4] = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v19[4] = a1;
  id v17 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E62F33D0;
  id v14 = v10;
  LOBYTE(a5) = [v13 executeCachedStatementForKey:&enumerateOrderedSourceIDsForType_transaction_error_block__lookupKey error:a5 SQLGenerator:v19 bindingHandler:v18 enumerationHandler:v16];

  return (char)a5;
}

id __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = *MEMORY[0x1E4F65C70];
  uint64_t v2 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v5 = [v0 stringWithFormat:@"SELECT s.%@, o.%@, o.%@ FROM %@ o JOIN %@ l ON o.%@ = l.%@ JOIN %@ s ON l.%@ = s.%@ WHERE o.%@ = ? ORDER BY o.%@ ASC, s.%@ ASC", v1, @"user_preferred", @"modification_date", v2, v3, @"logical_source", v1, v4, v1, @"logical_source_id", @"data_type", v1, @"uuid", 0];

  return v5;
}

uint64_t __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __87__HDLogicalSourceOrderEntity_enumerateOrderedSourceIDsForType_transaction_error_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1C1879F00](a2, 1);
  MEMORY[0x1C1879F40](a2, 2);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

+ (id)syncIdentityForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E4F65D00];
  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code"));
  id v15 = [v13 predicateWithProperty:@"data_type" equalToValue:v14];

  id v16 = [v12 databaseForEntityClass:a1];
  id v17 = [a1 propertyValueForAnyInDatabase:v16 property:@"sync_identity" predicate:v15 error:a6];

  if (v17)
  {
    id v18 = [v11 syncIdentityManager];
    v19 = objc_msgSend(v18, "identityForEntityID:transaction:error:", (int)objc_msgSend(v17, "intValue"), v12, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"self", objc_opt_class(), a2, @"No source order present for this data type");
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

    v19 = 0;
  }

  return v19;
}

@end