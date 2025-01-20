@interface AVTFunCamAvatarPickerController
+ (id)createClippingViewForSize:(CGSize)a3;
+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4;
+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4 allowsCreation:(BOOL)a5;
+ (id)itemsFromRecords:(id)a3;
+ (id)newGridLayout;
+ (id)sessionProviderWithEnvironment:(id)a3 delegate:(id)a4;
- (AVTAvatarListImageItem)noneItem;
- (AVTAvatarPickerDelegate)avatarPickerDelegate;
- (AVTAvatarRecord)selectedAvatarRecord;
- (AVTAvatarStoreInternal)store;
- (AVTCenteringCollectionViewDelegate)centeringDelegate;
- (AVTFunCamAvatarPickerCollectionViewLayout)listLayout;
- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5;
- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5 allowsCreation:(BOOL)a6;
- (AVTFunCamAvatarPickerStyle)style;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRenderingScope)editableRecordsListRenderingScope;
- (AVTRenderingScope)gridRenderingScope;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (BOOL)allowsCreation;
- (BOOL)canCreateAvatar;
- (BOOL)isDisplayingGridLayout;
- (CGRect)lastUpdateViewBounds;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)gridItemSize;
- (NSArray)editableRecords;
- (NSArray)items;
- (NSArray)puppetRecords;
- (NSObject)changeNotificationToken;
- (UICollectionView)collectionView;
- (UICollectionView)titlesCollectionView;
- (UICollectionViewFlowLayout)gridLayout;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIView)titlesClippingView;
- (UIView)titlesContainer;
- (_AVTAvatarRecordImageProvider)imageProvider;
- (id)buildCollectionViewLayout;
- (id)buildTitlesCollectionViewLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForNoneItem;
- (id)selectedIndexPath;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indexForRecord:(id)a3;
- (int64_t)indexForRecordIdentifier:(id)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)mode;
- (void)buildCollectionView;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)preloadAll;
- (void)reloadData;
- (void)reloadModel;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)selectItemAtCenterNotifyDelegate:(BOOL)a3;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)selectItemForAvatarRecord:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)sendSelectionEventToDelegateForItemAtIndexPath:(id)a3;
- (void)sessionProviderDidEndCameraSession:(id)a3;
- (void)sessionProviderWillStartCameraSession:(id)a3;
- (void)setAllowsCreation:(BOOL)a3;
- (void)setAvatarPickerDelegate:(id)a3;
- (void)setCenteringDelegate:(id)a3;
- (void)setChangeNotificationToken:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setEditableRecords:(id)a3;
- (void)setGridLayout:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastUpdateViewBounds:(CGRect)a3;
- (void)setListLayout:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNoneItem:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setPuppetRecords:(id)a3;
- (void)setSelectedAvatarRecord:(id)a3;
- (void)setStore:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTitlesClippingView:(id)a3;
- (void)setTitlesCollectionView:(id)a3;
- (void)setTitlesContainer:(id)a3;
- (void)startObservingChangesIfNeeded;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitlesClippingViewMask;
- (void)updateViewForCurrentMode;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AVTFunCamAvatarPickerController

+ (id)itemsFromRecords:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [AVTAvatarListRecordItem alloc];
        v12 = -[AVTAvatarListRecordItem initWithAvatar:](v11, "initWithAvatar:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)newGridLayout
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C508]);
  [v2 setScrollDirection:0];
  [v2 setMinimumInteritemSpacing:0.0];
  [v2 setMinimumLineSpacing:0.0];
  return v2;
}

+ (id)sessionProviderWithEnvironment:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[AVTViewSessionProvider backingSizeForEnvironment:v6];
  double v8 = v7;
  double v10 = v9;
  v11 = +[AVTViewSessionProvider creatorForAVTView];
  v12 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v11, v6, v8, v10);

  [(AVTViewSessionProvider *)v12 setDelegate:v5];
  return v12;
}

+ (id)createClippingViewForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *MEMORY[0x263F001A8], v6, a3.width, a3.height);
  [v7 setUserInteractionEnabled:0];
  double v8 = -[AVTGradientView initWithFrame:]([AVTGradientView alloc], "initWithFrame:", v5, v6, width, height);
  [(AVTGradientView *)v8 setAutoresizingMask:18];
  [v7 addSubview:v8];

  return v7;
}

+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[AVTUIEnvironment createFunCamEnvironment];
  double v8 = [[AVTFunCamAvatarPickerController alloc] initWithStore:v6 environment:v7 style:v5];

  return v8;
}

+ (id)funCamAvatarPickerControllerForStore:(id)a3 style:(id)a4 allowsCreation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  double v9 = +[AVTUIEnvironment createFunCamEnvironment];
  double v10 = [[AVTFunCamAvatarPickerController alloc] initWithStore:v8 environment:v9 style:v7 allowsCreation:v5];

  return v10;
}

- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5
{
  return [(AVTFunCamAvatarPickerController *)self initWithStore:a3 environment:a4 style:a5 allowsCreation:0];
}

