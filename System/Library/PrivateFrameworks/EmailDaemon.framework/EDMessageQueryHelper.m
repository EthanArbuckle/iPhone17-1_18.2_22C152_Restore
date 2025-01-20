@interface EDMessageQueryHelper
+ (OS_os_log)log;
- (BOOL)addMessagesSynchronously;
- (BOOL)keepMessagesInListOnBucketChange;
- (BOOL)shouldReconcileJournal;
- (BOOL)updateDisplayDate;
- (EDMessagePersistence)messagePersistence;
- (EDMessageQueryEvaluator)queryEvaluator;
- (EDMessageQueryHelper)initWithQuery:(id)a3 initialBatchSize:(int64_t)a4 maximumBatchSize:(int64_t)a5 messagePersistence:(id)a6 hookRegistry:(id)a7 searchProvider:(id)a8 scheduler:(id)a9 remindMeNotificationController:(id)a10 delegate:(id)a11 shouldReconcileJournal:(BOOL)a12 shouldAddMessagesSynchronously:(BOOL)a13 keepMessagesInListOnBucketChange:(BOOL)a14;
- (EDMessageQueryHelperDelegate)delegate;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDRemindMeNotificationController)remindMeNotificationController;
- (EDSearchProvider)searchProvider;
- (EFCancelationToken)cancelationToken;
- (EFPromise)initialResultsPromise;
- (EFScheduler)scheduler;
- (EMQuery)query;
- (NSPredicate)ignoreMessagesPredicate;
- (NSString)pendingAuthenticationChangesKey;
- (NSString)pendingCategorizationChangesKey;
- (NSString)pendingConversationIDChangesKey;
- (NSString)pendingDisplayDateChangesKey;
- (NSString)pendingFlagChangesKey;
- (NSString)pendingReadLaterDateChangesKey;
- (id)_filteredMessagesForPredicate:(id)a3 limit:(int64_t)a4;
- (id)_persistedMessagesFromSendersWithAddresses:(id)a3;
- (id)_predicateWithAdditionalPredicates:(id)a3;
- (id)_transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4 removeIgnoredMessages:(BOOL)a5;
- (id)_unjournaledMessagesForMessages:(id)a3;
- (id)messagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4;
- (id)sortableMessagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4;
- (int64_t)initialBatchSize;
- (int64_t)maximumBatchSize;
- (void)_calculateAndReportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 changeBlock:(id)a5;
- (void)_foundMessages:(id)a3 inRemoteSearch:(BOOL)a4;
- (void)_getInitialResults;
- (void)_performBlockAfterGenerationCheck:(id)a3 generation:(id)a4 keyPaths:(id)a5 removedMessages:(id)a6 changedMessages:(id)a7 addedMessages:(id)a8;
- (void)_persistenceDidDeleteMessages:(id)a3 includeMessagesWithDeletedFlag:(BOOL)a4;
- (void)_persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4;
- (void)_reportChangesForCurrentlyMatchingMessages:(id)a3 previouslyMatchingMessages:(id)a4 keyPaths:(id)a5 generation:(id)a6;
- (void)_reportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 keyPaths:(id)a5 generation:(id)a6;
- (void)_updateDisplayDateForMessagesIfNeeded;
- (void)cancel;
- (void)controller:(id)a3 messageTimerFired:(id)a4;
- (void)dealloc;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeBusinessIDForMessages:(id)a3 fromBusinessID:(int64_t)a4;
- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5;
- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidNotChangeCategorizationForMessages:(id)a3;
- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidUpdateAuthenticationStateForMessages:(id)a3;
- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5;
- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceWillChangeCategorizationForMessages:(id)a3;
- (void)persistenceWillChangeConversationID:(int64_t)a3 messages:(id)a4;
- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4;
- (void)persistenceWillChangeReadLaterDate:(id)a3 messages:(id)a4;
- (void)persistenceWillUpdateAuthenticationStateForMessages:(id)a3;
- (void)persistenceWillUpdateDisplayDateForMessages:(id)a3;
- (void)remoteSearchDidFindMessages:(id)a3;
- (void)remoteSearchDidFinish;
- (void)setCancelationToken:(id)a3;
- (void)start;
@end

@implementation EDMessageQueryHelper

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDMessageQueryHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_58 != -1) {
    dispatch_once(&log_onceToken_58, block);
  }
  v2 = (void *)log_log_58;

  return (OS_os_log *)v2;
}

void __27__EDMessageQueryHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_58;
  log_log_58 = (uint64_t)v1;
}

- (EDMessageQueryHelper)initWithQuery:(id)a3 initialBatchSize:(int64_t)a4 maximumBatchSize:(int64_t)a5 messagePersistence:(id)a6 hookRegistry:(id)a7 searchProvider:(id)a8 scheduler:(id)a9 remindMeNotificationController:(id)a10 delegate:(id)a11 shouldReconcileJournal:(BOOL)a12 shouldAddMessagesSynchronously:(BOOL)a13 keepMessagesInListOnBucketChange:(BOOL)a14
{
  id v59 = a3;
  id v57 = a6;
  id v56 = a7;
  id v55 = a8;
  id v54 = a9;
  id v53 = a10;
  id obj = a11;
  v60.receiver = self;
  v60.super_class = (Class)EDMessageQueryHelper;
  v20 = [(EDMessageQueryHelper *)&v60 init];
  p_isa = (id *)&v20->super.isa;
  v22 = v20;
  if (v20)
  {
    v20->_noLongerMatchingMessagesLock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    noLongerMatchingMessages = v22->_noLongerMatchingMessages;
    v22->_noLongerMatchingMessages = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    ignoredMessages = v22->_ignoredMessages;
    v22->_ignoredMessages = v25;

    v22->_ignoredMessagesLock._os_unfair_lock_opaque = 0;
    v27 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelationToken = v22->_cancelationToken;
    v22->_cancelationToken = v27;

    uint64_t v29 = [v59 copy];
    query = v22->_query;
    v22->_query = (EMQuery *)v29;

    v22->_initialBatchSize = a4;
    v22->_maximumBatchSize = a5;
    objc_storeStrong(p_isa + 9, a6);
    objc_storeStrong(p_isa + 10, a7);
    objc_storeStrong(p_isa + 11, a8);
    objc_storeStrong(p_isa + 13, a9);
    objc_storeWeak(p_isa + 14, obj);
    objc_storeStrong(p_isa + 12, a10);
    v31 = [(EMQuery *)v22->_query targetClassOptions];
    v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F5FDC0]];
    uint64_t v33 = [v32 copy];
    ignoreMessagesPredicate = v22->_ignoreMessagesPredicate;
    v22->_ignoreMessagesPredicate = (NSPredicate *)v33;

    if (a12) {
      unint64_t v35 = ((unint64_t)[v59 queryOptions] >> 3) & 1;
    }
    else {
      LOBYTE(v35) = 0;
    }
    v22->_shouldReconcileJournal = v35;
    v22->_addMessagesSynchronously = a13;
    v22->_keepMessagesInListOnBucketChange = a14;
    v36 = [[EDMessageQueryEvaluator alloc] initWithQuery:v59 messagePersistence:p_isa[9]];
    queryEvaluator = v22->_queryEvaluator;
    v22->_queryEvaluator = v36;

    uint64_t v38 = [MEMORY[0x1E4F60E18] promise];
    initialResultsPromise = v22->_initialResultsPromise;
    v22->_initialResultsPromise = (EFPromise *)v38;

    uint64_t v40 = [NSString stringWithFormat:@"%@-MessagesPendingFlagChangesKey-%p", objc_opt_class(), v22];
    pendingFlagChangesKey = v22->_pendingFlagChangesKey;
    v22->_pendingFlagChangesKey = (NSString *)v40;

    uint64_t v42 = [NSString stringWithFormat:@"%@-MessagesPendingConversationIDChangeKey-%p", objc_opt_class(), v22];
    pendingConversationIDChangesKey = v22->_pendingConversationIDChangesKey;
    v22->_pendingConversationIDChangesKey = (NSString *)v42;

    uint64_t v44 = [NSString stringWithFormat:@"%@-MessagesPendingReadLaterDateChangesKey-%p", objc_opt_class(), v22];
    pendingReadLaterDateChangesKey = v22->_pendingReadLaterDateChangesKey;
    v22->_pendingReadLaterDateChangesKey = (NSString *)v44;

    uint64_t v46 = [NSString stringWithFormat:@"%@-MessagesPendingDisplayDateChangesKey-%p", objc_opt_class(), v22];
    pendingDisplayDateChangesKey = v22->_pendingDisplayDateChangesKey;
    v22->_pendingDisplayDateChangesKey = (NSString *)v46;

    uint64_t v48 = [NSString stringWithFormat:@"%@-MessagesPendingCategorizationChangesKey-%p", objc_opt_class(), v22];
    pendingCategorizationChangesKey = v22->_pendingCategorizationChangesKey;
    v22->_pendingCategorizationChangesKey = (NSString *)v48;

    uint64_t v50 = [NSString stringWithFormat:@"%@-MessagesPendingCategorizationChangesKey-%p", objc_opt_class(), v22];
    pendingAuthenticationChangesKey = v22->_pendingAuthenticationChangesKey;
    v22->_pendingAuthenticationChangesKey = (NSString *)v50;
  }
  return v22;
}

