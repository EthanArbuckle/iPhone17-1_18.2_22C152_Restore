@interface MPCQueueController
+ (BOOL)isSupportedSessionType:(id)a3 forEngine:(id)a4 reason:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (Class)testBehaviorClass;
+ (id)allKnownSessionTypes;
+ (id)describePlayer:(id)a3;
+ (int64_t)behaviorForQueue:(id)a3;
+ (void)registerPublisher:(id)a3;
+ (void)setTestBehaviorClass:(Class)a3;
+ (void)unregisterPublisher:(id)a3;
- (BOOL)_playerItemDidBecomeActiveWithContentItemID:(id)a3;
- (BOOL)_withRestorableBehavior:(id)a3;
- (BOOL)_withTransportableBehavior:(id)a3;
- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canNextTrackForContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canPreviousTrackForContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)containsRestorableContent;
- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 reason:(id *)a5;
- (MPAVItem)currentItem;
- (MPCPlaybackEngineEventStream)eventStream;
- (MPCPlaybackIntent)fallbackPlaybackIntent;
- (MPCQueueController)init;
- (MPCQueueController)initWithBehaviorType:(int64_t)a3 sessionID:(id)a4;
- (MPCQueueController)initWithCoder:(id)a3;
- (MPCQueueControllerBehavior)behavior;
- (MPCQueueControllerBehaviorImplementation)behaviorImpl;
- (MPCQueueControllerBehaviorMusic)music;
- (MPCQueueControllerBehaviorMusicSharePlay)musicSharePlay;
- (MPCQueueControllerDelegate)delegate;
- (MPCQueueControllerPlaybackEngine)playbackEngine;
- (MPCQueueControllerReusableBehavior)reusableBehavior;
- (MPCQueueControllerUpNextBehavior)upNextBehavior;
- (NSMapTable)activeEdits;
- (NSMutableArray)potentialCurrentItemEdits;
- (NSMutableDictionary)coderVersions;
- (NSString)debugDescription;
- (NSString)engineID;
- (NSString)loadingContentItemID;
- (NSString)playerID;
- (NSString)preferredFirstContentItemID;
- (NSString)restoreLastStartTimePositionToContentItemID;
- (NSString)revisionString;
- (NSString)sessionID;
- (NSString)targetContentItemID;
- (double)lastSavedTime;
- (id)_contentItemIDWithOffset:(int64_t)a3 fromItemID:(id)a4 mode:(int64_t)a5 didReachEnd:(BOOL *)a6;
- (id)_itemForContentItemID:(id)a3 allowReuse:(BOOL)a4;
- (id)_stateDictionaryIncludingQueue:(BOOL)a3;
- (id)beginEditWithReason:(id)a3;
- (id)beginExternalSyncEditWithReason:(id)a3;
- (id)contentItemIDAtIndex:(int64_t)a3;
- (id)contentItemIDWithCurrentItemOffset:(int64_t)a3 mode:(int64_t)a4 didReachEnd:(BOOL *)a5;
- (id)contentItemIDWithoutRepeatIteration:(id)a3;
- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 mode:(int64_t)a5 nowPlayingIndex:(int64_t *)a6;
- (id)itemForContentItemID:(id)a3;
- (id)segmentForCodingKey:(id)a3;
- (int64_t)behaviorType;
- (int64_t)displayIndexForContentItemID:(id)a3;
- (int64_t)displayItemCount;
- (int64_t)targetContentItemSource;
- (int64_t)versionForSegment:(id)a3;
- (void)_commitEdit:(id)a3;
- (void)_currentItemDidChangeFromItem:(id)a3 toItem:(id)a4;
- (void)_emitEventsForItemChangeFromItem:(id)a3 toCurrentItem:(id)a4;
- (void)_evaluateContextAwareTriggersWithReason:(id)a3;
- (void)_evaluateCurrentItemWithEdit:(id)a3;
- (void)_rollbackEdit:(id)a3;
- (void)_setTargetContentItemID:(id)a3 source:(int64_t)a4;
- (void)_updateQueueIndexForItemIfNeeded:(id)a3;
- (void)_withDynamicBehavior:(id)a3;
- (void)_withExternalSyncBehavior:(id)a3;
- (void)_withUpNextBehavior:(id)a3;
- (void)behaviorDidChange;
- (void)dealloc;
- (void)didConnectToPlaybackEngine:(id)a3;
- (void)didDisconnectFromPlaybackEngine:(id)a3;
- (void)didRestoreVersion:(int64_t)a3 forSegment:(id)a4;
- (void)didSignificantlyChangeItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4;
- (void)enumerateContentItemIDsInMode:(int64_t)a3 block:(id)a4;
- (void)finalizeStateRestorationWithLoadingItemReady:(id)a3 completion:(id)a4;
- (void)incrementVersionForSegment:(id)a3;
- (void)jumpToContentItemID:(id)a3;
- (void)jumpToContentItemID:(id)a3 direction:(int64_t)a4;
- (void)jumpToFirstContentItemWithSource:(int64_t)a3;
- (void)performAfterEdits:(id)a3;
- (void)performAllowingEditsToChangeCurrentItem:(id)a3;
- (void)performSetQueue:(id)a3 loadingItemReady:(id)a4 completion:(id)a5;
- (void)playerItemDidBecomeCurrent:(id)a3;
- (void)setActiveEdits:(id)a3;
- (void)setBehaviorImpl:(id)a3;
- (void)setCoderVersions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoadingContentItemID:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPotentialCurrentItemEdits:(id)a3;
- (void)setRestoreLastStartTimePositionToContentItemID:(id)a3;
- (void)upNextBehaviorDidChange;
- (void)willConnectToPlaybackEngine:(id)a3;
- (void)willDisconnectFromPlaybackEngine:(id)a3;
@end

@implementation MPCQueueController

uint64_t __42__MPCQueueController_allKnownSessionTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allKnownSessionTypes];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupportedSessionType:(id)a3 forEngine:(id)a4 reason:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[_MPCQueueControllerRegistry shared];
  v10 = [v9 transportableExtensions];

  for (unint64_t i = 0; i != 6; ++i)
  {
    v12 = NSMapGet(v10, (const void *)i);
    v13 = [v12 allKnownSessionTypes];
    if ([v13 containsObject:v7])
    {
      if (+[MPCPlaybackEngine isSystemMusic]) {
        BOOL v15 = i >= 4;
      }
      else {
        BOOL v15 = 0;
      }
      if (!v15 || i == 5)
      {
        if (!+[MPCPlaybackEngine isSystemPodcasts]
          || i <= 5 && ((1 << i) & 0x33) != 0)
        {
          char v14 = [v12 isSupportedSessionType:v7 reason:a5];
LABEL_18:

          goto LABEL_19;
        }
        if (a5)
        {
          v18 = NSString;
          if (i - 2 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"unknown/%lld", i);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = off_2643C2D20[i - 2];
          }
          [v18 stringWithFormat:@"behavior[%@] unavailable in SystemPodcastsApplication", v19];
          goto LABEL_32;
        }
      }
      else if (a5)
      {
        v20 = NSString;
        if (i == 4)
        {
          v19 = @"podcasts";
        }
        else if (i == 5)
        {
          v19 = @"test";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"unknown/%lld", i);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v20 stringWithFormat:@"behavior[%@] unavailable in SystemMusicApplication", v19];
LABEL_32:
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      char v14 = 0;
      goto LABEL_18;
    }
  }
  char v14 = 0;
  if (a5) {
    *a5 = @"unknown sessionType [QC]";
  }
LABEL_19:

  return v14;
}

- (void)finalizeStateRestorationWithLoadingItemReady:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v6 = (void (**)(void))a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19687;
  v34 = __Block_byref_object_dispose__19688;
  id v35 = 0;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke;
  v25 = &unk_2643C2B38;
  v29 = &v30;
  v26 = self;
  id v9 = WeakRetained;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  if ([(MPCQueueController *)self _withRestorableBehavior:&v22])
  {
    v11 = (void *)v31[5];
    if (v11)
    {
      v12 = v11;
      p_loadingContentItemID = &self->_loadingContentItemID;
      loadingContentItemID = self->_loadingContentItemID;
      self->_loadingContentItemID = v12;
    }
    else
    {
      loadingContentItemID = [(MPCQueueController *)self sessionID];
      v16 = [@"♻️-" stringByAppendingString:loadingContentItemID];
      p_loadingContentItemID = &self->_loadingContentItemID;
      v17 = self->_loadingContentItemID;
      self->_loadingContentItemID = v16;
    }
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v9 engineID];
      v20 = [(MPCQueueController *)self sessionID];
      v21 = *p_loadingContentItemID;
      *(_DWORD *)buf = 138543874;
      v37 = v19;
      __int16 v38 = 2114;
      v39 = v20;
      __int16 v40 = 2114;
      v41 = v21;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] finalizeStateRestorationWithLoadingItemReady:… | updating loading content item [] loadingContentItemID=%{public}@", buf, 0x20u);
    }
    v6[2](v6);
  }
  else
  {
    BOOL v15 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 59, @"State restoration is not supported", v22, v23, v24, v25, v26, v27);
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
  _Block_object_dispose(&v30, 8);
}

- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 mode:(int64_t)a5 nowPlayingIndex:(int64_t *)a6
{
  v32[1] = *MEMORY[0x263EF8340];
  if (self->_loadingContentItemID)
  {
    *a6 = 0;
    v32[0] = self->_loadingContentItemID;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    p_targetContentItemID = (NSString **)v32;
LABEL_7:
    v16 = objc_msgSend(v8, "arrayWithObjects:count:", p_targetContentItemID, 1, a5);
    goto LABEL_8;
  }
  char v14 = self->_targetContentItemID;
  if ([(NSString *)v14 hasPrefix:@"⏳"])
  {

LABEL_6:
    *a6 = 0;
    targetContentItemID = self->_targetContentItemID;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    p_targetContentItemID = &targetContentItemID;
    goto LABEL_7;
  }
  BOOL v15 = [(NSString *)v14 hasPrefix:@"♻️"];

  if (v15) {
    goto LABEL_6;
  }
  if (self->_targetContentItemID)
  {
    if (!(a4 | a3))
    {
      *a6 = 0;
      uint64_t v30 = self->_targetContentItemID;
      id v8 = (void *)MEMORY[0x263EFF8C0];
      p_targetContentItemID = &v30;
      goto LABEL_7;
    }
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
    v18 = [MEMORY[0x263EFF980] arrayWithCapacity:a4 - a3 + 1];
    if (a3 < 0)
    {
      v19 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:self->_targetContentItemID mode:a5 options:1];
      if (v19 && -a3 >= 1)
      {
        unint64_t v20 = 0;
        unint64_t v29 = -(a4 & (a4 >> 63));
        do
        {
          uint64_t v21 = objc_msgSend(v19, "nextObject", v29);
          if (!v21) {
            break;
          }
          uint64_t v22 = (void *)v21;
          if (v20 >= v29) {
            [v18 insertObject:v21 atIndex:0];
          }

          ++v20;
        }
        while (-a3 != v20);
      }
    }
    if (a3 <= 0 && (a4 & 0x8000000000000000) == 0)
    {
      *a6 = [v18 count];
      if (!self->_targetContentItemID)
      {
        id v28 = [MEMORY[0x263F08690] currentHandler];
        [v28 handleFailureInMethod:a2 object:self file:@"MPCQueueController.m" lineNumber:598 description:@"ContentItemID was nil [current item]"];
      }
      objc_msgSend(v18, "addObject:");
    }
    if (a4 >= 1)
    {
      uint64_t v23 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:self->_targetContentItemID mode:a5 options:0];
      unint64_t v24 = 0;
      unint64_t v25 = a3 & ~(a3 >> 63);
      do
      {
        uint64_t v26 = [v23 nextObject];
        if (!v26) {
          break;
        }
        id v27 = (void *)v26;
        if (v24 >= v25) {
          [v18 addObject:v26];
        }
        ++v24;
      }
      while (a4 != v24);
    }
    v16 = (void *)[v18 copy];
  }
  else
  {
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_8:

  return v16;
}

- (MPCQueueControllerBehaviorImplementation)behaviorImpl
{
  return self->_behaviorImpl;
}

- (void)playerItemDidBecomeCurrent:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 contentItemID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [WeakRetained engineID];
    id v9 = [(MPCQueueController *)self sessionID];
    int v10 = 138543874;
    v11 = v8;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2114;
    BOOL v15 = v5;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] playerItemDidBecomeCurrent:%{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([(MPCQueueController *)self _playerItemDidBecomeActiveWithContentItemID:v5])
  {
    [(MPCQueueController *)self _currentItemDidChangeFromItem:self->_currentItem toItem:v4];
  }
}

- (BOOL)_playerItemDidBecomeActiveWithContentItemID:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v7 = [(MPCQueueController *)self targetContentItemID];
  if (v7 == v5)
  {
  }
  else
  {
    int v8 = [v5 isEqual:v7];

    if (!v8)
    {
      id v9 = [(MPCQueueController *)self delegate];
      if (self->_loadingContentItemID)
      {
        int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [WeakRetained engineID];
          __int16 v12 = [(MPCQueueController *)self sessionID];
          loadingContentItemID = self->_loadingContentItemID;
          int64_t syncResetAttempts = self->_syncResetAttempts;
          *(_DWORD *)buf = 138544386;
          id v35 = v11;
          __int16 v36 = 2114;
          v37 = v12;
          __int16 v38 = 2114;
          id v39 = v5;
          __int16 v40 = 2114;
          v41 = loadingContentItemID;
          __int16 v42 = 2048;
          int64_t v43 = syncResetAttempts;
          _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | resetting player [unexpected transition, loading] expectedNextTargetID=%{public}@ attempts=%ld", buf, 0x34u);
        }
        int64_t v15 = self->_syncResetAttempts;
        self->_int64_t syncResetAttempts = v15 + 1;
        if (v15 >= 4)
        {
          v31 = [MEMORY[0x263F08690] currentHandler];
          [v31 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1010, @"MF did not synchronize within 5 resets: %@ != %@", v5, self->_loadingContentItemID object file lineNumber description];
        }
        [v9 queueController:self didDetectMismatchForActiveContentItemID:v5 targetContentItemID:self->_loadingContentItemID];
        BOOL v16 = 0;
        goto LABEL_25;
      }
      char v33 = 0;
      [(MPCQueueController *)self contentItemIDWithCurrentItemOffset:v5 != 0 mode:3 didReachEnd:&v33];
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 == v5)
      {
      }
      else
      {
        int v21 = [v5 isEqual:v20];

        if (!v21)
        {
          uint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [WeakRetained engineID];
            unint64_t v24 = [(MPCQueueController *)self sessionID];
            int64_t v25 = self->_syncResetAttempts;
            *(_DWORD *)buf = 138544386;
            id v35 = v23;
            __int16 v36 = 2114;
            v37 = v24;
            __int16 v38 = 2114;
            id v39 = v5;
            __int16 v40 = 2114;
            v41 = (NSString *)v20;
            __int16 v42 = 2048;
            int64_t v43 = v25;
            _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | resetting player [unexpected transition] expectedNextTargetID=%{public}@ attempts=%ld", buf, 0x34u);
          }
          int64_t v26 = self->_syncResetAttempts;
          self->_int64_t syncResetAttempts = v26 + 1;
          if (v26 >= 4)
          {
            uint64_t v32 = [MEMORY[0x263F08690] currentHandler];
            [v32 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1026, @"MF did not synchronize within 5 resets: %@ != %@", v5, v20 object file lineNumber description];
          }
          [v9 queueController:self didDetectMismatchForActiveContentItemID:v5 targetContentItemID:v20];
          BOOL v16 = v33 != 0;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
      }
      id v27 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [WeakRetained engineID];
        unint64_t v29 = [(MPCQueueController *)self sessionID];
        *(_DWORD *)buf = 138543874;
        id v35 = v28;
        __int16 v36 = 2114;
        v37 = v29;
        __int16 v38 = 2114;
        id v39 = v5;
        _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | updating target [expected natural transition]", buf, 0x20u);
      }
      [(MPCQueueController *)self _setTargetContentItemID:v5 source:3];
      self->_int64_t syncResetAttempts = 0;
      BOOL v16 = 1;
      goto LABEL_24;
    }
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [WeakRetained engineID];
    v19 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138544130;
    id v35 = v18;
    __int16 v36 = 2114;
    v37 = v19;
    __int16 v38 = 2114;
    id v39 = v5;
    __int16 v40 = 2114;
    v41 = (NSString *)v7;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | achieved sync [] targetItemID=%{public}@", buf, 0x2Au);
  }
  self->_int64_t syncResetAttempts = 0;
  BOOL v16 = 1;
