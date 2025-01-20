@interface JFXCompositionPlayerViewController
+ (Class)compositionPlayerClass;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval;
- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumTouchSize;
- (BOOL)cachedWasPlaying;
- (BOOL)disableVideoDisplayGestures;
- (BOOL)dontRemovePlaceHolderOnDisplay;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDisplaying;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (BOOL)isReloadClipDataSourceNeeded;
- (BOOL)shouldHandleMediaServerCrash;
- (CGPoint)convertPointInPlaybackSizeToClipPoint:(CGPoint)a3;
- (CGPoint)convertPointInPlaybackSizeToClipPointNormalized:(CGPoint)a3;
- (CGRect)videoDisplayBounds;
- (CGSize)cachedRenderSizeInPixels;
- (CGSize)lastPlayerViewBoundsSize;
- (CGSize)lastPlayerViewSize;
- (CGSize)playerViewBoundsSize;
- (CGSize)renderSizeInPixels;
- (JFXCompositionPlayableElementsDataSource)clipsDataSource;
- (JFXCompositionPlayer)clipsPlayer;
- (JFXCompositionPlayerViewController)init;
- (JFXCompositionPlayerViewController)initWithCoder:(id)a3;
- (JFXCompositionPlayerViewControllerDelegate)delegate;
- (NSString)displayName;
- (UIColor)restoreToColor;
- (UIView)placeHolderView;
- (UIView)videoDisplayOverlayView;
- (UIView)viewFlashed;
- (id)contentModeToVideoGravity:(int64_t)a3;
- (id)placeholderContainerView;
- (id)playerContainerView;
- (id)playerViewer;
- (id)viewToFlash;
- (int)cachedCurrentTime;
- (int)cachedDuration;
- (int)cachedMuted;
- (int)currentTime;
- (int)duration;
- (int)frameRate;
- (int64_t)videoContentMode;
- (unsigned)parentCode;
- (void)addPlaceHolder;
- (void)appDidBecomeActive:(id)a3;
- (void)appDidEnterBackground:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)beginFlash;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)dispatchBlockWhenDone:(id)a3;
- (void)displayPlaceHolder;
- (void)endFlash;
- (void)installVideoDisplayGestures;
- (void)mediaserverdCrashed;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pauseWithCompletionBlock:(id)a3;
- (void)play;
- (void)playWithCompletionHandler:(id)a3;
- (void)playbackAreaDoubleTapped:(id)a3;
- (void)playbackAreaPanned:(id)a3;
- (void)playbackAreaPinched:(id)a3;
- (void)playbackAreaRotated:(id)a3;
- (void)playbackAreaTapped:(id)a3;
- (void)playbackDidStart:(id)a3;
- (void)playbackDidStop:(id)a3 currentTime:(int)a4;
- (void)playbackReadyForDisplayChanged:(id)a3 isReady:(BOOL)a4 setPlaceHolder:(BOOL)a5;
- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4;
- (void)playerBecameReadyForDisplayChanged:(BOOL)a3 setPlaceHolder:(BOOL)a4;
- (void)playerWillBeDestroyed:(id)a3;
- (void)preparePlaceHolder;
- (void)prepareVideoDisplayView;
- (void)reloadClipDataSource;
- (void)reloadClipDataSourceIfNeeded;
- (void)reloadClipDataSourceOnBecomingActive;
- (void)removePlaceHolder;
- (void)resetPlaybackTimeChangedObserverInterval;
- (void)seekToTime:(int)a3;
- (void)setCachedCurrentTime:(int)a3;
- (void)setCachedDuration:(int)a3;
- (void)setCachedMuted:(int)a3;
- (void)setCachedRenderSizeInPixels:(CGSize)a3;
- (void)setCachedWasPlaying:(BOOL)a3;
- (void)setClipsDataSource:(id)a3;
- (void)setClipsPlayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableVideoDisplayGestures:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDontRemovePlaceHolderOnDisplay:(BOOL)a3;
- (void)setLastPlayerViewBoundsSize:(CGSize)a3;
- (void)setLastPlayerViewSize:(CGSize)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNeedsCompositionUpdate;
- (void)setNeedsCompositionUpdateForClip:(id)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPlaceHolderView:(id)a3;
- (void)setPlaybackTimeChangedObserverInterval:(id *)a3;
- (void)setRestoreToColor:(id)a3;
- (void)setVideoContentMode:(int64_t)a3;
- (void)setVideoDisplayOverlayView:(id)a3;
- (void)setViewFlashed:(id)a3;
- (void)sharedInit;
- (void)unloadClipDataSourceSetPlaceHolder:(BOOL)a3;
- (void)unloadCompositionSetPlaceHolder:(BOOL)a3;
- (void)updateCachedPlaybackProperties;
- (void)updateDelegatePlayer;
- (void)updateVideoDisplayViewBounds;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JFXCompositionPlayerViewController

- (JFXCompositionPlayerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  v2 = [(JFXCompositionPlayerViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(JFXCompositionPlayerViewController *)v2 sharedInit];
  }
  return v3;
}

- (JFXCompositionPlayerViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXCompositionPlayerViewController;
  v3 = [(JFXCompositionPlayerViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(JFXCompositionPlayerViewController *)v3 sharedInit];
  }
  return v4;
}

- (void)sharedInit
{
  self->_videoContentMode = 0;
  self->_parentCode = -1;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v10 viewDidLoad];
  v3 = [(JFXCompositionPlayerViewController *)self playerContainerView];
  [v3 setAlpha:0.0];

  v4 = [(JFXCompositionPlayerViewController *)self contentModeToVideoGravity:[(JFXCompositionPlayerViewController *)self videoContentMode]];
  objc_super v5 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v5 setVideoGravity:v4];

  objc_super v6 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v6 setShowAVControls:0];

  *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = kDefaultPlaybackTimeObserverInterval;
  self->_playbackTimeChangedObserverInterval.epoch = 0;
  [(JFXCompositionPlayerViewController *)self setRestoreToColor:0];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_appDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_appWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_appDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v4 addObserver:self forKeyPath:@"videoBounds" options:1 context:0];

  [(JFXCompositionPlayerViewController *)self updateDelegatePlayer];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v4 removeObserver:self forKeyPath:@"videoBounds"];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v12 viewDidLayoutSubviews];
  v3 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v3 displaySize];
  double v5 = v4;
  double v7 = v6;

  [(JFXCompositionPlayerViewController *)self lastPlayerViewSize];
  if (v5 != v9 || v7 != v8)
  {
    -[JFXCompositionPlayerViewController setLastPlayerViewSize:](self, "setLastPlayerViewSize:", v5, v7);
    v11 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v11 notifyPlayerViewSizeChanged];
  }
}

