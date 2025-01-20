@interface EDMessageCountQueryHandler
+ (OS_os_log)log;
- (BOOL)_moreThan:(uint64_t)a3 messagesExistWithGlobalMessageID:;
- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7;
- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7 refireDebounceInterval:(double)a8;
- (id)_filterMessages:(void *)a3 potentiallyMatchingMessages:;
- (id)_locked_expandedQueryWithReason:(uint64_t)a1;
- (id)_originalMessagesKeyForKey:(void *)a1;
- (id)descriptionForItem:(id)a3;
- (id)itemsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (os_unfair_lock_s)expandedQuery;
- (uint64_t)_shouldObserveCategorization;
- (uint64_t)_shouldObserveChangeVIPStatus;
- (uint64_t)_shouldObserveDidUpdateFollowUp;
- (uint64_t)_shouldObserveDidUpdateReadLaterDate;
- (uint64_t)_shouldObserveDidUpdateSendLaterDate;
- (void)_decrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:;
- (void)_fireCountCalculation;
- (void)_forceUnfreezeAfterMailboxSyncTimeout;
- (void)_incrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:;
- (void)_notifyObserverWithLogMessage:(uint64_t)a1;
- (void)_persistenceDidDeleteMessages:(uint64_t)a3 includeMessagesWithDeletedFlag:(void *)a4 generationWindow:;
- (void)_prepareForChangeWithMessages:(void *)a3 changeKey:;
- (void)_processChangedMessages:(void *)a3 changeKey:(void *)a4 generationWindow:;
- (void)_reallyScheduleCountCalculationWithReason:(uint64_t)a3 generation:;
- (void)_resetExpandedQuery;
- (void)_scheduleCountCalculationWithReason:(uint64_t)a3 generation:;
- (void)_scheduleCountForNotificationWithReason:(uint64_t)a3 generation:;
- (void)cancel;
- (void)dealloc;
- (void)didSyncMailbox:(id)a3;
- (void)mailboxListChanged:(id)a3;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeCategoryForAddressIDs:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidChangeVIPStatus:(BOOL)a3 messages:(id)a4;
- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5;
- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidUpdateLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidUpdateMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)persistenceDidUpdateServerCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5;
- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5;
- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4;
- (void)test_tearDown;
- (void)willSyncMailbox:(id)a3;
@end

@implementation EDMessageCountQueryHandler

void __36__EDMessageCountQueryHandler_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)cancel
{
  if (self) {
    scheduler = self->_scheduler;
  }
  else {
    scheduler = 0;
  }
  v4 = scheduler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__EDMessageCountQueryHandler_cancel__block_invoke;
  v6[3] = &unk_1E6BFF2F0;
  v6[4] = self;
  [(EFAssertableScheduler *)v4 performBlock:v6];

  v5 = [(EDMessagePersistence *)self->_messagePersistence mailboxPersistence];
  [v5 removeChangeObserverWithIdentifier:self->_mailboxObserverID];

  [(EFCancelationToken *)self->_cancelationToken cancel];
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NSTimer *)self->_mailboxSyncTimer invalidate];
  v3 = self->_scheduler;
  v4 = [(EFAssertableScheduler *)v3 scheduler];

  v5 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = self->_query;
    uint64_t v11 = [(EMQuery *)v10 label];
    v12 = (void *)v11;
    v13 = &stru_1F3583658;
    *(_DWORD *)buf = 134218498;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v16 = self;
    __int16 v17 = 2114;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_debug_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEBUG, "<%p: %{public}@> Checking in scheduler %@", buf, 0x20u);
  }
  if (v4) {
    checkInScheduler(v4);
  }
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7 = [(EDMessagePersistence *)self->_messagePersistence mailboxPersistence];
  [v7 removeChangeObserverWithIdentifier:self->_mailboxObserverID];

  id v8 = (id)EFAtomicObjectRelease();
  id v9 = (id)EFAtomicObjectRelease();

  v14.receiver = self;
  v14.super_class = (Class)EDMessageCountQueryHandler;
  [(EDMessageCountQueryHandler *)&v14 dealloc];
}

- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7
{
  return [(EDMessageCountQueryHandler *)self initWithQuery:a3 serverCountMailboxScope:a4 messagePersistence:a5 hookRegistry:a6 observer:a7 refireDebounceInterval:0.0];
}

- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7 refireDebounceInterval:(double)a8
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v70 = a4;
  id v71 = a5;
  id v16 = a6;
  id v17 = a7;
  v79.receiver = self;
  v79.super_class = (Class)EDMessageCountQueryHandler;
  v18 = [(EDMessageCountQueryHandler *)&v79 init];
  if (v18)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v83 = __Block_byref_object_copy__20;
    v84 = __Block_byref_object_dispose__20;
    id v85 = 0;
    __int16 v19 = defaultSchedulers();
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __checkOutScheduler_block_invoke;
    v80[3] = &unk_1E6C02A80;
    v80[4] = buf;
    [v19 performWhileLocked:v80];

    v72 = (uint64_t (*)(uint64_t, uint64_t))*(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    uint64_t v20 = [MEMORY[0x1E4F60F38] assertableSchedulerWithScheduler:v72];
    scheduler = v18->_scheduler;
    v18->_scheduler = (EFAssertableScheduler *)v20;

    v22 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v67 = [v15 label];
      v68 = (void *)v67;
      v69 = &stru_1F3583658;
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v18;
      if (v67) {
        v69 = (__CFString *)v67;
      }
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2112;
      v83 = v72;
      _os_log_debug_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEBUG, "<%p: %{public}@> Checking out scheduler %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&v18->_query, a3);
    v18->_recalculationDelay = 0.125;
    v18->_expandedQueryLock._os_unfair_lock_opaque = 0;
    v18->_recalculationLock._os_unfair_lock_opaque = 0;
    v23 = (void *)MEMORY[0x1E4F60390];
    v24 = [v15 predicate];
    uint64_t v25 = *MEMORY[0x1E4F5FE98];
    v81[0] = *MEMORY[0x1E4F5FE50];
    v81[1] = v25;
    v81[2] = *MEMORY[0x1E4F5FE48];
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:3];
    uint64_t v27 = [v23 predicateFromPredicate:v24 ignoringKeyPaths:v26];
    predicateIgnoringFlags = v18->_predicateIgnoringFlags;
    v18->_predicateIgnoringFlags = (NSPredicate *)v27;

    objc_storeStrong((id *)&v18->_serverCountMailboxScope, a4);
    objc_storeWeak((id *)&v18->_resultsObserver, v17);
    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serverCounts = v18->_serverCounts;
    v18->_serverCounts = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mailboxesBeingSynced = v18->_mailboxesBeingSynced;
    v18->_mailboxesBeingSynced = v31;

    objc_storeStrong((id *)&v18->_messagePersistence, a5);
    objc_storeStrong((id *)&v18->_hookRegistry, a6);
    v33 = [NSString stringWithFormat:@"%@-MailboxObserver-%@", objc_opt_class(), v18];
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F60400]) initWithRepresentedObjectID:v33];
    mailboxObserverID = v18->_mailboxObserverID;
    v18->_mailboxObserverID = (EMObjectID *)v34;

    v36 = [(EDMessagePersistence *)v18->_messagePersistence mailboxPersistence];
    [v36 addChangeObserver:v18 withIdentifier:v18->_mailboxObserverID];

    v18->_seenMessageIDsLock._os_unfair_lock_opaque = 0;
    v37 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E4F60DB8]);
    seenMessageIDs = v18->_seenMessageIDs;
    v18->_seenMessageIDs = v37;

    v39 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E4F60DB8]);
    newMessageIDs = v18->_newMessageIDs;
    v18->_newMessageIDs = v39;

    v41 = [EDUpdateThrottler alloc];
    v42 = [v15 label];
    uint64_t v43 = [(EDUpdateThrottler *)v41 initWithName:v42 delayInterval:10 scalingFactor:1.0];
    updateThrottler = v18->_updateThrottler;
    v18->_updateThrottler = (EDUpdateThrottler *)v43;

    v45 = [[EDMessageQueryEvaluator alloc] initWithQuery:v15 messagePersistence:v18->_messagePersistence];
    queryEvaluator = v18->_queryEvaluator;
    v18->_queryEvaluator = v45;

    uint64_t v47 = [NSString stringWithFormat:@"%@-MessagesPendingFlagChangesKey-%p", objc_opt_class(), v18];
    pendingFlagChangesKey = v18->_pendingFlagChangesKey;
    v18->_pendingFlagChangesKey = (NSString *)v47;

    uint64_t v49 = [NSString stringWithFormat:@"%@-MessagesPendingCategorizationChangesKey-%p", objc_opt_class(), v18];
    pendingCategorizationChangesKey = v18->_pendingCategorizationChangesKey;
    v18->_pendingCategorizationChangesKey = (NSString *)v49;

    if (a8 > 0.0)
    {
      id v51 = objc_alloc(MEMORY[0x1E4F60D50]);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke;
      v76[3] = &unk_1E6C02990;
      v77 = v72;
      v52 = v18;
      v78 = v52;
      uint64_t v53 = [v51 initWithTimeInterval:v77 scheduler:1 startAfter:v76 block:a8];
      refireDebouncer = v52->_refireDebouncer;
      v52->_refireDebouncer = (EFDebouncer *)v53;
    }
    [(EDPersistenceHookRegistry *)v18->_hookRegistry registerMailboxChangeHookResponder:v18];
    [(EDPersistenceHookRegistry *)v18->_hookRegistry registerMessageChangeHookResponder:v18];
    [(EDPersistenceHookRegistry *)v18->_hookRegistry registerCategoryChangeHookResponder:v18];
    v55 = (void *)MEMORY[0x1E4F60D40];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_3;
    v73[3] = &unk_1E6BFFAF0;
    id v74 = v16;
    v56 = v18;
    v75 = v56;
    uint64_t v57 = [v55 tokenWithCancelationBlock:v73];
    cancelationToken = v56->_cancelationToken;
    v56->_cancelationToken = (EFCancelationToken *)v57;

    id v59 = objc_alloc(MEMORY[0x1E4F60D98]);
    v60 = (objc_class *)objc_opt_class();
    v61 = NSStringFromClass(v60);
    uint64_t v62 = [v59 initWithTitle:v61 itemName:@"Messages" headLimit:20 tailLimit:0 delegate:v56];
    stateCapturer = v56->_stateCapturer;
    v56->_stateCapturer = (EFListStateCapturer *)v62;

    v64 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v64 addObserver:v56 selector:sel_willSyncMailbox_ name:@"EDNotificationWillSyncMailbox" object:0];

    v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v65 addObserver:v56 selector:sel_didSyncMailbox_ name:@"EDNotificationDidSyncMailbox" object:0];

    -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:]((uint64_t)v56, @"Initialization", 0);
  }

  return v18;
}

