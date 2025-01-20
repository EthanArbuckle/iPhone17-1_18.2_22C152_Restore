@interface AVDelegatingPlaybackCoordinator
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3;
- (AVDelegatingPlaybackCoordinator)initWithPlaybackControlDelegate:(id)playbackControlDelegate;
- (BOOL)pauseSnapsToMediaTimeOfOriginator;
- (NSString)currentItemIdentifier;
- (id)_currentWaitingPoliciesArray;
- (id)_figTimelineCoordinatorConfigQueue;
- (id)_participantStateForIdentifier:(id)a3;
- (id)_transportControlStateForItemIdentifier:(id)a3;
- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3;
- (id)beginSuspensionForReason:(id)a3;
- (id)coordinationMediumDelegate;
- (id)mediumLoggingIdentifier;
- (id)otherParticipants;
- (id)participantForIdentifier:(id)a3;
- (id)participantStates;
- (id)playbackControlDelegate;
- (id)suspensionReasons;
- (id)suspensionReasonsThatTriggerWaiting;
- (id)trackedTransportControlStateDictionaries;
- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4;
- (void)_prepareToInitiatePlayback;
- (void)_removeParticipantStateWithIdentifier:(id)a3;
- (void)_removeUnusedTransportControlStates;
- (void)_replaceParticipantStates:(id)a3;
- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession;
- (void)_setWaitingPolicies:(id)a3;
- (void)_updateOtherParticipantsUsingFigParticipantUUIDs:(id)a3;
- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3;
- (void)_updateSuspensionReasons:(id)a3;
- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3;
- (void)_updateWaitingPoliciesArray:(id)a3 withPolicies:(id)a4;
- (void)applyFigPauseSnapsToMediaTimeOfOriginator;
- (void)coordinateRateChangeToRate:(float)rate options:(AVDelegatingPlaybackCoordinatorRateChangeOptions)options;
- (void)coordinateSeekToTime:(CMTime *)time options:(AVDelegatingPlaybackCoordinatorSeekOptions)options;
- (void)dealloc;
- (void)handleNewParticipantStateDictionary:(id)a3;
- (void)handleNewTransportControlStateDictionary:(id)a3;
- (void)handleRemovalOfParticipant:(id)a3;
- (void)handleReplacementParticipantStateDictionaries:(id)a3;
- (void)reapplyCurrentItemStateToPlaybackControlDelegate;
- (void)setCoordinationMediumDelegate:(id)a3;
- (void)setMediumLoggingIdentifier:(id)a3;
- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4;
- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3;
- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3;
- (void)transitionToItemWithIdentifier:(NSString *)itemIdentifier proposingInitialTimingBasedOnTimebase:(CMTimebaseRef)snapshotTimebase;
@end

@implementation AVDelegatingPlaybackCoordinator

- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v3 = (void *)[MEMORY[0x1E4F153E0] sharedInstance];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVDelegatingPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke;
  block[3] = &unk_1E57B22E0;
  block[6] = &v12;
  block[7] = &v8;
  block[4] = self;
  block[5] = v3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  int v5 = *((unsigned __int8 *)v13 + 24);
  if (*((unsigned __int8 *)v9 + 24) != v5 && v3)
  {
    uint64_t v6 = 0;
    [v3 setIsExpanseMediaSession:v5 != 0 error:&v6];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

uint64_t __79__AVDelegatingPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 88) count];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 160);
  uint64_t v3 = a1[4];
  int v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  if (*(unsigned __int8 *)(v3 + 160) != v4)
  {
    if (a1[5]) {
      *(unsigned char *)(v3 + 160) = v4;
    }
  }
  return result;
}

- (void)_prepareToInitiatePlayback
{
  v2 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  uint64_t v4 = *MEMORY[0x1E4F74AA8];
  [v2 setAttribute:v3 forKey:v4 error:0];
}

