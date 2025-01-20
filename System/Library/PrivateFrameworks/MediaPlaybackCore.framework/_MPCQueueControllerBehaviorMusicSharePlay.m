@interface _MPCQueueControllerBehaviorMusicSharePlay
+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4;
- (BOOL)_useItemPlaceholderForContentItemID:(id)a3;
- (BOOL)_useItemPlaceholderForItemID:(id)a3;
- (BOOL)allowsQueueModifications;
- (BOOL)autoPlayEnabled;
- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3;
- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3;
- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)hasUserMutations;
- (BOOL)isAutoPlayContentItemID:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5;
- (BOOL)itemExistsForContentItemID:(id)a3;
- (BOOL)joiningAsInitiator;
- (ICLiveLink)liveLink;
- (ICSharedListeningQueue)queue;
- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet;
- (MPCQueueControllerBehaviorHost)host;
- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate;
- (MPCQueueControllerBehaviorMusicSharePlayDelegate)musicSharePlayBehaviorDelegate;
- (MPCQueueControllerExternalSyncBehaviorHost)externalSyncHost;
- (MPPropertySet)requestedPropertySetForEvents;
- (MPRequestResponseController)requestController;
- (NSArray)enumeratorContentItemIDs;
- (NSDictionary)resultsIndexPathMap;
- (NSHashTable)activeModelGenericAVItems;
- (NSMutableArray)pendingActions;
- (NSMutableSet)knownContainerIDs;
- (NSString)sessionID;
- (_MPCQueueControllerBehaviorMusicSharePlay)initWithSessionID:(id)a3;
- (id)_componentsForContentItemID:(id)a3;
- (id)_componentsForSharedListeningItemID:(id)a3;
- (id)_itemForContentItemID:(id)a3;
- (id)_itemObjectForSharedListeningItemID:(id)a3;
- (id)_mpcSharedListeningEventForICLiveLinkEvent:(id)a3;
- (id)_queueAsStateDictionary;
- (id)_sectionObjectForSharedListeningContainerID:(id)a3;
- (id)_sectionedCollectionForQueue:(id)a3;
- (id)_stateDictionaryIncludingQueue:(BOOL)a3;
- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5;
- (id)contentItemIDWithoutRepeatIteration:(id)a3;
- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4;
- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3;
- (id)performLoadCommand:(id)a3 completion:(id)a4;
- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4;
- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3;
- (int64_t)displayItemCount;
- (int64_t)playbackPositionRestorationPolicy;
- (int64_t)queueExplicitContentState;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (void)_dequeuePendingActions;
- (void)_emitEventsForAddedSharedListeningContainer:(id)a3;
- (void)_emitEventsForParticipants:(id)a3 localUserIdentity:(id)a4;
- (void)_emitEventsForPlaybackBehaviorChange;
- (void)_enqueuePendingActionWithLabel:(id)a3 itemIdentifier:(id)a4 block:(id)a5;
- (void)_initializeWithQueue:(id)a3;
- (void)_purgePendingActionsWithLabel:(id)a3;
- (void)_reloadCacheDataWithOptions:(unint64_t)a3;
- (void)_setQueue:(id)a3;
- (void)activeItemFlagsDidChange:(unsigned __int16)a3;
- (void)canReuseQueue:(id)a3 completion:(id)a4;
- (void)clearAllItemsAfterContentItemID:(id)a3;
- (void)connectToExternalSyncHost:(id)a3;
- (void)connectToHost:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)didConnectToHost:(id)a3;
- (void)didJumpToTargetContentItemID:(id)a3;
- (void)didReachEndOfQueueWithReason:(id)a3;
- (void)didStopLiveLink:(id)a3;
- (void)disconnectFromExternalSyncHost:(id)a3;
- (void)disconnectFromHost:(id)a3;
- (void)endSynchronizedPlayback;
- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4;
- (void)getExpectedCurrentItemModelObjectWithCompletion:(id)a3;
- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4;
- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5;
- (void)liveLink:(id)a3 didReceiveDirectCurrentItemChanged:(id)a4 fromParticipant:(id)a5;
- (void)liveLink:(id)a3 didReceiveEvent:(id)a4;
- (void)liveLink:(id)a3 didUpdateParticipants:(id)a4;
- (void)liveLink:(id)a3 didUpdateQueue:(id)a4;
- (void)liveLinkDidReconnect:(id)a3;
- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5;
- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5;
- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)removeContentItemID:(id)a3 completion:(id)a4;
- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4;
- (void)setActiveModelGenericAVItems:(id)a3;
- (void)setAllowsQueueModifications:(BOOL)a3;
- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)setEnumeratorContentItemIDs:(id)a3;
- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4;
- (void)setIdentityPropertySet:(id)a3;
- (void)setJoiningAsInitiator:(BOOL)a3;
- (void)setKnownContainerIDs:(id)a3;
- (void)setLiveLink:(id)a3;
- (void)setMusicBehaviorDelegate:(id)a3;
- (void)setMusicSharePlayBehaviorDelegate:(id)a3;
- (void)setPendingActions:(id)a3;
- (void)setRepeatType:(int64_t)a3 completion:(id)a4;
- (void)setRequestController:(id)a3;
- (void)setRequestedPropertySetForEvents:(id)a3;
- (void)setResultsIndexPathMap:(id)a3;
- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)updatePlaybackCoordinator:(id)a3;
@end

@implementation _MPCQueueControllerBehaviorMusicSharePlay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModelGenericAVItems, 0);
  objc_storeStrong((id *)&self->_enumeratorContentItemIDs, 0);
  objc_storeStrong((id *)&self->_resultsIndexPathMap, 0);
  objc_storeStrong((id *)&self->_knownContainerIDs, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_requestedPropertySetForEvents, 0);
  objc_destroyWeak((id *)&self->_musicSharePlayBehaviorDelegate);
  objc_destroyWeak((id *)&self->_musicBehaviorDelegate);
  objc_destroyWeak((id *)&self->_externalSyncHost);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);

  objc_storeStrong((id *)&self->_playbackCoordinator, 0);
}

- (void)setActiveModelGenericAVItems:(id)a3
{
}

- (NSHashTable)activeModelGenericAVItems
{
  return self->_activeModelGenericAVItems;
}

- (void)setJoiningAsInitiator:(BOOL)a3
{
  self->_joiningAsInitiator = a3;
}

- (BOOL)joiningAsInitiator
{
  return self->_joiningAsInitiator;
}

- (void)setEnumeratorContentItemIDs:(id)a3
{
}

- (NSArray)enumeratorContentItemIDs
{
  return self->_enumeratorContentItemIDs;
}

- (void)setResultsIndexPathMap:(id)a3
{
}

- (NSDictionary)resultsIndexPathMap
{
  return self->_resultsIndexPathMap;
}

- (void)setKnownContainerIDs:(id)a3
{
}

- (NSMutableSet)knownContainerIDs
{
  return self->_knownContainerIDs;
}

- (void)setPendingActions:(id)a3
{
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setIdentityPropertySet:(id)a3
{
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return self->_identityPropertySet;
}

- (void)setRequestController:(id)a3
{
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (ICSharedListeningQueue)queue
{
  return self->_queue;
}

- (void)setLiveLink:(id)a3
{
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (BOOL)hasUserMutations
{
  return self->_hasUserMutations;
}

- (MPPropertySet)requestedPropertySetForEvents
{
  return self->_requestedPropertySetForEvents;
}

- (void)setMusicSharePlayBehaviorDelegate:(id)a3
{
}

- (MPCQueueControllerBehaviorMusicSharePlayDelegate)musicSharePlayBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicSharePlayBehaviorDelegate);

  return (MPCQueueControllerBehaviorMusicSharePlayDelegate *)WeakRetained;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (void)setMusicBehaviorDelegate:(id)a3
{
}

- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);

  return (MPCQueueControllerBehaviorMusicDelegate *)WeakRetained;
}

- (MPCQueueControllerExternalSyncBehaviorHost)externalSyncHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalSyncHost);

  return (MPCQueueControllerExternalSyncBehaviorHost *)WeakRetained;
}

- (MPCQueueControllerBehaviorHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (MPCQueueControllerBehaviorHost *)WeakRetained;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (BOOL)_useItemPlaceholderForContentItemID:(id)a3
{
  v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  if ([v5 type])
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusicSharePlay.m" lineNumber:1815 description:@"This method only supports MPCQueueControllerBehaviorItemTypeItem"];
  }
  v6 = [v5 itemID];
  BOOL v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _useItemPlaceholderForItemID:v6];

  return v7;
}

