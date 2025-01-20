@interface ASDatabaseCompetitionListEntryEntity
+ (BOOL)_insertCompetitionLists:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)enumerateAllCompetitionListsWithProfile:(id)a3 error:(id *)a4 handler:(id)a5;
+ (BOOL)removeAllCompetitionListsWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)saveCompetitionList:(id)a3 profile:(id)a4 withError:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertCompetitionList:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation ASDatabaseCompetitionListEntryEntity

+ (id)databaseTable
{
  return (id)[NSString stringWithFormat:@"%@_%@", *MEMORY[0x263F23C58], *MEMORY[0x263F23C48]];
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"friend_uuid";
  v4[1] = @"type";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[ASDatabaseCompetitionListEntryEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)saveCompetitionList:(id)a3 profile:(id)a4 withError:(id *)a5
{
  v12[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_class();
  v12[0] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  LOBYTE(a5) = [v9 _insertCompetitionLists:v10 profile:v7 error:a5];
  return (char)a5;
}

+ (BOOL)enumerateAllCompetitionListsWithProfile:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke;
  v14[3] = &unk_265216468;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(a4) = [a1 performReadTransactionWithHealthDatabase:v10 error:a4 block:v14];

  return (char)a4;
}

uint64_t __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v6 databaseForEntityClass:v5];
  id v8 = [*(id *)(a1 + 48) entityEncoderForProfile:*(void *)(a1 + 32) transaction:v6 purpose:1 encodingOptions:0 authorizationFilter:0];

  id v9 = *(void **)(a1 + 48);
  v10 = [MEMORY[0x263F434D0] truePredicate];
  id v11 = [v9 queryWithDatabase:v7 predicate:v10];

  id v12 = [v8 orderedProperties];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke_2;
  v16[3] = &unk_265216440;
  id v17 = v8;
  id v18 = *(id *)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = [v11 enumeratePersistentIDsAndProperties:v12 error:a3 enumerationHandler:v16];

  return v14;
}

BOOL __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v13 = 0;
  id v8 = [v7 objectForPersistentID:a2 row:a4 error:&v13];
  id v9 = v13;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    ASLoggingInitialize();
    v10 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke_2_cold_1((uint64_t)v9, v10);
    }
    id v11 = v9;
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v8 != 0;
}

+ (BOOL)removeAllCompetitionListsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__ASDatabaseCompetitionListEntryEntity_removeAllCompetitionListsWithProfile_error___block_invoke;
  v14[3] = &unk_265216490;
  id v16 = a1;
  id v15 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __83__ASDatabaseCompetitionListEntryEntity_removeAllCompetitionListsWithProfile_error___block_invoke_2;
  v12[3] = &unk_2652164B8;
  id v8 = v15;
  id v13 = v8;
  char v9 = [a1 performWriteTransactionWithHealthDatabase:v7 error:a4 block:v14 inaccessibilityHandler:v12];

  if ((v9 & 1) == 0)
  {
    ASLoggingInitialize();
    v10 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionListEntryEntity removeAllCompetitionListsWithProfile:error:]((uint64_t *)a4, v10);
    }
  }

  return v9;
}

uint64_t __83__ASDatabaseCompetitionListEntryEntity_removeAllCompetitionListsWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [MEMORY[0x263F434D0] truePredicate];
  id v6 = objc_opt_class();
  id v7 = [*(id *)(a1 + 32) database];
  uint64_t v8 = [v6 deleteEntitiesWithPredicate:v5 healthDatabase:v7 error:a3];

  return v8;
}

uint64_t __83__ASDatabaseCompetitionListEntryEntity_removeAllCompetitionListsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_alloc_init(ASDatabaeCompetitionListEntryBulkDeletionJournalEntry);
  id v6 = [*(id *)(a1 + 32) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)_insertCompetitionLists:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 database];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionLists_profile_error___block_invoke;
  v19[3] = &unk_265216490;
  id v21 = a1;
  id v20 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionLists_profile_error___block_invoke_2;
  v16[3] = &unk_2652164E0;
  id v11 = v20;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  char v13 = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v19 inaccessibilityHandler:v16];

  if ((v13 & 1) == 0)
  {
    ASLoggingInitialize();
    uint64_t v14 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionListEntryEntity _insertCompetitionLists:profile:error:]((uint64_t)v11, a5, v14);
    }
  }

  return v13;
}

uint64_t __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionLists_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = objc_opt_class();
        id v19 = 0;
        char v13 = [v12 _insertCompetitionList:v11 database:v5 error:&v19];
        id v14 = v19;
        id v15 = v14;
        if (!v13)
        {
          id v17 = v14;
          if (v17)
          {
            if (a3) {
              *a3 = v17;
            }
            else {
              _HKLogDroppedError();
            }
          }

          uint64_t v16 = 0;
          goto LABEL_15;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_15:

  return v16;
}

uint64_t __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionLists_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = [ASDatabaseCompetitionListEntryJournalEntry alloc];
        char v13 = -[ASDatabaseCompetitionListEntryJournalEntry initWithCompetitionList:](v12, "initWithCompetitionList:", v11, (void)v17);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v14 = [*(id *)(a1 + 40) database];
  uint64_t v15 = [v14 addJournalEntries:v5 error:a3];

  return v15;
}

+ (id)_insertCompetitionList:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ASAllDatabaseCompetitionListEntryKeys();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionList_database_error___block_invoke;
  v14[3] = &unk_265216508;
  id v15 = v8;
  id v11 = v8;
  id v12 = [a1 insertOrReplaceEntity:1 database:v9 properties:v10 error:a5 bindingHandler:v14];

  return v12;
}

void __78__ASDatabaseCompetitionListEntryEntity__insertCompetitionList_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x263F08C38];
  uint64_t v5 = [*(id *)(a1 + 32) friendUUID];
  id v6 = objc_msgSend(v4, "hk_UUIDWithData:", v5);
  MEMORY[0x24C557800](a2, @"friend_uuid", v6);

  MEMORY[0x24C5577F0](a2, @"type", [*(id *)(a1 + 32) type]);
  uint64_t v7 = [*(id *)(a1 + 32) systemFieldsOnlyRecord];
  MEMORY[0x24C5577E0](a2, @"system_fields", v7);

  [*(id *)(a1 + 32) owner];
  JUMPOUT(0x24C5577F0);
}

void __94__ASDatabaseCompetitionListEntryEntity_enumerateAllCompetitionListsWithProfile_error_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "Error instantiating database competition lists during database retrieval: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)removeAllCompetitionListsWithProfile:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "Error removing competitions: %{public}@", (uint8_t *)&v3, 0xCu);
}

+ (void)_insertCompetitionLists:(uint64_t)a1 profile:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, (uint64_t)a2, a3, "Error inserting competition lists %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end