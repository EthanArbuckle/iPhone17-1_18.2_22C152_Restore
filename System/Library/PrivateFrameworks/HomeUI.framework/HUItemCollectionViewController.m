@interface HUItemCollectionViewController
+ (unint64_t)updateMode;
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasFinishedInitialLoad;
- (BOOL)iconPreloadIsPrioritized;
- (BOOL)isLayoutDependentOnItemState;
- (BOOL)isViewVisible;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3;
- (BOOL)suppressCollectionViewUpdatesForReorderCommit;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)visibilityUpdatesEnabled;
- (BOOL)wantsPreferredContentSize;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFItem)hu_presentedItem;
- (HFItemManager)itemManager;
- (HUItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (NACancelable)deferredVisibilityUpdate;
- (NACancelable)iconPreloadCancelable;
- (NSHashTable)childViewControllersAtViewWillAppearTime;
- (NSHashTable)childViewControllersAtViewWillDisappearTime;
- (NSMapTable)textFieldToCellMap;
- (NSMutableArray)foregroundUpdateFutures;
- (NSMutableArray)viewVisibleFutures;
- (NSMutableSet)internalItemModuleControllers;
- (NSMutableSet)recentlyRemovedItemModuleControllers;
- (NSMutableSet)registeredCellClasses;
- (NSString)description;
- (id)_displayedPackageIconDescriptorsForItems:(id)a3;
- (id)_itemForTextField:(id)a3;
- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)_sortedItemMapFrom:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)childViewControllersToPreload;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)defaultTextForTextField:(id)a3 item:(id)a4;
- (id)hu_preloadContent;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)itemModuleControllers;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (id)moduleControllerForItem:(id)a3;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (id)textFieldForVisibleItem:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_cancelIconPreload;
- (void)_commonInitWithItemManager:(id)a3;
- (void)_configureLayout;
- (void)_performStandardUpdateForCell:(id)a3 forItem:(id)a4;
- (void)_preloadIconsIfNeededWithItems:(id)a3;
- (void)_prioritizeIconPreloadIfNeeded;
- (void)_routeUpdateForCell:(id)a3 forItem:(id)a4;
- (void)_transformViewControllerForRequest:(id)a3;
- (void)_updateTitle;
- (void)cleanupRecentlyRemovedModuleControllers;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)diffableDataItemManager:(id)a3 prefetchResourcesForItems:(id)a4;
- (void)executionEnvironmentRunningStateDidChange:(id)a3;
- (void)itemManager:(id)a3 didChangeHome:(id)a4;
- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didInsertSections:(id)a4;
- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6;
- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5;
- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didRemoveSections:(id)a4;
- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)performBatchCollectionViewUpdatesForUpdateRequest:(id)a3 reloadOnly:(BOOL)a4;
- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4;
- (void)reloadCellForItems:(id)a3;
- (void)setChildViewControllersAtViewWillAppearTime:(id)a3;
- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3;
- (void)setDeferredVisibilityUpdate:(id)a3;
- (void)setForegroundUpdateFutures:(id)a3;
- (void)setHasFinishedInitialLoad:(BOOL)a3;
- (void)setIconPreloadCancelable:(id)a3;
- (void)setIconPreloadIsPrioritized:(BOOL)a3;
- (void)setItemManager:(id)a3;
- (void)setSuppressCollectionViewUpdatesForReorderCommit:(BOOL)a3;
- (void)setUpDiffableDataItemManagerIfNeeded;
- (void)setViewVisible:(BOOL)a3;
- (void)setVisibilityUpdatesEnabled:(BOOL)a3;
- (void)setWantsPreferredContentSize:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateCellForItems:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUItemCollectionViewController

id __75__HUItemCollectionViewController__displayedPackageIconDescriptorsForItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    objc_opt_class();
    v7 = [v2 latestResults];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v6 = v9;
  }

  return v6;
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

uint64_t __58__HUItemCollectionViewController_moduleControllerForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 module];
  if ([v4 containsItem:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) moduleIdentifier];
    v7 = [v3 moduleIdentifier];
    uint64_t v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUItemCollectionViewController;
  [(HUCollectionViewController *)&v19 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:v9];
  if ([v8 conformsToProtocol:&unk_1F19E8A08])
  {
    v10 = [(HUItemCollectionViewController *)self itemManager];
    v11 = [v10 displayedItemAtIndexPath:v9];

    if (v11
      && [(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v11])
    {
      id v12 = v8;
      v13 = [v12 textField];
      [v13 setDelegate:self];

      v14 = [(HUItemCollectionViewController *)self textFieldToCellMap];
      v15 = [v12 textField];
      [v14 setObject:v12 forKey:v15];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v16 = v8;
    if ([v16 conformsToProtocol:&unk_1F19F5770]) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    [v18 reclaimIconIfPossible];
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HUItemCollectionViewController *)self collectionView];
  id v10 = [v9 cellForItemAtIndexPath:v7];

  [(HUItemCollectionViewController *)self _routeUpdateForCell:v10 forItem:v8];
  if (objc_opt_respondsToSelector()) {
    [v10 updateUIWithAnimation:1];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  id v9 = [(HUItemCollectionViewController *)self moduleControllerForItem:v8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v26[3] = &unk_1E638E308;
  id v10 = v9;
  id v27 = v10;
  id v11 = v8;
  id v28 = v11;
  v29 = self;
  id v12 = v6;
  id v30 = v12;
  v13 = (objc_class *)__72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke((uint64_t)v26);
  if (!v13)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HUItemCollectionViewController.m", 589, @"No cell class specified for item: %@", v11 object file lineNumber description];
  }
  v14 = [(HUItemCollectionViewController *)self registeredCellClasses];
  char v15 = [v14 containsObject:v13];

  if ((v15 & 1) == 0)
  {
    id v16 = [(HUItemCollectionViewController *)self collectionView];
    v17 = NSStringFromClass(v13);
    [v16 registerClass:v13 forCellWithReuseIdentifier:v17];

    id v18 = [(HUItemCollectionViewController *)self registeredCellClasses];
    [v18 addObject:v13];
  }
  objc_super v19 = [(HUItemCollectionViewController *)self collectionView];
  v20 = NSStringFromClass(v13);
  v21 = [v19 dequeueReusableCellWithReuseIdentifier:v20 forIndexPath:v12];

  if ([v21 conformsToProtocol:&unk_1F19D2698]) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;
  [v23 setItem:v11];
  [(HUItemCollectionViewController *)self _routeUpdateForCell:v21 forItem:v11];
  [v23 updateUIWithAnimation:0];

  return v21;
}

void __94__HUItemCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) itemManager];
  v4 = [v3 indexPathForItem:v7];

  uint64_t v5 = [*(id *)(a1 + 32) collectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  if (v6)
  {
    [*(id *)(a1 + 32) _routeUpdateForCell:v6 forItem:v7];
    if (objc_opt_respondsToSelector()) {
      [v6 updateUIWithAnimation:1];
    }
  }
}

- (NSMutableSet)registeredCellClasses
{
  return self->_registeredCellClasses;
}

