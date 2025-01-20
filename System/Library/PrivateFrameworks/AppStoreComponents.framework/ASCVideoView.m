@interface ASCVideoView
- (ASCBorderedScreenshotView)previewFrameArtwork;
- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration;
- (ASCVideoView)initWithCoder:(id)a3;
- (ASCVideoView)initWithFrame:(CGRect)a3;
- (ASCVideoView)initWithFrame:(CGRect)a3 videoURL:(id)a4 screenshotDisplayConfiguration:(id)a5;
- (ASCVideoViewDelegate)delegate;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)isLoopingEnabled;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (CGSize)preferredVideoSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)pauseVideo;
- (void)playVideo;
- (void)playerDidPlayToEndTime:(id)a3;
- (void)resetVideo;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setLoopingEnabled:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)toggleIsPlaying;
@end

@implementation ASCVideoView

- (ASCVideoView)initWithFrame:(CGRect)a3 videoURL:(id)a4 screenshotDisplayConfiguration:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)ASCVideoView;
  v13 = -[ASCVideoView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:]([ASCBorderedScreenshotView alloc], "initWithFrame:screenshotDisplayConfiguration:", v12, x, y, width, height);
    previewFrameArtwork = v13->_previewFrameArtwork;
    v13->_previewFrameArtwork = v14;

    uint64_t v16 = [v12 copy];
    screenshotDisplayConfiguration = v13->_screenshotDisplayConfiguration;
    v13->_screenshotDisplayConfiguration = (ASCScreenshotDisplayConfiguration *)v16;

    v18 = (void *)MEMORY[0x1E4F16608];
    v19 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
    uint64_t v20 = [v18 playerWithURL:v19];
    player = v13->_player;
    v13->_player = (AVPlayer *)v20;

    uint64_t v22 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:v13->_player];
    playerLayer = v13->_playerLayer;
    v13->_playerLayer = (AVPlayerLayer *)v22;

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v25 = *MEMORY[0x1E4F16020];
    v26 = [(AVPlayer *)v13->_player currentItem];
    [v24 addObserver:v13 selector:sel_playerDidPlayToEndTime_ name:v25 object:v26];

    [(ASCVideoView *)v13 addSubview:v13->_previewFrameArtwork];
    v27 = [(ASCVideoView *)v13 layer];
    [v27 addSublayer:v13->_playerLayer];

    [(AVPlayerLayer *)v13->_playerLayer setHidden:1];
    v28 = [(ASCVideoView *)v13 layer];
    [v28 setMasksToBounds:1];

    -[ASCVideoView setLayoutMargins:](v13, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCVideoView *)v13 setUserInteractionEnabled:0];
  }

  return v13;
}

- (ASCVideoView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (ASCVideoView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCVideoView;
  [(ASCVideoView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)ASCVideoView;
  [(ASCVideoView *)&v16 layoutSubviews];
  v3 = [(ASCVideoView *)self screenshotDisplayConfiguration];
  [(ASCVideoView *)self bounds];
  objc_msgSend(v3, "cornerRadiusForSize:", v4, v5);
  double v7 = v6;
  v8 = [(ASCVideoView *)self layer];
  [v8 setCornerRadius:v7];

  v9 = [(ASCVideoView *)self screenshotDisplayConfiguration];
  v10 = [v9 cornerCurve];
  id v11 = [(ASCVideoView *)self layer];
  [v11 setCornerCurve:v10];

  id v12 = [(ASCVideoView *)self screenshotDisplayConfiguration];
  uint64_t v13 = [v12 maskedCorners];
  v14 = [(ASCVideoView *)self layer];
  [v14 setMaskedCorners:v13];

  v15 = [(ASCVideoView *)self layer];
  [v15 setMasksToBounds:1];

  [(ASCVideoView *)self bounds];
  -[ASCBorderedScreenshotView setFrame:](self->_previewFrameArtwork, "setFrame:");
  [(ASCVideoView *)self bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
}

- (CGSize)preferredVideoSize
{
  double v4 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  [(ASCVideoView *)self bounds];
  double v8 = v7 - (v3 + v6);
  [(ASCVideoView *)self bounds];
  double v10 = v9 - (v4 + v5);
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (BOOL)isMuted
{
  v2 = [(ASCVideoView *)self player];
  char v3 = [v2 isMuted];

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCVideoView *)self player];
  [v4 setMuted:v3];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v6 = [(ASCVideoView *)self previewFrameArtwork];
  double v5 = [v6 artworkView];
  [v5 setImage:v4];
}

- (void)playVideo
{
  BOOL v3 = [(ASCVideoView *)self player];

  if (v3)
  {
    id v4 = [(ASCVideoView *)self playerLayer];
    [v4 setHidden:0];

    double v5 = [(ASCVideoView *)self previewFrameArtwork];
    [v5 setHidden:1];

    id v6 = [(ASCVideoView *)self player];
    [v6 play];

    self->_isPlaying = 1;
    id v7 = [(ASCVideoView *)self delegate];
    [v7 videoView:self videoStateDidChange:0];
  }
}

- (void)pauseVideo
{
  BOOL v3 = [(ASCVideoView *)self player];

  if (v3)
  {
    id v4 = [(ASCVideoView *)self player];
    [v4 pause];

    self->_isPlaying = 0;
    id v5 = [(ASCVideoView *)self delegate];
    [v5 videoView:self videoStateDidChange:1];
  }
}

- (void)resetVideo
{
  BOOL v3 = [(ASCVideoView *)self player];

  if (v3)
  {
    id v4 = [(ASCVideoView *)self playerLayer];
    [v4 setHidden:1];

    id v5 = [(ASCVideoView *)self previewFrameArtwork];
    [v5 setHidden:0];

    id v6 = [(ASCVideoView *)self player];
    [v6 pause];

    id v7 = [(ASCVideoView *)self player];
    CMTimeMakeWithSeconds(&v8, 0.0, 1);
    [v7 seekToTime:&v8];

    self->_isPlaying = 0;
  }
}

- (void)toggleIsPlaying
{
  if ([(ASCVideoView *)self isPlaying])
  {
    [(ASCVideoView *)self pauseVideo];
  }
  else
  {
    [(ASCVideoView *)self playVideo];
  }
}

- (void)playerDidPlayToEndTime:(id)a3
{
  id v4 = [(ASCVideoView *)self delegate];
  [v4 videoView:self videoStateDidChange:2];

  if ([(ASCVideoView *)self isLoopingEnabled])
  {
    id v5 = [(ASCVideoView *)self player];
    CMTimeMakeWithSeconds(&v6, 0.0, 1);
    [v5 seekToTime:&v6];

    [(ASCVideoView *)self playVideo];
  }
  else
  {
    [(ASCVideoView *)self resetVideo];
  }
}

- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration
{
  return self->_screenshotDisplayConfiguration;
}

- (ASCBorderedScreenshotView)previewFrameArtwork
{
  return self->_previewFrameArtwork;
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (ASCVideoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCVideoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isLoopingEnabled
{
  return self->_loopingEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  self->_loopingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_previewFrameArtwork, 0);

  objc_storeStrong((id *)&self->_screenshotDisplayConfiguration, 0);
}

@end