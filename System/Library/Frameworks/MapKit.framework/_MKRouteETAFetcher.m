@interface _MKRouteETAFetcher
- (BOOL)isUsingCurrentLocationForOrigin;
- (BOOL)isValidETA:(id)a3;
- (BOOL)shouldUpdateEstimatedTravelTimeForNewOrigin:(CLLocationCoordinate2D)a3;
- (CLLocationCoordinate2D)destinationCoordinate;
- (CLLocationCoordinate2D)originCoordinate;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MKMapItem)mapItem;
- (MKMapItem)originMapItem;
- (NSMutableDictionary)etaResults;
- (_MKRouteETAFetcher)init;
- (id)routeETAForTransportType:(unint64_t)a3;
- (void)_didUpdateETAResult;
- (void)_resetState;
- (void)dealloc;
- (void)expireETAsIfNoLongerValid;
- (void)invalidateETAForTransportType:(unint64_t)a3;
- (void)requestNewETAForTransportType:(unint64_t)a3 additionalTransportTypes:(id)a4 completion:(id)a5;
- (void)setAutomobileOptions:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setOriginMapItem:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setWalkingOptions:(id)a3;
@end

@implementation _MKRouteETAFetcher

- (_MKRouteETAFetcher)init
{
  v10.receiver = self;
  v10.super_class = (Class)_MKRouteETAFetcher;
  v2 = [(_MKRouteETAFetcher *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    etaResults = v2->_etaResults;
    v2->_etaResults = v3;

    GEOConfigGetDouble();
    v2->_staleDistance = v5;
    GEOConfigGetDouble();
    v2->_staleTimeInterval = v6;
    uint64_t v7 = +[MKMapItem mapItemForCurrentLocation];
    originMapItem = v2->_originMapItem;
    v2->_originMapItem = (MKMapItem *)v7;

    v2->_lastUpdatedETAOriginCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  }
  return v2;
}

- (void)dealloc
{
  [(MKDirections *)self->_inProgressETAUpdate cancel];
  inProgressETAUpdate = self->_inProgressETAUpdate;
  self->_inProgressETAUpdate = 0;

  v4.receiver = self;
  v4.super_class = (Class)_MKRouteETAFetcher;
  [(_MKRouteETAFetcher *)&v4 dealloc];
}

- (void)setAutomobileOptions:(id)a3
{
  objc_super v4 = (GEOAutomobileOptions *)a3;
  automobileOptions = self->_automobileOptions;
  if (automobileOptions != v4)
  {
    v9 = v4;
    char v6 = [(GEOAutomobileOptions *)automobileOptions isEqual:v4];
    objc_super v4 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (GEOAutomobileOptions *)[(GEOAutomobileOptions *)v9 copy];
      v8 = self->_automobileOptions;
      self->_automobileOptions = v7;

      [(_MKRouteETAFetcher *)self invalidateETAForTransportType:1];
      objc_super v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }
}

- (void)setWalkingOptions:(id)a3
{
  objc_super v4 = (GEOWalkingOptions *)a3;
  walkingOptions = self->_walkingOptions;
  if (walkingOptions != v4)
  {
    v9 = v4;
    char v6 = [(GEOWalkingOptions *)walkingOptions isEqual:v4];
    objc_super v4 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (GEOWalkingOptions *)[(GEOWalkingOptions *)v9 copy];
      v8 = self->_walkingOptions;
      self->_walkingOptions = v7;

      [(_MKRouteETAFetcher *)self invalidateETAForTransportType:2];
      objc_super v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }
}

- (void)setTransitOptions:(id)a3
{
  objc_super v4 = (GEOTransitOptions *)a3;
  transitOptions = self->_transitOptions;
  if (transitOptions != v4)
  {
    v9 = v4;
    char v6 = [(GEOTransitOptions *)transitOptions isEqual:v4];
    objc_super v4 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (GEOTransitOptions *)[(GEOTransitOptions *)v9 copy];
      v8 = self->_transitOptions;
      self->_transitOptions = v7;

      [(_MKRouteETAFetcher *)self invalidateETAForTransportType:4];
      objc_super v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }
}

- (void)setCyclingOptions:(id)a3
{
  objc_super v4 = (GEOCyclingOptions *)a3;
  cyclingOptions = self->_cyclingOptions;
  if (cyclingOptions != v4)
  {
    v9 = v4;
    char v6 = [(GEOCyclingOptions *)cyclingOptions isEqual:v4];
    objc_super v4 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (GEOCyclingOptions *)[(GEOCyclingOptions *)v9 copy];
      v8 = self->_cyclingOptions;
      self->_cyclingOptions = v7;

      [(_MKRouteETAFetcher *)self invalidateETAForTransportType:8];
      objc_super v4 = v9;
      self->_optionsHaveChangedSinceLastUpdate = 1;
    }
  }
}

