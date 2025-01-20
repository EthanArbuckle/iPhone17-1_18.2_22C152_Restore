@interface MURelatedPlacesSectionController
- (BOOL)_isCuratedHikesModule;
- (BOOL)hasContent;
- (BOOL)hasFetchedFollowUpRequest;
- (BOOL)isActive;
- (BOOL)isFollowUpRequestInProgress;
- (BOOL)isImpressionable;
- (BOOL)isVertical;
- (BOOL)needsToPerformRefinement;
- (GEORelatedPlaceList)effectiveRelatedPlaceList;
- (GEORelatedPlaceList)relatedPlaceListFromFollowUpRequest;
- (GEORelatedPlaceModuleConfiguration)moduleConfig;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MURelatedPlacesSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MURelatedPlacesSectionControllerDelegate)relatedPlacesDelegate;
- (UIView)sectionView;
- (id)_moduleTitle;
- (int)analyticsModuleType;
- (unint64_t)numInlineItems;
- (void)_buildInitialContent;
- (void)_cancelFollowUpRequestIfNeeded;
- (void)_cancelPlaceRefinementIfNeeded;
- (void)_displayTilesForViewModels:(id)a3;
- (void)_handleViewModel:(id)a3;
- (void)_notifyDelegateForSeeAll;
- (void)_notifyDelegateOfSelectedMapItem:(id)a3;
- (void)_populateAnalyticsModule:(id)a3;
- (void)_refineHikingTrailListWithCompletion:(id)a3;
- (void)_refinePlaceAndNotifyDelegate:(id)a3;
- (void)_refineRelatedPlaceListWithCompletion:(id)a3;
- (void)_seeAllTapped;
- (void)_setupSectionView;
- (void)_updateSection;
- (void)_updateWithListFromFollowUpRequest:(id)a3;
- (void)performInstrumentationForScrollLeft;
- (void)performInstrumentationForScrollRight;
- (void)performNearbyPlacesFollowUpRequest;
- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4;
- (void)placeTilesListView:(id)a3 didSelectViewModel:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setHasFetchedFollowUpRequest:(BOOL)a3;
- (void)setIsFollowUpRequestInProgress:(BOOL)a3;
- (void)setRelatedPlaceListFromFollowUpRequest:(id)a3;
- (void)setRelatedPlacesDelegate:(id)a3;
@end

@implementation MURelatedPlacesSectionController

- (MURelatedPlacesSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 relatedPlaceList];
  if (v8)
  {

LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)MURelatedPlacesSectionController;
    v10 = [(MUPlaceSectionController *)&v16 initWithMapItem:v6];
    if (v10)
    {
      v11 = MUGetPlaceCardLog();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MURelatedPlacesSectionControllerInit", "", buf, 2u);
      }

      objc_storeStrong((id *)&v10->_configuration, a4);
      [(MURelatedPlacesSectionController *)v10 _setupSectionView];
      [(MURelatedPlacesSectionController *)v10 _buildInitialContent];
      v12 = MUGetPlaceCardLog();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MURelatedPlacesSectionControllerInit", "", buf, 2u);
      }
    }
    self = v10;
    v13 = self;
    goto LABEL_11;
  }
  v9 = [v7 trailHead];

  if (v9) {
    goto LABEL_4;
  }
  v15 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_FAULT, "MURelatedPlacesSectionController: Tried to initialize with no related place list or trail head", buf, 2u);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (unint64_t)numInlineItems
{
  int64_t v3 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource];
  if (v3 == 1)
  {
    v4 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration trailHead];
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
LABEL_5:
    v5 = v4;
    unint64_t v6 = [v4 numberOfInlineItems];

    goto LABEL_7;
  }
  unint64_t v6 = 0;
LABEL_7:
  unint64_t result = GEOConfigGetUInteger();
  if (v6 < result) {
    return v6;
  }
  return result;
}

