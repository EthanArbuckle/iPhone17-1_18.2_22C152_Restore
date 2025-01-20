@interface EDMessageQueryHandler
+ (OS_os_log)log;
+ (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 messageSource:(id)a4;
- (BOOL)_queryHelperIsCurrent:(id)a3;
- (BOOL)didCancel;
- (BOOL)didFindRequestedItemForInitialBatch;
- (BOOL)hasEverReconciledJournal;
- (BOOL)hasUrgentPredicate;
- (BOOL)isInitialized;
- (BOOL)start;
- (EDMessageQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 observer:(id)a8 observationIdentifier:(id)a9;
- (EDMessageQueryHelper)currentQueryHelper;
- (EDSearchProvider)searchProvider;
- (EFScheduler)scheduler;
- (EMCollectionItemIDStateCapturer)stateCapturer;
- (NSMutableDictionary)oldestMessageIDsByMailboxObjectIDs;
- (OS_dispatch_queue)contentProtectionQueue;
- (OS_dispatch_queue)resultQueue;
- (id)_createChangesForMessagesWithConversationID:(int64_t)a3 block:(id)a4;
- (id)_extraInfoForMessages:(id)a3 messagesToPrecache:(id)a4 outObjectIDs:(id *)a5;
- (id)_messagesBeforeMessageWithObjectID:(id)a3 fromMessagesFromQueryHelper:(id)a4 afterRequestedMessage:(id *)a5;
- (id)_messagesForInitialBatchWithMessagesFromQueryHelper:(id)a3 requestedMessage:(id *)a4;
- (id)_objectIDsAndUnreadObjectIDsFromMessages:(id)a3 unreadObjectIDs:(id *)a4;
- (id)_oldestItemQueryForMailbox:(id)a3;
- (id)_requestedItemObjectID;
- (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 helper:(id)a4;
- (id)itemIDsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (void)_contentProtectionChangedToLocked;
- (void)_contentProtectionChangedToUnlocked;
- (void)_createHelper;
- (void)_initializeOldestMessagesByMailbox;
- (void)_oldestMessagesByMailboxObjectIDsWasUpdated;
- (void)_oldestMessagesNeedUpdate;
- (void)_reportFoundMessages:(id)a3 before:(id)a4 messagesToPrecache:(id)a5;
- (void)_restartHelper;
- (void)_updateOldestMessagesForMailboxes:(id)a3 cancelationToken:(id)a4;
- (void)cancel;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
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
- (void)setCurrentQueryHelper:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setDidFindRequestedItemForInitialBatch:(BOOL)a3;
- (void)setHasEverReconciledJournal:(BOOL)a3;
- (void)setHasUrgentPredicate:(BOOL)a3;
- (void)setIsInitialized:(BOOL)a3;
@end

@implementation EDMessageQueryHandler

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EDMessageQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_57 != -1) {
    dispatch_once(&log_onceToken_57, block);
  }
  v2 = (void *)log_log_57;

  return (OS_os_log *)v2;
}

void __28__EDMessageQueryHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_57;
  log_log_57 = (uint64_t)v1;
}

- (EDMessageQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 observer:(id)a8 observationIdentifier:(id)a9
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v47 = a7;
  id v19 = a8;
  id v20 = a9;
  v48.receiver = self;
  v48.super_class = (Class)EDMessageQueryHandler;
  v46 = v15;
  v21 = [(EDMessageRepositoryQueryHandler *)&v48 initWithQuery:v15 messagePersistence:v16 hookRegistry:v17 remindMeNotificationController:v18 observer:v19 observationIdentifier:v20];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_searchProvider, a7);
    v23 = (void *)MEMORY[0x1E4F60F28];
    v24 = [NSString stringWithFormat:@"com.apple.email.%@.%p", objc_opt_class(), v22];
    uint64_t v25 = [v23 serialDispatchQueueSchedulerWithName:v24 qualityOfService:25];
    scheduler = v22->_scheduler;
    v22->_scheduler = (EFScheduler *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.email.EDMessageQueryHandler.contentProtection", v27);
    contentProtectionQueue = v22->_contentProtectionQueue;
    v22->_contentProtectionQueue = (OS_dispatch_queue *)v28;

    dispatch_queue_set_specific((dispatch_queue_t)v22->_contentProtectionQueue, &kContentProtectionQueueKey_0, v22, 0);
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.email.EDMessageQueryHandler.result", v30);
    resultQueue = v22->_resultQueue;
    v22->_resultQueue = (OS_dispatch_queue *)v31;

    id v33 = objc_alloc(MEMORY[0x1E4F60240]);
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    uint64_t v36 = [v33 initWithTitle:v35 delegate:v22];
    stateCapturer = v22->_stateCapturer;
    v22->_stateCapturer = (EMCollectionItemIDStateCapturer *)v36;

    v38 = (void *)MEMORY[0x1E4F60390];
    v39 = [(EDMessageRepositoryQueryHandler *)v22 query];
    v40 = [v39 predicate];
    v41 = [v38 predicateFromPredicate:v40 ignoringKeyPaths:MEMORY[0x1E4F1CBF0]];

    v42 = (void *)MEMORY[0x1E4F60390];
    v49[0] = *MEMORY[0x1E4F5FE88];
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    v44 = [v42 predicateFromPredicate:v41 ignoringKeyPaths:v43];

    if (([v41 isEqual:v44] & 1) == 0) {
      v22->_hasUrgentPredicate = 1;
    }
  }
  return v22;
}

- (BOOL)start
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)EDMessageQueryHandler;
  BOOL v3 = [(EDMessageRepositoryQueryHandler *)&v12 start];
  v4 = +[EDMessageQueryHandler log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218242;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Starting with query '%@'", buf, 0x16u);
    }
    v11.receiver = self;
    v11.super_class = (Class)EDMessageQueryHandler;
    [(EDMessageRepositoryQueryHandler *)&v11 start];
    v7 = [(EDMessageQueryHandler *)self contentProtectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__EDMessageQueryHandler_start__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_async(v7, block);

    v8 = [(EDMessageQueryHandler *)self contentProtectionQueue];
    EFRegisterContentProtectionObserver();
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v14 = self;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
    }
  }
  return v3;
}