- (void)dealloc
{
  [(EDMessageQueryHelper *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)EDMessageQueryHelper;
  [(EDMessageQueryHelper *)&v3 dealloc];
}

- (BOOL)updateDisplayDate
{
  v2 = [(EDMessageQueryHelper *)self query];
  objc_super v3 = [v2 targetClassOptions];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FF78]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)start
{
  if (atomic_exchange(&self->_didStart._Value, 1u))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageQueryHelper.m", 123, @"Trying to start EDMessageQueryHelper %p that was already started.", self);
  }
  objc_super v3 = [(EDMessageQueryHelper *)self remindMeNotificationController];
  v4 = [v3 addRemindMeObserver:self];

  char v5 = [(EDMessageQueryHelper *)self cancelationToken];
  [v5 addCancelable:v4];

  v6 = [(EDMessageQueryHelper *)self hookRegistry];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v6);
  v7 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__EDMessageQueryHelper_start__block_invoke;
  v10[3] = &unk_1E6C00670;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [v7 performVoucherPreservingBlock:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __29__EDMessageQueryHelper_start__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) messagePersistence];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__EDMessageQueryHelper_start__block_invoke_2;
  v3[3] = &unk_1E6BFF198;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  [v2 performDatabaseWorkInBlockWithHighPriority:v3];

  objc_destroyWeak(&v4);
}

void __29__EDMessageQueryHelper_start__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) _updateDisplayDateForMessagesIfNeeded];
  [WeakRetained registerMessageChangeHookResponder:*(void *)(a1 + 32)];
  [WeakRetained registerCategoryChangeHookResponder:*(void *)(a1 + 32)];
  [WeakRetained registerBusinessChangeHookResponder:*(void *)(a1 + 32)];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) cancelationToken];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__EDMessageQueryHelper_start__block_invoke_3;
  v5[3] = &unk_1E6C03410;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, v2);
  [v4 addCancelationBlock:v5];

  [*(id *)(a1 + 32) _getInitialResults];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __29__EDMessageQueryHelper_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    [v3 unregisterHookResponder:v4];

    id WeakRetained = v4;
  }
}

- (void)cancel
{
}

- (void)_updateDisplayDateForMessagesIfNeeded
{
  if ([(EDMessageQueryHelper *)self updateDisplayDate])
  {
    id v4 = [(EDMessageQueryHelper *)self messagePersistence];
    id v3 = [(EDMessageQueryHelper *)self query];
    [v4 updateBeforeDisplayForMessagesMatchingQuery:v3];
  }
}

- (void)_getInitialResults
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if ([(EDMessageQueryHelper *)self shouldReconcileJournal])
  {
    id v4 = [(EDMessageQueryHelper *)self messagePersistence];
    [v4 reconcileJournalWithCompletionBlock:0];
  }
  char v5 = +[EDMessageQueryHelper log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EDMessageQueryHelper *)self query];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%@ Getting initial results for message query %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__23;
  id v59 = __Block_byref_object_dispose__23;
  id v60 = (id)0xAAAAAAAAAAAAAAAALL;
  id v60 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke;
  aBlock[3] = &unk_1E6C03460;
  aBlock[4] = self;
  aBlock[5] = buf;
  aBlock[6] = &v47;
  id v7 = _Block_copy(aBlock);
  v8 = [(EDMessageQueryHelper *)self query];
  BOOL v9 = ([v8 queryOptions] & 4) == 0;

  if (v9)
  {
    v10 = [(EDMessageQueryHelper *)self query];
    if (([v10 queryOptions] & 0x20) != 0)
    {
      id v11 = [(EDMessageQueryHelper *)self searchProvider];
      v12 = [v11 localSearchProvider];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:a2 object:self file:@"EDMessageQueryHelper.m" lineNumber:199 description:@"Spotlight search query sent to handler without spotlight access"];
      }
      v14 = [(EDMessageQueryHelper *)self searchProvider];
      v15 = [v14 localSearchProvider];
      uint64_t v16 = [v15 persistenceQueryForSearchableIndexQuery:v10];

      v10 = (void *)v16;
    }
    v17 = [(EDMessageQueryHelper *)self messagePersistence];
    int64_t v18 = [(EDMessageQueryHelper *)self maximumBatchSize];
    int64_t v19 = [(EDMessageQueryHelper *)self initialBatchSize];
    v20 = [(EDMessageQueryHelper *)self cancelationToken];
    [v17 iterateMessagesMatchingQuery:v10 batchSize:v18 firstBatchSize:v19 limit:0x7FFFFFFFFFFFFFFFLL cancelationToken:v20 handler:v7];

    v21 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v48[3];
      v23 = [(EDMessageQueryHelper *)self query];
      *(_DWORD *)v51 = 138412802;
      v52 = self;
      __int16 v53 = 2048;
      uint64_t v54 = v22;
      __int16 v55 = 2112;
      id v56 = v23;
      _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "%@ found %lu initial results for message query %@", v51, 0x20u);
    }
  }
  v24 = [(EDMessageQueryHelper *)self delegate];
  v25 = [(EDMessageQueryHelper *)self scheduler];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_38;
  v44[3] = &unk_1E6BFFAF0;
  v44[4] = self;
  id v26 = v24;
  id v45 = v26;
  [v25 performSyncBlock:v44];

  v27 = [(EDMessageQueryHelper *)self initialResultsPromise];
  [v27 finishWithResult:MEMORY[0x1E4F1CC38]];

  v28 = [(EDMessageQueryHelper *)self query];
  BOOL v29 = ([v28 queryOptions] & 2) == 0;

  if (!v29)
  {
    v30 = [(EDMessageQueryHelper *)self searchProvider];
    v31 = [v30 remoteSearchProvider];

    v32 = [(EDMessageQueryHelper *)self query];
    unint64_t v33 = [v32 queryOptions];

    v34 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v35 = @"server-side";
      if ((v33 & 0x10) != 0) {
        unint64_t v35 = @"locally indexed";
      }
      *(_DWORD *)v51 = 138412290;
      v52 = (EDMessageQueryHelper *)v35;
      _os_log_impl(&dword_1DB39C000, v34, OS_LOG_TYPE_DEFAULT, "Performing %@ remote search", v51, 0xCu);
    }

    v36 = [(EDMessageQueryHelper *)self query];
    v37 = [v31 fetchRemoteMessagesWithQuery:v36 delegate:self useLocalIndex:(v33 >> 4) & 1];

    if (v37)
    {
      uint64_t v38 = [(EDMessageQueryHelper *)self cancelationToken];
      [v38 addCancelable:v37];
    }
    else
    {
      v39 = [(EDMessageQueryHelper *)self scheduler];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_45;
      v41[3] = &unk_1E6BFFAF0;
      id v42 = v26;
      v43 = self;
      [v39 performSyncBlock:v41];

      uint64_t v38 = v42;
    }
  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);
}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) cancelationToken];
  char v8 = [v7 isCanceled];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v9)
    {
      [v9 timeIntervalSinceNow];
      if (v10 < -5.0) {
        EFSaveTailspin();
      }
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;
    }
    if ([v5 count])
    {
      BOOL v13 = [*(id *)(a1 + 32) scheduler];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_2;
      v20[3] = &unk_1E6C03438;
      v20[4] = *(void *)(a1 + 32);
      id v14 = v5;
      uint64_t v15 = *(void *)(a1 + 48);
      id v21 = v14;
      uint64_t v22 = v15;
      [v13 performSyncBlock:v20];

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v14 count];
    }
    else if (!v5)
    {
      uint64_t v16 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int64_t v18 = objc_msgSend(v6, "ef_publicDescription");
        int64_t v19 = [*(id *)(a1 + 32) query];
        *(_DWORD *)buf = 134218498;
        uint64_t v24 = v17;
        __int16 v25 = 2114;
        id v26 = v18;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "%p: Received error %{public}@ while performing initial query: %@", buf, 0x20u);
      }
    }
  }
}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelper:*(void *)(a1 + 32) didFindMessages:*(void *)(a1 + 40) forInitialBatch:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0];
}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke_38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cancelationToken];
  char v3 = [v2 isCanceled];

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    [v4 queryHelperDidFindAllMessages:v5];
  }
}

