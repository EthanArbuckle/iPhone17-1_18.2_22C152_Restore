@interface SGQuickResponsesStore
+ (BOOL)isProfane:(id)a3 inLocales:(id)a4;
+ (SGQuickResponsesStore)sharedInstance;
+ (id)instanceInMemory;
+ (id)keyWithLanguage:(id)a3 andResponse:(id)a4;
+ (void)warmup;
- (BOOL)addingMessageExceedsBatchLimit:(unint64_t)a3 tableLimit:(unint64_t)a4 message:(id)a5 language:(id)a6 prompt:(id)a7 recipientHandle:(id)a8 sentAt:(id)a9;
- (BOOL)deltaForResponsesOnRow:(id)a3 completion:(id)a4;
- (BOOL)frailReadTransaction:(id)a3;
- (BOOL)frailWriteTransaction:(id)a3;
- (BOOL)resetDbIfNeededCompareWithCompatibilityVersion:(unint64_t)a3;
- (SGQuickResponsesStore)init;
- (double)getPerRecipientCountForReply:(id)a3 language:(id)a4 recipient:(id)a5;
- (double)getUsageSpreadForReply:(id)a3 language:(id)a4;
- (id)_recordsForResponses:(id)a3 language:(id)a4;
- (id)embeddingForPrompt:(id)a3 language:(id)a4 embedder:(id)a5;
- (id)getModelVersion;
- (id)getProfanityLocale;
- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5;
- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6;
- (id)messagesForEval:(id)a3;
- (id)nearestCustomResponsesAndScoresToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14;
- (id)nearestCustomResponsesToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14;
- (id)recordsForResponses:(id)a3 language:(id)a4;
- (id)recordsForResponsesInternal:(id)a3 language:(id)a4;
- (unint64_t)countCustomResponsesAfterPruningWithMinimumCountThreshold:(double)a3;
- (unint64_t)countCustomResponsesAfterTruncatingTable:(unint64_t)a3;
- (unint64_t)designateFilteringBatch:(unint64_t)a3;
- (void)_addCustomResponseToDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10;
- (void)_incrementCustomResponseInDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10;
- (void)addDisplayedToResponses:(id)a3 language:(id)a4;
- (void)addSelectedToResponse:(id)a3 language:(id)a4;
- (void)addWrittenToResponse:(id)a3 language:(id)a4 isMatch:(BOOL)a5;
- (void)calculateUsageSpreads;
- (void)decayAllCustomResponsesWithDecayFactor:(double)a3 filteringBatchSize:(unint64_t)a4;
- (void)destroyInstanceInMemory;
- (void)filterBatchWithMinimumDistinctRecipients:(unint64_t)a3 minimumReplyOccurences:(unint64_t)a4;
- (void)prunePerRecipientTableWithMaxRows:(unint64_t)a3;
- (void)recordKnownCustomResponsesInBatchWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4;
- (void)recordMessagesInBatchAsCustomResponsesWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4;
- (void)resetCustomResponsesAndResetMessages:(BOOL)a3;
- (void)resetCustomResponsesForEval:(id)a3;
- (void)setProfanityLocale:(id)a3 andModelVersion:(int64_t)a4;
@end

@implementation SGQuickResponsesStore

- (void).cxx_destruct
{
}

- (double)getUsageSpreadForReply:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = 0xBFF0000000000000;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke;
  v12[3] = &unk_2647EAD88;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = @"SELECT usage_spread FROM custom_responses WHERE reply=$reply AND language=$language";
  v16 = &v17;
  [(SGQuickResponsesStore *)self frailReadTransaction:v12];
  double v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_2;
  v8[3] = &unk_2647EA860;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_3;
  v7[3] = &unk_2647EA7E8;
  v7[4] = *(void *)(a1 + 56);
  [a2 prepAndRunQuery:v6 onPrep:v8 onRow:v7 onError:a3];
}

void __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:*(void *)(a1 + 40)];
}

uint64_t __57__SGQuickResponsesStore_getUsageSpreadForReply_language___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumnAlias:"usage_spread"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x263F61ED0];
}

- (double)getPerRecipientCountForReply:(id)a3 language:(id)a4 recipient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = (double *)&v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke;
  v16[3] = &unk_2647EAD60;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  unint64_t v20 = @"SELECT decayed_times_used FROM cr_per_recipient_counts WHERE reply=$reply AND language=$language AND recipient=$recipient";
  v21 = &v22;
  [(SGQuickResponsesStore *)self frailReadTransaction:v16];
  double v14 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_2;
  v8[3] = &unk_2647EA900;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_3;
  v7[3] = &unk_2647EA7E8;
  v7[4] = *(void *)(a1 + 64);
  [a2 prepAndRunQuery:v6 onPrep:v8 onRow:v7 onError:a3];
}

void __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:a1[5]];
  [v4 bindNamedParam:"$recipient" toNSString:a1[6]];
}

uint64_t __73__SGQuickResponsesStore_getPerRecipientCountForReply_language_recipient___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 getDoubleForColumnAlias:"decayed_times_used"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x263F61ED0];
}

- (void)destroyInstanceInMemory
{
  readerWriter = self->_readerWriter;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SGQuickResponsesStore_destroyInstanceInMemory__block_invoke;
  v3[3] = &unk_2647EAD38;
  v3[4] = self;
  v3[5] = a2;
  [(_PASLock *)readerWriter runWithLockAcquired:v3];
}

void __48__SGQuickResponsesStore_destroyInstanceInMemory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getObject];
  v5 = [v4 db];
  char v6 = [v5 isInMemory];

  if ((v6 & 1) == 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SGQuickResponsesStore.m", 1237, @"Invalid parameter not satisfying: %@", @"flakyDatabaseHandle.getObject.db.isInMemory" object file lineNumber description];
  }
  [v3 destroyCachedObject];
  id v7 = [v3 peekAtCachedObject];

  if (v7)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SGQuickResponsesStore.m" lineNumber:1239 description:@"SGQuickResponsesStore failed to destroy instance in memory."];
  }
}

- (BOOL)deltaForResponsesOnRow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke;
  v11[3] = &unk_2647EAD10;
  id v16 = v6;
  id v17 = v7;
  id v12 = @"SELECT t1.lang_response AS lang_response        ,CASE            WHEN t2.displayed IS NULL THEN t1.displayed            ELSE t1.displayed - t2.displayed         END AS displayed        ,CASE            WHEN t2.selected IS NULL THEN t1.selected            ELSE t1.selected - t2.selected         END AS selected        ,CASE            WHEN t2.matched IS NULL THEN t1.matched            ELSE t1.matched - t2.matched         END AS matched FROM responses t1 LEFT JOIN responses_snapshot t2     ON t1.lang_response = t2.lang_response ORDER BY RANDOM() ";
  id v13 = @"DROP TABLE responses_snapshot";
  double v14 = @"CREATE TABLE responses_snapshot AS     SELECT *     FROM responses ";
  v15 = @"CREATE INDEX idx_responses_snapshot_lang_response ON responses_snapshot (lang_response)";
  id v8 = v7;
  id v9 = v6;
  LOBYTE(self) = [(SGQuickResponsesStore *)self frailWriteTransaction:v11];

  return (char)self;
}

void __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__605;
  uint64_t v22 = __Block_byref_object_dispose__606;
  id v23 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  double v14 = __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke_2;
  v15 = &unk_2647EACE8;
  id v16 = *(id *)(a1 + 64);
  id v17 = &v18;
  LOBYTE(v7) = [v5 prepAndRunQuery:v7 onPrep:0 onRow:&v12 onError:v6];

  if (v7)
  {
    if (v19[5])
    {
      v6[2](v6);
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 72);
      if (v10
        && ((*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 16))(v10, 0, v8, v9),
            (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        ((void (*)(void (**)(void), void *))v6[2])(v6, v11);
      }
      else if (objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", *(void *)(a1 + 40), 0, 0, v6, v12, v13, v14, v15)&& objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", *(void *)(a1 + 48), 0, 0, v6))
      {
        [v5 prepAndRunQuery:*(void *)(a1 + 56) onPrep:0 onRow:0 onError:v6];
      }
    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __59__SGQuickResponsesStore_deltaForResponsesOnRow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 getNSStringForColumnAlias:"lang_response"];
    uint64_t v6 = [v4 getInt64ForColumnAlias:"displayed"];
    if (v6 != (int)v6)
    {
      uint64_t v7 = sgLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = v6;
        _os_log_fault_impl(&dword_226E32000, v7, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas displayed value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        goto LABEL_27;
      }
      uint64_t v6 = (v6 >> 63) ^ 0x7FFFFFFF;
    }
    uint64_t v8 = [v4 getInt64ForColumnAlias:"selected"];
    if (v8 != (int)v8)
    {
      uint64_t v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = v8;
        _os_log_fault_impl(&dword_226E32000, v9, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas selected value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        goto LABEL_27;
      }
      uint64_t v8 = (v8 >> 63) ^ 0x7FFFFFFF;
    }
    uint64_t v10 = [v4 getInt64ForColumnAlias:"matched"];
    if (v10 == (int)v10)
    {
LABEL_17:
      if (v5)
      {
        uint64_t v12 = [[SGQuickResponsesEngagementDeltas alloc] initWithLangResponse:v5 displayed:v6 selected:v8 matched:v10];
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        id obj = *(id *)(v13 + 40);
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
        objc_storeStrong((id *)(v13 + 40), obj);
      }
      else
      {
        id v16 = sgLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_226E32000, v16, OS_LOG_TYPE_ERROR, "Language in deltaForResponsesOnRow was null, continuing to iterate as best effort", buf, 2u);
        }

        uint64_t v14 = *MEMORY[0x263F61EC8];
      }

      goto LABEL_26;
    }
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v10;
      _os_log_fault_impl(&dword_226E32000, v11, OS_LOG_TYPE_FAULT, "SGQuickResponsesEngagementDeltas matched value %lld is out of range for int32_t, casting to boundary value", buf, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      uint64_t v10 = (v10 >> 63) ^ 0x7FFFFFFF;
      goto LABEL_17;
    }
