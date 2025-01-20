@interface GEORouteHypothesisMonitor
+ (BOOL)supportsSecureCoding;
+ (id)monitorWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8;
+ (id)routeAttributesForTransportType:(int)a3 withArrivalDate:(id)a4;
+ (id)serverFormattedStringFormatter;
+ (id)userPreferencesProvider;
+ (void)setServerFormattedStringFormatter:(id)a3;
+ (void)setUserPreferencesProvider:(id)a3;
- (BOOL)_hasInitialRoute;
- (BOOL)_isNavigating;
- (BOOL)_isNavigatingToDestination;
- (BOOL)_shouldUpdateETAForRouteMatch:(id)a3;
- (BOOL)supportsDirections;
- (BOOL)supportsLiveTraffic;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)source;
- (GEODirectionsRequestFeedback)feedback;
- (GEORouteAttributes)routeAttributes;
- (GEORouteHypothesis)hypothesis;
- (GEORouteHypothesisMonitor)initWithCoder:(id)a3;
- (GEORouteHypothesisMonitor)initWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8;
- (NSDate)arrivalDate;
- (NSString)description;
- (NSString)routeName;
- (id)_newETAUpdater;
- (id)navDestination;
- (id)routeMatchForLocation:(id)a3;
- (int)transportType;
- (void)_commonInit;
- (void)_executeBlockAccessingCurrentRequest:(id)a3;
- (void)_fetchETAWithRouteMatch:(id)a3;
- (void)_recalculateETAWithRouteMatch:(id)a3;
- (void)_receivedRouteResponse:(id)a3 forLocation:(id)a4 isReroute:(BOOL)a5;
- (void)_requestNewRouteFromLocation:(id)a3 usualRouteData:(id)a4;
- (void)_routeRequestFailed:(id)a3;
- (void)_showDebugAlert;
- (void)_updateLocation:(id)a3 allowServer:(BOOL)a4;
- (void)_updateRouteMatchETAAndTravelState;
- (void)_updateScoreForLocation:(id)a3;
- (void)callHandlerIvar;
- (void)cancelCurrentRequest;
- (void)checkRouteForLocation:(id)a3;
- (void)clientDisplayedUINotification:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)etaUpdater:(id)a3 receivedETATrafficUpdateResponse:(id)a4 etaRoute:(id)a5;
- (void)etaUpdater:(id)a3 receivedError:(id)a4;
- (void)etaUpdater:(id)a3 willSendETATrafficUpdateRequest:(id)a4;
- (void)etaUpdaterUpdatedETA:(id)a3;
- (void)recordETAUpdatesAfterEventStart;
- (void)setFeedback:(id)a3;
- (void)travelStateChanged;
- (void)updateLocation:(id)a3 allowServer:(BOOL)a4 hypothesisHandler:(id)a5;
@end

@implementation GEORouteHypothesisMonitor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)userPreferencesProvider
{
  return (id)userPreferencesProvider;
}

+ (void)setUserPreferencesProvider:(id)a3
{
}

+ (id)serverFormattedStringFormatter
{
  return (id)serverFormattedStringFormatter;
}

+ (void)setServerFormattedStringFormatter:(id)a3
{
}

+ (id)routeAttributesForTransportType:(int)a3 withArrivalDate:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3 == 4)
  {
    uint64_t v6 = GEOGetUserTransportTypePreference();
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67175681;
      *(_DWORD *)v39 = v6;
      *(_WORD *)&v39[4] = 1025;
      *(_DWORD *)&v39[6] = GEOConfigGetInteger(GeoServicesConfig_TransportTypePreference, (uint64_t)off_1E9113898);
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = _GEOConfigHasValue(GeoServicesConfig_TransportTypePreference, (uint64_t)off_1E9113898);
      HIWORD(v40) = 1025;
      int Integer = GEOConfigGetInteger(GeoServicesConfig_DefaultMapMode, (uint64_t)off_1E9114868);
      __int16 v42 = 1024;
      BOOL HasValue = _GEOConfigHasValue(GeoServicesConfig_DefaultMapMode, (uint64_t)off_1E9114868);
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "Setting transport type from user preference: %{private}d | transport type reference: %{private}d (%d) | default map mode: %{private}d (%d)", buf, 0x20u);
    }

    if (v6 == 1) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v6 == 2;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = off_1E53E7600[v8];
      *(_DWORD *)buf = 138477827;
      *(void *)v39 = v10;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEFAULT, "Transport type read from user defaults: %{private}@", buf, 0xCu);
    }
  }
  else if (a3 == 3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = a3;
  }
  v11 = objc_alloc_init(GEORouteAttributes);
  [(GEORouteAttributes *)v11 setRoutePointTypeForTransportType:v8];
  [(GEORouteAttributes *)v11 setIncludeManeuverIcons:0];
  [(GEORouteAttributes *)v11 setMainTransportType:v8];
  if ([(GEORouteAttributes *)v11 mainTransportType])
  {
    uint64_t v12 = 0;
  }
  else
  {
    v13 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v12 = [v13 currentCountrySupportsTraffic];
  }
  [(GEORouteAttributes *)v11 setIncludeTrafficAlongRoute:v12];
  [(GEORouteAttributes *)v11 setIncludeTrafficIncidents:v12];
  if (v5)
  {
    [v5 timeIntervalSinceReferenceDate];
    char v37 = 0;
    __int16 v36 = 0;
    v33[0] = 0;
    v33[1] = v14;
    int v34 = 1;
    char v35 = 6;
    [(GEORouteAttributes *)v11 setTimepoint:v33];
  }
  int v15 = [(GEORouteAttributes *)v11 mainTransportType];
  if (v15 != 1)
  {
    if (v15) {
      goto LABEL_37;
    }
    v16 = objc_alloc_init(GEOAutomobileOptions);
    [(GEORouteAttributes *)v11 setAutomobileOptions:v16];

    v17 = [(GEORouteAttributes *)v11 automobileOptions];
    [v17 setIncludeHistoricTravelTime:1];

    v18 = [(GEORouteAttributes *)v11 automobileOptions];
    [v18 setTrafficType:3];

    v19 = +[GEORouteHypothesisMonitor userPreferencesProvider];
    v20 = [v19 currentUserPreferences];

    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v20 avoidTolls];
      int v23 = [v20 avoidHighways];
      v24 = @"NO";
      if (v22) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      if (v23) {
        v24 = @"YES";
      }
      *(_DWORD *)buf = 138478083;
      *(void *)v39 = v25;
      *(_WORD *)&v39[8] = 2113;
      v40 = v24;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEFAULT, "Avoid tolls %{private}@, Avoid highways %{private}@", buf, 0x16u);
    }

    id v26 = [(GEORouteAttributes *)v11 automobileOptions];
    [v26 setUserPreferences:v20];
    goto LABEL_35;
  }
  v27 = +[GEORouteHypothesisMonitor userPreferencesProvider];
  v20 = [v27 currentTransitOptions];

  [(GEORouteAttributes *)v11 setTransitOptions:v20];
  v28 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  LODWORD(v27) = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

  if (v27)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; i < [v20 avoidedModesCount]; ++i)
    {
      v30 = objc_msgSend(v20, "avoidedModesAsString:", objc_msgSend(v20, "avoidedModeAtIndex:", i));
      [v26 addObject:v30];
    }
    v31 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)v39 = v26;
      _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_DEFAULT, "Avoided transit modes %{private}@", buf, 0xCu);
    }

