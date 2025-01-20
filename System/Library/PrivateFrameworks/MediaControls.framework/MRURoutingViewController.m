@interface MRURoutingViewController
- (AVSystemController)mediaServerController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_operationRequiresOptimisticState:(int64_t)a3 routes:(id)a4;
- (BOOL)_shouldShowShowMoreButton;
- (BOOL)_wouldEndGroupSessionForViewItem:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5;
- (BOOL)_wouldShareAudioForPickedRoute:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5;
- (BOOL)canUseUncoalescedResults;
- (BOOL)didExpandVendorSpecificSpeakerGroup;
- (BOOL)didLastPickNativeRoute;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)handleSelectedRoutingViewItem:(id)a3 operation:(int64_t)a4;
- (BOOL)hasCarKitRoute;
- (BOOL)isDonatingAppEligible;
- (BOOL)isInCarPlay;
- (BOOL)isInVehicle;
- (BOOL)isVendorSpecificGroupStatusRecorded:(id)a3;
- (BOOL)needsDisplayedRoutesUpdate;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)onScreen;
- (BOOL)presentingAppHasActiveAVSession;
- (BOOL)routesContainAirPlayGroupableRoute:(id)a3;
- (BOOL)routesContainMultipleBuiltIn:(id)a3;
- (BOOL)routesContainSplitterCapableRoute:(id)a3;
- (BOOL)shouldSuppressNativeRoutesStatusDisplay;
- (BOOL)showMetadataForEndpointRoute;
- (BOOL)sortByIsVideoRoute;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)wasVendorSpecificGroupDisplayedAsExpanded:(id)a3;
- (CARSessionStatus)carPlaySessionStatus;
- (MPAVEndpointRoute)endpointRoute;
- (MPAVRoutingController)routingController;
- (MPWeakTimer)subtitleUpdateTimer;
- (MRGroupSession)activeGroupSession;
- (MRGroupSessionDiscovery)groupSessionDiscovery;
- (MRURoutingViewController)init;
- (MRURoutingViewController)initWithRoutingController:(id)a3;
- (MRURoutingViewControllerDelegate)delegate;
- (MRUVendorSpecificDeviceManager)vendorSpecificManager;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeGroupCoordinator)volumeGroupCoordinator;
- (NSArray)nowPlayingControllers;
- (NSArray)visibleMediaApps;
- (NSDictionary)indexedNowPlayingControllers;
- (NSDictionary)outputDeviceVolumeControllers;
- (NSIndexPath)vendorSpecificGroupThatWasJustExpanded;
- (NSMutableArray)customRows;
- (NSMutableArray)staticCustomRowItems;
- (NSMutableDictionary)vendorSpecificGroupDisplayedSubroutes;
- (NSMutableSet)collapsedVendorSpecificGroupUIDs;
- (NSMutableSet)expandedGroupUIDs;
- (NSMutableSet)expandedItemUIDs;
- (NSMutableSet)expandedRouteUIDs;
- (NSMutableSet)expandedVendorSpecificGroupUIDs;
- (NSNumberFormatter)percentageFormatter;
- (NSString)donatingAppBundleID;
- (NSString)mostRecentlyInteractedVendorSpecificGroupRouteID;
- (NSString)nowPlayingAppBundleID;
- (NSString)presentingAppBundleID;
- (NSTimer)collapseTimer;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)scrollIndicatorInsets;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_airPlayRoutesInRoutes:(id)a3;
- (id)_createRoutingViewItemsForUpdate:(id)a3;
- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4;
- (id)_displayAsPickedRoutesInRoutes:(id)a3;
- (id)_displayableRoutesInRoutes:(id)a3;
- (id)_fullStateDumpObject;
- (id)_mergeRoutes:(id)a3 withCoalescedResult:(id)a4;
- (id)_recommendedRoutesFromRoutes:(id)a3;
- (id)_stateDumpObject;
- (id)endpointGroupUID;
- (id)groupUIDForRoute:(id)a3;
- (id)symbolNameForVendorSpecificRoute:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)presentingAppProcessIdentifier;
- (int64_t)discoveryMode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)subtitleAccessoryForItem:(id)a3 nowPlayingInfo:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)stateHandle;
- (void)_applyUpdate:(id)a3;
- (void)_collapseAllGroups;
- (void)_collapseAllGroupsAfterDelay;
- (void)_configureVolumeForUpdate:(id)a3 volumeCapableRoutes:(id *)a4 volumeController:(id *)a5;
- (void)_createUpdateWithRefreshOnly:(BOOL)a3 completion:(id)a4;
- (void)_displayEndGroupSessionWithCompletion:(id)a3;
- (void)_displayGroupSessionAlertWithTitle:(id)a3 body:(id)a4 confirmTitle:(id)a5 cancelTitle:(id)a6 completion:(id)a7;
- (void)_displayShareAudioDisabledAlertForReason:(id)a3;
- (void)_enqueueUpdate:(id)a3;
- (void)_refreshDisplayedRoutes;
- (void)_reloadDisplayedRoutes;
- (void)_setNeedsDisplayedRoutesUpdate;
- (void)_setNeedsRouteDiscoveryModeUpdate;
- (void)_setupUpdateTimerIfNecessary;
- (void)_updateDisplayedRoutes;
- (void)_updateGroupSessionDiscovery;
- (void)applyVendorSpecificGroupExpandedRecord:(id)a3;
- (void)clearVendorSpecificGroupExpandedRecordFor:(id)a3;
- (void)dealloc;
- (void)didReceiveInteraction:(id)a3;
- (void)ensureVendorSpecificGroupTreeIsVisible:(id)a3;
- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3;
- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)groupSessionDidConnect:(id)a3;
- (void)groupSessionDiscovery:(id)a3 activeSessionDidChange:(id)a4;
- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)handleGroupSessionJoinWithPickedRoute:(id)a3;
- (void)hearingAidConnectionDidChange;
- (void)loadView;
- (void)playingSessionsDidChangeNotification:(id)a3;
- (void)resetDisplayedRoutes;
- (void)routingCellDidTapToExpand:(id)a3;
- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)selectRoutes:(id)a3 operation:(int64_t)a4 routingViewItem:(id)a5;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setActiveGroupSession:(id)a3;
- (void)setCarPlaySessionStatus:(id)a3;
- (void)setCollapseTimer:(id)a3;
- (void)setCollapsedVendorSpecificGroupUIDs:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setCustomRows:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidExpandVendorSpecificSpeakerGroup:(BOOL)a3;
- (void)setDidLastPickNativeRoute:(BOOL)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setDonatingAppBundleID:(id)a3;
- (void)setDonatingAppEligible:(BOOL)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setExpandedGroupUIDs:(id)a3;
- (void)setExpandedItemUIDs:(id)a3;
- (void)setExpandedRouteUIDs:(id)a3;
- (void)setExpandedVendorSpecificGroupUIDs:(id)a3;
- (void)setGroupSessionDiscovery:(id)a3;
- (void)setIndexedNowPlayingControllers:(id)a3;
- (void)setMediaServerController:(id)a3;
- (void)setMostRecentlyInteractedVendorSpecificGroupRouteID:(id)a3;
- (void)setNeedsDisplayedRoutesUpdate:(BOOL)a3;
- (void)setNowPlayingAppBundleID:(id)a3;
- (void)setNowPlayingControllers:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setOptimisticUpdate:(id)a3;
- (void)setOutputDeviceVolumeControllers:(id)a3;
- (void)setPercentageFormatter:(id)a3;
- (void)setPresentingAppBundleID:(id)a3;
- (void)setPresentingAppHasActiveAVSession:(BOOL)a3;
- (void)setPresentingAppProcessIdentifier:(int)a3;
- (void)setRoutingController:(id)a3;
- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setShowMetadataForEndpointRoute:(BOOL)a3;
- (void)setSortByIsVideoRoute:(BOOL)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStaticCustomRowItems:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitleUpdateTimer:(id)a3;
- (void)setVendorSpecificGroupDisplayedSubroutes:(id)a3;
- (void)setVendorSpecificGroupThatWasJustExpanded:(id)a3;
- (void)setVendorSpecificManager:(id)a3;
- (void)setVisibleMediaApps:(id)a3;
- (void)setVolumeGroupCoordinator:(id)a3;
- (void)showMoreAction;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forIndexPath:(id)a4;
- (void)updateExpandedGroups;
- (void)updateHeaderView:(id)a3 forSection:(int64_t)a4;
- (void)updateMetadata;
- (void)updateMetadataForNowPlayingController:(id)a3;
- (void)updateNowPlayingControllersForRoutes:(id)a3;
- (void)updateSubtitle;
- (void)updateVendorSpecificCell:(id)a3 forIndexPath:(id)a4;
- (void)updateVendorSpecificCustomRowCell:(id)a3 forIndexPath:(id)a4;
- (void)updateVendorSpecificGroupExpandedRecordFor:(id)a3;
- (void)updateVendorSpecificSpeakerGroupCell:(id)a3 forIndexPath:(id)a4;
- (void)updateVendorSpecificSubRouteCell:(id)a3 forIndexPath:(id)a4;
- (void)vendorSpecificCellDidTapToExpand:(id)a3;
- (void)vendorSpecificManager:(id)a3 deviceNowPlayingInfoDidChange:(id)a4;
- (void)vendorSpecificManager:(id)a3 deviceStateDidChange:(id)a4;
- (void)vendorSpecificManagerDeviceListDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MRURoutingViewController

void __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  v3 = [v2 attributeForKey:*MEMORY[0x1E4F74C78]];

  if (v3)
  {
    v4 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "sessions: %@", buf, 0xCu);
    }

    v5 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 1156);
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v6;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "presentingAppPID: %d", buf, 8u);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v15 = v3;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      v11 = (void *)MEMORY[0x1E4F74C90];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "objectForKeyedSubscript:", *v11, v15);
          int v14 = *(_DWORD *)(*(void *)(a1 + 32) + 1156);
          if (v14 == [v13 intValue])
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke_195;
            block[3] = &unk_1E5F0D7F8;
            block[4] = *(void *)(a1 + 32);
            dispatch_async(MEMORY[0x1E4F14428], block);
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    v3 = v15;
  }
}

- (void)playingSessionsDidChangeNotification:(id)a3
{
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (MRURoutingViewController)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F31850]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = (void *)[v3 initWithName:v5];

  id v7 = [(MRURoutingViewController *)self initWithRoutingController:v6];
  return v7;
}

- (MRURoutingViewController)initWithRoutingController:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MRURoutingViewController;
  int v6 = [(MRURoutingViewController *)&v28 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingController, a3);
    [(MPAVRoutingController *)v7->_routingController setDelegate:v7];
    v7->_discoveryMode = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    expandedGroupUIDs = v7->_expandedGroupUIDs;
    v7->_expandedGroupUIDs = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    expandedItemUIDs = v7->_expandedItemUIDs;
    v7->_expandedItemUIDs = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    expandedRouteUIDs = v7->_expandedRouteUIDs;
    v7->_expandedRouteUIDs = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    collapsedVendorSpecificGroupUIDs = v7->_collapsedVendorSpecificGroupUIDs;
    v7->_collapsedVendorSpecificGroupUIDs = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    expandedVendorSpecificGroupUIDs = v7->_expandedVendorSpecificGroupUIDs;
    v7->_expandedVendorSpecificGroupUIDs = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    vendorSpecificGroupDisplayedSubroutes = v7->_vendorSpecificGroupDisplayedSubroutes;
    v7->_vendorSpecificGroupDisplayedSubroutes = (NSMutableDictionary *)v18;

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__MRURoutingViewController_initWithRoutingController___block_invoke;
    v26[3] = &unk_1E5F0DEA0;
    long long v20 = v7;
    v27 = v20;
    v20->_stateHandle = __54__MRURoutingViewController_initWithRoutingController___block_invoke((uint64_t)v26);
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    staticCustomRowItems = v20->_staticCustomRowItems;
    v20->_staticCustomRowItems = (NSMutableArray *)v21;

    v20->_didExpandVendorSpecificSpeakerGroup = 0;
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v20 selector:sel_routeRecommenderDidUpdateRecommendations_ name:MRURouteRecommenderDidUpdateRecommendationsNotification object:0];

    uint64_t v24 = +[MRURouteRecommender sharedInstance];
    [v24 updateRecommendations];
  }
  return v7;
}

uint64_t __54__MRURoutingViewController_initWithRoutingController___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRURoutingViewController_initWithRoutingController___block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __54__MRURoutingViewController_initWithRoutingController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = [WeakRetained _fullStateDumpObject];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRoutingController:(id)a3
{
  v4 = (MPAVRoutingController *)a3;
  [(MPAVRoutingController *)self->_routingController setDelegate:0];
  routingController = self->_routingController;
  self->_routingController = v4;
  id v6 = v4;

  [(MPAVRoutingController *)self->_routingController setDelegate:self];
  [(MRURoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
  [(MRURoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
  [(MRURoutingViewController *)self updateMetadata];
  [(MRURoutingViewController *)self updateSubtitle];
  id v8 = [(MRURoutingViewController *)self view];
  id v7 = [v8 tableView];
  [v7 reloadData];
}

- (void)dealloc
{
  os_state_remove_handler();
  notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  notify_cancel(self->_airPlayPasswordAlertDidCancelToken);
  [(MPWeakTimer *)self->_updateTimer invalidate];
  [(MPWeakTimer *)self->_subtitleUpdateTimer invalidate];
  [(NSTimer *)self->_collapseTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(MRURoutingView);
  [(MRURoutingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v46 viewDidLoad];
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  id v7 = [(MRURoutingViewController *)self view];
  objc_msgSend(v7, "setContentEdgeInsets:", top, left, bottom, right);

  double v8 = self->_scrollIndicatorInsets.top;
  double v9 = self->_scrollIndicatorInsets.left;
  double v10 = self->_scrollIndicatorInsets.bottom;
  double v11 = self->_scrollIndicatorInsets.right;
  uint64_t v12 = [(MRURoutingViewController *)self view];
  v13 = [v12 tableView];
  objc_msgSend(v13, "setScrollIndicatorInsets:", v8, v9, v10, v11);

  uint64_t v14 = [(MRURoutingViewController *)self view];
  v15 = [v14 tableView];
  uint64_t v16 = objc_opt_class();
  long long v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  [v15 registerClass:v16 forHeaderFooterViewReuseIdentifier:v18];

  long long v19 = [(MRURoutingViewController *)self view];
  long long v20 = [v19 tableView];
  uint64_t v21 = objc_opt_class();
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  [v20 registerClass:v21 forHeaderFooterViewReuseIdentifier:v23];

  uint64_t v24 = [(MRURoutingViewController *)self view];
  v25 = [v24 tableView];
  uint64_t v26 = objc_opt_class();
  v27 = (objc_class *)objc_opt_class();
  objc_super v28 = NSStringFromClass(v27);
  [v25 registerClass:v26 forCellReuseIdentifier:v28];

  v29 = [(MRURoutingViewController *)self view];
  v30 = [v29 tableView];
  [v30 setDataSource:self];

  v31 = [(MRURoutingViewController *)self view];
  v32 = [v31 tableView];
  [v32 setDelegate:self];

  [(MRURoutingViewController *)self _updateGroupSessionDiscovery];
  v33 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MRURoutingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(v33, block);

  v34 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x1E4F57EE0]);
  carPlaySessionStatus = self->_carPlaySessionStatus;
  self->_carPlaySessionStatus = v34;

  [(CARSessionStatus *)self->_carPlaySessionStatus addSessionObserver:self];
  v36 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  percentageFormatter = self->_percentageFormatter;
  self->_percentageFormatter = v36;

  [(NSNumberFormatter *)self->_percentageFormatter setNumberStyle:3];
  [(NSNumberFormatter *)self->_percentageFormatter setUsesSignificantDigits:0];
  [(NSNumberFormatter *)self->_percentageFormatter setUsesGroupingSeparator:0];
  v38 = [[MediaControlsInteractionRecognizer alloc] initWithTarget:self action:sel_didReceiveInteraction_];
  [(MediaControlsInteractionRecognizer *)v38 setCancelsTouchesInView:0];
  v39 = [(MRURoutingViewController *)self view];
  [v39 addGestureRecognizer:v38];

  [(MediaControlsInteractionRecognizer *)v38 setDelegate:self];
  objc_initWeak(&location, self);
  v40 = MEMORY[0x1E4F14428];
  id v41 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __39__MRURoutingViewController_viewDidLoad__block_invoke_2;
  handler[3] = &unk_1E5F0E8B0;
  objc_copyWeak(&v43, &location);
  notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertDidCancel", &self->_airPlayPasswordAlertDidCancelToken, v40, handler);

  self->_didLastPickNativeRoute = 0;
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __39__MRURoutingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  objc_super v3 = (void *)MEMORY[0x1E4F74E98];
  v6[0] = *MEMORY[0x1E4F74E98];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setAttribute:v4 forKey:*MEMORY[0x1E4F74EA8] error:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel_playingSessionsDidChangeNotification_ name:*v3 object:0];
}

void __39__MRURoutingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained routingController];
    [v2 clearCachedRoutes];

    [v3 _setNeedsDisplayedRoutesUpdate];
    id WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v4 viewWillAppear:a3];
  [(MRURoutingViewController *)self setOnScreen:1];
  [(MRURoutingViewController *)self playingSessionsDidChangeNotification:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v4 viewWillDisappear:a3];
  [(MRURoutingViewController *)self setOnScreen:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v5 viewDidDisappear:a3];
  [(MPWeakTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  [(NSTimer *)self->_collapseTimer invalidate];
  [(MRURoutingViewController *)self _collapseAllGroups];
  [(MRURoutingViewController *)self resetDisplayedRoutes];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MRURoutingViewController;
  [(MRURoutingViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (!self->_onScreen)
  {
    [(MPWeakTimer *)self->_updateTimer invalidate];
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  if (self->_discoveryMode != a3)
  {
    self->_discoveryMode = a3;
    [(MRURoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRURoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
    [(MRURoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
    [(MRURoutingViewController *)self updateMetadata];
    [(MRURoutingViewController *)self updateSubtitle];
    if (self->_onScreen)
    {
      id v5 = [(MRURoutingViewController *)self view];
      objc_super v4 = [v5 tableView];
      [v4 reloadData];
    }
  }
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  id v5 = (MRUVolumeGroupCoordinator *)a3;
  volumeGroupCoordinator = self->_volumeGroupCoordinator;
  double v8 = v5;
  if (volumeGroupCoordinator != v5)
  {
    [(MRUVolumeGroupCoordinator *)volumeGroupCoordinator setVolumeControllers:0];
    objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
    outputDeviceVolumeControllers = self->_outputDeviceVolumeControllers;
    self->_outputDeviceVolumeControllers = 0;
  }
  [(MRURoutingViewController *)self _reloadDisplayedRoutes];
}

- (void)setNowPlayingControllers:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingControllers, a3);
  v25 = self;
  objc_super v6 = (void *)[(NSArray *)self->_cachedDisplayableAvailableRoutes mutableCopy];
  id v7 = (void *)MEMORY[0x1E4F1CA80];
  double v8 = objc_msgSend(v6, "msv_compactMap:", &__block_literal_global_27);
  double v9 = [v7 setWithArray:v8];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v10;
        double v11 = [*(id *)(*((void *)&v35 + 1) + 8 * v10) endpointController];
        uint64_t v12 = [v11 route];
        v13 = [v12 endpointObject];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v29 = v13;
        uint64_t v14 = [v13 outputDevices];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              long long v20 = [v19 uid];
              char v21 = [v9 containsObject:v20];

              if ((v21 & 1) == 0)
              {
                id v22 = objc_alloc(MEMORY[0x1E4F31830]);
                v39 = v19;
                v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
                uint64_t v24 = (void *)[v22 initWithOutputDevices:v23];
                [v6 addObject:v24];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v16);
        }

        uint64_t v10 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v28);
  }

  [(MRURoutingViewController *)v25 updateNowPlayingControllersForRoutes:v6];
  [(MRURoutingViewController *)v25 updateMetadata];
}

uint64_t __53__MRURoutingViewController_setNowPlayingControllers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 routeUID];
}

- (void)setPresentingAppBundleID:(id)a3
{
  double v8 = (NSString *)a3;
  id v5 = self->_presentingAppBundleID;
  if (v5 == v8)
  {
  }
  else
  {
    objc_super v6 = v5;
    char v7 = [(NSString *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_presentingAppBundleID, a3);
      [(MRURoutingViewController *)self _updateGroupSessionDiscovery];
    }
  }
}

- (void)setGroupSessionDiscovery:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = (MRGroupSessionDiscovery *)a3;
  objc_super v6 = self->_groupSessionDiscovery;
  if (v6 == v5)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [(MRGroupSessionDiscovery *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_groupSessionDiscovery, a3);
      double v9 = MCLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = self->_groupSessionDiscovery != 0;
        presentingAppBundleID = self->_presentingAppBundleID;
        v12[0] = 67109378;
        v12[1] = v10;
        __int16 v13 = 2114;
        uint64_t v14 = presentingAppBundleID;
        _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] GroupSession discovery enabled: %{BOOL}u. PresentingBundle: %{public}@", (uint8_t *)v12, 0x12u);
      }

      [(MRURoutingViewController *)self _updateDisplayedRoutes];
    }
  }
}

- (BOOL)isInCarPlay
{
  v2 = [(CARSessionStatus *)self->_carPlaySessionStatus currentSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCarKitRoute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MPAVRoutingController *)self->_routingController availableRoutes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) routeSubtype] == 19)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isInVehicle
{
  if ([(MRURoutingViewController *)self isInCarPlay]) {
    return 1;
  }

  return [(MRURoutingViewController *)self hasCarKitRoute];
}

- (BOOL)canUseUncoalescedResults
{
  v2 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager devices];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)shouldSuppressNativeRoutesStatusDisplay
{
  BOOL v3 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];

  if (!v3 || self->_presentingAppHasActiveAVSession) {
    return 0;
  }
  id v5 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];
  if ([v5 count]) {
    BOOL v4 = !self->_didLastPickNativeRoute;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)resetDisplayedRoutes
{
  self->_hasUserSelections = 0;
  self->_didSelectShowMore = 0;
  [(MRURoutingViewController *)self _updateDisplayedRoutes];
}

- (void)setStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProvider, a3);

  [(MRURoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_contentEdgeInsets = a3;
  long long v8 = [(MRURoutingViewController *)self viewIfLoaded];
  objc_msgSend(v8, "setContentEdgeInsets:", top, left, bottom, right);

  [(MRURoutingViewController *)self _reloadDisplayedRoutes];
}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_scrollIndicatorInsets = a3;
  id v8 = [(MRURoutingViewController *)self view];
  long long v7 = [v8 tableView];
  objc_msgSend(v7, "setScrollIndicatorInsets:", top, left, bottom, right);
}

- (void)setVendorSpecificManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_vendorSpecificManager, a3);
    [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager setDelegate:self];
    objc_super v6 = [(MRURoutingViewController *)self view];
    long long v7 = [v6 tableView];
    [v7 reloadData];

    id v5 = v8;
  }
}

