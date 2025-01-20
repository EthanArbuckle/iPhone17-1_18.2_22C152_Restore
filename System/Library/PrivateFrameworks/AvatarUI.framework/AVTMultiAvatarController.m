@interface AVTMultiAvatarController
+ (id)listItemsForAvatarRecords:(id)a3;
+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5;
+ (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4 avtViewAspectRatio:(CGSize)a5 dataSource:(id)a6 environment:(id)a7;
- (AVTAvatarDisplayingControllerDelegate)delegate;
- (AVTAvatarListCell)liveCell;
- (AVTAvatarListItem)addListItem;
- (AVTAvatarRecord)displayedRecord;
- (AVTAvatarRecordDataSource)dataSource;
- (AVTCarouselPlusButtonView)addItemView;
- (AVTCenteringCollectionViewDelegate)centeringDelegate;
- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4;
- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4 initialAVTViewLayout:(id)a5;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRenderingScope)renderingScope;
- (AVTTransitionCoordinator)transitionCoordinator;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTViewCarouselLayout)avtViewLayout;
- (AVTViewSession)avtViewSession;
- (AVTZIndexEngagementListCollectionViewLayout)collectionViewLayout;
- (BOOL)allowsCreate;
- (BOOL)hideImageForDisplayedRecord;
- (BOOL)isViewLoaded;
- (BOOL)shouldCurrentlyDisplayedRecordTransitionToLive;
- (CGPoint)lastContentOffset;
- (NSArray)recordListItems;
- (NSNumber)cachedCanCreateValue;
- (UICollectionView)collectionView;
- (UIView)view;
- (_AVTAvatarRecordImageProvider)thumbnailRenderer;
- (double)decelerationRate;
- (id)cellForRecordItem:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)getFirstItem;
- (id)indexPathForItemClosestToCenter;
- (id)listItemsForDisplay;
- (id)loadRecords;
- (id)recordForItem:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)listItemIndexForRecord:(id)a3;
- (void)buildCollectionViewAndConfigureLayoutIfNeeded;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)createAddItemViewIfNeeded;
- (void)createAvatar;
- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dealloc;
- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4;
- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4;
- (void)loadRecordsIfNeeded;
- (void)loadView;
- (void)notifyDelegateForScrollingTowardItem:(id)a3 ratio:(double)a4;
- (void)notifyDelegateForScrollingTowardItemFromOffset:(CGPoint)a3;
- (void)notifyingContainerViewDidChangeSize:(CGSize)a3;
- (void)preloadAll;
- (void)prepareToTransitionToVisible:(BOOL)a3 completionHandler:(id *)a4;
- (void)prepareViewWithLayout:(id)a3;
- (void)reloadData;
- (void)reloadRecordListItems;
- (void)scrollToDisplayedRecord;
- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollToViewForAvatarRecord:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAddItemView:(id)a3;
- (void)setAddListItem:(id)a3;
- (void)setAllowsCreate:(BOOL)a3;
- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4;
- (void)setAvtViewLayout:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setCachedCanCreateValue:(id)a3;
- (void)setCenteringDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedRecord:(id)a3;
- (void)setDisplayedRecordFromIndex:(unint64_t)a3;
- (void)setHideImageForDisplayedRecord:(BOOL)a3;
- (void)setLastContentOffset:(CGPoint)a3;
- (void)setLiveCell:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setRecordListItems:(id)a3;
- (void)setView:(id)a3;
- (void)significantRecordChangeInDataSource:(id)a3;
- (void)snapshotInBlock:(id)a3;
- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4;
- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7;
- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5;
- (void)transitionCenterCellIfPresentToStartFocusing;
- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3;
- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4;
- (void)transitionCurrentDisplayedRecordAnimated:(BOOL)a3;
- (void)updateCachedCanCreateValueIfNeeded;
- (void)updateDisplayedRecordIfNeeded;
- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4;
@end

@implementation AVTMultiAvatarController

+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  id v9 = a5;
  int v10 = [v9 deviceIsPad];
  BOOL v11 = width > 400.0;
  char v12 = v10 & v11;
  double v13 = 0.3;
  if ((v10 & v11) != 0) {
    double v14 = 0.2;
  }
  else {
    double v14 = 0.3;
  }
  if ((v10 & v11) == 0) {
    double v13 = 0.7;
  }
  double v15 = v8 * v13;
  double v16 = v7 * v13;
  +[AVTEngagementLayout minimumInterItemSpacingForVisibileBoundsSize:defaultCellSize:engagedCellSize:](AVTEngagementLayout, "minimumInterItemSpacingForVisibileBoundsSize:defaultCellSize:engagedCellSize:", width, height, v8 * v13, v7 * v13, v8, v7);
  uint64_t v18 = v17;
  v19 = [AVTEngagementLayout alloc];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __93__AVTMultiAvatarController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke;
  v23[3] = &__block_descriptor_41_e8_d16__0d8l;
  char v24 = v12;
  v23[4] = v18;
  v20 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:](v19, "initWithDefaultCellSize:engagedCellSize:interItemSpacingProvider:", v23, v15, v16, v8, v7);
  v21 = [[AVTZIndexEngagementListCollectionViewLayout alloc] initWithEngagementLayout:v20 minAlphaFactor:v9 environment:v14];

  return v21;
}

double __93__AVTMultiAvatarController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke(uint64_t a1, double a2)
{
  double v2 = -42.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = -51.0;
  }
  double v3 = 24.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = -22.0;
  }
  if (v2 < *(double *)(a1 + 32)) {
    double v2 = *(double *)(a1 + 32);
  }
  return v3 + (v2 - v3) * a2;
}

+ (id)listItemsForAvatarRecords:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        BOOL v11 = [AVTAvatarListRecordItem alloc];
        char v12 = -[AVTAvatarListRecordItem initWithAvatar:](v11, "initWithAvatar:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  double v13 = (void *)[v4 copy];
  return v13;
}

- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4
{
  return [(AVTMultiAvatarController *)self initWithDataSource:a3 environment:a4 initialAVTViewLayout:0];
}

- (AVTMultiAvatarController)initWithDataSource:(id)a3 environment:(id)a4 initialAVTViewLayout:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (AVTUIEnvironment *)a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AVTMultiAvatarController;
  char v12 = [(AVTMultiAvatarController *)&v23 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    [(AVTAvatarRecordDataSource *)v13->_dataSource addObserver:v13];
    uint64_t v14 = [(AVTUIEnvironment *)v10 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    v13->_environment = v10;
    uint64_t v16 = +[AVTRenderingScope listControllerThumbnailScope];
    renderingScope = v13->_renderingScope;
    v13->_renderingScope = (AVTRenderingScope *)v16;

    long long v18 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v10];
    thumbnailRenderer = v13->_thumbnailRenderer;
    v13->_thumbnailRenderer = v18;

    uint64_t v20 = +[AVTTransitionCoordinator synchronousTransitionCoordinator];
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v20;

    v13->_decelerationRate = *(double *)MEMORY[0x263F1D5C8];
    objc_storeStrong((id *)&v13->_avtViewLayout, a5);
    v13->_allowsCreate = 1;
  }

  return v13;
}