- (BOOL)_useItemPlaceholderForItemID:(id)a3
{
  requestController = self->_requestController;
  id v5 = a3;
  v6 = [(MPRequestResponseController *)requestController response];
  BOOL v7 = [v6 modelResponse];
  v8 = [v7 results];

  v9 = [(NSDictionary *)self->_resultsIndexPathMap objectForKeyedSubscript:v5];

  if (v9)
  {
    v10 = [v8 identifiersForItemAtIndexPath:v9];
    char v11 = [v10 isPlaceholder];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)_setQueue:(id)a3
{
  id v5 = (ICSharedListeningQueue *)a3;
  p_queue = (id *)&self->_queue;
  queue = self->_queue;
  if (queue != v5)
  {
    if (!queue
      || (int v8 = [(ICSharedListeningQueue *)queue isAutoPlayEnabled],
          v8 != [(ICSharedListeningQueue *)v5 isAutoPlayEnabled]))
    {
      v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self musicBehaviorDelegate];
      if ([(_MPCQueueControllerBehaviorMusicSharePlay *)self autoPlayEnabled]) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = 2;
      }
      [v9 behavior:self didChangeActionAtQueueEnd:v10];

      [(_MPCQueueControllerBehaviorMusicSharePlay *)self _emitEventsForPlaybackBehaviorChange];
    }
    if (!*p_queue
      || (uint64_t v11 = [*p_queue explicitContentState],
          v11 != [(ICSharedListeningQueue *)v5 explicitContentState]))
    {
      uint64_t v12 = [(ICSharedListeningQueue *)v5 explicitContentState];
      if (v12 == 2) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = v12 == 1;
      }
      v14 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self musicSharePlayBehaviorDelegate];
      [v14 behavior:self didChangeExplicitContentState:v13];
    }
    objc_storeStrong((id *)&self->_queue, a3);
    v15 = [(ICSharedListeningQueue *)self->_queue tracklist];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55___MPCQueueControllerBehaviorMusicSharePlay__setQueue___block_invoke;
    v16[3] = &unk_2643C2690;
    v16[4] = self;
    [v15 enumerateSectionsUsingBlock:v16];

    [(_MPCQueueControllerBehaviorMusicSharePlay *)self _reloadCacheDataWithOptions:0];
  }
}

- (id)_sectionObjectForSharedListeningContainerID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRequestResponseController *)self->_requestController response];
  v6 = [v5 modelResponse];
  BOOL v7 = [v6 results];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18213;
  v18 = __Block_byref_object_dispose__18214;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89___MPCQueueControllerBehaviorMusicSharePlay__sectionObjectForSharedListeningContainerID___block_invoke;
  v11[3] = &unk_2643C2668;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateSectionsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)_sectionedCollectionForQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v6 = objc_alloc_init(MEMORY[0x263F120D8]);
  BOOL v7 = [v4 tracklist];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke;
  v13[3] = &unk_2643C2640;
  id v8 = v6;
  id v14 = v8;
  id v15 = v4;
  id v16 = v5;
  v17 = self;
  id v9 = v5;
  id v10 = v4;
  [v7 enumerateSectionsUsingBlock:v13];

  id v11 = v8;
  return v11;
}

- (void)_reloadCacheDataWithOptions:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(MPRequestResponseController *)self->_requestController response];
    id v5 = [v4 modelResponse];
    id v6 = [v5 results];

    BOOL v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "totalItemCount"));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke;
    v24[3] = &unk_2643C25F0;
    id v25 = v7;
    id v8 = v7;
    [v6 enumerateItemIdentifiersUsingBlock:v24];
    id v9 = (NSDictionary *)[v8 copy];
    resultsIndexPathMap = self->_resultsIndexPathMap;
    self->_resultsIndexPathMap = v9;
  }
  id v11 = [(ICSharedListeningQueue *)self->_queue tracklist];
  id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "totalItemCount"));
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_2;
  v20 = &unk_2643C25C8;
  id v21 = v11;
  v22 = self;
  id v23 = v12;
  id v13 = v12;
  id v14 = v11;
  [v14 enumerateSectionsUsingBlock:&v17];
  id v15 = (NSArray *)objc_msgSend(v13, "copy", v17, v18, v19, v20);
  enumeratorContentItemIDs = self->_enumeratorContentItemIDs;
  self->_enumeratorContentItemIDs = v15;
}

- (id)_queueAsStateDictionary
{
  v24[5] = *MEMORY[0x263EF8340];
  if ([(ICSharedListeningQueue *)self->_queue explicitContentState] == 1)
  {
    v3 = @"Explicit";
  }
  else
  {
    uint64_t v4 = [(ICSharedListeningQueue *)self->_queue explicitContentState];
    v3 = @"Neutral";
    if (v4 == 2) {
      v3 = @"Restricted";
    }
  }
  queue = self->_queue;
  id v6 = v3;
  BOOL v7 = [(ICSharedListeningQueue *)queue tracklist];
  id v8 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke;
  id v19 = &unk_2643C25C8;
  v20 = self;
  id v21 = v8;
  id v22 = v7;
  id v9 = v7;
  id v10 = v8;
  [v9 enumerateSectionsUsingBlock:&v16];
  v23[0] = @"_autoPlayAvailable";
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ICSharedListeningQueue isAutoPlayAvailable](self->_queue, "isAutoPlayAvailable", v16, v17, v18, v19, v20));
  v24[0] = v11;
  v23[1] = @"_autoPlayEnabled";
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ICSharedListeningQueue isAutoPlayEnabled](self->_queue, "isAutoPlayEnabled"));
  v24[1] = v12;
  v23[2] = @"_hasActiveRadioStation";
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ICSharedListeningQueue hasActiveRadioStation](self->_queue, "hasActiveRadioStation"));
  v24[2] = v13;
  v24[3] = v6;
  v23[3] = @"_explicitContentState";
  v23[4] = @"tracklist";
  void v24[4] = v10;
  id v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

  return v14;
}

- (void)_purgePendingActionsWithLabel:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pendingActions = self->_pendingActions;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __75___MPCQueueControllerBehaviorMusicSharePlay__purgePendingActionsWithLabel___block_invoke;
  v26[3] = &unk_2643C2578;
  id v18 = v4;
  id v27 = v18;
  uint64_t v6 = [(NSMutableArray *)pendingActions indexesOfObjectsPassingTest:v26];
  BOOL v7 = [(NSMutableArray *)self->_pendingActions objectsAtIndexes:v6];
  uint64_t v17 = (void *)v6;
  [(NSMutableArray *)self->_pendingActions removeObjectsAtIndexes:v6];
  id v19 = self;
  v20 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v20 engineID];
          id v15 = [(_MPCQueueControllerBehaviorMusicSharePlay *)v19 sessionID];
          *(_DWORD *)buf = 138543874;
          v29 = v14;
          __int16 v30 = 2114;
          v31 = v15;
          __int16 v32 = 2114;
          v33 = v12;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _purgePendingActionsWithLabel: | calling action [purged] action=%{public}@", buf, 0x20u);
        }
        uint64_t v16 = [v12 block];
        v16[2](v16, 2);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v9);
  }
}