- (AVDelegatingPlaybackCoordinator)initWithPlaybackControlDelegate:(id)playbackControlDelegate
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)AVDelegatingPlaybackCoordinator;
  val = [(AVPlaybackCoordinator *)&v41 initInternal];
  if (!val) {
    return 0;
  }
  uint64_t v4 = *MEMORY[0x1E4F1CFD0];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F21ED8]];
  int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_timelineControlQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avdelegatingplaybackcoordinator.timelinecontrol", v5);
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_figTimelineCoordinatorConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avdelegatingplaybackcoordinator.figtimelinecoordinator.config", v6);
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_currentItemIDConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avdelegatingplaybackcoordinator.currentitemidentifier.config", v7);
  val->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avdelegatingplaybackcoordinator.ivars");
  objc_storeWeak((id *)&val->_delegate, playbackControlDelegate);
  val->_controlStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  val->_participantStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  val->_otherParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  val->_suspensionReasons = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  val->_participantLimitPerSuspensionReason = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  val->_suspensionReasonsThatTriggerWaiting = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime", 0);
  val->_waitingPoliciesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  val->_pauseSnapsToMediaTimeOfOriginator = 1;
  uint64_t v35 = 0;
  v36 = AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback;
  v37 = AVDelegatingPlaybackCoordinatorJumpToTimeCallback;
  v38 = AVDelegatingPlaybackCoordinatorPauseCallback;
  v39 = AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback;
  uint64_t v40 = 0;
  p_figTimelineCoordinator = &val->_figTimelineCoordinator;
  if (FigTimelineCoordinatorCreate()) {
    goto LABEL_12;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [(AVDelegatingPlaybackCoordinator *)val suspensionReasonsThatTriggerWaiting];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    uint64_t v12 = *MEMORY[0x1E4F21FD0];
    uint64_t v13 = *MEMORY[0x1E4F21FC8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((void *)&v31 + 1) + 8 * i)), v12, v4, v13, 0));
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v10);
  }
  [(AVDelegatingPlaybackCoordinator *)val _updateWaitingPoliciesArray:val->_waitingPoliciesArray withPolicies:v8];
  [(AVDelegatingPlaybackCoordinator *)val _setWaitingPolicies:val->_waitingPoliciesArray];
  location[1] = 0;
  location[2] = 0;
  location[3] = AVDelegatingPlaybackCoordinatorBroadcastTimelineStateCallback;
  location[4] = AVDelegatingPlaybackCoordinatorBroadcastParticipantStateCallback;
  location[5] = AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback;
  if (FigTimelineCoordinatorSetWeakMediumAndCallbacks())
  {
LABEL_12:

    return 0;
  }
  objc_initWeak(location, val);
  char v15 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v16 = *p_figTimelineCoordinator;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke;
  v28[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v29, location);
  val->_suspensionsChangedNotificationToken = (id)[v15 addObserverForName:*MEMORY[0x1E4F21F38] object:v16 queue:0 usingBlock:v28];
  v17 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v18 = *p_figTimelineCoordinator;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_2;
  v26[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v27, location);
  val->_participantsChangedNotificationToken = (id)[v17 addObserverForName:*MEMORY[0x1E4F21F30] object:v18 queue:0 usingBlock:v26];
  v19 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v20 = *p_figTimelineCoordinator;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_3;
  v24[3] = &unk_1E57B1EA8;
  objc_copyWeak(&v25, location);
  val->_didIssueCommandToPlaybackObjectNotificationToken = (id)[v19 addObserverForName:*MEMORY[0x1E4F21F28] object:v20 queue:0 usingBlock:v24];
  [(AVDelegatingPlaybackCoordinator *)val applyFigPauseSnapsToMediaTimeOfOriginator];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
  return val;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a2 userInfo];
  uint64_t result = [v3 objectForKey:*MEMORY[0x1E4F21F20]];
  if (result)
  {
    int v5 = (void *)result;
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          [v6 addObject:AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((void *)&v11 + 1) + 8 * v10++))];
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    return [objc_loadWeak((id *)(a1 + 32)) _updateSuspensionReasons:v6];
  }
  return result;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 userInfo];
  uint64_t result = [v3 objectForKey:*MEMORY[0x1E4F21F18]];
  if (result)
  {
    uint64_t v5 = result;
    id Weak = objc_loadWeak((id *)(a1 + 32));
    return [Weak _updateOtherParticipantsUsingFigParticipantUUIDs:v5];
  }
  return result;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification", Weak, AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification(objc_msgSend(a2, "userInfo")));
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v5 postNotification:v4];
}

