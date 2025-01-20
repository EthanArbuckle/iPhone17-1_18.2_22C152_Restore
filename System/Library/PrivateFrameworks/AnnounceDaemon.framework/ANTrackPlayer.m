@interface ANTrackPlayer
- (ANAudioSessionManager)audioSessionManager;
- (ANTimer)interruptionTimer;
- (ANTimer)playerTimer;
- (ANTrackPlayer)initWithOptions:(unint64_t)a3;
- (ANTrackPlayer)initWithOptions:(unint64_t)a3 endpointUUID:(id)a4;
- (ANTrackPlayerDelegate)delegate;
- (AVAudioSession)audioSession;
- (AVQueuePlayer)queuePlayer;
- (BOOL)_add:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5;
- (BOOL)_addURL:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5;
- (BOOL)_insertAudioBetween;
- (BOOL)add:(id)a3 announcementID:(id)a4;
- (BOOL)playbackPending;
- (BOOL)readyToPlay;
- (BOOL)someOtherSidekickSessionAudioIsPlaying;
- (NSMutableArray)playerItems;
- (NSString)activelyPlayingAnnouncementID;
- (NSURL)audioFileAtStart;
- (NSURL)audioFileTransition;
- (NSUUID)endpointUUID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)mainQueue;
- (OS_os_log)log;
- (double)interruptionStart;
- (double)previousSkipGoesToPreviousTrackDelta;
- (double)silenceBetweenEachTrack;
- (double)trimStartTone;
- (double)trimTransitionTone;
- (id)_playerInfoForAVPlayerItem:(id)a3;
- (id)_stringForPlayerItemStatus:(int64_t)a3;
- (id)_stringForPlayerStatus:(int64_t)a3;
- (id)_stringForTimeControlStatus:(int64_t)a3;
- (id)handler;
- (id)prepareToPlay;
- (int)numberActiveTracks;
- (unint64_t)options;
- (unint64_t)playbackState;
- (void)_addObserverForPlayer:(id)a3;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_configureAudioSession;
- (void)_deregisterForNotificationsWithAudioSession:(id)a3;
- (void)_handleInterruptionEndedAndShouldResume:(BOOL)a3;
- (void)_handleReadyToPlayWithCompletionHandler:(id)a3;
- (void)_playWithCompletionHandler:(id)a3;
- (void)_registerForNotificationsWithAudioSession:(id)a3;
- (void)_removeItemObserverForPlayer:(id)a3;
- (void)_removeObserverForPlayer:(id)a3;
- (void)_resumePlaybackAfterInterruptionAtTimeInterval:(double)a3;
- (void)_stopAndUpdatePlaybackState:(unint64_t)a3;
- (void)_stopPlaybackAndFailWithItem:(id)a3 error:(id)a4;
- (void)audioSessionInterruptionHandler:(id)a3;
- (void)audioSessionMediaServicesLostHandler:(id)a3;
- (void)audioSessionMediaServicesResetHandler:(id)a3;
- (void)dealloc;
- (void)end;
- (void)nextInternalSync;
- (void)nextWithCompletionHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playInternalWithCompletionHandler:(id)a3;
- (void)playWithCompletionHandler:(id)a3;
- (void)playerItemPlayedToEndHandler:(id)a3;
- (void)playerRateChangedHandler:(id)a3;
- (void)previousInternalSync;
- (void)previousWithCompletionHandler:(id)a3;
- (void)setAudioFileAtStart:(id)a3;
- (void)setAudioFileTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInterruptionStart:(double)a3;
- (void)setInterruptionTimer:(id)a3;
- (void)setPlaybackPending:(BOOL)a3;
- (void)setPlaybackState:(unint64_t)a3;
- (void)setPlayerTimer:(id)a3;
- (void)setPreviousSkipGoesToPreviousTrackDelta:(double)a3;
- (void)setQueuePlayer:(id)a3;
- (void)setReadyToPlay:(BOOL)a3;
- (void)setSilenceBetweenEachTrack:(double)a3;
- (void)setSomeOtherSidekickSessionAudioIsPlaying:(BOOL)a3;
- (void)setTrimStartTone:(double)a3;
- (void)setTrimTransitionTone:(double)a3;
- (void)stopInternalSync;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation ANTrackPlayer

- (ANTrackPlayer)initWithOptions:(unint64_t)a3
{
  return [(ANTrackPlayer *)self initWithOptions:a3 endpointUUID:0];
}

- (ANTrackPlayer)initWithOptions:(unint64_t)a3 endpointUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ANTrackPlayer;
  v8 = [(ANTrackPlayer *)&v31 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mainQueue, MEMORY[0x1E4F14428]);
    uint64_t v10 = objc_opt_new();
    playerItems = v9->_playerItems;
    v9->_playerItems = (NSMutableArray *)v10;

    v9->_silenceBetweenEachTrack = 0.1;
    v9->_previousSkipGoesToPreviousTrackDelta = 3.0;
    v9->_options = a3;
    v9->_playbackState = 3;
    v9->_readyToPlay = 0;
    v12 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x1E4F16670]);
    queuePlayer = v9->_queuePlayer;
    v9->_queuePlayer = v12;

    objc_storeStrong((id *)&v9->_endpointUUID, a4);
    ANLogBuildCategoryName();
    uint64_t v14 = ANLogWithCategory();
    log = v9->_log;
    v9->_log = (OS_os_log *)v14;

    uint64_t v16 = [MEMORY[0x1E4F4A938] timerWithLabel:@"AudioInterruption" identifier:v7];
    interruptionTimer = v9->_interruptionTimer;
    v9->_interruptionTimer = (ANTimer *)v16;

    uint64_t v18 = [MEMORY[0x1E4F4A938] timerWithLabel:@"AudioPlayer" identifier:v7];
    playerTimer = v9->_playerTimer;
    v9->_playerTimer = (ANTimer *)v18;

    v9->_someOtherSidekickSessionAudioIsPlaying = 0;
    uint64_t v20 = [MEMORY[0x1E4F153E0] sharedInstance];
    audioSession = v9->_audioSession;
    v9->_audioSession = (AVAudioSession *)v20;

    v22 = [(ANTrackPlayer *)v9 log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v9->_audioSession;
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl(&dword_1DA5ED000, v22, OS_LOG_TYPE_DEFAULT, "Using Shared Audio Session for local playback: %@", buf, 0xCu);
    }

    [(ANTrackPlayer *)v9 _configureAudioSession];
    v24 = [ANAudioSessionManager alloc];
    v25 = v9->_audioSession;
    mainQueue = v9->_mainQueue;
    v27 = [(ANTrackPlayer *)v9 endpointUUID];
    uint64_t v28 = [(ANAudioSessionManager *)v24 initWithAudioSession:v25 queue:mainQueue endpointID:v27];
    audioSessionManager = v9->_audioSessionManager;
    v9->_audioSessionManager = (ANAudioSessionManager *)v28;

    [(AVQueuePlayer *)v9->_queuePlayer setAudioSession:v9->_audioSession];
    [(ANTrackPlayer *)v9 _registerForNotificationsWithAudioSession:v9->_audioSession];
    [(ANTrackPlayer *)v9 _addObserverForPlayer:v9->_queuePlayer];
  }

  return v9;
}

