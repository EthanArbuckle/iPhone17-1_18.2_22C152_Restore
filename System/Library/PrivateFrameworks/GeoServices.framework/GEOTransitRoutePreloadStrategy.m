@interface GEOTransitRoutePreloadStrategy
- (GEOComposedRoute)route;
- (GEORoutePreloader)preloader;
- (GEOTransitRoutePreloadStrategy)init;
- (PolylineCoordinate)_polylineCoordinateForDouble:(double)a3;
- (int64_t)tilesRequested;
- (void)_cancelAllBatches;
- (void)_geodCrashed;
- (void)_ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:(id)a3;
- (void)_loadPlacecardsForBatch:(id)a3;
- (void)_loadTilesForBatch:(id)a3;
- (void)_makeBatchForTilesAroundStationsForSteps:(id)a3;
- (void)_makePreloadBatchForPlaceDataOnSteps:(id)a3;
- (void)_makePreloadBatchForSteps:(id)a3;
- (void)_makePreloadBatchForTilesOnRouteWithSteps:(id)a3 andPriority:(unsigned int)a4;
- (void)_performNextRequests;
- (void)_processBatches;
- (void)_processedFinishedBatch:(id)a3 withPartialStatus:(unint64_t)a4;
- (void)_resetErrorCounts;
- (void)_retryFailuresWithErrorsReset:(BOOL)a3;
- (void)_start;
- (void)_stop;
- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5;
- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)performTearDown;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setPreloader:(id)a3;
- (void)setRoute:(id)a3;
- (void)setShouldPreloadEntireRoute:(BOOL)a3;
- (void)setTraits:(id)a3;
- (void)start;
- (void)stop;
- (void)updateWithRoute:(id)a3 routeMatch:(id)a4;
- (void)updateWithRouteMatch:(id)a3;
@end

@implementation GEOTransitRoutePreloadStrategy

- (GEOTransitRoutePreloadStrategy)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)GEOTransitRoutePreloadStrategy;
  v2 = [(GEOTransitRoutePreloadStrategy *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v2->_tilesRequested = 0;
    v2->_double radialDistanceToImplicateTilesMeters = GEOConfigGetDouble(GeoServicesConfig_RadialDistanceToImplicateTransitTilesForACoordinate, (uint64_t)off_1E9113B38);
    v2->_stepSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_StepSizeInMeters, (uint64_t)off_1E9113B18);
    v5 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double radialDistanceToImplicateTilesMeters = v2->_radialDistanceToImplicateTilesMeters;
      *(_DWORD *)buf = 134217984;
      double v11 = radialDistanceToImplicateTilesMeters;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Chosen radial distance to implicate tiles in meters: %f", buf, 0xCu);
    }

    v7 = +[GEOResourceManifestManager modernManager];
    [v7 addTileGroupObserver:v2 queue:v2->_workQueue];
  }
  return v2;
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if (!self->_tileSetStyles)
  {
    objc_super v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tileSetStyles = self->_tileSetStyles;
    self->_tileSetStyles = v9;
  }
  double v11 = +[GEOResourceManifestManager modernManager];
  uint64_t v12 = [v11 activeTileGroup];
  id v24 = [v12 activeTileSetForTileType:v7 scale:0];

  if (v5 && (int)v5 >= (int)a4)
  {
    do
    {
      uint64_t v13 = objc_msgSend(v24, "largestZoomLevelLEQ:inRect:", v5, 0.0, 0.0, 268435456.0, 268435456.0);
      uint64_t v5 = (v13 - 1);
      if ((int)v13 >= 1)
      {
        v14 = self->_tileSetStyles;
        v15 = [NSNumber numberWithInt:v13];
        v16 = [(NSMutableDictionary *)v14 objectForKey:v15];

        if (!v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v18 = self->_tileSetStyles;
          v19 = [NSNumber numberWithInt:v13];
          [(NSMutableDictionary *)v18 setObject:v17 forKey:v19];
        }
        v20 = self->_tileSetStyles;
        v21 = [NSNumber numberWithInt:v13];
        v22 = [(NSMutableDictionary *)v20 objectForKey:v21];
        v23 = [NSNumber numberWithInt:v7];
        [v22 addObject:v23];
      }
    }
    while ((int)v13 > (int)a4);
  }
}

- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__GEOTransitRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __73__GEOTransitRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryFailuresWithErrorsReset:1];
}

- (void)_retryFailuresWithErrorsReset:(BOOL)a3
{
  if (self->_enabled)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
    unint64_t v6 = [WeakRetained networkQuality];

    if (v6 >= 4)
    {
      if (v3) {
        [(GEOTransitRoutePreloadStrategy *)self _resetErrorCounts];
      }
      [(GEOTransitRoutePreloadStrategy *)self _performNextRequests];
    }
  }
}

- (void)_resetErrorCounts
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        *(void *)(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 40) = 0;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)performTearDown
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GEOTransitRoutePreloadStrategy_performTearDown__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __49__GEOTransitRoutePreloadStrategy_performTearDown__block_invoke(uint64_t a1)
{
  v2 = +[GEOResourceManifestManager modernManager];
  [v2 removeTileGroupObserver:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _stop];
}

- (void)setTraits:(id)a3
{
  uint64_t v5 = (GEOMapServiceTraits *)a3;
  traits = self->_traits;
  p_traits = &self->_traits;
  if (traits != v5)
  {
    long long v8 = v5;
    objc_storeStrong((id *)p_traits, a3);
    uint64_t v5 = v8;
  }
}

- (int64_t)tilesRequested
{
  return self->_tilesRequested;
}

- (void)setShouldPreloadEntireRoute:(BOOL)a3
{
  self->_shouldPreloadEntireRoute = a3;
}

- (void)updateWithRoute:(id)a3 routeMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GEOTransitRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke;
  block[3] = &unk_1E53DDDB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

unsigned char *__61__GEOTransitRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 11, a1[5]);
  id v2 = a1[6];
  if (v2)
  {
    double v3 = (double)[v2 routeCoordinate];
    double v4 = v3 + COERCE_FLOAT((unint64_t)[a1[6] routeCoordinate] >> 32);
  }
  else
  {
    double v4 = 0.0;
  }
  *((double *)a1[4] + 13) = v4;
  result = a1[4];
  if (result[128])
  {
    [result _stop];
    result = (unsigned char *)[a1[4] _start];
  }
  if (a1[6])
  {
    id v6 = a1[4];
    return (unsigned char *)[v6 _performNextRequests];
  }
  return result;
}