- (void)dealloc
{
  [(AVTAvatarRecordDataSource *)self->_dataSource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)AVTMultiAvatarController;
  [(AVTMultiAvatarController *)&v3 dealloc];
}

- (id)listItemsForDisplay
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(AVTMultiAvatarController *)self getFirstItem];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(AVTMultiAvatarController *)self recordListItems];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (UIView)view
{
  if (![(AVTMultiAvatarController *)self isViewLoaded])
  {
    [(AVTMultiAvatarController *)self loadView];
    [(AVTMultiAvatarController *)self preloadAll];
  }
  view = self->_view;
  return view;
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (void)setDecelerationRate:(double)a3
{
  if (self->_decelerationRate != a3)
  {
    self->_decelerationRate = a3;
    id v4 = [(AVTMultiAvatarController *)self collectionView];
    [v4 setDecelerationRate:a3];
  }
}

- (void)updateCachedCanCreateValueIfNeeded
{
  if (!self->_cachedCanCreateValue)
  {
    objc_super v3 = [(AVTMultiAvatarController *)self dataSource];
    id v4 = [v3 internalRecordStore];
    id v7 = 0;
    uint64_t v5 = [v4 canCreateAvatarWithError:&v7];
    id v6 = v7;

    if (!v6) {
      self->_cachedCanCreateValue = (NSNumber *)(id)[NSNumber numberWithBool:v5];
    }
  }
}

- (id)getFirstItem
{
  [(AVTMultiAvatarController *)self updateCachedCanCreateValueIfNeeded];
  if (!AVTUIIsAvatarUIEnabled()) {
    goto LABEL_8;
  }
  objc_super v3 = [(AVTMultiAvatarController *)self cachedCanCreateValue];
  if (([v3 BOOLValue] & 1) == 0)
  {

    goto LABEL_8;
  }
  BOOL v4 = [(AVTMultiAvatarController *)self allowsCreate];

  if (!v4)
  {
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [(AVTMultiAvatarController *)self addListItem];

  if (!v5)
  {
    id v6 = [AVTAvatarListViewItem alloc];
    id v7 = [(AVTMultiAvatarController *)self addItemView];
    uint64_t v8 = [(AVTAvatarListViewItem *)v6 initWithView:v7];
    [(AVTMultiAvatarController *)self setAddListItem:v8];
  }
  id v9 = [(AVTMultiAvatarController *)self addListItem];
LABEL_9:
  return v9;
}

- (AVTCarouselPlusButtonView)addItemView
{
  [(AVTMultiAvatarController *)self createAddItemViewIfNeeded];
  addItemView = self->_addItemView;
  return addItemView;
}

- (void)createAddItemViewIfNeeded
{
  if (!self->_addItemView)
  {
    objc_super v3 = [AVTCarouselPlusButtonView alloc];
    BOOL v4 = [(AVTMultiAvatarController *)self environment];
    uint64_t v5 = -[AVTCarouselPlusButtonView initWithFrame:environment:](v3, "initWithFrame:environment:", v4, 0.0, 0.0, 100.0, 100.0);
    addItemView = self->_addItemView;
    self->_addItemView = v5;

    id v7 = [(AVTMultiAvatarController *)self collectionViewLayout];

    if (v7)
    {
      id v9 = [(AVTMultiAvatarController *)self collectionViewLayout];
      uint64_t v8 = [v9 engagementLayout];
      [v8 engagedCellSize];
      -[AVTCarouselPlusButtonView setMaxItemSize:](self->_addItemView, "setMaxItemSize:");
    }
  }
}

- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_allowsCreate != a3)
  {
    BOOL v5 = a3;
    self->_allowsCreate = a3;
    [(AVTMultiAvatarController *)self updateCachedCanCreateValueIfNeeded];
    if (AVTUIIsAvatarUIEnabled())
    {
      id v7 = [(AVTMultiAvatarController *)self cachedCanCreateValue];
      int v8 = [v7 BOOLValue];

      if (v8)
      {
        id v9 = [(AVTMultiAvatarController *)self collectionViewLayout];
        uint64_t v10 = v9;
        if (v5)
        {
          id v11 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
          [v10 setPlusButtonIndexPath:v11];
        }
        else
        {
          [v9 setPlusButtonIndexPath:0];
        }

        char v12 = [(AVTMultiAvatarController *)self indexPathForItemClosestToCenter];
        uint64_t v13 = [v12 item];

        uint64_t v14 = [(AVTMultiAvatarController *)self displayedRecord];
        unint64_t v15 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v14];

        uint64_t v16 = [(AVTMultiAvatarController *)self collectionViewLayout];
        long long v17 = [MEMORY[0x263F088C8] indexPathForItem:v15 inSection:0];
        [v16 setBackIndexPath:v17];

        long long v18 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:2 * (v13 != 0) curve:0 animations:dbl_20AFF2060[v13 == 0]];
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke;
        v62[3] = &unk_263FF0F58;
        v62[4] = self;
        BOOL v63 = v13 == 0;
        BOOL v64 = a4;
        [v18 addCompletion:v62];
        if (v5)
        {
          v19 = [(AVTMultiAvatarController *)self collectionViewLayout];
          uint64_t v20 = [(AVTMultiAvatarController *)self collectionView];
          [v20 bounds];
          double v22 = v21;
          double v24 = v23;
          v25 = [(AVTMultiAvatarController *)self collectionView];
          [v25 bounds];
          objc_msgSend(v19, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13 + 1, v22, v24, v26, v27);
          double v29 = v28;
          double v31 = v30;

          v32 = [(AVTMultiAvatarController *)self collectionView];
          +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v32, v29, v31);
          double v34 = v33;
          double v36 = v35;

          v37 = [(AVTMultiAvatarController *)self collectionViewLayout];
          objc_msgSend(v37, "setTargetContentOffsetForAnimations:", v34, v36);

          v38 = [(AVTMultiAvatarController *)self collectionView];
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_2;
          v61[3] = &unk_263FF03D8;
          v61[4] = self;
          [v38 performBatchUpdates:v61 withAnimator:v18];

          [v18 startAnimation];
        }
        else
        {
          if (v13)
          {
            v39 = [(AVTMultiAvatarController *)self collectionViewLayout];
            v40 = [(AVTMultiAvatarController *)self collectionView];
            [v40 bounds];
            double v42 = v41;
            double v44 = v43;
            v45 = [(AVTMultiAvatarController *)self collectionView];
            [v45 bounds];
            objc_msgSend(v39, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v13 - 1, v42, v44, v46, v47);
            double v49 = v48;
            double v51 = v50;

            v52 = [(AVTMultiAvatarController *)self collectionView];
            +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v52, v49, v51);
            double v54 = v53;
            double v56 = v55;

            v57 = [(AVTMultiAvatarController *)self collectionViewLayout];
            objc_msgSend(v57, "setTargetContentOffsetForAnimations:", v54, v56);
          }
          v58 = [(AVTMultiAvatarController *)self collectionView];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_3;
          v60[3] = &unk_263FF03D8;
          v60[4] = self;
          [v58 performBatchUpdates:v60 withAnimator:v18];

          [v18 startAnimation];
          if (!v13)
          {
            v59 = [(AVTMultiAvatarController *)self collectionView];
            [v59 contentOffset];
            -[AVTMultiAvatarController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", 1);
          }
        }
      }
    }
  }
}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) collectionViewLayout];
  [v2 clearTargetContentOffsetForAnimations];

  if (*(unsigned char *)(a1 + 40))
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
    [v3 transitionCurrentDisplayedRecordAnimated:v4];
  }
}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) collectionView];
  double v2 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  v4[0] = v2;
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 insertItemsAtIndexPaths:v3];
}

