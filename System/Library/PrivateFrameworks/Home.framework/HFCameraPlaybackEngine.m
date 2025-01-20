@interface HFCameraPlaybackEngine
+ (id)findClipPositionForDate:(id)a3 inEvents:(id)a4 options:(unint64_t)a5;
+ (unint64_t)hf_indexOfClipForDate:(id)a3 inEvents:(id)a4 enumerationOptions:(unint64_t)a5 searchOptions:(unint64_t)a6;
- (AVPlayer)player;
- (BOOL)hasRecordingEvents;
- (BOOL)isCameraPortraitMode;
- (BOOL)isFirstEventOfTheDay:(id)a3;
- (BOOL)isLiveStreamPlaying;
- (BOOL)isLiveStreaming;
- (BOOL)isMicrophoneEnabled;
- (BOOL)isPictureInPictureModeActive;
- (BOOL)isScrubbing;
- (BOOL)isStreamAudioEnabled;
- (BOOL)isUserScrubbing;
- (BOOL)prefersAudioEnabled;
- (BOOL)shouldBatchRecordingEvents;
- (BOOL)shouldBypassHighQualityScrubbing;
- (BOOL)shouldBypassVideoFetchRequest;
- (BOOL)shouldDisplayVolumeControls;
- (BOOL)wantsToPlay;
- (HFCameraAnalyticsCameraClipPlaybackSessionEvent)playbackSessionEvent;
- (HFCameraClipPlaying)clipPlayer;
- (HFCameraClipPlaying)overrideClipPlayer;
- (HFCameraClipScrubbing)clipScrubber;
- (HFCameraLiveStreamControlling)liveStreamController;
- (HFCameraLiveStreamControlling)overrideLiveStreamController;
- (HFCameraPlaybackEngine)init;
- (HFCameraPlaybackEngine)initWithConfiguration:(id)a3;
- (HFCameraPlaybackEngineEventCache)eventCache;
- (HFCameraPlaybackPosition)playbackPosition;
- (HMCameraClip)clipWithLongestDuration;
- (HMCameraClip)currentClip;
- (HMCameraClipManager)clipManager;
- (HMCameraProfile)cameraProfile;
- (HMCameraSource)liveCameraSource;
- (HMHome)home;
- (NADelegateDispatcher)observerDispatcher;
- (NSArray)cameraClips;
- (NSArray)cameraEvents;
- (NSArray)observers;
- (NSDate)lastRequestedClipPlaybackDate;
- (NSError)playbackError;
- (NSMapTable)observerStates;
- (NSSet)batchedRecordingEvents;
- (NSUUID)notificationCenterClipUUID;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)batchedRecordingEventsTimer;
- (float)streamAudioVolume;
- (id)_derivedPlaybackError;
- (id)daysWithClips;
- (id)engineModeDescription;
- (id)findClipPositionForDate:(id)a3;
- (id)findClipPositionForDate:(id)a3 options:(unint64_t)a4;
- (id)firstOfTheDayClipForDate:(id)a3;
- (id)shortDebugDescription;
- (id)timeControlStatusDescription;
- (id)timelineStateDescription;
- (int64_t)lastPlayerTimeControlStatus;
- (unint64_t)_derivedTimeControlStatus;
- (unint64_t)engineMode;
- (unint64_t)playbackContentType;
- (unint64_t)playbackRetryAttempts;
- (unint64_t)scrubbingInProgressCount;
- (unint64_t)scrubbingSpeed;
- (unint64_t)timeControlStatus;
- (unint64_t)timelineState;
- (void)_fetchCameraEventsWithCompletion:(id)a3;
- (void)_recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4;
- (void)_setMicrophoneEnabled:(BOOL)a3 notifyObservers:(BOOL)a4;
- (void)_setPlayerVolume:(float)a3 notifyObservers:(BOOL)a4;
- (void)_setStreamAudioEnabled:(BOOL)a3 notifyObservers:(BOOL)a4;
- (void)_setupClipPlayerWithClipManager:(id)a3;
- (void)_setupLiveStreamController:(id)a3;
- (void)_setupTimeObservationForObserver:(id)a3;
- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3;
- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3 rebuildClipPlayerIfNeeded:(BOOL)a4;
- (void)_updateStateForRequestedPlaybackPosition:(id)a3 notifyObservers:(BOOL)a4;
- (void)addObserver:(id)a3 withOptions:(id)a4;
- (void)beginScrubbing;
- (void)clipPlayer:(id)a3 didUpdateError:(id)a4 isFatal:(BOOL)a5;
- (void)clipPlayer:(id)a3 didUpdateMuted:(BOOL)a4;
- (void)clipPlayer:(id)a3 didUpdateTimeControlStatus:(int64_t)a4;
- (void)clipPlayerDidPlayToEndTime:(id)a3;
- (void)dealloc;
- (void)endScrubbing;
- (void)fetchCameraClipForNotificationUUID:(id)a3 withCompletion:(id)a4;
- (void)fetchCameraClipForUUID:(id)a3 withCompletion:(id)a4;
- (void)fetchCameraEventsWithCompletion:(id)a3;
- (void)modifyPlaybackFromSender:(id)a3 usingBlock:(id)a4;
- (void)pause;
- (void)play;
- (void)recordingEventManager:(id)a3 didRemoveRecordingEventsWithUUIDs:(id)a4;
- (void)recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setBatchedRecordingEvents:(id)a3;
- (void)setBatchedRecordingEventsTimer:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setClipManager:(id)a3;
- (void)setEngineMode:(unint64_t)a3;
- (void)setEventCache:(id)a3;
- (void)setHome:(id)a3;
- (void)setLastPlayerTimeControlStatus:(int64_t)a3;
- (void)setLastRequestedClipPlaybackDate:(id)a3;
- (void)setLiveCameraSource:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setNotificationCenterClipUUID:(id)a3;
- (void)setOverrideClipPlayer:(id)a3;
- (void)setOverrideLiveStreamController:(id)a3;
- (void)setPictureInPictureModeActive:(BOOL)a3;
- (void)setPlaybackContentType:(unint64_t)a3;
- (void)setPlaybackError:(id)a3;
- (void)setPlaybackPosition:(id)a3;
- (void)setPlaybackRetryAttempts:(unint64_t)a3;
- (void)setPlaybackSessionEvent:(id)a3;
- (void)setPrefersAudioEnabled:(BOOL)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setScrubbingInProgressCount:(unint64_t)a3;
- (void)setScrubbingSpeed:(unint64_t)a3;
- (void)setShouldBatchRecordingEvents:(BOOL)a3;
- (void)setShouldBypassHighQualityScrubbing:(BOOL)a3;
- (void)setShouldBypassVideoFetchRequest:(BOOL)a3;
- (void)setStreamAudioEnabled:(BOOL)a3;
- (void)setStreamAudioVolume:(float)a3;
- (void)setTimeControlStatus:(unint64_t)a3;
- (void)setTimelineState:(unint64_t)a3;
- (void)setUserScrubbing:(BOOL)a3;
- (void)setWantsToPlay:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startPlaybackAtDate:(id)a3 withClip:(id)a4;
- (void)startPlaybackForCurrentClip;
- (void)streamControllerStateDidUpdate:(id)a3;
- (void)updateConfiguration:(id)a3;
- (void)updateLiveStreamForCameraProfile:(id)a3;
- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4;
@end

@implementation HFCameraPlaybackEngine

- (HFCameraPlaybackEngine)init
{
  return [(HFCameraPlaybackEngine *)self initWithConfiguration:0];
}

- (HFCameraPlaybackEngine)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFCameraPlaybackEngine;
  v5 = [(HFCameraPlaybackEngine *)&v26 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.homeFramework.cameraPlaybackEngine.workQueue", v6);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x263F58180]);
    v10 = HFLogForCategory(0x17uLL);
    v11 = (void *)[v9 initWithLog:v10 logType:1 argumentFormatter:0];

    uint64_t v12 = [MEMORY[0x263F58178] dispatcherWithProtocol:&unk_26C1829F8 logSettings:v11];
    observerDispatcher = v5->_observerDispatcher;
    v5->_observerDispatcher = (NADelegateDispatcher *)v12;

    uint64_t v14 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    observerStates = v5->_observerStates;
    v5->_observerStates = (NSMapTable *)v14;

    v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5->_prefersAudioEnabled = [v16 BOOLForKey:@"HFCameraPlaybackPrefersAudioEnabled"];

    [(HFCameraPlaybackEngine *)v5 setStreamAudioEnabled:[(HFCameraPlaybackEngine *)v5 prefersAudioEnabled]];
    v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v17 floatForKey:@"HFCameraPlaybackStreamAudioVolume"];
    float v19 = v18;

    v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v21 = [v20 objectForKey:@"HFCameraPlaybackStreamAudioVolume"];

    LODWORD(v22) = 0.5;
    if (v21) {
      *(float *)&double v22 = v19;
    }
    [(HFCameraPlaybackEngine *)v5 setStreamAudioVolume:v22];
    uint64_t v23 = objc_opt_new();
    batchedRecordingEvents = v5->_batchedRecordingEvents;
    v5->_batchedRecordingEvents = (NSSet *)v23;

    if (v4) {
      [(HFCameraPlaybackEngine *)v5 updateConfiguration:v4];
    }
  }
  return v5;
}

- (void)updateLiveStreamForCameraProfile:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFCameraPlaybackEngine *)self cameraProfile];

  v6 = HFLogForCategory(0x17uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      v11 = [(HFCameraPlaybackEngine *)self cameraProfile];
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Bypassing live stream update for the current profile:%@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v8 = [(HFCameraPlaybackEngine *)self cameraProfile];
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Updating from camera profile:%@ to profile:%@", (uint8_t *)&v14, 0x16u);
    }
    [(HFCameraPlaybackEngine *)self setCameraProfile:v4];
    id v9 = [(HFCameraPlaybackEngine *)self overrideLiveStreamController];
    v10 = v9;
    if (v9)
    {
      v6 = v9;
    }
    else
    {
      uint64_t v12 = [HFCameraLiveStreamController alloc];
      v13 = [(HFCameraPlaybackEngine *)self home];
      v6 = [(HFCameraLiveStreamController *)v12 initWithHome:v13 cameraProfile:v4];
    }
    [(HFCameraPlaybackEngine *)self _setupLiveStreamController:v6];
  }
}

- (void)setCameraProfile:(id)a3
{
  id v4 = (HMCameraProfile *)a3;
  os_unfair_lock_lock_with_options();
  cameraProfile = self->_cameraProfile;
  self->_cameraProfile = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCameraProfile)cameraProfile
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_cameraProfile;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setShouldBatchRecordingEvents:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_shouldBatchRecordingEvents = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldBatchRecordingEvents
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldBatchRecordingEvents;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNotificationCenterClipUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  notificationCenterClipUUID = self->_notificationCenterClipUUID;
  self->_notificationCenterClipUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)notificationCenterClipUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationCenterClipUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBatchedRecordingEvents:(id)a3
{
  id v4 = (NSSet *)a3;
  if (!+[HFUtilities isInternalTest])
  {
    id v5 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_assert_queue_V2(v5);
  }
  batchedRecordingEvents = self->_batchedRecordingEvents;
  self->_batchedRecordingEvents = v4;
}

