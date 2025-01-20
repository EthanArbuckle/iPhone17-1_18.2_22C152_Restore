@interface AVTBodyCarouselController
+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5;
- (AVTAvatarListCell)liveCell;
- (AVTAvatarRecord)displayedRecord;
- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4;
- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4 editorPresentationContext:(unint64_t)a5;
- (AVTBodyCarouselController)initWithEnvironment:(id)a3 initialAVTViewLayout:(id)a4 avatarRecord:(id)a5 editorPresentationContext:(unint64_t)a6;
- (AVTCenteringCollectionViewDelegate)centeringDelegate;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRenderingScope)renderingScope;
- (AVTSerialTaskScheduler)scheduler;
- (AVTStickerConfiguration)displayedConfiguration;
- (AVTTransitionCoordinator)transitionCoordinator;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTUIStickerGeneratorPool)generatorPool;
- (AVTUIStickerRenderer)renderer;
- (AVTViewCarouselLayout)avtViewLayout;
- (AVTViewSession)avtViewSession;
- (AVTZIndexEngagementListCollectionViewLayout)collectionViewLayout;
- (BOOL)isAnimatingExpansion;
- (BOOL)isViewLoaded;
- (BOOL)shouldCurrentlyDisplayedConfigurationTransitionToLive;
- (CGSize)centerCellSize;
- (NSArray)configurations;
- (UICollectionView)collectionView;
- (UIView)view;
- (double)decelerationRate;
- (id)cellForConfiguration:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)configurationsForEditorPresentationContext:(unint64_t)a3;
- (id)configureLayoutIfNeededWithHeight:(double)a3;
- (id)indexPathForItemClosestToCenter;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)buildCollectionViewAndConfigureLayoutIfNeeded;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4;
- (void)loadView;
- (void)notifyingContainerViewDidChangeSize:(CGSize)a3;
- (void)prepareViewWithLayout:(id)a3;
- (void)reloadDisplayedSticker;
- (void)scrollToDisplayedConfiguration;
- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollToViewForConfiguration:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAvtViewLayout:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setCenterCellSize:(CGSize)a3;
- (void)setCenteringDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDisplayedConfiguration:(id)a3;
- (void)setDisplayedConfigurationFromIndex:(unint64_t)a3;
- (void)setDisplayedRecord:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setIsAnimatingExpansion:(BOOL)a3;
- (void)setLiveCell:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setStaticImageOnCell:(id)a3 forIndexPath:(id)a4;
- (void)setView:(id)a3;
- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4;
- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7;
- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5;
- (void)transitionCenterCellIfPresentToStartFocusing;
- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3;
- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4;
- (void)transitionCurrentDisplayedConfigurationAnimated:(BOOL)a3;
- (void)updateDisplayedConfigurationIfNeeded;
- (void)updateImageForStaticCellForIndexPath:(id)a3;
- (void)updateStickersforVisibleCells;
- (void)useAVTViewFromSession:(id)a3;
@end

@implementation AVTBodyCarouselController

+ (id)newCollectionViewLayoutForEngagedCellSize:(CGSize)a3 boundsSize:(CGSize)a4 environment:(id)a5
{
  double width = a4.width;
  double height = a3.height;
  double v7 = a3.width;
  id v8 = a5;
  int v9 = [v8 deviceIsPad];
  BOOL v10 = width > 400.0;
  uint64_t v11 = v9 & v10;
  double v12 = 0.3;
  if ((v9 & v10) != 0) {
    double v13 = 0.2;
  }
  else {
    double v13 = 0.3;
  }
  if ((v9 & v10) == 0) {
    double v12 = 0.7;
  }
  double v14 = v7 * v12;
  double v15 = height * v12;
  v16 = [AVTEngagementLayout alloc];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __94__AVTBodyCarouselController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke;
  v20[3] = &__block_descriptor_49_e8_d16__0d8l;
  *(double *)&v20[4] = v14;
  *(double *)&v20[5] = v15;
  char v21 = v11;
  v17 = -[AVTEngagementLayout initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:](v16, "initWithDefaultCellSize:engagedCellSize:useEngagementSpacing:interItemSpacingProvider:", v11, v20, v14, v15, v7, height);
  v18 = [[AVTZIndexEngagementListCollectionViewLayout alloc] initWithEngagementLayout:v17 minAlphaFactor:v8 environment:v13];

  return v18;
}

