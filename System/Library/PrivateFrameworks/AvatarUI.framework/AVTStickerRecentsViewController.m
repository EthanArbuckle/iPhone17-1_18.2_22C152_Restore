@interface AVTStickerRecentsViewController
+ (id)imageStoreWithEnvironment:(id)a3;
+ (id)layoutForSize:(CGSize)a3;
+ (id)stickerCacheWithEnvironment:(id)a3;
+ (id)stickerForRecentItem:(id)a3;
+ (id)stickerRecentsController;
+ (id)stickerRecentsControllerForStore:(id)a3;
- (AVTAvatarRecord)defaultMemoji;
- (AVTAvatarStoreInternal)avatarStore;
- (AVTClippableImageStore)imageStore;
- (AVTResourceCache)cache;
- (AVTSerialTaskScheduler)taskScheduler;
- (AVTStickerConfigurationProvider)configurationProvider;
- (AVTStickerGenerator)stickerGenerator;
- (AVTStickerRecentsItem)buttonItem;
- (AVTStickerRecentsLayout)stickerRecentsLayout;
- (AVTStickerRecentsMigrator)stickerRecentsMigrator;
- (AVTStickerRecentsOverlayView)overlayView;
- (AVTStickerRecentsViewController)initWithAvatarStore:(id)a3 environment:(id)a4;
- (AVTStickerRecentsViewControllerDelegate)delegate;
- (AVTUIEnvironment)environment;
- (AVTUIStickerGeneratorPool)generatorPool;
- (BOOL)hasFetchedDefaultMemoji;
- (BOOL)showPrereleaseSticker;
- (CALayer)edgeMaskLayer;
- (NSArray)displayItems;
- (NSArray)stickerItems;
- (NSObject)avatarStoreChangeObserver;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)recentsWorkQueue;
- (OS_dispatch_queue)renderingQueue;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIEdgeInsets)edgeInsetsForContainerSize:(CGSize)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)placeholderItems;
- (id)recentStickersWithCount:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)beginObservingAvatarStoreChanges;
- (void)buildRecentsItemsWithCompletionBlock:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)determineOverlayTypeWithCompletionBlock:(id)a3;
- (void)dismissOverlayViewAnimated:(BOOL)a3;
- (void)endObservingAvatarStoreChanges;
- (void)fetchDefaultMemojiIfNeeded;
- (void)overlayDidTapCloseButton:(id)a3;
- (void)overlayDidTapContentView:(id)a3;
- (void)overlayDidTapContinueButton:(id)a3;
- (void)recentStickersDidChange:(id)a3;
- (void)setAvatarStoreChangeObserver:(id)a3;
- (void)setButtonItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setConfigurationProvider:(id)a3;
- (void)setDefaultMemoji:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setEdgeMaskLayer:(id)a3;
- (void)setEncodingQueue:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setHasFetchedDefaultMemoji:(BOOL)a3;
- (void)setImageStore:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setRecentsWorkQueue:(id)a3;
- (void)setRenderingQueue:(id)a3;
- (void)setShowPrereleaseSticker:(BOOL)a3;
- (void)setStickerItems:(id)a3;
- (void)setStickerRecentsMigrator:(id)a3;
- (void)setTaskScheduler:(id)a3;
- (void)setupRenderingDependentPieces;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDisplayItems;
- (void)updateItemSizeForContainerSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AVTStickerRecentsViewController

+ (id)layoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [MEMORY[0x263F1C728] emojiGraphicsTraitsForCurrentScreenTraits];
  [v5 minimumInteritemSpacing];
  double v7 = v6;
  double v8 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  v10 = [AVTStickerRecentsLayout alloc];
  if (height == v9 && width == v8 || height < width)
  {
    uint64_t v13 = 4;
    uint64_t v14 = 2;
    double v15 = v7;
    uint64_t v16 = 7;
  }
  else
  {
    uint64_t v13 = 3;
    uint64_t v14 = 3;
    double v15 = v7;
    uint64_t v16 = 8;
  }
  v17 = [(AVTStickerRecentsLayout *)v10 initWithNumberOfItemsPerRow:v13 numberOfItemsPerColumn:v14 interitemPadding:v16 appButtonIndex:1 laysOutVertically:v15];

  return v17;
}

+ (id)stickerForRecentItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 url];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F125C8]);
    double v6 = [v3 url];
    double v7 = [v3 localizedDescription];
    v4 = (void *)[v5 initWithContentsOfFileURL:v6 localizedDescription:v7 error:0];
  }
  return v4;
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    v4 = [v3 stickerImageStoreLocation];
    id v5 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v4 logger:v5];

    AVTUISetFlushStickersCache();
  }
  if (AVTUIStickersCaching())
  {
    double v6 = [AVTInMemoryResourceCache alloc];
    double v7 = [v3 lockProvider];
    double v8 = [v3 logger];
    double v9 = [(AVTInMemoryResourceCache *)v6 initWithLockProvider:v7 totalCostLimit:980000 logger:v8];
  }
  else
  {
    double v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

+ (id)imageStoreWithEnvironment:(id)a3
{
  id v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    v4 = [v3 stickerImageStoreLocation];
    id v5 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v4 logger:v5];

    AVTUISetFlushStickersCache();
  }
  double v6 = +[AVTUIStickerRenderer imageEncoder];
  double v7 = [AVTClippableImageStore alloc];
  double v8 = [v3 coreEnvironment];
  double v9 = [v3 stickerImageStoreLocation];
  v10 = [(AVTImageStore *)v7 initWithEnvironment:v8 validateImages:1 location:v9 encoder:v6];

  return v10;
}

