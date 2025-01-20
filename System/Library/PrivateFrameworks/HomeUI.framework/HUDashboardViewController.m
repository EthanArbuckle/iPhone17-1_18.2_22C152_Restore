@interface HUDashboardViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_canSkipStatusDetailsForItem:(id)a3;
- (BOOL)_hasDetailViewControllerForItem:(id)a3;
- (BOOL)_hasTapActionForItem:(id)a3;
- (BOOL)_isShowingRestrictedGuestBlockedBackdropView;
- (BOOL)_isShowingRoarUpgradeView;
- (BOOL)_shouldHideTabBar;
- (BOOL)_shouldShowAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4;
- (BOOL)_shouldShowRoarUpgradeView;
- (BOOL)_statusItemRepresentsOnlyResidentIPads:(id)a3;
- (BOOL)allowsCondensedAccessoryTiles;
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)hasCustomControlPresentationAnimations;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)isOverlay;
- (BOOL)matterItemSupportsAccessoryDetails:(id)a3;
- (BOOL)presentationCoordinator:(id)a3 shouldAllowTapticFeedbackForItem:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (BOOL)shouldHideNavigationBarButton:(id)a3;
- (BOOL)shouldIncludeRoomsInHomeMenu;
- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3;
- (BOOL)shouldShowAccessoryControlForHomeKitObject:(id)a3;
- (BOOL)shouldShowAnnounceButton;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (BOOL)supportsEditing;
- (BOOL)viewIsFullyVisible;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFAccessoryRepresentableItem)itemShowingSizeToggleButton;
- (HUAccessoryControlAnimator)accessoryControlAnimator;
- (HUBannerItemModuleController)bannerItemModuleController;
- (HUBlurGroupingEffectView)blurGroupingEffectView;
- (HUCameraController)ppt_cameraController;
- (HUDashboardCameraItemModuleController)cameraItemModuleController;
- (HUDashboardContext)context;
- (HUDashboardLayoutManager)layoutManager;
- (HUDashboardViewController)init;
- (HUDashboardViewController)initWithContext:(id)a3 asOverlay:(BOOL)a4 delegate:(id)a5;
- (HUDashboardViewController)initWithContext:(id)a3 delegate:(id)a4;
- (HUDashboardViewControllerDelegate)delegate;
- (HUNavigationBarButton)navigationAddButton;
- (HUNavigationBarButton)navigationAnnounceButton;
- (HUNavigationBarButton)navigationEditDoneButton;
- (HUNavigationBarButton)navigationHomeButton;
- (HUROARUpgradeView)homeUpgradedToRoarView;
- (HUWallpaperView)wallpaperView;
- (NAFuture)viewFirstTimeFullyVisibleFuture;
- (NAFuture)viewFullyVisibleFuture;
- (NSArray)upgradeViewConstraints;
- (NSDate)energyCategoryViewStartTime;
- (NSString)editActionTitle;
- (NSString)editActionTitleLocalizationKey;
- (UIViewController)energyIndicatorViewController;
- (UIViewController)tipPopoverController;
- (UIVisualEffectView)restrictedGuestBlockedBackdropView;
- (UIVisualEffectView)roarBackdropView;
- (id)_allNavigationBarButtons;
- (id)_dashboardNavigator;
- (id)_dismissPresentedViewControllersAnimated:(BOOL)a3;
- (id)_filterBarController;
- (id)_itemForHomeKitObject:(id)a3;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)_presentAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5;
- (id)_presentAccessorySettingsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5;
- (id)_presentQuickControlsForHomeKitItem:(id)a3 animated:(BOOL)a4;
- (id)_presentRoomEditorForRoom:(id)a3;
- (id)_quickControlDetailViewControllerForItem:(id)a3;
- (id)_titleForSectionIdentifier:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)childViewControllersToPreload;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3;
- (id)contextTypeDescriptionForAnalytics;
- (id)createDashboardTipModuleControllerWithModule:(id)a3;
- (id)createEnergyDashboardModuleControllerWith:(id)a3;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)editActionDelegate;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)homeForNavigationBarButton:(id)a3;
- (id)homeKitObjectWithID:(id)a3;
- (id)hu_performanceTestReadyFuture;
- (id)hu_preloadContent;
- (id)interactionControllerForPresentation:(id)a3;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)matchingItemForHomeKitObject:(id)a3;
- (id)navigationBarButtonIdentifierOrderForEdge:(unint64_t)a3;
- (id)presentCameraProfile:(id)a3 forCameraClip:(id)a4 animated:(BOOL)a5;
- (id)presentCameraProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6;
- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4;
- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4 secondaryDestination:(unint64_t)a5;
- (id)presentFeedbackFlowForCameraClip:(id)a3 fromProfile:(id)a4;
- (id)presentHomeKitObject:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5;
- (id)presentItem:(id)a3 animated:(BOOL)a4;
- (id)presentItemWithUUID:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 animated:(BOOL)a6;
- (id)presentRoomSettingsForRoom:(id)a3;
- (id)presentStatusDetailsForStatusItemClass:(Class)a3 animated:(BOOL)a4;
- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5;
- (id)reorderableItemListForSection:(int64_t)a3;
- (id)roomForNavigationBarButton:(id)a3;
- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4;
- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5;
- (id)tipsObserver;
- (id)traitCollectionForPresentationCoordinator:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)navigationBarEdgeForButton:(id)a3;
- (void)_clipToNavigationBar;
- (void)_handleBackgroundTap:(id)a3;
- (void)_presentDetailsViewControllerForSectionWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)_registerObservers;
- (void)_registerSectionDecorationViews;
- (void)_requestLocationAuth;
- (void)_sendContextMenuMetricsWithContext:(id)a3 title:(id)a4;
- (void)_setNavigationButtons:(id)a3 forEdge:(unint64_t)a4;
- (void)_setUpFilterBar;
- (void)_setUpNavigationBar;
- (void)_setUpTabBar;
- (void)_setupBackgroundView;
- (void)_showNoHomeAccessViewsIfNeeded;
- (void)_showRoarUpgradeViewIfNeeded;
- (void)_toggleSizeForCell:(id)a3 withItem:(id)a4;
- (void)_updateAllHeaderViews;
- (void)_updateAnnounceNotificationSettingsIfNeeded;
- (void)_updateBadgeCountForHomeButton;
- (void)_updateBarButtons;
- (void)_updateFilterBarVisibility;
- (void)_updateHeaderView:(id)a3 atIndexPath:(id)a4;
- (void)_updateHomeEnergyIndicatorVisibility;
- (void)_updateHomeEnergyTipVisibility;
- (void)_updatePaletteHeight;
- (void)_updateTabBarVisibility;
- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)accessoryDidUpdateApplicationData:(id)a3;
- (void)accessoryTileSizeButtonTappedFor:(id)a3 withItem:(id)a4;
- (void)applicationWentIntoBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)bannerSizeUpdated:(id)a3;
- (void)changeHomeEnergyTipShouldDisplayTo:(BOOL)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)configureWithAccessoryControlViewController:(id)a3;
- (void)createRestrictedGuestBlockedBackdropViewIfNeeded;
- (void)dashboardItemManager:(id)a3 didUpdateContext:(id)a4;
- (void)dashboardItemManager:(id)a3 didUpdateHomeMenuStatusItems:(id)a4;
- (void)didReorderItemWithSortedItemsBySectionID:(id)a3;
- (void)didSelectHomeHubMigrationBanner:(id)a3;
- (void)didSelectUnreachableResidentsBanner:(id)a3;
- (void)didSelectWelcomeBanner:(id)a3;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)disableRefresh;
- (void)dismissTip;
- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4;
- (void)enableRefresh;
- (void)endEditing;
- (void)energyFeatureDidHide;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4;
- (void)home:(id)a3 didUpdateLocation:(id)a4;
- (void)home:(id)a3 didUpdateNameForRoom:(id)a4;
- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4;
- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3;
- (void)homeDidUpdateWallpaper:(id)a3;
- (void)homeEnergyNavigationBarIndicatorTapped:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)migrationUpdatedTileSize:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)presentTip;
- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5;
- (void)presentationCoordinator:(id)a3 touchDidBeginForItem:(id)a4 tappedArea:(id)a5;
- (void)presentationCoordinator:(id)a3 touchDidEndForItem:(id)a4 tappedArea:(id)a5;
- (void)refreshTileHelper;
- (void)reloadLayoutAnimated:(BOOL)a3 fastUpdate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3;
- (void)setAccessoryControlAnimator:(id)a3;
- (void)setBannerItemModuleController:(id)a3;
- (void)setBlurGroupingEffectView:(id)a3;
- (void)setCameraItemModuleController:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnergyCategoryViewStartTime:(id)a3;
- (void)setEnergyIndicatorViewController:(id)a3;
- (void)setHomeUpgradedToRoarView:(id)a3;
- (void)setItemShowingSizeToggleButton:(id)a3;
- (void)setItemShowingSizeToggleButton:(id)a3 animated:(BOOL)a4;
- (void)setNavigationAddButton:(id)a3;
- (void)setNavigationAnnounceButton:(id)a3;
- (void)setNavigationEditDoneButton:(id)a3;
- (void)setNavigationHomeButton:(id)a3;
- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4;
- (void)setRestrictedGuestBlockedBackdropView:(id)a3;
- (void)setRoarBackdropView:(id)a3;
- (void)setTipPopoverController:(id)a3;
- (void)setTipsObserver:(id)a3;
- (void)setUpgradeViewConstraints:(id)a3;
- (void)setViewFullyVisibleFuture:(id)a3;
- (void)setViewIsFullyVisible:(BOOL)a3;
- (void)setWallpaperView:(id)a3;
- (void)setupTipsObserver;
- (void)startEditing;
- (void)tearDownTipsObserver;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUDashboardViewController

- (BOOL)shouldHideNavigationBarButton:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || ([(HUDashboardViewController *)self isEditing] & 1) != 0
    && ([v4 identifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"Done"],
        v7,
        !v8))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v9 = [v4 identifier];
    int v10 = [v9 isEqualToString:@"Done"];

    if (v10)
    {
      char v11 = [(HUDashboardViewController *)self isEditing];
LABEL_11:
      LOBYTE(v5) = v11 ^ 1;
      goto LABEL_4;
    }
    v12 = [v4 identifier];
    int v13 = [v12 isEqualToString:@"Announce"];

    if (v13)
    {
      char v11 = [(HUDashboardViewController *)self shouldShowAnnounceButton];
      goto LABEL_11;
    }
    v14 = [v4 identifier];
    int v15 = [v14 isEqualToString:@"Add"];

    if (v15)
    {
      v16 = [(HUDashboardViewController *)self context];
      int v5 = [v16 allowsAdding] ^ 1;
    }
    else
    {
      v17 = [v4 identifier];
      int v18 = [v17 isEqualToString:@"HomesAndRooms"];

      if (!v18)
      {
        LOBYTE(v5) = 0;
        goto LABEL_4;
      }
      v16 = [(HUDashboardViewController *)self context];
      if ([v16 allowsHomeNavigation])
      {
        v19 = [(HUDashboardViewController *)self context];
        v20 = [v19 home];
        if (objc_msgSend(v20, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade"))
        {
          v21 = [MEMORY[0x1E4F691A0] sharedDispatcher];
          v22 = [v21 homeManager];
          v23 = [v22 homes];
          LOBYTE(v5) = [v23 count] == 1;
        }
        else
        {
          LOBYTE(v5) = 0;
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
LABEL_4:

  return v5;
}

- (HUDashboardContext)context
{
  v2 = [(HUItemCollectionViewController *)self itemManager];
  v3 = [v2 context];

  return (HUDashboardContext *)v3;
}

- (UIViewController)tipPopoverController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tipPopoverController);

  return (UIViewController *)WeakRetained;
}

- (id)roomForNavigationBarButton:(id)a3
{
  v3 = [(HUDashboardViewController *)self context];
  id v4 = [v3 room];

  return v4;
}

- (id)tipsObserver
{
  return self->_tipsObserver;
}

- (void)setTipsObserver:(id)a3
{
}

- (BOOL)shouldShowAnnounceButton
{
  v3 = [(HUDashboardViewController *)self context];
  if (![v3 allowsAnnounce])
  {
    BOOL v5 = 0;
LABEL_12:

    return v5;
  }
  id v4 = [(HUItemCollectionViewController *)self itemManager];
  if ([v4 isEmptyDashboard])
  {
    BOOL v5 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = [(HUDashboardViewController *)self context];
  v7 = [v6 home];
  char v8 = objc_msgSend(v7, "hf_shouldBlockCurrentUserFromHome");

  if ((v8 & 1) == 0)
  {
    v9 = [(HUDashboardViewController *)self context];
    int v10 = [v9 room];

    char v11 = [(HUDashboardViewController *)self context];
    v3 = v11;
    if (v10)
    {
      id v4 = [v11 room];
      char v12 = objc_msgSend(v4, "hf_shouldShowAnnounceButtonForThisRoom");
    }
    else
    {
      id v4 = [v11 home];
      char v12 = objc_msgSend(v4, "hf_shouldShowAnnounceButtonForThisHome");
    }
    BOOL v5 = v12;
    goto LABEL_11;
  }
  return 0;
}

- (void)_updateHomeEnergyIndicatorVisibility
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(HUDashboardViewController *)self context];
  id v4 = [v3 home];
  int v5 = objc_msgSend(v4, "hf_isGridForecastVisible");

  v6 = [(HUDashboardViewController *)self context];
  v7 = [v6 home];
  int v8 = objc_msgSend(v7, "hf_isHomeEnergyHomeEmpty");

  v9 = [(HUDashboardViewController *)self context];
  if ([v9 allowsEnergyIndicator]) {
    int v10 = v5 & (v8 ^ 1);
  }
  else {
    int v10 = 0;
  }

  char v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [(HUDashboardViewController *)self context];
    int v28 = 138413570;
    v29 = self;
    __int16 v30 = 2080;
    v31 = "-[HUDashboardViewController(NavigationBar) _updateHomeEnergyIndicatorVisibility]";
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 1024;
    int v35 = [v12 allowsEnergyIndicator];
    __int16 v36 = 1024;
    int v37 = v5;
    __int16 v38 = 1024;
    int v39 = v8 ^ 1;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%s setting Indicator visibility to %{BOOL}d (contextAllows = %{BOOL}d, isGridForecastVisible = %{BOOL}d, NOT isHomeEnergyHomeEmpty = %{BOOL}d", (uint8_t *)&v28, 0x2Eu);
  }
  if (v10)
  {
    int v13 = [(HUDashboardViewController *)self energyIndicatorViewController];

    if (v13)
    {
      v14 = [(HUDashboardViewController *)self energyIndicatorViewController];
      int v15 = [(HUDashboardViewController *)self context];
      v16 = [v15 home];
      +[HUEnergyIndicatorAccessoryViewWrapper updateWithEnergyIndicatorView:v14 with:v16];
    }
    else
    {
      v19 = [(HUDashboardViewController *)self context];
      v20 = [v19 home];
      v21 = +[HUEnergyIndicatorAccessoryViewWrapper createEnergyIndicatorViewWithHome:v20];
      [(HUDashboardViewController *)self setEnergyIndicatorViewController:v21];

      v22 = [(HUDashboardViewController *)self energyIndicatorViewController];
      v23 = [v22 view];
      [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

      v24 = [HUEnergyIndicatorAccessoryView alloc];
      v25 = [(HUDashboardViewController *)self energyIndicatorViewController];
      v26 = [v25 view];
      v14 = [(HUEnergyIndicatorAccessoryView *)v24 initWithEnergyIndicator:v26];

      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_homeEnergyNavigationBarIndicatorTapped_];
      [(HUEnergyIndicatorAccessoryView *)v14 addGestureRecognizer:v15];
      [(HUEnergyIndicatorAccessoryView *)v14 setUserInteractionEnabled:1];
      v27 = [(HUDashboardViewController *)self navigationItem];
      [v27 _setLargeTitleAccessoryView:v14 alignToBaseline:0];

      v16 = [(HUDashboardViewController *)self navigationItem];
      [v16 _setSupportsTwoLineLargeTitles:1];
    }

    [(HUDashboardViewController *)self _updateHomeEnergyTipVisibility];
  }
  else
  {
    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      v29 = self;
      __int16 v30 = 2080;
      v31 = "-[HUDashboardViewController(NavigationBar) _updateHomeEnergyIndicatorVisibility]";
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%s Not creating Indicator", (uint8_t *)&v28, 0x16u);
    }

    [(HUDashboardViewController *)self _updateHomeEnergyTipVisibility];
    [(HUDashboardViewController *)self setEnergyIndicatorViewController:0];
    int v18 = [(HUDashboardViewController *)self navigationItem];
    [v18 _setLargeTitleAccessoryView:0 alignToBaseline:0];
  }
}

- (UIViewController)energyIndicatorViewController
{
  return self->_energyIndicatorViewController;
}

- (void)_updateHomeEnergyTipVisibility
{
  v3 = [(HUDashboardViewController *)self context];
  id v4 = [v3 home];
  if (objc_msgSend(v4, "hf_isGridForecastEnabled"))
  {
    int v5 = [(HUDashboardViewController *)self context];
    uint64_t v6 = [v5 allowsEnergyIndicator];
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(HUDashboardViewController *)self changeHomeEnergyTipShouldDisplayTo:v6];
}

void __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = (void *)MEMORY[0x1E4F69758];
    v9 = [*(id *)(a1 + 32) navigationBarButtonIdentifierOrderForEdge:v6];
    int v10 = [v8 comparatorWithSortedObjects:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_4;
    v13[3] = &unk_1E6390558;
    id v14 = v10;
    id v11 = v10;
    char v12 = [v5 sortedArrayUsingComparator:v13];
    [*(id *)(a1 + 32) _setNavigationButtons:v12 forEdge:v7];
  }
}

- (id)navigationBarButtonIdentifierOrderForEdge:(unint64_t)a3
{
  if (a3 == 8)
  {
    if (_MergedGlobals_7 == -1)
    {
      v3 = &qword_1EA121538;
      goto LABEL_6;
    }
    uint64_t v6 = &_MergedGlobals_7;
    uint64_t v7 = &__block_literal_global_1100;
  }
  else
  {
    if (qword_1EA121540 == -1)
    {
      v3 = &qword_1EA121548;
      goto LABEL_6;
    }
    uint64_t v6 = &qword_1EA121540;
    uint64_t v7 = &__block_literal_global_1104;
  }
  dispatch_once(v6, v7);
  v3 = v6 + 1;
LABEL_6:
  id v4 = (void *)*v3;

  return v4;
}

- (void)_setNavigationButtons:(id)a3 forEdge:(unint64_t)a4
{
  id v8 = a3;
  if (a4 == 8)
  {
    uint64_t v7 = [(HUDashboardViewController *)self navigationItem];
    [v7 setRightBarButtonItems:v8];
  }
  else if (a4 == 2)
  {
    uint64_t v7 = [(HUDashboardViewController *)self navigationItem];
    [v7 setLeftBarButtonItems:v8];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HUDashboardViewController.m" lineNumber:2861 description:@"-setNavigationButtons only supports UIRectEdgeLeft or UIRectEdgeRight"];
  }
}

- (void)setEnergyIndicatorViewController:(id)a3
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  id v8 = a4;
  [(HUControllableItemCollectionViewController *)&v11 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:a5];
  v9 = [(HUDashboardViewController *)self cameraItemModuleController];
  v12[0] = v8;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  [v9 enableCameraSnapshotsForCells:v10];
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v104.receiver = self;
  v104.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v104 configureCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  id v11 = v6;
  if (objc_opt_isKindOfClass()) {
    char v12 = v11;
  }
  else {
    char v12 = 0;
  }
  id v13 = v12;

  id v14 = [v7 latestResults];
  uint64_t v15 = *MEMORY[0x1E4F68B58];
  v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68B58]];

  if (!v16 || !v13) {
    goto LABEL_22;
  }
  uint64_t v17 = objc_opt_class();
  id v18 = v11;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    v20 = v18;
    if (v19) {
      goto LABEL_16;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v23 = id v22 = v10;
    [v21 handleFailureInFunction:v23, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];

    id v10 = v22;
  }
  v20 = 0;
LABEL_16:

  v24 = [v20 viewController];

  if (!v24)
  {
    objc_opt_class();
    v25 = [v7 latestResults];
    v26 = [v25 objectForKeyedSubscript:v15];
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    v29 = (void *)[objc_alloc(MEMORY[0x1E4F74880]) initWithRouteUID:v28];
    __int16 v30 = [v29 view];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    [v29 setLayout:3];
    [v29 setSupportsHorizontalLayout:1];
    [v29 setContext:3];
    v31 = objc_opt_new();
    [v29 setStylingProvider:v31];

    [v20 setAllowSelfSizing:1];
    [v20 setUseDefaultCellBackgroundColor:1];
    [v20 setViewController:v29];
  }
