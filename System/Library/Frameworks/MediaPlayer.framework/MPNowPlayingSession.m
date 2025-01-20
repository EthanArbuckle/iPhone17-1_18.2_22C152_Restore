@interface MPNowPlayingSession
+ (id)nowPlayingSessionForPlayerID:(id)a3;
+ (id)nowPlayingSessionForPlayerPath:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)netTimeForGrossTime:(SEL)a3;
- (AVAudioSession)audioSession;
- (BOOL)automaticallyPublishesNowPlayingInfo;
- (BOOL)canBecomeActive;
- (BOOL)hasInvalidAdTimeRange:(id)a3 totalDuration:(id)a4;
- (BOOL)isActive;
- (BOOL)isPictureInPictureEnabled;
- (MPNowPlayingInfoCenter)nowPlayingInfoCenter;
- (MPNowPlayingSession)initWithPlayerPath:(id)a3 routingContextID:(id)a4;
- (MPNowPlayingSession)initWithPlayers:(NSArray *)players;
- (MPRemoteCommandCenter)remoteCommandCenter;
- (MRPlayerPath)playerPath;
- (NSArray)currentAdTimeRanges;
- (NSArray)players;
- (NSDictionary)baseNowPlayingInfo;
- (NSMutableSet)playerSet;
- (NSSet)mxSessionIDs;
- (NSString)routingContextID;
- (OS_dispatch_queue)privateQueue;
- (double)currentAssetNetCreditsStartTime;
- (double)currentAssetNetDuration;
- (float)effectivePlaybackRateWithPlayer:(id)a3;
- (id)adTimeRangesEndObserverToken;
- (id)adTimeRangesStartObserverToken;
- (id)creditsTimeObserverToken;
- (id)delegate;
- (id)mediaExperienceIDs;
- (id)mxSessionIDKeyPath;
- (unsigned)audioSessionID;
- (void)_playerItemNowPlayingInfoDidChange:(id)a3;
- (void)activePlayerDidChangeNotification:(id)a3;
- (void)addPlayer:(AVPlayer *)player;
- (void)addPlayerItemObservers:(id)a3;
- (void)addPlayerObservers:(id)a3;
- (void)becomeActiveIfPossibleWithCompletion:(void *)completion;
- (void)dealloc;
- (void)endpointWithCompletion:(id)a3;
- (void)extractNowPlayingInfoFromPlayersAndUpdateAdRanges;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerItemDidPlayToEnd:(id)a3;
- (void)playerItemPlaybackStalled:(id)a3;
- (void)playerItemTimeJumped:(id)a3;
- (void)playerPictureInPictureEnabledDidChangeNotification:(id)a3;
- (void)playerRateDidChange:(id)a3;
- (void)removePlayer:(AVPlayer *)player;
- (void)removePlayerItemObservers:(id)a3;
- (void)removePlayerObservers:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAdTimeRangesEndObserverToken:(id)a3;
- (void)setAdTimeRangesStartObserverToken:(id)a3;
- (void)setAutomaticallyPublishesNowPlayingInfo:(BOOL)automaticallyPublishesNowPlayingInfo;
- (void)setBaseNowPlayingInfo:(id)a3;
- (void)setCanBecomeActive:(BOOL)a3;
- (void)setCreditsTimeObserverToken:(id)a3;
- (void)setCurrentAdTimeRanges:(id)a3;
- (void)setCurrentAssetNetCreditsStartTime:(double)a3;
- (void)setCurrentAssetNetDuration:(double)a3;
- (void)setDelegate:(id)delegate;
- (void)setNowPlayingInfoCenter:(id)a3;
- (void)setPictureInPictureEnabled:(BOOL)a3;
- (void)setPlayerSet:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)updateAudioSession:(id)a3;
- (void)updateMediaExperienceIDs;
- (void)updateNowPlayingInfo;
@end

@implementation MPNowPlayingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_mxSessionIDs, 0);
  objc_storeStrong(&self->_adTimeRangesEndObserverToken, 0);
  objc_storeStrong(&self->_adTimeRangesStartObserverToken, 0);
  objc_storeStrong(&self->_creditsTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_baseNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_currentAdTimeRanges, 0);
  objc_storeStrong((id *)&self->_playerSet, 0);
  objc_storeStrong((id *)&self->_remoteCommandCenter, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (BOOL)isPictureInPictureEnabled
{
  return self->_pictureInPictureEnabled;
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (void)setAdTimeRangesEndObserverToken:(id)a3
{
}

- (id)adTimeRangesEndObserverToken
{
  return self->_adTimeRangesEndObserverToken;
}

- (void)setAdTimeRangesStartObserverToken:(id)a3
{
}

- (id)adTimeRangesStartObserverToken
{
  return self->_adTimeRangesStartObserverToken;
}

- (void)setCreditsTimeObserverToken:(id)a3
{
}

- (id)creditsTimeObserverToken
{
  return self->_creditsTimeObserverToken;
}

- (void)setPrivateQueue:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setBaseNowPlayingInfo:(id)a3
{
}

- (NSDictionary)baseNowPlayingInfo
{
  return self->_baseNowPlayingInfo;
}

- (double)currentAssetNetCreditsStartTime
{
  return self->_currentAssetNetCreditsStartTime;
}

- (void)setCurrentAssetNetDuration:(double)a3
{
  self->_currentAssetNetDuration = a3;
}

- (double)currentAssetNetDuration
{
  return self->_currentAssetNetDuration;
}

- (NSArray)currentAdTimeRanges
{
  return self->_currentAdTimeRanges;
}

- (void)setPlayerSet:(id)a3
{
}

- (NSMutableSet)playerSet
{
  return self->_playerSet;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)canBecomeActive
{
  return self->_canBecomeActive;
}

- (MPRemoteCommandCenter)remoteCommandCenter
{
  return self->_remoteCommandCenter;
}

- (void)setNowPlayingInfoCenter:(id)a3
{
}

- (BOOL)automaticallyPublishesNowPlayingInfo
{
  return self->_automaticallyPublishesNowPlayingInfo;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)endpointWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MPNowPlayingSession.m", 801, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F76FB0]);
  v7 = [(MPNowPlayingSession *)self routingContextID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__MPNowPlayingSession_endpointWithCompletion___block_invoke;
  v10[3] = &unk_1E57F84D8;
  id v11 = v5;
  id v8 = v5;
  [v6 searchEndpointsForRoutingContextUID:v7 timeout:@"MPNowPlayingSession.endpointWithCompletion" reason:MEMORY[0x1E4F14428] queue:v10 completion:7.0];
}

uint64_t __46__MPNowPlayingSession_endpointWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)playerPictureInPictureEnabledDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    v2 = [*(id *)(a1 + 40) userInfo];
    v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F77878]];

    id v4 = *(id *)(*(void *)(a1 + 32) + 144);
    if ([v3 isEqual:v4])
    {
      id v5 = v4;
      MRMediaRemoteGetPictureInPictureStatusForPlayer();
    }
  }
}