- (void)_fireCountCalculation
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 128);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke;
    v3[3] = &unk_1E6BFFA50;
    v3[4] = a1;
    v3[5] = sel__fireCountCalculation;
    [v2 performBlock:v3];
  }
}

- (id)_locked_expandedQueryWithReason:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 136);
    id v5 = *(id *)(a1 + 176);
    v6 = [v5 queryWithExpandedMailboxesFromQuery:v4];

    v7 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 label];
      uint64_t v9 = [v6 predicate];
      v10 = (void *)v9;
      uint64_t v11 = &stru_1F3583658;
      int v13 = 134218754;
      if (v8) {
        uint64_t v11 = v8;
      }
      uint64_t v14 = a1;
      __int16 v15 = 2114;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@ count handler with query: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_notifyObserverWithLogMessage:(uint64_t)a1
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 240);
    uint64_t v78 = 0;
    objc_super v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 0;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    uint64_t v70 = 0;
    id v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    id v5 = *(void **)(a1 + 8);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke;
    v69[3] = &unk_1E6C02A30;
    v69[4] = &v78;
    v69[5] = &v74;
    v69[6] = &v70;
    [v5 enumerateKeysAndObjectsUsingBlock:v69];
    uint64_t v6 = v79[3];
    uint64_t v7 = v75[3];
    uint64_t v8 = v71[3];
    uint64_t v9 = [*(id *)(a1 + 16) count];
    uint64_t v10 = v6 + v4 + v7 - v8;
    if (v9)
    {
      uint64_t v11 = +[EDMessageCountQueryHandler log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = v10;
        uint64_t v56 = v4;
        id v59 = v3;
        v52 = (id *)*(id *)(a1 + 136);
        uint64_t v12 = [v52 label];
        int v13 = (void *)v12;
        if (v12) {
          uint64_t v14 = (__CFString *)v12;
        }
        else {
          uint64_t v14 = &stru_1F3583658;
        }
        uint64_t v15 = v79[3];
        uint64_t v16 = v75[3];
        __int16 v17 = (void *)v71[3];
        id v18 = queryDescription((void *)a1);
        __int16 v19 = mailboxScopeDescription((void *)a1);
        *(_DWORD *)buf = 134220547;
        uint64_t v83 = a1;
        __int16 v84 = 2114;
        id v85 = v14;
        __int16 v86 = 2114;
        id v87 = v59;
        __int16 v88 = 2048;
        uint64_t v89 = v9;
        __int16 v90 = 2048;
        uint64_t v91 = v53;
        __int16 v92 = 2048;
        uint64_t v93 = v56;
        __int16 v94 = 2048;
        uint64_t v95 = v15;
        __int16 v96 = 2048;
        uint64_t v97 = v16;
        __int16 v98 = 2048;
        v99 = v17;
        id v3 = v59;
        __int16 v100 = 2113;
        v101 = v18;
        __int16 v102 = 2114;
        v103 = v19;
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@ (%lu mailboxes being synced): %lld = %lld + %lld + (%lld - %lld)\n%{private}@\n%{public}@", buf, 0x70u);
      }
      goto LABEL_28;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    uint64_t v68 = 0;
    objc_initWeak(&location, (id)a1);
    id v20 = *(id *)(a1 + 200);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_84;
    v65[3] = &unk_1E6C01468;
    objc_copyWeak(&v66, &location);
    uint64_t v21 = [v20 updateWithBlock:v65 unacknowledgedUpdatesCount:&v68];

    if (v21)
    {
      v22 = [v21 label];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_89;
      v62[3] = &unk_1E6BFF198;
      objc_copyWeak(&v64, &location);
      v63 = v22;
      log = v63;
      [v21 addInvocationBlock:v62];
      v23 = +[EDMessageCountQueryHandler log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v54 = v21;
        uint64_t v57 = v4;
        uint64_t v24 = v10;
        id v60 = v3;
        id v49 = *(id *)(a1 + 136);
        uint64_t v25 = [v49 label];
        v26 = (void *)v25;
        if (v25) {
          uint64_t v27 = (__CFString *)v25;
        }
        else {
          uint64_t v27 = &stru_1F3583658;
        }
        uint64_t v28 = v79[3];
        uint64_t v29 = v75[3];
        uint64_t v30 = v71[3];
        v31 = queryDescription((void *)a1);
        v32 = mailboxScopeDescription((void *)a1);
        *(_DWORD *)buf = 134220547;
        uint64_t v83 = a1;
        __int16 v84 = 2114;
        id v85 = v27;
        __int16 v86 = 2114;
        id v87 = v60;
        __int16 v88 = 2048;
        uint64_t v89 = v24;
        __int16 v90 = 2048;
        uint64_t v91 = v57;
        __int16 v92 = 2048;
        uint64_t v93 = v28;
        __int16 v94 = 2048;
        uint64_t v95 = v29;
        __int16 v96 = 2048;
        uint64_t v97 = v30;
        id v3 = v60;
        __int16 v98 = 2114;
        v99 = v54;
        __int16 v100 = 2113;
        v101 = v31;
        __int16 v102 = 2114;
        v103 = v32;
        _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@: %lld = %lld + %lld + (%lld - %lld), %{public}@\n%{private}@\n%{public}@", buf, 0x70u);

        uint64_t v10 = v24;
        uint64_t v21 = v54;
      }
      if (v10 < 0)
      {
        v33 = +[EDMessageCountQueryHandler log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          id v45 = *(id *)(a1 + 136);
          uint64_t v46 = [v45 label];
          uint64_t v47 = (void *)v46;
          v48 = &stru_1F3583658;
          if (v46) {
            v48 = (__CFString *)v46;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v83 = a1;
          __int16 v84 = 2114;
          id v85 = v48;
          _os_log_error_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_ERROR, "<%p: %{public}@> Total count is negative.", buf, 0x16u);
        }
        uint64_t v10 = 0;
      }
      if (([*(id *)(a1 + 192) isCanceled] & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
        [WeakRetained countDidChange:v10 acknowledgementToken:v21];
      }
      objc_destroyWeak(&v64);
    }
    else
    {
      v35 = +[EDMessageCountQueryHandler log];
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);
LABEL_28:
        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(&v74, 8);
        _Block_object_dispose(&v78, 8);
        goto LABEL_29;
      }
      uint64_t v55 = v10;
      uint64_t v58 = v4;
      log = v35;
      id v61 = v3;
      id v50 = *(id *)(a1 + 136);
      uint64_t v36 = [v50 label];
      v37 = (void *)v36;
      if (v36) {
        v38 = (__CFString *)v36;
      }
      else {
        v38 = &stru_1F3583658;
      }
      uint64_t v39 = v68;
      uint64_t v40 = v79[3];
      uint64_t v41 = v75[3];
      v42 = (void *)v71[3];
      uint64_t v43 = queryDescription((void *)a1);
      v44 = mailboxScopeDescription((void *)a1);
      *(_DWORD *)buf = 134220547;
      uint64_t v83 = a1;
      __int16 v84 = 2114;
      id v85 = v38;
      __int16 v86 = 2114;
      id v87 = v61;
      __int16 v88 = 2048;
      uint64_t v89 = v39;
      id v3 = v61;
      __int16 v90 = 2048;
      uint64_t v91 = v55;
      __int16 v92 = 2048;
      uint64_t v93 = v58;
      __int16 v94 = 2048;
      uint64_t v95 = v40;
      __int16 v96 = 2048;
      uint64_t v97 = v41;
      __int16 v98 = 2048;
      v99 = v42;
      __int16 v100 = 2113;
      v101 = v43;
      __int16 v102 = 2114;
      v103 = v44;
      _os_log_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@ (%lu unacknowledged updates): %lld = %lld + %lld + (%lld - %lld)\n%{private}@\n%{public}@", buf, 0x70u);
    }
    v35 = log;
    goto LABEL_27;
  }
