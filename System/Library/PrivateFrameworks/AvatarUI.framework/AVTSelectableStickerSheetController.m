@interface AVTSelectableStickerSheetController
- (AVTAvatarRecord)avatarRecord;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTSelectableStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPoseCapture:(BOOL)a5;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (AVTStickerSheetControllerDelegate)delegate;
- (AVTStickerSheetDelegate)stickerSheetDelegate;
- (AVTStickerSheetModel)model;
- (AVTStickerTaskScheduler)taskScheduler;
- (AVTStickerViewControllerImageDelegate)imageDelegate;
- (AVTUIStickerItem)cameraStickerItem;
- (BOOL)allowsPoseCapture;
- (BOOL)areAllStickersRendered;
- (BOOL)isCameraItem:(id)a3;
- (BOOL)isPageVisible;
- (BOOL)showCellSelectionLayer;
- (BOOL)showPrereleaseSticker;
- (CGPoint)maxedContentOffset:(CGPoint)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)minimumContentSizeForSize:(CGSize)a3;
- (NSArray)stickerItems;
- (NSIndexPath)selectedIndexPath;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)sectionInsets;
- (UIImage)placeholderImage;
- (UIView)view;
- (double)numberOfItemsPerRow;
- (double)topPadding;
- (id)cellForCameraItemAtIndexPath:(id)a3;
- (id)cellForStickerItem:(id)a3 atIndexPath:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)firstStickerView;
- (id)placeholderProvider;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)stickerIndexInModelforIndexPath:(id)a3;
- (void)clearStickerRendererIfNeeded;
- (void)clearStickerSelection;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didInteractWithStickerAtIndexPath:(id)a3 byPeeling:(BOOL)a4;
- (void)discardStickerItems;
- (void)loadView;
- (void)notifyingContainerViewWillChangeSize:(CGSize)a3;
- (void)reloadCollectionViewItemForStickerItem:(id)a3;
- (void)scheduleSheetPlaceholderTask:(id)a3;
- (void)scheduleSheetStickerTask:(id)a3 withIndexPath:(id)a4;
- (void)scrollToContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectStickerWithIdentifier:(id)a3;
- (void)setAllowsPoseCapture:(BOOL)a3;
- (void)setAreAllStickersRendered:(BOOL)a3;
- (void)setCameraStickerItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
- (void)setImageDelegate:(id)a3;
- (void)setIsPageVisible:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSectionInsets:(UIEdgeInsets)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setShowCellSelectionLayer:(BOOL)a3;
- (void)setShowPrereleaseSticker:(BOOL)a3;
- (void)setStickerItems:(id)a3;
- (void)setStickerSheetDelegate:(id)a3;
- (void)setView:(id)a3;
- (void)sheetDidDisappear;
- (void)sheetWillAppear;
- (void)startAllSchedulerTasks;
- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3;
- (void)stickerCellDidPeelSticker:(id)a3;
- (void)stickerCellDidTapSticker:(id)a3;
- (void)updateCell:(id)a3 withImage:(id)a4 sticker:(id)a5 animated:(BOOL)a6;
- (void)updateItem:(id)a3 withStickerResource:(id)a4 reloadCell:(BOOL)a5;
@end

@implementation AVTSelectableStickerSheetController

