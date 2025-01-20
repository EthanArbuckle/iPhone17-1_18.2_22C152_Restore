@interface EDCategoryMigrator
+ (OS_os_log)log;
+ (void)initializeIfNeededWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6;
+ (void)migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 progressHandler:(id)a6 completion:(id)a7;
- (EDActivityPersistence)activityPersistence;
- (EDCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6;
- (EDCategoryPersistence)categoryPersistence;
- (EDMessageCategorizer)categorizer;
- (EDMessagePersistence)messagePersistence;
- (EFCancelable)haveAccessToDb;
- (EFLocked)activityForMailboxID;
- (EFScheduler)categorizationWriterScheduler;
- (NSConditionLock)categorizationQueueLock;
- (OS_dispatch_queue)categorizationQueue;
- (int64_t)reason;
- (unint64_t)numBatchesQueued;
- (void)_categorizeMessageBatch:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5;
- (void)_categorizeMessagesForQuery:(id)a3 cancelationToken:(id)a4 progressHandler:(id)a5 completion:(id)a6;
- (void)_endCategorization;
- (void)_migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 progressHandler:(id)a6 completion:(id)a7;
- (void)_updateCategorizationActivityForMessageBatch:(id)a3 isFinished:(BOOL)a4 cancelationToken:(id)a5;
- (void)setActivityForMailboxID:(id)a3;
- (void)setNumBatchesQueued:(unint64_t)a3;
@end

@implementation EDCategoryMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__EDCategoryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_17 != -1) {
    dispatch_once(&log_onceToken_17, block);
  }
  v2 = (void *)log_log_17;

  return (OS_os_log *)v2;
}

void __25__EDCategoryMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_17;
  log_log_17 = (uint64_t)v1;
}

+ (void)initializeIfNeededWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__EDCategoryMigrator_initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence___block_invoke;
  v18[3] = &unk_1E6BFFA78;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  uint64_t v13 = initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence__once;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  if (v13 != -1) {
    dispatch_once(&initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence__once, v18);
  }
}

void __115__EDCategoryMigrator_initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence___block_invoke(void *a1)
{
  os_log_t v1 = [[EDCategoryMigrator alloc] initWithCategoryPersistence:a1[4] categorizer:a1[5] messagePersistence:a1[6] activityPersistence:a1[7]];
  v2 = (void *)sDefaultInstance;
  sDefaultInstance = (uint64_t)v1;
}

+ (void)migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v14 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (v14) {
    [(id)sDefaultInstance _migrateCategoryForQuery:v14 cancelationToken:v11 reason:a5 progressHandler:v12 completion:v13];
  }
}

- (EDCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)EDCategoryMigrator;
  id v15 = [(EDCategoryMigrator *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.CategoryMigrator.writer" qualityOfService:9];
    categorizationWriterScheduler = v15->_categorizationWriterScheduler;
    v15->_categorizationWriterScheduler = (EFScheduler *)v16;

    objc_storeStrong((id *)&v15->_categoryPersistence, a3);
    objc_storeStrong((id *)&v15->_messagePersistence, a5);
    objc_storeStrong((id *)&v15->_categorizer, a4);
    haveAccessToDb = v15->_haveAccessToDb;
    v15->_haveAccessToDb = 0;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v21 = dispatch_queue_create(0, v20);
    categorizationQueue = v15->_categorizationQueue;
    v15->_categorizationQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    categorizationQueueLock = v15->_categorizationQueueLock;
    v15->_categorizationQueueLock = (NSConditionLock *)v23;

    objc_storeStrong((id *)&v15->_activityPersistence, a6);
    id v25 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v27 = [v25 initWithObject:v26];
    activityForMailboxID = v15->_activityForMailboxID;
    v15->_activityForMailboxID = (EFLocked *)v27;
  }
  return v15;
}

- (void)_migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 progressHandler:(id)a6 completion:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!self->_haveAccessToDb)
  {
    categoryPersistence = self->_categoryPersistence;
    id v35 = 0;
    id v17 = [(EDCategoryPersistence *)categoryPersistence requestProtectedDatabaseBackgroundProcessingForDuration:&v35 error:14400.0];
    id v18 = v35;
    haveAccessToDb = self->_haveAccessToDb;
    self->_haveAccessToDb = v17;

    if (v18)
    {
      id v20 = +[EDCategoryMigrator log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v21 = [v18 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v21;
        _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "Category migrator failed to obtain background processing permission : %@", buf, 0xCu);
      }
    }
  }
  self->_reason = a5;
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke;
  v33[3] = &unk_1E6C00670;
  v33[4] = self;
  objc_copyWeak(&v34, (id *)buf);
  [v13 addCancelationBlock:v33];
  categorizationQueue = self->_categorizationQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke_3;
  v27[3] = &unk_1E6C00698;
  objc_copyWeak(&v32, (id *)buf);
  id v28 = v13;
  id v29 = v12;
  id v30 = v15;
  id v31 = v14;
  id v23 = v14;
  id v24 = v12;
  id v25 = v15;
  id v26 = v13;
  dispatch_async(categorizationQueue, v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak((id *)buf);
}

