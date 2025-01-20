@interface _GEORouteMatchUpdater_EnterBoard
- (BOOL)_hasLocationEnteredStation:(id)a3 routeMatch:(id)a4;
- (BOOL)_hasLocationExitedStation:(id)a3;
- (BOOL)_isLocationNearAccessPoint:(id)a3;
- (BOOL)_isLocationNearEndOfWalkingSegment:(id)a3;
- (BOOL)_isLocationNearTransitNode:(id)a3;
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_EnterBoard)initWithTransitRouteMatcher:(id)a3 boardVehicleStep:(id)a4;
- (id).cxx_construct;
@end

@implementation _GEORouteMatchUpdater_EnterBoard

- (_GEORouteMatchUpdater_EnterBoard)initWithTransitRouteMatcher:(id)a3 boardVehicleStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)_GEORouteMatchUpdater_EnterBoard;
  v8 = [(_GEORouteMatchUpdater *)&v39 initWithTransitRouteMatcher:v6];
  if (v8)
  {
    v9 = [v7 getPreviousStep];
    v10 = v9;
    if (v9)
    {
      v38 = [v9 getPreviousStep];
      v11 = -[GEOComposedRoute segmentForStepIndex:](v8->super._route, "segmentForStepIndex:", [v38 stepIndex]);
      unsigned int v12 = [v11 endPointIndex];
      unsigned int v13 = [v11 startPointIndex];
      uint64_t v14 = [(GEOComposedRoute *)v8->super._route routeCoordinateAtDistance:v12 beforeRouteCoordinate:150.0];
      LODWORD(v15) = HIDWORD(v14);
      if (*((float *)&v14 + 1) > 0.0) {
        unsigned int v16 = v14;
      }
      else {
        unsigned int v16 = v13;
      }
      if (*((float *)&v14 + 1) > 0.0) {
        float v17 = *((float *)&v14 + 1);
      }
      else {
        float v17 = 0.0;
      }
      if (v13 != v14)
      {
        unsigned int v16 = v13;
        float v17 = 0.0;
      }
      if (v13 >= v14) {
        unsigned int v18 = v16;
      }
      else {
        unsigned int v18 = v14;
      }
      if (v13 >= v14) {
        float v19 = v17;
      }
      else {
        float v19 = *((float *)&v14 + 1);
      }
      -[GEOComposedRoute pointAt:](v8->super._route, "pointAt:", objc_msgSend(v11, "endPointIndex", v15));
      v8->_entranceCoordinate.latitude = v20;
      v8->_entranceCoordinate.longitude = v21;
      v8->_routeCoordinateApproaching.index = v18;
      v8->_routeCoordinateApproaching.offset = v19;
      v8->_routeCoordinateAtStation.index = v12;
      v8->_routeCoordinateAtStation.offset = 0.0;
      objc_storeStrong((id *)&v8->_enterStationStep, v10);
    }
    else
    {
      v8->_hasEnteredStation = 1;
    }
    uint64_t v22 = [v7 startingStop];
    transitStop = v8->_transitStop;
    v8->_transitStop = (GEOPBTransitStop *)v22;

    uint64_t v24 = [(GEOComposedRoute *)v8->super._route getStationForStop:v8->_transitStop];
    transitStation = v8->_transitStation;
    v8->_transitStation = (GEOPBTransitStation *)v24;

    objc_storeStrong((id *)&v8->_boardVehicleStep, a4);
    v26 = [v7 getNextStep];
    objc_storeStrong((id *)&v8->_rideStep, v26);
    if (v8->_transitStation)
    {
      id v27 = v10;
      v28 = v27;
      if (v10)
      {
        [v27 startGeoCoordinate];
        double v30 = v29;
        double v32 = v31;
      }
      else
      {
        double v30 = -180.0;
        double v32 = -180.0;
      }
      v33 = v8->_transitStation;
      v34 = [v28 accessPoint];
      -[_GEORouteMatchUpdater _stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:](v8, "_stationRadiusForStation:accessPoint:adjacentWalkingLegCoordinate:", v33, v34, v30, v32);
      v8->super._stationRadius = v35;
    }
    v36 = v8;
  }
  return v8;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    unint64_t v11 = [v9 stepIndex];
    if (v11 > [(GEOComposedRouteStep *)self->_boardVehicleStep stepIndex])
    {
LABEL_6:
      BOOL v12 = 0;
      goto LABEL_19;
    }
  }
  if (self->_hasEnteredStation)
  {
    if ([(_GEORouteMatchUpdater_EnterBoard *)self _hasLocationExitedStation:v10]) {
      goto LABEL_5;
    }
  }
  else if (![(_GEORouteMatchUpdater_EnterBoard *)self _hasLocationEnteredStation:v10 routeMatch:v8])
  {
LABEL_5:
    if (!self->_hasEnteredStation)
    {
      uint64_t v17 = [v8 routeCoordinate];
      unsigned int index = self->_routeCoordinateApproaching.index;
      if (index < v17
        || index == v17 && self->_routeCoordinateApproaching.offset < *((float *)&v17 + 1))
      {
        unsigned int v19 = self->_routeCoordinateAtStation.index;
        if (v19 > v17
          || v19 == v17 && self->_routeCoordinateAtStation.offset > *((float *)&v17 + 1))
        {
          objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_enterStationStep, "stepIndex"));
          enterStationStep = self->_enterStationStep;
          double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&enterStationStep count:1];
          [v8 setCandidateSteps:v20];

          BOOL v12 = 1;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_6;
  }
  [v8 setIsGoodMatch:1];
  objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_boardVehicleStep, "stepIndex"));
  rideStep = self->_rideStep;
  v23[0] = self->_boardVehicleStep;
  v23[1] = rideStep;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v8 setCandidateSteps:v14];

  transitStation = self->_transitStation;
  if (transitStation) {
    uint64_t v16 = [(GEOPBTransitStation *)transitStation muid];
  }
  else {
    uint64_t v16 = [(GEOPBTransitStop *)self->_transitStop muid];
  }
  [v8 setTransitID:v16];
  if ([v10 hasTransitID]) {
    [v8 setModifiedHorizontalAccuracy:self->super._stationRadius];
  }
  BOOL v12 = 1;
  self->_hasEnteredStation = 1;