LABEL_22:
  id v32 = v11;
  if ([v32 conformsToProtocol:&unk_1F19D28B0]) {
    int v33 = v32;
  }
  else {
    int v33 = 0;
  }
  id v34 = v33;

  if (v34)
  {
    int v35 = [(HUDashboardViewController *)self blurGroupingEffectView];

    if (!v35) {
      NSLog(&cfstr_BlurGroupingSh.isa);
    }
    __int16 v36 = [(HUDashboardViewController *)self blurGroupingEffectView];
    [v34 setBackgroundEffectGrouper:v36];
  }
  if ([v7 conformsToProtocol:&unk_1F1A3D190])
  {
    id v101 = v10;
    id v102 = v34;
    objc_opt_class();
    id v37 = v32;
    if (objc_opt_isKindOfClass()) {
      __int16 v38 = v37;
    }
    else {
      __int16 v38 = 0;
    }
    id v39 = v38;

    [v39 setDelegate:self];
    objc_msgSend(v39, "setToggleable:", -[HUControllableItemCollectionViewController itemSupportsToggleInteraction:](self, "itemSupportsToggleInteraction:", v7));
    uint64_t v40 = [(HUDashboardViewController *)self layoutManager];
    uint64_t v41 = [v40 gridSizeForItem:v7];
    objc_msgSend(v39, "setGridSize:", v41, v42);

    v43 = [(HUItemCollectionViewController *)self itemManager];
    v44 = [(HUItemCollectionViewController *)self itemManager];
    v45 = [v44 indexPathForItem:v7];
    v46 = objc_msgSend(v43, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v45, "section"));

    if ([v46 isEqualToString:@"favoritesSection"])
    {
      [v39 setShowPrefixLabel:1];
      v47 = [(HUDashboardViewController *)self layoutManager];
      uint64_t v48 = [v47 favoritesSectionGridSize];
      objc_msgSend(v39, "setGridSize:", v48, v49);
    }
    v103 = v39;
    v50 = [(HUDashboardViewController *)self layoutManager];
    uint64_t v51 = [v50 gridSizeForItem:v7];
    uint64_t v53 = v52;

    if ([v46 isEqualToString:@"AllAccessoriesSection"])
    {
      v54 = [(HUDashboardViewController *)self context];
      [v54 home];
      id v55 = v7;
      id v56 = v32;
      v57 = v46;
      v59 = id v58 = v13;
      int v60 = objc_msgSend(v59, "hf_currentUserIsRestrictedGuest");

      id v13 = v58;
      v46 = v57;
      id v32 = v56;
      id v7 = v55;

      if (v60)
      {
        if (v51 >= 2 && v53 >= 2) {
          [v103 setShowPrefixLabel:1];
        }
      }
    }
    if (![(HUDashboardViewController *)self isEditing])
    {
      id v10 = v101;
      id v34 = v102;
      id v63 = v103;
      goto LABEL_54;
    }
    id v61 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];

    if (v61 == v7) {
      double v62 = 1.0;
    }
    else {
      double v62 = 0.0;
    }
    id v63 = v103;
    [v103 setShowsSizeChangeButton:v61 == v7 animated:0];
    v64 = [v103 layer];
    [v64 setZPosition:v62];
    id v10 = v101;
    goto LABEL_45;
  }
  objc_opt_class();
  id v63 = v7;
  if (objc_opt_isKindOfClass()) {
    v65 = v63;
  }
  else {
    v65 = 0;
  }
  id v66 = v65;

  if (!v66)
  {
    v46 = [v10 alwaysAllowedScheduleItem];
    if ([v63 isEqual:v46])
    {
      id v63 = 0;
      goto LABEL_54;
    }
    v64 = [v10 pinCodeAccessItem];
    if ([v63 isEqual:v64])
    {
      id v63 = 0;
      goto LABEL_46;
    }
    id v67 = v13;
    v68 = [v10 homeKeyItem];
    char v69 = [v63 isEqual:v68];

    if (v69)
    {
      id v63 = 0;
      id v13 = v67;
      goto LABEL_55;
    }
    id v102 = v34;
    v70 = [v10 contactOwnerItem];
    int v71 = [v63 isEqual:v70];

    if (v71)
    {
      v46 = [MEMORY[0x1E4F42B58] cellConfiguration];
      v72 = [v63 latestResults];
      v73 = [v72 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v46 setText:v73];

      v74 = [MEMORY[0x1E4F428B8] systemBlackColor];
      v75 = [v46 textProperties];
      [v75 setColor:v74];

      v76 = [v46 textProperties];
      [v76 setAlignment:1];

      v64 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C0] addingSymbolicTraits:2 options:0];
      v77 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v64 size:0.0];
      v78 = [v46 textProperties];
      [v78 setFont:v77];

      [v32 setContentConfiguration:v46];
      v79 = [MEMORY[0x1E4F427B0] listGroupedCellConfiguration];
      [v79 setCornerRadius:16.0];
      v80 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v79 setBackgroundColor:v80];

      [v32 setBackgroundConfiguration:v79];
    }
    else
    {
      v81 = [v10 accessoryNoAccessItem];
      int v82 = [v63 isEqual:v81];

      v46 = [MEMORY[0x1E4F42B58] cellConfiguration];
      v83 = [v63 latestResults];
      v84 = [v83 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v46 setText:v84];

      if (v82)
      {
        v85 = [MEMORY[0x1E4F428B8] systemWhiteColor];
        v86 = [v46 textProperties];
        [v86 setColor:v85];

        v87 = [v46 textProperties];
        [v87 setAlignment:1];

        uint64_t v88 = *MEMORY[0x1E4F438C0];
        v64 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C0] addingSymbolicTraits:2 options:0];
        v89 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v64 size:0.0];
        v90 = [v46 textProperties];
        [v90 setFont:v89];

        v91 = [v63 latestResults];
        v92 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
        [v46 setSecondaryText:v92];

        v93 = [MEMORY[0x1E4F428B8] systemWhiteColor];
        v94 = [v46 secondaryTextProperties];
        [v94 setColor:v93];

        v95 = [v46 secondaryTextProperties];
        [v95 setAlignment:1];

        v96 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v88];
        v97 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v96 size:0.0];
        v98 = [v46 secondaryTextProperties];
        [v98 setFont:v97];

        [v32 setContentConfiguration:v46];
        v99 = [MEMORY[0x1E4F427B0] listGroupedCellConfiguration];
        [v99 setCornerRadius:16.0];
        v100 = [MEMORY[0x1E4F428B8] colorWithWhite:0.8 alpha:0.3];
        [v99 setBackgroundColor:v100];

        [v32 setBackgroundConfiguration:v99];
      }
      else
      {
        [v32 setContentConfiguration:v46];
        v64 = [MEMORY[0x1E4F427B0] listGroupedCellConfiguration];
        [v32 setBackgroundConfiguration:v64];
      }
    }
    id v63 = 0;
    id v13 = v67;
LABEL_45:
    id v34 = v102;
LABEL_46:

LABEL_54:
  }
LABEL_55:
}

- (HUDashboardLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (HUBlurGroupingEffectView)blurGroupingEffectView
{
  return self->_blurGroupingEffectView;
}

- (HUDashboardCameraItemModuleController)cameraItemModuleController
{
  return self->_cameraItemModuleController;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  v9 = objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v7, "section"));

  id v10 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v11 = [v7 section];

  char v12 = [v10 displayedSectionIdentifierForSectionIndex:v11];

  if ([v12 isEqualToString:@"NowPlayingSection"]
    && ([MEMORY[0x1E4F69758] isAMac] & 1) == 0
    && _os_feature_enabled_impl()
    || [v12 isEqualToString:@"favoritesSection"]
    || [v6 conformsToProtocol:&unk_1F1A3D190])
  {
    id v13 = objc_opt_class();
    goto LABEL_7;
  }
  uint64_t v15 = [v6 latestResults];
  uint64_t v16 = *MEMORY[0x1E4F688B0];
  uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F688B0]];

  if (!v17)
  {
LABEL_15:
    objc_opt_class();
    v19 = [(HUItemCollectionViewController *)self itemManager];
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    objc_opt_class();
    id v22 = v6;
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    if (v24) {
      goto LABEL_27;
    }
    v25 = [v21 alwaysAllowedScheduleItem];
    if (([v22 isEqual:v25] & 1) == 0)
    {
      v26 = [v21 pinCodeAccessItem];
      if (![v22 isEqual:v26])
      {
        v27 = [v21 homeKeyItem];
        [v22 isEqual:v27];

        goto LABEL_27;
      }
    }
LABEL_27:
    id v13 = objc_opt_class();

    goto LABEL_7;
  }
  id v18 = [v6 latestResults];
  id v13 = [v18 objectForKeyedSubscript:v16];

  if (!object_isClass(v13) || !v13 || ([v13 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {

    goto LABEL_15;
  }
LABEL_7:

  return (Class)v13;
}

- (void)dashboardItemManager:(id)a3 didUpdateHomeMenuStatusItems:(id)a4
{
  [(HUDashboardViewController *)self _updateBadgeCountForHomeButton];

  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
}

- (void)_updateBadgeCountForHomeButton
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = [(HUDashboardViewController *)self context];
  if ([v16 allowsHomeNavigation])
  {
    v3 = [(HUDashboardViewController *)self context];
    id v4 = [v3 home];
    char v5 = objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");

    if ((v5 & 1) == 0)
    {
      id v6 = [(HUItemCollectionViewController *)self itemManager];
      uint64_t v7 = [v6 getHomeButtonBadgeCount];

      id v8 = [(HUDashboardViewController *)self navigationHomeButton];
      v9 = [v8 badgeValue];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if (v10 != v7)
      {
        uint64_t v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          char v12 = [(HUDashboardViewController *)self navigationHomeButton];
          id v13 = [v12 badgeValue];
          *(_DWORD *)buf = 136315650;
          id v18 = "-[HUDashboardViewController(NavigationBar) _updateBadgeCountForHomeButton]";
          __int16 v19 = 2048;
          uint64_t v20 = [v13 unsignedIntegerValue];
          __int16 v21 = 2048;
          uint64_t v22 = v7;
          _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%s Updating home button badge count from %lu to: %lu", buf, 0x20u);
        }
        id v14 = [NSNumber numberWithUnsignedInteger:v7];
        uint64_t v15 = [(HUDashboardViewController *)self navigationHomeButton];
        [v15 setBadgeValue:v14];
      }
    }
  }
  else
  {
  }
}

- (void)_updateBarButtons
{
  v3 = [(HUDashboardViewController *)self _allNavigationBarButtons];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke;
  v8[3] = &unk_1E6390508;
  v8[4] = self;
  id v4 = objc_msgSend(v3, "na_filter:", v8);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_2;
  v7[3] = &unk_1E6390530;
  v7[4] = self;
  char v5 = objc_msgSend(v4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_3;
  v6[3] = &unk_1E6390580;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);
}

- (id)_allNavigationBarButtons
{
  v3 = objc_opt_new();
  id v4 = [(HUDashboardViewController *)self navigationAddButton];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  char v5 = [(HUDashboardViewController *)self navigationHomeButton];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  id v6 = [(HUDashboardViewController *)self navigationEditDoneButton];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  uint64_t v7 = [(HUDashboardViewController *)self navigationAnnounceButton];
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return v3;
}

- (HUNavigationBarButton)navigationHomeButton
{
  return self->_navigationHomeButton;
}

- (HUNavigationBarButton)navigationEditDoneButton
{
  return self->_navigationEditDoneButton;
}

- (HUNavigationBarButton)navigationAnnounceButton
{
  return self->_navigationAnnounceButton;
}

- (HUNavigationBarButton)navigationAddButton
{
  return self->_navigationAddButton;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewController;
  [(HUItemCollectionViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUDashboardViewController *)self _updateBarButtons];
  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [(HUDashboardViewController *)self context];
  if (![v12 shouldDelayItemUpdatesForViewVisibility]
    || [(HUDashboardViewController *)self viewIsFullyVisible])
  {

LABEL_4:
    if (objc_msgSend((id)-[HUDashboardViewController superclass](self, "superclass"), "instancesRespondToSelector:", a2))
    {
      v21.receiver = self;
      v21.super_class = (Class)HUDashboardViewController;
      uint64_t v13 = [(HUItemCollectionViewController *)&v21 itemManager:v9 futureToUpdateItems:v10 itemUpdateOptions:v11];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    }
    id v14 = (void *)v13;
    goto LABEL_8;
  }
  id v16 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  char v17 = [v16 BOOLValue];

  if (v17) {
    goto LABEL_4;
  }
  id v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the view is fully visible", buf, 2u);
  }

  if ([MEMORY[0x1E4F69758] hasInternalDiagnostics])
  {
    __int16 v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Not visible - delayed items: %@", buf, 0xCu);
    }
  }
  id v14 = [(HUDashboardViewController *)self viewFullyVisibleFuture];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__HUDashboardViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke;
  v22[3] = &unk_1E63850B8;
  id v23 = v10;
  id v20 = (id)[v14 addCompletionBlock:v22];

LABEL_8:

  return v14;
}

- (BOOL)viewIsFullyVisible
{
  return self->_viewIsFullyVisible;
}

- (NAFuture)viewFullyVisibleFuture
{
  return self->_viewFullyVisibleFuture;
}

void __79__HUDashboardViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the view is fully visible", (uint8_t *)&v5, 2u);
  }

  if ([MEMORY[0x1E4F69758] hasInternalDiagnostics])
  {
    v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Visible - continuing item updates: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  v3 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v4 = [v3 context];
  int v5 = [v4 overrideDashboardTitle];

  if (v5) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)HUDashboardViewController;
  return [(HUItemCollectionViewController *)&v7 automaticallyUpdatesViewControllerTitle];
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v11 diffableDataItemManager:a3 didUpdateItems:a4 addItems:a5 removeItems:a6];
  objc_super v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 context];
  id v9 = [v8 overrideDashboardTitle];

  if (v9)
  {
    id v10 = [(HUDashboardViewController *)self navigationItem];
    [v10 setTitle:v9];
  }
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

void __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 intValue];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = [*(id *)(a1 + 32) itemManager];
    uint64_t v6 = [v5 home];

    objc_super v7 = [v6 currentUser];
    id v8 = [v7 announceUserSettings];
    uint64_t v9 = [v8 deviceNotificationMode];
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [NSNumber numberWithUnsignedInteger:v9];
      char v12 = [NSNumber numberWithInt:v4];
      int v13 = HFLocationServicesAvailableForAuthorizationStatus();
      id v14 = @"NO";
      int v17 = 138412802;
      id v18 = v11;
      __int16 v19 = 2112;
      if (v13) {
        id v14 = @"YES";
      }
      id v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "currentNotificationMode = [%@] - CLAuthorizationStatus = [%@] - HFLocationServicesAvailableForAuthorizationStatus = [%@]", (uint8_t *)&v17, 0x20u);
    }
    if (v9 != 1 && (HFLocationServicesAvailableForAuthorizationStatus() & 1) == 0)
    {
      uint64_t v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Setting Announce Notification mode to HMAnnounceDeviceNotificationModeNever", (uint8_t *)&v17, 2u);
      }

      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F2E668]) initWithDeviceNotificationMode:1];
      [v7 updateAnnounceUserSettings:v16 forHome:v6 completionHandler:&__block_literal_global_1179];
    }
  }
}

id __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) navigationBarEdgeForButton:a2];
  if (v2)
  {
    v2 = [NSNumber numberWithUnsignedInteger:v2];
  }

  return v2;
}

- (unint64_t)navigationBarEdgeForButton:(id)a3
{
  id v4 = a3;
  if ([(HUDashboardViewController *)self shouldHideNavigationBarButton:v4])
  {
    unint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [v4 identifier];
    char v7 = [v6 isEqualToString:@"Add"];

    if (v7) {
      goto LABEL_6;
    }
    id v8 = [v4 identifier];
    char v9 = [v8 isEqualToString:@"HomesAndRooms"];

    if ((v9 & 1) != 0
      || ([v4 identifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:@"Announce"],
          v10,
          (v11 & 1) != 0))
    {
LABEL_6:
      unint64_t v5 = 8;
    }
    else
    {
      int v13 = [v4 identifier];
      int v14 = [v13 isEqualToString:@"Done"];

      if (v14) {
        unint64_t v5 = 8;
      }
      else {
        unint64_t v5 = 0;
      }
    }
  }

  return v5;
}

uint64_t __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldHideNavigationBarButton:a2] ^ 1;
}

- (void)_setupBackgroundView
{
  v73[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F428B8] clearColor];
  id v4 = [(HUDashboardViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  unint64_t v5 = [HUBlurGroupingEffectView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v10 = -[HUBlurGroupingEffectView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  [(HUDashboardViewController *)self setBlurGroupingEffectView:v10];

  char v11 = [(HUDashboardViewController *)self blurGroupingEffectView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v12 = [(HUDashboardViewController *)self view];
  int v13 = [(HUDashboardViewController *)self blurGroupingEffectView];
  int v14 = [(HUDashboardViewController *)self collectionView];
  [v12 insertSubview:v13 below:v14];

  uint64_t v52 = (void *)MEMORY[0x1E4F28DC8];
  v70 = [(HUDashboardViewController *)self blurGroupingEffectView];
  id v66 = [v70 topAnchor];
  v68 = [(HUDashboardViewController *)self view];
  v64 = [v68 topAnchor];
  double v62 = [v66 constraintEqualToAnchor:v64];
  v73[0] = v62;
  int v60 = [(HUDashboardViewController *)self blurGroupingEffectView];
  id v56 = [v60 bottomAnchor];
  id v58 = [(HUDashboardViewController *)self view];
  v54 = [v58 bottomAnchor];
  v50 = [v56 constraintEqualToAnchor:v54];
  v73[1] = v50;
  uint64_t v48 = [(HUDashboardViewController *)self blurGroupingEffectView];
  v47 = [v48 leadingAnchor];
  uint64_t v15 = [(HUDashboardViewController *)self view];
  id v16 = [v15 leadingAnchor];
  int v17 = [v47 constraintEqualToAnchor:v16];
  v73[2] = v17;
  id v18 = [(HUDashboardViewController *)self blurGroupingEffectView];
  __int16 v19 = [v18 trailingAnchor];
  id v20 = [(HUDashboardViewController *)self view];
  __int16 v21 = [v20 trailingAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21];
  v73[3] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  [v52 activateConstraints:v23];

  if ([(HUDashboardViewController *)self isOverlay]
    || ([MEMORY[0x1E4F69138] isHomeControlService] & 1) != 0
    || ([(HUDashboardViewController *)self context],
        id v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [v24 allowsEditing],
        v24,
        v25))
  {
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleBackgroundTap_];
    v27 = objc_opt_new();
    id v28 = [MEMORY[0x1E4F428B8] clearColor];
    [v27 setBackgroundColor:v28];

    [v27 addGestureRecognizer:v26];
    v29 = [(HUDashboardViewController *)self collectionView];
    [v29 setBackgroundView:v27];
  }
  __int16 v30 = [(HUDashboardViewController *)self context];
  uint64_t v31 = [v30 backgroundStyle];

  if (v31 == 1)
  {
    v46 = [MEMORY[0x1E4F428B8] systemBlackColor];
    __int16 v36 = [(HUDashboardViewController *)self view];
    [v36 setBackgroundColor:v46];
  }
  else
  {
    if (v31 != 2) {
      return;
    }
    id v32 = -[HUWallpaperView initWithFrame:]([HUWallpaperView alloc], "initWithFrame:", v6, v7, v8, v9);
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v32;

    [(HUWallpaperView *)self->_wallpaperView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v34 = [(HUDashboardViewController *)self view];
    int v35 = [(HUDashboardViewController *)self wallpaperView];
    [v34 insertSubview:v35 atIndex:0];

    id v55 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(HUDashboardViewController *)self wallpaperView];
    __int16 v36 = [v59 topAnchor];
    int v71 = [(HUDashboardViewController *)self view];
    char v69 = [v71 topAnchor];
    id v67 = [v36 constraintEqualToAnchor:v69];
    v72[0] = v67;
    v65 = [(HUDashboardViewController *)self wallpaperView];
    id v61 = [v65 bottomAnchor];
    id v63 = [(HUDashboardViewController *)self view];
    v57 = [v63 bottomAnchor];
    uint64_t v53 = [v61 constraintEqualToAnchor:v57];
    v72[1] = v53;
    uint64_t v51 = [(HUDashboardViewController *)self wallpaperView];
    uint64_t v49 = [v51 leadingAnchor];
    id v37 = [(HUDashboardViewController *)self view];
    __int16 v38 = [v37 leadingAnchor];
    id v39 = [v49 constraintEqualToAnchor:v38];
    v72[2] = v39;
    uint64_t v40 = [(HUDashboardViewController *)self wallpaperView];
    uint64_t v41 = [v40 trailingAnchor];
    uint64_t v42 = [(HUDashboardViewController *)self view];
    v43 = [v42 trailingAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    v72[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
    [v55 activateConstraints:v45];

    v46 = v59;
  }
}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setBlurGroupingEffectView:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

uint64_t __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  double v6 = [a2 identifier];
  double v7 = [v5 identifier];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  double v6 = [v5 statusItemModule];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = HUStatusItemModuleController;
LABEL_12:
    uint64_t v13 = [[v8 alloc] initWithModule:v4];
    goto LABEL_13;
  }
  double v9 = [(HUItemCollectionViewController *)self itemManager];
  id v10 = [v9 bannerItemModule];
  int v11 = [v4 isEqual:v10];

  if (v11)
  {
    char v12 = [[HUBannerItemModuleController alloc] initWithModule:v4 host:self delegate:self];
    [(HUDashboardViewController *)self setBannerItemModuleController:v12];

    uint64_t v13 = [(HUDashboardViewController *)self bannerItemModuleController];
LABEL_13:
    int v17 = (void *)v13;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = HUDashboardActionSetItemModuleController;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [(HUDashboardViewController *)self context];
    if (v14)
    {
      uint64_t v15 = [(HUDashboardViewController *)self context];
      uint64_t v16 = [v15 cameraPresentationStyle];
    }
    else
    {
      uint64_t v16 = 1;
    }

    __int16 v19 = [[HUDashboardCameraItemModuleController alloc] initWithModule:v4 cameraPresentationStyle:v16];
    [(HUDashboardViewController *)self setCameraItemModuleController:v19];

    uint64_t v13 = [(HUDashboardViewController *)self cameraItemModuleController];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = HUServicePlaceholderItemModuleController;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(HUDashboardViewController *)self createDashboardTipModuleControllerWithModule:v4];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(HUDashboardViewController *)self createEnergyDashboardModuleControllerWith:v4];
    goto LABEL_13;
  }
  int v17 = 0;
LABEL_14:

  return v17;
}

- (void)setCameraItemModuleController:(id)a3
{
}

- (void)setBannerItemModuleController:(id)a3
{
}

- (HUDashboardViewController)initWithContext:(id)a3 asOverlay:(BOOL)a4 delegate:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [[HUDashboardItemManager alloc] initWithContext:v8 delegate:0];
  v27.receiver = self;
  v27.super_class = (Class)HUDashboardViewController;
  int v11 = [(HUControllableItemCollectionViewController *)&v27 initUsingCompositionalLayoutWithItemManager:v10];
  if (v11)
  {
    char v12 = [[HUDashboardLayoutManager alloc] initWithDelegate:v11];
    layoutManager = v11->_layoutManager;
    v11->_layoutManager = v12;

    v11->_isOverlay = a4;
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_viewIsFullyVisible = 0;
    int v14 = HFLogForCategory();
    uint64_t v15 = HFLogForCategory();
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v11);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_signpost_emit_with_name_impl(&dword_1BE345000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "HUViewFirstAppearance", "%@.viewFirstTimeFullyVisibleFuture begins", buf, 0xCu);
    }
    __int16 v19 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    viewFullyVisibleFuture = v11->_viewFullyVisibleFuture;
    v11->_viewFullyVisibleFuture = v19;

    __int16 v21 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    viewFirstTimeFullyVisibleFuture = v11->_viewFirstTimeFullyVisibleFuture;
    v11->_viewFirstTimeFullyVisibleFuture = v21;

    [(HUControllableItemCollectionViewController *)v11 setUseCustomDragAndDrop:1];
    [(HUDashboardItemManager *)v10 setDashboardDelegate:v11];
    if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
    {
      uint64_t v23 = +[HUSideBarSelectionManager sharedManager];
      [v23 setCurrentContext:v8];
    }
    id v24 = objc_alloc_init(HUAccessoryControlAnimator);
    accessoryControlAnimator = v11->_accessoryControlAnimator;
    v11->_accessoryControlAnimator = v24;

    [(HUDashboardViewController *)v11 _registerObservers];
  }

  return v11;
}

- (void)_registerObservers
{
  uint64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 addHomeObserver:self];

  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v4 addHomeManagerObserver:self];

  id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v5 addAccessoryObserver:self];

  id v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v6 addUserObserver:self];
}

- (HUBannerItemModuleController)bannerItemModuleController
{
  return self->_bannerItemModuleController;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v13 viewDidAppear:a3];
  [(HUDashboardViewController *)self setViewIsFullyVisible:1];
  id v4 = [(HUDashboardViewController *)self context];
  id v5 = [v4 accessoryTypeGroup];
  id v6 = [MEMORY[0x1E4F68EA0] energyAccessoryTypeGroup];

  if (v5 == v6)
  {
    int v7 = [(HUDashboardViewController *)self energyCategoryViewStartTime];

    if (v7)
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        char v12 = [(HUDashboardViewController *)self energyCategoryViewStartTime];
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v12;
        _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Expected energyCategoryViewStartTime to be nil when displaying the view but found value: %@", buf, 0xCu);
      }
    }
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [(HUDashboardViewController *)self setEnergyCategoryViewStartTime:v9];
  }
  id v10 = [(HUDashboardViewController *)self context];
  uint64_t v11 = [v10 filterPresentationStyle];

  if (v11 == 2) {
    [(HUDashboardViewController *)self _clipToNavigationBar];
  }
}

