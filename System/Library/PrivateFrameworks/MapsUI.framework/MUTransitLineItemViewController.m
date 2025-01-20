@interface MUTransitLineItemViewController
+ (double)headerHeightInMinimalMode;
- (BOOL)isLoading;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitLineItem)transitLineItem;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MUHeaderButtonsSectionController)headerButtonsSectionController;
- (MUTransitLineItemViewController)initWithTransitLineItem:(id)a3;
- (MUTransitLineItemViewControllerDelegate)delegate;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIView)draggableHeaderView;
- (UIView)viewForHeaderContainmentString;
- (double)contentAlpha;
- (double)currentHeight;
- (double)heightForContentAboveTitle;
- (id)_footerSectionController;
- (id)createMenuActions;
- (id)draggableContent;
- (int)mapTypeForETAProvider:(id)a3;
- (void)_attachLoadingOverlayIfNeeded;
- (void)_fetchNearestStation;
- (void)_openAttributionURLStrings:(id)a3 usingAttribution:(id)a4;
- (void)_removeLoadingOverlayIfNeeded;
- (void)_setupContentView;
- (void)_updateSectionControllers;
- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5;
- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3;
- (void)hideTitle:(BOOL)a3;
- (void)incidentsSectionController:(id)a3 didSelectDetailsForIncidents:(id)a4;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8;
- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10;
- (void)lineItemManager:(id)a3 didSelectReportAProblemWithEnvironment:(id)a4;
- (void)nearestStationSectionController:(id)a3 didSelectStationAttributionURL:(id)a4;
- (void)nearestStationSectionController:(id)a3 didTapStationItem:(id)a4;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3;
- (void)resetNearestStation;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setTransitLineItem:(id)a3;
- (void)setTransitLineItem:(id)a3 loading:(BOOL)a4;
- (void)setTransitOptions:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)updateHeaderTrailingConstant;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MUTransitLineItemViewController

- (MUTransitLineItemViewController)initWithTransitLineItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUTransitLineItemViewController;
  v6 = [(MUTransitLineItemViewController *)&v15 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitLineItem, a3);
    v7->_loading = 0;
    v8 = [[MUTransitLineItemActionManager alloc] initWithDelegate:v7 analyticsDelegate:v7];
    actionManager = v7->_actionManager;
    v7->_actionManager = v8;

    v10 = objc_alloc_init(MUNearestStationProvider);
    nearbyStationProvider = v7->_nearbyStationProvider;
    v7->_nearbyStationProvider = v10;

    v12 = (MKETAProvider *)objc_alloc_init(MEMORY[0x1E4F30E90]);
    etaProvider = v7->_etaProvider;
    v7->_etaProvider = v12;

    [(MKETAProvider *)v7->_etaProvider setDelegate:v7];
    [(MUTransitLineItemViewController *)v7 _setupContentView];
  }

  return v7;
}