- (NSSet)batchedRecordingEvents
{
  if (!+[HFUtilities isInternalTest])
  {
    v3 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_assert_queue_V2(v3);
  }
  batchedRecordingEvents = self->_batchedRecordingEvents;
  return batchedRecordingEvents;
}

- (void)_setupLiveStreamController:(id)a3
{
  id v4 = (HFCameraLiveStreamControlling *)a3;
  liveStreamController = self->_liveStreamController;
  v6 = v4;
  if (liveStreamController != v4)
  {
    [(HFCameraLiveStreamControlling *)liveStreamController setDelegate:0];
    v6 = self->_liveStreamController;
  }
  self->_liveStreamController = v4;
  id v9 = v4;

  [(HFCameraLiveStreamControlling *)self->_liveStreamController setDelegate:self];
  BOOL v7 = [(HFCameraLiveStreamControlling *)v9 liveCameraSource];
  liveCameraSource = self->_liveCameraSource;
  self->_liveCameraSource = v7;
}

- (void)_setupClipPlayerWithClipManager:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(HFCameraPlaybackEngine *)self eventCache];
    id v5 = [v4 clips];

    v6 = [(HFCameraPlaybackEngine *)self overrideClipPlayer];
    BOOL v7 = v6;
    if (v6)
    {
      v8 = v6;
      clipPlayer = self->_clipPlayer;
      self->_clipPlayer = v8;
    }
    else
    {
      v15 = [HFCameraClipPlayer alloc];
      clipPlayer = [(HFCameraPlaybackEngine *)self cameraProfile];
      __int16 v16 = [(HFCameraClipPlayer *)v15 initWithCameraProfile:clipPlayer clips:v5];
      id v17 = self->_clipPlayer;
      self->_clipPlayer = v16;
    }
    [(HFCameraClipPlaying *)self->_clipPlayer setDelegate:self];
    uint64_t v18 = [(HFCameraPlaybackEngine *)self clipScrubber];
    [(HFCameraClipPlaying *)self->_clipPlayer setScrubber:v18];

    float v19 = [(HFCameraPlaybackEngine *)self playbackPosition];
    [(HFCameraPlaybackEngine *)self _updateStateForRequestedPlaybackPosition:v19 notifyObservers:0];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v20 = [(HFCameraPlaybackEngine *)self observerStates];
    v21 = [v20 keyEnumerator];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          [(HFCameraPlaybackEngine *)self _setupTimeObservationForObserver:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v23);
    }
LABEL_27:

    return;
  }
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    v10 = [(HFCameraPlaybackEngine *)self cameraProfile];
    id v5 = +[HFDemoModeAccessoryManager clipsForCameraProfile:v10];

    v11 = [(HFCameraPlaybackEngine *)self overrideClipPlayer];
    uint64_t v12 = v11;
    if (v11)
    {
      v13 = v11;
      int v14 = self->_clipPlayer;
      self->_clipPlayer = v13;
    }
    else
    {
      v27 = [HFCameraClipPlayer alloc];
      int v14 = [(HFCameraPlaybackEngine *)self cameraProfile];
      v28 = [(HFCameraClipPlayer *)v27 initWithCameraProfile:v14 clips:v5];
      v29 = self->_clipPlayer;
      self->_clipPlayer = v28;
    }
    [(HFCameraClipPlaying *)self->_clipPlayer setDelegate:self];
    v30 = [(HFCameraPlaybackEngine *)self clipScrubber];
    [(HFCameraClipPlaying *)self->_clipPlayer setScrubber:v30];

    v31 = [(HFCameraPlaybackEngine *)self playbackPosition];
    [(HFCameraPlaybackEngine *)self _updateStateForRequestedPlaybackPosition:v31 notifyObservers:0];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v32 = [(HFCameraPlaybackEngine *)self observerStates];
    v21 = [v32 keyEnumerator];

    uint64_t v33 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(v21);
          }
          [(HFCameraPlaybackEngine *)self _setupTimeObservationForObserver:*(void *)(*((void *)&v37 + 1) + 8 * j)];
        }
        uint64_t v34 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v34);
    }
    goto LABEL_27;
  }
  [(HFCameraClipPlaying *)self->_clipPlayer setDelegate:0];
  [(HFCameraClipPlaying *)self->_clipPlayer setScrubber:0];
  objc_super v26 = self->_clipPlayer;
  self->_clipPlayer = 0;
}

- (void)_setupTimeObservationForObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraPlaybackEngine *)self observerStates];
  v6 = [v5 objectForKey:v4];

  BOOL v7 = [v6 options];
  v8 = [v7 periodicTimeUpdateInterval];

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    id v9 = [v6 options];
    v10 = [v9 periodicTimeUpdateInterval];
    [v10 doubleValue];
    double v12 = v11;

    v13 = [(HFCameraPlaybackEngine *)self clipPlayer];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __59__HFCameraPlaybackEngine__setupTimeObservationForObserver___block_invoke;
    uint64_t v18 = &unk_26408F7F8;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, &from);
    int v14 = [v13 addPeriodicTimeObserverForInterval:&v15 usingBlock:v12];
    objc_msgSend(v6, "setTimeObservationToken:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __59__HFCameraPlaybackEngine__setupTimeObservationForObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = [WeakRetained playbackPosition];
    [v2 playbackEngine:WeakRetained didUpdatePlaybackPosition:v3];
  }
}

- (void)fetchCameraEventsWithCompletion:(id)a3
{
  id v4 = a3;
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    id v5 = [(HFCameraPlaybackEngine *)self cameraProfile];
    v6 = [v5 clipManager];
    [(HFCameraPlaybackEngine *)self setClipManager:v6];

    BOOL v7 = [(HFCameraPlaybackEngine *)self cameraProfile];
    uint64_t v8 = +[HFDemoModeAccessoryManager clipsForCameraProfile:v7];
    id v9 = (void *)v8;
    v10 = (void *)MEMORY[0x263EFFA68];
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    double v12 = [(HFCameraPlaybackEngine *)self eventCache];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke;
    v17[3] = &unk_26408CAF8;
    id v18 = v11;
    id v19 = v4;
    id v13 = v11;
    [v12 updateWithEvents:v13 completion:v17];
  }
  else if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPlaybackEngine *)self _fetchCameraEventsWithCompletion:v4];
  }
  else
  {
    int v14 = [(HFCameraPlaybackEngine *)self workQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_3;
    v15[3] = &unk_26408D5B0;
    v15[4] = self;
    id v16 = v4;
    dispatch_async(v14, v15);
  }
}

void __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_2;
  v2[3] = &unk_26408DF88;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __58__HFCameraPlaybackEngine_fetchCameraEventsWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCameraEventsWithCompletion:*(void *)(a1 + 40)];
}

- (void)_fetchCameraEventsWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  v6 = [MEMORY[0x263EFF910] dateWithTimeInterval:v5 sinceDate:86400.0];
  BOOL v7 = [MEMORY[0x263EFF910] dateWithTimeInterval:v5 sinceDate:-950400.0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v6];
  id v9 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Loading clips with date interval:%@.", buf, 0xCu);
  }

  v10 = HFLogForCategory(0xFuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Requesting playback engine clips with date interval:%@.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v11 = [(HFCameraPlaybackEngine *)self cameraProfile];
  double v12 = [v11 recordingEventManager];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke;
  v15[3] = &unk_26409A698;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v8;
  id v16 = v13;
  id v14 = v4;
  id v17 = v14;
  [v12 fetchEventsWithDateInterval:v13 quality:0 limit:100000 shouldOrderAscending:1 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = HFLogForCategory(0x17uLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [WeakRetained cameraProfile];
      id v11 = [v10 recordingEventManager];
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = (uint64_t)v11;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Event manager:%@ failed to fetch events for dateInterval:%@ with error:%@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v5 count];
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Found events(%lu) for dateInterval:%@", buf, 0x16u);
  }

  uint64_t v15 = [WeakRetained eventCache];
  if (v5) {
    id v16 = v5;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA68];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_81;
  v19[3] = &unk_26409A670;
  v19[4] = WeakRetained;
  id v17 = *(id *)(a1 + 40);
  id v20 = v6;
  id v21 = v17;
  id v18 = v6;
  [v15 updateWithEvents:v16 completion:v19];
}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_81(id *a1)
{
  if (+[HFUtilities isInternalTest])
  {
    id v2 = [a1[4] observerDispatcher];
    id v3 = [v2 proxy];
    [v3 playbackEngine:a1[4] didUpdateEventsIncludingUpdatedIdentifiers:MEMORY[0x263EFFA68] replacedIdentifiers:MEMORY[0x263EFFA68] removedIdentifiers:MEMORY[0x263EFFA68]];

    id v4 = [a1[4] cameraProfile];
    id v5 = [v4 clipManager];
    [a1[4] setClipManager:v5];

    id v6 = (void (**)(id, void *, id))a1[6];
    id v8 = [a1[4] eventCache];
    BOOL v7 = [v8 events];
    v6[2](v6, v7, a1[5]);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_2;
    block[3] = &unk_26409A648;
    block[4] = a1[4];
    id v11 = a1[6];
    id v10 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__HFCameraPlaybackEngine__fetchCameraEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerDispatcher];
  id v3 = [v2 proxy];
  [v3 playbackEngine:*(void *)(a1 + 32) didUpdateEventsIncludingUpdatedIdentifiers:MEMORY[0x263EFFA68] replacedIdentifiers:MEMORY[0x263EFFA68] removedIdentifiers:MEMORY[0x263EFFA68]];

  id v4 = [*(id *)(a1 + 32) cameraProfile];
  id v5 = [v4 clipManager];
  [*(id *)(a1 + 32) setClipManager:v5];

  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) eventCache];
  BOOL v7 = [v8 events];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, *(void *)(a1 + 40));
}

- (void)fetchCameraClipForUUID:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Loading engine for clip UUID:%@.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(HFCameraPlaybackEngine *)self cameraProfile];
  id v10 = [v9 clipManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke;
  v13[3] = &unk_26409A710;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 fetchClipWithUUID:v11 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = HFLogForCategory(0x17uLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [WeakRetained cameraProfile];
      id v11 = [v10 clipManager];
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Clip manager:%@ failed to fetch clip %@ with error:%@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Found clip:%@", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8C0], "na_arrayWithSafeObject:", v5);
  id v14 = [WeakRetained eventCache];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_84;
  v17[3] = &unk_26409A6E8;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  id v20 = *(id *)(a1 + 40);
  id v15 = v5;
  id v18 = v15;
  id v16 = v6;
  id v19 = v16;
  [v14 updateWithEvents:v13 completion:v17];

  objc_destroyWeak(&v21);
}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_84(id *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_2;
  v2[3] = &unk_26409A6C0;
  objc_copyWeak(&v6, a1 + 7);
  id v5 = a1[6];
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v6);
}

