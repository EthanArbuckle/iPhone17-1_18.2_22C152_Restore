@interface _MKQuickRouteManager
+ (BOOL)isLikelyToReturnETAForLocation:(id)a3;
+ (double)_maxDistanceToRequestLikelyETA;
+ (unint64_t)counterpartForTransportType:(unint64_t)a3;
+ (unint64_t)directionsTypeForMapItem:(id)a3 delegate:(id)a4 mapType:(unint64_t)a5;
- (BOOL)_transportTypeShouldBeSmart;
- (BOOL)allowsDistantETA;
- (BOOL)fetchAllTransportTypes;
- (BOOL)haveETAsForPreferredTransportType:(unint64_t)a3;
- (BOOL)isOnlyDriving;
- (BOOL)isUsingCurrentLocationForOrigin;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)destinationCoordinate;
- (CLLocationCoordinate2D)originCoordinate;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MKMapItem)mapItem;
- (MKMapItem)originMapItem;
- (MKQuickRouteConfigurableView)view;
- (MKQuickRouteManagerDelegate)delegate;
- (MKQuickRouteTransportTypeFinding)transportTypeFinder;
- (_MKQuickRouteManager)init;
- (double)_maxDistanceToRequestETA;
- (id)bestETAForPreferredDirectionsType:(unint64_t)a3;
- (id)description;
- (id)routeETAForTransportType:(unint64_t)a3;
- (unint64_t)directionsTypeForMapType:(unint64_t)a3;
- (unint64_t)directionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 preferredDirectionsType:(unint64_t)a5;
- (unint64_t)guessTransportTypeForDistance:(double)a3 preferredDirectionsType:(unint64_t)a4;
- (void)_performWithTransportType:(id)a3;
- (void)_resetState;
- (void)requestNewETAForPreferredTransportType:(unint64_t)a3 completion:(id)a4;
- (void)setAllowsDistantETA:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchAllTransportTypes:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setOriginMapItem:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setTransportTypeFinder:(id)a3;
- (void)setView:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)updateETA;
@end

@implementation _MKQuickRouteManager

+ (unint64_t)counterpartForTransportType:(unint64_t)a3
{
  if ((a3 - 1) > 7) {
    return 1;
  }
  else {
    return qword_18BD1B748[(int)a3 - 1];
  }
}

- (_MKQuickRouteManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MKQuickRouteManager;
  v2 = [(_MKQuickRouteManager *)&v8 init];
  if (v2)
  {
    GEOConfigGetDouble();
    *((void *)v2 + 5) = v3;
    GEOConfigGetDouble();
    *((void *)v2 + 6) = v4;
    *(_OWORD *)(v2 + 88) = MKCoordinateInvalid;
    v5 = objc_alloc_init(_MKRouteETAFetcher);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;
  }
  return (_MKQuickRouteManager *)v2;
}

- (double)_maxDistanceToRequestETA
{
  if (self->_allowsDistantETA) {
    return 0.0;
  }
  uint64_t v3 = objc_opt_class();

  [v3 _maxDistanceToRequestLikelyETA];
  return result;
}

+ (double)_maxDistanceToRequestLikelyETA
{
  GEOConfigGetDouble();
  return result;
}

+ (BOOL)isLikelyToReturnETAForLocation:(id)a3
{
  id v4 = a3;
  v5 = +[MKLocationManager sharedLocationManager];
  v6 = [v5 currentLocation];

  if (v6)
  {
    [a1 _maxDistanceToRequestLikelyETA];
    double v8 = v7;
    [v6 coordinate];
    [v4 _coordinate];
    GEOCalculateDistance();
    BOOL v10 = v9 < v8 && v9 > 1.0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_MKQuickRouteManager *)self mapItem];
  v6 = [v5 name];
  double v7 = [v3 stringWithFormat:@"<%@ %p: name=%@>", v4, self, v6];

  return v7;
}

- (void)_performWithTransportType:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v17 = v4;
    v5 = [(_MKQuickRouteManager *)self transportTypeFinder];

    if (v5)
    {
      v6 = [(_MKQuickRouteManager *)self transportTypeFinder];
      [(_MKQuickRouteManager *)self originCoordinate];
      double v8 = v7;
      double v10 = v9;
      [(_MKQuickRouteManager *)self destinationCoordinate];
      objc_msgSend(v6, "findDirectionsTypeForOriginCoordinate:destinationCoordinate:handler:", v17, v8, v10, v11, v12);
    }
    else
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)p_delegate);
        v17[2](v17, [v16 preferredDirectionsTypeForQuickRoute]);
      }
      else
      {
        v17[2](v17, 1);
      }
    }
    uint64_t v4 = v17;
  }
}

