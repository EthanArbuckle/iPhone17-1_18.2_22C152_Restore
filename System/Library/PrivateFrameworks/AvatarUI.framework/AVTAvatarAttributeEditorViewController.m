@interface AVTAvatarAttributeEditorViewController
+ (id)attributeRowIdentifier;
+ (id)colorRowIdentifier;
- (AVTAttributeEditorAnimationCoordinator)animationCoordinator;
- (AVTAvatarAttributeEditorDataSource)dataSource;
- (AVTAvatarAttributeEditorLayout)currentLayout;
- (AVTAvatarAttributeEditorModelManager)modelManager;
- (AVTAvatarAttributeEditorViewController)init;
- (AVTAvatarAttributeEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5 isCreating:(BOOL)a6;
- (AVTAvatarAttributeEditorViewControllerDelegate)delegate;
- (AVTAvatarEditorColorsState)colorsState;
- (AVTAvatarRecord)avatarRecord;
- (AVTBodyCarouselController)bodyEditorHeaderViewController;
- (AVTCollapsibleHeaderController)collapsibleHeaderController;
- (AVTGroupDial)groupDial;
- (AVTGroupListCollectionView)groupListView;
- (AVTImageTransitioningContainerView)transitioningContainer;
- (AVTMemoji)avatar;
- (AVTShadowView)shadowView;
- (AVTTaskScheduler)headerPreviewScheduler;
- (AVTTaskScheduler)imageProviderScheduler;
- (AVTTransition)currentTransition;
- (AVTUIEnvironment)environment;
- (AVTViewCarouselLayout)avtViewLayout;
- (AVTViewSession)avtViewSession;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (AVTViewThrottler)avtViewThrottler;
- (BOOL)allowFacetracking;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionViewIsPerformingBatchUpdates;
- (BOOL)disableAvatarSnapshotting;
- (BOOL)hasMadeAnySelection;
- (BOOL)isAnimatingHighlight;
- (BOOL)isCreating;
- (BOOL)shouldHideUserInfoView;
- (CALayer)verticleRule;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDate)lastPosedAvatarImageRenderingTime;
- (UICollectionView)attributesCollectionView;
- (UIEdgeInsets)adjustedSafeAreaInsets;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)alphaAssetsLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)attributesCollectionViewMaskingView;
- (UIView)attributesContainerView;
- (UIView)groupDialContainerView;
- (UIView)headerContainerView;
- (UIView)headerMaskingView;
- (UIView)sideGroupContainerView;
- (UIView)verticleRuleContainer;
- (_AVTAvatarRecordImageProvider)headerPreviewImageRenderer;
- (double)maxGroupLabelWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createAlphaAssetsLabel;
- (id)liveView;
- (id)pendingCollectionViewReloadDataBlock;
- (id)pendingUnhighlightBlock;
- (id)postSessionDidBecomeActiveHandler;
- (id)presetSectionItemForIndexPath:(id)a3;
- (id)selectedItemInSection:(id)a3;
- (id)visibleLayout;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)editorPresentationContext;
- (unint64_t)previewModeType;
- (void)applyLayout:(id)a3;
- (void)applyLayout:(id)a3 layoutAvatarView:(BOOL)a4 recalculateOffsetIfNeeded:(BOOL)a5;
- (void)applyUserInfoViewLayout;
- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4;
- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3;
- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3;
- (void)collapsibleHeaderController:(id)a3 didUpdateHeaderToHeight:(double)a4;
- (void)collapsibleHeaderController:(id)a3 isUpdatingHeaderWithIncrementalHeight:(double)a4;
- (void)collapsibleHeaderController:(id)a3 willUpdateHeaderToHeight:(double)a4;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureAVTViewFromSession:(id)a3;
- (void)configurePPTMemoji:(id)a3;
- (void)configureThrottlerForAVTView:(id)a3;
- (void)configureUserInfoLabel;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createVerticleRuleIfNeeded;
- (void)didFinishEditing;
- (void)didTapAvatarView:(id)a3;
- (void)faceTrackingManager:(id)a3 didUpdateUserInfoWithSize:(CGSize)a4;
- (void)groupPicker:(id)a3 didDeselectGroupAtIndex:(int64_t)a4;
- (void)groupPicker:(id)a3 didSelectGroupAtIndex:(int64_t)a4 tapped:(BOOL)a5;
- (void)loadView;
- (void)notifyingContainerViewDidChangeSize:(CGSize)a3;
- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4;
- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4;
- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4;
- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4 reloadSections:(BOOL)a5;
- (void)reloadCollectionViewDataWithCompletion:(id)a3;
- (void)resetAllSectionControllersStateToDefault;
- (void)sectionHeaderView:(id)a3 didSelectItem:(id)a4 forPicker:(id)a5 sender:(id)a6;
- (void)selectCategory:(id)a3 withCompletionDelay:(int64_t)a4 completionHandler:(id)a5;
- (void)setAllowFacetracking:(BOOL)a3;
- (void)setAlphaAssetsLabel:(id)a3;
- (void)setAnimationCoordinator:(id)a3;
- (void)setAttributesCollectionView:(id)a3;
- (void)setAttributesCollectionViewMaskingView:(id)a3;
- (void)setAttributesContainerView:(id)a3;
- (void)setAvtViewLayout:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setAvtViewThrottler:(id)a3;
- (void)setBodyEditorHeaderViewController:(id)a3;
- (void)setCollapsibleHeaderController:(id)a3;
- (void)setCollectionViewIsPerformingBatchUpdates:(BOOL)a3;
- (void)setColorsState:(id)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setCurrentTransition:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAvatarSnapshotting:(BOOL)a3;
- (void)setEditorPresentationContext:(unint64_t)a3;
- (void)setGroupDial:(id)a3;
- (void)setGroupDialContainerView:(id)a3;
- (void)setGroupListView:(id)a3;
- (void)setHasMadeAnySelection:(BOOL)a3;
- (void)setHeaderContainerView:(id)a3;
- (void)setHeaderMaskingView:(id)a3;
- (void)setHeaderPreviewImageRenderer:(id)a3;
- (void)setIsAnimatingHighlight:(BOOL)a3;
- (void)setLastPosedAvatarImageRenderingTime:(id)a3;
- (void)setPendingCollectionViewReloadDataBlock:(id)a3;
- (void)setPendingUnhighlightBlock:(id)a3;
- (void)setPostSessionDidBecomeActiveHandler:(id)a3;
- (void)setPreviewModeType:(unint64_t)a3;
- (void)setShadowView:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setSideGroupContainerView:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTransitioningContainer:(id)a3;
- (void)setTransitioningContainerFrame;
- (void)setUpHeaderView;
- (void)setVerticleRule:(id)a3;
- (void)setVerticleRuleContainer:(id)a3;
- (void)setupCollapsibleHeaderIfNeededForLayout:(id)a3 withSession:(id)a4;
- (void)setupGroupSelectorIfNeeded;
- (void)setupImageView;
- (void)setupPreview:(id)a3;
- (void)setupTapGestureForView:(id)a3;
- (void)tearDownCollapsibleHeaderIfNeeded;
- (void)tearDownThrottler;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionLiveViewToFront;
- (void)transitionStaticViewToFront;
- (void)transitionToLiveViewAnimated:(BOOL)a3;
- (void)updateAlphaAssetsLabelFrameIfNeeded;
- (void)updateBodyEditorHeaderIfNeeded;
- (void)updateCollapsibleHeaderHeightConstraintsAnimated:(BOOL)a3;
- (void)updateForChangedSelectionIfNeeded;
- (void)updateForSelectionOfItem:(id)a3 controller:(id)a4 reloadSections:(BOOL)a5;
- (void)updateForSelectionOfItem:(id)a3 inSection:(id)a4 senderRect:(CGRect)a5 reloadSections:(BOOL)a6;
- (void)updateForSelectionOfSupplementalItem:(id)a3 senderRect:(CGRect)a4;
- (void)updateHeaderDependentLayoutWithHeaderFrame:(CGRect)a3 fittingSize:(CGSize)a4;
- (void)updateHeaderViewForPreviewModeType:(unint64_t)a3;
- (void)updateImageViewWithPosedAvatarRecordForcingRender:(BOOL)a3 completionHandler:(id)a4;
- (void)updateLayoutAttributes;
- (void)updateLayoutForAttributesCollectionMaskingView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVTAvatarAttributeEditorViewController

+ (id)colorRowIdentifier
{
  return @"AVTAttributeCollectionViewCell_Color";
}

+ (id)attributeRowIdentifier
{
  return @"AVTAttributeValueCollectionViewCell_Attribute";
}

- (AVTAvatarAttributeEditorViewController)init
{
  v3 = +[AVTUIEnvironment defaultEnvironment];
  v4 = [AVTViewSessionProvider alloc];
  +[AVTViewSessionProvider backingSizeForEnvironment:v3];
  double v6 = v5;
  double v8 = v7;
  v9 = +[AVTViewSessionProvider creatorForAVTRecordView];
  v10 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v4, "initWithAVTViewBackingSize:viewCreator:environment:", v9, v3, v6, v8);

  id v11 = objc_alloc_init(MEMORY[0x263F29728]);
  v12 = [(AVTAvatarAttributeEditorViewController *)self initWithAvatarRecord:v11 avtViewSessionProvider:v10 environment:v3 isCreating:1];

  return v12;
}

- (AVTAvatarAttributeEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5 isCreating:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v55.receiver = self;
  v55.super_class = (Class)AVTAvatarAttributeEditorViewController;
  v13 = [(AVTAvatarAttributeEditorViewController *)&v55 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    id v53 = v11;
    objc_storeStrong((id *)&v13->_environment, a5);
    objc_storeStrong((id *)&v14->_avtViewSessionProvider, a4);
    v15 = [v12 coreEnvironment];
    uint64_t v16 = +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:v15];
    imageProviderScheduler = v14->_imageProviderScheduler;
    v14->_imageProviderScheduler = (AVTTaskScheduler *)v16;

    id v18 = v10;
    v54 = [[AVTPresetImageProvider alloc] initWithRenderingScheduler:v14->_imageProviderScheduler environment:v12];
    v19 = [v12 deviceResourceManager];
    [v19 registerConsumer:v54];

    v49 = objc_alloc_init(AVTColorLayerProvider);
    v20 = [AVTPresetResourceLoader alloc];
    uint64_t v21 = [(AVTPresetResourceLoader *)v20 initWithEnvironment:v12 renderingScheduler:v14->_imageProviderScheduler callbackQueue:MEMORY[0x263EF83A0]];
    v22 = [AVTAvatarAttributeEditorPreloader alloc];
    v23 = [v12 logger];
    v52 = (void *)v21;
    v24 = [(AVTAvatarAttributeEditorPreloader *)v22 initWithResourceLoader:v21 logger:v23];

    v25 = [[AVTUIStickerGeneratorPool alloc] initWithMaxStickerGeneratorCount:2];
    v26 = [AVTClippableImageStore alloc];
    v27 = [v12 coreEnvironment];
    v28 = [v12 imageCacheStoreLocation];
    uint64_t v29 = [(AVTImageStore *)v26 initWithEnvironment:v27 validateImages:0 location:v28];

    v30 = [AVTUIStickerRenderer alloc];
    [v12 editorThumbnailAvatar];
    v32 = BOOL v31 = a6;
    v50 = (void *)v29;
    v51 = v25;
    v33 = [(AVTUIStickerRenderer *)v30 initWithAvatarRecord:v18 avatar:v32 stickerGeneratorPool:v25 scheduler:v14->_imageProviderScheduler imageStore:v29 environment:v12];

    v34 = [AVTAvatarAttributeEditorModelManager alloc];
    v35 = [v12 editorCoreModel];
    id v10 = v18;
    uint64_t v36 = [(AVTAvatarAttributeEditorModelManager *)v34 initWithAvatarRecord:v18 coreModel:v35 imageProvider:v54 colorLayerProvider:v49 preloader:v24 environment:v12 stickerRenderer:v33];
    modelManager = v14->_modelManager;
    v14->_modelManager = (AVTAvatarAttributeEditorModelManager *)v36;

    if (v31)
    {
      v38 = 0;
    }
    else
    {
      v38 = AVTUIEditorMostRecentGroupName();
    }
    v39 = [AVTAvatarAttributeEditorDataSource alloc];
    uint64_t v40 = [(AVTAvatarAttributeEditorDataSource *)v39 initWithCategories:MEMORY[0x263EFFA68] currentCategoryIdentifier:v38 renderingScheduler:v14->_imageProviderScheduler environment:v12];
    dataSource = v14->_dataSource;
    v14->_dataSource = (AVTAvatarAttributeEditorDataSource *)v40;

    [(AVTAvatarAttributeEditorModelManager *)v14->_modelManager setDelegate:v14->_dataSource];
    v42 = [(AVTAvatarAttributeEditorModelManager *)v14->_modelManager buildUIModel];
    [(AVTAvatarAttributeEditorDataSource *)v14->_dataSource reloadWithCategories:v42 currentCategoryIndex:+[AVTAvatarAttributeEditorDataSource indexForCurrentCategoryGivenPreferredIdentifier:v38 categories:v42]];
    v14->_isCreating = v31;
    v14->_allowFacetracking = AVTUIIsFacetrackingSupported();
    v43 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v12];
    headerPreviewImageRenderer = v14->_headerPreviewImageRenderer;
    v14->_headerPreviewImageRenderer = v43;

    if (!v14->_allowFacetracking)
    {
      v45 = [v12 coreEnvironment];
      uint64_t v46 = +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:v45];
      headerPreviewScheduler = v14->_headerPreviewScheduler;
      v14->_headerPreviewScheduler = (AVTTaskScheduler *)v46;
    }
    id v11 = v53;
  }

  return v14;
}

