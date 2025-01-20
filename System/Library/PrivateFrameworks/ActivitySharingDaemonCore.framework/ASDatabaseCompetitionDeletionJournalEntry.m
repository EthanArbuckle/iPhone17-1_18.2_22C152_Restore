@interface ASDatabaseCompetitionDeletionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (ASDatabaseCompetitionDeletionJournalEntry)initWithCoder:(id)a3;
- (ASDatabaseCompetitionDeletionJournalEntry)initWithFriendUUID:(id)a3 type:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDatabaseCompetitionDeletionJournalEntry

- (ASDatabaseCompetitionDeletionJournalEntry)initWithFriendUUID:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDatabaseCompetitionDeletionJournalEntry;
  v8 = [(ASDatabaseCompetitionDeletionJournalEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_friendUUID, a3);
    v9->_type = a4;
  }

  return v9;
}

- (ASDatabaseCompetitionDeletionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDatabaseCompetitionDeletionJournalEntry;
  v5 = [(HDJournalEntry *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendUUID"];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F08C38], "hk_UUIDWithData:", v6);
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v7;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDatabaseCompetitionDeletionJournalEntry;
  id v4 = a3;
  [(HDJournalEntry *)&v6 encodeWithCoder:v4];
  v5 = [(NSUUID *)self->_friendUUID hk_dataForUUIDBytes];
  [v4 encodeObject:v5 forKey:@"friendUUID"];

  [v4 encodeInteger:self->_type forKey:@"type"];
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
  id v18 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__ASDatabaseCompetitionDeletionJournalEntry_applyEntries_withProfile___block_invoke;
  v15[3] = &unk_265217F08;
  id v16 = v5;
  id v17 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__ASDatabaseCompetitionDeletionJournalEntry_applyEntries_withProfile___block_invoke_2;
  v12[3] = &unk_2652164E0;
  id v8 = v17;
  id v13 = v8;
  id v9 = v16;
  id v14 = v9;
  BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v18 block:v15 inaccessibilityHandler:v12];
  id v11 = v18;

  if (!v10)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB8], OS_LOG_TYPE_ERROR)) {
      +[ASDatabaseCompetitionDeletionJournalEntry applyEntries:withProfile:]();
    }
  }
}

uint64_t __70__ASDatabaseCompetitionDeletionJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = ASCompetitionPredicateForFriendUUIDAndType(*(void *)(*(void *)(*((void *)&v15 + 1) + 8 * v8) + 8), *(void *)(*(void *)(*((void *)&v15 + 1) + 8 * v8) + 16));
        BOOL v10 = [*(id *)(a1 + 40) database];
        BOOL v11 = +[HDHealthEntity deleteEntitiesWithPredicate:v9 healthDatabase:v10 error:a3];

        if (!v11)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __70__ASDatabaseCompetitionDeletionJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntries:*(void *)(a1 + 40) error:a3];

  return v6;
}

- (void).cxx_destruct
{
}

+ (void)applyEntries:withProfile:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Error applying journal deletes for competitions %@: %{public}@");
}

@end