- (void)_setupContentView
{
  v3 = [MUScrollableStackView alloc];
  v4 = -[MUScrollableStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  [(MUScrollableStackView *)self->_contentStackView setAxis:1];
  [(MUScrollableStackView *)self->_contentStackView setSpacing:16.0];
  [(MUScrollableStackView *)self->_contentStackView setDelegate:self];
  [(MUScrollableStackView *)self->_contentStackView setAlwaysBounceVertical:1];
  [(MUScrollableStackView *)self->_contentStackView setScrollEnabled:1];
  id v6 = [(MUTransitLineItemViewController *)self view];
  [v6 addSubview:self->_contentStackView];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  [(MUTransitLineItemViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(MUTransitLineItemViewController *)self view];
  [v3 bounds];
  -[MUScrollableStackView setFrame:](self->_contentStackView, "setFrame:");

  [(MULoadingOverlayController *)self->_loadingOverlayController updateLayoutForBoundsChange];
}

- (double)heightForContentAboveTitle
{
  return 0.0;
}

- (void)setTransitLineItem:(id)a3
{
  id v5 = (GEOTransitLineItem *)a3;
  p_transitLineItem = &self->_transitLineItem;
  if (self->_transitLineItem != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_transitLineItem, a3);
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_transitLineItem, v5);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  [(MUTransitLineItemViewController *)&v4 viewDidLoad];
  v3 = [(MUTransitLineItemViewController *)self view];
  [v3 setAccessibilityIdentifier:@"TransitLineItemView"];

  [(MUTransitLineItemViewController *)self _updateSectionControllers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  [(MUTransitLineItemViewController *)&v4 viewWillAppear:a3];
  [(MUTransitLineItemViewController *)self _fetchNearestStation];
}

- (void)setTransitLineItem:(id)a3 loading:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(MUTransitLineItemViewController *)self transitLineItem];
  if (v6 == v8)
  {
    BOOL v7 = [(MUTransitLineItemViewController *)self isLoading];

    if (v7 == v4) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [(MUTransitLineItemViewController *)self setTransitLineItem:v8];
  [(MUTransitLineItemViewController *)self setLoading:v4];
  if (![(MUTransitLineItemViewController *)self isLoading]) {
    [(MUTransitLineItemViewController *)self _attachLoadingOverlayIfNeeded];
  }
  if ([(MUTransitLineItemViewController *)self isViewLoaded])
  {
    [(MUTransitLineItemViewController *)self _updateSectionControllers];
    [(MUTransitLineItemViewController *)self _fetchNearestStation];
    if ([(MUTransitLineItemViewController *)self isLoading]) {
      [(MUTransitLineItemViewController *)self _removeLoadingOverlayIfNeeded];
    }
  }
LABEL_9:
}

- (void)_updateSectionControllers
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_transitLineItem)
  {
    [(MKETAProvider *)self->_etaProvider cancel];
    id v5 = (MKETAProvider *)[objc_alloc(MEMORY[0x1E4F30E90]) initWithLineItem:self->_transitLineItem];
    etaProvider = self->_etaProvider;
    self->_etaProvider = v5;

    [(MKETAProvider *)self->_etaProvider setDelegate:self];
    BOOL v7 = [(MUTransitLineItemViewController *)self automobileOptions];
    [(MKETAProvider *)self->_etaProvider setAutomobileOptions:v7];

    id v8 = [(MUTransitLineItemViewController *)self walkingOptions];
    [(MKETAProvider *)self->_etaProvider setWalkingOptions:v8];

    v9 = [(MUTransitLineItemViewController *)self transitOptions];
    [(MKETAProvider *)self->_etaProvider setTransitOptions:v9];

    v10 = [(MUTransitLineItemViewController *)self cyclingOptions];
    [(MKETAProvider *)self->_etaProvider setCyclingOptions:v10];
  }
  v11 = [MUTransitLineItemHeaderViewModel alloc];
  v12 = [(MUTransitLineItemViewController *)self transitLineItem];
  v73 = [(MUTransitLineItemHeaderViewModel *)v11 initWithTransitLineItem:v12];

  objc_initWeak(&location, self);
  v13 = [MUPlaceHeaderView alloc];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke;
  v87[3] = &unk_1E5750898;
  v72 = &v88;
  objc_copyWeak(&v88, &location);
  v14 = [(MUPlaceHeaderView *)v13 initWithViewModel:v73 trailingConstraintProvider:v87];
  headerView = self->_headerView;
  self->_headerView = v14;

  [v4 addObject:self->_headerView];
  v16 = [MUHeaderButtonsSectionController alloc];
  v17 = self->_etaProvider;
  v18 = objc_alloc_init(MUHeaderButtonsViewConfiguration);
  v19 = [(MUHeaderButtonsSectionController *)v16 initWithETAProvider:v17 headerButtonsConfiguration:v18];
  headerButtonsSectionController = self->_headerButtonsSectionController;
  self->_headerButtonsSectionController = v19;

  [(MUHeaderButtonsSectionController *)self->_headerButtonsSectionController setPrimaryButtonType:0];
  [(MUHeaderButtonsSectionController *)self->_headerButtonsSectionController setDelegate:self];
  v21 = self->_headerButtonsSectionController;
  id v22 = v3;
  v23 = v21;
  if (v23) {
    [v22 addObject:v23];
  }

  if (![(MUTransitLineItemViewController *)self isLoading])
  {
    v24 = [(GEOTransitLineItem *)self->_transitLineItem mapRegion];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      v26 = (void *)MEMORY[0x1E4F31100];
      v27 = _MULocalizedStringFromThisBundle(@"View [Line Card]");
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke_2;
      v85[3] = &unk_1E574FC68;
      objc_copyWeak(&v86, &location);
      v28 = [v26 actionButtonControllerWithTitle:v27 subTitle:0 selectedBlock:v85 disabled:0 symbolName:@"map"];

      [(MUHeaderButtonsSectionController *)self->_headerButtonsSectionController setSecondaryButtonController:v28];
      objc_destroyWeak(&v86);
    }
  }
  v29 = [MUNearestStationSectionController alloc];
  v30 = [(MUTransitLineItemViewController *)self transitLineItem];
  v31 = [(MUNearestStationSectionController *)v29 initWithTransitLineItem:v30 etaProvider:self->_etaProvider];

  [(MUNearestStationSectionController *)v31 setNearestStationDelegate:self];
  objc_storeStrong((id *)&self->_nearestStationSectionController, v31);
  id v32 = v22;
  v75 = v31;
  if (v75) {
    [v32 addObject:v75];
  }

  v33 = [(MUTransitLineItemViewController *)self transitLineItem];
  int v34 = [v33 hasEncyclopedicInfo];

  if (v34)
  {
    v35 = [(MUTransitLineItemViewController *)self transitLineItem];
    v36 = [v35 encyclopedicInfo];

    v37 = +[MUPlaceDescriptionConfiguration configurationWithEncyclopedicInfo:v36];
    v38 = [MUPlaceDescriptionSectionController alloc];
    v39 = [(MUNearestStationProvider *)self->_nearbyStationProvider nearestStation];
    v40 = [(MUPlaceDescriptionSectionController *)v38 initWithMapItem:v39 configuration:v37];

    [(MUPlaceDescriptionSectionController *)v40 setActionDelegate:self];
    id v41 = v32;
    v42 = v40;
    if (v42) {
      [v41 addObject:v42];
    }
  }
  v43 = [MUTransitLineIncidentsSectionController alloc];
  v44 = [(MUTransitLineItemViewController *)self transitLineItem];
  v45 = [(MUTransitLineIncidentsSectionController *)v43 initWithTransitLineItem:v44];

  [(MUTransitLineIncidentsSectionController *)v45 setIncidentsDelegate:self];
  id v46 = v32;
  v74 = v45;
  if (v74) {
    [v46 addObject:v74];
  }

  v47 = [(MUTransitLineItemViewController *)self _footerSectionController];
  id v76 = v46;
  id v48 = v47;
  if (v48) {
    [v76 addObject:v48];
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v71 = 976;
  v49 = self->_sectionControllers;
  uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v81 objects:v91 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v82 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v54 = [v53 sectionViewController];
          BOOL v55 = v54 == 0;

          if (!v55)
          {
            v56 = [v53 sectionViewController];
            [v56 removeFromParentViewController];
          }
        }
      }
      uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v81 objects:v91 count:16];
    }
    while (v50);
  }

  v57 = (NSArray *)[v76 copy];
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v57;

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v59 = self->_sectionControllers;
  uint64_t v60 = [(NSArray *)v59 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v78 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        if (objc_msgSend(v63, "hasContent", v71, v72))
        {
          v64 = [v63 sectionView];
          BOOL v65 = v64 == 0;

          if (!v65)
          {
            v66 = [v63 sectionView];
            [v4 addObject:v66];
          }
        }
        if (objc_opt_respondsToSelector())
        {
          v67 = [v63 sectionViewController];
          BOOL v68 = v67 == 0;

          if (!v68)
          {
            v69 = [v63 sectionViewController];
            [(MUTransitLineItemViewController *)self addChildViewController:v69];

            v70 = [v63 sectionViewController];
            [v70 didMoveToParentViewController:self];
          }
        }
        [v63 setActive:1];
      }
      uint64_t v60 = [(NSArray *)v59 countByEnumeratingWithState:&v77 objects:v90 count:16];
    }
    while (v60);
  }

  [(MUScrollableStackView *)self->_contentStackView setArrangedSubviews:v4];
  objc_destroyWeak(v72);
  objc_destroyWeak(&location);
}

