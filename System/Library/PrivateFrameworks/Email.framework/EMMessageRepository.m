@interface EMMessageRepository
+ (OS_os_log)log;
+ (id)remoteInterface;
+ (id)signpostLog;
+ (void)addValidSortDescriptorsToEMQuery;
- (BOOL)_anyObserver:(id)a3 containsObjectID:(id)a4;
- (BOOL)_shouldActionUpdateObserversForDeletedObjectIDs:(id)a3;
- (EFFuture)remoteContentURLCache;
- (EFLazyCache)brandIndicatorsCache;
- (EFPromise)remoteContentCachePromise;
- (EMMailboxRepository)mailboxRepository;
- (EMMessageRepository)initWithRemoteConnection:(id)a3 mailboxRepository:(id)a4 vipManager:(id)a5;
- (EMVIPManager)vipManager;
- (NSArray)currentObservers;
- (NSCache)queryCountCache;
- (NSURL)cacheURL;
- (id)_cachedItemForItem:(id)a3 observers:(id)a4 validationBlock:(id)a5;
- (id)_descriptionStringForObjectIDs:(void *)a1;
- (id)_existingObservedItemForObjectID:(id)a3;
- (id)_localInMemoryMessageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4;
- (id)_localInMemoryMessageObjectIDsForObjectIDs:(id)a3;
- (id)_messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4 checkCache:(BOOL)a5;
- (id)_threadCollectionForIdentifier:(id)a3 threadScope:(id)a4;
- (id)_updateToMessageObjectIDsIfNeeded:(id)a3;
- (id)brandIndicatorForLocation:(id)a3;
- (id)cachedMetadataJSONForKey:(id)a3 messageID:(id)a4;
- (id)countOfUserOverrides;
- (id)initInternal;
- (id)messageForObjectID:(id)a3;
- (id)messageForSearchableItemIdentifier:(id)a3;
- (id)messageListItemsForObjectIDs:(id)a3;
- (id)messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4;
- (id)messageObjectIDForURL:(id)a3;
- (id)messageObjectIDsForSearchableItemIdentifiers:(id)a3;
- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5;
- (id)metadataForAddresses:(id)a3;
- (id)performMessageChangeActionReturningUndoAction:(id)a3;
- (id)performQuery:(id)a3 withObserver:(id)a4;
- (id)persistentIDForMessageObjectID:(id)a3;
- (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4;
- (id)predictMailboxForMovingMessagesWithIDs:(id)a3 completionHandler:(id)a4;
- (id)requestRepresentationForMessageWithID:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7;
- (id)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5;
- (id)startObservingOneTimeCodes:(id)a3;
- (unint64_t)signpostID;
- (void)_addPrecachedItems:(id)a3;
- (void)_applyChangesToCachedObjects:(id)a3;
- (void)_broadcastMessageListItemChangesToObservers:(id)a3 forObjectIDs:(id)a4;
- (void)_detectChangesForMatchedAddedObjectIDs:(id)a3 observerationIdentifier:(id)a4 matchedChangesHandler:(id)a5;
- (void)_notifyRecoverableObservers;
- (void)_removeItemsFromObservedItemsCacheIfNotObservedByObservers:(id)a3;
- (void)_unsubscribeTypeDidChangeForUnsubscribeChangeAction:(id)a3;
- (void)_updateObserversForAction:(id)a3;
- (void)_updateObserversForDeletedObjectIDs:(id)a3;
- (void)_updateObserversForFlagChangeAction:(id)a3;
- (void)_vipsDidChange:(id)a3;
- (void)addQueryHandler:(id)a3;
- (void)dealloc;
- (void)didFinishBlockingMainThreadForFuture:(id)a3;
- (void)didStartBlockingMainThreadForFuture:(id)a3;
- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 handler:(id)a5;
- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6;
- (void)isDataAccessible:(id)a3;
- (void)loadOlderMessagesForMailboxes:(id)a3;
- (void)logCategoryMetadataForObjectIDs:(id)a3;
- (void)noteViewOfRemoteContentLinks:(id)a3;
- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)performCountQuery:(id)a3 completionHandler:(id)a4;
- (void)performMessageChangeAction:(id)a3;
- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 afterDelay:(double)a4;
- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5;
- (void)recategorizeMessageSinceDate:(id)a3;
- (void)recategorizeMessagesForQuery:(id)a3 completion:(id)a4;
- (void)refreshQueryWithObserver:(id)a3;
- (void)removeAllEntriesFromBusinessCloudStorage;
- (void)removeQueryHandler:(id)a3;
- (void)requestAttachmentURLsForMessageIDs:(id)a3 completionHandler:(id)a4;
- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5;
- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4;
- (void)requestSummaryForObjectIDs:(id)a3;
- (void)resetAllPrecomputedThreadScopes;
- (void)setBrandIndicatorsCache:(id)a3;
- (void)setCacheURL:(id)a3;
- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5;
- (void)setQueryCount:(id)a3 forQueryIdentifier:(id)a4;
- (void)setQueryCountCache:(id)a3;
- (void)setRemoteContentCachePromise:(id)a3;
- (void)setUpURLCacheWithMemoryCapacity:(unint64_t)a3;
- (void)updateLastSeenDate:(id)a3 andDisplayDate:(id)a4 forBusinessWithEmailAddress:(id)a5 category:(id)a6;
@end

@implementation EMMessageRepository

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EMMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1) {
    dispatch_once(&log_onceToken_27, block);
  }
  v2 = (void *)log_log_27;
  return (OS_os_log *)v2;
}

- (void)setQueryCount:(id)a3 forQueryIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(EMMessageRepository *)self queryCountCache];
  [v7 setObject:v8 forKey:v6];
}

- (id)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F60DF0] pairWithFirst:v8 second:v9];
  v12 = [[_EMMessageRepositoryCountingQueryObserver alloc] initWithRepository:self queryIdentifier:v11 includingServerCountsForMailboxScope:v9 observer:v10];
  os_unfair_lock_lock(&self->_observersLock);
  [(NSHashTable *)self->_recoverableObservers addObject:v12];
  os_unfair_lock_unlock(&self->_observersLock);
  v13 = objc_opt_new();
  [v13 addCancelable:v12];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __92__EMMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver___block_invoke;
  v22 = &unk_1E63E2760;
  v23 = self;
  v14 = v12;
  v24 = v14;
  [v13 addCancelationBlock:&v19];
  v15 = [(EMMessageRepository *)self queryCountCache];
  v16 = [v15 objectForKey:v11];

  if (v16) {
    objc_msgSend(v10, "messageRepository:query:countDidChange:", self, v8, objc_msgSend(v16, "integerValue"));
  }
  v17 = [(EMRepository *)self connection];
  [(_EMMessageRepositoryCountingQueryObserver *)v14 performWithRemoteConnection:v17];

  return v13;
}

- (NSCache)queryCountCache
{
  return self->_queryCountCache;
}