LABEL_35:
  }

LABEL_37:
  [(GEORouteAttributes *)v11 setIncludeHistoricTravelTime:1];
  [(GEORouteAttributes *)v11 setTrafficType:3];

  return v11;
}

+ (id)monitorWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v17 mainTransportType];
    if (v20 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E53E7618[(int)v20];
    }
    *(_DWORD *)buf = 138477827;
    v27 = v21;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEFAULT, "Transport type passed from planned destination: %{private}@", buf, 0xCu);
  }
  if ([v17 mainTransportType] == 1)
  {
    int v22 = +[GEONavdDefaults sharedInstance];
    char v23 = [v22 transitTTLSupported];

    if ((v23 & 1) == 0) {
      [v17 setMainTransportType:0];
    }
  }
  [v17 mainTransportType];
  v24 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSource:v13 toDestination:v14 traceName:v15 traits:v16 routeAttributes:v17 clientInfo:v18];

  return v24;
}

- (GEORouteHypothesisMonitor)initWithSource:(id)a3 toDestination:(id)a4 traceName:(id)a5 traits:(id)a6 routeAttributes:(id)a7 clientInfo:(id)a8
{
  id v43 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEFAULT, "Creating route hypothesizer", buf, 2u);
  }

  v47.receiver = self;
  v47.super_class = (Class)GEORouteHypothesisMonitor;
  v21 = [(GEORouteHypothesisMonitor *)&v47 init];
  int v22 = v21;
  char v23 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_source, a3);
    objc_storeStrong((id *)&v22->_destination, a4);
    uint64_t v24 = [v16 copy];
    traceName = v23->_traceName;
    v23->_traceName = (NSString *)v24;

    objc_storeStrong((id *)&v22->_traits, a6);
    uint64_t v26 = [v18 copy];
    routeAttributes = v23->_routeAttributes;
    v23->_routeAttributes = (GEORouteAttributes *)v26;

    uint64_t v28 = [v19 copy];
    clientInfo = v23->_clientInfo;
    v23->_clientInfo = (GEONavdClientInfo *)v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rerouteEntries = v23->_rerouteEntries;
    v23->_rerouteEntries = v30;

    if ([(GEORouteAttributes *)v23->_routeAttributes hasTimepoint])
    {
      *(void *)buf = 0;
      double v45 = 0.0;
      uint64_t v46 = 0;
      v32 = v23->_routeAttributes;
      if (v32)
      {
        [(GEORouteAttributes *)v32 timepoint];
        if ((v46 & 0x400000000) != 0 && v46 == 1)
        {
          uint64_t v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v45];
          arrivalDate = v23->_arrivalDate;
          v23->_arrivalDate = (NSDate *)v33;
        }
      }
    }
    [(GEORouteHypothesisMonitor *)v23 _commonInit];
    if ([(GEORouteHypothesisMonitor *)v23 supportsLiveTraffic])
    {
      uint64_t v35 = [(GEORouteHypothesisMonitor *)v23 _newETAUpdater];
      liveETAUpdater = v23->_liveETAUpdater;
      v23->_liveETAUpdater = (GEOETAUpdater *)v35;
    }
    char v37 = objc_alloc_init(GEORouteHypothesis);
    hypothesis = v23->_hypothesis;
    v23->_hypothesis = v37;

    [(GEORouteHypothesis *)v23->_hypothesis setSupportsLiveTraffic:[(GEORouteHypothesisMonitor *)v23 supportsLiveTraffic]];
    v39 = objc_alloc_init(GEORouteHypothesizerAnalyticsStore);
    analyticsStore = v23->_analyticsStore;
    v23->_analyticsStore = v39;

    v41 = v23;
  }

  return v23;
}