void __53__AVTMultiAvatarController_setAllowsCreate_animated___block_invoke_3(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) collectionView];
  double v2 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  v4[0] = v2;
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v1 deleteItemsAtIndexPaths:v3];
}

- (void)buildCollectionViewAndConfigureLayoutIfNeeded
{
  objc_super v3 = [(AVTMultiAvatarController *)self avtViewLayout];

  if (v3)
  {
    uint64_t v4 = [(AVTMultiAvatarController *)self avtViewLayout];
    BOOL v5 = [(AVTMultiAvatarController *)self view];
    [v5 bounds];
    objc_msgSend(v4, "avatarViewSizeForAvailableContentSize:", v6, v7);
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = [(AVTMultiAvatarController *)self collectionViewLayout];
    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(AVTMultiAvatarController *)self collectionViewLayout];
    unint64_t v15 = [v14 engagementLayout];
    [v15 engagedCellSize];
    double v17 = v16;
    double v19 = v18;

    if (v17 != v9 || v19 != v11)
    {
LABEL_6:
      uint64_t v20 = objc_opt_class();
      double v21 = [(AVTMultiAvatarController *)self view];
      [v21 bounds];
      double v23 = v22;
      double v25 = v24;
      double v26 = [(AVTMultiAvatarController *)self environment];
      id v52 = (id)objc_msgSend(v20, "newCollectionViewLayoutForEngagedCellSize:boundsSize:environment:", v26, v9, v11, v23, v25);

      if ([(AVTMultiAvatarController *)self allowsCreate])
      {
        double v27 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
        [v52 setPlusButtonIndexPath:v27];
      }
      else
      {
        [v52 setPlusButtonIndexPath:0];
      }
      double v28 = [(AVTMultiAvatarController *)self displayedRecord];
      unint64_t v29 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v28];

      double v30 = [MEMORY[0x263F088C8] indexPathForItem:v29 inSection:0];
      [v52 setBackIndexPath:v30];

      [(AVTMultiAvatarController *)self setCollectionViewLayout:v52];
      double v31 = [(AVTMultiAvatarController *)self collectionViewLayout];
      v32 = [v31 engagementLayout];
      [v32 engagedCellSize];
      double v34 = v33;
      double v36 = v35;
      v37 = [(AVTMultiAvatarController *)self addItemView];
      objc_msgSend(v37, "setMaxItemSize:", v34, v36);

      v38 = [(AVTMultiAvatarController *)self collectionView];

      if (v38)
      {
        v39 = [(AVTMultiAvatarController *)self collectionView];
        [v39 setCollectionViewLayout:v52];
      }
      else
      {
        id v40 = objc_alloc(MEMORY[0x263F1C4E0]);
        double v41 = [(AVTMultiAvatarController *)self view];
        [v41 bounds];
        v39 = objc_msgSend(v40, "initWithFrame:collectionViewLayout:", v52);

        double v42 = [AVTCenteringCollectionViewDelegate alloc];
        double v43 = [(AVTMultiAvatarController *)self environment];
        double v44 = [(AVTCenteringCollectionViewDelegate *)v42 initWithCollectionView:v39 delegate:self environment:v43];
        [(AVTMultiAvatarController *)self setCenteringDelegate:v44];

        v45 = [(AVTMultiAvatarController *)self centeringDelegate];
        [v39 setDelegate:v45];

        [v39 setDataSource:self];
        [(AVTMultiAvatarController *)self decelerationRate];
        objc_msgSend(v39, "setDecelerationRate:");
        uint64_t v46 = objc_opt_class();
        double v47 = +[AVTAvatarListCell reuseIdentifier];
        [v39 registerClass:v46 forCellWithReuseIdentifier:v47];

        uint64_t v48 = objc_opt_class();
        double v49 = +[AVTCollectionViewCell reuseIdentifier];
        [v39 registerClass:v48 forCellWithReuseIdentifier:v49];

        double v50 = [MEMORY[0x263F1C550] clearColor];
        [v39 setBackgroundColor:v50];

        [v39 setShowsHorizontalScrollIndicator:0];
        [v39 setContentInsetAdjustmentBehavior:2];
        [v39 setAutoresizingMask:18];
        double v51 = [(AVTMultiAvatarController *)self view];
        [v51 addSubview:v39];

        [(AVTMultiAvatarController *)self setCollectionView:v39];
      }
    }
  }
}

- (void)loadView
{
  objc_super v3 = [AVTNotifyingContainerView alloc];
  uint64_t v4 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AVTNotifyingContainerView *)v4 setDelegate:self];
  [(AVTMultiAvatarController *)self setView:v4];
}

- (void)preloadAll
{
  if (AVTUIAvatarPreLoadOnLaunch())
  {
    objc_super v3 = (void *)MEMORY[0x263F29730];
    id v5 = [(AVTMultiAvatarController *)self dataSource];
    uint64_t v4 = [v5 recordStore];
    [v3 preloadAllAvatarsWithStore:v4 completionHandler:0];
  }
}

