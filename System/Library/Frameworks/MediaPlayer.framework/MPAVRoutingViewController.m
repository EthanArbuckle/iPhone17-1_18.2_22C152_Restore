@interface MPAVRoutingViewController
- (BOOL)_operationRequiresOptimisticState:(int64_t)a3 routes:(id)a4;
- (BOOL)_shouldAutomaticallyUpdateRoutesList;
- (BOOL)_shouldDisplayRouteAsPicked:(id)a3;
- (BOOL)_shouldPickRouteOnSelection;
- (BOOL)_wouldShareAudioForPickedRoute:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5;
- (BOOL)allowMirroring;
- (BOOL)hasCarKitRoute;
- (BOOL)isInCarPlay;
- (BOOL)isInVehicle;
- (BOOL)shouldGroupRoutingViewItems;
- (BOOL)shouldOverrideContentSizeCategory:(id)a3;
- (BOOL)sortByIsVideoRoute;
- (CGSize)preferredContentSize;
- (MPAVEndpointRoute)endpointRoute;
- (MPAVRoutingController)_routingController;
- (MPAVRoutingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3;
- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3 routingController:(id)a4;
- (MPAVRoutingViewControllerDelegate)delegate;
- (MPAVRoutingViewControllerThemeDelegate)themeDelegate;
- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator;
- (NSMapTable)outputDeviceVolumeSliders;
- (NSNumber)discoveryModeOverride;
- (UIColor)_tableCellsBackgroundColor;
- (UIColor)_tableCellsContentColor;
- (UITableView)_tableView;
- (double)_continuousCornerRadius;
- (double)_expandedCellHeight;
- (double)_normalCellHeight;
- (double)_tableViewFooterViewHeight;
- (double)_tableViewHeaderViewHeight;
- (double)_tableViewHeightAccordingToDataSource;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createRefreshUpdate;
- (id)_createReloadUpdate;
- (id)_createRoutingViewItemsForRoutes:(id)a3;
- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4;
- (id)_createVolumeSlider;
- (id)_displayAsPickedRoutesInRoutes:(id)a3;
- (id)_displayableRoutesInRoutes:(id)a3;
- (id)_stateDumpObject;
- (id)_volumeCapableRoutesInRoutes:(id)a3;
- (id)endpointGroupUID;
- (id)groupUIDForRoute:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)avItemType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)iconStyle;
- (unint64_t)mirroringStyle;
- (unint64_t)style;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_applyUpdate:(id)a3;
- (void)_beginRouteDiscovery;
- (void)_collapseAllGroups;
- (void)_configureCell:(id)a3 forIndexPath:(id)a4;
- (void)_createUpdateWithCompletion:(id)a3;
- (void)_diplayShareAudioDisabledAlertForReason:(id)a3;
- (void)_endRouteDiscovery;
- (void)_endUpdates;
- (void)_enqueueUpdate:(id)a3;
- (void)_initWithStyle:(unint64_t)a3 routingController:(id)a4;
- (void)_registerCarPlayObserver;
- (void)_registerNotifications;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setNeedsDisplayedRoutesUpdate;
- (void)_setNeedsRouteDiscoveryModeUpdate;
- (void)_setRouteDiscoveryMode:(int64_t)a3;
- (void)_setShouldAutomaticallyUpdateRoutesList:(BOOL)a3;
- (void)_setShouldPickRouteOnSelection:(BOOL)a3;
- (void)_setTableCellsBackgroundColor:(id)a3;
- (void)_setTableCellsContentColor:(id)a3;
- (void)_setupUpdateTimerIfNecessary;
- (void)_unregisterNotifications;
- (void)_updateDisplayedRoutes;
- (void)_volumeSliderVolumeControlAvailabilityDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)enqueueRefreshUpdate;
- (void)registerTableViewCells;
- (void)resetDisplayedRoutes;
- (void)resetScrollPosition;
- (void)routingCell:(id)a3 mirroringSwitchValueDidChange:(BOOL)a4;
- (void)routingCellDidTapToExpand:(id)a3;
- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAVItemType:(int64_t)a3;
- (void)setAllowMirroring:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryModeOverride:(id)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setGroupSliderCoordinator:(id)a3;
- (void)setIconStyle:(unint64_t)a3;
- (void)setMirroringStyle:(unint64_t)a3;
- (void)setOptimisticUpdate:(id)a3;
- (void)setOutputDeviceVolumeSliders:(id)a3;
- (void)setSortByIsVideoRoute:(BOOL)a3;
- (void)setThemeDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateExpandedGroups;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MPAVRoutingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSliderCoordinator, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeSliders, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_destroyWeak((id *)&self->_themeDelegate);
  objc_storeStrong((id *)&self->_discoveryModeOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_carPlayStatus, 0);
  objc_storeStrong((id *)&self->_tableCellsContentColor, 0);
  objc_storeStrong((id *)&self->_tableCellsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_expandedGroupUIDs, 0);
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

  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator
{
  return self->_groupSliderCoordinator;
}

- (void)setOutputDeviceVolumeSliders:(id)a3
{
}

- (NSMapTable)outputDeviceVolumeSliders
{
  return self->_outputDeviceVolumeSliders;
}

- (double)_continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (void)setThemeDelegate:(id)a3
{
}

- (MPAVRoutingViewControllerThemeDelegate)themeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_themeDelegate);

  return (MPAVRoutingViewControllerThemeDelegate *)WeakRetained;
}

- (NSNumber)discoveryModeOverride
{
  return self->_discoveryModeOverride;
}

- (unint64_t)iconStyle
{
  return self->_iconStyle;
}

- (unint64_t)mirroringStyle
{
  return self->_mirroringStyle;
}

- (int64_t)avItemType
{
  return self->_avItemType;
}

- (void)setDelegate:(id)a3
{
}

- (MPAVRoutingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPAVRoutingViewControllerDelegate *)WeakRetained;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)shouldGroupRoutingViewItems
{
  return 0;
}

- (id)_stateDumpObject
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"style";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:self->_style];
  v4 = (void *)v3;
  displayedEndpointRoute = self->_displayedEndpointRoute;
  if (!displayedEndpointRoute) {
    displayedEndpointRoute = (MPAVRoute *)@"<NONE>";
  }
  v14[0] = v3;
  v14[1] = displayedEndpointRoute;
  v13[1] = @"displayedEndpointRoute";
  v13[2] = @"routeDiscoveryMode";
  v6 = [NSNumber numberWithInteger:self->_routeDiscoveryMode];
  v14[2] = v6;
  v13[3] = @"onScreen";
  v7 = [NSNumber numberWithBool:self->_onScreen];
  v14[3] = v7;
  v13[4] = @"inCarPlay";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay"));
  v9 = (void *)v8;
  v13[5] = @"routingViewItems";
  routingViewItems = self->_routingViewItems;
  if (!routingViewItems) {
    routingViewItems = (MPSectionedCollection *)@"<NONE>";
  }
  v14[4] = v8;
  v14[5] = routingViewItems;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(MPMutableSectionedCollection);
  v9 = [v7 localDevices];
  v10 = [v7 headphones];
  v11 = [v7 speakersAndTVs];

  if ([v9 count])
  {
    [(MPMutableSectionedCollection *)v8 appendSection:@"LOCAL DEVICES"];
    [(MPMutableSectionedCollection *)v8 appendItems:v9];
  }
  if ([v10 count] || _MPAVRoutingViewControllerRoutesContainsSplitterCapableRoute(v6))
  {
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v13 = [v12 localizedStringForKey:@"ROUTING_VIEW_HEADER_HEADPHONES" value:&stru_1EE680640 table:@"MediaPlayer"];
    [(MPMutableSectionedCollection *)v8 appendSection:v13];

    [(MPMutableSectionedCollection *)v8 appendItems:v10];
    v14 = [(MPAVRoutingViewController *)self endpointRoute];
    if ([v14 isSplitRoute])
    {

      goto LABEL_15;
    }
    int v15 = _MPAVRoutingViewControllerRoutesContainsSplitterCapableRoute(v6);

    if (v15)
    {
      uint64_t v16 = [(MPAVRoutingViewController *)self isInVehicle] ^ 1;
      if ([(MPAVRoutingViewController *)self isInCarPlay])
      {
        v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        v18 = v17;
        v19 = @"ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARPLAY";
      }
      else
      {
        if (![(MPAVRoutingViewController *)self hasCarKitRoute])
        {
          v20 = 0;
          goto LABEL_14;
        }
        v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        v18 = v17;
        v19 = @"ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARKIT";
      }
      v20 = [v17 localizedStringForKey:v19 value:&stru_1EE680640 table:@"MediaPlayer"];

LABEL_14:
      v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v22 = [v21 localizedStringForKey:@"ROUTING_VIEW_SHARE_AUDIO" value:&stru_1EE680640 table:@"MediaPlayer"];
      v23 = +[MPAVRoutingViewItem itemWithActionTitle:v22 subtitle:v20 enabled:v16 identifier:@"Share Audio" image:0];

      v28[0] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [(MPMutableSectionedCollection *)v8 appendItems:v24];
    }
  }