- (AVTAvatarRecord)avatarRecord
{
  v2 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  v3 = [v2 avatarRecord];

  return (AVTAvatarRecord *)v3;
}

- (AVTMemoji)avatar
{
  v2 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  v3 = [v2 avatar];

  return (AVTMemoji *)v3;
}

- (void)loadView
{
  v3 = [AVTNotifyingContainerView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  double v5 = -[AVTNotifyingContainerView initWithFrame:](v3, "initWithFrame:");

  [(AVTNotifyingContainerView *)v5 setDelegate:self];
  [(AVTAvatarAttributeEditorViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)AVTAvatarAttributeEditorViewController;
  [(AVTAvatarAttributeEditorViewController *)&v48 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  v4 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  double v6 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v6 frame];
  double v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  attributesContainerView = self->_attributesContainerView;
  self->_attributesContainerView = v7;

  [(UIView *)self->_attributesContainerView setAutoresizingMask:18];
  v9 = +[AVTUIColorRepository editorBackgroundColor];
  [(UIView *)self->_attributesContainerView setBackgroundColor:v9];

  id v10 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v10 addSubview:self->_attributesContainerView];

  id v11 = objc_alloc(MEMORY[0x263F1CB60]);
  double v12 = *MEMORY[0x263F001A8];
  double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v16 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
  sideGroupContainerView = self->_sideGroupContainerView;
  self->_sideGroupContainerView = v16;

  id v18 = +[AVTUIColorRepository groupListBackgroundColor];
  [(UIView *)self->_sideGroupContainerView setBackgroundColor:v18];

  [(UIView *)self->_sideGroupContainerView setClipsToBounds:1];
  v19 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v19 addSubview:self->_sideGroupContainerView];

  v20 = objc_alloc_init(AVTAvatarAttributeEditorFlowLayout);
  [(UICollectionViewFlowLayout *)v20 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v20 setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)v20 setMinimumInteritemSpacing:0.0];
  uint64_t v21 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x263F1C4E0]), "initWithFrame:collectionViewLayout:", v20, v12, v13, v14, v15);
  attributesCollectionView = self->_attributesCollectionView;
  self->_attributesCollectionView = v21;

  [(UICollectionView *)self->_attributesCollectionView setDataSource:self];
  [(UICollectionView *)self->_attributesCollectionView setPrefetchDataSource:self];
  [(UICollectionView *)self->_attributesCollectionView setDelegate:self];
  v23 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_attributesCollectionView setBackgroundColor:v23];

  v24 = self->_attributesCollectionView;
  uint64_t v25 = objc_opt_class();
  v26 = +[AVTAttributeCollectionViewCell cellIdentifier];
  [(UICollectionView *)v24 registerClass:v25 forCellWithReuseIdentifier:v26];

  v27 = self->_attributesCollectionView;
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = +[AVTAttributeLabeledCollectionViewCell cellIdentifier];
  [(UICollectionView *)v27 registerClass:v28 forCellWithReuseIdentifier:v29];

  v30 = self->_attributesCollectionView;
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = *MEMORY[0x263F1D118];
  v33 = +[AVTAttributeSectionSeparator reuseIdentifier];
  [(UICollectionView *)v30 registerClass:v31 forSupplementaryViewOfKind:v32 withReuseIdentifier:v33];

  v34 = self->_attributesCollectionView;
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = *MEMORY[0x263F1D120];
  v37 = +[AVTAttributeEditorSectionHeaderView reuseIdentifier];
  [(UICollectionView *)v34 registerClass:v35 forSupplementaryViewOfKind:v36 withReuseIdentifier:v37];

  [(UIView *)self->_attributesContainerView addSubview:self->_attributesCollectionView];
  v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v12, v13, v14, v15);
  headerMaskingView = self->_headerMaskingView;
  self->_headerMaskingView = v38;

  uint64_t v40 = [(UIView *)self->_attributesContainerView backgroundColor];
  [(UIView *)self->_headerMaskingView setBackgroundColor:v40];

  v41 = -[AVTShadowView initWithFrame:]([AVTShadowView alloc], "initWithFrame:", v12, v13, v14, v15);
  shadowView = self->_shadowView;
  self->_shadowView = v41;

  [(UIView *)self->_headerMaskingView addSubview:self->_shadowView];
  [(UIView *)self->_attributesContainerView addSubview:self->_headerMaskingView];
  v43 = [(AVTAvatarAttributeEditorViewController *)self navigationItem];
  [v43 setLargeTitleDisplayMode:2];

  v44 = [(AVTAvatarAttributeEditorViewController *)self navigationItem];
  [v44 _setBackgroundHidden:1];

  [(AVTAvatarAttributeEditorViewController *)self setUpHeaderView];
  if (AVTUIShowAssetsWarning_once())
  {
    v45 = [(AVTAvatarAttributeEditorViewController *)self createAlphaAssetsLabel];
    [(AVTAvatarAttributeEditorViewController *)self setAlphaAssetsLabel:v45];

    uint64_t v46 = [(AVTAvatarAttributeEditorViewController *)self view];
    v47 = [(AVTAvatarAttributeEditorViewController *)self alphaAssetsLabel];
    [v46 addSubview:v47];
  }
}

- (void)setUpHeaderView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  headerContainerView = self->_headerContainerView;
  self->_headerContainerView = v8;

  id v10 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v10 addSubview:self->_headerContainerView];

  id v11 = -[AVTImageTransitioningContainerView initWithFrame:layoutMode:]([AVTImageTransitioningContainerView alloc], "initWithFrame:layoutMode:", 1, v4, v5, v6, v7);
  transitioningContainer = self->_transitioningContainer;
  self->_transitioningContainer = v11;

  [(AVTImageTransitioningContainerView *)self->_transitioningContainer setAutoresizingMask:18];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __57__AVTAvatarAttributeEditorViewController_setUpHeaderView__block_invoke;
  v25[3] = &unk_263FF03D8;
  v25[4] = self;
  [(AVTAvatarAttributeEditorViewController *)self updateImageViewWithPosedAvatarRecordForcingRender:0 completionHandler:v25];
  double v13 = [AVTBodyCarouselController alloc];
  double v14 = [(AVTAvatarAttributeEditorViewController *)self environment];
  double v15 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  uint64_t v16 = [v15 avatarRecord];
  v17 = [(AVTBodyCarouselController *)v13 initWithEnvironment:v14 avatarRecord:v16 editorPresentationContext:[(AVTAvatarAttributeEditorViewController *)self editorPresentationContext]];
  bodyEditorHeaderViewController = self->_bodyEditorHeaderViewController;
  self->_bodyEditorHeaderViewController = v17;

  v19 = [(AVTBodyCarouselController *)self->_bodyEditorHeaderViewController view];
  [v19 setAutoresizingMask:18];

  v20 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
  [v20 reloadDisplayedSticker];

  uint64_t v21 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
  [v21 avtViewBackingSize];
  v22 = +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:"adaptativeLayoutWithAVTViewAspectRatio:"];
  [(AVTAvatarAttributeEditorViewController *)self setAvtViewLayout:v22];

  v23 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
  v24 = [(AVTAvatarAttributeEditorViewController *)self avtViewLayout];
  [v23 prepareViewWithLayout:v24];

  [(UIView *)self->_headerContainerView addSubview:self->_transitioningContainer];
}

uint64_t __57__AVTAvatarAttributeEditorViewController_setUpHeaderView__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allowFacetracking];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setHeaderPreviewImageRenderer:0];
  }
  return result;
}

- (void)setTransitioningContainerFrame
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self avtViewLayout];

  id v30 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
  [v30 bounds];
  double v8 = v7;
  if (v3)
  {
    v9 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v9 bounds];
    double v11 = v10 * 0.85;

    double v12 = [(AVTAvatarAttributeEditorViewController *)self avtViewLayout];
    objc_msgSend(v12, "avatarViewSizeForAvailableContentSize:", v8 * 0.85, v11);
    double v14 = v13;

    double v15 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v15 bounds];
    double v17 = v16;
    id v18 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v18 bounds];
    double v20 = v17 + (v19 - v14) * 0.5;

    id v30 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v30 bounds];
    double v22 = v21;
    v23 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v23 bounds];
    double v25 = v24;
    v26 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
    objc_msgSend(v26, "setFrame:", v22, v20, v25, v14);
  }
  else
  {
    double v27 = v4;
    double v28 = v5;
    double v29 = v6;
    v23 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
    objc_msgSend(v23, "setFrame:", v27, v28, v8, v29);
  }
}

- (void)didFinishEditing
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self headerPreviewScheduler];
  [v3 cancelAllTasks];

  id v4 = [(AVTAvatarAttributeEditorViewController *)self imageProviderScheduler];
  [v4 cancelAllTasks];
}

- (void)setupGroupSelectorIfNeeded
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  id v29 = [v3 groupPickerItemsForCategories];

  id v4 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  if ([v4 showSideGroupPicker])
  {
  }
  else
  {
    groupDialContainerView = self->_groupDialContainerView;

    if (!groupDialContainerView)
    {
      double v6 = +[AVTUIFontRepository groupDialBoldLabelFont];
      [v6 _scaledValueForValue:18.0];
      if (v14 <= 30.0) {
        double v15 = v14;
      }
      else {
        double v15 = 30.0;
      }
      id v16 = objc_alloc(MEMORY[0x263F1CB60]);
      [v6 ascender];
      double v18 = v17;
      [v6 descender];
      double v20 = (UIView *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, 50.0, v18 - v19 + v15 * 2.0);
      double v21 = self->_groupDialContainerView;
      self->_groupDialContainerView = v20;

      double v22 = [(AVTAvatarAttributeEditorViewController *)self view];
      [v22 addSubview:self->_groupDialContainerView];

      v23 = [AVTGroupDial alloc];
      double v24 = [(AVTAvatarAttributeEditorViewController *)self environment];
      double v25 = [(AVTGroupDial *)v23 initWithGroupItems:v29 environment:v24];
      groupDial = self->_groupDial;
      self->_groupDial = v25;

      [(AVTGroupDial *)self->_groupDial setDelegate:self];
      double v27 = self->_groupDial;
      double v28 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
      -[AVTGroupDial setSelectedGroupIndex:animated:](v27, "setSelectedGroupIndex:animated:", [v28 currentCategoryIndex], 0);

      [(UIView *)self->_groupDialContainerView bounds];
      -[AVTGroupDial setFrame:](self->_groupDial, "setFrame:");
      [(AVTGroupDial *)self->_groupDial setAutoresizingMask:18];
      [(AVTGroupDial *)self->_groupDial setContentPadding:v15];
      [(UIView *)self->_groupDialContainerView addSubview:self->_groupDial];
      goto LABEL_11;
    }
  }
  double v6 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  if (![v6 showSideGroupPicker])
  {
LABEL_11:

    goto LABEL_12;
  }
  groupListView = self->_groupListView;

  if (!groupListView)
  {
    double v8 = [AVTGroupListCollectionView alloc];
    v9 = [(AVTAvatarAttributeEditorViewController *)self environment];
    double v10 = [(AVTGroupListCollectionView *)v8 initWithGroupItems:v29 environment:v9];
    double v11 = self->_groupListView;
    self->_groupListView = v10;

    double v12 = self->_groupListView;
    double v13 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    -[AVTGroupListCollectionView setSelectedGroupIndex:animated:](v12, "setSelectedGroupIndex:animated:", [v13 currentCategoryIndex], 0);

    [(AVTGroupListCollectionView *)self->_groupListView setDelegate:self];
    [(UIView *)self->_sideGroupContainerView bounds];
    -[AVTGroupListCollectionView setFrame:](self->_groupListView, "setFrame:");
    [(AVTGroupListCollectionView *)self->_groupListView setAutoresizingMask:18];
    [(UIView *)self->_sideGroupContainerView addSubview:self->_groupListView];
  }