- (AVTFunCamAvatarPickerController)initWithStore:(id)a3 environment:(id)a4 style:(id)a5 allowsCreation:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)AVTFunCamAvatarPickerController;
  long long v14 = [(AVTFunCamAvatarPickerController *)&v24 initWithNibName:0 bundle:0];
  if (v14)
  {
    if (([v11 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v11 format];
    }
    objc_storeStrong((id *)&v14->_store, a3);
    uint64_t v15 = [v12 logger];
    logger = v14->_logger;
    v14->_logger = (AVTUILogger *)v15;

    long long v17 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v12];
    imageProvider = v14->_imageProvider;
    v14->_imageProvider = v17;

    uint64_t v19 = +[AVTRenderingScope funCamCarouselThumbnailScope];
    editableRecordsListRenderingScope = v14->_editableRecordsListRenderingScope;
    v14->_editableRecordsListRenderingScope = (AVTRenderingScope *)v19;

    uint64_t v21 = +[AVTRenderingScope gridThumbnailScope];
    gridRenderingScope = v14->_gridRenderingScope;
    v14->_gridRenderingScope = (AVTRenderingScope *)v21;

    objc_storeStrong((id *)&v14->_environment, a4);
    objc_storeStrong((id *)&v14->_style, a5);
    v14->_allowsCreation = a6;
    [(AVTFunCamAvatarPickerController *)v14 preloadAll];
    [(AVTFunCamAvatarPickerController *)v14 reloadModel];
  }

  return v14;
}

- (BOOL)isDisplayingGridLayout
{
  return [(AVTFunCamAvatarPickerController *)self mode] == 1;
}

- (id)selectedIndexPath
{
  id v3 = [(AVTFunCamAvatarPickerController *)self selectedAvatarRecord];

  if (!v3
    || ([(AVTFunCamAvatarPickerController *)self selectedAvatarRecord],
        v4 = objc_claimAutoreleasedReturnValue(),
        int64_t v5 = [(AVTFunCamAvatarPickerController *)self indexForRecord:v4],
        v4,
        v5 == 0x7FFFFFFFFFFFFFFFLL)
    || ([MEMORY[0x263F088C8] indexPathForItem:v5 inSection:0],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [(AVTFunCamAvatarPickerController *)self indexPathForNoneItem];
  }
  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  id v5 = (id)objc_msgSend(v3, "initWithFrame:");

  [(AVTFunCamAvatarPickerController *)self setView:v5];
  [(AVTFunCamAvatarPickerController *)self buildCollectionView];
  [(AVTFunCamAvatarPickerController *)self updateViewForCurrentMode];
}

- (void)preloadAll
{
  if (AVTUIAvatarPreLoadOnLaunch())
  {
    id v3 = (void *)MEMORY[0x263F29730];
    id v4 = [(AVTFunCamAvatarPickerController *)self store];
    [v3 preloadAllAvatarsWithStore:v4 completionHandler:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTFunCamAvatarPickerController;
  [(AVTFunCamAvatarPickerController *)&v7 traitCollectionDidChange:a3];
  if ([(AVTFunCamAvatarPickerController *)self isViewLoaded])
  {
    id v4 = [(AVTFunCamAvatarPickerController *)self collectionView];
    id v5 = [v4 visibleCells];

    if (v5)
    {
      id v6 = [(AVTFunCamAvatarPickerController *)self collectionView];
      [v6 reloadData];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerController;
  [(AVTFunCamAvatarPickerController *)&v5 viewDidLayoutSubviews];
  id v3 = [(AVTFunCamAvatarPickerController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)AVTFunCamAvatarPickerController;
  [(AVTFunCamAvatarPickerController *)&v17 viewWillLayoutSubviews];
  [(AVTFunCamAvatarPickerController *)self lastUpdateViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(AVTFunCamAvatarPickerController *)self view];
  [v11 bounds];
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.double width = v14;
  v19.size.double height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  BOOL v16 = CGRectEqualToRect(v18, v19);

  if (!v16) {
    [(AVTFunCamAvatarPickerController *)self updateViewForCurrentMode];
  }
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if ([(AVTFunCamAvatarPickerController *)self isViewLoaded])
    {
      [(AVTFunCamAvatarPickerController *)self updateViewForCurrentMode];
    }
  }
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self collectionView];
  if (v4)
  {
    double v5 = (void *)v4;
    int v6 = [(AVTFunCamAvatarPickerController *)self isViewLoaded];

    if (v6)
    {
      double v7 = [(AVTFunCamAvatarPickerController *)self buildCollectionViewLayout];
      [(AVTFunCamAvatarPickerController *)self setListLayout:v7];

      CGFloat v8 = [(AVTFunCamAvatarPickerController *)self listLayout];
      double v9 = [(AVTFunCamAvatarPickerController *)self collectionView];
      [v9 setCollectionViewLayout:v8];

      CGFloat v10 = [(AVTFunCamAvatarPickerController *)self buildTitlesCollectionViewLayout];
      id v11 = [(AVTFunCamAvatarPickerController *)self titlesCollectionView];
      [v11 setCollectionViewLayout:v10];

      [(AVTFunCamAvatarPickerController *)self updateViewForCurrentMode];
    }
  }
}

- (id)buildCollectionViewLayout
{
  double v3 = [AVTEngagementLayout alloc];
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self style];
  [v4 cellSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(AVTFunCamAvatarPickerController *)self style];
  [v9 engagedCellSize];
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = [(AVTFunCamAvatarPickerController *)self style];
  [v14 interitemSpacing];
  BOOL v16 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:](v3, "initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:", v6, v8, v11, v13, v15);

  objc_super v17 = [(AVTEngagementListCollectionViewLayout *)[AVTFunCamAvatarPickerCollectionViewLayout alloc] initWithEngagementLayout:v16];
  return v17;
}

- (id)buildTitlesCollectionViewLayout
{
  double v3 = [AVTEngagementLayout alloc];
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self style];
  [v4 cellSize];
  double v6 = v5;
  double v7 = [(AVTFunCamAvatarPickerController *)self style];
  [v7 engagedCellSize];
  double v9 = v8;
  double v10 = [(AVTFunCamAvatarPickerController *)self style];
  [v10 engagedCellSize];
  double v12 = v11;
  double v14 = v13;
  double v15 = [(AVTFunCamAvatarPickerController *)self style];
  [v15 interitemSpacing];
  objc_super v17 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:](v3, "initWithDefaultCellSize:engagedCellSize:baseInteritemSpacing:", v6, v9, v12, v14, v16);

  CGRect v18 = [(AVTEngagementListCollectionViewLayout *)[AVTFunCamAvatarPickerCollectionViewLayout alloc] initWithEngagementLayout:v17];
  return v18;
}