- (void)updateWithRouteMatch:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__GEOTransitRoutePreloadStrategy_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E53D81E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __55__GEOTransitRoutePreloadStrategy_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  double v2 = (double)[*(id *)(a1 + 40) routeCoordinate];
  *(double *)(*(void *)(a1 + 32) + 104) = v2
                                            + COERCE_FLOAT((unint64_t)[*(id *)(a1 + 40) routeCoordinate] >> 32);
  double v3 = *(void **)(a1 + 32);

  return [v3 _performNextRequests];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GEOTransitRoutePreloadStrategy_start__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __39__GEOTransitRoutePreloadStrategy_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  if (self->_enabled) {
    [(GEOTransitRoutePreloadStrategy *)self _stop];
  }
  double v3 = +[GEOTileLoader modernLoader];
  id v4 = GEOTileLoaderClientIdentifier(self);
  [v3 openForClient:v4];

  uint64_t v5 = +[GEOResourceManifestManager modernManager];
  [v5 openServerConnection];

  if (!self->_tileSetStyles)
  {
    [(GEOTransitRoutePreloadStrategy *)self addTileSetStyle:1 betweenZoom:13 andZoom:15];
    [(GEOTransitRoutePreloadStrategy *)self addTileSetStyle:11 betweenZoom:13 andZoom:15];
    [(GEOTransitRoutePreloadStrategy *)self addTileSetStyle:13 betweenZoom:13 andZoom:15];
    [(GEOTransitRoutePreloadStrategy *)self addTileSetStyle:37 betweenZoom:13 andZoom:15];
  }
  self->_enabled = 1;
  id v6 = objc_alloc_init(_GEOTransitRoutePreloaderData);
  reserved = self->_reserved;
  self->_reserved = v6;

  id v8 = +[GEOTileLoader modernLoader];
  id v9 = GEOTileLoaderClientIdentifier(self);
  [v8 beginPreloadSessionOfSize:0 forClient:v9];

  self->_currentRoutePosition = 0.0;
  self->_endRoutePosition = 0.0;

  [(GEOTransitRoutePreloadStrategy *)self _performNextRequests];
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__GEOTransitRoutePreloadStrategy_stop__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__GEOTransitRoutePreloadStrategy_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)_stop
{
  if (self->_enabled)
  {
    self->_enabled = 0;
    [(GEOTransitRoutePreloadStrategy *)self _cancelAllBatches];
    id v4 = +[GEOTileLoader modernLoader];
    double v3 = GEOTileLoaderClientIdentifier(self);
    [v4 closeForClient:v3];

    id v5 = +[GEOResourceManifestManager modernManager];
    [v5 closeServerConnection];
  }
}

- (void)_cancelAllBatches
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[TransitStrategy] Canceling all batches.", buf, 2u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v30;
    *(void *)&long long v5 = 138412290;
    long long v20 = v5;
    do
    {
      uint64_t v23 = v4;
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*(void *)(*((void *)&v29 + 1) + 8 * i) + 24);
        if (v7 != 2 && v7 != 5)
        {
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v9 = GEOGetRoutePreloaderLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            id v10 = [(id)v24 description];
            *(_DWORD *)buf = v20;
            v35 = v10;
            _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Cancelling batch: %@", buf, 0xCu);
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v11 = [(id)v24 tilesToLoad];
          id v12 = (void *)[v11 copy];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * j);
                id v17 = +[GEOTileLoader modernLoader];
                v18 = GEOTileLoaderClientIdentifier(self);
                [v17 cancelKey:v16 forClient:v18];
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v13);
          }

          [*(id *)(v24 + 120) cancel];
          v19 = *(void **)(v24 + 120);
          *(void *)(v24 + 120) = 0;

          *(void *)(v24 + 24) = 5;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v4);
  }
}

- (PolylineCoordinate)_polylineCoordinateForDouble:(double)a3
{
  unsigned int v3 = a3;
  float v4 = a3 - (double)a3;
  if (v4 >= 1.0)
  {
    v3 += vcvtms_u32_f32(v4);
    float v4 = v4 - (float)floorf(v4);
  }
  return (PolylineCoordinate)(v3 | ((unint64_t)LODWORD(v4) << 32));
}

