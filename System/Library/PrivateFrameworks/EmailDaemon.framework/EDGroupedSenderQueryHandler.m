@interface EDGroupedSenderQueryHandler
+ (id)_comparatorForSortDescriptors:(id)a3 sectionPredicates:(id)a4;
+ (id)resolveMergePathsForMergedBusinesses:(id)a3;
+ (unint64_t)_sectionIndexForGroupedSender:(id)a3 sectionPredicates:(id)a4 sectionIdentifier:(id *)a5;
- (BOOL)_queryHelperIsCurrent:(id)a3;
- (BOOL)didCancel;
- (BOOL)keepMessagesInListOnBucketChange;
- (BOOL)start;
- (EDBusinessCloudStorage)businessCloudStorage;
- (EDBusinessPersistence)businessPersistence;
- (EDGroupedSenderQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 senderPersistence:(id)a5 businessPersistence:(id)a6 businessCloudStorage:(id)a7 hookRegistry:(id)a8 remindMeNotificationController:(id)a9 observer:(id)a10 observationIdentifier:(id)a11 keepMessagesInListOnBucketChange:(BOOL)a12;
- (EDMessagePersistence)messagePersistence;
- (EDMessageQueryHelper)messageQueryHelper;
- (EDSenderPersistence)senderPersistence;
- (EFOrderedDictionary)sectionPredicates;
- (EFScheduler)scheduler;
- (EMListUnsubscribeDetector)unsubscribeDetector;
- (EMMessageListItemQueryResultsObserver)resultsObserverIfUncanceled;
- (EMThreadScope)threadScope;
- (OS_dispatch_queue)resultQueue;
- (_EDGroupedSenderList)groupedSenders;
- (id)_externalBusinessIDForEmailAddress:(id)a3;
- (id)_extraInfoForSenderItemIDsBySection:(id)a3 includePrecachedSendersFromSenders:(id)a4;
- (id)_groupedSenderForEDGroupedSender:(id)a3;
- (id)_groupedSenderForObjectID:(id)a3;
- (id)_itemIDsWithSectionChangesFrom:(id)a3 to:(id)a4;
- (id)_messageQueryFromGroupedQuery:(id)a3;
- (id)_senderItemIDsBySectionForSenders:(id)a3;
- (id)_updateDifference:(id)a3 from:(id)a4 forChangedGroups:(id)a5;
- (id)groupedSenderForObjectID:(id)a3 isPersisted:(BOOL *)a4 error:(id *)a5;
- (id)messagesForGroupedSender:(id)a3 limit:(int64_t)a4;
- (int64_t)grouping;
- (unint64_t)_sectionIndexForGroupedSender:(id)a3 sectionIdentifier:(id *)a4;
- (void)_filterGroupedSenderChanges:(id)a3 withVisibleSenders:(id)a4;
- (void)_messagesWereAdded:(id)a3 toInitialBatch:(BOOL)a4;
- (void)_messagesWereChanged:(id)a3 previousMessages:(id)a4 forKeyPaths:(id)a5 deleted:(BOOL)a6;
- (void)_notifyObserversOfInsertedSenders:(id)a3 senderItemIDsBySection:(id)a4 previousSender:(id)a5 includePrecachedSenders:(BOOL)a6 notifyBlock:(id)a7;
- (void)_notifyObserversOfMovedSenders:(id)a3 previousSender:(id)a4 includePrecachedSenders:(BOOL)a5 notifyBlock:(id)a6;
- (void)_notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:(id)a3 to:(id)a4 forChangedGroups:(id)a5 itemIDsWithSectionChanges:(id)a6 includePrecachedSenders:(BOOL)a7 logMessage:(id)a8;
- (void)_persistenceDidFinishMergingBusinesses;
- (void)cancel;
- (void)persistenceIsMergingBusinessID:(int64_t)a3 intoBusinessID:(int64_t)a4;
- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5;
- (void)queryHelper:(id)a3 didAddMessages:(id)a4;
- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4;
- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5;
- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5;
- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5;
- (void)queryHelperDidFindAllMessages:(id)a3;
- (void)queryHelperNeedsRestart:(id)a3;
- (void)setBusinessCloudStorage:(id)a3;
- (void)setBusinessPersistence:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setGroupedSenders:(id)a3;
- (void)setGrouping:(int64_t)a3;
- (void)setKeepMessagesInListOnBucketChange:(BOOL)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setMessageQueryHelper:(id)a3;
- (void)tearDown;
- (void)test_tearDown;
- (void)updateUnseenCountsForBusinessesWithExternalIDs:(id)a3;
- (void)updatedBusinessesWithExternalIDs:(id)a3 removedBusinessesWithExternalIDs:(id)a4;
@end

@implementation EDGroupedSenderQueryHandler

void ___ef_log_EDGroupedSenderQueryHandler_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDGroupedSenderQueryHandler");
  v1 = (void *)_ef_log_EDGroupedSenderQueryHandler_log;
  _ef_log_EDGroupedSenderQueryHandler_log = (uint64_t)v0;
}

- (EDGroupedSenderQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 senderPersistence:(id)a5 businessPersistence:(id)a6 businessCloudStorage:(id)a7 hookRegistry:(id)a8 remindMeNotificationController:(id)a9 observer:(id)a10 observationIdentifier:(id)a11 keepMessagesInListOnBucketChange:(BOOL)a12
{
  id v18 = a3;
  id obj = a4;
  id v19 = a4;
  id v53 = a5;
  id v52 = a6;
  id v54 = a7;
  id v20 = a8;
  id v21 = a9;
  v55.receiver = self;
  v55.super_class = (Class)EDGroupedSenderQueryHandler;
  id v50 = a10;
  v51 = v21;
  id v49 = a11;
  v22 = -[EDMessageRepositoryQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:](&v55, sel_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_observer_observationIdentifier_, v18, v19, v20, v21, v50);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_senderPersistence, a5);
    objc_storeStrong((id *)&v23->_messagePersistence, obj);
    objc_storeStrong((id *)&v23->_businessPersistence, a6);
    objc_storeStrong((id *)&v23->_businessCloudStorage, a7);
    v24 = (EMListUnsubscribeDetector *)objc_alloc_init(MEMORY[0x1E4F602E8]);
    unsubscribeDetector = v23->_unsubscribeDetector;
    v23->_unsubscribeDetector = v24;

    v26 = (void *)MEMORY[0x1E4F60390];
    v27 = [v18 predicate];
    v28 = [v19 mailboxPersistence];
    uint64_t v29 = [v26 threadScopeForPredicate:v27 withMailboxTypeResolver:v28];
    threadScope = v23->_threadScope;
    v23->_threadScope = (EMThreadScope *)v29;

    v31 = (void *)MEMORY[0x1E4F60F28];
    v32 = [NSString stringWithFormat:@"com.apple.email.%@.%p", objc_opt_class(), v23];
    uint64_t v33 = [v31 serialDispatchQueueSchedulerWithName:v32 qualityOfService:25];
    scheduler = v23->_scheduler;
    v23->_scheduler = (EFScheduler *)v33;

    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.mail.EDGroupedSenderQueryHandler.result", v35);
    resultQueue = v23->_resultQueue;
    v23->_resultQueue = (OS_dispatch_queue *)v36;

    v38 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v23->_grouping = [v38 preferredGroupedSenderGrouping];

    v39 = [v18 targetClassOptions];
    uint64_t v40 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F5FF90]];
    sectionPredicates = v23->_sectionPredicates;
    v23->_sectionPredicates = (EFOrderedDictionary *)v40;

    [(EFOrderedDictionary *)v23->_sectionPredicates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_14];
    v42 = [_EDGroupedSenderList alloc];
    v43 = [v18 sortDescriptors];
    v44 = +[EDGroupedSenderQueryHandler _comparatorForSortDescriptors:v43 sectionPredicates:v23->_sectionPredicates];
    uint64_t v45 = [(_EDGroupedSenderList *)v42 initWithComparator:v44 grouping:v23->_grouping];
    groupedSenders = v23->_groupedSenders;
    v23->_groupedSenders = (_EDGroupedSenderList *)v45;

    v23->_keepMessagesInListOnBucketChange = a12;
    [v54 beginObserving:v23];
    [v20 registerMessageChangeHookResponder:v23];
    [v20 registerBusinessChangeHookResponder:v23];
  }

  return v23;
}

