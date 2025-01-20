@interface AVTStickerPagingController
+ (id)stickerCacheWithEnvironment:(id)a3;
- (AVTAvatarPickerDelegate)avatarPickerDelegate;
- (AVTAvatarRecordDataSource)dataSource;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTResourceCache)cache;
- (AVTStickerConfigurationProvider)stickerConfigurationProvider;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (AVTStickerPagingController)initWithRecordDataSource:(id)a3 recordImageProvider:(id)a4 stickerConfigurationProvider:(id)a5 taskScheduler:(id)a6 environment:(id)a7 allowsPeel:(BOOL)a8;
- (AVTStickerPagingControllerDelegate)delegate;
- (AVTStickerSelectionDelegate)stickerSelectionDelegate;
- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider;
- (AVTStickerTaskScheduler)taskScheduler;
- (AVTUIEnvironment)environment;
- (AVTUIStickerGeneratorPool)stickerGeneratorPool;
- (BOOL)allowsPeel;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)isResizing;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)endDraggingTargetContentOffset;
- (CGPoint)pageContentOffset;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSMutableDictionary)pageForRecords;
- (NSString)focusedPageRecordIdentifier;
- (NSString)selectedStickerIdentifier;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)renderingQueue;
- (UICollectionView)collectionView;
- (UICollectionViewCell)lastDeletedCell;
- (UIEdgeInsets)pageContentInsets;
- (UIView)view;
- (_AVTAvatarRecordImageProvider)imageProvider;
- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4;
- (id)centeredPageWithOffset:(CGPoint)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)firstPageItemView;
- (id)reloadSheetControllerForRecord:(id)a3;
- (id)sheetControllerAtIndex:(int64_t)a3;
- (id)sheetControllerForRecord:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)pageIndexForAvatarRecordIdentifier:(id)a3;
- (void)avatarActionsViewControllerDidFinish:(id)a3;
- (void)cancelPrefetchingDataForRecord:(id)a3;
- (void)clearStickerSelection;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)deletePageForRecord:(id)a3 atIndex:(int64_t)a4;
- (void)didEndDisplaying;
- (void)insertPageForRecord:(id)a3 atIndex:(int64_t)a4;
- (void)loadView;
- (void)notifyingContainerViewDidChangeSize:(CGSize)a3;
- (void)notifyingContainerViewWillChangeSize:(CGSize)a3;
- (void)prefetchDataForRecord:(id)a3;
- (void)reloadData;
- (void)reloadPageForRecord:(id)a3 atIndex:(int64_t)a4;
- (void)scrollToAvatarWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)scrollToPageAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAvatarPickerDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
- (void)setEncodingQueue:(id)a3;
- (void)setEndDraggingTargetContentOffset:(CGPoint)a3;
- (void)setEnvironment:(id)a3;
- (void)setFocusedPageRecordIdentifier:(id)a3;
- (void)setIsResizing:(BOOL)a3;
- (void)setLastDeletedCell:(id)a3;
- (void)setPageContentInsets:(UIEdgeInsets)a3;
- (void)setPageContentOffset:(CGPoint)a3;
- (void)setPageForRecords:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setRenderingQueue:(id)a3;
- (void)setSelectedStickerIdentifier:(id)a3;
- (void)setStickerGeneratorPool:(id)a3;
- (void)setStickerSelectionDelegate:(id)a3;
- (void)setStickerSheetControllerProvider:(id)a3;
- (void)setView:(id)a3;
- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4;
- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6;
- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4;
- (void)stickerSheetController:(id)a3 scrollView:(id)a4 willEndDraggingWithTargetContentOffset:(CGPoint *)a5;
- (void)updateForEndingScrollWithTargetContentOffset:(CGPoint)a3;
- (void)willEndDisplaying;
- (void)willStartDisplaying;
- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTStickerPagingController

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (AVTUIStickersCaching())
  {
    if (AVTUIFlushStickersCache())
    {
      v4 = [v3 stickerImageStoreLocation];
      v5 = [v3 logger];
      +[AVTImageStore clearContentAtLocation:v4 logger:v5];

      AVTUISetFlushStickersCache();
    }
    v6 = [AVTInMemoryResourceCache alloc];
    v7 = [v3 lockProvider];
    v8 = [v3 logger];
    v9 = [(AVTInMemoryResourceCache *)v6 initWithLockProvider:v7 totalCostLimit:980000 logger:v8];
  }
  else
  {
    v10 = [v3 stickerImageStoreLocation];
    v11 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v10 logger:v11];

    AVTUISetFlushStickersCache();
    v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