LABEL_26:

  return v16;
}

- (NSString)targetContentItemID
{
  loadingContentItemID = self->_loadingContentItemID;
  if (!loadingContentItemID) {
    loadingContentItemID = self->_targetContentItemID;
  }
  return loadingContentItemID;
}

- (void)_currentItemDidChangeFromItem:(id)a3 toItem:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [WeakRetained engineID];
    v11 = [(MPCQueueController *)self sessionID];
    __int16 v12 = [v6 contentItemID];
    v13 = [v7 contentItemID];
    int v33 = 138544130;
    v34 = v10;
    __int16 v35 = 2114;
    __int16 v36 = v11;
    __int16 v37 = 2114;
    __int16 v38 = v12;
    __int16 v39 = 2114;
    __int16 v40 = v13;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | emitting events for item change", (uint8_t *)&v33, 0x2Au);
  }
  [(MPCQueueController *)self _emitEventsForItemChangeFromItem:v6 toCurrentItem:v7];
  __int16 v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = [WeakRetained engineID];
    BOOL v16 = [(MPCQueueController *)self sessionID];
    v17 = [v6 contentItemID];
    v18 = [v7 contentItemID];
    int v33 = 138544130;
    v34 = v15;
    __int16 v35 = 2114;
    __int16 v36 = v16;
    __int16 v37 = 2114;
    __int16 v38 = v17;
    __int16 v39 = 2114;
    __int16 v40 = v18;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | updating current item", (uint8_t *)&v33, 0x2Au);
  }
  [(MPAVItem *)self->_currentItem setObserver:0];
  objc_storeStrong((id *)&self->_currentItem, a4);
  [(MPAVItem *)self->_currentItem setObserver:self];
  if (v6
    && [v6 isPlaceholder]
    && [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl playbackPositionRestorationPolicy] == 1)
  {
    v19 = [v7 initialPlaybackStartTime];
    [v19 doubleValue];
    self->_double lastSavedTime = v20;

    int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [WeakRetained engineID];
      uint64_t v23 = [(MPCQueueController *)self sessionID];
      unint64_t v24 = [v6 contentItemID];
      int64_t v25 = [v7 contentItemID];
      double lastSavedTime = self->_lastSavedTime;
      int v33 = 138544386;
      v34 = v22;
      __int16 v35 = 2114;
      __int16 v36 = v23;
      __int16 v37 = 2114;
      __int16 v38 = v24;
      __int16 v39 = 2114;
      __int16 v40 = v25;
      __int16 v41 = 2048;
      double v42 = lastSavedTime;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | updating saved time [item changed] lastSavedTime=%f", (uint8_t *)&v33, 0x34u);
    }
  }
  [(MPCQueueController *)self _updateQueueIndexForItemIfNeeded:self->_currentItem];
  id v27 = [v6 contentItemID];
  if ([v27 hasPrefix:@"⏳"])
  {

LABEL_14:
    id v27 = 0;
LABEL_15:
    unint64_t v29 = 0;
    goto LABEL_16;
  }
  int v28 = [v27 hasPrefix:@"♻️"];

  if (v28) {
    goto LABEL_14;
  }
  if (!v27) {
    goto LABEL_15;
  }
  unint64_t v29 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl componentsForContentItemID:v27];
LABEL_16:
  uint64_t v30 = [v7 contentItemID];
  if (v30)
  {
    v31 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl componentsForContentItemID:v30];
  }
  else
  {
    v31 = 0;
  }
  int v32 = [v29 behaviorFlags];
  if (v32 != [v31 behaviorFlags]) {
    -[MPCQueueControllerBehaviorImplementation activeItemFlagsDidChange:](self->_behaviorImpl, "activeItemFlagsDidChange:", [v31 behaviorFlags]);
  }
  [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl currentItemDidChangeFromContentItemID:v27 toContentItemID:v30];
  [(MPCQueueController *)self incrementVersionForSegment:@"metadata"];
}

- (NSString)sessionID
{
  return (NSString *)[(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl sessionID];
}

- (MPAVItem)currentItem
{
  return self->_currentItem;
}

- (id)_itemForContentItemID:(id)a3 allowReuse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  if (v4)
  {
    id v7 = [(MPAVItem *)self->_currentItem contentItemID];
    int v8 = [v7 isEqual:v6];

    if (v8)
    {
      id v9 = self->_currentItem;
      goto LABEL_10;
    }
  }
  id v10 = v6;
  if ([v10 hasPrefix:@"⏳"])
  {

LABEL_9:
    id v9 = (MPAVItem *)objc_opt_new();
    __int16 v12 = [(MPCQueueController *)self sessionID];
    [(MPAVItem *)v9 setContentItemID:v10 queueSectionID:@"QC" queueItemID:v12];

    goto LABEL_10;
  }
  int v11 = [v10 hasPrefix:@"♻️"];

  if (v11) {
    goto LABEL_9;
  }
  id v9 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl _itemForContentItemID:v10];
  [(MPCQueueController *)self _updateQueueIndexForItemIfNeeded:v9];
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl playbackPositionRestorationPolicy] == 1&& self->_lastSavedTime > 0.0)
  {
    __int16 v14 = [(MPAVItem *)v9 contentItemID];
    int64_t v15 = self->_restoreLastStartTimePositionToContentItemID;
    if (v14 == v15)
    {
    }
    else
    {
      BOOL v16 = v15;
      int v17 = [(NSString *)v14 isEqual:v15];

      if (!v17) {
        goto LABEL_10;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = [WeakRetained engineID];
      int v21 = [(MPCQueueController *)self sessionID];
      double lastSavedTime = self->_lastSavedTime;
      int v25 = 138544130;
      int64_t v26 = v20;
      __int16 v27 = 2114;
      int v28 = v21;
      __int16 v29 = 2114;
      id v30 = v10;
      __int16 v31 = 2048;
      double v32 = lastSavedTime;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _itemForContentItemID:%{public}@ | restoring time [id matches last saved time ID] lastSavedTime=%g", (uint8_t *)&v25, 0x2Au);
    }
    uint64_t v23 = [NSNumber numberWithDouble:self->_lastSavedTime];
    [(MPAVItem *)v9 setInitialPlaybackStartTimeOverride:v23];

    restoreLastStartTimePositionToContentItemID = self->_restoreLastStartTimePositionToContentItemID;
    self->_restoreLastStartTimePositionToContentItemID = 0;

    self->_double lastSavedTime = 0.0;
  }
LABEL_10:

  return v9;
}

- (id)itemForContentItemID:(id)a3
{
  return [(MPCQueueController *)self _itemForContentItemID:a3 allowReuse:1];
}

- (NSString)engineID
{
  v2 = [(MPCQueueController *)self playbackEngine];
  v3 = [v2 engineID];

  return (NSString *)v3;
}

- (MPCQueueControllerPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCQueueControllerPlaybackEngine *)WeakRetained;
}

- (void)_updateQueueIndexForItemIfNeeded:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 isRadioItem] & 1) == 0
    && ([(id)objc_opt_class() isPlaceholder] & 1) == 0)
  {
    id v6 = [v5 contentItemID];
    id v7 = self->_targetContentItemID;
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = v7;
      int v9 = [(NSString *)v6 isEqual:v7];

      if (!v9) {
        goto LABEL_21;
      }
    }
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    __int16 v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "qc:_updateContentItemQueueIndexForItem", "", (uint8_t *)&v25, 2u);
    }

    __int16 v14 = [v5 contentItemID];
    int64_t v15 = [(MPCQueueController *)self displayIndexForContentItemID:v14];

    uint64_t v16 = [(MPCQueueController *)self displayItemCount];
    int v17 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    if (v16 >= 1)
    {
      v18 = [NSNumber numberWithInteger:v16];
      [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F54C30]];
    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = [NSNumber numberWithInteger:v15];
      [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x263F54BE8]];
    }
    if ([v17 count])
    {
      id v20 = objc_alloc(MEMORY[0x263F120F8]);
      int v21 = [v5 contentItemID];
      uint64_t v22 = (void *)[v20 initWithIdentifier:v21];

      [v22 setNowPlayingInfo:v17];
    }
    uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    unint64_t v24 = v23;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = 134218240;
      int64_t v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = v16;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v24, OS_SIGNPOST_INTERVAL_END, v11, "qc:_updateContentItemQueueIndexForItem", "index=%ld count=%ld", (uint8_t *)&v25, 0x16u);
    }
  }
LABEL_21:
}

- (int64_t)displayItemCount
{
  v2 = [(MPCQueueController *)self upNextBehavior];
  int64_t v3 = [v2 displayItemCount];

  return v3;
}

- (int64_t)displayIndexForContentItemID:(id)a3
{
  id v4 = a3;
  id v5 = self->_targetContentItemID;
  id v6 = [(MPCQueueController *)self music];

  if (v6)
  {
    id v7 = [(MPCQueueController *)self music];
    int v8 = [v7 contentItemIDWithoutRepeatIteration:v4];

    int v9 = [(MPCQueueController *)self music];
    uint64_t v10 = [v9 contentItemIDWithoutRepeatIteration:v5];

    id v5 = (NSString *)v10;
  }
  else
  {
    int v8 = (NSString *)v4;
  }
  os_signpost_id_t v11 = v5;
  if (v8 == v11)
  {
  }
  else
  {
    int v12 = [(NSString *)v8 isEqual:v11];

    if (!v12)
    {
      int64_t v13 = 0;
      goto LABEL_18;
    }
  }
  __int16 v14 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:0 mode:1 options:0];
  uint64_t v15 = [v14 nextObject];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    int64_t v13 = 0;
    while (1)
    {
      int v17 = v16;
      if (v8 == v17) {
        break;
      }
      v18 = v17;
      char v19 = [(NSString *)v8 isEqual:v17];

      if (v19) {
        goto LABEL_16;
      }
      ++v13;
      uint64_t v16 = [v14 nextObject];

      if (!v16)
      {
        v18 = 0;
        goto LABEL_16;
      }
    }

    v18 = v8;
LABEL_16:
  }
  else
  {
    int64_t v13 = 0;
  }

LABEL_18:
  return v13;
}

- (void)incrementVersionForSegment:(id)a3
{
  id v4 = NSNumber;
  coderVersions = self->_coderVersions;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)coderVersions objectForKeyedSubscript:v6];
  int v8 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  [(NSMutableDictionary *)self->_coderVersions setObject:v8 forKeyedSubscript:v6];

  id v9 = [(MPCQueueController *)self delegate];
  [v9 queueController:self didIncrementVersionForSegment:v6];
}

- (MPCQueueControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCQueueControllerDelegate *)WeakRetained;
}

- (MPCQueueControllerUpNextBehavior)upNextBehavior
{
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23D00])behaviorImpl = self->_behaviorImpl; {
  else
  }
    behaviorImpl = 0;

  return behaviorImpl;
}

- (MPCQueueControllerBehaviorMusic)music
{
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC2F3C0])behaviorImpl = self->_behaviorImpl; {
  else
  }
    behaviorImpl = 0;

  return behaviorImpl;
}

- (MPCQueueControllerBehaviorMusicSharePlay)musicSharePlay
{
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC478F0])behaviorImpl = self->_behaviorImpl; {
  else
  }
    behaviorImpl = 0;

  return behaviorImpl;
}

- (NSString)revisionString
{
  v2 = NSString;
  int64_t v3 = [(NSMutableDictionary *)self->_coderVersions objectForKeyedSubscript:@"behavior"];
  id v4 = [v2 stringWithFormat:@"behavior=%@", v3];

  return (NSString *)v4;
}

- (id)segmentForCodingKey:(id)a3
{
  if (a3 == @"be") {
    return @"behavior";
  }
  else {
    return @"metadata";
  }
}

- (void)_emitEventsForItemChangeFromItem:(id)a3 toCurrentItem:(id)a4
{
  v243[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v188 = v7;
  v184 = [v7 modelPlayEvent];
  v183 = [v184 genericObjectRepresentation];
  v185 = [v8 modelPlayEvent];
  uint64_t v9 = [v185 genericObjectRepresentation];
  v182 = (void *)v9;
  int v10 = 0;
  BOOL v11 = v183 == 0;
  if (!v9) {
    BOOL v11 = 0;
  }
  BOOL v174 = v11;
  if (v9) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v183 != 0;
  }
  BOOL v177 = v12;
  if (v183 && v9)
  {
    int64_t v13 = [v8 queueSectionID];
    __int16 v14 = [v188 queueSectionID];
    if ([v13 isEqualToString:v14])
    {
      uint64_t v15 = [v183 identifiers];
      uint64_t v16 = [v182 identifiers];
      int v10 = [v15 intersectsSet:v16] ^ 1;
    }
    else
    {
      int v10 = 1;
    }
  }
  int v17 = 0;
  if (v8) {
    BOOL v18 = v188 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  BOOL v172 = v18;
  if (v8) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v188 != 0;
  }
  if (v188 && v8)
  {
    id v20 = [v188 contentItemID];
    int v21 = [v8 contentItemID];
    id v22 = v20;
    id v23 = v21;
    if (v22 == v23)
    {
    }
    else
    {
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
        int v17 = 1;
LABEL_25:

        goto LABEL_26;
      }
    }
    int v17 = [v188 didReachEnd];
    goto LABEL_25;
  }