uint64_t __231__EDGroupedSenderQueryHandler_initWithQuery_messagePersistence_senderPersistence_businessPersistence_businessCloudStorage_hookRegistry_remindMeNotificationController_observer_observationIdentifier_keepMessagesInListOnBucketChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 allowEvaluation];
}

- (void)updateUnseenCountsForBusinessesWithExternalIDs:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
  v7 = [v6 orderedGroupedSenders];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v12 = [v11 externalBusinessID];
        int v13 = [v4 containsObject:v12];

        if (v13)
        {
          v14 = [v11 recalculateUnseenCount];
          v15 = [v11 objectID];
          [v5 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v8);
  }

  v16 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v17 = [v16 limit];

  id v18 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
  id v19 = [v18 orderedGroupedSendersWithLimit:v17 & ~(v17 >> 63)];

  [(EDGroupedSenderQueryHandler *)self _filterGroupedSenderChanges:v5 withVisibleSenders:v19];
  if ([v5 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (id)objc_opt_class();
      uint64_t v22 = [v5 count];
      *(_DWORD *)buf = 138412802;
      id v30 = v21;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu changed groups (after last seen dates changed)", buf, 0x20u);
    }
    v23 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
    v24 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    [v23 observer:v24 matchedChangesForObjectIDs:v5];
  }
}

- (id)_groupedSenderForObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "businessID"));
  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)_groupedSenderForEDGroupedSender:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 newestMessage];

    if (!v7)
    {
      _ef_log_EDGroupedSenderQueryHandler();
      uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2048;
        id v21 = self;
        __int16 v22 = 2114;
        v23 = v6;
        id v13 = v19;
        _os_log_fault_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_FAULT, "<%@ %p> Empty group sender being created: %{public}@", buf, 0x20u);
      }
    }
    id v9 = objc_alloc(MEMORY[0x1E4F602B0]);
    v10 = [v6 objectID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__EDGroupedSenderQueryHandler__groupedSenderForEDGroupedSender___block_invoke;
    v14[3] = &unk_1E6C01118;
    v16 = self;
    SEL v17 = a2;
    id v15 = v6;
    v11 = (void *)[v9 initWithObjectID:v10 builder:v14];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __64__EDGroupedSenderQueryHandler__groupedSenderForEDGroupedSender___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  v3 = [*(id *)(a1 + 32) category];
  [v21 setCategory:v3];

  id v4 = [*(id *)(a1 + 32) date];
  [v21 setDate:v4];

  id v5 = [*(id *)(a1 + 32) displayDate];
  [v21 setDisplayDate:v5];

  v6 = [*(id *)(a1 + 32) readLater];
  [v21 setReadLater:v6];

  v7 = [*(id *)(a1 + 32) subject];
  [v21 setSubject:v7];

  objc_msgSend(v21, "setCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
  objc_msgSend(v21, "setUnreadCount:", objc_msgSend(*(id *)(a1 + 32), "unreadCount"));
  objc_msgSend(v21, "setUnseenCount:", objc_msgSend(*(id *)(a1 + 32), "unseenCount"));
  uint64_t v8 = [*(id *)(a1 + 32) groupedSenderMessageListItems];
  [v21 setGroupedSenderMessageListItems:v8];

  objc_msgSend(v21, "setBusinessID:", objc_msgSend(*(id *)(a1 + 32), "businessID"));
  id v9 = [*(id *)(a1 + 32) businessLogoID];
  [v21 setBusinessLogoID:v9];

  v10 = [*(id *)(a1 + 32) businessDisplayName];
  [v21 setBusinessDisplayName:v10];

  v11 = [*(id *)(a1 + 32) summary];
  [v21 setSummary:v11];

  v12 = [*(id *)(a1 + 32) senderList];
  [v21 setSenderList:v12];

  id v13 = [*(id *)(a1 + 32) toList];
  [v21 setToList:v13];

  v14 = [*(id *)(a1 + 32) ccList];
  [v21 setCcList:v14];

  id v15 = [*(id *)(a1 + 32) flags];
  [v21 setFlags:v15];

  objc_msgSend(v21, "setHasUnflagged:", objc_msgSend(*(id *)(a1 + 32), "hasUnflagged"));
  v16 = [*(id *)(a1 + 32) flagColors];
  [v21 setFlagColors:v16];

  objc_msgSend(v21, "setIsVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v21, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v21, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v21, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(v21, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "isAuthenticated"));
  objc_msgSend(v21, "setAllowAuthenticationWarning:", objc_msgSend(*(id *)(a1 + 32), "allowAuthenticationWarning"));
  objc_msgSend(v21, "setConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel"));
  SEL v17 = [*(id *)(a1 + 32) mailboxes];
  [v21 setMailboxes:v17];

  id v18 = [*(id *)(a1 + 32) displayMessageItemID];
  if (!v18)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"EDGroupedSenderQueryHandler-BlackPearlUI.m", 183, @"If displayMessageItemID is nil, then it will cause a crash later on in the app" object file lineNumber description];
  }
  [v21 setDisplayMessageItemID:v18];
  id v19 = [*(id *)(a1 + 32) followUp];
  [v21 setFollowUp:v19];
}

- (void)tearDown
{
  [(EDGroupedSenderQueryHandler *)self cancel];
  v3 = [(EDGroupedSenderQueryHandler *)self scheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EDGroupedSenderQueryHandler_tearDown__block_invoke;
  v5[3] = &unk_1E6BFF2F0;
  v5[4] = self;
  [v3 performBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)EDGroupedSenderQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v4 tearDown];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDGroupedSenderQueryHandler-BlackPearlUI.m", 205, @"%s can only be called from unit tests", "-[EDGroupedSenderQueryHandler test_tearDown]");
  }

  [(EDGroupedSenderQueryHandler *)self tearDown];
}

- (BOOL)start
{
  v23.receiver = self;
  v23.super_class = (Class)EDGroupedSenderQueryHandler;
  BOOL v3 = [(EDMessageRepositoryQueryHandler *)&v23 start];
  if (v3)
  {
    objc_super v4 = [(EDGroupedSenderQueryHandler *)self messageQueryHelper];

    id v5 = [(EDMessageRepositoryQueryHandler *)self query];
    v6 = [(EDGroupedSenderQueryHandler *)self _messageQueryFromGroupedQuery:v5];

    v7 = [EDMessageQueryHelper alloc];
    uint64_t v8 = [(EDGroupedSenderQueryHandler *)self messagePersistence];
    id v9 = [(EDMessageRepositoryQueryHandler *)self hookRegistry];
    v10 = [(EDGroupedSenderQueryHandler *)self scheduler];
    v11 = [(EDMessageRepositoryQueryHandler *)self remindMeNotificationController];
    BYTE2(v18) = [(EDGroupedSenderQueryHandler *)self keepMessagesInListOnBucketChange];
    LOWORD(v18) = 1;
    v12 = -[EDMessageQueryHelper initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:](v7, "initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:", v6, 200, 5000, v8, v9, 0, v10, v11, self, v18);

    [(EDGroupedSenderQueryHandler *)self setMessageQueryHelper:v12];
    if (v4)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      id v13 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
      objc_initWeak(&location, v13);

      v14 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
      id v15 = [(EDGroupedSenderQueryHandler *)self resultQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__EDGroupedSenderQueryHandler_start__block_invoke;
      block[3] = &unk_1E6BFF198;
      objc_copyWeak(&v21, &location);
      id v20 = v14;
      id v16 = v14;
      dispatch_async(v15, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    [(EDMessageQueryHelper *)v12 start];
  }
  return v3;
}

void __36__EDGroupedSenderQueryHandler_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained observerWillRestart:*(void *)(a1 + 32)];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)EDGroupedSenderQueryHandler;
  [(EDMessageRepositoryQueryHandler *)&v4 cancel];
  BOOL v3 = [(EDGroupedSenderQueryHandler *)self messageQueryHelper];
  [v3 cancel];

  [(EDGroupedSenderQueryHandler *)self setDidCancel:1];
}