LABEL_15:
  if ([v11 count])
  {
    v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v26 = [v25 localizedStringForKey:@"ROUTING_VIEW_HEADER_SPEAKERS_AND_TVS" value:&stru_1EE680640 table:@"MediaPlayer"];
    [(MPMutableSectionedCollection *)v8 appendSection:v26];

    [(MPMutableSectionedCollection *)v8 appendItems:v11];
  }

  return v8;
}

- (void)_collapseAllGroups
{
}

- (id)_createRoutingViewItemsForRoutes:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v59 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = MRAVEndpointGetLocalEndpoint();
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [v6 outputDeviceUIDs];
  v57 = [v7 setWithArray:v8];

  v55 = [MEMORY[0x1E4F76FC0] localDeviceUID];
  v50 = v6;
  v9 = [v6 outputDevices];
  v10 = [v9 firstObject];
  v52 = [v10 uid];

  v51 = v4;
  v11 = (void *)[v4 mutableCopy];
  v64 = self;
  if ([(MPAVRoutingViewController *)self shouldGroupRoutingViewItems])
  {
    id obj = v11;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v73;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v73 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v72 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v17 isDeviceSpeakerRoute] & 1) == 0)
        {
          id v18 = v17;
          v19 = [(MPAVRoutingViewController *)v64 groupUIDForRoute:v18];
          v20 = [v18 routeUID];
          int v21 = [v20 isEqualToString:v52];

          if (v21)
          {
            v22 = v5;
            id v23 = v18;
            v24 = v55;
            goto LABEL_15;
          }
          if ([v18 isGroupLeader] && v19 && v19 != v55)
          {
            v22 = v5;
            id v23 = v18;
            v24 = v19;
LABEL_15:
            [v22 setObject:v23 forKeyedSubscript:v24];
          }
          else if (v19)
          {
            v25 = [v59 objectForKeyedSubscript:v19];
            if (!v25)
            {
              v25 = objc_opt_new();
              [v59 setObject:v25 forKeyedSubscript:v19];
            }
            [v25 addObject:v18];
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v26 = [v12 countByEnumeratingWithState:&v72 objects:v77 count:16];
      uint64_t v14 = v26;
      if (!v26)
      {
LABEL_24:

        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __62__MPAVRoutingViewController__createRoutingViewItemsForRoutes___block_invoke;
        v69[3] = &unk_1E57F1020;
        id v70 = v5;
        v11 = obj;
        id v71 = obj;
        [v59 enumerateKeysAndObjectsUsingBlock:v69];

        break;
      }
    }
  }
  v58 = v5;
  v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obja = v11;
  uint64_t v27 = [obja countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v66;
    uint64_t v56 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v66 != v29) {
          objc_enumerationMutation(obja);
        }
        v31 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v32 = +[MPAVRoutingViewItem itemWithRoute:v31];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_41;
        }
        id v33 = v31;
        v34 = [(MPAVRoutingViewController *)v64 groupUIDForRoute:v33];
        v35 = [v33 routeUID];
        int v36 = [v57 containsObject:v35];

        if (v36)
        {
          id v37 = v55;

          v34 = v37;
        }
        id v38 = [v58 objectForKeyedSubscript:v34];
        v39 = [v59 objectForKeyedSubscript:v34];
        char v40 = [(NSMutableSet *)v64->_expandedGroupUIDs containsObject:v34];
        uint64_t v41 = [v39 count];
        int v42 = 1;
        if (v34 && v41)
        {
          v43 = [v39 arrayByAddingObject:v38];
          [v54 setObject:v43 forKeyedSubscript:v34];

          if (v40)
          {
            int v42 = 1;
          }
          else if (v33 == v38)
          {
            uint64_t v44 = +[MPAVRoutingViewItem itemWithLeader:v33 members:v39];

            int v42 = 1;
            v32 = (void *)v44;
          }
          else
          {
            int v42 = 0;
          }
        }

        uint64_t v29 = v56;
        if (v42)
        {
LABEL_41:
          char v45 = [v31 isDeviceSpeakerRoute];
          v46 = v63;
          if ((v45 & 1) == 0)
          {
            char v47 = [v31 isShareableRoute];
            v46 = v62;
            if ((v47 & 1) == 0)
            {
              if ([v31 isHeadphonesRoute]) {
                v46 = v62;
              }
              else {
                v46 = v53;
              }
            }
          }
          [v46 addObject:v32];
        }
      }
      uint64_t v28 = [obja countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v28);
  }

  v48 = objc_opt_new();
  [v48 setRouteGrouping:v54];
  [v48 setHeadphones:v62];
  [v48 setLocalDevices:v63];
  [v48 setSpeakersAndTVs:v53];

  return v48;
}

void __62__MPAVRoutingViewController__createRoutingViewItemsForRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

  if (!v6)
  {
    id v7 = [v5 firstObject];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v12];
  }
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  if ([v5 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v5 objectAtIndexedSubscript:v9];
      v11 = (void *)v10;
      if (!v8 || v8 == (void *)v10)
      {
        ++v9;
      }
      else
      {
        [*(id *)(a1 + 40) removeObject:v10];
        objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, ++v9 + objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v8));
      }
    }
    while ([v5 count] > v9);
  }
}

- (id)groupUIDForRoute:(id)a3
{
  id v3 = a3;
  id v4 = MRAVEndpointGetLocalEndpoint();
  id v5 = [v4 outputDeviceUIDs];
  id v6 = [v3 routeUID];
  int v7 = [v5 containsObject:v6];

  if (v7) {
    [MEMORY[0x1E4F76FC0] localDeviceUID];
  }
  else {
  uint64_t v8 = [v3 groupUID];
  }

  return v8;
}

- (void)_endUpdates
{
  id v2 = [(MPAVRoutingViewController *)self _routingController];
  [v2 setDelegate:0];
}

- (id)_createVolumeSlider
{
  return 0;
}

- (BOOL)_shouldDisplayRouteAsPicked:(id)a3
{
  id v3 = self;
  routingController = self->_routingController;
  id v5 = a3;
  [(MPAVRoutingController *)routingController supportsMultipleSelection];
  [(MPAVRoutingController *)v3->_routingController hasPendingPickedRoutes];
  LOBYTE(v3) = [v5 isDisplayedAsPicked];

  return (char)v3;
}

- (double)_tableViewFooterViewHeight
{
  double result = 36.0;
  if (self->_style != 1) {
    return 0.0;
  }
  return result;
}

- (double)_tableViewHeaderViewHeight
{
  double result = 36.0;
  if (self->_style != 1) {
    return 0.0;
  }
  return result;
}