double __94__AVTBodyCarouselController_newCollectionViewLayoutForEngagedCellSize_boundsSize_environment___block_invoke(uint64_t a1, double a2)
{
  double v2 = 24.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v2 = -22.0;
  }
  return v2 + (*(double *)(a1 + 32) / -3.0 - v2) * a2;
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4
{
  return [(AVTBodyCarouselController *)self initWithEnvironment:a3 avatarRecord:a4 editorPresentationContext:0];
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 avatarRecord:(id)a4 editorPresentationContext:(unint64_t)a5
{
  return [(AVTBodyCarouselController *)self initWithEnvironment:a3 initialAVTViewLayout:0 avatarRecord:a4 editorPresentationContext:a5];
}

- (AVTBodyCarouselController)initWithEnvironment:(id)a3 initialAVTViewLayout:(id)a4 avatarRecord:(id)a5 editorPresentationContext:(unint64_t)a6
{
  BOOL v10 = (AVTUIEnvironment *)a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AVTBodyCarouselController;
  double v13 = [(AVTBodyCarouselController *)&v33 init];
  if (v13)
  {
    uint64_t v14 = [(AVTUIEnvironment *)v10 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    v13->_environment = v10;
    uint64_t v16 = +[AVTTransitionCoordinator synchronousTransitionCoordinator];
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v16;

    v13->_decelerationRate = *(double *)MEMORY[0x263F1D5C8];
    objc_storeStrong((id *)&v13->_avtViewLayout, a4);
    uint64_t v18 = [(AVTBodyCarouselController *)v13 configurationsForEditorPresentationContext:a6];
    configurations = v13->_configurations;
    v13->_configurations = (NSArray *)v18;

    v20 = [(AVTBodyCarouselController *)v13 configurations];
    uint64_t v21 = [v20 objectAtIndexedSubscript:0];
    displayedConfiguration = v13->_displayedConfiguration;
    v13->_displayedConfiguration = (AVTStickerConfiguration *)v21;

    uint64_t v23 = +[AVTSerialTaskScheduler fifoScheduler];
    scheduler = v13->_scheduler;
    v13->_scheduler = (AVTSerialTaskScheduler *)v23;

    v25 = [[AVTUIStickerGeneratorPool alloc] initWithMaxStickerGeneratorCount:1];
    generatorPool = v13->_generatorPool;
    v13->_generatorPool = v25;

    objc_storeStrong((id *)&v13->_displayedRecord, a5);
    v27 = [AVTUIStickerRenderer alloc];
    v28 = [(AVTBodyCarouselController *)v13 generatorPool];
    v29 = [(AVTBodyCarouselController *)v13 scheduler];
    uint64_t v30 = [(AVTUIStickerRenderer *)v27 initWithAvatarRecord:v12 stickerGeneratorPool:v28 scheduler:v29 imageStore:0];
    renderer = v13->_renderer;
    v13->_renderer = (AVTUIStickerRenderer *)v30;
  }
  return v13;
}

- (id)configurationsForEditorPresentationContext:(unint64_t)a3
{
  v3 = (id *)MEMORY[0x263F296F0];
  if (a3 == 1) {
    v3 = (id *)MEMORY[0x263F296F8];
  }
  id v4 = *v3;
  if (AVTUIShowPrereleaseStickerPack_once())
  {
    uint64_t v5 = AVTPrereleaseStickerPackForStickerPack();

    id v4 = (id)v5;
  }
  v6 = [MEMORY[0x263F296C8] stickerConfigurationsForMemojiInStickerPack:v4];

  return v6;
}

- (UIView)view
{
  if (![(AVTBodyCarouselController *)self isViewLoaded]) {
    [(AVTBodyCarouselController *)self loadView];
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
    id v4 = [(AVTBodyCarouselController *)self collectionView];
    [v4 setDecelerationRate:a3];
  }
}

- (id)configureLayoutIfNeededWithHeight:(double)a3
{
  uint64_t v5 = [(AVTBodyCarouselController *)self avtViewLayout];

  if (v5)
  {
    v6 = [(AVTBodyCarouselController *)self view];
    [v6 bounds];
    double v8 = v7 * 0.85;

    int v9 = [(AVTBodyCarouselController *)self avtViewLayout];
    objc_msgSend(v9, "avatarViewSizeForAvailableContentSize:", v8, a3 * 0.85);
    -[AVTBodyCarouselController setCenterCellSize:](self, "setCenterCellSize:");

    uint64_t v10 = [(AVTBodyCarouselController *)self collectionViewLayout];
    if (!v10) {
      goto LABEL_6;
    }
    id v11 = (void *)v10;
    id v12 = [(AVTBodyCarouselController *)self collectionViewLayout];
    double v13 = [v12 engagementLayout];
    [v13 engagedCellSize];
    double v15 = v14;
    double v17 = v16;
    [(AVTBodyCarouselController *)self centerCellSize];
    double v19 = v18;
    double v21 = v20;

    if (v15 != v19) {
      goto LABEL_6;
    }
    if (v17 == v21)
    {
      uint64_t v5 = 0;
    }
    else
    {
LABEL_6:
      v22 = [(AVTBodyCarouselController *)self view];
      [v22 bounds];
      double v24 = v23;

      v25 = objc_opt_class();
      [(AVTBodyCarouselController *)self centerCellSize];
      double v27 = v26;
      double v29 = v28;
      uint64_t v30 = [(AVTBodyCarouselController *)self environment];
      uint64_t v5 = objc_msgSend(v25, "newCollectionViewLayoutForEngagedCellSize:boundsSize:environment:", v30, v27, v29, v24, a3);

      v31 = [(AVTBodyCarouselController *)self configurations];
      v32 = [(AVTBodyCarouselController *)self displayedConfiguration];
      uint64_t v33 = [v31 indexOfObject:v32];

      v34 = [MEMORY[0x263F088C8] indexPathForItem:v33 inSection:0];
      [v5 setBackIndexPath:v34];

      [(AVTBodyCarouselController *)self setCollectionViewLayout:v5];
      v35 = [(AVTBodyCarouselController *)self collectionView];

      if (v35)
      {
        v36 = [(AVTBodyCarouselController *)self collectionView];
        [v36 setCollectionViewLayout:v5];
      }
    }
  }
  return v5;
}

- (void)buildCollectionViewAndConfigureLayoutIfNeeded
{
  v3 = [(AVTBodyCarouselController *)self view];
  [v3 bounds];
  id v19 = [(AVTBodyCarouselController *)self configureLayoutIfNeededWithHeight:v4];

  uint64_t v5 = [(AVTBodyCarouselController *)self collectionView];

  if (!v5 && v19)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C4E0]);
    double v7 = [(AVTBodyCarouselController *)self view];
    [v7 bounds];
    double v8 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v19);

    int v9 = [AVTCenteringCollectionViewDelegate alloc];
    uint64_t v10 = [(AVTBodyCarouselController *)self environment];
    id v11 = [(AVTCenteringCollectionViewDelegate *)v9 initWithCollectionView:v8 delegate:self environment:v10];
    [(AVTBodyCarouselController *)self setCenteringDelegate:v11];

    id v12 = [(AVTBodyCarouselController *)self centeringDelegate];
    [v8 setDelegate:v12];

    [v8 setDataSource:self];
    [(AVTBodyCarouselController *)self decelerationRate];
    objc_msgSend(v8, "setDecelerationRate:");
    [v8 setAllowsSelection:0];
    uint64_t v13 = objc_opt_class();
    double v14 = +[AVTAvatarListCell reuseIdentifier];
    [v8 registerClass:v13 forCellWithReuseIdentifier:v14];

    uint64_t v15 = objc_opt_class();
    double v16 = +[AVTCollectionViewCell reuseIdentifier];
    [v8 registerClass:v15 forCellWithReuseIdentifier:v16];

    double v17 = [MEMORY[0x263F1C550] clearColor];
    [v8 setBackgroundColor:v17];

    [v8 setShowsHorizontalScrollIndicator:0];
    [v8 setShowsVerticalScrollIndicator:0];
    [v8 setContentInsetAdjustmentBehavior:2];
    [v8 setAutoresizingMask:18];
    double v18 = [(AVTBodyCarouselController *)self view];
    [v18 addSubview:v8];

    [(AVTBodyCarouselController *)self setCollectionView:v8];
  }
}

