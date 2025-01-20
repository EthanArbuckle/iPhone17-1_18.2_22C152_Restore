@interface GEORouteBuilderBase
- (BOOL)_buildBoundingMapRegion;
- (BOOL)_buildComponents;
- (BOOL)_buildCoordinates;
- (BOOL)_buildSections;
- (BOOL)_setMiscInfo;
- (GEOComposedRoute)route;
- (id)_newRouteInstance;
- (id)_newSegmentWithRange:(GEOPolylineCoordinateRange)a3 stepRange:(_NSRange)a4 index:(unint64_t)a5;
- (id)_newStepWithRange:(GEOPolylineCoordinateRange)a3 maneuverStart:(PolylineCoordinate)a4 index:(unint64_t)a5;
- (id)_singleLegWithLocationTypeWaypoints;
- (id)buildRoute;
- (int)_transportType;
@end

@implementation GEORouteBuilderBase

- (id)buildRoute
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetGEORouteBuilderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v22 = objc_opt_class();
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "Building route using %@.", buf, 0xCu);
  }

  v4 = [(GEORouteBuilderBase *)self _newRouteInstance];
  route = self->_route;
  self->_route = v4;

  [(GEOComposedRoute *)self->_route setTransportType:[(GEORouteBuilderBase *)self _transportType]];
  if (![(GEORouteBuilderBase *)self _buildCoordinates])
  {
    v8 = GEOGetGEORouteBuilderLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v17 = "Error building coordinates.";
LABEL_20:
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_21;
  }
  if (![(GEORouteBuilderBase *)self _buildComponents])
  {
    v8 = GEOGetGEORouteBuilderLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v17 = "Error building components.";
    goto LABEL_20;
  }
  if (![(GEORouteBuilderBase *)self _buildSections])
  {
    v8 = GEOGetGEORouteBuilderLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v17 = "Error building sections.";
    goto LABEL_20;
  }
  if (![(GEORouteBuilderBase *)self _buildBoundingMapRegion])
  {
    v8 = GEOGetGEORouteBuilderLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v17 = "Error building bounding map region.";
    goto LABEL_20;
  }
  if (![(GEORouteBuilderBase *)self _setMiscInfo])
  {
    v8 = GEOGetGEORouteBuilderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Error setting misc info.";
      goto LABEL_20;
    }
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  v6 = self->_route;
  v7 = self->_route;
  self->_route = 0;

  v8 = GEOGetGEORouteBuilderLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(GEOComposedRoute *)v6 pointCount];
    v20 = [(GEOComposedRoute *)v6 legs];
    int v10 = [v20 count];
    v19 = [(GEOComposedRoute *)v6 segments];
    int v11 = [v19 count];
    v12 = [(GEOComposedRoute *)v6 steps];
    int v13 = [v12 count];
    v14 = [(GEOComposedRoute *)v6 anchorPoints];
    int v15 = [v14 count];
    v16 = [(GEOComposedRoute *)v6 uniqueRouteID];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v22 = v9;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v10;
    __int16 v23 = 1024;
    int v24 = v11;
    __int16 v25 = 1024;
    int v26 = v13;
    __int16 v27 = 1024;
    int v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "Successfully built route. Coordinates: %d | Legs: %d | Segments: %d | Steps: %d | Anchors: %d | ID: %@", buf, 0x2Au);
  }
LABEL_22:

  return v6;
}

- (void).cxx_destruct
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (int)_transportType
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 4;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  return 1;
}

- (BOOL)_buildComponents
{
  return 1;
}