- (void)dealloc
{
  [(ANTrackPlayer *)self _deregisterForNotificationsWithAudioSession:self->_audioSession];
  v3 = [(ANTrackPlayer *)self queuePlayer];
  [(ANTrackPlayer *)self _removeObserverForPlayer:v3];

  v4 = [(ANTrackPlayer *)self queuePlayer];
  [(ANTrackPlayer *)self _removeItemObserverForPlayer:v4];

  v5.receiver = self;
  v5.super_class = (Class)ANTrackPlayer;
  [(ANTrackPlayer *)&v5 dealloc];
}

- (void)setPlaybackState:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Setting Playback State to %lu", buf, 0xCu);
  }

  self->_playbackState = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__ANTrackPlayer_setPlaybackState___block_invoke;
  v6[3] = &unk_1E6BCE978;
  v6[4] = self;
  v6[5] = a3;
  [(ANTrackPlayer *)self _callDelegateWithBlock:v6];
}

void __34__ANTrackPlayer_setPlaybackState___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = [v3 activelyPlayingAnnouncementID];
  [v5 trackPlayer:v3 didUpdatePlaybackState:v2 announcementID:v4];
}

- (BOOL)add:(id)a3 announcementID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[ANTrackPlayer add:announcementID:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%s: track %@", (uint8_t *)&v11, 0x16u);
  }

  if ([(ANTrackPlayer *)self _insertAudioBetween]) {
    BOOL v9 = [(ANTrackPlayer *)self _add:v6 announcementID:v7 trackType:0];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_add:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[ANTrackPlayer _add:announcementID:trackType:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%s: track %@", (uint8_t *)&v14, 0x16u);
  }

  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8];
  BOOL v12 = [(ANTrackPlayer *)self _addURL:v11 announcementID:v9 trackType:a5];

  return v12;
}

- (BOOL)_addURL:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  id v8 = (void *)MEMORY[0x1E4F16620];
  id v9 = a4;
  uint64_t v10 = [v8 playerItemWithURL:a3];
  int v11 = [(ANTrackPlayer *)self queuePlayer];
  [v11 insertItem:v10 afterItem:0];

  [v10 addObserver:self forKeyPath:@"status" options:1 context:0];
  BOOL v12 = [[ANTrackPlayerInfo alloc] initWithPlayerItem:v10 announcementID:v9 trackType:a5];

  __int16 v13 = [(ANTrackPlayer *)self playerItems];
  [v13 addObject:v12];

  return 1;
}

- (BOOL)_insertAudioBetween
{
  v3 = [(ANTrackPlayer *)self audioFileAtStart];
  v4 = [(ANTrackPlayer *)self playerItems];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    uint64_t v7 = 1;
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v8 = 1;
    goto LABEL_6;
  }
  uint64_t v6 = [(ANTrackPlayer *)self audioFileTransition];

  uint64_t v7 = 2;
  v3 = (void *)v6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v8 = [(ANTrackPlayer *)self _addURL:v3 announcementID:0 trackType:v7];
LABEL_6:

  return v8;
}

- (id)prepareToPlay
{
  v3 = [(ANTrackPlayer *)self audioSessionManager];
  id v6 = 0;
  [v3 activateAudioSessionWithError:&v6];
  id v4 = v6;

  if (!v4) {
    [(ANTrackPlayer *)self setReadyToPlay:1];
  }
  return v4;
}

- (void)playWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(ANTrackPlayer *)self mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ANTrackPlayer_playWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BCE380;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANTrackPlayer_playWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([WeakRetained playbackState] == 1 || objc_msgSend(WeakRetained, "playbackState") == 2)
  {
    v3 = [a1[4] log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = [WeakRetained playbackState];
      _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Already playing or interrupted. PlaybackState: %ld", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__ANTrackPlayer_playWithCompletionHandler___block_invoke_26;
    v4[3] = &unk_1E6BCDE30;
    v4[4] = WeakRetained;
    id v5 = a1[5];
    [WeakRetained _playWithCompletionHandler:v4];
  }
}

void __43__ANTrackPlayer_playWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  BOOL v3 = a2 == 0;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 setPlaybackState:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_playWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  if ([(ANTrackPlayer *)self readyToPlay])
  {
    [(ANTrackPlayer *)self _handleReadyToPlayWithCompletionHandler:v4];
  }
  else
  {
    id v6 = [(ANTrackPlayer *)self audioSessionManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__ANTrackPlayer__playWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E6BCDE30;
    v7[4] = self;
    id v8 = v4;
    [v6 activateAudioSessionWithCompletionHandler:v7];
  }
}