- (void)loadView
{
  v3 = [AVTNotifyingContainerView alloc];
  double v4 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AVTNotifyingContainerView *)v4 setDelegate:self];
  [(AVTBodyCarouselController *)self setView:v4];
}

- (void)reloadDisplayedSticker
{
  v3 = [(AVTBodyCarouselController *)self renderer];
  double v4 = [(AVTBodyCarouselController *)self displayedConfiguration];
  id v6 = [v3 scheduledStickerResourceProviderForStickerConfiguration:v4 correctClipping:0];

  id v5 = (id)v6[2](v6, &__block_literal_global_1, 0);
}

- (void)scrollToDisplayedConfiguration
{
  id v3 = [(AVTBodyCarouselController *)self displayedConfiguration];
  [(AVTBodyCarouselController *)self scrollToViewForConfiguration:v3 animated:0];
}

- (void)scrollToViewForConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  id v6 = [(AVTBodyCarouselController *)self configurations];
  uint64_t v7 = [v6 indexOfObject:v8];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_5:
  }
    [(AVTBodyCarouselController *)self scrollToViewAtIndex:v7 animated:v4];
}

- (void)scrollToViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v26 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  id v6 = [(AVTBodyCarouselController *)self collectionViewLayout];
  uint64_t v7 = [v26 item];
  id v8 = [(AVTBodyCarouselController *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(AVTBodyCarouselController *)self collectionView];
  [v13 bounds];
  objc_msgSend(v6, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v7, v10, v12, v14, v15);
  double v17 = v16;
  double v19 = v18;

  double v20 = [(AVTBodyCarouselController *)self collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
  double v22 = v21;
  double v24 = v23;

  v25 = [(AVTBodyCarouselController *)self collectionView];
  objc_msgSend(v25, "setContentOffset:animated:", v4, v22, v24);
}

- (id)indexPathForItemClosestToCenter
{
  id v3 = [(AVTBodyCarouselController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(AVTBodyCarouselController *)self collectionView];
  double v9 = +[AVTCenteringCollectionViewHelper indexPathForNearestItemToCenterWithOffset:collectionView:](AVTCenteringCollectionViewHelper, "indexPathForNearestItemToCenterWithOffset:collectionView:", v8, v5, v7);

  return v9;
}

- (id)cellForConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTBodyCarouselController *)self configurations];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"List item not found %@", v4 format];
  }
  double v7 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:0];
  id v8 = [(AVTBodyCarouselController *)self collectionView];
  double v9 = [v8 cellForItemAtIndexPath:v7];

  return v9;
}

