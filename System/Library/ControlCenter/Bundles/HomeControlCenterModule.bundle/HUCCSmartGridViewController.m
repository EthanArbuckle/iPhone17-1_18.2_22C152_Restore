@interface HUCCSmartGridViewController
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_gridLayout;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasTapActionForItem:(id)a3;
- (BOOL)_shouldShowHomeNameInHomeCell;
- (BOOL)canDismissQuickControl;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)isBoundsChangeUpdate;
- (BOOL)isViewVisible;
- (BOOL)needsLayoutOptionsUpdate;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinatorShouldDisablePullToUnlockSettings:(id)a3;
- (BOOL)shouldBlockCurrentUserFromHome;
- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFHomeKitDispatcher)dispatcher;
- (HUCCSmartGridViewController)initWithItemType:(unint64_t)a3 delegate:(id)a4;
- (HUCCSmartGridViewControllerDelegate)delegate;
- (HUGridHomeCell)homeCell;
- (HUGridLayoutOptions)expandedCellLayoutOptions;
- (HUGridLayoutOptions)singleCellLayoutOptions;
- (HUGridSize)occupiedGridSizeForOrientation:(int64_t)a3;
- (HUMosaicLayout)mosaicLayout;
- (HUMosaicLayoutGeometry)mosaicLayoutGeometry;
- (HUOpenURLHandling)URLHandler;
- (NSString)description;
- (UICollectionViewCell)pressedTile;
- (id)_cellLayoutOptionsForItem:(id)a3;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)arranger;
- (id)detailViewURLHandlerForPresentationCoordinator:(id)a3;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4;
- (id)presentAccessoryControlsForItem:(id)a3;
- (id)traitCollectionForPresentationCoordinator:(id)a3;
- (int64_t)preferredModalPresentationStyleForPresentationCoordinator:(id)a3;
- (unint64_t)cellSizeForItemAtIndexPath:(id)a3;
- (unint64_t)itemType;
- (unint64_t)sizeSubclass;
- (void)_checkForCollectionViewAssertions:(id)a3;
- (void)_enqueueLayoutOptionsUpdate;
- (void)_performItemConsistencyCheckForIndexPaths:(id)a3 withUpdateRequest:(id)a4;
- (void)_preloadItemsForPossiblePresentation;
- (void)_restorePressedTileIfNeeded;
- (void)_showDashboardControllerForHome:(id)a3;
- (void)_updateHomeCell;
- (void)_updateLayoutOptions;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)dealloc;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)itemManagerDidChangeMosaicLayout:(id)a3;
- (void)itemManagerDidChangeNumberOfPlaceholderItems:(id)a3;
- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4;
- (void)presentationCoordinatorWillBeginTransition:(id)a3 presenting:(BOOL)a4;
- (void)presentationCoordinatorWillEndTransition:(id)a3 presenting:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setExpandedCellLayoutOptions:(id)a3;
- (void)setHomeCell:(id)a3;
- (void)setIsBoundsChangeUpdate:(BOOL)a3;
- (void)setMosaicLayout:(id)a3;
- (void)setMosaicLayoutGeometry:(id)a3;
- (void)setNeedsLayoutOptionsUpdate:(BOOL)a3;
- (void)setPressedTile:(id)a3;
- (void)setShouldBlockCurrentUserFromHome:(BOOL)a3;
- (void)setSingleCellLayoutOptions:(id)a3;
- (void)setSizeSubclass:(unint64_t)a3;
- (void)setURLHandler:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissWithViewController:(id)a3;
@end

@implementation HUCCSmartGridViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    *(void *)v36 = v7;
    *(_WORD *)&v36[8] = 2080;
    v37 = "-[HUCCSmartGridViewController viewWillAppear:]";
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  objc_msgSend_setViewVisible_(self, v8, 1);
  v34.receiver = self;
  v34.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v34 viewWillAppear:v3];
  if (objc_msgSend_needsLayoutOptionsUpdate(self, v9, v10)) {
    objc_msgSend__updateLayoutOptions(self, v11, v12);
  }
  objc_msgSend__restorePressedTileIfNeeded(self, v11, v12);
  v15 = objc_msgSend_itemManager(self, v13, v14);
  v18 = objc_msgSend_home(v15, v16, v17);
  uint64_t shouldBlockCurrentUserFromHome = objc_msgSend_hf_shouldBlockCurrentUserFromHome(v18, v19, v20);

  if (shouldBlockCurrentUserFromHome != objc_msgSend_shouldBlockCurrentUserFromHome(self, v22, v23))
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = objc_msgSend_shouldBlockCurrentUserFromHome(self, v25, v26);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v36 = v27;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = shouldBlockCurrentUserFromHome;
      _os_log_impl(&dword_24065C000, v24, OS_LOG_TYPE_DEFAULT, "shouldBlockCurrentUserFromHome was %{BOOL}d and is now %{BOOL}d - reloading HUCCSmartGridItemManager", buf, 0xEu);
    }

    objc_msgSend_setShouldBlockCurrentUserFromHome_(self, v28, shouldBlockCurrentUserFromHome);
    v31 = objc_msgSend_itemManager(self, v29, v30);
    objc_msgSend_loadDefaultProviderItem(v31, v32, v33);
  }
}