uint64_t __42__EDMessageQueryHelper__getInitialResults__block_invoke_45(uint64_t a1)
{
  return [*(id *)(a1 + 32) queryHelperDidFinishRemoteSearch:*(void *)(a1 + 40)];
}

- (id)_predicateWithAdditionalPredicates:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  uint64_t v24 = [(EDMessageQueryHelper *)self query];
  os_unfair_lock_lock(&self->_noLongerMatchingMessagesLock);
  id v4 = [(NSMutableSet *)self->_noLongerMatchingMessages allObjects];
  uint64_t v5 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);

  os_unfair_lock_unlock(&self->_noLongerMatchingMessagesLock);
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F60320] predicateForMessagesWithObjectIDs:v5];
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    char v8 = [v24 predicate];
    v27[0] = v8;
    v27[1] = v6;
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    double v10 = [v7 orPredicateWithSubpredicates:v9];
  }
  else
  {
    double v10 = [v24 predicate];
  }
  p_ignoredMessagesLock = &self->_ignoredMessagesLock;
  os_unfair_lock_lock(&self->_ignoredMessagesLock);
  v12 = [(NSMutableSet *)self->_ignoredMessages allObjects];
  BOOL v13 = objc_msgSend(v12, "ef_mapSelector:", sel_objectID);

  os_unfair_lock_unlock(p_ignoredMessagesLock);
  if ([v13 count])
  {
    id v14 = (void *)MEMORY[0x1E4F28BA0];
    v26[0] = v10;
    uint64_t v15 = [MEMORY[0x1E4F60320] predicateForExcludingMessagesWithObjectIDs:v13];
    v26[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v17 = [v14 andPredicateWithSubpredicates:v16];

    double v10 = (void *)v17;
  }
  int64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  v25[0] = v10;
  v25[1] = v23;
  int64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v20 = objc_msgSend(v19, "ef_flatten");
  id v21 = [v18 andPredicateWithSubpredicates:v20];

  return v21;
}

- (id)messagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDMessageQueryHelper *)self _predicateWithAdditionalPredicates:v6];
  char v8 = [(EDMessageQueryHelper *)self query];
  BOOL v9 = [v8 queryWithPredicate:v7];

  if (([v9 queryOptions] & 0x20) != 0)
  {
    double v10 = [(EDMessageQueryHelper *)self searchProvider];
    uint64_t v11 = [v10 localSearchProvider];
    uint64_t v12 = [v11 persistenceQueryForSearchableIndexQuery:v9];

    BOOL v9 = (void *)v12;
  }
  BOOL v13 = +[EDMessageQueryHelper log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (id)objc_opt_class();
    uint64_t v15 = [v9 predicate];
    uint64_t v16 = objc_msgSend(v15, "ef_publicDescription");
    int v20 = 138412802;
    id v21 = v14;
    __int16 v22 = 2048;
    id v23 = self;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "<%@ %p> Fetching messages matching query %@", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v17 = [(EDMessageQueryHelper *)self messagePersistence];
  int64_t v18 = [v17 messagesMatchingQuery:v9 limit:a4];

  return v18;
}

- (id)_filteredMessagesForPredicate:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(EDMessageQueryHelper *)self query];
  char v8 = [v7 queryWithPredicate:v6];

  if (([v8 queryOptions] & 0x20) != 0)
  {
    BOOL v9 = [(EDMessageQueryHelper *)self searchProvider];
    double v10 = [v9 localSearchProvider];
    uint64_t v11 = [v10 persistenceQueryForSearchableIndexQuery:v8];

    char v8 = (void *)v11;
  }
  uint64_t v12 = [(EDMessageQueryHelper *)self messagePersistence];
  BOOL v13 = [v12 messagesMatchingQuery:v8 limit:a4];

  id v14 = [(EDMessageQueryHelper *)self queryEvaluator];
  uint64_t v15 = [v14 filterMessages:v13 unmatchedMessages:0];

  return v15;
}

- (id)sortableMessagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4
{
  id v6 = [(EDMessageQueryHelper *)self _predicateWithAdditionalPredicates:a3];
  id v7 = [(EDMessageQueryHelper *)self query];
  char v8 = [v7 queryWithTargetClass:objc_opt_class() predicate:v6];

  if (([v8 queryOptions] & 0x20) != 0)
  {
    BOOL v9 = [(EDMessageQueryHelper *)self searchProvider];
    double v10 = [v9 localSearchProvider];
    uint64_t v11 = [v10 persistenceQueryForSearchableIndexQuery:v8];

    char v8 = (void *)v11;
  }
  uint64_t v12 = [(EDMessageQueryHelper *)self messagePersistence];
  BOOL v13 = [v12 sortableMessagesMatchingQuery:v8 limit:a4];

  return v13;
}

- (void)_foundMessages:(id)a3 inRemoteSearch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDMessageQueryHelper *)self query];
  char v8 = [v7 sortDescriptors];
  BOOL v9 = [v8 firstObject];
  char v10 = [v9 ascending];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke;
  v35[3] = &__block_descriptor_33_e55_q24__0___EDPersistedMessage__8___EDPersistedMessage__16l;
  char v36 = v10;
  uint64_t v11 = [v6 sortedArrayWithOptions:16 usingComparator:v35];

  uint64_t v12 = (void *)v11;
  if (v4)
  {
    BOOL v13 = [(EDMessageQueryHelper *)self searchProvider];
    id v14 = [v13 remoteSearchProvider];

    uint64_t v15 = [(EDMessageQueryHelper *)self query];
    unint64_t v16 = [v15 queryOptions];

    if (((v16 >> 4) & 1 | (v14 == 0)) == 1)
    {
      id v17 = v12;
    }
    else
    {
      int64_t v19 = [(EDMessageQueryHelper *)self searchProvider];
      int v20 = [v19 remoteSearchProvider];
      id v21 = [(EDMessageQueryHelper *)self query];
      id v17 = [v20 verifyResults:v12 query:v21];
    }
    __int16 v22 = [(EDMessageQueryHelper *)self queryEvaluator];
    int64_t v18 = [v22 transformMessages:v17];
  }
  else
  {
    int64_t v18 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v11 includeDeleted:0 removeIgnoredMessages:0];
  }
  if ([v18 count])
  {
    id v23 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v18 count];
      __int16 v25 = [(EDMessageQueryHelper *)self query];
      *(_DWORD *)buf = 134218498;
      uint64_t v38 = self;
      __int16 v39 = 1024;
      int v40 = v24;
      __int16 v41 = 2112;
      id v42 = v25;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "%p: Adding %u filtered messages: %@", buf, 0x1Cu);
    }
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke_53;
    v31 = &unk_1E6BFF7A8;
    id v32 = v18;
    id v33 = v12;
    v34 = self;
    uint64_t v26 = _Block_copy(&v28);
    if ([(EDMessageQueryHelper *)self addMessagesSynchronously])
    {
      __int16 v27 = [(EDMessageQueryHelper *)self scheduler];
      [v27 performSyncBlock:v26];
    }
    else
    {
      __int16 v27 = [(EDMessageQueryHelper *)self scheduler];
      [v27 performBlock:v26];
    }
  }
}

uint64_t __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 persistedMessageID];
  uint64_t v7 = [v6 databaseID];

  char v8 = [v5 persistedMessageID];
  uint64_t v9 = [v8 databaseID];

  if (v7 != v9)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      if (v7 < v9)
      {
LABEL_5:
        uint64_t v10 = -1;
        goto LABEL_8;
      }
    }
    else if (v7 > v9)
    {
      goto LABEL_5;
    }
    uint64_t v10 = 1;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

