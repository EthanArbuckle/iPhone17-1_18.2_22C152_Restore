@interface MKETAProvider
- (BOOL)_areDistanceAndETAInformationAvailable;
- (BOOL)_shouldUpdateETAForMapView:(id)a3;
- (BOOL)allowsDistantETA;
- (BOOL)hasFoundDistanceOrETA;
- (BOOL)isLikelyToReturnETA;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType;
- (BOOL)quickRouteShouldOnlyUseAutomobile;
- (CLLocation)currentLocation;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitLineItem)lineItem;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MKETAProvider)initWithLineItem:(id)a3;
- (MKETAProvider)initWithMapItem:(id)a3;
- (MKETAProvider)initWithPlaceItem:(id)a3;
- (MKETAProviderDelegate)delegate;
- (MKMapItem)mapItem;
- (NSHashTable)observers;
- (NSLock)observersLock;
- (NSNumber)transportTypePreferenceNumber;
- (NSString)distanceString;
- (NSString)rawDistanceString;
- (_MKPlaceItem)placeItem;
- (double)etaTravelTime;
- (id)currentMapItem;
- (unint64_t)etaTransportType;
- (void)_cancelTimer;
- (void)_commonInit;
- (void)_configureETAForMapItem:(id)a3;
- (void)_didEnterBackground;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_notifyETAAllObservers;
- (void)_notifyLocationAllObservers;
- (void)_refreshTimer;
- (void)_startTimer;
- (void)_updateETA;
- (void)_updateETADisplayWithTransportType:(unint64_t)a3 travelTime:(double)a4 distance:(double)a5;
- (void)_updateETAHandler:(id)a3;
- (void)_willEnterForeground;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)configureWithNearestStationMapItem:(id)a3;
- (void)dealloc;
- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)pause;
- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6;
- (void)removeObserver:(id)a3;
- (void)restart;
- (void)setAllowsDistantETA:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObserversLock:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)start;
@end

@implementation MKETAProvider

- (MKETAProvider)initWithPlaceItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = [(MKETAProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeItem, a3);
    [(MKETAProvider *)v7 _commonInit];
  }

  return v7;
}

- (MKETAProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = [(MKETAProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    [(MKETAProvider *)v7 _commonInit];
  }

  return v7;
}

- (MKETAProvider)initWithLineItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = [(MKETAProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    [(MKETAProvider *)v7 _commonInit];
  }

  return v7;
}

- (void)dealloc
{
  [(MKETAProvider *)self _cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)MKETAProvider;
  [(MKETAProvider *)&v3 dealloc];
}

- (void)_commonInit
{
  objc_super v3 = +[MKLocationManager sharedLocationManager];
  v4 = [v3 lastGoodLocation];
  currentLocation = self->_currentLocation;
  self->_currentLocation = v4;

  v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if (v6 || (v6 = self->_mapItem) != 0)
  {
    v11 = v6;
    [(MKETAProvider *)self _configureETAForMapItem:v6];
  }
  else
  {
    v11 = 0;
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__locationManagerApprovalDidChange_ name:MKLocationManagerApprovalDidChangeNotification object:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__updateETAHandler_ name:0x1ED91A468 object:0];

  objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__willEnterForeground name:@"MKApplicationStateWillEnterForegroundNotification" object:0];

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__didEnterBackground name:@"MKApplicationStateDidEnterBackgroundNotification" object:0];
}

- (void)start
{
  self->_paused = 0;
  if (!self->_active)
  {
    self->_active = 1;
    id v3 = [(MKETAProvider *)self currentMapItem];
    [(MKETAProvider *)self _configureETAForMapItem:v3];
  }
}

- (void)restart
{
  if (self->_paused) {
    [(MKETAProvider *)self start];
  }
}

- (void)pause
{
  if (self->_active)
  {
    self->_paused = 1;
    [(MKETAProvider *)self cancel];
  }
}