void __44__ANTrackPlayer__playWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__ANTrackPlayer__playWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v4 setReadyToPlay:1];
    [*(id *)(a1 + 32) _handleReadyToPlayWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)_handleReadyToPlayWithCompletionHandler:(id)a3
{
  *(void *)&v36[5] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  if ([(ANTrackPlayer *)self readyToPlay])
  {
    id v6 = [(ANTrackPlayer *)self queuePlayer];
    uint64_t v7 = [v6 error];

    if (!v7) {
      goto LABEL_8;
    }
    id v8 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:](self, v8);
    }

    id v9 = [(ANTrackPlayer *)self queuePlayer];
    uint64_t v10 = [v9 error];

    if (v10)
    {
      v4[2](v4, v10);
    }
    else
    {
LABEL_8:
      BOOL v12 = [(ANTrackPlayer *)self queuePlayer];
      uint64_t v13 = [v12 status];

      int v14 = [(ANTrackPlayer *)self queuePlayer];
      uint64_t v15 = [v14 currentItem];
      uint64_t v16 = [v15 status];

      id v17 = [(ANTrackPlayer *)self log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(ANTrackPlayer *)self queuePlayer];
        v19 = [v18 currentItem];
        *(_DWORD *)buf = 138412290;
        *(void *)v36 = v19;
        _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "Current Item = %@", buf, 0xCu);
      }
      uint64_t v20 = [(ANTrackPlayer *)self log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v36[0] = v13 == 1;
        LOWORD(v36[1]) = 1024;
        *(_DWORD *)((char *)&v36[1] + 2) = v16 == 1;
        _os_log_impl(&dword_1DA5ED000, v20, OS_LOG_TYPE_DEFAULT, "QueuePlayerReady = %d, PlayerItemReady = %d", buf, 0xEu);
      }

      if (v13 == 1 && v16 == 1)
      {
        v21 = [(ANTrackPlayer *)self playerTimer];
        [v21 cancel];

        [(ANTrackPlayer *)self setPlaybackPending:0];
        [(ANTrackPlayer *)self setHandler:0];
        [(ANTrackPlayer *)self setReadyToPlay:0];
        v22 = [(ANTrackPlayer *)self log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v36 = "-[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:]";
          _os_log_impl(&dword_1DA5ED000, v22, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_31;
        v30[3] = &unk_1E6BCE9A0;
        objc_copyWeak(&v32, (id *)buf);
        objc_super v31 = v4;
        [(ANTrackPlayer *)self playInternalWithCompletionHandler:v30];

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v23 = [(ANTrackPlayer *)self log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "NOT ready to play.", buf, 2u);
        }

        [(ANTrackPlayer *)self setPlaybackPending:1];
        [(ANTrackPlayer *)self setHandler:v4];
        v24 = [MEMORY[0x1E4F4A8E0] sharedInstance];
        v25 = [v24 numberForDefault:*MEMORY[0x1E4F4A6D0]];
        [v25 doubleValue];
        double v27 = v26;

        objc_initWeak((id *)buf, self);
        uint64_t v28 = [(ANTrackPlayer *)self playerTimer];
        v29 = [(ANTrackPlayer *)self mainQueue];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke;
        v33[3] = &unk_1E6BCDE80;
        objc_copyWeak(&v34, (id *)buf);
        [v28 startWithValue:v29 queue:v33 handler:v27];

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:", 1018);
    v4[2](v4, v11);
  }
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_cold_1(WeakRetained);
  }

  [WeakRetained _stopAndUpdatePlaybackState:0];
  [WeakRetained setPlaybackPending:0];
  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1018, *MEMORY[0x1E4F4A710]);
  id v4 = [WeakRetained handler];
  ((void (**)(void, void *))v4)[2](v4, v3);

  [WeakRetained setHandler:0];
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained audioSessionManager];
    [v4 deactivateAudioSessionAfterDelay:0.0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)activelyPlayingAnnouncementID
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v3 = [(ANTrackPlayer *)self playerItems];
  id v4 = [v3 lastObject];
  id v18 = [v4 announcementID];

  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = [(ANTrackPlayer *)self mainQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke;
  block[3] = &unk_1E6BCE9E8;
  int v11 = v5;
  BOOL v12 = &v13;
  block[4] = self;
  uint64_t v7 = v5;
  dispatch_async(v6, block);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSString *)v8;
}

void __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playerItems];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_20);

  id v4 = [*(id *)(a1 + 32) log];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_cold_1();
    }

    uint64_t v6 = [v3 announcementID];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "Did not find currently playing info. Using last item.", v8, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

BOOL __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 completed] & 1) == 0 && objc_msgSend(v2, "trackType") == 0;

  return v3;
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[ANTrackPlayer stopWithCompletionHandler:]";
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = [(ANTrackPlayer *)self mainQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__ANTrackPlayer_stopWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BCE168;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __43__ANTrackPlayer_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopAndUpdatePlaybackState:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_stopAndUpdatePlaybackState:(unint64_t)a3
{
  id v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(ANTrackPlayer *)self interruptionTimer];
  [v6 cancel];

  id v7 = [(ANTrackPlayer *)self playerTimer];
  [v7 cancel];

  [(ANTrackPlayer *)self stopInternalSync];
  [(ANTrackPlayer *)self setPlaybackState:a3];
}

- (void)end
{
  BOOL v3 = [(ANTrackPlayer *)self mainQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__ANTrackPlayer_end__block_invoke;
  block[3] = &unk_1E6BCE238;
  block[4] = self;
  dispatch_async(v3, block);
}

void __20__ANTrackPlayer_end__block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (([*(id *)(a1 + 32) options] & 0x200) == 0)
  {
    BOOL v3 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    id v4 = [v3 numberForDefault:*MEMORY[0x1E4F4A5F8]];
    [v4 doubleValue];
    double v2 = v5;
  }
  id v6 = [*(id *)(a1 + 32) audioSessionManager];
  [v6 deactivateAudioSessionAfterDelay:v2];
}

- (void)nextWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(ANTrackPlayer *)self mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ANTrackPlayer_nextWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BCE380;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANTrackPlayer_nextWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[ANTrackPlayer nextWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  if ([WeakRetained playbackState] == 1)
  {
    [WeakRetained stopInternalSync];
    [WeakRetained nextInternalSync];
    [WeakRetained _playWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)previousWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(ANTrackPlayer *)self mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ANTrackPlayer_previousWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BCE380;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__ANTrackPlayer_previousWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[ANTrackPlayer previousWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  if ([WeakRetained playbackState] == 1)
  {
    [WeakRetained stopInternalSync];
    [WeakRetained previousInternalSync];
    [WeakRetained _playWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (int)numberActiveTracks
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  BOOL v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  int v4 = [(ANTrackPlayer *)self mainQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ANTrackPlayer_numberActiveTracks__block_invoke;
  block[3] = &unk_1E6BCE9E8;
  id v8 = v3;
  id v9 = &v10;
  block[4] = self;
  double v5 = v3;
  dispatch_async(v4, block);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v3) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return (int)v3;
}

void __35__ANTrackPlayer_numberActiveTracks__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__ANTrackPlayer_numberActiveTracks__block_invoke_cold_1(v2);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "playerItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 completed] & 1) == 0 && !objc_msgSend(v8, "trackType")) {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_registerForNotificationsWithAudioSession:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_audioSessionInterruptionHandler_ name:*MEMORY[0x1E4F15000] object:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_audioSessionMediaServicesLostHandler_ name:*MEMORY[0x1E4F15030] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_audioSessionMediaServicesResetHandler_ name:*MEMORY[0x1E4F15048] object:0];

  long long v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_playerItemPlayedToEndHandler_ name:*MEMORY[0x1E4F16020] object:0];

  long long v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_playerItemPlayedToEndHandler_ name:*MEMORY[0x1E4F16030] object:0];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_playerRateChangedHandler_ name:*MEMORY[0x1E4F16068] object:0];
}

