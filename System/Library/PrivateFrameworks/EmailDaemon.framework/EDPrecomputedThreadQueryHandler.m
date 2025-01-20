@interface EDPrecomputedThreadQueryHandler
+ (OS_os_log)log;
- (BOOL)_isAddingOrDeletingObjectID:(id)a3;
- (BOOL)start;
- (BOOL)updateDisplayDate;
- (EDPrecomputedThreadQueryHandler)initWithQuery:(id)a3 threadScope:(id)a4 messagePersistence:(id)a5 threadPersistence:(id)a6 hookRegistry:(id)a7 remindMeNotificationController:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11;
- (EDThreadPersistence)threadPersistence;
- (EDUpdateThrottler)updateThrottler;
- (EFCancelable)updateOldestThreadsCancelationToken;
- (EFCancelationToken)cancelationToken;
- (EFScheduler)backgroundWorkScheduler;
- (EFScheduler)changeScheduler;
- (EMCollectionItemIDStateCapturer)stateCapturer;
- (EMMailboxScope)mailboxScope;
- (EMThreadReloadSummaryHelper)reloadSummaryHelper;
- (EMThreadScope)threadScope;
- (NSMutableArray)pendingPositionChanges;
- (NSMutableDictionary)oldestThreadObjectIDsByMailbox;
- (NSMutableDictionary)pendingChanges;
- (NSMutableDictionary)reportedJournaledObjectIDs;
- (NSMutableSet)unreportedJournaledObjectIDs;
- (id)_extaInfoPrecachedThreadsForInitialObjectIDs:(id)a3;
- (id)_messageForPersistedMessage:(id)a3;
- (id)itemIDsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (id)messageListItemForObjectID:(id)a3 error:(id *)a4;
- (void)_addChangeToPendingChanges:(id)a3 forThreadObjectID:(id)a4;
- (void)_flushUpdatesWithReason:(id)a3;
- (void)_getInitialResults;
- (void)_oldestThreadsNeedUpdate;
- (void)_onScheduler:(id)a3 performCancelableBlock:(id)a4;
- (void)_persistenceIsAddingThreadWithObjectID:(id)a3;
- (void)_persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4;
- (void)_updateDisplayDateForMessagesIfNeeded;
- (void)cancel;
- (void)controller:(id)a3 messageTimerFired:(id)a4;
- (void)persistenceDidChangeBusinessIDForMessages:(id)a3 fromBusinessID:(int64_t)a4;
- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidFinishThreadUpdates;
- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsAddingThreadWithObjectID:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5;
- (void)persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsDeletingThreadWithObjectID:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsMarkingThreadAsJournaledWithObjectID:(id)a3 generationWindow:(id)a4;
- (void)persistenceIsReconcilingJournaledThreadsWithObjectIDs:(id)a3 generationWindow:(id)a4;
- (void)setCancelationToken:(id)a3;
- (void)setOldestThreadObjectIDsByMailbox:(id)a3;
- (void)setPendingChanges:(id)a3;
- (void)setPendingPositionChanges:(id)a3;
- (void)setReportedJournaledObjectIDs:(id)a3;
- (void)setUnreportedJournaledObjectIDs:(id)a3;
- (void)setUpdateOldestThreadsCancelationToken:(id)a3;
- (void)test_tearDown;
@end

@implementation EDPrecomputedThreadQueryHandler

id __80__EDPrecomputedThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    id obj = 0;
    v7 = [v8 messageListItemForObjectID:v3 error:&obj];
    objc_storeStrong(v5, obj);
  }

  return v7;
}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
  v8 = [(EDMessageRepositoryQueryHandler *)self query];
  v9 = [v7 threadForObjectID:v6 originatingQuery:v8 error:a4];

  return v9;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDPrecomputedThreadQueryHandler)initWithQuery:(id)a3 threadScope:(id)a4 messagePersistence:(id)a5 threadPersistence:(id)a6 hookRegistry:(id)a7 remindMeNotificationController:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11
{
  id v17 = a3;
  id v57 = a4;
  id v18 = a5;
  id v56 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v58 = a11;
  v59.receiver = self;
  v59.super_class = (Class)EDPrecomputedThreadQueryHandler;
  v55 = v19;
  v23 = [(EDMessageRepositoryQueryHandler *)&v59 initWithQuery:v17 messagePersistence:v18 hookRegistry:v19 remindMeNotificationController:v20 observer:v21 observationIdentifier:v22];
  if (v23)
  {
    uint64_t v24 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDPrecomputedThreadQueryHandler.changeScheduler" qualityOfService:25];
    changeScheduler = v23->_changeScheduler;
    v23->_changeScheduler = (EFScheduler *)v24;

    uint64_t v26 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDPrecomputedThreadQueryHandler.backgroundWorkScheduler" qualityOfService:9];
    backgroundWorkScheduler = v23->_backgroundWorkScheduler;
    v23->_backgroundWorkScheduler = (EFScheduler *)v26;

    v28 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelationToken = v23->_cancelationToken;
    v23->_cancelationToken = v28;

    objc_storeStrong((id *)&v23->_threadScope, a4);
    objc_storeStrong((id *)&v23->_threadPersistence, a6);
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingChanges = v23->_pendingChanges;
    v23->_pendingChanges = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingPositionChanges = v23->_pendingPositionChanges;
    v23->_pendingPositionChanges = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unreportedJournaledObjectIDs = v23->_unreportedJournaledObjectIDs;
    v23->_unreportedJournaledObjectIDs = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reportedJournaledObjectIDs = v23->_reportedJournaledObjectIDs;
    v23->_reportedJournaledObjectIDs = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oldestThreadObjectIDsByMailbox = v23->_oldestThreadObjectIDsByMailbox;
    v23->_oldestThreadObjectIDsByMailbox = v38;

    v40 = [[EDUpdateThrottler alloc] initWithName:@"Precomputed Threads" delayInterval:v58 resumable:1.0];
    updateThrottler = v23->_updateThrottler;
    v23->_updateThrottler = v40;

    v42 = (EMThreadReloadSummaryHelper *)objc_alloc_init(MEMORY[0x1E4F604E8]);
    reloadSummaryHelper = v23->_reloadSummaryHelper;
    v23->_reloadSummaryHelper = v42;

    v44 = (void *)MEMORY[0x1E4F60390];
    v45 = [v17 predicate];
    v46 = [v18 mailboxPersistence];
    uint64_t v47 = [v44 mailboxScopeForPredicate:v45 withMailboxTypeResolver:v46];
    mailboxScope = v23->_mailboxScope;
    v23->_mailboxScope = (EMMailboxScope *)v47;

    id v49 = objc_alloc(MEMORY[0x1E4F60240]);
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    uint64_t v52 = [v49 initWithTitle:v51 delegate:v23];
    stateCapturer = v23->_stateCapturer;
    v23->_stateCapturer = (EMCollectionItemIDStateCapturer *)v52;
  }
  return v23;
}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) messagePersistence];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_2;
  v4[3] = &unk_1E6BFFAF0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performDatabaseWorkInBlockWithHighPriority:v4];
}

