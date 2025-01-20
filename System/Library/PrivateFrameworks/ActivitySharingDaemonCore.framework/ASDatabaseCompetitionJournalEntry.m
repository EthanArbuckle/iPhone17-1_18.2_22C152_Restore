@interface ASDatabaseCompetitionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (ASCodableDatabaseCompetition)databaseCompetition;
- (ASDatabaseCompetitionJournalEntry)initWithCoder:(id)a3;
- (ASDatabaseCompetitionJournalEntry)initWithDatabaseCompetition:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDatabaseCompetitionJournalEntry

- (ASDatabaseCompetitionJournalEntry)initWithDatabaseCompetition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDatabaseCompetitionJournalEntry;
  v6 = [(ASDatabaseCompetitionJournalEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databaseCompetition, a3);
  }

  return v7;
}

- (ASDatabaseCompetitionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDatabaseCompetitionJournalEntry;
  id v5 = [(HDJournalEntry *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"competition"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F23B48]) initWithData:v6];
    databaseCompetition = v5->_databaseCompetition;
    v5->_databaseCompetition = (ASCodableDatabaseCompetition *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASDatabaseCompetitionJournalEntry;
  id v4 = a3;
  [(HDJournalEntry *)&v8 encodeWithCoder:v4];
  id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
  v6 = [(ASCodableDatabaseCompetition *)self->_databaseCompetition data];
  uint64_t v7 = (void *)[v5 initWithData:v6];
  [v4 encodeObject:v7 forKey:@"competition"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 database];
  id v17 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__ASDatabaseCompetitionJournalEntry_applyEntries_withProfile___block_invoke;
  v15[3] = &unk_265216530;
  id v16 = v5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__ASDatabaseCompetitionJournalEntry_applyEntries_withProfile___block_invoke_2;
  v12[3] = &unk_2652164E0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v16;
  id v14 = v9;
  BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v17 block:v15 inaccessibilityHandler:v12];
  id v11 = v17;

  if (!v10)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionJournalEntry applyEntries:withProfile:]();
    }
  }
}

uint64_t __62__ASDatabaseCompetitionJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "databaseCompetition", (void)v16);
        id v13 = +[ASDatabaseCompetitionEntity _insertCompetition:v12 database:v6 error:a3];

        if (!v13)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __62__ASDatabaseCompetitionJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntries:*(void *)(a1 + 40) error:a3];

  return v6;
}

- (ASCodableDatabaseCompetition)databaseCompetition
{
  return self->_databaseCompetition;
}

- (void).cxx_destruct
{
}

+ (void)applyEntries:withProfile:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error inserting journaled competitions %@: %{public}@");
}

@end