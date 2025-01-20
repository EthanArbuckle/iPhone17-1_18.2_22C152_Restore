@interface CKSearchViewController
- (BOOL)_currentModeIsDetails;
- (BOOL)_hasSearchBarInput;
- (BOOL)_hasSelectedItemAtIndexPath:(id *)a3;
- (BOOL)_isSectionShowingTokenSuggestions:(int64_t)a3;
- (BOOL)_needsIndexing;
- (BOOL)_shouldHideShowAllButtonForController:(id)a3;
- (BOOL)_wantsInternalDebugInformation;
- (BOOL)canShowTokenSuggestions;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)contextMenuInteractionShouldBegin:(id)a3;
- (BOOL)conversationSearchHasResult;
- (BOOL)dismissingSearchController;
- (BOOL)isInitialLoad;
- (BOOL)searchControllerCanShowSectionHeader:(id)a3;
- (BOOL)searchInProgress;
- (BOOL)shouldInsetResultsForSearchController:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKContainerSearchControllerDelegate)delegate;
- (CKConversationListCellLayout)cellLayout;
- (CKSearchCollectionView)collectionView;
- (CKSearchViewController)initWithSearchControllerClasses:(id)a3;
- (Class)_searchResultsHeaderClass;
- (IMSpotlightClientStateMonitor)clientStateMonitor;
- (IMTimingCollection)timingCollection;
- (NSArray)searchControllers;
- (NSArray)searchControllersWithResults;
- (NSArray)visibleSearchControllers;
- (NSDictionary)_searchControllerMap;
- (NSMutableSet)searchCompleteControllerSet;
- (NSString)searchText;
- (UICollectionViewCompositionalLayout)collectionViewLayout;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3;
- (double)containerWidthForController:(id)a3;
- (double)widthForDeterminingAvatarVisibility;
- (id)_identifiersToAppendForResults:(id)a3;
- (id)_newSnapshotForCurrentControllerState;
- (id)_spotlightClientState;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 forSupplementaryViewKind:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)contextMenusForConversation:(id)a3;
- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4;
- (id)globalLayoutConfiguration;
- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4;
- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4;
- (id)layoutSectionForSection:(int64_t)a3 withEnvironment:(id)a4;
- (id)performAfterInitialLoadBlock;
- (id)searchController:(id)a3 cellForResult:(id)a4;
- (id)searchController:(id)a3 conversationForChatGUID:(id)a4;
- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4;
- (id)searchTokenFiltersForSearchController:(id)a3;
- (int64_t)_indexForExistingConversationToken:(id)a3;
- (int64_t)rowIndexFindNextForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4;
- (int64_t)rowIndexFindPreviousForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4;
- (unint64_t)mode;
- (void)__updateSectionHeadersAtIndexPaths:(id)a3 elementKind:(id)a4;
- (void)_configureIndexingCell:(id)a3;
- (void)_hideInlineSearchSuggestions;
- (void)_insertTokenToSearchTextField:(id)a3;
- (void)_registerCells;
- (void)_searchImmediately;
- (void)_selectItemForFindAtIndexPath:(id)a3;
- (void)_updateSectionHeaders;
- (void)cancelCurrentQuery;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)findNext;
- (void)findPrevious;
- (void)loadView;
- (void)reloadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchController:(id)a3 requestsPresentationOfAlertController:(id)a4 atRect:(CGRect)a5;
- (void)searchController:(id)a3 requestsPresentationOfShareController:(id)a4 atRect:(CGRect)a5;
- (void)searchControllerContentsDidChange:(id)a3;
- (void)searchEnded;
- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3;
- (void)searchWithText:(id)a3;
- (void)setCanShowTokenSuggestions:(BOOL)a3;
- (void)setCellLayout:(id)a3;
- (void)setClientStateMonitor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissingSearchController:(BOOL)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPerformAfterInitialLoadBlock:(id)a3;
- (void)setSearchCompleteControllerSet:(id)a3;
- (void)setSearchControllers:(id)a3;
- (void)setSearchControllersWithResults:(id)a3;
- (void)setSearchInProgress:(BOOL)a3;
- (void)setSearchText:(id)a3;
- (void)setTimingCollection:(id)a3;
- (void)setVisibleSearchControllers:(id)a3;
- (void)set_searchControllerMap:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKSearchViewController

- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 customLayoutSectionForEnvironment:v7];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    [v10 contentInsets];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    v19 = [v6 layoutGroupWithEnvironment:v7];
    id v10 = [MEMORY[0x1E4F42630] sectionWithGroup:v19];
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 searchResultsInsets];
    double v12 = v21;
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
  }
  [v10 setSupplementariesFollowContentInsets:0];
  if ([v6 applyLayoutMarginsToLayoutGroup])
  {
    v25 = [(CKSearchViewController *)self collectionView];
    [v25 marginInsets];
    double v14 = v14 + v26;

    v27 = [(CKSearchViewController *)self collectionView];
    [v27 marginInsets];
    double v18 = v18 + v28;
  }
  [v6 additionalGroupInsets];
  objc_msgSend(v10, "setContentInsets:", v12 + v29, v14 + v30, v16 + v32, v18 + v31);
  [v6 interGroupSpacing];
  objc_msgSend(v10, "setInterGroupSpacing:");
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v34 = [(CKSearchViewController *)self headerBoundryItemsForController:v6 withEnvironment:v7];
  if (v34) {
    [v33 addObjectsFromArray:v34];
  }
  v35 = [(CKSearchViewController *)self footerBoundryItemsForController:v6 withEnvironment:v7];
  if (v35) {
    [v33 addObjectsFromArray:v35];
  }
  [v10 setBoundarySupplementaryItems:v33];
  objc_msgSend(v10, "setOrthogonalScrollingBehavior:", objc_msgSend((id)objc_opt_class(), "orthogonalScrollingBehavior"));
  id v36 = v10;

  return v36;
}

- (void)setDelegate:(id)a3
{
}

- (CKSearchViewController)initWithSearchControllerClasses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKSearchViewController;
  v5 = [(CKSearchViewController *)&v23 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = objc_alloc_init(CKConversationListCellLayout);
    [(CKSearchViewController *)v5 setCellLayout:v6];

    [(CKSearchViewController *)v5 setIsInitialLoad:1];
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_alloc_init(*(Class *)(*((void *)&v19 + 1) + 8 * v12));
          double v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setDelegate:", v5, (void)v19);
            [v7 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    [(CKSearchViewController *)v5 setSearchControllers:v7];
    double v15 = objc_opt_new();
    [(CKSearchViewController *)v5 setSearchCompleteControllerSet:v15];

    double v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v17 = [v16 isSemanticSearchEnabled];

    if (v17) {
      [MEMORY[0x1E4F23890] prepare];
    }
  }
  return v5;
}

- (void)setSearchControllers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_searchControllers, a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        if (objc_msgSend((id)objc_opt_class(), "isVisibleInCollectionView", (void)v20)) {
          [v6 addObject:v13];
        }
        double v14 = (objc_class *)objc_opt_class();
        double v15 = NSStringFromClass(v14);
        [v7 setObject:v13 forKey:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  double v16 = (NSArray *)[v6 copy];
  visibleSearchControllers = self->_visibleSearchControllers;
  self->_visibleSearchControllers = v16;

  double v18 = (NSDictionary *)[v7 copy];
  searchControllerMap = self->__searchControllerMap;
  self->__searchControllerMap = v18;
}

- (void)setSearchCompleteControllerSet:(id)a3
{
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void)setCellLayout:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CKSearchViewController;
  [(CKViewController *)&v22 viewWillAppear:a3];
  if ([(CKSearchViewController *)self mode] == 2)
  {
    id v4 = [(CKSearchViewController *)self visibleSearchControllers];
    id v5 = [v4 firstObject];

    id v6 = [(CKSearchViewController *)self searchText];
    id v7 = [v5 navigationBarTitleSummaryForSearchText:v6];
  }
  else
  {
    if ([(CKSearchViewController *)self mode] == 4)
    {
      id v8 = [(CKSearchViewController *)self visibleSearchControllers];
      id v5 = [v8 firstObject];

      [(id)objc_opt_class() sectionTitle];
    }
    else
    {
      id v5 = CKFrameworkBundle();
      [v5 localizedStringForKey:@"SEARCH" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v7 = };
  }

  [(CKSearchViewController *)self setTitle:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(CKSearchViewController *)self collectionView];
  uint64_t v10 = [v9 indexPathsForSelectedItems];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        double v16 = [(CKSearchViewController *)self collectionView];
        [v16 deselectItemAtIndexPath:v15 animated:1];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  int v17 = [(CKSearchViewController *)self navigationItem];
  [v17 setLargeTitleDisplayMode:2];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CKSearchCollectionView)collectionView
{
  return self->_collectionView;
}

- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 wantsHeaderSection])
  {
    id v7 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    id v8 = (void *)MEMORY[0x1E4F42608];
    uint64_t v9 = +[CKUIBehavior sharedBehaviors];
    [v9 searchHeaderHeight];
    uint64_t v10 = objc_msgSend(v8, "estimatedDimension:");

    uint64_t v11 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v10];
    if ([v5 headerOverrideClass]) {
      uint64_t v12 = (objc_class *)[v5 headerOverrideClass];
    }
    else {
      uint64_t v12 = [(CKSearchViewController *)self _searchResultsHeaderClass];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F425F8];
    uint64_t v14 = [(objc_class *)v12 supplementaryViewType];
    uint64_t v15 = [v13 boundarySupplementaryItemWithLayoutSize:v11 elementKind:v14 alignment:1];

    double v16 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v15, "setPinToVisibleBounds:", objc_msgSend(v16, "searchSectionHeadersPinToBounds"));

    [v15 setZIndex:101];
    [v6 addObject:v15];
  }

  return v6;
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v3 = [(CKSearchViewController *)self collectionView];
  [v3 setSuppressDatasourceUpdates:1];

  id v4 = [(CKSearchViewController *)self collectionView];
  id v5 = [(CKSearchViewController *)self contextMenuInteraction];
  [v4 removeInteraction:v5];

  [(CKSearchViewController *)self setContextMenuInteraction:0];
  v6.receiver = self;
  v6.super_class = (Class)CKSearchViewController;
  [(CKSearchViewController *)&v6 dealloc];
}

- (void)loadView
{
  v34.receiver = self;
  v34.super_class = (Class)CKSearchViewController;
  [(CKSearchViewController *)&v34 loadView];
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F42870]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __34__CKSearchViewController_loadView__block_invoke;
  v31[3] = &unk_1E5621E10;
  objc_copyWeak(&v32, &location);
  id v4 = (void *)[v3 initWithSectionProvider:v31];
  [(CKSearchViewController *)self setCollectionViewLayout:v4];
  id v5 = [(CKSearchViewController *)self collectionViewLayout];
  objc_super v6 = [(CKSearchViewController *)self globalLayoutConfiguration];
  id v7 = (void *)[v6 copy];
  [v5 setConfiguration:v7];

  id v8 = [CKSearchCollectionView alloc];
  uint64_t v9 = [(CKSearchViewController *)self view];
  [v9 bounds];
  uint64_t v10 = -[CKSearchCollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v4);

  [(CKSearchCollectionView *)v10 setAutoresizingMask:18];
  [(CKSearchCollectionView *)v10 setDelegate:self];
  [(CKSearchViewController *)self setCollectionView:v10];
  uint64_t v11 = [(CKSearchViewController *)self view];
  [v11 addSubview:v10];

  [(CKSearchViewController *)self _registerCells];
  uint64_t v12 = [(CKSearchViewController *)self collectionView];
  uint64_t v13 = +[CKUIBehavior sharedBehaviors];
  uint64_t v14 = [v13 theme];
  uint64_t v15 = [v14 spotlightSearchBackgroundColor];
  [v12 setBackgroundColor:v15];

  double v16 = [(CKSearchViewController *)self collectionView];
  [v16 setAlwaysBounceVertical:1];

  int v17 = [(CKSearchViewController *)self collectionView];
  [v17 setAlwaysBounceHorizontal:0];

  id v18 = objc_alloc(MEMORY[0x1E4F42880]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__CKSearchViewController_loadView__block_invoke_2;
  v29[3] = &unk_1E5625CD0;
  objc_copyWeak(&v30, &location);
  long long v19 = (void *)[v18 initWithCollectionView:v10 cellProvider:v29];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  double v26 = __34__CKSearchViewController_loadView__block_invoke_3;
  v27 = &unk_1E5625CF8;
  objc_copyWeak(&v28, &location);
  [v19 setSupplementaryViewProvider:&v24];
  -[CKSearchViewController setDataSource:](self, "setDataSource:", v19, v24, v25, v26, v27);
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F428F8]) initWithDelegate:self];
  [(CKSearchViewController *)self setContextMenuInteraction:v20];

  long long v21 = [(CKSearchViewController *)self collectionView];
  objc_super v22 = [(CKSearchViewController *)self contextMenuInteraction];
  [v21 addInteraction:v22];

  long long v23 = [(CKSearchViewController *)self collectionView];
  [v23 setDragDelegate:self];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __34__CKSearchViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained layoutSectionForSection:a2 withEnvironment:v5];

  return v7;
}

id __34__CKSearchViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_super v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = [WeakRetained cellForItemInCollectionView:v9 atIndexPath:v8 withIdentifier:v7];

  return v11;
}

id __34__CKSearchViewController_loadView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_super v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = [WeakRetained cellForSupplementaryItemInCollectionView:v9 atIndexPath:v7 forSupplementaryViewKind:v8];

  return v11;
}

- (void)_registerCells
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKSearchViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  id v5 = +[CKSearchResultsTitleHeaderCell supplementaryViewType];
  objc_super v6 = +[CKSearchResultsTitleHeaderCell reuseIdentifier];
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v6];

  id v7 = [(CKSearchViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  id v9 = +[CKSearchAvatarSupplementryView supplementaryViewType];
  uint64_t v10 = +[CKSearchAvatarSupplementryView reuseIdentifier];
  [v7 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v10];

  uint64_t v11 = [(CKSearchViewController *)self collectionView];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType];
  uint64_t v14 = +[CKPhotosSearchResultsModeHeaderReusableView reuseIdentifier];
  [v11 registerClass:v12 forSupplementaryViewOfKind:v13 withReuseIdentifier:v14];

  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v15 = [(CKSearchViewController *)self collectionView];
    uint64_t v16 = objc_opt_class();
    int v17 = +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType];
    id v18 = +[CKPhotosSearchResultsTitleHeaderCell reuseIdentifier];
    [v15 registerClass:v16 forSupplementaryViewOfKind:v17 withReuseIdentifier:v18];
  }
  long long v19 = [(CKSearchViewController *)self collectionView];
  uint64_t v20 = objc_opt_class();
  long long v21 = +[CKSearchIndexingFooterCell supplementaryViewType];
  objc_super v22 = +[CKSearchIndexingFooterCell reuseIdentifier];
  [v19 registerClass:v20 forSupplementaryViewOfKind:v21 withReuseIdentifier:v22];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(CKSearchViewController *)self visibleSearchControllers];
  uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(obj);
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        double v26 = [(id)objc_opt_class() supportedCellClasses];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v37;
          do
          {
            uint64_t v30 = 0;
            do
            {
              if (*(void *)v37 != v29) {
                objc_enumerationMutation(v26);
              }
              double v31 = *(void **)(*((void *)&v36 + 1) + 8 * v30);
              if (v31)
              {
                id v32 = [(CKSearchViewController *)self collectionView];
                id v33 = [v31 reuseIdentifier];
                [v32 registerClass:v31 forCellWithReuseIdentifier:v33];
              }
              ++v30;
            }
            while (v28 != v30);
            uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v28);
        }

        ++v25;
      }
      while (v25 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v24);
  }
}

- (void)viewDidLayoutSubviews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CKSearchViewController;
  [(CKSearchViewController *)&v27 viewDidLayoutSubviews];
  if ([(CKSearchViewController *)self mode] == 3 || [(CKSearchViewController *)self mode] == 4)
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 searchDetailsLeadingAndTrailingMaxPadding];
  }
  else
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 searchLeadingAndTrailingMaxPadding];
  }
  double v5 = v4;

  objc_super v6 = [(CKSearchViewController *)self collectionView];
  char v7 = [v6 insetsLayoutMarginsFromSafeArea];

  if (v7)
  {
    double v8 = v5;
  }
  else
  {
    id v9 = [(CKSearchViewController *)self view];
    [v9 safeAreaInsets];
    double v11 = v10;
    double v8 = v12;

    if (v11 >= v5) {
      double v13 = v11;
    }
    else {
      double v13 = v5;
    }
    if (v8 < v5) {
      double v8 = v5;
    }
    double v5 = v13;
  }
  uint64_t v14 = [(CKSearchViewController *)self collectionView];
  objc_msgSend(v14, "setMarginInsets:", 0.0, v5, 0.0, v8);

  if ([(CKSearchViewController *)self isInitialLoad])
  {
    [(CKSearchViewController *)self setIsInitialLoad:0];
    uint64_t v15 = [(CKSearchViewController *)self performAfterInitialLoadBlock];

    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = CKStringFromSearchControllerMode([(CKSearchViewController *)self mode]);
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Performing deferred load search block. mode={%@}", buf, 0xCu);
        }
      }
      id v18 = [(CKSearchViewController *)self performAfterInitialLoadBlock];
      v18[2]();

      [(CKSearchViewController *)self setPerformAfterInitialLoadBlock:0];
    }
  }
  [(CKScrollViewController *)self updateScrollGeometryWithInheritedAnimationForReason:@"LayoutSubviews"];
  if ([(CKSearchViewController *)self mode] == 2)
  {
    long long v19 = [(CKSearchViewController *)self collectionView];
    [v19 contentInset];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double v26 = [(CKSearchViewController *)self collectionView];
    objc_msgSend(v26, "setContentInset:", 0.0, v21, v23, v25);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CKSearchViewController;
  id v8 = a4;
  -[CKSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__CKSearchViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E562C408;
  v9[4] = self;
  v9[5] = a2;
  [v8 animateAlongsideTransition:v9 completion:0];
}

uint64_t __77__CKSearchViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cellLayout];

  if (!v2)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    [v6 handleFailureInMethod:v7, v8, @"CKSearchViewController.m", 293, @"%@ needs a cell layout.", v10 object file lineNumber description];
  }
  id v3 = [*(id *)(a1 + 32) cellLayout];
  [v3 invalidate];

  uint64_t result = CKIsRunningInMacCatalyst();
  if (!result)
  {
    double v5 = *(void **)(a1 + 32);
    return [v5 _searchImmediately];
  }
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSearchViewController;
  [(CKViewController *)&v4 viewDidDisappear:a3];
  [(CKSearchViewController *)self searchEnded];
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  id v4 = [(CKSearchViewController *)self collectionView];
  [v4 setMode:a3];
}

