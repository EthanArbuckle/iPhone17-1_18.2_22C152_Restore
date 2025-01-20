@interface GEOCyclingRouteMatcher
- (BOOL)_supportsSnapping;
- (GEOCyclingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5;
- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4;
- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5;
- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
@end

@implementation GEOCyclingRouteMatcher

- (GEOCyclingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOCyclingRouteMatcher;
  v8 = [(GEORouteMatcher *)&v12 initWithRoute:v6 auditToken:v7];
  v9 = v8;
  if (v8)
  {
    [(GEORouteMatcher *)v8 setShouldSnapRouteMatchToRoute:1];
    v10 = v9;
  }

  return v9;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v40 = 0xBF80000000000000;
  [v9 coordinate];
  double v19 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v39.latitude, (uint64_t)&v40, v11, v12, v13, v14, v15, v16, v17, v18);
  v20 = [(GEORouteMatcher *)self route];
  [v20 courseAtRouteCoordinateIndex:v40];
  double v22 = v21;

  [v9 horizontalAccuracy];
  -[GEOCyclingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v40, [v10 isGoodMatch], v23);
  double v25 = v24;
  [v9 course];
  double v26 = 0.0;
  double v27 = 0.0;
  if (v28 >= 0.0)
  {
    [v9 course];
    long double v30 = fmod(v22 - v29 + 180.0, 360.0);
    double v31 = fabs(fmod(v30 + 360.0, 360.0) + -180.0);
    if (v31 < 15.0) {
      double v31 = 15.0;
    }
    if (v31 <= 30.0) {
      double v27 = (30.0 - v31) / 15.0;
    }
    else {
      double v27 = 0.0;
    }
    double v26 = 0.3;
  }
  v32 = objc_alloc_init(_GEOCandidateRouteMatch);
  v33 = v32;
  if (v32)
  {
    double v34 = ((v25 - v19) / v25 + v26 * v27) / (v26 + 1.0);
    v32->_isGoodMatch = v34 > 0.0;
    v32->_score = v34;
    v32->_distanceFromRoute = v19;
    v32->_routeCoordinate = (PolylineCoordinate)v40;
    v32->_locationCoordinate = v39;
  }
  if (v8) {
    v35 = (void *)v8[7];
  }
  else {
    v35 = 0;
  }
  id v36 = v35;
  uint64_t v37 = [v36 stepIndex];
  if (v33) {
    v33->_stepIndex = v37;
  }

  -[_GEOCandidateRouteMatch setSegment:]((uint64_t)v33, v8);

  return v33;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 routeCoordinate];
  [v10 horizontalAccuracy];
  -[GEOCyclingRouteMatcher _modifiedHorizontalAccuracy:routeCoordinate:](self, "_modifiedHorizontalAccuracy:routeCoordinate:", v11);
  objc_msgSend(v8, "setModifiedHorizontalAccuracy:");
  [v8 setModifiedCourseAccuracy:-1.0];
  if (([v8 isGoodMatch] & 1) == 0)
  {
    [v10 horizontalAccuracy];
    -[GEOCyclingRouteMatcher _maxMatchDistance:routeCoordinate:previousMatchGood:](self, "_maxMatchDistance:routeCoordinate:previousMatchGood:", v11, 0);
    objc_msgSend(v8, "updateOffRouteProgress:minDistanceToGetOnRoute:", v9);
  }
  if ([v9 isGoodMatch])
  {
    if ([v8 isGoodMatch])
    {
      uint64_t v12 = [v8 stepIndex];
      if (v12 != [v9 stepIndex])
      {
        unint64_t v13 = self->_newStepProgressions + 1;
        self->_newStepProgressions = v13;
        if (v13 < 3) {
          goto LABEL_10;
        }
        double v14 = [(GEORouteMatcher *)self route];
        double v15 = [v8 step];
        uint64_t v16 = objc_msgSend(v14, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v15, "startRouteCoordinate"), 8.0);

        uint64_t v17 = [v8 routeCoordinate];
        if (v17 < v16
          || v17 == v16 && *((float *)&v17 + 1) < *((float *)&v16 + 1))
        {
LABEL_10:
          objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
        }
        else
        {
          self->_newStepProgressions = 0;
        }
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)GEOCyclingRouteMatcher;
  [(GEORouteMatcher *)&v18 _finishRouteMatch:v8 previousRouteMatch:v9 forLocation:v10];
}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousMatchGood:(BOOL)a5
{
  if (a5) {
    double v6 = 15.0;
  }
  else {
    double v6 = 10.0;
  }
  if (a5) {
    double v7 = 1.5;
  }
  else {
    double v7 = 1.0;
  }
  [(GEORouteMatcher *)self roadWidthForRouteCoordinate:a4];
  double v9 = v8 * 0.5;
  double v10 = v7 * a3;
  if (a3 < 0.0) {
    double v10 = v6;
  }
  double result = v10 + 3.7 + v9;
  if (result > 50.0) {
    return 50.0;
  }
  return result;
}

- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4
{
  double result = -1.0;
  if (a3 >= 0.0)
  {
    -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4, -1.0);
    return v6 + a3;
  }
  return result;
}

- (BOOL)_supportsSnapping
{
  v3 = [(GEORouteMatcher *)self route];
  if ([v3 usesZilch])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(GEORouteMatcher *)self route];
    char v4 = [v5 usesRoutingPathPoints];
  }
  return v4;
}

@end