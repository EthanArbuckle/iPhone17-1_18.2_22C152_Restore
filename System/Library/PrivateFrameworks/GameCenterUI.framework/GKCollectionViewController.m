@interface GKCollectionViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_initializeSafeCategoryFromValidationManager;
- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (BOOL)active;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)didSlideIn;
- (BOOL)hasLoaded;
- (BOOL)hasViewFactories;
- (BOOL)readyToDisplayData;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)shouldSlideInContents;
- (BOOL)showSupplementaryViewsWhileLoading;
- (BOOL)skipLoadAfterViewDidLoad;
- (GKCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (GKColorPalette)colorPalette;
- (GKLoadableContentStateMachine)loadingMachine;
- (GKPlaceholderView)placeholderView;
- (GKSearchBar)activeSearchBar;
- (GKSwipeToEditStateMachine)swipeStateMachine;
- (NSMapTable)reusableViewsIHaveSeen;
- (NSString)currentSearchText;
- (NSString)loadingState;
- (NSUUID)currentUpdateID;
- (OS_dispatch_queue)batchUpdateQueue;
- (UIActivityIndicatorView)loadingIndicatorView;
- (UICollectionViewDataSource)dataSource;
- (UICollectionViewLayout)defaultLayout;
- (UINavigationController)placeholderNavigationController;
- (double)showMoreTextMarginAtIndexPath:(id)a3;
- (id)_gkRecursiveDescription;
- (id)collectionView;
- (id)currentSearchTerms;
- (id)defaultColorPalette;
- (id)footerViewAboveShowMoreViewAtIndexPath:(id)a3;
- (id)gkDataSource;
- (id)nearestSelectableIndexPath:(id)a3;
- (int64_t)appearCount;
- (int64_t)batchUpdateCount;
- (int64_t)previousOrientation;
- (void)_applyUpdates:(id)a3 withCompletionHandler:(id)a4;
- (void)_finishUpdates:(id)a3 withCompletionHandler:(id)a4;
- (void)_gkRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)_gkSetContentsNeedUpdateWithHandler:(id)a3;
- (void)_loadDataWithCompletionHandlerAndError:(id)a3;
- (void)_reallyStartLoadingIndicator;
- (void)_systemContentSizeSettingDidChange;
- (void)addPlaceholderViewToView:(id)a3;
- (void)applyShowMoreLayoutAttributesForShowMoreView:(id)a3 atIndexPath:(id)a4;
- (void)clearButtonPressed:(id)a3;
- (void)clearSelectionHighlight;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)completeWhenReadyToDisplayData:(id)a3;
- (void)configureViewFactories;
- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didInsertSections:(id)a4;
- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5;
- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didRefreshSections:(id)a4;
- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4;
- (void)dataSource:(id)a3 didRemoveSections:(id)a4;
- (void)dataSource:(id)a3 didUpdatePlaceholderVisibility:(BOOL)a4;
- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5;
- (void)dataSourceDidMoveSectionsWithItems:(id)a3;
- (void)dataSourceDidReloadData:(id)a3;
- (void)dealloc;
- (void)didEnterErrorState;
- (void)didEnterLoadedState;
- (void)didEnterNoContentState;
- (void)didTouchShowMore:(id)a3;
- (void)hidePlaceholderAnimated:(BOOL)a3;
- (void)invalidateSearch;
- (void)loadDataWithCompletionHandlerAndError:(id)a3;
- (void)loadView;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveSearchBar:(id)a3;
- (void)setAppearCount:(int64_t)a3;
- (void)setBatchUpdateCount:(int64_t)a3;
- (void)setBatchUpdateQueue:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setCurrentSearchText:(id)a3;
- (void)setCurrentUpdateID:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultLayout:(id)a3;
- (void)setDidSlideIn:(BOOL)a3;
- (void)setHasViewFactories:(BOOL)a3;
- (void)setIsReadyToDisplayData:(BOOL)a3;
- (void)setLoadingIndicatorView:(id)a3;
- (void)setLoadingMachine:(id)a3;
- (void)setNeedsReload;
- (void)setPlaceholderNavigationController:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPreviousOrientation:(int64_t)a3;
- (void)setReusableViewsIHaveSeen:(id)a3;
- (void)setShouldSlideInContents:(BOOL)a3;
- (void)setShowSupplementaryViewsWhileLoading:(BOOL)a3;
- (void)setSkipLoadAfterViewDidLoad:(BOOL)a3;
- (void)setSwipeStateMachine:(id)a3;
- (void)showCollectionView;
- (void)showPlaceholderWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 animated:(BOOL)a6 block:(id)a7;
- (void)shutActionPaneAnimated:(BOOL)a3;
- (void)slideInContents;
- (void)startLoadingIndicator;
- (void)stateDidChange;
- (void)stateWillChange;
- (void)stopLoadingIndicator;
- (void)stopLoadingIndicatorWithoutAnimation;
- (void)swipeToDeleteCell:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutGuideOffsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willDismissActionSheetFromCell:(id)a3;
@end

@implementation GKCollectionViewController

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (GKCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewController;
  v6 = [(GKCollectionViewController *)&v15 initWithCollectionViewLayout:v5];
  if (v6)
  {
    v7 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v6->_loadingMachine;
    v6->_loadingMachine = v7;

    [(_GKStateMachine *)v6->_loadingMachine setDelegate:v6];
    objc_storeStrong((id *)&v6->_defaultLayout, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.GameKit.GKCollectionView.batchUpdateQueue", v9);
    batchUpdateQueue = v6->_batchUpdateQueue;
    v6->_batchUpdateQueue = (OS_dispatch_queue *)v10;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      [v12 registerClass:objc_opt_class() forDecorationViewOfKind:@"ColumnDivider"];
    }
    v13 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    [(GKCollectionViewController *)v6 setReusableViewsIHaveSeen:v13];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v4 dealloc];
}

+ (id)_initializeSafeCategoryFromValidationManager
{
  return @"WTF";
}

- (id)_gkRecursiveDescription
{
  v3 = [(GKCollectionViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = NSString;
    v12.receiver = self;
    v12.super_class = (Class)GKCollectionViewController;
    v6 = [(GKCollectionViewController *)&v12 description];
    v7 = [(GKCollectionViewController *)self dataSource];
    v8 = [v7 _gkDescriptionWithChildren:1];
    v9 = [v5 stringWithFormat:@"%@\n%@", v6, v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GKCollectionViewController;
    v9 = [(GKCollectionViewController *)&v11 description];
  }

  return v9;
}

- (id)collectionView
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  v3 = [(GKCollectionViewController *)&v5 collectionView];

  return v3;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v5 loadView];
  v3 = [(GKCollectionViewController *)self collectionView];
  objc_super v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v20 viewDidLoad];
  [(GKCollectionViewController *)self configureDataSource];
  [(GKCollectionViewController *)self configureViewFactories];
  v3 = [(GKCollectionViewController *)self collectionView];
  [v3 setAlwaysBounceVertical:1];
  [v3 setDelegate:self];
  objc_super v4 = [(GKCollectionViewController *)self colorPalette];
  objc_super v5 = [v4 viewBackgroundColor];
  [v3 setBackgroundColor:v5];

  v6 = [[GKSwipeToEditStateMachine alloc] initWithCollectionView:v3];
  swipeStateMachine = self->_swipeStateMachine;
  self->_swipeStateMachine = v6;

  if (*MEMORY[0x1E4F63830])
  {
    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      dispatch_queue_t v10 = [(GKCollectionViewController *)self collectionView];
      [v10 scrollIndicatorInsets];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      v19 = [(GKCollectionViewController *)self collectionView];
      objc_msgSend(v19, "setScrollIndicatorInsets:", v12, v14, v16 + 5.0, v18);
    }
  }
  if (!self->_skipLoadAfterViewDidLoad) {
    [(GKCollectionViewController *)self loadDataWithCompletionHandlerAndError:0];
  }
  [(GKCollectionViewController *)self setPreviousOrientation:[(GKCollectionViewController *)self interfaceOrientation]];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v3 viewLayoutMarginsDidChange];
  [(GKCollectionViewController *)self updateLayoutGuideOffsets];
}