id __72__HUItemCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2 || (id v3 = (void *)[v2 collectionCellClassForItem:*(void *)(a1 + 40)]) == 0) {
    id v3 = (void *)[*(id *)(a1 + 48) cellClassForItem:*(void *)(a1 + 40) indexPath:*(void *)(a1 + 56)];
  }

  return v3;
}

id __64__HUItemCollectionViewController__prioritizeIconPreloadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 itemManager];
  uint64_t v5 = [v4 displayedItemAtIndexPath:v3];

  return v5;
}

id __78__HUItemCollectionViewController_initUsingCompositionalLayoutWithItemManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [WeakRetained _layoutSectionForSection:a2 layoutEnvironment:v5];
  id v8 = (void *)v7;
  if (!WeakRetained || v7)
  {
    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(&cfstr_NonnullReturne.isa, WeakRetained, a2);
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = WeakRetained;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@ produced nil section; self=%@ sectionIndex=%lu",
      buf,
      0x20u);
  }

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:2];
  id v8 = [MEMORY[0x1E4F42630] sectionWithListConfiguration:v11 layoutEnvironment:v5];

LABEL_8:

  return v8;
}

- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke;
  v15[3] = &unk_1E638E2E0;
  v15[4] = self;
  v15[5] = a3;
  uint64_t v7 = __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke((uint64_t)v15);
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedSectionIdentifierForSectionIndex:a3];

  uint64_t v10 = [v7 collectionLayoutSectionForSectionWithIdentifier:v9 layoutEnvironment:v6];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(HUItemCollectionViewController *)self layoutSectionForSection:a3 layoutEnvironment:v6];
  }
  v13 = v12;

  return v13;
}

- (void)_routeUpdateForCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HUItemCollectionViewController *)self _performStandardUpdateForCell:v7 forItem:v6];
  id v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v6];
  id v9 = v8;
  if (!v8) {
    id v8 = self;
  }
  [v8 configureCell:v7 forItem:v6];
}

id __77__HUItemCollectionViewController__layoutSectionForSection_layoutEnvironment___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) itemManager];
  id v3 = [v2 displayedItemsInSection:*(void *)(a1 + 40)];
  v4 = [v3 firstObject];

  id v5 = [*(id *)(a1 + 32) moduleControllerForItem:v4];

  return v5;
}

- (id)moduleControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemModuleControllers];
  id v6 = [(HUItemCollectionViewController *)self recentlyRemovedItemModuleControllers];
  id v7 = [v5 setByAddingObjectsFromSet:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HUItemCollectionViewController_moduleControllerForItem___block_invoke;
  v11[3] = &unk_1E638E378;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v11);

  return v9;
}

- (NSMutableSet)recentlyRemovedItemModuleControllers
{
  return self->_recentlyRemovedItemModuleControllers;
}

- (id)itemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (void)_performStandardUpdateForCell:(id)a3 forItem:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = v34;
    unint64_t v8 = [(HUItemCollectionViewController *)self automaticDisablingReasonsForItem:v6];
    id v9 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v10 = [v9 home];
    char v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

    if (v11)
    {
      LODWORD(v12) = 0;
    }
    else
    {
      v13 = [v6 latestResults];
      uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68A70]];

      if (v14) {
        LODWORD(v12) = [v14 BOOLValue];
      }
      else {
        uint64_t v12 = (v8 >> 1) & 1;
      }
    }
    __int16 v15 = [v6 latestResults];
    id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    int v17 = [v16 BOOLValue];

    [v7 setDisabled:v17 | v12];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v6])
  {
    id v18 = v34;
    uint64_t v19 = [(HUItemCollectionViewController *)self moduleControllerForItem:v6];
    v20 = (void *)v19;
    if (v19) {
      v21 = (HUItemCollectionViewController *)v19;
    }
    else {
      v21 = self;
    }
    v22 = v21;

    id v23 = [v18 textField];
    v24 = [(HUItemCollectionViewController *)v22 defaultTextForTextField:v23 item:v6];

    v25 = [v18 textField];
    v26 = [(HUItemCollectionViewController *)v22 currentTextForTextField:v25 item:v6];

    id v27 = [v18 textField];
    id v28 = [(HUItemCollectionViewController *)v22 placeholderTextForTextField:v27 item:v6];

    v29 = [v18 textField];
    [v29 setPlaceholder:v28];

    if (v26) {
      id v30 = v26;
    }
    else {
      id v30 = v24;
    }
    v31 = [v18 textField];
    [v31 setText:v30];

    v32 = [v18 textField];

    [v32 setAutocapitalizationType:1];
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v33 = v34;
    if (objc_opt_respondsToSelector()) {
      [v33 setResizingDelegate:self];
    }
  }
}

- (void)diffableDataItemManager:(id)a3 prefetchResourcesForItems:(id)a4
{
  id v5 = a4;
  if (([MEMORY[0x1E4F69138] isSpringBoard] & 1) == 0) {
    [(HUItemCollectionViewController *)self _preloadIconsIfNeededWithItems:v5];
  }
}

- (void)itemManager:(id)a3 didChangeHome:(id)a4
{
  if ([(HUItemCollectionViewController *)self hasFinishedInitialLoad])
  {
    id v5 = [(HUItemCollectionViewController *)self collectionView];
    [v5 layoutIfNeeded];
  }
}

- (void)_commonInitWithItemManager:(id)a3
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_itemManager, a3);
  [(HFItemManager *)self->_itemManager setDelegate:self];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  foregroundUpdateFutures = self->_foregroundUpdateFutures;
  self->_foregroundUpdateFutures = v5;

  id v7 = [MEMORY[0x1E4F1CA48] array];
  viewVisibleFutures = self->_viewVisibleFutures;
  self->_viewVisibleFutures = v7;

  id v9 = [MEMORY[0x1E4F1CA80] set];
  registeredCellClasses = self->_registeredCellClasses;
  self->_registeredCellClasses = v9;

  char v11 = [MEMORY[0x1E4F1CA80] set];
  internalItemModuleControllers = self->_internalItemModuleControllers;
  self->_internalItemModuleControllers = v11;

  v13 = [MEMORY[0x1E4F1CA80] set];
  recentlyRemovedItemModuleControllers = self->_recentlyRemovedItemModuleControllers;
  self->_recentlyRemovedItemModuleControllers = v13;

  __int16 v15 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  textFieldToCellMap = self->_textFieldToCellMap;
  self->_textFieldToCellMap = v15;

  self->_iconPreloadIsPrioritized = 0;
  int v17 = [MEMORY[0x1E4F69138] sharedInstance];
  [v17 addObserver:self];

  if (![(id)objc_opt_class() updateMode]) {
    [v18 disableExternalUpdatesWithReason:@"HUItemCollectionViewController_NotVisible"];
  }
  [(HUItemCollectionViewController *)self _updateTitle];
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v8 = a4;
  [(HUItemCollectionViewController *)self itemManagerDidUpdate:a3];
  [(HUItemCollectionViewController *)self cleanupRecentlyRemovedModuleControllers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__HUItemCollectionViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v9[3] = &unk_1E63889F8;
  v9[4] = self;
  objc_msgSend(v8, "na_each:", v9);
}