- (HUCCSmartGridViewController)initWithItemType:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F49B68]);
  objc_msgSend_setMosaicLayout_(self, v8, (uint64_t)v7);

  v9 = [HUCCSmartGridItemManager alloc];
  v11 = objc_msgSend_initWithMosaicLayoutDelegate_(v9, v10, (uint64_t)self);
  uint64_t v14 = objc_msgSend_mosaicLayout(self, v12, v13);
  v28.receiver = self;
  v28.super_class = (Class)HUCCSmartGridViewController;
  v15 = [(HUControllableItemCollectionViewController *)&v28 initWithItemManager:v11 collectionViewLayout:v14];

  if (v15)
  {
    v15->_itemType = a3;
    v15->_needsLayoutOptionsUpdate = 1;
    objc_storeWeak((id *)&v15->_delegate, v6);
    uint64_t v18 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v16, v17);
    dispatcher = v15->_dispatcher;
    v15->_dispatcher = (HFHomeKitDispatcher *)v18;

    objc_msgSend_addHomeManagerObserver_(v15->_dispatcher, v20, (uint64_t)v15);
    uint64_t v23 = objc_msgSend_mosaicLayout(v15, v21, v22);
    objc_msgSend_setDelegate_(v23, v24, (uint64_t)v15);

    if (objc_msgSend_isViewLoaded(v15, v25, v26)) {
      NSLog(&cfstr_ViewWasLoadedT.isa);
    }
  }

  return v15;
}

- (void)dealloc
{
  v4 = objc_msgSend_mosaicLayout(self, a2, v2);
  objc_msgSend_setDelegate_(v4, v5, 0);

  v6.receiver = self;
  v6.super_class = (Class)HUCCSmartGridViewController;
  [(HUCCSmartGridViewController *)&v6 dealloc];
}

- (void)setSizeSubclass:(unint64_t)a3
{
  if (self->_sizeSubclass != a3)
  {
    self->_sizeSubclass = a3;
    MEMORY[0x270F9A6D0]();
  }
}

- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4
{
  BOOL v5 = a3;
  objc_super v6 = objc_msgSend_quickControlPresentationCoordinator(self, a2, a3);
  v8 = objc_msgSend_dismissQuickControlAnimated_wasDismissed_(v6, v7, v5, a4);

  return v8;
}

- (void)_preloadItemsForPossiblePresentation
{
  BOOL v5 = objc_msgSend_itemManager(self, a2, v2);
  v8 = objc_msgSend_home(v5, v6, v7);
  self->_uint64_t shouldBlockCurrentUserFromHome = objc_msgSend_hf_shouldBlockCurrentUserFromHome(v8, v9, v10);

  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_240662824;
  v12[3] = &unk_2650CC0C0;
  v12[4] = self;
  v12[5] = a2;
  dispatch_after(v11, MEMORY[0x263EF83A0], v12);
}

- (BOOL)canDismissQuickControl
{
  BOOL v3 = objc_msgSend_quickControlPresentationCoordinator(self, a2, v2);
  char isQuickControlPresented = objc_msgSend_isQuickControlPresented(v3, v4, v5);

  return isQuickControlPresented;
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  if (!mosaicLayoutGeometry)
  {
    objc_msgSend_layoutGeometry(HUCCSmartGridLayout, a2, v2);
    uint64_t v5 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    objc_super v6 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v5;

    mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  }

  return mosaicLayoutGeometry;
}

- (HUGridHomeCell)homeCell
{
  p_homeCell = &self->_homeCell;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeCell);
  if (!WeakRetained) {
    goto LABEL_3;
  }
  uint64_t v7 = WeakRetained;
  v8 = objc_msgSend_collectionView(self, v5, v6);
  id v9 = objc_loadWeakRetained((id *)p_homeCell);
  dispatch_time_t v11 = objc_msgSend_indexPathForCell_(v8, v10, (uint64_t)v9);

  if (!v11)
  {
LABEL_3:
    uint64_t v12 = objc_msgSend_collectionView(self, v5, v6);
    v15 = objc_msgSend_visibleCells(v12, v13, v14);
    uint64_t v17 = objc_msgSend_na_firstObjectPassingTest_(v15, v16, (uint64_t)&unk_26F4C8020);
    objc_storeWeak((id *)p_homeCell, v17);
  }
  id v18 = objc_loadWeakRetained((id *)p_homeCell);

  return (HUGridHomeCell *)v18;
}

