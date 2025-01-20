@interface CUIKLocationSearchModel
+ (id)URLsFromSource:(id)a3;
+ (id)_dataDetector;
+ (id)_linksInSource:(id)a3;
+ (void)initialize;
- (BOOL)removeRecentLocation:(id)a3;
- (BOOL)resultsPending;
- (CUIKLocationSearchModel)initWithEventStore:(id)a3;
- (CUIKLocationSearchModelDelegate)delegate;
- (CUIKStructuredLocationWithImage)locationFromMapsURL;
- (EKStructuredLocation)currentLocation;
- (NSArray)conferenceRoomSearchResults;
- (NSArray)contactsSearchResults;
- (NSArray)eventsSearchResults;
- (NSArray)frequentsSearchResults;
- (NSArray)mapCompletionSearchResults;
- (NSArray)recentsSearchResults;
- (NSArray)textualSearchResults;
- (NSArray)virtualConferenceCustomSearchResults;
- (NSArray)virtualConferenceRoomSearchResults;
- (id)_availabilityRequestForConferenceRooms:(id)a3 eventID:(id)a4 source:(id)a5 dateRange:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8;
- (id)_imageForAttributes:(id)a3;
- (id)_imageForMapHandle:(id)a3;
- (id)splitEventLocations:(id)a3;
- (unint64_t)dedupeResults;
- (unint64_t)supportedSearchTypes;
- (void)_addDiscoveredConferenceRooms:(id)a3;
- (void)_addLocationToRecents:(id)a3 addressString:(id)a4 mapItem:(id)a5;
- (void)_decrementPendingOperationsCountForDomain:(id)a3;
- (void)_handleAvailabilityResults:(id)a3 forOperation:(id)a4;
- (void)_incrementPendingOperationsCountForDomain:(id)a3;
- (void)_processDirectorySearchResultSet:(id)a3 forOperation:(id)a4;
- (void)_updateAllPossibleVirtualConferenceResultsWithRoomTypes:(id)a3;
- (void)_updateContactsSearchWithResults:(id)a3 forToken:(id)a4;
- (void)_updateMapURL:(id)a3;
- (void)_updateVirtualConferenceCustomOptions:(id)a3;
- (void)_updateVirtualConferenceOptions:(id)a3;
- (void)addConferenceRoomToRecents:(id)a3 fromSource:(id)a4;
- (void)beginSearchForTerm:(id)a3;
- (void)cancelSearch;
- (void)completerDidFail:(id)a3 error:(id)a4;
- (void)completerDidUpdateResults:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)getCurrentLocation;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)resetConferenceRoomSearchResults;
- (void)resetContactsSearchResults;
- (void)resetEventsSearchResults;
- (void)resetRecentsSearchResults;
- (void)resetSearchResults:(BOOL)a3;
- (void)searchConferenceRooms:(id)a3;
- (void)searchFrequentLocations:(id)a3;
- (void)selectCurrentLocation;
- (void)selectLocation:(id)a3;
- (void)selectMapSearchCompletion:(id)a3;
- (void)selectVirtualConferenceRoomType:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupportedSearchTypes:(unint64_t)a3;
- (void)stopUpdatingLocation;
- (void)updateConferenceRoomAvailability:(id)a3 duringEvent:(id)a4 completionBlock:(id)a5;
- (void)updateContacts:(id)a3;
- (void)updateEventLocations:(id)a3;
- (void)updateRecents:(id)a3;
- (void)updateVirtualConferenceRoomOptions:(id)a3;
@end

@implementation CUIKLocationSearchModel

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
  }
}

void __37__CUIKLocationSearchModel_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_mapItemCache;
  _mapItemCache = (uint64_t)v0;
}

- (CUIKLocationSearchModel)initWithEventStore:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CUIKLocationSearchModel;
  v6 = [(CUIKLocationSearchModel *)&v39 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    id v8 = objc_alloc_init((Class)EKWeakLinkClass());
    [v8 setIncludeIncludeManagedAppleIDs:1];
    uint64_t v9 = [objc_alloc((Class)EKWeakLinkClass()) initWithConfiguration:v8];
    contactStore = v7->_contactStore;
    v7->_contactStore = (CNContactStore *)v9;

    v7->_supportedSearchTypes = 2047;
    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    whitespaceAndNewlineCharacterSet = v7->_whitespaceAndNewlineCharacterSet;
    v7->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobilecal.ConferenceRoomProcessing", 0);
    conferenceRoomProcessingQueue = v7->_conferenceRoomProcessingQueue;
    v7->_conferenceRoomProcessingQueue = (OS_dispatch_queue *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    conferenceRoomOperationQueue = v7->_conferenceRoomOperationQueue;
    v7->_conferenceRoomOperationQueue = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableConferenceRoomSearchResults = v7->_mutableConferenceRoomSearchResults;
    v7->_mutableConferenceRoomSearchResults = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    conferenceRoomAddressesToConferenceRooms = v7->_conferenceRoomAddressesToConferenceRooms;
    v7->_conferenceRoomAddressesToConferenceRooms = v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    recentsSearchResults = v7->_recentsSearchResults;
    v7->_recentsSearchResults = (NSMutableArray *)v21;

    v23 = (objc_class *)EKWeakLinkClass();
    v24 = (uint64_t (*)(void))EKWeakLinkSymbol();
    v25 = (uint64_t (*)(uint64_t, __CFString *, void))EKWeakLinkSymbol();
    uint64_t v26 = v24(*MEMORY[0x1E4F1CF80]);
    if (v26)
    {
      v27 = (const void *)v26;
      CFBooleanRef v28 = (const __CFBoolean *)v25(v26, @"com.apple.locationd.effective_bundle", 0);
      if (v28)
      {
        CFBooleanRef v29 = v28;
        if (CFBooleanGetValue(v28))
        {
          id v30 = [v23 alloc];
          uint64_t v31 = [v30 initWithEffectiveBundleIdentifier:*MEMORY[0x1E4F57900] delegate:v7 onQueue:MEMORY[0x1E4F14428]];
          locationManager = v7->_locationManager;
          v7->_locationManager = (CLLocationManager *)v31;
        }
        CFRelease(v27);
      }
      else
      {
        CFBooleanRef v29 = (const __CFBoolean *)v27;
      }
      CFRelease(v29);
    }
    if (!v7->_locationManager)
    {
      id v33 = [v23 alloc];
      uint64_t v34 = [v33 _initWithDelegate:v7 onQueue:MEMORY[0x1E4F14428]];
      v35 = v7->_locationManager;
      v7->_locationManager = (CLLocationManager *)v34;
    }
    uint64_t v36 = objc_opt_new();
    pendingOperationsCounts = v7->_pendingOperationsCounts;
    v7->_pendingOperationsCounts = (NSCountedSet *)v36;

    v7->_pendingOperationsCountsLock._os_unfair_lock_opaque = 0;
    [(CLLocationManager *)v7->_locationManager requestWhenInUseAuthorization];
  }
  return v7;
}

- (void)dealloc
{
  [(CUIKLocationSearchModel *)self cancelSearch];
  [(CUIKLocationSearchModel *)self stopUpdatingLocation];
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  [(MKLocalSearchCompleter *)self->_completer setDelegate:0];
  geocoder = self->_geocoder;
  if (geocoder) {
    [(CLGeocoder *)geocoder cancelGeocode];
  }
  localSearch = self->_localSearch;
  if (localSearch) {
    [(MKLocalSearch *)localSearch cancel];
  }
  [(NSOperationQueue *)self->_conferenceRoomOperationQueue cancelAllOperations];
  v6.receiver = self;
  v6.super_class = (Class)CUIKLocationSearchModel;
  [(CUIKLocationSearchModel *)&v6 dealloc];
}

- (BOOL)resultsPending
{
  v2 = self;
  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  os_unfair_lock_lock(&self->_pendingOperationsCountsLock);
  LOBYTE(v2) = [(NSCountedSet *)v2->_pendingOperationsCounts count] != 0;
  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
  return (char)v2;
}

- (void)_incrementPendingOperationsCountForDomain:(id)a3
{
  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_pendingOperationsCountsLock);
  [(NSCountedSet *)self->_pendingOperationsCounts addObject:v5];

  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
}

- (void)_decrementPendingOperationsCountForDomain:(id)a3
{
  p_pendingOperationsCountsLock = &self->_pendingOperationsCountsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_pendingOperationsCountsLock);
  [(NSCountedSet *)self->_pendingOperationsCounts removeObject:v5];

  os_unfair_lock_unlock(p_pendingOperationsCountsLock);
}

- (void)getCurrentLocation
{
  if ((self->_supportedSearchTypes & 4) != 0)
  {
    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainCurrentLocation"];
    [(CUIKLocationSearchModel *)self performSelector:sel_stopUpdatingLocation withObject:0 afterDelay:30.0];
    v3 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_INFO, "Started updating current location", v6, 2u);
    }

    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    v4 = (CLInUseAssertion *)[(id)EKWeakLinkClass() newAssertionForBundleIdentifier:*MEMORY[0x1E4F57900] withReason:@"event editor getting current location"];
    locationAssertion = self->_locationAssertion;
    self->_locationAssertion = v4;
  }
}

- (void)stopUpdatingLocation
{
  [(CUIKLocationSearchModel *)self _decrementPendingOperationsCountForDomain:@"OperationDomainCurrentLocation"];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_stopUpdatingLocation object:0];
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationAssertion = self->_locationAssertion;
  self->_locationAssertion = 0;

  v4 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_INFO, "Stopped updating current location", v5, 2u);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_ERROR, "Updating current location failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(CUIKLocationSearchModel *)self stopUpdatingLocation];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a4;
  char v7 = [a3 _limitsPrecision];
  id v8 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDF08000, v8, OS_LOG_TYPE_INFO, "Found current location, shifting...", buf, 2u);
  }

  uint64_t v9 = [v6 lastObject];

  id v10 = objc_alloc_init((Class)EKWeakLinkClass());
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CUIKLocationSearchModel_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_1E6369908;
  char v12 = v7;
  v11[4] = self;
  [v10 shiftLocation:v9 withCompletionHandler:v11];
  [(CUIKLocationSearchModel *)self stopUpdatingLocation];
}

void __62__CUIKLocationSearchModel_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_INFO, "Current location shifting finished. Result is imprecise, so this only affects search result relevancy", buf, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F25630];
    id v10 = CUIKUserFriendlyStringForCLLocation(v3);
    uint64_t v11 = [v9 locationWithTitle:v10];
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_queue_t v13 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = v11;

    [*(id *)(*(void *)(a1 + 32) + 32) setGeoLocation:v4];
    v14 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1BDF08000, v14, OS_LOG_TYPE_INFO, "Current location shifting finished", v15, 2u);
    }

    [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainCurrentLocation"];
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:1];
  }
}

