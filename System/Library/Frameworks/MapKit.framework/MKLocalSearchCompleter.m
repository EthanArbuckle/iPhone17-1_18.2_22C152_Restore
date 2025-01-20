@interface MKLocalSearchCompleter
- (BOOL)_autocompleteTopSectionIsQuerySuggestions;
- (BOOL)_enableStructuredRAPAffordance;
- (BOOL)_shouldDisplayNoResults;
- (BOOL)_shouldEnableGrayscaleHighlighting;
- (BOOL)_shouldEnableRAPForNoResults;
- (BOOL)_shouldPreloadTransitInfo;
- (BOOL)_shouldUseDistanceFeatureServerResults;
- (BOOL)_showAutocompleteClientSource;
- (BOOL)isSearching;
- (BOOL)resultsAreCurrent;
- (BOOL)statefulQueriesEnabled;
- (CLLocation)deviceLocation;
- (GEOAutocompleteSessionData)_recentAutocompleteSessionData;
- (GEOClientRankingModel)_clientRankingModel;
- (GEOMapServiceTraits)traits;
- (GEOPDPlaceSummaryLayoutMetadata)_placeSummaryLayoutMetadata;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (GEOSearchCategory)categoryFilter;
- (GEOSortPriorityMapping)_sortPriorityMapping;
- (MKAddressFilter)addressFilter;
- (MKAutocompleteAnalyticsProvider)analyticsProvider;
- (MKCoordinateRegion)region;
- (MKLocalSearchCompleter)init;
- (MKLocalSearchCompleterResultType)resultTypes;
- (MKLocalSearchCompletion)_tappedQuerySuggestionCompletion;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (MKSearchCompletionFilterType)filterType;
- (NSArray)_sections;
- (NSArray)results;
- (NSString)identifier;
- (NSString)queryFragment;
- (double)timeSinceLastInBoundingRegion;
- (double)timeToNextRequest;
- (id)_completionTicketForFilterTypeWithTraits:(id)a3;
- (id)_completionTicketForPrivateFilterType:(int64_t)a3 traits:(id)a4;
- (id)context;
- (id)delegate;
- (int)source;
- (int64_t)_highlightType;
- (int64_t)_privateFilterType;
- (int64_t)entriesType;
- (int64_t)listType;
- (int64_t)regionPriority;
- (unint64_t)mapType;
- (void)_cancelTimer;
- (void)_fireRequest;
- (void)_handleCompletion:(id)a3 shouldDisplayNoResults:(BOOL)a4 shouldEnableRAPForNoResults:(BOOL)a5 forTicket:(id)a6;
- (void)_handleError:(id)a3 forTicket:(id)a4;
- (void)_markDirty;
- (void)_markDirtyAndScheduleRequestWithTimeToNextRequest:(double)a3;
- (void)_notifyDelegatesWithResults:(id)a3 sections:(id)a4 shouldDisplayNoResults:(BOOL)a5 shouldEnableRAPForNoResults:(BOOL)a6 ticket:(id)a7;
- (void)_schedulePendingRequest;
- (void)_scheduleRequestWithTimeToNextRequest:(double)a3;
- (void)_setPrivateFilterType:(int64_t)a3;
- (void)_setShouldPreloadTransitInfo:(BOOL)a3;
- (void)_setTappedQuerySuggestionCompletion:(id)a3;
- (void)_updateFilters;
- (void)cancel;
- (void)clearQueryState;
- (void)dealloc;
- (void)retry;
- (void)setAddressFilter:(id)a3;
- (void)setAnalyticsProvider:(id)a3;
- (void)setCategoryFilter:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDeviceLocation:(id)a3;
- (void)setEntriesType:(int64_t)a3;
- (void)setFilterType:(MKSearchCompletionFilterType)filterType;
- (void)setIdentifier:(id)a3;
- (void)setListType:(int64_t)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter;
- (void)setQueryFragment:(NSString *)queryFragment;
- (void)setRegion:(MKCoordinateRegion)region;
- (void)setRegionPriority:(int64_t)a3;
- (void)setResultTypes:(MKLocalSearchCompleterResultType)resultTypes;
- (void)setRetainedSearchMetadata:(id)a3;
- (void)setSource:(int)a3;
- (void)setStatefulQueriesEnabled:(BOOL)a3;
- (void)setTimeSinceLastInBoundingRegion:(double)a3;
- (void)setTraits:(id)a3;
@end

@implementation MKLocalSearchCompleter

- (MKLocalSearchCompleter)init
{
  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearchCompleter;
  v2 = [(MKLocalSearchCompleter *)&v14 init];
  if (v2)
  {
    v2->_region.center = CLLocationCoordinate2DMake(0.0, 0.0);
    v2->_region.span = ($2AEA816EAF9616B0E64737FB4BB06332)xmmword_18BD1B7A0;
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    uint64_t v5 = [v4 copy];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    v2->_source = 0;
    v2->_listType = 0;
    v2->_timeSinceLastInBoundingRegion = 0.0;
    uint64_t UInteger = 1;
    v2->_resultsAreCurrent = 1;
    queryFragment = v2->_queryFragment;
    v2->_queryFragment = (NSString *)&stru_1ED919588;

    if (GEOConfigGetUInteger()) {
      uint64_t UInteger = GEOConfigGetUInteger();
    }
    v2->_maxNumberOfConcurrentRequests = UInteger;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:UInteger];
    inFlightTickets = v2->_inFlightTickets;
    v2->_inFlightTickets = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2->_maxNumberOfConcurrentRequests];
    pendingTickets = v2->_pendingTickets;
    v2->_pendingTickets = (NSMutableArray *)v11;
  }
  return v2;
}

