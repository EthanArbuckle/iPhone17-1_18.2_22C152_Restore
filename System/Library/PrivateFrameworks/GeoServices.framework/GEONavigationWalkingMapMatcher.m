@interface GEONavigationWalkingMapMatcher
- (id)_routeMatcherForRoute:(id)a3;
- (id)matchLocation:(id)a3 transportType:(int)a4;
- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5;
- (int)transportType;
@end

@implementation GEONavigationWalkingMapMatcher

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  id v6 = a3;
  v7 = [(GEONavigationMapMatcher *)self routeMatcher];

  if (!v7)
  {
    v8 = [GEOWalkingRouteMatcher alloc];
    v9 = [(GEONavigationMapMatcher *)self route];
    v10 = [(GEONavigationMapMatcher *)self auditToken];
    v11 = [(GEOWalkingRouteMatcher *)v8 initWithRoute:v9 auditToken:v10];
    [(GEONavigationMapMatcher *)self setRouteMatcher:v11];
  }
  v12 = [(GEONavigationMapMatcher *)self route];
  int v13 = [v12 transportType];

  if (v13 != 1 && v13 != [(GEONavigationWalkingMapMatcher *)self transportType])
  {
    v30 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
    v32 = [(GEONavigationMapMatcher *)self previousMatchResult];
    v33 = [v32 routeMatch];
    [v30 setRouteMatch:v33];

    [(GEONavigationMapMatcher *)self setPreviousMatchResult:v30];
    goto LABEL_57;
  }
  v14 = [(GEONavigationMapMatcher *)self previousMatchResult];
  v15 = [v14 routeMatch];

  v16 = [(GEONavigationMapMatcher *)self route];

  if (v16)
  {
    v17 = [(GEONavigationMapMatcher *)self routeMatcher];
    v16 = [v17 matchToRouteWithLocation:v6 previousRouteMatch:v15];

    if (!v16)
    {
      v18 = [GEOWalkingRouteMatcher alloc];
      v19 = [(GEONavigationMapMatcher *)self route];
      v20 = [(GEONavigationMapMatcher *)self auditToken];
      v21 = [(GEOWalkingRouteMatcher *)v18 initWithRoute:v19 auditToken:v20];

      [(GEORouteMatcher *)v21 maxMatchDistanceFromPreviousRouteMatch];
      double v23 = v22;
      v24 = [(GEONavigationMapMatcher *)self route];
      [v24 distance];
      [(GEORouteMatcher *)v21 setMaxMatchDistanceFromPreviousRouteMatch:"setMaxMatchDistanceFromPreviousRouteMatch:"];

      v16 = [(GEORouteMatcher *)v21 matchToRouteWithLocation:v6];
      [(GEORouteMatcher *)v21 setMaxMatchDistanceFromPreviousRouteMatch:v23];
      if (!v16)
      {
        v16 = [(GEORouteMatcher *)v21 matchToClosestPointOnRouteWithLocation:v6];
      }
    }
  }
  v25 = [(GEONavigationMapMatcher *)self route];
  int v26 = [v25 transportType];
  BOOL v27 = 1;
  if (a4 != 4 && v26 != 1) {
    BOOL v27 = [(GEONavigationWalkingMapMatcher *)self transportType] == a4;
  }

  if (v15 && [v15 isGoodMatch])
  {
    v28 = [(GEONavigationMapMatcher *)self previousMatchResult];
    uint64_t v29 = [v28 type];

    if (!v27 && (v29 || ([v16 isGoodMatch] & 1) == 0)) {
      goto LABEL_18;
    }
LABEL_20:
    if (v16) {
      int v31 = [v16 isGoodMatch];
    }
    else {
      int v31 = 0;
    }
    v34 = [(GEONavigationMapMatcher *)self route];
    uint64_t v35 = [v34 source];

    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      char v36 = v31;
    }
    else {
      char v36 = 0;
    }
    if (v36)
    {
      v37 = 0;
      goto LABEL_52;
    }
    v38 = [(GEONavigationMapMatcher *)self roadMatcher];
    v37 = objc_msgSend(v38, "matchLocation:forTransportType:", v6, -[GEONavigationWalkingMapMatcher transportType](self, "transportType"));

    if (v37) {
      BOOL v39 = v27;
    }
    else {
      BOOL v39 = 0;
    }
    if (v37)
    {
      [v37 distanceFromRoad];
      double v41 = v40;
      [v6 horizontalAccuracy];
      if (v41 <= v42 + 20.0 && v39)
      {
        [v16 locationCoordinate3D];
        double v45 = v44;
        double v47 = v46;
        [v37 coordinateOnRoad];
        if (GEOCalculateDistanceRadius(v45, v47, v48, v49, 6367000.0) > 10.0)
        {
          [v37 distanceFromJunction];
          double v51 = v50;
          [v37 junctionRadius];
          double v53 = v52;
          [v6 horizontalAccuracy];
          double v55 = v54;
          [v6 horizontalAccuracy];
          if (v56 >= 0.0 && v51 - v53 - v55 < 12.0)
          {
            self->_unint64_t numProgressionsOffRoute = 0;
            if ((v31 & 1) == 0)
            {
LABEL_51:
              v69 = +[GEONavigationMatchResult matchResultWithRoadMatch:v37 location:v6];
LABEL_55:
              v30 = v69;
              [v69 setRouteMatch:v16];
              [(GEONavigationMapMatcher *)self setPreviousMatchResult:v30];

              goto LABEL_56;
            }
LABEL_53:
            v69 = +[GEONavigationMatchResult matchResultWithRouteMatch:v16 location:v6];
            goto LABEL_55;
          }
          [v16 distanceFromRoute];
          double v58 = v57;
          [v16 modifiedHorizontalAccuracy];
          double v60 = v59;
          [v6 course];
          if (v61 >= 0.0)
          {
            [v6 course];
            double v64 = v63;
            [v37 courseOnRoad];
            long double v66 = fmod(v65 - v64 + 180.0, 360.0);
            double v67 = fmod(v66 + 360.0, 360.0) + -180.0;
            if (v67 >= 180.0 - v67) {
              double v67 = 180.0 - v67;
            }
            BOOL v62 = v67 <= 35.0;
          }
          else
          {
            BOOL v62 = 1;
          }
          if (v58 - v60 + -10.0 > v41 && v62)
          {
            unint64_t numProgressionsOffRoute = self->_numProgressionsOffRoute;
            if (numProgressionsOffRoute > 2) {
              goto LABEL_51;
            }
            self->_unint64_t numProgressionsOffRoute = numProgressionsOffRoute + 1;
            if (!v31) {
              goto LABEL_51;
            }
            goto LABEL_53;
          }
        }
      }
    }
LABEL_52:
    self->_unint64_t numProgressionsOffRoute = 0;
    if ((v31 & 1) == 0)
    {
      v69 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  if (v27) {
    goto LABEL_20;
  }
LABEL_18:
  v30 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
  [v30 setRouteMatch:v16];
  [(GEONavigationMapMatcher *)self setPreviousMatchResult:v30];
LABEL_56:

LABEL_57:

  return v30;
}

- (id)updateForReroute:(id)a3 location:(id)a4 routeStartsFromLocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(GEONavigationMapMatcher *)self route];

  if (v10 != v8) {
    self->_unint64_t numProgressionsOffRoute = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)GEONavigationWalkingMapMatcher;
  v11 = [(GEONavigationMapMatcher *)&v13 updateForReroute:v8 location:v9 routeStartsFromLocation:v5];

  return v11;
}

- (int)transportType
{
  return 2;
}

- (id)_routeMatcherForRoute:(id)a3
{
  id v4 = a3;
  BOOL v5 = [GEOWalkingRouteMatcher alloc];
  id v6 = [(GEONavigationMapMatcher *)self auditToken];
  v7 = [(GEOWalkingRouteMatcher *)v5 initWithRoute:v4 auditToken:v6];

  return v7;
}

@end