- (void)_deregisterForNotificationsWithAudioSession:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F15000] object:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F15030] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F15048] object:0];

  long long v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4F16020] object:0];

  long long v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:*MEMORY[0x1E4F16030] object:0];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self name:*MEMORY[0x1E4F16068] object:0];
}

- (void)_configureAudioSession
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Failed to configure Audio Session. Error = %@", v2, v3, v4, v5, v6);
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANTrackPlayer *)self delegateQueue];

  if (v5)
  {
    uint8_t v6 = [(ANTrackPlayer *)self delegateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__ANTrackPlayer__callDelegateWithBlock___block_invoke;
    v8[3] = &unk_1E6BCE560;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  else
  {
    id v7 = [(ANTrackPlayer *)self delegate];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

void __40__ANTrackPlayer__callDelegateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) delegate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_playerInfoForAVPlayerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    uint8_t v6 = [(ANTrackPlayer *)self playerItems];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__ANTrackPlayer__playerInfoForAVPlayerItem___block_invoke;
    v9[3] = &unk_1E6BCEA10;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

BOOL __44__ANTrackPlayer__playerInfoForAVPlayerItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 playerItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_addObserverForPlayer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self forKeyPath:@"status" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"rate" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"timeControlStatus" options:1 context:0];
}

- (void)_removeObserverForPlayer:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"status"];
  [v4 removeObserver:self forKeyPath:@"rate"];
  [v4 removeObserver:self forKeyPath:@"timeControlStatus"];
}

- (void)_removeItemObserverForPlayer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) removeObserver:self forKeyPath:@"status" context:0];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_stringForTimeControlStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6BCEAD0[a3];
  }
}

- (id)_stringForPlayerStatus:(int64_t)a3
{
  uint64_t v3 = @"Unknown";
  if (a3 == 2) {
    uint64_t v3 = @"Failed";
  }
  if (a3 == 1) {
    return @"Ready to Play";
  }
  else {
    return v3;
  }
}

- (id)_stringForPlayerItemStatus:(int64_t)a3
{
  uint64_t v3 = @"Unknown";
  if (a3 == 2) {
    uint64_t v3 = @"Failed";
  }
  if (a3 == 1) {
    return @"Ready to Play";
  }
  else {
    return v3;
  }
}

- (void)_stopPlaybackAndFailWithItem:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v8);

  [(ANTrackPlayer *)self _stopAndUpdatePlaybackState:0];
  if (v6)
  {
    long long v9 = [(ANTrackPlayer *)self _playerInfoForAVPlayerItem:v6];
    long long v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 trackType];
      long long v12 = [v10 announcementID];
    }
    else
    {
      long long v12 = 0;
      uint64_t v11 = -1;
    }
  }
  else
  {
    long long v12 = 0;
    uint64_t v11 = -1;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__ANTrackPlayer__stopPlaybackAndFailWithItem_error___block_invoke;
  v15[3] = &unk_1E6BCEA38;
  v15[4] = self;
  id v16 = v12;
  id v17 = v7;
  uint64_t v18 = v11;
  id v13 = v7;
  id v14 = v12;
  [(ANTrackPlayer *)self _callDelegateWithBlock:v15];
}