- (void)_applyUpdate:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_tableView)
  {
    id v5 = (void *)[(MPSectionedCollection *)self->_routingViewItems copy];
    id v6 = [v4 displayableAvailableRoutes];
    uint64_t v26 = [(MPAVRoutingViewController *)self _createRoutingViewItemsForRoutes:v6];

    int v7 = [v26 routeGrouping];
    uint64_t v8 = [v4 pickedRoutes];
    unint64_t v9 = [(MPAVRoutingViewController *)self _createSectionedCollection:v26 withPickedRoutes:v8];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke;
    v41[3] = &unk_1E57F62E8;
    v41[4] = self;
    id v10 = v4;
    id v42 = v10;
    id v11 = v9;
    id v43 = v11;
    id v24 = v7;
    id v44 = v24;
    id v12 = (void (**)(void))MEMORY[0x19971E0F0](v41);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_2;
    v38[3] = &unk_1E57F6F18;
    id v13 = v5;
    id v39 = v13;
    id v14 = v11;
    id v40 = v14;
    v25 = (void *)MEMORY[0x19971E0F0](v38);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_3;
    v33[3] = &unk_1E57F0FD0;
    id v15 = v13;
    id v34 = v15;
    id v16 = v14;
    id v35 = v16;
    v17 = (MPAVRoutingViewControllerUpdate *)v10;
    int v36 = v17;
    id v37 = self;
    id v18 = (void *)MEMORY[0x19971E0F0](v33);
    if ([(MPAVRoutingViewControllerUpdate *)v17 shouldReload]
      || ([v15 changeDetailsToSectionedCollection:v16 isEqualBlock:v25 isUpdatedBlock:v18],
          (v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12[2](v12);
      objc_storeStrong((id *)&self->_displayedEndpointRoute, self->_endpointRoute);
      if ([(MPAVRoutingViewControllerUpdate *)v17 shouldReload]) {
        [(MPAVClippingTableView *)self->_tableView reloadData];
      }
    }
    else
    {
      self->_isAnimatingUpdate = 1;
      tableView = self->_tableView;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_4;
      v29[3] = &unk_1E57F8408;
      v32 = v12;
      id v21 = v19;
      id v30 = v21;
      v31 = self;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      void v28[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_6;
      v28[3] = &unk_1E57F9B98;
      v28[4] = self;
      [(MPAVClippingTableView *)tableView performBatchUpdates:v29 completion:v28];
    }
    self->_needsDisplayedRoutesUpdate = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_134;
      block[3] = &unk_1E57F9EA8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    if (self->_pendingUpdate == v17)
    {
      self->_pendingUpdate = 0;
    }
  }
}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) displayableAvailableRoutes];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1032);
  *(void *)(v3 + 1032) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) pickedRoutes];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 1024);
  *(void *)(v6 + 1024) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) pendingPickedRoutes];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1040);
  *(void *)(v9 + 1040) = v8;

  uint64_t v11 = [*(id *)(a1 + 40) displayAsPickedRoutes];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 1048);
  *(void *)(v12 + 1048) = v11;

  uint64_t v14 = [*(id *)(a1 + 40) volumeCapableRoutes];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 1056);
  *(void *)(v15 + 1056) = v14;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1064), *(id *)(a1 + 56));
  v17 = *(void **)(a1 + 32);

  return [v17 updateExpandedGroups];
}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length] != 1)
  {
    uint64_t v8 = [*(id *)(a1 + 32) itemAtIndexPath:v5];
    uint64_t v9 = [*(id *)(a1 + 40) itemAtIndexPath:v6];
    id v10 = [v8 mainRoute];
    uint64_t v11 = [v9 mainRoute];
    uint64_t v12 = [v8 type];
    if (v12 == [v9 type])
    {
      unint64_t v13 = [v8 type];
      if (v13 == 2)
      {
        uint64_t v7 = [v8 isEqual:v9] ^ 1;
LABEL_10:

        goto LABEL_11;
      }
      if (v13 <= 1)
      {
        uint64_t v14 = [*(id *)(a1 + 48) displayAsPickedRoutes];
        int v15 = [v14 containsObject:v11];
        int v42 = [*(id *)(*(void *)(a1 + 56) + 1048) containsObject:v11];

        id v16 = [*(id *)(a1 + 48) pickedRoutes];
        int v40 = [v16 containsObject:v11];
        int v38 = [*(id *)(*(void *)(a1 + 56) + 1024) containsObject:v11];

        v17 = [*(id *)(a1 + 48) pendingPickedRoutes];
        int v36 = [v17 containsObject:v11];
        int v34 = [*(id *)(*(void *)(a1 + 56) + 1040) containsObject:v11];

        id v18 = [*(id *)(a1 + 48) volumeCapableRoutes];
        int v19 = [v18 containsObject:v11];
        int v32 = [*(id *)(*(void *)(a1 + 56) + 1056) containsObject:v11];

        v20 = [v10 batteryLevel];
        id v21 = [v11 batteryLevel];
        if (v20 == v21)
        {
          int v35 = 0;
        }
        else
        {
          [v10 batteryLevel];
          v22 = int v30 = v19;
          [v11 batteryLevel];
          char v23 = v31 = v15;
          int v35 = [v22 isEqual:v23] ^ 1;

          int v15 = v31;
          int v19 = v30;
        }
        int v33 = v19 ^ v32;
        int v43 = v15 ^ v42;
        int v41 = v40 ^ v38;
        int v39 = v36 ^ v34;

        v25 = [v10 routeName];
        uint64_t v26 = [v11 routeName];
        if (v25 == v26)
        {
          int v29 = v33;
        }
        else
        {
          uint64_t v27 = [v10 routeName];
          uint64_t v28 = [v11 routeName];
          int v37 = [v27 isEqual:v28] ^ 1;

          int v29 = v37 | v33;
        }

        uint64_t v7 = v43 | v41 | v39 | v35 | v29;
        goto LABEL_10;
      }
    }
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) deletedSections];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 976);
    id v5 = [*(id *)(a1 + 32) deletedSections];
    [v4 deleteSections:v5 withRowAnimation:0];
  }
  id v6 = [*(id *)(a1 + 32) insertedSections];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 976);
    uint64_t v9 = [*(id *)(a1 + 32) insertedSections];
    [v8 insertSections:v9 withRowAnimation:0];
  }
  id v10 = [*(id *)(a1 + 32) deletedItemIndexPaths];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 976);
    unint64_t v13 = [*(id *)(a1 + 32) deletedItemIndexPaths];
    [v12 deleteRowsAtIndexPaths:v13 withRowAnimation:0];
  }
  uint64_t v14 = [*(id *)(a1 + 32) insertedItemIndexPaths];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = *(void **)(*(void *)(a1 + 40) + 976);
    v17 = [*(id *)(a1 + 32) insertedItemIndexPaths];
    [v16 insertRowsAtIndexPaths:v17 withRowAnimation:0];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_5;
  v24[3] = &unk_1E57F0FF8;
  id v18 = *(void **)(a1 + 32);
  v24[4] = *(void *)(a1 + 40);
  [v18 enumerateItemMovesUsingBlock:v24];
  int v19 = [*(id *)(a1 + 32) updatedItemIndexPaths];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    id v21 = *(void **)(a1 + 32);
    v22 = *(void **)(*(void *)(a1 + 40) + 976);
    char v23 = [v21 updatedItemIndexPaths];
    [v22 reloadRowsAtIndexPaths:v23 withRowAnimation:0];
  }
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_7;
  block[3] = &unk_1E57F9EA8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_134(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1176));
  [WeakRetained routingViewControllerDidUpdateContents:*(void *)(a1 + 32)];
}

void *__42__MPAVRoutingViewController__applyUpdate___block_invoke_7(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1008), *(id *)(*(void *)(a1 + 32) + 1224));
  double result = *(void **)(a1 + 32);
  if (result[123])
  {
    return objc_msgSend(result, "_applyUpdate:");
  }
  return result;
}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) moveRowAtIndexPath:a2 toIndexPath:a3];
}

- (void)updateExpandedGroups
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(NSDictionary *)self->_cachedRouteGrouping allKeys];
  id v7 = [v3 setWithArray:v4];

  [(NSMutableSet *)self->_expandedGroupUIDs intersectSet:v7];
  if ([(NSArray *)self->_cachedPickedRoutes count] == 1)
  {
    expandedGroupUIDs = self->_expandedGroupUIDs;
    id v6 = [(MPAVRoutingViewController *)self endpointGroupUID];
    [(NSMutableSet *)expandedGroupUIDs addObject:v6];
  }
}

- (id)endpointGroupUID
{
  uint64_t v2 = [(MPAVEndpointRoute *)self->_endpointRoute endpoint];
  uint64_t v3 = [v2 designatedGroupLeader];
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

- (id)_createReloadUpdate
{
  uint64_t v2 = [(MPAVRoutingViewController *)self _createRefreshUpdate];
  [v2 setShouldReload:1];

  return v2;
}

- (id)_createRefreshUpdate
{
  uint64_t v3 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
  [(MPAVRoutingViewControllerUpdate *)v3 setDisplayableAvailableRoutes:self->_cachedDisplayableAvailableRoutes];
  [(MPAVRoutingViewControllerUpdate *)v3 setPickedRoutes:self->_cachedPickedRoutes];
  [(MPAVRoutingViewControllerUpdate *)v3 setPendingPickedRoutes:self->_cachedPendingPickedRoutes];
  [(MPAVRoutingViewControllerUpdate *)v3 setDisplayAsPickedRoutes:self->_cachedDisplayAsPickedRoutes];
  [(MPAVRoutingViewControllerUpdate *)v3 setVolumeCapableRoutes:self->_cachedVolumeCapableRoutes];

  return v3;
}

- (void)_enqueueUpdate:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_optimisticUpdate)
  {
    id v7 = v5;
    if (self->_isAnimatingUpdate) {
      objc_storeStrong((id *)&self->_pendingUpdate, a3);
    }
    else {
      [(MPAVRoutingViewController *)self _applyUpdate:v5];
    }
    id v6 = v7;
  }
}