- (void)updateLayoutGuideOffsets
{
  v39 = [(GKCollectionViewController *)self defaultLayout];
  objc_super v3 = [(GKCollectionViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = v39;
  if (isKindOfClass)
  {
    id v10 = v39;
    double v11 = [(GKCollectionViewController *)self view];
    [v11 _contentMargin];
    double v13 = v12;

    if (v13 == 0.0)
    {
      double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      if (v15 != 1 || (double v13 = 20.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38])
      {
        double v16 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v17 = [v16 userInterfaceIdiom];

        double v13 = 15.0;
        if (!v17)
        {
          if (([MEMORY[0x1E4FB1BA8] mainScreen],
                double v18 = objc_claimAutoreleasedReturnValue(),
                [v18 bounds],
                double v20 = v19,
                double v22 = v21,
                v18,
                v20 >= 414.0)
            && v22 >= 736.0
            || (v22 >= 414.0 ? (BOOL v23 = v20 < 736.0) : (BOOL v23 = 1), !v23))
          {
            double v13 = 20.0;
          }
        }
      }
    }
    double v24 = v5 + v13;
    double v25 = v7 + v13;
    v26 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    if (!v27)
    {
      if (([MEMORY[0x1E4FB1BA8] mainScreen],
            v28 = objc_claimAutoreleasedReturnValue(),
            [v28 bounds],
            double v30 = v29,
            double v32 = v31,
            v28,
            v30 >= 414.0)
        && v32 >= 736.0
        || v30 >= 736.0 && v32 >= 414.0)
      {
        v33 = [(GKCollectionViewController *)self traitCollection];
        uint64_t v34 = [v33 horizontalSizeClass];

        double v35 = 84.0 - v13;
        if (v34 != 2) {
          double v35 = -0.0;
        }
        double v24 = v24 + v35;
        double v25 = v25 + v35;
      }
    }
    [v10 leftLayoutGuideOffset];
    if (v24 != v36 || ([v10 rightLayoutGuideOffset], v25 != v37))
    {
      [v10 setLeftLayoutGuideOffset:v24];
      [v10 setRightLayoutGuideOffset:v25];
      v38 = [(GKCollectionViewController *)self collectionView];
      [v38 performBatchUpdates:0 completion:0];
    }
    uint64_t v9 = v39;
  }

  MEMORY[0x1F41817F8](isKindOfClass, v9);
}

- (id)nearestSelectableIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_13;
  }
  double v5 = [(GKCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 numberOfSections];
  if (v6 < 1)
  {

LABEL_13:
    v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  v8 = 0;
  for (uint64_t i = 0; i != v7; ++i)
  {
    uint64_t v10 = [v5 numberOfItemsInSection:i];
    if (v10 >= 1)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 1;
      do
      {
        double v13 = v8;
        v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 - 1 inSection:i];

        if (v12 - 1 >= [v4 item]) {
          break;
        }
      }
      while (v12++ < v11);
    }
    if (i >= [v4 section]) {
      break;
    }
  }

  if (!v8) {
    goto LABEL_13;
  }
LABEL_14:

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v28 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    BOOL v11 = v8 < 414.0 || v10 < 736.0;
    if (!v11 || v8 >= 736.0 && v10 >= 414.0)
    {
      uint64_t v12 = [(GKCollectionViewController *)self colorPalette];
      double v13 = [v12 windowBackgroundColor];
      double v14 = [(GKCollectionViewController *)self collectionView];
      [v14 setBackgroundColor:v13];
    }
  }
  self->_didSlideIn = 0;
  uint64_t v15 = [(GKCollectionViewController *)self dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v16 = [(GKCollectionViewController *)self collectionView];
    [v15 collectionViewWillBecomeActive:v16];
  }
  if (!self->_hasViewFactories) {
    [(GKCollectionViewController *)self configureViewFactories];
  }
  [(GKCollectionViewController *)self setActive:1];
  if ([(GKCollectionViewController *)self shouldSlideInContents])
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
    uint64_t v17 = [(GKCollectionViewController *)self collectionView];
    double v18 = [v17 layer];

    CATransform3DMakeTranslation(&v27, 0.0, 150.0, 0.0);
    CATransform3D v26 = v27;
    [v18 setSublayerTransform:&v26];
    [MEMORY[0x1E4F39CF8] commit];
  }
  double v19 = [(_GKStateMachine *)self->_loadingMachine currentState];

  if (v19 == @"NoContentState")
  {
    [(GKCollectionViewController *)self didEnterNoContentState];
  }
  else
  {
    double v20 = [(_GKStateMachine *)self->_loadingMachine currentState];

    if (v20 == @"ErrorState")
    {
      [(GKCollectionViewController *)self didEnterErrorState];
    }
    else
    {
      double v21 = 0.0;
      if (![(GKCollectionViewController *)self shouldSlideInContents])
      {
        double v21 = 1.0;
        if (![(GKCollectionViewController *)self showSupplementaryViewsWhileLoading])
        {
          if ([(GKCollectionViewController *)self hasLoaded]) {
            double v21 = 1.0;
          }
          else {
            double v21 = 0.0;
          }
        }
      }
      double v22 = [(GKCollectionViewController *)self collectionView];
      [v22 setAlpha:v21];
    }
  }
  if (self->_activeSearchBar) {
    -[GKCollectionViewController searchBarSearchButtonClicked:](self, "searchBarSearchButtonClicked:");
  }
  BOOL v23 = (unint64_t)([(GKCollectionViewController *)self interfaceOrientation] - 3) < 2;
  if (v23 != (unint64_t)([(GKCollectionViewController *)self previousOrientation] - 3) < 2)
  {
    double v24 = [(GKCollectionViewController *)self collectionView];
    double v25 = [v24 collectionViewLayout];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v25 forceFullInvalidate];
    }
    else {
      [v25 invalidateLayout];
    }
  }
  [(GKCollectionViewController *)self updateLayoutGuideOffsets];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKCollectionViewController *)self startLoadingIndicator];
  [(GKCollectionViewController *)self invalidateSearch];
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKCollectionViewController;
  [(GKCollectionViewController *)&v6 viewWillDisappear:a3];
  if (self->_activeSearchBar) {
    -[GKCollectionViewController searchBarSearchButtonClicked:](self, "searchBarSearchButtonClicked:");
  }
  [(GKCollectionViewController *)self setActive:0];
  id v4 = [(GKCollectionViewController *)self gkDataSource];
  if (v4)
  {
    objc_super v5 = [(GKCollectionViewController *)self collectionView];
    [v4 collectionViewDidBecomeInactive:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  [(GKCollectionViewController *)self stopLoadingIndicatorWithoutAnimation];
  [(GKSwipeToEditStateMachine *)self->_swipeStateMachine viewDidDisappear:v3];
  [(GKCollectionViewController *)self setPreviousOrientation:[(GKCollectionViewController *)self interfaceOrientation]];
  [(GKCollectionViewController *)self hidePlaceholderAnimated:0];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (*MEMORY[0x1E4F63830])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __81__GKCollectionViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
    v4[3] = &unk_1E5F62EB0;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:a4];
  }
}

uint64_t __81__GKCollectionViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLayoutGuideOffsets];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GKCollectionViewController;
  id v7 = a4;
  -[GKCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[GKCollectionViewController updateDynamicColumnCountsForViewSize:](self, "updateDynamicColumnCountsForViewSize:", width, height);
  double v8 = [(GKCollectionViewController *)self collectionViewLayout];
  [v8 invalidateLayout];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__GKCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5F63B68;
  v9[4] = self;
  [v7 animateAlongsideTransition:v9 completion:0];
}

uint64_t __81__GKCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLayoutGuideOffsets];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewController;
  id v4 = a3;
  [(GKCollectionViewController *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(GKCollectionViewController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(GKCollectionViewController *)self _systemContentSizeSettingDidChange];
  }
}