+ (id)stickerRecentsController
{
  id v3 = +[AVTUIEnvironment defaultEnvironment];
  id v4 = objc_alloc((Class)a1);
  id v5 = objc_alloc_init(AVTAvatarStore);
  double v6 = (void *)[v4 initWithAvatarStore:v5 environment:v3];

  return v6;
}

+ (id)stickerRecentsControllerForStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v6 = +[AVTUIEnvironment defaultEnvironment];
  double v7 = (void *)[v5 initWithAvatarStore:v4 environment:v6];

  return v7;
}

- (AVTStickerRecentsViewController)initWithAvatarStore:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerRecentsViewController;
  double v9 = [(AVTStickerRecentsViewController *)&v24 initWithNibName:0 bundle:0];
  if (v9)
  {
    v10 = [AVTStickerRecentsButtonItem alloc];
    v11 = AVTAvatarUIBundle();
    v12 = [v11 localizedStringForKey:@"STICKER_RECENTS_BUTTON_TITLE" value:&stru_26BF058D0 table:@"Localized"];
    uint64_t v13 = [(AVTStickerRecentsButtonItem *)v10 initWithLocalizedDescription:v12];
    buttonItem = v9->_buttonItem;
    v9->_buttonItem = (AVTStickerRecentsItem *)v13;

    objc_storeStrong((id *)&v9->_environment, a4);
    uint64_t v15 = objc_msgSend((id)objc_opt_class(), "layoutForSize:", 50.0, 50.0);
    stickerRecentsLayout = v9->_stickerRecentsLayout;
    v9->_stickerRecentsLayout = (AVTStickerRecentsLayout *)v15;

    uint64_t v17 = [(id)objc_opt_class() imageStoreWithEnvironment:v9->_environment];
    imageStore = v9->_imageStore;
    v9->_imageStore = (AVTClippableImageStore *)v17;

    if (([v7 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v7 format];
    }
    id v19 = v7;
    [v19 setStickerBackendDelegate:v9];
    objc_storeStrong((id *)&v9->_avatarStore, a3);
    uint64_t v20 = [(AVTStickerRecentsViewController *)v9 placeholderItems];
    stickerItems = v9->_stickerItems;
    v9->_stickerItems = (NSArray *)v20;

    [(AVTStickerRecentsViewController *)v9 updateDisplayItems];
    int v22 = AVTUIShowPrereleaseStickerPack_once();
    if (v22) {
      LOBYTE(v22) = AVTUIShowPrereleaseStickerLabel_once();
    }
    v9->_showPrereleaseSticker = v22;
  }
  return v9;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsViewController;
  [(AVTStickerRecentsViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)AVTStickerRecentsViewController;
  [(AVTStickerRecentsViewController *)&v33 viewDidLoad];
  id v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [(AVTStickerRecentsViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x263F1C508]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  double v7 = (double)[(AVTStickerRecentsLayout *)self->_stickerRecentsLayout interitemPadding];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:v7];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumInteritemSpacing:v7];
  id v8 = [(AVTStickerRecentsViewController *)self view];
  [v8 bounds];
  -[AVTStickerRecentsViewController updateItemSizeForContainerSize:](self, "updateItemSizeForContainerSize:", v9, v10);

  v11 = [(AVTStickerRecentsViewController *)self view];
  [v11 bounds];
  -[AVTStickerRecentsViewController edgeInsetsForContainerSize:](self, "edgeInsetsForContainerSize:", v12, v13);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");

  id v14 = objc_alloc(MEMORY[0x263F1C4E0]);
  uint64_t v15 = [(AVTStickerRecentsViewController *)self view];
  [v15 bounds];
  uint64_t v16 = (UICollectionView *)objc_msgSend(v14, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout);
  collectionView = self->_collectionView;
  self->_collectionView = v16;

  v18 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v18];

  [(UICollectionView *)self->_collectionView setScrollEnabled:0];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  id v19 = [(AVTStickerRecentsViewController *)self view];
  [v19 addSubview:self->_collectionView];

  uint64_t v20 = self->_collectionView;
  uint64_t v21 = objc_opt_class();
  int v22 = +[AVTStickerRecentsStickerCollectionViewCell identifier];
  [(UICollectionView *)v20 registerClass:v21 forCellWithReuseIdentifier:v22];

  v23 = self->_collectionView;
  uint64_t v24 = objc_opt_class();
  v25 = +[AVTStickerRecentsButtonCollectionViewCell identifier];
  [(UICollectionView *)v23 registerClass:v24 forCellWithReuseIdentifier:v25];

  v26 = [(AVTUIEnvironment *)self->_environment serialQueueProvider];
  ((void (**)(void, const char *))v26)[2](v26, "com.apple.AvatarUI.StickerRecentsWorkQueue");
  v27 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  recentsWorkQueue = self->_recentsWorkQueue;
  self->_recentsWorkQueue = v27;

  objc_initWeak(&location, self);
  v29 = self->_recentsWorkQueue;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke;
  v30[3] = &unk_263FF09D8;
  objc_copyWeak(&v31, &location);
  dispatch_async(v29, v30);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_263FF0C28;
  objc_copyWeak(&v6, v1);
  [WeakRetained determineOverlayTypeWithCompletionBlock:v5];
  [WeakRetained setupRenderingDependentPieces];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_3;
  v3[3] = &unk_263FF09D8;
  objc_copyWeak(&v4, v1);
  [WeakRetained buildRecentsItemsWithCompletionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    uint64_t v4 = [v3 integerValue];

    if (v4 == 1)
    {
      objc_super v5 = +[AVTStickerRecentsOverlayView overlayViewForMemojiCreation];
    }
    else
    {
      if (v4 == 2) {
        +[AVTStickerRecentsOverlayView disclosureOverlayView];
      }
      else {
      objc_super v5 = +[AVTStickerRecentsOverlayView standardOverlayView];
      }
    }
    id v6 = v5;
    [v5 setDelegate:WeakRetained];
    double v7 = [WeakRetained view];
    [v7 bounds];
    objc_msgSend(v6, "setFrame:");

    [v6 setAutoresizingMask:18];
    id v8 = [WeakRetained view];
    [v8 addSubview:v6];

    [WeakRetained setOverlayView:v6];
    double v9 = [WeakRetained collectionView];
    [v9 setAlpha:0.25];
    id v10 = objc_alloc_init(MEMORY[0x263F157E8]);
    [v10 setShadowRadius:10.0];
    LODWORD(v11) = 1.0;
    [v10 setShadowOpacity:v11];
    objc_msgSend(v10, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    id v12 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v12, "CGColor"));

    double v13 = [WeakRetained collectionView];
    id v14 = [v13 layer];
    [v14 setMask:v10];

    [WeakRetained setEdgeMaskLayer:v10];
  }
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_4;
  block[3] = &unk_263FF09D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __46__AVTStickerRecentsViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginObservingAvatarStoreChanges];
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTStickerRecentsViewController;
  [(AVTStickerRecentsViewController *)&v8 viewDidAppear:a3];
  kdebug_trace();
  if (perfLog_onceToken != -1) {
    dispatch_once(&perfLog_onceToken, &__block_literal_global_8);
  }
  id v3 = perfLog_log;
  if (os_signpost_enabled((os_log_t)perfLog_log))
  {
    *(_WORD *)double v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_20AF1F000, v3, OS_SIGNPOST_INTERVAL_END, 0x33uLL, "recents-bringup", "enableTelemetry=YES", v7, 2u);
  }
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"com.apple.paddlefish.shouldNotifyOnAppear"];

  if (v5)
  {
    id v6 = [MEMORY[0x263F087C8] defaultCenter];
    [v6 postNotificationName:@"PaddlefishRecentsViewDidAppear" object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)setupRenderingDependentPieces
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(AVTUIEnvironment *)self->_environment backgroundRenderingQueue];
  renderingQueue = self->_renderingQueue;
  self->_renderingQueue = v3;

  int v5 = [(AVTUIEnvironment *)self->_environment backgroundEncodingQueue];
  encodingQueue = self->_encodingQueue;
  self->_encodingQueue = v5;

  double v7 = [(id)objc_opt_class() stickerCacheWithEnvironment:self->_environment];
  cache = self->_cache;
  self->_cache = v7;

  if (AVTUIShowPrereleaseStickerPack_once())
  {
    uint64_t v9 = *MEMORY[0x263F29708];
    uint64_t v22 = *MEMORY[0x263F296E8];
    uint64_t v23 = v9;
    id v10 = (void *)MEMORY[0x263EFF8C0];
    double v11 = &v22;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x263F296E8];
    id v10 = (void *)MEMORY[0x263EFF8C0];
    double v11 = &v21;
    uint64_t v12 = 1;
  }
  double v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v21, v22, v23);
  id v14 = [[AVTStickerConfigurationProvider alloc] initWithEnvironment:self->_environment forStickerPacks:v13 stickerConfigurationNames:0];
  configurationProvider = self->_configurationProvider;
  self->_configurationProvider = v14;

  uint64_t v16 = [[AVTStickerRecentsMigrator alloc] initWithStore:self->_avatarStore stickerConfigurationProvider:self->_configurationProvider environment:self->_environment];
  stickerRecentsMigrator = self->_stickerRecentsMigrator;
  self->_stickerRecentsMigrator = v16;

  v18 = [(AVTUIEnvironment *)self->_environment coreEnvironment];
  id v19 = +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:v18];
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v19;
}