- (void)_getInitialResults
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v17 = [(EDMessageRepositoryQueryHandler *)self resultsObserver];
  id v3 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 100;
  uint64_t v4 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
  id v5 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  id v6 = [(EDMessageRepositoryQueryHandler *)self query];
  v7 = [v6 sortDescriptors];
  uint64_t v8 = v23[3];
  v9 = [(EDPrecomputedThreadQueryHandler *)self unreportedJournaledObjectIDs];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__EDPrecomputedThreadQueryHandler__getInitialResults__block_invoke;
  v18[3] = &unk_1E6C04910;
  v18[4] = self;
  id v21 = &v22;
  id v10 = v17;
  id v19 = v10;
  id v11 = v3;
  id v20 = v11;
  [v4 threadObjectIDsForThreadScope:v5 sortDescriptors:v7 initialBatchSize:v8 journaledObjectIDs:v9 batchBlock:v18];

  v12 = [(EDPrecomputedThreadQueryHandler *)self cancelationToken];
  LODWORD(v4) = [v12 isCanceled];

  if (v4)
  {
    v13 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      *(_DWORD *)buf = 134218242;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Canceled initial results\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v15 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      *(_DWORD *)buf = 134218242;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "%p: Returning initial load did finish\n%{public}@", buf, 0x16u);
    }
    [v10 observerDidFinishInitialLoad:v11];
  }
  [(EDPrecomputedThreadQueryHandler *)self _oldestThreadsNeedUpdate];

  _Block_object_dispose(&v22, 8);
}

void __53__EDPrecomputedThreadQueryHandler__getInitialResults__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = (void *)MEMORY[0x1E0190280]();
  v9 = +[EDPrecomputedThreadQueryHandler log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v7 count];
    v12 = [*(id *)(a1 + 32) threadScope];
    int v18 = 134218498;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Returning batch of %lu results\n%{public}@", (uint8_t *)&v18, 0x20u);
  }
  v13 = *(void **)(a1 + 32);
  v14 = +[EDPrecomputedThreadQueryHandler log];
  v15 = [v13 _distinctObjectIDs:v7 queryHandlerLog:v14];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 100)
  {
    v16 = [*(id *)(a1 + 32) _extaInfoPrecachedThreadsForInitialObjectIDs:v15];
  }
  else
  {
    v16 = 0;
  }
  [*(id *)(a1 + 40) observer:*(void *)(a1 + 48) matchedAddedObjectIDs:v15 before:0 extraInfo:v16];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 15000;
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v17 = [*(id *)(a1 + 32) cancelationToken];
  *a4 = [v17 isCanceled];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDPrecomputedThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_73 != -1) {
    dispatch_once(&log_onceToken_73, block);
  }
  v2 = (void *)log_log_73;

  return (OS_os_log *)v2;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (void)_onScheduler:(id)a3 performCancelableBlock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(EDPrecomputedThreadQueryHandler *)self cancelationToken];
  char v8 = [v7 isCanceled];

  if ((v8 & 1) == 0)
  {
    v9 = [(EDPrecomputedThreadQueryHandler *)self cancelationToken];
    uint64_t v10 = [v11 performCancelableBlock:v6];
    [v9 addCancelable:v10];
  }
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (NSMutableSet)unreportedJournaledObjectIDs
{
  return self->_unreportedJournaledObjectIDs;
}

- (void)_oldestThreadsNeedUpdate
{
  id v3 = [(EDMessageRepositoryQueryHandler *)self query];
  char v4 = [v3 queryOptions];

  if (v4)
  {
    id v5 = [(EDPrecomputedThreadQueryHandler *)self updateOldestThreadsCancelationToken];

    if (v5)
    {
      id v6 = [(EDPrecomputedThreadQueryHandler *)self updateOldestThreadsCancelationToken];
      [v6 cancel];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v7 = [(EDPrecomputedThreadQueryHandler *)self backgroundWorkScheduler];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke;
    v14 = &unk_1E6C00E78;
    objc_copyWeak(&v15, &location);
    char v8 = [v7 afterDelay:&v11 performBlock:2.0];
    -[EDPrecomputedThreadQueryHandler setUpdateOldestThreadsCancelationToken:](self, "setUpdateOldestThreadsCancelationToken:", v8, v11, v12, v13, v14);

    v9 = [(EDPrecomputedThreadQueryHandler *)self cancelationToken];
    uint64_t v10 = [(EDPrecomputedThreadQueryHandler *)self updateOldestThreadsCancelationToken];
    [v9 addCancelable:v10];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (EFCancelable)updateOldestThreadsCancelationToken
{
  return self->_updateOldestThreadsCancelationToken;
}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDisplayDateForMessagesIfNeeded];
  [*(id *)(a1 + 40) registerThreadChangeHookResponder:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) registerMessageChangeHookResponder:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) registerBusinessChangeHookResponder:*(void *)(a1 + 32)];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) cancelationToken];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_3;
  v6[3] = &unk_1E6BFF198;
  objc_copyWeak(&v8, &location);
  id v7 = *(id *)(a1 + 40);
  [v2 addCancelationBlock:v6];

  [*(id *)(a1 + 32) _getInitialResults];
  id v3 = *(void **)(a1 + 32);
  char v4 = [v3 backgroundWorkScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_4;
  v5[3] = &unk_1E6C048C0;
  v5[4] = *(void *)(a1 + 32);
  [v3 _onScheduler:v4 performCancelableBlock:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (BOOL)start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)EDPrecomputedThreadQueryHandler;
  BOOL v3 = [(EDMessageRepositoryQueryHandler *)&v15 start];
  char v4 = +[EDPrecomputedThreadQueryHandler log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218242;
      id v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Starting with query '%@'", buf, 0x16u);
    }
    id v7 = [(EDMessageRepositoryQueryHandler *)self remindMeNotificationController];
    char v4 = [v7 addRemindMeObserver:self];

    id v8 = [(EDPrecomputedThreadQueryHandler *)self cancelationToken];
    [v8 addCancelable:v4];

    v9 = [(EDMessageRepositoryQueryHandler *)self hookRegistry];
    uint64_t v10 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke;
    v13[3] = &unk_1E6C048E8;
    v13[4] = self;
    id v11 = v9;
    id v14 = v11;
    [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v10 performCancelableBlock:v13];
  }
  else if (v5)
  {
    *(_DWORD *)buf = 134217984;
    id v17 = self;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
  }

  return v3;
}

- (void)setUpdateOldestThreadsCancelationToken:(id)a3
{
}

- (EFScheduler)changeScheduler
{
  return self->_changeScheduler;
}

- (void)_updateDisplayDateForMessagesIfNeeded
{
  if ([(EDPrecomputedThreadQueryHandler *)self updateDisplayDate])
  {
    id v9 = [(EDMessageRepositoryQueryHandler *)self query];
    id v3 = objc_alloc(MEMORY[0x1E4F60418]);
    uint64_t v4 = objc_opt_class();
    BOOL v5 = [v9 predicate];
    id v6 = [v9 sortDescriptors];
    id v7 = objc_msgSend(v3, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v4, v5, v6, objc_msgSend(v9, "queryOptions"), 0);

    id v8 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
    [v8 updateBeforeDisplayForMessagesMatchingQuery:v7];
  }
}