- (void)appDidBecomeActive:(id)a3
{
  double v4 = [(JFXCompositionPlayerViewController *)self viewIfLoaded];
  double v5 = [v4 window];

  if (v5)
  {
    [(JFXCompositionPlayerViewController *)self reloadClipDataSourceOnBecomingActive];
  }
}

- (void)appDidEnterBackground:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v4 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(JFXCompositionPlayerViewController *)self displayName];
    int v6 = 138543362;
    double v7 = v5;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "player %{public}@ entered background. will clear composition", (uint8_t *)&v6, 0xCu);
  }
  [(JFXCompositionPlayerViewController *)self unloadCompositionSetPlaceHolder:0];
}

- (void)appWillResignActive:(id)a3
{
  double v4 = JFXLog_playback();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[JFXCompositionPlayerViewController appWillResignActive:](self, v4);
  }

  [(JFXCompositionPlayerViewController *)self pause];
  [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
}

- (void)didReceiveMemoryWarning
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)JFXCompositionPlayerViewController;
  [(JFXCompositionPlayerViewController *)&v10 didReceiveMemoryWarning];
  v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  char v4 = [v3 isPlaying];

  if ((v4 & 1) == 0)
  {
    double v5 = JFXLog_playback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(JFXCompositionPlayerViewController *)self displayName];
      *(_DWORD *)buf = 138543362;
      objc_super v12 = v6;
      _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "player %{public}@ didReceiveMemoryWarning and not playing. will clear composition", buf, 0xCu);
    }
    double v7 = JFXPlaybackEventSignpostPointCategory();
    uint64_t v8 = v7;
    os_signpost_id_t v9 = JFXSignpostExclusiveID;
    if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v8, OS_SIGNPOST_EVENT, v9, "MemoryWarning", (const char *)&unk_234D6C482, buf, 2u);
    }

    [(JFXCompositionPlayerViewController *)self unloadCompositionSetPlaceHolder:1];
  }
}

- (void)updateCachedPlaybackProperties
{
  [(JFXCompositionPlayerViewController *)self setCachedDuration:[(JFXCompositionPlayerViewController *)self duration]];
  [(JFXCompositionPlayerViewController *)self setCachedCurrentTime:[(JFXCompositionPlayerViewController *)self currentTime]];
  [(JFXCompositionPlayerViewController *)self setCachedMuted:[(JFXCompositionPlayerViewController *)self isMuted]];
  [(JFXCompositionPlayerViewController *)self renderSizeInPixels];
  -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:");
}

- (void)unloadClipDataSourceSetPlaceHolder:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"mediaserverdCrashed" object:0];

  int v6 = [(JFXCompositionPlayerViewController *)self placeHolderView];

  if (!v6) {
    [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
  }
  double v7 = [(JFXCompositionPlayerViewController *)self playerContainerView];
  [v7 setAlpha:0.0];

  uint64_t v8 = [(JFXCompositionPlayerViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_super v10 = [(JFXCompositionPlayerViewController *)self delegate];
    [v10 updateFromPlayer:0];
  }
  v11 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  [v11 teardownSetPlaceHolder:v3];

  [(JFXCompositionPlayerViewController *)self setClipsPlayer:0];
}

- (void)setClipsDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_clipsDataSource, a3);
  [(JFXCompositionPlayerViewController *)self reloadClipDataSource];
}

- (void)reloadClipDataSourceOnBecomingActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(JFXCompositionPlayerViewController *)self displayName];
    int v5 = 138543362;
    int v6 = v4;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloaded clip data source on becomingActive", (uint8_t *)&v5, 0xCu);
  }
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
}

- (void)reloadClipDataSourceIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(JFXCompositionPlayerViewController *)self isReloadClipDataSourceNeeded])
  {
    BOOL v3 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = [(JFXCompositionPlayerViewController *)self displayName];
      int v5 = 138543362;
      int v6 = v4;
      _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloaded clip data source when needed", (uint8_t *)&v5, 0xCu);
    }
    [(JFXCompositionPlayerViewController *)self reloadClipDataSource];
  }
}

