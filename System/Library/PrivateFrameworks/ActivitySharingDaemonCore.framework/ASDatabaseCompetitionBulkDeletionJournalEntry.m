@interface ASDatabaseCompetitionBulkDeletionJournalEntry
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation ASDatabaseCompetitionBulkDeletionJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 database];
  id v17 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__ASDatabaseCompetitionBulkDeletionJournalEntry_applyEntries_withProfile___block_invoke;
  v15[3] = &unk_265216530;
  id v16 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ASDatabaseCompetitionBulkDeletionJournalEntry_applyEntries_withProfile___block_invoke_2;
  v12[3] = &unk_2652164E0;
  id v8 = v16;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v17 block:v15 inaccessibilityHandler:v12];
  id v11 = v17;

  if (!v10)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionBulkDeletionJournalEntry applyEntries:withProfile:]();
    }
  }
}

BOOL __74__ASDatabaseCompetitionBulkDeletionJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [MEMORY[0x263F434D0] truePredicate];
  id v6 = [*(id *)(a1 + 32) database];
  BOOL v7 = +[HDHealthEntity deleteEntitiesWithPredicate:v5 healthDatabase:v6 error:a3];

  return v7;
}

uint64_t __74__ASDatabaseCompetitionBulkDeletionJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntries:*(void *)(a1 + 40) error:a3];

  return v6;
}

+ (void)applyEntries:withProfile:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error applying journal delete for all competitions %@: %{public}@");
}

@end