- (AVTStickerPagingController)initWithRecordDataSource:(id)a3 recordImageProvider:(id)a4 stickerConfigurationProvider:(id)a5 taskScheduler:(id)a6 environment:(id)a7 allowsPeel:(BOOL)a8
{
  id v34 = a3;
  id v33 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerPagingController;
  v18 = [(AVTStickerPagingController *)&v35 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeStrong((id *)&v19->_environment, a7);
    v19->_allowsPeel = a8;
    v20 = [AVTUIStickerGeneratorPool alloc];
    v21 = objc_msgSend(v17, "logger", v33, v34);
    uint64_t v22 = [(AVTUIStickerGeneratorPool *)v20 initWithMaxStickerGeneratorCount:2 logger:v21];
    stickerGeneratorPool = v19->_stickerGeneratorPool;
    v19->_stickerGeneratorPool = (AVTUIStickerGeneratorPool *)v22;

    objc_storeStrong((id *)&v19->_taskScheduler, a6);
    uint64_t v24 = [v17 backgroundRenderingQueue];
    renderingQueue = v19->_renderingQueue;
    v19->_renderingQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [v17 backgroundEncodingQueue];
    encodingQueue = v19->_encodingQueue;
    v19->_encodingQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    pageForRecords = v19->_pageForRecords;
    v19->_pageForRecords = (NSMutableDictionary *)v28;

    uint64_t v30 = [(id)objc_opt_class() stickerCacheWithEnvironment:v17];
    cache = v19->_cache;
    v19->_cache = (AVTResourceCache *)v30;

    objc_storeStrong((id *)&v19->_imageProvider, a4);
    objc_storeStrong((id *)&v19->_stickerConfigurationProvider, a5);
  }

  return v19;
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    [(AVTStickerPagingController *)self loadView];
    view = self->_view;
  }
  return view;
}

- (void)loadView
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v12 = objc_alloc_init(MEMORY[0x263F1C508]);
  [v12 setScrollDirection:1];
  [v12 setMinimumInteritemSpacing:0.0];
  [v12 setMinimumLineSpacing:0.0];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C4E0]), "initWithFrame:collectionViewLayout:", v12, v3, v4, v5, v6);
  v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setDataSource:self];
  [v7 setPrefetchDataSource:self];
  [v7 setPrefetchingEnabled:1];
  [v7 setDelegate:self];
  [v7 setShowsHorizontalScrollIndicator:0];
  [v7 setPagingEnabled:1];
  [v7 setContentInsetAdjustmentBehavior:2];
  uint64_t v9 = objc_opt_class();
  v10 = +[AVTStickerPagingCollectionViewCell cellIdentifier];
  [v7 registerClass:v9 forCellWithReuseIdentifier:v10];

  [v7 setAutoresizingMask:18];
  [(AVTStickerPagingController *)self setCollectionView:v7];
  v11 = -[AVTNotifyingContainerView initWithFrame:]([AVTNotifyingContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  [(AVTNotifyingContainerView *)v11 setDelegate:self];
  [(AVTNotifyingContainerView *)v11 addSubview:v7];
  [(AVTStickerPagingController *)self setView:v11];
  [(AVTStickerPagingController *)self reloadData];
}

- (void)setPageContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_pageContentInsets.left
    || a3.top != self->_pageContentInsets.top
    || a3.right != self->_pageContentInsets.right
    || a3.bottom != self->_pageContentInsets.bottom)
  {
    self->_pageContentInsets = a3;
    v11 = [(AVTStickerPagingController *)self collectionView];
    [v11 contentOffset];
    -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = [(AVTStickerPagingController *)self collectionView];
    v13 = [v12 collectionViewLayout];
    [v13 invalidateLayout];

    objc_msgSend(v14, "setSectionInsets:", top, left, bottom, right);
  }
}

- (void)prefetchDataForRecord:(id)a3
{
  id v3 = [(AVTStickerPagingController *)self sheetControllerForRecord:a3];
  [v3 startAllSchedulerTasks];
}