- (BOOL)updateDisplayDate
{
  v2 = [(EDMessageRepositoryQueryHandler *)self query];
  id v3 = [v2 targetClassOptions];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FF78]];
  char v5 = [v4 BOOLValue];

  return v5;
}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) threadPersistence];
  v2 = [*(id *)(a1 + 32) threadScope];
  [v3 updateLastViewedDateForThreadScope:v2];
}

- (id)_extaInfoPrecachedThreadsForInitialObjectIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EDMessageRepositoryQueryHandler *)self query];
  id v6 = [v5 targetClassOptions];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F5FF88]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = objc_msgSend(v4, "ef_prefix:", v8);

  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__29;
  uint64_t v21 = __Block_byref_object_dispose__29;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__EDPrecomputedThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke;
  v16[3] = &unk_1E6C01528;
  v16[4] = self;
  v16[5] = &v17;
  uint64_t v10 = objc_msgSend(v9, "ef_compactMap:", v16);
  uint64_t v11 = [v10 count];
  if (v11 == [v9 count] && !v18[5])
  {
    uint64_t v23 = *MEMORY[0x1E4F5FDA8];
    uint64_t v24 = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    uint64_t v12 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend((id)v18[5], "ef_publicDescription");
      -[EDInMemoryThreadQueryHandler _extaInfoPrecachedThreadsForInitialObjectIDs:]((uint64_t)self, v13, buf, v12);
    }

    id v14 = 0;
  }

  _Block_object_dispose(&v17, 8);

  return v14;
}

void __38__EDPrecomputedThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_73;
  log_log_73 = (uint64_t)v1;
}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v5 = WeakRetained;
    [*(id *)(a1 + 32) unregisterHookResponder:WeakRetained];
    id v3 = [v5 threadPersistence];
    id v4 = [v5 threadScope];
    [v3 verifyConsistencyOfThreadScope:v4];

    id WeakRetained = v5;
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)EDPrecomputedThreadQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v3 cancel];
  [(EFCancelationToken *)self->_cancelationToken cancel];
  [(EFCancelable *)self->_updateOldestThreadsCancelationToken cancel];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPrecomputedThreadQueryHandler.m", 149, @"%s can only be called from unit tests", "-[EDPrecomputedThreadQueryHandler test_tearDown]");
  }
  v7.receiver = self;
  v7.super_class = (Class)EDPrecomputedThreadQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v7 test_tearDown];
  id v4 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
  [v4 performSyncBlock:&__block_literal_global_58];

  char v5 = [(EDPrecomputedThreadQueryHandler *)self backgroundWorkScheduler];
  [v5 performSyncBlock:&__block_literal_global_33];
}

- (void)_addChangeToPendingChanges:(id)a3 forThreadObjectID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDPrecomputedThreadQueryHandler *)self pendingChanges];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    uint64_t v10 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      int v15 = 134218754;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Adding change to existing change for objectID: %{public}@\n%{public}@\n%{public}@", (uint8_t *)&v15, 0x2Au);
    }
    [v9 addChange:v6];
  }
  else
  {
    uint64_t v12 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      int v15 = 134218754;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Adding change for objectID: %{public}@\n%{public}@\n%{public}@", (uint8_t *)&v15, 0x2Au);
    }
    id v14 = [(EDPrecomputedThreadQueryHandler *)self pendingChanges];
    [v14 setObject:v6 forKeyedSubscript:v7];
  }
}

- (BOOL)_isAddingOrDeletingObjectID:(id)a3
{
  id v4 = a3;
  char v5 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__EDPrecomputedThreadQueryHandler__isAddingOrDeletingObjectID___block_invoke;
  v9[3] = &unk_1E6C04938;
  id v6 = v4;
  id v10 = v6;
  char v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

uint64_t __63__EDPrecomputedThreadQueryHandler__isAddingOrDeletingObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAddingObjectID:*(void *)(a1 + 32)]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isDeletingObjectID:*(void *)(a1 + 32)];
  }

  return v4;
}

