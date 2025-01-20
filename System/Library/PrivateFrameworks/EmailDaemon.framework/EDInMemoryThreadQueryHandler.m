@interface EDInMemoryThreadQueryHandler
+ (OS_os_log)log;
- (BOOL)_queryHelperIsCurrent:(id)a3;
- (BOOL)collection:(id)a3 reportChanges:(id)a4;
- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5;
- (BOOL)collection:(id)a3 reportDeletes:(id)a4;
- (BOOL)didCancel;
- (BOOL)hasChangesWhilePaused;
- (BOOL)hasEverReconciledJournal;
- (BOOL)isInitialized;
- (BOOL)isPaused;
- (BOOL)isPreparingFirstBatch;
- (BOOL)start;
- (EDInMemoryThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11 helperObserver:(id)a12;
- (EDMessageQueryHelper)messageQueryHelper;
- (EDSearchProvider)searchProvider;
- (EDUpdateThrottler)updateThrottler;
- (EDVIPManager)vipManager;
- (EFAssertableScheduler)scheduler;
- (EMCollectionItemIDStateCapturer)stateCapturer;
- (EMMailboxScope)mailboxScope;
- (EMMessageListItemQueryResultsObserver)resultsObserverIfNotPaused;
- (EMThreadReloadSummaryHelper)reloadSummaryHelper;
- (NSArray)messageSortDescriptors;
- (OS_dispatch_queue)contentProtectionQueue;
- (OS_dispatch_queue)resultQueue;
- (_EDMessageQueryHelperDelegateImpl)messageQueryHelperDelegateImpl;
- (id)_extaInfoPrecachedThreadsForInitialObjectIDs:(id)a3;
- (id)_extraInfoForThreadObjectIDs:(id)a3 isMove:(BOOL)a4;
- (id)_messageQueryFromThreadsQuery:(id)a3;
- (id)_predicateForMessagesInConversations:(id)a3;
- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5;
- (id)itemIDsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (id)mailboxesInCollection:(id)a3;
- (id)messageListItemForObjectID:(id)a3 error:(id *)a4;
- (id)messagesForThread:(id)a3;
- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4;
- (id)queryHelperDelegate;
- (id)threadsAndMessagesForObjectIDs:(id)a3;
- (void)_contentProtectionChangedToLocked;
- (void)_contentProtectionChangedToUnlocked;
- (void)_createHelper;
- (void)_refreshObserver;
- (void)_restartHelper;
- (void)_vipsDidChange:(id)a3;
- (void)cancel;
- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7;
- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4;
- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)didSendUpdatesInCollection:(id)a3;
- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5;
- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4;
- (void)prepareToSendUpdatesInCollection:(id)a3;
- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5;
- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5;
- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5;
- (void)queryHelper:(id)a3 didAddMessages:(id)a4;
- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4;
- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5;
- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5;
- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5;
- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6;
- (void)queryHelperDidFindAllMessages:(id)a3;
- (void)queryHelperDidFinishRemoteSearch:(id)a3;
- (void)queryHelperNeedsRestart:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setHasChangesWhilePaused:(BOOL)a3;
- (void)setHasEverReconciledJournal:(BOOL)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsPreparingFirstBatch:(BOOL)a3;
- (void)setMessageQueryHelper:(id)a3;
- (void)tearDown;
- (void)test_tearDown;
@end

@implementation EDInMemoryThreadQueryHandler

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EDInMemoryThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_38 != -1) {
    dispatch_once(&log_onceToken_38, block);
  }
  v2 = (void *)log_log_38;

  return (OS_os_log *)v2;
}

void __35__EDInMemoryThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_38;
  log_log_38 = (uint64_t)v1;
}