- (id)layoutSectionForSection:(int64_t)a3 withEnvironment:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        int64_t v15 = a3;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a layout section for a section we don't have! section is %lu", (uint8_t *)&v14, 0xCu);
      }
    }
    double v11 = 0;
  }
  else
  {
    id v9 = [(CKSearchViewController *)self searchControllersWithResults];
    objc_super v10 = [v9 objectAtIndex:a3];

    double v11 = [(CKSearchViewController *)self layoutSectionForController:v10 withEnvironment:v6];
  }

  return v11;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [v10 section];
  double v13 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v14 = [v13 count];

  if (v12 >= v14)
  {
    if (IMOSLoggingEnabled())
    {
      double v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a cell for a section we don't have!", buf, 2u);
      }
    }
    int v17 = 0;
  }
  else
  {
    int64_t v15 = [(CKSearchViewController *)self searchControllersWithResults];
    uint64_t v16 = [v15 objectAtIndex:v12];

    int v17 = [v16 cellForItemInCollectionView:v9 atIndexPath:v10 withIdentifier:v11];
    if (objc_opt_respondsToSelector())
    {
      id v18 = [(CKSearchViewController *)self cellLayout];

      if (!v18)
      {
        double v23 = [MEMORY[0x1E4F28B00] currentHandler];
        double v24 = (objc_class *)objc_opt_class();
        double v25 = NSStringFromClass(v24);
        [v23 handleFailureInMethod:a2, self, @"CKSearchViewController.m", 387, @"%@ needs a cell layout.", v25 object file lineNumber description];
      }
      long long v19 = [(CKSearchViewController *)self cellLayout];
      [v17 setCellLayout:v19];
    }
    double v20 = [(CKSearchViewController *)self collectionView];
    objc_msgSend(v17, "_ck_setEditing:", objc_msgSend(v20, "_ck_isEditing"));
  }

  return v17;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 forSupplementaryViewKind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v9 section];
  unint64_t v12 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v13 = [v12 count];

  if (v11 >= v13)
  {
    int64_t v15 = 0;
  }
  else
  {
    unint64_t v14 = [(CKSearchViewController *)self searchControllersWithResults];
    int64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "section"));
  }
  if ([v15 headerOverrideClass] && CKIsRunningInMacCatalyst()) {
    uint64_t v16 = (objc_class *)[v15 headerOverrideClass];
  }
  else {
    uint64_t v16 = [(CKSearchViewController *)self _searchResultsHeaderClass];
  }
  int v17 = [(objc_class *)v16 supplementaryViewType];
  int v18 = [v10 isEqualToString:v17];

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && CKIsRunningInMacCatalyst())
    {
      long long v19 = +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType];
      double v20 = +[CKPhotosSearchResultsTitleHeaderCell reuseIdentifier];
      double v21 = [v8 dequeueReusableSupplementaryViewOfKind:v19 withReuseIdentifier:v20 forIndexPath:v9];

      double v22 = [v21 control];
      [v22 addTarget:v15 action:sel__filterControlTapped_ forControlEvents:4096];

      double v23 = [(CKSearchViewController *)self view];
      [v23 frame];
      [v21 updateSegmentedControlToFitWidth:v24];
    }
    else
    {
      double v23 = [(objc_class *)[(CKSearchViewController *)self _searchResultsHeaderClass] supplementaryViewType];
      uint64_t v29 = [(objc_class *)[(CKSearchViewController *)self _searchResultsHeaderClass] reuseIdentifier];
      double v21 = [v8 dequeueReusableSupplementaryViewOfKind:v23 withReuseIdentifier:v29 forIndexPath:v9];
    }
    if (v15)
    {
      [v21 setDelegate:self];
      uint64_t v30 = [(id)objc_opt_class() sectionTitle];
      [v21 setTitle:v30];

      double v31 = [v21 showAllButton];
      objc_msgSend(v31, "setHidden:", -[CKSearchViewController _shouldHideShowAllButtonForController:](self, "_shouldHideShowAllButtonForController:", v15));

      objc_msgSend(v21, "setSectionIndex:", objc_msgSend(v9, "section"));
      uint64_t v32 = [v9 section];
      uint64_t v33 = v32 - 1;
      if (v32 >= 1
        && [(CKSearchViewController *)self _isSectionShowingTokenSuggestions:v33])
      {
        objc_super v34 = +[CKUIBehavior sharedBehaviors];
        [v34 searchSuggestionsSeparatorLeadingInset];
        objc_msgSend(v21, "setLeadingSeparatorInsets:");
      }
      else
      {
        objc_msgSend(v21, "setLeadingSeparatorInsets:", v33, 0.0);
      }
    }
  }
  else
  {
    double v25 = +[CKSearchIndexingFooterCell supplementaryViewType];
    int v26 = [v10 isEqualToString:v25];

    if (v26)
    {
      objc_super v27 = +[CKSearchIndexingFooterCell supplementaryViewType];
      uint64_t v28 = +[CKSearchIndexingFooterCell reuseIdentifier];
      double v21 = [v8 dequeueReusableSupplementaryViewOfKind:v27 withReuseIdentifier:v28 forIndexPath:v9];

      [(CKSearchViewController *)self _configureIndexingCell:v21];
    }
    else
    {
      double v21 = [v15 cellForSupplementaryItemInCollectionView:v8 atIndexPath:v9 supplementaryViewKind:v10];
    }
  }

  return v21;
}

- (BOOL)_isSectionShowingTokenSuggestions:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  double v5 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  uint64_t v7 = [(CKSearchViewController *)self searchControllersWithResults];
  id v8 = [v7 objectAtIndex:a3];

  if ([v8 isTokenizationSearchController])
  {
    id v9 = [v8 results];
    BOOL v10 = [v9 count] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (IMSpotlightClientStateMonitor)clientStateMonitor
{
  clientStateMonitor = self->_clientStateMonitor;
  if (!clientStateMonitor)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6BF80]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__CKSearchViewController_clientStateMonitor__block_invoke;
    v8[3] = &unk_1E562C430;
    v8[4] = self;
    double v5 = (IMSpotlightClientStateMonitor *)[v4 initWithChangeHandler:v8];
    unint64_t v6 = self->_clientStateMonitor;
    self->_clientStateMonitor = v5;

    clientStateMonitor = self->_clientStateMonitor;
  }

  return clientStateMonitor;
}

void __44__CKSearchViewController_clientStateMonitor__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CKSearchViewController_clientStateMonitor__block_invoke_2;
  block[3] = &unk_1E5620C40;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__CKSearchViewController_clientStateMonitor__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (id)_spotlightClientState
{
  v2 = [(CKSearchViewController *)self clientStateMonitor];
  id v3 = [v2 clientState];

  return v3;
}