LABEL_12:
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarAttributeEditorViewController;
  [(AVTAvatarAttributeEditorViewController *)&v7 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__AVTAvatarAttributeEditorViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_263FF0428;
  objc_copyWeak(&v5, &location);
  [(AVTAvatarAttributeEditorViewController *)self setupPreview:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__AVTAvatarAttributeEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained currentLayout];

  if (v1)
  {
    v2 = [WeakRetained currentLayout];
    [WeakRetained applyLayout:v2];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorViewController;
  [(AVTAvatarAttributeEditorViewController *)&v12 viewDidAppear:a3];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  id v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
  double v6 = [v5 usageTrackingSession];
  [v6 didEnterEditor];

  objc_super v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v8 = [v7 currentCategoryIndex];

  v9 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v10 = [v9 categoryAtIndex:v8];

  double v11 = [v10 previewMode];
  -[AVTAvatarAttributeEditorViewController updateHeaderViewForPreviewModeType:](self, "updateHeaderViewForPreviewModeType:", [v11 type]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorViewController;
  [(AVTAvatarAttributeEditorViewController *)&v8 viewWillDisappear:a3];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  id v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
  double v6 = [v5 usageTrackingSession];
  [v6 didLeaveEditor];

  if ([(AVTAvatarAttributeEditorViewController *)self allowFacetracking])
  {
    objc_super v7 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
    [v7 tearDownWithCompletionHandler:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarAttributeEditorViewController;
  id v4 = a3;
  [(AVTAvatarAttributeEditorViewController *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "layoutDirection", v11.receiver, v11.super_class);

  double v6 = [(AVTAvatarAttributeEditorViewController *)self traitCollection];
  uint64_t v7 = [v6 layoutDirection];

  if (v5 != v7) {
    [(AVTAvatarAttributeEditorViewController *)self updateLayoutAttributes];
  }
  id v8 = [MEMORY[0x263F1C550] colorNamed:@"verticalRuleColor"];
  uint64_t v9 = [v8 CGColor];
  double v10 = [(AVTAvatarAttributeEditorViewController *)self verticleRule];
  [v10 setBackgroundColor:v9];
}

- (UIEdgeInsets)adjustedSafeAreaInsets
{
  v2 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4 + -40.0;
  if (v4 <= 40.0) {
    double v11 = v4;
  }
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)notifyingContainerViewDidChangeSize:(CGSize)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v4 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  double v5 = [v4 indexPathsForVisibleItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
        uint64_t v12 = [v10 section];
        double v13 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
        double v14 = objc_msgSend(v11, "sectionControllerForSectionIndex:inCategoryAtIndex:", v12, objc_msgSend(v13, "currentCategoryIndex"));

        double v15 = [(AVTAvatarAttributeEditorViewController *)self view];
        [v15 bounds];
        objc_msgSend(v14, "invalidateLayoutForNewContainerSize:", v16, v17);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  double v18 = [(AVTAvatarAttributeEditorViewController *)self environment];
  if ([v18 deviceIsPad])
  {
  }
  else
  {
    double v19 = [(AVTAvatarAttributeEditorViewController *)self environment];
    int v20 = [v19 deviceIsMac];

    if (!v20) {
      return;
    }
  }
  [(AVTAvatarAttributeEditorViewController *)self reloadCollectionViewDataWithCompletion:0];
}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__AVTAvatarAttributeEditorViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke;
  v10[3] = &unk_263FF2158;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(AVTAvatarAttributeEditorViewController *)self setupPreview:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __97__AVTAvatarAttributeEditorViewController_prepareForAnimatedTransitionWithLayout_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained applyLayout:*(void *)(a1 + 32) layoutAvatarView:1 recalculateOffsetIfNeeded:0];
  v2 = [WeakRetained view];
  [v2 layoutIfNeeded];

  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = [WeakRetained attributesContainerView];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)updateHeaderViewForPreviewModeType:(unint64_t)a3
{
  if ([(AVTAvatarAttributeEditorViewController *)self previewModeType] != a3)
  {
    double v5 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];

    if (v5)
    {
      [(AVTAvatarAttributeEditorViewController *)self setPreviewModeType:a3];
      if (a3 == 1)
      {
        id v6 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
        id v7 = [v6 view];
        id v8 = [v7 superview];

        if (v8) {
          return;
        }
        id v9 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
        double v10 = [v9 view];
        [v10 setAlpha:1.0];

        id v11 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
        [v11 updateStickersforVisibleCells];

        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke;
        v39[3] = &unk_263FF03D8;
        v39[4] = self;
        id v12 = (void *)MEMORY[0x210530210](v39);
        id v13 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];

        if (v13)
        {
          double v14 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
          double v15 = [v14 displayedConfiguration];

          double v16 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
          double v17 = [v16 avtView];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_2;
          v37[3] = &unk_263FF0A00;
          id v38 = v12;
          id v18 = v12;
          [v17 transitionToStickerConfiguration:v15 duration:2 style:v37 completionHandler:0.25];

LABEL_15:
          return;
        }
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_3;
        v36[3] = &unk_263FF03D8;
        v36[4] = self;
        double v25 = (void *)MEMORY[0x210530210](v36);
        double v27 = (void *)MEMORY[0x263F1CB60];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_4;
        v34[3] = &unk_263FF0620;
        uint64_t v35 = v12;
        double v15 = v12;
        [v27 animateWithDuration:v25 animations:v34 completion:0.25];
        double v28 = v35;
      }
      else
      {
        double v19 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
        int v20 = [v19 superview];

        if (v20) {
          return;
        }
        long long v21 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
        long long v22 = [v21 avatar];
        [v22 setShowsBody:0];

        long long v23 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
        [v23 setAlpha:1.0];

        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_5;
        v33[3] = &unk_263FF03D8;
        v33[4] = self;
        double v15 = (void (**)(void))MEMORY[0x210530210](v33);
        long long v24 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];

        if (v24)
        {
          v15[2](v15);
          if (![(AVTAvatarAttributeEditorViewController *)self allowFacetracking]) {
            goto LABEL_15;
          }
          double v25 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
          uint64_t v26 = [v25 avtView];
          [v26 transitionToFaceTrackingWithDuration:2 style:0 completionHandler:0.25];

LABEL_14:
          goto LABEL_15;
        }
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_6;
        v32[3] = &unk_263FF03D8;
        v32[4] = self;
        double v25 = (void *)MEMORY[0x210530210](v32);
        id v29 = (void *)MEMORY[0x263F1CB60];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_7;
        v30[3] = &unk_263FF0620;
        double v15 = v15;
        uint64_t v31 = v15;
        [v29 animateWithDuration:v25 animations:v30 completion:0.25];
        double v28 = v31;
      }

      goto LABEL_14;
    }
  }
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avtViewSession];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) avtViewSessionProvider];
    double v4 = [v3 faceTrackingManager];
    [v4 setFaceTrackingManagementPaused:1];

    double v5 = [*(id *)(a1 + 32) transitioningContainer];
    [v5 setLiveView:0];

    id v6 = [*(id *)(a1 + 32) bodyEditorHeaderViewController];
    id v7 = [*(id *)(a1 + 32) avtViewSession];
    [v6 useAVTViewFromSession:v7];
  }
  id v8 = [*(id *)(a1 + 32) headerContainerView];
  id v9 = [*(id *)(a1 + 32) bodyEditorHeaderViewController];
  double v10 = [v9 view];
  [v8 addSubview:v10];

  id v11 = [*(id *)(a1 + 32) transitioningContainer];
  [v11 removeFromSuperview];

  id v22 = [*(id *)(a1 + 32) headerContainerView];
  [v22 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  int v20 = [*(id *)(a1 + 32) bodyEditorHeaderViewController];
  long long v21 = [v20 view];
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);
}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) transitioningContainer];
  [v1 setAlpha:0.0];
}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avtViewSession];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    double v4 = [v3 bodyEditorHeaderViewController];
    [v4 stopUsingAVTViewSessionSynchronously:1 completionHandler:0];

    double v5 = [*(id *)(a1 + 32) avtViewSessionProvider];
    id v6 = [v5 faceTrackingManager];
    [v6 setFaceTrackingManagementPaused:0];

    id v7 = [*(id *)(a1 + 32) transitioningContainer];
    id v8 = [*(id *)(a1 + 32) avtViewSession];
    id v9 = [v8 avtViewContainer];
    [v7 setLiveView:v9];

    double v10 = [*(id *)(a1 + 32) transitioningContainer];
    [v10 transitionLiveViewToFront];
  }
  else
  {
    [v3 updateImageViewWithPosedAvatarRecordForcingRender:1 completionHandler:0];
  }
  id v11 = [*(id *)(a1 + 32) headerContainerView];
  double v12 = [*(id *)(a1 + 32) transitioningContainer];
  [v11 addSubview:v12];

  double v13 = [*(id *)(a1 + 32) bodyEditorHeaderViewController];
  double v14 = [v13 view];
  [v14 removeFromSuperview];

  double v15 = *(void **)(a1 + 32);
  return [v15 setTransitioningContainerFrame];
}

void __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bodyEditorHeaderViewController];
  id v1 = [v2 view];
  [v1 setAlpha:0.0];
}

uint64_t __77__AVTAvatarAttributeEditorViewController_updateHeaderViewForPreviewModeType___block_invoke_7(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)updateImageViewWithPosedAvatarRecordForcingRender:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(AVTAvatarAttributeEditorViewController *)self avatarRecord];

  if (v7)
  {
    if (self->_isCreating && !v4)
    {
      id v8 = (void *)MEMORY[0x263F1C6B0];
      id v9 = AVTAvatarUIBundle();
      double v10 = [v8 imageNamed:@"newMemojiThumbnail" inBundle:v9 compatibleWithTraitCollection:0];
      id v11 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
      [v11 setStaticImage:v10];

      if (!v6) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    double v13 = [(AVTAvatarAttributeEditorViewController *)self headerPreviewImageRenderer];

    if (v13)
    {
      double v14 = [(AVTAvatarAttributeEditorViewController *)self avatarRecord];
      double v15 = +[AVTRenderingScope listControllerThumbnailScope];
      double v16 = [(AVTAvatarAttributeEditorViewController *)self headerPreviewImageRenderer];
      double v17 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
      double v18 = [v17 avatar];
      double v19 = [v16 providerForAvatar:v18 forRecord:v14 scope:v15 usingCache:!v4];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __110__AVTAvatarAttributeEditorViewController_updateImageViewWithPosedAvatarRecordForcingRender_completionHandler___block_invoke;
      v23[3] = &unk_263FF2C90;
      v23[4] = self;
      id v24 = v14;
      double v25 = v6;
      int v20 = (uint64_t (*)(void *, void *, void))v19[2];
      id v21 = v14;
      id v22 = (id)v20(v19, v23, 0);
    }
  }
  else
  {
    double v12 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
    [v12 setStaticImage:0];

    if (v6) {
LABEL_7:
    }
      v6[2](v6);
  }
LABEL_10:
}

void __110__AVTAvatarAttributeEditorViewController_updateImageViewWithPosedAvatarRecordForcingRender_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) avatarRecord];
  BOOL v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    double v5 = [*(id *)(a1 + 32) transitioningContainer];
    [v5 setStaticImage:v7];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)transitionToLiveViewAnimated:(BOOL)a3
{
  if (a3)
  {
    uint64_t v9 = 0;
    double v10 = (id *)&v9;
    uint64_t v11 = 0x3042000000;
    double v12 = __Block_byref_object_copy__18;
    double v13 = __Block_byref_object_dispose__18;
    id v14 = 0;
    BOOL v4 = [AVTAvatarToLiveTransition alloc];
    double v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
    uint64_t v6 = [v5 logger];
    id v7 = [(AVTAvatarToLiveTransition *)v4 initWithModel:self animated:1 setupHandler:0 completionHandler:&v8 logger:v6];

    objc_storeWeak(v10 + 5, v7);
    [(AVTAvatarAttributeEditorViewController *)self setCurrentTransition:v7];
    [(AVTTransition *)v7 start];

    _Block_object_dispose(&v9, 8);
    objc_destroyWeak(&v14);
  }
  else
  {
    [(AVTAvatarAttributeEditorViewController *)self transitionLiveViewToFront];
  }
}

void __71__AVTAvatarAttributeEditorViewController_transitionToLiveViewAnimated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) transitioningContainer];
    [v3 setStaticImage:0];

    id v4 = [*(id *)(a1 + 32) currentTransition];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

    if (v4 == WeakRetained)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      [v6 setCurrentTransition:0];
    }
  }
}

- (void)transitionStaticViewToFront
{
  id v2 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
  [v2 transitionStaticViewToFront];
}

- (void)transitionLiveViewToFront
{
  id v2 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
  [v2 transitionLiveViewToFront];
}

- (id)liveView
{
  id v2 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
  uint64_t v3 = [v2 avtView];

  return v3;
}

- (void)setupPreview:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(AVTAvatarAttributeEditorViewController *)self allowFacetracking])
  {
    [(AVTAvatarAttributeEditorViewController *)self beginAVTViewSessionWithDidBeginBlock:v4];
  }
  else
  {
    [(AVTAvatarAttributeEditorViewController *)self setupImageView];
    v4[2](v4, 0);
  }
}

