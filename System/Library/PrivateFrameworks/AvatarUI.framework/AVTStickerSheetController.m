@interface AVTStickerSheetController
- (AVTAvatarRecord)avatarRecord;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (AVTStickerSheetCollectionView)collectionView;
- (AVTStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPeel:(BOOL)a5;
- (AVTStickerSheetControllerDelegate)delegate;
- (AVTStickerSheetModel)model;
- (AVTStickerTaskScheduler)taskScheduler;
- (BOOL)allowsPeel;
- (BOOL)areAllStickersRendered;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)isPageVisible;
- (BOOL)showPrereleaseSticker;
- (CGPoint)maxedContentOffset:(CGPoint)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)minimumContentSizeForSize:(CGSize)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)sectionInsets;
- (UIImage)placeholderImage;
- (UIView)view;
- (double)numberOfItemsPerRow;
- (double)topPadding;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dragPreviewContainerForLiftingStickerInStickerCell:(id)a3;
- (id)firstStickerView;
- (id)placeholderProvider;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)clearStickerRendererIfNeeded;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)discardStickerItems;
- (void)loadView;
- (void)notifyingContainerViewWillChangeSize:(CGSize)a3;
- (void)reloadCollectionViewItemForStickerItem:(id)a3;
- (void)scheduleSheetPlaceholderTask:(id)a3;
- (void)scheduleSheetStickerTask:(id)a3 withIndexPath:(id)a4;
- (void)scrollToContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAreAllStickersRendered:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
- (void)setIsPageVisible:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSectionInsets:(UIEdgeInsets)a3;
- (void)setShowPrereleaseSticker:(BOOL)a3;
- (void)setView:(id)a3;
- (void)sheetDidDisappear;
- (void)sheetWillAppear;
- (void)startAllSchedulerTasks;
- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3;
- (void)stickerCellDidPeelSticker:(id)a3;
- (void)stickerCellDidTapSticker:(id)a3;
- (void)updateItem:(id)a3 withStickerResource:(id)a4 reloadCell:(BOOL)a5;
@end

@implementation AVTStickerSheetController

- (AVTStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPeel:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVTStickerSheetController;
  v11 = [(AVTStickerSheetController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_allowsPeel = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_taskScheduler, a4);
    int v13 = AVTUIShowPrereleaseStickerPack_once();
    if (v13) {
      LOBYTE(v13) = AVTUIShowPrereleaseStickerLabel_once();
    }
    v12->_showPrereleaseSticker = v13;
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(AVTStickerSheetController *)self model];
  v4 = [v3 stickerRenderer];
  [v4 stopUsingResources];

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerSheetController;
  [(AVTStickerSheetController *)&v5 dealloc];
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    [(AVTStickerSheetController *)self loadView];
    view = self->_view;
  }
  return view;
}

- (double)topPadding
{
  v3 = [(AVTStickerSheetController *)self model];
  v4 = [v3 environment];
  if ([v4 deviceIsPad])
  {

    return 8.0;
  }
  else
  {
    v6 = [(AVTStickerSheetController *)self model];
    v7 = [v6 environment];
    char v8 = [v7 deviceIsMac];

    double result = 8.0;
    if ((v8 & 1) == 0)
    {
      id v9 = [(AVTStickerSheetController *)self model];
      id v10 = [v9 environment];
      int v11 = [v10 deviceIsVision];

      double result = 12.0;
      if (v11) {
        return 16.0;
      }
    }
  }
  return result;
}

- (CGSize)minimumContentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(AVTStickerSheetController *)self sectionInsets];
  double v7 = v6;
  [(AVTStickerSheetController *)self sectionInsets];
  double v9 = height + v7 + v8;
  double v10 = width;
  result.double height = v9;
  result.CGFloat width = v10;
  return result;
}

- (CGPoint)maxedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(AVTStickerSheetController *)self collectionView];
  [v6 contentSize];
  double v8 = v7;
  double v9 = [(AVTStickerSheetController *)self collectionView];
  [v9 bounds];
  double v11 = v8 - v10;
  v12 = [(AVTStickerSheetController *)self collectionView];
  [v12 adjustedContentInset];
  double v14 = v11 + v13;

  if (y <= v14) {
    double v15 = y;
  }
  else {
    double v15 = v14;
  }
  double v16 = x;
  result.double y = v15;
  result.CGFloat x = v16;
  return result;
}