LABEL_26:
  v180 = [v188 queueItemID];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v25 = v8;
  }
  else {
    int v25 = 0;
  }
  id v26 = v25;
  v187 = v26;
  if (v188 == v8
    && ([v26 previousQueueItemID],
        __int16 v27 = objc_claimAutoreleasedReturnValue(),
        v27,
        v27))
  {
    uint64_t v28 = [v187 previousQueueItemID];
    uint64_t v29 = [v188 queueItemID];
    id v30 = v28;
    id v31 = v29;
    if (v30 == v31) {
      char v32 = 1;
    }
    else {
      char v32 = [v30 isEqual:v31];
    }
    id v4 = v187;

    uint64_t v33 = [v187 previousQueueItemID];

    if (v32)
    {
      int v17 = 0;
      BOOL v181 = 0;
    }
    else
    {
      v34 = [v187 jingleTimedMetadata];
      BOOL v181 = v34 != 0;

      int v17 = 1;
    }
    v180 = (void *)v33;
  }
  else
  {
    BOOL v181 = 0;
  }
  v186 = [(MPCQueueController *)self playbackEngine];
  if ((v19 | v17) == 1)
  {
    __int16 v35 = NSNumber;
    id v36 = v188;
    [v36 time];
    double v38 = v37;
    id v39 = v36;
    [v39 durationIfAvailable];
    if (v40 >= v38) {
      double v41 = v38;
    }
    else {
      double v41 = v40;
    }
    double v42 = fmax(v41, 0.0);

    uint64_t v43 = [v35 numberWithDouble:v42];
    uint64_t v44 = [v186 eventStream];
    if ([v39 isPlaceholder]) {
      v45 = @"item-placeholder-end";
    }
    else {
      v45 = @"item-end";
    }
    v242[0] = @"queue-section-id";
    v46 = [v39 queueSectionID];
    v243[0] = v46;
    v243[1] = v180;
    v242[1] = @"queue-item-id";
    v242[2] = @"item-end-position";
    uint64_t v47 = (uint64_t)v43;
    if (v181)
    {
      uint64_t v48 = [v8 lastMetadataChangeTime];
      id v4 = (void *)v48;
      if (v48) {
        uint64_t v47 = v48;
      }
      else {
        uint64_t v47 = (uint64_t)v43;
      }
    }
    v243[2] = v47;
    v242[3] = @"item-did-play-to-end";
    v49 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v39, "didReachEnd"));
    v243[3] = v49;
    v50 = [NSDictionary dictionaryWithObjects:v243 forKeys:v242 count:4];
    [v44 emitEventType:v45 payload:v50];

    if (v181) {
  }
    }
  if ((v177 | v10) == 1)
  {
    v51 = [v184 genericObjectRepresentation];
    v52 = [v51 anyObject];
    v53 = [v52 identifiers];

    if (([v53 isPlaceholder] & 1) == 0)
    {
      v54 = [v186 eventStream];
      v240[0] = @"queue-section-id";
      v55 = [v188 queueSectionID];
      v240[1] = @"container-ids";
      v241[0] = v55;
      v56 = v53;
      if (!v53)
      {
        v56 = [MEMORY[0x263EFF9D0] null];
      }
      v241[1] = v56;
      v57 = [NSDictionary dictionaryWithObjects:v241 forKeys:v240 count:2];
      [v54 emitEventType:@"container-end" payload:v57];

      if (!v53) {
    }
      }
  }
  if ((v174 | v10) == 1)
  {
    v58 = [v185 genericObjectRepresentation];
    v59 = [v58 anyObject];
    v60 = [v59 identifiers];

    if (([v60 isPlaceholder] & 1) == 0)
    {
      uint64_t v224 = 0;
      v225 = &v224;
      uint64_t v226 = 0x3032000000;
      v227 = __Block_byref_object_copy__19687;
      v228 = __Block_byref_object_dispose__19688;
      id v229 = 0;
      uint64_t v220 = 0;
      v221 = &v220;
      uint64_t v222 = 0x2020000000;
      char v223 = 0;
      uint64_t v214 = 0;
      v215 = &v214;
      uint64_t v216 = 0x3032000000;
      v217 = __Block_byref_object_copy__19687;
      v218 = __Block_byref_object_dispose__19688;
      id v219 = 0;
      uint64_t v210 = 0;
      v211 = &v210;
      uint64_t v212 = 0x2020000000;
      char v213 = 0;
      uint64_t v206 = 0;
      v207 = &v206;
      uint64_t v208 = 0x2020000000;
      char v209 = 0;
      uint64_t v202 = 0;
      v203 = &v202;
      uint64_t v204 = 0x2020000000;
      uint64_t v205 = 0;
      uint64_t v198 = 0;
      v199 = &v198;
      uint64_t v200 = 0x2020000000;
      uint64_t v201 = 0;
      v61 = (void *)MEMORY[0x263F11F78];
      v189[0] = MEMORY[0x263EF8330];
      v189[1] = 3221225472;
      v189[2] = __69__MPCQueueController__emitEventsForItemChangeFromItem_toCurrentItem___block_invoke;
      v189[3] = &unk_2643C2BE8;
      v191 = &v224;
      id v190 = v185;
      v192 = &v202;
      v193 = &v198;
      v194 = &v206;
      v195 = &v214;
      v196 = &v210;
      v197 = &v220;
      [v61 performWithoutEnforcement:v189];
      v168 = [v186 eventStream];
      v238[0] = @"queue-section-id";
      v175 = [v8 queueSectionID];
      v239[0] = v175;
      v238[1] = @"container-kind";
      uint64_t v178 = [v60 modelKind];
      uint64_t v62 = v178;
      if (!v178)
      {
        uint64_t v62 = [MEMORY[0x263EFF9D0] null];
      }
      v162 = (void *)v62;
      v239[1] = v62;
      v238[2] = @"container-ids";
      uint64_t v63 = (uint64_t)v60;
      if (!v60)
      {
        uint64_t v63 = [MEMORY[0x263EFF9D0] null];
      }
      v160 = (void *)v63;
      v239[2] = v63;
      v238[3] = @"container-metadata";
      v236[0] = @"container-title";
      uint64_t v64 = v225[5];
      uint64_t v166 = v64;
      if (!v64)
      {
        uint64_t v64 = [MEMORY[0x263EFF9D0] null];
      }
      v158 = (void *)v64;
      v237[0] = v64;
      v236[1] = @"container-radio-type";
      if (*((unsigned char *)v207 + 24)) {
        [NSNumber numberWithInteger:v203[3]];
      }
      else {
      v170 = [MEMORY[0x263EFF9D0] null];
      }
      v237[1] = v170;
      v236[2] = @"container-radio-subtype";
      if (*((unsigned char *)v207 + 24)) {
        [NSNumber numberWithInteger:v199[3]];
      }
      else {
      v65 = [MEMORY[0x263EFF9D0] null];
      }
      v237[2] = v65;
      v236[3] = @"container-playlist-version-hash";
      v66 = v221;
      if (*((unsigned char *)v221 + 24) && (v67 = (void *)v215[5]) != 0)
      {
        int v68 = 0;
      }
      else
      {
        v67 = [MEMORY[0x263EFF9D0] null];
        int v68 = 1;
        v66 = v221;
      }
      v237[3] = v67;
      v236[4] = @"container-is-collaborative-playlist";
      if (*((unsigned char *)v66 + 24)) {
        [NSNumber numberWithBool:*((unsigned __int8 *)v211 + 24)];
      }
      else {
      v69 = [MEMORY[0x263EFF9D0] null];
      }
      v237[4] = v69;
      v70 = [NSDictionary dictionaryWithObjects:v237 forKeys:v236 count:5];
      v239[3] = v70;
      v71 = [NSDictionary dictionaryWithObjects:v239 forKeys:v238 count:4];
      [v168 emitEventType:@"container-begin" payload:v71];

      if (v68) {
      if (!v166)
      }

      if (!v60) {
      v72 = (void *)v178;
      }
      if (!v178)
      {

        v72 = 0;
      }

      _Block_object_dispose(&v198, 8);
      _Block_object_dispose(&v202, 8);
      _Block_object_dispose(&v206, 8);
      _Block_object_dispose(&v210, 8);
      _Block_object_dispose(&v214, 8);

      _Block_object_dispose(&v220, 8);
      _Block_object_dispose(&v224, 8);
    }
  }
  if ((v172 | v17) == 1)
  {
    v73 = [v8 modelGenericObject];
    v176 = [v73 flattenedGenericObject];

    v74 = [v176 anyObject];
    v179 = [v74 identifiers];

    if ([v176 type] == 1)
    {
      v75 = [v176 song];
      uint64_t v76 = [v75 isArtistUploadedContent];
    }
    else
    {
      uint64_t v76 = 0;
    }
    [v8 durationIfAvailable];
    double v78 = v77;
    v173 = [v8 playbackInfo];
    [v8 _expectedStartTimeWithPlaybackInfo:v173];
    double v80 = v79;
    [v8 _expectedStopTimeWithPlaybackInfo:v173];
    double v82 = v81;
    v140 = [v186 eventStream];
    int v83 = [v8 isPlaceholder];
    v84 = @"item-begin";
    if (v83) {
      v84 = @"item-placeholder-begin";
    }
    v139 = v84;
    v234[0] = @"queue-section-id";
    v151 = [v8 queueSectionID];
    v235[0] = v151;
    v234[1] = @"queue-item-id";
    v150 = [v8 queueItemID];
    v235[1] = v150;
    v234[2] = @"item-kind";
    uint64_t v85 = [v179 modelKind];
    v153 = (void *)v85;
    if (!v85)
    {
      uint64_t v85 = [MEMORY[0x263EFF9D0] null];
    }
    v135 = (void *)v85;
    v235[2] = v85;
    v234[3] = @"item-ids";
    uint64_t v86 = (uint64_t)v179;
    if (!v179)
    {
      uint64_t v86 = [MEMORY[0x263EFF9D0] null];
    }
    v134 = (void *)v86;
    v235[3] = v86;
    v234[4] = @"item-metadata";
    v232[0] = @"item-duration";
    v149 = [NSNumber numberWithDouble:v78];
    v233[0] = v149;
    v232[1] = @"item-title";
    uint64_t v87 = [v8 mainTitle];
    v171 = (void *)v87;
    if (!v87)
    {
      uint64_t v87 = [MEMORY[0x263EFF9D0] null];
    }
    v133 = (void *)v87;
    v233[1] = v87;
    v232[2] = @"item-has-video";
    v148 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "type") == 2);
    v233[2] = v148;
    v232[3] = @"item-initial-position";
    uint64_t v152 = [v8 lastMetadataChangeTime];
    uint64_t v88 = v152;
    if (v152)
    {
      int v138 = 0;
    }
    else
    {
      v119 = [v8 initialPlaybackStartTime];
      uint64_t v88 = (uint64_t)v119;
      if (v119)
      {
        int v138 = 0;
      }
      else
      {
        [MEMORY[0x263EFF9D0] null];
        v119 = 0;
        uint64_t v88 = v138 = 1;
      }
    }
    v137 = (void *)v88;
    v233[3] = v88;
    v232[4] = @"item-start-boundary";
    v147 = [NSNumber numberWithDouble:v80];
    v233[4] = v147;
    v232[5] = @"item-end-boundary";
    v146 = [NSNumber numberWithDouble:v82];
    v233[5] = v146;
    v232[6] = @"item-artist-uploaded";
    v145 = [NSNumber numberWithBool:v76];
    v233[6] = v145;
    v232[7] = @"item-is-start-item";
    v144 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isStartItem"));
    v233[7] = v144;
    v232[8] = @"item-is-placeholder";
    char v143 = [v8 isPlaceholder];
    if (v143)
    {
      uint64_t v89 = MEMORY[0x263EFFA88];
    }
    else
    {
      uint64_t v89 = [MEMORY[0x263EFF9D0] null];
    }
    v136 = (void *)v89;
    v233[8] = v89;
    v232[9] = @"requires-mpaf";
    v142 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v187, "shouldReportPlayEventsToStore"));
    v233[9] = v142;
    v232[10] = @"uses-bookmarking";
    v141 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "usesBookmarking"));
    v233[10] = v141;
    v232[11] = @"explicit-treatment";
    uint64_t v90 = [v8 explicitBadge];
    v156 = (void *)v90;
    if (!v90)
    {
      uint64_t v90 = [MEMORY[0x263EFF9D0] null];
    }
    v132 = (void *)v90;
    v233[11] = v90;
    v232[12] = @"podcast-store-id";
    uint64_t v91 = [v8 podcastStoreID];
    v169 = (void *)v91;
    if (!v91)
    {
      uint64_t v91 = [MEMORY[0x263EFF9D0] null];
    }
    v131 = (void *)v91;
    v233[12] = v91;
    v232[13] = @"podcast-feed-url";
    uint64_t v92 = [v8 podcastFeedURL];
    v167 = (void *)v92;
    if (!v92)
    {
      uint64_t v92 = [MEMORY[0x263EFF9D0] null];
    }
    v130 = (void *)v92;
    v233[13] = v92;
    v232[14] = @"podcast-asset-url";
    uint64_t v93 = [v8 podcastAssetURL];
    v165 = (void *)v93;
    if (!v93)
    {
      uint64_t v93 = [MEMORY[0x263EFF9D0] null];
    }
    v129 = (void *)v93;
    v233[14] = v93;
    v232[15] = @"podcast-item-type";
    uint64_t v94 = [v8 podcastItemType];
    v155 = (void *)v94;
    if (!v94)
    {
      uint64_t v94 = [MEMORY[0x263EFF9D0] null];
    }
    v128 = (void *)v94;
    v233[15] = v94;
    v232[16] = @"podcast-media-type";
    uint64_t v95 = [v8 podcastMediaType];
    v164 = (void *)v95;
    if (!v95)
    {
      uint64_t v95 = [MEMORY[0x263EFF9D0] null];
    }
    v127 = (void *)v95;
    v233[16] = v95;
    v232[17] = @"podcast-price-type";
    uint64_t v96 = [v8 podcastPriceType];
    v163 = (void *)v96;
    if (!v96)
    {
      uint64_t v96 = [MEMORY[0x263EFF9D0] null];
    }
    v126 = (void *)v96;
    v233[17] = v96;
    v232[18] = @"podcast-content-guid";
    uint64_t v97 = [v8 podcastContentGUID];
    v161 = (void *)v97;
    if (!v97)
    {
      uint64_t v97 = [MEMORY[0x263EFF9D0] null];
    }
    v125 = (void *)v97;
    v233[18] = v97;
    v232[19] = @"podcast-subscription-state";
    uint64_t v98 = [v8 podcastSubscriptionState];
    v154 = (void *)v98;
    if (!v98)
    {
      uint64_t v98 = [MEMORY[0x263EFF9D0] null];
    }
    v124 = (void *)v98;
    v233[19] = v98;
    v232[20] = @"podcast-news-subscription-information";
    uint64_t v99 = [v8 newsSubscriptionInformation];
    v159 = (void *)v99;
    if (!v99)
    {
      uint64_t v99 = [MEMORY[0x263EFF9D0] null];
    }
    v123 = (void *)v99;
    v233[20] = v99;
    v232[21] = @"podcast-music-subscription-information";
    uint64_t v100 = [v8 musicSubscriptionInformation];
    v157 = (void *)v100;
    if (!v100)
    {
      uint64_t v100 = [MEMORY[0x263EFF9D0] null];
    }
    v122 = (void *)v100;
    v233[21] = v100;
    v232[22] = @"podcast-subscribable";
    uint64_t v101 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "podcastIsSubscribable"));
    v102 = (void *)v101;
    if (!v101)
    {
      uint64_t v101 = [MEMORY[0x263EFF9D0] null];
    }
    v121 = (void *)v101;
    v233[22] = v101;
    v232[23] = @"podcast-page-context";
    uint64_t v103 = [v8 podcastPageContext];
    v104 = (void *)v103;
    if (!v103)
    {
      uint64_t v103 = [MEMORY[0x263EFF9D0] null];
    }
    v120 = (void *)v103;
    v233[23] = v103;
    v105 = [NSDictionary dictionaryWithObjects:v233 forKeys:v232 count:24];
    v235[4] = v105;
    v234[5] = @"item-start-position";
    v106 = [v8 initialPlaybackStartTime];
    v107 = v106;
    if (!v106)
    {
      v107 = [MEMORY[0x263EFF9D0] null];
    }
    v235[5] = v107;
    v234[6] = @"radio-track-info";
    v108 = [v187 trackInfoData];
    v109 = v108;
    if (!v108)
    {
      v109 = [MEMORY[0x263EFF9D0] null];
    }
    v235[6] = v109;
    v110 = [NSDictionary dictionaryWithObjects:v235 forKeys:v234 count:7];
    [v140 emitEventType:v139 payload:v110];

    if (!v108) {
    if (!v106)
    }

    if (!v104) {
    if (!v102)
    }

    if (!v157) {
    if (!v159)
    }

    if (!v154) {
    if (!v161)
    }

    if (!v163) {
    if (!v164)
    }

    if (!v155) {
    if (!v165)
    }

    if (!v167) {
    if (!v169)
    }

    if (!v156) {
    if ((v143 & 1) == 0)
    }

    if (v138) {
    v111 = (void *)v152;
    }
    if (!v152)
    {

      v111 = 0;
    }

    if (!v171) {
    if (!v179)
    }

    v112 = v153;
    if (!v153)
    {

      v112 = 0;
    }
  }
  if (v181)
  {
    v113 = [v186 eventStream];
    v230[0] = @"queue-section-id";
    v114 = [v8 queueSectionID];
    v231[0] = v114;
    v230[1] = @"queue-item-id";
    v115 = [v8 queueItemID];
    v231[1] = v115;
    v230[2] = @"item-timed-metadata";
    v116 = [v187 jingleTimedMetadata];
    v117 = v116;
    if (!v116)
    {
      v117 = [MEMORY[0x263EFF9D0] null];
    }
    v231[2] = v117;
    v118 = [NSDictionary dictionaryWithObjects:v231 forKeys:v230 count:3];
    [v113 emitEventType:@"item-timed-metadata-ping" payload:v118];

    if (!v116) {
  }
    }
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 reason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = +[_MPCQueueControllerRegistry shared];
  BOOL v11 = [v10 transportableExtensions];
  BOOL v12 = NSMapGet(v11, (const void *)self->_behaviorType);

  int64_t v13 = [v12 allKnownSessionTypes];
  if (([v13 containsObject:v8] & 1) == 0)
  {
    if (a5)
    {
      BOOL v15 = 0;
      uint64_t v16 = @"other behavior session type";
LABEL_9:
      *a5 = v16;
      goto LABEL_21;
    }
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_21;
  }
  id v14 = v9;
  if ([v14 hasPrefix:@"⏳"])
  {

    goto LABEL_7;
  }
  int v17 = [v14 hasPrefix:@"♻️"];

  if (v17)
  {
LABEL_7:
    if (a5)
    {
      BOOL v15 = 0;
      uint64_t v16 = @"QC-Placeholder content item ID";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = __Block_byref_object_copy__19687;
  id v36 = __Block_byref_object_dispose__19688;
  id v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__MPCQueueController_isExportableSessionType_forContentItemID_reason___block_invoke;
  v22[3] = &unk_2643C2A78;
  id v26 = &v28;
  id v23 = v8;
  id v24 = v14;
  id v25 = v12;
  __int16 v27 = &v32;
  if ([(MPCQueueController *)self _withTransportableBehavior:v22])
  {
    int v18 = *((unsigned __int8 *)v29 + 24);
    if (a5 && !*((unsigned char *)v29 + 24))
    {
      BOOL v19 = (__CFString *) (id) v33[5];
      id v20 = @"not supported by transportableBehavior";
      if (v19) {
        id v20 = v19;
      }
      *a5 = v20;
      int v18 = *((unsigned __int8 *)v29 + 24);
    }
    BOOL v15 = v18 != 0;
  }
  else
  {
    BOOL v15 = 0;
    if (a5) {
      *a5 = @"current Behavior is non-transportable";
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

LABEL_21:
  return v15;
}

- (BOOL)_withTransportableBehavior:(id)a3
{
  id v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  int v5 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23EC8];
  if (v5) {
    v4[2](v4, self->_behaviorImpl);
  }

  return v5;
}

void __70__MPCQueueController_isExportableSessionType_forContentItemID_reason___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [a2 isExportableSessionType:v3 forContentItemID:v4 extension:v5 reason:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

+ (id)allKnownSessionTypes
{
  v2 = +[_MPCQueueControllerRegistry shared];
  uint64_t v3 = [v2 transportableExtensions];

  uint64_t v4 = NSAllMapTableValues(v3);
  uint64_t v5 = objc_msgSend(v4, "msv_flatMap:", &__block_literal_global_19997);

  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)didConnectToPlaybackEngine:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 eventStream];
  v8[0] = @"session-id";
  uint64_t v5 = [(MPCQueueController *)self sessionID];
  v8[1] = @"behavior-type";
  v9[0] = v5;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPCQueueController behaviorType](self, "behaviorType"));
  v9[1] = v6;
  char v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v4 emitEventType:@"session-begin" payload:v7];

  if (objc_opt_respondsToSelector()) {
    [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl didConnectToHost:self];
  }
  if (self->_currentItem) {
    -[MPCQueueController _emitEventsForItemChangeFromItem:toCurrentItem:](self, "_emitEventsForItemChangeFromItem:toCurrentItem:", 0);
  }
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)performAfterEdits:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  if ([(NSMapTable *)self->_activeEdits count])
  {
    uint64_t v6 = [(NSMapTable *)self->_activeEdits objectEnumerator];
    char v7 = objc_msgSend(v6, "msv_map:", &__block_literal_global_112);

    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [WeakRetained engineID];
      int v10 = [(MPCQueueController *)self sessionID];
      NSUInteger v11 = [(NSMapTable *)self->_activeEdits count];
      *(_DWORD *)buf = 138544130;
      id v25 = v9;
      __int16 v26 = 2114;
      __int16 v27 = v10;
      __int16 v28 = 2048;
      NSUInteger v29 = v11;
      __int16 v30 = 2114;
      char v31 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | storing continuation [%ld edits remain] activeEdits=%{public}@", buf, 0x2Au);
    }
    BOOL v12 = _Block_copy(self->_postEditContinuation);
    int64_t v13 = v12;
    if (v12)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __40__MPCQueueController_performAfterEdits___block_invoke_113;
      v21[3] = &unk_2643C37C0;
      id v22 = v12;
      id v23 = v4;
      id v14 = _Block_copy(v21);
      id postEditContinuation = self->_postEditContinuation;
      self->_id postEditContinuation = v14;

      id v16 = v22;
    }
    else
    {
      id v20 = _Block_copy(v4);
      id v16 = self->_postEditContinuation;
      self->_id postEditContinuation = v20;
    }
  }
  else
  {
    int v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [WeakRetained engineID];
      BOOL v19 = [(MPCQueueController *)self sessionID];
      *(_DWORD *)buf = 138543618;
      id v25 = v18;
      __int16 v26 = 2114;
      __int16 v27 = v19;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", buf, 0x16u);
    }
    v4[2](v4);
  }
}