void __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) categorizationQueueLock];
  [v2 lock];

  [*(id *)(a1 + 32) setNumBatchesQueued:0];
  id v3 = [*(id *)(a1 + 32) categorizationQueueLock];
  [v3 unlockWithCondition:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained categorizationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke_2;
    block[3] = &unk_1E6BFF2F0;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endCategorization];
}

void __98__EDCategoryMigrator__migrateCategoryForQuery_cancelationToken_reason_progressHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) isCanceled])
    {
      id v3 = +[EDCategoryMigrator log];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(a1 + 32);
        int v9 = 134217984;
        id v10 = v4;
        _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Migration was canceled using token:%p. Returning early", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v5 = *(void *)(a1 + 48);
      if (v5)
      {
        v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      }
    }
    else
    {
      v7 = +[EDCategoryMigrator log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = 134218242;
        id v10 = WeakRetained;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Starting EDCategoryMigrator:<%p> with Query: %@", (uint8_t *)&v9, 0x16u);
      }

      [WeakRetained _categorizeMessagesForQuery:*(void *)(a1 + 40) cancelationToken:*(void *)(a1 + 32) progressHandler:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
    }
  }
}

- (void)_endCategorization
{
  id v3 = +[EDCategoryMigrator log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Category migrator.", v5, 2u);
  }

  [(EFCancelable *)self->_haveAccessToDb cancel];
  haveAccessToDb = self->_haveAccessToDb;
  self->_haveAccessToDb = 0;
}

- (void)_categorizeMessagesForQuery:(id)a3 cancelationToken:(id)a4 progressHandler:(id)a5 completion:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v30 = a4;
  id v31 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  if (!v11)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"EDCategoryMigrator-BlackPearl.m", 154, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  uint64_t v13 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.categoryMigrator.categorizeMessages"];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
  id v14 = [(EDCategoryMigrator *)self messagePersistence];
  uint64_t v15 = [v14 countOfMessagesMatchingQuery:v11];

  unint64_t v53 = v15;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v16 = objc_opt_new();
  id v17 = +[EDCategoryMigrator log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Category migrator querying for messages to recategorize with query:%@", (uint8_t *)&buf, 0xCu);
  }

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  [(EDCategoryMigrator *)self setNumBatchesQueued:0];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__3;
  v57 = __Block_byref_object_dispose__3;
  id v58 = 0;
  id v18 = [(EDCategoryMigrator *)self messagePersistence];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke;
  v36[3] = &unk_1E6C006C0;
  p_long long buf = &buf;
  id v19 = v16;
  v42 = v45;
  id v37 = v19;
  v38 = self;
  id v20 = v30;
  id v39 = v20;
  v43 = &v46;
  id v21 = v31;
  id v40 = v21;
  v44 = &v50;
  [v18 iteratePersistedMessagesMatchingQuery:v11 limit:0x7FFFFFFFFFFFFFFFLL cancelationToken:v20 requireProtectedData:1 handler:v36];

  if ([v20 isCanceled])
  {
    id v22 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v35 = 0;
      _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Migration was canceled. Returning early", v35, 2u);
    }

    [v13 invalidate];
    if (v12)
    {
      id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
      v12[2](v12, v23);
LABEL_16:
    }
  }
  else
  {
    if ([v19 count])
    {
      id v24 = (void *)[v19 copy];
      [(EDCategoryMigrator *)self _categorizeMessageBatch:v24 cancelationToken:v20 reason:self->_reason];
      uint64_t v25 = [v24 count];
      v47[3] += v25;
      if (v21)
      {
        id v26 = [EDCategorizationProgress alloc];
        uint64_t v27 = [(EDCategorizationProgress *)v26 initWithTotalMessagesToCategorize:v51[3] categorizedMessages:v47[3]];
        (*((void (**)(id, EDCategorizationProgress *))v21 + 2))(v21, v27);
      }
    }
    [v13 invalidate];
    if (v12)
    {
      id v28 = [(EDCategoryMigrator *)self categorizationWriterScheduler];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke_28;
      v32[3] = &unk_1E6C006E8;
      v33 = v12;
      id v34 = &buf;
      [v28 performBlock:v32];

      id v23 = v33;
      goto LABEL_16;
    }
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

void __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    v7 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(v6, "ef_publicDescription");
      __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke_cold_1(v8, (uint8_t *)&v14, v7);
    }