- (void)_performNextRequests
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_enabled)
  {
    route = self->_route;
    if (route)
    {
      if ([(GEOComposedRoute *)route pointCount] >= 2)
      {
        unsigned int v4 = vcvtad_u64_f64(self->_currentRoutePosition);
        if ([(GEOComposedRoute *)self->_route pointCount] <= v4) {
          unsigned int v5 = [(GEOComposedRoute *)self->_route pointCount];
        }
        else {
          unsigned int v5 = vcvtad_u64_f64(self->_currentRoutePosition);
        }
        unsigned int v6 = vcvtad_u64_f64(self->_endRoutePosition);
        if ([(GEOComposedRoute *)self->_route pointCount] <= v6) {
          unsigned int v7 = [(GEOComposedRoute *)self->_route pointCount];
        }
        else {
          unsigned int v7 = vcvtad_u64_f64(self->_endRoutePosition);
        }
        [(GEOComposedRoute *)self->_route distanceFromPointIndex:0 toPointIndex:v5];
        double v9 = v8 / 1000.0;
        [(GEOComposedRoute *)self->_route distanceFromPointIndex:0 toPointIndex:v7];
        double v11 = v10 / 1000.0;
        double Double = GEOConfigGetDouble(GeoServicesConfig_TransitMaxDistanceAheadToPreload, (uint64_t)off_1E9113B08);
        if (self->_shouldPreloadEntireRoute)
        {
          [(GEOComposedRoute *)self->_route distance];
          double Double = v13 / 1000.0;
        }
        if (v11 - v9 <= Double)
        {
          int downloadState = self->_downloadState;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
          uint64_t v16 = [WeakRetained networkQuality];
          uint64_t v17 = 0;
          double stepSizeInMeters = self->_stepSizeInMeters;
          while (_downloadTruthTable[v17] != v16)
          {
            v17 += 5;
            if (v17 == 35)
            {
              double v19 = 0.0;
              goto LABEL_24;
            }
          }
          long long v20 = &_downloadTruthTable[v17];
          v21 = v20 + 3;
          if (v9 <= 10.0) {
            v21 = v20 + 1;
          }
          uint64_t v22 = (double *)(v20 + 4);
          uint64_t v23 = (double *)(v20 + 2);
          if (v9 > 10.0) {
            uint64_t v23 = v22;
          }
          if (downloadState) {
            uint64_t v23 = (double *)v21;
          }
          double v19 = *v23 * 1000.0;
LABEL_24:

          if (self->_shouldPreloadEntireRoute)
          {
            [(GEOComposedRoute *)self->_route distance];
            double v25 = v24;
          }
          else
          {
            double v25 = stepSizeInMeters * (double)(uint64_t)(v19 / stepSizeInMeters);
          }
          if (v25 > 2.22044605e-16)
          {
            PolylineCoordinate v26 = [(GEOComposedRoute *)self->_route coordinateAtOffset:[(GEOTransitRoutePreloadStrategy *)self _polylineCoordinateForDouble:self->_currentRoutePosition] fromRouteCoordinate:v25];
            self->_endRoutePosition = (float)((float)v26.index + v26.offset);
            unint64_t v27 = [(GEOComposedRoute *)self->_route stepIndexForPointIndex:(unint64_t)self->_currentRoutePosition];
            unint64_t indexOfLastStepWithPreparedBatch = self->_indexOfLastStepWithPreparedBatch;
            if (v27 > indexOfLastStepWithPreparedBatch) {
              unint64_t indexOfLastStepWithPreparedBatch = [(GEOComposedRoute *)self->_route stepIndexForPointIndex:(unint64_t)self->_currentRoutePosition];
            }
            unint64_t v29 = [(GEOComposedRoute *)self->_route stepIndexForPointIndex:(unint64_t)self->_endRoutePosition];
            if (indexOfLastStepWithPreparedBatch != v29
              || indexOfLastStepWithPreparedBatch != self->_indexOfLastStepWithPreparedBatch)
            {
              id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              long long v31 = [(GEOComposedRoute *)self->_route steps];
              uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
              if (v32)
              {
                uint64_t v33 = *(void *)v39;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v39 != v33) {
                      objc_enumerationMutation(v31);
                    }
                    v35 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                    if ([v35 stepIndex] >= indexOfLastStepWithPreparedBatch)
                    {
                      if ([v35 stepIndex] > v29) {
                        goto LABEL_46;
                      }
                      unint64_t v36 = self->_indexOfLastStepWithPreparedBatch;
                      if (v36 <= [v35 stepIndex]) {
                        uint64_t v37 = [v35 stepIndex];
                      }
                      else {
                        uint64_t v37 = self->_indexOfLastStepWithPreparedBatch;
                      }
                      self->_unint64_t indexOfLastStepWithPreparedBatch = v37;
                      if ([v35 pointCount] >= 2) {
                        [v30 addObject:v35];
                      }
                    }
                  }
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
                }
                while (v32);
              }
LABEL_46:

              [(GEOTransitRoutePreloadStrategy *)self _makeBatchesForSteps:v30];
              [(GEOTransitRoutePreloadStrategy *)self _makeBatchForTilesAroundStationsForSteps:v30];
            }
            [(GEOTransitRoutePreloadStrategy *)self _processBatches];
          }
        }
      }
    }
  }
}

- (void)_ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__GEOTransitRoutePreloadStrategy__ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList___block_invoke;
  v15[3] = &unk_1E53DE310;
  v15[4] = self;
  [v4 removeKeysMatchingPredicate:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        double v10 = [(_GEOTransitRoutePreloaderData *)self->_reserved tilesLoadingOrLoaded];
        [v10 addKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __113__GEOTransitRoutePreloadStrategy__ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 16) tilesLoadingOrLoaded];
  uint64_t v4 = [v3 containsKey:a2];

  return v4;
}

- (void)_makeBatchForTilesAroundStationsForSteps:(id)a3
{
  id v16 = a3;
  uint64_t v4 = objc_alloc_init(_GEOTransitPreloadBatch);
  id v5 = objc_alloc_init(GEOTileKeyList);
  uint64_t v6 = objc_alloc_init(_GEOTransitPreloadCamera);
  for (unint64_t i = 0; i < [v16 count]; ++i)
  {
    uint64_t v8 = [v16 objectAtIndex:i];
    uint64_t v9 = [v8 startingStop];
    double v10 = [v8 endingStop];
    if (v9)
    {
      long long v11 = [v9 latLng];
      [v11 coordinate];
      -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v6, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v5, self->_tileSetStyles);
    }
    if (v10)
    {
      long long v12 = [v10 latLng];
      [v12 coordinate];
      -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v6, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v5, self->_tileSetStyles);
    }
  }
  [(GEOTransitRoutePreloadStrategy *)self _ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:v5];
  if (_MergedGlobals_21 != -1) {
    dispatch_once(&_MergedGlobals_21, &__block_literal_global_259);
  }
  v4->priority = _MergedGlobals_169;
  v4->status = 0;
  v4->generation = [(_GEOTransitRoutePreloaderData *)self->_reserved currentBatchGeneration];
  placeDataRequestTicketForBatch = v4->placeDataRequestTicketForBatch;
  v4->placeDataRequestTicketForBatch = 0;

  if ([(GEOTileKeyList *)v5 count])
  {
    [(_GEOTransitPreloadBatch *)v4 setTilesToLoad:v5];
    long long v14 = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
    [v14 addObject:v4];

    int64_t tilesRequested = self->_tilesRequested;
    self->_int64_t tilesRequested = [(GEOTileKeyList *)v5 count] + tilesRequested;
  }
  else
  {
    [(_GEOTransitPreloadBatch *)v4 setTilesToLoad:0];
  }
}

- (void)_makePreloadBatchForSteps:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(GEOTransitRoutePreloadStrategy *)self _makePreloadBatchForPlaceDataOnSteps:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "shouldPreloadWithHighPriority", (void)v13)) {
          long long v12 = v5;
        }
        else {
          long long v12 = v6;
        }
        [v12 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    if (_MergedGlobals_21 != -1) {
      dispatch_once(&_MergedGlobals_21, &__block_literal_global_259);
    }
    -[GEOTransitRoutePreloadStrategy _makePreloadBatchForTilesOnRouteWithSteps:andPriority:](self, "_makePreloadBatchForTilesOnRouteWithSteps:andPriority:", v5, _MergedGlobals_169, (void)v13);
  }
  if (objc_msgSend(v6, "count", (void)v13))
  {
    if (qword_1E9116A28 != -1) {
      dispatch_once(&qword_1E9116A28, &__block_literal_global_261);
    }
    [(GEOTransitRoutePreloadStrategy *)self _makePreloadBatchForTilesOnRouteWithSteps:v6 andPriority:dword_1EB29DCDC];
  }
}