- (void)cleanupRecentlyRemovedModuleControllers
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUItemCollectionViewController *)self recentlyRemovedItemModuleControllers];
  id v4 = (void *)[v3 copy];

  id v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 allDisplayedItems];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_207_1);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  char v11 = v8;
  if (!v9)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v12 = v9;
  char v13 = 0;
  uint64_t v14 = *(void *)v26;
  *(void *)&long long v10 = 138412802;
  long long v24 = v10;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v8);
      }
      id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      int v17 = objc_msgSend(v16, "moduleIdentifier", v24, (void)v25);
      char v18 = [v7 containsObject:v17];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v16 moduleIdentifier];
          *(_DWORD *)buf = v24;
          id v30 = self;
          __int16 v31 = 2112;
          v32 = v16;
          __int16 v33 = 2112;
          id v34 = v20;
          _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: Finishing removal of module controller %@ (%@) because no items refer to it anymore", buf, 0x20u);
        }
        v21 = [(HUItemCollectionViewController *)self recentlyRemovedItemModuleControllers];
        [v21 removeObject:v16];

        char v13 = 1;
      }
    }
    uint64_t v12 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  }
  while (v12);

  if (v13)
  {
    char v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(HUItemCollectionViewController *)self recentlyRemovedItemModuleControllers];
      id v23 = objc_msgSend(v22, "na_map:", &__block_literal_global_211);
      *(_DWORD *)buf = 138412546;
      id v30 = self;
      __int16 v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: Module controllers awaiting removal remaining: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v4 viewDidLayoutSubviews];
  if ([(HUItemCollectionViewController *)self wantsPreferredContentSize])
  {
    id v3 = [(HUItemCollectionViewController *)self collectionView];
    [v3 contentSize];
    -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
    -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  [(HUItemCollectionViewController *)self _prioritizeIconPreloadIfNeeded];
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(HUItemCollectionViewController *)self wantsPreferredContentSize])
  {
    objc_super v4 = [(HUItemCollectionViewController *)self collectionView];
    [v4 contentSize];
    -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
    -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
  if (![(HUItemCollectionViewController *)self hasFinishedInitialLoad])
  {
    [(HUItemCollectionViewController *)self setHasFinishedInitialLoad:1];
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)wantsPreferredContentSize
{
  return self->_wantsPreferredContentSize;
}

- (BOOL)hasFinishedInitialLoad
{
  return self->_hasFinishedInitialLoad;
}

- (void)_prioritizeIconPreloadIfNeeded
{
  if (![(HUItemCollectionViewController *)self iconPreloadIsPrioritized])
  {
    id v3 = [(HUItemCollectionViewController *)self collectionView];
    objc_super v4 = [v3 indexPathsForVisibleItems];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(HUItemCollectionViewController *)self collectionView];
      id v7 = [v6 indexPathsForVisibleItems];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__HUItemCollectionViewController__prioritizeIconPreloadIfNeeded__block_invoke;
      v12[3] = &unk_1E6389690;
      v12[4] = self;
      int v8 = objc_msgSend(v7, "na_map:", v12);

      uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
      uint64_t v10 = [(HUItemCollectionViewController *)self _displayedPackageIconDescriptorsForItems:v9];

      char v11 = [MEMORY[0x1E4F6A410] sharedInstance];
      [v11 prioritizeIconDescriptors:v10];

      [(HUItemCollectionViewController *)self setIconPreloadIsPrioritized:1];
    }
  }
}

- (BOOL)iconPreloadIsPrioritized
{
  return self->_iconPreloadIsPrioritized;
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a5;
  int v8 = [v6 arrayWithCapacity:2];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];

  LOBYTE(v7) = [v9 BOOLValue];
  if ((v7 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F69138] sharedInstance];
    uint64_t v11 = [v10 runningState];

    if (v11)
    {
      uint64_t v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the application is active", buf, 2u);
      }

      id v13 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      [v8 addObject:v13];
      uint64_t v14 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
      [v14 addObject:v13];
    }
    if (![(HUItemCollectionViewController *)self isViewVisible])
    {
      __int16 v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v26 = self;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Delaying full item update for view controller %@ as we are not visible.", buf, 0xCu);
      }

      id v16 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      [v8 addObject:v16];
      int v17 = (void *)MEMORY[0x1E4F7A0D8];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke;
      v23[3] = &unk_1E6385108;
      id v24 = v16;
      id v18 = v16;
      uint64_t v19 = [v17 futureWithBlock:v23];
      v20 = [(HUItemCollectionViewController *)self viewVisibleFutures];
      [v20 addObject:v19];
    }
  }
  v21 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v8];

  return v21;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)_updateTitle
{
  id v10 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v3 = [v10 sourceItem];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    BOOL v5 = [(HUItemCollectionViewController *)self automaticallyUpdatesViewControllerTitle];

    if (!v5) {
      return;
    }
    id v10 = [(HUItemCollectionViewController *)self itemManager];
    id v6 = [v10 sourceItem];
    id v7 = [v6 latestResults];
    int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    uint64_t v9 = [(HUItemCollectionViewController *)self navigationItem];
    [v9 setTitle:v8];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(HUItemCollectionViewController *)self _cancelIconPreload];
  BOOL v5 = [(HUItemCollectionViewController *)self childViewControllersAtViewWillDisappearTime];
  if (![(id)objc_opt_class() updateMode])
  {
    id v6 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:MEMORY[0x1E4F14428]];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __49__HUItemCollectionViewController_viewWillAppear___block_invoke;
    v23[3] = &unk_1E638E298;
    void v23[4] = self;
    id v24 = v5;
    id v7 = [v6 performCancelableBlock:v23];
    [(HUItemCollectionViewController *)self setDeferredVisibilityUpdate:v7];
  }
  [(HUItemCollectionViewController *)self setChildViewControllersAtViewWillDisappearTime:0];
  v22.receiver = self;
  v22.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v22 viewWillAppear:v3];
  int v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(HUItemCollectionViewController *)self setChildViewControllersAtViewWillAppearTime:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(HUItemCollectionViewController *)self childViewControllers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        __int16 v15 = [(HUItemCollectionViewController *)self childViewControllersAtViewWillAppearTime];
        [v15 addObject:v14];

        [v14 beginAppearanceTransition:1 animated:v3];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v11);
  }

  id v16 = [(HUItemCollectionViewController *)self collectionView];
  int v17 = [v16 visibleCells];
  objc_msgSend(v17, "na_each:", &__block_literal_global_182);
}

- (void)_preloadIconsIfNeededWithItems:(id)a3
{
  id v4 = a3;
  [(HUItemCollectionViewController *)self _cancelIconPreload];
  id v7 = [(HUItemCollectionViewController *)self _displayedPackageIconDescriptorsForItems:v4];

  if ([v7 count])
  {
    BOOL v5 = [MEMORY[0x1E4F6A410] sharedInstance];
    id v6 = [v5 prefetchIconDescriptors:v7];
    [(HUItemCollectionViewController *)self setIconPreloadCancelable:v6];
  }
  [(HUItemCollectionViewController *)self _prioritizeIconPreloadIfNeeded];
}