LABEL_27:
    abort();
  }
  v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_226E32000, v15, OS_LOG_TYPE_ERROR, "Row returned in deltaForResponsesOnRow was null, continuing to iterate as best effort", buf, 2u);
  }

  uint64_t v14 = *MEMORY[0x263F61EC8];
LABEL_26:

  return v14;
}

- (unint64_t)countCustomResponsesAfterTruncatingTable:(unint64_t)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke;
  v13[3] = &unk_2647EA9C0;
  uint64_t v14 = @"SELECT COUNT(ROWID) as c from custom_responses";
  v15 = &v16;
  [(SGQuickResponsesStore *)self frailReadTransaction:v13];
  unint64_t v5 = v17[3];
  if (v5 > a3)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_3;
    v10[3] = &unk_2647EA998;
    id v11 = @"DELETE FROM custom_responses ORDER BY decayed_times_used ASC LIMIT $table_limit";
    unint64_t v12 = v5 - a3;
    if ([(SGQuickResponsesStore *)self frailWriteTransaction:v10])
    {
      v17[3] = a3;
    }
    else
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_5;
      v7[3] = &unk_2647EA9C0;
      uint64_t v8 = @"SELECT COUNT(ROWID) as c from custom_responses";
      uint64_t v9 = &v16;
      [(SGQuickResponsesStore *)self frailReadTransaction:v7];
    }
    unint64_t v5 = v17[3];
  }

  _Block_object_dispose(&v16, 8);
  return v5;
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_6;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumnAlias:"c"];
  return *MEMORY[0x263F61ED0];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$table_limit" toInt64:*(void *)(a1 + 32)];
}

uint64_t __66__SGQuickResponsesStore_countCustomResponsesAfterTruncatingTable___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumnAlias:"c"];
  return *MEMORY[0x263F61ED0];
}

- (unint64_t)countCustomResponsesAfterPruningWithMinimumCountThreshold:(double)a3
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke;
  v13[3] = &unk_2647EA998;
  double v15 = a3;
  uint64_t v14 = @"DELETE FROM custom_responses WHERE decayed_times_used < $threshold";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v13];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_3;
  v6[3] = &unk_2647EA9C0;
  uint64_t v7 = @"SELECT COUNT(ROWID) as c from custom_responses";
  uint64_t v8 = &v9;
  [(SGQuickResponsesStore *)self frailReadTransaction:v6];
  unint64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_4;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumnAlias:"c"];
  return *MEMORY[0x263F61ED0];
}

uint64_t __83__SGQuickResponsesStore_countCustomResponsesAfterPruningWithMinimumCountThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$threshold" toDouble:*(double *)(a1 + 32)];
}

- (void)decayAllCustomResponsesWithDecayFactor:(double)a3 filteringBatchSize:(unint64_t)a4
{
  long double v5 = pow(a3, (double)a4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke;
  v9[3] = &unk_2647EAB48;
  long double v12 = v5;
  uint64_t v10 = @"UPDATE custom_responses SET prompt_embedding = $prompt_embedding, decayed_times_used = decayed_times_used * $decay_factor WHERE rowid = $rowid";
  uint64_t v11 = @"SELECT rowid, prompt_embedding from custom_responses";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v9];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_4;
  v6[3] = &unk_2647EA998;
  long double v8 = v5;
  uint64_t v7 = @"UPDATE cr_per_recipient_counts SET decayed_times_used = decayed_times_used * $decay_factor";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v6];
}

void __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_2;
  v10[3] = &unk_2647EACC0;
  uint64_t v14 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 prepAndRunQuery:v7 onPrep:0 onRow:v10 onError:v8];
}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_5;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$decay_factor" toDouble:*(double *)(a1 + 32)];
}

uint64_t __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnAlias:"rowid"];
  id v5 = objc_alloc(MEMORY[0x263F61968]);
  id v6 = [v3 getNSDataForColumnAlias:"prompt_embedding"];

  uint64_t v7 = (void *)[v6 mutableCopy];
  id v8 = (void *)[v5 initWithData:v7];

  double v9 = *(double *)(a1 + 56);
  *(float *)&double v9 = v9;
  [v8 scaleInPlaceWithFactor:v9];
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_3;
  v16[3] = &unk_2647EAC98;
  uint64_t v18 = *(void *)(a1 + 56);
  id v17 = v8;
  uint64_t v19 = v4;
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = v8;
  [v10 prepAndRunQuery:v11 onPrep:v16 onRow:0 onError:v12];
  uint64_t v14 = (unsigned __int8 *)MEMORY[0x263F61EC8];

  return *v14;
}

void __83__SGQuickResponsesStore_decayAllCustomResponsesWithDecayFactor_filteringBatchSize___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v5 = a2;
  [v5 bindNamedParam:"$decay_factor" toDouble:v3];
  uint64_t v4 = [*(id *)(a1 + 32) data];
  [v5 bindNamedParam:"$prompt_embedding" toNSData:v4];

  [v5 bindNamedParam:"$rowid" toInt64:*(void *)(a1 + 48)];
}

- (id)nearestCustomResponsesToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  LOBYTE(v23) = a12;
  uint64_t v14 = -[SGQuickResponsesStore nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:](self, "nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:", a3, a4, a5, a9, a10, a11, v23);
  double v15 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) first];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  return v15;
}

- (id)nearestCustomResponsesAndScoresToPromptEmbedding:(id)a3 recipient:(id)a4 limit:(unint64_t)a5 withinRadius:(float)a6 responseCountExponent:(float)a7 minimumDecayedCount:(float)a8 compatibilityVersion:(unint64_t)a9 language:(id)a10 locale:(id)a11 allowProfanity:(BOOL)a12 minimumTimeInterval:(double)a13 usageSpreadExponent:(float)a14
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v26 = a4;
  id v27 = a10;
  id v82 = a11;
  v28 = [(SGQuickResponsesStore *)self getModelVersion];
  uint64_t v29 = [v28 integerValue];

  v80 = v27;
  if (v29 == a9)
  {
    unint64_t v81 = a5;
    id v79 = v26;
    v30 = (void *)[objc_alloc(MEMORY[0x263F61948]) initWithNumbers:v25];
    v31 = objc_opt_new();
    v32 = sgLogHandle();
    os_signpost_id_t v33 = os_signpost_id_generate(v32);

    v34 = sgLogHandle();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SelectCustomResponseRows", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke;
    v87[3] = &unk_2647EAC10;
    id v88 = v27;
    float v95 = a8;
    double v94 = a13;
    id v76 = v30;
    id v89 = v76;
    id v90 = v26;
    v91 = self;
    float v96 = a14;
    float v97 = a7;
    float v98 = a6;
    id v78 = v31;
    id v92 = v78;
    v93 = @"SELECT reply, prompt_embedding, decayed_times_used, usage_spread FROM custom_responses WHERE language = $language   AND decayed_times_used >= $minimum_decayed_count   AND last_seen - first_seen >= $minimum_time_interval";
    [(SGQuickResponsesStore *)self frailReadTransaction:v87];
    v36 = sgLogHandle();
    v37 = v36;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v37, OS_SIGNPOST_INTERVAL_END, v33, "SelectCustomResponseRows", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v38 = sgLogHandle();
    os_signpost_id_t v39 = os_signpost_id_generate(v38);

    v40 = sgLogHandle();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "SortCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v42 = v78;
    [v78 sortUsingComparator:&__block_literal_global_210];
    v43 = sgLogHandle();
    v44 = v43;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v44, OS_SIGNPOST_INTERVAL_END, v39, "SortCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v45 = sgLogHandle();
    os_signpost_id_t v46 = os_signpost_id_generate(v45);

    v47 = sgLogHandle();
    v48 = v47;
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "DedupeCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v49 = +[SGDeduperML bucketerWithMapping:&__block_literal_global_215];
    v77 = +[SGDeduperML dedupe:v78 bucketer:v49 resolver:&__block_literal_global_220];

    v50 = sgLogHandle();
    v51 = v50;
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v51, OS_SIGNPOST_INTERVAL_END, v46, "DedupeCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    v52 = [(SGQuickResponsesStore *)self getProfanityLocale];
    v53 = v52;
    if (!v82 || a12 || ([v52 isEqualToString:v82] & 1) != 0)
    {
      v54 = v77;
      v55 = v76;
      if ([v77 count] <= v81)
      {
        id v56 = v77;
      }
      else
      {
        objc_msgSend(v77, "subarrayWithRange:", 0, v81);
        id v56 = (id)objc_claimAutoreleasedReturnValue();
      }
      v57 = v56;
    }
    else
    {
      v74 = v53;
      id v75 = v25;
      v58 = sgLogHandle();
      os_signpost_id_t v59 = os_signpost_id_generate(v58);

      v60 = sgLogHandle();
      v61 = v60;
      if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_226E32000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "RemoveProfaneCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
      }

      v57 = objc_opt_new();
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v62 = v77;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v83 objects:v101 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v84;
LABEL_33:
        uint64_t v66 = 0;
        while (1)
        {
          if (*(void *)v84 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v83 + 1) + 8 * v66);
          v68 = [v67 first];
          id v100 = v82;
          v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v100 count:1];
          BOOL v70 = +[SGQuickResponsesStore isProfane:v68 inLocales:v69];

          if (!v70)
          {
            [v57 addObject:v67];
            if ([v57 count] == v81) {
              break;
            }
          }
          if (v64 == ++v66)
          {
            uint64_t v64 = [v62 countByEnumeratingWithState:&v83 objects:v101 count:16];
            if (v64) {
              goto LABEL_33;
            }
            break;
          }
        }
      }

      v71 = sgLogHandle();
      v72 = v71;
      if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_226E32000, v72, OS_SIGNPOST_INTERVAL_END, v59, "RemoveProfaneCustomResponses", (const char *)&unk_226E6BA6D, buf, 2u);
      }

      id v25 = v75;
      v55 = v76;
      v42 = v78;
      id v26 = v79;
      v54 = v77;
      v53 = v74;
    }
  }
  else
  {
    v57 = (void *)MEMORY[0x263EFFA68];
  }

  return v57;
}