- (BOOL)shouldCurrentlyDisplayedConfigurationTransitionToLive
{
  id v3 = [(AVTBodyCarouselController *)self configurations];
  id v4 = [(AVTBodyCarouselController *)self displayedConfiguration];
  uint64_t v5 = [v3 indexOfObject:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v7 = [(AVTBodyCarouselController *)self collectionViewLayout];
  id v8 = [(AVTBodyCarouselController *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(AVTBodyCarouselController *)self collectionView];
  [v13 bounds];
  objc_msgSend(v7, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", v5, v10, v12, v14, v15);
  double v17 = v16;
  double v19 = v18;

  double v20 = [(AVTBodyCarouselController *)self collectionView];
  +[AVTCenteringCollectionViewHelper contentOffsetForCenteringPoint:collectionView:](AVTCenteringCollectionViewHelper, "contentOffsetForCenteringPoint:collectionView:", v20, v17, v19);
  double v22 = v21;

  double v23 = [(AVTBodyCarouselController *)self collectionView];
  [v23 contentOffset];
  BOOL v6 = vabdd_f64(v22, v24) < 1.0;

  return v6;
}

- (void)updateDisplayedConfigurationIfNeeded
{
  id v3 = [(AVTBodyCarouselController *)self indexPathForItemClosestToCenter];
  if (v3)
  {
    id v4 = v3;
    -[AVTBodyCarouselController setDisplayedConfigurationFromIndex:](self, "setDisplayedConfigurationFromIndex:", [v3 item]);
    id v3 = v4;
  }
}

- (void)setDisplayedConfigurationFromIndex:(unint64_t)a3
{
  uint64_t v5 = [(AVTBodyCarouselController *)self configurations];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Can't find configuration for index %ld", a3);
  }
  double v7 = [(AVTBodyCarouselController *)self configurations];
  id v17 = [v7 objectAtIndexedSubscript:a3];

  id v8 = [v17 name];
  double v9 = [(AVTBodyCarouselController *)self displayedConfiguration];
  double v10 = [v9 name];
  char v11 = [v8 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    [(AVTBodyCarouselController *)self setDisplayedConfiguration:v17];
    double v12 = [(AVTBodyCarouselController *)self collectionViewLayout];
    uint64_t v13 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    [v12 setBackIndexPath:v13];

    double v14 = [(AVTBodyCarouselController *)self collectionViewLayout];
    [v14 invalidateLayout];

    double v15 = [(AVTBodyCarouselController *)self logger];
    double v16 = [v17 description];
    [v15 logCarouselChangesCenterItemTo:v16];
  }
}

- (void)updateStickersforVisibleCells
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(AVTBodyCarouselController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AVTBodyCarouselController *)self updateImageForStaticCellForIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setStaticImageOnCell:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVTBodyCarouselController *)self configurations];
  long long v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  [v6 setConfiguration:v9];
  long long v10 = [(AVTBodyCarouselController *)self displayedRecord];
  [v6 setAvatar:v10];

  long long v11 = [(AVTBodyCarouselController *)self renderer];
  long long v12 = [v11 scheduledStickerResourceProviderForStickerConfiguration:v9 correctClipping:0];

  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__AVTBodyCarouselController_setStaticImageOnCell_forIndexPath___block_invoke;
  v16[3] = &unk_263FF0580;
  id v13 = v6;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  double v19 = &v20;
  id v15 = (id)((uint64_t (**)(void, void *, void))v12)[2](v12, v16, 0);
  *((unsigned char *)v21 + 24) = 1;

  _Block_object_dispose(&v20, 8);
}