- (void)dealloc
{
  [(MKLocalSearchCompleter *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKLocalSearchCompleter;
  [(MKLocalSearchCompleter *)&v3 dealloc];
}

- (void)_handleCompletion:(id)a3 shouldDisplayNoResults:(BOOL)a4 shouldEnableRAPForNoResults:(BOOL)a5 forTicket:(id)a6
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v64 = a6;
  uint64_t v9 = [v8 sessionData];
  autocompleteSessionData = self->_autocompleteSessionData;
  self->_autocompleteSessionData = v9;

  group = dispatch_group_create();
  v78 = [MEMORY[0x1E4F1CA48] array];
  v76 = [MEMORY[0x1E4F1CA48] array];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v67 = v8;
  obuint64_t j = [v8 groups];
  uint64_t v70 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
  if (v70)
  {
    uint64_t v79 = 0;
    uint64_t v11 = 0;
    uint64_t v69 = *(void *)v99;
    do
    {
      uint64_t v12 = 0;
      do
      {
        v73 = v11;
        v13 = self;
        if (*(void *)v99 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = v12;
        objc_super v14 = *(void **)(*((void *)&v98 + 1) + 8 * v12);
        v15 = [v14 localizedSectionHeader];
        v16 = (void *)MEMORY[0x1E4F1CA48];
        v17 = [v14 items];
        v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        v71 = v14;
        id v75 = [v14 items];
        uint64_t v19 = [v75 countByEnumeratingWithState:&v94 objects:v103 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = 0;
          uint64_t v22 = *(void *)v95;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v95 != v22) {
                objc_enumerationMutation(v75);
              }
              v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
              v25 = [[MKLocalSearchCompletion alloc] initWithGeoCompletionItem:v24 serverSectionIndex:v79 serverItemIndexInSection:v21 + i];
              if ([(MKLocalSearchCompleter *)v13 _shouldPreloadTransitInfo])
              {
                v26 = [(MKLocalSearchCompletion *)v25 mapItem];
                int v27 = [v26 _hasTransitLabels];

                if (v27)
                {
                  dispatch_group_enter(group);
                  v28 = [(MKLocalSearchCompletion *)v25 mapItem];
                  v92[0] = MEMORY[0x1E4F143A8];
                  v92[1] = 3221225472;
                  v92[2] = __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke;
                  v92[3] = &unk_1E54B8188;
                  v93 = group;
                  [v28 preloadTransitInfoWithCompletion:v92];
                }
              }
              if ([v15 length]) {
                [(MKLocalSearchCompletion *)v25 setLocalizedSectionHeader:v15];
              }
              v13 = self;
              v29 = [(MKLocalSearchCompleter *)self identifier];
              [(MKLocalSearchCompletion *)v25 setSourceID:v29];

              [v78 addObject:v25];
              [v18 addObject:v25];
              v30 = [v24 directionIntent];

              if (v30) {
                [v76 addObject:v25];
              }
            }
            uint64_t v20 = [v75 countByEnumeratingWithState:&v94 objects:v103 count:16];
            v21 += i;
          }
          while (v20);
        }

        uint64_t v11 = v73;
        if (!v73)
        {
          v31 = (void *)MEMORY[0x1E4F1CA48];
          v32 = [v67 groups];
          uint64_t v11 = objc_msgSend(v31, "arrayWithCapacity:", objc_msgSend(v32, "count"));
        }
        v33 = [MKLocalSearchSection alloc];
        uint64_t v34 = [v71 shouldInterleaveClientResults];
        uint64_t v35 = [v71 enforceServerResultsOrder];
        uint64_t v36 = [v71 enableMapsSuggestServerReranking];
        uint64_t v37 = [v71 isSectionForClientOnlyResults];
        v38 = [v71 includedClientResultTypes];
        v39 = [v71 excludedClientResultTypes];
        v40 = [(MKLocalSearchSection *)v33 initWithResults:v18 title:v15 shouldInterleaveClientResults:v34 enforceServerResultsOrder:v35 enableMapsSuggestServerReranking:v36 isSectionForClientOnlyResults:v37 includedClientResultTypes:v38 excludedClientResultTypes:v39];
        [v11 addObject:v40];

        ++v79;
        uint64_t v12 = v72 + 1;
      }
      while (v72 + 1 != v70);
      uint64_t v70 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
    }
    while (v70);
  }
  else
  {
    uint64_t v11 = 0;
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v41 = v76;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v89 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v88 + 1) + 8 * j);
        v47 = [v46 directionIntent];
        v48 = [v47 origin];
        unint64_t v49 = [v48 resultIndex];

        v50 = [v46 directionIntent];
        v51 = [v50 origin];
        if ([v51 hasResultIndex])
        {
          unint64_t v52 = [v78 count];

          if (v49 >= v52) {
            goto LABEL_36;
          }
          v50 = [v78 objectAtIndex:v49];
          [v46 setDirectionIntentOrigin:v50];
        }
        else
        {
        }
LABEL_36:
        v53 = [v46 directionIntent];
        v54 = [v53 destination];
        unint64_t v55 = [v54 resultIndex];

        v56 = [v46 directionIntent];
        v57 = [v56 destination];
        if ([v57 hasResultIndex])
        {
          unint64_t v58 = [v78 count];

          if (v55 >= v58) {
            continue;
          }
          v56 = [v78 objectAtIndex:v55];
          [v46 setDirectionIntentDestination:v56];
        }
        else
        {
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v88 objects:v102 count:16];
    }
    while (v43);
  }

  id v59 = [(NSMutableArray *)self->_pendingTickets lastObject];

  if (v59 == v64)
  {
    v60 = [(MKLocalSearchCompleter *)self queryFragment];
    self->_dirty = [v64 matchesFragment:v60] ^ 1;
  }
  else
  {
    self->_dirty = 0;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke_2;
  block[3] = &unk_1E54BC620;
  objc_copyWeak(&v84, &location);
  id v81 = v78;
  id v82 = v11;
  BOOL v85 = a4;
  BOOL v86 = a5;
  id v83 = v64;
  id v61 = v64;
  id v62 = v11;
  id v63 = v78;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&location);
}