- (void)dealloc
{
  if (self->_suspensionsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_suspensionsChangedNotificationToken);
  }
  if (self->_participantsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_participantsChangedNotificationToken);
  }
  if (self->_didIssueCommandToPlaybackObjectNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_didIssueCommandToPlaybackObjectNotificationToken);
  }
  timelineControlQueue = self->_timelineControlQueue;
  if (timelineControlQueue) {
    dispatch_release(timelineControlQueue);
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  if (figTimelineCoordinatorConfigQueue) {
    dispatch_release(figTimelineCoordinatorConfigQueue);
  }
  currentItemIDConfigQueue = self->_currentItemIDConfigQueue;
  if (currentItemIDConfigQueue) {
    dispatch_release(currentItemIDConfigQueue);
  }
  figTimelineCoordinator = self->_figTimelineCoordinator;
  if (figTimelineCoordinator) {
    CFRelease(figTimelineCoordinator);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVDelegatingPlaybackCoordinator;
  [(AVDelegatingPlaybackCoordinator *)&v8 dealloc];
}

- (id)playbackControlDelegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_figTimelineCoordinatorConfigQueue
{
  return self->_figTimelineCoordinatorConfigQueue;
}

- (void)coordinateRateChangeToRate:(float)rate options:(AVDelegatingPlaybackCoordinatorRateChangeOptions)options
{
}

- (void)coordinateSeekToTime:(CMTime *)time options:(AVDelegatingPlaybackCoordinatorSeekOptions)options
{
}

- (NSString)currentItemIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVDelegatingPlaybackCoordinator_currentItemIdentifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__AVDelegatingPlaybackCoordinator_currentItemIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)transitionToItemWithIdentifier:(NSString *)itemIdentifier proposingInitialTimingBasedOnTimebase:(CMTimebaseRef)snapshotTimebase
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  block[5] = itemIdentifier;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  currentItemIDConfigQueue = self->_currentItemIDConfigQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke_2;
  v8[3] = &unk_1E57B2228;
  v8[4] = self;
  v8[5] = snapshotTimebase;
  dispatch_sync(currentItemIDConfigQueue, v8);
}

uint64_t __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 144) = result;
  return result;
}

uint64_t __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  uint64_t v4 = [v2 currentItemIdentifier];
  uint64_t v5 = *(void *)(a1 + 40);
  return MEMORY[0x1F40DE6D0](v3, v4, v5);
}

- (void)reapplyCurrentItemStateToPlaybackControlDelegate
{
}

- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        id NSUUIDFromCFUUID = AVPlaybackCoordinatorGetNSUUIDFromCFUUID(*(CFUUIDRef *)(*((void *)&v25 + 1) + 8 * i));
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
        CFTypeRef cf = 0;
        FigTimelineCoordinatorCopyParticipantSnapshotForUUID();
        if (cf)
        {
          BOOL v10 = FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate() != 0;
          uint64_t v11 = (void *)FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons();
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v9 addObject:AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((void *)&v20 + 1) + 8 * j))];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
            }
            while (v13);
          }

          if (cf) {
            CFRelease(cf);
          }
        }
        else
        {
          BOOL v10 = 0;
        }
        uint64_t v16 = [[AVCoordinatedPlaybackParticipant alloc] initWithParticipantIdentifier:NSUUIDFromCFUUID readyToPlay:v10 suspensionReasons:v9];
        [v19 addObject:v16];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  return v19;
}

- (void)_updateOtherParticipantsUsingFigParticipantUUIDs:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(AVDelegatingPlaybackCoordinator *)self avfParticipantsForFigParticipantsUUIDs:a3];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVDelegatingPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = v4;
  void block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v9 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlaybackCoordinatorOtherParticipantsDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v6);
    [(AVDelegatingPlaybackCoordinator *)self _setIsInExpanseMediaPlaybackOnAVAudioSession];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __84__AVDelegatingPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke(void *a1)
{
  uint64_t result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(a1[4] + 88), a1[5]);
  if ((result & 1) == 0)
  {

    uint64_t result = [(id)a1[5] copy];
    *(void *)(a1[4] + 88) = result;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)otherParticipants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_otherParticipants__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_otherParticipants__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)participantForIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__12;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v11 = __Block_byref_object_dispose__12;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 88);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke_2;
  v4[3] = &unk_1E57B49D8;
  v4[4] = a1[5];
  id result = (id)[v2 indexOfObjectPassingTest:v4];
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id result = (id)[*(id *)(a1[4] + 88) objectAtIndexedSubscript:result];
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  }
  return result;
}