- (void)_detectChangesForMatchedAddedObjectIDs:(id)a3 observerationIdentifier:(id)a4 matchedChangesHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v20 = a4;
  id v21 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v15 = [(NSMapTable *)self->_observedMessageListItemCache objectForKey:v14];
        if (v15) {
          [v9 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  if ([v9 count])
  {
    v16 = (void *)MEMORY[0x1E4F60D70];
    v17 = [v9 allKeys];
    v18 = [(EMMessageRepository *)self _messageListItemsForObjectIDs:v17 observationIdentifier:v20 checkCache:0];
    uint64_t v19 = [v16 combine:v18];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __108__EMMessageRepository__detectChangesForMatchedAddedObjectIDs_observerationIdentifier_matchedChangesHandler___block_invoke;
    v22[3] = &unk_1E63E5868;
    id v23 = v9;
    id v24 = v21;
    [v19 addSuccessBlock:v22];
  }
}

- (void)_addPrecachedItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  [(EMRepository *)self prepareRepositoryObjects:v11];
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v11;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        observedMessageListItemCache = self->_observedMessageListItemCache;
        id v10 = [v8 objectID];
        [(NSMapTable *)observedMessageListItemCache setObject:v8 forKey:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
}

void __92__EMMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver___block_invoke(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(v2);
}

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  v96 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v88 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v89 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v95 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  long long v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v94 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  long long v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v86 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v87 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  id v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v85 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  v92 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v90 = objc_opt_class();
  uint64_t v83 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v92, "setWithObjects:", v90, v83, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, objc_opt_class(), 0);
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v93 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  v91 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  v84 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64B98];
  v41 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86D78];
  v42 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A74BB8];
  [v42 setClasses:v95 forSelector:sel_observer_matchedAddedObjectIDs_before_extraInfo_ argumentIndex:1 ofReply:0];
  [v42 setClasses:v33 forSelector:sel_observer_matchedAddedObjectIDs_before_extraInfo_ argumentIndex:3 ofReply:0];
  [v42 setClasses:v95 forSelector:sel_observer_matchedAddedObjectIDs_after_extraInfo_ argumentIndex:1 ofReply:0];
  [v42 setClasses:v33 forSelector:sel_observer_matchedAddedObjectIDs_after_extraInfo_ argumentIndex:3 ofReply:0];
  [v42 setClasses:v95 forSelector:sel_observer_matchedMovedObjectIDs_before_extraInfo_ argumentIndex:1 ofReply:0];
  [v42 setClasses:v33 forSelector:sel_observer_matchedMovedObjectIDs_before_extraInfo_ argumentIndex:3 ofReply:0];
  [v42 setClasses:v95 forSelector:sel_observer_matchedMovedObjectIDs_after_extraInfo_ argumentIndex:1 ofReply:0];
  [v42 setClasses:v33 forSelector:sel_observer_matchedMovedObjectIDs_after_extraInfo_ argumentIndex:3 ofReply:0];
  [v42 setClasses:v89 forSelector:sel_observer_matchedChangesForObjectIDs_ argumentIndex:1 ofReply:0];
  [v42 setClasses:v95 forSelector:sel_observer_matchedDeletedObjectIDs_ argumentIndex:1 ofReply:0];
  v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v42 setClasses:v43 forSelector:sel_observer_replacedExistingObjectID_withNewObjectID_ argumentIndex:1 ofReply:0];

  [v42 setClasses:v94 forSelector:sel_observer_replacedExistingObjectID_withNewObjectID_ argumentIndex:2 ofReply:0];
  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
  [v42 setClasses:v47 forSelector:sel_observer_matchedOldestItemsUpdatedForMailboxes_ argumentIndex:1 ofReply:0];

  [v42 setInterface:v41 forSelector:sel_observer_wasUpdated_ argumentIndex:1 ofReply:0];
  v48 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86A38];
  [v48 setClasses:v96 forSelector:sel_performQuery_limit_completionHandler_ argumentIndex:0 ofReply:1];
  [v48 setClasses:v88 forSelector:sel_performMessageChangeAction_requestID_returnUndoAction_completionHandler_ argumentIndex:0 ofReply:0];
  v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  [v48 setClasses:v51 forSelector:sel_predictMailboxForMovingMessages_withObserver_completionHandler_ argumentIndex:0 ofReply:0];

  v52 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A75038];
  [v48 setInterface:v52 forSelector:sel_predictMailboxForMovingMessages_withObserver_completionHandler_ argumentIndex:1 ofReply:0];

  [v48 setInterface:v40 forSelector:sel_predictMailboxForMovingMessages_withObserver_completionHandler_ argumentIndex:0 ofReply:1];
  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  [v48 setClasses:v55 forSelector:sel_loadOlderMessagesForMailboxes_ argumentIndex:0 ofReply:0];

  v56 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v57 = objc_opt_class();
  v58 = objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
  [v48 setClasses:v58 forSelector:sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v59 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v59 forSelector:sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_ argumentIndex:2 ofReply:0];

  [v48 setClasses:v96 forSelector:sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  v60 = +[EMContentRepresentation contentRequestDelegateInterface];
  [v48 setInterface:v60 forSelector:sel_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler_ argumentIndex:3 ofReply:0];

  v61 = +[EMContentRepresentation distantContentRepresentationInterface];
  [v48 setInterface:v61 forSelector:sel_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler_ argumentIndex:0 ofReply:1];

  [v48 setInterface:v42 forSelector:sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_ argumentIndex:1 ofReply:0];
  [v48 setInterface:v40 forSelector:sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_ argumentIndex:0 ofReply:1];
  v62 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A753B8];
  [v62 setClasses:v96 forSelector:sel_queryHelperDidFindMessages_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperDidAddMessages_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperMessageFlagsDidChangeForMessages_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperDidUpdateMessages_forKeyPaths_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v84 forSelector:sel_queryHelperDidUpdateMessages_forKeyPaths_ argumentIndex:1 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperObjectIDDidChangeForMessage_oldObjectID_oldConversationID_ argumentIndex:0 ofReply:0];
  v63 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v62 setClasses:v63 forSelector:sel_queryHelperObjectIDDidChangeForMessage_oldObjectID_oldConversationID_ argumentIndex:1 ofReply:0];

  [v62 setClasses:v96 forSelector:sel_queryHelperDidDeleteMessages_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperConversationIDDidChangeForMessages_fromConversationID_ argumentIndex:0 ofReply:0];
  [v62 setClasses:v96 forSelector:sel_queryHelperBusinessIDDidChangeForMessages_fromBusinessID_ argumentIndex:0 ofReply:0];
  [v48 setInterface:v62 forSelector:sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_ argumentIndex:3 ofReply:0];
  v64 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A74F40];
  [v64 setInterface:v41 forSelector:sel_countDidChange_acknowledgementToken_ argumentIndex:1 ofReply:0];
  [v48 setInterface:v64 forSelector:sel_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler_ argumentIndex:2 ofReply:0];
  [v48 setInterface:v40 forSelector:sel_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler_ argumentIndex:0 ofReply:1];
  v65 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A75C80];
  [v48 setInterface:v65 forSelector:sel_startObservingOneTimeCode_completionHandler_ argumentIndex:0 ofReply:0];
  [v48 setInterface:v40 forSelector:sel_startObservingOneTimeCode_completionHandler_ argumentIndex:0 ofReply:1];
  [v48 setClasses:v95 forSelector:sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_ argumentIndex:0 ofReply:0];
  [v48 setClasses:v94 forSelector:sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_ argumentIndex:3 ofReply:0];
  [v48 setClasses:v87 forSelector:sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_ argumentIndex:0 ofReply:1];
  [v48 setClasses:v85 forSelector:sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_ argumentIndex:1 ofReply:1];
  v66 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v66 forSelector:sel_messageObjectIDForURL_completionHandler_ argumentIndex:0 ofReply:0];

  [v48 setClasses:v94 forSelector:sel_messageObjectIDForURL_completionHandler_ argumentIndex:0 ofReply:1];
  v67 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v67 forSelector:sel_messageObjectIDForURL_completionHandler_ argumentIndex:1 ofReply:1];

  [v48 setClasses:v94 forSelector:sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];
  [v48 setClasses:v86 forSelector:sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_ argumentIndex:1 ofReply:1];
  v68 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v68 forSelector:sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_ argumentIndex:2 ofReply:1];

  [v48 setClasses:v91 forSelector:sel_noteViewOfRemoteContentLinks_ argumentIndex:0 ofReply:0];
  [v48 setClasses:v93 forSelector:sel_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler_ argumentIndex:0 ofReply:1];
  [v48 setClasses:v93 forSelector:sel_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler_ argumentIndex:1 ofReply:1];
  v69 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v69 forSelector:sel_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler_ argumentIndex:0 ofReply:0];

  [v48 setClasses:v91 forSelector:sel_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler_ argumentIndex:0 ofReply:1];
  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v71 = objc_opt_class();
  v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  [v48 setClasses:v72 forSelector:sel_requestAttachmentMetadataForMessageIDs_completionHandler_ argumentIndex:0 ofReply:1];

  v73 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v74 = objc_opt_class();
  v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  [v48 setClasses:v75 forSelector:sel_requestRichLinkURLsForMessageIDs_completionHandler_ argumentIndex:0 ofReply:1];

  v76 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v77 = objc_opt_class();
  v78 = objc_msgSend(v76, "setWithObjects:", v77, objc_opt_class(), 0);
  [v48 setClasses:v78 forSelector:sel_updateLastSeenDate_andDisplayDate_forBusinessWithEmailAddress_category_ argumentIndex:2 ofReply:0];

  v79 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v80 = objc_opt_class();
  v81 = objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
  [v48 setClasses:v81 forSelector:sel_logCategoryMetadataForObjectIDs_ argumentIndex:0 ofReply:0];

  return v48;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

void __55__EMMessageRepository_addValidSortDescriptorsToEMQuery__block_invoke()
{
  v1[4] = *MEMORY[0x1E4F143B8];
  v1[0] = @"date";
  v1[1] = @"displayDate";
  v1[2] = @"readLater.date";
  v1[3] = @"sendLaterDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:4];
  +[EMQuery addValidSortDescriptorKeyPaths:v0 forTargetClass:objc_opt_class()];
  +[EMQuery addValidSortDescriptorKeyPaths:v0 forTargetClass:objc_opt_class()];
  +[EMQuery addValidSortDescriptorKeyPaths:v0 forTargetClass:objc_opt_class()];
}

- (EMMessageRepository)initWithRemoteConnection:(id)a3 mailboxRepository:(id)a4 vipManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)EMMessageRepository;
  id v11 = [(EMRepository *)&v34 initWithRemoteConnection:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vipManager, a5);
    objc_storeStrong((id *)&v12->_mailboxRepository, a4);
    v12->_messageListItemCacheLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    observedMessageListItemCache = v12->_observedMessageListItemCache;
    v12->_observedMessageListItemCache = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    unobservedMessageListItemCache = v12->_unobservedMessageListItemCache;
    v12->_unobservedMessageListItemCache = (NSMapTable *)v15;

    v12->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    wrappedObserversByActualObserver = v12->_wrappedObserversByActualObserver;
    v12->_wrappedObserversByActualObserver = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    inMemoryThreadQueryHandlers = v12->_inMemoryThreadQueryHandlers;
    v12->_inMemoryThreadQueryHandlers = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    recoverableObservers = v12->_recoverableObservers;
    v12->_recoverableObservers = (NSHashTable *)v21;

    uint64_t v23 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    queryCountCache = v12->_queryCountCache;
    v12->_queryCountCache = v23;

    uint64_t v25 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
    remoteContentCachePromise = v12->_remoteContentCachePromise;
    v12->_remoteContentCachePromise = v25;

    uint64_t v27 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    brandIndicatorsCache = v12->_brandIndicatorsCache;
    v12->_brandIndicatorsCache = v27;

    uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v12 selector:sel__blockedSendersDidChange_ name:@"EMBlockedSenderManagerBlockedListDidChangeNotification" object:0];
    [v29 addObserver:v12 selector:sel__vipsDidChange_ name:@"VIPsDidChange" object:v12->_vipManager];
    [(id)objc_opt_class() addValidSortDescriptorsToEMQuery];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __77__EMMessageRepository_initWithRemoteConnection_mailboxRepository_vipManager___block_invoke;
    v31[3] = &unk_1E63E2688;
    objc_copyWeak(&v32, &location);
    [v8 addRecoveryHandler:v31];
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v12;
}

+ (void)addValidSortDescriptorsToEMQuery
{
  if (addValidSortDescriptorsToEMQuery_onceToken != -1) {
    dispatch_once(&addValidSortDescriptorsToEMQuery_onceToken, &__block_literal_global_36);
  }
}

void __26__EMMessageRepository_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[_EMMessageRepositoryQueryObserver alloc] initWithRepository:self query:v7 observer:v8 queryHandlerStorable:self];
  os_unfair_lock_lock(&self->_observersLock);
  [(NSMapTable *)self->_wrappedObserversByActualObserver setObject:v9 forKey:v8];
  [(NSHashTable *)self->_recoverableObservers addObject:v9];
  os_unfair_lock_unlock(&self->_observersLock);
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  uint64_t v12 = NSStringFromClass((Class)[v7 targetClass]);
  uint64_t v13 = [v10 stringWithFormat:@"%@ query.targetClass:%@", v11, v12];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F60D40]) initWithLabel:v13];
  [v14 addCancelable:v9];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__EMMessageRepository_performQuery_withObserver___block_invoke;
  v18[3] = &unk_1E63E2760;
  uint64_t v15 = v9;
  uint64_t v19 = v15;
  id v20 = self;
  [v14 addCancelationBlock:v18];
  uint64_t v16 = [(EMRepository *)self connection];
  [(_EMMessageRepositoryQueryObserver *)v15 performWithRemoteConnection:v16];

  return v14;
}