- (BOOL)_transportTypeShouldBeSmart
{
  v2 = [(_MKQuickRouteManager *)self transportTypeFinder];
  BOOL v3 = v2 == 0;

  return v3;
}

- (GEOAutomobileOptions)automobileOptions
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher automobileOptions];
}

- (void)setAutomobileOptions:(id)a3
{
}

- (GEOWalkingOptions)walkingOptions
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher walkingOptions];
}

- (void)setWalkingOptions:(id)a3
{
}

- (GEOTransitOptions)transitOptions
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher transitOptions];
}

- (void)setTransitOptions:(id)a3
{
}

- (GEOCyclingOptions)cyclingOptions
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher cyclingOptions];
}

- (void)setCyclingOptions:(id)a3
{
}

- (MKMapItem)mapItem
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher mapItem];
}

- (void)setMapItem:(id)a3
{
  id v8 = a3;
  id v4 = [(_MKRouteETAFetcher *)self->_etaFetcher mapItem];

  v5 = v8;
  if (v4 != v8)
  {
    [(_MKRouteETAFetcher *)self->_etaFetcher setMapItem:v8];
    if (v8)
    {
      [v8 _coordinate];
      self->_coordinate.latitude = v6;
      self->_coordinate.longitude = v7;
    }
    else
    {
      self->_coordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
    }
    [(_MKQuickRouteManager *)self _resetState];
    v5 = v8;
  }
}

- (void)setFetchAllTransportTypes:(BOOL)a3
{
  if (self->_fetchAllTransportTypes != a3)
  {
    self->_fetchAllTransportTypes = a3;
    [(_MKQuickRouteManager *)self _resetState];
  }
}

- (void)setAllowsDistantETA:(BOOL)a3
{
  if (self->_allowsDistantETA != a3)
  {
    self->_allowsDistantETA = a3;
    [(_MKQuickRouteManager *)self _resetState];
  }
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    self->_viewHasChangedSinceLastUpdate = 1;
  }
}

- (MKMapItem)originMapItem
{
  return [(_MKRouteETAFetcher *)self->_etaFetcher originMapItem];
}

- (void)setOriginMapItem:(id)a3
{
  id v5 = a3;
  id v4 = [(_MKRouteETAFetcher *)self->_etaFetcher originMapItem];

  if (v4 != v5)
  {
    [(_MKQuickRouteManager *)self willChangeValueForKey:@"usingCurrentLocationForOrigin"];
    [(_MKRouteETAFetcher *)self->_etaFetcher setOriginMapItem:v5];
    [(_MKQuickRouteManager *)self _resetState];
    [(_MKQuickRouteManager *)self didChangeValueForKey:@"usingCurrentLocationForOrigin"];
  }
}

- (void)_resetState
{
  lastETA = self->_lastETA;
  self->_lastETA = 0;

  self->_lastPreferredDirectionsType = 0;
  etaFetcher = self->_etaFetcher;

  [(_MKRouteETAFetcher *)etaFetcher _resetState];
}

- (id)routeETAForTransportType:(unint64_t)a3
{
  id v4 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  CLLocationDegrees v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)updateETA
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33___MKQuickRouteManager_updateETA__block_invoke;
  v2[3] = &unk_1E54BC560;
  v2[4] = self;
  [(_MKQuickRouteManager *)self _performWithTransportType:v2];
}

- (void)requestNewETAForPreferredTransportType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = v7;
  if (self->_fetchAllTransportTypes)
  {
    if (a3 != 1)
    {
      [v7 addObject:&unk_1ED97E820];
      if (a3 == 4)
      {
        [v8 addObject:&unk_1ED97E868];
LABEL_9:
        double v11 = &unk_1ED97E850;
LABEL_16:
        [v8 addObject:v11];
        goto LABEL_17;
      }
    }
    double v9 = [(_MKQuickRouteManager *)self delegate];
    int v10 = [v9 quickRouteShouldIncludeTransitWhenNotPreferredTransportType];

    if (v10) {
      [v8 addObject:&unk_1ED97E838];
    }
    if (a3 == 2) {
      goto LABEL_9;
    }
    [v8 addObject:&unk_1ED97E868];
    if (a3 != 8) {
      goto LABEL_9;
    }
  }
  else
  {
    if (a3 == 4) {
      goto LABEL_14;
    }
    if (a3 == 2)
    {
      double v11 = &unk_1ED97E820;
      goto LABEL_16;
    }
    if (a3 == 1 && ![(_MKQuickRouteManager *)self isOnlyDriving])
    {
LABEL_14:
      double v11 = &unk_1ED97E868;
      goto LABEL_16;
    }
  }
