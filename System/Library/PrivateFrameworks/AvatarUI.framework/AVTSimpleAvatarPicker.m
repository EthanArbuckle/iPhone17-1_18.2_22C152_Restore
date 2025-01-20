@interface AVTSimpleAvatarPicker
- (AVTAvatarPickerDataSource)dataSource;
- (AVTAvatarPickerDelegate)avatarPickerDelegate;
- (AVTEdgeDisappearingCollectionViewLayout)collectionViewLayout;
- (AVTImageStore)imageStore;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRenderingScope)renderingScope;
- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7;
- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8;
- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8 shouldReverseNaturalLayout:(BOOL)a9;
- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6;
- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7;
- (AVTSimpleAvatarPickerHeaderView)headerView;
- (AVTStickerTaskScheduler)taskScheduler;
- (AVTStickerViewControllerImageDelegate)imageDelegate;
- (AVTViewSessionProvider)viewSessionProvider;
- (BOOL)allowEditing;
- (BOOL)canCreateAvatar;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)doesDisplayEditIconWhenAvailable;
- (BOOL)isItemAtIndexPathOffscreen:(id)a3;
- (BOOL)shouldHideUserInfoView;
- (BOOL)shouldReverseNaturalLayout;
- (BOOL)shouldShowHeaderButton;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)itemSize;
- (NSMutableDictionary)itemsToTasksMap;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)contentInset;
- (UIView)view;
- (_AVTAvatarRecordImageProvider)imageProvider;
- (double)minimumInteritemSpacing;
- (id)actionsModelForRecord:(id)a3;
- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)currentCellForRecordItem:(id)a3 atIndexPath:(id)a4 displaySessionUUID:(id)a5 previousCell:(id)a6;
- (id)currentRenderingTaskForRecordItem:(id)a3;
- (id)selectedAvatar;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indexForSelectedAvatar;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)avatarActionsViewController:(id)a3 willPresentAvatarRecord:(id)a4;
- (void)avatarActionsViewControllerDidFinish:(id)a3;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)cancelCurrentRenderingTaskForRecordItem:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)deselectPreviousSelectedItemExcludingIndexPath:(id)a3;
- (void)loadView;
- (void)notifyingContainerViewDidChangeSize:(CGSize)a3;
- (void)notifyingContainerViewWillChangeSize:(CGSize)a3;
- (void)presentActionsForAvatarRecord:(id)a3;
- (void)presentActionsForSelectedAvatar;
- (void)presentMemojiEditorForCreation;
- (void)presentedAvatarRecord:(id)a3;
- (void)registerRenderingTask:(id)a3 forRecordItem:(id)a4;
- (void)reloadData;
- (void)reloadDataSource;
- (void)renderThumbnailsIfNeeded;
- (void)scheduleRenderingTask:(id)a3 forRecordItem:(id)a4;
- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)setAllowEditing:(BOOL)a3;
- (void)setAvatarPickerDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDataSource:(id)a3;
- (void)setDoesDisplayEditIconWhenAvailable:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setImageDelegate:(id)a3;
- (void)setImageStore:(id)a3;
- (void)setItemsToTasksMap:(id)a3;
- (void)setMinimumInteritemSpacing:(double)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setShouldReverseNaturalLayout:(BOOL)a3;
- (void)setView:(id)a3;
- (void)unregisterCurrentRenderingTaskForRecordItem:(id)a3;
- (void)updateCell:(id)a3 withImage:(id)a4 animated:(BOOL)a5;
- (void)updateHeaderButtonForSelectedAvatar:(id)a3 invalidateLayout:(BOOL)a4 animated:(BOOL)a5;
- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTSimpleAvatarPicker

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  return [(AVTSimpleAvatarPicker *)self initWithStore:a3 environment:a4 allowAddItem:a5 interItemSpacing:0 shouldReverseNaturalLayout:8.0];
}

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6
{
  return [(AVTSimpleAvatarPicker *)self initWithStore:a3 environment:a4 allowAddItem:a5 interItemSpacing:0 shouldReverseNaturalLayout:a6];
}