- (void)_configureIndexingCell:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  double v5 = [(CKSearchViewController *)self visibleSearchControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v55 + 1) + 8 * i) hasMoreResults])
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v4 setTitleLabelHidden:v6];
  if (![(CKSearchViewController *)self _needsIndexing])
  {
    id v14 = 0;
    BOOL v10 = 0;
    goto LABEL_21;
  }
  if ([(CKSearchViewController *)self mode] == 1)
  {
    id v9 = CKFrameworkBundle();
    BOOL v10 = [v9 localizedStringForKey:@"SEARCH_SUGGESTIONS_INDEXING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    unint64_t v11 = CKFrameworkBundle();
    unint64_t v12 = v11;
    unint64_t v13 = @"SEARCH_SUGGESTIONS_INDEXING_SUBTITLE";
LABEL_19:
    id v14 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_20;
  }
  if ([(CKSearchViewController *)self mode] != 2 && [(CKSearchViewController *)self mode] != 4)
  {
    uint64_t v16 = CKFrameworkBundle();
    BOOL v10 = [v16 localizedStringForKey:@"SEARCH_RESULTS_INDEXING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    unint64_t v11 = CKFrameworkBundle();
    unint64_t v12 = v11;
    unint64_t v13 = @"SEARCH_RESULTS_INDEXING_SUBTITLE";
    goto LABEL_19;
  }
  int64_t v15 = [(CKSearchViewController *)self visibleSearchControllers];
  unint64_t v12 = [v15 firstObject];

  id v14 = [(id)objc_opt_class() indexingString];
  BOOL v10 = 0;
LABEL_20:

LABEL_21:
  if ([(CKSearchViewController *)self _wantsInternalDebugInformation])
  {
    int v17 = MEMORY[0x192FBA040](@"com.apple.IMCoreSpotlight", @"IMCSIndexLastIndexDate");
    int v18 = [v17 description];
    if (v18)
    {
      long long v19 = [v17 description];
    }
    else
    {
      double v20 = CKFrameworkBundle();
      long long v19 = [v20 localizedStringForKey:@"SEARCH_RESULTS_INTERNAL_NO_DATE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    if ([(CKSearchViewController *)self _needsIndexing])
    {
      double v21 = [(CKSearchViewController *)self _spotlightClientState];
      if (v21)
      {
        uint64_t v22 = IMGetCachedDomainIntForKeyWithDefaultValue();
        v52 = [(CKSearchViewController *)self _spotlightClientState];
        uint64_t v23 = [v52 lastIndexedRowID];
        v54 = v19;
        uint64_t v24 = [v52 initialReindexRowID];
        uint64_t v25 = [v52 indexRevision];
        int v26 = [MEMORY[0x1E4F6E700] descriptionForReindexReason:v22];
        objc_msgSend(NSString, "stringWithFormat:", @"%lu / %lu", v24 - v23, v24);
        objc_super v27 = v53 = v21;
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v25);
        uint64_t v29 = NSString;
        uint64_t v30 = CKFrameworkBundle();
        double v31 = [v30 localizedStringForKey:@"SEARCH_RESULTS_INDEXING_INTERNAL" value:&stru_1EDE4CA38 table:@"ChatKit"];
        uint64_t v32 = objc_msgSend(v29, "stringWithFormat:", v31, v26, v27, v28, v54);

        uint64_t v33 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v34 = [v33 userInterfaceLayoutDirection];

        BOOL v35 = v34 == 1;
        long long v19 = v54;
        if (v35) {
          long long v36 = @"\u200F";
        }
        else {
          long long v36 = @"\u200E";
        }
        long long v37 = [(__CFString *)v36 stringByAppendingString:v32];

        long long v38 = v52;
        double v21 = v53;
      }
      else
      {
        v45 = NSString;
        uint64_t v46 = CKFrameworkBundle();
        v47 = [v46 localizedStringForKey:@"LOADING_SEARCH_RESULTS_INDEXING_STATE_INTERNAL" value:&stru_1EDE4CA38 table:@"ChatKit"];
        long long v38 = [v45 stringWithFormat:v47];

        v48 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v49 = [v48 userInterfaceLayoutDirection];

        if (v49 == 1) {
          v50 = @"\u200F";
        }
        else {
          v50 = @"\u200E";
        }
        long long v37 = [(__CFString *)v50 stringByAppendingString:v38];
      }
    }
    else
    {
      long long v39 = NSString;
      long long v40 = CKFrameworkBundle();
      long long v41 = [v40 localizedStringForKey:@"SEARCH_RESULTS_INTERNAL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v21 = objc_msgSend(v39, "stringWithFormat:", v41, v19);

      long long v42 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v43 = [v42 userInterfaceLayoutDirection];

      if (v43 == 1) {
        v44 = @"\u200F";
      }
      else {
        v44 = @"\u200E";
      }
      long long v37 = [(__CFString *)v44 stringByAppendingString:v21];
    }

    if (v14)
    {
      uint64_t v51 = [NSString stringWithFormat:@"%@\n\n%@", v14, v37];

      id v14 = (id)v51;
    }
    else
    {
      id v14 = v37;
    }
  }
  [v4 setTitleString:v10];
  [v4 setSubtitleString:v14];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 section];
  id v9 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    unint64_t v11 = [(CKSearchViewController *)self searchControllersWithResults];
    unint64_t v12 = [v11 objectAtIndex:v8];

    unint64_t v13 = [v7 row];
    id v14 = [v12 results];
    unint64_t v15 = [v14 count];

    if (v13 < v15)
    {
      uint64_t v34 = self;
      uint64_t v16 = [v12 results];
      id v35 = v7;
      uint64_t v33 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v7, "row"));

      [MEMORY[0x1E4F1CA48] array];
      v37 = long long v36 = v6;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      int v17 = [v6 indexPathsForVisibleItems];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if ([v22 section] == v8)
            {
              unint64_t v23 = [v22 row];
              uint64_t v24 = [v12 results];
              unint64_t v25 = [v24 count];

              if (v23 < v25)
              {
                int v26 = [v12 results];
                objc_super v27 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v22, "row"));

                [v37 addObject:v27];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v19);
      }

      [v12 didSelectResult:v33 visibleResults:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CKSearchViewController *)v34 _insertTokenToSearchTextField:v33];
        id v7 = v35;
        id v6 = v36;
        [v36 deselectItemAtIndexPath:v35 animated:0];
      }
      else
      {
        uint64_t v28 = [v33 conversation];
        uint64_t v29 = [v28 chat];
        uint64_t v30 = [v29 guid];

        double v31 = [(CKSearchViewController *)v34 delegate];
        uint64_t v32 = [v33 messageGUID];
        [v31 searchController:v34 didSelectItem:v32 inChat:v30];

        id v7 = v35;
        id v6 = v36;
      }
    }
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(CKSearchViewController *)self delegate];
  [v4 searchControllerDidBeginDragging:self];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = +[CKUIBehavior sharedBehaviors];
  if ([v5 searchSectionHeadersPinToBounds])
  {
    int v4 = [(CKSearchViewController *)self isViewLoaded];

    if (v4)
    {
      [(CKSearchViewController *)self _updateSectionHeaders];
    }
  }
  else
  {
  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v12 = a4;
  id v8 = a5;
  id v9 = [(objc_class *)[(CKSearchViewController *)self _searchResultsHeaderClass] supplementaryViewType];
  if ([v8 isEqualToString:v9])
  {
  }
  else
  {
    unint64_t v10 = +[CKPhotosSearchResultsModeHeaderReusableView supplementaryViewType];
    int v11 = [v8 isEqualToString:v10];

    if (!v11) {
      goto LABEL_5;
    }
  }
  [v12 setNeedsLayout];
  [v12 layoutIfNeeded];
LABEL_5:
}

- (void)_updateSectionHeaders
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(objc_class *)[(CKSearchViewController *)self _searchResultsHeaderClass] supplementaryViewType];
  v18[0] = v3;
  int v4 = +[CKPhotosSearchResultsTitleHeaderCell supplementaryViewType];
  v18[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = -[CKSearchCollectionView indexPathsForVisibleSupplementaryElementsOfKind:](self->_collectionView, "indexPathsForVisibleSupplementaryElementsOfKind:", v11, (void)v13);
        [(CKSearchViewController *)self __updateSectionHeadersAtIndexPaths:v12 elementKind:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)__updateSectionHeadersAtIndexPaths:(id)a3 elementKind:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v37 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8 * v9);
        uint64_t v11 = [(CKSearchCollectionView *)self->_collectionView collectionViewLayout];
        id v12 = [v11 layoutAttributesForItemAtIndexPath:v10];

        if (v12)
        {
          [v12 frame];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          double v21 = [(CKSearchCollectionView *)self->_collectionView supplementaryViewForElementKind:v37 atIndexPath:v10];
          if (v21)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v33 = (objc_class *)objc_opt_class();
              uint64_t v34 = NSStringFromClass(v33);
              [v32 handleFailureInMethod:a2, self, @"CKSearchViewController.m", 643, @"Found a cell ('%@') with an unexpected class. Expected the cell to be an instance of %@.", v21, v34 object file lineNumber description];
            }
            collectionView = self->_collectionView;
            [v21 frame];
            double MaxY = CGRectGetMaxY(v44);
            [(CKSearchCollectionView *)collectionView contentScaleFactor];
            double v25 = round(MaxY * v24) / v24;
            int v26 = self->_collectionView;
            v45.origin.x = v14;
            v45.origin.y = v16;
            v45.size.double width = v18;
            v45.size.double height = v20;
            double MinY = CGRectGetMinY(v45);
            [(CKSearchCollectionView *)v26 contentScaleFactor];
            [v21 setPinnedEffectVisible:round(MinY * v28) / v28 < v25];
            if (CKIsRunningInMacCatalyst())
            {
              uint64_t v29 = +[CKUIBehavior sharedBehaviors];
              uint64_t v30 = [v29 theme];
              double v31 = [v30 spotlightSearchSegmentedControlBackgroundColor];
              [v21 setBackgroundColor:v31];
            }
            else
            {
              [v21 setBackgroundColor:0];
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }
}

- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    [(CKSearchViewController *)self _searchResultHeaderButtonTapped:v4];
  }
  else
  {
    unint64_t v5 = [v4 sectionIndex];
    uint64_t v6 = [(CKSearchViewController *)self searchControllersWithResults];
    unint64_t v7 = [v6 count];

    if (v5 < v7)
    {
      uint64_t v8 = [(CKSearchViewController *)self searchControllersWithResults];
      uint64_t v9 = [v8 objectAtIndex:v5];

      v21[0] = objc_opt_class();
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = (objc_class *)objc_opt_class();
          double v13 = NSStringFromClass(v12);
          int v19 = 138412290;
          CGFloat v20 = v13;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "'Show All' button tapped for controller {%@}.", (uint8_t *)&v19, 0xCu);
        }
      }
      CGFloat v14 = [[CKSearchViewController alloc] initWithSearchControllerClasses:v10];
      [(CKSearchViewController *)v14 setMode:2];
      double v15 = [(CKSearchViewController *)self delegate];
      [(CKSearchViewController *)v14 setDelegate:v15];

      CGFloat v16 = [(CKSearchViewController *)self searchText];
      [(CKSearchViewController *)v14 setSearchText:v16];

      double v17 = [(CKSearchViewController *)self delegate];
      [v17 searchViewController:self requestsPushOfSearchController:v14];

      CGFloat v18 = [(CKSearchViewController *)self searchText];
      [(CKSearchViewController *)v14 searchWithText:v18];
    }
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isActive];
  if (v5 && !self->_dismissingSearchController)
  {
    uint64_t v10 = [v4 searchBar];
    uint64_t v11 = [v10 text];

    [(CKSearchViewController *)self searchWithText:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = @"NO";
      BOOL dismissingSearchController = self->_dismissingSearchController;
      if (v5) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      int v12 = 136315650;
      double v13 = "-[CKSearchViewController updateSearchResultsForSearchController:]";
      __int16 v14 = 2112;
      double v15 = v9;
      if (dismissingSearchController) {
        unint64_t v7 = @"YES";
      }
      __int16 v16 = 2112;
      double v17 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%s Not searching because ([searchController isActive]==[%@] || dismissingSearchController==[%@])", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_hideInlineSearchSuggestions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(CKSearchViewController *)self searchControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v3);
      }
      unint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
      uint64_t v8 = objc_opt_class();
      if (v8 == objc_opt_class()) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v7;

    if (!v9) {
      goto LABEL_12;
    }
    [v9 discardSuggestionResults];
    uint64_t v10 = [(CKSearchViewController *)self collectionView];
    uint64_t v11 = [v10 collectionViewLayout];
    [v11 invalidateLayout];

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_reloadData object:0];
    [(CKSearchViewController *)self reloadData];
  }
  else
  {
LABEL_9:

LABEL_12:
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v13 = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Unable to find the tokenization search controller within self.searchControllers.", v13, 2u);
      }
    }
  }
}

- (void)_insertTokenToSearchTextField:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(CKSearchViewController *)self delegate];
  uint64_t v5 = [v4 searchBarForSearchViewController:self];

  uint64_t v6 = [v5 searchTextField];
  unint64_t v7 = [v6 tokens];
  uint64_t v8 = [v7 count];

  id v9 = [v13 associatedStagedFilter];

  if (v9)
  {
    uint64_t v10 = [v13 associatedStagedFilter];
    int64_t v11 = [(CKSearchViewController *)self _indexForExistingConversationToken:v10];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 removeTokenAtIndex:v11];
      uint64_t v8 = v11;
    }
  }
  int v12 = [v13 searchToken];
  [v6 insertToken:v12 atIndex:v8];

  [v6 setText:&stru_1EDE4CA38];
  [(CKSearchViewController *)self searchWithText:&stru_1EDE4CA38];
}

- (BOOL)_hasSearchBarInput
{
  id v3 = [(CKSearchViewController *)self delegate];
  uint64_t v4 = [v3 searchBarForSearchViewController:self];

  uint64_t v5 = [v4 searchTextField];
  uint64_t v6 = [v5 text];
  if ([v6 length])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v4 searchTextField];
    id v9 = [v8 tokens];
    BOOL v7 = [v9 count] != 0;
  }
  return v7;
}

- (void)searchWithText:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __41__CKSearchViewController_searchWithText___block_invoke;
  uint64_t v10 = &unk_1E5620AF8;
  int64_t v11 = self;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = (void (**)(void))_Block_copy(&v7);
  if ([(CKSearchViewController *)self isInitialLoad]) {
    [(CKSearchViewController *)self setPerformAfterInitialLoadBlock:v6];
  }
  else {
    v6[2](v6);
  }
}

void __41__CKSearchViewController_searchWithText___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) mode] == 1 && (objc_msgSend(*(id *)(a1 + 32), "_hasSearchBarInput") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Already in ZKW mode, not reloading", (uint8_t *)&v19, 2u);
      }
LABEL_16:
    }
  }
  else
  {
    if (![*(id *)(a1 + 32) mode])
    {
      if ([*(id *)(a1 + 40) length])
      {
        uint64_t v10 = [*(id *)(a1 + 32) searchText];
        int v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

        if (v11)
        {
          if (!IMOSLoggingEnabled()) {
            return;
          }
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Search text has not changed, not reloading", (uint8_t *)&v19, 2u);
          }
          goto LABEL_16;
        }
      }
    }
    id v2 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [*(id *)(a1 + 32) setTimingCollection:v2];
    [v2 startTimingForKey:@"Search"];
    [v2 startTimingForKey:@"CSSearch"];
    if ([*(id *)(a1 + 40) length])
    {
      unint64_t v3 = [*(id *)(a1 + 40) length];
      int v4 = IMOSLoggingEnabled();
      if (v3 < 3)
      {
        if (v4)
        {
          long long v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User is typing and has not met the minimum search text length, deferring search for a longer duration", (uint8_t *)&v19, 2u);
          }
        }
        long long v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = (id *)(a1 + 32);
        [v16 setSearchText:v17];
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*v18 selector:sel__searchImmediately object:0];
        [*v18 performSelector:sel__searchImmediately withObject:0 afterDelay:0.8];
      }
      else
      {
        if (v4)
        {
          id v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            uint64_t v6 = CKStringFromSearchControllerMode([*(id *)(a1 + 32) mode]);
            int v19 = 138412290;
            CGFloat v20 = v6;
            _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "User is typing, deferring search in mode={%@}", (uint8_t *)&v19, 0xCu);
          }
        }
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = (id *)(a1 + 32);
        [v7 setSearchText:v8];
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*v9 selector:sel__searchImmediately object:0];
        [*v9 performSelector:sel__searchImmediately withObject:0 afterDelay:0.4];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          long long v14 = CKStringFromSearchControllerMode([*(id *)(a1 + 32) mode]);
          int v19 = 138412290;
          CGFloat v20 = v14;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "New or current search text is zero len, searching now! in mode={%@}", (uint8_t *)&v19, 0xCu);
        }
      }
      [*(id *)(a1 + 32) setSearchText:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _searchImmediately];
    }
  }
}