double __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained delegate];
    [v3 lineItemViewControllerHeaderTitleTrailingConstant:v2];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

void __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 lineItemViewControllerDidSelectViewOnMap:v3];

    id WeakRetained = v3;
  }
}

- (id)_footerSectionController
{
  id v3 = [MUTransitFooterActionsSectionController alloc];
  double v4 = [(MUTransitLineItemViewController *)self transitLineItem];
  double v5 = [(MUTransitFooterActionsSectionController *)v3 initWithTransitLineItem:v4 actionManager:self->_actionManager];

  return v5;
}

- (void)_fetchNearestStation
{
  id v3 = [(MUTransitLineItemViewController *)self transitLineItem];
  uint64_t v4 = [v3 muid];
  unint64_t v5 = [(MUNearestStationProvider *)self->_nearbyStationProvider lastRequestedNearestID];

  if (v4 != v5) {
    goto LABEL_7;
  }
  id v6 = [(MUNearestStationProvider *)self->_nearbyStationProvider nearestStation];

  headerButtonsSectionController = self->_headerButtonsSectionController;
  if (!v6)
  {
    [(MUHeaderButtonsSectionController *)headerButtonsSectionController setPrimaryButtonType:0];
    [(MKETAProvider *)self->_etaProvider cancel];
LABEL_7:
    v11 = [(MUTransitLineItemViewController *)self transitLineItem];
    v12 = MKMapItemIdentifierFromGEOTransitLine();

    objc_initWeak(&location, self);
    nearbyStationProvider = self->_nearbyStationProvider;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__MUTransitLineItemViewController__fetchNearestStation__block_invoke;
    v15[3] = &unk_1E574F3A8;
    objc_copyWeak(&v16, &location);
    [(MUNearestStationProvider *)nearbyStationProvider fetchStationForLineItemIdentifier:v12 completion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    return;
  }
  [(MUHeaderButtonsSectionController *)headerButtonsSectionController setPrimaryButtonType:1];
  etaProvider = self->_etaProvider;
  v9 = [(MUNearestStationProvider *)self->_nearbyStationProvider nearestStation];
  [(MKETAProvider *)etaProvider configureWithNearestStationMapItem:v9];

  nearestStationSectionController = self->_nearestStationSectionController;
  id v14 = [(MUNearestStationProvider *)self->_nearbyStationProvider nearestStation];
  [(MUNearestStationSectionController *)nearestStationSectionController updateWithMapItem:v14 isLoading:0];
}

void __55__MUTransitLineItemViewController__fetchNearestStation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((void *)WeakRetained + 127);
    id v4 = WeakRetained;
    id v3 = [*((id *)WeakRetained + 126) nearestStation];
    [v2 updateWithMapItem:v3 isLoading:0];

    id WeakRetained = v4;
  }
}