- (void)cancel
{
  [(MKETAProvider *)self _cancelTimer];
  self->_active = 0;
  id v3 = +[MKLocationManager sharedLocationManager];
  [v3 stopLocationUpdateWithObserver:self];
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  id v5 = +[MKLocationManager sharedLocationManager];
  if ([v5 isLocationServicesAvailable]) {
    int v4 = [v5 isAuthorizedForPreciseLocation] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }
  self->_distanceOrETAIsSuppressed = v4;
  [(MKETAProvider *)self _notifyETAAllObservers];
  [(MKETAProvider *)self _updateETA];
}

- (void)_didEnterBackground
{
  if (self->_active)
  {
    self->_inactiveInBackground = 1;
    [(MKETAProvider *)self cancel];
  }
}

- (void)_willEnterForeground
{
  if (self->_inactiveInBackground)
  {
    self->_inactiveInBackground = 0;
    objc_initWeak(&location, self);
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37__MKETAProvider__willEnterForeground__block_invoke;
    v3[3] = &unk_1E54B8CB0;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __37__MKETAProvider__willEnterForeground__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained start];
}

- (void)_refreshTimer
{
  [(MKETAProvider *)self _cancelTimer];

  [(MKETAProvider *)self _updateETA];
}

- (void)_startTimer
{
  [(MKETAProvider *)self _cancelTimer];
  id v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__refreshTimer selector:0 userInfo:0 repeats:60.0];
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = v3;
}

- (void)_cancelTimer
{
  [(NSTimer *)self->_refreshTimer invalidate];
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;
}

- (NSHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (NSLock)observersLock
{
  observersLock = self->_observersLock;
  if (!observersLock)
  {
    id v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    id v5 = self->_observersLock;
    self->_observersLock = v4;

    observersLock = self->_observersLock;
  }

  return observersLock;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MKETAProvider *)self observersLock];
    [v5 lock];

    v6 = [(MKETAProvider *)self observers];
    [v6 addObject:v4];

    id v7 = [(MKETAProvider *)self observersLock];
    [v7 unlock];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MKETAProvider *)self observersLock];
    [v5 lock];

    v6 = [(MKETAProvider *)self observers];
    [v6 removeObject:v4];

    id v7 = [(MKETAProvider *)self observersLock];
    [v7 unlock];
  }
}

- (void)_notifyETAAllObservers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(MKETAProvider *)self observersLock];
  [v3 lock];

  id v4 = [(MKETAProvider *)self observers];
  id v5 = (void *)[v4 copy];

  v6 = [(MKETAProvider *)self observersLock];
  [v6 unlock];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "ETAProviderUpdated:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyLocationAllObservers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(MKETAProvider *)self observersLock];
  [v3 lock];

  id v4 = [(MKETAProvider *)self observers];
  id v5 = (void *)[v4 copy];

  v6 = [(MKETAProvider *)self observersLock];
  [v6 unlock];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "ETAProviderLocationUpdated:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (unint64_t)etaTransportType
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed) {
    return self->_etaTransportType;
  }
  else {
    return 0xFFFFFFFLL;
  }
}

- (double)etaTravelTime
{
  double result = 0.0;
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed) {
    return self->_etaTravelTime;
  }
  return result;
}

- (NSString)distanceString
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed) {
    dispatch_time_t v2 = self->_distanceTextItem;
  }
  else {
    dispatch_time_t v2 = 0;
  }

  return v2;
}

- (NSString)rawDistanceString
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed) {
    dispatch_time_t v2 = self->_rawDistanceString;
  }
  else {
    dispatch_time_t v2 = 0;
  }

  return v2;
}

- (NSNumber)transportTypePreferenceNumber
{
  return self->_lastTransportTypeFound;
}

- (BOOL)isLikelyToReturnETA
{
  dispatch_time_t v2 = [(MKETAProvider *)self currentMapItem];
  BOOL v3 = +[_MKQuickRouteManager isLikelyToReturnETAForLocation:v2];

  return v3;
}

- (BOOL)hasFoundDistanceOrETA
{
  return self->_distanceOrETAWasFound;
}