LABEL_19:

  return v12;
}

- (BOOL)_hasLocationEnteredStation:(id)a3 routeMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_hasEnteredStation
    || ([v7 distanceFromRoute], v11 < 50.0)
    && ([(_GEORouteMatchUpdater_EnterBoard *)self _isLocationNearEndOfWalkingSegment:v6]|| [(_GEORouteMatchUpdater_EnterBoard *)self _isLocationNearAccessPoint:v6]))
  {
    BOOL v9 = 1;
  }
  else
  {
    transitStation = self->_transitStation;
    if (transitStation) {
      BOOL v13 = [(GEOPBTransitStation *)transitStation structureType] != 3;
    }
    else {
      BOOL v13 = 1;
    }
    BOOL v9 = (![v6 hasType]
       || ([v6 type] != 1 ? (int v14 = 1) : (int v14 = v13), v14 == 1))
      && [(_GEORouteMatchUpdater_EnterBoard *)self _isLocationNearTransitNode:v6];
  }

  return v9;
}

- (BOOL)_hasLocationExitedStation:(id)a3
{
  id v4 = a3;
  if (self->_hasEnteredStation) {
    BOOL v5 = ![(_GEORouteMatchUpdater_EnterBoard *)self _isLocationNearTransitNode:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isLocationNearEndOfWalkingSegment:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  double latitude = self->_entranceCoordinate.latitude;
  double longitude = self->_entranceCoordinate.longitude;
  LODWORD(self) = [(GEOComposedTransitTripRouteStep *)self->_rideStep isBus];
  [v4 horizontalAccuracy];
  double v12 = v11;
  double v13 = GEOCalculateDistanceRadius(v6, v8, latitude, longitude, 6367000.0);
  double v14 = 50.0;
  if (self) {
    double v14 = 15.0;
  }
  BOOL v15 = v13 < v14 + v12;

  return v15;
}

- (BOOL)_isLocationNearTransitNode:(id)a3
{
  id v4 = a3;
  transitStation = self->_transitStation;
  if (!transitStation) {
    goto LABEL_11;
  }
  double stationRadius = self->super._stationRadius;
  if (stationRadius <= 0.0) {
    double stationRadius = 100.0;
  }
  double v7 = 200.0;
  if (stationRadius > 100.0) {
    double v7 = stationRadius + stationRadius;
  }
  double v8 = self->_hasEnteredStation ? v7 : stationRadius;
  BOOL v9 = [(GEOPBTransitStation *)transitStation location];
  [v9 coordinate];
  BOOL v12 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v4, [(GEOPBTransitStation *)self->_transitStation muid], v10, v11, v8);

  if (v12) {
    BOOL v13 = 1;
  }
  else {
LABEL_11:
  }
    BOOL v13 = [(_GEORouteMatchUpdater *)self _isLocation:v4 nearStop:self->_transitStop];

  return v13;
}

- (BOOL)_isLocationNearAccessPoint:(id)a3
{
  id v4 = a3;
  transitStation = self->_transitStation;
  if (transitStation && [(GEOPBTransitStation *)transitStation hasMuid])
  {
    uint64_t v18 = 0;
    unsigned int v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    mapFeatureAccess = self->super._mapFeatureAccess;
    unint64_t v7 = [(GEOPBTransitStation *)self->_transitStation muid];
    [v4 coordinate];
    double v9 = v8;
    double v11 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke;
    v15[3] = &unk_1E53EA530;
    v15[4] = self;
    uint64_t v17 = &v18;
    id v16 = v4;
    id v12 = -[GEOMapFeatureAccess findTransitPointWithID:near:pointHandler:completionHandler:](mapFeatureAccess, "findTransitPointWithID:near:pointHandler:completionHandler:", v7, v15, 0, v9, v11);
    BOOL v13 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStep, 0);
  objc_storeStrong((id *)&self->_boardVehicleStep, 0);
  objc_storeStrong((id *)&self->_enterStationStep, 0);
  objc_storeStrong((id *)&self->_transitStation, 0);

  objc_storeStrong((id *)&self->_transitStop, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0xBF80000000000000;
  *((void *)self + 12) = 0xBF80000000000000;
  return self;
}

@end