- (BOOL)isReloadClipDataSourceNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipsDataSource);
  if (WeakRetained)
  {
    char v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)reloadClipDataSource
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
  BOOL v3 = [(JFXCompositionPlayerViewController *)self playerContainerView];
  [v3 setAlpha:0.0];

  uint64_t v4 = [(JFXCompositionPlayerViewController *)self cachedCurrentTime];
  int v5 = [(JFXCompositionPlayerViewController *)self cachedMuted];
  [(JFXCompositionPlayerViewController *)self setCachedCurrentTime:0];
  [(JFXCompositionPlayerViewController *)self setCachedMuted:0];
  [(JFXCompositionPlayerViewController *)self setCachedDuration:0];
  -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  int v6 = [(JFXCompositionPlayerViewController *)self clipsPlayer];

  if (v6)
  {
    uint64_t v7 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(JFXCompositionPlayerViewController *)self displayName];
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloading clip data source, tear down existing player", buf, 0xCu);
    }
    char v9 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v9 teardownSetPlaceHolder:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipsDataSource);

  if (WeakRetained)
  {
    id v11 = objc_alloc((Class)[(id)objc_opt_class() compositionPlayerClass]);
    id v12 = objc_loadWeakRetained((id *)&self->_clipsDataSource);
    uint64_t v13 = (void *)[v11 initWithClipsDataSource:v12 seekPosition:v4 audioMuted:v5 != 0];
    [(JFXCompositionPlayerViewController *)self setClipsPlayer:v13];

    v14 = [(JFXCompositionPlayerViewController *)self displayName];
    v15 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v15 setDisplayName:v14];

    uint64_t v16 = [(JFXCompositionPlayerViewController *)self parentCode];
    v17 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v17 setParentCode:v16];

    v18 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v18 setPlaybackDelegate:self];

    [(JFXCompositionPlayerViewController *)self playbackTimeChangedObserverInterval];
    v19 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    long long v27 = v29;
    uint64_t v28 = v30;
    [v19 setPlaybackTimeChangedObserverInterval:&v27];

    [(JFXCompositionPlayerViewController *)self beginFlash];
    objc_initWeak((id *)buf, self);
    v20 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    v21 = [(JFXCompositionPlayerViewController *)self playerViewer];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58__JFXCompositionPlayerViewController_reloadClipDataSource__block_invoke;
    v25[3] = &unk_264C0C888;
    objc_copyWeak(&v26, (id *)buf);
    [v20 setPlayerView:v21 completionBlock:v25];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:self selector:sel_mediaserverdCrashed name:@"mediaserverdCrashed" object:0];

    [(JFXCompositionPlayerViewController *)self setNeedsCompositionUpdate];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v23 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
    [v23 removeFromSuperview];

    [(JFXCompositionPlayerViewController *)self setVideoDisplayOverlayView:0];
    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 removeObserver:self name:@"mediaserverdCrashed" object:0];

    [(JFXCompositionPlayerViewController *)self setClipsPlayer:0];
  }
}

void __58__JFXCompositionPlayerViewController_reloadClipDataSource__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDelegatePlayer];

  id v3 = objc_loadWeakRetained(v1);
  [v3 endFlash];
}

- (void)setNeedsCompositionUpdate
{
  [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  id v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  [v3 pause:0];

  [(JFXCompositionPlayerViewController *)self beginFlash];
  objc_initWeak(&location, self);
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke;
  v5[3] = &unk_264C0C888;
  objc_copyWeak(&v6, &location);
  [v4 updateComposition:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6 = a4;
  if ((a3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = [WeakRetained clipsPlayer];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke_2;
    v10[3] = &unk_264C0C888;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    [v8 dispatchBlockWhenDone:v10];

    id v9 = objc_loadWeakRetained((id *)(a1 + 32));
    [v9 endFlash];

    objc_destroyWeak(&v11);
  }
}

void __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDelegatePlayer];
}

- (void)setNeedsCompositionUpdateForClip:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  int v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__JFXCompositionPlayerViewController_setNeedsCompositionUpdateForClip___block_invoke;
  v6[3] = &unk_264C0C8B0;
  objc_copyWeak(&v7, &from);
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  [v5 updateCompositionForClip:v4 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __71__JFXCompositionPlayerViewController_setNeedsCompositionUpdateForClip___block_invoke(id *a1, uint64_t a2, int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(a1 + 6);
    [v7 updateDelegatePlayer];

    id v8 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [a1[4] displayName];
      id v10 = objc_loadWeakRetained(v5);
      uint64_t v11 = [v10 uuid];
      id v12 = (void *)v11;
      uint64_t v13 = @"succeeded";
      int v14 = 138543874;
      v15 = v9;
      __int16 v16 = 2114;
      if (a3) {
        uint64_t v13 = @"was throttled";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ clip composition update for clip  %{public}@ %{public}@ ", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)updateDelegatePlayer
{
  id v3 = [(JFXCompositionPlayerViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = [(JFXCompositionPlayerViewController *)self delegate];
    int v5 = [(JFXCompositionPlayerViewController *)self playerViewer];
    id v6 = [v5 player];
    [v7 updateFromPlayer:v6];
  }
}

- (void)dispatchBlockWhenDone:(id)a3
{
  char v4 = (void (**)(void))a3;
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  int v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];

  if (v5)
  {
    id v6 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__JFXCompositionPlayerViewController_dispatchBlockWhenDone___block_invoke;
    v7[3] = &unk_264C0C8D8;
    id v8 = v4;
    [v6 dispatchBlockWhenDone:v7];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __60__JFXCompositionPlayerViewController_dispatchBlockWhenDone___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unloadCompositionSetPlaceHolder:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = JFXPlaybackEventSignpostPointCategory();
  id v6 = v5;
  os_signpost_id_t v7 = JFXSignpostExclusiveID;
  if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_234C41000, v6, OS_SIGNPOST_EVENT, v7, "UnloadComposition", (const char *)&unk_234D6C482, v8, 2u);
  }

  [(JFXCompositionPlayerViewController *)self updateCachedPlaybackProperties];
  [(JFXCompositionPlayerViewController *)self unloadClipDataSourceSetPlaceHolder:v3];
}

- (void)preparePlaceHolder
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  if (!v3) {
    goto LABEL_3;
  }
  char v4 = (void *)v3;
  int v5 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  id v6 = [v5 superview];

  if (!v6)
  {
LABEL_3:
    os_signpost_id_t v7 = [(JFXCompositionPlayerViewController *)self placeholderContainerView];

    if (v7)
    {
      id v8 = JFXLog_DebugPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(JFXCompositionPlayerViewController *)self displayName];
        int v23 = 138543362;
        v24 = v9;
        _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder prepared", (uint8_t *)&v23, 0xCu);
      }
      id v10 = [(JFXCompositionPlayerViewController *)self playerContainerView];
      uint64_t v11 = [v10 snapshotViewAfterScreenUpdates:0];
      [(JFXCompositionPlayerViewController *)self setPlaceHolderView:v11];

      id v12 = [(JFXCompositionPlayerViewController *)self playerContainerView];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

      v22 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      [v22 setAutoresizingMask:18];
    }
    kdebug_trace();
  }
}

