@interface EKUILocationSearchModel
+ (id)URLsFromSource:(id)a3;
+ (id)_dataDetector;
+ (id)_linksInSource:(id)a3;
+ (void)initialize;
- (BOOL)removeRecentLocation:(id)a3;
- (EKStructuredLocation)currentLocation;
- (EKStructuredLocationWithImage)locationFromMapsURL;
- (EKUILocationSearchModel)initWithEventStore:(id)a3;
- (EKUILocationSearchModelDelegate)delegate;
- (NSArray)conferenceRoomSearchResults;
- (NSArray)contactsSearchResults;
- (NSArray)eventsSearchResults;
- (NSArray)frequentsSearchResults;
- (NSArray)mapCompletionSearchResults;
- (NSArray)recentsSearchResults;
- (NSArray)textualSearchResults;
- (NSArray)virtualConferenceCustomSearchResults;
- (NSArray)virtualConferenceRoomSearchResults;
- (id)_imageForAttributes:(id)a3;
- (id)_imageForMapHandle:(id)a3;
- (id)availabilityRequestForConferenceRooms:(id)a3 duringEvent:(id)a4 resultsBlock:(id)a5 completionBlock:(id)a6;
- (id)splitEventLocations:(id)a3;
- (unint64_t)dedupeResults;
- (unint64_t)supportedSearchTypes;
- (void)_addDiscoveredConferenceRooms:(id)a3;
- (void)_addLocationToRecents:(id)a3 addressString:(id)a4 mapItem:(id)a5;
- (void)_handleAvailabilityResults:(id)a3 forOperation:(id)a4;
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

@implementation EKUILocationSearchModel

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_24);
  }
}

void __37__EKUILocationSearchModel_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_mapItemCache;
  _mapItemCache = (uint64_t)v0;
}

- (EKUILocationSearchModel)initWithEventStore:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)EKUILocationSearchModel;
  v6 = [(EKUILocationSearchModel *)&v38 init];
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
    v33 = v7->_locationManager;
    if (!v33)
    {
      id v34 = [v23 alloc];
      uint64_t v35 = [v34 _initWithDelegate:v7 onQueue:MEMORY[0x1E4F14428]];
      v36 = v7->_locationManager;
      v7->_locationManager = (CLLocationManager *)v35;

      v33 = v7->_locationManager;
    }
    [(CLLocationManager *)v33 requestWhenInUseAuthorization];
  }
  return v7;
}

- (void)dealloc
{
  [(EKUILocationSearchModel *)self cancelSearch];
  [(EKUILocationSearchModel *)self stopUpdatingLocation];
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
  v6.super_class = (Class)EKUILocationSearchModel;
  [(EKUILocationSearchModel *)&v6 dealloc];
}

- (void)getCurrentLocation
{
  if ((self->_supportedSearchTypes & 4) != 0)
  {
    [(EKUILocationSearchModel *)self performSelector:sel_stopUpdatingLocation withObject:0 afterDelay:30.0];
    v3 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_INFO, "Started updating current location", v6, 2u);
    }
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    v4 = (CLInUseAssertion *)[(id)EKWeakLinkClass() newAssertionForBundleIdentifier:*MEMORY[0x1E4F57900] withReason:@"event editor getting current location"];
    locationAssertion = self->_locationAssertion;
    self->_locationAssertion = v4;
  }
}

- (void)stopUpdatingLocation
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_stopUpdatingLocation object:0];
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationAssertion = self->_locationAssertion;
  self->_locationAssertion = 0;

  v4 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_INFO, "Stopped updating current location", v5, 2u);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Updating current location failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
  [(EKUILocationSearchModel *)self stopUpdatingLocation];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a4;
  char v7 = [a3 _limitsPrecision];
  id v8 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_INFO, "Found current location, shifting...", buf, 2u);
  }
  uint64_t v9 = [v6 lastObject];

  id v10 = objc_alloc_init((Class)EKWeakLinkClass());
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__EKUILocationSearchModel_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_1E6088F48;
  char v12 = v7;
  v11[4] = self;
  [v10 shiftLocation:v9 withCompletionHandler:v11];
  [(EKUILocationSearchModel *)self stopUpdatingLocation];
}

void __62__EKUILocationSearchModel_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_INFO, "Current location shifting finished. Result is imprecise, so this only affects search result relevancy", buf, 2u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F25630];
    id v10 = EKUIUserFriendlyStringForCLLocation(v3);
    uint64_t v11 = [v9 locationWithTitle:v10];
    uint64_t v12 = *(void *)(a1 + 32);
    dispatch_queue_t v13 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = v11;

    [*(id *)(*(void *)(a1 + 32) + 32) setGeoLocation:v4];
    v14 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_INFO, "Current location shifting finished", v15, 2u);
    }
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
  id v3 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_INFO, "Resetting event search results", v8, 2u);
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
  id v5 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v13 = 0;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_INFO, "Resetting location search results", v13, 2u);
  }
  if (v3)
  {
    [(CLGeocoder *)self->_geocoder cancelGeocode];
    [(MKLocalSearchCompleter *)self->_completer cancel];
    [(MKLocalSearch *)self->_localSearch cancel];
    localSearch = self->_localSearch;
    self->_localSearch = 0;
  }
  [(EKUILocationSearchModel *)self resetContactsSearchResults];
  [(EKUILocationSearchModel *)self resetEventsSearchResults];
  [(EKUILocationSearchModel *)self resetConferenceRoomSearchResults];
  [(EKUILocationSearchModel *)self resetRecentsSearchResults];
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
    uint64_t v12 = [(EKUILocationSearchModel *)self delegate];
    [v12 locationSearchModel:self updatedSearchTypes:2047];
  }
}

- (void)cancelSearch
{
  [(EKUILocationSearchModel *)self resetSearchResults:1];
  v2 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_INFO, "Location search cancelled", v3, 2u);
  }
}

- (void)beginSearchForTerm:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ICSRedactString();
  uint64_t v6 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Location search begins!!", (uint8_t *)&v21, 0xCu);
  }
  [(EKUILocationSearchModel *)self resetSearchResults:0];
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
    uint64_t v12 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit", (uint8_t *)&v21, 0xCu);
    }
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
  dispatch_queue_t v13 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_INFO, "[%{public}@] >>>> MapKit from URL", (uint8_t *)&v21, 0xCu);
  }
  [(EKUILocationSearchModel *)self _updateMapURL:v4];
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
  v14 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Contacts", (uint8_t *)&v21, 0xCu);
  }
  [(EKUILocationSearchModel *)self updateContacts:v4];
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
  v15 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Recents", (uint8_t *)&v21, 0xCu);
  }
  [(EKUILocationSearchModel *)self updateRecents:v4];
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
  v16 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Frequents", (uint8_t *)&v21, 0xCu);
  }
  [(EKUILocationSearchModel *)self searchFrequentLocations:v4];
  unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  if ((supportedSearchTypes & 0x100) != 0)
  {
LABEL_30:
    v17 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_INFO, "[%{public}@] >>>> ConferenceRooms", (uint8_t *)&v21, 0xCu);
    }
    [(EKUILocationSearchModel *)self searchConferenceRooms:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
LABEL_33:
  if ((supportedSearchTypes & 0xC0) != 0)
  {
    v18 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Events", (uint8_t *)&v21, 0xCu);
    }
    [(EKUILocationSearchModel *)self updateEventLocations:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x200) != 0)
  {
    v19 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Rooms", (uint8_t *)&v21, 0xCu);
    }
    [(EKUILocationSearchModel *)self updateVirtualConferenceRoomOptions:v4];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
  }
  if ((supportedSearchTypes & 0x400) != 0)
  {
    v20 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_INFO, "[%{public}@] >>>> Virtual Conference Custom", (uint8_t *)&v21, 0xCu);
    }
    [(EKUILocationSearchModel *)self _updateVirtualConferenceCustomOptions:v4];
  }
}