- (id)_mpcSharedListeningEventForICLiveLinkEvent:(id)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 participant];
  uint64_t v6 = [v5 identifier];
  BOOL v7 = [v4 participant];
  uint64_t v8 = [v7 externalIdentifier];
  uint64_t v9 = +[MPCSharedListeningEventParticipant participantWithSharedListeningIdentifier:v6 externalIdentifier:v8];

  uint64_t v10 = [(MPRequestResponseController *)self->_requestController response];
  id v11 = [v10 modelResponse];
  id v12 = [v11 results];

  switch([v4 type])
  {
    case 1:
      id v13 = [v4 sessionEvent];
      uint64_t v14 = [v13 kind];
      if ((unint64_t)(v14 - 1) >= 5) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t v16 = [[MPCSharedListeningSessionEvent alloc] initWithKind:v15];
      uint64_t v17 = +[MPCSharedListeningEvent eventWithSessionEvent:v16 participant:v9];
      goto LABEL_15;
    case 2:
      id v13 = [v4 playbackEvent];
      uint64_t v18 = [v13 kind];
      if ((unint64_t)(v18 - 1) <= 3
        && (id v19 = [[MPCSharedListeningPlaybackEvent alloc] initWithKind:v18]) != 0)
      {
        uint64_t v16 = (MPCSharedListeningSessionEvent *)v19;
        uint64_t v17 = +[MPCSharedListeningEvent eventWithPlaybackEvent:v19 participant:v9];
LABEL_15:
        v40 = (void *)v17;
      }
      else
      {
        v40 = 0;
      }

      goto LABEL_58;
    case 3:
      v20 = [v4 queueEvent];
      switch([v20 kind])
      {
        case 1:
          id v21 = [v20 contentAdded];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v112 = __Block_byref_object_copy__18213;
          v113 = __Block_byref_object_dispose__18214;
          id v114 = 0;
          long long v22 = [v21 containerIdentifier];
          long long v23 = [v21 itemIdentifiers];
          long long v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v105[0] = MEMORY[0x263EF8330];
          v105[1] = 3221225472;
          v105[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke;
          v105[3] = &unk_2643C2500;
          id v25 = v22;
          id v106 = v25;
          v110 = buf;
          id v107 = v12;
          v108 = self;
          id v26 = v24;
          id v109 = v26;
          [v107 enumerateSectionsUsingBlock:v105];
          id v27 = [MPCSharedListeningQueueEventContentAdded alloc];
          v28 = [(MPCSharedListeningQueueEventContentAdded *)v27 initWithItems:v26 container:*(void *)(*(void *)&buf[8] + 40)];
          v29 = +[MPCSharedListeningQueueEvent queueEventWithAddedContent:v28];

          _Block_object_dispose(buf, 8);
          goto LABEL_54;
        case 2:
          v47 = [v20 contentRemoved];
          resultsIndexPathMap = self->_resultsIndexPathMap;
          v49 = [v47 itemIdentifier];
          v50 = [(NSDictionary *)resultsIndexPathMap objectForKeyedSubscript:v49];

          if (v50)
          {
            v51 = [v12 itemAtIndexPath:v50];
            v52 = (void *)[v51 copyWithPropertySet:self->_requestedPropertySetForEvents];
          }
          else
          {
            v52 = 0;
          }
          v82 = [[MPCSharedListeningQueueEventContentRemoved alloc] initWithItem:v52];
          v29 = +[MPCSharedListeningQueueEvent queueEventWithRemovedContent:v82];

          goto LABEL_53;
        case 3:
          v47 = [v20 contentReordered];
          v53 = self->_resultsIndexPathMap;
          v54 = [v47 itemIdentifier];
          v55 = [(NSDictionary *)v53 objectForKeyedSubscript:v54];

          if (!v55) {
            goto LABEL_39;
          }
          v56 = [v12 itemAtIndexPath:v55];
          v57 = (void *)[v56 copyWithPropertySet:self->_requestedPropertySetForEvents];

          if (!v57) {
            goto LABEL_39;
          }
          v58 = [[MPCSharedListeningQueueEventContentReordered alloc] initWithItem:v57];
          uint64_t v59 = +[MPCSharedListeningQueueEvent queueEventWithReorderedContent:v58];
          goto LABEL_38;
        case 4:
          v47 = [v20 playbackModeChanged];
          uint64_t v60 = [v47 kind];
          switch(v60)
          {
            case 3:
              v83 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              v62 = [v47 autoPlayEnabled];
              uint64_t v65 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)v83 initWithUpdatedAutoPlayEnabled:v62[2]()];
              break;
            case 2:
              v84 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              v62 = [v47 repeatType];
              uint64_t v85 = v62[2]();
              if (v85 == 3) {
                uint64_t v86 = 2;
              }
              else {
                uint64_t v86 = v85 == 2;
              }
              uint64_t v65 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)v84 initWithUpdatedRepeatType:v86];
              break;
            case 1:
              v61 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              v62 = [v47 shuffleType];
              uint64_t v63 = v62[2]();
              if (v63 == 3) {
                uint64_t v64 = 2;
              }
              else {
                uint64_t v64 = v63 == 2;
              }
              uint64_t v65 = [(MPCSharedListeningQueueEventPlaybackModeChanged *)v61 initWithUpdatedShuffleType:v64];
              break;
            default:
LABEL_61:
              v29 = 0;
              goto LABEL_53;
          }
          v55 = (MPCSharedListeningQueueEventContentUpdatedMessage *)v65;

          if (!v55) {
            goto LABEL_61;
          }
          uint64_t v81 = +[MPCSharedListeningQueueEvent queueEventWithPlaybackModeChanged:v55];
LABEL_51:
          v29 = (void *)v81;
LABEL_52:

LABEL_53:
LABEL_54:
          if (v29)
          {
            v40 = +[MPCSharedListeningEvent eventWithQueueEvent:v29 participant:v9];
          }
          else
          {
LABEL_56:
            v40 = 0;
          }

LABEL_58:
          return v40;
        case 5:
          v47 = [v20 contentReplaced];
          v66 = self->_resultsIndexPathMap;
          v67 = [v47 startItemIdentifier];
          v55 = [(NSDictionary *)v66 objectForKeyedSubscript:v67];

          if (v55
            && ([v12 itemAtIndexPath:v55],
                v68 = objc_claimAutoreleasedReturnValue(),
                v57 = (void *)[v68 copyWithPropertySet:self->_requestedPropertySetForEvents],
                v68,
                v57))
          {
            v58 = [[MPCSharedListeningQueueEventContentReplaced alloc] initWithStartItem:v57];
            uint64_t v59 = +[MPCSharedListeningQueueEvent queueEventWithReplacedContent:v58];
LABEL_38:
            v29 = (void *)v59;
          }
          else
          {
LABEL_39:
            v29 = 0;
          }
          goto LABEL_52;
        case 6:
          v69 = [v20 contentPlayedNow];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v112 = __Block_byref_object_copy__18213;
          v113 = __Block_byref_object_dispose__18214;
          id v114 = 0;
          v70 = [v69 containerIdentifier];
          uint64_t v99 = 0;
          v100 = &v99;
          uint64_t v101 = 0x3032000000;
          v102 = __Block_byref_object_copy__18213;
          v103 = __Block_byref_object_dispose__18214;
          id v104 = 0;
          v71 = [v69 itemIdentifiers];
          v72 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v71, "count"));
          uint64_t v88 = MEMORY[0x263EF8330];
          uint64_t v89 = 3221225472;
          v90 = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_3;
          v91 = &unk_2643C2550;
          id v73 = v70;
          id v92 = v73;
          v97 = buf;
          id v93 = v12;
          v94 = self;
          id v74 = v69;
          id v95 = v74;
          v98 = &v99;
          id v75 = v72;
          id v96 = v75;
          [v93 enumerateSectionsUsingBlock:&v88];
          v76 = [MPCSharedListeningQueueEventContentPlayedNow alloc];
          v77 = -[MPCSharedListeningQueueEventContentPlayedNow initWithItems:container:startItem:](v76, "initWithItems:container:startItem:", v75, *(void *)(*(void *)&buf[8] + 40), v100[5], v88, v89, v90, v91);
          v29 = +[MPCSharedListeningQueueEvent queueEventWithPlayedNowContent:v77];

          _Block_object_dispose(&v99, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_54;
        case 7:
          v47 = [v20 contentUpdatedMessage];
          v78 = [MPCSharedListeningQueueEventContentUpdatedMessage alloc];
          v79 = [v47 localizedTitle];
          v80 = [v47 localizedMessage];
          v55 = [(MPCSharedListeningQueueEventContentUpdatedMessage *)v78 initWithLocalizedTitle:v79 localizedMessage:v80];

          uint64_t v81 = +[MPCSharedListeningQueueEvent queueEventWithContentUpdatedMessage:v55];
          goto LABEL_51;
        default:
          goto LABEL_56;
      }
    case 4:
      __int16 v30 = [v4 reactionEvent];
      v31 = self->_resultsIndexPathMap;
      __int16 v32 = [v30 itemIdentifier];
      v33 = [(NSDictionary *)v31 objectForKeyedSubscript:v32];

      if (v33
        && ([v12 itemAtIndexPath:v33],
            v34 = objc_claimAutoreleasedReturnValue(),
            uint64_t v35 = (void *)[v34 copyWithPropertySet:self->_requestedPropertySetForEvents],
            v34,
            v35))
      {
        v36 = [MPCSharedListeningReactionEvent alloc];
        v37 = [v30 reaction];
        v38 = [v30 reactionIdentifier];
        v39 = [(MPCSharedListeningReactionEvent *)v36 initWithReaction:v37 reactionIdentifier:v38 item:v35];

        v40 = +[MPCSharedListeningEvent eventWithReactionEvent:v39 participant:v9];
      }
      else
      {
        uint64_t v35 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
        v43 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = [v35 engineID];
          v45 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
          v46 = [v30 itemIdentifier];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v45;
          *(_WORD *)&buf[22] = 2114;
          v112 = v46;
          _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _mpcSharedListeningEventForICLiveLinkEvent: | dropping event [unknown item] event=Reaction itemIdentifier=%{public}@", buf, 0x20u);
        }
        v40 = 0;
      }

      goto LABEL_58;
    case 5:
      id v13 = [v4 customEvent];
      v41 = [MPCSharedListeningCustomEvent alloc];
      v42 = [v13 localizedMessage];
      uint64_t v16 = [(MPCSharedListeningCustomEvent *)v41 initWithLocalizedMessage:v42];

      uint64_t v17 = +[MPCSharedListeningEvent eventWithCustomEvent:v16 participant:v9];
      goto LABEL_15;
    default:
      v40 = 0;
      goto LABEL_58;
  }
}