- (void)setUpURLCacheWithMemoryCapacity:(unint64_t)a3
{
  uint64_t v5 = [(EMRepository *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke;
  v10[3] = &unk_1E63E4330;
  v10[4] = self;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v10];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_547;
  v7[3] = &unk_1E63E5660;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  [v6 getURLCacheInformationWithCompletion:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EMMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1) {
    dispatch_once(&signpostLog_onceToken_1, block);
  }
  v2 = (void *)signpostLog_log_1;
  return v2;
}

void __34__EMMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (id)initInternal
{
}

void __77__EMMessageRepository_initWithRemoteConnection_mailboxRepository_vipManager___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 18);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)&v2[8]._os_unfair_lock_opaque;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          id v8 = objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "objectForKey:", v7, (void)v9);
          [*(id *)&v2[10]._os_unfair_lock_opaque setObject:v8 forKey:v7];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    [*(id *)&v2[8]._os_unfair_lock_opaque removeAllObjects];
    os_unfair_lock_unlock(v2 + 18);
    [(os_unfair_lock_s *)v2 _notifyRecoverableObservers];
  }
}

- (void)dealloc
{
  [(NSURL *)self->_cacheURL stopAccessingSecurityScopedResource];
  v3.receiver = self;
  v3.super_class = (Class)EMMessageRepository;
  [(EMMessageRepository *)&v3 dealloc];
}

- (void)_notifyRecoverableObservers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v5 = [(NSHashTable *)self->_recoverableObservers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  uint64_t v4 = [(EMRepository *)self connection];
  [v5 makeObjectsPerformSelector:sel_recoverWithRemoteConnection_ withObject:v4];
}

- (void)isDataAccessible:(id)a3
{
  id v4 = a3;
  id v5 = [(EMRepository *)self connection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __40__EMMessageRepository_isDataAccessible___block_invoke;
  v8[3] = &unk_1E63E51E0;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 isDataAccessible:v8];
}

void __40__EMMessageRepository_isDataAccessible___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) observerScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__EMMessageRepository_isDataAccessible___block_invoke_2;
  v5[3] = &unk_1E63E51B8;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  [v4 performBlock:v5];
}

uint64_t __40__EMMessageRepository_isDataAccessible___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didStartBlockingMainThreadForFuture:(id)a3
{
  id v6 = [(EMRepository *)self connection];
  id v4 = [v6 requestRecoveryAssertion];
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = v4;
}

- (void)didFinishBlockingMainThreadForFuture:(id)a3
{
  [(EMRemoteConnectionRecoveryAssertion *)self->_connectionRecoveryAssertion invalidate];
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = 0;
}

- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [(EMRepository *)self connection];
  long long v11 = [v10 reattemptingRemoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke;
  v13[3] = &unk_1E63E5230;
  v13[4] = self;
  id v12 = v9;
  id v14 = v12;
  [v11 performQuery:v8 limit:a4 completionHandler:v13];
}

void __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) prepareRepositoryObjects:v5];
  char v7 = [*(id *)(a1 + 32) observerScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke_2;
  v10[3] = &unk_1E63E5208;
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 performBlock:v10];
}

uint64_t __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performCountQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = [(EMRepository *)self connection];
  id v9 = [v8 reattemptingRemoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E63E5258;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 performCountQuery:v6 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained observerScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke_2;
    v10[3] = &unk_1E63E5208;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    [v9 performBlock:v10];
  }
}

uint64_t __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)messageListItemsForObjectIDs:(id)a3
{
  objc_super v3 = [(EMMessageRepository *)self messageListItemsForObjectIDs:a3 observationIdentifier:0];
  return v3;
}

- (id)messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4
{
  id v4 = [(EMMessageRepository *)self _messageListItemsForObjectIDs:a3 observationIdentifier:a4 checkCache:1];
  return v4;
}

- (id)_messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4 checkCache:(BOOL)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v46 = a4;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v40 = _os_activity_create(&dword_1BEFDB000, "-[EMMessageRepository _messageListItemsForObjectIDs:observationIdentifier:checkCache:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v40, &state);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v42 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke;
  v59[3] = &unk_1E63E5280;
  v59[4] = self;
  BOOL v63 = a5;
  id v9 = v8;
  id v60 = v9;
  id v10 = v42;
  id v61 = v10;
  id v11 = v43;
  id v62 = v11;
  objc_msgSend(v44, "ef_map:", v59);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_269;
  v56[3] = &unk_1E63E5320;
  uint64_t v45 = self;
  v56[4] = self;
  id v39 = v11;
  id v57 = v39;
  id v12 = v10;
  id v58 = v12;
  v47 = MEMORY[0x1C18A2160](v56);
  id v13 = (id)MEMORY[0x1E4F1CBF0];
  if ([v12 count])
  {
    [(EMMessageRepository *)self _localInMemoryMessageListItemsForObjectIDs:v12 observationIdentifier:v46];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v71 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v18 = [v17 displayMessageObjectID];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:a2 object:v45 file:@"EMMessageRepository.m" lineNumber:486 description:@"Unexpected objectID type"];
          }
          uint64_t v19 = [v17 summary];
          BOOL v20 = v19 == 0;

          if (v20) {
            [v9 addObject:v18];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v71 count:16];
      }
      while (v14);
    }

    uint64_t v22 = objc_msgSend(v13, "ef_mapSelector:", sel_objectID);
    [v12 removeObjectsInArray:v22];

    if ([v13 count])
    {
      if ([v12 count])
      {
        uint64_t v23 = +[EMMessageRepository log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [v13 count];
          uint64_t v25 = -[EMMessageRepository _descriptionStringForObjectIDs:](v45, v12);
          *(_DWORD *)buf = 134218498;
          v66 = v45;
          __int16 v67 = 2048;
          uint64_t v68 = v24;
          __int16 v69 = 2114;
          v70 = v25;
          _os_log_impl(&dword_1BEFDB000, v23, OS_LOG_TYPE_DEFAULT, "<%p> Only some message list items found in the inMemory cache. localMessageListItems.count:%lu objectIDsToRequest: %{public}@", buf, 0x20u);
        }
        uint64_t v26 = v47;
      }
      else
      {
        uint64_t v27 = +[EMMessageRepository log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = -[EMMessageRepository _descriptionStringForObjectIDs:](v45, v12);
          *(_DWORD *)buf = 134218242;
          v66 = v45;
          __int16 v67 = 2114;
          uint64_t v68 = (uint64_t)v28;
          _os_log_impl(&dword_1BEFDB000, v27, OS_LOG_TYPE_DEFAULT, "<%p> Found all items in local cache: %{public}@", buf, 0x16u);
        }
        uint64_t v23 = v47;
        ((void (*)(NSObject *, id, void, void, void))v47[2].isa)(v47, v13, MEMORY[0x1E4F1CC08], 0, 0);
        uint64_t v26 = 0;
      }

      v47 = v26;
    }
  }
  if ([v12 count] || objc_msgSend(v9, "count"))
  {
    os_signpost_id_t v29 = +[EMDaemonInterfaceRequest uniqueRequestID];
    uint64_t v30 = +[EMMessageRepository log];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = -[EMMessageRepository _descriptionStringForObjectIDs:](v45, v12);
      *(_DWORD *)buf = 134218242;
      v66 = v45;
      __int16 v67 = 2114;
      uint64_t v68 = (uint64_t)v31;
      _os_log_impl(&dword_1BEFDB000, v30, OS_LOG_TYPE_DEFAULT, "<%p> Requesting message list items: %{public}@", buf, 0x16u);
    }
    id v32 = +[EMDaemonInterfaceRequest signpostLog];
    v33 = v32;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      int v34 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v12, "count"));
      *(_DWORD *)buf = 67240192;
      LODWORD(v66) = v34;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v29, "EMMessageRepositoryMessageListItems", "Requesting messages for object IDs %{public, name=count}u", buf, 8u);
    }

    uint64_t v35 = [(EMRepository *)v45 connection];
    v36 = [v35 reattemptingRemoteObjectProxy];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_291;
    v48[3] = &unk_1E63E5348;
    uint64_t v50 = v47;
    id v49 = v13;
    os_signpost_id_t v51 = v29;
    [v36 messageListItemsForObjectIDs:v12 requestID:v29 observationIdentifier:v46 loadSummaryForAdditionalObjectIDs:v9 completionHandler:v48];
  }
  os_activity_scope_leave(&state);

  return v41;
}