- (unint64_t)dedupeResults
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  BOOL v3 = self->_recentsSearchResults;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F57C10];
        id v10 = [*(id *)(*((void *)&v46 + 1) + 8 * i) recent];
        uint64_t v11 = [v9 locationForRecent:v10];

        frequentsSearchResults = self->_frequentsSearchResults;
        if (frequentsSearchResults && [(NSMutableArray *)frequentsSearchResults count])
        {
          dispatch_queue_t v13 = self->_frequentsSearchResults;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke;
          v44[3] = &unk_1E6088F70;
          id v45 = v11;
          v14 = [(NSMutableArray *)v13 indexesOfObjectsPassingTest:v44];
          v15 = v14;
          if (v14 && [v14 count])
          {
            [(NSMutableArray *)self->_frequentsSearchResults removeObjectsAtIndexes:v15];
            v6 |= 0x20uLL;
          }
        }
        else
        {
          v15 = 0;
        }
        eventsSearchResults = self->_eventsSearchResults;
        if (eventsSearchResults && [(NSMutableArray *)eventsSearchResults count])
        {
          v17 = self->_eventsSearchResults;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke_2;
          v42[3] = &unk_1E6088F98;
          id v43 = v11;
          v18 = [(NSMutableArray *)v17 indexesOfObjectsPassingTest:v42];

          if (v18 && [v18 count])
          {
            [(NSMutableArray *)self->_eventsSearchResults removeObjectsAtIndexes:v18];
            v6 |= 0x40uLL;
          }
        }
        else
        {
          v18 = v15;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v19 = self->_frequentsSearchResults;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v38 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = self->_eventsSearchResults;
        if (v24)
        {
          uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * j);
          if ([(NSMutableArray *)v24 count])
          {
            uint64_t v26 = self->_eventsSearchResults;
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __40__EKUILocationSearchModel_dedupeResults__block_invoke_3;
            v37[3] = &unk_1E6088F98;
            v37[4] = v25;
            v27 = [(NSMutableArray *)v26 indexesOfObjectsPassingTest:v37];
            CFBooleanRef v28 = v27;
            if (v27 && [v27 count])
            {
              [(NSMutableArray *)self->_eventsSearchResults removeObjectsAtIndexes:v28];
              v6 |= 0x40uLL;
            }
          }
        }
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v38 objects:v56 count:16];
    }
    while (v21);
  }

  CFBooleanRef v29 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v30 = NSNumber;
    recentsSearchResults = self->_recentsSearchResults;
    v32 = v29;
    v33 = objc_msgSend(v30, "numberWithUnsignedInteger:", -[NSMutableArray count](recentsSearchResults, "count"));
    id v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventsSearchResults, "count"));
    uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frequentsSearchResults, "count"));
    *(_DWORD *)buf = 138543874;
    v51 = v33;
    __int16 v52 = 2114;
    v53 = v34;
    __int16 v54 = 2114;
    v55 = v35;
    _os_log_impl(&dword_1B3F4C000, v32, OS_LOG_TYPE_INFO, "After de-duping search results, Recents: %{public}@, Events: %{public}@, Frequents: %{public}@", buf, 0x20u);
  }
  return v6;
}

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToLocation:a2];
}

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 location];
  uint64_t v4 = [v2 isEqualToLocation:v3];

  return v4;
}

uint64_t __40__EKUILocationSearchModel_dedupeResults__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 location];
  uint64_t v4 = [v2 isEqualToLocation:v3];

  return v4;
}

- (void)completerDidUpdateResults:(id)a3 finished:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 queryFragment];
  uint64_t v7 = ICSRedactString();

  int v8 = [v5 resultsAreCurrent];
  uint64_t v9 = kEKUILogLocationSearchHandle;
  BOOL v10 = os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = NSNumber;
      uint64_t v12 = v9;
      dispatch_queue_t v13 = [v5 results];
      v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      int v18 = 138543618;
      v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit %{public}@ results", (uint8_t *)&v18, 0x16u);
    }
    v15 = [v5 results];
    mapCompletionSearchResults = self->_mapCompletionSearchResults;
    self->_mapCompletionSearchResults = v15;

    v17 = [(EKUILocationSearchModel *)self delegate];
    [v17 locationSearchModel:self updatedSearchTypes:4];
  }
  else if (v10)
  {
    int v18 = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit but results are not current", (uint8_t *)&v18, 0xCu);
  }
}

- (void)completerDidFail:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [a3 queryFragment];
  uint64_t v7 = ICSRedactString();

  int v8 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543618;
    BOOL v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] MapKit failed with error: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)updateContacts:(id)a3
{
  id v4 = a3;
  int v18 = ICSRedactString();
  [(EKUILocationSearchModel *)self resetContactsSearchResults];
  id v5 = (NSMutableArray *)objc_opt_new();
  contactsSearchResults = self->_contactsSearchResults;
  self->_contactsSearchResults = v5;

  uint64_t v7 = [(EKUILocationSearchModel *)self delegate];
  [v7 locationSearchModel:self updatedSearchTypes:8];

  int v8 = EKUIDescriptorForRequiredKeysForLabeledDisplayString();
  int v9 = [v8 arrayByAddingObject:*MEMORY[0x1E4F1AF10]];

  BOOL v10 = (void *)[objc_alloc((Class)EKWeakLinkClass()) initWithKeysToFetch:v9];
  __int16 v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingFullTextSearch:v4 containerIdentifiers:0 groupIdentifiers:0];
  [v10 setPredicate:v11];

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__8;
  v43[4] = __Block_byref_object_dispose__8;
  id v44 = (id)objc_opt_new();
  uint64_t v37 = 0;
  long long v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__8;
  long long v41 = __Block_byref_object_dispose__8;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke;
  v32[3] = &unk_1E6088FC0;
  v32[4] = v35;
  id v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v32 block:0.33];
  contactStore = self->_contactStore;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_2;
  v25[3] = &unk_1E6089010;
  CFBooleanRef v28 = v43;
  CFBooleanRef v29 = v33;
  id v30 = v35;
  id v26 = v18;
  v27 = self;
  uint64_t v31 = &v37;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_85;
  v19[3] = &unk_1E6089060;
  id v14 = v26;
  id v20 = v14;
  uint64_t v21 = self;
  uint64_t v23 = v43;
  v24 = &v37;
  id v15 = v12;
  id v22 = v15;
  v16 = [(CNContactStore *)contactStore executeFetchRequest:v10 progressiveResults:v25 completion:v19];
  contactsSearchToken = self->_contactsSearchToken;
  self->_contactsSearchToken = v16;

  objc_storeStrong(v38 + 5, v16);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
}

uint64_t __42__EKUILocationSearchModel_updateContacts___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __42__EKUILocationSearchModel_updateContacts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = a2;
  uint64_t v25 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v3;
        id v4 = *(void **)(*((void *)&v36 + 1) + 8 * v3);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v5 = [v4 postalAddresses];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v33 != v8) {
                objc_enumerationMutation(v5);
              }
              BOOL v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              __int16 v11 = (void *)MEMORY[0x1E4F1BA88];
              id v12 = [v10 value];
              uint64_t v13 = [v11 stringFromPostalAddress:v12 style:0];

              id v14 = [MEMORY[0x1E4F25630] locationWithTitle:v13];
              id v15 = [v10 label];
              v16 = EKUILabeledDisplayStringForContact((uint64_t)v4, (uint64_t)v15);
              [v14 setContactLabel:v16];

              [v14 setAddress:v13];
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
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

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_3;
    block[3] = &unk_1E6088FE8;
    id v28 = *(id *)(a1 + 32);
    id v29 = v17;
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = v21;
    id v22 = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __42__EKUILocationSearchModel_updateContacts___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = NSNumber;
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    uint64_t v6 = v2;
    uint64_t v7 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ progressive results", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 48) _updateContactsSearchWithResults:*(void *)(a1 + 40) forToken:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __42__EKUILocationSearchModel_updateContacts___block_invoke_85(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EKUILocationSearchModel_updateContacts___block_invoke_2_86;
  block[3] = &unk_1E6089038;
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

void __42__EKUILocationSearchModel_updateContacts___block_invoke_2_86(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSNumber;
    long long v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v6 = v2;
    id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v10 = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Contacts %{public}@ results", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 40) _updateContactsSearchWithResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forToken:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 48) invalidate];
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v8 == *(void **)(v9 + 80))
  {
    *(void *)(v9 + 80) = 0;
  }
}