- (void)_searchImmediately
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(CKSearchViewController *)self setSearchInProgress:1];
  unint64_t v3 = [(CKSearchViewController *)self searchCompleteControllerSet];
  [v3 removeAllObjects];

  int v19 = [(CKSearchViewController *)self searchText];
  [(CKSearchViewController *)self cancelCurrentQuery];
  unint64_t v4 = [(CKSearchViewController *)self mode];
  if (v4 != 2 && ![(CKSearchViewController *)self _currentModeIsDetails]) {
    unint64_t v4 = [(CKSearchViewController *)self _hasSearchBarInput] ^ 1;
  }
  [(CKSearchViewController *)self setMode:v4];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v19 length];
      uint64_t v7 = CKStringFromSearchControllerMode([(CKSearchViewController *)self mode]);
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      double v28 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Search started targeting all searchControllers with textLength={%lu} mode={%@}.", buf, 0x16u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(CKSearchViewController *)self searchControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if ((objc_msgSend(MEMORY[0x1E4F6E730], "supportsSpotlight", v18) & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "searchWithText:mode:", v19, -[CKSearchViewController mode](self, "mode"));
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            long long v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              long long v15 = objc_opt_class();
              *(_DWORD *)buf = v18;
              uint64_t v26 = (uint64_t)v15;
              id v16 = v15;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "not processing %@, spotlight is not supported.", buf, 0xCu);
            }
          }
          uint64_t v17 = [(CKSearchViewController *)self searchCompleteControllerSet];
          [v17 addObject:objc_opt_class()];

          [(CKSearchViewController *)self searchControllerContentsDidChange:v13];
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)searchControllerContentsDidChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKSearchViewController *)self searchInProgress] && IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v31 = 138412290;
      *(void *)&void v31[4] = objc_opt_class();
      id v6 = *(id *)&v31[4];
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%@ checked in but search ended, dropping", v31, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x1E4FBA8A8], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadData, 0, *(_OWORD *)v31);
  uint64_t v7 = [(CKSearchViewController *)self searchCompleteControllerSet];
  [v7 addObject:objc_opt_class()];

  uint64_t v8 = [(CKSearchViewController *)self searchCompleteControllerSet];
  unint64_t v9 = [v8 count];

  long long v10 = [(CKSearchViewController *)self searchControllers];
  unint64_t v11 = [v10 count];

  int v12 = IMOSLoggingEnabled();
  if (v9 >= v11)
  {
    if (v12)
    {
      int v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = [(CKSearchViewController *)self searchCompleteControllerSet];
        uint64_t v21 = [v20 count];
        id v22 = (id)objc_opt_class();
        long long v23 = [(CKSearchViewController *)self searchControllers];
        uint64_t v24 = [v23 count];
        *(_DWORD *)double v31 = 134218498;
        *(void *)&void v31[4] = v21;
        *(_WORD *)&v31[12] = 2112;
        *(void *)&v31[14] = v22;
        __int16 v32 = 2048;
        uint64_t v33 = v24;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, updating now", v31, 0x20u);
      }
    }
    [(CKSearchViewController *)self reloadData];
    double v25 = [(CKSearchViewController *)self collectionViewLayout];
    uint64_t v26 = [(CKSearchViewController *)self globalLayoutConfiguration];
    __int16 v27 = (void *)[v26 copy];
    [v25 setConfiguration:v27];

    double v28 = [(CKSearchViewController *)self timingCollection];
    [v28 stopTimingForKey:@"Search"];

    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = [(CKSearchViewController *)self timingCollection];
        *(_DWORD *)double v31 = 138412290;
        *(void *)&void v31[4] = v30;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Search timing %@", v31, 0xCu);
      }
    }
  }
  else
  {
    if (v12)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = [(CKSearchViewController *)self searchCompleteControllerSet];
        uint64_t v15 = [v14 count];
        id v16 = (id)objc_opt_class();
        uint64_t v17 = [(CKSearchViewController *)self searchControllers];
        uint64_t v18 = [v17 count];
        *(_DWORD *)double v31 = 134218498;
        *(void *)&void v31[4] = v15;
        *(_WORD *)&v31[12] = 2112;
        *(void *)&v31[14] = v16;
        __int16 v32 = 2048;
        uint64_t v33 = v18;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, delaying update", v31, 0x20u);
      }
    }
    [(CKSearchViewController *)self performSelector:sel_reloadData withObject:0 afterDelay:0.5];
  }
}

- (id)searchController:(id)a3 conversationForChatGUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CKSearchViewController *)self delegate];
  uint64_t v7 = [v6 searchController:self conversationForChatGUID:v5];

  return v7;
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(CKSearchViewController *)self delegate];
  uint64_t v7 = [v6 searchController:self conversationsForExistingChatsWithGUIDs:v5];

  return v7;
}

- (void)searchController:(id)a3 requestsPresentationOfShareController:(id)a4 atRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a4;
  long long v10 = [v14 popoverPresentationController];

  if (v10)
  {
    unint64_t v11 = [(CKSearchViewController *)self view];
    int v12 = [v14 popoverPresentationController];
    [v12 setSourceView:v11];

    id v13 = [v14 popoverPresentationController];
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);
  }
  [(CKSearchViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)searchController:(id)a3 requestsPresentationOfAlertController:(id)a4 atRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a4;
  long long v10 = [v14 popoverPresentationController];

  if (v10)
  {
    unint64_t v11 = [(CKSearchViewController *)self view];
    int v12 = [v14 popoverPresentationController];
    [v12 setSourceView:v11];

    id v13 = [v14 popoverPresentationController];
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);
  }
  [(CKSearchViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (id)contextMenusForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchViewController *)self delegate];
  id v6 = [v5 contextMenusForConversation:v4];

  return v6;
}

- (id)searchTokenFiltersForSearchController:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(CKSearchViewController *)self delegate];
  id v6 = [v5 searchBarForSearchViewController:self];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend(v6, "searchTextField", 0);
  uint64_t v8 = [v7 tokens];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) representedObject];
        [v4 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v4;
}

- (int64_t)_indexForExistingConversationToken:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchViewController *)self delegate];
  id v6 = [v5 searchBarForSearchViewController:self];

  uint64_t v7 = [v6 searchTextField];
  uint64_t v8 = [v7 tokens];

  if ([v8 count])
  {
    int64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = [v8 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 representedObject];
      int v12 = [v11 conversation];
      id v13 = [v4 conversation];

      if (v12 == v13) {
        break;
      }
      if (++v9 >= (unint64_t)[v8 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchViewController *)self delegate];
  char v6 = [v5 shouldInsetResultsForSearchController:v4];

  return v6;
}

- (BOOL)searchControllerCanShowSectionHeader:(id)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  int v6 = CKIsRunningInMacCatalyst();
  BOOL result = 1;
  if (!v6 && v4 == v5) {
    return ![(CKSearchViewController *)self canShowTokenSuggestions];
  }
  return result;
}

- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3
{
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 searchSectionMarginInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)widthForDeterminingAvatarVisibility
{
  id v2 = [(CKSearchViewController *)self collectionView];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (double)containerWidthForController:(id)a3
{
  double v4 = [(CKSearchViewController *)self collectionView];
  [v4 bounds];
  double Width = CGRectGetWidth(v11);
  double v6 = [(CKSearchViewController *)self collectionView];
  [v6 safeAreaInsets];
  double v9 = Width - (v7 + v8);

  return v9;
}

- (id)searchController:(id)a3 cellForResult:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = [(CKSearchViewController *)self collectionView];
  double v6 = [v5 visibleCells];

  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&unk_1EDF7DD10])
        {
          if (objc_opt_respondsToSelector())
          {
            CGRect v11 = [v10 resultIdentifier];
            double v12 = [v15 identifier];
            char v13 = [v11 isEqual:v12];

            if (v13)
            {
              id v7 = v10;
              goto LABEL_13;
            }
          }
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (void)setCanShowTokenSuggestions:(BOOL)a3
{
  if (self->_canShowTokenSuggestions != a3)
  {
    self->_canShowTokenSuggestions = a3;
    if (!a3) {
      [(CKSearchViewController *)self _hideInlineSearchSuggestions];
    }
  }
}

- (void)cancelCurrentQuery
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "> BEGIN cancelling all search controllers.", buf, 2u);
    }
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = [(CKSearchViewController *)self searchControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancelCurrentSearch];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "> END cancelling all search controllers.", buf, 2u);
    }
  }
}

- (void)searchEnded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Search ended", buf, 2u);
    }
  }
  [(CKSearchViewController *)self setSearchInProgress:0];
  [(CKSearchViewController *)self setSearchText:&stru_1EDE4CA38];
  double v4 = [(CKSearchViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(CKSearchViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(CKSearchViewController *)self setMode:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(CKSearchViewController *)self searchControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 cancelCurrentSearch];
        [v10 searchEnded];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  long long v11 = [(CKSearchViewController *)self contextMenuInteraction];

  if (v11)
  {
    long long v12 = [(CKSearchViewController *)self contextMenuInteraction];
    [v12 dismissMenu];
  }
}

- (void)findNext
{
  double v3 = [(CKSearchViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:1];

  id v11 = 0;
  BOOL v5 = [(CKSearchViewController *)self _hasSelectedItemAtIndexPath:&v11];
  id v6 = v11;
  uint64_t v7 = v6;
  int64_t v8 = 0;
  long long v9 = (void *)MEMORY[0x1E4F28D58];
  if (v5) {
    int64_t v8 = -[CKSearchViewController rowIndexFindNextForIndex:numberOfTotalItems:](self, "rowIndexFindNextForIndex:numberOfTotalItems:", objc_msgSend(v6, "row", 0), v4);
  }
  long long v10 = [v9 indexPathForRow:v8 inSection:1];
  [(CKSearchViewController *)self _selectItemForFindAtIndexPath:v10];
}

- (void)findPrevious
{
  double v3 = [(CKSearchViewController *)self collectionView];
  uint64_t v4 = [v3 numberOfItemsInSection:1];

  id v11 = 0;
  BOOL v5 = [(CKSearchViewController *)self _hasSelectedItemAtIndexPath:&v11];
  id v6 = v11;
  uint64_t v7 = v6;
  int64_t v8 = (void *)MEMORY[0x1E4F28D58];
  if (v5) {
    int64_t v9 = -[CKSearchViewController rowIndexFindPreviousForIndex:numberOfTotalItems:](self, "rowIndexFindPreviousForIndex:numberOfTotalItems:", [v6 row], v4);
  }
  else {
    int64_t v9 = v4 - 1;
  }
  long long v10 = [v8 indexPathForRow:v9 inSection:1];
  [(CKSearchViewController *)self _selectItemForFindAtIndexPath:v10];
}

- (BOOL)conversationSearchHasResult
{
  LODWORD(v3) = [(CKSearchViewController *)self isViewLoaded];
  if (v3)
  {
    uint64_t v3 = [(CKSearchViewController *)self collectionView];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      BOOL v5 = [(CKSearchViewController *)self collectionView];
      uint64_t v6 = [v5 numberOfSections];

      if (v6 < 2)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        uint64_t v7 = [(CKSearchViewController *)self collectionView];
        uint64_t v8 = [v7 numberOfItemsInSection:1];

        LOBYTE(v3) = v8 > 0;
      }
    }
  }
  return v3;
}