LABEL_29:
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 136);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;
    uint64_t v6 = [v5 label];
    uint64_t v7 = (void *)v6;
    uint64_t v8 = &stru_1F3583658;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v3;
    __int16 v51 = 2114;
    v52 = v8;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "<%p: %{public}@> Firing count calculation", buf, 0x16u);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v9 = (void *)v9[22];
  }
  uint64_t v10 = v9;
  uint64_t v11 = -[EDMessageCountQueryHandler expandedQuery](*(os_unfair_lock_s **)(a1 + 32));
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_65;
  v41[3] = &unk_1E6C029E0;
  uint64_t v12 = *(void *)(a1 + 32);
  v44 = &v45;
  v41[4] = v12;
  int v13 = v10;
  id v42 = v13;
  id v14 = v11;
  id v43 = v14;
  [v13 performDatabaseReadBlock:v41];
  uint64_t v15 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 112);
  os_unfair_lock_lock(v15);
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllIndexes];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllIndexes];
  os_unfair_lock_unlock(v15);
  uint64_t v16 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 120);
  os_unfair_lock_lock(v16);
  uint64_t v17 = *(void *)(a1 + 32);
  unint64_t v18 = *(void *)(v17 + 80);
  if (!v18)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"EDMessageCountQueryHandler.m" lineNumber:377 description:@"Decrementing past 0"];

    uint64_t v17 = *(void *)(a1 + 32);
    unint64_t v18 = *(void *)(v17 + 80);
  }
  if (v18 > 1) {
    goto LABEL_21;
  }
  if (v46[3] >= *(void *)(v17 + 72))
  {
    *(void *)(v17 + 80) = 0;
    *(void *)(*(void *)(a1 + 32) + 88) = 0x3FC0000000000000;
    os_unfair_lock_unlock(v16);
  }
  else
  {
    double v19 = *(double *)(v17 + 88);
    *(double *)(v17 + 88) = fmin(v19 + v19, 15.0);
    id v20 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      if (v21) {
        v22 = *(void **)(v21 + 136);
      }
      else {
        v22 = 0;
      }
      id v23 = v22;
      uint64_t v24 = [v23 label];
      uint64_t v25 = (void *)v24;
      v26 = &stru_1F3583658;
      if (v24) {
        v26 = (__CFString *)v24;
      }
      uint64_t v27 = v46[3];
      uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 134219010;
      uint64_t v50 = v21;
      __int16 v51 = 2114;
      v52 = v26;
      __int16 v53 = 2048;
      double v54 = v19;
      __int16 v55 = 2048;
      uint64_t v56 = v27;
      __int16 v57 = 2048;
      uint64_t v58 = v28;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_INFO, "<%p: %{public}@> Rescheduling after %.3f due to generation %lld being lower than minimum required generation %lld", buf, 0x34u);
    }
    if (v19 == 0.0)
    {
      uint64_t v17 = *(void *)(a1 + 32);
LABEL_21:
      *(void *)(v17 + 80) = 1;
      *(void *)(*(void *)(a1 + 32) + 88) = 0x3FC0000000000000;
      os_unfair_lock_unlock(v16);
      -[EDMessageCountQueryHandler _fireCountCalculation](*(void *)(a1 + 32));
      goto LABEL_26;
    }
    os_unfair_lock_unlock(v16);
    uint64_t v29 = *(void **)(a1 + 32);
    if (v29) {
      uint64_t v29 = (void *)v29[16];
    }
    uint64_t v30 = v29;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_73;
    v40[3] = &unk_1E6BFF2F0;
    v40[4] = *(void *)(a1 + 32);
    id v31 = (id)[v30 afterDelay:v40 performBlock:v19];
  }
LABEL_26:
  -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), @"full count");
  v32 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = *(void *)(a1 + 32);
    if (v33) {
      uint64_t v34 = *(void **)(v33 + 136);
    }
    else {
      uint64_t v34 = 0;
    }
    id v35 = v34;
    uint64_t v36 = [v35 label];
    v37 = (void *)v36;
    v38 = &stru_1F3583658;
    if (v36) {
      v38 = (__CFString *)v36;
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = v33;
    __int16 v51 = 2114;
    v52 = v38;
    _os_log_impl(&dword_1DB39C000, v32, OS_LOG_TYPE_INFO, "<%p: %{public}@> Finished count calculation", buf, 0x16u);
  }
  _Block_object_dispose(&v45, 8);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDMessageCountQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_53 != -1) {
    dispatch_once(&log_onceToken_53, block);
  }
  id v2 = (void *)log_log_53;

  return (OS_os_log *)v2;
}

- (os_unfair_lock_s)expandedQuery
{
  v1 = a1;
  if (a1)
  {
    id v2 = a1 + 29;
    os_unfair_lock_lock(a1 + 29);
    uint64_t v3 = *(void **)&v1[12]._os_unfair_lock_opaque;
    if (!v3)
    {
      uint64_t v4 = -[EDMessageCountQueryHandler _locked_expandedQueryWithReason:]((uint64_t)v1, @"starting");
      id v5 = *(void **)&v1[12]._os_unfair_lock_opaque;
      *(void *)&v1[12]._os_unfair_lock_opaque = v4;

      uint64_t v3 = *(void **)&v1[12]._os_unfair_lock_opaque;
    }
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

uint64_t __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterHookResponder:*(void *)(a1 + 40)];
}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  if (v4)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) += v4[1];
    uint64_t v6 = v4[2];
    uint64_t v5 = v4[3];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  if (v6 != *MEMORY[0x1E4F5FD20] && v5 != *MEMORY[0x1E4F5FD20])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) += v6;
    *(void *)(*(void *)(a1[6] + 8) + 24) += v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCategorizationChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingFlagChangesKey, 0);
  objc_storeStrong((id *)&self->_refireDebouncer, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_storeStrong((id *)&self->_queryEvaluator, 0);
  objc_storeStrong((id *)&self->_serverCountMailboxScope, 0);
  objc_storeStrong((id *)&self->_predicateIgnoringFlags, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_newMessageIDs, 0);
  objc_storeStrong((id *)&self->_seenMessageIDs, 0);
  objc_storeStrong((id *)&self->_expandedQuery, 0);
  objc_storeStrong((id *)&self->_mailboxObserverID, 0);
  objc_storeStrong((id *)&self->_mailboxSyncTimer, 0);
  objc_storeStrong((id *)&self->_mailboxesBeingSynced, 0);

  objc_storeStrong((id *)&self->_serverCounts, 0);
}

void __33__EDMessageCountQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_53;
  log_log_53 = (uint64_t)v1;
}

void __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_2;
  v6[3] = &unk_1E6BFFAF0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

void __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) first];
  id v3 = [*(id *)(a1 + 40) second];
  -[EDMessageCountQueryHandler _reallyScheduleCountCalculationWithReason:generation:](v2, v4, [v3 longLongValue]);
}

- (void)_reallyScheduleCountCalculationWithReason:(uint64_t)a3 generation:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 80);
    if (v6 <= a3) {
      uint64_t v6 = a3;
    }
    *(void *)(a1 + 72) = v6;
    *(void *)(a1 + 80) = v7 + 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
    if (!v7)
    {
      id v8 = +[EDMessageCountQueryHandler log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = *(id *)(a1 + 136);
        uint64_t v10 = [v9 label];
        uint64_t v11 = (void *)v10;
        uint64_t v12 = &stru_1F3583658;
        int v13 = 134218754;
        if (v10) {
          uint64_t v12 = (__CFString *)v10;
        }
        uint64_t v14 = a1;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        __int16 v17 = 2048;
        uint64_t v18 = a3;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Scheduling count calculation after generation %lld with reason %@", (uint8_t *)&v13, 0x2Au);
      }
      -[EDMessageCountQueryHandler _fireCountCalculation](a1);
    }
  }
}

- (void)_scheduleCountCalculationWithReason:(uint64_t)a3 generation:
{
  id v8 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 216))
    {
      id v5 = (void *)MEMORY[0x1E4F60DF0];
      uint64_t v6 = [NSNumber numberWithLongLong:a3];
      uint64_t v7 = [v5 pairWithFirst:v8 second:v6];

      [*(id *)(a1 + 216) debounceResult:v7];
    }
    else
    {
      -[EDMessageCountQueryHandler _reallyScheduleCountCalculationWithReason:generation:](a1, v8, a3);
    }
  }
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageCountQueryHandler.m", 262, @"%s can only be called from unit tests", "-[EDMessageCountQueryHandler test_tearDown]");
  }
  [(EDMessageCountQueryHandler *)self cancel];
  if (self) {
    scheduler = self->_scheduler;
  }
  else {
    scheduler = 0;
  }
  id v5 = [(EFAssertableScheduler *)scheduler scheduler];
  checkInScheduler(v5);

  if (self) {
    uint64_t v6 = self->_scheduler;
  }
  else {
    uint64_t v6 = 0;
  }
  [(EFAssertableScheduler *)v6 stopAndWait];
  messagePersistence = self->_messagePersistence;
  self->_messagePersistence = 0;
}