- (void)setupImageView
{
  uint64_t v3 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];

  if (v3)
  {
    id v4 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v4 avatarContainerFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    [(AVTAvatarAttributeEditorViewController *)self setTransitioningContainerFrame];
    id v14 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    long long v23 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    id v24 = [v23 view];
    objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);
  }
  id v25 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [(AVTAvatarAttributeEditorViewController *)self setupCollapsibleHeaderIfNeededForLayout:v25 withSession:0];
}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  double v5 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
  if ([v5 isActive])
  {

    goto LABEL_7;
  }
  BOOL v6 = [(AVTAvatarAttributeEditorViewController *)self allowFacetracking];

  if (!v6)
  {
LABEL_7:
    if (v4)
    {
      double v11 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
      v4[2](v4, v11);
    }
    goto LABEL_9;
  }
  double v7 = [(AVTAvatarAttributeEditorViewController *)self postSessionDidBecomeActiveHandler];

  if (v7)
  {
    double v8 = [(AVTAvatarAttributeEditorViewController *)self postSessionDidBecomeActiveHandler];
    v8[2](v8, 0);
  }
  [(AVTAvatarAttributeEditorViewController *)self setPostSessionDidBecomeActiveHandler:v4];
  objc_initWeak(&location, self);
  double v9 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
  v14[3] = &unk_263FF0428;
  objc_copyWeak(&v15, &location);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_3;
  v12[3] = &unk_263FF0450;
  objc_copyWeak(&v13, &location);
  double v10 = [v9 sessionWithDidBecomeActiveHandler:v14 tearDownHandler:v12];
  [(AVTAvatarAttributeEditorViewController *)self setAvtViewSession:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
LABEL_9:
}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [v3 avtView];
  [WeakRetained configureThrottlerForAVTView:v5];

  BOOL v6 = [WeakRetained currentLayout];

  if (v6)
  {
    double v7 = [WeakRetained currentLayout];
    [v7 avatarContainerFrame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [WeakRetained headerContainerView];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    double v17 = [WeakRetained headerContainerView];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    uint64_t v26 = [WeakRetained bodyEditorHeaderViewController];
    double v27 = [v26 view];
    objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

    [WeakRetained setTransitioningContainerFrame];
  }
  [v3 aspectRatio];
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = [WeakRetained transitioningContainer];
  objc_msgSend(v32, "setAspectRatio:", v29, v31);

  v33 = [WeakRetained avtViewSessionProvider];
  v34 = [v33 faceTrackingManager];
  [v34 setDelegate:WeakRetained];

  [WeakRetained configureAVTViewFromSession:v3];
  uint64_t v35 = [WeakRetained transitioningContainer];
  uint64_t v36 = [v3 avtViewContainer];
  [v35 setLiveView:v36];

  v37 = [WeakRetained avtViewSessionProvider];
  id v38 = [v37 faceTrackingManager];
  [v38 setFaceTrackingManagementPaused:0];

  v39 = [WeakRetained avtViewSessionProvider];
  uint64_t v40 = [v39 faceTrackingManager];
  [v40 resumeFaceTrackingIfNeededAnimated:0];

  [WeakRetained configureUserInfoLabel];
  v41 = [WeakRetained currentLayout];
  [WeakRetained setupCollapsibleHeaderIfNeededForLayout:v41 withSession:v3];

  v42 = [WeakRetained transitioningContainer];
  [WeakRetained setupTapGestureForView:v42];

  v43 = [WeakRetained view];
  [v43 setNeedsLayout];

  v44 = [v3 avtViewUpdater];
  v45 = [WeakRetained modelManager];
  uint64_t v46 = [v45 avatarRecord];
  char v47 = [v44 willUpdateViewForRecord:v46 avatar:0];

  if ((v47 & 1) == 0) {
    [WeakRetained transitionToLiveViewAnimated:0];
  }
  objc_initWeak(&location, WeakRetained);
  objc_super v48 = [v3 avtViewUpdater];
  v49 = [WeakRetained modelManager];
  v50 = [v49 avatarRecord];
  v51 = [WeakRetained modelManager];
  v52 = [v51 avatar];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
  v54[3] = &unk_263FF2CE0;
  objc_copyWeak(&v56, &location);
  char v57 = v47;
  id v53 = v3;
  id v55 = v53;
  [v48 setAvatarRecord:v50 avatar:v52 completionHandler:v54];

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      double v5 = [WeakRetained avtViewSession];

      id WeakRetained = v8;
      if (v5)
      {
        [v8 transitionToLiveViewAnimated:1];
        id WeakRetained = v8;
      }
    }
  }
  BOOL v6 = [WeakRetained postSessionDidBecomeActiveHandler];

  if (v6)
  {
    double v7 = [v8 postSessionDidBecomeActiveHandler];
    v7[2](v7, *(void *)(a1 + 32));
  }
  [v8 setPostSessionDidBecomeActiveHandler:0];
}

void __79__AVTAvatarAttributeEditorViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  double v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tearDownThrottler];
  double v7 = [WeakRetained transitioningContainer];
  id v8 = [WeakRetained tapGestureRecognizer];
  [v7 removeGestureRecognizer:v8];

  if ([WeakRetained disableAvatarSnapshotting])
  {
    double v9 = [WeakRetained transitioningContainer];
    [v9 setStaticImage:0];
  }
  else
  {
    double v10 = (void *)MEMORY[0x263F296E0];
    double v11 = [v25 avtView];
    double v12 = [WeakRetained transitioningContainer];
    double v13 = [v12 liveView];
    double v14 = [WeakRetained environment];
    double v15 = [v14 logger];
    double v9 = [v10 snapshotAVTView:v11 matchingViewSize:v13 highQuality:0 logger:v15];

    double v16 = [WeakRetained transitioningContainer];
    [v16 setStaticImage:v9];
  }
  double v17 = [WeakRetained transitioningContainer];
  [v17 transitionStaticViewToFront];

  double v18 = [WeakRetained visibleLayout];
  [WeakRetained setCurrentLayout:v18];

  double v19 = [WeakRetained currentTransition];
  [v19 cancel];

  [WeakRetained setCurrentTransition:0];
  [WeakRetained setAvtViewSession:0];
  [WeakRetained tearDownCollapsibleHeaderIfNeeded];
  if (([WeakRetained shouldHideUserInfoView] & 1) == 0)
  {
    double v20 = [WeakRetained avtViewSessionProvider];
    double v21 = [v20 faceTrackingManager];
    double v22 = [v21 userInfoView];
    [v22 removeFromSuperview];
  }
  double v23 = [WeakRetained avtViewSessionProvider];
  double v24 = [v23 faceTrackingManager];
  [v24 setDelegate:0];

  v5[2](v5);
}

- (void)configureThrottlerForAVTView:(id)a3
{
  id v10 = a3;
  if (AVTUIAdaptativeFrameRate())
  {
    id v4 = [AVTViewThrottler alloc];
    double v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
    BOOL v6 = [(AVTViewThrottler *)v4 initWithAVTView:v10 environment:v5];
    [(AVTAvatarAttributeEditorViewController *)self setAvtViewThrottler:v6];

    double v7 = [(AVTAvatarAttributeEditorViewController *)self environment];
    id v8 = [v7 deviceResourceManager];
    double v9 = [(AVTAvatarAttributeEditorViewController *)self avtViewThrottler];
    [v8 registerConsumer:v9];
  }
}

- (void)tearDownThrottler
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self avtViewThrottler];

  if (v3)
  {
    id v4 = [(AVTAvatarAttributeEditorViewController *)self avtViewThrottler];
    [v4 unthrottle];

    double v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
    BOOL v6 = [v5 deviceResourceManager];
    double v7 = [(AVTAvatarAttributeEditorViewController *)self avtViewThrottler];
    [v6 unregisterConsumer:v7];

    [(AVTAvatarAttributeEditorViewController *)self setAvtViewThrottler:0];
  }
}

- (void)configureAVTViewFromSession:(id)a3
{
  id v12 = a3;
  id v4 = [v12 avtView];
  [v4 updateInterfaceOrientation];

  uint64_t v5 = AVTUIShowTrackingLostReticle_once();
  BOOL v6 = [v12 avtView];
  [v6 setEnableReticle:v5];

  double v7 = [v12 avtView];
  [v7 setEnableFaceTracking:1];

  id v8 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
  double v9 = [v8 backgroundColor];
  id v10 = [v12 avtView];
  [v10 setBackgroundColor:v9];

  if (AVTUIShowPerfHUD_once())
  {
    double v11 = [v12 avtView];
    [v11 setShowPerfHUD:1];
  }
}

- (void)configureUserInfoLabel
{
  if (![(AVTAvatarAttributeEditorViewController *)self shouldHideUserInfoView]
    && [(AVTAvatarAttributeEditorViewController *)self allowFacetracking])
  {
    id v3 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
    id v4 = [v3 faceTrackingManager];
    id v10 = [v4 userInfoView];

    uint64_t v5 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];

    if (v5)
    {
      BOOL v6 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
      [v6 userInfoFrame];
      objc_msgSend(v10, "setFrame:");
    }
    double v7 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
    id v8 = [v7 backgroundColor];
    [v10 setContainerBackgroundColor:v8];

    double v9 = [(AVTAvatarAttributeEditorViewController *)self view];
    [v9 addSubview:v10];
  }
}

- (void)setupCollapsibleHeaderIfNeededForLayout:(id)a3 withSession:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ((![(AVTAvatarAttributeEditorViewController *)self allowFacetracking]
     || [(AVTAvatarAttributeEditorViewController *)self allowFacetracking]
     && [v6 isActive])
    && [v17 supportedLayoutOrientation] == 1)
  {
    double v7 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];

    if (!v7)
    {
      id v8 = [AVTCollapsibleHeaderController alloc];
      double v9 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
      id v10 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
      double v11 = [(AVTCollapsibleHeaderController *)v8 initWithScrollView:v9 headerView:v10 minHeight:0.0 maxHeight:0.0];
      [(AVTAvatarAttributeEditorViewController *)self setCollapsibleHeaderController:v11];

      id v12 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
      [v12 setShouldOnlyExpandWhenScrollingAtEdge:1];

      double v13 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
      [v13 setDelegate:self];

      [v17 groupDialContainerFrame];
      double v15 = v14;
      double v16 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
      [v16 setAdditionalTopContentInset:v15];

      [(AVTAvatarAttributeEditorViewController *)self updateCollapsibleHeaderHeightConstraintsAnimated:0];
    }
  }
}

- (void)updateCollapsibleHeaderHeightConstraintsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AVTAvatarAttributeEditorViewController *)self environment];
  if ([v5 deviceIsPad])
  {

LABEL_4:
    uint64_t v8 = 0x4069000000000000;
    goto LABEL_6;
  }
  id v6 = [(AVTAvatarAttributeEditorViewController *)self environment];
  int v7 = [v6 deviceIsMac];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v8 = 0x4064000000000000;
LABEL_6:
  double v9 = *(double *)&v8;
  id v10 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v10 avatarContainerFrame];
  double Height = CGRectGetHeight(v14);

  id v12 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v12 updateMinHeight:v3 maxHeight:v9 animated:Height];
}

- (void)setupTapGestureForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTAvatarAttributeEditorViewController *)self tapGestureRecognizer];

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_didTapAvatarView_];
    [(AVTAvatarAttributeEditorViewController *)self setTapGestureRecognizer:v6];
  }
  id v7 = [(AVTAvatarAttributeEditorViewController *)self tapGestureRecognizer];
  [v4 addGestureRecognizer:v7];
}

- (void)tearDownCollapsibleHeaderIfNeeded
{
  BOOL v3 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];

  if (v3)
  {
    id v4 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
    id v7 = [v4 headerView];

    [(AVTAvatarAttributeEditorViewController *)self setCollapsibleHeaderController:0];
    uint64_t v5 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v5 setDelegate:self];

    id v6 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v6 avatarContainerFrame];
    objc_msgSend(v7, "setFrame:");
  }
}

- (void)didTapAvatarView:(id)a3
{
  id v4 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v4 expandAnimated:1];

  id v6 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
  uint64_t v5 = [v6 faceTrackingManager];
  [v5 resumeFaceTrackingIfNeededAnimated:1];
}

- (id)createAlphaAssetsLabel
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 10.0, 300.0, 30.0);
  BOOL v3 = [MEMORY[0x263F1C550] clearColor];
  [v2 setBackgroundColor:v3];

  id v4 = [MEMORY[0x263F1C550] systemRedColor];
  [v2 setTextColor:v4];

  [v2 setText:@"Warning: contains new and/or updated visuals. \nUse with disclosed users only."];
  uint64_t v5 = +[AVTUIFontRepository groupDialLabelFont];
  [v2 setFont:v5];

  [v2 setNumberOfLines:0];
  [v2 setAdjustsFontSizeToFitWidth:1];
  [v2 setTextAlignment:1];
  [v2 setAutoresizingMask:34];
  return v2;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorViewController;
  [(AVTAvatarAttributeEditorViewController *)&v3 viewDidLayoutSubviews];
  [(AVTAvatarAttributeEditorViewController *)self updateLayoutAttributes];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(AVTAvatarAttributeEditorViewController *)self groupDial];
  [v4 reloadData];

  [(AVTAvatarAttributeEditorViewController *)self reloadCollectionViewDataWithCompletion:0];
  [(AVTAvatarAttributeEditorViewController *)self updateLayoutAttributes];
}

- (void)updateLayoutAttributes
{
  objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self view];
  +[AVTShadowView defaultHeightForSuperview:v3];
  double v5 = v4;

  id v6 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  [v6 bounds];
  double v8 = v7 - v5;
  double v9 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  [v9 bounds];
  double v11 = v10;
  id v12 = [(AVTAvatarAttributeEditorViewController *)self shadowView];
  objc_msgSend(v12, "setFrame:", 0.0, v8, v11, v5);

  double v13 = [(AVTAvatarAttributeEditorViewController *)self shadowView];
  [v13 setAutoresizingMask:10];

  CGRect v14 = [(AVTAvatarAttributeEditorViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  [(AVTAvatarAttributeEditorViewController *)self adjustedSafeAreaInsets];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v27 userInfoViewHeight];
  double v29 = v28;
  double v30 = [(AVTAvatarAttributeEditorViewController *)self traitCollection];
  BOOL v31 = [v30 layoutDirection] == 1;
  uint64_t v32 = [(AVTAvatarAttributeEditorViewController *)self environment];
  [(AVTAvatarAttributeEditorViewController *)self maxGroupLabelWidth];
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v31, v32, v16, v18, v20, v22, v24, v26, v29, v33);
  id v69 = (id)objc_claimAutoreleasedReturnValue();

  v34 = +[AVTUIFontRepository groupDialBoldLabelFont];
  [v34 _scaledValueForValue:18.0];
  if (v35 <= 30.0) {
    double v36 = v35;
  }
  else {
    double v36 = 30.0;
  }
  v37 = [(AVTAvatarAttributeEditorViewController *)self groupDial];
  [v37 setContentPadding:v36];

  [v69 groupDialContainerFrame];
  double v39 = v38;
  uint64_t v40 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v40 setAdditionalTopContentInset:v39];

  [v69 containerSize];
  double v42 = v41;
  double v44 = v43;
  v45 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v45 containerSize];
  if (v42 != v47 || v44 != v46) {
    goto LABEL_15;
  }
  objc_super v48 = [v69 contentSizeCategory];
  v49 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  v50 = [v49 contentSizeCategory];
  if (![v48 isEqualToString:v50])
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  [v69 edgeInsets];
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  v59 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v59 edgeInsets];
  if (v54 != v63 || v52 != v60 || v58 != v62 || v56 != v61)
  {

    goto LABEL_14;
  }
  [v69 userInfoViewHeight];
  double v65 = v64;
  v66 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v66 userInfoViewHeight];
  double v68 = v67;

  if (v65 != v68) {
LABEL_16:
  }
    [(AVTAvatarAttributeEditorViewController *)self applyLayout:v69 layoutAvatarView:0 recalculateOffsetIfNeeded:1];
}