uint64_t __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    uint64_t v3 = result;
    *(unsigned char *)(v2 + 27) = a2;
    uint64_t CanBecomeActivePlayer = MRMediaRemoteCanBecomeActivePlayer();
    id v5 = *(void **)(v3 + 32);
    return [v5 setCanBecomeActive:CanBecomeActivePlayer];
  }
  return result;
}

- (void)activePlayerDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MPNowPlayingSession_activePlayerDidChangeNotification___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__MPNowPlayingSession_activePlayerDidChangeNotification___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F77878]];

    objc_msgSend(*(id *)(a1 + 32), "setActive:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "isEqual:", v3));
    [*(id *)(a1 + 32) setCanBecomeActive:MRMediaRemoteCanBecomeActivePlayer()];
  }
}

- (void)playerItemDidPlayToEnd:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v5 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemDidPlayToEnd", (uint8_t *)&v6, 0x16u);
  }
  [(MPNowPlayingSession *)self updateNowPlayingInfo];
}

- (void)playerItemPlaybackStalled:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v5 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemPlaybackStalled", (uint8_t *)&v6, 0x16u);
  }
  [(MPNowPlayingSession *)self updateNowPlayingInfo];
}

- (void)playerItemTimeJumped:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v5 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemTimeJumped", (uint8_t *)&v6, 0x16u);
  }
  [(MPNowPlayingSession *)self updateNowPlayingInfo];
}

- (void)_playerItemNowPlayingInfoDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v5 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> _playerItemNowPlayingInfoDidChange", (uint8_t *)&v6, 0x16u);
  }
  [(MPNowPlayingSession *)self extractNowPlayingInfoFromPlayersAndUpdateAdRanges];
  [(MPNowPlayingSession *)self updateNowPlayingInfo];
}

- (void)playerRateDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v5 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerRateDidChange", (uint8_t *)&v6, 0x16u);
  }
  [(MPNowPlayingSession *)self updateNowPlayingInfo];
}

- (void)removePlayerItemObservers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F16050] object:v5];
  [v7 removeObserver:self name:*MEMORY[0x1E4F16048] object:v5];
  [v7 removeObserver:self name:*MEMORY[0x1E4F16020] object:v5];
  int v6 = NSStringFromSelector(sel_duration);
  [v5 removeObserver:self forKeyPath:v6 context:MPNowPlayingPublisherPlayerItemDurationObserverContext];
}

- (void)addPlayerItemObservers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  [v7 addObserver:self selector:sel_playerItemTimeJumped_ name:*MEMORY[0x1E4F16050] object:v5];
  [v7 addObserver:self selector:sel_playerItemPlaybackStalled_ name:*MEMORY[0x1E4F16048] object:v5];
  [v7 addObserver:self selector:sel_playerItemDidPlayToEnd_ name:*MEMORY[0x1E4F16020] object:v5];
  int v6 = NSStringFromSelector(sel_duration);
  [v5 addObserver:self forKeyPath:v6 options:1 context:MPNowPlayingPublisherPlayerItemDurationObserverContext];
}

- (void)removePlayerObservers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v8 = [v4 defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F16068] object:v5];
  int v6 = NSStringFromSelector(sel_currentItem);
  [v5 removeObserver:self forKeyPath:v6 context:MPNowPlayingPublisherPlayerItemObserverContext];

  id v7 = NSStringFromSelector(sel_timeControlStatus);
  [v5 removeObserver:self forKeyPath:v7 context:MPNowPlayingPublisherPlayerTimeControlObserverContext];
}

- (void)addPlayerObservers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v8 = [v4 defaultCenter];
  [v8 addObserver:self selector:sel_playerRateDidChange_ name:*MEMORY[0x1E4F16068] object:v5];
  int v6 = NSStringFromSelector(sel_currentItem);
  [v5 addObserver:self forKeyPath:v6 options:3 context:MPNowPlayingPublisherPlayerItemObserverContext];

  id v7 = NSStringFromSelector(sel_timeControlStatus);
  [v5 addObserver:self forKeyPath:v7 options:0 context:MPNowPlayingPublisherPlayerTimeControlObserverContext];
}