- (void)resetContactsSearchResults
{
  contactsSearchToken = self->_contactsSearchToken;
  if (contactsSearchToken)
  {
    [(CNCancelable *)contactsSearchToken cancel];
    v4 = self->_contactsSearchToken;
    self->_contactsSearchToken = 0;
  }
  contactsSearchResults = self->_contactsSearchResults;
  if (contactsSearchResults)
  {
    self->_contactsSearchResults = 0;
  }
}

- (void)resetEventsSearchResults
{
  id v3 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_INFO, "Resetting event search results", v8, 2u);
  }

  eventsSearch = self->_eventsSearch;
  if (eventsSearch)
  {
    [(EKOccurrenceCacheLocationSearch *)eventsSearch cancel];
    id v5 = self->_eventsSearch;
    self->_eventsSearch = 0;
  }
  eventsSearchResults = self->_eventsSearchResults;
  if (eventsSearchResults)
  {
    self->_eventsSearchResults = 0;
  }
  textualSearchResults = self->_textualSearchResults;
  if (textualSearchResults)
  {
    self->_textualSearchResults = 0;
  }
}

- (void)resetConferenceRoomSearchResults
{
  [(NSOperationQueue *)self->_conferenceRoomOperationQueue cancelAllOperations];
  [(NSMutableArray *)self->_mutableConferenceRoomSearchResults removeAllObjects];
  conferenceRoomAddressesToConferenceRooms = self->_conferenceRoomAddressesToConferenceRooms;

  [(NSMutableDictionary *)conferenceRoomAddressesToConferenceRooms removeAllObjects];
}

- (void)resetRecentsSearchResults
{
  currentRecentsSearch = self->_currentRecentsSearch;
  self->_currentRecentsSearch = 0;

  recentsSearchResults = self->_recentsSearchResults;

  [(NSMutableArray *)recentsSearchResults removeAllObjects];
}

- (void)resetSearchResults:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v13 = 0;
    _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_INFO, "Resetting location search results", v13, 2u);
  }

  if (v3)
  {
    [(CLGeocoder *)self->_geocoder cancelGeocode];
    [(MKLocalSearchCompleter *)self->_completer cancel];
    [(MKLocalSearch *)self->_localSearch cancel];
    localSearch = self->_localSearch;
    self->_localSearch = 0;
  }
  [(CUIKLocationSearchModel *)self resetContactsSearchResults];
  [(CUIKLocationSearchModel *)self resetEventsSearchResults];
  [(CUIKLocationSearchModel *)self resetConferenceRoomSearchResults];
  [(CUIKLocationSearchModel *)self resetRecentsSearchResults];
  locationFromMapsURL = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  mapCompletionSearchResults = self->_mapCompletionSearchResults;
  self->_mapCompletionSearchResults = 0;

  frequentsSearchResults = self->_frequentsSearchResults;
  self->_frequentsSearchResults = 0;

  virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  self->_virtualConferenceRoomSearchResults = 0;

  virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
  self->_virtualConferenceCustomSearchResults = 0;

  if (v3)
  {
    uint64_t v12 = [(CUIKLocationSearchModel *)self delegate];
    [v12 locationSearchModel:self updatedSearchTypes:2047];
  }
}

- (void)cancelSearch
{
  [(CUIKLocationSearchModel *)self resetSearchResults:1];
  v2 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_INFO, "Location search cancelled", v3, 2u);
  }
}

- (void)beginSearchForTerm:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainSearch"];
  id v5 = ICSRedactString();
  uint64_t v6 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Location search begins!!", (uint8_t *)&v21, 0xCu);
  }

  [(CUIKLocationSearchModel *)self resetSearchResults:0];
  [(CUIKLocationSearchModel *)self getCurrentLocation];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 4) != 0)
  {
    if (!self->_completer)
    {
      id v8 = (MKLocalSearchCompleter *)objc_alloc_init((Class)EKWeakLinkClass());
      completer = self->_completer;
      self->_completer = v8;

      [(MKLocalSearchCompleter *)self->_completer setDelegate:self];
      [(MKLocalSearchCompleter *)self->_completer setEntriesType:0];
      currentLocation = self->_currentLocation;
      if (currentLocation)
      {
        uint64_t v11 = [(EKStructuredLocation *)currentLocation geoLocation];
        [(MKLocalSearchCompleter *)self->_completer setDeviceLocation:v11];
      }
      else if (self->_currentImpreciseLocation)
      {
        -[MKLocalSearchCompleter setDeviceLocation:](self->_completer, "setDeviceLocation:");
      }
    }
    uint64_t v12 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1BDF08000, v12, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit", (uint8_t *)&v21, 0xCu);
    }

    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainMapCompletions"];
    [(MKLocalSearchCompleter *)self->_completer setFragment:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    if ((supportedSearchTypes & 2) == 0)
    {
LABEL_5:
      if ((supportedSearchTypes & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((supportedSearchTypes & 2) == 0)
  {
    goto LABEL_5;
  }
  dispatch_queue_t v13 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1BDF08000, v13, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit from URL", (uint8_t *)&v21, 0xCu);
  }

  [(CUIKLocationSearchModel *)self _updateMapURL:v4];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 8) == 0)
  {
LABEL_6:
    if ((supportedSearchTypes & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_21:
  v14 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1BDF08000, v14, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Contacts", (uint8_t *)&v21, 0xCu);
  }

  [(CUIKLocationSearchModel *)self updateContacts:v4];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x10) == 0)
  {
LABEL_7:
    if ((supportedSearchTypes & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_24:
  v15 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1BDF08000, v15, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Recents", (uint8_t *)&v21, 0xCu);
  }

  [(CUIKLocationSearchModel *)self updateRecents:v4];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x20) == 0)
  {
LABEL_8:
    if ((supportedSearchTypes & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
LABEL_27:
  v16 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1BDF08000, v16, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Frequents", (uint8_t *)&v21, 0xCu);
  }

  [(CUIKLocationSearchModel *)self searchFrequentLocations:v4];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x100) != 0)
  {
LABEL_30:
    v17 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1BDF08000, v17, OS_LOG_TYPE_INFO, "[%{public}@] >>>> ConferenceRooms", (uint8_t *)&v21, 0xCu);
    }

    [(CUIKLocationSearchModel *)self searchConferenceRooms:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
LABEL_33:
  if ((supportedSearchTypes & 0xC0) != 0)
  {
    v18 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1BDF08000, v18, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Events", (uint8_t *)&v21, 0xCu);
    }

    [(CUIKLocationSearchModel *)self updateEventLocations:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x200) != 0)
  {
    v19 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1BDF08000, v19, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Rooms", (uint8_t *)&v21, 0xCu);
    }

    [(CUIKLocationSearchModel *)self updateVirtualConferenceRoomOptions:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x400) != 0)
  {
    v20 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1BDF08000, v20, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Custom", (uint8_t *)&v21, 0xCu);
    }

    [(CUIKLocationSearchModel *)self _updateVirtualConferenceCustomOptions:v4];
  }
  [(CUIKLocationSearchModel *)self _decrementPendingOperationsCountForDomain:@"OperationDomainSearch"];
}

- (unint64_t)dedupeResults
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  BOOL v3 = self->_recentsSearchResults;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v42 + 1) + 8 * i) recent];
        id v10 = +[CUIKRecents locationForRecent:v9];

        frequentsSearchResults = self->_frequentsSearchResults;
        if (frequentsSearchResults && [(NSMutableArray *)frequentsSearchResults count])
        {
          uint64_t v12 = self->_frequentsSearchResults;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke;
          v40[3] = &unk_1E6369930;
          id v41 = v10;
          dispatch_queue_t v13 = [(NSMutableArray *)v12 indexesOfObjectsPassingTest:v40];
          v14 = v13;
          if (v13 && [v13 count])
          {
            [(NSMutableArray *)self->_frequentsSearchResults removeObjectsAtIndexes:v14];
            v6 |= 0x20uLL;
          }
        }
        else
        {
          v14 = 0;
        }
        eventsSearchResults = self->_eventsSearchResults;
        if (eventsSearchResults && [(NSMutableArray *)eventsSearchResults count])
        {
          v16 = self->_eventsSearchResults;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke_2;
          v38[3] = &unk_1E6369958;
          id v39 = v10;
          v17 = [(NSMutableArray *)v16 indexesOfObjectsPassingTest:v38];

          if (v17 && [v17 count])
          {
            [(NSMutableArray *)self->_eventsSearchResults removeObjectsAtIndexes:v17];
            v6 |= 0x40uLL;
          }
        }
        else
        {
          v17 = v14;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v18 = self->_frequentsSearchResults;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v52 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = self->_eventsSearchResults;
        if (v23)
        {
          uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          if ([(NSMutableArray *)v23 count])
          {
            v25 = self->_eventsSearchResults;
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __40__CUIKLocationSearchModel_dedupeResults__block_invoke_3;
            v33[3] = &unk_1E6369958;
            v33[4] = v24;
            uint64_t v26 = [(NSMutableArray *)v25 indexesOfObjectsPassingTest:v33];
            v27 = v26;
            if (v26 && [v26 count])
            {
              [(NSMutableArray *)self->_eventsSearchResults removeObjectsAtIndexes:v27];
              v6 |= 0x40uLL;
            }
          }
        }
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v52 count:16];
    }
    while (v20);
  }

  CFBooleanRef v28 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    CFBooleanRef v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_recentsSearchResults, "count"));
    id v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventsSearchResults, "count"));
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frequentsSearchResults, "count"));
    *(_DWORD *)buf = 138543874;
    v47 = v29;
    __int16 v48 = 2114;
    v49 = v30;
    __int16 v50 = 2114;
    v51 = v31;
    _os_log_impl(&dword_1BDF08000, v28, OS_LOG_TYPE_INFO, "After de-duping search results, Recents: %{public}@, Events: %{public}@, Frequents: %{public}@", buf, 0x20u);
  }
  return v6;
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToLocation:a2];
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 location];
  uint64_t v4 = [v2 isEqualToLocation:v3];

  return v4;
}

uint64_t __40__CUIKLocationSearchModel_dedupeResults__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 location];
  uint64_t v4 = [v2 isEqualToLocation:v3];

  return v4;
}