- (double)maxGroupLabelWidth
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  objc_super v3 = [v2 groupPickerItemsForCategories];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = *MEMORY[0x263F1C238];
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        double v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) localizedName];
        double v11 = +[AVTUIFontRepository groupListLabelFont];
        uint64_t v19 = v7;
        double v20 = v11;
        id v12 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v10 sizeWithAttributes:v12];
        if (v8 < v13) {
          double v8 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v8 = 0.0;
  }

  return ceil(v8);
}

- (void)applyLayout:(id)a3
{
}

- (void)applyLayout:(id)a3 layoutAvatarView:(BOOL)a4 recalculateOffsetIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v169 = a3;
  [(AVTAvatarAttributeEditorViewController *)self setCurrentLayout:v169];
  [v169 attributesContentViewFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v16 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  [(AVTAvatarAttributeEditorViewController *)self setupGroupSelectorIfNeeded];
  [v169 groupDialContainerFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [(AVTAvatarAttributeEditorViewController *)self groupDialContainerView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  uint64_t v26 = [v169 showSideGroupPicker];
  double v27 = [(AVTAvatarAttributeEditorViewController *)self groupDialContainerView];
  [v27 setHidden:v26];

  [v169 sideGroupContainerFrame];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v36 = [(AVTAvatarAttributeEditorViewController *)self sideGroupContainerView];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  uint64_t v37 = [v169 showSideGroupPicker] ^ 1;
  double v38 = [(AVTAvatarAttributeEditorViewController *)self sideGroupContainerView];
  [v38 setHidden:v37];

  if (![(AVTAvatarAttributeEditorViewController *)self allowFacetracking]
    || ([(AVTAvatarAttributeEditorViewController *)self avtViewSession],
        double v39 = objc_claimAutoreleasedReturnValue(),
        int v40 = [v39 isActive],
        v39,
        v40))
  {
    if ([v169 supportedLayoutOrientation] == 1)
    {
      double v41 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
      [(AVTAvatarAttributeEditorViewController *)self setupCollapsibleHeaderIfNeededForLayout:v169 withSession:v41];
    }
    else
    {
      [(AVTAvatarAttributeEditorViewController *)self createVerticleRuleIfNeeded];
      [(AVTAvatarAttributeEditorViewController *)self tearDownCollapsibleHeaderIfNeeded];
    }
    [v169 avatarContainerFrame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v50 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

    [(AVTAvatarAttributeEditorViewController *)self setTransitioningContainerFrame];
    double v51 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
    [v51 bounds];
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    double v60 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    double v61 = [v60 view];
    objc_msgSend(v61, "setFrame:", v53, v55, v57, v59);

    [v169 avatarContainerAlpha];
    double v63 = v62;
    double v64 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
    [v64 setAlpha:v63];

    if (v6)
    {
      double v65 = [(AVTAvatarAttributeEditorViewController *)self headerContainerView];
      [v65 layoutIfNeeded];

      v66 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
      [v66 layoutIfNeeded];

      double v67 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
      double v68 = [v67 view];
      [v68 layoutIfNeeded];
    }
    [(AVTAvatarAttributeEditorViewController *)self applyUserInfoViewLayout];
  }
  [(AVTAvatarAttributeEditorViewController *)self updateAlphaAssetsLabelFrameIfNeeded];
  id v69 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v69 setShouldResizeHeaderForScrolling:0];

  v70 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
  [v70 bounds];
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  v79 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

  [v169 headerMaskingViewAlpha];
  double v81 = v80;
  v82 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  [v82 setAlpha:v81];

  [v169 headerMaskingViewFrame];
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;
  double v90 = v89;
  v91 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  objc_msgSend(v91, "setFrame:", v84, v86, v88, v90);

  [v169 verticalRuleAlpha];
  double v93 = v92;
  v94 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
  [v94 setAlpha:v93];

  [v169 verticalRuleFrame];
  double v96 = v95;
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  v103 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
  objc_msgSend(v103, "setFrame:", v96, v98, v100, v102);

  v104 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
  [v104 bounds];
  double v106 = v105;
  double v108 = v107;
  double v110 = v109;
  double v112 = v111;
  v113 = [(AVTAvatarAttributeEditorViewController *)self verticleRule];
  objc_msgSend(v113, "setFrame:", v106, v108, v110, v112);

  v114 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v114 contentInset];
  double v116 = v115;
  double v118 = v117;
  double v120 = v119;
  double v122 = v121;
  [v169 attributesContentViewInsets];
  if (v118 == v126 && v116 == v123 && v122 == v125)
  {
    double v127 = v124;

    if (v120 == v127) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v128 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v128 contentInset];
  double v130 = v129;

  [v169 attributesContentViewInsets];
  double v132 = v131;
  double v134 = v133;
  double v136 = v135;
  double v138 = v137;
  v139 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  objc_msgSend(v139, "setContentInset:", v132, v134, v136, v138);

  [v169 attributesContentViewScrollIndicatorInsets];
  double v141 = v140;
  double v143 = v142;
  double v145 = v144;
  double v147 = v146;
  v148 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  objc_msgSend(v148, "setScrollIndicatorInsets:", v141, v143, v145, v147);

  if (v5)
  {
    v149 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v149 contentOffset];
    double v151 = v150;
    double v153 = v152;

    v154 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v154 contentInset];
    double v156 = v130 - v155;
    v157 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v157 userInfoViewHeight];
    double v159 = v156 + v158;
    +[AVTUserInfoView textVerticalPadding];
    double v161 = ceil(v159 + v160);

    if (fabs(v161) > 0.00000011920929)
    {
      v162 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
      objc_msgSend(v162, "setContentOffset:", v151, v153 + v161);
    }
  }
LABEL_18:
  v163 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v163 setShouldResizeHeaderForScrolling:1];

  [(AVTAvatarAttributeEditorViewController *)self updateCollapsibleHeaderHeightConstraintsAnimated:0];
  v164 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  [v164 updateInsetsIfNeeded];

  v165 = [(AVTAvatarAttributeEditorViewController *)self delegate];

  id v167 = v169;
  if (v165)
  {
    v168 = [(AVTAvatarAttributeEditorViewController *)self delegate];
    [v168 attributeEditor:self didUpdateVisibleLayout:v169];

    id v167 = v169;
  }
  MEMORY[0x270F9A758](v166, v167);
}

- (void)applyUserInfoViewLayout
{
  if ([(AVTAvatarAttributeEditorViewController *)self allowFacetracking]
    && ![(AVTAvatarAttributeEditorViewController *)self shouldHideUserInfoView])
  {
    objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v3 userInfoFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
    [v12 maxHeight];
    double v14 = v13;
    double v15 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
    [v15 currentHeightForHeader];
    double v17 = v14 - v16;

    id v20 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
    double v18 = [v20 faceTrackingManager];
    double v19 = [v18 userInfoView];
    objc_msgSend(v19, "setFrame:", v5, v7 - v17, v9, v11);
  }
}

- (id)visibleLayout
{
  objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self transitioningContainer];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [AVTAvatarAttributeEditorOverridingLayout alloc];
  double v13 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  double v14 = [(AVTAvatarAttributeEditorOverridingLayout *)v12 initWithLayout:v13];

  -[AVTAvatarAttributeEditorOverridingLayout setAvatarContainerFrame:](v14, "setAvatarContainerFrame:", v5, v7, v9, v11);
  return v14;
}

- (void)createVerticleRuleIfNeeded
{
  objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self verticleRule];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AVTAvatarAttributeEditorViewController *)self setVerticleRuleContainer:v5];

    double v6 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v6 verticalRuleAlpha];
    double v8 = v7;
    double v9 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
    [v9 setAlpha:v8];

    double v10 = [MEMORY[0x263F157E8] layer];
    [(AVTAvatarAttributeEditorViewController *)self setVerticleRule:v10];

    id v11 = [MEMORY[0x263F1C550] colorNamed:@"verticalRuleColor"];
    uint64_t v12 = [v11 CGColor];
    double v13 = [(AVTAvatarAttributeEditorViewController *)self verticleRule];
    [v13 setBackgroundColor:v12];

    double v14 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
    double v15 = [v14 layer];
    double v16 = [(AVTAvatarAttributeEditorViewController *)self verticleRule];
    [v15 addSublayer:v16];

    id v18 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
    double v17 = [(AVTAvatarAttributeEditorViewController *)self verticleRuleContainer];
    [v18 addSubview:v17];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v27.receiver = self;
  v27.super_class = (Class)AVTAvatarAttributeEditorViewController;
  id v7 = a4;
  -[AVTAvatarAttributeEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(AVTAvatarAttributeEditorViewController *)self adjustedSafeAreaInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v16 userInfoViewHeight];
  double v18 = v17;
  double v19 = [(AVTAvatarAttributeEditorViewController *)self traitCollection];
  BOOL v20 = [v19 layoutDirection] == 1;
  double v21 = [(AVTAvatarAttributeEditorViewController *)self environment];
  [(AVTAvatarAttributeEditorViewController *)self maxGroupLabelWidth];
  double v23 = +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v20, v21, width, height, v9, v11, v13, v15, v18, v22);

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __93__AVTAvatarAttributeEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_263FF2D08;
  v25[4] = self;
  id v26 = v23;
  id v24 = v23;
  [v7 animateAlongsideTransition:v25 completion:0];
}

uint64_t __93__AVTAvatarAttributeEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) avtViewSession];
  objc_super v3 = [v2 avtView];
  [v3 updateInterfaceOrientation];

  [*(id *)(a1 + 32) applyLayout:*(void *)(a1 + 40) layoutAvatarView:0 recalculateOffsetIfNeeded:1];
  id v4 = [*(id *)(a1 + 32) attributesCollectionView];
  double v5 = [v4 collectionViewLayout];
  [v5 invalidateLayout];

  double v6 = [*(id *)(a1 + 32) attributesContainerView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v11 = objc_msgSend(*(id *)(a1 + 32), "attributesCollectionView", 0);
  double v12 = [v11 indexPathsForVisibleItems];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        double v18 = [*(id *)(a1 + 32) dataSource];
        uint64_t v19 = [v17 section];
        BOOL v20 = [*(id *)(a1 + 32) dataSource];
        double v21 = objc_msgSend(v18, "sectionControllerForSectionIndex:inCategoryAtIndex:", v19, objc_msgSend(v20, "currentCategoryIndex"));

        objc_msgSend(v21, "invalidateLayoutForNewContainerSize:", v8, v10);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  return [*(id *)(a1 + 32) reloadCollectionViewDataWithCompletion:0];
}

- (void)updateHeaderDependentLayoutWithHeaderFrame:(CGRect)a3 fittingSize:(CGSize)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v9 groupDialContainerFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  CGFloat v47 = height;
  v49.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v49);
  double v17 = [(AVTAvatarAttributeEditorViewController *)self groupDialContainerView];
  objc_msgSend(v17, "setFrame:", v11, MaxY, v13, v15);

  double v18 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  [v18 setAlpha:1.0];

  uint64_t v19 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
  [v19 bounds];
  double v21 = v20;
  v50.origin.CGFloat x = v11;
  v50.origin.CGFloat y = MaxY;
  v50.size.CGFloat width = v13;
  v50.size.CGFloat height = v15;
  double v22 = CGRectGetMaxY(v50);
  long long v23 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v21, v22);

  long long v24 = [(AVTAvatarAttributeEditorViewController *)self avtViewSession];
  if ([v24 isActive])
  {
    BOOL v25 = [(AVTAvatarAttributeEditorViewController *)self shouldHideUserInfoView];

    if (v25) {
      goto LABEL_7;
    }
    long long v26 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v26 userInfoFrame];
    double v28 = v27;
    uint64_t v45 = v29;
    double v31 = v30;

    long long v24 = +[AVTUIFontRepository groupDialBoldLabelFont];
    [v24 _scaledValueForValue:18.0];
    double v33 = v32;
    double v34 = v32 * 0.5;
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = v47;
    double v35 = CGRectGetMaxY(v51);
    double v36 = 15.0;
    if (v33 <= 30.0) {
      double v36 = v34;
    }
    double v37 = v35 + v36;
    double v38 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v38 userInfoViewHeight];
    double v40 = v37 - v39;

    double v41 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
    double v42 = [v41 faceTrackingManager];
    double v43 = [v42 userInfoView];

    objc_msgSend(v43, "setFrame:", v28, v40, v46, v31);
    double v44 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
    [v44 bringSubviewToFront:v43];
  }