- (void)_updateContactsSearchWithResults:(id)a3 forToken:(id)a4
{
  if (self->_contactsSearchToken == a4)
  {
    [(NSMutableArray *)self->_contactsSearchResults addObjectsFromArray:a3];
    id v5 = [(EKUILocationSearchModel *)self delegate];
    [v5 locationSearchModel:self updatedSearchTypes:8];
  }
}

- (void)updateRecents:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ((self->_supportedSearchTypes & 0x10) != 0)
  {
    if (v4)
    {
      id v28 = EKWeakLinkStringConstant();
      v27 = EKWeakLinkStringConstant();
      uint64_t v26 = EKWeakLinkStringConstant();
      uint64_t v25 = EKWeakLinkStringConstant();
      uint64_t v6 = (void *)EKWeakLinkClass();
      long long v36 = v28;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      uint64_t v8 = [v6 predicateForKey:v27 inCollection:v7];
      v37[0] = v8;
      uint64_t v9 = [v6 predicateForKey:v26 matchingText:v5 comparison:1];
      v35[0] = v9;
      int v10 = [v6 predicateForKey:v25 matchingText:v5 comparison:1];
      v35[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      __int16 v12 = [v6 predicateSatisfyingAnySubpredicate:v11];
      v37[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      uint64_t v14 = [v6 predicateSatisfyingAllSubpredicates:v13];
    }
    else
    {
      id v15 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_INFO, "Recents query is nil, returning all recents", (uint8_t *)&buf, 2u);
      }
      uint64_t v14 = 0;
    }
    if (!self->_recentsQueue)
    {
      v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.recents", 0);
      recentsQueue = self->_recentsQueue;
      self->_recentsQueue = v16;
    }
    objc_initWeak(&buf, self);
    id v18 = (void *)EKWeakLinkClass();
    uint64_t v19 = (objc_class *)EKWeakLinkClass();
    id v20 = objc_alloc_init(v19);
    [v20 setSearchPredicate:v14];
    [v20 setDomains:&unk_1F0D03B50];
    uint64_t v21 = [(objc_class *)v19 frecencyComparator];
    [v20 setComparator:v21];

    objc_storeStrong((id *)&self->_currentRecentsSearch, v20);
    id v22 = [v18 defaultInstance];
    uint64_t v23 = self->_recentsQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke;
    v29[3] = &unk_1E6089128;
    objc_copyWeak(v33, &buf);
    id v24 = v20;
    id v30 = v24;
    uint64_t v31 = self;
    v33[1] = v18;
    id v32 = v5;
    [v22 performRecentsSearch:v24 queue:v23 completion:v29];

    objc_destroyWeak(v33);
    objc_destroyWeak(&buf);
  }
}

void __41__EKUILocationSearchModel_updateRecents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [*(id *)(a1 + 32) isEqual:WeakRetained[16]])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_2;
    v6[3] = &unk_1E6089100;
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

void __41__EKUILocationSearchModel_updateRecents___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 calendarItemForSearchModel:*(void *)(a1 + 32)];

  uint64_t v25 = v3;
  id v4 = [v3 calendar];
  v27 = [v4 source];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  group = dispatch_group_create();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (![MEMORY[0x1E4F57C10] recentIsDirectoryLocation:v10]) {
          goto LABEL_19;
        }
        uint64_t v11 = objc_alloc_init(EKUIConferenceRoom);
        id v12 = objc_alloc_init(MEMORY[0x1E4F25520]);
        [(EKUIConferenceRoom *)v11 setLocation:v12];

        uint64_t v13 = [v10 displayName];
        uint64_t v14 = [(EKUIConferenceRoom *)v11 location];
        [v14 setDisplayName:v13];

        id v15 = [*(id *)(a1 + 32) delegate];
        int v16 = [v15 shouldIncludeConferenceRoom:v11];

        if ([MEMORY[0x1E4F57C10] recentDirectoryLocation:v10 matchesSource:v27])
        {
          if (v16)
          {
LABEL_19:
            if ([MEMORY[0x1E4F57C10] recentMissingStyleAttributes:v10])
            {
              id v17 = [MEMORY[0x1E4F57C10] mapKitHandleForRecent:v10];
              if (v17)
              {
                dispatch_group_enter(group);
                id v18 = (void *)MEMORY[0x1E4F30F08];
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_3;
                v37[3] = &unk_1E6089088;
                id v38 = v29;
                long long v39 = v10;
                uint64_t v42 = *(void *)(a1 + 72);
                id v17 = v17;
                id v40 = v17;
                long long v41 = group;
                [v18 _mapItemFromHandle:v17 completionHandler:v37];
              }
            }
            else
            {
              id v17 = [MEMORY[0x1E4F57C10] mapKitStyleAttributesForRecent:v10];
              os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
              uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "contactID"));
              [v29 setObject:v17 forKeyedSubscript:v19];

              os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
            }

            [v5 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v7);
  }

  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v21 = *(NSObject **)(v20 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_111;
  block[3] = &unk_1E60890D8;
  uint64_t v31 = group;
  id v32 = v5;
  id v33 = v29;
  uint64_t v34 = v20;
  id v35 = *(id *)(a1 + 56);
  id v36 = *(id *)(a1 + 64);
  id v22 = v29;
  id v23 = v5;
  id v24 = group;
  dispatch_async(v21, block);
}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
    uint64_t v7 = [v5 _styleAttributes];
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "contactID"));
    [v8 setObject:v7 forKeyedSubscript:v9];

    os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
    id v10 = (void *)MEMORY[0x1E4F57C10];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [v5 _styleAttributes];
    uint64_t v13 = [v10 recentEventWithRecentContact:v11 styleAttributes:v12];

    uint64_t v14 = [*(id *)(a1 + 64) defaultInstance];
    v22[0] = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v14 recordContactEvents:v15 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];
  }
  else
  {
    int v16 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 48);
      int v18 = 138412546;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when updating recents: %@, %@", (uint8_t *)&v18, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_111(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v2, v3))
  {
    id v4 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", buf, 2u);
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
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        uint64_t v11 = objc_alloc_init(EKRecentContactWithImage);
        [(EKRecentContactWithImage *)v11 setRecent:v10];
        os_unfair_lock_lock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
        id v12 = *(void **)(a1 + 48);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "contactID"));
        uint64_t v14 = [v12 objectForKey:v13];

        os_unfair_lock_unlock((os_unfair_lock_t)&NavdRecentLocationsEntitlment_block_invoke_dictionaryLock);
        id v15 = [*(id *)(a1 + 56) _imageForAttributes:v14];
        [(EKRecentContactWithImage *)v11 setImage:v15];

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
  block[2] = __41__EKUILocationSearchModel_updateRecents___block_invoke_113;
  block[3] = &unk_1E60890B0;
  id v16 = *(id *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 56);
  id v21 = v16;
  uint64_t v22 = v17;
  id v23 = v5;
  id v24 = *(id *)(a1 + 72);
  id v18 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__EKUILocationSearchModel_updateRecents___block_invoke_113(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 128)])
  {
    [*(id *)(*(void *)(a1 + 40) + 176) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 176) addObjectsFromArray:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 56))
    {
      id v2 = ICSRedactString();
      dispatch_time_t v3 = (void *)kEKUILogLocationSearchHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }
      id v4 = NSNumber;
      id v5 = *(void **)(*(void *)(a1 + 40) + 176);
      uint64_t v6 = v3;
      uint64_t v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      int v13 = 138543618;
      uint64_t v14 = v2;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Recents %{public}@ results", (uint8_t *)&v13, 0x16u);
    }
    else
    {
      uint64_t v8 = (void *)kEKUILogLocationSearchHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        uint64_t v11 = [*(id *)(a1 + 40) dedupeResults] | 0x10;
        id v12 = [*(id *)(a1 + 40) delegate];
        [v12 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:v11];

        return;
      }
      uint64_t v9 = NSNumber;
      id v10 = *(void **)(*(void *)(a1 + 40) + 176);
      id v2 = v8;
      uint64_t v6 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      int v13 = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_INFO, "Returning all Recents %{public}@ results", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_8;
  }
}