- (void)completerDidUpdateResults:(id)a3 finished:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(CUIKLocationSearchModel *)self _decrementPendingOperationsCountForDomain:@"OperationDomainMapCompletions"];
  unint64_t v6 = [v5 queryFragment];
  uint64_t v7 = ICSRedactString();

  int v8 = [v5 resultsAreCurrent];
  uint64_t v9 = +[CUIKLogSubsystem locationSearch];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = NSNumber;
      uint64_t v12 = [v5 results];
      dispatch_queue_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      int v16 = 138543618;
      v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1BDF08000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit %{public}@ results", (uint8_t *)&v16, 0x16u);
    }
    v14 = [v5 results];
    mapCompletionSearchResults = self->_mapCompletionSearchResults;
    self->_mapCompletionSearchResults = v14;

    uint64_t v9 = [(CUIKLocationSearchModel *)self delegate];
    [v9 locationSearchModel:self updatedSearchTypes:4];
  }
  else if (v10)
  {
    int v16 = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1BDF08000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit but results are not current", (uint8_t *)&v16, 0xCu);
  }
}

- (void)completerDidFail:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(CUIKLocationSearchModel *)self _decrementPendingOperationsCountForDomain:@"OperationDomainMapCompletions"];
  int v8 = [v7 queryFragment];

  uint64_t v9 = ICSRedactString();

  BOOL v10 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] MapKit failed with error: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)updateContacts:(id)a3
{
  id v4 = a3;
  [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainContacts"];
  __int16 v18 = ICSRedactString();
  [(CUIKLocationSearchModel *)self resetContactsSearchResults];
  id v5 = (NSMutableArray *)objc_opt_new();
  contactsSearchResults = self->_contactsSearchResults;
  self->_contactsSearchResults = v5;

  id v7 = [(CUIKLocationSearchModel *)self delegate];
  [v7 locationSearchModel:self updatedSearchTypes:8];

  int v8 = CUIKDescriptorForRequiredKeysForLabeledDisplayString();
  uint64_t v9 = [v8 arrayByAddingObject:*MEMORY[0x1E4F1AF10]];

  BOOL v10 = (void *)[objc_alloc((Class)EKWeakLinkClass()) initWithKeysToFetch:v9];
  int v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingFullTextSearch:v4 containerIdentifiers:0 groupIdentifiers:0];
  [v10 setPredicate:v11];

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__3;
  v42[4] = __Block_byref_object_dispose__3;
  id v43 = (id)objc_opt_new();
  uint64_t v36 = 0;
  long long v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke;
  v31[3] = &unk_1E6369980;
  v31[4] = v34;
  uint64_t v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v31 block:0.33];
  contactStore = self->_contactStore;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_2;
  v25[3] = &unk_1E63699D0;
  CFBooleanRef v28 = v32;
  CFBooleanRef v29 = v34;
  v27 = v42;
  v25[4] = self;
  id v26 = v18;
  id v30 = &v36;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_126;
  v19[3] = &unk_1E6369A20;
  id v14 = v26;
  id v20 = v14;
  uint64_t v21 = self;
  uint64_t v23 = v42;
  uint64_t v24 = &v36;
  id v15 = v12;
  id v22 = v15;
  int v16 = [(CNContactStore *)contactStore executeFetchRequest:v10 progressiveResults:v25 completion:v19];
  contactsSearchToken = self->_contactsSearchToken;
  self->_contactsSearchToken = v16;

  objc_storeStrong(v37 + 5, v16);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(v42, 8);
}

uint64_t __42__CUIKLocationSearchModel_updateContacts___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = a2;
  uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v3;
        id v4 = *(void **)(*((void *)&v35 + 1) + 8 * v3);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v5 = [v4 postalAddresses];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v32 != v8) {
                objc_enumerationMutation(v5);
              }
              BOOL v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              int v11 = (void *)MEMORY[0x1E4F1BA88];
              uint64_t v12 = [v10 value];
              __int16 v13 = [v11 stringFromPostalAddress:v12 style:0];

              id v14 = [MEMORY[0x1E4F25630] locationWithTitle:v13];
              id v15 = [v10 label];
              int v16 = +[CUIKContactDescriptionGenerator CUIKLabeledDisplayStringForContact:v4 label:v15];
              [v14 setContactLabel:v16];

              [v14 setAddress:v13];
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v25);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= 0xA)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v17 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    [*(id *)(a1 + 32) _incrementPendingOperationsCountForDomain:@"OperationDomainContacts"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_3;
    block[3] = &unk_1E63699A8;
    uint64_t v21 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v28 = v21;
    id v29 = v17;
    uint64_t v30 = *(void *)(a1 + 72);
    id v22 = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __42__CUIKLocationSearchModel_updateContacts___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainContacts"];
  v2 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ progressive results", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) _updateContactsSearchWithResults:*(void *)(a1 + 48) forToken:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_126(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CUIKLocationSearchModel_updateContacts___block_invoke_2_127;
  block[3] = &unk_1E63699F8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v3;
  uint64_t v10 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__CUIKLocationSearchModel_updateContacts___block_invoke_2_127(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ results", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 40) _decrementPendingOperationsCountForDomain:@"OperationDomainContacts"];
  [*(id *)(a1 + 40) _updateContactsSearchWithResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forToken:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 48) invalidate];
  long long v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5 == *(void **)(v6 + 80))
  {
    *(void *)(v6 + 80) = 0;
  }
}

- (void)_updateContactsSearchWithResults:(id)a3 forToken:(id)a4
{
  if (self->_contactsSearchToken == a4)
  {
    [(NSMutableArray *)self->_contactsSearchResults addObjectsFromArray:a3];
    id v5 = [(CUIKLocationSearchModel *)self delegate];
    [v5 locationSearchModel:self updatedSearchTypes:8];
  }
}

- (void)updateRecents:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((self->_supportedSearchTypes & 0x10) != 0)
  {
    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainRecents"];
    if (v4)
    {
      uint64_t v27 = EKWeakLinkStringConstant();
      uint64_t v26 = EKWeakLinkStringConstant();
      uint64_t v25 = EKWeakLinkStringConstant();
      uint64_t v24 = EKWeakLinkStringConstant();
      id v5 = (void *)EKWeakLinkClass();
      uint64_t v35 = v27;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      int v7 = [v5 predicateForKey:v26 inCollection:v6];
      v36[0] = v7;
      uint64_t v8 = [v5 predicateForKey:v25 matchingText:v4 comparison:1];
      v34[0] = v8;
      __int16 v9 = [v5 predicateForKey:v24 matchingText:v4 comparison:1];
      v34[1] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
      uint64_t v11 = [v5 predicateSatisfyingAnySubpredicate:v10];
      v36[1] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      __int16 v13 = [v5 predicateSatisfyingAllSubpredicates:v12];

      id v14 = v27;
    }
    else
    {
      id v14 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BDF08000, v14, OS_LOG_TYPE_INFO, "Recents query is nil, returning all recents", (uint8_t *)&buf, 2u);
      }
      __int16 v13 = 0;
    }

    if (!self->_recentsQueue)
    {
      id v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.recents", 0);
      recentsQueue = self->_recentsQueue;
      self->_recentsQueue = v15;
    }
    objc_initWeak(&buf, self);
    id v17 = (void *)EKWeakLinkClass();
    id v18 = (objc_class *)EKWeakLinkClass();
    id v19 = objc_alloc_init(v18);
    [v19 setSearchPredicate:v13];
    [v19 setDomains:&unk_1F18921C8];
    id v20 = [(objc_class *)v18 frecencyComparator];
    [v19 setComparator:v20];

    objc_storeStrong((id *)&self->_currentRecentsSearch, v19);
    uint64_t v21 = [v17 defaultInstance];
    id v22 = self->_recentsQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke;
    v28[3] = &unk_1E6369AE8;
    objc_copyWeak(v32, &buf);
    id v23 = v19;
    id v29 = v23;
    uint64_t v30 = self;
    v32[1] = v17;
    id v31 = v4;
    [v21 performRecentsSearch:v23 queue:v22 completion:v28];

    objc_destroyWeak(v32);
    objc_destroyWeak(&buf);
  }
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [*(id *)(a1 + 32) isEqual:WeakRetained[16]])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_2;
    v6[3] = &unk_1E6369AC0;
    v6[4] = *(void *)(a1 + 40);
    id v5 = v3;
    uint64_t v11 = *(void *)(a1 + 64);
    id v7 = v5;
    uint64_t v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v25 = [v2 sourceForSearchModel:*(void *)(a1 + 32)];

  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  group = dispatch_group_create();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    id v23 = v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (!+[CUIKRecents recentIsDirectoryLocation:](CUIKRecents, "recentIsDirectoryLocation:", v8, v23))goto LABEL_19; {
        id v9 = objc_alloc_init(CUIKConferenceRoom);
        }
        id v10 = objc_alloc_init(MEMORY[0x1E4F25520]);
        [(CUIKConferenceRoom *)v9 setLocation:v10];

        uint64_t v11 = [v8 displayName];
        uint64_t v12 = [(CUIKConferenceRoom *)v9 location];
        [v12 setDisplayName:v11];

        __int16 v13 = [*(id *)(a1 + 32) delegate];
        int v14 = [v13 shouldIncludeConferenceRoom:v9];

        if (+[CUIKRecents recentDirectoryLocation:v8 matchesSource:v25])
        {
          if (v14)
          {
LABEL_19:
            if (+[CUIKRecents recentMissingStyleAttributes:v8])
            {
              id v15 = +[CUIKRecents mapKitHandleForRecent:v8];
              if (v15)
              {
                dispatch_group_enter(group);
                int v16 = (void *)MEMORY[0x1E4F30F08];
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v36[0] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_3;
                v36[1] = &unk_1E6369A48;
                id v37 = v27;
                long long v38 = v8;
                uint64_t v41 = *(void *)(a1 + 72);
                id v15 = v15;
                id v39 = v15;
                v40 = group;
                [v16 _mapItemFromHandle:v15 completionHandler:v35];
              }
            }
            else
            {
              id v15 = +[CUIKRecents mapKitStyleAttributesForRecent:v8];
              os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
              id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "contactID"));
              [v27 setObject:v15 forKeyedSubscript:v17];

              os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
            }

            [v3 addObject:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v5);
  }

  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = *(NSObject **)(v18 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_151;
  block[3] = &unk_1E6369A98;
  id v29 = group;
  id v30 = v3;
  id v31 = v27;
  uint64_t v32 = v18;
  id v33 = *(id *)(a1 + 56);
  id v34 = *(id *)(a1 + 64);
  id v20 = v27;
  id v21 = v3;
  id v22 = group;
  dispatch_async(v19, block);
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
    id v7 = [v5 _styleAttributes];
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "contactID"));
    [v8 setObject:v7 forKeyedSubscript:v9];

    os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v5 _styleAttributes];
    uint64_t v12 = +[CUIKRecents recentEventWithRecentContact:v10 styleAttributes:v11];

    __int16 v13 = [*(id *)(a1 + 64) defaultInstance];
    v20[0] = v12;
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v13 recordContactEvents:v14 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];
  }
  else
  {
    uint64_t v12 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1BDF08000, v12, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when updating recents: %@, %@", (uint8_t *)&v16, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_151(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v2, v3))
  {
    uint64_t v4 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", buf, 2u);
    }
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        uint64_t v11 = objc_alloc_init(CUIKRecentContactWithImage);
        [(CUIKRecentContactWithImage *)v11 setRecent:v10];
        os_unfair_lock_lock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
        uint64_t v12 = *(void **)(a1 + 48);
        __int16 v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "contactID"));
        int v14 = [v12 objectForKey:v13];

        os_unfair_lock_unlock((os_unfair_lock_t)&OperationDomainVirtualConferencesCustom_block_invoke_dictionaryLock);
        uint64_t v15 = [*(id *)(a1 + 56) _imageForAttributes:v14];
        [(CUIKRecentContactWithImage *)v11 setImage:v15];

        [v5 addObject:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CUIKLocationSearchModel_updateRecents___block_invoke_153;
  block[3] = &unk_1E6369A70;
  id v16 = *(id *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 56);
  id v21 = v16;
  uint64_t v22 = v17;
  id v23 = v5;
  id v24 = *(id *)(a1 + 72);
  id v18 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__CUIKLocationSearchModel_updateRecents___block_invoke_153(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 128)];
  dispatch_time_t v3 = *(id **)(a1 + 40);
  if (v2)
  {
    [v3[22] removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 176) addObjectsFromArray:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 56))
    {
      uint64_t v4 = ICSRedactString();
      id v5 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "count"));
        int v9 = 138543618;
        uint64_t v10 = v4;
        __int16 v11 = 2114;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Recents %{public}@ results", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      uint64_t v4 = +[CUIKLogSubsystem locationSearch];
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        uint64_t v7 = [*(id *)(a1 + 40) dedupeResults] | 0x10;
        [*(id *)(a1 + 40) _decrementPendingOperationsCountForDomain:@"OperationDomainRecents"];
        uint64_t v8 = [*(id *)(a1 + 40) delegate];
        [v8 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:v7];

        return;
      }
      id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "count"));
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_INFO, "Returning all Recents %{public}@ results", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_11;
  }

  [v3 _decrementPendingOperationsCountForDomain:@"OperationDomainRecents"];
}