id __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v4 future];
  [v6 setDelegate:v5];

  if (*(unsigned char *)(a1 + 64)
    && ([*(id *)(a1 + 32) _existingObservedItemForObjectID:v3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        (id v8 = v7) != 0))
  {
    id v9 = [v7 summary];

    if (!v9)
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [v8 displayMessageObjectID];
      [v10 addObject:v11];
    }
    id v12 = +[EMMessageRepository log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v17 = 134218242;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      BOOL v20 = v8;
      _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "<%p> Returning cached result: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v14 = v8;
    [v4 finishWithResult:v8];
  }
  else
  {
    [*(id *)(a1 + 48) addObject:v3];
    uint64_t v14 = 0;
    [*(id *)(a1 + 56) setObject:v4 forKeyedSubscript:v3];
  }
  uint64_t v15 = [v4 future];

  return v15;
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_269(id *a1, void *a2, void *a3, char a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  if (+[EMForceBlankCellsController shouldBlockXPCQueue])
  {
    +[EMForceBlankCellsController blockForRandomDurationWithMessage:@"Block _messageListItemsForObjectIDs"];
  }
  id v11 = [a1[4] observerScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_2;
  v14[3] = &unk_1E63E52F8;
  v14[4] = a1[4];
  id v12 = v9;
  id v15 = v12;
  id v16 = a1[5];
  id v13 = v10;
  char v20 = a4;
  id v17 = v13;
  uint64_t v19 = a5;
  id v18 = a1[6];
  [v11 performBlock:v14];
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  [*(id *)(a1 + 32) prepareRepositoryObjects:*(void *)(a1 + 40)];
  uint64_t v25 = [*(v2 - 1) currentObservers];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 32) _cachedItemForItem:v6 observers:v25 validationBlock:0];

        id v8 = *(void **)(a1 + 48);
        id v9 = [v7 objectID];
        id v10 = [v8 objectForKeyedSubscript:v9];

        id v11 = +[EMMessageRepository log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = [v7 itemID];
          uint64_t v14 = [v10 future];
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v13;
          *(_WORD *)&buf[22] = 2114;
          id v39 = v14;
          _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Finishing future with message list item: %{public}@ -> %{public}@", buf, 0x20u);
        }
        [v10 finishWithResult:v7];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v3);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_272;
  v27[3] = &unk_1E63E52A8;
  id v15 = *(void **)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 32);
  id v28 = v16;
  uint64_t v29 = v17;
  [v15 enumerateKeysAndObjectsUsingBlock:v27];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v39 = 0;
  id v18 = *(void **)(a1 + 48);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_274;
  v26[3] = &unk_1E63E52D0;
  v26[4] = *(void *)(a1 + 32);
  v26[5] = buf;
  [v18 enumerateKeysAndObjectsUsingBlock:v26];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v19 = +[EMDaemonInterfaceRequest signpostLog];
    char v20 = v19;
    os_signpost_id_t v21 = *(void *)(a1 + 72);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      int v22 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 64), "count"));
      int v23 = [MEMORY[0x1E4F60E00] bucketMessageCount:*(void *)(*(void *)&buf[8] + 24)];
      *(_DWORD *)int v34 = 67240448;
      int v35 = v22;
      __int16 v36 = 1026;
      int v37 = v23;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=results}u %{public, name=orphaned}u", v34, 0xEu);
    }
  }
  _Block_object_dispose(buf, 8);
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_272(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = +[EMMessageRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v7 future];
    int v11 = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Finishing future with error: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [v7 finishWithError:v6];
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_274(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 future];
  char v8 = [v7 isFinished];

  if ((v8 & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v9 = +[EMMessageRepository log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = [v6 future];
      int v13 = 134218498;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "<%p> Found an orphaned promise. Finishing it with an error: %{public}@ -> %{public}@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Found an orphaned promise");
    [v6 finishWithError:v12];
  }
}

- (id)_descriptionStringForObjectIDs:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    a1 = objc_msgSend(v3, "ef_shortDescriptionStringWithLimit:", 20);
  }

  return a1;
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_localInMemoryMessageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    char v8 = [(EMMessageRepository *)self _threadCollectionForIdentifier:v7 threadScope:0];
    uint64_t v9 = v8;
    if (v8)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__9;
      v15[4] = __Block_byref_object_dispose__9;
      id v16 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __88__EMMessageRepository__localInMemoryMessageListItemsForObjectIDs_observationIdentifier___block_invoke;
      v12[3] = &unk_1E63E5370;
      id v13 = v8;
      uint64_t v14 = v15;
      uint64_t v10 = objc_msgSend(v6, "ef_compactMap:", v12);

      _Block_object_dispose(v15, 8);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

id __88__EMMessageRepository__localInMemoryMessageListItemsForObjectIDs_observationIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v3 messageListItemForObjectID:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (id)_threadCollectionForIdentifier:(id)a3 threadScope:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v23 = v7;
  if ((v7 != 0) == (v8 != 0))
  {
    os_signpost_id_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"EMMessageRepository.m", 545, @"Invalid parameter not satisfying: %@", @"(observationIdentifier && !threadScope) || (!observationIdentifier && threadScope)" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_observersLock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  os_unfair_lock_t lock = &self->_observersLock;
  uint64_t v9 = [(NSMapTable *)self->_wrappedObserversByActualObserver objectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v13 observationIdentifier];
        if ([v23 isEqual:v14])
        {

LABEL_15:
          id v18 = v13;
          goto LABEL_16;
        }
        __int16 v15 = [v13 threadCollection];
        id v16 = [v15 threadScope];
        int v17 = [v8 isEqual:v16];

        if (v17) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v18 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v18 = 0;
  }
LABEL_16:

  os_unfair_lock_unlock(lock);
  uint64_t v19 = [v18 threadCollection];

  return v19;
}

- (id)_localInMemoryMessageObjectIDsForObjectIDs:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [v4 firstObject];
    id v6 = [v5 threadScope];
    id v7 = [(EMMessageRepository *)self _threadCollectionForIdentifier:0 threadScope:v6];

    if (v7)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__9;
      void v18[4] = __Block_byref_object_dispose__9;
      id v19 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke;
      v15[3] = &unk_1E63E5398;
      id v8 = v7;
      id v16 = v8;
      int v17 = v18;
      uint64_t v9 = objc_msgSend(v4, "ef_compactMap:", v15);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_2;
      v13[3] = &unk_1E63E53E0;
      id v14 = v8;
      uint64_t v10 = objc_msgSend(v9, "ef_compactMap:", v13);
      uint64_t v11 = objc_msgSend(v10, "ef_flatten");

      _Block_object_dispose(v18, 8);
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v3 messageListItemForObjectID:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) messagesForThread:a2];
  id v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_305);

  return v3;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (id)messageForObjectID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1BEFDB000, "-[EMMessageRepository messageForObjectID:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F60E18] promise];
    id v7 = [v6 future];
    [v7 setDelegate:self];

    id v8 = [(EMMessageRepository *)self _existingObservedItemForObjectID:v4];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v6 finishWithResult:v8];
    }
    else
    {
      os_signpost_id_t v10 = +[EMDaemonInterfaceRequest uniqueRequestID];
      uint64_t v11 = +[EMDaemonInterfaceRequest signpostLog];
      uint64_t v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v4;
        _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMMessageRepositoryMessageListItems", "Requesting message %{public, name=objectID}@", buf, 0xCu);
      }

      id v13 = [(EMRepository *)self connection];
      id v14 = [v13 reattemptingRemoteObjectProxy];
      id v25 = v4;
      __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __42__EMMessageRepository_messageForObjectID___block_invoke;
      char v20 = &unk_1E63E5428;
      os_signpost_id_t v21 = self;
      id v22 = v6;
      os_signpost_id_t v23 = v10;
      [v14 messageListItemsForObjectIDs:v15 requestID:v10 observationIdentifier:0 loadSummaryForAdditionalObjectIDs:MEMORY[0x1E4F1CBF0] completionHandler:&v17];
    }
    uint64_t v9 = objc_msgSend(v6, "future", v17, v18, v19, v20, v21);
  }
  else
  {
    uint64_t v9 = 0;
  }
  os_activity_scope_leave(&state);

  return v9;
}

void __42__EMMessageRepository_messageForObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [v5 firstObject];
    os_signpost_id_t v10 = *(void **)(a1 + 32);
    v24[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v10 prepareRepositoryObjects:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [v12 currentObservers];
    id v14 = [v12 _cachedItemForItem:v9 observers:v13 validationBlock:&__block_literal_global_309];

    __int16 v15 = [*(id *)(a1 + 32) trampoliningObserverForObserver:*(void *)(a1 + 40)];
    [v15 finishWithResult:v14];

    int v16 = 1;
  }
  else
  {
    uint64_t v17 = [v6 allValues];
    uint64_t v18 = [v17 firstObject];

    if (!v18)
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to get message for objectID");
    }
    id v19 = [*(id *)(a1 + 32) trampoliningObserverForObserver:*(void *)(a1 + 40)];
    [v19 finishWithError:v18];

    int v16 = 0;
  }
  char v20 = +[EMDaemonInterfaceRequest signpostLog];
  os_signpost_id_t v21 = v20;
  os_signpost_id_t v22 = *(void *)(a1 + 48);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v23[0] = 67240192;
    v23[1] = v16;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=success}d", (uint8_t *)v23, 8u);
  }
}

uint64_t __42__EMMessageRepository_messageForObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_cachedItemForItem:(id)a3 observers:(id)a4 validationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = (unsigned int (**)(void *, id))a5;
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = (unsigned int (**)(void *, id))&__block_literal_global_314;
  }
  id v12 = v8;
  id v13 = [v12 objectID];
  BOOL v14 = [(EMMessageRepository *)self _anyObserver:v9 containsObjectID:v13];

  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  if (!v14)
  {
    unobservedMessageListItemCache = self->_unobservedMessageListItemCache;
    os_signpost_id_t v23 = [v12 objectID];
    id v21 = [(NSMapTable *)unobservedMessageListItemCache objectForKey:v23];

    if (v21 && v11[2](v11, v21))
    {
      if ([v21 conformsToProtocol:&unk_1F1A656E8])
      {
        long long v24 = [v12 changeFrom:v21];
        [v24 applyToMessageListItem:v21];
      }
      id v21 = v21;
      id v25 = v12;
      id v19 = v21;
    }
    else
    {
      uint64_t v29 = self->_unobservedMessageListItemCache;
      id v25 = [v12 objectID];
      [(NSMapTable *)v29 setObject:v12 forKey:v25];
      id v19 = v12;
    }
    goto LABEL_21;
  }
  observedMessageListItemCache = self->_observedMessageListItemCache;
  uint64_t v17 = [v12 objectID];
  uint64_t v18 = [(NSMapTable *)observedMessageListItemCache objectForKey:v17];

  if (v18 && v11[2](v11, v18))
  {
    id v19 = v18;
    char v20 = v12;
    id v21 = v19;
  }
  else
  {
    long long v26 = self->_unobservedMessageListItemCache;
    id v27 = [v12 objectID];
    uint64_t v28 = [(NSMapTable *)v26 objectForKey:v27];

    if (v28 && v11[2](v11, v28))
    {
      id v19 = v28;
      uint64_t v28 = v12;
      id v21 = v19;
    }
    else
    {
      id v21 = 0;
      id v19 = v12;
    }

    long long v30 = self->_observedMessageListItemCache;
    char v20 = [v12 objectID];
    [(NSMapTable *)v30 setObject:v19 forKey:v20];
  }

  if ([v21 conformsToProtocol:&unk_1F1A656E8])
  {
    id v25 = [v12 changeFrom:v21];
    [v25 applyToMessageListItem:v21];
LABEL_21:
  }
  os_unfair_lock_unlock(p_messageListItemCacheLock);

  return v19;
}