+ (void)registerPublisher:(id)a3
{
  id v3 = a3;
  id v6 = +[_MPCQueueControllerRegistry shared];
  uint64_t v4 = [v6 publisherProxy];
  uint64_t v5 = [v4 objects];
  [v5 addObject:v3];
}

uint64_t __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 40) engineID];
    id v6 = [*(id *)(a1 + 32) sessionID];
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2114;
    BOOL v12 = v6;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] finalizeStateRestorationWithLoadingItemReady:… | clearing loading content item", (uint8_t *)&v9, 0x16u);
  }
  if (!*(void *)(a1 + 48))
  {
    *(void *)(*(void *)(a1 + 32) + 64) = 7;
    char v7 = [*(id *)(a1 + 32) delegate];
    [v7 queueController:*(void *)(a1 + 32) didChangeTargetContentItemID:*(void *)(*(void *)(a1 + 32) + 56)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (int64_t)targetContentItemSource
{
  if (self->_loadingContentItemID) {
    return 100;
  }
  else {
    return self->_targetContentItemSource;
  }
}

- (BOOL)containsRestorableContent
{
  if (self->_loadingContentItemID) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__MPCQueueController_containsRestorableContent__block_invoke;
  v4[3] = &unk_2643C2A30;
  v4[4] = &v5;
  [(MPCQueueController *)self _withRestorableBehavior:v4];
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_withRestorableBehavior:(id)a3
{
  uint64_t v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  int v5 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23AB0];
  if (v5) {
    v4[2](v4, self->_behaviorImpl);
  }

  return v5;
}

void __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_2;
  void v9[3] = &unk_2643C59E0;
  v9[4] = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v6 = [a2 finalizeStateRestorationWithTargetContentItemID:v5 completion:v9];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __47__MPCQueueController_containsRestorableContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsRestorableContent];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t behaviorType = self->_behaviorType;
  id v5 = a3;
  [v5 encodeInteger:behaviorType forKey:@"bet"];
  [v5 encodeObject:self->_behaviorImpl forKey:@"be"];
  [v5 encodeObject:self->_targetContentItemID forKey:@"tci"];
  [v5 encodeInteger:self->_targetContentItemSource forKey:@"tcis"];
  [v5 encodeDouble:@"lst" forKey:self->_lastSavedTime];
}

- (BOOL)canPreviousTrackForContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      char v8 = 0;
      int v9 = @"no item";
      goto LABEL_8;
    }
LABEL_9:
    char v8 = 0;
    goto LABEL_11;
  }
  if (([v6 hasPrefix:@"⏳"] & 1) == 0
    && ![v7 hasPrefix:@"♻️"])
  {
    char v8 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl canPreviousItemFromContentItemID:v7 reason:a4];
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_9;
  }
  char v8 = 0;
  int v9 = @"QC-Placeholder";
LABEL_8:
  *a4 = v9;
LABEL_11:

  return v8;
}

- (BOOL)canNextTrackForContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      char v8 = 0;
      int v9 = @"no item";
      goto LABEL_8;
    }
LABEL_9:
    char v8 = 0;
    goto LABEL_11;
  }
  if (([v6 hasPrefix:@"⏳"] & 1) == 0
    && ![v7 hasPrefix:@"♻️"])
  {
    char v8 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl canNextItemFromContentItemID:v7 reason:a4];
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_9;
  }
  char v8 = 0;
  int v9 = @"QC-Placeholder";
LABEL_8:
  *a4 = v9;
LABEL_11:

  return v8;
}

void __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_3;
  v6[3] = &unk_2643C3D38;
  uint64_t v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (NSString)playerID
{
  BOOL v2 = [(MPCQueueController *)self playbackEngine];
  id v3 = [v2 playerID];

  return (NSString *)v3;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  BOOL v2 = [(MPCQueueController *)self playbackEngine];
  id v3 = [v2 eventStream];

  return (MPCPlaybackEngineEventStream *)v3;
}

- (int64_t)versionForSegment:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_coderVersions objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)willConnectToPlaybackEngine:(id)a3
{
  p_playbackEngine = &self->_playbackEngine;
  id v5 = a3;
  objc_storeWeak((id *)p_playbackEngine, v5);
  [v5 addEngineObserver:self];
  [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl connectToHost:self];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __50__MPCQueueController_willConnectToPlaybackEngine___block_invoke;
  v8[3] = &unk_2643C2AA0;
  v8[4] = self;
  [(MPCQueueController *)self _withExternalSyncBehavior:v8];
  id v6 = [(MPCQueueController *)self music];
  id v7 = [v5 hostingSharedSessionID];

  [v6 setHostingSharedSessionID:v7 reason:@"Local Session Setup [continuing GroupSession]"];
}