- (AVTSelectableStickerSheetController)initWithStickerSheetModel:(id)a3 taskScheduler:(id)a4 allowsPoseCapture:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AVTSelectableStickerSheetController;
  v11 = [(AVTSelectableStickerSheetController *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_allowsPoseCapture = v5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_taskScheduler, a4);
    int v13 = AVTUIShowPrereleaseStickerPack_once();
    if (v13) {
      LOBYTE(v13) = AVTUIShowPrereleaseStickerLabel_once();
    }
    v12->_showPrereleaseSticker = v13;
    v14 = (void *)MEMORY[0x263EFF980];
    v15 = [(AVTStickerSheetModel *)v12->_model stickerItems];
    v16 = [v14 arrayWithArray:v15];

    if (v5 && AVTUIIsFacetrackingSupported())
    {
      v17 = [AVTUIStickerItem alloc];
      v18 = AVTAvatarUIBundle();
      v19 = [v18 localizedStringForKey:@"CUSTOM_POSE" value:&stru_26BF058D0 table:@"Localized"];
      v20 = [(AVTUIStickerItem *)v17 initWithIdentifier:@"cameraStickerItem" localizedName:v19 resourceProvider:0];

      [v16 insertObject:v20 atIndex:0];
      objc_storeWeak((id *)&v12->_cameraStickerItem, v20);
    }
    [(AVTSelectableStickerSheetController *)v12 setStickerItems:v16];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [(AVTSelectableStickerSheetController *)self model];
  v4 = [v3 stickerRenderer];
  [v4 stopUsingResources];

  v5.receiver = self;
  v5.super_class = (Class)AVTSelectableStickerSheetController;
  [(AVTSelectableStickerSheetController *)&v5 dealloc];
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    [(AVTSelectableStickerSheetController *)self loadView];
    view = self->_view;
  }
  return view;
}

- (double)topPadding
{
  v3 = [(AVTSelectableStickerSheetController *)self model];
  v4 = [v3 environment];
  if ([v4 deviceIsPad])
  {

    return 8.0;
  }
  else
  {
    v6 = [(AVTSelectableStickerSheetController *)self model];
    v7 = [v6 environment];
    char v8 = [v7 deviceIsMac];

    double result = 8.0;
    if ((v8 & 1) == 0)
    {
      id v9 = [(AVTSelectableStickerSheetController *)self model];
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
  [(AVTSelectableStickerSheetController *)self sectionInsets];
  double v7 = v6;
  [(AVTSelectableStickerSheetController *)self sectionInsets];
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
  double v6 = [(AVTSelectableStickerSheetController *)self collectionView];
  [v6 contentSize];
  double v8 = v7;
  double v9 = [(AVTSelectableStickerSheetController *)self collectionView];
  [v9 bounds];
  double v11 = v8 - v10;
  v12 = [(AVTSelectableStickerSheetController *)self collectionView];
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
  double v14 = objc_alloc_init(AVTMinimumContentSizeCollectionViewLayout);
  v3 = [(AVTSelectableStickerSheetController *)self model];
  v4 = [v3 environment];
  int v5 = [v4 deviceIsMac];
  double v6 = 16.0;
  if (v5) {
    double v6 = 10.0;
  }
  [(UICollectionViewFlowLayout *)v14 setMinimumInteritemSpacing:v6];

  [(UICollectionViewFlowLayout *)v14 minimumInteritemSpacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v14, "setMinimumLineSpacing:");
  id v7 = objc_alloc(MEMORY[0x263F1C4E0]);
  double v8 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v14, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v9 = [MEMORY[0x263F1C550] clearColor];
  [v8 setBackgroundColor:v9];

  [v8 setDataSource:self];
  [v8 setDelegate:self];
  [v8 setShowsVerticalScrollIndicator:0];
  [v8 setContentInsetAdjustmentBehavior:2];
  uint64_t v10 = objc_opt_class();
  double v11 = +[AVTStickerCollectionViewCell cellIdentifier];
  [v8 registerClass:v10 forCellWithReuseIdentifier:v11];

  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cameraIconCell"];
  [v8 setAutoresizingMask:18];
  [(AVTSelectableStickerSheetController *)self setCollectionView:v8];
  v12 = [AVTNotifyingContainerView alloc];
  [v8 frame];
  double v13 = -[AVTNotifyingContainerView initWithFrame:](v12, "initWithFrame:");
  [(AVTNotifyingContainerView *)v13 setDelegate:self];
  [(AVTNotifyingContainerView *)v13 addSubview:v8];
  [(AVTSelectableStickerSheetController *)self setView:v13];
}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionInsets.left
    || a3.top != self->_sectionInsets.top
    || a3.right != self->_sectionInsets.right
    || a3.bottom != self->_sectionInsets.bottom)
  {
    self->_sectionInsets = a3;
    id v7 = [(AVTSelectableStickerSheetController *)self collectionView];
    double v6 = [v7 collectionViewLayout];
    [v6 invalidateLayout];
  }
}