- (AVTSimpleAvatarPicker)initWithStore:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7
{
  BOOL v32 = a7;
  BOOL v8 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [AVTAvatarRecordDataSource alloc];
  v14 = [MEMORY[0x263F29718] requestForAllAvatars];
  v15 = [(AVTAvatarRecordDataSource *)v13 initWithRecordStore:v12 fetchRequest:v14 environment:v11];

  v16 = [[AVTAvatarPickerDataSource alloc] initWithRecordDataSource:v15 environment:v11 allowAddItem:v8];
  v17 = +[AVTStickerTaskScheduler schedulerWithRecordDataSource:v15];
  v18 = [_AVTAvatarRecordImageProvider alloc];
  v19 = [(AVTAvatarPickerDataSource *)v16 environment];
  v20 = [(_AVTAvatarRecordImageProvider *)v18 initWithEnvironment:v19 taskScheduler:0];

  v21 = [AVTViewSessionProvider alloc];
  v22 = [(AVTAvatarPickerDataSource *)v16 environment];
  +[AVTViewSessionProvider backingSizeForEnvironment:v22];
  double v24 = v23;
  double v26 = v25;
  v27 = +[AVTViewSessionProvider creatorForAVTView];
  v28 = [(AVTAvatarPickerDataSource *)v16 environment];
  v29 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v21, "initWithAVTViewBackingSize:viewCreator:environment:", v27, v28, v24, v26);

  v30 = [(AVTSimpleAvatarPicker *)self initWithDataSource:v16 recordImageProvider:v20 avtViewSessionProvider:v29 taskScheduler:v17 allowEditing:v8 interItemSpacing:v32 shouldReverseNaturalLayout:a6];
  return v30;
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7
{
  return [(AVTSimpleAvatarPicker *)self initWithDataSource:a3 recordImageProvider:a4 avtViewSessionProvider:a5 taskScheduler:a6 allowEditing:a7 interItemSpacing:0 shouldReverseNaturalLayout:8.0];
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8
{
  return [(AVTSimpleAvatarPicker *)self initWithDataSource:a3 recordImageProvider:a4 avtViewSessionProvider:a5 taskScheduler:a6 allowEditing:a7 interItemSpacing:0 shouldReverseNaturalLayout:a8];
}

- (AVTSimpleAvatarPicker)initWithDataSource:(id)a3 recordImageProvider:(id)a4 avtViewSessionProvider:(id)a5 taskScheduler:(id)a6 allowEditing:(BOOL)a7 interItemSpacing:(double)a8 shouldReverseNaturalLayout:(BOOL)a9
{
  id v17 = a3;
  id v34 = a4;
  id v18 = a5;
  id v19 = a6;
  v35.receiver = self;
  v35.super_class = (Class)AVTSimpleAvatarPicker;
  v20 = [(AVTSimpleAvatarPicker *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dataSource, a3);
    uint64_t v22 = +[AVTRenderingScope simplePickerThumbnailScope];
    renderingScope = v21->_renderingScope;
    v21->_renderingScope = (AVTRenderingScope *)v22;

    objc_storeStrong((id *)&v21->_imageProvider, a4);
    v21->_minimumInteritemSpacing = a8;
    v21->_allowEditing = a7;
    v21->_doesDisplayEditIconWhenAvailable = 1;
    objc_storeStrong((id *)&v21->_taskScheduler, a6);
    objc_storeStrong((id *)&v21->_viewSessionProvider, a5);
    v21->_shouldReverseNaturalLayout = a9;
    double v24 = [AVTImageStore alloc];
    double v25 = [v17 environment];
    double v26 = [v25 coreEnvironment];
    v27 = [v17 environment];
    v28 = [v27 imageStoreLocation];
    uint64_t v29 = [(AVTImageStore *)v24 initWithEnvironment:v26 validateImages:0 location:v28];
    imageStore = v21->_imageStore;
    v21->_imageStore = (AVTImageStore *)v29;

    uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
    itemsToTasksMap = v21->_itemsToTasksMap;
    v21->_itemsToTasksMap = (NSMutableDictionary *)v31;
  }
  return v21;
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    [(AVTSimpleAvatarPicker *)self loadView];
    view = self->_view;
  }
  return view;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  if (self->_minimumInteritemSpacing != a3)
  {
    self->_minimumInteritemSpacing = a3;
    id v4 = [(AVTSimpleAvatarPicker *)self collectionViewLayout];
    [v4 setMinimumLineSpacing:a3];
    [v4 setMinimumInteritemSpacing:a3];
    [v4 invalidateLayout];
  }
}

- (void)loadView
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v21 = objc_alloc_init(AVTEdgeDisappearingCollectionViewLayout);
  [(AVTSimpleAvatarPicker *)self minimumInteritemSpacing];
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v21, "setMinimumInteritemSpacing:");
  [(AVTSimpleAvatarPicker *)self minimumInteritemSpacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v21, "setMinimumLineSpacing:");
  [(UICollectionViewFlowLayout *)v21 setScrollDirection:1];
  [(AVTEdgeDisappearingCollectionViewLayout *)v21 setPinHeaderToVisible:1];
  [(AVTEdgeDisappearingCollectionViewLayout *)v21 setEnableEdgeDisappearing:[(AVTSimpleAvatarPicker *)self shouldShowHeaderButton]];
  [(AVTSimpleAvatarPicker *)self setCollectionViewLayout:v21];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C4E0]), "initWithFrame:collectionViewLayout:", v21, v3, v4, v5, v6);
  [v7 setDataSource:self];
  [v7 setDelegate:self];
  BOOL v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  v9 = [(AVTSimpleAvatarPicker *)self dataSource];
  v10 = [v9 environment];
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", objc_msgSend(v10, "deviceIsMac"));

  [v7 setDelaysContentTouches:0];
  [(AVTSimpleAvatarPicker *)self contentInset];
  objc_msgSend(v7, "setContentInset:");
  [v7 setAutoresizingMask:18];
  [v7 setAllowsMultipleSelection:0];
  uint64_t v11 = objc_opt_class();
  id v12 = +[AVTSimpleAvatarPickerCollectionViewCell cellIdentifier];
  [v7 registerClass:v11 forCellWithReuseIdentifier:v12];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = *MEMORY[0x263F1D120];
  v15 = +[AVTSimpleAvatarPickerHeaderView reuseIdentifier];
  [v7 registerClass:v13 forSupplementaryViewOfKind:v14 withReuseIdentifier:v15];

  if ([(AVTSimpleAvatarPicker *)self shouldReverseNaturalLayout])
  {
    v16 = [(AVTSimpleAvatarPicker *)self dataSource];
    id v17 = [v16 environment];
    if ([v17 userInterfaceLayoutDirection]) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 4;
    }
    [v7 setSemanticContentAttribute:v18];
  }
  id v19 = [v7 layer];
  [v19 setMasksToBounds:0];

  [(AVTSimpleAvatarPicker *)self setCollectionView:v7];
  v20 = -[AVTNotifyingContainerView initWithFrame:]([AVTNotifyingContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  [(AVTNotifyingContainerView *)v20 setDelegate:self];
  [(AVTNotifyingContainerView *)v20 addSubview:v7];
  [(AVTSimpleAvatarPicker *)self setView:v20];
  [(AVTSimpleAvatarPicker *)self renderThumbnailsIfNeeded];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_contentInset.top;
  if (self->_contentInset.left != a3.left
    || v7 != top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset.double top = top;
    self->_contentInset.double left = a3.left;
    self->_contentInset.double bottom = a3.bottom;
    self->_contentInset.double right = a3.right;
    id v11 = [(AVTSimpleAvatarPicker *)self collectionView];
    objc_msgSend(v11, "setContentInset:", top, left, bottom, right);
  }
}

- (void)setAllowEditing:(BOOL)a3
{
  if (self->_allowEditing != a3)
  {
    self->_allowEditing = a3;
    [(AVTSimpleAvatarPicker *)self reloadData];
  }
}

- (void)renderThumbnailsIfNeeded
{
  double v3 = [(AVTSimpleAvatarPicker *)self dataSource];
  uint64_t v4 = [v3 numberOfItems];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = [(AVTSimpleAvatarPicker *)self dataSource];
      double v7 = [v6 itemAtIndex:i];

      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke;
      v8[3] = &unk_263FF2E18;
      v8[4] = self;
      [v7 downcastWithRecordHandler:v8 viewHandler:0];
    }
  }
}