- (void)_resetExpandedQuery
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 116);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 116));
    uint64_t v3 = -[EDMessageCountQueryHandler _locked_expandedQueryWithReason:](a1, @"resetting");
    id v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v3;

    os_unfair_lock_unlock(v2);
  }
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_65(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  uint64_t v4 = mach_absolute_time();
  id v5 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 136);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v8 label];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = &stru_1F3583658;
    *(_DWORD *)buf = 134218498;
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    double v32 = *(double *)&a2;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> recalculating unread counts (generation %lld)", buf, 0x20u);
  }
  uint64_t v12 = [*(id *)(a1 + 40) countOfMessagesMatchingQuery:*(void *)(a1 + 48)];
  *(void *)(*(void *)(a1 + 32) + 240) = v12;
  *(void *)(*(void *)(a1 + 32) + 24) = a2;
  int v13 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      __int16 v15 = *(void **)(v14 + 136);
    }
    else {
      __int16 v15 = 0;
    }
    id v16 = v15;
    __int16 v17 = [v16 label];
    uint64_t v18 = mach_absolute_time();
    if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_0 != -1) {
      dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_0, &__block_literal_global_398_1);
    }
    __int16 v19 = &stru_1F3583658;
    if (v17) {
      __int16 v19 = v17;
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v28 = v14;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2048;
    double v32 = (double)((v18 - v4)
                 * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_0
                 / *(unsigned int *)algn_1EB5F6FCC)
        / 1000000000.0;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_INFO, "<%p: %{public}@> query took %.04fs localCount:%ld", buf, 0x2Au);
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20)
  {
    id v21 = *(id *)(v20 + 152);
    if (v21)
    {
      v22 = v21;
      uint64_t v23 = *(void *)(a1 + 32);
      if (v23) {
        uint64_t v24 = *(void **)(v23 + 176);
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v25 = [v24 mailboxPersistence];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_66;
      v26[3] = &unk_1E6C029B8;
      v26[4] = *(void *)(a1 + 32);
      [v25 serverCountsForMailboxScope:v22 block:v26];
    }
  }
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_66(uint64_t a1, void *a2, int64_t a3, int64_t a4, int64_t a5)
{
  id v11 = a2;
  uint64_t v9 = objc_alloc_init(_EDMailboxServerCount);
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_serverCount = a3;
    v9->_mostRecentStatusCount = a4;
    v9->_lastSyncStatusCount = a5;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v9 forKeyedSubscript:v11];
}

uint64_t __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_73(uint64_t a1)
{
  return -[EDMessageCountQueryHandler _fireCountCalculation](*(void *)(a1 + 32));
}

- (void)_incrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1 && a2)
  {
    uint64_t v10 = [v8 earliestGeneration];
    uint64_t v11 = [v9 latestGeneration];
    uint64_t v12 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = *(id *)(a1 + 136);
      uint64_t v14 = [v13 label];
      __int16 v15 = (void *)v14;
      id v16 = &stru_1F3583658;
      *(_DWORD *)buf = 134219266;
      if (v14) {
        id v16 = (__CFString *)v14;
      }
      uint64_t v24 = a1;
      __int16 v25 = 2114;
      v26 = v16;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2048;
      uint64_t v30 = a2;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@: Scheduling increment of %lld (window: %llu:%llu)", buf, 0x3Eu);
    }
    id v17 = *(id *)(a1 + 128);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__EDMessageCountQueryHandler__incrementLocalCount_logMessage_generationWindow___block_invoke;
    v18[3] = &unk_1E6C02A08;
    uint64_t v20 = v11;
    uint64_t v21 = a2;
    v18[4] = a1;
    id v19 = v7;
    uint64_t v22 = v10;
    [v17 performBlock:v18];
  }
}

void __79__EDMessageCountQueryHandler__incrementLocalCount_logMessage_generationWindow___block_invoke(uint64_t *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 24);
  if (a1[6] <= v3)
  {
    BOOL v6 = a1[8] > v3;
    id v7 = +[EDMessageCountQueryHandler log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = a1[4];
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 136);
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;
        uint64_t v12 = [v11 label];
        id v13 = (void *)v12;
        uint64_t v14 = &stru_1F3583658;
        uint64_t v15 = *(void *)(a1[4] + 24);
        if (v12) {
          uint64_t v14 = (__CFString *)v12;
        }
        uint64_t v16 = a1[8];
        uint64_t v17 = a1[6];
        int v27 = 134219010;
        uint64_t v28 = v9;
        __int16 v29 = 2114;
        uint64_t v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> increment occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", (uint8_t *)&v27, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1[4], @"Incrementing local counts", a1[6]);
    }
    else
    {
      if (v8)
      {
        uint64_t v18 = a1[4];
        if (v18) {
          id v19 = *(void **)(v18 + 136);
        }
        else {
          id v19 = 0;
        }
        id v20 = v19;
        uint64_t v21 = [v20 label];
        uint64_t v22 = (void *)v21;
        uint64_t v23 = &stru_1F3583658;
        uint64_t v24 = *(void *)(a1[4] + 24);
        if (v21) {
          uint64_t v23 = (__CFString *)v21;
        }
        uint64_t v25 = a1[8];
        uint64_t v26 = a1[6];
        int v27 = 134219010;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        uint64_t v30 = v23;
        __int16 v31 = 2048;
        uint64_t v32 = v24;
        __int16 v33 = 2048;
        uint64_t v34 = v25;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> increment ignored due to newer resync generation (ours: %llu, window: %llu:%llu)", (uint8_t *)&v27, 0x34u);
      }
    }
  }
  else
  {
    *(void *)(v2 + 240) += a1[7];
    uint64_t v4 = a1[4];
    id v5 = (void *)a1[5];
    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](v4, v5);
  }
}

- (void)_decrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1 && a2)
  {
    uint64_t v10 = [v8 earliestGeneration];
    uint64_t v11 = [v9 latestGeneration];
    uint64_t v12 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = *(id *)(a1 + 136);
      uint64_t v14 = [v13 label];
      uint64_t v15 = (void *)v14;
      uint64_t v16 = &stru_1F3583658;
      *(_DWORD *)buf = 134219266;
      if (v14) {
        uint64_t v16 = (__CFString *)v14;
      }
      uint64_t v24 = a1;
      __int16 v25 = 2114;
      uint64_t v26 = v16;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2048;
      uint64_t v30 = a2;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@: Scheduling decrement of %lld (window: %llu:%llu)", buf, 0x3Eu);
    }
    id v17 = *(id *)(a1 + 128);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__EDMessageCountQueryHandler__decrementLocalCount_logMessage_generationWindow___block_invoke;
    v18[3] = &unk_1E6C02A08;
    uint64_t v20 = v11;
    uint64_t v21 = a2;
    v18[4] = a1;
    id v19 = v7;
    uint64_t v22 = v10;
    [v17 performBlock:v18];
  }
}

void __79__EDMessageCountQueryHandler__decrementLocalCount_logMessage_generationWindow___block_invoke(uint64_t *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 24);
  if (a1[6] <= v3)
  {
    BOOL v6 = a1[8] > v3;
    id v7 = +[EDMessageCountQueryHandler log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = a1[4];
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 136);
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;
        uint64_t v12 = [v11 label];
        id v13 = (void *)v12;
        uint64_t v14 = &stru_1F3583658;
        uint64_t v15 = *(void *)(a1[4] + 24);
        if (v12) {
          uint64_t v14 = (__CFString *)v12;
        }
        uint64_t v16 = a1[8];
        uint64_t v17 = a1[6];
        int v27 = 134219010;
        uint64_t v28 = v9;
        __int16 v29 = 2114;
        uint64_t v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> decrement occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", (uint8_t *)&v27, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1[4], @"Decrementing local counts", a1[6]);
    }
    else
    {
      if (v8)
      {
        uint64_t v18 = a1[4];
        if (v18) {
          id v19 = *(void **)(v18 + 136);
        }
        else {
          id v19 = 0;
        }
        id v20 = v19;
        uint64_t v21 = [v20 label];
        uint64_t v22 = (void *)v21;
        uint64_t v23 = &stru_1F3583658;
        uint64_t v24 = *(void *)(a1[4] + 24);
        if (v21) {
          uint64_t v23 = (__CFString *)v21;
        }
        uint64_t v25 = a1[8];
        uint64_t v26 = a1[6];
        int v27 = 134219010;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        uint64_t v30 = v23;
        __int16 v31 = 2048;
        uint64_t v32 = v24;
        __int16 v33 = 2048;
        uint64_t v34 = v25;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> decrement ignored due to newer resync generation (ours: %llu, window: %llu:%llu)", (uint8_t *)&v27, 0x34u);
      }
    }
  }
  else
  {
    *(void *)(v2 + 240) -= a1[7];
    uint64_t v4 = a1[4];
    id v5 = (void *)a1[5];
    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](v4, v5);
  }
}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_84(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && a2)
  {
    id v5 = WeakRetained[16];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_2;
    v6[3] = &unk_1E6BFF2F0;
    void v6[4] = v4;
    [v5 performBlock:v6];
  }
}