- (id)_imageForMapHandle:(id)a3
{
  id v3 = a3;
  if (!v3
    || ([(id)_mapItemCache objectForKey:v3],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        CUIKImageForMapItem(v4),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v5 = CUIKMapPinImage();
  }

  return v5;
}

- (id)_imageForAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3 || (CUIKImageForAttributes(v3), (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = CUIKMapPinImage();
  }

  return v5;
}

- (void)searchFrequentLocations:(id)a3
{
  id v4 = a3;
  [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainFrequents"];
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F25658];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke;
  v7[3] = &unk_1E6369B10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 estimateGeolocationFromHistoricDevicePositionAtLocation:v6 withCompletionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke_2;
    v9[3] = &unk_1E6369A70;
    v9[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __51__CUIKLocationSearchModel_searchFrequentLocations___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(*(void *)(a1 + 32) + 184);
  if (v2)
  {
    [v2 removeAllObjects];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 184);
    *(void *)(v4 + 184) = v3;
  }
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 48))
  {
    id v6 = [MEMORY[0x1E4F25630] locationWithTitle:*(void *)(a1 + 56)];
    [v6 setGeoLocation:*(void *)(a1 + 40)];
    [v6 setAddress:0];
    [*(id *)(*(void *)(a1 + 32) + 184) addObject:v6];
  }
  uint64_t v7 = ICSRedactString();
  id v8 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSNumber;
    id v10 = [*(id *)(a1 + 32) frequentsSearchResults];
    id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1BDF08000, v8, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Frequents %{public}@ results", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) dedupeResults] | 0x20;
  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainFrequents"];
  uint64_t v13 = [*(id *)(a1 + 32) delegate];
  [v13 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:v12];
}

- (id)splitEventLocations:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v22 = [v3 structuredLocationWithoutPrediction];
  uint64_t v4 = [v3 preferredLocationWithoutPrediction];
  id v5 = [v4 title];
  id v6 = [v5 componentsSeparatedByString:@"; "];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v20 = v3;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = [v3 attendees];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = v24;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
LABEL_8:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v25 + 1) + 8 * v16) name];
            char v18 = [v17 isEqualToString:v11];

            if (v18) {
              break;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v14) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          if (v22) {
            [v22 duplicate];
          }
          else {
          id v12 = [MEMORY[0x1E4F25630] locationWithTitle:v11];
          }
          [v12 setTitle:v11];
          [v21 addObject:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  return v21;
}

- (void)updateEventLocations:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_1F187C430] & 1) == 0 && self->_eventStore)
  {
    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainEvents"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [(EKEventStore *)self->_eventStore readWriteCalendarsForEntityType:0];
    uint64_t v8 = [v6 setWithArray:v7];

    uint64_t v9 = (void *)MEMORY[0x1E4F255A0];
    eventStore = self->_eventStore;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke;
    v19[3] = &unk_1E6369C28;
    id v20 = v5;
    id v21 = self;
    uint64_t v11 = [v9 searchWithCalendars:v8 searchTerm:v20 store:eventStore callback:v19];
    eventsSearch = self->_eventsSearch;
    self->_eventsSearch = v11;

    if (!self->_eventsQueue)
    {
      uint64_t v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.eventslocation", 0);
      eventsQueue = self->_eventsQueue;
      self->_eventsQueue = v13;
    }
    objc_initWeak(&location, self->_eventsSearch);
    uint64_t v15 = self->_eventsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_178;
    block[3] = &unk_1E6369C78;
    objc_copyWeak(&v17, &location);
    void block[4] = self;
    dispatch_async(v15, block);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ICSRedactString();
  id v5 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)id buf = 138543618;
    char v18 = v4;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ match results", buf, 0x16u);
  }
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(NSObject **)(v8 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_167;
  block[3] = &unk_1E6369C00;
  void block[4] = v8;
  id v13 = v4;
  id v10 = v7;
  id v14 = v10;
  id v15 = *(id *)(a1 + 32);
  id v16 = v10;
  id v11 = v4;
  dispatch_async(v9, block);
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_167(uint64_t a1)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
  ICSRedactString();
  long long v38 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  char v2 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    *(_DWORD *)id buf = 138543874;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    v96 = v38;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Processing %{public}@ match results, events search text = %{public}@", buf, 0x20u);
  }
  *(void *)id buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v96 = __Block_byref_object_copy__3;
  v97 = __Block_byref_object_dispose__3;
  id v98 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__3;
  v90 = __Block_byref_object_dispose__3;
  id v91 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  char v85 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_168;
  block[3] = &unk_1E6369B38;
  uint64_t v5 = a1;
  void block[4] = *(void *)(a1 + 32);
  id v78 = *(id *)(a1 + 56);
  v79 = &v82;
  v80 = buf;
  v81 = &v86;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (*((unsigned char *)v83 + 24))
  {
    [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainEvents"];
  }
  else
  {
    group = dispatch_group_create();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = *(id *)(a1 + 64);
    uint64_t v41 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v74 != v40) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          uint64_t v7 = objc_msgSend(v6, "objectForKey:", CUIKOccurrenceInfoEventKey, v38);
          if (!v7)
          {
            uint64_t v8 = [v6 objectForKey:CUIKOccurrenceInfoObjectIDKey];
            uint64_t v9 = [v6 objectForKey:CUIKOccurrenceInfoDateKey];
            uint64_t v10 = [*(id *)(*(void *)(v5 + 32) + 112) eventForObjectID:v8 occurrenceDate:v9 checkValid:0];

            uint64_t v5 = a1;
            uint64_t v7 = v10;
          }
          long long v42 = (void *)v7;
          id v11 = objc_msgSend(*(id *)(v5 + 32), "splitEventLocations:");
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v69 objects:v93 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v70 != v14) {
                  objc_enumerationMutation(v12);
                }
                id v16 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                id v17 = [v16 geoLocation];

                if (v17)
                {
                  *(void *)v65 = 0;
                  v66 = v65;
                  uint64_t v67 = 0x2020000000;
                  char v68 = 1;
                  char v18 = *(void **)(*(void *)&buf[8] + 40);
                  v64[0] = MEMORY[0x1E4F143A8];
                  v64[1] = 3221225472;
                  v64[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_169;
                  v64[3] = &unk_1E6369B60;
                  v64[4] = v16;
                  v64[5] = v65;
                  [v18 enumerateObjectsUsingBlock:v64];
                  if (v16 && v66[24])
                  {
                    __int16 v19 = [v16 mapKitHandle];
                    if (v19)
                    {
                      id v20 = [(id)_mapItemCache objectForKey:v19];
                      BOOL v21 = v20 == 0;

                      if (v21)
                      {
                        dispatch_group_enter(group);
                        uint64_t v22 = (void *)MEMORY[0x1E4F30F08];
                        v60[0] = MEMORY[0x1E4F143A8];
                        v60[1] = 3221225472;
                        v60[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2;
                        v60[3] = &unk_1E6369B88;
                        id v23 = v19;
                        id v61 = v23;
                        v62 = v16;
                        v63 = group;
                        [v22 _mapItemFromHandle:v23 completionHandler:v60];
                      }
                    }
                    id v24 = objc_alloc_init(CUIKStructuredLocationWithImage);
                    [(CUIKStructuredLocationWithImage *)v24 setLocation:v16];
                    [*(id *)(*(void *)&buf[8] + 40) addObject:v24];
                  }
                }
                else
                {
                  *(void *)v65 = 0;
                  v66 = v65;
                  uint64_t v67 = 0x2020000000;
                  char v68 = 1;
                  long long v25 = (void *)v87[5];
                  v59[0] = MEMORY[0x1E4F143A8];
                  v59[1] = 3221225472;
                  v59[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_172;
                  v59[3] = &unk_1E6369BB0;
                  v59[4] = v16;
                  v59[5] = v65;
                  [v25 enumerateObjectsUsingBlock:v59];
                  if (v16 && v66[24]) {
                    [(id)v87[5] addObject:v16];
                  }
                }
                _Block_object_dispose(v65, 8);
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v69 objects:v93 count:16];
            }
            while (v13);
          }

          uint64_t v5 = a1;
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
      }
      while (v41);
    }

    dispatch_time_t v26 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(group, v26))
    {
      long long v27 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1BDF08000, v27, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", v65, 2u);
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v28 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v92 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = *(void **)(*((void *)&v55 + 1) + 8 * k);
          id v33 = objc_msgSend(v32, "location", v38);
          id v34 = [v33 mapKitHandle];

          uint64_t v35 = [*(id *)(a1 + 32) _imageForMapHandle:v34];
          [v32 setImage:v35];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v92 count:16];
      }
      while (v29);
    }

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_174;
    v50[3] = &unk_1E6369B38;
    v50[4] = *(void *)(a1 + 32);
    id v51 = *(id *)(a1 + 56);
    v52 = &v82;
    v53 = buf;
    uint64_t v54 = &v86;
    long long v36 = MEMORY[0x1E4F14428];
    dispatch_sync(MEMORY[0x1E4F14428], v50);

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_175;
    v46[3] = &unk_1E6369BD8;
    uint64_t v37 = *(void *)(a1 + 32);
    v49 = &v82;
    v46[4] = v37;
    id v47 = *(id *)(a1 + 56);
    id v48 = *(id *)(a1 + 48);
    dispatch_async(v36, v46);
  }
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(buf, 8);
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_168(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1[4] + 120) searchTerm];
  char v3 = [v2 isEqualToString:a1[5]];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1[4] + 192);
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v6 = a1[4];
      uint64_t v7 = *(void **)(v6 + 192);
      *(void *)(v6 + 192) = v5;

      uint64_t v4 = *(void *)(a1[4] + 192);
    }
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
    uint64_t v9 = *(void *)(a1[7] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(a1[4] + 256);
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void **)(v13 + 256);
      *(void *)(v13 + 256) = v12;

      uint64_t v11 = *(void *)(a1[4] + 256);
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
    uint64_t v16 = *(void *)(a1[8] + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    char v18 = ICSRedactString();
    __int16 v19 = [*(id *)(a1[4] + 120) searchTerm];
    id v20 = ICSRedactString();

    BOOL v21 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138543618;
      id v23 = v18;
      __int16 v24 = 2114;
      long long v25 = v20;
      _os_log_impl(&dword_1BDF08000, v21, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before processing matches because query changed, events search text = %{public}@", (uint8_t *)&v22, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_169(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 location];
  LODWORD(v6) = [v6 isEqualToLocation:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [(id)_mapItemCache setObject:a2 forKey:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 40) mapKitHandle];
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when fetching event locations: %@, %@", (uint8_t *)&v8, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToLocation:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_174(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1[4] + 120) searchTerm];
  char v3 = [v2 isEqualToString:a1[5]];

  if (v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1[7] + 8) + 40) mutableCopy];
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v4;

    uint64_t v7 = [*(id *)(*(void *)(a1[8] + 8) + 40) mutableCopy];
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 256);
    *(void *)(v8 + 256) = v7;
  }
  else
  {
    __int16 v10 = ICSRedactString();
    id v11 = [*(id *)(a1[4] + 120) searchTerm];
    uint64_t v12 = ICSRedactString();

    uint64_t v13 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v12;
      _os_log_impl(&dword_1BDF08000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before setting results because query changed, events search text = %{public}@", (uint8_t *)&v14, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_175(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_2;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

  if (v5)
  {
    if (![*(id *)(a1 + 48) count])
    {
      uint64_t v6 = ICSRedactString();
      uint64_t v7 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "count"));
        int v16 = 138543618;
        id v17 = v6;
        __int16 v18 = 2114;
        __int16 v19 = v8;
        _os_log_impl(&dword_1BDF08000, v7, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ results", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v2 = [*(id *)(a1 + 32) dedupeResults] | 0xC0;

      goto LABEL_3;
    }
LABEL_2:
    uint64_t v2 = 192;
LABEL_3:
    if (![*(id *)(a1 + 48) count]) {
      [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainEvents"];
    }
    char v3 = [*(id *)(a1 + 32) delegate];
    [v3 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:v2];
    goto LABEL_6;
  }
  char v3 = ICSRedactString();
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
  __int16 v10 = ICSRedactString();

  id v11 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = v3;
    __int16 v18 = 2114;
    __int16 v19 = v10;
    _os_log_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before updating results because query changed, events search text = %{public}@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 192);
  *(void *)(v12 + 192) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 256);
  *(void *)(v14 + 256) = 0;

  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainEvents"];