void __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke(uint64_t a1)
{
}

void __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    objc_super v3 = (void *)[*(id *)(a1 + 40) copy];
    [WeakRetained _notifyDelegatesWithResults:v2 sections:v3 shouldDisplayNoResults:*(unsigned __int8 *)(a1 + 64) shouldEnableRAPForNoResults:*(unsigned __int8 *)(a1 + 65) ticket:*(void *)(a1 + 48)];
  }
}

- (void)_notifyDelegatesWithResults:(id)a3 sections:(id)a4 shouldDisplayNoResults:(BOOL)a5 shouldEnableRAPForNoResults:(BOOL)a6 ticket:(id)a7
{
  id v44 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [(NSMutableArray *)self->_pendingTickets indexOfObject:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_22;
    }
    BOOL v42 = a6;
    id v43 = v13;
    v17 = 0;
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = [(NSMutableArray *)self->_pendingTickets objectAtIndexedSubscript:v18];
      if (!v17)
      {
        v17 = [MEMORY[0x1E4F1CA48] array];
      }
      [v17 addObject:v19];
      [v19 cancel];

      ++v18;
    }
    while (v16 != v18);
  }
  else
  {
    BOOL v42 = a6;
    id v43 = v13;
    v17 = 0;
  }
  -[NSMutableArray removeObjectsInRange:](self->_pendingTickets, "removeObjectsInRange:", 0, v16 + 1);
  if ([v17 count]) {
    [(NSMutableArray *)self->_inFlightTickets removeObjectsInArray:v17];
  }
  objc_storeStrong((id *)&self->_results, a3);
  objc_storeStrong((id *)&self->_sections, a4);
  self->_shouldDisplayNoResults = a5;
  self->_shouldEnableRAPForNoResults = v42;
  self->_resultsAreCurrent = !self->_dirty;
  uint64_t v20 = [v14 clientRankingModel];
  clientRankingModel = self->_clientRankingModel;
  self->_clientRankingModel = v20;

  uint64_t v22 = [v14 sortPriorityMapping];
  sortPriorityMapping = self->_sortPriorityMapping;
  self->_sortPriorityMapping = v22;

  self->_autocompleteTopSectionIsQuerySuggestions = [v14 autocompleteTopSectionIsQuerySuggestions];
  self->_showAutocompleteClientSource = [v14 showAutocompleteClientSource];
  self->_shouldEnableGrayscaleHighlighting = [v14 shouldEnableGrayscaleHighlighting];
  v24 = [v14 placeSummaryLayoutMetadata];
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  self->_placeSummaryLayoutMetadata = v24;

  self->_shouldUseDistanceFeatureServerResults = [v14 shouldUseDistanceFeatureServerResults];
  uint64_t v26 = [v14 highlightType];
  int64_t v27 = v26 == 1;
  if (v26 == 2) {
    int64_t v27 = 2;
  }
  self->_highlightType = v27;
  self->_enableStructuredRAPAffordance = [v14 enableStructuredRAPAffordance];
  v28 = [(MKLocalSearchCompleter *)self delegate];
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    v30 = [(MKLocalSearchCompleter *)self delegate];
    [v30 setLastTicket:v14];
  }
  v31 = [(MKLocalSearchCompleter *)self delegate];
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    v33 = [(MKLocalSearchCompleter *)self delegate];
    [v33 completerDidUpdateResults:self finished:1];
  }
  uint64_t v34 = [(MKLocalSearchCompleter *)self delegate];
  char v35 = objc_opt_respondsToSelector();

  if (v35)
  {
    uint64_t v36 = [(MKLocalSearchCompleter *)self delegate];
    sections = self->_sections;
    v38 = [v14 _searchQuery];
    [v36 completer:self didUpdateResultsWithSections:sections forQueryFragment:v38];
  }
  v39 = [(MKLocalSearchCompleter *)self delegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    id v41 = [(MKLocalSearchCompleter *)self delegate];
    [v41 completerDidUpdateResults:self];
  }
  id v13 = v43;
LABEL_22:
}