- (id)loadRecords
{
  objc_super v3 = [(AVTMultiAvatarController *)self dataSource];
  uint64_t v4 = [v3 numberOfRecords];

  id v5 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v7 = [(AVTMultiAvatarController *)self dataSource];
      double v8 = [v7 recordAtIndex:i];

      [v5 addObject:v8];
    }
  }
  double v9 = (void *)[v5 copy];

  return v9;
}

- (void)createAvatar
{
  if ([(AVTMultiAvatarController *)self allowsCreate])
  {
    id v8 = [(AVTMultiAvatarController *)self indexPathForItemClosestToCenter];
    objc_super v3 = (void *)MEMORY[0x263F088C8];
    uint64_t v4 = [(AVTMultiAvatarController *)self listItemsForDisplay];
    id v5 = [(AVTMultiAvatarController *)self addListItem];
    double v6 = objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "indexOfObject:", v5), 0);

    if ([v8 isEqual:v6])
    {
      double v7 = [(AVTMultiAvatarController *)self delegate];
      [v7 displayingControllerWantsToPresentEditorForCreation:self];
    }
  }
}

- (void)scrollToDisplayedRecord
{
  id v3 = [(AVTMultiAvatarController *)self displayedRecord];
  [(AVTMultiAvatarController *)self scrollToViewForAvatarRecord:v3 animated:0];
}

- (void)scrollToViewForAvatarRecord:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = v6;
  if (!v6)
  {
    id v8 = [(AVTMultiAvatarController *)self getFirstItem];

    id v6 = 0;
    if (v8)
    {
      unint64_t v7 = 0;
      goto LABEL_6;
    }
  }
  unint64_t v7 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_6:
  }
    [(AVTMultiAvatarController *)self scrollToViewAtIndex:v7 animated:v4];
}

- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v29 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  unint64_t v7 = [(AVTMultiAvatarController *)self collectionViewLayout];
  uint64_t v8 = [v29 item];
  id v9 = [(AVTMultiAvatarController *)self collectionView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(AVTMultiAvatarController *)self collectionView];
  [v14 bounds];
  objc_msgSend(v7, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v8, v11, v13, v15, v16);
  double v18 = v17;
  double v20 = v19;

  double v21 = [(AVTMultiAvatarController *)self collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v21, v18, v20);
  double v23 = v22;
  double v25 = v24;

  double v26 = [(AVTMultiAvatarController *)self collectionView];
  objc_msgSend(v26, "setContentOffset:animated:", v4, v23, v25);

  if (!v4)
  {
    double v27 = [(AVTMultiAvatarController *)self listItemsForDisplay];
    double v28 = [v27 objectAtIndexedSubscript:a3];
    [(AVTMultiAvatarController *)self notifyDelegateForScrollingTowardItem:v28 ratio:1.0];
  }
}

- (unint64_t)listItemIndexForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke;
  v9[3] = &unk_263FF0FA8;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke_2;
  v6[3] = &unk_263FF0F80;
  uint64_t v8 = &v9;
  id v7 = *(id *)(a1 + 32);
  [v3 downcastWithRecordHandler:v6 viewHandler:0];
  uint64_t v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __51__AVTMultiAvatarController_listItemIndexForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 avatar];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqual:*(void *)(a1 + 32)];
}

- (id)recordForItem:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AVTMultiAvatarController_recordForItem___block_invoke;
  v6[3] = &unk_263FF0FD0;
  void v6[4] = &v7;
  [v3 downcastWithRecordHandler:v6 viewHandler:0];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__AVTMultiAvatarController_recordForItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avatar];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (id)indexPathForItemClosestToCenter
{
  uint64_t v3 = [(AVTMultiAvatarController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(AVTMultiAvatarController *)self collectionView];
  uint64_t v9 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);

  return v9;
}

- (id)cellForRecordItem:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"List item not found %@", v4 format];
  }
  double v7 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:0];
  uint64_t v8 = [(AVTMultiAvatarController *)self collectionView];
  uint64_t v9 = [v8 cellForItemAtIndexPath:v7];

  return v9;
}

- (BOOL)shouldCurrentlyDisplayedRecordTransitionToLive
{
  uint64_t v3 = [(AVTMultiAvatarController *)self displayedRecord];
  unint64_t v4 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v6 = [(AVTMultiAvatarController *)self collectionViewLayout];
  double v7 = [(AVTMultiAvatarController *)self collectionView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  id v12 = [(AVTMultiAvatarController *)self collectionView];
  [v12 bounds];
  objc_msgSend(v6, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v4, v9, v11, v13, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = [(AVTMultiAvatarController *)self collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v19, v16, v18);
  double v21 = v20;

  double v22 = [(AVTMultiAvatarController *)self collectionView];
  [v22 contentOffset];
  BOOL v5 = vabdd_f64(v21, v23) < 1.0;

  return v5;
}

- (void)updateDisplayedRecordIfNeeded
{
  uint64_t v3 = [(AVTMultiAvatarController *)self indexPathForItemClosestToCenter];
  if (v3)
  {
    id v4 = v3;
    -[AVTMultiAvatarController setDisplayedRecordFromIndex:](self, "setDisplayedRecordFromIndex:", [v3 item]);
    uint64_t v3 = v4;
  }
}

- (void)setDisplayedRecordFromIndex:(unint64_t)a3
{
  BOOL v5 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Can't find displayed record for index %ld", a3);
  }
  double v7 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  double v8 = [v7 objectAtIndex:a3];

  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke;
  v12[3] = &unk_263FF0FF8;
  v12[4] = self;
  unint64_t v14 = a3;
  id v9 = v8;
  id v13 = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke_2;
  v11[3] = &unk_263FF1020;
  v11[4] = self;
  v11[5] = &v15;
  [v9 downcastWithRecordHandler:v12 viewHandler:v11];
  double v10 = [(AVTMultiAvatarController *)self addItemView];
  [v10 setAllowHighlight:*((unsigned __int8 *)v16 + 24)];

  _Block_object_dispose(&v15, 8);
}

void __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 avatar];
  id v4 = [*(id *)(a1 + 32) displayedRecord];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    unint64_t v6 = [v15 avatar];
    [*(id *)(a1 + 32) setDisplayedRecord:v6];

    double v7 = [*(id *)(a1 + 32) collectionViewLayout];
    double v8 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 48) inSection:0];
    [v7 setBackIndexPath:v8];

    id v9 = [*(id *)(a1 + 32) collectionViewLayout];
    [v9 invalidateLayout];

    double v10 = [*(id *)(a1 + 32) logger];
    double v11 = [*(id *)(a1 + 40) description];
    [v10 logCarouselChangesCenterItemTo:v11];

    id v12 = [*(id *)(a1 + 32) delegate];
    id v13 = *(void **)(a1 + 32);
    unint64_t v14 = [v13 displayedRecord];
    [v12 displayingController:v13 didChangeCurrentRecord:v14];
  }
}