void __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 cachedImage];

  if (!v4)
  {
    double v5 = [*(id *)(a1 + 32) renderingScope];
    double v6 = [AVTAvatarRecordCacheableResource alloc];
    double v7 = [v3 avatar];
    BOOL v8 = [*(id *)(a1 + 32) dataSource];
    v9 = [v8 environment];
    v10 = [(AVTAvatarRecordCacheableResource *)v6 initWithAvatarRecord:v7 includeAvatarData:0 environment:v9];

    id v11 = [*(id *)(a1 + 32) imageStore];
    id v12 = [v11 imageForItem:v10 scope:v5];

    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) imageProvider];
      uint64_t v14 = [v3 avatar];
      v15 = [v13 providerForRecord:v14 scope:v5];

      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      double v23 = __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke_2;
      double v24 = &unk_263FF1998;
      uint64_t v25 = *(void *)(a1 + 32);
      id v16 = v3;
      id v26 = v16;
      id v17 = ((void (**)(void, uint64_t *, void))v15)[2](v15, &v21, 0);
      objc_msgSend(*(id *)(a1 + 32), "scheduleRenderingTask:forRecordItem:", v17, v16, v21, v22, v23, v24, v25);
      uint64_t v18 = [*(id *)(a1 + 32) taskScheduler];
      id v19 = [v16 avatar];
      v20 = [v19 identifier];
      [v18 lowerStickerPickerTaskPriority:v17 avatarRecordIdentifier:v20];
    }
  }
}

void __49__AVTSimpleAvatarPicker_renderThumbnailsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) unregisterCurrentRenderingTaskForRecordItem:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) cachedImage];

  if (!v3) {
    [*(id *)(a1 + 40) setCachedImage:v4];
  }
}

- (void)reloadData
{
  if (self->_view)
  {
    id obj = [(AVTSimpleAvatarPicker *)self collectionView];
    objc_sync_enter(obj);
    id v3 = [(AVTSimpleAvatarPicker *)self collectionView];
    id v4 = [v3 indexPathsForSelectedItems];

    BOOL v5 = [(AVTSimpleAvatarPicker *)self shouldShowHeaderButton];
    double v6 = [(AVTSimpleAvatarPicker *)self collectionViewLayout];
    [v6 setEnableEdgeDisappearing:v5];

    double v7 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v7 reloadData];

    BOOL v8 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v8 layoutIfNeeded];

    if ([v4 count])
    {
      v9 = [(AVTSimpleAvatarPicker *)self collectionView];
      v10 = [v4 firstObject];
      [v9 selectItemAtIndexPath:v10 animated:0 scrollPosition:16];
    }
    objc_sync_exit(obj);
  }
}

- (void)reloadDataSource
{
  id v3 = [(AVTSimpleAvatarPicker *)self dataSource];
  [v3 reloadModel];

  [(AVTSimpleAvatarPicker *)self reloadData];
}

- (int64_t)indexForSelectedAvatar
{
  v2 = [(AVTSimpleAvatarPicker *)self collectionView];
  id v3 = [v2 indexPathsForSelectedItems];

  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    int64_t v5 = [v4 item];
  }
  else
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)selectedAvatar
{
  id v3 = [(AVTSimpleAvatarPicker *)self dataSource];
  id v4 = objc_msgSend(v3, "itemAtIndex:", -[AVTSimpleAvatarPicker indexForSelectedAvatar](self, "indexForSelectedAvatar"));

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__21;
  id v12 = __Block_byref_object_dispose__21;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__AVTSimpleAvatarPicker_selectedAvatar__block_invoke;
  v7[3] = &unk_263FF0FD0;
  v7[4] = &v8;
  [v4 downcastWithRecordHandler:v7 viewHandler:0];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __39__AVTSimpleAvatarPicker_selectedAvatar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avatar];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (BOOL)canCreateAvatar
{
  v2 = [(AVTSimpleAvatarPicker *)self dataSource];
  uint64_t v3 = [v2 recordDataSource];
  uint64_t v4 = [v3 recordStore];
  char v5 = [v4 canCreateAvatar];

  return v5;
}