uint64_t __30__EDMessageQueryHandler_start__block_invoke(uint64_t a1)
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
  v7.receiver = self;
  v7.super_class = (Class)EDMessageQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v7 cancel];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__EDMessageQueryHandler_cancel__block_invoke;
  aBlock[3] = &unk_1E6BFF2F0;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  if (dispatch_get_specific(&kContentProtectionQueueKey_0))
  {
    v3[2](v3);
  }
  else
  {
    v4 = [(EDMessageQueryHandler *)self contentProtectionQueue];
    dispatch_sync(v4, v3);
  }
  BOOL v5 = EFAtomicObjectRelease();
  [v5 cancel];
}

void __31__EDMessageQueryHandler_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidCancel:1];
  id v2 = [*(id *)(a1 + 32) currentQueryHelper];
  [v2 cancel];
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDMessageQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v3 dealloc];
}

- (void)_restartHelper
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EDMessageQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[EDMessageQueryHandler log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(EDMessageQueryHandler *)self currentQueryHelper];
    int v6 = 134218240;
    objc_super v7 = self;
    __int16 v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "%p: (Re-)starting the helper (old = %p).", (uint8_t *)&v6, 0x16u);
  }
  [(EDMessageQueryHandler *)self _createHelper];
}

- (void)_createHelper
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EDMessageQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(EDMessageQueryHandler *)self currentQueryHelper];

  BOOL v5 = [EDMessageQueryHelper alloc];
  int v6 = [(EDMessageRepositoryQueryHandler *)self query];
  objc_super v7 = (void *)[v6 copy];
  __int16 v8 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
  v9 = [(EDMessageRepositoryQueryHandler *)self hookRegistry];
  uint64_t v10 = [(EDMessageQueryHandler *)self searchProvider];
  objc_super v11 = [(EDMessageQueryHandler *)self scheduler];
  objc_super v12 = [(EDMessageRepositoryQueryHandler *)self remindMeNotificationController];
  *(_WORD *)((char *)&v22 + 1) = 1;
  LOBYTE(v22) = ![(EDMessageQueryHandler *)self hasEverReconciledJournal];
  v13 = -[EDMessageQueryHelper initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:](v5, "initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:", v7, 100, 15000, v8, v9, v10, v11, v12, self, v22);
  [(EDMessageQueryHandler *)self setCurrentQueryHelper:v13];

  v14 = +[EDMessageQueryHandler log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = [(EDMessageQueryHandler *)self currentQueryHelper];
    [(EDInMemoryThreadQueryHandler *)(uint64_t)self _createHelper];
  }

  if (v4)
  {
    [(EDMessageQueryHandler *)self setDidFindRequestedItemForInitialBatch:0];
    [(EDMessageQueryHandler *)self setIsInitialized:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    id v16 = [(EDMessageRepositoryQueryHandler *)self resultsObserver];
    objc_initWeak(&location, v16);

    uint64_t v17 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    id v18 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__EDMessageQueryHandler__createHelper__block_invoke;
    block[3] = &unk_1E6BFF198;
    objc_copyWeak(&v25, &location);
    id v24 = v17;
    id v19 = v17;
    dispatch_async(v18, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  oldestMessageIDsByMailboxObjectIDs = self->_oldestMessageIDsByMailboxObjectIDs;
  self->_oldestMessageIDsByMailboxObjectIDs = 0;

  v21 = [(EDMessageQueryHandler *)self currentQueryHelper];
  [v21 start];
}

void __38__EDMessageQueryHandler__createHelper__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained observerWillRestart:*(void *)(a1 + 32)];
}

- (BOOL)_queryHelperIsCurrent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v5 = [(EDMessageQueryHandler *)self contentProtectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EDMessageQueryHandler__queryHelperIsCurrent___block_invoke;
  block[3] = &unk_1E6C00A40;
  uint64_t v10 = self;
  objc_super v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __47__EDMessageQueryHandler__queryHelperIsCurrent___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) currentQueryHelper];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 == v3;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3) {
      [(EDMessageQueryHandler *)self _contentProtectionChangedToUnlocked];
    }
  }
  else
  {
    [(EDMessageQueryHandler *)self _contentProtectionChangedToLocked];
  }
}

- (void)_contentProtectionChangedToLocked
{
  id v4 = [(EDMessageQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v4);

  if (![(EDMessageQueryHandler *)self isInitialized])
  {
    id v5 = [(EDMessageQueryHandler *)self currentQueryHelper];
    [(EDMessageQueryHandler *)self setCurrentQueryHelper:0];
    objc_super v3 = EFAtomicObjectRelease();
    [v3 cancel];
    [v5 cancel];
  }
}

- (void)_contentProtectionChangedToUnlocked
{
  objc_super v3 = [(EDMessageQueryHandler *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v3);

  if (![(EDMessageQueryHandler *)self didCancel]
    && ![(EDMessageQueryHandler *)self isInitialized])
  {
    [(EDMessageQueryHandler *)self _restartHelper];
  }
}

- (id)_objectIDsAndUnreadObjectIDsFromMessages:(id)a3 unreadObjectIDs:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v16;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 objectID];
        [v5 addObject:v12];
        v13 = [v11 flags];
        char v14 = [v13 read];

        if ((v14 & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if (a4) {
    *a4 = v6;
  }

  return v5;
}

- (id)_requestedItemObjectID
{
  id v2 = [(EDMessageRepositoryQueryHandler *)self query];
  objc_super v3 = [v2 targetClassOptions];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5FF80]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_messagesForInitialBatchWithMessagesFromQueryHelper:(id)a3 requestedMessage:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDMessageQueryHandler *)self _requestedItemObjectID];
  uint64_t v8 = v7;
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__EDMessageQueryHandler__messagesForInitialBatchWithMessagesFromQueryHelper_requestedMessage___block_invoke;
    v17[3] = &unk_1E6BFF8B8;
    id v9 = v7;
    id v18 = v9;
    uint64_t v10 = objc_msgSend(v6, "ef_firstObjectPassingTest:", v17);
    if (v10)
    {
      [(EDMessageQueryHandler *)self setDidFindRequestedItemForInitialBatch:1];
    }
    else
    {
      uint64_t v12 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
      v19[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      char v14 = [v12 messagesForMessageObjectIDs:v13 missedMessageObjectIDs:0];
      uint64_t v10 = [v14 firstObject];

      if (v10)
      {
        char v15 = (void *)[v6 mutableCopy];
        [v15 addObject:v10];

        id v6 = v15;
      }
    }
    if (a4) {
      *a4 = v10;
    }
    id v11 = v6;
  }
  else
  {
    [(EDMessageQueryHandler *)self setDidFindRequestedItemForInitialBatch:1];
    if (a4) {
      *a4 = 0;
    }
    id v11 = v6;
  }

  return v11;
}

