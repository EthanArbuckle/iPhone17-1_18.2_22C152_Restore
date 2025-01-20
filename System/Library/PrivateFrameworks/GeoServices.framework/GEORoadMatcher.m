@interface GEORoadMatcher
- (BOOL)useRawLocations;
- (GEOApplicationAuditToken)auditToken;
- (GEORoadMatcher)init;
- (GEORoadMatcher)initWithAuditToken:(id)a3;
- (GEORoadMatcherCandidateSegment)previousMatch;
- (double)searchRadius;
- (id)_bestCandidateSegmentForLocation:(id)a3 transportType:(int)a4;
- (id)matchLocation:(id)a3 forTransportType:(int)a4;
- (void)dealloc;
- (void)setPreviousMatch:(id)a3;
- (void)setSearchRadius:(double)a3;
- (void)setUseRawLocations:(BOOL)a3;
@end

@implementation GEORoadMatcher

- (GEORoadMatcher)init
{
  result = (GEORoadMatcher *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoadMatcher)initWithAuditToken:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEORoadMatcher;
  v5 = [(GEORoadMatcher *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_searchRadius = 65.0;
    v7 = [GEOMapFeatureAccess alloc];
    global_queue = (void *)geo_get_global_queue();
    uint64_t v9 = [(GEOMapFeatureAccess *)v7 initWithQueue:global_queue];
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = (GEOMapFeatureAccess *)v9;

    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAuditToken:v4];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setAllowNetworkTileLoad:1];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setFlipNegativeTravelDirectionRoads:1];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:0];
    [(GEOMapFeatureAccess *)v6->_mapFeatureAccess setCachedTilesCallbackImmediately:1];
    previousMatch = v6->_previousMatch;
    v6->_previousMatch = 0;

    v12 = v6;
  }

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEORoadMatcher;
  [(GEORoadMatcher *)&v2 dealloc];
}

- (GEOApplicationAuditToken)auditToken
{
  return [(GEOMapFeatureAccess *)self->_mapFeatureAccess auditToken];
}

- (id)matchLocation:(id)a3 forTransportType:(int)a4
{
  v5 = [(GEORoadMatcher *)self _bestCandidateSegmentForLocation:a3 transportType:*(void *)&a4];
  if (v5)
  {
    v6 = objc_alloc_init(GEORoadMatch);
    v7 = [v5 road];
    v8 = [v7 feature];
    [(GEORoadMatch *)v6 setRoadFeature:v8];

    [v5 coordinateOnSegment];
    -[GEORoadMatch setCoordinateOnRoad:](v6, "setCoordinateOnRoad:");
    [v5 segmentAngle];
    -[GEORoadMatch setCourseOnRoad:](v6, "setCourseOnRoad:");
    [v5 distanceFromSegment];
    -[GEORoadMatch setDistanceFromRoad:](v6, "setDistanceFromRoad:");
    uint64_t v9 = [v5 road];
    [v9 roadWidth];
    -[GEORoadMatch setRoadWidth:](v6, "setRoadWidth:");

    [v5 distanceFromJunction];
    -[GEORoadMatch setDistanceFromJunction:](v6, "setDistanceFromJunction:");
    v10 = [v5 road];
    v11 = [v10 feature];

    if (v11)
    {
      v12 = [v11 feature];
      if ([v12 name])
      {
        v13 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v12, "name"));
        [(GEORoadMatch *)v6 setRoadName:v13];
      }
      objc_super v14 = [v5 junction];

      if (v14)
      {
        v15 = [v12 containingTile];
        v16 = [v5 junction];
        uint64_t v17 = [v16 connectivityJunction];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __49__GEORoadMatcher_matchLocation_forTransportType___block_invoke;
        v19[3] = &unk_1E53EA8F8;
        v20 = v6;
        [v15 forEachEdgeOnJunction:v17 visitor:v19];
      }
    }
    [(GEORoadMatcher *)self setPreviousMatch:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __49__GEORoadMatcher_matchLocation_forTransportType___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v11 = v4;
    v5 = [v4 road];

    id v4 = v11;
    if (v5)
    {
      [*(id *)(a1 + 32) junctionRadius];
      double v7 = v6;
      v8 = [v11 road];
      double v9 = (double)[v8 roadWidth] * 0.01 * 0.5;
      if (v7 > v9)
      {
        [*(id *)(a1 + 32) junctionRadius];
      }
      else
      {
        objc_super v2 = [v11 road];
        double v10 = (double)[v2 roadWidth] * 0.01 * 0.5;
      }
      [*(id *)(a1 + 32) setJunctionRadius:v10];
      if (v7 <= v9) {

      }
      id v4 = v11;
    }
  }
}