- (EDInMemoryThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11 helperObserver:(id)a12
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  obj = (id *)a7;
  id v73 = a7;
  id v74 = a8;
  id v21 = a9;
  id v22 = a10;
  id v78 = a11;
  v76 = v22;
  id v77 = a12;
  v83.receiver = self;
  v83.super_class = (Class)EDInMemoryThreadQueryHandler;
  v71 = v19;
  v72 = v20;
  v75 = v21;
  v23 = [(EDMessageRepositoryQueryHandler *)&v83 initWithQuery:v17 messagePersistence:v18 hookRegistry:v19 remindMeNotificationController:v20 observer:v21 observationIdentifier:v22];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_vipManager, a7);
    objc_storeStrong((id *)&v24->_searchProvider, a8);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    changesWhilePaused = v24->_changesWhilePaused;
    v24->_changesWhilePaused = v25;

    v27 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
    v88[0] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
    messageSortDescriptors = v24->_messageSortDescriptors;
    v24->_messageSortDescriptors = (NSArray *)v28;

    v30 = [[EDUpdateThrottler alloc] initWithName:@"In-memory threads" delayInterval:v78 resumable:0.0];
    updateThrottler = v24->_updateThrottler;
    v24->_updateThrottler = v30;

    v32 = (EMThreadReloadSummaryHelper *)objc_alloc_init(MEMORY[0x1E4F604E8]);
    reloadSummaryHelper = v24->_reloadSummaryHelper;
    v24->_reloadSummaryHelper = v32;

    v34 = (void *)MEMORY[0x1E4F60F28];
    v35 = [NSString stringWithFormat:@"com.apple.email.%@.%p", objc_opt_class(), v24];
    uint64_t v36 = [v34 serialDispatchQueueSchedulerWithName:v35 qualityOfService:25];
    scheduler = v24->_scheduler;
    v24->_scheduler = (EFAssertableScheduler *)v36;

    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v39 = dispatch_queue_create("com.apple.mail.EDInMemoryThreadQueryHandler.contentProtection", v38);
    contentProtectionQueue = v24->_contentProtectionQueue;
    v24->_contentProtectionQueue = (OS_dispatch_queue *)v39;

    dispatch_queue_set_specific((dispatch_queue_t)v24->_contentProtectionQueue, &kContentProtectionQueueKey, v24, 0);
    v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.mail.EDInMemoryThreadQueryHandler.result", v41);
    resultQueue = v24->_resultQueue;
    v24->_resultQueue = (OS_dispatch_queue *)v42;

    v44 = (void *)MEMORY[0x1E4F60390];
    v45 = [v17 predicate];
    v46 = [v18 mailboxPersistence];
    uint64_t v47 = [v44 mailboxScopeForPredicate:v45 withMailboxTypeResolver:v46];
    mailboxScope = v24->_mailboxScope;
    v24->_mailboxScope = (EMMailboxScope *)v47;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v24);
    int v49 = _os_feature_enabled_impl();
    if (v49)
    {
      v50 = [_EDMessageQueryHelperDelegateImpl alloc];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __200__EDInMemoryThreadQueryHandler_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_vipManager_searchProvider_observer_observationIdentifier_observationResumer_helperObserver___block_invoke;
      v80[3] = &unk_1E6C00E78;
      obj = &v81;
      objc_copyWeak(&v81, &location);
      v51 = [(_EDMessageQueryHelperDelegateImpl *)v50 initWithMessageQueryHelperObserver:v77 didFindAllMessagesBlock:v80];
    }
    else
    {
      v51 = 0;
    }
    objc_storeStrong((id *)&v24->_messageQueryHelperDelegateImpl, v51);
    if (v49) {

    }
    id v52 = objc_alloc(MEMORY[0x1E4F60240]);
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    uint64_t v55 = [v52 initWithTitle:v54 delegate:v24];
    stateCapturer = v24->_stateCapturer;
    v24->_stateCapturer = (EMCollectionItemIDStateCapturer *)v55;

    id v57 = objc_alloc(MEMORY[0x1E4F602D8]);
    v58 = [(EDMessageRepositoryQueryHandler *)v24 query];
    v59 = [v18 mailboxPersistence];
    v60 = [(EDInMemoryThreadQueryHandler *)v24 scheduler];
    v61 = +[EDInMemoryThreadQueryHandler log];
    LOBYTE(v69) = 1;
    uint64_t v62 = [v57 initWithQuery:v58 mailboxTypeResolver:v59 dataSource:v24 delgate:v24 scheduler:v60 logClient:v61 limitedCache:v69];
    threadCollection = v24->_threadCollection;
    v24->_threadCollection = (EMInMemoryThreadCollection *)v62;

    v64 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v24->_threadCollection;
      *(_DWORD *)buf = 134218240;
      v85 = v24;
      __int16 v86 = 2048;
      v87 = v65;
      _os_log_impl(&dword_1DB39C000, v64, OS_LOG_TYPE_DEFAULT, "%p: Created EMInMemoryThreadCollection (%p)", buf, 0x16u);
    }

    v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v66 addObserver:v24 selector:sel__blockedSendersDidChange_ name:*MEMORY[0x1E4F5FC78] object:0];
    v67 = [(EDInMemoryThreadQueryHandler *)v24 vipManager];
    [v66 addObserver:v24 selector:sel__vipsDidChange_ name:*MEMORY[0x1E4F601C8] object:v67];

    if (v49) {
      objc_destroyWeak(obj);
    }
    objc_destroyWeak(&location);
  }

  return v24;
}

void __200__EDInMemoryThreadQueryHandler_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_vipManager_searchProvider_observer_observationIdentifier_observationResumer_helperObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained setIsInitialized:1];
    [WeakRetained setHasEverReconciledJournal:1];
  }
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDInMemoryThreadQueryHandler.m", 113, @"%s can only be called from unit tests", "-[EDInMemoryThreadQueryHandler test_tearDown]");
  }
  [(EDInMemoryThreadQueryHandler *)self tearDown];
  id v4 = [(EDInMemoryThreadQueryHandler *)self scheduler];
  [v4 performSyncBlock:&__block_literal_global_25];
}

- (void)tearDown
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EDInMemoryThreadQueryHandler *)self cancel];
  id v4 = [(EDInMemoryThreadQueryHandler *)self scheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__EDInMemoryThreadQueryHandler_tearDown__block_invoke;
  v6[3] = &unk_1E6BFF2F0;
  v6[4] = self;
  [v4 performBlock:v6];

  v5.receiver = self;
  v5.super_class = (Class)EDInMemoryThreadQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v5 tearDown];
}