LABEL_17:
  etaFetcher = self->_etaFetcher;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74___MKQuickRouteManager_requestNewETAForPreferredTransportType_completion___block_invoke;
  v14[3] = &unk_1E54BC588;
  id v15 = v6;
  unint64_t v16 = a3;
  v14[4] = self;
  id v13 = v6;
  [(_MKRouteETAFetcher *)etaFetcher requestNewETAForTransportType:a3 additionalTransportTypes:v8 completion:v14];
}

- (BOOL)isUsingCurrentLocationForOrigin
{
  v2 = [(_MKQuickRouteManager *)self originMapItem];
  char v3 = [v2 isCurrentLocation];

  return v3;
}

- (CLLocationCoordinate2D)originCoordinate
{
  if ([(_MKQuickRouteManager *)self isUsingCurrentLocationForOrigin])
  {
    char v3 = +[MKLocationManager sharedLocationManager];
    if ([v3 hasLocation])
    {
      id v4 = +[MKLocationManager sharedLocationManager];
      id v5 = [v4 lastLocation];
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
    char v3 = [(_MKQuickRouteManager *)self originMapItem];
    [v3 _coordinate];
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
  char v3 = [(_MKQuickRouteManager *)self mapItem];

  if (v3)
  {
    id v4 = [(_MKQuickRouteManager *)self mapItem];
    [v4 _coordinate];
    CLLocationDegrees latitude = v5;
    CLLocationDegrees longitude = v7;
  }
  else
  {
    CLLocationDegrees latitude = self->_coordinate.latitude;
    CLLocationDegrees longitude = self->_coordinate.longitude;
  }
  double v9 = latitude;
  double v10 = longitude;
  result.CLLocationDegrees longitude = v10;
  result.CLLocationDegrees latitude = v9;
  return result;
}

- (id)bestETAForPreferredDirectionsType:(unint64_t)a3
{
  double v5 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if ([(_MKQuickRouteManager *)self isOnlyDriving])
    {
LABEL_3:
      double v7 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
      unint64_t v8 = v7;
      double v9 = &unk_1ED97E880;
LABEL_4:
      uint64_t v10 = [v7 objectForKeyedSubscript:v9];
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v8 = 0;
      unint64_t v13 = a3 - 1;
      unint64_t v11 = 0;
      switch(v13)
      {
        case 0uLL:
          v14 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v8 = [v14 objectForKeyedSubscript:&unk_1ED97E880];

          if (![(_MKQuickRouteManager *)self _transportTypeShouldBeSmart]) {
            goto LABEL_25;
          }
          id v15 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v11 = [v15 objectForKeyedSubscript:&unk_1ED97E898];

          if (!v8) {
            goto LABEL_29;
          }
          goto LABEL_27;
        case 1uLL:
          unint64_t v16 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v8 = [v16 objectForKeyedSubscript:&unk_1ED97E898];

          if (![(_MKQuickRouteManager *)self _transportTypeShouldBeSmart]) {
            goto LABEL_25;
          }
          if (!v8) {
            goto LABEL_3;
          }
          [v8 distance];
          if (v17 > self->_maxWalkingDistance)
          {
            v18 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
            v19 = [v18 objectForKeyedSubscript:&unk_1ED97E880];

            if (v19)
            {
              id v20 = v19;
              goto LABEL_30;
            }
          }
LABEL_25:
          unint64_t v11 = 0;
          goto LABEL_6;
        case 3uLL:
          v21 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v8 = [v21 objectForKeyedSubscript:&unk_1ED97E8B0];

          if (![(_MKQuickRouteManager *)self _transportTypeShouldBeSmart]) {
            goto LABEL_25;
          }
          v22 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v11 = [v22 objectForKeyedSubscript:&unk_1ED97E898];

          if (v8 || !v11)
          {
LABEL_27:
            if (!v11) {
              goto LABEL_6;
            }
          }
          else
          {
            [v11 distance];
            if (v23 <= self->_maxWalkingDistance) {
              goto LABEL_29;
            }
          }
          [v11 travelTime];
          if (v24 >= self->_closeWalkTravelTime) {
            goto LABEL_6;
          }
LABEL_29:
          id v20 = v11;
LABEL_30:
          uint64_t v10 = (uint64_t)v20;
          unint64_t v11 = v20;
          break;
        case 7uLL:
          double v7 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
          unint64_t v8 = v7;
          double v9 = &unk_1ED97E8C8;
          goto LABEL_4;
        default:
          goto LABEL_6;
      }
    }

    unint64_t v8 = (void *)v10;
LABEL_6:
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)directionsTypeForMapType:(unint64_t)a3
{
  double v5 = [(_MKQuickRouteManager *)self delegate];
  uint64_t v6 = [v5 preferredDirectionsTypeForQuickRoute];

  if (a3 == 104) {
    return 4;
  }
  [(_MKQuickRouteManager *)self originCoordinate];
  double v9 = v8;
  double v11 = v10;
  [(_MKQuickRouteManager *)self destinationCoordinate];

  return -[_MKQuickRouteManager directionsTypeForOriginCoordinate:destinationCoordinate:preferredDirectionsType:](self, "directionsTypeForOriginCoordinate:destinationCoordinate:preferredDirectionsType:", v6, v9, v11, v12, v13);
}

- (unint64_t)directionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 preferredDirectionsType:(unint64_t)a5
{
  if (a3.longitude < -180.0
    || a3.longitude > 180.0
    || a3.latitude < -90.0
    || a3.latitude > 90.0
    || a4.longitude < -180.0
    || a4.longitude > 180.0
    || a4.latitude < -90.0
    || a4.latitude > 90.0)
  {
    return a5;
  }
  GEOCalculateDistance();

  return -[_MKQuickRouteManager guessTransportTypeForDistance:preferredDirectionsType:](self, "guessTransportTypeForDistance:preferredDirectionsType:", a5);
}

- (unint64_t)guessTransportTypeForDistance:(double)a3 preferredDirectionsType:(unint64_t)a4
{
  double closeWalkTravelTime = self->_closeWalkTravelTime;
  double maxWalkingDistance = self->_maxWalkingDistance;
  if ([(_MKQuickRouteManager *)self isOnlyDriving]) {
    return 1;
  }
  double v9 = closeWalkTravelTime * 1.25;
  if (a4 == 4)
  {
    if (v9 <= a3) {
      return 4;
    }
    return 2;
  }
  if (a4 != 2)
  {
    if (a4 != 1) {
      return a4;
    }
    if (v9 <= a3) {
      return 1;
    }
    return 2;
  }
  if (maxWalkingDistance < a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)haveETAsForPreferredTransportType:(unint64_t)a3
{
  double v5 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  double v7 = [v5 objectForKey:v6];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(id)objc_opt_class() counterpartForTransportType:a3];
  double v9 = [(_MKRouteETAFetcher *)self->_etaFetcher etaResults];
  double v10 = [NSNumber numberWithUnsignedInteger:v8];
  double v11 = [v9 objectForKey:v10];
  BOOL v12 = v11 != 0;

  return v12;
}

- (BOOL)isOnlyDriving
{
  v2 = [(_MKQuickRouteManager *)self delegate];
  char v3 = [v2 quickRouteShouldOnlyUseAutomobile];

  return v3;
}

+ (unint64_t)directionsTypeForMapItem:(id)a3 delegate:(id)a4 mapType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setMapItem:v9];

  [v10 setDelegate:v8];
  unint64_t v11 = [v10 directionsTypeForMapType:a5];

  return v11;
}

- (MKQuickRouteManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKQuickRouteManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKQuickRouteTransportTypeFinding)transportTypeFinder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transportTypeFinder);

  return (MKQuickRouteTransportTypeFinding *)WeakRetained;
}

- (void)setTransportTypeFinder:(id)a3
{
}

- (MKQuickRouteConfigurableView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (MKQuickRouteConfigurableView *)WeakRetained;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (BOOL)fetchAllTransportTypes
{
  return self->_fetchAllTransportTypes;
}

- (BOOL)allowsDistantETA
{
  return self->_allowsDistantETA;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_transportTypeFinder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastETA, 0);

  objc_storeStrong((id *)&self->_etaFetcher, 0);
}

@end