- (AVTAvatarRecord)avatarRecord
{
  v2 = [(AVTSelectableStickerSheetController *)self model];
  v3 = [v2 avatarRecord];

  return (AVTAvatarRecord *)v3;
}

- (void)sheetDidDisappear
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(AVTSelectableStickerSheetController *)self setIsPageVisible:0];
  v3 = [(AVTSelectableStickerSheetController *)self model];
  v4 = [v3 avatarRecord];
  int v5 = [v4 identifier];

  double v6 = [(AVTSelectableStickerSheetController *)self taskScheduler];
  [v6 cancelStickerSheetTasksForAvatarRecordIdentifier:v5];

  [(AVTSelectableStickerSheetController *)self discardStickerItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(AVTSelectableStickerSheetController *)self collectionView];
  double v8 = [v7 visibleCells];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v12++) purgeImageContents];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  double v13 = [(AVTSelectableStickerSheetController *)self collectionView];
  [v13 _purgeReuseQueues];

  double v14 = [(AVTSelectableStickerSheetController *)self model];
  double v15 = [v14 stickerRenderer];
  [v15 stopUsingResources];

  [(AVTSelectableStickerSheetController *)self clearStickerSelection];
}

- (void)sheetWillAppear
{
  if (![(AVTSelectableStickerSheetController *)self isPageVisible])
  {
    [(AVTSelectableStickerSheetController *)self setIsPageVisible:1];
    v3 = [(AVTSelectableStickerSheetController *)self collectionView];
    v4 = [v3 indexPathsForVisibleItems];

    if ([v4 count])
    {
      int v5 = [(AVTSelectableStickerSheetController *)self taskScheduler];
      [v5 setVisibleIndexPaths:v4];

      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __54__AVTSelectableStickerSheetController_sheetWillAppear__block_invoke;
      v6[3] = &unk_263FF03D8;
      v6[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v6];
      [(AVTSelectableStickerSheetController *)self startAllSchedulerTasksExcludingVisibleIndexPaths:v4];
    }
  }
}

void __54__AVTSelectableStickerSheetController_sheetWillAppear__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)startAllSchedulerTasks
{
}

- (void)startAllSchedulerTasksExcludingVisibleIndexPaths:(id)a3
{
  id v4 = a3;
  if (![(AVTSelectableStickerSheetController *)self areAllStickersRendered])
  {
    int v5 = [(AVTSelectableStickerSheetController *)self stickerItems];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke;
    v6[3] = &unk_263FF0890;
    v6[4] = self;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) isCameraItem:v5] & 1) == 0)
  {
    double v6 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    if (([*(id *)(a1 + 40) containsObject:v6] & 1) == 0
      && ([v5 hasBeenRendered] & 1) == 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_initWeak(&from, v5);
      id v7 = [v5 resourceProvider];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2;
      uint64_t v12 = &unk_263FF0868;
      objc_copyWeak(&v13, &location);
      objc_copyWeak(&v14, &from);
      double v8 = ((void (**)(void, uint64_t *, void))v7)[2](v7, &v9, 0);

      objc_msgSend(*(id *)(a1 + 32), "scheduleSheetStickerTask:withIndexPath:", v8, v6, v9, v10, v11, v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = [WeakRetained imageDelegate];
  BOOL v7 = v6 == 0;

  [WeakRetained updateItem:v5 withStickerResource:v3 reloadCell:v7];
  double v8 = [WeakRetained imageDelegate];

  if (v8)
  {
    uint64_t v9 = [WeakRetained imageDelegate];
    uint64_t v10 = [v3 image];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_3;
    v11[3] = &unk_263FF1998;
    id v12 = v5;
    id v13 = WeakRetained;
    [v9 viewWillUpdateWithImage:v10 completion:v11];
  }
}

uint64_t __88__AVTSelectableStickerSheetController_startAllSchedulerTasksExcludingVisibleIndexPaths___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCachedImage:a2];
  uint64_t result = [*(id *)(a1 + 40) isPageVisible];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    return [v4 reloadCollectionViewItemForStickerItem:v5];
  }
  return result;
}