- (id)_imageForMapHandle:(id)a3
{
  id v3 = a3;
  if (!v3
    || ([(id)_mapItemCache objectForKey:v3],
        id v4 = objc_claimAutoreleasedReturnValue(),
        ImageForMapItem(v4),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v5 = MapPinImage();
  }

  return v5;
}

- (id)_imageForAttributes:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || (ImageForAttributes(v3), (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = MapPinImage();
  }

  return v5;
}

- (void)searchFrequentLocations:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F25658];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke;
  v7[3] = &unk_1E6089150;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 estimateGeolocationFromHistoricDevicePositionAtLocation:v6 withCompletionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke_2;
    v9[3] = &unk_1E60890B0;
    v9[4] = WeakRetained;
    id v10 = v5;
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __51__EKUILocationSearchModel_searchFrequentLocations___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 184);
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
  id v8 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v9 = NSNumber;
    id v10 = *(void **)(a1 + 32);
    id v11 = v8;
    id v12 = [v10 frequentsSearchResults];
    int v13 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    int v16 = 138543618;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v13;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Frequents %{public}@ results", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v14 = [*(id *)(a1 + 32) dedupeResults] | 0x20;
  __int16 v15 = [*(id *)(a1 + 32) delegate];
  [v15 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:v14];
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
  uint64_t v20 = v3;
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
  if (v4)
  {
    if (([v4 isEqualToString:&stru_1F0CC2140] & 1) == 0)
    {
      eventStore = self->_eventStore;
      if (eventStore)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v8 = [(EKEventStore *)eventStore readWriteCalendarsForEntityType:0];
        uint64_t v9 = [v7 setWithArray:v8];

        id v10 = (void *)MEMORY[0x1E4F255A0];
        uint64_t v11 = self->_eventStore;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke;
        v20[3] = &unk_1E6089240;
        id v21 = v5;
        uint64_t v22 = self;
        id v12 = [v10 searchWithCalendars:v9 searchTerm:v21 store:v11 callback:v20];
        eventsSearch = self->_eventsSearch;
        self->_eventsSearch = v12;

        if (!self->_eventsQueue)
        {
          uint64_t v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.eventslocation", 0);
          eventsQueue = self->_eventsQueue;
          self->_eventsQueue = v14;
        }
        objc_initWeak(&location, self->_eventsSearch);
        uint64_t v16 = self->_eventsQueue;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_138;
        v17[3] = &unk_1E6087918;
        objc_copyWeak(&v18, &location);
        dispatch_async(v16, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ICSRedactString();
  id v5 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v6 = NSNumber;
    uint64_t v7 = v5;
    uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)id buf = 138543618;
    uint64_t v20 = v4;
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ match results", buf, 0x16u);
  }
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(NSObject **)(v10 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_127;
  block[3] = &unk_1E6089218;
  void block[4] = v10;
  id v15 = v4;
  id v12 = v9;
  id v16 = v12;
  id v17 = *(id *)(a1 + 32);
  id v18 = v12;
  id v13 = v4;
  dispatch_async(v11, block);
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_127(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
  ICSRedactString();
  long long v41 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  id v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v3 = NSNumber;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v6 = v2;
    uint64_t v7 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    *(_DWORD *)id buf = 138543874;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v98 = v41;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Processing %{public}@ match results, events search text = %{public}@", buf, 0x20u);
  }
  *(void *)id buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v98 = __Block_byref_object_copy__8;
  v99 = __Block_byref_object_dispose__8;
  id v100 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__8;
  v92 = __Block_byref_object_dispose__8;
  id v93 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_128;
  block[3] = &unk_1E6089178;
  uint64_t v8 = a1;
  void block[4] = *(void *)(a1 + 32);
  id v80 = *(id *)(a1 + 56);
  v81 = &v84;
  v82 = buf;
  v83 = &v88;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (!*((unsigned char *)v85 + 24))
  {
    group = dispatch_group_create();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = *(id *)(a1 + 64);
    uint64_t v44 = [obj countByEnumeratingWithState:&v75 objects:v96 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v76 != v43) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F57AD0]];
          if (!v10)
          {
            uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F57AD8]];
            id v12 = [v9 objectForKey:*MEMORY[0x1E4F57AC8]];
            uint64_t v13 = [*(id *)(*(void *)(v8 + 32) + 112) eventForObjectID:v11 occurrenceDate:v12 checkValid:0];

            uint64_t v8 = a1;
            uint64_t v10 = v13;
          }
          long long v45 = (void *)v10;
          uint64_t v14 = objc_msgSend(*(id *)(v8 + 32), "splitEventLocations:");
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v95 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v72;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v72 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                uint64_t v20 = [v19 geoLocation];

                if (v20)
                {
                  *(void *)v67 = 0;
                  v68 = v67;
                  uint64_t v69 = 0x2020000000;
                  char v70 = 1;
                  __int16 v21 = *(void **)(*(void *)&buf[8] + 40);
                  v66[0] = MEMORY[0x1E4F143A8];
                  v66[1] = 3221225472;
                  v66[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_129;
                  v66[3] = &unk_1E60891A0;
                  v66[4] = v19;
                  v66[5] = v67;
                  [v21 enumerateObjectsUsingBlock:v66];
                  if (v19 && v68[24])
                  {
                    uint64_t v22 = [v19 mapKitHandle];
                    if (v22)
                    {
                      uint64_t v23 = [(id)_mapItemCache objectForKey:v22];
                      BOOL v24 = v23 == 0;

                      if (v24)
                      {
                        dispatch_group_enter(group);
                        long long v25 = (void *)MEMORY[0x1E4F30F08];
                        v62[0] = MEMORY[0x1E4F143A8];
                        v62[1] = 3221225472;
                        v62[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_2;
                        v62[3] = &unk_1E60891C8;
                        id v26 = v22;
                        id v63 = v26;
                        v64 = v19;
                        v65 = group;
                        [v25 _mapItemFromHandle:v26 completionHandler:v62];
                      }
                    }
                    long long v27 = objc_alloc_init(EKStructuredLocationWithImage);
                    [(EKStructuredLocationWithImage *)v27 setLocation:v19];
                    [*(id *)(*(void *)&buf[8] + 40) addObject:v27];
                  }
                }
                else
                {
                  *(void *)v67 = 0;
                  v68 = v67;
                  uint64_t v69 = 0x2020000000;
                  char v70 = 1;
                  long long v28 = (void *)v89[5];
                  v61[0] = MEMORY[0x1E4F143A8];
                  v61[1] = 3221225472;
                  v61[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_132;
                  v61[3] = &unk_1E60891F0;
                  v61[4] = v19;
                  v61[5] = v67;
                  [v28 enumerateObjectsUsingBlock:v61];
                  if (v19 && v68[24]) {
                    [(id)v89[5] addObject:v19];
                  }
                }
                _Block_object_dispose(v67, 8);
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v95 count:16];
            }
            while (v16);
          }

          uint64_t v8 = a1;
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v75 objects:v96 count:16];
      }
      while (v44);
    }

    dispatch_time_t v29 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(group, v29))
    {
      long long v30 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v67 = 0;
        _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_ERROR, "Timed out waiting for all mapItemHandles to resolve to mapItems", v67, 2u);
      }
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v31 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v32 = [v31 countByEnumeratingWithState:&v57 objects:v94 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v58 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void **)(*((void *)&v57 + 1) + 8 * k);
          id v36 = [v35 location];
          long long v37 = [v36 mapKitHandle];

          id v38 = [*(id *)(a1 + 32) _imageForMapHandle:v37];
          [v35 setImage:v38];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v57 objects:v94 count:16];
      }
      while (v32);
    }

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_134;
    v52[3] = &unk_1E6089178;
    v52[4] = *(void *)(a1 + 32);
    id v53 = *(id *)(a1 + 56);
    __int16 v54 = &v84;
    v55 = buf;
    v56 = &v88;
    long long v39 = (void *)MEMORY[0x1E4F14428];
    dispatch_sync(MEMORY[0x1E4F14428], v52);

    if (!*((unsigned char *)v85 + 24))
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __48__EKUILocationSearchModel_updateEventLocations___block_invoke_135;
      v49[3] = &unk_1E6087548;
      v49[4] = *(void *)(a1 + 32);
      id v50 = *(id *)(a1 + 56);
      id v51 = *(id *)(a1 + 48);
      id v40 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v49);
    }
  }

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(buf, 8);
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_128(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 120) searchTerm];
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

    uint64_t v11 = *(void *)(a1[4] + 240);
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void **)(v13 + 240);
      *(void *)(v13 + 240) = v12;

      uint64_t v11 = *(void *)(a1[4] + 240);
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
    uint64_t v16 = *(void *)(a1[8] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    id v18 = ICSRedactString();
    uint64_t v19 = [*(id *)(a1[4] + 120) searchTerm];
    uint64_t v20 = ICSRedactString();

    __int16 v21 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v22 = 138543618;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      long long v25 = v20;
      _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before processing matches because query changed, events search text = %{public}@", (uint8_t *)&v22, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_129(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [(id)_mapItemCache setObject:v5 forKey:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = v7;
      uint64_t v10 = [v8 mapKitHandle];
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "Failed to get map item from handle when fetching event locations: %@, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __48__EKUILocationSearchModel_updateEventLocations___block_invoke_132(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToLocation:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_134(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 120) searchTerm];
  char v3 = [v2 isEqualToString:a1[5]];

  if (v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1[7] + 8) + 40) mutableCopy];
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v4;

    uint64_t v7 = [*(id *)(*(void *)(a1[8] + 8) + 40) mutableCopy];
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 240);
    *(void *)(v8 + 240) = v7;
  }
  else
  {
    uint64_t v10 = ICSRedactString();
    int v11 = [*(id *)(a1[4] + 120) searchTerm];
    uint64_t v12 = ICSRedactString();

    __int16 v13 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before setting results because query changed, events search text = %{public}@", (uint8_t *)&v14, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_135(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v4 = 192;
    }
    else
    {
      __int16 v13 = ICSRedactString();
      int v14 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = NSNumber;
        __int16 v16 = *(void **)(*(void *)(a1 + 32) + 192);
        uint64_t v17 = v14;
        uint64_t v18 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
        int v19 = 138543618;
        uint64_t v20 = v13;
        __int16 v21 = 2114;
        int v22 = v18;
        _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events %{public}@ results", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v4 = [*(id *)(a1 + 32) dedupeResults] | 0xC0;
    }
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:v4];
  }
  else
  {
    uint64_t v5 = ICSRedactString();
    id v6 = [*(id *)(*(void *)(a1 + 32) + 120) searchTerm];
    uint64_t v7 = ICSRedactString();

    uint64_t v8 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
    {
      int v19 = 138543618;
      uint64_t v20 = v5;
      __int16 v21 = 2114;
      int v22 = v7;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Events Bailing before updating results because query changed, events search text = %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 192);
    *(void *)(v9 + 192) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 240);
    *(void *)(v11 + 240) = 0;
  }
}