- (void)setOptimisticUpdate:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    [(MPAVRoutingViewController *)self _enqueueUpdate:v5];
    objc_storeStrong((id *)&self->_optimisticUpdate, a3);
  }
  else
  {
    optimisticUpdate = self->_optimisticUpdate;
    self->_optimisticUpdate = 0;

    [(MPAVRoutingViewController *)self _updateDisplayedRoutes];
  }
}

- (void)_updateDisplayedRoutes
{
  if (self->_shouldAutomaticallyUpdateRoutesList)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __51__MPAVRoutingViewController__updateDisplayedRoutes__block_invoke;
    v2[3] = &unk_1E57F0FA8;
    v2[4] = self;
    [(MPAVRoutingViewController *)self _createUpdateWithCompletion:v2];
  }
}

uint64_t __51__MPAVRoutingViewController__updateDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enqueueUpdate:a2];
}

- (void)_createUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  routingController = self->_routingController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MPAVRoutingViewController__createUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E57F0F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPAVRoutingController *)routingController fetchAvailableRoutesWithCompletionHandler:v7];
}

void __57__MPAVRoutingViewController__createUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1088) pickedRoutes];
  id v6 = (void *)[v5 copy];
  [(MPAVRoutingViewControllerUpdate *)v4 setPickedRoutes:v6];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 1088) pendingPickedRoutes];
  id v8 = [v7 allObjects];
  [(MPAVRoutingViewControllerUpdate *)v4 setPendingPickedRoutes:v8];

  uint64_t v9 = [*(id *)(a1 + 32) _displayableRoutesInRoutes:v3];
  [(MPAVRoutingViewControllerUpdate *)v4 setDisplayableAvailableRoutes:v9];

  int v38 = v3;
  id v10 = [*(id *)(a1 + 32) _displayAsPickedRoutesInRoutes:v3];
  [(MPAVRoutingViewControllerUpdate *)v4 setDisplayAsPickedRoutes:v10];

  -[MPAVRoutingViewControllerUpdate setCanGroup:](v4, "setCanGroup:", [*(id *)(*(void *)(a1 + 32) + 1088) supportsMultipleSelection]);
  -[MPAVRoutingViewControllerUpdate setHasPendingPickedRoutes:](v4, "setHasPendingPickedRoutes:", [*(id *)(*(void *)(a1 + 32) + 1088) hasPendingPickedRoutes]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v37 = v4;
  id obj = [(MPAVRoutingViewControllerUpdate *)v4 displayAsPickedRoutes];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    uint64_t v14 = &OBJC_IVAR___MPModelLibraryFavoriteEntityChangeRequest__modelObject;
    uint64_t v15 = &OBJC_IVAR___MPModelLibraryFavoriteEntityChangeRequest__modelObject;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        int v40 = [*(id *)(*(void *)(a1 + 32) + v14[268]) containsObject:v17];
        uint64_t v18 = v15[245];
        int v19 = *(void **)(*(void *)(a1 + 32) + v18);
        uint64_t v20 = [v17 routeUID];
        id v21 = [v19 objectForKey:v20];

        if (!v21)
        {
          id v21 = [*(id *)(a1 + 32) _createVolumeSlider];
          v22 = [[MPVolumeControllerRouteDataSource alloc] initWithGroupRoute:*(void *)(*(void *)(a1 + 32) + 1224) outputDeviceRoute:v17];
          [v21 volumeController];
          uint64_t v23 = a1;
          uint64_t v24 = v12;
          uint64_t v25 = v13;
          v27 = uint64_t v26 = v14;
          [v27 setDataSource:v22];

          uint64_t v14 = v26;
          uint64_t v13 = v25;
          uint64_t v12 = v24;
          a1 = v23;
          uint64_t v15 = &OBJC_IVAR___MPModelLibraryFavoriteEntityChangeRequest__modelObject;

          uint64_t v28 = *(void **)(*(void *)(a1 + 32) + v18);
          int v29 = [v17 routeUID];
          [v28 setObject:v21 forKey:v29];
        }
        int v30 = *(void **)(*(void *)(a1 + 32) + 1248);
        if (v40) {
          [v30 addIndividualVolumeSlider:v21];
        }
        else {
          [v30 removeIndividualVolumeSlider:v21];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v12);
  }

  int v31 = [*(id *)(a1 + 32) _volumeCapableRoutesInRoutes:v38];
  [(MPAVRoutingViewControllerUpdate *)v37 setVolumeCapableRoutes:v31];

  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = *(id *)(v32 + 1008);
  id v34 = *(id *)(v32 + 1224);
  int v35 = v34;
  if (v34 == v33) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = [v34 isEqual:v33] ^ 1;
  }

  [(MPAVRoutingViewControllerUpdate *)v37 setShouldReload:v36];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_volumeCapableRoutesInRoutes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(MPAVRoutingController *)self->_routingController pickedRoutes];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v18 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
          uint64_t v14 = objc_msgSend(v12, "routeUID", v18);
          uint64_t v15 = [(NSMapTable *)outputDeviceVolumeSliders objectForKey:v14];
          id v16 = [v15 volumeController];

          if ([v16 isVolumeControlAvailable]
            && [(MPAVRoutingViewController *)self _shouldDisplayRouteAsPicked:v12])
          {
            [v19 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    id v4 = v18;
  }

  return v19;
}

- (id)_displayAsPickedRoutesInRoutes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        if (-[MPAVRoutingViewController _shouldDisplayRouteAsPicked:](self, "_shouldDisplayRouteAsPicked:", v11, (void)v13))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_displayableRoutesInRoutes:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  BOOL v5 = [(MPAVRoutingController *)self->_routingController supportsMultipleSelection];
  BOOL v6 = [(MPAVRoutingController *)self->_routingController hasPendingPickedRoutes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MPAVRoutingViewController__displayableRoutesInRoutes___block_invoke;
  v8[3] = &unk_1E57F0F58;
  BOOL v9 = v5;
  BOOL v10 = v6;
  v8[4] = self;
  v8[5] = 577;
  [v4 sortUsingComparator:v8];

  return v4;
}

uint64_t __56__MPAVRoutingViewController__displayableRoutesInRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 1134))
  {
LABEL_11:
    uint64_t v12 = [*(id *)(v7 + 1088) dataSource];
    int v29 = [v12 routeIsLeaderOfEndpoint:v5];

    long long v13 = [*(id *)(*(void *)(a1 + 32) + 1088) dataSource];
    int v28 = [v13 routeIsLeaderOfEndpoint:v6];

    int v33 = [v5 supportsGrouping];
    int v32 = [v6 supportsGrouping];
    int v14 = [v5 isHomePodRoute];
    int v15 = [v6 isHomePodRoute];
    int v36 = [v5 isW1Route];
    int v35 = [v6 isW1Route];
    int v37 = [v5 isH1Route];
    int v16 = [v6 isH1Route];
    int v17 = [v5 isDisplayedAsPicked];
    int v18 = [v6 isDisplayedAsPicked];
    if ([v5 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v5, "isTVRoute")) {
      int v34 = 1;
    }
    else {
      int v34 = [v5 containsDeviceWithSubtype:18];
    }
    int v30 = v15;
    int v31 = v14;
    if ([v6 isAppleTVRoute] & 1) != 0 || (objc_msgSend(v6, "isTVRoute")) {
      int v19 = 1;
    }
    else {
      int v19 = [v6 containsDeviceWithSubtype:18];
    }
    int v20 = [v5 supportsGrouping];
    int v21 = [v6 supportsGrouping];
    if ([*(id *)(a1 + 32) sortByIsVideoRoute]) {
      int v22 = 0;
    }
    else {
      int v22 = [*(id *)(*(void *)(a1 + 32) + 1088) representsLongFormVideoContent] ^ 1;
    }
    if (![v5 pickableRouteType] && objc_msgSend(v6, "pickableRouteType")) {
      goto LABEL_43;
    }
    if ([v6 pickableRouteType] || !objc_msgSend(v5, "pickableRouteType"))
    {
      if ((v17 ^ 1 | v18) != 1) {
        goto LABEL_43;
      }
      if ((v18 ^ 1 | v17) != 1) {
        goto LABEL_45;
      }
      if ((v37 ^ 1 | v16) != 1) {
        goto LABEL_43;
      }
      if ((v16 ^ 1 | v37) != 1) {
        goto LABEL_45;
      }
      if ((v36 ^ 1 | v35) != 1) {
        goto LABEL_43;
      }
      if ((v35 ^ 1 | v36) != 1) {
        goto LABEL_45;
      }
      if ((v22 | v21 & v19 | v20 & v34 ^ 1) != 1) {
        goto LABEL_43;
      }
      if ((v22 | v20 & v34 | v21 & v19 ^ 1) != 1) {
        goto LABEL_45;
      }
      if ((v33 ^ 1 | v32) != 1) {
        goto LABEL_43;
      }
      if ((v32 ^ 1 | v33) != 1) {
        goto LABEL_45;
      }
      if ((v22 | v19 | v34 ^ 1) != 1) {
        goto LABEL_43;
      }
      if ((v22 | v34 | v19 ^ 1) != 1) {
        goto LABEL_45;
      }
      if ((v31 ^ 1 | v30) != 1) {
        goto LABEL_43;
      }
      if ((v30 ^ 1 | v31) != 1) {
        goto LABEL_45;
      }
      if ((v29 ^ 1 | v28) != 1)
      {
LABEL_43:
        uint64_t v10 = -1;
        goto LABEL_46;
      }
      if ((v28 ^ 1 | v29) == 1)
      {
        long long v23 = [v5 routeName];
        uint64_t v24 = [v6 routeName];
        uint64_t v10 = [v23 compare:v24 options:*(void *)(a1 + 40)];

        if (!v10)
        {
          uint64_t v25 = [v5 routeUID];
          uint64_t v26 = [v6 routeUID];
          uint64_t v10 = [v25 compare:v26 options:*(void *)(a1 + 40)];
        }
        goto LABEL_46;
      }
    }
LABEL_45:
    uint64_t v10 = 1;
    goto LABEL_46;
  }
  unint64_t v8 = [*(id *)(v7 + 1032) indexOfObject:v5];
  unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1032) indexOfObject:v6];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    goto LABEL_11;
  }