LABEL_7:
  [(AVTAvatarAttributeEditorViewController *)self updateAlphaAssetsLabelFrameIfNeeded];
  [(AVTAvatarAttributeEditorViewController *)self setTransitioningContainerFrame];
}

- (void)faceTrackingManager:(id)a3 didUpdateUserInfoWithSize:(CGSize)a4
{
  double height = a4.height;
  double v6 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v6 containerSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v11 edgeInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  uint64_t v21 = [v20 RTL];
  double v22 = [(AVTAvatarAttributeEditorViewController *)self environment];
  long long v23 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
  [v23 maxGroupLabelWidth];
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", v21, v22, v8, v10, v13, v15, v17, v19, height, v24);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  [(AVTAvatarAttributeEditorViewController *)self setCurrentLayout:v25];
  [(AVTAvatarAttributeEditorViewController *)self applyUserInfoViewLayout];
}

- (void)updateAlphaAssetsLabelFrameIfNeeded
{
  objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self alphaAssetsLabel];

  if (v3)
  {
    id v12 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v12 avatarContainerFrame];
    CGFloat v4 = CGRectGetMinX(v14) + 16.0;
    double v5 = [(AVTAvatarAttributeEditorViewController *)self headerMaskingView];
    [v5 frame];
    double MaxY = CGRectGetMaxY(v15);
    double v7 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v7 groupDialContainerFrame];
    double v8 = MaxY - CGRectGetHeight(v16) + -45.0;
    double v9 = [(AVTAvatarAttributeEditorViewController *)self currentLayout];
    [v9 avatarContainerFrame];
    CGFloat v10 = CGRectGetWidth(v17) + -32.0;
    double v11 = [(AVTAvatarAttributeEditorViewController *)self alphaAssetsLabel];
    objc_msgSend(v11, "setFrame:", v4, v8, v10, 45.0);
  }
}

- (void)reloadCollectionViewDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = __81__AVTAvatarAttributeEditorViewController_reloadCollectionViewDataWithCompletion___block_invoke;
  CGFloat v10 = &unk_263FF06C0;
  double v11 = self;
  id v12 = v4;
  id v5 = v4;
  double v6 = (void (**)(void))MEMORY[0x210530210](&v7);
  if ([(AVTAvatarAttributeEditorViewController *)self collectionViewIsPerformingBatchUpdates])
  {
    [(AVTAvatarAttributeEditorViewController *)self setPendingCollectionViewReloadDataBlock:v6];
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __81__AVTAvatarAttributeEditorViewController_reloadCollectionViewDataWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributesCollectionView];
  [v2 reloadData];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)resetAllSectionControllersStateToDefault
{
  objc_super v3 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      double v6 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
      uint64_t v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
      uint64_t v8 = objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", v5, objc_msgSend(v7, "currentCategoryIndex"));

      [v8 resetToDefaultState];
      ++v5;
      double v9 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
      uint64_t v10 = [v9 numberOfSections];
    }
    while (v5 < v10);
  }
}

- (void)updateLayoutForAttributesCollectionMaskingView
{
  if (self->_attributesCollectionViewMaskingView)
  {
    [(UIView *)self->_headerMaskingView frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UICollectionView *)self->_attributesCollectionView contentOffset];
    double v12 = v11;
    v18.origin.CGFloat x = v4;
    v18.origin.CGFloat y = v6;
    v18.size.CGFloat width = v8;
    v18.size.double height = v10;
    double v13 = v12 + CGRectGetMaxY(v18);
    v19.origin.CGFloat x = v4;
    v19.origin.CGFloat y = v6;
    v19.size.CGFloat width = v8;
    v19.size.double height = v10;
    double Width = CGRectGetWidth(v19);
    id v16 = [(AVTAvatarAttributeEditorViewController *)self view];
    [v16 frame];
    double Height = CGRectGetHeight(v20);
    v21.origin.CGFloat x = v4;
    v21.origin.CGFloat y = v6;
    v21.size.CGFloat width = v8;
    v21.size.double height = v10;
    -[UIView setFrame:](self->_attributesCollectionViewMaskingView, "setFrame:", 0.0, v13, Width, Height - CGRectGetHeight(v21));
  }
}

- (void)collapsibleHeaderController:(id)a3 willUpdateHeaderToHeight:(double)a4
{
  id v6 = a3;
  double v7 = [v6 headerView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGRect v14 = [(AVTAvatarAttributeEditorViewController *)self attributesContainerView];
  [v14 bounds];
  -[AVTAvatarAttributeEditorViewController updateHeaderDependentLayoutWithHeaderFrame:fittingSize:](self, "updateHeaderDependentLayoutWithHeaderFrame:fittingSize:", v9, v11, v13, a4, v15, v16);

  id v25 = v6;
  [v25 minHeight];
  double v18 = v17;
  [v25 maxHeight];
  double v20 = v19;
  [v25 currentHeightForHeader];
  double v22 = v21;

  long long v23 = [(AVTAvatarAttributeEditorViewController *)self avtViewThrottler];
  double v24 = v23;
  if (vabdd_f64(v22, v18) >= vabdd_f64(v22, v20)) {
    [v23 unthrottle];
  }
  else {
    [v23 throttle];
  }

  [(AVTAvatarAttributeEditorViewController *)self updateLayoutForAttributesCollectionMaskingView];
}

- (void)collapsibleHeaderController:(id)a3 isUpdatingHeaderWithIncrementalHeight:(double)a4
{
  id v6 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
  int v7 = [v6 isAnimatingExpansion];

  if (v7)
  {
    double v8 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    id v9 = (id)[v8 configureLayoutIfNeededWithHeight:a4];
  }
  [(AVTAvatarAttributeEditorViewController *)self updateLayoutForAttributesCollectionMaskingView];
}

- (void)collapsibleHeaderController:(id)a3 didUpdateHeaderToHeight:(double)a4
{
  id v6 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
  int v7 = [v6 isAnimatingExpansion];

  if (v7)
  {
    double v8 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    id v9 = (id)[v8 configureLayoutIfNeededWithHeight:a4];

    double v10 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    [v10 setIsAnimatingExpansion:0];
  }
  [(AVTAvatarAttributeEditorViewController *)self updateLayoutForAttributesCollectionMaskingView];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  CGFloat v4 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v5 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  int64_t v6 = objc_msgSend(v4, "numberOfSectionsForCategoryAtIndex:", objc_msgSend(v5, "currentCategoryIndex"));

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v6 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  int v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v8 = objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", a4, objc_msgSend(v7, "currentCategoryIndex"));

  int64_t v9 = [v8 numberOfItems];
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = [v6 section];
  double v10 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v11 = objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));

  double v12 = [v11 section];
  double v13 = [v12 options];
  int v14 = [v13 showsLabel];

  double v15 = off_263FEF3D0;
  if (!v14) {
    double v15 = off_263FEF3B8;
  }
  double v16 = [(__objc2_class *)*v15 cellIdentifier];
  double v17 = [v7 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v6];

  objc_msgSend(v11, "updateCell:forItemAtIndex:", v17, objc_msgSend(v6, "row"));
  double v18 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v19 = [v6 section];
  double v20 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v21 = objc_msgSend(v18, "sectionCoordinatorForSectionAtIndex:inCategoryAtIndex:", v19, objc_msgSend(v20, "currentCategoryIndex"));

  if (v21)
  {
    double v22 = [v21 delegate];

    if (v22 != self) {
      [v21 setDelegate:self];
    }
  }
  long long v23 = [v11 delegate];

  if (!v23) {
    [v11 setDelegate:self];
  }

  return v17;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = objc_msgSend(v7, "sectionForIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));

  if ([v9 shouldDisplayTitle])
  {
    double v10 = +[AVTUIFontRepository attributeTitleFont];
    double v11 = [v9 localizedName];
    double v12 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v12 bounds];
    double v14 = v13 + -40.0;
    [v10 lineHeight];
    double v16 = v15 + v15;
    uint64_t v30 = *MEMORY[0x263F1C238];
    v31[0] = v10;
    double v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v17, 0, v14, v16);
    double v19 = v18;

    double v20 = +[AVTUIFontRepository attributeTitleFont];
    [v20 _scaledValueForValue:18.0];
    double v22 = v21;

    if (v22 <= 30.0) {
      double v23 = v22;
    }
    else {
      double v23 = 30.0;
    }
    double v24 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v24 bounds];
    double v26 = v25;
    double v27 = v19 + v23 * 2.0 + -12.0;
  }
  else
  {
    double v26 = *MEMORY[0x263F001B0];
    double v27 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v28 = v26;
  double v29 = v27;
  result.double height = v29;
  result.CGFloat width = v28;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = objc_msgSend(v7, "sectionForIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));

  double v10 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v12 = objc_msgSend(v10, "sectionForIndex:inCategoryAtIndex:", a5 + 1, objc_msgSend(v11, "currentCategoryIndex"));

  if ([v9 shouldDisplaySeparatorBeforeSection:v12])
  {
    double v13 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v13 bounds];
    double v15 = v14;

    double v16 = 1.0;
  }
  else
  {
    double v15 = *MEMORY[0x263F001B0];
    double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v17 = v15;
  double v18 = v16;
  result.double height = v18;
  result.CGFloat width = v17;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v12 = [v9 section];
  double v13 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v14 = objc_msgSend(v11, "sectionForIndex:inCategoryAtIndex:", v12, objc_msgSend(v13, "currentCategoryIndex"));

  if ((id)*MEMORY[0x263F1D120] == v8)
  {
    double v17 = +[AVTAttributeEditorSectionHeaderView reuseIdentifier];
    double v16 = [v10 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v17 forIndexPath:v9];

    double v18 = [v14 localizedName];
    [v16 setDisplayString:v18];

    double v19 = [v14 supplementalPicker];
    [v16 setSupplementalPicker:v19];

    [v16 setDelegate:self];
  }
  else
  {
    double v15 = +[AVTAttributeSectionSeparator reuseIdentifier];
    double v16 = [v10 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v15 forIndexPath:v9];

    [v14 separatorInsets];
    objc_msgSend(v16, "setEdgeInsets:");
  }

  return v16;
}

- (id)selectedItemInSection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CGFloat v4 = [v3 sectionItems];
  double v5 = [v4 firstObject];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v3, "sectionItems", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isSelected])
        {
          id v12 = v11;

          double v5 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v8 = [v6 section];
  uint64_t v9 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  id v10 = objc_msgSend(v7, "sectionControllerForSectionIndex:inCategoryAtIndex:", v8, objc_msgSend(v9, "currentCategoryIndex"));

  uint64_t v11 = [v6 row];
  id v12 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v12 bounds];
  objc_msgSend(v10, "sizeForItemAtIndex:fittingSize:", v11, v13, v14);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.CGFloat width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = objc_msgSend(v7, "sectionControllerForSectionIndex:inCategoryAtIndex:", a5, objc_msgSend(v8, "currentCategoryIndex"));

  id v10 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v10 bounds];
  objc_msgSend(v9, "edgeInsetsFittingSize:", v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v10 = [v8 section];
  double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v12 = objc_msgSend(v9, "sectionControllerForSectionIndex:inCategoryAtIndex:", v10, objc_msgSend(v11, "currentCategoryIndex"));

  id v14 = v7;
  uint64_t v13 = [v8 item];

  [v12 cell:v14 willDisplayAtIndex:v13];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = [v7 section];
  uint64_t v10 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v11 = objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));

  [(AVTAvatarAttributeEditorViewController *)self setIsAnimatingHighlight:1];
  double v12 = [v6 cellForItemAtIndexPath:v7];
  objc_initWeak(&location, self);
  uint64_t v13 = [v7 row];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__AVTAvatarAttributeEditorViewController_collectionView_didHighlightItemAtIndexPath___block_invoke;
  v14[3] = &unk_263FF0730;
  objc_copyWeak(&v15, &location);
  [v11 didHighlightItemAtIndex:v13 cell:v12 completionBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__AVTAvatarAttributeEditorViewController_collectionView_didHighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnimatingHighlight:0];
  id v1 = [WeakRetained pendingUnhighlightBlock];

  if (v1)
  {
    id v2 = [WeakRetained pendingUnhighlightBlock];
    v2[2]();
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  id v14 = &unk_263FF2D30;
  objc_copyWeak(&v17, &location);
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = (void (**)(void))MEMORY[0x210530210](&v11);
  -[AVTAvatarAttributeEditorViewController setPendingUnhighlightBlock:](self, "setPendingUnhighlightBlock:", v10, v11, v12, v13, v14);
  if (![(AVTAvatarAttributeEditorViewController *)self isAnimatingHighlight]) {
    v10[2](v10);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained dataSource];
  uint64_t v4 = [a1[4] section];
  double v5 = [WeakRetained dataSource];
  id v6 = objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));

  id v7 = [a1[5] cellForItemAtIndexPath:a1[4]];
  uint64_t v8 = [a1[4] row];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke_2;
  v9[3] = &unk_263FF04A0;
  v9[4] = WeakRetained;
  [v6 didUnhighlightItemAtIndex:v8 cell:v7 completionBlock:v9];
}