- (void)buildCollectionView
{
  id v38 = [(AVTFunCamAvatarPickerController *)self buildCollectionViewLayout];
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self view];
  [v4 bounds];
  double v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v38);

  double v6 = [AVTCenteringCollectionViewDelegate alloc];
  double v7 = [(AVTFunCamAvatarPickerController *)self environment];
  double v8 = [(AVTCenteringCollectionViewDelegate *)v6 initWithCollectionView:v5 delegate:self environment:v7];
  [(AVTFunCamAvatarPickerController *)self setCenteringDelegate:v8];

  [v5 setDataSource:self];
  double v9 = [MEMORY[0x263F1C550] clearColor];
  [v5 setBackgroundColor:v9];

  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 setShowsVerticalScrollIndicator:0];
  [v5 setAutoresizingMask:18];
  [v5 _setTransfersScrollToContainer:0];
  uint64_t v10 = objc_opt_class();
  double v11 = +[AVTFunCamAvatarPickerCollectionViewCell cellIdentifier];
  [v5 registerClass:v10 forCellWithReuseIdentifier:v11];

  [(AVTFunCamAvatarPickerController *)self setCollectionView:v5];
  [(AVTFunCamAvatarPickerController *)self setListLayout:v38];
  double v12 = (void *)[(id)objc_opt_class() newGridLayout];
  [(AVTFunCamAvatarPickerController *)self setGridLayout:v12];

  double v13 = [(AVTFunCamAvatarPickerController *)self view];
  [v13 addSubview:v5];

  double v14 = [(AVTFunCamAvatarPickerController *)self view];
  [v14 bounds];
  CGFloat v15 = CGRectGetMaxY(v40) + -14.0;
  double v16 = [(AVTFunCamAvatarPickerController *)self view];
  [v16 bounds];
  double Width = CGRectGetWidth(v41);

  CGRect v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, v15, Width, 14.0);
  [(AVTFunCamAvatarPickerController *)self setTitlesContainer:v18];

  CGRect v19 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v19 setUserInteractionEnabled:0];

  id v20 = objc_alloc(MEMORY[0x263F1C4E0]);
  uint64_t v21 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(AVTFunCamAvatarPickerController *)self buildTitlesCollectionViewLayout];
  v31 = objc_msgSend(v20, "initWithFrame:collectionViewLayout:", v30, v23, v25, v27, v29);

  [v31 setUserInteractionEnabled:0];
  [v31 setDataSource:self];
  v32 = [MEMORY[0x263F1C550] clearColor];
  [v31 setBackgroundColor:v32];

  [v31 setShowsHorizontalScrollIndicator:0];
  [v31 setAutoresizingMask:18];
  uint64_t v33 = objc_opt_class();
  v34 = +[AVTFunCamAvatarPickerTitleCell cellIdentifier];
  [v31 registerClass:v33 forCellWithReuseIdentifier:v34];

  [(AVTFunCamAvatarPickerController *)self setTitlesCollectionView:v31];
  v35 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v35 addSubview:v31];

  v36 = [(AVTFunCamAvatarPickerController *)self view];
  v37 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v36 addSubview:v37];

  [(AVTFunCamAvatarPickerController *)self updateTitlesClippingViewMask];
}