- (void)beginObservingAvatarStoreChanges
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F29710];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_263FF0C50;
  objc_copyWeak(&v8, &location);
  int v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained recentsWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_2;
  block[3] = &unk_263FF09D8;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasFetchedDefaultMemoji:0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_3;
  v3[3] = &unk_263FF09D8;
  objc_copyWeak(&v4, v1);
  [WeakRetained buildRecentsItemsWithCompletionBlock:v3];
  objc_destroyWeak(&v4);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_4;
  block[3] = &unk_263FF09D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __67__AVTStickerRecentsViewController_beginObservingAvatarStoreChanges__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (void)endObservingAvatarStoreChanges
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;
}

- (void)fetchDefaultMemojiIfNeeded
{
  if (!self->_hasFetchedDefaultMemoji)
  {
    id v3 = [MEMORY[0x263F29718] requestForCustomAvatarsWithLimit:1];
    avatarStore = self->_avatarStore;
    id v9 = 0;
    id v5 = [(AVTAvatarStoreInternal *)avatarStore avatarsForFetchRequest:v3 error:&v9];
    id v6 = v9;
    double v7 = [v5 firstObject];
    defaultMemoji = self->_defaultMemoji;
    self->_defaultMemoji = v7;

    self->_hasFetchedDefaultMemoji = 1;
  }
}

