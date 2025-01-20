@interface AVPlayerPlaybackCoordinator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_convertToMediaTimeForTime:(SEL)a3 withNetworkTime:(id *)a4 rate:(id)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)networkToHostTimeOffset;
- (AVPlayer)player;
- (AVPlayerPlaybackCoordinator)initWithPlayer:(id)a3;
- (BOOL)_hasFigPlaybackCoordinator;
- (BOOL)isDefunct;
- (BOOL)pauseSnapsToMediaTimeOfOriginator;
- (OpaqueFigPlaybackCoordinator)_copyFigPlaybackCoordinator;
- (id)_currentWaitingPoliciesArray;
- (id)_figPlaybackCoordinatorConfigQueue;
- (id)_pendingFigPlaybackCoordinatorProperties;
- (id)_pendingFigPlaybackCoordinatorPropertyForKey:(id)a3;
- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3;
- (id)beginSuspensionForReason:(id)a3;
- (id)coordinationMediumDelegate;
- (id)currentSuspensions;
- (id)delegate;
- (id)description;
- (id)identifierForPlayerItem:(id)a3;
- (id)integratedTimeline;
- (id)interstitialPlaybackCoordinator;
- (id)interstitialTimeRangesForPlayerItem:(id)a3;
- (id)mediumLoggingIdentifier;
- (id)otherParticipants;
- (id)participantForIdentifier:(id)a3;
- (id)primaryPlaybackCoordinatorForInterstitial;
- (id)suspensionReasons;
- (id)suspensionReasonsThatTriggerWaiting;
- (id)trackedTransportControlStateDictionaries;
- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3;
- (void)_addFigPlaybackCoordinatorListeners:(OpaqueFigPlaybackCoordinator *)a3;
- (void)_applyAdjustedIntegratedSeekTimeFromTime:(id *)a3 withNetworkTime:(id)a4 rate:(id)a5;
- (void)_applyIntegratedTimelineSeek:(id *)a3;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4;
- (void)_postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)_reactToNewDelegate;
- (void)_removeUnusedTransportControlStates;
- (void)_replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3;
- (void)_resetGroupTimelineExpectations;
- (void)_setIntegratedTimelineCreatingNew:(unsigned __int8)a3;
- (void)_setInterstitialActive:(unsigned __int8)a3;
- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession;
- (void)_setNetworkToHostTimeOffset;
- (void)_setPendingFigPlaybackCoordinatorProperty:(id)a3 forKey:(id)a4;
- (void)_setStorage:(id)a3;
- (void)_storageRead:(id)a3;
- (void)_storageWrite:(id)a3;
- (void)_synchronizeFigPlayerEvents;
- (void)_synchronizeWorkOnPlayerQueue:(id)a3;
- (void)_updateCoordinationMediumDelegateOnFigPlaybackCoordinator;
- (void)_updateLocalParticipantUUIDOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3;
- (void)_updateOtherParticipantsUsingFigParticipantUUIDs:(id)a3;
- (void)_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:(id)a3;
- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3;
- (void)_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:(id)a3;
- (void)_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator;
- (void)_updateSuspensionReasons:(id)a3;
- (void)_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator;
- (void)_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:(id)a3;
- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3;
- (void)_updateWaitingPoliciesArray:(id)a3 withPolicies:(id)a4;
- (void)_updateWaitingPoliciesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3;
- (void)dealloc;
- (void)handleNewParticipantStateDictionary:(id)a3;
- (void)handleNewTransportControlStateDictionary:(id)a3;
- (void)handleRemovalOfParticipant:(id)a3;
- (void)handleReplacementParticipantStateDictionaries:(id)a3;
- (void)setCoordinationMediumDelegate:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3;
- (void)setInterstitialPlaybackCoordinator:(id)a3;
- (void)setMediumLoggingIdentifier:(id)a3;
- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4;
- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3;
- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3;
- (void)setWeakReferenceToPrimaryPlaybackCoordinator:(id)a3;
@end

@implementation AVPlayerPlaybackCoordinator

- (AVPlayerPlaybackCoordinator)initWithPlayer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)AVPlayerPlaybackCoordinator;
  v4 = [(AVPlaybackCoordinator *)&v23 initInternal];
  v5 = (AVPlayerPlaybackCoordinator *)v4;
  if (v4)
  {
    objc_storeWeak(v4 + 1, a3);
    v5->_otherParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplaybackcoordinator.ivars");
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_figPlaybackCoordinatorConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplaybackcoordinator.figplaybackcoordinator.config", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_localParticipantUUIDConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplaybackcoordinator.localparticipantuuid.config", v7);
    v5->_suspensionReasons = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_storage = objc_alloc_init(AVPlayerPlaybackCoordinatorStorage);
    v5->_storage->controlStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_storage->participantStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_isInExpanseMediaPlayback = 0;
    v5->_storage->participantLimitPerSuspensionReason = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_storage->suspensionReasonsThatTriggerWaiting = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime", 0);
    v5->_storage->waitingPoliciesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_currentSuspensions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_storage->pauseSnapsToMediaTimeOfOriginator = 1;
    objc_storeWeak((id *)&v5->_weakPrimaryPlaybackCoordinator, 0);
    v5->_interstitialPlaybackCoordinator = 0;
    v5->_pendingFigPlaybackCoordinatorProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_integratedTimeline = 0;
    v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v18 = v5;
    suspensionReasonsThatTriggerWaiting = v5->_storage->suspensionReasonsThatTriggerWaiting;
    uint64_t v10 = [(NSMutableArray *)suspensionReasonsThatTriggerWaiting countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = *MEMORY[0x1E4F21FD0];
      uint64_t v14 = *MEMORY[0x1E4F1CFD0];
      uint64_t v15 = *MEMORY[0x1E4F21FC8];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(suspensionReasonsThatTriggerWaiting);
          }
          objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((void *)&v19 + 1) + 8 * i)), v13, v14, v15, 0));
        }
        uint64_t v11 = [(NSMutableArray *)suspensionReasonsThatTriggerWaiting countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
    v5 = v18;
    [(AVPlayerPlaybackCoordinator *)v18 _updateWaitingPoliciesArray:v18->_storage->waitingPoliciesArray withPolicies:v8];
  }
  return v5;
}

- (void)_updateWaitingPoliciesArray:(id)a3 withPolicies:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [a4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v16 = *(void *)v22;
    uint64_t v7 = *MEMORY[0x1E4F21FD0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(a4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(a3);
              }
              uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              [v14 objectForKeyedSubscript:v7];
              [v9 objectForKeyedSubscript:v7];
              if (FigCFEqual())
              {
                if (v14) {
                  [a3 removeObject:v14];
                }
                goto LABEL_17;
              }
            }
            uint64_t v11 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_17:
        [a3 addObject:v9];
      }
      uint64_t v6 = [a4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
}

