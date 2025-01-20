@interface MUPlaceEnrichmentSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (BOOL)isLoading;
- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3;
- (GEOEnrichmentData)enrichmentData;
- (MUPlaceEnrichmentAction)contextMenuAction;
- (MUPlaceEnrichmentActionManager)actionManager;
- (MUPlaceEnrichmentContextMenu)contextMenuButton;
- (MUPlaceEnrichmentSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 externalActionHandler:(id)a8 rapActionHandler:(id)a9;
- (MUPlaceEnrichmentSectionControllerDelegate)placeEnrichmentDelegate;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (id)draggableContent;
- (int)analyticSuppressionReasonFrom:(id)a3;
- (int)analyticsModuleType;
- (void)_populateRevealedAnalyticsModule:(id)a3;
- (void)_setupPlaceEnrichmentViewController;
- (void)addContextMenuUsingBoundingBox:(id)a3 accessibilityLabel:(id)a4;
- (void)dealloc;
- (void)didLayoutContextMenu:(id)a3 completion:(id)a4;
- (void)didTapAddPhoto;
- (void)didTapRatePlace;
- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4;
- (void)refreshPlaceEnrichment;
- (void)removeWebContentViewController:(id)a3 arguments:(id)a4;
- (void)setActionManager:(id)a3;
- (void)setContextMenuAction:(id)a3;
- (void)setContextMenuButton:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setEnrichmentData:(id)a3;
- (void)setPlaceEnrichmentDelegate:(id)a3;
- (void)updateActionsOverWebBridge:(id)a3;
- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)webContentViewControllerDidStopLoading:(id)a3;
@end

@implementation MUPlaceEnrichmentSectionController

- (MUPlaceEnrichmentSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 externalActionHandler:(id)a8 rapActionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)MUPlaceEnrichmentSectionController;
  v21 = [(MUPlaceSectionController *)&v34 initWithMapItem:v15];
  if (v21)
  {
    v22 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceEnrichmentSectionController", "", buf, 2u);
    }

    v21->_shouldRemoveWebContent = 0;
    v23 = objc_alloc_init(MUWebContentViewController);
    webContentViewController = v21->_webContentViewController;
    v21->_webContentViewController = v23;

    v25 = [MUPlaceEnrichmentActionManager alloc];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __163__MUPlaceEnrichmentSectionController_initWithMapItem_actionManager_dataAvailability_amsResultProvider_callToActionDelegate_externalActionHandler_rapActionHandler___block_invoke;
    v31[3] = &unk_1E57500C8;
    v26 = v21;
    v32 = v26;
    uint64_t v27 = [(MUPlaceEnrichmentActionManager *)v25 initWithPlaceActionManager:v16 mapItem:v15 dataAvailability:v17 amsResultProvider:v18 callToActionDelegate:v19 contextMenuDelegate:v26 externalActionHandler:v20 analyticsDelegate:v26 onActionUpdate:v31];
    actionManager = v26->_actionManager;
    v26->_actionManager = (MUPlaceEnrichmentActionManager *)v27;

    [(MUPlaceEnrichmentSectionController *)v26 _setupPlaceEnrichmentViewController];
    v29 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceEnrichmentSectionController", "", buf, 2u);
    }
  }
  return v21;
}

void __163__MUPlaceEnrichmentSectionController_initWithMapItem_actionManager_dataAvailability_amsResultProvider_callToActionDelegate_externalActionHandler_rapActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [*(id *)(a1 + 32) updateActionsOverWebBridge:v3];
}