- (MPCQueueController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [(MPCQueueController *)self init];
  if (!v6) {
    goto LABEL_19;
  }
  if ([v5 containsValueForKey:@"bet"])
  {
    uint64_t v7 = [v5 decodeIntegerForKey:@"bet"];
    v6->_int64_t behaviorType = v7;
    if (v7 == 4)
    {
      BOOL v12 = (void *)MEMORY[0x263EFFA08];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    }
    else
    {
      if (v7 != 2)
      {
        BOOL v15 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"MPCQueueController.m", 439, @"Attempt to decode unsupported behaviorType: %lld", v6->_behaviorType);
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0, v25, v26);
    BOOL v15 = };
    uint64_t v16 = [v5 decodeObjectOfClasses:v15 forKey:@"be"];
    behaviorImpl = v6->_behaviorImpl;
    v6->_behaviorImpl = (MPCQueueControllerBehaviorImplementation *)v16;

LABEL_10:
    if (!v6->_behaviorImpl)
    {
      id v24 = [MEMORY[0x263F08690] currentHandler];
      [v24 handleFailureInMethod:a2 object:v6 file:@"MPCQueueController.m" lineNumber:443 description:@"Failed to decode behaviorImpl"];
    }
    uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tci"];
    targetContentItemID = v6->_targetContentItemID;
    v6->_targetContentItemID = (NSString *)v18;

    v6->_targetContentItemSource = [v5 decodeIntegerForKey:@"tcis"];
    goto LABEL_13;
  }
  id v8 = [[_MPCQueueControllerBehaviorMusic alloc] initWithSessionID:0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __36__MPCQueueController_initWithCoder___block_invoke;
  v29[3] = &unk_2643C2AC8;
  id v9 = v6;
  __int16 v30 = v9;
  [(_MPCQueueControllerBehaviorMusic *)v8 restoreWithSharedCoder:v5 block:v29];
  v9->_int64_t behaviorType = 2;
  id v10 = v9->_behaviorImpl;
  v9->_behaviorImpl = (MPCQueueControllerBehaviorImplementation *)v8;
  id v11 = v8;

LABEL_13:
  if (v6->_targetContentItemID && [v5 containsValueForKey:@"lst"])
  {
    objc_storeStrong((id *)&v6->_restoreLastStartTimePositionToContentItemID, v6->_targetContentItemID);
    [v5 decodeDoubleForKey:@"lst"];
    v6->_double lastSavedTime = v20;
  }
  int v21 = [(MPCQueueControllerBehaviorImplementation *)v6->_behaviorImpl sessionID];

  if (!v21)
  {
    id v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, v6, @"MPCQueueController.m", 464, @"behaviorImpl must have sessionID: %@", v6->_behaviorImpl object file lineNumber description];
  }
  [(MPCQueueControllerBehaviorImplementation *)v6->_behaviorImpl connectToHost:v6];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __36__MPCQueueController_initWithCoder___block_invoke_2;
  v27[3] = &unk_2643C2AA0;
  __int16 v28 = v6;
  [(MPCQueueController *)v28 _withExternalSyncBehavior:v27];

LABEL_19:
  return v6;
}

- (void)_withExternalSyncBehavior:(id)a3
{
  int64_t v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC479C8])v4[2](v4, self->_behaviorImpl); {
}
  }

- (MPCQueueController)init
{
  v13[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)MPCQueueController;
  BOOL v2 = [(MPCQueueController *)&v11 init];
  if (v2)
  {
    v12[0] = @"behavior";
    v12[1] = @"metadata";
    v13[0] = &unk_26CC19128;
    v13[1] = &unk_26CC19128;
    id v3 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v4 = [v3 mutableCopy];
    coderVersions = v2->_coderVersions;
    v2->_coderVersions = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    activeEdits = v2->_activeEdits;
    v2->_activeEdits = (NSMapTable *)v6;

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__MPCQueueController_init__block_invoke;
    void v9[3] = &unk_2643C34D8;
    id v10 = v2;
    v10->_stateHandle = __26__MPCQueueController_init__block_invoke((uint64_t)v9);
  }
  return v2;
}

uint64_t __26__MPCQueueController_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v1 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v4, &location);
  uint64_t v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

- (void)didRestoreVersion:(int64_t)a3 forSegment:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSMutableDictionary *)self->_coderVersions setObject:v8 forKeyedSubscript:v7];
}

+ (id)describePlayer:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F12118] infoCenterForPlayerID:v3];
  id v5 = [v4 playbackEngine];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 queueController];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [MEMORY[0x263F089D8] string];
        [v8 appendFormat:@"# Player: %@\n\n", v3];
        id v9 = [v7 debugDescription];
        [v8 appendString:v9];
      }
      else
      {
        id v10 = NSString;
        objc_super v11 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v11);
        id v8 = [v10 stringWithFormat:@"Unexpected queueController class found: %@", v9];
      }
    }
    else
    {
      id v8 = [NSString stringWithFormat:@"No queue controller for %@", v3];
    }
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"No player found for %@", v3];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorImpl, 0);
  objc_storeStrong((id *)&self->_restoreLastStartTimePositionToContentItemID, 0);
  objc_storeStrong((id *)&self->_potentialCurrentItemEdits, 0);
  objc_storeStrong((id *)&self->_activeEdits, 0);
  objc_storeStrong((id *)&self->_loadingContentItemID, 0);
  objc_storeStrong((id *)&self->_coderVersions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_targetContentItemID, 0);
  objc_storeStrong((id *)&self->_preferredFirstContentItemID, 0);
  objc_storeStrong((id *)&self->_lastECATSStack, 0);

  objc_storeStrong(&self->_postEditContinuation, 0);
}

- (void)setBehaviorImpl:(id)a3
{
}

- (double)lastSavedTime
{
  return self->_lastSavedTime;
}

- (void)setRestoreLastStartTimePositionToContentItemID:(id)a3
{
}

- (NSString)restoreLastStartTimePositionToContentItemID
{
  return self->_restoreLastStartTimePositionToContentItemID;
}

- (void)setPotentialCurrentItemEdits:(id)a3
{
}

- (NSMutableArray)potentialCurrentItemEdits
{
  return self->_potentialCurrentItemEdits;
}

- (void)setActiveEdits:(id)a3
{
}

- (NSMapTable)activeEdits
{
  return self->_activeEdits;
}

- (void)setLoadingContentItemID:(id)a3
{
}

- (NSString)loadingContentItemID
{
  return self->_loadingContentItemID;
}

- (void)setCoderVersions:(id)a3
{
}

- (NSMutableDictionary)coderVersions
{
  return self->_coderVersions;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (NSString)preferredFirstContentItemID
{
  return self->_preferredFirstContentItemID;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  BOOL v3 = a3;
  v20[7] = *MEMORY[0x263EF8340];
  v19[0] = @"__obj";
  uint64_t v5 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  uint64_t v6 = (void *)v5;
  targetContentItemID = (__CFString *)self->_targetContentItemID;
  int64_t targetContentItemSource = self->_targetContentItemSource;
  if (!targetContentItemID) {
    targetContentItemID = @"@";
  }
  v20[0] = v5;
  v20[1] = targetContentItemID;
  v19[1] = @"_targetContentItemID";
  v19[2] = @"_loadingContentItemID";
  loadingContentItemID = (__CFString *)self->_loadingContentItemID;
  if (!loadingContentItemID) {
    loadingContentItemID = @"@";
  }
  v20[2] = loadingContentItemID;
  v19[3] = @"_targetContentItemSource";
  id v10 = @"Unknown";
  switch(targetContentItemSource)
  {
    case 0:
      break;
    case 1:
      id v10 = @"StartItem";
      break;
    case 2:
      id v10 = @"UserSelected";
      break;
    case 3:
      id v10 = @"NaturalTransition";
      break;
    case 4:
      id v10 = @"ExternalSync";
      break;
    case 5:
      id v10 = @"Redirect";
      break;
    case 6:
      id v10 = @"QueueBoundary";
      break;
    case 7:
      id v10 = @"Restored";
      break;
    default:
      if (targetContentItemSource == 100)
      {
        id v10 = @"Loading";
      }
      else
      {
        objc_msgSend(cfstr_MscAsstloc.isa, "stringWithFormat:", @"Unknown/%ld", targetContentItemSource);
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  if (v10) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = @"@";
  }
  v20[3] = v11;
  v19[4] = @"_currentItem";
  uint64_t v12 = [(MPAVItem *)self->_currentItem description];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"@";
  }
  v20[4] = v14;
  v19[5] = @"_loadingAdditionalItems";
  BOOL v15 = [NSNumber numberWithBool:self->_loadingAdditionalItems];
  v20[5] = v15;
  v19[6] = @"behaviorImpl";
  uint64_t v16 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl _stateDictionaryIncludingQueue:v3];
  v20[6] = v16;
  int v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  return v17;
}

- (void)performAllowingEditsToChangeCurrentItem:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken, &__block_literal_global_838);
  }
  pthread_key_t v5 = _MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey;
  pthread_setspecific(_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey, (const void *)1);
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  potentialCurrentItemEdits = self->_potentialCurrentItemEdits;
  self->_potentialCurrentItemEdits = v6;

  v4[2](v4);
  pthread_setspecific(v5, 0);
  if (!self->_targetContentItemID && [(NSMutableArray *)self->_potentialCurrentItemEdits count])
  {
    id v8 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:0 mode:2 options:0];
    id v9 = [v8 nextObject];

    [(MPCQueueController *)self _setTargetContentItemID:v9 source:0];
  }
}

void __69__MPCQueueController__emitEventsForItemChangeFromItem_toCurrentItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  pthread_key_t v5 = [*(id *)(a1 + 32) genericObjectRepresentation];
  uint64_t v6 = [v5 type];

  if (v6 == 4)
  {
    id v9 = [*(id *)(a1 + 32) genericObjectRepresentation];
    id v13 = [v9 playlist];

    uint64_t v10 = [v13 cloudVersionHash];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v13 isCollaborative];
    uint64_t v8 = a1 + 88;
  }
  else
  {
    if (v6 != 13) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) genericObjectRepresentation];
    id v13 = [v7 radioStation];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v13 type];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v13 subtype];
    uint64_t v8 = a1 + 64;
  }
  *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) = 1;
}

- (void)_evaluateContextAwareTriggersWithReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v7 = self->_targetContentItemID;
  if ([(NSString *)v7 hasPrefix:@"⏳"])
  {
  }
  else
  {
    BOOL v8 = [(NSString *)v7 hasPrefix:@"♻️"];

    if (!v8)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke;
      void v13[3] = &unk_2643C2BB0;
      v13[4] = self;
      id v14 = WeakRetained;
      id v15 = v5;
      SEL v16 = a2;
      [(MPCQueueController *)self _withDynamicBehavior:v13];

      goto LABEL_8;
    }
  }
  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [WeakRetained engineID];
    uint64_t v11 = [(MPCQueueController *)self sessionID];
    targetContentItemID = self->_targetContentItemID;
    *(_DWORD *)buf = 138544130;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    double v20 = v11;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 2114;
    id v24 = targetContentItemID;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:%{public}@ | skipping [targetContentItemID is QC-Placeholder] targetContentItemID=%{public}@", buf, 0x2Au);
  }
LABEL_8:
}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 preferredUpcomingItemCount];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8)
      {
LABEL_26:

        goto LABEL_27;
      }
      id v9 = [*(id *)(a1 + 40) engineID];
      uint64_t v10 = [*(id *)(a1 + 32) sessionID];
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v65 = v9;
      __int16 v66 = 2114;
      v67 = v10;
      __int16 v68 = 2114;
      uint64_t v69 = v11;
      __int16 v70 = 2048;
      uint64_t v71 = v5;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | skipping [already loading] preferredUpcomingItemCount=%ld", buf, 0x2Au);
LABEL_25:

      goto LABEL_26;
    }
    if (v8)
    {
      uint64_t v12 = [*(id *)(a1 + 40) engineID];
      id v13 = [*(id *)(a1 + 32) sessionID];
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v65 = v12;
      __int16 v66 = 2114;
      v67 = v13;
      __int16 v68 = 2114;
      uint64_t v69 = v14;
      __int16 v70 = 2048;
      uint64_t v71 = v5;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | checking [] preferredUpcomingItemCount=%ld", buf, 0x2Au);
    }
    id v7 = [v3 contentItemIDEnumeratorStartingAfterContentItemID:*(void *)(*(void *)(a1 + 32) + 56) mode:1 options:0];
    id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
    uint64_t v15 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      SEL v16 = v10;
      uint64_t v10 = [v7 nextObject];

      if (!v10) {
        break;
      }
      ++v15;
      [v9 addObject:v10];
      if (v5 == v15)
      {
        uint64_t v15 = v5;
        break;
      }
    }
    BOOL v17 = __OFSUB__(v5, v15);
    uint64_t v18 = v5 - v15;
    if ((v18 < 0) ^ v17 | (v18 == 0))
    {
      id v36 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = [*(id *)(a1 + 40) engineID];
        double v38 = [*(id *)(a1 + 32) sessionID];
        uint64_t v39 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        id v65 = v37;
        __int16 v66 = 2114;
        v67 = v38;
        __int16 v68 = 2114;
        uint64_t v69 = v39;
        __int16 v70 = 2048;
        uint64_t v71 = v5;
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | satisfied [] preferredUpcomingItemCount=%ld", buf, 0x2Au);
      }
    }
    else
    {
      if (![v9 count])
      {
LABEL_15:
        uint64_t v22 = [v9 copy];
        uint64_t v23 = *(void *)(a1 + 32);
        id v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
        uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [*(id *)(a1 + 40) engineID];
          __int16 v27 = [*(id *)(a1 + 32) sessionID];
          uint64_t v28 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138544130;
          id v65 = v26;
          __int16 v66 = 2114;
          v67 = v27;
          __int16 v68 = 2114;
          uint64_t v69 = v28;
          __int16 v70 = 2048;
          uint64_t v71 = v18;
          _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | requesting %ld items", buf, 0x2Au);
        }
        id v29 = objc_alloc(MEMORY[0x263F54ED0]);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_393;
        v58[3] = &unk_2643C61D0;
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v60 = *(void *)(a1 + 56);
        v58[4] = v30;
        id v31 = v3;
        id v59 = v31;
        uint64_t v32 = (void *)[v29 initWithDeallocHandler:v58];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_2;
        v53[3] = &unk_2643C2B88;
        id v33 = *(id *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 32);
        id v54 = v33;
        uint64_t v55 = v34;
        id v56 = *(id *)(a1 + 48);
        id v57 = v32;
        id v35 = v32;
        [v31 loadAdditionalUpcomingItems:v18 completion:v53];

        goto LABEL_25;
      }
      id v19 = *(id *)(*(void *)(a1 + 32) + 40);
      if (v19 == v9)
      {
      }
      else
      {
        double v20 = v19;
        int v21 = [v19 isEqual:v9];

        if (!v21) {
          goto LABEL_15;
        }
      }
      double v40 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        double v41 = [*(id *)(a1 + 40) engineID];
        double v42 = [*(id *)(a1 + 32) sessionID];
        uint64_t v52 = *(void *)(a1 + 48);
        uint64_t v43 = objc_msgSend(v9, "msv_compactDescription");
        *(_DWORD *)buf = 138544386;
        id v65 = v41;
        __int16 v66 = 2114;
        v67 = v42;
        __int16 v68 = 2114;
        uint64_t v69 = v52;
        __int16 v70 = 2048;
        uint64_t v71 = v5;
        __int16 v72 = 2114;
        uint64_t v73 = v43;
        uint64_t v44 = (void *)v43;
        _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | skipping [matching ecats stack] preferredUpcomingItemCount=%ld ecatsStack=[%{public}@]", buf, 0x34u);
      }
      v45 = (void *)MEMORY[0x263F54EC8];
      uint64_t v46 = *MEMORY[0x263F54E80];
      uint64_t v47 = *(void *)(a1 + 48);
      v61[0] = @"reason";
      v61[1] = @"lastECATSStack";
      uint64_t v48 = *(void *)(*(void *)(a1 + 32) + 40);
      v62[0] = v47;
      v62[1] = v48;
      v61[2] = @"preferredUpcomingItemCount";
      id v36 = [NSNumber numberWithInteger:v5];
      v62[2] = v36;
      v61[3] = @"queueController";
      v49 = [*(id *)(a1 + 32) _stateDictionaryIncludingQueue:1];
      v62[3] = v49;
      v50 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
      uint64_t v63 = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
      [v45 snapshotWithDomain:v46 type:@"Bug" subType:@"Rogue-ECATS" context:@"MatchingECATSStack" triggerThresholdValues:&stru_26CBCA930 events:v51 completion:0];
    }
    goto LABEL_25;
  }