void __63__AVTBodyCarouselController_setStaticImageOnCell_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) configuration];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v7 image];
    [v5 setImage:v6 animated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  }
}

- (void)updateImageForStaticCellForIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = [(AVTBodyCarouselController *)self collectionView];
  uint64_t v5 = [v4 cellForItemAtIndexPath:v7];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(AVTBodyCarouselController *)self setStaticImageOnCell:v5 forIndexPath:v7];
  }
  else
  {
    id v6 = [(AVTBodyCarouselController *)self logger];
    [v6 logErrorUpdatingBodyCarouselVisibleCellAtIndexPath:v7];
  }
}

- (void)transitionCurrentDisplayedConfigurationAnimated:(BOOL)a3
{
  uint64_t v5 = [(AVTBodyCarouselController *)self configurations];
  id v6 = [(AVTBodyCarouselController *)self displayedConfiguration];
  uint64_t v7 = [v5 indexOfObject:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [MEMORY[0x263F088C8] indexPathForItem:v7 inSection:0];
    long long v9 = [(AVTBodyCarouselController *)self collectionView];
    long long v10 = [v9 cellForItemAtIndexPath:v8];

    if ([(AVTBodyCarouselController *)self shouldCurrentlyDisplayedConfigurationTransitionToLive])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __77__AVTBodyCarouselController_transitionCurrentDisplayedConfigurationAnimated___block_invoke;
      v11[3] = &unk_263FF05A8;
      v11[4] = self;
      id v12 = v8;
      BOOL v13 = a3;
      [v10 downcastWithCellHandler:0 listCellHandler:v11];
    }
  }
}