void __64__HFCameraPlaybackEngine_fetchCameraClipForUUID_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained observerDispatcher];
  id v3 = [v2 proxy];
  [v3 playbackEngine:WeakRetained didUpdateEventsIncludingUpdatedIdentifiers:MEMORY[0x263EFFA68] replacedIdentifiers:MEMORY[0x263EFFA68] removedIdentifiers:MEMORY[0x263EFFA68]];

  id v4 = [WeakRetained cameraProfile];
  id v5 = [v4 clipManager];
  [WeakRetained setClipManager:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchCameraClipForNotificationUUID:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(HFCameraPlaybackEngine *)self cameraProfile];
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "(NC) Request clip for uuid:%@ using profile:%@.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v10 = [(HFCameraPlaybackEngine *)self cameraProfile];
  id v11 = [v10 clipManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke;
  v14[3] = &unk_26409A710;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [v11 fetchClipForSignificantEventWithUUID:v12 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = HFLogForCategory(0x17uLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [WeakRetained cameraProfile];
      id v11 = [v10 recordingEventManager];
      id v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(NC) Event manager:%@ failed to fetch clip for uuid:%@ with error:%@", buf, 0x20u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [WeakRetained cameraProfile];
    id v14 = [v13 recordingEventManager];
    id v15 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Event manager:%@ found clip:%@ for UUID:%@", buf, 0x20u);
  }
  if ([v5 isComplete])
  {
    id v9 = [WeakRetained cameraProfile];
    id v16 = [v9 recordingEventManager];
    [v16 removeObserver:WeakRetained];

LABEL_8:
  }
  id v17 = objc_msgSend(MEMORY[0x263EFF8C0], "na_arrayWithSafeObject:", v5);
  id v18 = [WeakRetained eventCache];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_86;
  v21[3] = &unk_26409A6E8;
  objc_copyWeak(&v25, (id *)(a1 + 48));
  id v24 = *(id *)(a1 + 40);
  id v19 = v5;
  id v22 = v19;
  id v20 = v6;
  id v23 = v20;
  [v18 updateWithEvents:v17 completion:v21];

  objc_destroyWeak(&v25);
}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_86(id *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_2;
  v2[3] = &unk_26409A6C0;
  objc_copyWeak(&v6, a1 + 7);
  id v5 = a1[6];
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v6);
}

void __76__HFCameraPlaybackEngine_fetchCameraClipForNotificationUUID_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained observerDispatcher];
  id v3 = [v2 proxy];
  [v3 playbackEngine:WeakRetained didUpdateEventsIncludingUpdatedIdentifiers:MEMORY[0x263EFFA68] replacedIdentifiers:MEMORY[0x263EFFA68] removedIdentifiers:MEMORY[0x263EFFA68]];

  id v4 = [WeakRetained cameraProfile];
  id v5 = [v4 clipManager];
  [WeakRetained setClipManager:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setClipManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipManager);
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)&self->_clipManager);
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning from clip manager:%@ to clip manager:%@.", (uint8_t *)&v12, 0x16u);
    }
    objc_storeWeak((id *)&self->_clipManager, v4);
    [(HFCameraPlaybackEngine *)self _setupClipPlayerWithClipManager:v4];
    id v9 = [(HFCameraPlaybackEngine *)self observerDispatcher];
    id v10 = [v9 proxy];
    id v11 = [(HFCameraPlaybackEngine *)self player];
    [v10 playbackEngine:self didUpdateClipPlayer:v11];
  }
}

- (void)updateConfiguration:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"HFCameraPlaybackEngine.m", 418, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  [v5 assertConfigurationIsValid];
  if (+[HFUtilities isInternalTest])
  {
    char v6 = [(HFCameraPlaybackEngine *)self workQueue];

    if (!v6)
    {
      id v17 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[HFCameraPlaybackEngine updateConfiguration:]";
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%s workQueue is nil! Skipping update", buf, 0xCu);
      }
      goto LABEL_25;
    }
  }
  id v7 = [(HFCameraPlaybackEngine *)self cameraProfile];

  if (v7)
  {
    id v8 = [(HFCameraPlaybackEngine *)self cameraProfile];
    id v9 = [v8 recordingEventManager];
    [v9 removeObserver:self];

    id v10 = [(HFCameraPlaybackEngine *)self batchedRecordingEventsTimer];

    if (v10)
    {
      id v11 = [(HFCameraPlaybackEngine *)self batchedRecordingEventsTimer];
      dispatch_source_cancel(v11);
    }
    [(HFCameraPlaybackEngine *)self setShouldBatchRecordingEvents:0];
    if (+[HFUtilities isInternalTest])
    {
      int v12 = [MEMORY[0x263EFFA08] set];
      [(HFCameraPlaybackEngine *)self setBatchedRecordingEvents:v12];
    }
    else
    {
      id v13 = [(HFCameraPlaybackEngine *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke;
      block[3] = &unk_26408DDE0;
      block[4] = self;
      dispatch_async(v13, block);
    }
  }
  __int16 v14 = [v5 home];
  [(HFCameraPlaybackEngine *)self setHome:v14];

  id v15 = [v5 cameraProfile];
  [(HFCameraPlaybackEngine *)self setCameraProfile:v15];

  if (!+[HFUtilities isInternalTest])
  {
LABEL_17:
    id v20 = [v5 notificationClipUUID];
    [(HFCameraPlaybackEngine *)self setNotificationCenterClipUUID:v20];

    if (!+[HFUtilities isPressDemoModeEnabled])
    {
      id v21 = [(HFCameraPlaybackEngine *)self overrideLiveStreamController];
      id v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v24 = [HFCameraLiveStreamController alloc];
        id v25 = [(HFCameraPlaybackEngine *)self home];
        __int16 v26 = [(HFCameraPlaybackEngine *)self cameraProfile];
        id v23 = [(HFCameraLiveStreamController *)v24 initWithHome:v25 cameraProfile:v26];
      }
      [(HFCameraPlaybackEngine *)self _setupLiveStreamController:v23];
    }
    id v27 = [HFCameraVideoDownloader alloc];
    __int16 v28 = [v5 cameraProfile];
    id v17 = [(HFCameraVideoDownloader *)v27 initWithCameraProfile:v28];

    id v29 = +[HFCameraTimelapseVideoProvider sharedProvider];
    [v29 setTimelapseVideoDownloader:v17];

    __int16 v30 = [v5 cameraProfile];
    id v31 = +[HFCameraImageManager sharedManager];
    [v31 setCameraProfile:v30];

    uint64_t v32 = objc_alloc_init(HFCameraPlaybackEngineEventCache);
    [(HFCameraPlaybackEngine *)self setEventCache:v32];

    uint64_t v33 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Batch recording events begin", buf, 2u);
    }

    [(HFCameraPlaybackEngine *)self setShouldBatchRecordingEvents:1];
    uint64_t v34 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_source_t v35 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v34);
    [(HFCameraPlaybackEngine *)self setBatchedRecordingEventsTimer:v35];

    v36 = [(HFCameraPlaybackEngine *)self batchedRecordingEventsTimer];
    dispatch_source_set_timer(v36, 0, 0x3B9ACA00uLL, 0);

    objc_initWeak((id *)buf, self);
    long long v37 = [(HFCameraPlaybackEngine *)self batchedRecordingEventsTimer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_101;
    handler[3] = &unk_26408E550;
    objc_copyWeak(&v53, (id *)buf);
    dispatch_source_set_event_handler(v37, handler);

    long long v38 = [(HFCameraPlaybackEngine *)self batchedRecordingEventsTimer];
    dispatch_resume(v38);

    long long v39 = [(HFCameraPlaybackEngine *)self cameraProfile];
    long long v40 = [v39 recordingEventManager];
    long long v41 = [(HFCameraPlaybackEngine *)self workQueue];
    [v40 addObserver:self queue:v41];

    long long v42 = [(HFCameraPlaybackEngine *)self cameraProfile];
    long long v43 = [v42 recordingEventManager];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_103;
    v50[3] = &unk_26408D940;
    objc_copyWeak(&v51, (id *)buf);
    [v43 performCloudPullWithCompletion:v50];

    long long v44 = [v5 clipScrubber];
    clipScrubber = self->_clipScrubber;
    self->_clipScrubber = v44;

    v46 = [v5 playbackPosition];
    uint64_t v47 = +[HFCameraPlaybackPosition livePosition];
    self->_engineMode = [v46 isEqual:v47] ^ 1;

    v48 = [v5 playbackPosition];
    [(HFCameraPlaybackEngine *)self _updateStateForRequestedPlaybackPosition:v48 notifyObservers:0];

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v16 = [(HFCameraPlaybackEngine *)self home];
  if (v16)
  {

    goto LABEL_17;
  }
  id v18 = [(HFCameraPlaybackEngine *)self cameraProfile];
  BOOL v19 = v18 == 0;

  if (!v19) {
    goto LABEL_17;
  }
LABEL_26:
}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA08] set];
  [*(id *)(a1 + 32) setBatchedRecordingEvents:v2];
}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_101(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSNumber;
    id v4 = [WeakRetained batchedRecordingEvents];
    id v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 1024;
    int v17 = [WeakRetained shouldBatchRecordingEvents];
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Batch recording event throttling timer invoked; batched events: %@; batch in progress: %{BOOL}d",
      (uint8_t *)&v14,
      0x12u);
  }
  char v6 = [WeakRetained batchedRecordingEvents];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [WeakRetained cameraProfile];
    id v9 = [v8 recordingEventManager];
    id v10 = [WeakRetained batchedRecordingEvents];
    [WeakRetained _recordingEventManager:v9 didUpdateRecordingEvents:v10];

    id v11 = [MEMORY[0x263EFFA08] set];
    [WeakRetained setBatchedRecordingEvents:v11];
LABEL_5:

    goto LABEL_11;
  }
  if (([WeakRetained shouldBatchRecordingEvents] & 1) == 0)
  {
    int v12 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Batch recording event throttling timer invalidated", (uint8_t *)&v14, 2u);
    }

    id v13 = [WeakRetained batchedRecordingEventsTimer];

    if (v13)
    {
      id v11 = [WeakRetained batchedRecordingEventsTimer];
      dispatch_source_cancel(v11);
      goto LABEL_5;
    }
  }
LABEL_11:
}

void __46__HFCameraPlaybackEngine_updateConfiguration___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldBatchRecordingEvents:0];

  id v5 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Batch recording events end, error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (AVPlayer)player
{
  id v2 = [(HFCameraPlaybackEngine *)self clipPlayer];
  id v3 = [v2 player];

  return (AVPlayer *)v3;
}