- (BOOL)shouldShowHeaderButton
{
  if ([(AVTSimpleAvatarPicker *)self allowEditing])
  {
    uint64_t v3 = [(AVTSimpleAvatarPicker *)self selectedAvatar];
    if (v3)
    {
      if ([(AVTSimpleAvatarPicker *)self doesDisplayEditIconWhenAvailable])
      {
        if ([v3 isEditable]) {
          goto LABEL_5;
        }
        if ([v3 isEditable])
        {
          BOOL v4 = 0;
          goto LABEL_10;
        }
      }
      BOOL v4 = [(AVTSimpleAvatarPicker *)self canCreateAvatar];
      goto LABEL_10;
    }
LABEL_5:
    BOOL v4 = 1;
LABEL_10:

    return v4;
  }
  return 0;
}

- (void)presentActionsForSelectedAvatar
{
  id v7 = [(AVTSimpleAvatarPicker *)self selectedAvatar];
  if ([v7 isEditable]
    && [(AVTSimpleAvatarPicker *)self doesDisplayEditIconWhenAvailable])
  {
    [(AVTSimpleAvatarPicker *)self presentActionsForAvatarRecord:v7];
  }
  else
  {
    uint64_t v3 = [(AVTSimpleAvatarPicker *)self avatarPickerDelegate];
    char v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) == 0
      || ([(AVTSimpleAvatarPicker *)self avatarPickerDelegate],
          char v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 avatarPicker:self shouldPresentMemojiEditorForAvatarRecord:v7],
          v5,
          v6))
    {
      [(AVTSimpleAvatarPicker *)self presentMemojiEditorForCreation];
    }
  }
}

- (id)actionsModelForRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEditable])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
    }
    id v5 = v4;
    int v6 = [AVTAvatarActionsProvider alloc];
    id v7 = [(AVTSimpleAvatarPicker *)self dataSource];
    uint64_t v8 = [v7 recordDataSource];
    v9 = [(AVTAvatarActionsProvider *)v6 initWithAvatarRecord:v5 dataSource:v8 allowCreate:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)presentActionsForAvatarRecord:(id)a3
{
  id v15 = a3;
  if (([v15 isEditable] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Record %@ is not editable!", v15 format];
  }
  id v4 = [(AVTSimpleAvatarPicker *)self actionsModelForRecord:v15];
  id v5 = [(AVTSimpleAvatarPicker *)self dataSource];
  int v6 = [v5 environment];

  id v7 = [AVTAvatarInlineActionsController alloc];
  uint64_t v8 = [(AVTSimpleAvatarPicker *)self dataSource];
  v9 = [v8 recordDataSource];
  uint64_t v10 = [(AVTSimpleAvatarPicker *)self viewSessionProvider];
  id v11 = [(AVTAvatarInlineActionsController *)v7 initWithDataSource:v9 avtViewProvider:v10 environment:v6];

  [(AVTAvatarInlineActionsController *)v11 setShouldHideUserInfoView:[(AVTSimpleAvatarPicker *)self shouldHideUserInfoView]];
  [(AVTAvatarInlineActionsController *)v11 updateWithActionsModel:v4];
  id v12 = [AVTAvatarActionsViewController alloc];
  id v13 = [(AVTSimpleAvatarPicker *)self viewSessionProvider];
  uint64_t v14 = [(AVTAvatarActionsViewController *)v12 initWithAVTViewSessionProvider:v13 actionsController:v11 environment:v6];

  [(AVTAvatarActionsViewController *)v14 setDelegate:self];
  [(AVTAvatarActionsViewController *)v14 setShouldHideUserInfoView:[(AVTSimpleAvatarPicker *)self shouldHideUserInfoView]];
  [(AVTSimpleAvatarPicker *)self wrapAndPresentViewController:v14 animated:1];
}

- (void)presentMemojiEditorForCreation
{
  uint64_t v3 = [(AVTSimpleAvatarPicker *)self presenterDelegate];

  if (v3)
  {
    id v4 = [(AVTSimpleAvatarPicker *)self dataSource];
    id v5 = [v4 store];
    int v6 = [(AVTSimpleAvatarPicker *)self viewSessionProvider];
    id v7 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v5 avtViewSessionProvider:v6];

    [v7 setDelegate:self];
    objc_msgSend(v7, "setShouldHideUserInfoView:", -[AVTSimpleAvatarPicker shouldHideUserInfoView](self, "shouldHideUserInfoView"));
    [(AVTSimpleAvatarPicker *)self wrapAndPresentViewController:v7 animated:1];
  }
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
  [v5 presentAvatarUIController:v6 animated:1];
}