void __56__AVTMultiAvatarController_setDisplayedRecordFromIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 addListItem];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)transitionCurrentDisplayedRecordAnimated:(BOOL)a3
{
  char v5 = [(AVTMultiAvatarController *)self displayedRecord];
  unint64_t v6 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [MEMORY[0x263F088C8] indexPathForItem:v6 inSection:0];
    double v8 = [(AVTMultiAvatarController *)self collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v7];

    if ([(AVTMultiAvatarController *)self shouldCurrentlyDisplayedRecordTransitionToLive])
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke;
      v10[3] = &unk_263FF05A8;
      v10[4] = self;
      id v11 = v7;
      BOOL v12 = a3;
      [v9 downcastWithCellHandler:0 listCellHandler:v10];
    }
  }
}

void __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) liveCell];
  if ((id)v4 == v3)
  {
  }
  else
  {
    char v5 = (void *)v4;
    unint64_t v6 = [*(id *)(a1 + 32) avtViewSession];
    int v7 = [v6 isActive];

    if (v7)
    {
      double v8 = [*(id *)(a1 + 32) delegate];
      [v8 willBeginFocus:*(void *)(a1 + 32)];

      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      BOOL v12 = [v9 avtViewSession];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke_2;
      v13[3] = &unk_263FF04A0;
      v13[4] = *(void *)(a1 + 32);
      [v9 transitionCell:v3 indexPath:v10 toStartFocusingAnimated:v11 session:v12 completionHandler:v13];
    }
  }
}

void __69__AVTMultiAvatarController_transitionCurrentDisplayedRecordAnimated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 didBeginFocus:*(void *)(a1 + 32)];
  }
}

- (void)notifyDelegateForScrollingTowardItemFromOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(AVTMultiAvatarController *)self indexPathForItemClosestToCenter];
  double v18 = 0.0;
  int v7 = [(AVTMultiAvatarController *)self collectionView];
  [v7 contentOffset];
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  uint64_t v13 = [v12 count];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__AVTMultiAvatarController_notifyDelegateForScrollingTowardItemFromOffset___block_invoke;
  v17[3] = &unk_263FF1048;
  v17[4] = self;
  unint64_t v14 = +[AVTCenteringCollectionViewHelper indexPathForItemBeingScrolledTowardFromOffset:currentOffset:nearestItemToCenter:itemCount:itemOffsetProvider:ratio:](AVTCenteringCollectionViewHelper, "indexPathForItemBeingScrolledTowardFromOffset:currentOffset:nearestItemToCenter:itemCount:itemOffsetProvider:ratio:", v6, v13, v17, &v18, x, y, v9, v11);

  if (v14)
  {
    id v15 = [(AVTMultiAvatarController *)self listItemsForDisplay];
    double v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v14, "item"));

    [(AVTMultiAvatarController *)self notifyDelegateForScrollingTowardItem:v16 ratio:v18];
  }
}

double __75__AVTMultiAvatarController_notifyDelegateForScrollingTowardItemFromOffset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 collectionViewLayout];
  uint64_t v6 = [v4 item];

  int v7 = [*(id *)(a1 + 32) collectionView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = [*(id *)(a1 + 32) collectionView];
  [v12 bounds];
  objc_msgSend(v5, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v6, v9, v11, v13, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = [*(id *)(a1 + 32) collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v19, v16, v18);
  double v21 = v20;

  return v21;
}

- (void)notifyDelegateForScrollingTowardItem:(id)a3 ratio:(double)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke;
  v5[3] = &unk_263FF1070;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke_2;
  v4[3] = &unk_263FF1098;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  [a3 downcastWithRecordHandler:v5 viewHandler:v4];
}

void __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v4 avatar];

  [v7 displayingController:v5 didMoveTowardRecord:v6 withFactor:*(double *)(a1 + 40)];
}

void __71__AVTMultiAvatarController_notifyDelegateForScrollingTowardItem_ratio___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 displayingController:*(void *)(a1 + 32) didMoveTowardRecord:0 withFactor:*(double *)(a1 + 40)];
}

- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  [(AVTMultiAvatarController *)self lastContentOffset];
  double v9 = v8;
  double v11 = v10;
  -[AVTMultiAvatarController setLastContentOffset:](self, "setLastContentOffset:", x, y);
  if (v6)
  {
    [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStopFocusingAnimated:1];
    -[AVTMultiAvatarController notifyDelegateForScrollingTowardItemFromOffset:](self, "notifyDelegateForScrollingTowardItemFromOffset:", v9, v11);
    [(AVTMultiAvatarController *)self updateDisplayedRecordIfNeeded];
  }
  else
  {
    [(AVTMultiAvatarController *)self scrollToDisplayedRecord];
  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  if ([(AVTMultiAvatarController *)self isViewLoaded])
  {
    [(AVTMultiAvatarController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
    [(AVTMultiAvatarController *)self reloadData];
  }
}

- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = a4;
  id v13 = a3;
  [(AVTMultiAvatarController *)self loadRecordsIfNeeded];
  unint64_t v7 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v13];
  double v8 = v13;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13
      || ([(AVTMultiAvatarController *)self displayedRecord],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v9 = [(AVTMultiAvatarController *)self displayedRecord];
      int v10 = [v13 isEqual:v9] ^ 1;

      if (v13)
      {
        if (v5) {
          goto LABEL_11;
        }
LABEL_9:
        if (v10)
        {
          [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStopFocusingAnimated:0];
          [(AVTMultiAvatarController *)self setDisplayedRecordFromIndex:v7];
          double v11 = [(AVTMultiAvatarController *)self displayedRecord];
          [(AVTMultiAvatarController *)self scrollToViewForAvatarRecord:v11 animated:0];

          [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStartFocusing];
LABEL_12:
          double v8 = v13;
          goto LABEL_13;
        }
LABEL_11:
        [(AVTMultiAvatarController *)self setDisplayedRecordFromIndex:v7];
        BOOL v12 = [(AVTMultiAvatarController *)self displayedRecord];
        [(AVTMultiAvatarController *)self scrollToViewForAvatarRecord:v12 animated:v5];

        goto LABEL_12;
      }
    }
    else
    {
      int v10 = 0;
    }

    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_13:
}

- (void)loadRecordsIfNeeded
{
  id v3 = [(AVTMultiAvatarController *)self recordListItems];

  if (!v3)
  {
    [(AVTMultiAvatarController *)self reloadRecordListItems];
  }
}