- (void)cancelPrefetchingDataForRecord:(id)a3
{
  id v4 = a3;
  id v6 = [(AVTStickerPagingController *)self taskScheduler];
  double v5 = [v4 identifier];

  [v6 cancelStickerSheetTasksForAvatarRecordIdentifier:v5];
}

- (void)reloadData
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(AVTStickerPagingController *)self setPageForRecords:v3];

  id v4 = [(AVTStickerPagingController *)self collectionView];
  [v4 reloadData];
}

- (id)sheetControllerForRecord:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTStickerPagingController *)self pageForRecords];
  id v6 = [v4 identifier];
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    uint64_t v9 = [(AVTStickerPagingController *)self stickerConfigurationProvider];
    v10 = [v9 stickerConfigurationsForAvatarRecord:v4];

    v11 = [(AVTStickerPagingController *)self cache];
    id v12 = [(AVTStickerPagingController *)self renderingQueue];
    v13 = [(AVTStickerPagingController *)self encodingQueue];
    id v14 = [(AVTStickerPagingController *)self stickerGeneratorPool];
    id v15 = [(AVTStickerPagingController *)self imageProvider];
    id v16 = [(AVTStickerPagingController *)self environment];
    id v17 = +[AVTStickerSheetModel sheetModelForAvatarRecord:v4 withConfigurations:v10 cache:v11 taskScheduler:0 renderingQueue:v12 encodingQueue:v13 stickerGeneratorPool:v14 imageProvider:v15 environment:v16];

    v18 = [(AVTStickerPagingController *)self stickerSheetControllerProvider];

    if (v18)
    {
      v19 = [(AVTStickerPagingController *)self stickerSheetControllerProvider];
      v20 = [(AVTStickerPagingController *)self taskScheduler];
      v21 = [v19 stickerSheetControllerForSelectedAvatar:v4 stickerSheetModel:v17 taskScheduler:v20];
    }
    else
    {
      uint64_t v22 = [AVTStickerSheetController alloc];
      v19 = [(AVTStickerPagingController *)self taskScheduler];
      v21 = [(AVTStickerSheetController *)v22 initWithStickerSheetModel:v17 taskScheduler:v19 allowsPeel:[(AVTStickerPagingController *)self allowsPeel]];
    }

    [(AVTStickerSheetController *)v21 setDelegate:self];
    v23 = [(AVTStickerPagingController *)self disclosureValidationDelegate];
    [(AVTStickerSheetController *)v21 setDisclosureValidationDelegate:v23];

    uint64_t v24 = [(AVTStickerPagingController *)self pageForRecords];
    v25 = [v4 identifier];
    [v24 setObject:v21 forKey:v25];

    v8 = v21;
  }

  return v8;
}

- (id)reloadSheetControllerForRecord:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTStickerPagingController *)self pageForRecords];
  id v6 = [v4 identifier];
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = [(AVTStickerPagingController *)self pageForRecords];
    uint64_t v9 = [v4 identifier];
    [v8 removeObjectForKey:v9];

    [v7 sheetDidDisappear];
  }
  v10 = [(AVTStickerPagingController *)self stickerGeneratorPool];
  [v10 flushGeneratorForRecord:v4];

  v11 = [(AVTStickerPagingController *)self sheetControllerForRecord:v4];

  return v11;
}

- (id)sheetControllerAtIndex:(int64_t)a3
{
  double v5 = [(AVTStickerPagingController *)self dataSource];
  id v6 = [v5 recordAtIndex:a3];

  v7 = [(AVTStickerPagingController *)self sheetControllerForRecord:v6];

  return v7;
}