- (void)updateTitlesClippingViewMask
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v4 bounds];
  double v7 = objc_msgSend(v3, "createClippingViewForSize:", v5, v6);
  [(AVTFunCamAvatarPickerController *)self setTitlesClippingView:v7];

  double v8 = [(AVTFunCamAvatarPickerController *)self titlesClippingView];
  [v8 setAutoresizingMask:10];

  id v10 = [(AVTFunCamAvatarPickerController *)self titlesClippingView];
  double v9 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v9 setMaskView:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerController;
  [(AVTFunCamAvatarPickerController *)&v5 viewWillAppear:a3];
  uint64_t v4 = [(AVTFunCamAvatarPickerController *)self selectedIndexPath];
  [(AVTFunCamAvatarPickerController *)self selectItemAtIndexPath:v4 animated:0 notifyDelegate:0];
}

- (void)startObservingChangesIfNeeded
{
  id v3 = [(AVTFunCamAvatarPickerController *)self changeNotificationToken];

  if (!v3)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [(AVTFunCamAvatarPickerController *)self environment];
    objc_super v5 = [v4 notificationCenter];
    uint64_t v6 = *MEMORY[0x263F29710];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke;
    double v11 = &unk_263FF0C50;
    objc_copyWeak(&v12, &location);
    double v7 = [v5 addObserverForName:v6 object:0 queue:0 usingBlock:&v8];
    -[AVTFunCamAvatarPickerController setChangeNotificationToken:](self, "setChangeNotificationToken:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke_2;
  block[3] = &unk_263FF09D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __64__AVTFunCamAvatarPickerController_startObservingChangesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadModel];
}

- (void)reloadData
{
  if ([(AVTFunCamAvatarPickerController *)self isViewLoaded])
  {
    id v3 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v3 reloadData];

    id v4 = [(AVTFunCamAvatarPickerController *)self selectedIndexPath];
    [(AVTFunCamAvatarPickerController *)self selectItemAtIndexPath:v4 animated:0 notifyDelegate:0];
  }
}

- (BOOL)canCreateAvatar
{
  id v2 = [(AVTFunCamAvatarPickerController *)self store];
  char v3 = [v2 canCreateAvatarWithError:0];

  return v3;
}

- (void)reloadModel
{
  [(AVTFunCamAvatarPickerController *)self startObservingChangesIfNeeded];
  char v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(AVTFunCamAvatarPickerController *)self allowsCreation];
  objc_super v5 = @"none";
  if (v4) {
    objc_super v5 = @"add";
  }
  uint64_t v6 = v5;
  BOOL v7 = [(AVTFunCamAvatarPickerController *)self allowsCreation];
  uint64_t v8 = AVTAvatarUIBundle();
  uint64_t v9 = v8;
  if (v7) {
    id v10 = @"ADD";
  }
  else {
    id v10 = @"NONE";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26BF058D0 table:@"Localized"];

  id v12 = (void *)MEMORY[0x263F1C6B0];
  double v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v14 = [v12 imageNamed:v6 inBundle:v13 compatibleWithTraitCollection:0];

  CGFloat v15 = [v14 _imageThatSuppressesAccessibilityHairlineThickening];

  v37 = (void *)v11;
  double v16 = [[AVTAvatarListImageItem alloc] initWithImage:v15 title:v11];
  [(AVTFunCamAvatarPickerController *)self setNoneItem:v16];

  objc_super v17 = [(AVTFunCamAvatarPickerController *)self noneItem];
  [v3 addObject:v17];

  CGRect v18 = [MEMORY[0x263F29718] requestForCustomAvatars];
  CGRect v19 = [(AVTFunCamAvatarPickerController *)self store];
  id v39 = 0;
  id v20 = [v19 avatarsForFetchRequest:v18 error:&v39];
  id v21 = v39;

  if (!v20)
  {
    double v22 = [(AVTFunCamAvatarPickerController *)self logger];
    double v23 = [v21 description];
    [v22 logErrorFetchingRecords:v23];
  }
  double v24 = [v20 reverseObjectEnumerator];
  double v25 = [v24 allObjects];

  [(AVTFunCamAvatarPickerController *)self setEditableRecords:v25];
  double v26 = [(id)objc_opt_class() itemsFromRecords:v25];
  [v3 addObjectsFromArray:v26];

  double v27 = [MEMORY[0x263F29718] requestForPredefinedAvatars];

  double v28 = [(AVTFunCamAvatarPickerController *)self store];
  id v38 = 0;
  double v29 = [v28 avatarsForFetchRequest:v27 error:&v38];
  id v30 = v38;

  if (!v29)
  {
    v31 = [(AVTFunCamAvatarPickerController *)self logger];
    v32 = [v30 description];
    [v31 logErrorFetchingRecords:v32];
  }
  uint64_t v33 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_11];
  v34 = [v29 filteredArrayUsingPredicate:v33];

  [(AVTFunCamAvatarPickerController *)self setPuppetRecords:v34];
  v35 = [(id)objc_opt_class() itemsFromRecords:v34];
  [v3 addObjectsFromArray:v35];

  v36 = (void *)[v3 copy];
  [(AVTFunCamAvatarPickerController *)self setItems:v36];

  [(AVTFunCamAvatarPickerController *)self reloadData];
}