- (BOOL)_hasSelectedItemAtIndexPath:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(CKSearchViewController *)self collectionView];
  BOOL v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 section] == 1)
        {
          *a3 = v10;
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_selectItemForFindAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKSearchViewController *)self collectionView];
  [v5 selectItemAtIndexPath:v4 animated:1 scrollPosition:0];

  id v6 = [(CKSearchViewController *)self collectionView];
  [(CKSearchViewController *)self collectionView:v6 didSelectItemAtIndexPath:v4];
}

- (int64_t)rowIndexFindNextForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4
{
  return (a3 + 1) % a4;
}

- (int64_t)rowIndexFindPreviousForIndex:(int64_t)a3 numberOfTotalItems:(int64_t)a4
{
  return (a3 + a4 - 1) % a4;
}

- (void)reloadData
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Asked to reload search collection view contents.", buf, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v5 = [(CKSearchViewController *)self visibleSearchControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        BOOL v10 = [(CKSearchViewController *)self mode] == 4 || [(CKSearchViewController *)self mode] == 2;
        BOOL v11 = [v9 results];
        if ([v11 count]) {
          BOOL v10 = 1;
        }

        if (v10) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }

  long long v12 = (NSArray *)[v4 copy];
  searchControllersWithResults = self->_searchControllersWithResults;
  self->_searchControllersWithResults = v12;

  id v14 = [(CKSearchViewController *)self _newSnapshotForCurrentControllerState];
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Updating search collection view by applying snapshot!", buf, 2u);
    }
  }
  long long v16 = [(CKSearchViewController *)self dataSource];
  [v16 applySnapshotUsingReloadData:v14];

  long long v17 = [(CKSearchViewController *)self collectionView];
  uint64_t v18 = [v17 visibleCells];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __36__CKSearchViewController_reloadData__block_invoke;
  v31[3] = &unk_1E562C458;
  void v31[4] = self;
  [v18 enumerateObjectsUsingBlock:v31];

  uint64_t v19 = +[CKSearchAvatarSupplementryView supplementaryViewType];
  uint64_t v20 = [(CKSearchViewController *)self collectionView];
  uint64_t v21 = [v20 indexPathsForVisibleSupplementaryElementsOfKind:v19];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __36__CKSearchViewController_reloadData__block_invoke_2;
  v29[3] = &unk_1E5627AD8;
  void v29[4] = self;
  id v30 = v19;
  id v22 = v19;
  [v21 enumerateObjectsUsingBlock:v29];

  long long v23 = [(objc_class *)[(CKSearchViewController *)self _searchResultsHeaderClass] supplementaryViewType];
  uint64_t v24 = [(CKSearchViewController *)self collectionView];
  double v25 = [v24 indexPathsForVisibleSupplementaryElementsOfKind:v23];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __36__CKSearchViewController_reloadData__block_invoke_3;
  v27[3] = &unk_1E5627AD8;
  v27[4] = self;
  id v28 = v23;
  id v26 = v23;
  [v25 enumerateObjectsUsingBlock:v27];
}

void __36__CKSearchViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) searchText];
    [v4 refreshForSearchTextIfNeeded:v3];
  }
}

void __36__CKSearchViewController_reloadData__block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  unint64_t v3 = [v10 section];
  id v4 = [*(id *)(a1 + 32) searchControllersWithResults];
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) searchControllersWithResults];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v10, "section"));

    uint64_t v8 = [*(id *)(a1 + 32) collectionView];
    int64_t v9 = [v8 supplementaryViewForElementKind:*(void *)(a1 + 40) atIndexPath:v10];

    [v7 updateSupplementryViewIfNeeded:v9 atIndexPath:v10];
  }
}

void __36__CKSearchViewController_reloadData__block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  unint64_t v3 = [v11 section];
  id v4 = [*(id *)(a1 + 32) searchControllersWithResults];
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) searchControllersWithResults];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v11, "section"));

    uint64_t v8 = [*(id *)(a1 + 32) collectionView];
    int64_t v9 = [v8 supplementaryViewForElementKind:*(void *)(a1 + 40) atIndexPath:v11];

    id v10 = [v9 showAllButton];
    objc_msgSend(v10, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideShowAllButtonForController:", v7));

    objc_msgSend(v9, "setSectionIndex:", objc_msgSend(v11, "section"));
  }
}

- (id)_newSnapshotForCurrentControllerState
{
  if (IMOSLoggingEnabled())
  {
    unint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "> BEGIN diffable snapshot generation.", buf, 2u);
    }
  }
  id v4 = objc_opt_new();
  unint64_t v5 = [(CKSearchViewController *)self searchControllersWithResults];
  uint64_t v6 = [v5 arrayByApplyingSelector:sel_class];
  uint64_t v7 = [v6 arrayByApplyingSelector:sel_sectionIdentifier];
  [v4 appendSectionsWithIdentifiers:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CKSearchViewController__newSnapshotForCurrentControllerState__block_invoke;
  v14[3] = &unk_1E56218F0;
  id v8 = v5;
  id v15 = v8;
  long long v16 = self;
  id v9 = v4;
  id v17 = v9;
  [v7 enumerateObjectsUsingBlock:v14];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "> END diffable snapshot generation.", buf, 2u);
    }
  }
  id v11 = v17;
  id v12 = v9;

  return v12;
}

void __63__CKSearchViewController__newSnapshotForCurrentControllerState__block_invoke(id *a1, void *a2, unint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a1[4] count] >= a3)
  {
    uint64_t v7 = [a1[4] objectAtIndex:a3];
    id v8 = [v7 results];
    if ([v8 count])
    {
      id v9 = [a1[5] _identifiersToAppendForResults:v8];
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412802;
          id v12 = v5;
          __int16 v13 = 2048;
          uint64_t v14 = [v9 count];
          __int16 v15 = 2112;
          long long v16 = v9;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Section={%@} count={%ld} appending %@", (uint8_t *)&v11, 0x20u);
        }
      }
      [a1[6] appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:v5];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Allocated search controllers and section counts do not match!!", (uint8_t *)&v11, 2u);
    }
  }
}

- (id)_identifiersToAppendForResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
          id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    int v11 = [v4 array];
    id v12 = (void *)[v11 copy];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 wantsFooterSection] && objc_msgSend(v4, "footerClass"))
  {
    uint64_t v6 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    uint64_t v7 = [MEMORY[0x1E4F42608] estimatedDimension:44.0];
    uint64_t v8 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v6 heightDimension:v7];
    id v9 = (void *)[v4 footerClass];
    id v10 = (void *)MEMORY[0x1E4F425F8];
    int v11 = [v9 supplementaryViewType];
    id v12 = [v10 boundarySupplementaryItemWithLayoutSize:v8 elementKind:v11 alignment:5];

    [v5 addObject:v12];
  }

  return v5;
}

- (id)globalLayoutConfiguration
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F42878] defaultConfiguration];
  if ([(CKSearchViewController *)self searchInProgress]
    && ([(CKSearchViewController *)self _needsIndexing]
     || [(CKSearchViewController *)self _wantsInternalDebugInformation]))
  {
    id v4 = [(CKSearchViewController *)self searchCompleteControllerSet];
    unint64_t v5 = [v4 count];

    uint64_t v6 = [(CKSearchViewController *)self searchControllers];
    unint64_t v7 = [v6 count];

    if (v5 >= v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
      id v9 = [MEMORY[0x1E4F42608] estimatedDimension:120.0];
      id v10 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v8 heightDimension:v9];
      int v11 = (void *)MEMORY[0x1E4F425F8];
      id v12 = +[CKSearchIndexingFooterCell supplementaryViewType];
      __int16 v13 = [v11 boundarySupplementaryItemWithLayoutSize:v10 elementKind:v12 alignment:5];

      v16[0] = v13;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v3 setBoundarySupplementaryItems:v14];
    }
  }

  return v3;
}

- (BOOL)_wantsInternalDebugInformation
{
  if (IMGetDomainBoolForKey()) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v4 = [v3 isInternalInstall];

  return v4;
}

- (BOOL)_needsIndexing
{
  return [MEMORY[0x1E4F6E700] needsIndexing];
}

- (Class)_searchResultsHeaderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_currentModeIsDetails
{
  return [(CKSearchViewController *)self mode] == 3 || [(CKSearchViewController *)self mode] == 4;
}