- (void)deselectPreviousSelectedItemExcludingIndexPath:(id)a3
{
  id v12 = a3;
  id v4 = [(AVTSimpleAvatarPicker *)self collectionView];
  id v5 = [v4 indexPathsForSelectedItems];
  if ([v5 count])
  {
    id v6 = [(AVTSimpleAvatarPicker *)self collectionView];
    id v7 = [v6 indexPathsForSelectedItems];
    uint64_t v8 = [v7 firstObject];
    char v9 = [v8 isEqual:v12];

    if (v9) {
      goto LABEL_5;
    }
    uint64_t v10 = [(AVTSimpleAvatarPicker *)self collectionView];
    id v11 = [v10 indexPathsForSelectedItems];
    id v4 = [v11 firstObject];

    id v5 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v5 deselectItemAtIndexPath:v4 animated:1];
  }

LABEL_5:
}

- (void)updateHeaderButtonForSelectedAvatar:(id)a3 invalidateLayout:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v12 = a3;
  uint64_t v8 = [(AVTSimpleAvatarPicker *)self headerView];

  if (v12 && v8)
  {
    if ([v12 isEditable]) {
      BOOL v9 = [(AVTSimpleAvatarPicker *)self doesDisplayEditIconWhenAvailable];
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = [(AVTSimpleAvatarPicker *)self headerView];
    [v10 updateForEditMode:v9 animated:v5];
  }
  id v11 = [(AVTSimpleAvatarPicker *)self collectionViewLayout];
  objc_msgSend(v11, "setEnableEdgeDisappearing:", -[AVTSimpleAvatarPicker shouldShowHeaderButton](self, "shouldShowHeaderButton"));
  if (v6) {
    [v11 invalidateLayout];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(AVTSimpleAvatarPicker *)self dataSource];
  int64_t v5 = [v4 numberOfItems];

  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F1D120];
  id v12 = +[AVTSimpleAvatarPickerHeaderView reuseIdentifier];
  id v13 = [v8 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:v12 forIndexPath:v10];

  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __86__AVTSimpleAvatarPicker_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  id v19 = &unk_263FF09D8;
  objc_copyWeak(&v20, &location);
  [v13 setButtonPressedBlock:&v16];
  -[AVTSimpleAvatarPicker setHeaderView:](self, "setHeaderView:", v13, v16, v17, v18, v19);
  uint64_t v14 = [(AVTSimpleAvatarPicker *)self selectedAvatar];
  [(AVTSimpleAvatarPicker *)self updateHeaderButtonForSelectedAvatar:v14 invalidateLayout:0 animated:0];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

void __86__AVTSimpleAvatarPicker_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentActionsForSelectedAvatar];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTSimpleAvatarPicker *)self dataSource];
  id v9 = objc_msgSend(v8, "itemAtIndex:", objc_msgSend(v6, "item"));

  id v10 = +[AVTSimpleAvatarPickerCollectionViewCell cellIdentifier];
  uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

  id v12 = [MEMORY[0x263F08C38] UUID];
  [v11 setDisplaySessionUUID:v12];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke;
  v22[3] = &unk_263FF2E68;
  id v23 = v11;
  double v24 = self;
  id v25 = v9;
  id v26 = v6;
  id v27 = v12;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v19[3] = &unk_263FF1770;
  id v13 = v23;
  id v20 = v13;
  uint64_t v21 = self;
  id v14 = v12;
  id v15 = v6;
  id v16 = v9;
  [v16 downcastWithRecordHandler:v22 imageHandler:v19 viewHandler:0];
  id v17 = v13;

  return v17;
}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] setShowSelectedState:1];
  id v4 = [v3 cachedImage];

  if (v4)
  {
    int64_t v5 = [v3 avatar];
    int v6 = [v5 isEditable];

    if (v6) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [a1[4] setImageInsetSize:v7];
    id v10 = a1 + 4;
    id v9 = a1[4];
    id v8 = v10[1];
    uint64_t v11 = [v3 cachedImage];
    [v8 updateCell:v9 withImage:v11 animated:0];
  }
  else
  {
    id v12 = [a1[5] renderingScope];
    id v13 = [AVTAvatarRecordCacheableResource alloc];
    id v14 = [v3 avatar];
    id v15 = [a1[5] dataSource];
    id v16 = [v15 environment];
    id v17 = [(AVTAvatarRecordCacheableResource *)v13 initWithAvatarRecord:v14 includeAvatarData:0 environment:v16];

    uint64_t v18 = [a1[5] imageStore];
    id v19 = [v18 imageForItem:v17 scope:v12];

    if (v19)
    {
      id v20 = [v3 avatar];
      int v21 = [v20 isEditable];

      if (v21) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 2;
      }
      [a1[4] setImageInsetSize:v22];
      [a1[5] updateCell:a1[4] withImage:v19 animated:0];
    }
    else
    {
      id v23 = objc_opt_new();
      double v24 = [a1[5] imageProvider];
      id v25 = [v3 avatar];
      id v26 = [v24 providerForRecord:v25 scope:v12];

      [a1[5] cancelCurrentRenderingTaskForRecordItem:v3];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v33[3] = &unk_263FF2E40;
      v33[4] = a1[5];
      id v27 = v3;
      id v34 = v27;
      id v35 = a1[6];
      id v36 = a1[7];
      id v37 = a1[8];
      id v38 = a1[4];
      id v39 = v23;
      v28 = (void (*)(void *, void *, void))v26[2];
      id v29 = v23;
      v30 = v28(v26, v33, 0);
      [a1[5] scheduleRenderingTask:v30 forRecordItem:v27];
      uint64_t v31 = [v27 avatar];
      LODWORD(v28) = [v31 isEditable];

      if (v28) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = 2;
      }
      [a1[4] setImageInsetSize:v32];
    }
  }
}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) unregisterCurrentRenderingTaskForRecordItem:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) cachedImage];

  if (!v3) {
    [*(id *)(a1 + 40) setCachedImage:v6];
  }
  id v4 = [*(id *)(a1 + 32) currentCellForRecordItem:*(void *)(a1 + 48) atIndexPath:*(void *)(a1 + 56) displaySessionUUID:*(void *)(a1 + 64) previousCell:*(void *)(a1 + 72)];
  if (v4)
  {
    [*(id *)(a1 + 80) timeIntervalSinceNow];
    [*(id *)(a1 + 32) updateCell:v4 withImage:v6 animated:v5 < -0.1];
  }
}