- (void)_handleError:(id)a3 forTicket:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  v7 = [v28 domain];
  id v8 = GEOErrorDomain();
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if ([v28 code] == -2)
    {
      [(NSMutableArray *)self->_pendingTickets removeObject:v6];
      goto LABEL_21;
    }
    if ([v28 code] == -8)
    {
      v10 = [v28 userInfo];
      uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F63EB8]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = [v11 BOOLValue];
      }
      else {
        uint64_t v12 = 0;
      }
      v25 = [v28 userInfo];
      uint64_t v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F63EC0]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v27 = [v26 BOOLValue];
      }
      else {
        uint64_t v27 = 0;
      }
      [(MKLocalSearchCompleter *)self _handleCompletion:0 shouldDisplayNoResults:v12 shouldEnableRAPForNoResults:v27 forTicket:v6];

      goto LABEL_20;
    }
  }
  uint64_t v13 = [(NSMutableArray *)self->_pendingTickets indexOfObject:v6];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_pendingTickets removeObjectAtIndex:v13];
    *(_WORD *)&self->_shouldDisplayNoResults = 0;
    if (![(NSMutableArray *)self->_pendingTickets count])
    {
      id v14 = [(MKLocalSearchCompleter *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v16 = [(MKLocalSearchCompleter *)self delegate];
        [v16 completerDidFail:self error:v28];
      }
      v17 = [(MKLocalSearchCompleter *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        uint64_t v19 = [(MKLocalSearchCompleter *)self delegate];
        uint64_t v20 = objc_msgSend(v28, "_mapkit_error");
        [v19 completer:self didFailWithError:v20];
      }
      uint64_t v21 = [(MKLocalSearchCompleter *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        uint64_t v11 = [(MKLocalSearchCompleter *)self delegate];
        v23 = objc_msgSend(v28, "_mapkit_error");
        v24 = [v6 _searchQuery];
        [v11 completer:self didFailWithError:v23 forQueryFragment:v24];

LABEL_20:
      }
    }
  }
LABEL_21:
}

- (void)_fireRequest
{
  [(MKLocalSearchCompleter *)self _cancelTimer];
  while ([(NSMutableArray *)self->_inFlightTickets count] >= self->_maxNumberOfConcurrentRequests)
  {
    objc_super v3 = [(NSMutableArray *)self->_inFlightTickets firstObject];
    [(NSMutableArray *)self->_inFlightTickets removeObjectAtIndex:0];
    [(NSMutableArray *)self->_pendingTickets removeObject:v3];
    [v3 cancel];
  }
  traits = self->_traits;
  if (traits)
  {
    uint64_t v5 = traits;
  }
  else
  {
    id v6 = +[MKMapService sharedService];
    uint64_t v5 = [v6 defaultTraits];
  }
  [(MKLocalSearchCompleter *)self region];
  if (fabs(v8) >= 0.00000000999999994 || fabs(v7) >= 0.00000000999999994)
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F64700], "_mapkit_mapRegionForCoordinateRegion:");
    [(GEOMapServiceTraits *)v5 setMapRegion:v9];
  }
  [(GEOMapServiceTraits *)v5 setSource:[(MKLocalSearchCompleter *)self source]];
  [(MKLocalSearchCompleter *)self timeSinceLastInBoundingRegion];
  LODWORD(v11) = vcvtmd_u64_f64(v10);
  [(GEOMapServiceTraits *)v5 setTimeSinceMapViewportChanged:v11];
  unint64_t v12 = [(MKLocalSearchCompleter *)self mapType];
  uint64_t v13 = 1;
  switch(v12)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
    case 3uLL:
      uint64_t v13 = 2;
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      uint64_t v13 = 3;
      goto LABEL_16;
    default:
      if (v12 == 102) {
        goto LABEL_16;
      }
      if (v12 == 104)
      {
        uint64_t v13 = 4;
LABEL_16:
        [(GEOMapServiceTraits *)v5 setMode:v13];
      }
      id v14 = [(MKLocalSearchCompleter *)self deviceLocation];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F64660]);
        uint64_t v16 = [(MKLocalSearchCompleter *)self deviceLocation];
        v17 = (void *)[v15 initWithCLLocation:v16];
        [(GEOMapServiceTraits *)v5 setDeviceLocation:v17];
      }
      if (!traits)
      {
        char v18 = [(GEOMapServiceTraits *)v5 deviceLocation];
        if (v18 || self->_singleLocationUpdate)
        {
        }
        else
        {
          uint64_t v27 = +[MKLocationManager sharedLocationManager];
          int v28 = [v27 isLocationServicesAvailable];

          if (v28)
          {
            char v29 = +[MKLocationManager sharedLocationManager];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke;
            v38[3] = &unk_1E54BC648;
            v38[4] = self;
            v30 = [v29 singleLocationUpdateWithHandler:v38];
            singleLocationUpdate = self->_singleLocationUpdate;
            self->_singleLocationUpdate = v30;

            [(MKLocationManagerOperation *)self->_singleLocationUpdate start];
          }
        }
      }
      [(GEOMapServiceTraits *)v5 setPhotosCount:0];
      int64_t privateFilterType = self->_privateFilterType;
      if (privateFilterType) {
        [(MKLocalSearchCompleter *)self _completionTicketForPrivateFilterType:privateFilterType traits:v5];
      }
      else {
      uint64_t v20 = [(MKLocalSearchCompleter *)self _completionTicketForFilterTypeWithTraits:v5];
      }
      [(NSMutableArray *)self->_pendingTickets addObject:v20];
      [(NSMutableArray *)self->_inFlightTickets addObject:v20];
      self->_lastRequestTime = CACurrentMediaTime();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_2;
      v37[3] = &unk_1E54B86F0;
      v37[4] = self;
      uint64_t v21 = (void *)MEMORY[0x18C139AE0](v37);
      char v22 = [(MKLocalSearchCompleter *)self analyticsProvider];
      v23 = [v22 captureNewMetrics];

      id v33 = v21;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_3;
      v34[3] = &unk_1E54BC670;
      v34[4] = self;
      id v35 = v20;
      id v36 = v23;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_6;
      v32[3] = &unk_1E54B89C0;
      id v24 = v21;
      id v25 = v23;
      id v26 = v20;
      [v26 submitWithAutoCompletionHandler:v34 networkActivity:v32];

      return;
  }
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3) {
    [*(id *)(a1 + 32) _markDirty];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = 0;
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (a2)
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 completerWillAccessNetwork:*(void *)(a1 + 32)];
  }
  else
  {
    int v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 completerDidAccessNetwork:*(void *)(a1 + 32)];
  }
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_4;
  v16[3] = &unk_1E54B9788;
  id v7 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v7;
  id v8 = v6;
  id v18 = v8;
  id v19 = *(id *)(a1 + 48);
  id v9 = v5;
  id v20 = v9;
  double v10 = (void (**)(void))MEMORY[0x18C139AE0](v16);
  GEOConfigGetDouble();
  if (v11 > 0.0 && (double v12 = v11 - (CACurrentMediaTime() - *(double *)(*(void *)(a1 + 32) + 128)), v12 > 0.0))
  {
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_5;
    v14[3] = &unk_1E54B82E8;
    id v15 = v10;
    dispatch_after(v13, MEMORY[0x1E4F14428], v14);
  }
  else if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v10[2](v10);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void *__38__MKLocalSearchCompleter__fireRequest__block_invoke_4(uint64_t a1)
{
  result = (void *)[*(id *)(*(void *)(a1 + 32) + 224) indexOfObject:*(void *)(a1 + 40)];
  if (result == (void *)0x7FFFFFFFFFFFFFFFLL) {
    return result;
  }
  [*(id *)(*(void *)(a1 + 32) + 216) removeObject:*(void *)(a1 + 40)];
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    id v6 = GEOErrorDomain();
    if ([v5 isEqualToString:v6])
    {
      uint64_t v7 = [v4 code];

      if (v7 == -3)
      {
        uint64_t v8 = 2;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  uint64_t v8 = 1;
LABEL_9:

  [*(id *)(a1 + 56) submitWithStatus:v8];
  id v9 = *(void **)(a1 + 32);
  if (!*(void *)(a1 + 64) || *(void *)(a1 + 48))
  {
    [v9 _handleError:*(void *)(a1 + 48) forTicket:*(void *)(a1 + 40)];
    result = *(void **)(a1 + 32);
    if (!result[22]) {
      return result;
    }
  }
  else
  {
    objc_msgSend(v9, "_handleCompletion:shouldDisplayNoResults:shouldEnableRAPForNoResults:forTicket:");
    result = *(void **)(a1 + 32);
  }

  return (void *)[result _schedulePendingRequest];
}

uint64_t __38__MKLocalSearchCompleter__fireRequest__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_6(uint64_t a1, char a2)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_7;
    v5[3] = &unk_1E54BAF98;
    id v6 = *(id *)(a1 + 32);
    char v7 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __38__MKLocalSearchCompleter__fireRequest__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_completionTicketForFilterTypeWithTraits:(id)a3
{
  id v4 = a3;
  if (self->_statefulQueriesEnabled) {
    autocompleteSessionData = self->_autocompleteSessionData;
  }
  else {
    autocompleteSessionData = 0;
  }
  id v6 = autocompleteSessionData;
  if (![(MKLocalSearchCompleter *)self resultTypes]
    || ([(MKLocalSearchCompleter *)self resultTypes] & 4) != 0)
  {
    int64_t v11 = [(MKLocalSearchCompleter *)self listType];
    if (v11 == 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F64710] sharedService];
      id v9 = [(MKLocalSearchCompleter *)self queryFragment];
      uint64_t v10 = [v8 ticketForSectionedAutoCompleteSearchFragment:v9 filters:self->_filters sessionData:v6 traits:v4];
      goto LABEL_15;
    }
    if (!v11)
    {
      uint64_t v8 = [MEMORY[0x1E4F64710] sharedService];
      id v9 = [(MKLocalSearchCompleter *)self queryFragment];
      uint64_t v10 = [v8 ticketForInterleavedAutoCompleteSearchFragment:v9 filters:self->_filters sessionData:v6 traits:v4];
      goto LABEL_15;
    }
LABEL_12:
    double v12 = 0;
    goto LABEL_16;
  }
  int64_t v7 = [(MKLocalSearchCompleter *)self listType];
  if (v7 == 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F64710] sharedService];
    id v9 = [(MKLocalSearchCompleter *)self queryFragment];
    uint64_t v10 = [v8 ticketForSectionedInstantSearchFragment:v9 filters:self->_filters sessionData:v6 traits:v4];
    goto LABEL_15;
  }
  if (v7) {
    goto LABEL_12;
  }
  uint64_t v8 = [MEMORY[0x1E4F64710] sharedService];
  id v9 = [(MKLocalSearchCompleter *)self queryFragment];
  uint64_t v10 = [v8 ticketForInterleavedInstantSearchFragment:v9 filters:self->_filters sessionData:v6 traits:v4];
