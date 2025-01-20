@interface CKVideoPreviewViewController
- (AVPlayer)avPlayer;
- (AVPlayerItem)avPlayerItem;
- (AVPlayerLayer)avPlayerLayer;
- (BOOL)isPlaying;
- (BOOL)prefersStatusBarHidden;
- (BOOL)reachedEnd;
- (BOOL)redisplayStatusBar;
- (BOOL)togglePlayPause;
- (CKVideoPreviewViewController)init;
- (CKVideoPreviewViewControllerDelegate)videoPreviewDelegate;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)setAvPlayer:(id)a3;
- (void)setAvPlayerItem:(id)a3;
- (void)setAvPlayerLayer:(id)a3;
- (void)setReachedEnd:(BOOL)a3;
- (void)setRedisplayStatusBar:(BOOL)a3;
- (void)setVideoFileURL:(id)a3;
- (void)setVideoPreviewDelegate:(id)a3;
- (void)videoDidReachEnd:(id)a3;
@end

@implementation CKVideoPreviewViewController

- (CKVideoPreviewViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKVideoPreviewViewController;
  v2 = [(CKVideoPreviewViewController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F16650] layer];
    [(CKVideoPreviewViewController *)v2 setAvPlayerLayer:v3];

    v4 = [(CKVideoPreviewViewController *)v2 avPlayerLayer];
    [v4 setVideoGravity:*MEMORY[0x1E4F15AF8]];
  }
  return v2;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)CKVideoPreviewViewController;
  [(CKVideoPreviewViewController *)&v8 loadView];
  v3 = [(CKVideoPreviewViewController *)self avPlayerLayer];
  v4 = [(CKVideoPreviewViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  v5 = [(CKVideoPreviewViewController *)self view];
  objc_super v6 = [v5 layer];
  v7 = [(CKVideoPreviewViewController *)self avPlayerLayer];
  [v6 insertSublayer:v7 atIndex:0];

  [(CKVideoPreviewViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setVideoFileURL:(id)a3
{
  if (a3)
  {
    v4 = CKAVURLAssetForURL(a3);
    v5 = [MEMORY[0x1E4F16620] playerItemWithAsset:v4];
    [(CKVideoPreviewViewController *)self setAvPlayerItem:v5];

    objc_super v6 = (void *)MEMORY[0x1E4F16608];
    v7 = [(CKVideoPreviewViewController *)self avPlayerItem];
    objc_super v8 = [v6 playerWithPlayerItem:v7];
    [(CKVideoPreviewViewController *)self setAvPlayer:v8];

    v9 = [(CKVideoPreviewViewController *)self avPlayer];
    v10 = [(CKVideoPreviewViewController *)self avPlayerLayer];
    [v10 setPlayer:v9];

    v11 = [(CKVideoPreviewViewController *)self avPlayer];
    [v11 setActionAtItemEnd:1];

    v12 = [(CKVideoPreviewViewController *)self avPlayer];
    uint64_t v13 = MEMORY[0x192FBA870]("CMTimeZero", @"CoreMedia");
    uint64_t v14 = *(void *)(v13 + 16);
    long long v22 = *(_OWORD *)v13;
    uint64_t v23 = v14;
    [v12 seekToTime:&v22];

    v15 = [(CKVideoPreviewViewController *)self avPlayerLayer];
    [v15 addObserver:self forKeyPath:@"readyForDisplay" options:5 context:&CKVideoPlayerLayerContext];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4F16020];
    v18 = [(CKVideoPreviewViewController *)self avPlayerItem];
    [v16 addObserver:self selector:sel_videoDidReachEnd_ name:v17 object:v18];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v20 = *MEMORY[0x1E4F16030];
    v21 = [(CKVideoPreviewViewController *)self avPlayerItem];
    [v19 addObserver:self selector:sel_videoDidReachEnd_ name:v20 object:v21];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(AVPlayerLayer *)self->_avPlayerLayer removeObserver:self forKeyPath:@"readyForDisplay" context:&CKVideoPlayerLayerContext];
  [(AVPlayerLayer *)self->_avPlayerLayer removeFromSuperlayer];
  v4.receiver = self;
  v4.super_class = (Class)CKVideoPreviewViewController;
  [(CKVideoPreviewViewController *)&v4 dealloc];
}

- (BOOL)isPlaying
{
  [(AVPlayer *)self->_avPlayer rate];
  return v2 != 0.0;
}

- (BOOL)togglePlayPause
{
  BOOL v3 = [(CKVideoPreviewViewController *)self isPlaying];
  if (v3) {
    [(CKVideoPreviewViewController *)self pause];
  }
  else {
    [(CKVideoPreviewViewController *)self play];
  }
  return !v3;
}

- (void)play
{
  if ([(CKVideoPreviewViewController *)self reachedEnd])
  {
    [(CKVideoPreviewViewController *)self setReachedEnd:0];
    BOOL v3 = [(CKVideoPreviewViewController *)self avPlayer];
    uint64_t v4 = MEMORY[0x192FBA870]("CMTimeZero", @"CoreMedia");
    uint64_t v5 = *(void *)(v4 + 16);
    long long v8 = *(_OWORD *)v4;
    uint64_t v9 = v5;
    [v3 seekToTime:&v8];
  }
  objc_super v6 = +[CKAudioSessionController shareInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CKVideoPreviewViewController_play__block_invoke;
  v7[3] = &unk_1E5620C40;
  v7[4] = self;
  [v6 activateWithOptions:1 completion:v7];
}

void __36__CKVideoPreviewViewController_play__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) avPlayer];
  [v1 play];
}

- (void)pause
{
  float v2 = [(CKVideoPreviewViewController *)self avPlayer];
  [v2 pause];

  id v3 = +[CKAudioSessionController shareInstance];
  [v3 deactivate];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 != &CKVideoPlayerLayerContext)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKVideoPreviewViewController;
    -[CKVideoPreviewViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", @"readyForDisplay", a4, a5))
  {
    id v8 = [(CKVideoPreviewViewController *)self avPlayerLayer];
    if ([v8 isReadyForDisplay])
    {
      BOOL v7 = [(CKVideoPreviewViewController *)self isPlaying];

      if (v7) {
        return;
      }
      id v8 = [(CKVideoPreviewViewController *)self videoPreviewDelegate];
      [v8 ckVideoPreviewViewControllerReady:self];
    }
  }
}

- (void)videoDidReachEnd:(id)a3
{
  [(CKVideoPreviewViewController *)self setReachedEnd:1];
  uint64_t v4 = +[CKAudioSessionController shareInstance];
  [v4 deactivate];

  id v5 = [(CKVideoPreviewViewController *)self videoPreviewDelegate];
  [v5 ckVideoPreviewViewControllerFinishedPlaying:self];
}

- (CKVideoPreviewViewControllerDelegate)videoPreviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoPreviewDelegate);

  return (CKVideoPreviewViewControllerDelegate *)WeakRetained;
}

- (void)setVideoPreviewDelegate:(id)a3
{
}

- (BOOL)redisplayStatusBar
{
  return self->_redisplayStatusBar;
}

- (void)setRedisplayStatusBar:(BOOL)a3
{
  self->_redisplayStatusBar = a3;
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
}

- (BOOL)reachedEnd
{
  return self->_reachedEnd;
}

- (void)setReachedEnd:(BOOL)a3
{
  self->_reachedEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);

  objc_destroyWeak((id *)&self->_videoPreviewDelegate);
}

@end