uint64_t __68__EMMessageRepository__cachedItemForItem_observers_validationBlock___block_invoke()
{
  return 1;
}

- (id)_existingObservedItemForObjectID:(id)a3
{
  id v4 = a3;
  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  id v6 = [(NSMapTable *)self->_observedMessageListItemCache objectForKey:v4];
  os_unfair_lock_unlock(p_messageListItemCacheLock);

  return v6;
}

- (BOOL)_anyObserver:(id)a3 containsObjectID:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __53__EMMessageRepository__anyObserver_containsObjectID___block_invoke;
  v8[3] = &unk_1E63E5450;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "ef_any:", v8);

  return (char)a3;
}

uint64_t __53__EMMessageRepository__anyObserver_containsObjectID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observerContainsObjectID:*(void *)(a1 + 32)];
}

- (void)addQueryHandler:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSMutableSet *)self->_inMemoryThreadQueryHandlers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeQueryHandler:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSMutableSet *)self->_inMemoryThreadQueryHandlers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (NSArray)currentObservers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v4 = [(NSMapTable *)self->_wrappedObserversByActualObserver keyEnumerator];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_observersLock);
  return (NSArray *)v5;
}

void __49__EMMessageRepository_performQuery_withObserver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInMemoryThreadQueryHandler:0];
  id v2 = *(void **)(a1 + 40);
  id v3 = [v2 currentObservers];
  objc_msgSend(v2, "_removeItemsFromObservedItemsCacheIfNotObservedByObservers:");
}

- (void)refreshQueryWithObserver:(id)a3
{
  id v8 = a3;
  id v4 = [(EMMessageRepository *)self currentObservers];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:v8];
  [(EMMessageRepository *)self _removeItemsFromObservedItemsCacheIfNotObservedByObservers:v5];
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = [(NSMapTable *)self->_wrappedObserversByActualObserver objectForKey:v8];
  os_unfair_lock_unlock(&self->_observersLock);
  id v7 = [(EMRepository *)self connection];
  [v6 refreshQueryWithRemoteConnection:v7];
}

- (void)_removeItemsFromObservedItemsCacheIfNotObservedByObservers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  id v6 = [(NSMapTable *)self->_observedMessageListItemCache dictionaryRepresentation];
  id v7 = [v6 allKeys];

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__EMMessageRepository__removeItemsFromObservedItemsCacheIfNotObservedByObservers___block_invoke;
  v21[3] = &unk_1E63E5478;
  v21[4] = self;
  id v15 = v4;
  id v22 = v15;
  id v8 = objc_msgSend(v7, "ef_filter:", v21);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = v7;
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v14 = [(NSMapTable *)self->_observedMessageListItemCache objectForKey:v13];
        [(NSMapTable *)self->_unobservedMessageListItemCache setObject:v14 forKey:v13];
        [(NSMapTable *)self->_observedMessageListItemCache removeObjectForKey:v13];

        id v7 = v12;
        p_messageListItemCacheLock = &self->_messageListItemCacheLock;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_messageListItemCacheLock);
}

uint64_t __82__EMMessageRepository__removeItemsFromObservedItemsCacheIfNotObservedByObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _anyObserver:*(void *)(a1 + 40) containsObjectID:a2] ^ 1;
}

- (id)startObservingOneTimeCodes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EMMessageRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v19 = self;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] startObservingOneTimeCodes", buf, 0xCu);
  }

  id v6 = [[_EMOneTimeCodeObserver alloc] initWithObserver:v4];
  os_unfair_lock_lock(&self->_observersLock);
  [(NSHashTable *)self->_recoverableObservers addObject:v6];
  id v7 = +[EMMessageRepository log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Adding recoverable one-time codes observer: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(&self->_observersLock);
  id v8 = objc_opt_new();
  [v8 addCancelable:v6];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __50__EMMessageRepository_startObservingOneTimeCodes___block_invoke;
  id v15 = &unk_1E63E2760;
  int v16 = self;
  uint64_t v9 = v6;
  long long v17 = v9;
  [v8 addCancelationBlock:&v12];
  uint64_t v10 = [(EMRepository *)self connection];
  [(_EMOneTimeCodeObserver *)v9 performWithRemoteConnection:v10];

  return v8;
}

void __50__EMMessageRepository_startObservingOneTimeCodes___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  id v3 = +[EMMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Removing recoverable one-time codes observer: %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(v2);
}

- (id)requestRepresentationForMessageWithID:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(EMMessageRepository *)self requestRepresentationForMessageWithID:v10 requestID:+[EMDaemonInterfaceRequest uniqueRequestID] options:v11 delegate:v12 completionHandler:v13];

  return v14;
}

- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = +[EMDaemonInterfaceRequest signpostLog];
  long long v17 = v16;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v33 = [v12 hash];
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v17, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EMMessageRepositoryMessageContentRequest", "Requesting representation for message: %{public, name=objectIdHash}lu", buf, 0xCu);
  }

  long long v18 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = (uint64_t)v12;
    __int16 v34 = 2114;
    id v35 = v13;
    _os_log_impl(&dword_1BEFDB000, v18, OS_LOG_TYPE_DEFAULT, "Requesting content representation for message %{public}@, Options: %{public}@", buf, 0x16u);
  }

  long long v19 = [(EMRepository *)self connection];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke;
  v30[3] = &unk_1E63E2C40;
  id v20 = v15;
  id v31 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v30];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2;
  v26[3] = &unk_1E63E54A0;
  unint64_t v29 = a4;
  id v22 = v12;
  id v27 = v22;
  id v23 = v20;
  id v28 = v23;
  uint64_t v24 = [v21 requestRepresentationForMessageWithID:v22 requestID:a4 options:v13 delegate:v14 completionHandler:v26];

  return v24;
}

uint64_t __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    id v10 = +[EMDaemonInterfaceRequest signpostLog];
    id v11 = v10;
    os_signpost_id_t v12 = a1[6];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "EMMessageRepositoryMessageContentRequest", "Success", (uint8_t *)&v21, 2u);
    }

    id v13 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[4];
      int v21 = 138543362;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1BEFDB000, v13, OS_LOG_TYPE_DEFAULT, "Content representation finished loading: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    [v8 setDistantContentRepresentation:v7];
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v15 = +[EMDaemonInterfaceRequest signpostLog];
    int v16 = v15;
    os_signpost_id_t v17 = a1[6];
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v21 = 134349056;
      uint64_t v22 = [v9 code];
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "EMMessageRepositoryMessageContentRequest", "Failure %{public, name=errorCode}lu", (uint8_t *)&v21, 0xCu);
    }

    long long v18 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2_cold_1();
    }

    uint64_t v19 = a1[5];
    id v20 = v9;
    if (!v9)
    {
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2048 userInfo:0];
    }
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
    if (!v9) {
  }
    }
}

- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[EMMessageRepository log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v25 = self;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Requesting rich link metadata for rich link ID: %@", buf, 0x16u);
  }

  os_signpost_id_t v12 = [(EMRepository *)self connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke;
  v21[3] = &unk_1E63E54C8;
  v21[4] = self;
  id v13 = v8;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  id v15 = [v12 remoteObjectProxyWithErrorHandler:v21];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_517;
  v18[3] = &unk_1E63E54F0;
  void v18[4] = self;
  id v16 = v13;
  id v19 = v16;
  id v17 = v14;
  id v20 = v17;
  [v15 requestRichLinkMetadataForRichLinkID:v16 messageID:v9 completionHandler:v18];
}

uint64_t __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[EMMessageRepository log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(a1, v2, v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_517(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting rich link metadata for rich link: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)requestAttachmentURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EMMessageRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  __int16 v9 = [(EMRepository *)self connection];
  uint64_t v10 = [v9 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke;
  v13[3] = &unk_1E63E5518;
  void v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 requestAttachmentMetadataForMessageIDs:v11 completionHandler:v13];
}

void __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) observerScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke_519;
  v9[3] = &unk_1E63E37C8;
  v9[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v10 = v8;
  id v11 = *(id *)(a1 + 48);
  [v7 performBlock:v9];
}

uint64_t __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke_519(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = +[EMMessageRepository log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "<%p> Attachment metadata received: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = +[EMMessageRepository log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  uint64_t v9 = [(EMRepository *)self connection];
  uint64_t v10 = [v9 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke;
  v13[3] = &unk_1E63E5518;
  void v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 requestRichLinkURLsForMessageIDs:v11 completionHandler:v13];
}

void __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) observerScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke_521;
  v9[3] = &unk_1E63E36B0;
  id v11 = *(id *)(a1 + 48);
  id v8 = v3;
  id v10 = v8;
  [v7 performBlock:v9];
}

uint64_t __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke_521(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performMessageChangeAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = +[EMDaemonInterfaceRequest uniqueRequestID];
  uint64_t v6 = +[EMMessageRepository signpostLog];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = +[EMDaemonInterfaceRequest signpostLog];
  uint64_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = (id)objc_opt_class();
    id v10 = v18;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);
  }
  id v11 = +[EMMessageRepository signpostLog];
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v13 = (void *)[v4 signpostType];
    *(_DWORD *)buf = 134349056;
    id v18 = v13;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  [(EMMessageRepository *)self _updateObserversForAction:v4];
  __int16 v14 = [(EMRepository *)self connection];
  uint64_t v15 = [v14 reattemptingRemoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__EMMessageRepository_performMessageChangeAction___block_invoke;
  v16[3] = &__block_descriptor_48_e29_v16__0__EMUndoMessageAction_8l;
  v16[4] = v7;
  v16[5] = v5;
  [v15 performMessageChangeAction:v4 requestID:v5 returnUndoAction:0 completionHandler:v16];
}

void __50__EMMessageRepository_performMessageChangeAction___block_invoke(uint64_t a1)
{
  id v2 = +[EMMessageRepository signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageChangeAction", "", buf, 2u);
  }

  os_signpost_id_t v5 = +[EMDaemonInterfaceRequest signpostLog];
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMMessageRepositoryMessageChangeAction", "", v8, 2u);
  }
}

- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 afterDelay:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = +[EMDaemonInterfaceRequest uniqueRequestID];
  id v8 = +[EMDaemonInterfaceRequest signpostLog];
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v10 = v15;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);
  }
  id v11 = [(EMRepository *)self connection];
  id v12 = [v11 reattemptingRemoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__EMMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_afterDelay___block_invoke;
  v13[3] = &__block_descriptor_40_e29_v16__0__EMUndoMessageAction_8l;
  void v13[4] = v7;
  [v12 performOneTimeCodeMessageDeletionWithObjectID:v6 requestID:v7 returnUndoAction:0 afterDelay:v13 completionHandler:a4];
}

void __80__EMMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_afterDelay___block_invoke(uint64_t a1)
{
  id v2 = +[EMDaemonInterfaceRequest signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageChangeAction", "", v5, 2u);
  }
}

- (id)_updateToMessageObjectIDsIfNeeded:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && ([v4 firstObject],
        os_signpost_id_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    os_signpost_id_t v7 = [(EMMessageRepository *)self _localInMemoryMessageObjectIDsForObjectIDs:v4];
  }
  else
  {
    os_signpost_id_t v7 = 0;
  }
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (id)performMessageChangeActionReturningUndoAction:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = +[EMDaemonInterfaceRequest uniqueRequestID];
  id v6 = +[EMMessageRepository signpostLog];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = +[EMDaemonInterfaceRequest signpostLog];
  id v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = (id)objc_opt_class();
    id v10 = v31;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);
  }
  id v11 = +[EMMessageRepository signpostLog];
  id v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v13 = (void *)[v4 signpostType];
    *(_DWORD *)buf = 134349056;
    id v31 = v13;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  [(EMMessageRepository *)self _updateObserversForAction:v4];
  __int16 v14 = [v4 objectIDs];
  id v15 = [(EMMessageRepository *)self _updateToMessageObjectIDsIfNeeded:v14];
  [v4 setObjectIDs:v15];

  uint64_t v16 = [MEMORY[0x1E4F60E18] promise];
  id v17 = [(EMRepository *)self connection];
  id v18 = [v17 reattemptingRemoteObjectProxy];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __69__EMMessageRepository_performMessageChangeActionReturningUndoAction___block_invoke;
  id v25 = &unk_1E63E5580;
  __int16 v26 = self;
  id v19 = v16;
  id v27 = v19;
  os_signpost_id_t v28 = v7;
  os_signpost_id_t v29 = v5;
  [v18 performMessageChangeAction:v4 requestID:v5 returnUndoAction:1 completionHandler:&v22];

  uint64_t v20 = objc_msgSend(v19, "future", v22, v23, v24, v25, v26);

  return v20;
}

void __69__EMMessageRepository_performMessageChangeActionReturningUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) trampoliningObserverForObserver:*(void *)(a1 + 40)];
  if (v3)
  {
    [v4 finishWithResult:v3];
  }
  else
  {
    os_signpost_id_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
    [v4 finishWithError:v5];
  }
  id v6 = +[EMMessageRepository signpostLog];
  os_signpost_id_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EMMessageRepositoryMessageChangeAction", "", buf, 2u);
  }

  id v9 = +[EMDaemonInterfaceRequest signpostLog];
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v10, OS_SIGNPOST_INTERVAL_END, v11, "EMMessageRepositoryMessageChangeAction", "", v12, 2u);
  }
}

- (void)_updateObserversForAction:(id)a3
{
  id v6 = a3;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    [(EMMessageRepository *)self _updateObserversForFlagChangeAction:v6];
    goto LABEL_11;
  }
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v4 = v6;
    if (([v4 copyMessages] & 1) == 0)
    {
      os_signpost_id_t v5 = [v4 objectIDs];
      [(EMMessageRepository *)self _updateObserversForDeletedObjectIDs:v5];
    }
    goto LABEL_10;
  }
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    [(EMMessageRepository *)self _unsubscribeTypeDidChangeForUnsubscribeChangeAction:v6];
    goto LABEL_11;
  }
  if ([(EMMessageRepository *)self _shouldActionUpdateObserversForDeletedObjectIDs:v6])
  {
    id v4 = [v6 objectIDs];
    [(EMMessageRepository *)self _updateObserversForDeletedObjectIDs:v4];
LABEL_10:
  }
LABEL_11:
}

- (BOOL)_shouldActionUpdateObserversForDeletedObjectIDs:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isMemberOfClass:objc_opt_class()];
  }

  return v4;
}

- (void)_updateObserversForFlagChangeAction:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  char v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v27 = [v23 flagChange];
  id v25 = [v23 objectIDs];
  __int16 v26 = [(EMMessageRepository *)self currentObservers];
  id v31 = self;
  os_unfair_lock_t lock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v25;
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v6 = [(NSMapTable *)v31->_observedMessageListItemCache objectForKey:v5];
        os_signpost_id_t v7 = v6;
        if (v6)
        {
          uint64_t v33 = v6;
          char v8 = [v6 conformsToProtocol:&unk_1F1A656E8];
          os_signpost_id_t v7 = v33;
          if (v8)
          {
            char v39 = 0;
            id v9 = [v33 flags];
            os_signpost_id_t v29 = [v27 flagsAfterChangingFlags:v9 flagsWereChanged:&v39];

            if (v39)
            {
              id v10 = +[EMMessageListItemChange changeForFlags:v29];
              [v10 applyToMessageListItem:v33];
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v11 = v26;
              uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
              if (v12)
              {
                uint64_t v13 = *(void *)v36;
                do
                {
                  for (uint64_t j = 0; j != v12; ++j)
                  {
                    if (*(void *)v36 != v13) {
                      objc_enumerationMutation(v11);
                    }
                    id v15 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                    if ([v15 observerContainsObjectID:v5])
                    {
                      id v16 = [v4 objectForKey:v15];
                      if (!v16)
                      {
                        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        [v4 setObject:v16 forKey:v15];
                      }
                      [v16 setObject:v10 forKeyedSubscript:v5];
                    }
                  }
                  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
                }
                while (v12);
              }
            }
            os_signpost_id_t v7 = v33;
          }
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v32);
  }

  os_unfair_lock_unlock(lock);
  id v17 = [v4 keyEnumerator];
  for (k = 0; ; k = v19)
  {
    id v19 = [v17 nextObject];

    if (!v19) {
      break;
    }
    uint64_t v20 = [v4 objectForKey:v19];
    id v44 = @"changesByObjectID";
    uint64_t v45 = v20;
    int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v22 = [v20 allKeys];
    [v19 queryMatchedChangedObjectIDs:v22 extraInfo:v21];
  }
}

- (void)_updateObserversForDeletedObjectIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 count] == 0;
  id v15 = self;
  [(EMMessageRepository *)self currentObservers];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke;
        v17[3] = &unk_1E63E4F18;
        v17[4] = v9;
        id v10 = objc_msgSend(v4, "ef_filter:", v17);
        if ([v10 count])
        {
          [v9 queryAnticipatesDeletedObjectIDs:v10];
          BOOL v5 = 1;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v6);
  }

  if (!v5)
  {
    id v11 = objc_msgSend(obj, "ef_filter:", &__block_literal_global_530);
    uint64_t v12 = +[EMMessageRepository log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v4 count];
      uint64_t v14 = [obj count];
      *(_DWORD *)buf = 134218754;
      id v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      os_signpost_id_t v29 = v11;
      _os_log_error_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_ERROR, "<%p> Fail to update observer for deleted objectIDs.count:%lu, observers.count:%lu, observersInRecovery:%{public}@", buf, 0x2Au);
    }
  }
}

uint64_t __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerContainsObjectID:a2];
}

uint64_t __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 isRecovering];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)resetAllPrecomputedThreadScopes
{
  id v3 = [(EMRepository *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 resetPrecomputedThreadScopesForMailboxScope:0];
}

- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EMRepository *)self connection];
  id v11 = [v10 remoteObjectProxy];
  [v11 setCachedMetadataJSON:v12 forKey:v8 messageID:v9];
}

- (id)cachedMetadataJSONForKey:(id)a3 messageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__9;
  long long v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  id v8 = [(EMRepository *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke;
  v13[3] = &unk_1E63E4330;
  void v13[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_533;
  v12[3] = &unk_1E63E55C8;
  void v12[4] = &v14;
  [v9 getCachedMetadataJSONForKey:v6 messageID:v7 completionHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }
}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_533(uint64_t a1, void *a2)
{
}

- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EMRepository *)self connection];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __69__EMMessageRepository_getCachedMetadataJSONForKey_messageID_handler___block_invoke;
  id v17 = &unk_1E63E55F0;
  long long v18 = self;
  id v12 = v10;
  id v19 = v12;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:&v14];

  objc_msgSend(v13, "getCachedMetadataJSONForKey:messageID:completionHandler:", v8, v9, v12, v14, v15, v16, v17, v18);
}

void __69__EMMessageRepository_getCachedMetadataJSONForKey_messageID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)metadataForAddresses:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = [(EMRepository *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__EMMessageRepository_metadataForAddresses___block_invoke;
  v17[3] = &unk_1E63E4930;
  v17[4] = self;
  id v7 = v5;
  id v18 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v17];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__EMMessageRepository_metadataForAddresses___block_invoke_538;
  v13[3] = &unk_1E63E5638;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = self;
  id v10 = v4;
  id v16 = v10;
  [v8 metadataForAddresses:v10 completionHandler:v13];
  id v11 = [v9 future];

  return v11;
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __44__EMMessageRepository_metadataForAddresses___block_invoke_cold_1();
  }

  BOOL v5 = *(void **)(a1 + 40);
  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"cannot connect to proxy");
  [v5 finishWithError:v6];
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_538(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_541);

    id v4 = (void *)v5;
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
  {
    id v6 = +[EMMessageRepository log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__EMMessageRepository_metadataForAddresses___block_invoke_538_cold_1();
    }

    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"unable to obtain address metadata");
    [v7 finishWithError:v8];
  }
}

EMAddressMetadata *__44__EMMessageRepository_metadataForAddresses___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[EMAddressMetadata alloc] initWithDictionary:v2];

  return v3;
}

- (void)updateLastSeenDate:(id)a3 andDisplayDate:(id)a4 forBusinessWithEmailAddress:(id)a5 category:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(EMRepository *)self connection];
  id v14 = [v13 remoteObjectProxy];
  [v14 updateLastSeenDate:v15 andDisplayDate:v10 forBusinessWithEmailAddress:v11 category:v12];
}