uint64_t __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqual:", *(void *)(a1 + 32));
  *a4 = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigTimelineCoordinatorGetExpectedTimeAtHostTime();
}

- (void)setCoordinationMediumDelegate:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = a3;
  block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke_2;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v6);
}

id __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (id Weak = objc_loadWeak((id *)(*(void *)(a1 + 40) + 152)), Weak == *(id *)(a1 + 32)))
  {
    id v3 = Weak;
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 96) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 104) removeAllObjects];
    id v3 = *(void **)(a1 + 32);
  }
  id v4 = (id *)(*(void *)(a1 + 40) + 152);
  return objc_storeWeak(v4, v3);
}

void __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke_2(uint64_t a1)
{
  CFUUIDRef CFUUIDFromNSUUID = AVPlaybackCoordinatorCreateCFUUIDFromNSUUID((CFUUIDRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "coordinationMediumDelegate"), "localParticipantUUIDForPlaybackCoordinator:", *(void *)(a1 + 32)));
  FigTimelineCoordinatorHandleAssignmentOfUUIDToLocalParticipantByMedium();
  if (CFUUIDFromNSUUID)
  {
    CFRelease(CFUUIDFromNSUUID);
  }
}

- (id)coordinationMediumDelegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AVDelegatingPlaybackCoordinator_coordinationMediumDelegate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __61__AVDelegatingPlaybackCoordinator_coordinationMediumDelegate__block_invoke(uint64_t a1)
{
  id result = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setMediumLoggingIdentifier:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AVDelegatingPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  void v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __62__AVDelegatingPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 40) + 168);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 32) copy];
    *(void *)(*(void *)(v2 + 40) + 168) = result;
  }
  return result;
}

- (id)mediumLoggingIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVDelegatingPlaybackCoordinator_mediumLoggingIdentifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVDelegatingPlaybackCoordinator_mediumLoggingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)trackedTransportControlStateDictionaries
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__AVDelegatingPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__AVDelegatingPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3
{
  uint64_t v5 = objc_msgSend(-[AVDelegatingPlaybackCoordinator coordinationMediumDelegate](self, "coordinationMediumDelegate"), "localParticipantUUIDForPlaybackCoordinator:", self);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__AVDelegatingPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = a3;
  block[5] = self;
  void block[6] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __99__AVDelegatingPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Identifier"];
  id v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 96) objectForKeyedSubscript:v2];
  if (!v3
    || (id v4 = v3,
        int v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"LamportTimestamp"), "intValue"),
        int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"LamportTimestamp"), "intValue"), (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"IsAuthoritative"), "BOOLValue") & 1) != 0)|| v6 > v5)
  {
LABEL_9:
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 96);
    [v11 setObject:v10 forKeyedSubscript:v2];
    return;
  }
  if (v6 == v5)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(v4, "objectForKeyedSubscript:", @"OriginatorUUID"));
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"OriginatorUUID"));
    uint64_t v9 = [v8 compare:v7];
    if (v9 != 1)
    {
      if (!v9)
      {
        if ([v8 isEqual:*(void *)(a1 + 48)]) {
          goto LABEL_8;
        }
        if (dword_1EB2D3960)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }

      return;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (dword_1EB2D3960)
  {
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (id)_transportControlStateForItemIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__12;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v11 = __Block_byref_object_dispose__12;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AVDelegatingPlaybackCoordinator__transportControlStateForItemIdentifier___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  void block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__AVDelegatingPlaybackCoordinator__transportControlStateForItemIdentifier___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]), "copy");
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeUnusedTransportControlStates
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 96) allKeys];
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) allValues];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2;
        v9[3] = &unk_1E57B4A00;
        v9[4] = v8;
        if ([v3 indexOfObjectPassingTest:v9] == 0x7FFFFFFFFFFFFFFFLL) {
          [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CurrentIdentifier"), "isEqualToString:", *(void *)(a1 + 32));
  *a4 = result;
  return result;
}

- (id)participantStates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  long long v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_participantStates__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_participantStates__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__AVDelegatingPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __89__AVDelegatingPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = [v1 objectForKeyedSubscript:@"UUID"];
  return [v2 setObject:v1 forKeyedSubscript:v3];
}