- (void)_systemContentSizeSettingDidChange
{
  BOOL v3 = [(GKCollectionViewController *)self collectionView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke;
  v5[3] = &unk_1E5F63350;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performBatchUpdates:v5 completion:&__block_literal_global_138];
}

void __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1112) objectEnumerator];
  uint64_t v2 = [v6 nextObject];
  if (v2)
  {
    BOOL v3 = (void *)v2;
    do
    {
      [v3 _gkEnumerateSubviewsUsingBlock:&__block_literal_global_33];
      uint64_t v4 = [v6 nextObject];

      BOOL v3 = (void *)v4;
    }
    while (v4);
  }
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "numberOfSections"));
  [*(id *)(a1 + 40) reloadSections:v5];
}

void __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F08433D8])
  {
    id v2 = v3;
    [v2 replayAndApplyStyleWithSystemContentChange:1];
    [v2 _gkSetNeedsRender];
  }
}

- (BOOL)shouldSlideInContents
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  result = (v4 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v5 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v5 = 0), v5))
        && self->_shouldSlideInContents;
  return result;
}

- (void)configureViewFactories
{
  self->_hasViewFactories = 1;
}

- (void)setDataSource:(id)a3
{
  BOOL v5 = (UICollectionViewDataSource *)a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  uint64_t v7 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    [(GKCollectionViewController *)v7 setDataSource:v5];
  }
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    double v9 = dataSource;
    objc_super v10 = [(GKCollectionViewController *)self collectionView];
    BOOL v11 = [v10 window];

    if (v11)
    {
      uint64_t v12 = [(GKCollectionViewController *)self gkDataSource];
      double v13 = [(GKCollectionViewController *)self collectionView];
      [v12 collectionViewDidBecomeInactive:v13];
    }
    objc_storeStrong((id *)&self->_dataSource, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v14 = self->_dataSource;
      [(UICollectionViewDataSource *)v14 setDelegate:self];
      uint64_t v15 = [(GKCollectionViewController *)self collectionView];
      double v16 = [v15 window];

      if (v16)
      {
        uint64_t v17 = [(GKCollectionViewController *)self collectionView];
        [(UICollectionViewDataSource *)v14 collectionViewWillBecomeActive:v17];
      }
      double v18 = [(GKCollectionViewController *)self collectionView];
      [(UICollectionViewDataSource *)v14 configureCollectionView:v18];
    }
    if (!self->_hasViewFactories) {
      [(GKCollectionViewController *)self configureViewFactories];
    }
    double v19 = [(GKCollectionViewController *)self collectionView];
    [v19 setDataSource:v5];

    double v20 = [(GKCollectionViewController *)self collectionView];
    double v21 = [v20 collectionViewLayout];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v21 forceFullInvalidate];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UICollectionViewDataSource *)v9 setDelegate:0];
    }
  }
}

- (id)gkDataSource
{
  id v2 = [(GKCollectionViewController *)self dataSource];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = NSString;
      uint64_t v4 = [NSString stringWithFormat:@"Assertion failed"];
      BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [v3 stringWithFormat:@"%@ ([dataSource isKindOfClass:[GKCollectionViewDataSource class]])\n[%s (%s:%d)]", v4, "-[GKCollectionViewController gkDataSource]", objc_msgSend(v6, "UTF8String"), 549];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
    }
  }

  return v2;
}

- (id)defaultColorPalette
{
  return (id)[MEMORY[0x1E4F639B0] sharedPalette];
}

- (GKColorPalette)colorPalette
{
  colorPalette = self->_colorPalette;
  if (colorPalette)
  {
    id v3 = colorPalette;
  }
  else
  {
    id v3 = [(GKCollectionViewController *)self defaultColorPalette];
  }

  return v3;
}

- (void)setColorPalette:(id)a3
{
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setShowsCancelButton:1 animated:0];
  [v4 _setAutoDisableCancelButton:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v13 = v4;
  BOOL v5 = [v4 subviews];
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
        objc_super v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = [v11 _clearButton];
          [v12 removeTarget:self action:sel_clearButtonPressed_ forControlEvents:64];
          [v12 addTarget:self action:sel_clearButtonPressed_ forEvents:64];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(a3, "subviews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          [v10 setClearButtonMode:1];
          id v11 = [v10 _clearButton];
          [v11 removeTarget:self action:sel_clearButtonPressed_ forControlEvents:64];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)clearButtonPressed:(id)a3
{
  [a3 removeTarget:self action:sel_clearButtonPressed_ forControlEvents:64];
  if (self->_activeSearchBar)
  {
    -[GKCollectionViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:");
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 _setAutoDisableCancelButton:1];
  [v4 setShowsCancelButton:0 animated:0];
  [v4 resignFirstResponder];
  [v4 setText:0];

  [(GKCollectionViewController *)self setCurrentSearchText:0];

  [(GKCollectionViewController *)self setActiveSearchBar:0];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  id v5 = [v4 text];

  [(GKCollectionViewController *)self setCurrentSearchText:v5];
}

- (id)currentSearchTerms
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  currentSearchText = self->_currentSearchText;
  uint64_t v5 = [(NSString *)currentSearchText length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__GKCollectionViewController_currentSearchTerms__block_invoke;
  v8[3] = &unk_1E5F640C0;
  id v6 = v3;
  id v9 = v6;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](currentSearchText, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1027, v8);

  return v6;
}

uint64_t __48__GKCollectionViewController_currentSearchTerms__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)invalidateSearch
{
  id v3 = [(GKCollectionViewController *)self dataSource];
  id v4 = [(GKCollectionViewController *)self collectionView];
  uint64_t v5 = [v4 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(NSString *)self->_currentSearchText length])
      {
        id v6 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v7 = [(GKCollectionViewController *)self currentSearchTerms];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46__GKCollectionViewController_invalidateSearch__block_invoke;
        v10[3] = &unk_1E5F65B00;
        id v11 = v3;
        id v12 = v7;
        id v13 = v6;
        id v8 = v6;
        id v9 = v7;
        [v11 enumerateItemsAndIndexPathsUsingBlock:v10];
        [v5 setVisibleIndexPathsFilter:v8];
      }
      else
      {
        [v5 setVisibleIndexPathsFilter:0];
      }
    }
  }
}

void __46__GKCollectionViewController_invalidateSearch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  LODWORD(v5) = objc_msgSend(v5, "item:matchesSearchTerms:inSection:", v7, v6, objc_msgSend(v8, "section"));

  if (v5) {
    [*(id *)(a1 + 48) addObject:v8];
  }
}

- (void)setCurrentSearchText:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  if ([(NSString *)v6 length])
  {
    id v4 = v6;
  }
  else
  {

    id v4 = 0;
  }
  p_currentSearchText = &self->_currentSearchText;
  if (v4 != self->_currentSearchText)
  {
    id v7 = v4;
    objc_storeStrong((id *)p_currentSearchText, v4);
    p_currentSearchText = (NSString **)[(GKCollectionViewController *)self invalidateSearch];
    id v4 = v7;
  }

  MEMORY[0x1F41817F8](p_currentSearchText, v4);
}

- (void)setNeedsReload
{
  if ([(GKCollectionViewController *)self hasLoaded])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__GKCollectionViewController_setNeedsReload__block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __44__GKCollectionViewController_setNeedsReload__block_invoke()
{
  gk_dispatch_debounce();
  dispatch_time_t v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E4F14428], &__block_literal_global_168);
}

uint64_t __44__GKCollectionViewController_setNeedsReload__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setCurrentState:@"RefreshingState"];
  id v2 = *(void **)(a1 + 32);

  return [v2 loadDataWithCompletionHandlerAndError:0];
}