- (void)loadView
{
  v17 = objc_alloc_init(AVTMinimumContentSizeCollectionViewLayout);
  v3 = [(AVTStickerSheetController *)self model];
  v4 = [v3 environment];
  char v5 = [v4 deviceIsMac];

  double v6 = 10.0;
  if ((v5 & 1) == 0)
  {
    double v7 = [(AVTStickerSheetController *)self model];
    double v8 = [v7 environment];
    int v9 = [v8 deviceIsVision];

    double v6 = 16.0;
    if (v9) {
      double v6 = 10.0;
    }
  }
  [(UICollectionViewFlowLayout *)v17 setMinimumInteritemSpacing:v6];
  [(UICollectionViewFlowLayout *)v17 minimumInteritemSpacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v17, "setMinimumLineSpacing:");
  double v10 = [AVTStickerSheetCollectionView alloc];
  double v11 = -[AVTStickerSheetCollectionView initWithFrame:collectionViewLayout:](v10, "initWithFrame:collectionViewLayout:", v17, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v12 = [MEMORY[0x263F1C550] clearColor];
  [(AVTStickerSheetCollectionView *)v11 setBackgroundColor:v12];

  [(AVTStickerSheetCollectionView *)v11 setDataSource:self];
  [(AVTStickerSheetCollectionView *)v11 setDelegate:self];
  [(AVTStickerSheetCollectionView *)v11 setShowsVerticalScrollIndicator:0];
  [(AVTStickerSheetCollectionView *)v11 setContentInsetAdjustmentBehavior:2];
  uint64_t v13 = objc_opt_class();
  double v14 = +[AVTStickerCollectionViewCell cellIdentifier];
  [(AVTStickerSheetCollectionView *)v11 registerClass:v13 forCellWithReuseIdentifier:v14];

  [(AVTStickerSheetCollectionView *)v11 setAutoresizingMask:18];
  [(AVTStickerSheetController *)self setCollectionView:v11];
  double v15 = [AVTNotifyingContainerView alloc];
  [(AVTStickerSheetCollectionView *)v11 frame];
  double v16 = -[AVTNotifyingContainerView initWithFrame:](v15, "initWithFrame:");
  [(AVTNotifyingContainerView *)v16 setDelegate:self];
  [(AVTNotifyingContainerView *)v16 addSubview:v11];
  [(AVTStickerSheetController *)self setView:v16];
}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionInsets.left
    || a3.top != self->_sectionInsets.top
    || a3.right != self->_sectionInsets.right
    || a3.bottom != self->_sectionInsets.bottom)
  {
    self->_sectionInsets = a3;
    id v7 = [(AVTStickerSheetController *)self collectionView];
    double v6 = [v7 collectionViewLayout];
    [v6 invalidateLayout];
  }
}

- (AVTAvatarRecord)avatarRecord
{
  v2 = [(AVTStickerSheetController *)self model];
  v3 = [v2 avatarRecord];

  return (AVTAvatarRecord *)v3;
}

- (void)sheetDidDisappear
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(AVTStickerSheetController *)self setIsPageVisible:0];
  v3 = [(AVTStickerSheetController *)self model];
  v4 = [v3 avatarRecord];
  char v5 = [v4 identifier];

  double v6 = [(AVTStickerSheetController *)self taskScheduler];
  [v6 cancelStickerSheetTasksForAvatarRecordIdentifier:v5];

  [(AVTStickerSheetController *)self discardStickerItems];
  id v7 = [(AVTStickerSheetController *)self collectionView];

  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = [(AVTStickerSheetController *)self collectionView];
    int v9 = [v8 visibleCells];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v13++) purgeImageContents];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    double v14 = [(AVTStickerSheetController *)self collectionView];
    [v14 _purgeReuseQueues];
  }
  double v15 = [(AVTStickerSheetController *)self model];
  double v16 = [v15 stickerRenderer];
  [v16 stopUsingResources];
}