uint64_t __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_2(uint64_t a1)
{
  return -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), @"All updates acknowledged");
}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_89(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (WeakRetained) {
      uint64_t v4 = (void *)WeakRetained[17];
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;
    uint64_t v6 = [v5 label];
    id v7 = (void *)v6;
    BOOL v8 = &stru_1F3583658;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v6) {
      BOOL v8 = (__CFString *)v6;
    }
    int v10 = 134218498;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Acknowledged update %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)willSyncMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"EDNotificationKeyMailbox"];

  if (self)
  {
    id v7 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    id v7 = 0;
    messagePersistence = 0;
  }
  uint64_t v9 = messagePersistence;
  int v10 = [(EDMessagePersistence *)v9 mailboxPersistence];
  int v11 = [(EMMailboxScope *)v7 scopeContainsMailboxObjectID:v6 mailboxTypeResolver:v10];

  if (v11)
  {
    if (self) {
      scheduler = self->_scheduler;
    }
    else {
      scheduler = 0;
    }
    id v13 = scheduler;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke;
    v14[3] = &unk_1E6BFFAF0;
    v14[4] = self;
    id v15 = v6;
    [(EFAssertableScheduler *)v13 performBlock:v14];
  }
}

void __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      id v4 = *(void **)(v3 + 136);
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
    uint64_t v6 = [v5 label];
    id v7 = (void *)v6;
    BOOL v8 = &stru_1F3583658;
    uint64_t v9 = *(void *)(a1 + 40);
    if (v6) {
      BOOL v8 = (__CFString *)v6;
    }
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v3;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Started syncing mailbox %{public}@", buf, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  int v10 = *(void **)(a1 + 32);
  int v11 = (void *)v10[4];
  if (v11)
  {
    [v11 invalidate];
    int v10 = *(void **)(a1 + 32);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v10);
  __int16 v12 = (void *)MEMORY[0x1E4F1CB00];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke_91;
  v17[3] = &unk_1E6C02A58;
  objc_copyWeak(&v18, (id *)buf);
  uint64_t v13 = [v12 timerWithTimeInterval:0 repeats:v17 block:300.0];
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v13;

  Main = CFRunLoopGetMain();
  CFRunLoopAddTimer(Main, *(CFRunLoopTimerRef *)(*(void *)(a1 + 32) + 32), (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke_91(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    -[EDMessageCountQueryHandler _forceUnfreezeAfterMailboxSyncTimeout]((uint64_t)WeakRetained);
  }
}

- (void)_forceUnfreezeAfterMailboxSyncTimeout
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 128);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__EDMessageCountQueryHandler__forceUnfreezeAfterMailboxSyncTimeout__block_invoke;
    v3[3] = &unk_1E6BFF2F0;
    v3[4] = a1;
    [v2 performBlock:v3];
  }
}

void __67__EDMessageCountQueryHandler__forceUnfreezeAfterMailboxSyncTimeout__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = +[EDMessageCountQueryHandler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(void **)(v6 + 136);
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v8 label];
    int v10 = (void *)v9;
    int v11 = &stru_1F3583658;
    if (v9) {
      int v11 = (__CFString *)v9;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
    int v13 = 134218498;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_fault_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_FAULT, "<%p: %{public}@> Mailbox sync timed out for %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = (uint64_t *)(a1 + 32);
  [*(id *)(v4 + 16) removeAllObjects];
  id v5 = *(void **)(*v3 + 32);
  *(void *)(*v3 + 32) = 0;

  [(EDMessageCountQueryHandler *)*v3 _notifyObserverWithLogMessage:@"Mailbox sync timed out"];
}

- (void)didSyncMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"EDNotificationKeyMailbox"];

  if (self) {
    scheduler = self->_scheduler;
  }
  else {
    scheduler = 0;
  }
  id v8 = scheduler;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__EDMessageCountQueryHandler_didSyncMailbox___block_invoke;
  v10[3] = &unk_1E6BFFAF0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(EFAssertableScheduler *)v8 performBlock:v10];
}

void __45__EDMessageCountQueryHandler_didSyncMailbox___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = 0;
    }
    id v4 = [NSString alloc];
    id v5 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v6 = (id)[v4 initWithFormat:@"Finished syncing mailbox %@", v5];

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), v6);
  }
}

- (id)_originalMessagesKeyForKey:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    a1 = [v3 stringByAppendingString:@"Original"];
  }

  return a1;
}

- (void)_prepareForChangeWithMessages:(void *)a3 changeKey:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v32 = a3;
  if (a1)
  {
    if ((unint64_t)[v33 count] >= 6)
    {
      id v5 = [NSString stringWithFormat:@"Prepare for change. changesKey:%@", v32];
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1, v5, 0);

      goto LABEL_23;
    }
    id v6 = [*(id *)(a1 + 160) transformMessages:v33];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    id v42 = 0;
    uint64_t v30 = v6;
    id v7 = -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:](a1, v6, &v42);
    id v31 = v42;
    uint64_t v8 = [v7 count];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v9);
          }
          int v13 = *(void **)(a1 + 56);
          uint64_t v14 = [*(id *)(*((void *)&v38 + 1) + 8 * i) objectID];
          objc_msgSend(v13, "addIndex:", objc_msgSend(v14, "globalMessageID"));
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v10);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v31;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (!v16)
    {
LABEL_22:

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      uint64_t v24 = [NSNumber numberWithInteger:v8];
      uint64_t v25 = [MEMORY[0x1E4F29060] currentThread];
      uint64_t v26 = [v25 threadDictionary];
      [v26 setObject:v24 forKeyedSubscript:v32];

      int v27 = [MEMORY[0x1E4F29060] currentThread];
      uint64_t v28 = [v27 threadDictionary];
      __int16 v29 = -[EDMessageCountQueryHandler _originalMessagesKeyForKey:]((void *)a1, v32);
      [v28 setObject:v33 forKeyedSubscript:v29];

      goto LABEL_23;
    }
    uint64_t v17 = *(void *)v35;
LABEL_13:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(v15);
      }
      uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
      __int16 v20 = [v19 objectID];
      uint64_t v21 = [v20 globalMessageID];

      if ([*(id *)(a1 + 56) containsIndex:v21]) {
        goto LABEL_19;
      }
      __int16 v22 = [v19 objectID];
      BOOL v23 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, [v22 globalMessageID]);

      if (v23) {
        break;
      }
LABEL_20:
      if (v16 == ++v18)
      {
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (!v16) {
          goto LABEL_22;
        }
        goto LABEL_13;
      }
    }
    [*(id *)(a1 + 56) addIndex:v21];
LABEL_19:
    ++v8;
    goto LABEL_20;
  }
LABEL_23:
}

- (id)_filterMessages:(void *)a3 potentiallyMatchingMessages:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 160);
    id v14 = 0;
    id v7 = [v6 filterMessages:v5 unmatchedMessages:&v14];
    id v8 = v14;

    id v9 = *(id *)(a1 + 144);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__EDMessageCountQueryHandler__filterMessages_potentiallyMatchingMessages___block_invoke;
    v12[3] = &unk_1E6BFF8B8;
    id v13 = v9;
    id v10 = v9;
    objc_msgSend(v8, "ef_filter:", v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_moreThan:(uint64_t)a3 messagesExistWithGlobalMessageID:
{
  if (!a1) {
    return 0;
  }
  id v6 = *(id *)(a1 + 176);
  id v7 = -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)a1);
  BOOL v8 = [v6 countOfMessagesWithGlobalMessageID:a3 matchingQuery:v7] > a2;

  return v8;
}