uint64_t __44__AVPlayerPlaybackCoordinator__storageRead___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __39__AVPlayerPlaybackCoordinator_delegate__block_invoke(uint64_t a1, uint64_t a2)
{
  id result = objc_loadWeakRetained((id *)(a2 + 72));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasFigPlaybackCoordinator
{
  v2 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (OpaqueFigPlaybackCoordinator)_copyFigPlaybackCoordinator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerPlaybackCoordinator__copyFigPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueFigPlaybackCoordinator *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)interstitialTimeRangesForPlayerItem:(id)a3
{
  id v5 = [(AVPlayerPlaybackCoordinator *)self delegate];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return (id)[v6 playbackCoordinator:self interstitialTimeRangesForPlayerItem:a3];
}

- (id)delegate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  uint64_t v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__AVPlayerPlaybackCoordinator_delegate__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_storageRead:(id)a3
{
  rwQueue = self->_storage->rwQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVPlayerPlaybackCoordinator__storageRead___block_invoke;
  v4[3] = &unk_1E57B4540;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_read(rwQueue, v4);
}

- (id)identifierForPlayerItem:(id)a3
{
  id v5 = [(AVPlayerPlaybackCoordinator *)self delegate];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return (id)[v6 playbackCoordinator:self identifierForPlayerItem:a3];
}

CFTypeRef __58__AVPlayerPlaybackCoordinator__copyFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 40);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__AVPlayerPlaybackCoordinator__storageWrite___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setWeakReferenceToPrimaryPlaybackCoordinator:(id)a3
{
}

- (void)setInterstitialPlaybackCoordinator:(id)a3
{
  [a3 _setStorage:self->_storage];
  ivarAccessQueue = self->_ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVPlayerPlaybackCoordinator_setInterstitialPlaybackCoordinator___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  v6[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

- (void)_setStorage:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AVPlayerPlaybackCoordinator__setStorage___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __42__AVPlayerPlaybackCoordinator_description__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void *)(*(void *)(a1 + 32) + 88) == 0;
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  uint64_t result = [v3 initWithFormat:@"<%@: %p, type = %d>", NSStringFromClass(v4), *(void *)(a1 + 32), v2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void *__66__AVPlayerPlaybackCoordinator_setInterstitialPlaybackCoordinator___block_invoke(void *result)
{
  v1 = *(void **)(result[5] + 88);
  if ((void *)result[4] != v1)
  {
    BOOL v2 = result;

    uint64_t result = (id)v2[4];
    *(void *)(v2[5] + 88) = result;
  }
  return result;
}

id __43__AVPlayerPlaybackCoordinator_setDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a2 + 72);
  id result = objc_loadWeak((id *)(a2 + 72));
  id v5 = *(id *)(a1 + 32);
  if (result != v5)
  {
    id result = objc_storeWeak(v3, v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id __43__AVPlayerPlaybackCoordinator__setStorage___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AVPlayerPlaybackCoordinator_setDelegate___block_invoke;
  v4[3] = &unk_1E57B69C0;
  v4[4] = delegate;
  void v4[5] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v4];
  if (*((unsigned char *)v6 + 24))
  {
    objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_reactToNewDelegate");
    [(AVPlayerPlaybackCoordinator *)self _reactToNewDelegate];
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_storageWrite:(id)a3
{
  rwQueue = self->_storage->rwQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__AVPlayerPlaybackCoordinator__storageWrite___block_invoke;
  v4[3] = &unk_1E57B4540;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(rwQueue, v4);
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerPlaybackCoordinator_description__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addFigPlaybackCoordinatorListeners:(OpaqueFigPlaybackCoordinator *)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F334D8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke;
  v15[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v16, &location);
  self->_suspensionsChangedNotificationToken = (id)[v5 addObserverForName:v6 object:a3 queue:0 usingBlock:v15];
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F334D0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_2;
  v13[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v14, &location);
  self->_participantsChangedNotificationToken = (id)[v7 addObserverForName:v8 object:a3 queue:0 usingBlock:v13];
  uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *MEMORY[0x1E4F334C8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_3;
  v11[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v12, &location);
  self->_didIssueCommandToPlaybackObjectNotificationToken = (id)[v9 addObserverForName:v10 object:a3 queue:0 usingBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 userInfo];
  uint64_t result = [v3 objectForKey:*MEMORY[0x1E4F334C0]];
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          [v6 addObject:AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((void *)&v12 + 1) + 8 * v10++))];
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    uint64_t v11 = (id *)(a1 + 32);
    [objc_loadWeak(v11) _updateSuspensionReasons:v6];
    return objc_msgSend((id)objc_msgSend(objc_loadWeak(v11), "primaryPlaybackCoordinatorForInterstitial"), "_updateSuspensionReasons:", v6);
  }
  return result;
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 userInfo];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F334B8]];
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _updateOtherParticipantsUsingFigParticipantUUIDs:v4];
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_3(id *a1, void *a2)
{
  id UserInfoForDidIssueCommandToPlaybackObjectNotification = AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification((void *)[a2 userInfo]);
  a1 += 4;
  [objc_loadWeak(a1) _postNotificationWithName:@"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification" userInfo:UserInfoForDidIssueCommandToPlaybackObjectNotification];
  uint64_t v4 = (void *)[objc_loadWeak(a1) primaryPlaybackCoordinatorForInterstitial];
  return [v4 _postNotificationWithName:@"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification" userInfo:UserInfoForDidIssueCommandToPlaybackObjectNotification];
}

- (void)_postNotificationWithName:(id)a3 userInfo:(id)a4
{
  uint64_t v4 = [MEMORY[0x1E4F28EA0] notificationWithName:a3 object:self userInfo:a4];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotification:v4];
}

- (void)dealloc
{
  if (self->_suspensionsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_suspensionsChangedNotificationToken);

    self->_suspensionsChangedNotificationToken = 0;
  }
  if (self->_participantsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_participantsChangedNotificationToken);

    self->_participantsChangedNotificationToken = 0;
  }
  if (self->_didIssueCommandToPlaybackObjectNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_didIssueCommandToPlaybackObjectNotificationToken);

    self->_didIssueCommandToPlaybackObjectNotificationToken = 0;
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
  if (figPlaybackCoordinatorConfigQueue) {
    dispatch_release(figPlaybackCoordinatorConfigQueue);
  }
  localParticipantUUIDConfigQueue = self->_localParticipantUUIDConfigQueue;
  if (localParticipantUUIDConfigQueue) {
    dispatch_release(localParticipantUUIDConfigQueue);
  }
  figPlaybackCoordinator = self->_figPlaybackCoordinator;
  if (figPlaybackCoordinator) {
    CFRelease(figPlaybackCoordinator);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerPlaybackCoordinator;
  [(AVPlayerPlaybackCoordinator *)&v7 dealloc];
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_weakPlayer);
}