- (BOOL)_buildSections
{
  v42 = [(GEOComposedRoute *)self->_route coordinates];
  uint64_t v3 = [v42 coordinateCount];
  if (v3)
  {
    v4 = [(GEOComposedRoute *)self->_route steps];
    v37 = [(GEOComposedRoute *)self->_route segments];
    v36 = v4;
    int v5 = [v42 coordinateCount];
    v6 = [v4 firstObject];
    v41 = [v37 firstObject];
    v40 = self;
    uint64_t v35 = v3;
    v39 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = 0;
    unsigned int v38 = v5 - 1;
    float v8 = 0.0;
    while (1)
    {
      if (v7 >= v38 && (v7 != v38 || v8 >= 0.0))
      {
        [(GEOComposedRoute *)v40->_route setSections:v39];

        uint64_t v3 = v35;
        goto LABEL_35;
      }
      unint64_t v9 = v7 | ((unint64_t)LODWORD(v8) << 32);
      uint64_t v10 = [v42 routeCoordinateForDistance:v9 afterRouteCoordinate:16000.0];
      float v11 = *((float *)&v10 + 1);
      id v12 = v41;
      int v13 = v12;
      if (!v12) {
        break;
      }
      uint64_t v14 = [v12 endRouteCoordinate];
      if (v14 < v10) {
        goto LABEL_10;
      }
      if (v14 == v10)
      {
        int v15 = v13;
        if (*((float *)&v14 + 1) < *((float *)&v10 + 1))
        {
LABEL_10:
          uint64_t v10 = [v13 endRouteCoordinate];
          int v15 = [v13 nextSegment];
          float v11 = *((float *)&v10 + 1);

          if (v6) {
            goto LABEL_14;
          }
          goto LABEL_23;
        }
        goto LABEL_13;
      }
      int v15 = v13;
      if (v6)
      {
        do
        {
LABEL_14:
          uint64_t v16 = [v6 routeCoordinateRange];
          if (v7 == v17)
          {
            if (v8 >= v18) {
              break;
            }
          }
          else if (v7 > v17)
          {
            break;
          }
          if (v10 == v16)
          {
            if (v11 <= *((float *)&v16 + 1)) {
              break;
            }
          }
          else if (v10 < v16)
          {
            break;
          }
          [0 addObject:v6];
          uint64_t v19 = [v6 getNextStep];

          v6 = (void *)v19;
        }
        while (v19);
      }
LABEL_23:
      if (v13) {
        int v20 = [v13 transportType];
      }
      else {
        int v20 = [(GEOComposedRoute *)v40->_route transportType];
      }
      int v21 = v20;
      [v42 distanceFromStartToRouteCoordinate:v7 | ((unint64_t)LODWORD(v8) << 32)];
      double v23 = v22;
      int v24 = [0 lastObject];
      if (v24)
      {
        __int16 v25 = [0 lastObject];
        uint64_t v26 = [v25 stepIndex];
      }
      else
      {
        uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      }

      long long v45 = 0u;
      long long v46 = 0u;
      long long v44 = 0u;
      route = v40->_route;
      if (route) {
        -[GEOComposedRoute coarseBoundsForRange:sampleLength:](route, "coarseBoundsForRange:sampleLength:", v9, v10 | ((unint64_t)LODWORD(v11) << 32), 25.0);
      }
      int v28 = [GEOComposedRouteSection alloc];
      uint64_t v29 = [v13 segmentIndex];
      v43[0] = v44;
      v43[1] = v45;
      v43[2] = v46;
      LODWORD(v34) = v21;
      v30 = [(GEOComposedRouteSection *)v28 initWithCoordinates:v42 segment:v13 segmentIndex:v29 steps:0 startCoordinateIndex:v7 coordinateCount:(v10 - v7 + 1) bounds:v23 transportType:1.0 finalStepIndex:v43 startDistance:v34 lengthScaleFactor:v26];
      [v39 addObject:v30];
      uint64_t v31 = [0 lastObject];

      id v32 = v15;
      v41 = v32;

      uint64_t v7 = v10;
      float v8 = v11;
      v6 = (void *)v31;
    }
    int v15 = 0;
LABEL_13:
    if (v6) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_35:

  return v3 != 0;
}

- (BOOL)_buildBoundingMapRegion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEOComposedRoute *)self->_route sections];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v5 = [(GEOComposedRoute *)self->_route sections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    double v8 = 0.0;
    double v9 = INFINITY;
    double v10 = INFINITY;
    double v11 = INFINITY;
    long long v18 = 0u;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        int v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        *(double *)int v20 = v9;
        *(double *)&v20[1] = v10;
        *(double *)&v20[2] = v11;
        *(double *)&v20[3] = v8;
        long long v21 = v18;
        if (v13) {
          [v13 bounds];
        }
        else {
          memset(v19, 0, sizeof(v19));
        }
        GEOMapBoxUnion((uint64_t)v20, (uint64_t)v19, (uint64_t)v22);
        double v9 = *(double *)v22;
        double v10 = *(double *)&v22[1];
        double v11 = *(double *)&v22[2];
        double v8 = *(double *)&v22[3];
        long long v18 = v23;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
    double v9 = INFINITY;
    double v10 = INFINITY;
    double v11 = INFINITY;
    *(void *)&long long v18 = 0;
  }

  BOOL v14 = fabs(v9) == INFINITY;
  if (fabs(v10) == INFINITY) {
    BOOL v14 = 1;
  }
  char v15 = fabs(v11) == INFINITY || v14;
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v9, v10, v8, *(double *)&v18);
    [(GEOComposedRoute *)self->_route setBoundingMapRegion:v16];
  }
  return v15 ^ 1;
}