- (void)_processChangedMessages:(void *)a3 changeKey:(void *)a4 generationWindow:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v36 = a3;
  id v34 = a4;
  if (a1)
  {
    BOOL v8 = [MEMORY[0x1E4F29060] currentThread];
    id v9 = [v8 threadDictionary];

    long long v38 = v9;
    id v33 = [v9 objectForKeyedSubscript:v36];
    long long v35 = -[EDMessageCountQueryHandler _originalMessagesKeyForKey:]((void *)a1, v36);
    long long v37 = objc_msgSend(v9, "objectForKeyedSubscript:");

    [v9 setObject:0 forKeyedSubscript:v36];
    [v9 setObject:0 forKeyedSubscript:v35];
    if (v37 && (unint64_t)[v37 count] < 6)
    {
      uint64_t v11 = [*(id *)(a1 + 160) transformMessages:v37];
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
      id v47 = 0;
      id v31 = v11;
      uint64_t v12 = -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:](a1, v11, &v47);
      id v32 = v47;
      uint64_t v13 = [v12 count];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(a1 + 56);
            uint64_t v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) objectID];
            objc_msgSend(v18, "addIndex:", objc_msgSend(v19, "globalMessageID"));
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v15);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v20 = v32;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v40 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            uint64_t v25 = [v24 objectID];
            uint64_t v26 = [v25 globalMessageID];

            if ([*(id *)(a1 + 56) containsIndex:v26])
            {
              int v27 = [v24 objectID];
              BOOL v28 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, [v27 globalMessageID]);

              if (v28)
              {
                ++v13;
              }
              else
              {
                [*(id *)(a1 + 56) removeIndex:v26];
                [*(id *)(a1 + 64) removeIndex:v26];
              }
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v21);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      uint64_t v29 = [v33 integerValue];
      if (v13 != v29)
      {
        uint64_t v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Changed messages from %lld matches to %lld matches", v29, v13);
        if (v13 <= v29) {
          -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:](a1, v29 - v13, v30, v34);
        }
        else {
          -[EDMessageCountQueryHandler _incrementLocalCount:logMessage:generationWindow:](a1, v13 - v29, v30, v34);
        }
      }
    }
    else
    {
      id v10 = [NSString stringWithFormat:@"Process change. changesKey:%@", v36];
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1, v10, [v34 latestGeneration]);
    }
  }
  else
  {
    long long v37 = v7;
  }
}

uint64_t __74__EDMessageCountQueryHandler__filterMessages_potentiallyMatchingMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 count])
  {
    if (self) {
      queryEvaluator = self->_queryEvaluator;
    }
    else {
      queryEvaluator = 0;
    }
    BOOL v8 = -[EDMessageQueryEvaluator transformMessages:](queryEvaluator, "transformMessages:", v11, v11);
    id v12 = 0;
    id v9 = -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:]((uint64_t)self, v8, &v12);
    id v10 = v12;
    if ([v9 count] || objc_msgSend(v10, "count")) {
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:]((uint64_t)self, @"Persistence did add messages", [v6 latestGeneration]);
    }
  }
}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![v12 deletedChanged] || (objc_msgSend(v12, "deleted") & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F60390];
    BOOL v8 = -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)self);
    id v9 = [v8 predicate];
    LODWORD(v7) = [v7 predicate:v9 appliesToFlagChange:v12];

    if (v7)
    {
      if (self) {
        id Property = objc_getProperty(self, v10, 224, 1);
      }
      else {
        id Property = 0;
      }
      -[EDMessageCountQueryHandler _prepareForChangeWithMessages:changeKey:]((uint64_t)self, v6, Property);
    }
  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v15 deletedChanged] && objc_msgSend(v15, "deleted"))
  {
    -[EDMessageCountQueryHandler _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:generationWindow:]((uint64_t)self, v8, 1, v9);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F60390];
    id v11 = -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)self);
    id v12 = [v11 predicate];
    LODWORD(v10) = [v10 predicate:v12 appliesToFlagChange:v15];

    if (v10)
    {
      if (self) {
        id Property = objc_getProperty(self, v13, 224, 1);
      }
      else {
        id Property = 0;
      }
      -[EDMessageCountQueryHandler _processChangedMessages:changeKey:generationWindow:]((uint64_t)self, v8, Property, v9);
    }
  }
}

- (void)_persistenceDidDeleteMessages:(uint64_t)a3 includeMessagesWithDeletedFlag:(void *)a4 generationWindow:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v23 = a4;
  if (a1)
  {
    uint64_t v22 = [*(id *)(a1 + 160) transformAndFilterMessages:v7 includeDeleted:a3];
    if ((unint64_t)[v7 count] < 6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v8 = v22;
      uint64_t v9 = 0;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            id v14 = [v13 objectID];
            uint64_t v15 = [v14 globalMessageID];

            uint64_t v16 = [v13 objectID];
            LODWORD(v14) = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, [v16 globalMessageID]);

            if (v14)
            {
              [*(id *)(a1 + 56) addIndex:v15];
            }
            else
            {
              if ([*(id *)(a1 + 64) containsIndex:v15]) {
                [*(id *)(a1 + 64) removeIndex:v15];
              }
              else {
                ++v9;
              }
              [*(id *)(a1 + 56) removeIndex:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v10);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      if (v9)
      {
        uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Deleted %lld messages", v9);
        -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:](a1, v9, v17, v23);
      }
      else
      {
        uint64_t v17 = +[EDMessageCountQueryHandler log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = *(id *)(a1 + 136);
          uint64_t v19 = [v18 label];
          id v20 = (void *)v19;
          uint64_t v21 = &stru_1F3583658;
          *(_DWORD *)buf = 134218498;
          if (v19) {
            uint64_t v21 = (__CFString *)v19;
          }
          uint64_t v29 = a1;
          __int16 v30 = 2114;
          id v31 = v21;
          __int16 v32 = 2114;
          id v33 = v8;
          _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@>: Count is already 0, did not decrementLocalCount. nonmatchingMessages: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1, @"Persistence did delete messages", [v23 latestGeneration]);
    }
  }
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 containsObject:*MEMORY[0x1E4F60788]] & 1) != 0 && objc_msgSend(v9, "numberOfAttachments"))
  {
    if (self) {
      query = self->_query;
    }
    else {
      query = 0;
    }
    id v12 = (void *)MEMORY[0x1E4F60390];
    uint64_t v13 = [(EMQuery *)query predicate];
    id v14 = [v12 predicateFromPredicate:v13 ignoringKeyPaths:MEMORY[0x1E4F1CBF0]];

    uint64_t v15 = (void *)MEMORY[0x1E4F60390];
    v24[0] = *MEMORY[0x1E4F5FE90];
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v17 = [v15 predicateFromPredicate:v14 ignoringKeyPaths:v16];

    if ([v14 isEqual:v17]) {
      goto LABEL_12;
    }
    os_unfair_lock_lock(&self->_seenMessageIDsLock);
    uint64_t v18 = [v9 globalMessageID];
    if (([(EFMutableInt64Set *)self->_seenMessageIDs containsIndex:v18] & 1) == 0)
    {
      queryEvaluator = self->_queryEvaluator;
      id v23 = v9;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      uint64_t v21 = [(EDMessageQueryEvaluator *)queryEvaluator transformAndFilterMessages:v20];

      if ([v21 count])
      {
        [(EFMutableInt64Set *)self->_seenMessageIDs addIndex:v18];
        BOOL v22 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:]((uint64_t)self, 1, [v9 globalMessageID]);

        os_unfair_lock_unlock(&self->_seenMessageIDsLock);
        if (!v22) {
          -[EDMessageCountQueryHandler _incrementLocalCount:logMessage:generationWindow:]((uint64_t)self, 1, @"New match after changing number of attachments", v10);
        }
        goto LABEL_12;
      }
    }
    os_unfair_lock_unlock(&self->_seenMessageIDsLock);
LABEL_12:
  }
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  os_unfair_lock_lock(&self->_seenMessageIDsLock);
  if ([(EFMutableInt64Set *)self->_seenMessageIDs containsIndex:a3])
  {
    [(EFMutableInt64Set *)self->_seenMessageIDs removeIndex:a3];
  }
  else
  {
    queryEvaluator = self->_queryEvaluator;
    v16[0] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v13 = [(EDMessageQueryEvaluator *)queryEvaluator transformAndFilterMessages:v12];

    LOBYTE(v12) = [v13 count] == 0;
    if (v12)
    {
      os_unfair_lock_unlock(&self->_seenMessageIDsLock);
      goto LABEL_9;
    }
  }
  uint64_t v14 = [v9 globalMessageID];
  if ([(EFMutableInt64Set *)self->_seenMessageIDs containsIndex:v14])
  {
    os_unfair_lock_unlock(&self->_seenMessageIDsLock);
LABEL_7:
    -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:]((uint64_t)self, 1, @"Changed message ID to one we've already counted", v10);
    goto LABEL_9;
  }
  [(EFMutableInt64Set *)self->_seenMessageIDs addIndex:v14];
  BOOL v15 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:]((uint64_t)self, 1, [v9 globalMessageID]);
  os_unfair_lock_unlock(&self->_seenMessageIDsLock);
  if (v15) {
    goto LABEL_7;
  }
LABEL_9:
}

- (void)_scheduleCountForNotificationWithReason:(uint64_t)a3 generation:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1 && ([a1[24] isCanceled] & 1) == 0)
  {
    id v6 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = a1[17];
      uint64_t v8 = [v7 label];
      id v9 = (void *)v8;
      id v10 = &stru_1F3583658;
      *(_DWORD *)buf = 134218498;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      uint64_t v16 = a1;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@, refreshing query", buf, 0x20u);
    }
    id v11 = a1[16];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__EDMessageCountQueryHandler__scheduleCountForNotificationWithReason_generation___block_invoke;
    v12[3] = &unk_1E6C00900;
    void v12[4] = a1;
    id v13 = v5;
    uint64_t v14 = a3;
    [v11 performBlock:v12];
  }
}