- (void)updateNowPlayingInfo
{
  id v3 = [(MPNowPlayingSession *)self players];
  id v4 = [v3 firstObject];

  id v5 = [v4 currentItem];
  if (!v5)
  {
    [(MPNowPlayingInfoCenter *)self->_nowPlayingInfoCenter setNowPlayingInfo:0];
    goto LABEL_15;
  }
  int v6 = [(MPNowPlayingSession *)self baseNowPlayingInfo];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = NSNumber;
  [(MPNowPlayingSession *)self effectivePlaybackRateWithPlayer:v4];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  [v7 setObject:v9 forKeyedSubscript:@"MPNowPlayingInfoPropertyPlaybackRate"];

  long long v23 = 0uLL;
  uint64_t v24 = 0;
  if (!v4 || ([v4 currentTime], (~HIDWORD(v23) & 0x11) != 0))
  {
    long long v20 = v23;
    uint64_t v21 = v24;
    [(MPNowPlayingSession *)self netTimeForGrossTime:&v20];
    double Seconds = CMTimeGetSeconds(&time);
    [(MPNowPlayingSession *)self currentAssetNetDuration];
    double v14 = v13;
    v15 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v15 forKeyedSubscript:@"playbackDuration"];

    v16 = [NSNumber numberWithDouble:Seconds];
    [v7 setObject:v16 forKeyedSubscript:@"MPNowPlayingInfoPropertyElapsedPlaybackTime"];

    [(MPNowPlayingSession *)self currentAssetNetCreditsStartTime];
    if (v17 <= 0.0) {
      double v18 = v14;
    }
    else {
      double v18 = v17;
    }
    double v19 = 0.0;
    if (v18 > 0.0) {
      double v19 = Seconds / v18 * 100.0;
    }
    uint64_t v10 = [NSNumber numberWithDouble:round(v19) / 100.0];
    id v11 = @"MPNowPlayingInfoPropertyPlaybackProgress";
    goto LABEL_12;
  }
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"MPNowPlayingInfoPropertyIsLiveStream"];
  uint64_t v10 = [v5 currentDate];
  if (v10)
  {
    id v11 = @"MPNowPlayingInfoPropertyCurrentPlaybackDate";
LABEL_12:
    [v7 setObject:v10 forKeyedSubscript:v11];
  }

  [(MPNowPlayingInfoCenter *)self->_nowPlayingInfoCenter setNowPlayingInfo:v7];
LABEL_15:
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)netTimeForGrossTime:(SEL)a3
{
  if ((a4->var2 & 0x11) == 1)
  {
    int v6 = self;
    id v7 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self currentAdTimeRanges];
    if (v7)
    {
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x3810000000;
      double v19 = &unk_1956C748F;
      long long v20 = *MEMORY[0x1E4F1FA48];
      uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      id v8 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)v6 currentAdTimeRanges];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __43__MPNowPlayingSession_netTimeForGrossTime___block_invoke;
      v13[3] = &unk_1E57F2558;
      long long v14 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      v13[4] = &v16;
      [v8 enumerateObjectsUsingBlock:v13];

      CMTime lhs = (CMTime)*a4;
      CMTime v11 = *(CMTime *)(v17 + 4);
      CMTimeSubtract((CMTime *)retstr, &lhs, &v11);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
      retstr->int64_t var3 = *(void *)(v10 + 16);
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->int64_t var3 = *(void *)(v9 + 16);
  }
  return self;
}

void __43__MPNowPlayingSession_netTimeForGrossTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (v6) {
    [v6 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  id v8 = (_OWORD *)(a1 + 40);
  CMTime time = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &time))
  {
    memset(&time, 0, sizeof(time));
    if (v7)
    {
      [v7 timeRange];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    *(_OWORD *)&rhs.value = v20;
    rhs.epoch = v21;
    *(_OWORD *)&lhs.value = *v8;
    lhs.epoch = *(void *)(a1 + 56);
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
    CMTime v17 = time;
    CMTimeAdd(&v18, &lhs, &v17);
    *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v18;
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (v7)
  {
    [v7 timeRange];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  *(_OWORD *)&time1.value = v13;
  time1.epoch = v14;
  *(_OWORD *)&time.value = *v8;
  time.epoch = *(void *)(a1 + 56);
  if ((CMTimeCompare(&time1, &time) & 0x80000000) == 0) {
    goto LABEL_13;
  }
  uint64_t v9 = (CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  CMTime v11 = *(CMTime *)&v10[1];
  CMTime time = *v9;
  CMTimeAdd(&v12, &time, &v11);
  *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v12;
LABEL_14:
}

- (float)effectivePlaybackRateWithPlayer:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 timeControlStatus] == 2)
  {
    memset(&v28, 0, sizeof(v28));
    if (v4) {
      [v4 currentTime];
    }
    id v5 = [(MPNowPlayingSession *)self currentAdTimeRanges];
    if ([v5 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        long long v21 = *MEMORY[0x1E4F1FA48];
        CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            CMTime v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            memset(&buf, 0, sizeof(buf));
            if (v12) {
              [v12 timeRange];
            }
            *(_OWORD *)&time1.start.value = v21;
            time1.start.epoch = v10;
            CMTime time2 = v28;
            if (CMTimeCompare(&time1.start, &time2) >= 1)
            {
              *(_OWORD *)&time1.start.value = v21;
              time1.start.epoch = v10;
              CMTime time2 = buf.start;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
              {
                *(_OWORD *)&time1.start.value = *(_OWORD *)&buf.start.value;
                time1.start.epoch = buf.start.epoch;
                CMTime time2 = v28;
                CMTimeAdd(&start, &time1.start, &time2);
                CMTime time2 = buf.duration;
                CMTimeRangeMake(&time1, &start, &time2);
                CMTimeRange buf = time1;
              }
            }
            CMTimeRange time1 = buf;
            CMTime time2 = v28;
            if (CMTimeRangeContainsTime(&time1, &time2))
            {
              CMTime v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                CMTime v18 = objc_opt_class();
                LODWORD(time1.start.value) = 138412546;
                *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v18;
                LOWORD(time1.start.flags) = 2048;
                *(void *)((char *)&time1.start.flags + 2) = self;
                id v19 = v18;
                _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "<%@: %p> effective playback rate 0 due to ad", (uint8_t *)&time1, 0x16u);
              }
              float v14 = 0.0;
              goto LABEL_26;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
    objc_msgSend(v4, "rate", v21);
    float v14 = v13;
LABEL_26:
  }
  else
  {
    long long v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.start.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = objc_opt_class();
      LOWORD(buf.start.flags) = 2048;
      *(void *)((char *)&buf.start.flags + 2) = self;
      id v16 = *(id *)((char *)&buf.start.value + 4);
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEBUG, "<%@: %p> effective playback rate 0 due to non-playing time control", (uint8_t *)&buf, 0x16u);
    }
    float v14 = 0.0;
  }

  return v14;
}