- (EMMessageListItemQueryResultsObserver)resultsObserverIfUncanceled
{
  if ([(EDGroupedSenderQueryHandler *)self didCancel])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(EDMessageRepositoryQueryHandler *)self resultsObserver];
  }

  return (EMMessageListItemQueryResultsObserver *)v3;
}

- (void)queryHelperNeedsRestart:(id)a3
{
  id v4 = a3;
  if (-[EDGroupedSenderQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:")) {
    [(EDGroupedSenderQueryHandler *)self start];
  }
}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  id v6 = a3;
  if (-[EDGroupedSenderQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:"))
  {
    id v4 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
    id v5 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    [v4 observerDidFinishInitialLoad:v5];
  }
}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(EDGroupedSenderQueryHandler *)self _queryHelperIsCurrent:v7]) {
    [(EDGroupedSenderQueryHandler *)self _messagesWereAdded:v6 toInitialBatch:0];
  }
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  if ([(EDGroupedSenderQueryHandler *)self _queryHelperIsCurrent:v9]) {
    [(EDGroupedSenderQueryHandler *)self _messagesWereAdded:v8 toInitialBatch:v5];
  }
}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(EDGroupedSenderQueryHandler *)self _queryHelperIsCurrent:v10]
    && ([v9 count] != 1 || (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E4F5FE90]) & 1) == 0))
  {
    [(EDGroupedSenderQueryHandler *)self _messagesWereChanged:v8 previousMessages:0 forKeyPaths:v9 deleted:0];
  }
}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(EDGroupedSenderQueryHandler *)self _queryHelperIsCurrent:v8])
  {
    uint64_t v11 = *MEMORY[0x1E4F5FE98];
    v13[0] = *MEMORY[0x1E4F5FE50];
    v13[1] = v11;
    v13[2] = *MEMORY[0x1E4F5FE48];
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    [(EDGroupedSenderQueryHandler *)self _messagesWereChanged:v9 previousMessages:v10 forKeyPaths:v12 deleted:0];
  }
}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(EDGroupedSenderQueryHandler *)self _queryHelperIsCurrent:v7]) {
    [(EDGroupedSenderQueryHandler *)self _messagesWereChanged:v6 previousMessages:0 forKeyPaths:0 deleted:1];
  }
}

- (void)queryHelper:(id)a3 businessIDDidChangeForMessages:(id)a4 fromBusinessID:(int64_t)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v6 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v7 = [v6 limit];

  [(EDGroupedSenderQueryHandler *)self groupedSenders];
  v46 = uint64_t v39 = v7 & ~(v7 >> 63);
  v42 = objc_msgSend(v46, "orderedGroupedSendersWithLimit:");
  id v8 = [v42 array];
  v41 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v8];

  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [v44 firstObject];
  uint64_t v10 = [v9 businessID];

  uint64_t v11 = [NSNumber numberWithLongLong:v10];
  v12 = [v46 objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [(EDGroupedSender *)v12 addMessages:v44];
    [v46 updateGroupedSender:v12];
    if (v13)
    {
      v14 = [(EMObject *)v12 objectID];
      [v45 setObject:v13 forKeyedSubscript:v14];

      [v43 addObject:v12];
    }
  }
  else
  {
    id v15 = [(EDGroupedSenderQueryHandler *)self businessPersistence];
    id v13 = [v15 businessExternalIDForBusinessID:v10];

    id v16 = [EDGroupedSender alloc];
    v38 = [(EDMessageRepositoryQueryHandler *)self query];
    SEL v17 = [(EDGroupedSenderQueryHandler *)self _messageQueryFromGroupedQuery:v38];
    uint64_t v18 = [(EDGroupedSenderQueryHandler *)self businessPersistence];
    id v19 = [(EDGroupedSenderQueryHandler *)self messagePersistence];
    id v20 = [(EDGroupedSenderQueryHandler *)self businessCloudStorage];
    id v21 = [(EDGroupedSenderQueryHandler *)self unsubscribeDetector];
    v12 = [(EDGroupedSender *)v16 initWithBusinessID:v10 externalBusinessID:v13 messages:v44 originatingQuery:v17 businessPersistence:v18 messagePersistence:v19 businessCloudStorage:v20 unsubscribeDetector:v21];

    [v46 addGroupedSender:v12];
    [v43 addObject:v12];
  }

  __int16 v22 = [NSNumber numberWithLongLong:a5];
  objc_super v23 = [v46 objectForKeyedSubscript:v22];

  if (v23)
  {
    char v47 = 0;
    uint64_t v24 = [v23 removeMessages:v44 isGroupEmpty:&v47 messageProvider:self];
    if (v47)
    {
      _ef_log_EDGroupedSenderQueryHandler();
      long long v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v49 = v26;
        __int16 v50 = 2048;
        v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = (uint64_t)v23;
        id v27 = v26;
        _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "<%@ %p> Removed messages from group and it's now empty for sender:%{public}@", buf, 0x20u);
      }
      [v46 removeGroupedSender:v23];
    }
    if (v24)
    {
      [v46 updateGroupedSender:v23];
      long long v28 = [v23 objectID];
      [v45 setObject:v24 forKeyedSubscript:v28];

      [v43 addObject:v23];
    }
  }
  uint64_t v29 = [v46 orderedGroupedSendersWithLimit:v39];
  id v30 = [v42 array];
  __int16 v31 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v30];

  [(EDGroupedSenderQueryHandler *)self _filterGroupedSenderChanges:v45 withVisibleSenders:v29];
  if ([v45 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (id)objc_opt_class();
      uint64_t v34 = [v45 count];
      *(_DWORD *)buf = 138412802;
      id v49 = v33;
      __int16 v50 = 2048;
      v51 = self;
      __int16 v52 = 2048;
      uint64_t v53 = v34;
      _os_log_impl(&dword_1DB39C000, v32, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu changed groups (after businessID was changed for messages)", buf, 0x20u);
    }
    v35 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
    uint64_t v36 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    [v35 observer:v36 matchedChangesForObjectIDs:v45];
  }
  v37 = [(EDGroupedSenderQueryHandler *)self _itemIDsWithSectionChangesFrom:v41 to:v31];
  [(EDGroupedSenderQueryHandler *)self _notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:v42 to:v29 forChangedGroups:v43 itemIDsWithSectionChanges:v37 includePrecachedSenders:0 logMessage:@"after businessID was changed for messages"];
}

- (unint64_t)_sectionIndexForGroupedSender:(id)a3 sectionIdentifier:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EDGroupedSenderQueryHandler *)self sectionPredicates];
  unint64_t v8 = +[EDGroupedSenderQueryHandler _sectionIndexForGroupedSender:v6 sectionPredicates:v7 sectionIdentifier:a4];

  return v8;
}

+ (unint64_t)_sectionIndexForGroupedSender:(id)a3 sectionPredicates:(id)a4 sectionIdentifier:(id *)a5
{
  id v7 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__10;
  objc_super v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = *MEMORY[0x1E4F5FDB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__EDGroupedSenderQueryHandler__sectionIndexForGroupedSender_sectionPredicates_sectionIdentifier___block_invoke;
  v11[3] = &unk_1E6C01140;
  id v8 = v7;
  id v12 = v8;
  id v13 = &v15;
  v14 = &v19;
  [a4 enumerateKeysAndObjectsUsingBlock:v11];
  if (a5) {
    *a5 = (id) v20[5];
  }
  unint64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __97__EDGroupedSenderQueryHandler__sectionIndexForGroupedSender_sectionPredicates_sectionIdentifier___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v10 = a3;
  if ([a4 evaluateWithObject:a1[4]])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a5 = 1;
  }
}

+ (id)_comparatorForSortDescriptors:(id)a3 sectionPredicates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = EFComparatorFromSortDescriptors();
  if ([v7 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__EDGroupedSenderQueryHandler__comparatorForSortDescriptors_sectionPredicates___block_invoke;
    aBlock[3] = &unk_1E6C01168;
    id v14 = a1;
    id v12 = v7;
    id v13 = v8;
    unint64_t v9 = _Block_copy(aBlock);
  }
  else
  {
    unint64_t v9 = _Block_copy(v8);
  }

  return v9;
}