- (void)_setupSectionView
{
  if ([(MURelatedPlacesSectionController *)self isVertical])
  {
    id v8 = +[MUPlaceVerticalCardConfiguration separatorConfiguration];
    int64_t v3 = [[MUPlaceTilesListView alloc] initWithConfiguration:v8];
    listView = self->_listView;
    self->_listView = v3;

    [(MUPlaceTilesListView *)self->_listView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUPlaceTilesListView *)self->_listView setListFeedbackDelegate:self];
  }
  else
  {
    if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
    {
      id v8 = +[MUPlaceTilesViewConfiguration hikingTrailsConfiguration];
    }
    else
    {
      v5 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration moduleConfiguration];
      id v8 = +[MUPlaceTilesViewConfiguration configurationFromModuleConfiguration:v5];
    }
    unint64_t v6 = [[MUPlaceTilesView alloc] initWithConfiguration:v8];
    tilesView = self->_tilesView;
    self->_tilesView = v6;

    [(MUPlaceTilesView *)self->_tilesView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUPlaceTilesView *)self->_tilesView setDelegate:self];
    [(MUPlaceTilesView *)self->_tilesView setAnalyticsDelegate:self];
  }
}

- (void)_buildInitialContent
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(MURelatedPlacesSectionController *)self needsToPerformRefinement])
  {
    int64_t v3 = objc_opt_new();
    int64_t v4 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource];
    if (v4 == 1)
    {
      v17 = v3;
      unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration trailHead];
      id v8 = [v7 trails];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            v14 = [MUPlaceHikingTileViewModel alloc];
            v15 = [(MUPlaceSectionController *)self mapItem];
            objc_super v16 = -[MUPlaceHikingTileViewModel initWithGEOTrail:hikingItemType:](v14, "initWithGEOTrail:hikingItemType:", v13, objc_msgSend(v15, "_mapsui_associatedHikingItemType"));

            [v6 addObject:v16];
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }
    }
    else if (v4)
    {
      unint64_t v6 = v3;
    }
    else
    {
      v5 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
      unint64_t v6 = [v5 placeTemplates];
    }
    [(MURelatedPlacesSectionController *)self _displayTilesForViewModels:v6];
  }
}

- (void)_updateWithListFromFollowUpRequest:(id)a3
{
  [(MURelatedPlacesSectionController *)self setRelatedPlaceListFromFollowUpRequest:a3];
  sectionView = self->_sectionView;
  self->_sectionView = 0;

  [(MURelatedPlacesSectionController *)self _setupSectionView];
  [(MURelatedPlacesSectionController *)self _buildInitialContent];
  [(MURelatedPlacesSectionController *)self _updateSection];
  id v5 = [(MUPlaceSectionController *)self delegate];
  [v5 placeSectionControllerDidUpdateContent:self];
}

- (BOOL)isVertical
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1) {
    return [(MURelatedPlacesSectionController *)self numInlineItems] < 3;
  }
  int64_t v4 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration moduleConfiguration];

  if (v4)
  {
    id v5 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration moduleConfiguration];
    char v6 = [v5 isVertical];

    return v6;
  }
  id v8 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  uint64_t v9 = [v8 placeTemplates];
  BOOL v3 = (unint64_t)[v9 count] < 3;

  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(MURelatedPlacesSectionController *)self _updateSection];
  }
}