- (HUGridSize)occupiedGridSizeForOrientation:(int64_t)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  unint64_t v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    uint64_t v5 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, a3);
    uint64_t v8 = objc_msgSend_userInterfaceIdiom(v5, v6, v7);

    if (v8 != 1)
    {
      v48 = HFLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_24065C000, v48, OS_LOG_TYPE_DEFAULT, "Using landscape mosaic layout geometry", (uint8_t *)&v53, 2u);
      }

      int v27 = objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v49, 0);
      uint64_t v46 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(MEMORY[0x263F49B78], v50, (uint64_t)v27, 0);
      goto LABEL_17;
    }
  }
  mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  if (!mosaicLayoutGeometry)
  {
    uint64_t v38 = HFLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_24065C000, v38, OS_LOG_TYPE_DEFAULT, "No mosaic layout geometry available. Using full size grid", (uint8_t *)&v53, 2u);
    }

    objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v39, v4 < 2);
    v40 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    v41 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v40;

    v42 = (void *)MEMORY[0x263F49B78];
    int v27 = objc_msgSend_mosaicLayoutGeometry(self, v43, v44);
    uint64_t v46 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(v42, v45, (uint64_t)v27, 0);
LABEL_17:
    uint64_t v35 = v46;
    int64_t v37 = v47;
    goto LABEL_18;
  }
  if (v4 < 2 != objc_msgSend_isPortrait(mosaicLayoutGeometry, a2, a3))
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 67109120;
      LODWORD(v54) = v4 < 2;
      _os_log_impl(&dword_24065C000, v10, OS_LOG_TYPE_DEFAULT, "Updating isPortrait to %{BOOL}d because orientation changed", (uint8_t *)&v53, 8u);
    }

    objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v11, v4 < 2);
    uint64_t v12 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v12;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_msgSend_itemManager(self, v15, v16);
    uint64_t v20 = objc_msgSend_numberOfPlaceholderItems(v17, v18, v19);
    uint64_t v23 = objc_msgSend_mosaicLayoutGeometry(self, v21, v22);
    int v53 = 134218242;
    uint64_t v54 = v20;
    __int16 v55 = 2112;
    v56 = v23;
    _os_log_impl(&dword_24065C000, v14, OS_LOG_TYPE_DEFAULT, "Using mosiac layout geometry for %lu placeholder items: %@", (uint8_t *)&v53, 0x16u);
  }
  v24 = (void *)MEMORY[0x263F49B78];
  int v27 = objc_msgSend_mosaicLayoutGeometry(self, v25, v26);
  uint64_t v30 = objc_msgSend_itemManager(self, v28, v29);
  uint64_t v33 = objc_msgSend_numberOfPlaceholderItems(v30, v31, v32);
  uint64_t v35 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(v24, v34, (uint64_t)v27, v33);
  int64_t v37 = v36;

LABEL_18:
  int64_t v51 = v35;
  int64_t v52 = v37;
  result.var1 = v52;
  result.var0 = v51;
  return result;
}

- (void)viewDidLoad
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    __int16 v25 = 2080;
    uint64_t v26 = "-[HUCCSmartGridViewController viewDidLoad]";
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v22 viewDidLoad];
  uint64_t v8 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v6, v7);
  dispatch_time_t v11 = objc_msgSend_collectionView(self, v9, v10);
  objc_msgSend_setBackgroundColor_(v11, v12, (uint64_t)v8);

  v15 = objc_msgSend_collectionView(self, v13, v14);
  objc_msgSend_setScrollEnabled_(v15, v16, 0);

  uint64_t v19 = objc_msgSend_itemManager(self, v17, v18);
  objc_msgSend_loadDefaultProviderItem(v19, v20, v21);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v14 viewDidAppear:a3];
  unint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v9 = objc_msgSend_view(self, v7, v8);
    uint64_t v12 = objc_msgSend_window(v9, v10, v11);
    uint64_t v13 = @"yes";
    if (!v12) {
      uint64_t v13 = @"no";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v6;
    __int16 v17 = 2080;
    uint64_t v18 = "-[HUCCSmartGridViewController viewDidAppear:]";
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_24065C000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    __int16 v16 = 2080;
    __int16 v17 = "-[HUCCSmartGridViewController viewDidDisappear:]";
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);
  }
  v13.receiver = self;
  v13.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v13 viewDidDisappear:v3];
  objc_msgSend_setViewVisible_(self, v8, 0);
  objc_msgSend__restorePressedTileIfNeeded(self, v9, v10);
  objc_msgSend_setMosaicLayoutGeometry_(self, v11, 0);
  objc_msgSend_setIsBoundsChangeUpdate_(self, v12, 0);
}