LABEL_27:
}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_393(void *a1)
{
  id v2 = [MEMORY[0x263F08690] currentHandler];
  [v2 handleFailureInMethod:a1[6], a1[4], @"MPCQueueController.m", 1377, @"Behavior did not call completion for loadAdditionalUpcomingItems: %@", a1[5] object file lineNumber description];
}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = [*(id *)(a1 + 32) engineID];
      id v7 = [*(id *)(a1 + 40) sessionID];
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      BOOL v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      int v21 = v9;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | finished error=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) engineID];
    uint64_t v11 = [*(id *)(a1 + 40) sessionID];
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    BOOL v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | finished", buf, 0x20u);
  }
  id v13 = *(id *)(a1 + 56);
  msv_dispatch_on_main_queue();
}

uint64_t __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_397(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 0;
    id v3 = *(void **)(a1 + 40);
    return [v3 _evaluateContextAwareTriggersWithReason:@"Finished loading additional"];
  }
  return result;
}

- (id)_contentItemIDWithOffset:(int64_t)a3 fromItemID:(id)a4 mode:(int64_t)a5 didReachEnd:(BOOL *)a6
{
  id v10 = a4;
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  if (a3)
  {
    if (([v10 hasPrefix:@"⏳"] & 1) != 0
      || ([v11 hasPrefix:@"♻️"] & 1) != 0)
    {
LABEL_5:
      id v12 = 0;
      goto LABEL_29;
    }
    id v13 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:v11 mode:a5 options:(unint64_t)a3 >> 63];
    id v12 = 0;
    if (a3 >= 0) {
      int64_t v14 = a3;
    }
    else {
      int64_t v14 = -a3;
    }
    unint64_t v15 = v14 + 1;
    while (1)
    {
      __int16 v16 = [v13 nextObject];
      if (!v16) {
        break;
      }
      id v17 = v16;

      behaviorImpl = self->_behaviorImpl;
      if (a3 < 1)
      {
        if (([(MPCQueueControllerBehaviorImplementation *)behaviorImpl canPreviousItemFromContentItemID:v17 reason:0] & 1) == 0)
        {
LABEL_20:
          id v12 = v17;

          goto LABEL_28;
        }
      }
      else if (([(MPCQueueControllerBehaviorImplementation *)behaviorImpl canNextItemFromContentItemID:v17 reason:0] & 1) == 0)
      {
        goto LABEL_20;
      }

      --v15;
      id v12 = v17;
      if (v15 <= 1)
      {
        BOOL v19 = 0;
        id v12 = v17;
        goto LABEL_22;
      }
    }
    if (a3 < 1)
    {
      BOOL v19 = 0;
    }
    else
    {

      id v12 = 0;
      BOOL v19 = 1;
    }
LABEL_22:
    if (a6) {
      *a6 = v19;
    }
    if (v12) {
      BOOL v19 = 1;
    }
    if (!v19) {
      id v12 = v11;
    }
LABEL_28:
  }
  else
  {
    id v12 = v10;
  }
LABEL_29:

  return v12;
}

- (void)_rollbackEdit:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_on_main_queue();
}

void __36__MPCQueueController__rollbackEdit___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 engineID];
    uint64_t v5 = [*(id *)(a1 + 32) sessionID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v20 = 138543874;
    int v21 = v4;
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] rollbackEdit:… | rolling back edit [] edit=%{public}@", (uint8_t *)&v20, 0x20u);
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v8 = [*(id *)(a1 + 40) identifier];
  [v7 removeObjectForKey:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 8))
  {
    if ([*(id *)(v9 + 120) count])
    {
      id v10 = [*(id *)(*(void *)(a1 + 32) + 120) objectEnumerator];
      uint64_t v11 = objc_msgSend(v10, "msv_map:", &__block_literal_global_369);

      id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v2 engineID];
        int64_t v14 = [*(id *)(a1 + 32) sessionID];
        uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 120) count];
        int v20 = 138544130;
        int v21 = v13;
        __int16 v22 = 2114;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        __int16 v26 = 2114;
        __int16 v27 = v11;
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | waiting for continuation [%ld edits remain] activeEdits=%{public}@", (uint8_t *)&v20, 0x2Au);
      }
    }
    else
    {
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v2 engineID];
        __int16 v18 = [*(id *)(a1 + 32) sessionID];
        int v20 = 138543618;
        int v21 = v17;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", (uint8_t *)&v20, 0x16u);
      }
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = 0;
    }
  }
}

uint64_t __36__MPCQueueController__rollbackEdit___block_invoke_367(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (void)_commitEdit:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_on_main_queue();
}

void __34__MPCQueueController__commitEdit___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 engineID];
    uint64_t v5 = [*(id *)(a1 + 32) sessionID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v22 = 138543874;
    uint64_t v23 = v4;
    __int16 v24 = 2114;
    uint64_t v25 = v5;
    __int16 v26 = 2114;
    uint64_t v27 = v6;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] commitEdit:… | committing edit [] edit=%{public}@", (uint8_t *)&v22, 0x20u);
  }
  [*(id *)(a1 + 32) _evaluateCurrentItemWithEdit:*(void *)(a1 + 40)];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 currentItem];
  [v7 _updateQueueIndexForItemIfNeeded:v8];

  [*(id *)(a1 + 32) _evaluateContextAwareTriggersWithReason:@"commit edit"];
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 120);
  id v10 = [*(id *)(a1 + 40) identifier];
  [v9 removeObjectForKey:v10];

  [*(id *)(a1 + 32) incrementVersionForSegment:@"behavior"];
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(void *)(v11 + 8))
  {
    if ([*(id *)(v11 + 120) count])
    {
      id v12 = [*(id *)(*(void *)(a1 + 32) + 120) objectEnumerator];
      id v13 = objc_msgSend(v12, "msv_map:", &__block_literal_global_366);

      int64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v2 engineID];
        __int16 v16 = [*(id *)(a1 + 32) sessionID];
        uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 120) count];
        int v22 = 138544130;
        uint64_t v23 = v15;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        __int16 v26 = 2048;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        id v29 = v13;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | waiting for continuation [%ld edits remain] activeEdits=%{public}@", (uint8_t *)&v22, 0x2Au);
      }
    }
    else
    {
      __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v2 engineID];
        int v20 = [*(id *)(a1 + 32) sessionID];
        int v22 = 138543618;
        uint64_t v23 = v19;
        __int16 v24 = 2114;
        uint64_t v25 = v20;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", (uint8_t *)&v22, 0x16u);
      }
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
      uint64_t v21 = *(void *)(a1 + 32);
      id v13 = *(void **)(v21 + 8);
      *(void *)(v21 + 8) = 0;
    }
  }
}

uint64_t __34__MPCQueueController__commitEdit___block_invoke_364(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (void)_evaluateCurrentItemWithEdit:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [WeakRetained engineID];
    uint64_t v9 = [(MPCQueueController *)self sessionID];
    id v10 = [v5 identifier];
    uint64_t v11 = [v5 label];
    *(_DWORD *)buf = 138544130;
    os_log_t v76 = v8;
    __int16 v77 = 2114;
    double v78 = v9;
    __int16 v79 = 2114;
    uint64_t v80 = (uint64_t)v10;
    __int16 v81 = 2114;
    double v82 = v11;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | committed %{public}@", buf, 0x2Au);
  }
  id v12 = [(MPCQueueController *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v5;
    uint64_t v14 = [v13 targetContentItemID];
    if (v14)
    {
      uint64_t v15 = (NSString *)v14;
      BOOL v16 = [(NSString *)self->_targetContentItemID isEqualToString:v14];
      uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v18)
        {
          id v37 = [WeakRetained engineID];
          double v38 = [(MPCQueueController *)self sessionID];
          uint64_t v39 = [v13 identifier];
          *(_DWORD *)buf = 138544130;
          os_log_t v76 = v37;
          __int16 v77 = 2114;
          double v78 = v38;
          __int16 v79 = 2114;
          uint64_t v80 = (uint64_t)v39;
          __int16 v81 = 2114;
          double v82 = v15;
          _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [external sync] targetContentItemID=%{public}@", buf, 0x2Au);
        }
        [(MPCQueueController *)self _setTargetContentItemID:v15 source:4];
        goto LABEL_31;
      }
      if (!v18)
      {
LABEL_9:

LABEL_31:
        [v12 queueControllerDidChangeContents:self];
LABEL_62:

        goto LABEL_63;
      }
      uint64_t v19 = [WeakRetained engineID];
      int v20 = [(MPCQueueController *)self sessionID];
      uint64_t v21 = [v13 identifier];
      *(_DWORD *)buf = 138544130;
      os_log_t v76 = v19;
      __int16 v77 = 2114;
      double v78 = v20;
      __int16 v79 = 2114;
      uint64_t v80 = (uint64_t)v21;
      __int16 v81 = 2114;
      double v82 = v15;
      int v22 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [external sync, c"
            "urrent target valid] targetContentItemID=%{public}@";
LABEL_8:
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, v22, buf, 0x2Au);

      goto LABEL_9;
    }
  }
  id v13 = [v5 suggestedStartingContentItemID];
  if (([v5 allowsChangingCurrentItem] & 1) == 0)
  {
    targetContentItemID = self->_targetContentItemID;
    if (targetContentItemID)
    {
LABEL_21:
      uint64_t v15 = targetContentItemID;
      if ([(NSString *)v15 hasPrefix:@"⏳"])
      {
      }
      else
      {
        BOOL v32 = [(NSString *)v15 hasPrefix:@"♻️"];

        if (!v32)
        {
          if (v15)
          {
            if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl itemExistsForContentItemID:v15])
            {
              uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_9;
              }
              uint64_t v19 = [WeakRetained engineID];
              int v20 = [(MPCQueueController *)self sessionID];
              uint64_t v21 = [v5 identifier];
              *(_DWORD *)buf = 138544130;
              os_log_t v76 = v19;
              __int16 v77 = 2114;
              double v78 = v20;
              __int16 v79 = 2114;
              uint64_t v80 = (uint64_t)v21;
              __int16 v81 = 2114;
              double v82 = v15;
              int v22 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [current "
                    "target valid] targetContentItemID=%{public}@";
              goto LABEL_8;
            }
            uint64_t v47 = [v5 suggestedContentItemIDsForDeletedContentItemIDs];
            uint64_t v48 = [v47 objectForKeyedSubscript:v15];

            if (v48)
            {
              v49 = _MPCLogCategoryQueueController();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v71 = [WeakRetained engineID];
                v50 = [(MPCQueueController *)self sessionID];
                uint64_t v51 = [v5 identifier];
                *(_DWORD *)buf = 138544386;
                os_log_t v76 = v71;
                __int16 v77 = 2114;
                double v78 = v50;
                __int16 v79 = 2114;
                uint64_t v80 = v51;
                uint64_t v52 = (void *)v51;
                __int16 v81 = 2114;
                double v82 = v15;
                __int16 v83 = 2114;
                id v84 = v13;
                _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 1: current target invalid, edit suggested replacement] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);
              }
              [(MPCQueueController *)self _setTargetContentItemID:v48 source:5];
              goto LABEL_61;
            }
          }
LABEL_49:
          uint64_t v48 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:v15 mode:2 options:0];
          v53 = [v48 nextObject];
          if (v53)
          {
            if ([(NSString *)v15 isEqualToString:v53])
            {
              v67 = [MEMORY[0x263F08690] currentHandler];
              [v67 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1194, @"Bug in %@: itemExistsForContentItemID returned NO while contentItemIDEnumeratorStartingAfterContentItemID returned the same contentItemID: %@", objc_opt_class(), v15 object file lineNumber description];
            }
            id v54 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              [WeakRetained engineID];
              uint64_t v55 = log = v12;
              [(MPCQueueController *)self sessionID];
              id v56 = v72 = v48;
              id v57 = [v5 identifier];
              *(_DWORD *)buf = 138544386;
              os_log_t v76 = v55;
              __int16 v77 = 2114;
              double v78 = v56;
              __int16 v79 = 2114;
              uint64_t v80 = (uint64_t)v57;
              __int16 v81 = 2114;
              double v82 = v15;
              __int16 v83 = 2114;
              id v84 = v53;
              _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 2: current target invalid, enumerated from invalid item] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);

              uint64_t v48 = v72;
              id v12 = log;
            }

            v58 = self;
            id v59 = v53;
          }
          else
          {
            uint64_t v60 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
            if (!v13)
            {
              if (v61)
              {
                os_log_t logb = [WeakRetained engineID];
                id v65 = [(MPCQueueController *)self sessionID];
                [v5 identifier];
                __int16 v66 = v74 = v48;
                *(_DWORD *)buf = 138544130;
                os_log_t v76 = logb;
                __int16 v77 = 2114;
                double v78 = v65;
                __int16 v79 = 2114;
                uint64_t v80 = (uint64_t)v66;
                __int16 v81 = 2114;
                double v82 = v15;
                _os_log_impl(&dword_21BB87000, v60, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | queue boundary [prong 4: current target invalid, no replacement found] invalidID=%{public}@", buf, 0x2Au);

                uint64_t v48 = v74;
              }

              [v12 queueControllerDidReachUnexpectedEndOfQueue:self];
              goto LABEL_60;
            }
            if (v61)
            {
              uint64_t v62 = [WeakRetained engineID];
              [(MPCQueueController *)self sessionID];
              uint64_t v63 = loga = v60;
              [v5 identifier];
              uint64_t v64 = v73 = v48;
              *(_DWORD *)buf = 138544386;
              os_log_t v76 = v62;
              __int16 v77 = 2114;
              double v78 = v63;
              __int16 v79 = 2114;
              uint64_t v80 = (uint64_t)v64;
              __int16 v81 = 2114;
              double v82 = v15;
              __int16 v83 = 2114;
              id v84 = v13;
              _os_log_impl(&dword_21BB87000, loga, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 3: current target invalid, edit suggested start item] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);

              uint64_t v48 = v73;
              uint64_t v60 = loga;
            }
            v58 = self;
            id v59 = v13;
          }
          [(MPCQueueController *)v58 _setTargetContentItemID:v59 source:5];