LABEL_15:
  double v12 = (void *)v10;

LABEL_16:

  return v12;
}

- (id)_completionTicketForPrivateFilterType:(int64_t)a3 traits:(id)a4
{
  id v6 = a4;
  if (self->_statefulQueriesEnabled) {
    autocompleteSessionData = self->_autocompleteSessionData;
  }
  else {
    autocompleteSessionData = 0;
  }
  uint64_t v8 = autocompleteSessionData;
  switch(a3)
  {
    case 1000:
      int64_t v9 = [(MKLocalSearchCompleter *)self listType];
      if (v9 == 1)
      {
        uint64_t v10 = [MEMORY[0x1E4F64710] sharedService];
        int64_t v11 = [(MKLocalSearchCompleter *)self queryFragment];
        uint64_t v12 = [v10 ticketForSectionedLocalitiesAndLandmarksSearchFragment:v11 sessionData:v8 traits:v6];
      }
      else
      {
        if (v9) {
          goto LABEL_8;
        }
        uint64_t v10 = [MEMORY[0x1E4F64710] sharedService];
        int64_t v11 = [(MKLocalSearchCompleter *)self queryFragment];
        uint64_t v12 = [v10 ticketForInterleavedLocalitiesAndLandmarksSearchFragment:v11 sessionData:v8 traits:v6];
      }
      goto LABEL_13;
    case 1001:
      uint64_t v10 = [MEMORY[0x1E4F64710] sharedService];
      int64_t v11 = [(MKLocalSearchCompleter *)self queryFragment];
      filters = self->_filters;
      id v15 = [(MKLocalSearchCompleter *)self retainedSearchMetadata];
      uint64_t v16 = [(MKLocalSearchCompletion *)self->_tappedQuerySuggestionCompletion _geoCompletionItem];
      dispatch_time_t v13 = [v10 ticketForInterleavedAutoCompleteWithBrowseSearchFragment:v11 filters:filters retainedSearch:v15 tappedQuerySuggestion:v16 sessionData:v8 traits:v6];

      goto LABEL_14;
    case 1002:
      uint64_t v10 = [MEMORY[0x1E4F64710] sharedService];
      int64_t v11 = [(MKLocalSearchCompleter *)self queryFragment];
      uint64_t v12 = [v10 ticketForInterleavedAutoCompletePoiAddressOnly:v11 sessionData:v8 traits:v6];
      goto LABEL_13;
    case 1003:
      uint64_t v10 = [MEMORY[0x1E4F64710] sharedService];
      int64_t v11 = [(MKLocalSearchCompleter *)self queryFragment];
      uint64_t v12 = [v10 ticketForOfflineRegionSearchFragment:v11 sessionData:v8 traits:v6];
LABEL_13:
      dispatch_time_t v13 = (void *)v12;
LABEL_14:

      break;
    default:
LABEL_8:
      dispatch_time_t v13 = 0;
      break;
  }

  return v13;
}