void __48__EKUILocationSearchModel_updateEventLocations___block_invoke_138(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained run];
    id WeakRetained = v2;
  }
}

- (NSArray)conferenceRoomSearchResults
{
  return (NSArray *)self->_mutableConferenceRoomSearchResults;
}

- (void)searchConferenceRooms:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke;
  v6[3] = &unk_1E6087D68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = [v2 calendarItemForSearchModel:*(void *)(a1 + 32)];

  id v4 = [v3 calendar];
  id v5 = [v4 source];

  id v6 = [v5 constraints];
  if ([v6 supportsLocationDirectorySearches])
  {
    char v7 = [v3 allowsAttendeesModifications];

    if (v7)
    {
      uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 144);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_139;
      block[3] = &unk_1E6087548;
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 32);
      id v13 = v9;
      uint64_t v14 = v10;
      id v15 = v5;
      dispatch_async(v8, block);

      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v11 = kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Either the source for the search model's event does not support location directory searches or the calendar is shared to the user.  Will not search for conference rooms.", buf, 2u);
  }
LABEL_7:
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_139(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) componentsSeparatedByCharactersInSet:*(void *)(*(void *)(a1 + 40) + 136)];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F25530]);
  [v4 setTerms:v3];
  [v4 setFindLocations:1];
  id v5 = [MEMORY[0x1E4F57C00] sharedPreferences];
  id v6 = [v5 locationSearchResultLimit];

  objc_msgSend(v4, "setResultLimit:", objc_msgSend(v6, "unsignedIntegerValue"));
  objc_initWeak(&location, *(id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_2;
  aBlock[3] = &unk_1E6089268;
  objc_copyWeak(&v20, &location);
  id v19 = 0;
  char v7 = _Block_copy(aBlock);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F25528]) initWithSource:*(void *)(a1 + 48) query:v4 resultsBlock:v7];
  objc_initWeak(&from, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_3;
  v14[3] = &unk_1E6089290;
  objc_copyWeak(&v16, &from);
  v14[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v15 = v9;
  [v8 setCompletionBlock:v14];
  [*(id *)(*(void *)(a1 + 40) + 152) cancelAllOperations];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_145;
  block[3] = &unk_1E6087D68;
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

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _processDirectorySearchResultSet:v4 forOperation:*(void *)(a1 + 32)];
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_144;
    v6[3] = &unk_1E6087D68;
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v4, v6);
  }
  else
  {
    id v5 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "The directory search operation went away.  Returning early.", buf, 2u);
    }
  }
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_144(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) error];
    if (v2)
    {
      char v3 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        uint64_t v8 = (uint64_t)v2;
        _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "Directory search operation completed with error: [%@]", (uint8_t *)&v7, 0xCu);
      }
    }
    else if ([*(id *)(a1 + 32) numberOfMatchesExceededLimit])
    {
      id v4 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
      {
        id v5 = *(void **)(a1 + 40);
        id v6 = v4;
        int v7 = 134217984;
        uint64_t v8 = [v5 resultLimit];
        _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Directory search operation completed.  The number of matches exceeded the original result limit of [%tu]", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __49__EKUILocationSearchModel_searchConferenceRooms___block_invoke_145(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 168) removeAllObjects];
  id v2 = ICSRedactString();
  char v3 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v4 = NSNumber;
    id v5 = *(void **)(*(void *)(a1 + 32) + 160);
    id v6 = v3;
    int v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v9 = 138543618;
    id v10 = v2;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< ConferenceRooms %{public}@ results", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  [v8 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:256];
}

- (void)_processDirectorySearchResultSet:(id)a3 forOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke;
  block[3] = &unk_1E6087548;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke(id *a1)
{
  if (([a1[4] isCancelled] & 1) == 0)
  {
    id v2 = [a1[5] delegate];
    char v3 = [v2 calendarItemForSearchModel:a1[5]];

    id v4 = [v3 calendar];
    id v5 = [v4 source];

    id v6 = [v5 constraints];
    char v7 = [v6 supportsAvailabilityRequests];

    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2;
    block[3] = &unk_1E6088358;
    id v9 = a1[6];
    char v14 = v7;
    id v10 = a1[5];
    id v12 = v9;
    id v13 = v10;
    dispatch_async(v8, block);
  }
}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v3 = [*(id *)(a1 + 32) locations];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3;
  v5[3] = &unk_1E60892B8;
  char v7 = *(unsigned char *)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];

  [*(id *)(a1 + 40) _addDiscoveredConferenceRooms:v4];
}

void __73__EKUILocationSearchModel__processDirectorySearchResultSet_forOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = objc_alloc_init(EKUIConferenceRoom);
  [(EKUIConferenceRoom *)v5 setLocation:v3];

  [(EKUIConferenceRoom *)v5 setAvailability:0];
  [(EKUIConferenceRoom *)v5 setSupportsAvailability:*(unsigned __int8 *)(a1 + 48)];
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
  v6[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke;
  v6[3] = &unk_1E6087D68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v3 = NSNumber;
    id v4 = *(void **)(a1 + 32);
    id v5 = v2;
    id v6 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)id buf = 138543362;
    long long v37 = v6;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_INFO, "<<<< ConferenceRooms %{public}@ results", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 160) addObjectsFromArray:*(void *)(a1 + 32)];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_147;
  aBlock[3] = &__block_descriptor_40_e51_q24__0__EKUIConferenceRoom_8__EKUIConferenceRoom_16l;
  void aBlock[4] = 193;
  id v7 = _Block_copy(aBlock);
  [*(id *)(*(void *)(a1 + 40) + 160) sortWithOptions:16 usingComparator:v7];
  id v8 = [*(id *)(a1 + 40) delegate];
  id v9 = [v8 calendarItemForSearchModel:*(void *)(a1 + 40)];

  id v10 = [v9 calendar];
  id v11 = [v10 source];

  id v12 = [v11 constraints];
  char v13 = [v12 supportsAvailabilityRequests];

  if ((v13 & 1) == 0)
  {
    int v22 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id buf = 138412290;
      long long v37 = v11;
      _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_DEBUG, "The source for this calendar item does not support availability requests.  Will not issue an availability request.  Source: [%@]", buf, 0xCu);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __int16 v24 = v23;
      long long v25 = objc_opt_class();
      *(_DWORD *)id buf = 138412290;
      long long v37 = v25;
      id v26 = v25;
      _os_log_impl(&dword_1B3F4C000, v24, OS_LOG_TYPE_DEBUG, "This calendar item is not a [%@].  Will not issue an availability request.", buf, 0xCu);
    }
