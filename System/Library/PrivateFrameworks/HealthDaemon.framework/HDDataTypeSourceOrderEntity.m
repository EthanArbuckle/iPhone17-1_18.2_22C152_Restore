@interface HDDataTypeSourceOrderEntity
+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6;
+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7;
+ (BOOL)saveOrderedSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)updateOrderedSourcesForType:(id)a3 profile:(id)a4 error:(id *)a5 updateHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (id)joinClausesForProperty:(id)a3;
+ (id)orderedSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6;
+ (id)propertyForSyncProvenance;
+ (id)tableAliases;
+ (int64_t)protectionClass;
@end

@implementation HDDataTypeSourceOrderEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)propertyForSyncProvenance
{
  return @"provenance";
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"so_source.uuid"] & 1) != 0
    || [v4 isEqualToString:@"so_source.provenance"])
  {
    v5 = (void *)MEMORY[0x1E4F65D38];
    v6 = [a1 disambiguatedDatabaseTable];
    v7 = [v5 innerJoinClauseFromTable:v6 toTargetEntity:objc_opt_class() as:@"so_source" localReference:@"source" targetKey:*MEMORY[0x1E4F65C70]];

    v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDDataTypeSourceOrderEntity;
    v8 = objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
  }

  return v8;
}

+ (id)orderedSourceIDsForType:(id)a3 userOrdered:(BOOL *)a4 profile:(id)a5 error:(id *)a6
{
  objc_super v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HDDataTypeSourceOrderEntity_orderedSourceIDsForType_userOrdered_profile_error___block_invoke;
  v18[3] = &unk_1E6304968;
  id v19 = v13;
  v20 = a4;
  id v14 = v13;
  LODWORD(a6) = [a1 enumerateOrderedSourceIDsForType:v12 profile:v11 error:a6 block:v18];

  if (a6) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __81__HDDataTypeSourceOrderEntity_orderedSourceIDsForType_userOrdered_profile_error___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v3 = *(unsigned char **)(a1 + 40);
  if (v3) {
    unsigned char *v3 = a3;
  }
  id v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithLongLong:a2];
  [v4 addObject:v5];

  return 1;
}

+ (id)databaseTable
{
  return @"datatype_source_order";
}

+ (id)tableAliases
{
  return &unk_1F17EA428;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_65;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"source";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
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

+ (BOOL)updateOrderedSourcesForType:(id)a3 profile:(id)a4 error:(id *)a5 updateHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HDDataTypeSourceOrderEntity_updateOrderedSourcesForType_profile_error_updateHandler___block_invoke;
  v18[3] = &unk_1E62FEF68;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = a1;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a5) = [a1 performWriteTransactionWithHealthDatabase:v13 error:a5 block:v18];

  return (char)a5;
}

BOOL __87__HDDataTypeSourceOrderEntity_updateOrderedSourcesForType_profile_error_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = a2;
  id v10 = v6;
  uint64_t v11 = self;
  uint64_t v12 = [v7 code];
  id v13 = [v9 databaseForEntityClass:v11];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke;
  v35[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v35[4] = v11;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2;
  v34[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v34[4] = v12;
  if ([v13 executeCachedStatementForKey:&_updateOrderedSourcesForType_profile_transaction_error_updateHandler__deleteKey error:a3 SQLGenerator:v35 bindingHandler:v34 enumerationHandler:0])
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__128;
    v28 = __Block_byref_object_dispose__128;
    id v29 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_333;
    v18[3] = &unk_1E6304918;
    id v20 = &v30;
    id v19 = v13;
    id v21 = &v24;
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    v10[2](v10, v18);
    BOOL v14 = *((unsigned char *)v31 + 24) != 0;
    if (!*((unsigned char *)v31 + 24))
    {
      id v15 = (id)v25[5];
      id v16 = v15;
      if (v15)
      {
        if (a3) {
          *a3 = v15;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = (void *)[v2 initWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v3, @"data_type", 0];

  return v4;
}

uint64_t __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

void __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_333(void *a1, uint64_t a2, char a3, uint64_t a4, double a5)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = (void *)a1[4];
    id v14 = *(id *)(v6 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2_334;
    v13[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v13[4] = a1[7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_3;
    v11[3] = &__block_descriptor_65_e23_v16__0__sqlite3_stmt__8l;
    v11[4] = a1[8];
    v11[5] = a2;
    char v12 = a3;
    v11[6] = a4;
    *(double *)&v11[7] = a5;
    char v8 = [v7 executeCachedStatementForKey:&_DataTypeSourceOrderPropertySourceProvenance_block_invoke_insertKey error:&v14 SQLGenerator:v13 bindingHandler:v11 enumerationHandler:0];
    objc_storeStrong((id *)(v6 + 40), v14);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v8;
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      uint64_t v9 = *(void *)(a1[6] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
    }
  }
}

id __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_2_334(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  uint64_t v4 = (void *)[v2 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?)", v3, @"data_type", @"source", @"user_preferred", @"provenance", @"modification_date", 0];

  return v4;
}

uint64_t __100__HDDataTypeSourceOrderEntity__updateOrderedSourcesForType_profile_transaction_error_updateHandler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(unsigned __int8 *)(a1 + 64));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 48));
  double v4 = *(double *)(a1 + 56);

  return sqlite3_bind_double(a2, 5, v4);
}

+ (BOOL)saveOrderedSourceIDs:(id)a3 type:(id)a4 userOrdered:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__HDDataTypeSourceOrderEntity_saveOrderedSourceIDs_type_userOrdered_profile_error___block_invoke;
  v18[3] = &unk_1E6304940;
  id v19 = v12;
  BOOL v21 = a5;
  CFAbsoluteTime v20 = Current;
  id v16 = v12;
  LOBYTE(a7) = [a1 updateOrderedSourcesForType:v14 profile:v13 error:a7 updateHandler:v18];

  return (char)a7;
}

void __83__HDDataTypeSourceOrderEntity_saveOrderedSourceIDs_type_userOrdered_profile_error___block_invoke(uint64_t a1, void *a2)
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
        (*((void (**)(id, uint64_t, void, void, double))v3 + 2))(v3, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "longLongValue", (void)v9), *(unsigned __int8 *)(a1 + 48), 0, *(double *)(a1 + 40));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_error_block___block_invoke;
  v18[3] = &unk_1E62FEF68;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = a1;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v13 error:a5 block:v18];

  return (char)a5;
}

uint64_t __84__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 56) enumerateOrderedSourceIDsForType:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:a2 error:a3 block:*(void *)(a1 + 48)];
}

+ (BOOL)enumerateOrderedSourceIDsForType:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = NSString;
  id v14 = a5;
  id v15 = [a1 disambiguatedDatabaseTable];
  id v16 = [v13 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = ? ORDER BY %@ ASC", @"source", @"user_preferred", @"modification_date", v15, @"data_type", *MEMORY[0x1E4F65C70]];

  v17 = [v14 databaseForEntityClass:a1];

  id v22 = v12;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke;
  v23[3] = &unk_1E62F43C8;
  id v24 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke_2;
  v21[3] = &unk_1E62F33D0;
  id v18 = v12;
  id v19 = v11;
  LOBYTE(a6) = [v17 executeSQL:v16 error:a6 bindingHandler:v23 enumerationHandler:v21];

  return (char)a6;
}

uint64_t __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) code];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __96__HDDataTypeSourceOrderEntity_enumerateOrderedSourceIDsForType_profile_transaction_error_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  HDSQLiteColumnAsInt64();
  MEMORY[0x1C1879F00](a2, 1);
  MEMORY[0x1C1879F40](a2, 2);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

@end