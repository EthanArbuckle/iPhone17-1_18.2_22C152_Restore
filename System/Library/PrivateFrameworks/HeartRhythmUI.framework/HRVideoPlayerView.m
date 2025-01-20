@interface HRVideoPlayerView
+ (Class)layerClass;
+ (HRVideoPlayerView)playerViewWithURL:(id)a3 looping:(BOOL)a4;
- (AVPlayerLooper)playerLooper;
- (AVQueuePlayer)queuePlayer;
- (BOOL)looping;
- (BOOL)preventsDisplaySleepDuringVideoPlayback;
- (BOOL)shouldBePlaying;
- (HRVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5;
- (NSArray)items;
- (NSObject)applicationActiveNotificationStub;
- (NSObject)applicationInactiveNotificationStub;
- (UIImage)thumbnail;
- (UIImageView)thumbnailImageView;
- (id)player;
- (void)_didReceivePlayerNotification:(id)a3;
- (void)_setUpNotifications;
- (void)_setUpUI;
- (void)dealloc;
- (void)pause;
- (void)play;
- (void)setApplicationActiveNotificationStub:(id)a3;
- (void)setApplicationInactiveNotificationStub:(id)a3;
- (void)setItems:(id)a3;
- (void)setLooping:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLooper:(id)a3;
- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3;
- (void)setQueuePlayer:(id)a3;
- (void)setShouldBePlaying:(BOOL)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailImageView:(id)a3;
@end

@implementation HRVideoPlayerView

- (HRVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HRVideoPlayerView;
  v11 = -[HRVideoPlayerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v12->_thumbnail, a4);
    v12->_looping = a5;
    [(HRVideoPlayerView *)v12 _setUpUI];
    [(HRVideoPlayerView *)v12 _setUpNotifications];
  }

  return v12;
}

+ (HRVideoPlayerView)playerViewWithURL:(id)a3 looping:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263EFA8D0];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithURL:v6 options:0];
  v8 = [MEMORY[0x263EFA800] playerItemWithURL:v6];

  objc_msgSend(v7, "hrui_assetSize");
  double v10 = v9;
  double v12 = v11;
  v13 = objc_msgSend(v7, "hrui_thumbnailImage");
  id v14 = objc_alloc((Class)objc_opt_class());
  v19[0] = v8;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v16 = (void *)[v14 initWithItems:v15 thumbnail:v13 looping:v4];

  objc_msgSend(v16, "hrui_constraintAspectRatioFromSize:", v10, v12);
  v17 = [v16 layer];
  [v17 setNeedsDisplayOnBoundsChange:1];

  return (HRVideoPlayerView *)v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v4 = [(HRVideoPlayerView *)self applicationActiveNotificationStub];
  [v3 removeObserver:v4];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = [(HRVideoPlayerView *)self applicationInactiveNotificationStub];
  [v5 removeObserver:v6];

  v7.receiver = self;
  v7.super_class = (Class)HRVideoPlayerView;
  [(HRVideoPlayerView *)&v7 dealloc];
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HRVideoPlayerView *)self queuePlayer];
  [v4 setPreventsDisplaySleepDuringVideoPlayback:v3];
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  v2 = [(HRVideoPlayerView *)self queuePlayer];
  char v3 = [v2 preventsDisplaySleepDuringVideoPlayback];

  return v3;
}

- (void)play
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = NSStringFromSelector(a2);
    int v8 = 138543618;
    double v9 = self;
    __int16 v10 = 2114;
    double v11 = v6;
    _os_log_impl(&dword_220CA3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Playing content", (uint8_t *)&v8, 0x16u);
  }
  objc_super v7 = [(HRVideoPlayerView *)self queuePlayer];
  [v7 play];

  [(HRVideoPlayerView *)self setShouldBePlaying:1];
}