- (id)_participantStateForIdentifier:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  long long v10 = __Block_byref_object_copy__12;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v11 = __Block_byref_object_dispose__12;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVDelegatingPlaybackCoordinator__participantStateForIdentifier___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a3;
  void block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __66__AVDelegatingPlaybackCoordinator__participantStateForIdentifier___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]), "copy");
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeParticipantStateWithIdentifier:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__AVDelegatingPlaybackCoordinator__removeParticipantStateWithIdentifier___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __73__AVDelegatingPlaybackCoordinator__removeParticipantStateWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v2 = [*(id *)(a1 + 40) UUIDString];
  return [v1 removeObjectForKey:v2];
}

- (void)_replaceParticipantStates:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__AVDelegatingPlaybackCoordinator__replaceParticipantStates___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __61__AVDelegatingPlaybackCoordinator__replaceParticipantStates___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", *(void *)(*((void *)&v7 + 1) + 8 * v6), objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "objectForKeyedSubscript:", @"UUID"));
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  -[AVDelegatingPlaybackCoordinator _updateTransportControlStateDictionaryWithTransportControlState:](self, "_updateTransportControlStateDictionaryWithTransportControlState:");
  uint64_t v5 = [a3 objectForKeyedSubscript:@"Identifier"];
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AVDelegatingPlaybackCoordinator_handleNewTransportControlStateDictionary___block_invoke;
  v7[3] = &unk_1E57B2098;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __76__AVDelegatingPlaybackCoordinator_handleNewTransportControlStateDictionary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _transportControlStateForItemIdentifier:*(void *)(a1 + 40)];
  uint64_t result = FigTimelineCoordinatorHandleUpdatedTimelineStateFromMedium();
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  -[AVDelegatingPlaybackCoordinator _updateParticipantStateDictionaryWithParticipantState:](self, "_updateParticipantStateDictionaryWithParticipantState:");
  [(AVDelegatingPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"UUID"];
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__AVDelegatingPlaybackCoordinator_handleNewParticipantStateDictionary___block_invoke;
  v7[3] = &unk_1E57B2098;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __71__AVDelegatingPlaybackCoordinator_handleNewParticipantStateDictionary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _participantStateForIdentifier:*(void *)(a1 + 40)];
  uint64_t result = FigTimelineCoordinatorHandleUpdatedParticipantStateFromMedium();
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleReplacementParticipantStateDictionaries:(id)a3
{
  [(AVDelegatingPlaybackCoordinator *)self _replaceParticipantStates:a3];
  [(AVDelegatingPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AVDelegatingPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, block);
}

uint64_t __81__AVDelegatingPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "participantStates"), "allValues");
  uint64_t result = FigTimelineCoordinatorHandleReplacementOfAllParticipantStatesFromMedium();
  if (result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleRemovalOfParticipant:(id)a3
{
  -[AVDelegatingPlaybackCoordinator _removeParticipantStateWithIdentifier:](self, "_removeParticipantStateWithIdentifier:");
  [(AVDelegatingPlaybackCoordinator *)self _removeUnusedTransportControlStates];
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__AVDelegatingPlaybackCoordinator_handleRemovalOfParticipant___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v6);
}

void __62__AVDelegatingPlaybackCoordinator_handleRemovalOfParticipant___block_invoke(uint64_t a1)
{
  CFUUIDRef CFUUIDFromNSUUID = AVPlaybackCoordinatorCreateCFUUIDFromNSUUID(*(CFUUIDRef *)(a1 + 32));
  FigTimelineCoordinatorHandleRemovalOfParticipantStateFromMedium();
  if (CFUUIDFromNSUUID)
  {
    CFRelease(CFUUIDFromNSUUID);
  }
}