uint64_t __94__EDMessageQueryHandler__messagesForInitialBatchWithMessagesFromQueryHelper_requestedMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_messagesBeforeMessageWithObjectID:(id)a3 fromMessagesFromQueryHelper:(id)a4 afterRequestedMessage:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __110__EDMessageQueryHandler__messagesBeforeMessageWithObjectID_fromMessagesFromQueryHelper_afterRequestedMessage___block_invoke;
  v14[3] = &unk_1E6C032B0;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [v8 indexOfObjectPassingTest:v14];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5) {
      *a5 = 0;
    }
    id v11 = v8;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(v8, "ef_suffix:", objc_msgSend(v8, "count") + ~v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "ef_prefix:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v11;

  return v12;
}

uint64_t __110__EDMessageQueryHandler__messagesBeforeMessageWithObjectID_fromMessagesFromQueryHelper_afterRequestedMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_extraInfoForMessages:(id)a3 messagesToPrecache:(id)a4 outObjectIDs:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0;
  uint64_t v10 = [(EDMessageQueryHandler *)self _objectIDsAndUnreadObjectIDsFromMessages:v8 unreadObjectIDs:&v15];
  id v11 = v15;
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = v12;
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F5FDA0]];
  }
  if ([v9 count]) {
    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F5FDA8]];
  }
  if (a5) {
    *a5 = v10;
  }

  return v13;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  BOOL v5 = a5;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v8])
  {
    if (v5)
    {
      id v15 = 0;
      uint64_t v10 = [(EDMessageQueryHandler *)self _messagesForInitialBatchWithMessagesFromQueryHelper:v9 requestedMessage:&v15];
      id v11 = v15;

      if (v11)
      {
        v16[0] = v11;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      }
      else
      {
        id v12 = 0;
      }
      [(EDMessageQueryHandler *)self _reportFoundMessages:v10 before:0 messagesToPrecache:v12];
      id v9 = (id)v10;
LABEL_13:

      goto LABEL_14;
    }
    if (![(EDMessageQueryHandler *)self didFindRequestedItemForInitialBatch])
    {
      id v11 = [(EDMessageQueryHandler *)self _requestedItemObjectID];
      id v14 = 0;
      v13 = [(EDMessageQueryHandler *)self _messagesBeforeMessageWithObjectID:v11 fromMessagesFromQueryHelper:v9 afterRequestedMessage:&v14];
      id v12 = v14;

      id v9 = v13;
      if ([v13 count]) {
        [(EDMessageQueryHandler *)self _reportFoundMessages:v13 before:v11 messagesToPrecache:0];
      }
      if ([v12 count])
      {
        [(EDMessageQueryHandler *)self _reportFoundMessages:v12 before:0 messagesToPrecache:0];
        [(EDMessageQueryHandler *)self setDidFindRequestedItemForInitialBatch:1];
      }
      goto LABEL_13;
    }
    [(EDMessageQueryHandler *)self _reportFoundMessages:v9 before:0 messagesToPrecache:0];
  }
LABEL_14:
}

- (void)_reportFoundMessages:(id)a3 before:(id)a4 messagesToPrecache:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v30 = 0;
  id v24 = v8;
  id v25 = a5;
  uint64_t v10 = -[EDMessageQueryHandler _extraInfoForMessages:messagesToPrecache:outObjectIDs:](self, "_extraInfoForMessages:messagesToPrecache:outObjectIDs:", v8);
  id v11 = v30;
  unint64_t v12 = [v11 count];
  if (v12 > 0xA)
  {
    v13 = [v11 ef_prefix:5];
    id v15 = [v11 ef_suffix:5];
    id v16 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134219010;
      v32 = self;
      __int16 v33 = 2048;
      unint64_t v34 = v12;
      __int16 v35 = 2114;
      uint64_t v36 = v13;
      __int16 v37 = 2114;
      v38 = v15;
      __int16 v39 = 2114;
      v40 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Found %lu objectIDs starting with: %{public}@\nending with:\n%{public}@\n%{public}@", buf, 0x34u);
    }
  }
  else
  {
    v13 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218754;
      v32 = self;
      __int16 v33 = 2048;
      unint64_t v34 = v12;
      __int16 v35 = 2114;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Found %lu objectIDs: %{public}@\n%{public}@", buf, 0x2Au);
    }
  }

  id v18 = +[EDMessageQueryHandler log];
  long long v19 = [(EDMessageRepositoryQueryHandler *)self _distinctObjectIDs:v11 queryHandlerLog:v18];

  long long v20 = [(EDMessageQueryHandler *)self resultQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__EDMessageQueryHandler__reportFoundMessages_before_messagesToPrecache___block_invoke;
  block[3] = &unk_1E6BFFA78;
  void block[4] = self;
  id v27 = v19;
  id v28 = v9;
  id v29 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v19;
  dispatch_sync(v20, block);
}