uint64_t __46__AVTFunCamAvatarPickerController_reloadModel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"ghost"] ^ 1;

  return v3;
}

- (void)updateViewForCurrentMode
{
  uint64_t v3 = [(AVTFunCamAvatarPickerController *)self view];
  [v3 bounds];
  -[AVTFunCamAvatarPickerController setLastUpdateViewBounds:](self, "setLastUpdateViewBounds:");

  unint64_t v4 = [(AVTFunCamAvatarPickerController *)self mode];
  objc_super v5 = [(AVTFunCamAvatarPickerController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
  [v12 setHidden:v4 == 1];

  double v13 = v11 + -1.0;
  if (v4 == 1)
  {
    double v14 = [(AVTFunCamAvatarPickerController *)self collectionView];
    objc_msgSend(v14, "setFrame:", v7, 1.0, v9, v13);

    CGFloat v15 = [(AVTFunCamAvatarPickerController *)self gridLayout];
    double v16 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v16 setCollectionViewLayout:v15];

    objc_super v17 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v17 setDelegate:self];
  }
  else
  {
    CGRect v18 = [(AVTFunCamAvatarPickerController *)self view];
    [v18 safeAreaInsets];
    double v20 = v7 + v19;
    double v22 = v21 + 1.0;
    double v24 = v9 - (v19 + v23);
    double v26 = v13 - (v21 + v25);

    double v27 = [(AVTFunCamAvatarPickerController *)self collectionView];
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    double v28 = [(AVTFunCamAvatarPickerController *)self listLayout];
    double v29 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v29 setCollectionViewLayout:v28];

    id v30 = [(AVTFunCamAvatarPickerController *)self centeringDelegate];
    v31 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v31 setDelegate:v30];

    v32 = [(AVTFunCamAvatarPickerController *)self style];
    [v32 engagedCellSize];
    double v34 = v26 + (v26 - v33) * -0.5 + -14.0;

    v35 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
    objc_msgSend(v35, "setFrame:", 0.0, v34, v24, 14.0);

    v36 = [(AVTFunCamAvatarPickerController *)self titlesContainer];
    [v36 setAutoresizingMask:10];

    [(AVTFunCamAvatarPickerController *)self updateTitlesClippingViewMask];
  }
  [(AVTFunCamAvatarPickerController *)self reloadData];
}

- (void)selectItemForAvatarRecord:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(AVTFunCamAvatarPickerController *)self setSelectedAvatarRecord:a3];
  if ([(AVTFunCamAvatarPickerController *)self isViewLoaded])
  {
    id v8 = [(AVTFunCamAvatarPickerController *)self selectedIndexPath];
    [(AVTFunCamAvatarPickerController *)self selectItemAtIndexPath:v8 animated:v6 notifyDelegate:v5];
  }
}

- (void)selectItemAtCenterNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AVTFunCamAvatarPickerController *)self isDisplayingGridLayout])
  {
    BOOL v5 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(AVTFunCamAvatarPickerController *)self collectionView];
    double v11 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v10, v7, v9);

    if (v11)
    {
      unint64_t v12 = [v11 item];
      double v13 = [(AVTFunCamAvatarPickerController *)self items];
      unint64_t v14 = [v13 count];

      if (v12 < v14)
      {
        CGFloat v15 = [(AVTFunCamAvatarPickerController *)self items];
        double v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "item"));

        uint64_t v18 = 0;
        double v19 = &v18;
        uint64_t v20 = 0x3032000000;
        double v21 = __Block_byref_object_copy__10;
        double v22 = __Block_byref_object_dispose__10;
        id v23 = 0;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __68__AVTFunCamAvatarPickerController_selectItemAtCenterNotifyDelegate___block_invoke;
        v17[3] = &unk_263FF0FD0;
        v17[4] = &v18;
        [v16 downcastWithRecordHandler:v17 imageHandler:0 viewHandler:0];
        [(AVTFunCamAvatarPickerController *)self selectItemForAvatarRecord:v19[5] animated:1 notifyDelegate:v3];
        _Block_object_dispose(&v18, 8);
      }
    }
  }
}