- (void)setCustomRows:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_customRows, a3);
  v39 = self;
  if (!self->_staticCustomRowItems)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    objc_super v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    staticCustomRowItems = self->_staticCustomRowItems;
    self->_staticCustomRowItems = v6;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v5;
  uint64_t v41 = [v8 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v41)
  {
    uint64_t v10 = *(void *)v43;
    unint64_t v11 = 0x1E4F6F000uLL;
    *(void *)&long long v9 = 138412546;
    long long v36 = v9;
    uint64_t v37 = *(void *)v43;
    id v38 = v8;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "type", v36);
        uint64_t v15 = *(void **)(v11 + 608);
        uint64_t v16 = [v14 identifier];
        uint64_t v17 = [v15 symbolForTypeIdentifier:v16 error:0];

        if (v17)
        {
          uint64_t v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v18 scale];
          long long v20 = objc_msgSend(v17, "imageForSize:scale:", 20.0, 20.0, v19);

          char v21 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v20, "CGImage"));
          id v22 = [v21 imageWithRenderingMode:2];

          if (v22)
          {
            id v40 = v22;
            v23 = [v14 localizedDescription];

            if (v23)
            {
              uint64_t v24 = [v14 localizedDescription];
              uint64_t v25 = [v13 titleOverride];
              if (v25)
              {
                uint64_t v26 = (void *)v25;
                uint64_t v27 = [v13 titleOverride];
                char v28 = [v27 isEqualToString:&stru_1F06524E0];

                if ((v28 & 1) == 0)
                {
                  uint64_t v29 = [v13 titleOverride];

                  uint64_t v24 = (void *)v29;
                }
              }
              uint64_t v30 = MCLogCategoryDeviceAccess();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                long long v31 = [v13 identifier];
                *(_DWORD *)buf = v36;
                v47 = v24;
                __int16 v48 = 2112;
                v49 = v31;
                _os_log_impl(&dword_1AE7DF000, v30, OS_LOG_TYPE_DEFAULT, "MRURoutingViewController - Adding Custom Row with title: %@, identifier: %@", buf, 0x16u);
              }
              long long v32 = v39->_staticCustomRowItems;
              long long v33 = (void *)MEMORY[0x1E4F31858];
              long long v34 = [v13 identifier];
              long long v35 = [v33 itemWithVendorSpecificCustomRowTitle:v24 icon:v40 identifier:v34];
              [(NSMutableArray *)v32 addObject:v35];

              uint64_t v10 = v37;
              id v8 = v38;
              unint64_t v11 = 0x1E4F6F000;
            }
          }
        }
      }
      uint64_t v41 = [v8 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v41);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(MPSectionedCollection *)self->_routingViewItems numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(MPSectionedCollection *)self->_routingViewItems numberOfItemsInSection:a4];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (!a4) {
    return 0.0;
  }
  BOOL v4 = +[MRUFeatureFlagProvider isNewControlsEnabled];
  double result = *MEMORY[0x1E4FB2F28];
  if (v4) {
    return 4.5;
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 52.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingTitleFont", a3, a4);
  [v5 lineHeight];

  objc_super v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingSubtitleFont");
  [v6 lineHeight];

  long long v7 = [(MRURoutingViewController *)self traitCollection];
  [v7 displayScale];
  UIRoundToScale();
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessibilityIdentifier:0];
  unint64_t v11 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v6];
  switch([v11 type])
  {
    case 3:
    case 4:
      [v10 setIsVendorSpecific:1];
      [(MRURoutingViewController *)self updateVendorSpecificCell:v10 forIndexPath:v6];
      break;
    case 5:
      [v10 setIsVendorSpecific:1];
      [(MRURoutingViewController *)self updateVendorSpecificSubRouteCell:v10 forIndexPath:v6];
      break;
    case 6:
      [v10 setIsVendorSpecific:1];
      [(MRURoutingViewController *)self updateVendorSpecificCustomRowCell:v10 forIndexPath:v6];
      break;
    case 7:
      [v10 setIsVendorSpecific:1];
      [(MRURoutingViewController *)self updateVendorSpecificSpeakerGroupCell:v10 forIndexPath:v6];
      break;
    default:
      [v10 setIsVendorSpecific:0];
      [(MRURoutingViewController *)self updateCell:v10 forIndexPath:v6];
      break;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (+[MRUFeatureFlagProvider isNewControlsEnabled])
    {
      id v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v8];

      [v9 setStylingProvider:self->_stylingProvider];
    }
    else
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      unint64_t v11 = NSStringFromClass(v10);
      double v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v11];

      [(MRURoutingViewController *)self updateHeaderView:v9 forSection:a4];
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  double v8 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v7];
  double v9 = [v8 mainRoute];
  if ([(MPAVRoutingController *)self->_routingController routeIsPendingPick:v9]) {
    int v10 = 0;
  }
  else {
    int v10 = [v9 isPicked] ^ 1;
  }
  int v11 = [(MPAVRoutingController *)self->_routingController routeIsPendingPick:v9];
  if (v11) {
    int v11 = [v9 isPicked];
  }
  int v12 = v10 | v11;
  if (v10 | v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  v74 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  v75 = v9;
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v12)
  {
    if (isKindOfClass)
    {
      uint64_t v15 = v9;
      [v9 connect];
      uint64_t v16 = v74;
      uint64_t v17 = [v74 routingAccessoryView];
      uint64_t v18 = v17;
      uint64_t v19 = 2;
LABEL_14:
      [v17 setState:v19];

      goto LABEL_91;
    }
  }
  else
  {
    if (isKindOfClass)
    {
      uint64_t v15 = v9;
      [v9 disconnect];
      uint64_t v16 = v74;
      uint64_t v17 = [v74 routingAccessoryView];
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      goto LABEL_14;
    }
    if ([v9 isHearingDeviceRoute])
    {
      +[MRUVirtualHearingAidRoute disconnect];
      uint64_t v15 = v9;
      goto LABEL_90;
    }
  }
  v79 = self;
  switch([v8 type])
  {
    case 0:
    case 1:
      int v20 = [v8 isPickable];
      char v21 = MCLogCategoryDeviceAccess();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "selected native routes", buf, 2u);
        }

        int v23 = [(MRURoutingViewController *)self handleSelectedRoutingViewItem:v8 operation:v13];
        goto LABEL_71;
      }
      uint64_t v15 = v9;
      if (v22)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "selected unpickable native route", buf, 2u);
      }

      goto LABEL_75;
    case 2:
      uint64_t v24 = MCLogCategoryDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [v8 actionIdentifier];
        *(_DWORD *)buf = 138543362;
        v91 = v25;
        _os_log_impl(&dword_1AE7DF000, v24, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] RCS user selected: %{public}@", buf, 0xCu);
      }
      uint64_t v26 = [v8 actionIdentifier];
      int v27 = [v26 isEqualToString:@"Show more"];

      uint64_t v15 = v9;
      if (v27) {
        [(MRURoutingViewController *)self showMoreAction];
      }
LABEL_75:
      int v23 = 1;
      goto LABEL_85;
    case 3:
      char v28 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v28, OS_LOG_TYPE_DEFAULT, "selected vendor specific route", buf, 2u);
      }

      int v23 = 1;
      self->_hasUserSelections = 1;
      self->_didLastPickNativeRoute = 0;
      vendorSpecificManager = self->_vendorSpecificManager;
      uint64_t v15 = v9;
      id v30 = v9;
      [(MRUVendorSpecificDeviceManager *)vendorSpecificManager resolverSetLastSelectedRoute:v30];
      long long v31 = [v30 device];

      [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager setDevice:v31 picked:1];
      goto LABEL_85;
    case 4:
      long long v32 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v32, OS_LOG_TYPE_DEFAULT, "selected vendor specific group", buf, 2u);
      }

      uint64_t v16 = v74;
      if ([v74 showChevronExpanded])
      {
        objc_msgSend(v74, "setShowChevronExpanded:", objc_msgSend(v74, "showChevronExpanded") ^ 1);
        [(MRURoutingViewController *)self vendorSpecificCellDidTapToExpand:v74];
        int v23 = 1;
        uint64_t v15 = v9;
        if (v8) {
          goto LABEL_86;
        }
      }
      else
      {
        id v58 = v9;
        v59 = [v58 routeUID];
        mostRecentlyInteractedVendorSpecificGroupRouteID = self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
        self->_mostRecentlyInteractedVendorSpecificGroupRouteID = v59;

        vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
        v62 = [v58 routeUID];
        [(NSMutableDictionary *)vendorSpecificGroupDisplayedSubroutes objectForKeyedSubscript:v62];
        v64 = v63 = self;

        if (v64)
        {
          v63->_hasUserSelections = 1;
          [(MRUVendorSpecificDeviceManager *)v63->_vendorSpecificManager resolverSetLastSelectedRoute:v64];
          int v65 = [v64 isAirPlayRoute];
          v66 = MCLogCategoryDeviceAccess();
          BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          if (v65)
          {
            if (v67)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE7DF000, v66, OS_LOG_TYPE_DEFAULT, "group row tap -- act on AirPlay subroute", buf, 2u);
            }

            int v23 = [(MRURoutingViewController *)v79 handleSelectedRoutingViewItem:v8 operation:v13];
          }
          else
          {
            if (v67)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE7DF000, v66, OS_LOG_TYPE_DEFAULT, "group row tap -- act on Vendor Specific subroute", buf, 2u);
            }

            v79->_didLastPickNativeRoute = 0;
            v70 = [v64 device];
            int v23 = 1;
            [(MRUVendorSpecificDeviceManager *)v79->_vendorSpecificManager setDevice:v70 picked:1];
          }
          uint64_t v16 = v74;
          uint64_t v15 = v9;
        }
        else
        {
          uint64_t v16 = v74;
          objc_msgSend(v74, "setShowChevronExpanded:", objc_msgSend(v74, "showChevronExpanded") ^ 1);
          [(MRURoutingViewController *)v63 vendorSpecificCellDidTapToExpand:v74];
          int v23 = 1;
          uint64_t v15 = v9;
        }

        self = v79;
        if (v8) {
          goto LABEL_86;
        }
      }
      goto LABEL_91;
    case 5:
      long long v33 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v33, OS_LOG_TYPE_DEFAULT, "selected vendor specific sub route", buf, 2u);
      }

      self->_hasUserSelections = 1;
      id v34 = v9;
      [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager resolverSetLastSelectedRoute:v34];
      int v35 = [v34 isAirPlayRoute];
      long long v36 = MCLogCategoryDeviceAccess();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE7DF000, v36, OS_LOG_TYPE_DEFAULT, "sub route is AirPlay", buf, 2u);
        }

        int v23 = [(MRURoutingViewController *)self handleSelectedRoutingViewItem:v8 operation:v13];
      }
      else
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE7DF000, v36, OS_LOG_TYPE_DEFAULT, "sub route is not AirPlay", buf, 2u);
        }

        self->_didLastPickNativeRoute = 0;
        v68 = [v34 device];
        int v23 = 1;
        [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager setDevice:v68 picked:1];
      }
      uint64_t v15 = v9;

      goto LABEL_85;
    case 6:
      id v38 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v38, OS_LOG_TYPE_DEFAULT, "selected vendor specific custom row", buf, 2u);
      }

      goto LABEL_43;
    case 7:
      id v72 = v7;
      id v73 = v6;
      v39 = MCLogCategoryDeviceAccess();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v39, OS_LOG_TYPE_DEFAULT, "selected vendor specific speaker group", buf, 2u);
      }

      self->_hasUserSelections = 1;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v71 = v8;
      id obj = [v8 routes];
      uint64_t v40 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (!v40) {
        goto LABEL_70;
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v85;
      uint64_t v76 = *(void *)v85;
      break;
    default:
LABEL_43:
      int v23 = 1;
      goto LABEL_71;
  }
  do
  {
    uint64_t v43 = 0;
    uint64_t v77 = v41;
    do
    {
      if (*(void *)v85 != v42) {
        objc_enumerationMutation(obj);
      }
      long long v44 = *(void **)(*((void *)&v84 + 1) + 8 * v43);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v45 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v44;
          _os_log_impl(&dword_1AE7DF000, v45, OS_LOG_TYPE_DEFAULT, "Error: VS speaker group contains bad class object: %@", buf, 0xCu);
        }
      }
      id v46 = v44;
      if ([v46 isGroup])
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v47 = [v46 subroutes];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v80 objects:v88 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v81;
          while (2)
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v81 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v80 + 1) + 8 * i);
              cachedActivatedVendorSpecificDeviceIDs = self->_cachedActivatedVendorSpecificDeviceIDs;
              v54 = [v52 routeUID];
              LODWORD(cachedActivatedVendorSpecificDeviceIDs) = [(NSArray *)cachedActivatedVendorSpecificDeviceIDs containsObject:v54];

              if (cachedActivatedVendorSpecificDeviceIDs)
              {
                self = v79;
                v56 = v79->_vendorSpecificManager;
                v57 = [v52 device];
                [(MRUVendorSpecificDeviceManager *)v56 setDevice:v57 picked:1];

                goto LABEL_67;
              }
              self = v79;
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v80 objects:v88 count:16];
            if (v49) {
              continue;
            }
            break;
          }
LABEL_67:
          uint64_t v42 = v76;
          uint64_t v41 = v77;
        }
      }
      else
      {
        v55 = self->_vendorSpecificManager;
        v47 = [v46 device];
        [(MRUVendorSpecificDeviceManager *)v55 setDevice:v47 picked:1];
      }

      ++v43;
    }
    while (v43 != v41);
    uint64_t v41 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
  }
  while (v41);
LABEL_70:

  int v23 = 1;
  id v7 = v72;
  id v6 = v73;
  double v8 = v71;
LABEL_71:
  uint64_t v15 = v75;
LABEL_85:
  uint64_t v16 = v74;
  if (v8)
  {
LABEL_86:
    if (!v23) {
      goto LABEL_91;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained routingViewController:self didSelectRoutingViewItem:v8];
    }

LABEL_90:
    uint64_t v16 = v74;
  }
LABEL_91:
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = +[MRUFeatureFlagProvider isNewControlsEnabled]
    || [v5 numberOfSections] - 1 == a4;

  return v6;
}

- (void)vendorSpecificManagerDeviceListDidChange:(id)a3
{
  BOOL v4 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "DA device list did change - vendorSpecificManagerDeviceListDidChange", v5, 2u);
  }

  [(MRURoutingViewController *)self _refreshDisplayedRoutes];
}

- (void)vendorSpecificManager:(id)a3 deviceStateDidChange:(id)a4
{
  id v5 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "DA - deviceStateDidChange", v6, 2u);
  }

  [(MRURoutingViewController *)self _updateDisplayedRoutes];
}

- (void)vendorSpecificManager:(id)a3 deviceNowPlayingInfoDidChange:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [(MRURoutingViewController *)self view];
  id v7 = [v6 tableView];
  double v8 = [v7 indexPathsForVisibleRows];

  double v9 = self;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v8;
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v43)
  {
    uint64_t v41 = self;
    uint64_t v42 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v45 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        int v12 = [(MPSectionedCollection *)v9->_routingViewItems safeItemAtIndexPath:v11];
        if ([v12 type] == 5)
        {
          uint64_t v13 = [v12 mainRoute];
          uint64_t v14 = [v13 device];
          uint64_t v15 = [v14 identifier];
          [v5 identifier];
          uint64_t v17 = v16 = v5;
          int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            uint64_t v19 = [(MRURoutingViewController *)v9 view];
            int v20 = [v19 tableView];
            char v21 = [v20 cellForRowAtIndexPath:v11];

            uint64_t v22 = [v16 mediaPlaybackState];
            int v23 = [v21 subtitleStateController];
            uint64_t v24 = [v16 nowPlayingSubtitle];
            if (v22 == 2) {
              uint64_t v25 = 2;
            }
            else {
              uint64_t v25 = 1;
            }
            [v23 setText:v24 forState:3 accessory:v25];
            id v5 = v16;
            goto LABEL_24;
          }
          id v5 = v16;
LABEL_26:

          goto LABEL_27;
        }
        if ([v12 type] == 3 || objc_msgSend(v12, "type") == 4)
        {
          uint64_t v13 = [v12 mainRoute];
          if ([v13 isGroup])
          {
            uint64_t v26 = [v13 preferredSubroute];
            int v27 = [v26 device];
            char v28 = [v27 identifier];
            [v5 identifier];
            id v30 = v29 = v5;
            char v31 = [v28 isEqualToString:v30];

            id v5 = v29;
            if ((v31 & 1) == 0)
            {
LABEL_25:
              double v9 = v41;
              goto LABEL_26;
            }
          }
          else
          {
            long long v32 = [v13 device];
            long long v33 = [v32 identifier];
            id v34 = [v5 identifier];
            int v35 = [v33 isEqualToString:v34];

            if (!v35) {
              goto LABEL_25;
            }
          }
          long long v36 = [(MRURoutingViewController *)v41 view];
          BOOL v37 = [v36 tableView];
          char v21 = [v37 cellForRowAtIndexPath:v11];

          if (!v21) {
            goto LABEL_25;
          }
          uint64_t v38 = [v5 mediaPlaybackState];
          int v23 = [v21 subtitleStateController];
          uint64_t v24 = [v5 nowPlayingSubtitle];
          if (v38 == 2) {
            uint64_t v39 = 2;
          }
          else {
            uint64_t v39 = 1;
          }
          [v23 setText:v24 forState:3 accessory:v39];
          double v9 = v41;
LABEL_24:

          goto LABEL_26;
        }
LABEL_27:
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v43);
  }
}

- (void)vendorSpecificCellDidTapToExpand:(id)a3
{
  id v4 = a3;
  id v5 = [(MRURoutingViewController *)self view];
  BOOL v6 = [v5 tableView];
  id obj = [v6 indexPathForCell:v4];

  id v7 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:obj];
  double v8 = [v7 mainRoute];

  double v9 = [v8 routeUID];
  mostRecentlyInteractedVendorSpecificGroupRouteID = self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
  self->_mostRecentlyInteractedVendorSpecificGroupRouteID = v9;

  objc_msgSend(v8, "setExpanded:", objc_msgSend(v4, "showChevronExpanded"));
  [(MRURoutingViewController *)self updateVendorSpecificGroupExpandedRecordFor:v8];
  LODWORD(v7) = [v4 showChevronExpanded];

  if (v7) {
    objc_storeStrong((id *)&self->_vendorSpecificGroupThatWasJustExpanded, obj);
  }
  [(MRURoutingViewController *)self _refreshDisplayedRoutes];
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  unint64_t updatesSincePresentation = self->_updatesSincePresentation;
  self->_unint64_t updatesSincePresentation = updatesSincePresentation + 1;
  if (updatesSincePresentation > 4) {
    [(MRURoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
  }
  else {
    [(MRURoutingViewController *)self _updateDisplayedRoutes];
  }
}

- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v34 = v15;
  int v35 = v14;
  id v31 = v17;
  long long v33 = v16;
  if (!a5)
  {
    if (objc_msgSend(v15, "isTVRoute", v17, v16, v15, v14))
    {
      uint64_t v19 = +[MRUStringsProvider routingHijackTVTitle];
      +[MRUStringsProvider routingHijackTVMessage];
    }
    else
    {
      uint64_t v19 = +[MRUStringsProvider routingHijackSpeakerTitle];
      +[MRUStringsProvider routingHijackSpeakerMessage];
    uint64_t v20 = };
    goto LABEL_9;
  }
  if (a5 == 1)
  {
    uint64_t v19 = +[MRUStringsProvider routingHijackLocalTitle:](MRUStringsProvider, "routingHijackLocalTitle:", v16, v17, v16, v15, v14);
    uint64_t v20 = +[MRUStringsProvider routingHijackLocalMessagePresentingApp:v17 busyRouteName:v16];
LABEL_9:
    char v21 = (void *)v20;
    goto LABEL_10;
  }
  char v21 = 0;
  uint64_t v19 = 0;
LABEL_10:
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1, v31);
  int v23 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v24 = +[MRUStringsProvider routingHijackCancelTitle];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke;
  v38[3] = &unk_1E5F0EB10;
  id v25 = v18;
  id v39 = v25;
  uint64_t v26 = [v23 actionWithTitle:v24 style:1 handler:v38];
  [v22 addAction:v26];

  int v27 = (void *)MEMORY[0x1E4FB1410];
  char v28 = +[MRUStringsProvider routingHijackConfirmTitle];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2;
  v36[3] = &unk_1E5F0EB10;
  id v37 = v25;
  id v29 = v25;
  id v30 = [v27 actionWithTitle:v28 style:0 handler:v36];
  [v22 addAction:v30];

  [(MRURoutingViewController *)self showViewController:v22 sender:self];
}

uint64_t __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)routingCellDidTapToExpand:(id)a3
{
  id v17 = a3;
  id v4 = [(MRURoutingViewController *)self view];
  id v5 = [v4 tableView];
  BOOL v6 = [v5 indexPathForCell:v17];

  id v7 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v6];
  LODWORD(v5) = [v7 isExpandable];
  uint64_t v8 = [v7 type];
  if (v5)
  {
    if (v8 == 1)
    {
      double v9 = [v7 mainRoute];
      int v10 = [(MRURoutingViewController *)self groupUIDForRoute:v9];

      [(NSMutableSet *)self->_expandedGroupUIDs addObject:v10];
    }
    else
    {
      expandedRouteUIDs = self->_expandedRouteUIDs;
      int v12 = [v7 mainRoute];
      uint64_t v13 = [v12 routeUID];
      int v14 = [(NSMutableSet *)expandedRouteUIDs containsObject:v13];

      id v15 = self->_expandedRouteUIDs;
      int v10 = [v7 mainRoute];
      id v16 = [v10 routeUID];
      if (v14) {
        [(NSMutableSet *)v15 removeObject:v16];
      }
      else {
        [(NSMutableSet *)v15 addObject:v16];
      }
    }
    goto LABEL_13;
  }
  if (v8 == 4)
  {
    [(MRURoutingViewController *)self vendorSpecificCellDidTapToExpand:v17];
    goto LABEL_14;
  }
  if ([v7 type] == 7)
  {
    self->_didExpandVendorSpecificSpeakerGroup = 1;
    self->_hasUserSelections = 0;
LABEL_13:
    [(MRURoutingViewController *)self _updateDisplayedRoutes];
  }
LABEL_14:
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = [(MRURoutingViewController *)self isInCarPlay];
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_INFO, "[MRURoutingViewController] CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  [(MRURoutingViewController *)self _refreshDisplayedRoutes];
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = [(MRURoutingViewController *)self isInCarPlay];
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_INFO, "[MRURoutingViewController] CarPlay disconnected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  [(MRURoutingViewController *)self _refreshDisplayedRoutes];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

uint64_t __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke_195(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1152) = 1;
  return [*(id *)(a1 + 32) _refreshDisplayedRoutes];
}

- (void)setEndpointRoute:(id)a3
{
  id v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    msv_dispatch_on_main_queue();
  }
}

void __45__MRURoutingViewController_setEndpointRoute___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1264);
  *(void *)(v2 + 1264) = 0;

  id v4 = objc_alloc_init(MRURoutingViewControllerUpdate);
  [(MRURoutingViewControllerUpdate *)v4 setShouldReload:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 1129) = 0;
  [*(id *)(a1 + 32) _enqueueUpdate:v4];
}

- (BOOL)_operationRequiresOptimisticState:(int64_t)a3 routes:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  int v6 = (unint64_t)[v5 count] > 1;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 |= objc_msgSend(v13, "isDeviceRoute", (void)v16);
        v6 &= [v13 isSmartAudio];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);

    if (((a3 == 1) & v10) == 1 && [v7 count] == 1)
    {
      BOOL v14 = 1;
      goto LABEL_15;
    }
  }
  else
  {
  }
  if (a3 == 2) {
    BOOL v14 = v6;
  }
  else {
    BOOL v14 = 0;
  }
LABEL_15:

  return v14;
}

- (void)updateVendorSpecificSubRouteCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v7;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificSubRouteCell forIndexPath: %@", (uint8_t *)&v32, 0xCu);
  }

  uint64_t v9 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v7];
  int v10 = [v9 mainRoute];
  uint64_t v11 = [v10 protocolIcon];
  [v6 setProtocolIcon:v11];

  int v12 = [v10 protocolName];
  [v6 setProtocolName:v12];

  uint64_t v13 = [v10 protocolIcon];
  [v6 setIconImage:v13];

  BOOL v14 = [v10 protocolName];
  [v6 setTitle:v14];

  [v6 setIndentationLevel:1];
  if ([v10 isAirPlayRoute])
  {
    id v15 = [v10 underlyingNativeRoute];
    if ([v10 supportsAirPlayGrouping]) {
      BOOL v16 = [(MRURoutingViewController *)self routesContainAirPlayGroupableRoute:self->_cachedDisplayAsPickedRoutes];
    }
    else {
      BOOL v16 = 0;
    }
    BOOL v20 = [(NSArray *)self->_cachedDisplayAsPickedRoutes containsObject:v15];
    BOOL v21 = [(NSArray *)self->_cachedPendingPickedRoutes containsObject:v15];
    uint64_t v22 = [v6 routingAccessoryView];
    int v23 = v22;
    if (v21)
    {
      uint64_t v24 = 2;
    }
    else if (v20)
    {
      if (v16) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = 3;
      }
    }
    else
    {
      uint64_t v24 = v16;
    }
    [v22 setState:v24];
  }
  else
  {
    id v15 = [v10 device];
    BOOL v17 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager isGroupingAvailableForDevice:v15];
    int64_t v18 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager latestStateForDevice:v15];
    if (v18 == 10 || v18 == 30)
    {
      id v25 = [v6 routingAccessoryView];
      uint64_t v26 = v25;
      uint64_t v27 = 2;
    }
    else
    {
      if (v18 == 20)
      {
        if (v17) {
          uint64_t v19 = 4;
        }
        else {
          uint64_t v19 = 3;
        }
      }
      else
      {
        uint64_t v19 = v17;
      }
      id v25 = [v6 routingAccessoryView];
      uint64_t v26 = v25;
      uint64_t v27 = v19;
    }
    [v25 setState:v27];

    uint64_t v28 = [v15 mediaPlaybackState];
    int v23 = [v6 subtitleStateController];
    id v29 = [v15 nowPlayingSubtitle];
    if (v28 == 2) {
      uint64_t v30 = 2;
    }
    else {
      uint64_t v30 = 1;
    }
    [v23 setText:v29 forState:3 accessory:v30];
  }
  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v6, "setContentEdgeInsets:");
  id v31 = [(MRURoutingViewController *)self stylingProvider];
  [v6 setStylingProvider:v31];
}