- (void)determineOverlayTypeWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (AVTUIStickerRecentsShowDisclosureWarning())
  {
    id v5 = &unk_26BF4D310;
  }
  else if (AVTUIHasShownStickerRecentsSplashView() {
         && !AVTUIAlwaysShowRecentStickersSplashScreen_once())
  }
  {
    id v5 = 0;
  }
  else
  {
    id v5 = &unk_26BF4D328;
    if ((AVTUIForceNoMemojiRecentStickersSplashScreen_once() & 1) == 0)
    {
      [(AVTStickerRecentsViewController *)self fetchDefaultMemojiIfNeeded];
      if (self->_defaultMemoji) {
        id v5 = &unk_26BF4D340;
      }
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__AVTStickerRecentsViewController_determineOverlayTypeWithCompletionBlock___block_invoke;
  v7[3] = &unk_263FF02C8;
  id v8 = v5;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __75__AVTStickerRecentsViewController_determineOverlayTypeWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)placeholderItems
{
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[AVTStickerRecentsLayout numberOfItems](self->_stickerRecentsLayout, "numberOfItems") - 1);
  if ([(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItems] >= 2)
  {
    int64_t v4 = 0;
    do
    {
      id v5 = objc_alloc_init(AVTStickerRecentsPlaceholderItem);
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItems] - 1);
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)buildRecentsItemsWithCompletionBlock:(id)a3
{
  int64_t v4 = (void (**)(void))a3;
  [(AVTStickerRecentsMigrator *)self->_stickerRecentsMigrator performMigrationIfNeeded];
  [(AVTStickerRecentsViewController *)self fetchDefaultMemojiIfNeeded];
  if (!self->_generatorPool)
  {
    id v5 = [AVTUIStickerGeneratorPool alloc];
    id v6 = [(AVTUIEnvironment *)self->_environment logger];
    double v7 = [(AVTUIStickerGeneratorPool *)v5 initWithMaxStickerGeneratorCount:1 logger:v6];
    generatorPool = self->_generatorPool;
    self->_generatorPool = v7;
  }
  [(AVTStickerRecentsViewController *)self recentStickersWithCount:8];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__4;
  v62 = __Block_byref_object_dispose__4;
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  id v63 = v44;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  id v57 = 0;
  uint64_t v9 = v59[5];
  id v10 = [(AVTAvatarRecord *)self->_defaultMemoji identifier];
  avatarStore = self->_avatarStore;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke;
  v51[3] = &unk_263FF0C78;
  v51[4] = &v58;
  v51[5] = &v52;
  +[AVTStickerRecentsPresetsProvider filteredAndPaddedStickerRecordsWithRecents:v9 excludingRecords:0 paddingMemojiIdentifier:v10 avatarStore:avatarStore numberOfStickers:8 resultBlock:v51];

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke_2;
  v50[3] = &unk_263FF0CA0;
  v50[4] = self;
  v50[5] = &v58;
  [v44 enumerateObjectsUsingBlock:v50];
  v45 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  v43 = v4;
  unint64_t v12 = 0;
  double v13 = (void *)MEMORY[0x263EF83A0];
  do
  {
    if (v12 >= [(id)v59[5] count]) {
      break;
    }
    id v14 = [(id)v59[5] objectAtIndexedSubscript:v12];
    uint64_t v15 = (void *)v53[5];
    uint64_t v16 = [v14 avatarRecordIdentifier];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];

    configurationProvider = self->_configurationProvider;
    id v19 = [v14 stickerConfigurationIdentifier];
    uint64_t v20 = [(AVTStickerConfigurationProvider *)configurationProvider stickerConfigurationForAvatarRecord:v17 stickerName:v19];

    if (!v20)
    {
      [(AVTStickerRecentsMigrator *)self->_stickerRecentsMigrator setNeedsMigrationOnNextLaunch];
      v40 = [(AVTUIEnvironment *)self->_environment logger];
      v41 = [v14 description];
      [v40 logFetchedRecentStickerWithNoStickerConfiguration:v41];

      v38 = v43;
      goto LABEL_10;
    }
    unint64_t v46 = v12;
    v47 = v14;
    uint64_t v21 = [AVTUIStickerRenderer alloc];
    imageStore = self->_imageStore;
    cache = self->_cache;
    uint64_t v22 = self->_generatorPool;
    environment = self->_environment;
    taskScheduler = self->_taskScheduler;
    renderingQueue = self->_renderingQueue;
    v26 = v17;
    encodingQueue = self->_encodingQueue;
    id v28 = v13;
    v42 = encodingQueue;
    v29 = v26;
    v30 = [(AVTUIStickerRenderer *)v21 initWithAvatarRecord:v26 cache:cache imageStore:imageStore stickerGeneratorPool:v22 environment:environment renderingScheduler:taskScheduler renderingQueue:renderingQueue encodingQueue:v42 callbackQueue:v13];

    id v31 = [(AVTUIStickerRenderer *)v30 scheduledStickerResourceProviderForStickerConfiguration:v20];
    v32 = [AVTStickerRecentsStickerItem alloc];
    objc_super v33 = [v26 identifier];
    v34 = [v20 name];
    v35 = [v20 localizedName];
    v36 = [(AVTStickerRecentsStickerItem *)v32 initWithAvatarIdentifier:v33 stickerName:v34 localizedName:v35 stickerProvider:v31];

    [v45 addObject:v36];
    unint64_t v12 = v46 + 1;
  }
  while (v46 != 7);
  v37 = (NSArray *)[v45 copy];
  v38 = v43;
  stickerItems = self->_stickerItems;
  self->_stickerItems = v37;

  [(AVTStickerRecentsViewController *)self updateDisplayItems];
  if (v43) {
    v43[2](v43);
  }
LABEL_10:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

void __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __72__AVTStickerRecentsViewController_buildRecentsItemsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "containsObject:") & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 992) setNeedsMigrationOnNextLaunch];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 1056) logger];
    uint64_t v7 = [v8 description];
    [v6 logFetchedOrphanedRecentSticker:v7];

    *a4 = 1;
  }
}