void __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke_53(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = EFFetchSignpostLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  BOOL v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v6 = [*(id *)(a1 + 40) count];
    v10[0] = 67109120;
    v10[1] = v6;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "QueryHelperDidAddMessages Callback", "count=%{signpost.description:attribute}u ", (uint8_t *)v10, 8u);
  }

  uint64_t v7 = [*(id *)(a1 + 48) delegate];
  [v7 queryHelper:*(void *)(a1 + 48) didAddMessages:*(void *)(a1 + 32)];

  char v8 = v5;
  uint64_t v9 = v8;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v9, OS_SIGNPOST_INTERVAL_END, v3, "QueryHelperDidAddMessages Callback", "", (uint8_t *)v10, 2u);
  }
}

- (id)_unjournaledMessagesForMessages:(id)a3
{
  os_signpost_id_t v3 = objc_msgSend(a3, "ef_filter:", &__block_literal_global_49);

  return v3;
}

uint64_t __56__EDMessageQueryHelper__unjournaledMessagesForMessages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isJournaled] ^ 1;
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(EDMessageQueryHelper *)self query];
  char v7 = [v6 queryOptions];

  if ((v7 & 4) == 0)
  {
    char v8 = EFFetchSignpostLog();
    if (os_signpost_enabled(v8))
    {
      int v10 = 134218240;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      int v13 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v5, "count"));
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryHelperDidAddMessages", "helper=%p count=%u ", (uint8_t *)&v10, 0x12u);
    }

    uint64_t v9 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v5];

    id v5 = (id)v9;
    [(EDMessageQueryHelper *)self _foundMessages:v9 inRemoteSearch:0];
  }
}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = +[EDMessageQueryHelper log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[EDMessageQueryHelper persistenceDidDeleteAllMessagesInMailboxesWithURLs:generationWindow:]((uint64_t)self, [v5 count], buf, v6);
  }

  char v7 = [(EDMessageQueryHelper *)self scheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__EDMessageQueryHelper_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke;
  v8[3] = &unk_1E6BFF2F0;
  v8[4] = self;
  [v7 performBlock:v8];
}

void __92__EDMessageQueryHelper_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelperNeedsRestart:*(void *)(a1 + 32)];
}

- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(EDMessageQueryHelper *)self initialResultsPromise];
  uint64_t v9 = [v8 future];

  uint64_t v10 = [v9 resultIfAvailable];

  if (!v10)
  {
    uint64_t v11 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v6 count];
      int v13 = [(EDMessageQueryHelper *)self query];
      *(_DWORD *)buf = 134218498;
      int v20 = self;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 2112;
      int v24 = v13;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Holding %u reconciled persisted messages until initial results: %@", buf, 0x1Cu);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__EDMessageQueryHelper_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke;
  v16[3] = &unk_1E6C034A8;
  v16[4] = self;
  id v14 = v6;
  id v17 = v14;
  id v15 = v7;
  id v18 = v15;
  [v9 addSuccessBlock:v16];
}

uint64_t __82__EDMessageQueryHelper_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistenceDidReconcileJournaledMessages:*(void *)(a1 + 40) generationWindow:*(void *)(a1 + 48)];
}

- (void)_persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(EDMessageQueryHelper *)self query];
  char v7 = [v6 queryOptions];

  if ((v7 & 0x20) != 0)
  {
    char v8 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", buf, 2u);
    }
  }
  else
  {
    char v8 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v5 includeDeleted:0 removeIgnoredMessages:0];
    if ([v8 count])
    {
      uint64_t v9 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [v8 count];
        uint64_t v11 = [(EDMessageQueryHelper *)self query];
        *(_DWORD *)buf = 134218498;
        int v22 = self;
        __int16 v23 = 1024;
        int v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Reconciled %u filtered messages: %@", buf, 0x1Cu);
      }
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __83__EDMessageQueryHelper__persistenceDidReconcileJournaledMessages_generationWindow___block_invoke;
      id v18 = &unk_1E6BFFAF0;
      int64_t v19 = self;
      int v12 = v8;
      int v20 = v12;
      int v13 = _Block_copy(&v15);
      if ([(EDMessageQueryHelper *)self addMessagesSynchronously])
      {
        id v14 = [(EDMessageQueryHelper *)self scheduler];
        [v14 performSyncBlock:v13];
      }
      else
      {
        id v14 = [(EDMessageQueryHelper *)self scheduler];
        [v14 performBlock:v13];
      }

      char v8 = v12;
    }
  }
}

void __83__EDMessageQueryHelper__persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelper:*(void *)(a1 + 32) didAddMessages:*(void *)(a1 + 40)];
}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  char v7 = [(EDMessageQueryHelper *)self query];
  char v8 = [v7 queryOptions];

  if ((v8 & 4) == 0 && (![v14 deletedChanged] || (objc_msgSend(v14, "deleted") & 1) == 0))
  {
    uint64_t v9 = [MEMORY[0x1E4F29060] currentThread];
    int v10 = [v9 threadDictionary];

    uint64_t v11 = [(EDMessageQueryHelper *)self queryEvaluator];
    int v12 = [v11 transformAndFilterMessages:v6];

    int v13 = [(EDMessageQueryHelper *)self pendingFlagChangesKey];
    [v10 setObject:v12 forKeyedSubscript:v13];
  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(EDMessageQueryHelper *)self query];
  LOBYTE(a4) = [v9 queryOptions];

  if ((a4 & 4) != 0)
  {
    int v10 = v8;
  }
  else
  {
    int v10 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v8];

    if ([v7 deletedChanged] && objc_msgSend(v7, "deleted"))
    {
      [(EDMessageQueryHelper *)self _persistenceDidDeleteMessages:v10 includeMessagesWithDeletedFlag:1];
    }
    else
    {
      uint64_t v11 = [(EDMessageQueryHelper *)self pendingFlagChangesKey];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__EDMessageQueryHelper_persistenceDidChangeFlags_messages_generationWindow___block_invoke;
      v12[3] = &unk_1E6C034D0;
      v12[4] = self;
      [(EDMessageQueryHelper *)self _calculateAndReportChangesForPersistedMessages:v10 withPendingChangesKey:v11 changeBlock:v12];
    }
  }
}

void __76__EDMessageQueryHelper_persistenceDidChangeFlags_messages_generationWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 queryHelper:*(void *)(a1 + 32) messageFlagsDidChangeForMessages:v5 previousMessages:v7];
}

- (void)persistenceWillChangeReadLaterDate:(id)a3 messages:(id)a4
{
  id v10 = a4;
  id v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];

  id v7 = [(EDMessageQueryHelper *)self queryEvaluator];
  id v8 = [v7 transformAndFilterMessages:v10];

  uint64_t v9 = [(EDMessageQueryHelper *)self pendingReadLaterDateChangesKey];
  [v6 setObject:v8 forKeyedSubscript:v9];
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  id v10 = [(EDMessageQueryHelper *)self pendingReadLaterDateChangesKey];
  v13[0] = *MEMORY[0x1E4F5FEF8];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  int v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "latestGeneration"));
  [(EDMessageQueryHelper *)self _reportChangesForPersistedMessages:v8 withPendingChangesKey:v10 keyPaths:v11 generation:v12];
}

- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5
{
  id v8 = [(EDMessageQueryHelper *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__EDMessageQueryHelper_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke;
  v9[3] = &unk_1E6C034F8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  [v8 performBlock:v9];
}

void __106__EDMessageQueryHelper_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelper:*(void *)(a1 + 32) conversationNotificationLevelDidChangeForConversation:*(void *)(a1 + 40) conversationID:*(void *)(a1 + 48)];
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  id v6 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v5];

  -[EDMessageQueryHelper _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:](self, "_persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:");
}