- (void)updateVendorSpecificCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v140 = v7;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCell forIndexPath: %@", buf, 0xCu);
  }

  uint64_t v9 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v7];
  int v10 = [v9 mainRoute];
  uint64_t v11 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v10 routeName];
    v13 = int v12 = v10;
    *(_DWORD *)buf = 138412290;
    id v140 = v13;
    _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCell device: %@", buf, 0xCu);

    int v10 = v12;
  }

  v119 = [v10 device];
  if ([v10 isGroup])
  {
    [v6 setEnabled:1];
    [v6 setShowChevron:1];
    expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
    id v15 = [v10 routeUID];
    objc_msgSend(v6, "setShowChevronExpanded:", -[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v15));

    BOOL v16 = (void *)MEMORY[0x1E4FB1818];
    BOOL v17 = [(MRURoutingViewController *)self symbolNameForVendorSpecificRoute:v10];
    int64_t v18 = [v16 systemImageNamed:v17];
    [v6 setIconImage:v18];

    uint64_t v19 = [v10 routeName];
    v111 = v9;
    id v113 = v7;
    if (v19
      && (BOOL v20 = (void *)v19,
          [v10 routeName],
          BOOL v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isEqualToString:&stru_1F06524E0],
          v21,
          v20,
          (v22 & 1) == 0))
    {
      uint64_t v30 = [v10 routeName];
      [v6 setTitle:v30];
    }
    else
    {
      objc_msgSend(v6, "setTitle:", @"Unknown Device", v9, v7);
    }
    id v31 = objc_msgSend(v10, "subroutes", v111, v113);
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke;
    v133[3] = &unk_1E5F0EB38;
    id v115 = v6;
    id v134 = v115;
    v135 = self;
    v116 = objc_msgSend(v31, "msv_compactMap:", v133);

    int v32 = [v10 subroutes];
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke_2;
    v132[3] = &unk_1E5F0EB60;
    v132[4] = self;
    v117 = objc_msgSend(v32, "msv_compactMap:", v132);

    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v118 = v10;
    id v33 = [v10 subroutes];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v128 objects:v138 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v129;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v129 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void **)(*((void *)&v128 + 1) + 8 * i);
          if ([v38 isAirPlayRoute])
          {
            if ([(MRURoutingViewController *)self routesContainAirPlayGroupableRoute:self->_cachedDisplayAsPickedRoutes])
            {
              goto LABEL_25;
            }
          }
          else
          {
            vendorSpecificManager = self->_vendorSpecificManager;
            uint64_t v40 = [v38 device];
            LOBYTE(vendorSpecificManager) = [(MRUVendorSpecificDeviceManager *)vendorSpecificManager isGroupingAvailableForDevice:v40];

            if (vendorSpecificManager)
            {
LABEL_25:
              [v118 setTempPreferredSubrouteOverride:v38];

              unsigned int v41 = 1;
              goto LABEL_26;
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v128 objects:v138 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }

    [v118 setTempPreferredSubrouteOverride:0];
    unsigned int v41 = 0;
LABEL_26:
    uint64_t v42 = v116;
    uint64_t v43 = v119;
    long long v44 = v117;
    if ([v116 count])
    {
      if ([v116 count] == 1)
      {
        long long v45 = [v116 firstObject];
        uint64_t v46 = 3;
        goto LABEL_75;
      }
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v56 = v116;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v120 objects:v136 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        long long v45 = 0;
        uint64_t v59 = *(void *)v121;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v121 != v59) {
              objc_enumerationMutation(v56);
            }
            v61 = *(void **)(*((void *)&v120 + 1) + 8 * j);
            if (([v61 isAirPlayRoute] & 1) == 0)
            {
              id v62 = v61;

              long long v45 = v62;
            }
          }
          uint64_t v58 = [v56 countByEnumeratingWithState:&v120 objects:v136 count:16];
        }
        while (v58);
      }
      else
      {
        long long v45 = 0;
      }

      uint64_t v46 = 3;
    }
    else
    {
      if (![v117 count])
      {
        v70 = [v118 preferredSubroute];

        if (v70)
        {
          long long v45 = [v118 preferredSubroute];
          uint64_t v46 = 1;
        }
        else
        {
          uint64_t v46 = 0;
          long long v45 = 0;
        }
        uint64_t v43 = v119;
LABEL_75:
        vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
        v79 = [v118 routeUID];
        [(NSMutableDictionary *)vendorSpecificGroupDisplayedSubroutes setObject:v45 forKeyedSubscript:v79];

        if (!v45) {
          goto LABEL_110;
        }
        long long v80 = [v45 protocolIcon];
        [v115 setProtocolIcon:v80];

        long long v81 = [v45 protocolName];
        [v115 setProtocolName:v81];

        if ([v115 showChevronExpanded]) {
          goto LABEL_110;
        }
        int v82 = [v45 isAirPlayRoute];
        long long v83 = [v115 subtitleStateController];
        long long v84 = [v115 protocolName];
        if (v82)
        {
          [v83 setText:v84 forState:6];
        }
        else
        {
          long long v85 = [v115 protocolIcon];
          [v83 setText:v84 icon:v85 forState:6];
        }
        if (v46 == 3)
        {
          if (v41) {
            uint64_t v87 = 4;
          }
          else {
            uint64_t v87 = 3;
          }
          v88 = [v115 routingAccessoryView];
          [v88 setState:v87];

          if ([v45 isAirPlayRoute])
          {
            v89 = [v45 underlyingNativeRoute];
            if ([(NSArray *)self->_cachedVolumeCapableRoutes containsObject:v89])
            {
              outputDeviceVolumeControllers = self->_outputDeviceVolumeControllers;
              v91 = [v89 routeUID];
              uint64_t v92 = [(NSDictionary *)outputDeviceVolumeControllers objectForKeyedSubscript:v91];
              [v115 setVolumeController:v92];
            }
            goto LABEL_96;
          }
        }
        else
        {
          if (v46 == 2)
          {
            v89 = [v115 routingAccessoryView];
            [v89 setState:2];
LABEL_96:

            goto LABEL_97;
          }
          if (v46 != 1
            || ([v115 routingAccessoryView],
                long long v86 = objc_claimAutoreleasedReturnValue(),
                [v86 setState:v41],
                v86,
                ([v45 isAirPlayRoute] & 1) != 0))
          {
LABEL_97:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v98 = v118;
              [v98 setHearingAidDelegate:self];
              if ([v98 isConnecting])
              {
                v99 = [v115 routingAccessoryView];
                [v99 setState:2];
              }
            }
            if ([v45 isAirPlayRoute])
            {
              v100 = [v45 underlyingNativeRoute];
              uint64_t v43 = v119;
              if (![(NSArray *)self->_cachedVolumeCapableRoutes containsObject:v100])
              {
LABEL_109:

                long long v44 = v117;
LABEL_110:

                BOOL v67 = v134;
                uint64_t v9 = v112;
                id v7 = v114;
                int v10 = v118;
                goto LABEL_111;
              }
              v101 = self->_outputDeviceVolumeControllers;
              v102 = [v100 routeUID];
              v103 = [(NSDictionary *)v101 objectForKeyedSubscript:v102];
              [v115 setVolumeController:v103];
            }
            else
            {
              v104 = [v115 subtitleStateController];
              v105 = [v115 protocolName];
              v106 = [v115 protocolIcon];
              [v104 setText:v105 icon:v106 forState:6];

              v107 = [v45 device];
              uint64_t v108 = [v107 mediaPlaybackState];

              v100 = [v115 subtitleStateController];
              v102 = [v45 device];
              v103 = [v102 nowPlayingSubtitle];
              if (v108 == 2) {
                uint64_t v109 = 2;
              }
              else {
                uint64_t v109 = 1;
              }
              [v100 setText:v103 forState:3 accessory:v109];
              uint64_t v43 = v119;
            }

            goto LABEL_109;
          }
        }
        v93 = [v45 device];
        uint64_t v94 = [v93 mediaPlaybackState];

        v89 = [v115 subtitleStateController];
        v95 = [v45 device];
        v96 = [v95 nowPlayingSubtitle];
        if (v94 == 2) {
          uint64_t v97 = 2;
        }
        else {
          uint64_t v97 = 1;
        }
        [v89 setText:v96 forState:3 accessory:v97];

        goto LABEL_96;
      }
      if ([v117 count] == 1)
      {
        long long v45 = [v117 firstObject];
        uint64_t v46 = 2;
        goto LABEL_75;
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v71 = v117;
      uint64_t v72 = [v71 countByEnumeratingWithState:&v124 objects:v137 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        long long v45 = 0;
        uint64_t v74 = *(void *)v125;
        do
        {
          for (uint64_t k = 0; k != v73; ++k)
          {
            if (*(void *)v125 != v74) {
              objc_enumerationMutation(v71);
            }
            uint64_t v76 = *(void **)(*((void *)&v124 + 1) + 8 * k);
            if (([v76 isAirPlayRoute] & 1) == 0)
            {
              id v77 = v76;

              long long v45 = v77;
            }
          }
          uint64_t v73 = [v71 countByEnumeratingWithState:&v124 objects:v137 count:16];
        }
        while (v73);
      }
      else
      {
        long long v45 = 0;
      }

      uint64_t v46 = 2;
    }
    uint64_t v43 = v119;
    uint64_t v42 = v116;
    long long v44 = v117;
    goto LABEL_75;
  }
  [v6 setShowChevron:0];
  int v23 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v24 = [(MRURoutingViewController *)self symbolNameForVendorSpecificRoute:v10];
  id v25 = [v23 systemImageNamed:v24];
  [v6 setIconImage:v25];

  uint64_t v26 = [v10 routeName];
  if (v26
    && (uint64_t v27 = (void *)v26,
        [v10 routeName],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 isEqualToString:&stru_1F06524E0],
        v28,
        v27,
        (v29 & 1) == 0))
  {
    long long v47 = [v10 routeName];
    [v6 setTitle:v47];
  }
  else
  {
    [v6 setTitle:@"Unknown Device"];
  }
  uint64_t v48 = [v10 protocolIcon];
  [v6 setProtocolIcon:v48];

  uint64_t v49 = [v10 protocolName];
  [v6 setProtocolName:v49];

  BOOL v50 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager isGroupingAvailableForDevice:v119];
  uint64_t v43 = v119;
  int64_t v51 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager latestStateForDevice:v119];
  if (v51 == 10 || v51 == 30)
  {
    v53 = [v6 routingAccessoryView];
    v54 = v53;
    uint64_t v55 = 2;
  }
  else
  {
    if (v51 == 20)
    {
      if (v50) {
        uint64_t v52 = 4;
      }
      else {
        uint64_t v52 = 3;
      }
    }
    else
    {
      uint64_t v52 = v50;
    }
    v53 = [v6 routingAccessoryView];
    v54 = v53;
    uint64_t v55 = v52;
  }
  [v53 setState:v55];

  v63 = [v6 subtitleStateController];
  v64 = [v6 protocolName];
  int v65 = [v6 protocolIcon];
  [v63 setText:v64 icon:v65 forState:6];

  uint64_t v66 = [v119 mediaPlaybackState];
  BOOL v67 = [v6 subtitleStateController];
  v68 = [v119 nowPlayingSubtitle];
  if (v66 == 2) {
    uint64_t v69 = 2;
  }
  else {
    uint64_t v69 = 1;
  }
  [v67 setText:v68 forState:3 accessory:v69];

LABEL_111:
  [v6 setDelegate:self];
  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v6, "setContentEdgeInsets:");
  v110 = [(MRURoutingViewController *)self stylingProvider];
  [v6 setStylingProvider:v110];
}

id __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAirPlayRoute])
  {
    id v4 = [v3 underlyingNativeRoute];
    int v5 = [v4 isMacRoute];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F31850];
      id v7 = [v3 underlyingNativeRoute];
      uint64_t v8 = [v6 _symbolImageForRoute:v7];
      [*(id *)(a1 + 32) setIconImage:v8];
    }
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 1040);
    int v10 = [v3 underlyingNativeRoute];
    LOBYTE(v9) = [v9 containsObject:v10];

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else
  {
    int v12 = *(void **)(*(void *)(a1 + 40) + 1088);
    uint64_t v13 = [v3 routeUID];
    LODWORD(v12) = [v12 containsObject:v13];

    if (!v12)
    {
LABEL_5:
      id v11 = 0;
      goto LABEL_8;
    }
  }
  id v11 = v3;
LABEL_8:

  return v11;
}

id __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isAirPlayRoute];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = *(void **)(v5 + 1032);
    id v7 = [v3 underlyingNativeRoute];
    LOBYTE(v6) = [v6 containsObject:v7];

    if ((v6 & 1) == 0)
    {
LABEL_3:
      id v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = *(void **)(v5 + 1096);
    int v10 = [v3 routeUID];
    LODWORD(v9) = [v9 containsObject:v10];

    if (!v9) {
      goto LABEL_3;
    }
  }
  id v8 = v3;
LABEL_6:

  return v8;
}

- (void)updateVendorSpecificCustomRowCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCustomRowCell forIndexPath: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v9 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v6];
  int v10 = [v9 image];
  [v7 setIconImage:v10];

  id v11 = [v9 localizedTitle];
  [v7 setTitle:v11];

  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v7, "setContentEdgeInsets:");
  int v12 = [(MRURoutingViewController *)self stylingProvider];
  [v7 setStylingProvider:v12];
}

- (void)updateVendorSpecificSpeakerGroupCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificSpeakerGroupCell forIndexPath: %@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v9 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v6];
  [v7 setEnabled:1];
  [v7 setShowChevron:1];
  [v7 setShowChevronExpanded:self->_didExpandVendorSpecificSpeakerGroup];
  int v10 = [v9 leader];
  id v11 = (void *)MEMORY[0x1E4FB1818];
  int v12 = [(MRURoutingViewController *)self symbolNameForVendorSpecificRoute:v10];
  int v13 = [v11 systemImageNamed:v12];
  [v7 setIconImage:v13];

  [v7 setDelegate:self];
  id v14 = [v9 localizedTitle];
  [v7 setTitle:v14];

  uint64_t v15 = [v7 subtitleStateController];
  BOOL v16 = [v9 localizedSubtitle];
  [v15 setText:v16 forState:4];

  BOOL v17 = [v7 routingAccessoryView];
  [v17 setState:4];

  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v7, "setContentEdgeInsets:");
  int64_t v18 = [(MRURoutingViewController *)self stylingProvider];
  [v7 setStylingProvider:v18];
}

- (void)updateCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:a4];
  id v8 = [v7 mainRoute];
  uint64_t v9 = [v8 routeUID];
  int v10 = [v7 image];
  if (v10)
  {

LABEL_3:
    uint64_t v11 = [v7 image];
    goto LABEL_4;
  }
  id v33 = [v7 mainRoute];

  if (!v33) {
    goto LABEL_3;
  }
  uint64_t v34 = [v7 type];
  uint64_t v35 = (void *)MEMORY[0x1E4F31850];
  if (v34 == 1)
  {
    int v12 = [v7 routes];
    uint64_t v36 = [v35 _symbolImageForRoutes:v12];
    [v6 setIconImage:v36];

    goto LABEL_5;
  }
  uint64_t v11 = [MEMORY[0x1E4F31850] _symbolImageForRoute:v8];
LABEL_4:
  int v12 = (void *)v11;
  [v6 setIconImage:v11];
LABEL_5:

  if (!-[MRURoutingViewController routesContainMultipleBuiltIn:](self, "routesContainMultipleBuiltIn:", self->_cachedDisplayableAvailableRoutes)&& ([v8 routeSubtype] == 1 || objc_msgSend(v8, "routeSubtype") == 3))
  {
    uint64_t v13 = MSVCopyLocalizedModelName();
  }
  else
  {
    uint64_t v13 = [v7 localizedTitle];
  }
  id v14 = (void *)v13;
  [v6 setTitle:v13];

  uint64_t v15 = [v6 subtitleStateController];
  BOOL v16 = [v8 routingBatteryTextWithFormatter:self->_percentageFormatter];
  [v15 setText:v16 forState:1];

  BOOL v17 = [v6 subtitleStateController];
  int64_t v18 = [v8 routingPairedDeviceText];
  [v17 setText:v18 forState:2];

  int v19 = [v6 subtitleStateController];
  id v20 = [v7 localizedSubtitle];
  [v19 setText:v20 forState:4];

  if (v9)
  {
    uint64_t v21 = [(NSDictionary *)self->_indexedNowPlayingControllers objectForKeyedSubscript:v9];
    char v22 = [v21 metadataController];
    int v23 = [v22 nowPlayingInfo];

    int64_t v24 = [(MRURoutingViewController *)self subtitleAccessoryForItem:v7 nowPlayingInfo:v23];
    id v25 = [v6 subtitleStateController];
    uint64_t v26 = [v23 stringForComponents:59];
    [v25 setText:v26 forState:3 accessory:v24];
  }
  uint64_t v27 = [v7 mainRoute];
  uint64_t v74 = (void *)v9;
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    char v29 = [MEMORY[0x1E4F77108] currentSettings];
    int v30 = [v29 addDebugBadgeToRecommendedRoutes];

    if (v30)
    {
      id v31 = [v7 mainRoute];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v32 = [v31 outputDevice];
      }
      else
      {
        int v32 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v37 = v32;
      }
      else {
        id v37 = 0;
      }
      id v38 = v37;
      id v39 = [v38 recommendation];
      uint64_t v40 = [v39 reason];
      unsigned int v41 = (void *)v40;
      uint64_t v42 = @"(no reason provided)";
      if (v40) {
        uint64_t v42 = (__CFString *)v40;
      }
      uint64_t v43 = v42;

      long long v44 = [v38 recommendation];
      long long v45 = [v44 sortingHint];

      if (v45)
      {
        uint64_t v46 = NSString;
        long long v47 = [v38 recommendation];
        [v47 sortingHint];
        uint64_t v72 = v32;
        v49 = uint64_t v48 = v31;
        uint64_t v50 = [v46 stringWithFormat:@"Hint: %@, %@", v49, v43];

        id v31 = v48;
        int v32 = v72;

        uint64_t v43 = (__CFString *)v50;
      }
      int64_t v51 = [v6 subtitleStateController];
      [v51 setText:v43 forState:5];
    }
  }
  uint64_t v52 = [v7 mainRoute];
  v53 = [v52 routeUID];
  [v6 setAccessibilityIdentifier:v53];

  if ([v8 isSplitterCapable])
  {
    BOOL v54 = [(MRURoutingViewController *)self routesContainSplitterCapableRoute:self->_cachedDisplayAsPickedRoutes];
LABEL_32:
    LODWORD(v55) = v54;
    goto LABEL_34;
  }
  if ([v8 supportsAirPlayGrouping])
  {
    BOOL v54 = [(MRURoutingViewController *)self routesContainAirPlayGroupableRoute:self->_cachedDisplayAsPickedRoutes];
    goto LABEL_32;
  }
  LODWORD(v55) = 0;
LABEL_34:
  uint64_t v73 = [v7 type];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v56 = [v7 routes];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (!v57)
  {

    if (![(MRURoutingViewController *)self shouldSuppressNativeRoutesStatusDisplay])goto LABEL_50; {
LABEL_45:
    }
    BOOL v67 = [v6 routingAccessoryView];
    [v67 setState:0];
    v68 = v74;
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v58 = v57;
  int v70 = v55;
  id v71 = v6;
  int v59 = 0;
  int v60 = 0;
  uint64_t v61 = *(void *)v76;
  do
  {
    for (uint64_t i = 0; i != v58; ++i)
    {
      if (*(void *)v76 != v61) {
        objc_enumerationMutation(v56);
      }
      uint64_t v63 = *(void *)(*((void *)&v75 + 1) + 8 * i);
      v59 |= [(NSArray *)self->_cachedDisplayAsPickedRoutes containsObject:v63];
      v60 |= [(NSArray *)self->_cachedPendingPickedRoutes containsObject:v63];
    }
    uint64_t v58 = [v56 countByEnumeratingWithState:&v75 objects:v79 count:16];
  }
  while (v58);

  id v6 = v71;
  LODWORD(v55) = v70;
  if ([(MRURoutingViewController *)self shouldSuppressNativeRoutesStatusDisplay])
  {
    goto LABEL_45;
  }
  if ((v60 & 1) == 0)
  {
    if (v59)
    {
      if (v70) {
        uint64_t v55 = 4;
      }
      else {
        uint64_t v55 = 3;
      }
      goto LABEL_51;
    }
LABEL_50:
    uint64_t v55 = v55;
LABEL_51:
    v64 = [v6 routingAccessoryView];
    int v65 = v64;
    uint64_t v66 = v55;
    goto LABEL_52;
  }
  v64 = [v71 routingAccessoryView];
  int v65 = v64;
  uint64_t v66 = 2;
LABEL_52:
  [v64 setState:v66];
  v68 = v74;

  if ([(NSArray *)self->_cachedVolumeCapableRoutes containsObject:v8] && v74 && v73 != 1)
  {
    BOOL v67 = [(NSDictionary *)self->_outputDeviceVolumeControllers objectForKey:v74];
    [v6 setVolumeController:v67];
    goto LABEL_56;
  }
LABEL_57:
  [v6 setDelegate:self];
  objc_msgSend(v6, "setShowChevron:", objc_msgSend(v7, "isExpandable"));
  objc_msgSend(v6, "setShowChevronExpanded:", -[NSMutableSet containsObject:](self->_expandedRouteUIDs, "containsObject:", v68));
  objc_msgSend(v6, "setIndentationLevel:", objc_msgSend(v7, "nestedLevel"));
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "enabled"));
  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v6, "setContentEdgeInsets:");
  uint64_t v69 = [(MRURoutingViewController *)self stylingProvider];
  [v6 setStylingProvider:v69];
}

- (void)updateHeaderView:(id)a3 forSection:(int64_t)a4
{
  routingViewItems = self->_routingViewItems;
  id v7 = a3;
  id v8 = [(MPSectionedCollection *)routingViewItems sectionAtIndex:a4];
  [v7 setTitle:v8];

  [(MRURoutingViewController *)self contentEdgeInsets];
  objc_msgSend(v7, "setContentEdgeInsets:");
  id v9 = [(MRURoutingViewController *)self stylingProvider];
  [v7 setStylingProvider:v9];
}

- (void)showMoreAction
{
  self->_didSelectShowMore = 1;
  [(MRURoutingViewController *)self _updateDisplayedRoutes];
}

- (void)updateNowPlayingControllersForRoutes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v41;
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v6;
      do
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v31 = v8;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v34 = self->_nowPlayingControllers;
          uint64_t v10 = [(NSArray *)v34 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v37;
            int v32 = v9;
            while (2)
            {
              uint64_t v13 = 0;
              uint64_t v33 = v11;
              do
              {
                if (*(void *)v37 != v12) {
                  objc_enumerationMutation(v34);
                }
                id v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
                uint64_t v15 = objc_msgSend(v14, "identifier", v27);
                BOOL v16 = [v14 endpointController];
                BOOL v17 = [v9 routeUID];
                if ([v16 containsOutputDeviceWithRouteUID:v17]
                  && ([v9 routeUID], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  int v19 = (void *)v18;
                  uint64_t v20 = v12;
                  [(MRURoutingViewController *)self endpointRoute];
                  v22 = uint64_t v21 = self;
                  int v23 = [v22 routeUID];
                  if (![v23 isEqualToString:v15])
                  {

                    self = v21;
                    id v9 = v32;
LABEL_22:
                    int64_t v24 = [v9 routeUID];
                    [v27 setObject:v14 forKeyedSubscript:v24];

                    [v14 addObserver:self];
                    [v14 updateAutomaticResponseLoading];

                    goto LABEL_23;
                  }
                  BOOL showMetadataForEndpointRoute = v21->_showMetadataForEndpointRoute;

                  self = v21;
                  uint64_t v12 = v20;
                  id v9 = v32;
                  uint64_t v11 = v33;
                  if (showMetadataForEndpointRoute) {
                    goto LABEL_22;
                  }
                }
                else
                {
                }
                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [(NSArray *)v34 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
LABEL_23:

          uint64_t v7 = v28;
          uint64_t v6 = v29;
          uint64_t v8 = v31;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v6);
  }

  id v25 = (NSDictionary *)[v27 copy];
  indexedNowPlayingControllers = self->_indexedNowPlayingControllers;
  self->_indexedNowPlayingControllers = v25;
}

- (void)updateMetadata
{
  uint64_t v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v3 = self->_nowPlayingControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) updateAutomaticResponseLoading];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v5);
  }

  if (v2->_onScreen)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v8 = [(MRURoutingViewController *)v2 view];
    id v9 = [v8 tableView];
    uint64_t v10 = [v9 indexPathsForVisibleRows];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      id v14 = &OBJC_IVAR___MRUMediaSuggestionCollectionViewCell__layout;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          BOOL v17 = [*(id *)((char *)&v2->super.super.super.isa + v14[451]) safeItemAtIndexPath:v16];
          uint64_t v18 = [v17 type];
          uint64_t v19 = [v17 type];
          uint64_t v20 = [v17 type];
          uint64_t v21 = [v17 type];
          if (v18 != 3 && v19 != 4 && v20 != 5 && v21 != 6)
          {
            indexedNowPlayingControllers = v2->_indexedNowPlayingControllers;
            uint64_t v26 = [v17 mainRoute];
            uint64_t v27 = [v26 routeUID];
            long long v41 = [(NSDictionary *)indexedNowPlayingControllers objectForKeyedSubscript:v27];

            uint64_t v28 = [(MRURoutingViewController *)v2 view];
            uint64_t v29 = [v28 tableView];
            long long v40 = [v29 cellForRowAtIndexPath:v16];

            int v30 = [v41 metadataController];
            uint64_t v31 = [v30 nowPlayingInfo];

            uint64_t v32 = [(MRURoutingViewController *)v2 subtitleAccessoryForItem:v17 nowPlayingInfo:v31];
            [v40 subtitleStateController];
            uint64_t v33 = v2;
            uint64_t v34 = v14;
            v36 = uint64_t v35 = v13;
            [v31 stringForComponents:59];
            v38 = uint64_t v37 = v12;
            [v36 setText:v38 forState:3 accessory:v32];

            uint64_t v12 = v37;
            uint64_t v13 = v35;
            id v14 = v34;
            uint64_t v2 = v33;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v12);
    }
  }
}

- (void)updateMetadataForNowPlayingController:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MRURoutingViewController *)self view];
  uint64_t v6 = [v5 tableView];
  uint64_t v7 = [v6 indexPathsForVisibleRows];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v7;
  uint64_t v32 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    uint64_t v9 = *(void *)v34;
    uint64_t v31 = self;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v12 = -[MPSectionedCollection safeItemAtIndexPath:](self->_routingViewItems, "safeItemAtIndexPath:", v11, v31);
        uint64_t v13 = [v12 mainRoute];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          indexedNowPlayingControllers = self->_indexedNowPlayingControllers;
          uint64_t v16 = [v12 mainRoute];
          BOOL v17 = [v16 routeUID];
          id v18 = [(NSDictionary *)indexedNowPlayingControllers objectForKeyedSubscript:v17];

          if (v18 == v4)
          {
            uint64_t v19 = [(MRURoutingViewController *)self view];
            uint64_t v20 = [v19 tableView];
            uint64_t v21 = [v20 cellForRowAtIndexPath:v11];

            char v22 = [v4 metadataController];
            int v23 = [v22 nowPlayingInfo];

            int64_t v24 = [(MRURoutingViewController *)self subtitleAccessoryForItem:v12 nowPlayingInfo:v23];
            id v25 = v21;
            uint64_t v26 = [v21 subtitleStateController];
            [v23 stringForComponents:59];
            uint64_t v27 = v9;
            id v28 = v8;
            int v30 = v29 = v4;
            [v26 setText:v30 forState:3 accessory:v24];

            id v4 = v29;
            id v8 = v28;
            uint64_t v9 = v27;

            self = v31;
          }
        }
      }
      uint64_t v32 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }
}