- (void)setViewIsFullyVisible:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_viewIsFullyVisible != a3)
  {
    self->_viewIsFullyVisible = a3;
    if (a3)
    {
      id v4 = [(HUDashboardViewController *)self viewFirstTimeFullyVisibleFuture];
      char v5 = [v4 isFinished];

      if ((v5 & 1) == 0)
      {
        id v6 = HFLogForCategory();
        int v7 = HFLogForCategory();
        os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
        {
          id v9 = (objc_class *)objc_opt_class();
          id v10 = NSStringFromClass(v9);
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v10;
          _os_signpost_emit_with_name_impl(&dword_1BE345000, v6, OS_SIGNPOST_INTERVAL_END, v8, "HUViewFirstAppearance", "%@.viewFirstTimeFullyVisibleFuture ends", buf, 0xCu);
        }
      }
      uint64_t v11 = [(HUDashboardViewController *)self viewFirstTimeFullyVisibleFuture];
      [v11 finishWithNoResult];

      char v12 = [(HUDashboardViewController *)self viewFullyVisibleFuture];
      [v12 finishWithNoResult];
    }
    else
    {
      objc_super v13 = [(HUDashboardViewController *)self viewFullyVisibleFuture];
      [v13 cancel];

      id v14 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      -[HUDashboardViewController setViewFullyVisibleFuture:](self, "setViewFullyVisibleFuture:");
    }
  }
}

- (NAFuture)viewFirstTimeFullyVisibleFuture
{
  return self->_viewFirstTimeFullyVisibleFuture;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v30 viewDidLoad];
  uint64_t v3 = [(HUDashboardViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *MEMORY[0x1E4F43758];
  id v6 = +[HUGridSectionHeaderView reuseIdentifier];
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v6];

  int v7 = [(HUDashboardViewController *)self collectionView];
  [v7 setPreservesSuperviewLayoutMargins:1];

  os_signpost_id_t v8 = [(HUDashboardViewController *)self navigationItem];
  [v8 setLargeTitleDisplayMode:1];

  [(HUDashboardViewController *)self _setUpNavigationBar];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F69758] isAnIPad]
      && ![MEMORY[0x1E4F69758] isAMac]
      || [MEMORY[0x1E4F69758] isAVisionPro])
    {
      id v9 = objc_opt_new();
      id v10 = [(HUDashboardViewController *)self context];
      uint64_t v11 = [v10 room];
      if (v11)
      {
        [v9 setHideStandardTitle:1];
      }
      else
      {
        objc_super v27 = [(HUDashboardViewController *)self context];
        id v28 = [v27 accessoryTypeGroup];
        [v9 setHideStandardTitle:v28 != 0];
      }
      v29 = [(HUDashboardViewController *)self navigationItem];
      [v29 setTitleView:v9];
    }
  }
  else
  {
    [(HUDashboardViewController *)self _setUpTabBar];
  }
  [(HUDashboardViewController *)self _setupBackgroundView];
  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
  char v12 = [(HUDashboardViewController *)self collectionView];
  [v12 contentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  __int16 v21 = [(HUDashboardViewController *)self collectionView];
  objc_msgSend(v21, "setContentInset:", v14 + 10.0, v16, v18 + 150.0, v20);

  uint64_t v22 = [(HUDashboardViewController *)self collectionView];
  [v22 setIndicatorStyle:1];

  uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 addObserver:self selector:sel_migrationUpdatedTileSize_ name:*MEMORY[0x1E4F68890] object:0];

  id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 addObserver:self selector:sel_bannerSizeUpdated_ name:@"HUBannerSizeHasUpdatedNotification" object:0];

  int v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:self selector:sel_applicationWentIntoBackground_ name:*MEMORY[0x1E4F43660] object:0];

  uint64_t v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v26 addObserver:self selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4F43708] object:0];
}

- (void)_setUpNavigationBar
{
  uint64_t v3 = [(HUDashboardViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUDashboardNavigationBarBackButtonTitle", @"HUDashboardNavigationBarBackButtonTitle", 1);
  uint64_t v5 = [(HUDashboardViewController *)self navigationItem];
  [v5 setBackButtonTitle:v4];

  id v6 = +[HUNavigationBarButton addButtonWithOwner:self];
  [(HUDashboardViewController *)self setNavigationAddButton:v6];

  int v7 = +[HUNavigationBarButton announceButtonWithOwner:self];
  [(HUDashboardViewController *)self setNavigationAnnounceButton:v7];

  os_signpost_id_t v8 = +[HUNavigationBarButton editDoneButtonWithOwner:self];
  [(HUDashboardViewController *)self setNavigationEditDoneButton:v8];

  id v9 = +[HUNavigationBarButton homeButtonWithOwner:self];
  [(HUDashboardViewController *)self setNavigationHomeButton:v9];

  id v10 = [(HUDashboardViewController *)self context];
  uint64_t v11 = [v10 filterPresentationStyle];

  if (v11 == 2)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F42BF0], "hu_dashboardAppearance");
    [v12 configureWithTransparentBackground];
    [v12 configureWithDefaultShadow];
    double v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
    [v12 setShadowColor:v13];

    double v14 = [(HUDashboardViewController *)self navigationItem];
    [v14 setStandardAppearance:v12];
  }
  [(HUDashboardViewController *)self _updateBadgeCountForHomeButton];

  [(HUDashboardViewController *)self _updateBarButtons];
}

- (void)setNavigationHomeButton:(id)a3
{
}

- (void)setNavigationEditDoneButton:(id)a3
{
}

- (void)setNavigationAnnounceButton:(id)a3
{
}

- (void)setNavigationAddButton:(id)a3
{
}

- (void)_registerSectionDecorationViews
{
  objc_opt_class();
  uint64_t v3 = [(HUDashboardViewController *)self collectionViewLayout];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v6 = v4;

  if (v6)
  {
    uint64_t v5 = [(HUDashboardViewController *)self layoutManager];
    [v5 registerSectionDecorationViewsWithLayout:v6];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HUItemCollectionViewController *)self itemManager];
  char v12 = objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v10, "section"));

  if (([v9 isEqualToString:*MEMORY[0x1E4F43758]] & 1) == 0) {
    NSLog(&cfstr_AskedForAViewF.isa, v9);
  }
  double v13 = [(HUItemCollectionViewController *)self itemManager];
  double v14 = objc_msgSend(v13, "titleForSection:", objc_msgSend(v10, "section"));

  if (!v14) {
    NSLog(&cfstr_AskedForHeader.isa, v10);
  }
  double v15 = +[HUGridSectionHeaderView reuseIdentifier];
  v29 = v8;
  double v16 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v15 forIndexPath:v10];

  [v16 setOverrideUserInterfaceStyle:2];
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    double v17 = [MEMORY[0x1E4F42B58] plainHeaderConfiguration];
    double v18 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0 weight:*MEMORY[0x1E4F43930]];
    double v19 = [v17 textProperties];
    [v19 setFont:v18];

    double v20 = [MEMORY[0x1E4F428B8] whiteColor];
    __int16 v21 = [v17 textProperties];
    [v21 setColor:v20];
  }
  else
  {
    double v17 = +[HUCollectionLayoutManager defaultProminentInsetGroupedHeader];
  }
  [v17 setText:v14];
  [v16 setContentConfiguration:v17];
  uint64_t v22 = NSString;
  uint64_t v23 = (objc_class *)objc_opt_class();
  id v24 = NSStringFromClass(v23);
  int v25 = [v14 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  uint64_t v26 = [v22 stringWithFormat:@"%@.SectionHeader-%@", v24, v25];
  [v16 setAccessibilityIdentifier:v26];

  [(HUDashboardViewController *)self _updateHeaderView:v16 atIndexPath:v10];
  objc_super v27 = [(HUDashboardViewController *)self context];
  LODWORD(v26) = [v27 canPresentDetailsViewControllerForSectionWithIdentifier:v12];

  if (v26)
  {
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __90__HUDashboardViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
    v30[3] = &unk_1E6385250;
    objc_copyWeak(&v33, &location);
    id v31 = v14;
    id v32 = v12;
    [v16 setActionHandler:v30];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_updateHeaderView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v9 = [v6 section];

  id v10 = [v8 displayedSectionIdentifierForSectionIndex:v9];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke;
  double v16 = &unk_1E6388F60;
  double v17 = self;
  id v18 = v10;
  id v11 = v10;
  uint64_t v12 = __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke((uint64_t)&v13);
  objc_msgSend(v7, "setShowsDisclosureIndicator:", v12, v13, v14, v15, v16, v17);
}

uint64_t __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  if ([v2 canPresentDetailsViewControllerForSectionWithIdentifier:*(void *)(a1 + 40)]
    && ([MEMORY[0x1E4F69138] isHomeControlService] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) isEditing] ^ 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (HUDashboardViewController)initWithContext:(id)a3 delegate:(id)a4
{
  return [(HUDashboardViewController *)self initWithContext:a3 asOverlay:0 delegate:a4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v19 viewWillAppear:a3];
  [(HUDashboardViewController *)self _requestLocationAuth];
  [(HUDashboardViewController *)self _setUpFilterBar];
  [(HUDashboardViewController *)self _updateFilterBarVisibility];
  [(HUDashboardViewController *)self _updateTabBarVisibility];
  [(HUDashboardViewController *)self setupTipsObserver];
  [(HUDashboardViewController *)self _updateAnnounceNotificationSettingsIfNeeded];
  uint64_t v4 = [(HUDashboardViewController *)self cameraItemModuleController];
  uint64_t v5 = [(HUDashboardViewController *)self collectionView];
  id v6 = [v5 visibleCells];
  [v4 enableCameraSnapshotsForCells:v6];

  objc_initWeak(&location, self);
  id v7 = self;
  v20[0] = v7;
  id v8 = self;
  v20[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__HUDashboardViewController_viewWillAppear___block_invoke;
  v16[3] = &unk_1E63902C0;
  objc_copyWeak(&v17, &location);
  id v10 = (id)[(HUDashboardViewController *)self registerForTraitChanges:v9 withHandler:v16];

  id v11 = [(HUDashboardViewController *)self context];
  uint64_t v12 = [v11 home];
  LODWORD(v8) = objc_msgSend(v12, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if (v8)
  {
    [(HUDashboardViewController *)self createRestrictedGuestBlockedBackdropViewIfNeeded];
    uint64_t v13 = [(HUDashboardViewController *)self view];
    uint64_t v14 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    double v15 = [(HUDashboardViewController *)self wallpaperView];
    [v13 insertSubview:v14 above:v15];
  }
  else
  {
    uint64_t v13 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    [v13 removeFromSuperview];
  }

  [(HUDashboardViewController *)self _showNoHomeAccessViewsIfNeeded];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_updatePaletteHeight
{
  uint64_t v3 = [(HUDashboardViewController *)self context];
  if ([v3 filterPresentationStyle])
  {
    uint64_t v4 = [(HUDashboardViewController *)self _filterBarController];
    [v4 intrinsicHeight];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  id v7 = [(HUDashboardViewController *)self navigationItem];
  id v8 = [v7 _bottomPalette];
  [v8 preferredHeight];
  double v10 = v9;

  if (v10 != v6)
  {
    id v11 = [(HUDashboardViewController *)self navigationItem];
    uint64_t v12 = [v11 _bottomPalette];
    [v12 setPreferredHeight:v6];

    uint64_t v13 = [(HUDashboardViewController *)self context];
    uint64_t v14 = [v13 filterPresentationStyle];

    if (v14 == 2)
    {
      [(HUDashboardViewController *)self _clipToNavigationBar];
    }
  }
}

- (void)_updateFilterBarVisibility
{
  uint64_t v3 = [(HUDashboardViewController *)self context];
  BOOL v4 = [v3 filterPresentationStyle] == 0;

  double v5 = [(HUDashboardViewController *)self navigationItem];
  double v6 = [v5 _bottomPalette];
  [v6 setHidden:v4];

  [(HUDashboardViewController *)self _updatePaletteHeight];
}

- (void)_setUpFilterBar
{
  id v13 = [(HUDashboardViewController *)self navigationItem];
  uint64_t v3 = [v13 _bottomPalette];
  if (v3)
  {
  }
  else
  {
    BOOL v4 = [(HUDashboardViewController *)self navigationController];
    double v5 = [v4 viewControllers];
    double v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 navigationItem];
    id v8 = [v7 _bottomPalette];

    if (!v8)
    {
      double v9 = [(HUDashboardViewController *)self _filterBarController];
      objc_initWeak(&location, self);
      double v10 = objc_msgSend(v9, "hu_preloadContent");
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__HUDashboardViewController_NavigationBar___setUpFilterBar__block_invoke;
      v14[3] = &unk_1E6389AC0;
      objc_copyWeak(&v16, &location);
      id v11 = v9;
      id v15 = v11;
      id v12 = (id)[v10 addCompletionBlock:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_filterBarController
{
  objc_opt_class();
  uint64_t v3 = [(HUDashboardViewController *)self navigationController];
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  double v6 = [v5 filterBarController];

  return v6;
}

- (void)_updateAnnounceNotificationSettingsIfNeeded
{
  uint64_t v3 = [MEMORY[0x1E4F69250] sharedDispatcher];
  BOOL v4 = [v3 getAuthorizationStatusAsync];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke;
  v6[3] = &unk_1E638C210;
  v6[4] = self;
  id v5 = (id)[v4 addCompletionBlock:v6];
}

- (UIVisualEffectView)restrictedGuestBlockedBackdropView
{
  return self->_restrictedGuestBlockedBackdropView;
}

- (void)_updateTabBarVisibility
{
  BOOL v3 = [(HUDashboardViewController *)self _shouldHideTabBar];
  id v5 = [(HUDashboardViewController *)self tabBarController];
  BOOL v4 = [v5 tabBar];
  [v4 setHidden:v3];
}

- (BOOL)_shouldHideTabBar
{
  BOOL v3 = [(HUDashboardViewController *)self context];
  BOOL v4 = [v3 home];
  char v5 = objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome");

  if (v5) {
    return 1;
  }
  id v7 = [(HUDashboardViewController *)self context];
  id v8 = [v7 home];
  char v9 = objc_msgSend(v8, "hf_currentUserIsRestrictedGuest");

  return v9;
}

- (void)viewLayoutMarginsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)HUDashboardViewController;
  [(HUDashboardViewController *)&v14 viewLayoutMarginsDidChange];
  BOOL v3 = [(HUDashboardViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(HUDashboardViewController *)self _filterBarController];
  id v13 = [v12 collectionView];
  objc_msgSend(v13, "setLayoutMargins:", v5, v7, v9, v11);
}

id __46__HUDashboardViewController_hu_preloadContent__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadViewIfNeeded];
  v2 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v2;
}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 name];
    int v7 = 138412802;
    double v8 = self;
    __int16 v9 = 2080;
    double v10 = "-[HUDashboardViewController(Observer) homeDidUpdateHomeEnergyManagerEnabled:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@ %s) HUDashboardViewController ~~> Dispatching home: %@ onto main.", (uint8_t *)&v7, 0x20u);
  }
  [(HUDashboardViewController *)self _updateBarButtons];
  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
}

- (id)childViewControllersToPreload
{
  v8.receiver = self;
  v8.super_class = (Class)HUDashboardViewController;
  BOOL v3 = [(HUItemCollectionViewController *)&v8 childViewControllersToPreload];
  id v4 = (void *)[v3 mutableCopy];

  double v5 = [(HUDashboardViewController *)self _filterBarController];
  objc_msgSend(v4, "na_safeAddObject:", v5);
  double v6 = (void *)[v4 copy];

  return v6;
}

- (void)_requestLocationAuth
{
  id v2 = [MEMORY[0x1E4F65468] sharedAuthorization];
  [v2 requestAuthorization:2 completionHandler:0];
}

void __46__HUDashboardViewController_hu_preloadContent__block_invoke_4()
{
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "Completed extended launch", v3, 2u);
  }

  v1 = (void *)*MEMORY[0x1E4F43630];
  id v2 = [(id)*MEMORY[0x1E4F43630] _launchTestName];
  [v1 finishedTest:v2 waitForCommit:1 extraResults:0];
}

id __46__HUDashboardViewController_hu_preloadContent__block_invoke_3(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    id v2 = [*(id *)(a1 + 32) itemManager];
    BOOL v3 = [v2 home];
    id v4 = objc_msgSend(v3, "hf_characteristicValueManager");
    double v5 = [v4 firstReadCompleteFuture];
  }
  else
  {
    double v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v5;
}

- (id)hu_preloadContent
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)HUDashboardViewController;
  BOOL v3 = [(HUItemCollectionViewController *)&v25 hu_preloadContent];
  id v4 = [(HUDashboardViewController *)self context];
  if ([v4 backgroundStyle] == 2)
  {
    double v5 = [(HUDashboardViewController *)self wallpaperView];
    BOOL v6 = v5 == 0;

    if (v6) {
      goto LABEL_8;
    }
    int v7 = [(HUDashboardViewController *)self wallpaperView];
    objc_super v8 = [(HUDashboardViewController *)self context];
    __int16 v9 = [v8 room];
    if (v9)
    {
      id v4 = [v7 refreshWallpaperForHomeKitObject:v9 withAnimation:0];
    }
    else
    {
      double v10 = [(HUDashboardViewController *)self context];
      __int16 v11 = [v10 home];
      id v4 = [v7 refreshWallpaperForHomeKitObject:v11 withAnimation:0];
    }
    id v12 = (void *)MEMORY[0x1E4F7A0D8];
    v26[0] = v3;
    v26[1] = v4;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    objc_super v14 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    uint64_t v15 = [v12 combineAllFutures:v13 scheduler:v14];

    BOOL v3 = (void *)v15;
  }

LABEL_8:
  objc_initWeak(&location, self);
  id v16 = [v3 recover:&__block_literal_global_395];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__HUDashboardViewController_hu_preloadContent__block_invoke_2;
  v22[3] = &unk_1E6386068;
  objc_copyWeak(&v23, &location);
  id v17 = [v16 flatMap:v22];

  if ([(id)*MEMORY[0x1E4F43630] shouldRecordExtendedLaunchTime])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__HUDashboardViewController_hu_preloadContent__block_invoke_3;
    v21[3] = &unk_1E6388A88;
    v21[4] = self;
    id v18 = [v17 flatMap:v21];
    id v19 = (id)[v18 addCompletionBlock:&__block_literal_global_399];
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

void __59__HUDashboardViewController_NavigationBar___setUpFilterBar__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_alloc(MEMORY[0x1E4F43248]);
  BOOL v3 = [*(id *)(a1 + 32) view];
  id v4 = (void *)[v2 initWithContentView:v3];

  [v4 _setLayoutPriority:2];
  double v5 = [WeakRetained navigationItem];
  [v5 _setBottomPalette:v4];

  if ([WeakRetained viewIsFullyVisible]) {
    [WeakRetained _updatePaletteHeight];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HUDashboardViewController;
  [(HUDashboardViewController *)&v10 viewIsAppearing:a3];
  v11[0] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v5 = (id)[(HUDashboardViewController *)self registerForTraitChanges:v4 withAction:sel_handleTraitChanges];
  BOOL v6 = [(HUDashboardViewController *)self context];
  uint64_t v7 = [v6 filterPresentationStyle];

  if (v7 == 1)
  {
    objc_super v8 = [(HUDashboardViewController *)self navigationItem];
    __int16 v9 = [v8 _bottomPalette];
    [v9 setMinimumHeight:0.0];
  }
}

void __86__HUDashboardViewController_NavigationBar__navigationBarButtonIdentifierOrderForEdge___block_invoke_2()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"HomesAndRooms";
  v2[1] = @"Add";
  v2[2] = @"Done";
  v2[3] = @"Announce";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)qword_1EA121538;
  qword_1EA121538 = v0;
}

- (void)_showNoHomeAccessViewsIfNeeded
{
  objc_opt_class();
  BOOL v3 = [(HUDashboardViewController *)self navigationController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v15 = v4;

  id v5 = [(HUDashboardViewController *)self context];
  if ([v5 canShowNoHomeAccessView])
  {
    BOOL v6 = [v15 viewControllers];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      [(HUDashboardViewController *)self _showRoarUpgradeViewIfNeeded];
      [(HUDashboardViewController *)self _updateBarButtons];
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_super v8 = [(HUDashboardViewController *)self context];
  __int16 v9 = [v8 home];
  int v10 = objc_msgSend(v9, "hf_shouldBlockCurrentUserFromHome");

  if (v10)
  {
    __int16 v11 = [(HUDashboardViewController *)self _dashboardNavigator];
    id v12 = [(HUDashboardViewController *)self context];
    uint64_t v13 = [v12 home];
    id v14 = (id)[v11 showHome:v13];
  }
LABEL_10:
}

- (void)_showRoarUpgradeViewIfNeeded
{
  v74[4] = *MEMORY[0x1E4F143B8];
  id v4 = [(HUDashboardViewController *)self context];
  id v5 = [v4 home];

  if ([(HUDashboardViewController *)self _shouldShowRoarUpgradeView])
  {
    uint64_t v6 = objc_msgSend(v5, "hf_blockCurrentUserFromHomeReason");
    uint64_t v7 = [(HUDashboardViewController *)self homeUpgradedToRoarView];

    if (!v7)
    {
      objc_super v8 = [[HUROARUpgradeView alloc] initWithUpgradeViewReason:v6 home:v5];
      [(HUDashboardViewController *)self setHomeUpgradedToRoarView:v8];

      __int16 v9 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      v72 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
      v70 = [v72 leadingAnchor];
      int v71 = [(HUDashboardViewController *)self view];
      char v69 = [v71 layoutMarginsGuide];
      v68 = [v69 leadingAnchor];
      id v67 = [v70 constraintEqualToAnchor:v68];
      v74[0] = v67;
      id v66 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
      v64 = [v66 trailingAnchor];
      v65 = [(HUDashboardViewController *)self view];
      id v63 = [v65 layoutMarginsGuide];
      double v62 = [v63 trailingAnchor];
      id v61 = [v64 constraintEqualToAnchor:v62];
      v74[1] = v61;
      int v60 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
      v57 = [v60 topAnchor];
      id v58 = [(HUDashboardViewController *)self view];
      int v10 = [v58 layoutMarginsGuide];
      __int16 v11 = [v10 topAnchor];
      id v12 = [v57 constraintEqualToAnchor:v11];
      v74[2] = v12;
      uint64_t v13 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
      [v13 bottomAnchor];
      id v14 = v73 = v5;
      id v15 = [(HUDashboardViewController *)self view];
      id v16 = [v15 layoutMarginsGuide];
      id v17 = [v16 bottomAnchor];
      id v18 = [v14 constraintEqualToAnchor:v17];
      v74[3] = v18;
      v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];

      id v5 = v73;
      [(HUDashboardViewController *)self setUpgradeViewConstraints:v59];
    }
    id v19 = [(HUDashboardViewController *)self roarBackdropView];

    if (!v19)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F43028]);
      __int16 v21 = [MEMORY[0x1E4F427D8] effectWithStyle:18];
      uint64_t v22 = (void *)[v20 initWithEffect:v21];
      [(HUDashboardViewController *)self setRoarBackdropView:v22];

      id v23 = [(HUDashboardViewController *)self view];
      [v23 bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      id v32 = [(HUDashboardViewController *)self roarBackdropView];
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

      id v33 = [(HUDashboardViewController *)self roarBackdropView];
      [v33 setTranslatesAutoresizingMaskIntoConstraints:1];

      id v34 = [(HUDashboardViewController *)self roarBackdropView];
      [v34 setAutoresizingMask:18];
    }
    int v35 = [(HUDashboardViewController *)self view];
    __int16 v36 = [(HUDashboardViewController *)self roarBackdropView];
    id v37 = [(HUDashboardViewController *)self wallpaperView];
    [v35 insertSubview:v36 above:v37];

    __int16 v38 = [(HUDashboardViewController *)self view];
    id v39 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
    [v38 addSubview:v39];

    uint64_t v40 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v41 = [(HUDashboardViewController *)self upgradeViewConstraints];
    [v40 activateConstraints:v41];
  }
  else if ([(HUDashboardViewController *)self _isShowingRoarUpgradeView])
  {
    uint64_t v42 = (void *)MEMORY[0x1E4F28DC8];
    v43 = [(HUDashboardViewController *)self upgradeViewConstraints];
    [v42 deactivateConstraints:v43];

    v44 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
    [v44 removeFromSuperview];

    v45 = [(HUDashboardViewController *)self roarBackdropView];
    [v45 removeFromSuperview];

    v46 = [(HUItemCollectionViewController *)self itemManager];
    v47 = [v46 itemProviders];
    char v48 = objc_msgSend(v47, "hmf_isEmpty");

    if ((v48 & 1) == 0)
    {
      uint64_t v49 = [(HUItemCollectionViewController *)self itemManager];
      v50 = (void *)MEMORY[0x1E4F69230];
      uint64_t v51 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v52 = [(HUItemCollectionViewController *)self itemManager];
      uint64_t v53 = [v52 itemProviders];
      v54 = [v51 setWithArray:v53];
      id v55 = [v50 requestToReloadItemProviders:v54 senderSelector:a2];
      id v56 = (id)[v49 performItemUpdateRequest:v55];
    }
  }
}