LABEL_6:
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained run];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2_179;
    block[3] = &unk_1E6369C50;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __48__CUIKLocationSearchModel_updateEventLocations___block_invoke_2_179(uint64_t a1)
{
  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainEvents"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 272));
  [WeakRetained locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:64];
}

- (NSArray)conferenceRoomSearchResults
{
  return (NSArray *)self->_mutableConferenceRoomSearchResults;
}

- (void)searchConferenceRooms:(id)a3
{
  id v4 = a3;
  [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke;
  v6[3] = &unk_1E6369CC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = [v2 sourceForSearchModel:*(void *)(a1 + 32)];

  id v4 = [v3 constraints];
  char v5 = [v4 supportsLocationDirectorySearches];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = v6[18];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_180;
    block[3] = &unk_1E6369D18;
    uint64_t v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    id v14 = v3;
    dispatch_async(v7, block);

    __int16 v10 = v12;
  }
  else
  {
    [v6 _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
    __int16 v10 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_DEBUG, "The source for the search model's event does not support location directory searches.  Will not search for conference rooms.", buf, 2u);
    }
  }
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_180(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) componentsSeparatedByCharactersInSet:*(void *)(*(void *)(a1 + 40) + 136)];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F25530]);
  [v4 setTerms:v3];
  [v4 setFindLocations:1];
  char v5 = +[CUIKPreferences sharedPreferences];
  uint64_t v6 = [v5 locationSearchResultLimit];

  objc_msgSend(v4, "setResultLimit:", objc_msgSend(v6, "unsignedIntegerValue"));
  objc_initWeak(&location, *(id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2;
  aBlock[3] = &unk_1E6369CA0;
  objc_copyWeak(&v20, &location);
  id v19 = 0;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F25528]) initWithSource:*(void *)(a1 + 48) query:v4 resultsBlock:v7];
  objc_initWeak(&from, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_3;
  v14[3] = &unk_1E6369CF0;
  objc_copyWeak(&v16, &from);
  v14[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v15 = v9;
  [v8 setCompletionBlock:v14];
  [*(id *)(*(void *)(a1 + 40) + 152) cancelAllOperations];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2_187;
  block[3] = &unk_1E6369CC8;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  dispatch_sync(MEMORY[0x1E4F14428], block);
  [*(id *)(*(void *)(a1 + 40) + 152) addOperation:v8];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _processDirectorySearchResultSet:v4 forOperation:*(void *)(a1 + 32)];
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_185;
    block[3] = &unk_1E6369CC8;
    uint64_t v8 = WeakRetained;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v4, block);

    char v5 = v8;
  }
  else
  {
    char v5 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1BDF08000, v5, OS_LOG_TYPE_DEBUG, "The directory search operation went away.  Returning early.", buf, 2u);
    }
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_186;
  v6[3] = &unk_1E6369C50;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_185(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) error];
    if (v2)
    {
      char v3 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        uint64_t v9 = (uint64_t)v2;
        id v4 = "Directory search operation completed with error: [%@]";
        char v5 = v3;
        os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_1BDF08000, v5, v6, v4, (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (![*(id *)(a1 + 32) numberOfMatchesExceededLimit])
      {
LABEL_10:

        return;
      }
      char v3 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = [*(id *)(a1 + 40) resultLimit];
        int v8 = 134217984;
        uint64_t v9 = v7;
        id v4 = "Directory search operation completed.  The number of matches exceeded the original result limit of [%tu]";
        char v5 = v3;
        os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_186(uint64_t a1)
{
  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:256];
}

void __49__CUIKLocationSearchModel_searchConferenceRooms___block_invoke_2_187(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 168) removeAllObjects];
  id v2 = ICSRedactString();
  char v3 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "count"));
    int v6 = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_INFO, "[%{public}@] <<<< ConferenceRooms %{public}@ results", (uint8_t *)&v6, 0x16u);
  }
  char v5 = [*(id *)(a1 + 32) delegate];
  [v5 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:256];
}

- (void)_processDirectorySearchResultSet:(id)a3 forOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke;
  block[3] = &unk_1E6369D18;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isCancelled];
  char v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
  }
  else
  {
    id v4 = [v3 delegate];
    char v5 = [v4 sourceForSearchModel:*(void *)(a1 + 40)];

    id v6 = [v5 constraints];
    char v7 = [v6 supportsAvailabilityRequests];

    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2;
    block[3] = &unk_1E6369D68;
    id v9 = *(id *)(a1 + 48);
    char v14 = v7;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_async(v8, block);
  }
}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v3 = [*(id *)(a1 + 32) locations];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3;
  v5[3] = &unk_1E6369D40;
  char v7 = *(unsigned char *)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];

  [*(id *)(a1 + 40) _addDiscoveredConferenceRooms:v4];
}

void __73__CUIKLocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v5 = objc_alloc_init(CUIKConferenceRoom);
  [(CUIKConferenceRoom *)v5 setLocation:v3];

  [(CUIKConferenceRoom *)v5 setAvailability:0];
  [(CUIKConferenceRoom *)v5 setSupportsAvailability:*(unsigned __int8 *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) delegate];
  LODWORD(v3) = [v4 shouldIncludeConferenceRoom:v5];

  if (v3) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)_addDiscoveredConferenceRooms:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke;
  v6[3] = &unk_1E6369CC8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    *(_DWORD *)id buf = 138543362;
    long long v38 = v3;
    _os_log_impl(&dword_1BDF08000, v2, OS_LOG_TYPE_INFO, "<<<< ConferenceRooms %{public}@ results", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 160) addObjectsFromArray:*(void *)(a1 + 32)];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_189;
  aBlock[3] = &__block_descriptor_40_e51_q24__0__CUIKConferenceRoom_8__CUIKConferenceRoom_16l;
  void aBlock[4] = 193;
  id v4 = _Block_copy(aBlock);
  [*(id *)(*(void *)(a1 + 40) + 160) sortWithOptions:16 usingComparator:v4];
  id v5 = [*(id *)(a1 + 40) delegate];
  id v6 = [v5 eventIDForSearchModel:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 40) delegate];
  id v8 = [v7 sourceForSearchModel:*(void *)(a1 + 40)];

  id v9 = [*(id *)(a1 + 40) delegate];
  uint64_t v10 = [v9 dateRangeForSearchModel:*(void *)(a1 + 40)];

  id v11 = [*(id *)(a1 + 40) delegate];
  int v12 = [v11 shouldIssueAvailabilityRequestForSearchModel:*(void *)(a1 + 40)];

  if (!v12)
  {
    int v22 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      id v23 = "Not issuing availability request per delegate.";
      __int16 v24 = v22;
      uint32_t v25 = 2;
LABEL_10:
      _os_log_impl(&dword_1BDF08000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);
    }