- (void)_schedulePendingRequest
{
  [(MKLocalSearchCompleter *)self _cancelTimer];
  if (self->_dirty)
  {
    [(MKLocalSearchCompleter *)self timeToNextRequest];
    -[MKLocalSearchCompleter _scheduleRequestWithTimeToNextRequest:](self, "_scheduleRequestWithTimeToNextRequest:");
  }
}

- (void)_markDirty
{
  [(MKLocalSearchCompleter *)self timeToNextRequest];

  -[MKLocalSearchCompleter _markDirtyAndScheduleRequestWithTimeToNextRequest:](self, "_markDirtyAndScheduleRequestWithTimeToNextRequest:");
}

- (void)_markDirtyAndScheduleRequestWithTimeToNextRequest:(double)a3
{
  id v5 = [(MKLocalSearchCompleter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int64_t v7 = [(MKLocalSearchCompleter *)self delegate];
    [v7 completerWillUpdateResults:self];
  }
  *(_WORD *)&self->_dirty = 1;

  [(MKLocalSearchCompleter *)self _scheduleRequestWithTimeToNextRequest:a3];
}

- (void)_scheduleRequestWithTimeToNextRequest:(double)a3
{
  if (!self->_timer)
  {
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__fireRequest selector:0 userInfo:0 repeats:a3];
    timer = self->_timer;
    self->_timer = v4;
  }
}

- (double)timeToNextRequest
{
  double v3 = CACurrentMediaTime() - self->_lastRequestTime;
  if ([(NSMutableArray *)self->_inFlightTickets count] != self->_maxNumberOfConcurrentRequests)
  {
    double v6 = searchNextRequestInterval() - v3;
    double result = 0.0;
    if (v6 < 0.0) {
      return result;
    }
    double RequestInterval = searchNextRequestInterval();
    return RequestInterval - v3;
  }
  if (qword_1EB316050 != -1) {
    dispatch_once(&qword_1EB316050, &__block_literal_global_74);
  }
  double result = 0.0;
  if (*(double *)_MergedGlobals_161 - v3 >= 0.0)
  {
    double RequestInterval = *(double *)_MergedGlobals_161;
    return RequestInterval - v3;
  }
  return result;
}

- (void)setQueryFragment:(NSString *)queryFragment
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = queryFragment;
  if (![(NSString *)v4 isEqualToString:self->_queryFragment])
  {
    id v24 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    double v6 = self->_queryFragment;
    self->_queryFragment = v5;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    int64_t v7 = self->_pendingTickets;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v25 = 0;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v13 = [v12 _searchQuery];
          if (v13)
          {
            id v14 = (void *)v13;
            id v15 = self->_queryFragment;
            uint64_t v16 = [v12 _searchQuery];
            if ([(NSString *)v15 hasPrefix:v16])
            {
            }
            else
            {
              id v17 = self->_queryFragment;
              id v18 = [v12 _searchQuery];
              LOBYTE(v17) = [(NSString *)v17 isEqualToString:v18];

              if ((v17 & 1) == 0)
              {
                [v12 cancel];
                id v19 = v25;
                if (!v25)
                {
                  id v19 = [MEMORY[0x1E4F1CA48] array];
                }
                id v25 = v19;
                [v19 addObject:v12];
              }
            }
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }
    else
    {
      id v25 = 0;
    }

    if ([v25 count])
    {
      [(NSMutableArray *)self->_inFlightTickets removeObjectsInArray:v25];
      [(NSMutableArray *)self->_pendingTickets removeObjectsInArray:v25];
    }
    [(MKLocalSearchCompleter *)self timeToNextRequest];
    double v21 = v20;
    id v4 = v24;
    if (v20 > 0.0)
    {
      char v22 = [(MKLocalSearchCompleter *)self analyticsProvider];
      v23 = [v22 captureNewMetrics];

      [v23 submitWithStatus:3];
    }
    [(MKLocalSearchCompleter *)self _markDirtyAndScheduleRequestWithTimeToNextRequest:v21];
  }
}