- (BOOL)_shouldShowRoarUpgradeView
{
  id v2 = [(HUDashboardViewController *)self context];
  BOOL v3 = [v2 home];
  char v4 = objc_msgSend(v3, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");

  return v4;
}

- (BOOL)_isShowingRoarUpgradeView
{
  BOOL v3 = [(HUDashboardViewController *)self view];
  char v4 = [v3 subviews];
  id v5 = [(HUDashboardViewController *)self homeUpgradedToRoarView];
  if (objc_msgSend(v4, "na_safeContainsObject:", v5))
  {
    uint64_t v6 = [(HUDashboardViewController *)self view];
    uint64_t v7 = [v6 subviews];
    objc_super v8 = [(HUDashboardViewController *)self roarBackdropView];
    char v9 = objc_msgSend(v7, "na_safeContainsObject:", v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HUROARUpgradeView)homeUpgradedToRoarView
{
  return self->_homeUpgradedToRoarView;
}

- (void)setTipPopoverController:(id)a3
{
}

- (id)createDashboardTipModuleControllerWithModule:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for DashboardTipModuleController());
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = objc_msgSend(v5, sel_initWithModule_, v6);
  id v9 = objc_msgSend(v8, sel_asGeneric);

  return v9;
}

- (void)energyFeatureDidHide
{
  id v2 = self;
  sub_1BE4228BC();
}

- (id)createEnergyDashboardModuleControllerWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = HUDashboardViewController.createEnergyDashboardModuleController(with:)(v4);

  return v6;
}

- (void)setupTipsObserver
{
  id v2 = self;
  HUDashboardViewController.setupTipsObserver()();
}

- (void)tearDownTipsObserver
{
  id v2 = self;
  HUDashboardViewController.tearDownTipsObserver()();
}

- (void)changeHomeEnergyTipShouldDisplayTo:(BOOL)a3
{
  int v3 = a3;
  uint64_t v4 = qword_1EBA45110;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA453B8);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBA47B80);
  swift_beginAccess();
  sub_1BE9C38A8();
  swift_endAccess();
  if (v7 != v3)
  {
    swift_beginAccess();
    sub_1BE9C38B8();
    swift_endAccess();
  }
}

- (void)presentTip
{
  id v2 = self;
  sub_1BE424238();
}

- (void)dismissTip
{
  id v2 = self;
  HUDashboardViewController.dismissTip()();
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HUDashboardViewController.popoverPresentationControllerDidDismissPopover(_:)((UIPopoverPresentationController)v4);
}

- (id)homeKitObjectWithID:(id)a3
{
  uint64_t v4 = sub_1BE9C1158();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unsigned __int8 v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C1128();
  id v8 = self;
  id v9 = HUDashboardViewController.homeKitObject(with:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (BOOL)shouldShowAccessoryControlForHomeKitObject:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v3 = 1;
  if (!swift_dynamicCastObjCProtocolConditional()) {
    return 0;
  }
  return v3;
}

- (BOOL)matterItemSupportsAccessoryDetails:(id)a3
{
  return swift_dynamicCastClass() != 0;
}

- (BOOL)hasCustomControlPresentationAnimations
{
  return 1;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  void v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA116788;
  v15[5] = v13;
  id v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  void v16[4] = &unk_1EA113230;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  id v19 = self;
  sub_1BE5AF20C((uint64_t)v11, (uint64_t)&unk_1EA1167F0, (uint64_t)v16);
  swift_release();
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUDashboardViewController;
  id v4 = a3;
  uint64_t v5 = self;
  [(HUControllableItemCollectionViewController *)&v12 configureWithAccessoryControlViewController:v4];
  swift_getObjectType();
  uint64_t v6 = swift_conformsToProtocol2();
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = v4;
  }
  else {
    id v8 = 0;
  }
  if (v8)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void (**)(void, uint64_t, uint64_t))(v7 + 120);
    uint64_t v11 = (HUDashboardViewController *)v4;
    v10(0, ObjectType, v7);

    uint64_t v5 = v11;
  }
}

- (void)disableRefresh
{
  id v2 = self;
  HUDashboardViewController.disableRefresh()();
}

- (void)enableRefresh
{
  id v2 = self;
  HUDashboardViewController.enableRefresh()();
}

- (void)refreshTileHelper
{
  id v2 = self;
  HUDashboardViewController.refreshTileHelper()();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v12 = sub_1BE4C7274();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(HUDashboardViewController *)v5 accessoryControlAnimator];
  *((unsigned char *)&v6->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType) = 1;

  uint64_t v7 = [(HUDashboardViewController *)v5 accessoryControlAnimator];

  return v7;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x1E4F42C60]);
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setWantsInteractiveStart_, 0);
  swift_unknownObjectRelease();

  return v6;
}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(HUDashboardViewController *)v5 layoutManager];
  uint64_t v7 = [(HUDashboardViewController *)v5 context];
  id v8 = objc_msgSend(self, sel_defaultConfiguration);
  objc_msgSend(v8, sel_setContentInsetsReference_, 3);
  objc_msgSend(v8, sel_setInterSectionSpacing_, 20.0);

  return v8;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = HUDashboardViewController.layoutSection(forSection:layoutEnvironment:)(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 displayedItemsInSectionWithIdentifier:v6];

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  id v8 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  uint64_t v4 = sub_1BE9C49F8();
  id v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = HUDashboardViewController.shouldShowHeader(forSection:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_msgSend(v4, sel_setSectionLeadingMargin_, 0.0);
  objc_msgSend(v4, sel_setSectionTrailingMargin_, 0.0);

  return v4;
}

- (BOOL)allowsCondensedAccessoryTiles
{
  id v2 = self;
  Swift::Bool v3 = HUDashboardViewController.allowsCondensedAccessoryTiles()();

  return v3;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  Swift::String v8 = self;
  char v9 = HUDashboardViewController.canReorderItem(at:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1BE37E9E8(0, &qword_1EA1180A8);
  id v10 = (void *)sub_1BE9C4BF8();

  return v10;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  [(HUDashboardViewController *)v6 setItemShowingSizeToggleButton:0 animated:1];
  uint64_t v7 = [(HUItemCollectionViewController *)v6 itemManager];
  id v8 = (id)sub_1BE9C49B8();
  [(HFItemManager *)v7 disableExternalUpdatesWithReason:v8];

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  uint64_t v7 = [(HUItemCollectionViewController *)v6 itemManager];
  id v8 = (id)sub_1BE9C49B8();
  [(HFItemManager *)v7 endDisableExternalUpdatesWithReason:v8];

  swift_unknownObjectRelease();
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = objc_msgSend(a4, sel_localDragSession);
  swift_unknownObjectRelease();
  if (v8)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EA118090);
    uint64_t v9 = objc_msgSend(a4, sel_canLoadObjectsOfClass_, swift_getObjCClassFromMetadata());
  }

  swift_unknownObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA45590);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1BE9C11B8();
    uint64_t v12 = sub_1BE9C1208();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1BE9C1208();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  id v15 = self;
  id v16 = HUDashboardViewController.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)((uint64_t)v14, a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_1BE39DA0C((uint64_t)v11, &qword_1EBA45590);

  return v16;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  double v26 = self;
  uint64_t v7 = sub_1BE9C1208();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v25 - v12;
  MEMORY[0x1F4188790](v14);
  id v16 = (char *)&v25 - v15;
  MEMORY[0x1F4188790](v17);
  id v19 = (char *)&v25 - v18;
  sub_1BE9C11B8();
  sub_1BE9C11B8();
  sub_1BE9C11B8();
  id v20 = a3;
  __int16 v21 = v26;
  HUDashboardViewController.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)((uint64_t)v20, (uint64_t)v10, (uint64_t)v19);

  uint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  id v23 = (void *)sub_1BE9C11A8();
  v22(v19, v7);

  return v23;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  HUDashboardViewController.collectionView(_:performDropWith:)((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1BE587D0C(a4);

  swift_unknownObjectRelease();
}

- (id)contextTypeDescriptionForAnalytics
{
  id v2 = self;
  Swift::Bool v3 = [(HUDashboardViewController *)v2 context];
  sub_1BE4A770C();
  uint64_t v5 = v4;

  if (v5)
  {
    id v6 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)hu_performanceTestReadyFuture
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  Swift::Bool v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = [(HUDashboardViewController *)self hu_preloadContent];
  v11[0] = v4;
  uint64_t v5 = [(HUItemCollectionViewController *)self itemManager];
  id v6 = [v5 firstFullUpdateFuture];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v3 combineAllFutures:v7];
  uint64_t v9 = [v8 flatMap:&__block_literal_global_126];

  return v9;
}

uint64_t __63__HUDashboardViewController_PPT__hu_performanceTestReadyFuture__block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (HUDashboardViewController)init
{
  Swift::Bool v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v4 = [v3 home];
  uint64_t v5 = +[HUDashboardContext homeDashboardForHome:v4];

  id v6 = [(HUDashboardViewController *)self initWithContext:v5 delegate:0];
  return v6;
}

void __44__HUDashboardViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v16 traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];
  if (v8 == [v5 horizontalSizeClass])
  {
    uint64_t v9 = [v16 traitCollection];
    uint64_t v10 = [v9 verticalSizeClass];
    uint64_t v11 = [v5 verticalSizeClass];

    if (v10 == v11) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v12 = [WeakRetained presentedViewController];
  uint64_t v13 = [v12 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v15 = [WeakRetained presentedViewController];
    [v15 dismissViewControllerAnimated:1 completion:0];
  }
LABEL_7:
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUDashboardViewController;
  [(HUItemCollectionViewController *)&v18 viewWillDisappear:a3];
  uint64_t v4 = [(HUDashboardViewController *)self context];
  id v5 = [v4 accessoryTypeGroup];
  id v6 = [MEMORY[0x1E4F68EA0] energyAccessoryTypeGroup];
  if (v5 != v6)
  {

LABEL_3:
    goto LABEL_4;
  }
  uint64_t v10 = [(HUDashboardViewController *)self energyCategoryViewStartTime];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = [(HUDashboardViewController *)self energyCategoryViewStartTime];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    uint64_t v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v20 = v14;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Energy Category view duration:%f [s]", buf, 0xCu);
    }

    [(HUDashboardViewController *)self setEnergyCategoryViewStartTime:0];
    if (v14 > 1.0)
    {
      uint64_t v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      id v5 = [v4 allHomesFuture];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __47__HUDashboardViewController_viewWillDisappear___block_invoke;
      v17[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
      *(double *)&v17[4] = v14;
      id v16 = (id)[v5 addCompletionBlock:v17];
      goto LABEL_3;
    }
  }
LABEL_4:
  [(HUDashboardViewController *)self setViewIsFullyVisible:0];
  uint64_t v7 = [(HUDashboardViewController *)self cameraItemModuleController];
  uint64_t v8 = [(HUDashboardViewController *)self collectionView];
  uint64_t v9 = [v8 visibleCells];
  [v7 disableCameraSnapshotsForCells:v9];
}

void __47__HUDashboardViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "accessories", (void)v10);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  +[HUEnergyAnalytics saveViewDurationEvent:47 withDuration:v9 withUserHasAccessories:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v4 viewDidDisappear:a3];
  [(HUDashboardViewController *)self tearDownTipsObserver];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HUDashboardViewController;
  -[HUDashboardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  uint64_t v5 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];

  if (v5)
  {
    id v6 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    [v6 removeFromSuperview];

    [(HUDashboardViewController *)self setRestrictedGuestBlockedBackdropView:0];
    uint64_t v7 = [(HUDashboardViewController *)self context];
    uint64_t v8 = [v7 home];
    int v9 = objc_msgSend(v8, "hf_shouldBlockCurrentRestrictedGuestFromHome");

    if (v9)
    {
      [(HUDashboardViewController *)self createRestrictedGuestBlockedBackdropViewIfNeeded];
      long long v10 = [(HUDashboardViewController *)self view];
      long long v11 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
      long long v12 = [(HUDashboardViewController *)self wallpaperView];
      [v10 insertSubview:v11 above:v12];
    }
  }
}

- (void)setItemShowingSizeToggleButton:(id)a3
{
}

- (void)setItemShowingSizeToggleButton:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
  {
    id v8 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];
    id v9 = v7;
    long long v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (v8)
      {
        char v11 = [v8 isEqual:v9];

        if (v11) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      long long v12 = [MEMORY[0x1E4F1CA48] array];
      objc_super v13 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];
      objc_msgSend(v12, "na_safeAddObject:", v13);

      objc_msgSend(v12, "na_safeAddObject:", v10);
      objc_storeStrong((id *)&self->_itemShowingSizeToggleButton, a3);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__HUDashboardViewController_setItemShowingSizeToggleButton_animated___block_invoke;
      v14[3] = &unk_1E6390308;
      void v14[4] = self;
      BOOL v15 = a4;
      objc_msgSend(v12, "na_each:", v14);
    }
  }
LABEL_9:
}

void __69__HUDashboardViewController_setItemShowingSizeToggleButton_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 itemShowingSizeToggleButton];

  id v6 = [*(id *)(a1 + 32) itemManager];
  id v14 = [v6 indexPathForItem:v4];

  id v7 = [*(id *)(a1 + 32) collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v14];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    long long v10 = v9;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  if (v5 == v4) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  [v11 setShowsSizeChangeButton:v5 == v4 animated:*(unsigned __int8 *)(a1 + 40)];
  objc_super v13 = [v11 layer];
  [v13 setZPosition:v12];
}

- (void)reloadLayoutAnimated:(BOOL)a3 fastUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUDashboardViewController_reloadLayoutAnimated_fastUpdate___block_invoke;
  aBlock[3] = &unk_1E6386018;
  aBlock[4] = self;
  id v7 = _Block_copy(aBlock);
  id v8 = v7;
  if (v5) {
    [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:0.3];
  }
  else {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  long long v10 = [v9 allDisplayedItems];
  id v11 = [v10 allObjects];

  double v12 = [(HUItemCollectionViewController *)self itemManager];
  objc_super v13 = v12;
  if (v4) {
    [v12 reconfigureUIRepresentationForItems:v11 withAnimation:v5];
  }
  else {
    [v12 reloadUIRepresentationForItems:v11 withAnimation:v5];
  }
}

void __61__HUDashboardViewController_reloadLayoutAnimated_fastUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = [v2 collectionViewLayout];
  [v3 invalidateLayout];

  id v4 = [*(id *)(a1 + 32) collectionView];
  [v4 layoutIfNeeded];
}

- (HUCameraController)ppt_cameraController
{
  id v2 = [(HUDashboardViewController *)self cameraItemModuleController];
  id v3 = [v2 cameraController];

  return (HUCameraController *)v3;
}

- (BOOL)_isShowingRestrictedGuestBlockedBackdropView
{
  id v3 = [(HUDashboardViewController *)self view];
  id v4 = [v3 subviews];
  BOOL v5 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
  char v6 = objc_msgSend(v4, "na_safeContainsObject:", v5);

  return v6;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  id v8 = a4;
  [(HUControllableItemCollectionViewController *)&v11 collectionView:a3 didEndDisplayingCell:v8 forItemAtIndexPath:a5];
  id v9 = [(HUDashboardViewController *)self cameraItemModuleController];
  v12[0] = v8;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  [v9 disableCameraSnapshotsForCells:v10];
}

void __90__HUDashboardViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained isEditing] & 1) == 0)
  {
    int v3 = [MEMORY[0x1E4F69138] isHomeControlService];
    id v4 = HFLogForCategory();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v16 = 138412546;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped section header disclosure button to launch Home app for section: %@", (uint8_t *)&v16, 0x16u);
      }

      id v7 = *(void **)(a1 + 40);
      id v8 = [WeakRetained context];
      id v9 = [v8 home];
      long long v10 = HURoomForDashboardSectionIdentifier(v7, v9);

      if (v10)
      {
        objc_super v11 = [MEMORY[0x1E4F696F8] roomURLForRoom:v10];
        double v12 = [MEMORY[0x1E4F69378] sharedInstance];
        id v13 = (id)[v12 openSensitiveURL:v11];
      }
      else
      {
        objc_super v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(a1 + 40);
          int v16 = 138412546;
          id v17 = WeakRetained;
          __int16 v18 = 2112;
          uint64_t v19 = v15;
          _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to identify room for section: %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    else
    {
      if (v5)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 138412546;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped section header disclosure button to present details view controller for section: %@", (uint8_t *)&v16, 0x16u);
      }

      [WeakRetained _presentDetailsViewControllerForSectionWithIdentifier:*(void *)(a1 + 40) animated:1];
    }
  }
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  BOOL v5 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v6 = [v5 displayedSectionIdentifierForSectionIndex:a3];

  id v7 = [(HUDashboardViewController *)self context];
  id v8 = [v7 home];
  id v9 = HURoomForDashboardSectionIdentifier(v6, v8);

  long long v10 = HUAccessoryTypeGroupForDashboardSectionIdentifier(v6);
  objc_super v11 = [(HUItemCollectionViewController *)self itemManager];
  double v12 = [v11 itemModuleForSectionIdentifier:v6];

  if (v12)
  {
    id v13 = [v12 reorderableHomeKitItemList];
    goto LABEL_10;
  }
  if (v9)
  {
    uint64_t v14 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v15 = [v14 reorderableServiceListForRoom:v9];
LABEL_9:
    id v13 = (void *)v15;

    goto LABEL_10;
  }
  if (v10)
  {
    uint64_t v14 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v15 = [v14 reorderableServiceListForType:v10];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"favoritesSection"])
  {
    uint64_t v14 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v15 = [v14 reorderableFavoritesList];
    goto LABEL_9;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 displayedSectionIdentifierForSectionIndex:a4];

  id v9 = [(HUDashboardViewController *)self context];
  long long v10 = [v9 home];
  objc_super v11 = HURoomForDashboardSectionIdentifier(v8, v10);

  double v12 = HUAccessoryTypeGroupForDashboardSectionIdentifier(v8);
  id v13 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v14 = [v13 itemModuleForSectionIdentifier:v8];

  objc_opt_class();
  id v18 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v18;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  if (v14)
  {
    [v14 setReorderableHomeKitItemList:v16];
    goto LABEL_13;
  }
  if (v11)
  {
    id v17 = [(HUItemCollectionViewController *)self itemManager];
    [v17 setReorderableServiceList:v16 forRoom:v11];
  }
  else if (v12)
  {
    id v17 = [(HUItemCollectionViewController *)self itemManager];
    [v17 setReorderableServiceList:v16 forType:v12];
  }
  else
  {
    if (![v8 isEqualToString:@"favoritesSection"]) {
      goto LABEL_13;
    }
    id v17 = [(HUItemCollectionViewController *)self itemManager];
    [v17 setReorderableFavoritesList:v16];
  }

LABEL_13:
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUDashboardViewController;
  [(HUControllableItemCollectionViewController *)&v6 didReorderItemWithSortedItemsBySectionID:a3];
  id v4 = [(HUDashboardViewController *)self collectionView];
  BOOL v5 = [v4 collectionViewLayout];
  [v5 invalidateLayout];
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(HUDashboardViewController *)self bannerItemModuleController],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasTapActionForItem:v4],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUDashboardViewController;
    BOOL v7 = [(HUControllableItemCollectionViewController *)&v9 _hasTapActionForItem:v4];
  }

  return v7;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [(HUDashboardViewController *)self bannerItemModuleController];
      int v9 = [v8 hasTapActionForItem:v6];

      if (!v9) {
        goto LABEL_8;
      }
    }
  }
  long long v10 = [(HUItemCollectionViewController *)self moduleControllerForItem:v6];
  objc_super v11 = v10;
  if (v10) {
    [v10 didSelectItem:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)HUDashboardViewController;
    double v12 = [(HUControllableItemCollectionViewController *)&v14 _performTapActionForItem:v6 tappedArea:v7];
    goto LABEL_10;
  }
  double v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

LABEL_10:

  return v12;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    id v7 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];

    if (v7) {
      [(HUDashboardViewController *)self setItemShowingSizeToggleButton:0];
    }
  }
  if ([(HUDashboardViewController *)self isEditing] != v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)HUDashboardViewController;
    [(HUControllableItemCollectionViewController *)&v8 setEditing:v5 animated:v4];
    [(HUDashboardViewController *)self _updateAllHeaderViews];
    [(HUDashboardViewController *)self _updateBarButtons];
    [(HUDashboardViewController *)self reloadLayoutAnimated:v4 fastUpdate:1];
  }
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  objc_super v11 = [(HUDashboardViewController *)self collectionView];
  double v12 = [v11 cellForItemAtIndexPath:v10];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  objc_super v14 = 0;
  if (!v13)
  {
    v16.receiver = self;
    v16.super_class = (Class)HUDashboardViewController;
    objc_super v14 = -[HUControllableItemCollectionViewController tappableAreaForPoint:inItem:atIndexPath:](&v16, sel_tappableAreaForPoint_inItem_atIndexPath_, v9, v10, x, y);
  }

  return v14;
}

- (void)didSelectWelcomeBanner:(id)a3
{
  id v4 = [(HUDashboardViewController *)self _dashboardNavigator];
  id v3 = (id)[v4 showDiscoverTab];
}

- (void)didSelectUnreachableResidentsBanner:(id)a3
{
  id v7 = [(HUDashboardViewController *)self _dashboardNavigator];
  id v4 = [(HUDashboardViewController *)self context];
  BOOL v5 = [v4 home];
  id v6 = (id)[v7 showBridgeSettingsForHome:v5];
}

- (void)didSelectHomeHubMigrationBanner:(id)a3
{
  id v5 = a3;
  id v6 = [(HUDashboardViewController *)self context];
  id v7 = [v6 home];

  id v8 = objc_alloc(MEMORY[0x1E4F69710]);
  id v9 = [v7 currentUser];
  id v10 = (void *)[v8 initWithHome:v7 user:v9 nameStyle:0];

  id v11 = (id)[v10 setDismissedHomeHubMigrationBanner:1];
  double v12 = [v5 module];
  id v13 = [v12 bannerItemProvider];
  objc_super v14 = [v13 homeHubMigrationBannerItem];

  uint64_t v15 = [(HUItemCollectionViewController *)self itemManager];
  objc_super v16 = [v15 home];
  id v17 = [v14 devices];
  id v18 = +[HUHomeFeatureOnboardingUtilities home:v16 onboardHomeHub2FromPresentingViewController:self devices:v17 usageOptions:0];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__HUDashboardViewController_didSelectHomeHubMigrationBanner___block_invoke;
  v22[3] = &unk_1E6387BB0;
  id v24 = v5;
  SEL v25 = a2;
  id v23 = v14;
  id v19 = v5;
  id v20 = v14;
  id v21 = (id)[v18 flatMap:v22];
}