uint64_t __79__EDGroupedSenderQueryHandler__comparatorForSortDescriptors_sectionPredicates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 48) _sectionIndexForGroupedSender:v5 sectionPredicates:*(void *)(a1 + 32) sectionIdentifier:0];
  unint64_t v8 = [*(id *)(a1 + 48) _sectionIndexForGroupedSender:v6 sectionPredicates:*(void *)(a1 + 32) sectionIdentifier:0];
  if (v7 == v8)
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F5FDB0];
    uint64_t v11 = -1;
    if (v7 < v8) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    if (v8 != v10) {
      uint64_t v11 = v12;
    }
    if (v7 == v10) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v11;
    }
  }

  return v9;
}

- (void)_messagesWereAdded:(id)a3 toInitialBatch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  [(EDGroupedSenderQueryHandler *)self grouping];
  long long v28 = _groupMessagesBySender(self, v24);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v7 = [v6 limit];

  unint64_t v8 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = v7 & ~(v7 >> 63);
  uint64_t v10 = objc_msgSend(v8, "orderedGroupedSendersWithLimit:", v9, v8);
  uint64_t v11 = [v10 array];
  id v27 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v11];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__EDGroupedSenderQueryHandler__messagesWereAdded_toInitialBatch___block_invoke;
  v29[3] = &unk_1E6C01190;
  v29[4] = self;
  id v12 = v8;
  id v30 = v12;
  id v13 = v26;
  id v31 = v13;
  id v14 = v25;
  id v32 = v14;
  [v28 enumerateKeysAndObjectsUsingBlock:v29];
  uint64_t v15 = [v12 orderedGroupedSendersWithLimit:v9];
  id v16 = [v10 array];
  uint64_t v17 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v16];

  [(EDGroupedSenderQueryHandler *)self _filterGroupedSenderChanges:v13 withVisibleSenders:v15];
  if ([v13 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (id)objc_opt_class();
      uint64_t v20 = [v13 count];
      *(_DWORD *)buf = 138412802;
      id v34 = v19;
      __int16 v35 = 2048;
      uint64_t v36 = self;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu changed groups (after messages were added)", buf, 0x20u);
    }
    uint64_t v21 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
    __int16 v22 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    [v21 observer:v22 matchedChangesForObjectIDs:v13];
  }
  objc_super v23 = [(EDGroupedSenderQueryHandler *)self _itemIDsWithSectionChangesFrom:v27 to:v17];
  [(EDGroupedSenderQueryHandler *)self _notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:v10 to:v15 forChangedGroups:v14 itemIDsWithSectionChanges:v23 includePrecachedSenders:v4 logMessage:@"after messages were added"];
}

void __65__EDGroupedSenderQueryHandler__messagesWereAdded_toInitialBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "ef_filter:", &__block_literal_global_47);

  if ([v7 count])
  {
    unint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [(EDGroupedSender *)v8 addMessages:v7];
      if (v10)
      {
        [*(id *)(a1 + 40) updateGroupedSender:v9];
        uint64_t v11 = *(void **)(a1 + 48);
        id v12 = [(EMObject *)v9 objectID];
        [v11 setObject:v10 forKeyedSubscript:v12];

        [*(id *)(a1 + 56) addObject:v9];
      }
    }
    else
    {
      id v14 = *(void **)(a1 + 32);
      id v30 = v5;
      uint64_t v15 = [v7 firstObject];
      id v16 = [v15 senderAddress];
      uint64_t v10 = [v14 _externalBusinessIDForEmailAddress:v16];

      uint64_t v17 = [EDGroupedSender alloc];
      uint64_t v29 = [v7 firstObject];
      uint64_t v18 = [v29 businessID];
      id v19 = *(void **)(a1 + 32);
      long long v28 = [v19 query];
      uint64_t v20 = [v19 _messageQueryFromGroupedQuery:v28];
      uint64_t v21 = [*(id *)(a1 + 32) businessPersistence];
      __int16 v22 = [*(id *)(a1 + 32) messagePersistence];
      objc_super v23 = [*(id *)(a1 + 32) businessCloudStorage];
      id v24 = [*(id *)(a1 + 32) unsubscribeDetector];
      uint64_t v9 = [(EDGroupedSender *)v17 initWithBusinessID:v18 externalBusinessID:v10 messages:v7 originatingQuery:v20 businessPersistence:v21 messagePersistence:v22 businessCloudStorage:v23 unsubscribeDetector:v24];

      id v5 = v30;
      [*(id *)(a1 + 40) addGroupedSender:v9];
      [*(id *)(a1 + 56) addObject:v9];
    }
  }
  else
  {
    _ef_log_EDGroupedSenderQueryHandler();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v25 = objc_opt_class();
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v32 = v25;
      __int16 v33 = 2048;
      uint64_t v34 = v26;
      __int16 v35 = 2114;
      id v36 = v5;
      id v27 = v25;
      _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "<%@ %p> Avoid creating empty group sender for BusinessID:%{public}@", buf, 0x20u);
    }
  }
}

uint64_t __65__EDGroupedSenderQueryHandler__messagesWereAdded_toInitialBatch___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (void)_messagesWereChanged:(id)a3 previousMessages:(id)a4 forKeyPaths:(id)a5 deleted:(BOOL)a6
{
  BOOL v48 = a6;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v42 = a4;
  id v43 = (__CFString *)a5;
  _ef_log_EDGroupedSenderQueryHandler();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_opt_class();
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    id v63 = v11;
    __int16 v64 = 2048;
    v65 = self;
    __int16 v66 = 2114;
    uint64_t v67 = (uint64_t)v12;
    __int16 v68 = 2114;
    v69 = v43;
    __int16 v70 = 1024;
    BOOL v71 = v48;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "<%@ %p> %{public}@: keyPaths:%{public}@ delete:%{BOOL}d", buf, 0x30u);
  }
  [(EDGroupedSenderQueryHandler *)self grouping];
  v46 = _groupMessagesBySender(self, v47);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v60 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  id v14 = v42;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v58 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v19 = [v18 objectID];
        [v13 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v15);
  }

  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = [(EDMessageRepositoryQueryHandler *)self query];
  uint64_t v21 = [v20 limit];

  id v45 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v22 = v21 & ~(v21 >> 63);
  id v49 = [v45 orderedGroupedSendersWithLimit:v22];
  objc_super v23 = [v49 array];
  id v44 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v23];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __89__EDGroupedSenderQueryHandler__messagesWereChanged_previousMessages_forKeyPaths_deleted___block_invoke;
  v50[3] = &unk_1E6C011E0;
  v50[4] = self;
  id v24 = v45;
  id v51 = v24;
  BOOL v56 = v48;
  id v39 = v13;
  id v52 = v39;
  uint64_t v38 = v43;
  uint64_t v53 = v38;
  id v25 = v41;
  id v54 = v25;
  id v26 = v40;
  id v55 = v26;
  [v46 enumerateKeysAndObjectsUsingBlock:v50];
  id v27 = [v24 orderedGroupedSendersWithLimit:v22];
  long long v28 = [v49 array];
  uint64_t v29 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v28];

  [(EDGroupedSenderQueryHandler *)self _filterGroupedSenderChanges:v25 withVisibleSenders:v27];
  if ([v25 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = (id)objc_opt_class();
      uint64_t v32 = [v25 count];
      __int16 v33 = @"changed";
      *(_DWORD *)buf = 138413058;
      id v63 = v31;
      if (v48) {
        __int16 v33 = @"deleted";
      }
      __int16 v64 = 2048;
      v65 = self;
      __int16 v66 = 2048;
      uint64_t v67 = v32;
      __int16 v68 = 2114;
      v69 = v33;
      _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu changed groups (after messages were %{public}@)", buf, 0x2Au);
    }
    uint64_t v34 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
    __int16 v35 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
    [v34 observer:v35 matchedChangesForObjectIDs:v25];
  }
  id v36 = [(EDGroupedSenderQueryHandler *)self _itemIDsWithSectionChangesFrom:v44 to:v29];
  if (v48) {
    uint64_t v37 = @"after messages were deleted";
  }
  else {
    uint64_t v37 = @"after messages were changed";
  }
  [(EDGroupedSenderQueryHandler *)self _notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:v49 to:v27 forChangedGroups:v26 itemIDsWithSectionChanges:v36 includePrecachedSenders:0 logMessage:v37];
}