- (void)logCategoryMetadataForObjectIDs:(id)a3
{
  id v6 = a3;
  id v4 = [(EMRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 logCategoryMetadataForObjectIDs:v6];
}

- (EFFuture)remoteContentURLCache
{
  id v2 = [(EMMessageRepository *)self remoteContentCachePromise];
  id v3 = [v2 future];

  return (EFFuture *)v3;
}

void __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }
}

void __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_547(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = [v5 url];
    id v8 = WeakRetained[13];
    WeakRetained[13] = (id)v7;

    [WeakRetained[13] startAccessingSecurityScopedResource];
    id v9 = [(NSURLCache *)[EMRemoteContentURLCache alloc] initWithMemoryCapacity:*(void *)(a1 + 40) diskCapacity:a3 directoryURL:WeakRetained[13]];
    id v10 = +[EMMessageRepository log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = WeakRetained[13];
      *(_DWORD *)buf = 134218498;
      id v17 = WeakRetained;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Starting remote content cache with URL: %@ diskCapacity: %lu", buf, 0x20u);
    }

    id v12 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_550;
    v14[3] = &unk_1E63E2760;
    v14[4] = WeakRetained;
    uint64_t v13 = v9;
    id v15 = v13;
    [v12 performBlock:v14];
  }
}

uint64_t __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_550(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = +[EMMessageRepository log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) currentDiskUsage];
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "<%p>Remote content cache currentDiskUsage: %lu", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 112) finishWithResult:*(void *)(a1 + 40)];
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(EMRepository *)self connection];
  id v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 noteViewOfRemoteContentLinks:v6];
}

- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v11 = [(EMRepository *)self connection];
  id v12 = [v11 reattemptingRemoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke;
  v14[3] = &unk_1E63E56B0;
  objc_copyWeak(&v16, &location);
  id v13 = v10;
  id v15 = v13;
  [v12 getRemoteContentURLInfoOrderedBy:a3 inReverseOrder:v7 limit:a5 completionHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained observerScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke_2;
    v13[3] = &unk_1E63E5688;
    id v17 = *(id *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 performBlock:v13];
  }
}

uint64_t __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = [(EMRepository *)self connection];
  id v9 = [v8 reattemptingRemoteObjectProxy];
  unint64_t v10 = +[EMDaemonInterfaceRequest uniqueRequestID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke;
  v12[3] = &unk_1E63E56D8;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  [v9 parseRemoteContentURLsFromMessageWithObjectID:v6 requestID:v10 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained observerScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke_2;
    v10[3] = &unk_1E63E5208;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    [v9 performBlock:v10];
  }
}

uint64_t __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestSummaryForObjectIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1BEFDB000, "-[EMMessageRepository requestSummaryForObjectIDs:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  if ([v4 count])
  {
    os_signpost_id_t v6 = +[EMDaemonInterfaceRequest uniqueRequestID];
    id v7 = +[EMDaemonInterfaceRequest signpostLog];
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 67240192;
      int v17 = v9;
      _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMMessageRepositoryMessageListItems", "Requesting summaries for objectIDs %{public, name=objectID}u", buf, 8u);
    }

    unint64_t v10 = [(EMRepository *)self connection];
    id v11 = [v10 reattemptingRemoteObjectProxy];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__EMMessageRepository_requestSummaryForObjectIDs___block_invoke;
    v12[3] = &unk_1E63E5700;
    os_signpost_id_t v14 = v6;
    id v13 = v4;
    [v11 messageListItemsForObjectIDs:MEMORY[0x1E4F1CBF0] requestID:v6 observationIdentifier:0 loadSummaryForAdditionalObjectIDs:v13 completionHandler:v12];
  }
  os_activity_scope_leave(&state);
}

void __50__EMMessageRepository_requestSummaryForObjectIDs___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[EMDaemonInterfaceRequest signpostLog];
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F60E00], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v6[0] = 67240192;
    v6[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=results}u", (uint8_t *)v6, 8u);
  }
}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__9;
  __int16 v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  unint64_t v10 = [(EMRepository *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke;
  v15[3] = &unk_1E63E4330;
  void v15[4] = self;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_553;
  v14[3] = &unk_1E63E5728;
  void v14[4] = &v16;
  [v11 messagesInConversationIDs:v8 limit:a4 observationIdentifier:v9 completionHandler:v14];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[EMMessageRepository log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_cold_1();
  }
}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_553(uint64_t a1, void *a2)
{
}

- (id)brandIndicatorForLocation:(id)a3
{
  id v4 = a3;
  int v5 = [(EMMessageRepository *)self brandIndicatorsCache];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__EMMessageRepository_brandIndicatorForLocation___block_invoke;
  v10[3] = &unk_1E63E5778;
  void v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = v5;
  id v7 = v5;
  id v8 = [v7 objectForKey:v6 generator:v10];

  return v8;
}

id __49__EMMessageRepository_brandIndicatorForLocation___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F60E18]);
  uint64_t v3 = [a1[4] connection];
  id v4 = [v3 reattemptingRemoteObjectProxy];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __49__EMMessageRepository_brandIndicatorForLocation___block_invoke_2;
  id v12 = &unk_1E63E5750;
  id v5 = a1[5];
  id v13 = a1[4];
  id v6 = v2;
  id v14 = v6;
  id v15 = a1[6];
  id v16 = a1[5];
  [v4 brandIndicatorForLocation:v5 completionHandler:&v9];

  id v7 = objc_msgSend(v6, "future", v9, v10, v11, v12, v13);

  return v7;
}

void __49__EMMessageRepository_brandIndicatorForLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  if (v3)
  {
    id v6 = [v4 trampoliningObserverForObserver:v5];
    [v6 finishWithResult:v9];
  }
  else
  {
    id v7 = [v4 trampoliningObserverForObserver:v5];
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [v7 finishWithResult:v8];

    [*(id *)(a1 + 48) removeObjectForKey:*(void *)(a1 + 56)];
  }
}

- (void)recategorizeMessageSinceDate:(id)a3
{
  id v6 = a3;
  id v4 = [(EMRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 recategorizeMessageSinceDate:v6];
}

- (void)recategorizeMessagesForQuery:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(EMRepository *)self connection];
  id v8 = [v7 remoteObjectProxy];
  [v8 recategorizeMessagesForQuery:v9 completion:v6];
}

- (id)countOfUserOverrides
{
  id v3 = [MEMORY[0x1E4F60E18] promise];
  id v4 = [(EMRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__EMMessageRepository_countOfUserOverrides__block_invoke;
  v9[3] = &unk_1E63E57A0;
  id v6 = v3;
  id v10 = v6;
  [v5 countOfUserOverridesWithCompletionHandler:v9];

  id v7 = [v6 future];

  return v7;
}

void __43__EMMessageRepository_countOfUserOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  objc_msgSend(v2, "finishWithResult:");
}

- (void)removeAllEntriesFromBusinessCloudStorage
{
  id v3 = [(EMRepository *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 removeAllEntriesFromBusinessCloudStorage];
}

- (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "ef_compactMapSelector:", sel_objectID);
  id v8 = [(EMMessageRepository *)self predictMailboxForMovingMessagesWithIDs:v7 completionHandler:v6];

  return v8;
}

- (id)predictMailboxForMovingMessagesWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_EMMessageRepositoryMailboxPredictionObserver alloc] initWithMessageObjectIDs:v6 completionHandler:v7];
  os_unfair_lock_lock(&self->_observersLock);
  [(NSHashTable *)self->_recoverableObservers addObject:v8];
  os_unfair_lock_unlock(&self->_observersLock);
  id v9 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  [v9 addCancelable:v8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __80__EMMessageRepository_predictMailboxForMovingMessagesWithIDs_completionHandler___block_invoke;
  id v16 = &unk_1E63E2760;
  int v17 = self;
  id v10 = v8;
  uint64_t v18 = v10;
  [v9 addCancelationBlock:&v13];
  id v11 = [(EMRepository *)self connection];
  [(_EMMessageRepositoryMailboxPredictionObserver *)v10 performWithRemoteConnection:v11];

  return v9;
}

void __80__EMMessageRepository_predictMailboxForMovingMessagesWithIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(v2);
}

- (void)loadOlderMessagesForMailboxes:(id)a3
{
  id v6 = a3;
  id v4 = [(EMRepository *)self connection];
  uint64_t v5 = [v4 remoteObjectProxy];
  [v5 loadOlderMessagesForMailboxes:v6];
}

- (id)messageObjectIDForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = [(EMRepository *)self connection];
  id v7 = [v6 requestRecoveryAssertion];

  id v8 = [(EMRepository *)self connection];
  id v9 = [v8 reattemptingRemoteObjectProxy];
  id v10 = [v5 completionHandlerAdapter];
  [v9 messageObjectIDForURL:v4 completionHandler:v10];

  id v11 = [v5 future];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__EMMessageRepository_messageObjectIDForURL___block_invoke;
  v14[3] = &unk_1E63E26B0;
  id v15 = v7;
  id v12 = v7;
  [v11 always:v14];

  return v11;
}

uint64_t __45__EMMessageRepository_messageObjectIDForURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)messageForSearchableItemIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [(EMMessageRepository *)self messageObjectIDsForSearchableItemIdentifiers:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__EMMessageRepository_messageForSearchableItemIdentifier___block_invoke;
  v9[3] = &unk_1E63E57C8;
  void v9[4] = self;
  id v7 = [v6 then:v9];

  return v7;
}

id __58__EMMessageRepository_messageForSearchableItemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectIDs];
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 firstObject];
    [v4 messageForObjectID:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F60D70];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"spotlight identifiers mapped to zero object IDs");
    [v6 futureWithError:v5];
  id v7 = };

  return v7;
}

- (id)messageObjectIDsForSearchableItemIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = [(EMRepository *)self connection];
  id v7 = [v6 remoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__EMMessageRepository_messageObjectIDsForSearchableItemIdentifiers___block_invoke;
  v11[3] = &unk_1E63E57F0;
  id v8 = v5;
  id v12 = v8;
  [v7 messageObjectIDsForSearchableItemIdentifiers:v4 completionHandler:v11];

  id v9 = [v8 future];

  return v9;
}

