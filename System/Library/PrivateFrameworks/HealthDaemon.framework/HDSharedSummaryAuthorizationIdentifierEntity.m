@interface HDSharedSummaryAuthorizationIdentifierEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)authorizationIdentifiersForSummaryID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)insertWithSummaryID:(int64_t)a3 authorizationIdentifiers:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDSharedSummaryAuthorizationIdentifierEntity

+ (id)databaseTable
{
  return @"shared_summary_authorization_categories";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryAuthorizationCategoryEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"summary_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"summary_id";
  v4[1] = @"category";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithSummaryID:(int64_t)a3 authorizationIdentifiers:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v23 = v9;
  v11 = [v9 databaseForEntityClass:a1];
  v32[0] = @"summary_id";
  v32[1] = @"category";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __119__HDSharedSummaryAuthorizationIdentifierEntity_insertWithSummaryID_authorizationIdentifiers_databaseTransaction_error___block_invoke;
        v26[3] = &unk_1E62F67E8;
        v26[4] = v18;
        v26[5] = a3;
        uint64_t v19 = [a1 insertOrReplaceEntity:0 database:v11 properties:v12 error:a6 bindingHandler:v26];
        if (!v19)
        {

          id v21 = 0;
          goto LABEL_11;
        }
        v20 = (void *)v19;
        [v10 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v21 = v10;
LABEL_11:

  return v21;
}

void __119__HDSharedSummaryAuthorizationIdentifierEntity_insertWithSummaryID_authorizationIdentifiers_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"summary_id", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879EC0);
}

+ (id)authorizationIdentifiersForSummaryID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  v11 = [v9 databaseForEntityClass:a1];

  v18[4] = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  id v17 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke_3;
  v16[3] = &unk_1E62F3D38;
  id v12 = v10;
  LODWORD(a5) = [v11 executeCachedStatementForKey:&authorizationIdentifiersForSummaryID_databaseTransaction_error__key error:a5 SQLGenerator:v19 bindingHandler:v18 enumerationHandler:v16];

  if (a5) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

id __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ?", @"category", v2, @"summary_id"];

  return v3;
}

uint64_t __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __111__HDSharedSummaryAuthorizationIdentifierEntity_authorizationIdentifiersForSummaryID_databaseTransaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1C1879F80](a2, 0);
  [v2 addObject:v3];

  return 1;
}

@end