LABEL_10:
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = [*(id *)(a1 + 40) delegate];
    [v27 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];

    goto LABEL_11;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_151;
  v32[3] = &unk_1E6089300;
  id v16 = v14;
  uint64_t v17 = *(void *)(a1 + 40);
  id v33 = v16;
  uint64_t v34 = v17;
  [v15 enumerateObjectsUsingBlock:v32];

  uint64_t v18 = [*(id *)(a1 + 40) delegate];
  [v18 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];

  uint64_t v19 = *(void *)(a1 + 40);
  id v20 = *(NSObject **)(v19 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2;
  block[3] = &unk_1E60890B0;
  void block[4] = v19;
  id v21 = v16;
  id v29 = v21;
  id v30 = v9;
  id v31 = *(id *)(a1 + 32);
  dispatch_async(v20, block);

LABEL_11:
}

uint64_t __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 location];
  id v7 = [v6 displayName];

  id v8 = [v5 location];

  id v9 = [v8 displayName];

  uint64_t v10 = [v7 compare:v9 options:*(void *)(a1 + 32)];
  return v10;
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_151(uint64_t a1, void *a2)
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

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3;
  aBlock[3] = &unk_1E6089328;
  objc_copyWeak(&v11, &location);
  id v10 = 0;
  id v2 = _Block_copy(aBlock);
  id v3 = [*(id *)(a1 + 32) availabilityRequestForConferenceRooms:*(void *)(a1 + 40) duringEvent:*(void *)(a1 + 48) resultsBlock:v2 completionBlock:0];
  objc_initWeak(&from, v3);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5;
  v4[3] = &unk_1E6089378;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  id v5 = *(id *)(a1 + 56);
  [v3 setCompletionBlock:v4];
  [*(id *)(*(void *)(a1 + 32) + 152) addOperation:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[18];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4;
    block[3] = &unk_1E6087548;
    void block[4] = WeakRetained;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

uint64_t __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAvailabilityResults:*(void *)(a1 + 40) forOperation:*(void *)(a1 + 48)];
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_5(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = v3;
  if (!WeakRetained)
  {
    id v6 = kEKUILogLocationSearchHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_WORD *)id buf = 0;
    id v7 = "self went away.  Returning early.";
LABEL_8:
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_9;
  }
  if (!v3)
  {
    id v6 = kEKUILogLocationSearchHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_WORD *)id buf = 0;
    id v7 = "The availability operation went away.  Returning early.";
    goto LABEL_8;
  }
  id v5 = WeakRetained[18];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_154;
  block[3] = &unk_1E6087548;
  id v9 = v3;
  id v10 = a1[4];
  id v11 = WeakRetained;
  dispatch_async(v5, block);

LABEL_9:
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_154(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) error];
    if (v2)
    {
      id v3 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        id v10 = v2;
        _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_ERROR, "Availability operation completed with error: [%@]", buf, 0xCu);
      }
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_155;
  v6[3] = &unk_1E6087D68;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_155(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_156;
  v4[3] = &unk_1E6089350;
  void v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];
  if (*((unsigned char *)v6 + 24))
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    [v3 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];
  }
  _Block_object_dispose(&v5, 8);
}

void __57__EKUILocationSearchModel__addDiscoveredConferenceRooms___block_invoke_2_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 availabilityRequestInProgress])
  {
    [v3 setAvailabilityRequestInProgress:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)availabilityRequestForConferenceRooms:(id)a3 duringEvent:(id)a4 resultsBlock:(id)a5 completionBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = [v11 startDate];
  id v14 = [v11 endDateUnadjustedForLegacyClients];
  id v15 = [v11 calendar];
  id v16 = [v15 source];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F25608]) initWithSource:v16 startDate:v13 endDate:v14 ignoredEvent:v11 addresses:v12 resultsBlock:v10];
  [v17 setCompletionBlock:v9];

  return v17;
}

- (void)updateConferenceRoomAvailability:(id)a3 duringEvent:(id)a4 completionBlock:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke;
  aBlock[3] = &unk_1E60893A0;
  id v22 = v8;
  id v9 = v8;
  id v10 = a5;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  char v13 = [v9 location];
  id v14 = [v13 preferredAddress];
  v23[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v16 = [(EKUILocationSearchModel *)self availabilityRequestForConferenceRooms:v15 duringEvent:v11 resultsBlock:v12 completionBlock:v10];

  [v9 setAvailabilityRequestInProgress:1];
  conferenceRoomProcessingQueue = self->_conferenceRoomProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2;
  block[3] = &unk_1E6087D68;
  void block[4] = self;
  id v20 = v16;
  id v18 = v16;
  dispatch_async(conferenceRoomProcessingQueue, block);
}

void __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 location];
  id v6 = [v5 preferredAddress];
  id v7 = [v4 objectForKey:v6];

  objc_msgSend(*(id *)(a1 + 32), "setAvailability:", objc_msgSend(MEMORY[0x1E4F254B8], "summarizedAvailabilityTypeForSpans:", v7));
  [*(id *)(a1 + 32) setAvailabilityRequestInProgress:0];
}

uint64_t __88__EKUILocationSearchModel_updateConferenceRoomAvailability_duringEvent_completionBlock___block_invoke_2(uint64_t a1)
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
    v7[2] = __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke;
    v7[3] = &unk_1E6087D68;
    id v8 = v6;
    id v9 = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2;
  v4[3] = &unk_1E60893C8;
  void v4[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  id v3 = [*(id *)(a1 + 40) delegate];
  [v3 locationSearchModel:*(void *)(a1 + 40) updatedSearchTypes:256];
}

void __67__EKUILocationSearchModel__handleAvailabilityResults_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 contactLabel];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v7 title];
  }
  char v13 = v12;

  if (v8 && v13)
  {
    id v14 = (void *)EKWeakLinkClass();
    id v15 = [MEMORY[0x1E4F57C10] recentForLocation:v7 withAddressString:v8 andTitle:v13 mapItem:v9];
    id v16 = [v14 defaultInstance];
    v25[0] = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v16 recordContactEvents:v17 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];
  }
  else
  {
    id v18 = (void *)kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v18;
      id v20 = [v7 title];
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      __int16 v24 = v20;
      _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "can't add to recents, missing info: %@ %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)addConferenceRoomToRecents:(id)a3 fromSource:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)EKWeakLinkClass();
  id v8 = (void *)MEMORY[0x1E4F57C10];
  id v9 = [v6 location];

  id v10 = [v8 recentForDirectoryLocation:v9 onSource:v5];

  id v11 = [v7 defaultInstance];
  v13[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v11 recordContactEvents:v12 recentsDomain:@"com.apple.eventkit.ios" sendingAddress:0 completion:0];
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
    v11[2] = __48__EKUILocationSearchModel_removeRecentLocation___block_invoke;
    v11[3] = &unk_1E60893F0;
    id v12 = v4;
    [(NSMutableArray *)self->_recentsSearchResults removeObjectAtIndex:[(NSMutableArray *)recentsSearchResults indexOfObjectPassingTest:v11]];
    id v9 = [(EKUILocationSearchModel *)self delegate];
    [v9 locationSearchModel:self updatedSearchTypes:16];
  }
  return v7;
}

