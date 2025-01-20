@interface EDMessageRepository
+ (OS_os_log)log;
+ (id)signpostLog;
- (EDAccountsProvider)accountsProvider;
- (EDActivityPersistence)activityPersistence;
- (EDAttachmentPersistenceManager)attachmentPersistenceManager;
- (EDBusinessCloudStorage)businessCloudStorage;
- (EDBusinessPersistence)businessPersistence;
- (EDCategoryCoreAnalyticsLogger)categoryAnalyticsLogger;
- (EDCategoryPersistence)categoryPersistence;
- (EDConversationPersistence)conversationPersistence;
- (EDFetchController)fetchController;
- (EDListUnsubscribeHandler)listUnsubscribeHandler;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMessageChangeManager)messageChangeManager;
- (EDMessagePersistence)messagePersistence;
- (EDMessageRepository)initWithMessagePersistence:(id)a3 conversationPersistence:(id)a4 threadPersistence:(id)a5 remoteContentPersistence:(id)a6 messageChangeManager:(id)a7 richLinkPersistence:(id)a8 attachmentPersistenceManager:(id)a9 categoryPersistence:(id)a10 senderPersistence:(id)a11 activityPersistence:(id)a12 businessPersistence:(id)a13 businessCloudStorage:(id)a14 hookRegistry:(id)a15 mailboxPersistence:(id)a16 searchProvider:(id)a17 userProfileProvider:(id)a18 vipManager:(id)a19 fetchController:(id)a20 observerResumer:(id)a21 remoteContentManager:(id)a22 remoteContentCacheConfiguration:(id)a23 blockedSenderManager:(id)a24 listUnsubscribeHandler:(id)a25 remindMeNotificationController:(id)a26 accountsProvider:(id)a27;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDRemindMeNotificationController)remindMeNotificationController;
- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration;
- (EDRemoteContentManager)remoteContentManager;
- (EDRemoteContentPersistence)remoteContentPersistence;
- (EDResumable)observerResumer;
- (EDRichLinkPersistence)richLinkPersistence;
- (EDSearchProvider)searchProvider;
- (EDSenderPersistence)senderPersistence;
- (EDThreadPersistence)threadPersistence;
- (EDVIPManager)vipManager;
- (EDWebContentParser)remoteContentParser;
- (EFLocked)oneTimeCodeObservers;
- (EFScheduler)asyncWorkScheduler;
- (EFScheduler)delayedMessageActionScheduler;
- (EFScheduler)messageListItemScheduler;
- (EFScheduler)updateThrottlerResetScheduler;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMUserProfileProvider)userProfileProvider;
- (NSConditionLock)performQueryOnSerializationQueue;
- (NSMutableDictionary)queryHandlers;
- (NSMutableDictionary)queryHandlersByThreadScope;
- (NSMutableSet)handlerTokens;
- (NSSet)test_activeQueryCancelationTokens;
- (NSUserDefaults)sharedOneTimeCodeUserDefaults;
- (OS_dispatch_queue)contentProtectionQueue;
- (OS_dispatch_queue)serializationQueue;
- (id)_changeFlagsForPersistedMessages:(id)a3 flagChange:(id)a4 returnUndoAction:(BOOL)a5;
- (id)_createGroupedSenderQueryHandlerForQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5;
- (id)_descriptionStringForMessageListItems:(id)a1;
- (id)_dictForPasswordsIcon;
- (id)_findMessagesForAddresses:(id)a3;
- (id)_messageForSenderInICloud:(id)a3;
- (id)_messageHeadersForBusinessID:(int64_t)a3;
- (id)_messageQueryForBusinessInIcloudCheckForBusinessID:(int64_t)a3 forAccount:(id)a4;
- (id)_messageQueryForGroupedSenderObjectIDs:(id)a3;
- (id)_messageQueryForSenderInICloud:(id)a3 forAccount:(id)a4;
- (id)_mostRecentMessageForPersistedMessages:(id)a3;
- (id)_partitionObjectIDs:(id)a3;
- (id)_performBlockSender:(BOOL)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5;
- (id)_performConversationIDs:(id)a3 conversationNotificationLevel:(int64_t)a4 returnUndoAction:(BOOL)a5;
- (id)_performMessageConversationFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performMessageFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performMessageFollowUpAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performMessageFollowUpDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5;
- (id)_performMessageReadLaterAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performMessageReadLaterDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5;
- (id)_performMessageTransferAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performMessageTransferActionToSpecialMailbox:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performSenderBlockingAction:(id)a3 returnUndoAction:(BOOL)a4;
- (id)_performUndoAction:(id)a3;
- (id)_persistedMessagesForMessageChangeAction:(id)a3;
- (id)_persistedMessagesForObjectIDs:(id)a3 includeDuplicates:(BOOL)a4;
- (id)_persistedObjectIDsForObjectIDs:(id)a3;
- (id)_threadScopeFromObjectID:(void *)a1;
- (id)_undoActionsForMovedMessages:(id)a3;
- (id)mailboxPredictionController;
- (id)messageReconciliationQueries;
- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7;
- (id)threadReconciliationQueries;
- (id)updateThrottlerResetBlock;
- (int64_t)oneTimeCodeMessageID;
- (unint64_t)signpostID;
- (void)_accountActiveStateDidChange:(id)a3 stateStringForLogging:(id)a4;
- (void)_broadcastOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7;
- (void)_enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:(id)a3 usingBlock:(id)a4 failureBlock:(id)a5;
- (void)_enumerateObjectIDsByScope:(id)a3 usingBlock:(id)a4;
- (void)_logCategoryMetadataForChangeAction:(id)a3;
- (void)_logRecategorizeAnalyticsWithPersistedMessages:(id)a3 isRestoreModelCategory:(BOOL)a4 categoryChangeAction:(id)a5;
- (void)_performCategoryChangeAction:(id)a3;
- (void)_performCloudStorageUpdateForBusiness:(int64_t)a3 withCategory:(unint64_t)a4 lastModifiedDate:(id)a5;
- (void)_performMessageDeleteAction:(id)a3;
- (void)_performMessageDeleteAllAction:(id)a3;
- (void)_performMessageFlagChangeAllAction:(id)a3;
- (void)_performMessageTransferAllAction:(id)a3;
- (void)_performMessageTransferAllActionToSpecialMailbox:(id)a3;
- (void)_performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7;
- (void)_performRestoreModelCategoryForAllMessagesChangeAction:(id)a3;
- (void)_performSuppressNotAuthenticatedChangeAction:(id)a3;
- (void)_performUnsubscribeAction:(id)a3;
- (void)_recategorizeMessagesForQuery:(id)a3 completion:(id)a4;
- (void)_removeCategoryCloudStorageForBusiness:(int64_t)a3 lastModifiedDate:(id)a4;
- (void)_requestSummariesIfNeededForMessageListItems:(id)a3 additionalObjectIDs:(id)a4 queryHandler:(id)a5 observationIdentifier:(id)a6;
- (void)_resetUpdateThrottlersWithLogMessage:(id)a3;
- (void)_syncRuleToWebForMessages:(id)a3 withCategory:(unint64_t)a4 atTimestamp:(id)a5 restoreModelCategory:(BOOL)a6;
- (void)_triggerMigrationForThreadScopes:(id)a3;
- (void)accountBecameActive:(id)a3;
- (void)accountBecameInactive:(id)a3;
- (void)brandIndicatorForLocation:(id)a3 completionHandler:(id)a4;
- (void)cancelAllHandlers;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)countOfUserOverridesWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7;
- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 completionHandler:(id)a5;
- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6;
- (void)getURLCacheInformationWithCompletion:(id)a3;
- (void)isDataAccessible:(id)a3;
- (void)loadOlderMessagesForMailboxes:(id)a3;
- (void)logCategoryMetadataForObjectIDs:(id)a3;
- (void)mailOnBoardDeleteVerificationCodesMessage:(id)a3 completionHandler:(id)a4;
- (void)messageListItemsForObjectIDs:(id)a3 requestID:(unint64_t)a4 observationIdentifier:(id)a5 loadSummaryForAdditionalObjectIDs:(id)a6 completionHandler:(id)a7;
- (void)messageObjectIDForURL:(id)a3 completionHandler:(id)a4;
- (void)messageObjectIDsForSearchableItemIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)metadataForAddresses:(id)a3 completionHandler:(id)a4;
- (void)noteViewOfRemoteContentLinks:(id)a3;
- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 requestID:(unint64_t)a4 completionHandler:(id)a5;
- (void)performCountQuery:(id)a3 completionHandler:(id)a4;
- (void)performMessageChangeAction:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 completionHandler:(id)a6;
- (void)performMessageHighImpactChangeAction:(id)a3;
- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 afterDelay:(double)a6 completionHandler:(id)a7;
- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5;
- (void)performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7;
- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4;
- (void)persistentIDForMessageObjectID:(id)a3 completionHandler:(id)a4;
- (void)predictMailboxForMovingMessages:(id)a3 withObserver:(id)a4 completionHandler:(id)a5;
- (void)recategorizeMessageSinceDate:(id)a3;
- (void)recategorizeMessagesForQuery:(id)a3 completion:(id)a4;
- (void)removeAllEntriesFromBusinessCloudStorage;
- (void)requestAttachmentMetadataForMessageIDs:(id)a3 completionHandler:(id)a4;
- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5;
- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4;
- (void)resetPrecomputedThreadScopesForMailboxScope:(id)a3;
- (void)setActivityPersistence:(id)a3;
- (void)setAttachmentPersistenceManager:(id)a3;
- (void)setBusinessCloudStorage:(id)a3;
- (void)setBusinessPersistence:(id)a3;
- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5;
- (void)setCategoryPersistence:(id)a3;
- (void)setHandlerTokens:(id)a3;
- (void)setHookRegistry:(id)a3;
- (void)setMessageChangeManager:(id)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setOneTimeCodeMessageID:(int64_t)a3;
- (void)setOneTimeCodeObservers:(id)a3;
- (void)setQueryHandlers:(id)a3;
- (void)setQueryHandlersByThreadScope:(id)a3;
- (void)setRichLinkPersistence:(id)a3;
- (void)setSenderPersistence:(id)a3;
- (void)setSharedOneTimeCodeUserDefaults:(id)a3;
- (void)setThreadPersistence:(id)a3;
- (void)setUpdateThrottlerResetBlock:(id)a3;
- (void)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5 completionHandler:(id)a6;
- (void)startObservingOneTimeCode:(id)a3 completionHandler:(id)a4;
- (void)test_tearDown;
- (void)threadQueryHandlerStateDidChange:(id)a3;
- (void)updateLastSeenDate:(id)a3 andDisplayDate:(id)a4 forBusinessWithEmailAddress:(id)a5 category:(id)a6;
@end

@implementation EDMessageRepository

uint64_t __60__EDMessageRepository__resetUpdateThrottlersWithLogMessage___block_invoke()
{
  return +[EDUpdateThrottler resetAllInstances];
}

- (void)performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"starting query"];
  v17 = [(EDMessageRepository *)self performQueryOnSerializationQueue];
  int v18 = [v17 tryLockWhenCondition:1];

  if (v18)
  {
    v19 = [(EDMessageRepository *)self performQueryOnSerializationQueue];
    [v19 unlock];

    v20 = [(EDMessageRepository *)self serializationQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __104__EDMessageRepository_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke;
    v21[3] = &unk_1E6C036D0;
    v21[4] = self;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    dispatch_async(v20, v21);
  }
  else
  {
    [(EDMessageRepository *)self _performQuery:v12 withObserver:v13 observationIdentifier:v14 helperObserver:v15 completionHandler:v16];
  }
}

- (NSConditionLock)performQueryOnSerializationQueue
{
  return self->_performQueryOnSerializationQueue;
}

- (void)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"starting count query"];
  id v14 = objc_opt_new();
  id v15 = [EDMessageCountQueryHandler alloc];
  id v16 = [(EDMessageRepository *)self messagePersistence];
  v17 = [(EDMessageRepository *)self hookRegistry];
  int v18 = [(EDMessageCountQueryHandler *)v15 initWithQuery:v10 serverCountMailboxScope:v11 messagePersistence:v16 hookRegistry:v17 observer:v12];
  [v14 addCancelable:v18];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke;
  v25[3] = &unk_1E6BFF2F0;
  id v19 = v12;
  id v26 = v19;
  [v14 addCancelationBlock:v25];
  os_unfair_lock_lock(&self->_handlersLock);
  [(NSMutableSet *)self->_handlerTokens addObject:v14];
  os_unfair_lock_unlock(&self->_handlersLock);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v14);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6C03410;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  [v14 addCancelationBlock:v20];
  v13[2](v13, v14);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)_resetUpdateThrottlersWithLogMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EDMessageRepository *)self updateThrottlerResetBlock];

  if (v5)
  {
    v6 = +[EDMessageRepository log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "Already resetting all update throttlers, skipping reset due to %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = +[EDMessageRepository log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Resetting all update throttlers due to %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, &__block_literal_global_439);
    [(EDMessageRepository *)self setUpdateThrottlerResetBlock:v6];
    v8 = [(EDMessageRepository *)self updateThrottlerResetScheduler];
    [v8 performBlock:v6];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EDMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_60 != -1) {
    dispatch_once(&log_onceToken_60, block);
  }
  v2 = (void *)log_log_60;

  return (OS_os_log *)v2;
}

- (id)updateThrottlerResetBlock
{
  id WeakRetained = objc_loadWeakRetained(&self->_updateThrottlerResetBlock);

  return WeakRetained;
}

- (EFScheduler)updateThrottlerResetScheduler
{
  return self->_updateThrottlerResetScheduler;
}

- (void)setUpdateThrottlerResetBlock:(id)a3
{
}