LABEL_9:

    goto LABEL_10;
  }
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x64)
  {
    int v9 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v11 = *(void *)(v10 + 24) + 1;
      *(void *)(v10 + 24) = v11;
      int v14 = 134217984;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Category migrator reached maximum batch size batchCount:%ld", (uint8_t *)&v14, 0xCu);
    }

    v7 = [*(id *)(a1 + 32) copy];
    [*(id *)(a1 + 32) removeAllObjects];
    objc_msgSend(*(id *)(a1 + 40), "_categorizeMessageBatch:cancelationToken:reason:", v7, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "reason"));
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v7 count];
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v13 = [[EDCategorizationProgress alloc] initWithTotalMessagesToCategorize:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) categorizedMessages:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      (*(void (**)(uint64_t, EDCategorizationProgress *))(v12 + 16))(v12, v13);
    }
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_categorizeMessageBatch:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(EDCategoryMigrator *)self categorizationQueueLock];
  [v11 lockWhenCondition:0];

  [(EDCategoryMigrator *)self setNumBatchesQueued:[(EDCategoryMigrator *)self numBatchesQueued] + 1];
  if ([(EDCategoryMigrator *)self numBatchesQueued] == 2)
  {
    uint64_t v12 = [(EDCategoryMigrator *)self categorizationQueueLock];
    [v12 unlockWithCondition:1];
  }
  else
  {
    uint64_t v12 = [(EDCategoryMigrator *)self categorizationQueueLock];
    [v12 unlock];
  }

  uint64_t v13 = [(EDCategoryMigrator *)self categorizationWriterScheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke;
  v16[3] = &unk_1E6C00710;
  v16[4] = self;
  id v14 = v10;
  id v17 = v14;
  SEL v19 = a2;
  id v15 = v9;
  id v18 = v15;
  int64_t v20 = a5;
  [v13 performBlock:v16];
}

void __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) messagePersistence];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke_2;
  v7[3] = &unk_1E6C00710;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v10 = v6;
  uint64_t v11 = *(void *)(a1 + 64);
  [v2 performDatabaseWorkInBlockWithHighPriority:v7];
}

void __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCanceled])
  {
    v2 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v16 = 138543362;
      uint64_t v17 = (uint64_t)v3;
      _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - token canceled", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) _updateCategorizationActivityForMessageBatch:*(void *)(a1 + 48) isFinished:0 cancelationToken:*(void *)(a1 + 32)];
    uint64_t v4 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 48) count];
      int v16 = 134217984;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Category migrator recategorizing %lu messages to match current categorization version.", (uint8_t *)&v16, 0xCu);
    }

    long long v6 = [*(id *)(a1 + 40) categorizer];
    int v7 = [v6 categorizeMessages:*(void *)(a1 + 48) reason:*(void *)(a1 + 64)];

    [*(id *)(a1 + 40) _updateCategorizationActivityForMessageBatch:*(void *)(a1 + 48) isFinished:1 cancelationToken:*(void *)(a1 + 32)];
    id v8 = +[EDCategoryMigrator log];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Category migrator successfully categorized a batch of messages", (uint8_t *)&v16, 2u);
      }
    }
    else
    {
      if (v9)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Category migrator failed to successfully recategorize messages", (uint8_t *)&v16, 2u);
      }

      long long v10 = *(void **)(a1 + 32);
      if (v10) {
        [v10 cancel];
      }
    }
    uint64_t v11 = [*(id *)(a1 + 40) categorizationQueueLock];
    [v11 lock];

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v12 = (id *)(a1 + 40);
    objc_msgSend(v13, "setNumBatchesQueued:", objc_msgSend(v13, "numBatchesQueued") - 1);
    BOOL v14 = [*v12 numBatchesQueued] == 1;
    id v15 = [*v12 categorizationQueueLock];
    v2 = v15;
    if (v14) {
      [v15 unlockWithCondition:0];
    }
    else {
      [v15 unlock];
    }
  }
}