- (void)displayPlaceHolder
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  kdebug_trace();
  [(JFXCompositionPlayerViewController *)self setDontRemovePlaceHolderOnDisplay:1];
  uint64_t v3 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(JFXCompositionPlayerViewController *)self displayName];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder placeholder locked", (uint8_t *)&v5, 0xCu);
  }
  [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
  [(JFXCompositionPlayerViewController *)self addPlaceHolder];
  kdebug_trace();
}

- (void)addPlaceHolder
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  if (v3)
  {
    char v4 = (void *)v3;
    uint64_t v5 = [(JFXCompositionPlayerViewController *)self placeholderContainerView];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      id v8 = [v7 superview];

      if (!v8)
      {
        id v9 = JFXLog_DebugPlayback();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [(JFXCompositionPlayerViewController *)self displayName];
          int v32 = 138543362;
          uint64_t v33 = v10;
          _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder displayed", (uint8_t *)&v32, 0xCu);
        }
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        uint64_t v11 = [(JFXCompositionPlayerViewController *)self playerContainerView];
        [v11 bounds];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        double v20 = [(JFXCompositionPlayerViewController *)self placeHolderView];
        [v20 frame];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;

        v35.origin.x = v22;
        v35.origin.y = v24;
        v35.size.width = v26;
        v35.size.height = v28;
        v36.origin.x = v13;
        v36.origin.y = v15;
        v36.size.width = v17;
        v36.size.height = v19;
        if (!CGRectEqualToRect(v35, v36))
        {
          long long v29 = [(JFXCompositionPlayerViewController *)self placeHolderView];
          objc_msgSend(v29, "setFrame:", v13, v15, v17, v19);
        }
        uint64_t v30 = [(JFXCompositionPlayerViewController *)self placeholderContainerView];
        v31 = [(JFXCompositionPlayerViewController *)self placeHolderView];
        [v30 addSubview:v31];

        [MEMORY[0x263F158F8] commit];
        [MEMORY[0x263F158F8] flush];
      }
    }
    else
    {
    }
  }
  kdebug_trace();
}

- (void)removePlaceHolder
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  kdebug_trace();
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self placeHolderView];
  if (v3)
  {
    char v4 = (void *)v3;
    uint64_t v5 = [(JFXCompositionPlayerViewController *)self playerContainerView];
    [v5 alpha];
    double v7 = v6;

    if (v7 != 0.0)
    {
      id v8 = JFXLog_DebugPlayback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(JFXCompositionPlayerViewController *)self displayName];
        *(_DWORD *)buf = 138543362;
        double v27 = v9;
        _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder removed", buf, 0xCu);
      }
      id v10 = [(JFXCompositionPlayerViewController *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        double v12 = [(JFXCompositionPlayerViewController *)self delegate];
        double v13 = [v12 animationPropertiesForCompositionTransition:self];
      }
      else
      {
        double v13 = 0;
      }
      double v14 = [(JFXCompositionPlayerViewController *)self placeHolderView];
      [(JFXCompositionPlayerViewController *)self setPlaceHolderView:0];
      if (!v13 || ([v13 animationDuration], v15 == 0.0))
      {
        [v14 removeFromSuperview];
      }
      else
      {
        double v16 = [v13 timingParameters];
        if (!v16) {
          double v16 = (void *)[objc_alloc(MEMORY[0x263F1C5A0]) initWithAnimationCurve:0];
        }
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke;
        v23[3] = &unk_264C09F10;
        id v24 = v14;
        id v25 = v13;
        [v25 animationDuration];
        double v18 = v17;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke_2;
        v21[3] = &unk_264C0B400;
        id v22 = v24;
        +[JTAnimation performAnimation:v23 timingParameters:v16 duration:v21 completion:v18 delay:0.0];
      }
    }
  }
  if ([(JFXCompositionPlayerViewController *)self dontRemovePlaceHolderOnDisplay])
  {
    double v19 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = [(JFXCompositionPlayerViewController *)self displayName];
      *(_DWORD *)buf = 138543362;
      double v27 = v20;
      _os_log_impl(&dword_234C41000, v19, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder was unlocked", buf, 0xCu);
    }
  }
  [(JFXCompositionPlayerViewController *)self setDontRemovePlaceHolderOnDisplay:0];
  kdebug_trace();
}

uint64_t __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t result = [*(id *)(a1 + 40) shouldScale];
  if (result)
  {
    CGAffineTransformMakeScale(&v5, 0.6, 0.6);
    uint64_t v3 = *(void **)(a1 + 32);
    CGAffineTransform v4 = v5;
    return [v3 setTransform:&v4];
  }
  return result;
}

uint64_t __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  id v10 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  if (v10)
  {
    CGAffineTransform v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    double v6 = v5;
    if (v5)
    {
      [v5 currentCMTime];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    int v7 = [(JFXCompositionPlayerViewController *)self cachedCurrentTime];
    double v6 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    id v8 = [v6 clipsDataSource];
    CMTimeFromFrameTime(v7, [v8 timeScale], (CMTime *)retstr);
  }

  return result;
}

- (int)currentTime
{
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  if (v3)
  {
    CGAffineTransform v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    int v5 = [v4 currentTime];
  }
  else
  {
    int v5 = [(JFXCompositionPlayerViewController *)self cachedCurrentTime];
  }

  return v5;
}

- (CGSize)renderSizeInPixels
{
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  if (v3)
  {
    CGAffineTransform v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    [v4 renderSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    [(JFXCompositionPlayerViewController *)self cachedRenderSizeInPixels];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int)duration
{
  uint64_t v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  if (v3)
  {
    CGAffineTransform v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    int v5 = [v4 duration];
  }
  else
  {
    int v5 = [(JFXCompositionPlayerViewController *)self cachedDuration];
  }

  return v5;
}

- (void)seekToTime:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  int v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__JFXCompositionPlayerViewController_seekToTime___block_invoke;
  v6[3] = &unk_264C0C900;
  v6[4] = self;
  int v7 = v3;
  [v5 seek:v3 tolerance:0 completion:v6];
}

void __49__JFXCompositionPlayerViewController_seekToTime___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  int v5 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __49__JFXCompositionPlayerViewController_seekToTime___block_invoke_cold_1(a1, a3, v5);
  }
}