- (EDMessageRepository)initWithMessagePersistence:(id)a3 conversationPersistence:(id)a4 threadPersistence:(id)a5 remoteContentPersistence:(id)a6 messageChangeManager:(id)a7 richLinkPersistence:(id)a8 attachmentPersistenceManager:(id)a9 categoryPersistence:(id)a10 senderPersistence:(id)a11 activityPersistence:(id)a12 businessPersistence:(id)a13 businessCloudStorage:(id)a14 hookRegistry:(id)a15 mailboxPersistence:(id)a16 searchProvider:(id)a17 userProfileProvider:(id)a18 vipManager:(id)a19 fetchController:(id)a20 observerResumer:(id)a21 remoteContentManager:(id)a22 remoteContentCacheConfiguration:(id)a23 blockedSenderManager:(id)a24 listUnsubscribeHandler:(id)a25 remindMeNotificationController:(id)a26 accountsProvider:(id)a27
{
  id v98 = a3;
  id v97 = a4;
  id v96 = a5;
  id v73 = a6;
  id v95 = a6;
  id v94 = a7;
  id v71 = a8;
  id v93 = a8;
  id v92 = a9;
  id v99 = a10;
  id v91 = a11;
  id v90 = a12;
  id v89 = a13;
  id v88 = a14;
  id v87 = a15;
  id v86 = a16;
  id v85 = a17;
  id v84 = a18;
  id v83 = a19;
  id v82 = a20;
  id v81 = a21;
  id v80 = a22;
  id v79 = a23;
  id v78 = a24;
  id v77 = a25;
  id v76 = a26;
  id v75 = a27;
  v100.receiver = self;
  v100.super_class = (Class)EDMessageRepository;
  v32 = [(EDMessageRepository *)&v100 init];
  v33 = v32;
  if (v32)
  {
    v32->_handlersLock._os_unfair_lock_opaque = 0;
    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    handlerTokens = v33->_handlerTokens;
    v33->_handlerTokens = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryHandlers = v33->_queryHandlers;
    v33->_queryHandlers = v36;

    objc_storeStrong((id *)&v33->_hookRegistry, a15);
    objc_storeStrong((id *)&v33->_messagePersistence, a3);
    objc_storeStrong((id *)&v33->_conversationPersistence, a4);
    objc_storeStrong((id *)&v33->_threadPersistence, a5);
    objc_storeStrong((id *)&v33->_remoteContentPersistence, v73);
    objc_storeStrong((id *)&v33->_messageChangeManager, a7);
    objc_storeStrong((id *)&v33->_categoryPersistence, a10);
    uint64_t v38 = [v99 analyticsLogger];
    categoryAnalyticsLogger = v33->_categoryAnalyticsLogger;
    v33->_categoryAnalyticsLogger = (EDCategoryCoreAnalyticsLogger *)v38;

    objc_storeStrong((id *)&v33->_senderPersistence, a11);
    objc_storeStrong((id *)&v33->_businessPersistence, a13);
    objc_storeStrong((id *)&v33->_activityPersistence, a12);
    objc_storeStrong((id *)&v33->_businessCloudStorage, a14);
    v40 = (void *)MEMORY[0x1E4F60F28];
    v41 = [NSString stringWithFormat:@"com.apple.email.%@.icloudSyncScheduler", objc_opt_class()];
    uint64_t v42 = [v40 serialDispatchQueueSchedulerWithName:v41];
    icloudSyncScheduler = v33->_icloudSyncScheduler;
    v33->_icloudSyncScheduler = (EFScheduler *)v42;

    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    performQueryOnSerializationQueue = v33->_performQueryOnSerializationQueue;
    v33->_performQueryOnSerializationQueue = (NSConditionLock *)v44;

    v46 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v47 = dispatch_queue_attr_make_with_qos_class(v46, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v48 = dispatch_queue_create("com.apple.email.EDMessageRepository.serializationQueue", v47);
    serializationQueue = v33->_serializationQueue;
    v33->_serializationQueue = (OS_dispatch_queue *)v48;

    objc_storeStrong((id *)&v33->_mailboxPersistence, a16);
    objc_storeStrong((id *)&v33->_userProfileProvider, a18);
    objc_storeStrong((id *)&v33->_vipManager, a19);
    objc_storeStrong((id *)&v33->_searchProvider, a17);
    objc_storeStrong((id *)&v33->_fetchController, a20);
    objc_storeStrong((id *)&v33->_observerResumer, a21);
    objc_storeStrong((id *)&v33->_remoteContentManager, a22);
    objc_storeStrong((id *)&v33->_remoteContentCacheConfiguration, a23);
    objc_storeStrong((id *)&v33->_blockedSenderManager, a24);
    objc_storeStrong((id *)&v33->_listUnsubscribeHandler, a25);
    objc_storeStrong((id *)&v33->_remindMeNotificationController, a26);
    objc_storeStrong((id *)&v33->_richLinkPersistence, v71);
    objc_storeStrong((id *)&v33->_attachmentPersistenceManager, a9);
    v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryHandlersByThreadScope = v33->_queryHandlersByThreadScope;
    v33->_queryHandlersByThreadScope = v50;

    uint64_t v52 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDMessageRepository.updateThrottlerResetQueue" qualityOfService:9];
    updateThrottlerResetScheduler = v33->_updateThrottlerResetScheduler;
    v33->_updateThrottlerResetScheduler = (EFScheduler *)v52;

    uint64_t v54 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDMessageRepository.asyncWorkScheduler" qualityOfService:25];
    asyncWorkScheduler = v33->_asyncWorkScheduler;
    v33->_asyncWorkScheduler = (EFScheduler *)v54;

    uint64_t v56 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDMessageRepository.messageListItemScheduler" qualityOfService:25];
    messageListItemScheduler = v33->_messageListItemScheduler;
    v33->_messageListItemScheduler = (EFScheduler *)v56;

    [(EDPersistenceHookRegistry *)v33->_hookRegistry registerAccountChangeHookResponder:v33];
    [(EDPersistenceHookRegistry *)v33->_hookRegistry registerOneTimeCodeChangeHookResponder:v33];
    [(EDPersistenceHookRegistry *)v33->_hookRegistry registerMessageChangeHookResponder:v33];
    v58 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v59 = dispatch_queue_attr_make_with_qos_class(v58, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v60 = dispatch_queue_create("com.apple.email.EDMessageRepository.contentProtectionQueue", v59);
    contentProtectionQueue = v33->_contentProtectionQueue;
    v33->_contentProtectionQueue = (OS_dispatch_queue *)v60;

    EFRegisterContentProtectionObserver();
    [MEMORY[0x1E4F603B0] addValidSortDescriptorsToEMQuery];
    v33->_remoteContentParserLock._os_unfair_lock_opaque = 0;
    id v62 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v64 = [v62 initWithObject:v63];
    oneTimeCodeObservers = v33->_oneTimeCodeObservers;
    v33->_oneTimeCodeObservers = (EFLocked *)v64;

    v66 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E4F60258]);
    analyticsCollector = v33->_analyticsCollector;
    v33->_analyticsCollector = v66;

    objc_storeStrong((id *)&v33->_accountsProvider, a27);
    uint64_t v68 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.onetimepasscodes"];
    sharedOneTimeCodeUserDefaults = v33->_sharedOneTimeCodeUserDefaults;
    v33->_sharedOneTimeCodeUserDefaults = (NSUserDefaults *)v68;
  }
  return v33;
}

- (void)_performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v58 = a4;
  id v63 = a5;
  id v53 = a6;
  uint64_t v56 = (void (**)(id, id))a7;
  v61 = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F60D40]);
  id v14 = [v12 label];
  id v15 = v14;
  if (!v14)
  {
    id v15 = NSStringFromClass((Class)[v12 targetClass]);
  }
  id v16 = (void *)[v13 initWithLabel:v15];
  if (!v14) {

  }
  os_unfair_lock_lock(&self->_handlersLock);
  id val = v16;
  [(NSMutableSet *)self->_handlerTokens addObject:v16];
  os_unfair_lock_t lock = &self->_handlersLock;
  os_unfair_lock_unlock(&self->_handlersLock);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [v12 targetClass];
  if (_os_feature_enabled_impl())
  {
    int v18 = [(EDMessageRepository *)self _createGroupedSenderQueryHandlerForQuery:v12 withObserver:v58 observationIdentifier:v63];
    id v19 = [v18 threadScope];
    objc_msgSend(v55, "ef_addOptionalObject:", v19);

    v20 = v18;
  }
  else
  {
    v20 = 0;
  }
  uint64_t v64 = v20;
  if (v17 == objc_opt_class())
  {
    id v22 = +[EDMessageRepository log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      __int16 v81 = 2114;
      id v82 = v63;
      _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Creating message query: %{public}@, observation identifier: %{public}@", buf, 0x16u);
    }

    id v23 = [EDMessageQueryHandler alloc];
    id v24 = [(EDMessageRepository *)self messagePersistence];
    id v25 = [(EDMessageRepository *)self hookRegistry];
    id v26 = [(EDMessageRepository *)self remindMeNotificationController];
    v27 = [(EDMessageRepository *)self searchProvider];
    id v21 = [(EDMessageQueryHandler *)v23 initWithQuery:v61 messagePersistence:v24 hookRegistry:v25 remindMeNotificationController:v26 searchProvider:v27 observer:v58 observationIdentifier:v63];

    id v16 = val;
  }
  else if (v17 == objc_opt_class() && ([v12 queryOptions] & 0x40) != 0)
  {
    id v21 = v20;
    v37 = [(EDMessageQueryHandler *)v21 threadScope];
    [v55 addObject:v37];
  }
  else if (v17 == objc_opt_class())
  {
    v28 = +[EDMessageRepository log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      __int16 v81 = 2114;
      id v82 = v63;
      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Creating thread query: %{public}@, observation identifier: %{public}@", buf, 0x16u);
    }

    v29 = [EDThreadQueryHandler alloc];
    v30 = [(EDMessageRepository *)self messagePersistence];
    v59 = [(EDMessageRepository *)self threadPersistence];
    v31 = [(EDMessageRepository *)self hookRegistry];
    v32 = [(EDMessageRepository *)self vipManager];
    v33 = [(EDMessageRepository *)self searchProvider];
    v34 = [(EDMessageRepository *)self remindMeNotificationController];
    v35 = [(EDMessageRepository *)self observerResumer];
    v65 = [(EDThreadQueryHandler *)v29 initWithQuery:v61 messagePersistence:v30 threadPersistence:v59 hookRegistry:v31 vipManager:v32 searchProvider:v33 remindMeNotificationController:v34 observer:v58 observationIdentifier:v63 helperObserver:v53 delegate:self observationResumer:v35];

    v36 = [(EDThreadQueryHandler *)v65 threadScope];
    [v55 addObject:v36];

    id v16 = val;
    id v21 = (EDMessageQueryHandler *)v65;
  }
  else
  {
    id v21 = 0;
  }
  [v16 addCancelable:v21];
  os_unfair_lock_lock(lock);
  v66 = v21;
  dispatch_queue_t v60 = [(EDMessageRepository *)self queryHandlers];
  uint64_t v54 = [v60 objectForKeyedSubscript:v63];
  if (v54)
  {
    uint64_t v38 = +[EDMessageRepository log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      [val label];
      objc_claimAutoreleasedReturnValue();
      -[EDMessageRepository _performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:]();
    }

    [v54 cancel];
  }
  [v60 setObject:v21 forKeyedSubscript:v63];
  v39 = +[EDMessageRepository log];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = [val label];
    uint64_t v41 = [v60 count];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v21;
    __int16 v81 = 2114;
    id v82 = v63;
    __int16 v83 = 2114;
    id v84 = v40;
    __int16 v85 = 2048;
    uint64_t v86 = v41;
    _os_log_impl(&dword_1DB39C000, v39, OS_LOG_TYPE_DEFAULT, "Added queryHandler:%{public}@ observation identifier: %{public}@ token:%{public}@\n\tqueryHandlers.count:%lu", buf, 0x2Au);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v42 = v55;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v76 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v46 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        v47 = [(EDMessageRepository *)self queryHandlersByThreadScope];
        dispatch_queue_t v48 = [v47 objectForKeyedSubscript:v46];

        if (v48)
        {
          [v48 addObject:v66];
        }
        else
        {
          uint64_t v49 = [MEMORY[0x1E4F1CA80] setWithObject:v66];
          v50 = [(EDMessageRepository *)self queryHandlersByThreadScope];
          [v50 setObject:v49 forKeyedSubscript:v46];

          dispatch_queue_t v48 = (void *)v49;
        }
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v43);
  }

  os_unfair_lock_unlock(lock);
  [(EDMessageQueryHandler *)v66 start];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __105__EDMessageRepository__performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke;
  v68[3] = &unk_1E6C036F8;
  objc_copyWeak(&v72, (id *)buf);
  objc_copyWeak(&v73, &location);
  id v51 = v63;
  id v69 = v51;
  v67 = v66;
  v70 = v67;
  id v52 = v42;
  id v71 = v52;
  [val addCancelationBlock:v68];
  v56[2](v56, val);

  objc_destroyWeak(&v73);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (NSMutableDictionary)queryHandlersByThreadScope
{
  return self->_queryHandlersByThreadScope;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (NSMutableDictionary)queryHandlers
{
  return self->_queryHandlers;
}

- (EDResumable)observerResumer
{
  return self->_observerResumer;
}

- (id)_createGroupedSenderQueryHandlerForQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v21 = a4;
  id v9 = a5;
  if (([v8 queryOptions] & 0x40) != 0)
  {
    uint64_t v11 = [EDGroupedSenderQueryHandler alloc];
    id v12 = [(EDMessageRepository *)self messagePersistence];
    id v13 = [(EDMessageRepository *)self senderPersistence];
    id v14 = [(EDMessageRepository *)self businessPersistence];
    id v15 = [(EDMessageRepository *)self businessCloudStorage];
    id v16 = [(EDMessageRepository *)self hookRegistry];
    uint64_t v17 = [(EDMessageRepository *)self remindMeNotificationController];
    LOBYTE(v20) = 1;
    id v10 = [(EDGroupedSenderQueryHandler *)v11 initWithQuery:v8 messagePersistence:v12 senderPersistence:v13 businessPersistence:v14 businessCloudStorage:v15 hookRegistry:v16 remindMeNotificationController:v17 observer:v21 observationIdentifier:v9 keepMessagesInListOnBucketChange:v20];

    int v18 = +[EDMessageRepository log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Creating EDGroupedSenderQueryHandler: %{public}@, observation identifier: %{public}@ groupedSenderQueryHandler:%{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)getURLCacheInformationWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t))a3;
  v5 = [(EDMessageRepository *)self remoteContentCacheConfiguration];
  v6 = [v5 cacheURL];

  v7 = +[EDMessageRepository log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Remote Content Cache URL: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F20]) initWithFileURL:v6 readOnly:1];
  id v9 = [(EDMessageRepository *)self remoteContentCacheConfiguration];
  v4[2](v4, v8, [v9 diskCapacity]);
}

- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

void __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v2)
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 5);
      [*((id *)WeakRetained + 9) removeObject:v2];
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 5);
    }
  }
}

void __26__EDMessageRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_60;
  log_log_60 = (uint64_t)v1;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EDMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_4 != -1) {
    dispatch_once(&signpostLog_onceToken_4, block);
  }
  id v2 = (void *)signpostLog_log_4;

  return v2;
}

void __34__EDMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)signpostLog_log_4;
  signpostLog_log_4 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  [(EDMessageRepository *)self cancelAllHandlers];
  v3.receiver = self;
  v3.super_class = (Class)EDMessageRepository;
  [(EDMessageRepository *)&v3 dealloc];
}

- (void)test_tearDown
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageRepository.m", 283, @"%s can only be called from unit tests", "-[EDMessageRepository test_tearDown]");
  }
  os_unfair_lock_lock(&self->_handlersLock);
  os_signpost_id_t v4 = [(EDMessageRepository *)self queryHandlers];
  v5 = [v4 allValues];

  v6 = [(EDMessageRepository *)self queryHandlers];
  [v6 removeAllObjects];

  os_unfair_lock_unlock(&self->_handlersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "test_tearDown");
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)isDataAccessible:(id)a3
{
  os_signpost_id_t v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    uint64_t v3 = EFProtectedDataAvailable();
    v4[2](v4, v3);
  }
}

- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v24 = a5;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"starting one off query"];
  uint64_t v9 = +[EDMessageRepository log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v8 debugDescription];
    *(_DWORD *)buf = 138412290;
    v35 = v10;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_INFO, "Performing Query %@", buf, 0xCu);
  }
  uint64_t v11 = (void *)MEMORY[0x1E0190280]();
  long long v12 = [MEMORY[0x1E4F60E18] promise];
  long long v13 = [v12 future];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke;
  v31[3] = &unk_1E6C01A90;
  id v14 = v8;
  id v32 = v14;
  id v15 = v24;
  id v33 = v15;
  [v13 addSuccessBlock:v31];

  id v16 = [v12 future];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_75;
  v28[3] = &unk_1E6C01C80;
  id v17 = v14;
  id v29 = v17;
  id v18 = v15;
  id v30 = v18;
  [v16 addFailureBlock:v28];

  if (a4 >= 200) {
    int64_t v19 = 200;
  }
  else {
    int64_t v19 = a4;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
  id v21 = [(EDMessageRepository *)self messagePersistence];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_77;
  v25[3] = &unk_1E6C01EF0;
  id v22 = v20;
  id v26 = v22;
  id v23 = v12;
  id v27 = v23;
  [v21 iterateMessagesMatchingQuery:v17 batchSize:200 firstBatchSize:0 limit:a4 cancelationToken:0 handler:v25];

  [v23 finishWithResult:v22];
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = +[EDMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "found %ld messages matching query %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = +[EDMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_75_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v7) {
    [*(id *)(a1 + 32) addObjectsFromArray:v7];
  }
  else {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
}

- (void)performCountQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDMessageRepository *)self asyncWorkScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E6C01BF0;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performBlock:v11];
}

void __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6C01BF0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 performDatabaseWorkInBlockWithHighPriority:v4];
}

void __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetUpdateThrottlersWithLogMessage:@"starting one off count query"];
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  id v7 = [v2 queryWithExpandedMailboxesFromQuery:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  os_signpost_id_t v4 = NSNumber;
  id v5 = [*(id *)(a1 + 32) messagePersistence];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "countOfMessagesMatchingQuery:", v7));
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
}