void __81__EDMessageCountQueryHandler__scheduleCountForNotificationWithReason_generation___block_invoke(uint64_t *a1)
{
  -[EDMessageCountQueryHandler _resetExpandedQuery](a1[4]);
  uint64_t v2 = a1[4];
  id v3 = (void *)a1[5];
  uint64_t v4 = a1[6];

  -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](v2, v3, v4);
}

- (uint64_t)_shouldObserveChangeVIPStatus
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [*(id *)(a1 + 136) predicate];
  uint64_t v2 = [v1 predicateFormat];

  id v3 = [MEMORY[0x1E4F60390] predicateForIsVIP:1];
  uint64_t v4 = [v3 predicateFormat];

  uint64_t v5 = [v2 containsString:v4];
  return v5;
}

- (void)persistenceDidChangeVIPStatus:(BOOL)a3 messages:(id)a4
{
  if (-[EDMessageCountQueryHandler _shouldObserveChangeVIPStatus]((uint64_t)self))
  {
    NSStringFromSelector(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:generation:]((id *)&self->super.isa, v6, 0);
  }
}

- (uint64_t)_shouldObserveDidUpdateReadLaterDate
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [*(id *)(a1 + 136) predicate];
  if (objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FEF8])) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FF00]);
  }

  return v2;
}

- (uint64_t)_shouldObserveDidUpdateSendLaterDate
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [*(id *)(a1 + 136) predicate];
  uint64_t v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FF18]);

  return v2;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v9 = a6;
  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateReadLaterDate]((uint64_t)self))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:generation:]((id *)&self->super.isa, v8, [v9 latestGeneration]);
  }
}

- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8 = a5;
  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateSendLaterDate]((uint64_t)self))
  {
    id v7 = NSStringFromSelector(a2);
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:generation:]((id *)&self->super.isa, v7, [v8 latestGeneration]);
  }
}

- (uint64_t)_shouldObserveDidUpdateFollowUp
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [*(id *)(a1 + 136) predicate];
  if (objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FE68])) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FE60]);
  }

  return v2;
}

- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4
{
  id v7 = a4;
  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateFollowUp]((uint64_t)self))
  {
    id v6 = NSStringFromSelector(a2);
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:generation:]((id *)&self->super.isa, v6, [v7 latestGeneration]);
  }
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateReadLaterDate]((uint64_t)self))
  {
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:generation:]((id *)&self->super.isa, @"Remind Me timer fired", a5);
  }
}

- (uint64_t)_shouldObserveCategorization
{
  if (!a1) {
    return 0;
  }
  os_log_t v1 = [*(id *)(a1 + 136) predicate];
  uint64_t v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E4F5FE00]);

  return v2;
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (-[EDMessageCountQueryHandler _shouldObserveCategorization]((uint64_t)self))
  {
    if (self) {
      id Property = objc_getProperty(self, v7, 232, 1);
    }
    else {
      id Property = 0;
    }
    -[EDMessageCountQueryHandler _processChangedMessages:changeKey:generationWindow:]((uint64_t)self, v9, Property, v6);
  }
}

- (void)persistenceDidChangeCategoryForAddressIDs:(id)a3 generationWindow:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self) {
    messagePersistence = self->_messagePersistence;
  }
  else {
    messagePersistence = 0;
  }
  id v8 = [(EDMessagePersistence *)messagePersistence persistedMessagesFromSendersWithAddressIDs:v9 temporarilyUnavailableMessageObjectIDs:0];
  [(EDMessageCountQueryHandler *)self persistenceDidChangeCategorizationForMessages:v8 generationWindow:v6];
}

- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (self)
  {
    id v9 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    id v9 = 0;
    messagePersistence = 0;
  }
  id v11 = messagePersistence;
  uint64_t v12 = [(EDMessagePersistence *)v11 mailboxPersistence];
  char v13 = [(EMMailboxScope *)v9 scopeContainsMailboxObjectID:v7 mailboxTypeResolver:v12];

  if (v13)
  {
    uint64_t v14 = [v8 earliestGeneration];
    uint64_t v15 = [v8 latestGeneration];
    uint64_t v16 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (self) {
        query = self->_query;
      }
      else {
        query = 0;
      }
      uint64_t v18 = query;
      uint64_t v19 = [(EMQuery *)v18 label];
      id v20 = (void *)v19;
      uint64_t v21 = &stru_1F3583658;
      *(_DWORD *)buf = 134219010;
      if (v19) {
        uint64_t v21 = (__CFString *)v19;
      }
      uint64_t v29 = self;
      __int16 v30 = 2114;
      id v31 = v21;
      __int16 v32 = 2114;
      id v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v14;
      __int16 v36 = 2048;
      uint64_t v37 = v15;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_INFO, "<%p: %{public}@> Adding mailbox %{public}@ (window: %llu:%llu)", buf, 0x34u);
    }
    if (self) {
      scheduler = self->_scheduler;
    }
    else {
      scheduler = 0;
    }
    id v23 = scheduler;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __97__EDMessageCountQueryHandler_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke;
    v24[3] = &unk_1E6C01620;
    uint64_t v26 = v15;
    v24[4] = self;
    id v25 = v7;
    uint64_t v27 = v14;
    [(EFAssertableScheduler *)v23 performBlock:v24];
  }
}

void __97__EDMessageCountQueryHandler_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke(uint64_t *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1[4] + 24);
  if (a1[6] <= v2)
  {
    BOOL v3 = a1[7] > v2;
    osloga = +[EDMessageCountQueryHandler log];
    BOOL v4 = os_log_type_enabled(osloga, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v4)
      {
        uint64_t v5 = a1[4];
        if (v5) {
          id v6 = *(void **)(v5 + 136);
        }
        else {
          id v6 = 0;
        }
        id v7 = v6;
        uint64_t v8 = [v7 label];
        id v9 = (void *)v8;
        id v10 = &stru_1F3583658;
        uint64_t v11 = *(void *)(a1[4] + 24);
        if (v8) {
          id v10 = (__CFString *)v8;
        }
        uint64_t v13 = a1[6];
        uint64_t v12 = a1[7];
        *(_DWORD *)buf = 134219010;
        uint64_t v26 = v5;
        __int16 v27 = 2114;
        BOOL v28 = v10;
        __int16 v29 = 2048;
        uint64_t v30 = v11;
        __int16 v31 = 2048;
        uint64_t v32 = v12;
        __int16 v33 = 2048;
        uint64_t v34 = v13;
        _os_log_impl(&dword_1DB39C000, osloga, OS_LOG_TYPE_INFO, "<%p: %{public}@> add-mailbox occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](a1[4], @"Persistence is adding mailbox", a1[6]);
    }
    else
    {
      if (v4)
      {
        uint64_t v14 = a1[4];
        if (v14) {
          uint64_t v15 = *(void **)(v14 + 136);
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;
        uint64_t v17 = [v16 label];
        uint64_t v18 = (void *)v17;
        uint64_t v19 = &stru_1F3583658;
        uint64_t v20 = *(void *)(a1[4] + 24);
        if (v17) {
          uint64_t v19 = (__CFString *)v17;
        }
        uint64_t v22 = a1[6];
        uint64_t v21 = a1[7];
        *(_DWORD *)buf = 134219010;
        uint64_t v26 = v14;
        __int16 v27 = 2114;
        BOOL v28 = v19;
        __int16 v29 = 2048;
        uint64_t v30 = v20;
        __int16 v31 = 2048;
        uint64_t v32 = v21;
        __int16 v33 = 2048;
        uint64_t v34 = v22;
        _os_log_impl(&dword_1DB39C000, osloga, OS_LOG_TYPE_INFO, "<%p: %{public}@> add-mailbox notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
    }
  }
  else
  {
    oslog = objc_alloc_init(_EDMailboxServerCount);
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:");
  }
}

- (void)persistenceDidUpdateServerCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    id v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    id v10 = 0;
    messagePersistence = 0;
  }
  uint64_t v12 = messagePersistence;
  uint64_t v13 = [(EDMessagePersistence *)v12 mailboxPersistence];
  char v14 = [(EMMailboxScope *)v10 scopeContainsMailboxObjectID:v8 mailboxTypeResolver:v13];

  if (v14)
  {
    uint64_t v15 = [v9 earliestGeneration];
    uint64_t v16 = [v9 latestGeneration];
    uint64_t v17 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self) {
        query = self->_query;
      }
      else {
        query = 0;
      }
      uint64_t v19 = query;
      uint64_t v20 = [(EMQuery *)v19 label];
      uint64_t v21 = objc_msgSend(v8, "ef_publicDescription");
      uint64_t v22 = (void *)v21;
      id v23 = &stru_1F3583658;
      *(_DWORD *)buf = 134219266;
      if (v20) {
        id v23 = v20;
      }
      uint64_t v32 = self;
      __int16 v33 = 2114;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);
    }
    if (self) {
      scheduler = self->_scheduler;
    }
    else {
      scheduler = 0;
    }
    id v25 = scheduler;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __102__EDMessageCountQueryHandler_persistenceDidUpdateServerCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E6C02A08;
    uint64_t v28 = v16;
    v26[4] = self;
    id v27 = v8;
    int64_t v29 = a3;
    uint64_t v30 = v15;
    [(EFAssertableScheduler *)v25 performBlock:v26];
  }
}