LABEL_11:

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 40) _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
    goto LABEL_12;
  }
  uint64_t v13 = [v8 constraints];
  char v14 = [v13 supportsAvailabilityRequests];

  if ((v14 & 1) == 0)
  {
    int v22 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 138412290;
      long long v38 = v8;
      id v23 = "Not issuing availability request because the source does not support it: [%@]";
      __int16 v24 = v22;
      uint32_t v25 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = *(void **)(a1 + 32);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_192;
  v33[3] = &unk_1E6369DB0;
  id v17 = v15;
  uint64_t v18 = *(void *)(a1 + 40);
  id v34 = v17;
  uint64_t v35 = v18;
  [v16 enumerateObjectsUsingBlock:v33];
  uint64_t v19 = *(void *)(a1 + 40);
  id v20 = *(NSObject **)(v19 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2;
  block[3] = &unk_1E6369A98;
  void block[4] = v19;
  id v21 = v17;
  id v28 = v21;
  id v29 = v6;
  id v30 = v8;
  id v31 = v10;
  id v32 = *(id *)(a1 + 32);
  dispatch_async(v20, block);

LABEL_12:
  uint64_t v26 = [*(id *)(a1 + 40) delegate];
  [v26 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];
}

uint64_t __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 location];
  id v7 = [v6 displayName];

  id v8 = [v5 location];

  id v9 = [v8 displayName];

  uint64_t v10 = [v7 compare:v9 options:*(void *)(a1 + 32)];
  return v10;
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_192(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 location];
  id v4 = [v3 preferredAddress];

  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
    [*(id *)(*(void *)(a1 + 40) + 168) setObject:v5 forKey:v4];
    [v5 setAvailabilityRequestInProgress:1];
  }
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3;
  aBlock[3] = &unk_1E6369DD8;
  objc_copyWeak(&v11, &location);
  id v10 = 0;
  id v2 = _Block_copy(aBlock);
  id v3 = [*(id *)(a1 + 32) _availabilityRequestForConferenceRooms:*(void *)(a1 + 40) eventID:*(void *)(a1 + 48) source:*(void *)(a1 + 56) dateRange:*(void *)(a1 + 64) resultsBlock:v2 completionBlock:0];
  objc_initWeak(&from, v3);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5;
  v4[3] = &unk_1E6369E28;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  id v5 = *(id *)(a1 + 72);
  [v3 setCompletionBlock:v4];
  [*(id *)(*(void *)(a1 + 32) + 152) addOperation:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[18];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4;
    block[3] = &unk_1E6369D18;
    void block[4] = WeakRetained;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

uint64_t __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAvailabilityResults:*(void *)(a1 + 40) forOperation:*(void *)(a1 + 48)];
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = v3;
  if (!WeakRetained)
  {
    id v6 = +[CUIKLogSubsystem locationSearch];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_WORD *)id buf = 0;
    id v7 = "self went away.  Returning early.";
LABEL_8:
    _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_9;
  }
  if (!v3)
  {
    [WeakRetained _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
    id v6 = +[CUIKLogSubsystem locationSearch];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_WORD *)id buf = 0;
    id v7 = "The availability operation went away.  Returning early.";
    goto LABEL_8;
  }
  id v5 = WeakRetained[18];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_195;
  block[3] = &unk_1E6369D18;
  id v9 = v3;
  id v10 = a1[4];
  id v11 = WeakRetained;
  dispatch_async(v5, block);

  id v6 = v9;
LABEL_9:
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_195(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) error];
    if (v2)
    {
      id v3 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        id v10 = v2;
        _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_ERROR, "Availability operation completed with error: [%@]", buf, 0xCu);
      }
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_196;
  v6[3] = &unk_1E6369CC8;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_196(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_197;
  v4[3] = &unk_1E6369E00;
  void v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];
  if (*((unsigned char *)v6 + 24))
  {
    [*(id *)(a1 + 40) _decrementPendingOperationsCountForDomain:@"OperationDomainConferenceRooms"];
    id v3 = [*(id *)(a1 + 40) delegate];
    [v3 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];
  }
  _Block_object_dispose(&v5, 8);
}

void __57__CUIKLocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_197(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 availabilityRequestInProgress])
  {
    [v3 setAvailabilityRequestInProgress:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)_availabilityRequestForConferenceRooms:(id)a3 eventID:(id)a4 source:(id)a5 dateRange:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F25608];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [v13 alloc];
  id v21 = [v16 startDate];
  int v22 = [v16 endDate];

  id v23 = (void *)[v20 initWithSource:v17 startDate:v21 endDate:v22 ignoredEventID:v18 addresses:v19 resultsBlock:v15];
  [v23 setCompletionBlock:v14];

  return v23;
}

- (void)updateConferenceRoomAvailability:(id)a3 duringEvent:(id)a4 completionBlock:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke;
  aBlock[3] = &unk_1E6369E50;
  id v9 = v7;
  id v32 = v9;
  id v10 = a5;
  long long v27 = _Block_copy(aBlock);
  uint32_t v25 = v9;
  __int16 v24 = [v9 location];
  id v23 = [v24 preferredAddress];
  v33[0] = v23;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  int v11 = [v8 isDetached];
  if (v11)
  {
    int v22 = [v8 originalItem];
    [v22 uniqueID];
  }
  else
  {
    [v8 uniqueID];
  int v12 = };
  uint64_t v13 = [v8 calendar];
  id v14 = [v13 source];
  id v15 = objc_alloc(MEMORY[0x1E4F576D0]);
  id v16 = [v8 startDate];
  id v17 = [v8 endDate];
  id v18 = (void *)[v15 initWithStartDate:v16 endDate:v17];
  id v19 = [(CUIKLocationSearchModel *)self _availabilityRequestForConferenceRooms:v26 eventID:v12 source:v14 dateRange:v18 resultsBlock:v27 completionBlock:v10];

  if (v11)
  {

    int v12 = v22;
  }

  [v25 setAvailabilityRequestInProgress:1];
  conferenceRoomProcessingQueue = self->_conferenceRoomProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2;
  block[3] = &unk_1E6369CC8;
  void block[4] = self;
  id v30 = v19;
  id v21 = v19;
  dispatch_async(conferenceRoomProcessingQueue, block);
}

void __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 location];
  id v6 = [v5 preferredAddress];
  id v7 = [v4 objectForKey:v6];

  objc_msgSend(*(id *)(a1 + 32), "setAvailability:", objc_msgSend(MEMORY[0x1E4F254B8], "summarizedAvailabilityTypeForSpans:", v7));
  [*(id *)(a1 + 32) setAvailabilityRequestInProgress:0];
}

uint64_t __88__CUIKLocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) addOperation:*(void *)(a1 + 40)];
}

- (void)_handleAvailabilityResults:(id)a3 forOperation:(id)a4
{
  id v6 = a3;
  if (([a4 isCancelled] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke;
    v7[3] = &unk_1E6369CC8;
    id v8 = v6;
    id v9 = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2;
  v4[3] = &unk_1E6369E78;
  void v4[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  id v3 = [*(id *)(a1 + 40) delegate];
  [v3 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];
}

void __67__CUIKLocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F254B8];
  id v6 = a2;
  uint64_t v7 = [v5 summarizedAvailabilityTypeForSpans:a3];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 168) objectForKey:v6];

  [v8 setAvailability:v7];
  [v8 setAvailabilityRequestInProgress:0];
}

- (void)_addLocationToRecents:(id)a3 addressString:(id)a4 mapItem:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 contactLabel];
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v7 title];
  }
  uint64_t v13 = v12;

  if (v8 && v13)
  {
    id v14 = (void *)EKWeakLinkClass();
    id v15 = +[CUIKRecents recentForLocation:v7 withAddressString:v8 andTitle:v13 mapItem:v9];
    id v16 = [v14 defaultInstance];
    v22[0] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v16 recordContactEvents:v17 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];

LABEL_9:
    goto LABEL_10;
  }
  id v15 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v7 title];
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v16;
    _os_log_impl(&dword_1BDF08000, v15, OS_LOG_TYPE_ERROR, "can't add to recents, missing info: %@ %@", (uint8_t *)&v18, 0x16u);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)addConferenceRoomToRecents:(id)a3 fromSource:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)EKWeakLinkClass();
  id v8 = [v6 location];

  id v9 = +[CUIKRecents recentForDirectoryLocation:v8 onSource:v5];

  id v10 = [v7 defaultInstance];
  v12[0] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v10 recordContactEvents:v11 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];
}

- (BOOL)removeRecentLocation:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)EKWeakLinkClass() defaultInstance];
  v13[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  int v7 = [v5 removeRecentContacts:v6 error:0];

  if (v7)
  {
    recentsSearchResults = self->_recentsSearchResults;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__CUIKLocationSearchModel_removeRecentLocation___block_invoke;
    v11[3] = &unk_1E6369EA0;
    id v12 = v4;
    [(NSMutableArray *)self->_recentsSearchResults removeObjectAtIndex:[(NSMutableArray *)recentsSearchResults indexOfObjectPassingTest:v11]];
    id v9 = [(CUIKLocationSearchModel *)self delegate];
    [v9 locationSearchModel:self updatedSearchTypes:16];
  }
  return v7;
}

uint64_t __48__CUIKLocationSearchModel_removeRecentLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 recent];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)selectMapSearchCompletion:(id)a3
{
  id v4 = a3;
  localSearch = self->_localSearch;
  if (localSearch)
  {
    [(MKLocalSearch *)localSearch cancel];
    id v6 = self->_localSearch;
    self->_localSearch = 0;
  }
  int v7 = (void *)EKWeakLinkClass();
  id v8 = (objc_class *)EKWeakLinkClass();
  id v9 = [v7 searchRequestWithCompletion:v4];
  id v10 = (MKLocalSearch *)[[v8 alloc] initWithRequest:v9];
  int v11 = self->_localSearch;
  self->_localSearch = v10;

  id v12 = self->_localSearch;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __53__CUIKLocationSearchModel_selectMapSearchCompletion___block_invoke;
  id v17 = &unk_1E6369EC8;
  id v18 = v4;
  id v19 = self;
  id v13 = v4;
  [(MKLocalSearch *)v12 startWithCompletionHandler:&v14];
  objc_msgSend(v13, "sendFeedback", v14, v15, v16, v17);
}

