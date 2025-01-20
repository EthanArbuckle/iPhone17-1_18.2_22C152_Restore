@interface HDStateOfMindLabelEntity
+ (BOOL)insertLabelsForObjectID:(int64_t)a3 labels:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)labelsForObjectID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)predicateForLabelsForObjectID:(int64_t)a3;
+ (int64_t)protectionClass;
@end

@implementation HDStateOfMindLabelEntity

+ (id)databaseTable
{
  return @"state_of_mind_labels";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_85;
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

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)predicateForLabelsForObjectID:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = [NSNumber numberWithLongLong:a3];
  v5 = [v3 predicateWithProperty:@"data_id" equalToValue:v4];

  return v5;
}

+ (id)labelsForObjectID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  v10 = [v8 array];
  v11 = [v9 databaseForEntityClass:a1];

  v17[4] = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke_2;
  v17[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke_3;
  v15[3] = &unk_1E62F3D38;
  id v12 = v10;
  id v16 = v12;
  LODWORD(a5) = [v11 executeCachedStatementForKey:&labelsForObjectID_transaction_error__selectKey error:a5 SQLGenerator:v18 bindingHandler:v17 enumerationHandler:v15];

  if (a5) {
    v13 = (void *)[v12 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

id __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"label", v2, @"data_id"];

  return v3;
}

uint64_t __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __64__HDStateOfMindLabelEntity_labelsForObjectID_transaction_error___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:HDSQLiteColumnWithNameAsInt64()];
  [v1 addObject:v2];

  return 1;
}

+ (BOOL)insertLabelsForObjectID:(int64_t)a3 labels:(id)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v21 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) integerValue];
        id v13 = v21;
        uint64_t v14 = self;
        v15 = [v13 databaseForEntityClass:v14];

        v26[5] = v12;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __76__HDStateOfMindLabelEntity__insertLabelForObjectID_label_transaction_error___block_invoke;
        v27[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v27[4] = v14;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __76__HDStateOfMindLabelEntity__insertLabelForObjectID_label_transaction_error___block_invoke_2;
        v26[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
        v26[4] = a3;
        LODWORD(v12) = [v15 executeCachedStatementForKey:&_insertLabelForObjectID_label_transaction_error__insertKey error:a6 SQLGenerator:v27 bindingHandler:v26 enumerationHandler:0];

        if (!v12)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

id __76__HDStateOfMindLabelEntity__insertLabelForObjectID_label_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@, %@) VALUES (?, ?)", v2, @"data_id", @"label", 0];

  return v3;
}

uint64_t __76__HDStateOfMindLabelEntity__insertLabelForObjectID_label_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end