- (void)insertPageForRecord:(id)a3 atIndex:(int64_t)a4
{
  -[AVTStickerPagingController reloadSheetControllerForRecord:](self, "reloadSheetControllerForRecord:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setDelegate:self];
  double v5 = [(AVTStickerPagingController *)self collectionView];
  [v5 reloadData];
}

- (void)deletePageForRecord:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = [(AVTStickerPagingController *)self pageForRecords];
  v8 = [v6 identifier];
  uint64_t v9 = [v7 objectForKey:v8];

  if (v9)
  {
    v10 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:0];
    v11 = [(AVTStickerPagingController *)self collectionView];
    id v12 = [v11 cellForItemAtIndexPath:v10];
    [(AVTStickerPagingController *)self setLastDeletedCell:v12];

    v13 = [(AVTStickerPagingController *)self stickerGeneratorPool];
    [v13 flushGeneratorForRecord:v6];

    id v14 = [(AVTStickerPagingController *)self pageForRecords];
    id v15 = [v6 identifier];
    [v14 removeObjectForKey:v15];

    id v16 = [(AVTStickerPagingController *)self collectionView];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke;
    v20[3] = &unk_263FF0780;
    v20[4] = self;
    id v21 = v10;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke_2;
    v18[3] = &unk_263FF04A0;
    id v19 = v9;
    id v17 = v10;
    [v16 performBatchUpdates:v20 completion:v18];
  }
}

void __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 deleteItemsAtIndexPaths:v3];
}

uint64_t __58__AVTStickerPagingController_deletePageForRecord_atIndex___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sheetDidDisappear];
}

- (void)reloadPageForRecord:(id)a3 atIndex:(int64_t)a4
{
  id v5 = -[AVTStickerPagingController reloadSheetControllerForRecord:](self, "reloadSheetControllerForRecord:", a3, a4);
  id v6 = [(AVTStickerPagingController *)self collectionView];
  [v6 reloadData];
}

- (void)setPageContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != self->_pageContentOffset.x || a3.y != self->_pageContentOffset.y) {
    self->_pageContentOffset = a3;
  }
  v7 = [(AVTStickerPagingController *)self collectionView];
  [v7 contentOffset];
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scrollToContentOffset:animated:", 0, x, y);
}

- (id)centeredPageWithOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AVTStickerPagingController *)self collectionView];
  v7 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v6, x, y);

  id v8 = -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", [v7 item]);

  return v8;
}

- (void)scrollToAvatarWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(AVTStickerPagingController *)self pageIndexForAvatarRecordIdentifier:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(AVTStickerPagingController *)self scrollToPageAtIndex:v6 animated:v4];
  }
}

- (void)scrollToPageAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(AVTStickerPagingController *)self dataSource];
  unint64_t v8 = [v7 numberOfRecords];

  if (v8 > a3)
  {
    id v13 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    uint64_t v9 = [(AVTStickerPagingController *)self dataSource];
    v10 = [v9 recordAtIndex:a3];
    v11 = [v10 identifier];
    [(AVTStickerPagingController *)self setFocusedPageRecordIdentifier:v11];

    if (v13)
    {
      id v12 = [(AVTStickerPagingController *)self collectionView];
      [v12 scrollToItemAtIndexPath:v13 atScrollPosition:16 animated:v4];
    }
  }
}

- (void)updateForEndingScrollWithTargetContentOffset:(CGPoint)a3
{
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:", a3.x, a3.y);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v8 avatarRecord];
  id v5 = [v4 identifier];
  [(AVTStickerPagingController *)self setFocusedPageRecordIdentifier:v5];

  int64_t v6 = [(AVTStickerPagingController *)self avatarPickerDelegate];
  v7 = [v8 avatarRecord];
  [v6 avatarPicker:self didSelectAvatarRecord:v7];
}

- (int64_t)pageIndexForAvatarRecordIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTStickerPagingController *)self dataSource];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__AVTStickerPagingController_pageIndexForAvatarRecordIdentifier___block_invoke;
  v9[3] = &unk_263FF0DB8;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfRecordPassingTest:v9];

  return v7;
}

uint64_t __65__AVTStickerPagingController_pageIndexForAvatarRecordIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(AVTStickerPagingController *)self presenterDelegate];
  [v5 presentAvatarUIController:v6 animated:1];
}

- (void)willStartDisplaying
{
  id v2 = [(AVTStickerPagingController *)self collectionView];
  [v2 reloadData];
}

- (void)willEndDisplaying
{
  id v3 = [(AVTStickerPagingController *)self taskScheduler];
  [v3 cancelAllTasks];

  id v4 = [(AVTStickerPagingController *)self stickerGeneratorPool];
  [v4 flush];
}