void __89__EDGroupedSenderQueryHandler__messagesWereChanged_previousMessages_forKeyPaths_deleted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    unint64_t v8 = v7;
    if (v7)
    {
      if (*(unsigned char *)(a1 + 80))
      {
        char v41 = 0;
        uint64_t v9 = [v7 removeMessages:v6 isGroupEmpty:&v41 messageProvider:*(void *)(a1 + 32)];
        if (v41)
        {
          _ef_log_EDGroupedSenderQueryHandler();
          uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = objc_opt_class();
            uint64_t v12 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            id v43 = v11;
            __int16 v44 = 2048;
            uint64_t v45 = v12;
            __int16 v46 = 2114;
            id v47 = v8;
            id v13 = v11;
            _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "<%@ %p> Remove messages from group and it's now empty for sender:%{public}@", buf, 0x20u);
          }
          [*(id *)(a1 + 40) removeGroupedSender:v8];
        }
      }
      else
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __89__EDGroupedSenderQueryHandler__messagesWereChanged_previousMessages_forKeyPaths_deleted___block_invoke_52;
        v37[3] = &unk_1E6C011B8;
        id v26 = *(id *)(a1 + 48);
        uint64_t v27 = *(void *)(a1 + 32);
        id v38 = v26;
        uint64_t v39 = v27;
        id v40 = *(id *)(a1 + 56);
        long long v28 = objc_msgSend(v6, "ef_map:", v37);
        uint64_t v9 = [v8 changeKeyPaths:*(void *)(a1 + 56) forMessages:v28 messageProvider:*(void *)(a1 + 32)];
      }
      if (v9)
      {
        [*(id *)(a1 + 40) updateGroupedSender:v8];
        uint64_t v29 = *(void **)(a1 + 64);
        id v30 = [v8 objectID];
        [v29 setObject:v9 forKeyedSubscript:v30];

        [*(id *)(a1 + 72) addObject:v8];
      }
    }
    else
    {
      id v14 = *(void **)(a1 + 32);
      __int16 v35 = v5;
      uint64_t v15 = [v6 firstObject];
      uint64_t v16 = [v15 senderAddress];
      id v36 = [v14 _externalBusinessIDForEmailAddress:v16];

      uint64_t v17 = [EDGroupedSender alloc];
      uint64_t v34 = [v6 firstObject];
      uint64_t v18 = [v34 businessID];
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = [v19 query];
      uint64_t v21 = [v19 _messageQueryFromGroupedQuery:v20];
      uint64_t v22 = [*(id *)(a1 + 32) businessPersistence];
      objc_super v23 = [*(id *)(a1 + 32) messagePersistence];
      id v24 = [*(id *)(a1 + 32) businessCloudStorage];
      id v25 = [*(id *)(a1 + 32) unsubscribeDetector];
      unint64_t v8 = [(EDGroupedSender *)v17 initWithBusinessID:v18 externalBusinessID:v36 messages:v6 originatingQuery:v21 businessPersistence:v22 messagePersistence:v23 businessCloudStorage:v24 unsubscribeDetector:v25];

      id v5 = v35;
      [*(id *)(a1 + 40) addGroupedSender:v8];
      [*(id *)(a1 + 72) addObject:v8];
    }
  }
  else
  {
    _ef_log_EDGroupedSenderQueryHandler();
    unint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v31 = objc_opt_class();
      uint64_t v32 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v43 = v31;
      __int16 v44 = 2048;
      uint64_t v45 = v32;
      __int16 v46 = 2114;
      id v47 = v5;
      id v33 = v31;
      _os_log_error_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_ERROR, "<%@ %p> Avoid creating empty group sender for BusinessID:%{public}@", buf, 0x20u);
    }
  }
}

id __89__EDGroupedSenderQueryHandler__messagesWereChanged_previousMessages_forKeyPaths_deleted___block_invoke_52(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)a1[4];
  id v5 = [v3 objectID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    _ef_log_EDGroupedSenderQueryHandler();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = (id)objc_opt_class();
      uint64_t v12 = a1[5];
      uint64_t v11 = a1[6];
      id v13 = objc_msgSend(v3, "ef_publicDescription");
      int v14 = 138413058;
      id v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_error_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_ERROR, "<%@ %p> No previous message for keyPaths:%{public}@ message: %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F60DF0]) initWithFirst:v6 second:v3];

  return v8;
}

- (id)_updateDifference:(id)a3 from:(id)a4 forChangedGroups:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 insertions];
  if ([v10 count] != 1)
  {

    goto LABEL_27;
  }
  uint64_t v11 = [v7 removals];
  uint64_t v12 = [v11 count];

  if (v12 != 1)
  {
LABEL_27:
    id v40 = v7;
    goto LABEL_38;
  }
  id v13 = [v7 insertions];
  int v14 = [v13 firstObject];

  id v15 = [v7 removals];
  id v54 = [v15 firstObject];

  uint64_t v16 = [v14 index];
  if (v16 == [v54 associatedIndex]
    && (uint64_t v17 = [v54 index], v17 == objc_msgSend(v14, "associatedIndex")))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v19 = [v14 index];
    unint64_t v20 = [v14 associatedIndex];
    if (v19 >= v20) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v19;
    }
    unint64_t v52 = v21;
    unint64_t v22 = objc_msgSend(v14, "index", v14);
    unint64_t v23 = [v14 associatedIndex];
    if (v22 <= v23) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = v22;
    }
    id v25 = v14;
    unint64_t v26 = [v14 index];
    unint64_t v27 = [v25 associatedIndex];
    if (v24 <= v52)
    {
LABEL_18:
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v31 = v24 - v52;
      unint64_t v53 = v24 - v52;
      if (v26 >= v27)
      {
        if (v31)
        {
          unint64_t v41 = v24 - 1;
          do
          {
            id v42 = objc_alloc(MEMORY[0x1E4F28F18]);
            id v43 = [v18 objectAtIndexedSubscript:v41 - v52];
            __int16 v44 = (void *)[v42 initWithObject:v43 type:1 index:v41 + 1 associatedIndex:v41];

            [v30 addObject:v44];
            --v41;
          }
          while (v41 - v52 != -1);
          if (v53)
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              id v46 = objc_alloc(MEMORY[0x1E4F28F18]);
              id v47 = [v18 objectAtIndexedSubscript:i];
              uint64_t v48 = (void *)[v46 initWithObject:v47 type:0 index:v52 + i associatedIndex:v52 + i + 1];

              [v30 addObject:v48];
            }
          }
        }
      }
      else if (v31)
      {
        unint64_t v32 = v24 - 1;
        do
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28F18]);
          uint64_t v34 = [v18 objectAtIndexedSubscript:v32 - v52];
          __int16 v35 = (void *)[v33 initWithObject:v34 type:1 index:v32 associatedIndex:v32 + 1];

          [v30 addObject:v35];
          --v32;
        }
        while (v32 - v52 != -1);
        if (v53)
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            id v37 = objc_alloc(MEMORY[0x1E4F28F18]);
            id v38 = [v18 objectAtIndexedSubscript:j];
            uint64_t v39 = objc_msgSend(v37, "initWithObject:type:index:associatedIndex:", v38, 0, v52 + j + 1);

            [v30 addObject:v39];
          }
        }
      }
      uint64_t v49 = [objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v30];

      id v7 = (id)v49;
    }
    else
    {
      unint64_t v28 = v52;
      while (1)
      {
        uint64_t v29 = v26 < v27 ? v28 : v28 + 1;
        id v30 = [v8 objectAtIndexedSubscript:v29];
        if (([v9 containsObject:v30] & 1) == 0) {
          break;
        }
        [v18 addObject:v30];
        ++v28;

        if (v24 == v28) {
          goto LABEL_18;
        }
      }
    }
    id v40 = v7;

    int v14 = v51;
  }
  else
  {
    id v40 = v7;
  }

LABEL_38:

  return v40;
}