- (void)scheduleSheetPlaceholderTask:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(AVTSelectableStickerSheetController *)self model];
    double v6 = [v5 avatarRecord];
    BOOL v7 = [v6 identifier];
    id v9 = +[AVTStickerTask stickerTaskForSchedulerTask:v4 avatarRecordIdentifier:v7 indexPath:0 stickerType:1];

    double v8 = [(AVTSelectableStickerSheetController *)self taskScheduler];
    [v8 scheduleStickerTask:v9];
  }
}

- (void)scheduleSheetStickerTask:(id)a3 withIndexPath:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    double v8 = [(AVTSelectableStickerSheetController *)self model];
    id v9 = [v8 avatarRecord];
    uint64_t v10 = [v9 identifier];
    id v12 = +[AVTStickerTask stickerTaskForSchedulerTask:v7 avatarRecordIdentifier:v10 indexPath:v6 stickerType:2];

    uint64_t v11 = [(AVTSelectableStickerSheetController *)self taskScheduler];
    [v11 scheduleStickerTask:v12];
  }
}

- (id)firstStickerView
{
  id v3 = [(AVTSelectableStickerSheetController *)self collectionView];

  if (v3)
  {
    id v4 = [(AVTSelectableStickerSheetController *)self collectionView];
    uint64_t v5 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
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
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(AVTSelectableStickerSheetController *)self stickerItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (![(AVTSelectableStickerSheetController *)self isCameraItem:v8]) {
          [v8 discardContent];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  uint64_t v4 = [(AVTSelectableStickerSheetController *)self stickerItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (![(AVTSelectableStickerSheetController *)self isCameraItem:v9]
          && ![v9 hasBeenRendered])
        {
          BOOL v2 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 1;
LABEL_14:

  self->_areAllStickersRendered = v2;
  return v2;
}

- (void)clearStickerRendererIfNeeded
{
  if ([(AVTSelectableStickerSheetController *)self areAllStickersRendered])
  {
    id v4 = [(AVTSelectableStickerSheetController *)self delegate];
    id v3 = [(AVTSelectableStickerSheetController *)self avatarRecord];
    [v4 stickerSheetController:self didFinishRenderingStickersForRecord:v3];
  }
}

- (double)numberOfItemsPerRow
{
  BOOL v2 = [(AVTSelectableStickerSheetController *)self view];
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

  [(AVTSelectableStickerSheetController *)self clearStickerRendererIfNeeded];
  [v9 clippingRect];
  objc_msgSend(v8, "setClippingRect:");
  if ([(AVTSelectableStickerSheetController *)self isPageVisible])
  {
    long long v13 = [v8 cachedMSSticker];
    if (v13)
    {
    }
    else
    {
      long long v14 = [v9 URL];

      if (v14)
      {
        double v15 = [(AVTSelectableStickerSheetController *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0) {
          goto LABEL_10;
        }
        long long v17 = [(AVTSelectableStickerSheetController *)self delegate];
        long long v18 = [v9 URL];
        long long v19 = [v8 localizedName];
        v20 = [v8 identifier];
        uint64_t v21 = [v17 stickerSheetController:self requestsStickerForFileURL:v18 localizedDescription:v19 forItemWithIdentifier:v20];

        if (!v21)
        {
LABEL_10:
          id v22 = objc_alloc(MEMORY[0x263F125C8]);
          v23 = [v9 URL];
          v24 = [v8 localizedName];
          uint64_t v25 = 0;
          uint64_t v21 = (void *)[v22 initWithContentsOfFileURL:v23 localizedDescription:v24 error:&v25];
        }
        [v8 setCachedMSSticker:v21];
        if (v5) {
          [(AVTSelectableStickerSheetController *)self reloadCollectionViewItemForStickerItem:v8];
        }
      }
    }
  }
}

- (void)reloadCollectionViewItemForStickerItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTSelectableStickerSheetController *)self stickerItems];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [MEMORY[0x263F088C8] indexPathForItem:v6 inSection:0];
    id v8 = [(AVTSelectableStickerSheetController *)self collectionView];
    id v9 = [v8 indexPathsForVisibleItems];
    int v10 = [v9 containsObject:v7];

    if (v10)
    {
      unsigned int v11 = (void *)MEMORY[0x263F1CB60];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __78__AVTSelectableStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke;
      v12[3] = &unk_263FF0780;
      v12[4] = self;
      id v13 = v7;
      [v11 performWithoutAnimation:v12];
    }
  }
}

void __78__AVTSelectableStickerSheetController_reloadCollectionViewItemForStickerItem___block_invoke(uint64_t a1)
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
  v8[2] = __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke;
  v8[3] = &unk_263FF08E0;
  objc_copyWeak(&v9, &location);
  BOOL v2 = (void *)[v8 copy];
  uint64_t v6 = (void *)MEMORY[0x210530210](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke(uint64_t a1, void *a2)
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
    id v8 = [WeakRetained model];
    id v9 = [v8 placeholderProviderFactory];
    int v10 = [v9 placeholderProvider];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke_2;
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

void __58__AVTSelectableStickerSheetController_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v4 = [(AVTSelectableStickerSheetController *)self stickerItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AVTSelectableStickerSheetController *)self stickerItems];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "item"));

  if ([(AVTSelectableStickerSheetController *)self isCameraItem:v7]) {
    [(AVTSelectableStickerSheetController *)self cellForCameraItemAtIndexPath:v5];
  }
  else {
  id v8 = [(AVTSelectableStickerSheetController *)self cellForStickerItem:v7 atIndexPath:v5];
  }

  objc_msgSend(v8, "setShowSelectionLayer:", -[AVTSelectableStickerSheetController showCellSelectionLayer](self, "showCellSelectionLayer"));
  return v8;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v8 = [v6 indexPathsForVisibleItems];

  uint64_t v7 = [(AVTSelectableStickerSheetController *)self taskScheduler];
  [v7 setVisibleIndexPaths:v8];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTSelectableStickerSheetController *)self stickerItems];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));

  if ([(AVTSelectableStickerSheetController *)self isCameraItem:v9])
  {
    if ([(AVTSelectableStickerSheetController *)self showCellSelectionLayer])
    {
      dispatch_time_t v10 = dispatch_time(0, 300000000);
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      char v16 = __79__AVTSelectableStickerSheetController_collectionView_didSelectItemAtIndexPath___block_invoke;
      long long v17 = &unk_263FF0780;
      id v18 = v6;
      long long v19 = self;
      dispatch_after(v10, MEMORY[0x263EF83A0], &v14);
    }
    unsigned int v11 = [(AVTSelectableStickerSheetController *)self stickerSheetDelegate];
    uint64_t v12 = [(AVTSelectableStickerSheetController *)self avatarRecord];
    [v11 stickerSheetController:self didSelectCameraViewForRecord:v12];
  }
  else
  {
    id v13 = [(AVTSelectableStickerSheetController *)self imageDelegate];

    if (v13) {
      [(AVTSelectableStickerSheetController *)self didInteractWithStickerAtIndexPath:v7 byPeeling:0];
    }
  }
}

