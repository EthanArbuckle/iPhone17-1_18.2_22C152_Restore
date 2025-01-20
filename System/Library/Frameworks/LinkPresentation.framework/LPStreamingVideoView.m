@interface LPStreamingVideoView
- (BOOL)isMuted;
- (BOOL)releaseDecodingResourcesIfInactive;
- (BOOL)shouldAutoPlay;
- (BOOL)shouldShowMuteButton;
- (BOOL)usesCustomFullScreenImplementation;
- (BOOL)usesSharedAudioSession;
- (LPStreamingVideoView)initWithHost:(id)a3 video:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8;
- (double)volume;
- (id)createFullScreenVideoViewController;
- (id)createVideoPlayerView;
- (void)beginLoadingMediaForPreroll;
- (void)createPlayerIfNeeded;
- (void)createPlayerItemAdjustedForLoopingWithAsset:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)destroyPlayer;
- (void)didFailToPlay;
- (void)fullScreenVideoDidPresent;
- (void)fullScreenVideoWillDismiss;
- (void)layoutComponentView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)releaseDecodingResourcesIfInactive;
- (void)resetToPlaceholderView;
- (void)setMuted:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setVolume:(double)a3;
@end

@implementation LPStreamingVideoView

- (LPStreamingVideoView)initWithHost:(id)a3 video:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)LPStreamingVideoView;
  v20 = [(LPVisualMediaView *)&v24 initWithHost:v14 media:v15 style:v16 posterFrame:v17 posterFrameStyle:v18 configuration:v19];
  v21 = v20;
  if (v20)
  {
    v20->_desiredVolume = 0.0;
    v20->_desiredPlayingState = [(LPStreamingVideoView *)v20 shouldAutoPlay];
    v22 = v21;
  }

  return v21;
}

- (void)dealloc
{
  [(LPStreamingVideoView *)self destroyPlayer];
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  [(LPVisualMediaView *)&v3 dealloc];
}

- (void)createPlayerItemAdjustedForLoopingWithAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke;
  v10[3] = &unk_1E5B04E68;
  v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [v8 loadValuesAsynchronouslyForKeys:&unk_1EF7128E8 keysForCollectionKeys:&unk_1EF712D20 completionHandler:v10];
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5B04E40;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  uint64_t v8 = v4;
  v5 = __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2((uint64_t)v6);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

id __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F16620] playerItemWithAsset:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 32) tracksWithMediaCharacteristic:*MEMORY[0x1E4F15B98]];
  uint64_t v4 = [*(id *)(a1 + 32) tracksWithMediaCharacteristic:*MEMORY[0x1E4F15B00]];
  if ([v3 count] == 1 && objc_msgSend(v4, "count") == 1)
  {
    v5 = [v3 firstObject];
    id v6 = [v4 firstObject];
    if [v5 isEnabled] && (objc_msgSend(v6, "isEnabled"))
    {
      memset(&v26, 0, sizeof(v26));
      if (v5) {
        [v5 timeRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      CMTimeRangeGetEnd(&v26, &range);
      memset(&v21, 0, sizeof(v21));
      if (v6) {
        [v6 timeRange];
      }
      else {
        memset(&v20, 0, sizeof(v20));
      }
      CMTimeRangeGetEnd(&v21, &v20);
      if ((v26.flags & 0x1D) == 1 && (v21.flags & 0x1D) == 1)
      {
        CMTime time1 = v26;
        CMTime time2 = v21;
        if (CMTimeCompare(&time1, &time2))
        {
          memset(&time1, 0, sizeof(time1));
          CMTime time2 = v26;
          CMTime rhs = v21;
          CMTimeSubtract(&time, &time2, &rhs);
          CMTimeAbsoluteValue(&time1, &time);
          CMTime time2 = time1;
          double Seconds = CMTimeGetSeconds(&time2);
          BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
          if (Seconds <= 0.1)
          {
            if (v9)
            {
              int v13 = [*(id *)(a1 + 40) loggingID];
              CMTime time2 = time1;
              double v14 = CMTimeGetSeconds(&time2);
              __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_3((uint64_t)&time2, (uint64_t)v23, v13, v14);
            }
            CMTime rhs = v26;
            CMTime v16 = v21;
            CMTimeMinimum(&v17, &rhs, &v16);
            CMTime v15 = v17;
            [v2 setForwardPlaybackEndTime:&v15];
          }
          else if (v9)
          {
            int v10 = [*(id *)(a1 + 40) loggingID];
            CMTime time2 = time1;
            double v11 = CMTimeGetSeconds(&time2);
            __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_2((uint64_t)&time2, (uint64_t)&rhs, v10, v11);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_1((uint64_t)&time1, [*(id *)(a1 + 40) loggingID]);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_4((uint64_t)&time1, [*(id *)(a1 + 40) loggingID]);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_5([v5 isEnabled], objc_msgSend(v6, "isEnabled"), (uint8_t *)&v26, objc_msgSend(*(id *)(a1 + 40), "loggingID"));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = [*(id *)(a1 + 40) loggingID];
    [v3 count];
    [v4 count];
    __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_6((uint64_t)&v26, v7);
  }

  return v2;
}

- (void)createPlayerIfNeeded
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPStreamingVideoView<%d>: creating player", v4);
}

void __44__LPStreamingVideoView_createPlayerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[76];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:v5 templateItem:v8];
      id v7 = v4[77];
      v4[77] = (id)v6;

      [v4[77] addObserver:v4 forKeyPath:@"status" options:1 context:statusChangeKVOContext];
    }
  }
}