uint64_t __44__GKCollectionViewController_setNeedsReload__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (void)_gkSetContentsNeedUpdateWithHandler:(id)a3
{
  id v5 = a3;
  [(GKCollectionViewController *)self setNeedsReload];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)_finishUpdates:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(GKCollectionViewController *)self gkDataSource];
  id v9 = [(GKCollectionViewController *)self collectionView];
  uint64_t v10 = [v8 numberOfSectionsInCollectionView:v9];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while ([v8 collectionView:v9 numberOfItemsInSection:v12] < 1)
    {
      if (v11 == ++v12) {
        goto LABEL_5;
      }
    }
    long long v16 = GKLoadStateContentLoaded;
  }
  else
  {
LABEL_5:
    id v13 = [v6 error];

    if (v13)
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v14 = (id)GKOSLoggers();
      }
      long long v15 = (void *)*MEMORY[0x1E4F63850];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
        -[GKCollectionViewController _finishUpdates:withCompletionHandler:](v15, (uint64_t)self, (uint64_t)v6);
      }
      long long v16 = &GKLoadStateError;
    }
    else
    {
      long long v16 = GKLoadStateNoContent;
    }
  }
  [(_GKStateMachine *)self->_loadingMachine setCurrentState:*v16];
  if (v7)
  {
    uint64_t v17 = [v6 error];
    v7[2](v7, v17);
  }
}

- (void)_applyUpdates:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_hasViewFactories) {
    [(GKCollectionViewController *)self configureViewFactories];
  }
  id v8 = [(_GKStateMachine *)self->_loadingMachine currentState];
  id v9 = v8;
  if (v8 == @"LoadingState")
  {
  }
  else
  {
    uint64_t v10 = [v6 error];
    if (v10)
    {

LABEL_9:
      [(GKCollectionViewController *)self _finishUpdates:v6 withCompletionHandler:v7];
      [v6 applyUpdates];
      id v13 = [(GKCollectionViewController *)self collectionView];
      [v13 performBatchUpdates:&__block_literal_global_170 completion:0];

      goto LABEL_10;
    }
    uint64_t v11 = [v6 updateCount];

    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v12 = [(GKCollectionViewController *)self collectionView];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E5F62EB0;
  id v18 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5F65B28;
  v14[4] = self;
  id v15 = v18;
  id v16 = v7;
  [v12 performBatchUpdates:v17 completion:v14];

LABEL_10:
}

uint64_t __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyUpdates];
}

uint64_t __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishUpdates:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__GKCollectionViewController_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v12[3] = &unk_1E5F64EB0;
  unsigned int v15 = a3;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __81__GKCollectionViewController_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gkDataSource];
  id v3 = [*(id *)(a1 + 32) collectionView];
  [v2 collectionViewWillBecomeActive:v3];

  id v11 = [*(id *)(a1 + 32) gkDataSource];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1072) currentState];

  if (v4 == @"Initial")
  {
    id v5 = NSString;
    id v6 = [*(id *)(*(void *)(a1 + 32) + 1072) currentState];
    id v7 = [v5 stringWithFormat:@"currentState = %@", v6];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = [v5 stringWithFormat:@"%@ (self->_loadingMachine.currentState != GKLoadStateInitial)\n[%s (%s:%d)]", v7, "-[GKCollectionViewController refreshContentsForDataType:userInfo:updateNotifier:]_block_invoke", objc_msgSend(v9, "UTF8String"), 775];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 refreshContentsForDataType:*(unsigned int *)(a1 + 56) userInfo:*(void *)(a1 + 40) updateNotifier:*(void *)(a1 + 48)];
  }
}

- (void)_loadDataWithCompletionHandlerAndError:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F63828] updateGroup];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke;
  v11[3] = &unk_1E5F64E38;
  v11[4] = self;
  [v5 perform:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke_2;
  v8[3] = &unk_1E5F647F8;
  void v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 join:v8];
}

uint64_t __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) refreshContentsForDataType:0 userInfo:0 updateNotifier:a2];
}

uint64_t __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyUpdates:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  loadingMachine = self->_loadingMachine;
  id v7 = a3;
  id v5 = [(_GKStateMachine *)loadingMachine currentState];
  if (v5 == @"Initial") {
    id v6 = GKLoadStateLoadingContent;
  }
  else {
    id v6 = GKLoadStateRefreshingContent;
  }
  [(_GKStateMachine *)self->_loadingMachine setCurrentState:*v6];

  [(GKCollectionViewController *)self _loadDataWithCompletionHandlerAndError:v7];
}

- (void)_gkRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6 = a4;
  if ([(GKCollectionViewController *)self hasLoaded])
  {
    [(_GKStateMachine *)self->_loadingMachine setCurrentState:@"RefreshingState"];
    id v7 = [MEMORY[0x1E4F63828] updateGroup];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke;
    v11[3] = &unk_1E5F65B50;
    v11[4] = self;
    unsigned int v13 = a3;
    id v12 = v6;
    [v7 perform:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke_2;
    v9[3] = &unk_1E5F63350;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    [v8 join:v9];
  }
}

uint64_t __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) refreshContentsForDataType:*(unsigned int *)(a1 + 48) userInfo:*(void *)(a1 + 40) updateNotifier:a2];
}

uint64_t __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyUpdates:*(void *)(a1 + 40) withCompletionHandler:0];
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:didInsertItemsAtIndexPaths:](v9, self, v7);
  }
  id v10 = [(GKCollectionViewController *)self collectionView];
  [v10 insertItemsAtIndexPaths:v7];
}

- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:didRemoveItemsAtIndexPaths:](v9, self, v7);
  }
  id v10 = [(GKSwipeToEditStateMachine *)self->_swipeStateMachine trackedIndexPath];
  if (v10)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          if (objc_msgSend(v10, "isEqual:", *(void *)(*((void *)&v17 + 1) + 8 * v15), (void)v17)) {
            [(_GKStateMachine *)self->_swipeStateMachine setCurrentState:@"NothingState"];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  id v16 = [(GKCollectionViewController *)self collectionView];
  [v16 deleteItemsAtIndexPaths:v7];
}

- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:didRefreshItemsAtIndexPaths:](v9, self, v7);
  }
  id v10 = [(GKCollectionViewController *)self collectionView];
  [v10 reloadItemsAtIndexPaths:v7];
}

- (void)dataSource:(id)a3 didInsertSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didInsertSections:](v9, self, v7);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    id v10 = [(GKCollectionViewController *)self collectionView];
    [v10 insertSections:v7];
  }
LABEL_6:
}

- (void)dataSource:(id)a3 didRemoveSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didRemoveSections:](v9, self, v7);
    if (!v7) {
      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  id v10 = [(GKSwipeToEditStateMachine *)self->_swipeStateMachine trackedIndexPath];
  id v11 = v10;
  if (v10)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __59__GKCollectionViewController_dataSource_didRemoveSections___block_invoke;
    id v16 = &unk_1E5F63468;
    id v17 = v10;
    long long v18 = self;
    [v7 enumerateIndexesUsingBlock:&v13];
  }
  uint64_t v12 = [(GKCollectionViewController *)self collectionView];
  [v12 deleteSections:v7];

LABEL_8:
}

uint64_t __59__GKCollectionViewController_dataSource_didRemoveSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) section];
  if (result == a2)
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 1144);
    return [v5 setCurrentState:@"NothingState"];
  }
  return result;
}

- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    long long v19 = v12;
    uint64_t v20 = [(GKCollectionViewController *)self currentUpdateID];
    double v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = (__CFString *)v20;
    }
    else {
      uint64_t v22 = &stru_1F07B2408;
    }
    BOOL v23 = [NSString stringWithFormat:@"old: %@ \n new: %@", v9, v10];
    *(_DWORD *)buf = 138413058;
    double v25 = v22;
    __int16 v26 = 2048;
    CATransform3D v27 = self;
    __int16 v28 = 2080;
    double v29 = "-[GKCollectionViewController dataSource:didMoveItemAtIndexPath:toIndexPath:]";
    __int16 v30 = 2112;
    double v31 = v23;
    _os_log_debug_impl(&dword_1AF250000, v19, OS_LOG_TYPE_DEBUG, "****** %@ - GKCVC - c:%p %s \n%@", buf, 0x2Au);

    if (!v9) {
      goto LABEL_6;
    }
  }
  else if (!v9)
  {
LABEL_6:
    uint64_t v13 = NSString;
    uint64_t v14 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m"];
    id v16 = [v15 lastPathComponent];
    id v17 = [v13 stringWithFormat:@"%@ (indexPath != ((void *)0) && newIndexPath != ((void *)0))\n[%s (%s:%d)]", v14, "-[GKCollectionViewController dataSource:didMoveItemAtIndexPath:toIndexPath:]", objc_msgSend(v16, "UTF8String"), 882];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v17 format];
    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_6;
  }
