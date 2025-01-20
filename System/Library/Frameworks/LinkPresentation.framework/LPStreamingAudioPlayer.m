@interface LPStreamingAudioPlayer
+ (id)playerWithAudio:(id)a3;
- (BOOL)hasMuteControl;
- (BOOL)isFullScreen;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (BOOL)shouldUnmuteWhenUserAdjustsVolume;
- (BOOL)usesSharedAudioSession;
- (LPStreamingAudioPlayer)initWithAudio:(id)a3;
- (float)progress;
- (unint64_t)state;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)dispatchDidChangeProgressToAllClients:(float)a3;
- (void)dispatchDidFailToPlayToAllClients;
- (void)dispatchDidTransitionToStateToAllClients:(unint64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)removeClient:(id)a3;
- (void)resetPlaybackState;
- (void)setActive:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)transitionToState:(unint64_t)a3;
@end

@implementation LPStreamingAudioPlayer

+ (id)playerWithAudio:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = allStreamingAudioPlayers();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(id **)(*((void *)&v21 + 1) + 8 * i);
        v10 = objc_msgSend(v9[1], "streamingURL", (void)v21);
        v11 = [v4 streamingURL];
        char v12 = [v10 isEqual:v11];

        if (v12) {
          goto LABEL_12;
        }
        v13 = [v9[1] fileURL];
        v14 = [v4 fileURL];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          v16 = [v9[1] _asset];
          v17 = [v4 _asset];
          BOOL v18 = v16 == v17;

          if (!v18) {
            continue;
          }
        }
LABEL_12:
        v19 = v9;

        goto LABEL_13;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v19 = (id *)[objc_alloc((Class)a1) initWithAudio:v4];
LABEL_13:

  return v19;
}

- (LPStreamingAudioPlayer)initWithAudio:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(LPStreamingAudioPlayer *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audio, a3);
    v7->_state = 0;
    v8 = +[LPMediaPlaybackManager shared];
    [v8 addMediaPlayer:v7];

    v9 = allStreamingAudioPlayers();
    [v9 addObject:v7];

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_timeObserver) {
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
  }
  if (self->_endObserver)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_endObserver name:*MEMORY[0x1E4F16020] object:self->_item];
  }
  player = self->_player;
  if (player) {
    [(AVPlayer *)player removeObserver:self forKeyPath:@"timeControlStatus" context:timeControlStatusKVOContext_0];
  }
  id v5 = +[LPMediaPlaybackManager shared];
  [v5 removeMediaPlayer:self];

  uint64_t v6 = allStreamingAudioPlayers();
  [v6 removeObject:self];

  v7.receiver = self;
  v7.super_class = (Class)LPStreamingAudioPlayer;
  [(LPStreamingAudioPlayer *)&v7 dealloc];
}

- (void)play
{
  objc_storeStrong((id *)&currentlyPlayingPlayer, self);
  player = self->_player;
  if (!player)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F16620]);
    id v5 = [(LPAudio *)self->_audio _asset];
    uint64_t v6 = (AVPlayerItem *)[v4 initWithAsset:v5];
    item = self->_item;
    self->_item = v6;

    v8 = (AVPlayer *)[objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:self->_item];
    v9 = self->_player;
    self->_player = v8;

    v10 = +[LPMediaPlaybackManager shared];
    v11 = [v10 audioSession];
    [(AVPlayer *)self->_player setAudioSession:v11];

    [(AVPlayer *)self->_player addObserver:self forKeyPath:@"timeControlStatus" options:5 context:timeControlStatusKVOContext_0];
    objc_initWeak(&location, self);
    char v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F16020];
    v14 = self->_item;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __30__LPStreamingAudioPlayer_play__block_invoke;
    v20 = &unk_1E5B06250;
    objc_copyWeak(&v21, &location);
    char v15 = [v12 addObserverForName:v13 object:v14 queue:0 usingBlock:&v17];
    id endObserver = self->_endObserver;
    self->_id endObserver = v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    player = self->_player;
  }
  [(AVPlayer *)player play];
}

void __30__LPStreamingAudioPlayer_play__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 3);
    long long v4 = *MEMORY[0x1E4F1FA48];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v3 seekToTime:&v4];
    [v2 transitionToState:4];
  }
}

- (void)pause
{
}