void __63__AVTSimpleAvatarPicker_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setShowSelectedState:0];
  [*(id *)(a1 + 32) setImageInsetSize:0];
  uint64_t v7 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v7 + 8);
  id v8 = [v4 image];

  [v6 updateCell:v5 withImage:v8 animated:0];
}

- (id)currentCellForRecordItem:(id)a3 atIndexPath:(id)a4 displaySessionUUID:(id)a5 previousCell:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [v12 displaySessionUUID];

  id v15 = v12;
  if (v14 != v13)
  {
    id v16 = [(AVTSimpleAvatarPicker *)self dataSource];
    objc_msgSend(v16, "itemAtIndex:", objc_msgSend(v11, "item"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 != v10)
    {
      uint64_t v18 = 0;
      id v19 = v12;
      goto LABEL_9;
    }
    id v20 = [(AVTSimpleAvatarPicker *)self collectionView];
    int v21 = [v20 cellForItemAtIndexPath:v11];

    uint64_t v22 = [(AVTSimpleAvatarPicker *)self collectionView];
    id v23 = [v22 visibleCells];
    if ([v23 containsObject:v21]) {
      double v24 = v21;
    }
    else {
      double v24 = 0;
    }
    id v15 = v24;
  }
  id v19 = v15;
  uint64_t v18 = v19;
LABEL_9:

  return v18;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(AVTSimpleAvatarPicker *)self dataSource];
  uint64_t v8 = [v6 item];

  id v9 = [v7 itemAtIndex:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__AVTSimpleAvatarPicker_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v10[3] = &unk_263FF2E18;
  v10[4] = self;
  [v9 downcastWithRecordHandler:v10 viewHandler:0];
}

uint64_t __80__AVTSimpleAvatarPicker_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelCurrentRenderingTaskForRecordItem:a2];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTSimpleAvatarPicker *)self dataSource];
  uint64_t v7 = [v5 item];

  int v8 = [v6 isItemAtIndexAddItem:v7];
  if (v8) {
    [(AVTSimpleAvatarPicker *)self presentMemojiEditorForCreation];
  }
  return v8 ^ 1;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v9 indexPathsForSelectedItems];
  uint64_t v7 = [(id)v6 firstObject];

  LOBYTE(v6) = [v7 isEqual:v5];
  if ((v6 & 1) == 0)
  {
    int v8 = [v9 cellForItemAtIndexPath:v7];
    [v8 setSelected:0];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__AVTSimpleAvatarPicker_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  v9[3] = &unk_263FF0780;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __70__AVTSimpleAvatarPicker_collectionView_didUnhighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) indexPathsForSelectedItems];
  id v4 = [v2 firstObject];

  if (([v4 isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v4];
    [v3 setSelected:1];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVTSimpleAvatarPicker *)self avatarPickerDelegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(AVTSimpleAvatarPicker *)self dataSource];
    char v11 = objc_msgSend(v10, "isItemAtIndexAddItem:", objc_msgSend(v7, "item"));

    if ((v11 & 1) == 0)
    {
      [(AVTSimpleAvatarPicker *)self deselectPreviousSelectedItemExcludingIndexPath:v7];
      if ([(AVTSimpleAvatarPicker *)self isItemAtIndexPathOffscreen:v7]) {
        [v6 scrollToItemAtIndexPath:v7 atScrollPosition:16 animated:1];
      }
      id v12 = [(AVTSimpleAvatarPicker *)self dataSource];
      id v13 = objc_msgSend(v12, "itemAtIndex:", objc_msgSend(v7, "item"));

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__AVTSimpleAvatarPicker_collectionView_didSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_263FF2E18;
      v14[4] = self;
      [v13 downcastWithRecordHandler:v14 imageHandler:0 viewHandler:0];
    }
  }
}

void __65__AVTSimpleAvatarPicker_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 avatarPickerDelegate];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v4 avatar];
  [v5 avatarPicker:v6 didSelectAvatarRecord:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v4 avatar];

  [v8 updateHeaderButtonForSelectedAvatar:v9 invalidateLayout:1 animated:1];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scheduleRenderingTask:(id)a3 forRecordItem:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [v6 avatar];
    id v9 = [v8 identifier];
    id v11 = +[AVTStickerTask stickerTaskForSchedulerTask:v7 avatarRecordIdentifier:v9 indexPath:0 stickerType:0];

    id v10 = [(AVTSimpleAvatarPicker *)self taskScheduler];
    [v10 scheduleStickerTask:v11];

    [(AVTSimpleAvatarPicker *)self registerRenderingTask:v7 forRecordItem:v6];
  }
}