- (void)resetNearestStation
{
  [(MUNearestStationProvider *)self->_nearbyStationProvider resetNearestStation];
  [(MUHeaderButtonsSectionController *)self->_headerButtonsSectionController setPrimaryButtonType:0];
  [(MKETAProvider *)self->_etaProvider configureWithNearestStationMapItem:0];
  nearestStationSectionController = self->_nearestStationSectionController;
  [(MUNearestStationSectionController *)nearestStationSectionController updateWithMapItem:0 isLoading:0];
}

- (void)_attachLoadingOverlayIfNeeded
{
  if ([(MUTransitLineItemViewController *)self isLoading])
  {
    loadingOverlayController = self->_loadingOverlayController;
    if (!loadingOverlayController)
    {
      id v4 = [MULoadingOverlayController alloc];
      unint64_t v5 = [(MUTransitLineItemViewController *)self view];
      id v6 = [(MULoadingOverlayController *)v4 initWithParentView:v5 contentView:self->_contentStackView];
      BOOL v7 = self->_loadingOverlayController;
      self->_loadingOverlayController = v6;

      loadingOverlayController = self->_loadingOverlayController;
    }
    [(MULoadingOverlayController *)loadingOverlayController attachLoadingOverlay];
  }
}

- (void)_removeLoadingOverlayIfNeeded
{
}