- (void)setFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v24 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"figPlaybackCoordinator != NULL"), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  ivarAccessQueue = self->_ivarAccessQueue;
  char v36 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke;
  block[3] = &unk_1E57B3A60;
  block[5] = &v33;
  block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v34 + 24))
  {
    [(AVPlayerPlaybackCoordinator *)self _addFigPlaybackCoordinatorListeners:a3];
    if ([(AVPlayerPlaybackCoordinator *)self primaryPlaybackCoordinatorForInterstitial])
    {
      [(AVPlayerPlaybackCoordinator *)self _setIntegratedTimelineCreatingNew:1];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = [(AVPlayerPlaybackCoordinator *)self currentSuspensions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v16) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          long long v18 = *(void (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(v17 + 8);
          if (v18) {
            v18(a3, v15);
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v12);
    }
    v27[0] = 0;
    v27[1] = 0;
    v27[2] = AVPlayerPlaybackCoordinatorBroadcastTransportControlStateCallback;
    v27[3] = AVPlayerPlaybackCoordinatorBroadcastParticipantStateCallback;
    v27[4] = AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback;
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    long long v21 = *(uint64_t (**)(OpaqueFigPlaybackCoordinator *, AVPlayerPlaybackCoordinator *, void *))(v20 + 32);
    if (v21) {
      int v22 = v21(a3, self, v27);
    }
    else {
      int v22 = -12782;
    }
    [(AVPlayerPlaybackCoordinator *)self _updateLocalParticipantUUIDOnFigPlaybackCoordinator:a3];
    CFRetain(a3);
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke_2;
    v25[3] = &unk_1E57B4738;
    v25[4] = self;
    v25[5] = a3;
    int v26 = v22;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v25);
  }
  _Block_object_dispose(&v33, 8);
}

CFTypeRef __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  CFTypeRef v3 = *(CFTypeRef *)(v2 + 40);
  CFTypeRef result = (CFTypeRef)a1[6];
  if (v3 != result)
  {
    if (v3) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"FigPlaybackCoordinator associated with an AVPlayer should not change" userInfo:0]);
    }
    if (result)
    {
      CFTypeRef result = CFRetain(result);
      uint64_t v2 = a1[4];
    }
    *(void *)(v2 + 40) = result;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  return result;
}

void __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F334E0], 0);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v44 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(a1 + 32) _pendingFigPlaybackCoordinatorPropertyForKey:v7];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
          uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v12 = v11 ? v11 : 0;
          uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 56);
          if (v13) {
            v13(CMBaseObject, v7, v9);
          }
        }
        [*(id *)(a1 + 32) _setPendingFigPlaybackCoordinatorProperty:0 forKey:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 32) _updateWaitingPoliciesOnFigPlaybackCoordinator:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) pauseSnapsToMediaTimeOfOriginator]) {
    long long v14 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    long long v14 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v15 = FigPlaybackCoordinatorGetCMBaseObject();
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  long long v18 = *(void (**)(uint64_t, void, void))(v17 + 56);
  if (v18) {
    v18(v15, *MEMORY[0x1E4F21F50], *v14);
  }
  uint64_t v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trackedTransportControlStateDictionaries"), "allValues");
  [*(id *)(a1 + 32) _replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:*(void *)(a1 + 40)];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if (objc_msgSend(*(id *)(a1 + 32), "interstitialPlaybackCoordinator", v36, v37))
        {
          objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", @"Rate"), "floatValue");
          if (v25 != 0.0)
          {
            memset(&v47, 0, sizeof(v47));
            objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", @"Time"), "floatValue");
            CMTimeMakeWithSeconds(&v47, v26, 1000);
            uint64_t v27 = [v24 objectForKeyedSubscript:@"NetworkTime"];
            uint64_t v28 = [v24 objectForKeyedSubscript:@"Rate"];
            long long v29 = *(void **)(a1 + 32);
            CMTime v48 = v47;
            [v29 _applyAdjustedIntegratedSeekTimeFromTime:&v48 withNetworkTime:v27 rate:v28];
          }
        }
        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v31) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        uint64_t v33 = *(unsigned int (**)(uint64_t, void *))(v32 + 80);
        if (!v33 || v33(v30, v24))
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v21);
  }
  uint64_t v35 = *(const void **)(a1 + 40);
  if (v35) {
    CFRelease(v35);
  }
}

- (id)_pendingFigPlaybackCoordinatorProperties
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorProperties__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorProperties__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_pendingFigPlaybackCoordinatorPropertyForKey:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__33;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v11 = __Block_byref_object_dispose__33;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorPropertyForKey___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __76__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorPropertyForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 104) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_setPendingFigPlaybackCoordinatorProperty:(id)a3 forKey:(id)a4
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerPlaybackCoordinator__setPendingFigPlaybackCoordinatorProperty_forKey___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
}

uint64_t __80__AVPlayerPlaybackCoordinator__setPendingFigPlaybackCoordinatorProperty_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(a1[5] + 104);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (void)_setInterstitialActive:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v12 = *v5;
  uint64_t v6 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v6)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__AVPlayerPlaybackCoordinator__setInterstitialActive___block_invoke;
    block[3] = &unk_1E57B40A0;
    block[4] = v13;
    block[5] = &v9;
    block[6] = v6;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
    CFRelease(v6);
  }
  else
  {
    [(AVPlayerPlaybackCoordinator *)self _setPendingFigPlaybackCoordinatorProperty:v10[3] forKey:*MEMORY[0x1E4F334E0]];
  }
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_setInterstitialActive:", v3);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
}

uint64_t __54__AVPlayerPlaybackCoordinator__setInterstitialActive___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(CMBaseObject, *MEMORY[0x1E4F334E0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_setIntegratedTimelineCreatingNew:(unsigned __int8)a3
{
  id v5 = [(AVPlayerPlaybackCoordinator *)self interstitialPlaybackCoordinator];
  uint64_t v6 = self;
  if (!v5)
  {
    if (![(AVPlayerPlaybackCoordinator *)self primaryPlaybackCoordinatorForInterstitial])return; {
    uint64_t v6 = [(AVPlayerPlaybackCoordinator *)self primaryPlaybackCoordinatorForInterstitial];
    }
  }
  uint64_t v7 = [[(AVPlayerPlaybackCoordinator *)v6 player] currentItem];
  if (v7)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AVPlayerPlaybackCoordinator__setIntegratedTimelineCreatingNew___block_invoke;
    block[3] = &unk_1E57B20C0;
    unsigned __int8 v10 = a3;
    block[4] = self;
    block[5] = v7;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
}

uint64_t __65__AVPlayerPlaybackCoordinator__setIntegratedTimelineCreatingNew___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2) {
    uint64_t result = [v3 integratedTimeline];
  }
  else {
    uint64_t result = [v3 _copyIntegratedTimelineIfCreated];
  }
  *(void *)(*(void *)(a1 + 32) + 136) = result;
  return result;
}