LABEL_46:

  return v10;
}

- (void)_volumeSliderVolumeControlAvailabilityDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__MPAVRoutingViewController__volumeSliderVolumeControlAvailabilityDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__MPAVRoutingViewController__volumeSliderVolumeControlAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayedRoutes];
}

- (void)_setNeedsDisplayedRoutesUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MPAVRoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__MPAVRoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1129) = 1;
  return [*(id *)(a1 + 32) _setupUpdateTimerIfNecessary];
}

- (void)_setNeedsRouteDiscoveryModeUpdate
{
  if (self->_onScreen)
  {
    discoveryModeOverride = self->_discoveryModeOverride;
    if (discoveryModeOverride) {
      int64_t routeDiscoveryMode = [(NSNumber *)discoveryModeOverride integerValue];
    }
    else {
      int64_t routeDiscoveryMode = self->_routeDiscoveryMode;
    }
  }
  else
  {
    int64_t routeDiscoveryMode = 0;
  }
  if ([(MPAVRoutingController *)self->_routingController discoveryMode] != routeDiscoveryMode)
  {
    [(MPAVRoutingController *)self->_routingController setDiscoveryMode:routeDiscoveryMode];
    notify_post("com.apple.airplay.startlogging");
  }
}

- (void)_setRouteDiscoveryMode:(int64_t)a3
{
  if (self->_routeDiscoveryMode != a3)
  {
    self->_int64_t routeDiscoveryMode = a3;
    [(MPAVRoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
  }
}

- (void)_setupUpdateTimerIfNecessary
{
  if (self->_onScreen && !self->_updateTimer)
  {
    id v3 = MEMORY[0x1E4F14428];
    objc_initWeak(&location, self);
    id v4 = [MPWeakTimer alloc];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    unint64_t v9 = __57__MPAVRoutingViewController__setupUpdateTimerIfNecessary__block_invoke;
    uint64_t v10 = &unk_1E57F6EF0;
    objc_copyWeak(&v11, &location);
    id v5 = [(MPWeakTimer *)v4 initWithInterval:MEMORY[0x1E4F14428] queue:&v7 block:2.0];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v5;

    [(MPAVRoutingViewController *)self _updateDisplayedRoutes];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __57__MPAVRoutingViewController__setupUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1129])
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained _updateDisplayedRoutes];
    id WeakRetained = v2;
  }
}

- (void)_endRouteDiscovery
{
}

- (void)_beginRouteDiscovery
{
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77870] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  [v3 removeObserver:self name:@"MPVolumeSliderVolumeControlLabelDidChangeNotification" object:0];
}

- (void)_registerCarPlayObserver
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v3 = (void *)getCARSessionStatusClass_softClass_19233;
  uint64_t v11 = getCARSessionStatusClass_softClass_19233;
  if (!getCARSessionStatusClass_softClass_19233)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getCARSessionStatusClass_block_invoke_19234;
    v7[3] = &unk_1E57FA300;
    v7[4] = &v8;
    __getCARSessionStatusClass_block_invoke_19234((uint64_t)v7);
    id v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v5 = (CARSessionStatus *)objc_alloc_init(v4);
  carPlayStatus = self->_carPlayStatus;
  self->_carPlayStatus = v5;

  [(CARSessionStatus *)self->_carPlayStatus addSessionObserver:self];
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
  [v3 addObserver:self selector:sel__volumeSliderVolumeControlAvailabilityDidChangeNotification_ name:@"MPVolumeSliderVolumeControlAvailabilityDidChangeNotification" object:0];
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v63 = a4;
  [v6 setMirroringStyle:self->_mirroringStyle];
  [v6 setIconStyle:self->_iconStyle];
  [v6 setShouldHideSectionBottomSeparator:1];
  if (self->_tableCellsContentColor) {
    objc_msgSend(v6, "setTintColor:");
  }
  v64 = v6;
  uint64_t v7 = self->_cachedDisplayableAvailableRoutes;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v8 = v7;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v70;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v69 + 1) + 8 * i) pickableRouteType])
        {
          if (v11)
          {
            int v11 = 2;
            goto LABEL_16;
          }
          int v11 = 1;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v11 = 0;
  }
LABEL_16:
  unsigned int v62 = v11;

  int v14 = v64;
  int v15 = [v64 delegate];

  if (!v15) {
    [v64 setDelegate:self];
  }
  double v17 = *MEMORY[0x1E4FB2848];
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v18 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  int v20 = v63;
  int v21 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v63];
  int v22 = [v21 mainRoute];
  uint64_t v61 = [v21 type];
  unint64_t v23 = [(MPAVRoutingViewController *)self style];
  int v24 = [v22 supportsGrouping];
  BOOL v25 = [(MPAVRoutingController *)self->_routingController supportsMultipleSelection];
  if (v23 == 3) {
    int v26 = v24;
  }
  else {
    int v26 = 0;
  }
  uint64_t v27 = v26 & v25;
  uint64_t v28 = [v63 section];
  if (v28 < [(MPSectionedCollection *)self->_routingViewItems numberOfSections])
  {
    uint64_t v29 = [v63 row];
    int v30 = v29 == -[MPSectionedCollection numberOfItemsInSection:](self->_routingViewItems, "numberOfItemsInSection:", [v63 section])- 1? 0: v27;
    if (v30 == 1)
    {
      uint64_t v31 = [v63 row] + 1;
      routingViewItems = self->_routingViewItems;
      int v33 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v31, objc_msgSend(v63, "section"));
      int v34 = [(MPSectionedCollection *)routingViewItems itemAtIndexPath:v33];

      int v35 = [v34 mainRoute];
      if ([v35 supportsGrouping])
      {
        double v18 = 0.0;
        double v16 = 69.0;
        double v19 = 0.0;
        double v17 = 0.0;
      }
    }
  }
  objc_msgSend(v64, "setSeparatorInset:", v17, v16, v19, v18);
  [v64 setTintColor:self->_tableCellsContentColor];
  [v64 setUseSmartAudioCheckmarkStyle:v27];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  int v36 = [v21 routes];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (!v37)
  {

    LOBYTE(v40) = 0;
    LOBYTE(v39) = 0;
    goto LABEL_39;
  }
  uint64_t v38 = v37;
  v59 = v22;
  v60 = v21;
  int v39 = 0;
  int v40 = 0;
  uint64_t v41 = *(void *)v66;
  do
  {
    for (uint64_t j = 0; j != v38; ++j)
    {
      if (*(void *)v66 != v41) {
        objc_enumerationMutation(v36);
      }
      uint64_t v43 = *(void *)(*((void *)&v65 + 1) + 8 * j);
      v39 |= -[NSArray containsObject:](self->_cachedPendingPickedRoutes, "containsObject:", v43, v59, v60);
      v40 |= [(NSArray *)self->_cachedDisplayAsPickedRoutes containsObject:v43];
    }
    uint64_t v38 = [v36 countByEnumeratingWithState:&v65 objects:v73 count:16];
  }
  while (v38);

  if (v39 & 1 | ((v40 & 1) == 0))
  {
    int v20 = v63;
    int v14 = v64;
    int v22 = v59;
    int v21 = v60;
LABEL_39:
    uint64_t v44 = 0;
    goto LABEL_41;
  }
  LOBYTE(v39) = 0;
  uint64_t v44 = 3;
  int v20 = v63;
  int v14 = v64;
  int v22 = v59;
  int v21 = v60;