uint64_t __104__EDMessageRepository_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performQuery:*(void *)(a1 + 40) withObserver:*(void *)(a1 + 48) observationIdentifier:*(void *)(a1 + 56) helperObserver:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

void __105__EDMessageRepository__performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v3)
    {
      os_signpost_id_t v4 = +[EDMessageRepository log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(void **)(a1 + 32);
        id v6 = [v3 label];
        *(_DWORD *)buf = 138543618;
        id v30 = v5;
        __int16 v31 = 2114;
        id v32 = v6;
        _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Stopping query with observation identifier: %{public}@ token:%{public}@", buf, 0x16u);
      }
      os_unfair_lock_t lock = (os_unfair_lock_s *)(WeakRetained + 20);
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 5);
      [*((id *)WeakRetained + 9) removeObject:v3];
      id v7 = [WeakRetained queryHandlers];
      id v23 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];

      if (v23 == *(void **)(a1 + 40))
      {
        uint64_t v8 = objc_msgSend(WeakRetained, "queryHandlers", lock);
        [v8 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];

        id v9 = +[EDMessageRepository log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = *(void **)(a1 + 32);
          uint64_t v11 = [v3 label];
          id v12 = [WeakRetained queryHandlers];
          uint64_t v13 = [v12 count];
          *(_DWORD *)buf = 138544130;
          id v30 = v23;
          __int16 v31 = 2114;
          id v32 = v10;
          __int16 v33 = 2114;
          v34 = v11;
          __int16 v35 = 2048;
          uint64_t v36 = v13;
          _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Removed queryHandler:%{public}@ observation identifier: %{public}@ token:%{public}@\n\tqueryHandlers.count:%lu", buf, 0x2Au);
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v25;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
            int64_t v19 = objc_msgSend(WeakRetained, "queryHandlersByThreadScope", lock);
            uint64_t v20 = [v19 objectForKeyedSubscript:v18];

            [v20 removeObject:*(void *)(a1 + 40)];
            if (![v20 count])
            {
              id v21 = [WeakRetained queryHandlersByThreadScope];
              [v21 setObject:0 forKeyedSubscript:v18];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      os_unfair_lock_unlock(lock);
    }
  }
}

- (void)accountBecameActive:(id)a3
{
}

- (void)accountBecameInactive:(id)a3
{
}

- (void)_accountActiveStateDidChange:(id)a3 stateStringForLogging:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F35FE498])
  {
    id v8 = v6;
    id v9 = [(EDMessageRepository *)self asyncWorkScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__EDMessageRepository__accountActiveStateDidChange_stateStringForLogging___block_invoke;
    v11[3] = &unk_1E6BFF7A8;
    id v12 = v7;
    uint64_t v13 = self;
    id v10 = v8;
    id v14 = v10;
    [v9 performBlock:v11];
  }
  else
  {
    id v10 = +[EDMessageRepository log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Newly %{public}@ account is not EDReceivingAccount.", buf, 0xCu);
    }
  }
}

void __74__EDMessageRepository__accountActiveStateDidChange_stateStringForLogging___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[EDMessageRepository log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Requesting update of threads for %{public}@ account.", (uint8_t *)&v6, 0xCu);
  }

  os_signpost_id_t v4 = [*(id *)(a1 + 40) threadPersistence];
  id v5 = [v4 resetThreadScopesForAccount:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) _triggerMigrationForThreadScopes:v5];
}

- (void)threadQueryHandlerStateDidChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  uint64_t v7 = [(EDMessageRepository *)self queryHandlersByThreadScope];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke;
  v20[3] = &unk_1E6C03740;
  id v8 = v4;
  id v21 = v8;
  id v9 = v5;
  id v22 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];

  os_unfair_lock_unlock(p_handlersLock);
  [v9 removeObject:v8];
  id v10 = +[EDMessageRepository log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v9 count];
    *(_DWORD *)buf = 134218240;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = v11;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_INFO, "Thread query handler %p completed migration. Will notify %u other thread query handlers about the state change.", buf, 0x12u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "checkIfPrecomputedStateIsAvailable", (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v13);
  }
}

void __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) threadScope];
  int v7 = [v9 isEqual:v6];

  if (v7)
  {
    id v8 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_50);
    [*(id *)(a1 + 40) unionSet:v8];
  }
}

id __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_triggerMigrationForThreadScopes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = __Block_byref_object_copy__25;
  int v27 = __Block_byref_object_dispose__25;
  id v28 = 0;
  os_unfair_lock_lock(&self->_handlersLock);
  id v5 = [(EDMessageRepository *)self queryHandlersByThreadScope];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke;
  v20[3] = &unk_1E6C03768;
  id v6 = v4;
  id v21 = v6;
  id v22 = &v23;
  [v5 enumerateKeysAndObjectsUsingBlock:v20];

  os_unfair_lock_unlock(&self->_handlersLock);
  int v7 = +[EDMessageRepository log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(id)v24[5] count];
    *(_DWORD *)buf = 67109120;
    int v31 = v8;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Found %u query handlers that need re-migration for (de-)actived account.", buf, 8u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)v24[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        uint64_t v14 = [(EDMessageRepository *)self threadPersistence];
        uint64_t v15 = [v13 threadScope];
        [v14 setNeedsUpdateForThreadScope:v15];

        [v13 triggerMigration];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v29 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v23, 8);
}

void __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v5 = objc_msgSend(v10, "ef_compactMap:", &__block_literal_global_223);
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      [v6 unionSet:v5];
    }
    else
    {
      uint64_t v7 = [v5 mutableCopy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

id __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)startObservingOneTimeCode:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(EDMessageRepository *)self oneTimeCodeObservers];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke;
  v20[3] = &unk_1E6C01D98;
  id v9 = v6;
  id v21 = v9;
  [v8 performWhileLocked:v20];

  id v10 = +[EDMessageRepository log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "[OTC] Registering one-time code observer: %@", buf, 0xCu);
  }

  if (!self->_delayedMessageActionScheduler)
  {
    uint64_t v11 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDMessageRepository.delayedMessageActionScheduler"];
    delayedMessageActionScheduler = self->_delayedMessageActionScheduler;
    self->_delayedMessageActionScheduler = v11;
  }
  self->_oneTimeCodeMessageID = *MEMORY[0x1E4F5FCC8];
  uint64_t v13 = objc_opt_new();
  os_unfair_lock_lock(&self->_handlersLock);
  [(NSMutableSet *)self->_handlerTokens addObject:v13];
  os_unfair_lock_unlock(&self->_handlersLock);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_232;
  v14[3] = &unk_1E6C03790;
  objc_copyWeak(&v15, (id *)buf);
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  [v13 addCancelationBlock:v14];
  v7[2](v7, v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

uint64_t __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

void __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_232(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 5);
    if (v3)
    {
      id v4 = objc_loadWeakRetained(a1 + 6);
      if (v4)
      {
        id v5 = [WeakRetained oneTimeCodeObservers];
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_2;
        v6[3] = &unk_1E6C01D98;
        id v7 = v4;
        [v5 performWhileLocked:v6];

        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 5);
        [*((id *)WeakRetained + 9) removeObject:v3];
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 5);
      }
    }
  }
}

uint64_t __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)_broadcastOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(EDMessageRepository *)self oneTimeCodeObservers];
  id v22 = [v16 getObject];

  id v17 = +[EDMessageRepository log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v22;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "[OTC] Broadcasting one-time code to observers: %@", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v22;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21++), "didReceiveOneTimeCode:timestamp:messageID:subject:senders:observers:", v12, v13, a5, v14, v15, objc_msgSend(v18, "count"));
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
}

- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  [(EDMessageRepository *)self setOneTimeCodeMessageID:a5];
  [(EDMessageRepository *)self _broadcastOneTimeCode:v15 timestamp:v12 messageID:a5 subject:v13 senders:v14];
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F5FCC8];
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        int64_t v12 = [(EDMessageRepository *)self oneTimeCodeMessageID];
        if (v12 == [v11 globalMessageID])
        {
          id v13 = +[EDMessageRepository log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "One time code messages are deleted by the user", v15, 2u);
          }

          id v14 = [MEMORY[0x1E4F1C9C8] now];
          -[EDMessageRepository _broadcastOneTimeCode:timestamp:messageID:subject:senders:](self, "_broadcastOneTimeCode:timestamp:messageID:subject:senders:", 0, v14, [v11 globalMessageID], &stru_1F3583658, v9);

          [(EDMessageRepository *)self setOneTimeCodeMessageID:v8];
        }
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (NSSet)test_activeQueryCancelationTokens
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMessageRepository.m", 634, @"%s can only be called from unit tests", "-[EDMessageRepository test_activeQueryCancelationTokens]");
  }
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  id v5 = (void *)[(NSMutableSet *)self->_handlerTokens copy];
  os_unfair_lock_unlock(p_handlersLock);

  return (NSSet *)v5;
}

- (void)cancelAllHandlers
{
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  id v4 = [(NSMutableSet *)self->_handlerTokens allObjects];
  id v5 = (id)[v4 mutableCopy];

  [(NSMutableSet *)self->_handlerTokens removeAllObjects];
  os_unfair_lock_unlock(p_handlersLock);
  [v5 makeObjectsPerformSelector:sel_cancel];
}

- (id)_threadScopeFromObjectID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      a1 = [v3 threadScope];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_partitionObjectIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v16;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v10 = -[EDMessageRepository _threadScopeFromObjectID:](self, v9);
          uint64_t v11 = [v4 objectForKeyedSubscript:v10];
          int64_t v12 = v11;
          if (v11)
          {
            [v11 addObject:v9];
          }
          else
          {
            int64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v17 addObject:v9];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }

  id v14 = [[_EDPartitionedObjectIDs alloc] initWithMessageObjectIDs:v17 threadObjectIDsByScope:v4];

  return v14;
}

- (void)_enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:(id)a3 usingBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__EDMessageRepository__enumerateObjectIDsAndQueryHandlersForObjectIDsByScope_usingBlock_failureBlock___block_invoke;
  v12[3] = &unk_1E6C037B8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a3 enumerateKeysAndObjectsUsingBlock:v12];
}

void __102__EDMessageRepository__enumerateObjectIDsAndQueryHandlersForObjectIDsByScope_usingBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v21 = a3;
  uint64_t v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_lock(v6);
  uint64_t v27 = a1;
  long long v20 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) queryHandlersByThreadScope];
  id v8 = [v7 objectForKeyedSubscript:v5];
  long long v24 = (void *)[v8 copy];

  os_unfair_lock_unlock(v6);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v21;
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      uint64_t v25 = v9;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v11 = v24;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        uint64_t v26 = v10;
        if (v12)
        {
          id v13 = 0;
          id v14 = 0;
          uint64_t v15 = *(void *)v29;
          while (2)
          {
            uint64_t v16 = 0;
            id v17 = v13;
            long long v18 = v14;
            do
            {
              if (*(void *)v29 != v15) {
                objc_enumerationMutation(v11);
              }
              id v13 = *(id *)(*((void *)&v28 + 1) + 8 * v16);

              int v19 = (*(uint64_t (**)(void))(*(void *)(v27 + 40) + 16))();
              id v14 = v18;

              if (v19)
              {

                goto LABEL_18;
              }
              ++v16;
              id v17 = v13;
              long long v18 = v14;
            }
            while (v12 != v16);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v14 = 0;
        }

        id v13 = 0;
        (*(void (**)(void))(*(void *)(v27 + 48) + 16))();
LABEL_18:

        uint64_t v10 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }
}

- (void)_enumerateObjectIDsByScope:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke;
  v10[3] = &unk_1E6C037E0;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke_2;
  v8[3] = &unk_1E6C03808;
  v8[4] = self;
  id v9 = v11;
  id v7 = v11;
  [(EDMessageRepository *)self _enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:a3 usingBlock:v10 failureBlock:v8];
}

uint64_t __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v17 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 0;
      id v9 = (id *)&v16;
      uint64_t v10 = [v8 messageListItemForObjectID:v7 isPersisted:&v17 error:&v16];
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 0;
      id v9 = (id *)&v15;
      uint64_t v10 = [v8 groupedSenderForObjectID:v7 isPersisted:&v17 error:&v15];
LABEL_7:
      id v11 = (void *)v10;
      id v12 = *v9;
      if (v11)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t v13 = 1;
        if (!a4) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v13 = 0;
        if (!a4) {
          goto LABEL_12;
        }
      }
      goto LABEL_11;
    }
  }
  uint64_t v13 = 0;
  id v11 = 0;
  id v12 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v12;
LABEL_12:

  return v13;
}