- (void)_setupPlaceEnrichmentViewController
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(MUWebContentViewController *)self->_webContentViewController setDelegate:self];
  if (!self->_sectionView)
  {
    id v3 = [[MUPlaceSectionView alloc] initWithStyle:0 alwaysHideSeparators:0];
    sectionView = self->_sectionView;
    self->_sectionView = v3;

    [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  }
  v5 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  objc_super v34 = __73__MUPlaceEnrichmentSectionController__setupPlaceEnrichmentViewController__block_invoke;
  v35 = &unk_1E574EE08;
  v36 = self;
  id v6 = v5;
  id v37 = v6;
  v7 = (void (**)(void))_Block_copy(&v32);
  v8 = objc_msgSend(v6, "mapItem", v32, v33, v34, v35, v36);
  v9 = [v8 _identifier];
  v10 = [(MUPlaceSectionController *)self mapItem];
  v11 = [v10 _identifier];
  char v12 = [v9 isEqual:v11];

  if (v12)
  {
    if ([v6 currentState])
    {
      switch([v6 currentState])
      {
        case 0:
          v13 = MUGetMUPlaceEnrichmentSectionControllerLog();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_11;
          }
          v14 = [(MUPlaceSectionController *)self mapItem];
          id v15 = [v14 _identifier];
          *(_DWORD *)buf = 138412546;
          v39 = @"Unknown";
          __int16 v40 = 2112;
          v41 = v15;
          _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So Configuring with identifier: %@", buf, 0x16u);
          goto LABEL_10;
        case 1:
          id v19 = MUGetMUPlaceEnrichmentSectionControllerLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [(MUPlaceSectionController *)self mapItem];
            v21 = [v20 _identifier];
            *(_DWORD *)buf = 138412546;
            v39 = @"Initialized";
            __int16 v40 = 2112;
            v41 = v21;
            _os_log_impl(&dword_1931EA000, v19, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to fetch enrichment for identifier: %@", buf, 0x16u);
          }
          goto LABEL_12;
        case 2:
          v22 = MUGetMUPlaceEnrichmentSectionControllerLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = [(MUPlaceSectionController *)self mapItem];
            v24 = [v23 _identifier];
            *(_DWORD *)buf = 138412546;
            v39 = @"Loading";
            __int16 v40 = 2112;
            v41 = v24;
            _os_log_impl(&dword_1931EA000, v22, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to register for enrichment updates for identifier: %@", buf, 0x16u);
          }
          [v6 registerObserver:self];
          break;
        case 3:
          v25 = MUGetMUPlaceEnrichmentSectionControllerLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v26 = [(MUPlaceSectionController *)self mapItem];
            uint64_t v27 = [v26 _identifier];
            *(_DWORD *)buf = 138412546;
            v39 = @"ReadyWithData";
            __int16 v40 = 2112;
            v41 = v27;
            _os_log_impl(&dword_1931EA000, v25, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So using enrichment for identifier: %@", buf, 0x16u);
          }
          v28 = [v6 placeEnrichmentData];
          [(MUPlaceEnrichmentSectionController *)self setEnrichmentData:v28];

          break;
        case 4:
          v29 = MUGetMUPlaceEnrichmentSectionControllerLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = [(MUPlaceSectionController *)self mapItem];
            v31 = [v30 _identifier];
            *(_DWORD *)buf = 138412546;
            v39 = @"Error";
            __int16 v40 = 2112;
            v41 = v31;
            _os_log_impl(&dword_1931EA000, v29, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to remove enrichment module for identifier: %@", buf, 0x16u);
          }
          [(MUPlaceEnrichmentSectionController *)self removeWebContentViewController:self->_webContentViewController arguments:0];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    v13 = MUGetMUPlaceEnrichmentSectionControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v6 mapItem];
      id v15 = [v14 _identifier];
      id v16 = [(MUPlaceSectionController *)self mapItem];
      id v17 = [v16 _identifier];
      *(_DWORD *)buf = 138412546;
      v39 = v15;
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_DEBUG, "Unequal mapitems. API controller was holding identifier: %@ but placecard wants to show identifier: %@", buf, 0x16u);

LABEL_10:
    }
LABEL_11:

    id v18 = [(MUPlaceSectionController *)self mapItem];
    [v6 configureWithMapItem:v18 traits:0];

LABEL_12:
    v7[2](v7);
  }
}

uint64_t __73__MUPlaceEnrichmentSectionController__setupPlaceEnrichmentViewController__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = MUGetMUPlaceEnrichmentSectionControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) mapItem];
    v4 = [v3 _identifier];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_DEBUG, "Fetching Enrichment information for identifier: %@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 40) registerObserver:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) fetchPlaceEnrichment:0];
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)refreshPlaceEnrichment
{
  id v3 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
  v4 = [v3 mapItem];
  v5 = [v4 _identifier];
  int v6 = [(MUPlaceSectionController *)self mapItem];
  v7 = [v6 _identifier];
  int v8 = [v5 isEqual:v7];

  v9 = [v3 placeEnrichmentData];
  v10 = [(MUPlaceEnrichmentSectionController *)self enrichmentData];
  int v11 = [v9 isEqual:v10];

  char v12 = MUGetMUPlaceEnrichmentSectionControllerLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v8 && v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v12, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentSectionController was informed to refresh place enrichment but all the information is same. So no-operation here.", buf, 2u);
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1931EA000, v12, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentSectionController was informed to refresh place enrichment.", v14, 2u);
    }

    [(MUPlaceEnrichmentSectionController *)self _setupPlaceEnrichmentViewController];
    char v12 = [(MUPlaceSectionController *)self delegate];
    [v12 placeSectionControllerDidUpdateContent:self];
  }
}