id __61__HUDashboardViewController_didSelectHomeHubMigrationBanner___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", *(void *)(a1 + 32));
  id v4 = [v2 requestToUpdateItems:v3 senderSelector:*(void *)(a1 + 48)];

  id v5 = [*(id *)(a1 + 40) module];
  id v6 = [v5 itemUpdater];
  id v7 = (id)[v6 performItemUpdateRequest:v4];

  id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v8;
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v17.receiver = self;
  v17.super_class = (Class)HUDashboardViewController;
  id v9 = a3;
  id v10 = -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](&v17, sel_quickControlPresentationContextForItem_atIndexPath_point_, v9, a4, x, y);
  id v11 = [(HUDashboardViewController *)self context];
  double v12 = [v11 room];
  if (v12)
  {
    [v10 setParentViewHomeKitObject:v12];
  }
  else
  {
    id v13 = [(HUDashboardViewController *)self context];
    objc_super v14 = [v13 home];
    [v10 setParentViewHomeKitObject:v14];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v10 setPrefersSystemTransitions:1];
  }

  return v10;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return [(UIViewController *)self hu_dismissViewControllerAnimated:a4];
}

- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F69138], "isHomeControlService", a3);
}

- (id)traitCollectionForPresentationCoordinator:(id)a3
{
  return (id)[MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)HUDashboardViewController;
  if ([(HUControllableItemCollectionViewController *)&v63 presentationCoordinator:v6 shouldBeginPresentationWithContext:v7])
  {
    id v8 = [v7 item];
    id v9 = [(HUItemCollectionViewController *)self itemManager];
    id v10 = [v9 indexPathForItem:v8];

    id v11 = [(HUItemCollectionViewController *)self itemManager];
    double v12 = objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v10, "section"));

    if (([v12 isEqualToString:@"energySection"] & 1) != 0
      || ([v12 isEqualToString:@"tipsSection"] & 1) != 0)
    {
      BOOL v13 = 0;
LABEL_53:

      goto LABEL_54;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(HUDashboardViewController *)self bannerItemModuleController],
          objc_super v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 hasTapActionForItem:v8],
          v14,
          (v15 & 1) == 0))
    {
      objc_opt_class();
      id v18 = [v8 sourceItem];
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v57 = v19;

      [v7 setItem:v57];
      id v20 = (void *)MEMORY[0x1E4F68EE0];
      id v16 = [(HUItemCollectionViewController *)self itemManager];
      id v21 = [v16 bannerItemModule];
      uint64_t v22 = [v21 hiddenBanners];
      [v20 sendBannerInteractionforItem:v8 tappedBannerItemOverrideClassName:0 hiddenBannerEvents:v22];
    }
    else
    {
      objc_opt_class();
      id v16 = v8;
      if (objc_opt_isKindOfClass()) {
        objc_super v17 = v16;
      }
      else {
        objc_super v17 = 0;
      }
      id v57 = v17;
    }

    if (v57 && [(HUDashboardViewController *)self _canSkipStatusDetailsForItem:v57])
    {
      id v23 = [v57 latestResults];
      v54 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];

      if ([v54 count] == 1)
      {
        id v24 = [v54 anyObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = objc_msgSend(v24, "hf_serviceGroup");
          double v26 = (void *)v25;
          if (v25) {
            double v27 = (void *)v25;
          }
          else {
            double v27 = v24;
          }
          id v28 = v27;

          id v24 = v28;
        }
        BOOL v29 = -[HUDashboardViewController _shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:](self, "_shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:", v24, v57, v54);
        double v30 = HFLogForCategory();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v29)
        {
          if (v31)
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2112;
            int v71 = (uint64_t (*)(uint64_t, uint64_t))v24;
            _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory controls for HomeKit object: %@", buf, 0x20u);
          }

          id v32 = [(HUDashboardViewController *)self _presentAccessoryControlsForHomeKitObject:v24 fromStatusItem:v57 animated:1];
        }
        else
        {
          if (v31)
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2112;
            int v71 = (uint64_t (*)(uint64_t, uint64_t))v24;
            _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory settings for HomeKit object: %@", buf, 0x20u);
          }

          id v37 = [(HUDashboardViewController *)self _presentAccessorySettingsForHomeKitObject:v24 fromStatusItem:v57 animated:1];
        }

LABEL_51:
        BOOL v13 = 0;
LABEL_52:

        goto LABEL_53;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      int v71 = __Block_byref_object_copy__31;
      v72 = __Block_byref_object_dispose__31;
      id v73 = 0;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke;
      v62[3] = &unk_1E6390330;
      v62[4] = buf;
      [v54 enumerateObjectsUsingBlock:v62];
      uint64_t v33 = *(void *)(*(void *)&buf[8] + 40);
      if (v33)
      {
        if ([(HUDashboardViewController *)self _shouldShowAccessoryControlsForHomeKitObject:v33 fromStatusItem:v57])
        {
          id v34 = HFLogForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v64 = 138412802;
            v65 = self;
            __int16 v66 = 2112;
            id v67 = v57;
            __int16 v68 = 2112;
            uint64_t v69 = v35;
            _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory controls for HMServiceGroup: %@", v64, 0x20u);
          }

          id v36 = [(HUDashboardViewController *)self _presentAccessoryControlsForHomeKitObject:*(void *)(*(void *)&buf[8] + 40) fromStatusItem:v57 animated:1];
        }
        else
        {
          v50 = HFLogForCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v64 = 138412802;
            v65 = self;
            __int16 v66 = 2112;
            id v67 = v57;
            __int16 v68 = 2112;
            uint64_t v69 = v51;
            _os_log_impl(&dword_1BE345000, v50, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory settings for HMServiceGroup: %@", v64, 0x20u);
          }

          id v52 = [(HUDashboardViewController *)self _presentAccessorySettingsForHomeKitObject:*(void *)(*(void *)&buf[8] + 40) fromStatusItem:v57 animated:1];
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_51;
      }
      _Block_object_dispose(buf, 8);
    }
    if (objc_msgSend(MEMORY[0x1E4F69138], "isHomeControlService", v54)
      && ([v7 didAuthenticate] & 1) == 0)
    {
      id v39 = [(HUItemCollectionViewController *)self itemManager];
      uint64_t v40 = [v7 item];
      uint64_t v41 = [v39 childItemsForItem:v40 ofClass:objc_opt_class()];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_307;
      v61[3] = &unk_1E6386108;
      v61[4] = self;
      LODWORD(v56) = objc_msgSend(v41, "na_any:", v61);

      if (v56)
      {
        uint64_t v42 = (void *)[v7 copy];
        v43 = [v7 controlItems];
        [v42 setControlItems:v43];

        v44 = [(HUControllableItemCollectionViewController *)self lockAuthorizationDelegate];
        v45 = [v44 authorizeIfLockedForViewController:self];

        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2;
        v58[3] = &unk_1E63859F8;
        id v59 = v42;
        id v60 = v6;
        id v46 = v42;
        id v47 = (id)[v45 addSuccessBlock:v58];
      }
      char v38 = v56 ^ 1;
    }
    else
    {
      char v38 = 1;
    }
    char v48 = objc_msgSend(v8, "latestResults", v56);
    uint64_t v49 = [v48 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];

    if (v49) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v38;
    }
    goto LABEL_52;
  }
  BOOL v13 = 0;
LABEL_54:

  return v13;
}

void __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  id v13 = v5;
  if (objc_opt_isKindOfClass()) {
    id v6 = v13;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = objc_msgSend(v7, "hf_serviceGroup");
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    if (!v10)
    {
LABEL_8:
      objc_storeStrong((id *)(v9 + 40), v8);
      goto LABEL_10;
    }
    if ([v10 isEqual:v8])
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      goto LABEL_8;
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  *a3 = 1;
LABEL_10:
}

uint64_t __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_307(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requiresUnlockToPerformActionForItem:a2];
}

id __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 40) presentQuickControlWithContext:*(void *)(a1 + 32) animated:1];
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  id v4 = objc_msgSend(a4, "item", a3);
  char v5 = objc_opt_respondsToSelector();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char v6 = (objc_opt_isKindOfClass() | v5) ^ 1;
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    BOOL v12 = 0;
  }
  else
  {
    id v13 = [(HUDashboardViewController *)self collectionView];
    objc_super v14 = objc_msgSend(v13, "indexPathForItemAtPoint:", x, y);

    if (v14)
    {
      char v15 = [(HUItemCollectionViewController *)self itemManager];
      id v16 = [v15 displayedItemAtIndexPath:v14];

      if (v16)
      {
        objc_super v17 = [(HUItemCollectionViewController *)self itemManager];
        id v18 = objc_msgSend(v17, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v14, "section"));

        BOOL v12 = 0;
        if (([v18 isEqualToString:@"tipsSection"] & 1) == 0)
        {
          if (![(HUDashboardViewController *)self isEditing]
            || ([(HUDashboardViewController *)self layoutManager],
                id v19 = objc_claimAutoreleasedReturnValue(),
                [(HUDashboardViewController *)self context],
                id v20 = objc_claimAutoreleasedReturnValue(),
                int v21 = [v19 isAdaptiveTileStyleInSectionIdentifier:v18 context:v20],
                v20,
                v19,
                v21))
          {
            BOOL v12 = 1;
          }
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (void)presentationCoordinator:(id)a3 touchDidBeginForItem:(id)a4 tappedArea:(id)a5
{
  if (@"HUTileCellTappableAreaStateToggleButton" == a5)
  {
    id v6 = a4;
    id v7 = [(HUItemCollectionViewController *)self itemManager];
    id v13 = [v7 indexPathForItem:v6];

    id v8 = [(HUDashboardViewController *)self collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v13];

    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    [v12 animateIconTouchDown];
  }
}

- (void)presentationCoordinator:(id)a3 touchDidEndForItem:(id)a4 tappedArea:(id)a5
{
  if (@"HUTileCellTappableAreaStateToggleButton" == a5)
  {
    id v6 = a4;
    id v7 = [(HUItemCollectionViewController *)self itemManager];
    id v13 = [v7 indexPathForItem:v6];

    id v8 = [(HUDashboardViewController *)self collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v13];

    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    [v12 animateIconTouchUp];
  }
}

- (BOOL)presentationCoordinator:(id)a3 shouldAllowTapticFeedbackForItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    char v12 = 1;
  }
  else
  {
    id v13 = [v8 alwaysAllowedScheduleItem];
    if ([v9 isEqual:v13])
    {
      char v12 = 1;
    }
    else
    {
      objc_super v14 = [v8 accessoryNoAccessItem];
      char v12 = [v9 isEqual:v14];
    }
  }

  return v12 ^ 1;
}

- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = [v10 latestResults];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68B30]];

  if (!v13)
  {
    id v18 = [v9 pressedTile];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_17;
    }
    objc_opt_class();
    id v20 = [(HUItemCollectionViewController *)self itemManager];
    if (objc_opt_isKindOfClass()) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    id v97 = v21;

    objc_opt_class();
    uint64_t v22 = v10;
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    if (!v24)
    {
      uint64_t v25 = [v97 alwaysAllowedScheduleItem];
      if ([v22 isEqual:v25])
      {
      }
      else
      {
        double v27 = [v97 accessoryNoAccessItem];
        int v28 = [v22 isEqual:v27];

        if (v22 && !v28)
        {
          BOOL v29 = [v97 contactOwnerItem];
          int v30 = [v22 isEqual:v29];

          if (v30)
          {
            BOOL v31 = [(HUDashboardViewController *)self context];
            id v32 = [v31 home];
            uint64_t v33 = [v32 owner];
            id v34 = [v33 userID];

            if (v34)
            {
              uint64_t v35 = (void *)MEMORY[0x1E4F1CB10];
              id v36 = [NSString stringWithFormat:@"sms://%@", v34];
              id v37 = [v35 URLWithString:v36];

              char v38 = HFLogForCategory();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                id v39 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412802;
                v107 = self;
                __int16 v108 = 2112;
                v109 = v39;
                __int16 v110 = 2112;
                v111 = v37;
                _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@, User requests to contact owner. Opening URL { %@ }", buf, 0x20u);
              }
              uint64_t v40 = [MEMORY[0x1E4F69378] sharedInstance];
              id v41 = (id)[v40 openSensitiveURL:v37];
            }
            else
            {
              id v37 = HFLogForCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                id v60 = NSStringFromSelector(a2);
                v95 = [(HUDashboardViewController *)self context];
                v92 = [v95 home];
                v90 = [v92 owner];
                id v61 = [(HUDashboardViewController *)self context];
                double v62 = [v61 home];
                *(_DWORD *)buf = 138413314;
                v107 = self;
                __int16 v108 = 2112;
                v109 = v60;
                __int16 v110 = 2112;
                v111 = v90;
                __int16 v112 = 2112;
                uint64_t v113 = 0;
                __int16 v114 = 2112;
                v115 = v62;
                _os_log_impl(&dword_1BE345000, v37, OS_LOG_TYPE_DEFAULT, "%@:%@, Unable to open URL to contact owner {%@} with email {%@} in home {%@}", buf, 0x34u);
              }
            }
          }
          else
          {
            uint64_t v42 = [v97 pinCodeAccessItem];
            int v43 = [v22 isEqual:v42];

            if (v43)
            {
              v44 = [(HUDashboardViewController *)self context];
              v45 = [v44 home];

              id v46 = [v45 currentUser];
              v94 = [v97 pinCodeManager];
              id v47 = [v97 pinCodeManager];
              char v48 = [v47 userPinCodes];

              objc_initWeak((id *)buf, self);
              v100[0] = MEMORY[0x1E4F143A8];
              v100[1] = 3221225472;
              v100[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke;
              v100[3] = &unk_1E638BAF8;
              objc_copyWeak(v105, (id *)buf);
              id v49 = v46;
              id v101 = v49;
              v105[1] = (id)a2;
              id v50 = v45;
              id v102 = v50;
              id v103 = v97;
              id v51 = v94;
              id v104 = v51;
              id v52 = (id)[v48 addSuccessBlock:v100];

              objc_destroyWeak(v105);
              objc_destroyWeak((id *)buf);
            }
            else
            {
              uint64_t v53 = [v97 homeKeyItem];
              int v54 = [v22 isEqual:v53];

              if (v54)
              {
                id v55 = (void *)MEMORY[0x1E4F69770];
                uint64_t v56 = [(HUDashboardViewController *)self context];
                id v57 = [v56 home];
                id v58 = [v55 handleAddOrShowHomeKeyButtonTapForHome:v57];
                id v59 = (id)[v58 addCompletionBlock:&__block_literal_global_241];
              }
              else
              {
                objc_super v63 = [(HUItemCollectionViewController *)self itemManager];
                v96 = [v63 indexPathForItem:v22];

                v64 = [(HUItemCollectionViewController *)self itemManager];
                v93 = objc_msgSend(v64, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v96, "section"));

                v65 = &unk_1F1A3D190;
                __int16 v66 = v22;
                if ([v66 conformsToProtocol:v65]) {
                  id v67 = v66;
                }
                else {
                  id v67 = 0;
                }
                v91 = v67;

                __int16 v68 = [(HUDashboardViewController *)self layoutManager];
                uint64_t v69 = [(HUDashboardViewController *)self context];
                int v70 = [v68 isAdaptiveTileStyleInSectionIdentifier:v93 context:v69];

                if ([(HUDashboardViewController *)self isEditing] && v91 && v70)
                {
                  int v71 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];

                  v72 = v91;
                  if (v71 == v91) {
                    id v73 = 0;
                  }
                  else {
                    id v73 = v91;
                  }
                  [(HUDashboardViewController *)self setItemShowingSizeToggleButton:v73 animated:1];
                }
                else
                {
                  [(HUDashboardViewController *)self setItemShowingSizeToggleButton:0 animated:1];
                  if (objc_opt_respondsToSelector())
                  {
                    uint64_t v74 = v66;
                    v89 = [v74 activityLogCoordinator];
                    v75 = [HUActivityLogViewController alloc];
                    v76 = [(HUItemCollectionViewController *)self itemManager];
                    v77 = [v76 home];
                    v78 = [(HUActivityLogViewController *)v75 initWithHome:v77 activityLogCoordinator:v89];

                    id v79 = objc_alloc(MEMORY[0x1E4F42BF8]);
                    v80 = (void *)[v79 initWithRootViewController:v78];
                    v81 = [(HUDashboardViewController *)self navigationController];
                    [v81 presentViewController:v80 animated:1 completion:0];
                  }
                  else
                  {
                    int v82 = &selRef_preferredSize;
                    if ((_os_feature_enabled_impl() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
                    {
                      v83 = [v66 latestResults];
                      v84 = [v83 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

                      objc_opt_class();
                      id v85 = v84;
                      if (objc_opt_isKindOfClass()) {
                        v86 = v85;
                      }
                      else {
                        v86 = 0;
                      }
                      id v87 = v86;

                      if (v87 && [v87 isThreadNetworkError])
                      {
                        uint64_t v88 = HFLogForCategory();
                        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315394;
                          v107 = (HUDashboardViewController *)"-[HUDashboardViewController presentationCoordinator:didRec"
                                                              "ognizeTapForItem:tappedArea:]";
                          __int16 v108 = 2112;
                          v109 = v66;
                          _os_log_impl(&dword_1BE345000, v88, OS_LOG_TYPE_DEFAULT, "%s Item: %@ tapped and is unreachable due to thread network", buf, 0x16u);
                        }

                        v99.receiver = self;
                        v99.super_class = (Class)HUDashboardViewController;
                        [(HUControllableItemCollectionViewController *)&v99 presentationCoordinator:v9 didRecognizeTapForItem:v66 tappedArea:v11];
                      }

                      int v82 = &selRef_preferredSize;
                    }
                    v98.receiver = self;
                    v98.super_class = (Class)HUDashboardViewController;
                    objc_msgSendSuper2(&v98, v82[98], v9, v66, v11);
                  }
                  v72 = v91;
                }
              }
            }
          }
          goto LABEL_16;
        }
      }
    }
    double v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v107 = (HUDashboardViewController *)"-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]";
      __int16 v108 = 2112;
      v109 = v24;
      __int16 v110 = 2112;
      v111 = v22;
      _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "(%s) Skipping action because ruleItem = %@ | item = %@", buf, 0x20u);
    }

LABEL_16:
    goto LABEL_17;
  }
  objc_super v14 = (void *)MEMORY[0x1E4F68ED0];
  char v15 = [(HUItemCollectionViewController *)self itemManager];
  id v16 = [v15 home];
  id v17 = (id)[v14 addAndSetupNewAccessoriesForHome:v16 room:0];

LABEL_17:
}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2;
  v29[3] = &unk_1E6389E28;
  id v30 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v3, "na_firstObjectPassingTest:", v29);
  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_321;
    aBlock[3] = &unk_1E638A138;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    id v25 = v5;
    id v26 = *(id *)(a1 + 40);
    id v27 = *(id *)(a1 + 48);
    id v8 = (void (**)(void))_Block_copy(aBlock);
    id v9 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    id v23 = 0;
    int v10 = [v9 canEvaluatePolicy:2 error:&v23];
    id v11 = v23;
    char v12 = v11;
    if (v10)
    {
      id v13 = _HULocalizedStringWithDefaultValue(@"HUPinCodePassCodeAuthString", @"HUPinCodePassCodeAuthString", 1);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2_329;
      void v20[3] = &unk_1E6390048;
      uint64_t v22 = v8;
      id v21 = v9;
      [v21 evaluatePolicy:2 localizedReason:v13 reply:v20];
    }
    else
    {
      id v18 = [v11 domain];
      if ([v18 isEqualToString:*MEMORY[0x1E4F30B38]])
      {
        BOOL v19 = [v12 code] == -5;

        if (v19)
        {
          v8[2](v8);
LABEL_14:

          objc_destroyWeak(&v28);
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v32 = "-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]_block_invoke";
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "(%s) cannot local authenticate. error = %@", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F69710]) initWithHome:*(void *)(a1 + 40) user:*(void *)(a1 + 32) nameStyle:0];
  char v15 = [[HUPersonalPINCodeViewController alloc] initWithItem:v14 pinCodeManager:*(void *)(a1 + 56) home:*(void *)(a1 + 40)];
  [(HUPersonalPINCodeViewController *)v15 setShowDoneButtonInNavBar:1];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v15];
  [v16 setModalPresentationStyle:2];
  id v17 = (id)objc_msgSend(WeakRetained, "hu_presentPreloadableViewController:animated:", v16, 1);

LABEL_15:
}

uint64_t __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  id v4 = [v3 user];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_321(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:*(void *)(a1 + 32) inHome:*(void *)(a1 + 40) onAccessory:0];
  id v3 = [HUPersonalPINCodeViewController alloc];
  id v4 = [*(id *)(a1 + 48) pinCodeManager];
  uint64_t v5 = [(HUPersonalPINCodeViewController *)v3 initWithItem:v2 pinCodeManager:v4 home:*(void *)(a1 + 40)];

  [(HUPersonalPINCodeViewController *)v5 setShowDoneButtonInNavBar:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:2];
  id v7 = (id)objc_msgSend(WeakRetained, "hu_presentPreloadableViewController:animated:", v6, 1);
}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2_329(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]_block_invoke_2";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(%s) When evaluating authentication policy, authError = %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (a2) {
      dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
    }
    [*(id *)(a1 + 32) invalidate];
  }
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  BOOL v6 = ([MEMORY[0x1E4F69138] isHomeControlService] & 1) == 0
    && [(HUDashboardViewController *)self _hasDetailViewControllerForItem:v5];

  return v6;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HUDashboardViewController *)self _quickControlDetailViewControllerForItem:v5];
  if (!v6) {
    NSLog(&cfstr_NoDetailsViewC.isa, v5);
  }

  return v6;
}

- (BOOL)_hasDetailViewControllerForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = [v4 conformsToProtocol:&unk_1F1A3D558];
  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 sourceItem];
  char v11 = [v10 conformsToProtocol:&unk_1F1A3D558];

  char v12 = isKindOfClass | v6 | [(HUDashboardViewController *)self matterItemSupportsAccessoryDetails:v7] | v11;
  return v12 & 1;
}

- (id)_quickControlDetailViewControllerForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    id v7 = v6;

    id v8 = [v7 actionSet];

    if (!v8)
    {
      NSLog(&cfstr_ActionsetMustN.isa);
      objc_super v14 = 0;
LABEL_29:

      if (v14) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    id v9 = objc_alloc(MEMORY[0x1E4F68EB0]);
    id v10 = [v7 actionSet];
    char v11 = [(HUItemCollectionViewController *)self itemManager];
    char v12 = [v11 home];
    id v13 = (id)[v9 initWithExistingObject:v10 inHome:v12];

    objc_super v14 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v13 mode:0];