void __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  if (v11
    && ([*(id *)(a1 + 32) threadPersistence],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v11 threadScope],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v12 persistenceStateForThreadScope:v13],
        v13,
        v12,
        v14 == 1))
  {
    if (!v8)
    {
      char v17 = [*(id *)(a1 + 32) threadPersistence];
      id v20 = 0;
      long long v18 = [v17 threadForObjectID:v11 originatingQuery:0 error:&v20];
      id v19 = v20;

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = [NSString stringWithFormat:@"In-memory thread could not be found"];
    objc_msgSend(v15, "em_internalErrorWithReason:", v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

- (void)messageListItemsForObjectIDs:(id)a3 requestID:(unint64_t)a4 observationIdentifier:(id)a5 loadSummaryForAdditionalObjectIDs:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  char v17 = _os_activity_create(&dword_1DB39C000, "-[EDMessageRepository messageListItemsForObjectIDs:requestID:observationIdentifier:loadSummaryForAdditionalObjectIDs:completionHandler:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  long long v18 = [MEMORY[0x1E4F60278] signpostLog];
  id v19 = v18;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EDMessageRepositoryMessageListItems", "Received by maild", buf, 2u);
  }

  id v20 = [(EDMessageRepository *)self messageListItemScheduler];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke;
  v25[3] = &unk_1E6C03858;
  void v25[4] = self;
  unint64_t v30 = a4;
  id v21 = v13;
  id v26 = v21;
  SEL v31 = a2;
  id v22 = v14;
  id v27 = v22;
  id v23 = v15;
  id v28 = v23;
  id v24 = v16;
  id v29 = v24;
  [v20 performBlock:v25];

  os_activity_scope_leave(&state);
}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6C03858;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  v7[4] = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 80);
  id v8 = v5;
  uint64_t v13 = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  [v2 performDatabaseWorkInBlockWithHighPriority:v7];
}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F60278] signpostLog];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v3, OS_SIGNPOST_EVENT, v4, "EDMessageRepositoryMessageListItems", "Inside async block", buf, 2u);
  }

  [*(id *)(a1 + 32) _resetUpdateThrottlersWithLogMessage:@"requesting message list items"];
  v50 = [*(id *)(a1 + 32) _partitionObjectIDs:*(void *)(a1 + 40)];
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_254;
  aBlock[3] = &unk_1E6C03830;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v61 = *(void *)(a1 + 80);
  aBlock[4] = v6;
  id v52 = v51;
  id v59 = v52;
  id v7 = v5;
  id v60 = v7;
  dispatch_queue_t v48 = _Block_copy(aBlock);
  id v8 = *(void **)(a1 + 32);
  id v9 = [v50 threadObjectIDsByScope];
  [v8 _enumerateObjectIDsByScope:v9 usingBlock:v48];

  id v10 = [MEMORY[0x1E4F60278] signpostLog];
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v11, OS_SIGNPOST_EVENT, v12, "EDMessageRepositoryMessageListItems", "Finished enumerating objectIDs by scope", buf, 2u);
  }

  uint64_t v13 = [v50 messageObjectIDs];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    id v15 = [*(id *)(a1 + 32) messagePersistence];
    id v16 = [v50 messageObjectIDs];
    id v57 = 0;
    char v17 = [v15 messagesForMessageObjectIDs:v16 missedMessageObjectIDs:&v57];
    id v18 = v57;

    id v19 = [MEMORY[0x1E4F60278] signpostLog];
    id v20 = v19;
    os_signpost_id_t v21 = *(void *)(a1 + 72);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB39C000, v20, OS_SIGNPOST_EVENT, v21, "EDMessageRepositoryMessageListItems", "Fetched messages from message persistence", buf, 2u);
    }

    [v52 addObjectsFromArray:v17];
    [v7 addEntriesFromDictionary:v18];
  }
  if (*(void *)(a1 + 48))
  {
    id v22 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
    os_unfair_lock_lock(v22);
    id v23 = [*(id *)(a1 + 32) queryHandlers];
    uint64_t v24 = [v23 objectForKeyedSubscript:*(void *)(a1 + 48)];

    os_unfair_lock_unlock(v22);
    uint64_t v25 = (void *)v24;
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v49 = v25;
  objc_msgSend(*(id *)(a1 + 32), "_requestSummariesIfNeededForMessageListItems:additionalObjectIDs:queryHandler:observationIdentifier:", v52, *(void *)(a1 + 56));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = [v52 count];
    uint64_t v27 = [v7 count];
    if (v27 + v26 != [*(id *)(a1 + 40) count])
    {
      v47 = (void *)[*(id *)(a1 + 40) mutableCopy];
      id v28 = objc_msgSend(v52, "ef_compactMapSelector:", sel_objectID);
      [v47 removeObjectsInArray:v28];

      id v29 = [v7 allKeys];
      [v47 removeObjectsInArray:v29];

      unint64_t v30 = +[EDMessageRepository log];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = [*(id *)(a1 + 40) count];
        uint64_t v45 = [v52 count];
        uint64_t v46 = [v7 count];
        *(_DWORD *)buf = 134218754;
        *(void *)uint64_t v64 = v44;
        *(_WORD *)&v64[8] = 2048;
        uint64_t v65 = v45;
        __int16 v66 = 2048;
        uint64_t v67 = v46;
        __int16 v68 = 2114;
        id v69 = v47;
        _os_log_error_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_ERROR, "Incorrect number of message list items (expected %lu, got %lu results + %lu missed). Unaccounted for: %{public}@", buf, 0x2Au);
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v31 = v47;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to find message list item or \"missing\" reason");
            [v7 setObject:v36 forKeyedSubscript:v35];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v32);
      }
    }
  }
  if (![v52 count])
  {

    id v52 = 0;
  }
  if (![v7 count])
  {

    id v7 = 0;
  }
  uint64_t v37 = +[EDMessageRepository log];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = -[EDMessageRepository _descriptionStringForMessageListItems:](*(id *)(a1 + 32), v52);
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v64 = v38;
    *(_WORD *)&v64[8] = 2114;
    uint64_t v65 = (uint64_t)v7;
    _os_log_impl(&dword_1DB39C000, v37, OS_LOG_TYPE_DEFAULT, "Returning results: %{public}@, missed objects: %{public}@", buf, 0x16u);
  }
  v39 = [MEMORY[0x1E4F60278] signpostLog];
  v40 = v39;
  os_signpost_id_t v41 = *(void *)(a1 + 72);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    int v42 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v52, "count"));
    int v43 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)uint64_t v64 = v42;
    *(_WORD *)&v64[4] = 1026;
    *(_DWORD *)&v64[6] = v43;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v40, OS_SIGNPOST_INTERVAL_END, v41, "EDMessageRepositoryMessageListItems", "Finished processing %{public, name=results}u %{public, name=missedObjectIDs}u", buf, 0xEu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_254(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v22 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      os_signpost_id_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"EDMessageRepository.m" lineNumber:792 description:@"Expecting EMRepositoryObject class"];
    }
    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v22];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v15 = v22;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    char v17 = v16;
    id v18 = v14;
    if (!v14)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      id v20 = NSString;
      uint64_t v6 = objc_msgSend(v16, "ef_publicDescription");
      id v7 = [v20 stringWithFormat:@"Failed to get message list item for objectID: %@", v6];
      id v18 = objc_msgSend(v19, "em_internalErrorWithReason:", v7);
    }
    [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v22];
    if (!v14)
    {
    }
  }
}

- (id)_descriptionStringForMessageListItems:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"messageListItems.count:%u items:(\n"), objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v3, "count"));
    uint64_t v6 = (void *)[v4 initWithString:v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__EDMessageRepository__descriptionStringForMessageListItems___block_invoke;
    v10[3] = &unk_1E6C03880;
    id v7 = v6;
    id v11 = v7;
    id v12 = v3;
    [v12 enumerateObjectsUsingBlock:v10];
    [v7 appendString:@""]);
    id v8 = v12;
    a1 = v7;
  }

  return a1;
}

- (void)_requestSummariesIfNeededForMessageListItems:(id)a3 additionalObjectIDs:(id)a4 queryHandler:(id)a5 observationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(EDMessageRepository *)self asyncWorkScheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __123__EDMessageRepository__requestSummariesIfNeededForMessageListItems_additionalObjectIDs_queryHandler_observationIdentifier___block_invoke;
  v19[3] = &unk_1E6BFFAA0;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  uint64_t v24 = self;
  [v14 performBlock:v19];
}

void __123__EDMessageRepository__requestSummariesIfNeededForMessageListItems_additionalObjectIDs_queryHandler_observationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v8 = [v7 summary];
        BOOL v9 = v8 == 0;

        if (v9)
        {
          id v10 = [v7 displayMessageObjectID];
          [v2 addObject:v10];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v4);
  }

  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  id v11 = +[EDMessageRepository log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    uint64_t v14 = [v2 count];
    uint64_t v15 = [*(id *)(a1 + 32) count];
    uint64_t v16 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134219010;
    uint64_t v43 = v13;
    __int16 v44 = 2114;
    id v45 = v12;
    __int16 v46 = 2048;
    uint64_t v47 = v14;
    __int16 v48 = 2048;
    uint64_t v49 = v15;
    __int16 v50 = 2048;
    uint64_t v51 = v16;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "queryHandler: %p for observation identifier: %{public}@. Requesting summary for (%lu/%lu) messages. summaryLoadObjectIDs: %lu.", buf, 0x34u);
  }

  if (*(void *)(a1 + 48))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v2;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(a1 + 48) requestSummaryForMessageObjectID:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v18);
    }
  }
  else
  {
    id v17 = [*(id *)(a1 + 64) messagePersistence];
    id v21 = +[EDMessageRepository log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v22;
      __int16 v44 = 2048;
      id v45 = v17;
      _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "No query handler found for observation identifier: %@. Requesting summary from messagePersistence %p", buf, 0x16u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v2;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v23);
          }
          id v27 = (id)objc_msgSend(v17, "requestSummaryForMessageObjectID:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v24);
    }
  }
}

void __61__EDMessageRepository__descriptionStringForMessageListItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [a2 description];
  uint64_t v7 = [*(id *)(a1 + 32) length];
  if ((unint64_t)([v8 length] + v7) >> 16)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"    Max length reached. Omit %u items\n", objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 40), "count") - a3));
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) appendFormat:@"    %@\n", v8];
  }
}

- (void)performMessageChangeAction:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"performing change action"];
  id v12 = [(EDMessageRepository *)self serializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__EDMessageRepository_performMessageChangeAction_requestID_returnUndoAction_completionHandler___block_invoke;
  block[3] = &unk_1E6C038A8;
  BOOL v20 = a5;
  id v16 = v10;
  id v17 = self;
  id v18 = v11;
  unint64_t v19 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __95__EDMessageRepository_performMessageChangeAction_requestID_returnUndoAction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F60278] signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EDMessageRepositoryMessageChangeAction", "Received by maild", (uint8_t *)&v27, 2u);
  }

  uint64_t v5 = +[EDMessageRepository signpostLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = +[EDMessageRepository signpostLog];
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = [*(id *)(a1 + 32) signpostType];
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v27 = 134349312;
    uint64_t v28 = v9;
    __int16 v29 = 1026;
    int v30 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu, ReturnUndoAction=%{public,signpost.telemetry.number2}u enableTelemetry=YES ", (uint8_t *)&v27, 0x12u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = 0;
    [*(id *)(a1 + 40) _performMessageFlagChangeAllAction:*(void *)(a1 + 32)];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [*(id *)(a1 + 40) _performMessageFlagChangeAction:*(void *)(a1 + 32) returnUndoAction:*(unsigned __int8 *)(a1 + 64)];
LABEL_18:
    id v11 = (void *)v12;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [*(id *)(a1 + 40) _performMessageReadLaterAction:*(void *)(a1 + 32) returnUndoAction:*(unsigned __int8 *)(a1 + 64)];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [*(id *)(a1 + 40) _performMessageFollowUpAction:*(void *)(a1 + 32) returnUndoAction:*(unsigned __int8 *)(a1 + 64)];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [*(id *)(a1 + 40) _performSenderBlockingAction:*(void *)(a1 + 32) returnUndoAction:*(unsigned __int8 *)(a1 + 64)];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = 0;
    [*(id *)(a1 + 40) _performUnsubscribeAction:*(void *)(a1 + 32)];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = *(id *)(a1 + 32);
    BOOL v20 = [v19 destinationMailboxURL];

    id v21 = *(void **)(a1 + 40);
    if (v20) {
      [v21 _performMessageTransferAllAction:v19];
    }
    else {
      [v21 _performMessageTransferAllActionToSpecialMailbox:v19];
    }

    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _performMessageDeleteAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _performMessageDeleteAllAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [*(id *)(a1 + 40) _performMessageConversationFlagChangeAction:*(void *)(a1 + 32) returnUndoAction:*(unsigned __int8 *)(a1 + 64)];
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) performMessageHighImpactChangeAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _logCategoryMetadataForChangeAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _performCategoryChangeAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _performRestoreModelCategoryForAllMessagesChangeAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
      [*(id *)(a1 + 40) _performSuppressNotAuthenticatedChangeAction:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [*(id *)(a1 + 40) _performUndoAction:*(void *)(a1 + 32)];
      goto LABEL_18;
    }
LABEL_41:
    id v11 = 0;
    goto LABEL_9;
  }
  id v22 = *(id *)(a1 + 32);
  id v23 = [v22 destinationMailboxURL];

  uint64_t v24 = *(void **)(a1 + 40);
  BOOL v25 = *(unsigned char *)(a1 + 64) != 0;
  if (v23) {
    [v24 _performMessageTransferAction:v22 returnUndoAction:v25];
  }
  else {
  uint64_t v26 = [v24 _performMessageTransferActionToSpecialMailbox:v22 returnUndoAction:v25];
  }

  id v11 = (void *)v26;
LABEL_19:
  if (*(unsigned char *)(a1 + 64) && v11)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60508]), "initWithIndividualActions:origin:actor:", v11, objc_msgSend(*(id *)(a1 + 32), "origin"), objc_msgSend(*(id *)(a1 + 32), "actor"));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    goto LABEL_22;
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:
  id v14 = [MEMORY[0x1E4F60278] signpostLog];
  uint64_t v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 56);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v15, OS_SIGNPOST_INTERVAL_END, v16, "EDMessageRepositoryMessageChangeAction", "", (uint8_t *)&v27, 2u);
  }

  id v17 = +[EDMessageRepository signpostLog];
  id v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v18, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageRepositoryMessageChangeAction", "", (uint8_t *)&v27, 2u);
  }
}

- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 afterDelay:(double)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = _EFLocalizedString();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke;
  v16[3] = &unk_1E6C038F8;
  v16[4] = self;
  id v14 = v11;
  id v17 = v14;
  double v19 = a6;
  unint64_t v20 = a4;
  id v15 = v12;
  id v18 = v15;
  [(EDMessageRepository *)self mailOnBoardDeleteVerificationCodesMessage:v13 completionHandler:v16];
}

void __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = +[EDMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding alert was presented. Sending option selected back to Messages notification and setting default key 'DeleteVerificationCodes'", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v6 = objc_alloc(MEMORY[0x1E4F60260]);
  long long v35 = @"oneTimeCodeEvent";
  v36[0] = @"filled";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  id v8 = (void *)[v6 initWithEventName:@"com.apple.mail.oneTimeCodes" collectionData:v7];

  [*(id *)(*(void *)(a1 + 32) + 40) logOneTimeEvent:v8];
  if (a2)
  {
    if (a2 == 1)
    {
      id v11 = +[EDMessageRepository log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Enable one-time code email deletion", buf, 2u);
      }

      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"EDOneTimeCodeOnboardingAlertUserSelectedEnableNotification", 0, 0, 1u);
      uint64_t v9 = [*(id *)(a1 + 32) sharedOneTimeCodeUserDefaults];
      [v9 setBool:1 forKey:@"DeleteVerificationCodes"];
    }
    else
    {
      if (a2 != 2) {
        goto LABEL_15;
      }
      uint64_t v9 = +[EDMessageRepository log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "No one-time code email deletion preference selected", buf, 2u);
      }
    }
  }
  else
  {
    int v10 = +[EDMessageRepository log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Disable one-time code email deletion", buf, 2u);
    }

    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"EDOneTimeCodeOnboardingAlertUserSelectedDisableNotification", 0, 0, 1u);
    uint64_t v9 = [*(id *)(a1 + 32) sharedOneTimeCodeUserDefaults];
    [v9 setBool:0 forKey:@"DeleteVerificationCodes"];
  }

LABEL_15:
  id v12 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.email.messageRepository.delayedMessageAction"];
  if (a2)
  {
    if (a2 != 1)
    {
      os_signpost_id_t v16 = 0;
      goto LABEL_24;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F603D8]);
    uint64_t v34 = *(void *)(a1 + 40);
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    id v15 = [MEMORY[0x1E4F608B8] setRead];
    os_signpost_id_t v16 = (void *)[v13 initWithObjectIDs:v14 origin:7 actor:1 specialDestinationMailboxType:3 flagChange:v15 copyMessages:0];

    id v17 = +[EDMessageRepository log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v18 = "Deleting used one time code email";
LABEL_21:
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x1E4F60358]);
    uint64_t v33 = *(void *)(a1 + 40);
    unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    id v21 = [MEMORY[0x1E4F608B8] setRead];
    os_signpost_id_t v16 = (void *)[v19 initWithObjectIDs:v20 origin:7 actor:1 flagChange:v21];

    id v17 = +[EDMessageRepository log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v18 = "Marking used one time code email as read";
      goto LABEL_21;
    }
  }

LABEL_24:
  id v22 = [*(id *)(a1 + 32) delayedMessageActionScheduler];
  double v23 = *(double *)(a1 + 56);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke_317;
  v27[3] = &unk_1E6C038D0;
  v27[4] = *(void *)(a1 + 32);
  id v28 = v16;
  uint64_t v31 = *(void *)(a1 + 64);
  id v30 = *(id *)(a1 + 48);
  id v24 = v12;
  id v29 = v24;
  id v25 = v16;
  id v26 = (id)[v22 afterDelay:v27 performBlock:v23];
}

uint64_t __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke_317(uint64_t a1)
{
  [*(id *)(a1 + 32) performMessageChangeAction:*(void *)(a1 + 40) requestID:*(void *)(a1 + 64) returnUndoAction:0 completionHandler:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 48);

  return [v2 invalidate];
}

- (void)mailOnBoardDeleteVerificationCodesMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = [(EDMessageRepository *)self sharedOneTimeCodeUserDefaults];
  uint64_t v9 = [v8 integerForKey:@"DeleteVerificationCodesOnboardingVersion"];

  if (v9 < 1)
  {
    id v12 = _EFLocalizedString();
    id v13 = _EFLocalizedString();
    id v14 = _EFLocalizedString();
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    os_signpost_id_t v16 = [(EDMessageRepository *)self _dictForPasswordsIcon];
    objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x1E4F1D990], v6, *MEMORY[0x1E4F1D9A8], v13, *MEMORY[0x1E4F1D9E0], v14, *MEMORY[0x1E4F1D9D0], v16, @"IconConfiguration", 0);
    CFDictionaryRef v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    id v18 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v17);
    CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
    CFUserNotificationReceiveResponse(v18, 0.0, &responseFlags);
    id v19 = [(EDMessageRepository *)self sharedOneTimeCodeUserDefaults];
    [v19 setInteger:1 forKey:@"DeleteVerificationCodesOnboardingVersion"];

    if (responseFlags < 2 || responseFlags == 3) {
      v7[2](v7);
    }
  }
  else
  {
    int v10 = [(EDMessageRepository *)self sharedOneTimeCodeUserDefaults];
    unsigned int v11 = [v10 BOOLForKey:@"DeleteVerificationCodes"];

    ((void (*)(void (**)(void), void))v7[2])(v7, v11);
  }
}