LABEL_7:
  long long v18 = [(GKCollectionViewController *)self collectionView];
  [v18 moveItemAtIndexPath:v9 toIndexPath:v10];
}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v8 = (id)GKOSLoggers();
  }
  uint64_t v9 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didRefreshSections:](v9, self, v7);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    id v10 = [(GKCollectionViewController *)self collectionView];
    [v10 reloadSections:v7];
  }
LABEL_6:
}

- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v8 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v9 = (id)GKOSLoggers();
  }
  uint64_t v10 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:didMoveSection:toSection:](v10, self, a4);
  }
  id v11 = [(GKCollectionViewController *)self collectionView];
  [v11 moveSection:a4 toSection:a5];
}

- (void)dataSource:(id)a3 didUpdatePlaceholderVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = (void *)*MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:didUpdatePlaceholderVisibility:](v8, self);
  }
  id v9 = [(GKCollectionViewController *)self collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setShowPlaceholder:v4];
  }
}

- (void)dataSourceDidReloadData:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    [(GKCollectionViewController *)v6 dataSourceDidReloadData:v4];
  }
  id v7 = [(GKCollectionViewController *)self collectionView];
  [v7 reloadData];
}

- (void)dataSourceDidMoveSectionsWithItems:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    [(GKCollectionViewController *)v6 dataSourceDidMoveSectionsWithItems:v4];
  }
  id v7 = [(GKCollectionViewController *)self collectionView];
  id v8 = [v7 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 prepareForMovingItemsCarryingSections];
  }
}

- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v9 && v10) {
    (*((void (**)(id))v10 + 2))(v10);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F29128]);
  if (!*MEMORY[0x1E4F63860]) {
    id v13 = (id)GKOSLoggers();
  }
  uint64_t v14 = *MEMORY[0x1E4F63838];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    -[GKCollectionViewController dataSource:performBatchUpdate:complete:]((uint64_t)v12, (uint64_t)self, v14);
  }
  uint64_t v15 = [(GKCollectionViewController *)self batchUpdateQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke;
  v19[3] = &unk_1E5F65BF0;
  id v20 = v12;
  double v21 = self;
  id v22 = v9;
  id v23 = v11;
  id v16 = v11;
  id v17 = v9;
  id v18 = v12;
  dispatch_async(v15, v19);
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F636D8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKCollectionViewController.m", 937, "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke");
  id v4 = [v2 dispatchGroupWithName:v3];

  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_cold_1();
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(v6 + 1128))
  {
    id v7 = NSString;
    id v8 = [NSString stringWithFormat:@"Assertion failed"];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m"];
    id v10 = [v9 lastPathComponent];
    id v11 = [v7 stringWithFormat:@"%@ (self->_batchUpdateCount == 0)\n[%s (%s:%d)]", v8, "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke", objc_msgSend(v10, "UTF8String"), 942];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(v6 + 1128) + 1;
  }
  else
  {
    uint64_t v12 = 1;
  }
  *(void *)(v6 + 1128) = v12;
  [*(id *)(a1 + 40) setCurrentUpdateID:*(void *)(a1 + 32)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_2;
  v14[3] = &unk_1E5F65BC8;
  id v13 = *(void **)(a1 + 48);
  v14[4] = *(void *)(a1 + 40);
  id v16 = v13;
  id v15 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  [v4 perform:v14];
  [v4 wait];
  [*(id *)(a1 + 40) setCurrentUpdateID:0];
  --*(void *)(*(void *)(a1 + 40) + 1128);
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_3;
  block[3] = &unk_1E5F65BA0;
  block[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_3(id *a1)
{
  id v2 = [a1[4] collectionView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_4;
  v10[3] = &unk_1E5F639B0;
  id v11 = a1[6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5;
  v5[3] = &unk_1E5F65B78;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[7];
  id v9 = a1[8];
  [v2 performBatchUpdates:v10 completion:v5];
}

uint64_t __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5(uint64_t a1)
{
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63838], OS_LOG_TYPE_DEBUG)) {
    __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5_cold_1();
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)didTouchShowMore:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__GKCollectionViewController_didTouchShowMore___block_invoke;
  v3[3] = &unk_1E5F64620;
  v3[4] = self;
  [a3 enumerateIndexesUsingBlock:v3];
}

void __47__GKCollectionViewController_didTouchShowMore___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) collectionView];
  id v4 = [v7 collectionViewLayout];
  id v5 = [*(id *)(a1 + 32) gkDataSource];
  [v4 prepareForUpdate:4 inDataSource:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 revealMoreForSectionIndex:a2];
    [*(id *)(a1 + 32) dataSource:v5 didRefreshItemsAtIndexPaths:v6];
  }
}

- (id)footerViewAboveShowMoreViewAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__7;
  __int16 v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  uint64_t v5 = [v4 item];
  uint64_t v6 = [v4 section];
  id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 - 1 inSection:v6];
  id v8 = [(GKCollectionViewController *)self collectionView];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __69__GKCollectionViewController_footerViewAboveShowMoreViewAtIndexPath___block_invoke;
  id v17 = &unk_1E5F65C18;
  double v21 = &v22;
  id v18 = self;
  id v9 = v8;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  [v9 _gkPerformWithoutViewReuse:&v14];
  if (objc_msgSend((id)v23[5], "isHidden", v14, v15, v16, v17, v18))
  {
    id v11 = (void *)v23[5];
    v23[5] = 0;
  }
  id v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __69__GKCollectionViewController_footerViewAboveShowMoreViewAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dataSource];
  uint64_t v2 = [v5 collectionView:*(void *)(a1 + 40) viewForSupplementaryElementOfKind:@"SectionFooter" atIndexPath:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)showMoreTextMarginAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(GKCollectionViewController *)self collectionView];
  uint64_t v6 = [v4 item];
  uint64_t v7 = [v4 section];
  CGFloat v8 = 0.0;
  if (v6 < 1)
  {
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v12 = 0.0;
    CGFloat v13 = 0.0;
    double v14 = 0.0;
    CGFloat v15 = 0.0;
    CGFloat v16 = 0.0;
  }
  else
  {
    uint64_t v9 = v7;
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v12 = 0.0;
    CGFloat v13 = 0.0;
    double v14 = 0.0;
    CGFloat v15 = 0.0;
    CGFloat v16 = 0.0;
    if (v7 < [v5 numberOfSections])
    {
      id v17 = [(GKCollectionViewController *)self footerViewAboveShowMoreViewAtIndexPath:v4];
      if (!v17) {
        goto LABEL_7;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_7;
      }
      [v17 layoutIfNeeded];
      [v17 alignmentRectForText];
      CGFloat v16 = v18;
      CGFloat v15 = v19;
      double v14 = v20;
      CGFloat v13 = v21;
      [v17 bounds];
      CGFloat v12 = v22;
      CGFloat v11 = v23;
      CGFloat v10 = v24;
      CGFloat v8 = v25;
      if (v14 == 0.0)
      {
LABEL_7:
        __int16 v26 = [v5 collectionViewLayout];
        uint64_t v27 = [v26 currentMaxVisibleItemCountForSection:v9];

        if (v27 >= 1 && v27 <= [v5 numberOfItemsInSection:v9])
        {
          __int16 v28 = [MEMORY[0x1E4F28D58] indexPathForItem:v27 - 1 inSection:v9];
          double v29 = [(GKCollectionViewController *)self dataSource];
          __int16 v30 = [v29 collectionView:v5 cellForItemAtIndexPath:v28];

          if (v30)
          {
            [v30 layoutIfNeeded];
            [v30 alignmentRectForText];
            CGFloat v16 = v31;
            CGFloat v15 = v32;
            double v14 = v33;
            CGFloat v13 = v34;
            [v30 bounds];
            CGFloat v12 = v35;
            CGFloat v11 = v36;
            CGFloat v10 = v37;
            CGFloat v8 = v38;
          }
        }
      }
    }
  }
  if (GKShouldLayoutRTL())
  {
    v42.origin.x = v12;
    v42.origin.y = v11;
    v42.size.double width = v10;
    v42.size.double height = v8;
    double MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v16;
    v43.origin.y = v15;
    v43.size.double width = v14;
    v43.size.double height = v13;
    double MinX = MaxX - CGRectGetMaxX(v43);
  }
  else
  {
    v44.origin.x = v16;
    v44.origin.y = v15;
    v44.size.double width = v14;
    v44.size.double height = v13;
    double MinX = CGRectGetMinX(v44);
  }

  return MinX;
}