- (void)configureWithNearestStationMapItem:(id)a3
{
  id v5 = (MKMapItem *)a3;
  if (self->_nearestStationItem != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_nearestStationItem, a3);
    [(MKETAProvider *)self start];
    v6 = [(MKMapItem *)v9 _geoMapItem];
    if (v6)
    {
      [(_MKQuickRouteManager *)self->_quickRouteManager updateETA];
    }
    else
    {
      distanceTextItem = self->_distanceTextItem;
      self->_distanceTextItem = 0;

      rawDistanceString = self->_rawDistanceString;
      self->_rawDistanceString = 0;
    }
    id v5 = v9;
  }
}

- (void)setAutomobileOptions:(id)a3
{
  id v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    [(_MKQuickRouteManager *)self->_quickRouteManager setAutomobileOptions:self->_automobileOptions];
    [(MKETAProvider *)self _updateETA];
    id v5 = v6;
  }
}

- (void)setWalkingOptions:(id)a3
{
  id v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    [(_MKQuickRouteManager *)self->_quickRouteManager setWalkingOptions:v5];
    [(MKETAProvider *)self _updateETA];
  }
}

- (void)setTransitOptions:(id)a3
{
  id v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    objc_storeStrong((id *)&self->_transitOptions, a3);
    [(_MKQuickRouteManager *)self->_quickRouteManager setTransitOptions:v5];
    [(MKETAProvider *)self _updateETA];
  }
}

- (void)setCyclingOptions:(id)a3
{
  id v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    [(_MKQuickRouteManager *)self->_quickRouteManager setCyclingOptions:v5];
    [(MKETAProvider *)self _updateETA];
  }
}

- (BOOL)_areDistanceAndETAInformationAvailable
{
  BOOL v3 = +[MKLocationManager sharedLocationManager];
  if ([v3 isLocationServicesAvailable] && self->_quickRouteManager && self->_active)
  {
    id v4 = +[MKLocationManager sharedLocationManager];
    char v5 = [v4 isAuthorizedForPreciseLocation];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateETA
{
  if ([(MKETAProvider *)self _areDistanceAndETAInformationAvailable])
  {
    BOOL v3 = +[MKLocationManager sharedLocationManager];
    [v3 startLocationUpdateWithObserver:self];

    quickRouteManager = self->_quickRouteManager;
    [(_MKQuickRouteManager *)quickRouteManager updateETA];
  }
}

- (BOOL)_shouldUpdateETAForMapView:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (![v3 mapType]
     || [v3 mapType] == 105
     || [v3 mapType] == 104
     || [v3 mapType] == 108);

  return v4;
}

- (void)_updateETAHandler:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(MKETAProvider *)self _shouldUpdateETAForMapView:v4];

  if (v5)
  {
    [(MKETAProvider *)self _updateETA];
  }
}

- (void)_configureETAForMapItem:(id)a3
{
  id v4 = a3;
  if (v4 && self->_active)
  {
    quickRouteManager = self->_quickRouteManager;
    id v13 = v4;
    if (!quickRouteManager)
    {
      v6 = objc_alloc_init(_MKQuickRouteManager);
      id v7 = self->_quickRouteManager;
      self->_quickRouteManager = v6;

      id v4 = v13;
      quickRouteManager = self->_quickRouteManager;
    }
    [(_MKQuickRouteManager *)quickRouteManager setMapItem:v4];
    [(_MKQuickRouteManager *)self->_quickRouteManager setDelegate:self];
    [(_MKQuickRouteManager *)self->_quickRouteManager setTransportTypeFinder:self];
    [(_MKQuickRouteManager *)self->_quickRouteManager setView:self];
    [(_MKQuickRouteManager *)self->_quickRouteManager setAutomobileOptions:self->_automobileOptions];
    [(_MKQuickRouteManager *)self->_quickRouteManager setWalkingOptions:self->_walkingOptions];
    [(_MKQuickRouteManager *)self->_quickRouteManager setTransitOptions:self->_transitOptions];
    [(_MKQuickRouteManager *)self->_quickRouteManager setCyclingOptions:self->_cyclingOptions];
    [(_MKQuickRouteManager *)self->_quickRouteManager setAllowsDistantETA:self->_allowsDistantETA];
    BOOL v8 = [(MKETAProvider *)self _areDistanceAndETAInformationAvailable];
    uint64_t v9 = +[MKLocationManager sharedLocationManager];
    uint64_t v10 = v9;
    if (v8)
    {
      [v9 startLocationUpdateWithObserver:self];
    }
    else
    {
      int v11 = [v9 isLocationServicesAuthorizationNeeded];

      id v4 = v13;
      if (!v11) {
        goto LABEL_10;
      }
      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:self selector:sel__updateETA name:MKLocationManagerApprovalDidChangeNotification object:0];

      uint64_t v10 = +[MKLocationManager sharedLocationManager];
      [v10 requestWhenInUseAuthorization];
    }

    id v4 = v13;
  }