- (id)interstitialPlaybackCoordinator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  unsigned __int8 v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerPlaybackCoordinator_interstitialPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __62__AVPlayerPlaybackCoordinator_interstitialPlaybackCoordinator__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 88);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)primaryPlaybackCoordinatorForInterstitial
{
  return objc_loadWeak((id *)&self->_weakPrimaryPlaybackCoordinator);
}

- (id)integratedTimeline
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  unsigned __int8 v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerPlaybackCoordinator_integratedTimeline__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __49__AVPlayerPlaybackCoordinator_integratedTimeline__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 136);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_figPlaybackCoordinatorConfigQueue
{
  return self->_figPlaybackCoordinatorConfigQueue;
}

- (void)_reactToNewDelegate
{
  uint64_t v2 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlaybackCoordinatorItemIdentifierForCoordinatedPlaybackDidChangeNotification" object:self];
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotification:v2];
}

- (void)_updateLocalParticipantUUIDOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  localParticipantUUIDConfigQueue = self->_localParticipantUUIDConfigQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(localParticipantUUIDConfigQueue, v4);
}

void __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__33;
  uint64_t v21 = __Block_byref_object_dispose__33;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  int v14 = __Block_byref_object_copy__33;
  uint64_t v15 = __Block_byref_object_dispose__33;
  uint64_t v16 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke_2;
  v10[3] = &unk_1E57B6A10;
  v10[4] = &v17;
  v10[5] = &v11;
  [v2 _storageRead:v10];
  id v3 = (void *)v18[5];
  if (v3)
  {
    CFStringRef v4 = (const __CFString *)[v3 UUIDString];
    CFUUIDRef v5 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
  }
  else
  {
    CFUUIDRef v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, CFUUIDRef))(v8 + 40);
  if (v9) {
    v9(v6, v5);
  }
  if (v5) {
    CFRelease(v5);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

id __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 64) copy];
  id result = objc_loadWeakRetained((id *)(a2 + 80));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = [[(AVPlayerPlaybackCoordinator *)self player] audioSession];
  if (!v3) {
    id v3 = (AVAudioSession *)[MEMORY[0x1E4F153E0] sharedInstance];
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AVPlayerPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke;
  block[3] = &unk_1E57B22E0;
  void block[6] = &v12;
  void block[7] = &v8;
  block[4] = self;
  block[5] = v3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  int v5 = *((unsigned __int8 *)v13 + 24);
  if (*((unsigned __int8 *)v9 + 24) != v5 && v3)
  {
    uint64_t v6 = 0;
    [(AVAudioSession *)v3 setIsExpanseMediaSession:v5 != 0 error:&v6];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

uint64_t __75__AVPlayerPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 56) count];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 96);
  uint64_t v3 = a1[4];
  int v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  if (*(unsigned __int8 *)(v3 + 96) != v4)
  {
    if (a1[5]) {
      *(unsigned char *)(v3 + 96) = v4;
    }
  }
  return result;
}

- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  float v26 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v5 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v5)
  {
    uint64_t v6 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      obuint64_t j = a3;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          CFUUIDRef v10 = *(const __CFUUID **)(*((void *)&v32 + 1) + 8 * i);
          id NSUUIDFromCFUUID = AVPlaybackCoordinatorGetNSUUIDFromCFUUID(v10);
          uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] array];
          CFTypeRef cf = 0;
          uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v13) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
          char v15 = *(void (**)(OpaqueFigPlaybackCoordinator *, const __CFUUID *, CFTypeRef *))(v14 + 48);
          if (v15) {
            v15(v6, v10, &cf);
          }
          if (cf)
          {
            BOOL v16 = FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate() != 0;
            uint64_t v17 = (void *)FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons();
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v28;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  [v12 addObject:AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((void *)&v27 + 1) + 8 * j))];
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
              }
              while (v19);
            }

            if (cf) {
              CFRelease(cf);
            }
          }
          else
          {
            BOOL v16 = 0;
          }
          uint64_t v22 = [[AVCoordinatedPlaybackParticipant alloc] initWithParticipantIdentifier:NSUUIDFromCFUUID readyToPlay:v16 suspensionReasons:v12];
          [v26 addObject:v22];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }
    CFRelease(v6);
  }
  return v26;
}

- (void)_updateOtherParticipantsUsingFigParticipantUUIDs:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(AVPlayerPlaybackCoordinator *)self avfParticipantsForFigParticipantsUUIDs:a3];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = v4;
  void block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlaybackCoordinatorOtherParticipantsDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v6);
    [(AVPlayerPlaybackCoordinator *)self _setIsInExpanseMediaPlaybackOnAVAudioSession];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __80__AVPlayerPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke(void *a1)
{
  uint64_t result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(a1[4] + 56), a1[5]);
  if ((result & 1) == 0)
  {

    uint64_t result = [(id)a1[5] copy];
    *(void *)(a1[4] + 56) = result;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)otherParticipants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerPlaybackCoordinator_otherParticipants__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerPlaybackCoordinator_otherParticipants__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)participantForIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__33;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v11 = __Block_byref_object_dispose__33;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke_2;
  v4[3] = &unk_1E57B49D8;
  v4[4] = a1[5];
  id result = (id)[v2 indexOfObjectPassingTest:v4];
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id result = (id)[*(id *)(a1[4] + 56) objectAtIndexedSubscript:result];
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  }
  return result;
}

uint64_t __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqual:", *(void *)(a1 + 32));
  *a4 = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t result = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (result)
  {
    uint64_t v7 = result;
    long long v11 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)($3CC8671D27C23BF42ADDB32F2B5E48AE *, long long *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v9 + 72);
    if (v10)
    {
      long long v13 = v11;
      int64_t v14 = var3;
      v10(v7, &v13, retstr);
    }
    CFRelease(v7);
  }
  return result;
}

- (void)setCoordinationMediumDelegate:(id)a3
{
  uint64_t v5 = [a3 localParticipantUUIDForPlaybackCoordinator:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AVPlayerPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke;
  v6[3] = &unk_1E57B6A38;
  v6[4] = a3;
  v6[5] = v5;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v6];
  [(AVPlayerPlaybackCoordinator *)self _updateCoordinationMediumDelegateOnFigPlaybackCoordinator];
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateCoordinationMediumDelegateOnFigPlaybackCoordinator");
}