- (void)destroyPlayer
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPStreamingVideoView<%d>: destroying player", v4);
}

- (void)resetToPlaceholderView
{
  [(LPStreamingVideoView *)self destroyPlayer];
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  [(LPVisualMediaView *)&v3 resetToPlaceholderView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)timeControlStatusKVOContext != a6)
  {
    if ((void *)readyForDisplayKVOContext == a6)
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3032000000;
      v23[3] = __Block_byref_object_copy_;
      v23[4] = __Block_byref_object_dispose_;
      CMTime v16 = self;
      objc_super v24 = v16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__LPStreamingVideoView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5B04EB8;
      block[4] = v23;
      dispatch_async(MEMORY[0x1E4F14428], block);
      readyForDisplayCallback = (void (**)(void))v16->_readyForDisplayCallback;
      if (readyForDisplayCallback)
      {
        readyForDisplayCallback[2]();
        id v18 = v16->_readyForDisplayCallback;
        v16->_readyForDisplayCallback = 0;

        [(AVPlayerLayer *)v16->_playerLayer removeObserver:v16 forKeyPath:@"readyForDisplay" context:&readyForDisplayKVOContext];
      }
      _Block_object_dispose(v23, 8);
    }
    else if ((void *)statusChangeKVOContext == a6)
    {
      if ([(AVPlayerLooper *)self->_looper status] == AVPlayerLooperStatusFailed) {
        [(LPStreamingVideoView *)self didFailToPlay];
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)LPStreamingVideoView;
      [(LPStreamingVideoView *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
    goto LABEL_20;
  }
  BOOL v13 = [(LPVisualMediaView *)self hasEverPlayed];
  player = self->_player;
  if (v13)
  {
    if ([(AVQueuePlayer *)player timeControlStatus])
    {
      uint64_t v15 = 1;
      goto LABEL_18;
    }
    [(AVQueuePlayer *)self->_player rate];
    BOOL v19 = v20 == 1.0;
  }
  else
  {
    BOOL v19 = [(AVQueuePlayer *)player timeControlStatus] == 2;
  }
  uint64_t v15 = v19;
LABEL_18:
  [(LPVisualMediaView *)self didChangePlayingState:v15];
  if ([(AVQueuePlayer *)self->_player timeControlStatus] == 2)
  {
    [(LPVisualMediaView *)self setHasEverPlayed:1];
    [(LPVisualMediaView *)self setWaitingForPlayback:0];
    self->_playbackRetryCountWithoutSuccess = 0;
  }
LABEL_20:
}

void __71__LPStreamingVideoView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)didFailToPlay
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a1;
  _os_log_debug_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d>: failed to play, will try again later (%@)", buf, 0x12u);
}