- (void)_notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:(id)a3 to:(id)a4 forChangedGroups:(id)a5 itemIDsWithSectionChanges:(id)a6 includePrecachedSenders:(BOOL)a7 logMessage:(id)a8
{
  BOOL v49 = a7;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v44 = a6;
  id v50 = a8;
  id v46 = v14;
  unint64_t v41 = v13;
  id v42 = v15;
  uint64_t v16 = [v14 differenceFromOrderedSet:v13 withOptions:4];
  id v51 = self;
  uint64_t v17 = [(EDGroupedSenderQueryHandler *)self _updateDifference:v16 from:v13 forChangedGroups:v15];

  uint64_t v45 = v17;
  id v18 = objc_msgSend(v17, "ef_removalsExcludingMoves");
  unint64_t v19 = objc_msgSend(v18, "ef_map:", &__block_literal_global_72);

  id v43 = v19;
  if ([v19 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    unint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (id)objc_opt_class();
      uint64_t v22 = [v43 count];
      unint64_t v23 = loggableIdentifiers(v43);
      *(_DWORD *)buf = 138413314;
      id v71 = v21;
      __int16 v72 = 2048;
      v73 = v51;
      __int16 v74 = 2048;
      uint64_t v75 = v22;
      __int16 v76 = 2114;
      id v77 = v50;
      __int16 v78 = 2114;
      v79 = v23;
      _os_log_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu deleted groups (%{public}@):\n%{public}@", buf, 0x34u);
    }
    unint64_t v24 = [(EDGroupedSenderQueryHandler *)v51 resultsObserverIfUncanceled];
    id v25 = [(EDMessageRepositoryQueryHandler *)v51 observationIdentifier];
    [v24 observer:v25 matchedDeletedObjectIDs:v43];
  }
  unint64_t v26 = (void *)[v44 mutableCopy];
  objc_msgSend(v45, "ef_groupedInsertionsByObjectForTargetOrderedSet:inferMoves:", v14, 1);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v27)
  {
    uint64_t v48 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v65 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v30 = [v29 objects];
        unint64_t v31 = [v29 previousObject];
        if ([v29 isMove])
        {
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_73;
          v62[3] = &unk_1E6C01228;
          v62[4] = v51;
          id v63 = v50;
          [(EDGroupedSenderQueryHandler *)v51 _notifyObserversOfMovedSenders:v30 previousSender:v31 includePrecachedSenders:v49 notifyBlock:v62];
        }
        else
        {
          unint64_t v32 = [(EDGroupedSenderQueryHandler *)v51 _senderItemIDsBySectionForSenders:v30];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_75;
          v60[3] = &unk_1E6C01228;
          v60[4] = v51;
          id v61 = v50;
          [(EDGroupedSenderQueryHandler *)v51 _notifyObserversOfInsertedSenders:v30 senderItemIDsBySection:v32 previousSender:v31 includePrecachedSenders:v49 notifyBlock:v60];
        }
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v33 = [v29 objects];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v57 != v35) {
                objc_enumerationMutation(v33);
              }
              id v37 = [*(id *)(*((void *)&v56 + 1) + 8 * j) itemID];
              [v26 removeObject:v37];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v34);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v27);
  }

  if ([v26 count])
  {
    _ef_log_EDGroupedSenderQueryHandler();
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = (id)objc_opt_class();
      uint64_t v40 = [v26 count];
      *(_DWORD *)buf = 138413314;
      id v71 = v39;
      __int16 v72 = 2048;
      v73 = v51;
      __int16 v74 = 2048;
      uint64_t v75 = v40;
      __int16 v76 = 2114;
      id v77 = v50;
      __int16 v78 = 2114;
      v79 = v26;
      _os_log_impl(&dword_1DB39C000, v38, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu additional groups with section changes (%{public}@):\n%{public}@", buf, 0x34u);
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_76;
    v52[3] = &unk_1E6C01250;
    id v53 = v26;
    id v54 = v51;
    id v55 = v46;
    [v55 enumerateObjectsUsingBlock:v52];
  }
}

id __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 object];
  id v3 = [v2 objectID];

  return v3;
}

void __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_73(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _ef_log_EDGroupedSenderQueryHandler();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [v7 count];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = loggableIdentifiers(v7);
    int v18 = 138413570;
    id v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu groups moved after %{public}@ (%{public}@):\n%{public}@", (uint8_t *)&v18, 0x3Eu);
  }
  uint64_t v16 = [*(id *)(a1 + 32) resultsObserverIfUncanceled];
  uint64_t v17 = [*(id *)(a1 + 32) observationIdentifier];
  [v16 observer:v17 matchedMovedObjectIDs:v7 after:v8 extraInfo:v9];
}

void __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_75(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  _ef_log_EDGroupedSenderQueryHandler();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [v7 count];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = loggableIdentifiers(v7);
    int v18 = 138413570;
    id v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu groups inserted after %{public}@ (%{public}@):\n%{public}@", (uint8_t *)&v18, 0x3Eu);
  }
  uint64_t v16 = [*(id *)(a1 + 32) resultsObserverIfUncanceled];
  uint64_t v17 = [*(id *)(a1 + 32) observationIdentifier];
  [v16 observer:v17 matchedAddedObjectIDs:v7 after:v8 extraInfo:v9];
}

void __171__EDGroupedSenderQueryHandler__notifyResultsObserverOfChangesToVisibleGroupedSendersFrom_to_forChangedGroups_itemIDsWithSectionChanges_includePrecachedSenders_logMessage___block_invoke_76(uint64_t a1, void *a2, char *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 itemID];
  LOBYTE(v6) = [v6 containsObject:v7];

  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    v18[0] = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v10 = [v8 _senderItemIDsBySectionForSenders:v9];

    id v11 = [*(id *)(a1 + 40) _extraInfoForSenderItemIDsBySection:v10 includePrecachedSendersFromSenders:0];
    if (a3)
    {
      a3 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 - 1];
    }
    uint64_t v12 = [*(id *)(a1 + 40) resultsObserverIfUncanceled];
    uint64_t v13 = [*(id *)(a1 + 40) observationIdentifier];
    uint64_t v14 = [v5 objectID];
    uint64_t v17 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v16 = [a3 objectID];
    [v12 observer:v13 matchedMovedObjectIDs:v15 after:v16 extraInfo:v11];
  }
}

- (void)_notifyObserversOfMovedSenders:(id)a3 previousSender:(id)a4 includePrecachedSenders:(BOOL)a5 notifyBlock:(id)a6
{
  BOOL v9 = a5;
  id v24 = a3;
  id v12 = a4;
  id v25 = a6;
  id v13 = v12;
  uint64_t v23 = v13;
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v24, 0);
  while ([v14 count])
  {
    id v15 = [v14 lastObject];
    [v14 removeLastObject];
    uint64_t v16 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v15];
    if ((unint64_t)[v15 count] >= 2)
    {
      uint64_t v17 = [v16 count];
      if (v17 == 1
        && ([v16 allValues],
            id v6 = objc_claimAutoreleasedReturnValue(),
            [v6 firstObject],
            id v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v18 = [v7 count],
            v18 == [v24 count]))
      {
      }
      else
      {
        uint64_t v19 = [v16 count];
        if (v17 == 1)
        {
        }
        if (v19)
        {
          unint64_t v20 = [v15 count];
          uint64_t v21 = objc_msgSend(v15, "ef_suffix:", v20 - (v20 >> 1));
          [v14 addObject:v21];

          __int16 v22 = objc_msgSend(v15, "ef_prefix:", v20 >> 1);
          [v14 addObject:v22];
          goto LABEL_12;
        }
      }
    }
    [(EDGroupedSenderQueryHandler *)self _notifyObserversOfInsertedSenders:v15 senderItemIDsBySection:v16 previousSender:v13 includePrecachedSenders:v9 notifyBlock:v25];
    [v15 lastObject];
    __int16 v22 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  }
}

- (void)_notifyObserversOfInsertedSenders:(id)a3 senderItemIDsBySection:(id)a4 previousSender:(id)a5 includePrecachedSenders:(BOOL)a6 notifyBlock:(id)a7
{
  BOOL v8 = a6;
  id v18 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void *, void *, void *))a7;
  uint64_t v14 = [a5 objectID];
  id v15 = objc_msgSend(v18, "ef_mapSelector:", sel_objectID);
  if (v8) {
    id v16 = v18;
  }
  else {
    id v16 = 0;
  }
  uint64_t v17 = [(EDGroupedSenderQueryHandler *)self _extraInfoForSenderItemIDsBySection:v12 includePrecachedSendersFromSenders:v16];
  v13[2](v13, v15, v14, v17);
}