- (void)_makePreloadBatchForPlaceDataOnSteps:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  unint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_PreloadBatchMuidCountThreshold, (uint64_t)off_1E9113AE8);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v4 = v40;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v5);
  }

  unint64_t v43 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  double v11 = 0.0;
  while (v43 < [v3 count])
  {
    long long v12 = objc_msgSend(v3, "objectAtIndex:");
    v42 = v12;
    if (!v9) {
      uint64_t v9 = objc_alloc_init(_GEOTransitPreloadBatch);
    }
    v46 = [v12 startingStop];
    v45 = [v12 endingStop];
    if (v46)
    {
      uint64_t v13 = -[GEOComposedRoute getHallForStop:](self->_route, "getHallForStop:");
      [(GEOComposedRoute *)self->_route getStationForHall:v13];
      v15 = long long v14 = (void *)v13;
    }
    else
    {
      long long v14 = 0;
      long long v15 = 0;
    }
    if (v45)
    {
      uint64_t v16 = -[GEOComposedRoute getHallForStop:](self->_route, "getHallForStop:");
      [(GEOComposedRoute *)self->_route getStationForHall:v16];
      v18 = uint64_t v17 = (void *)v16;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    if ([v46 hasMuid])
    {
      double v19 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      long long v20 = [v46 identifier];
      [v19 addObject:v20];

      double v11 = fmax(v11, (double)[v42 startTime]);
      ++v10;
    }
    if ([v45 hasMuid])
    {
      v21 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      uint64_t v22 = [v45 identifier];
      [v21 addObject:v22];

      if (v43 + 1 >= [v3 count])
      {
        uint64_t v23 = [(GEOComposedRoute *)self->_route suggestedRoute];
        unsigned int v24 = [v23 absEndTime];
      }
      else
      {
        uint64_t v23 = objc_msgSend(v3, "objectAtIndex:");
        unsigned int v24 = [v23 startTime];
      }
      unsigned int v25 = v24;

      double v11 = fmax(v11, (double)v25);
      ++v10;
    }
    if ([v14 hasMuid])
    {
      PolylineCoordinate v26 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      unint64_t v27 = [v14 identifier];
      [v26 addObject:v27];

      ++v10;
    }
    if ([v17 hasMuid])
    {
      long long v28 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      unint64_t v29 = [v17 identifier];
      [v28 addObject:v29];

      ++v10;
    }
    if ([v15 hasMuid])
    {
      id v30 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      long long v31 = [v15 identifier];
      [v30 addObject:v31];

      ++v10;
    }
    if ([v18 hasMuid])
    {
      uint64_t v32 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      uint64_t v33 = [v18 identifier];
      [v32 addObject:v33];

      ++v10;
    }
    if (v10 >= UInteger
      || ([v3 lastObject],
          v34 = objc_claimAutoreleasedReturnValue(),
          BOOL v35 = v42 == v34,
          v34,
          v35))
    {
      [(_GEOTransitPreloadBatch *)v9 setTilesToLoad:0];
      if (qword_1E9116A28 != -1) {
        dispatch_once(&qword_1E9116A28, &__block_literal_global_261);
      }
      v9->priority = dword_1EB29DCDC;
      v9->status = 0;
      v9->generation = [(_GEOTransitRoutePreloaderData *)self->_reserved currentBatchGeneration];
      placeDataRequestTicketForBatch = v9->placeDataRequestTicketForBatch;
      v9->placeDataRequestTicketForBatch = 0;

      v9->endTimeForScheduleFreshness = v11;
      uint64_t v37 = [(_GEOTransitPreloadBatch *)v9 placeDatasToLoad];
      BOOL v38 = [v37 count] == 0;

      if (!v38)
      {
        long long v39 = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
        [v39 addObject:v9];
      }
      uint64_t v9 = 0;
      unint64_t v10 = 0;
    }

    ++v43;
  }
  if (v9) {
}
  }