LABEL_41:
  [v14 setAccessoryType:v44];
  [v14 setIsDisplayedAsPicked:v40 & 1];
  [v14 setPendingSelection:v39 & 1];
  BOOL v45 = [(NSArray *)self->_cachedVolumeCapableRoutes containsObject:v22];
  BOOL v46 = v61 != 1 && v45;
  if (v46)
  {
    outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
    v48 = [v22 routeUID];
    v49 = [(NSMapTable *)outputDeviceVolumeSliders objectForKey:v48];

    [v14 setVolumeSlider:v49];
    v50 = [v14 volumeSlider];
    v51 = [v50 volumeController];
    [v51 updateVolumeValue];

    v52 = [v14 volumeSlider];
    [v52 updateVolume];
  }
  else
  {
    [v14 setVolumeSlider:0];
  }
  [v14 setShowingVolumeSlider:v46];
  v53 = [(MPAVRoutingViewController *)self endpointRoute];
  [v14 updateForEndpoint:v53 routeItem:v21 inferLocalizedModelName:v62 < 2];

  if (self->_tableCellsBackgroundColor)
  {
    objc_msgSend(v14, "setBackgroundColor:");
  }
  else
  {
    v54 = [(MPAVRoutingViewController *)self _tableView];
    v55 = [v54 backgroundColor];

    uint64_t v56 = [MEMORY[0x1E4FB1618] clearColor];
    int v57 = [v55 isEqual:v56];

    if (v57) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    v58 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    [v14 setBackgroundColor:v58];
  }
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
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
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

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  if (self->_discoveryModeBeforeEnteringBackground) {
    [(MPAVRoutingViewController *)self _beginRouteDiscovery];
  }
  self->_suspendedDiscoveryModeDueToApplicationState = 0;
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  self->_suspendedDiscoveryModeDueToApplicationState = 1;
  self->_discoveryModeBeforeEnteringBackground = [(MPAVRoutingController *)self->_routingController discoveryMode];

  [(MPAVRoutingViewController *)self _endRouteDiscovery];
}

- (double)_tableViewHeightAccordingToDataSource
{
  [(MPAVRoutingViewController *)self _tableViewHeaderViewHeight];
  double v4 = v3;
  [(MPAVRoutingViewController *)self _tableViewFooterViewHeight];
  double v6 = v5;
  unint64_t v7 = [(NSArray *)self->_cachedDisplayAsPickedRoutes count];
  [(MPAVRoutingViewController *)self _normalCellHeight];
  double v9 = v8;
  double v10 = 0.0;
  if (self->_style == 3) {
    double v10 = (double)([(MPSectionedCollection *)self->_routingViewItems numberOfSections] - 1)
  }
        * 24.0;
  return v6 + v9 * (double)v7 + v4 + v10;
}

- (void)_diplayShareAudioDisabledAlertForReason:(id)a3
{
  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:a3 preferredStyle:1];
  double v4 = (void *)MEMORY[0x1E4FB1410];
  double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  double v6 = [v5 localizedStringForKey:@"OK" value:&stru_1EE680640 table:@"MediaPlayer"];
  unint64_t v7 = [v4 actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(MPAVRoutingViewController *)self showViewController:v8 sender:self];
}

- (BOOL)_wouldShareAudioForPickedRoute:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [v8 firstObject];
  if (a4 == 1
    && [v8 count] == 1
    && [v7 isShareableRoute]
    && [v9 isShareableRoute]
    && [v7 supportsGrouping])
  {
    char v10 = [v9 supportsGrouping];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldPickRouteOnSelection
{
  return self->_shouldPickRouteOnSelection;
}

- (BOOL)_shouldAutomaticallyUpdateRoutesList
{
  return self->_shouldAutomaticallyUpdateRoutesList;
}

- (void)_setTableCellsContentColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_tableCellsContentColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_tableCellsContentColor, a3);
    double v6 = [(MPAVRoutingViewController *)self _createReloadUpdate];
    [(MPAVRoutingViewController *)self _enqueueUpdate:v6];

    double v5 = v7;
  }
}

- (void)_setTableCellsBackgroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_tableCellsBackgroundColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_tableCellsBackgroundColor, a3);
    double v6 = [(MPAVRoutingViewController *)self _createReloadUpdate];
    [(MPAVRoutingViewController *)self _enqueueUpdate:v6];

    double v5 = v7;
  }
}

- (void)_setShouldPickRouteOnSelection:(BOOL)a3
{
  self->_shouldPickRouteOnSelection = a3;
}

- (void)_setShouldAutomaticallyUpdateRoutesList:(BOOL)a3
{
  self->_shouldAutomaticallyUpdateRoutesList = a3;
}

- (UITableView)_tableView
{
  return (UITableView *)self->_tableView;
}

- (UIColor)_tableCellsContentColor
{
  return self->_tableCellsContentColor;
}

- (UIColor)_tableCellsBackgroundColor
{
  return self->_tableCellsBackgroundColor;
}

- (double)_normalCellHeight
{
  return 52.0;
}

- (double)_expandedCellHeight
{
  return 88.0;
}

- (MPAVRoutingController)_routingController
{
  return self->_routingController;
}

- (void)setEndpointRoute:(id)a3
{
  double v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    [(NSMapTable *)self->_outputDeviceVolumeSliders removeAllObjects];
    double v6 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
    [(MPAVRoutingViewControllerUpdate *)v6 setShouldReload:1];
    [(MPAVRoutingViewController *)self _enqueueUpdate:v6];

    double v5 = v7;
  }
}

- (void)enqueueRefreshUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MPAVRoutingViewController_enqueueRefreshUpdate__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__MPAVRoutingViewController_enqueueRefreshUpdate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _createRefreshUpdate];
  [v1 _enqueueUpdate:v2];
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = [(MPAVRoutingViewController *)self isInCarPlay];
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  [(MPAVRoutingViewController *)self enqueueRefreshUpdate];
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = [(MPAVRoutingViewController *)self isInCarPlay];
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  [(MPAVRoutingViewController *)self enqueueRefreshUpdate];
}

- (void)routingCellDidTapToExpand:(id)a3
{
  id v7 = [(MPAVClippingTableView *)self->_tableView indexPathForCell:a3];
  double v4 = -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:");
  if ([v4 type] == 1)
  {
    double v5 = [v4 mainRoute];
    uint64_t v6 = [(MPAVRoutingViewController *)self groupUIDForRoute:v5];

    [(NSMutableSet *)self->_expandedGroupUIDs addObject:v6];
    [(MPAVRoutingViewController *)self enqueueRefreshUpdate];
  }
}

- (void)routingCell:(id)a3 mirroringSwitchValueDidChange:(BOOL)a4
{
}

- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8
{
  id v44 = a3;
  id v14 = a4;
  id v46 = a6;
  id v45 = a7;
  id v15 = a8;
  long long v16 = v15;
  if (a5)
  {
    if (a5 != 1)
    {
      int v24 = 0;
      int v33 = 0;
      int v35 = 0;
      int v20 = 0;
      goto LABEL_13;
    }
    id v43 = v15;
    long long v17 = NSString;
    long long v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    long long v19 = [v18 localizedStringForKey:@"ROUTING_SPEAKER_HIJACK_INTERRUPT_LOCAL_MULTITASK_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
    int v20 = objc_msgSend(v17, "stringWithFormat:", v19, v46);

    uint64_t v21 = NSString;
    int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    unint64_t v23 = [v22 localizedStringForKey:@"ROUTING_SPEAKER_HIJACK_INTERRUPT_LOCAL_MULTITASK_MESSAGE" value:&stru_1EE680640 table:@"MediaPlayer"];
    int v24 = objc_msgSend(v21, "stringWithFormat:", v23, v45, v46);
  }
  else
  {
    id v43 = v15;
    int v25 = [v14 isTVRoute];
    int v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v27 = v26;
    if (v25) {
      uint64_t v28 = @"ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_TV_TITLE";
    }
    else {
      uint64_t v28 = @"ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_SPEAKER_TITLE";
    }
    int v20 = [v26 localizedStringForKey:v28 value:&stru_1EE680640 table:@"MediaPlayer"];

    int v29 = [v14 isTVRoute];
    int v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    int v22 = v30;
    if (v29) {
      uint64_t v31 = @"ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_TV_MESSAGE";
    }
    else {
      uint64_t v31 = @"ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_SPEAKER_MESSAGE";
    }
    int v24 = [v30 localizedStringForKey:v31 value:&stru_1EE680640 table:@"MediaPlayer"];
  }

  int v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  int v33 = [v32 localizedStringForKey:@"ROUTING_SPEAKER_HIJACK_NAG_CANCEL" value:&stru_1EE680640 table:@"MediaPlayer"];

  int v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  int v35 = [v34 localizedStringForKey:@"ROUTING_SPEAKER_HIJACK_NAG_CONFIRM" value:&stru_1EE680640 table:@"MediaPlayer"];

  long long v16 = v43;
LABEL_13:
  int v36 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v20 message:v24 preferredStyle:1];
  uint64_t v37 = (void *)MEMORY[0x1E4FB1410];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke;
  v49[3] = &unk_1E57F0F20;
  id v38 = v16;
  id v50 = v38;
  int v39 = [v37 actionWithTitle:v33 style:1 handler:v49];
  [v36 addAction:v39];

  int v40 = (void *)MEMORY[0x1E4FB1410];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2;
  v47[3] = &unk_1E57F0F20;
  id v48 = v38;
  id v41 = v38;
  long long v42 = [v40 actionWithTitle:v35 style:0 handler:v47];
  [v36 addAction:v42];

  [(MPAVRoutingViewController *)self showViewController:v36 sender:self];
}