LABEL_27:

    goto LABEL_29;
  }
  if ([v4 conformsToProtocol:&unk_1F1A3D558])
  {
    id v15 = v4;
    if ([v15 conformsToProtocol:&unk_1F1A3D558]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    objc_opt_class();
    id v7 = v17;
    if (objc_opt_isKindOfClass()) {
      id v18 = v7;
    }
    else {
      id v18 = 0;
    }
    id v13 = v18;

    if (v13)
    {
      BOOL v19 = [v13 accessory];
      int v20 = objc_msgSend(v19, "hf_isSingleServiceLikeAccessory");

      if (v20)
      {
        id v21 = [v13 accessory];
        uint64_t v22 = objc_msgSend(v21, "hf_primaryService");
        uint64_t v23 = [v13 serviceItemForService:v22];

        id v7 = (id)v23;
      }
    }
    objc_initWeak(&location, self);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke;
    v36[3] = &unk_1E63862A0;
    id v24 = &v37;
    objc_copyWeak(&v37, &location);
    uint64_t v25 = +[HUAccessoryDetailsRouter detailsViewFor:v7 navigationController:0 dismiss:v36];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v26 = v4;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v7 = v27;

    id v28 = [v7 sourceItem];
    if ([v28 conformsToProtocol:&unk_1F1A3D558]) {
      BOOL v29 = v28;
    }
    else {
      BOOL v29 = 0;
    }
    id v13 = v29;

    objc_initWeak(&location, self);
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    __int16 v33 = __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke_2;
    id v34 = &unk_1E63862A0;
    id v24 = &v35;
    objc_copyWeak(&v35, &location);
    uint64_t v25 = +[HUAccessoryDetailsRouter detailsViewFor:v13 navigationController:0 dismiss:&v31];
LABEL_26:
    objc_super v14 = (HUSceneActionEditorViewController *)v25;
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_27;
  }
LABEL_30:
  NSLog(&cfstr_NoDetailsViewC.isa, v4, v31, v32, v33, v34);
  objc_super v14 = 0;
LABEL_31:

  return v14;
}

void __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained _dismissPresentedViewControllersAnimated:1];
}

void __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained _dismissPresentedViewControllersAnimated:1];
}

- (void)dashboardItemManager:(id)a3 didUpdateContext:(id)a4
{
  id v5 = a4;
  [(HUDashboardViewController *)self _updateBadgeCountForHomeButton];
  [(HUDashboardViewController *)self _updateBarButtons];
  [(HUDashboardViewController *)self _updateTabBarVisibility];
  [(HUDashboardViewController *)self _updateFilterBarVisibility];
  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
  char v6 = [(HUDashboardViewController *)self wallpaperView];
  id v7 = [(HUDashboardViewController *)self context];
  id v8 = [v7 room];
  if (v8)
  {
    id v9 = (id)[v6 refreshWallpaperForHomeKitObject:v8 withAnimation:1];
  }
  else
  {
    id v10 = [(HUDashboardViewController *)self context];
    char v11 = [v10 home];
    id v12 = (id)[v6 refreshWallpaperForHomeKitObject:v11 withAnimation:1];
  }
  [(HUDashboardViewController *)self _showNoHomeAccessViewsIfNeeded];
  id v13 = [(HUDashboardViewController *)self navigationHomeButton];
  objc_super v14 = +[HUNavigationMenuFactory homeMenuForButton:v13];
  id v15 = [(HUDashboardViewController *)self navigationHomeButton];
  [v15 setMenu:v14];

  id v16 = [v5 home];

  int v17 = objc_msgSend(v16, "hf_shouldBlockCurrentRestrictedGuestFromHome");
  BOOL v18 = [(HUDashboardViewController *)self _isShowingRestrictedGuestBlockedBackdropView];
  if (v17)
  {
    if (!v18)
    {
      [(HUDashboardViewController *)self createRestrictedGuestBlockedBackdropViewIfNeeded];
      BOOL v19 = [(HUDashboardViewController *)self view];
      int v20 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
      id v21 = [(HUDashboardViewController *)self wallpaperView];
      [v19 insertSubview:v20 above:v21];

LABEL_9:
    }
  }
  else if (v18)
  {
    BOOL v19 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    [v19 removeFromSuperview];
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v23 = [(HUDashboardViewController *)self context];
    uint64_t v22 = +[HUSideBarSelectionManager sharedManager];
    [v22 setCurrentContext:v23];
  }
}

uint64_t __46__HUDashboardViewController_hu_preloadContent__block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)accessoryTileSizeButtonTappedFor:(id)a3 withItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    objc_super v14 = self;
    __int16 v15 = 2080;
    id v16 = "-[HUDashboardViewController accessoryTileSizeButtonTappedFor:withItem:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped tile size button for cell %@ with item %@", (uint8_t *)&v13, 0x2Au);
  }

  id v9 = v7;
  id v10 = &unk_1F1A3D190;
  if ([v9 conformsToProtocol:v10]) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;

  if (v12) {
    [(HUDashboardViewController *)self _toggleSizeForCell:v6 withItem:v12];
  }
}

- (id)_titleForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v6 = [v5 sectionIndexForDisplayedSectionIdentifier:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(HUItemCollectionViewController *)self itemManager];
    id v7 = [v8 titleForSection:v6];
  }

  return v7;
}

- (void)_presentDetailsViewControllerForSectionWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  objc_opt_class();
  id v7 = [(HUDashboardViewController *)self navigationController];
  id v8 = [v7 parentViewController];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  char v11 = [v10 view];

  id v12 = [v11 subviews];
  int v13 = objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_403);

  [v13 setDisableWallpaperUpdate:1];
  if ([v27 isEqualToString:@"camerasSection"])
  {
    objc_super v14 = [(HUDashboardViewController *)self _titleForSectionIdentifier:v27];
    __int16 v15 = [(HUDashboardViewController *)self _dashboardNavigator];
    id v16 = [(HUDashboardViewController *)self context];
    __int16 v17 = [v16 home];
    id v18 = (id)[v15 showCamerasSectionWithTitle:v14 forHome:v17 animated:v4];
  }
  else
  {
    if (![v27 isEqualToString:@"SpeakersAndTVsSection"])
    {
      id v20 = [(HUDashboardViewController *)self context];
      uint64_t v21 = [v20 home];
      objc_super v14 = HURoomForDashboardSectionIdentifier(v27, v21);

      if (v14)
      {
        __int16 v15 = [(HUDashboardViewController *)self _dashboardNavigator];
        id v22 = (id)[v15 showRoom:v14 animated:v4];
      }
      else
      {
        if ([v27 isEqualToString:@"scenesSection"])
        {
          __int16 v15 = [(HUDashboardViewController *)self _titleForSectionIdentifier:v27];
          id v23 = [(HUDashboardViewController *)self _dashboardNavigator];
          id v24 = [(HUDashboardViewController *)self context];
          uint64_t v25 = [v24 home];
          id v26 = (id)[v23 showScenesSectionWithDashboardTitle:v15 forHome:v25 animated:v4];
        }
        else
        {
          __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"HUDashboardViewController.m", 1712, @"%@ Unhandled presentation for section with identifier: %@", self, v27 object file lineNumber description];
        }
        objc_super v14 = 0;
      }
      goto LABEL_9;
    }
    objc_super v14 = [(HUDashboardViewController *)self _titleForSectionIdentifier:v27];
    __int16 v15 = [(HUDashboardViewController *)self _dashboardNavigator];
    id v16 = [(HUDashboardViewController *)self context];
    __int16 v17 = [v16 home];
    id v19 = (id)[v15 showSpeakersAndTVsSectionWithTitle:v14 forHome:v17 animated:v4];
  }

LABEL_9:
}

uint64_t __92__HUDashboardViewController__presentDetailsViewControllerForSectionWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_itemForHomeKitObject:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v6 = [v5 matchingItemForHomeKitObject:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(HUItemCollectionViewController *)self itemManager];
    id v8 = [v9 buildItemForHomeKitObject:v4];
  }
  id v10 = v8;
  char v11 = &unk_1F19E4798;
  if ([v10 conformsToProtocol:v11]) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v14 = v13;
  __int16 v15 = &unk_1F19E4850;
  if ([v14 conformsToProtocol:v15]) {
    id v16 = v14;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    id v18 = [(HUDashboardViewController *)self context];
    id v19 = [v18 home];
    id v20 = objc_msgSend(v19, "hf_characteristicValueManager");

    id v21 = v17;
    id v22 = &unk_1F1A3D558;
    if ([v21 conformsToProtocol:v22]) {
      id v23 = v21;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    if (v24)
    {
      uint64_t v25 = [v24 valueSource];

      if (v25)
      {
        uint64_t v26 = [v24 valueSource];

        id v20 = (void *)v26;
      }
    }
    id v27 = [MEMORY[0x1E4F695D8] policyWithDecision:0];
    [v20 beginTransactionWithReason:@"HUDashboardViewControllerTransactionReasonDisableReads" readPolicy:v27 logger:0];

    uint64_t v36 = *MEMORY[0x1E4F68720];
    uint64_t v37 = MEMORY[0x1E4F1CC38];
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    BOOL v29 = [v21 updateWithOptions:v28];

    [v20 commitTransactionWithReason:@"HUDashboardViewControllerTransactionReasonDisableReads"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __51__HUDashboardViewController__itemForHomeKitObject___block_invoke;
    v34[3] = &unk_1E6388A88;
    id v35 = v21;
    id v30 = [v29 flatMap:v34];
  }
  else
  {
    uint64_t v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = self;
      __int16 v40 = 2112;
      id v41 = v4;
      _os_log_error_impl(&dword_1BE345000, v31, OS_LOG_TYPE_ERROR, "%@ Failed to find item for HomeKit object: %@", buf, 0x16u);
    }

    uint64_t v32 = (void *)MEMORY[0x1E4F7A0D8];
    id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v30 = [v32 futureWithError:v20];
  }

  return v30;
}

uint64_t __51__HUDashboardViewController__itemForHomeKitObject___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)_presentAccessorySettingsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id v10 = [(HUDashboardViewController *)self _itemForHomeKitObject:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke;
  v14[3] = &unk_1E6390378;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a5;
  id v11 = v9;
  id v15 = v11;
  id v12 = [v10 flatMap:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

id __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained _dismissPresentedViewControllersAnimated:*(unsigned __int8 *)(a1 + 48)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke_2;
  v9[3] = &unk_1E638C7B8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v6 = v3;
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v7 = [v5 flatMap:v9];

  objc_destroyWeak(&v12);

  return v7;
}

id __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412802;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Presenting accessory settings for item: %@ from status item: %@", (uint8_t *)&v8, 0x20u);
  }

  id v6 = [WeakRetained presentAccessorySettingsForItem:*(void *)(a1 + 32)];

  return v6;
}

- (id)_presentAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
  uint64_t v11 = [v10 presentationContext];
  __int16 v12 = [v11 item];
  if ([v12 conformsToProtocol:&unk_1F19E4798]) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  if (!v14) {
    goto LABEL_7;
  }
  id v15 = [v14 homeKitObject];
  id v16 = [v15 uniqueIdentifier];
  BOOL v17 = [v8 uniqueIdentifier];
  int v18 = [v16 isEqual:v17];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    id v20 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    id v21 = [v20 cardViewController];
    id v22 = [v19 futureWithResult:v21];
  }
  else
  {
LABEL_7:
    objc_initWeak(&location, self);
    id v23 = [(HUDashboardViewController *)self _itemForHomeKitObject:v8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke;
    v25[3] = &unk_1E6390378;
    objc_copyWeak(&v27, &location);
    BOOL v28 = a5;
    id v26 = v9;
    id v22 = [v23 flatMap:v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v22;
}

id __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained _dismissPresentedViewControllersAnimated:*(unsigned __int8 *)(a1 + 48)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke_2;
  v9[3] = &unk_1E63903A0;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v6 = v3;
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 48);
  id v7 = [v5 flatMap:v9];

  objc_destroyWeak(&v12);

  return v7;
}

id __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_opt_new();
  [v3 setItem:*(void *)(a1 + 32)];
  uint64_t v4 = [WeakRetained itemManager];
  uint64_t v5 = [v4 home];
  [v3 setHome:v5];

  id v6 = [WeakRetained itemManager];
  id v7 = [v6 childItemsForItem:*(void *)(a1 + 32) ofClass:objc_opt_class()];
  [v3 setControlItems:v7];

  [v3 setPrefersSystemTransitions:1];
  uint64_t v8 = [WeakRetained navigationController];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (id)v8;
  }
  else {
    id v10 = WeakRetained;
  }
  [v3 setSourceViewController:v10];

  id v11 = [WeakRetained context];
  id v12 = [v11 room];
  [v3 setShouldIncludeRoomNameInHeaderTitle:v12 == 0];

  char v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    int v19 = 138412802;
    id v20 = WeakRetained;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@ Presenting quick controls for item: %@ from status item: %@", (uint8_t *)&v19, 0x20u);
  }

  id v16 = [WeakRetained quickControlPresentationCoordinator];
  BOOL v17 = [v16 presentQuickControlWithContext:v3 animated:*(unsigned __int8 *)(a1 + 56)];

  return v17;
}

- (id)_dismissPresentedViewControllersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
  id v6 = [v5 dismissQuickControlAnimated:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HUDashboardViewController__dismissPresentedViewControllersAnimated___block_invoke;
  v9[3] = &unk_1E63903C8;
  objc_copyWeak(&v10, &location);
  BOOL v11 = v3;
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

id __70__HUDashboardViewController__dismissPresentedViewControllersAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = objc_msgSend(WeakRetained, "hu_dismissViewControllerAnimated:", *(unsigned __int8 *)(a1 + 40));

  return v3;
}

- (BOOL)_shouldShowAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:3];
  uint64_t v6 = objc_opt_class();

  LOBYTE(v6) = objc_msgSend(v5, "containsObject:", v6, v8, v9);
  return v6 ^ 1;
}

- (BOOL)_canSkipStatusDetailsForItem:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  if ([v5 containsObject:objc_opt_class()]) {
    LOBYTE(v6) = 0;
  }
  else {
    BOOL v6 = ![(HUDashboardViewController *)self _statusItemRepresentsOnlyResidentIPads:v4];
  }

  return v6;
}

- (BOOL)_statusItemRepresentsOnlyResidentIPads:(id)a3
{
  BOOL v3 = [a3 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];

  LOBYTE(v3) = objc_msgSend(v4, "na_all:", &__block_literal_global_423);
  return (char)v3;
}

BOOL __68__HUDashboardViewController__statusItemRepresentsOnlyResidentIPads___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    BOOL v6 = objc_msgSend(v5, "hf_linkedAccessory");
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)createRestrictedGuestBlockedBackdropViewIfNeeded
{
  id v3 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    id v5 = [MEMORY[0x1E4F427D8] effectWithStyle:18];
    BOOL v6 = (void *)[v4 initWithEffect:v5];
    [(HUDashboardViewController *)self setRestrictedGuestBlockedBackdropView:v6];

    BOOL v7 = [(HUDashboardViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    BOOL v17 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:1];

    id v18 = [(HUDashboardViewController *)self restrictedGuestBlockedBackdropView];
    [v18 setAutoresizingMask:18];
  }
}

- (void)_setUpTabBar
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = objc_msgSend(MEMORY[0x1E4F43020], "hu_dashboardBarEffects");
  [v3 setBackgroundEffects:v4];

  uint64_t v24 = *MEMORY[0x1E4F42510];
  uint64_t v5 = v24;
  BOOL v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v25[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  double v8 = [v3 stackedLayoutAppearance];
  double v9 = [v8 selected];
  [v9 setTitleTextAttributes:v7];

  double v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  double v11 = [v3 stackedLayoutAppearance];
  double v12 = [v11 selected];
  [v12 setIconColor:v10];

  uint64_t v22 = v5;
  double v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
  __int16 v23 = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  double v15 = [v3 stackedLayoutAppearance];
  id v16 = [v15 normal];
  [v16 setTitleTextAttributes:v14];

  BOOL v17 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
  id v18 = [v3 stackedLayoutAppearance];
  int v19 = [v18 normal];
  [v19 setIconColor:v17];

  id v20 = [(HUDashboardViewController *)self tabBarItem];
  [v20 setStandardAppearance:v3];

  __int16 v21 = [(HUDashboardViewController *)self tabBarItem];
  [v21 setScrollEdgeAppearance:v3];
}

- (void)_handleBackgroundTap:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    double v9 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped background", (uint8_t *)&v8, 0xCu);
  }

  if ([MEMORY[0x1E4F69138] isHomeControlService])
  {
    uint64_t v5 = [(HUDashboardViewController *)self parentViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
LABEL_7:

    return;
  }
  if ([(HUDashboardViewController *)self isOverlay])
  {
    uint64_t v5 = [(HUDashboardViewController *)self navigationController];
    id v6 = (id)[v5 popToRootViewControllerAnimated:1];
    goto LABEL_7;
  }
  BOOL v7 = [(HUDashboardViewController *)self itemShowingSizeToggleButton];

  if (v7) {
    [(HUDashboardViewController *)self setItemShowingSizeToggleButton:0 animated:1];
  }
}

- (void)_toggleSizeForCell:(id)a3 withItem:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 accessoryRepresentableObject];
  double v9 = [(HUDashboardViewController *)self layoutManager];
  uint64_t v10 = [v9 gridSizeForItem:v7];
  uint64_t v12 = v11;

  BOOL v13 = v12 <= 1 || v10 <= 1;
  double v14 = (void *)MEMORY[0x1E4F68D78];
  if (v13) {
    double v14 = (void *)MEMORY[0x1E4F68D70];
  }
  id v15 = (id)objc_msgSend(v8, "hf_setTileSize:", *v14);
  id v16 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __57__HUDashboardViewController__toggleSizeForCell_withItem___block_invoke;
  __int16 v23 = &unk_1E63850E0;
  id v24 = v6;
  uint64_t v25 = self;
  id v17 = v6;
  [v16 animateWithDuration:&v20 animations:0.3];
  id v18 = [(HUItemCollectionViewController *)self itemManager];
  v26[0] = v7;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v18 reconfigureUIRepresentationForItems:v19 withAnimation:1];
}

void __57__HUDashboardViewController__toggleSizeForCell_withItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSizeChangeButton];
  id v2 = [*(id *)(a1 + 40) collectionView];
  id v3 = [v2 collectionViewLayout];
  [v3 invalidateLayout];

  id v4 = [*(id *)(a1 + 40) collectionView];
  [v4 layoutIfNeeded];
}

- (void)_updateAllHeaderViews
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUDashboardViewController *)self collectionView];
  uint64_t v4 = *MEMORY[0x1E4F43758];
  uint64_t v5 = [v3 indexPathsForVisibleSupplementaryElementsOfKind:*MEMORY[0x1E4F43758]];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        uint64_t v11 = [(HUDashboardViewController *)self collectionView];
        uint64_t v12 = [v11 supplementaryViewForElementKind:v4 atIndexPath:v10];

        objc_opt_class();
        id v13 = v12;
        if (objc_opt_isKindOfClass()) {
          double v14 = v13;
        }
        else {
          double v14 = 0;
        }
        id v15 = v14;

        if (v15) {
          [(HUDashboardViewController *)self _updateHeaderView:v15 atIndexPath:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)migrationUpdatedTileSize:(id)a3
{
}

- (void)bannerSizeUpdated:(id)a3
{
}

- (void)applicationWentIntoBackground:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v15 = [(HUDashboardViewController *)self context];
  uint64_t v4 = [v15 accessoryTypeGroup];
  uint64_t v5 = [MEMORY[0x1E4F68EA0] energyAccessoryTypeGroup];
  if (v4 == v5)
  {
    uint64_t v6 = [(HUDashboardViewController *)self energyCategoryViewStartTime];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = [(HUDashboardViewController *)self energyCategoryViewStartTime];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;

      uint64_t v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v18 = v10;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Energy Category view duration:%f [s]", buf, 0xCu);
      }

      [(HUDashboardViewController *)self setEnergyCategoryViewStartTime:0];
      if (v10 > 1.0)
      {
        uint64_t v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        id v13 = [v12 allHomesFuture];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __59__HUDashboardViewController_applicationWentIntoBackground___block_invoke;
        v16[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
        *(double *)&void v16[4] = v10;
        id v14 = (id)[v13 addCompletionBlock:v16];
      }
    }
  }
  else
  {
  }
}

void __59__HUDashboardViewController_applicationWentIntoBackground___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "accessories", (void)v10);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  +[HUEnergyAnalytics saveViewDurationEvent:47 withDuration:v9 withUserHasAccessories:v4];
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUDashboardViewController *)self context];
  uint64_t v5 = [v4 accessoryTypeGroup];
  uint64_t v6 = [MEMORY[0x1E4F68EA0] energyAccessoryTypeGroup];

  if (v5 == v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [(HUDashboardViewController *)self setEnergyCategoryViewStartTime:v7];
  }
  uint64_t v8 = [(HUDashboardViewController *)self context];
  double v9 = [v8 home];

  if (v9)
  {
    long long v10 = [HUHomeEnergyManagerHelper alloc];
    long long v11 = [(HUDashboardViewController *)self context];
    long long v12 = [v11 home];
    long long v13 = [(HUHomeEnergyManagerHelper *)v10 initWithHome:v12];

    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v17 = self;
      __int16 v18 = 2080;
      uint64_t v19 = "-[HUDashboardViewController applicationWillEnterForeground:]";
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@ %s Updating Home Location", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__HUDashboardViewController_applicationWillEnterForeground___block_invoke;
    v15[3] = &unk_1E6386018;
    v15[4] = self;
    [v13 updateHomeLocationWithCompletionHandler:v15];
  }
  else
  {
    long long v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v17 = self;
      __int16 v18 = 2080;
      uint64_t v19 = "-[HUDashboardViewController applicationWillEnterForeground:]";
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
    }
  }
}

void __60__HUDashboardViewController_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2080;
    uint64_t v7 = "-[HUDashboardViewController applicationWillEnterForeground:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@ %s Updated Home Location", (uint8_t *)&v4, 0x16u);
  }
}