- (id)currentRenderingTaskForRecordItem:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTSimpleAvatarPicker *)self itemsToTasksMap];
  id v6 = [v4 avatar];

  id v7 = [v6 identifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (void)registerRenderingTask:(id)a3 forRecordItem:(id)a4
{
  id v6 = a4;
  id v10 = (id)[a3 copy];
  id v7 = [(AVTSimpleAvatarPicker *)self itemsToTasksMap];
  uint64_t v8 = [v6 avatar];

  id v9 = [v8 identifier];
  [v7 setObject:v10 forKeyedSubscript:v9];
}

- (void)cancelCurrentRenderingTaskForRecordItem:(id)a3
{
  id v8 = a3;
  id v4 = -[AVTSimpleAvatarPicker currentRenderingTaskForRecordItem:](self, "currentRenderingTaskForRecordItem:");
  if (v4)
  {
    id v5 = [(AVTSimpleAvatarPicker *)self taskScheduler];
    id v6 = [v8 avatar];
    id v7 = [v6 identifier];
    [v5 cancelPickerTask:v4 avatarRecordIdentifier:v7];

    [(AVTSimpleAvatarPicker *)self unregisterCurrentRenderingTaskForRecordItem:v8];
  }
}

- (void)unregisterCurrentRenderingTaskForRecordItem:(id)a3
{
  id v4 = a3;
  id v7 = [(AVTSimpleAvatarPicker *)self itemsToTasksMap];
  id v5 = [v4 avatar];

  id v6 = [v5 identifier];
  [v7 setObject:0 forKeyedSubscript:v6];
}

- (CGSize)itemSize
{
  id v3 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v6 contentInset];
  double v8 = v5 - v7;
  id v9 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v9 contentInset];
  double v11 = v8 - v10;

  double v12 = 44.0;
  if (v11 > 0.0) {
    double v12 = v11;
  }
  double v13 = v12;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  BOOL v6 = [(AVTSimpleAvatarPicker *)self shouldShowHeaderButton];
  double v7 = 0.0;
  if (v6)
  {
    [(AVTSimpleAvatarPicker *)self minimumInteritemSpacing];
    double v7 = v8;
  }
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  result.double right = v11;
  result.double bottom = v10;
  result.double left = v7;
  result.double top = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if ([(AVTSimpleAvatarPicker *)self shouldShowHeaderButton])
  {
    [(AVTSimpleAvatarPicker *)self itemSize];
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)selectAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v17 = a4;
  id v5 = a3;
  uint64_t v6 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__21;
  id v27 = __Block_byref_object_dispose__21;
  id v28 = 0;
  do
  {
    double v7 = [(AVTSimpleAvatarPicker *)self dataSource];
    uint64_t v8 = [v7 numberOfItems];

    if (v6 >= v8) {
      break;
    }
    double v9 = [(AVTSimpleAvatarPicker *)self dataSource];
    double v10 = [v9 itemAtIndex:v6];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__AVTSimpleAvatarPicker_selectAvatarRecordWithIdentifier_animated___block_invoke;
    v18[3] = &unk_263FF2E90;
    id v19 = v5;
    id v20 = &v29;
    int v21 = &v23;
    uint64_t v22 = v6;
    [v10 downcastWithRecordHandler:v18 imageHandler:0 viewHandler:0];
    uint64_t v11 = v30[3];

    ++v6;
  }
  while (v11 == 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v12 = v30[3];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [MEMORY[0x263F088C8] indexPathForItem:v12 inSection:0];
    [(AVTSimpleAvatarPicker *)self deselectPreviousSelectedItemExcludingIndexPath:v13];
    if ([(AVTSimpleAvatarPicker *)self isItemAtIndexPathOffscreen:v13]) {
      uint64_t v14 = 16;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v15 layoutIfNeeded];

    id v16 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v16 selectItemAtIndexPath:v13 animated:v17 scrollPosition:v14];

    [(AVTSimpleAvatarPicker *)self updateHeaderButtonForSelectedAvatar:v24[5] invalidateLayout:1 animated:v17];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __67__AVTSimpleAvatarPicker_selectAvatarRecordWithIdentifier_animated___block_invoke(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 avatar];
  double v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:a1[4]];

  if (v5)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a1[7];
    uint64_t v6 = [v9 avatar];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)isItemAtIndexPathOffscreen:(id)a3
{
  id v4 = a3;
  int v5 = [(AVTSimpleAvatarPicker *)self collectionView];
  uint64_t v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

  [v6 frame];
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v15 contentOffset];
  double v17 = v8 - v16;

  v40.origin.CGFloat x = v17;
  v40.origin.CGFloat y = v10;
  v40.size.CGFloat width = v12;
  v40.size.CGFloat height = v14;
  double MaxX = CGRectGetMaxX(v40);
  id v19 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v19 frame];
  if (MaxX > CGRectGetMaxX(v41))
  {

LABEL_7:
    BOOL v38 = 1;
    goto LABEL_8;
  }
  v42.origin.CGFloat x = v17;
  v42.origin.CGFloat y = v10;
  v42.size.CGFloat width = v12;
  v42.size.CGFloat height = v14;
  double MinX = CGRectGetMinX(v42);
  int v21 = [(AVTSimpleAvatarPicker *)self collectionView];
  [v21 frame];
  double v22 = CGRectGetMinX(v43);

  if (MinX < v22) {
    goto LABEL_7;
  }
  if ([(AVTSimpleAvatarPicker *)self shouldShowHeaderButton])
  {
    uint64_t v23 = [(AVTSimpleAvatarPicker *)self headerView];
    [v23 frame];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(AVTSimpleAvatarPicker *)self minimumInteritemSpacing];
    CGFloat v33 = -v32;
    v44.origin.CGFloat x = v25;
    v44.origin.CGFloat y = v27;
    v44.size.CGFloat width = v29;
    v44.size.CGFloat height = v31;
    CGRect v45 = CGRectInset(v44, v33, 0.0);
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;

    [v6 frame];
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    if (CGRectIntersectsRect(v46, v47)) {
      goto LABEL_7;
    }
  }
  BOOL v38 = 0;