void __79__AVTSelectableStickerSheetController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) selectedIndexPath];
  [v1 selectItemAtIndexPath:v2 animated:1 scrollPosition:0];
}

- (id)cellForCameraItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v6 = [v5 dequeueReusableCellWithReuseIdentifier:@"cameraIconCell" forIndexPath:v4];

  id v7 = [v6 tintColor];
  id v8 = [MEMORY[0x263F1C550] systemBlueColor];

  if (v7 != v8)
  {
    id v9 = [MEMORY[0x263F1C550] systemBlueColor];
    [v6 setTintColor:v9];
  }
  return v6;
}

- (id)cellForStickerItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v9 = +[AVTStickerCollectionViewCell cellIdentifier];
  dispatch_time_t v10 = [v8 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  unsigned int v11 = [MEMORY[0x263F08C38] UUID];
  [v10 setDisplaySessionUUID:v11];
  [v10 setDelegate:self];
  uint64_t v12 = [(AVTSelectableStickerSheetController *)self disclosureValidationDelegate];
  [v10 setDisclosureValidationDelegate:v12];

  objc_msgSend(v10, "setShowPrereleaseSticker:", -[AVTSelectableStickerSheetController showPrereleaseSticker](self, "showPrereleaseSticker"));
  [v6 clippingRect];
  objc_msgSend(v10, "setClippingRect:");
  id v13 = [v6 cachedMSSticker];

  if (v13)
  {
    uint64_t v14 = [v6 cachedImage];
    uint64_t v15 = [v6 cachedMSSticker];
    [(AVTSelectableStickerSheetController *)self updateCell:v10 withImage:v14 sticker:v15 animated:0];
  }
  else
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v6);
    char v16 = [(AVTSelectableStickerSheetController *)self placeholderImage];

    if (v16)
    {
      long long v17 = [(AVTSelectableStickerSheetController *)self placeholderImage];
      id v18 = [v6 cachedMSSticker];
      [(AVTSelectableStickerSheetController *)self updateCell:v10 withImage:v17 sticker:v18 animated:0];
    }
    else
    {
      long long v19 = [(AVTSelectableStickerSheetController *)self placeholderProvider];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke;
      v37[3] = &unk_263FF1BA0;
      objc_copyWeak(&v41, &from);
      id v38 = v10;
      id v39 = v11;
      v40 = self;
      v20 = ((void (**)(void, void *, void))v19)[2](v19, v37, 0);

      [(AVTSelectableStickerSheetController *)self scheduleSheetPlaceholderTask:v20];
      objc_destroyWeak(&v41);
    }
    uint64_t v21 = objc_opt_new();
    id v22 = [v6 resourceProvider];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_2;
    v29 = &unk_263FF1C18;
    objc_copyWeak(&v35, location);
    objc_copyWeak(&v36, &from);
    id v30 = v10;
    id v31 = v11;
    id v23 = v21;
    id v32 = v23;
    v33 = self;
    id v34 = v6;
    v24 = ((void (**)(void, uint64_t *, uint64_t))v22)[2](v22, &v26, 1);

    -[AVTSelectableStickerSheetController scheduleSheetStickerTask:withIndexPath:](self, "scheduleSheetStickerTask:withIndexPath:", v24, v7, v26, v27, v28, v29);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }

  return v10;
}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [*(id *)(a1 + 32) displaySessionUUID];
  id v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    id v6 = [WeakRetained cachedMSSticker];

    if (!v6)
    {
      id v7 = *(void **)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [WeakRetained cachedMSSticker];
      [v7 updateCell:v8 withImage:v10 sticker:v9 animated:0];
    }
  }
}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 URL];

  if (v4)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_3;
    v13[3] = &unk_263FF1BC8;
    objc_copyWeak(&v18, a1 + 9);
    objc_copyWeak(&v19, a1 + 10);
    id v14 = a1[4];
    id v15 = a1[5];
    id v5 = v3;
    id v16 = v5;
    id v17 = a1[6];
    id v6 = (void (**)(void))MEMORY[0x210530210](v13);
    id v7 = [a1[7] imageDelegate];

    if (v7)
    {
      uint64_t v8 = [a1[7] imageDelegate];
      id v9 = [v5 image];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_4;
      v10[3] = &unk_263FF1BF0;
      id v11 = a1[8];
      uint64_t v12 = v6;
      [v8 viewWillUpdateWithImage:v9 completion:v10];
    }
    else
    {
      v6[2](v6);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
  }
}