- (int)frameRate
{
  v2 = [(JFXCompositionPlayerViewController *)self clipsDataSource];
  int v3 = [v2 frameRate];

  return v3;
}

- (void)setPlaybackTimeChangedObserverInterval:(id *)a3
{
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  long long v5 = *(_OWORD *)&a3->var0;
  self->_playbackTimeChangedObserverInterval.epoch = a3->var3;
  *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = v5;
  double v6 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  [v6 setPlaybackTimeChangedObserverInterval:&v7];
}

- (void)resetPlaybackTimeChangedObserverInterval
{
  int v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  [v3 resetPlaybackTimeChangedObserverInterval];

  memset(&v8, 0, sizeof(v8));
  CGAffineTransform v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  long long v5 = v4;
  if (v4) {
    [v4 playbackTimeChangedObserverInterval];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }

  if (v8.flags)
  {
    CMTime time1 = v8;
    CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    if (CMTimeCompare(&time1, &v6)) {
      self->_playbackTimeChangedObserverInterval = ($95D729B680665BEAEFA1D6FCA8238556)v8;
    }
  }
}

- (void)play
{
}

- (void)playWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  long long v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__JFXCompositionPlayerViewController_playWithCompletionHandler___block_invoke;
  v7[3] = &unk_264C0C928;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 play:v7];
}

void __64__JFXCompositionPlayerViewController_playWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
  if ((a3 & 1) == 0)
  {
    double v9 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [*(id *)(a1 + 32) displayName];
      int v11 = 138543362;
      double v12 = v10;
      _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ Play began", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)isPlaying
{
  v2 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  char v3 = [v2 isPlaying];

  return v3;
}

- (void)pause
{
}

- (void)pauseWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  long long v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__JFXCompositionPlayerViewController_pauseWithCompletionBlock___block_invoke;
  v7[3] = &unk_264C0C950;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 pause:v7];
}

void __63__JFXCompositionPlayerViewController_pauseWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ((a3 & 1) == 0)
  {
    id v7 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) displayName];
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ playback paused", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  [(JFXCompositionPlayerViewController *)self reloadClipDataSourceIfNeeded];
  long long v5 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  [v5 setAudioMuted:v3 completionBlock:0];

  [(JFXCompositionPlayerViewController *)self setCachedMuted:v3];
}

- (BOOL)isMuted
{
  BOOL v3 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
  if (v3)
  {
    id v4 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
    char v5 = [v4 isAudioMuted];
  }
  else
  {
    char v5 = [(JFXCompositionPlayerViewController *)self cachedMuted] != 0;
  }

  return v5;
}

+ (Class)compositionPlayerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldHandleMediaServerCrash
{
  return 1;
}

- (id)playerContainerView
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  char v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)placeholderContainerView
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  char v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)playerViewer
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  char v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)mediaserverdCrashed
{
  uint64_t v3 = JFXPlaybackEventSignpostPointCategory();
  id v4 = v3;
  os_signpost_id_t v5 = JFXSignpostExclusiveID;
  if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_234C41000, v4, OS_SIGNPOST_EVENT, v5, "MediaServerCrash", (const char *)&unk_234D6C482, (uint8_t *)buf, 2u);
  }

  if ([(JFXCompositionPlayerViewController *)self shouldHandleMediaServerCrash])
  {
    [(JFXCompositionPlayerViewController *)self unloadClipDataSourceSetPlaceHolder:1];
    if ([(JFXCompositionPlayerViewController *)self cachedWasPlaying]) {
      [(JFXCompositionPlayerViewController *)self playbackDidStop:0 currentTime:[(JFXCompositionPlayerViewController *)self cachedCurrentTime]];
    }
    objc_initWeak(buf, self);
    dispatch_time_t v6 = dispatch_time(0, 30000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__JFXCompositionPlayerViewController_mediaserverdCrashed__block_invoke;
    block[3] = &unk_264C0B428;
    objc_copyWeak(&v8, buf);
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __57__JFXCompositionPlayerViewController_mediaserverdCrashed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadClipDataSourceIfNeeded];
}

- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatch_time_t v6 = [(JFXCompositionPlayerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(JFXCompositionPlayerViewController *)self clipsDataSource];
    uint64_t v9 = [v8 duration];

    [(JFXCompositionPlayerViewController *)self setCachedDuration:v9];
    [(JFXCompositionPlayerViewController *)self setCachedCurrentTime:v4];
    if ((int)v9 >= (int)v4) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = v9;
    }
    id v10 = [(JFXCompositionPlayerViewController *)self delegate];
    [v10 playbackTimeDidChange:self currentTime:v4];
  }
}

- (void)playbackDidStart:(id)a3
{
  [(JFXCompositionPlayerViewController *)self setCachedWasPlaying:1];
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    [v6 playbackDidStart:self];
  }
}

- (void)playbackDidStop:(id)a3 currentTime:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(JFXCompositionPlayerViewController *)self setCachedWasPlaying:0];
  id v6 = [(JFXCompositionPlayerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(JFXCompositionPlayerViewController *)self delegate];
    [v8 playbackDidStop:self currentTime:v4];
  }
}

- (void)playbackReadyForDisplayChanged:(id)a3 isReady:(BOOL)a4 setPlaceHolder:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a4)
  {
    [(JFXCompositionPlayerViewController *)self renderSizeInPixels];
    -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:");
  }
  [(JFXCompositionPlayerViewController *)self playerBecameReadyForDisplayChanged:v6 setPlaceHolder:v5];
}

- (void)playerWillBeDestroyed:(id)a3
{
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    [v6 updateFromPlayer:0];
  }
}