- (BOOL)_setMiscInfo
{
  return 1;
}

- (id)_singleLegWithLocationTypeWaypoints
{
  v2 = [(GEORouteBuilderBase *)self route];
  if ([v2 pointCount] >= 2)
  {
    [v2 pointAt:0];
    uint64_t v6 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v4, v5);
    uint64_t v7 = [[GEOComposedWaypoint alloc] initWithLocation:v6 isCurrentLocation:0];
    objc_msgSend(v2, "pointAt:", objc_msgSend(v2, "pointCount") - 1);
    double v10 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v8, v9);
    double v11 = [[GEOComposedWaypoint alloc] initWithLocation:v10 isCurrentLocation:0];
    uint64_t v3 = [[GEOComposedRouteLeg alloc] initWithComposedRoute:v2 geoRouteLeg:0 legIndex:0 origin:v7 destination:v11 arrivalParameters:0];
    -[GEOComposedRouteLeg setPointRange:](v3, "setPointRange:", 0, [v2 pointCount]);
    -[GEOComposedRouteLeg setStepRange:](v3, "setStepRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[GEOComposedRouteLeg setSegmentRange:](v3, "setSegmentRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [v2 distance];
    -[GEOComposedRouteLeg setDistance:](v3, "setDistance:");
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_newSegmentWithRange:(GEOPolylineCoordinateRange)a3 stepRange:(_NSRange)a4 index:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = vcvtas_u32_f32((float)a3.start.index + a3.start.offset);
  if (a3.start.offset >= 0.0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v11 = vcvtas_u32_f32((float)a3.end.index + a3.end.offset);
  if (a3.end.offset >= 0.0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v13 = v12 - v10 + 1;
  switch([(GEORouteBuilderBase *)self _transportType])
  {
    case 0:
      BOOL v14 = [GEOComposedDrivingRouteSegment alloc];
      char v15 = [(GEORouteBuilderBase *)self route];
      unint64_t v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v14, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 1:
      unsigned int v17 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v26 = 0;
      long long v18 = "_newSegmentWithRange: does not support transit segments yet.";
      uint64_t v19 = (uint8_t *)&v26;
      goto LABEL_19;
    case 2:
      int v20 = [GEOComposedWalkingRouteSegment alloc];
      char v15 = [(GEORouteBuilderBase *)self route];
      unint64_t v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v20, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 3:
      long long v21 = [GEOComposedBicycleRouteSegment alloc];
      char v15 = [(GEORouteBuilderBase *)self route];
      unint64_t v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v21, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
      goto LABEL_16;
    case 4:
      unsigned int v17 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v24 = 0;
      long long v18 = "Cannot create segment for an unknown transport type.";
      uint64_t v19 = (uint8_t *)&v24;
      goto LABEL_19;
    case 5:
      double v22 = [GEOComposedFerryRouteSegment alloc];
      char v15 = [(GEORouteBuilderBase *)self route];
      unint64_t v16 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](v22, "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v15, location, length, v10, v13, a5);
LABEL_16:
      a5 = v16;

      return (id)a5;
    case 6:
      unsigned int v17 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      long long v18 = "Route builder not supported for RideShare transport type.";
      uint64_t v19 = buf;
LABEL_19:
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
LABEL_20:

      return 0;
    default:
      return (id)a5;
  }
}

- (id)_newStepWithRange:(GEOPolylineCoordinateRange)a3 maneuverStart:(PolylineCoordinate)a4 index:(unint64_t)a5
{
  end = (void *)a3.end;
  PolylineCoordinate start = a3.start;
  switch([(GEORouteBuilderBase *)self _transportType])
  {
    case 0:
      uint64_t v10 = [GEOComposedDrivingRouteStep alloc];
      unint64_t v11 = [(GEORouteBuilderBase *)self route];
      uint64_t v12 = [(GEOComposedDrivingRouteStep *)v10 initWithComposedRoute:v11 geoRouteLeg:0 geoStep:0 stepIndex:a5 startRouteCoordinate:start endRouteCoordinate:end maneuverStartRouteCoordinate:a4];
      goto LABEL_10;
    case 1:
      uint64_t v13 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      __int16 v22 = 0;
      BOOL v14 = "_newStepWithRange: does not support transit segments yet.";
      char v15 = (uint8_t *)&v22;
      goto LABEL_13;
    case 2:
      unint64_t v16 = [GEOComposedWalkingRouteStep alloc];
      unint64_t v11 = [(GEORouteBuilderBase *)self route];
      uint64_t v12 = [(GEOComposedWalkingRouteStep *)v16 initWithComposedRoute:v11 geoRouteLeg:0 geoStep:0 stepIndex:a5 startRouteCoordinate:start endRouteCoordinate:end maneuverStartRouteCoordinate:a4];
      goto LABEL_10;
    case 3:
      unsigned int v17 = [GEOComposedBicycleRouteStep alloc];
      unint64_t v11 = [(GEORouteBuilderBase *)self route];
      uint64_t v12 = [(GEOComposedBicycleRouteStep *)v17 initWithComposedRoute:v11 geoRouteLeg:0 geoStep:0 stepIndex:a5 startRouteCoordinate:start endRouteCoordinate:end maneuverStartRouteCoordinate:a4];
      goto LABEL_10;
    case 4:
      uint64_t v13 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      __int16 v20 = 0;
      BOOL v14 = "Cannot create step for an unknown transport type.";
      char v15 = (uint8_t *)&v20;
      goto LABEL_13;
    case 5:
      long long v18 = [GEOComposedFerryRouteStep alloc];
      unint64_t v11 = [(GEORouteBuilderBase *)self route];
      uint64_t v12 = [(GEOComposedFerryRouteStep *)v18 initWithComposedRoute:v11 geoRouteLeg:0 geoStep:0 stepIndex:a5 startRouteCoordinate:start endRouteCoordinate:end maneuverStartRouteCoordinate:a4];
LABEL_10:
      end = (void *)v12;

      return end;
    case 6:
      uint64_t v13 = GEOGetGEORouteBuilderLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      BOOL v14 = "Route builder not supported for RideShare transport type.";
      char v15 = buf;
LABEL_13:
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
LABEL_14:

      return 0;
    default:
      return end;
  }
}

@end