LABEL_8:

  return v38;
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  [(AVTSimpleAvatarPicker *)self presentedAvatarRecord:a4];
  id v5 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
  [v5 dismissAvatarUIControllerAnimated:1];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v3 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
  [v3 dismissAvatarUIControllerAnimated:1];
}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  id v3 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
  [v3 dismissAvatarUIControllerAnimated:1];
}

- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AVTSimpleAvatarPicker *)self dataSource];
  double v7 = [v6 recordDataSource];
  double v8 = +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:v5 withDataSource:v7];

  if (v8)
  {
    double v9 = [v8 avatarRecord];

    if (v9)
    {
      CGFloat v10 = [(AVTSimpleAvatarPicker *)self avatarPickerDelegate];
      double v11 = [v8 avatarRecord];
      [v10 avatarPicker:self didSelectAvatarRecord:v11];

      CGFloat v12 = [v8 avatarRecord];
      [(AVTSimpleAvatarPicker *)self presentedAvatarRecord:v12];

      double v13 = [v8 avatarRecord];
      [(AVTSimpleAvatarPicker *)self updateHeaderButtonForSelectedAvatar:v13 invalidateLayout:1 animated:1];
    }
  }
  return v8;
}

- (void)avatarActionsViewController:(id)a3 willPresentAvatarRecord:(id)a4
{
}

- (void)presentedAvatarRecord:(id)a3
{
  id v7 = a3;
  id v4 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(AVTSimpleAvatarPicker *)self presenterDelegate];
    [v6 presentedAvatarRecord:v7];
  }
}

- (void)notifyingContainerViewWillChangeSize:(CGSize)a3
{
  id v4 = [(AVTSimpleAvatarPicker *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x263F001B0];
  double v10 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v6 != v9 || v8 != v10)
  {
    id v13 = [(AVTSimpleAvatarPicker *)self collectionView];
    CGFloat v12 = [v13 collectionViewLayout];
    [v12 invalidateLayout];
  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  id v4 = [(AVTSimpleAvatarPicker *)self collectionView];
  double v5 = [v4 indexPathsForSelectedItems];
  id v8 = [v5 firstObject];

  if (v8 && [(AVTSimpleAvatarPicker *)self isItemAtIndexPathOffscreen:v8])
  {
    double v6 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v6 layoutIfNeeded];

    double v7 = [(AVTSimpleAvatarPicker *)self collectionView];
    [v7 scrollToItemAtIndexPath:v8 atScrollPosition:16 animated:1];
  }
}

- (void)updateCell:(id)a3 withImage:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = [(AVTSimpleAvatarPicker *)self imageDelegate];

  if (v10)
  {
    double v11 = [v8 displaySessionUUID];
    CGFloat v12 = [(AVTSimpleAvatarPicker *)self imageDelegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__AVTSimpleAvatarPicker_updateCell_withImage_animated___block_invoke;
    v14[3] = &unk_263FF2EB8;
    id v15 = v8;
    id v16 = v11;
    BOOL v17 = v5;
    id v13 = v11;
    [v12 viewWillUpdateWithImage:v9 completion:v14];
  }
  else
  {
    [v8 updateWithImage:v9 animated:v5];
  }
}

void __55__AVTSimpleAvatarPicker_updateCell_withImage_animated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) displaySessionUUID];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) updateWithImage:v5 animated:*(unsigned __int8 *)(a1 + 48)];
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

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelegate);
  return (AVTStickerViewControllerImageDelegate *)WeakRetained;
}

- (void)setImageDelegate:(id)a3
{
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (BOOL)shouldReverseNaturalLayout
{
  return self->_shouldReverseNaturalLayout;
}

- (void)setShouldReverseNaturalLayout:(BOOL)a3
{
  self->_shouldReverseNaturalLayout = a3;
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

- (AVTEdgeDisappearingCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (AVTAvatarPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
}

- (NSMutableDictionary)itemsToTasksMap
{
  return self->_itemsToTasksMap;
}

- (void)setItemsToTasksMap:(id)a3
{
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (AVTSimpleAvatarPickerHeaderView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  return (AVTSimpleAvatarPickerHeaderView *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (BOOL)doesDisplayEditIconWhenAvailable
{
  return self->_doesDisplayEditIconWhenAvailable;
}

- (void)setDoesDisplayEditIconWhenAvailable:(BOOL)a3
{
  self->_doesDisplayEditIconWhenAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerView);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_itemsToTasksMap, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end