- (void)setCurrentAdTimeRanges:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  objc_storeStrong((id *)&self->_currentAdTimeRanges, a3);
  id v5 = [(MPNowPlayingSession *)self players];
  long long v22 = [v5 firstObject];

  objc_initWeak(&location, self);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = [(MPNowPlayingSession *)self currentAdTimeRanges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        CMTimeEpoch v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        CMTime v11 = (void *)MEMORY[0x1E4F29238];
        if (v10)
        {
          [*(id *)(*((void *)&v42 + 1) + 8 * i) timeRange];
        }
        else
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v37 = 0u;
        }
        long long v40 = v37;
        uint64_t v41 = v38;
        CMTime v12 = [v11 valueWithCMTime:&v40];
        [v24 addObject:v12];

        float v13 = (void *)MEMORY[0x1E4F29238];
        if (v10)
        {
          [v10 timeRange];
          *(_OWORD *)&lhs.value = v32;
          lhs.epoch = v33;
          [v10 timeRange];
        }
        else
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v32 = 0u;
          memset(&lhs, 0, sizeof(lhs));
          long long v29 = 0u;
          memset(v30, 0, sizeof(v30));
        }
        CMTime rhs = *(CMTime *)((char *)v30 + 8);
        CMTimeAdd(&v36, &lhs, &rhs);
        float v14 = [v13 valueWithCMTime:&v36];
        [v23 addObject:v14];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v24 copy];
  id v16 = [(MPNowPlayingSession *)self privateQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke;
  v27[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v28, &location);
  CMTime v17 = [v22 addBoundaryTimeObserverForTimes:v15 queue:v16 usingBlock:v27];

  [(MPNowPlayingSession *)self setAdTimeRangesStartObserverToken:v17];
  CMTime v18 = (void *)[v23 copy];
  id v19 = [(MPNowPlayingSession *)self privateQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke_74;
  v25[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v26, &location);
  long long v20 = [v22 addBoundaryTimeObserverForTimes:v18 queue:v19 usingBlock:v25];

  [(MPNowPlayingSession *)self setAdTimeRangesEndObserverToken:v20];
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v3 = v8;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter ad break start boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained updateNowPlayingInfo];
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v6 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit ad break start boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke_74(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v3 = v8;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter ad break end boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained updateNowPlayingInfo];
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v6 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit ad break end boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)setCurrentAssetNetCreditsStartTime:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  self->_currentAssetNetCreditsStartTime = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(MPNowPlayingSession *)self currentAdTimeRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    double v8 = a3;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        memset(v24, 0, sizeof(v24));
        if (v10) {
          [v10 timeRange];
        }
        CMTime time = v24[0];
        if (CMTimeGetSeconds(&time) < a3)
        {
          CMTime time = v24[1];
          double v8 = v8 + CMTimeGetSeconds(&time);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = a3;
  }

  uint64_t v11 = [(MPNowPlayingSession *)self players];
  CMTime v12 = [v11 firstObject];

  memset(v24, 0, 24);
  CMTimeMakeWithSeconds(v24, v8, 1000000000);
  objc_initWeak(&location, self);
  CMTime time = v24[0];
  float v13 = [MEMORY[0x1E4F29238] valueWithCMTime:&time];
  long long v29 = v13;
  float v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  long long v15 = [(MPNowPlayingSession *)self privateQueue];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __58__MPNowPlayingSession_setCurrentAssetNetCreditsStartTime___block_invoke;
  long long v20 = &unk_1E57F6EF0;
  objc_copyWeak(&v21, &location);
  id v16 = [v12 addBoundaryTimeObserverForTimes:v14 queue:v15 usingBlock:&v17];

  -[MPNowPlayingSession setCreditsTimeObserverToken:](self, "setCreditsTimeObserverToken:", v16, v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __58__MPNowPlayingSession_setCurrentAssetNetCreditsStartTime___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v3 = v8;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter credits boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained updateNowPlayingInfo];
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2048;
      id v10 = WeakRetained;
      id v6 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit credits boundary time observer block", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)hasInvalidAdTimeRange:(id)a3 totalDuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3810000000;
  id v23 = &unk_1956C748F;
  long long v24 = *MEMORY[0x1E4F1FA48];
  uint64_t v25 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__MPNowPlayingSession_hasInvalidAdTimeRange_totalDuration___block_invoke;
  v15[3] = &unk_1E57F2530;
  uint64_t v18 = &v26;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v17 = v8;
  id v19 = &v20;
  [v8 enumerateObjectsUsingBlock:v15];
  if (v7)
  {
    CMTime v14 = *(CMTime *)(v21 + 4);
    double Seconds = CMTimeGetSeconds(&v14);
    [v7 floatValue];
    uint64_t v11 = v27;
    if (Seconds >= v10) {
      *((unsigned char *)v27 + 24) = 1;
    }
  }
  else
  {
    uint64_t v11 = v27;
  }
  char v12 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __59__MPNowPlayingSession_hasInvalidAdTimeRange_totalDuration___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (v7)
  {
    [v7 timeRange];
    if (a3) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    if (a3) {
      goto LABEL_6;
    }
  }
  *(_OWORD *)&time1.start.value = *MEMORY[0x1E4F1FA48];
  time1.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&time2.start.value = v30;
  time2.start.epoch = v31;
  if (CMTimeCompare(&time1.start, &time2.start) >= 1)
  {
LABEL_22:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_25;
  }