void __53__CUIKLocationSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  id v6 = [v26 mapItems];
  id v7 = (id)[v6 count];

  if (v7)
  {
    id v8 = (objc_class *)EKWeakLinkClass();
    id v9 = [v26 mapItems];
    id v10 = [v9 firstObject];

    int v11 = [v10 placemark];
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;

    id v16 = (void *)[[v8 alloc] initWithLatitude:v13 longitude:v15];
    id v7 = objc_alloc_init(MEMORY[0x1E4F25630]);
    id v17 = [v10 name];
    [v7 setTitle:v17];

    [v7 setGeoLocation:v16];
    id v18 = [*(id *)(a1 + 32) displayLines];
    id v19 = [v18 lastObject];
    [v7 setAddress:v19];

    __int16 v20 = [v10 placemark];
    id v21 = [v20 region];
    [v21 radius];
    objc_msgSend(v7, "setRadius:");

    int v22 = [v10 _handle];
    [v7 setMapKitHandle:v22];

    id v23 = *(void **)(a1 + 40);
    __int16 v24 = [v7 address];
    [v23 _addLocationToRecents:v7 addressString:v24 mapItem:v10];
  }
  uint32_t v25 = [*(id *)(a1 + 40) delegate];
  [v25 locationSearchModel:*(void *)(a1 + 40) selectedLocation:v7 withError:v5];
}

- (void)selectLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapKitHandle];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F30F08];
    id v7 = [v4 mapKitHandle];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__CUIKLocationSearchModel_selectLocation___block_invoke;
    v18[3] = &unk_1E6369EF0;
    v18[4] = self;
    id v19 = v4;
    id v8 = v4;
    [v6 _mapItemFromHandle:v7 completionHandler:v18];

    id v9 = [(CUIKLocationSearchModel *)self delegate];
    [v9 locationSearchModel:self selectedLocation:v8 withError:0];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F57740];
    int v11 = [v4 title];
    double v12 = [v4 address];
    id v8 = [v10 fullDisplayStringWithTitle:v11 address:v12];

    double v13 = (void *)MEMORY[0x1E4F57718];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__CUIKLocationSearchModel_selectLocation___block_invoke_215;
    v15[3] = &unk_1E6369EF0;
    id v16 = v4;
    id v17 = self;
    id v14 = v4;
    [v13 geocodeLocationString:v8 withCompletionBlock:v15];
  }
}

void __42__CUIKLocationSearchModel_selectLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = [v7 address];
    [v8 _addLocationToRecents:v7 addressString:v9 mapItem:v5];
  }
  else
  {
    id v10 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_ERROR, "Failed to convert mapKitHandle to mapItem in selectLocation: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __42__CUIKLocationSearchModel_selectLocation___block_invoke_215(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1BDF08000, v7, OS_LOG_TYPE_ERROR, "Location search failed with error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) updateFromMapItem:v5];
    id v9 = *(void **)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v10 = [v9 address];
    [v8 _addLocationToRecents:v9 addressString:v10 mapItem:v5];
  }
  int v11 = [*(id *)(a1 + 40) delegate];
  [v11 locationSearchModel:*(void *)(a1 + 40) selectedLocation:*(void *)(a1 + 32) withError:v6];
}

- (void)selectCurrentLocation
{
  geocoder = self->_geocoder;
  if (!geocoder)
  {
    id v4 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
    id v5 = self->_geocoder;
    self->_geocoder = v4;

    geocoder = self->_geocoder;
  }
  if ([(CLGeocoder *)geocoder isGeocoding]) {
    [(CLGeocoder *)self->_geocoder cancelGeocode];
  }
  objc_initWeak(&location, self);
  id v6 = self->_geocoder;
  id v7 = [(EKStructuredLocation *)self->_currentLocation geoLocation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CUIKLocationSearchModel_selectCurrentLocation__block_invoke;
  v8[3] = &unk_1E6369F18;
  objc_copyWeak(&v9, &location);
  [(CLGeocoder *)v6 reverseGeocodeLocation:v7 completionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__CUIKLocationSearchModel_selectCurrentLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1BDF08000, v8, OS_LOG_TYPE_ERROR, "Current Location search failed with error: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (![v5 count])
      {
LABEL_12:
        id v17 = [WeakRetained delegate];
        [v17 locationSearchModel:WeakRetained selectedLocation:WeakRetained[4] withError:0];

        goto LABEL_13;
      }
      id v8 = [v5 firstObject];
      id v9 = [v8 postalAddress];
      id v10 = [v8 name];
      [WeakRetained[4] setTitle:v10];

      if (v9)
      {
        int v11 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v9 style:0];
        [WeakRetained[4] setAddress:v11];

        [WeakRetained[4] setRadius:100.0];
        uint64_t v12 = [WeakRetained[4] title];
        if (!v12
          || (id v13 = (void *)v12,
              [WeakRetained[4] title],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              int v15 = [v14 isEqualToString:&stru_1F187C430],
              v14,
              v13,
              v15))
        {
          id v16 = [WeakRetained[4] address];
          [WeakRetained[4] setTitle:v16];
        }
      }
    }
    goto LABEL_12;
  }
LABEL_13:
}

+ (id)_dataDetector
{
  if (_dataDetector_onceToken != -1) {
    dispatch_once(&_dataDetector_onceToken, &__block_literal_global_220);
  }
  id v2 = (void *)_dataDetector_dataDetector;

  return v2;
}

void __40__CUIKLocationSearchModel__dataDetector__block_invoke()
{
  id v6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:2080 error:&v6];
  id v1 = v6;
  id v2 = (void *)_dataDetector_dataDetector;
  _dataDetector_dataDetector = v0;

  if (_dataDetector_dataDetector) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (!v3)
  {
    id v4 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_ERROR, "Error initializing the custom virtual conference data detector.", v5, 2u);
    }
  }
}

+ (id)_linksInSource:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _dataDetector];
  id v5 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  return v5;
}

+ (id)URLsFromSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(a1, "_linksInSource:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 resultType] == 32)
        {
          uint64_t v12 = [v11 URL];
        }
        else
        {
          if ([v11 resultType] != 2048)
          {
            uint64_t v12 = 0;
            if ((objc_msgSend(0, "cal_hasSchemeMailto") & 1) == 0) {
              continue;
            }
            goto LABEL_14;
          }
          id v13 = [v11 phoneNumber];
          uint64_t v12 = [v13 phoneURL];
        }
        if ((objc_msgSend(v12, "cal_hasSchemeMailto") & 1) == 0)
        {
          if (!v12) {
            continue;
          }
          [v5 addObject:v12];
        }
LABEL_14:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_updateVirtualConferenceCustomOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ((self->_supportedSearchTypes & 0x400) != 0)
  {
    if ([v4 length])
    {
      [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainVirtualConferencesCustom"];
      customConferenceQueue = self->_customConferenceQueue;
      if (!customConferenceQueue)
      {
        uint64_t v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.customConference", 0);
        uint64_t v8 = self->_customConferenceQueue;
        self->_customConferenceQueue = v7;

        customConferenceQueue = self->_customConferenceQueue;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke;
      v14[3] = &unk_1E6369CC8;
      v14[4] = self;
      id v15 = v5;
      dispatch_async(customConferenceQueue, v14);
    }
    else
    {
      virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
      self->_virtualConferenceCustomSearchResults = 0;

      id v10 = ICSRedactString();
      int v11 = +[CUIKLogSubsystem locationSearch];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_virtualConferenceCustomSearchResults, "count"));
        *(_DWORD *)id buf = 138543618;
        long long v17 = v10;
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", buf, 0x16u);
      }
      id v13 = [(CUIKLocationSearchModel *)self delegate];
      [v13 locationSearchModel:self updatedSearchTypes:1024];
    }
  }
}

void __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() URLsFromSource:*(void *)(a1 + 40)];
  id v3 = [v2 CalMap:&__block_literal_global_225];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3;
  block[3] = &unk_1E6369D18;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)MEMORY[0x1E4F25670];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithTitle:0 url:v3];

  id v5 = objc_alloc(MEMORY[0x1E4F25668]);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = (void *)[v5 initWithTitle:0 joinMethods:v6 conferenceDetails:0];

  return v7;
}

void __65__CUIKLocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
  id v2 = ICSRedactString();
  id v3 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "count"));
    int v6 = 138543618;
    id v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) _decrementPendingOperationsCountForDomain:@"OperationDomainVirtualConferencesCustom"];
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:1024];
}

- (void)selectVirtualConferenceRoomType:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKLocationSearchModel *)self delegate];
  id v6 = [v5 sourceForSearchModel:self];

  +[CUIKVirtualConferenceRoomTypeRecents selectRoomType:v4 forSource:v6];
}

- (void)updateVirtualConferenceRoomOptions:(id)a3
{
  id v4 = a3;
  if ((self->_supportedSearchTypes & 0x200) != 0)
  {
    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainVirtualConferences"];
    if (updateVirtualConferenceRoomOptions__onceToken != -1) {
      dispatch_once(&updateVirtualConferenceRoomOptions__onceToken, &__block_literal_global_230);
    }
    if (self->_allPossibleVirtualConferenceRooms)
    {
      [(CUIKLocationSearchModel *)self _updateVirtualConferenceOptions:v4];
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F25678];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2;
      v6[3] = &unk_1E6369C28;
      void v6[4] = self;
      id v7 = v4;
      [v5 virtualConferenceRoomTypesWithCompletion:v6 queue:MEMORY[0x1E4F14428]];
    }
  }
}

uint64_t __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke()
{
  return +[CUIKVirtualConferenceRoomTypeRecents cleanup];
}

uint64_t __62__CUIKLocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithCapacity:10];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v5;

  [*(id *)(a1 + 32) _updateAllPossibleVirtualConferenceResultsWithRoomTypes:v4];
  __int16 v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);

  return [v8 _updateVirtualConferenceOptions:v9];
}

- (void)_updateAllPossibleVirtualConferenceResultsWithRoomTypes:(id)a3
{
  allPossibleVirtualConferenceRooms = self->_allPossibleVirtualConferenceRooms;
  id v5 = a3;
  [(NSMutableArray *)allPossibleVirtualConferenceRooms removeAllObjects];
  uint64_t v6 = [(CUIKLocationSearchModel *)self delegate];
  id v8 = [v6 sourceForSearchModel:self];

  id v7 = +[CUIKVirtualConferenceRoomTypeRecents roomTypesOrderedByMRU:v5 forSource:v8];

  if (v7) {
    [(NSMutableArray *)self->_allPossibleVirtualConferenceRooms addObjectsFromArray:v7];
  }
}