- (void)applyShowMoreLayoutAttributesForShowMoreView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  [(GKCollectionViewController *)self showMoreTextMarginAtIndexPath:a4];
  objc_msgSend(v6, "setTextAlignmentOffset:");
}

- (NSString)loadingState
{
  return [(_GKStateMachine *)self->_loadingMachine currentState];
}

- (void)stateWillChange
{
}

- (void)stateDidChange
{
}

- (void)didEnterNoContentState
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138412290;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_debug_impl(&dword_1AF250000, v1, OS_LOG_TYPE_DEBUG, "%@ has no content and did not override me or called super", (uint8_t *)&v3, 0xCu);
}

- (void)didEnterErrorState
{
  GKGameCenterUIFrameworkBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v3 = GKGetLocalizedStringFromTableInBundle();
  id v4 = GKGameCenterUIFrameworkBundle();
  uint64_t v5 = GKGetLocalizedStringFromTableInBundle();
  [(GKCollectionViewController *)self showPlaceholderWithTitle:v3 message:v5 buttonTitle:0 animated:1 block:0];
}

- (void)didEnterLoadedState
{
}

- (void)_reallyStartLoadingIndicator
{
  int v3 = [(_GKStateMachine *)self->_loadingMachine currentState];

  if (v3 == @"LoadingState")
  {
    if (!self->_loadingIndicatorView)
    {
      id v4 = [(GKCollectionViewController *)self view];
      [v4 bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      CGFloat v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1400]), "initWithFrame:", v6, v8, v10, v12);
      [(GKCollectionViewController *)self setLoadingIndicatorView:v13];

      double v14 = [(GKCollectionViewController *)self loadingIndicatorView];
      [v14 setActivityIndicatorViewStyle:101];

      CGFloat v15 = [MEMORY[0x1E4F639B0] sharedPalette];
      CGFloat v16 = [v15 activityIndicatorColor];
      id v17 = [(GKCollectionViewController *)self loadingIndicatorView];
      [v17 setColor:v16];

      double v18 = [(GKCollectionViewController *)self loadingIndicatorView];
      [v18 setAutoresizingMask:18];

      double v19 = [(GKCollectionViewController *)self view];
      double v20 = [(GKCollectionViewController *)self loadingIndicatorView];
      [v19 addSubview:v20];

      double v21 = [(GKCollectionViewController *)self loadingIndicatorView];
      [v21 setAlpha:0.0];

      [(UIActivityIndicatorView *)self->_loadingIndicatorView startAnimating];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__GKCollectionViewController__reallyStartLoadingIndicator__block_invoke;
      v22[3] = &unk_1E5F62EB0;
      v22[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v22 animations:0.15];
    }
  }
  else
  {
    [(GKCollectionViewController *)self stopLoadingIndicatorWithoutAnimation];
    [(GKCollectionViewController *)self slideInContents];
  }
}

void __58__GKCollectionViewController__reallyStartLoadingIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) loadingIndicatorView];
  [v1 setAlpha:1.0];
}

- (BOOL)hasLoaded
{
  int v3 = [(_GKStateMachine *)self->_loadingMachine currentState];
  if (v3 == @"Initial")
  {
    BOOL v5 = 0;
  }
  else
  {
    id v4 = [(_GKStateMachine *)self->_loadingMachine currentState];
    BOOL v5 = v4 != @"LoadingState";
  }
  return v5;
}

- (void)startLoadingIndicator
{
  if ([(GKCollectionViewController *)self hasLoaded]
    || [(GKCollectionViewController *)self showSupplementaryViewsWhileLoading])
  {
    [(GKCollectionViewController *)self stopLoadingIndicatorWithoutAnimation];
    [(GKCollectionViewController *)self slideInContents];
  }
  else
  {
    [(GKCollectionViewController *)self performSelector:sel__reallyStartLoadingIndicator withObject:0 afterDelay:0.15];
  }
}

- (void)stopLoadingIndicatorWithoutAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__GKCollectionViewController_stopLoadingIndicatorWithoutAnimation__block_invoke;
  v2[3] = &unk_1E5F62EB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __66__GKCollectionViewController_stopLoadingIndicatorWithoutAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 1040))
  {
    [(id)v2 showCollectionView];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 1088) stopAnimating];
  [*(id *)(*(void *)(a1 + 32) + 1088) removeFromSuperview];
  int v3 = *(void **)(a1 + 32);

  return [v3 setLoadingIndicatorView:0];
}

- (void)stopLoadingIndicator
{
  if (self->_loadingIndicatorView)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__GKCollectionViewController_stopLoadingIndicator__block_invoke;
    v4[3] = &unk_1E5F62EB0;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__GKCollectionViewController_stopLoadingIndicator__block_invoke_2;
    v3[3] = &unk_1E5F63198;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.25];
  }
  else if (!self->_placeholderView)
  {
    [(GKCollectionViewController *)self showCollectionView];
  }
  [(GKCollectionViewController *)self slideInContents];
}

void *__50__GKCollectionViewController_stopLoadingIndicator__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1088) setAlpha:0.0];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[130])
  {
    return (void *)[result showCollectionView];
  }
  return result;
}

uint64_t __50__GKCollectionViewController_stopLoadingIndicator__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1088) stopAnimating];
  [*(id *)(*(void *)(a1 + 32) + 1088) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setLoadingIndicatorView:0];
}

- (void)setIsReadyToDisplayData:(BOOL)a3
{
  if (self->_readyToDisplayData != a3)
  {
    [(GKCollectionViewController *)self willChangeValueForKey:@"readyToDisplayData"];
    self->_readyToDisplayData = a3;
    [(GKCollectionViewController *)self didChangeValueForKey:@"readyToDisplayData"];
  }
}

- (void)completeWhenReadyToDisplayData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = NSString;
    double v6 = [NSString stringWithFormat:@"Assertion failed"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m"];
    id v8 = [v7 lastPathComponent];
    double v9 = [v5 stringWithFormat:@"%@ (complete != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKCollectionViewController completeWhenReadyToDisplayData:]", objc_msgSend(v8, "UTF8String"), 1248];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__GKCollectionViewController_completeWhenReadyToDisplayData___block_invoke;
  v12[3] = &unk_1E5F65C40;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  id v11 = (id)[(GKCollectionViewController *)self _gkAddObserverForKeyPath:@"readyToDisplayData" options:5 withBlock:v12];
}

void __61__GKCollectionViewController_completeWhenReadyToDisplayData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a4;
  double v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _gkRemoveObserverWithBlockToken:v8];
  }
}