- (HFCameraPlaybackPosition)playbackPosition
{
  unint64_t v4 = [(HFCameraPlaybackEngine *)self playbackContentType];
  if (v4 == 1)
  {
    int v6 = [(HFCameraPlaybackEngine *)self clipPlayer];
    id v7 = [v6 currentPosition];
    uint64_t v8 = [v7 date];

    if (!v8 || [(HFCameraPlaybackEngine *)self isScrubbing])
    {
      uint64_t v9 = [(HFCameraPlaybackEngine *)self lastRequestedClipPlaybackDate];

      uint64_t v8 = (void *)v9;
    }
    id v5 = +[HFCameraPlaybackPosition clipPositionWithDate:v8];
  }
  else if (v4)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCameraPlaybackEngine playbackContentType](self, "playbackContentType"));
    [v10 handleFailureInMethod:a2, self, @"HFCameraPlaybackEngine.m", 541, @"Unknown playback content type %@", v11 object file lineNumber description];

    id v5 = 0;
  }
  else
  {
    id v5 = +[HFCameraPlaybackPosition livePosition];
  }
  return (HFCameraPlaybackPosition *)v5;
}

- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4
{
  if (a4) {
    +[HFCameraPlaybackPosition clipPositionWithDate:inClip:](HFCameraPlaybackPosition, "clipPositionWithDate:inClip:", a3);
  }
  else {
  id v5 = +[HFCameraPlaybackPosition clipPositionWithDate:a3];
  }
  [(HFCameraPlaybackEngine *)self setPlaybackPosition:v5];
}

- (void)startPlaybackAtDate:(id)a3 withClip:(id)a4
{
  self->_wantsToPlay = 1;
  if (a4)
  {
    -[HFCameraPlaybackEngine updatePlaybackPositionToDate:usingClip:](self, "updatePlaybackPositionToDate:usingClip:", a3);
  }
  else
  {
    id v5 = +[HFCameraPlaybackPosition livePosition];
    [(HFCameraPlaybackEngine *)self setPlaybackPosition:v5];
  }
}

- (void)setPlaybackPosition:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Setting playback position: %@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    int v6 = [(HFCameraPlaybackEngine *)self playbackPosition];
    if ([v6 isEqual:v4])
    {
      id v7 = +[HFCameraPlaybackPosition livePosition];
      int v8 = [v4 isEqual:v7];

      if (!v8) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v10 = +[HFCameraPlaybackPosition livePosition];
    int v11 = [v4 isEqual:v10];

    if (v11)
    {
      int v12 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
      }

      self->_playbackContentType = 1;
      self->_wantsToPlay = 1;
    }
    [(HFCameraPlaybackEngine *)self _updateStateForRequestedPlaybackPosition:v4 notifyObservers:1];
  }
  else
  {
    uint64_t v9 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Ignore missing playbackPosition update.", (uint8_t *)&v13, 2u);
    }
  }
LABEL_16:
}

- (void)play
{
}

- (void)pause
{
}

- (void)addObserver:(id)a3 withOptions:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HFCameraPlaybackEngine.m", 600, @"Invalid parameter not satisfying: %@", @"options != nil" object file lineNumber description];
  }
  int v8 = objc_alloc_init(HFCameraPlaybackEngineObservationState);
  [(HFCameraPlaybackEngineObservationState *)v8 setOptions:v7];
  uint64_t v9 = [(HFCameraPlaybackEngine *)self observerStates];
  [v9 setObject:v8 forKey:v12];

  id v10 = [(HFCameraPlaybackEngine *)self observerDispatcher];
  [v10 addObserver:v12];

  [(HFCameraPlaybackEngine *)self _setupTimeObservationForObserver:v12];
}

- (void)removeObserver:(id)a3
{
  id v10 = a3;
  id v4 = [(HFCameraPlaybackEngine *)self observerStates];
  id v5 = [v4 objectForKey:v10];
  int v6 = [v5 timeObservationToken];

  if (v6)
  {
    id v7 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v7 removeTimeObserver:v6];
  }
  int v8 = [(HFCameraPlaybackEngine *)self observerStates];
  [v8 removeObjectForKey:v10];

  uint64_t v9 = [(HFCameraPlaybackEngine *)self observerDispatcher];
  [v9 removeObserver:v10];
}

- (NSArray)observers
{
  id v2 = [(HFCameraPlaybackEngine *)self observerDispatcher];
  id v3 = [v2 observers];

  return (NSArray *)v3;
}

- (void)modifyPlaybackFromSender:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HFCameraPlaybackEngine *)self observerDispatcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HFCameraPlaybackEngine_modifyPlaybackFromSender_usingBlock___block_invoke;
  v10[3] = &unk_26409A738;
  id v11 = v6;
  id v9 = v6;
  [v8 dispatchMessageExcludingSender:v7 usingBlock:v10];
}

uint64_t __62__HFCameraPlaybackEngine_modifyPlaybackFromSender_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HMCameraClip)currentClip
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(HFCameraPlaybackEngine *)self playbackPosition];
  if ([v3 contentType])
  {
    id v4 = [v3 clipPlaybackDate];
    id v5 = [(HFCameraPlaybackEngine *)self eventCache];
    id v6 = [v5 events];
    id v7 = +[HFCameraPlaybackEngine findClipPositionForDate:v4 inEvents:v6 options:1];

    if (v7)
    {
      int v8 = [v7 clip];
    }
    else
    {
      id v9 = [(HFCameraPlaybackEngine *)self notificationCenterClipUUID];

      if (v9)
      {
        id v10 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v19 = [(HFCameraPlaybackEngine *)self eventCache];
          id v20 = [v19 clips];
          id v21 = [v20 firstObject];
          int v23 = 138412290;
          id v24 = v21;
          _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "(NC) Returning the first event:%@", (uint8_t *)&v23, 0xCu);
        }
        id v11 = [(HFCameraPlaybackEngine *)self eventCache];
        id v12 = [v11 clips];
        int v8 = [v12 firstObject];
      }
      else
      {
        int v13 = [(HFCameraPlaybackEngine *)self eventCache];
        id v14 = [v13 clips];
        uint64_t v15 = [v14 lastObject];

        __int16 v16 = objc_msgSend(v15, "hf_endDate");
        int v17 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v3 clipPlaybackDate];
          int v23 = 138412802;
          id v24 = v22;
          __int16 v25 = 2112;
          __int16 v26 = v16;
          __int16 v27 = 2112;
          __int16 v28 = v15;
          _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "Clip playback date (%@) is >= the last clip's playback date (%@) using clip:%@", (uint8_t *)&v23, 0x20u);
        }
        int v8 = 0;
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return (HMCameraClip *)v8;
}

- (void)beginScrubbing
{
  [(HFCameraPlaybackEngine *)self setScrubbingInProgressCount:[(HFCameraPlaybackEngine *)self scrubbingInProgressCount] + 1];
  [(HFCameraPlaybackEngine *)self setScrubbing:1];
}

- (void)endScrubbing
{
  if ([(HFCameraPlaybackEngine *)self scrubbingInProgressCount])
  {
    [(HFCameraPlaybackEngine *)self setScrubbingInProgressCount:[(HFCameraPlaybackEngine *)self scrubbingInProgressCount] - 1];
    if (![(HFCameraPlaybackEngine *)self scrubbingInProgressCount])
    {
      [(HFCameraPlaybackEngine *)self setScrubbing:0];
    }
  }
  else
  {
    id v3 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Attempting to end scrubbing when scrubbing is not in progress!", v4, 2u);
    }
  }
}

- (void)setStreamAudioVolume:(float)a3
{
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
}

- (void)setStreamAudioEnabled:(BOOL)a3
{
}

- (void)setPrefersAudioEnabled:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_prefersAudioEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [NSNumber numberWithBool:v3];
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ preferred audio state changed: %@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 setBool:v3 forKey:@"HFCameraPlaybackPrefersAudioEnabled"];
    self->_prefersAudioEnabled = v3;
    [(HFCameraPlaybackEngine *)self setStreamAudioEnabled:v3];
  }
}

- (BOOL)shouldDisplayVolumeControls
{
  if ([(HFCameraPlaybackEngine *)self isUserScrubbing]) {
    return 0;
  }
  if (![(HFCameraPlaybackEngine *)self engineMode])
  {
    id v4 = [(HFCameraPlaybackEngine *)self cameraProfile];
    id v5 = [v4 userSettings];
    uint64_t v6 = [v5 currentAccessMode];

    id v7 = [(HFCameraPlaybackEngine *)self cameraProfile];
    int v8 = [v7 userSettings];
    if (([v8 isCameraManuallyDisabled] & 1) != 0 || !v6)
    {
    }
    else
    {

      if (v6 != 3) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

- (unint64_t)timelineState
{
  return self->_timelineState;
}

- (void)setTimelineState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_timelineState != a3)
  {
    self->_timelineState = a3;
    id v5 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(HFCameraPlaybackEngine *)self timelineStateDescription];
      BOOL scrubbing = self->_scrubbing;
      BOOL userScrubbing = self->_userScrubbing;
      *(_DWORD *)buf = 138413058;
      id v11 = self;
      __int16 v12 = 2112;
      int v13 = v6;
      __int16 v14 = 1024;
      BOOL v15 = scrubbing;
      __int16 v16 = 1024;
      BOOL v17 = userScrubbing;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Engine:%@ updated timelineState:%@ Scrubbing:%{BOOL}d UserScrubbing:%{BOOL}d", buf, 0x22u);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__HFCameraPlaybackEngine_setTimelineState___block_invoke;
    v9[3] = &unk_26408FE38;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __43__HFCameraPlaybackEngine_setTimelineState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateTimelineState:*(void *)(a1 + 40)];
}

- (void)setShouldBypassVideoFetchRequest:(BOOL)a3
{
  if (self->_shouldBypassVideoFetchRequest != a3) {
    self->_shouldBypassVideoFetchRequest = a3;
  }
}

- (void)setShouldBypassHighQualityScrubbing:(BOOL)a3
{
  if (self->_shouldBypassHighQualityScrubbing != a3)
  {
    BOOL v3 = a3;
    self->_shouldBypassHighQualityScrubbing = a3;
    id v4 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v4 setShouldBypassScrubbing:v3];
  }
}

- (BOOL)hasRecordingEvents
{
  id v2 = [(HFCameraPlaybackEngine *)self eventCache];
  BOOL v3 = [v2 clips];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSArray)cameraEvents
{
  id v2 = [(HFCameraPlaybackEngine *)self eventCache];
  BOOL v3 = [v2 events];

  return (NSArray *)v3;
}

- (NSArray)cameraClips
{
  id v2 = [(HFCameraPlaybackEngine *)self eventCache];
  BOOL v3 = [v2 clips];

  return (NSArray *)v3;
}

- (HMCameraClip)clipWithLongestDuration
{
  id v2 = [(HFCameraPlaybackEngine *)self eventCache];
  BOOL v3 = [v2 clipWithLongestDuration];

  return (HMCameraClip *)v3;
}