- (void)updateActionsOverWebBridge:(id)a3
{
}

- (BOOL)hasContent
{
  webContentViewController = self->_webContentViewController;
  if (webContentViewController) {
    LOBYTE(webContentViewController) = [(MUWebContentViewController *)webContentViewController isLoading]
  }
                                    || !self->_shouldRemoveWebContent;
  return (char)webContentViewController;
}

- (void)dealloc
{
  id v3 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
  [v3 unregisterObserver:self];

  v4 = [MEMORY[0x1E4F63E38] sharedData];
  [v4 setPlaceCardPlaceActionDetailsShowcaseId:0];

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceEnrichmentSectionController;
  [(MUPlaceEnrichmentSectionController *)&v5 dealloc];
}

- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(MUPlaceSectionController *)self mapItem];
  int v8 = [v7 _identifier];
  v9 = [v6 _identifier];

  LODWORD(v6) = [v8 isEqual:v9];
  if (v6)
  {
    [(MUPlaceEnrichmentSectionController *)self setEnrichmentData:v11];
    v10 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
    [v10 unregisterObserver:self];
  }
}

- (void)setEnrichmentData:(id)a3
{
  id v29 = a3;
  objc_super v5 = [v29 enrichmentEntities];
  id v6 = [v5 firstObject];
  v7 = [v6 enrichmentHtml];
  int v8 = [(MUPlaceEnrichmentSectionController *)self enrichmentData];
  v9 = [v8 enrichmentEntities];
  v10 = [v9 firstObject];
  id v11 = [v10 enrichmentHtml];
  char v12 = [v7 isEqualToString:v11];

  BOOL v13 = v29;
  if ((v12 & 1) == 0)
  {
    v14 = [v29 enrichmentEntities];
    id v15 = [v14 firstObject];
    id v16 = [v15 enrichmentHtml];

    if (v16)
    {
      objc_storeStrong((id *)&self->_enrichmentData, a3);
      id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:@"MUPlaceEnrichmentSectionControllerDidFetchEnrichmentNotification" object:self];

      id v18 = objc_alloc_init(MUPresentationOptions);
      [(MUPresentationOptions *)v18 setPresentingViewController:self->_webContentViewController];
      [(MUPresentationOptions *)v18 setSourceView:self->_sectionView];
      [(MUPlaceSectionView *)self->_sectionView frame];
      -[MUPresentationOptions setSourceRect:](v18, "setSourceRect:");
      id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 postNotificationName:@"MUPlaceEnrichmentSectionControllerDidStartLoadingNotification" object:self];

      id v20 = [(MUPlaceEnrichmentSectionController *)self actionManager];
      v21 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      [v20 configureWithEnrichmentDataProvider:v21 presentationOptions:v18];

      double v22 = 0.0;
      if (GEOConfigGetBOOL())
      {
        GEOConfigGetDouble();
        double v22 = v23;
      }
      webContentViewController = self->_webContentViewController;
      v25 = [(MUPlaceEnrichmentSectionController *)self actionManager];
      [(MUWebContentViewController *)webContentViewController configureWithHTML:v16 actionManager:v25 initialDefaultHeight:v22];

      sectionView = self->_sectionView;
      uint64_t v27 = [(MUWebContentViewController *)self->_webContentViewController view];
      [(MUPlaceSectionView *)sectionView attachViewToContentView:v27];

      v28 = +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController];
      [v28 cancelFetchingPlaceEnrichment];
    }
    BOOL v13 = v29;
  }
}

- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3
{
  return 0;
}