- (id)_dictForPasswordsIcon
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:@"com.apple.Passwords-Settings.extension" forKey:@"ISIconApplicationBundleIdentifier"];
  [v2 setObject:@"otpOnboardingIcon.png" forKey:@"ISIconDecorationType"];

  return v2;
}

- (id)_performMessageFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v6];
  if (_os_feature_enabled_impl())
  {
    id v8 = [v6 flagChange];
    if ([v8 readChanged])
    {
      uint64_t v9 = [v6 flagChange];
      if ([v9 read] && objc_msgSend(v6, "origin") == 3)
      {
        uint64_t v10 = [v6 actor];

        if (v10 != 1) {
          goto LABEL_9;
        }
        id v8 = [(EDMessageRepository *)self categoryAnalyticsLogger];
        uint64_t v9 = [(EDMessageRepository *)self categoryPersistence];
        [v8 logReadEventForMessages:v7 categoryPersistence:v9];
      }
    }
  }
LABEL_9:
  unsigned int v11 = [v6 flagChange];
  id v12 = [(EDMessageRepository *)self _changeFlagsForPersistedMessages:v7 flagChange:v11 returnUndoAction:v4];

  return v12;
}

- (id)_performMessageFollowUpAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v6];
  id v8 = [v6 followUp];
  uint64_t v9 = [(EDMessageRepository *)self _performMessageFollowUpDate:v8 persistedMessages:v7 returnUndoAction:v4];

  return v9;
}

- (id)_performMessageFollowUpDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v24 = a4;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v24;
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(obj);
          }
          unsigned int v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v12 = objc_alloc_init(MEMORY[0x1E4F60500]);
          [v12 setActionType:3];
          id v13 = [v11 followUp];
          id v14 = (void *)[v13 copy];
          [v12 setFollowUp:v14];

          id v15 = NSNumber;
          os_signpost_id_t v16 = [v11 persistentID];
          CFDictionaryRef v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
          id v30 = v17;
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          [v12 setMessageDatabaseIDs:v18];

          [v7 addObject:v12];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    id v19 = v7;
  }
  else
  {
    id v19 = 0;
  }
  unint64_t v20 = [(EDMessageRepository *)self messageChangeManager];
  [v20 applyFollowUp:v23 toMessages:v24 withNegativeFeedbackForSuggestions:1];

  return v19;
}

- (id)_performMessageReadLaterAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v6];
  uint64_t v8 = [v6 readLaterDate];
  uint64_t v9 = [(EDMessageRepository *)self _performMessageReadLaterDate:v8 persistedMessages:v7 returnUndoAction:v4];

  return v9;
}

- (id)_performMessageReadLaterDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v31 = v6;
  uint64_t v34 = v8;
  long long v35 = v9;
  if (v6)
  {
    uint64_t v10 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          os_signpost_id_t v16 = [v15 readLater];
          CFDictionaryRef v17 = [v16 date];
          id v18 = v17;
          if (!v17)
          {
            BOOL v5 = [MEMORY[0x1E4F1CA98] null];
            id v18 = v5;
          }
          [v10 setObject:v18 forKeyedSubscript:v15];
          if (!v17) {
        }
          }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v12);
    }

    id v8 = v34;
    id v9 = v35;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v19 = [(EDMessageRepository *)self messageChangeManager];
  uint64_t v33 = [v19 applyReadLaterDate:v8 displayDate:0 toMessages:v9];

  if (v31)
  {
    unint64_t v20 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = v33;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * j);
          long long v26 = [v10 objectForKeyedSubscript:v25];
          long long v27 = [v20 objectForKeyedSubscript:v26];
          if (!v27)
          {
            long long v27 = objc_opt_new();
            [v20 setObject:v27 forKeyedSubscript:v26];
          }
          [v27 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v22);
    }

    long long v28 = objc_opt_new();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    void v36[2] = __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke;
    v36[3] = &unk_1E6C03940;
    id v29 = v28;
    id v37 = v29;
    [v20 enumerateKeysAndObjectsUsingBlock:v36];
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

void __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60500]);
  [v6 setActionType:2];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))()) {
    id v7 = 0;
  }
  else {
    id v7 = v9;
  }
  [v6 setReadLaterDate:v7];
  id v8 = objc_msgSend(v5, "ef_map:", &__block_literal_global_335);
  [v6 setMessageDatabaseIDs:v8];

  [*(id *)(a1 + 32) addObject:v6];
}

id __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = [a2 persistentID];
  BOOL v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  return v4;
}

- (id)_performSenderBlockingAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v6];
  id v8 = -[EDMessageRepository _performBlockSender:persistedMessages:returnUndoAction:](self, "_performBlockSender:persistedMessages:returnUndoAction:", [v6 blockSender], v7, v4);

  return v8;
}

- (id)_performBlockSender:(BOOL)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  BOOL v29 = a5;
  BOOL v5 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  id v7 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v28;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v13 = [v12 senders];
        id v14 = [v13 firstObject];

        if (v14)
        {
          id v15 = [v12 persistentID];
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }

  os_signpost_id_t v16 = objc_opt_new();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  void v36[2] = __78__EDMessageRepository__performBlockSender_persistedMessages_returnUndoAction___block_invoke;
  v36[3] = &unk_1E6C03968;
  void v36[4] = self;
  BOOL v38 = v5;
  id v31 = v16;
  id v37 = v31;
  [v7 enumerateKeysAndObjectsUsingBlock:v36];
  blockedSenderManager = self->_blockedSenderManager;
  if (v5) {
    [(EMBlockedSenderManager *)blockedSenderManager blockEmailAddresses:v31];
  }
  else {
    [(EMBlockedSenderManager *)blockedSenderManager unblockEmailAddresses:v31];
  }
  if (v29)
  {
    id v30 = objc_opt_new();
    [v30 setActionType:4];
    [v30 setBlockSender:!v5];
    id v18 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v31;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = NSNumber;
          id v24 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * j)];
          uint64_t v25 = objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v24, "longLongValue"));
          [v18 addObject:v25];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v20);
    }

    [v30 setMessageDatabaseIDs:v18];
    long long v26 = [MEMORY[0x1E4F1CA48] arrayWithObject:v30];
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

void __78__EDMessageRepository__performBlockSender_persistedMessages_returnUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "isEmailAddressBlocked:"))objc_msgSend(*(id *)(a1 + 40), "addObject:", v3); {
}
  }

- (void)_performUnsubscribeAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F602E8]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [v6 commandForMessage:*(void *)(*((void *)&v20 + 1) + 8 * v10) mailToOnly:1];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        -[EDListUnsubscribeHandler unsubscribeWithCommand:completion:](self->_listUnsubscribeHandler, "unsubscribeWithCommand:completion:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), 0, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_performMessageFlagChangeAllAction:(id)a3
{
  id v9 = a3;
  BOOL v4 = -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  id v5 = [v9 mailboxObjectIDs];
  id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_342);

  id v7 = [(EDMessageRepository *)self messageChangeManager];
  uint64_t v8 = [v9 flagChange];
  [v7 applyFlagChange:v8 toAllMessagesFromMailboxes:v6 exceptMessages:v4];
}

id __58__EDMessageRepository__performMessageFlagChangeAllAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];

  return v2;
}

- (void)_performMessageDeleteAllAction:(id)a3
{
  id v8 = a3;
  BOOL v4 = -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  id v5 = [v8 mailboxObjectIDs];
  id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_344);

  id v7 = [(EDMessageRepository *)self messageChangeManager];
  [v7 deleteAllMessageFromMailboxes:v6 exceptMessages:v4];
}

id __54__EDMessageRepository__performMessageDeleteAllAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];

  return v2;
}

- (void)_performMessageDeleteAction:(id)a3
{
  id v5 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:a3];
  BOOL v4 = [(EDMessageRepository *)self messageChangeManager];
  [v4 deleteMessages:v5];
}

- (id)_changeFlagsForPersistedMessages:(id)a3 flagChange:(id)a4 returnUndoAction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v33 = v8;
  long long v34 = v9;
  if (v5)
  {
    uint64_t v10 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v16 = [v15 flags];
          [v10 setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v12);
    }

    id v8 = v33;
    id v17 = v34;
  }
  else
  {
    id v17 = v9;
    uint64_t v10 = 0;
  }
  long long v18 = [(EDMessageRepository *)self messageChangeManager];
  long long v32 = [v18 applyFlagChange:v17 toMessages:v8];

  if (v5)
  {
    long long v19 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v32;
    uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          id v24 = (void *)MEMORY[0x1E4F608B8];
          uint64_t v25 = [v23 flags];
          uint64_t v26 = [v10 objectForKeyedSubscript:v23];
          long long v27 = [v24 changeFrom:v25 to:v26];

          id v28 = [v19 objectForKeyedSubscript:v27];
          if (!v28)
          {
            id v28 = objc_opt_new();
            [v19 setObject:v28 forKeyedSubscript:v27];
          }
          [v28 addObject:v23];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v20);
    }

    BOOL v29 = objc_opt_new();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    void v36[2] = __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke;
    v36[3] = &unk_1E6C02820;
    id v30 = v29;
    id v37 = v30;
    [v19 enumerateKeysAndObjectsUsingBlock:v36];
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

void __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60500]);
  [v6 setActionType:1];
  [v6 setFlagChange:v8];
  id v7 = objc_msgSend(v5, "ef_map:", &__block_literal_global_346);
  [v6 setMessageDatabaseIDs:v7];

  [*(id *)(a1 + 32) addObject:v6];
}

id __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = [a2 persistentID];
  BOOL v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  return v4;
}

- (id)_performMessageTransferAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v7];
  int v9 = [v7 copyMessages];
  uint64_t v10 = objc_opt_new();
  id v11 = [(EDMessageRepository *)self messageChangeManager];
  uint64_t v12 = [v7 destinationMailboxURL];
  [v11 transferMessages:v8 transferType:v9 ^ 1u destinationMailboxURL:v12 userInitiated:1 oldMessagesByNewMessage:v10];

  if (!v4) {
    goto LABEL_4;
  }
  if ([v7 copyMessages])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EDMessageRepository.m", 1310, @"An undo action was requested for a copy, that's not yet supported" object file lineNumber description];

LABEL_4:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [(EDMessageRepository *)self _undoActionsForMovedMessages:v10];
LABEL_6:

  return v14;
}

- (void)_performMessageTransferAllAction:(id)a3
{
  id v10 = a3;
  BOOL v4 = -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  int v5 = [v10 copyMessages];
  id v6 = [v10 mailboxObjectIDs];
  id v7 = objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_352);

  id v8 = [(EDMessageRepository *)self messageChangeManager];
  int v9 = [v10 destinationMailboxURL];
  [v8 transferAllMessagesFromMailboxes:v7 exceptMessages:v4 transferType:v5 ^ 1u destinationMailboxURL:v9 userInitiated:1];
}

id __56__EDMessageRepository__performMessageTransferAllAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];

  return v2;
}

- (id)_performMessageTransferActionToSpecialMailbox:(id)a3 returnUndoAction:(BOOL)a4
{
  id v7 = a3;
  id v8 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v7];
  int v9 = [v7 copyMessages];
  uint64_t v10 = [v7 specialDestinationMailboxType];
  id v11 = objc_msgSend(v8, "ef_groupBy:", &__block_literal_global_355);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__25;
  long long v27 = __Block_byref_object_dispose__25;
  id v28 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke_2;
  v16[3] = &unk_1E6C039D0;
  uint64_t v19 = v10;
  uint64_t v20 = v9 ^ 1u;
  v16[4] = self;
  BOOL v22 = a4;
  id v12 = v7;
  SEL v21 = a2;
  id v17 = v12;
  long long v18 = &v23;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v13 = [(id)v24[5] reverseObjectEnumerator];
  uint64_t v14 = [v13 allObjects];

  _Block_object_dispose(&v23, 8);

  return v14;
}

id __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 account];
  BOOL v4 = v3;
  if ([v3 isLocalAccount])
  {
    int v5 = [v2 sendLaterDate];

    BOOL v4 = v3;
    if (v5)
    {
      uint64_t v6 = [v2 accountForSender];

      BOOL v4 = (void *)v6;
    }
  }
  if (!v4 || ([v4 conformsToProtocol:&unk_1F35FE498] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];

    BOOL v4 = (void *)v7;
  }

  return v4;
}

void __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v23 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [v23 mailboxForType:*(void *)(a1 + 56)];
    int v9 = objc_opt_new();
    uint64_t v10 = [*(id *)(a1 + 32) messageChangeManager];
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [v8 URL];
    [v10 transferMessages:v5 transferType:v11 destinationMailboxURL:v12 userInitiated:1 oldMessagesByNewMessage:v9];

    if (*(unsigned char *)(a1 + 80))
    {
      if ([*(id *)(a1 + 40) copyMessages])
      {
        uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"EDMessageRepository.m", 1362, @"An undo action was requested for a copy, that's not yet supported" object file lineNumber description];
      }
      else
      {
        uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v14)
        {
          uint64_t v15 = objc_opt_new();
          uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
          id v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;

          uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        uint64_t v13 = [*(id *)(a1 + 32) _undoActionsForMovedMessages:v9];
        [v14 addObjectsFromArray:v13];
      }
    }
    long long v18 = [*(id *)(a1 + 40) flagChange];

    if (v18)
    {
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = [v9 allKeys];
      SEL v21 = [*(id *)(a1 + 40) flagChange];
      BOOL v22 = [v19 _changeFlagsForPersistedMessages:v20 flagChange:v21 returnUndoAction:*(unsigned __int8 *)(a1 + 80)];

      if (*(unsigned char *)(a1 + 80)) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v22];
      }
    }
  }
}

- (void)_performMessageTransferAllActionToSpecialMailbox:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v19 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v15];
  int v4 = [v15 copyMessages];
  uint64_t v18 = [v15 specialDestinationMailboxType];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v15 mailboxObjectIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v17 = v4 ^ 1u;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v20 + 1) + 8 * v7) url];
        int v9 = [(EDMessageRepository *)self messageChangeManager];
        uint64_t v10 = [v9 accountForMailboxURL:v8];

        uint64_t v11 = [v10 mailboxForType:v18];
        id v12 = [(EDMessageRepository *)self messageChangeManager];
        id v24 = v8;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        uint64_t v14 = [v11 URL];
        [v12 transferAllMessagesFromMailboxes:v13 exceptMessages:v19 transferType:v17 destinationMailboxURL:v14 userInitiated:1];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

- (id)_undoActionsForMovedMessages:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke;
  v11[3] = &unk_1E6C039F8;
  id v5 = v4;
  id v12 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_2;
  v9[3] = &unk_1E6C03A20;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = [a3 mailbox];
  uint64_t v6 = [v5 URL];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  [v7 addObject:v8];
}

void __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60500]);
  [v6 setActionType:0];
  [v6 setDestinationMailboxURL:v8];
  id v7 = objc_msgSend(v5, "ef_map:", &__block_literal_global_359);
  [v6 setMessageDatabaseIDs:v7];

  [*(id *)(a1 + 32) addObject:v6];
}

id __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = [a2 persistentID];
  int v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  return v4;
}