uint64_t __68__AVTFunCamAvatarPickerController_selectItemAtCenterNotifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avatar];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v31 = a3;
  if ([(AVTFunCamAvatarPickerController *)self isDisplayingGridLayout])
  {
    uint64_t v8 = 2;
  }
  else
  {
    double v9 = [(AVTFunCamAvatarPickerController *)self collectionView];
    double v10 = [v9 collectionViewLayout];
    uint64_t v11 = [v31 item];
    unint64_t v12 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    objc_super v17 = [(AVTFunCamAvatarPickerController *)self collectionView];
    [v17 bounds];
    objc_msgSend(v10, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v11, v14, v16, v18, v19);
    double v21 = v20;
    double v23 = v22;

    double v24 = [(AVTFunCamAvatarPickerController *)self collectionView];
    +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v24, v21, v23);
    double v26 = v25;
    double v28 = v27;

    double v29 = [(AVTFunCamAvatarPickerController *)self collectionView];
    objc_msgSend(v29, "setContentOffset:animated:", v6, v26, v28);

    uint64_t v8 = 0;
  }
  id v30 = [(AVTFunCamAvatarPickerController *)self collectionView];
  [v30 selectItemAtIndexPath:v31 animated:v6 scrollPosition:v8];

  if (v5) {
    [(AVTFunCamAvatarPickerController *)self sendSelectionEventToDelegateForItemAtIndexPath:v31];
  }
}

- (void)sendSelectionEventToDelegateForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(AVTFunCamAvatarPickerController *)self items];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));

    uint64_t v11 = 0;
    unint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    double v14 = __Block_byref_object_copy__10;
    double v15 = __Block_byref_object_dispose__10;
    id v16 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__AVTFunCamAvatarPickerController_sendSelectionEventToDelegateForItemAtIndexPath___block_invoke;
    v10[3] = &unk_263FF0FD0;
    v10[4] = &v11;
    [v8 downcastWithRecordHandler:v10 imageHandler:0 viewHandler:0];
    double v9 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
    [v9 avatarPicker:self didSelectAvatarRecord:v12[5]];

    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __82__AVTFunCamAvatarPickerController_sendSelectionEventToDelegateForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avatar];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTFunCamAvatarPickerController *)self titlesCollectionView];
  if (v5 != v4)
  {

LABEL_5:
    int64_t v7 = 1;
    goto LABEL_6;
  }
  BOOL v6 = [(AVTFunCamAvatarPickerController *)self isDisplayingGridLayout];

  if (!v6) {
    goto LABEL_5;
  }
  int64_t v7 = 0;
LABEL_6:

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(AVTFunCamAvatarPickerController *)self items];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVTFunCamAvatarPickerController *)self items];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  id v10 = [(AVTFunCamAvatarPickerController *)self titlesCollectionView];

  if (v10 == v6)
  {
    double v14 = +[AVTFunCamAvatarPickerTitleCell cellIdentifier];
    double v15 = [v6 dequeueReusableCellWithReuseIdentifier:v14 forIndexPath:v7];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke;
    v28[3] = &unk_263FF16F8;
    id v16 = v15;
    id v29 = v16;
    [v9 downcastWithRecordHandler:0 imageHandler:v28 viewHandler:0];
    id v17 = v29;
  }
  else
  {
    uint64_t v11 = +[AVTFunCamAvatarPickerCollectionViewCell cellIdentifier];
    unint64_t v12 = [v6 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];

    BOOL v13 = ![(AVTFunCamAvatarPickerController *)self allowsCreation]
       && [(AVTFunCamAvatarPickerController *)self isDisplayingGridLayout];
    [v12 setSelectionVisible:v13];
    double v18 = [MEMORY[0x263F08C38] UUID];
    [v12 setDisplaySessionUUID:v18];
    objc_msgSend(v12, "setShowsTitle:", -[AVTFunCamAvatarPickerController isDisplayingGridLayout](self, "isDisplayingGridLayout") ^ 1);
    double v19 = [(AVTFunCamAvatarPickerController *)self style];
    [v19 engagedCellSize];
    objc_msgSend(v12, "setEngagedSize:");

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v25[3] = &unk_263FF1748;
    v25[4] = self;
    id v26 = v12;
    id v27 = v18;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_4;
    v23[3] = &unk_263FF1770;
    v23[4] = self;
    id v20 = v26;
    id v24 = v20;
    id v17 = v18;
    [v9 downcastWithRecordHandler:v25 imageHandler:v23 viewHandler:0];
    double v21 = v24;
    id v16 = v20;
  }
  return v16;
}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 title];
  [v2 updateWithTitle:v3];
}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id v4 = [v3 avatar];
  if ([v4 isEditable] && (objc_msgSend(a1[4], "isDisplayingGridLayout") & 1) == 0)
  {
    uint64_t v5 = [a1[4] editableRecordsListRenderingScope];
  }
  else
  {
    uint64_t v5 = [a1[4] gridRenderingScope];
  }
  id v6 = (void *)v5;

  id v7 = [v3 avatar];
  if ([v7 isEditable]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  double v9 = [v6 adaptedFramingModeForObjectType:v8];

  id v10 = a1[5];
  +[AVTRenderingScope extraMagnifyingFactorForFramingMode:v9];
  objc_msgSend(v10, "setImageZoomFactor:");
  if ([a1[4] isDisplayingGridLayout]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [a1[5] setImageContentMode:v11];
  double v12 = 0.0;
  if ([a1[4] isDisplayingGridLayout])
  {
    BOOL v13 = [a1[4] style];
    [v13 interitemSpacing];
    double v12 = v14 * 0.5;
  }
  double v15 = +[AVTFunCamAvatarPickerStyle insetProviderForConstant:v12];
  [a1[5] setImageInsetProvider:v15];

  objc_msgSend(a1[5], "setRoundImageCorners:", objc_msgSend(a1[4], "isDisplayingGridLayout"));
  id v16 = [v3 avatar];
  int v17 = [v16 isEditable];

  if (v17)
  {
    id v18 = a1[5];
    double v19 = +[AVTUIColorRepository placeholderBackgroundColor];
    [v18 updateWithTintColor:v19];

    id v20 = a1[5];
    double v21 = AVTAvatarEditorPlaceholderSilhouette();
    [v20 updateWithImage:v21 animated:0];
  }
  double v22 = [a1[4] imageProvider];
  double v23 = [v3 avatar];
  id v24 = [v22 providerForRecord:v23 scope:v6];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v26[3] = &unk_263FF1720;
  id v27 = a1[5];
  id v28 = a1[6];
  id v29 = &v30;
  id v25 = (id)((uint64_t (**)(void, void *, void))v24)[2](v24, v26, 0);

  *((unsigned char *)v31 + 24) = 1;
  _Block_object_dispose(&v30, 8);
}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) displaySessionUUID];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) updateWithImage:v5 animated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  }
}