- (void)_updateCategorizationActivityForMessageBatch:(id)a3 isFinished:(BOOL)a4 cancelationToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (EMBlackPearlIsFeatureEnabled())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke;
    v19[3] = &unk_1E6C00738;
    id v11 = v10;
    id v20 = v11;
    [v8 enumerateObjectsUsingBlock:v19];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2;
    aBlock[3] = &unk_1E6C00788;
    aBlock[4] = self;
    uint64_t v12 = _Block_copy(aBlock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_41;
    v14[3] = &unk_1E6C00800;
    v14[4] = self;
    BOOL v17 = a4;
    id v15 = v9;
    id v16 = v12;
    id v13 = v12;
    [v11 enumerateObjectsUsingBlock:v14];
  }
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60310]);
  uint64_t v4 = [v7 mailbox];
  uint64_t v5 = [v4 URL];
  long long v6 = (void *)[v3 initWithURL:v5];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  long long v6 = [*(id *)(a1 + 32) activityForMailboxID];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_3;
  v16[3] = &unk_1E6C00760;
  uint64_t v18 = &v19;
  id v7 = v5;
  id v17 = v7;
  [v6 performWhileLocked:v16];

  if (v20[5])
  {
    id v8 = [*(id *)(a1 + 32) activityPersistence];
    id v9 = [(id)v20[5] objectID];
    [v8 activityWithID:v9 finishedWithError:0];

    id v10 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"was cancelled";
      if (a3) {
        id v11 = @"finished";
      }
      *(_DWORD *)long long buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Categorization progress for mailbox %@ %@", buf, 0x16u);
    }

    uint64_t v12 = [*(id *)(a1 + 32) activityForMailboxID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_39;
    v14[3] = &unk_1E6BFFCB8;
    id v15 = v7;
    [v12 performWhileLocked:v14];

    id v13 = v15;
  }
  else
  {
    id v13 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_cold_1((uint64_t)v7, v13);
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_39(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__3;
  __int16 v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) activityForMailboxID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_3_42;
  v20[3] = &unk_1E6C00760;
  id v22 = &v23;
  id v5 = v3;
  id v21 = v5;
  [v4 performWhileLocked:v20];

  if (v24[5])
  {
    if (*(unsigned char *)(a1 + 56)) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else if (!*(unsigned char *)(a1 + 56))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F5FC58]];
    id v7 = [*(id *)(a1 + 32) activityPersistence];
    uint64_t v8 = [v7 startActivityOfType:3 userInfo:v6];
    id v9 = (void *)v24[5];
    v24[5] = v8;

    id v10 = +[EDCategoryMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Starting categorization progress for mailbox %@", buf, 0xCu);
    }

    id v11 = [*(id *)(a1 + 32) activityForMailboxID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_43;
    v17[3] = &unk_1E6C007B0;
    id v12 = v5;
    id v18 = v12;
    uint64_t v19 = &v23;
    [v11 performWhileLocked:v17];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_44;
    v14[3] = &unk_1E6C007D8;
    id v13 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v15 = v12;
    [v13 addCancelationBlock:v14];
  }
  _Block_object_dispose(&v23, 8);
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_3_42(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_43(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

uint64_t __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

- (EFScheduler)categorizationWriterScheduler
{
  return self->_categorizationWriterScheduler;
}

- (EFCancelable)haveAccessToDb
{
  return self->_haveAccessToDb;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EFLocked)activityForMailboxID
{
  return self->_activityForMailboxID;
}

- (void)setActivityForMailboxID:(id)a3
{
}

- (EDMessageCategorizer)categorizer
{
  return self->_categorizer;
}

- (OS_dispatch_queue)categorizationQueue
{
  return self->_categorizationQueue;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSConditionLock)categorizationQueueLock
{
  return self->_categorizationQueueLock;
}

- (unint64_t)numBatchesQueued
{
  return self->_numBatchesQueued;
}

- (void)setNumBatchesQueued:(unint64_t)a3
{
  self->_numBatchesQueued = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorizationQueueLock, 0);
  objc_storeStrong((id *)&self->_categorizationQueue, 0);
  objc_storeStrong((id *)&self->_categorizer, 0);
  objc_storeStrong((id *)&self->_activityForMailboxID, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_haveAccessToDb, 0);

  objc_storeStrong((id *)&self->_categorizationWriterScheduler, 0);
}

void __94__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken_progressHandler_completion___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Category migrator query failed with error %{public}@", buf, 0xCu);
}

void __95__EDCategoryMigrator__updateCategorizationActivityForMessageBatch_isFinished_cancelationToken___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Could not find a categorization progress activity for mailbox %@", (uint8_t *)&v2, 0xCu);
}

@end