- (void)_flushUpdatesWithReason:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v49 = [(EDPrecomputedThreadQueryHandler *)self pendingChanges];
  v48 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
  if ([v49 count] || objc_msgSend(v48, "count"))
  {
    val = self;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__29;
    v87[4] = __Block_byref_object_dispose__29;
    id v88 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke;
    aBlock[3] = &unk_1E6C04960;
    v86 = v87;
    id v85 = v47;
    v51 = (void (**)(void))_Block_copy(aBlock);
    v83 = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v4 = [(EDPrecomputedThreadQueryHandler *)self updateThrottler];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2;
    v80[3] = &unk_1E6C01468;
    objc_copyWeak(&v81, &location);
    v50 = [v4 updateWithBlock:v80 unacknowledgedUpdatesCount:&v83];

    if (v50)
    {
      id v56 = [(EDMessageRepositoryQueryHandler *)val resultsObserver];
      v55 = [(EDMessageRepositoryQueryHandler *)val observationIdentifier];
      if ([v49 count])
      {
        char v5 = [(EDPrecomputedThreadQueryHandler *)val reloadSummaryHelper];
        id v6 = [(EDPrecomputedThreadQueryHandler *)val mailboxScope];
        char v7 = [v5 summariesToReloadForChanges:v49 mailboxScope:v6];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v76 objects:v98 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v77 != v10) {
                objc_enumerationMutation(v8);
              }
              [(EDMessageRepositoryQueryHandler *)val requestSummaryForMessageObjectID:*(void *)(*((void *)&v76 + 1) + 8 * i)];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v76 objects:v98 count:16];
          }
          while (v9);
        }

        uint64_t v12 = +[EDPrecomputedThreadQueryHandler log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v51[2]();
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          id v14 = [(EDPrecomputedThreadQueryHandler *)val pendingChanges];
          int v15 = [(EDPrecomputedThreadQueryHandler *)val threadScope];
          *(_DWORD *)buf = 134218754;
          v91 = val;
          __int16 v92 = 2114;
          id v93 = v13;
          __int16 v94 = 2114;
          id v95 = v14;
          __int16 v96 = 2114;
          v97 = v15;
          _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Flushing changes%{public}@: %{public}@\n%{public}@", buf, 0x2Au);
        }
        [v56 observer:v55 matchedChangesForObjectIDs:v49];
        v16 = [(EDPrecomputedThreadQueryHandler *)val pendingChanges];
        [v16 removeAllObjects];
      }
      if ([v48 count])
      {
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id obj = v48;
        uint64_t v17 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
        if (v17)
        {
          uint64_t v54 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v73 != v54) {
                objc_enumerationMutation(obj);
              }
              __int16 v19 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              id v20 = +[EDPrecomputedThreadQueryHandler log];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v51[2]();
                id v21 = (id)objc_claimAutoreleasedReturnValue();
                id v22 = [(EDPrecomputedThreadQueryHandler *)val threadScope];
                *(_DWORD *)buf = 134218754;
                v91 = val;
                __int16 v92 = 2114;
                id v93 = v21;
                __int16 v94 = 2114;
                id v95 = v19;
                __int16 v96 = 2114;
                v97 = v22;
                _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "%p: Flushing position changes%{public}@: %{public}@\n%{public}@", buf, 0x2Au);
              }
              uint64_t v23 = [v19 objectIDsToAddByBeforeObjectID];
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_52;
              v69[3] = &unk_1E6C04988;
              uint64_t v24 = v56;
              v70 = v24;
              id v25 = v55;
              id v71 = v25;
              [v23 enumerateKeysAndObjectsUsingBlock:v69];

              uint64_t v26 = [v19 objectIDsToMoveByBeforeObjectID];
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2_55;
              v66[3] = &unk_1E6C04988;
              v27 = v24;
              v67 = v27;
              id v28 = v25;
              id v68 = v28;
              [v26 enumerateKeysAndObjectsUsingBlock:v66];

              v29 = [v19 objectIDsToDelete];
              uint64_t v30 = [v29 allObjects];

              if ([v30 count])
              {
                v31 = [v19 objectIDsToDelete];
                v32 = [v31 allObjects];
                [v27 observer:v28 matchedDeletedObjectIDs:v32];
              }
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
          }
          while (v17);
        }

        v33 = [(EDPrecomputedThreadQueryHandler *)val pendingPositionChanges];
        [v33 removeAllObjects];

        [(EDPrecomputedThreadQueryHandler *)val _oldestThreadsNeedUpdate];
      }
      v34 = [v50 label];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_56;
      block[3] = &unk_1E6C03548;
      objc_copyWeak(&v65, &location);
      id v35 = v55;
      id v63 = v35;
      id v36 = v34;
      id v64 = v36;
      dispatch_block_t v37 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_time_t v38 = dispatch_time(0, 5000000000);
      v39 = dispatch_get_global_queue(21, 0);
      dispatch_after(v38, v39, v37);

      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_61;
      v57[3] = &unk_1E6C049B0;
      objc_copyWeak(&v61, &location);
      id v40 = v37;
      id v60 = v40;
      id v41 = v35;
      id v58 = v41;
      id v42 = v36;
      id v59 = v42;
      [v50 addInvocationBlock:v57];
      v43 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v51[2]();
        *(_DWORD *)buf = 134218754;
        v91 = val;
        __int16 v92 = 2114;
        id v93 = v44;
        __int16 v94 = 2114;
        id v95 = v41;
        __int16 v96 = 2114;
        v97 = v50;
        _os_log_impl(&dword_1DB39C000, v43, OS_LOG_TYPE_DEFAULT, "%p: Sending update%{public}@ for %{public}@: %{public}@", buf, 0x2Au);
      }
      [v56 observer:v41 wasUpdated:v50];

      objc_destroyWeak(&v61);
      objc_destroyWeak(&v65);

      v45 = v56;
    }
    else
    {
      v45 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v51[2]();
        *(_DWORD *)buf = 134218498;
        v91 = val;
        __int16 v92 = 2114;
        id v93 = v46;
        __int16 v94 = 2048;
        id v95 = v83;
        _os_log_impl(&dword_1DB39C000, v45, OS_LOG_TYPE_DEFAULT, "%p: Skipping flushing of changes%{public}@ due to %llu unacknowledged updates", buf, 0x20u);
      }
    }

    objc_destroyWeak(&v81);
    objc_destroyWeak(&location);

    _Block_object_dispose(v87, 8);
  }
}

id __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = [[NSString alloc] initWithFormat:@" after %@", *(void *)(a1 + 32)];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v3 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    else
    {
      *(void *)(v2 + 40) = &stru_1F3583658;
    }
  }
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v6;
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && a2)
  {
    uint64_t v5 = [WeakRetained changeScheduler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3;
    v6[3] = &unk_1E6C048C0;
    void v6[4] = v4;
    [v4 _onScheduler:v5 performCancelableBlock:v6];
  }
}

uint64_t __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushUpdatesWithReason:@"all updates were acknowledged"];
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v10)
  {

    id v10 = 0;
  }
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v5 array];
  [v7 observer:v8 matchedAddedObjectIDs:v9 before:v10 extraInfo:0];
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2_55(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v10)
  {

    id v10 = 0;
  }
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v5 array];
  [v7 observer:v8 matchedMovedObjectIDs:v9 before:v10 extraInfo:0];
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_56_cold_1((uint64_t)WeakRetained, a1, v3);
    }

    uint64_t v4 = [MEMORY[0x1E4F60D20] sharedReporter];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    [v4 reportIssueType:v6 description:@"Timedout update"];
  }
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_61(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 48));
    id v3 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218498;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Acknowledged update for %{public}@: %{public}@", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)persistenceIsAddingThreadWithObjectID:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  id v7 = a3;
  __int16 v8 = [v7 threadScope];
  uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  char v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__EDPrecomputedThreadQueryHandler_persistenceIsAddingThreadWithObjectID_journaled_generationWindow___block_invoke;
    v12[3] = &unk_1E6C049D8;
    BOOL v14 = a4;
    v12[4] = self;
    id v13 = v7;
    [v11 performSyncBlock:v12];
  }
}

void __100__EDPrecomputedThreadQueryHandler_persistenceIsAddingThreadWithObjectID_journaled_generationWindow___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v5 = [v3 unreportedJournaledObjectIDs];
    [v5 addObject:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _persistenceIsAddingThreadWithObjectID:v4];
  }
}

- (void)_persistenceIsAddingThreadWithObjectID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EDMessageRepositoryQueryHandler *)self query];
  int v6 = [v5 sortDescriptors];

  id v7 = [(EDPrecomputedThreadQueryHandler *)self reportedJournaledObjectIDs];
  __int16 v8 = [v7 allKeys];

  uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
  char v10 = [v9 nextExistingThreadObjectIDForThreadObjectID:v4 forSortDescriptors:v6 journaledThreadsToCheck:v8 excluding:0];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
  }
  id v13 = v12;

  BOOL v14 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
  int v15 = [v14 lastObject];
  int v16 = [v15 addObjectIDToAdd:v4 before:v13];

  if (v16)
  {
    uint64_t v17 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      int v22 = 134218754;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      id v25 = v4;
      __int16 v26 = 2114;
      v27 = v13;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1DB39C000, &v17->super, OS_LOG_TYPE_DEFAULT, "%p: Adding add for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v22, 0x2Au);
    }
  }
  else
  {
    uint64_t v17 = objc_alloc_init(_EDThreadPositionChangeSet);
    [(_EDThreadPositionChangeSet *)v17 addObjectIDToAdd:v4 before:v13];
    __int16 v19 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
    [v19 addObject:v17];

    id v20 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      int v22 = 134218754;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      id v25 = v4;
      __int16 v26 = 2114;
      v27 = v13;
      __int16 v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "%p: Adding add to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v22, 0x2Au);
    }
  }
}