- (id)daysWithClips
{
  id v2 = [(HFCameraPlaybackEngine *)self eventCache];
  BOOL v3 = [v2 daysWithClips];

  return v3;
}

- (BOOL)isCameraPortraitMode
{
  id v2 = [(HFCameraPlaybackEngine *)self liveCameraSource];
  [v2 aspectRatio];
  double v4 = v3;

  return v4 > 0.0 && v4 < 1.0;
}

- (void)startPlaybackForCurrentClip
{
  double v3 = [(HFCameraPlaybackEngine *)self playbackSessionEvent];

  if (v3)
  {
    double v4 = [(HFCameraPlaybackEngine *)self playbackSessionEvent];
    id v5 = (id)[v4 sendEventForState:2];
  }
  uint64_t v6 = [HFCameraAnalyticsCameraClipPlaybackSessionEvent alloc];
  id v7 = [(HFCameraPlaybackEngine *)self currentClip];
  int v8 = [(HFCameraAnalyticsEvent *)v6 initWithCameraClip:v7];
  [(HFCameraPlaybackEngine *)self setPlaybackSessionEvent:v8];

  id v9 = [(HFCameraPlaybackEngine *)self clipPlayer];
  [v9 play];
}

- (void)setScrubbing:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_scrubbing != a3)
  {
    BOOL v3 = a3;
    id v5 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = self;
      __int16 v19 = 1024;
      BOOL v20 = v3;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ Scrubbing state changed. UserScrubbing:%{BOOL}d", buf, 0x12u);
    }

    uint64_t v6 = [(HFCameraPlaybackEngine *)self playbackPosition];
    id v7 = v6;
    if (v3)
    {
      int v8 = [v6 clipPlaybackDate];
      [(HFCameraPlaybackEngine *)self setLastRequestedClipPlaybackDate:v8];

      self->_BOOL scrubbing = v3;
    }
    else
    {
      self->_BOOL scrubbing = 0;
      id v9 = [(HFCameraPlaybackEngine *)self lastRequestedClipPlaybackDate];
      __int16 v10 = [(HFCameraPlaybackEngine *)self currentClip];
      id v11 = [v10 dateOfOccurrence];
      [v9 timeIntervalSinceDate:v11];
      double v13 = v12;

      __int16 v14 = [(HFCameraPlaybackEngine *)self clipPlayer];
      [v14 endScrubbingWithOffset:v13];

      [(HFCameraPlaybackEngine *)self _updateStateForRequestedPlaybackPosition:v7 notifyObservers:1];
    }
    [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__HFCameraPlaybackEngine_setScrubbing___block_invoke;
    v15[3] = &unk_26409A760;
    void v15[4] = self;
    BOOL v16 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }
}

void __39__HFCameraPlaybackEngine_setScrubbing___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateScrubbingStatus:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setWantsToPlay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_wantsToPlay != a3
    || ([(HFCameraPlaybackEngine *)self playbackError],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    self->_wantsToPlay = v3;
    uint64_t v6 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@ toggled wantsToPlay:%{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    if (self->_wantsToPlay) {
      [(HFCameraPlaybackEngine *)self setPlaybackRetryAttempts:0];
    }
    [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1];
  }
}

- (unint64_t)_derivedTimeControlStatus
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke;
  v7[3] = &unk_26409A788;
  v7[4] = self;
  unint64_t v3 = __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke((uint64_t)v7);
  if (!v3)
  {
    if ([(HFCameraPlaybackEngine *)self wantsToPlay])
    {
      double v4 = [(HFCameraPlaybackEngine *)self _derivedPlaybackError];
      unint64_t v3 = v4 == 0;
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  id v5 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = v3;
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "Playback engine current timeControlStatus:%lu", buf, 0xCu);
  }

  return v3;
}

uint64_t __51__HFCameraPlaybackEngine__derivedTimeControlStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) playbackContentType];
  if (result == 1) {
    goto LABEL_5;
  }
  if (result) {
    return result;
  }
  unint64_t v3 = [*(id *)(a1 + 32) liveStreamController];
  uint64_t v4 = [v3 streamState];

  if ((unint64_t)(v4 - 1) < 4) {
    return qword_20BD13AF0[v4 - 1];
  }
LABEL_5:
  id v5 = [*(id *)(a1 + 32) clipPlayer];
  uint64_t v6 = [v5 timeControlStatus];

  uint64_t v7 = 1;
  if (v6 != 1) {
    uint64_t v7 = 2;
  }
  if (v6) {
    return v7;
  }
  else {
    return 0;
  }
}

- (id)_derivedPlaybackError
{
  unint64_t v4 = [(HFCameraPlaybackEngine *)self playbackContentType];
  if (v4 == 1)
  {
    id v5 = [(HFCameraPlaybackEngine *)self clipPlayer];
    uint64_t v6 = [v5 error];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v5 = [(HFCameraPlaybackEngine *)self liveStreamController];
    uint64_t v6 = [v5 streamError];
  }
  id v2 = (void *)v6;

LABEL_6:
  return v2;
}

- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3
{
}

- (void)_updatePlaybackStateNotifyingObservers:(BOOL)a3 rebuildClipPlayerIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(HFCameraPlaybackEngine *)self clipPlayer];
  if (v7)
  {
    int v8 = (void *)v7;
    unint64_t v9 = [(HFCameraPlaybackEngine *)self clipPlayer];
    int v10 = [v9 hasFatalError];

    if (v10)
    {
      if (v4)
      {
        uint64_t v11 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = [(HFCameraPlaybackEngine *)self clipPlayer];
          double v13 = [v12 error];
          *(_DWORD *)buf = 138412290;
          long long v44 = v13;
          _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Rebuilding clip player after fatal error:%@", buf, 0xCu);
        }
        __int16 v14 = [(HFCameraPlaybackEngine *)self clipManager];
        [(HFCameraPlaybackEngine *)self _setupClipPlayerWithClipManager:v14];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke;
        block[3] = &unk_26408DDE0;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  if ([(HFCameraPlaybackEngine *)self wantsToPlay]
    && [(HFCameraPlaybackEngine *)self playbackContentType] == 1
    && ![(HFCameraPlaybackEngine *)self isScrubbing])
  {
    dispatch_source_t v35 = [(HFCameraPlaybackEngine *)self clipPlayer];
    uint64_t v36 = [v35 timeControlStatus];

    if (!v36)
    {
      if ([(HFCameraPlaybackEngine *)self isPictureInPictureModeActive])
      {
        long long v37 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEFAULT, "PIP - manually setting wantsToPlay = NO after pause selected during PIP.", buf, 2u);
        }

        self->_wantsToPlay = 0;
      }
      else
      {
        [(HFCameraPlaybackEngine *)self startPlaybackForCurrentClip];
      }
    }
  }
  else if ([(HFCameraPlaybackEngine *)self isPictureInPictureModeActive])
  {
    BOOL v15 = +[HFUtilities isDeviceUnlocked];
    BOOL v16 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v15;
      _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Checking for locked screen; isDeviceUnlocked: %{BOOL}d",
        buf,
        8u);
    }

    if (v15)
    {
      self->_wantsToPlay = 1;
      goto LABEL_18;
    }
    if (self->_wantsToPlay)
    {
LABEL_18:
      __int16 v19 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "manually setting wantsToPlay = YES after play selected during PIP.", buf, 2u);
      }
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v17 = [(HFCameraPlaybackEngine *)self clipPlayer];
    uint64_t v18 = [v17 timeControlStatus];

    if (v18)
    {
      __int16 v19 = [(HFCameraPlaybackEngine *)self clipPlayer];
      [v19 pause];
LABEL_20:
    }
  }
  if ([(HFCameraPlaybackEngine *)self isScrubbing]
    && [(HFCameraPlaybackEngine *)self playbackContentType] == 1)
  {
    BOOL v20 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v20 setScrubbing:1];
  }
  if ([(HFCameraPlaybackEngine *)self wantsToPlay]
    && ![(HFCameraPlaybackEngine *)self playbackContentType])
  {
    uint64_t v33 = [(HFCameraPlaybackEngine *)self liveStreamController];
    char v34 = [v33 isStreamingEnabled];

    if (v34) {
      goto LABEL_29;
    }
    int v23 = [(HFCameraPlaybackEngine *)self liveStreamController];
    [v23 startStreaming];
    goto LABEL_28;
  }
  uint64_t v21 = [(HFCameraPlaybackEngine *)self liveStreamController];
  int v22 = [v21 isStreamingEnabled];

  if (v22)
  {
    int v23 = [(HFCameraPlaybackEngine *)self liveStreamController];
    [v23 stopStreaming];
LABEL_28:
  }
LABEL_29:
  unint64_t v24 = [(HFCameraPlaybackEngine *)self timeControlStatus];
  [(HFCameraPlaybackEngine *)self setTimeControlStatus:[(HFCameraPlaybackEngine *)self _derivedTimeControlStatus]];
  __int16 v25 = [(HFCameraPlaybackEngine *)self playbackError];
  __int16 v26 = [(HFCameraPlaybackEngine *)self _derivedPlaybackError];
  [(HFCameraPlaybackEngine *)self setPlaybackError:v26];

  BOOL v27 = [(HFCameraPlaybackEngine *)self isStreamAudioEnabled]
     && [(HFCameraPlaybackEngine *)self wantsToPlay]
     && [(HFCameraPlaybackEngine *)self playbackContentType] == 0;
  __int16 v28 = [(HFCameraPlaybackEngine *)self liveStreamController];
  [v28 setStreamAudioEnabled:v27];

  if (![(HFCameraPlaybackEngine *)self wantsToPlay]
    || [(HFCameraPlaybackEngine *)self playbackContentType])
  {
    [(HFCameraPlaybackEngine *)self _setMicrophoneEnabled:0 notifyObservers:v5];
  }
  if (v5)
  {
    if ([(HFCameraPlaybackEngine *)self timeControlStatus] != v24)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_117;
      v41[3] = &unk_26408DDE0;
      v41[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v41);
    }
    id v29 = [(HFCameraPlaybackEngine *)self playbackError];
    id v30 = v25;
    id v31 = v30;
    if (v29 == v30)
    {
    }
    else
    {
      if (v29)
      {
        char v32 = [v29 isEqual:v30];

        if (v32) {
          goto LABEL_55;
        }
      }
      else
      {
      }
      long long v38 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        long long v39 = [(HFCameraPlaybackEngine *)self playbackError];
        *(_DWORD *)buf = 138412290;
        long long v44 = v39;
        _os_log_error_impl(&dword_20B986000, v38, OS_LOG_TYPE_ERROR, "Notifying clients of playback error:%@.", buf, 0xCu);
      }
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_118;
      v40[3] = &unk_26408DDE0;
      v40[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v40);
    }
  }