- (void)playerBecameReadyForDisplayChanged:(BOOL)a3 setPlaceHolder:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v7 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(JFXCompositionPlayerViewController *)self displayName];
    uint64_t v9 = (void *)v8;
    id v10 = @"NO";
    if (v5) {
      id v10 = @"YES";
    }
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    double v21 = v10;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ readyForDisplay changed to %{public}@", (uint8_t *)&v18, 0x16u);
  }
  int v11 = [(JFXCompositionPlayerViewController *)self playerViewer];
  char v12 = [v11 isReadyForDisplay];

  if (v5 && (v12 & 1) == 0)
  {
    uint64_t v13 = JFXLog_playback();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[JFXCompositionPlayerViewController playerBecameReadyForDisplayChanged:setPlaceHolder:](self, v13);
    }

    double v14 = [(JFXCompositionPlayerViewController *)self playerContainerView];
    [v14 setAlpha:0.0];

    goto LABEL_17;
  }
  if (v5) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  double v16 = [(JFXCompositionPlayerViewController *)self playerContainerView];
  [v16 setAlpha:v15];

  if (!v5)
  {
LABEL_17:
    if (v4)
    {
      double v17 = [(JFXCompositionPlayerViewController *)self placeHolderView];

      if (!v17) {
        [(JFXCompositionPlayerViewController *)self preparePlaceHolder];
      }
      [(JFXCompositionPlayerViewController *)self addPlaceHolder];
    }
    return;
  }
  if (![(JFXCompositionPlayerViewController *)self dontRemovePlaceHolderOnDisplay]) {
    [(JFXCompositionPlayerViewController *)self removePlaceHolder];
  }
  [(JFXCompositionPlayerViewController *)self prepareVideoDisplayView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"videoBounds"])
  {
    uint64_t v13 = [(JFXCompositionPlayerViewController *)self playerViewer];
    [v13 videoBounds];
    double v15 = v14;
    double v17 = v16;

    if (v15 != *MEMORY[0x263F001B0] || v17 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      -[JFXCompositionPlayerViewController setLastPlayerViewBoundsSize:](self, "setLastPlayerViewBoundsSize:", v15, v17);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__JFXCompositionPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_264C09FA8;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)JFXCompositionPlayerViewController;
    [(JFXCompositionPlayerViewController *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __85__JFXCompositionPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVideoDisplayViewBounds];
}

- (void)setVideoContentMode:(int64_t)a3
{
  self->_videoContentMode = a3;
  -[JFXCompositionPlayerViewController contentModeToVideoGravity:](self, "contentModeToVideoGravity:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v4 setVideoGravity:v5];
}

- (id)contentModeToVideoGravity:(int64_t)a3
{
  uint64_t v3 = (id *)MEMORY[0x263EF9C68];
  BOOL v4 = (id *)MEMORY[0x263EF9C78];
  if (a3 != 1) {
    BOOL v4 = (id *)MEMORY[0x263EF9C70];
  }
  if (a3 != 2) {
    uint64_t v3 = v4;
  }
  id v5 = *v3;
  return v5;
}

- (CGRect)videoDisplayBounds
{
  v2 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v2 videoBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)prepareVideoDisplayView
{
  double v3 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  [v3 removeFromSuperview];

  if ([(JFXCompositionPlayerViewController *)self disableVideoDisplayGestures])
  {
    id v7 = [(JFXCompositionPlayerViewController *)self view];
    [v7 setUserInteractionEnabled:1];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(JFXCompositionPlayerViewController *)self setVideoDisplayOverlayView:v4];

    uint64_t v5 = [(JFXCompositionPlayerViewController *)self disableVideoDisplayGestures] ^ 1;
    double v6 = [(JFXCompositionPlayerViewController *)self view];
    [v6 setUserInteractionEnabled:v5];

    [(JFXCompositionPlayerViewController *)self updateVideoDisplayViewBounds];
    [(JFXCompositionPlayerViewController *)self installVideoDisplayGestures];
  }
}

- (void)updateVideoDisplayViewBounds
{
  double v3 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v3 videoBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  if (v12)
  {
    double v13 = (void *)v12;
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    BOOL IsNull = CGRectIsNull(v21);

    if (!IsNull)
    {
      double v15 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      objc_msgSend(v15, "setFrame:", v5, v7, v9, v11);

      double v16 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      double v17 = [v16 superview];

      if (!v17)
      {
        id v19 = [(JFXCompositionPlayerViewController *)self view];
        int v18 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
        [v19 addSubview:v18];
      }
    }
  }
}

- (CGSize)playerViewBoundsSize
{
  double v3 = [(JFXCompositionPlayerViewController *)self playerViewer];
  [v3 videoBounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 <= 0.0 || v7 <= 0.0)
  {
    [(JFXCompositionPlayerViewController *)self lastPlayerViewBoundsSize];
  }
  else
  {
    double v8 = v5;
    double v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)convertPointInPlaybackSizeToClipPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(JFXCompositionPlayerViewController *)self playerViewBoundsSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(JFXCompositionPlayerViewController *)self clipsDataSource];
  [v10 renderSize];
  double v12 = v11;
  double v14 = v13;

  double v15 = x * (v12 / v7);
  double v16 = y * (v14 / v9);
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)convertPointInPlaybackSizeToClipPointNormalized:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(JFXCompositionPlayerViewController *)self playerViewBoundsSize];
  double v6 = x / v5;
  double v8 = y / v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumTouchSize
{
  [(JFXCompositionPlayerViewController *)self playerViewBoundsSize];
  double v3 = 44.0 / v2;
  double v5 = 44.0 / v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (void)setDisableVideoDisplayGestures:(BOOL)a3
{
  self->_disableVideoDisplayGestures = a3;
  BOOL v3 = !a3;
  id v4 = [(JFXCompositionPlayerViewController *)self view];
  [v4 setUserInteractionEnabled:v3];
}

- (void)installVideoDisplayGestures
{
  BOOL v3 = [(JFXCompositionPlayerViewController *)self view];
  id v4 = [v3 gestureRecognizers];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v15 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_playbackAreaTapped_];
    [v15 setDelegate:self];
    double v6 = [(JFXCompositionPlayerViewController *)self view];
    [v6 addGestureRecognizer:v15];

    double v7 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_playbackAreaPanned_];
    [v7 setDelegate:self];
    double v8 = [(JFXCompositionPlayerViewController *)self view];
    [v8 addGestureRecognizer:v7];

    double v9 = (void *)[objc_alloc(MEMORY[0x263F1C860]) initWithTarget:self action:sel_playbackAreaPinched_];
    [v9 setDelegate:self];
    double v10 = [(JFXCompositionPlayerViewController *)self view];
    [v10 addGestureRecognizer:v9];

    double v11 = (void *)[objc_alloc(MEMORY[0x263F1C900]) initWithTarget:self action:sel_playbackAreaRotated_];
    [v11 setDelegate:self];
    double v12 = [(JFXCompositionPlayerViewController *)self view];
    [v12 addGestureRecognizer:v11];

    double v13 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_playbackAreaDoubleTapped_];
    [v13 setNumberOfTapsRequired:2];
    double v14 = [(JFXCompositionPlayerViewController *)self view];
    [v14 addGestureRecognizer:v13];
  }
}