void __102__EDMessageCountQueryHandler_persistenceDidUpdateServerCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (*(void *)(a1 + 48) <= v3)
  {
    BOOL v9 = *(void *)(a1 + 64) > v3;
    loga = +[EDMessageCountQueryHandler log];
    BOOL v10 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          uint64_t v12 = *(void **)(v11 + 136);
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        uint64_t v14 = [v13 label];
        uint64_t v15 = (void *)v14;
        uint64_t v16 = &stru_1F3583658;
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v14) {
          uint64_t v16 = (__CFString *)v14;
        }
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v11;
        __int16 v33 = 2114;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](*(void *)(a1 + 32), @"Persistence did update server count", *(void *)(a1 + 48));
    }
    else
    {
      if (v10)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        if (v20) {
          uint64_t v21 = *(void **)(v20 + 136);
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;
        uint64_t v23 = [v22 label];
        long long v24 = (void *)v23;
        id v25 = &stru_1F3583658;
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v23) {
          id v25 = (__CFString *)v23;
        }
        uint64_t v27 = *(void *)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        uint64_t v34 = v25;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2048;
        uint64_t v40 = v28;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(v2 + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v4) {
      *(void *)(v4 + 8) = *(void *)(a1 + 56);
    }
    os_log_t log = (os_log_t)v4;
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v8 = (void *)[v5 initWithFormat:@"server-count set to %lld for %@", v6, v7];

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), v8);
  }
}

- (void)persistenceDidUpdateMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    BOOL v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    BOOL v10 = 0;
    messagePersistence = 0;
  }
  uint64_t v12 = messagePersistence;
  id v13 = [(EDMessagePersistence *)v12 mailboxPersistence];
  char v14 = [(EMMailboxScope *)v10 scopeContainsMailboxObjectID:v8 mailboxTypeResolver:v13];

  if (v14)
  {
    uint64_t v15 = [v9 earliestGeneration];
    uint64_t v16 = [v9 latestGeneration];
    uint64_t v17 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self) {
        query = self->_query;
      }
      else {
        query = 0;
      }
      uint64_t v19 = query;
      uint64_t v20 = [(EMQuery *)v19 label];
      uint64_t v21 = objc_msgSend(v8, "ef_publicDescription");
      id v22 = (void *)v21;
      uint64_t v23 = &stru_1F3583658;
      *(_DWORD *)buf = 134219266;
      if (v20) {
        uint64_t v23 = v20;
      }
      uint64_t v32 = self;
      __int16 v33 = 2114;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);
    }
    if (self) {
      scheduler = self->_scheduler;
    }
    else {
      scheduler = 0;
    }
    id v25 = scheduler;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __112__EDMessageCountQueryHandler_persistenceDidUpdateMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E6C02A08;
    uint64_t v28 = v16;
    v26[4] = self;
    id v27 = v8;
    int64_t v29 = a3;
    uint64_t v30 = v15;
    [(EFAssertableScheduler *)v25 performBlock:v26];
  }
}

void __112__EDMessageCountQueryHandler_persistenceDidUpdateMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (*(void *)(a1 + 48) <= v3)
  {
    BOOL v9 = *(void *)(a1 + 64) > v3;
    loga = +[EDMessageCountQueryHandler log];
    BOOL v10 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          uint64_t v12 = *(void **)(v11 + 136);
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        uint64_t v14 = [v13 label];
        uint64_t v15 = (void *)v14;
        uint64_t v16 = &stru_1F3583658;
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v14) {
          uint64_t v16 = (__CFString *)v14;
        }
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v11;
        __int16 v33 = 2114;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](*(void *)(a1 + 32), @"Persistence did update most recent status count", *(void *)(a1 + 48));
    }
    else
    {
      if (v10)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        if (v20) {
          uint64_t v21 = *(void **)(v20 + 136);
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;
        uint64_t v23 = [v22 label];
        long long v24 = (void *)v23;
        id v25 = &stru_1F3583658;
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v23) {
          id v25 = (__CFString *)v23;
        }
        uint64_t v27 = *(void *)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        uint64_t v34 = v25;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2048;
        uint64_t v40 = v28;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(v2 + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v4) {
      *(void *)(v4 + 16) = *(void *)(a1 + 56);
    }
    os_log_t log = (os_log_t)v4;
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v8 = (void *)[v5 initWithFormat:@"most-recent-status-count set to %lld for %@", v6, v7];

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), v8);
  }
}

- (void)persistenceDidUpdateLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    BOOL v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    BOOL v10 = 0;
    messagePersistence = 0;
  }
  uint64_t v12 = messagePersistence;
  id v13 = [(EDMessagePersistence *)v12 mailboxPersistence];
  char v14 = [(EMMailboxScope *)v10 scopeContainsMailboxObjectID:v8 mailboxTypeResolver:v13];

  if (v14)
  {
    uint64_t v15 = [v9 earliestGeneration];
    uint64_t v16 = [v9 latestGeneration];
    uint64_t v17 = +[EDMessageCountQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self) {
        query = self->_query;
      }
      else {
        query = 0;
      }
      uint64_t v19 = query;
      uint64_t v20 = [(EMQuery *)v19 label];
      uint64_t v21 = objc_msgSend(v8, "ef_publicDescription");
      id v22 = (void *)v21;
      uint64_t v23 = &stru_1F3583658;
      *(_DWORD *)buf = 134219266;
      if (v20) {
        uint64_t v23 = v20;
      }
      uint64_t v32 = self;
      __int16 v33 = 2114;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync + most-recent-status-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);
    }
    if (self) {
      scheduler = self->_scheduler;
    }
    else {
      scheduler = 0;
    }
    id v25 = scheduler;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __123__EDMessageCountQueryHandler_persistenceDidUpdateLastSyncAndMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E6C02A08;
    uint64_t v28 = v16;
    v26[4] = self;
    id v27 = v8;
    int64_t v29 = a3;
    uint64_t v30 = v15;
    [(EFAssertableScheduler *)v25 performBlock:v26];
  }
}

void __123__EDMessageCountQueryHandler_persistenceDidUpdateLastSyncAndMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (*(void *)(a1 + 48) <= v3)
  {
    BOOL v9 = *(void *)(a1 + 64) > v3;
    loga = +[EDMessageCountQueryHandler log];
    BOOL v10 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          uint64_t v12 = *(void **)(v11 + 136);
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        uint64_t v14 = [v13 label];
        uint64_t v15 = (void *)v14;
        uint64_t v16 = &stru_1F3583658;
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v14) {
          uint64_t v16 = (__CFString *)v14;
        }
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v11;
        __int16 v33 = 2114;
        uint64_t v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync and most-recent-status-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:generation:](*(void *)(a1 + 32), @"Persistence did update last sync and most recent status count", *(void *)(a1 + 48));
    }
    else
    {
      if (v10)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        if (v20) {
          uint64_t v21 = *(void **)(v20 + 136);
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;
        uint64_t v23 = [v22 label];
        long long v24 = (void *)v23;
        id v25 = &stru_1F3583658;
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v23) {
          id v25 = (__CFString *)v23;
        }
        uint64_t v27 = *(void *)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        uint64_t v32 = v20;
        __int16 v33 = 2114;
        uint64_t v34 = v25;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2048;
        uint64_t v40 = v28;
        _os_log_impl(&dword_1DB39C000, loga, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync and most-recent-status-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);
      }
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(v2 + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v4)
    {
      *(void *)(v4 + 16) = *(void *)(a1 + 56);
      *(void *)(v4 + 24) = *(void *)(a1 + 56);
    }
    os_log_t log = (os_log_t)v4;
    id v5 = [NSString alloc];
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    id v8 = (void *)[v5 initWithFormat:@"last-sync and most-recent-status-count to %lld for %@", v6, v7];

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(void *)(a1 + 32), v8);
  }
}

- (void)mailboxListChanged:(id)a3
{
}

- (id)labelForStateCapture
{
  if (self) {
    self = (EDMessageCountQueryHandler *)self->_query;
  }
  uint64_t v2 = [(EDMessageCountQueryHandler *)self label];

  return v2;
}

- (id)itemsForStateCaptureWithErrorString:(id *)a3
{
  if (self)
  {
    uint64_t v4 = self->_messagePersistence;
    query = self->_query;
  }
  else
  {
    uint64_t v4 = 0;
    query = 0;
  }
  uint64_t v6 = [(EDMessagePersistence *)v4 messagesMatchingQuery:query limit:20];

  return v6;
}

- (id)descriptionForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 objectID];
    uint64_t v6 = [v4 flags];
    id v7 = [NSString alloc];
    uint64_t v8 = [v5 globalMessageID];
    int v9 = [v6 read];
    int v10 = [v6 flagged];
    uint64_t v11 = @"unread";
    if (v9) {
      uint64_t v11 = @"read";
    }
    uint64_t v12 = @"not flagged";
    if (v10) {
      uint64_t v12 = @"flagged";
    }
    id v13 = (void *)[v7 initWithFormat:@"GlobalMessageID:%lld - %@, %@", v8, v11, v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end