- (void)_enqueueLayoutOptionsUpdate
{
  if (objc_msgSend_isViewVisible(self, a2, v2))
  {
    objc_msgSend__updateLayoutOptions(self, v4, v5);
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_setNeedsLayoutOptionsUpdate_, 1);
  }
}

- (void)_updateLayoutOptions
{
  unint64_t v4 = objc_msgSend_view(self, a2, v2);
  objc_msgSend_bounds(v4, v5, v6);
  uint64_t v10 = objc_msgSend_layoutOptionsForViewSize_andMosaicSize_(HUCCSmartGridLayout, v7, 1, v8, v9);
  objc_msgSend_setSingleCellLayoutOptions_(self, v11, (uint64_t)v10);

  objc_super v14 = objc_msgSend_view(self, v12, v13);
  objc_msgSend_bounds(v14, v15, v16);
  uint64_t v20 = objc_msgSend_layoutOptionsForViewSize_andMosaicSize_(HUCCSmartGridLayout, v17, 2, v18, v19);
  objc_msgSend_setExpandedCellLayoutOptions_(self, v21, (uint64_t)v20);

  MEMORY[0x270F9A6D0](self, sel_setNeedsLayoutOptionsUpdate_, 0);
}

- (id)_cellLayoutOptionsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_expandedCellLayoutOptions(self, v5, v6);
    uint64_t v10 = objc_msgSend_sceneCellOptions(v7, v8, v9);
    goto LABEL_5;
  }
  if (objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_26F507260))
  {
    uint64_t v7 = objc_msgSend_singleCellLayoutOptions(self, v11, v12);
    uint64_t v10 = objc_msgSend_serviceCellOptions(v7, v13, v14);
LABEL_5:
    v15 = (void *)v10;

    if (v15) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend_expandedCellLayoutOptions(self, v16, v17),
        double v18 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_sceneCellOptions(v18, v19, v20),
        v15 = objc_claimAutoreleasedReturnValue(),
        v18,
        objc_msgSend_setCellInnerMargin_(v15, v21, v22, 12.0),
        objc_msgSend_setIconInnerHorizontalMargin_(v15, v23, v24, 10.0),
        !v15))
  {
LABEL_9:
    NSLog(&cfstr_MissingCellLay.isa, v4);
    v15 = 0;
  }