- (void)_updateVirtualConferenceOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  if (!virtualConferenceRoomSearchResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    id v7 = self->_virtualConferenceRoomSearchResults;
    self->_virtualConferenceRoomSearchResults = v6;

    virtualConferenceRoomSearchResults = self->_virtualConferenceRoomSearchResults;
  }
  [(NSMutableArray *)virtualConferenceRoomSearchResults removeAllObjects];
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = self->_allPossibleVirtualConferenceRooms;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "title", (void)v20);
          uint64_t v15 = [v14 rangeOfString:v4 options:1];

          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            [(NSMutableArray *)self->_virtualConferenceRoomSearchResults addObject:v13];
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(NSMutableArray *)self->_virtualConferenceRoomSearchResults addObjectsFromArray:self->_allPossibleVirtualConferenceRooms];
  }
  long long v16 = ICSRedactString();
  long long v17 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_virtualConferenceRoomSearchResults, "count"));
    *(_DWORD *)id buf = 138543618;
    uint32_t v25 = v16;
    __int16 v26 = 2114;
    long long v27 = v18;
    _os_log_impl(&dword_1BDF08000, v17, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Rooms %{public}@ results", buf, 0x16u);
  }
  [(CUIKLocationSearchModel *)self _decrementPendingOperationsCountForDomain:@"OperationDomainVirtualConferences"];
  id v19 = [(CUIKLocationSearchModel *)self delegate];
  [v19 locationSearchModel:self updatedSearchTypes:512];
}

- (void)_updateMapURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ICSRedactString();
  uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x1E4F30F08] _mapItemBackedByURL:v6];
  id v8 = v7;
  if (v7 && ([v7 isCurrentLocation] & 1) == 0)
  {
    uint64_t v12 = objc_alloc_init(CUIKStructuredLocationWithImage);
    locationFromMapsURL = self->_locationFromMapsURL;
    self->_locationFromMapsURL = v12;

    uint64_t v14 = [MEMORY[0x1E4F25630] locationWithMapItem:v8];
    uint64_t v15 = [v8 _geoAddress];
    long long v16 = [v15 formattedAddressLines];
    id v31 = [v16 lastObject];

    [v14 setAddress:v31];
    [(CUIKStructuredLocationWithImage *)self->_locationFromMapsURL setLocation:v14];
    long long v17 = CUIKImageForMapItem(v8);
    [(CUIKStructuredLocationWithImage *)self->_locationFromMapsURL setImage:v17];

    if (([v8 isPlaceHolder] & 1) == 0)
    {
      __int16 v18 = [(CUIKStructuredLocationWithImage *)self->_locationFromMapsURL location];
      [v18 setTitle:0];
    }
    id v19 = [(CUIKStructuredLocationWithImage *)self->_locationFromMapsURL location];
    long long v20 = [v19 address];
    if (v20)
    {
      long long v21 = [(CUIKStructuredLocationWithImage *)self->_locationFromMapsURL location];
      long long v22 = [v21 title];

      if (v22)
      {
        long long v23 = +[CUIKLogSubsystem locationSearch];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          __int16 v24 = [NSNumber numberWithInt:self->_locationFromMapsURL != 0];
          *(_DWORD *)id buf = 138543618;
          long long v36 = v5;
          __int16 v37 = 2114;
          long long v38 = v24;
          _os_log_impl(&dword_1BDF08000, v23, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
        }
        uint32_t v25 = [(CUIKLocationSearchModel *)self delegate];
        [v25 locationSearchModel:self updatedSearchTypes:2];

LABEL_22:
        goto LABEL_8;
      }
    }
    else
    {
    }
    geocoder = self->_geocoder;
    if (!geocoder)
    {
      long long v27 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
      id v28 = self->_geocoder;
      self->_geocoder = v27;

      geocoder = self->_geocoder;
    }
    if ([(CLGeocoder *)geocoder isGeocoding]) {
      [(CLGeocoder *)self->_geocoder cancelGeocode];
    }
    [(CUIKLocationSearchModel *)self _incrementPendingOperationsCountForDomain:@"OperationDomainLocationFromMapsURL"];
    objc_initWeak((id *)buf, self);
    uint64_t v29 = self->_geocoder;
    id v30 = [v14 geoLocation];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    id v32[2] = __41__CUIKLocationSearchModel__updateMapURL___block_invoke;
    void v32[3] = &unk_1E6369F60;
    objc_copyWeak(&v34, (id *)buf);
    id v33 = v5;
    [(CLGeocoder *)v29 reverseGeocodeLocation:v30 completionHandler:v32];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }

LABEL_5:
  uint64_t v9 = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  uint64_t v10 = +[CUIKLogSubsystem locationSearch];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [NSNumber numberWithInt:self->_locationFromMapsURL != 0];
    *(_DWORD *)id buf = 138543618;
    long long v36 = v5;
    __int16 v37 = 2114;
    long long v38 = v11;
    _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
  }
  id v8 = [(CUIKLocationSearchModel *)self delegate];
  [v8 locationSearchModel:self updatedSearchTypes:2];
LABEL_8:
}

void __41__CUIKLocationSearchModel__updateMapURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_17;
  }
  unint64_t v8 = 0x1E6368000uLL;
  if (v6)
  {
    uint64_t v9 = +[CUIKLogSubsystem locationSearch];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v36 = v6;
      _os_log_impl(&dword_1BDF08000, v9, OS_LOG_TYPE_ERROR, "Map URL address geocoding failed failed with error: %@", buf, 0xCu);
    }

    id v10 = WeakRetained[6];
    WeakRetained[6] = 0;

    goto LABEL_14;
  }
  if ([v5 count])
  {
    uint64_t v11 = [v5 firstObject];
    uint64_t v12 = [v11 postalAddress];
    id v13 = [v11 name];
    uint64_t v14 = [WeakRetained[6] location];
    [v14 setTitle:v13];

    if (v12)
    {
      uint64_t v15 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v12 style:0];
      long long v16 = [WeakRetained[6] location];
      [v16 setAddress:v15];

      long long v17 = [v11 region];
      [v17 radius];
      double v19 = v18;
      long long v20 = [WeakRetained[6] location];
      [v20 setRadius:v19];

      long long v21 = [WeakRetained[6] location];
      uint64_t v22 = [v21 title];
      if (v22)
      {
        long long v23 = (void *)v22;
        __int16 v24 = [WeakRetained[6] location];
        [v24 title];
        __int16 v26 = v25 = v12;
        int v34 = [v26 isEqualToString:&stru_1F187C430];

        uint64_t v12 = v25;
        unint64_t v8 = 0x1E6368000;

        if (!v34) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      long long v27 = [WeakRetained[6] location];
      id v28 = [v27 address];
      uint64_t v29 = [WeakRetained[6] location];
      [v29 setTitle:v28];
    }
LABEL_13:
  }
LABEL_14:
  [WeakRetained _decrementPendingOperationsCountForDomain:@"OperationDomainLocationFromMapsURL"];
  id v30 = [*(id *)(v8 + 3368) locationSearch];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = *(void **)(a1 + 32);
    id v32 = [NSNumber numberWithInt:WeakRetained[6] != 0];
    *(_DWORD *)id buf = 138543618;
    id v36 = v31;
    __int16 v37 = 2114;
    long long v38 = v32;
    _os_log_impl(&dword_1BDF08000, v30, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
  }
  id v33 = [WeakRetained delegate];
  [v33 locationSearchModel:WeakRetained updatedSearchTypes:2];

LABEL_17:
}

- (unint64_t)supportedSearchTypes
{
  return self->_supportedSearchTypes;
}

- (void)setSupportedSearchTypes:(unint64_t)a3
{
  self->_unint64_t supportedSearchTypes = a3;
}

- (EKStructuredLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (CUIKStructuredLocationWithImage)locationFromMapsURL
{
  return self->_locationFromMapsURL;
}

- (NSArray)mapCompletionSearchResults
{
  return self->_mapCompletionSearchResults;
}

- (NSArray)contactsSearchResults
{
  return &self->_contactsSearchResults->super;
}

- (NSArray)recentsSearchResults
{
  return &self->_recentsSearchResults->super;
}

- (NSArray)frequentsSearchResults
{
  return &self->_frequentsSearchResults->super;
}

- (NSArray)eventsSearchResults
{
  return &self->_eventsSearchResults->super;
}

- (NSArray)textualSearchResults
{
  return self->_textualSearchResults;
}

- (NSArray)virtualConferenceRoomSearchResults
{
  return &self->_virtualConferenceRoomSearchResults->super;
}

- (NSArray)virtualConferenceCustomSearchResults
{
  return self->_virtualConferenceCustomSearchResults;
}

- (CUIKLocationSearchModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CUIKLocationSearchModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_virtualConferenceCustomSearchResults, 0);
  objc_storeStrong((id *)&self->_textualSearchResults, 0);
  objc_storeStrong((id *)&self->_mapCompletionSearchResults, 0);
  objc_storeStrong((id *)&self->_pendingOperationsCounts, 0);
  objc_storeStrong((id *)&self->_virtualConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_allPossibleVirtualConferenceRooms, 0);
  objc_storeStrong((id *)&self->_contactsSearchResults, 0);
  objc_storeStrong((id *)&self->_eventsSearchResults, 0);
  objc_storeStrong((id *)&self->_frequentsSearchResults, 0);
  objc_storeStrong((id *)&self->_recentsSearchResults, 0);
  objc_storeStrong((id *)&self->_conferenceRoomAddressesToConferenceRooms, 0);
  objc_storeStrong((id *)&self->_mutableConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_conferenceRoomOperationQueue, 0);
  objc_storeStrong((id *)&self->_conferenceRoomProcessingQueue, 0);
  objc_storeStrong((id *)&self->_whitespaceAndNewlineCharacterSet, 0);
  objc_storeStrong((id *)&self->_currentRecentsSearch, 0);
  objc_storeStrong((id *)&self->_eventsSearch, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_customConferenceQueue, 0);
  objc_storeStrong((id *)&self->_eventsQueue, 0);
  objc_storeStrong((id *)&self->_recentsQueue, 0);
  objc_storeStrong((id *)&self->_contactsSearchToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_locationFromMapsURL, 0);
  objc_storeStrong((id *)&self->_currentImpreciseLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_completer, 0);
  objc_storeStrong((id *)&self->_locationAssertion, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end