void __72__EDMessageQueryHandler__reportFoundMessages_before_messagesToPrecache___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedAddedObjectIDs:*(void *)(a1 + 40) before:*(void *)(a1 + 48) extraInfo:*(void *)(a1 + 56)];
}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    BOOL v5 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      unint64_t v12 = v6;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load\n%{public}@", buf, 0x16u);
    }
    [(EDMessageQueryHandler *)self setIsInitialized:1];
    [(EDMessageQueryHandler *)self setHasEverReconciledJournal:1];
    id v7 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__EDMessageQueryHandler_queryHelperDidFindAllMessages___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_sync(v7, block);

    [(EDMessageQueryHandler *)self _initializeOldestMessagesByMailbox];
  }
}

void __55__EDMessageQueryHandler_queryHelperDidFindAllMessages___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observerDidFinishInitialLoad:v2];
}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v6])
  {
    id v8 = [(EDMessageQueryHandler *)self findMessagesByPreviousObjectIDForAddedMessages:v7 helper:v6];
    id v9 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v12 = self;
      __int16 v13 = 1024;
      int v14 = [v7 count];
      __int16 v15 = 1024;
      int v16 = [v8 count];
      _os_log_debug_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEBUG, "%p: Did add %u messages. %u groups.", buf, 0x18u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke;
    v10[3] = &unk_1E6C032D8;
    v10[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
    [(EDMessageQueryHandler *)self _oldestMessagesNeedUpdate];
  }
}

void __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v30 = 0;
  id v25 = v6;
  id v8 = objc_msgSend(v7, "_objectIDsAndUnreadObjectIDsFromMessages:unreadObjectIDs:");
  id v9 = v30;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v39 = *MEMORY[0x1E4F5FDA0];
    v40[0] = v9;
    __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  }
  else
  {
    __int16 v11 = 0;
  }
  unint64_t v12 = +[EDMessageQueryHandler log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = *(void **)(a1 + 32);
    int v14 = [v13 query];
    *(_DWORD *)buf = 134218754;
    v32 = v13;
    __int16 v33 = 2114;
    unint64_t v34 = v8;
    __int16 v35 = 2114;
    id v36 = v5;
    __int16 v37 = 2114;
    v38 = v14;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Adding objectIDs: %{public}@ before: %{public}@\n%{public}@", buf, 0x2Au);
  }
  id v15 = [MEMORY[0x1E4F1CA98] null];
  if (v15 == v5) {
    int v16 = 0;
  }
  else {
    int v16 = v5;
  }
  id v17 = v16;

  id v18 = *(void **)(a1 + 32);
  long long v19 = +[EDMessageQueryHandler log];
  long long v20 = [v18 _distinctObjectIDs:v8 queryHandlerLog:v19];

  id v21 = [*(id *)(a1 + 32) resultQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke_24;
  block[3] = &unk_1E6BFFA78;
  void block[4] = *(void *)(a1 + 32);
  id v27 = v20;
  id v28 = v17;
  id v29 = v11;
  id v22 = v11;
  id v23 = v17;
  id v24 = v20;
  dispatch_sync(v21, block);
}

void __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke_24(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedAddedObjectIDs:*(void *)(a1 + 40) before:*(void *)(a1 + 48) extraInfo:*(void *)(a1 + 56)];
}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v21;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          id v13 = objc_alloc_init(MEMORY[0x1E4F60388]);
          int v14 = [v12 flags];
          [v13 setFlags:v14];

          id v15 = [v12 objectID];
          [v7 setObject:v13 forKeyedSubscript:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v9);
    }

    int v16 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v7 allKeys];
      id v18 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218498;
      id v29 = self;
      __int16 v30 = 2114;
      dispatch_queue_t v31 = v17;
      __int16 v32 = 2114;
      __int16 v33 = v18;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Changing flags for objectIDs: %{public}@\n%{public}@", buf, 0x20u);
    }
    long long v19 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__EDMessageQueryHandler_queryHelper_messageFlagsDidChangeForMessages_previousMessages___block_invoke;
    block[3] = &unk_1E6BFFAF0;
    void block[4] = self;
    id v23 = v7;
    id v20 = v7;
    dispatch_sync(v19, block);
  }
}

void __87__EDMessageQueryHandler_queryHelper_messageFlagsDidChangeForMessages_previousMessages___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedChangesForObjectIDs:*(void *)(a1 + 40)];
}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v9])
  {
    unint64_t v12 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__EDMessageQueryHandler_queryHelper_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
    block[3] = &unk_1E6BFF7A8;
    void block[4] = self;
    id v14 = v11;
    id v15 = v10;
    dispatch_sync(v12, block);
  }
}