- (GEORouteHypothesisMonitor)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEORouteHypothesisMonitor;
  id v5 = [(GEORouteHypothesisMonitor *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceKey"];
    source = v5->_source;
    v5->_source = (GEOComposedWaypoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationKey"];
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v8;

    v5->_transportType = [v4 decodeInt32ForKey:@"TransportTypeKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ArrivalDateKey"];
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TraitsKey"];
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HypothesisKey"];
    hypothesis = v5->_hypothesis;
    v5->_hypothesis = (GEORouteHypothesis *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveETARouteKey"];
    liveETARoute = v5->_liveETARoute;
    v5->_liveETARoute = (GEOComposedETARoute *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnalyticsStoreKey"];
    analyticsStore = v5->_analyticsStore;
    v5->_analyticsStore = (GEORouteHypothesizerAnalyticsStore *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastMatchedLocationKey"];
    lastMatchedLocation = v5->_lastMatchedLocation;
    v5->_lastMatchedLocation = (GEOLocation *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginLocationKey"];
    originLocation = v5->_originLocation;
    v5->_originLocation = (GEOLocation *)v22;

    v5->_hasArrived = [v4 decodeBoolForKey:@"HasArrivedKey"];
    v5->_isTraveling = [v4 decodeBoolForKey:@"IsTravelingKey"];
    [v4 decodeDoubleForKey:@"TravelScoreKey"];
    v5->_travelScore = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TraceNameKey"];
    traceName = v5->_traceName;
    v5->_traceName = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v30 = [v4 decodeObjectOfClasses:v29 forKey:@"RerouteEntriesKey"];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v30];
    rerouteEntries = v5->_rerouteEntries;
    v5->_rerouteEntries = (NSMutableArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteAttributes"];
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (GEONavdClientInfo *)v35;

    [(GEORouteHypothesisMonitor *)v5 _commonInit];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteKey"];
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v37;

    if (v5->_lastMatchedLocation)
    {
      uint64_t v39 = [(GEORouteHypothesisMonitor *)v5 routeMatchForLocation:"routeMatchForLocation:"];
      routeMatch = v5->_routeMatch;
      v5->_routeMatch = (GEORouteMatch *)v39;
    }
    if ([(GEORouteHypothesisMonitor *)v5 supportsLiveTraffic])
    {
      uint64_t v41 = [(GEORouteHypothesisMonitor *)v5 _newETAUpdater];
      liveETAUpdater = v5->_liveETAUpdater;
      v5->_liveETAUpdater = (GEOETAUpdater *)v41;
    }
    id v43 = v5;
  }
  return v5;
}

- (void)_commonInit
{
  v3 = [GEODirectionsRequestFeedback alloc];
  id v4 = [(GEOMapServiceTraits *)self->_traits appIdentifier];
  id v5 = [(GEODirectionsRequestFeedback *)v3 initWithPurpose:9 andSource:3 andIdentifier:v4];
  feedback = self->_feedback;
  self->_feedback = v5;

  v7 = objc_alloc_init(GEOCommonOptions);
  commonOptions = self->_commonOptions;
  self->_commonOptions = v7;

  [(GEOCommonOptions *)self->_commonOptions setIncludeTravelTimeAggressive:1];
  [(GEOCommonOptions *)self->_commonOptions setIncludeTravelTimeConservative:1];
  [(GEOCommonOptions *)self->_commonOptions setIncludeTravelTimeEstimate:1];
  [(GEOCommonOptions *)self->_commonOptions setExcludeGuidance:1];
  v9 = (geo_isolater *)geo_isolater_create();
  requestIsolater = self->_requestIsolater;
  self->_requestIsolater = v9;
}

- (id)_newETAUpdater
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOETAUpdater);
  [(GEOETAUpdater *)v3 setDelegate:self];
  [(GEOETAUpdater *)v3 setRouteAttributes:self->_routeAttributes];
  source = self->_source;
  id v5 = source;
  if (!source)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[0] = v5;
  destination = self->_destination;
  v7 = destination;
  if (!destination)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [(GEOETAUpdater *)v3 setWaypoints:v8];

  if (!destination) {
  if (!source)
  }

  return v3;
}

- (void)dealloc
{
  [(GEOETAUpdater *)self->_liveETAUpdater setDelegate:0];
  [(GEORouteHypothesisMonitor *)self cancelCurrentRequest];
  v3.receiver = self;
  v3.super_class = (Class)GEORouteHypothesisMonitor;
  [(GEORouteHypothesisMonitor *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(GEORouteHypothesisMonitor *)self source];
  [v7 encodeObject:v4 forKey:@"SourceKey"];

  id v5 = [(GEORouteHypothesisMonitor *)self destination];
  [v7 encodeObject:v5 forKey:@"DestinationKey"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[GEORouteHypothesisMonitor transportType](self, "transportType"), @"TransportTypeKey");
  uint64_t v6 = [(GEORouteHypothesisMonitor *)self arrivalDate];
  [v7 encodeObject:v6 forKey:@"ArrivalDateKey"];

  [v7 encodeObject:self->_traits forKey:@"TraitsKey"];
  [v7 encodeObject:self->_hypothesis forKey:@"HypothesisKey"];
  [v7 encodeObject:self->_liveETARoute forKey:@"LiveETARouteKey"];
  [v7 encodeObject:self->_analyticsStore forKey:@"AnalyticsStoreKey"];
  [v7 encodeObject:self->_lastMatchedLocation forKey:@"LastMatchedLocationKey"];
  [v7 encodeObject:self->_originLocation forKey:@"OriginLocationKey"];
  [v7 encodeBool:self->_hasArrived forKey:@"HasArrivedKey"];
  [v7 encodeBool:self->_isTraveling forKey:@"IsTravelingKey"];
  [v7 encodeDouble:@"TravelScoreKey" forKey:self->_travelScore];
  [v7 encodeObject:self->_rerouteEntries forKey:@"RerouteEntriesKey"];
  [v7 encodeObject:self->_traceName forKey:@"TraceNameKey"];
  [v7 encodeObject:self->_route forKey:@"RouteKey"];
  [v7 encodeObject:self->_routeAttributes forKey:@"RouteAttributes"];
  [v7 encodeObject:self->_clientInfo forKey:@"ClientInfo"];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"{\n\tSource: %@\n", self->_source];
  [v3 appendFormat:@"\tDestination: %@\n", self->_destination];
  [v3 appendFormat:@"\tRoute attributes: %@\n", self->_routeAttributes];
  id v4 = [(GEORouteHypothesis *)self->_hypothesis description];
  [v3 appendFormat:@"\tHypothesis: %@\n", v4];

  id v5 = (void *)MEMORY[0x18C120660](self->_handler);
  [v3 appendFormat:@"\tHandler: %@\n", v5];

  [v3 appendFormat:@"}\n"];

  return (NSString *)v3;
}

- (NSString)routeName
{
  route = self->_route;
  if (route)
  {
    route = [route name];
  }

  return (NSString *)route;
}

- (int)transportType
{
  routeAttributes = self->_routeAttributes;
  if (routeAttributes) {
    return [(GEORouteAttributes *)routeAttributes mainTransportType];
  }
  else {
    return self->_transportType;
  }
}

- (BOOL)supportsLiveTraffic
{
  if ([(GEORouteHypothesisMonitor *)self transportType]) {
    return 0;
  }
  id v3 = +[GEOCountryConfiguration sharedConfiguration];
  char v2 = [v3 currentCountrySupportsTraffic];

  return v2;
}

- (BOOL)supportsDirections
{
  char v2 = +[GEOCountryConfiguration sharedConfiguration];
  char v3 = [v2 currentCountrySupportsDirections];

  return v3;
}

- (BOOL)_hasInitialRoute
{
  return self->_originLocation != 0;
}

- (void)updateLocation:(id)a3 allowServer:(BOOL)a4 hypothesisHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[v9 copy];
  id handler = self->_handler;
  self->_id handler = v10;

  if ([(GEORouteHypothesisMonitor *)self supportsDirections])
  {
    [(GEORouteHypothesisMonitor *)self _updateLocation:v8 allowServer:v6];
    if (v6)
    {
      if (self->_needReroute)
      {
        [(GEORouteHypothesisMonitor *)self _requestNewRouteFromLocation:v8 usualRouteData:0];
        goto LABEL_14;
      }
      if ([(GEORouteHypothesisMonitor *)self supportsLiveTraffic]
        && [(GEORouteHypothesisMonitor *)self _shouldUpdateETAForRouteMatch:self->_routeMatch])
      {
        [(GEORouteHypothesisMonitor *)self _fetchETAWithRouteMatch:self->_routeMatch];
        goto LABEL_14;
      }
    }
    id v13 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      hypothesis = self->_hypothesis;
      int v15 = 138477827;
      uint64_t v16 = hypothesis;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "Hypothesis updated: %{private}@\n", (uint8_t *)&v15, 0xCu);
    }

    [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore didGenerateHypothesis];
    [(GEORouteHypothesisMonitor *)self callHandlerIvar];
  }
  else
  {
    [(GEORouteHypothesis *)self->_hypothesis _clearHypothesisAndSetErrorWithCode:-6];
    [(GEORouteHypothesisMonitor *)self callHandlerIvar];
    uint64_t v12 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Directions not supported. Returning.", (uint8_t *)&v15, 2u);
    }
  }