LABEL_10:

  return v15;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_gridLayout
{
  id v4 = (void *)MEMORY[0x263F49B50];
  uint64_t v5 = objc_msgSend_itemType(self, a2, v2);
  uint64_t v9 = objc_msgSend_sizeSubclass(self, v6, v7);

  unint64_t v10 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(v4, v8, v5, v9);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  if (objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_26F507260)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v10 = objc_opt_class();
  }
  else
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"HUCCSmartGridViewController.m", 277, @"Unknown item %@", v6);

    unint64_t v10 = 0;
  }

  return (Class)v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v46 configureCell:v6 forItem:v7];
  id v8 = v6;
  if (objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_26F507568)) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v13 = objc_msgSend__cellLayoutOptionsForItem_(self, v12, (uint64_t)v7);
    objc_msgSend_setLayoutOptions_(v11, v14, (uint64_t)v13);

    objc_msgSend_setPointerInteractionEnabled_(v11, v15, 1);
    objc_msgSend_cellSpacing(HUCCSmartGridLayout, v16, v17);
    objc_msgSend_setPointerRegionMargin_(v11, v18, v19);
  }
  objc_opt_class();
  id v20 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    objc_opt_class();
    id v23 = v7;
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = v24;

    objc_super v28 = objc_msgSend_itemManager(self, v26, v27);
    v31 = objc_msgSend_allDisplayedItems(v28, v29, v30);
    if (objc_msgSend_count(v31, v32, v33) == 1)
    {
    }
    else
    {
      int64_t v37 = objc_msgSend_home(v25, v34, v35);

      if (v37)
      {
        uint64_t shouldShowHomeNameInHomeCell = objc_msgSend__shouldShowHomeNameInHomeCell(self, v36, v38);
        objc_msgSend_setShouldShowHomeName_(v22, v40, shouldShowHomeNameInHomeCell);
        objc_msgSend_setShouldShowAsEmptyHome_(v22, v41, 0);
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_msgSend_setShouldShowAsEmptyHome_(v22, v36, 1);
    uint64_t v44 = objc_msgSend_mosaicLayoutGeometry(self, v42, v43);
    objc_msgSend_setMosaicLayoutGeometry_(v22, v45, (uint64_t)v44);

    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_deselectItemAtIndexPath_animated_(v7, v8, (uint64_t)v6, 0);
  v9.receiver = self;
  v9.super_class = (Class)HUCCSmartGridViewController;
  [(HUItemCollectionViewController *)&v9 collectionView:v7 didSelectItemAtIndexPath:v6];
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!objc_msgSend_requiresUnlockToPerformActionForItem_(self, v8, (uint64_t)v6)) {
    goto LABEL_5;
  }
  id v11 = objc_msgSend_delegate(self, v9, v10);
  char isDeviceUnlockedForGridViewController = objc_msgSend_isDeviceUnlockedForGridViewController_(v11, v12, (uint64_t)self);

  if (isDeviceUnlockedForGridViewController) {
    goto LABEL_5;
  }
  uint64_t v14 = objc_msgSend_delegate(self, v9, v10);
  uint64_t v16 = objc_msgSend_prepareForActionRequiringDeviceUnlockForGridViewController_(v14, v15, (uint64_t)self);

  if (v16)
  {
    int v17 = 0;
    double v18 = v16;
  }
  else
  {
LABEL_5:
    double v18 = objc_msgSend_futureWithNoResult(MEMORY[0x263F58190], v9, v10);
    uint64_t v16 = 0;
    int v17 = 1;
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_240663990;
  v24[3] = &unk_2650CC108;
  id v25 = v6;
  id v26 = v7;
  uint64_t v27 = self;
  id v19 = v7;
  id v20 = v6;
  id v22 = objc_msgSend_flatMap_(v18, v21, (uint64_t)v24);

  if (v17) {

  }
  return v22;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUCCSmartGridViewController;
    BOOL v8 = [(HUControllableItemCollectionViewController *)&v10 _hasTapActionForItem:v5];
  }

  return v8;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412802;
    id v26 = v10;
    __int16 v27 = 2080;
    objc_super v28 = "-[HUCCSmartGridViewController _performTapActionForItem:tappedArea:]";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_24065C000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s %@", buf, 0x20u);
  }
  objc_opt_class();
  id v11 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v14 = (void *)MEMORY[0x263F58190];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_240663CF4;
    v22[3] = &unk_2650CC130;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v13;
    int v17 = objc_msgSend_mainThreadScheduler(MEMORY[0x263F581B8], v15, v16);
    id v19 = objc_msgSend_futureWithBlock_scheduler_(v14, v18, (uint64_t)v22, v17);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)HUCCSmartGridViewController;
    id v19 = [(HUControllableItemCollectionViewController *)&v21 _performTapActionForItem:v11 tappedArea:v7];
  }

  return v19;
}

- (void)_showDashboardControllerForHome:(id)a3
{
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayHome_(v8, v7, (uint64_t)v4);
}

- (void)_updateHomeCell
{
  uint64_t shouldShowHomeNameInHomeCell = objc_msgSend__shouldShowHomeNameInHomeCell(self, a2, v2);
  objc_msgSend_homeCell(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShouldShowHomeName_(v8, v7, shouldShowHomeNameInHomeCell);
}

- (BOOL)_shouldShowHomeNameInHomeCell
{
  BOOL v3 = objc_msgSend_dispatcher(self, a2, v2);
  uint64_t v6 = objc_msgSend_homeManager(v3, v4, v5);
  objc_super v9 = objc_msgSend_homes(v6, v7, v8);
  BOOL v12 = (unint64_t)objc_msgSend_count(v9, v10, v11) > 1;

  return v12;
}

- (void)_restorePressedTileIfNeeded
{
  uint64_t v4 = objc_msgSend_pressedTile(self, a2, v2);
  if (v4)
  {
    id v7 = (void *)v4;
    uint64_t v8 = objc_msgSend_pressedTile(self, v5, v6);
    int isHidden = objc_msgSend_isHidden(v8, v9, v10);

    if (isHidden)
    {
      objc_msgSend_pressedTile(self, v12, v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v15, v14, 0);
    }
  }
}

- (id)arranger
{
  id v2 = objc_alloc(MEMORY[0x263F49B10]);
  uint64_t v5 = objc_msgSend_mosaicType(HUCCSmartGridLayout, v3, v4);
  id v7 = objc_msgSend_initWithCCMosaicType_(v2, v6, v5);

  return v7;
}

- (void)itemManagerDidChangeMosaicLayout:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isBoundsChangeUpdate(self, a2, (uint64_t)a3))
  {
    objc_msgSend_setIsBoundsChangeUpdate_(self, v4, 0);
  }
  else
  {
    uint64_t v8 = objc_msgSend_delegate(self, v4, v5);
    objc_msgSend_gridSizeMayHaveChanged(v8, v9, v10);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v11 = objc_msgSend_collectionView(self, v6, v7, 0);
  uint64_t v14 = objc_msgSend_visibleCells(v11, v12, v13);

  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v38, v42, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v39;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * v21);
        id v23 = objc_msgSend_collectionView(self, v17, v18);
        id v25 = objc_msgSend_indexPathForCell_(v23, v24, v22);

        if (v25)
        {
          objc_super v28 = objc_msgSend_itemManager(self, v26, v27);
          id v30 = objc_msgSend_mosaicDetailsForDisplayedItemAtIndexPath_(v28, v29, (uint64_t)v25);

          if (v30)
          {
            uint64_t v33 = objc_msgSend_baseItem(v30, v31, v32);

            if (v33)
            {
              int64_t v36 = objc_msgSend_baseItem(v30, v34, v35);
              objc_msgSend_configureCell_forItem_(self, v37, v22, v36);
            }
          }
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v38, v42, 16);
    }
    while (v19);
  }
}