- (BOOL)start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)EDInMemoryThreadQueryHandler;
  BOOL v3 = [(EDMessageRepositoryQueryHandler *)&v15 start];
  id v4 = +[EDInMemoryThreadQueryHandler log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218242;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Starting with query '%@'", buf, 0x16u);
    }
    v7 = (void *)MEMORY[0x1E4F60E10];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"EDInMemoryThreadQueryHandler<%p> transaction", self);
    v9 = [v7 transactionWithDescription:v8];
    processTransaction = self->_processTransaction;
    self->_processTransaction = v9;

    v11 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__EDInMemoryThreadQueryHandler_start__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_async(v11, block);

    v12 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
    EFRegisterContentProtectionObserver();
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      id v17 = self;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
    }
  }
  return v3;
}

uint64_t __37__EDInMemoryThreadQueryHandler_start__block_invoke(uint64_t a1)
{
  uint64_t result = EFProtectedDataAvailable();
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _createHelper];
  }
  return result;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)EDInMemoryThreadQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v6 cancel];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__EDInMemoryThreadQueryHandler_cancel__block_invoke;
  aBlock[3] = &unk_1E6BFF2F0;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(&kContentProtectionQueueKey))
  {
    v3[2](v3);
  }
  else
  {
    id v4 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
    dispatch_sync(v4, v3);
  }
  [(EFProcessTransaction *)self->_processTransaction invalidate];
}

void __38__EDInMemoryThreadQueryHandler_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidCancel:1];
  id v2 = [*(id *)(a1 + 32) messageQueryHelper];
  [v2 cancel];
}

- (EMMessageListItemQueryResultsObserver)resultsObserverIfNotPaused
{
  if ([(EDInMemoryThreadQueryHandler *)self isPaused])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(EDMessageRepositoryQueryHandler *)self resultsObserver];
  }

  return (EMMessageListItemQueryResultsObserver *)v3;
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EDInMemoryThreadQueryHandler *)self cancel];
  v4.receiver = self;
  v4.super_class = (Class)EDInMemoryThreadQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v4 dealloc];
}

- (void)prepareToSendUpdatesInCollection:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(EDInMemoryThreadQueryHandler *)self isInitialized]
    && ![(EDInMemoryThreadQueryHandler *)self isPaused])
  {
    double v8 = 0.0;
    objc_super v4 = [(EDInMemoryThreadQueryHandler *)self updateThrottler];
    unint64_t v5 = [v4 unacknowledgedUpdatesCountAndTimeSinceLastAcknowledgement:&v8];

    objc_super v6 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = v5;
      __int16 v13 = 2048;
      double v14 = v8;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "%p: Preparing to update, %llu unacknowledged updates, %f since last acknowledgement", buf, 0x20u);
    }

    if (v5 > 9 || v8 >= 2.0)
    {
      v7 = +[EDInMemoryThreadQueryHandler log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v10 = self;
        __int16 v11 = 2048;
        unint64_t v12 = v5;
        __int16 v13 = 2048;
        double v14 = v8;
        _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%p: Pausing updates, %llu unacknowledged updates, %f since last acknowledgement", buf, 0x20u);
      }

      [(EDInMemoryThreadQueryHandler *)self setIsPaused:1];
    }
  }
}

- (void)didSendUpdatesInCollection:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(EDInMemoryThreadQueryHandler *)self isPaused])
  {
    [(EDInMemoryThreadQueryHandler *)self setHasChangesWhilePaused:1];
    unint64_t v5 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = self;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Skipping change while paused", buf, 0xCu);
    }
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_super v6 = [(EDInMemoryThreadQueryHandler *)self updateThrottler];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke;
    v19[3] = &unk_1E6C01468;
    objc_copyWeak(&v20, &location);
    v7 = [v6 updateWithBlock:v19 unacknowledgedUpdatesCount:0];

    if (!v7)
    {
      __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"EDInMemoryThreadQueryHandler.m" lineNumber:245 description:@"Unable to get acknowledgement token for in-memory thread query handler"];
    }
    double v8 = [v7 label];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_48;
    v16[3] = &unk_1E6BFFA50;
    __int16 v18 = self;
    id v9 = v8;
    id v17 = v9;
    [v7 addInvocationBlock:v16];
    v10 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Sending update %{public}@", buf, 0x16u);
    }

    __int16 v11 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_49;
    v14[3] = &unk_1E6BFFAF0;
    v14[4] = self;
    id v15 = v7;
    id v12 = v7;
    dispatch_sync(v11, v14);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && ([WeakRetained isPaused] & 1) != 0)
  {
    BOOL v3 = [v2 scheduler];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_2;
    v4[3] = &unk_1E6BFF2F0;
    v4[4] = v2;
    [v3 performBlock:v4];
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isPaused])
  {
    [*(id *)(a1 + 32) setIsPaused:0];
    int v2 = [*(id *)(a1 + 32) hasChangesWhilePaused];
    BOOL v3 = +[EDInMemoryThreadQueryHandler log];
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 134217984;
        uint64_t v8 = v5;
        _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Refreshing after unpause", (uint8_t *)&v7, 0xCu);
      }

      [*(id *)(a1 + 32) setHasChangesWhilePaused:0];
      [*(id *)(a1 + 32) _refreshObserver];
    }
    else
    {
      if (v4)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = 134217984;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Unpausing without changes", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_48(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = +[EDInMemoryThreadQueryHandler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "%p: Acknowledged update %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_49(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  int v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 wasUpdated:*(void *)(a1 + 40)];
}