LABEL_6:
  memset(&v29, 0, sizeof(v29));
  if (v8)
  {
    [v8 timeRange];
    *(_OWORD *)&lhs.value = v25;
    lhs.epoch = v26;
    [v8 timeRange];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    memset(&lhs, 0, sizeof(lhs));
    long long v22 = 0u;
    memset(v23, 0, sizeof(v23));
  }
  CMTime rhs = *(CMTime *)((char *)v23 + 8);
  CMTimeAdd(&v29, &lhs, &rhs);
  memset(&v21, 0, sizeof(v21));
  int v9 = [*(id *)(a1 + 32) intValue];
  CMTimeMake(&v21, v9, v29.timescale);
  if (*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 40) count] - 1 == a3)
    {
      time1.CMTime start = v29;
      time2.CMTime start = v21;
      if (CMTimeCompare(&time1.start, &time2.start) >= 1) {
        goto LABEL_22;
      }
    }
  }
  if ([*(id *)(a1 + 40) count] - 1 > a3)
  {
    memset(&time1, 0, sizeof(time1));
    float v10 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
    uint64_t v11 = v10;
    if (v10) {
      [v10 timeRange];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }

    memset(&time2, 0, sizeof(time2));
    if (v8) {
      [v8 timeRange];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRange otherRange = time1;
    CMTimeRangeGetIntersection(&time2, &range, &otherRange);
    *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E4F1FA48];
    otherRange.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    CMTime duration = time2.duration;
    if (CMTimeCompare(&otherRange.start, &duration) < 0) {
      goto LABEL_22;
    }
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8) + 32;
  if (v8) {
    [v8 timeRange];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  CMTime v14 = *(CMTime *)&v13[1];
  *(_OWORD *)&time1.start.value = *(_OWORD *)v12;
  time1.start.epoch = *(void *)(v12 + 16);
  CMTimeAdd(&v15, &time1.start, &v14);
  *(CMTime *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v15;
LABEL_25:
}

- (void)extractNowPlayingInfoFromPlayersAndUpdateAdRanges
{
  v61[3] = *MEMORY[0x1E4F143B8];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v61[0] = @"MPNowPlayingInfoPropertyPlaybackRate";
  v61[1] = @"MPNowPlayingInfoPropertyElapsedPlaybackTime";
  v61[2] = @"playbackDuration";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  long long v43 = self;
  [(MPNowPlayingSession *)self players];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  uint64_t v41 = v3;
  long long v42 = (void *)v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        float v10 = [v9 currentItem];
        uint64_t v11 = v10;
        if (v10)
        {
          uint64_t v12 = [v10 nowPlayingInfo];
          float v13 = v12;
          if (v12)
          {
            os_log_t v14 = [v12 mutableCopy];
            [v14 removeObjectsForKeys:v4];
            [v3 addEntriesFromDictionary:v14];
          }
          else
          {
            os_log_t v14 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = objc_opt_class();
              *(_DWORD *)CMTimeRange buf = 138412802;
              v55 = v16;
              __int16 v56 = 2048;
              v57 = v43;
              __int16 v58 = 2112;
              v59 = v11;
              id v17 = v16;
              _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "<%@: %p> player item has no nowPlayingInfo dictionary: %@", buf, 0x20u);

              id v3 = v41;
            }
          }
        }
        else
        {
          float v13 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          CMTime v15 = objc_opt_class();
          *(_DWORD *)CMTimeRange buf = 138412802;
          v55 = v15;
          __int16 v56 = 2048;
          v57 = v43;
          uint64_t v4 = (uint64_t)v42;
          __int16 v58 = 2112;
          v59 = v9;
          os_log_t v14 = v15;
          _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> player has no player item: %@", buf, 0x20u);
        }

LABEL_14:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v6);
  }
  uint64_t v18 = [v3 objectForKey:@"MPNowPlayingInfoPropertyAdTimeRanges"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v40 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v21);
    }

    long long v25 = [v40 allObjects];
    long long v26 = [v25 sortedArrayUsingComparator:&__block_literal_global_68_24228];

    long long v27 = [v41 objectForKey:@"playbackDuration"];
    if ([(MPNowPlayingSession *)v43 hasInvalidAdTimeRange:v26 totalDuration:v27])
    {

      uint64_t v28 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter seekForwardCommand];
      [v28 setForceDisabled:1];

      CMTime v29 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter specialSeekForwardCommand];
      [v29 setForceDisabled:1];

      long long v30 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter seekForwardCommand];
      [v30 setDisabledReason:3];

      long long v31 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter specialSeekForwardCommand];
      [v31 setDisabledReason:3];
      long long v26 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      long long v32 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter seekForwardCommand];
      [v32 setForceDisabled:0];

      long long v31 = [(MPRemoteCommandCenter *)v43->_remoteCommandCenter specialSeekForwardCommand];
      [v31 setForceDisabled:0];
    }

    long long v33 = [(MPNowPlayingSession *)v43 currentAdTimeRanges];
    char v34 = [v33 isEqual:v26];

    if ((v34 & 1) == 0) {
      [(MPNowPlayingSession *)v43 setCurrentAdTimeRanges:v26];
    }

    id v3 = v41;
  }
  v35 = [v3 objectForKey:@"MPNowPlayingInfoPropertyCreditsStartTime"];
  double v36 = 0.0;
  if (v35)
  {
    objc_opt_class();
    long long v37 = v40;
    if (objc_opt_isKindOfClass())
    {
      [v35 doubleValue];
      double v36 = v38;
    }
  }
  else
  {
    long long v37 = v40;
  }
  [(MPNowPlayingSession *)v43 currentAssetNetCreditsStartTime];
  if (v39 != v36) {
    [(MPNowPlayingSession *)v43 setCurrentAssetNetCreditsStartTime:v36];
  }
  [(MPNowPlayingSession *)v43 setBaseNowPlayingInfo:v3];
}