- (void)sheetWillAppear
{
  if (![(AVTStickerSheetController *)self isPageVisible])
  {
    if (!self->_view) {
      [(AVTStickerSheetController *)self loadView];
    }
    [(AVTStickerSheetController *)self setIsPageVisible:1];
    v3 = [(AVTStickerSheetController *)self collectionView];
    v4 = [v3 indexPathsForVisibleItems];

    if ([v4 count])
    {
      char v5 = [(AVTStickerSheetController *)self taskScheduler];
      [v5 setVisibleIndexPaths:v4];

      double v6 = (void *)MEMORY[0x263F1CB60];
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      uint64_t v10 = __44__AVTStickerSheetController_sheetWillAppear__block_invoke;
      uint64_t v11 = &unk_263FF0780;
      uint64_t v12 = self;
      id v7 = v4;
      id v13 = v7;
      [v6 performWithoutAnimation:&v8];
      -[AVTStickerSheetController startAllSchedulerTasksExcludingVisibleIndexPaths:](self, "startAllSchedulerTasksExcludingVisibleIndexPaths:", v7, v8, v9, v10, v11, v12);
    }
  }
}

void __44__AVTStickerSheetController_sheetWillAppear__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadItemsAtIndexPaths:*(void *)(a1 + 40)];
}

- (void)startAllSchedulerTasks
{
}

- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3
{
  id v4 = a3;
  if (![(AVTStickerSheetController *)self areAllStickersRendered])
  {
    char v5 = [(AVTStickerSheetController *)self model];
    double v6 = [v5 stickerItems];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke;
    v7[3] = &unk_263FF0890;
    id v8 = v4;
    uint64_t v9 = self;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

void __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0
    && ([v5 hasBeenRendered] & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_initWeak(&from, v5);
    id v7 = [v5 resourceProvider];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2;
    uint64_t v12 = &unk_263FF0868;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    id v8 = ((void (**)(void, uint64_t *, void))v7)[2](v7, &v9, 0);

    objc_msgSend(*(id *)(a1 + 40), "scheduleSheetStickerTask:withIndexPath:", v8, v6, v9, v10, v11, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __78__AVTStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateItem:v5 withStickerResource:v4 reloadCell:1];
}

- (void)scheduleSheetPlaceholderTask:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AVTStickerSheetController *)self model];
    double v6 = [v5 avatarRecord];
    id v7 = [v6 identifier];
    id v9 = +[AVTStickerTask stickerTaskForSchedulerTask:v4 avatarRecordIdentifier:v7 indexPath:0 stickerType:1];

    id v8 = [(AVTStickerSheetController *)self taskScheduler];
    [v8 scheduleStickerTask:v9];
  }
}

- (void)scheduleSheetStickerTask:(id)a3 withIndexPath:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(AVTStickerSheetController *)self model];
    id v9 = [v8 avatarRecord];
    uint64_t v10 = [v9 identifier];
    id v12 = +[AVTStickerTask stickerTaskForSchedulerTask:v7 avatarRecordIdentifier:v10 indexPath:v6 stickerType:2];

    uint64_t v11 = [(AVTStickerSheetController *)self taskScheduler];
    [v11 scheduleStickerTask:v12];
  }
}

- (id)firstStickerView
{
  v3 = [(AVTStickerSheetController *)self collectionView];

  if (v3)
  {
    id v4 = [(AVTStickerSheetController *)self collectionView];
    id v5 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    id v6 = [v4 cellForItemAtIndexPath:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)discardStickerItems
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(AVTStickerSheetController *)self model];
  v3 = [v2 stickerItems];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) discardContent];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)areAllStickersRendered
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_areAllStickersRendered) {
    return 1;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(AVTStickerSheetController *)self model];
  uint64_t v5 = [v4 stickerItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) hasBeenRendered])
        {
          BOOL v2 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 1;
LABEL_13:

  self->_areAllStickersRendered = v2;
  return v2;
}

- (void)clearStickerRendererIfNeeded
{
  if ([(AVTStickerSheetController *)self areAllStickersRendered])
  {
    id v4 = [(AVTStickerSheetController *)self delegate];
    v3 = [(AVTStickerSheetController *)self avatarRecord];
    [v4 stickerSheetController:self didFinishRenderingStickersForRecord:v3];
  }
}