void __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 72);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2;
  v17[3] = &unk_2647EABC0;
  id v18 = *(id *)(a1 + 32);
  int v20 = *(_DWORD *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_3;
  v9[3] = &unk_2647EABE8;
  id v10 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  int v15 = *(_DWORD *)(a1 + 92);
  uint64_t v8 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 96);
  id v14 = *(id *)(a1 + 64);
  [a2 prepAndRunQuery:v6 onPrep:v17 onRow:v9 onError:a3];
}

id __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2_217(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  double v3 = [a2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v2 arrayWithObject:v3];

  return v4;
}

id __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_212(uint64_t a1, void *a2)
{
  v2 = [a2 first];
  double v3 = +[SGQuickResponsesInference normalizeStringForDeduping:v2];

  return v3;
}

uint64_t __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_207(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 second];
  uint64_t v6 = [v4 second];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$language" toNSString:v3];
  [v4 bindNamedParam:"$minimum_decayed_count" toDouble:*(float *)(a1 + 48)];
  [v4 bindNamedParam:"$minimum_time_interval" toDouble:*(double *)(a1 + 40)];
}

uint64_t __237__SGQuickResponsesStore_nearestCustomResponsesAndScoresToPromptEmbedding_recipient_limit_withinRadius_responseCountExponent_minimumDecayedCount_compatibilityVersion_language_locale_allowProfanity_minimumTimeInterval_usageSpreadExponent___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = sgLogHandle();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = sgLogHandle();
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v43) = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SingleCustomResponseRow", (const char *)&unk_226E6BA6D, (uint8_t *)&v43, 2u);
  }

  uint64_t v8 = [v3 getNSStringForColumnAlias:"reply"];
  if (!v8)
  {
    id v27 = sgLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    LOWORD(v43) = 0;
    v28 = "SGQuickResponsesStore: Unexpected null value for custom_responses.reply";
    goto LABEL_33;
  }
  [v3 getDoubleForColumnAlias:"decayed_times_used"];
  double v10 = v9;
  uint64_t v11 = [v3 getNSDataForColumnAlias:"prompt_embedding"];
  if (!v11)
  {
    id v27 = sgLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    LOWORD(v43) = 0;
    v28 = "SGQuickResponsesStore: Unexpected null value for custom_responses.prompt_embedding";
LABEL_33:
    _os_log_fault_impl(&dword_226E32000, v27, OS_LOG_TYPE_FAULT, v28, (uint8_t *)&v43, 2u);
LABEL_16:

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      id v13 = 0;
      uint64_t v12 = 0;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  uint64_t v12 = (void *)v11;
  id v13 = (void *)[objc_alloc(MEMORY[0x263F61968]) initWithData:v11];
  *(float *)&double v14 = v10;
  [v13 scaleInPlaceWithInversedFactor:v14];
  uint64_t v15 = [v13 count];
  uint64_t v16 = [*(id *)(a1 + 32) count];
  uint64_t v17 = sgLogHandle();
  id v18 = v17;
  if (v15 == v16)
  {
    os_signpost_id_t v19 = os_signpost_id_generate(v17);

    int v20 = sgLogHandle();
    uint64_t v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v43) = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ComputeCustomResponseDistance", (const char *)&unk_226E6BA6D, (uint8_t *)&v43, 2u);
    }

    double v22 = 0.0;
    if (*(void *)(a1 + 40))
    {
      double v23 = 1.0;
      if (*(float *)(a1 + 72) > 0.0)
      {
        [v3 getDoubleForColumnAlias:"usage_spread"];
        long double v25 = v24;
        [*(id *)(a1 + 48) getPerRecipientCountForReply:v8 language:*(void *)(a1 + 56) recipient:*(void *)(a1 + 40)];
        double v22 = v26;
        double v23 = pow(v25, *(float *)(a1 + 72));
      }
    }
    else
    {
      double v23 = 1.0;
    }
    [v13 cosineDistanceFrom:*(void *)(a1 + 32)];
    float v30 = v29 / pow(v22 * (1.0 - v23) + v23 * v10, *(float *)(a1 + 76));
    v31 = sgLogHandle();
    v32 = v31;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(v43) = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v32, OS_SIGNPOST_INTERVAL_END, v19, "ComputeCustomResponseDistance", (const char *)&unk_226E6BA6D, (uint8_t *)&v43, 2u);
    }

    if (*(float *)(a1 + 80) > v30)
    {
      v34 = *(void **)(a1 + 64);
      v35 = (void *)MEMORY[0x263F61EA8];
      *(float *)&double v33 = v30;
      v36 = [NSNumber numberWithFloat:v33];
      v37 = [v35 tupleWithFirst:v8 second:v36];
      [v34 addObject:v37];
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    uint64_t v41 = [v13 count];
    uint64_t v42 = [*(id *)(a1 + 32) count];
    int v43 = 134218240;
    uint64_t v44 = v41;
    __int16 v45 = 2048;
    uint64_t v46 = v42;
    _os_log_fault_impl(&dword_226E32000, v18, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: mis-matched dimensions (a possible plist error) between embedding and densePromptEmbedding in store: %tu v,s. %tu", (uint8_t *)&v43, 0x16u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
LABEL_21:
  }
    abort();
LABEL_28:
  v38 = sgLogHandle();
  os_signpost_id_t v39 = v38;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(v43) = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v39, OS_SIGNPOST_INTERVAL_END, v5, "SingleCustomResponseRow", (const char *)&unk_226E6BA6D, (uint8_t *)&v43, 2u);
  }

  return *MEMORY[0x263F61EC8];
}