- (void)_persistenceDidDeleteMessages:(id)a3 includeMessagesWithDeletedFlag:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v6 includeDeleted:v4 removeIgnoredMessages:1];
  if ([v7 count])
  {
    __int16 v23 = objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
    int v24 = objc_msgSend(MEMORY[0x1E4F60320], "predicateForMessagesWithObjectIDs:");
    id v8 = -[EDMessageQueryHelper _filteredMessagesForPredicate:limit:](self, "_filteredMessagesForPredicate:limit:");
    if ([v8 count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v32 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v30;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = [*(id *)(*((void *)&v29 + 1) + 8 * v13) objectID];
            [v9 addObject:v14];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v11);
      }

      uint64_t v15 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(EDMessageQueryHelper *)self query];
        *(_DWORD *)buf = 134218498;
        v34 = self;
        __int16 v35 = 2114;
        *(void *)char v36 = v9;
        *(_WORD *)&v36[8] = 2114;
        *(void *)&v36[10] = v16;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "%p: Not deleting objectIDs with still existent duplicates: %{public}@\n%{public}@", buf, 0x20u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke;
      void v27[3] = &unk_1E6BFF8B8;
      id v17 = v9;
      id v28 = v17;
      uint64_t v18 = objc_msgSend(v7, "ef_filter:", v27);

      id v7 = (void *)v18;
    }
    if ([v7 count])
    {
      int64_t v19 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = [v7 count];
        __int16 v21 = [(EDMessageQueryHelper *)self query];
        *(_DWORD *)buf = 134218498;
        v34 = self;
        __int16 v35 = 1024;
        *(_DWORD *)char v36 = v20;
        *(_WORD *)&v36[4] = 2112;
        *(void *)&v36[6] = v21;
        _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "%p: Deleting %u filtered messages: %@", buf, 0x1Cu);
      }
      int v22 = [(EDMessageQueryHelper *)self scheduler];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke_61;
      v25[3] = &unk_1E6BFFAF0;
      v25[4] = self;
      id v26 = v7;
      [v22 performBlock:v25];
    }
  }
}

uint64_t __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  os_signpost_id_t v3 = [a2 objectID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke_61(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelper:*(void *)(a1 + 32) didDeleteMessages:*(void *)(a1 + 40)];
}

- (void)persistenceWillChangeConversationID:(int64_t)a3 messages:(id)a4
{
  id v6 = a4;
  id v15 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v6];

  id v7 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v15 includeDeleted:0 removeIgnoredMessages:0];
  if ([v7 count])
  {
    id v8 = [MEMORY[0x1E4F29060] currentThread];
    id v9 = [v8 threadDictionary];

    id v10 = [(EDMessageQueryHelper *)self pendingConversationIDChangesKey];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      uint64_t v12 = [NSNumber numberWithLongLong:a3];
      [v11 setObject:v7 forKeyedSubscript:v12];
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v14 = [NSNumber numberWithLongLong:a3];
      uint64_t v11 = objc_msgSend(v13, "initWithObjectsAndKeys:", v7, v14, 0);

      uint64_t v12 = [(EDMessageQueryHelper *)self pendingConversationIDChangesKey];
      [v9 setObject:v11 forKeyedSubscript:v12];
    }
  }
}

- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7 = a4;
  id v8 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v7];

  id v9 = [MEMORY[0x1E4F29060] currentThread];
  id v10 = [v9 threadDictionary];

  uint64_t v11 = [(EDMessageQueryHelper *)self pendingConversationIDChangesKey];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  id v13 = [NSNumber numberWithLongLong:a3];
  id v14 = [v12 objectForKeyedSubscript:v13];

  id v15 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v8 includeDeleted:0 removeIgnoredMessages:0];
  if ([v15 count] || objc_msgSend(v14, "count"))
  {
    uint64_t v16 = [NSNumber numberWithLongLong:a3];
    [v12 setObject:0 forKeyedSubscript:v16];

    if (![v12 count])
    {
      id v17 = [(EDMessageQueryHelper *)self pendingConversationIDChangesKey];
      [v10 setObject:0 forKeyedSubscript:v17];
    }
    uint64_t v18 = [(EDMessageQueryHelper *)self scheduler];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__EDMessageQueryHelper_persistenceIsChangingConversationID_messages_generationWindow___block_invoke;
    v19[3] = &unk_1E6C03520;
    id v20 = v15;
    __int16 v21 = self;
    int64_t v23 = a3;
    id v22 = v14;
    [v18 performBlock:v19];
  }
}

void __86__EDMessageQueryHelper_persistenceIsChangingConversationID_messages_generationWindow___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v6 = [*(id *)(a1 + 40) delegate];
    [v6 queryHelper:*(void *)(a1 + 40) conversationIDDidChangeForMessages:*(void *)(a1 + 32) fromConversationID:*(void *)(a1 + 56)];
  }
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2 != [*(id *)(a1 + 48) count])
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 48)];
    objc_msgSend(v7, "ef_removeObjectsInArray:", *(void *)(a1 + 32));
    if ([v7 count])
    {
      os_signpost_id_t v3 = [*(id *)(a1 + 40) delegate];
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [v7 allObjects];
      [v3 queryHelper:v4 didDeleteMessages:v5];
    }
  }
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (([v9 isJournaled] & 1) == 0)
  {
    id v29 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v11 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v10 includeDeleted:0 removeIgnoredMessages:1];
    uint64_t v12 = [v11 firstObject];

    if (v12)
    {
      id v13 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v12 objectID];
        uint64_t v15 = [v14 globalMessageID];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&uint8_t buf[24] = a3;
        *(_WORD *)&buf[32] = 2048;
        *(void *)&buf[34] = v15;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Updating global message id for message: %{public}@ oldGlobalMessageID %llu newGlobalMessageID %llu", buf, 0x2Au);
      }
      id v16 = objc_alloc(MEMORY[0x1E4F603A0]);
      id v17 = [v12 objectID];
      uint64_t v18 = [v17 mailboxScope];
      int64_t v19 = (void *)[v16 initWithGlobalMessageID:a3 mailboxScope:v18];

      id v20 = [v12 objectID];
      LOBYTE(v16) = [v20 isEqual:v19];

      if (v16)
      {
        __int16 v21 = +[EDMessageQueryHelper log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          int64_t v23 = [v12 itemID];
          *(_DWORD *)buf = 134218754;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&uint8_t buf[24] = v12;
          *(_WORD *)&buf[32] = 2112;
          *(void *)&buf[34] = v19;
          _os_log_debug_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", buf, 0x2Au);
        }
        memset(buf, 170, sizeof(buf));
        *(_DWORD *)&buf[32] = 0;
        *(void *)long long v31 = 0xE00000001;
        int v32 = 1;
        pid_t v33 = getpid();
        size_t v28 = 648;
        if (!sysctl(v31, 4u, buf, &v28, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
        {
          __debugbreak();
          JUMPOUT(0x1DB49B364);
        }
      }
      else
      {
        id v22 = [(EDMessageQueryHelper *)self scheduler];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __102__EDMessageQueryHelper_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
        v24[3] = &unk_1E6C03520;
        v24[4] = self;
        id v25 = v12;
        id v26 = v19;
        int64_t v27 = a4;
        [v22 performBlock:v24];
      }
    }
  }
}

void __102__EDMessageQueryHelper_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelper:*(void *)(a1 + 32) objectIDDidChangeForMessage:*(void *)(a1 + 40) oldObjectID:*(void *)(a1 + 48) oldConversationID:*(void *)(a1 + 56)];
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v8 isJournaled] & 1) == 0)
  {
    id v9 = [(EDMessageQueryHelper *)self query];
    char v10 = [v9 queryOptions];

    if ((v10 & 4) == 0)
    {
      v19[0] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      uint64_t v12 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v11 includeDeleted:0 removeIgnoredMessages:1];

      if ([v12 count])
      {
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        id v13 = [(EDMessageQueryHelper *)self scheduler];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
        v14[3] = &unk_1E6C03548;
        objc_copyWeak(&v17, &location);
        id v15 = v7;
        id v16 = v12;
        [v13 performBlock:v14];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_signpost_id_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained cancelationToken];
    char v5 = [v4 isCanceled];

    if ((v5 & 1) == 0)
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "ef_compactMap:", &__block_literal_global_66_0);
      if ([v6 count])
      {
        id v7 = +[EDMessageQueryHelper log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          int v10 = 134218498;
          uint64_t v11 = v3;
          __int16 v12 = 2112;
          uint64_t v13 = v9;
          __int16 v14 = 2112;
          id v15 = v6;
          _os_log_debug_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEBUG, "%p: persistenceDidUpdateProperties %@\nkeyPaths %@", (uint8_t *)&v10, 0x20u);
        }

        id v8 = [v3 delegate];
        [v8 queryHelper:v3 didUpdateMessages:*(void *)(a1 + 40) forKeyPaths:v6];
      }
    }
  }
}

