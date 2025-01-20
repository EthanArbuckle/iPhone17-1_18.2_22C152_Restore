@interface _GEORouteMatchUpdater_Arrival
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater_Arrival)initWithRoute:(id)a3 arrivalStep:(id)a4;
- (id).cxx_construct;
@end

@implementation _GEORouteMatchUpdater_Arrival

- (_GEORouteMatchUpdater_Arrival)initWithRoute:(id)a3 arrivalStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_GEORouteMatchUpdater_Arrival;
  v8 = [(_GEORouteMatchUpdater_Arrival *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_arrivalStep, a4);
    v9->_arrivalRouteCoordinate = (PolylineCoordinate)0xBF80000000000000;
    v10 = [(GEOComposedRouteStep *)v9->_arrivalStep getPreviousStep];
    if ([v10 routeSegmentType] == 2)
    {
      [v10 endGeoCoordinate];
      v9->_destinationLocationCoordinate.latitude = v11;
      v9->_destinationLocationCoordinate.longitude = v12;
      v13 = [v10 transitStep];
      int v14 = [v13 hasWalkingIndex];

      if (v14) {
        v9->_arrivalRouteCoordinate = (PolylineCoordinate)objc_msgSend(v6, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v10, "endPointIndex"), 50.0);
      }
      v15 = objc_msgSend(v6, "segmentForStepIndex:", objc_msgSend(v10, "stepIndex"));
      v16 = [v15 steps];
      v17 = [v16 firstObject];

      v18 = [v17 getPreviousStep];
      if ([v18 routeSegmentType] == 5) {
        objc_storeStrong((id *)&v9->_previousExitStationStep, v18);
      }
    }
    v19 = v9;
  }
  return v9;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if (self->_previousExitStationStep)
    {
      unint64_t v11 = [v9 stepIndex];
      if (v11 <= [(GEOComposedRouteStep *)self->_previousExitStationStep stepIndex])
      {
        [v8 distanceFromRoute];
        if (v12 < 50.0) {
          goto LABEL_11;
        }
      }
    }
  }
  p_arrivalRouteCoordinate = &self->_arrivalRouteCoordinate;
  if ((self->_arrivalRouteCoordinate.index || fabsf(self->_arrivalRouteCoordinate.offset + 1.0) >= 0.00000011921)
    && [v8 isGoodMatch])
  {
    uint64_t v14 = [v8 routeCoordinate];
    if (v14 == p_arrivalRouteCoordinate->index)
    {
      if (*((float *)&v14 + 1) > COERCE_FLOAT(HIDWORD(*(unint64_t *)p_arrivalRouteCoordinate)))
      {
LABEL_13:
        objc_msgSend(v8, "setStepIndex:", -[GEOComposedRouteStep stepIndex](self->_arrivalStep, "stepIndex"));
        BOOL v19 = 1;
        goto LABEL_14;
      }
    }
    else if (v14 >= p_arrivalRouteCoordinate->index)
    {
      goto LABEL_13;
    }
  }
  double latitude = self->_destinationLocationCoordinate.latitude;
  double longitude = self->_destinationLocationCoordinate.longitude;
  [v10 coordinate];
  if (GEOCalculateDistanceRadius(latitude, longitude, v17, v18, 6367000.0) < 50.0) {
    goto LABEL_13;
  }
LABEL_11:
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousExitStationStep, 0);

  objc_storeStrong((id *)&self->_arrivalStep, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0xBF80000000000000;
  return self;
}

@end