- (id)_senderItemIDsBySectionForSenders:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__EDGroupedSenderQueryHandler__senderItemIDsBySectionForSenders___block_invoke;
  v6[3] = &unk_1E6C01278;
  v6[4] = self;
  id v3 = objc_msgSend(a3, "ef_groupBy:", v6);
  BOOL v4 = objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_83);

  return v4;
}

id __65__EDGroupedSenderQueryHandler__senderItemIDsBySectionForSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 _sectionIndexForGroupedSender:a2 sectionIdentifier:&v5];
  id v3 = v5;

  return v3;
}

id __65__EDGroupedSenderQueryHandler__senderItemIDsBySectionForSenders___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ef_mapSelector:", sel_itemID);

  return v2;
}

- (id)_extraInfoForSenderItemIDsBySection:(id)a3 includePrecachedSendersFromSenders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  BOOL v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, *MEMORY[0x1E4F5FDB8], 0);
  if (v7)
  {
    id v10 = [(EDMessageRepositoryQueryHandler *)self query];
    id v11 = [v10 targetClassOptions];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F5FF88]];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v13)
    {
      uint64_t v14 = objc_msgSend(v7, "ef_prefix:", v13);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __102__EDGroupedSenderQueryHandler__extraInfoForSenderItemIDsBySection_includePrecachedSendersFromSenders___block_invoke;
      v17[3] = &unk_1E6C012C0;
      v17[4] = self;
      id v15 = objc_msgSend(v14, "ef_map:", v17);

      if ([v15 count]) {
        [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F5FDA8]];
      }
    }
  }

  return v9;
}

id __102__EDGroupedSenderQueryHandler__extraInfoForSenderItemIDsBySection_includePrecachedSendersFromSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _groupedSenderForEDGroupedSender:a2];

  return v2;
}

- (id)_itemIDsWithSectionChangesFrom:(id)a3 to:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v8 = [v24 allKeys];
  __int16 v22 = (void *)[v7 initWithArray:v8];

  BOOL v9 = [v5 allKeys];
  [v22 addObjectsFromArray:v9];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v22;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        id v15 = [v24 objectForKeyedSubscript:v13];
        id v16 = (void *)[v14 initWithArray:v15];

        id v17 = objc_alloc(MEMORY[0x1E4F1CA80]);
        id v18 = [v5 objectForKeyedSubscript:v13];
        uint64_t v19 = (void *)[v17 initWithArray:v18];

        if (([v16 isEqualToSet:v19] & 1) == 0)
        {
          unint64_t v20 = (void *)[v16 mutableCopy];
          [v20 minusSet:v19];
          [v19 minusSet:v16];
          [v6 unionSet:v20];
          [v6 unionSet:v19];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)_filterGroupedSenderChanges:(id)a3 withVisibleSenders:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_90_0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__EDGroupedSenderQueryHandler__filterGroupedSenderChanges_withVisibleSenders___block_invoke_2;
  v9[3] = &unk_1E6C01308;
  id v10 = v7;
  id v8 = v7;
  objc_msgSend(v5, "ef_removeObjectsPassingTest:", v9);
}

id __78__EDGroupedSenderQueryHandler__filterGroupedSenderChanges_withVisibleSenders___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];

  return v2;
}

uint64_t __78__EDGroupedSenderQueryHandler__filterGroupedSenderChanges_withVisibleSenders___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_messageQueryFromGroupedQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v5 = objc_opt_class();
  id v6 = [v3 predicate];
  id v7 = [v3 sortDescriptors];
  id v8 = objc_msgSend(v4, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v5, v6, v7, objc_msgSend(v3, "queryOptions"), 0);

  return v8;
}

- (BOOL)_queryHelperIsCurrent:(id)a3
{
  id v4 = a3;
  id v5 = [(EDGroupedSenderQueryHandler *)self messageQueryHelper];
  LOBYTE(self) = v5 == v4;

  return (char)self;
}

- (id)_externalBusinessIDForEmailAddress:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v6 = [v5 preferredGroupedSenderGrouping];

  id v7 = [(EDGroupedSenderQueryHandler *)self businessPersistence];
  id v8 = [v7 businessExternalIDForEmailAddress:v4 grouping:v6];

  return v8;
}

- (id)messagesForGroupedSender:(id)a3 limit:(int64_t)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F60390], "predicateForMessagesForBusinessID:", objc_msgSend(v6, "businessID"));
    BOOL v9 = [(EDGroupedSenderQueryHandler *)self messageQueryHelper];
    v27[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    uint64_t v11 = [v9 messagesWithAdditionalPredicates:v10 limit:a4];

    if (![v11 count])
    {
      _ef_log_EDGroupedSenderQueryHandler();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = (id)objc_opt_class();
        id v15 = [(EDGroupedSenderQueryHandler *)self messageQueryHelper];
        id v16 = [v15 query];
        int v17 = 138413314;
        id v18 = v14;
        __int16 v19 = 2048;
        unint64_t v20 = self;
        __int16 v21 = 2114;
        __int16 v22 = v7;
        __int16 v23 = 2048;
        int64_t v24 = a4;
        __int16 v25 = 2114;
        long long v26 = v16;
        _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "<%@ %p> found 0 messages for grouped sender:%{public}@ limit:%ld query:%{public}@", (uint8_t *)&v17, 0x34u);
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)groupedSenderForObjectID:(id)a3 isPersisted:(BOOL *)a4 error:(id *)a5
{
  id v7 = -[EDGroupedSenderQueryHandler _groupedSenderForObjectID:](self, "_groupedSenderForObjectID:", a3, a4, a5);
  id v8 = [(EDGroupedSenderQueryHandler *)self _groupedSenderForEDGroupedSender:v7];
  if (a4) {
    *a4 = 0;
  }

  return v8;
}

- (void)updatedBusinessesWithExternalIDs:(id)a3 removedBusinessesWithExternalIDs:(id)a4
{
  id v7 = a4;
  id v6 = (void *)[a3 mutableCopy];
  objc_msgSend(v6, "ef_addAbsentObjectsFromArrayAccordingToEquals:", v7);
  [(EDGroupedSenderQueryHandler *)self updateUnseenCountsForBusinessesWithExternalIDs:v6];
}

- (void)persistenceIsMergingBusinessID:(int64_t)a3 intoBusinessID:(int64_t)a4
{
  id v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];
  id v11 = [v7 objectForKeyedSubscript:@"EDGroupedSenderQueryHandler.mergedBusinesses"];

  id v8 = v11;
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
    BOOL v9 = [MEMORY[0x1E4F29060] currentThread];
    id v10 = [v9 threadDictionary];
    [v10 setObject:v12 forKeyedSubscript:@"EDGroupedSenderQueryHandler.mergedBusinesses"];

    id v8 = v12;
  }
  id v13 = v8;
  [v8 setObject:a4 forKey:a3];
}

