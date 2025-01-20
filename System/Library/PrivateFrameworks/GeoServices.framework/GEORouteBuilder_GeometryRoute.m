@interface GEORouteBuilder_GeometryRoute
- (BOOL)_buildComponents;
- (BOOL)_buildCoordinates;
- (BOOL)_setMiscInfo;
- (BOOL)isOriginCurrentLocation;
- (GEORawRouteGeometry)rawRouteGeometry;
- (NSArray)destinations;
- (id)_newRouteInstance;
- (int)_transportType;
- (int)transportType;
- (unint64_t)source;
- (void)setDestinations:(id)a3;
- (void)setIsOriginCurrentLocation:(BOOL)a3;
- (void)setRawRouteGeometry:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTrafficColors:(unsigned int *)a3 offsets:(unsigned int *)a4 count:(unint64_t)a5;
- (void)setTransportType:(int)a3;
@end

@implementation GEORouteBuilder_GeometryRoute

- (void)setTrafficColors:(unsigned int *)a3 offsets:(unsigned int *)a4 count:(unint64_t)a5
{
  if (a5)
  {
    unint64_t v5 = a5;
    v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
    do
    {
      v10 = objc_opt_new();
      unsigned int v11 = *a3++;
      [v10 setColor:v11];
      unsigned int v12 = *a4++;
      [v10 setOffsetMeters:(double)v12];
      [(NSArray *)v9 addObject:v10];

      --v5;
    }
    while (v5);
    trafficColorInfos = self->_trafficColorInfos;
    self->_trafficColorInfos = v9;
  }
}