LABEL_14:
}

- (void)_updateLocation:(id)a3 allowServer:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_lastLocation, a3);
  if ([(GEORouteHypothesisMonitor *)self _hasInitialRoute])
  {
    [(GEORouteHypothesis *)self->_hypothesis setLastLocation:v7];
    [(GEORouteHypothesisMonitor *)self checkRouteForLocation:v7];
    if (self->_needReroute)
    {
      id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Updater does not have a route. Returning.", buf, 2u);
      }
    }
    else
    {
      [(GEORouteHypothesis *)self->_hypothesis _updateTravelStateHasArrived:self->_hasArrived isTraveling:self->_isTraveling travelScore:[(GEORouteHypothesisMonitor *)self _isNavigating] isNavigating:[(GEORouteHypothesisMonitor *)self _isNavigatingToDestination] isNavigatingToDestination:self->_travelScore];
      [(NSDate *)self->_arrivalDate timeIntervalSinceNow];
      if (v10 < 0.0)
      {
        if (v10 <= -14400.0) {
          [(GEORouteHypothesisMonitor *)self recordETAUpdatesAfterEventStart];
        }
        else {
          [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore setEtaUpdatesAfterEventStart:[(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore etaUpdatesAfterEventStart]+ 1];
        }
      }
      if (self->_hasArrived)
      {
        v11 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEFAULT, "Route hypothesizer arrived\n", v12, 2u);
        }

        [(GEORouteHypothesisMonitor *)self recordETAUpdatesAfterEventStart];
      }
      [(GEORouteHypothesisMonitor *)self _recalculateETAWithRouteMatch:self->_routeMatch];
    }
  }
  else if (v4)
  {
    id v9 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Don't have inital route. Kicking off route request and returning.", v14, 2u);
    }

    objc_storeStrong((id *)&self->_originLocation, a3);
    self->_needReroute = 1;
  }
}

- (BOOL)_shouldUpdateETAForRouteMatch:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 route];
    [v5 distance];
    if (v6 == 0.0)
    {
      BOOL v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "distanceToEndFromRouteCoordinate:", objc_msgSend(v4, "routeCoordinate"));
      BOOL v7 = v8 > 0.0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_recalculateETAWithRouteMatch:(id)a3
{
}