- (void)_updateSection
{
  BOOL v3 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  int64_t v4 = [v3 followUpRequestMetadata];
  int v5 = [v4 isSearchRequestForNearbyPlaces];

  if (v5)
  {
    if ([(MURelatedPlacesSectionController *)self isActive])
    {
      if ([(MURelatedPlacesSectionController *)self isFollowUpRequestInProgress]) {
        return;
      }
      if (![(MURelatedPlacesSectionController *)self hasFetchedFollowUpRequest])
      {
        [(MURelatedPlacesSectionController *)self performNearbyPlacesFollowUpRequest];
        return;
      }
    }
    else
    {
      [(MURelatedPlacesSectionController *)self _cancelFollowUpRequestIfNeeded];
    }
  }
  if ([(MURelatedPlacesSectionController *)self needsToPerformRefinement])
  {
    BOOL v6 = [(MURelatedPlacesSectionController *)self isActive];
    [(MURelatedPlacesSectionController *)self _cancelPlaceRefinementIfNeeded];
    if (v6)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__MURelatedPlacesSectionController__updateSection__block_invoke;
      v7[3] = &unk_1E574F0E8;
      objc_copyWeak(&v8, &location);
      [(MURelatedPlacesSectionController *)self _refineRelatedPlaceListWithCompletion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __50__MURelatedPlacesSectionController__updateSection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    uint64_t v7 = [v10 copy];
    id v8 = (void *)v6[11];
    v6[11] = v7;

    [v6 _displayTilesForViewModels:v6[11]];
    uint64_t v9 = [v6 delegate];
    [v9 placeSectionControllerDidUpdateContent:v6];
  }
}

- (void)_displayTilesForViewModels:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MURelatedPlacesSectionController *)self numInlineItems];
  unint64_t v6 = [v4 count];
  if (v6 >= v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  objc_msgSend(v4, "subarrayWithRange:", 0, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([(MURelatedPlacesSectionController *)self isVertical])
  {
    [(MUPlaceTilesListView *)self->_listView setViewModels:v8];
  }
  else
  {
    [(MUPlaceTilesView *)self->_tilesView setViewModels:v8];
    [(MUPlaceTilesView *)self->_tilesView displayPlaceTiles];
  }
}

- (void)performNearbyPlacesFollowUpRequest
{
  [(MURelatedPlacesSectionController *)self setIsFollowUpRequestInProgress:1];
  BOOL v3 = [(MUPlaceSectionController *)self mapItem];
  id v4 = [v3 _geoMapItem];
  unint64_t v5 = [v4 _mapsCategoryId];

  unint64_t v6 = [MEMORY[0x1E4F30F28] sharedService];
  unint64_t v7 = [v6 defaultTraits];

  id v8 = objc_alloc_init(MEMORY[0x1E4F649F8]);
  [v8 setSearchImplicitType:2];
  [v7 setSearchImplicitFilterInfo:v8];
  [v7 setSearchOriginationType:3];
  objc_initWeak(&location, self);
  uint64_t v9 = [MEMORY[0x1E4F30F28] sharedService];
  id v10 = [(MUPlaceSectionController *)self mapItem];
  uint64_t v11 = [v10 _identifier];
  uint64_t v12 = [v9 searchAroundPOITicketWithIdentifier:v11 categoryID:v5 maxResults:100 traits:v7];
  nearbyPlacesTicket = self->_nearbyPlacesTicket;
  self->_nearbyPlacesTicket = v12;

  v14 = self->_nearbyPlacesTicket;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MURelatedPlacesSectionController_performNearbyPlacesFollowUpRequest__block_invoke;
  v15[3] = &unk_1E574F0E8;
  objc_copyWeak(&v16, &location);
  [(MKMapServiceTicket *)v14 submitWithHandler:v15 networkActivity:0];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __70__MURelatedPlacesSectionController_performNearbyPlacesFollowUpRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsFollowUpRequestInProgress:0];
    [v8 setHasFetchedFollowUpRequest:v6 == 0];
    if (v6)
    {
      uint64_t v9 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v8 mapItem];
        int v22 = 134218242;
        uint64_t v23 = [v10 _muid];
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v6;
        _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_ERROR, "MURelatedPlacesSectionController: Error Fetching nearby places via follow-up request: muid: %llu, %@", (uint8_t *)&v22, 0x16u);
      }
    }
    uint64_t v11 = [v5 firstObject];
    uint64_t v12 = [v11 _relatedPlaceLists];
    uint64_t v13 = [v12 firstObject];

    v14 = MUGetPlaceCardLog();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v16 = [v8 mapItem];
        uint64_t v17 = [v16 _muid];
        long long v18 = [v13 placeTemplates];
        uint64_t v19 = [v18 count];
        int v22 = 134218240;
        uint64_t v23 = v17;
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_INFO, "MURelatedPlacesSectionController: Follow-Up request for muid: %llu succeeded with %lu template items", (uint8_t *)&v22, 0x16u);
      }
      [v8 _updateWithListFromFollowUpRequest:v13];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v8 mapItem];
        uint64_t v21 = [v20 _muid];
        int v22 = 134217984;
        uint64_t v23 = v21;
        _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_ERROR, "MURelatedPlacesSectionController: Follow-up request for muid: %llu succeeded but did not return relatedPlaceList", (uint8_t *)&v22, 0xCu);
      }
    }
  }
}

- (BOOL)hasContent
{
  int64_t v3 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource];
  if (v3 == 1)
  {
    id v5 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration trailHead];
    id v6 = [v5 trails];