- (void)pause
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = NSStringFromSelector(a2);
    int v8 = 138543618;
    double v9 = self;
    __int16 v10 = 2114;
    double v11 = v6;
    _os_log_impl(&dword_220CA3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Pausing content", (uint8_t *)&v8, 0x16u);
  }
  objc_super v7 = [(HRVideoPlayerView *)self queuePlayer];
  [v7 pause];

  [(HRVideoPlayerView *)self setShouldBePlaying:0];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)player
{
  v2 = [(HRVideoPlayerView *)self layer];
  char v3 = [v2 player];

  return v3;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(HRVideoPlayerView *)self layer];
  [v5 setPlayer:v4];
}

- (void)_setUpUI
{
  char v3 = (void *)MEMORY[0x263EFA860];
  id v4 = [(HRVideoPlayerView *)self items];
  id v5 = [v3 queuePlayerWithItems:v4];
  [(HRVideoPlayerView *)self setQueuePlayer:v5];

  id v6 = [(HRVideoPlayerView *)self queuePlayer];
  [v6 setPreventsDisplaySleepDuringVideoPlayback:0];

  objc_super v7 = (void *)MEMORY[0x263EFA840];
  int v8 = [(HRVideoPlayerView *)self queuePlayer];
  double v9 = [(HRVideoPlayerView *)self items];
  __int16 v10 = [v9 firstObject];
  double v11 = [v7 playerLooperWithPlayer:v8 templateItem:v10];
  [(HRVideoPlayerView *)self setPlayerLooper:v11];

  uint64_t v12 = [(HRVideoPlayerView *)self layer];
  [v12 setShouldRasterize:1];

  v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 scale];
  double v15 = v14;
  v16 = [(HRVideoPlayerView *)self layer];
  [v16 setRasterizationScale:v15];

  v17 = [(HRVideoPlayerView *)self thumbnail];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x263F1C6D0]);
    v19 = [(HRVideoPlayerView *)self thumbnail];
    v20 = (void *)[v18 initWithImage:v19];
    [(HRVideoPlayerView *)self setThumbnailImageView:v20];

    v21 = [(HRVideoPlayerView *)self thumbnailImageView];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(HRVideoPlayerView *)self thumbnailImageView];
    [(HRVideoPlayerView *)self addSubview:v22];

    v23 = [(HRVideoPlayerView *)self layer];
    v24 = [(HRVideoPlayerView *)self thumbnailImageView];
    v25 = [v24 layer];
    [v23 insertSublayer:v25 atIndex:0];

    v26 = [(HRVideoPlayerView *)self thumbnailImageView];
    objc_msgSend(v26, "hk_alignConstraintsWithView:", self);
  }
  if (![(HRVideoPlayerView *)self looping])
  {
    v27 = [(HRVideoPlayerView *)self playerLooper];
    [v27 disableLooping];
  }
  id v28 = [(HRVideoPlayerView *)self queuePlayer];
  [(HRVideoPlayerView *)self setPlayer:v28];
}