- (double)numberOfItemsPerRow
{
  BOOL v2 = [(AVTStickerSheetController *)self view];
  [v2 bounds];
  double v4 = v3;

  double result = 3.0;
  if (v4 > 600.0) {
    return 6.0;
  }
  return result;
}

- (void)updateItem:(id)a3 withStickerResource:(id)a4 reloadCell:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  long long v10 = [v9 image];
  unsigned int v11 = [v8 hasBeenRendered];
  if (v10) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  [v8 setHasBeenRendered:v12];

  [(AVTStickerSheetController *)self clearStickerRendererIfNeeded];
  [v9 clippingRect];
  objc_msgSend(v8, "setClippingRect:");
  if ([(AVTStickerSheetController *)self isPageVisible])
  {
    long long v13 = [(AVTStickerSheetController *)self collectionView];

    if (v13)
    {
      long long v14 = [v8 cachedMSSticker];
      if (v14)
      {
      }
      else
      {
        double v15 = [v9 URL];

        if (v15)
        {
          uint64_t v16 = [(AVTStickerSheetController *)self delegate];
          char v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) == 0) {
            goto LABEL_11;
          }
          long long v18 = [(AVTStickerSheetController *)self delegate];
          long long v19 = [v9 URL];
          long long v20 = [v8 localizedName];
          v21 = [v8 identifier];
          uint64_t v22 = [v18 stickerSheetController:self requestsStickerForFileURL:v19 localizedDescription:v20 forItemWithIdentifier:v21];

          if (!v22)
          {
LABEL_11:
            id v23 = objc_alloc(MEMORY[0x263F125C8]);
            v24 = [v9 URL];
            v25 = [v8 localizedName];
            uint64_t v26 = 0;
            uint64_t v22 = (void *)[v23 initWithContentsOfFileURL:v24 localizedDescription:v25 error:&v26];
          }
          [v8 setCachedMSSticker:v22];
          if (v5) {
            [(AVTStickerSheetController *)self reloadCollectionViewItemForStickerItem:v8];
          }
        }
      }
    }
  }
}

- (void)reloadCollectionViewItemForStickerItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTStickerSheetController *)self collectionView];

  if (v5)
  {
    uint64_t v6 = [(AVTStickerSheetController *)self model];
    uint64_t v7 = [v6 stickerItems];
    uint64_t v8 = [v7 indexOfObject:v4];

    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [MEMORY[0x263F088C8] indexPathForItem:v8 inSection:0];
      long long v10 = [(AVTStickerSheetController *)self collectionView];
      unsigned int v11 = [v10 indexPathsForVisibleItems];
      int v12 = [v11 containsObject:v9];

      if (v12)
      {
        long long v13 = (void *)MEMORY[0x263F1CB60];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __68__AVTStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke;
        v14[3] = &unk_263FF0780;
        v14[4] = self;
        id v15 = v9;
        [v13 performWithoutAnimation:v14];
      }
    }
  }
}

void __68__AVTStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = *(void *)(a1 + 40);
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 reloadItemsAtIndexPaths:v3];
}