void __61__AVPlayerPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 16) removeAllObjects];
  [*(id *)(a2 + 24) removeAllObjects];
  objc_storeWeak((id *)(a2 + 80), *(id *)(a1 + 32));
  id v4 = *(id *)(a2 + 64);
  *(void *)(a2 + 64) = [*(id *)(a1 + 40) copy];
}

- (void)_updateCoordinationMediumDelegateOnFigPlaybackCoordinator
{
  id v3 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v3)
  {
    id v4 = v3;
    [(AVPlayerPlaybackCoordinator *)self _updateLocalParticipantUUIDOnFigPlaybackCoordinator:v3];
    CFRelease(v4);
  }
}

- (id)coordinationMediumDelegate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  uint64_t v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__AVPlayerPlaybackCoordinator_coordinationMediumDelegate__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __57__AVPlayerPlaybackCoordinator_coordinationMediumDelegate__block_invoke(uint64_t a1, uint64_t a2)
{
  id result = objc_loadWeakRetained((id *)(a2 + 80));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)setMediumLoggingIdentifier:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__AVPlayerPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke;
  v3[3] = &unk_1E57B6A60;
  v3[4] = a3;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v3];
}

uint64_t __58__AVPlayerPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  id v2 = *(void **)(a2 + 88);
  if (*(void **)(result + 32) != v2)
  {
    uint64_t v4 = result;

    id result = [*(id *)(v4 + 32) copy];
    *(void *)(a2 + 88) = result;
  }
  return result;
}

- (id)mediumLoggingIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  uint64_t v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AVPlayerPlaybackCoordinator_mediumLoggingIdentifier__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __54__AVPlayerPlaybackCoordinator_mediumLoggingIdentifier__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 88) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)trackedTransportControlStateDictionaries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  uint64_t v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__AVPlayerPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __71__AVPlayerPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 16) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke;
  v3[3] = &unk_1E57B6A38;
  v3[4] = a3;
  void v3[5] = self;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v3];
}

void __95__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Identifier"];
  uint64_t v5 = (void *)[*(id *)(a2 + 16) objectForKeyedSubscript:v4];
  if (!v5
    || (uint64_t v6 = v5,
        int v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"LamportTimestamp"), "intValue"),
        int v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"LamportTimestamp"), "intValue"), (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"IsAuthoritative"), "BOOLValue") & 1) != 0)|| v8 > v7)
  {
LABEL_9:
    uint64_t v12 = *(void *)(a1 + 32);
    long long v13 = *(void **)(a2 + 16);
    [v13 setObject:v12 forKeyedSubscript:v4];
    return;
  }
  if (v8 == v7)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(v6, "objectForKeyedSubscript:", @"OriginatorUUID"));
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"OriginatorUUID"));
    uint64_t v11 = [v10 compare:v9];
    if (v11 != 1)
    {
      if (!v11)
      {
        if ([v10 isEqual:*(void *)(a2 + 64)]) {
          goto LABEL_8;
        }
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      return;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (dword_1EB2D3960)
  {
    int64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_removeUnusedTransportControlStates
{
}

uint64_t __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[*(id *)(a2 + 16) allKeys];
  uint64_t v10 = a2;
  uint64_t v4 = (void *)[*(id *)(a2 + 24) allValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2;
        v11[3] = &unk_1E57B4A00;
        void v11[4] = v9;
        if ([v4 indexOfObjectPassingTest:v11] == 0x7FFFFFFFFFFFFFFFLL) {
          [*(id *)(v10 + 16) removeObjectForKey:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CurrentIdentifier"), "isEqualToString:", *(void *)(a1 + 32));
  *a4 = result;
  return result;
}

- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__AVPlayerPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke;
  v3[3] = &unk_1E57B6A60;
  v3[4] = a3;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v3];
}

uint64_t __85__AVPlayerPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a2 + 24);
  uint64_t v4 = [v2 objectForKeyedSubscript:@"UUID"];
  return [v3 setObject:v2 forKeyedSubscript:v4];
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  -[AVPlayerPlaybackCoordinator _updateTransportControlStateDictionaryWithTransportControlState:](self, "_updateTransportControlStateDictionaryWithTransportControlState:");
  uint64_t v5 = [a3 objectForKeyedSubscript:@"Identifier"];
  [(AVPlayerPlaybackCoordinator *)self _updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:v5];
  id v6 = [(AVPlayerPlaybackCoordinator *)self interstitialPlaybackCoordinator];
  [v6 _updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:v5];
}

- (void)_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:(id)a3
{
  block[26] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke;
    block[3] = &unk_1E57B2270;
    block[4] = self;
    block[5] = a3;
    void block[6] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  long long v23 = __Block_byref_object_copy__33;
  long long v24 = __Block_byref_object_dispose__33;
  uint64_t v25 = 0;
  id v2 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke_2;
  v19[3] = &unk_1E57B6AA8;
  v19[4] = *(void *)(a1 + 40);
  v19[5] = &v20;
  [v2 _storageRead:v19];
  memset(&v18, 0, sizeof(v18));
  objc_msgSend((id)objc_msgSend((id)v21[5], "objectForKeyedSubscript:", @"Time"), "floatValue");
  CMTimeMakeWithSeconds(&v18, v3, 1000);
  objc_msgSend((id)objc_msgSend((id)v21[5], "objectForKeyedSubscript:", @"Rate"), "floatValue");
  float v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) interstitialPlaybackCoordinator];
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6 && v5 == 0.0)
  {
    v26[0] = v18;
    [v7 _applyIntegratedTimelineSeek:v26];
  }
  else if ([v7 interstitialPlaybackCoordinator] && v5 != 0.0)
  {
    uint64_t v8 = [(id)v21[5] objectForKeyedSubscript:@"NetworkTime"];
    uint64_t v9 = [(id)v21[5] objectForKeyedSubscript:@"Rate"];
    uint64_t v10 = *(void **)(a1 + 32);
    v26[0] = v18;
    [v10 _applyAdjustedIntegratedSeekTimeFromTime:v26 withNetworkTime:v8 rate:v9];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = v21[5];
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  long long v15 = *(unsigned int (**)(uint64_t, uint64_t))(v14 + 80);
  if (!v15 || v15(v11, v12))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  uint64_t v17 = *(const void **)(a1 + 48);
  if (v17) {
    CFRelease(v17);
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 16), "objectForKeyedSubscript:", *(void *)(a1 + 32)), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  -[AVPlayerPlaybackCoordinator _updateParticipantStateDictionaryWithParticipantState:](self, "_updateParticipantStateDictionaryWithParticipantState:");
  [(AVPlayerPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"UUID"];
  [(AVPlayerPlaybackCoordinator *)self _updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:v5];
  id v6 = [(AVPlayerPlaybackCoordinator *)self interstitialPlaybackCoordinator];
  [v6 _updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:v5];
}