- (int)_transportType
{
  return self->_transportType;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_rawRouteGeometry)
  {
    v3 = [[GEOComposedRouteCoordinateArray alloc] initWithRawRouteGeometry:self->_rawRouteGeometry];
    unint64_t v4 = [(GEOComposedRouteCoordinateArray *)v3 coordinateCount];
    BOOL v5 = v4 > 1;
    if (v4 > 1)
    {
      if ([(NSArray *)self->_destinations count])
      {
        uint64_t v6 = [(GEOComposedRouteCoordinateArray *)v3 pathsCount];
        if (v6 != [(NSArray *)self->_destinations count])
        {
          v7 = GEOGetGEORouteBuilder_GeometryRouteLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            int v8 = [(GEOComposedRouteCoordinateArray *)v3 pathsCount];
            int v9 = [(NSArray *)self->_destinations count];
            int v13 = 67109376;
            int v14 = v8;
            __int16 v15 = 1024;
            int v16 = v9;
          }
        }
      }
      v10 = [(GEORouteBuilderBase *)self route];
      [v10 setCoordinates:v3];
    }
    else
    {
      v10 = GEOGetGEORouteBuilder_GeometryRouteLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 67109120;
        int v14 = [(GEOComposedRouteCoordinateArray *)v3 coordinateCount];
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)&v13, 8u);
      }
    }
  }
  else
  {
    GEOGetGEORouteBuilder_GeometryRouteLog();
    v3 = (GEOComposedRouteCoordinateArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_188D96000, &v3->super, OS_LOG_TYPE_ERROR, "Cannot build coordinates because raw route geometry is empty.", (uint8_t *)&v13, 2u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_buildComponents
{
  v3 = [(GEORouteBuilderBase *)self route];
  unint64_t v4 = [v3 coordinates];
  unint64_t v5 = [v4 coordinateCount];
  unint64_t v6 = v5;
  if (v5 <= 1)
  {
    v28 = GEOGetGEORouteBuilder_GeometryRouteLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Require at least 2 points to build a route.", buf, 2u);
    }
  }
  else
  {
    unint64_t v31 = v5;
    v36 = v3;
    uint64_t v7 = [v4 pathsCount];
    v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    int v8 = [(GEORouteBuilderBase *)self route];
    int v9 = [v8 coordinates];
    [v9 coordinateOnRouteAt:0];
    double v11 = v10;
    double v13 = v12;

    v30 = -[GEOLocation initWithGEOCoordinate:isUserLocation:]([GEOLocation alloc], "initWithGEOCoordinate:isUserLocation:", self->_isOriginCurrentLocation, v11, v13);
    int v14 = [[GEOComposedWaypoint alloc] initWithLocation:v30 isCurrentLocation:self->_isOriginCurrentLocation];
    NSUInteger v32 = [(NSArray *)self->_destinations count];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v17 = [v4 routeCoordinateRangeForPathIndex:i];
        uint64_t v18 = v16;
        if (v32 == v7)
        {
          v19 = [(NSArray *)self->_destinations objectAtIndexedSubscript:i];
        }
        else
        {
          [v4 coordinateForRouteCoordinate:v16];
          v22 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v20, v21);
          v19 = [[GEOComposedWaypoint alloc] initWithLocation:v22 isCurrentLocation:0];
        }
        v23 = [[GEOComposedRouteLeg alloc] initWithComposedRoute:v36 geoRouteLeg:0 legIndex:i origin:v14 destination:v19 arrivalParameters:0];
        -[GEOComposedRouteLeg setPointRange:](v23, "setPointRange:", v17, (v18 - v17 + 1));
        -[GEOComposedRouteLeg setStepRange:](v23, "setStepRange:", i, 1);
        -[GEOComposedRouteLeg setSegmentRange:](v23, "setSegmentRange:", i, 1);
        [v4 distanceBetweenRouteCoordinate:v17 andRouteCoordinate:v18];
        -[GEOComposedRouteLeg setDistance:](v23, "setDistance:");
        [v35 addObject:v23];
        uint64_t v24 = [(GEOComposedRouteLeg *)v23 stepRange];
        id v26 = -[GEORouteBuilderBase _newSegmentWithRange:stepRange:index:](self, "_newSegmentWithRange:stepRange:index:", v17, v18, v24, v25, i);
        [v34 addObject:v26];
        id v27 = -[GEORouteBuilderBase _newStepWithRange:maneuverStart:index:](self, "_newStepWithRange:maneuverStart:index:", v17, v18, v18, i);
        [v33 addObject:v27];

        int v14 = v19;
      }
    }
    else
    {
      v19 = v14;
    }
    v3 = v36;
    [v36 setLegs:v35];
    [v36 setSegments:v34];
    [v36 setSteps:v33];

    unint64_t v6 = v31;
  }

  return v6 > 1;
}

- (BOOL)_setMiscInfo
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(GEORouteBuilderBase *)self route];
  [v3 setSource:self->_source];
  unint64_t v4 = [v3 coordinates];
  objc_msgSend(v4, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v3, "startRouteCoordinate"), objc_msgSend(v3, "endRouteCoordinate"));
  objc_msgSend(v3, "setDistance:");

  unint64_t v5 = objc_opt_new();
  [v5 initializeForRoute:v3];
  if ([(NSArray *)self->_trafficColorInfos count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v6 = self->_trafficColorInfos;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v12 = [v3 coordinates];
          [v11 offsetMeters];
          uint64_t v13 = objc_msgSend(v12, "routeCoordinateForDistanceAfterStart:");

          [v11 setRouteCoordinate:v13];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    int v14 = [[GEOComposedRouteTraffic alloc] initWithColorInfos:self->_trafficColorInfos incidentInfos:0];
  }
  else
  {
    int v14 = 0;
  }
  [v5 setTraffic:v14];
  [v3 setMutableData:v5];

  return 1;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (GEORawRouteGeometry)rawRouteGeometry
{
  return self->_rawRouteGeometry;
}

- (void)setRawRouteGeometry:(id)a3
{
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (BOOL)isOriginCurrentLocation
{
  return self->_isOriginCurrentLocation;
}

- (void)setIsOriginCurrentLocation:(BOOL)a3
{
  self->_isOriginCurrentLocation = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_rawRouteGeometry, 0);

  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
}

@end