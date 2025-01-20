@interface HKVideoPlayerView
+ (Class)layerClass;
+ (id)playerViewWithURL:(id)a3 looping:(BOOL)a4;
- (AVPlayerLooper)playerLooper;
- (AVQueuePlayer)queuePlayer;
- (BOOL)looping;
- (BOOL)preventsDisplaySleepDuringVideoPlayback;
- (BOOL)shouldBePlaying;
- (HKVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5;
- (NSArray)items;
- (NSObject)applicationActiveNotificationStub;
- (NSObject)applicationInactiveNotificationStub;
- (UIImage)thumbnail;
- (UIImageView)thumbnailImageView;
- (id)player;
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

@implementation HKVideoPlayerView

- (HKVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKVideoPlayerView;
  v11 = -[HKVideoPlayerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v12->_thumbnail, a4);
    v12->_looping = a5;
    [(HKVideoPlayerView *)v12 _setUpUI];
    [(HKVideoPlayerView *)v12 _setUpNotifications];
  }

  return v12;
}

+ (id)playerViewWithURL:(id)a3 looping:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F166C8];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithURL:v6 options:0];
  v8 = [MEMORY[0x1E4F16620] playerItemWithURL:v6];

  objc_msgSend(v7, "hk_assetSize");
  double v10 = v9;
  double v12 = v11;
  v13 = objc_msgSend(v7, "hk_thumbnailImage");
  id v14 = objc_alloc((Class)objc_opt_class());
  v19[0] = v8;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16 = (void *)[v14 initWithItems:v15 thumbnail:v13 looping:v4];

  objc_msgSend(v16, "hk_constraintAspectRatioFromSize:", v10, v12);
  v17 = [v16 layer];
  [v17 setNeedsDisplayOnBoundsChange:1];

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v4 = [(HKVideoPlayerView *)self applicationActiveNotificationStub];
  [v3 removeObserver:v4];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [(HKVideoPlayerView *)self applicationInactiveNotificationStub];
  [v5 removeObserver:v6];

  v7.receiver = self;
  v7.super_class = (Class)HKVideoPlayerView;
  [(HKVideoPlayerView *)&v7 dealloc];
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HKVideoPlayerView *)self queuePlayer];
  [v4 setPreventsDisplaySleepDuringVideoPlayback:v3];
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  v2 = [(HKVideoPlayerView *)self queuePlayer];
  char v3 = [v2 preventsDisplaySleepDuringVideoPlayback];

  return v3;
}

- (void)play
{
  char v3 = [(HKVideoPlayerView *)self queuePlayer];
  [v3 play];

  [(HKVideoPlayerView *)self setShouldBePlaying:1];
}

- (void)pause
{
  char v3 = [(HKVideoPlayerView *)self queuePlayer];
  [v3 pause];

  [(HKVideoPlayerView *)self setShouldBePlaying:0];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)player
{
  v2 = [(HKVideoPlayerView *)self layer];
  char v3 = [v2 player];

  return v3;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(HKVideoPlayerView *)self layer];
  [v5 setPlayer:v4];
}

- (void)_setUpUI
{
  char v3 = (void *)MEMORY[0x1E4F16670];
  id v4 = [(HKVideoPlayerView *)self items];
  id v5 = [v3 queuePlayerWithItems:v4];
  [(HKVideoPlayerView *)self setQueuePlayer:v5];

  id v6 = [(HKVideoPlayerView *)self queuePlayer];
  [v6 setPreventsDisplaySleepDuringVideoPlayback:0];

  objc_super v7 = (void *)MEMORY[0x1E4F16658];
  v8 = [(HKVideoPlayerView *)self queuePlayer];
  double v9 = [(HKVideoPlayerView *)self items];
  double v10 = [v9 firstObject];
  double v11 = [v7 playerLooperWithPlayer:v8 templateItem:v10];
  [(HKVideoPlayerView *)self setPlayerLooper:v11];

  double v12 = [(HKVideoPlayerView *)self layer];
  [v12 setShouldRasterize:1];

  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v14;
  v16 = [(HKVideoPlayerView *)self layer];
  [v16 setRasterizationScale:v15];

  v17 = [(HKVideoPlayerView *)self thumbnail];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
    v19 = [(HKVideoPlayerView *)self thumbnail];
    v20 = (void *)[v18 initWithImage:v19];
    [(HKVideoPlayerView *)self setThumbnailImageView:v20];

    v21 = [(HKVideoPlayerView *)self thumbnailImageView];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(HKVideoPlayerView *)self thumbnailImageView];
    [(HKVideoPlayerView *)self insertSubview:v22 atIndex:0];

    v23 = [(HKVideoPlayerView *)self thumbnailImageView];
    objc_msgSend(v23, "hk_alignConstraintsWithView:", self);
  }
  if (![(HKVideoPlayerView *)self looping])
  {
    v24 = [(HKVideoPlayerView *)self playerLooper];
    [v24 disableLooping];
  }
  id v25 = [(HKVideoPlayerView *)self queuePlayer];
  [(HKVideoPlayerView *)self setPlayer:v25];
}

- (void)_setUpNotifications
{
  objc_initWeak(&location, self);
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v5 = *MEMORY[0x1E4FB2628];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__HKVideoPlayerView__setUpNotifications__block_invoke;
  v13[3] = &unk_1E6D53240;
  objc_copyWeak(&v14, &location);
  id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v13];
  [(HKVideoPlayerView *)self setApplicationActiveNotificationStub:v6];

  objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v9 = *MEMORY[0x1E4FB2738];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__HKVideoPlayerView__setUpNotifications__block_invoke_2;
  v11[3] = &unk_1E6D53240;
  objc_copyWeak(&v12, &location);
  double v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v11];
  [(HKVideoPlayerView *)self setApplicationInactiveNotificationStub:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __40__HKVideoPlayerView__setUpNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id WeakRetained = (id)[WeakRetained shouldBePlaying];
    id v2 = v8;
    if (WeakRetained)
    {
      char v3 = [v8 queuePlayer];
      [v3 rate];
      float v5 = v4;

      id v2 = v8;
      if (v5 < 1.0)
      {
        id v6 = [v8 queuePlayer];
        [v6 play];

        id v2 = v8;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

void __40__HKVideoPlayerView__setUpNotifications__block_invoke_2(uint64_t a1)
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