- (void)_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:(id)a3
{
  block[26] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke;
    block[3] = &unk_1E57B2270;
    block[4] = self;
    block[5] = a3;
    void block[6] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__33;
  long long v15 = __Block_byref_object_dispose__33;
  uint64_t v16 = 0;
  id v2 = (void *)a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke_2;
  v10[3] = &unk_1E57B6AA8;
  v10[4] = a1[5];
  v10[5] = &v11;
  [v2 _storageRead:v10];
  uint64_t v3 = a1[6];
  uint64_t v4 = v12[5];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t))(v6 + 96);
  if (!v7 || v7(v3, v4))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  uint64_t v9 = (const void *)a1[6];
  if (v9) {
    CFRelease(v9);
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 24), "objectForKeyedSubscript:", *(void *)(a1 + 32)), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)handleReplacementParticipantStateDictionaries:(id)a3
{
  v8[24] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke;
  v8[3] = &unk_1E57B6A60;
  v8[4] = a3;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v8];
  [(AVPlayerPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  uint64_t v4 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v4)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke_2;
    block[3] = &unk_1E57B2228;
    block[4] = self;
    block[5] = v4;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a2 + 24) removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a2 + 24), "setObject:forKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v8), objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "objectForKeyedSubscript:", @"UUID"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

void __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:*(void *)(a1 + 40)];
  id v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)_replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__33;
  uint64_t v14 = __Block_byref_object_dispose__33;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__AVPlayerPlaybackCoordinator__replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator___block_invoke;
  v9[3] = &unk_1E57B69E8;
  v9[4] = &v10;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v9];
  uint64_t v4 = v11[5];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(v6 + 88);
  if (!v7 || v7(a3, v4))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __95__AVPlayerPlaybackCoordinator__replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 24), "allValues"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)handleRemovalOfParticipant:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke;
  v8[3] = &unk_1E57B6A60;
  v8[4] = a3;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v8];
  [(AVPlayerPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  uint64_t v5 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke_2;
    block[3] = &unk_1E57B2228;
    block[4] = a3;
    block[5] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
}

uint64_t __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 24);
  uint64_t v3 = [*(id *)(a1 + 32) UUIDString];
  return [v2 removeObjectForKey:v3];
}

void __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    CFUUIDRef v3 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)[v2 UUIDString]);
  }
  else {
    CFUUIDRef v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, CFUUIDRef))(v6 + 64);
  if (v7) {
    v7(v4, v3);
  }
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v8 = *(const void **)(a1 + 40);
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void)_updateSuspensionReasons:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  ivarAccessQueue = self->_ivarAccessQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerPlaybackCoordinator__updateSuspensionReasons___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __56__AVPlayerPlaybackCoordinator__updateSuspensionReasons___block_invoke(void *a1)
{
  uint64_t result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(a1[4] + 48), a1[5]);
  if ((result & 1) == 0)
  {

    uint64_t result = [(id)a1[5] copy];
    *(void *)(a1[4] + 48) = result;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)suspensionReasons
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  char v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerPlaybackCoordinator_suspensionReasons__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerPlaybackCoordinator_suspensionReasons__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)currentSuspensions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  char v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerPlaybackCoordinator_currentSuspensions__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__AVPlayerPlaybackCoordinator_currentSuspensions__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)beginSuspensionForReason:(id)a3
{
  uint64_t v5 = [[AVCoordinatedPlaybackSuspension alloc] initWithCoordinator:self reason:a3];
  ivarAccessQueue = self->_ivarAccessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__AVPlayerPlaybackCoordinator_beginSuspensionForReason___block_invoke;
  v14[3] = &unk_1E57B2098;
  v14[4] = self;
  v14[5] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v14);
  uint64_t v7 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(AVCoordinatedPlaybackSuspension *)v5 _figSuspension];
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(void (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(v11 + 8);
    if (v12) {
      v12(v8, v9);
    }
    CFRelease(v8);
  }
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "beginSuspensionForReason:", a3);
  return v5;
}

uint64_t __56__AVPlayerPlaybackCoordinator_beginSuspensionForReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v2 = [*(id *)(a1 + 40) _figSuspension];
  return [v1 addObject:v2];
}

- (void)_synchronizeFigPlayerEvents
{
  uint64_t v2 = [[(AVPlayerPlaybackCoordinator *)self player] _copyFigPlayer];
  if (v2)
  {
    id v3 = v2;
    CFTypeRef cf = 0;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
    if (v7)
    {
      v7(FigBaseObject, *MEMORY[0x1E4F343D0], *MEMORY[0x1E4F1CF80], &cf);
      if (cf) {
        CFRelease(cf);
      }
    }
    CFRelease(v3);
  }
}

- (void)_synchronizeWorkOnPlayerQueue:(id)a3
{
  uint64_t v5 = [[(AVPlayerPlaybackCoordinator *)self player] _copyFigPlayer];
  if (v5)
  {
    uint64_t v6 = v5;
    if (FigPlayerAsyncDispatchToPlayerQueue())
    {
      [(AVPlayerPlaybackCoordinator *)self _synchronizeFigPlayerEvents];
      (*((void (**)(id))a3 + 2))(a3);
    }
    CFRelease(v6);
  }
  else
  {
    [(AVPlayerPlaybackCoordinator *)self _synchronizeFigPlayerEvents];
    uint64_t v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke;
  block[3] = &unk_1E57B2228;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v6)
  {
    uint64_t v7 = v6;
    if (a3) {
      CFRetain(a3);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = v7;
    void v8[5] = a3;
    [(AVPlayerPlaybackCoordinator *)self _synchronizeWorkOnPlayerQueue:v8];
  }
}

uint64_t __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

void __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  if (v6) {
    v6(v2, v3);
  }
  uint64_t v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 32);
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke;
  block[3] = &unk_1E57B2228;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v8 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v8)
  {
    uint64_t v9 = v8;
    if (a3) {
      CFRetain(a3);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke_2;
    v10[3] = &__block_descriptor_72_e5_v8__0l;
    v10[4] = v9;
    v10[5] = a3;
    long long v11 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(AVPlayerPlaybackCoordinator *)self _synchronizeWorkOnPlayerQueue:v10];
  }
}

uint64_t __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

void __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, long long *))(v5 + 24);
  if (v6)
  {
    long long v11 = v9;
    uint64_t v12 = v10;
    v6(v2, v3, &v11);
  }
  uint64_t v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 32);
  if (v8) {
    CFRelease(v8);
  }
}

- (id)_currentWaitingPoliciesArray
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  long long v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__AVPlayerPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__AVPlayerPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 56) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_updateWaitingPoliciesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  id v3 = [(AVPlayerPlaybackCoordinator *)self _currentWaitingPoliciesArray];
  uint64_t CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, id))(v6 + 56);
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F21F58];
    v7(CMBaseObject, v8, v3);
  }
}

- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__AVPlayerPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke;
  v6[3] = &unk_1E57B6AF0;
  v6[5] = self;
  void v6[6] = a3;
  v6[4] = a4;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v6];
  [(AVPlayerPlaybackCoordinator *)self _updateParticipantLimitOnFigPlaybackCoordinatorWithReason:a4];
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:", a4);
}

uint64_t __86__AVPlayerPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a2 + 32), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", *(void *)(a1 + 48)), *(void *)(a1 + 32));
  int v4 = [*(id *)(a2 + 40) containsObject:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v6 = AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(a1 + 32));
  uint64_t v7 = *MEMORY[0x1E4F21FD0];
  uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v4) {
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v9 = *v8;
  uint64_t v10 = *MEMORY[0x1E4F21FC8];
  uint64_t v11 = [*(id *)(a2 + 32) objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v12 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v9, v10, v11, *MEMORY[0x1E4F21FC0], 0);
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a2 + 56);
  v16[0] = v12;
  return objc_msgSend(v13, "_updateWaitingPoliciesArray:withPolicies:", v14, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 1));
}

- (void)_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:(id)a3
{
  int v4 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v4)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__AVPlayerPlaybackCoordinator__updateParticipantLimitOnFigPlaybackCoordinatorWithReason___block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v6);
  }
}

void __89__AVPlayerPlaybackCoordinator__updateParticipantLimitOnFigPlaybackCoordinatorWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWaitingPoliciesOnFigPlaybackCoordinator:*(void *)(a1 + 40)];
  id v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__AVPlayerPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke;
  v6[3] = &unk_1E57B6AA8;
  v6[4] = a3;
  v6[5] = &v7;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v6];
  id v3 = (void *)v8[5];
  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __82__AVPlayerPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 32) objectForKeyedSubscript:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke;
  v4[3] = &unk_1E57B6A38;
  v4[4] = a3;
  void v4[5] = self;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v4];
  [(AVPlayerPlaybackCoordinator *)self _updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator];
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator");
}

uint64_t __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(a2 + 40), *(void *)(a1 + 32)) & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a2 + 40)];
    [v5 removeObjectsInArray:v4];
    if ([v5 count])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2;
      v22[3] = &unk_1E57B31F8;
      v22[4] = a2;
      [v5 enumerateObjectsUsingBlock:v22];
    }

    *(void *)(a2 + 40) = [*(id *)(a1 + 32) copy];
  }
  uint64_t v16 = a1;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v17 = a2;
  uint64_t v7 = *(void **)(a2 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x1E4F21FD0];
    uint64_t v12 = *MEMORY[0x1E4F1CFD0];
    uint64_t v13 = *MEMORY[0x1E4F21FC8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((void *)&v18 + 1) + 8 * i)), v11, v12, v13, 0));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }
  return [*(id *)(v16 + 40) _updateWaitingPoliciesArray:*(void *)(v17 + 56) withPolicies:v6];
}

uint64_t __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x1E4F21FD0];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      [v10 objectForKeyedSubscript:v8];
      AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(a2);
      if (FigCFEqual()) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = 0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v10];
}

- (void)_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator
{
  id v3 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v3)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __96__AVPlayerPlaybackCoordinator__updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator__block_invoke;
    v5[3] = &unk_1E57B2228;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v5);
  }
}

void __96__AVPlayerPlaybackCoordinator__updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWaitingPoliciesOnFigPlaybackCoordinator:*(void *)(a1 + 40)];
  id v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (id)suspensionReasonsThatTriggerWaiting
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__33;
  uint64_t v9 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__AVPlayerPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke;
  v4[3] = &unk_1E57B69E8;
  v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__AVPlayerPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVPlayerPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v16__0__AVPlayerPlaybackCoordinatorStorage_8l;
  BOOL v5 = a3;
  [(AVPlayerPlaybackCoordinator *)self _storageWrite:v4];
  [(AVPlayerPlaybackCoordinator *)self _updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator];
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator");
}

uint64_t __68__AVPlayerPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 48) = *(unsigned char *)(result + 32);
  return result;
}

- (void)_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator
{
  id v3 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v3)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __95__AVPlayerPlaybackCoordinator__updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator__block_invoke;
    v5[3] = &unk_1E57B2228;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v5);
  }
}

void __95__AVPlayerPlaybackCoordinator__updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) pauseSnapsToMediaTimeOfOriginator]) {
    id v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    v6(CMBaseObject, *MEMORY[0x1E4F21F50], *v2);
  }
  uint64_t v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    CFRelease(v7);
  }
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__AVPlayerPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke;
  v4[3] = &unk_1E57B69E8;
  void v4[4] = &v5;
  [(AVPlayerPlaybackCoordinator *)self _storageRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __64__AVPlayerPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 48);
  return result;
}