LABEL_55:
}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v5 proxy];
  unint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 player];
  [v2 playbackEngine:v3 didUpdateClipPlayer:v4];
}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_117(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  objc_msgSend(v2, "playbackEngine:didUpdateTimeControlStatus:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "timeControlStatus"));
}

void __91__HFCameraPlaybackEngine__updatePlaybackStateNotifyingObservers_rebuildClipPlayerIfNeeded___block_invoke_118(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v5 proxy];
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 playbackError];
  [v2 playbackEngine:v3 didUpdatePlaybackError:v4];
}

- (void)_updateStateForRequestedPlaybackPosition:(id)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = v7;
  if (!v7)
  {
    int v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = v10;
    double v12 = @"No playback position provided!";
    SEL v13 = a2;
    __int16 v14 = self;
    uint64_t v15 = 1039;
LABEL_33:
    [v10 handleFailureInMethod:v13 object:v14 file:@"HFCameraPlaybackEngine.m" lineNumber:v15 description:v12];

    goto LABEL_51;
  }
  if ([v7 contentType] != 1) {
    goto LABEL_8;
  }
  unint64_t v9 = [(HFCameraPlaybackEngine *)self clipManager];
  if (v9)
  {
  }
  else
  {
    BOOL v16 = [(HFCameraPlaybackEngine *)self eventCache];
    BOOL v17 = [v16 events];

    if (!v17)
    {
      int v10 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v11 = v10;
      double v12 = @"Attempting to use a clip playback position when there is no clip collection!";
      SEL v13 = a2;
      __int16 v14 = self;
      uint64_t v15 = 1043;
      goto LABEL_33;
    }
  }
  uint64_t v18 = [v8 clipPlaybackDate];

  if (!v18)
  {
    int v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = v10;
    double v12 = @"Attempting to set a nil playback date for clip playback!";
    SEL v13 = a2;
    __int16 v14 = self;
    uint64_t v15 = 1046;
    goto LABEL_33;
  }
LABEL_8:
  unint64_t v19 = [(HFCameraPlaybackEngine *)self playbackContentType];
  uint64_t v20 = [v8 contentType];
  -[HFCameraPlaybackEngine setPlaybackContentType:](self, "setPlaybackContentType:", [v8 contentType]);
  if ([v8 contentType] != 1)
  {
LABEL_46:
    if (+[HFUtilities isInternalTest])
    {
      v66 = [(HFCameraPlaybackEngine *)self observerDispatcher];
      v67 = [v66 proxy];
      [v67 playbackEngine:self didUpdatePlaybackPosition:v8];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__HFCameraPlaybackEngine__updateStateForRequestedPlaybackPosition_notifyObservers___block_invoke;
      block[3] = &unk_26408D450;
      block[4] = self;
      id v70 = v8;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    if (v19 != v20) {
      [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:v4];
    }
    goto LABEL_51;
  }
  uint64_t v21 = [v8 clipPlaybackDate];
  [(HFCameraPlaybackEngine *)self setLastRequestedClipPlaybackDate:v21];

  int v22 = [(HFCameraPlaybackEngine *)self clipPlayer];
  int v23 = [v22 hasFatalError];

  if (v23)
  {
    unint64_t v24 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "Clip player had fatal error. Updating and notifying observers.", buf, 2u);
    }

    [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:v4];
  }
  if ([v8 clipIncludesPlaybackDate])
  {
    __int16 v25 = [v8 clip];
    __int16 v26 = [v8 clipPlaybackDate];
    BOOL v27 = [v8 clip];
    __int16 v28 = [v27 dateOfOccurrence];
    [v26 timeIntervalSinceDate:v28];
    id v29 = +[HFCameraClipPosition positionWithClip:offset:](HFCameraClipPosition, "positionWithClip:offset:", v25);

    id v30 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "PlaybackPosition included clip. Updating to clipPosition:%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v31 = [(HFCameraPlaybackEngine *)self isScrubbing] ^ 1;
    char v32 = objc_opt_class();
    uint64_t v33 = [v8 clipPlaybackDate];
    char v34 = [(HFCameraPlaybackEngine *)self eventCache];
    dispatch_source_t v35 = [v34 events];
    id v29 = [v32 findClipPositionForDate:v33 inEvents:v35 options:v31];

    id v30 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(HFCameraPlaybackEngine *)self eventCache];
      long long v37 = [v36 events];
      uint64_t v38 = [v37 count];
      *(_DWORD *)buf = 138412546;
      v72 = v29;
      __int16 v73 = 2048;
      uint64_t v74 = v38;
      _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "PlaybackPosition did not include clip. Updating to clipPosition:%@ in events:%lu", buf, 0x16u);
    }
  }

  if (v29)
  {
    if ([(HFCameraPlaybackEngine *)self shouldBypassVideoFetchRequest]) {
      goto LABEL_45;
    }
    long long v39 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEFAULT, "Updating clip player to clipPosition:%@", buf, 0xCu);
    }

    long long v40 = [(HFCameraPlaybackEngine *)self eventCache];
    long long v41 = [v40 clips];
    long long v42 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v42 setClips:v41];

    long long v43 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v43 setCurrentPosition:v29];

    long long v44 = [v8 clip];

    if (v44) {
      goto LABEL_45;
    }
    uint64_t v45 = [v29 clip];
    [v8 setClip:v45];

    v46 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v29;
      _os_log_impl(&dword_20B986000, v46, OS_LOG_TYPE_DEFAULT, "Added missing clip to playbackPosition:%@", buf, 0xCu);
    }
    goto LABEL_44;
  }
  if ([(HFCameraPlaybackEngine *)self isScrubbing])
  {
    id v29 = 0;
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v47 = [(HFCameraPlaybackEngine *)self notificationCenterClipUUID];

  if (!v47)
  {
    v56 = HFLogForCategory(0x17uLL);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    uint64_t v57 = [v8 clipPlaybackDate];
    *(_DWORD *)buf = 138412290;
    v72 = v57;
    v58 = "Could not find a match for selected playback date %@!";
LABEL_53:
    _os_log_error_impl(&dword_20B986000, v56, OS_LOG_TYPE_ERROR, v58, buf, 0xCu);

    goto LABEL_37;
  }
  v48 = [(HFCameraPlaybackEngine *)self eventCache];
  v49 = [v48 clips];
  v46 = [v49 firstObject];

  if (v46)
  {
    v50 = [v46 significantEvents];
    if ([v50 count])
    {
      v68 = [v46 hf_sortedSignificantEvents];
      id v51 = [v68 firstObject];
      v52 = [v51 dateOfOccurrence];
      id v53 = [v46 dateOfOccurrence];
      [v52 timeIntervalSinceDate:v53];
      double v55 = v54;
    }
    else
    {
      double v55 = 0.0;
    }

    v60 = [(HFCameraPlaybackEngine *)self eventCache];
    v61 = [v60 clips];
    v62 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v62 setClips:v61];

    id v29 = +[HFCameraClipPosition positionWithEvent:v46 offset:v55];
    v63 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = [v8 clipPlaybackDate];
      *(_DWORD *)buf = 138412546;
      v72 = v64;
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v46;
      _os_log_impl(&dword_20B986000, v63, OS_LOG_TYPE_DEFAULT, "(NC) Starting playback at position:%@ for event:%@", buf, 0x16u);
    }
    v65 = [(HFCameraPlaybackEngine *)self clipPlayer];
    [v65 setCurrentPosition:v29];

LABEL_44:
    goto LABEL_45;
  }
  v56 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    uint64_t v57 = [v8 clipPlaybackDate];
    *(_DWORD *)buf = 138412290;
    v72 = v57;
    v58 = "(NC) Could not find a match for selected playback date %@!";
    goto LABEL_53;
  }
LABEL_37:

  v59 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B986000, v59, OS_LOG_TYPE_ERROR, "Failed to find valid clip position. Ignoring playback position update.", buf, 2u);
  }

LABEL_51:
}

void __83__HFCameraPlaybackEngine__updateStateForRequestedPlaybackPosition_notifyObservers___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdatePlaybackPosition:*(void *)(a1 + 40)];
}

- (void)setLiveCameraSource:(id)a3
{
  id v5 = (HMCameraSource *)a3;
  if (self->_liveCameraSource != v5)
  {
    objc_storeStrong((id *)&self->_liveCameraSource, a3);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__HFCameraPlaybackEngine_setLiveCameraSource___block_invoke;
    v6[3] = &unk_26408D450;
    v6[4] = self;
    id v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __46__HFCameraPlaybackEngine_setLiveCameraSource___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateLiveCameraSource:*(void *)(a1 + 40)];
}

- (void)_setMicrophoneEnabled:(BOOL)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3 && [(HFCameraPlaybackEngine *)self playbackContentType])
  {
    id v7 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Attempting to enable the microphone when live playback is not active. This doesn't make any sense and will be ignored.", buf, 2u);
    }
  }
  else if (self->_microphoneEnabled != v5)
  {
    self->_microphoneEnabled = v5;
    int v8 = [(HFCameraPlaybackEngine *)self liveStreamController];
    [v8 setMicrophoneEnabled:v5];

    if (v4)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __64__HFCameraPlaybackEngine__setMicrophoneEnabled_notifyObservers___block_invoke;
      v9[3] = &unk_26409A760;
      v9[4] = self;
      BOOL v10 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v9);
    }
  }
}

void __64__HFCameraPlaybackEngine__setMicrophoneEnabled_notifyObservers___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateMicrophoneEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setPlayerVolume:(float)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_streamAudioVolume != a3 || +[HFUtilities isAMac])
  {
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    *(float *)&double v8 = a3;
    [v7 setFloat:@"HFCameraPlaybackStreamAudioVolume" forKey:v8];

    self->_streamAudioVolume = a3;
    unint64_t v9 = [(HFCameraPlaybackEngine *)self liveStreamController];
    *(float *)&double v10 = a3;
    [v9 setStreamAudioVolume:v10];

    if (v4)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __59__HFCameraPlaybackEngine__setPlayerVolume_notifyObservers___block_invoke;
      v11[3] = &unk_26408E528;
      v11[4] = self;
      float v12 = a3;
      dispatch_async(MEMORY[0x263EF83A0], v11);
    }
  }
}

void __59__HFCameraPlaybackEngine__setPlayerVolume_notifyObservers___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateStreamAudioVolume:*(float *)(a1 + 40) != 0.0];
}

- (void)_setStreamAudioEnabled:(BOOL)a3 notifyObservers:(BOOL)a4
{
  if (self->_streamAudioEnabled != a3)
  {
    BOOL v4 = a4;
    self->_streamAudioEnabled = a3;
    [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1 rebuildClipPlayerIfNeeded:0];
    if (v4)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __65__HFCameraPlaybackEngine__setStreamAudioEnabled_notifyObservers___block_invoke;
      v7[3] = &unk_26409A760;
      v7[4] = self;
      BOOL v8 = a3;
      dispatch_async(MEMORY[0x263EF83A0], v7);
    }
  }
}