- (void)setIconPreloadCancelable:(id)a3
{
}

- (id)_displayedPackageIconDescriptorsForItems:(id)a3
{
  BOOL v3 = [a3 allObjects];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_214);

  return v4;
}

- (void)_cancelIconPreload
{
  BOOL v3 = [(HUItemCollectionViewController *)self iconPreloadCancelable];
  [v3 cancel];

  [(HUItemCollectionViewController *)self setIconPreloadCancelable:0];
}

- (NACancelable)iconPreloadCancelable
{
  return self->_iconPreloadCancelable;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v12 viewDidLoad];
  [(HUItemCollectionViewController *)self setUpDiffableDataItemManagerIfNeeded];
  [(HUItemCollectionViewController *)self _configureLayout];
  id v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  BOOL v5 = [(HUItemCollectionViewController *)self collectionView];
  [v5 setBackgroundColor:v4];

  id v6 = [(HUItemCollectionViewController *)self collectionView];
  [v6 setPrefetchDataSource:self];

  id v7 = [(HUItemCollectionViewController *)self collectionView];
  [v7 setPrefetchingEnabled:1];

  if ([(id)objc_opt_class() updateMode] == 1)
  {
    int v8 = [(HUItemCollectionViewController *)self itemManager];
    id v9 = (id)[v8 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
  uint64_t v10 = [(HUItemCollectionViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withReuseIdentifier:@"HUItemCollectionViewHeader"];

  uint64_t v11 = [(HUItemCollectionViewController *)self collectionView];
  [v11 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43750] withReuseIdentifier:@"HUItemCollectionViewFooter"];
}

+ (unint64_t)updateMode
{
  return 0;
}

- (void)setUpDiffableDataItemManagerIfNeeded
{
  id v16 = [(HUItemCollectionViewController *)self itemManager];
  if ([v16 diffableDataSourceDisabled])
  {
  }
  else
  {
    id v4 = [(HUItemCollectionViewController *)self itemManager];
    BOOL v5 = [v4 diffableDataSource];

    if (!v5)
    {
      id v6 = [(HUItemCollectionViewController *)self itemManager];
      id v7 = objc_opt_class();

      int v8 = objc_opt_class();
      id v9 = [(HUItemCollectionViewController *)self itemManager];
      objc_initWeak(&location, v9);

      objc_initWeak(&from, self);
      id v10 = objc_alloc(MEMORY[0x1E4F42880]);
      uint64_t v11 = [(HUItemCollectionViewController *)self collectionView];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke;
      v23[3] = &unk_1E638E1D0;
      objc_copyWeak(&v24, &from);
      v25[1] = (id)a2;
      objc_copyWeak(v25, &location);
      v25[2] = v7;
      v25[3] = v8;
      objc_super v12 = (void *)[v10 initWithCollectionView:v11 cellProvider:v23];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_34;
      v21[3] = &unk_1E638E1F8;
      objc_copyWeak(&v22, &from);
      [v12 setSupplementaryViewProvider:v21];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_2;
      v19[3] = &unk_1E638E220;
      objc_copyWeak(&v20, &from);
      uint64_t v13 = [v12 reorderingHandlers];
      [v13 setCanReorderItemHandler:v19];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_3;
      v17[3] = &unk_1E638E248;
      objc_copyWeak(&v18, &from);
      uint64_t v14 = [v12 reorderingHandlers];
      [v14 setDidReorderHandler:v17];

      __int16 v15 = [(HUItemCollectionViewController *)self itemManager];
      [v15 setDiffableDataSource:v12];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);

      objc_destroyWeak(v25);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setIconPreloadIsPrioritized:(BOOL)a3
{
  self->_iconPreloadIsPrioritized = a3;
}

- (void)setHasFinishedInitialLoad:(BOOL)a3
{
  self->_hasFinishedInitialLoad = a3;
}

- (void)setDeferredVisibilityUpdate:(id)a3
{
}

- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3
{
}

- (void)setChildViewControllersAtViewWillAppearTime:(id)a3
{
}

- (NSHashTable)childViewControllersAtViewWillDisappearTime
{
  return self->_childViewControllersAtViewWillDisappearTime;
}

- (void)_configureLayout
{
  objc_opt_class();
  BOOL v3 = [(HUItemCollectionViewController *)self collectionViewLayout];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  if (v8)
  {
    BOOL v5 = [(HUItemCollectionViewController *)self collectionView];
    id v6 = [v5 traitCollection];
    id v7 = [(HUItemCollectionViewController *)self compositionalLayoutConfigurationForTraitCollection:v6];
    [v8 setConfiguration:v7];
  }
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 1;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F42870]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__HUItemCollectionViewController_initUsingCompositionalLayoutWithItemManager___block_invoke;
  v14[3] = &unk_1E638E1A8;
  objc_copyWeak(&v16, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = (void *)[v7 initWithSectionProvider:v14];
  v13.receiver = self;
  v13.super_class = (Class)HUItemCollectionViewController;
  id v10 = [(HUCollectionViewController *)&v13 initWithCollectionViewLayout:v9];
  uint64_t v11 = v10;
  if (v10) {
    [(HUItemCollectionViewController *)v10 _commonInitWithItemManager:v4];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

uint64_t __73__HUItemCollectionViewController_cleanupRecentlyRemovedModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 moduleIdentifier];
}

id __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([MEMORY[0x1E4F69758] isInternalInstall]) {
    BOOL v11 = WeakRetained == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = *(void *)(a1 + 48);
    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    [v17 handleFailureInMethod:v18, 0, @"HUItemCollectionViewController.m", 157, @"attempting to get cell for item: %@ in itemManager: %@ type: %@ for collectionView: %@ when the collectionViewController: %@ has dealloc already type: %@", v9, v19, *(void *)(a1 + 56), v7, 0, *(void *)(a1 + 64) object file lineNumber description];
  }
  id v12 = [WeakRetained collectionView:v7 cellForItemAtIndexPath:v8];
  if (!v12)
  {
    objc_super v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413570;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = WeakRetained;
      _os_log_fault_impl(&dword_1BE345000, v13, OS_LOG_TYPE_FAULT, "Failed to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for collectionView: %@ collectionViewController: %@", buf, 0x3Eu);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F428A8]);
  }

  return v12;
}

- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3
{
  BOOL v3 = [(HUItemCollectionViewController *)self view];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(HUItemCollectionViewController *)self itemModuleControllers];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_187_0);

  id v8 = (void *)MEMORY[0x1E4F69570];
  id v34 = v5;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  __int16 v33 = (void *)v7;
  id v10 = [v8 diffFromSet:v7 toSet:v9];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  BOOL v11 = [v10 additions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
  objc_super v13 = &OBJC_IVAR___HUMobileTimerObjectTableViewController__checkAccessAndFetchDataFuture;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v18 = [(HUItemCollectionViewController *)self buildItemModuleControllerForModule:v17];
        id v19 = v18;
        if (v18)
        {
          [v18 setHost:self];
          [v19 setHostType:2];
          [(NSMutableSet *)self->_internalItemModuleControllers addObject:v19];
        }
        else
        {
          NSLog(&cfstr_NoModuleContro.isa, v17, self);
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v14);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [v10 deletions];
  uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v25 = v13[835];
        __int16 v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke_2;
        v36[3] = &unk_1E638E378;
        v36[4] = v24;
        uint64_t v27 = objc_msgSend(v26, "na_firstObjectPassingTest:", v36);
        if (v27)
        {
          __int16 v28 = v13;
          [*(id *)((char *)&self->super.super.super.super.super.isa + v25) removeObject:v27];
          id v29 = HFLogForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v30 = [v27 moduleIdentifier];
            *(_DWORD *)buf = 138412802;
            v46 = self;
            __int16 v47 = 2112;
            v48 = v27;
            __int16 v49 = 2112;
            v50 = v30;
            _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@: Starting removal of module controller %@ (%@) because module was deleted. Adding to recently removed for safety", buf, 0x20u);
          }
          [(NSMutableSet *)self->_recentlyRemovedItemModuleControllers addObject:v27];
          objc_super v13 = v28;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v21);
  }

  id v31 = [v10 additions];

  if (v31)
  {
    uint64_t v32 = [(HUItemCollectionViewController *)self collectionView];
    [v32 setNeedsLayout];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v17 viewDidAppear:a3];
  [(HUItemCollectionViewController *)self setViewVisible:1];
  if (![(HUItemCollectionViewController *)self hasFinishedInitialLoad])
  {
    [(HUItemCollectionViewController *)self setHasFinishedInitialLoad:1];
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", buf, 0xCu);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_textFieldDidChange_ name:*MEMORY[0x1E4F43E28] object:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(HUItemCollectionViewController *)self childViewControllersAtViewWillAppearTime];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) endAppearanceTransition];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    id v5 = [(HUItemCollectionViewController *)self viewVisibleFutures];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__HUItemCollectionViewController_setViewVisible___block_invoke;
    v7[3] = &__block_descriptor_33_e18_v16__0__NAFuture_8l;
    BOOL v8 = a3;
    objc_msgSend(v5, "na_each:", v7);

    id v6 = [(HUItemCollectionViewController *)self viewVisibleFutures];
    [v6 removeAllObjects];
  }
}

- (NSMutableArray)viewVisibleFutures
{
  return self->_viewVisibleFutures;
}

- (NSHashTable)childViewControllersAtViewWillAppearTime
{
  return self->_childViewControllersAtViewWillAppearTime;
}

id __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = [WeakRetained collectionView:v9 viewForSupplementaryElementOfKind:v8 atIndexPath:v7];

  return v11;
}

void __49__HUItemCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) visibilityUpdatesEnabled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) itemManager];
    [v2 endDisableExternalUpdatesWithReason:@"HUItemCollectionViewController_NotVisible"];

    [*(id *)(a1 + 32) setVisibilityUpdatesEnabled:1];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F19C08E8, (void)v10))
        {
          id v9 = [v8 itemManager];
          [v9 endDisableExternalUpdatesWithReason:@"HUItemCollectionViewController_ParentNotVisible"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)hu_preloadContent
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(HUItemCollectionViewController *)self hasFinishedInitialLoad])
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    uint64_t v4 = [(HUItemCollectionViewController *)self itemManager];
    char v5 = [v4 diffableDataSourceDisabled];

    if ((v5 & 1) == 0) {
      [(HUItemCollectionViewController *)self loadViewIfNeeded];
    }
    if (![(id)objc_opt_class() updateMode]
      && ![(HUItemCollectionViewController *)self visibilityUpdatesEnabled])
    {
      uint64_t v6 = [(HUItemCollectionViewController *)self itemManager];
      [v6 endDisableExternalUpdatesWithReason:@"HUItemCollectionViewController_NotVisible"];

      [(HUItemCollectionViewController *)self setVisibilityUpdatesEnabled:1];
    }
    id v7 = [(HUItemCollectionViewController *)self itemManager];
    int v8 = [v7 diffableDataSourceDisabled];

    if (v8) {
      [(HUItemCollectionViewController *)self loadViewIfNeeded];
    }
    id v9 = (void *)MEMORY[0x1E4F1CA48];
    long long v10 = [(HUItemCollectionViewController *)self itemManager];
    long long v11 = [v10 firstFastUpdateFuture];
    long long v12 = [v9 arrayWithObject:v11];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v13 = [(HUItemCollectionViewController *)self childViewControllersToPreload];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "hu_preloadContent");
          objc_msgSend(v12, "na_safeAddObject:", v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v20 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v3 = [v19 combineAllFutures:v12 ignoringErrors:1 scheduler:v20];
  }

  return v3;
}

- (BOOL)visibilityUpdatesEnabled
{
  return self->_visibilityUpdatesEnabled;
}

- (void)setVisibilityUpdatesEnabled:(BOOL)a3
{
  self->_visibilityUpdatesEnabled = a3;
}

- (id)childViewControllersToPreload
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (HUItemCollectionViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUItemCollectionViewController;
  id v7 = [(HUCollectionViewController *)&v10 initWithCollectionViewLayout:a4];
  int v8 = v7;
  if (v7) {
    [(HUItemCollectionViewController *)v7 _commonInitWithItemManager:v6];
  }

  return v8;
}

- (void)setWantsPreferredContentSize:(BOOL)a3
{
  if (self->_wantsPreferredContentSize != a3)
  {
    self->_wantsPreferredContentSize = a3;
    if (a3)
    {
      id v6 = [(HUItemCollectionViewController *)self collectionView];
      [v6 contentSize];
      -[HUItemCollectionViewController preferredContentSizeForCollectionViewContentSize:](self, "preferredContentSizeForCollectionViewContentSize:");
      -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
    else
    {
      double v4 = *MEMORY[0x1E4F1DB30];
      double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      -[HUItemCollectionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v5);
    }
  }
}

uint64_t __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = [WeakRetained itemManager];
  id v6 = [v5 indexPathForItem:v3];

  id v7 = [WeakRetained collectionView];
  uint64_t v8 = [WeakRetained collectionView:v7 canMoveItemAtIndexPath:v6];

  return v8;
}

void __70__HUItemCollectionViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained _sortedItemMapFrom:v3];

  [WeakRetained didReorderItemWithSortedItemsBySectionID:v4];
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)_sortedItemMapFrom:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_new();
  double v5 = [v3 sectionTransactions];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HUItemCollectionViewController__sortedItemMapFrom___block_invoke;
  v8[3] = &unk_1E638E270;
  id v6 = v4;
  id v9 = v6;
  objc_msgSend(v5, "na_each:", v8);

  return v6;
}

void __53__HUItemCollectionViewController__sortedItemMapFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  double v4 = [v3 sectionIdentifier];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v10 = v5;

  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 finalSnapshot];

  uint64_t v8 = [v7 items];
  id v9 = [v10 identifier];
  [v6 setObject:v8 forKey:v9];
}

void __49__HUItemCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v2 = v5;
    if ([v2 conformsToProtocol:&unk_1F19F5770]) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;

    [v4 reclaimIconIfPossible];
  }
}