- (void)updateSubtitle
{
  BOOL onScreen = self->_onScreen;
  subtitleUpdateTimer = self->_subtitleUpdateTimer;
  if (onScreen)
  {
    if (!subtitleUpdateTimer)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F31A98]);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __42__MRURoutingViewController_updateSubtitle__block_invoke;
      v9[3] = &unk_1E5F0D7F8;
      v9[4] = self;
      uint64_t v6 = (MPWeakTimer *)[v5 initWithInterval:MEMORY[0x1E4F14428] queue:v9 block:0.24 * 2.0 + 4.0];
      uint64_t v7 = self->_subtitleUpdateTimer;
      self->_subtitleUpdateTimer = v6;
    }
  }
  else
  {
    [(MPWeakTimer *)subtitleUpdateTimer invalidate];
    id v8 = self->_subtitleUpdateTimer;
    self->_subtitleUpdateTimer = 0;
  }
}

void __42__MRURoutingViewController_updateSubtitle__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "view", 0);
  id v3 = [v2 tableView];
  id v4 = [v3 indexPathsForVisibleRows];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = [*(id *)(a1 + 32) view];
        uint64_t v11 = [v10 tableView];
        uint64_t v12 = [v11 cellForRowAtIndexPath:v9];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v12 transitionToNextVisibleStateWithDuration:0.24];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (int64_t)subtitleAccessoryForItem:(id)a3 nowPlayingInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 type];
  if (v7 == 1)
  {
    if ([v6 isPlaying]) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else if (v7)
  {
    int64_t v9 = 0;
  }
  else if ([v6 isPlaying])
  {
    uint64_t v8 = [v5 mainRoute];
    if ([v8 isProxyGroupPlayer]) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (BOOL)_wouldShareAudioForPickedRoute:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int64_t v9 = [v8 firstObject];
  if (a4 == 1 && [v8 count] == 1 && objc_msgSend(v7, "supportsGrouping")) {
    char v10 = [v9 supportsGrouping];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_wouldEndGroupSessionForViewItem:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5
{
  id v7 = a5;
  id v8 = [a3 routes];
  int64_t v9 = (void *)[v7 mutableCopy];
  switch(a4)
  {
    case 0:
      goto LABEL_9;
    case 1:
      long long v16 = [v7 firstObject];
      if ([v16 supportsGrouping])
      {
        BOOL v17 = [v8 firstObject];
        int v18 = [v17 supportsGrouping];

        if (v18)
        {
          id v19 = (id)[v7 arrayByAddingObjectsFromArray:v8];
          break;
        }
      }
      else
      {
      }
LABEL_9:
      uint64_t v20 = [v8 mutableCopy];

      int64_t v9 = (void *)v20;
      break;
    case 2:
      char v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_msgSend(v8, "msv_map:", &__block_literal_global_213);
      uint64_t v12 = [v10 setWithArray:v11];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_2;
      v24[3] = &unk_1E5F0EBA8;
      id v25 = v12;
      id v13 = v12;
      long long v14 = objc_msgSend(v9, "msv_filter:", v24);
      uint64_t v15 = [v14 mutableCopy];

      int64_t v9 = (void *)v15;
      break;
  }
  uint64_t v21 = objc_msgSend(v9, "msv_compactMap:", &__block_literal_global_217);
  BOOL v22 = MRGroupSessionRouteTypeForOutputDevices() == 0;

  return v22;
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 routeUID];
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 routeUID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 outputDevice];
}

- (void)handleGroupSessionJoinWithPickedRoute:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F76F58];
  v11[0] = &unk_1F069F170;
  uint64_t v5 = *MEMORY[0x1E4F76F50];
  v10[0] = v4;
  v10[1] = v5;
  id v6 = [v3 discoveredGroupSession];
  id v7 = [v6 identifier];
  v10[2] = *MEMORY[0x1E4F76F60];
  v11[1] = v7;
  v11[2] = MEMORY[0x1E4F1CC38];
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v9 = v3;
  MRGroupSessionSendEvent();
}

void __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke(int8x16_t *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = MCLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = a1[2].i64[0];
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_ERROR, "[MRURoutingViewController] Failed to launch Music for group session: %{public}@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke_220;
  block[3] = &unk_1E5F0D8E8;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke_220(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F31858] itemWithRoute:*(void *)(a1 + 40)];
    [v6 routingViewController:v4 didSelectRoutingViewItem:v5];
  }
}

- (void)_displayShareAudioDisabledAlertForReason:(id)a3
{
  id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:a3 preferredStyle:1];
  uint64_t v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = +[MRUStringsProvider ok];
  id v6 = [v4 actionWithTitle:v5 style:0 handler:0];
  [v7 addAction:v6];

  [(MRURoutingViewController *)self showViewController:v7 sender:self];
}

- (void)_displayEndGroupSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v8 = +[MRUStringsProvider groupSessionEndTitle];
  id v5 = +[MRUStringsProvider groupSessionEndBody];
  id v6 = +[MRUStringsProvider groupSessionEndConfirm];
  id v7 = +[MRUStringsProvider groupSessionEndCancel];
  [(MRURoutingViewController *)self _displayGroupSessionAlertWithTitle:v8 body:v5 confirmTitle:v6 cancelTitle:v7 completion:v4];
}

- (void)_displayGroupSessionAlertWithTitle:(id)a3 body:(id)a4 confirmTitle:(id)a5 cancelTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = (void *)MEMORY[0x1E4FB1418];
  id v14 = a6;
  id v15 = a5;
  long long v16 = [v13 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  BOOL v17 = (void *)MEMORY[0x1E4FB1410];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke;
  v28[3] = &unk_1E5F0EB10;
  id v18 = v12;
  id v29 = v18;
  id v19 = [v17 actionWithTitle:v15 style:2 handler:v28];

  [v16 addAction:v19];
  uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke_2;
  uint64_t v26 = &unk_1E5F0EB10;
  id v27 = v18;
  id v21 = v18;
  BOOL v22 = [v20 actionWithTitle:v14 style:0 handler:&v23];

  objc_msgSend(v16, "addAction:", v22, v23, v24, v25, v26);
  [(MRURoutingViewController *)self showViewController:v16 sender:self];
}

uint64_t __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setNeedsRouteDiscoveryModeUpdate
{
  if (self->_onScreen) {
    int64_t discoveryMode = self->_discoveryMode;
  }
  else {
    int64_t discoveryMode = 0;
  }
  if ([(MPAVRoutingController *)self->_routingController discoveryMode] != discoveryMode)
  {
    [(MPAVRoutingController *)self->_routingController setDiscoveryMode:discoveryMode];
    notify_post("com.apple.airplay.startlogging");
  }
}

- (void)_setNeedsDisplayedRoutesUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MRURoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__MRURoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1151) = 1;
  return [*(id *)(a1 + 32) _setupUpdateTimerIfNecessary];
}

- (void)_setupUpdateTimerIfNecessary
{
  if (self->_onScreen && !self->_updateTimer)
  {
    id v3 = MEMORY[0x1E4F14428];
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x1E4F31A98]);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __56__MRURoutingViewController__setupUpdateTimerIfNecessary__block_invoke;
    uint64_t v10 = &unk_1E5F0DA00;
    objc_copyWeak(&v11, &location);
    id v5 = (MPWeakTimer *)[v4 initWithInterval:MEMORY[0x1E4F14428] queue:&v7 block:2.0];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v5;

    [(MRURoutingViewController *)self _updateDisplayedRoutes];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__MRURoutingViewController__setupUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained needsDisplayedRoutesUpdate]) {
    [WeakRetained _updateDisplayedRoutes];
  }
}

- (void)_updateGroupSessionDiscovery
{
  presentingAppBundleID = self->_presentingAppBundleID;
  if (presentingAppBundleID)
  {
    id v4 = presentingAppBundleID;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v5 bundleIdentifier];

    id v4 = v9;
  }
  uint64_t v10 = v4;
  char v6 = MRBundlePermittedForGroupSessions();
  groupSessionDiscovery = self->_groupSessionDiscovery;
  if (v6)
  {
    if (!groupSessionDiscovery)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F77040]) initWithDelegate:self];
      [(MRURoutingViewController *)self setGroupSessionDiscovery:v8];
    }
  }
  else if (groupSessionDiscovery)
  {
    [(MRURoutingViewController *)self setGroupSessionDiscovery:0];
  }
}

- (id)_displayableRoutesInRoutes:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F77108] currentSettings];
  int v6 = [v5 supportRouteRecommendations];

  if (v6)
  {
    uint64_t v7 = [(MRURoutingViewController *)self _recommendedRoutesFromRoutes:v4];

    id v4 = (id)v7;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  id v9 = [MEMORY[0x1E4F77108] currentSettings];
  uint64_t v10 = [v9 routePickerAirPlayAllowList];

  id v11 = [MEMORY[0x1E4F77108] currentSettings];
  id v12 = [v11 routePickerAirPlayDenyList];

  if ([v10 count])
  {
    id v13 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    id v14 = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke;
    id v15 = v10;
  }
  else
  {
    if (![v12 count]) {
      goto LABEL_8;
    }
    id v13 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v14 = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_2;
    id v15 = v12;
  }
  v13[2] = v14;
  v13[3] = &unk_1E5F0EBA8;
  v13[4] = v15;
  long long v16 = objc_msgSend(v4, "msv_filter:", v13);
  uint64_t v17 = [v16 mutableCopy];

  uint64_t v8 = (void *)v17;
LABEL_8:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_3;
  v19[3] = &unk_1E5F0EC18;
  v19[4] = self;
  v19[5] = 577;
  [v8 sortUsingComparator:v19];

  return v8;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAirPlayRoute])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 routeUID];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAirPlayRoute])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 routeUID];
    uint64_t v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 1129))
  {
    unint64_t v8 = [*(id *)(v7 + 1024) indexOfObject:v5];
    unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1024) indexOfObject:v6];
    uint64_t v10 = v8 < v9 ? -1 : 1;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_87;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 1160) dataSource];
      int v54 = [v13 routeIsLeaderOfEndpoint:v5];

      id v14 = [*(id *)(*(void *)(a1 + 32) + 1160) dataSource];
      int v53 = [v14 routeIsLeaderOfEndpoint:v6];

      int v58 = [v5 supportsGrouping];
      int v57 = [v6 supportsGrouping];
      int v56 = [v5 isHomePodRoute];
      int v55 = [v6 isHomePodRoute];
      int v15 = [v5 isW1Route];
      int v16 = [v6 isW1Route];
      int v17 = [v5 isH1Route];
      int v18 = [v6 isH1Route];
      int v19 = [v5 isDisplayedAsPicked];
      int v68 = [v6 isDisplayedAsPicked];
      if ([v5 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v5, "isTVRoute")) {
        int v62 = 1;
      }
      else {
        int v62 = [v5 containsDeviceWithSubtype:18];
      }
      int v64 = v16;
      int v65 = v15;
      int v66 = v18;
      int v67 = v17;
      int v69 = v19;
      if ([v6 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v6, "isTVRoute")) {
        int v61 = 1;
      }
      else {
        int v61 = [v6 containsDeviceWithSubtype:18];
      }
      int v60 = [v5 supportsGrouping];
      int v59 = [v6 supportsGrouping];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v32 = v5;
      }
      else {
        uint64_t v32 = 0;
      }
      id v30 = v32;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v33 = v6;
      }
      else {
        long long v33 = 0;
      }
      id v31 = v33;
      long long v34 = [v30 outputDevice];
      long long v35 = [v34 recommendation];
      id v71 = [v35 sortingHint];

      long long v36 = [v31 outputDevice];
      uint64_t v37 = [v36 recommendation];
      int v70 = [v37 sortingHint];

      uint64_t v38 = [v30 outputDevice];
      long long v39 = [v38 recommendation];
      int v63 = [v39 isConservativelyFiltered];

      long long v40 = [v31 outputDevice];
      long long v41 = [v40 recommendation];
      int v42 = [v41 isConservativelyFiltered];

      long long v43 = [v30 outputDevice];
      int v44 = [v43 isActivatedForContinuityScreen];

      long long v45 = [v31 outputDevice];
      int v46 = [v45 isActivatedForContinuityScreen];

      if ([*(id *)(a1 + 32) sortByIsVideoRoute]) {
        int v47 = 1;
      }
      else {
        int v47 = [*(id *)(*(void *)(a1 + 32) + 1160) representsLongFormVideoContent];
      }
      if (![v5 pickableRouteType] && objc_msgSend(v6, "pickableRouteType")) {
        goto LABEL_82;
      }
      if (![v6 pickableRouteType] && objc_msgSend(v5, "pickableRouteType"))
      {
LABEL_84:
        uint64_t v10 = 1;
        goto LABEL_85;
      }
      if ((v44 ^ 1 | v46) == 1)
      {
        if ((v46 ^ 1 | v44) != 1) {
          goto LABEL_84;
        }
        if ((v69 ^ 1 | v68) == 1)
        {
          if ((v68 ^ 1 | v69) != 1) {
            goto LABEL_84;
          }
          if ((v67 ^ 1 | v66) == 1)
          {
            if ((v66 ^ 1 | v67) != 1) {
              goto LABEL_84;
            }
            if ((v65 ^ 1 | v64) == 1)
            {
              if ((v64 ^ 1 | v65) != 1) {
                goto LABEL_84;
              }
              if (![v5 isKnown] || objc_msgSend(v6, "isKnown"))
              {
                if ([v5 isKnown] & 1) == 0 && (objc_msgSend(v6, "isKnown")) {
                  goto LABEL_84;
                }
                if ((v63 | v42 ^ 1) == 1)
                {
                  if ((v63 ^ 1 | v42) != 1) {
                    goto LABEL_84;
                  }
                  if (![v5 isNearby] || objc_msgSend(v6, "isNearby"))
                  {
                    if ([v5 isNearby] & 1) == 0 && (objc_msgSend(v6, "isNearby")) {
                      goto LABEL_84;
                    }
                    if (!v71 || v70)
                    {
                      if (!v71 && v70) {
                        goto LABEL_84;
                      }
                      if (v71 && v70)
                      {
                        uint64_t v10 = [v71 compare:v70];
LABEL_85:

                        goto LABEL_86;
                      }
                      if ((v47 & v60 & v62 ^ 1 | v59 & v61) == 1)
                      {
                        if ((v47 & v59 & v61 ^ 1 | v60 & v62) != 1) {
                          goto LABEL_84;
                        }
                        if ((v58 ^ 1 | v57) == 1)
                        {
                          if ((v57 ^ 1 | v58) != 1) {
                            goto LABEL_84;
                          }
                          if ((v47 & v62 ^ 1 | v61) == 1)
                          {
                            if ((v47 & v61 ^ 1 | v62) != 1) {
                              goto LABEL_84;
                            }
                            if ((v56 ^ 1 | v55) == 1)
                            {
                              if ((v55 ^ 1 | v56) != 1) {
                                goto LABEL_84;
                              }
                              if ((v54 ^ 1 | v53) == 1)
                              {
                                if ((v53 ^ 1 | v54) == 1)
                                {
                                  long long v49 = [v5 routeName];
                                  uint64_t v50 = [v6 routeName];
                                  uint64_t v10 = [v49 compare:v50 options:*(void *)(a1 + 40)];

                                  if (!v10)
                                  {
                                    int64_t v51 = [v5 routeUID];
                                    uint64_t v52 = [v6 routeUID];
                                    uint64_t v10 = [v51 compare:v52 options:*(void *)(a1 + 40)];
                                  }
                                  goto LABEL_85;
                                }
                                goto LABEL_84;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_82:
      uint64_t v10 = -1;
      goto LABEL_85;
    }
  }
  if (([*(id *)(a1 + 32) sortByIsVideoRoute] & 1) == 0
    && ![*(id *)(*(void *)(a1 + 32) + 1160) representsLongFormVideoContent])
  {
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = [v5 routeType] == 1;
  }
  else if ([v5 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v5, "isTVRoute"))
  {
    int v12 = 1;
  }
  else
  {
    int v12 = [v5 containsDeviceWithSubtype:18];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v20 = [v6 routeType] == 1;
  }
  else
  {
    if ([v6 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v6, "isTVRoute"))
    {
      if ((v12 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    int v20 = [v6 containsDeviceWithSubtype:18];
  }
  if (v12 != v20) {
    goto LABEL_32;
  }
LABEL_30:
  id v21 = [v5 routeName];
  BOOL v22 = [v6 routeName];
  uint64_t v23 = [v21 compare:v22 options:*(void *)(a1 + 40)];

  if (!v23)
  {
    uint64_t v24 = [v5 routeUID];
    id v25 = [v6 routeUID];
    [v24 compare:v25 options:*(void *)(a1 + 40)];
  }
LABEL_32:
  int v26 = [v5 isDisplayedAsPicked];
  int v27 = [v6 isDisplayedAsPicked];
  if (v26 && !v27)
  {
    uint64_t v10 = -1;
    goto LABEL_87;
  }
  if ((v27 ^ 1 | v26) != 1)
  {
    uint64_t v10 = 1;
    goto LABEL_87;
  }
  id v28 = [v5 routeName];
  id v29 = [v6 routeName];
  uint64_t v10 = [v28 compare:v29 options:*(void *)(a1 + 40)];

  if (!v10)
  {
    id v30 = [v5 routeUID];
    id v31 = [v6 routeUID];
    uint64_t v10 = [v30 compare:v31 options:*(void *)(a1 + 40)];
LABEL_86:
  }
LABEL_87:

  return v10;
}

- (id)_recommendedRoutesFromRoutes:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_3;
  v7[3] = &unk_1E5F0ECA8;
  id v8 = v3;
  id v9 = &__block_literal_global_228;
  id v4 = v3;
  id v5 = objc_msgSend(v4, "msv_compactMap:", v7);

  return v5;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_2;
  v8[3] = &unk_1E5F0EC60;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a3, "msv_compactMap:", v8);

  return v6;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAirPlayRoute])
  {
    id v4 = [v3 groupUID];
    id v5 = [*(id *)(a1 + 32) groupUID];
    if (([v4 isEqualToString:v5] & 1) != 0
      || [v3 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = v3;
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isAirPlayRoute])
  {
    id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = objc_msgSend(v4, "msv_flatMap:", &__block_literal_global_231);
    if ([v5 count])
    {
      id v6 = +[MRURouteRecommender sharedInstance];
      id v7 = [v6 recommendationForGroupedOutputDevices:v5];

      if (!v7)
      {
        id v8 = +[MRURouteRecommender sharedInstance];
        [v8 donateGroupedOutputDevices:v5];
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setRecommendation:", v7, (void)v15);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }

  return v3;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 outputDevices];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)_displayAsPickedRoutesInRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDisplayedAsPicked", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_airPlayRoutesInRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isAirPlayRoute", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_mergeRoutes:(id)a3 withCoalescedResult:(id)a4
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v98 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
  v100 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v105 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v108 = v6;
  v106 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v7;
  uint64_t v102 = [obj countByEnumeratingWithState:&v131 objects:v142 count:16];
  if (!v102) {
    goto LABEL_72;
  }
  uint64_t v101 = *(void *)v132;
  p_superclass = &OBJC_METACLASS___MRUActivityNowPlayingHeaderView.superclass;
  v107 = self;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v132 != v101) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v131 + 1) + 8 * v9);
      uint64_t v11 = [v10 endpoints];
      unint64_t v12 = [v11 count];

      if (v12 >= 2)
      {
        id v13 = (id)[objc_alloc((Class)(p_superclass + 113)) initWithDevice:v10];
        long long v14 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          long long v15 = [v10 endpoints];
          uint64_t v16 = [v15 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v139 = v16;
          __int16 v140 = 2112;
          id v141 = v13;
          _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Found a route group with %lu endpoints: %@", buf, 0x16u);
        }
        uint64_t v103 = v9;
        if ([(MRURoutingViewController *)self isVendorSpecificGroupStatusRecorded:v13])
        {
          [(MRURoutingViewController *)self applyVendorSpecificGroupExpandedRecord:v13];
        }
        else
        {
          [(MRURoutingViewController *)self updateVendorSpecificGroupExpandedRecordFor:v13];
        }
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v36 = [v10 endpoints];
        uint64_t v37 = [v36 allValues];

        id v113 = v37;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v127 objects:v137 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v128;
          uint64_t v109 = *(void *)v128;
          id v110 = v13;
          do
          {
            uint64_t v41 = 0;
            uint64_t v112 = v39;
            do
            {
              if (*(void *)v128 != v40) {
                objc_enumerationMutation(v113);
              }
              int v42 = *(void **)(*((void *)&v127 + 1) + 8 * v41);
              id v43 = objc_alloc((Class)(p_superclass + 113));
              int v44 = [v42 underlyingDADevice];
              long long v45 = (void *)[v43 initWithDevice:v44];

              int v46 = v45;
              objc_msgSend(v45, "setIsPreferredRoute:", objc_msgSend(v42, "selected"));
              int v47 = [v45 device];

              if (v47)
              {
                long long v48 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];
                long long v49 = [v46 routeUID];
                objc_msgSend(v46, "setIsPicked:", objc_msgSend(v48, "containsObject:", v49));

                [v13 addSubRoute:v46];
              }
              else
              {
                id v115 = v45;
                long long v125 = 0u;
                long long v126 = 0u;
                long long v123 = 0u;
                long long v124 = 0u;
                id v50 = v108;
                uint64_t v51 = [v50 countByEnumeratingWithState:&v123 objects:v136 count:16];
                if (v51)
                {
                  uint64_t v52 = v51;
                  uint64_t v53 = *(void *)v124;
LABEL_26:
                  uint64_t v54 = 0;
                  while (1)
                  {
                    if (*(void *)v124 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    int v55 = *(void **)(*((void *)&v123 + 1) + 8 * v54);
                    int v56 = [v55 routeUID];
                    int v57 = [v42 airplayDeviceID];
                    int v58 = [v56 isEqualToString:v57];

                    if (v58) {
                      break;
                    }
                    if (v52 == ++v54)
                    {
                      uint64_t v52 = [v50 countByEnumeratingWithState:&v123 objects:v136 count:16];
                      if (v52) {
                        goto LABEL_26;
                      }
                      goto LABEL_32;
                    }
                  }
                  int v59 = MCLogCategoryDeviceAccess();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v139 = (uint64_t)v55;
                    _os_log_impl(&dword_1AE7DF000, v59, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Native route that was grouped: %@", buf, 0xCu);
                  }

                  int v60 = v55;
                  int v46 = v115;
                  [v115 setUnderlyingNativeRoute:v60];

                  uint64_t v40 = v109;
                  id v13 = v110;
                  if (v60)
                  {
                    [v105 addObject:v60];
                    [v106 addObject:v60];
                    [v110 addSubRoute:v115];
                    self = v107;
                    p_superclass = (__objc2_class **)(&OBJC_METACLASS___MRUActivityNowPlayingHeaderView + 8);
                    uint64_t v39 = v112;
                    goto LABEL_40;
                  }
                }
                else
                {
LABEL_32:

                  uint64_t v40 = v109;
                  id v13 = v110;
                  int v46 = v115;
                }
                int v60 = MCLogCategoryDeviceAccess();
                uint64_t v39 = v112;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1AE7DF000, v60, OS_LOG_TYPE_DEFAULT, "Was unable to find a current native route that matches the record in DA coalesced result", buf, 2u);
                }
                self = v107;
                p_superclass = &OBJC_METACLASS___MRUActivityNowPlayingHeaderView.superclass;
LABEL_40:
              }
              ++v41;
            }
            while (v41 != v39);
            uint64_t v39 = [v113 countByEnumeratingWithState:&v127 objects:v137 count:16];
          }
          while (v39);
        }

        int v61 = [v13 subroutes];
        unint64_t v62 = [v61 count];

        if (v62 >= 2)
        {
          [v100 addObject:v13];
LABEL_66:
          uint64_t v9 = v103;
          goto LABEL_67;
        }
        int v66 = [v13 subroutes];
        uint64_t v67 = [v66 count];

        if (v67)
        {
          int v68 = [v13 subroutes];
          int v69 = [v68 firstObject];
          int v70 = [v69 device];

          if (v70)
          {
            id v71 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v72 = [v13 subroutes];
              uint64_t v73 = [v72 firstObject];
              uint64_t v74 = [v73 device];
              *(_DWORD *)buf = 138412290;
              uint64_t v139 = (uint64_t)v74;
              _os_log_impl(&dword_1AE7DF000, v71, OS_LOG_TYPE_DEFAULT, "Changing group route to single route instead with device: %@", buf, 0xCu);
            }
            id v75 = objc_alloc((Class)(p_superclass + 113));
            long long v76 = [v13 subroutes];
            long long v77 = [v76 firstObject];
            long long v78 = [v77 device];
            v79 = [v75 initWithDevice:v78];

            uint64_t v80 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];
            long long v81 = [v79 routeUID];
            -[NSObject setIsPicked:](v79, "setIsPicked:", [v80 containsObject:v81]);

            [v100 addObject:v79];
            goto LABEL_64;
          }
        }
        else
        {
          v79 = MCLogCategoryDeviceAccess();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE7DF000, v79, OS_LOG_TYPE_DEFAULT, "Weird situation, DA coalesced route contains only airplay routes and they have disappeared?", buf, 2u);
          }
LABEL_64:
        }
        [(MRURoutingViewController *)self clearVendorSpecificGroupExpandedRecordFor:v13];
        goto LABEL_66;
      }
      uint64_t v17 = [v10 endpoints];
      uint64_t v18 = [v17 count];

      if (v18 == 1)
      {
        int v19 = [v10 endpoints];
        uint64_t v20 = [v19 allValues];
        id v21 = [v20 firstObject];
        BOOL v22 = [v21 underlyingDADevice];

        v114 = v10;
        if (v22)
        {
          uint64_t v23 = v9;
          uint64_t v24 = MCLogCategoryDeviceAccess();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = [v10 endpoints];
            int v26 = [v25 allValues];
            int v27 = [v26 firstObject];
            id v28 = [v27 underlyingDADevice];
            *(_DWORD *)buf = 138412290;
            uint64_t v139 = (uint64_t)v28;
            _os_log_impl(&dword_1AE7DF000, v24, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Single Underlying DA route found: %@", buf, 0xCu);

            uint64_t v10 = v114;
          }

          id v29 = objc_alloc((Class)(p_superclass + 113));
          id v30 = [v10 endpoints];
          id v31 = [v30 allValues];
          uint64_t v32 = [v31 firstObject];
          long long v33 = [v32 underlyingDADevice];
          id v13 = (id)[v29 initWithDevice:v33];

          long long v34 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];
          long long v35 = [v13 routeUID];
          objc_msgSend(v13, "setIsPicked:", objc_msgSend(v34, "containsObject:", v35));

          [v100 addObject:v13];
          uint64_t v9 = v23;
        }
        else
        {
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v13 = v108;
          uint64_t v82 = [v13 countByEnumeratingWithState:&v119 objects:v135 count:16];
          if (v82)
          {
            uint64_t v83 = v82;
            id v111 = v13;
            uint64_t v104 = v9;
            uint64_t v84 = *(void *)v120;
            while (2)
            {
              for (uint64_t i = 0; i != v83; ++i)
              {
                if (*(void *)v120 != v84) {
                  objc_enumerationMutation(v111);
                }
                long long v86 = *(void **)(*((void *)&v119 + 1) + 8 * i);
                uint64_t v87 = [v86 routeUID];
                v88 = [v10 endpoints];
                v89 = [v88 allValues];
                v90 = [v89 firstObject];
                v91 = [v90 airplayDeviceID];
                int v92 = [v87 isEqualToString:v91];

                if (v92)
                {
                  [v106 addObject:v86];
                  goto LABEL_70;
                }
                uint64_t v10 = v114;
              }
              uint64_t v83 = [v111 countByEnumeratingWithState:&v119 objects:v135 count:16];
              if (v83) {
                continue;
              }
              break;
            }
LABEL_70:
            self = v107;
            p_superclass = (__objc2_class **)(&OBJC_METACLASS___MRUActivityNowPlayingHeaderView + 8);
            uint64_t v9 = v104;
            id v13 = v111;
          }
        }
      }
      else
      {
        int v63 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v139 = (uint64_t)v10;
          _os_log_impl(&dword_1AE7DF000, v63, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Single and UnCoalesced DA route found: %@", buf, 0xCu);
        }

        id v13 = (id)[objc_alloc((Class)(p_superclass + 113)) initWithDevice:v10];
        int v64 = [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager activatedDeviceIDs];
        int v65 = [v13 routeUID];
        objc_msgSend(v13, "setIsPicked:", objc_msgSend(v64, "containsObject:", v65));

        [v100 addObject:v13];
      }
LABEL_67:

      ++v9;
    }
    while (v9 != v102);
    uint64_t v93 = [obj countByEnumeratingWithState:&v131 objects:v142 count:16];
    uint64_t v102 = v93;
  }
  while (v93);