- (void)_updateSuspensionReasons:(id)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  ivarAccessQueue = self->_ivarAccessQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVDelegatingPlaybackCoordinator__updateSuspensionReasons___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __60__AVDelegatingPlaybackCoordinator__updateSuspensionReasons___block_invoke(void *a1)
{
  uint64_t result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(a1[4] + 80), a1[5]);
  if ((result & 1) == 0)
  {

    uint64_t result = [(id)a1[5] copy];
    *(void *)(a1[4] + 80) = result;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)suspensionReasons
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  char v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_suspensionReasons__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_suspensionReasons__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)beginSuspensionForReason:(id)a3
{
  id v3 = [[AVCoordinatedPlaybackSuspension alloc] initWithCoordinator:self reason:a3];
  [(AVCoordinatedPlaybackSuspension *)v3 _figSuspension];
  FigTimelineCoordinatorBeginSuspension();
  return v3;
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
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
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
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

- (id)_currentWaitingPoliciesArray
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVDelegatingPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVDelegatingPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 128) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setWaitingPolicies:(id)a3
{
}

- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke;
  block[3] = &unk_1E57B2270;
  block[4] = self;
  void block[5] = a4;
  void block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke_2;
  v7[3] = &unk_1E57B1E80;
  v7[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", *(void *)(a1 + 48)), *(void *)(a1 + 40));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 120) containsObject:*(void *)(a1 + 40)];
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v4 = AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(a1 + 40));
  uint64_t v5 = *MEMORY[0x1E4F21FD0];
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v2) {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v7 = *v6;
  uint64_t v8 = *MEMORY[0x1E4F21FC8];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v7, v8, v9, *MEMORY[0x1E4F21FC0], 0);
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[16];
  v14[0] = v10;
  return objc_msgSend(v11, "_updateWaitingPoliciesArray:withPolicies:", v12, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1));
}

uint64_t __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _currentWaitingPoliciesArray];
  return [v1 _setWaitingPolicies:v2];
}

- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  ivarAccessQueue = self->_ivarAccessQueue;
  uint64_t v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVDelegatingPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a3;
  void block[6] = &v8;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  uint64_t v4 = (void *)v9[5];
  if (v4) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __86__AVDelegatingPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 112) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_3;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v6);
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(void *)(*(void *)(a1 + 32) + 120), *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v2 = AVPlaybackCoordinatorArrayMinusArray(*(void *)(*(void *)(a1 + 32) + 120), *(void *)(a1 + 40));
    if ([v2 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2;
      v18[3] = &unk_1E57B31F8;
      v18[4] = *(void *)(a1 + 32);
      [v2 enumerateObjectsUsingBlock:v18];
    }

    *(void *)(*(void *)(a1 + 32) + 120) = [*(id *)(a1 + 40) copy];
  }
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v13 = a1;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F21FD0];
    uint64_t v9 = *MEMORY[0x1E4F1CFD0];
    uint64_t v10 = *MEMORY[0x1E4F21FC8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((void *)&v14 + 1) + 8 * i)), v8, v9, v10, 0));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }
  return [*(id *)(v13 + 32) _updateWaitingPoliciesArray:*(void *)(*(void *)(v13 + 32) + 128) withPolicies:v3];
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 128);
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
  return [*(id *)(*(void *)(a1 + 32) + 128) removeObject:v10];
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _currentWaitingPoliciesArray];
  return [v1 _setWaitingPolicies:v2];
}

- (id)suspensionReasonsThatTriggerWaiting
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AVDelegatingPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__AVDelegatingPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 120) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)applyFigPauseSnapsToMediaTimeOfOriginator
{
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVDelegatingPlaybackCoordinator_applyFigPauseSnapsToMediaTimeOfOriginator__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, block);
}

uint64_t __76__AVDelegatingPlaybackCoordinator_applyFigPauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pauseSnapsToMediaTimeOfOriginator];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  uint64_t v4 = *MEMORY[0x1E4F21F50];
  int v5 = [v2 pauseSnapsToMediaTimeOfOriginator];
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v5) {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v7 = *v6;
  return MEMORY[0x1F40DE708](v3, v4, v7);
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVDelegatingPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  [(AVDelegatingPlaybackCoordinator *)self applyFigPauseSnapsToMediaTimeOfOriginator];
}

uint64_t __72__AVDelegatingPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 136) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVDelegatingPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVDelegatingPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 136);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinationMediumDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end