- (id)_itemObjectForSharedListeningItemID:(id)a3
{
  requestController = self->_requestController;
  id v5 = a3;
  uint64_t v6 = [(MPRequestResponseController *)requestController response];
  BOOL v7 = [v6 modelResponse];
  uint64_t v8 = [v7 results];

  uint64_t v9 = [(NSDictionary *)self->_resultsIndexPathMap objectForKeyedSubscript:v5];

  if (v9)
  {
    uint64_t v10 = [v8 itemAtIndexPath:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_initializeWithQueue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  BOOL v7 = [v6 beginEditWithReason:@"BehaviorMusicSharePlay-initialLoad"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66___MPCQueueControllerBehaviorMusicSharePlay__initializeWithQueue___block_invoke;
  v11[3] = &unk_2643C24B0;
  id v12 = v6;
  id v13 = self;
  id v15 = v5;
  SEL v16 = a2;
  id v14 = v7;
  id v8 = v5;
  id v9 = v7;
  id v10 = v6;
  [v8 getExpectedCurrentItemWithCompletion:v11];
}

- (void)_enqueuePendingActionWithLabel:(id)a3 itemIdentifier:(id)a4 block:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [(NSDictionary *)self->_resultsIndexPathMap objectForKeyedSubscript:v9];
  if (v11)
  {
    id v12 = [(MPRequestResponseController *)self->_requestController response];
    id v13 = [v12 modelResponse];
    id v14 = [v13 results];

    id v15 = [(_MPCQCBMSPPendingAction *)v14 identifiersForItemAtIndexPath:v11];
    if (([v15 isPlaceholder] & 1) == 0)
    {
      v10[2](v10, 0);
      goto LABEL_8;
    }
  }
  id v14 = objc_alloc_init(_MPCQCBMSPPendingAction);
  [(_MPCQCBMSPPendingAction *)v14 setLabel:v8];
  [(_MPCQCBMSPPendingAction *)v14 setItemIdentifier:v9];
  SEL v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
  [(_MPCQCBMSPPendingAction *)v14 setExpirationDate:v16];

  [(_MPCQCBMSPPendingAction *)v14 setBlock:v10];
  [(NSMutableArray *)self->_pendingActions addObject:v14];
  id v15 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v15 engineID];
    id v19 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
    int v20 = 138543874;
    id v21 = v18;
    __int16 v22 = 2114;
    long long v23 = v19;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _enqueuePendingActionWithLabel:itemIdentifier:block: | enqueuing [] action=%{public}@", (uint8_t *)&v20, 0x20u);
  }
LABEL_8:
}

- (void)_emitEventsForPlaybackBehaviorChange
{
  v14[2] = *MEMORY[0x263EF8340];
  if ([(_MPCQueueControllerBehaviorMusicSharePlay *)self canUserEnableAutoPlayWithReason:0])
  {
    if ([(_MPCQueueControllerBehaviorMusicSharePlay *)self autoPlayEnabled]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 3;
  }
  id v4 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v5 = [v4 eventStream];
  v13[0] = @"session-id";
  uint64_t v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  BOOL v7 = v6;
  if (!v6)
  {
    BOOL v7 = [MEMORY[0x263EFF9D0] null];
  }
  v13[1] = @"playback-behavior-metadata";
  v14[0] = v7;
  id v11 = @"autoplay-mode";
  id v8 = [NSNumber numberWithInteger:v3];
  id v12 = v8;
  id v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v5 emitEventType:@"playback-behavior-changed" payload:v10];

  if (!v6) {
}
  }

- (void)_emitEventsForParticipants:(id)a3 localUserIdentity:(id)a4
{
  v23[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __90___MPCQueueControllerBehaviorMusicSharePlay__emitEventsForParticipants_localUserIdentity___block_invoke;
  int v20 = &unk_2643C2478;
  id v7 = v6;
  id v21 = v7;
  id v8 = objc_msgSend(a3, "msv_compactMap:", &v17);
  id v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v10 = [v9 eventStream];
  v22[0] = @"session-id";
  id v11 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  id v12 = v11;
  if (!v11)
  {
    id v12 = [MEMORY[0x263EFF9D0] null];
  }
  v23[0] = v12;
  v22[1] = @"shared-session-id";
  id v13 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  id v14 = v13;
  if (!v13)
  {
    id v14 = [MEMORY[0x263EFF9D0] null];
  }
  v22[2] = @"participants";
  id v15 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    id v15 = v8;
  }
  v23[1] = v14;
  v23[2] = v15;
  SEL v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v10 emitEventType:@"shared-session-participants-changed" payload:v16];

  if (!v13) {
  if (!v11)
  }
}

- (void)_emitEventsForAddedSharedListeningContainer:(id)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v14 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v15 = [v14 eventStream];
  v18[0] = @"queue-section-id";
  id v5 = [v4 identifier];
  v19[0] = v5;
  v18[1] = @"account-id";
  id v6 = +[MPCPlaybackAccountManager sharedManager];
  id v7 = [v6 activeAccount];
  id v8 = [v7 hashedDSID];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF9D0] null];
  }
  v19[1] = v9;
  v19[2] = &unk_26CC18FF0;
  v18[2] = @"private-listening-source";
  v18[3] = @"queue-reporting-metadata";
  v16[0] = @"feature-name";
  id v10 = [v4 featureName];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x263EFF9D0] null];
  }
  v17[0] = v11;
  v17[1] = @"MusicSharePlayBehavior";
  v16[1] = @"playback-context-class-name";
  v16[2] = @"private-listening-enabled";
  v17[2] = MEMORY[0x263EFFA88];
  id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[3] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  [v15 emitEventType:@"queue-add" payload:v13];

  if (!v10) {
  if (!v8)
  }
}

- (void)_dequeuePendingActions
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v45 = [MEMORY[0x263EFF910] date];
  v41 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = self->_pendingActions;
  uint64_t v44 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  uint64_t v3 = 0;
  if (v44)
  {
    uint64_t v43 = *(void *)v47;
    v40 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(NSObject **)(*((void *)&v46 + 1) + 8 * i);
        id v6 = [v5 expirationDate];
        id v7 = [v45 laterDate:v6];

        if (v7 == v45)
        {
          id v25 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = [v41 engineID];
            id v27 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
            *(_DWORD *)buf = 138543874;
            v51 = v26;
            __int16 v52 = 2114;
            v53 = v27;
            __int16 v54 = 2114;
            v55 = v5;
            _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | calling action [expired] action=%{public}@", buf, 0x20u);
          }
          ++v3;
          v28 = [v5 block];
          v28[2](v28, 1);
        }
        else
        {
          queue = self->_queue;
          id v9 = [v5 itemIdentifier];
          id v10 = [(ICSharedListeningQueue *)queue itemForIdentifier:v9];

          if (!v10)
          {
            v36 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [v41 engineID];
              v38 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
              v39 = [v5 itemIdentifier];
              *(_DWORD *)buf = 138543874;
              v51 = v37;
              __int16 v52 = 2114;
              v53 = v38;
              __int16 v54 = 2114;
              v55 = v39;
              _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [no such item] missingItemID=%{public}@", buf, 0x20u);
            }
            goto LABEL_29;
          }
          id v11 = [(MPRequestResponseController *)self->_requestController response];
          id v12 = [v11 modelResponse];
          id v13 = [v12 results];

          resultsIndexPathMap = self->_resultsIndexPathMap;
          id v15 = [v5 itemIdentifier];
          SEL v16 = [(NSDictionary *)resultsIndexPathMap objectForKeyedSubscript:v15];

          if (v16)
          {
            uint64_t v17 = v3;
            uint64_t v18 = [v13 identifiersForItemAtIndexPath:v16];
            int v19 = [v18 isPlaceholder];
            int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v21)
              {
                __int16 v22 = [v41 engineID];
                long long v23 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
                *(_DWORD *)buf = 138543874;
                v51 = v22;
                __int16 v52 = 2114;
                v53 = v23;
                __int16 v54 = 2114;
                v55 = v18;
                _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [placeholder item] idSet=%{public}@", buf, 0x20u);
              }
              int v24 = 0;
              uint64_t v3 = v17;
            }
            else
            {
              if (v21)
              {
                v33 = [v41 engineID];
                v34 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
                *(_DWORD *)buf = 138543874;
                v51 = v33;
                __int16 v52 = 2114;
                v53 = v34;
                __int16 v54 = 2114;
                v55 = v5;
                _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | calling action [satisfied] action=%{public}@", buf, 0x20u);

                self = v40;
              }

              uint64_t v35 = [v5 block];
              v35[2](v35, 0);

              uint64_t v3 = v17 + 1;
              int v24 = 1;
            }
          }
          else
          {
            uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v29 = [v41 engineID];
              [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
              v31 = uint64_t v30 = v3;
              __int16 v32 = [v5 itemIdentifier];
              *(_DWORD *)buf = 138543874;
              v51 = v29;
              __int16 v52 = 2114;
              v53 = v31;
              __int16 v54 = 2114;
              v55 = v32;
              _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [waiting for item metadata] itemID=%{public}@", buf, 0x20u);

              uint64_t v3 = v30;
            }
            int v24 = 0;
          }

          if (!v24) {
            goto LABEL_29;
          }
        }
      }
      uint64_t v44 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v44) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  -[NSMutableArray removeObjectsInRange:](self->_pendingActions, "removeObjectsInRange:", 0, v3);
}