- (void)prunePerRecipientTableWithMaxRows:(unint64_t)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke;
  v63[3] = &unk_2647EA9C0;
  uint64_t v64 = @"SELECT COUNT(ROWID) as n FROM cr_per_recipient_counts";
  uint64_t v65 = &v66;
  [(SGQuickResponsesStore *)self frailReadTransaction:v63];
  if (v67[3] > a3)
  {
    id v4 = objc_opt_new();
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_3;
    v60[3] = &unk_2647EAAD0;
    id v5 = v4;
    id v61 = v5;
    id v62 = @"SELECT reply, language, COUNT(ROWID) as n FROM cr_per_recipient_counts GROUP BY reply, language";
    [(SGQuickResponsesStore *)self frailReadTransaction:v60];
    __int16 v45 = (void *)[v5 mutableCopy];
    uint64_t v47 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v57 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          double v10 = (void *)MEMORY[0x263F61EA8];
          uint64_t v11 = [obj objectForKeyedSubscript:v9];
          uint64_t v12 = [v10 tupleWithFirst:v9 second:v11];

          [v47 addObject:v12];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
      }
      while (v6);
    }

    int v43 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"second" ascending:0];
    v71 = v43;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
    [v47 sortUsingDescriptors:v13];

    uint64_t v14 = v67[3];
    uint64_t v15 = [v47 count];
    uint64_t v16 = v14 - a3;
    if (v14 != a3)
    {
      unint64_t v17 = v15;
      unsigned int v41 = v15 - 1;
      while (1)
      {
        if (v17 < 2)
        {
          unsigned int v19 = 0;
        }
        else
        {
          for (uint64_t j = 1; j != v17; ++j)
          {
            unsigned int v19 = j - 1;
            int v20 = [v47 objectAtIndexedSubscript:j - 1];
            uint64_t v44 = [v20 first];
            uint64_t v21 = [v45 objectForKeyedSubscript:v44];
            uint64_t v22 = [v21 integerValue];
            double v23 = [v47 objectAtIndexedSubscript:j];
            double v24 = [v23 first];
            long double v25 = [v45 objectForKeyedSubscript:v24];
            LOBYTE(v22) = v22 == [v25 integerValue];

            if ((v22 & 1) == 0) {
              goto LABEL_17;
            }
          }
          unsigned int v19 = v41;
        }
LABEL_17:
        while ((v19 & 0x80000000) == 0)
        {
          double v26 = [v47 objectAtIndexedSubscript:v19];
          id v27 = [v26 first];

          if (!v27)
          {
            v31 = [MEMORY[0x263F08690] currentHandler];
            [v31 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 846, @"Invalid parameter not satisfying: %@", @"k" object file lineNumber description];
          }
          v28 = NSNumber;
          float v29 = [v45 objectForKeyedSubscript:v27];
          float v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "integerValue") - 1);
          [v45 setObject:v30 forKeyedSubscript:v27];

          --v19;
          if (!--v16) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_21:
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v32 = v45;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v70 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v53 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v52 + 1) + 8 * k);
          v37 = [obj objectForKeyedSubscript:v36];
          uint64_t v38 = [v37 integerValue];
          os_signpost_id_t v39 = [v32 objectForKeyedSubscript:v36];
          uint64_t v40 = [v39 integerValue];

          if (v38 - v40 >= 1)
          {
            v49[0] = MEMORY[0x263EF8330];
            v49[1] = 3221225472;
            v49[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_5;
            v49[3] = &unk_2647EAB48;
            uint64_t v51 = v38 - v40;
            v49[4] = v36;
            v50 = @"DELETE FROM cr_per_recipient_counts WHERE reply=$reply AND language=$language ORDER BY decayed_times_used ASC LIMIT $n_rows ";
            [(SGQuickResponsesStore *)self frailWriteTransaction:v49];
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v70 count:16];
      }
      while (v33);
    }
  }
  _Block_object_dispose(&v66, 8);
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

void __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_4;
  v6[3] = &unk_2647EAB70;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [a2 prepAndRunQuery:v5 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_5(void *a1, void *a2, uint64_t a3)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_6;
  v7[3] = &unk_2647EAB20;
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  void v7[4] = a1[4];
  void v7[5] = v5;
  return [a2 prepAndRunQuery:v4 onPrep:v7 onRow:0 onError:a3];
}

void __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 first];
  [v6 bindNamedParam:"$reply" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) second];
  [v6 bindNamedParam:"$language" toNSString:v5];

  [v6 bindNamedParam:"$n_rows" toInt64:*(void *)(a1 + 40)];
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"reply"];
  uint64_t v5 = [v3 getNSStringForColumnAlias:"language"];
  uint64_t v6 = [v3 getInt64ForColumnAlias:"n"];

  id v7 = [MEMORY[0x263F61EA8] tupleWithFirst:v4 second:v5];
  uint64_t v8 = [NSNumber numberWithLongLong:v6];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];

  uint64_t v9 = (unsigned __int8 *)MEMORY[0x263F61EC8];
  return *v9;
}

uint64_t __59__SGQuickResponsesStore_prunePerRecipientTableWithMaxRows___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"n"];
  return *MEMORY[0x263F61ED0];
}

- (void)calculateUsageSpreads
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__SGQuickResponsesStore_calculateUsageSpreads__block_invoke;
  v2[3] = &unk_2647EAAF8;
  id v3 = @"UPDATE custom_responses SET usage_spread = (SELECT CAST(u AS FLOAT)/c FROM    (SELECT count(distinct(recipient)) AS u FROM messages WHERE messages.reply=custom_responses.reply AND messages.language=custom_responses.language),    (SELECT count(distinct(recipient)) AS c FROM messages))";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v2];
}

uint64_t __46__SGQuickResponsesStore_calculateUsageSpreads__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

- (void)recordMessagesInBatchAsCustomResponsesWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4
{
  id v6 = a3;
  if (![(SGQuickResponsesStore *)self resetDbIfNeededCompareWithCompatibilityVersion:a4])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke;
    v7[3] = &unk_2647EA9E8;
    uint64_t v8 = @"SELECT rowid, reply, language, prompt, sent_at, recipient FROM messages WHERE filtering AND NOT filtered";
    uint64_t v9 = self;
    double v10 = @"SELECT prompt_embedding FROM custom_responses WHERE reply=$reply AND language=$language";
    id v11 = v6;
    [(SGQuickResponsesStore *)self frailWriteTransaction:v7];
  }
}

void __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_2;
  v11[3] = &unk_2647EAB98;
  id v14 = *(id *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 48);
  void v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  [v10 prepAndRunQuery:v7 onPrep:0 onRow:v11 onError:v9];
}

uint64_t __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnAlias:"rowid"];
  id v5 = [v3 getNSStringForColumnAlias:"reply"];
  id v6 = [v3 getNSStringForColumnAlias:"language"];
  uint64_t v7 = [v3 getNSStringForColumnAlias:"prompt"];
  uint64_t v8 = [v3 getNSStringForColumnAlias:"recipient"];
  [v3 getDoubleForColumnAlias:"sent_at"];
  if (v7 && v6 && *(void *)(a1 + 56) && v5)
  {
    double v10 = v9;
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "embeddingForPrompt:language:embedder:", v7, v6);
    id v12 = (void *)v11;
    if (v11)
    {
      uint64_t v21 = (void *)v11;
      uint64_t v26 = 0;
      id v27 = &v26;
      uint64_t v28 = 0x3032000000;
      float v29 = __Block_byref_object_copy__605;
      float v30 = __Block_byref_object_dispose__606;
      id v31 = 0;
      id v13 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_3;
      v23[3] = &unk_2647EA860;
      id v20 = v5;
      id v24 = v20;
      id v19 = v6;
      id v25 = v19;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_4;
      v22[3] = &unk_2647EA7E8;
      v22[4] = &v26;
      id v12 = v21;
      [v13 prepAndRunQuery:v14 onPrep:v23 onRow:v22 onError:*(void *)(a1 + 64)];
      if (v27[5])
      {
        id v15 = objc_alloc(MEMORY[0x263F61968]);
        uint64_t v16 = (void *)[v15 initWithData:v27[5]];
        [v16 sumInPlaceWithVector:v21];
        [*(id *)(a1 + 32) _incrementCustomResponseInDb:*(void *)(a1 + 40) reply:v20 language:v19 embedding:v16 sentAt:v8 recipient:v4 messagesRowId:v10 onError:*(void *)(a1 + 64)];
      }
      else
      {
        [*(id *)(a1 + 32) _addCustomResponseToDb:*(void *)(a1 + 40) reply:v20 language:v19 embedding:v21 sentAt:v8 recipient:v4 messagesRowId:v10 onError:*(void *)(a1 + 64)];
      }
      uint64_t v17 = *MEMORY[0x263F61EC8];

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      uint64_t v17 = *MEMORY[0x263F61ED0];
    }
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F61EC8];
  }

  return v17;
}

void __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:*(void *)(a1 + 40)];
}

uint64_t __97__SGQuickResponsesStore_recordMessagesInBatchAsCustomResponsesWithEmbedder_compatibilityVersion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumnAlias:"prompt_embedding"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x263F61EC8];
}

- (id)messagesForEval:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke;
  v16[3] = &unk_2647EA9C0;
  uint64_t v17 = @"SELECT COUNT(*) as n FROM messages";
  id v18 = &v19;
  [(SGQuickResponsesStore *)self frailReadTransaction:v16];
  uint64_t v6 = v20[3];
  [v4 doubleValue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_3;
  v12[3] = &unk_2647EAB48;
  uint64_t v15 = (uint64_t)(v7 * (double)v6);
  id v8 = v5;
  id v13 = v8;
  uint64_t v14 = @"SELECT prompt, reply FROM messages ORDER BY sent_at DESC LIMIT $evalCount";
  [(SGQuickResponsesStore *)self frailReadTransaction:v12];
  double v9 = v14;
  id v10 = v8;

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

void __41__SGQuickResponsesStore_messagesForEval___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_4;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v5 = *(void *)(a1 + 40);
  void v8[4] = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SGQuickResponsesStore_messagesForEval___block_invoke_5;
  v6[3] = &unk_2647EAB70;
  id v7 = *(id *)(a1 + 32);
  [a2 prepAndRunQuery:v5 onPrep:v8 onRow:v6 onError:a3];
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$evalCount" toInt64:*(void *)(a1 + 32)];
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"prompt"];
  uint64_t v5 = [v3 getNSStringForColumnAlias:"reply"];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x263F61EA8] tupleWithFirst:v4 second:v5];
  [v6 addObject:v7];

  id v8 = (unsigned __int8 *)MEMORY[0x263F61EC8];
  return *v8;
}