- (void)_fetchETAWithRouteMatch:(id)a3
{
  [(GEORouteHypothesisMonitor *)self _updateRouteMatchETAAndTravelState];
  [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore didGenerateHypothesis];

  [(GEORouteHypothesisMonitor *)self callHandlerIvar];
}

- (void)recordETAUpdatesAfterEventStart
{
  if (![(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore etaUpdatesWereReported])
  {
    [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore setEtaUpdatesWereReported:1];
    id v4 = +[GEONavdAnalyticsManager sharedManager];
    id v3 = [v4 analyticsReporter];
    objc_msgSend(v3, "recordETAUpdatesAfterEventStart:", -[GEORouteHypothesizerAnalyticsStore etaUpdatesAfterEventStart](self->_analyticsStore, "etaUpdatesAfterEventStart"));
  }
}

- (void)clientDisplayedUINotification:(unint64_t)a3
{
}

- (void)callHandlerIvar
{
  id handler = self->_handler;
  if (handler)
  {
    id v5 = (void (**)(id, GEORouteHypothesis *))MEMORY[0x18C120660](handler, a2);
    id v4 = self->_handler;
    self->_id handler = 0;

    if (GEOConfigGetBOOL(GeoServicesConfig_TTLETADebugAlert, (uint64_t)off_1E9113BA8)) {
      [(GEORouteHypothesisMonitor *)self _showDebugAlert];
    }
    if (v5) {
      v5[2](v5, self->_hypothesis);
    }
  }
}

- (void)_showDebugAlert
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v3 setTimeZone:v4];

  [v3 setDateFormat:@"HH:mm"];
  id v5 = NSString;
  uint64_t v6 = [(GEORouteHypothesisMonitor *)self transportType];
  if (v6 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = off_1E53E7618[(int)v6];
  }
  double v8 = [v5 stringWithFormat:@"%@ TTL", v7];

  id v9 = (void *)MEMORY[0x1E4F28E78];
  double v10 = [v3 stringFromDate:self->_arrivalDate];
  v11 = [v9 stringWithFormat:@"Event Date: %@", v10];

  uint64_t v12 = [(GEORouteHypothesis *)self->_hypothesis error];

  hypothesis = self->_hypothesis;
  if (v12)
  {
    uint64_t v14 = [(GEORouteHypothesis *)hypothesis error];
    [v11 appendFormat:@"\nError: %@", v14];
  }
  else
  {
    [(GEORouteHypothesis *)hypothesis estimatedTravelTime];
    uint64_t v16 = _navd_debugDurationAsString(v15);
    [v11 appendFormat:@"\nETA: %@", v16];

    uint64_t v17 = [(GEOComposedRoute *)self->_route startDate];
    uint64_t v18 = [v3 stringFromDate:v17];
    [v11 appendFormat:@"\n\nStart Date: %@", v18];

    id v19 = [(GEORouteHypothesis *)self->_hypothesis conservativeDepartureDate];
    uint64_t v20 = [v3 stringFromDate:v19];
    [v11 appendFormat:@"\nConservative Date: %@", v20];

    if ([(GEORouteHypothesisMonitor *)self transportType] == 1)
    {
      v21 = [(GEOComposedRoute *)self->_route startDate];
      uint64_t v14 = objc_msgSend(v21, "dateByAddingTimeInterval:", (double)-[GEOComposedRoute expectedTime](self->_route, "expectedTime"));

      uint64_t v22 = [v3 stringFromDate:v14];
      [v11 appendFormat:@"\nArrival Date: %@", v22];
    }
    else
    {
      uint64_t v14 = [(GEORouteHypothesis *)self->_hypothesis aggressiveDepartureDate];
      uint64_t v22 = [v3 stringFromDate:v14];
      [v11 appendFormat:@"\nAggressive Date: %@", v22];
    }
  }
  char v23 = [(GEORouteHypothesis *)self->_hypothesis generationDate];
  double v24 = [v3 stringFromDate:v23];
  [v11 appendFormat:@"\n\nGenerated at: %@", v24];

  uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
  [v25 setObject:v8 forKey:*MEMORY[0x1E4F1D990]];
  [v25 setObject:v11 forKey:*MEMORY[0x1E4F1D9A8]];
  [v25 setObject:@"OK" forKey:*MEMORY[0x1E4F1D9E0]];
  SInt32 error = 0;
  CFUserNotificationRef v26 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, (CFDictionaryRef)v25);
  if (v26) {
    CFRelease(v26);
  }
}

- (void)_updateRouteMatchETAAndTravelState
{
  [(GEORouteHypothesisMonitor *)self checkRouteForLocation:self->_lastLocation];
  [(GEORouteHypothesis *)self->_hypothesis _updateTravelStateHasArrived:self->_hasArrived isTraveling:self->_isTraveling travelScore:[(GEORouteHypothesisMonitor *)self _isNavigating] isNavigating:[(GEORouteHypothesisMonitor *)self _isNavigatingToDestination] isNavigatingToDestination:self->_travelScore];
  routeMatch = self->_routeMatch;

  [(GEORouteHypothesisMonitor *)self _recalculateETAWithRouteMatch:routeMatch];
}

- (void)etaUpdater:(id)a3 willSendETATrafficUpdateRequest:(id)a4
{
}