LABEL_8:
    unint64_t v7 = v6;
    BOOL v4 = [v6 count] != 0;

    return v4;
  }
  if (v3) {
    return 0;
  }
  if (![(MURelatedPlacesSectionController *)self needsToPerformRefinement])
  {
    id v5 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
    id v6 = [v5 placeTemplates];
    goto LABEL_8;
  }
  return [(NSArray *)self->_mapItemList count] != 0;
}

- (UIView)sectionView
{
  sectionView = self->_sectionView;
  if (!sectionView)
  {
    if ([(MURelatedPlacesSectionController *)self isVertical])
    {
      BOOL v4 = [[MUPlatterView alloc] initWithContentView:self->_listView];
      uint64_t v5 = 1;
    }
    else
    {
      BOOL v4 = self->_tilesView;
      uint64_t v5 = 0;
    }
    id v6 = [MUPlaceSectionView alloc];
    unint64_t v7 = [(MURelatedPlacesSectionController *)self sectionHeaderViewModel];
    id v8 = [(MUPlaceSectionView *)v6 initWithStyle:v5 sectionHeaderViewModel:v7];

    [(MUPlaceSectionView *)v8 attachViewToContentView:v4];
    uint64_t v9 = self->_sectionView;
    self->_sectionView = v8;
    id v10 = v8;

    [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
    sectionView = self->_sectionView;
  }
  return (UIView *)sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (sectionHeaderViewModel) {
    goto LABEL_24;
  }
  int64_t v4 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource];
  if (v4 == 1)
  {
    id v8 = [(MUPlaceSectionController *)self mapItem];
    int v9 = objc_msgSend(v8, "_mapsui_associatedHikingItemType");

    switch(v9)
    {
      case 0:
        uint64_t v11 = 0;
        goto LABEL_25;
      case 1:
        id v10 = @"Trails [Place card]";
        break;
      case 2:
        id v10 = @"Trailheads [Place card]";
        break;
      default:
        goto LABEL_10;
    }
    _MULocalizedStringFromThisBundle(v10);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v4)
  {
LABEL_10:
    id v6 = &stru_1EE3BF360;
    goto LABEL_14;
  }
  uint64_t v5 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration moduleConfiguration];
  id v6 = [v5 sectionTitle];

  if (![(__CFString *)v6 length])
  {
    uint64_t v7 = [(MURelatedPlacesSectionController *)self _moduleTitle];

    id v6 = (__CFString *)v7;
  }
LABEL_14:
  uint64_t v12 = [[MUPlaceSectionHeaderViewModel alloc] initWithTitleString:v6];
  uint64_t v13 = self->_sectionHeaderViewModel;
  self->_sectionHeaderViewModel = v12;

  if (![(MURelatedPlaceSectionControllerConfiguration *)self->_configuration suppressSeeAllButton])
  {
    int64_t v14 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource];
    if (v14 == 1)
    {
      v15 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration trailHead];
      id v16 = [v15 trails];
    }
    else
    {
      if (v14)
      {
        unint64_t v18 = 0;
LABEL_21:
        if (v18 > GEOConfigGetUInteger()) {
          [(MUPlaceSectionHeaderViewModel *)self->_sectionHeaderViewModel setTarget:self selector:sel__seeAllTapped];
        }
        goto LABEL_23;
      }
      v15 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
      id v16 = [v15 mapIdentifiers];
    }
    uint64_t v17 = v16;
    unint64_t v18 = [v16 count];

    goto LABEL_21;
  }
LABEL_23:

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
LABEL_24:
  uint64_t v11 = sectionHeaderViewModel;
LABEL_25:
  return v11;
}

- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4
{
}

- (void)placeTilesListView:(id)a3 didSelectViewModel:(id)a4
{
}

- (void)_handleViewModel:(id)a3
{
  id v4 = a3;
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration suppressItemSelection])
  {
    uint64_t v5 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "MURelatedPlacesSectionController: Will not refine and punch out", v8, 2u);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [v4 mapItemIdentifier];
        [(MURelatedPlacesSectionController *)self _refinePlaceAndNotifyDelegate:v6];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        id v6 = [v4 geoTrail];
        uint64_t v7 = [v6 trailIdentifier];
        [(MURelatedPlacesSectionController *)self _refinePlaceAndNotifyDelegate:v7];
      }
      goto LABEL_12;
    }
    [(MURelatedPlacesSectionController *)self _notifyDelegateOfSelectedMapItem:v4];
  }