- (void)persistenceIsMarkingThreadAsJournaledWithObjectID:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  int v6 = [v5 threadScope];
  id v7 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __102__EDPrecomputedThreadQueryHandler_persistenceIsMarkingThreadAsJournaledWithObjectID_generationWindow___block_invoke;
    v10[3] = &unk_1E6C048E8;
    v10[4] = self;
    id v11 = v5;
    [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v9 performCancelableBlock:v10];
  }
}

void __102__EDPrecomputedThreadQueryHandler_persistenceIsMarkingThreadAsJournaledWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) unreportedJournaledObjectIDs];
  char v2 = [v4 containsObject:*(void *)(a1 + 40)];

  if ((v2 & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v3 = [*(id *)(a1 + 32) reportedJournaledObjectIDs];
    [v3 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (void)persistenceIsReconcilingJournaledThreadsWithObjectIDs:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  int v6 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke;
  v14[3] = &unk_1E6C04A00;
  id v7 = v6;
  id v15 = v7;
  char v8 = objc_msgSend(v5, "ef_filter:", v14);

  if ([v8 count])
  {
    uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_2;
    v10[3] = &unk_1E6BFF7A8;
    id v11 = v8;
    id v12 = self;
    id v13 = v7;
    [v9 performSyncBlock:v10];
  }
}

uint64_t __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 threadScope];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_3;
  v31[3] = &unk_1E6C04A00;
  v31[4] = *(void *)(a1 + 40);
  __int16 v24 = objc_msgSend(v2, "ef_partition:", v31);
  id v3 = [*(id *)(a1 + 40) unreportedJournaledObjectIDs];
  uint64_t v4 = [v24 first];
  objc_msgSend(v3, "ef_removeObjectsInArray:", v4);

  id v5 = [*(id *)(a1 + 40) query];
  id v21 = [v5 sortDescriptors];

  int v6 = [*(id *)(a1 + 40) reportedJournaledObjectIDs];
  int v22 = [v6 allKeys];

  id v7 = [*(id *)(a1 + 40) threadPersistence];
  char v8 = [v24 first];
  uint64_t v23 = [v7 threadObjectIDsByNextExistingForThreadObjectIDs:v8 forSortDescriptors:v21 journaledThreadsToCheck:v22];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_4;
  v29[3] = &unk_1E6C04898;
  uint64_t v9 = *(void **)(a1 + 48);
  v29[4] = *(void *)(a1 + 40);
  id v30 = v9;
  [v23 enumerateKeysAndObjectsUsingBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v10 = [v24 second];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        id v15 = objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs", v21);
        int v16 = [v15 objectForKeyedSubscript:v14];

        if (v16)
        {
          uint64_t v17 = [*(id *)(a1 + 40) reportedJournaledObjectIDs];
          [v17 setObject:0 forKeyedSubscript:v14];

          id v18 = [*(id *)(a1 + 40) threadPersistence];
          __int16 v19 = [v16 allObjects];
          id v20 = [v18 changeForThreadWithObjectID:v14 changedKeyPaths:v19];

          [*(id *)(a1 + 40) _addChangeToPendingChanges:v20 forThreadObjectID:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v11);
  }
}

uint64_t __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) unreportedJournaledObjectIDs];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

void __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v7 = 134218754;
    long long v21 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges", v21);
        uint64_t v12 = [v11 lastObject];
        int v13 = [v12 addObjectIDToAdd:v10 before:v5];

        if (v13)
        {
          uint64_t v14 = +[EDPrecomputedThreadQueryHandler log];
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a1 + 32);
            uint64_t v16 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v21;
            uint64_t v28 = v15;
            __int16 v29 = 2114;
            uint64_t v30 = v10;
            __int16 v31 = 2114;
            id v32 = v5;
            __int16 v33 = 2114;
            uint64_t v34 = v16;
            _os_log_impl(&dword_1DB39C000, &v14->super, OS_LOG_TYPE_DEFAULT, "%p: Adding add for objectID: %{public}@ -> %{public}@\n%{public}@", buf, 0x2Au);
          }
        }
        else
        {
          uint64_t v14 = objc_alloc_init(_EDThreadPositionChangeSet);
          [(_EDThreadPositionChangeSet *)v14 addObjectIDToAdd:v10 before:v5];
          uint64_t v17 = [*(id *)(a1 + 32) pendingPositionChanges];
          [v17 addObject:v14];

          id v18 = +[EDPrecomputedThreadQueryHandler log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void *)(a1 + 32);
            uint64_t v20 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v21;
            uint64_t v28 = v19;
            __int16 v29 = 2114;
            uint64_t v30 = v10;
            __int16 v31 = 2114;
            id v32 = v5;
            __int16 v33 = 2114;
            uint64_t v34 = v20;
            _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "%p: Adding add to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", buf, 0x2Au);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v6);
  }
}

- (void)persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4 generationWindow:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 threadScope];
  uint64_t v10 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  char v11 = [v9 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __108__EDPrecomputedThreadQueryHandler_persistenceIsChangingThreadWithObjectID_changedKeyPaths_generationWindow___block_invoke;
    v13[3] = &unk_1E6BFF7A8;
    v13[4] = self;
    id v14 = v7;
    id v15 = v8;
    [v12 performSyncBlock:v13];
  }
}

void __108__EDPrecomputedThreadQueryHandler_persistenceIsChangingThreadWithObjectID_changedKeyPaths_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) unreportedJournaledObjectIDs];
  char v3 = [v2 containsObject:*(void *)(v1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [*(id *)(v1 + 32) reportedJournaledObjectIDs];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(v1 + 40)];

    id v6 = *(id *)(v1 + 48);
    if (v5)
    {
      uint64_t v19 = v6;
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v18 = v1;
      id v7 = *(id *)(v1 + 48);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v24;
        uint64_t v10 = *MEMORY[0x1E4F5FE40];
        uint64_t v11 = *MEMORY[0x1E4F5FF48];
        uint64_t v12 = *MEMORY[0x1E4F5FF40];
        uint64_t v13 = *MEMORY[0x1E4F5FF30];
        uint64_t v22 = *MEMORY[0x1E4F5FF60];
        uint64_t v21 = *MEMORY[0x1E4F5FDF0];
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v7);
            }
            id v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
            if (([v15 isEqualToString:v10] & 1) != 0
              || ([v15 isEqualToString:v11] & 1) != 0
              || ([v15 isEqualToString:v12] & 1) != 0
              || ([v15 isEqualToString:v13] & 1) != 0
              || ([v15 isEqualToString:v22] & 1) != 0
              || [v15 isEqualToString:v21])
            {
              [v5 addObject:v15];
            }
            else
            {
              [v20 addObject:v15];
            }
            ++v14;
          }
          while (v8 != v14);
          uint64_t v16 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
          uint64_t v8 = v16;
        }
        while (v16);
      }

      uint64_t v1 = v18;
      uint64_t v17 = v20;
    }
    else
    {
      uint64_t v17 = v6;
    }
    [*(id *)(v1 + 32) _persistenceIsChangingThreadWithObjectID:*(void *)(v1 + 40) changedKeyPaths:v17];
  }
}