- (void)removeWebContentViewController:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_shouldRemoveWebContent = 1;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [v7 objectForKeyedSubscript:@"suppressionReason"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [v7 objectForKeyedSubscript:@"suppressionReason"];
        v31 = (void *)v10;
        if (v10) {
          unsigned int v26 = [(MUPlaceEnrichmentSectionController *)self analyticSuppressionReasonFrom:v10];
        }
        else {
          unsigned int v26 = 0;
        }
        uint64_t v11 = [v7 objectForKeyedSubscript:@"appCategory"];
        v30 = (void *)v11;
        if (v11)
        {
          uint64_t v12 = v11;
          id v13 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          [v13 setNumberStyle:1];
          v14 = [(MUPlaceEnrichmentSectionController *)self actionManager];
          id v15 = [v14 adamIDForAppCategory:v12];
          v25 = [v13 numberFromString:v15];
        }
        else
        {
          v25 = 0;
        }
        v28 = (void *)MEMORY[0x1E4F63E30];
        id v29 = [(MUPlaceSectionController *)self mapItem];
        uint64_t v27 = [v29 _muid];
        id v16 = [(MUPlaceSectionController *)self mapItem];
        uint64_t v17 = [v16 _resultProviderID];
        id v18 = [(MUPlaceEnrichmentSectionController *)self enrichmentData];
        id v19 = [v18 enrichmentEntities];
        id v20 = [v19 firstObject];
        v21 = [v20 enrichmentInfo];
        double v22 = [v21 showcaseId];
        [v28 captureShowcaseSuppressionEventWithBusinessId:v27 localSearchProviderID:v17 showcaseId:v22 adamId:v25 suppressionReason:v26];
      }
    }
  }
  double v23 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v23, OS_LOG_TYPE_INFO, "MUPlaceWebContentSectionController: Webmodule requested removal, will tell parent to update", buf, 2u);
  }

  v24 = [(MUPlaceSectionController *)self delegate];
  [v24 placeSectionControllerDidUpdateContent:self];
}

- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_initWeak(&location, self);
  uint64_t v12 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke;
  v18[3] = &unk_1E574F6C8;
  objc_copyWeak(&v20, &location);
  v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2;
  v15[3] = &unk_1E574F830;
  objc_copyWeak(&v17, &location);
  id v14 = v11;
  id v16 = v14;
  objc_msgSend(v12, "_mapsui_animateWithDuration:animations:completion:", v18, v15, 0.3);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained delegate];
    v4 = [v3 placeSectionControllerRequestsRootView:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_msgSend(v4, "_mapsui_layoutIfNeeded");

    id WeakRetained = v5;
  }
}

void __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained delegate];
    [v3 placeSectionControllerRequestsLayoutChange:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v4;
  }
}

- (void)webContentViewControllerDidStopLoading:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"MUPlaceEnrichmentSectionControllerDidFinishLoadingNotification" object:self];

  id v5 = [(MUPlaceEnrichmentSectionController *)self placeEnrichmentDelegate];
  [v5 placeEnrichmentSectionControllerDidStopLoading:self];
}

- (id)draggableContent
{
  return 0;
}

- (int)analyticsModuleType
{
  return 40;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F64968]);
  id v5 = [(MUPlaceSectionController *)self mapItem];
  id v6 = [v5 _enrichmentInfo];
  id v7 = [v6 showcaseId];

  if ([v7 length])
  {
    [v4 setShowcaseId:v7];
    [v8 setShowcase:v4];
  }
}

- (void)didTapAddPhoto
{
}

- (void)didTapRatePlace
{
}