uint64_t __41__SGQuickResponsesStore_messagesForEval___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"n"];
  return *MEMORY[0x263F61ED0];
}

- (void)resetCustomResponsesForEval:(id)a3
{
  id v4 = a3;
  [(SGQuickResponsesStore *)self resetCustomResponsesAndResetMessages:0];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke;
  v10[3] = &unk_2647EA9C0;
  uint64_t v11 = @"SELECT COUNT(*) as n FROM messages";
  id v12 = &v13;
  [(SGQuickResponsesStore *)self frailReadTransaction:v10];
  uint64_t v5 = v14[3];
  [v4 doubleValue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_3;
  v7[3] = &unk_2647EA998;
  id v8 = @"UPDATE messages SET filtered = true ORDER BY sent_at DESC LIMIT $evalCount";
  uint64_t v9 = (uint64_t)(v6 * (double)v5);
  [(SGQuickResponsesStore *)self frailWriteTransaction:v7];

  _Block_object_dispose(&v13, 8);
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$evalCount" toInt64:*(void *)(a1 + 32)];
}

uint64_t __53__SGQuickResponsesStore_resetCustomResponsesForEval___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"n"];
  return *MEMORY[0x263F61ED0];
}

- (void)resetCustomResponsesAndResetMessages:(BOOL)a3
{
  BOOL v3 = a3;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke;
  v18[3] = &unk_2647EAAF8;
  uint64_t v19 = @"DELETE FROM custom_responses";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_2;
  v16[3] = &unk_2647EAAF8;
  uint64_t v17 = @"DELETE FROM custom_responses_version";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v16];
  if (v3)
  {
    uint64_t v5 = &v11;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_3;
    uint64_t v14 = &unk_2647EAAF8;
    uint64_t v15 = @"DELETE FROM messages";
  }
  else
  {
    uint64_t v5 = &v6;
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_4;
    uint64_t v9 = &unk_2647EAAF8;
    id v10 = @"UPDATE messages SET filtering = false, filtered = false";
  }
  -[SGQuickResponsesStore frailWriteTransaction:](self, "frailWriteTransaction:", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

uint64_t __62__SGQuickResponsesStore_resetCustomResponsesAndResetMessages___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

- (BOOL)resetDbIfNeededCompareWithCompatibilityVersion:(unint64_t)a3
{
  uint64_t v5 = [(SGQuickResponsesStore *)self getModelVersion];
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = [v5 integerValue] != a3;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v9 = [v8 firstObject];

  if (v7
    || ([(SGQuickResponsesStore *)self getProfanityLocale],
        (id v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v11 = v10, v12 = [v10 isEqualToString:v9], v11, (v12 & 1) == 0))
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke;
    v18[3] = &unk_2647EAAF8;
    uint64_t v19 = @"DELETE FROM custom_responses";
    [(SGQuickResponsesStore *)self frailWriteTransaction:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke_2;
    v16[3] = &unk_2647EAAF8;
    uint64_t v17 = @"UPDATE messages SET filtering = false, filtered = false";
    [(SGQuickResponsesStore *)self frailWriteTransaction:v16];

    char v13 = 1;
LABEL_10:
    [(SGQuickResponsesStore *)self setProfanityLocale:v9 andModelVersion:a3];
    BOOL v14 = v13;
    goto LABEL_11;
  }
  char v13 = 0;
  BOOL v14 = 0;
  if (!v6) {
    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

uint64_t __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

uint64_t __72__SGQuickResponsesStore_resetDbIfNeededCompareWithCompatibilityVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

- (void)setProfanityLocale:(id)a3 andModelVersion:(int64_t)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke;
  v12[3] = &unk_2647EAAF8;
  char v13 = @"DELETE FROM custom_responses_version";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v12];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_2;
  v8[3] = &unk_2647EAB48;
  id v9 = v6;
  id v10 = @"INSERT INTO custom_responses_version (current_version, profanity_locale) VALUES($current_version, $profanity_locale)";
  int64_t v11 = a4;
  id v7 = v6;
  [(SGQuickResponsesStore *)self frailWriteTransaction:v8];
}

uint64_t __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepAndRunQuery:*(void *)(a1 + 32) onPrep:0 onRow:0 onError:a3];
}

void __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_3;
  v6[3] = &unk_2647EAB20;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  [a2 prepAndRunQuery:v5 onPrep:v6 onRow:0 onError:a3];
}

void __60__SGQuickResponsesStore_setProfanityLocale_andModelVersion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:"$current_version" toInt64:v3];
  [v4 bindNamedParam:"$profanity_locale" toNSString:*(void *)(a1 + 32)];
}

- (id)getModelVersion
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__605;
  int64_t v11 = __Block_byref_object_dispose__606;
  id v12 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SGQuickResponsesStore_getModelVersion__block_invoke;
  v4[3] = &unk_2647EA9C0;
  uint64_t v5 = @"SELECT current_version FROM custom_responses_version";
  id v6 = &v7;
  [(SGQuickResponsesStore *)self frailReadTransaction:v4];
  id v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __40__SGQuickResponsesStore_getModelVersion__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SGQuickResponsesStore_getModelVersion__block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __40__SGQuickResponsesStore_getModelVersion__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumnAlias:", "current_version"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x263F61ED0];
}

- (id)getProfanityLocale
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__605;
  int64_t v11 = __Block_byref_object_dispose__606;
  id v12 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SGQuickResponsesStore_getProfanityLocale__block_invoke;
  v4[3] = &unk_2647EA9C0;
  uint64_t v5 = @"SELECT profanity_locale FROM custom_responses_version";
  id v6 = &v7;
  [(SGQuickResponsesStore *)self frailReadTransaction:v4];
  id v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __43__SGQuickResponsesStore_getProfanityLocale__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SGQuickResponsesStore_getProfanityLocale__block_invoke_2;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __43__SGQuickResponsesStore_getProfanityLocale__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnAlias:"profanity_locale"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x263F61ED0];
}

- (void)filterBatchWithMinimumDistinctRecipients:(unint64_t)a3 minimumReplyOccurences:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke;
  v29[3] = &unk_2647EAA58;
  unint64_t v31 = a3;
  unint64_t v32 = a4;
  float v30 = @"UPDATE messages SET filtering = false, filtered = true WHERE filtering AND reply IN (SELECT reply FROM messages GROUP BY reply HAVING COUNT(DISTINCT(recipient)) < $recipients OR COUNT(reply) < $replies)";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v29];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__605;
  id v27 = __Block_byref_object_dispose__606;
  id v28 = 0;
  id v28 = (id)objc_opt_new();
  uint64_t v5 = [(SGQuickResponsesStore *)self getProfanityLocale];
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v5 = [v6 firstObject];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_3;
  v19[3] = &unk_2647EAAA8;
  id v7 = v5;
  uint64_t v22 = &v23;
  id v20 = v7;
  uint64_t v21 = @"SELECT rowid, reply FROM messages WHERE filtering";
  [(SGQuickResponsesStore *)self frailReadTransaction:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)v24[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_136;
        v13[3] = &unk_2647EAAD0;
        void v13[4] = v12;
        BOOL v14 = @"UPDATE messages SET filtering = false, filtered = true WHERE rowid = $row_id";
        [(SGQuickResponsesStore *)self frailWriteTransaction:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v33 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v23, 8);
}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2;
  v6[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  long long v7 = *(_OWORD *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_4;
  v9[3] = &unk_2647EAA80;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [a2 prepAndRunQuery:v6 onPrep:0 onRow:v9 onError:a3];
}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_136(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2_137;
  v6[3] = &unk_2647EA7C0;
  uint64_t v4 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2_137(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", "$row_id", objc_msgSend(v2, "integerValue"));
}

uint64_t __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_4(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"reply"];
  if (!v4)
  {
    uint64_t v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_fault_impl(&dword_226E32000, v5, OS_LOG_TYPE_FAULT, "SGQuickreponsesStore: Unexpected null value for custom_responses.reply", v12, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  uint64_t v6 = [v3 getInt64ForColumnAlias:"rowid"];
  v13[0] = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  BOOL v8 = +[SGQuickResponsesStore isProfane:v4 inLocales:v7];

  if (v8)
  {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = [NSNumber numberWithLongLong:v6];
    [v9 addObject:v10];
  }
  return *MEMORY[0x263F61EC8];
}

void __89__SGQuickResponsesStore_filterBatchWithMinimumDistinctRecipients_minimumReplyOccurences___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$recipients" toInt64:v3];
  [v4 bindNamedParam:"$replies" toInt64:*(void *)(a1 + 40)];
}

- (unint64_t)designateFilteringBatch:(unint64_t)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke;
  v5[3] = &unk_2647EAA10;
  BOOL v8 = &v10;
  unint64_t v9 = a3;
  uint64_t v6 = @"UPDATE messages SET filtering = true WHERE NOT filtered ORDER BY sent_at LIMIT $limit";
  id v7 = @"SELECT changes();";
  [(SGQuickResponsesStore *)self frailWriteTransaction:v5];
  unint64_t v3 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v3;
}

void __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_2;
  v10[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v10[4] = a1[7];
  if ([v5 prepAndRunQuery:v7 onPrep:v10 onRow:0 onError:v6])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_3;
    v9[3] = &unk_2647EA7E8;
    uint64_t v8 = a1[5];
    void v9[4] = a1[6];
    [v5 prepAndRunQuery:v8 onPrep:0 onRow:v9 onError:v6];
  }
}