- (void)_makePreloadBatchForTilesOnRouteWithSteps:(id)a3 andPriority:(unsigned int)a4
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v98 = a3;
  unsigned int v6 = [(GEOComposedRoute *)self->_route pointCount];
  v105 = objc_alloc_init(GEOTileKeyList);
  id v7 = objc_alloc_init(_GEOTransitPreloadBatch);
  v114 = 0;
  v115 = 0;
  v116 = 0;
  [(GEOComposedRoute *)self->_route pointAt:0];
  double v9 = GEOMapPointsPerMeterAtLatitude(v8);
  v104 = objc_alloc_init(_GEOTransitPreloadCamera);
  unsigned int v99 = a4;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  obuint64_t j = v98;
  uint64_t v10 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
  if (v10)
  {
    double v11 = 500.0 / (1.0 / v9);
    uint64_t v101 = *(void *)v111;
    p_begin = (void **)&v7->coords.__begin_;
    do
    {
      uint64_t v13 = 0;
      uint64_t v102 = v10;
      do
      {
        if (*(void *)v111 != v101) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v110 + 1) + 8 * v13);
        memset(buf, 0, 24);
        unint64_t v15 = [v14 pointRange];
        __p = 0;
        v108 = 0;
        v109 = 0;
        uint64_t v103 = v13;
        if (!v16 || ((unint64_t v17 = v15, v18 = v15 + v16, v15 < v15 + v16) ? (v19 = v15 + v16 - 1 >= v6) : (v19 = 1), v19))
        {
          long long v20 = 0;
          v21 = 0;
        }
        else
        {
          do
          {
            [(GEOComposedRoute *)self->_route pointAt:v17];
            double v24 = GEOTilePointForCoordinate(v22, v23, 20.0);
            double v26 = v24;
            uint64_t v27 = v25;
            long long v28 = v108;
            if (v108 >= (double *)v109)
            {
              unint64_t v29 = __p;
              uint64_t v30 = ((char *)v108 - (char *)__p) >> 4;
              unint64_t v31 = v30 + 1;
              if ((unint64_t)(v30 + 1) >> 60) {
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v32 = v109 - (char *)__p;
              if ((v109 - (char *)__p) >> 3 > v31) {
                unint64_t v31 = v32 >> 3;
              }
              if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v33 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v33 = v31;
              }
              if (v33)
              {
                v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v109, v33);
                unint64_t v29 = __p;
                long long v28 = v108;
              }
              else
              {
                v34 = 0;
              }
              BOOL v35 = &v34[16 * v30];
              *(double *)BOOL v35 = v26;
              *((void *)v35 + 1) = v27;
              unint64_t v36 = v35;
              if (v28 != v29)
              {
                do
                {
                  *((_OWORD *)v36 - 1) = *((_OWORD *)v28 - 1);
                  v36 -= 16;
                  v28 -= 2;
                }
                while (v28 != v29);
                unint64_t v29 = __p;
              }
              v21 = v35 + 16;
              __p = (double *)v36;
              v109 = &v34[16 * v33];
              if (v29) {
                operator delete(v29);
              }
            }
            else
            {
              double *v108 = v24;
              *((void *)v108 + 1) = v25;
              v21 = (char *)(v108 + 2);
            }
            v108 = (double *)v21;
            ++v17;
          }
          while (v17 != v18);
          long long v20 = __p;
        }
        std::vector<GEOLocationCoordinate2D>::reserve((void **)buf, (v21 - (char *)v20) >> 4);
        uint64_t v37 = __p;
        BOOL v38 = *(_OWORD **)&buf[8];
        while (v37 != v108)
        {
          if ((unint64_t)v38 >= *(void *)&buf[16])
          {
            uint64_t v39 = ((uint64_t)v38 - *(void *)buf) >> 4;
            if ((unint64_t)(v39 + 1) >> 60) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v40 = (uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3;
            if (v40 <= v39 + 1) {
              unint64_t v40 = v39 + 1;
            }
            if (*(void *)&buf[16] - *(void *)buf >= 0x7FFFFFFFFFFFFFF0uLL) {
              unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v41 = v40;
            }
            if (v41) {
              v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&buf[16], v41);
            }
            else {
              v42 = 0;
            }
            unint64_t v43 = &v42[16 * v39];
            *(_OWORD *)unint64_t v43 = *(_OWORD *)v37;
            v45 = *(char **)buf;
            v44 = *(char **)&buf[8];
            v46 = v43;
            if (*(void *)&buf[8] != *(void *)buf)
            {
              do
              {
                *((_OWORD *)v46 - 1) = *((_OWORD *)v44 - 1);
                v46 -= 16;
                v44 -= 16;
              }
              while (v44 != v45);
              v44 = *(char **)buf;
            }
            BOOL v38 = v43 + 16;
            *(void *)buf = v46;
            *(void *)&buf[8] = v43 + 16;
            *(void *)&buf[16] = &v42[16 * v41];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            *v38++ = *(_OWORD *)v37;
          }
          *(void *)&buf[8] = v38;
          v37 += 2;
        }
        uint64_t v47 = *(void *)buf;
        unint64_t v48 = ((unint64_t)v38 - *(void *)buf) >> 4;
        int v49 = v48 - 1;
        if ((int)v48 <= 1) {
          int v50 = 1;
        }
        else {
          int v50 = ((unint64_t)v38 - *(void *)buf) >> 4;
        }
        double v51 = (double)(v50 - 1);
        int v52 = 2;
        double v53 = 0.0;
        do
        {
          int v54 = (int)v53;
          if (v49 >= (int)v53 + 1) {
            int v55 = v54 + 1;
          }
          else {
            int v55 = v48 - 1;
          }
          int v56 = vcvtmd_s64_f64(v53 + 1.0);
          if ((int)v48 <= v56)
          {
LABEL_64:
            --v52;
            double v68 = v51;
          }
          else
          {
            double v57 = floor(v53 + 1.0);
            double v58 = v11;
            double v59 = v53;
            while (1)
            {
              double v60 = v59 - floor(v59);
              v61 = (double *)(v47 + 16 * (int)v59);
              int v62 = v49 >= (int)v59 + 1 ? (int)v59 + 1 : v48 - 1;
              v63 = (double *)(v47 + 16 * v62);
              double v64 = *v61 + (*v63 - *v61) * v60;
              double v65 = v61[1] + (v63[1] - v61[1]) * v60;
              double v66 = sqrt((v65 - *(double *)(v47 + 16 * v56 + 8)) * (v65 - *(double *)(v47 + 16 * v56 + 8))+ (v64 - *(double *)(v47 + 16 * v56)) * (v64 - *(double *)(v47 + 16 * v56)));
              if (v66 >= v58) {
                break;
              }
              double v59 = (double)v56;
              double v58 = v58 - v66;
              double v67 = (double)v56 + 1.0;
              double v57 = floor(v67);
              int v56 = vcvtmd_s64_f64(v67);
              if ((int)v48 <= v56) {
                goto LABEL_64;
              }
            }
            double v68 = v59 + v58 / v66 * (v57 - v59);
          }
          float64x2_t v106 = vmlaq_n_f64(*(float64x2_t *)(v47 + 16 * v54), vsubq_f64(*(float64x2_t *)(v47 + 16 * v55), *(float64x2_t *)(v47 + 16 * v54)), v53 - floor(v53));
          double v69 = GEOCoordinate2DForMapPoint(v106.f64[0], v106.f64[1]);
          double v71 = v70;
          -[_GEOTransitPreloadCamera implicateTilesForCoordinate:into:radialDistance:tileSetStyles:](v104, "implicateTilesForCoordinate:into:radialDistance:tileSetStyles:", v105, self->_tileSetStyles);
          v72 = v115;
          if (v115 >= v116)
          {
            v74 = (char *)v114;
            uint64_t v75 = (v115 - (unsigned char *)v114) >> 4;
            unint64_t v76 = v75 + 1;
            if ((unint64_t)(v75 + 1) >> 60) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v77 = v116 - (unsigned char *)v114;
            if ((v116 - (unsigned char *)v114) >> 3 > v76) {
              unint64_t v76 = v77 >> 3;
            }
            if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v78 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v78 = v76;
            }
            if (v78)
            {
              v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v116, v78);
              v74 = (char *)v114;
              v72 = v115;
            }
            else
            {
              v79 = 0;
            }
            v80 = (float64x2_t *)&v79[16 * v75];
            float64x2_t *v80 = v106;
            v73 = (char *)&v80[1];
            if (v72 != v74)
            {
              do
              {
                v80[-1] = *((float64x2_t *)v72 - 1);
                --v80;
                v72 -= 16;
              }
              while (v72 != v74);
              v74 = (char *)v114;
            }
            v114 = v80;
            v115 = v73;
            v116 = &v79[16 * v78];
            if (v74) {
              operator delete(v74);
            }
          }
          else
          {
            *(float64x2_t *)v115 = v106;
            v73 = v72 + 16;
          }
          v115 = v73;
          v81 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v69, v71);
          [(NSMutableArray *)v7->_latLngToLoad addObject:v81];
          end = (char *)v7->coords.__end_;
          value = v7->coords.__end_cap_.__value_;
          if (end >= (char *)value)
          {
            begin = (char *)*p_begin;
            uint64_t v86 = (end - (unsigned char *)*p_begin) >> 4;
            unint64_t v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 60) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v88 = value - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin;
            if (v88 >> 3 > v87) {
              unint64_t v87 = v88 >> 3;
            }
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v89 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v89 = v87;
            }
            if (v89)
            {
              v90 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v7->coords.__end_cap_, v89);
              begin = (char *)v7->coords.__begin_;
              end = (char *)v7->coords.__end_;
            }
            else
            {
              v90 = 0;
            }
            v91 = &v90[16 * v86];
            *(double *)v91 = v69;
            *((double *)v91 + 1) = v71;
            v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v91;
            if (end != begin)
            {
              do
              {
                *((_OWORD *)v92 - 1) = *((_OWORD *)end - 1);
                v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v92 - 16);
                end -= 16;
              }
              while (end != begin);
              begin = (char *)*p_begin;
            }
            v84 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v91 + 16);
            v7->coords.__begin_ = v92;
            v7->coords.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v91 + 16);
            v7->coords.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v90[16 * v89];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            *(double *)end = v69;
            *((double *)end + 1) = v71;
            v84 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 16);
          }
          v7->coords.__end_ = v84;

          double v53 = v68;
        }
        while (v52 > 0);
        if (__p) {
          operator delete(__p);
        }
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        uint64_t v13 = v103 + 1;
      }
      while (v103 + 1 != v102);
      uint64_t v10 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
    }
    while (v10);
  }

  v93 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v94 = [(GEOTileKeyList *)v105 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v94;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (v115 - (unsigned char *)v114) >> 4;
    _os_log_impl(&dword_188D96000, v93, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Accumulated list has: %lu tiles for %lu points", buf, 0x16u);
  }

  [(GEOTransitRoutePreloadStrategy *)self _ignoreAlreadyRequestedTilesAndUpdateGlobalListWithNonDuplicatesForTileKeyList:v105];
  [(_GEOTransitPreloadBatch *)v7 setPlaceDatasToLoad:0];
  v7->priority = v99;
  v7->status = 0;
  placeDataRequestTicketForBatch = v7->placeDataRequestTicketForBatch;
  v7->placeDataRequestTicketForBatch = 0;

  if ([(GEOTileKeyList *)v105 count])
  {
    [(_GEOTransitPreloadBatch *)v7 setTilesToLoad:v105];
    v96 = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
    [v96 addObject:v7];

    [(_GEOTransitRoutePreloaderData *)self->_reserved setCamera:v104];
    int64_t tilesRequested = self->_tilesRequested;
    self->_int64_t tilesRequested = [(GEOTileKeyList *)v105 count] + tilesRequested;
  }
  else
  {
    [(_GEOTransitPreloadBatch *)v7 setTilesToLoad:0];
  }

  if (v114)
  {
    v115 = (char *)v114;
    operator delete(v114);
  }
}