- (id)placeholderProvider
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__AVTStickerSheetController_placeholderProvider__block_invoke;
  v8[3] = &unk_263FF08E0;
  objc_copyWeak(&v9, &location);
  BOOL v2 = (void *)[v8 copy];
  uint64_t v6 = (void *)MEMORY[0x210530210](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __48__AVTStickerSheetController_placeholderProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained placeholderImage];

  if (v5)
  {
    uint64_t v6 = [WeakRetained placeholderImage];
    v3[2](v3, v6);

    uint64_t v7 = 0;
  }
  else
  {
    objc_initWeak(&location, WeakRetained);
    uint64_t v8 = [WeakRetained model];
    id v9 = [v8 placeholderProviderFactory];
    long long v10 = [v9 placeholderProvider];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__AVTStickerSheetController_placeholderProvider__block_invoke_2;
    v13[3] = &unk_263FF08B8;
    objc_copyWeak(&v15, &location);
    long long v14 = v3;
    unsigned int v11 = ((void (**)(void, void *, void))v10)[2](v10, v13, 0);

    uint64_t v7 = (void *)MEMORY[0x210530210](v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__AVTStickerSheetController_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained placeholderImage];

  if (!v4)
  {
    uint64_t v5 = [v8 imageWithRenderingMode:2];
    [WeakRetained setPlaceholderImage:v5];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [WeakRetained placeholderImage];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(AVTStickerSheetController *)self model];
  uint64_t v5 = [v4 stickerItems];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AVTStickerCollectionViewCell cellIdentifier];
  id v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v7];

  long long v10 = [MEMORY[0x263F08C38] UUID];
  [v9 setDisplaySessionUUID:v10];
  objc_msgSend(v9, "setAllowsPeel:", -[AVTStickerSheetController allowsPeel](self, "allowsPeel"));
  [v9 setDelegate:self];
  unsigned int v11 = [(AVTStickerSheetController *)self disclosureValidationDelegate];
  [v9 setDisclosureValidationDelegate:v11];

  objc_msgSend(v9, "setShowPrereleaseSticker:", -[AVTStickerSheetController showPrereleaseSticker](self, "showPrereleaseSticker"));
  int v12 = [(AVTStickerSheetController *)self model];
  long long v13 = [v12 stickerItems];
  long long v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "row"));

  [v14 clippingRect];
  objc_msgSend(v9, "setClippingRect:");
  id v15 = [v14 cachedMSSticker];

  if (v15)
  {
    uint64_t v16 = [v14 cachedMSSticker];
    [v9 updateWithImage:0 sticker:v16 animated:0];
  }
  else
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v14);
    char v17 = [(AVTStickerSheetController *)self placeholderImage];

    id v27 = v6;
    if (v17)
    {
      long long v18 = [(AVTStickerSheetController *)self placeholderImage];
      long long v19 = [v14 cachedMSSticker];
      [v9 updateWithImage:v18 sticker:v19 animated:0];
    }
    else
    {
      long long v20 = [(AVTStickerSheetController *)self placeholderProvider];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke;
      v34[3] = &unk_263FF0908;
      objc_copyWeak(&v37, &from);
      id v35 = v9;
      id v36 = v10;
      v21 = ((void (**)(void, void *, void))v20)[2](v20, v34, 0);

      [(AVTStickerSheetController *)self scheduleSheetPlaceholderTask:v21];
      objc_destroyWeak(&v37);
    }
    uint64_t v22 = objc_opt_new();
    id v23 = [v14 resourceProvider];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v28[3] = &unk_263FF0930;
    objc_copyWeak(&v32, location);
    objc_copyWeak(&v33, &from);
    id v29 = v9;
    id v30 = v10;
    id v24 = v22;
    id v31 = v24;
    v25 = ((void (**)(void, void *, uint64_t))v23)[2](v23, v28, 1);

    [(AVTStickerSheetController *)self scheduleSheetStickerTask:v25 withIndexPath:v7];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
    id v6 = v27;
  }

  return v9;
}

void __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) displaySessionUUID];
  uint64_t v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    id v6 = [WeakRetained cachedMSSticker];

    if (!v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [WeakRetained cachedMSSticker];
      [v7 updateWithImage:v9 sticker:v8 animated:0];
    }
  }
}