- (void)setPreviousMatch:(id)a3
{
  id v5 = a3;
  previousMatch = self->_previousMatch;
  p_previousMatch = &self->_previousMatch;
  id v8 = v5;
  if ((-[GEORoadMatcherCandidateSegment isEqual:](previousMatch, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_previousMatch, a3);
  }
}

- (id)_bestCandidateSegmentForLocation:(id)a3 transportType:(int)a4
{
  id v6 = a3;
  double v7 = v6;
  if (self->_useRawLocations && [v6 hasRawCoordinate])
  {
    id v8 = [v7 rawCoordinate];
    [v8 coordinate];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [v7 coordinate];
    double v10 = v13;
    double v12 = v14;
  }
  int v15 = [v7 altitude];
  if (self->_useRawLocations && [v7 hasRawCourse]) {
    [v7 rawCourse];
  }
  else {
    [v7 course];
  }
  double v17 = v16;
  double v18 = (double)v15;
  BOOL v19 = v16 >= 0.0 && (a4 == 3 || a4 == 0);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__77;
  v51 = __Block_byref_object_dispose__77;
  id v52 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke;
  v37[3] = &unk_1E53EA920;
  int v45 = a4;
  id v21 = v7;
  id v38 = v21;
  v39 = self;
  double v41 = v10;
  double v42 = v12;
  BOOL v46 = v19;
  double v43 = v18;
  double v44 = v17;
  v40 = &v47;
  v22 = (void *)MEMORY[0x18C120660](v37);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  [(GEORoadMatcher *)self searchRadius];
  double v23 = 1.0;
  if (v24 >= 1.0)
  {
    [(GEORoadMatcher *)self searchRadius];
    double v23 = v25;
  }
  mapFeatureAccess = self->_mapFeatureAccess;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_2;
  v32[3] = &unk_1E53EA948;
  v34 = v36;
  id v27 = v22;
  id v33 = v27;
  int v35 = a4;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_3;
  v31[3] = &unk_1E53EA970;
  v31[4] = v36;
  *(double *)&v31[5] = v23;
  *(double *)&v31[6] = v10;
  *(double *)&v31[7] = v12;
  *(double *)&v31[8] = v18;
  id v28 = -[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v32, v31, v10, v12, v23);
  id v29 = (id)v48[5];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v47, 8);

  return v29;
}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  int v5 = *(_DWORD *)(a1 + 88);
  if (v5 == 3)
  {
    int v8 = [v3 bikeableSide];
    goto LABEL_10;
  }
  if (v5 == 2)
  {
    int v8 = [v3 walkableSide];
LABEL_10:
    if (!v8) {
      goto LABEL_22;
    }
    goto LABEL_11;
  }
  if (v5
    || [v3 isDrivable]
    && [v4 travelDirection] != 6
    && ([v4 feature],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 type],
        v6,
        v7 == 1))
  {
LABEL_11:
    double v9 = [[GEORoadCoursePenalty alloc] initWithLocation:*(void *)(a1 + 32)];
    [(GEORoadCoursePenalty *)v9 setUseRawLocations:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16)];
    double v10 = (double *)[v4 coordinates3d];
    uint64_t v11 = 0;
    double v12 = *v10;
    double v13 = v10[1];
    unint64_t v14 = 1;
    double v15 = v10[2];
    while (1)
    {
      if (v14 >= [v4 coordinateCount])
      {

        break;
      }
      uint64_t v16 = [v4 coordinates3d];
      double v17 = *(double *)(v16 + v11 + 24);
      double v30 = *(double *)(v16 + v11 + 40);
      double v31 = *(double *)(v16 + v11 + 32);
      double v18 = [GEORoadMatcherCandidateSegment alloc];
      if (*(unsigned char *)(a1 + 92)) {
        double v19 = *(double *)(a1 + 80);
      }
      else {
        double v19 = -1.0;
      }
      double v20 = *(double *)(a1 + 56);
      double v21 = *(double *)(a1 + 64);
      double v22 = *(double *)(a1 + 72);
      v32[0] = v9;
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      double v24 = -[GEORoadMatcherCandidateSegment initWithCoordinate:angle:road:startCoordinate:endCoordinate:penalties:](v18, "initWithCoordinate:angle:road:startCoordinate:endCoordinate:penalties:", v4, v23, v20, v21, v22, v19, v12, v13, v15, *(void *)&v17, *(void *)&v31, *(void *)&v30);

      uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      if (v26)
      {
        [v26 score];
        double v28 = v27;
        [(GEORoadMatcherCandidateSegment *)v24 score];
        if (v28 <= v29) {
          goto LABEL_20;
        }
        uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      objc_storeStrong((id *)(v25 + 40), v24);
LABEL_20:

      ++v14;
      v11 += 24;
      double v12 = v17;
      double v15 = v30;
      double v13 = v31;
    }
  }
LABEL_22:
}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((unint64_t)[v4 coordinateCount] >= 2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    int v3 = *(_DWORD *)(a1 + 48);
    if ((v3 - 2) < 2 || !v3 && ![v4 travelDirection])
    {
      [v4 flip];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = GEOGetGEORoadMatcherLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      *(void *)int v8 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "GEOMapFeatureAccess encountered an error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v5 = GEOGetGEORoadMatcherLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = (int)*(double *)(a1 + 40);
      int v7 = 67109635;
      *(_DWORD *)int v8 = v6;
      *(_WORD *)&v8[4] = 1040;
      *(_DWORD *)&v8[6] = 24;
      __int16 v9 = 2097;
      uint64_t v10 = a1 + 48;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "GEOMapFeatureAccess found no roads within %dm of (%{private,geo:coordinate}.*P). This is not necessarily an error, but most likely is", (uint8_t *)&v7, 0x18u);
    }
  }
}

- (BOOL)useRawLocations
{
  return self->_useRawLocations;
}

- (void)setUseRawLocations:(BOOL)a3
{
  self->_useRawLocations = a3;
}

- (double)searchRadius
{
  return self->_searchRadius;
}

- (void)setSearchRadius:(double)a3
{
  self->_searchRadius = a3;
}

- (GEORoadMatcherCandidateSegment)previousMatch
{
  return self->_previousMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMatch, 0);

  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end