- (void)_processBatches
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_int downloadState = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(_GEOTransitRoutePreloaderData *)self->_reserved preloadBatches];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        uint64_t v8 = v7[3];
        BOOL v9 = v8 == 5 || v8 == 0;
        if (v9 && v7[5] <= 4uLL)
        {
          uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v6) placeDatasToLoad];
          BOOL v11 = [v10 count] == 0;

          if (v11)
          {
            long long v12 = [v7 tilesToLoad];
            BOOL v13 = [v12 count] == 0;

            if (v13) {
              [(GEOTransitRoutePreloadStrategy *)self _processedFinishedBatch:v7 withPartialStatus:2];
            }
            else {
              [(GEOTransitRoutePreloadStrategy *)self _loadTilesForBatch:v7];
            }
          }
          else
          {
            [(GEOTransitRoutePreloadStrategy *)self _loadPlacecardsForBatch:v7];
          }
          self->_int downloadState = 0;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)_processedFinishedBatch:(id)a3 withPartialStatus:(unint64_t)a4
{
  BOOL v9 = a3;
  uint64_t v6 = [v9 tilesToLoad];
  if ([v6 count])
  {
  }
  else
  {
    id v7 = [v9 placeDatasToLoad];
    uint64_t v8 = [v7 count];

    if (!v8) {
      a4 = 2;
    }
  }
  v9[3] = a4;
  [(GEOTransitRoutePreloadStrategy *)self _performNextRequests];
}