- (id)_componentsForSharedListeningItemID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  SEL v16 = __Block_byref_object_copy__18213;
  uint64_t v17 = __Block_byref_object_dispose__18214;
  id v18 = 0;
  id v5 = [(ICSharedListeningQueue *)self->_queue tracklist];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81___MPCQueueControllerBehaviorMusicSharePlay__componentsForSharedListeningItemID___block_invoke;
  v9[3] = &unk_2643C2440;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v13;
  [v5 enumerateItemsUsingBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)_componentsForContentItemID:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusicSharePlay.m", 1209, @"Invalid parameter not satisfying: %@", @"contentItemID.length > 0" object file lineNumber description];
  }
  id v6 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(v5);
  queue = self->_queue;
  id v8 = [v6 itemID];
  id v9 = [(ICSharedListeningQueue *)queue itemForIdentifier:v8];

  id v10 = objc_msgSend(v6, "copyWithBehaviorFlags:", objc_msgSend(v9, "isAutoPlayItem"));

  return v10;
}

- (void)liveLink:(id)a3 didReceiveEvent:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  msv_dispatch_on_main_queue();
}

- (void)liveLink:(id)a3 didReceiveDirectCurrentItemChanged:(id)a4 fromParticipant:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke;
  v12[3] = &unk_2643C4718;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  SEL v15 = a2;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

- (void)liveLink:(id)a3 didUpdateQueue:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateQueue___block_invoke;
  v7[3] = &unk_2643C5EE8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (void)liveLink:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateParticipants___block_invoke;
  block[3] = &unk_2643C6660;
  block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5
{
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didEncounterError_willRetry___block_invoke;
  block[3] = &unk_2643C23A8;
  BOOL v11 = a5;
  block[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)didStopLiveLink:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___MPCQueueControllerBehaviorMusicSharePlay_didStopLiveLink___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)liveLinkDidReconnect:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___MPCQueueControllerBehaviorMusicSharePlay_liveLinkDidReconnect___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  id v5 = objc_msgSend(a4, "contentItemID", a3);
  id v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v5];
  id v7 = [v6 itemID];

  return v7;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82___MPCQueueControllerBehaviorMusicSharePlay_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_2643C55A8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (int64_t)displayItemCount
{
  v2 = [(ICSharedListeningQueue *)self->_queue tracklist];
  int64_t v3 = [v2 totalItemCount];

  return v3;
}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  id v4 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  id v10 = v4;
  id v6 = [v4 itemID];
  id v7 = [(ICSharedListeningQueue *)queue itemForIdentifier:v6];

  if (v7)
  {
    id v8 = self->_queue;
    id v9 = [v10 itemID];
    [(ICSharedListeningQueue *)v8 removeAllItemIdentifiersAfterItemIdentifier:v9];
  }
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  id v14 = v7;
  id v9 = [v7 itemID];
  id v10 = [(ICSharedListeningQueue *)queue itemForIdentifier:v9];

  if (v10)
  {
    BOOL v11 = self->_queue;
    id v12 = [v14 itemID];
    [(ICSharedListeningQueue *)v11 removeItemIdentifier:v12];

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 8, @"Received a remove command but the item is not available in the queue.");
    v6[2](v6, v13);

    id v6 = (void (**)(id, void))v13;
  }
}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return 1;
}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
  id v21 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  BOOL v11 = [v9 itemID];
  id v12 = [(ICSharedListeningQueue *)queue itemForIdentifier:v11];

  if (v12)
  {
    uint64_t v13 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v21];
    id v14 = self->_queue;
    SEL v15 = [v13 itemID];
    SEL v16 = [(ICSharedListeningQueue *)v14 itemForIdentifier:v15];

    if (v16)
    {
      uint64_t v17 = self->_queue;
      id v18 = [v9 itemID];
      int v19 = [v13 itemID];
      [(ICSharedListeningQueue *)v17 moveItemIdentifier:v18 afterItemIdentifier:v19];

      v8[2](v8, 0);
    }
    else
    {
      int v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 8, @"Received a move command but the target is not available in the queue.");
      ((void (**)(id, void *))v8)[2](v8, v20);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 8, @"Received a move command but the source is not available in the queue.");
    ((void (**)(id, void *))v8)[2](v8, v13);
  }
}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
  id v21 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  BOOL v11 = [v9 itemID];
  id v12 = [(ICSharedListeningQueue *)queue itemForIdentifier:v11];

  if (v12)
  {
    uint64_t v13 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v21];
    id v14 = self->_queue;
    SEL v15 = [v13 itemID];
    SEL v16 = [(ICSharedListeningQueue *)v14 itemForIdentifier:v15];

    if (v16)
    {
      uint64_t v17 = self->_queue;
      id v18 = [v9 itemID];
      int v19 = [v13 itemID];
      [(ICSharedListeningQueue *)v17 moveItemIdentifier:v18 beforeItemIdentifier:v19];

      v8[2](v8, 0);
    }
    else
    {
      int v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 8, @"Received a move command but the target is not available in the queue.");
      ((void (**)(id, void *))v8)[2](v8, v20);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 8, @"Received a move command but the source is not available in the queue.");
    ((void (**)(id, void *))v8)[2](v8, v13);
  }
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 playbackQueue];
  BOOL v11 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self externalSyncHost];
  id v12 = [v11 beginExternalSyncEditWithReason:@"PerformInsertCommand"];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke;
  void v17[3] = &unk_2643C2378;
  id v18 = v10;
  id v19 = v12;
  id v20 = v8;
  id v21 = self;
  id v22 = v9;
  SEL v23 = a2;
  id v13 = v8;
  id v14 = v12;
  id v15 = v9;
  id v16 = v10;
  [v16 getMusicPlaybackContextWithOptions:0 completion:v17];
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  return 0;
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  id v8 = a4;
  BOOL v9 = 1;
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_16;
    case 1:
      if (!a5) {
        goto LABEL_15;
      }
      id v10 = @"cannot insert at Tail";
      goto LABEL_14;
    case 2:
      if (self->_activeItemFlags)
      {
        if (a5)
        {
          id v10 = @"active item from auto play";
          goto LABEL_14;
        }
      }
      else
      {
        if (![(ICSharedListeningQueue *)self->_queue hasActiveRadioStation]) {
          goto LABEL_16;
        }
        if (a5)
        {
          id v10 = @"queue contains radio station";
LABEL_14:
          BOOL v9 = 0;
          *a5 = v10;
          goto LABEL_16;
        }
      }
LABEL_15:
      BOOL v9 = 0;
LABEL_16:

      return v9;
    case 4:
      if (!a5) {
        goto LABEL_15;
      }
      id v10 = @"cannot insert at Start";
      goto LABEL_14;
    default:
      if (!a5) {
        goto LABEL_15;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"unknown insertion position: %d", a3);
      id v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
  }
}

