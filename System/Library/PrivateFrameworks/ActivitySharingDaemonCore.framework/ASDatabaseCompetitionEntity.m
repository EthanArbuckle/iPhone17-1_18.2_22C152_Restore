@interface ASDatabaseCompetitionEntity
+ (BOOL)_insertCompetitions:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)removeAllCompetitionsWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)removeCompetitionsForFriendUUID:(id)a3 type:(int64_t)a4 profile:(id)a5 withError:(id *)a6;
+ (BOOL)saveCompetitions:(id)a3 profile:(id)a4 withError:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_competitionsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_insertCompetition:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)allDatabaseCompetitionsWithProfile:(id)a3 withError:(id *)a4;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation ASDatabaseCompetitionEntity

+ (id)databaseTable
{
  return (id)[NSString stringWithFormat:@"%@_%@", *MEMORY[0x263F23C58], *MEMORY[0x263F23C50]];
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"friend_uuid";
  v4[1] = @"competition_uuid";
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
  v15 = [(HDEntityEncoder *)[ASDatabseCompetitionEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)saveCompetitions:(id)a3 profile:(id)a4 withError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  LOBYTE(a5) = [(id)objc_opt_class() _insertCompetitions:v8 profile:v7 error:a5];

  return (char)a5;
}

+ (BOOL)removeCompetitionsForFriendUUID:(id)a3 type:(int64_t)a4 profile:(id)a5 withError:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__ASDatabaseCompetitionEntity_removeCompetitionsForFriendUUID_type_profile_withError___block_invoke;
  v23[3] = &unk_265217E68;
  id v24 = v10;
  int64_t v26 = a4;
  id v27 = a1;
  id v25 = v11;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__ASDatabaseCompetitionEntity_removeCompetitionsForFriendUUID_type_profile_withError___block_invoke_2;
  v19[3] = &unk_265217E90;
  id v13 = v24;
  id v20 = v13;
  int64_t v22 = a4;
  id v14 = v25;
  id v21 = v14;
  char v15 = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v23 inaccessibilityHandler:v19];

  if ((v15 & 1) == 0)
  {
    ASLoggingInitialize();
    v16 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR))
    {
      id v18 = *a6;
      *(_DWORD *)buf = 138543874;
      id v29 = v13;
      __int16 v30 = 2048;
      int64_t v31 = a4;
      __int16 v32 = 2114;
      id v33 = v18;
      _os_log_error_impl(&dword_2474C9000, v16, OS_LOG_TYPE_ERROR, "Error removing competition %{public}@/%ld: %{public}@", buf, 0x20u);
    }
  }

  return v15;
}

uint64_t __86__ASDatabaseCompetitionEntity_removeCompetitionsForFriendUUID_type_profile_withError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = ASCompetitionPredicateForFriendUUIDAndType(*(void *)(a1 + 32), *(void *)(a1 + 48));
  v6 = objc_opt_class();
  id v7 = [*(id *)(a1 + 40) database];
  uint64_t v8 = [v6 deleteEntitiesWithPredicate:v5 healthDatabase:v7 error:a3];

  return v8;
}

uint64_t __86__ASDatabaseCompetitionEntity_removeCompetitionsForFriendUUID_type_profile_withError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [[ASDatabaseCompetitionDeletionJournalEntry alloc] initWithFriendUUID:*(void *)(a1 + 32) type:*(void *)(a1 + 48)];
  v6 = [*(id *)(a1 + 40) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (BOOL)removeAllCompetitionsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 database];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__ASDatabaseCompetitionEntity_removeAllCompetitionsWithProfile_error___block_invoke;
  v14[3] = &unk_265216490;
  id v16 = a1;
  id v15 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__ASDatabaseCompetitionEntity_removeAllCompetitionsWithProfile_error___block_invoke_2;
  v12[3] = &unk_2652164B8;
  id v8 = v15;
  id v13 = v8;
  char v9 = [a1 performWriteTransactionWithHealthDatabase:v7 error:a4 block:v14 inaccessibilityHandler:v12];

  if ((v9 & 1) == 0)
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionListEntryEntity removeAllCompetitionListsWithProfile:error:]((uint64_t *)a4, v10);
    }
  }

  return v9;
}

uint64_t __70__ASDatabaseCompetitionEntity_removeAllCompetitionsWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [MEMORY[0x263F434D0] truePredicate];
  id v6 = objc_opt_class();
  uint64_t v7 = [*(id *)(a1 + 32) database];
  uint64_t v8 = [v6 deleteEntitiesWithPredicate:v5 healthDatabase:v7 error:a3];

  return v8;
}

uint64_t __70__ASDatabaseCompetitionEntity_removeAllCompetitionsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = objc_alloc_init(ASDatabaseCompetitionBulkDeletionJournalEntry);
  id v6 = [*(id *)(a1 + 32) database];
  uint64_t v7 = [v6 addJournalEntry:v5 error:a3];

  return v7;
}

+ (id)allDatabaseCompetitionsWithProfile:(id)a3 withError:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F434D0];
  id v7 = a3;
  uint64_t v8 = [v6 truePredicate];
  char v9 = [a1 _competitionsWithPredicate:v8 profile:v7 error:a4];

  return v9;
}

+ (id)_competitionsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = [v9 database];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke;
  v18[3] = &unk_265217EE0;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v22 = a1;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  LODWORD(a5) = [a1 performReadTransactionWithHealthDatabase:v11 error:a5 block:v18];

  if (a5) {
    id v15 = v12;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [*(id *)(a1 + 56) entityEncoderForProfile:*(void *)(a1 + 32) transaction:a2 purpose:1 encodingOptions:0 authorizationFilter:0];
  id v6 = *(void **)(a1 + 56);
  id v7 = [v5 orderedProperties];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) database];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke_2;
  v13[3] = &unk_265217EB8;
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = [v6 enumerateProperties:v7 withPredicate:v8 healthDatabase:v9 error:a3 enumerationHandler:v13];

  return v11;
}