uint64_t __52__ANTrackPlayer__stopPlaybackAndFailWithItem_error___block_invoke(void *a1, void *a2)
{
  return [a2 trackPlayer:a1[4] didFinishPlayingTrackType:a1[7] announcementID:a1[5] error:a1[6]];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  long long v12 = [(ANTrackPlayer *)self mainQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v15[3] = &unk_1E6BCE448;
  objc_copyWeak(&v18, &location);
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained queuePlayer];
  [v3 rate];
  float v5 = v4;

  id v6 = [WeakRetained queuePlayer];
  *(double *)&uint64_t v7 = COERCE_DOUBLE([v6 timeControlStatus]);

  id v8 = [WeakRetained _stringForTimeControlStatus:v7];
  id v9 = [WeakRetained queuePlayer];
  id v10 = [v9 currentItem];

  id v11 = [WeakRetained queuePlayer];
  long long v12 = [v11 reasonForWaitingToPlay];

  id v13 = [WeakRetained queuePlayer];
  id v14 = objc_msgSend(WeakRetained, "_stringForPlayerStatus:", objc_msgSend(v13, "status"));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [WeakRetained log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      id v17 = v12;
      id v18 = v10;
      v19 = v8;
      uint64_t v20 = (const char *)a1[5];
      v44 = [WeakRetained queuePlayer];
      v21 = [v44 error];
      *(_DWORD *)buf = 138414082;
      v48 = v20;
      id v8 = v19;
      id v10 = v18;
      long long v12 = v17;
      id v14 = v16;
      __int16 v49 = 2048;
      double v50 = v5;
      __int16 v51 = 2048;
      double v52 = *(double *)&v7;
      __int16 v53 = 2112;
      v54 = v8;
      __int16 v55 = 2112;
      v56 = v10;
      __int16 v57 = 2112;
      v58 = v12;
      __int16 v59 = 2112;
      v60 = v16;
      __int16 v61 = 2112;
      v62 = v21;
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "|> KeyPath (%@) changed                    \n    Queue Player Rate = %f                    \n    Time Control Status = (%ld) %@                    \n    Current Item = %@                    \n    Reason For Waiting To Play = %@                    \n    Player Status = %@                    \n    Error = %@", buf, 0x52u);
    }
    if ([a1[5] isEqualToString:@"status"])
    {
      id v22 = a1[4];
      if (!v22) {
        goto LABEL_37;
      }
      id v23 = [WeakRetained queuePlayer];

      if (v22 != v23) {
        goto LABEL_37;
      }
      uint64_t v24 = [v22 status];
      if (v24 != 2)
      {
        if (v24 == 1)
        {
          v25 = [WeakRetained log];
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315138;
          v48 = "-[ANTrackPlayer observeValueForKeyPath:ofObject:change:context:]_block_invoke";
          double v26 = "%s: Queue player is ready to play.";
          goto LABEL_20;
        }
        goto LABEL_37;
      }
      v39 = [WeakRetained log];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1();
      }

      v40 = [v22 error];
      v41 = v40;
      if (v40)
      {
        id v42 = v40;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1055, *MEMORY[0x1E4F4A710]);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v34 = v42;

      v43 = [v22 currentItem];
      [WeakRetained _stopPlaybackAndFailWithItem:v43 error:v34];

      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a1[5] isEqualToString:@"status"])
      {
        id v27 = a1[4];
        if (v27)
        {
          id v22 = v27;
          uint64_t v28 = [WeakRetained log];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(WeakRetained, "_stringForPlayerItemStatus:", objc_msgSend(v22, "status"));
            v29 = (char *)objc_claimAutoreleasedReturnValue();
            double v30 = [v22 asset];
            [v22 duration];
            [v22 duration];
            objc_super v31 = [v22 error];
            *(_DWORD *)buf = 138413058;
            v48 = v29;
            __int16 v49 = 2112;
            double v50 = v30;
            __int16 v51 = 2048;
            double v52 = (double)v46 / (double)v45;
            __int16 v53 = 2112;
            v54 = v31;
            _os_log_impl(&dword_1DA5ED000, v28, OS_LOG_TYPE_DEFAULT, "|> AVPlayerItem Status = %@                        \n    Asset = %@                        \n    Duration (sec) = %f                        \n    Error = %@", buf, 0x2Au);
          }
          uint64_t v32 = [v22 status];
          if (v32 != 2)
          {
            if (v32 == 1)
            {
              v25 = [WeakRetained log];
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_21;
              }
              *(_DWORD *)buf = 136315138;
              v48 = "-[ANTrackPlayer observeValueForKeyPath:ofObject:change:context:]_block_invoke";
              double v26 = "%s: Player Item is ready to play.";
LABEL_20:
              _os_log_impl(&dword_1DA5ED000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
LABEL_21:

              if (![WeakRetained playbackPending]) {
                goto LABEL_37;
              }
              v33 = [WeakRetained handler];

              if (!v33) {
                goto LABEL_37;
              }
              id v34 = [WeakRetained handler];
              [WeakRetained _playWithCompletionHandler:v34];
              goto LABEL_36;
            }
LABEL_37:

            goto LABEL_38;
          }
          v35 = [WeakRetained log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2();
          }

          v36 = [v22 error];
          v37 = v36;
          if (v36)
          {
            id v38 = v36;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1053, *MEMORY[0x1E4F4A710]);
            id v38 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v34 = v38;

          [WeakRetained _stopPlaybackAndFailWithItem:v22 error:v34];
LABEL_36:

          goto LABEL_37;
        }
      }
    }
  }
LABEL_38:
}

- (void)playInternalWithCompletionHandler:(id)a3
{
}

- (void)stopInternalSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  float v4 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ANTrackPlayer stopInternalSync]";
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  float v5 = [(ANTrackPlayer *)self queuePlayer];
  [v5 pause];

  [(ANTrackPlayer *)self setPlaybackPending:0];
}

- (void)nextInternalSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  float v4 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[ANTrackPlayer nextInternalSync]";
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  float v5 = [(ANTrackPlayer *)self queuePlayer];
  int v6 = [v5 currentItem];
  uint64_t v7 = [(ANTrackPlayer *)self _playerInfoForAVPlayerItem:v6];

  if (v7) {
    [v7 setCompleted:1];
  }
  uint64_t v8 = [(ANTrackPlayer *)self queuePlayer];
  [v8 advanceToNextItem];
}

- (void)previousInternalSync
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  v29 = self;
  float v4 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ANTrackPlayer previousInternalSync]";
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  float v5 = [(ANTrackPlayer *)self playerItems];
  double v30 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_63);

  int v6 = [(ANTrackPlayer *)self queuePlayer];
  uint64_t v7 = v6;
  if (v6) {
    [v6 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  [(ANTrackPlayer *)self previousSkipGoesToPreviousTrackDelta];
  if (Seconds <= v9 && v30)
  {
    id v10 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ANTrackPlayer previousInternalSync]";
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%s: Going back to previous announcement.", buf, 0xCu);
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v12 = [(ANTrackPlayer *)self playerItems];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (v17 == v30 || [v11 count])
          {
            [v17 setCompleted:0];
            id v18 = (void *)MEMORY[0x1E4F16620];
            v19 = [v17 playerItem];
            uint64_t v20 = [v19 asset];
            v21 = [v18 playerItemWithAsset:v20];

            [v17 setPlayerItem:v21];
            [v11 addObject:v21];
            [v21 addObserver:v29 forKeyPath:@"status" options:1 context:0];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v14);
    }

    id v22 = [(ANTrackPlayer *)v29 queuePlayer];
    [(ANTrackPlayer *)v29 _removeItemObserverForPlayer:v22];

    id v23 = [(ANTrackPlayer *)v29 queuePlayer];
    [v23 removeAllItems];

    uint64_t v24 = [(ANTrackPlayer *)v29 queuePlayer];
    [(ANTrackPlayer *)v29 _removeObserverForPlayer:v24];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F16670]) initWithItems:v11];
    [(ANTrackPlayer *)v29 setQueuePlayer:v25];
    double v26 = [(ANTrackPlayer *)v29 queuePlayer];
    [(ANTrackPlayer *)v29 _addObserverForPlayer:v26];

    id v27 = [(ANTrackPlayer *)v29 audioSession];
    uint64_t v28 = [(ANTrackPlayer *)v29 queuePlayer];
    [v28 setAudioSession:v27];
  }
  else
  {
    id v11 = [(ANTrackPlayer *)self queuePlayer];
    v25 = [v11 currentItem];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __37__ANTrackPlayer_previousInternalSync__block_invoke_2;
    v35[3] = &unk_1E6BCE338;
    v35[4] = self;
    *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
    uint64_t v39 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v25 seekToTime:buf completionHandler:v35];
  }
}