- (void)_persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EDPrecomputedThreadQueryHandler *)self _isAddingOrDeletingObjectID:v6])
  {
    uint64_t v8 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
      int v29 = 134218498;
      uint64_t v30 = self;
      __int16 v31 = 2114;
      id v32 = v6;
      __int16 v33 = 2114;
      uint64_t v34 = v9;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Ignoring change for objectID: %{public}@\n%{public}@", (uint8_t *)&v29, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
    uint64_t v11 = [v10 changeForThreadWithObjectID:v6 changedKeyPaths:v7];

    [(EDPrecomputedThreadQueryHandler *)self _addChangeToPendingChanges:v11 forThreadObjectID:v6];
  }
  if ([(EDMessageRepositoryQueryHandler *)self keyPathsAffectSorting:v7])
  {
    uint64_t v12 = [(EDMessageRepositoryQueryHandler *)self query];
    uint64_t v13 = [v12 sortDescriptors];

    uint64_t v14 = [(EDPrecomputedThreadQueryHandler *)self reportedJournaledObjectIDs];
    id v15 = [v14 allKeys];

    uint64_t v16 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
    uint64_t v17 = [v16 nextExistingThreadObjectIDForThreadObjectID:v6 forSortDescriptors:v13 journaledThreadsToCheck:v15 excluding:0];
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1CA98] null];
    }
    id v20 = v19;

    uint64_t v21 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
    uint64_t v22 = [v21 lastObject];
    int v23 = [v22 addObjectIDToMove:v6 before:v20];

    if (v23)
    {
      long long v24 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
        int v29 = 134218754;
        uint64_t v30 = self;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        uint64_t v36 = v25;
        _os_log_impl(&dword_1DB39C000, &v24->super, OS_LOG_TYPE_DEFAULT, "%p: Adding move for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v29, 0x2Au);
      }
    }
    else
    {
      long long v24 = objc_alloc_init(_EDThreadPositionChangeSet);
      [(_EDThreadPositionChangeSet *)v24 addObjectIDToMove:v6 before:v20];
      long long v26 = [(EDPrecomputedThreadQueryHandler *)self pendingPositionChanges];
      [v26 addObject:v24];

      long long v27 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
        int v29 = 134218754;
        uint64_t v30 = self;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        uint64_t v36 = v28;
        _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "%p: Adding move to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v29, 0x2Au);
      }
    }
  }
}

- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5
{
  id v8 = objc_alloc(MEMORY[0x1E4F604E0]);
  uint64_t v9 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  uint64_t v10 = (void *)[v8 initWithConversationID:a4 threadScope:v9];

  uint64_t v11 = [(EDPrecomputedThreadQueryHandler *)self messageListItemForObjectID:v10 error:0];

  if (v11)
  {
    uint64_t v12 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__EDPrecomputedThreadQueryHandler_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke;
    v13[3] = &unk_1E6C00900;
    v13[4] = self;
    id v14 = v10;
    int64_t v15 = a3;
    [v12 performSyncBlock:v13];
  }
}

void __117__EDPrecomputedThreadQueryHandler_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = [*(id *)(a1 + 32) unreportedJournaledObjectIDs];
  char v2 = [v7 containsObject:*(void *)(a1 + 40)];

  if ((v2 & 1) == 0)
  {
    if ([*(id *)(a1 + 32) _isAddingOrDeletingObjectID:*(void *)(a1 + 40)])
    {
      id v8 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        char v3 = *(void **)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = [v3 threadScope];
        *(_DWORD *)buf = 134218498;
        uint64_t v11 = v3;
        __int16 v12 = 2114;
        uint64_t v13 = v4;
        __int16 v14 = 2114;
        int64_t v15 = v5;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_INFO, "%p: Ignoring Conversation Notification Level change for objectID: %{public}@\n%{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F60388]);
      id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v9 setConversationNotificationLevel:v6];

      [*(id *)(a1 + 32) _addChangeToPendingChanges:v9 forThreadObjectID:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _flushUpdatesWithReason:@"conversation flags change"];
    }
  }
}

- (void)persistenceIsDeletingThreadWithObjectID:(id)a3 generationWindow:(id)a4
{
  id v5 = a3;
  id v6 = [v5 threadScope];
  id v7 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92__EDPrecomputedThreadQueryHandler_persistenceIsDeletingThreadWithObjectID_generationWindow___block_invoke;
    v10[3] = &unk_1E6C048E8;
    void v10[4] = self;
    id v11 = v5;
    [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v9 performCancelableBlock:v10];
  }
}

void __92__EDPrecomputedThreadQueryHandler_persistenceIsDeletingThreadWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) unreportedJournaledObjectIDs];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v14 = [v4 unreportedJournaledObjectIDs];
    [v14 removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = [v4 reportedJournaledObjectIDs];
    [v5 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    id v6 = +[EDPrecomputedThreadQueryHandler log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v7 threadScope];
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "%p: Adding objectID to delete: %{public}@\n%{public}@", buf, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) pendingPositionChanges];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      __int16 v12 = [*(id *)(a1 + 32) pendingPositionChanges];
      uint64_t v13 = [(_EDThreadPositionChangeSet *)v12 lastObject];
      [v13 addObjectIDToDelete:*(void *)(a1 + 40)];
    }
    else
    {
      __int16 v12 = objc_alloc_init(_EDThreadPositionChangeSet);
      [(_EDThreadPositionChangeSet *)v12 addObjectIDToDelete:*(void *)(a1 + 40)];
      uint64_t v13 = [*(id *)(a1 + 32) pendingPositionChanges];
      [v13 addObject:v12];
    }
  }
}

- (void)persistenceDidFinishThreadUpdates
{
  int v3 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__EDPrecomputedThreadQueryHandler_persistenceDidFinishThreadUpdates__block_invoke;
  v4[3] = &unk_1E6C048C0;
  v4[4] = self;
  [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v3 performCancelableBlock:v4];
}

uint64_t __68__EDPrecomputedThreadQueryHandler_persistenceDidFinishThreadUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushUpdatesWithReason:0];
}

- (void)persistenceDidChangeBusinessIDForMessages:(id)a3 fromBusinessID:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v19;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = -[EDPrecomputedThreadQueryHandler _messageForPersistedMessage:](self, "_messageForPersistedMessage:", *(void *)(*((void *)&v26 + 1) + 8 * v8), v19);
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 itemID];
          [v21 addObject:v11];

          id v12 = objc_alloc(MEMORY[0x1E4F604E0]);
          uint64_t v13 = [v10 conversationID];
          id v14 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
          int64_t v15 = (void *)[v12 initWithConversationID:v13 threadScope:v14];

          [v5 addObject:v15];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__EDPrecomputedThreadQueryHandler_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke;
  v22[3] = &unk_1E6C04A28;
  id v17 = v5;
  id v23 = v17;
  long long v24 = self;
  id v18 = v21;
  id v25 = v18;
  [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v16 performCancelableBlock:v22];
}