id __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:*MEMORY[0x1E4F60790]])
  {
    os_signpost_id_t v3 = (id *)MEMORY[0x1E4F5FF40];
LABEL_11:
    id v4 = *v3;
    goto LABEL_12;
  }
  if ([v2 isEqualToString:*MEMORY[0x1E4F60798]])
  {
    os_signpost_id_t v3 = (id *)MEMORY[0x1E4F5FF48];
    goto LABEL_11;
  }
  if ([v2 isEqualToString:@"GeneratedSummary"])
  {
    os_signpost_id_t v3 = (id *)MEMORY[0x1E4F5FE70];
    goto LABEL_11;
  }
  if ([v2 isEqualToString:*MEMORY[0x1E4F60788]])
  {
    os_signpost_id_t v3 = (id *)MEMORY[0x1E4F5FE90];
    goto LABEL_11;
  }
  if ([v2 isEqualToString:@"AuthenticationState"])
  {
    os_signpost_id_t v3 = (id *)MEMORY[0x1E4F5FDC8];
    goto LABEL_11;
  }
  id v4 = 0;
LABEL_12:

  return v4;
}

- (void)persistenceWillUpdateDisplayDateForMessages:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  char v5 = [v4 threadDictionary];

  id v6 = [(EDMessageQueryHelper *)self queryEvaluator];
  id v7 = [v6 transformAndFilterMessages:v9];

  id v8 = [(EDMessageQueryHelper *)self pendingDisplayDateChangesKey];
  [v5 setObject:v7 forKeyedSubscript:v8];
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(EDMessageQueryHelper *)self pendingDisplayDateChangesKey];
  v11[0] = *MEMORY[0x1E4F5FE38];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  int v10 = [NSNumber numberWithLongLong:a5];
  [(EDMessageQueryHelper *)self _reportChangesForPersistedMessages:v7 withPendingChangesKey:v8 keyPaths:v9 generation:v10];
}

- (void)persistenceWillUpdateAuthenticationStateForMessages:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x1E4F29060] currentThread];
  char v5 = [v4 threadDictionary];

  id v6 = [(EDMessageQueryHelper *)self queryEvaluator];
  id v7 = [v6 transformAndFilterMessages:v9];

  id v8 = [(EDMessageQueryHelper *)self pendingAuthenticationChangesKey];
  [v5 setObject:v7 forKeyedSubscript:v8];
}

- (void)persistenceDidUpdateAuthenticationStateForMessages:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EDMessageQueryHelper *)self pendingAuthenticationChangesKey];
  v7[0] = *MEMORY[0x1E4F5FDC8];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(EDMessageQueryHelper *)self _reportChangesForPersistedMessages:v4 withPendingChangesKey:v5 keyPaths:v6 generation:0];
}

- (void)persistenceWillChangeCategorizationForMessages:(id)a3
{
  id v11 = a3;
  id v4 = [(EDMessageQueryHelper *)self query];
  char v5 = [v4 queryOptions];

  if ((v5 & 4) == 0)
  {
    id v6 = [MEMORY[0x1E4F29060] currentThread];
    id v7 = [v6 threadDictionary];

    id v8 = [(EDMessageQueryHelper *)self queryEvaluator];
    id v9 = [v8 transformAndFilterMessages:v11];

    int v10 = [(EDMessageQueryHelper *)self pendingCategorizationChangesKey];
    [v7 setObject:v9 forKeyedSubscript:v10];
  }
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageQueryHelper *)self query];
  char v9 = [v8 queryOptions];

  if ((v9 & 4) != 0)
  {
    int v10 = v6;
  }
  else
  {
    int v10 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v6];

    id v11 = [(EDMessageQueryHelper *)self pendingCategorizationChangesKey];
    uint64_t v12 = *MEMORY[0x1E4F5FDF8];
    v15[0] = *MEMORY[0x1E4F5FE00];
    v15[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    __int16 v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "latestGeneration"));
    [(EDMessageQueryHelper *)self _reportChangesForPersistedMessages:v10 withPendingChangesKey:v11 keyPaths:v13 generation:v14];
  }
}

- (void)persistenceDidNotChangeCategorizationForMessages:(id)a3
{
  id v7 = [(EDMessageQueryHelper *)self query];
  char v4 = [v7 queryOptions];

  if ((v4 & 4) == 0)
  {
    id v8 = [MEMORY[0x1E4F29060] currentThread];
    char v5 = [v8 threadDictionary];
    id v6 = [(EDMessageQueryHelper *)self pendingCategorizationChangesKey];
    [v5 setObject:0 forKeyedSubscript:v6];
  }
}

- (void)persistenceDidChangeBusinessIDForMessages:(id)a3 fromBusinessID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v6];

  id v8 = [(EDMessageQueryHelper *)self query];
  LOBYTE(v6) = [v8 queryOptions];

  if ((v6 & 4) == 0)
  {
    char v9 = [(EDMessageQueryHelper *)self _transformAndFilterMessages:v7 includeDeleted:0 removeIgnoredMessages:1];
    if ([v9 count])
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      int v10 = [(EDMessageQueryHelper *)self scheduler];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __81__EDMessageQueryHelper_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke;
      v11[3] = &unk_1E6C03570;
      objc_copyWeak(v13, &location);
      id v12 = v9;
      v13[1] = (id)a4;
      [v10 performBlock:v11];

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __81__EDMessageQueryHelper_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_signpost_id_t v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained cancelationToken];
    char v5 = [v4 isCanceled];

    if ((v5 & 1) == 0)
    {
      id v6 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __81__EDMessageQueryHelper_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke_cold_1((uint64_t)v3, a1, v6);
      }

      id v7 = [v3 delegate];
      [v7 queryHelper:v3 businessIDDidChangeForMessages:*(void *)(a1 + 32) fromBusinessID:*(void *)(a1 + 48)];
    }
  }
}

- (void)_reportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 keyPaths:(id)a5 generation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v19 = [(EDMessageQueryHelper *)self _unjournaledMessagesForMessages:v10];

  __int16 v14 = [(EDMessageQueryHelper *)self queryEvaluator];
  id v15 = [v14 transformAndFilterMessages:v19];

  uint64_t v16 = [MEMORY[0x1E4F29060] currentThread];
  id v17 = [v16 threadDictionary];

  uint64_t v18 = [v17 objectForKeyedSubscript:v11];
  [v17 setObject:0 forKeyedSubscript:v11];
  [(EDMessageQueryHelper *)self _reportChangesForCurrentlyMatchingMessages:v15 previouslyMatchingMessages:v18 keyPaths:v12 generation:v13];
}

- (void)_reportChangesForCurrentlyMatchingMessages:(id)a3 previouslyMatchingMessages:(id)a4 keyPaths:(id)a5 generation:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = a4;
  id v11 = a5;
  id v24 = a6;
  id v12 = [(EDMessageQueryHelper *)self query];
  LOBYTE(a5) = [v12 queryOptions];

  if ((a5 & 0x20) != 0)
  {
    __int16 v21 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", buf, 2u);
    }
  }
  else
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v25];
    __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v26];
    id v15 = (void *)[v13 mutableCopy];
    [v15 intersectSet:v14];
    [v13 minusSet:v15];
    [v14 minusSet:v15];
    uint64_t v16 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      uint64_t v34 = self;
      __int16 v35 = 2114;
      id v36 = v17;
      __int16 v37 = 2114;
      id v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = [v14 count];
      __int16 v41 = 2048;
      uint64_t v42 = [v13 count];
      __int16 v43 = 2048;
      uint64_t v44 = [v15 count];
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ - schedule changes for keyPaths:%{public}@ removed=%lu added=%lu changed=%lu", buf, 0x3Eu);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__EDMessageQueryHelper__reportChangesForCurrentlyMatchingMessages_previouslyMatchingMessages_keyPaths_generation___block_invoke;
    aBlock[3] = &unk_1E6BFFAA0;
    id v18 = v14;
    id v28 = v18;
    id v29 = self;
    id v19 = v15;
    id v30 = v19;
    id v20 = v11;
    id v31 = v20;
    __int16 v21 = v13;
    int v32 = v21;
    id v22 = _Block_copy(aBlock);
    if ([v21 count]
      && [(EDMessageQueryHelper *)self addMessagesSynchronously])
    {
      int64_t v23 = [(EDMessageQueryHelper *)self scheduler];
      [v23 performSyncBlock:v22];
    }
    else
    {
      [(EDMessageQueryHelper *)self _performBlockAfterGenerationCheck:v22 generation:v24 keyPaths:v20 removedMessages:v18 changedMessages:v19 addedMessages:v21];
    }
  }
}