void __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [*(id *)(a1 + 32) displaySessionUUID];
  id v4 = *(void **)(a1 + 40);

  [WeakRetained updateItem:v2 withStickerResource:*(void *)(a1 + 48) reloadCell:v3 != v4];
  if (v3 == v4 && [WeakRetained isPageVisible])
  {
    [*(id *)(a1 + 56) timeIntervalSinceNow];
    BOOL v6 = v5 < -0.1;
    [v2 clippingRect];
    objc_msgSend(*(id *)(a1 + 32), "setClippingRect:");
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v2 cachedImage];
    id v9 = [v2 cachedMSSticker];
    [WeakRetained updateCell:v7 withImage:v8 sticker:v9 animated:v6];
  }
}

uint64_t __70__AVTSelectableStickerSheetController_cellForStickerItem_atIndexPath___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCachedImage:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
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
  [(AVTSelectableStickerSheetController *)self sectionInsets];
  double v12 = v11;
  [(AVTSelectableStickerSheetController *)self topPadding];
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
  [(AVTSelectableStickerSheetController *)self numberOfItemsPerRow];
  double v13 = v12;
  uint64_t v14 = [v9 section];

  [(AVTSelectableStickerSheetController *)self collectionView:v10 layout:v11 insetForSectionAtIndex:v14];
  double v16 = v15;
  double v18 = v17;
  [v10 bounds];
  double v20 = v19;

  double v21 = v20 - v16 - v18;
  [v11 minimumInteritemSpacing];
  double v23 = v22;

  double v24 = floor((v21 - v23 * (v13 + -1.0)) / v13);
  double v25 = v24;
  result.double height = v25;
  result.CGFloat width = v24;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  id v4 = [(AVTSelectableStickerSheetController *)self delegate];

  if (v4)
  {
    double v5 = [(AVTSelectableStickerSheetController *)self delegate];
    [v6 contentOffset];
    objc_msgSend(v5, "stickerSheetController:didScrollToContentOffset:", self);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v9 = a3;
  id v7 = [(AVTSelectableStickerSheetController *)self delegate];

  if (v7)
  {
    id v8 = [(AVTSelectableStickerSheetController *)self delegate];
    [v8 stickerSheetController:self scrollView:v9 willEndDraggingWithTargetContentOffset:a5];
  }
}

