@interface _GEORouteMatchUpdater
- (BOOL)_isLocation:(id)a3 nearStation:(id)a4;
- (BOOL)_isLocation:(id)a3 nearStop:(id)a4;
- (BOOL)_isLocation:(id)a3 nearTransitPoint:(id)a4 transitID:(unint64_t)a5 featureSize:(double)a6;
- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
- (_GEORouteMatchUpdater)initWithTransitRouteMatcher:(id)a3;
- (double)_stationRadiusForStation:(id)a3 accessPoint:(id)a4 adjacentWalkingLegCoordinate:(id)a5;
- (unint64_t)priority;
@end

@implementation _GEORouteMatchUpdater

- (_GEORouteMatchUpdater)initWithTransitRouteMatcher:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_GEORouteMatchUpdater;
  v5 = [(_GEORouteMatchUpdater *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_routeMatcher, v4);
    uint64_t v7 = [v4 route];
    route = v6->_route;
    v6->_route = (GEOComposedRoute *)v7;

    v9 = objc_alloc_init(GEOMapFeatureAccess);
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = v9;

    v11 = [v4 auditToken];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAuditToken:v11];

    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAllowNetworkTileLoad:1];
    uint64_t v12 = [v4 motionContext];
    motionContext = v6->_motionContext;
    v6->_motionContext = (GEOMotionContext *)v12;

    v14 = v6;
  }

  return v6;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  return 0;
}

- (unint64_t)priority
{
  return 0;
}

- (BOOL)_isLocation:(id)a3 nearStop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 latLng];
    [v9 coordinate];
    BOOL v12 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, [v8 muid], v10, v11, 50.0);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_isLocation:(id)a3 nearStation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_stationRadius <= 0.0) {
    double stationRadius = 100.0;
  }
  else {
    double stationRadius = self->_stationRadius;
  }
  if (v7)
  {
    double v10 = [v7 location];
    [v10 coordinate];
    BOOL v13 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, [v8 muid], v11, v12, stationRadius);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isLocation:(id)a3 nearTransitPoint:(id)a4 transitID:(unint64_t)a5 featureSize:(double)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  if ([v11 hasTransitID] && objc_msgSend(v11, "transitID") == a5)
  {
    LOBYTE(a5) = 1;
  }
  else
  {
    [v11 coordinate];
    double v14 = GEOCalculateDistanceRadius(v12, v13, var0, var1, 6367000.0);
    if (v14 >= 1000.0) {
      goto LABEL_22;
    }
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__76;
    v75 = __Block_byref_object_dispose__76;
    id v76 = 0;
    mapFeatureAccess = self->_mapFeatureAccess;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke;
    v70[3] = &unk_1E53EA4E0;
    v70[4] = self;
    v70[5] = &v71;
    id v16 = -[GEOMapFeatureAccess findTransitPointWithID:near:pointHandler:completionHandler:](mapFeatureAccess, "findTransitPointWithID:near:pointHandler:completionHandler:", a5, v70, 0, var0, var1);
    v17 = (void *)v72[5];
    if (!v17) {
      goto LABEL_20;
    }
    if ([v17 polygonPointsCount])
    {
      [(id)v72[5] boundingRadius];
      self->_double stationRadius = v18;
      [v11 coordinate];
      double v20 = v19;
      double v22 = v21;
      [(id)v72[5] boundingRect];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = GEOTilePointForCoordinate(v20, v22, 20.0);
      double v33 = v31;
      char v34 = 0;
      if (fabs(v24) == INFINITY || fabs(v26) == INFINITY || v32 < v24)
      {
        LOBYTE(a5) = 0;
      }
      else
      {
        BOOL v36 = v32 < v24 + v28 && v31 >= v26 && v31 < v26 + v30;
        LOBYTE(a5) = 0;
        if (v36)
        {
          v37 = (double *)[(id)v72[5] polygonPoints];
          if (GEOMapPointInPolygon(v37, [(id)v72[5] polygonPointsCount], v32, v33))
          {
            char v34 = 0;
            LOBYTE(a5) = 1;
          }
          else if (GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1E91146F8) >= 0.0)
          {
            double Double = GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1E91146F8);
            [v11 horizontalAccuracy];
            if (Double <= v40)
            {
              [v11 horizontalAccuracy];
              double v64 = v41;
            }
            else
            {
              double v64 = GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1E91146F8);
            }
            uint64_t v42 = 0;
            unint64_t v43 = 0;
            double v65 = v14;
            double v66 = a6;
            while (1)
            {
              uint64_t v44 = [(id)v72[5] polygonPointsCount];
              LOBYTE(a5) = v43 < v44 - 1;
              if (v43 >= v44 - 1) {
                break;
              }
              uint64_t v45 = v43;
              if (!v43) {
                uint64_t v45 = [(id)v72[5] polygonPointsCount];
              }
              uint64_t v46 = [(id)v72[5] polygonPoints];
              double v47 = *(double *)(v46 + v42);
              long double v48 = exp((*(double *)(v46 + v42 + 8) * 0.0078125 + -1048576.0) / 333772.107);
              double v49 = atan(v48);
              v50 = (double *)([(id)v72[5] polygonPoints] + 16 * (v45 - 1));
              double v51 = v50[1];
              double v69 = *v50;
              [v11 coordinate];
              double v53 = v52;
              double v55 = v54;
              [v11 coordinate];
              double v67 = v57;
              double v68 = v56;
              long double v58 = exp((v51 * 0.0078125 + -1048576.0) / 333772.107);
              long double v59 = atan(v58);
              double v62 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D((v49 * -2.0 + 1.57079633) * 57.2957795, v47 * 0.0078125 * 0.000171661377 + -180.0, 1.79769313e308, (v59 * -2.0 + 1.57079633) * 57.2957795, v69 * 0.0078125 * 0.000171661377 + -180.0, 1.79769313e308, v60, v61, v53, v55);
              char v34 = 0;
              ++v43;
              v42 += 16;
              double v14 = v65;
              a6 = v66;
              if (GEOCalculateDistanceRadius(v62, v63, v68, v67, 6367000.0) < v64) {
                goto LABEL_21;
              }
            }
            char v34 = 0;
          }
          else
          {
            char v34 = 0;
            LOBYTE(a5) = 0;
          }
        }
      }
    }
    else
    {
LABEL_20:
      char v34 = 1;
    }
LABEL_21:
    _Block_object_dispose(&v71, 8);

    if (v34) {
LABEL_22:
    }
      LOBYTE(a5) = v14 < a6;
  }

  return a5 & 1;
}

- (double)_stationRadiusForStation:(id)a3 accessPoint:(id)a4 adjacentWalkingLegCoordinate:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    double v10 = 50.0;
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      id v11 = [v8 location];
      [v11 coordinate];
      double v13 = v12;
      double v15 = v14;

      double v10 = GEOCalculateDistanceRadius(v13, v15, var0, var1, 6367000.0);
      if (v9)
      {
        id v16 = [v9 location];
        [v16 coordinate];
        double v18 = v17;
        double v20 = v19;

        double v21 = GEOCalculateDistanceRadius(v13, v15, v18, v20, 6367000.0);
        if (v10 <= v21) {
          double v10 = v21;
        }
      }
    }
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_motionContext, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_destroyWeak((id *)&self->_routeMatcher);
}

@end