uint64_t __48__EKUILocationSearchModel_removeRecentLocation___block_invoke(uint64_t a1, void *a2)
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
  id v11 = self->_localSearch;
  self->_localSearch = v10;

  id v12 = self->_localSearch;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __53__EKUILocationSearchModel_selectMapSearchCompletion___block_invoke;
  uint64_t v17 = &unk_1E6089418;
  id v18 = v4;
  uint64_t v19 = self;
  id v13 = v4;
  [(MKLocalSearch *)v12 startWithCompletionHandler:&v14];
  objc_msgSend(v13, "sendFeedback", v14, v15, v16, v17);
}

void __53__EKUILocationSearchModel_selectMapSearchCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

    id v11 = [v10 placemark];
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;

    id v16 = (void *)[[v8 alloc] initWithLatitude:v13 longitude:v15];
    id v7 = objc_alloc_init(MEMORY[0x1E4F25630]);
    uint64_t v17 = [v10 name];
    [v7 setTitle:v17];

    [v7 setGeoLocation:v16];
    id v18 = [*(id *)(a1 + 32) displayLines];
    uint64_t v19 = [v18 lastObject];
    [v7 setAddress:v19];

    id v20 = [v10 placemark];
    int v21 = [v20 region];
    [v21 radius];
    objc_msgSend(v7, "setRadius:");

    id v22 = [v10 _handle];
    [v7 setMapKitHandle:v22];

    __int16 v23 = *(void **)(a1 + 40);
    __int16 v24 = [v7 address];
    [v23 _addLocationToRecents:v7 addressString:v24 mapItem:v10];
  }
  long long v25 = [*(id *)(a1 + 40) delegate];
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
    v18[2] = __42__EKUILocationSearchModel_selectLocation___block_invoke;
    v18[3] = &unk_1E6089440;
    v18[4] = self;
    id v19 = v4;
    id v8 = v4;
    [v6 _mapItemFromHandle:v7 completionHandler:v18];

    id v9 = [(EKUILocationSearchModel *)self delegate];
    [v9 locationSearchModel:self selectedLocation:v8 withError:0];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F57740];
    id v11 = [v4 title];
    double v12 = [v4 address];
    id v8 = [v10 fullDisplayStringWithTitle:v11 address:v12];

    double v13 = (void *)MEMORY[0x1E4F57718];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__EKUILocationSearchModel_selectLocation___block_invoke_173;
    v15[3] = &unk_1E6089440;
    id v16 = v4;
    uint64_t v17 = self;
    id v14 = v4;
    [v13 geocodeLocationString:v8 withCompletionBlock:v15];
  }
}

void __42__EKUILocationSearchModel_selectLocation___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v10 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "Failed to convert mapKitHandle to mapItem in selectLocation: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __42__EKUILocationSearchModel_selectLocation___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Location search failed with error: %@", (uint8_t *)&v12, 0xCu);
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
  v8[2] = __48__EKUILocationSearchModel_selectCurrentLocation__block_invoke;
  v8[3] = &unk_1E6089468;
  objc_copyWeak(&v9, &location);
  [(CLGeocoder *)v6 reverseGeocodeLocation:v7 completionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__EKUILocationSearchModel_selectCurrentLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v6;
        _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "Current Location search failed with error: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else if ([v5 count])
    {
      id v9 = [v5 firstObject];
      id v10 = [v9 postalAddress];
      int v11 = [v9 name];
      [WeakRetained[4] setTitle:v11];

      if (v10)
      {
        int v12 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v10 style:0];
        [WeakRetained[4] setAddress:v12];

        [WeakRetained[4] setRadius:100.0];
        uint64_t v13 = [WeakRetained[4] title];
        if (!v13
          || (uint64_t v14 = (void *)v13,
              [WeakRetained[4] title],
              double v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isEqualToString:&stru_1F0CC2140],
              v15,
              v14,
              v16))
        {
          uint64_t v17 = [WeakRetained[4] address];
          [WeakRetained[4] setTitle:v17];
        }
      }
    }
    id v18 = [WeakRetained delegate];
    [v18 locationSearchModel:WeakRetained selectedLocation:WeakRetained[4] withError:0];
  }
}

+ (id)_dataDetector
{
  if (_dataDetector_onceToken != -1) {
    dispatch_once(&_dataDetector_onceToken, &__block_literal_global_178);
  }
  id v2 = (void *)_dataDetector_dataDetector;

  return v2;
}

void __40__EKUILocationSearchModel__dataDetector__block_invoke()
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
    id v4 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "Error initializing the custom virtual conference data detector.", v5, 2u);
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
          int v12 = [v11 URL];
        }
        else
        {
          if ([v11 resultType] != 2048)
          {
            int v12 = 0;
            if ((objc_msgSend(0, "cal_hasSchemeMailto") & 1) == 0) {
              continue;
            }
            goto LABEL_14;
          }
          uint64_t v13 = [v11 phoneNumber];
          int v12 = [v13 phoneURL];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ((self->_supportedSearchTypes & 0x400) != 0)
  {
    if ([v4 length])
    {
      customConferenceQueue = self->_customConferenceQueue;
      if (!customConferenceQueue)
      {
        uint64_t v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilecal.customConference", 0);
        uint64_t v8 = self->_customConferenceQueue;
        self->_customConferenceQueue = v7;

        customConferenceQueue = self->_customConferenceQueue;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke;
      v17[3] = &unk_1E6087D68;
      void v17[4] = self;
      id v18 = v5;
      dispatch_async(customConferenceQueue, v17);
    }
    else
    {
      virtualConferenceCustomSearchResults = self->_virtualConferenceCustomSearchResults;
      self->_virtualConferenceCustomSearchResults = 0;

      id v10 = ICSRedactString();
      int v11 = (void *)kEKUILogLocationSearchHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
      {
        int v12 = NSNumber;
        uint64_t v13 = self->_virtualConferenceCustomSearchResults;
        uint64_t v14 = v11;
        long long v15 = objc_msgSend(v12, "numberWithUnsignedInteger:", -[NSArray count](v13, "count"));
        *(_DWORD *)id buf = 138543618;
        uint64_t v20 = v10;
        __int16 v21 = 2114;
        id v22 = v15;
        _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", buf, 0x16u);
      }
      long long v16 = [(EKUILocationSearchModel *)self delegate];
      [v16 locationSearchModel:self updatedSearchTypes:1024];
    }
  }
}

void __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() URLsFromSource:*(void *)(a1 + 40)];
  id v3 = [v2 CalMap:&__block_literal_global_183];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3;
  block[3] = &unk_1E6087548;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_2(uint64_t a1, void *a2)
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

void __65__EKUILocationSearchModel__updateVirtualConferenceCustomOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 40));
  id v2 = ICSRedactString();
  id v3 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v4 = NSNumber;
    id v5 = *(void **)(*(void *)(a1 + 32) + 248);
    id v6 = v3;
    id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v9 = 138543618;
    id v10 = v2;
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Custom %{public}@ results", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 locationSearchModel:*(void *)(a1 + 32) updatedSearchTypes:1024];
}

- (void)selectVirtualConferenceRoomType:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUILocationSearchModel *)self delegate];
  id v9 = [v5 calendarItemForSearchModel:self];

  id v6 = (void *)MEMORY[0x1E4F57C68];
  id v7 = [v9 calendar];
  id v8 = [v7 source];
  [v6 selectRoomType:v4 forSource:v8];
}

- (void)updateVirtualConferenceRoomOptions:(id)a3
{
  id v4 = a3;
  if ((self->_supportedSearchTypes & 0x200) != 0)
  {
    if (updateVirtualConferenceRoomOptions__onceToken != -1) {
      dispatch_once(&updateVirtualConferenceRoomOptions__onceToken, &__block_literal_global_188);
    }
    if (self->_allPossibleVirtualConferenceRooms)
    {
      [(EKUILocationSearchModel *)self _updateVirtualConferenceOptions:v4];
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F25678];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2;
      v6[3] = &unk_1E6089240;
      void v6[4] = self;
      id v7 = v4;
      [v5 virtualConferenceRoomTypesWithCompletion:v6 queue:MEMORY[0x1E4F14428]];
    }
  }
}

uint64_t __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke()
{
  return [MEMORY[0x1E4F57C68] cleanup];
}