- (void)scrollToContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(AVTSelectableStickerSheetController *)self collectionView];

  if (v8)
  {
    id v9 = [(AVTSelectableStickerSheetController *)self collectionView];
    [v9 layoutIfNeeded];

    id v10 = [(AVTSelectableStickerSheetController *)self collectionView];
    -[AVTSelectableStickerSheetController maxedContentOffset:](self, "maxedContentOffset:", x, y);
    objc_msgSend(v10, "setContentOffset:animated:", v4);
  }
}

- (void)stickerCellDidTapSticker:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  [(AVTSelectableStickerSheetController *)self didInteractWithStickerAtIndexPath:v6 byPeeling:0];
}

- (void)stickerCellDidPeelSticker:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  [(AVTSelectableStickerSheetController *)self didInteractWithStickerAtIndexPath:v6 byPeeling:1];
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(AVTSelectableStickerSheetController *)self collectionView];
  id v7 = [v6 collectionViewLayout];

  -[AVTSelectableStickerSheetController minimumContentSizeForSize:](self, "minimumContentSizeForSize:", width, height);
  objc_msgSend(v7, "setMinimumContentSize:");
  [v7 invalidateLayout];
}

- (void)updateCell:(id)a3 withImage:(id)a4 sticker:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a5;
  id v10 = a4;
  id v11 = a3;
  double v12 = [(AVTSelectableStickerSheetController *)self imageDelegate];

  if (v12) {
    id v13 = 0;
  }
  else {
    id v13 = v14;
  }
  [v11 updateWithImage:v10 sticker:v13 animated:v6];
}