void __65__HFCameraPlaybackEngine__setStreamAudioEnabled_notifyObservers___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v3 proxy];
  [v2 playbackEngine:*(void *)(a1 + 32) didUpdateStreamAudioEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (unint64_t)engineMode
{
  id v2 = [(HFCameraPlaybackEngine *)self playbackPosition];
  id v3 = [v2 clipPlaybackDate];
  unint64_t v4 = v3 != 0;

  return v4;
}

- (BOOL)isLiveStreaming
{
  if (+[HFUtilities isPressDemoModeEnabled]
    && ![(HFCameraPlaybackEngine *)self engineMode])
  {
    return 1;
  }
  if ([(HFCameraPlaybackEngine *)self engineMode]) {
    return 0;
  }
  return [(HFCameraPlaybackEngine *)self timeControlStatus] != 0;
}

- (BOOL)isLiveStreamPlaying
{
  if (+[HFUtilities isPressDemoModeEnabled]
    && ![(HFCameraPlaybackEngine *)self engineMode])
  {
    return 1;
  }
  if ([(HFCameraPlaybackEngine *)self engineMode]) {
    return 0;
  }
  return [(HFCameraPlaybackEngine *)self timeControlStatus] == 2;
}

- (void)recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    BOOL v8 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  if ([(HFCameraPlaybackEngine *)self shouldBatchRecordingEvents])
  {
    unint64_t v9 = [MEMORY[0x263EFF9C0] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (+[HFCameraPlaybackEngineEventCache isValidEvent:](HFCameraPlaybackEngineEventCache, "isValidEvent:", v15, (void)v18))
          {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    BOOL v16 = [(HFCameraPlaybackEngine *)self batchedRecordingEvents];
    BOOL v17 = [v16 setByAddingObjectsFromSet:v9];
    [(HFCameraPlaybackEngine *)self setBatchedRecordingEvents:v17];
  }
  else
  {
    [(HFCameraPlaybackEngine *)self _recordingEventManager:v6 didUpdateRecordingEvents:v7];
  }
}

- (void)_recordingEventManager:(id)a3 didUpdateRecordingEvents:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    BOOL v8 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  unint64_t v9 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = (HFCameraPlaybackEngine *)"-[HFCameraPlaybackEngine _recordingEventManager:didUpdateRecordingEvents:]";
    __int16 v31 = 2048;
    uint64_t v32 = [v7 count];
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%s, received (%lu) events", buf, 0x16u);
  }

  id v10 = [(HFCameraPlaybackEngine *)self notificationCenterClipUUID];
  uint64_t v11 = v10;
  if (v10)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke;
    v27[3] = &unk_26409A7B0;
    uint64_t v12 = v10;
    __int16 v28 = v12;
    uint64_t v13 = objc_msgSend(v7, "na_firstObjectPassingTest:", v27);
    if (v13)
    {
      __int16 v14 = [MEMORY[0x263EFFA08] setWithObject:v13];

      objc_opt_class();
      id v15 = v13;
      if (objc_opt_isKindOfClass()) {
        BOOL v16 = v15;
      }
      else {
        BOOL v16 = 0;
      }
      id v7 = v16;

      if ([v7 isComplete])
      {
        BOOL v17 = HFLogForCategory(0x16uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "(NC) No need to listen for a completed clip. Removing observation.", buf, 2u);
        }

        long long v18 = [(HFCameraPlaybackEngine *)self cameraProfile];
        long long v19 = [v18 recordingEventManager];
        [v19 removeObserver:self];
      }
      long long v20 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v6;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        uint64_t v36 = v12;
        _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "(NC) Playback engine:%@ eventManager:%@ updatedClips:%@ for UUID:%@", buf, 0x2Au);
      }
    }
    else
    {
      int v22 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v6;
        __int16 v33 = 2112;
        id v34 = v7;
        __int16 v35 = 2112;
        uint64_t v36 = v12;
        _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "(NC) Playback engine:%@ eventManager:%@ ignoring clip updates:%@ because its showing UUID:%@", buf, 0x2Au);
      }

      __int16 v14 = [MEMORY[0x263EFFA08] set];
    }

    long long v21 = v28;
  }
  else
  {
    long long v21 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v6;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Playback engine:%@ eventManager:%@ updatedClips:%@", buf, 0x20u);
    }
    __int16 v14 = v7;
  }

  objc_initWeak((id *)buf, self);
  uint64_t v23 = [(HFCameraPlaybackEngine *)self eventCache];
  unint64_t v24 = [v14 allObjects];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_132;
  v25[3] = &unk_26409A7D8;
  objc_copyWeak(&v26, (id *)buf);
  [v23 updateWithEvents:v24 completion:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

uint64_t __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_2;
  block[3] = &unk_26408D388;
  block[4] = WeakRetained;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__HFCameraPlaybackEngine__recordingEventManager_didUpdateRecordingEvents___block_invoke_2(id *a1)
{
  id v6 = [a1[4] observerDispatcher];
  id v2 = [v6 proxy];
  id v3 = a1[4];
  uint64_t v4 = [a1[5] allObjects];
  id v5 = [a1[6] allObjects];
  [v2 playbackEngine:v3 didUpdateEventsIncludingUpdatedIdentifiers:v4 replacedIdentifiers:v5 removedIdentifiers:MEMORY[0x263EFFA68]];
}

- (void)recordingEventManager:(id)a3 didRemoveRecordingEventsWithUUIDs:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    id v8 = [(HFCameraPlaybackEngine *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  id v9 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Playback engine:%@ received eventManager:%@ updatedClips:%@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v10 = [(HFCameraPlaybackEngine *)self eventCache];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke;
  v11[3] = &unk_26409A800;
  objc_copyWeak(&v12, (id *)buf);
  [v10 removeEventUUIDs:v7 completion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke_2;
  v6[3] = &unk_26408D450;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __82__HFCameraPlaybackEngine_recordingEventManager_didRemoveRecordingEventsWithUUIDs___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observerDispatcher];
  id v2 = [v5 proxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) allObjects];
  [v2 playbackEngine:v3 didUpdateEventsIncludingUpdatedIdentifiers:MEMORY[0x263EFFA68] replacedIdentifiers:MEMORY[0x263EFFA68] removedIdentifiers:v4];
}

- (void)clipPlayer:(id)a3 didUpdateTimeControlStatus:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(HFCameraPlaybackEngine *)self playbackContentType])
  {
    int64_t v6 = [(HFCameraPlaybackEngine *)self lastPlayerTimeControlStatus];
    if (!a4 && v6 == 1 && self->_wantsToPlay)
    {
      if ([(HFCameraPlaybackEngine *)self playbackRetryAttempts] > 2)
      {
        id v16 = [(HFCameraPlaybackEngine *)self playbackSessionEvent];
        id v17 = (id)[v16 sendEventForState:1];

        [(HFCameraPlaybackEngine *)self setPlaybackSessionEvent:0];
        id v18 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [(HFCameraPlaybackEngine *)self clipPlayer];
          long long v20 = [v19 error];
          int v21 = 138412290;
          int v22 = v20;
          _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Failure occurred while waiting to play. Bailing on the playback attempt. Player error:%@", (uint8_t *)&v21, 0xCu);
        }
        [(HFCameraPlaybackEngine *)self setLastPlayerTimeControlStatus:0];
        id v11 = self;
        uint64_t v12 = 0;
      }
      else
      {
        id v7 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v8 = 3 - [(HFCameraPlaybackEngine *)self playbackRetryAttempts];
          id v9 = [(HFCameraPlaybackEngine *)self clipPlayer];
          id v10 = [v9 error];
          int v21 = 134218242;
          int v22 = (HFCameraPlaybackEngine *)v8;
          __int16 v23 = 2112;
          int64_t v24 = (int64_t)v10;
          _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Failure occurred while waiting to play. Retrying playback up to %lu more times. Player error:%@", (uint8_t *)&v21, 0x16u);
        }
        [(HFCameraPlaybackEngine *)self setPlaybackRetryAttempts:[(HFCameraPlaybackEngine *)self playbackRetryAttempts] + 1];
        id v11 = self;
        uint64_t v12 = 1;
      }
      [(HFCameraPlaybackEngine *)v11 setWantsToPlay:v12];
    }
    else
    {
      [(HFCameraPlaybackEngine *)self setLastPlayerTimeControlStatus:a4];
      if ([(HFCameraPlaybackEngine *)self lastPlayerTimeControlStatus] == 2)
      {
        uint64_t v13 = [(HFCameraPlaybackEngine *)self playbackSessionEvent];
        id v14 = (id)[v13 sendEventForState:0];

        [(HFCameraPlaybackEngine *)self setPlaybackSessionEvent:0];
        [(HFCameraPlaybackEngine *)self setPlaybackRetryAttempts:0];
      }
      __int16 v15 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        int v22 = self;
        __int16 v23 = 2048;
        int64_t v24 = a4;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer timeControlStatus update: %ld", (uint8_t *)&v21, 0x16u);
      }

      [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1 rebuildClipPlayerIfNeeded:0];
    }
  }
}

- (void)clipPlayer:(id)a3 didUpdateError:(id)a4 isFatal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  unint64_t v8 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer error update: %@ (fatal: %d)", (uint8_t *)&v9, 0x1Cu);
  }

  [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1 rebuildClipPlayerIfNeeded:0];
}

- (void)clipPlayer:(id)a3 didUpdateMuted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int64_t v6 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:v4];
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayer isMuted update: %@", (uint8_t *)&v8, 0x16u);
  }
  [(HFCameraPlaybackEngine *)self setPrefersAudioEnabled:v4 ^ 1];
}

- (void)clipPlayerDidPlayToEndTime:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v4 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = self;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received clipPlayerDidPlayToEndTime", (uint8_t *)&v16, 0xCu);
  }

  BOOL v5 = [(HFCameraPlaybackEngine *)self notificationCenterClipUUID];

  if (v5)
  {
    int64_t v6 = [(HFCameraPlaybackEngine *)self cameraClips];
    id v7 = [v6 firstObject];

    int v8 = [v7 dateOfOccurrence];
    int v9 = HFLogForCategory(0x17uLL);
    __int16 v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [v7 uniqueIdentifier];
        int v16 = 138412802;
        id v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        int v21 = v11;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(NC) Playback engine: %@ restarting clip playback at start date:%@ clipUUID:%@.", (uint8_t *)&v16, 0x20u);
      }
      uint64_t v12 = +[HFCameraPlaybackPosition clipPositionWithDate:v8 inClip:v7];
      [(HFCameraPlaybackEngine *)self setPlaybackPosition:v12];

      [(HFCameraPlaybackEngine *)self setWantsToPlay:1];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [(HFCameraPlaybackEngine *)self notificationCenterClipUUID];
        int v16 = 138412546;
        id v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v15;
        _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "(NC) Playback engine: %@ failed to find start date for notificationCenterClipUUID:%@. This should never happen.", (uint8_t *)&v16, 0x16u);
      }
      BOOL v14 = +[HFCameraPlaybackPosition livePosition];
      [(HFCameraPlaybackEngine *)self setPlaybackPosition:v14];

      [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1 rebuildClipPlayerIfNeeded:0];
    }
  }
  else
  {
    __int16 v13 = +[HFCameraPlaybackPosition livePosition];
    [(HFCameraPlaybackEngine *)self setPlaybackPosition:v13];

    [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1 rebuildClipPlayerIfNeeded:0];
  }
}