- (void)setAllowsQueueModifications:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v4 engineID];
    id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
    int v8 = 138543618;
    BOOL v9 = v6;
    __int16 v10 = 2114;
    BOOL v11 = v7;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] setAllowsQueueModifications: | ignoring unsupported option [cannot disable queue modifications]", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)allowsQueueModifications
{
  return 1;
}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 replaceIntent] == 3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    if (+[_MPCQueueControllerBehaviorMusic canLoadQueue:v6 reason:0]&& self->_queue)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke;
      v9[3] = &unk_2643C3E98;
      void v9[4] = self;
      id v10 = v7;
      [v6 getMusicPlaybackContextWithOptions:0 completion:v9];

      goto LABEL_10;
    }
LABEL_9:
    (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
    goto LABEL_10;
  }
  int v8 = [v6 identifier];
  if (![@"InProcess-com.apple.music.playbackqueue.sharedlistening" isEqualToString:v8])
  {

    goto LABEL_6;
  }
  (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);

LABEL_10:
}

- (void)setRequestedPropertySetForEvents:(id)a3
{
  id v4 = (MPPropertySet *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F12180] emptyPropertySet];
  }
  if (self->_requestedPropertySetForEvents != v4)
  {
    id v7 = v4;
    id v5 = (MPPropertySet *)[(MPPropertySet *)v4 copy];
    requestedPropertySetForEvents = self->_requestedPropertySetForEvents;
    self->_requestedPropertySetForEvents = v5;

    id v4 = v7;
  }
}

- (int64_t)queueExplicitContentState
{
  int64_t result = [(ICSharedListeningQueue *)self->_queue explicitContentState];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)updatePlaybackCoordinator:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = (AVPlayerPlaybackCoordinator *)a3;
  playbackCoordinator = self->_playbackCoordinator;
  if (playbackCoordinator != v5)
  {
    id v7 = [(AVPlayerPlaybackCoordinator *)playbackCoordinator delegate];

    if (v7 == self) {
      [(AVPlayerPlaybackCoordinator *)self->_playbackCoordinator setDelegate:0];
    }
    objc_storeStrong((id *)&self->_playbackCoordinator, a3);
    [(AVPlayerPlaybackCoordinator *)self->_playbackCoordinator setDelegate:self];
    if (self->_playbackCoordinator)
    {
      int v8 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self queue];

      if (v8)
      {
        BOOL v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
        id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v11 = [v9 engineID];
          uint64_t v12 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
          id v13 = self->_playbackCoordinator;
          int v14 = 138543874;
          id v15 = v11;
          __int16 v16 = 2114;
          uint64_t v17 = v12;
          __int16 v18 = 2114;
          id v19 = v13;
          _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] updatePlaybackCoordinator: | begin synchronized playback with AVPlaybackCoordinator [] playbackCoordinator=%{public}@", (uint8_t *)&v14, 0x20u);
        }
        [(ICLiveLink *)self->_liveLink beginSynchronizedPlaybackWithAVPlaybackCoordinator:self->_playbackCoordinator];
      }
    }
  }
}

- (void)endSynchronizedPlayback
{
  id v5 = self->_playbackCoordinator;
  int64_t v3 = [(AVPlayerPlaybackCoordinator *)v5 delegate];

  if (v3 == self) {
    [(AVPlayerPlaybackCoordinator *)v5 setDelegate:0];
  }
  playbackCoordinator = self->_playbackCoordinator;
  self->_playbackCoordinator = 0;

  [(ICLiveLink *)self->_liveLink endSynchronizedPlayback];
}

- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3
{
  return 0;
}

- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4
{
  id v5 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  if ([v5 repeatIteration] != a4)
  {
    uint64_t v6 = [v5 copyWithRepeatIteration:a4];

    id v5 = (void *)v6;
  }
  id v7 = [v5 contentItemID];

  return v7;
}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  int64_t v3 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  if ([v3 repeatIteration])
  {
    uint64_t v4 = [v3 copyWithRepeatIteration:0];

    int64_t v3 = (void *)v4;
  }
  id v5 = [v3 contentItemID];

  return v5;
}

- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4
{
  if (a3)
  {
    id v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self musicSharePlayBehaviorDelegate];
    [v5 behavior:self didEndSharePlaySessionWithReason:2];
  }
}

- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4
{
  __int16 v16 = (void (**)(id, void *, void))a4;
  requestController = self->_requestController;
  id v7 = a3;
  int v8 = [(MPRequestResponseController *)requestController response];
  BOOL v9 = [v8 modelResponse];
  id v10 = [v9 results];

  BOOL v11 = [v10 indexPathForItemWithIdentifiersIntersectingSet:v7];

  if (v11)
  {
    uint64_t v12 = [v10 identifiersForItemAtIndexPath:v11];
    id v13 = [v12 vendorID];
    int v14 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForSharedListeningItemID:v13];

    id v15 = [v14 contentItemID];
    v16[2](v16, v15, 0);
  }
  else
  {
    v16[2](v16, 0, 0);
  }
}

- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusicSharePlay.m" lineNumber:637 description:@"Cannot get a shared queue tracklist from an existing shared queue."];
}

- (BOOL)isAutoPlayContentItemID:(id)a3
{
  int64_t v3 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  BOOL v4 = [v3 behaviorFlags] & 1;

  return v4;
}

- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95___MPCQueueControllerBehaviorMusicSharePlay_setAutoPlayEnabled_targetContentItemID_completion___block_invoke;
  v12[3] = &unk_2643C22D8;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v6;
  id v11 = v9;
  id v13 = v11;
  [(ICSharedListeningQueue *)queue setAutoPlayEnabled:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3
{
  BOOL result = [(ICSharedListeningQueue *)self->_queue isAutoPlayAvailable];
  if (a3)
  {
    if (!result) {
      *a3 = @"AutoPlay unavailable in this SharePlay session";
    }
  }
  return result;
}

- (BOOL)autoPlayEnabled
{
  return [(ICSharedListeningQueue *)self->_queue isAutoPlayEnabled];
}

- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 3, @"Shuffle is not supported in SharePlay.");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a5;
  objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 3, @"Shuffle is not supported in SharePlay.");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3
{
  if (a3) {
    *a3 = @"in shared listening mode";
  }
  return 0;
}

- (void)setRepeatType:(int64_t)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 3, @"Repeat is not supported in SharePlay.");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3
{
  if (a3) {
    *a3 = @"in shared listening mode";
  }
  return 0;
}

- (void)didJumpToTargetContentItemID:(id)a3
{
  id v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  liveLink = self->_liveLink;
  id v5 = [v6 itemID];
  [(ICLiveLink *)liveLink broadcastDirectCurrentItemChangedToItemIdentifier:v5];
}

- (void)disconnectFromExternalSyncHost:(id)a3
{
}

- (void)connectToExternalSyncHost:(id)a3
{
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  self->_queueRanDry = 1;
  [(ICLiveLink *)self->_liveLink stop];
}