- (void)updateDisplayItems
{
  v32[9] = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_stickerItems count])
  {
    id v3 = [(AVTStickerRecentsViewController *)self stickerRecentsLayout];
    uint64_t v4 = [v3 numberOfItems];

    id v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
    if (v4 >= 1)
    {
      for (int64_t i = 0; i != v4; ++i)
      {
        if (i == [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout appButtonIndex])
        {
          [v5 addObject:self->_buttonItem];
        }
        else
        {
          uint64_t v7 = [(NSArray *)self->_stickerItems objectAtIndexedSubscript:i - (i >= [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout appButtonIndex])];
          [v5 addObject:v7];
        }
      }
    }
    if ([(AVTStickerRecentsLayout *)self->_stickerRecentsLayout laysOutVertically])
    {
      if ([(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerRow] == 3
        && [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerColumn] == 3)
      {
        v30 = [v5 objectAtIndexedSubscript:0];
        v32[0] = v30;
        id v8 = [v5 objectAtIndexedSubscript:3];
        v32[1] = v8;
        uint64_t v9 = [v5 objectAtIndexedSubscript:6];
        v32[2] = v9;
        id v10 = [v5 objectAtIndexedSubscript:1];
        v32[3] = v10;
        id v11 = [v5 objectAtIndexedSubscript:4];
        v32[4] = v11;
        unint64_t v12 = [v5 objectAtIndexedSubscript:7];
        v32[5] = v12;
        double v13 = [v5 objectAtIndexedSubscript:2];
        v32[6] = v13;
        id v14 = [v5 objectAtIndexedSubscript:5];
        v32[7] = v14;
        uint64_t v15 = [v5 objectAtIndexedSubscript:8];
        v32[8] = v15;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:9];
        displayItems = self->_displayItems;
        self->_displayItems = v16;
      }
      else
      {
        uint64_t v20 = [v5 objectAtIndexedSubscript:0];
        v31[0] = v20;
        uint64_t v21 = [v5 objectAtIndexedSubscript:2];
        v31[1] = v21;
        uint64_t v22 = [v5 objectAtIndexedSubscript:4];
        v31[2] = v22;
        uint64_t v23 = [v5 objectAtIndexedSubscript:6];
        v31[3] = v23;
        uint64_t v24 = [v5 objectAtIndexedSubscript:1];
        v31[4] = v24;
        v25 = [v5 objectAtIndexedSubscript:3];
        v31[5] = v25;
        v26 = [v5 objectAtIndexedSubscript:5];
        v31[6] = v26;
        v27 = [v5 objectAtIndexedSubscript:7];
        v31[7] = v27;
        id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:8];
        v29 = self->_displayItems;
        self->_displayItems = v28;
      }
    }
    else
    {
      v18 = (NSArray *)[v5 copy];
      id v19 = self->_displayItems;
      self->_displayItems = v18;
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)AVTStickerRecentsViewController;
  [(AVTStickerRecentsViewController *)&v16 viewWillLayoutSubviews];
  id v3 = objc_opt_class();
  uint64_t v4 = [(AVTStickerRecentsViewController *)self view];
  [v4 bounds];
  uint64_t v7 = objc_msgSend(v3, "layoutForSize:", v5, v6);

  if (([v7 isEqual:self->_stickerRecentsLayout] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stickerRecentsLayout, v7);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", (double)[v7 interitemPadding]);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", (double)[v7 interitemPadding]);
    [(AVTStickerRecentsViewController *)self updateDisplayItems];
    id v8 = [(AVTStickerRecentsViewController *)self collectionView];
    [v8 reloadData];
  }
  uint64_t v9 = [(AVTStickerRecentsViewController *)self view];
  [v9 bounds];
  -[AVTStickerRecentsViewController updateItemSizeForContainerSize:](self, "updateItemSizeForContainerSize:", v10, v11);

  [(UICollectionViewFlowLayout *)self->_collectionViewLayout invalidateLayout];
  unint64_t v12 = [(AVTStickerRecentsViewController *)self view];
  [v12 bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

  double v13 = [(AVTStickerRecentsViewController *)self view];
  [v13 bounds];
  -[AVTStickerRecentsViewController edgeInsetsForContainerSize:](self, "edgeInsetsForContainerSize:", v14, v15);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");
}