- (void)_refreshObserver
{
  id v3 = [(EDMessageRepositoryQueryHandler *)self resultsObserver];
  uint64_t v4 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
  int v5 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke;
  block[3] = &unk_1E6BFF7A8;
  id v6 = v3;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  __int16 v11 = self;
  dispatch_sync(v5, block);

  [(EMInMemoryThreadCollection *)self->_threadCollection notifyObserverOfOldestThreadsByMailboxObjectIDs];
}

void __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) observerWillRestart:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(v2 + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke_2;
  v7[3] = &unk_1E6C01490;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v3 enumerateObjectIDsInBatchesOfSize:5000 block:v7];
  [*(id *)(a1 + 32) observerDidFinishInitialLoad:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)[*(id *)(*(void *)(a1 + 48) + 96) copy];
  [v4 observer:v5 matchedChangesForObjectIDs:v6];

  [*(id *)(*(void *)(a1 + 48) + 96) removeAllObjects];
}

void __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = +[EDInMemoryThreadQueryHandler log];
  uint64_t v5 = [v3 _distinctObjectIDs:v7 queryHandlerLog:v4];

  id v6 = [*(id *)(a1 + 32) _extraInfoForThreadObjectIDs:v5 isMove:0];
  [*(id *)(a1 + 40) observer:*(void *)(a1 + 48) matchedAddedObjectIDs:v5 before:0 extraInfo:v6];
}

- (void)_restartHelper
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = EFProtectedDataAvailable();
  uint64_t v5 = +[EDInMemoryThreadQueryHandler log];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = [(EDInMemoryThreadQueryHandler *)self messageQueryHelper];
      int v8 = 134218240;
      id v9 = self;
      __int16 v10 = 2048;
      __int16 v11 = v7;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "%p: (Re-)starting the helper (old = %p).", (uint8_t *)&v8, 0x16u);
    }
    [(EDInMemoryThreadQueryHandler *)self _createHelper];
  }
  else
  {
    if (v6)
    {
      int v8 = 134217984;
      id v9 = self;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "%p: Delaying restart of helper because device is locked.", (uint8_t *)&v8, 0xCu);
    }

    [(EDInMemoryThreadQueryHandler *)self setIsInitialized:0];
  }
}

- (id)queryHelperDelegate
{
  if (self->_messageQueryHelperDelegateImpl) {
    self = (EDInMemoryThreadQueryHandler *)self->_messageQueryHelperDelegateImpl;
  }
  return self;
}

- (void)_createHelper
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "%p: Created helper %p", buf, 0x16u);
}

void __45__EDInMemoryThreadQueryHandler__createHelper__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained observerWillRestart:*(void *)(a1 + 32)];
}

- (BOOL)_queryHelperIsCurrent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EDInMemoryThreadQueryHandler__queryHelperIsCurrent___block_invoke;
  block[3] = &unk_1E6C00A40;
  __int16 v10 = self;
  __int16 v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __54__EDInMemoryThreadQueryHandler__queryHelperIsCurrent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) messageQueryHelper];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 == v3;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3) {
      [(EDInMemoryThreadQueryHandler *)self _contentProtectionChangedToUnlocked];
    }
  }
  else
  {
    [(EDInMemoryThreadQueryHandler *)self _contentProtectionChangedToLocked];
  }
}

- (void)_contentProtectionChangedToLocked
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDInMemoryThreadQueryHandler log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Content Protection => Locked", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v4);

  if (![(EDInMemoryThreadQueryHandler *)self isInitialized])
  {
    uint64_t v5 = [(EDInMemoryThreadQueryHandler *)self messageQueryHelper];
    [(EDInMemoryThreadQueryHandler *)self setMessageQueryHelper:0];
    [v5 cancel];
  }
}

- (void)_contentProtectionChangedToUnlocked
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDInMemoryThreadQueryHandler log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Content Protection => Unlocked", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v4);

  if (![(EDInMemoryThreadQueryHandler *)self didCancel]
    && ![(EDInMemoryThreadQueryHandler *)self isInitialized])
  {
    [(EDInMemoryThreadQueryHandler *)self _restartHelper];
  }
}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  id v4 = [(EMInMemoryThreadCollection *)self->_threadCollection messageListItemForObjectID:a3 error:a4];

  return v4;
}

- (id)threadsAndMessagesForObjectIDs:(id)a3
{
  id v3 = [(EMInMemoryThreadCollection *)self->_threadCollection threadsAndMessagesForObjectIDs:a3];

  return v3;
}

