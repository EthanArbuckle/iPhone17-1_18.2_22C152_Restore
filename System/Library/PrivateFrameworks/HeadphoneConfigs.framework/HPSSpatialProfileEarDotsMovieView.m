@interface HPSSpatialProfileEarDotsMovieView
- (AVPlayer)player;
- (HPSSpatialProfileEarDotsMovieView)initWithFrame:(CGRect)a3;
- (id)timeObserverToken;
- (void)addBoundaryTimeObserver;
- (void)dealloc;
- (void)hideDots;
- (void)removeBoundaryTimeObserver;
- (void)setPlayer:(id)a3;
- (void)setTimeObserverToken:(id)a3;
- (void)showDots;
@end

@implementation HPSSpatialProfileEarDotsMovieView

- (HPSSpatialProfileEarDotsMovieView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HPSSpatialProfileEarDotsMovieView;
  v3 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"HRTF_Ear_Dots_Video" ofType:@"mov"];

    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    uint64_t v7 = [MEMORY[0x1E4F16620] playerItemWithURL:v6];
    playerItem = v3->_playerItem;
    v3->_playerItem = (AVPlayerItem *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:v3->_playerItem];
    player = v3->_player;
    v3->_player = (AVPlayer *)v9;

    uint64_t v11 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:v3->_player];
    playerLayer = v3->_playerLayer;
    v3->_playerLayer = (AVPlayerLayer *)v11;

    [(AVPlayerLayer *)v3->_playerLayer setVideoGravity:*MEMORY[0x1E4F15AF8]];
    [(HPSSpatialProfileEarDotsMovieView *)v3 bounds];
    -[AVPlayerLayer setFrame:](v3->_playerLayer, "setFrame:");
    v13 = [(HPSSpatialProfileEarDotsMovieView *)v3 layer];
    [v13 addSublayer:v3->_playerLayer];

    [(HPSSpatialProfileEarDotsMovieView *)v3 addBoundaryTimeObserver];
  }
  return v3;
}

- (void)dealloc
{
  [(HPSSpatialProfileEarDotsMovieView *)self removeBoundaryTimeObserver];
  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileEarDotsMovieView;
  [(HPSSpatialProfileEarDotsMovieView *)&v3 dealloc];
}

- (void)addBoundaryTimeObserver
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  long long v10 = *(_OWORD *)&v15.value;
  CMTimeEpoch epoch = v15.epoch;
  CMTimeMakeWithSeconds(&rhs, 1.0, 1);
  *(_OWORD *)&lhs.value = v10;
  lhs.CMTimeEpoch epoch = epoch;
  CMTimeAdd(&v15, &lhs, &rhs);
  CMTime lhs = v15;
  v5 = [MEMORY[0x1E4F29238] valueWithCMTime:&lhs];
  [v3 addObject:v5];

  lhs.value = 0;
  objc_initWeak((id *)&lhs, self);
  v6 = [(HPSSpatialProfileEarDotsMovieView *)self player];
  uint64_t v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__HPSSpatialProfileEarDotsMovieView_addBoundaryTimeObserver__block_invoke;
  v11[3] = &unk_1E6EA8340;
  objc_copyWeak(&v12, (id *)&lhs);
  uint64_t v9 = [v6 addBoundaryTimeObserverForTimes:v3 queue:v7 usingBlock:v11];
  [(HPSSpatialProfileEarDotsMovieView *)self setTimeObserverToken:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&lhs);
}

void __60__HPSSpatialProfileEarDotsMovieView_addBoundaryTimeObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained player];
  [v1 pause];
}

- (void)removeBoundaryTimeObserver
{
  objc_super v3 = [(HPSSpatialProfileEarDotsMovieView *)self timeObserverToken];

  if (v3)
  {
    v4 = [(HPSSpatialProfileEarDotsMovieView *)self player];
    v5 = [(HPSSpatialProfileEarDotsMovieView *)self timeObserverToken];
    [v4 removeTimeObserver:v5];

    [(HPSSpatialProfileEarDotsMovieView *)self setTimeObserverToken:0];
  }
}

- (void)showDots
{
  objc_super v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Dots: Show Dots", (uint8_t *)&v5, 2u);
  }

  player = self->_player;
  long long v5 = *MEMORY[0x1E4F1FA48];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVPlayer *)player seekToTime:&v5];
  [(AVPlayer *)self->_player play];
}

- (void)hideDots
{
  objc_super v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Dots: Hide Dots", (uint8_t *)&buf, 2u);
  }

  memset(&buf, 0, sizeof(buf));
  CMTimeMakeWithSeconds(&rhs, 6.0, 1000);
  CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeAdd(&buf, &v5, &rhs);
  player = self->_player;
  CMTime v5 = buf;
  [(AVPlayer *)player seekToTime:&v5];
  [(AVPlayer *)self->_player play];
}

- (id)timeObserverToken
{
  return objc_getProperty(self, a2, 424, 1);
}

- (void)setTimeObserverToken:(id)a3
{
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong(&self->_timeObserverToken, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);

  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end