- (void)lineItemManager:(id)a3 didSelectReportAProblemWithEnvironment:(id)a4
{
  [(MUTransitLineItemViewController *)self infoCardAnalyticsDidSelectAction:5013 eventValue:0 feedbackDelegateSelector:0];
  id v5 = [(MUTransitLineItemViewController *)self delegate];
  [v5 lineItemViewControllerDidSelectReportAProblem:self];
}

- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3
{
  id v4 = [(MUTransitLineItemViewController *)self transitLineItem];
  id v5 = [v4 encyclopedicInfo];
  id v11 = [v5 encyclopedicAttribution];

  id v6 = (void *)MEMORY[0x1E4F310F0];
  BOOL v7 = [(MUTransitLineItemViewController *)self transitLineItem];
  id v8 = [v7 encyclopedicInfo];
  v9 = [v6 attributionFromEncyclopedicInfo:v8];

  v10 = [v11 attributionURLs];
  [(MUTransitLineItemViewController *)self _openAttributionURLStrings:v10 usingAttribution:v9];
}

- (void)_openAttributionURLStrings:(id)a3 usingAttribution:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      id v18 = v7;
      id v19 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          id v14 = [v13 scheme];
          if ([v14 isEqualToString:@"http"])
          {

LABEL_13:
            v17 = [(MUTransitLineItemViewController *)self delegate];
            [v17 lineItemViewController:self openURL:v13];

            id v7 = v18;
            id v6 = v19;
            goto LABEL_14;
          }
          objc_super v15 = [v13 scheme];
          int v16 = [v15 isEqualToString:@"https"];

          if (v16) {
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v7 = v18;
        id v6 = v19;
        if (v10) {
          continue;
        }
        break;
      }
    }

    [MEMORY[0x1E4F30E40] launchAttributionURLs:v8 withAttribution:v7 completionHandler:0];
  }
LABEL_14:
}

+ (double)headerHeightInMinimalMode
{
  +[MUPlaceHeaderView minimalModeHeight];
  return result;
}

- (void)hideTitle:(BOOL)a3
{
}

- (id)createMenuActions
{
  return [(MUTransitLineItemActionManager *)self->_actionManager createRowActionsWithStyle:0];
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_contentStackView;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(MUScrollableStackView *)self->_contentStackView adjustedContentInset];
  double v8 = v5 - v7;
  [(MUScrollableStackView *)self->_contentStackView adjustedContentInset];
  contentStackView = self->_contentStackView;
  -[MUScrollableStackView setContentOffset:animated:](contentStackView, "setContentOffset:animated:", v3, v8, v6 - v9);
}

- (double)currentHeight
{
  [(MUScrollableStackView *)self->_contentStackView contentSize];
  return v2;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(MUTransitLineItemViewController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(MUTransitLineItemViewController *)self scrollViewDelegate];
    [v6 scrollViewDidScroll:v7];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  id v4 = [(MUTransitLineItemViewController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(MUTransitLineItemViewController *)self scrollViewDelegate];
    [v6 scrollViewWillBeginDragging:v7];
  }
}

- (void)setAutomobileOptions:(id)a3
{
  char v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    [(MKETAProvider *)self->_etaProvider setAutomobileOptions:self->_automobileOptions];
    char v5 = v6;
  }
}

- (void)setWalkingOptions:(id)a3
{
  char v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setWalkingOptions:self->_walkingOptions];
    char v5 = v6;
  }
}

- (void)setTransitOptions:(id)a3
{
  char v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    [(MKETAProvider *)self->_etaProvider setTransitOptions:self->_transitOptions];
    char v5 = v6;
  }
}