uint64_t __62__EKUILocationSearchModel_updateVirtualConferenceRoomOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithCapacity:10];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v5;

  [*(id *)(a1 + 32) _updateAllPossibleVirtualConferenceResultsWithRoomTypes:v4];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);

  return [v8 _updateVirtualConferenceOptions:v9];
}

- (void)_updateAllPossibleVirtualConferenceResultsWithRoomTypes:(id)a3
{
  allPossibleVirtualConferenceRooms = self->_allPossibleVirtualConferenceRooms;
  id v5 = a3;
  [(NSMutableArray *)allPossibleVirtualConferenceRooms removeAllObjects];
  uint64_t v6 = [(EKUILocationSearchModel *)self delegate];
  id v11 = [v6 calendarItemForSearchModel:self];

  id v7 = (void *)MEMORY[0x1E4F57C68];
  id v8 = [v11 calendar];
  uint64_t v9 = [v8 source];
  id v10 = [v7 roomTypesOrderedByMRU:v5 forSource:v9];

  if (v10) {
    [(NSMutableArray *)self->_allPossibleVirtualConferenceRooms addObjectsFromArray:v10];
  }
}

- (void)_updateVirtualConferenceOptions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = self->_allPossibleVirtualConferenceRooms;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "title", (void)v23);
          uint64_t v15 = [v14 rangeOfString:v4 options:1];

          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            [(NSMutableArray *)self->_virtualConferenceRoomSearchResults addObject:v13];
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(NSMutableArray *)self->_virtualConferenceRoomSearchResults addObjectsFromArray:self->_allPossibleVirtualConferenceRooms];
  }
  long long v16 = ICSRedactString();
  long long v17 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v18 = NSNumber;
    int v19 = self->_virtualConferenceRoomSearchResults;
    uint64_t v20 = v17;
    __int16 v21 = objc_msgSend(v18, "numberWithUnsignedInteger:", -[NSMutableArray count](v19, "count"));
    *(_DWORD *)id buf = 138543618;
    long long v28 = v16;
    __int16 v29 = 2114;
    id v30 = v21;
    _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_INFO, "[%{public}@] <<<< Virtual Conference Rooms %{public}@ results", buf, 0x16u);
  }
  id v22 = [(EKUILocationSearchModel *)self delegate];
  [v22 locationSearchModel:self updatedSearchTypes:512];
}

- (void)_updateMapURL:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
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
    uint64_t v15 = objc_alloc_init(EKStructuredLocationWithImage);
    locationFromMapsURL = self->_locationFromMapsURL;
    self->_locationFromMapsURL = v15;

    long long v17 = [MEMORY[0x1E4F25630] locationWithMapItem:v8];
    id v18 = [v8 _geoAddress];
    int v19 = [v18 formattedAddressLines];
    long long v37 = [v19 lastObject];

    [v17 setAddress:v37];
    [(EKStructuredLocationWithImage *)self->_locationFromMapsURL setLocation:v17];
    uint64_t v20 = ImageForMapItem(v8);
    [(EKStructuredLocationWithImage *)self->_locationFromMapsURL setImage:v20];

    if (([v8 isPlaceHolder] & 1) == 0)
    {
      __int16 v21 = [(EKStructuredLocationWithImage *)self->_locationFromMapsURL location];
      [v21 setTitle:0];
    }
    id v22 = [(EKStructuredLocationWithImage *)self->_locationFromMapsURL location];
    long long v23 = [v22 address];
    if (v23)
    {
      long long v24 = [(EKStructuredLocationWithImage *)self->_locationFromMapsURL location];
      long long v25 = [v24 title];

      if (v25)
      {
        long long v26 = (void *)kEKUILogLocationSearchHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
        {
          long long v27 = NSNumber;
          BOOL v28 = self->_locationFromMapsURL != 0;
          __int16 v29 = v26;
          id v30 = [v27 numberWithInt:v28];
          *(_DWORD *)id buf = 138543618;
          uint64_t v42 = v5;
          __int16 v43 = 2114;
          uint64_t v44 = v30;
          _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
        }
        id v31 = [(EKUILocationSearchModel *)self delegate];
        [v31 locationSearchModel:self updatedSearchTypes:2];

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
      id v33 = (CLGeocoder *)objc_alloc_init((Class)EKWeakLinkClass());
      uint64_t v34 = self->_geocoder;
      self->_geocoder = v33;

      geocoder = self->_geocoder;
    }
    if ([(CLGeocoder *)geocoder isGeocoding]) {
      [(CLGeocoder *)self->_geocoder cancelGeocode];
    }
    objc_initWeak((id *)buf, self);
    uint64_t v35 = self->_geocoder;
    id v36 = [v17 geoLocation];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __41__EKUILocationSearchModel__updateMapURL___block_invoke;
    v38[3] = &unk_1E60894B0;
    objc_copyWeak(&v40, (id *)buf);
    id v39 = v5;
    [(CLGeocoder *)v35 reverseGeocodeLocation:v36 completionHandler:v38];

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
    goto LABEL_22;
  }

LABEL_5:
  uint64_t v9 = self->_locationFromMapsURL;
  self->_locationFromMapsURL = 0;

  uint64_t v10 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSNumber;
    BOOL v12 = self->_locationFromMapsURL != 0;
    uint64_t v13 = v10;
    uint64_t v14 = [v11 numberWithInt:v12];
    *(_DWORD *)id buf = 138543618;
    uint64_t v42 = v5;
    __int16 v43 = 2114;
    uint64_t v44 = v14;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
  }
  id v8 = [(EKUILocationSearchModel *)self delegate];
  [v8 locationSearchModel:self updatedSearchTypes:2];
LABEL_8:
}

void __41__EKUILocationSearchModel__updateMapURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_17;
  }
  if (v6)
  {
    id v8 = kEKUILogLocationSearchHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v38 = v6;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "Map URL address geocoding failed failed with error: %@", buf, 0xCu);
    }
    id v9 = WeakRetained[6];
    WeakRetained[6] = 0;

    goto LABEL_14;
  }
  if ([v5 count])
  {
    uint64_t v10 = [v5 firstObject];
    uint64_t v11 = [v10 postalAddress];
    BOOL v12 = [v10 name];
    uint64_t v13 = [WeakRetained[6] location];
    [v13 setTitle:v12];

    if (v11)
    {
      uint64_t v14 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v11 style:0];
      uint64_t v15 = [WeakRetained[6] location];
      [v15 setAddress:v14];

      long long v16 = [v10 region];
      [v16 radius];
      double v18 = v17;
      int v19 = [WeakRetained[6] location];
      [v19 setRadius:v18];

      uint64_t v20 = [WeakRetained[6] location];
      uint64_t v21 = [v20 title];
      if (v21)
      {
        id v22 = (void *)v21;
        long long v23 = [WeakRetained[6] location];
        [v23 title];
        long long v25 = v24 = v11;
        int v36 = [v25 isEqualToString:&stru_1F0CC2140];

        uint64_t v11 = v24;
        if (!v36) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      long long v26 = [WeakRetained[6] location];
      long long v27 = [v26 address];
      BOOL v28 = [WeakRetained[6] location];
      [v28 setTitle:v27];
    }
LABEL_13:
  }
LABEL_14:
  __int16 v29 = (void *)kEKUILogLocationSearchHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogLocationSearchHandle, OS_LOG_TYPE_INFO))
  {
    id v30 = *(void **)(a1 + 32);
    id v31 = NSNumber;
    BOOL v32 = WeakRetained[6] != 0;
    id v33 = v29;
    uint64_t v34 = [v31 numberWithInt:v32];
    *(_DWORD *)id buf = 138543618;
    id v38 = v30;
    __int16 v39 = 2114;
    id v40 = v34;
    _os_log_impl(&dword_1B3F4C000, v33, OS_LOG_TYPE_INFO, "[%{public}@] <<<< MapKit from URL %{public}@ results", buf, 0x16u);
  }
  uint64_t v35 = [WeakRetained delegate];
  [v35 locationSearchModel:WeakRetained updatedSearchTypes:2];

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

- (EKStructuredLocationWithImage)locationFromMapsURL
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

- (EKUILocationSearchModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUILocationSearchModelDelegate *)WeakRetained;
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