- (void)viewDidLayoutSubviews
{
  if (self->_edgeMaskLayer)
  {
    [(UICollectionView *)self->_collectionView bounds];
    CGRect v8 = CGRectInset(v7, 10.0, 10.0);
    -[CALayer setFrame:](self->_edgeMaskLayer, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
    [(CALayer *)self->_edgeMaskLayer shadowRadius];
    CGFloat v4 = v3;
    [(CALayer *)self->_edgeMaskLayer bounds];
    CGRect v10 = CGRectInset(v9, v4, v4);
    CGPathRef v5 = CGPathCreateWithRect(v10, 0);
    [(CALayer *)self->_edgeMaskLayer setShadowPath:v5];
    CFRelease(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsViewController;
  [(AVTStickerRecentsViewController *)&v6 viewDidLayoutSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsViewController;
  id v4 = a3;
  [(AVTStickerRecentsViewController *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  objc_super v6 = [(AVTStickerRecentsViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    CGRect v8 = [(AVTStickerRecentsViewController *)self collectionView];
    [v8 reloadData];
  }
}

- (id)recentStickersWithCount:(int64_t)a3
{
  id v4 = [MEMORY[0x263F29760] requestForMostRecentStickersWithResultLimit:a3];
  avatarStore = self->_avatarStore;
  id v11 = 0;
  objc_super v6 = [(AVTAvatarStoreInternal *)avatarStore recentStickersForFetchRequest:v4 error:&v11];
  id v7 = v11;
  if (v7)
  {
    CGRect v8 = [(AVTUIEnvironment *)self->_environment logger];
    objc_super v9 = [v7 localizedDescription];
    [v8 logErrorFetchingRecentStickers:v9];
  }
  return v6;
}

- (void)dismissOverlayViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((AVTUIHasShownStickerRecentsSplashView() & 1) == 0) {
    AVTUISetHasShownStickerRecentsSplashView();
  }
  uint64_t v5 = self->_collectionView;
  objc_super v6 = self->_overlayView;
  id v7 = self->_edgeMaskLayer;
  overlayView = self->_overlayView;
  self->_overlayView = 0;

  edgeMaskLayer = self->_edgeMaskLayer;
  self->_edgeMaskLayer = 0;

  if (v3)
  {
    [(CALayer *)v7 shadowRadius];
    double v11 = v10;
    [(CALayer *)v7 bounds];
    CGRect v21 = CGRectInset(v20, -v11, -v11);
    CGPathRef v12 = CGPathCreateWithRect(v21, 0);
    double v13 = [MEMORY[0x263F15760] animationWithKeyPath:@"shadowPath"];
    objc_msgSend(v13, "setFromValue:", -[CALayer shadowPath](v7, "shadowPath"));
    [v13 setToValue:v12];
    CFRelease(v12);
    [v13 setDuration:1.0];
    [v13 setRemovedOnCompletion:0];
    [v13 setFillMode:*MEMORY[0x263F15AB0]];
    [(CALayer *)v7 addAnimation:v13 forKey:@"fadeAnimation"];
    [(AVTStickerRecentsOverlayView *)v6 dismissAnimatedWithDuration:1.0];
    double v14 = (void *)MEMORY[0x263F1CB60];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke;
    v18[3] = &unk_263FF03D8;
    id v19 = v5;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke_2;
    v15[3] = &unk_263FF0478;
    objc_super v16 = v6;
    uint64_t v17 = v7;
    [v14 animateWithDuration:v18 animations:v15 completion:1.0];
  }
  else
  {
    [(UICollectionView *)v5 setAlpha:1.0];
    [(AVTStickerRecentsOverlayView *)v6 removeFromSuperview];
    [(CALayer *)v7 removeFromSuperlayer];
  }
}

uint64_t __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __62__AVTStickerRecentsViewController_dismissOverlayViewAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperlayer];
}

- (void)updateItemSizeForContainerSize:(CGSize)a3
{
  if (a3.width != 0.0)
  {
    double height = a3.height;
    if (a3.height != 0.0)
    {
      double width = a3.width;
      uint64_t v6 = [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerRow];
      uint64_t v7 = [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerColumn];
      uint64_t v8 = [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout interitemPadding];
      double v9 = floor((width - (double)v8 * (double)(v6 - 1)) / (double)v6);
      double v10 = floor((height - (double)v8 * (double)(v7 - 1)) / (double)v7);
      if (v10 >= v9) {
        double v10 = v9;
      }
      collectionViewLayout = self->_collectionViewLayout;
      -[UICollectionViewFlowLayout setItemSize:](collectionViewLayout, "setItemSize:", v10, v10);
    }
  }
}

- (UIEdgeInsets)edgeInsetsForContainerSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    double v14 = *MEMORY[0x263F1D1C0];
    double v13 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v15 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v16 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  else
  {
    double width = a3.width;
    uint64_t v6 = [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerRow];
    uint64_t v7 = [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItemsPerColumn];
    double v8 = (double)[(AVTStickerRecentsLayout *)self->_stickerRecentsLayout interitemPadding];
    [(UICollectionViewFlowLayout *)self->_collectionViewLayout itemSize];
    double v10 = (double)(v6 - 1) * v8 + v9 * (double)v6;
    [(UICollectionViewFlowLayout *)self->_collectionViewLayout itemSize];
    double v12 = (double)(v7 - 1) * v8 + v11 * (double)v7;
    double v13 = fmax(floor((width - v10) * 0.5), 0.0);
    double v14 = fmax(floor((height - v12) * 0.5), 0.0);
    double v15 = v14;
    double v16 = v13;
  }
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  NSUInteger v5 = [(NSArray *)self->_displayItems count];
  if (v5 != [(AVTStickerRecentsLayout *)self->_stickerRecentsLayout numberOfItems]) {
    return 0;
  }
  stickerRecentsLayout = self->_stickerRecentsLayout;
  return [(AVTStickerRecentsLayout *)stickerRecentsLayout numberOfItems];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  displayItems = self->_displayItems;
  id v7 = a4;
  id v8 = a3;
  double v9 = -[NSArray objectAtIndexedSubscript:](displayItems, "objectAtIndexedSubscript:", [v7 row]);
  double v10 = [v9 cellIdentifier];
  double v11 = [v8 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];

  double v12 = [MEMORY[0x263F08C38] UUID];
  [v11 setDisplaySessionUUID:v12];
  double v13 = [v9 image];

  if (v13)
  {
    double v14 = [v9 image];
    [v11 updateWithImage:v14];

    if ([(AVTStickerRecentsViewController *)self showPrereleaseSticker])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v11, "setShowPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
      }
    }
  }
  else
  {
    double v15 = [v9 provider];

    if (v15)
    {
      double v16 = [v9 provider];
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      CGRect v21 = __73__AVTStickerRecentsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
      uint64_t v22 = &unk_263FF0CC8;
      id v23 = v11;
      id v24 = v12;
      id v25 = v9;
      v26 = self;
      uint64_t v17 = ((void (**)(void, uint64_t *, void))v16)[2](v16, &v19, 0);

      if (v17) {
        -[AVTSerialTaskScheduler scheduleTask:](self->_taskScheduler, "scheduleTask:", v17, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  return v11;
}

void __73__AVTStickerRecentsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [*(id *)(a1 + 32) displaySessionUUID];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    NSUInteger v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v9 image];
    [v5 updateWithImage:v6];

    id v7 = [v9 image];
    [*(id *)(a1 + 48) setImage:v7];

    id v8 = [v9 URL];
    [*(id *)(a1 + 48) setUrl:v8];

    if ([*(id *)(a1 + 56) showPrereleaseSticker])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(*(id *)(a1 + 48), "setPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
        objc_msgSend(*(id *)(a1 + 32), "setShowPrereleaseSticker:", objc_msgSend(v9, "isPrereleaseSticker"));
      }
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_displayItems, "objectAtIndexedSubscript:", [v7 row]);
  id v8 = (AVTStickerRecentsItem *)objc_claimAutoreleasedReturnValue();
  id v9 = self->_environment;
  double v10 = v9;
  if (v8 == self->_buttonItem)
  {
    CGRect v21 = [(AVTUIEnvironment *)v9 usageTrackingSession];
    [v21 didOpenStickersAppFromRecents];

    double v12 = [(AVTStickerRecentsViewController *)self delegate];
    [v12 stickerRecentsControllerDidTapAppButton:self];
    goto LABEL_5;
  }
  uint64_t v11 = [(id)objc_opt_class() stickerForRecentItem:v8];
  if (v11)
  {
    double v12 = (void *)v11;
    double v13 = [(AVTStickerRecentsViewController *)self delegate];
    [v13 stickerRecentsController:self didTapSticker:v12];

    double v14 = v8;
    double v15 = [(AVTUIEnvironment *)v10 usageTrackingSession];
    double v16 = [(AVTStickerRecentsItem *)v14 stickerName];
    uint64_t v17 = [(AVTStickerRecentsItem *)v14 avatarIdentifier];
    [v15 didTapStickerFromRecents:v16 withAvatarIdentifier:v17];

    avatarStore = self->_avatarStore;
    uint64_t v19 = [(AVTStickerRecentsItem *)v14 avatarIdentifier];
    uint64_t v20 = [(AVTStickerRecentsItem *)v14 stickerName];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __75__AVTStickerRecentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v22[3] = &unk_263FF0CF0;
    id v23 = v10;
    [(AVTAvatarStoreInternal *)avatarStore didUseStickerWithAvatarIdentifier:v19 stickerIdentifier:v20 completionHandler:v22];

LABEL_5:
    [v6 deselectItemAtIndexPath:v7 animated:1];
  }
}

void __75__AVTStickerRecentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v7 = [v4 logger];
    id v6 = [v5 localizedDescription];

    [v7 logErrorSavingRecentSticker:v6];
  }
}