uint64_t __72__MPNowPlayingSession_extractNowPlayingInfoFromPlayersAndUpdateAdRanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.epoch = v11;
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CMTime time2 = v8;
  uint64_t v6 = CMTimeCompare(&time1, &time2);

  return v6;
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
  if (!self->_invalidated && self->_pictureInPictureEnabled != a3)
  {
    self->_pictureInPictureEnabled = a3;
    MRMediaRemoteSetPictureInPictureStatusForPlayer();
  }
}

uint64_t __50__MPNowPlayingSession_setPictureInPictureEnabled___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    uint64_t CanBecomeActivePlayer = MRMediaRemoteCanBecomeActivePlayer();
    id v3 = *(void **)(v1 + 32);
    return [v3 setCanBecomeActive:CanBecomeActivePlayer];
  }
  return result;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained nowPlayingSessionDidChangeActive:self];
    }
  }
}

- (void)becomeActiveIfPossibleWithCompletion:(void *)completion
{
  id v4 = completion;
  nowPlayingInfoCenter = self->_nowPlayingInfoCenter;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke;
  v7[3] = &unk_1E57F8500;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPNowPlayingInfoCenter *)nowPlayingInfoCenter _becomeActiveIfPossibleWithCompletion:v7];
}

void __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke_2;
  block[3] = &unk_1E57F8408;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActive:*(void *)(a1 + 40) == 0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setCanBecomeActive:(BOOL)a3
{
  if (self->_canBecomeActive != a3)
  {
    self->_canBecomeActive = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained nowPlayingSessionDidChangeCanBecomeActive:self];
    }
  }
}

- (AVAudioSession)audioSession
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_audioSession;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)audioSessionID
{
  uint64_t v2 = [(MPNowPlayingSession *)self audioSession];
  unsigned int v3 = [v2 opaqueSessionID];

  return v3;
}

- (void)updateAudioSession:(id)a3
{
  id v7 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_audioSession, a3);
  objc_sync_exit(v5);

  if (!v5->_invalidated)
  {
    [v7 opaqueSessionID];
    MRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer();
  }
  id v6 = [(MPNowPlayingSession *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 nowPlayingSession:v5 audioSessionDidChange:v7];
  }
}

- (id)mxSessionIDKeyPath
{
  return NSStringFromSelector(sel_mxSessionID);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if ([(NSMutableSet *)self->_playerSet containsObject:a4])
  {
    long long v12 = [(MPNowPlayingSession *)self mxSessionIDKeyPath];
    int v13 = [v10 isEqualToString:v12];

    if (v13)
    {
      [(MPNowPlayingSession *)self updateMediaExperienceIDs];
      goto LABEL_20;
    }
  }
  if ((void *)MPNowPlayingPublisherPlayerItemObserverContext == a6)
  {
    os_log_t v14 = [v11 objectForKey:*MEMORY[0x1E4F284E0]];
    CMTime v15 = [v11 objectForKey:*MEMORY[0x1E4F284C8]];
    if (v14)
    {
      id v16 = [MEMORY[0x1E4F1CA98] null];
      char v17 = [v14 isEqual:v16];

      if ((v17 & 1) == 0) {
        [(MPNowPlayingSession *)self removePlayerItemObservers:v14];
      }
    }
    if (v15)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      char v19 = [v15 isEqual:v18];

      if ((v19 & 1) == 0)
      {
        [(MPNowPlayingSession *)self addPlayerItemObservers:v15];
        [(MPNowPlayingSession *)self extractNowPlayingInfoFromPlayersAndUpdateAdRanges];
      }
    }
    [(MPNowPlayingSession *)self updateNowPlayingInfo];

    goto LABEL_19;
  }
  if ((void *)MPNowPlayingPublisherPlayerItemDurationObserverContext == a6)
  {
    uint64_t v20 = [v11 objectForKey:*MEMORY[0x1E4F284C8]];
    os_log_t v14 = v20;
    memset(&v21[56], 0, 24);
    if (!v20 || ([v20 CMTimeValue], (~*(_DWORD *)&v21[68] & 0x11) != 0))
    {
      memset(&v21[32], 0, 24);
      *(CMTime *)uint64_t v21 = *(CMTime *)&v21[56];
      [(MPNowPlayingSession *)self netTimeForGrossTime:v21];
      *(CMTime *)uint64_t v21 = *(CMTime *)&v21[32];
      [(MPNowPlayingSession *)self setCurrentAssetNetDuration:CMTimeGetSeconds((CMTime *)v21)];
    }
    [(MPNowPlayingSession *)self updateNowPlayingInfo];
LABEL_19:

    goto LABEL_20;
  }
  if ((void *)MPNowPlayingPublisherPlayerTimeControlObserverContext == a6) {
    [(MPNowPlayingSession *)self updateNowPlayingInfo];
  }