- (HUDashboardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUDashboardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (HUAccessoryControlAnimator)accessoryControlAnimator
{
  return self->_accessoryControlAnimator;
}

- (void)setAccessoryControlAnimator:(id)a3
{
}

- (void)setViewFullyVisibleFuture:(id)a3
{
}

- (HFAccessoryRepresentableItem)itemShowingSizeToggleButton
{
  return self->_itemShowingSizeToggleButton;
}

- (void)setWallpaperView:(id)a3
{
}

- (void)setHomeUpgradedToRoarView:(id)a3
{
}

- (UIVisualEffectView)roarBackdropView
{
  return self->_roarBackdropView;
}

- (void)setRoarBackdropView:(id)a3
{
}

- (NSArray)upgradeViewConstraints
{
  return self->_upgradeViewConstraints;
}

- (void)setUpgradeViewConstraints:(id)a3
{
}

- (void)setRestrictedGuestBlockedBackdropView:(id)a3
{
}

- (NSDate)energyCategoryViewStartTime
{
  return self->_energyCategoryViewStartTime;
}

- (void)setEnergyCategoryViewStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyCategoryViewStartTime, 0);
  objc_storeStrong((id *)&self->_cameraItemModuleController, 0);
  objc_storeStrong((id *)&self->_bannerItemModuleController, 0);
  objc_storeStrong((id *)&self->_restrictedGuestBlockedBackdropView, 0);
  objc_storeStrong((id *)&self->_upgradeViewConstraints, 0);
  objc_storeStrong((id *)&self->_roarBackdropView, 0);
  objc_storeStrong((id *)&self->_homeUpgradedToRoarView, 0);
  objc_storeStrong((id *)&self->_blurGroupingEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_itemShowingSizeToggleButton, 0);
  objc_storeStrong((id *)&self->_navigationEditDoneButton, 0);
  objc_storeStrong((id *)&self->_navigationHomeButton, 0);
  objc_storeStrong((id *)&self->_navigationAnnounceButton, 0);
  objc_storeStrong((id *)&self->_navigationAddButton, 0);
  objc_storeStrong((id *)&self->_viewFullyVisibleFuture, 0);
  objc_storeStrong((id *)&self->_energyIndicatorViewController, 0);
  objc_storeStrong(&self->_tipsObserver, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong((id *)&self->_viewFirstTimeFullyVisibleFuture, 0);
  objc_storeStrong((id *)&self->_accessoryControlAnimator, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemCollectionViewController *)self itemManager];
  __int16 v6 = [v5 matchingItemForHomeKitObject:v4];

  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v7 = v4;
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;

      uint64_t v10 = objc_msgSend(v9, "hf_primaryService");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_13:
        uint64_t v15 = [(HUItemCollectionViewController *)self itemManager];
        __int16 v6 = [v15 buildItemForHomeKitObject:v4];

        goto LABEL_14;
      }
      objc_opt_class();
      id v11 = v4;
      if (objc_opt_isKindOfClass()) {
        long long v12 = v11;
      }
      else {
        long long v12 = 0;
      }
      id v9 = v12;

      uint64_t v10 = [v9 accessory];
    }
    long long v13 = (void *)v10;
    id v14 = [(HUItemCollectionViewController *)self itemManager];
    __int16 v6 = [v14 matchingItemForHomeKitObject:v13];

    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (id)presentHomeKitObject:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(HUDashboardViewController *)self matchingItemForHomeKitObject:a3];
  if (!v8)
  {
LABEL_22:
    id v9 = [(HUDashboardViewController *)self hu_preloadContent];
    uint64_t v10 = [v9 flatMap:&__block_literal_global_713];
    goto LABEL_23;
  }
  id v9 = [(HUItemCollectionViewController *)self moduleControllerForItem:v8];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v10 = [v9 presentItem:v8 destination:a4 animated:v5];
    goto LABEL_23;
  }

  if ([v8 conformsToProtocol:&unk_1F1A3D558])
  {
    id v11 = v8;
    long long v12 = v11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    id v13 = v8;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    long long v12 = [v15 sourceItem];

    id v11 = v12;
  }
  if ([v11 conformsToProtocol:&unk_1F1A3D558]) {
    id v16 = v12;
  }
  else {
    id v16 = 0;
  }
  id v9 = v16;

LABEL_17:
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_20;
    case 1uLL:
    case 3uLL:
      if (v9)
      {
        uint64_t v10 = [(HUDashboardViewController *)self presentDetailsForItem:v9 animated:1 secondaryDestination:a4];
      }
      else
      {
LABEL_20:
        uint64_t v10 = [(HUDashboardViewController *)self presentItem:v8 animated:1];
      }
      break;
    default:

      goto LABEL_22;
  }
LABEL_23:
  long long v17 = (void *)v10;

  return v17;
}

id __96__HUDashboardViewController_HomeKitObjectPresenting__presentHomeKitObject_destination_animated___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F7A0D8];
  id v1 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
  id v2 = [v0 futureWithError:v1];

  return v2;
}

- (id)presentItemWithUUID:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  uint64_t v11 = 1;
  if ((uint64_t)a4 <= 6)
  {
    if (a4 == 4) {
      goto LABEL_9;
    }
    if (a4 == 6)
    {
      uint64_t v11 = 3;
      goto LABEL_9;
    }
  }
  else
  {
    if (a4 == 29 || a4 == 21) {
      goto LABEL_9;
    }
    if (a4 == 7)
    {
      uint64_t v11 = 2;
LABEL_9:
      long long v12 = [(HUDashboardViewController *)self _dismissPresentedViewControllersAnimated:v6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke;
      v17[3] = &unk_1E6390458;
      v17[4] = self;
      BOOL v21 = (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
      id v18 = v10;
      unint64_t v19 = a5;
      BOOL v22 = v6;
      uint64_t v20 = v11;
      id v13 = [v12 flatMap:v17];

      goto LABEL_10;
    }
  }
  id v15 = (void *)MEMORY[0x1E4F7A0D8];
  id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 38);
  id v13 = [v15 futureWithError:v16];

LABEL_10:

  return v13;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anim"
          "ated:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%s dismissPresentedViewControllersAnimated future completed", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) homeKitObjectWithID:*(void *)(a1 + 40)];
  if (![*(id *)(a1 + 32) shouldShowAccessoryControlForHomeKitObject:v3]) {
    goto LABEL_9;
  }
  id v4 = [*(id *)(a1 + 32) matchingItemForHomeKitObject:v3];
  BOOL v5 = v4;
  if (!*(unsigned char *)(a1 + 64) || !v4)
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      uint64_t v6 = [*(id *)(a1 + 32) presentHomeKitObject:v3 destination:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 65)];
      goto LABEL_11;
    }

LABEL_9:
    BOOL v5 = [*(id *)(a1 + 32) quickControlPresentationContextForUUID:*(void *)(a1 + 40) type:*(void *)(a1 + 56)];
    id v7 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
    uint64_t v8 = [v7 presentQuickControlWithContext:v5 animated:*(unsigned __int8 *)(a1 + 65)];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_714;
    void v11[3] = &__block_descriptor_42_e18___NAFuture_16__0_8l;
    __int16 v12 = *(_WORD *)(a1 + 64);
    v11[4] = *(void *)(a1 + 48);
    id v9 = [v8 flatMap:v11];

    goto LABEL_12;
  }
  uint64_t v6 = [*(id *)(a1 + 32) presentAccessorySettingsForItem:v4 secondaryDestination:*(void *)(a1 + 48)];
LABEL_11:
  id v9 = (void *)v6;
LABEL_12:

  return v9;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_714(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v22 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anim"
          "ated:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s presentQuickControlWithContext future completed", buf, 0xCu);
  }

  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  uint64_t v8 = [v7 topViewController];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];
  if (*(unsigned char *)(a1 + 40))
  {
    __int16 v12 = [v10 viewControllerReadyFuture];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_716;
    v17[3] = &unk_1E6390410;
    id v13 = v10;
    char v20 = *(unsigned char *)(a1 + 41);
    uint64_t v14 = *(void *)(a1 + 32);
    id v18 = v13;
    uint64_t v19 = v14;
    uint64_t v15 = [v12 flatMap:v17];

    uint64_t v11 = (void *)v15;
  }

  return v11;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_716(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anima"
         "ted:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%s viewControllerReady future completed", buf, 0xCu);
  }

  [*(id *)(a1 + 32) scrollToDetailsViewAnimated:*(unsigned __int8 *)(a1 + 48)];
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  if (*(void *)(a1 + 40) == 3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_717;
    v6[3] = &unk_1E6385108;
    id v7 = *(id *)(a1 + 32);
    id v4 = [v3 futureWithBlock:v6];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  }

  return v4;
}

void __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_717(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_2;
  v6[3] = &unk_1E63850E0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], v6);
}

void __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) settingsViewController];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v5 = v3;

  id v4 = (id)[v5 showConnectedEcosystems];
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 32)];
}

- (id)presentCameraProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(HUDashboardViewController *)self cameraItemModuleController];
  uint64_t v14 = [v13 presentCameraPlayerViewControllerForHomeKitObject:v12 startDate:v11 endDate:v10 animated:v6];

  return v14;
}

- (id)presentCameraProfile:(id)a3 forCameraClip:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HUDashboardViewController *)self cameraItemModuleController];
  id v11 = [v10 presentCameraPlayerViewControllerForHomeKitObject:v9 cameraClip:v8 animated:v5];

  return v11;
}

- (id)presentFeedbackFlowForCameraClip:(id)a3 fromProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUDashboardViewController *)self cameraItemModuleController];
  id v9 = [v8 presentFeedbackFlowForCameraClip:v7 fromProfile:v6];

  return v9;
}

- (id)presentStatusDetailsForStatusItemClass:(Class)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v7 = NSStringFromClass(a3);
    NSLog(&cfstr_InvalidStatusI.isa, v7);
  }
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 allItems];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __102__HUDashboardViewController_HomeKitObjectPresenting__presentStatusDetailsForStatusItemClass_animated___block_invoke;
  v24[3] = &__block_descriptor_40_e16_B16__0__HFItem_8lu32l8;
  v24[4] = a3;
  id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v24);

  if (v10)
  {
    id v11 = objc_opt_new();
    [v11 setItem:v10];
    id v12 = [(HUItemCollectionViewController *)self itemManager];
    id v13 = [v12 home];
    [v11 setHome:v13];

    [v11 setPrefersSystemTransitions:1];
    uint64_t v14 = [(HUDashboardViewController *)self navigationController];
    uint64_t v15 = (void *)v14;
    if (v14) {
      id v16 = (HUDashboardViewController *)v14;
    }
    else {
      id v16 = self;
    }
    [v11 setSourceViewController:v16];

    long long v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = self;
      __int16 v27 = 2112;
      BOOL v28 = v10;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@ Presenting status details for status item: %@", buf, 0x16u);
    }

    id v18 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    uint64_t v19 = [v18 presentQuickControlWithContext:v11 animated:v4];
  }
  else
  {
    char v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138412546;
      id v26 = self;
      __int16 v27 = 2112;
      BOOL v28 = v23;
      _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "%@ Failed to find status item of class: %@", buf, 0x16u);
    }
    BOOL v21 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    uint64_t v19 = [v21 futureWithError:v11];
  }

  return v19;
}

uint64_t __102__HUDashboardViewController_HomeKitObjectPresenting__presentStatusDetailsForStatusItemClass_animated___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)presentItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(HUControllableItemCollectionViewController *)self shouldShowAccessoryControlForItem:v6])
  {
    id v7 = [(HUControllableItemCollectionViewController *)self presentAccessoryControlsForItem:v6];
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v9 = v6;
    if ([v9 conformsToProtocol:&unk_1F19E4798]) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    id v12 = v11;
    if ([v12 conformsToProtocol:&unk_1F19E4850]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14) {
      [(HUDashboardViewController *)self _presentQuickControlsForHomeKitItem:v14 animated:v4];
    }
    else {
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }

  return v8;
}

- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4
{
  return [(HUDashboardViewController *)self presentDetailsForItem:a3 animated:a4 secondaryDestination:0];
}

- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4 secondaryDestination:(unint64_t)a5
{
  id v8 = a3;
  if ([(HUControllableItemCollectionViewController *)self shouldShowAccessoryControlForItem:v8])
  {
    id v9 = [(HUControllableItemCollectionViewController *)self presentAccessorySettingsForItem:v8 secondaryDestination:a5];
  }
  else
  {
    id v10 = [(HUDashboardViewController *)self _presentQuickControlsForHomeKitItem:v8 animated:0];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke;
    v12[3] = &__block_descriptor_33_e42___NAFuture_16__0__UINavigationController_8l;
    BOOL v13 = a4;
    id v9 = [v10 flatMap:v12];
  }

  return v9;
}

id __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke_2;
  void v8[3] = &unk_1E6388DB0;
  id v9 = v3;
  char v10 = *(unsigned char *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 futureWithBlock:v8];

  return v6;
}

void __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  BOOL v4 = [*(id *)(a1 + 32) topViewController];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v7 = v5;

  [v7 scrollToDetailsViewAnimated:*(unsigned __int8 *)(a1 + 40)];
  id v6 = [v7 settingsViewController];
  [v3 finishWithResult:v6];
}

- (id)_presentQuickControlsForHomeKitItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(location, self);
  if ([(HUControllableItemCollectionViewController *)self shouldShowAccessoryControlForItem:v6])
  {
    id v7 = [(HUDashboardViewController *)self _dismissPresentedViewControllersAnimated:v4];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke;
    v39[3] = &unk_1E638B0E0;
    objc_copyWeak(&v41, location);
    id v40 = v6;
    id v8 = [v7 flatMap:v39];

    objc_destroyWeak(&v41);
    goto LABEL_19;
  }
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = [v9 indexPathForItem:v6];

  if (v7)
  {
    char v10 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
    id v11 = [v10 presentationContext];
    id v12 = [v11 item];

    if (v12)
    {
      BOOL v13 = &unk_1F19E4798;
      id v14 = v12;
      int v15 = [v14 conformsToProtocol:v13];
      if (v15) {
        id v16 = v14;
      }
      else {
        id v16 = 0;
      }
      char v17 = v15 ^ 1;
      id v18 = v16;

      if (v6) {
        char v19 = v17;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0)
      {
        id v30 = [v18 homeKitObject];
        char v20 = [v30 uniqueIdentifier];
        BOOL v21 = [v6 homeKitObject];
        BOOL v22 = [v21 uniqueIdentifier];
        int v23 = [v20 isEqual:v22];

        if (v23)
        {
          id v24 = (void *)MEMORY[0x1E4F7A0D8];
          uint64_t v25 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
          id v26 = [v25 cardViewController];
          id v8 = [v24 futureWithResult:v26];

LABEL_17:
          goto LABEL_18;
        }
      }
    }
    id v18 = [(HUDashboardViewController *)self _dismissPresentedViewControllersAnimated:v4];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_3;
    v31[3] = &unk_1E63903A0;
    objc_copyWeak(&v34, location);
    id v32 = v7;
    id v33 = v6;
    BOOL v35 = v4;
    id v8 = [v18 flatMap:v31];

    objc_destroyWeak(&v34);
    goto LABEL_17;
  }
  __int16 v27 = [v6 homeKitObject];
  id v8 = [(HUDashboardViewController *)self _presentAccessoryControlsForHomeKitObject:v27 fromStatusItem:0 animated:1];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_2;
  v36[3] = &unk_1E6385A20;
  uint64_t v37 = 0;
  id v38 = v6;
  id v28 = (id)[v8 addFailureBlock:v36];

  id v12 = v37;
LABEL_18:

LABEL_19:
  objc_destroyWeak(location);

  return v8;
}

id __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained presentAccessoryControlsForItem:*(void *)(a1 + 32)];

  return v3;
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    NSLog(&cfstr_PresentingANon.isa, *(void *)(a1 + 40));
  }
}

id __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained collectionView];
  BOOL v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 32)];

  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v6 = (void *)MEMORY[0x1E4F42FF0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_4;
  v17[3] = &unk_1E6386340;
  void v17[4] = WeakRetained;
  id v18 = v4;
  id v19 = *(id *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_5;
  v12[3] = &unk_1E63904C0;
  void v12[4] = WeakRetained;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  char v16 = *(unsigned char *)(a1 + 56);
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 animateWithDuration:v17 animations:v12 completion:0.0];
  id v9 = v15;
  id v10 = v7;

  return v10;
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = [v2 visibleCells];
  char v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) collectionView];
    [v5 scrollToItemAtIndexPath:*(void *)(a1 + 48) atScrollPosition:2 animated:0];
  }
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quickControlPresentationContextForItem:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) collectionView];
  char v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 48)];
  if ([v4 conformsToProtocol:&unk_1F19E3E20]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
  [v7 setPressedTile:v6];

  id v8 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
  id v9 = [v8 presentQuickControlWithContext:v2 animated:*(unsigned __int8 *)(a1 + 64)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_6;
  void v11[3] = &unk_1E63850B8;
  id v12 = *(id *)(a1 + 56);
  id v10 = (id)[v9 addCompletionBlock:v11];
}

uint64_t __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v4 = [(HUDashboardViewController *)self context];
  id v5 = [v4 home];

  if (v5)
  {
    id v6 = [HUHomeEnergyManagerHelper alloc];
    id v7 = [(HUDashboardViewController *)self context];
    id v8 = [v7 home];
    id v10 = [(HUHomeEnergyManagerHelper *)v6 initWithHome:v8];

    [(HUHomeEnergyManagerHelper *)v10 updateHomeEnergyAvailableFeaturesWithCompletionHandler:&__block_literal_global_794];
  }
  else
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = self;
      __int16 v13 = 2080;
      id v14 = "-[HUDashboardViewController(Observer) homeManagerDidUpdateHomes:]";
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
    }
  }
}

void __65__HUDashboardViewController_Observer__homeManagerDidUpdateHomes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a3;
  id v5 = [v3 sharedHandler];
  [v5 handleError:v4];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  [(HUDashboardViewController *)self _updateBarButtons];

  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  [(HUDashboardViewController *)self _updateBarButtons];

  [(HUDashboardViewController *)self _updateHomeEnergyIndicatorVisibility];
}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138413058;
    __int16 v13 = self;
    __int16 v14 = 2080;
    uint64_t v15 = "-[HUDashboardViewController(Observer) home:didUpdateNameForRoom:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s home %@ room %@", (uint8_t *)&v12, 0x2Au);
  }

  objc_opt_class();
  id v9 = [(HUItemCollectionViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  [v11 updateItemSectionHeaderTitleForRoom:v7];
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(HUDashboardViewController *)self context];
  id v8 = [v7 room];
  id v9 = [v8 uniqueIdentifier];
  id v10 = [v6 uniqueIdentifier];

  if (objc_msgSend(v9, "hmf_isEqualToUUID:", v10))
  {
    BOOL v11 = [(HUDashboardViewController *)self viewIsFullyVisible];

    if (!v11) {
      goto LABEL_6;
    }
    id v7 = [(HUDashboardViewController *)self _dashboardNavigator];
    id v12 = (id)[v7 showHome:v13];
  }
  else
  {
  }
LABEL_6:
}

- (void)homeDidUpdateWallpaper:(id)a3
{
  id v10 = a3;
  id v4 = [(HUDashboardViewController *)self context];
  id v5 = [v4 room];
  if (v5)
  {
  }
  else
  {
    id v6 = [(HUDashboardViewController *)self context];
    id v7 = [v6 home];
    int v8 = [v7 isEqual:v10];

    if (!v8) {
      goto LABEL_6;
    }
    id v4 = [(HUDashboardViewController *)self wallpaperView];
    id v9 = (id)[v4 refreshWallpaperForHomeKitObject:v10 withAnimation:1];
  }

LABEL_6:
}

- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4
{
  id v10 = a4;
  id v5 = [(HUDashboardViewController *)self context];
  id v6 = [v5 room];
  int v7 = [v6 isEqual:v10];

  if (v7)
  {
    int v8 = [(HUDashboardViewController *)self wallpaperView];
    id v9 = (id)[v8 refreshWallpaperForHomeKitObject:v10 withAnimation:1];
  }
}

- (void)home:(id)a3 didUpdateLocation:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUDashboardViewController *)self wallpaperView];
  int v7 = [(HUDashboardViewController *)self context];
  int v8 = [v7 room];
  if (v8)
  {
    id v9 = (id)[v6 refreshWallpaperForHomeKitObject:v8 withAnimation:1];
  }
  else
  {
    id v10 = [(HUDashboardViewController *)self context];
    BOOL v11 = [v10 home];
    id v12 = (id)[v6 refreshWallpaperForHomeKitObject:v11 withAnimation:1];
  }
  id v13 = [(HUDashboardViewController *)self context];
  uint64_t v14 = [v13 home];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    __int16 v16 = [(HUDashboardViewController *)self context];
    id v17 = [v16 home];

    if (v17 == v5)
    {
      __int16 v18 = [HUHomeEnergyManagerHelper alloc];
      id v19 = [(HUDashboardViewController *)self context];
      uint64_t v20 = [v19 home];
      BOOL v21 = [(HUHomeEnergyManagerHelper *)v18 initWithHome:v20];

      BOOL v22 = HFLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = self;
        __int16 v26 = 2080;
        __int16 v27 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]";
        _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@ %s Updating Home Location", buf, 0x16u);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__HUDashboardViewController_Observer__home_didUpdateLocation___block_invoke;
      v23[3] = &unk_1E6386018;
      v23[4] = self;
      [v21 updateHomeLocationWithCompletionHandler:v23];
      goto LABEL_12;
    }
  }
  else
  {
  }
  BOOL v21 = HFLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = self;
    __int16 v26 = 2080;
    __int16 v27 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]";
    _os_log_error_impl(&dword_1BE345000, v21, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
  }
LABEL_12:
}

void __62__HUDashboardViewController_Observer__home_didUpdateLocation___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2080;
    int v7 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s Updated Home Location", (uint8_t *)&v4, 0x16u);
  }
}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  __int16 v6 = objc_msgSend(MEMORY[0x1E4F692B8], "sharedManager", a3, a4, a5);
  [v6 warmup];

  int v7 = [(HUDashboardViewController *)self cameraItemModuleController];
  id v12 = [v7 cameraController];

  uint64_t v8 = v12;
  if (v12)
  {
    id v9 = [v12 playerViewController];
    id v10 = [v9 presentingViewController];
    id v11 = (id)objc_msgSend(v10, "hu_dismissViewControllerAnimated:", 0);

    uint64_t v8 = v12;
  }
}

- (id)presentRoomSettingsForRoom:(id)a3
{
  id v4 = a3;
  if (v4
    || ([(HUDashboardViewController *)self context],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 room],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    __int16 v6 = [(HUDashboardViewController *)self _presentRoomEditorForRoom:v4];
  }
  else
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "HUDashboardViewController: room not provided for settings presentation", v9, 2u);
    }

    __int16 v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (id)_presentRoomEditorForRoom:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F69478];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v8 = [v7 home];
  id v9 = (void *)[v6 initWithExistingObject:v5 inHome:v8];

  id v10 = [[HUEditRoomViewController alloc] initWithRoomBuilder:v9 presentationDelegate:self addRoomDelegate:0];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v10];
  [v11 setModalPresentationStyle:2];
  id v12 = [(UIViewController *)self hu_presentPreloadableViewController:v11 animated:1];

  return v12;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  id v8 = a4;
  if (v8)
  {
    id v5 = [(HUDashboardViewController *)self _dashboardNavigator];
    id v6 = (id)[v5 showRoom:v8];
  }
  int v7 = [(HUDashboardViewController *)self _dashboardNavigator];
  [v7 dismissViewController];
}

- (void)homeEnergyNavigationBarIndicatorTapped:(id)a3
{
  +[HUEnergyAnalytics saveTapEvent:55 withInteractionType:1];
  id v8 = [(HUDashboardViewController *)self _dashboardNavigator];
  id v4 = [MEMORY[0x1E4F68EA0] energyAccessoryTypeGroup];
  id v5 = [(HUDashboardViewController *)self context];
  id v6 = [v5 home];
  id v7 = (id)[v8 showAccessoryTypeGroup:v4 forHome:v6 animated:1];
}

- (void)_clipToNavigationBar
{
  uint64_t v3 = [(HUDashboardViewController *)self navigationItem];
  id v21 = [v3 navigationBar];

  if (v21)
  {
    id v4 = [v21 _restingHeights];
    id v5 = [v4 firstObject];
    [v5 doubleValue];
    double v7 = v6;

    [v21 frame];
    double v9 = v7 + v8;
    id v10 = [(HUDashboardViewController *)self collectionView];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [(HUDashboardViewController *)self view];
    __int16 v16 = [v15 superview];
    [v16 frame];
    double v18 = v17 - v9;

    id v19 = [(HUDashboardViewController *)self collectionView];
    objc_msgSend(v19, "setFrame:", v12, v9, v14, v18);

    uint64_t v20 = [(HUDashboardViewController *)self collectionView];
    [v20 setClipsToBounds:1];
  }
}

void __86__HUDashboardViewController_NavigationBar__navigationBarButtonIdentifierOrderForEdge___block_invoke_4()
{
  uint64_t v0 = [MEMORY[0x1E4F1C978] array];
  id v1 = (void *)qword_1EA121548;
  qword_1EA121548 = v0;
}