uint64_t __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  unint64_t updatesSincePresentation = self->_updatesSincePresentation;
  self->_unint64_t updatesSincePresentation = updatesSincePresentation + 1;
  if (updatesSincePresentation > 4) {
    [(MPAVRoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
  }
  else {
    [(MPAVRoutingViewController *)self _updateDisplayedRoutes];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [(MPAVRoutingViewController *)self _normalCellHeight];
  double v5 = [(MPAVRoutingViewController *)self traitCollection];
  [v5 displayScale];
  UIRoundToScale();
  double v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [(MPAVRoutingViewController *)self _normalCellHeight];
  double v5 = [(MPAVRoutingViewController *)self traitCollection];
  [v5 displayScale];
  UIRoundToScale();
  double v7 = v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [(MPSectionedCollection *)self->_routingViewItems itemAtIndexPath:v7];
  uint64_t v31 = [v8 routes];
  double v9 = [v8 mainRoute];
  unint64_t v10 = [v8 type];
  if (v10 >= 2)
  {
    if (v10 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v8 actionIdentifier];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "RCS user selected: %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (!self->_shouldPickRouteOnSelection || v9 == 0)
  {
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "RCS attempted to select a nil route, ignoring.", buf, 2u);
    }
    goto LABEL_14;
  }
  self->_hasUserSelections = 1;
  if ([(MPAVRoutingController *)self->_routingController routeIsPendingPick:v9]) {
    int v16 = 0;
  }
  else {
    int v16 = [v9 isPicked] ^ 1;
  }
  int v17 = [(MPAVRoutingController *)self->_routingController routeIsPendingPick:v9];
  if (v17) {
    int v17 = [v9 isPicked];
  }
  int v18 = v16 | v17;
  if (v18) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  int v20 = [(MPAVRoutingController *)self->_routingController pickedRoutes];
  BOOL v21 = [(MPAVRoutingViewController *)self _wouldShareAudioForPickedRoute:v9 operation:v19 pickedRoutes:v20];

  BOOL v22 = [(MPAVRoutingController *)self->_routingController supportsMultipleSelection];
  if ((v18 & 1) == 0 && [v9 isDeviceSpeakerRoute])
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "RCS cannot remove device route", buf, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if ([(MPAVRoutingViewController *)self isInVehicle] && v22 && v21)
  {
    unint64_t v23 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [(MPAVRoutingController *)self->_routingController pickedRoutes];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "Can't share audio while in the Car. Route: %{public}@, picked: %{public}@", buf, 0x16u);
    }
    BOOL v25 = [(MPAVRoutingViewController *)self isInCarPlay];
    int v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v27 = v26;
    if (v25) {
      uint64_t v28 = @"ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARPLAY_SAME_OWNER";
    }
    else {
      uint64_t v28 = @"ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARKIT_SAME_OWNER";
    }
    int v29 = [v26 localizedStringForKey:v28 value:&stru_1EE680640 table:@"MediaPlayer"];

    [(MPAVRoutingViewController *)self _diplayShareAudioDisabledAlertForReason:v29];
LABEL_15:
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  BOOL v40 = 0;
  BOOL v40 = [(MPAVRoutingViewController *)self _operationRequiresOptimisticState:v19 routes:v31];
  routingController = self->_routingController;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v33[3] = &unk_1E57F0ED0;
  uint64_t v38 = v19;
  id v34 = v31;
  int v35 = self;
  uint64_t v37 = buf;
  id v36 = v9;
  [(MPAVRoutingController *)routingController selectRoutes:v34 operation:v19 completion:v33];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v32[3] = &unk_1E57F0EF8;
  v32[4] = self;
  v32[5] = buf;
  [(MPAVRoutingViewController *)self _createUpdateWithCompletion:v32];

  _Block_object_dispose(buf, 8);
  if (!v8) {
    goto LABEL_19;
  }
LABEL_16:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingViewController:self didSelectRoutingViewItem:v8];
  }

LABEL_19:
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 64) == 1 && (unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    double v4 = *(void **)(a1 + 40);
    double v5 = (void *)v4[134];
    id v6 = [v4 endpointGroupUID];
    [v5 removeObject:v6];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  [*(id *)(a1 + 40) setOptimisticUpdate:0];
  if (!v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v8[3] = &unk_1E57F9F98;
    id v7 = *(void **)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  block[3] = &unk_1E57F9F48;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  block[4] = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)) {
    return [*(id *)(result + 32) setOptimisticUpdate:*(void *)(result + 40)];
  }
  return result;
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1176));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained routingViewController:*(void *)(a1 + 32) didPickRoute:*(void *)(a1 + 40)];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v6 = [(MPAVRoutingViewController *)self themeDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 routingViewController:self willDisplayCell:v7];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"_MPAVRoutingViewCellIdentifier" forIndexPath:v6];
  [(MPAVRoutingViewController *)self _configureCell:v7 forIndexPath:v6];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v5 = [(MPSectionedCollection *)self->_routingViewItems sectionAtIndex:a4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 && [(MPAVRoutingViewController *)self style] == 3)
  {
    id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"_MPAVRoutingViewHeaderIdentifier"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 24.0;
  if (!a4) {
    return 0.0;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(MPSectionedCollection *)self->_routingViewItems numberOfItemsInSection:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(MPSectionedCollection *)self->_routingViewItems numberOfSections];
}

- (CGSize)preferredContentSize
{
  if (self->_tableView)
  {
    id v3 = [(MPAVRoutingViewController *)self view];
    [v3 layoutIfNeeded];

    [(MPAVClippingTableView *)self->_tableView layoutIfNeeded];
    [(MPAVRoutingViewController *)self _tableViewHeightAccordingToDataSource];
    double v5 = 156.0;
    if (v4 >= 156.0 || self->_style != 2) {
      double v5 = v4;
    }
  }
  else
  {
    double v5 = 0.0;
  }
  double v7 = 320.0;
  result.height = v5;
  result.width = v7;
  return result;
}