- (id)_performUndoAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  int v4 = [(EDMessageRepository *)self messagePersistence];
  uint64_t v18 = [(EDMessageRepository *)self messageChangeManager];
  id v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v17 individualActions];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 messageDatabaseIDs];
        uint64_t v11 = [v4 persistedMessagesForDatabaseIDs:v10 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];

        switch([v9 actionType])
        {
          case 0:
            id v12 = objc_opt_new();
            uint64_t v13 = [v9 destinationMailboxURL];
            [v18 transferMessages:v11 transferType:1 destinationMailboxURL:v13 userInitiated:1 oldMessagesByNewMessage:v12];

            uint64_t v14 = [(EDMessageRepository *)self _undoActionsForMovedMessages:v12];
            [v5 addObjectsFromArray:v14];
            goto LABEL_13;
          case 1:
            id v12 = [v9 flagChange];
            uint64_t v14 = [(EDMessageRepository *)self _changeFlagsForPersistedMessages:v11 flagChange:v12 returnUndoAction:1];
            [v5 addObjectsFromArray:v14];
            goto LABEL_13;
          case 2:
            id v12 = [v9 readLaterDate];
            uint64_t v14 = [(EDMessageRepository *)self _performMessageReadLaterDate:v12 persistedMessages:v11 returnUndoAction:1];
            [v5 addObjectsFromArray:v14];
            goto LABEL_13;
          case 3:
            id v12 = [v9 followUp];
            uint64_t v14 = [(EDMessageRepository *)self _performMessageFollowUpDate:v12 persistedMessages:v11 returnUndoAction:1];
            [v5 addObjectsFromArray:v14];
            goto LABEL_13;
          case 4:
            id v12 = -[EDMessageRepository _performBlockSender:persistedMessages:returnUndoAction:](self, "_performBlockSender:persistedMessages:returnUndoAction:", [v9 blockSender], v11, 1);
            [v5 addObjectsFromArray:v12];
            goto LABEL_14;
          case 5:
            id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "conversationID"));
            id v24 = v12;
            uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
            id v15 = -[EDMessageRepository _performConversationIDs:conversationNotificationLevel:returnUndoAction:](self, "_performConversationIDs:conversationNotificationLevel:returnUndoAction:", v14, [v9 conversationNotificationLevel], 1);
            [v5 addObjectsFromArray:v15];

LABEL_13:
LABEL_14:

            break;
          default:
            break;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return v5;
}

- (id)_performMessageConversationFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 conversationIDs];
  id v8 = -[EDMessageRepository _performConversationIDs:conversationNotificationLevel:returnUndoAction:](self, "_performConversationIDs:conversationNotificationLevel:returnUndoAction:", v7, [v6 conversationNotificationLevel], v4);

  return v8;
}

- (id)_performConversationIDs:(id)a3 conversationNotificationLevel:(int64_t)a4 returnUndoAction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = [(EDMessageRepository *)self conversationPersistence];
  BOOL v23 = v5;
  int64_t v21 = a4;
  long long v22 = self;
  int v9 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v24;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int64_t v15 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", objc_msgSend(v8, "persistenceConversationFlagsForConversationID:", objc_msgSend(v14, "longLongValue")));
        uint64_t v16 = [NSNumber numberWithInteger:v15];
        [v9 setObject:v16 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  if (v23)
  {
    id v17 = objc_opt_new();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __94__EDMessageRepository__performConversationIDs_conversationNotificationLevel_returnUndoAction___block_invoke;
    v25[3] = &unk_1E6C03A48;
    id v18 = v17;
    id v26 = v18;
    [v9 enumerateKeysAndObjectsUsingBlock:v25];
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = [(EDMessageRepository *)v22 conversationPersistence];
  [v19 updateConversationNotificationLevel:v21 forConversationIDs:v10];

  return v18;
}

void __94__EDMessageRepository__performConversationIDs_conversationNotificationLevel_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60500]);
  [v6 setActionType:5];
  objc_msgSend(v6, "setConversationID:", objc_msgSend(v7, "longLongValue"));
  objc_msgSend(v6, "setConversationNotificationLevel:", objc_msgSend(v5, "longLongValue"));
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)persistentIDForMessageObjectID:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(EDMessageRepository *)self messagePersistence];
  v13[0] = v6;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = [v8 databaseIDsDictionaryForMessageObjectIDs:v9];

  uint64_t v11 = [v10 allKeys];
  uint64_t v12 = [v11 firstObject];
  v7[2](v7, v12);
}

- (void)performMessageHighImpactChangeAction:(id)a3
{
  id v11 = a3;
  BOOL v4 = -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  id v5 = [(EDMessageRepository *)self categoryPersistence];
  objc_msgSend(v5, "changeHighImpactType:messages:", objc_msgSend(v11, "highImpactChange"), v4);

  if ([v4 count])
  {
    id v6 = [v4 firstObject];
    id v7 = [v6 category];
    [v7 subtype];
    uint64_t v8 = EMCategoryFromSubtype();

    int v9 = [(EDMessageRepository *)self categoryAnalyticsLogger];
    id v10 = [(EDMessageRepository *)self categoryPersistence];
    [v9 logRecategorizationEventForMessages:v4 categoryType:v8 categoryPersistence:v10 isHighImpactFlagChange:1];
  }
}

- (void)_performRestoreModelCategoryForAllMessagesChangeAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(EDMessageRepository *)self businessPersistence];
  id v5 = [v4 businessAddressMapWithCategoryOverride];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        int v9 = (void *)MEMORY[0x1E0190280]();
        id v10 = [obj objectForKey:v8];
        if (v10)
        {
          id v11 = [(EDMessageRepository *)self messagePersistence];
          uint64_t v12 = [v11 persistedMessagesFromSendersWithAddressIDs:v10 temporarilyUnavailableMessageObjectIDs:0];

          if ([v12 count])
          {
            uint64_t v13 = [v12 firstObject];
            uint64_t v14 = [v13 category];
            [v14 subtype];
            uint64_t v15 = EMCategoryFromSubtype();

            uint64_t v16 = [(EDMessageRepository *)self categoryAnalyticsLogger];
            id v17 = [(EDMessageRepository *)self categoryPersistence];
            [v16 logRecategorizationEventForMessages:v12 categoryType:v15 categoryPersistence:v17];
          }
        }

        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  id v18 = [(EDMessageRepository *)self businessPersistence];
  [v18 removeAllUserOverrides];
}

- (id)_mostRecentMessageForPersistedMessages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 firstObject];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "displayDate", (void)v15);
        id v11 = [v4 displayDate];
        int v12 = objc_msgSend(v10, "ef_isLaterThanDate:", v11);

        if (v12)
        {
          id v13 = v9;

          BOOL v4 = v13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_performCategoryChangeAction:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 isModelCategoryRestoration];
  uint64_t v7 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v4];
  uint64_t v8 = [(EDMessageRepository *)self categoryAnalyticsLogger];
  int v9 = [(EDMessageRepository *)self categoryPersistence];
  [v8 logFedStatRecategorizationEventForMessages:v7 categoryChangeAction:v4 categoryPersistence:v9];

  [(EDMessageRepository *)self _logRecategorizeAnalyticsWithPersistedMessages:v7 isRestoreModelCategory:v6 categoryChangeAction:v4];
  if ([v7 count])
  {
    id v10 = [(EDMessageRepository *)self _mostRecentMessageForPersistedMessages:v7];
    uint64_t v11 = [v10 businessID];
  }
  else
  {
    int v12 = [v4 senderAddress];

    if (!v12) {
      goto LABEL_14;
    }
    id v13 = [(EDMessageRepository *)self messagePersistence];
    uint64_t v14 = [v4 senderAddress];
    uint64_t v15 = [v13 findAddressIDForAddress:v14];

    id v10 = [(EDMessageRepository *)self businessPersistence];
    uint64_t v11 = [v10 businessIDForAddressID:v15];
  }
  uint64_t v16 = v11;
  uint64_t v17 = *MEMORY[0x1E4F5FCC8];

  if (v16 != v17)
  {
    icloudSyncScheduler = self->_icloudSyncScheduler;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __52__EDMessageRepository__performCategoryChangeAction___block_invoke;
    long long v30 = &unk_1E6C022D8;
    id v31 = self;
    uint64_t v34 = v16;
    id v19 = v4;
    id v32 = v19;
    id v20 = v5;
    id v33 = v20;
    char v35 = v6;
    [(EFScheduler *)icloudSyncScheduler performBlock:&v27];
    if (v6)
    {
      long long v21 = +[EDMessageRepository log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v38 = v16;
        _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Restoring automatic model categorization for sender with businessID %lld", buf, 0xCu);
      }

      [(EDMessageRepository *)self _removeCategoryCloudStorageForBusiness:v16 lastModifiedDate:v20];
      long long v22 = [(EDMessageRepository *)self businessPersistence];
      long long v23 = [NSNumber numberWithLongLong:v16];
      v41[0] = v23;
      long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      [v22 removeUserOverridesForBusinessIDs:v24 timestamp:v20];
    }
    else
    {
      uint64_t v25 = +[EDMessageRepository log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v19 categoryType];
        *(_DWORD *)buf = 134218240;
        uint64_t v38 = v16;
        __int16 v39 = 2048;
        uint64_t v40 = v26;
        _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Moving sender with businessID %lld to category %lu", buf, 0x16u);
      }

      -[EDMessageRepository _performCloudStorageUpdateForBusiness:withCategory:lastModifiedDate:](self, "_performCloudStorageUpdateForBusiness:withCategory:lastModifiedDate:", v16, [v19 categoryType], v20);
      long long v22 = [(EDMessageRepository *)self businessPersistence];
      long long v23 = [NSNumber numberWithLongLong:v16];
      long long v36 = v23;
      long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      objc_msgSend(v22, "insertOrUpdateUserOverrideForBusinessIDs:category:timestamp:", v24, objc_msgSend(v19, "categoryType"), v20);
    }
  }
LABEL_14:
}

void __52__EDMessageRepository__performCategoryChangeAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) businessPersistence];
  id v4 = [v2 addressesForBusinessID:*(void *)(a1 + 56)];

  id v3 = [*(id *)(a1 + 32) _findMessagesForAddresses:v4];
  objc_msgSend(*(id *)(a1 + 32), "_syncRuleToWebForMessages:withCategory:atTimestamp:restoreModelCategory:", v3, objc_msgSend(*(id *)(a1 + 40), "categoryType"), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

- (void)_logRecategorizeAnalyticsWithPersistedMessages:(id)a3 isRestoreModelCategory:(BOOL)a4 categoryChangeAction:(id)a5
{
  BOOL v6 = a4;
  id v19 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 categoryType];
  if ([v19 count])
  {
    id v10 = [v19 firstObject];
    uint64_t v11 = v10;
    if (v6)
    {
      int v12 = [v10 category];
      [v12 subtype];
      uint64_t v9 = EMCategoryFromSubtype();
    }
    id v13 = [v11 category];
    int v14 = [v13 isPrimary];

    if (v14)
    {
      uint64_t v15 = [(EDMessageRepository *)self messagePersistence];
      uint64_t v16 = objc_msgSend(v15, "persistedMessagesForBusinessID:", objc_msgSend(v11, "businessID"));

      uint64_t v17 = [(EDMessageRepository *)self categoryAnalyticsLogger];
      long long v18 = [(EDMessageRepository *)self categoryPersistence];
      [v17 logRecategorizationEventForMessages:v16 categoryType:v9 categoryPersistence:v18];
    }
    else
    {
      uint64_t v16 = [(EDMessageRepository *)self categoryAnalyticsLogger];
      uint64_t v17 = [(EDMessageRepository *)self categoryPersistence];
      [v16 logRecategorizationEventForMessages:v19 categoryType:v9 categoryPersistence:v17];
    }
  }
}

- (void)_logCategoryMetadataForChangeAction:(id)a3
{
  id v6 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:a3];
  id v4 = [(EDMessageRepository *)self categoryAnalyticsLogger];
  id v5 = [(EDMessageRepository *)self categoryPersistence];
  [v4 logModelMetadataForMessages:v6 categoryPersistence:v5];
}

- (id)_messageHeadersForBusinessID:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(EDMessageRepository *)self accountsProvider];
  id v6 = [v5 mailAccounts];

  id v20 = objc_alloc_init(EDAccountECAccountTransformer);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 primaryiCloudAccount])
        {
          int v12 = [(EDAccountECAccountTransformer *)v20 transformAccount:v11];
          id v13 = [(EDMessageRepository *)self messagePersistence];
          int v14 = [(EDMessageRepository *)self _messageQueryForBusinessInIcloudCheckForBusinessID:a3 forAccount:v12];
          uint64_t v15 = [v13 persistedMessagesMatchingQuery:v14 limit:1];

          if (v15)
          {
            long long v18 = [v15 firstObject];
            uint64_t v17 = [v18 headersIfAvailable];

            goto LABEL_15;
          }
          uint64_t v16 = +[EDMessageRepository log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v26 = a3;
            _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "No persistedMessages found for business ID: %lld", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v17 = 0;
LABEL_15:

  return v17;
}

- (id)_findMessagesForAddresses:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v8 = 138543362;
    long long v15 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v12 = -[EDMessageRepository _messageForSenderInICloud:](self, "_messageForSenderInICloud:", v11, v15, (void)v16);
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          id v13 = +[EDMessageRepository log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v11;
            _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_INFO, "Failed to find any messages for address %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_messageForSenderInICloud:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v4 = [(EDMessageRepository *)self accountsProvider];
  id v5 = [v4 mailAccounts];

  id v6 = objc_alloc_init(EDAccountECAccountTransformer);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 primaryiCloudAccount])
        {
          int v12 = [(EDAccountECAccountTransformer *)v6 transformAccount:v11];
          id v13 = [(EDMessageRepository *)self messagePersistence];
          int v14 = [(EDMessageRepository *)self _messageQueryForSenderInICloud:v19 forAccount:v12];
          long long v15 = [v13 persistedMessagesMatchingQuery:v14 limit:1];

          if (v15)
          {
            long long v17 = [v15 firstObject];

            goto LABEL_15;
          }
          long long v16 = +[EDMessageRepository log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v25 = v19;
            _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "No persistedMessages found for sender: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v17 = 0;
LABEL_15:

  return v17;
}

- (id)_messageQueryForSenderInICloud:(id)a3 forAccount:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F60390] predicateForMessagesWithSender:a3 forAccount:a4];
  id v5 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = (void *)[v5 initWithTargetClass:v6 predicate:v4 sortDescriptors:v8];

  return v9;
}

- (void)_syncRuleToWebForMessages:(id)a3 withCategory:(unint64_t)a4 atTimestamp:(id)a5 restoreModelCategory:(BOOL)a6
{
  BOOL v34 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v37 = a5;
  id v31 = objc_alloc_init(getMCCSecretAgentControllerClass_2());
  uint64_t v38 = objc_opt_new();
  RCOverrideRuleClass_0 = getRCOverrideRuleClass_0();
  Property = class_getProperty(RCOverrideRuleClass_0, "xAppleRequestHeader");
  Name = property_getName(Property);
  uint64_t v9 = getRCOverrideRuleClass_0();
  id v10 = class_getProperty(v9, "messageIdHeader");
  long long v36 = property_getName(v10);
  uint64_t v11 = getRCOverrideRuleClass_0();
  int v12 = class_getProperty(v11, "category");
  id v33 = property_getName(v12);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v30;
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v40;
    uint64_t v15 = *MEMORY[0x1E4F60750];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v18 = objc_alloc_init(getRCOverrideRuleClass_0());
        id v19 = [v17 messageIDHeader];
        long long v20 = [NSString stringWithUTF8String:v36];
        [v18 setValue:v19 forKey:v20];

        long long v21 = [v17 headers];
        long long v22 = [v21 firstHeaderForKey:v15];

        long long v23 = [NSString stringWithUTF8String:Name];
        if (v22) {
          long long v24 = v22;
        }
        else {
          long long v24 = &stru_1F3583658;
        }
        objc_msgSend(v18, "setValue:forKey:", v24, v23, v30);

        EMStringFromCategoryType();
        id v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int64_t v26 = v25;
        if (v34)
        {

          int64_t v26 = &stru_1F3583658;
        }
        uint64_t v27 = [NSString stringWithUTF8String:v33];
        [v18 setValue:v26 forKey:v27];

        uint64_t v28 = NSNumber;
        [v37 timeIntervalSince1970];
        long long v29 = objc_msgSend(v28, "numberWithDouble:");
        [v18 setCategoryUpdateTime:v29];

        [v38 addObject:v18];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v13);
  }

  [v31 syncRecategorizationRules:v38 completion:&__block_literal_global_371];
}