- (void)reloadRecordListItems
{
  id v9 = [(AVTMultiAvatarController *)self loadRecords];
  id v3 = [(id)objc_opt_class() listItemsForAvatarRecords:v9];
  [(AVTMultiAvatarController *)self setRecordListItems:v3];

  uint64_t v4 = [(AVTMultiAvatarController *)self displayedRecord];
  if (!v4
    || (BOOL v5 = (void *)v4,
        [(AVTMultiAvatarController *)self displayedRecord],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v9 containsObject:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    double v8 = [v9 firstObject];
    [(AVTMultiAvatarController *)self setDisplayedRecordFromIndex:[(AVTMultiAvatarController *)self listItemIndexForRecord:v8]];
  }
}

- (void)reloadData
{
  [(AVTMultiAvatarController *)self reloadRecordListItems];
  id v3 = [(AVTMultiAvatarController *)self liveCell];

  if (v3)
  {
    [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStopFocusingAnimated:0];
    uint64_t v4 = [(AVTMultiAvatarController *)self collectionView];
    [v4 reloadData];

    [(AVTMultiAvatarController *)self scrollToDisplayedRecord];
    [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStartFocusing];
  }
  else
  {
    BOOL v5 = [(AVTMultiAvatarController *)self collectionView];
    [v5 reloadData];

    [(AVTMultiAvatarController *)self scrollToDisplayedRecord];
  }
}

- (void)prepareViewWithLayout:(id)a3
{
  [(AVTMultiAvatarController *)self setAvtViewLayout:a3];
  [(AVTMultiAvatarController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
}

- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4
{
  id v6 = a3;
  [(AVTMultiAvatarController *)self setAvtViewLayout:a4];
  [(AVTMultiAvatarController *)self setAvtViewSession:v6];

  [(AVTMultiAvatarController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
  if ([(AVTMultiAvatarController *)self shouldCurrentlyDisplayedRecordTransitionToLive])
  {
    [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStartFocusing];
  }
}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  id v7 = a4;
  BOOL v5 = [(AVTMultiAvatarController *)self transitionCoordinator];
  [v5 cancelAllTransitions];

  [(AVTMultiAvatarController *)self transitionCenterCellIfPresentToStopFocusingAnimated:0];
  [(AVTMultiAvatarController *)self setAvtViewSession:0];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    id v6 = v7;
  }
}

- (void)prepareToTransitionToVisible:(BOOL)a3 completionHandler:(id *)a4
{
  BOOL v5 = a3;
  id v7 = [(AVTMultiAvatarController *)self collectionView];
  [v7 layoutIfNeeded];

  double v8 = [(AVTMultiAvatarController *)self indexPathForItemClosestToCenter];
  if (v8)
  {
    [(AVTMultiAvatarController *)self setHideImageForDisplayedRecord:1];
    id v9 = [(AVTMultiAvatarController *)self collectionView];
    int v10 = [v9 cellForItemAtIndexPath:v8];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke;
    v15[3] = &unk_263FF10C0;
    BOOL v16 = v5;
    v15[4] = self;
    v15[5] = a4;
    [v10 downcastWithCellHandler:0 listCellHandler:v15];

    if (v5)
    {
      double v11 = [(AVTMultiAvatarController *)self collectionView];
      BOOL v12 = v11;
      uint64_t v13 = 1;
    }
    else
    {
      double v14 = [(AVTMultiAvatarController *)self displayedRecord];
      [(AVTMultiAvatarController *)self scrollToViewForAvatarRecord:v14 animated:1];

      double v11 = [(AVTMultiAvatarController *)self collectionView];
      BOOL v12 = v11;
      uint64_t v13 = 0;
    }
    [v11 setScrollEnabled:v13];
  }
}

void __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setImageViewVisible:0];
  if (*(unsigned char *)(a1 + 48))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    void v4[2] = __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke_2;
    v4[3] = &unk_263FF0780;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    **(void **)(a1 + 40) = (id)[v4 copy];
  }
}

uint64_t __75__AVTMultiAvatarController_prepareToTransitionToVisible_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHideImageForDisplayedRecord:0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setImageViewVisible:1];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__6;
  double v27 = __Block_byref_object_dispose__6;
  id v28 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke;
  v18[3] = &unk_263FF1110;
  id v19 = v6;
  id v20 = v7;
  double v21 = self;
  double v22 = &v23;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v14[3] = &unk_263FF1138;
  id v10 = v19;
  id v15 = v10;
  id v11 = v20;
  id v16 = v11;
  double v17 = &v23;
  [v9 downcastWithRecordHandler:v18 viewHandler:v14];
  id v12 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  int64_t v5 = +[AVTAvatarListCell reuseIdentifier];
  id v6 = [v4 dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 48) avtViewLayout];
  double v8 = [*(id *)(a1 + 48) view];
  [v8 bounds];
  objc_msgSend(v7, "avatarViewSizeForAvailableContentSize:", v9, v10);
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v6, "setAspectRatio:", v12, v14);
  [v6 setImage:0];
  if ([*(id *)(a1 + 48) hideImageForDisplayedRecord])
  {
    id v15 = [v3 avatar];
    id v16 = [*(id *)(a1 + 48) displayedRecord];
    int v17 = [v15 isEqual:v16];

    if (v17) {
      [v6 setImageViewVisible:0];
    }
  }
  double v18 = [v3 avatar];
  [v6 setAvatar:v18];
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  id v19 = [*(id *)(a1 + 48) thumbnailRenderer];
  id v20 = [*(id *)(a1 + 48) renderingScope];
  double v21 = [v19 providerForRecord:v18 scope:v20];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v29[3] = &unk_263FF10E8;
  id v22 = v6;
  id v30 = v22;
  id v23 = v18;
  uint64_t v24 = *(void *)(a1 + 48);
  id v31 = v23;
  uint64_t v32 = v24;
  double v33 = &v34;
  id v25 = (id)((uint64_t (**)(void, void *, void))v21)[2](v21, v29, 0);

  *((unsigned char *)v35 + 24) = 1;
  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  double v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v22;
  id v28 = v22;

  _Block_object_dispose(&v34, 8);
}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) avatar];
  uint64_t v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    id v5 = v7;
    if (!v7)
    {
      id v6 = [*(id *)(a1 + 48) logger];
      [v6 logNilImageReturnedFromAVTAvatarRecordImageProvider];

      id v5 = 0;
    }
    [*(id *)(a1 + 32) setImage:v5 animated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  }
}

void __66__AVTMultiAvatarController_collectionView_cellForItemAtIndexPath___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = +[AVTCollectionViewCell reuseIdentifier];
  id v6 = [v3 dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:a1[5]];

  id v9 = [v4 view];

  [v6 setSubview:v9];
  uint64_t v7 = *(void *)(a1[6] + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 item];
  double v10 = [(AVTMultiAvatarController *)self displayedRecord];
  unint64_t v11 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v10];

  if (v9 == v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__AVTMultiAvatarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v12[3] = &unk_263FF05D0;
    v12[4] = self;
    id v13 = v8;
    [v7 downcastWithCellHandler:0 listCellHandler:v12];
  }
}