- (void)slideInContents
{
  if (!self->_didSlideIn)
  {
    if (!self->_readyToDisplayData)
    {
      [(GKCollectionViewController *)self setIsReadyToDisplayData:1];
      [(GKCollectionViewController *)self didBecomeReadyToDisplayData];
    }
    BOOL v3 = [(GKCollectionViewController *)self shouldSlideInContents];
    id v4 = [(GKCollectionViewController *)self collectionView];
    BOOL v5 = [v4 layer];

    if (v3)
    {
      double v6 = [(GKCollectionViewController *)self collectionViewLayout];
      [v6 enableClipView];
      [MEMORY[0x1E4F39CF8] begin];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __45__GKCollectionViewController_slideInContents__block_invoke;
      v33[3] = &unk_1E5F62EB0;
      v33[4] = self;
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v33];
      int v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"sublayerTransform"];
      id v8 = (void *)MEMORY[0x1E4F29238];
      if (v5) {
        [v5 sublayerTransform];
      }
      else {
        memset(v32, 0, sizeof(v32));
      }
      double v14 = [v8 valueWithCATransform3D:v32];
      [v7 setFromValue:v14];

      long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v31[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v31[5] = v15;
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v31[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v31[7] = v16;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v31[0] = *MEMORY[0x1E4F39B10];
      v31[1] = v17;
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v31[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v31[3] = v18;
      double v19 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v31];
      [v7 setToValue:v19];

      [v7 setDuration:0.75];
      id v20 = objc_alloc(MEMORY[0x1E4F39C10]);
      LODWORD(v21) = 1048743772;
      LODWORD(v22) = 1061123680;
      LODWORD(v23) = 1000807911;
      LODWORD(v24) = 1.0;
      double v25 = (void *)[v20 initWithControlPoints:v21 :v22 :v23 :v24];
      [v7 setTimingFunction:v25];

      [v7 setRemovedOnCompletion:1];
      [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v5 addAnimation:v7 forKey:@"slideIn"];
      [MEMORY[0x1E4F39CF8] commit];
      __int16 v26 = (void *)MEMORY[0x1E4FB1EB0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __45__GKCollectionViewController_slideInContents__block_invoke_2;
      v29[3] = &unk_1E5F62EB0;
      id v30 = v5;
      id v9 = v5;
      [v26 performWithoutAnimation:v29];

      BOOL v5 = v6;
    }
    else
    {
      id v9 = [v5 modelLayer];
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v28[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v28[5] = v10;
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v28[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v28[7] = v11;
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v28[0] = *MEMORY[0x1E4F39B10];
      v28[1] = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v28[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v28[3] = v13;
      [v9 setSublayerTransform:v28];
    }

    self->_shouldSlideInContents = 0;
    self->_didSlideIn = 1;
    [(GKCollectionViewController *)self didDisplayData];
    int64_t appearCount = self->_appearCount;
    if (appearCount >= 1)
    {
      [(GKCollectionViewController *)self setNeedsReload];
      int64_t appearCount = self->_appearCount;
    }
    self->_int64_t appearCount = appearCount + 1;
  }
}

void __45__GKCollectionViewController_slideInContents__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 disableClipView];
}

void __45__GKCollectionViewController_slideInContents__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) modelLayer];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v6[5] = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v6[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v6[7] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v6[0] = *MEMORY[0x1E4F39B10];
  v6[1] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v6[3] = v5;
  [v1 setSublayerTransform:v6];
}

- (void)addPlaceholderViewToView:(id)a3
{
}

- (void)showPlaceholderWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 animated:(BOOL)a6 block:(id)a7
{
  BOOL v32 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  long long v15 = [(GKCollectionViewController *)self placeholderView];
  double v33 = [(GKCollectionViewController *)self placeholderNavigationController];
  if (v15)
  {
    long long v16 = [v15 title];
    if ([v16 isEqualToString:v11])
    {
      long long v17 = [v15 message];
      if ([v17 isEqualToString:v12])
      {
        long long v18 = [v15 buttonTitle];
        char v19 = [v18 isEqualToString:v13];

        if (v19) {
          goto LABEL_15;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  id v20 = [(GKCollectionViewController *)self view];
  [v20 bounds];
  double v21 = +[GKPlaceholderView placeholderViewWithTitle:message:frame:](GKPlaceholderView, "placeholderViewWithTitle:message:frame:", v11, v12);
  [(GKCollectionViewController *)self setPlaceholderView:v21];

  [(GKPlaceholderView *)self->_placeholderView setAlpha:0.0];
  [(GKPlaceholderView *)self->_placeholderView setAutoresizingMask:18];
  if (v13 && v14)
  {
    [(_UIContentUnavailableView *)self->_placeholderView setButtonTitle:v13];
    [(_UIContentUnavailableView *)self->_placeholderView setButtonAction:v14];
  }
  [(GKCollectionViewController *)self addPlaceholderViewToView:v20];
  double v22 = [(GKCollectionViewController *)self collectionView];
  [v22 setAlpha:0.0];

  double v23 = (void *)MEMORY[0x1E4FB1EB0];
  id v31 = v13;
  id v24 = v11;
  id v25 = v14;
  id v26 = v12;
  if (v32)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke;
    v40[3] = &unk_1E5F63E80;
    v40[4] = self;
    uint64_t v27 = &v41;
    id v28 = v15;
    id v41 = v28;
    double v29 = &v42;
    id v30 = v33;
    id v42 = v30;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_2;
    v37[3] = &unk_1E5F65C68;
    id v38 = v28;
    id v39 = v30;
    [v23 animateWithDuration:v40 animations:v37 completion:0.25];
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_3;
    v34[3] = &unk_1E5F63E80;
    v34[4] = self;
    uint64_t v27 = &v35;
    id v35 = v15;
    double v29 = &v36;
    id v36 = v33;
    [v23 performWithoutAnimation:v34];
  }

  id v12 = v26;
  id v14 = v25;
  id v11 = v24;
  id v13 = v31;
LABEL_15:
}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 48) view];
  [v2 setAlpha:0.0];
}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 removeFromSuperview];
}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 48) view];
  [v2 setAlpha:0.0];

  [*(id *)(a1 + 40) removeFromSuperview];
  id v3 = [*(id *)(a1 + 48) view];
  [v3 removeFromSuperview];
}

- (void)hidePlaceholderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = self->_placeholderView;
  double v6 = self->_placeholderNavigationController;
  if (v5)
  {
    [(_UIContentUnavailableView *)v5 setButtonAction:0];
    int v7 = (void *)MEMORY[0x1E4FB1EB0];
    if (v3)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke;
      v16[3] = &unk_1E5F63E80;
      long long v17 = v5;
      long long v18 = v6;
      char v19 = self;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_2;
      v12[3] = &unk_1E5F643B0;
      id v13 = v17;
      id v14 = v18;
      long long v15 = self;
      [v7 animateWithDuration:v16 animations:v12 completion:0.25];

      id v8 = v17;
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_3;
      v9[3] = &unk_1E5F63E80;
      v9[4] = self;
      long long v10 = v5;
      id v11 = v6;
      [v7 performWithoutAnimation:v9];

      id v8 = v10;
    }
  }
}

uint64_t __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 setAlpha:0.0];

  BOOL v3 = *(void **)(a1 + 48);

  return [v3 showCollectionView];
}

void *__54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 removeFromSuperview];

  uint64_t result = *(void **)(a1 + 48);
  if (result[130] == *(void *)(a1 + 32))
  {
    [result setPlaceholderView:0];
    uint64_t result = *(void **)(a1 + 48);
  }
  if (result[131] == *(void *)(a1 + 40))
  {
    return (void *)[result setPlaceholderNavigationController:0];
  }
  return result;
}