- (void)recentStickersDidChange:(id)a3
{
  objc_initWeak(&location, self);
  recentsWorkQueue = self->_recentsWorkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke;
  v5[3] = &unk_263FF09D8;
  objc_copyWeak(&v6, &location);
  dispatch_async(recentsWorkQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_2;
  v3[3] = &unk_263FF09D8;
  objc_copyWeak(&v4, v1);
  [WeakRetained buildRecentsItemsWithCompletionBlock:v3];
  objc_destroyWeak(&v4);
}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_3;
  block[3] = &unk_263FF09D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __59__AVTStickerRecentsViewController_recentStickersDidChange___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (void)overlayDidTapContentView:(id)a3
{
}

- (void)overlayDidTapCloseButton:(id)a3
{
}

- (void)overlayDidTapContinueButton:(id)a3
{
  id v4 = [(AVTStickerRecentsViewController *)self delegate];
  [v4 stickerRecentsControllerDidRequestMemojiEditor:self];

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AVTStickerRecentsViewController_overlayDidTapContinueButton___block_invoke;
  block[3] = &unk_263FF03D8;
  void block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __63__AVTStickerRecentsViewController_overlayDidTapContinueButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissOverlayViewAnimated:0];
}

- (AVTStickerRecentsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTStickerRecentsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTStickerRecentsMigrator)stickerRecentsMigrator
{
  return self->_stickerRecentsMigrator;
}