- (void)playbackAreaTapped:(id)a3
{
  id v23 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    double v6 = [(JFXCompositionPlayerViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      [v23 locationInView:v8];
      double v10 = v9;
      double v12 = v11;

      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v10, v12);
      double v14 = v13;
      double v16 = v15;
      [(JFXCompositionPlayerViewController *)self normalizedMinimumTouchSize];
      double v18 = v17;
      double v20 = v19;
      CGRect v21 = [(JFXCompositionPlayerViewController *)self delegate];
      uint64_t v22 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
      objc_msgSend(v21, "playbackAreaTapped:normalizedClipPoint:normalizedMinimumSize:atTime:", self, objc_msgSend(v22, "currentTime"), v14, v16, v18, v20);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
  }
  char v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (void)playbackAreaPanned:(id)a3
{
  id v36 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      [v36 locationInView:v8];
      double v10 = v9;
      double v12 = v11;

      double v13 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      [v36 translationInView:v13];
      double v15 = v14;
      double v17 = v16;

      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v10, v12);
      double v19 = v18;
      double v21 = v20;
      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v15, v17);
      double v23 = v22;
      double v25 = v24;
      [(JFXCompositionPlayerViewController *)self normalizedMinimumTouchSize];
      double v27 = v26;
      double v29 = v28;
      uint64_t v30 = [(JFXCompositionPlayerViewController *)self delegate];
      v31 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
      uint64_t v32 = [v31 currentTime];
      uint64_t v33 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
      uint64_t v34 = [v33 clipsDataSource];
      objc_msgSend(v30, "playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:", self, v36, v32, objc_msgSend(v34, "timeScale"), v19, v21, v27, v29, v23, v25);
    }
  }
  CGRect v35 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  objc_msgSend(v36, "setTranslation:inView:", v35, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)playbackAreaPinched:(id)a3
{
  id v44 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(JFXCompositionPlayerViewController *)self playerViewer];
      [v8 videoBounds];
      double v10 = v9;
      double v12 = v11;

      double v13 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;

      if (v10 > 0.0 && v12 > 0.0 && v15 > 0.0 && v17 > 0.0)
      {
        double v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v44, "numberOfTouches"));
        if ([v44 numberOfTouches])
        {
          unint64_t v19 = 0;
          do
          {
            double v20 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
            [v44 locationOfTouch:v19 inView:v20];
            double v22 = v21;
            double v24 = v23;

            -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v22, v24);
            double v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
            [v18 addObject:v25];

            ++v19;
          }
          while (v19 < [v44 numberOfTouches]);
        }
        double v26 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
        [v44 locationInView:v26];
        double v28 = v27;
        double v30 = v29;

        double v31 = v28 / v15;
        double v32 = v30 / v17;
        [(JFXCompositionPlayerViewController *)self normalizedMinimumTouchSize];
        double v34 = v33;
        double v36 = v35;
        v37 = [(JFXCompositionPlayerViewController *)self delegate];
        [v44 scale];
        double v39 = v38;
        v40 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
        uint64_t v41 = [v40 currentTime];
        v42 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
        v43 = [v42 clipsDataSource];
        objc_msgSend(v37, "playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:", self, v44, v18, v41, objc_msgSend(v43, "timeScale"), v31, v32, v34, v36, v39);
      }
    }
  }
  [v44 setScale:1.0];
}

- (void)playbackAreaRotated:(id)a3
{
  id v41 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(JFXCompositionPlayerViewController *)self playerViewer];
      [v8 videoBounds];
      double v10 = v9;
      double v12 = v11;

      double v13 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;

      if (v10 > 0.0 && v12 > 0.0 && v15 > 0.0 && v17 > 0.0)
      {
        double v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v41, "numberOfTouches"));
        if ([v41 numberOfTouches])
        {
          unint64_t v19 = 0;
          do
          {
            double v20 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
            [v41 locationOfTouch:v19 inView:v20];
            double v22 = v21;
            double v24 = v23;

            -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v22, v24);
            double v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
            [v18 addObject:v25];

            ++v19;
          }
          while (v19 < [v41 numberOfTouches]);
        }
        double v26 = [(JFXCompositionPlayerViewController *)self videoDisplayOverlayView];
        [v41 locationInView:v26];
        double v28 = v27;
        double v30 = v29;

        double v31 = v28 / v15;
        double v32 = v30 / v17;
        [(JFXCompositionPlayerViewController *)self normalizedMinimumTouchSize];
        double v34 = v33;
        double v36 = v35;
        v37 = [(JFXCompositionPlayerViewController *)self delegate];
        [v41 rotation];
        double v39 = v38;
        v40 = [(JFXCompositionPlayerViewController *)self clipsPlayer];
        objc_msgSend(v37, "playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:", self, v41, v18, objc_msgSend(v40, "currentTime"), v31, v32, v34, v36, v39);
      }
    }
  }
  [v41 setRotation:0.0];
}

- (void)playbackAreaDoubleTapped:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(JFXCompositionPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(JFXCompositionPlayerViewController *)self delegate];
    [v6 playbackAreaDoubleTapped:v7];
  }
}