LABEL_20:
}

- (void)updateMediaExperienceIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableSet count](self->_playerSet, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_playerSet;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 mxSessionID];

        if (v10)
        {
          id v11 = [v9 mxSessionID];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v12 = (NSSet *)[v3 copy];
  mxSessionIDs = self->_mxSessionIDs;
  self->_mxSessionIDs = v12;

  if (!self->_invalidated) {
    MRMediaRemoteSetMXSessionIDForPlayer();
  }
}

void __47__MPNowPlayingSession_updateMediaExperienceIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 128);
      uint64_t v7 = *(void *)(v5 + 144);
      int v8 = 138543874;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to update MXSessionIDs: %{public}@ for player path: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)removePlayer:(AVPlayer *)player
{
  playerSet = self->_playerSet;
  uint64_t v5 = player;
  [(NSMutableSet *)playerSet removeObject:v5];
  uint64_t v6 = [(MPNowPlayingSession *)self mxSessionIDKeyPath];
  [(AVPlayer *)v5 removeObserver:self forKeyPath:v6];

  [(MPNowPlayingSession *)self updateMediaExperienceIDs];
  [(MPNowPlayingSession *)self removePlayerObservers:v5];
  id v8 = [(AVPlayer *)v5 currentItem];

  uint64_t v7 = v8;
  if (v8)
  {
    [(MPNowPlayingSession *)self removePlayerItemObservers:v8];
    uint64_t v7 = v8;
  }
}

- (void)addPlayer:(AVPlayer *)player
{
  id v8 = player;
  [(NSMutableSet *)self->_playerSet addObject:v8];
  id v4 = [(MPNowPlayingSession *)self mxSessionIDKeyPath];
  [(AVPlayer *)v8 addObserver:self forKeyPath:v4 options:1 context:0];

  [(MPNowPlayingSession *)self updateMediaExperienceIDs];
  BOOL v5 = [(MPNowPlayingSession *)self automaticallyPublishesNowPlayingInfo];
  uint64_t v6 = v8;
  if (v5)
  {
    [(MPNowPlayingSession *)self addPlayerObservers:v8];
    uint64_t v7 = [(AVPlayer *)v8 currentItem];
    if (v7) {
      [(MPNowPlayingSession *)self addPlayerItemObservers:v7];
    }

    uint64_t v6 = v8;
  }
}

- (id)mediaExperienceIDs
{
  uint64_t v2 = (void *)[(NSSet *)self->_mxSessionIDs copy];

  return v2;
}

- (NSArray)players
{
  return (NSArray *)[(NSMutableSet *)self->_playerSet allObjects];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_invalidated = 1;
  unsigned int v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    playerPath = self->_playerPath;
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = playerPath;
    id v6 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p - %@> invalidated", (uint8_t *)&v8, 0x20u);
  }
  [(MPNowPlayingInfoCenter *)self->_nowPlayingInfoCenter invalidate];
  [(MPRemoteCommandCenter *)self->_remoteCommandCenter invalidate];
  uint64_t v7 = objc_opt_class();
  objc_sync_enter(v7);
  [(id)__nowPlayingSessionMap removeObjectForKey:self->_playerPath];
  objc_sync_exit(v7);

  MRMediaRemoteRemovePlayer();
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  MRMediaRemoteSetWantsNowPlayingNotifications();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = self->_playerSet;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(MPNowPlayingSession *)self mxSessionIDKeyPath];
        [v8 removeObserver:self forKeyPath:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)MPNowPlayingSession;
  [(MPNowPlayingSession *)&v10 dealloc];
}

- (MPNowPlayingInfoCenter)nowPlayingInfoCenter
{
  if ([(MPNowPlayingSession *)self automaticallyPublishesNowPlayingInfo])
  {
    unsigned int v3 = os_log_create("MediaPlayer", "RuntimeIssues");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_fault_impl(&dword_1952E8000, v3, OS_LOG_TYPE_FAULT, "WARNING: using MPNowPlayingInfoCenter is unsupported when using automatic publishing.", v6, 2u);
    }
  }
  nowPlayingInfoCenter = self->_nowPlayingInfoCenter;

  return nowPlayingInfoCenter;
}