- (void)didEndDisplaying
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(AVTStickerPagingController *)self pageForRecords];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(AVTStickerPagingController *)self pageForRecords];
        id v10 = [v9 objectForKey:v8];

        [v10 sheetDidDisappear];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)firstPageItemView
{
  id v3 = [(AVTStickerPagingController *)self collectionView];
  [v3 contentOffset];
  uint64_t v4 = -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");

  uint64_t v5 = [v4 firstStickerView];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(AVTStickerPagingController *)self dataSource];
  int64_t v5 = [v4 numberOfRecords];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[AVTStickerPagingCollectionViewCell cellIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [v6 item];
  long long v11 = [(AVTStickerPagingController *)self sheetControllerAtIndex:v10];
  [(AVTStickerPagingController *)self pageContentInsets];
  objc_msgSend(v11, "setSectionInsets:");
  long long v12 = [v11 view];
  [v9 setPageContentView:v12];

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", objc_msgSend(a5, "item", a3, a4));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 sheetWillAppear];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AVTStickerPagingController *)self selectedStickerIdentifier];
    [v7 selectStickerWithIdentifier:v6];
  }
  [(AVTStickerPagingController *)self pageContentOffset];
  objc_msgSend(v7, "scrollToContentOffset:animated:", 0);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = [(AVTStickerPagingController *)self lastDeletedCell];

  if (v8 == v7)
  {
    [(AVTStickerPagingController *)self setLastDeletedCell:0];
  }
  else
  {
    uint64_t v9 = [(AVTStickerPagingController *)self collectionView];
    uint64_t v10 = [v9 indexPathsForVisibleItems];
    char v11 = [v10 containsObject:v13];

    if ((v11 & 1) == 0)
    {
      long long v12 = -[AVTStickerPagingController sheetControllerAtIndex:](self, "sheetControllerAtIndex:", [v13 item]);
      [v12 sheetDidDisappear];
    }
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        char v11 = [(AVTStickerPagingController *)self dataSource];
        long long v12 = objc_msgSend(v11, "recordAtIndex:", objc_msgSend(v10, "item"));

        [(AVTStickerPagingController *)self prefetchDataForRecord:v12];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        char v11 = [(AVTStickerPagingController *)self dataSource];
        long long v12 = objc_msgSend(v11, "recordAtIndex:", objc_msgSend(v10, "item"));

        [(AVTStickerPagingController *)self cancelPrefetchingDataForRecord:v12];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:", a3, a5->x, a5->y);
  double x = a5->x;
  double y = a5->y;
  -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:", x, y);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v7 = a3;
  if ((objc_msgSend(v7, "avtui_isMoving") & 1) != 0
    || ([(AVTStickerPagingController *)self endDraggingTargetContentOffset],
        double v5 = v4,
        [v7 contentOffset],
        v5 == v6))
  {
    [v7 contentOffset];
    -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:");
  }
  else
  {
    [v7 contentOffset];
    -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:");
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v7 = a3;
  if ((objc_msgSend(v7, "avtui_isMoving") & 1) != 0
    || ([(AVTStickerPagingController *)self endDraggingTargetContentOffset],
        double v5 = v4,
        [v7 contentOffset],
        v5 == v6))
  {
    [v7 contentOffset];
    -[AVTStickerPagingController setEndDraggingTargetContentOffset:](self, "setEndDraggingTargetContentOffset:");
  }
  else
  {
    [v7 contentOffset];
    -[AVTStickerPagingController updateForEndingScrollWithTargetContentOffset:](self, "updateForEndingScrollWithTargetContentOffset:");
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = a3;
  [v5 bounds];
  uint64_t v7 = 0x4072C00000000000;
  if (v8 <= 0.0)
  {
    uint64_t v9 = 0x4072C00000000000;
  }
  else
  {
    uint64_t v9 = 0x4072C00000000000;
    if (v6 > 0.0)
    {
      [v5 bounds];
      uint64_t v7 = v10;
      uint64_t v9 = v11;
    }
  }

  double v12 = *(double *)&v7;
  double v13 = *(double *)&v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  self->_pageContentOffset = a4;
  uint64_t v7 = [(AVTStickerPagingController *)self delegate];

  if (v7)
  {
    id v8 = [(AVTStickerPagingController *)self delegate];
    objc_msgSend(v8, "stickerPagingController:pageDidScrollToOffset:", self, x, y);
  }
}

- (void)stickerSheetController:(id)a3 scrollView:(id)a4 willEndDraggingWithTargetContentOffset:(CGPoint *)a5
{
  id v7 = a4;
  [(AVTStickerPagingController *)self pageContentInsets];
  double v9 = v8;
  [v7 contentOffset];
  double v11 = v10;

  if (v11 < v9)
  {
    double y = a5->y;
    if (y < v9)
    {
      BOOL v13 = y < v9 * 0.25;
      double v14 = 0.0;
      if (!v13) {
        double v14 = v9;
      }
      a5->double y = v14;
    }
  }
}

- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTStickerPagingController *)self stickerGeneratorPool];
  [v6 flushGeneratorForRecord:v5];
}

- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = [v9 avatarRecord];
  double v12 = [(AVTStickerPagingController *)self stickerConfigurationProvider];
  BOOL v13 = [v12 stickerConfigurationsForAvatarRecord:v11];

  if ([v13 count] > (unint64_t)a5)
  {
    double v14 = [v13 objectAtIndexedSubscript:a5];
    long long v15 = self->_environment;
    long long v16 = [v14 name];
    id v17 = [v9 avatarRecord];
    uint64_t v18 = [(AVTUIEnvironment *)v15 usageTrackingSession];
    [v18 didSelectStickerFromStickersApp:v16 withAvatar:v17];

    id v19 = [v10 identifier];
    [(AVTStickerPagingController *)self setSelectedStickerIdentifier:v19];

    v20 = [(AVTStickerPagingController *)self stickerSelectionDelegate];
    [v20 didSelectStickerWithConfiguration:v14 avatar:v17];

    id v21 = [(AVTAvatarRecordDataSource *)self->_dataSource internalRecordStore];
    uint64_t v22 = [v17 identifier];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __98__AVTStickerPagingController_stickerSheetController_didInteractWithStickerItem_atIndex_byPeeling___block_invoke;
    v24[3] = &unk_263FF0CF0;
    v25 = v15;
    v23 = v15;
    [v21 didUseStickerWithAvatarIdentifier:v22 stickerIdentifier:v16 completionHandler:v24];
  }
}

void __98__AVTStickerPagingController_stickerSheetController_didInteractWithStickerItem_atIndex_byPeeling___block_invoke(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    double v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v7 = [v4 logger];
    id v6 = [v5 localizedDescription];

    [v7 logErrorSavingRecentSticker:v6];
  }
}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  id v3 = [(AVTStickerPagingController *)self presenterDelegate];
  [v3 dismissAvatarUIControllerAnimated:1];
}

- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTStickerPagingController *)self dataSource];
  id v7 = +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:v5 withDataSource:v6];

  if (v7)
  {
    double v8 = [v7 avatarRecord];

    if (v8)
    {
      id v9 = [v7 avatarRecord];
      id v10 = [v9 identifier];
      [(AVTStickerPagingController *)self scrollToAvatarWithIdentifier:v10 animated:0];

      double v11 = [(AVTStickerPagingController *)self avatarPickerDelegate];
      double v12 = [v7 avatarRecord];
      [v11 avatarPicker:self didSelectAvatarRecord:v12];
    }
  }
  return v7;
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  -[AVTStickerPagingController setIsResizing:](self, "setIsResizing:", 1, a3.width, a3.height);
  double v4 = [(AVTStickerPagingController *)self view];
  id v5 = [(AVTStickerPagingController *)self collectionView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  id v10 = [(AVTStickerPagingController *)self collectionView];
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  long long v15 = [(AVTStickerPagingController *)self focusedPageRecordIdentifier];

  if (!v15)
  {
    long long v16 = [(AVTStickerPagingController *)self dataSource];
    id v17 = [(AVTStickerPagingController *)self collectionView];
    uint64_t v18 = objc_msgSend(v17, "indexPathForItemAtPoint:", v12, v14);
    id v19 = objc_msgSend(v16, "recordAtIndex:", objc_msgSend(v18, "row"));

    v20 = [v19 identifier];
    [(AVTStickerPagingController *)self setFocusedPageRecordIdentifier:v20];
  }
  id v22 = [(AVTStickerPagingController *)self collectionView];
  id v21 = [v22 collectionViewLayout];
  [v21 invalidateLayout];
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  if (a3.width > 0.0 && a3.height > 0.0)
  {
    id v5 = [(AVTStickerPagingController *)self collectionView];
    [v5 layoutIfNeeded];

    double v6 = [(AVTStickerPagingController *)self focusedPageRecordIdentifier];
    [(AVTStickerPagingController *)self scrollToAvatarWithIdentifier:v6 animated:0];

    [(AVTStickerPagingController *)self setIsResizing:0];
    double v7 = [(AVTStickerPagingController *)self collectionView];
    [v7 contentOffset];
    -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    [(AVTStickerPagingController *)self pageContentOffset];
    objc_msgSend(v8, "scrollToContentOffset:animated:", 1);
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if ([(AVTStickerPagingController *)self isResizing])
  {
    id v8 = [(AVTStickerPagingController *)self focusedPageRecordIdentifier];
    uint64_t v9 = [(AVTStickerPagingController *)self pageIndexForAvatarRecordIdentifier:v8];

    id v10 = [v7 collectionViewLayout];
    double v11 = [MEMORY[0x263F088C8] indexPathForItem:v9 inSection:0];
    [(AVTStickerPagingController *)self collectionView:v7 layout:v10 sizeForItemAtIndexPath:v11];
    double v13 = v12;

    double x = v13 * (double)v9;
  }

  double v14 = x;
  double v15 = y;
  result.CGFloat y = v15;
  result.double x = v14;
  return result;
}

- (void)clearStickerSelection
{
  [(AVTStickerPagingController *)self setSelectedStickerIdentifier:0];
  uint64_t v3 = [(AVTStickerPagingController *)self collectionView];
  [v3 contentOffset];
  -[AVTStickerPagingController centeredPageWithOffset:](self, "centeredPageWithOffset:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v4 clearStickerSelection];
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

- (UIEdgeInsets)pageContentInsets
{
  double top = self->_pageContentInsets.top;
  double left = self->_pageContentInsets.left;
  double bottom = self->_pageContentInsets.bottom;
  double right = self->_pageContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)pageContentOffset
{
  double x = self->_pageContentOffset.x;
  double y = self->_pageContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (AVTStickerPagingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTStickerPagingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
  return (AVTStickerDisclosureValidationDelegate *)WeakRetained;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
}

- (AVTStickerSelectionDelegate)stickerSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerSelectionDelegate);
  return (AVTStickerSelectionDelegate *)WeakRetained;
}

- (void)setStickerSelectionDelegate:(id)a3
{
}

- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerSheetControllerProvider);
  return (AVTStickerSheetControllerProvider *)WeakRetained;
}

- (void)setStickerSheetControllerProvider:(id)a3
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

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (AVTUIStickerGeneratorPool)stickerGeneratorPool
{
  return self->_stickerGeneratorPool;
}

- (void)setStickerGeneratorPool:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)pageForRecords
{
  return self->_pageForRecords;
}

- (void)setPageForRecords:(id)a3
{
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (NSString)focusedPageRecordIdentifier
{
  return self->_focusedPageRecordIdentifier;
}

- (void)setFocusedPageRecordIdentifier:(id)a3
{
}

- (NSString)selectedStickerIdentifier
{
  return self->_selectedStickerIdentifier;
}

- (void)setSelectedStickerIdentifier:(id)a3
{
}

- (AVTStickerConfigurationProvider)stickerConfigurationProvider
{
  return self->_stickerConfigurationProvider;
}

- (void)setView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CGPoint)endDraggingTargetContentOffset
{
  double x = self->_endDraggingTargetContentOffset.x;
  double y = self->_endDraggingTargetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndDraggingTargetContentOffset:(CGPoint)a3
{
  self->_endDraggingTargetContentOffset = a3;
}

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void)setIsResizing:(BOOL)a3
{
  self->_isResizing = a3;
}

- (UICollectionViewCell)lastDeletedCell
{
  return self->_lastDeletedCell;
}

- (void)setLastDeletedCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeletedCell, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_stickerConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_selectedStickerIdentifier, 0);
  objc_storeStrong((id *)&self->_focusedPageRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_pageForRecords, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerGeneratorPool, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_destroyWeak((id *)&self->_stickerSheetControllerProvider);
  objc_destroyWeak((id *)&self->_stickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end