uint64_t __37__LPStreamingVideoView_didFailToPlay__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 32) + 641) = 0;
  int v2 = *(void **)(*(void *)(a1 + 32) + 616);
  if (!v2 || (uint64_t result = [v2 status], result == 2))
  {
    uint64_t v4 = (id)LPLogChannelUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37__LPStreamingVideoView_didFailToPlay__block_invoke_cold_1((uint64_t)v1, v6, [*v1 loggingID], v4);
    }

    id v5 = *v1;
    if (*((unsigned char *)*v1 + 648)) {
      return [v5 createPlayerIfNeeded];
    }
    else {
      return [v5 setWaitingForPlayback:0];
    }
  }
  return result;
}

- (void)beginLoadingMediaForPreroll
{
  [(LPVisualMediaView *)self _swapVideoPlaceholderForVideoForAutoPlay:1];
  [(LPStreamingVideoView *)self createPlayerIfNeeded];

  [(LPVisualMediaView *)self removePlaceholderViews];
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(LPVisualMediaView *)self isPlaying] != a3)
  {
    [(LPStreamingVideoView *)self createPlayerIfNeeded];
    self->_desiredPlayingState = v3;
    *(float *)&double v5 = (float)v3;
    [(AVQueuePlayer *)self->_player setRate:v5];
    [(LPVisualMediaView *)self setWaitingForPlayback:v3];
    [(LPVisualMediaView *)self swapVideoPlaceholderForPlaybackIfNeeded];
  }
}

- (BOOL)releaseDecodingResourcesIfInactive
{
  v7[1] = *MEMORY[0x1E4F143B8];
  player = self->_player;
  if (player)
  {
    [(AVQueuePlayer *)player rate];
    if (v4 == 0.0 && !self->_desiredPlayingState)
    {
      double v5 = (id)LPLogChannelUI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        [(LPStreamingVideoView *)(uint64_t)v7 releaseDecodingResourcesIfInactive];
      }

      [(LPStreamingVideoView *)self destroyPlayer];
      LOBYTE(player) = 1;
    }
    else
    {
      LOBYTE(player) = 0;
    }
  }
  return (char)player;
}

- (BOOL)shouldAutoPlay
{
  if (+[LPSettings disableAutoPlay]) {
    return 0;
  }
  BOOL v3 = [(LPVisualMediaView *)self configuration];
  char v4 = [v3 disableAutoPlay];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(LPVisualMediaView *)self media];
  uint64_t v7 = [v6 data];
  if (v7)
  {
    id v8 = [(LPVisualMediaView *)self media];
    BOOL v9 = [v8 streamingURL];
    BOOL v5 = v9 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)usesSharedAudioSession
{
  return 1;
}

- (BOOL)shouldShowMuteButton
{
  int v2 = [(LPVisualMediaView *)self media];
  char v3 = [v2 hasAudio];

  return v3;
}

- (BOOL)isMuted
{
  return self->_desiredVolume == 0.0;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(LPStreamingVideoView *)self isMuted] != a3)
  {
    [(LPStreamingVideoView *)self setVolume:(double)!v3];
  }
}

- (double)volume
{
  [(AVQueuePlayer *)self->_player volume];
  return v2;
}

- (void)setVolume:(double)a3
{
  BOOL v5 = [(LPStreamingVideoView *)self isMuted];
  float v6 = a3;
  self->_desiredVolume = v6;
  -[AVQueuePlayer setVolume:](self->_player, "setVolume:");
  [(AVQueuePlayer *)self->_player setMuted:0];
  if (v5 != [(LPStreamingVideoView *)self isMuted])
  {
    BOOL v7 = [(LPStreamingVideoView *)self isMuted];
    [(LPVisualMediaView *)self didChangeMutedState:v7];
  }
}