void __77__AVTBodyCarouselController_transitionCurrentDisplayedConfigurationAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(a1 + 32) liveCell];
  id v4 = v10;
  if (v3 != v10)
  {
    uint64_t v5 = [*(id *)(a1 + 32) avtViewSession];
    int v6 = [v5 isActive];

    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    id v4 = [v7 avtViewSession];
    [v7 transitionCell:v10 indexPath:v8 toStartFocusingAnimated:v9 session:v4 completionHandler:0];
  }

LABEL_5:
}

- (void)layoutDidChangeWhileMoving:(BOOL)a3 offset:(CGPoint)a4
{
  if (a3)
  {
    -[AVTBodyCarouselController transitionCenterCellIfPresentToStopFocusingAnimated:](self, "transitionCenterCellIfPresentToStopFocusingAnimated:", 1, a4.x, a4.y);
    [(AVTBodyCarouselController *)self updateDisplayedConfigurationIfNeeded];
  }
  else
  {
    [(AVTBodyCarouselController *)self scrollToDisplayedConfiguration];
  }
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  if ([(AVTBodyCarouselController *)self isViewLoaded]
    && ![(AVTBodyCarouselController *)self isAnimatingExpansion])
  {
    [(AVTBodyCarouselController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
  }
}

- (void)prepareViewWithLayout:(id)a3
{
  [(AVTBodyCarouselController *)self setAvtViewLayout:a3];
  [(AVTBodyCarouselController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
}

- (void)useAVTViewFromSession:(id)a3
{
  [(AVTBodyCarouselController *)self setAvtViewSession:a3];
  [(AVTBodyCarouselController *)self buildCollectionViewAndConfigureLayoutIfNeeded];
  if ([(AVTBodyCarouselController *)self shouldCurrentlyDisplayedConfigurationTransitionToLive])
  {
    [(AVTBodyCarouselController *)self transitionCenterCellIfPresentToStartFocusing];
  }
}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(AVTBodyCarouselController *)self transitionCoordinator];
  [v5 cancelAllTransitions];

  [(AVTBodyCarouselController *)self transitionCenterCellIfPresentToStopFocusingAnimated:0];
  [(AVTBodyCarouselController *)self setAvtViewSession:0];
  int v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    int v6 = v7;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(AVTBodyCarouselController *)self configurations];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[AVTAvatarListCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [(AVTBodyCarouselController *)self centerCellSize];
  objc_msgSend(v9, "setAspectRatio:");
  id v10 = v9;

  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AVTBodyCarouselController *)self setStaticImageOnCell:v7 forIndexPath:v8];
  }
  uint64_t v9 = [v8 item];
  id v10 = [(AVTBodyCarouselController *)self configurations];
  long long v11 = [(AVTBodyCarouselController *)self displayedConfiguration];
  uint64_t v12 = [v10 indexOfObject:v11];

  if (v9 == v12)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __79__AVTBodyCarouselController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v13[3] = &unk_263FF05D0;
    v13[4] = self;
    id v14 = v8;
    [v7 downcastWithCellHandler:0 listCellHandler:v13];
  }
}