void __67__AVTStickerSheetController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 URL];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = objc_loadWeakRetained((id *)(a1 + 64));
    id v6 = [*(id *)(a1 + 32) displaySessionUUID];
    id v7 = *(void **)(a1 + 40);

    [WeakRetained updateItem:v5 withStickerResource:v13 reloadCell:v6 != v7];
    if (v6 == v7 && [WeakRetained isPageVisible])
    {
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      BOOL v9 = v8 < -0.1;
      [v5 clippingRect];
      objc_msgSend(*(id *)(a1 + 32), "setClippingRect:");
      long long v10 = *(void **)(a1 + 32);
      unsigned int v11 = [v13 image];
      int v12 = [v5 cachedMSSticker];
      [v10 updateWithImage:v11 sticker:v12 animated:v9];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = [(AVTStickerSheetController *)self collectionView];
  id v8 = [v6 indexPathsForVisibleItems];

  id v7 = [(AVTStickerSheetController *)self taskScheduler];
  [v7 setVisibleIndexPaths:v8];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v7 format];
  }
  [v7 minimumInteritemSpacing];
  double v10 = v9;
  [(AVTStickerSheetController *)self sectionInsets];
  double v12 = v11;
  [(AVTStickerSheetController *)self topPadding];
  double v14 = v12 + v13;
  [v8 safeAreaInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v10 + v16;
  double v23 = v18 + 12.0;
  double v24 = v10 + v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v8 format];
  }
  id v11 = v8;
  [(AVTStickerSheetController *)self numberOfItemsPerRow];
  double v13 = v12;
  uint64_t v14 = [v9 section];

  [(AVTStickerSheetController *)self collectionView:v10 layout:v11 insetForSectionAtIndex:v14];
  double v16 = v15;
  double v18 = v17;
  [v10 bounds];
  double v20 = v19;

  double v21 = v20 - v16 - v18;
  [v11 minimumInteritemSpacing];
  double v23 = v22;

  double v24 = floor((v21 - v23 * (v13 + -1.0)) / v13);
  if (v24 <= 0.0) {
    double v25 = 300.0;
  }
  else {
    double v25 = v24;
  }

  double v26 = v25;
  double v27 = v25;
  result.double height = v27;
  result.CGFloat width = v26;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(AVTStickerSheetController *)self delegate];

  if (v4)
  {
    id v5 = [(AVTStickerSheetController *)self delegate];
    [v6 contentOffset];
    objc_msgSend(v5, "stickerSheetController:didScrollToContentOffset:", self);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v9 = a3;
  id v7 = [(AVTStickerSheetController *)self delegate];

  if (v7)
  {
    id v8 = [(AVTStickerSheetController *)self delegate];
    [v8 stickerSheetController:self scrollView:v9 willEndDraggingWithTargetContentOffset:a5];
  }
}

- (void)scrollToContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(AVTStickerSheetController *)self collectionView];

  if (v8)
  {
    id v9 = [(AVTStickerSheetController *)self collectionView];
    [v9 layoutIfNeeded];

    id v10 = [(AVTStickerSheetController *)self collectionView];
    -[AVTStickerSheetController maxedContentOffset:](self, "maxedContentOffset:", x, y);
    objc_msgSend(v10, "setContentOffset:animated:", v4);
  }
}

- (void)stickerCellDidTapSticker:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTStickerSheetController *)self collectionView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(AVTStickerSheetController *)self model];
  id v7 = [v6 stickerItems];
  id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));

  id v9 = [(AVTStickerSheetController *)self delegate];
  objc_msgSend(v9, "stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:", self, v8, objc_msgSend(v10, "item"), 0);
}

- (void)stickerCellDidPeelSticker:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTStickerSheetController *)self collectionView];
  id v10 = [v5 indexPathForCell:v4];

  id v6 = [(AVTStickerSheetController *)self model];
  id v7 = [v6 stickerItems];
  id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v10, "row"));

  id v9 = [(AVTStickerSheetController *)self delegate];
  objc_msgSend(v9, "stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:", self, v8, objc_msgSend(v10, "item"), 1);
}

- (id)dragPreviewContainerForLiftingStickerInStickerCell:(id)a3
{
  uint64_t v3 = [(AVTStickerSheetController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(AVTStickerSheetController *)self collectionView];

  if (v6)
  {
    id v7 = [(AVTStickerSheetController *)self collectionView];
    id v8 = [v7 collectionViewLayout];

    -[AVTStickerSheetController minimumContentSizeForSize:](self, "minimumContentSizeForSize:", width, height);
    objc_msgSend(v8, "setMinimumContentSize:");
    [v8 invalidateLayout];
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

- (AVTStickerSheetControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTStickerSheetControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)sectionInsets
{
  double top = self->_sectionInsets.top;
  double left = self->_sectionInsets.left;
  double bottom = self->_sectionInsets.bottom;
  double right = self->_sectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->disclosureValidationDelegate);
  return (AVTStickerDisclosureValidationDelegate *)WeakRetained;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (void)setView:(id)a3
{
}

- (AVTStickerSheetCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)isPageVisible
{
  return self->_isPageVisible;
}

- (void)setIsPageVisible:(BOOL)a3
{
  self->_isPageVisible = a3;
}

- (void)setAreAllStickersRendered:(BOOL)a3
{
  self->_areAllStickersRendered = a3;
}

- (AVTStickerSheetModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  self->_showPrereleaseSticker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end