- (void)itemManagerDidChangeNumberOfPlaceholderItems:(id)a3
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gridSizeMayHaveChanged(v5, v3, v4);
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v13 = objc_msgSend_changes(v7, v11, v12);
    uint64_t v16 = objc_msgSend_operationDescription(v13, v14, v15);
    *(_DWORD *)buf = 138413058;
    __int16 v29 = v10;
    __int16 v30 = 2080;
    uint64_t v31 = "-[HUCCSmartGridViewController itemManager:performUpdateRequest:]";
    __int16 v32 = 2112;
    id v33 = v6;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    _os_log_impl(&dword_24065C000, v8, OS_LOG_TYPE_INFO, "%@:%s %@ performing item operations: %@", buf, 0x2Au);
  }
  objc_msgSend__checkForCollectionViewAssertions_(self, v17, (uint64_t)v7);
  v27.receiver = self;
  v27.super_class = (Class)HUCCSmartGridViewController;
  [(HUControllableItemCollectionViewController *)&v27 itemManager:v6 performUpdateRequest:v7];
  if (objc_msgSend_isViewLoaded(self, v18, v19))
  {
    uint64_t v22 = objc_msgSend_collectionView(self, v20, v21);
    id v25 = objc_msgSend_indexPathsForVisibleItems(v22, v23, v24);
    objc_msgSend__performItemConsistencyCheckForIndexPaths_withUpdateRequest_(self, v26, (uint64_t)v25, v7);
  }
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (self
    && ((objc_msgSend_isViewVisible(self, v11, v12) & 1) != 0
     || (objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x263F479F0]),
         uint64_t v16 = objc_claimAutoreleasedReturnValue(),
         v16,
         v16)))
  {
    int v17 = objc_msgSend_superclass(HUCCSmartGridViewController, v14, v15);
    if (objc_msgSend_instancesRespondToSelector_(v17, v18, (uint64_t)a2))
    {
      v30.receiver = self;
      v30.super_class = (Class)HUCCSmartGridViewController;
      uint64_t v21 = [(HUItemCollectionViewController *)&v30 itemManager:v9 futureToUpdateItems:v10 itemUpdateOptions:v13];
    }
    else
    {
      uint64_t v21 = objc_msgSend_futureWithNoResult(MEMORY[0x263F58190], v19, v20);
    }
    objc_super v28 = (void *)v21;
  }
  else
  {
    uint64_t v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v32 = self;
      _os_log_impl(&dword_24065C000, v22, OS_LOG_TYPE_DEFAULT, "Blocking full item update for view controller %@ as we are not visible.", buf, 0xCu);
    }

    id v23 = (void *)MEMORY[0x263F58190];
    id v26 = objc_msgSend_na_cancelledError(MEMORY[0x263F087E8], v24, v25);
    objc_super v28 = objc_msgSend_futureWithError_(v23, v27, (uint64_t)v26);
  }

  return v28;
}

- (unint64_t)cellSizeForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_itemManager(self, v5, v6);
  id v9 = objc_msgSend_mosaicDetailsForDisplayedItemAtIndexPath_(v7, v8, (uint64_t)v4);

  unint64_t v12 = objc_msgSend_itemSize(v9, v10, v11);
  if (v12 <= 1) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = v12;
  }

  return v13;
}