- (void)etaUpdater:(id)a3 receivedETATrafficUpdateResponse:(id)a4 etaRoute:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 waypointRoute];
  if (v9)
  {

LABEL_4:
    objc_storeStrong((id *)&self->_liveETARoute, a5);
    double v10 = [(GEOComposedRoute *)self->_route mutableData];
    [v10 updateForRoute:self->_route etaRoute:self->_liveETARoute];

    [(GEORouteHypothesisMonitor *)self _updateRouteMatchETAAndTravelState];
    goto LABEL_5;
  }
  if ([v7 routesCount]) {
    goto LABEL_4;
  }
  v11 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Error getting route from ETAU response: %@", (uint8_t *)&v12, 0xCu);
  }

LABEL_5:
}

- (void)etaUpdater:(id)a3 receivedError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Error from etaUpdater: %@", (uint8_t *)&v7, 0xCu);
  }

  [(GEORouteHypothesis *)self->_hypothesis _setError:v5];
}

- (void)etaUpdaterUpdatedETA:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "ETA refreshed", (uint8_t *)&v7, 2u);
  }

  [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore didGenerateHypothesis];
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    hypothesis = self->_hypothesis;
    int v7 = 138477827;
    id v8 = hypothesis;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Hypothesis updated: %{private}@\n", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_executeBlockAccessingCurrentRequest:(id)a3
{
}

- (void)_requestNewRouteFromLocation:(id)a3 usualRouteData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_currentRequest)
  {
    id v8 = +[GEODirectionsRequester sharedRequester];
    [v8 cancelRequest:self->_currentRequest];
  }
  uint64_t v9 = [[GEODirectionsRequest alloc] initWithFeedback:self->_feedback];
  currentRequest = self->_currentRequest;
  self->_currentRequest = v9;

  [(GEODirectionsRequest *)self->_currentRequest setRouteAttributes:self->_routeAttributes];
  [(GEODirectionsRequest *)self->_currentRequest setCommonOptions:self->_commonOptions];
  [(GEODirectionsRequest *)self->_currentRequest setMainTransportTypeMaxRouteCount:1];
  [(GEODirectionsRequest *)self->_currentRequest setCurrentUserLocation:v6];
  route = self->_route;
  BOOL v12 = route != 0;
  if (v7 && !route)
  {
    [(GEODirectionsRequest *)self->_currentRequest setGetRouteForZilchPoints:1];
    id v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
    [(GEODirectionsRequest *)self->_currentRequest setOriginalRouteZilchPoints:v13];

LABEL_8:
    uint64_t v17 = self->_currentRequest;
    uint64_t v14 = [(GEOComposedWaypoint *)self->_source geoWaypointTyped];
    [(GEODirectionsRequest *)v17 addWaypointTyped:v14];
    goto LABEL_9;
  }
  if (!route) {
    goto LABEL_8;
  }
  uint64_t v14 = [[GEOComposedWaypoint alloc] initWithLocation:v6 isCurrentLocation:1];
  double v15 = self->_currentRequest;
  uint64_t v16 = [(GEOComposedWaypoint *)v14 geoWaypointTyped];
  [(GEODirectionsRequest *)v15 addWaypointTyped:v16];

LABEL_9:
  uint64_t v18 = self->_currentRequest;
  id v19 = [(GEOComposedWaypoint *)self->_destination geoWaypointTyped];
  [(GEODirectionsRequest *)v18 addWaypointTyped:v19];

  uint64_t v20 = self->_route;
  self->_route = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  lastMatchedLocation = self->_lastMatchedLocation;
  self->_lastMatchedLocation = 0;

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke;
  v32[3] = &unk_1E53E7590;
  v32[4] = self;
  id v23 = v6;
  id v33 = v23;
  BOOL v34 = v12;
  double v24 = (void *)MEMORY[0x18C120660](v32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_3;
  v31[3] = &unk_1E53E75B8;
  v31[4] = self;
  uint64_t v25 = (void *)MEMORY[0x18C120660](v31);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_5;
  v28[3] = &unk_1E53E75E0;
  v28[4] = self;
  id v29 = v24;
  id v30 = v25;
  id v26 = v25;
  id v27 = v24;
  [(GEORouteHypothesisMonitor *)self _executeBlockAccessingCurrentRequest:v28];
}

uint64_t __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _receivedRouteResponse:a2 forLocation:*(void *)(a1 + 40) isReroute:*(unsigned __int8 *)(a1 + 48)];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_2;
  v5[3] = &unk_1E53D8418;
  v5[4] = v3;
  return [v3 _executeBlockAccessingCurrentRequest:v5];
}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 160);
  *(void *)(v1 + 160) = 0;
}

uint64_t __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _routeRequestFailed:a2];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_4;
  v5[3] = &unk_1E53D8418;
  v5[4] = v3;
  return [v3 _executeBlockAccessingCurrentRequest:v5];
}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 160);
  *(void *)(v1 + 160) = 0;
}

void __73__GEORouteHypothesisMonitor__requestNewRouteFromLocation_usualRouteData___block_invoke_5(void *a1)
{
  if (*(void *)(a1[4] + 160))
  {
    +[GEONavdPowerLogManager _powerLogWithEventName:@"RequestingDirections"];
    id v6 = +[GEODirectionsRequester sharedRequester];
    uint64_t v2 = *(void *)(a1[4] + 160);
    id v3 = +[GEOMapService sharedService];
    id v4 = [v3 defaultTraits];
    id v5 = [*(id *)(a1[4] + 136) auditToken];
    [v6 startRequest:v2 traits:v4 auditToken:v5 callbackQueue:MEMORY[0x1E4F14428] finished:a1[5] networkActivity:0 error:a1[6]];
  }
}