uint64_t __87__AVTAvatarAttributeEditorViewController_collectionView_didUnhighlightItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPendingUnhighlightBlock:0];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v7 = [v5 section];

  uint64_t v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  id v9 = objc_msgSend(v6, "sectionControllerForSectionIndex:inCategoryAtIndex:", v7, objc_msgSend(v8, "currentCategoryIndex"));

  LOBYTE(v8) = [(id)objc_opt_class() supportsSelection];
  return (char)v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = [v6 section];
  uint64_t v10 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  objc_msgSend(v8, "sectionControllerForSectionIndex:inCategoryAtIndex:", v9, objc_msgSend(v10, "currentCategoryIndex"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v17, "selectedIndex"), objc_msgSend(v6, "section"));
  uint64_t v12 = [v7 cellForItemAtIndexPath:v11];
  uint64_t v13 = [v12 valueView];
  [v13 updateSelectedState:0 animated:0];

  id v14 = [v7 cellForItemAtIndexPath:v6];

  id v15 = [v14 valueView];
  [v15 updateSelectedState:1 animated:1];

  uint64_t v16 = [v6 row];
  [v17 didSelectItemAtIndex:v16 cell:v14];
}

- (void)sectionHeaderView:(id)a3 didSelectItem:(id)a4 forPicker:(id)a5 sender:(id)a6
{
  id v35 = a4;
  id v8 = a6;
  uint64_t v9 = [v8 superview];
  [v8 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  double v28 = [v27 collectionViewLayout];
  double v29 = objc_msgSend(v28, "layoutAttributesForElementsInRect:", v20, v22, v24, v26);

  if ([v29 count])
  {
    uint64_t v30 = [v29 firstObject];
    [v30 frame];
    double v20 = v31;
    double v22 = v32;
    double v24 = v33;
    double v26 = v34;
  }
  -[AVTAvatarAttributeEditorViewController updateForSelectionOfSupplementalItem:senderRect:](self, "updateForSelectionOfSupplementalItem:senderRect:", v35, v20, v22, v24, v26);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        double v11 = [(AVTAvatarAttributeEditorViewController *)self presetSectionItemForIndexPath:v10];
        if (v11)
        {
          double v12 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
          double v13 = [v12 preloader];
          [v13 preloadSectionItem:v11 atIndexPath:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        double v11 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
        double v12 = [v11 preloader];
        [v12 cancelPreloadForSectionItemIndexPath:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)presetSectionItemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v6 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v7 = objc_msgSend(v5, "numberOfSectionsForCategoryAtIndex:", objc_msgSend(v6, "currentCategoryIndex"));
  uint64_t v8 = [v4 section];

  if (v7 <= v8)
  {
    long long v14 = 0;
  }
  else
  {
    uint64_t v9 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    uint64_t v10 = [v4 section];
    double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    double v12 = objc_msgSend(v9, "sectionControllerForSectionIndex:inCategoryAtIndex:", v10, objc_msgSend(v11, "currentCategoryIndex"));

    uint64_t v13 = [v12 numberOfItems];
    if (v13 <= [v4 item])
    {
      long long v14 = 0;
    }
    else
    {
      long long v14 = objc_msgSend(v12, "prefetchingSectionItemForIndex:", objc_msgSend(v4, "item"));
    }
  }
  return v14;
}

- (void)groupPicker:(id)a3 didDeselectGroupAtIndex:(int64_t)a4
{
}

- (void)groupPicker:(id)a3 didSelectGroupAtIndex:(int64_t)a4 tapped:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v9 = [v8 currentCategoryIndex];

  if (v9 == a4)
  {
    if (!v5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = [(AVTAvatarAttributeEditorViewController *)self imageProviderScheduler];
    [v10 cancelAllTasks];

    double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    double v12 = [v11 categoryAtIndex:a4];

    uint64_t v13 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
    long long v14 = [v13 buildUIModelWithSelectedCategory:v12 atIndex:a4];

    long long v15 = [(AVTAvatarAttributeEditorViewController *)self environment];
    long long v16 = [v15 inMemoryImageCache];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(AVTAvatarAttributeEditorViewController *)self environment];
      uint64_t v19 = [v18 inMemoryImageCache];
      [v19 clearCache];
    }
    double v20 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    [v20 reloadWithCategories:v14 currentCategoryIndex:a4];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__AVTAvatarAttributeEditorViewController_groupPicker_didSelectGroupAtIndex_tapped___block_invoke;
    v29[3] = &unk_263FF03D8;
    v29[4] = self;
    [(AVTAvatarAttributeEditorViewController *)self reloadCollectionViewDataWithCompletion:v29];
    double v21 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    double v22 = [v21 currentCategoryIdentifier];

    AVTUIEditorSetMostRecentGroupName();
    double v23 = [v12 previewMode];
    -[AVTAvatarAttributeEditorViewController updateHeaderViewForPreviewModeType:](self, "updateHeaderViewForPreviewModeType:", [v23 type]);
  }
  double v24 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];

  BOOL v25 = v9 == a4;
  if (v24)
  {
    double v26 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
    [v26 scrollToTopPreservingHeaderHeight:1 animated:v25];
  }
  else
  {
    double v26 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    objc_msgSend(v26, "scrollRectToVisible:animated:", v25, 0.0, 0.0, 1.0, 1.0);
  }

LABEL_11:
  double v27 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
  double v28 = [v27 faceTrackingManager];
  [v28 resumeFaceTrackingIfNeededAnimated:1];
}

uint64_t __83__AVTAvatarAttributeEditorViewController_groupPicker_didSelectGroupAtIndex_tapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAllSectionControllersStateToDefault];
}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v6 conformsToProtocol:&unk_26BF63C38])
  {
    uint64_t v7 = [v6 avatarUpdater];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  [(AVTAvatarAttributeEditorViewController *)self updateForSelectionOfItem:v6 controller:v10 reloadSections:v8];
  if ((AVTUIHasDisplayedCategoriesDiscoverability() & 1) == 0)
  {
    uint64_t v9 = [(AVTAvatarAttributeEditorViewController *)self groupDial];
    [v9 startDiscoverability];
  }
}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v20 section];
  BOOL v8 = [v7 sectionItems];
  uint64_t v9 = [v6 firstObject];
  uint64_t v10 = [v8 indexOfObject:v9];

  uint64_t v11 = v10 - 1;
  if (v10 >= 1)
  {
    double v12 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
    uint64_t v13 = [v12 editorState];
    long long v14 = [v20 section];
    long long v15 = [v14 identifier];
    [v13 setEnabledMulticolorSubpickersIndex:v11 forMulticolorPickerIdentifier:v15];

    long long v16 = [v20 section];
    char v17 = [v16 sectionItems];
    uint64_t v18 = [v17 objectAtIndexedSubscript:v11];

    uint64_t v19 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
    [v19 updateAvatarByDeletingSectionItems:v6 animated:1];

    [(AVTAvatarAttributeEditorViewController *)self updateForSelectionOfItem:v18 controller:v20 reloadSections:1];
  }
}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  id v5 = a4;
  if ([(AVTAvatarAttributeEditorViewController *)self allowFacetracking])
  {
    id v6 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
    [v6 updateAvatarBySelectingSectionItem:v5 animated:0];
  }
  else
  {
    uint64_t v7 = [(AVTAvatarAttributeEditorViewController *)self lastPosedAvatarImageRenderingTime];
    if (!v7
      || (BOOL v8 = (void *)v7,
          -[AVTAvatarAttributeEditorViewController lastPosedAvatarImageRenderingTime](self, "lastPosedAvatarImageRenderingTime"), v9 = objc_claimAutoreleasedReturnValue(), [v9 timeIntervalSinceNow], double v11 = v10, v9, v8, v11 < -0.05))
    {
      double v12 = objc_opt_new();
      [(AVTAvatarAttributeEditorViewController *)self setLastPosedAvatarImageRenderingTime:v12];

      uint64_t v13 = [(AVTAvatarAttributeEditorViewController *)self headerPreviewScheduler];
      [v13 cancelAllTasks];

      long long v14 = [(AVTAvatarAttributeEditorViewController *)self headerPreviewScheduler];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke;
      v15[3] = &unk_263FF2D58;
      v15[4] = self;
      id v16 = v5;
      [v14 scheduleTask:v15];
    }
  }
}

void __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) modelManager];
  [v4 updateAvatarBySelectingSectionItem:*(void *)(a1 + 40) animated:0];

  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke_2;
  v7[3] = &unk_263FF0A00;
  id v8 = v3;
  id v6 = v3;
  [v5 updateImageViewWithPosedAvatarRecordForcingRender:1 completionHandler:v7];
}

uint64_t __96__AVTAvatarAttributeEditorViewController_attributeEditorSectionController_didUpdateSectionItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v3 performBatchUpdates:0 completion:0];
}

- (void)updateForSelectionOfItem:(id)a3 controller:(id)a4 reloadSections:(BOOL)a5
{
  BOOL v5 = a5;
  id v31 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  uint64_t v10 = [v8 indexForItem:v31];
  double v11 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v12 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v13 = objc_msgSend(v11, "indexForSection:inCategoryAtIndex:", v9, objc_msgSend(v12, "currentCategoryIndex"));

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Can't get an index path for item %@ in section %@", v31, v9 format];
  }
  long long v14 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:v13];
  long long v15 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  id v16 = [v15 indexPathsForVisibleItems];
  int v17 = [v16 containsObject:v14];

  if (v17)
  {
    uint64_t v18 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    uint64_t v19 = [v18 layoutAttributesForItemAtIndexPath:v14];

    [v19 frame];
    double v21 = v20;
    double v23 = v22;
    double v24 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
    [v24 bounds];
    objc_msgSend(v8, "sizeForFocusingItemAtIndex:fittingSize:", v10, v25, v26);
    double v28 = v27;
    double v30 = v29;

    -[AVTAvatarAttributeEditorViewController updateForSelectionOfItem:inSection:senderRect:reloadSections:](self, "updateForSelectionOfItem:inSection:senderRect:reloadSections:", v31, v9, v5, v21, v23, v28, v30);
  }
}

- (void)updateForSelectionOfItem:(id)a3 inSection:(id)a4 senderRect:(CGRect)a5 reloadSections:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a4;
  id v13 = a3;
  long long v14 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  [v14 updateAvatarBySelectingSectionItem:v13 animated:1];

  long long v15 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  [v15 updateEditorStateBySelectingSectionItem:v13 animated:1];

  -[AVTAvatarAttributeEditorViewController rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:](self, "rebuildUIModelAfterSelectionInSection:senderRect:reloadSections:", v16, v6, x, y, width, height);
}

- (void)updateForSelectionOfSupplementalItem:(id)a3 senderRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  [v10 updateAvatarBySelectingSupplementalPickerItem:v9 animated:1];

  -[AVTAvatarAttributeEditorViewController rebuildUIModelAfterSelectionInSection:senderRect:](self, "rebuildUIModelAfterSelectionInSection:senderRect:", 0, x, y, width, height);
}

- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4
{
}

- (void)rebuildUIModelAfterSelectionInSection:(id)a3 senderRect:(CGRect)a4 reloadSections:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v62[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  double v54 = v11;
  if (v11)
  {
    double v12 = [v11 identifier];
    v62[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
  }
  else
  {
    uint64_t v13 = MEMORY[0x263EFFA68];
  }
  long long v14 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v15 = [v14 currentCategoryIndex];

  id v16 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  int v17 = [v16 categoryAtIndex:v15];

  uint64_t v18 = [(AVTAvatarAttributeEditorViewController *)self modelManager];
  uint64_t v19 = [v18 buildUIModelWithSelectedCategory:v17 atIndex:v15];

  double v20 = [v19 objectAtIndex:v15];
  double v21 = [(AVTAvatarAttributeEditorViewController *)self environment];
  double v22 = [v21 inMemoryImageCache];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    double v24 = [(AVTAvatarAttributeEditorViewController *)self environment];
    double v25 = [v24 inMemoryImageCache];
    [v25 clearCache];
  }
  double v26 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v52 = v19;
  [v26 reloadWithCategories:v19 currentCategoryIndex:v15];

  double v27 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v28 = [v27 indexesForSectionsPresentIn:v20 butNotIn:v17];

  double v29 = [MEMORY[0x263F089C8] indexSet];
  if (v5)
  {
    double v30 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
    id v31 = [v30 indexesForSectionsExcludingSectionsWithIdentifiers:v13 inCategoryAtIndex:v15];
    [v29 addIndexes:v31];

    [v29 removeIndexes:v28];
  }
  double v53 = (void *)v13;
  double v32 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  double v33 = [v32 indexesForSectionsPresentIn:v17 butNotIn:v20];

  double v34 = [(AVTAvatarAttributeEditorViewController *)self dataSource];
  uint64_t v35 = [v34 numberOfSectionsForCategoryAtIndex:v15];

  [(AVTAvatarAttributeEditorViewController *)self setCollectionViewIsPerformingBatchUpdates:1];
  double v36 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke;
  v59[3] = &unk_263FF07D0;
  v59[4] = self;
  id v37 = v33;
  id v60 = v37;
  id v38 = v28;
  id v61 = v38;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_2;
  v55[3] = &unk_263FF2D80;
  v55[4] = self;
  uint64_t v57 = v15;
  uint64_t v58 = v35;
  id v39 = v29;
  id v56 = v39;
  [v36 performBatchUpdates:v59 completion:v55];

  if (![(AVTAvatarAttributeEditorViewController *)self allowFacetracking]) {
    [(AVTAvatarAttributeEditorViewController *)self updateImageViewWithPosedAvatarRecordForcingRender:1 completionHandler:0];
  }
  double v40 = [(AVTAvatarAttributeEditorViewController *)self attributesCollectionView];
  [v40 bounds];
  double v42 = v41;
  double v43 = [(AVTAvatarAttributeEditorViewController *)self environment];
  +[AVTAvatarAttributeEditorSectionController edgeLengthFittingWidth:v43 environment:v42];
  double v45 = v44;

  double v46 = [v17 previewMode];
  uint64_t v47 = [v46 type];

  if (v47 == 1)
  {
    double v48 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    [v48 setIsAnimatingExpansion:1];
  }
  CGRect v49 = [(AVTAvatarAttributeEditorViewController *)self collapsibleHeaderController];
  objc_msgSend(v49, "expandAnimated:withFocusRect:standardItemHeight:", 1, x, y, width, height, v45);

  [(AVTAvatarAttributeEditorViewController *)self updateForChangedSelectionIfNeeded];
  CGRect v50 = [(AVTAvatarAttributeEditorViewController *)self avtViewSessionProvider];
  CGRect v51 = [v50 faceTrackingManager];
  [v51 resumeFaceTrackingIfNeededAnimated:1];

  [(AVTAvatarAttributeEditorViewController *)self updateBodyEditorHeaderIfNeeded];
}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributesCollectionView];
  [v2 deleteSections:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) attributesCollectionView];
  [v3 insertSections:*(void *)(a1 + 48)];
}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCollectionViewIsPerformingBatchUpdates:0];
  id v2 = [*(id *)(a1 + 32) pendingCollectionViewReloadDataBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pendingCollectionViewReloadDataBlock];
    v3[2]();

    [*(id *)(a1 + 32) setPendingCollectionViewReloadDataBlock:0];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 32) dataSource];
  if (v4 == [v10 currentCategoryIndex])
  {
    BOOL v5 = [*(id *)(a1 + 32) dataSource];
    uint64_t v6 = [v5 numberOfSectionsForCategoryAtIndex:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(a1 + 56);

    if (v6 == v7)
    {
      id v8 = (void *)MEMORY[0x263F1CB60];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_3;
      v11[3] = &unk_263FF0780;
      id v9 = *(void **)(a1 + 40);
      v11[4] = *(void *)(a1 + 32);
      id v12 = v9;
      [v8 performWithoutAnimation:v11];
    }
  }
  else
  {
  }
}