- (void)_loadTilesForBatch:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke;
  v83[3] = &unk_1E53DE338;
  uint64_t v47 = self;
  v83[4] = self;
  uint64_t v37 = (void *)MEMORY[0x18C120660](v83);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2;
  v80[3] = &unk_1E53DE388;
  id v5 = v4;
  id v81 = v5;
  v82 = self;
  BOOL v38 = (void *)MEMORY[0x18C120660](v80);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_3;
  v78[3] = &unk_1E53D81E8;
  v78[4] = self;
  v46 = (unsigned int *)v5;
  id v79 = v46;
  uint64_t v39 = (void *)MEMORY[0x18C120660](v78);
  *((void *)v46 + 3) = 1;
  BOOL v35 = [v46 tilesToLoad];
  uint64_t v42 = [v35 count];
  v44 = GEOTileLoaderClientIdentifier(self);
  unint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42];
  unint64_t v41 = [[GEOTileKeyList alloc] initWithMaxCapacity:v42];
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  int v77 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
  objc_msgSend(WeakRetained, "incrementTileLoadStatistic:amount:", 0, objc_msgSend(v35, "count"));

  id v7 = objc_loadWeakRetained((id *)&self->_preloader);
  v45 = [v7 auditToken];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v35;
  uint64_t v8 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (v8)
  {
    uint64_t v36 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v72 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        BOOL v11 = +[GEOTileLoader modernLoader];
        uint64_t v12 = v46[28];
        workQueue = self->_workQueue;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_116;
        v60[3] = &unk_1E53DE3B0;
        double v68 = v75;
        v60[4] = self;
        id v61 = v40;
        int v62 = v41;
        double v69 = v76;
        id v65 = v37;
        id v14 = obj;
        id v63 = v14;
        double v64 = v46;
        uint64_t v70 = v42;
        id v66 = v38;
        id v67 = v39;
        [v11 loadKey:v10 priority:v12 forClient:v44 options:519 reason:3 auditToken:v45 callbackQ:workQueue beginNetwork:0 callback:v60];
      }
      uint64_t v8 = [v14 countByEnumeratingWithState:&v71 objects:v87 count:16];
    }
    while (v8);
  }

  long long v15 = objc_alloc_init(GEOTileKeyList);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v16 = obj;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v86 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v56 + 1) + 8 * j);
        v21 = +[GEOResourceManifestManager modernManager];
        double v22 = [v21 activeTileGroup];
        double v23 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED73DA20];
        double v24 = [v22 regionalResourceKeysForTileKey:v20 scale:0 scenarios:v23];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v85 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v53;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v25);
              }
              [(GEOTileKeyList *)v15 addKey:*(void *)(*((void *)&v52 + 1) + 8 * k)];
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v85 count:16];
          }
          while (v26);
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v86 count:16];
    }
    while (v17);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v29 = v15;
  uint64_t v30 = [(GEOTileKeyList *)v29 countByEnumeratingWithState:&v48 objects:v84 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = *(void *)(*((void *)&v48 + 1) + 8 * m);
        v34 = +[GEOTileLoader modernLoader];
        [v34 loadKey:v33 priority:v46[28] forClient:v44 options:3 reason:3 auditToken:v45 callbackQ:v47->_workQueue beginNetwork:0 callback:&__block_literal_global_44];
      }
      uint64_t v30 = [(GEOTileKeyList *)v29 countByEnumeratingWithState:&v48 objects:v84 count:16];
    }
    while (v30);
  }

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 128))
  {
    id v5 = [*(id *)(v3 + 16) tilesReceived];
    [v5 addKey:a3];
  }
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v6 = a4;
  id v7 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = [v30 count];
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "[TransitStrategy] Tile Preloader failed with %lu keys", buf, 0xCu);
  }
  uint64_t v31 = a1;

  uint64_t v8 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v9 + 48);
    uint64_t v10 = *(void *)(v9 + 56);
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = v11;
    __int16 v48 = 2048;
    uint64_t v49 = v10;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Total bytes loaded: (%lu) from network: (%lu)", buf, 0x16u);
  }

  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  obuint64_t j = v30;
  char v12 = 0;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v42;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v42 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
      uint64_t v17 = objc_msgSend(v6, "objectAtIndex:", 0, v30);
      uint64_t v18 = [v17 domain];
      uint64_t v19 = GEOErrorDomain();
      int v20 = [v18 isEqualToString:v19];

      if (!v20) {
        goto LABEL_22;
      }
      uint64_t v21 = [v17 code];
      if (v21 > -3)
      {
        if (v21 != -2)
        {
          if (v21 == -1)
          {
LABEL_27:
            uint64_t v26 = *(void **)(v31 + 40);
            if (!v26[12])
            {
              objc_initWeak((id *)buf, v26);
              uint64_t v35 = MEMORY[0x1E4F143A8];
              uint64_t v36 = 3221225472;
              uint64_t v37 = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_113;
              BOOL v38 = &unk_1E53DE360;
              objc_copyWeak(&v40, (id *)buf);
              uint64_t v39 = *(void *)(v31 + 40);
              uint64_t v27 = geo_dispatch_timer_create_on_queue();
              uint64_t v28 = *(void *)(v31 + 40);
              unint64_t v29 = *(void **)(v28 + 96);
              *(void *)(v28 + 96) = v27;

              dispatch_resume(*(dispatch_object_t *)(*(void *)(v31 + 40) + 96));
              objc_destroyWeak(&v40);
              objc_destroyWeak((id *)buf);
            }

            id v25 = obj;
            goto LABEL_30;
          }
          goto LABEL_22;
        }
        double v23 = *(void **)(*(void *)(v31 + 40) + 16);
        if (!v23) {
          goto LABEL_18;
        }
        double v22 = [v23 tilesLoadingOrLoaded];
        [v22 removeKey:v16];
      }
      else
      {
        if (v21 != -7)
        {
          if (v21 == -15) {
            goto LABEL_27;
          }
          goto LABEL_22;
        }
        double v22 = [*(id *)(*(void *)(v31 + 40) + 16) tilesLoadingOrLoaded];
        [v22 removeKey:v16];
      }

LABEL_18:
      char v12 = 1;
LABEL_22:

      if (v13 == ++v15)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v13) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  double v24 = [*(id *)(v31 + 32) tilesToLoad];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2_114;
  v33[3] = &unk_1E53DE310;
  id v34 = obj;
  [v24 removeKeysMatchingPredicate:v33];

  if (v12)
  {
    *(void *)(*(void *)(v31 + 32) + 24) = 0;
    ++*(void *)(*(void *)(v31 + 32) + 40);
    [*(id *)(v31 + 40) _retryFailuresWithErrorsReset:0];
  }
  id v25 = v34;
LABEL_30:
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_113(uint64_t a1)
{
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && WeakRetained[12])
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 96));
    id v4 = (void *)v6[12];
    v6[12] = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  [v5 _geodCrashed];
}

uint64_t __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_2_114(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsKey:a2] ^ 1;
}

uint64_t __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_3(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 128))
  {
    uint64_t v1 = result;
    double v2 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = [*(id *)(v1 + 40) tilesToLoad];
      int v8 = 134217984;
      uint64_t v9 = [v3 count];
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Tile Preloader finished with %lu keys", (uint8_t *)&v8, 0xCu);
    }
    id v4 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(v1 + 40);
      uint64_t v7 = *(void *)(v5 + 48);
      uint64_t v6 = *(void *)(v5 + 56);
      int v8 = 134218240;
      uint64_t v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Total bytes loaded: (%lu) from network: (%lu)", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(v1 + 40) setTilesToLoad:0];
    return [*(id *)(v1 + 32) _processedFinishedBatch:*(void *)(v1 + 40) withPartialStatus:3];
  }
  return result;
}