- (void)setMapItem:(id)a3
{
  double v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(_MKRouteETAFetcher *)self _resetState];
    double v5 = v6;
  }
}

- (void)setOriginMapItem:(id)a3
{
  double v5 = (MKMapItem *)a3;
  if (self->_originMapItem != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_originMapItem, a3);
    [(_MKRouteETAFetcher *)self _resetState];
    double v5 = v6;
  }
}

- (void)_resetState
{
  self->_lastETAUpdateHadError = 0;
  [(NSMutableDictionary *)self->_etaResults removeAllObjects];
  [(MKDirections *)self->_inProgressETAUpdate cancel];
  inProgressETAUpdate = self->_inProgressETAUpdate;
  self->_inProgressETAUpdate = 0;

  self->_lastUpdatedETATime = 0.0;
  self->_lastRequestTime = 0.0;
  self->_lastUpdatedETAOriginCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  self->_optionsHaveChangedSinceLastUpdate = 0;
}

- (id)routeETAForTransportType:(unint64_t)a3
{
  etaResults = self->_etaResults;
  objc_super v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [(NSMutableDictionary *)etaResults objectForKeyedSubscript:v4];

  return v5;
}

- (void)requestNewETAForTransportType:(unint64_t)a3 additionalTransportTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_super v10 = [MKDirectionsRequest alloc];
    mapItem = self->_mapItem;
    originMapItem = self->_originMapItem;
    v13 = [MEMORY[0x1E4F1C9C8] date];
    LOWORD(v23) = 256;
    id v14 = -[MKDirectionsRequest _mapkit_initWithSource:destination:transportType:departureDate:includeTravelTimes:includeTrafficIncidents:includeRoutePoints:resolveExtraAutomobileOptions:](v10, "_mapkit_initWithSource:destination:transportType:departureDate:includeTravelTimes:includeTrafficIncidents:includeRoutePoints:resolveExtraAutomobileOptions:", originMapItem, mapItem, a3, v13, 1, 0, v23);

    [v14 _setIncludeDistanceInETA:1];
    if ([v8 count]) {
      [v14 _setAdditionalTransportTypesRequested:v8];
    }
    if (a3 == 1 || [v8 containsObject:&unk_1ED97E820])
    {
      v15 = [(_MKRouteETAFetcher *)self automobileOptions];
      [v14 _setAutomobileOptions:v15];
    }
    if (a3 == 4 || [v8 containsObject:&unk_1ED97E838])
    {
      v16 = [(_MKRouteETAFetcher *)self transitOptions];
      [v14 _setTransitOptions:v16];
    }
    if (a3 == 8 || [v8 containsObject:&unk_1ED97E850])
    {
      v17 = [(_MKRouteETAFetcher *)self cyclingOptions];
      [v14 _setCyclingOptions:v17];
    }
    v18 = self->_mapItem;
    [(MKDirections *)self->_inProgressETAUpdate cancel];
    v19 = [[MKDirections alloc] initWithRequest:v14];
    inProgressETAUpdate = self->_inProgressETAUpdate;
    self->_inProgressETAUpdate = v19;

    self->_lastRequestTime = CFAbsoluteTimeGetCurrent();
    self->_optionsHaveChangedSinceLastUpdate = 0;
    v21 = self->_inProgressETAUpdate;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88___MKRouteETAFetcher_requestNewETAForTransportType_additionalTransportTypes_completion___block_invoke;
    v24[3] = &unk_1E54BC510;
    v24[4] = self;
    v25 = v18;
    id v26 = v9;
    v22 = v18;
    [(MKDirections *)v21 calculateETAWithCompletionHandler:v24];
  }
}

- (BOOL)isUsingCurrentLocationForOrigin
{
  v2 = [(_MKRouteETAFetcher *)self originMapItem];
  char v3 = [v2 isCurrentLocation];

  return v3;
}