uint64_t __49__HUItemCollectionViewController_setViewVisible___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 finishWithNoResult];
  }
  else {
    return [a2 cancel];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(id)objc_opt_class() updateMode])
  {
    if ([(HUItemCollectionViewController *)self visibilityUpdatesEnabled])
    {
      id v5 = [(HUItemCollectionViewController *)self itemManager];
      [v5 disableExternalUpdatesWithReason:@"HUItemCollectionViewController_NotVisible"];

      [(HUItemCollectionViewController *)self setVisibilityUpdatesEnabled:0];
    }
    id v6 = [(HUItemCollectionViewController *)self deferredVisibilityUpdate];
    [v6 cancel];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [(HUItemCollectionViewController *)self childViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v12 conformsToProtocol:&unk_1F19C08E8])
          {
            long long v13 = [v12 itemManager];
            [v13 disableExternalUpdatesWithReason:@"HUItemCollectionViewController_ParentNotVisible"];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
  }
  [(HUItemCollectionViewController *)self setChildViewControllersAtViewWillAppearTime:0];
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 removeObserver:self name:*MEMORY[0x1E4F43E28] object:0];

  v27.receiver = self;
  v27.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v27 viewWillDisappear:v3];
  uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(HUItemCollectionViewController *)self setChildViewControllersAtViewWillDisappearTime:v15];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [(HUItemCollectionViewController *)self childViewControllers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        long long v22 = [(HUItemCollectionViewController *)self childViewControllersAtViewWillDisappearTime];
        [v22 addObject:v21];

        [v21 beginAppearanceTransition:0 animated:v3];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v18);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(HUItemCollectionViewController *)self setViewVisible:0];
  v16.receiver = self;
  v16.super_class = (Class)HUItemCollectionViewController;
  [(HUItemCollectionViewController *)&v16 viewDidDisappear:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HUItemCollectionViewController *)self childViewControllersAtViewWillDisappearTime];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) endAppearanceTransition];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(HUItemCollectionViewController *)self collectionView];
  long long v11 = [v10 visibleCells];
  objc_msgSend(v11, "na_each:", &__block_literal_global_117);
}

void __51__HUItemCollectionViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 renounceIcon];
  }
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = [(HUItemCollectionViewController *)self itemModuleControllers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUItemCollectionViewController.m", 395, @"%s is an abstract method that must be overriden by subclass %@", "-[HUItemCollectionViewController cellClassForItem:indexPath:]", objc_opt_class() object file lineNumber description];
  }
  return 0;
}

- (BOOL)isLayoutDependentOnItemState
{
  return 0;
}

- (void)performBatchCollectionViewUpdatesForUpdateRequest:(id)a3 reloadOnly:(BOOL)a4
{
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return -1;
}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  objc_opt_class();
  id v4 = [(HUItemCollectionViewController *)self collectionViewLayout];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 configuration];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F42878] defaultConfiguration];
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(a2);
  NSLog(&cfstr_DoesnTImplemen.isa, v5, v6);

  return 0;
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  id v4 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v5 = [v4 sourceItem];
  id v6 = (id)[v3 appendObject:v5 withName:@"sourceItem"];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  if ((id)*MEMORY[0x1E4F43758] == a3) {
    [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
  }
  else {
  id v4 = [MEMORY[0x1E4F42B58] groupedFooterConfiguration];
  }

  return v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  BOOL v3 = [(HUItemCollectionViewController *)self itemManager];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 displayedItemsInSection:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUItemCollectionViewController;
  [(HUCollectionViewController *)&v19 collectionView:a3 didEndDisplayingCell:v8 forItemAtIndexPath:v9];
  if ([v8 conformsToProtocol:&unk_1F19E8A08])
  {
    uint64_t v10 = [(HUItemCollectionViewController *)self itemManager];
    long long v11 = [v10 displayedItemAtIndexPath:v9];

    if (v11
      && [(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v11])
    {
      id v12 = v8;
      long long v13 = [v12 textField];
      [v13 setDelegate:0];

      long long v14 = [(HUItemCollectionViewController *)self textFieldToCellMap];
      long long v15 = [v12 textField];

      [v14 removeObjectForKey:v15];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v16 = v8;
    if ([v16 conformsToProtocol:&unk_1F19F5770]) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    id v18 = v17;

    [v18 renounceIcon];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = (id)*MEMORY[0x1E4F43758];
  if ((id)*MEMORY[0x1E4F43758] == a4) {
    uint64_t v10 = @"HUItemCollectionViewHeader";
  }
  else {
    uint64_t v10 = @"HUItemCollectionViewFooter";
  }
  id v11 = a4;
  id v12 = [a3 dequeueReusableSupplementaryViewOfKind:v11 withReuseIdentifier:v10 forIndexPath:v8];
  long long v13 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v14 = [v8 section];
  if (v9 == a4)
  {
    long long v15 = [v13 titleForSection:v14];

    id v16 = [(HUItemCollectionViewController *)self itemManager];
    objc_msgSend(v16, "attributedTitleForSection:", objc_msgSend(v8, "section"));
  }
  else
  {
    long long v15 = [v13 footerTitleForSection:v14];

    id v16 = [(HUItemCollectionViewController *)self itemManager];
    objc_msgSend(v16, "attributedFooterTitleForSection:", objc_msgSend(v8, "section"));
  uint64_t v17 = };

  objc_opt_class();
  id v18 = v12;
  if (objc_opt_isKindOfClass()) {
    objc_super v19 = v18;
  }
  else {
    objc_super v19 = 0;
  }
  id v20 = v19;

  uint64_t v21 = [(HUItemCollectionViewController *)self listContentConfigurationForSupplementaryElementOfKind:v11 atIndexPath:v8];

  if (v9 == a4 || !v17) {
    [v21 setText:v15];
  }
  else {
    [v21 setAttributedText:v17];
  }
  [v20 setContentConfiguration:v21];

  return v20;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend((id)+[HUItemCollectionViewController superclass](HUItemCollectionViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUItemCollectionViewController;
    [(HUItemCollectionViewController *)&v14 collectionView:v7 didSelectItemAtIndexPath:v8];
  }
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v10 = [v9 displayedItemAtIndexPath:v8];

  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);
  }

  id v12 = [(HUItemCollectionViewController *)self moduleControllerForItem:v10];
  long long v13 = v12;
  if (v12 && ![v12 didSelectItem:v10]) {
    [v7 deselectItemAtIndexPath:v8 animated:1];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v7];
  id v9 = v8;
  if (v8) {
    char v10 = [v8 canSelectItem:v7];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [a3 indexPathsForVisibleItems];
  id v9 = [v6 setWithArray:v8];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __75__HUItemCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  __int16 v17 = &unk_1E638E330;
  id v10 = v9;
  id v18 = v10;
  uint64_t v19 = self;
  id v11 = objc_msgSend(v7, "na_map:", &v14);

  if (objc_msgSend(v11, "count", v14, v15, v16, v17))
  {
    id v12 = [MEMORY[0x1E4F6A410] sharedInstance];
    id v13 = (id)[v12 prefetchIconDescriptors:v11];
  }
}

id __75__HUItemCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) itemManager];
    id v6 = [v5 displayedItemAtIndexPath:v3];

    objc_opt_class();
    id v7 = [v6 latestResults];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v4 = v9;
  }

  return v4;
}