- (void)setCyclingOptions:(id)a3
{
  char v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setCyclingOptions:self->_cyclingOptions];
    char v5 = v6;
  }
}

- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v5 = v4;
  if (self->_headerView) {
    objc_msgSend(v4, "addObject:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = self->_sectionControllers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasContent", (void)v16))
        {
          v12 = [v11 sectionView];

          if (v12)
          {
            v13 = [v11 sectionView];
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  contentStackView = self->_contentStackView;
  objc_super v15 = (void *)[v5 copy];
  [(MUScrollableStackView *)contentStackView setArrangedSubviews:v15];
}

- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  if (a4 == 1)
  {
    id v9 = [(MUNearestStationProvider *)self->_nearbyStationProvider nearestStation];
    if (v9)
    {
      uint64_t v7 = [(MUTransitLineItemViewController *)self delegate];
      uint64_t v8 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
      [v7 lineItemViewController:self didSelectDirectionsToNearestStation:v9 withTransportTypePreference:v8];

      [(MUTransitLineItemViewController *)self infoCardAnalyticsDidSelectAction:6003 eventValue:0 feedbackDelegateSelector:0];
    }
  }
}

- (void)nearestStationSectionController:(id)a3 didTapStationItem:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitLineItemViewController *)self delegate];
  [v6 lineItemViewController:self didSelectNearestStation:v5];
}

- (void)nearestStationSectionController:(id)a3 didSelectStationAttributionURL:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitLineItemViewController *)self delegate];
  [v6 lineItemViewController:self openURL:v5];
}

- (void)incidentsSectionController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitLineItemViewController *)self delegate];
  [v6 lineItemViewController:self didSelectDetailsForIncidents:v5];
}

- (int)mapTypeForETAProvider:(id)a3
{
  return 4;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9
{
  LODWORD(v9) = a8;
  [(MUTransitLineItemViewController *)self infoCardAnalyticsDidSelectAction:*(void *)&a3 target:*(void *)&a4 eventValue:a5 actionURL:a6 photoID:a7 moduleMetadata:0 feedbackDelegateSelector:v9 actionRichProviderId:a9];
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  uint64_t v15 = *(void *)&a3;
  long long v16 = (void *)MEMORY[0x1E4F30F28];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v21 = [v16 sharedService];
  LODWORD(v20) = a8;
  [v21 captureTransitPlaceCardUserAction:v15 onTarget:201 eventValue:0 mapItem:0 timestamp:a4 resultIndex:a5 targetID:CFAbsoluteTimeGetCurrent() providerID:0 animationID:-1 transitCardCategory:v20 transitSystem:v19 transitDepartureSequence:v18 transitIncident:v17];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v18;
  if (v18)
  {
    v23[0] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v21 = [MEMORY[0x1E4F30F28] sharedService];
  LODWORD(v22) = 6;
  objc_msgSend(v21, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v14, v13, v15, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, v16, v17, v22, 0, 0, 0,
    v20,
    0,
    0);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  LODWORD(v8) = a7;
  [(MUTransitLineItemViewController *)self infoCardAnalyticsDidSelectAction:*(void *)&a3 target:*(void *)&a4 eventValue:a5 actionURL:0 photoID:0 moduleMetadata:a6 feedbackDelegateSelector:v8 actionRichProviderId:a8];
}

- (id)draggableContent
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (UIView)draggableHeaderView
{
  return (UIView *)self->_headerView;
}

- (UIView)viewForHeaderContainmentString
{
  return [(MUPlaceHeaderView *)self->_headerView viewForContainmentString];
}

- (void)updateHeaderTrailingConstant
{
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (GEOTransitLineItem)transitLineItem
{
  return self->_transitLineItem;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (MUTransitLineItemViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUTransitLineItemViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MUHeaderButtonsSectionController)headerButtonsSectionController
{
  return self->_headerButtonsSectionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerButtonsSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitLineItem, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_lastNearestRequestErrorMessage, 0);
  objc_storeStrong((id *)&self->_nearestStationSectionController, 0);
  objc_storeStrong((id *)&self->_nearbyStationProvider, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
}

@end