- (id)viewToFlash
{
  double v2 = [(JFXCompositionPlayerViewController *)self view];
  BOOL v3 = [v2 superview];
  uint64_t v4 = [v3 superview];
  char v5 = [v4 superview];
  id v6 = [v5 superview];
  id v7 = [v6 superview];
  char v8 = [v7 superview];

  return v8;
}

- (void)beginFlash
{
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"flashViewOnCompositionUpdate"];

  if (v4)
  {
    char v5 = [(JFXCompositionPlayerViewController *)self viewToFlash];
    id v11 = [v5 backgroundColor];

    if (v11)
    {
      id v6 = [MEMORY[0x263F1C550] purpleColor];
      char v7 = [v11 isEqual:v6];

      if ((v7 & 1) == 0)
      {
        [(JFXCompositionPlayerViewController *)self setRestoreToColor:v11];
        char v8 = [MEMORY[0x263F1C550] purpleColor];
        double v9 = [(JFXCompositionPlayerViewController *)self viewToFlash];
        [v9 setBackgroundColor:v8];

        double v10 = [(JFXCompositionPlayerViewController *)self viewToFlash];
        [(JFXCompositionPlayerViewController *)self setViewFlashed:v10];
      }
    }
  }
}

- (void)endFlash
{
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"flashViewOnCompositionUpdate"];

  if (v4)
  {
    char v5 = [(JFXCompositionPlayerViewController *)self viewFlashed];
    id v11 = [v5 backgroundColor];

    id v6 = [(JFXCompositionPlayerViewController *)self restoreToColor];
    if (v6 && v11)
    {
      char v7 = [MEMORY[0x263F1C550] purpleColor];
      int v8 = [v11 isEqual:v7];

      if (v8)
      {
        double v9 = [(JFXCompositionPlayerViewController *)self restoreToColor];
        double v10 = [(JFXCompositionPlayerViewController *)self viewFlashed];
        [v10 setBackgroundColor:v9];

        [(JFXCompositionPlayerViewController *)self setRestoreToColor:0];
        [(JFXCompositionPlayerViewController *)self setViewFlashed:0];
      }
    }
    else
    {
    }
  }
}

- (JFXCompositionPlayerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JFXCompositionPlayerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipsDataSource);
  return (JFXCompositionPlayableElementsDataSource *)WeakRetained;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (BOOL)disableVideoDisplayGestures
{
  return self->_disableVideoDisplayGestures;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1120);
  return self;
}

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (BOOL)isDisplaying
{
  return self->_isDisplaying;
}

- (UIView)videoDisplayOverlayView
{
  return self->_videoDisplayOverlayView;
}

- (void)setVideoDisplayOverlayView:(id)a3
{
}

- (JFXCompositionPlayer)clipsPlayer
{
  return self->_clipsPlayer;
}

- (void)setClipsPlayer:(id)a3
{
}

- (BOOL)dontRemovePlaceHolderOnDisplay
{
  return self->_dontRemovePlaceHolderOnDisplay;
}

- (void)setDontRemovePlaceHolderOnDisplay:(BOOL)a3
{
  self->_dontRemovePlaceHolderOnDispladouble y = a3;
}

- (int)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(int)a3
{
  self->_cachedDuration = a3;
}

- (int)cachedCurrentTime
{
  return self->_cachedCurrentTime;
}

- (void)setCachedCurrentTime:(int)a3
{
  self->_cachedCurrentTime = a3;
}

- (int)cachedMuted
{
  return self->_cachedMuted;
}

- (void)setCachedMuted:(int)a3
{
  self->_cachedMuted = a3;
}

- (BOOL)cachedWasPlaying
{
  return self->_cachedWasPlaying;
}

- (void)setCachedWasPlaying:(BOOL)a3
{
  self->_cachedWasPlaying = a3;
}

- (CGSize)cachedRenderSizeInPixels
{
  double width = self->_cachedRenderSizeInPixels.width;
  double height = self->_cachedRenderSizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedRenderSizeInPixels:(CGSize)a3
{
  self->_cachedRenderSizeInPixels = a3;
}

- (UIView)viewFlashed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewFlashed);
  return (UIView *)WeakRetained;
}

- (void)setViewFlashed:(id)a3
{
}

- (UIColor)restoreToColor
{
  return self->_restoreToColor;
}

- (void)setRestoreToColor:(id)a3
{
}

- (CGSize)lastPlayerViewSize
{
  double width = self->_lastPlayerViewSize.width;
  double height = self->_lastPlayerViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastPlayerViewSize:(CGSize)a3
{
  self->_lastPlayerViewSize = a3;
}

- (CGSize)lastPlayerViewBoundsSize
{
  double width = self->_lastPlayerViewBoundsSize.width;
  double height = self->_lastPlayerViewBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastPlayerViewBoundsSize:(CGSize)a3
{
  self->_lastPlayerViewBoundsSize = a3;
}

- (UIView)placeHolderView
{
  return self->_placeHolderView;
}

- (void)setPlaceHolderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_restoreToColor, 0);
  objc_destroyWeak((id *)&self->_viewFlashed);
  objc_storeStrong((id *)&self->_clipsPlayer, 0);
  objc_storeStrong((id *)&self->_videoDisplayOverlayView, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_clipsDataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)appWillResignActive:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 displayName];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "player %@ resigned active. pause playback and prepare placeholder", (uint8_t *)&v4, 0xCu);
}

void __49__JFXCompositionPlayerViewController_seekToTime___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [*(id *)(a1 + 32) displayName];
  char v7 = @"completed";
  int v8 = *(_DWORD *)(a1 + 40);
  int v9 = 138412802;
  double v10 = v6;
  if (a2) {
    char v7 = @"throttled";
  }
  __int16 v11 = 2112;
  double v12 = v7;
  __int16 v13 = 1024;
  int v14 = v8;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "Player %@ seek %@ for time %d", (uint8_t *)&v9, 0x1Cu);
}

- (void)playerBecameReadyForDisplayChanged:(void *)a1 setPlaceHolder:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 displayName];
  int v4 = 138543362;
  char v5 = v3;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "player %{public}@ reported ready but wasn't really ready", (uint8_t *)&v4, 0xCu);
}

@end