- (int64_t)preferredModalPresentationStyleForPresentationCoordinator:(id)a3
{
  return 6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v31[1] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)HUCCSmartGridViewController;
  BOOL v10 = -[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](&v30, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a3, a5);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_collectionView(self, v8, v9);
    uint64_t v14 = objc_msgSend_indexPathForItemAtPoint_(v11, v12, v13, x, y);

    if (v14)
    {
      v31[0] = v14;
      uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v31, 1);
      objc_msgSend__performItemConsistencyCheckForIndexPaths_withUpdateRequest_(self, v17, (uint64_t)v16, 0);

      uint64_t v20 = objc_msgSend_itemManager(self, v18, v19);
      uint64_t v22 = objc_msgSend_displayedItemAtIndexPath_(v20, v21, (uint64_t)v14);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = objc_msgSend_collectionView(self, v23, v24);
        objc_super v27 = objc_msgSend_cellForItemAtIndexPath_(v25, v26, (uint64_t)v14);
        objc_msgSend_setPressedTile_(self, v28, (uint64_t)v27);
      }
    }
  }
  return v10;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_itemManager(self, v9, v10);
  uint64_t v14 = objc_msgSend_item(v8, v12, v13);
  uint64_t v15 = objc_opt_class();
  int v17 = objc_msgSend_childItemsForItem_ofClass_(v11, v16, (uint64_t)v14, v15);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_240664988;
  v46[3] = &unk_2650CC158;
  v46[4] = self;
  int v19 = objc_msgSend_na_any_(v17, v18, (uint64_t)v46);

  if (v19)
  {
    uint64_t v22 = objc_msgSend_delegate(self, v20, v21);
    char isDeviceUnlockedForGridViewController = objc_msgSend_isDeviceUnlockedForGridViewController_(v22, v23, (uint64_t)self);

    if ((isDeviceUnlockedForGridViewController & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_240664994;
      block[3] = &unk_2650CC1A8;
      block[4] = self;
      id v44 = v8;
      id v45 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_9;
    }
  }
  uint64_t v25 = objc_msgSend_item(v8, v20, v21);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    __int16 v29 = objc_msgSend_item(v8, v27, v28);
    id v31 = (id)objc_msgSend__performTapActionForItem_(self, v30, (uint64_t)v29);

LABEL_9:
    BOOL v40 = 0;
    goto LABEL_10;
  }
  __int16 v32 = objc_msgSend_controlItems(v8, v27, v28);
  uint64_t v35 = objc_msgSend_count(v32, v33, v34);

  if (!v35) {
    goto LABEL_9;
  }
  long long v38 = objc_msgSend_superclass(HUCCSmartGridViewController, v36, v37);
  if (objc_msgSend_instancesRespondToSelector_(v38, v39, (uint64_t)a2))
  {
    v42.receiver = self;
    v42.super_class = (Class)HUCCSmartGridViewController;
    BOOL v40 = [(HUControllableItemCollectionViewController *)&v42 presentationCoordinator:v7 shouldBeginPresentationWithContext:v8];
  }
  else
  {
    BOOL v40 = 1;
  }
LABEL_10:

  return v40;
}

- (void)presentationCoordinatorWillBeginTransition:(id)a3 presenting:(BOOL)a4
{
  if (a4)
  {
    objc_msgSend_pressedTile(self, a2, (uint64_t)a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v5, v4, 1);
  }
}

- (void)presentationCoordinatorWillEndTransition:(id)a3 presenting:(BOOL)a4
{
  if (!a4) {
    objc_msgSend__restorePressedTileIfNeeded(self, a2, (uint64_t)a3);
  }
}

- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_superclass(HUCCSmartGridViewController, v9, v10);
  if (objc_msgSend_instancesRespondToSelector_(v11, v12, (uint64_t)a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)HUCCSmartGridViewController;
    [(HUControllableItemCollectionViewController *)&v16 presentationCoordinator:v7 didEndPresentationWithContext:v8];
  }
  objc_msgSend__restorePressedTileIfNeeded(self, v13, v14);
  objc_msgSend_setPressedTile_(self, v15, 0);
}

- (id)traitCollectionForPresentationCoordinator:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1CB00], sel_traitCollectionWithUserInterfaceStyle_, 2);
}

- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3
{
  return 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (id)detailViewURLHandlerForPresentationCoordinator:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_URLHandler, a3);
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinatorShouldDisablePullToUnlockSettings:(id)a3
{
  return 1;
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  objc_msgSend__updateHomeCell(self, a2, (uint64_t)a3, a4, a5);

  MEMORY[0x270F9A6D0](self, sel__preloadItemsForPossiblePresentation, v6);
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  objc_msgSend__updateHomeCell(self, a2, (uint64_t)a3);

  MEMORY[0x270F9A6D0](self, sel__preloadItemsForPossiblePresentation, v4);
}