void __95__EDMessageQueryHandler_queryHelper_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) objectID];
  [v5 observer:v2 replacedExistingObjectID:v3 withNewObjectID:v4];
}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v9])
  {
    if ([(EDMessageQueryHandler *)self hasUrgentPredicate]
      && [v11 containsObject:*MEMORY[0x1E4F5FE70]])
    {
      if ((objc_msgSend(v10, "ef_all:", &__block_literal_global_48) & 1) == 0)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"EDMessageQueryHandler.m" lineNumber:430 description:@"Messages matched the urgent query without the urgent flag being set"];
      }
      [(EDMessageQueryHandler *)self queryHelper:v9 didAddMessages:v10];
    }
    else
    {
      unint64_t v12 = [MEMORY[0x1E4F60388] changesForKeyPaths:v11 ofItems:v10];
      id v13 = +[EDMessageQueryHandler log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v12 allKeys];
        id v15 = [(EDMessageRepositoryQueryHandler *)self query];
        *(_DWORD *)buf = 134218754;
        long long v25 = self;
        __int16 v26 = 2114;
        id v27 = v11;
        __int16 v28 = 2114;
        id v29 = v14;
        __int16 v30 = 2114;
        dispatch_queue_t v31 = v15;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Changing key paths: %{public}@ for objectIDs: %{public}@\n%{public}@", buf, 0x2Au);
      }
      if ([(EDMessageRepositoryQueryHandler *)self keyPathsAffectSorting:v11])
      {
        int v16 = [(EDMessageQueryHandler *)self findMessagesByPreviousObjectIDForAddedMessages:v10 helper:v9];
      }
      else
      {
        int v16 = 0;
      }
      id v17 = [(EDMessageQueryHandler *)self resultQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_34;
      block[3] = &unk_1E6BFF7A8;
      void block[4] = self;
      id v18 = v12;
      id v22 = v18;
      id v19 = v16;
      id v23 = v19;
      dispatch_sync(v17, block);

      if ([v19 count]) {
        [(EDMessageQueryHandler *)self _oldestMessagesNeedUpdate];
      }
    }
  }
}

uint64_t __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 generatedSummary];
  uint64_t v3 = [v2 urgent];

  return v3;
}

uint64_t __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultsObserver];
  uint64_t v3 = [*(id *)(a1 + 32) observationIdentifier];
  [v2 observer:v3 matchedChangesForObjectIDs:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_2;
  v6[3] = &unk_1E6C032D8;
  v6[4] = *(void *)(a1 + 32);
  return [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
  id v8 = +[EDMessageQueryHandler log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v9 query];
    int v16 = 134218754;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Adding objectIDs: %{public}@ before: %{public}@\n%{public}@", (uint8_t *)&v16, 0x2Au);
  }
  id v11 = [MEMORY[0x1E4F1CA98] null];
  if (v11 == v5) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v5;
  }
  id v13 = v12;

  id v14 = [*(id *)(a1 + 32) resultsObserver];
  id v15 = [*(id *)(a1 + 32) observationIdentifier];
  [v14 observer:v15 matchedMovedObjectIDs:v7 before:v13 extraInfo:0];
}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    id v7 = objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
    id v8 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218498;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Deleting objectIDs: %{public}@\n%{public}@", buf, 0x20u);
    }
    id v10 = [(EDMessageQueryHandler *)self resultQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __55__EDMessageQueryHandler_queryHelper_didDeleteMessages___block_invoke;
    id v15 = &unk_1E6BFFAF0;
    int v16 = self;
    id v11 = v7;
    id v17 = v11;
    dispatch_sync(v10, &v12);

    [(EDMessageQueryHandler *)self _oldestMessagesNeedUpdate];
  }
}

void __55__EDMessageQueryHandler_queryHelper_didDeleteMessages___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedDeletedObjectIDs:*(void *)(a1 + 40)];
}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v21;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v13 = objc_alloc_init(MEMORY[0x1E4F60388]);
          id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "conversationID"));
          [v13 setConversationID:v14];

          id v15 = [v12 objectID];
          [v7 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v9);
    }

    int v16 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v7 allKeys];
      __int16 v18 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218498;
      id v29 = self;
      __int16 v30 = 2114;
      dispatch_queue_t v31 = v17;
      __int16 v32 = 2114;
      __int16 v33 = v18;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Changing conversationID for objectIDs: %{public}@\n%{public}@", buf, 0x20u);
    }
    id v19 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__EDMessageQueryHandler_queryHelper_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
    block[3] = &unk_1E6BFFAF0;
    void block[4] = self;
    id v23 = v7;
    id v20 = v7;
    dispatch_sync(v19, block);
  }
}

void __91__EDMessageQueryHandler_queryHelper_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedChangesForObjectIDs:*(void *)(a1 + 40)];
}

- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v22;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v13 = objc_alloc_init(MEMORY[0x1E4F60388]);
          id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "businessID"));
          [v13 setBusinessID:v14];

          id v15 = [v12 businessLogoID];
          [v13 setBusinessLogoID:v15];

          int v16 = [v12 objectID];
          [v7 setObject:v13 forKeyedSubscript:v16];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v9);
    }

    id v17 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v7 allKeys];
      id v19 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218498;
      __int16 v30 = self;
      __int16 v31 = 2114;
      __int16 v32 = v18;
      __int16 v33 = 2114;
      unint64_t v34 = v19;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Changing businessID for objectIDs: %{public}@\n%{public}@", buf, 0x20u);
    }
    id v20 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__EDMessageQueryHandler_queryHelper_businessIDDidChangeForMessages_fromBusinessID___block_invoke;
    block[3] = &unk_1E6BFFAF0;
    void block[4] = self;
    id v24 = v7;
    id v21 = v7;
    dispatch_sync(v20, block);
  }
}

void __83__EDMessageQueryHandler_queryHelper_businessIDDidChangeForMessages_fromBusinessID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedChangesForObjectIDs:*(void *)(a1 + 40)];
}

- (id)_createChangesForMessagesWithConversationID:(int64_t)a3 block:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  id v7 = [MEMORY[0x1E4F60390] predicateForMessagesInConversation:a3];
  id v8 = [(EDMessageQueryHandler *)self currentQueryHelper];
  v25[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v19 = [v8 messagesWithAdditionalPredicates:v9 limit:0x7FFFFFFFFFFFFFFFLL];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v19;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v16 = v6[2](v6);
        id v17 = [v15 objectID];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v10;
}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:a3])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke;
    v16[3] = &__block_descriptor_40_e30___EMMessageListItemChange_8__0l;
    v16[4] = a4;
    id v8 = [(EDMessageQueryHandler *)self _createChangesForMessagesWithConversationID:a5 block:v16];
    uint64_t v9 = +[EDMessageQueryHandler log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 allKeys];
      id v11 = [(EDMessageRepositoryQueryHandler *)self query];
      *(_DWORD *)buf = 134218498;
      __int16 v18 = self;
      __int16 v19 = 2114;
      long long v20 = v10;
      __int16 v21 = 2114;
      long long v22 = v11;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Changing flags for objectIDs: %{public}@\n%{public}@", buf, 0x20u);
    }
    uint64_t v12 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke_40;
    block[3] = &unk_1E6BFFAF0;
    void block[4] = self;
    id v15 = v8;
    id v13 = v8;
    dispatch_sync(v12, block);
  }
}