- (void)_setUpNotifications
{
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  objc_initWeak(&location, self);
  id v4 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v5 = *MEMORY[0x263F1D038];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__HRVideoPlayerView__setUpNotifications__block_invoke;
  v18[3] = &unk_264581450;
  objc_copyWeak(&v19, &location);
  id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v18];
  [(HRVideoPlayerView *)self setApplicationActiveNotificationStub:v6];

  objc_super v7 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v8 = *MEMORY[0x263F1D0D8];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__HRVideoPlayerView__setUpNotifications__block_invoke_2;
  v16[3] = &unk_264581450;
  objc_copyWeak(&v17, &location);
  double v9 = [v3 addObserverForName:v8 object:0 queue:v7 usingBlock:v16];
  [(HRVideoPlayerView *)self setApplicationInactiveNotificationStub:v9];

  __int16 v10 = [(HRVideoPlayerView *)self queuePlayer];
  double v11 = [v10 currentItem];
  [v3 addObserver:self selector:sel__didReceivePlayerNotification_ name:*MEMORY[0x263EFA0A0] object:v11];

  uint64_t v12 = [(HRVideoPlayerView *)self queuePlayer];
  v13 = [v12 currentItem];
  [v3 addObserver:self selector:sel__didReceivePlayerNotification_ name:*MEMORY[0x263EFA0B8] object:v13];

  double v14 = [(HRVideoPlayerView *)self queuePlayer];
  double v15 = [v14 currentItem];
  [v3 addObserver:self selector:sel__didReceivePlayerNotification_ name:*MEMORY[0x263EFA0E0] object:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __40__HRVideoPlayerView__setUpNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v7 = WeakRetained;
    if ([WeakRetained shouldBePlaying])
    {
      v2 = [v7 queuePlayer];
      [v2 rate];
      float v4 = v3;

      if (v4 < 1.0)
      {
        uint64_t v5 = [v7 queuePlayer];
        [v5 play];
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

void __40__HRVideoPlayerView__setUpNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained queuePlayer];
  [v1 rate];
  float v3 = v2;

  if (v3 > 0.0)
  {
    float v4 = [WeakRetained queuePlayer];
    [v4 pause];
  }
}

- (void)_didReceivePlayerNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v5 object];
    double v9 = [v8 error];
    if (v9)
    {
    }
    else
    {
      __int16 v10 = [v8 errorLog];

      if (!v10) {
        goto LABEL_16;
      }
    }
    double v11 = [v5 name];
    int v12 = [v11 isEqualToString:*MEMORY[0x263EFA0A0]];

    if (!v12)
    {
      id v18 = [v5 name];
      int v19 = [v18 isEqualToString:*MEMORY[0x263EFA0B8]];

      if (v19)
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x263F09920];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        double v14 = v20;
        double v15 = NSStringFromSelector(a2);
        v16 = [v8 error];
        int v25 = 138543874;
        v26 = self;
        __int16 v27 = 2114;
        id v28 = v15;
        __int16 v29 = 2112;
        v30 = v16;
        v21 = "[%{public}@ %{public}@] Playback stalled while playing content with error: %@";
      }
      else
      {
        v22 = [v5 name];
        int v23 = [v22 isEqualToString:*MEMORY[0x263EFA0E0]];

        if (!v23) {
          goto LABEL_16;
        }
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x263F09920];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        double v14 = v24;
        double v15 = NSStringFromSelector(a2);
        v16 = [v8 error];
        int v25 = 138543874;
        v26 = self;
        __int16 v27 = 2114;
        id v28 = v15;
        __int16 v29 = 2112;
        v30 = v16;
        v21 = "[%{public}@ %{public}@] Time jumped while playing content with error: %@";
      }
      _os_log_error_impl(&dword_220CA3000, v14, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v25, 0x20u);
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR))
    {
      double v14 = v13;
      double v15 = NSStringFromSelector(a2);
      v16 = [v8 errorLog];
      id v17 = [v8 error];
      int v25 = 138544130;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = v17;
      _os_log_error_impl(&dword_220CA3000, v14, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to play content, new error log entry %@ with error: %@", (uint8_t *)&v25, 0x2Au);

LABEL_15:
    }
LABEL_16:
  }
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
}

- (AVPlayerLooper)playerLooper
{
  return self->_playerLooper;
}

- (void)setPlayerLooper:(id)a3
{
}

- (BOOL)looping
{
  return self->_looping;
}

- (void)setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (BOOL)shouldBePlaying
{
  return self->_shouldBePlaying;
}

- (void)setShouldBePlaying:(BOOL)a3
{
  self->_shouldBePlaying = a3;
}

- (NSObject)applicationActiveNotificationStub
{
  return self->_applicationActiveNotificationStub;
}

- (void)setApplicationActiveNotificationStub:(id)a3
{
}

- (NSObject)applicationInactiveNotificationStub
{
  return self->_applicationInactiveNotificationStub;
}

- (void)setApplicationInactiveNotificationStub:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInactiveNotificationStub, 0);
  objc_storeStrong((id *)&self->_applicationActiveNotificationStub, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end