uint64_t __79__AVTBodyCarouselController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transitionCenterCellToStartFocusing:a2 indexPath:*(void *)(a1 + 40)];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__AVTBodyCarouselController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v5[3] = &unk_263FF05F8;
  v5[4] = self;
  objc_msgSend(a4, "downcastWithCellHandler:listCellHandler:", 0, v5, a5);
}

void __84__AVTBodyCarouselController_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 transitionCoordinator];
  [v4 cancelTransitionsMatchingModel:v3];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "avtui_isMoving");
  [v4 contentOffset];
  double v7 = v6;
  double v9 = v8;

  -[AVTBodyCarouselController layoutDidChangeWhileMoving:offset:](self, "layoutDidChangeWhileMoving:offset:", v5, v7, v9);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(AVTBodyCarouselController *)self transitionCurrentDisplayedConfigurationAnimated:0];
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
  id v3 = [(AVTBodyCarouselController *)self configurations];
  id v4 = [(AVTBodyCarouselController *)self displayedConfiguration];
  uint64_t v5 = [v3 indexOfObject:v4];

  double v6 = [(AVTBodyCarouselController *)self displayedConfiguration];
  double v7 = [(AVTBodyCarouselController *)self cellForConfiguration:v6];

  double v8 = [MEMORY[0x263F088C8] indexPathForItem:v5 inSection:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__AVTBodyCarouselController_transitionCenterCellIfPresentToStartFocusing__block_invoke;
  v10[3] = &unk_263FF05D0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v7 downcastWithCellHandler:0 listCellHandler:v10];
}

uint64_t __73__AVTBodyCarouselController_transitionCenterCellIfPresentToStartFocusing__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transitionCenterCellToStartFocusing:a2 indexPath:*(void *)(a1 + 40)];
}

- (void)transitionCenterCellIfPresentToStopFocusingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AVTBodyCarouselController *)self liveCell];

  if (v5)
  {
    id v6 = [(AVTBodyCarouselController *)self liveCell];
    [(AVTBodyCarouselController *)self transitionCell:v6 toStopFocusingAnimated:v3 completionHandler:0];
  }
}

- (void)transitionCenterCellToStartFocusing:(id)a3 indexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    double v7 = [(AVTBodyCarouselController *)self liveCell];

    if (!v7)
    {
      double v8 = [(AVTBodyCarouselController *)self collectionView];
      char v9 = objc_msgSend(v8, "avtui_isMoving");

      if ((v9 & 1) == 0)
      {
        id v10 = [(AVTBodyCarouselController *)self avtViewSession];
        if ([v10 isActive]) {
          [(AVTBodyCarouselController *)self transitionCell:v11 indexPath:v6 toStartFocusingAnimated:0 session:v10 completionHandler:0];
        }
      }
    }
  }
}

- (void)transitionCell:(id)a3 indexPath:(id)a4 toStartFocusingAnimated:(BOOL)a5 session:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  [(AVTBodyCarouselController *)self setLiveCell:v11];
  id v15 = [(AVTBodyCarouselController *)self transitionCoordinator];
  [v15 cancelTransitionsMatchingModel:v11];

  uint64_t v28 = 0;
  double v29 = (id *)&v28;
  uint64_t v30 = 0x3042000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  double v16 = [AVTAvatarCellToLiveTransition alloc];
  uint64_t v24 = MEMORY[0x263EF8330];
  id v17 = v11;
  id v25 = v17;
  double v27 = &v28;
  id v18 = v13;
  id v26 = v18;
  double v19 = [(AVTBodyCarouselController *)self logger];
  uint64_t v20 = [(AVTAvatarCellToLiveTransition *)v16 initWithModel:v17 animated:0 setupHandler:&v24 completionHandler:v14 logger:v19];

  objc_storeWeak(v29 + 5, v20);
  double v21 = [(AVTBodyCarouselController *)self logger];
  uint64_t v22 = [(AVTTransition *)v20 description];
  [v21 logCarouselAddsTransitionToCoordinator:v22];

  char v23 = [(AVTBodyCarouselController *)self transitionCoordinator];
  [v23 addTransition:v20];

  _Block_object_dispose(&v28, 8);
  objc_destroyWeak(&v33);
}