void *__54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_3(id *a1)
{
  [a1[4] showCollectionView];
  [a1[5] setAlpha:0.0];
  id v2 = [a1[6] view];
  [v2 setAlpha:0.0];

  [a1[5] removeFromSuperview];
  BOOL v3 = [a1[6] view];
  [v3 removeFromSuperview];

  uint64_t result = a1[4];
  if ((id)result[130] == a1[5])
  {
    [result setPlaceholderView:0];
    uint64_t result = a1[4];
  }
  if ((id)result[131] == a1[6])
  {
    return (void *)[result setPlaceholderNavigationController:0];
  }
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  long long v4 = [(_GKStateMachine *)self->_swipeStateMachine currentState];
  char v5 = [v4 isEqualToString:@"NothingState"];

  return v5;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v17 = a4;
  id v9 = a6;
  reusableViewsIHaveSeen = self->_reusableViewsIHaveSeen;
  id v11 = a3;
  [(NSMapTable *)reusableViewsIHaveSeen setObject:v17 forKey:v17];
  id v12 = [v11 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 attributesForSupplementaryIndexPath:v9];
    id v14 = [v13 supplementaryMetrics];
    if (![v14 configurator])
    {
LABEL_11:

      goto LABEL_12;
    }
    long long v15 = [v14 target];
    if (v15) {
      goto LABEL_4;
    }
    long long v16 = [v13 dataSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = objc_msgSend(v16, "targetForAction:", objc_msgSend(v14, "configurator"));

      if (v15)
      {
LABEL_4:
        if ([v14 configurator]) {
          objc_msgSend(v15, (SEL)objc_msgSend(v14, "configurator"), v17, v9, v14);
        }
      }
    }
    else
    {

      long long v15 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)clearSelectionHighlight
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [(GKCollectionViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForSelectedItems];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        [v2 deselectItemAtIndexPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) animated:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setShouldSlideInContents:(BOOL)a3
{
  self->_shouldSlideInContents = a3;
}

- (UICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)showSupplementaryViewsWhileLoading
{
  return self->_showSupplementaryViewsWhileLoading;
}

- (void)setShowSupplementaryViewsWhileLoading:(BOOL)a3
{
  self->_showSupplementaryViewsWhileLoading = a3;
}

- (BOOL)readyToDisplayData
{
  return self->_readyToDisplayData;
}

- (GKPlaceholderView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (UINavigationController)placeholderNavigationController
{
  return self->_placeholderNavigationController;
}

- (void)setPlaceholderNavigationController:(id)a3
{
}

- (GKSearchBar)activeSearchBar
{
  return self->_activeSearchBar;
}

- (void)setActiveSearchBar:(id)a3
{
}

- (NSString)currentSearchText
{
  return self->_currentSearchText;
}

- (GKLoadableContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
}

- (UICollectionViewLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setDefaultLayout:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)hasViewFactories
{
  return self->_hasViewFactories;
}

- (void)setHasViewFactories:(BOOL)a3
{
  self->_hasViewFactories = a3;
}

- (BOOL)didSlideIn
{
  return self->_didSlideIn;
}

- (void)setDidSlideIn:(BOOL)a3
{
  self->_didSlideIn = a3;
}

- (int64_t)appearCount
{
  return self->_appearCount;
}

- (void)setAppearCount:(int64_t)a3
{
  self->_int64_t appearCount = a3;
}

- (NSMapTable)reusableViewsIHaveSeen
{
  return self->_reusableViewsIHaveSeen;
}

- (void)setReusableViewsIHaveSeen:(id)a3
{
}

- (OS_dispatch_queue)batchUpdateQueue
{
  return self->_batchUpdateQueue;
}

- (void)setBatchUpdateQueue:(id)a3
{
}

- (int64_t)batchUpdateCount
{
  return self->_batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->_batchUpdateCount = a3;
}

- (NSUUID)currentUpdateID
{
  return (NSUUID *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setCurrentUpdateID:(id)a3
{
}

- (GKSwipeToEditStateMachine)swipeStateMachine
{
  return self->_swipeStateMachine;
}

- (void)setSwipeStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeStateMachine, 0);
  objc_storeStrong((id *)&self->_currentUpdateID, 0);
  objc_storeStrong((id *)&self->_batchUpdateQueue, 0);
  objc_storeStrong((id *)&self->_reusableViewsIHaveSeen, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_currentSearchText, 0);
  objc_storeStrong((id *)&self->_activeSearchBar, 0);
  objc_storeStrong((id *)&self->_placeholderNavigationController, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_colorPalette, 0);
}

- (void)shutActionPaneAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKCollectionViewController *)self swipeStateMachine];
  [v4 shutActionPaneForEditingCellAnimated:v3];
}

- (void)swipeToDeleteCell:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(GKCollectionViewController *)self gkDataSource];
    long long v8 = [(GKCollectionViewController *)self collectionView];
    long long v9 = [v8 indexPathForCell:v4];

    if (self->_activeSearchBar)
    {
      long long v10 = [v6 visibleIndexPathsFilter];
      uint64_t v11 = [v10 count];
      if (v11 >= 1)
      {
        id v24 = v7;
        id v25 = v6;
        id v26 = v5;
        id v27 = v4;
        id v12 = [MEMORY[0x1E4F1CA80] setWithCapacity:v11 - 1];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        double v23 = v10;
        id v13 = v10;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v19 = [v18 section];
              if (v19 == [v9 section]
                && (uint64_t v20 = [v18 item], v20 > objc_msgSend(v9, "item")))
              {
                double v21 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v18, "item") - 1, objc_msgSend(v18, "section"));
                [v12 addObject:v21];
              }
              else if (([v18 isEqual:v9] & 1) == 0)
              {
                [v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v15);
        }

        uint64_t v6 = v25;
        [v25 setVisibleIndexPathsFilter:v12];

        uint64_t v5 = v26;
        id v4 = v27;
        uint64_t v7 = v24;
        long long v10 = v23;
      }
    }
    id v22 = (id)objc_msgSend(v6, "revealMoreForSectionIndex:revealCount:andDeleteItemCount:", objc_msgSend(v9, "section"), self->_activeSearchBar == 0, 1);
    [v6 prepareForUpdate:0 inDataSource:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__GKCollectionViewController_GKSwipeToEditSupport__swipeToDeleteCell___block_invoke;
    v28[3] = &unk_1E5F65C68;
    v28[4] = self;
    id v29 = v6;
    [v7 removeItemAtIndexPath:v9 completionHandler:v28];
  }
}

uint64_t __70__GKCollectionViewController_GKSwipeToEditSupport__swipeToDeleteCell___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) shutActionPaneAnimated:1];
    BOOL v3 = *(void **)(v2 + 40);
    return [v3 prepareForUpdate:6 inDataSource:0];
  }
  return result;
}

- (void)setSkipLoadAfterViewDidLoad:(BOOL)a3
{
  self->_skipLoadAfterViewDidLoad = a3;
}

- (BOOL)skipLoadAfterViewDidLoad
{
  return self->_skipLoadAfterViewDidLoad;
}

- (void)showCollectionView
{
  BOOL v3 = [(GKCollectionViewController *)self collectionView];
  [v3 setAlpha:1.0];

  id v4 = [(GKCollectionViewController *)self collectionView];
  [v4 flashScrollIndicators];
}

- (void)willDismissActionSheetFromCell:(id)a3
{
}

- (void)_finishUpdates:(uint64_t)a3 withCompletionHandler:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1AF250000, v4, OS_LOG_TYPE_ERROR, "%@ ERROR: %@", (uint8_t *)&v6, 0x16u);
}

- (void)dataSource:(void *)a1 didUpdatePlaceholderVisibility:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  uint64_t v4 = [a2 currentUpdateID];
  int v6 = (void *)v4;
  id v7 = &stru_1F07B2408;
  if (v4) {
    id v7 = (__CFString *)v4;
  }
  int v8 = 138412802;
  uint64_t v9 = v7;
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2080;
  id v13 = "-[GKCollectionViewController dataSource:didUpdatePlaceholderVisibility:]";
  OUTLINED_FUNCTION_9(&dword_1AF250000, v3, v5, "****** %@ - GKCVC - c:%p %s", (uint8_t *)&v8);
}

- (void)dataSource:(uint64_t)a1 performBatchUpdate:(uint64_t)a2 complete:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2080;
  int v8 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]";
  OUTLINED_FUNCTION_9(&dword_1AF250000, a3, (uint64_t)a3, "****** %@ - GKCVC INIT - ds:%p %s", (uint8_t *)&v3);
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  int v3 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke";
  OUTLINED_FUNCTION_9(&dword_1AF250000, v0, v1, "****** %@ - GKCVC START - ds:%p %s", v2);
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  int v3 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke_5";
  OUTLINED_FUNCTION_9(&dword_1AF250000, v0, v1, "****** %@ - GKCVC END - ds:%p %s", v2);
}

@end