uint64_t __37__ANTrackPlayer_previousInternalSync__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 trackType]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 completed];
  }

  return v3;
}

void __37__ANTrackPlayer_previousInternalSync__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    float v4 = "unsuccessful";
    if (a2) {
      float v4 = "successful";
    }
    int v5 = 136315394;
    int v6 = "-[ANTrackPlayer previousInternalSync]_block_invoke_2";
    __int16 v7 = 2080;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%s: Attempt to restart announcement was %s.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_resumePlaybackAfterInterruptionAtTimeInterval:(double)a3
{
  id v5 = [(ANTrackPlayer *)self prepareToPlay];
  [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
  [(ANTrackPlayer *)self handleInterruptionDelay:v6 - a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke;
  v7[3] = &unk_1E6BCE028;
  v7[4] = self;
  [(ANTrackPlayer *)self _playWithCompletionHandler:v7];
}

void __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setPlaybackState:0];
    double v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_68;
    v7[3] = &unk_1E6BCEA60;
    v7[4] = v6;
    id v8 = v3;
    [v6 _callDelegateWithBlock:v7];
  }
  else
  {
    [v4 setPlaybackState:1];
  }
}

uint64_t __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_68(uint64_t a1, void *a2)
{
  return [a2 trackPlayer:*(void *)(a1 + 32) didFinishPlayingTrackType:-1 announcementID:0 error:*(void *)(a1 + 40)];
}

- (void)audioSessionMediaServicesLostHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ANTrackPlayer audioSessionMediaServicesLostHandler:]();
  }

  if ([(ANTrackPlayer *)self playbackState])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke;
    v6[3] = &unk_1E6BCE238;
    v6[4] = self;
    [(ANTrackPlayer *)self stopWithCompletionHandler:v6];
  }
}

void __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1024, *MEMORY[0x1E4F4A710]);
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke_2;
  v5[3] = &unk_1E6BCEA60;
  v5[4] = v3;
  id v6 = v2;
  id v4 = v2;
  [v3 _callDelegateWithBlock:v5];
}

uint64_t __54__ANTrackPlayer_audioSessionMediaServicesLostHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 trackPlayer:*(void *)(a1 + 32) didFinishPlayingTrackType:-1 announcementID:0 error:*(void *)(a1 + 40)];
}

- (void)audioSessionMediaServicesResetHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ANTrackPlayer audioSessionMediaServicesResetHandler:]();
  }

  if ([(ANTrackPlayer *)self playbackState])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke;
    v6[3] = &unk_1E6BCE238;
    v6[4] = self;
    [(ANTrackPlayer *)self stopWithCompletionHandler:v6];
  }
  else
  {
    [(ANTrackPlayer *)self _configureAudioSession];
  }
}

void __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1025, *MEMORY[0x1E4F4A710]);
  id v3 = *(void **)(a1 + 32);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  __int16 v7 = __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke_2;
  id v8 = &unk_1E6BCEA60;
  uint64_t v9 = v3;
  id v10 = v2;
  id v4 = v2;
  [v3 _callDelegateWithBlock:&v5];
  objc_msgSend(*(id *)(a1 + 32), "_configureAudioSession", v5, v6, v7, v8, v9);
}

uint64_t __55__ANTrackPlayer_audioSessionMediaServicesResetHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 trackPlayer:*(void *)(a1 + 32) didFinishPlayingTrackType:-1 announcementID:0 error:*(void *)(a1 + 40)];
}

- (void)_handleInterruptionEndedAndShouldResume:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(ANTrackPlayer *)self interruptionTimer];
  [v6 cancel];

  [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
  double v8 = v7;
  [(ANTrackPlayer *)self interruptionStart];
  double v10 = v9;
  id v11 = [(ANTrackPlayer *)self log];
  double v12 = v8 - v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [NSNumber numberWithDouble:v12];
    *(_DWORD *)buf = 138412290;
    v36 = v13;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Seconds elapsed since interruption began: %@", buf, 0xCu);
  }
  if ([(ANTrackPlayer *)self playbackState] != 2)
  {
    uint64_t v14 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ANTrackPlayer _handleInterruptionEndedAndShouldResume:]";
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%s: Interruption ended but we are not interrupted, don't do anything", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (([(ANTrackPlayer *)self options] & 1) == 0)
  {
    uint64_t v14 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[ANTrackPlayer _handleInterruptionEndedAndShouldResume:]";
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%s: Option to resume after interruption ended not set, don't do anything", buf, 0xCu);
    }
LABEL_10:

    return;
  }
  uint64_t v15 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v16 = [v15 numberForDefault:*MEMORY[0x1E4F4A6B8]];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [(ANTrackPlayer *)self log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = *(const char **)&v18;
    _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "Resume Timeout After Audio Interruption End: %f", buf, 0xCu);
  }

  if (v3 && v12 < v18)
  {
    uint64_t v20 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    v21 = [v20 numberForDefault:*MEMORY[0x1E4F4A600]];
    [v21 doubleValue];
    id v23 = v22;

    objc_initWeak(&location, self);
    uint64_t v24 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = v23;
      _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_DEFAULT, "Resume Audio Session Delay %f seconds", buf, 0xCu);
    }

    dispatch_time_t v25 = dispatch_time(0, (uint64_t)(*(double *)&v23 * 1000000000.0));
    double v26 = [(ANTrackPlayer *)self mainQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke;
    block[3] = &unk_1E6BCEA88;
    block[4] = self;
    v33[1] = (id)v23;
    objc_copyWeak(v33, &location);
    dispatch_after(v25, v26, block);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  else
  {
    id v27 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v27, OS_LOG_TYPE_DEFAULT, "Will not resume playback after Audio Session Interruption ended", buf, 2u);
    }

    [(ANTrackPlayer *)self _stopAndUpdatePlaybackState:0];
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1027, *MEMORY[0x1E4F4A710]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke_70;
    v30[3] = &unk_1E6BCEA60;
    void v30[4] = self;
    id v31 = v28;
    id v29 = v28;
    [(ANTrackPlayer *)self _callDelegateWithBlock:v30];
  }
}