- (id)_dashboardNavigator
{
  id v2 = [(HUDashboardViewController *)self navigationController];
  if ([v2 conformsToProtocol:&unk_1F1A78CD0]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 dashboardNavigator];

  return v5;
}

- (id)homeForNavigationBarButton:(id)a3
{
  uint64_t v3 = [(HUDashboardViewController *)self context];
  id v4 = [v3 home];

  return v4;
}

- (BOOL)shouldIncludeRoomsInHomeMenu
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    uint64_t v3 = [(HUDashboardViewController *)self context];
    id v4 = [v3 home];
    if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
    {
      id v5 = [(HUDashboardViewController *)self view];
      double v6 = [v5 traitCollection];
      char v7 = [v6 horizontalSizeClass] == 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = [(HUDashboardViewController *)self context];
    id v4 = [v3 home];
    if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
    {
      id v5 = [(HUDashboardViewController *)self navigationController];
      double v6 = [v5 splitViewController];
      if (v6)
      {
        double v8 = [(HUDashboardViewController *)self navigationController];
        double v9 = [v8 splitViewController];
        char v7 = [v9 isCollapsed];
      }
      else
      {
        char v7 = 1;
      }
      goto LABEL_10;
    }
  }
  char v7 = 0;
LABEL_11:

  return v7;
}

- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4
{
  id v5 = a4;
  double v6 = [(HUDashboardViewController *)self context];
  char v7 = [v6 home];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    double v9 = [(HUDashboardViewController *)self context];
    id v10 = [v9 home];
    char v11 = objc_msgSend(v10, "hf_shouldBlockCurrentUserFromHome");

    if (v11)
    {
      double v12 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_7;
    }
    double v6 = [(HUItemCollectionViewController *)self itemManager];
    char v7 = [v6 homeMenuStatusItems];
    double v13 = [v7 allObjects];
    double v14 = [(HUItemCollectionViewController *)self itemManager];
    uint64_t v15 = [v14 statusItemModule];
    __int16 v16 = [v15 _itemComparator];
    double v12 = [v13 sortedArrayUsingComparator:v16];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_7:

  return v12;
}

- (id)editActionDelegate
{
  objc_opt_class();
  uint64_t v3 = [(HUDashboardViewController *)self navigationController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)supportsEditing
{
  uint64_t v3 = [(HUDashboardViewController *)self context];
  int v4 = [v3 allowsEditing];

  if (!v4) {
    return 0;
  }
  id v5 = [(HUDashboardViewController *)self context];
  double v6 = [v5 home];
  char v7 = objc_msgSend(v6, "hf_shouldBlockCurrentUserFromHome");

  if (v7) {
    return 0;
  }
  int v8 = [(HUDashboardViewController *)self context];
  double v9 = [v8 home];
  int v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  if (!v10) {
    return 0;
  }
  char v11 = [(HUItemCollectionViewController *)self itemManager];
  char v12 = [v11 isEmptyDashboard];

  return v12 ^ 1;
}

- (NSString)editActionTitle
{
  id v2 = [(HUDashboardViewController *)self context];
  uint64_t v3 = [v2 menuEditActionTitle];

  return (NSString *)v3;
}

- (NSString)editActionTitleLocalizationKey
{
  id v2 = [(HUDashboardViewController *)self context];
  uint64_t v3 = [v2 menuEditActionTitleLocalizationKey];

  return (NSString *)v3;
}

- (void)startEditing
{
}

- (void)endEditing
{
}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v11 = [v4 dictionary];
  objc_msgSend(v11, "na_safeSetObject:forKey:", self, *MEMORY[0x1E4F681E8]);
  double v6 = [(HUDashboardViewController *)self contextTypeDescriptionForAnalytics];
  if ([v6 length])
  {
    char v7 = NSString;
    int v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    int v10 = [v7 stringWithFormat:@"%@-%@", v9, v6];
  }
  else
  {
    int v10 = 0;
  }
  objc_msgSend(v11, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F681F0]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F68170]);

  [MEMORY[0x1E4F68EE0] sendEvent:36 withData:v11];
}

void __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke_1177(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Error updating Announce notification setting - [%@]", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  if (([(HUDashboardViewController *)self isEditing] & 1) != 0
    || ([MEMORY[0x1E4F69138] isHomeControlService] & 1) != 0)
  {
    int v10 = 0;
    goto LABEL_54;
  }
  SEL v55 = a2;
  id v11 = [(HUControllableItemCollectionViewController *)self quickControlPresentationCoordinator];
  char v12 = -[HUControllableItemCollectionViewController presentationCoordinator:contextForPresentationAtPoint:](self, "presentationCoordinator:contextForPresentationAtPoint:", v11, x, y);

  id v59 = v12;
  double v13 = [v12 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v57 = [(HUDashboardViewController *)self _hasDetailViewControllerForItem:v13];
  objc_opt_class();
  id v15 = v13;
  if (objc_opt_isKindOfClass()) {
    __int16 v16 = v15;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = [v17 actionSetItemStyle];
  BOOL v66 = v18 == 2;

  id v19 = [(HUDashboardViewController *)self context];
  uint64_t v20 = [v19 home];
  int v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

  id v22 = v15;
  int v23 = &unk_1F19E4798;
  if ([v22 conformsToProtocol:v23]) {
    id v24 = v22;
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  __int16 v26 = [v25 homeKitObject];
  __int16 v27 = &unk_1F1ABAD98;
  if ([v26 conformsToProtocol:v27]) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;

  id v58 = v25;
  id v30 = [v25 homeKitObject];
  uint64_t v31 = &unk_1F1ABACC0;
  if ([v30 conformsToProtocol:v31]) {
    id v32 = v30;
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;

  int v34 = 0;
  if (v21)
  {
    char v67 = 0;
    if (v29)
    {
      int v35 = objc_msgSend(v29, "hf_effectiveShowInHomeDashboard");
      char v36 = objc_msgSend(v29, "hf_effectiveShowInHomeDashboard");
      int v34 = (v18 != 2) & ~v35;
      if (v18 == 2) {
        char v37 = 0;
      }
      else {
        char v37 = v36;
      }
      char v67 = v37;
    }
  }
  else
  {
    char v67 = 0;
  }
  int v63 = v34;
  if (v33) {
    int v38 = v21;
  }
  else {
    int v38 = 0;
  }
  if (v38 != 1)
  {
    char v61 = 0;
LABEL_33:
    char v60 = 0;
    goto LABEL_34;
  }
  if (objc_msgSend(v33, "hf_supportsHomeStatus")) {
    char v61 = objc_msgSend(v33, "hf_isVisibleInHomeStatus") ^ 1;
  }
  else {
    char v61 = 0;
  }
  if (!objc_msgSend(v33, "hf_supportsHomeStatus")) {
    goto LABEL_33;
  }
  char v60 = objc_msgSend(v33, "hf_isVisibleInHomeStatus");
LABEL_34:
  int v62 = isKindOfClass & 1;
  v64 = v33;
  v65 = v29;
  int v56 = v21;
  if (v21)
  {
    id v39 = [(HUDashboardViewController *)self context];
    if ([v39 allowsEditing]) {
      LOBYTE(v21) = [(HUDashboardViewController *)self canReorderItemAtIndexPath:v9];
    }
    else {
      LOBYTE(v21) = 0;
    }
    BOOL v40 = v57;
  }
  else
  {
    BOOL v40 = v57;
    BOOL v66 = 0;
  }
  id v41 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v42 = objc_msgSend(v41, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v9, "section"));

  id v43 = v22;
  v44 = &unk_1F1A3D190;
  if ([v43 conformsToProtocol:v44]) {
    v45 = v43;
  }
  else {
    v45 = 0;
  }
  id v46 = v45;

  id v47 = [(HUDashboardViewController *)self layoutManager];
  char v48 = [(HUDashboardViewController *)self context];
  int v49 = [v47 isAdaptiveTileStyleInSectionIdentifier:v42 context:v48];

  int v50 = [MEMORY[0x1E4F69758] isAMac] & v56;
  if (!v46) {
    int v50 = 0;
  }
  int v51 = v50 & v49;
  char v52 = v21;
  if (((v62 | v40 | v63) & 1) != 0
    || (v67 & 1) != 0
    || (v61 & 1) != 0
    || (v60 & 1) != 0
    || (v21 & 1) != 0
    || v66
    || (int v10 = 0, v51))
  {
    uint64_t v53 = (void *)MEMORY[0x1E4F428F0];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
    v68[3] = &unk_1E63906E0;
    char v76 = v52;
    v68[4] = self;
    id v69 = v59;
    char v77 = v63;
    id v70 = v65;
    SEL v75 = v55;
    char v78 = v67;
    char v79 = v61;
    id v71 = v64;
    char v80 = v60;
    char v81 = v62;
    id v72 = v43;
    BOOL v82 = v40;
    id v73 = v9;
    BOOL v83 = v66;
    char v84 = v51;
    id v74 = v46;
    int v10 = [v53 configurationWithIdentifier:0 previewProvider:0 actionProvider:v68];
    [v10 setPreferredMenuElementOrder:1];
  }
LABEL_54:

  return v10;
}

id __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  v152[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (*(unsigned char *)(a1 + 96) && [MEMORY[0x1E4F69758] supportsEditView])
  {
    int v4 = (void *)MEMORY[0x1E4F426E8];
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 menuEditActionTitle];
    char v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.grid.2x2"];
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = 3221225472;
    v149[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1211;
    v149[3] = &unk_1E63905C8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v151 = &__block_literal_global_1205;
    v149[4] = v8;
    id v150 = v9;
    int v10 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:v149];

    [v2 addObject:v10];
  }
  if (*(unsigned char *)(a1 + 97))
  {
    id v11 = (void *)MEMORY[0x1E4F426E8];
    char v12 = _HULocalizedStringWithDefaultValue(@"HUShowInHomeDashboardTitle", @"HUShowInHomeDashboardTitle", 1);
    double v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus.circle"];
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2_1219;
    v142[3] = &unk_1E63905F0;
    id v147 = &__block_literal_global_1205;
    v143 = @"HUShowInHomeDashboardTitle";
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = *(void **)(a1 + 40);
    id v144 = v14;
    uint64_t v145 = v15;
    uint64_t v148 = *(void *)(a1 + 88);
    id v146 = v16;
    id v17 = [v11 actionWithTitle:v12 image:v13 identifier:0 handler:v142];

    [v3 addObject:v17];
  }
  if (*(unsigned char *)(a1 + 98))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F426E8];
    id v19 = _HULocalizedStringWithDefaultValue(@"HUHideFromHomeDashboardTitle", @"HUHideFromHomeDashboardTitle", 1);
    uint64_t v20 = [MEMORY[0x1E4F42A80] systemImageNamed:@"minus.circle"];
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
    v135[3] = &unk_1E63905F0;
    id v140 = &__block_literal_global_1205;
    v136 = @"HUHideFromHomeDashboardTitle";
    id v21 = *(id *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    int v23 = *(void **)(a1 + 40);
    id v137 = v21;
    uint64_t v138 = v22;
    uint64_t v141 = *(void *)(a1 + 88);
    id v139 = v23;
    id v24 = [v18 actionWithTitle:v19 image:v20 identifier:0 handler:v135];

    [v3 addObject:v24];
  }
  if (*(unsigned char *)(a1 + 99))
  {
    id v25 = (void *)MEMORY[0x1E4F426E8];
    __int16 v26 = _HULocalizedStringWithDefaultValue(@"HUIncludeInHomeStatusTitle", @"HUIncludeInHomeStatusTitle", 1);
    __int16 v27 = [MEMORY[0x1E4F42A80] systemImageNamed:@"house"];
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
    v128[3] = &unk_1E63905F0;
    id v133 = &__block_literal_global_1205;
    v129 = @"HUIncludeInHomeStatusTitle";
    id v28 = *(id *)(a1 + 56);
    uint64_t v29 = *(void *)(a1 + 32);
    id v30 = *(void **)(a1 + 40);
    id v130 = v28;
    uint64_t v131 = v29;
    uint64_t v134 = *(void *)(a1 + 88);
    id v132 = v30;
    uint64_t v31 = [v25 actionWithTitle:v26 image:v27 identifier:0 handler:v128];

    [v3 addObject:v31];
  }
  if (*(unsigned char *)(a1 + 100))
  {
    id v32 = (void *)MEMORY[0x1E4F426E8];
    id v33 = _HULocalizedStringWithDefaultValue(@"HUExcludeFromHomeStatusTitle", @"HUExcludeFromHomeStatusTitle", 1);
    int v34 = [MEMORY[0x1E4F42A80] systemImageNamed:@"house"];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5;
    v121[3] = &unk_1E63905F0;
    id v126 = &__block_literal_global_1205;
    v122 = @"HUExcludeFromHomeStatusTitle";
    id v35 = *(id *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 32);
    char v37 = *(void **)(a1 + 40);
    id v123 = v35;
    uint64_t v124 = v36;
    uint64_t v127 = *(void *)(a1 + 88);
    id v125 = v37;
    int v38 = [v32 actionWithTitle:v33 image:v34 identifier:0 handler:v121];

    [v3 addObject:v38];
  }
  if (*(unsigned char *)(a1 + 101))
  {
    id v39 = (void *)MEMORY[0x1E4F426E8];
    BOOL v40 = _HULocalizedStringWithDefaultValue(@"HUContextMenuCameraViewLiveStreamTitle", @"HUContextMenuCameraViewLiveStreamTitle", 1);
    id v41 = [MEMORY[0x1E4F42A80] systemImageNamed:@"video"];
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6;
    v115[3] = &unk_1E6390618;
    id v120 = &__block_literal_global_1205;
    uint64_t v42 = *(void *)(a1 + 32);
    uint64_t v116 = @"HUContextMenuCameraViewLiveStreamTitle";
    uint64_t v117 = v42;
    id v118 = *(id *)(a1 + 64);
    id v119 = *(id *)(a1 + 40);
    id v43 = [v39 actionWithTitle:v40 image:v41 identifier:0 handler:v115];

    [v3 addObject:v43];
  }
  if (*(unsigned char *)(a1 + 102))
  {
    char v44 = [*(id *)(a1 + 32) shouldShowAccessoryControlForItem:*(void *)(a1 + 64)];
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7;
    v112[3] = &unk_1E6390640;
    id v113 = *(id *)(a1 + 64);
    char v114 = v44;
    v45 = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7((uint64_t)v112);
    id v46 = (void *)MEMORY[0x1E4F426E8];
    id v47 = _HULocalizedStringWithDefaultValue(v45, v45, 1);
    char v48 = [MEMORY[0x1E4F42A80] systemImageNamed:@"gearshape"];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8;
    v104[3] = &unk_1E6390668;
    id v110 = &__block_literal_global_1205;
    id v105 = v45;
    char v111 = v44;
    id v49 = *(id *)(a1 + 64);
    uint64_t v50 = *(void *)(a1 + 32);
    id v106 = v49;
    uint64_t v107 = v50;
    id v108 = *(id *)(a1 + 72);
    id v109 = *(id *)(a1 + 40);
    id v51 = v45;
    char v52 = [v46 actionWithTitle:v47 image:v48 identifier:0 handler:v104];

    [v3 addObject:v52];
  }
  if (*(unsigned char *)(a1 + 103))
  {
    uint64_t v53 = (void *)MEMORY[0x1E4F426E8];
    int v54 = _HULocalizedStringWithDefaultValue(@"HUHideSuggestedScenesTitle", @"HUHideSuggestedScenesTitle", 1);
    SEL v55 = [MEMORY[0x1E4F42A80] systemImageNamed:@"minus.circle"];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9;
    v99[3] = &unk_1E6390690;
    id v103 = &__block_literal_global_1205;
    uint64_t v56 = *(void *)(a1 + 32);
    BOOL v57 = *(void **)(a1 + 40);
    v100 = @"HUHideSuggestedScenesTitle";
    uint64_t v101 = v56;
    id v102 = v57;
    id v58 = [v53 actionWithTitle:v54 image:v55 identifier:0 handler:v99];

    [v3 addObject:v58];
  }
  if (*(unsigned char *)(a1 + 104))
  {
    id v59 = [*(id *)(a1 + 32) layoutManager];
    uint64_t v60 = [v59 gridSizeForItem:*(void *)(a1 + 80)];
    uint64_t v62 = v61;

    BOOL v63 = v62 <= 1 || v60 <= 1;
    v64 = @"HUContextMenuShowAsLargeTileTitle";
    if (!v63) {
      v64 = @"HUContextMenuShowAsSmallTileTitle";
    }
    v65 = v64;
    objc_opt_class();
    BOOL v66 = [*(id *)(a1 + 32) collectionView];
    char v67 = [v66 cellForItemAtIndexPath:*(void *)(a1 + 72)];
    if (objc_opt_isKindOfClass()) {
      __int16 v68 = v67;
    }
    else {
      __int16 v68 = 0;
    }
    id v69 = v68;

    id v70 = (void *)MEMORY[0x1E4F426E8];
    id v71 = _HULocalizedStringWithDefaultValue(v65, v65, 1);
    uint64_t v89 = MEMORY[0x1E4F143A8];
    uint64_t v90 = 3221225472;
    v91 = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1265;
    v92 = &unk_1E63906B8;
    uint64_t v72 = *(void *)(a1 + 32);
    v93 = v65;
    uint64_t v94 = v72;
    id v98 = &__block_literal_global_1205;
    id v95 = v69;
    id v96 = *(id *)(a1 + 80);
    id v97 = *(id *)(a1 + 40);
    id v73 = v65;
    id v74 = v69;
    SEL v75 = [v70 actionWithTitle:v71 image:0 identifier:0 handler:&v89];

    objc_msgSend(v3, "addObject:", v75, v89, v90, v91, v92);
  }
  if (([v2 count] || objc_msgSend(v3, "count"))
    && [*(id *)(a1 + 64) conformsToProtocol:&unk_1F19E4850])
  {
    char v76 = [*(id *)(a1 + 32) quickControlPresentationContextForItem:*(void *)(a1 + 64) atIndexPath:*(void *)(a1 + 72)];
    char v77 = (void *)MEMORY[0x1E4F68EE0];
    char v78 = [*(id *)(a1 + 32) quickControlPresentationCoordinator];
    [v77 logAndSendTileInteractionEventOfType:3 withPresentationContext:v76 presentationCoordinator:v78];
  }
  char v79 = (void *)MEMORY[0x1E4F42B80];
  char v80 = (void *)[v2 copy];
  char v81 = [v79 menuWithTitle:&stru_1F18F92B8 image:0 identifier:0 options:1 children:v80];

  BOOL v82 = (void *)MEMORY[0x1E4F42B80];
  BOOL v83 = (void *)[v3 copy];
  char v84 = [v82 menuWithTitle:&stru_1F18F92B8 image:0 identifier:0 options:1 children:v83];

  id v85 = (void *)MEMORY[0x1E4F42B80];
  v152[0] = v81;
  v152[1] = v84;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:2];
  id v87 = [v85 menuWithTitle:&stru_1F18F92B8 children:v86];

  return v87;
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "User tapped context menu action: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1211(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) context];
  int v4 = [v3 menuEditActionTitleLocalizationKey];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  id v5 = [*(id *)(a1 + 32) editActionDelegate];
  [v5 startEditing];

  char v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = [v7 context];
  uint64_t v8 = [v9 menuEditActionTitleLocalizationKey];
  [v7 _sendContextMenuMetricsWithContext:v6 title:v8];
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2_1219(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "hf_updateShowInHomeDashboard:", 1);
  id v3 = [*(id *)(a1 + 48) itemManager];
  id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 72)];

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);

  return [v5 _sendContextMenuMetricsWithContext:v6 title:v7];
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "hf_updateShowInHomeDashboard:", 0);
  id v3 = [*(id *)(a1 + 48) itemManager];
  id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 72)];

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);

  return [v5 _sendContextMenuMetricsWithContext:v6 title:v7];
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "hf_updateIsVisibleInHomeStatus:", 1);
  id v3 = [*(id *)(a1 + 48) itemManager];
  id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 72)];

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);

  return [v5 _sendContextMenuMetricsWithContext:v6 title:v7];
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "hf_updateIsVisibleInHomeStatus:", 0);
  id v3 = [*(id *)(a1 + 48) itemManager];
  id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 72)];

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);

  return [v5 _sendContextMenuMetricsWithContext:v6 title:v7];
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = [*(id *)(a1 + 40) moduleControllerForItem:*(void *)(a1 + 48)];
  if (v2) {
    [v2 didSelectItem:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) _sendContextMenuMetricsWithContext:*(void *)(a1 + 56) title:*(void *)(a1 + 32)];
}

__CFString *__106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7(uint64_t a1)
{
  if (objc_opt_isKindOfClass()) {
    return @"HUContextMenuSceneDetailsTitle";
  }
  if (*(unsigned char *)(a1 + 40)) {
    return @"HUContextMenuAccessorySettingsTitle";
  }
  return @"HUContextMenuAccessoryDetailsTitle";
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  if (*(unsigned char *)(a1 + 80))
  {
    objc_opt_class();
    id v2 = *(id *)(a1 + 40);
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    id v4 = v3;

    id v5 = [v4 sourceItem];
    if ([v5 conformsToProtocol:&unk_1F1A3D558]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    if (!v7) {
      id v5 = *(void **)(a1 + 40);
    }
    id v8 = (id)[*(id *)(a1 + 48) presentAccessorySettingsForItem:v5];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) collectionView];
    int v10 = [v9 cellForItemAtIndexPath:*(void *)(a1 + 56)];
    if ([v10 conformsToProtocol:&unk_1F19E3E20]) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    char v12 = *(void **)(a1 + 48);
    id v13 = v11;
    id v14 = [v12 quickControlPresentationCoordinator];
    [v14 setPressedTile:v13];

    id v4 = [*(id *)(a1 + 48) quickControlPresentationCoordinator];
    id v15 = (id)[v4 presentQuickControlWithContext:*(void *)(a1 + 64) animated:1];
  }

  __int16 v16 = *(void **)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 32);

  return [v16 _sendContextMenuMetricsWithContext:v17 title:v18];
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [*(id *)(a1 + 40) itemManager];
  id v3 = [v2 home];
  id v4 = objc_msgSend(v3, "hf_setShowPredictedScenesOnDashboard:", 0);
  id v5 = (id)[v4 addCompletionBlock:&__block_literal_global_1258];

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);

  return [v6 _sendContextMenuMetricsWithContext:v7 title:v8];
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v3 == 0;
    __int16 v6 = 2112;
    id v7 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Updating showPredictedScenesOnDashboard to (NO) succeeded: %{BOOL}d  %@", (uint8_t *)v5, 0x12u);
  }
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1265(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  [*(id *)(a1 + 40) _toggleSizeForCell:*(void *)(a1 + 48) withItem:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  return [v3 _sendContextMenuMetricsWithContext:v2 title:v4];
}

- (void)_sendContextMenuMetricsWithContext:(id)a3 title:(id)a4
{
  __int16 v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v17 = [v6 dictionary];
  id v9 = [v8 item];
  objc_msgSend(v17, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E4F681B8]);

  int v10 = [v8 sourceViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 topViewController];
    char v12 = (void *)v11;
    if (v11) {
      id v13 = (void *)v11;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;

    int v10 = v14;
  }
  objc_msgSend(v17, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F681E8]);
  objc_msgSend(v17, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68170]);

  id v15 = [(HUDashboardViewController *)self context];
  __int16 v16 = [v15 typeDescriptionForAnalytics];
  objc_msgSend(v17, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E4F68178]);

  [MEMORY[0x1E4F68EE0] sendEvent:36 withData:v17];
}

@end