void __53__GEOTransitRoutePreloadStrategy__loadTilesForBatch___block_invoke_116(uint64_t a1, long long *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  long long v25 = *a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (v12)
  {
    if (objc_msgSend(v12, "code", v25) == -2
      && ([v12 domain],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 isEqualToString:v16],
          v16,
          v15,
          v17))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [WeakRetained incrementTileLoadStatistic:3 amount:1];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [WeakRetained incrementTileLoadStatistic:4 amount:1];
    }

    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 48) addKey:&v25];
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += a4;
    uint64_t v19 = objc_msgSend(v13, "objectForKey:", @"GEOTileLoadResultSource", v25);
    uint64_t v20 = [v19 integerValue];

    id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    double v22 = v21;
    if (v20 == 2) {
      [v21 incrementTileLoadStatistic:1 amount:1];
    }
    else {
      [v21 incrementTileLoadStatistic:2 amount:1];
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    if (v20 == 2) {
      *(void *)(*(void *)(a1 + 64) + 56) += a4;
    }
    *(void *)(*(void *)(a1 + 64) + 48) += a4;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) == *(void *)(a1 + 112))
  {
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v23 = *(void *)(a1 + 80);
      double v24 = [*(id *)(a1 + 64) tilesToLoad];
      (*(void (**)(uint64_t, void *, void, void))(v23 + 16))(v23, v24, *(void *)(a1 + 48), *(void *)(a1 + 40));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
  }
}

- (void)_loadPlacecardsForBatch:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = [v4 placeDatasToLoad];
  uint64_t v6 = [v5 allObjects];

  if ([v6 count])
  {
    if (v4[3] != (id)2)
    {
      id v7 = v4[4];
      if (v7 == (id)[(_GEOTransitRoutePreloaderData *)self->_reserved currentBatchGeneration])
      {
        v4[3] = (id)1;
        int v8 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v6;
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Requesting PlaceData for IDs: %@", buf, 0xCu);
        }

        uint64_t v9 = +[GEOMapService sharedService];
        __int16 v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)v4 + 16)];
        id v11 = [v9 ticketForTransitIdentifiers:v6 endDateForPlacecardSchedulesForThisBatch:v10 traits:self->_traits];

        objc_storeStrong(v4 + 15, v11);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke;
        v14[3] = &unk_1E53DE420;
        v14[4] = self;
        id v15 = v6;
        uint64_t v16 = v4;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
        id v13 = [WeakRetained auditToken];
        [v11 submitWithHandler:v14 auditToken:v13 timeout:0 networkActivity:0];
      }
    }
  }
}

void __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke_2;
  block[3] = &unk_1E53DE3F8;
  id v13 = v5;
  id v14 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __58__GEOTransitRoutePreloadStrategy__loadPlacecardsForBatch___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v2 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)uint64_t v27 = 134217984;
    *(void *)&v27[4] = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "[TransitStrategy] Placecard Preloader received %lu placecards", v27, 0xCu);
  }

  if (*(void *)(a1 + 40))
  {
    id v4 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v27 = 138412290;
      *(void *)&v27[4] = v5;
      id v6 = "[TransitStrategy] Placecard preloader received errors: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_17:
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, v6, v27, v8);
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 48) count];
    if (v9 == [*(id *)(a1 + 32) count])
    {
      if ([*(id *)(a1 + 48) count])
      {
        char v10 = 0;
        unint64_t v11 = 0;
        do
        {
          id v12 = [*(id *)(a1 + 48) objectAtIndex:v11];
          id v13 = [*(id *)(a1 + 32) objectAtIndex:v11];
          id v14 = [v13 _placeData];

          int v15 = [v14 status];
          uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 16);
          if (v15)
          {
            id v17 = [v16 placecardsMissed];
            [v17 addObject:v12];
            char v10 = 1;
          }
          else
          {
            id v17 = [v16 placecardsReceived];
            [v17 addObject:v12];
          }

          ++v11;
        }
        while (v11 < [*(id *)(a1 + 48) count]);
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void **)(v18 + 120);
        *(void *)(v18 + 120) = 0;

        if (v10) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v25 = *(void *)(a1 + 64);
        uint64_t v26 = *(void **)(v25 + 120);
        *(void *)(v25 + 120) = 0;
      }
      [*(id *)(a1 + 64) setPlaceDatasToLoad:0];
      return [*(id *)(a1 + 56) _processedFinishedBatch:*(void *)(a1 + 64) withPartialStatus:4];
    }
    id v4 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [*(id *)(a1 + 48) count];
      uint64_t v21 = [*(id *)(a1 + 32) count];
      *(_DWORD *)uint64_t v27 = 134218240;
      *(void *)&v27[4] = v20;
      *(_WORD *)&v27[12] = 2048;
      *(void *)&v27[14] = v21;
      id v6 = "[TransitStrategy] Place cards requested: (%lu) did not match place cards received: (%lu) and no error was returned either.";
      id v7 = v4;
      uint32_t v8 = 22;
      goto LABEL_17;
    }
  }

  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v23 = *(void **)(v22 + 120);
  *(void *)(v22 + 120) = 0;

LABEL_19:
  *(void *)(*(void *)(a1 + 64) + 24) = 0;
  ++*(void *)(*(void *)(a1 + 64) + 40);
  return objc_msgSend(*(id *)(a1 + 56), "_retryFailuresWithErrorsReset:", 0, *(_OWORD *)v27, *(void *)&v27[16], v28);
}

- (void)_geodCrashed
{
  if (self->_enabled)
  {
    uint64_t v3 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[TransitStrategy] Daemon crashed. Redoing everything.", v4, 2u);
    }

    [(GEOTransitRoutePreloadStrategy *)self stop];
    [(GEOTransitRoutePreloadStrategy *)self start];
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  [(GEOTransitRoutePreloadStrategy *)self _cancelAllBatches];
  if (self->_enabled)
  {
    [(GEOTransitRoutePreloadStrategy *)self _stop];
    [(GEOTransitRoutePreloadStrategy *)self _start];
  }
}

- (GEORoutePreloader)preloader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);

  return (GEORoutePreloader *)WeakRetained;
}

- (void)setPreloader:(id)a3
{
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileSetStyles, 0);
  objc_storeStrong((id *)&self->_geodCrashTimer, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_preloader);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reserved, 0);

  objc_storeStrong((id *)&self->_suggestedRoute, 0);
}

@end