LABEL_72:

  if ([(MRURoutingViewController *)self canUseUncoalescedResults])
  {
    id v94 = v108;
  }
  else
  {
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __61__MRURoutingViewController__mergeRoutes_withCoalescedResult___block_invoke;
    v116[3] = &unk_1E5F0ECD0;
    id v117 = v106;
    v118 = self;
    objc_msgSend(v108, "msv_compactMap:", v116);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  v95 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v139 = (uint64_t)v94;
    _os_log_impl(&dword_1AE7DF000, v95, OS_LOG_TYPE_DEFAULT, "nativeRoutesThatCanBeDisplayed: %@", buf, 0xCu);
  }

  [v98 addObjectsFromArray:v94];
  [v98 addObjectsFromArray:v100];
  v96 = (void *)[objc_alloc(MEMORY[0x1E4F779D8]) initWithFirst:v98 second:v105];

  return v96;
}

id __61__MRURoutingViewController__mergeRoutes_withCoalescedResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 isAirPlayRoute]) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) containsObject:v3]
    && ([*(id *)(*(void *)(a1 + 40) + 1168) resolverManagedAirPlayRouteIDs],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 routeUID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 containsObject:v5],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "Merge routes: skipping native route because it has not gone through the resolver yet: %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = 0;
  }
  else
  {
LABEL_8:
    id v8 = v3;
  }

  return v8;
}

- (void)_createUpdateWithRefreshOnly:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MRURoutingViewController__createUpdateWithRefreshOnly_completion___block_invoke;
  v8[3] = &unk_1E5F0ECF8;
  BOOL v10 = a3;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(MRURoutingViewController *)self fetchAvailableRoutesWithCompletionHandler:v8];
}

void __68__MRURoutingViewController__createUpdateWithRefreshOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MRURoutingViewControllerUpdate);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1160) pickedRoutes];
  id v6 = (void *)[v5 copy];
  [(MRURoutingViewControllerUpdate *)v4 setPickedRoutes:v6];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 1160) pendingPickedRoutes];
  id v8 = [v7 allObjects];
  [(MRURoutingViewControllerUpdate *)v4 setPendingPickedRoutes:v8];

  [(MRURoutingViewControllerUpdate *)v4 setNativeRoutes:v3];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 1168) activatedDeviceIDs];
  [(MRURoutingViewControllerUpdate *)v4 setActivatedVendorSpecificDeviceIDs:v9];

  BOOL v10 = [*(id *)(*(void *)(a1 + 32) + 1168) activatingDeviceIDs];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 1168) invalidatingDeviceIDs];
  uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v11];
  [(MRURoutingViewControllerUpdate *)v4 setPendingVendorSpecificDeviceIDs:v12];

  id v13 = [*(id *)(*(void *)(a1 + 32) + 1168) availableDeviceIDs];
  [(MRURoutingViewControllerUpdate *)v4 setAvailableVendorSpecificDeviceIDs:v13];

  long long v14 = *(id **)(a1 + 32);
  long long v15 = [v14[146] coalescedDevices];
  uint64_t v16 = [v14 _mergeRoutes:v3 withCoalescedResult:v15];

  uint64_t v17 = [v16 first];
  int v57 = v16;
  uint64_t v18 = [v16 second];
  int v19 = MCLogCategoryDeviceAccess();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v72 = v18;
    _os_log_impl(&dword_1AE7DF000, v19, OS_LOG_TYPE_DEFAULT, "nativeRoutesInVendorSpecificGroup: %@", buf, 0xCu);
  }

  [(MRURoutingViewControllerUpdate *)v4 setNativeRoutesInVendorSpecificGroup:v18];
  int v56 = (void *)v17;
  uint64_t v20 = [*(id *)(a1 + 32) _displayableRoutesInRoutes:v17];
  [(MRURoutingViewControllerUpdate *)v4 setDisplayableAvailableRoutes:v20];

  int v55 = (void *)v18;
  if ([*(id *)(a1 + 32) shouldSuppressNativeRoutesStatusDisplay])
  {
    [(MRURoutingViewControllerUpdate *)v4 setDisplayAsPickedRoutes:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v21 = [*(id *)(a1 + 32) _displayAsPickedRoutesInRoutes:v3];
    [(MRURoutingViewControllerUpdate *)v4 setDisplayAsPickedRoutes:v21];
  }
  -[MRURoutingViewControllerUpdate setCanGroup:](v4, "setCanGroup:", [*(id *)(*(void *)(a1 + 32) + 1160) supportsMultipleSelection]);
  -[MRURoutingViewControllerUpdate setHasPendingPickedRoutes:](v4, "setHasPendingPickedRoutes:", [*(id *)(*(void *)(a1 + 32) + 1160) hasPendingPickedRoutes]);
  BOOL v22 = [*(id *)(a1 + 32) _airPlayRoutesInRoutes:v3];
  [(MRURoutingViewControllerUpdate *)v4 setAirPlayRoutes:v22];

  int v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "count"));
  uint64_t v23 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v24 = [(MRURoutingViewControllerUpdate *)v4 airPlayRoutes];
  uint64_t v54 = objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v25 = *(id *)(*(void *)(a1 + 32) + 1064);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v66 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        id v31 = [(MRURoutingViewControllerUpdate *)v4 airPlayRoutes];
        char v32 = [v31 containsObject:v30];

        if ((v32 & 1) == 0) {
          [v58 addObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v27);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v33 = [(MRURoutingViewControllerUpdate *)v4 airPlayRoutes];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v62 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v61 + 1) + 8 * j);
        if (([*(id *)(*(void *)(a1 + 32) + 1064) containsObject:v38] & 1) == 0) {
          [v54 addObject:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v35);
  }

  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 1168) resolverRemoveNativeRoutes:v58];
    [*(id *)(*(void *)(a1 + 32) + 1168) resolverAddNativeRoutes:v54];
  }
  uint64_t v39 = *(void **)(a1 + 32);
  id v59 = 0;
  id v60 = 0;
  [v39 _configureVolumeForUpdate:v4 volumeCapableRoutes:&v60 volumeController:&v59];
  id v40 = v60;
  id v41 = v59;
  uint64_t v42 = [v41 copy];
  uint64_t v43 = *(void *)(a1 + 32);
  int v44 = *(void **)(v43 + 1264);
  *(void *)(v43 + 1264) = v42;

  long long v45 = [v41 allValues];
  [*(id *)(*(void *)(a1 + 32) + 1192) setVolumeControllers:v45];

  int v46 = (void *)[v40 copy];
  [(MRURoutingViewControllerUpdate *)v4 setVolumeCapableRoutes:v46];

  int v47 = *(void **)(a1 + 32);
  long long v48 = [(MRURoutingViewControllerUpdate *)v4 displayableAvailableRoutes];
  [v47 updateNowPlayingControllersForRoutes:v48];

  uint64_t v49 = *(void *)(a1 + 32);
  id v50 = *(id *)(v49 + 1000);
  id v51 = *(id *)(v49 + 1208);
  uint64_t v52 = v51;
  if (v51 == v50) {
    uint64_t v53 = 0;
  }
  else {
    uint64_t v53 = [v51 isEqual:v50] ^ 1;
  }

  [(MRURoutingViewControllerUpdate *)v4 setShouldReload:v53];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateDisplayedRoutes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__MRURoutingViewController__updateDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E5F0ED20;
  v2[4] = self;
  [(MRURoutingViewController *)self _createUpdateWithRefreshOnly:0 completion:v2];
}

uint64_t __50__MRURoutingViewController__updateDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enqueueUpdate:a2];
}

- (void)_refreshDisplayedRoutes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__MRURoutingViewController__refreshDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E5F0ED20;
  v2[4] = self;
  [(MRURoutingViewController *)self _createUpdateWithRefreshOnly:1 completion:v2];
}

uint64_t __51__MRURoutingViewController__refreshDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enqueueUpdate:a2];
}

- (void)_reloadDisplayedRoutes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__MRURoutingViewController__reloadDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E5F0ED20;
  v2[4] = self;
  [(MRURoutingViewController *)self _createUpdateWithRefreshOnly:1 completion:v2];
}

void __50__MRURoutingViewController__reloadDisplayedRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setShouldReload:1];
  [*(id *)(a1 + 32) _enqueueUpdate:v3];
}

- (void)setOptimisticUpdate:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    [(MRURoutingViewController *)self _enqueueUpdate:v5];
    objc_storeStrong((id *)&self->_optimisticUpdate, a3);
  }
  else
  {
    optimisticUpdate = self->_optimisticUpdate;
    self->_optimisticUpdate = 0;

    [(MRURoutingViewController *)self _updateDisplayedRoutes];
  }
}

- (void)didReceiveInteraction:(id)a3
{
  if (self->_collapseTimer) {
    [(MRURoutingViewController *)self _collapseAllGroupsAfterDelay];
  }
}

- (void)_enqueueUpdate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_optimisticUpdate)
  {
    if (self->_isAnimatingUpdate) {
      objc_storeStrong((id *)&self->_pendingUpdate, a3);
    }
    else {
      [(MRURoutingViewController *)self _applyUpdate:v5];
    }
  }
}

- (void)_configureVolumeForUpdate:(id)a3 volumeCapableRoutes:(id *)a4 volumeController:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v10 = [v8 displayAsPickedRoutes];
  id v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

  id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v13 = [v8 displayAsPickedRoutes];
  long long v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke;
  aBlock[3] = &unk_1E5F0ED48;
  aBlock[4] = self;
  id v15 = v14;
  id v53 = v15;
  uint64_t v16 = (void (**)(void *, void *))_Block_copy(aBlock);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke_2;
  v49[3] = &unk_1E5F0ED70;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v17;
  id v50 = v17;
  id v51 = self;
  uint64_t v20 = (unsigned int (**)(void))_Block_copy(v49);
  if (v20[2]())
  {
    id v34 = v19;
    id v35 = v15;
    uint64_t v36 = a4;
    uint64_t v37 = a5;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [v19 displayAsPickedRoutes];
    uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v40)
    {
      uint64_t v21 = *(void *)v46;
      BOOL v22 = &OBJC_IVAR___MRUMediaSuggestionCollectionViewCell__layout;
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v25 = *(Class *)((char *)&v18->super.super.super.isa + v22[421]);
          uint64_t v26 = [v24 routeUID];
          LODWORD(v25) = [v25 containsObject:v26];

          if (v25)
          {
            uint64_t v27 = v18;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v28 = [v24 subRoutes];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v42;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v42 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  long long v33 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                  v16[2](v16, v33);
                  if ([v33 isPicked]) {
                    [v11 addObject:v33];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v54 count:16];
              }
              while (v30);
            }

            uint64_t v18 = v27;
            uint64_t v21 = v38;
            BOOL v22 = &OBJC_IVAR___MRUMediaSuggestionCollectionViewCell__layout;
          }
          else
          {
            v16[2](v16, v24);
            [v11 addObject:v24];
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v40);
    }

    a4 = v36;
    a5 = v37;
    id v19 = v34;
    id v15 = v35;
  }
  if (a4) {
    *a4 = v11;
  }
  if (a5) {
    *a5 = v15;
  }
}

void __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 routeUID];
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1264) objectForKey:v3];
    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F31A78]);
      id v6 = [*(id *)(a1 + 32) endpointRoute];
      id v7 = (void *)[v5 initWithGroupRoute:v6 outputDeviceRoute:v8];

      id v4 = [(MPVolumeController *)[MRUVolumeController alloc] initWithDataSource:v7];
    }
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
}

uint64_t __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) displayAsPickedRoutes];
  unint64_t v3 = [v2 count];

  if (v3 > 1) {
    return 1;
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(*(void *)(a1 + 40) + 1296);
  id v7 = [v5 displayAsPickedRoutes];
  id v8 = [v7 firstObject];
  id v9 = [v8 routeUID];
  uint64_t v10 = [v6 containsObject:v9];

  return v10;
}

- (id)endpointGroupUID
{
  uint64_t v2 = [(MPAVEndpointRoute *)self->_endpointRoute endpoint];
  unint64_t v3 = [v2 designatedGroupLeader];
  id v4 = [v3 groupID];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F76FC0] localDeviceUID];
  }
  id v7 = v6;

  return v7;
}

- (void)updateExpandedGroups
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(NSDictionary *)self->_cachedRouteGrouping allKeys];
  id v7 = [v3 setWithArray:v4];

  [(NSMutableSet *)self->_expandedGroupUIDs intersectSet:v7];
  if ([(NSArray *)self->_cachedPickedRoutes count] == 1)
  {
    expandedGroupUIDs = self->_expandedGroupUIDs;
    id v6 = [(MRURoutingViewController *)self endpointGroupUID];
    [(NSMutableSet *)expandedGroupUIDs addObject:v6];
  }
}

- (BOOL)wasVendorSpecificGroupDisplayedAsExpanded:(id)a3
{
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  id v4 = [a3 routeUID];
  LOBYTE(expandedVendorSpecificGroupUIDs) = [(NSMutableSet *)expandedVendorSpecificGroupUIDs containsObject:v4];

  return (char)expandedVendorSpecificGroupUIDs;
}

- (BOOL)isVendorSpecificGroupStatusRecorded:(id)a3
{
  id v4 = a3;
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  id v6 = [v4 routeUID];
  if ([(NSMutableSet *)expandedVendorSpecificGroupUIDs containsObject:v6])
  {
    char v7 = 1;
  }
  else
  {
    collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
    id v9 = [v4 routeUID];
    char v7 = [(NSMutableSet *)collapsedVendorSpecificGroupUIDs containsObject:v9];
  }
  return v7;
}

- (void)applyVendorSpecificGroupExpandedRecord:(id)a3
{
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  id v4 = a3;
  id v5 = [v4 routeUID];
  objc_msgSend(v4, "setExpanded:", -[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v5));
}

- (void)updateVendorSpecificGroupExpandedRecordFor:(id)a3
{
  id v4 = a3;
  int v5 = [v4 expanded];
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  char v7 = [v4 routeUID];
  if (v5)
  {
    [(NSMutableSet *)expandedVendorSpecificGroupUIDs addObject:v7];

    collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
    id v10 = [v4 routeUID];

    [(NSMutableSet *)collapsedVendorSpecificGroupUIDs removeObject:v10];
  }
  else
  {
    [(NSMutableSet *)expandedVendorSpecificGroupUIDs removeObject:v7];

    id v9 = self->_collapsedVendorSpecificGroupUIDs;
    id v10 = [v4 routeUID];

    [(NSMutableSet *)v9 addObject:v10];
  }
}

- (void)clearVendorSpecificGroupExpandedRecordFor:(id)a3
{
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  id v5 = a3;
  id v6 = [v5 routeUID];
  [(NSMutableSet *)expandedVendorSpecificGroupUIDs removeObject:v6];

  collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
  id v8 = [v5 routeUID];

  [(NSMutableSet *)collapsedVendorSpecificGroupUIDs removeObject:v8];
}

- (void)_applyUpdate:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(MRURoutingViewController *)self view];
  id v6 = [v5 tableView];

  if (!v6) {
    goto LABEL_16;
  }
  char v7 = (void *)[(MPSectionedCollection *)self->_routingViewItems copy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F31A40]);
  }
  id v10 = v9;

  id v11 = [(MRURoutingViewController *)self _createRoutingViewItemsForUpdate:v4];
  id v12 = [v11 routeGrouping];
  id v13 = [v4 pickedRoutes];
  long long v14 = [(MRURoutingViewController *)self _createSectionedCollection:v11 withPickedRoutes:v13];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MRURoutingViewController__applyUpdate___block_invoke;
  aBlock[3] = &unk_1E5F0ED98;
  aBlock[4] = self;
  id v15 = v4;
  id v50 = v15;
  id v16 = v14;
  id v51 = v16;
  id v31 = v12;
  id v52 = v31;
  id v17 = (void (**)(void))_Block_copy(aBlock);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_3;
  v46[3] = &unk_1E5F0EDE0;
  id v18 = v10;
  id v47 = v18;
  id v19 = v16;
  id v48 = v19;
  char v32 = _Block_copy(v46);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_4;
  v40[3] = &unk_1E5F0EE08;
  id v20 = v18;
  id v41 = v20;
  id v21 = v19;
  id v42 = v21;
  id v45 = &__block_literal_global_243;
  BOOL v22 = (MRURoutingViewControllerUpdate *)v15;
  long long v43 = v22;
  long long v44 = self;
  long long v33 = _Block_copy(v40);
  if (![(MRURoutingViewControllerUpdate *)v22 shouldReload])
  {
    uint64_t v23 = [v20 changeDetailsToSectionedCollection:v21 isEqualBlock:v32 isUpdatedBlock:v33];
    if (v23)
    {
      self->_isAnimatingUpdate = 1;
      uint64_t v24 = [(MRURoutingViewController *)self view];
      id v25 = [v24 tableView];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_245;
      v36[3] = &unk_1E5F0EE30;
      uint64_t v39 = v17;
      id v26 = v23;
      id v37 = v26;
      uint64_t v38 = self;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_3_248;
      v35[3] = &unk_1E5F0EE58;
      v35[4] = self;
      [v25 performBatchUpdates:v36 completion:v35];

      uint64_t v27 = v39;
LABEL_10:

      goto LABEL_11;
    }
  }
  v17[2](v17);
  objc_storeStrong((id *)&self->_displayedEndpointRoute, self->_endpointRoute);
  if ([(MRURoutingViewControllerUpdate *)v22 shouldReload])
  {
    id v26 = [(MRURoutingViewController *)self view];
    uint64_t v27 = [v26 tableView];
    [v27 reloadData];
    goto LABEL_10;
  }
LABEL_11:
  self->_needsDisplayedRoutesUpdate = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_253;
    block[3] = &unk_1E5F0D7F8;
    void block[4] = self;
    uint64_t v30 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (self->_pendingUpdate == v22)
  {
    self->_pendingUpdate = 0;
  }
LABEL_16:
}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) displayableAvailableRoutes];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1024);
  *(void *)(v3 + 1024) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) pickedRoutes];
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(v6 + 1016);
  *(void *)(v6 + 1016) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) pendingPickedRoutes];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1032);
  *(void *)(v9 + 1032) = v8;

  uint64_t v11 = [*(id *)(a1 + 40) displayAsPickedRoutes];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 1040);
  *(void *)(v12 + 1040) = v11;

  uint64_t v14 = [*(id *)(a1 + 40) volumeCapableRoutes];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 1048);
  *(void *)(v15 + 1048) = v14;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1008), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), *(id *)(a1 + 56));
  uint64_t v17 = [*(id *)(a1 + 40) airPlayRoutes];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 1064);
  *(void *)(v18 + 1064) = v17;

  uint64_t v20 = [*(id *)(a1 + 40) nativeRoutes];
  uint64_t v21 = *(void *)(a1 + 32);
  BOOL v22 = *(void **)(v21 + 1072);
  *(void *)(v21 + 1072) = v20;

  uint64_t v23 = [*(id *)(a1 + 40) nativeRoutesInVendorSpecificGroup];
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 1080);
  *(void *)(v24 + 1080) = v23;

  uint64_t v26 = [*(id *)(a1 + 40) activatedVendorSpecificDeviceIDs];
  uint64_t v27 = *(void *)(a1 + 32);
  uint64_t v28 = *(void **)(v27 + 1088);
  *(void *)(v27 + 1088) = v26;

  uint64_t v29 = [*(id *)(a1 + 40) pendingVendorSpecificDeviceIDs];
  uint64_t v30 = *(void *)(a1 + 32);
  id v31 = *(void **)(v30 + 1096);
  *(void *)(v30 + 1096) = v29;

  uint64_t v32 = [*(id *)(a1 + 40) availableVendorSpecificDeviceIDs];
  uint64_t v33 = *(void *)(a1 + 32);
  id v34 = *(void **)(v33 + 1104);
  *(void *)(v33 + 1104) = v32;

  id v35 = *(void **)(a1 + 32);

  return [v35 updateExpandedGroups];
}