void __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F65550] mainScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke_2;
  v4[3] = &unk_1E6386018;
  id v5 = *(id *)(a1 + 32);
  id v3 = (id)[v2 performWithQualityOfService:17 block:v4];
}

uint64_t __84__HUItemCollectionViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 changes];
  id v9 = [v8 allOperations];
  int v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_183_1);

  if (([v6 isInitialUpdate] & 1) != 0
    || ([(HUItemCollectionViewController *)self isViewLoaded] & 1) == 0)
  {
    [(HUItemCollectionViewController *)self performBatchCollectionViewUpdatesForUpdateRequest:v6 reloadOnly:1];
    if ([(HUItemCollectionViewController *)self isViewLoaded])
    {
      id v12 = [(HUItemCollectionViewController *)self collectionView];
      [v12 reloadData];
    }
    id v13 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v14 = [v13 allDisplayedItems];
    [(HUItemCollectionViewController *)self _preloadIconsIfNeededWithItems:v14];
  }
  else if (([(HUItemCollectionViewController *)self isLayoutDependentOnItemState] | v10))
  {
    id v11 = [(HUItemCollectionViewController *)self collectionView];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    __int16 v17 = __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke_2;
    id v18 = &unk_1E63850E0;
    uint64_t v19 = self;
    id v20 = v6;
    [v11 performBatchUpdates:&v15 completion:0];
  }
  else
  {
    [v6 performWithOptions:0];
  }
  -[HUItemCollectionViewController itemManagerDidUpdate:](self, "itemManagerDidUpdate:", v7, v15, v16, v17, v18, v19);
}

BOOL __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 0;
}

uint64_t __67__HUItemCollectionViewController_itemManager_performUpdateRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBatchCollectionViewUpdatesForUpdateRequest:*(void *)(a1 + 40) reloadOnly:0];
}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [(HUItemCollectionViewController *)self collectionView];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v7 deleteItemsAtIndexPaths:v8];
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [(HUItemCollectionViewController *)self collectionView];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v7 insertItemsAtIndexPaths:v8];
}

- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v12 = a5;
  id v8 = a6;
  if (![(HUItemCollectionViewController *)self suppressCollectionViewUpdatesForReorderCommit])
  {
    id v9 = [(HUItemCollectionViewController *)self collectionView];
    int v10 = [v9 cellForItemAtIndexPath:v12];

    if (objc_opt_respondsToSelector()) {
      [v10 updateUIWithAnimation:1];
    }
    id v11 = [(HUItemCollectionViewController *)self collectionView];
    [v11 moveItemAtIndexPath:v12 toIndexPath:v8];
  }
}

- (void)itemManager:(id)a3 didRemoveSections:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemCollectionViewController *)self collectionView];
  [v6 deleteSections:v5];
}

- (void)itemManager:(id)a3 didInsertSections:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemCollectionViewController *)self collectionView];
  [v6 insertSections:v5];
}

- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v7 = [(HUItemCollectionViewController *)self collectionView];
  [v7 moveSection:a4 toSection:a5];
}

uint64_t __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 module];
}

BOOL __67__HUItemCollectionViewController_itemManager_didUpdateItemModules___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 module];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![a3 runningState])
  {
    id v5 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
    unint64_t v6 = [v5 count];
    if (self && v6 >= 4)
    {
      if ([MEMORY[0x1E4F69758] isAMac])
      {

LABEL_11:
        id v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
          int v15 = 134218240;
          uint64_t v16 = [v12 count];
          __int16 v17 = 2048;
          uint64_t v18 = 3;
          _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%lu full item update(s) exceed threshold of %li. Canceling and doing full reload", (uint8_t *)&v15, 0x16u);
        }
        id v13 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
        objc_msgSend(v13, "na_each:", &__block_literal_global_195);

        id v9 = [(HUItemCollectionViewController *)self itemManager];
        id v14 = (id)[v9 reloadAndUpdateAllItemsFromSenderSelector:a2];
LABEL_14:

        return;
      }
      int v10 = [MEMORY[0x1E4F69138] isSpringBoard];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
      int v15 = 134217984;
      uint64_t v16 = [v8 count];
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Proceeding with %lu full item update(s)", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [(HUItemCollectionViewController *)self foregroundUpdateFutures];
    objc_msgSend(v9, "na_each:", &__block_literal_global_198);
    goto LABEL_14;
  }
}

uint64_t __76__HUItemCollectionViewController_executionEnvironmentRunningStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

uint64_t __76__HUItemCollectionViewController_executionEnvironmentRunningStateDidChange___block_invoke_196(uint64_t a1, void *a2)
{
  return [a2 finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (HFItem)hu_presentedItem
{
  id v2 = [(HUItemCollectionViewController *)self itemManager];
  id v3 = [v2 sourceItem];

  return (HFItem *)v3;
}

- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = v7;
  if (v4) {
    [v7 disableExternalUpdatesWithReason:v6];
  }
  else {
    [v7 endDisableExternalUpdatesWithReason:v6];
  }

  id v9 = (void *)MEMORY[0x1E4F1CA80];
  int v10 = [(HUItemCollectionViewController *)self childViewControllers];
  id v11 = [v9 setWithArray:v10];

  id v12 = [(HUItemCollectionViewController *)self childViewControllersToPreload];
  [v11 addObjectsFromArray:v12];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v18, "recursivelyDisableItemUpdates:withReason:", v4, v6, (void)v19);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  id v5 = a4;
  [(HUItemCollectionViewController *)self _transformViewControllerForRequest:v5];
  id v6 = [(UIViewController *)self hu_performPresentationRequest:v5];

  return v6;
}

- (void)_transformViewControllerForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 viewController];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v19 = v6;

  id v7 = v19;
  if (v19)
  {
    uint64_t v8 = [v19 preferredStyle];
    id v7 = v19;
    if (!v8)
    {
      uint64_t v9 = [v19 popoverPresentationController];
      id v7 = v19;
      if (v9)
      {
        int v10 = (void *)v9;
        id v11 = [v19 popoverPresentationController];
        id v12 = [v11 sourceView];

        id v7 = v19;
        if (!v12)
        {
          id v13 = [(HUItemCollectionViewController *)self collectionView];
          uint64_t v14 = [v13 indexPathsForSelectedItems];

          if ([v14 count] == 1)
          {
            uint64_t v15 = [v14 objectAtIndexedSubscript:0];
            uint64_t v16 = [(HUItemCollectionViewController *)self collectionView];
            __int16 v17 = [v16 cellForItemAtIndexPath:v15];

            if (!v17)
            {
              __int16 v17 = [(HUItemCollectionViewController *)self collectionView];
            }
            uint64_t v18 = [v19 popoverPresentationController];
            [v18 setSourceView:v17];
          }
          else
          {
            uint64_t v15 = [(HUItemCollectionViewController *)self collectionView];
            __int16 v17 = [v19 popoverPresentationController];
            [v17 setSourceView:v15];
          }

          id v7 = v19;
        }
      }
    }
  }
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return [(HUItemCollectionViewController *)self textFieldForVisibleItem:a4];
}