- (float)progress
{
  LODWORD(v2) = 1.0;
  if (self->_state != 4)
  {
    item = self->_item;
    if (item) {
      [(AVPlayerItem *)item currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    uint64_t v6 = self->_item;
    if (v6) {
      [(AVPlayerItem *)v6 duration];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    *(float *)&double v2 = Seconds / CMTimeGetSeconds(&v8);
  }
  return *(float *)&v2;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clients = self->_clients;
  id v8 = v4;
  if (!clients)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_super v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    id v4 = v8;
  }
  [(NSHashTable *)clients addObject:v4];
}

- (void)removeClient:(id)a3
{
}

- (void)dispatchDidChangeProgressToAllClients:(float)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        *(float *)&double v7 = a3;
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "audioPlayer:didChangeProgress:", self, v7, (void)v10);
      }
      while (v6 != v9);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)dispatchDidTransitionToStateToAllClients:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "audioPlayer:didTransitionToState:", self, a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dispatchDidFailToPlayToAllClients
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_clients;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "audioPlayerDidFailToPlay:", self, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setActive:(BOOL)a3
{
  player = self->_player;
  if (a3) {
    [(AVPlayer *)player play];
  }
  else {
    [(AVPlayer *)player pause];
  }
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void)setPlaying:(BOOL)a3
{
  if (a3) {
    [(LPStreamingAudioPlayer *)self play];
  }
  else {
    [(LPStreamingAudioPlayer *)self pause];
  }
}

- (void)resetPlaybackState
{
  [(LPStreamingAudioPlayer *)self setPlaying:0];
  player = self->_player;
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVPlayer *)player seekToTime:&v4];
  [(LPStreamingAudioPlayer *)self transitionToState:0];
}

- (BOOL)usesSharedAudioSession
{
  return 1;
}

- (BOOL)isFullScreen
{
  return 0;
}

- (BOOL)shouldUnmuteWhenUserAdjustsVolume
{
  return 0;
}

- (void)transitionToState:(unint64_t)a3
{
  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  switch(a3)
  {
    case 4uLL:
      if (self->_timeObserver)
      {
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
        id timeObserver = self->_timeObserver;
        self->_id timeObserver = 0;
      }
      goto LABEL_13;
    case 3uLL:
      if (state == 4)
      {
        self->_unint64_t state = 4;
        break;
      }
      if (self->_timeObserver)
      {
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
        id v13 = self->_timeObserver;
        self->_id timeObserver = 0;
      }
      else
      {
        [(LPStreamingAudioPlayer *)self dispatchDidFailToPlayToAllClients];
        self->_unint64_t state = 0;
      }
LABEL_13:
      uint64_t v14 = +[LPMediaPlaybackManager shared];
      [v14 mediaPlayer:self didChangePlayingState:0];

      break;
    case 2uLL:
      objc_initWeak(&location, self);
      player = self->_player;
      CMTimeMake(&v17, 1, 30);
      uint64_t v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__LPStreamingAudioPlayer_transitionToState___block_invoke;
      v15[3] = &unk_1E5B06278;
      objc_copyWeak(&v16, &location);
      long long v9 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v17 queue:v7 usingBlock:v15];
      id v10 = self->_timeObserver;
      self->_id timeObserver = v9;

      long long v11 = +[LPMediaPlaybackManager shared];
      [v11 mediaPlayer:self didChangePlayingState:1];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_17;
  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL && (LPStreamingAudioPlayer *)currentlyPlayingPlayer == self)
  {
    currentlyPlayingPlayer = 0;
  }
LABEL_17:
  if (state != self->_state) {
    -[LPStreamingAudioPlayer dispatchDidTransitionToStateToAllClients:](self, "dispatchDidTransitionToStateToAllClients:");
  }
}

void __44__LPStreamingAudioPlayer_transitionToState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained progress];
  objc_msgSend(WeakRetained, "dispatchDidChangeProgressToAllClients:");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)timeControlStatusKVOContext_0 == a6)
  {
    AVPlayerTimeControlStatus v13 = [(AVPlayer *)self->_player timeControlStatus];
    if (v13)
    {
      if (v13 == AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate)
      {
        uint64_t v15 = [(AVPlayer *)self->_player reasonForWaitingToPlay];
        id v16 = (void *)*MEMORY[0x1E4F16098];

        if (v15 != v16) {
          goto LABEL_11;
        }
        uint64_t v14 = 1;
      }
      else
      {
        if (v13 != AVPlayerTimeControlStatusPlaying) {
          goto LABEL_11;
        }
        uint64_t v14 = 2;
      }
    }
    else
    {
      uint64_t v14 = 3;
    }
    [(LPStreamingAudioPlayer *)self transitionToState:v14];
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)LPStreamingAudioPlayer;
  [(LPStreamingAudioPlayer *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_endObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_audio, 0);
}

@end