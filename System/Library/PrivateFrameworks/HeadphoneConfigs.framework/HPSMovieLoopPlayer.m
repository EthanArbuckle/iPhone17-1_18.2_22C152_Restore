@interface HPSMovieLoopPlayer
+ (Class)layerClass;
- (AVPlayerLayer)playerLayer;
- (AVPlayerLooper)playerLooper;
- (AVQueuePlayer)videoPlayer;
- (CGRect)desiredBounds;
- (HPSMovieLoopPlayer)initWithFrame:(CGRect)a3 urlForResource:(id)a4;
- (NSURL)url;
- (void)hideVideoPlayer;
- (void)layoutSubviews;
- (void)load;
- (void)play;
- (void)setAlpha:(double)a3;
- (void)setAlphaHideOnZero:(double)a3;
- (void)setDesiredBounds:(CGRect)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setPlayerLooper:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)showVideoPlayer;
@end

@implementation HPSMovieLoopPlayer

- (HPSMovieLoopPlayer)initWithFrame:(CGRect)a3 urlForResource:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HPSMovieLoopPlayer;
  v11 = -[HPSMovieLoopPlayer initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:0];
    playerLayer = v11->_playerLayer;
    v11->_playerLayer = (AVPlayerLayer *)v12;

    objc_storeStrong((id *)&v11->_url, a4);
    v11->_desiredBounds.origin.double x = 0.0;
    v11->_desiredBounds.origin.double y = 0.0;
    v11->_desiredBounds.size.double width = width;
    v11->_desiredBounds.size.double height = height;
    v14 = [(HPSMovieLoopPlayer *)v11 layer];
    [v14 addSublayer:v11->_playerLayer];
  }
  return v11;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)load
{
  v3 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v3 setCategory:*MEMORY[0x1E4F14F68] withOptions:1 error:0];

  v4 = (AVQueuePlayer *)objc_opt_new();
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v4;

  [(AVQueuePlayer *)self->_videoPlayer setMuted:1];
  [(AVQueuePlayer *)self->_videoPlayer setAllowsExternalPlayback:0];
  v6 = self->_videoPlayer;
  v7 = [(HPSMovieLoopPlayer *)self playerLayer];
  [v7 setPlayer:v6];

  [(HPSMovieLoopPlayer *)self showVideoPlayer];
  v8 = (void *)MEMORY[0x1E4F16658];
  v9 = self->_videoPlayer;
  id v10 = objc_alloc(MEMORY[0x1E4F16620]);
  v11 = [(HPSMovieLoopPlayer *)self url];
  uint64_t v12 = (void *)[v10 initWithURL:v11];
  v13 = [v8 playerLooperWithPlayer:v9 templateItem:v12];
  playerLooper = self->_playerLooper;
  self->_playerLooper = v13;

  v15 = [(HPSMovieLoopPlayer *)self videoPlayer];
  long long v16 = *MEMORY[0x1E4F1FA48];
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v15 seekToTime:&v16];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HPSMovieLoopPlayer;
  [(HPSMovieLoopPlayer *)&v15 layoutSubviews];
  v3 = [(HPSMovieLoopPlayer *)self playerLayer];
  [(HPSMovieLoopPlayer *)self desiredBounds];
  objc_msgSend(v3, "setBounds:");

  v4 = [(HPSMovieLoopPlayer *)self layer];
  [v4 setMasksToBounds:0];

  v5 = [(HPSMovieLoopPlayer *)self layer];
  [v5 setCornerRadius:0.0];

  v6 = [(HPSMovieLoopPlayer *)self layer];
  [v6 bounds];
  double v8 = v7 * 0.5;
  v9 = [(HPSMovieLoopPlayer *)self layer];
  [v9 bounds];
  double v11 = v10 * 0.5;
  uint64_t v12 = [(HPSMovieLoopPlayer *)self playerLayer];
  objc_msgSend(v12, "setPosition:", v8, v11);

  uint64_t v13 = *MEMORY[0x1E4F15AF8];
  v14 = [(HPSMovieLoopPlayer *)self playerLayer];
  [v14 setVideoGravity:v13];
}

- (void)showVideoPlayer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__HPSMovieLoopPlayer_showVideoPlayer__block_invoke;
  v2[3] = &unk_1E6EA82F0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.15];
}

void __37__HPSMovieLoopPlayer_showVideoPlayer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playerLayer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

- (void)hideVideoPlayer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__HPSMovieLoopPlayer_hideVideoPlayer__block_invoke;
  v2[3] = &unk_1E6EA82F0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.15];
}

void __37__HPSMovieLoopPlayer_hideVideoPlayer__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playerLayer];
  [v1 setOpacity:0.0];
}

- (void)setAlphaHideOnZero:(double)a3
{
  -[HPSMovieLoopPlayer setAlpha:](self, "setAlpha:");

  [(HPSMovieLoopPlayer *)self setHidden:a3 == 0.0];
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HPSMovieLoopPlayer;
  -[HPSMovieLoopPlayer setAlpha:](&v7, sel_setAlpha_);
  v5 = [(HPSMovieLoopPlayer *)self playerLayer];
  *(float *)&a3 = a3;
  LODWORD(v6) = LODWORD(a3);
  [v5 setOpacity:v6];
}

- (void)play
{
  NSLog(&cfstr_SpatialProfile_26.isa, a2);
  v3 = [(HPSMovieLoopPlayer *)self videoPlayer];
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v3 seekToTime:&v6];

  v4 = [(HPSMovieLoopPlayer *)self videoPlayer];
  LODWORD(v5) = 1.0;
  [v4 playImmediatelyAtRate:v5];
}

- (AVQueuePlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (CGRect)desiredBounds
{
  double x = self->_desiredBounds.origin.x;
  double y = self->_desiredBounds.origin.y;
  double width = self->_desiredBounds.size.width;
  double height = self->_desiredBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDesiredBounds:(CGRect)a3
{
  self->_desiredBounds = a3;
}

- (AVPlayerLooper)playerLooper
{
  return self->_playerLooper;
}

- (void)setPlayerLooper:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);

  objc_storeStrong((id *)&self->_videoPlayer, 0);
}

@end