- (void)updateCellForItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  int v6 = [v5 diffableDataSourceDisabled];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__HUItemCollectionViewController_updateCellForItems___block_invoke;
    v10[3] = &unk_1E638E3C0;
    v10[4] = self;
    uint64_t v7 = objc_msgSend(v4, "na_map:", v10);

    uint64_t v8 = [(HUItemCollectionViewController *)self collectionView];
    [v8 reloadItemsAtIndexPaths:v7];

    id v4 = (id)v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __53__HUItemCollectionViewController_updateCellForItems___block_invoke_2;
    v9[3] = &unk_1E63889F8;
    v9[4] = self;
    objc_msgSend(v4, "na_each:", v9);
  }
}

id __53__HUItemCollectionViewController_updateCellForItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  id v5 = [v4 indexPathForItem:v3];

  return v5;
}

void __53__HUItemCollectionViewController_updateCellForItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) itemManager];
  id v4 = [v3 indexPathForItem:v7];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    int v6 = [v5 itemManager];
    [v5 itemManager:v6 didUpdateResultsForItem:v7 atIndexPath:v4];
  }
}

- (void)reloadCellForItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  int v6 = [v5 diffableDataSourceDisabled];

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__HUItemCollectionViewController_reloadCellForItems___block_invoke;
    v10[3] = &unk_1E638E3C0;
    v10[4] = self;
    id v7 = objc_msgSend(v4, "na_map:", v10);
    uint64_t v8 = [(HUItemCollectionViewController *)self collectionView];
    [v8 reloadItemsAtIndexPaths:v7];
  }
  else
  {
    uint64_t v9 = [(HUItemCollectionViewController *)self itemManager];
    [v9 reloadUIRepresentationForItems:v4 withAnimation:0];
  }
}

id __53__HUItemCollectionViewController_reloadCellForItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  id v5 = [v4 indexPathForItem:v3];

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  id v4 = -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:");
  id v5 = [(HUItemCollectionViewController *)self moduleControllerForItem:v4];
  int v6 = v5;
  if (v4 && v5)
  {
    [v5 textFieldDidBeginEditing:v7 item:v4];
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if ([(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v4]) {
    [(HUItemCollectionViewController *)self textFieldDidBeginEditing:v7 item:v4];
  }
LABEL_7:
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self _itemForTextField:v4];
  int v6 = [(HUItemCollectionViewController *)self moduleControllerForItem:v5];
  id v7 = v6;
  if (v5)
  {
    if ([v6 shouldManageTextFieldForItem:v5]) {
      [v7 textDidChange:&stru_1F18F92B8 forTextField:v4 item:v5];
    }
    if ([(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v5]) {
      [(HUItemCollectionViewController *)self textDidChange:&stru_1F18F92B8 forTextField:v4 item:v5];
    }
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self _itemForTextField:v4];
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 text];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "User finished editing text field for %@, entered: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v5];
  uint64_t v9 = v8;
  if (v5)
  {
    if ([v8 shouldManageTextFieldForItem:v5]) {
      [v9 textFieldDidEndEditing:v4 item:v5];
    }
    if ([(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v5]) {
      [(HUItemCollectionViewController *)self textFieldDidEndEditing:v4 item:v5];
    }
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v9 = [a3 object];
  id v4 = -[HUItemCollectionViewController _itemForTextField:](self, "_itemForTextField:");
  id v5 = [(HUItemCollectionViewController *)self moduleControllerForItem:v4];
  int v6 = v5;
  if (v4)
  {
    if ([v5 shouldManageTextFieldForItem:v4])
    {
      id v7 = [v9 text];
      [v6 textDidChange:v7 forTextField:v9 item:v4];
    }
    if ([(HUItemCollectionViewController *)self shouldManageTextFieldForItem:v4])
    {
      uint64_t v8 = [v9 text];
      [(HUItemCollectionViewController *)self textDidChange:v8 forTextField:v9 item:v4];
    }
  }
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self moduleControllerForItem:v4];
  int v6 = v5;
  if (v5) {
    char v7 = [v5 shouldManageTextFieldForItem:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  int v6 = [v5 indexPathForItem:v4];

  if (v6)
  {
    char v7 = [(HUItemCollectionViewController *)self collectionView];
    uint64_t v8 = [v7 cellForItemAtIndexPath:v6];

    id v9 = v8;
    if ([v9 conformsToProtocol:&unk_1F19E8A08]) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;

    __int16 v12 = [v11 textField];
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v7];
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 currentTextForTextField:v6 item:v7];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v7];
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 defaultTextForTextField:v6 item:v7];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HUItemCollectionViewController *)self moduleControllerForItem:v6];
  id v9 = v8;
  if (v8) {
    [v8 placeholderTextForTextField:v7 item:v6];
  }
  else {
  int v10 = [(HUItemCollectionViewController *)self defaultTextForTextField:v7 item:v6];
  }

  return v10;
}

uint64_t __73__HUItemCollectionViewController_cleanupRecentlyRemovedModuleControllers__block_invoke_208(uint64_t a1, void *a2)
{
  return [a2 moduleIdentifier];
}

- (id)_itemForTextField:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self textFieldToCellMap];
  id v6 = [v5 objectForKey:v4];

  id v7 = v6;
  if ([v7 conformsToProtocol:&unk_1F19D2698]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  int v10 = [v9 item];

  if (v10)
  {
    id v11 = [v9 item];
  }
  else
  {
    __int16 v12 = [(HUItemCollectionViewController *)self collectionView];
    id v13 = [v12 indexPathForCell:v7];

    if (v13)
    {
      uint64_t v14 = [(HUItemCollectionViewController *)self itemManager];
      id v11 = [v14 displayedItemAtIndexPath:v13];
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (void)setItemManager:(id)a3
{
}

- (BOOL)suppressCollectionViewUpdatesForReorderCommit
{
  return self->_suppressCollectionViewUpdatesForReorderCommit;
}

- (void)setSuppressCollectionViewUpdatesForReorderCommit:(BOOL)a3
{
  self->_suppressCollectionViewUpdatesForReorderCommit = a3;
}

- (NSMutableSet)internalItemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (NSMapTable)textFieldToCellMap
{
  return self->_textFieldToCellMap;
}

- (NSMutableArray)foregroundUpdateFutures
{
  return self->_foregroundUpdateFutures;
}

- (void)setForegroundUpdateFutures:(id)a3
{
}

- (NACancelable)deferredVisibilityUpdate
{
  return self->_deferredVisibilityUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, 0);
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, 0);
  objc_storeStrong((id *)&self->_iconPreloadCancelable, 0);
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, 0);
  objc_storeStrong((id *)&self->_viewVisibleFutures, 0);
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, 0);
  objc_storeStrong((id *)&self->_registeredCellClasses, 0);
  objc_storeStrong((id *)&self->_textFieldToCellMap, 0);
  objc_storeStrong((id *)&self->_recentlyRemovedItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_internalItemModuleControllers, 0);

  objc_storeStrong((id *)&self->_itemManager, 0);
}

@end