LABEL_60:

LABEL_61:
          goto LABEL_62;
        }
      }
      if (self->_loadingContentItemID)
      {
        id v33 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [WeakRetained engineID];
          id v35 = [(MPCQueueController *)self sessionID];
          id v36 = [v5 identifier];
          *(_DWORD *)buf = 138544130;
          os_log_t v76 = v34;
          __int16 v77 = 2114;
          double v78 = v35;
          __int16 v79 = 2114;
          uint64_t v80 = (uint64_t)v36;
          __int16 v81 = 2114;
          double v82 = v15;
          _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [targetContentItemID is QC-Placeholder] targetContentItemID=%{public}@", buf, 0x2Au);
        }
        goto LABEL_62;
      }

      uint64_t v15 = 0;
      goto LABEL_49;
    }
  }
  if (!v13)
  {
    __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [WeakRetained engineID];
      uint64_t v30 = [(MPCQueueController *)self sessionID];
      id v31 = [v5 identifier];
      *(_DWORD *)buf = 138543874;
      os_log_t v76 = v29;
      __int16 v77 = 2114;
      double v78 = v30;
      __int16 v79 = 2114;
      uint64_t v80 = (uint64_t)v31;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no suggested start item [edit allows item change]", buf, 0x20u);
    }
    [v12 queueControllerDidChangeContents:self];
    targetContentItemID = self->_targetContentItemID;
    goto LABEL_21;
  }
  if ([(NSString *)self->_targetContentItemID isEqualToString:v13])
  {
    __int16 v24 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [WeakRetained engineID];
      __int16 v26 = [(MPCQueueController *)self sessionID];
      uint64_t v27 = [v5 identifier];
      *(_DWORD *)buf = 138544130;
      os_log_t v76 = v25;
      __int16 v77 = 2114;
      double v78 = v26;
      __int16 v79 = 2114;
      uint64_t v80 = (uint64_t)v27;
      __int16 v81 = 2114;
      double v82 = (NSString *)v13;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [edit allows item change] targetContentItemID=%{public}@", buf, 0x2Au);
    }
    goto LABEL_44;
  }
  int v40 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl itemExistsForContentItemID:v13];
  double v41 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      uint64_t v43 = [WeakRetained engineID];
      uint64_t v44 = [(MPCQueueController *)self sessionID];
      v45 = [v5 identifier];
      *(_DWORD *)buf = 138544130;
      os_log_t v76 = v43;
      __int16 v77 = 2114;
      double v78 = v44;
      __int16 v79 = 2114;
      uint64_t v80 = (uint64_t)v45;
      __int16 v81 = 2114;
      double v82 = (NSString *)v13;
      uint64_t v46 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [edit allows item ch"
            "ange] targetContentItemID=%{public}@";
LABEL_42:
      _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, v46, buf, 0x2Au);
    }
  }
  else if (v42)
  {
    uint64_t v43 = [WeakRetained engineID];
    uint64_t v44 = [(MPCQueueController *)self sessionID];
    v45 = [v5 identifier];
    *(_DWORD *)buf = 138544130;
    os_log_t v76 = v43;
    __int16 v77 = 2114;
    double v78 = v44;
    __int16 v79 = 2114;
    uint64_t v80 = (uint64_t)v45;
    __int16 v81 = 2114;
    double v82 = (NSString *)v13;
    uint64_t v46 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating to UNKNOWN target [edit allow"
          "s item change - item does NOT exist] targetContentItemID=%{public}@";
    goto LABEL_42;
  }

  objc_storeStrong((id *)&self->_preferredFirstContentItemID, v13);
  [(MPCQueueController *)self _setTargetContentItemID:v13 source:1];
LABEL_44:
  [v12 queueControllerDidChangeContents:self];
LABEL_63:
}

- (void)didSignificantlyChangeItem:(id)a3
{
  if (self->_currentItem == a3) {
    [(MPCQueueController *)self _emitEventsForItemChangeFromItem:a3 toCurrentItem:a3];
  }
}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x263F12178] standardUserDefaults];
  char v10 = [v9 disablePeriodicStateRestore];

  if ((v10 & 1) == 0
    && [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl playbackPositionRestorationPolicy] == 1)
  {
    currentItem = self->_currentItem;
    if (currentItem)
    {
      if (([(MPAVItem *)currentItem isPlaceholder] & 1) == 0)
      {
        id v12 = [v8 mediaRemotePublisher];
        id v13 = [v12 infoCenter];
        if ([v13 playbackState] == 1)
        {
          double lastSavedTime = self->_lastSavedTime;

          if (lastSavedTime != a4)
          {
            self->_double lastSavedTime = a4;
            uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v16 = [v8 engineID];
              uint64_t v17 = [(MPCQueueController *)self sessionID];
              BOOL v18 = [(MPAVItem *)self->_currentItem contentItemID];
              int v19 = 138544386;
              int v20 = v16;
              __int16 v21 = 2114;
              int v22 = v17;
              __int16 v23 = 2048;
              double v24 = a4;
              __int16 v25 = 2048;
              double v26 = a5;
              __int16 v27 = 2114;
              __int16 v28 = v18;
              _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[SNM:%{public}@:%{public}@] engine:didChangeItemElapsedTime:%f rate:%f | updating saved time [engine time changed] activeItemID=%{public}@", (uint8_t *)&v19, 0x34u);
            }
            [(MPCQueueController *)self incrementVersionForSegment:@"metadata"];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl playbackPositionRestorationPolicy] == 1&& (a4 == 4 || a4 == 2))
  {
    currentItem = self->_currentItem;
    if (currentItem)
    {
      if (([(MPAVItem *)currentItem isPlaceholder] & 1) == 0)
      {
        id v8 = [v6 player];
        [v8 currentTime];
        double v10 = v9;

        if (self->_lastSavedTime != v10)
        {
          self->_double lastSavedTime = v10;
          uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = off_2643C2D78[a4 - 2];
            id v13 = [(MPAVItem *)self->_currentItem contentItemID];
            double lastSavedTime = self->_lastSavedTime;
            int v15 = 134218754;
            BOOL v16 = self;
            __int16 v17 = 2114;
            BOOL v18 = v12;
            __int16 v19 = 2114;
            int v20 = v13;
            __int16 v21 = 2048;
            double v22 = lastSavedTime;
            _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "queueController %p: engine:didChangeToState: updating saved time [changed to state %{public}@] currentItem=%{public}@ lastSavedTime=%f", (uint8_t *)&v15, 0x2Au);
          }
          [(MPCQueueController *)self incrementVersionForSegment:@"metadata"];
        }
      }
    }
  }
}

- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [v6 engineID];
    double v10 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138543874;
    int v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] engine:didReachEndOfQueueWithReason:\"%{public}@\"", buf, 0x20u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __58__MPCQueueController_engine_didReachEndOfQueueWithReason___block_invoke;
  v12[3] = &unk_2643C2B60;
  id v13 = v7;
  id v11 = v7;
  [(MPCQueueController *)self _withUpNextBehavior:v12];
  [(MPCQueueController *)self jumpToFirstContentItemWithSource:6];
}

uint64_t __58__MPCQueueController_engine_didReachEndOfQueueWithReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReachEndOfQueueWithReason:*(void *)(a1 + 32)];
}

- (id)beginExternalSyncEditWithReason:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MPCQueueController.m", 935, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = [MPCQueueControllerExternalSyncEdit alloc];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v26[0] = v8;
  v26[1] = v5;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  double v10 = [v9 componentsJoinedByString:@"-"];
  id v11 = [(MPCQueueControllerEdit *)v6 initWithQueueController:self label:v10];

  if ([(MPCQueueControllerEdit *)v11 allowsChangingCurrentItem]) {
    [(NSMutableArray *)self->_potentialCurrentItemEdits addObject:v11];
  }
  activeEdits = self->_activeEdits;
  id v13 = [(MPCQueueControllerEdit *)v11 identifier];
  [(NSMapTable *)activeEdits setObject:v11 forKey:v13];

  uint64_t v14 = [(MPCQueueController *)self playbackEngine];
  int v15 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [v14 engineID];
    __int16 v17 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 2114;
    __int16 v25 = v11;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] beginExternalSyncEditWithReason:… | created edit [] edit=%{public}@", buf, 0x20u);
  }

  return v11;
}

- (MPCPlaybackIntent)fallbackPlaybackIntent
{
  id v2 = [(MPCQueueController *)self playbackEngine];
  id v3 = [v2 fallbackPlaybackIntent];

  return (MPCPlaybackIntent *)v3;
}

- (void)upNextBehaviorDidChange
{
  id v3 = [(MPCQueueController *)self playbackEngine];
  id v4 = [v3 mediaRemotePublisher];
  [v4 publishIfNeeded];

  [(MPCQueueController *)self incrementVersionForSegment:@"behavior"];
}

- (void)behaviorDidChange
{
}

- (id)beginEditWithReason:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    __int16 v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCQueueController.m", 895, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v25[0] = v7;
  v25[1] = v5;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  double v9 = [v8 componentsJoinedByString:@"-"];

  double v10 = [[MPCQueueControllerEdit alloc] initWithQueueController:self label:v9];
  if ([(MPCQueueControllerEdit *)v10 allowsChangingCurrentItem]) {
    [(NSMutableArray *)self->_potentialCurrentItemEdits addObject:v10];
  }
  activeEdits = self->_activeEdits;
  id v12 = [(MPCQueueControllerEdit *)v10 identifier];
  [(NSMapTable *)activeEdits setObject:v10 forKey:v12];

  id v13 = [(MPCQueueController *)self playbackEngine];
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v13 engineID];
    __int16 v16 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    __int16 v23 = 2114;
    __int16 v24 = v10;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] beginEditWithReason:… | created edit [] edit=%{public}@", buf, 0x20u);
  }

  return v10;
}

- (MPCQueueControllerReusableBehavior)reusableBehavior
{
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23F48])behaviorImpl = self->_behaviorImpl; {
  else
  }
    behaviorImpl = 0;

  return behaviorImpl;
}

- (MPCQueueControllerBehavior)behavior
{
  return self->_behaviorImpl;
}

- (void)_withUpNextBehavior:(id)a3
{
  id v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23D80])v4[2](v4, self->_behaviorImpl); {
}
  }

- (void)_withDynamicBehavior:(id)a3
{
  id v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if ([(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl conformsToProtocol:&unk_26CC23E28])v4[2](v4, self->_behaviorImpl); {
}
  }

- (void)jumpToFirstContentItemWithSource:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v6 = @"Unknown";
  switch(a3)
  {
    case 0:
      break;
    case 1:
      id v6 = @"StartItem";
      break;
    case 2:
      id v6 = @"UserSelected";
      break;
    case 3:
      id v6 = @"NaturalTransition";
      break;
    case 4:
      id v6 = @"ExternalSync";
      break;
    case 5:
      id v6 = @"Redirect";
      break;
    case 6:
      id v6 = @"QueueBoundary";
      break;
    case 7:
      id v6 = @"Restored";
      break;
    default:
      if (a3 == 100)
      {
        id v6 = @"Loading";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/%ld", a3);
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [WeakRetained engineID];
    double v9 = [(MPCQueueController *)self sessionID];
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    __int16 v22 = v9;
    __int16 v23 = 2114;
    __int16 v24 = v6;
    __int16 v25 = 2114;
    double v26 = behaviorImpl;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToFirstContentItemWithSource:%{public}@ | enumerating behavior from nil [] behavior=%{public}@", buf, 0x2Au);
  }
  id v11 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:0 mode:2 options:0];
  id v12 = [v11 nextObject];
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [WeakRetained engineID];
    int v15 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    __int16 v24 = v6;
    __int16 v25 = 2114;
    double v26 = v12;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToFirstContentItemWithSource:%{public}@ | updating target [] firstContentItemID=%{public}@", buf, 0x2Au);
  }
  [(MPCQueueController *)self _setTargetContentItemID:v12 source:a3];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__MPCQueueController_jumpToFirstContentItemWithSource___block_invoke;
  v17[3] = &unk_2643C2AA0;
  __int16 v18 = v12;
  __int16 v16 = v12;
  [(MPCQueueController *)self _withExternalSyncBehavior:v17];
}

uint64_t __55__MPCQueueController_jumpToFirstContentItemWithSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didJumpToTargetContentItemID:*(void *)(a1 + 32)];
}

- (void)jumpToContentItemID:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [WeakRetained engineID];
    id v8 = [(MPCQueueController *)self sessionID];
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544130;
    __int16 v23 = v7;
    __int16 v24 = 2114;
    __int16 v25 = v8;
    __int16 v26 = 2114;
    id v27 = v4;
    __int16 v28 = 2114;
    uint64_t v29 = behaviorImpl;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | validating item [] behavior=%{public}@", buf, 0x2Au);
  }
  double v10 = self->_behaviorImpl;
  id v21 = 0;
  char v11 = [(MPCQueueControllerBehaviorImplementation *)v10 canJumpToContentItemID:v4 reason:&v21];
  id v12 = (MPCQueueControllerBehaviorImplementation *)v21;
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  uint64_t v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [WeakRetained engineID];
      __int16 v16 = [(MPCQueueController *)self sessionID];
      *(_DWORD *)buf = 138543874;
      __int16 v23 = v15;
      __int16 v24 = 2114;
      __int16 v25 = v16;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | updating target", buf, 0x20u);
    }
    [(MPCQueueController *)self _setTargetContentItemID:v4 source:2];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__MPCQueueController_jumpToContentItemID___block_invoke;
    v19[3] = &unk_2643C2AA0;
    uint64_t v20 = v4;
    [(MPCQueueController *)self _withExternalSyncBehavior:v19];
    uint64_t v14 = v20;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = [WeakRetained engineID];
    __int16 v18 = [(MPCQueueController *)self sessionID];
    *(_DWORD *)buf = 138544130;
    __int16 v23 = v17;
    __int16 v24 = 2114;
    __int16 v25 = v18;
    __int16 v26 = 2114;
    id v27 = v4;
    __int16 v28 = 2114;
    uint64_t v29 = v12;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | failing skip [%{public}@]", buf, 0x2Au);
  }
}

uint64_t __42__MPCQueueController_jumpToContentItemID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didJumpToTargetContentItemID:*(void *)(a1 + 32)];
}