uint64_t __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$limit" toInt64:*(void *)(a1 + 32)];
}

uint64_t __49__SGQuickResponsesStore_designateFilteringBatch___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x263F61ED0];
}

- (void)recordKnownCustomResponsesInBatchWithEmbedder:(id)a3 compatibilityVersion:(unint64_t)a4
{
  id v6 = a3;
  if (![(SGQuickResponsesStore *)self resetDbIfNeededCompareWithCompatibilityVersion:a4])
  {
    uint64_t v7 = objc_opt_new();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke;
    v9[3] = &unk_2647EA9E8;
    void v9[4] = self;
    id v10 = v7;
    uint64_t v11 = @"SELECT m.rowid, m.filtering, m.filtered, m.recipient, m.prompt, m.language, m.reply, m.sent_at, cr.prompt_embedding FROM messages as m, (SELECT reply, language, prompt_embedding from custom_responses) as cr WHERE m.filtering AND NOT m.filtered AND m.reply = cr.reply AND m.language = cr.language";
    id v12 = v6;
    id v8 = v7;
    [(SGQuickResponsesStore *)self frailWriteTransaction:v9];
  }
}

void __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke_2;
  v10[3] = &unk_2647EAB98;
  void v10[4] = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 prepAndRunQuery:v7 onPrep:0 onRow:v10 onError:v8];
}

uint64_t __92__SGQuickResponsesStore_recordKnownCustomResponsesInBatchWithEmbedder_compatibilityVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"language"];
  if (v4)
  {
    id v5 = [v3 getNSStringForColumnAlias:"recipient"];
    if (v5)
    {
      id v6 = [v3 getNSStringForColumnAlias:"reply"];
      uint64_t v7 = [v3 getNSStringForColumnAlias:"prompt"];
      uint64_t v8 = [v3 getInt64ForColumnAlias:"rowid"];
      [v3 getDoubleForColumnAlias:"sent_at"];
      double v10 = v9;
      id v11 = [*(id *)(a1 + 32) embeddingForPrompt:v7 language:v4 embedder:*(void *)(a1 + 56)];
      if (!v11)
      {
        uint64_t v16 = *MEMORY[0x263F61ED0];
        goto LABEL_18;
      }
      id v12 = [MEMORY[0x263F61EA8] tupleWithFirst:v6 second:v4];
      id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
      if (v13) {
        goto LABEL_7;
      }
      uint64_t v21 = v8;
      uint64_t v14 = [v3 getNSDataForColumnAlias:"prompt_embedding"];
      if (v14)
      {
        long long v15 = (void *)v14;
        id v13 = (void *)[objc_alloc(MEMORY[0x263F61968]) initWithData:v14];
        [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];

        uint64_t v8 = v21;
LABEL_7:
        [v13 sumInPlaceWithVector:v11];
        [*(id *)(a1 + 32) _incrementCustomResponseInDb:*(void *)(a1 + 48) reply:v6 language:v4 embedding:v13 sentAt:v5 recipient:v8 messagesRowId:v10 onError:*(void *)(a1 + 64)];
        uint64_t v16 = *MEMORY[0x263F61EC8];

LABEL_8:
LABEL_18:

        goto LABEL_19;
      }
      id v20 = sgLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_fault_impl(&dword_226E32000, v20, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.prompt_embedding", v22, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        uint64_t v16 = *MEMORY[0x263F61EC8];
        goto LABEL_8;
      }
    }
    else
    {
      long long v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_fault_impl(&dword_226E32000, v18, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.recipient", v23, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        uint64_t v16 = *MEMORY[0x263F61EC8];
LABEL_19:

        goto LABEL_20;
      }
    }
LABEL_25:
    abort();
  }
  long long v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_226E32000, v17, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore: Unexpected null value for custom_responses.language", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_25;
  }
  uint64_t v16 = *MEMORY[0x263F61EC8];
LABEL_20:

  return v16;
}

- (id)embeddingForPrompt:(id)a3 language:(id)a4 embedder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = (void (**)(id, id, id))a5;
  double v10 = (void *)MEMORY[0x22A66BDC0]();
  id v11 = v9[2](v9, v7, v8);
  if (v11) {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F61948]) initWithNumbers:v11];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)addingMessageExceedsBatchLimit:(unint64_t)a3 tableLimit:(unint64_t)a4 message:(id)a5 language:(id)a6 prompt:(id)a7 recipientHandle:(id)a8 sentAt:(id)a9
{
  v50[2] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  if (![v13 length]) {
    goto LABEL_9;
  }
  if ((unint64_t)[v15 length] >= 0x119)
  {
    long long v18 = [v15 substringToIndex:140];
    uint64_t v19 = objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 140);
    id v20 = [v18 stringByAppendingString:v19];
    uint64_t v21 = _PASRepairString();

    id v15 = (id)v21;
  }
  if (objc_msgSend(v15, "length", a3))
  {
    uint64_t v22 = [(SGQuickResponsesStore *)self getProfanityLocale];
    if (!v22)
    {
      uint64_t v23 = [MEMORY[0x263EFF960] preferredLanguages];
      uint64_t v22 = [v23 firstObject];
    }
    v50[0] = v14;
    v50[1] = v22;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    BOOL v25 = +[SGQuickResponsesStore isProfane:v13 inLocales:v24];

    if (v25)
    {
      BOOL v26 = 0;
    }
    else
    {
      [v17 timeIntervalSinceReferenceDate];
      uint64_t v28 = v27;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke;
      v43[3] = &unk_2647EA970;
      id v44 = v13;
      id v45 = v14;
      id v46 = v15;
      uint64_t v49 = v28;
      id v47 = v16;
      v48 = @"INSERT INTO messages (reply, language, prompt, recipient, sent_at, filtering, filtered) VALUES($reply, $language, $prompt, $recipient, $sent_at, false, false)";
      [(SGQuickResponsesStore *)self frailWriteTransaction:v43];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_3;
      v40[3] = &unk_2647EA998;
      unsigned int v41 = @"DELETE FROM messages ORDER BY sent_at DESC LIMIT -1 OFFSET $table_limit";
      unint64_t v42 = a4;
      [(SGQuickResponsesStore *)self frailWriteTransaction:v40];
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_5;
      v33[3] = &unk_2647EA9C0;
      uint64_t v34 = @"SELECT COUNT(ROWID) as c from messages where NOT filtered";
      v35 = &v36;
      [(SGQuickResponsesStore *)self frailReadTransaction:v33];
      BOOL v26 = v37[3] > v31;

      _Block_object_dispose(&v36, 8);
    }
  }
  else
  {
LABEL_9:
    BOOL v26 = 0;
  }

  return v26;
}

void __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_2;
  v7[3] = &unk_2647EA948;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 72);
  [a2 prepAndRunQuery:v6 onPrep:v7 onRow:0 onError:a3];
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_4;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:v6 onRow:0 onError:a3];
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_6;
  v6[3] = &unk_2647EA7E8;
  uint64_t v4 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  return [a2 prepAndRunQuery:v4 onPrep:0 onRow:v6 onError:a3];
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"c"];
  return *MEMORY[0x263F61ED0];
}

uint64_t __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$table_limit" toInt64:*(void *)(a1 + 32)];
}

void __114__SGQuickResponsesStore_addingMessageExceedsBatchLimit_tableLimit_message_language_prompt_recipientHandle_sentAt___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:"$prompt" toNSString:*(void *)(a1 + 48)];
  [v4 bindNamedParam:"$recipient" toNSString:*(void *)(a1 + 56)];
  [v4 bindNamedParam:"$sent_at" toDouble:*(double *)(a1 + 64)];
}