- (id)_itemForContentItemID:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  BOOL v4 = (MPCModelGenericAVItem *)a3;
  uint64_t v43 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  id v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v4];
  if ([v5 type])
  {
    id v6 = (MPCModelGenericAVItem *)objc_alloc_init(MEMORY[0x263F12150]);
    id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    id v8 = [v7 localizedStringForKey:@"LOADING_AUDIO_LABEL" value:&stru_26CBCA930 table:@"MediaPlayer"];
    [(MPCModelGenericAVItem *)v6 setMainTitle:v8];

    id v9 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self queue];
    id v10 = [v5 itemID];
    id v11 = [v9 itemForIdentifier:v10];
    uint64_t v12 = [v11 mediaIdentifier];
    -[MPCModelGenericAVItem setStoreItemInt64ID:](v6, "setStoreItemInt64ID:", [v12 longLongValue]);

    id v13 = [v5 itemID];
    [(MPCModelGenericAVItem *)v6 setQueueIdentifier:v13];

    id v14 = [v5 contentItemID];
    BOOL v15 = [v5 sectionID];
    __int16 v16 = [v5 itemID];
    [(MPCModelGenericAVItem *)v6 setContentItemID:v14 queueSectionID:v15 queueItemID:v16];
    goto LABEL_5;
  }
  uint64_t v17 = [(MPRequestResponseController *)self->_requestController response];
  __int16 v18 = [v17 modelResponse];
  id v14 = [v18 results];

  resultsIndexPathMap = self->_resultsIndexPathMap;
  uint64_t v20 = [v5 itemID];
  BOOL v15 = [(NSDictionary *)resultsIndexPathMap objectForKeyedSubscript:v20];

  if (v15)
  {
    __int16 v16 = [v14 itemAtIndexPath:v15];
    v41 = -[NSObject sectionAtIndex:](v14, "sectionAtIndex:", [v15 section]);
    id v21 = [(MPRequestResponseController *)self->_requestController request];
    id v22 = [v21 modelRequest];
    SEL v23 = [v22 playbackRequestEnvironment];

    int v24 = [MPCModelGenericAVItem alloc];
    id v25 = [(MPRequestResponseController *)self->_requestController request];
    uint64_t v26 = [v25 modelRequest];
    [v26 itemProperties];
    id v27 = v42 = v4;
    id v6 = [(MPCModelGenericAVItem *)v24 initWithGenericObject:v16 itemProperties:v27 playbackRequestEnvironment:v23 identityPropertySet:self->_identityPropertySet];

    v28 = [v5 itemID];
    [(MPCModelGenericAVItem *)v6 setQueueIdentifier:v28];

    v29 = [v5 contentItemID];
    uint64_t v30 = [v5 sectionID];
    v31 = [v5 itemID];
    [(MPCModelGenericAVItem *)v6 setContentItemID:v29 queueSectionID:v30 queueItemID:v31];

    BOOL v4 = v42;
    __int16 v32 = [v23 userIdentity];
    v33 = +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:v32];
    [(MPCModelGenericAVItem *)v6 setAssetCacheProvider:v33];

    v34 = [MEMORY[0x263F11F88] playEventWithModelObject:v41 featureName:@"MusicSharePlayBehavior"];
    [(MPCModelGenericAVItem *)v6 setModelPlayEvent:v34];

    -[MPCModelGenericAVItem setAutoPlayItem:](v6, "setAutoPlayItem:", [v5 behaviorFlags] & 1);
    [(NSHashTable *)self->_activeModelGenericAVItems addObject:v6];

LABEL_5:
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v43 engineID];
      v36 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
      *(_DWORD *)buf = 138543874;
      v45 = v35;
      __int16 v46 = 2114;
      long long v47 = v36;
      __int16 v48 = 2114;
      long long v49 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning item [] item=%{public}@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [v43 engineID];
    v39 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
    *(_DWORD *)buf = 138543874;
    v45 = v38;
    __int16 v46 = 2114;
    long long v47 = v39;
    __int16 v48 = 2114;
    long long v49 = v4;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID: | returning nil [unknown contentItemID] contentItemID=%{public}@", buf, 0x20u);
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  BOOL v3 = a3;
  v12[1] = *MEMORY[0x263EF8340];
  id v11 = @"_obj";
  id v5 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v12[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  if (v3)
  {
    id v7 = (void *)[v6 mutableCopy];
    id v8 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _queueAsStateDictionary];
    [v7 setObject:v8 forKeyedSubscript:@"queue"];

    uint64_t v9 = [v7 copy];
    id v6 = (void *)v9;
  }

  return v6;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (self->_liveLinkStopped)
  {
    id v8 = +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:@"LiveLinkStopped"];
    uint64_t v9 = [v8 contentItemID];
    v23[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v11 = [v10 objectEnumerator];
LABEL_3:

LABEL_4:
    goto LABEL_5;
  }
  id v13 = (void *)[(NSArray *)self->_enumeratorContentItemIDs copy];
  id v8 = v13;
  if (v7)
  {
    uint64_t v14 = [v13 indexOfObject:v7];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v15 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v7];
      __int16 v16 = [v15 itemSpecificContentItemID];

      if (!v16
        || ([v15 itemSpecificContentItemID],
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            uint64_t v18 = [v8 indexOfObject:v17],
            v17,
            v18 == 0x7FFFFFFFFFFFFFFFLL)
        || ((v5 & 1) != 0 ? (uint64_t v14 = v18 + 1) : (uint64_t v14 = v18 - 1), v14 == 0x7FFFFFFFFFFFFFFFLL))
      {
        id v11 = [MEMORY[0x263EFFA68] objectEnumerator];

        goto LABEL_5;
      }
    }
  }
  else
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!self->_queue)
  {
    uint64_t v9 = +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:@"WaitingForFirstQueue"];
    id v10 = [v9 contentItemID];
    id v22 = v10;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    id v11 = [v20 objectEnumerator];

    goto LABEL_3;
  }
  if (v5)
  {
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, v14);
      uint64_t v21 = [v9 reverseObjectEnumerator];
      goto LABEL_28;
    }
    uint64_t v19 = [v8 reverseObjectEnumerator];
  }
  else
  {
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", v14 + 1, objc_msgSend(v8, "count") + ~v14);
      uint64_t v21 = [v9 objectEnumerator];
LABEL_28:
      id v11 = (void *)v21;
      goto LABEL_4;
    }
    uint64_t v19 = [v8 objectEnumerator];
  }
  id v11 = (void *)v19;
LABEL_5:

  return v11;
}

- (BOOL)isEmpty
{
  v2 = [(ICSharedListeningQueue *)self->_queue items];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v6];
  if ([v7 type] == 3)
  {
    if (a4)
    {
      BOOL v8 = 0;
      *a4 = @"tail placeholder";
      goto LABEL_12;
    }
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  queue = self->_queue;
  id v10 = [v7 itemID];
  id v11 = [(ICSharedListeningQueue *)queue itemForIdentifier:v10];

  if (!v11)
  {
    if (a4)
    {
      uint64_t v14 = NSString;
      BOOL v15 = [v7 itemID];
      *a4 = [v14 stringWithFormat:@"ICSharedListeningQueue does not contain itemID: %@", v15];
    }
    goto LABEL_11;
  }
  uint64_t v12 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self contentItemIDEnumeratorStartingAfterContentItemID:v6 mode:2 options:0];
  id v13 = [v12 nextObject];
  BOOL v8 = v13 != 0;
  if (a4 && !v13) {
    *a4 = @"end of shared listening queue";
  }

LABEL_12:
  return v8;
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  BOOL v8 = [v6 itemID];
  uint64_t v9 = [(ICSharedListeningQueue *)queue itemForIdentifier:v8];

  if (a4 && !v9)
  {
    id v10 = NSString;
    id v11 = [v6 itemID];
    *a4 = [v10 stringWithFormat:@"ICSharedListeningQueue does not contain itemID: %@", v11];
  }
  return v9 != 0;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:a3];
  queue = self->_queue;
  BOOL v8 = [v6 itemID];
  uint64_t v9 = [(ICSharedListeningQueue *)queue itemForIdentifier:v8];

  if (a4 && !v9)
  {
    id v10 = NSString;
    id v11 = [v6 itemID];
    *a4 = [v10 stringWithFormat:@"ICSharedListeningQueue does not contain itemID: %@", v11];
  }
  return v9 != 0;
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  id v5 = a3;
  id v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _componentsForContentItemID:v5];
  id v7 = v6;
  if (!self->_liveLinkStopped)
  {
    if (self->_queue)
    {
      uint64_t v9 = [v6 itemID];
      switch([v7 type])
      {
        case 0:
          id v11 = [(ICSharedListeningQueue *)self->_queue itemForIdentifier:v9];
          if (v11) {
            LODWORD(self) = ![(_MPCQueueControllerBehaviorMusicSharePlay *)self _useItemPlaceholderForContentItemID:v5];
          }
          else {
            LOBYTE(self) = 0;
          }
          goto LABEL_19;
        case 1:
          id v11 = [v7 itemSpecificContentItemID];
          LOBYTE(self) = [(_MPCQueueControllerBehaviorMusicSharePlay *)self _useItemPlaceholderForContentItemID:v11];
LABEL_19:

          goto LABEL_5;
        case 2:
          LOBYTE(self) = self->_queue != 0;
          goto LABEL_5;
        case 3:
          id v13 = [MEMORY[0x263F08690] currentHandler];
          [v13 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusicSharePlay.m", 384, @"Unexpected contentItemID in itemExistsForContentItemID (MPCQueueControllerBehaviorItemTypeEndOfQueuePlaceholder): %@", v5 object file lineNumber description];

          goto LABEL_17;
        default:
LABEL_17:
          LOBYTE(self) = 0;
          break;
      }
      goto LABEL_5;
    }
    if ([v6 type] == 2)
    {
      BOOL v8 = [v7 sectionID];
      uint64_t v9 = v8;
      id v10 = @"WaitingForFirstQueue";
      goto LABEL_4;
    }
LABEL_12:
    LOBYTE(self) = 0;
    goto LABEL_13;
  }
  if ([v6 type] != 2) {
    goto LABEL_12;
  }
  BOOL v8 = [v7 sectionID];
  uint64_t v9 = v8;
  id v10 = @"LiveLinkStopped";
LABEL_4:
  LOBYTE(self) = [v8 isEqualToString:v10];
LABEL_5:

LABEL_13:
  return (char)self;
}