BOOL __41__MRURoutingViewController__applyUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v5 = 0;
  if ([v2 type] == 5)
  {
    uint64_t v3 = [v2 mainRoute];
    char v4 = [v3 isAirPlayRoute];

    if (v4) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 length];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    uint64_t v9 = [v6 section];

    id v10 = [v8 sectionAtIndex:v9];
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v5 section];

    id v13 = [v11 sectionAtIndex:v12];
    uint64_t v14 = [v10 isEqualToString:v13];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) itemAtIndexPath:v6];

    id v13 = [*(id *)(a1 + 40) itemAtIndexPath:v5];

    uint64_t v14 = [v10 isEqual:v13];
  }
  uint64_t v15 = v14;

  return v15;
}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v291 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length] != 1)
  {
    uint64_t v8 = [*(id *)(a1 + 32) itemAtIndexPath:v5];
    id v206 = v6;
    uint64_t v9 = [*(id *)(a1 + 40) itemAtIndexPath:v6];
    uint64_t v10 = [v8 type];
    v208 = v9;
    id v207 = v5;
    if (v10 != [v9 type] || (uint64_t v11 = objc_msgSend(v8, "type"), v11 == 6))
    {
LABEL_28:
      char v7 = 0;
LABEL_29:
      id v13 = v208;
      goto LABEL_30;
    }
    unint64_t v12 = v11;
    if (v11 == 2)
    {
      char v7 = [v8 isEqual:v9] ^ 1;
      id v13 = v9;
LABEL_30:

      id v6 = v206;
      id v5 = v207;
      goto LABEL_31;
    }
    v209 = v8;
    uint64_t v258 = a1;
    if ((unint64_t)(v11 - 3) < 2)
    {
      if (v11 != 3)
      {
        long long v283 = 0u;
        long long v284 = 0u;
        long long v281 = 0u;
        long long v282 = 0u;
        uint64_t v14 = [v9 mainRoute];
        uint64_t v15 = [v14 subroutes];

        id obj = v15;
        id v244 = (id)[v15 countByEnumeratingWithState:&v281 objects:v290 count:16];
        int v16 = 0;
        if (!v244)
        {
          LOBYTE(v211) = 0;
          LOBYTE(v17) = 0;
          LOBYTE(v18) = 0;
          LOBYTE(v219) = 0;
          goto LABEL_54;
        }
        LOBYTE(v211) = 0;
        int v17 = 0;
        int v18 = 0;
        int v219 = 0;
        uint64_t v238 = *(void *)v282;
        while (1)
        {
          for (uint64_t i = 0; i != v244; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v282 != v238) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void **)(*((void *)&v281 + 1) + 8 * i);
            if ([v20 isAirPlayRoute])
            {
              uint64_t v21 = [v20 underlyingNativeRoute];
              BOOL v22 = [*(id *)(a1 + 48) displayAsPickedRoutes];
              v219 |= [v22 containsObject:v21];

              uint64_t v23 = [*(id *)(a1 + 48) pickedRoutes];
              int v251 = [v23 containsObject:v21];

              uint64_t v24 = [*(id *)(a1 + 48) pendingPickedRoutes];
              int v25 = [v24 containsObject:v21];

              uint64_t v26 = [*(id *)(a1 + 48) volumeCapableRoutes];
              int v27 = [v26 containsObject:v21];
              int v211 = v27 ^ [*(id *)(*(void *)(a1 + 56) + 1048) containsObject:v21];

              if ([v20 supportsAirPlayGrouping])
              {
                int v232 = v17;
                uint64_t v28 = *(void **)(a1 + 56);
                uint64_t v29 = [*(id *)(a1 + 48) displayAsPickedRoutes];
                LODWORD(v28) = [v28 routesContainAirPlayGroupableRoute:v29];
                int v30 = v28 ^ [*(id *)(a1 + 56) routesContainAirPlayGroupableRoute:*(void *)(*(void *)(a1 + 56) + 1040)];
                goto LABEL_19;
              }
              goto LABEL_20;
            }
            int v227 = v16;
            id v31 = [*(id *)(a1 + 48) activatedVendorSpecificDeviceIDs];
            uint64_t v32 = [v20 routeUID];
            int v33 = [v31 containsObject:v32];

            id v34 = [*(id *)(a1 + 48) pendingVendorSpecificDeviceIDs];
            id v35 = [v20 routeUID];
            int v223 = [v34 containsObject:v35];

            if ([v20 supportsGrouping])
            {
              int v251 = v33;
              int v232 = v17;
              uint64_t v21 = [*(id *)(a1 + 56) vendorSpecificManager];
              uint64_t v29 = [*(id *)(a1 + 48) availableVendorSpecificDeviceIDs];
              v213 = [*(id *)(a1 + 48) activatedVendorSpecificDeviceIDs];
              uint64_t v36 = [v20 protocolIdentifier];
              int v37 = [v21 isGroupingAvailableFor:v29 activatedIDs:v213 forProtocolID:v36];
              uint64_t v38 = [*(id *)(a1 + 56) vendorSpecificManager];
              uint64_t v39 = *(void *)(v258 + 56);
              int v40 = v18;
              uint64_t v41 = *(void *)(v39 + 1104);
              uint64_t v42 = *(void *)(v39 + 1088);
              long long v43 = [v20 protocolIdentifier];
              uint64_t v44 = v41;
              int v18 = v40;
              int v30 = v37 ^ [v38 isGroupingAvailableFor:v44 activatedIDs:v42 forProtocolID:v43];

              a1 = v258;
              int v25 = v223;
              int v16 = v227;
LABEL_19:
              v16 |= v30;

              int v17 = v232;
LABEL_20:

              int v33 = v251;
              goto LABEL_22;
            }
            int v25 = v223;
            int v16 = v227;
LABEL_22:
            v17 |= v25;
            v18 |= v33;
          }
          id v244 = (id)[obj countByEnumeratingWithState:&v281 objects:v290 count:16];
          if (!v244)
          {
LABEL_54:
            char v205 = v18;

            long long v279 = 0u;
            long long v280 = 0u;
            long long v277 = 0u;
            long long v278 = 0u;
            uint64_t v8 = v209;
            uint64_t v109 = [v209 mainRoute];
            id v110 = [v109 subroutes];

            id v212 = v110;
            uint64_t v241 = [v110 countByEnumeratingWithState:&v277 objects:v289 count:16];
            char v234 = v17;
            int v111 = 0;
            int v89 = 0;
            if (!v241)
            {
              LOBYTE(obja) = 0;
              goto LABEL_71;
            }
            int obja = 0;
            uint64_t v214 = *(void *)v278;
            while (1)
            {
              for (uint64_t j = 0; j != v241; ++j)
              {
                if (*(void *)v278 != v214) {
                  objc_enumerationMutation(v212);
                }
                id v113 = *(void **)(*((void *)&v277 + 1) + 8 * j);
                if ([v113 isAirPlayRoute])
                {
                  v114 = [v113 underlyingNativeRoute];
                  obja |= [*(id *)(*(void *)(a1 + 56) + 1040) containsObject:v114];
                  int v115 = [*(id *)(*(void *)(a1 + 56) + 1016) containsObject:v114];
                  int v245 = [*(id *)(*(void *)(a1 + 56) + 1032) containsObject:v114];
                  if ([v113 supportsAirPlayGrouping])
                  {
                    int v253 = v115;
                    int v225 = v89;
                    v116 = *(void **)(a1 + 56);
                    id v117 = [*(id *)(a1 + 48) displayAsPickedRoutes];
                    LODWORD(v116) = [v116 routesContainAirPlayGroupableRoute:v117];
                    int v118 = v116 ^ [*(id *)(a1 + 56) routesContainAirPlayGroupableRoute:*(void *)(*(void *)(a1 + 56) + 1040)];
                    goto LABEL_64;
                  }
                  goto LABEL_65;
                }
                int v229 = v111;
                long long v119 = *(void **)(*(void *)(a1 + 56) + 1088);
                long long v120 = [v113 routeUID];
                int v253 = [v119 containsObject:v120];

                long long v121 = *(void **)(*(void *)(a1 + 56) + 1096);
                long long v122 = [v113 routeUID];
                int v123 = [v121 containsObject:v122];

                if ([v113 supportsGrouping])
                {
                  int v245 = v123;
                  int v225 = v89;
                  v114 = [*(id *)(a1 + 56) vendorSpecificManager];
                  id v117 = [*(id *)(a1 + 48) availableVendorSpecificDeviceIDs];
                  v210 = [*(id *)(a1 + 48) activatedVendorSpecificDeviceIDs];
                  long long v124 = [v113 protocolIdentifier];
                  int v125 = [v114 isGroupingAvailableFor:v117 activatedIDs:v210 forProtocolID:v124];
                  long long v126 = [*(id *)(v258 + 56) vendorSpecificManager];
                  uint64_t v127 = *(void *)(v258 + 56);
                  int v128 = v16;
                  uint64_t v129 = *(void *)(v127 + 1104);
                  uint64_t v130 = *(void *)(v127 + 1088);
                  long long v131 = [v113 protocolIdentifier];
                  uint64_t v132 = v129;
                  int v16 = v128;
                  int v118 = v125 ^ [v126 isGroupingAvailableFor:v132 activatedIDs:v130 forProtocolID:v131];

                  uint64_t v8 = v209;
                  a1 = v258;

                  int v111 = v229;
LABEL_64:
                  v16 |= v118;

                  int v89 = v225;
                  int v115 = v253;
LABEL_65:

                  int v123 = v245;
                  goto LABEL_67;
                }
                int v115 = v253;
LABEL_67:
                v111 |= v123;
                v89 |= v115;
              }
              uint64_t v241 = [v212 countByEnumeratingWithState:&v277 objects:v289 count:16];
              if (!v241)
              {
LABEL_71:
                char v228 = v111;

                if (*(void *)(*(void *)(a1 + 56) + 1352))
                {
                  char v133 = v89;
                  char v134 = v16;
                  v135 = [v208 mainRoute];
                  v136 = [v135 routeUID];
                  int v137 = [v136 isEqualToString:*(void *)(*(void *)(a1 + 56) + 1352)];

                  char v93 = v205;
                  if (v137)
                  {
                    uint64_t v138 = *(void *)(a1 + 56);
                    uint64_t v139 = *(void **)(v138 + 1352);
                    *(void *)(v138 + 1352) = 0;

                    LOBYTE(v16) = 1;
                    id v13 = v208;
                    char v88 = v234;
                  }
                  else
                  {
                    id v13 = v208;
                    char v88 = v234;
                    LOBYTE(v16) = v134;
                  }
                  char v91 = v219;
                  char v90 = v211;
                  LOBYTE(v89) = v133;
                }
                else
                {
                  id v13 = v208;
                  char v93 = v205;
                  char v88 = v234;
                  char v91 = v219;
                  char v90 = v211;
                }
                char v92 = obja;
                goto LABEL_78;
              }
            }
          }
        }
      }
LABEL_32:
      id v47 = [v8 mainRoute];
      id v48 = [v9 mainRoute];
      uint64_t v49 = [*(id *)(a1 + 48) activatedVendorSpecificDeviceIDs];
      id v50 = [v48 routeUID];
      char v204 = [v49 containsObject:v50];

      uint64_t v51 = a1;
      id v52 = *(void **)(*(void *)(a1 + 56) + 1088);
      uint64_t v53 = [v47 routeUID];
      char v54 = [v52 containsObject:v53];

      int v55 = [*(id *)(a1 + 48) pendingVendorSpecificDeviceIDs];
      uint64_t v56 = [v48 routeUID];
      char v57 = [v55 containsObject:v56];

      int v58 = *(void **)(*(void *)(a1 + 56) + 1096);
      id v59 = [v47 routeUID];
      char v228 = [v58 containsObject:v59];

      char v224 = v54;
      char v233 = v57;
      v252 = v48;
      if ([v48 supportsGrouping])
      {
        v239 = [*(id *)(a1 + 56) vendorSpecificManager];
        v220 = [*(id *)(a1 + 48) availableVendorSpecificDeviceIDs];
        id v60 = [*(id *)(a1 + 48) activatedVendorSpecificDeviceIDs];
        long long v61 = [v48 protocolIdentifier];
        int v62 = [v239 isGroupingAvailableFor:v220 activatedIDs:v60 forProtocolID:v61];
        long long v63 = [*(id *)(v51 + 56) vendorSpecificManager];
        uint64_t v64 = *(void *)(v51 + 56);
        uint64_t v65 = *(void *)(v64 + 1104);
        uint64_t v66 = *(void *)(v64 + 1088);
        long long v67 = [v48 protocolIdentifier];
        int v68 = v62 ^ [v63 isGroupingAvailableFor:v65 activatedIDs:v66 forProtocolID:v67];
      }
      else
      {
        int v68 = 0;
      }
      if ([v47 supportsGrouping])
      {
        v240 = [*(id *)(v258 + 56) vendorSpecificManager];
        v221 = [*(id *)(v258 + 48) availableVendorSpecificDeviceIDs];
        uint64_t v80 = [*(id *)(v258 + 48) activatedVendorSpecificDeviceIDs];
        long long v81 = [v47 protocolIdentifier];
        int v82 = [v240 isGroupingAvailableFor:v221 activatedIDs:v80 forProtocolID:v81];
        uint64_t v83 = [*(id *)(v258 + 56) vendorSpecificManager];
        uint64_t v84 = *(void *)(v258 + 56);
        uint64_t v85 = *(void *)(v84 + 1104);
        uint64_t v86 = *(void *)(v84 + 1088);
        uint64_t v87 = [v47 protocolIdentifier];
        v68 |= v82 ^ [v83 isGroupingAvailableFor:v85 activatedIDs:v86 forProtocolID:v87];
      }
      char v88 = v233;
      LOBYTE(v89) = v224;

      char v90 = 0;
      char v91 = 0;
      char v92 = 0;
      LOBYTE(v16) = v68 != 0;
      id v13 = v208;
      char v93 = v204;
LABEL_78:
      char v7 = v91 ^ v92 | v93 ^ v89 | v88 ^ v228 | v90 | v16;
      goto LABEL_30;
    }
    char v45 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if (v12 == 5 && (v45 & 1) == 0)
    {
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_28;
    }
    if (v12 == 7)
    {
      long long v275 = 0u;
      long long v276 = 0u;
      long long v273 = 0u;
      long long v274 = 0u;
      int v69 = [v9 routes];
      uint64_t v70 = [v69 countByEnumeratingWithState:&v273 objects:v288 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        int v72 = 0;
        int v73 = 0;
        uint64_t v74 = *(void *)v274;
        while (2)
        {
          for (uint64_t k = 0; k != v71; ++k)
          {
            if (*(void *)v274 != v74) {
              objc_enumerationMutation(v69);
            }
            long long v76 = *(void **)(*((void *)&v273 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_99:
              char v7 = 1;
              goto LABEL_100;
            }
            long long v77 = [*(id *)(v258 + 48) activatedVendorSpecificDeviceIDs];
            long long v78 = [v76 routeUID];
            v72 |= [v77 containsObject:v78];

            v79 = [*(id *)(v258 + 48) pendingPickedRoutes];
            v73 |= [v79 containsObject:v76];
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v273 objects:v288 count:16];
          if (v71) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v72) = 0;
        LOBYTE(v73) = 0;
      }

      long long v271 = 0u;
      long long v272 = 0u;
      long long v269 = 0u;
      long long v270 = 0u;
      id v246 = [v209 routes];
      uint64_t v140 = [v246 countByEnumeratingWithState:&v269 objects:v287 count:16];
      if (v140)
      {
        uint64_t v141 = v140;
        int v142 = 0;
        int v143 = 0;
        uint64_t v254 = *(void *)v270;
        while (2)
        {
          for (uint64_t m = 0; m != v141; ++m)
          {
            if (*(void *)v270 != v254) {
              objc_enumerationMutation(v246);
            }
            v145 = *(void **)(*((void *)&v269 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_99;
            }
            v146 = *(void **)(*(void *)(v258 + 56) + 1088);
            v147 = [v145 routeUID];
            v142 |= [v146 containsObject:v147];

            v148 = *(void **)(*(void *)(v258 + 56) + 1096);
            v149 = [v145 routeUID];
            v143 |= [v148 containsObject:v149];
          }
          uint64_t v141 = [v246 countByEnumeratingWithState:&v269 objects:v287 count:16];
          if (v141) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v142) = 0;
        LOBYTE(v143) = 0;
      }

      v162 = [v208 localizedTitle];
      v163 = [v209 localizedTitle];
      char v164 = [v162 isEqualToString:v163];

      v165 = [v208 localizedSubtitle];
      v166 = [v209 localizedSubtitle];
      char v167 = [v165 isEqualToString:v166];

      char v7 = 1;
      if (((v72 ^ v142) & 1) == 0)
      {
        char v168 = v73 ^ v143;
        id v13 = v208;
        uint64_t v8 = v209;
        if ((v168 & 1) == 0) {
          char v7 = v164 & v167 ^ 1;
        }
        goto LABEL_30;
      }
LABEL_100:
      uint64_t v8 = v209;
      goto LABEL_29;
    }
    if (v12 >= 2 && !(*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))()) {
      goto LABEL_28;
    }
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
    {
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0)
      {
        v159 = MCLogCategoryDeviceAccess();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE7DF000, v159, OS_LOG_TYPE_DEFAULT, "is update check: weird", buf, 2u);
        }

        v160 = 0;
        v161 = 0;
        char v7 = 0;
        goto LABEL_140;
      }
      id v94 = [v8 mainRoute];
      v95 = [v94 underlyingNativeRoute];

      v96 = [v9 mainRoute];
      uint64_t v97 = [v96 underlyingNativeRoute];

      id v98 = [*(id *)(a1 + 48) displayAsPickedRoutes];
      int v99 = [v98 containsObject:v97];

      v100 = [*(id *)(a1 + 48) pickedRoutes];
      int v101 = [v100 containsObject:v97];

      uint64_t v102 = [*(id *)(a1 + 48) pendingPickedRoutes];
      int v103 = [v102 containsObject:v97];

      int v104 = [*(id *)(*(void *)(a1 + 56) + 1040) containsObject:v95];
      int v105 = [*(id *)(*(void *)(a1 + 56) + 1016) containsObject:v95];
      uint64_t v106 = a1;
      int v107 = v105;
      int v108 = [*(id *)(*(void *)(v106 + 56) + 1032) containsObject:v95];
    }
    else
    {
      uint64_t v242 = [v8 mainRoute];
      uint64_t v235 = [v9 mainRoute];
      long long v264 = 0u;
      long long v265 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      v150 = [v9 routes];
      uint64_t v151 = [v150 countByEnumeratingWithState:&v264 objects:v286 count:16];
      if (v151)
      {
        uint64_t v152 = v151;
        int v99 = 0;
        int v101 = 0;
        int v103 = 0;
        uint64_t v153 = *(void *)v265;
        do
        {
          for (uint64_t n = 0; n != v152; ++n)
          {
            if (*(void *)v265 != v153) {
              objc_enumerationMutation(v150);
            }
            uint64_t v155 = *(void *)(*((void *)&v264 + 1) + 8 * n);
            v156 = [*(id *)(v258 + 48) displayAsPickedRoutes];
            v99 |= [v156 containsObject:v155];

            v157 = [*(id *)(v258 + 48) pickedRoutes];
            v101 |= [v157 containsObject:v155];

            v158 = [*(id *)(v258 + 48) pendingPickedRoutes];
            v103 |= [v158 containsObject:v155];
          }
          uint64_t v152 = [v150 countByEnumeratingWithState:&v264 objects:v286 count:16];
        }
        while (v152);
      }
      else
      {
        int v99 = 0;
        int v101 = 0;
        int v103 = 0;
      }

      long long v262 = 0u;
      long long v263 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      id v247 = [v209 routes];
      uint64_t v169 = [v247 countByEnumeratingWithState:&v260 objects:v285 count:16];
      if (v169)
      {
        uint64_t v170 = v169;
        int v104 = 0;
        int v107 = 0;
        int v108 = 0;
        uint64_t v255 = *(void *)v261;
        do
        {
          for (iuint64_t i = 0; ii != v170; ++ii)
          {
            if (*(void *)v261 != v255) {
              objc_enumerationMutation(v247);
            }
            uint64_t v172 = *(void *)(*((void *)&v260 + 1) + 8 * ii);
            v104 |= [*(id *)(*(void *)(v258 + 56) + 1040) containsObject:v172];
            v107 |= [*(id *)(*(void *)(v258 + 56) + 1016) containsObject:v172];
            v108 |= [*(id *)(*(void *)(v258 + 56) + 1032) containsObject:v172];
          }
          uint64_t v170 = [v247 countByEnumeratingWithState:&v260 objects:v285 count:16];
        }
        while (v170);
      }
      else
      {
        int v104 = 0;
        int v107 = 0;
        int v108 = 0;
      }

      uint64_t v97 = (void *)v235;
      v95 = (void *)v242;
    }
    v173 = [*(id *)(v258 + 48) volumeCapableRoutes];
    int v230 = [v173 containsObject:v97];
    int v256 = [*(id *)(*(void *)(v258 + 56) + 1048) containsObject:v97];

    v174 = [v95 batteryLevel];
    [v97 batteryLevel];
    v176 = v175 = v97;
    v243 = v95;
    if (v174 == v176)
    {
      int v222 = 0;
    }
    else
    {
      [v95 batteryLevel];
      v177 = id v248 = v174;
      v178 = [v175 batteryLevel];
      int v236 = [v177 isEqual:v178];

      v95 = v243;
      v174 = v248;
      int v222 = v236 ^ 1;
    }

    uint64_t v179 = [v95 routeName];
    v180 = [v175 routeName];
    id v249 = (id)v179;
    v237 = v175;
    if ((void *)v179 == v180)
    {
      int objb = 0;
    }
    else
    {
      v181 = [v95 routeName];
      v182 = [v175 routeName];
      int objb = [v181 isEqual:v182] ^ 1;
    }
    v183 = [v209 localizedSubtitle];
    v184 = [v208 localizedSubtitle];
    if (v183 == v184) {
      int v215 = 0;
    }
    else {
      int v215 = [v183 isEqual:v184] ^ 1;
    }
    v185 = v243;
    int v250 = v104 ^ v99;

    int v257 = v230 ^ v256;
    int v226 = v108 ^ v103;
    int v231 = v107 ^ v101;
    if (([v243 isSplitterCapable] & 1) != 0 || objc_msgSend(v237, "isSplitterCapable"))
    {
      v186 = *(void **)(v258 + 56);
      v187 = [*(id *)(v258 + 48) displayAsPickedRoutes];
      LODWORD(v186) = [v186 routesContainSplitterCapableRoute:v187];
      int v259 = v186 ^ [*(id *)(v258 + 56) routesContainSplitterCapableRoute:*(void *)(*(void *)(v258 + 56) + 1040)];
      v188 = v209;
    }
    else
    {
      v188 = v209;
      if (([v243 supportsAirPlayGrouping] & 1) == 0
        && ![v237 supportsAirPlayGrouping])
      {
        LOBYTE(v259) = 0;
LABEL_132:
        int v189 = [v185 isNearby];
        int v190 = [v237 isNearby];
        v191 = v185;
        int v192 = v190;
        int v193 = [v191 isKnown];
        int v194 = [v237 isKnown];
        int v195 = [v188 isExpanded];
        int v196 = [v208 isExpanded];
        char v197 = [v188 isExpandable];
        char v198 = [v208 isExpandable];
        v199 = v188;
        char v200 = v198;
        char v201 = [v199 isPickable];
        char v202 = [v208 isPickable];
        char v7 = 1;
        if ((v250 | v231 | v226 | v222 | objb | v215 | v257) & 1) != 0 || (v259 & 1) != 0 || ((v189 ^ v192))
        {
          uint64_t v8 = v209;
          v160 = v243;
        }
        else
        {
          v160 = v243;
          if (((v193 ^ v194) & 1) == 0 && ((v195 ^ v196) & 1) == 0) {
            char v7 = v197 ^ v200 | v201 ^ v202;
          }
          uint64_t v8 = v209;
        }
        v161 = v237;
LABEL_140:

        goto LABEL_29;
      }
      v203 = *(void **)(v258 + 56);
      v187 = [*(id *)(v258 + 48) displayAsPickedRoutes];
      LODWORD(v203) = [v203 routesContainAirPlayGroupableRoute:v187];
      int v259 = v203 ^ [*(id *)(v258 + 56) routesContainAirPlayGroupableRoute:*(void *)(*(void *)(v258 + 56) + 1040)];
    }

    v185 = v243;
    goto LABEL_132;
  }
  char v7 = 0;
LABEL_31:

  return v7 & 1;
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_245(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) deletedSections];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 40) view];
    id v5 = [v4 tableView];
    id v6 = [*(id *)(a1 + 32) deletedSections];
    [v5 deleteSections:v6 withRowAnimation:0];
  }
  char v7 = [*(id *)(a1 + 32) insertedSections];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) view];
    uint64_t v10 = [v9 tableView];
    uint64_t v11 = [*(id *)(a1 + 32) insertedSections];
    [v10 insertSections:v11 withRowAnimation:0];
  }
  unint64_t v12 = [*(id *)(a1 + 32) deletedItemIndexPaths];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 40) view];
    uint64_t v15 = [v14 tableView];
    int v16 = [*(id *)(a1 + 32) deletedItemIndexPaths];
    [v15 deleteRowsAtIndexPaths:v16 withRowAnimation:0];
  }
  int v17 = [*(id *)(a1 + 32) insertedItemIndexPaths];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 40) view];
    uint64_t v20 = [v19 tableView];
    uint64_t v21 = [*(id *)(a1 + 32) insertedItemIndexPaths];
    [v20 insertRowsAtIndexPaths:v21 withRowAnimation:0];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_2_246;
  v28[3] = &unk_1E5F0DF90;
  BOOL v22 = *(void **)(a1 + 32);
  void v28[4] = *(void *)(a1 + 40);
  [v22 enumerateItemMovesWithBlock:v28];
  uint64_t v23 = [*(id *)(a1 + 32) updatedItemIndexPaths];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    int v25 = [*(id *)(a1 + 40) view];
    uint64_t v26 = [v25 tableView];
    int v27 = [*(id *)(a1 + 32) updatedItemIndexPaths];
    [v26 reloadRowsAtIndexPaths:v27 withRowAnimation:0];
  }
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_2_246(uint64_t a1, void *a2, void *a3)
{
  char v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 view];
  char v7 = [v8 tableView];
  [v7 moveRowAtIndexPath:v6 toIndexPath:v5];
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_3_248(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_4_249;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__41__MRURoutingViewController__applyUpdate___block_invoke_4_249(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1344))
  {
    objc_msgSend((id)v2, "ensureVendorSpecificGroupTreeIsVisible:");
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 1344);
    *(void *)(v3 + 1344) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 992) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1000), *(id *)(*(void *)(a1 + 32) + 1208));
  double result = *(void **)(a1 + 32);
  if (result[122])
  {
    return objc_msgSend(result, "_applyUpdate:");
  }
  return result;
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_253(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1176));
  [WeakRetained routingViewControllerDidUpdateItems:*(void *)(a1 + 32)];
}