void __73__AVTFunCamAvatarPickerController_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 traitCollection];
  if ([v5 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  id v12 = [MEMORY[0x263F1C550] systemBlueColor];
  }

  [*(id *)(a1 + 40) updateWithTintColor:v12];
  char v6 = [*(id *)(a1 + 32) isDisplayingGridLayout];
  id v7 = [*(id *)(a1 + 32) style];
  uint64_t v8 = v7;
  if (v6) {
    [v7 imageItemInsetsForGrid];
  }
  else {
  double v9 = [v7 imageItemInsetsForList];
  }
  [*(id *)(a1 + 40) setImageInsetProvider:v9];

  [*(id *)(a1 + 40) setImageContentMode:1];
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v4 image];

  [v10 updateWithImage:v11 animated:0];
  [*(id *)(a1 + 40) setRoundImageCorners:0];
}

- (id)indexPathForNoneItem
{
  id v3 = [(AVTFunCamAvatarPickerController *)self items];
  id v4 = [(AVTFunCamAvatarPickerController *)self noneItem];
  uint64_t v5 = [v3 indexOfObject:v4];

  char v6 = (void *)MEMORY[0x263F088C8];
  return (id)[v6 indexPathForItem:v5 inSection:0];
}

- (int64_t)indexForRecordIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(AVTFunCamAvatarPickerController *)self items];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke;
    v8[3] = &unk_263FF0FA8;
    id v9 = v4;
    int64_t v6 = [v5 indexOfObjectPassingTest:v8];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke_2;
  v6[3] = &unk_263FF0F80;
  uint64_t v8 = &v9;
  id v7 = *(id *)(a1 + 32);
  [v3 downcastWithRecordHandler:v6 viewHandler:0];
  uint64_t v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __60__AVTFunCamAvatarPickerController_indexForRecordIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 avatar];
  id v3 = [v4 identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqualToString:*(void *)(a1 + 32)];
}

- (int64_t)indexForRecord:(id)a3
{
  id v4 = [a3 identifier];
  int64_t v5 = [(AVTFunCamAvatarPickerController *)self indexForRecordIdentifier:v4];

  return v5;
}

- (CGSize)gridItemSize
{
  id v3 = [(AVTFunCamAvatarPickerController *)self style];
  id v4 = [(AVTFunCamAvatarPickerController *)self collectionView];
  [v4 bounds];
  double v6 = v5;
  id v7 = [(AVTFunCamAvatarPickerController *)self environment];
  [v3 edgeLengthFittingWidth:v7 environment:v6];
  double v9 = v8;

  double v10 = v9;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [(AVTFunCamAvatarPickerController *)self gridLayout];

  if (v7 != v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Custom layout for list mode shouldn't call this method"];
  }
  [(AVTFunCamAvatarPickerController *)self gridItemSize];
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a4;
  id v7 = [(AVTFunCamAvatarPickerController *)self gridLayout];

  if (v7 != v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Custom layout for list mode shouldn't call this method"];
  }
  double v8 = [(AVTFunCamAvatarPickerController *)self style];
  [v8 gridEdgeInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AVTFunCamAvatarPickerController *)self items];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__10;
  double v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__AVTFunCamAvatarPickerController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v10[3] = &unk_263FF0FD0;
  v10[4] = &v11;
  [v9 downcastWithRecordHandler:v10 imageHandler:0 viewHandler:0];
  [(AVTFunCamAvatarPickerController *)self selectItemForAvatarRecord:v12[5] animated:1 notifyDelegate:1];
  _Block_object_dispose(&v11, 8);
}