BOOL __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v13 = 0;
  uint64_t v8 = [v7 objectForPersistentID:a2 row:a4 error:&v13];
  id v9 = v13;
  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke_2_cold_1((uint64_t)v9, v10);
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

+ (BOOL)_insertCompetitions:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 database];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__ASDatabaseCompetitionEntity__insertCompetitions_profile_error___block_invoke;
  v19[3] = &unk_265216490;
  id v21 = a1;
  id v20 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__ASDatabaseCompetitionEntity__insertCompetitions_profile_error___block_invoke_2;
  v16[3] = &unk_2652164E0;
  id v11 = v20;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  char v13 = [a1 performWriteTransactionWithHealthDatabase:v10 error:a5 block:v19 inaccessibilityHandler:v16];

  if ((v13 & 1) == 0)
  {
    ASLoggingInitialize();
    id v14 = *MEMORY[0x263F23AB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionEntity _insertCompetitions:profile:error:]((uint64_t)v11, a5, v14);
    }
  }

  return v13;
}

uint64_t __65__ASDatabaseCompetitionEntity__insertCompetitions_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = [a2 databaseForEntityClass:*(void *)(a1 + 40)];
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
        char v13 = [v12 _insertCompetition:v11 database:v5 error:&v19];
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

uint64_t __65__ASDatabaseCompetitionEntity__insertCompetitions_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
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
        id v12 = [ASDatabaseCompetitionJournalEntry alloc];
        char v13 = -[ASDatabaseCompetitionJournalEntry initWithDatabaseCompetition:](v12, "initWithDatabaseCompetition:", v11, (void)v17);
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

+ (id)_insertCompetition:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ASAllDatabaseCompetitionKeys();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__ASDatabaseCompetitionEntity__insertCompetition_database_error___block_invoke;
  v14[3] = &unk_265216508;
  id v15 = v8;
  id v11 = v8;
  id v12 = [a1 insertOrReplaceEntity:1 database:v9 properties:v10 error:a5 bindingHandler:v14];

  return v12;
}

void __65__ASDatabaseCompetitionEntity__insertCompetition_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x263F08C38];
  v5 = [*(id *)(a1 + 32) friendUUID];
  id v6 = objc_msgSend(v4, "hk_UUIDWithData:", v5);
  MEMORY[0x24C557800](a2, @"friend_uuid", v6);

  uint64_t v7 = (void *)MEMORY[0x263F08C38];
  id v8 = [*(id *)(a1 + 32) competition];
  id v9 = [v8 uuid];
  uint64_t v10 = objc_msgSend(v7, "hk_UUIDWithData:", v9);
  MEMORY[0x24C557800](a2, @"competition_uuid", v10);

  MEMORY[0x24C5577F0](a2, @"competition_type", [*(id *)(a1 + 32) type]);
  id v11 = [*(id *)(a1 + 32) competition];
  MEMORY[0x24C5577F0](a2, @"current_cache_index", [v11 currentCacheIndex]);

  id v12 = [*(id *)(a1 + 32) competition];
  MEMORY[0x24C5577F0](a2, @"last_pushed_cache_index", [v12 currentCacheIndex]);

  id v34 = objc_alloc_init(MEMORY[0x263F23B60]);
  char v13 = [*(id *)(a1 + 32) competition];
  uint64_t v14 = [v13 scores];
  id v15 = [*(id *)(a1 + 32) competition];
  objc_msgSend(v34, "setScores:count:", v14, objc_msgSend(v15, "scoresCount"));

  id v16 = objc_alloc_init(MEMORY[0x263F23B60]);
  long long v17 = [*(id *)(a1 + 32) competition];
  uint64_t v18 = [v17 opponentScores];
  long long v19 = [*(id *)(a1 + 32) competition];
  objc_msgSend(v16, "setScores:count:", v18, objc_msgSend(v19, "opponentScoresCount"));

  long long v20 = [v34 data];
  MEMORY[0x24C5577E0](a2, @"scores", v20);

  long long v21 = [v16 data];
  MEMORY[0x24C5577E0](a2, @"opponent_scores", v21);

  uint64_t v22 = [*(id *)(a1 + 32) competition];
  long long v23 = [v22 startDateComponents];
  id v24 = [v23 data];
  MEMORY[0x24C5577E0](a2, @"start_date_components", v24);

  uint64_t v25 = [*(id *)(a1 + 32) competition];
  int64_t v26 = [v25 durationDateComponents];
  id v27 = [v26 data];
  MEMORY[0x24C5577E0](a2, @"duration_date_components", v27);

  id v28 = objc_alloc_init(MEMORY[0x263F23B58]);
  id v29 = [*(id *)(a1 + 32) competition];
  uint64_t v30 = [v29 preferredVictoryBadgeStyles];
  int64_t v31 = [*(id *)(a1 + 32) competition];
  objc_msgSend(v28, "setStyles:count:", v30, objc_msgSend(v31, "preferredVictoryBadgeStylesCount"));

  __int16 v32 = [v28 data];
  MEMORY[0x24C5577E0](a2, @"preferred_victory_badge_styles", v32);

  id v33 = [*(id *)(a1 + 32) competition];
  MEMORY[0x24C5577F0](a2, @"maximum_points_per_day", [v33 maximumNumberOfPointsPerDay]);
}

void __72__ASDatabaseCompetitionEntity__competitionsWithPredicate_profile_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "Error instantiating database competitions during database retrieval: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_insertCompetitions:(uint64_t)a1 profile:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, (uint64_t)a2, a3, "Error inserting competitions %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end