- (void)addContextMenuUsingBoundingBox:(id)a3 accessibilityLabel:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:0x1EE3CE5C0];
  [v8 doubleValue];
  double v10 = v9;
  id v11 = [v6 objectForKeyedSubscript:0x1EE3CE5E0];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v6 objectForKeyedSubscript:0x1EE3CE5A0];
  [v14 doubleValue];
  double v16 = v15;
  id v17 = [v6 objectForKeyedSubscript:0x1EE3CE580];
  [v17 doubleValue];
  double v19 = v18;

  id v20 = [(MUPlaceEnrichmentSectionController *)self contextMenuButton];

  v21 = MUGetMUPlaceEnrichmentSectionControllerLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
    {
      double v23 = [(MUPlaceEnrichmentSectionController *)self contextMenuButton];
      [v23 frame];
      v24 = NSStringFromCGRect(v40);
      v41.origin.x = v10;
      v41.origin.y = v13;
      v41.size.width = v16;
      v41.size.height = v19;
      v25 = NSStringFromCGRect(v41);
      int v35 = 138412546;
      id v36 = v24;
      __int16 v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1931EA000, v21, OS_LOG_TYPE_DEBUG, "Context menu button alreadyd exists; changing boundingBox (from:%@) -> (to:%@)",
        (uint8_t *)&v35,
        0x16u);
    }
    unsigned int v26 = [(MUPlaceEnrichmentSectionController *)self contextMenuButton];
    -[MUPlaceEnrichmentContextMenu setFrame:](v26, "setFrame:", v10, v13, v16, v19);
  }
  else
  {
    if (v22)
    {
      int v35 = 138412290;
      id v36 = v6;
      _os_log_impl(&dword_1931EA000, v21, OS_LOG_TYPE_DEBUG, "Trying to add a context menu button at: %@", (uint8_t *)&v35, 0xCu);
    }

    unsigned int v26 = -[MUPlaceEnrichmentContextMenu initWithFrame:]([MUPlaceEnrichmentContextMenu alloc], "initWithFrame:", v10, v13, v16, v19);
    if (GEOConfigGetBOOL())
    {
      uint64_t v27 = [MEMORY[0x1E4FB1618] redColor];
      [(MUPlaceEnrichmentContextMenu *)v26 setBackgroundColor:v27];

      [(MUPlaceEnrichmentContextMenu *)v26 setAlpha:0.1];
    }
    [(MUPlaceEnrichmentContextMenu *)v26 setIsAccessibilityElement:1];
    [(MUPlaceEnrichmentContextMenu *)v26 setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
    [(MUPlaceEnrichmentContextMenu *)v26 setAccessibilityLabel:v7];
    [(MUPlaceEnrichmentContextMenu *)v26 setAccessibilityIdentifier:v7];
    [(MUPlaceEnrichmentContextMenu *)v26 setContextMenuDelegate:self];
    v28 = [(MUPlaceEnrichmentSectionController *)self actionManager];
    [(MUPlaceEnrichmentContextMenu *)v26 setEnrichmentActionDelegate:v28];

    id v29 = [(MUPlaceEnrichmentSectionController *)self sectionView];
    [v29 addSubview:v26];

    [(MUPlaceEnrichmentSectionController *)self setContextMenuButton:v26];
    v30 = [(GEOEnrichmentData *)self->_enrichmentData enrichmentEntities];
    v31 = [v30 firstObject];
    uint64_t v32 = [v31 enrichmentInfo];
    uint64_t v33 = [v32 showcaseId];

    objc_super v34 = [MEMORY[0x1E4F63E38] sharedData];
    [v34 setPlaceCardPlaceActionDetailsShowcaseId:v33];

    [(MUPlaceSectionController *)self captureInfoCardAction:6111 eventValue:v33 feedbackType:0];
  }
}

- (void)didLayoutContextMenu:(id)a3 completion:(id)a4
{
  -[MUPlaceEnrichmentSectionController setContextMenuAction:](self, "setContextMenuAction:", a3, a4);
  id v6 = [(MUPlaceEnrichmentSectionController *)self contextMenuAction];
  id v5 = [(MUPlaceEnrichmentSectionController *)self contextMenuButton];
  [v5 setContextMenuAction:v6];
}

- (int)analyticSuppressionReasonFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_DIRECTIONS_UNAVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_EXTENSION_UNAVAILABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_CLIP_UNAVAILABLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_QUICK_LINK_UNAVAILABLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_PHONE_NUMBER_UNAVAILABLE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_MESSAGE_URL_UNAVAILABLE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_WEBSITE_URL_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_ARP_RATING_UNSUPPORTED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ENRICHMENT_SUPPRESSION_REASON_ARP_PHOTOS_UNSUPPORTED"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (MUPlaceEnrichmentSectionControllerDelegate)placeEnrichmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeEnrichmentDelegate);
  return (MUPlaceEnrichmentSectionControllerDelegate *)WeakRetained;
}

- (void)setPlaceEnrichmentDelegate:(id)a3
{
}

- (GEOEnrichmentData)enrichmentData
{
  return self->_enrichmentData;
}

- (MUPlaceEnrichmentActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (MUPlaceEnrichmentAction)contextMenuAction
{
  return self->_contextMenuAction;
}

- (void)setContextMenuAction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (MUPlaceEnrichmentContextMenu)contextMenuButton
{
  return self->_contextMenuButton;
}

- (void)setContextMenuButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuButton, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuAction, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_enrichmentData, 0);
  objc_destroyWeak((id *)&self->_placeEnrichmentDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
}

@end