void __92__EDPrecomputedThreadQueryHandler_persistenceDidChangeBusinessIDForMessages_fromBusinessID___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v21;
    uint64_t v19 = *MEMORY[0x1E4F5FDE0];
    uint64_t v6 = *MEMORY[0x1E4F5FDE8];
    *(void *)&long long v4 = 134218498;
    long long v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "unreportedJournaledObjectIDs", v18);
        char v10 = [v9 containsObject:v8];

        if ((v10 & 1) == 0)
        {
          if ([*(id *)(a1 + 40) _isAddingOrDeletingObjectID:v8])
          {
            uint64_t v11 = +[EDPrecomputedThreadQueryHandler log];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              id v12 = *(void **)(a1 + 40);
              uint64_t v13 = [v12 threadScope];
              *(_DWORD *)buf = v18;
              long long v26 = v12;
              __int16 v27 = 2114;
              uint64_t v28 = v8;
              __int16 v29 = 2114;
              uint64_t v30 = v13;
              _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_INFO, "%p: Ignoring business change for objectID: %{public}@\n%{public}@", buf, 0x20u);
            }
          }
          else
          {
            id v14 = [*(id *)(a1 + 40) threadPersistence];
            v24[0] = v19;
            v24[1] = v6;
            int64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
            uint64_t v11 = [v14 changeForThreadWithObjectID:v8 changedKeyPaths:v15];

            uint64_t v16 = *(void **)(a1 + 48);
            id v17 = [v11 displayMessageItemID];
            LODWORD(v16) = [v16 containsObject:v17];

            if (v16)
            {
              [*(id *)(a1 + 40) _addChangeToPendingChanges:v11 forThreadObjectID:v8];
              [*(id *)(a1 + 40) _flushUpdatesWithReason:@"businessID change"];
            }
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v31 count:16];
    }
    while (v3);
  }
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v7 = a5;
  uint64_t v8 = [(EDPrecomputedThreadQueryHandler *)self _messageForPersistedMessage:v7];
  if (v8)
  {
    id v9 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __113__EDPrecomputedThreadQueryHandler_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
    v10[3] = &unk_1E6C048E8;
    id v11 = v8;
    id v12 = self;
    [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v9 performCancelableBlock:v10];
  }
}

void __113__EDPrecomputedThreadQueryHandler_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F604E0]);
  uint64_t v3 = [*(id *)(a1 + 32) conversationID];
  long long v4 = [*(id *)(a1 + 40) threadScope];
  uint64_t v5 = (void *)[v2 initWithConversationID:v3 threadScope:v4];

  uint64_t v6 = [*(id *)(a1 + 40) unreportedJournaledObjectIDs];
  LOBYTE(v3) = [v6 containsObject:v5];

  if ((v3 & 1) == 0)
  {
    if ([*(id *)(a1 + 40) _isAddingOrDeletingObjectID:v5])
    {
      id v7 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void **)(a1 + 40);
        id v9 = [v8 threadScope];
        *(_DWORD *)buf = 134218498;
        id v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v5;
        __int16 v20 = 2114;
        long long v21 = v9;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "%p: Ignoring messageID change for objectID: %{public}@\n%{public}@", buf, 0x20u);
      }
    }
    else
    {
      char v10 = [*(id *)(a1 + 40) threadPersistence];
      uint64_t v15 = *MEMORY[0x1E4F5FE40];
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      id v7 = [v10 changeForThreadWithObjectID:v5 changedKeyPaths:v11];

      id v12 = [v7 displayMessageItemID];
      uint64_t v13 = [*(id *)(a1 + 32) itemID];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        [*(id *)(a1 + 40) _addChangeToPendingChanges:v7 forThreadObjectID:v5];
        [*(id *)(a1 + 40) _flushUpdatesWithReason:@"messageID change"];
      }
    }
  }
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 containsObject:*MEMORY[0x1E4F60790]];
  int v10 = [v7 containsObject:*MEMORY[0x1E4F60798]];
  int v11 = [v7 containsObject:@"GeneratedSummary"];
  char v12 = v11;
  if ((v9 | v10 | v11) == 1)
  {
    uint64_t v13 = [(EDPrecomputedThreadQueryHandler *)self _messageForPersistedMessage:v8];
    if (v13)
    {
      int v14 = [(EDPrecomputedThreadQueryHandler *)self changeScheduler];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __91__EDPrecomputedThreadQueryHandler_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
      v16[3] = &unk_1E6C04A50;
      id v15 = v13;
      id v17 = v15;
      __int16 v18 = self;
      char v19 = v9;
      char v20 = v10;
      char v21 = v12;
      [(EDPrecomputedThreadQueryHandler *)self _onScheduler:v14 performCancelableBlock:v16];
    }
  }
}

void __91__EDPrecomputedThreadQueryHandler_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F604E0]);
  uint64_t v3 = [*(id *)(a1 + 32) conversationID];
  long long v4 = [*(id *)(a1 + 40) threadScope];
  uint64_t v5 = (void *)[v2 initWithConversationID:v3 threadScope:v4];

  uint64_t v6 = [*(id *)(a1 + 40) unreportedJournaledObjectIDs];
  LOBYTE(v3) = [v6 containsObject:v5];

  if ((v3 & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 49)) {
      id v7 = @"subject and summary change";
    }
    else {
      id v7 = @"subject change";
    }
    id v8 = @"summary change";
    if (!*(unsigned char *)(a1 + 49)) {
      id v8 = @"unknown change";
    }
    if (*(unsigned char *)(a1 + 48)) {
      int v9 = v7;
    }
    else {
      int v9 = v8;
    }
    if ([*(id *)(a1 + 40) _isAddingOrDeletingObjectID:v5])
    {
      int v10 = +[EDPrecomputedThreadQueryHandler log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *(void **)(a1 + 40);
        char v12 = [v11 threadScope];
        *(_DWORD *)buf = 134218754;
        __int16 v33 = v11;
        __int16 v34 = 2114;
        __int16 v35 = v9;
        __int16 v36 = 2114;
        uint64_t v37 = v5;
        __int16 v38 = 2114;
        v39 = v12;
        _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_INFO, "%p: Ignoring %{public}@ for objectID: %{public}@\n%{public}@", buf, 0x2Au);
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v14 = *MEMORY[0x1E4F5FE40];
        id v15 = objc_msgSend(v13, "initWithObjects:", *MEMORY[0x1E4F5FE40], 0);
        uint64_t v16 = v15;
        if (*(unsigned char *)(a1 + 48)) {
          [v15 addObject:*MEMORY[0x1E4F5FF40]];
        }
        if (*(unsigned char *)(a1 + 49)) {
          [v16 addObject:*MEMORY[0x1E4F5FF48]];
        }
        id v17 = [*(id *)(a1 + 40) threadPersistence];
        __int16 v18 = [v17 changeForThreadWithObjectID:v5 changedKeyPaths:v16];

        char v19 = [v18 displayMessageItemID];
        char v20 = [*(id *)(a1 + 32) itemID];
        int v21 = [v19 isEqual:v20];

        if (v21)
        {
          uint64_t v22 = [*(id *)(a1 + 40) reportedJournaledObjectIDs];
          long long v23 = [v22 objectForKeyedSubscript:v5];

          if (v23)
          {
            [v16 removeObject:v14];
            [v23 addObjectsFromArray:v16];
          }
          else
          {
            [*(id *)(a1 + 40) _addChangeToPendingChanges:v18 forThreadObjectID:v5];
            [*(id *)(a1 + 40) _flushUpdatesWithReason:v9];
          }
        }
      }
      if (*(unsigned char *)(a1 + 50))
      {
        long long v24 = [*(id *)(a1 + 40) threadPersistence];
        id v25 = [v24 newestMessageItemIDForThreadWithObjectID:v5];
        long long v26 = [*(id *)(a1 + 32) itemID];
        int v27 = [v25 isEqual:v26];

        if (v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F60388]);
          __int16 v29 = [*(id *)(a1 + 32) generatedSummary];
          [v28 setGeneratedSummary:v29];

          uint64_t v30 = [*(id *)(a1 + 40) reportedJournaledObjectIDs];
          uint64_t v31 = [v30 objectForKeyedSubscript:v5];

          if (v31)
          {
            [v31 addObject:*MEMORY[0x1E4F5FE70]];
          }
          else
          {
            [*(id *)(a1 + 40) _addChangeToPendingChanges:v28 forThreadObjectID:v5];
            [*(id *)(a1 + 40) _flushUpdatesWithReason:v9];
          }
        }
      }
    }
  }
}