void __106__AVTAvatarAttributeEditorViewController_rebuildUIModelAfterSelectionInSection_senderRect_reloadSections___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributesCollectionView];
  [v2 reloadSections:*(void *)(a1 + 40)];
}

- (void)updateForChangedSelectionIfNeeded
{
  if (![(AVTAvatarAttributeEditorViewController *)self hasMadeAnySelection])
  {
    [(AVTAvatarAttributeEditorViewController *)self setHasMadeAnySelection:1];
    id v3 = [(AVTAvatarAttributeEditorViewController *)self delegate];
    [v3 attributeEditorDidMakeFirstSelection:self];
  }
}

- (void)updateBodyEditorHeaderIfNeeded
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];

  if (v3)
  {
    uint64_t v4 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    [v4 reloadDisplayedSticker];

    BOOL v5 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
    uint64_t v6 = [v5 view];
    uint64_t v7 = [v6 superview];

    if (v7)
    {
      id v8 = [(AVTAvatarAttributeEditorViewController *)self bodyEditorHeaderViewController];
      [v8 updateStickersforVisibleCells];
    }
  }
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  id v3 = [(AVTAvatarAttributeEditorViewController *)self view];
  uint64_t v4 = [v3 window];
  int64_t v5 = [v4 _windowInterfaceOrientation];

  return v5;
}

- (AVTAvatarAttributeEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarAttributeEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disableAvatarSnapshotting
{
  return self->_disableAvatarSnapshotting;
}

- (void)setDisableAvatarSnapshotting:(BOOL)a3
{
  self->_disableAvatarSnapshotting = a3;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (unint64_t)editorPresentationContext
{
  return self->_editorPresentationContext;
}

- (void)setEditorPresentationContext:(unint64_t)a3
{
  self->_editorPresentationContext = a3;
}

- (AVTAvatarAttributeEditorLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (AVTAvatarAttributeEditorModelManager)modelManager
{
  return self->_modelManager;
}

- (AVTTaskScheduler)imageProviderScheduler
{
  return self->_imageProviderScheduler;
}

- (UIView)attributesContainerView
{
  return self->_attributesContainerView;
}

- (void)setAttributesContainerView:(id)a3
{
}

- (UIView)sideGroupContainerView
{
  return self->_sideGroupContainerView;
}

- (void)setSideGroupContainerView:(id)a3
{
}

- (UIView)groupDialContainerView
{
  return self->_groupDialContainerView;
}

- (void)setGroupDialContainerView:(id)a3
{
}

- (AVTGroupDial)groupDial
{
  return self->_groupDial;
}

- (void)setGroupDial:(id)a3
{
}

- (AVTGroupListCollectionView)groupListView
{
  return self->_groupListView;
}

- (void)setGroupListView:(id)a3
{
}

- (AVTBodyCarouselController)bodyEditorHeaderViewController
{
  return self->_bodyEditorHeaderViewController;
}

- (void)setBodyEditorHeaderViewController:(id)a3
{
}

- (UIView)attributesCollectionViewMaskingView
{
  return self->_attributesCollectionViewMaskingView;
}

- (void)setAttributesCollectionViewMaskingView:(id)a3
{
}

- (UIView)headerMaskingView
{
  return self->_headerMaskingView;
}

- (void)setHeaderMaskingView:(id)a3
{
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
}

- (AVTShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UICollectionView)attributesCollectionView
{
  return self->_attributesCollectionView;
}

- (void)setAttributesCollectionView:(id)a3
{
}

- (AVTAvatarAttributeEditorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (AVTAttributeEditorAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (void)setAnimationCoordinator:(id)a3
{
}

- (UILabel)alphaAssetsLabel
{
  return self->_alphaAssetsLabel;
}

- (void)setAlphaAssetsLabel:(id)a3
{
}

- (UIView)verticleRuleContainer
{
  return self->_verticleRuleContainer;
}

- (void)setVerticleRuleContainer:(id)a3
{
}

- (CALayer)verticleRule
{
  return self->_verticleRule;
}

- (void)setVerticleRule:(id)a3
{
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (AVTCollapsibleHeaderController)collapsibleHeaderController
{
  return self->_collapsibleHeaderController;
}

- (void)setCollapsibleHeaderController:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (AVTViewThrottler)avtViewThrottler
{
  return self->_avtViewThrottler;
}

- (void)setAvtViewThrottler:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarEditorColorsState)colorsState
{
  return self->_colorsState;
}

- (void)setColorsState:(id)a3
{
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
}

- (BOOL)isCreating
{
  return self->_isCreating;
}

- (BOOL)hasMadeAnySelection
{
  return self->_hasMadeAnySelection;
}

- (void)setHasMadeAnySelection:(BOOL)a3
{
  self->_hasMadeAnySelection = a3;
}

- (AVTImageTransitioningContainerView)transitioningContainer
{
  return self->_transitioningContainer;
}

- (void)setTransitioningContainer:(id)a3
{
}

- (AVTTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (NSDate)lastPosedAvatarImageRenderingTime
{
  return self->_lastPosedAvatarImageRenderingTime;
}

- (void)setLastPosedAvatarImageRenderingTime:(id)a3
{
}

- (BOOL)isAnimatingHighlight
{
  return self->_isAnimatingHighlight;
}

- (void)setIsAnimatingHighlight:(BOOL)a3
{
  self->_isAnimatingHighlight = a3;
}

- (id)pendingUnhighlightBlock
{
  return self->_pendingUnhighlightBlock;
}

- (void)setPendingUnhighlightBlock:(id)a3
{
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_allowFacetracking = a3;
}

- (_AVTAvatarRecordImageProvider)headerPreviewImageRenderer
{
  return self->_headerPreviewImageRenderer;
}

- (void)setHeaderPreviewImageRenderer:(id)a3
{
}

- (AVTTaskScheduler)headerPreviewScheduler
{
  return self->_headerPreviewScheduler;
}

- (BOOL)collectionViewIsPerformingBatchUpdates
{
  return self->_collectionViewIsPerformingBatchUpdates;
}

- (void)setCollectionViewIsPerformingBatchUpdates:(BOOL)a3
{
  self->_collectionViewIsPerformingBatchUpdates = a3;
}

- (id)pendingCollectionViewReloadDataBlock
{
  return self->_pendingCollectionViewReloadDataBlock;
}

- (void)setPendingCollectionViewReloadDataBlock:(id)a3
{
}

- (unint64_t)previewModeType
{
  return self->_previewModeType;
}

- (void)setPreviewModeType:(unint64_t)a3
{
  self->_previewModeType = a3;
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
  objc_storeStrong(&self->_pendingCollectionViewReloadDataBlock, 0);
  objc_storeStrong((id *)&self->_headerPreviewScheduler, 0);
  objc_storeStrong((id *)&self->_headerPreviewImageRenderer, 0);
  objc_storeStrong(&self->_pendingUnhighlightBlock, 0);
  objc_storeStrong((id *)&self->_lastPosedAvatarImageRenderingTime, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_transitioningContainer, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_storeStrong((id *)&self->_colorsState, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewThrottler, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collapsibleHeaderController, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_verticleRule, 0);
  objc_storeStrong((id *)&self->_verticleRuleContainer, 0);
  objc_storeStrong((id *)&self->_alphaAssetsLabel, 0);
  objc_storeStrong((id *)&self->_animationCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_attributesCollectionView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_headerMaskingView, 0);
  objc_storeStrong((id *)&self->_attributesCollectionViewMaskingView, 0);
  objc_storeStrong((id *)&self->_bodyEditorHeaderViewController, 0);
  objc_storeStrong((id *)&self->_groupListView, 0);
  objc_storeStrong((id *)&self->_groupDial, 0);
  objc_storeStrong((id *)&self->_groupDialContainerView, 0);
  objc_storeStrong((id *)&self->_sideGroupContainerView, 0);
  objc_storeStrong((id *)&self->_attributesContainerView, 0);
  objc_storeStrong((id *)&self->_imageProviderScheduler, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)selectCategory:(id)a3 withCompletionDelay:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  dataSource = self->_dataSource;
  id v10 = a5;
  id v11 = [(AVTAvatarAttributeEditorDataSource *)dataSource groupPickerItemsForCategories];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __117__AVTAvatarAttributeEditorViewController_UIApplicationTesting__selectCategory_withCompletionDelay_completionHandler___block_invoke;
  v15[3] = &unk_263FF2DA8;
  id v16 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 indexOfObjectPassingTest:v15];

  [(AVTGroupDial *)self->_groupDial setSelectedGroupIndex:v13 animated:0];
  [(AVTAvatarAttributeEditorViewController *)self groupPicker:self->_groupDial didSelectGroupAtIndex:v13 tapped:1];
  dispatch_time_t v14 = dispatch_time(0, 1000000000 * a4);
  dispatch_after(v14, MEMORY[0x263EF83A0], v10);
}

uint64_t __117__AVTAvatarAttributeEditorViewController_UIApplicationTesting__selectCategory_withCompletionDelay_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __115__AVTAvatarAttributeEditorViewController_UIApplicationTesting__prepareForPresetsScrollTestOnCategory_readyHandler___block_invoke;
  v8[3] = &unk_263FF02C8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(AVTAvatarAttributeEditorViewController *)self selectCategory:a3 withCompletionDelay:3 completionHandler:v8];
}

uint64_t __115__AVTAvatarAttributeEditorViewController_UIApplicationTesting__prepareForPresetsScrollTestOnCategory_readyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)configurePPTMemoji:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke;
  v6[3] = &unk_263FF06C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTAvatarAttributeEditorViewController *)self selectCategory:@"Skin" withCompletionDelay:1 completionHandler:v6];
}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F088C8] indexPathForItem:13 inSection:0];
  id v3 = [*(id *)(a1 + 32) dataSource];
  uint64_t v4 = [v2 section];
  id v5 = [*(id *)(a1 + 32) dataSource];
  id v6 = objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 selectIndexPath:v2];
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_2;
  v9[3] = &unk_263FF06C0;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_3;
  v2[3] = &unk_263FF06C0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 selectCategory:@"Hairstyle" withCompletionDelay:1 completionHandler:v2];
}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  id v3 = [*(id *)(a1 + 32) dataSource];
  uint64_t v4 = [v2 section];
  id v5 = [*(id *)(a1 + 32) dataSource];
  id v6 = objc_msgSend(v3, "sectionControllerForSectionIndex:inCategoryAtIndex:", v4, objc_msgSend(v5, "currentCategoryIndex"));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 selectIndexPath:v2];
  }
  dispatch_time_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[138];
  id v9 = [MEMORY[0x263F088C8] indexPathForItem:9 inSection:1];
  [v7 collectionView:v8 didSelectItemAtIndexPath:v9];

  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_4;
  v12[3] = &unk_263FF06C0;
  id v11 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  dispatch_after(v10, MEMORY[0x263EF83A0], v12);
}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_5;
  v2[3] = &unk_263FF06C0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 selectCategory:@"Eyes" withCompletionDelay:1 completionHandler:v2];
}

void __83__AVTAvatarAttributeEditorViewController_UIApplicationTesting__configurePPTMemoji___block_invoke_5(uint64_t a1)
{
  id v7 = [MEMORY[0x263F088C8] indexPathForItem:4 inSection:0];
  id v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = [v7 section];
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = objc_msgSend(v2, "sectionControllerForSectionIndex:inCategoryAtIndex:", v3, objc_msgSend(v4, "currentCategoryIndex"));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 selectIndexPath:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

@end