- (void)didInteractWithStickerAtIndexPath:(id)a3 byPeeling:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  unint64_t v6 = -[AVTSelectableStickerSheetController stickerIndexInModelforIndexPath:](self, "stickerIndexInModelforIndexPath:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    [(AVTSelectableStickerSheetController *)self setSelectedIndexPath:v11];
    id v8 = [(AVTSelectableStickerSheetController *)self stickerItems];
    id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v11, "item"));

    id v10 = [(AVTSelectableStickerSheetController *)self delegate];
    [v10 stickerSheetController:self didInteractWithStickerItem:v9 atIndex:v7 byPeeling:v4];
  }
}

- (unint64_t)stickerIndexInModelforIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTSelectableStickerSheetController *)self stickerItems];
  uint64_t v6 = [v4 item];

  unint64_t v7 = [v5 objectAtIndex:v6];

  id v8 = [(AVTSelectableStickerSheetController *)self model];
  id v9 = [v8 stickerItems];
  unint64_t v10 = [v9 indexOfObject:v7];

  return v10;
}

- (void)selectStickerWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTSelectableStickerSheetController *)self showCellSelectionLayer];
  if (v4 && v5)
  {
    uint64_t v6 = [(AVTSelectableStickerSheetController *)self stickerItems];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__AVTSelectableStickerSheetController_selectStickerWithIdentifier___block_invoke;
    v11[3] = &unk_263FF1C40;
    id v12 = v4;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v11];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [MEMORY[0x263F088C8] indexPathForItem:v7 inSection:0];
      [(AVTSelectableStickerSheetController *)self setSelectedIndexPath:v8];

      id v9 = [(AVTSelectableStickerSheetController *)self collectionView];
      unint64_t v10 = [(AVTSelectableStickerSheetController *)self selectedIndexPath];
      [v9 selectItemAtIndexPath:v10 animated:1 scrollPosition:0];
    }
  }
}

uint64_t __67__AVTSelectableStickerSheetController_selectStickerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)clearStickerSelection
{
  id v3 = [(AVTSelectableStickerSheetController *)self selectedIndexPath];

  if (v3)
  {
    uint64_t v4 = [(AVTSelectableStickerSheetController *)self collectionView];
    BOOL v5 = [(AVTSelectableStickerSheetController *)self selectedIndexPath];
    [v4 deselectItemAtIndexPath:v5 animated:1];

    [(AVTSelectableStickerSheetController *)self setSelectedIndexPath:0];
  }
}

- (BOOL)isCameraItem:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTSelectableStickerSheetController *)self cameraStickerItem];

  return v5 == v4;
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
  return (AVTStickerDisclosureValidationDelegate *)WeakRetained;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelegate);
  return (AVTStickerViewControllerImageDelegate *)WeakRetained;
}

- (void)setImageDelegate:(id)a3
{
}

- (AVTStickerSheetDelegate)stickerSheetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerSheetDelegate);
  return (AVTStickerSheetDelegate *)WeakRetained;
}

- (void)setStickerSheetDelegate:(id)a3
{
}

- (BOOL)showCellSelectionLayer
{
  return self->_showCellSelectionLayer;
}

- (void)setShowCellSelectionLayer:(BOOL)a3
{
  self->_showCellSelectionLayer = a3;
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

- (BOOL)allowsPoseCapture
{
  return self->_allowsPoseCapture;
}

- (void)setAllowsPoseCapture:(BOOL)a3
{
  self->_allowsPoseCapture = a3;
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void)setStickerItems:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  self->_selectedIndexPath = (NSIndexPath *)a3;
}

- (AVTUIStickerItem)cameraStickerItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraStickerItem);
  return (AVTUIStickerItem *)WeakRetained;
}

- (void)setCameraStickerItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraStickerItem);
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_stickerSheetDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end