- (void)_applyIntegratedTimelineSeek:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(&v19, 0, sizeof(v19));
  CMTimeMake(&v19, 1, 10);
  uint64_t v5 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)&v18.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  v18.CMTimeEpoch epoch = epoch;
  if (a3->var2)
  {
    if (![(AVPlayerPlaybackCoordinator *)self integratedTimeline]) {
      [(AVPlayerPlaybackCoordinator *)self _setIntegratedTimelineCreatingNew:0];
    }
    if ([(AVPlayerPlaybackCoordinator *)self integratedTimeline]
      && !objc_msgSend(-[AVPlayerPlaybackCoordinator suspensionReasons](self, "suspensionReasons"), "count"))
    {
      if (objc_msgSend(-[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline"), "_getPendingSeekID"))
      {
        id v7 = [(AVPlayerPlaybackCoordinator *)self integratedTimeline];
        if (v7)
        {
          [v7 _getPendingSeekTime];
          CMTimeFlags flags = lhs.flags;
          CMTimeEpoch epoch = lhs.epoch;
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          memset(&lhs, 0, sizeof(lhs));
        }
        CMTimeValue value = lhs.value;
        CMTimeScale timescale = lhs.timescale;
        if ((flags & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {
        CMTimeFlags flags = *(_DWORD *)(v5 + 12);
        if ((flags & 1) == 0)
        {
LABEL_13:
          id v10 = [(AVPlayerPlaybackCoordinator *)self integratedTimeline];
          if (v10)
          {
            [v10 currentTime];
            CMTimeFlags flags = lhs.flags;
            CMTimeEpoch epoch = lhs.epoch;
          }
          else
          {
            CMTimeEpoch epoch = 0;
            CMTimeFlags flags = 0;
            memset(&lhs, 0, sizeof(lhs));
          }
          CMTimeValue v22 = lhs.value;
          CMTimeScale v9 = lhs.timescale;
          goto LABEL_17;
        }
      }
      CMTimeValue v22 = value;
      CMTimeScale v9 = timescale;
LABEL_17:
      CMTimeScale v23 = v9;
      CMTime lhs = (CMTime)*a3;
      rhs.CMTimeValue value = v22;
      rhs.CMTimeScale timescale = v9;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v18, &time);
      CMTime lhs = v18;
      CMTime rhs = v19;
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
        v20[0] = *MEMORY[0x1E4F33D10];
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:32];
        v20[1] = *MEMORY[0x1E4F33D08];
        v21[0] = v11;
        v21[1] = &unk_1EE5E18C0;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
        id v13 = [(AVPlayerPlaybackCoordinator *)self integratedTimeline];
        CMTime lhs = (CMTime)*a3;
        CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime v14 = rhs;
        [v13 _seekToTime:&lhs toleranceBefore:&rhs toleranceAfter:&v14 options:v12 completionHandler:0];
      }
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)networkToHostTimeOffset
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3810000000;
  id v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerPlaybackCoordinator_networkToHostTimeOffset__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __54__AVPlayerPlaybackCoordinator_networkToHostTimeOffset__block_invoke(uint64_t a1)
{
  v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  char v2 = (__n128 *)(*(void *)(a1 + 32) + 112);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 128);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)_setNetworkToHostTimeOffset
{
  unint64_t v3 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeRef v14 = 0;
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    uint64_t CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    char v8 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
    if (v8)
    {
      v8(CMBaseObject, *MEMORY[0x1E4F21F48], *MEMORY[0x1E4F1CF80], &v14);
      if (v14)
      {
        CFTypeID v9 = CFGetTypeID(v14);
        if (v9 == CFDictionaryGetTypeID()) {
          CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v14);
        }
      }
    }
    ivarAccessQueue = self->_ivarAccessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__AVPlayerPlaybackCoordinator__setNetworkToHostTimeOffset__block_invoke;
    v11[3] = &unk_1E57B3FC0;
    void v11[4] = self;
    CMTime v12 = v13;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v11);
    if (v14) {
      CFRelease(v14);
    }
    CFRelease(v4);
  }
}

__n128 __58__AVPlayerPlaybackCoordinator__setNetworkToHostTimeOffset__block_invoke(uint64_t a1)
{
  v1 = (__n128 *)(*(void *)(a1 + 32) + 112);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  __n128 *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_convertToMediaTimeForTime:(SEL)a3 withNetworkTime:(id *)a4 rate:(id)a5
{
  *(void *)&v28.CMTimeScale timescale = 0;
  uint64_t v10 = MEMORY[0x1E4F1F9F8];
  long long v11 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
  int64_t v12 = *(void *)(v10 + 16);
  retstr->int64_t var3 = v12;
  v28.CMTimeValue value = 0;
  v28.CMTimeEpoch epoch = 0;
  if (self)
  {
    long long v18 = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self networkToHostTimeOffset];
    long long v11 = v18;
  }
  *(_OWORD *)&v27.CMTimeValue value = v11;
  v27.CMTimeEpoch epoch = v12;
  *(_OWORD *)&v26.CMTimeValue value = v11;
  v26.CMTimeEpoch epoch = v12;
  *(_OWORD *)&v25.CMTimeValue value = v11;
  v25.CMTimeEpoch epoch = v12;
  CMTimeScale v23 = 0;
  CMTimeValue value = 0;
  if (a5)
  {
    if (a4->var2)
    {
      CMTime v13 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CFGetTypeID(a5);
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CFDictionaryGetTypeID();
      if (v13 == self)
      {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F21F08], (const void **)&value);
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F21F10], (const void **)&v23);
        FigCFNumberGetUInt64();
        FigCFNumberGetUInt64();
        FigTimeOfDayTimeFromNTPTimestamp();
        CMTime lhs = v28;
        CMTime rhs = v27;
        CMTimeAdd(&v26, &lhs, &rhs);
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v25, HostTimeClock);
        CMTime lhs = v26;
        CMTime rhs = v25;
        self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&lhs, &rhs);
        if ((self & 0x80000000) != 0)
        {
          [a6 floatValue];
          Float64 v17 = v16;
          CMTime lhs = v25;
          CMTime rhs = v26;
          CMTimeSubtract(&time, &lhs, &rhs);
          CMTimeMultiplyByFloat64(&v20, &time, v17);
          CMTime rhs = (CMTime)*a4;
          self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&lhs, &rhs, &v20);
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&lhs.value;
          CMTimeEpoch epoch = lhs.epoch;
        }
        else
        {
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
          CMTimeEpoch epoch = a4->var3;
        }
        retstr->int64_t var3 = epoch;
      }
    }
  }
  return self;
}

- (void)_applyAdjustedIntegratedSeekTimeFromTime:(id *)a3 withNetworkTime:(id)a4 rate:(id)a5
{
  if (self)
  {
    [(AVPlayerPlaybackCoordinator *)self networkToHostTimeOffset];
    if ((v13 & 1) == 0) {
      [(AVPlayerPlaybackCoordinator *)self _setNetworkToHostTimeOffset];
    }
    long long v11 = 0uLL;
    int64_t v12 = 0;
    long long v9 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(AVPlayerPlaybackCoordinator *)self _convertToMediaTimeForTime:&v9 withNetworkTime:a4 rate:a5];
    if (BYTE12(v11))
    {
      long long v9 = v11;
      int64_t var3 = v12;
      [(AVPlayerPlaybackCoordinator *)self _applyIntegratedTimelineSeek:&v9];
    }
  }
  else
  {
    objc_msgSend(0, "_setNetworkToHostTimeOffset", a3, a4, a5);
  }
}

- (void)_resetGroupTimelineExpectations
{
  unint64_t v3 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  id v4 = [(AVPlayerPlaybackCoordinator *)self interstitialPlaybackCoordinator];
  if (v3)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(OpaqueFigPlaybackCoordinator *))(v6 + 120);
    if (v7) {
      v7(v3);
    }
  }
  if (v4) {
    [v4 _resetGroupTimelineExpectations];
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (BOOL)isDefunct
{
  char v9 = 0;
  unint64_t v2 = [(AVPlayerPlaybackCoordinator *)self _copyFigPlaybackCoordinator];
  if (v2)
  {
    unint64_t v3 = v2;
    id v4 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    if (*v5 < 5uLL
      || (uint64_t v6 = (uint64_t (*)(OpaqueFigPlaybackCoordinator *, char *))v5[11]) == 0
      || (int v7 = v6(v3, &v9), !v9) && v7)
    {
      char v9 = 1;
    }
    CFRelease(v3);
    LOBYTE(v2) = v9 == 1;
  }
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakPrimaryPlaybackCoordinator);
  objc_destroyWeak((id *)&self->_weakPlayer);
}

@end