- (void)streamControllerStateDidUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = [v4 debugDescription];
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Playback engine: %@ received liveStreamController state update: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [v4 liveCameraSource];
  [(HFCameraPlaybackEngine *)self setLiveCameraSource:v7];

  [(HFCameraPlaybackEngine *)self _updatePlaybackStateNotifyingObservers:1];
}

- (id)timelineStateDescription
{
  unint64_t v2 = self->_timelineState - 1;
  if (v2 > 5) {
    return @"TimelineStateUnknown";
  }
  else {
    return off_26409A870[v2];
  }
}

- (id)timeControlStatusDescription
{
  unint64_t timeControlStatus = self->_timeControlStatus;
  uint64_t v3 = @"TimeControlStatusPaused";
  if (timeControlStatus == 1) {
    uint64_t v3 = @"TimeControlStatusWaitingToPlay";
  }
  if (timeControlStatus == 2) {
    return @"TimeControlStatusPlaying";
  }
  else {
    return v3;
  }
}

- (id)engineModeDescription
{
  if (self->_engineMode) {
    return @"EngineModeClipPlayer";
  }
  else {
    return @"EngineModeLiveStream";
  }
}

- (id)shortDebugDescription
{
  uint64_t v3 = NSString;
  id v4 = [(HFCameraPlaybackEngine *)self engineModeDescription];
  BOOL v5 = [(HFCameraPlaybackEngine *)self timeControlStatusDescription];
  int64_t v6 = [(HFCameraPlaybackEngine *)self timelineStateDescription];
  id v7 = [v3 stringWithFormat:@"%@ %@ - %@ - %@", self, v4, v5, v6];

  return v7;
}

- (BOOL)isFirstEventOfTheDay:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HFCameraPlaybackEngine *)self eventCache];
  char v6 = [v5 isFirstEventOfTheDay:v4];

  return v6;
}

- (id)firstOfTheDayClipForDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HFCameraPlaybackEngine *)self eventCache];
  char v6 = [v5 firstOfTheDayClipForDate:v4];

  return v6;
}

- (id)findClipPositionForDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  char v6 = [(HFCameraPlaybackEngine *)self eventCache];
  id v7 = [v6 clips];
  int v8 = [v5 findClipPositionForDate:v4 inEvents:v7 options:1];

  return v8;
}

- (id)findClipPositionForDate:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_class();
  int v8 = [(HFCameraPlaybackEngine *)self eventCache];
  int v9 = [v8 events];
  __int16 v10 = [v7 findClipPositionForDate:v6 inEvents:v9 options:a4];

  return v10;
}

+ (id)findClipPositionForDate:(id)a3 inEvents:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(a1, "hf_indexOfClipForDate:inEvents:enumerationOptions:searchOptions:", v8, v9, 0, a5);
  __int16 v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [v9 objectAtIndexedSubscript:v10];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke;
    __int16 v18 = &unk_26409A828;
    id v19 = v12;
    id v20 = v8;
    id v13 = v12;
    __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke((uint64_t)&v15);
    __int16 v11 = +[HFCameraClipPosition positionWithEvent:offset:](HFCameraClipPosition, "positionWithEvent:offset:", v13, v15, v16, v17, v18);
  }
  return v11;
}

void __67__HFCameraPlaybackEngine_findClipPositionForDate_inEvents_options___block_invoke(uint64_t a1)
{
  unint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hf_dateInterval");
  uint64_t v3 = objc_msgSend(v2, "hf_searchResultForDate:", *(void *)(a1 + 40));

  if (v3 == 1)
  {
    BOOL v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) dateOfOccurrence];
    [v5 timeIntervalSinceDate:v6];
  }
  else if (v3 == 2)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 duration];
  }
}

+ (unint64_t)hf_indexOfClipForDate:(id)a3 inEvents:(id)a4 enumerationOptions:(unint64_t)a5 searchOptions:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__HFCameraPlaybackEngine_hf_indexOfClipForDate_inEvents_enumerationOptions_searchOptions___block_invoke;
  v15[3] = &unk_26409A850;
  id v17 = v10;
  unint64_t v18 = a6;
  id v16 = v9;
  id v11 = v10;
  id v12 = v9;
  unint64_t v13 = [v11 indexOfObjectWithOptions:a5 passingTest:v15];

  return v13;
}

BOOL __90__HFCameraPlaybackEngine_hf_indexOfClipForDate_inEvents_enumerationOptions_searchOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = objc_msgSend(a2, "hf_dateInterval");
  uint64_t v8 = objc_msgSend(v7, "hf_searchResultForDate:", *(void *)(a1 + 32));

  if (v8 == 1) {
    return 1;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    return v8 == 0;
  }
  if ((v10 & 2) == 0) {
    return 0;
  }
  if (v8)
  {
    if ([*(id *)(a1 + 40) count] - 1 == a3) {
      return 1;
    }
    id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 + 1];
    id v12 = objc_msgSend(v11, "hf_dateInterval");
    uint64_t v13 = objc_msgSend(v12, "hf_searchResultForDate:", *(void *)(a1 + 32));

    return !v13;
  }
  BOOL result = 0;
  *a4 = 1;
  return result;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    BOOL v14 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);
  }
  if (+[HFUtilities isInternalTest])
  {
    clipPlayer = self->_clipPlayer;
    self->_clipPlayer = 0;

    id v7 = +[HFCameraTimelapseVideoProvider sharedProvider];
    [v7 waitUntilAllDownloadsAreFinished];
  }
  else
  {
    id v7 = [(HFCameraPlaybackEngine *)self cameraProfile];
    uint64_t v8 = [v7 recordingEventManager];
    [v8 removeObserver:self];
  }
  id v9 = +[HFCameraTimelapseVideoProvider sharedProvider];
  [v9 setTimelapseVideoDownloader:0];

  v10.receiver = self;
  v10.super_class = (Class)HFCameraPlaybackEngine;
  [(HFCameraPlaybackEngine *)&v10 dealloc];
}

- (BOOL)prefersAudioEnabled
{
  return self->_prefersAudioEnabled;
}

- (HFCameraLiveStreamControlling)overrideLiveStreamController
{
  return self->_overrideLiveStreamController;
}

- (void)setOverrideLiveStreamController:(id)a3
{
}

- (HMCameraSource)liveCameraSource
{
  return self->_liveCameraSource;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isStreamAudioEnabled
{
  return self->_streamAudioEnabled;
}

- (float)streamAudioVolume
{
  return self->_streamAudioVolume;
}

- (void)setEngineMode:(unint64_t)a3
{
  self->_engineMode = a3;
}

- (BOOL)isUserScrubbing
{
  return self->_userScrubbing;
}

- (void)setUserScrubbing:(BOOL)a3
{
  self->_BOOL userScrubbing = a3;
}

- (BOOL)isPictureInPictureModeActive
{
  return self->_pictureInPictureModeActive;
}

- (void)setPictureInPictureModeActive:(BOOL)a3
{
  self->_pictureInPictureModeActive = a3;
}

- (BOOL)shouldBypassVideoFetchRequest
{
  return self->_shouldBypassVideoFetchRequest;
}

- (BOOL)shouldBypassHighQualityScrubbing
{
  return self->_shouldBypassHighQualityScrubbing;
}

- (unint64_t)scrubbingSpeed
{
  return self->_scrubbingSpeed;
}

- (void)setScrubbingSpeed:(unint64_t)a3
{
  self->_scrubbingSpeed = a3;
}

- (unint64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (void)setTimeControlStatus:(unint64_t)a3
{
  self->_unint64_t timeControlStatus = a3;
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (void)setPlaybackError:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFCameraLiveStreamControlling)liveStreamController
{
  return self->_liveStreamController;
}

- (HFCameraClipScrubbing)clipScrubber
{
  return self->_clipScrubber;
}

- (NSMapTable)observerStates
{
  return self->_observerStates;
}

- (NADelegateDispatcher)observerDispatcher
{
  return self->_observerDispatcher;
}

- (unint64_t)playbackContentType
{
  return self->_playbackContentType;
}

- (void)setPlaybackContentType:(unint64_t)a3
{
  self->_playbackContentType = a3;
}

- (NSDate)lastRequestedClipPlaybackDate
{
  return self->_lastRequestedClipPlaybackDate;
}

- (void)setLastRequestedClipPlaybackDate:(id)a3
{
}

- (BOOL)wantsToPlay
{
  return self->_wantsToPlay;
}

- (unint64_t)scrubbingInProgressCount
{
  return self->_scrubbingInProgressCount;
}

- (void)setScrubbingInProgressCount:(unint64_t)a3
{
  self->_scrubbingInProgressCount = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (int64_t)lastPlayerTimeControlStatus
{
  return self->_lastPlayerTimeControlStatus;
}

- (void)setLastPlayerTimeControlStatus:(int64_t)a3
{
  self->_lastPlayerTimeControlStatus = a3;
}

- (HFCameraAnalyticsCameraClipPlaybackSessionEvent)playbackSessionEvent
{
  return self->_playbackSessionEvent;
}

- (void)setPlaybackSessionEvent:(id)a3
{
}

- (unint64_t)playbackRetryAttempts
{
  return self->_playbackRetryAttempts;
}

- (void)setPlaybackRetryAttempts:(unint64_t)a3
{
  self->_playbackRetryAttempts = a3;
}

- (HFCameraPlaybackEngineEventCache)eventCache
{
  return self->_eventCache;
}

- (void)setEventCache:(id)a3
{
}

- (HMCameraClipManager)clipManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipManager);
  return (HMCameraClipManager *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_source)batchedRecordingEventsTimer
{
  return self->_batchedRecordingEventsTimer;
}

- (void)setBatchedRecordingEventsTimer:(id)a3
{
}

- (HFCameraClipPlaying)clipPlayer
{
  return self->_clipPlayer;
}

- (HFCameraClipPlaying)overrideClipPlayer
{
  return self->_overrideClipPlayer;
}

- (void)setOverrideClipPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideClipPlayer, 0);
  objc_storeStrong((id *)&self->_clipPlayer, 0);
  objc_storeStrong((id *)&self->_batchedRecordingEventsTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_playbackSessionEvent, 0);
  objc_storeStrong((id *)&self->_lastRequestedClipPlaybackDate, 0);
  objc_storeStrong((id *)&self->_observerDispatcher, 0);
  objc_storeStrong((id *)&self->_observerStates, 0);
  objc_storeStrong((id *)&self->_clipScrubber, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_liveCameraSource, 0);
  objc_storeStrong((id *)&self->_overrideLiveStreamController, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_notificationCenterClipUUID, 0);
  objc_storeStrong((id *)&self->_batchedRecordingEvents, 0);
}

@end