LABEL_12:
}

- (void)_refinePlaceAndNotifyDelegate:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F30F10]) initWithGEOMapItemIdentifier:v4];
  id v6 = [MEMORY[0x1E4F30F28] sharedService];
  v12[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v8 = [v6 ticketForIdentifiers:v7 traits:0];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MURelatedPlacesSectionController__refinePlaceAndNotifyDelegate___block_invoke;
  v9[3] = &unk_1E574F0E8;
  objc_copyWeak(&v10, &location);
  [v8 submitWithHandler:v9 networkActivity:0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __66__MURelatedPlacesSectionController__refinePlaceAndNotifyDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    uint64_t v7 = [v8 firstObject];
    if (v7) {
      [v6 _notifyDelegateOfSelectedMapItem:v7];
    }
  }
}

- (void)_notifyDelegateOfSelectedMapItem:(id)a3
{
  id v11 = a3;
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v11, "_muid"));
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    uint64_t v5 = [(MUPlaceSectionController *)self mapItem];
    int v6 = objc_msgSend(v5, "_mapsui_associatedHikingItemType");

    if (v6 == 2) {
      unsigned int v7 = 412;
    }
    else {
      unsigned int v7 = 6079;
    }
    if (v6 == 1) {
      uint64_t v8 = 365;
    }
    else {
      uint64_t v8 = v7;
    }
  }
  else if ([v11 _hasHikeInfo])
  {
    if ([v11 _hasHikeInfo])
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v11, "_muid"));

      uint64_t v8 = 467;
      id v4 = (void *)v9;
    }
    else
    {
      uint64_t v8 = 467;
    }
  }
  else
  {
    uint64_t v8 = 6079;
  }
  [(MUPlaceSectionController *)self captureInfoCardAction:v8 eventValue:v4 feedbackType:0 actionRichProviderId:0];
  id v10 = [(MURelatedPlacesSectionController *)self relatedPlacesDelegate];
  [v10 relatedPlaceSectionController:self itemSelected:v11];
}

- (void)_refineRelatedPlaceListWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F30F28] sharedService];
  int v6 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  unsigned int v7 = [v5 ticketForRelatedPlaceList:v6 traits:0];
  ticket = self->_ticket;
  self->_ticket = v7;

  uint64_t v9 = self->_ticket;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__MURelatedPlacesSectionController__refineRelatedPlaceListWithCompletion___block_invoke;
  v11[3] = &unk_1E574EDC0;
  id v12 = v4;
  id v10 = v4;
  [(MKMapServiceTicket *)v9 submitWithHandler:v11 networkActivity:0];
}

uint64_t __74__MURelatedPlacesSectionController__refineRelatedPlaceListWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_refineHikingTrailListWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration trailHead];
  int v6 = [v5 trails];
  unsigned int v7 = MUMap(v6, &__block_literal_global_19);

  uint64_t v8 = [MEMORY[0x1E4F30F28] sharedService];
  uint64_t v9 = [v8 ticketForIdentifiers:v7 traits:0];
  ticket = self->_ticket;
  self->_ticket = v9;

  id v11 = self->_ticket;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke_2;
  v13[3] = &unk_1E574EDC0;
  id v14 = v4;
  id v12 = v4;
  [(MKMapServiceTicket *)v11 submitWithHandler:v13 networkActivity:0];
}

id __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [v2 trailIdentifier];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F30F10]);
    uint64_t v5 = [v2 trailIdentifier];
    int64_t v3 = (void *)[v4 initWithGEOMapItemIdentifier:v5];
  }
  return v3;
}

uint64_t __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cancelPlaceRefinementIfNeeded
{
  [(MKMapServiceTicket *)self->_ticket cancel];
  sectionView = self->_sectionView;
  [(MUPlaceSectionView *)sectionView endAnimatingActivityIndicatorWithError:0];
}

- (void)_cancelFollowUpRequestIfNeeded
{
  [(MKMapServiceTicket *)self->_nearbyPlacesTicket cancel];
  [(MURelatedPlacesSectionController *)self setIsFollowUpRequestInProgress:0];
  sectionView = self->_sectionView;
  [(MUPlaceSectionView *)sectionView endAnimatingActivityIndicatorWithError:0];
}