uint64_t __75__AVTFunCamAvatarPickerController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avatar];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v11 = a3;
  id v4 = [(AVTFunCamAvatarPickerController *)self collectionView];

  uint64_t v5 = v11;
  if (v4 == v11)
  {
    [v11 contentOffset];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(AVTFunCamAvatarPickerController *)self titlesCollectionView];
    objc_msgSend(v10, "setContentOffset:", v7, v9);

    uint64_t v5 = v11;
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(AVTFunCamAvatarPickerController *)self selectItemAtCenterNotifyDelegate:1];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (([v4 isDragging] & 1) == 0 && (objc_msgSend(v4, "isTracking") & 1) == 0) {
    [(AVTFunCamAvatarPickerController *)self selectItemAtCenterNotifyDelegate:1];
  }
}

- (void)sessionProviderDidEndCameraSession:(id)a3
{
  id v4 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
    [v6 avatarPickerDidEndCameraSession:self];
  }
}

- (void)sessionProviderWillStartCameraSession:(id)a3
{
  id v4 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTFunCamAvatarPickerController *)self avatarPickerDelegate];
    [v6 avatarPickerWillStartCameraSession:self];
  }
}

- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v11 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__10;
  double v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(AVTFunCamAvatarPickerController *)self items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      double v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __77__AVTFunCamAvatarPickerController_selectAvatarRecordWithIdentifier_animated___block_invoke;
      v12[3] = &unk_263FF1798;
      id v13 = v5;
      double v14 = &v19;
      [v10 downcastWithRecordHandler:v12 imageHandler:0 viewHandler:0];
      LOBYTE(v10) = v20[5] == 0;

      if ((v10 & 1) == 0) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [(AVTFunCamAvatarPickerController *)self selectItemForAvatarRecord:v20[5] animated:v11 notifyDelegate:0];
  _Block_object_dispose(&v19, 8);
}

void __77__AVTFunCamAvatarPickerController_selectAvatarRecordWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 avatar];
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = [v9 avatar];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->avatarPickerDelegate);
  return (AVTAvatarPickerDelegate *)WeakRetained;
}

- (void)setAvatarPickerDelegate:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTFunCamAvatarPickerStyle)style
{
  return self->_style;
}

- (BOOL)allowsCreation
{
  return self->_allowsCreation;
}

- (void)setAllowsCreation:(BOOL)a3
{
  self->_allowsCreation = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIView)titlesContainer
{
  return self->_titlesContainer;
}

- (void)setTitlesContainer:(id)a3
{
}

- (UICollectionView)titlesCollectionView
{
  return self->_titlesCollectionView;
}

- (void)setTitlesCollectionView:(id)a3
{
}

- (UIView)titlesClippingView
{
  return self->_titlesClippingView;
}

- (void)setTitlesClippingView:(id)a3
{
}

- (CGRect)lastUpdateViewBounds
{
  double x = self->_lastUpdateViewBounds.origin.x;
  double y = self->_lastUpdateViewBounds.origin.y;
  double width = self->_lastUpdateViewBounds.size.width;
  double height = self->_lastUpdateViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastUpdateViewBounds:(CGRect)a3
{
  self->_lastUpdateViewBounds = a3;
}

- (AVTAvatarRecord)selectedAvatarRecord
{
  return self->_selectedAvatarRecord;
}

- (void)setSelectedAvatarRecord:(id)a3
{
}

- (AVTFunCamAvatarPickerCollectionViewLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
}

- (UICollectionViewFlowLayout)gridLayout
{
  return self->_gridLayout;
}

- (void)setGridLayout:(id)a3
{
}

- (AVTCenteringCollectionViewDelegate)centeringDelegate
{
  return self->_centeringDelegate;
}

- (void)setCenteringDelegate:(id)a3
{
}

- (NSArray)puppetRecords
{
  return self->_puppetRecords;
}

- (void)setPuppetRecords:(id)a3
{
}

- (NSArray)editableRecords
{
  return self->_editableRecords;
}

- (void)setEditableRecords:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (AVTAvatarListImageItem)noneItem
{
  return self->_noneItem;
}

- (void)setNoneItem:(id)a3
{
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTRenderingScope)editableRecordsListRenderingScope
{
  return self->_editableRecordsListRenderingScope;
}

- (AVTRenderingScope)gridRenderingScope
{
  return self->_gridRenderingScope;
}

- (NSObject)changeNotificationToken
{
  return self->_changeNotificationToken;
}

- (void)setChangeNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationToken, 0);
  objc_storeStrong((id *)&self->_gridRenderingScope, 0);
  objc_storeStrong((id *)&self->_editableRecordsListRenderingScope, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_noneItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_editableRecords, 0);
  objc_storeStrong((id *)&self->_puppetRecords, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_selectedAvatarRecord, 0);
  objc_storeStrong((id *)&self->_titlesClippingView, 0);
  objc_storeStrong((id *)&self->_titlesCollectionView, 0);
  objc_storeStrong((id *)&self->_titlesContainer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end