id __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F60388]);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  [v2 setConversationNotificationLevel:v3];

  return v2;
}

void __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke_40(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observer:v2 matchedChangesForObjectIDs:*(void *)(a1 + 40)];
}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  id v4 = a3;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    id v5 = [(EDMessageQueryHandler *)self resultQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__EDMessageQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_sync(v5, block);
  }
}

void __58__EDMessageQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resultsObserver];
  id v2 = [*(id *)(a1 + 32) observationIdentifier];
  [v3 observerDidFinishRemoteSearch:v2];
}

- (void)queryHelperNeedsRestart:(id)a3
{
  id v4 = a3;
  if ([(EDMessageQueryHandler *)self _queryHelperIsCurrent:v4])
  {
    id v5 = [(EDMessageQueryHandler *)self contentProtectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__EDMessageQueryHandler_queryHelperNeedsRestart___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    void block[4] = self;
    dispatch_async(v5, block);
  }
}

uint64_t __49__EDMessageQueryHandler_queryHelperNeedsRestart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartHelper];
}

- (void)_initializeOldestMessagesByMailbox
{
  id v4 = [(EDMessageRepositoryQueryHandler *)self query];
  char v5 = [v4 queryOptions];

  if (v5)
  {
    if (self->_oldestMessageIDsByMailboxObjectIDs)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"EDMessageQueryHandler.m" lineNumber:561 description:@"_oldestMessageIDsByMailboxObjectIDs should be only initialized once"];
    }
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    oldestMessageIDsByMailboxObjectIDs = self->_oldestMessageIDsByMailboxObjectIDs;
    self->_oldestMessageIDsByMailboxObjectIDs = v6;

    [(EDMessageQueryHandler *)self _oldestMessagesNeedUpdate];
  }
}

- (void)_oldestMessagesNeedUpdate
{
  if (self->_oldestMessageIDsByMailboxObjectIDs)
  {
    id v3 = EFAtomicObjectLoad();
    [v3 cancel];
    id v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    char v5 = EFAtomicObjectSetIfIdentical();

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v6 = [(EDMessageQueryHandler *)self scheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__EDMessageQueryHandler__oldestMessagesNeedUpdate__block_invoke;
    v9[3] = &unk_1E6BFF198;
    objc_copyWeak(&v11, &location);
    id v7 = v5;
    id v10 = v7;
    id v8 = [v6 afterDelay:v9 performBlock:2.0];
    [v7 addCancelable:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __50__EDMessageQueryHandler__oldestMessagesNeedUpdate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[EDMessageQueryHandler log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [WeakRetained mailboxes];
    int v7 = 134218240;
    id v8 = WeakRetained;
    __int16 v9 = 1024;
    int v10 = [v4 count];
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Updating oldest messages for %u mailboxes", (uint8_t *)&v7, 0x12u);
  }
  char v5 = [WeakRetained mailboxes];
  [WeakRetained _updateOldestMessagesForMailboxes:v5 cancelationToken:*(void *)(a1 + 32)];

  id v6 = (id)EFAtomicObjectReleaseIfIdentical();
}

- (void)_updateOldestMessagesForMailboxes:(id)a3 cancelationToken:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    char v19 = 0;
    uint64_t v21 = v7;
    uint64_t v22 = *(void *)v25;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v25 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
      int v10 = (void *)MEMORY[0x1E0190280]();
      uint64_t v11 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
      uint64_t v12 = [(EDMessageQueryHandler *)self _oldestItemQueryForMailbox:v9];
      id v13 = [v11 messagesMatchingQuery:v12 limit:1 cancelationToken:v23];
      id v14 = [v13 firstObject];

      char v15 = [v23 isCanceled];
      if ((v15 & 1) == 0)
      {
        int v16 = [v14 objectID];
        id v17 = [(NSMutableDictionary *)self->_oldestMessageIDsByMailboxObjectIDs objectForKeyedSubscript:v9];
        if (v16 != v17 && ([v16 isEqual:v17] & 1) == 0)
        {
          __int16 v18 = +[EDMessageQueryHandler log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v29 = self;
            __int16 v30 = 2112;
            uint64_t v31 = v9;
            _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "%p: Updated oldest message for mailbox ID %@", buf, 0x16u);
          }

          [(NSMutableDictionary *)self->_oldestMessageIDsByMailboxObjectIDs setObject:v16 forKeyedSubscript:v9];
          char v19 = 1;
        }
      }
      if (v15) {
        break;
      }
      if (v21 == ++v8)
      {
        uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }

    if (v19) {
      [(EDMessageQueryHandler *)self _oldestMessagesByMailboxObjectIDsWasUpdated];
    }
  }
  else
  {
  }
}

- (id)_oldestItemQueryForMailbox:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(EDMessageRepositoryQueryHandler *)self query];
  id v6 = [v5 predicate];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithObjectID:v4];
  uint64_t v9 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:1];
  id v10 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v11 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v12 = [v11 targetClass];
  id v13 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v7;
  v20[1] = v8;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  char v15 = [v13 andPredicateWithSubpredicates:v14];
  char v19 = v9;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v17 = (void *)[v10 initWithTargetClass:v12 predicate:v15 sortDescriptors:v16];

  return v17;
}

- (void)_oldestMessagesByMailboxObjectIDsWasUpdated
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "%p: Oldest messages updated", (uint8_t *)&v2, 0xCu);
}