- (void)setStickerRecentsMigrator:(id)a3
{
}

- (AVTStickerRecentsOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
}

- (BOOL)hasFetchedDefaultMemoji
{
  return self->_hasFetchedDefaultMemoji;
}

- (void)setHasFetchedDefaultMemoji:(BOOL)a3
{
  self->_hasFetchedDefaultMemojint64_t i = a3;
}

- (AVTAvatarRecord)defaultMemoji
{
  return self->_defaultMemoji;
}

- (void)setDefaultMemoji:(id)a3
{
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTStickerGenerator)stickerGenerator
{
  return self->_stickerGenerator;
}

- (OS_dispatch_queue)recentsWorkQueue
{
  return self->_recentsWorkQueue;
}

- (void)setRecentsWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setRenderingQueue:(id)a3
{
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (void)setEncodingQueue:(id)a3
{
}

- (AVTStickerConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
}

- (AVTSerialTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
}

- (AVTStickerRecentsLayout)stickerRecentsLayout
{
  return self->_stickerRecentsLayout;
}

- (AVTStickerRecentsItem)buttonItem
{
  return self->_buttonItem;
}

- (void)setButtonItem:(id)a3
{
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void)setStickerItems:(id)a3
{
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  self->_showPrereleaseSticker = a3;
}

- (CALayer)edgeMaskLayer
{
  return self->_edgeMaskLayer;
}

- (void)setEdgeMaskLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeMaskLayer, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_stickerRecentsLayout, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_recentsWorkQueue, 0);
  objc_storeStrong((id *)&self->_stickerGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_defaultMemoji, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end