- (id)_messageForPersistedMessage:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  uint64_t v6 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
  v15[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v8 = [v5 mailboxScope];
  int v9 = [v6 messagesForPersistedMessages:v7 mailboxScope:v8];
  int v10 = [v9 firstObject];

  int v11 = [v5 filterPredicate];
  if (v11)
  {
    char v12 = [v5 filterPredicate];
    char v13 = [v12 evaluateWithObject:v10];

    if ((v13 & 1) == 0)
    {

      int v10 = 0;
    }
  }

  return v10;
}

void __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [WeakRetained mailboxes];
    uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v3)
    {
      char v5 = 0;
      uint64_t v6 = *(void *)v23;
      *(void *)&long long v4 = 134218242;
      long long v19 = v4;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v9 = (void *)MEMORY[0x1E0190280]();
          int v10 = [v2 threadPersistence];
          int v11 = [v2 threadScope];
          char v12 = [v10 oldestThreadObjectIDForMailbox:v8 threadScope:v11];

          char v13 = [v2 oldestThreadObjectIDsByMailbox];
          uint64_t v14 = [v13 objectForKeyedSubscript:v8];

          if (v12 != v14 && ([v12 isEqual:v14] & 1) == 0)
          {
            id v15 = [v2 oldestThreadObjectIDsByMailbox];
            [v15 setObject:v12 forKeyedSubscript:v8];

            uint64_t v16 = +[EDPrecomputedThreadQueryHandler log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              id v17 = objc_msgSend(v8, "ef_publicDescription");
              *(_DWORD *)buf = v19;
              int v27 = v2;
              __int16 v28 = 2114;
              __int16 v29 = v17;
              _os_log_debug_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEBUG, "%p: Oldest thread updated for mailbox: %{public}@", buf, 0x16u);
            }
            char v5 = 1;
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v3);

      if (v5)
      {
        __int16 v18 = [v2 changeScheduler];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke_90;
        v21[3] = &unk_1E6C048C0;
        v21[4] = v2;
        [v2 _onScheduler:v18 performCancelableBlock:v21];
      }
    }
    else
    {
    }
    objc_msgSend(v2, "setUpdateOldestThreadsCancelationToken:", 0, v19);
  }
}

void __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke_90(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) oldestThreadObjectIDsByMailbox];
  [v4 observer:v2 matchedOldestItemsUpdatedForMailboxes:v3];
}

- (void)controller:(id)a3 messageTimerFired:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(EDPrecomputedThreadQueryHandler *)self updateDisplayDate])
  {
    uint64_t v6 = [(EDPrecomputedThreadQueryHandler *)self _messageForPersistedMessage:v5];
    if (v6)
    {
      id v7 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
      v9[0] = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v7 updateBeforeDisplayForPersistedMessages:v8];
    }
  }
}

- (id)labelForStateCapture
{
  id v2 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v3 = [v2 label];

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(EDPrecomputedThreadQueryHandler *)self threadPersistence];
  id v7 = [(EDPrecomputedThreadQueryHandler *)self threadScope];
  id v8 = [(EDMessageRepositoryQueryHandler *)self query];
  int v9 = [v8 sortDescriptors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__EDPrecomputedThreadQueryHandler_itemIDsForStateCaptureWithErrorString___block_invoke;
  v12[3] = &unk_1E6C04A78;
  id v10 = v5;
  id v13 = v10;
  [v6 threadObjectIDsForThreadScope:v7 sortDescriptors:v9 initialBatchSize:15000 journaledObjectIDs:0 batchBlock:v12];

  if (a3) {
    *a3 = 0;
  }

  return v10;
}

void __73__EDPrecomputedThreadQueryHandler_itemIDsForStateCaptureWithErrorString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(a2, "ef_compactMapSelector:", sel_collectionItemID);
  [v4 addObjectsFromArray:v5];

  *a3 = 15000;
}

- (void)setCancelationToken:(id)a3
{
}

- (NSMutableDictionary)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
}

- (NSMutableArray)pendingPositionChanges
{
  return self->_pendingPositionChanges;
}

- (void)setPendingPositionChanges:(id)a3
{
}

- (void)setUnreportedJournaledObjectIDs:(id)a3
{
}

- (NSMutableDictionary)reportedJournaledObjectIDs
{
  return self->_reportedJournaledObjectIDs;
}

- (void)setReportedJournaledObjectIDs:(id)a3
{
}

- (NSMutableDictionary)oldestThreadObjectIDsByMailbox
{
  return self->_oldestThreadObjectIDsByMailbox;
}

- (void)setOldestThreadObjectIDsByMailbox:(id)a3
{
}

- (EDUpdateThrottler)updateThrottler
{
  return self->_updateThrottler;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_updateOldestThreadsCancelationToken, 0);
  objc_storeStrong((id *)&self->_oldestThreadObjectIDsByMailbox, 0);
  objc_storeStrong((id *)&self->_reportedJournaledObjectIDs, 0);
  objc_storeStrong((id *)&self->_unreportedJournaledObjectIDs, 0);
  objc_storeStrong((id *)&self->_pendingPositionChanges, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_changeScheduler, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);

  objc_storeStrong((id *)&self->_threadScope, 0);
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_56_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 134218498;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "%p: Timedout update for %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end