- (MKSearchCompletionFilterType)filterType
{
  MKSearchCompletionFilterType result = self->_privateFilterType;
  if (result == MKSearchCompletionFilterTypeLocationsAndQueries)
  {
    MKSearchCompletionFilterType result = [(MKLocalSearchCompleter *)self resultTypes];
    if (result) {
      return ~([(MKLocalSearchCompleter *)self resultTypes] >> 2) & 1;
    }
  }
  return result;
}

- (void)setFilterType:(MKSearchCompletionFilterType)filterType
{
  if ((unint64_t)(filterType - 1000) >= 4)
  {
    if (filterType)
    {
      if (filterType != MKSearchCompletionFilterTypeLocationsOnly) {
        return;
      }
      filterType = 3;
    }
    [(MKLocalSearchCompleter *)self setResultTypes:filterType];
    filterType = MKSearchCompletionFilterTypeLocationsAndQueries;
  }

  [(MKLocalSearchCompleter *)self _setPrivateFilterType:filterType];
}

- (void)setResultTypes:(MKLocalSearchCompleterResultType)resultTypes
{
  if (self->_resultTypes != resultTypes)
  {
    self->_resultTypes = resultTypes;
    [(MKLocalSearchCompleter *)self _updateFilters];
  }
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  if (self->_pointOfInterestFilter != pointOfInterestFilter)
  {
    id v4 = (MKPointOfInterestFilter *)[(MKPointOfInterestFilter *)pointOfInterestFilter copy];
    id v5 = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v4;

    [(MKLocalSearchCompleter *)self _updateFilters];
  }
}

- (void)setCategoryFilter:(id)a3
{
  id v5 = (GEOSearchCategory *)a3;
  if (self->_categoryFilter != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_categoryFilter, a3);
    [(MKLocalSearchCompleter *)self _updateFilters];
    id v5 = v6;
  }
}

- (void)setAddressFilter:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_addressFilter] & 1) == 0)
  {
    id v4 = (MKAddressFilter *)[v6 copy];
    addressFilter = self->_addressFilter;
    self->_addressFilter = v4;

    [(MKLocalSearchCompleter *)self _updateFilters];
  }
}

- (void)_updateFilters
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_categoryFilter)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F64418]) initWithCategory:self->_categoryFilter];
    if (v4) {
      [(NSArray *)v3 addObject:v4];
    }
  }
  pointOfInterestFilter = self->_pointOfInterestFilter;
  if (pointOfInterestFilter)
  {
    id v6 = [(MKPointOfInterestFilter *)pointOfInterestFilter _geoPOICategoryFilter];
    if (v6) {
      [(NSArray *)v3 addObject:v6];
    }
  }
  addressFilter = self->_addressFilter;
  if (addressFilter)
  {
    uint64_t v8 = [(MKAddressFilter *)addressFilter _geoAddressFilter];
    if (v8) {
      [(NSArray *)v3 addObject:v8];
    }
  }
  unint64_t resultTypes = self->_resultTypes;
  if (resultTypes)
  {
    BOOL v10 = _MKLinkedOnOrAfterReleaseSet(3852);
    if ((resultTypes & 2) != 0 && !v10) {
      resultTypes |= 8uLL;
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F64930]) initWithResultTypes:resultTypes];
    [(NSArray *)v3 addObject:v12];
  }
  if (self->_regionPriority == 1)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F64A90]);
    [(NSArray *)v3 addObject:v13];
  }
  filters = self->_filters;
  self->_filters = v3;
  id v15 = v3;

  NSUInteger v16 = [(NSString *)self->_queryFragment length];
  if (v16)
  {
    [(MKLocalSearchCompleter *)self _markDirty];
  }
}

- (void)setRetainedSearchMetadata:(id)a3
{
  id v5 = (GEORetainedSearchMetadata *)a3;
  if (self->_retainedSearchMetadata != v5)
  {
    objc_storeStrong((id *)&self->_retainedSearchMetadata, a3);
    if ([(NSString *)self->_queryFragment length]) {
      [(MKLocalSearchCompleter *)self _markDirty];
    }
  }
}

- (void)setSource:(int)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    if ([(NSString *)self->_queryFragment length])
    {
      [(MKLocalSearchCompleter *)self _markDirty];
    }
  }
}

- (int)source
{
  return self->_source;
}

- (void)setRegion:(MKCoordinateRegion)region
{
  self->_region = ($787999B08D62D8BBAAF19AF74A688926)region;
  id v4 = [(MKLocalSearchCompleter *)self queryFragment];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    [(MKLocalSearchCompleter *)self _markDirty];
  }
}

- (void)setRegionPriority:(int64_t)a3
{
  if (self->_regionPriority != a3)
  {
    self->_regionPriority = a3;
    [(MKLocalSearchCompleter *)self _markDirty];
  }
}

- (BOOL)isSearching
{
  return self->_timer || [(NSMutableArray *)self->_pendingTickets count] != 0;
}

- (BOOL)resultsAreCurrent
{
  return self->_resultsAreCurrent;
}

- (void)_cancelTimer
{
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer invalidate];
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MKLocalSearchCompleter *)self _cancelTimer];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v3 = self->_inFlightTickets;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "cancel", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_inFlightTickets removeAllObjects];
  [(NSMutableArray *)self->_pendingTickets removeAllObjects];
  [(MKLocationManagerOperation *)self->_singleLocationUpdate cancel];
  singleLocationUpdate = self->_singleLocationUpdate;
  self->_singleLocationUpdate = 0;
}

- (void)retry
{
  if (![(MKLocalSearchCompleter *)self isSearching] && self->_dirty)
  {
    [(MKLocalSearchCompleter *)self _markDirty];
  }
}

- (NSArray)results
{
  return self->_results;
}