- (GEORelatedPlaceList)effectiveRelatedPlaceList
{
  int64_t v3 = [(MURelatedPlacesSectionController *)self relatedPlaceListFromFollowUpRequest];

  if (v3) {
    [(MURelatedPlacesSectionController *)self relatedPlaceListFromFollowUpRequest];
  }
  else {
  id v4 = [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration relatedPlaceList];
  }
  return (GEORelatedPlaceList *)v4;
}

- (GEORelatedPlaceModuleConfiguration)moduleConfig
{
  return [(MURelatedPlaceSectionControllerConfiguration *)self->_configuration moduleConfiguration];
}

- (BOOL)needsToPerformRefinement
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
    int v3 = [v4 hasInitialData] ^ 1;
  }
  return v3;
}

- (void)_seeAllTapped
{
  if ([(NSArray *)self->_mapItemList count])
  {
    [(MURelatedPlacesSectionController *)self _notifyDelegateForSeeAll];
    return;
  }
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    [(MUPlaceSectionView *)self->_sectionView beginAnimatingActivityIndicator];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke;
    v8[3] = &unk_1E574F0E8;
    int v3 = &v9;
    objc_copyWeak(&v9, &location);
    [(MURelatedPlacesSectionController *)self _refineHikingTrailListWithCompletion:v8];
    goto LABEL_7;
  }
  id v5 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  if ([v5 hasInitialData])
  {
    mapItemList = self->_mapItemList;

    if (mapItemList) {
      return;
    }
    [(MUPlaceSectionView *)self->_sectionView beginAnimatingActivityIndicator];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke_2;
    v6[3] = &unk_1E574F0E8;
    int v3 = &v7;
    objc_copyWeak(&v7, &location);
    [(MURelatedPlacesSectionController *)self _refineRelatedPlaceListWithCompletion:v6];
LABEL_7:
    objc_destroyWeak(v3);
    objc_destroyWeak(&location);
    return;
  }
}

void __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[12] endAnimatingActivityIndicatorWithError:v6];
    if (!v6)
    {
      objc_storeStrong(v8 + 11, a2);
      if ([v8[11] count]) {
        [v8 _notifyDelegateForSeeAll];
      }
    }
  }
}

void __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[12] endAnimatingActivityIndicatorWithError:v6];
    if (!v6)
    {
      objc_storeStrong(v8 + 11, a2);
      if ([v8[11] count]) {
        [v8 _notifyDelegateForSeeAll];
      }
    }
  }
}

- (void)_notifyDelegateForSeeAll
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    int v3 = [(MUPlaceSectionController *)self mapItem];
    int v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2) {
      unsigned int v5 = 428;
    }
    else {
      unsigned int v5 = 9040;
    }
    if (v4 == 1) {
      uint64_t v6 = 364;
    }
    else {
      uint64_t v6 = v5;
    }
  }
  else if ([(MURelatedPlacesSectionController *)self _isCuratedHikesModule])
  {
    uint64_t v6 = 464;
  }
  else
  {
    uint64_t v6 = 9040;
  }
  [(MUPlaceSectionController *)self captureInfoCardAction:v6 eventValue:0 feedbackType:0 actionRichProviderId:0];
  id v10 = [(MURelatedPlacesSectionController *)self relatedPlacesDelegate];
  id v7 = [(MUPlaceSectionHeaderViewModel *)self->_sectionHeaderViewModel titleString];
  mapItemList = self->_mapItemList;
  id v9 = [(MUPlaceSectionController *)self mapItem];
  [v10 relatedPlaceSectionController:self showSeeAllWithTitle:v7 relatedMapItems:mapItemList originalMapItem:v9];
}

- (void)_populateAnalyticsModule:(id)a3
{
  id v10 = a3;
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    int v4 = [(MUPlaceSectionController *)self mapItem];
    int v5 = objc_msgSend(v4, "_mapsui_associatedHikingItemType");

    if (v5 == 1)
    {
      id v7 = @"Trails";
    }
    else
    {
      uint64_t v6 = v10;
      if (v5 != 2) {
        goto LABEL_9;
      }
      id v7 = @"Trailheads";
    }
    [v10 setMetadata:v7];
  }
  else
  {
    uint64_t v8 = [(MURelatedPlacesSectionController *)self sectionHeaderViewModel];
    id v9 = [v8 titleString];
    [v10 setMetadata:v9];
  }
  uint64_t v6 = v10;