uint64_t __78__AVTMultiAvatarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transitionCenterCellToStartFocusing:a2 indexPath:*(void *)(a1 + 40)];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__AVTMultiAvatarController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v5[3] = &unk_263FF05F8;
  v5[4] = self;
  objc_msgSend(a4, "downcastWithCellHandler:listCellHandler:", 0, v5, a5);
}

void __83__AVTMultiAvatarController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 transitionCoordinator];
  [v4 cancelTransitionsMatchingModel:v3];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "item"));

  uint64_t v9 = [(AVTMultiAvatarController *)self addListItem];
  int v10 = [v8 isEqual:v9];

  if (v10) {
    [(AVTMultiAvatarController *)self createAvatar];
  }
  [v11 deselectItemAtIndexPath:v6 animated:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "avtui_isMoving");
  [v4 contentOffset];
  double v7 = v6;
  double v9 = v8;

  -[AVTMultiAvatarController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", v5, v7, v9);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(AVTMultiAvatarController *)self transitionCurrentDisplayedRecordAnimated:1];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
}

- (void)transitionCenterCellIfPresentToStartFocusing
{
  id v3 = [(AVTMultiAvatarController *)self displayedRecord];
  unint64_t v4 = [(AVTMultiAvatarController *)self listItemIndexForRecord:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't find a displayed record"];
  }
  uint64_t v5 = [(AVTMultiAvatarController *)self listItemsForDisplay];
  double v6 = [v5 objectAtIndexedSubscript:v4];
  double v7 = [(AVTMultiAvatarController *)self cellForRecordItem:v6];

  double v8 = [MEMORY[0x263F088C8] indexPathForItem:v4 inSection:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__AVTMultiAvatarController_transitionCenterCellIfPresentToStartFocusing__block_invoke;
  v10[3] = &unk_263FF05D0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v7 downcastWithCellHandler:0 listCellHandler:v10];
}

uint64_t __72__AVTMultiAvatarController_transitionCenterCellIfPresentToStartFocusing__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transitionCenterCellToStartFocusing:a2 indexPath:*(void *)(a1 + 40)];
}

- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AVTMultiAvatarController *)self liveCell];

  if (v5)
  {
    double v6 = [(AVTMultiAvatarController *)self delegate];
    [v6 willEndFocus:self];

    double v7 = (void *)MEMORY[0x210530210]();
    double v8 = [(AVTMultiAvatarController *)self liveCell];
    [(AVTMultiAvatarController *)self transitionCell:v8 toStopFocusingAnimated:v3 completionHandler:v7];

    if (!v3)
    {
      id v9 = [(AVTMultiAvatarController *)self delegate];
      [v9 didEndFocus:self];
    }
  }
}

void __80__AVTMultiAvatarController_transitionCenterCellIfPresentToStopFocusingAnimated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 didEndFocus:*(void *)(a1 + 32)];
  }
}

- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = [(AVTMultiAvatarController *)self liveCell];

    if (!v8)
    {
      id v9 = [(AVTMultiAvatarController *)self collectionView];
      char v10 = objc_msgSend(v9, "avtui_isMoving");

      if ((v10 & 1) == 0)
      {
        id v11 = [(AVTMultiAvatarController *)self avtViewSession];
        if ([v11 isActive])
        {
          double v12 = [v11 avtViewUpdater];
          id v13 = [v12 avatarRecord];
          double v14 = [(AVTMultiAvatarController *)self displayedRecord];
          uint64_t v15 = [v13 isEqual:v14] ^ 1;

          id v16 = [(AVTMultiAvatarController *)self delegate];
          [v16 willBeginFocus:self];

          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __74__AVTMultiAvatarController_transitionCenterCellToStartFocusing_indexPath___block_invoke;
          v17[3] = &unk_263FF04A0;
          v17[4] = self;
          [(AVTMultiAvatarController *)self transitionCell:v6 indexPath:v7 toStartFocusingAnimated:v15 session:v11 completionHandler:v17];
        }
      }
    }
  }
}

void __74__AVTMultiAvatarController_transitionCenterCellToStartFocusing_indexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 didBeginFocus:*(void *)(a1 + 32)];
  }
}

- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(AVTMultiAvatarController *)self setLiveCell:v12];
  id v16 = [(AVTMultiAvatarController *)self transitionCoordinator];
  [v16 cancelTransitionsMatchingModel:v12];

  uint64_t v29 = 0;
  id v30 = (id *)&v29;
  uint64_t v31 = 0x3042000000;
  uint64_t v32 = __Block_byref_object_copy__40;
  double v33 = __Block_byref_object_dispose__41;
  id v34 = 0;
  int v17 = [AVTAvatarToLiveTransition alloc];
  uint64_t v25 = MEMORY[0x263EF8330];
  id v18 = v12;
  id v26 = v18;
  id v28 = &v29;
  id v19 = v14;
  id v27 = v19;
  id v20 = [(AVTMultiAvatarController *)self logger];
  double v21 = [(AVTAvatarToLiveTransition *)v17 initWithModel:v18 animated:v9 setupHandler:&v25 completionHandler:v15 logger:v20];

  objc_storeWeak(v30 + 5, v21);
  id v22 = [(AVTMultiAvatarController *)self logger];
  id v23 = [(AVTTransition *)v21 description];
  [v22 logCarouselAddsTransitionToCoordinator:v23];

  uint64_t v24 = [(AVTMultiAvatarController *)self transitionCoordinator];
  [v24 addTransition:v21];

  _Block_object_dispose(&v29, 8);
  objc_destroyWeak(&v34);
}

void __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) logger];
  uint64_t v5 = [*(id *)(a1 + 40) description];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  id v7 = [WeakRetained description];
  [v4 logCarouselCellStartUsingLiveView:v5 associatedTransition:v7];

  [*(id *)(a1 + 40) beginUsingAVTViewFromSession:*(void *)(a1 + 48)];
  double v8 = [*(id *)(a1 + 48) avtViewUpdater];
  BOOL v9 = [*(id *)(a1 + 40) avatar];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2;
  v11[3] = &unk_263FF0620;
  id v12 = v3;
  id v10 = v3;
  [v8 setAvatarRecord:v9 completionHandler:v11];
}