- (void)_receivedRouteResponse:(id)a3 forLocation:(id)a4 isReroute:(BOOL)a5
{
  BOOL v5 = a5;
  v60[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 sessionState];
  sessionState = self->_sessionState;
  self->_sessionState = v10;

  BOOL v12 = [GEORouteInitializerData alloc];
  destination = self->_destination;
  v60[0] = self->_source;
  v60[1] = destination;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  double v15 = [(GEORouteInitializerData *)v12 initWithWaypoints:v14 routeAttributes:self->_routeAttributes directionsResponse:v8];

  uint64_t v16 = [v8 waypointRoutes];
  BOOL v17 = [v16 count] == 0;

  if (v17)
  {
    if (![v8 suggestedRoutesCount]) {
      goto LABEL_6;
    }
    uint64_t v22 = [GEOComposedRoute alloc];
    id v19 = [v8 suggestedRoutes];
    uint64_t v20 = [v19 firstObject];
    v21 = [(GEOComposedRoute *)v22 initWithSuggestedRoute:v20 initializerData:v15];
  }
  else
  {
    uint64_t v18 = [GEOComposedRoute alloc];
    id v19 = [v8 waypointRoutes];
    uint64_t v20 = [v19 firstObject];
    v21 = [(GEOComposedRoute *)v18 initWithGeoWaypointRoute:v20 initializerData:v15];
  }
  route = self->_route;
  self->_route = v21;

LABEL_6:
  if (v5)
  {
    [v9 coordinate];
    double v25 = v24;
    double v27 = v26;
    uint64_t v28 = objc_alloc_init(GEORerouteInfo);
    id v29 = [MEMORY[0x1E4F1C9C8] date];
    [(GEORerouteInfo *)v28 setTime:v29];

    id v30 = [(GEOComposedWaypoint *)self->_destination latLng];
    [v30 coordinate];
    [(GEORerouteInfo *)v28 setDistanceFromDestination:(double)GEOCalculateDistanceRadius(v25, v27, v31, v32, 6367000.0)];

    [(NSMutableArray *)self->_rerouteEntries addObject:v28];
  }
  if (self->_route) {
    [(GEORouteHypothesisMonitor *)self _updateScoreForLocation:v9];
  }
  self->_needReroute = 0;
  if (v5) {
    [(GEORouteHypothesizerAnalyticsStore *)self->_analyticsStore didReroute];
  }
  id v33 = [(GEORouteHypothesisMonitor *)self routeName];
  if (v33) {
    BOOL v34 = v33;
  }
  else {
    BOOL v34 = &stru_1ED51F370;
  }
  [(GEORouteHypothesis *)self->_hypothesis setRouteName:v34];
  hypothesis = self->_hypothesis;
  unsigned int v36 = [(GEOComposedRoute *)self->_route expectedTime];
  [(GEOComposedRoute *)self->_route freeflowTravelTime];
  [(GEORouteHypothesis *)hypothesis _updateCurrentTrafficDensity:(double)v36 staticTravelTime:v37];
  v38 = self->_hypothesis;
  unsigned int v39 = [(GEOComposedRoute *)self->_route historicTravelTime];
  [(GEOComposedRoute *)self->_route freeflowTravelTime];
  [(GEORouteHypothesis *)v38 _updateHistoricTrafficDensity:(double)v39 staticTravelTime:v40];
  uint64_t v41 = self->_hypothesis;
  __int16 v42 = [(GEOComposedRoute *)self->_route trafficDescription];
  [(GEORouteHypothesis *)v41 _updateTrafficDensityDescription:v42];

  arrivalDate = self->_arrivalDate;
  id v43 = self->_hypothesis;
  unsigned int v45 = [(GEOComposedRoute *)self->_route expectedTime];
  [(GEOComposedRoute *)self->_route travelTimeConservativeEstimate];
  double v47 = v46;
  [(GEOComposedRoute *)self->_route travelTimeAggressiveEstimate];
  [(GEORouteHypothesis *)v43 _updateDepartureAndArrivalSuggestionsForArrivalDate:arrivalDate travelTimeWithTraffic:[(GEOComposedRoute *)self->_route transportType] conservativeTravelTime:(double)v45 aggressiveTravelTime:v47 transportType:v48];
  [(GEORouteHypothesis *)self->_hypothesis _setError:0];
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    _navd_debugDurationAsString((double)[(GEOComposedRoute *)self->_route expectedTime]);
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    [(GEOComposedRoute *)self->_route freeflowTravelTime];
    _navd_debugDurationAsString(v51);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    v53 = _navd_debugDurationAsString((double)[(GEOComposedRoute *)self->_route historicTravelTime]);
    int v54 = 138412802;
    id v55 = v50;
    __int16 v56 = 2112;
    id v57 = v52;
    __int16 v58 = 2112;
    v59 = v53;
    _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_DEFAULT, "Received route for hypothesis. Travel duration: %@ | Static: %@ | Historic: %@", (uint8_t *)&v54, 0x20u);
  }
  [(GEORouteHypothesisMonitor *)self _updateRouteMatchETAAndTravelState];
  [(GEORouteHypothesisMonitor *)self callHandlerIvar];
}

- (void)_routeRequestFailed:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Error from route request: %@", (uint8_t *)&v6, 0xCu);
  }

  self->_needReroute = 0;
  [(GEORouteHypothesis *)self->_hypothesis _setError:v4];
  [(GEORouteHypothesisMonitor *)self callHandlerIvar];
}