- (CLLocationCoordinate2D)originCoordinate
{
  if ([(_MKRouteETAFetcher *)self isUsingCurrentLocationForOrigin])
  {
    char v3 = +[MKLocationManager sharedLocationManager];
    if ([v3 hasLocation])
    {
      objc_super v4 = +[MKLocationManager sharedLocationManager];
      double v5 = [v4 lastLocation];
      [v5 coordinate];
      unint64_t v7 = v6;
      unint64_t v9 = v8;
    }
    else
    {
      unint64_t v9 = 0xC066800000000000;
      unint64_t v7 = 0xC066800000000000;
    }
  }
  else
  {
    [(MKMapItem *)self->_originMapItem _coordinate];
    unint64_t v7 = v10;
    unint64_t v9 = v11;
  }
  double v12 = *(double *)&v7;
  double v13 = *(double *)&v9;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CLLocationCoordinate2D)destinationCoordinate
{
  if ([(MKMapItem *)self->_mapItem isCurrentLocation])
  {
    char v3 = +[MKLocationManager sharedLocationManager];
    if ([v3 hasLocation])
    {
      objc_super v4 = +[MKLocationManager sharedLocationManager];
      double v5 = [v4 lastLocation];
      [v5 coordinate];
      unint64_t v7 = v6;
      unint64_t v9 = v8;
    }
    else
    {
      unint64_t v9 = 0xC066800000000000;
      unint64_t v7 = 0xC066800000000000;
    }
  }
  else
  {
    [(MKMapItem *)self->_mapItem _coordinate];
    unint64_t v7 = v10;
    unint64_t v9 = v11;
  }
  double v12 = *(double *)&v7;
  double v13 = *(double *)&v9;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (BOOL)shouldUpdateEstimatedTravelTimeForNewOrigin:(CLLocationCoordinate2D)a3
{
  double latitude = a3.latitude;
  BOOL result = 1;
  if (self->_lastRequestTime != 0.0 && !self->_optionsHaveChangedSinceLastUpdate)
  {
    double longitude = a3.longitude;
    double v7 = CFAbsoluteTimeGetCurrent() - self->_lastRequestTime;
    if (!(self->_lastETAUpdateHadError ? v7 >= 300.0 : v7 >= 60.0)) {
      return 0;
    }
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      double v9 = self->_lastUpdatedETAOriginCoordinate.longitude;
      if (v9 >= -180.0 && v9 <= 180.0)
      {
        double v10 = self->_lastUpdatedETAOriginCoordinate.latitude;
        if (v10 >= -90.0 && v10 <= 90.0)
        {
          GEOCalculateDistance();
          if (v11 < 1.0) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (void)expireETAsIfNoLongerValid
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(_MKRouteETAFetcher *)self originCoordinate];
  if (v4 < -180.0
    || v4 > 180.0
    || v3 < -90.0
    || v3 > 90.0
    || (double longitude = self->_lastUpdatedETAOriginCoordinate.longitude, longitude < -180.0)
    || longitude > 180.0
    || (double latitude = self->_lastUpdatedETAOriginCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0
    || (GEOCalculateDistance(), v7 > self->_staleDistance))
  {
    [(NSMutableDictionary *)self->_etaResults removeAllObjects];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v8 = [(NSMutableDictionary *)self->_etaResults allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v14 = [(NSMutableDictionary *)self->_etaResults objectForKeyedSubscript:v13];
        if (![(_MKRouteETAFetcher *)self isValidETA:v14]) {
          [(NSMutableDictionary *)self->_etaResults removeObjectForKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (BOOL)isValidETA:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [v4 responseTime];
  BOOL v10 = 0;
  if (Current - v6 <= self->_staleTimeInterval)
  {
    [v4 travelTime];
    if (v7 >= 1.0 || (double v8 = CFAbsoluteTimeGetCurrent(), [v4 responseTime], v8 - v9 <= 300.0)) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (void)invalidateETAForTransportType:(unint64_t)a3
{
  etaResults = self->_etaResults;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)etaResults removeObjectForKey:v4];
}

- (void)_didUpdateETAResult
{
  [(_MKRouteETAFetcher *)self originCoordinate];
  self->_lastUpdatedETAOriginCoordinate.double latitude = v3;
  self->_lastUpdatedETAOriginCoordinate.double longitude = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_lastUpdatedETATime = Current;
  self->_lastRequestTime = Current;
}

- (NSMutableDictionary)etaResults
{
  return self->_etaResults;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MKMapItem)originMapItem
{
  return self->_originMapItem;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_originMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_inProgressETAUpdate, 0);

  objc_storeStrong((id *)&self->_etaResults, 0);
}

@end