- (id)messagesForThread:(id)a3
{
  id v3 = [(EMInMemoryThreadCollection *)self->_threadCollection messagesForThread:a3];

  return v3;
}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(EDInMemoryThreadQueryHandler *)self messageQueryHelper];
  uint64_t v8 = [(EDInMemoryThreadQueryHandler *)self _predicateForMessagesInConversations:v6];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  __int16 v10 = [v7 messagesWithAdditionalPredicates:v9 limit:a4];

  return v10;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v7])
  {
    id v9 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      __int16 v11 = self;
      __int16 v12 = 1024;
      int v13 = [v8 count];
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Found %u messages.", (uint8_t *)&v10, 0x12u);
    }

    [(EMInMemoryThreadCollection *)self->_threadCollection messagesWereAdded:v8];
  }
}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    int v5 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = self;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load.", buf, 0xCu);
    }

    [(EDInMemoryThreadQueryHandler *)self setIsInitialized:1];
    [(EDInMemoryThreadQueryHandler *)self setHasEverReconciledJournal:1];
    id v6 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__EDInMemoryThreadQueryHandler_queryHelperDidFindAllMessages___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_sync(v6, block);

    [(EMInMemoryThreadCollection *)self->_threadCollection initializeOldestThreadsByMailbox];
    [(EMInMemoryThreadCollection *)self->_threadCollection clearInMemoryThreadCache];
  }
}

void __62__EDInMemoryThreadQueryHandler_queryHelperDidFindAllMessages___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  uint64_t v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observerDidFinishInitialLoad:v2];
}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v6])
  {
    id v8 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = self;
      __int16 v11 = 1024;
      int v12 = [v7 count];
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Added %u messages", (uint8_t *)&v9, 0x12u);
    }

    [(EMInMemoryThreadCollection *)self->_threadCollection messagesWereAdded:v7];
  }
}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    if ((unint64_t)[v7 count] < 0xB)
    {
      int v9 = objc_msgSend(v7, "ef_mapSelector:", sel_flagDescription);
    }
    else
    {
      id v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 10);
      int v9 = objc_msgSend(v8, "ef_mapSelector:", sel_flagDescription);
    }
    uint64_t v10 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v16 = self;
      __int16 v17 = 1024;
      int v18 = [v7 count];
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Flags changed for %u messages: %{public}@", buf, 0x1Cu);
    }

    threadCollection = self->_threadCollection;
    uint64_t v12 = *MEMORY[0x1E4F5FE98];
    v14[0] = *MEMORY[0x1E4F5FE50];
    v14[1] = v12;
    v14[2] = *MEMORY[0x1E4F5FE48];
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [(EMInMemoryThreadCollection *)threadCollection messagesWereChanged:v7 forKeyPaths:v13 deleted:0];
  }
}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v8])
  {
    __int16 v11 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218498;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v10;
      __int16 v16 = 1024;
      int v17 = [v9 count];
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Key paths %{public}@ changed for %u messages", (uint8_t *)&v12, 0x1Cu);
    }

    [(EMInMemoryThreadCollection *)self->_threadCollection messagesWereChanged:v9 forKeyPaths:v10 deleted:0];
  }
}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v10])
  {
    uint64_t v13 = [v11 itemID];
    __int16 v14 = [v12 collectionItemID];
    int v15 = [v13 isEqual:v14];

    if (v15)
    {
      __int16 v16 = +[EDInMemoryThreadQueryHandler log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = [v11 itemID];
        LODWORD(__b[0]) = 134218754;
        *(void *)((char *)__b + 4) = self;
        WORD2(__b[1]) = 2112;
        *(void *)((char *)&__b[1] + 6) = v17;
        HIWORD(__b[2]) = 2112;
        __b[3] = v11;
        LOWORD(__b[4]) = 2112;
        *(void *)((char *)&__b[4] + 2) = v12;
        _os_log_debug_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", (uint8_t *)__b, 0x2Au);
      }
      memset(__b, 170, sizeof(__b));
      LODWORD(__b[4]) = 0;
      *(void *)id v20 = 0xE00000001;
      int v21 = 1;
      pid_t v22 = getpid();
      size_t v18 = 648;
      if (!sysctl(v20, 4u, __b, &v18, 0, 0) && (__b[4] & 0x800) != 0)
      {
        __debugbreak();
        JUMPOUT(0x1DB435558);
      }
    }
    else
    {
      [(EMInMemoryThreadCollection *)self->_threadCollection objectIDDidChangeForMessage:v11 oldObjectID:v12 oldConversationID:a6];
    }
  }
}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v6])
  {
    id v8 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      id v10 = self;
      __int16 v11 = 1024;
      int v12 = [v7 count];
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Deleted %u messages", (uint8_t *)&v9, 0x12u);
    }

    [(EMInMemoryThreadCollection *)self->_threadCollection messagesWereChanged:v7 forKeyPaths:0 deleted:1];
  }
}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v8])
  {
    id v10 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218496;
      int v12 = self;
      __int16 v13 = 2048;
      int64_t v14 = a5;
      __int16 v15 = 1024;
      int v16 = [v9 count];
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p: ConversationIDs changed from %lld for %u messages", (uint8_t *)&v11, 0x1Cu);
    }

    [(EMInMemoryThreadCollection *)self->_threadCollection conversationIDDidChangeForMessages:v9 fromConversationID:a5];
  }
}

- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v8])
  {
    id v10 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      __int16 v15 = self;
      __int16 v16 = 2048;
      int64_t v17 = a5;
      __int16 v18 = 1024;
      int v19 = [v9 count];
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p: BusinessIDs changed from %lld for %u messages", buf, 0x1Cu);
    }

    threadCollection = self->_threadCollection;
    uint64_t v13 = *MEMORY[0x1E4F5FDE8];
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [(EMInMemoryThreadCollection *)threadCollection messagesWereChanged:v9 forKeyPaths:v12 deleted:0];
  }
}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  id v8 = a3;
  if (a5)
  {
    if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v8]) {
      [(EMInMemoryThreadCollection *)self->_threadCollection conversationNotificationLevelDidChangeForConversation:a4 conversationID:a5];
    }
  }
  else
  {
    id v9 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EDInMemoryThreadQueryHandler queryHelper:conversationNotificationLevelDidChangeForConversation:conversationID:]((uint64_t)self, v9);
    }
  }
}

- (void)_vipsDidChange:(id)a3
{
}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    int v5 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = self;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Helper did finish remote search.", buf, 0xCu);
    }

    id v6 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__EDInMemoryThreadQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_sync(v6, block);
  }
}

void __65__EDInMemoryThreadQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  uint64_t v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observerDidFinishRemoteSearch:v2];
}

- (void)queryHelperNeedsRestart:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EDInMemoryThreadQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    int v5 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = self;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Helper needs restart.", buf, 0xCu);
    }

    id v6 = [(EDInMemoryThreadQueryHandler *)self contentProtectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__EDInMemoryThreadQueryHandler_queryHelperNeedsRestart___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

uint64_t __56__EDInMemoryThreadQueryHandler_queryHelperNeedsRestart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartHelper];
}

- (id)mailboxesInCollection:(id)a3
{
  id v3 = [(EDMessageRepositoryQueryHandler *)self mailboxes];

  return v3;
}

- (id)_predicateForMessagesInConversations:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  int v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FE18]];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:10 options:0];

  return v7;
}

- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5
{
  int v5 = [(EDInMemoryThreadQueryHandler *)self messagesInConversationIDs:a4 limit:a5];

  return v5;
}

- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__EDInMemoryThreadQueryHandler_collection_notifyOfOldestThreadsByMailboxObjectIDs___block_invoke;
  v8[3] = &unk_1E6BFFAF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __83__EDInMemoryThreadQueryHandler_collection_notifyOfOldestThreadsByMailboxObjectIDs___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserverIfNotPaused];
  uint64_t v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedOldestItemsUpdatedForMailboxes:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__EDInMemoryThreadQueryHandler_collection_notifyReplacedExistingObjectID_newObjectID___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);
}

void __86__EDInMemoryThreadQueryHandler_collection_notifyReplacedExistingObjectID_newObjectID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserverIfNotPaused];
  uint64_t v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 replacedExistingObjectID:*(void *)(a1 + 40) withNewObjectID:*(void *)(a1 + 48)];
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4
{
  return [(EDInMemoryThreadQueryHandler *)self collection:a3 reportChanges:a4 reloadSummaries:1];
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [v7 count];
  if (v8)
  {
    if (v5)
    {
      id v9 = [(EDInMemoryThreadQueryHandler *)self reloadSummaryHelper];
      id v10 = [(EDInMemoryThreadQueryHandler *)self mailboxScope];
      id v11 = [v9 summariesToReloadForChanges:v7 mailboxScope:v10];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v12);
            }
            [(EDMessageRepositoryQueryHandler *)self requestSummaryForMessageObjectID:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }
    }
    __int16 v16 = [v7 allKeys];
    [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Changing objectIDs" objectIDs:v16];

    int64_t v17 = [(EDInMemoryThreadQueryHandler *)self resultsObserverIfNotPaused];
    if (v17)
    {
      __int16 v18 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke;
      block[3] = &unk_1E6BFF7A8;
      id v22 = v17;
      uint64_t v23 = self;
      id v24 = v7;
      dispatch_sync(v18, block);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      int v20[2] = __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke_2;
      v20[3] = &unk_1E6C014B8;
      v20[4] = self;
      [v7 enumerateKeysAndObjectsUsingBlock:v20];
    }
  }
  return v8 != 0;
}

void __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) observationIdentifier];
  objc_msgSend(v1, "observer:matchedChangesForObjectIDs:");
}

void __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v8];
  id v7 = v6;
  if (v6) {
    [v6 addChange:v5];
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:v5 forKeyedSubscript:v8];
  }
}