- (id)navDestination
{
  Class v2 = NSClassFromString(&cfstr_Mnnavigationst.isa);
  if (v2)
  {
    Class v3 = v2;
    SEL v4 = NSSelectorFromString(&cfstr_Sharedmanager.isa);
    SEL v5 = NSSelectorFromString(&cfstr_Navsessiondest.isa);
    if (objc_opt_respondsToSelector())
    {
      int v6 = (void *)MEMORY[0x1E4F1CA18];
      id v7 = [(objc_class *)v3 methodSignatureForSelector:v4];
      uint64_t v8 = [v6 invocationWithMethodSignature:v7];

      [v8 setSelector:v4];
      [v8 setTarget:v3];
      [v8 invoke];
      v14[0] = 0;
      [v8 getReturnValue:v14];
      id v9 = v14[0];
    }
    else
    {
      id v9 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      double v10 = [(objc_class *)v3 instanceMethodSignatureForSelector:v5];
      v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
      [v11 setSelector:v5];
      [v11 setTarget:v9];
      [v11 invoke];
      v14[0] = 0;
      [v11 getReturnValue:v14];
      id v12 = v14[0];

      goto LABEL_10;
    }
  }
  else
  {
    id v9 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Could not find load nav state manager", (uint8_t *)v14, 2u);
    }
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)_isNavigating
{
  Class v2 = [(GEORouteHypothesisMonitor *)self navDestination];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isNavigatingToDestination
{
  BOOL v3 = [(GEORouteHypothesisMonitor *)self _isNavigating];
  if (v3)
  {
    destination = self->_destination;
    SEL v5 = [(GEORouteHypothesisMonitor *)self navDestination];
    LODWORD(destination) = [(GEOComposedWaypoint *)destination isSameAs:v5];

    if (destination)
    {
      int v6 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "User is navigating to the same destination as event", v8, 2u);
      }

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_updateScoreForLocation:(id)a3
{
  id v11 = a3;
  self->_travelScore = 1.0;
  SEL v4 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v5 = 0;
  id v6 = 0;
  while (v5 < [(NSMutableArray *)self->_rerouteEntries count])
  {
    id v7 = [(NSMutableArray *)self->_rerouteEntries objectAtIndex:v5];
    uint64_t v8 = [(NSMutableArray *)self->_rerouteEntries count];
    id v9 = [(GEOComposedWaypoint *)self->_destination latLng];
    [v9 coordinate];
    objc_msgSend(v7, "updateWithCurrentTime:location:isMostRecentReroute:destinationCoordinate:numThrottledReroutes:", v4, v11, v5 == v8 - 1, 0);

    [v7 penalty];
    if (v10 <= -2.22044605e-16 || v10 >= 2.22044605e-16)
    {
      self->_travelScore = self->_travelScore - v10;
    }
    else
    {
      if (!v6) {
        id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      }
      [v6 addIndex:v5];
    }

    ++v5;
  }
  if (v6) {
    [(NSMutableArray *)self->_rerouteEntries removeObjectsAtIndexes:v6];
  }
}

- (void)cancelCurrentRequest
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__GEORouteHypothesisMonitor_cancelCurrentRequest__block_invoke;
  v2[3] = &unk_1E53D8418;
  v2[4] = self;
  [(GEORouteHypothesisMonitor *)self _executeBlockAccessingCurrentRequest:v2];
}

void __49__GEORouteHypothesisMonitor_cancelCurrentRequest__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 160))
  {
    Class v2 = +[GEODirectionsRequester sharedRequester];
    [v2 cancelRequest:*(void *)(*(void *)(a1 + 32) + 160)];

    uint64_t v3 = *(void *)(a1 + 32);
    SEL v4 = *(void **)(v3 + 160);
    *(void *)(v3 + 160) = 0;
  }
}

- (void)checkRouteForLocation:(id)a3
{
}

- (void)travelStateChanged
{
  if (self->_isTraveling)
  {
    if (self->_hypothesis)
    {
      analyticsStore = self->_analyticsStore;
      id v4 = [(GEORouteHypothesis *)self->_hypothesis conservativeDepartureDate];
      -[GEORouteHypothesizerAnalyticsStore didStartMovingWithExpectedDepartureTime:](analyticsStore, "didStartMovingWithExpectedDepartureTime:");
    }
  }
  else
  {
    uint64_t v3 = self->_analyticsStore;
    [(GEORouteHypothesizerAnalyticsStore *)v3 didStopMoving];
  }
}

- (id)routeMatchForLocation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[GEORouteMatcher alloc] initWithRoute:self->_route auditToken:0];
  id v6 = [(GEORouteMatcher *)v5 matchToRouteWithLocation:v4];
  id v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  [v6 modifiedHorizontalAccuracy];
  if (v8 >= 0.0
    && ([v7 distanceFromRoute],
        double v10 = v9,
        [v7 modifiedHorizontalAccuracy],
        v10 - v11 > 100.0))
  {
    [v7 setIsGoodMatch:0];
  }
  else
  {
    [v7 modifiedCourseAccuracy];
    if (v12 >= 0.0)
    {
      [v4 course];
      double v14 = v13;
      [v7 matchedCourse];
      long double v16 = fmod(v15 - v14 + 180.0, 360.0);
      double v17 = fmod(v16 + 360.0, 360.0);
      [v7 modifiedCourseAccuracy];
      double v19 = v18;
      [v4 speed];
      if (v20 > 9.0 && fabs(v17 + -180.0) - v19 > 100.0)
      {
        [v7 setIsGoodMatch:0];
LABEL_9:
        id v21 = 0;
        goto LABEL_12;
      }
    }
    [v7 setIsGoodMatch:1];
  }
  id v21 = v7;
LABEL_12:

  return v21;
}

- (GEODirectionsRequestFeedback)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
}

- (GEOComposedWaypoint)source
{
  return self->_source;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (GEORouteHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_arrivalMapRegion, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_rerouteEntries, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requestIsolater, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_analyticsStore, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_liveETARoute, 0);
  objc_storeStrong((id *)&self->_liveETAUpdater, 0);
  objc_storeStrong((id *)&self->_etaUpdaterDispatchGroup, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_originLocation, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_feedback, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end