- (BOOL)shouldOverrideContentSizeCategory:(id)a3
{
  id v3 = (NSString *)a3;
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
  double v5 = (NSString *)*MEMORY[0x1E4FB27B0];

  return v5 == v3 || IsAccessibilityCategory;
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v12 viewWillLayoutSubviews];
  id v3 = [(MPAVRoutingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[MPAVClippingTableView setFrame:](self->_tableView, "setFrame:", 0.0, 0.0, v5, v7);
  id v8 = [(MPAVRoutingViewController *)self traitCollection];
  uint64_t v9 = [v8 preferredContentSizeCategory];

  if ([(MPAVRoutingViewController *)self shouldOverrideContentSizeCategory:v9])
  {
    unint64_t v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27B8]];
    uint64_t v11 = [(MPAVRoutingViewController *)self view];
    [v11 _setLocalOverrideTraitCollection:v10];
  }
  else
  {
    unint64_t v10 = [(MPAVRoutingViewController *)self view];
    [v10 _setLocalOverrideTraitCollection:0];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (!self->_onScreen)
  {
    [(MPAVRoutingViewController *)self _endRouteDiscovery];
    [(MPWeakTimer *)self->_updateTimer invalidate];
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;

    [(MPAVRoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v5 viewDidDisappear:a3];
  [(MPAVRoutingViewController *)self _endRouteDiscovery];
  [(MPWeakTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  self->_onScreen = 0;
  [(MPAVRoutingViewController *)self _collapseAllGroups];
  [(MPAVRoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
  [(MPAVRoutingViewController *)self resetDisplayedRoutes];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v4 viewDidAppear:a3];
  if (self->_suspendedDiscoveryModeDueToApplicationState) {
    self->_discoveryModeBeforeEnteringBackground = 3;
  }
  else {
    [(MPAVRoutingViewController *)self _beginRouteDiscovery];
  }
  self->_unint64_t updatesSincePresentation = 0;
  [(MPAVRoutingViewController *)self _updateDisplayedRoutes];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v4 viewWillAppear:a3];
  self->_onScreen = 1;
  [(MPAVRoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
}

- (void)registerTableViewCells
{
  [(MPAVClippingTableView *)self->_tableView registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"_MPAVRoutingViewHeaderIdentifier"];
  tableView = self->_tableView;
  uint64_t v4 = objc_opt_class();

  [(MPAVClippingTableView *)tableView registerClass:v4 forCellReuseIdentifier:@"_MPAVRoutingViewCellIdentifier"];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v21 viewDidLoad];
  id v3 = [(MPAVRoutingViewController *)self view];
  BOOL v4 = self->_style == 1;
  objc_super v5 = [MPAVClippingTableView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  unint64_t v10 = -[MPAVClippingTableView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  tableView = self->_tableView;
  self->_tableView = v10;

  -[MPAVClippingTableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 10.0, 0.0, 10.0);
  [(MPAVClippingTableView *)self->_tableView setDataSource:self];
  [(MPAVClippingTableView *)self->_tableView setDelegate:self];
  objc_super v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
  [(MPAVClippingTableView *)self->_tableView setTableFooterView:v12];

  double continuousCornerRadius = self->_continuousCornerRadius;
  id v14 = [(MPAVClippingTableView *)self->_tableView layer];
  [v14 setCornerRadius:continuousCornerRadius];

  id v15 = [(MPAVClippingTableView *)self->_tableView layer];
  [v15 setMasksToBounds:1];

  [(MPAVRoutingViewController *)self registerTableViewCells];
  [v3 addSubview:self->_tableView];
  unint64_t style = self->_style;
  if (style == 3)
  {
    int v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [(MPAVRoutingViewController *)self _setTableCellsContentColor:v18];

    uint64_t v19 = [MEMORY[0x1E4FB1618] clearColor];
    [v3 setBackgroundColor:v19];

    int v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(MPAVClippingTableView *)self->_tableView setBackgroundColor:v20];

    [(MPAVClippingTableView *)self->_tableView setIndicatorStyle:2];
    [(MPAVRoutingViewController *)self setIconStyle:1];
  }
  else if (!style)
  {
    int v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [v3 setBackgroundColor:v17];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  self->_double continuousCornerRadius = a3;
  id v4 = [(MPAVClippingTableView *)self->_tableView layer];
  [v4 setCornerRadius:a3];
}

- (void)resetScrollPosition
{
}

- (void)resetDisplayedRoutes
{
  self->_hasUserSelections = 0;
  [(MPAVRoutingViewController *)self _updateDisplayedRoutes];
}

- (BOOL)isInVehicle
{
  if ([(MPAVRoutingViewController *)self isInCarPlay]) {
    return 1;
  }

  return [(MPAVRoutingViewController *)self hasCarKitRoute];
}

- (BOOL)hasCarKitRoute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MPAVRoutingController *)self->_routingController availableRoutes];
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

- (BOOL)isInCarPlay
{
  id v2 = [(CARSessionStatus *)self->_carPlayStatus currentSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setGroupSliderCoordinator:(id)a3
{
  p_groupSliderCoordinator = &self->_groupSliderCoordinator;
  long long v7 = (MPVolumeGroupSliderCoordinator *)a3;
  if (*p_groupSliderCoordinator != v7)
  {
    objc_storeStrong((id *)&self->_groupSliderCoordinator, a3);
    [(NSMapTable *)self->_outputDeviceVolumeSliders removeAllObjects];
    [(MPVolumeGroupSliderCoordinator *)*p_groupSliderCoordinator removeAllIndividualVolumeSliders];
  }
  double v6 = [(MPAVRoutingViewController *)self _createReloadUpdate];
  [(MPAVRoutingViewController *)self _enqueueUpdate:v6];
}

- (void)setDiscoveryModeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryModeOverride, a3);

  [(MPAVRoutingViewController *)self _setNeedsRouteDiscoveryModeUpdate];
}

- (void)setIconStyle:(unint64_t)a3
{
  if (self->_iconStyle != a3)
  {
    self->_iconStyle = a3;
    id v4 = [(MPAVRoutingViewController *)self _createReloadUpdate];
    [(MPAVRoutingViewController *)self _enqueueUpdate:v4];
  }
}

- (void)setMirroringStyle:(unint64_t)a3
{
  if (self->_mirroringStyle != a3)
  {
    self->_mirroringStyle = a3;
    [(MPAVRoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
  }
}

- (void)setAllowMirroring:(BOOL)a3
{
}

- (BOOL)allowMirroring
{
  return self->_mirroringStyle != 0;
}

- (void)setAVItemType:(int64_t)a3
{
  if (self->_avItemType != a3)
  {
    self->_avItemType = a3;
    [(MPAVRoutingViewController *)self _setNeedsDisplayedRoutesUpdate];
  }
}

- (void)dealloc
{
  notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  notify_cancel(self->_airPlayPasswordAlertDidCancelToken);
  [(MPAVRoutingViewController *)self _unregisterNotifications];
  [(MPWeakTimer *)self->_updateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingViewController;
  [(MPAVRoutingViewController *)&v3 dealloc];
}

- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3 routingController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MPAVRoutingViewController;
  long long v7 = [(MPAVRoutingViewController *)&v10 initWithNibName:0 bundle:0];
  long long v8 = v7;
  if (v7) {
    [(MPAVRoutingViewController *)v7 _initWithStyle:a3 routingController:v6];
  }

  return v8;
}

- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPAVRoutingViewController;
  id v4 = [(MPAVRoutingViewController *)&v7 initWithNibName:0 bundle:0];
  objc_super v5 = v4;
  if (v4) {
    [(MPAVRoutingViewController *)v4 _initWithStyle:a3 routingController:0];
  }
  return v5;
}

- (MPAVRoutingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MPAVRoutingViewController;
  id v4 = [(MPAVRoutingViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(MPAVRoutingViewController *)v4 _initWithStyle:1 routingController:0];
  }
  return v5;
}

- (void)_initWithStyle:(unint64_t)a3 routingController:(id)a4
{
  id v6 = (MPAVRoutingController *)a4;
  self->_unint64_t style = a3;
  self->_mirroringStyle = 0;
  self->_int64_t routeDiscoveryMode = 0;
  if (!v6)
  {
    objc_super v7 = [MPAVRoutingController alloc];
    long long v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    id v6 = [(MPAVRoutingController *)v7 initWithName:v9];
  }
  objc_storeStrong((id *)&self->_routingController, v6);
  [(MPAVRoutingController *)self->_routingController setDelegate:self];
  self->_suspendedDiscoveryModeDueToApplicationState = 0;
  self->_discoveryModeBeforeEnteringBackground = 0;
  self->_shouldAutomaticallyUpdateRoutesList = 1;
  self->_shouldPickRouteOnSelection = 1;
  objc_super v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
  self->_outputDeviceVolumeSliders = v10;

  uint64_t v12 = (NSMutableSet *)objc_opt_new();
  expandedGroupUIDs = self->_expandedGroupUIDs;
  self->_expandedGroupUIDs = v12;

  id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  id v15 = [v14 localizedStringForKey:@"AIRTUNES_POPOVER_TITLE" value:&stru_1EE680640 table:@"MediaPlayer"];
  [(MPAVRoutingViewController *)self setTitle:v15];

  [(MPAVRoutingViewController *)self _registerNotifications];
  [(MPAVRoutingViewController *)self _registerCarPlayObserver];
  objc_initWeak(&location, self);
  int v16 = MEMORY[0x1E4F14428];
  id v17 = MEMORY[0x1E4F14428];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__MPAVRoutingViewController__initWithStyle_routingController___block_invoke;
  v18[3] = &unk_1E57F6F90;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertDidCancel", &self->_airPlayPasswordAlertDidCancelToken, v16, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __62__MPAVRoutingViewController__initWithStyle_routingController___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[136] clearCachedRoutes];
    [v2 _setNeedsDisplayedRoutesUpdate];
    id WeakRetained = v2;
  }
}

@end