void __95__EDMessageRepository__syncRuleToWebForMessages_withCategory_atTimestamp_restoreModelCategory___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = +[EDMessageRepository log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v4, "ef_publicDescription");
      __81__EDBusinessCloudStorage__updateIcloudSyncwithMessageHeaders_category_timestamp___block_invoke_cold_1(v6, v7, v5);
    }
  }
}

- (id)_messageQueryForBusinessInIcloudCheckForBusinessID:(int64_t)a3 forAccount:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F60390] predicateForMessagesForBusinessID:a3 forAccount:a4];
  id v5 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = (void *)[v5 initWithTargetClass:v6 predicate:v4 sortDescriptors:v8];

  return v9;
}

- (void)_performCloudStorageUpdateForBusiness:(int64_t)a3 withCategory:(unint64_t)a4 lastModifiedDate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(EDMessageRepository *)self asyncWorkScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __91__EDMessageRepository__performCloudStorageUpdateForBusiness_withCategory_lastModifiedDate___block_invoke;
  v11[3] = &unk_1E6C01620;
  void v11[4] = self;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  id v10 = v8;
  id v12 = v10;
  [v9 performVoucherPreservingBlock:v11];
}

void __91__EDMessageRepository__performCloudStorageUpdateForBusiness_withCategory_lastModifiedDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) businessPersistence];
  id v4 = [v2 businessExternalIDForBusinessID:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) businessCloudStorage];
  [v3 setCategory:*(void *)(a1 + 56) forBusinessWithExternalID:v4 withLastModifiedDate:*(void *)(a1 + 40)];
}

- (void)_removeCategoryCloudStorageForBusiness:(int64_t)a3 lastModifiedDate:(id)a4
{
  id v6 = a4;
  id v7 = [(EDMessageRepository *)self asyncWorkScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__EDMessageRepository__removeCategoryCloudStorageForBusiness_lastModifiedDate___block_invoke;
  v9[3] = &unk_1E6C00900;
  void v9[4] = self;
  int64_t v11 = a3;
  id v8 = v6;
  id v10 = v8;
  [v7 performVoucherPreservingBlock:v9];
}

void __79__EDMessageRepository__removeCategoryCloudStorageForBusiness_lastModifiedDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) businessPersistence];
  id v4 = [v2 businessExternalIDForBusinessID:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) businessCloudStorage];
  [v3 removeCategoryForBusinessWithExternalID:v4 withLastModifiedDate:*(void *)(a1 + 40)];
}

- (void)_performSuppressNotAuthenticatedChangeAction:(id)a3
{
  id v5 = a3;
  id v6 = [v5 objectIDs];
  id v7 = [v6 firstObject];

  id v8 = [(EDMessageRepository *)self _persistedMessagesForMessageChangeAction:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"EDMessageRepository.m" lineNumber:1744 description:@"EMMessageObjectID not found in EMSuppressNotAuthenticatedAction"];
  }
  if (![v8 count])
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"EDMessageRepository.m" lineNumber:1745 description:@"Cannot find persistedMessage for EMSuppressNotAuthenticatedAction"];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__EDMessageRepository__performSuppressNotAuthenticatedChangeAction___block_invoke;
  v22[3] = &unk_1E6C00738;
  id v10 = v9;
  id v23 = v10;
  [v8 enumerateObjectsUsingBlock:v22];
  int64_t v11 = [(EDMessageRepository *)self messagePersistence];
  char v12 = [v11 persistMessageAuthenticationStates:v10];

  if ((v12 & 1) == 0)
  {
    int64_t v13 = +[EDMessageRepository log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[EDMessageRepository _performSuppressNotAuthenticatedChangeAction:]((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void __68__EDMessageRepository__performSuppressNotAuthenticatedChangeAction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "authenticationState") | 0x10000);
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

- (id)_persistedMessagesForMessageChangeAction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__25;
  uint64_t v17 = __Block_byref_object_dispose__25;
  id v18 = 0;
  id v5 = [(EDMessageRepository *)self messagePersistence];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__EDMessageRepository__persistedMessagesForMessageChangeAction___block_invoke;
  v9[3] = &unk_1E6C01B78;
  id v6 = v4;
  int64_t v11 = self;
  char v12 = &v13;
  id v10 = v6;
  [v5 performDatabaseWorkInBlockWithHighPriority:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __64__EDMessageRepository__persistedMessagesForMessageChangeAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) query];

  if (v2)
  {
    id v9 = [*(id *)(a1 + 40) messagePersistence];
    id v3 = [*(id *)(a1 + 32) query];
    uint64_t v4 = [v9 persistedMessagesMatchingQuery:v3 limit:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) objectIDs];
    objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 40) _persistedMessagesForObjectIDs:v9 includeDuplicates:objc_opt_isKindOfClass() & 1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)_persistedMessagesForObjectIDs:(id)a3 includeDuplicates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(EDMessageRepository *)self _persistedObjectIDsForObjectIDs:a3];
  uint64_t v8 = v7;
  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __72__EDMessageRepository__persistedMessagesForObjectIDs_includeDuplicates___block_invoke;
    v13[3] = &unk_1E6C03A70;
    v13[4] = self;
    v13[5] = a2;
    uint64_t v9 = objc_msgSend(v7, "ef_map:", v13);

    uint64_t v8 = (void *)v9;
  }
  id v10 = [(EDMessageRepository *)self messagePersistence];
  int64_t v11 = [v10 persistedMessagesForObjectIDs:v8 requireProtectedData:0];

  return v11;
}

id __72__EDMessageRepository__persistedMessagesForObjectIDs_includeDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc(MEMORY[0x1E4F603A0]);
    uint64_t v5 = [v3 collectionItemID];
    id v6 = [MEMORY[0x1E4F60318] allMailboxesScope];
    id v7 = (id)[v4 initWithCollectionItemID:v5 mailboxScope:v6];

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc(MEMORY[0x1E4F604E0]);
    uint64_t v5 = [v3 collectionItemID];
    id v9 = objc_alloc(MEMORY[0x1E4F604F0]);
    id v10 = [MEMORY[0x1E4F60318] allMailboxesScope];
    int64_t v11 = [v3 threadScope];
    char v12 = [v11 filterPredicate];
    uint64_t v13 = (void *)[v9 initWithMailboxScope:v10 filterPredicate:v12];
    id v7 = (id)[v8 initWithCollectionItemID:v5 threadScope:v13];

    goto LABEL_5;
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"EDMessageRepository.m" lineNumber:1785 description:@"Unknown objectID class"];

  id v7 = v3;
LABEL_7:

  return v7;
}

- (id)_persistedObjectIDsForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_387);
  if ([v5 count] && (uint64_t v6 = objc_msgSend(v5, "count"), v6 == objc_msgSend(v4, "count")))
  {
    id v7 = [(EDMessageRepository *)self messagePersistence];
    id v8 = [(EDMessageRepository *)self _messageQueryForGroupedSenderObjectIDs:v5];
    id v9 = [v7 messagesMatchingQuery:v8];
    id v10 = objc_msgSend(v9, "ef_map:", &__block_literal_global_390);

    id v11 = [(EDMessageRepository *)self _persistedObjectIDsForObjectIDs:v10];
  }
  else
  {
    char v12 = [(EDMessageRepository *)self _partitionObjectIDs:v4];
    uint64_t v13 = [v12 messageObjectIDs];
    uint64_t v14 = (void *)[v13 mutableCopy];

    uint64_t v15 = [v12 threadObjectIDsByScope];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke_3;
    v17[3] = &unk_1E6C03AD8;
    id v11 = v14;
    id v18 = v11;
    [(EDMessageRepository *)self _enumerateObjectIDsByScope:v15 usingBlock:v17];
  }

  return v11;
}

id __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 objectID];

  return v2;
}

void __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v15 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4)
  {
    [*(id *)(a1 + 32) addObject:v15];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v12 inMemoryMessageObjectIDsForThread:v11];
        [*(id *)(a1 + 32) addObjectsFromArray:v14];
      }
    }
  }
}

- (id)_messageQueryForGroupedSenderObjectIDs:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F60390];
  uint64_t v5 = [v3 firstObject];
  uint64_t v6 = [v5 threadScope];
  id v7 = [v4 predicateForMessagesWithThreadScope:v6];

  id v8 = objc_msgSend(v3, "ef_map:", &__block_literal_global_393);
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v7;
  id v10 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];
  v20[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v12 = [v9 andPredicateWithSubpredicates:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v14 = objc_opt_class();
  id v15 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  uint64_t v19 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v17 = (void *)[v13 initWithTargetClass:v14 predicate:v12 sortDescriptors:v16];

  return v17;
}

id __62__EDMessageRepository__messageQueryForGroupedSenderObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F60390], "predicateForMessagesForBusinessID:", objc_msgSend(v2, "businessID"));

  return v3;
}

- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EDMessageRepository *)self serializationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke;
  v15[3] = &unk_1E6C03B20;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
  v32[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v5 = [v2 persistedMessagesForDatabaseIDs:v4 requireProtectedData:0 temporarilyUnavailableDatabaseIDs:0];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = [v6 basePath];
    if (v7)
    {
      id v8 = +[EDMessageRepository log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v28 = 138412546;
        uint64_t v29 = v9;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Requesting rich link metadata for rich link id: %@ in base path: %@", (uint8_t *)&v28, 0x16u);
      }

      id v10 = [*(id *)(a1 + 32) richLinkPersistence];
      id v11 = [[EDPersistedRichLinkID alloc] initWithString:*(void *)(a1 + 48)];
      id v12 = [v6 basePath];
      id v13 = [v10 richLinkMetadataDataForPersistentID:v11 basePath:v12];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      long long v21 = +[EDMessageRepository log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_2((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v14 = +[EDMessageRepository log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(a1 + 40, v14, v15, v16, v17, v18, v19, v20);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)requestAttachmentMetadataForMessageIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageRepository *)self serializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__EDMessageRepository_requestAttachmentMetadataForMessageIDs_completionHandler___block_invoke;
  block[3] = &unk_1E6C01BF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __80__EDMessageRepository_requestAttachmentMetadataForMessageIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  id v5 = [v2 messageIDsWithBasePaths:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) attachmentPersistenceManager];
  id v4 = [v3 attachmentURLsForGlobalMessageIDs:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDMessageRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Fetching rich link URLs for global message IDs: %@", buf, 0xCu);
  }

  id v9 = [(EDMessageRepository *)self serializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__EDMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke;
  block[3] = &unk_1E6C01BF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __74__EDMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) richLinkPersistence];
  id v3 = [v2 richLinkURLsForMessageIDs:*(void *)(a1 + 40)];

  id v4 = +[EDMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Found rich link URLs: %@ for global message IDs: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v30 = a7;
  uint64_t v15 = [MEMORY[0x1E4F60278] signpostLog];
  id v16 = v15;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EDMessageRepositoryContentRepresentationRequest", "Received by maild", buf, 2u);
  }

  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"requesting content representation"];
  uint64_t v17 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v12;
    __int16 v43 = 2114;
    id v44 = v13;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_INFO, "Requesting content representation for message %{public}@, Options: %{public}@", buf, 0x16u);
  }

  uint64_t v18 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v19 = [v18 future];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke;
  v37[3] = &unk_1E6C03B48;
  id v20 = v12;
  id v38 = v20;
  unint64_t v40 = a4;
  id v21 = v30;
  id v39 = v21;
  [v19 addSuccessBlock:v37];

  uint64_t v22 = [v18 future];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_400;
  v33[3] = &unk_1E6C03B70;
  unint64_t v36 = a4;
  id v23 = v20;
  id v34 = v23;
  id v24 = v21;
  id v35 = v24;
  [v22 addFailureBlock:v33];

  uint64_t v25 = [(EDMessageRepository *)self messagePersistence];
  uint64_t v26 = [v18 completionHandlerAdapter];
  uint64_t v27 = [v25 requestContentForMessageObjectID:v23 requestID:a4 options:v13 delegate:v14 completionHandler:v26];

  if (v27)
  {
    int v28 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    [v28 addChild:v27 withPendingUnitCount:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_402;
    v31[3] = &unk_1E6BFF2F0;
    id v32 = v18;
    [v28 setCancellationHandler:v31];
  }
  else
  {
    int v28 = 0;
  }

  return v28;
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "Content representation finished loading: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  int v6 = [MEMORY[0x1E4F60278] signpostLog];
  id v7 = v6;
  os_signpost_id_t v8 = a1[6];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EDMessageRepositoryContentRepresentationRequest", "Finished processing with success", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_400(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60278] signpostLog];
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v11 = 134349056;
    uint64_t v12 = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageRepositoryContentRepresentationRequest", "Finished processing with failure %{public, name=errorCode}ld", (uint8_t *)&v11, 0xCu);
  }

  id v7 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_400_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = objc_msgSend(v3, "ef_secureCodableError");
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2048 userInfo:0];
  }
  (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v10);
  if (!v9) {
}
  }

uint64_t __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_402(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)resetPrecomputedThreadScopesForMailboxScope:(id)a3
{
  id v4 = a3;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"resetting precomputed threads"];
  uint64_t v5 = [(EDMessageRepository *)self performQueryOnSerializationQueue];
  [v5 lock];

  os_signpost_id_t v6 = [(EDMessageRepository *)self performQueryOnSerializationQueue];
  [v6 unlockWithCondition:1];

  id v7 = [(EDMessageRepository *)self serializationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__EDMessageRepository_resetPrecomputedThreadScopesForMailboxScope___block_invoke;
  v9[3] = &unk_1E6BFFAF0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __67__EDMessageRepository_resetPrecomputedThreadScopesForMailboxScope___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadPersistence];
  [v2 resetThreadScopesForMailboxScope:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) performQueryOnSerializationQueue];
  [v3 lock];

  id v4 = [*(id *)(a1 + 32) performQueryOnSerializationQueue];
  [v4 unlockWithCondition:0];
}

- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"setting cached metadata"];
  int v11 = [(EDMessageRepository *)self serializationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__EDMessageRepository_setCachedMetadataJSON_forKey_messageID___block_invoke;
  v15[3] = &unk_1E6BFFA78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__EDMessageRepository_setCachedMetadataJSON_forKey_messageID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  [v2 setCachedMetadataJSON:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) messageID:*(void *)(a1 + 56)];
}

- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"getting cached metadata"];
  id v10 = [(EDMessageRepository *)self messagePersistence];
  int v11 = [v10 cachedMetadataJSONForKey:v12 messageID:v8];

  v9[2](v9, v11);
}

- (void)metadataForAddresses:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  os_signpost_id_t v6 = (void (**)(id, void *))a4;
  id v7 = [(EDMessageRepository *)self messagePersistence];
  id v8 = [v7 metadataForAddresses:v9];

  v6[2](v6, v8);
}

- (void)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5 completionHandler:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  int v11 = (void (**)(id, void *))a6;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"getting messages in conversationIDs"];
  p_handlersLocuint64_t k = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  id v13 = [(EDMessageRepository *)self queryHandlers];
  id v14 = [v13 objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(p_handlersLock);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = [v14 messagesInConversationIDs:v16 limit:a4];
  }
  else
  {
    uint64_t v15 = 0;
  }
  v11[2](v11, v15);
}

- (void)predictMailboxForMovingMessages:(id)a3 withObserver:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(EDMessageRepository *)self asyncWorkScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke;
  v15[3] = &unk_1E6C01A40;
  v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v11 performBlock:v15];
}

void __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagePersistence];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6C01A40;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 performDatabaseWorkInBlockWithHighPriority:v4];
}

void __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetUpdateThrottlersWithLogMessage:@"mailbox prediction"];
  id v2 = [*(id *)(a1 + 32) _persistedObjectIDsForObjectIDs:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) mailboxPredictionController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6C03B98;
  id v6 = *(id *)(a1 + 48);
  id v4 = [v3 predictMailboxForMovingObjectIDs:v2 completionHandler:v5];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mailboxWasPredicted:a2];
}