void __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) playbackState];
  id WeakRetained = [*(id *)(a1 + 32) log];
  BOOL v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v2 == 2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1DA5ED000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Still interrupted. Resuming playback after delaying for %f seconds", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [*(id *)(a1 + 32) interruptionStart];
    -[NSObject _resumePlaybackAfterInterruptionAtTimeInterval:](WeakRetained, "_resumePlaybackAfterInterruptionAtTimeInterval:");
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DA5ED000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Playback state is not interrupted. Will not resume playback after delaying for %f seconds", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t __57__ANTrackPlayer__handleInterruptionEndedAndShouldResume___block_invoke_70(uint64_t a1, void *a2)
{
  return [a2 trackPlayer:*(void *)(a1 + 32) didFinishPlayingTrackType:-1 announcementID:0 error:*(void *)(a1 + 40)];
}

- (void)audioSessionInterruptionHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ANTrackPlayer *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 object];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v7 = [(ANTrackPlayer *)self audioSession];
    BOOL v8 = v6 == v7;

    uint64_t v9 = [(ANTrackPlayer *)self log];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        long long v34 = v6;
        _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for Audio Session %@", buf, 0xCu);
      }

      double v12 = [v4 userInfo];
      uint64_t v9 = v12;
      if (v12)
      {
        uint64_t v13 = [v12 valueForKey:*MEMORY[0x1E4F15020]];
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 unsignedIntegerValue];
          if (v15)
          {
            if (v15 == 1)
            {
              id v16 = [(ANTrackPlayer *)self log];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption: Began", buf, 2u);
              }

              if ([(ANTrackPlayer *)self playbackState] == 1)
              {
                [MEMORY[0x1E4F4A940] machTimeToSeconds:mach_absolute_time()];
                -[ANTrackPlayer setInterruptionStart:](self, "setInterruptionStart:");
                [(ANTrackPlayer *)self stopInternalSync];
                if ([(ANTrackPlayer *)self options])
                {
                  [(ANTrackPlayer *)self setPlaybackState:2];
                  id v23 = [MEMORY[0x1E4F4A8E0] sharedInstance];
                  uint64_t v24 = [v23 numberForDefault:*MEMORY[0x1E4F4A6B8]];
                  [v24 doubleValue];
                  double v26 = v25;

                  objc_initWeak((id *)buf, self);
                  id v27 = [(ANTrackPlayer *)self interruptionTimer];
                  uint64_t v28 = [(ANTrackPlayer *)self mainQueue];
                  v29[0] = MEMORY[0x1E4F143A8];
                  v29[1] = 3221225472;
                  v29[2] = __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2;
                  v29[3] = &unk_1E6BCE1E8;
                  objc_copyWeak(&v30, (id *)buf);
                  v29[4] = self;
                  [v27 startWithValue:v28 queue:v29 handler:v26];

                  objc_destroyWeak(&v30);
                  objc_destroyWeak((id *)buf);
                }
                else
                {
                  [(ANTrackPlayer *)self setPlaybackState:0];
                  double v17 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1027, *MEMORY[0x1E4F4A710]);
                  v31[0] = MEMORY[0x1E4F143A8];
                  v31[1] = 3221225472;
                  v31[2] = __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke;
                  v31[3] = &unk_1E6BCEA60;
                  v31[4] = self;
                  id v32 = v17;
                  id v18 = v17;
                  [(ANTrackPlayer *)self _callDelegateWithBlock:v31];
                }
              }
              else
              {
                id v22 = [(ANTrackPlayer *)self log];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  long long v34 = "-[ANTrackPlayer audioSessionInterruptionHandler:]";
                  _os_log_impl(&dword_1DA5ED000, v22, OS_LOG_TYPE_DEFAULT, "%s: Interruption while not playing, don't do anything", buf, 0xCu);
                }
              }
            }
          }
          else
          {
            v19 = [v9 valueForKey:*MEMORY[0x1E4F15008]];
            uint64_t v20 = [(ANTrackPlayer *)self log];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v34 = v19;
              _os_log_impl(&dword_1DA5ED000, v20, OS_LOG_TYPE_DEFAULT, "Audio Session Interruption: Ended. Should Resume: %@", buf, 0xCu);
            }

            if (v19) {
              BOOL v21 = [v19 unsignedIntegerValue] == 1;
            }
            else {
              BOOL v21 = 0;
            }
            [(ANTrackPlayer *)self _handleInterruptionEndedAndShouldResume:v21];
          }
        }
      }
    }
    else if (v10)
    {
      id v11 = [(ANTrackPlayer *)self audioSession];
      *(_DWORD *)buf = 138412546;
      long long v34 = v11;
      __int16 v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Received Audio Session Interruption Notification for different Audio Session. Expected: %@, Actual: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [(ANTrackPlayer *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ANTonePlayer audioSessionInterruptionHandler:]();
    }
  }
}

uint64_t __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 trackPlayer:*(void *)(a1 + 32) didFinishPlayingTrackType:-1 announcementID:0 error:*(void *)(a1 + 40)];
}

void __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2_cold_1(a1);
  }

  [WeakRetained _stopAndUpdatePlaybackState:0];
}

- (void)playerRateChangedHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANTrackPlayer *)self mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ANTrackPlayer_playerRateChangedHandler___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__ANTrackPlayer_playerRateChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 40) queuePlayer];

    if (v2 == v3)
    {
      id v4 = [*(id *)(a1 + 40) log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        double v5 = *(double *)(a1 + 32);
        int v15 = 138412290;
        double v16 = v5;
        _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "|> Rate Changed Notification: %@", (uint8_t *)&v15, 0xCu);
      }

      id v6 = [*(id *)(a1 + 40) log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [v2 rate];
        int v15 = 134217984;
        double v16 = v7;
        _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "|> Player Rate: %f", (uint8_t *)&v15, 0xCu);
      }

      id v8 = [*(id *)(a1 + 32) userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F16070]];

      if (v9 && [v9 isEqualToString:*MEMORY[0x1E4F16080]])
      {
        BOOL v10 = [*(id *)(a1 + 40) log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ANTonePlayer playerRateChangedHandler:]();
        }

        id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1018, *MEMORY[0x1E4F4A710]);
        double v12 = *(void **)(a1 + 40);
        uint64_t v13 = [v12 queuePlayer];
        uint64_t v14 = [v13 currentItem];
        [v12 _stopPlaybackAndFailWithItem:v14 error:v11];
      }
    }
  }
}