- (id)groupUIDForRoute:(id)a3
{
  id v3 = a3;
  char v4 = MRAVEndpointGetLocalEndpoint();
  id v5 = [v4 outputDeviceUIDs];
  id v6 = [v3 routeUID];
  int v7 = [v5 containsObject:v6];

  if (v7) {
    [MEMORY[0x1E4F76FC0] localDeviceUID];
  }
  else {
  id v8 = [v3 groupUID];
  }

  return v8;
}

- (id)_createRoutingViewItemsForUpdate:(id)a3
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v122 = a3;
  id v3 = [v122 displayableAvailableRoutes];
  long long v120 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  int v118 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  int v125 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  char v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = MRAVEndpointGetLocalEndpoint();
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  int v7 = [v5 outputDeviceUIDs];
  uint64_t v129 = [v6 setWithArray:v7];

  v114 = [MEMORY[0x1E4F76FC0] localDeviceUID];
  int v104 = v5;
  id v8 = [v5 outputDevices];
  uint64_t v9 = [v8 firstObject];
  int v107 = [v9 uid];

  v116 = (void *)[v3 mutableCopy];
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v163 objects:v175 count:16];
  int v105 = v10;
  if (!v11)
  {
    unint64_t v127 = 0;
    unint64_t v13 = 0;
    unint64_t v130 = 0;
    goto LABEL_32;
  }
  uint64_t v12 = v11;
  unint64_t v127 = 0;
  unint64_t v13 = 0;
  unint64_t v130 = 0;
  uint64_t v14 = *(void *)v164;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v164 != v14) {
        objc_enumerationMutation(v10);
      }
      int v16 = *(void **)(*((void *)&v163 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v16 isDeviceSpeakerRoute] & 1) == 0)
      {
        id v17 = v16;
        uint64_t v18 = [(MRURoutingViewController *)self groupUIDForRoute:v17];
        id v19 = [v17 routeUID];
        int v20 = [v19 isEqualToString:v107];

        if (v20)
        {
          uint64_t v21 = v4;
          id v22 = v17;
          uint64_t v23 = v114;
          goto LABEL_10;
        }
        if ([v17 isGroupLeader] && v18 && v18 != v114)
        {
          uint64_t v24 = [v4 objectForKeyedSubscript:v18];

          if (!v24)
          {
            uint64_t v21 = v4;
            id v22 = v17;
            uint64_t v23 = v18;
LABEL_10:
            [v21 setObject:v22 forKeyedSubscript:v23];
LABEL_23:
            if (([v17 isLocalDeviceOrHeadphone] & 1) == 0)
            {
              if (([v17 isKnown] & 1) == 0)
              {
                ++v130;
                uint64_t v28 = [v17 outputDevice];
                uint64_t v29 = [v28 recommendation];
                unsigned int v30 = [v29 isConservativelyFiltered];

                v127 += v30;
                id v10 = v105;
              }
              ++v13;
            }

            continue;
          }
        }
        else if (!v18)
        {
          goto LABEL_23;
        }
        expandedItemUIDs = self->_expandedItemUIDs;
        uint64_t v26 = [v17 routeUID];
        if (![(NSMutableSet *)expandedItemUIDs containsObject:v26])
        {
          char v27 = [v17 isHeadphonesRoute];

          if (v27) {
            goto LABEL_23;
          }
          uint64_t v26 = [v125 objectForKeyedSubscript:v18];
          if (!v26)
          {
            uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
            [v125 setObject:v26 forKeyedSubscript:v18];
          }
          [v26 addObject:v17];
        }

        goto LABEL_23;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v163 objects:v175 count:16];
  }
  while (v12);
LABEL_32:

  self->_allRoutesAreUnknowuint64_t n = v130 == v13;
  if (v127) {
    BOOL v32 = v130 == v13 && v127 < v130;
  }
  else {
    BOOL v32 = 0;
  }
  BOOL v33 = v13 < 4;
  if (v13 >= 4)
  {
    if (v130) {
      BOOL v35 = v130 >= v13;
    }
    else {
      BOOL v35 = 1;
    }
    BOOL v34 = !v35 || v32;
  }
  else
  {
    BOOL v34 = 0;
  }
  self->_someRoutesAreFiltered = v34;
  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke;
  v159[3] = &unk_1E5F0EE80;
  id v36 = v4;
  id v160 = v36;
  id v161 = v125;
  id v37 = v116;
  id v162 = v37;
  id v126 = v161;
  [v161 enumerateKeysAndObjectsUsingBlock:v159];
  BOOL didSelectShowMore = self->_didSelectShowMore;
  allRoutesAreUnknowuint64_t n = self->_allRoutesAreUnknown;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_2;
  aBlock[3] = &unk_1E5F0EEA8;
  id v103 = v120;
  id v153 = v103;
  BOOL v155 = allRoutesAreUnknown;
  BOOL v156 = v32;
  BOOL v157 = v33;
  BOOL v158 = didSelectShowMore;
  id v102 = v118;
  id v154 = v102;
  int v40 = (void (**)(void *, void *))_Block_copy(aBlock);
  int v128 = v36;
  int v115 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v36, "count"));
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_3;
  v150[3] = &unk_1E5F0EC60;
  id v110 = v122;
  id v151 = v110;
  uint64_t v41 = objc_msgSend(v37, "msv_compactMap:", v150);
  if ((unint64_t)[v41 count] < 2)
  {
    id v42 = 0;
  }
  else
  {
    id v42 = [v41 objectAtIndexedSubscript:0];
  }
  uint64_t v106 = v41;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id obj = v37;
  uint64_t v113 = [obj countByEnumeratingWithState:&v146 objects:v174 count:16];
  if (v113)
  {
    uint64_t v112 = *(void *)v147;
    int v108 = v42;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v147 != v112) {
          objc_enumerationMutation(obj);
        }
        uint64_t v119 = v43;
        uint64_t v44 = *(void **)(*((void *)&v146 + 1) + 8 * v43);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ([v44 isGroupSession])
            {
              uint64_t v70 = [MEMORY[0x1E4F31858] itemWithRoute:v44];
              v40[2](v40, v70);
              goto LABEL_135;
            }
            goto LABEL_136;
          }
          id v67 = v44;
          id v68 = [(MRURoutingViewController *)self groupUIDForRoute:v67];
          int v69 = [v67 routeUID];
          if ([v129 containsObject:v69])
          {
            uint64_t v70 = v67;
            char v71 = [v67 isHeadphonesRoute];

            if ((v71 & 1) == 0)
            {
              int v69 = v68;
              id v68 = v114;
              goto LABEL_92;
            }
          }
          else
          {
            uint64_t v70 = v67;
LABEL_92:
          }
          int v73 = [v128 objectForKeyedSubscript:v68];
          uint64_t v74 = [v126 objectForKeyedSubscript:v68];
          char v75 = [(NSMutableSet *)self->_expandedGroupUIDs containsObject:v68];
          if (v73
            && (char v76 = v75, v77 = [v74 count], v68)
            && v77
            && ([v74 arrayByAddingObject:v73],
                long long v78 = objc_claimAutoreleasedReturnValue(),
                [v115 setObject:v78 forKeyedSubscript:v68],
                v78,
                (v76 & 1) == 0))
          {
            if (v70 == v73)
            {
              long long v81 = [MEMORY[0x1E4F31858] itemWithLeader:v70 members:v74];
              v40[2](v40, v81);
              goto LABEL_133;
            }
          }
          else
          {
            v79 = [v110 nativeRoutesInVendorSpecificGroup];
            char v80 = [v79 containsObject:v70];

            if ((v80 & 1) == 0)
            {
              long long v81 = [MEMORY[0x1E4F31858] itemWithRoute:v70];
              expandedRouteUIDs = self->_expandedRouteUIDs;
              uint64_t v83 = [v70 routeUID];
              objc_msgSend(v81, "setExpanded:", -[NSMutableSet containsObject:](expandedRouteUIDs, "containsObject:", v83));

              v40[2](v40, v81);
              if ([v81 isExpanded])
              {
                long long v124 = v74;
                uint64_t v132 = v73;
                long long v136 = 0u;
                long long v137 = 0u;
                long long v134 = 0u;
                long long v135 = 0u;
                uint64_t v84 = [v70 subRoutes];
                uint64_t v85 = [v84 countByEnumeratingWithState:&v134 objects:v167 count:16];
                if (v85)
                {
                  uint64_t v86 = v85;
                  uint64_t v87 = *(void *)v135;
                  do
                  {
                    for (uint64_t j = 0; j != v86; ++j)
                    {
                      if (*(void *)v135 != v87) {
                        objc_enumerationMutation(v84);
                      }
                      int v89 = [MEMORY[0x1E4F31858] itemWithRoute:*(void *)(*((void *)&v134 + 1) + 8 * j)];
                      v40[2](v40, v89);
                    }
                    uint64_t v86 = [v84 countByEnumeratingWithState:&v134 objects:v167 count:16];
                  }
                  while (v86);
                }

                int v73 = v132;
                uint64_t v74 = v124;
              }
LABEL_133:
            }
          }

          id v42 = v108;
          goto LABEL_135;
        }
        id v45 = v44;
        long long v46 = v45;
        id v117 = v45;
        if (v42 && !self->_didExpandVendorSpecificSpeakerGroup)
        {
          if (v42 == v45)
          {
            int v72 = [MEMORY[0x1E4F31858] itemWithVendorSpecificLeader:v42 members:v106];
            v40[2](v40, v72);
            char v90 = MCLogCategoryDeviceAccess();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              id v98 = [v72 localizedTitle];
              int v99 = [v72 localizedSubtitle];
              *(_DWORD *)buf = 138412546;
              v171 = v98;
              __int16 v172 = 2112;
              v173 = v99;
              _os_log_impl(&dword_1AE7DF000, v90, OS_LOG_TYPE_DEFAULT, "Adding vendor specific speaker group: %@, %@", buf, 0x16u);

              id v42 = v108;
            }
            goto LABEL_128;
          }
          long long v46 = v45;
          if ([v106 containsObject:v45])
          {
            int v72 = MCLogCategoryDeviceAccess();
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_129;
            }
            char v90 = [v117 routeName];
            *(_DWORD *)buf = 138412290;
            v171 = v90;
            _os_log_impl(&dword_1AE7DF000, v72, OS_LOG_TYPE_DEFAULT, "Skipping member speaker in vendor specific group: %@@", buf, 0xCu);
LABEL_128:

            goto LABEL_129;
          }
        }
        if (![v46 isGroup])
        {
          int v72 = [MEMORY[0x1E4F31858] itemWithVendorSpecificRoute:v46];
          v40[2](v40, v72);
          goto LABEL_129;
        }
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v47 = [v46 subroutes];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v142 objects:v169 count:16];
        if (!v48)
        {

          goto LABEL_115;
        }
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v143;
        int v111 = 1;
        uint64_t v121 = *(void *)v143;
        int v123 = v47;
        while (2)
        {
          uint64_t v51 = 0;
          uint64_t v131 = v49;
          do
          {
            if (*(void *)v143 != v50) {
              objc_enumerationMutation(v47);
            }
            id v52 = *(void **)(*((void *)&v142 + 1) + 8 * v51);
            if ([v52 isAirPlayRoute])
            {
              uint64_t v53 = [v52 underlyingNativeRoute];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v54 = v53;
                id v55 = [(MRURoutingViewController *)self groupUIDForRoute:v54];
                uint64_t v56 = [v54 routeUID];
                if (![v129 containsObject:v56]) {
                  goto LABEL_70;
                }
                char v57 = [v54 isHeadphonesRoute];

                if ((v57 & 1) == 0)
                {
                  uint64_t v56 = v55;
                  id v55 = v114;
LABEL_70:
                }
                int v58 = [v128 objectForKeyedSubscript:v55];
                id v59 = [v126 objectForKeyedSubscript:v55];
                char v60 = [(NSMutableSet *)self->_expandedGroupUIDs containsObject:v55];
                if (!v58) {
                  goto LABEL_77;
                }
                char v61 = v60;
                uint64_t v62 = [v59 count];
                int v63 = 1;
                if (v55 && v62)
                {
                  uint64_t v64 = [v59 arrayByAddingObject:v58];
                  [v115 setObject:v64 forKeyedSubscript:v55];

                  if ((v61 & 1) == 0)
                  {
                    uint64_t v65 = [v110 nativeRoutesInVendorSpecificGroup];
                    int v66 = [v65 containsObject:v54];

                    if (v66)
                    {
                      int v63 = 0;
                      v111 &= [(MRURoutingViewController *)self shouldSuppressNativeRoutesStatusDisplay];
                      goto LABEL_78;
                    }
                  }
LABEL_77:
                  int v63 = 1;
                }
LABEL_78:

                if (!v63)
                {

                  goto LABEL_112;
                }
                uint64_t v50 = v121;
                id v47 = v123;
                uint64_t v49 = v131;
              }
            }
            ++v51;
          }
          while (v49 != v51);
          uint64_t v49 = [v47 countByEnumeratingWithState:&v142 objects:v169 count:16];
          if (v49) {
            continue;
          }
          break;
        }

LABEL_112:
        if ((v111 & 1) == 0)
        {
          id v42 = v108;
          goto LABEL_130;
        }
LABEL_115:
        int v72 = [MEMORY[0x1E4F31858] itemWithVendorSpecificRoute:v117];
        v40[2](v40, v72);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        char v91 = [v117 subroutes];
        uint64_t v92 = [v91 countByEnumeratingWithState:&v138 objects:v168 count:16];
        if (v92)
        {
          uint64_t v93 = v92;
          uint64_t v94 = *(void *)v139;
          do
          {
            for (uint64_t k = 0; k != v93; ++k)
            {
              if (*(void *)v139 != v94) {
                objc_enumerationMutation(v91);
              }
              v96 = *(void **)(*((void *)&v138 + 1) + 8 * k);
              if ([v96 shouldBeDisplayed])
              {
                uint64_t v97 = [MEMORY[0x1E4F31858] itemWithVendorSpecificRoute:v96];
                v40[2](v40, v97);
              }
            }
            uint64_t v93 = [v91 countByEnumeratingWithState:&v138 objects:v168 count:16];
          }
          while (v93);
        }

        id v42 = v108;
LABEL_129:

LABEL_130:
        uint64_t v70 = v117;
LABEL_135:

LABEL_136:
        uint64_t v43 = v119 + 1;
      }
      while (v119 + 1 != v113);
      uint64_t v113 = [obj countByEnumeratingWithState:&v146 objects:v174 count:16];
    }
    while (v113);
  }

  v100 = objc_alloc_init(MRURoutingViewControllerItems);
  [(MRURoutingViewControllerItems *)v100 setRouteGrouping:v115];
  [(MRURoutingViewControllerItems *)v100 setLocalDevicesAndHeadphones:v103];
  [(MRURoutingViewControllerItems *)v100 setSpeakersAndTVs:v102];
  [(MRURoutingViewControllerItems *)v100 setCustomRows:self->_staticCustomRowItems];

  return v100;
}

void __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke(id *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [a1[4] objectForKeyedSubscript:v13];

  if (!v6)
  {
    int v7 = [v5 firstObject];
    [a1[4] setObject:v7 forKeyedSubscript:v13];

    uint64_t v8 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);

    [a1[5] setObject:v8 forKeyedSubscript:v13];
    id v5 = (id)v8;
  }
  uint64_t v9 = [a1[4] objectForKeyedSubscript:v13];
  if ([v5 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v5 objectAtIndexedSubscript:v10];
      uint64_t v12 = (void *)v11;
      if (!v9 || v9 == (void *)v11)
      {
        ++v10;
      }
      else
      {
        [a1[6] removeObject:v11];
        objc_msgSend(a1[6], "insertObject:atIndex:", v12, ++v10 + objc_msgSend(a1[6], "indexOfObject:", v9));
      }
    }
    while ([v5 count] > v10);
  }
}

void __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 mainRoute];
  if (([v3 isLocalDeviceOrHeadphone] & 1) != 0
    || ([v3 isWiredDevice] & 1) != 0
    || [v3 isGroupSession])
  {
    char v4 = *(void **)(a1 + 32);
LABEL_5:
    [v4 addObject:v14];
    goto LABEL_6;
  }
  id v5 = [MEMORY[0x1E4F770F0] currentSettings];
  int v6 = [v5 supportShowMore];

  if (!v6)
  {
    char v4 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v3;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [v8 outputDevice];
  unint64_t v10 = [v9 recommendation];
  int v11 = [v10 isConservativelyFiltered];

  if ([v3 isKnown]) {
    int v12 = 1;
  }
  else {
    int v12 = *(unsigned __int8 *)(a1 + 48);
  }
  if (*(unsigned char *)(a1 + 50)) {
    goto LABEL_18;
  }
  BOOL v13 = v12 == 0;
  if (!*(unsigned char *)(a1 + 49)) {
    int v11 = v13;
  }
  if (([v3 isPicked] & 1) != 0 || !v11 || *(unsigned char *)(a1 + 51)) {
LABEL_18:
  }
    [*(id *)(a1 + 40) addObject:v14];

LABEL_6:
}

id __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = 0;
    goto LABEL_16;
  }
  id v4 = v3;
  if ([v4 isGroup])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = objc_msgSend(v4, "subroutes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        int v11 = [*(id *)(a1 + 32) activatedVendorSpecificDeviceIDs];
        int v12 = [v10 routeUID];
        char v13 = [v11 containsObject:v12];

        if (v13) {
          goto LABEL_15;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v7) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) activatedVendorSpecificDeviceIDs];
    uint64_t v15 = [v4 routeUID];
    char v16 = [v14 containsObject:v15];

    if (v16) {
      goto LABEL_16;
    }
  }
  id v5 = v4;
  id v4 = 0;
LABEL_15:

LABEL_16:

  return v4;
}

- (void)_collapseAllGroups
{
  self->_didExpandVendorSpecificSpeakerGroup = 0;
}

- (void)_collapseAllGroupsAfterDelay
{
  [(NSTimer *)self->_collapseTimer invalidate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __56__MRURoutingViewController__collapseAllGroupsAfterDelay__block_invoke;
  v5[3] = &unk_1E5F0DE50;
  void v5[4] = self;
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:2.0];
  collapseTimer = self->_collapseTimer;
  self->_collapseTimer = v3;
}

void __56__MRURoutingViewController__collapseAllGroupsAfterDelay__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _collapseAllGroups];
  [*(id *)(a1 + 32) _setNeedsDisplayedRoutesUpdate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1328);
  *(void *)(v2 + 1328) = 0;
}

- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F319D8];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  unint64_t v10 = [v8 localDevicesAndHeadphones];
  int v11 = [v8 speakersAndTVs];
  int v12 = [v8 customRows];

  char v13 = [v11 arrayByAddingObjectsFromArray:v12];

  if ([v10 count])
  {
    [v9 appendSection:@"LOCAL DEVICES"];
    [v9 appendItems:v10];
    id v14 = [(MRURoutingViewController *)self endpointRoute];
    if ([v14 isSplitRoute])
    {
LABEL_11:

      goto LABEL_12;
    }
    BOOL v15 = [(MRURoutingViewController *)self routesContainSplitterCapableRoute:v6];

    if (!v15) {
      goto LABEL_12;
    }
    uint64_t v16 = [(MRURoutingViewController *)self isInVehicle] ^ 1;
    if ([(MRURoutingViewController *)self isInCarPlay])
    {
      uint64_t v17 = +[MRUStringsProvider audioSharingDisabledCarPlay];
    }
    else
    {
      if (![(MRURoutingViewController *)self hasCarKitRoute])
      {
        id v14 = 0;
        goto LABEL_10;
      }
      uint64_t v17 = +[MRUStringsProvider audioShaingDisabledCarKit];
    }
    id v14 = (void *)v17;
LABEL_10:
    long long v18 = (void *)MEMORY[0x1E4F31858];
    long long v19 = +[MRUStringsProvider audioShaingActionTitle];
    long long v20 = [v18 itemWithActionTitle:v19 subtitle:v14 enabled:v16 identifier:*MEMORY[0x1E4F31288] image:0];

    v28[0] = v20;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v9 appendItems:v21];

    goto LABEL_11;
  }
LABEL_12:
  if ([v13 count])
  {
    id v22 = +[MRUStringsProvider routingHeaderSpeakersAndTVsTitle];
    [v9 appendSection:v22];

    if ([(MRURoutingViewController *)self _shouldShowShowMoreButton])
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F31858];
      uint64_t v24 = +[MRUStringsProvider routingFooterShowMoreTitle];
      int v25 = [v23 itemWithActionTitle:v24 subtitle:0 enabled:1 identifier:@"Show more" image:0];

      uint64_t v26 = [v13 arrayByAddingObject:v25];

      char v13 = (void *)v26;
    }
    [v9 appendItems:v13];
  }

  return v9;
}

- (BOOL)routesContainMultipleBuiltIn:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = 0;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "pickableRouteType", (void)v10))
        {
          if (v6)
          {
            unsigned int v6 = 2;
            goto LABEL_14;
          }
          unsigned int v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
LABEL_14:

  return v6 > 1;
}

- (BOOL)routesContainSplitterCapableRoute:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (routesContainSplitterCapableRoute__onceToken != -1) {
    dispatch_once(&routesContainSplitterCapableRoute__onceToken, &__block_literal_global_265);
  }
  if (routesContainSplitterCapableRoute____supportsWirelessSplitting)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isSplitterCapable", (void)v9))
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

uint64_t __62__MRURoutingViewController_routesContainSplitterCapableRoute___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  routesContainSplitterCapableRoute____supportsWirelessSplitting = result;
  return result;
}

- (BOOL)routesContainAirPlayGroupableRoute:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "supportsAirPlayGrouping", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)ensureVendorSpecificGroupTreeIsVisible:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v4];
  uint64_t v6 = [v5 mainRoute];
  uint64_t v7 = [v6 subroutes];
  long long v8 = objc_msgSend(v7, "msv_compactMap:", &__block_literal_global_270);
  uint64_t v9 = [v8 count];

  unint64_t v10 = [v4 row] + v9;
  long long v11 = [(MRURoutingViewController *)self view];
  long long v12 = [v11 tableView];
  unint64_t v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  if (v10 >= v13)
  {
    uint64_t v14 = MCLogCategoryDeviceAccess();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v4 row] + v9;
      uint64_t v16 = [(MRURoutingViewController *)self view];
      uint64_t v17 = [v16 tableView];
      int v34 = 134218240;
      uint64_t v35 = v15;
      __int16 v36 = 2048;
      uint64_t v37 = objc_msgSend(v17, "numberOfRowsInSection:", objc_msgSend(v4, "section"));
      _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "ensureVendorSpecificGroupTreeIsVisible - Want to scroll to row %lu, but there are only %ld rows", (uint8_t *)&v34, 0x16u);
    }
  }
  long long v18 = (void *)MEMORY[0x1E4F28D58];
  unint64_t v19 = [v4 row] + v9;
  long long v20 = [(MRURoutingViewController *)self view];
  long long v21 = [v20 tableView];
  unint64_t v22 = objc_msgSend(v21, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  if (v19 >= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v19;
  }
  uint64_t v24 = objc_msgSend(v18, "indexPathForRow:inSection:", v23, objc_msgSend(v4, "section"));
  int v25 = [(MRURoutingViewController *)self view];
  uint64_t v26 = [v25 tableView];
  char v27 = [v26 indexPathsForVisibleRows];
  uint64_t v28 = [v27 lastObject];

  uint64_t v29 = [v28 section];
  if (v29 < [v24 section]
    || (uint64_t v30 = [v28 section], v30 == objc_msgSend(v24, "section"))
    && (uint64_t v31 = [v28 row], v31 < objc_msgSend(v24, "row")))
  {
    BOOL v32 = [(MRURoutingViewController *)self view];
    BOOL v33 = [v32 tableView];
    [v33 scrollToRowAtIndexPath:v24 atScrollPosition:3 animated:1];
  }
}

id __67__MRURoutingViewController_ensureVendorSpecificGroupTreeIsVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 shouldBeDisplayed]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldShowShowMoreButton
{
  id v3 = [MEMORY[0x1E4F770F0] currentSettings];
  int v4 = [v3 supportShowMore];

  return v4 && self->_someRoutesAreFiltered && !self->_didSelectShowMore;
}

- (id)symbolNameForVendorSpecificRoute:(id)a3
{
  uint64_t v3 = [a3 vendorSpecificRouteType];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"hifispeaker.fill";
  }
  else {
    return off_1E5F0EFA8[v3 - 1];
  }
}

- (BOOL)handleSelectedRoutingViewItem:(id)a3 operation:(int64_t)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v45 = [v6 routes];
  uint64_t v7 = [v6 mainRoute];
  [(MRUVendorSpecificDeviceManager *)self->_vendorSpecificManager disconnectAllDevices];
  if ([v6 type] == 5)
  {
    id v8 = v7;
    if (![v8 isAirPlayRoute])
    {
      uint64_t v7 = v8;
      goto LABEL_9;
    }
    uint64_t v7 = [v8 underlyingNativeRoute];

    v55[0] = v7;
    uint64_t v9 = v55;
    goto LABEL_7;
  }
  if ([v6 type] != 4) {
    goto LABEL_10;
  }
  vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
  long long v11 = [v7 routeUID];
  id v8 = [(NSMutableDictionary *)vendorSpecificGroupDisplayedSubroutes objectForKeyedSubscript:v11];

  if ([v8 isAirPlayRoute])
  {
    uint64_t v12 = [v8 underlyingNativeRoute];

    uint64_t v54 = v12;
    uint64_t v9 = &v54;
    uint64_t v7 = (void *)v12;
LABEL_7:
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

    id v45 = (void *)v13;
  }
LABEL_9:

LABEL_10:
  if (v7)
  {
    uint64_t v43 = v6;
    self->_hasUserSelections = 1;
    int64_t v14 = a4;
    if (a4 == 2)
    {
      if ([(MRURoutingViewController *)self shouldSuppressNativeRoutesStatusDisplay])
      {
        int64_t v14 = 1;
      }
      else
      {
        int64_t v14 = 2;
      }
    }
    self->_didLastPickNativeRoute = 1;
    uint64_t v15 = [(MPAVRoutingController *)self->_routingController pickedRoutes];
    uint64_t v16 = [(MRGroupSessionDiscovery *)self->_groupSessionDiscovery activeSession];
    uint64_t v17 = v7;
    long long v18 = v7;
    int64_t v19 = v14;
    BOOL v42 = [(MRURoutingViewController *)self _wouldShareAudioForPickedRoute:v18 operation:v14 pickedRoutes:v15];
    int v41 = [(MPAVRoutingController *)self->_routingController supportsMultipleSelection];
    long long v20 = [(MRURoutingViewController *)self endpointRoute];
    int v21 = [v20 isGroupSession];

    uint64_t v44 = (void *)v16;
    if (v16)
    {
      unint64_t v22 = [(MRURoutingViewController *)self endpointRoute];
      unint64_t v23 = [v22 endpointObject];
      int v24 = [v23 isLocalEndpoint];
    }
    else
    {
      int v24 = 0;
    }
    id v6 = v43;
    int v26 = v21 & v24;
    if (a4 == 1 && ![v43 type])
    {
      expandedItemUIDs = self->_expandedItemUIDs;
      uint64_t v28 = [v17 routeUID];
      [(NSMutableSet *)expandedItemUIDs addObject:v28];
    }
    int64_t v29 = v19;
    uint64_t v7 = v17;
    if (v26
      && [(MRURoutingViewController *)self _wouldEndGroupSessionForViewItem:v43 operation:v29 pickedRoutes:v15])
    {
      uint64_t v30 = [(MRGroupSession *)self->_activeGroupSession participants];
      uint64_t v31 = [v30 count];

      BOOL v32 = MCLogCategoryDefault();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v33)
        {
          activeGroupSessiouint64_t n = self->_activeGroupSession;
          *(_DWORD *)buf = 138543618;
          uint64_t v51 = (MRGroupSession *)v7;
          __int16 v52 = 2114;
          uint64_t v53 = activeGroupSession;
          _os_log_impl(&dword_1AE7DF000, v32, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] User picked route that would end hosted group session. Route: %{public}@, active group session: %{public}@", buf, 0x16u);
        }

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __68__MRURoutingViewController_handleSelectedRoutingViewItem_operation___block_invoke;
        v46[3] = &unk_1E5F0EEF0;
        void v46[4] = self;
        id v47 = v45;
        int64_t v49 = v29;
        id v48 = v43;
        [(MRURoutingViewController *)self _displayEndGroupSessionWithCompletion:v46];

        goto LABEL_48;
      }
      if (v33)
      {
        uint64_t v35 = self->_activeGroupSession;
        *(_DWORD *)buf = 138543362;
        uint64_t v51 = v35;
        _os_log_impl(&dword_1AE7DF000, v32, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Continuing with action while in hosted group session because session has no participants: %{public}@", buf, 0xCu);
      }
    }
    if ([v7 isDiscoveredGroupSession])
    {
      __int16 v36 = MCLogCategoryDefault();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v51 = (MRGroupSession *)v7;
        _os_log_impl(&dword_1AE7DF000, v36, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] User picked route that will join group session: %{public}@", buf, 0xCu);
      }

      [(MRURoutingViewController *)self handleGroupSessionJoinWithPickedRoute:v7];
    }
    else if (v29 == 2 && [v7 isDeviceSpeakerRoute])
    {
      uint64_t v37 = MCLogCategoryDefault();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v37, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] RCS cannot remove device route", buf, 2u);
      }
    }
    else
    {
      if (([(MRURoutingViewController *)self isInVehicle] & v41 & v42) != 1)
      {
        [(MRURoutingViewController *)self selectRoutes:v45 operation:v29 routingViewItem:v43];
LABEL_48:
        BOOL v25 = 1;
LABEL_52:

        goto LABEL_53;
      }
      uint64_t v38 = MCLogCategoryDefault();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = (MRGroupSession *)v7;
        __int16 v52 = 2114;
        uint64_t v53 = v15;
        _os_log_impl(&dword_1AE7DF000, v38, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Can't share audio while in the Car. Route: %{public}@, picked: %{public}@", buf, 0x16u);
      }

      if ([(MRURoutingViewController *)self isInCarPlay]) {
        +[MRUStringsProvider audioSharingDisabledCarPlaySameOwner];
      }
      else {
      uint64_t v39 = +[MRUStringsProvider audioSharingDisabledCarKitSameOwner];
      }
      [(MRURoutingViewController *)self _displayShareAudioDisabledAlertForReason:v39];
    }
    BOOL v25 = 0;
    goto LABEL_52;
  }
  uint64_t v15 = MCLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_ERROR, "[MRURoutingViewController] RCS attempted to select a nil route, ignoring.", buf, 2u);
  }
  BOOL v25 = 0;
LABEL_53:

  return v25;
}

uint64_t __68__MRURoutingViewController_handleSelectedRoutingViewItem_operation___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) selectRoutes:*(void *)(result + 40) operation:*(void *)(result + 56) routingViewItem:*(void *)(result + 48)];
  }
  return result;
}

- (void)selectRoutes:(id)a3 operation:(int64_t)a4 routingViewItem:(id)a5
{
  id v8 = a5;
  routingController = self->_routingController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke;
  v11[3] = &unk_1E5F0EF18;
  BOOL v13 = a4 == 1;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(MPAVRoutingController *)routingController selectRoutes:a3 operation:a4 completion:v11];
}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    void block[5] = v5;
    block[6] = v4;
    block[9] = v2;
    block[10] = v3;
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_2;
    block[3] = &unk_1E5F0D7F8;
    void block[4] = *(void *)(a1 + 32);
    id v8 = MEMORY[0x1E4F14428];
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_293;
    void v10[3] = &unk_1E5F0DD10;
    char v12 = *(unsigned char *)(a1 + 48);
    uint64_t v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    dispatch_async(v8, v10);
  }
}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) endpointRoute];
  uint64_t v3 = [v2 endpointObject];

  if (v3)
  {
    uint64_t v4 = +[MRURouteRecommender sharedInstance];
    uint64_t v5 = [*(id *)(a1 + 32) donatingAppBundleID];
    -[NSObject donatePickerChoiceFor:bundleID:isEligibleApp:reason:](v4, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v3, v5, [*(id *)(a1 + 32) isDonatingAppEligible], @"selectRoutes");
  }
  else
  {
    uint64_t v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      dispatch_time_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 endpointRoute];
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      char v12 = v7;
      __int16 v13 = 2112;
      int64_t v14 = v8;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "%{public}@<%p> Attempt to donate nil endpoint from route:%@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_293(uint64_t a1)
{
  if (!+[MRUFeatureFlagProvider isRoutePickerNotCollapseGroupAutomaticallyEnabled]&& *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _collapseAllGroupsAfterDelay];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1176));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingViewController:*(void *)(a1 + 32) didSelectRoutingViewItem:*(void *)(a1 + 40)];
  }
}

- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  routingController = self->_routingController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5F0EF60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPAVRoutingController *)routingController fetchAvailableRoutesWithCompletionHandler:v7];
}

void __70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = (id)[a2 mutableCopy];
  id v3 = *(id *)(*(void *)(a1 + 32) + 1208);
  id v4 = *(id *)(*(void *)(a1 + 32) + 1400);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1232);
  if (v5)
  {
    id v6 = v5;
    if (!v4) {
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_time_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v7 bundleIdentifier];

    if (!v4) {
      goto LABEL_13;
    }
  }
  if ([v3 isDeviceRoute]) {
    char v8 = MRBundlePermittedForJoiningGroupSessions() ^ 1;
  }
  else {
    char v8 = 1;
  }
  int v9 = [v3 isDeviceRoute];
  uint64_t v10 = [v4 activeSession];
  __int16 v11 = (void *)v10;
  if (v9 && (v8 & 1) == 0 && !v10)
  {
    char v12 = [v4 discoveredSessions];
    __int16 v13 = objc_msgSend(v12, "msv_map:", &__block_literal_global_296);

    [v14 addObjectsFromArray:v13];
  }

LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

MRUDiscoveredGroupSessionRoute *__70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRUDiscoveredGroupSessionRoute alloc] initWithDiscoveredGroupSession:v2];

  return v3;
}

- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MRURoutingViewController_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__MRURoutingViewController_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayedRoutes];
}

- (void)groupSessionDiscovery:(id)a3 activeSessionDidChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MRURoutingViewController_groupSessionDiscovery_activeSessionDidChange___block_invoke;
  v7[3] = &unk_1E5F0D8E8;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __73__MRURoutingViewController_groupSessionDiscovery_activeSessionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1408);
  if (v2)
  {
    id v3 = [v2 identifier];
    id v4 = [*(id *)(a1 + 40) identifier];
    if (v3 == v4)
    {
    }
    else
    {
      id v5 = v4;
      char v6 = [v3 isEqual:v4];

      if ((v6 & 1) == 0)
      {
        dispatch_time_t v7 = MCLogCategoryDefault();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [*(id *)(*(void *)(a1 + 32) + 1408) identifier];
          int v19 = 138543362;
          long long v20 = v8;
          _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] End observing group session: %{public}@", (uint8_t *)&v19, 0xCu);
        }
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void **)(v9 + 1408);
        *(void *)(v9 + 1408) = 0;
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    __int16 v11 = MCLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [*(id *)(a1 + 40) identifier];
      int v19 = 138543362;
      long long v20 = v12;
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Begin observing group session: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    __int16 v13 = (void *)MEMORY[0x1E4F77048];
    id v14 = [*(id *)(a1 + 40) identifier];
    uint64_t v15 = [v13 remoteControlGroupSessionWithIdentifier:v14 delegate:*(void *)(a1 + 32)];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 1408);
    *(void *)(v16 + 1408) = v15;
  }
  return [*(id *)(a1 + 32) _updateDisplayedRoutes];
}

- (void)groupSessionDidConnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Connected to group session: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MCLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Group session invalidated: %{public}@ with error: %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRURoutingViewController_groupSession_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__MRURoutingViewController_groupSession_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1408);
  *(void *)(v2 + 1408) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateDisplayedRoutes];
}

- (id)_stateDumpObject
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  id v2 = MEMORY[0x1E4F14428];
  msv_dispatch_sync_on_queue();

  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __44__MRURoutingViewController__stateDumpObject__block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"_obj";
  id v2 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), *(void *)(a1 + 32)];
  v12[0] = v2;
  v11[1] = @"endpointRoute";
  uint64_t v3 = [*(id *)(a1 + 32) endpointRoute];
  id v4 = (void *)v3;
  uint64_t v5 = @"<NONE>";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  v12[1] = v5;
  v11[2] = @"routeDiscoveryMode";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "discoveryMode"));
  _DWORD v12[2] = v6;
  v11[3] = @"onScreen";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1150)];
  v12[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)_fullStateDumpObject
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  id v2 = MEMORY[0x1E4F14428];
  msv_dispatch_sync_on_queue();

  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __48__MRURoutingViewController__fullStateDumpObject__block_invoke(uint64_t a1)
{
  v42[29] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), *(void *)(a1 + 32), @"_obj"];
  v42[0] = v2;
  v41[1] = @"endpointRoute";
  uint64_t v3 = [*(id *)(a1 + 32) endpointRoute];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"<NONE>";
  }
  v42[1] = v5;
  v41[2] = @"displayedEndpointRoute";
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(__CFString **)(v6 + 1000);
  if (!v7) {
    uint64_t v7 = @"<NONE>";
  }
  v42[2] = v7;
  v41[3] = @"routeDiscoveryMode";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(v6 + 1160), "discoveryMode"));
  v42[3] = v8;
  v41[4] = @"onScreen";
  uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1150)];
  v42[4] = v9;
  v41[5] = @"inCarPlay";
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInCarPlay"));
  v42[5] = v10;
  v41[6] = @"groupSessionDiscovery";
  id v11 = [*(id *)(a1 + 32) groupSessionDiscovery];
  uint64_t v12 = [v11 debugDescription];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"<NONE>";
  }
  v42[6] = v14;
  v41[7] = @"expandedGroupUIDs";
  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v16 = (__CFString *)v15[160];
  if (!v16) {
    uint64_t v16 = @"<NONE>";
  }
  v42[7] = v16;
  v41[8] = @"expandedItemUIDs";
  uint64_t v17 = (__CFString *)v15[161];
  if (!v17) {
    uint64_t v17 = @"<NONE>";
  }
  v42[8] = v17;
  v41[9] = @"expandedRouteUIDs";
  long long v18 = (__CFString *)v15[162];
  if (!v18) {
    long long v18 = @"<NONE>";
  }
  v42[9] = v18;
  v41[10] = @"expandedVendorSpecificGroupUIDs";
  int v19 = (__CFString *)v15[171];
  if (!v19) {
    int v19 = @"<NONE>";
  }
  v42[10] = v19;
  v41[11] = @"collapsedVendorSpecificGroupUIDs";
  long long v20 = (__CFString *)v15[170];
  if (!v20) {
    long long v20 = @"<NONE>";
  }
  v42[11] = v20;
  v41[12] = @"indexedDataControllers";
  uint64_t v21 = (__CFString *)v15[163];
  if (!v21) {
    uint64_t v21 = @"<NONE>";
  }
  v42[12] = v21;
  v41[13] = @"routingViewItems";
  unint64_t v22 = (__CFString *)v15[126];
  if (!v22) {
    unint64_t v22 = @"<NONE>";
  }
  v42[13] = v22;
  v41[14] = @"routingController";
  unint64_t v23 = (__CFString *)v15[145];
  if (!v23) {
    unint64_t v23 = @"<NONE>";
  }
  v42[14] = v23;
  v41[15] = @"pendingUpdate";
  int v24 = (__CFString *)v15[122];
  if (!v24) {
    int v24 = @"<NONE>";
  }
  v42[15] = v24;
  v41[16] = @"optimisticUpdate";
  BOOL v25 = (__CFString *)v15[123];
  if (!v25) {
    BOOL v25 = @"<NONE>";
  }
  v42[16] = v25;
  v41[17] = @"cachedPickedRoutes";
  int v26 = (__CFString *)v15[127];
  if (!v26) {
    int v26 = @"<NONE>";
  }
  v42[17] = v26;
  v41[18] = @"cachedDisplayableAvailableRoutes";
  char v27 = (__CFString *)v15[128];
  if (!v27) {
    char v27 = @"<NONE>";
  }
  v42[18] = v27;
  v41[19] = @"cachedPendingPickedRoutes";
  uint64_t v28 = (__CFString *)v15[129];
  if (!v28) {
    uint64_t v28 = @"<NONE>";
  }
  v42[19] = v28;
  v41[20] = @"cachedDisplayAsPickedRoutes";
  int64_t v29 = (__CFString *)v15[130];
  if (!v29) {
    int64_t v29 = @"<NONE>";
  }
  v42[20] = v29;
  v41[21] = @"cachedVolumeCapableRoutes";
  uint64_t v30 = (__CFString *)v15[131];
  if (!v30) {
    uint64_t v30 = @"<NONE>";
  }
  v42[21] = v30;
  v41[22] = @"cachedRouteGrouping";
  uint64_t v31 = (__CFString *)v15[132];
  if (!v31) {
    uint64_t v31 = @"<NONE>";
  }
  v42[22] = v31;
  v41[23] = @"cachedAirPlayRoutes";
  BOOL v32 = (__CFString *)v15[133];
  if (!v32) {
    BOOL v32 = @"<NONE>";
  }
  v42[23] = v32;
  v41[24] = @"cachedNativeRoutes";
  BOOL v33 = (__CFString *)v15[134];
  if (!v33) {
    BOOL v33 = @"<NONE>";
  }
  v42[24] = v33;
  v41[25] = @"cachedNativeRoutesInVendorSpecificGroup";
  int v34 = (__CFString *)v15[135];
  if (!v34) {
    int v34 = @"<NONE>";
  }
  v42[25] = v34;
  v41[26] = @"cachedActivatedVendorSpecificDeviceIDs";
  uint64_t v35 = (__CFString *)v15[136];
  if (!v35) {
    uint64_t v35 = @"<NONE>";
  }
  v42[26] = v35;
  v41[27] = @"cachedPendingVendorSpecificDeviceIDs";
  __int16 v36 = (__CFString *)v15[137];
  if (!v36) {
    __int16 v36 = @"<NONE>";
  }
  v42[27] = v36;
  v41[28] = @"cachedAvailableVendorSpecificDeviceIDs";
  uint64_t v37 = (__CFString *)v15[138];
  if (!v37) {
    uint64_t v37 = @"<NONE>";
  }
  v42[28] = v37;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:29];
  uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 8);
  int v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = v38;
}

- (void)hearingAidConnectionDidChange
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRURoutingViewController *)self view];
  id v4 = [v3 tableView];
  uint64_t v5 = [v4 indexPathsForVisibleRows];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  id obj = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      uint64_t v12 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v11];
      id v13 = [v12 mainRoute];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        id v6 = obj;
        goto LABEL_14;
      }
    }
    id v15 = v11;

    if (!v15) {
      goto LABEL_15;
    }
    uint64_t v16 = MCLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v15;
      _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] virtualHearingAidIndexPath: %@", buf, 0xCu);
    }

    uint64_t v17 = [(MRURoutingViewController *)self view];
    long long v18 = [v17 tableView];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__MRURoutingViewController_hearingAidConnectionDidChange__block_invoke;
    v20[3] = &unk_1E5F0D8E8;
    v20[4] = self;
    id v21 = v15;
    id v6 = v15;
    [v18 performBatchUpdates:v20 completion:0];
  }
LABEL_14:

LABEL_15:
}

void __57__MRURoutingViewController_hearingAidConnectionDidChange__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [v2 tableView];
  v5[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 reloadRowsAtIndexPaths:v4 withRowAnimation:0];
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (MRUVendorSpecificDeviceManager)vendorSpecificManager
{
  return self->_vendorSpecificManager;
}

- (MRURoutingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRURoutingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (NSArray)nowPlayingControllers
{
  return self->_nowPlayingControllers;
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)showMetadataForEndpointRoute
{
  return self->_showMetadataForEndpointRoute;
}

- (void)setShowMetadataForEndpointRoute:(BOOL)a3
{
  self->_BOOL showMetadataForEndpointRoute = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)scrollIndicatorInsets
{
  double top = self->_scrollIndicatorInsets.top;
  double left = self->_scrollIndicatorInsets.left;
  double bottom = self->_scrollIndicatorInsets.bottom;
  double right = self->_scrollIndicatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSMutableArray)customRows
{
  return self->_customRows;
}

- (int)presentingAppProcessIdentifier
{
  return self->_presentingAppProcessIdentifier;
}

- (void)setPresentingAppProcessIdentifier:(int)a3
{
  self->_presentingAppProcessIdentifier = a3;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setDonatingAppBundleID:(id)a3
{
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (BOOL)onScreen
{
  return self->_onScreen;
}

- (NSDictionary)outputDeviceVolumeControllers
{
  return self->_outputDeviceVolumeControllers;
}

- (void)setOutputDeviceVolumeControllers:(id)a3
{
}

- (CARSessionStatus)carPlaySessionStatus
{
  return self->_carPlaySessionStatus;
}

- (void)setCarPlaySessionStatus:(id)a3
{
}

- (NSMutableSet)expandedGroupUIDs
{
  return self->_expandedGroupUIDs;
}

- (void)setExpandedGroupUIDs:(id)a3
{
}

- (NSMutableSet)expandedItemUIDs
{
  return self->_expandedItemUIDs;
}

- (void)setExpandedItemUIDs:(id)a3
{
}

- (NSMutableSet)expandedRouteUIDs
{
  return self->_expandedRouteUIDs;
}

- (void)setExpandedRouteUIDs:(id)a3
{
}

- (NSDictionary)indexedNowPlayingControllers
{
  return self->_indexedNowPlayingControllers;
}

- (void)setIndexedNowPlayingControllers:(id)a3
{
}

- (BOOL)needsDisplayedRoutesUpdate
{
  return self->_needsDisplayedRoutesUpdate;
}

- (void)setNeedsDisplayedRoutesUpdate:(BOOL)a3
{
  self->_needsDisplayedRoutesUpdate = a3;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void)setPercentageFormatter:(id)a3
{
}

- (MPWeakTimer)subtitleUpdateTimer
{
  return self->_subtitleUpdateTimer;
}

- (void)setSubtitleUpdateTimer:(id)a3
{
}

- (NSTimer)collapseTimer
{
  return self->_collapseTimer;
}

- (void)setCollapseTimer:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (BOOL)presentingAppHasActiveAVSession
{
  return self->_presentingAppHasActiveAVSession;
}

- (void)setPresentingAppHasActiveAVSession:(BOOL)a3
{
  self->_presentingAppHasActiveAVSessiouint64_t n = a3;
}

- (BOOL)didLastPickNativeRoute
{
  return self->_didLastPickNativeRoute;
}

- (void)setDidLastPickNativeRoute:(BOOL)a3
{
  self->_didLastPickNativeRoute = a3;
}

- (NSIndexPath)vendorSpecificGroupThatWasJustExpanded
{
  return self->_vendorSpecificGroupThatWasJustExpanded;
}

- (void)setVendorSpecificGroupThatWasJustExpanded:(id)a3
{
}

- (NSString)mostRecentlyInteractedVendorSpecificGroupRouteID
{
  return self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
}

- (void)setMostRecentlyInteractedVendorSpecificGroupRouteID:(id)a3
{
}

- (NSMutableSet)collapsedVendorSpecificGroupUIDs
{
  return self->_collapsedVendorSpecificGroupUIDs;
}

- (void)setCollapsedVendorSpecificGroupUIDs:(id)a3
{
}

- (NSMutableSet)expandedVendorSpecificGroupUIDs
{
  return self->_expandedVendorSpecificGroupUIDs;
}

- (void)setExpandedVendorSpecificGroupUIDs:(id)a3
{
}

- (NSMutableDictionary)vendorSpecificGroupDisplayedSubroutes
{
  return self->_vendorSpecificGroupDisplayedSubroutes;
}

- (void)setVendorSpecificGroupDisplayedSubroutes:(id)a3
{
}

- (BOOL)didExpandVendorSpecificSpeakerGroup
{
  return self->_didExpandVendorSpecificSpeakerGroup;
}

- (void)setDidExpandVendorSpecificSpeakerGroup:(BOOL)a3
{
  self->_didExpandVendorSpecificSpeakerGroup = a3;
}

- (NSMutableArray)staticCustomRowItems
{
  return self->_staticCustomRowItems;
}

- (void)setStaticCustomRowItems:(id)a3
{
}

- (AVSystemController)mediaServerController
{
  return self->_mediaServerController;
}

- (void)setMediaServerController:(id)a3
{
}

- (MRGroupSessionDiscovery)groupSessionDiscovery
{
  return self->_groupSessionDiscovery;
}

- (MRGroupSession)activeGroupSession
{
  return self->_activeGroupSession;
}

- (void)setActiveGroupSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeGroupSession, 0);
  objc_storeStrong((id *)&self->_groupSessionDiscovery, 0);
  objc_storeStrong((id *)&self->_mediaServerController, 0);
  objc_storeStrong((id *)&self->_staticCustomRowItems, 0);
  objc_storeStrong((id *)&self->_vendorSpecificGroupDisplayedSubroutes, 0);
  objc_storeStrong((id *)&self->_expandedVendorSpecificGroupUIDs, 0);
  objc_storeStrong((id *)&self->_collapsedVendorSpecificGroupUIDs, 0);
  objc_storeStrong((id *)&self->_mostRecentlyInteractedVendorSpecificGroupRouteID, 0);
  objc_storeStrong((id *)&self->_vendorSpecificGroupThatWasJustExpanded, 0);
  objc_storeStrong((id *)&self->_collapseTimer, 0);
  objc_storeStrong((id *)&self->_subtitleUpdateTimer, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_indexedNowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_expandedRouteUIDs, 0);
  objc_storeStrong((id *)&self->_expandedItemUIDs, 0);
  objc_storeStrong((id *)&self->_expandedGroupUIDs, 0);
  objc_storeStrong((id *)&self->_carPlaySessionStatus, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeControllers, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_customRows, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_nowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vendorSpecificManager, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_cachedAvailableVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedPendingVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedActivatedVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedNativeRoutesInVendorSpecificGroup, 0);
  objc_storeStrong((id *)&self->_cachedNativeRoutes, 0);
  objc_storeStrong((id *)&self->_cachedAirPlayRoutes, 0);
  objc_storeStrong((id *)&self->_cachedRouteGrouping, 0);
  objc_storeStrong((id *)&self->_cachedVolumeCapableRoutes, 0);
  objc_storeStrong((id *)&self->_cachedDisplayAsPickedRoutes, 0);
  objc_storeStrong((id *)&self->_cachedPendingPickedRoutes, 0);
  objc_storeStrong((id *)&self->_cachedDisplayableAvailableRoutes, 0);
  objc_storeStrong((id *)&self->_cachedPickedRoutes, 0);
  objc_storeStrong((id *)&self->_routingViewItems, 0);
  objc_storeStrong((id *)&self->_displayedEndpointRoute, 0);
  objc_storeStrong((id *)&self->_optimisticUpdate, 0);

  objc_storeStrong((id *)&self->_pendingUpdate, 0);
}

@end