- (void)_incrementCustomResponseInDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke;
  v34[3] = &unk_2647EA8D8;
  id v20 = v16;
  id v35 = v20;
  id v21 = v17;
  id v36 = v21;
  id v37 = v18;
  double v38 = a7;
  id v22 = v18;
  id v23 = a10;
  id v24 = a3;
  [v24 prepAndRunQuery:@"UPDATE custom_responses SET prompt_embedding = $prompt_embedding, decayed_times_used = decayed_times_used + 1, first_seen = MIN($sent_at, first_seen), last_seen = MAX($sent_at, last_seen) WHERE language = $language AND reply = $reply", v34, 0, v23 onPrep onRow onError];
  uint64_t v25 = perRecipientCountUpsertQuery;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2;
  v30[3] = &unk_2647EA900;
  id v31 = v20;
  id v32 = v21;
  id v33 = v19;
  id v26 = v19;
  id v27 = v21;
  id v28 = v20;
  [v24 prepAndRunQuery:v25 onPrep:v30 onRow:0 onError:v23];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3;
  v29[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v29[4] = a9;
  [v24 prepAndRunQuery:markFilteredQuery onPrep:v29 onRow:0 onError:v23];
}

void __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:"$reply" toNSString:v3];
  [v5 bindNamedParam:"$language" toNSString:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) data];
  [v5 bindNamedParam:"$prompt_embedding" toNSData:v4];

  [v5 bindNamedParam:"$sent_at" toDouble:*(double *)(a1 + 56)];
}

void __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:a1[5]];
  [v4 bindNamedParam:"$recipient" toNSString:a1[6]];
}

uint64_t __118__SGQuickResponsesStore__incrementCustomResponseInDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$row_id" toInt64:*(void *)(a1 + 32)];
}

- (void)_addCustomResponseToDb:(id)a3 reply:(id)a4 language:(id)a5 embedding:(id)a6 sentAt:(double)a7 recipient:(id)a8 messagesRowId:(int64_t)a9 onError:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke;
  v34[3] = &unk_2647EA8D8;
  id v20 = v16;
  id v35 = v20;
  id v21 = v17;
  id v36 = v21;
  id v37 = v18;
  double v38 = a7;
  id v22 = v18;
  id v23 = a10;
  id v24 = a3;
  [v24 prepAndRunQuery:@"INSERT INTO custom_responses (reply, language, prompt_embedding, decayed_times_used, first_seen, last_seen)                       VALUES($reply, $language, $prompt_embedding, 1, $sent_at, $sent_at)", v34, 0, v23 onPrep onRow onError];
  uint64_t v25 = perRecipientCountUpsertQuery;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2;
  v30[3] = &unk_2647EA900;
  id v31 = v20;
  id v32 = v21;
  id v33 = v19;
  id v26 = v19;
  id v27 = v21;
  id v28 = v20;
  [v24 prepAndRunQuery:v25 onPrep:v30 onRow:0 onError:v23];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3;
  v29[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v29[4] = a9;
  [v24 prepAndRunQuery:markFilteredQuery onPrep:v29 onRow:0 onError:v23];
}

void __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:"$reply" toNSString:v3];
  [v5 bindNamedParam:"$language" toNSString:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) data];
  [v5 bindNamedParam:"$prompt_embedding" toNSData:v4];

  [v5 bindNamedParam:"$sent_at" toDouble:*(double *)(a1 + 56)];
}

void __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:"$reply" toNSString:v3];
  [v4 bindNamedParam:"$language" toNSString:a1[5]];
  [v4 bindNamedParam:"$recipient" toNSString:a1[6]];
}

uint64_t __112__SGQuickResponsesStore__addCustomResponseToDb_reply_language_embedding_sentAt_recipient_messagesRowId_onError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$row_id" toInt64:*(void *)(a1 + 32)];
}

- (void)addWrittenToResponse:(id)a3 language:(id)a4 isMatch:(BOOL)a5
{
  id v8 = a4;
  id v9 = +[SGQuickResponsesReplies normalizeReplyText:a3];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke;
  v12[3] = &unk_2647EA8B0;
  BOOL v18 = a5;
  id v13 = v8;
  id v14 = v9;
  id v15 = @"INSERT INTO responses (lang_response, matched) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET matched=matched+1";
  id v16 = @"INSERT INTO responses_totals (language, matched) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET matched=matched+1";
  id v17 = @"INSERT INTO responses_totals (language, unmatched) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET unmatched=unmatched+1";
  id v10 = v9;
  id v11 = v8;
  [(SGQuickResponsesStore *)self frailWriteTransaction:v12];
}

void __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_5;
  }
  id v7 = +[SGQuickResponsesStore keyWithLanguage:*(void *)(a1 + 32) andResponse:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 48);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_2;
  v14[3] = &unk_2647EA7C0;
  id v15 = v7;
  id v9 = v7;
  LODWORD(v8) = [v5 prepAndRunQuery:v8 onPrep:v14 onRow:0 onError:v6];

  if (v8)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v10 = (uint64_t *)(a1 + 56);
LABEL_6:
      uint64_t v11 = *v10;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_3;
      v12[3] = &unk_2647EA7C0;
      id v13 = *(id *)(a1 + 32);
      [v5 prepAndRunQuery:v11 onPrep:v12 onRow:0 onError:v6];

      goto LABEL_7;
    }
LABEL_5:
    id v10 = (uint64_t *)(a1 + 64);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$lang_response" toNSString:*(void *)(a1 + 32)];
}

uint64_t __63__SGQuickResponsesStore_addWrittenToResponse_language_isMatch___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$language" toNSString:*(void *)(a1 + 32)];
}

- (void)addSelectedToResponse:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = +[SGQuickResponsesReplies normalizeReplyText:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke;
  v10[3] = &unk_2647EA888;
  id v11 = v6;
  id v12 = v7;
  id v13 = @"INSERT INTO responses (lang_response, selected) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET selected=selected+1";
  id v14 = @"INSERT INTO responses_totals (language, selected) VALUES ($language,1) ON CONFLICT(language) DO UPDATE SET selected=selected+1";
  id v8 = v7;
  id v9 = v6;
  [(SGQuickResponsesStore *)self frailWriteTransaction:v10];
}

void __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SGQuickResponsesStore keyWithLanguage:*(void *)(a1 + 32) andResponse:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_2;
  v13[3] = &unk_2647EA7C0;
  id v9 = v7;
  id v14 = v9;
  LODWORD(v8) = [v5 prepAndRunQuery:v8 onPrep:v13 onRow:0 onError:v6];

  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_3;
    v11[3] = &unk_2647EA7C0;
    id v12 = *(id *)(a1 + 32);
    [v5 prepAndRunQuery:v10 onPrep:v11 onRow:0 onError:v6];
  }
}

uint64_t __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$lang_response" toNSString:*(void *)(a1 + 32)];
}

uint64_t __56__SGQuickResponsesStore_addSelectedToResponse_language___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$language" toNSString:*(void *)(a1 + 32)];
}

- (void)addDisplayedToResponses:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_48);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_2;
  v10[3] = &unk_2647EA888;
  id v11 = v7;
  id v12 = v6;
  id v13 = @"INSERT INTO responses (lang_response, displayed) VALUES($lang_response,1) ON CONFLICT(lang_response) DO UPDATE SET displayed=displayed+1";
  id v14 = @"INSERT INTO responses_totals (language, opportunities, displayed) VALUES ($language,1,$count) ON CONFLICT(language) DO UPDATE SET opportunities=opportunities+1, displayed=displayed+$count";
  id v8 = v6;
  id v9 = v7;
  [(SGQuickResponsesStore *)self frailWriteTransaction:v10];
}

void __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = +[SGQuickResponsesStore keyWithLanguage:*(void *)(a1 + 40) andResponse:*(void *)(*((void *)&v21 + 1) + 8 * v11)];
      uint64_t v13 = *(void *)(a1 + 48);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_3;
      v19[3] = &unk_2647EA7C0;
      id v20 = v12;
      id v14 = v12;
      LODWORD(v13) = [v5 prepAndRunQuery:v13 onPrep:v19 onRow:0 onError:v6];

      if (!v13) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v15 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_4;
    v16[3] = &unk_2647EA860;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 32);
    [v5 prepAndRunQuery:v15 onPrep:v16 onRow:0 onError:v6];

    id v7 = v17;
  }
}

uint64_t __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$lang_response" toNSString:*(void *)(a1 + 32)];
}

void __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:"$language" toNSString:v3];
  objc_msgSend(v4, "bindNamedParam:toInt64:", "$count", objc_msgSend(*(id *)(a1 + 40), "count"));
}

id __58__SGQuickResponsesStore_addDisplayedToResponses_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyText:a2];
}