void __114__EDMessageQueryHelper__reportChangesForCurrentlyMatchingMessages_previouslyMatchingMessages_keyPaths_generation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v8 = [*(id *)(a1 + 40) delegate];
    uint64_t v2 = *(void *)(a1 + 40);
    os_signpost_id_t v3 = [*(id *)(a1 + 32) allObjects];
    [v8 queryHelper:v2 didDeleteMessages:v3];
  }
  if ([*(id *)(a1 + 48) count])
  {
    id v9 = [*(id *)(a1 + 40) delegate];
    uint64_t v4 = *(void *)(a1 + 40);
    char v5 = [*(id *)(a1 + 48) allObjects];
    [v9 queryHelper:v4 didUpdateMessages:v5 forKeyPaths:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 64) count])
  {
    id v10 = [*(id *)(a1 + 40) delegate];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 64) allObjects];
    [v10 queryHelper:v6 didAddMessages:v7];
  }
}

- (void)_performBlockAfterGenerationCheck:(id)a3 generation:(id)a4 keyPaths:(id)a5 removedMessages:(id)a6 changedMessages:(id)a7 addedMessages:(id)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v33 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  id v20 = [(EDMessageQueryHelper *)self messagePersistence];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __124__EDMessageQueryHelper__performBlockAfterGenerationCheck_generation_keyPaths_removedMessages_changedMessages_addedMessages___block_invoke;
  v41[3] = &unk_1E6C03598;
  void v41[4] = &v42;
  [v20 performDatabaseReadBlock:v41];

  if (v16 && (uint64_t v21 = v43[3], v21 <= [v16 longLongValue]))
  {
    int64_t v23 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v17;
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v33 count];
      uint64_t v25 = [v19 count];
      uint64_t v26 = [v18 count];
      uint64_t v27 = v43[3];
      uint64_t v28 = [v16 longLongValue];
      *(_DWORD *)buf = 134220034;
      uint64_t v47 = self;
      __int16 v48 = 2114;
      id v49 = v24;
      __int16 v50 = 2114;
      id v51 = v32;
      __int16 v52 = 2048;
      uint64_t v53 = v31;
      __int16 v54 = 2048;
      uint64_t v55 = v25;
      __int16 v56 = 2048;
      uint64_t v57 = v26;
      __int16 v58 = 2048;
      uint64_t v59 = 0x3FC0000000000000;
      __int16 v60 = 2048;
      uint64_t v61 = v27;
      id v17 = v32;
      __int16 v62 = 2048;
      uint64_t v63 = v28;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ - rescheduling changes for keyPaths:%{public}@ removed=%lu added=%lu changed=%lu after %.3f due to generation %lld not being higher than generation window of the change %lld", buf, 0x5Cu);
    }
    id v29 = [(EDMessageQueryHelper *)self scheduler];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __124__EDMessageQueryHelper__performBlockAfterGenerationCheck_generation_keyPaths_removedMessages_changedMessages_addedMessages___block_invoke_68;
    v34[3] = &unk_1E6C035C0;
    v34[4] = self;
    id v40 = v15;
    id v35 = v16;
    id v36 = v17;
    id v37 = v33;
    id v38 = v18;
    id v39 = v19;
    id v30 = (id)[v29 afterDelay:v34 performBlock:0.125];
  }
  else
  {
    id v22 = [(EDMessageQueryHelper *)self scheduler];
    [v22 performBlock:v15];
  }
  _Block_object_dispose(&v42, 8);
}

uint64_t __124__EDMessageQueryHelper__performBlockAfterGenerationCheck_generation_keyPaths_removedMessages_changedMessages_addedMessages___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __124__EDMessageQueryHelper__performBlockAfterGenerationCheck_generation_keyPaths_removedMessages_changedMessages_addedMessages___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performBlockAfterGenerationCheck:*(void *)(a1 + 80) generation:*(void *)(a1 + 40) keyPaths:*(void *)(a1 + 48) removedMessages:*(void *)(a1 + 56) changedMessages:*(void *)(a1 + 64) addedMessages:*(void *)(a1 + 72)];
}

- (id)_persistedMessagesFromSendersWithAddresses:(id)a3
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EDMessageQueryHelper *)self query];
  uint64_t v6 = [v5 predicate];
  id v7 = [MEMORY[0x1E4F60390] predicateForMessagesWithSenders:v4];
  id v8 = objc_alloc(MEMORY[0x1E4F28BA0]);
  v19[0] = v6;
  v19[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v10 = (void *)[v8 initWithType:1 subpredicates:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v12 = [v5 targetClass];
  uint64_t v13 = [v5 queryOptions];
  __int16 v14 = [v5 targetClassOptions];
  id v15 = (void *)[v11 initWithTargetClass:v12 predicate:v10 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:0 queryOptions:v13 targetClassOptions:v14 label:0];

  id v16 = [(EDMessageQueryHelper *)self messagePersistence];
  id v17 = [v16 persistedMessagesMatchingQuery:v15 limit:0];

  return v17;
}

- (void)_calculateAndReportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 changeBlock:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v51 = a4;
  uint64_t v47 = v8;
  id v48 = a5;
  uint64_t v53 = self;
  id v9 = [(EDMessageQueryHelper *)self queryEvaluator];
  uint64_t v10 = [v9 transformMessages:v8];

  __int16 v50 = (void *)v10;
  id v11 = [(EDMessageQueryHelper *)self queryEvaluator];
  id v94 = 0;
  __int16 v58 = [v11 filterMessages:v10 unmatchedMessages:&v94];
  id v49 = v94;

  uint64_t v12 = [MEMORY[0x1E4F29060] currentThread];
  __int16 v52 = [v12 threadDictionary];

  uint64_t v13 = [v52 objectForKeyedSubscript:v51];
  objc_msgSend(v52, "setObject:forKeyedSubscript:", 0, v51, v13);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v91 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        id v19 = [v18 objectID];
        [v59 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v96 count:16];
    }
    while (v15);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke;
  aBlock[3] = &unk_1E6C035E8;
  id v46 = v59;
  id v89 = v46;
  __int16 v56 = (void (**)(void *, uint64_t, void, uint64_t))_Block_copy(aBlock);
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__23;
  v86 = __Block_byref_object_dispose__23;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__23;
  v80 = __Block_byref_object_dispose__23;
  id v81 = 0;
  if ([v14 count] || objc_msgSend(v58, "count"))
  {
    uint64_t v55 = objc_opt_new();
    __int16 v54 = [(EDMessageQueryHelper *)self ignoreMessagesPredicate];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v73 = 0u;
    long long v72 = 0u;
    id obj = v50;
    id v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v95 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v73 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v72 + 1) + 8 * j);
          int v26 = [v14 containsObject:v25];
          int v27 = [v58 containsObject:v25];
          char v28 = v27;
          if (v26)
          {
            uint64_t v29 = v83[5];
            if (!v29)
            {
              id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v31 = (void *)v83[5];
              v83[5] = (uint64_t)v30;

              id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v33 = (void *)v77[5];
              v77[5] = (uint64_t)v32;

              uint64_t v29 = v83[5];
            }
            v56[2](v56, v29, v77[5], v25);
            if ((v28 & 1) == 0) {
              [v55 addObject:v25];
            }
          }
          else if (v27)
          {
            if ([v54 evaluateWithObject:v25])
            {
              id v34 = v21;
              if (!v21) {
                id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              }
              uint64_t v21 = v34;
              [v34 addObject:v25];
            }
            else
            {
              id v35 = v20;
              if (!v20) {
                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              id v20 = v35;
              [v35 addObject:v25];
            }
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v95 count:16];
      }
      while (v22);
    }
  }
  else
  {
    id v20 = 0;
    uint64_t v55 = 0;
    uint64_t v21 = 0;
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_73;
  v60[3] = &unk_1E6C03638;
  id v36 = v14;
  id v61 = v36;
  id v37 = v58;
  id v62 = v37;
  id v38 = v55;
  id v63 = v38;
  uint64_t v64 = v53;
  id v39 = v20;
  id v65 = v39;
  v70 = &v82;
  v71 = &v76;
  id v40 = v56;
  id v68 = v40;
  id v41 = v21;
  id v66 = v41;
  id v42 = v49;
  id v67 = v42;
  id v43 = v48;
  id v69 = v43;
  uint64_t v44 = _Block_copy(v60);
  if ([v39 count] && -[EDMessageQueryHelper addMessagesSynchronously](v53, "addMessagesSynchronously"))
  {
    uint64_t v45 = [(EDMessageQueryHelper *)v53 scheduler];
    [v45 performSyncBlock:v44];
  }
  else
  {
    uint64_t v45 = [(EDMessageQueryHelper *)v53 scheduler];
    [v45 performBlock:v44];
  }

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [a2 addObject:v8];
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v8 objectID];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    [v7 addObject:v11];
  }
  else
  {
    uint64_t v12 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(v8, "ef_publicDescription");
      __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_cold_1(v13, v14, v12);
    }
  }
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_73(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 56) + 32);
      os_unfair_lock_lock(v2);
      [*(id *)(*(void *)(a1 + 56) + 16) unionSet:*(void *)(a1 + 48)];
      os_unfair_lock_unlock(v2);
    }
    if ([*(id *)(a1 + 64) count])
    {
      os_signpost_id_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + 56) + 32);
      os_unfair_lock_lock(v3);
      id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_2;
      v26[3] = &unk_1E6C03610;
      char v5 = *(void **)(a1 + 64);
      v26[4] = *(void *)(a1 + 56);
      long long v29 = *(_OWORD *)(a1 + 104);
      id v28 = *(id *)(a1 + 88);
      id v6 = v4;
      id v27 = v6;
      [v5 enumerateObjectsUsingBlock:v26];
      [*(id *)(a1 + 64) removeObjectsAtIndexes:v6];

      os_unfair_lock_unlock(v3);
    }
    if ([*(id *)(a1 + 72) count])
    {
      id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 56) + 36);
      os_unfair_lock_lock(v7);
      [*(id *)(*(void *)(a1 + 56) + 24) unionSet:*(void *)(a1 + 72)];