- (void)_persistenceDidFinishMergingBusinesses
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  id v4 = [v3 threadDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"EDGroupedSenderQueryHandler.mergedBusinesses"];

  id v6 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v6 threadDictionary];
  [v7 setObject:0 forKeyedSubscript:@"EDGroupedSenderQueryHandler.mergedBusinesses"];

  if ([v5 count])
  {
    id v8 = [(id)objc_opt_class() resolveMergePathsForMergedBusinesses:v5];

    BOOL v9 = [(EDMessageRepositoryQueryHandler *)self query];
    uint64_t v10 = [v9 limit];

    id v11 = [(EDGroupedSenderQueryHandler *)self groupedSenders];
    uint64_t v12 = v10 & ~(v10 >> 63);
    id v13 = objc_msgSend(v11, "orderedGroupedSendersWithLimit:", v12, v11);
    id v14 = [v13 array];
    id v15 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v14];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__EDGroupedSenderQueryHandler__persistenceDidFinishMergingBusinesses__block_invoke;
    v28[3] = &unk_1E6C01350;
    id v17 = v11;
    id v29 = v17;
    id v18 = v16;
    id v30 = v18;
    unint64_t v31 = self;
    enumerateBusinessesInMapTable(v8, v28);
    __int16 v19 = [v17 orderedGroupedSendersWithLimit:v12];
    unint64_t v20 = [v13 array];
    __int16 v21 = [(EDGroupedSenderQueryHandler *)self _senderItemIDsBySectionForSenders:v20];

    [(EDGroupedSenderQueryHandler *)self _filterGroupedSenderChanges:v18 withVisibleSenders:v19];
    if ([v18 count])
    {
      _ef_log_EDGroupedSenderQueryHandler();
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = (id)objc_opt_class();
        uint64_t v24 = [v18 count];
        *(_DWORD *)buf = 138412802;
        id v33 = v23;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v36 = 2048;
        uint64_t v37 = v24;
        _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "<%@ %p> Notifying observer of %lu changed groups (after groups were merged)", buf, 0x20u);
      }
      __int16 v25 = [(EDGroupedSenderQueryHandler *)self resultsObserverIfUncanceled];
      long long v26 = [(EDMessageRepositoryQueryHandler *)self observationIdentifier];
      [v25 observer:v26 matchedChangesForObjectIDs:v18];
    }
    long long v27 = [(EDGroupedSenderQueryHandler *)self _itemIDsWithSectionChangesFrom:v15 to:v21];
    [(EDGroupedSenderQueryHandler *)self _notifyResultsObserverOfChangesToVisibleGroupedSendersFrom:v13 to:v19 forChangedGroups:0 itemIDsWithSectionChanges:v27 includePrecachedSenders:0 logMessage:@"after groups were merged"];
  }
  else
  {
    id v8 = v5;
  }
}

void __69__EDGroupedSenderQueryHandler__persistenceDidFinishMergingBusinesses__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithLongLong:a2];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    BOOL v9 = *(void **)(a1 + 32);
    uint64_t v10 = [NSNumber numberWithLongLong:a3];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      uint64_t v12 = [v8 messages];
      id v13 = [v11 addMessages:v12];

      [*(id *)(a1 + 32) updateGroupedSender:v11];
      if (v13)
      {
        id v14 = *(void **)(a1 + 40);
        id v15 = [v11 objectID];
        [v14 setObject:v13 forKeyedSubscript:v15];
      }
    }
    else
    {
      __int16 v34 = [v8 externalBusinessID];
      __int16 v19 = [v8 messages];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        _ef_log_EDGroupedSenderQueryHandler();
        __int16 v21 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v29 = objc_opt_class();
          uint64_t v30 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          __int16 v36 = v29;
          __int16 v37 = 2048;
          uint64_t v38 = v30;
          __int16 v39 = 2114;
          uint64_t v40 = v8;
          id v31 = v29;
          _os_log_error_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_ERROR, "<%@ %p> Finished Merging Businesses: Found empty messages with old grouped sender:%{public}@", buf, 0x20u);
        }
      }
      __int16 v22 = [EDGroupedSender alloc];
      id v33 = [v8 messages];
      id v23 = *(void **)(a1 + 48);
      unint64_t v32 = [v23 query];
      uint64_t v24 = objc_msgSend(v23, "_messageQueryFromGroupedQuery:");
      __int16 v25 = [*(id *)(a1 + 48) businessPersistence];
      long long v26 = [*(id *)(a1 + 48) messagePersistence];
      long long v27 = [*(id *)(a1 + 48) businessCloudStorage];
      long long v28 = [*(id *)(a1 + 48) unsubscribeDetector];
      id v11 = [(EDGroupedSender *)v22 initWithBusinessID:a3 externalBusinessID:v34 messages:v33 originatingQuery:v24 businessPersistence:v25 messagePersistence:v26 businessCloudStorage:v27 unsubscribeDetector:v28];

      [*(id *)(a1 + 32) addGroupedSender:v11];
    }
    [*(id *)(a1 + 32) removeGroupedSender:v8];
  }
  else
  {
    _ef_log_EDGroupedSenderQueryHandler();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v16 = objc_opt_class();
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      __int16 v36 = v16;
      __int16 v37 = 2048;
      uint64_t v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = a2;
      id v18 = v16;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_INFO, "<%@ %p> Ignoring business ID %lld being merged because it does not exist in our groups", buf, 0x20u);
    }
  }
}

+ (id)resolveMergePathsForMergedBusinesses:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__EDGroupedSenderQueryHandler_resolveMergePathsForMergedBusinesses___block_invoke;
  v12[3] = &unk_1E6C013A0;
  id v7 = v6;
  id v13 = v7;
  SEL v15 = a2;
  id v16 = a1;
  id v8 = v5;
  id v14 = v8;
  enumerateBusinessesInMapTable(v8, v12);
  BOOL v9 = v14;
  id v10 = v7;

  return v10;
}

void __68__EDGroupedSenderQueryHandler_resolveMergePathsForMergedBusinesses___block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  if (NSMapGet(*(NSMapTable **)(a1 + 32), a2)) {
    return;
  }
  if (a2 == a3)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"EDGroupedSenderQueryHandler-BlackPearlUI.m" lineNumber:910 description:@"Cycle while merging businesses"];
  }
  id v6 = NSMapGet(*(NSMapTable **)(a1 + 32), a3);
  if (v6)
  {
    id v7 = v6;
    id v8 = *(void **)(a1 + 32);
    [v8 setObject:v7 forKey:a2];
    return;
  }
  id v9 = 0;
  while (1)
  {
    id v10 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
    id v11 = v10;
    if (!v10) {
      break;
    }
    if (v10 == a2)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"EDGroupedSenderQueryHandler-BlackPearlUI.m" lineNumber:924 description:@"Cycle while merging businesses"];

      if (v9) {
        goto LABEL_13;
      }
LABEL_12:
      id v9 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
      goto LABEL_13;
    }
    if (!v9) {
      goto LABEL_12;
    }
LABEL_13:
    [v9 addIndex:a3];
    if ([v9 containsIndex:v11])
    {
      SEL v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"EDGroupedSenderQueryHandler-BlackPearlUI.m" lineNumber:931 description:@"Cycle while merging businesses"];
    }
    uint64_t v12 = NSMapGet(*(NSMapTable **)(a1 + 32), v11);
    id v13 = v12;
    a3 = v11;
    if (v12)
    {
      a3 = v12;
      goto LABEL_20;
    }
  }
  id v13 = (void *)a3;
LABEL_20:
  [*(id *)(a1 + 32) setObject:v13 forKey:a2];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__EDGroupedSenderQueryHandler_resolveMergePathsForMergedBusinesses___block_invoke_2;
  v17[3] = &unk_1E6C01378;
  id v18 = *(id *)(a1 + 32);
  __int16 v19 = a3;
  [v9 enumerateIndexesUsingBlock:v17];
}

uint64_t __68__EDGroupedSenderQueryHandler_resolveMergePathsForMergedBusinesses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (void)setBusinessPersistence:(id)a3
{
}

- (EDBusinessCloudStorage)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (void)setBusinessCloudStorage:(id)a3
{
}

- (EDMessageQueryHelper)messageQueryHelper
{
  return self->_messageQueryHelper;
}

- (void)setMessageQueryHelper:(id)a3
{
}

- (_EDGroupedSenderList)groupedSenders
{
  return self->_groupedSenders;
}

- (void)setGroupedSenders:(id)a3
{
}

- (EFOrderedDictionary)sectionPredicates
{
  return self->_sectionPredicates;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
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

- (BOOL)keepMessagesInListOnBucketChange
{
  return self->_keepMessagesInListOnBucketChange;
}

- (void)setKeepMessagesInListOnBucketChange:(BOOL)a3
{
  self->_keepMessagesInListOnBucketChange = a3;
}

- (int64_t)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(int64_t)a3
{
  self->_grouping = a3;
}

- (EMListUnsubscribeDetector)unsubscribeDetector
{
  return self->_unsubscribeDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsubscribeDetector, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_sectionPredicates, 0);
  objc_storeStrong((id *)&self->_groupedSenders, 0);
  objc_storeStrong((id *)&self->_messageQueryHelper, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end