void __68__EDMessageQueryHandler__oldestMessagesByMailboxObjectIDsWasUpdated__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) resultsObserver];
  int v2 = [*(id *)(a1 + 32) observationIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) oldestMessageIDsByMailboxObjectIDs];
  [v4 observer:v2 matchedOldestItemsUpdatedForMailboxes:v3];
}

- (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 helper:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = EFFetchSignpostLog();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);
  uint64_t v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v15[0] = 67109120;
    v15[1] = [v5 count];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "QueryHelper FindMessagesByPreviousID", "count=%{signpost.description:attribute}u ", (uint8_t *)v15, 8u);
  }

  uint64_t v11 = +[EDMessageQueryHandler findMessagesByPreviousObjectIDForAddedMessages:v5 messageSource:v6];
  uint64_t v12 = v10;
  id v13 = v12;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    LOWORD(v15[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v13, OS_SIGNPOST_INTERVAL_END, v8, "QueryHelper FindMessagesByPreviousID", "", (uint8_t *)v15, 2u);
  }

  return v11;
}

+ (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 messageSource:(id)a4
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v53 = a4;
  v52 = v5;
  if ([v5 count])
  {
    v50 = [v53 query];
    v60 = [v50 sortDescriptors];
    if ([v60 count])
    {
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = EFComparatorFromSortDescriptors();
      uint64_t v7 = [v52 sortedArrayWithOptions:16 usingComparator:v6];

      v49 = v7;
      v45 = objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
      id v47 = [v60 firstObject];
      uint64_t v8 = [v47 key];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke;
      aBlock[3] = &unk_1E6C03320;
      aBlock[4] = v47;
      v46 = (void *)v8;
      void aBlock[5] = v8;
      objc_super v48 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
      uint64_t v9 = v7;
      uint64_t v10 = [v7 count];
      if (v10 >= 290) {
        uint64_t v11 = 290;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = [v9 firstObject];
      id v13 = v48[2](v48, v12, 1);
      v99 = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
      v51 = [v53 sortableMessagesWithAdditionalPredicates:v14 limit:v11 + 10];

      char v15 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v51, "count"));
      uint64_t v89 = 0;
      v90 = &v89;
      uint64_t v91 = 0x2020000000;
      int v92 = 0;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_2;
      v85[3] = &unk_1E6C03370;
      v85[4] = v51;
      id v43 = v15;
      id v86 = v43;
      id v16 = v45;
      id v87 = v16;
      v88 = &v89;
      v59 = (void (**)(void *, void *))_Block_copy(v85);
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_4;
      v84[3] = &unk_1E6C03398;
      v84[4] = v46;
      v84[5] = v47;
      id v17 = _Block_copy(v84);
      uint64_t v80 = 0;
      v81 = &v80;
      uint64_t v82 = 0x2020000000;
      int v83 = 0;
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_5;
      v77[3] = &unk_1E6C033C0;
      v77[4] = v57;
      id v44 = v17;
      v77[5] = v61;
      id v78 = v44;
      v79 = &v80;
      v56 = (void (**)(void *, void *))_Block_copy(v77);
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x3032000000;
      v74 = __Block_byref_object_copy__22;
      v75 = __Block_byref_object_dispose__22;
      id v76 = 0;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_54;
      v66[3] = &unk_1E6C033E8;
      v70 = &v71;
      id v41 = v16;
      id v67 = v41;
      v42 = v48;
      v69 = v42;
      id v68 = v53;
      v55 = (void (**)(void *, void *))_Block_copy(v66);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id obj = v49;
      uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v98 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v63 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            uint64_t v22 = v59[2](v59, v21);
            if (!v22)
            {
              uint64_t v22 = v56[2](v56, v21);
              if (!v22)
              {
                uint64_t v22 = v55[2](v55, v21);
              }
            }
            id v23 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v41, v42, v43, v44);
            if (v22 == v23)
            {

LABEL_22:
              long long v26 = [MEMORY[0x1E4F1CA98] null];
              goto LABEL_23;
            }
            long long v24 = [v22 objectID];
            BOOL v25 = v24 == 0;

            if (v25) {
              goto LABEL_22;
            }
            long long v26 = [v22 objectID];
            [v57 addObject:v22];
            long long v27 = [v21 itemID];
            long long v28 = [v26 collectionItemID];
            if ([v27 isEqual:v28])
            {
              id v29 = +[EDMessageQueryHandler log];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                uint64_t v31 = v72[5];
                *(_DWORD *)buf = 134218754;
                id v95 = a1;
                __int16 v96 = 2114;
                *(void *)v97 = v21;
                *(_WORD *)&v97[8] = 2114;
                *(void *)&v97[10] = v22;
                *(_WORD *)&v97[18] = 2114;
                *(void *)&v97[20] = v31;
                _os_log_error_impl(&dword_1DB39C000, v29, OS_LOG_TYPE_ERROR, "%p: Previous message is message itself -- message: %{public}@\nprevious message: %{public}@\nexclude predicate: %{public}@", buf, 0x2Au);
              }
            }