- (GEOAutocompleteSessionData)_recentAutocompleteSessionData
{
  return self->_autocompleteSessionData;
}

- (void)clearQueryState
{
  double v3 = (GEOAutocompleteSessionData *)objc_alloc_init(MEMORY[0x1E4F64408]);
  autocompleteSessionData = self->_autocompleteSessionData;
  self->_autocompleteSessionData = v3;
}

- (BOOL)statefulQueriesEnabled
{
  return self->_statefulQueriesEnabled;
}

- (void)setStatefulQueriesEnabled:(BOOL)a3
{
  if (self->_statefulQueriesEnabled != a3)
  {
    self->_statefulQueriesEnabled = a3;
    if (a3)
    {
      uint64_t v4 = (GEOAutocompleteSessionData *)objc_alloc_init(MEMORY[0x1E4F64408]);
      autocompleteSessionData = self->_autocompleteSessionData;
      self->_autocompleteSessionData = v4;
    }
    else
    {
      autocompleteSessionData = self->_autocompleteSessionData;
      self->_autocompleteSessionData = 0;
    }
  }
}

- (int64_t)entriesType
{
  if ([(MKLocalSearchCompleter *)self _privateFilterType])
  {
    unint64_t v3 = [(MKLocalSearchCompleter *)self _privateFilterType] - 1000;
    if (v3 < 3) {
      return qword_18BD1B7C0[v3];
    }
  }
  return ![(MKLocalSearchCompleter *)self resultTypes]
      || ([(MKLocalSearchCompleter *)self resultTypes] & 4) != 0;
}

- (void)setEntriesType:(int64_t)a3
{
  if (unint64_t)a3 <= 5 && ((0x33u >> a3))
  {
    uint64_t v5 = qword_18BD1B808[a3];
    [(MKLocalSearchCompleter *)self setResultTypes:qword_18BD1B7D8[a3]];
    [(MKLocalSearchCompleter *)self _setPrivateFilterType:v5];
  }
}

- (NSString)queryFragment
{
  return self->_queryFragment;
}

- (MKCoordinateRegion)region
{
  double latitude = self->_region.center.latitude;
  double longitude = self->_region.center.longitude;
  double latitudeDelta = self->_region.span.latitudeDelta;
  double longitudeDelta = self->_region.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (GEOSearchCategory)categoryFilter
{
  return self->_categoryFilter;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);

  return WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)listType
{
  return self->_listType;
}

- (void)setListType:(int64_t)a3
{
  self->_listType = a3;
}

- (double)timeSinceLastInBoundingRegion
{
  return self->_timeSinceLastInBoundingRegion;
}

- (void)setTimeSinceLastInBoundingRegion:(double)a3
{
  self->_timeSinceLastInBoundingRegion = a3;
}

- (CLLocation)deviceLocation
{
  return self->_deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (int64_t)regionPriority
{
  return self->_regionPriority;
}

- (MKLocalSearchCompleterResultType)resultTypes
{
  return self->_resultTypes;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (MKAddressFilter)addressFilter
{
  return self->_addressFilter;
}

- (MKAutocompleteAnalyticsProvider)analyticsProvider
{
  return self->_analyticsProvider;
}

- (void)setAnalyticsProvider:(id)a3
{
}

- (BOOL)_shouldDisplayNoResults
{
  return self->_shouldDisplayNoResults;
}

- (BOOL)_shouldEnableRAPForNoResults
{
  return self->_shouldEnableRAPForNoResults;
}

- (GEOClientRankingModel)_clientRankingModel
{
  return self->_clientRankingModel;
}

- (GEOSortPriorityMapping)_sortPriorityMapping
{
  return self->_sortPriorityMapping;
}

- (BOOL)_autocompleteTopSectionIsQuerySuggestions
{
  return self->_autocompleteTopSectionIsQuerySuggestions;
}

- (MKLocalSearchCompletion)_tappedQuerySuggestionCompletion
{
  return self->_tappedQuerySuggestionCompletion;
}

- (void)_setTappedQuerySuggestionCompletion:(id)a3
{
}

- (BOOL)_showAutocompleteClientSource
{
  return self->_showAutocompleteClientSource;
}

- (BOOL)_shouldPreloadTransitInfo
{
  return self->_shouldPreloadTransitInfo;
}

- (void)_setShouldPreloadTransitInfo:(BOOL)a3
{
  self->_shouldPreloadTransitInfo = a3;
}

- (NSArray)_sections
{
  return self->_sections;
}

- (int64_t)_privateFilterType
{
  return self->_privateFilterType;
}

- (void)_setPrivateFilterType:(int64_t)a3
{
  self->_int64_t privateFilterType = a3;
}

- (BOOL)_shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (BOOL)_shouldUseDistanceFeatureServerResults
{
  return self->_shouldUseDistanceFeatureServerResults;
}

- (GEOPDPlaceSummaryLayoutMetadata)_placeSummaryLayoutMetadata
{
  return self->_placeSummaryLayoutMetadata;
}

- (int64_t)_highlightType
{
  return self->_highlightType;
}

- (BOOL)_enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_tappedQuerySuggestionCompletion, 0);
  objc_storeStrong((id *)&self->_analyticsProvider, 0);
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_pendingTickets, 0);
  objc_storeStrong((id *)&self->_inFlightTickets, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_singleLocationUpdate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_sortPriorityMapping, 0);
  objc_storeStrong((id *)&self->_clientRankingModel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak(&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_categoryFilter, 0);

  objc_storeStrong((id *)&self->_queryFragment, 0);
}

void *MapKitConfig_MKLocalSearchCompleter_MaxConcurrentRequests_Metadata_block_invoke_5()
{
  return &unk_1ED97EBF8;
}

@end