LABEL_10:
}

- (id)currentMapItem
{
  nearestStationItem = self->_nearestStationItem;
  if (nearestStationItem) {
    goto LABEL_2;
  }
  if (!self->_placeItem)
  {
    nearestStationItem = self->_mapItem;
LABEL_2:
    id v3 = nearestStationItem;
    goto LABEL_5;
  }
  id v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
LABEL_5:

  return v3;
}

- (void)_updateETADisplayWithTransportType:(unint64_t)a3 travelTime:(double)a4 distance:(double)a5
{
  self->_BOOL distanceOrETAWasFound = 0;
  if (!self->_active) {
    return;
  }
  if (a4 > 30.0)
  {
    self->_etaTransportType = a3;
    self->_etaTravelTime = a4;
    self->_BOOL distanceOrETAWasFound = 1;
  }
  id v7 = [(MKETAProvider *)self currentMapItem];
  BOOL v8 = +[_MKQuickRouteManager isLikelyToReturnETAForLocation:v7];

  if (!v8)
  {
    uint64_t v9 = +[MKLocationManager sharedLocationManager];
    uint64_t v10 = [v9 currentLocation];

    if (v10)
    {
      [v10 coordinate];
      int v11 = [(MKETAProvider *)self currentMapItem];
      [v11 _coordinate];

      GEOCalculateDistance();
      a5 = v12;
      self->_BOOL distanceOrETAWasFound = 1;
    }
  }
  objc_msgSend(NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, a5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_rawDistanceString, obj);
  nearestStationItem = self->_nearestStationItem;
  if (nearestStationItem)
  {
    long long v14 = [(MKMapItem *)nearestStationItem name];
    uint64_t v15 = [v14 length];

    if (a5 >= 3.0)
    {
      if (v15)
      {
        uint64_t v18 = NSString;
        v19 = _MKLocalizedStringFromThisBundle(@"line_card_nearest_station_distance_format");
        v20 = [(MKMapItem *)self->_nearestStationItem name];
        objc_msgSend(v18, "localizedStringWithFormat:", v19, v20, obj);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        distanceTextItem = self->_distanceTextItem;
        self->_distanceTextItem = v21;

LABEL_20:
        goto LABEL_21;
      }
      long long v16 = (NSString *)obj;
    }
    else
    {
      if (!v15)
      {
LABEL_21:
        BOOL distanceOrETAWasFound = self->_distanceOrETAWasFound || self->_distanceTextItem != 0;
        self->_BOOL distanceOrETAWasFound = distanceOrETAWasFound;
        goto LABEL_22;
      }
      long long v16 = [(MKMapItem *)self->_nearestStationItem name];
    }
    v19 = self->_distanceTextItem;
    self->_distanceTextItem = v16;
    goto LABEL_20;
  }
  if (a5 >= 3.0)
  {
    objc_storeStrong((id *)&self->_distanceTextItem, obj);
    self->_BOOL distanceOrETAWasFound = 1;
LABEL_23:
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"MapsButtonETAUpdatedNotification" object:self userInfo:0];

    goto LABEL_24;
  }
  BOOL distanceOrETAWasFound = self->_distanceOrETAWasFound;
LABEL_22:
  if (distanceOrETAWasFound) {
    goto LABEL_23;
  }