LABEL_23:
            id v30 = [v61 objectForKeyedSubscript:v26];
            if (!v30)
            {
              id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v61 setObject:v30 forKeyedSubscript:v26];
            }
            objc_msgSend(v30, "ef_insertObject:usingSortDescriptors:", v21, v60);
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v98 count:16];
        }
        while (v18);
      }

      int v32 = *((_DWORD *)v90 + 6);
      unint64_t v33 = [obj count];
      int v34 = *((_DWORD *)v81 + 6);
      unint64_t v35 = [obj count];
      uint64_t v36 = +[EDMessageQueryHandler log];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        int v39 = [v51 count];
        int v40 = [obj count];
        *(_DWORD *)buf = 134219008;
        id v95 = a1;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v39;
        *(_WORD *)&v97[4] = 2048;
        *(double *)&v97[6] = (float)((float)((float)v32 * 100.0) / (float)v33);
        *(_WORD *)&v97[14] = 2048;
        *(double *)&v97[16] = (float)((float)((float)v34 * 100.0) / (float)v35);
        *(_WORD *)&v97[24] = 1024;
        *(_DWORD *)&v97[26] = v40;
        _os_log_debug_impl(&dword_1DB39C000, v36, OS_LOG_TYPE_DEBUG, "%p: Used head-list-lookup (%u entries) for %.3g%%, faster previous-message-lookup for %.3g%% of %u messages.", buf, 0x2Cu);
      }

      id v37 = v61;
      _Block_object_dispose(&v71, 8);

      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v89, 8);
    }
    else
    {
      id v57 = [MEMORY[0x1E4F1CA98] null];
      id v100 = v57;
      v101[0] = v5;
      id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:&v100 count:1];
    }
  }
  else
  {
    id v37 = (id)MEMORY[0x1E4F1CC08];
  }

  return v37;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  int v6 = [*(id *)(a1 + 32) ascending];
  uint64_t v7 = 2;
  if (a3) {
    uint64_t v7 = 3;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  uint64_t v9 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*(void *)(a1 + 40)];
  uint64_t v10 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v11 = [v5 valueForKeyPath:*(void *)(a1 + 40)];
  uint64_t v12 = [v10 expressionForConstantValue:v11];

  id v13 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v9 rightExpression:v12 modifier:0 type:v8 options:0];

  return v13;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectID];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _DWORD v15[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_3;
  v15[3] = &unk_1E6C03348;
  id v7 = v4;
  id v16 = v7;
  uint64_t v8 = [v5 indexOfObjectAtIndexes:v6 options:0 passingTest:v15];
  uint64_t v9 = *(void **)(a1 + 40);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 removeAllIndexes];
  }
  else
  {
    objc_msgSend(v9, "removeIndexesInRange:", 0, v8);
    for (unint64_t i = v8 + 1; i < [*(id *)(a1 + 32) count]; ++i)
    {
      uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      uint64_t v12 = *(void **)(a1 + 48);
      id v13 = [v10 objectID];
      LOBYTE(v12) = [v12 containsObject:v13];

      if ((v12 & 1) == 0)
      {
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        goto LABEL_9;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

uint64_t __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 valueForKeyPath:*(void *)(a1 + 32)];
  id v7 = [v5 valueForKeyPath:*(void *)(a1 + 32)];
  uint64_t v8 = [v6 compare:v7];
  char v9 = [*(id *)(a1 + 40) ascending];
  if (v8 == -1) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  if (v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = (v8 == 1) & ~[*(id *)(a1 + 40) ascending];
  }

  return v11;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          char v9 = *(void **)(a1 + 40);
          char v10 = [v8 objectID];
          uint64_t v11 = [v9 objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 firstObject];

          if (v12 && ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) != 0)
          {
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            id v18 = v8;

            goto LABEL_23;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = *(void **)(a1 + 40);
  id v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", 0);
  id v4 = [v13 objectForKeyedSubscript:v14];

  uint64_t v15 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v4);
        }
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          id v18 = [MEMORY[0x1E4F1CA98] null];
          goto LABEL_23;
        }
      }
      uint64_t v15 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_54(void *a1, void *a2)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x1E4F60320] predicateForExcludingMessagesWithObjectIDs:a1[4]];
    uint64_t v5 = *(void *)(a1[7] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = (*(void (**)(void))(a1[6] + 16))();
  uint64_t v8 = (void *)a1[5];
  uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 40);
  v14[0] = v7;
  v14[1] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v11 = [v8 messagesWithAdditionalPredicates:v10 limit:1];
  uint64_t v12 = [v11 firstObject];

  return v12;
}

- (id)labelForStateCapture
{
  int v2 = [(EDMessageRepositoryQueryHandler *)self query];
  id v3 = [v2 label];

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  uint64_t v5 = objc_alloc_init(_EDMessageItemIDCollector);
  uint64_t v6 = [(EDMessageRepositoryQueryHandler *)self query];
  id v7 = [(EDMessageRepositoryQueryHandler *)self messagePersistence];
  uint64_t v8 = [(EDMessageRepositoryQueryHandler *)self hookRegistry];
  uint64_t v9 = [(EDMessageRepositoryQueryHandler *)self remindMeNotificationController];
  char v10 = [(EDMessageQueryHandler *)self searchProvider];
  uint64_t v11 = [(_EDMessageItemIDCollector *)v5 collectItemIDsWithQuery:v6 messagePersistence:v7 hookRegistry:v8 remindMeNotificationController:v9 searchProvider:v10 errorString:a3];

  return v11;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDMessageQueryHelper)currentQueryHelper
{
  return self->_currentQueryHelper;
}

- (void)setCurrentQueryHelper:(id)a3
{
}

- (EFScheduler)scheduler
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

- (BOOL)didFindRequestedItemForInitialBatch
{
  return self->_didFindRequestedItemForInitialBatch;
}

- (void)setDidFindRequestedItemForInitialBatch:(BOOL)a3
{
  self->_didFindRequestedItemForInitialBatch = a3;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (BOOL)hasEverReconciledJournal
{
  return self->_hasEverReconciledJournal;
}

- (void)setHasEverReconciledJournal:(BOOL)a3
{
  self->_hasEverReconciledJournal = a3;
}

- (NSMutableDictionary)oldestMessageIDsByMailboxObjectIDs
{
  return self->_oldestMessageIDsByMailboxObjectIDs;
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (BOOL)hasUrgentPredicate
{
  return self->_hasUrgentPredicate;
}

- (void)setHasUrgentPredicate:(BOOL)a3
{
  self->_hasUrgentPredicate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_oldestMessageIDsByMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_currentQueryHelper, 0);

  objc_storeStrong((id *)&self->_searchProvider, 0);
}

@end