LABEL_9:
}

- (id)_moduleTitle
{
  id v2 = self;
  int v3 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  int v4 = [v3 placeTemplates];
  int v5 = (void *)[v4 count];

  uint64_t v6 = [(MURelatedPlacesSectionController *)v2 effectiveRelatedPlaceList];
  LODWORD(v2) = [v6 type];

  switch((int)v2)
  {
    case 0:
    case 2:
    case 4:
      if ((unint64_t)v5 <= 1)
      {
        id v7 = @"At this Address [Related Places]";
        goto LABEL_12;
      }
      uint64_t v8 = @"[Related Places] Num Places At This Address";
      goto LABEL_8;
    case 1:
      if ((unint64_t)v5 < 2) {
        id v7 = @"[Related Places] Similar place Title";
      }
      else {
        id v7 = @"[Related Places] Similar places Title";
      }
LABEL_12:
      int v5 = _MULocalizedStringFromThisBundle(v7);
      break;
    case 3:
      id v9 = [MEMORY[0x1E4F64500] sharedConfiguration];
      id v10 = [v9 countryCode];
      int v11 = [v10 isEqualToString:@"CN"];

      if (v11) {
        uint64_t v8 = @"[Related Places] Popular Places";
      }
      else {
        uint64_t v8 = @"[Related Places] Places";
      }
LABEL_8:
      id v12 = _MULocalizedStringFromThisBundle(v8);
      int v5 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, @"%lu", 0, v5);

      break;
    default:
      break;
  }
  return v5;
}

- (int)analyticsModuleType
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1) {
    return 43;
  }
  int v4 = [(MURelatedPlacesSectionController *)self effectiveRelatedPlaceList];
  int v5 = [v4 hasInitialData];

  if (v5) {
    return 38;
  }
  else {
    return 26;
  }
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)performInstrumentationForScrollLeft
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    int v3 = [(MUPlaceSectionController *)self mapItem];
    int v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2)
    {
      uint64_t v5 = 422;
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      uint64_t v5 = 363;
    }
    [(MUPlaceSectionController *)self captureInfoCardAction:v5 eventValue:0 feedbackType:0];
  }
}

- (void)performInstrumentationForScrollRight
{
  if ([(MURelatedPlaceSectionControllerConfiguration *)self->_configuration dataSource] == 1)
  {
    int v3 = [(MUPlaceSectionController *)self mapItem];
    int v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2)
    {
      uint64_t v5 = 410;
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      uint64_t v5 = 367;
    }
    [(MUPlaceSectionController *)self captureInfoCardAction:v5 eventValue:0 feedbackType:0];
  }
}

- (BOOL)_isCuratedHikesModule
{
  id v2 = [(NSArray *)self->_mapItemList _geo_filtered:&__block_literal_global_142];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

uint64_t __57__MURelatedPlacesSectionController__isCuratedHikesModule__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _hasHikeInfo] ^ 1;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MURelatedPlacesSectionControllerDelegate)relatedPlacesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relatedPlacesDelegate);
  return (MURelatedPlacesSectionControllerDelegate *)WeakRetained;
}

- (void)setRelatedPlacesDelegate:(id)a3
{
}

- (GEORelatedPlaceList)relatedPlaceListFromFollowUpRequest
{
  return self->_relatedPlaceListFromFollowUpRequest;
}

- (void)setRelatedPlaceListFromFollowUpRequest:(id)a3
{
}

- (BOOL)isFollowUpRequestInProgress
{
  return self->_isFollowUpRequestInProgress;
}

- (void)setIsFollowUpRequestInProgress:(BOOL)a3
{
  self->_isFollowUpRequestInProgress = a3;
}

- (BOOL)hasFetchedFollowUpRequest
{
  return self->_hasFetchedFollowUpRequest;
}

- (void)setHasFetchedFollowUpRequest:(BOOL)a3
{
  self->_hasFetchedFollowUpRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlaceListFromFollowUpRequest, 0);
  objc_destroyWeak((id *)&self->_relatedPlacesDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_tilesView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_mapItemList, 0);
  objc_storeStrong((id *)&self->_nearbyPlacesTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end