LABEL_24:
  [(MKETAProvider *)self _notifyETAAllObservers];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v11 = a3;
  id v4 = [v11 lastLocation];
  if (v4)
  {

LABEL_4:
    v6 = [v11 lastLocation];
    id v7 = v6;
    if (v6)
    {
      BOOL v8 = v6;
    }
    else
    {
      BOOL v8 = [v11 lastGoodLocation];
    }
    currentLocation = self->_currentLocation;
    self->_currentLocation = v8;

    uint64_t v10 = +[MKLocationManager sharedLocationManager];
    [v10 stopLocationUpdateWithObserver:self];

    [(MKETAProvider *)self _notifyLocationAllObservers];
    [(_MKQuickRouteManager *)self->_quickRouteManager updateETA];
    [(MKETAProvider *)self _startTimer];
    goto LABEL_8;
  }
  BOOL v5 = [v11 lastGoodLocation];

  if (v5) {
    goto LABEL_4;
  }
LABEL_8:
}

- (void)locationManagerDidReset:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6
{
  id v7 = a4;
  uint64_t v8 = [v7 transportType];
  [v7 travelTime];
  double v10 = v9;
  [v7 distance];
  double v12 = v11;

  [(MKETAProvider *)self _updateETADisplayWithTransportType:v8 travelTime:v10 distance:v12];
}

- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType
{
  return 0;
}

- (BOOL)quickRouteShouldOnlyUseAutomobile
{
  return 0;
}

- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v7 = a3.longitude;
  double v8 = a3.latitude;
  id v10 = a5;
  if (v10)
  {
    double v11 = [(MKETAProvider *)self delegate];
    if (v11)
    {
      double v12 = [(MKETAProvider *)self delegate];
      uint64_t v13 = [v12 mapTypeForETAProvider:self];
    }
    else
    {
      uint64_t v13 = 0;
    }

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F645E0], "idealTransportTypeForOrigin:destination:mapType:", v13, v8, v7, latitude, longitude);
    long long v14 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v15 = [v14 bundleIdentifier];
    char v16 = [v15 isEqualToString:*MEMORY[0x1E4F64320]];

    if (v16)
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke;
      v19[3] = &unk_1E54BEC58;
      objc_copyWeak(&v22, &location);
      v21 = &v24;
      v19[4] = self;
      id v20 = v10;
      MKMapsSuggestionsTransportModeForOriginAndDestination(v19, v8, v7, latitude, longitude);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      unint64_t v17 = v25[3] - 1;
      if (v17 > 3) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = qword_18BD1BF10[v17];
      }
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v18);
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - 1;
  if (v6 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_18BD1AFF0[v6];
  }
  double v8 = [*(id *)(a1 + 32) currentMapItem];
  double v9 = [v8 name];
  id v10 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v10);
  MKMapsSuggestionsLogPredictedTransportMode(a2, v7, v9, v11);

  if (a2 != 4 && GEOConfigGetBOOL())
  {
    if ((a2 - 1) > 5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_18BD1BEE0[(int)a2 - 1];
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[MKETAProvider findDirectionsTypeForOriginCoordinate:destinationCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_DEBUG, "Using MSg PTM in %s", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke_40;
  block[3] = &unk_1E54BEC30;
  objc_copyWeak(&v18, v4);
  long long v15 = *(_OWORD *)(a1 + 40);
  id v14 = (id)v15;
  long long v17 = v15;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke_40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v3 = (void *)WeakRetained[2];
    WeakRetained[2] = v2;
  }
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - 1;
  if (v4 > 3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = qword_18BD1BF10[v4];
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (MKETAProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKETAProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (BOOL)allowsDistantETA
{
  return self->_allowsDistantETA;
}

- (void)setAllowsDistantETA:(BOOL)a3
{
  self->_allowsDistantETA = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (void)setObservers:(id)a3
{
}

- (void)setObserversLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_rawDistanceString, 0);
  objc_storeStrong((id *)&self->_distanceTextItem, 0);
  objc_storeStrong((id *)&self->_nearestStationItem, 0);
  objc_storeStrong((id *)&self->_lastTransportTypeFound, 0);

  objc_storeStrong((id *)&self->_quickRouteManager, 0);
}

@end