void __68__EMMessageRepository_messageObjectIDsForSearchableItemIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v10 = [[EMOrderedMessageIDData alloc] initWithObjectIDs:v11 objectIDByPersistentID:v7];
  [v9 finishWithResult:v10 error:v8];
}

- (id)persistentIDForMessageObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
  id v6 = [(EMRepository *)self connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke;
  v21[3] = &unk_1E63E49F8;
  v21[4] = self;
  id v7 = v4;
  id v22 = v7;
  id v8 = v5;
  id v23 = v8;
  id v9 = [v6 remoteObjectProxyWithErrorHandler:v21];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_565;
  int v17 = &unk_1E63E5818;
  id v10 = v8;
  id v18 = v10;
  id v19 = self;
  id v11 = v7;
  id v20 = v11;
  [v9 persistentIDForMessageObjectID:v11 completionHandler:&v14];

  id v12 = objc_msgSend(v10, "future", v14, v15, v16, v17);

  return v12;
}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EMMessageRepository log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = objc_msgSend(v3, "ef_publicDescription");
    int v8 = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_error_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_ERROR, "<%p> Encountered error while getting persistentID for messageObjectID %{public}@, error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(a1 + 48) finishWithError:v3];
}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_565(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) finishWithResult:v3];
  }
  else
  {
    id v4 = +[EMMessageRepository log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_565_cold_1();
    }

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 48));
    [v5 finishWithError:v6];
  }
}

- (void)_applyChangesToCachedObjects:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EMMessageRepository log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Apply changes to cached object IDs: %{public}@", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __52__EMMessageRepository__applyChangesToCachedObjects___block_invoke;
  v6[3] = &unk_1E63E5840;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
}

void __52__EMMessageRepository__applyChangesToCachedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v7];
  if (!v6)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v7];
  }
  if ([v6 conformsToProtocol:&unk_1F1A656E8]) {
    [v5 applyToMessageListItem:v6];
  }
}

void __108__EMMessageRepository__detectChangesForMatchedAddedObjectIDs_observerationIdentifier_matchedChangesHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v18;
  uint64_t v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
  if (v2)
  {
    uint64_t v3 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v22 + 1) + 8 * v4);
        uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
        BOOL v7 = v5 == v6;

        if (!v7)
        {
          int v8 = *(void **)(a1 + 32);
          __int16 v9 = [v5 objectID];
          id v10 = [v8 objectForKeyedSubscript:v9];

          uint64_t v11 = [v5 changeFrom:v10];
          __int16 v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 date];
            if (!v13) {
              goto LABEL_10;
            }
            uint64_t v14 = [v12 date];
            uint64_t v15 = [v10 date];
            int v16 = objc_msgSend(v14, "ef_isLaterThanDate:", v15);

            if (v16)
            {
LABEL_10:
              int v17 = [v5 objectID];
              [v19 setObject:v12 forKeyedSubscript:v17];
            }
          }
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v2);
  }

  if ([v19 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

EMMessageListItemChange *__48__EMMessageRepository__blockedSendersDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 isBlocked];
  id v5 = [v3 senderList];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int v17 = __48__EMMessageRepository__blockedSendersDidChange___block_invoke_2;
  id v18 = &unk_1E63E5890;
  char v20 = *(unsigned char *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  uint64_t v6 = objc_msgSend(v5, "ef_any:", &v15);

  if (v4 == v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = objc_alloc_init(EMMessageListItemChange);
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", v6, v15, v16, v17, v18);
    [(EMMessageListItemChange *)v7 setIsBlocked:v8];

    __int16 v9 = [v3 senderList];
    id v10 = objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_571);

    uint64_t v11 = +[EMMessageRepository log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = [v3 itemID];
      *(_DWORD *)buf = 134219010;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      long long v24 = v13;
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 1024;
      int v28 = v6;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Blocked sender changed for:%@ from %d to %d for addresses: %{public}@", buf, 0x2Cu);
    }
  }

  return v7;
}

uint64_t __48__EMMessageRepository__blockedSendersDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 emailAddressValue];
  int v4 = [v3 simpleAddress];

  if (v4 && *(unsigned char *)(a1 + 40)) {
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id __48__EMMessageRepository__blockedSendersDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 emailAddressValue];
  id v3 = objc_msgSend(v2, "ef_publicDescription");

  return v3;
}

- (void)_vipsDidChange:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__EMMessageRepository__vipsDidChange___block_invoke;
  v5[3] = &unk_1E63E5900;
  void v5[4] = self;
  int v4 = (void *)MEMORY[0x1C18A2160](v5, a2, a3);
  [(EMMessageRepository *)self _broadcastMessageListItemChangesToObservers:v4 forObjectIDs:0];
}

EMMessageListItemChange *__38__EMMessageRepository__vipsDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) vipManager];
  int v5 = [v3 isVIP];
  uint64_t v6 = [v3 senderList];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__EMMessageRepository__vipsDidChange___block_invoke_2;
  v17[3] = &unk_1E63E2A40;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = objc_msgSend(v6, "ef_any:", v17);

  if (v5 == v8)
  {
    uint64_t v14 = 0;
  }
  else
  {
    __int16 v9 = [v3 senderList];
    id v10 = objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_574);

    uint64_t v11 = +[EMMessageRepository log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [v3 itemID];
      *(_DWORD *)buf = 134219010;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 1024;
      int v26 = v8;
      __int16 v27 = 2114;
      int v28 = v10;
      _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> VIP status changed for:%@ from %d to %d for addresses: %{public}@", buf, 0x2Cu);
    }
    uint64_t v14 = objc_alloc_init(EMMessageListItemChange);
    uint64_t v15 = [NSNumber numberWithBool:v8];
    [(EMMessageListItemChange *)v14 setIsVIP:v15];
  }
  return v14;
}

uint64_t __38__EMMessageRepository__vipsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 emailAddressValue];
  int v4 = [v3 simpleAddress];

  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) isVIPAddress:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id __38__EMMessageRepository__vipsDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 emailAddressValue];
  id v3 = objc_msgSend(v2, "ef_publicDescription");

  return v3;
}

- (void)_unsubscribeTypeDidChangeForUnsubscribeChangeAction:(id)a3
{
  id v4 = [a3 objectIDs];
  -[EMMessageRepository _broadcastMessageListItemChangesToObservers:forObjectIDs:](self, "_broadcastMessageListItemChangesToObservers:forObjectIDs:", &__block_literal_global_576);
}

id __75__EMMessageRepository__unsubscribeTypeDidChangeForUnsubscribeChangeAction___block_invoke()
{
  v0 = +[EMMessageListItemChange changeForUnsubscribeType:0];
  return v0;
}

- (void)_broadcastMessageListItemChangesToObservers:(id)a3 forObjectIDs:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke;
  v24[3] = &unk_1E63E5948;
  id v19 = v17;
  id v25 = v19;
  id v18 = v6;
  id v27 = v18;
  id v21 = v7;
  id v26 = v21;
  uint64_t v20 = (void (**)(void, void))MEMORY[0x1C18A2160](v24);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  uint64_t v8 = ((void (**)(void, NSMapTable *))v20)[2](v20, self->_observedMessageListItemCache);
  id v9 = (id)((uint64_t (*)(void, NSMapTable *))v20[2])(v20, self->_unobservedMessageListItemCache);
  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  if (objc_msgSend(v21, "count", v6, v17))
  {
    [(EMMessageRepository *)self _applyChangesToCachedObjects:v21];
    id v10 = [(EMMessageRepository *)self currentObservers];
    uint64_t v11 = [v10 objectEnumerator];

    id v12 = 0;
    while (1)
    {
      uint64_t v13 = [v11 nextObject];

      if (!v13) {
        break;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke_2;
      v22[3] = &unk_1E63E5970;
      id v12 = v13;
      id v23 = v12;
      uint64_t v14 = objc_msgSend(v8, "ef_filter:", v22);
      if ([v14 count])
      {
        int v28 = @"changesByObjectID";
        v29[0] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        uint64_t v16 = [v14 allKeys];
        [v12 queryMatchedChangedObjectIDs:v16 extraInfo:v15];
      }
    }
  }
}

id __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 objectEnumerator];
  id v6 = 0;
  id v7 = 0;
  while (1)
  {
    uint64_t v8 = v7;
    id v9 = v6;
    id v7 = [v5 nextObject];

    if (!v7) {
      break;
    }
    id v6 = [v7 objectID];

    id v10 = *(void **)(a1 + 32);
    if (v10 && ![v10 containsObject:v6])
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (v11)
      {
        id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];

        if (!v12)
        {
          [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v6];
          [v4 setObject:v11 forKeyedSubscript:v6];
        }
      }
    }
  }
  return v4;
}

uint64_t __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerContainsObjectID:a2];
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (void)setQueryCountCache:(id)a3
{
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (EFPromise)remoteContentCachePromise
{
  return self->_remoteContentCachePromise;
}

- (void)setRemoteContentCachePromise:(id)a3
{
}

- (EFLazyCache)brandIndicatorsCache
{
  return self->_brandIndicatorsCache;
}

- (void)setBrandIndicatorsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_brandIndicatorsCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCachePromise, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_queryCountCache, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_connectionRecoveryAssertion, 0);
  objc_storeStrong((id *)&self->_recoverableObservers, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadQueryHandlers, 0);
  objc_storeStrong((id *)&self->_wrappedObserversByActualObserver, 0);
  objc_storeStrong((id *)&self->_unobservedMessageListItemCache, 0);
  objc_storeStrong((id *)&self->_observedMessageListItemCache, 0);
}

void __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "Content representation failed to load: %{public}@ with error %{public}@", v4, v5);
}

void __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_3_0(&dword_1BEFDB000, a2, a3, "<%p> Could not connect to the proxy to request rich link metadata for rich link ID: %@", (uint8_t *)&v5);
}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "<%p> Failed to get metadata through XPC proxy: %{public}@", v4, v5);
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "<%p> Could not connect to the XPC proxy to fetch address metadata: %{public}@", v4, v5);
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_538_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1BEFDB000, v0, v1, "<%p> Cannot obtain address metadata for  %{public}@", v2);
}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "<%p> Failed to get messages through XPC proxy: %{public}@", v4, v5);
}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_565_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1BEFDB000, v0, v1, "<%p> No persistentID found for messageObjectID: %{public}@", v2);
}

@end