void __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];
  uint64_t v5 = [*(id *)(a1 + 40) description];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  double v7 = [WeakRetained description];
  [v4 logCarouselCellStartUsingLiveView:v5 associatedTransition:v7];

  [*(id *)(a1 + 40) beginUsingAVTViewFromSession:*(void *)(a1 + 48)];
  double v8 = [*(id *)(a1 + 48) avtViewUpdater];
  char v9 = [*(id *)(a1 + 40) configuration];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2;
  v11[3] = &unk_263FF0620;
  id v12 = v3;
  id v10 = v3;
  [v8 setStickerConfiguration:v9 completionHandler:v11];
}

uint64_t __104__AVTBodyCarouselController_transitionCell_indexPath_toStartFocusingAnimated_session_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transitionCell:(id)a3 toStopFocusingAnimated:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(AVTBodyCarouselController *)self setLiveCell:0];
  char v9 = [(AVTBodyCarouselController *)self logger];
  id v10 = [(AVTBodyCarouselController *)self displayedRecord];
  id v11 = [v10 description];
  id v12 = [v7 description];
  [v9 logCarouselStopsFocusingOnCenterItem:v11 withCell:v12];

  id v13 = [(AVTBodyCarouselController *)self transitionCoordinator];
  [v13 cancelTransitionsMatchingModel:v7];

  id v14 = [v7 avtView];

  if (v14)
  {
    uint64_t v25 = 0;
    id v26 = (id *)&v25;
    uint64_t v27 = 0x3042000000;
    uint64_t v28 = __Block_byref_object_copy__2;
    double v29 = __Block_byref_object_dispose__2;
    id v30 = 0;
    id v15 = [AVTAvatarCellToStaticTransition alloc];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v24 = &v25;
    id v22 = v7;
    id v23 = v8;
    double v16 = [(AVTBodyCarouselController *)self logger];
    id v17 = [(AVTAvatarCellToStaticTransition *)v15 initWithModel:v22 animated:0 completionHandler:&v21 logger:v16];

    objc_storeWeak(v26 + 5, v17);
    id v18 = [(AVTBodyCarouselController *)self logger];
    double v19 = [(AVTTransition *)v17 description];
    [v18 logCarouselAddsTransitionToCoordinator:v19];

    uint64_t v20 = [(AVTBodyCarouselController *)self transitionCoordinator];
    [v20 addTransition:v17];

    _Block_object_dispose(&v25, 8);
    objc_destroyWeak(&v30);
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

uint64_t __85__AVTBodyCarouselController_transitionCell_toStopFocusingAnimated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    || (id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)),
        uint64_t v4 = [v3 state],
        v3,
        v4 == 2))
  {
    uint64_t v5 = [*(id *)(a1 + 32) logger];
    id v6 = [*(id *)(a1 + 40) description];
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

- (AVTStickerConfiguration)displayedConfiguration
{
  return self->_displayedConfiguration;
}

- (void)setDisplayedConfiguration:(id)a3
{
}

- (BOOL)isAnimatingExpansion
{
  return self->_isAnimatingExpansion;
}

- (void)setIsAnimatingExpansion:(BOOL)a3
{
  self->_isAnimatingExpansion = a3;
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

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (AVTUIStickerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (AVTSerialTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
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

- (CGSize)centerCellSize
{
  double width = self->_centerCellSize.width;
  double height = self->_centerCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCenterCellSize:(CGSize)a3
{
  self->_centerCellSize = a3;
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_liveCell, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_centeringDelegate, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_displayedConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end