- (BOOL)collection:(id)a3 reportDeletes:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v7 = [v5 array];
    id v8 = objc_msgSend(v7, "ef_map:", &__block_literal_global_62);

    [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Deleting objectIDs" objectIDs:v8];
    id v9 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke_2;
    __int16 v15 = &unk_1E6BFFAF0;
    __int16 v16 = self;
    id v10 = v8;
    id v17 = v10;
    dispatch_sync(v9, &v12);

    -[EMInMemoryThreadCollection removeThreadProxies:forMove:](self->_threadCollection, "removeThreadProxies:forMove:", v5, 0, v12, v13, v14, v15, v16);
  }

  return v6 != 0;
}

id __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectID];

  return v2;
}

void __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserverIfNotPaused];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedDeletedObjectIDs:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7
{
  BOOL v9 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(EDInMemoryThreadQueryHandler *)self resultsObserverIfNotPaused];
  if (v9)
  {
    if (v12) {
      [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsChangesWithMessage:@"Moving objectIDs" newObjectIDs:v11 beforeExistingObjectID:v12];
    }
    else {
      [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Moving objectIDs to end of list:" objectIDs:v11];
    }
    uint64_t v14 = [(EDInMemoryThreadQueryHandler *)self _extraInfoForThreadObjectIDs:v11 isMove:1];
    __int16 v15 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke;
    block[3] = &unk_1E6C01500;
    id v27 = v13;
    long long v28 = self;
    id v29 = v11;
    id v30 = v12;
    id v31 = v14;
    v32 = a7;
    id v16 = v12;
    id v17 = v13;
    id v18 = v11;
    id v19 = v14;
    dispatch_sync(v15, block);
  }
  else
  {
    if (v12) {
      [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsChangesWithMessage:@"Adding objectIDs" newObjectIDs:v11 beforeExistingObjectID:v12];
    }
    else {
      [(EDInMemoryThreadQueryHandler *)self logThreadObjectIDsWithMessage:@"Adding objectIDs to end of list" objectIDs:v11];
    }
    uint64_t v20 = [(EDInMemoryThreadQueryHandler *)self resultQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke_2;
    v21[3] = &unk_1E6C00A90;
    v21[4] = self;
    id v22 = v11;
    id v23 = v13;
    id v24 = v12;
    long long v25 = a7;
    id v17 = v12;
    id v18 = v13;
    id v19 = v11;
    dispatch_sync(v20, v21);
  }
}

void __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) observationIdentifier];
  [v2 observer:v3 matchedMovedObjectIDs:*(void *)(a1 + 48) before:*(void *)(a1 + 56) extraInfo:*(void *)(a1 + 64)];

  **(unsigned char **)(a1 + 72) = 1;
}

void __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[EDInMemoryThreadQueryHandler log];
  id v14 = [v2 _distinctObjectIDs:v3 queryHandlerLog:v4];

  id v5 = [*(id *)(a1 + 32) _extraInfoForThreadObjectIDs:v14 isMove:0];
  if ([*(id *)(a1 + 32) isPreparingFirstBatch])
  {
    uint64_t v6 = [*(id *)(a1 + 32) query];
    id v7 = [v6 targetClassOptions];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5FF88]];

    if (v8)
    {
      BOOL v9 = [*(id *)(a1 + 32) _extaInfoPrecachedThreadsForInitialObjectIDs:v14];
      if (v9)
      {
        id v10 = (void *)[v5 mutableCopy];
        [v10 addEntriesFromDictionary:v9];
        uint64_t v11 = [v10 copy];

        id v5 = (void *)v11;
      }
    }
  }
  [*(id *)(a1 + 32) setIsPreparingFirstBatch:0];
  id v12 = *(void **)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 32) observationIdentifier];
  [v12 observer:v13 matchedAddedObjectIDs:v14 before:*(void *)(a1 + 56) extraInfo:v5];

  **(unsigned char **)(a1 + 64) = 1;
}

- (id)_extaInfoPrecachedThreadsForInitialObjectIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v6 = [v5 targetClassOptions];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F5FF88]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  BOOL v9 = objc_msgSend(v4, "ef_prefix:", v8);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__12;
  int v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__EDInMemoryThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke;
  v16[3] = &unk_1E6C01528;
  void v16[4] = self;
  v16[5] = &v17;
  id v10 = objc_msgSend(v9, "ef_compactMap:", v16);
  uint64_t v11 = [v10 count];
  if (v11 == [v9 count] && !v18[5])
  {
    uint64_t v23 = *MEMORY[0x1E4F5FDA8];
    id v24 = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    id v12 = +[EDInMemoryThreadQueryHandler log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend((id)v18[5], "ef_publicDescription");
      -[EDInMemoryThreadQueryHandler _extaInfoPrecachedThreadsForInitialObjectIDs:]((uint64_t)self, v13, buf, v12);
    }

    id v14 = 0;
  }

  _Block_object_dispose(&v17, 8);

  return v14;
}

id __77__EDInMemoryThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id obj = 0;
    id v7 = [v8 messageListItemForObjectID:v3 error:&obj];
    objc_storeStrong(v5, obj);
  }

  return v7;
}