uint64_t __103__AVTMultiAvatarController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(AVTMultiAvatarController *)self setLiveCell:0];
  id v10 = [(AVTMultiAvatarController *)self logger];
  id v11 = [(AVTMultiAvatarController *)self displayedRecord];
  id v12 = [v11 description];
  id v13 = [v8 description];
  [v10 logCarouselStopsFocusingOnCenterItem:v12 withCell:v13];

  id v14 = [(AVTMultiAvatarController *)self transitionCoordinator];
  [v14 cancelTransitionsMatchingModel:v8];

  id v15 = [v8 avtView];

  if (v15)
  {
    uint64_t v26 = 0;
    id v27 = (id *)&v26;
    uint64_t v28 = 0x3042000000;
    uint64_t v29 = __Block_byref_object_copy__40;
    id v30 = __Block_byref_object_dispose__41;
    id v31 = 0;
    id v16 = [AVTAvatarToStaticTransition alloc];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v25 = &v26;
    id v23 = v8;
    id v24 = v9;
    int v17 = [(AVTMultiAvatarController *)self logger];
    id v18 = [(AVTAvatarToStaticTransition *)v16 initWithModel:v23 animated:v6 completionHandler:&v22 logger:v17];

    objc_storeWeak(v27 + 5, v18);
    id v19 = [(AVTMultiAvatarController *)self logger];
    id v20 = [(AVTTransition *)v18 description];
    [v19 logCarouselAddsTransitionToCoordinator:v20];

    double v21 = [(AVTMultiAvatarController *)self transitionCoordinator];
    [v21 addTransition:v18];

    _Block_object_dispose(&v26, 8);
    objc_destroyWeak(&v31);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

uint64_t __84__AVTMultiAvatarController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    || (id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)),
        uint64_t v4 = [v3 state],
        v3,
        v4 == 2))
  {
    uint64_t v5 = [*(id *)(a1 + 32) logger];
    BOOL v6 = [*(id *)(a1 + 40) description];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    id v8 = [WeakRetained description];
    [v5 logCarouselCellStopUsingLiveView:v6 associatedTransition:v8];

    [*(id *)(a1 + 40) endUsingAVTView];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  self->_cachedCanCreateValue = 0;
}

- (void)significantRecordChangeInDataSource:(id)a3
{
  self->_cachedCanCreateValue = 0;
}

- (AVTAvatarDisplayingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTAvatarDisplayingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (BOOL)allowsCreate
{
  return self->_allowsCreate;
}

- (void)setAllowsCreate:(BOOL)a3
{
  self->_allowsCreate = a3;
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

- (AVTZIndexEngagementListCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (AVTCenteringCollectionViewDelegate)centeringDelegate
{
  return self->_centeringDelegate;
}

- (void)setCenteringDelegate:(id)a3
{
}

- (NSArray)recordListItems
{
  return self->_recordListItems;
}

- (void)setRecordListItems:(id)a3
{
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (void)setAddItemView:(id)a3
{
}

- (AVTAvatarListItem)addListItem
{
  return self->_addListItem;
}

- (void)setAddListItem:(id)a3
{
}

- (AVTAvatarRecord)displayedRecord
{
  return self->_displayedRecord;
}

- (void)setDisplayedRecord:(id)a3
{
}

- (AVTAvatarListCell)liveCell
{
  return self->_liveCell;
}

- (void)setLiveCell:(id)a3
{
}

- (NSNumber)cachedCanCreateValue
{
  return self->_cachedCanCreateValue;
}

- (void)setCachedCanCreateValue:(id)a3
{
  self->_cachedCanCreateValue = (NSNumber *)a3;
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (_AVTAvatarRecordImageProvider)thumbnailRenderer
{
  return self->_thumbnailRenderer;
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
}

- (CGPoint)lastContentOffset
{
  double x = self->_lastContentOffset.x;
  double y = self->_lastContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastContentOffset:(CGPoint)a3
{
  self->_lastContentOffset = a3;
}

- (BOOL)hideImageForDisplayedRecord
{
  return self->_hideImageForDisplayedRecord;
}

- (void)setHideImageForDisplayedRecord:(BOOL)a3
{
  self->_hideImageForDisplayedRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_liveCell, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_addListItem, 0);
  objc_storeStrong((id *)&self->_addItemView, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_recordListItems, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

+ (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4 avtViewAspectRatio:(CGSize)a5 dataSource:(id)a6 environment:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  double v11 = a4.height;
  double v12 = a4.width;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v39 = +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:](AVTViewCarouselLayout, "adaptativeLayoutWithAVTViewAspectRatio:", width, height);
  id v16 = [[AVTMultiAvatarController alloc] initWithDataSource:v14 environment:v15 initialAVTViewLayout:v39];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __135__AVTMultiAvatarController_Snapshotting__snapshotProviderFocusedOnRecordWithIdentifier_size_avtViewAspectRatio_dataSource_environment___block_invoke;
  v46[3] = &unk_263FF0DB8;
  id v17 = v13;
  id v47 = v17;
  unint64_t v18 = [v14 indexOfRecordPassingTest:v46];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Can't find record with identifier %@ for snapshotting", v17 format];
  }
  v38 = v17;
  char v37 = [v14 recordAtIndex:v18];
  id v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:");
  if (v18)
  {
    id v20 = [v14 recordAtIndex:v18 - 1];
    [v19 addObject:v20];
  }
  if (v18 < [v14 numberOfRecords] - 1)
  {
    double v21 = [v14 recordAtIndex:v18 + 1];
    [v19 addObject:v21];
  }
  double v41 = v14;
  id v40 = v15;
  uint64_t v22 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v15];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v23 = v19;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v29 = [(AVTMultiAvatarController *)v16 renderingScope];
        id v30 = [(_AVTAvatarRecordImageProvider *)v22 providerForRecord:v28 scope:v29];

        id v31 = (id)((uint64_t (**)(void, void *, uint64_t))v30)[2](v30, &__block_literal_global_27, 1);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v25);
  }

  [(AVTMultiAvatarController *)v16 displayAvatarForRecord:v37 animated:0];
  [(AVTMultiAvatarController *)v16 reloadData];
  double v32 = *MEMORY[0x263F001A8];
  double v33 = *(double *)(MEMORY[0x263F001A8] + 8);
  id v34 = [(AVTMultiAvatarController *)v16 view];
  objc_msgSend(v34, "setFrame:", v32, v33, v12, v11);

  double v35 = [v40 logger];
  objc_msgSend(v35, "logCarouselSnapshotForIndex:size:", v18, v12, v11);

  return v16;
}

uint64_t __135__AVTMultiAvatarController_Snapshotting__snapshotProviderFocusedOnRecordWithIdentifier_size_avtViewAspectRatio_dataSource_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)snapshotInBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(AVTMultiAvatarController *)self view];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

@end