- (id)mailboxPredictionController
{
  p_mailboxPredictionControllerLocuint64_t k = &self->_mailboxPredictionControllerLock;
  os_unfair_lock_lock(&self->_mailboxPredictionControllerLock);
  mailboxPredictionController = self->_mailboxPredictionController;
  if (!mailboxPredictionController)
  {
    id v5 = [EDMailboxPredictionController alloc];
    id v6 = [(EDMessageRepository *)self messagePersistence];
    id v7 = [(EDMessageRepository *)self mailboxPersistence];
    id v8 = [(EDMessageRepository *)self hookRegistry];
    id v9 = [(EDMessageRepository *)self userProfileProvider];
    id v10 = [(EDMailboxPredictionController *)v5 initWithMessagePersistence:v6 mailboxPersistence:v7 hookRegistry:v8 userProfileProvider:v9];
    int v11 = self->_mailboxPredictionController;
    self->_mailboxPredictionController = v10;

    mailboxPredictionController = self->_mailboxPredictionController;
  }
  id v12 = mailboxPredictionController;
  os_unfair_lock_unlock(p_mailboxPredictionControllerLock);

  return v12;
}

- (void)loadOlderMessagesForMailboxes:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EDMessageRepository *)self _resetUpdateThrottlersWithLogMessage:@"loading older messages"];
  id v5 = +[EDMessageRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Loading older messages for %lu mailboxes", (uint8_t *)&v6, 0xCu);
  }

  [(EDFetchController *)self->_fetchController performFetchOfType:65664 mailboxObjectIds:v4];
}

- (void)messageObjectIDForURL:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  int v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = [(EDMessageRepository *)self messagePersistence];
  uint64_t v8 = [v7 messageObjectIDForURL:v10];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"invalid URL");
  }
  v6[2](v6, v8, v9);
  if (!v8) {
}
  }

- (void)messageObjectIDsForSearchableItemIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = (void (**)(id, void *, void *, void))a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  uint64_t v22 = objc_opt_new();
  id v21 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v19;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        id v12 = [(EDMessageRepository *)self messagePersistence];
        uint64_t v13 = [v11 longLongValue];
        id v23 = 0;
        uint64_t v14 = [v12 globalIDForMessageWithDatabaseID:v13 mailboxScope:&v23];
        id v15 = v23;

        if (v14 && ([v6 containsIndex:v14] & 1) == 0)
        {
          [v6 addIndex:v14];
          id v16 = (void *)[objc_alloc(MEMORY[0x1E4F603A0]) initWithGlobalMessageID:v14 mailboxScope:v15];
          [v22 addObject:v16];
          [v21 setObject:v16 forKeyedSubscript:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  id v17 = +[EDMessageRepository log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v22 count];
    *(_DWORD *)buf = 138543618;
    id v29 = v7;
    __int16 v30 = 2048;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Mapped spotlight identifiers %{public}@ to %lu message objectIDs", buf, 0x16u);
  }

  v20[2](v20, v22, v21, 0);
}

- (EDWebContentParser)remoteContentParser
{
  p_remoteContentParserLocuint64_t k = &self->_remoteContentParserLock;
  os_unfair_lock_lock(&self->_remoteContentParserLock);
  remoteContentParser = self->_remoteContentParser;
  if (!remoteContentParser)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    id v6 = [[EDWebContentParser alloc] initWithOptions:1 cancelationToken:v5];
    id v7 = self->_remoteContentParser;
    self->_remoteContentParser = v6;

    remoteContentParser = self->_remoteContentParser;
  }
  uint64_t v8 = remoteContentParser;
  os_unfair_lock_unlock(p_remoteContentParserLock);

  return v8;
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  id v5 = a3;
  id v4 = [(EDMessageRepository *)self remoteContentManager];
  [v4 noteViewOfRemoteContentLinks:v5];
}

- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  uint64_t v10 = (void (**)(id, void *, void *, id))a6;
  int v11 = [(EDMessageRepository *)self remoteContentPersistence];
  id v16 = 0;
  id v12 = [v11 getRemoteContentURLInfoOrderedBy:a3 inReverseOrder:v7 limit:a5 error:&v16];
  id v13 = v16;

  uint64_t v14 = [v12 first];
  id v15 = [v12 second];
  v10[2](v10, v14, v15, v13);
}

- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 requestID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCA0] networkUsage:0];
  int v11 = [(EDMessageRepository *)self messagePersistence];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke;
  v15[3] = &unk_1E6C03BE8;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v16 = v13;
  id v17 = self;
  id v14 = (id)[v11 requestContentForMessageObjectID:v13 requestID:a4 options:v10 delegate:0 completionHandler:v15];
}

void __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [v5 contentURL];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v7];
      id v9 = [*(id *)(a1 + 40) remoteContentParser];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke_2;
      v11[3] = &unk_1E6C03BC0;
      id v12 = *(id *)(a1 + 48);
      [v9 parseHTMLData:v8 characterEncodingName:0 withOptions:1 forMessage:0 withSubject:0 completionHandler:v11];
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 48);
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 32));
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 remoteContentLinks];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)brandIndicatorForLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageRepository *)self asyncWorkScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke;
  v11[3] = &unk_1E6C01BF0;
  void v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performVoucherPreservingBlock:v11];
}

void __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagePersistence];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6C01BF0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 performDatabaseWorkInBlockWithHighPriority:v4];
}

void __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messagePersistence];
  id v3 = [v2 brandIndicatorForURL:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)recategorizeMessageSinceDate:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMessageRepository *)self asyncWorkScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__EDMessageRepository_recategorizeMessageSinceDate___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  [v5 performVoucherPreservingBlock:v7];
}

void __52__EDMessageRepository_recategorizeMessageSinceDate___block_invoke(uint64_t a1)
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithType:7];
  id v3 = [MEMORY[0x1E4F60390] predicateForMessagesNewerThanDisplayDate:*(void *)(a1 + 32)];
  id v4 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v2;
  v13[1] = v3;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v8 = [v6 andPredicateWithSubpredicates:v7];
  id v9 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  id v12 = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v11 = (void *)[v4 initWithTargetClass:v5 predicate:v8 sortDescriptors:v10];

  [*(id *)(a1 + 40) _recategorizeMessagesForQuery:v11 completion:&__block_literal_global_436];
}

- (void)recategorizeMessagesForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageRepository *)self asyncWorkScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __63__EDMessageRepository_recategorizeMessagesForQuery_completion___block_invoke;
  v11[3] = &unk_1E6C01BF0;
  void v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performVoucherPreservingBlock:v11];
}

uint64_t __63__EDMessageRepository_recategorizeMessagesForQuery_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recategorizeMessagesForQuery:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_recategorizeMessagesForQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v19 = a4;
  id v7 = [EDMessageAuthenticationAndCategoryMigrator alloc];
  id v8 = [(EDMessageRepository *)self categoryPersistence];
  id v9 = [(EDMessageRepository *)self messageChangeManager];
  id v10 = [v9 messageCategorizer];
  int v11 = [(EDMessageRepository *)self messageChangeManager];
  id v12 = [v11 messageAuthenticator];
  id v13 = [(EDMessageRepository *)self messagePersistence];
  id v14 = [(EDMessageRepository *)self activityPersistence];
  id v15 = [(EDMessageAuthenticationAndCategoryMigrator *)v7 initWithCategoryPersistence:v8 categorizer:v10 authenticator:v12 messagePersistence:v13 activityPersistence:v14 reason:1];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__EDMessageRepository__recategorizeMessagesForQuery_completion___block_invoke;
  void v20[3] = &unk_1E6C01C80;
  id v21 = v15;
  id v16 = v19;
  id v22 = v16;
  id v17 = v15;
  id v18 = [(EDMessageAuthenticationAndCategoryMigrator *)v17 startMigrationIfNecessaryWithCategorizationQuery:v6 completion:v20];
}

void __64__EDMessageRepository__recategorizeMessagesForQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EDMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_msgSend(v3, "ef_publicDescription");
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Category migrator completed with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)countOfUserOverridesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v4 = [(EDMessageRepository *)self businessPersistence];
  [v4 countOfUserOverridesWithCompletionHandler:v5];
}

- (void)removeAllEntriesFromBusinessCloudStorage
{
  id v2 = [(EDMessageRepository *)self businessCloudStorage];
  [v2 removeAllEntries];
}

- (void)logCategoryMetadataForObjectIDs:(id)a3
{
  id v6 = [(EDMessageRepository *)self _persistedMessagesForObjectIDs:a3 includeDuplicates:0];
  id v4 = [(EDMessageRepository *)self categoryAnalyticsLogger];
  id v5 = [(EDMessageRepository *)self categoryPersistence];
  [v4 logModelMetadataForMessages:v6 categoryPersistence:v5];
}

- (void)updateLastSeenDate:(id)a3 andDisplayDate:(id)a4 forBusinessWithEmailAddress:(id)a5 category:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(EDMessageRepository *)self asyncWorkScheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__EDMessageRepository_updateLastSeenDate_andDisplayDate_forBusinessWithEmailAddress_category___block_invoke;
  v19[3] = &unk_1E6BFFAA0;
  void v19[4] = self;
  id v15 = v12;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  id v17 = v11;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  [v14 performVoucherPreservingBlock:v19];
}

void __94__EDMessageRepository_updateLastSeenDate_andDisplayDate_forBusinessWithEmailAddress_category___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v3 = [v2 preferredGroupedSenderGrouping];

  id v4 = [*(id *)(a1 + 32) businessPersistence];
  id v5 = [v4 businessExternalIDForEmailAddress:*(void *)(a1 + 40) grouping:v3];

  id v6 = [*(id *)(a1 + 32) businessCloudStorage];
  [v6 setIfNeededLastSeenDate:*(void *)(a1 + 48) andDisplayDate:*(void *)(a1 + 56) forCategoryType:*(void *)(a1 + 64) businessWithExternalID:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_lock(v8);
  uint64_t v9 = [*(id *)(a1 + 32) queryHandlers];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__EDMessageRepository_updateLastSeenDate_andDisplayDate_forBusinessWithEmailAddress_category___block_invoke_2;
  v21[3] = &unk_1E6C03C10;
  id v10 = v7;
  id v22 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];

  os_unfair_lock_unlock(v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v23 = v5;
        id v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v23, 1, (void)v17);
        [v15 updateUnseenCountsForBusinessesWithExternalIDs:v16];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v12);
  }
}

void __94__EDMessageRepository_updateLastSeenDate_andDisplayDate_forBusinessWithEmailAddress_category___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)messageReconciliationQueries
{
  p_handlersLocuint64_t k = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  id v4 = [(EDMessageRepository *)self queryHandlers];
  id v5 = [v4 allValues];
  id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_951);
  id v7 = objc_msgSend(v6, "ef_flatten");

  os_unfair_lock_unlock(p_handlersLock);

  return v7;
}

- (id)threadReconciliationQueries
{
  p_handlersLocuint64_t k = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  id v4 = [(EDMessageRepository *)self queryHandlers];
  id v5 = [v4 allValues];
  id v6 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_953);
  id v7 = objc_msgSend(v6, "ef_flatten");

  os_unfair_lock_unlock(p_handlersLock);

  return v7;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if (!a3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    p_handlersLocuint64_t k = &self->_handlersLock;
    os_unfair_lock_lock(&self->_handlersLock);
    id v6 = [(EDMessageRepository *)self queryHandlers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__EDMessageRepository_contentProtectionStateChanged_previousState___block_invoke;
    v8[3] = &unk_1E6C03C38;
    v8[4] = &v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];

    os_unfair_lock_unlock(p_handlersLock);
    if (*((unsigned char *)v10 + 24))
    {
      id v7 = [(EDMessageRepository *)self messagePersistence];
      [v7 reconcileJournalWithCompletionBlock:0];
    }
    _Block_object_dispose(&v9, 8);
  }
}

void __67__EDMessageRepository_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 query];
  char v7 = [v6 queryOptions];

  if ((v7 & 8) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setQueryHandlers:(id)a3
{
}

- (void)setQueryHandlersByThreadScope:(id)a3
{
}

- (NSMutableSet)handlerTokens
{
  return self->_handlerTokens;
}

- (void)setHandlerTokens:(id)a3
{
}

- (void)setHookRegistry:(id)a3
{
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDConversationPersistence)conversationPersistence
{
  return self->_conversationPersistence;
}

- (void)setThreadPersistence:(id)a3
{
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
  return self->_remoteContentPersistence;
}

- (EDRichLinkPersistence)richLinkPersistence
{
  return self->_richLinkPersistence;
}

- (void)setRichLinkPersistence:(id)a3
{
}

- (EDAttachmentPersistenceManager)attachmentPersistenceManager
{
  return self->_attachmentPersistenceManager;
}

- (void)setAttachmentPersistenceManager:(id)a3
{
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void)setMessageChangeManager:(id)a3
{
}

- (OS_dispatch_queue)serializationQueue
{
  return self->_serializationQueue;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (EFScheduler)asyncWorkScheduler
{
  return self->_asyncWorkScheduler;
}

- (EFScheduler)messageListItemScheduler
{
  return self->_messageListItemScheduler;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (void)setCategoryPersistence:(id)a3
{
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (void)setSenderPersistence:(id)a3
{
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (void)setBusinessPersistence:(id)a3
{
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (void)setActivityPersistence:(id)a3
{
}

- (EDCategoryCoreAnalyticsLogger)categoryAnalyticsLogger
{
  return self->_categoryAnalyticsLogger;
}

- (EDBusinessCloudStorage)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (void)setBusinessCloudStorage:(id)a3
{
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EDFetchController)fetchController
{
  return self->_fetchController;
}

- (EDRemoteContentManager)remoteContentManager
{
  return self->_remoteContentManager;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDListUnsubscribeHandler)listUnsubscribeHandler
{
  return self->_listUnsubscribeHandler;
}

- (EFLocked)oneTimeCodeObservers
{
  return self->_oneTimeCodeObservers;
}

- (void)setOneTimeCodeObservers:(id)a3
{
}

- (EFScheduler)delayedMessageActionScheduler
{
  return self->_delayedMessageActionScheduler;
}

- (int64_t)oneTimeCodeMessageID
{
  return self->_oneTimeCodeMessageID;
}

- (void)setOneTimeCodeMessageID:(int64_t)a3
{
  self->_oneTimeCodeMessageID = a3;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (NSUserDefaults)sharedOneTimeCodeUserDefaults
{
  return self->_sharedOneTimeCodeUserDefaults;
}

- (void)setSharedOneTimeCodeUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedOneTimeCodeUserDefaults, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_delayedMessageActionScheduler, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeObservers, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_destroyWeak(&self->_updateThrottlerResetBlock);
  objc_storeStrong((id *)&self->_updateThrottlerResetScheduler, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_remoteContentManager, 0);
  objc_storeStrong((id *)&self->_observerResumer, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_categoryAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_messageListItemScheduler, 0);
  objc_storeStrong((id *)&self->_asyncWorkScheduler, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_performQueryOnSerializationQueue, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_attachmentPersistenceManager, 0);
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_conversationPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_handlerTokens, 0);
  objc_storeStrong((id *)&self->_queryHandlersByThreadScope, 0);
  objc_storeStrong((id *)&self->_queryHandlers, 0);
  objc_storeStrong((id *)&self->_icloudSyncScheduler, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_remoteContentParser, 0);

  objc_storeStrong((id *)&self->_mailboxPredictionController, 0);
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "received error while querying for messages: %@, %{public}@", v4, 0x16u);
}

- (void)_performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  _os_log_fault_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_FAULT, "Existing query handler exists for observation identifier: %{public}@ token:%{public}@", v4, 0x16u);
}

- (void)_performSuppressNotAuthenticatedChangeAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_400_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "Content representation failed to load: %{public}@ with error %{public}@", v4, 0x16u);
}

@end