- (id)_messageQueryFromThreadsQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 predicate];
  id v7 = [v3 sortDescriptors];
  uint64_t v8 = [v3 suggestion];
  uint64_t v9 = [v3 limit];
  uint64_t v10 = [v3 queryOptions];
  uint64_t v11 = [v3 targetClassOptions];
  id v12 = [v3 label];
  uint64_t v13 = (void *)[v4 initWithTargetClass:v5 predicate:v6 sortDescriptors:v7 suggestion:v8 limit:v9 queryOptions:v10 targetClassOptions:v11 label:v12];

  return v13;
}

- (id)_extraInfoForThreadObjectIDs:(id)a3 isMove:(BOOL)a4
{
  uint64_t v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__EDInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke;
  v16[3] = &unk_1E6C01550;
  void v16[4] = self;
  uint64_t v8 = objc_msgSend(v7, "ef_groupBy:", v16);
  uint64_t v9 = objc_msgSend(v8, "ef_mapValues:", &__block_literal_global_85);

  if (![v9 count])
  {
    id v12 = 0;
    goto LABEL_14;
  }
  if (v4)
  {
    uint64_t v10 = [v9 count];
    if (v10 == 1)
    {
      uint64_t v4 = [v9 allValues];
      uint64_t v8 = [(id)v4 firstObject];
      uint64_t v11 = [v8 count];
      if (v11 == [v7 count])
      {

LABEL_12:
        goto LABEL_13;
      }
    }
    uint64_t v13 = [v9 count];
    if (v10 == 1)
    {
      BOOL v14 = v13 == 0;

      if (v14) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    if (v13)
    {
LABEL_11:
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [(id)v4 handleFailureInMethod:a2 object:self file:@"EDInMemoryThreadQueryHandler.m" lineNumber:692 description:@"We don't allow moving multiple items to different sections"];
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v17 = *MEMORY[0x1E4F5FDB8];
  v18[0] = v9;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
LABEL_14:

  return v12;
}

id __68__EDInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) sectionIdentifierForThreadObjectID:a2];

  return v2;
}

id __68__EDInMemoryThreadQueryHandler__extraInfoForThreadObjectIDs_isMove___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ef_mapSelector:", sel_collectionItemID);

  return v2;
}

- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] >= 0xB)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 10);

    id v7 = (id)v8;
  }
  uint64_t v9 = +[EDInMemoryThreadQueryHandler log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218754;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = [v7 count];
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu : %{public}@ ", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v9 count] >= 0xB)
  {
    uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", 0, 10);

    id v9 = (id)v11;
  }
  __int16 v12 = +[EDInMemoryThreadQueryHandler log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134219010;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = [v9 count];
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu before existing: %{public}@ : %{public}@", (uint8_t *)&v13, 0x34u);
  }
}

- (id)labelForStateCapture
{
  id v2 = [(EDMessageRepositoryQueryHandler *)self query];
  id v3 = [v2 label];

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)[(EMInMemoryThreadCollection *)self->_threadCollection itemIDs];
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDMessageQueryHelper)messageQueryHelper
{
  return self->_messageQueryHelper;
}

- (void)setMessageQueryHelper:(id)a3
{
}

- (_EDMessageQueryHelperDelegateImpl)messageQueryHelperDelegateImpl
{
  return self->_messageQueryHelperDelegateImpl;
}

- (NSArray)messageSortDescriptors
{
  return self->_messageSortDescriptors;
}

- (EDUpdateThrottler)updateThrottler
{
  return self->_updateThrottler;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
}

- (EFAssertableScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (BOOL)isPreparingFirstBatch
{
  return self->_isPreparingFirstBatch;
}

- (void)setIsPreparingFirstBatch:(BOOL)a3
{
  self->_isPreparingFirstBatch = a3;
}

- (BOOL)hasEverReconciledJournal
{
  return self->_hasEverReconciledJournal;
}

- (void)setHasEverReconciledJournal:(BOOL)a3
{
  self->_hasEverReconciledJournal = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (BOOL)hasChangesWhilePaused
{
  return self->_hasChangesWhilePaused;
}

- (void)setHasChangesWhilePaused:(BOOL)a3
{
  self->_hasChangesWhilePaused = a3;
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
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_messageSortDescriptors, 0);
  objc_storeStrong((id *)&self->_messageQueryHelperDelegateImpl, 0);
  objc_storeStrong((id *)&self->_messageQueryHelper, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_processTransaction, 0);
  objc_storeStrong((id *)&self->_changesWhilePaused, 0);

  objc_storeStrong((id *)&self->_threadCollection, 0);
}

- (void)queryHelper:(uint64_t)a1 conversationNotificationLevelDidChangeForConversation:(NSObject *)a2 conversationID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "%p: Received invalid converationID:%lld", (uint8_t *)&v2, 0x16u);
}

- (void)_extaInfoPrecachedThreadsForInitialObjectIDs:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "%p: Failed to prefetch threads with error:%{public}@", buf, 0x16u);
}

@end