- (id)_recordsForResponses:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  double v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  float v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke;
  id v18 = &unk_2647EA838;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  long long v21 = @"SELECT * FROM responses WHERE lang_response=$lang_response";
  id v11 = v8;
  long long v24 = &v45;
  uint64_t v25 = &v41;
  uint64_t v26 = &v37;
  id v27 = &v33;
  id v28 = &v29;
  id v22 = v11;
  long long v23 = @"SELECT * FROM responses_totals WHERE language=$language";
  if ([(SGQuickResponsesStore *)self frailReadTransaction:&v15])
  {
    id v12 = [SGQuickResponsesRecords alloc];
    uint64_t v13 = -[SGQuickResponsesRecords initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:](v12, "initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:", v11, (double)v46[3], (double)v42[3], (double)v38[3], (double)v34[3], (double)v30[3], v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    uint64_t v13 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v13;
}

void __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v20 = a2;
  id v19 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v37;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v36 + 1) + 8 * v6);
        uint64_t v30 = 0;
        uint64_t v31 = &v30;
        uint64_t v32 = 0x3032000000;
        uint64_t v33 = __Block_byref_object_copy__605;
        uint64_t v34 = __Block_byref_object_dispose__606;
        id v35 = 0;
        uint64_t v8 = +[SGQuickResponsesStore keyWithLanguage:*(void *)(a1 + 40) andResponse:v7];
        uint64_t v9 = *(void *)(a1 + 48);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_34;
        v28[3] = &unk_2647EA7C0;
        id v10 = v8;
        id v29 = v10;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_2;
        v27[3] = &unk_2647EA7E8;
        v27[4] = &v30;
        LOBYTE(v9) = [v20 prepAndRunQuery:v9 onPrep:v28 onRow:v27 onError:v19];

        if ((v9 & 1) == 0)
        {

          _Block_object_dispose(&v30, 8);
          uint64_t v16 = obj;
          goto LABEL_13;
        }
        uint64_t v11 = v31[5];
        if (!v11)
        {
          id v12 = [[SGQuickResponsesReplyRecord alloc] initWithDisplayed:0.0 selected:0.0 matched:0.0];
          uint64_t v13 = (void *)v31[5];
          v31[5] = (uint64_t)v12;

          uint64_t v11 = v31[5];
        }
        [*(id *)(a1 + 56) addObject:v11];

        _Block_object_dispose(&v30, 8);
        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = *(void *)(a1 + 64);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_3;
  v25[3] = &unk_2647EA7C0;
  id v26 = *(id *)(a1 + 40);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_4;
  v21[3] = &unk_2647EA810;
  long long v15 = *(_OWORD *)(a1 + 88);
  long long v22 = *(_OWORD *)(a1 + 72);
  long long v23 = v15;
  uint64_t v24 = *(void *)(a1 + 104);
  [v20 prepAndRunQuery:v14 onPrep:v25 onRow:v21 onError:v19];
  uint64_t v16 = v26;
LABEL_13:
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_34(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$lang_response" toNSString:*(void *)(a1 + 32)];
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"displayed" table:0];
  uint64_t v5 = [v3 getInt64ForColumnName:"selected" table:0];
  uint64_t v6 = [v3 getInt64ForColumnName:"matched" table:0];

  uint64_t v7 = [[SGQuickResponsesReplyRecord alloc] initWithDisplayed:(double)v4 selected:(double)v5 matched:(double)v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *MEMORY[0x263F61ED0];
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:"$language" toNSString:*(void *)(a1 + 32)];
}

uint64_t __55__SGQuickResponsesStore__recordsForResponses_language___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[4] + 8) + 24) = [v3 getInt64ForColumnName:"opportunities" table:0];
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 getInt64ForColumnName:"displayed" table:0];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v3 getInt64ForColumnName:"selected" table:0];
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v3 getInt64ForColumnName:"matched" table:0];
  uint64_t v4 = [v3 getInt64ForColumnName:"unmatched" table:0];

  *(void *)(*(void *)(a1[8] + 8) + 24) = v4;
  return *MEMORY[0x263F61ED0];
}

- (id)recordsForResponsesInternal:(id)a3 language:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_26);
  uint64_t v8 = [(SGQuickResponsesStore *)self _recordsForResponses:v7 language:v6];

  return v8;
}

id __62__SGQuickResponsesStore_recordsForResponsesInternal_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyTextInternal:a2];
}

- (id)recordsForResponses:(id)a3 language:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
  uint64_t v8 = [(SGQuickResponsesStore *)self _recordsForResponses:v7 language:v6];

  return v8;
}

id __54__SGQuickResponsesStore_recordsForResponses_language___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyText:a2];
}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = (void *)MEMORY[0x22A66BDC0]();
  readerWriter = self->_readerWriter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke;
  v9[3] = &unk_2647EA778;
  uint64_t v11 = &v12;
  id v7 = v4;
  id v10 = v7;
  [(_PASLock *)readerWriter runWithLockAcquired:v9];

  LOBYTE(v5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

void __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getObject];
  uint64_t v5 = [v4 db];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_2;
    v8[3] = &unk_2647EA750;
    id v10 = *(id *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v11 = v7;
    [v6 frailWriteTransaction:v8];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [v3 destroyCachedObject];
    }
  }
}

uint64_t __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_3;
  uint64_t v7 = &unk_2647EA728;
  uint64_t v8 = *(void *)(a1 + 48);
  (*(void (**)(void))(v2 + 16))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __47__SGQuickResponsesStore_frailWriteTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = [a2 userInfo];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore write error: %@", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x263F61ED0];
}

- (BOOL)frailReadTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = (void *)MEMORY[0x22A66BDC0]();
  readerWriter = self->_readerWriter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke;
  v9[3] = &unk_2647EA778;
  uint64_t v11 = &v12;
  id v7 = v4;
  id v10 = v7;
  [(_PASLock *)readerWriter runWithLockAcquired:v9];

  LOBYTE(v5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

void __46__SGQuickResponsesStore_frailReadTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getObject];
  uint64_t v5 = [v4 db];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_2;
    v8[3] = &unk_2647EA750;
    id v10 = *(id *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v11 = v7;
    [v6 frailReadTransaction:v8];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [v3 destroyCachedObject];
    }
  }
}

uint64_t __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_3;
  uint64_t v7 = &unk_2647EA728;
  uint64_t v8 = *(void *)(a1 + 48);
  (*(void (**)(void))(v2 + 16))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __46__SGQuickResponsesStore_frailReadTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = [a2 userInfo];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesStore read error: %@", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x263F61ED0];
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6
{
  id v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SGQuickResponsesStore;
  uint64_t v11 = [(SGQuickResponsesStore *)&v26 init];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F61E70]);
    uint64_t v13 = [SGLazyInit alloc];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    id v20 = __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke;
    long long v21 = &unk_2647EA6E0;
    id v22 = v10;
    BOOL v23 = a4;
    BOOL v24 = a5;
    BOOL v25 = a6;
    uint64_t v14 = [(SGLazyInit *)v13 initWithInitializer:&v18 destructor:&__block_literal_global_18];
    uint64_t v15 = objc_msgSend(v12, "initWithGuardedData:", v14, v18, v19, v20, v21);
    readerWriter = v11->_readerWriter;
    v11->_readerWriter = (_PASLock *)v15;
  }
  return v11;
}

id __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke(uint64_t a1)
{
  id v1 = [[SGQuickResponsesDatabase alloc] initInDirectory:*(void *)(a1 + 32) inMemory:*(unsigned __int8 *)(a1 + 40) withMigration:*(unsigned __int8 *)(a1 + 41) forTools:*(unsigned __int8 *)(a1 + 42)];
  return v1;
}

void __73__SGQuickResponsesStore_initInDirectory_inMemory_withMigration_forTools___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 db];
  [v2 closePermanently];
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5
{
  return [(SGQuickResponsesStore *)self initInDirectory:a3 inMemory:a4 withMigration:a5 forTools:0];
}

- (SGQuickResponsesStore)init
{
  return (SGQuickResponsesStore *)[(SGQuickResponsesStore *)self initInDirectory:0 inMemory:0 withMigration:0 forTools:1];
}

+ (id)keyWithLanguage:(id)a3 andResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 length];
  uint64_t v8 = [@"|" length];
  uint64_t v9 = v8 + v7 + [v5 length];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:v9];
  [v10 appendString:v6];

  [v10 appendString:@"|"];
  [v10 appendString:v5];

  return v10;
}

+ (BOOL)isProfane:(id)a3 inLocales:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[SGTokenizerML tokenize:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (+[SGLexiconML profanityInTokens:forLocaleIdentifier:](SGLexiconML, "profanityInTokens:forLocaleIdentifier:", v6, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)instanceInMemory
{
  id v2 = [[SGQuickResponsesStore alloc] initInDirectory:0 inMemory:1 withMigration:1];
  return v2;
}

+ (SGQuickResponsesStore)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_11_790);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_791;
  return (SGQuickResponsesStore *)v2;
}

void __39__SGQuickResponsesStore_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  id v1 = [[SGQuickResponsesStore alloc] initInDirectory:0 inMemory:0 withMigration:1];
  id v2 = (void *)sharedInstance__pasExprOnceResult_791;
  sharedInstance__pasExprOnceResult_791 = (uint64_t)v1;
}

+ (void)warmup
{
  uint64_t v4 = +[SGQuickResponsesStore sharedInstance];
  id v6 = (id)v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, a1, @"SGQuickResponsesStore.m", 44, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

    uint64_t v4 = 0;
  }
  [*(id *)(v4 + 8) runWithLockAcquired:&__block_literal_global_793];
}

void __31__SGQuickResponsesStore_warmup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 getObject];
  id v3 = [v2 db];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Quick Responses: failed to initialize database while warming up store", v4, 2u);
  }
}

@end