- (void)activeItemFlagsDidChange:(unsigned __int16)a3
{
  self->_activeItemFlags = a3;
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v8 = (void (**)(id, void *))a4;
  uint64_t v9 = objc_opt_class();
  id v10 = [v7 playbackQueue];
  id v55 = 0;
  char v11 = [v9 canLoadQueue:v10 reason:&v55];
  id v12 = v55;

  if ((v11 & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusicSharePlay.m", 291, @"unsupported playback queue: %@", v12 object file lineNumber description];
  }
  uint64_t v14 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self host];
  BOOL v15 = [v7 mediaRemoteOptions];
  __int16 v16 = [v15 objectForKeyedSubscript:@"sharedListeningToken"];

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v7 playbackQueue];
      self->_joiningAsInitiator = [v17 isRequestingImmediatePlayback];

      uint64_t v18 = +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment];
      playbackRequestEnvironment = self->_playbackRequestEnvironment;
      self->_playbackRequestEnvironment = v18;

      uint64_t v20 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
      id v54 = 0;
      uint64_t v21 = [[MPCModelGenericAVItemUserIdentityPropertySet alloc] initWithRequestContext:v20 error:&v54];
      id v22 = v54;
      identityPropertySet = self->_identityPropertySet;
      self->_identityPropertySet = v21;

      __int16 v52 = v14;
      if (v22 || !self->_identityPropertySet)
      {
        int v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v14 engineID];
          [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
          id v27 = v26 = v12;
          *(_DWORD *)buf = 138543874;
          uint64_t v57 = v25;
          __int16 v58 = 2114;
          uint64_t v59 = v27;
          __int16 v60 = 2114;
          id v61 = v22;
          _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | failing command [failed to load identity properties] error=%{public}@", buf, 0x20u);

          id v12 = v26;
          uint64_t v14 = v52;
        }
        v28 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 2, v22, @"failed to load identity properties");

        v8[2](v8, v28);
      }
      __int16 v32 = _Block_copy(v8);
      id loadingCompletionHandler = self->_loadingCompletionHandler;
      self->_id loadingCompletionHandler = v32;

      v34 = [v16 sharedListeningProperties];
      uint64_t v35 = [v34 sessionIdentifier];

      uint64_t v36 = [v16 identity];
      v51 = +[MPCSharedListeningLiveLinkReusePool sharedReusePool];
      uint64_t v37 = [v51 liveLinkForSessionID:v35];
      v53 = (void *)v36;
      if (v37)
      {
        v38 = (void *)v37;
        v39 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [v14 engineID];
          [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
          v41 = id v49 = v12;
          *(_DWORD *)buf = 138544130;
          uint64_t v57 = v40;
          __int16 v58 = 2114;
          uint64_t v59 = v41;
          __int16 v60 = 2048;
          id v61 = v38;
          __int16 v62 = 2114;
          uint64_t v63 = v35;
          _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | reusing live link [] liveLink=%p sessionID=%{public}@", buf, 0x2Au);

          id v12 = v49;
        }
      }
      else
      {
        v38 = [MEMORY[0x263F89180] linkWithSessionIdentifier:v35 identity:v36];
        v42 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v14 engineID];
          uint64_t v50 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
          *(_DWORD *)buf = 138544130;
          uint64_t v57 = v43;
          __int16 v58 = 2114;
          uint64_t v59 = v50;
          __int16 v60 = 2048;
          id v61 = v38;
          __int16 v62 = 2114;
          uint64_t v63 = v35;
          _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | allocating live link [] liveLink=%p sessionID=%{public}@", buf, 0x2Au);
        }
        [v51 storeLiveLink:v38 forSessionID:v35];
      }
      [v38 setDelegate:self];
      liveLink = self->_liveLink;
      self->_liveLink = (ICLiveLink *)v38;
      id v45 = v38;

      __int16 v46 = v53;
      [(ICLiveLink *)self->_liveLink updateWithIdentity:v53];
      if ([(ICLiveLink *)self->_liveLink isStarted])
      {
        uint64_t v47 = [v45 queue];

        if (v47)
        {
          [(_MPCQueueControllerBehaviorMusicSharePlay *)self _initializeWithQueue:v47];
          id v45 = (id)v47;
        }
        else
        {
          id v45 = 0;
        }
        uint64_t v14 = v52;
        __int16 v46 = v53;
      }
      else
      {
        [(ICLiveLink *)self->_liveLink start];
        uint64_t v14 = v52;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v30);
      v31 = objc_msgSend(v29, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 1, @"Unsupported playback queue for SharePlay behavior [sharedListeningToken is unknown type: %@]", v20);
      v8[2](v8, v31);
    }
  }
  else
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 1, @"Unsupported playback queue for SharePlay behavior [options did not contain 'sharedListeningToken']");
    v8[2](v8, v20);
  }

  return 0;
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (void)disconnectFromHost:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  [(_MPCQueueControllerBehaviorMusicSharePlay *)self endSynchronizedPlayback];
  p_host = &self->_host;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v6 = [WeakRetained eventStream];
  v10[0] = @"session-id";
  id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  BOOL v8 = v7;
  if (!v7)
  {
    BOOL v8 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = @"shared-session-event-reason";
  v11[0] = v8;
  v11[1] = @"MusicSharePlayBehavior Teardown";
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v6 emitEventType:@"shared-session-end" payload:v9];

  if (!v7) {
  objc_storeWeak((id *)p_host, 0);
  }
}

- (void)didConnectToHost:(id)a3
{
  void v11[4] = *MEMORY[0x263EF8340];
  BOOL v4 = [a3 eventStream];
  v10[0] = @"session-id";
  id v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v11[0] = v6;
  v10[1] = @"shared-session-id";
  id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self sessionID];
  BOOL v8 = v7;
  if (!v7)
  {
    BOOL v8 = [MEMORY[0x263EFF9D0] null];
  }
  v11[1] = v8;
  v11[2] = &unk_26CC18FD8;
  void v10[2] = @"shared-session-type";
  v10[3] = @"shared-session-event-reason";
  void v11[3] = @"MusicSharePlayBehavior Setup";
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  [v4 emitEventType:@"shared-session-begin" payload:v9];

  if (!v7) {
  if (!v5)
  }
}

- (void)connectToHost:(id)a3
{
}

- (_MPCQueueControllerBehaviorMusicSharePlay)initWithSessionID:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MPCQueueControllerBehaviorMusicSharePlay;
  id v5 = [(_MPCQueueControllerBehaviorMusicSharePlay *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    pendingActions = v5->_pendingActions;
    v5->_pendingActions = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    knownContainerIDs = v5->_knownContainerIDs;
    v5->_knownContainerIDs = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    activeModelGenericAVItems = v5->_activeModelGenericAVItems;
    v5->_activeModelGenericAVItems = (NSHashTable *)v12;

    uint64_t v14 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x263F121E0]);
    requestController = v5->_requestController;
    v5->_requestController = v14;

    [(MPRequestResponseController *)v5->_requestController setDelegate:v5];
    [(MPRequestResponseController *)v5->_requestController beginAutomaticResponseLoading];
  }

  return v5;
}

- (void)getExpectedCurrentItemModelObjectWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self queue];

  if (v6)
  {
    id v7 = [(_MPCQueueControllerBehaviorMusicSharePlay *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke;
    v9[3] = &unk_2643C2288;
    void v9[4] = self;
    id v10 = v5;
    SEL v11 = a2;
    [v7 getExpectedCurrentItemWithCompletion:v9];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 14, @"Cannot get model object before the live link queue has loaded");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v8);
  }
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 identifier];
    char v7 = [@"InProcess-com.apple.music.playbackqueue.sharedlistening" isEqualToString:v6];
    BOOL v8 = v7;
    if (a4 && (v7 & 1) == 0)
    {
      *a4 = [NSString stringWithFormat:@"Unsupported custom data playback queue: %@", v6];
    }
  }
  else if (a4)
  {
    [NSString stringWithFormat:@"Unsupported playback queue: %@", objc_opt_class()];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end