LABEL_9:
      os_unfair_lock_unlock(v7);
    }
  }
  else if ([*(id *)(a1 + 80) count])
  {
    id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 56) + 32);
    os_unfair_lock_lock(v7);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = *(id *)(a1 + 80);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*(void *)(a1 + 56) + 16) containsObject:*(void *)(*((void *)&v22 + 1) + 8 * i)])
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v16 = *(void *)(*(void *)(a1 + 104) + 8);
              id v17 = *(void **)(v16 + 40);
              *(void *)(v16 + 40) = v15;

              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v19 = *(void *)(*(void *)(a1 + 112) + 8);
              id v20 = *(void **)(v19 + 40);
              *(void *)(v19 + 40) = v18;
            }
            (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v12);
    }

    goto LABEL_9;
  }
  id v8 = [*(id *)(a1 + 56) query];
  BOOL v9 = ([v8 queryOptions] & 0x20) == 0;

  if (!v9)
  {
    uint64_t v10 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", v21, 2u);
    }
    goto LABEL_17;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count]) {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  if ([*(id *)(a1 + 64) count])
  {
    uint64_t v10 = [*(id *)(a1 + 56) delegate];
    [v10 queryHelper:*(void *)(a1 + 56) didAddMessages:*(void *)(a1 + 64)];
LABEL_17:
  }
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "containsObject:"))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v11];
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (void)remoteSearchDidFinish
{
  os_signpost_id_t v3 = [(EDMessageQueryHelper *)self scheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EDMessageQueryHelper_remoteSearchDidFinish__block_invoke;
  v4[3] = &unk_1E6BFF2F0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __45__EDMessageQueryHelper_remoteSearchDidFinish__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 queryHelperDidFinishRemoteSearch:*(void *)(a1 + 32)];
}

- (void)remoteSearchDidFindMessages:(id)a3
{
}

- (void)controller:(id)a3 messageTimerFired:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(EDMessageQueryHelper *)self updateDisplayDate])
  {
    uint64_t v6 = [(EDMessageQueryHelper *)self queryEvaluator];
    v13[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v8 = [v6 transformAndFilterMessages:v7];
    uint64_t v9 = [v8 firstObject];

    if (v9)
    {
      uint64_t v10 = [(EDMessageQueryHelper *)self messagePersistence];
      id v12 = v5;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      [v10 updateBeforeDisplayForPersistedMessages:v11];
    }
  }
}

- (id)_transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4 removeIgnoredMessages:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(EDMessageQueryHelper *)self queryEvaluator];
  uint64_t v10 = [v9 transformMessages:v8 includeDeleted:v6];
  id v25 = 0;
  id v11 = [v9 filterMessages:v10 unmatchedMessages:&v25];
  id v12 = v25;
  if ([v12 count])
  {
    uint64_t v13 = +[EDMessageQueryHelper log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      id v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v8;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v12;
      _os_log_debug_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEBUG, "%p: messages %@, unmatched %@", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_noLongerMatchingMessagesLock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke;
    v24[3] = &unk_1E6BFF8B8;
    v24[4] = self;
    id v14 = objc_msgSend(v12, "ef_filter:", v24);
    os_unfair_lock_unlock(&self->_noLongerMatchingMessagesLock);
    if ([v14 count])
    {
      v26[0] = v11;
      v26[1] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      uint64_t v16 = objc_msgSend(v15, "ef_flatten");

      id v11 = (void *)v16;
    }
  }
  if (v5)
  {
    os_unfair_lock_lock(&self->_ignoredMessagesLock);
    if ([(NSMutableSet *)self->_ignoredMessages count])
    {
      uint64_t v17 = [v11 count];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke_2;
      v23[3] = &unk_1E6BFF8B8;
      v23[4] = self;
      id v18 = objc_msgSend(v11, "ef_filter:", v23);

      uint64_t v19 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v18 count];
        *(_DWORD *)buf = 134218496;
        id v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = v17;
        __int16 v31 = 2048;
        uint64_t v32 = v20;
        _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "%p: Filtered ignored messages - before=%lu, after=%lu", buf, 0x20u);
      }

      id v11 = v18;
    }
    else
    {
      uint64_t v21 = +[EDMessageQueryHelper log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v28 = self;
        _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_INFO, "%p: No messages to ignore", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock(&self->_ignoredMessagesLock);
  }

  return v11;
}

uint64_t __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) containsObject:a2];
}

uint64_t __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) containsObject:a2] ^ 1;
}

- (EMQuery)query
{
  return self->_query;
}

- (int64_t)initialBatchSize
{
  return self->_initialBatchSize;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (EDMessageQueryHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDMessageQueryHelperDelegate *)WeakRetained;
}

- (EDMessageQueryEvaluator)queryEvaluator
{
  return self->_queryEvaluator;
}

- (BOOL)shouldReconcileJournal
{
  return self->_shouldReconcileJournal;
}

- (BOOL)keepMessagesInListOnBucketChange
{
  return self->_keepMessagesInListOnBucketChange;
}

- (NSPredicate)ignoreMessagesPredicate
{
  return self->_ignoreMessagesPredicate;
}

- (BOOL)addMessagesSynchronously
{
  return self->_addMessagesSynchronously;
}

- (EFPromise)initialResultsPromise
{
  return self->_initialResultsPromise;
}

- (NSString)pendingFlagChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)pendingConversationIDChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)pendingReadLaterDateChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)pendingDisplayDateChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)pendingCategorizationChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)pendingAuthenticationChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_pendingAuthenticationChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingCategorizationChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingDisplayDateChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingReadLaterDateChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingConversationIDChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingFlagChangesKey, 0);
  objc_storeStrong((id *)&self->_initialResultsPromise, 0);
  objc_storeStrong((id *)&self->_ignoreMessagesPredicate, 0);
  objc_storeStrong((id *)&self->_queryEvaluator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_ignoredMessages, 0);

  objc_storeStrong((id *)&self->_noLongerMatchingMessages, 0);
}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(uint8_t *)buf generationWindow:(os_log_t)log .cold.1(uint64_t a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "%p: Did delete all messages in %u mailbox(es). Requesting restart.", buf, 0x12u);
}

void __81__EDMessageQueryHelper_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "%p: persistenceDidUpdateBusinessIDForMessages %@", (uint8_t *)&v4, 0x16u);
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to find previous message: %{public}@", buf, 0xCu);
}

@end