- (BOOL)_shouldHideShowAllButtonForController:(id)a3
{
  id v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v4 = [v3 mode];
    if (v4 == 4 || v4 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v4;
    }
    unint64_t v7 = [v3 queriedResultsCount];
    LOBYTE(v6) = v7 <= [v3 maxResultsForMode:v6];
  }
  else
  {
    LODWORD(v6) = [v3 hasMoreResults] ^ 1;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(CKSearchViewController *)self collectionView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  int v11 = [(CKSearchViewController *)self collectionView];
  id v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);

  if (!v12)
  {
    long long v16 = 0;
    goto LABEL_11;
  }
  __int16 v13 = [(CKSearchViewController *)self collectionView];
  long long v14 = [v13 cellForItemAtIndexPath:v12];

  if (!v14) {
    goto LABEL_9;
  }
  long long v15 = [v14 window];

  if (!v15)
  {
    long long v17 = IMLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CKSearchViewController contextMenuInteraction:previewForHighlightingMenuWithConfiguration:](v17);
    }

LABEL_9:
    long long v16 = 0;
    goto LABEL_10;
  }
  long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v14];
LABEL_10:

LABEL_11:

  return v16;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (![(CKSearchViewController *)self contextMenuInteractionShouldBegin:a3]) {
    goto LABEL_9;
  }
  double v7 = [(CKSearchViewController *)self collectionView];
  double v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);

  unint64_t v9 = [v8 section];
  double v10 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v11 = [v10 count];

  if (v9 >= v11)
  {
LABEL_8:

LABEL_9:
    v47 = 0;
    goto LABEL_10;
  }
  id v12 = [(CKSearchViewController *)self searchControllersWithResults];
  __int16 v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));

  unint64_t v14 = [v8 row];
  long long v15 = [v13 results];
  unint64_t v16 = [v15 count];

  if (v14 >= v16)
  {

    goto LABEL_8;
  }
  long long v17 = [v13 results];
  uint64_t v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v8, "row"));

  uint64_t v19 = [(CKSearchViewController *)self view];
  [v19 bounds];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;

  id v28 = [(CKSearchViewController *)self collectionView];
  uint64_t v29 = [v28 cellForItemAtIndexPath:v8];

  if (v29)
  {
    [v29 bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    uint64_t v38 = [(CKSearchViewController *)self view];
    objc_msgSend(v29, "convertRect:toView:", v38, v31, v33, v35, v37);
    uint64_t v21 = v39;
    uint64_t v23 = v40;
    uint64_t v25 = v41;
    uint64_t v27 = v42;
  }
  uint64_t v43 = (void *)MEMORY[0x1E4F428F0];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v57[3] = &unk_1E5629C50;
  id v58 = v13;
  id v59 = v18;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v49[3] = &unk_1E562C480;
  id v50 = v58;
  id v51 = v59;
  id v52 = v8;
  uint64_t v53 = v21;
  uint64_t v54 = v23;
  uint64_t v55 = v25;
  uint64_t v56 = v27;
  id v44 = v8;
  id v45 = v59;
  id v46 = v58;
  v47 = [v43 configurationWithIdentifier:v44 previewProvider:v57 actionProvider:v49];

LABEL_10:

  return v47;
}

uint64_t __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewViewControllerForResult:*(void *)(a1 + 40)];
}

id __80__CKSearchViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "menuElementsForResult:atIndexPath:sourceRect:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v1];

  return v2;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  double v8 = [a4 identifier];
  unint64_t v9 = [v8 section];
  double v10 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v11 = [v10 count];

  if (v9 < v11)
  {
    id v12 = [(CKSearchViewController *)self searchControllersWithResults];
    __int16 v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));

    if (([(id)objc_opt_class() previewControllerPresentsModally] & 1) == 0)
    {
      unint64_t v14 = [v8 row];
      long long v15 = [v13 results];
      unint64_t v16 = [v15 count];

      if (v14 < v16)
      {
        long long v17 = [v13 results];
        uint64_t v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v8, "row"));

        if (v18)
        {
          uint64_t v19 = [v13 previewViewControllerForResult:v18];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          void v21[2] = __107__CKSearchViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
          v21[3] = &unk_1E5620AF8;
          v21[4] = self;
          id v22 = v19;
          id v20 = v19;
          [v7 addAnimations:v21];
        }
      }
    }
  }
}

void __107__CKSearchViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 searchViewController:*(void *)(a1 + 32) requestsPushOfSearchController:*(void *)(a1 + 40)];
}

- (BOOL)contextMenuInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchViewController *)self collectionView];
  char v6 = objc_msgSend(v5, "_ck_isEditing");

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    double v8 = [(CKSearchViewController *)self collectionView];
    [v4 locationInView:v8];
    double v10 = v9;
    double v12 = v11;

    __int16 v13 = [(CKSearchViewController *)self collectionView];
    unint64_t v14 = objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);

    long long v15 = [(CKSearchViewController *)self collectionView];
    unint64_t v16 = [v15 cellForItemAtIndexPath:v14];

    if (v16
      && (unint64_t v17 = [v14 section],
          [(CKSearchViewController *)self searchControllersWithResults],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = [v18 count],
          v18,
          v17 < v19))
    {
      id v20 = [(CKSearchViewController *)self searchControllersWithResults];
      uint64_t v21 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v14, "section"));

      if ([(id)objc_opt_class() supportsMenuInteraction]
        && (unint64_t v22 = [v14 row],
            [v21 results],
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            unint64_t v24 = [v23 count],
            v23,
            v22 < v24))
      {
        uint64_t v25 = [v21 results];
        uint64_t v26 = objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v14, "row"));

        char v7 = [v21 shouldStartMenuInteractionForResult:v26];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
      uint64_t v21 = 0;
    }
  }
  return v7;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v10 section];
  double v12 = [(CKSearchViewController *)self searchControllersWithResults];
  unint64_t v13 = [v12 count];

  if (v11 >= v13)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "CKSearchController - Asked to provide a cell for a section we don't have!", buf, 2u);
      }
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v14 = [(CKSearchViewController *)self searchControllersWithResults];
    long long v15 = [v14 objectAtIndex:v11];

    unint64_t v16 = [v15 results];
    unint64_t v17 = [v10 item];
    if (v17 >= [v16 count])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "CKSearchController - Index path is out of range for search results", buf, 2u);
        }
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v27 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v10, "item"));
      uint64_t v18 = [v15 itemProviderForSearchResult:v27];
      if (v18)
      {
        unint64_t v19 = [v8 cellForItemAtIndexPath:v10];
        if (v19)
        {
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v18];
          [v20 setLocalObject:v27];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __82__CKSearchViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke;
          v28[3] = &unk_1E5629230;
          id v29 = v19;
          [v20 setPreviewProvider:v28];
          double v30 = v20;
          uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v10;
              _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Couldn't get cell for indexPath: %@", buf, 0xCu);
            }
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          unint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Failed to create item provider for search drag item", buf, 2u);
          }
        }
        uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }

  return v21;
}

id __82__CKSearchViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F429A8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  id v5 = (void *)[v2 initWithView:v3 parameters:v4];

  return v5;
}

- (CKContainerSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKContainerSearchControllerDelegate *)WeakRetained;
}

- (BOOL)dismissingSearchController
{
  return self->_dismissingSearchController;
}

- (void)setDismissingSearchController:(BOOL)a3
{
  self->_BOOL dismissingSearchController = a3;
}

- (BOOL)canShowTokenSuggestions
{
  return self->_canShowTokenSuggestions;
}

- (NSArray)searchControllers
{
  return self->_searchControllers;
}

- (NSDictionary)_searchControllerMap
{
  return self->__searchControllerMap;
}

- (void)set_searchControllerMap:(id)a3
{
}

- (NSArray)visibleSearchControllers
{
  return self->_visibleSearchControllers;
}

- (void)setVisibleSearchControllers:(id)a3
{
}

- (NSArray)searchControllersWithResults
{
  return self->_searchControllersWithResults;
}

- (void)setSearchControllersWithResults:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (id)performAfterInitialLoadBlock
{
  return self->_performAfterInitialLoadBlock;
}

- (void)setPerformAfterInitialLoadBlock:(id)a3
{
}

- (NSMutableSet)searchCompleteControllerSet
{
  return self->_searchCompleteControllerSet;
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (void)setClientStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateMonitor, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_searchCompleteControllerSet, 0);
  objc_storeStrong(&self->_performAfterInitialLoadBlock, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchControllersWithResults, 0);
  objc_storeStrong((id *)&self->_visibleSearchControllers, 0);
  objc_storeStrong((id *)&self->__searchControllerMap, 0);
  objc_storeStrong((id *)&self->_searchControllers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)contextMenuInteraction:(os_log_t)log previewForHighlightingMenuWithConfiguration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Tried to initialize UITargetedPreview with a view that is not in a window", v1, 2u);
}

@end