- (void)jumpToContentItemID:(id)a3 direction:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  if ((unint64_t)(a4 + 1) > 6) {
    double v9 = @"MPCPlayerDirectionReverseJump";
  }
  else {
    double v9 = off_2643C2D40[a4 + 1];
  }
  double v10 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = [WeakRetained engineID];
    id v12 = [(MPCQueueController *)self sessionID];
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544386;
    id v33 = v11;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v7;
    __int16 v38 = 2114;
    uint64_t v39 = v9;
    __int16 v40 = 2114;
    double v41 = behaviorImpl;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | validating item [] behavior=%{public}@", buf, 0x34u);
  }
  switch(a4)
  {
    case -2:
    case 2:
      id v31 = 0;
      BOOL v14 = [(MPCQueueController *)self canJumpToContentItemID:v7 reason:&v31];
      int v15 = (MPCQueueControllerBehaviorImplementation *)v31;
      if (v14) {
        goto LABEL_15;
      }
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      __int16 v17 = [WeakRetained engineID];
      __int16 v18 = [(MPCQueueController *)self sessionID];
      *(_DWORD *)buf = 138544386;
      id v33 = v17;
      __int16 v34 = 2114;
      id v35 = v18;
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2114;
      uint64_t v39 = v9;
      __int16 v40 = 2114;
      double v41 = v15;
      id v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing jump [%{public}@]";
      goto LABEL_21;
    case -1:
      targetContentItemID = self->_targetContentItemID;
      id v30 = 0;
      BOOL v21 = [(MPCQueueController *)self canPreviousTrackForContentItemID:targetContentItemID reason:&v30];
      int v15 = (MPCQueueControllerBehaviorImplementation *)v30;
      if (v21) {
        goto LABEL_15;
      }
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      __int16 v17 = [WeakRetained engineID];
      __int16 v18 = [(MPCQueueController *)self sessionID];
      *(_DWORD *)buf = 138544386;
      id v33 = v17;
      __int16 v34 = 2114;
      id v35 = v18;
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2114;
      uint64_t v39 = v9;
      __int16 v40 = 2114;
      double v41 = v15;
      id v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing previous [%{public}@]";
      goto LABEL_21;
    case 0:
    case 5:
      int v15 = [MEMORY[0x263F08690] currentHandler];
      [(MPCQueueControllerBehaviorImplementation *)v15 handleFailureInMethod:a2, self, @"MPCQueueController.m", 781, @"Unsupported jump direction: %ld", a4 object file lineNumber description];
      goto LABEL_23;
    case 1:
      __int16 v22 = self->_targetContentItemID;
      id v29 = 0;
      BOOL v23 = [(MPCQueueController *)self canNextTrackForContentItemID:v22 reason:&v29];
      int v15 = (MPCQueueControllerBehaviorImplementation *)v29;
      if (v23)
      {
LABEL_15:

LABEL_16:
        __int16 v24 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = [WeakRetained engineID];
          __int16 v26 = [(MPCQueueController *)self sessionID];
          *(_DWORD *)buf = 138544130;
          id v33 = v25;
          __int16 v34 = 2114;
          id v35 = v26;
          __int16 v36 = 2114;
          id v37 = v7;
          __int16 v38 = 2114;
          uint64_t v39 = v9;
          _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | updating target", buf, 0x2Au);
        }
        [(MPCQueueController *)self _setTargetContentItemID:v7 source:2];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __52__MPCQueueController_jumpToContentItemID_direction___block_invoke;
        v27[3] = &unk_2643C2AA0;
        __int16 v28 = (MPCQueueControllerBehaviorImplementation *)v7;
        [(MPCQueueController *)self _withExternalSyncBehavior:v27];
        int v15 = v28;
      }
      else
      {
        __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = [WeakRetained engineID];
          __int16 v18 = [(MPCQueueController *)self sessionID];
          *(_DWORD *)buf = 138544386;
          id v33 = v17;
          __int16 v34 = 2114;
          id v35 = v18;
          __int16 v36 = 2114;
          id v37 = v7;
          __int16 v38 = 2114;
          uint64_t v39 = v9;
          __int16 v40 = 2114;
          double v41 = v15;
          id v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing next [%{public}@]";
LABEL_21:
          _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x34u);
        }
LABEL_22:
      }
LABEL_23:

      return;
    default:
      goto LABEL_16;
  }
}

uint64_t __52__MPCQueueController_jumpToContentItemID_direction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didJumpToTargetContentItemID:*(void *)(a1 + 32)];
}

- (void)_setTargetContentItemID:(id)a3 source:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = (NSString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [WeakRetained engineID];
    double v10 = [(MPCQueueController *)self sessionID];
    char v11 = @"Unknown";
    switch(a4)
    {
      case 0:
        break;
      case 1:
        char v11 = @"StartItem";
        break;
      case 2:
        char v11 = @"UserSelected";
        break;
      case 3:
        char v11 = @"NaturalTransition";
        break;
      case 4:
        char v11 = @"ExternalSync";
        break;
      case 5:
        char v11 = @"Redirect";
        break;
      case 6:
        char v11 = @"QueueBoundary";
        break;
      case 7:
        char v11 = @"Restored";
        break;
      default:
        if (a4 == 100)
        {
          char v11 = @"Loading";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/%ld", a4);
          char v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    *(_DWORD *)buf = 138544130;
    __int16 v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    __int16 v22 = v11;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] setTargetContentItemID:%{public}@ source:%{public}@ | updating target", buf, 0x2Au);
  }
  targetContentItemID = self->_targetContentItemID;
  self->_targetContentItemID = v6;
  id v13 = v6;

  self->_int64_t targetContentItemSource = a4;
  [(MPCQueueController *)self _evaluateContextAwareTriggersWithReason:@"targetItem changed"];
  BOOL v14 = [(MPCQueueController *)self delegate];
  [v14 queueController:self didChangeTargetContentItemID:v13];

  [(MPCQueueController *)self incrementVersionForSegment:@"metadata"];
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  return [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl canJumpToContentItemID:a3 reason:a4];
}

uint64_t __40__MPCQueueController_performAfterEdits___block_invoke_113(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __40__MPCQueueController_performAfterEdits___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (void)performSetQueue:(id)a3 loadingItemReady:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  behaviorImpl = self->_behaviorImpl;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke;
  id v30 = &unk_2643C2AF0;
  id v31 = self;
  id v13 = WeakRetained;
  id v32 = v13;
  id v14 = v8;
  id v33 = v14;
  id v15 = v9;
  id v34 = v15;
  __int16 v16 = [(MPCQueueControllerBehaviorImplementation *)behaviorImpl performLoadCommand:v14 completion:&v27];
  __int16 v17 = v16;
  if (v16)
  {
    __int16 v18 = v16;
    loadingContentItemID = self->_loadingContentItemID;
    self->_loadingContentItemID = v18;
  }
  else
  {
    loadingContentItemID = [(MPCQueueController *)self sessionID];
    uint64_t v20 = [@"⏳-" stringByAppendingString:loadingContentItemID];
    __int16 v21 = self->_loadingContentItemID;
    self->_loadingContentItemID = v20;
  }
  __int16 v22 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v13 engineID];
    __int16 v24 = [(MPCQueueController *)self sessionID];
    __int16 v25 = [v14 commandID];
    __int16 v26 = self->_loadingContentItemID;
    *(_DWORD *)buf = 138544130;
    __int16 v36 = v23;
    __int16 v37 = 2114;
    __int16 v38 = v24;
    __int16 v39 = 2114;
    __int16 v40 = v25;
    __int16 v41 = 2114;
    uint64_t v42 = v26;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performSetQueue:%{public}@ … | updating loading content item [] loadingContentItemID=%{public}@", buf, 0x2Au);
  }
  v10[2](v10);
}

void __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke_2;
  block[3] = &unk_2643C3848;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 40) engineID];
    id v6 = [*(id *)(a1 + 32) sessionID];
    id v7 = [*(id *)(a1 + 48) commandID];
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performSetQueue:%{public}@ … | clearing loading content item", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 queueController:*(void *)(a1 + 32) didChangeTargetContentItemID:*(void *)(*(void *)(a1 + 32) + 56)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCQueueController *)self music];
  id v6 = [v5 contentItemIDWithoutRepeatIteration:v4];
  id v7 = v6;
  if (!v6) {
    id v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (void)enumerateContentItemIDsInMode:(int64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, NSString *, unsigned char *))a4;
  char v13 = 0;
  loadingContentItemID = self->_loadingContentItemID;
  if (loadingContentItemID) {
    goto LABEL_6;
  }
  id v8 = self->_targetContentItemID;
  if ([(NSString *)v8 hasPrefix:@"⏳"])
  {

LABEL_5:
    loadingContentItemID = self->_targetContentItemID;
LABEL_6:
    v6[2](v6, loadingContentItemID, &v13);
    goto LABEL_7;
  }
  BOOL v9 = [(NSString *)v8 hasPrefix:@"♻️"];

  if (v9) {
    goto LABEL_5;
  }
  if (self->_targetContentItemID)
  {
    int v10 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:0 mode:a3 options:0];
    id v11 = [v10 nextObject];
    do
    {
      v6[2](v6, v11, &v13);
      if (v13) {
        break;
      }
      uint64_t v12 = [v10 nextObject];

      id v11 = (NSString *)v12;
    }
    while (v12);
  }
LABEL_7:
}

- (id)contentItemIDWithCurrentItemOffset:(int64_t)a3 mode:(int64_t)a4 didReachEnd:(BOOL *)a5
{
  return [(MPCQueueController *)self _contentItemIDWithOffset:a3 fromItemID:self->_targetContentItemID mode:a4 didReachEnd:a5];
}

- (id)contentItemIDAtIndex:(int64_t)a3
{
  id v4 = [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl contentItemIDEnumeratorStartingAfterContentItemID:0 mode:1 options:0];
  id v5 = v4;
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v4 nextObject];
    if (v6)
    {
      int64_t v7 = a3 + 1;
      do
      {
        if (!--v7) {
          break;
        }

        id v6 = [v5 nextObject];
      }
      while (v6);
    }
  }

  return v6;
}

void __36__MPCQueueController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
  id v4 = a2;
  *(void *)(*(void *)(a1 + 32) + 64) = 1;
}

uint64_t __36__MPCQueueController_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 connectToExternalSyncHost:*(void *)(a1 + 32)];
}

- (void)didDisconnectFromPlaybackEngine:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_currentItem)
  {
    objc_storeWeak((id *)&self->_playbackEngine, v4);
    [(MPCQueueController *)self _emitEventsForItemChangeFromItem:self->_currentItem toCurrentItem:0];
  }
  if (objc_opt_respondsToSelector()) {
    [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl didDisconnectFromHost:self];
  }
  id v5 = [v4 eventStream];
  id v8 = @"session-id";
  id v6 = [(MPCQueueController *)self sessionID];
  v9[0] = v6;
  int64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 emitEventType:@"session-end" payload:v7];

  objc_storeWeak((id *)&self->_playbackEngine, 0);
}

- (void)willDisconnectFromPlaybackEngine:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCQueueController *)self music];
  [v5 setHostingSharedSessionID:0 reason:@"Local Session Teardown [GroupSession will continue]"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__MPCQueueController_willDisconnectFromPlaybackEngine___block_invoke;
  v6[3] = &unk_2643C2AA0;
  v6[4] = self;
  [(MPCQueueController *)self _withExternalSyncBehavior:v6];
  [(MPCQueueControllerBehaviorImplementation *)self->_behaviorImpl disconnectFromHost:self];
  [v4 removeEngineObserver:self];

  objc_storeWeak((id *)&self->_playbackEngine, 0);
}

uint64_t __55__MPCQueueController_willDisconnectFromPlaybackEngine___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disconnectFromExternalSyncHost:*(void *)(a1 + 32)];
}

uint64_t __50__MPCQueueController_willConnectToPlaybackEngine___block_invoke(uint64_t a1, void *a2)
{
  return [a2 connectToExternalSyncHost:*(void *)(a1 + 32)];
}

- (NSString)debugDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"## QueueController <%p>\n", self);
  id v4 = [(MPCQueueController *)self _stateDictionaryIncludingQueue:1];
  id v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:11 error:0];
  id v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

  return (NSString *)v3;
}

- (void)dealloc
{
  MEMORY[0x21D49D7C0](self->_stateHandle, a2);
  v3.receiver = self;
  v3.super_class = (Class)MPCQueueController;
  [(MPCQueueController *)&v3 dealloc];
}

- (MPCQueueController)initWithBehaviorType:(int64_t)a3 sessionID:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      objc_opt_class();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 5:
      id v8 = (id)__testBehaviorClass;
LABEL_4:
      int64_t v7 = (objc_class *)v8;
      break;
    default:
      int64_t v7 = 0;
      break;
  }
  BOOL v9 = (void *)[[v7 alloc] initWithSessionID:v6];
  int v10 = [(MPCQueueController *)self init];
  id v11 = v10;
  if (v10)
  {
    v10->_int64_t behaviorType = a3;
    objc_storeStrong((id *)&v10->_behaviorImpl, v9);
  }

  return v11;
}

uint64_t __26__MPCQueueController_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      BOOL v9 = [WeakRetained _stateDictionaryIncludingQueue:1];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)unregisterPublisher:(id)a3
{
  id v3 = a3;
  id v6 = +[_MPCQueueControllerRegistry shared];
  id v4 = [v6 publisherProxy];
  id v5 = [v4 objects];
  [v5 removeObject:v3];
}

+ (int64_t)behaviorForQueue:(id)a3
{
  id v3 = a3;
  if (([(id)objc_opt_class() isSystemPodcasts] & 1) == 0)
  {
    if (+[_MPCQueueControllerBehaviorMusic canLoadQueue:v3 reason:0])
    {
      int64_t v4 = 2;
      goto LABEL_12;
    }
    if (+[_MPCQueueControllerBehaviorMusicSharePlay canLoadQueue:v3 reason:0])
    {
      int64_t v4 = 3;
      goto LABEL_12;
    }
  }
  int64_t v4 = 0;
  if (!+[_MPCQueueControllerBehaviorEmpty canLoadQueue:v3 reason:0])
  {
    if (+[_MPCQueueControllerBehaviorPodcasts canLoadQueue:v3 reason:0])
    {
      int64_t v4 = 4;
    }
    else if ([(id)__testBehaviorClass canLoadQueue:v3 reason:0])
    {
      int64_t v4 = 5;
    }
    else
    {
      int64_t v4 = 0;
    }
  }
LABEL_12:

  return v4;
}

+ (void)setTestBehaviorClass:(Class)a3
{
  __testBehaviorClass = (uint64_t)a3;
}

+ (Class)testBehaviorClass
{
  return (Class)(id)__testBehaviorClass;
}

@end