- (void)_performItemConsistencyCheckForIndexPaths:(id)a3 withUpdateRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isViewLoaded(self, v8, v9))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_240664D84;
    v17[3] = &unk_2650CC1D0;
    v17[4] = self;
    uint64_t v11 = objc_msgSend_na_map_(v6, v10, (uint64_t)v17);
    if (objc_msgSend_count(v11, v12, v13))
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = sub_240664EBC;
      activity_block[3] = &unk_2650CC1F8;
      id v15 = v11;
      id v16 = v7;
      _os_activity_initiate(&dword_24065C000, "Control Center item update inconsistency", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
  }
}

- (void)_checkForCollectionViewAssertions:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_collectionView(self, v5, v6);
  uint64_t v10 = objc_msgSend_numberOfSections(v7, v8, v9);

  if (!v10)
  {
    uint64_t v13 = objc_msgSend_changes(v4, v11, v12);
    id v16 = objc_msgSend_allOperations(v13, v14, v15);
    char v18 = objc_msgSend_na_any_(v16, v17, (uint64_t)&unk_26F4C8040);

    if ((v18 & 1) == 0)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = sub_240665520;
      v19[3] = &unk_2650CC1F8;
      v19[4] = self;
      id v20 = v4;
      _os_activity_initiate(&dword_24065C000, "Control Center collection view inconsistency", OS_ACTIVITY_FLAG_DEFAULT, v19);
    }
  }
}

- (NSString)description
{
  BOOL v3 = objc_msgSend_builderWithObject_(MEMORY[0x263F58188], a2, (uint64_t)self);
  if (objc_msgSend_itemType(self, v4, v5) == 1) {
    objc_msgSend_appendString_withName_(v3, v6, @"Scenes", @"itemType");
  }
  else {
    objc_msgSend_appendString_withName_(v3, v6, @"Services", @"itemType");
  }
  uint64_t isViewVisible = objc_msgSend_isViewVisible(self, v7, v8);
  id v11 = (id)objc_msgSend_appendBool_withName_(v3, v10, isViewVisible, @"viewVisible");
  uint64_t v14 = objc_msgSend_build(v3, v12, v13);

  return (NSString *)v14;
}

- (unint64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (HUCCSmartGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCSmartGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUOpenURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (void)setURLHandler:(id)a3
{
}

- (void)setHomeCell:(id)a3
{
}

- (HUMosaicLayout)mosaicLayout
{
  return self->_mosaicLayout;
}

- (void)setMosaicLayout:(id)a3
{
}

- (void)setMosaicLayoutGeometry:(id)a3
{
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)needsLayoutOptionsUpdate
{
  return self->_needsLayoutOptionsUpdate;
}

- (void)setNeedsLayoutOptionsUpdate:(BOOL)a3
{
  self->_needsLayoutOptionsUpdate = a3;
}

- (HUGridLayoutOptions)singleCellLayoutOptions
{
  return self->_singleCellLayoutOptions;
}

- (void)setSingleCellLayoutOptions:(id)a3
{
}

- (HUGridLayoutOptions)expandedCellLayoutOptions
{
  return self->_expandedCellLayoutOptions;
}

- (void)setExpandedCellLayoutOptions:(id)a3
{
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (UICollectionViewCell)pressedTile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pressedTile);

  return (UICollectionViewCell *)WeakRetained;
}

- (void)setPressedTile:(id)a3
{
}

- (BOOL)isBoundsChangeUpdate
{
  return self->_isBoundsChangeUpdate;
}

- (void)setIsBoundsChangeUpdate:(BOOL)a3
{
  self->_isBoundsChangeUpdate = a3;
}

- (BOOL)shouldBlockCurrentUserFromHome
{
  return self->_shouldBlockCurrentUserFromHome;
}

- (void)setShouldBlockCurrentUserFromHome:(BOOL)a3
{
  self->_uint64_t shouldBlockCurrentUserFromHome = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pressedTile);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_expandedCellLayoutOptions, 0);
  objc_storeStrong((id *)&self->_singleCellLayoutOptions, 0);
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, 0);
  objc_storeStrong((id *)&self->_mosaicLayout, 0);
  objc_destroyWeak((id *)&self->_homeCell);
  objc_storeStrong((id *)&self->_URLHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = HUCCSmartGridViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a5);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_240676568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268C8D4D8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268C8D4E0;
  v15[5] = v14;
  id v16 = a3;
  int v17 = a4;
  char v18 = self;
  sub_240674908((uint64_t)v10, (uint64_t)&unk_268C8D4E8, (uint64_t)v15);
  swift_release();
}

- (void)willDismissWithViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  uint64_t v5 = self;
  HUCCSmartGridViewController.willDismiss(viewController:)(v4);
}

@end