- (void)setAutomaticallyPublishesNowPlayingInfo:(BOOL)automaticallyPublishesNowPlayingInfo
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_automaticallyPublishesNowPlayingInfo != automaticallyPublishesNowPlayingInfo)
  {
    BOOL v3 = automaticallyPublishesNowPlayingInfo;
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)CMTimeRange buf = 138413314;
      uint64_t v24 = v6;
      __int16 v25 = 2048;
      long long v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = playerPath;
      __int16 v29 = 2080;
      long long v30 = "-[MPNowPlayingSession setAutomaticallyPublishesNowPlayingInfo:]";
      __int16 v31 = 1024;
      BOOL v32 = v3;
      id v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "<%@: %p - %@> %s %d", buf, 0x30u);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(MPNowPlayingSession *)self playerSet];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (self->_automaticallyPublishesNowPlayingInfo) {
            [(MPNowPlayingSession *)self removePlayerObservers:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          }
          else {
            [(MPNowPlayingSession *)self addPlayerObservers:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          }
          long long v15 = [v14 currentItem];
          if (v15) {
            [(MPNowPlayingSession *)self addPlayerItemObservers:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    self->_automaticallyPublishesNowPlayingInfo = v3;
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v17 = v16;
    if (v3) {
      [v16 addObserver:self selector:sel__playerItemNowPlayingInfoDidChange_ name:@"MPPlayerItemNowPlayingInfoDidChangeNotification" object:0];
    }
    else {
      [v16 removeObserver:self name:@"MPPlayerItemNowPlayingInfoDidChangeNotification" object:0];
    }

    [(MPNowPlayingSession *)self extractNowPlayingInfoFromPlayersAndUpdateAdRanges];
    [(MPNowPlayingSession *)self updateNowPlayingInfo];
  }
}

- (MPNowPlayingSession)initWithPlayers:(NSArray *)players
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = players;
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F770A8]) initWithIdentifier:v7 displayName:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F770B0]);
  uint64_t v10 = [MEMORY[0x1E4F77098] localOrigin];
  uint64_t v11 = [MEMORY[0x1E4F76FE8] localClient];
  uint64_t v12 = (void *)[v9 initWithOrigin:v10 client:v11 player:v8];

  long long v13 = [(MPNowPlayingSession *)self initWithPlayerPath:v12 routingContextID:0];
  if (v13)
  {
    __int16 v25 = v8;
    if (!v5 || ![(NSArray *)v5 count])
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v13 file:@"MPNowPlayingSession.m" lineNumber:156 description:@"MPNowPlayingSession must be initialized with one or more AVPlayer instances."];
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
    playerSet = v13->_playerSet;
    v13->_playerSet = (NSMutableSet *)v14;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v16 = v13->_playerSet;
    uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
          uint64_t v22 = [(MPNowPlayingSession *)v13 mxSessionIDKeyPath];
          [v21 addObserver:v13 forKeyPath:v22 options:1 context:0];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    [(MPNowPlayingSession *)v13 updateMediaExperienceIDs];
    id v8 = v25;
  }

  return v13;
}

- (MPNowPlayingSession)initWithPlayerPath:(id)a3 routingContextID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MPNowPlayingSession;
  id v9 = [(MPNowPlayingSession *)&v30 init];
  uint64_t v10 = v9;
  if (v9)
  {
    currentAdTimeRanges = v9->_currentAdTimeRanges;
    v9->_currentAdTimeRanges = (NSArray *)MEMORY[0x1E4F1CBF0];

    dispatch_queue_t v12 = dispatch_queue_create(0, 0);
    privateQueue = v10->_privateQueue;
    v10->_privateQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F770B0] localResolvedPlayerPathFromPlayerPath:v7];
    playerPath = v10->_playerPath;
    v10->_playerPath = (MRPlayerPath *)v14;

    objc_storeStrong((id *)&v10->_routingContextID, a4);
    uint64_t v16 = objc_opt_class();
    objc_sync_enter(v16);
    if (initWithPlayerPath_routingContextID__onceToken != -1) {
      dispatch_once(&initWithPlayerPath_routingContextID__onceToken, &__block_literal_global_24258);
    }
    uint64_t v17 = [(id)objc_opt_class() nowPlayingSessionForPlayerPath:v10->_playerPath];

    if (v17)
    {
      long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, v10, @"MPNowPlayingSession.m", 126, @"Cannot have two MPNowPlayingSession for the same playerPath: %@", v7 object file lineNumber description];
    }
    [(id)__nowPlayingSessionMap setObject:v10 forKey:v7];
    objc_sync_exit(v16);

    uint64_t v18 = +[MPNowPlayingInfoCenter infoCenterForPlayerPath:v7];
    nowPlayingInfoCenter = v10->_nowPlayingInfoCenter;
    v10->_nowPlayingInfoCenter = (MPNowPlayingInfoCenter *)v18;

    if (!v10->_nowPlayingInfoCenter)
    {
      uint64_t v20 = [[MPNowPlayingInfoCenter alloc] initWithPlayerPath:v10->_playerPath];
      long long v21 = v10->_nowPlayingInfoCenter;
      v10->_nowPlayingInfoCenter = v20;
    }
    uint64_t v22 = +[MPRemoteCommandCenter commandCenterForPlayerPath:v10->_playerPath];
    remoteCommandCenter = v10->_remoteCommandCenter;
    v10->_remoteCommandCenter = (MPRemoteCommandCenter *)v22;

    if (!v10->_remoteCommandCenter)
    {
      uint64_t v24 = [[MPRemoteCommandCenter alloc] initWithPlayerPath:v7];
      __int16 v25 = v10->_remoteCommandCenter;
      v10->_remoteCommandCenter = v24;
    }
    v10->_canBecomeActive = MRMediaRemoteCanBecomeActivePlayer();
    MRMediaRemoteSetWantsNowPlayingNotifications();
    long long v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v10 selector:sel_activePlayerDidChangeNotification_ name:*MEMORY[0x1E4F77218] object:0];

    long long v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v10 selector:sel_playerPictureInPictureEnabledDidChangeNotification_ name:*MEMORY[0x1E4F77838] object:0];
  }
  return v10;
}

void __59__MPNowPlayingSession_initWithPlayerPath_routingContextID___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = (void *)__nowPlayingSessionMap;
  __nowPlayingSessionMap = v0;
}

+ (id)nowPlayingSessionForPlayerPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  uint64_t v5 = [(id)__nowPlayingSessionMap objectForKey:v3];
  objc_sync_exit(v4);

  return v5;
}

+ (id)nowPlayingSessionForPlayerID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F770A8]) initWithIdentifier:v3 displayName:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F770A8] defaultPlayer];
  }
  uint64_t v5 = (void *)v4;
  id v6 = objc_alloc(MEMORY[0x1E4F770B0]);
  id v7 = [MEMORY[0x1E4F77098] localOrigin];
  id v8 = [MEMORY[0x1E4F76FE8] localClient];
  id v9 = (void *)[v6 initWithOrigin:v7 client:v8 player:v5];

  uint64_t v10 = [(id)objc_opt_class() nowPlayingSessionForPlayerPath:v9];

  return v10;
}

@end