- (void)playerItemPlayedToEndHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(ANTrackPlayer *)self mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Player item played to end notification: %@", buf, 0xCu);
  }

  double v5 = [*(id *)(a1 + 40) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = [v8 _playerInfoForAVPlayerItem:v7];
    BOOL v10 = [*v2 log];
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [*v2 queuePlayer];
        *(_DWORD *)buf = 138412546;
        id v22 = v12;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "Marking player item as completed for player %@: %@", buf, 0x16u);
      }
      [v9 setCompleted:1];
      uint64_t v13 = [*(id *)(a1 + 40) name];
      int v14 = [v13 isEqualToString:*MEMORY[0x1E4F16030]];

      if (v14)
      {
        int v15 = [*(id *)(a1 + 40) userInfo];
        double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F16028]];

        if (!v16)
        {
          double v16 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 5004, *MEMORY[0x1E4F4A710]);
        }
      }
      else
      {
        double v16 = 0;
      }
      id v17 = *v2;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_71;
      v18[3] = &unk_1E6BCEAB0;
      v18[4] = v17;
      v19 = v9;
      id v20 = v16;
      id v11 = v16;
      [v17 _callDelegateWithBlock:v18];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_2(v2, (uint64_t)v7, v11);
    }
  }
  else
  {
    uint64_t v9 = [v8 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_1();
    }
  }
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 trackType];
  id v7 = [*(id *)(a1 + 40) announcementID];
  [v5 trackPlayer:v3 didFinishPlayingTrackType:v6 announcementID:v7 error:*(void *)(a1 + 48)];
}

- (ANTrackPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANTrackPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setDelegateQueue:(id)a3
{
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
}

- (double)silenceBetweenEachTrack
{
  return self->_silenceBetweenEachTrack;
}

- (void)setSilenceBetweenEachTrack:(double)a3
{
  self->_silenceBetweenEachTrack = a3;
}

- (NSURL)audioFileAtStart
{
  return self->_audioFileAtStart;
}

- (void)setAudioFileAtStart:(id)a3
{
}

- (double)trimStartTone
{
  return self->_trimStartTone;
}

- (void)setTrimStartTone:(double)a3
{
  self->_trimStartTone = a3;
}

- (NSURL)audioFileTransition
{
  return self->_audioFileTransition;
}

- (void)setAudioFileTransition:(id)a3
{
}

- (double)trimTransitionTone
{
  return self->_trimTransitionTone;
}

- (void)setTrimTransitionTone:(double)a3
{
  self->_trimTransitionTone = a3;
}

- (double)previousSkipGoesToPreviousTrackDelta
{
  return self->_previousSkipGoesToPreviousTrackDelta;
}

- (void)setPreviousSkipGoesToPreviousTrackDelta:(double)a3
{
  self->_previousSkipGoesToPreviousTrackDelta = a3;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (double)interruptionStart
{
  return self->_interruptionStart;
}

- (void)setInterruptionStart:(double)a3
{
  self->_interruptionStart = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (ANAudioSessionManager)audioSessionManager
{
  return self->_audioSessionManager;
}

- (BOOL)readyToPlay
{
  return self->_readyToPlay;
}

- (void)setReadyToPlay:(BOOL)a3
{
  self->_readyToPlay = a3;
}

- (ANTimer)interruptionTimer
{
  return self->_interruptionTimer;
}

- (void)setInterruptionTimer:(id)a3
{
}

- (ANTimer)playerTimer
{
  return self->_playerTimer;
}

- (void)setPlayerTimer:(id)a3
{
}

- (BOOL)someOtherSidekickSessionAudioIsPlaying
{
  return self->_someOtherSidekickSessionAudioIsPlaying;
}

- (void)setSomeOtherSidekickSessionAudioIsPlaying:(BOOL)a3
{
  self->_someOtherSidekickSessionAudioIsPlaying = a3;
}

- (BOOL)playbackPending
{
  return self->_playbackPending;
}

- (void)setPlaybackPending:(BOOL)a3
{
  self->_playbackPending = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_playerTimer, 0);
  objc_storeStrong((id *)&self->_interruptionTimer, 0);
  objc_storeStrong((id *)&self->_audioSessionManager, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioFileTransition, 0);
  objc_storeStrong((id *)&self->_audioFileAtStart, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__ANTrackPlayer__playWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Audio session activation error: %@", v2, v3, v4, v5, v6);
}

- (void)_handleReadyToPlayWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 queuePlayer];
  uint64_t v4 = [v3 error];
  int v5 = 136315394;
  uint8_t v6 = "-[ANTrackPlayer _handleReadyToPlayWithCompletionHandler:]";
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "%s: Queue player error: %@", (uint8_t *)&v5, 0x16u);
}

void __57__ANTrackPlayer__handleReadyToPlayWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 playerTimer];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1DA5ED000, v2, v3, "Audio Player Timer Expired [%@]", v4, v5, v6, v7, v8);
}

void __46__ANTrackPlayer_activelyPlayingAnnouncementID__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1DA5ED000, v0, OS_LOG_TYPE_DEBUG, "Currently Playing: %@", v1, 0xCu);
}

void __35__ANTrackPlayer_numberActiveTracks__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ANTrackPlayer numberActiveTracks]_block_invoke";
  _os_log_debug_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "AVPlayer Status Failed", v2, v3, v4, v5, v6);
}

void __64__ANTrackPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "AVPlayerItem Status Failed", v2, v3, v4, v5, v6);
}

void __64__ANTrackPlayer__resumePlaybackAfterInterruptionAtTimeInterval___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Failed to resume playback %@", v2, v3, v4, v5, v6);
}

- (void)audioSessionMediaServicesLostHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Media Services Lost: %@", v2, v3, v4, v5, v6);
}

- (void)audioSessionMediaServicesResetHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Media Services Reset: %@", v2, v3, v4, v5, v6);
}

void __49__ANTrackPlayer_audioSessionInterruptionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) interruptionTimer];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1DA5ED000, v2, v3, "Audio Session Interruption Timer Expired [%@]", v4, v5, v6, v7, v8);
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Received notification for completed item, but couldn't cast to AVPlayerItem: %@", v2, v3, v4, v5, v6);
}

void __46__ANTrackPlayer_playerItemPlayedToEndHandler___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 queuePlayer];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DA5ED000, a3, OS_LOG_TYPE_ERROR, "Received notification for completed item, but couldn't find record of it for player %@: %@", v6, 0x16u);
}

@end