- (void)layoutComponentView
{
  v5.receiver = self;
  v5.super_class = (Class)LPStreamingVideoView;
  [(LPVisualMediaView *)&v5 layoutComponentView];
  BOOL v3 = [(LPVisualMediaView *)self playbackView];
  char v4 = [v3 layer];
  [v4 bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
}

- (id)createFullScreenVideoViewController
{
  float v2 = [[LPFullScreenVideoController alloc] initWithPlayer:self->_player sourceView:self];

  return v2;
}

- (BOOL)usesCustomFullScreenImplementation
{
  return 0;
}

- (id)createVideoPlayerView
{
  v7[1] = *MEMORY[0x1E4F143B8];
  self->_hasCreatedVideoPlayerView = 1;
  [(LPStreamingVideoView *)self createPlayerIfNeeded];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setUserInteractionEnabled:0];
  if (self->_playerLayer)
  {
    v7[0] = self->_playerLayer;
    char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    objc_super v5 = [v3 layer];
    [v5 setSublayers:v4];
  }

  return v3;
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  aBlock = (void (**)(void))a3;
  if ([(AVPlayerLayer *)self->_playerLayer isReadyForDisplay])
  {
    aBlock[2]();
  }
  else
  {
    if (!self->_readyForDisplayCallback) {
      [(AVPlayerLayer *)self->_playerLayer addObserver:self forKeyPath:@"readyForDisplay" options:0 context:&readyForDisplayKVOContext];
    }
    char v4 = _Block_copy(aBlock);
    id readyForDisplayCallback = self->_readyForDisplayCallback;
    self->_id readyForDisplayCallback = v4;
  }
}

- (void)fullScreenVideoDidPresent
{
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  [(LPVisualMediaView *)&v3 fullScreenVideoDidPresent];
  [(AVQueuePlayer *)self->_player setPreventsDisplaySleepDuringVideoPlayback:1];
}

- (void)fullScreenVideoWillDismiss
{
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingVideoView;
  [(LPVisualMediaView *)&v3 fullScreenVideoWillDismiss];
  [(AVQueuePlayer *)self->_player setPreventsDisplaySleepDuringVideoPlayback:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyForDisplayCallback, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_looper, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (end times are identical)", v2, 8u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, int a3, double a4)
{
  OUTLINED_FUNCTION_2(a4, 1.5047e-36, a1, a2, a3);
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (end time delta=%f)", v4, 0x12u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, int a3, double a4)
{
  OUTLINED_FUNCTION_2(a4, 1.5047e-36, a1, a2, a3);
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> prepared video for looping (end time delta=%f)", v4, 0x12u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_4(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (non-numeric end time)", v2, 8u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_5(char a1, char a2, uint8_t *buf, int a4)
{
  *(_DWORD *)buf = 67109632;
  *((_DWORD *)buf + 1) = a4;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a1 & 1;
  *((_WORD *)buf + 7) = 1024;
  *((_DWORD *)buf + 4) = a2 & 1;
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (enabled: video=%d, audio=%d)", buf, 0x14u);
}

void __86__LPStreamingVideoView_createPlayerItemAdjustedForLoopingWithAsset_completionHandler___block_invoke_2_cold_6(uint64_t a1, int a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_0(a1, a2, 1.5048e-36);
  *(_WORD *)(v2 + 8) = 2048;
  *(void *)(v2 + 10) = v3;
  *(_WORD *)(v2 + 18) = 2048;
  *(void *)(v2 + 20) = v4;
  _os_log_debug_impl(&dword_1A35DC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d> preparing video for looping, bailing (count: video=%lu, audio=%lu)", v5, 0x1Cu);
}

void __37__LPStreamingVideoView_didFailToPlay__block_invoke_cold_1(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 648);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_debug_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEBUG, "LPStreamingVideoView<%d>: retrying playback after failing to play (desiredPlayingState=%d)", buf, 0xEu);
}

- (void)releaseDecodingResourcesIfInactive
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPStreamingVideoView<%d>: explicitly destroying inactive player", v4);
}

@end