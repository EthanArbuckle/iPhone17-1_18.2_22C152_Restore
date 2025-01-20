@interface GEONavRoutePreloadStrategy
- (BOOL)forceDisableMetros;
- (BOOL)shouldLoadAssets;
- (GEOComposedRoute)route;
- (GEONavRoutePreloadStrategy)init;
- (GEORoutePreloadCamera)camera;
- (GEORoutePreloader)preloader;
- (void)_accumulateSteps;
- (void)_cancelAllSteps;
- (void)_cancelRequestsBehindCurrentPosition;
- (void)_cancelStep:(id)a3;
- (void)_geodCrashed;
- (void)_loadStep:(id)a3 requireWiFi:(BOOL)a4;
- (void)_performNextRequests;
- (void)_performTileRequestsWithCurrentRoutePositionStepIndex:(int64_t)a3 firstErrorStepIndex:(int64_t)a4 firstLoadStepIndex:(int64_t)a5 loadStepsAhead:(int64_t)a6 loadStepsAheadIfNoWiFi:(int64_t)a7;
- (void)_resetErrCounts;
- (void)_retryFailuresWithErrorsReset:(BOOL)a3;
- (void)_start;
- (void)_stop;
- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5;
- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5 restrictions:(unint64_t)a6;
- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)performTearDown;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setCamera:(id)a3;
- (void)setForceDisableMetros:(BOOL)a3;
- (void)setPreloader:(id)a3;
- (void)setRoute:(id)a3;
- (void)setShouldLoadAssets:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateWithRoute:(id)a3 routeMatch:(id)a4;
- (void)updateWithRouteMatch:(id)a3;
@end

@implementation GEONavRoutePreloadStrategy

- (GEONavRoutePreloadStrategy)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEONavRoutePreloadStrategy;
  v2 = [(GEONavRoutePreloadStrategy *)&v10 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(GEOSimpleRoutePreloadCamera);
    camera = v2->_camera;
    v2->_camera = (GEORoutePreloadCamera *)v5;

    v2->_maneuverSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_ManeuverSizeInMeters, (uint64_t)off_1E9113B28);
    v2->_stepSizeInMeters = GEOConfigGetDouble(GeoServicesConfig_StepSizeInMeters, (uint64_t)off_1E9113B18);
    v2->_useCellularCoverage = GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderUseCellularCoverage, (uint64_t)off_1E9113B48);
    v7 = GEOGetRoutePreloaderLog();
    v2->_signpostID = os_signpost_id_generate(v7);

    v8 = +[GEOResourceManifestManager modernManager];
    [v8 addTileGroupObserver:v2 queue:v2->_workQueue];
  }
  return v2;
}

- (void)performTearDown
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEONavRoutePreloadStrategy_performTearDown__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __45__GEONavRoutePreloadStrategy_performTearDown__block_invoke(uint64_t a1)
{
  v2 = +[GEOResourceManifestManager modernManager];
  [v2 removeTileGroupObserver:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _stop];
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5
{
}

- (void)addTileSetStyle:(int)a3 betweenZoom:(unsigned int)a4 andZoom:(unsigned int)a5 restrictions:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  if (!self->_tileSetStyles)
  {
    objc_super v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tileSetStyles = self->_tileSetStyles;
    self->_tileSetStyles = v10;
  }
  v12 = +[GEOResourceManifestManager modernManager];
  v13 = [v12 activeTileGroup];
  id v31 = [v13 activeTileSetForTileType:a3 scale:0];

  v14 = v31;
  if (v31)
  {
    if ((a6 & 1) == 0
      || (+[GEOPlatform sharedPlatform],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 supportsAdvancedMap],
          v15,
          v14 = v31,
          (v16 & 1) != 0))
    {
      if ((a6 & 2) != 0)
      {
        v17 = +[GEOPlatform sharedPlatform];
        int v18 = [v17 supportsAdvancedMap];

        if (!v18) {
          a6 ^= 2uLL;
        }
        v14 = v31;
      }
      if (v7 && (int)v7 >= (int)a4)
      {
        do
        {
          uint64_t v19 = objc_msgSend(v14, "largestZoomLevelLEQ:inRect:", v7, 0.0, 0.0, 268435456.0, 268435456.0);
          uint64_t v7 = (v19 - 1);
          if ((int)v19 >= 1)
          {
            v20 = self->_tileSetStyles;
            v21 = [NSNumber numberWithInt:v19];
            v22 = [(NSMutableDictionary *)v20 objectForKey:v21];

            if (!v22)
            {
              id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              v24 = self->_tileSetStyles;
              v25 = [NSNumber numberWithInt:v19];
              [(NSMutableDictionary *)v24 setObject:v23 forKey:v25];
            }
            v26 = [[_GEONavRoutePreloadTileType alloc] initWithStyle:a3 restrictions:a6];
            v27 = self->_tileSetStyles;
            v28 = [NSNumber numberWithInt:v19];
            v29 = [(NSMutableDictionary *)v27 objectForKey:v28];
            [v29 addObject:v26];
          }
          v14 = v31;
        }
        while ((int)v19 > (int)a4);
      }
    }
  }
}

- (void)observedNetworkQualityDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (a3 == 1 && a4 != 1)
  {
    void block[5] = v4;
    block[6] = v5;
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__GEONavRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke;
    block[3] = &unk_1E53D8418;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __69__GEONavRoutePreloadStrategy_observedNetworkQualityDidChangeFrom_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetErrCounts];
  v2 = *(void **)(a1 + 32);

  return [v2 _performNextRequests];
}

- (void)_resetErrCounts
{
  if (self->_anyErrors)
  {
    self->_anyErrors = 0;
    self->_mostRecentErrorTime = 0.0;
    [(NSMutableArray *)self->_steps makeObjectsPerformSelector:sel_resetErrors];
  }
}

- (void)_retryFailuresWithErrorsReset:(BOOL)a3
{
  if (self->_enabled)
  {
    if (a3) {
      [(GEONavRoutePreloadStrategy *)self _resetErrCounts];
    }
    [(GEONavRoutePreloadStrategy *)self _performNextRequests];
  }
}

- (void)_geodCrashed
{
  if (self->_enabled)
  {
    uint64_t v3 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Daemon crashed. Redoing everything.", v4, 2u);
    }

    [(GEONavRoutePreloadStrategy *)self stop];
    [(GEONavRoutePreloadStrategy *)self start];
  }
}

- (void)_accumulateSteps
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(GEOComposedRoute *)self->_route pointCount];
  if (v3 >= 2)
  {
    unsigned int v4 = v3;
    [(GEOComposedRoute *)self->_route pointAt:0];
    double v6 = GEOMapPointsPerMeterAtLatitude(v5);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v7 = self->_tileSetStyles;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v113 objects:v119 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v114;
      unint64_t v10 = 15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v114 != v9) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v113 + 1) + 8 * i);
          if (v10 <= [v12 unsignedIntegerValue]) {
            unint64_t v10 = [v12 unsignedIntegerValue];
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v113 objects:v119 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v10 = 15;
    }

    double stepSizeInMeters = self->_stepSizeInMeters;
    double v14 = exp2(15.0 - (double)v10);
    __p = 0;
    v111 = 0;
    v112 = 0;
    std::vector<GEOLocationCoordinate2D>::reserve(&__p, v4);
    uint64_t v15 = 0;
    double v16 = stepSizeInMeters * fmin(v14, 1.0);
    double v106 = 1.0 / v6;
    double v101 = v16 / (1.0 / v6);
    do
    {
      [(GEOComposedRoute *)self->_route pointAt:v15];
      double v19 = GEOTilePointForCoordinate(v17, v18, 20.0);
      double v21 = v19;
      uint64_t v22 = v20;
      id v23 = v111;
      if (v111 >= v112)
      {
        v25 = (double *)__p;
        uint64_t v26 = ((char *)v111 - (unsigned char *)__p) >> 4;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 60) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v28 = (char *)v112 - (unsigned char *)__p;
        if (((char *)v112 - (unsigned char *)__p) >> 3 > v27) {
          unint64_t v27 = v28 >> 3;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v112, v29);
          v25 = (double *)__p;
          id v23 = v111;
        }
        else
        {
          v30 = 0;
        }
        id v31 = (double *)&v30[16 * v26];
        *id v31 = v21;
        *((void *)v31 + 1) = v22;
        v32 = v31;
        if (v23 != v25)
        {
          do
          {
            *((_OWORD *)v32 - 1) = *((_OWORD *)v23 - 1);
            v32 -= 2;
            v23 -= 2;
          }
          while (v23 != v25);
          v25 = (double *)__p;
        }
        v24 = v31 + 2;
        __p = v32;
        v111 = v31 + 2;
        v112 = (double *)&v30[16 * v29];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        double *v111 = v19;
        *((void *)v23 + 1) = v20;
        v24 = v23 + 2;
      }
      v111 = v24;
      ++v15;
    }
    while (v15 != v4);
    [(GEOComposedRoute *)self->_route distance];
    v34 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:vcvtpd_u64_f64(v33 / v16)];
    steps = self->_steps;
    self->_steps = v34;

    if (!self->_sprAvailabilityFetcher)
    {
      v36 = [GEOSPRMetroAvailabilityFetcher alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
      v38 = [WeakRetained auditToken];
      v39 = [(GEOSPRMetroAvailabilityFetcher *)v36 initWithTileLoader:0 auditToken:v38 forceDisableMetros:self->_forceDisableMetros];
      sprAvailabilityFetcher = self->_sprAvailabilityFetcher;
      self->_sprAvailabilityFetcher = v39;
    }
    if (!self->_assetMetadataFetcher && self->_shouldLoadAssets)
    {
      v41 = +[GEOPlatform sharedPlatform];
      uint64_t v42 = [v41 supportsASTC];

      v43 = [GEOMapAssetMetadataFetcher alloc];
      id v44 = objc_loadWeakRetained((id *)&self->_preloader);
      v45 = [v44 auditToken];
      v46 = [(GEOMapAssetMetadataFetcher *)v43 initWithTileLoader:0 auditToken:v45 enableASTCTextures:v42];
      assetMetadataFetcher = self->_assetMetadataFetcher;
      self->_assetMetadataFetcher = v46;
    }
    id v48 = 0;
    v49 = (char *)__p;
    unint64_t v50 = (unint64_t)((char *)v111 - (unsigned char *)__p) >> 4;
    int v51 = v50 - 1;
    int v52 = v51 & ~(v51 >> 31);
    double v105 = (double)v52;
    double v104 = v105 - v105;
    v53 = (double *)((char *)__p + 16 * v52);
    if ((int)v50 - 1 >= v52 + 1) {
      int v54 = v52 + 1;
    }
    else {
      int v54 = v50 - 1;
    }
    v102 = (double *)((char *)__p + 16 * v54);
    v103 = v53;
    int v109 = 2;
    double v55 = 0.0;
    double v56 = 0.0;
    do
    {
      double v57 = floor(v55);
      double v58 = v55 - v57;
      v59 = (double *)&v49[16 * (int)v55];
      double v60 = *v59;
      double v61 = v59[1];
      if (v51 >= (int)v55 + 1) {
        int v62 = (int)v55 + 1;
      }
      else {
        int v62 = v50 - 1;
      }
      int v63 = vcvtmd_s64_f64(v55 + 1.0);
      if ((int)v50 <= v63)
      {
        uint64_t v81 = v62;
        double v80 = v55 - v57;
        double v76 = v61;
        double v77 = v60;
        double v65 = v56;
      }
      else
      {
        double v64 = floor(v55 + 1.0);
        double v65 = v56;
        double v66 = v101;
        double v67 = v55;
        do
        {
          int v68 = v63;
          double v69 = v67 - floor(v67);
          v70 = (double *)&v49[16 * (int)v67];
          if (v51 >= (int)v67 + 1) {
            int v71 = (int)v67 + 1;
          }
          else {
            int v71 = v50 - 1;
          }
          v72 = (double *)&v49[16 * v71];
          double v73 = *v70 + (*v72 - *v70) * v69;
          double v74 = v70[1] + (v72[1] - v70[1]) * v69;
          v75 = (double *)&v49[16 * v68];
          double v77 = *v75;
          double v76 = v75[1];
          double v78 = sqrt((v74 - v76) * (v74 - v76) + (v73 - *v75) * (v73 - *v75));
          if (v78 >= v66)
          {
            double v107 = v67 + v66 / v78 * (v64 - v67);
            double v108 = v65 + v66;
            goto LABEL_57;
          }
          double v67 = (double)v68;
          double v65 = v65 + v78;
          double v66 = v66 - v78;
          double v79 = (double)v68 + 1.0;
          double v64 = floor(v79);
          int v63 = vcvtmd_s64_f64(v79);
        }
        while ((int)v50 > v63);
        double v80 = v67 - v67;
        if (v51 >= v68 + 1) {
          LODWORD(v81) = v68 + 1;
        }
        else {
          LODWORD(v81) = v50 - 1;
        }
        uint64_t v81 = (int)v81;
      }
      v82 = (double *)&v49[16 * v81];
      double v83 = v77 + (*v82 - v77) * v80;
      double v84 = v76 + (v82[1] - v76) * v80;
      double v85 = v83 - (*v103 + (*v102 - *v103) * v104);
      --v109;
      double v107 = v105;
      double v108 = v65
           + sqrt((v84 - (v103[1] + (v102[1] - v103[1]) * v104)) * (v84 - (v103[1] + (v102[1] - v103[1]) * v104))+ v85 * v85);
LABEL_57:
      v86 = (double *)&v49[16 * v62];
      double v88 = *v86;
      double v87 = v86[1];
      if (v48)
      {
        id v89 = v48;
        goto LABEL_60;
      }
      id v89 = [(GEOComposedRoute *)self->_route stepAtIndex:0];
      if (v89)
      {
LABEL_60:
        while ([v89 endPointIndex] <= v55)
        {
          uint64_t v90 = [v89 getNextStep];

          id v89 = (id)v90;
          if (!v90) {
            goto LABEL_62;
          }
        }
      }
      else
      {
LABEL_62:
        v91 = [(GEOComposedRoute *)self->_route steps];
        id v89 = [v91 lastObject];
      }
      v92 = [GEONavRoutePreloadStep alloc];
      id v93 = objc_loadWeakRetained((id *)&self->_preloader);
      v94 = [v93 auditToken];
      uint64_t v95 = [(GEONavRoutePreloadStep *)v92 initWithAuditToken:v94 highZoomMetrosAvailabilityFetcher:self->_sprAvailabilityFetcher assetMetadataFetcher:self->_assetMetadataFetcher preloaderSignpostID:self->_signpostID];

      BOOL v96 = v89 != v48 && v48 != 0;
      *(unsigned char *)(v95 + 76) = *(unsigned char *)(v95 + 76) & 0xFE | v96;
      id v97 = v89;

      *(double *)(v95 + 24) = v55;
      *(long double *)(v95 + 8) = GEOCoordinate2DForMapPoint(v60 + (v88 - v60) * v58, v61 + (v87 - v61) * v58);
      *(void *)(v95 + 16) = v98;
      *(_DWORD *)(v95 + 72) = [(GEOComposedRoute *)self->_route estimatedCellularCoverageForOffset:v106 * v56];
      *(_DWORD *)(v95 + 68) = self->_stepGeneration;
      [(NSMutableArray *)self->_steps addObject:v95];

      double v55 = v107;
      double v56 = v108;
      id v48 = v97;
    }
    while (v109 > 0);
    v99 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v100 = [(NSMutableArray *)self->_steps count];
      *(_DWORD *)buf = 134349056;
      uint64_t v118 = v100;
      _os_log_impl(&dword_188D96000, v99, OS_LOG_TYPE_DEBUG, "[NavStrategy] Partitioned route into %{public}llu batches", buf, 0xCu);
    }

    if (__p)
    {
      v111 = (double *)__p;
      operator delete(__p);
    }
  }
}

- (void)_cancelStep:(id)a3
{
  unsigned int v3 = a3;
  if ((v3[76] & 2) != 0) {
    [v3 cancel];
  }
}

- (void)_cancelAllSteps
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v3 = self->_steps;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[GEONavRoutePreloadStrategy _cancelStep:](self, "_cancelStep:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_loadStep:(id)a3 requireWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 hasLifetimeError])
  {
    long long v7 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "[NavStrategy] Now loading previously failed batch %@", buf, 0xCu);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v9 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v8;

  -[GEORoutePreloadCamera implicateTilesForCoordinate:route:nearestRoutePointIdx:stepNearManeuever:into:stepSize:maneuverSize:tileSetStyles:](self->_camera, "implicateTilesForCoordinate:route:nearestRoutePointIdx:stepNearManeuever:into:stepSize:maneuverSize:tileSetStyles:", self->_route, *((unsigned char *)v6 + 76) & 1, *((void *)v6 + 4), self->_tileSetStyles, *((double *)v6 + 1), *((double *)v6 + 2), *((double *)v6 + 3), self->_stepSizeInMeters, self->_maneuverSizeInMeters);
  uint64_t v10 = 152;
  if ((*((unsigned char *)v6 + 76) & 1) == 0) {
    uint64_t v10 = 168;
  }
  uint64_t v11 = -[GEORoutePreloadCamera implicateAssetMetadataTilesForCoordinate:size:](self->_camera, "implicateAssetMetadataTilesForCoordinate:size:", *((double *)v6 + 1), *((double *)v6 + 2), *(double *)((char *)&self->super.isa + v10));
  uint64_t v12 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v11;

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke;
  v35[3] = &unk_1E53DE310;
  v35[4] = self;
  v13 = (void *)MEMORY[0x18C120660](v35);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_2;
  v32[3] = &unk_1E53F56D0;
  id v14 = v6;
  id v33 = v14;
  v34 = self;
  uint64_t v15 = (void *)MEMORY[0x18C120660](v32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_3;
  v28[3] = &unk_1E53F56F8;
  id v16 = v14;
  id v29 = v16;
  v30 = self;
  BOOL v31 = v4;
  double v17 = (void *)MEMORY[0x18C120660](v28);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_18;
  v25 = &unk_1E53D81E8;
  id v18 = v16;
  id v26 = v18;
  unint64_t v27 = self;
  double v19 = (void *)MEMORY[0x18C120660](&v22);
  ++self->_currentLoadingSteps;
  uint64_t v20 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    double v21 = (void *)*((void *)v6 + 3);
    *(_DWORD *)buf = 134218240;
    id v37 = v21;
    __int16 v38 = 1024;
    BOOL v39 = v4;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "[NavStrategy] Starting loading batch at route position %.1f. requireWiFi is %d", buf, 0x12u);
  }

  objc_msgSend(v18, "loadWithCallbackQueue:requireWiFi:willLoadHandler:progressHandler:finishedHandler:errorHandler:", self->_workQueue, v4, v13, v15, v19, v17, v22, v23, v24, v25);
}

uint64_t __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(*(void *)(a1 + 32) + 64) containsKey:a2];
  if ((v4 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) addKey:a2];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained incrementTileLoadStatistic:0 amount:1];
  }
  return v4 ^ 1u;
}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 40);
  if (*(_DWORD *)(*(void *)(a1 + 32) + 68) == *(_DWORD *)(v10 + 96))
  {
    id v18 = v9;
    if (v9)
    {
      if ([v9 code] == -2
        && ([v18 domain],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            GEOErrorDomain(),
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v11 isEqualToString:v12],
            v12,
            v11,
            v13))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
        [WeakRetained incrementTileLoadStatistic:3 amount:1];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
        [WeakRetained incrementTileLoadStatistic:4 amount:1];
      }

      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      [v15 preloadStrategy:*(void *)(a1 + 40) failedToLoadTileKey:a2 error:v18];
    }
    else
    {
      if (a4 == 2)
      {
        ++*(void *)(v10 + 80);
        id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
        [v16 incrementTileLoadStatistic:1 amount:1];

        id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
        [v17 incrementTileLoadStatistic:5 amount:a3];
      }
      else
      {
        id v17 = objc_loadWeakRetained((id *)(v10 + 16));
        [v17 incrementTileLoadStatistic:2 amount:1];
      }

      [*(id *)(*(void *)(a1 + 40) + 72) addKey:a2];
      id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      [v15 preloadStrategy:*(void *)(a1 + 40) loadedTileKey:a2 source:a4 sizeInBytes:a3];
    }

    id v9 = v18;
  }
}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v31 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(_DWORD *)(*(void *)(a1 + 32) + 68) != *(_DWORD *)(v5 + 96)) {
    goto LABEL_43;
  }
  --*(void *)(v5 + 104);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v31;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (!v7)
  {
    uint64_t v32 = 0;
    goto LABEL_28;
  }
  uint64_t v32 = 0;
  uint64_t v8 = *(void *)v44;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v44 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      uint64_t v11 = objc_msgSend(v10, "domain", v30);
      uint64_t v12 = GEOErrorDomain();
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        uint64_t v14 = [v10 code];
        if (v14 > -3)
        {
          if (v14 == -2)
          {
            BYTE4(v32) = 1;
            continue;
          }
          if (v14 == -1)
          {
LABEL_22:
            id v18 = GEOGetRoutePreloaderLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 24);
              *(_DWORD *)buf = 134217984;
              uint64_t v49 = v19;
              _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "[NavStrategy] Daemon died while handling batch at route position %.1f", buf, 0xCu);
            }

            uint64_t v20 = *(void **)(a1 + 40);
            if (!v20[18])
            {
              objc_initWeak((id *)buf, v20);
              uint64_t v37 = MEMORY[0x1E4F143A8];
              uint64_t v38 = 3221225472;
              BOOL v39 = __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_16;
              uint64_t v40 = &unk_1E53DE360;
              objc_copyWeak(&v42, (id *)buf);
              uint64_t v41 = *(void *)(a1 + 40);
              uint64_t v21 = geo_dispatch_timer_create_on_queue();
              uint64_t v22 = *(void *)(a1 + 40);
              uint64_t v23 = *(void **)(v22 + 144);
              *(void *)(v22 + 144) = v21;

              dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 144));
              objc_destroyWeak(&v42);
              objc_destroyWeak((id *)buf);
            }

            goto LABEL_43;
          }
        }
        else if (v14 == -7)
        {
          LOBYTE(v32) = 1;
        }
        else if (v14 == -15)
        {
          goto LABEL_22;
        }
        id v15 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 24);
          int v17 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          uint64_t v49 = v16;
          __int16 v50 = 1024;
          int v51 = v17;
          __int16 v52 = 2112;
          v53 = v10;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "[NavStrategy] Error preloading tiles for route position %.1f (requireWiFi:%d): %@", buf, 0x1Cu);
        }
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_28:

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v30;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "removeKey:", *(void *)(*((void *)&v33 + 1) + 8 * j), v30);
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v25);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 115) = 1;
  *(CFAbsoluteTime *)(*(void *)(a1 + 40) + 128) = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) encounteredErrors:v6];
  if ((v32 & 0x100000000) != 0)
  {
    id WeakRetained = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v29;
      _os_log_impl(&dword_188D96000, WeakRetained, OS_LOG_TYPE_INFO, "[NavStrategy] Request at route position %.1f cancelled", buf, 0xCu);
    }
LABEL_41:
  }
  else if ((v32 & 1) != 0 && !*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [WeakRetained updateObservedNetworkPerformanceWithServerError];
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 40), "_performNextRequests", v30);
LABEL_43:
}

void __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_16(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && WeakRetained[18])
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144));
    int v4 = (void *)v6[18];
    v6[18] = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  [v5 _geodCrashed];
}

uint64_t __52__GEONavRoutePreloadStrategy__loadStep_requireWiFi___block_invoke_18(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 40);
  if (*(_DWORD *)(*(void *)(result + 32) + 68) == *(_DWORD *)(v1 + 96))
  {
    uint64_t v2 = result;
    --*(void *)(v1 + 104);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(result + 40) + 16));
    [WeakRetained updateObservedNetworkPerformanceForDownload:*(unsigned int *)(*(void *)(v2 + 32) + 64) duration:*(double *)(*(void *)(v2 + 32) + 56) - *(double *)(*(void *)(v2 + 32) + 48)];

    int v4 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = *(void **)(v2 + 32);
      uint64_t v6 = v5[3];
      [v5 networkDataRateKB];
      int v8 = 134218240;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Finished loading batch at route position %.1f. Data rate is %.1fKB/s", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(v2 + 40) _resetErrCounts];
    return [*(id *)(v2 + 40) _performNextRequests];
  }
  return result;
}

- (void)_cancelRequestsBehindCurrentPosition
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v3 = self->_steps;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
      double v9 = *(double *)(v8 + 24);
      double currentRoutePosition = self->_currentRoutePosition;
      if (v9 < currentRoutePosition && (*(unsigned char *)(v8 + 76) & 2) != 0)
      {
        [(GEONavRoutePreloadStrategy *)self _cancelStep:(void)v11];
        ++v5;
      }
      else if (v9 > currentRoutePosition)
      {
        goto LABEL_13;
      }
      ++v7;
    }
    while (v4 != v7);
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  }
  while (v4);
LABEL_13:

  if (v5)
  {
    GEOGetRoutePreloaderLog();
    unsigned int v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v5;
      _os_log_impl(&dword_188D96000, &v3->super.super, OS_LOG_TYPE_INFO, "[NavStrategy] Canceled %lu steps because they are behind the current position", buf, 0xCu);
    }
LABEL_16:
  }
}

- (void)_performTileRequestsWithCurrentRoutePositionStepIndex:(int64_t)a3 firstErrorStepIndex:(int64_t)a4 firstLoadStepIndex:(int64_t)a5 loadStepsAhead:(int64_t)a6 loadStepsAheadIfNoWiFi:(int64_t)a7
{
  int64_t v9 = a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  BOOL anyErrors = self->_anyErrors;
  if (a4 < 0 && self->_anyErrors)
  {
    BOOL anyErrors = 0;
    self->_BOOL anyErrors = 0;
    self->_mostRecentErrorTime = 0.0;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    int64_t v13 = a5 - a3;
    double stepSizeInMeters = self->_stepSizeInMeters;
    uint64_t v15 = [(NSMutableArray *)self->_steps count];
    uint64_t v16 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int downloadState = self->_downloadState;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
      uint64_t v19 = [WeakRetained networkQuality];
      uint64_t v20 = "waiting";
      if (!downloadState) {
        uint64_t v20 = "active";
      }
      if ((unint64_t)(v19 - 1) > 6) {
        uint64_t v21 = "unknown";
      }
      else {
        uint64_t v21 = off_1E53F5718[v19 - 1];
      }
      double v23 = self->_stepSizeInMeters;
      *(_DWORD *)buf = 136316162;
      double v87 = *(double *)&v20;
      __int16 v88 = 2080;
      *(void *)id v89 = v21;
      *(_WORD *)&v89[8] = 2048;
      *(double *)&v89[10] = stepSizeInMeters * (double)v13 / 1000.0;
      *(_WORD *)&v89[18] = 2048;
      *(double *)&v89[20] = v23 * (double)a6 / 1000.0;
      __int16 v90 = 2048;
      double v91 = v23 * (double)a7 / 1000.0;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "[NavStrategy] Download state %s. Network quality %s. Currently loading %.1fKM ahead. Can load %.0fKM ahead, %.0fKM if wifi doesn't work.", buf, 0x34u);
    }
    if (v13 > a6)
    {
      if (self->_downloadState != 1)
      {
        id v24 = GEOGetRoutePreloaderLog();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

        if (v25)
        {
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          uint64_t v26 = self->_steps;
          uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v77 objects:v85 count:16];
          if (v27)
          {
            uint64_t v29 = *(void *)v78;
            double v30 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v78 != v29) {
                  objc_enumerationMutation(v26);
                }
                LODWORD(v28) = *(_DWORD *)(*(void *)(*((void *)&v77 + 1) + 8 * i) + 64);
                double v28 = (double)*(unint64_t *)&v28;
                double v30 = v30 + v28;
              }
              uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v77 objects:v85 count:16];
            }
            while (v27);
            double v32 = v30 * 0.000000953674316;
          }
          else
          {
            double v32 = 0.0;
          }

          double v73 = GEOGetRoutePreloaderLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            double v87 = v32;
            _os_log_impl(&dword_188D96000, v73, OS_LOG_TYPE_DEBUG, "[NavStrategy] Beyond load limit. Waiting. %.1fMB loaded so far.", buf, 0xCu);
          }
        }
      }
      self->_int downloadState = 1;
      double v74 = GEOGetRoutePreloaderLog();
      v75 = v74;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_188D96000, v75, OS_SIGNPOST_INTERVAL_END, signpostID, "NavStrategy.Active", "", buf, 2u);
      }

      return;
    }
    if (a6 + a3 >= v15 - 1) {
      int64_t v33 = v15 - 1;
    }
    else {
      int64_t v33 = a6 + a3;
    }
    if (a7 + a3 >= v15 - 1) {
      int64_t v34 = v15 - 1;
    }
    else {
      int64_t v34 = a7 + a3;
    }
    if (v33 >= v9)
    {
      uint64_t v37 = -1;
      do
      {
        if (self->_currentLoadingSteps > 1) {
          break;
        }
        long long v43 = [(NSMutableArray *)self->_steps objectAtIndex:v9];
        if ([v43 okToLoad])
        {
          long long v44 = GEOGetRoutePreloaderLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = [(NSMutableArray *)self->_steps count];
            *(_DWORD *)buf = 134349312;
            double v87 = *(double *)&v9;
            __int16 v88 = 2050;
            *(void *)id v89 = v45;
            _os_log_impl(&dword_188D96000, v44, OS_LOG_TYPE_DEBUG, "[NavStrategy] Loading batch %{public}llu / %{public}llu", buf, 0x16u);
          }

          [(GEONavRoutePreloadStrategy *)self _loadStep:v43 requireWiFi:v9 > v34];
          uint64_t v37 = v9;
        }

        ++v9;
      }
      while (v33 + 1 != v9);
      int v36 = self->_downloadState;
      BOOL v35 = v37 >= 0;
      if (v36 == 1 && (v37 & 0x8000000000000000) == 0)
      {
        long long v46 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v46, OS_LOG_TYPE_DEBUG, "[NavStrategy] Transition to download state 'active'", buf, 2u);
        }

        v47 = GEOGetRoutePreloaderLog();
        id v48 = v47;
        os_signpost_id_t v49 = self->_signpostID;
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_188D96000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v49, "NavStrategy.Active", "", buf, 2u);
        }

        self->_int downloadState = 0;
        goto LABEL_63;
      }
    }
    else
    {
      BOOL v35 = 0;
      int v36 = self->_downloadState;
      uint64_t v37 = -1;
    }
    if (v36) {
      BOOL v38 = 0;
    }
    else {
      BOOL v38 = v37 == v33;
    }
    if (v38)
    {
      BOOL v39 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_DEBUG, "[NavStrategy] Transition to download state 'waiting'", buf, 2u);
      }

      self->_int downloadState = 1;
      uint64_t v40 = GEOGetRoutePreloaderLog();
      uint64_t v41 = v40;
      os_signpost_id_t v42 = self->_signpostID;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_188D96000, v41, OS_SIGNPOST_INTERVAL_END, v42, "NavStrategy.Active", "", buf, 2u);
      }
    }
    if (!v35) {
      return;
    }
LABEL_63:
    __int16 v50 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      double v51 = self->_stepSizeInMeters * (double)(v37 - a3) / 1000.0;
      *(_DWORD *)buf = 134217984;
      double v87 = v51;
      _os_log_impl(&dword_188D96000, v50, OS_LOG_TYPE_DEBUG, "[NavStrategy] Now at %.1fKM ahead.", buf, 0xCu);
    }

    return;
  }
  if (self->_currentLoadingSteps)
  {
    uint64_t v22 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "[NavStrategy] No more steps to load, but still have some in-progress.", buf, 2u);
    }
  }
  else if (anyErrors)
  {
    __int16 v52 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v52, OS_LOG_TYPE_DEBUG, "[NavStrategy] Done loading, with some errors.", buf, 2u);
    }

    double v53 = CFAbsoluteTimeGetCurrent() - self->_mostRecentErrorTime;
    if (v53 > 60.0)
    {
      id v54 = objc_loadWeakRetained((id *)&self->_preloader);
      BOOL v55 = [v54 networkQuality] == 1;

      if (!v55)
      {
        double v56 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          double v87 = v53;
          _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_INFO, "[NavStrategy] It has been %{public}.0fs since last error occurred. Clearing errors", buf, 0xCu);
        }

        [(GEONavRoutePreloadStrategy *)self _retryFailuresWithErrorsReset:1];
      }
    }
  }
  else
  {
    self->_finished = 1;
    double v57 = GEOGetRoutePreloaderLog();
    double v58 = v57;
    os_signpost_id_t v59 = self->_signpostID;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v58, OS_SIGNPOST_INTERVAL_END, v59, "NavStrategy.Active", "", buf, 2u);
    }

    double v60 = GEOGetRoutePreloaderLog();
    BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);

    if (v61)
    {
      unint64_t v62 = [(NSMutableArray *)self->_steps count];
      double v63 = self->_stepSizeInMeters;
      double Current = CFAbsoluteTimeGetCurrent();
      double beginTime = self->_beginTime;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      double v66 = self->_steps;
      int v67 = 0;
      uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v81 objects:v92 count:16];
      if (v68)
      {
        uint64_t v69 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v68; ++j)
          {
            if (*(void *)v82 != v69) {
              objc_enumerationMutation(v66);
            }
            v67 += *(_DWORD *)(*(void *)(*((void *)&v81 + 1) + 8 * j) + 64);
          }
          uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v81 objects:v92 count:16];
        }
        while (v68);
      }

      int v71 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        unint64_t tilesLoadedFromNetwork = self->_tilesLoadedFromNetwork;
        *(_DWORD *)buf = 134218752;
        double v87 = *(double *)&tilesLoadedFromNetwork;
        __int16 v88 = 1024;
        *(_DWORD *)id v89 = v67;
        *(_WORD *)&v89[4] = 2048;
        *(double *)&v89[6] = v63 * (double)v62 / 1000.0;
        *(_WORD *)&v89[14] = 2048;
        *(double *)&v89[16] = Current - beginTime;
        _os_log_impl(&dword_188D96000, v71, OS_LOG_TYPE_INFO, "[NavStrategy] Fully loaded. %llu tiles (%{bytes}u) loaded from network for %.1fKM in %.0fs", buf, 0x26u);
      }
    }
  }
}

- (void)_performNextRequests
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!self->_enabled
    || self->_finished
    || self->_currentLoadingSteps > 1
    || ![(NSMutableArray *)self->_steps count]
    || self->_geodCrashTimer)
  {
    return;
  }
  unsigned int v3 = vcvtad_u64_f64(self->_currentRoutePosition);
  if ([(GEOComposedRoute *)self->_route pointCount] <= v3) {
    unsigned int v4 = [(GEOComposedRoute *)self->_route pointCount];
  }
  else {
    unsigned int v4 = vcvtad_u64_f64(self->_currentRoutePosition);
  }
  [(GEOComposedRoute *)self->_route distanceFromPointIndex:0 toPointIndex:v4];
  double v6 = v5;
  int downloadState = self->_downloadState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);
  uint64_t v9 = [WeakRetained networkQuality];
  uint64_t v10 = 0;
  double stepSizeInMeters = self->_stepSizeInMeters;
  double v12 = v6 / 1000.0;
  while (_downloadTruthTable[v10] != v9)
  {
    v10 += 5;
    if (v10 == 35)
    {
      double v13 = 0.0;
      goto LABEL_20;
    }
  }
  long long v14 = &_downloadTruthTable[v10];
  uint64_t v15 = v14 + 3;
  if (v12 <= 10.0) {
    uint64_t v15 = v14 + 1;
  }
  uint64_t v16 = (double *)(v14 + 4);
  int v17 = (double *)(v14 + 2);
  if (v12 > 10.0) {
    int v17 = v16;
  }
  if (downloadState) {
    int v17 = (double *)v15;
  }
  double v13 = *v17 * 1000.0;
LABEL_20:

  int v18 = self->_downloadState;
  id v19 = objc_loadWeakRetained((id *)&self->_preloader);
  uint64_t v20 = [v19 networkQuality];
  uint64_t v21 = 0;
  uint64_t v63 = (uint64_t)(v13 / stepSizeInMeters);
  uint64_t v22 = 4;
  uint64_t v23 = 5;
  if (v20 != 7) {
    uint64_t v23 = v20;
  }
  if (v20 != 6) {
    uint64_t v22 = v23;
  }
  double v24 = self->_stepSizeInMeters;
  while (_downloadTruthTable[v21] != v22)
  {
    v21 += 5;
    if (v21 == 35)
    {
      double v25 = 0.0;
      goto LABEL_35;
    }
  }
  uint64_t v26 = &_downloadTruthTable[v21];
  uint64_t v27 = v26 + 3;
  if (v12 <= 10.0) {
    uint64_t v27 = v26 + 1;
  }
  double v28 = (double *)(v26 + 4);
  uint64_t v29 = (double *)(v26 + 2);
  if (v12 > 10.0) {
    uint64_t v29 = v28;
  }
  if (v18) {
    uint64_t v29 = (double *)v27;
  }
  double v25 = *v29 * 1000.0;
LABEL_35:

  if (!v63) {
    return;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v30 = self->_steps;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v31)
  {
    uint64_t v32 = 0;
    uint64_t v33 = *(void *)v65;
    uint64_t v34 = -1;
    uint64_t v35 = -1;
    while (2)
    {
      uint64_t v36 = 0;
      uint64_t v61 = v31 + v32;
      do
      {
        if (*(void *)v65 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v37 = *(double **)(*((void *)&v64 + 1) + 8 * v36);
        if (v37[3] >= self->_currentRoutePosition)
        {
          if (v35 < 0) {
            uint64_t v35 = v32 + v36;
          }
          if (v34 < 0 && [*(id *)(*((void *)&v64 + 1) + 8 * v36) hasError]) {
            uint64_t v34 = v32 + v36;
          }
          if ([v37 okToLoad])
          {
            uint64_t v38 = v32 + v36;
            goto LABEL_54;
          }
        }
        ++v36;
      }
      while (v31 != v36);
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v64 objects:v74 count:16];
      uint64_t v32 = v61;
      if (v31) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v34 = -1;
    uint64_t v35 = -1;
  }
  uint64_t v38 = -1;
LABEL_54:
  unint64_t v60 = v38;

  uint64_t v39 = (uint64_t)(v25 / v24);
  uint64_t v62 = v35 & ~(v35 >> 63);
  if (!self->_useCellularCoverage
    || (Double = GEOConfigGetDouble(GeoServicesConfig_RoutePreloaderAvailableCellularCoverageMinDistance, (uint64_t)off_1E9113B58), v41 = self->_stepSizeInMeters, double v42 = GEOConfigGetDouble(GeoServicesConfig_RoutePreloaderMaxCellularUnavailableDistance, (uint64_t)off_1E9113B68), v43 = self->_stepSizeInMeters, v58 = [(NSMutableArray *)self->_steps count], v58 - v62 < 1))
  {
    unint64_t v48 = v63;
    goto LABEL_91;
  }
  unint64_t v45 = 0;
  unint64_t v46 = vcvtpd_u64_f64(Double / v41);
  int64_t v59 = vcvtpd_u64_f64(v42 / v43);
  uint64_t v47 = (v58 - v62) & ~((v58 - v62) >> 63);
  *(void *)&long long v44 = 134349568;
  long long v57 = v44;
  unint64_t v48 = v63;
  while (1)
  {
    unint64_t v49 = v62 + v45;
    -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v62 + v45, v57);
    __int16 v50 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v50[18] == 2) {
      break;
    }
LABEL_82:

    if (v45 < v48 && ++v45 < v47) {
      continue;
    }
    goto LABEL_91;
  }
  if ((uint64_t)(v48 - v63) <= v59)
  {
    uint64_t v51 = v46 + v45;
    if (v46 + v45 <= v48)
    {
      if (v49 >= v60)
      {
        BOOL v55 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349312;
          unint64_t v69 = v45;
          __int16 v70 = 2050;
          uint64_t v71 = v58;
          _os_log_impl(&dword_188D96000, v55, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage, but it is already contained within the range we intended to load", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v49 >= v60)
      {
        __int16 v52 = GEOGetRoutePreloaderLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v57;
          unint64_t v69 = v45;
          __int16 v70 = 2050;
          uint64_t v71 = v58;
          __int16 v72 = 2048;
          unint64_t v73 = v46;
          _os_log_impl(&dword_188D96000, v52, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage. Will load until %lu subsequent batches have cellular coverage", buf, 0x20u);
        }
      }
      if ((uint64_t)v48 <= v51) {
        uint64_t v53 = v46 + v45;
      }
      else {
        uint64_t v53 = v48;
      }
      if (v47 >= v53) {
        unint64_t v48 = v53;
      }
      else {
        unint64_t v48 = (v58 - v62) & ~((v58 - v62) >> 63);
      }
      if (v39 <= v51) {
        uint64_t v54 = v46 + v45;
      }
      else {
        uint64_t v54 = v39;
      }
      if (v47 < v54) {
        uint64_t v54 = (v58 - v62) & ~((v58 - v62) >> 63);
      }
      if (v45 <= v39) {
        uint64_t v39 = v54;
      }
    }
    goto LABEL_82;
  }
  if (v49 >= v60)
  {
    double v56 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      unint64_t v69 = v45;
      __int16 v70 = 2050;
      uint64_t v71 = v58;
      _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_DEBUG, "[NavStrategy] Batch %{public}llu / %{public}llu has estimated \"unavailable\" cellular coverage, but we have exceeded our allowable extension range", buf, 0x16u);
    }
  }
LABEL_91:
  [(GEONavRoutePreloadStrategy *)self _performTileRequestsWithCurrentRoutePositionStepIndex:v62 firstErrorStepIndex:v34 firstLoadStepIndex:v60 loadStepsAhead:v48 loadStepsAheadIfNoWiFi:v39];
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GEONavRoutePreloadStrategy_start__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __35__GEONavRoutePreloadStrategy_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  if (self->_enabled) {
    [(GEONavRoutePreloadStrategy *)self _stop];
  }
  unsigned int v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Starting...", buf, 2u);
  }

  unsigned int v4 = GEOGetRoutePreloaderLog();
  double v5 = v4;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)int v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "NavStrategy.Active", "", v18, 2u);
  }

  self->_enabled = 1;
  uint64_t v7 = +[GEOTileLoader modernLoader];
  uint64_t v8 = GEOTileLoaderClientIdentifier(self);
  [v7 openForClient:v8];

  uint64_t v9 = +[GEOResourceManifestManager modernManager];
  [v9 openServerConnection];

  if (!self->_tileSetStyles)
  {
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:1 betweenZoom:11 andZoom:15 restrictions:0];
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:53 betweenZoom:11 andZoom:15 restrictions:0];
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:11 betweenZoom:11 andZoom:15 restrictions:0];
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:13 betweenZoom:11 andZoom:15 restrictions:0];
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:22 betweenZoom:11 andZoom:15 restrictions:0];
    [(GEONavRoutePreloadStrategy *)self addTileSetStyle:20 betweenZoom:11 andZoom:15 restrictions:0];
  }
  uint64_t v10 = objc_alloc_init(GEOTileKeyList);
  tilesLoadingOrLoaded = self->_tilesLoadingOrLoaded;
  self->_tilesLoadingOrLoaded = v10;

  double v12 = objc_alloc_init(GEOTileKeyList);
  tilesReceived = self->_tilesReceived;
  self->_tilesReceived = v12;

  *(_WORD *)&self->_BOOL anyErrors = 0;
  self->_mostRecentErrorTime = 0.0;
  self->_double beginTime = CFAbsoluteTimeGetCurrent();
  ++self->_stepGeneration;
  self->_currentLoadingSteps = 0;
  [(GEONavRoutePreloadStrategy *)self _accumulateSteps];
  self->_double currentRoutePosition = 0.0;
  unint64_t v14 = [(NSMutableArray *)self->_steps count];
  double stepSizeInMeters = self->_stepSizeInMeters;
  uint64_t v16 = +[GEOTileLoader modernLoader];
  int v17 = GEOTileLoaderClientIdentifier(self);
  objc_msgSend(v16, "beginPreloadSessionOfSize:forClient:", vcvtd_n_u64_f64(stepSizeInMeters * (double)v14 / 1000.0 * 70.0, 0xAuLL), v17);

  [(GEONavRoutePreloadStrategy *)self _performNextRequests];
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__GEONavRoutePreloadStrategy_stop__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__GEONavRoutePreloadStrategy_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)_stop
{
  unsigned int v3 = GEOGetRoutePreloaderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "[NavStrategy] Stopping...", buf, 2u);
  }

  geodCrashTimer = self->_geodCrashTimer;
  if (geodCrashTimer)
  {
    dispatch_source_cancel(geodCrashTimer);
    double v5 = self->_geodCrashTimer;
    self->_geodCrashTimer = 0;
  }
  BOOL enabled = self->_enabled;
  self->_BOOL enabled = 0;
  [(GEONavRoutePreloadStrategy *)self _cancelAllSteps];
  if (enabled)
  {
    if (!self->_downloadState && !self->_finished)
    {
      uint64_t v7 = GEOGetRoutePreloaderLog();
      uint64_t v8 = v7;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)id v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_188D96000, v8, OS_SIGNPOST_INTERVAL_END, signpostID, "NavStrategy.Active", "", v19, 2u);
      }
    }
    uint64_t v10 = +[GEOTileLoader modernLoader];
    long long v11 = GEOTileLoaderClientIdentifier(self);
    [v10 endPreloadSessionForClient:v11];

    double v12 = +[GEOTileLoader modernLoader];
    double v13 = GEOTileLoaderClientIdentifier(self);
    [v12 closeForClient:v13];

    unint64_t v14 = +[GEOResourceManifestManager modernManager];
    [v14 closeServerConnection];
  }
  steps = self->_steps;
  self->_steps = 0;

  sprAvailabilityFetcher = self->_sprAvailabilityFetcher;
  self->_sprAvailabilityFetcher = 0;

  tilesLoadingOrLoaded = self->_tilesLoadingOrLoaded;
  self->_tilesLoadingOrLoaded = 0;

  tilesReceived = self->_tilesReceived;
  self->_tilesReceived = 0;

  *(_WORD *)&self->_BOOL anyErrors = 0;
  self->_mostRecentErrorTime = 0.0;
}

- (void)updateWithRoute:(id)a3 routeMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GEONavRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke;
  block[3] = &unk_1E53DDDB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

unsigned char *__57__GEONavRoutePreloadStrategy_updateWithRoute_routeMatch___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 3, a1[5]);
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
  *((double *)a1[4] + 5) = v4;
  result = a1[4];
  if (result[160])
  {
    [result _stop];
    result = (unsigned char *)[a1[4] _start];
  }
  if (a1[6])
  {
    [a1[4] _cancelRequestsBehindCurrentPosition];
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
  v7[2] = __51__GEONavRoutePreloadStrategy_updateWithRouteMatch___block_invoke;
  v7[3] = &unk_1E53D81E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __51__GEONavRoutePreloadStrategy_updateWithRouteMatch___block_invoke(uint64_t a1)
{
  double v2 = (double)[*(id *)(a1 + 40) routeCoordinate];
  *(double *)(*(void *)(a1 + 32) + 40) = v2
                                           + COERCE_FLOAT((unint64_t)[*(id *)(a1 + 40) routeCoordinate] >> 32);
  [*(id *)(a1 + 32) _cancelRequestsBehindCurrentPosition];
  double v3 = *(void **)(a1 + 32);

  return [v3 _performNextRequests];
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  [(GEONavRoutePreloadStrategy *)self _cancelAllSteps];
  if (self->_enabled)
  {
    [(GEONavRoutePreloadStrategy *)self _stop];
    [(GEONavRoutePreloadStrategy *)self _start];
  }
}

- (GEORoutePreloadCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (GEORoutePreloader)preloader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preloader);

  return (GEORoutePreloader *)WeakRetained;
}

- (void)setPreloader:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (BOOL)shouldLoadAssets
{
  return self->_shouldLoadAssets;
}

- (void)setShouldLoadAssets:(BOOL)a3
{
  self->_shouldLoadAssets = a3;
}

- (BOOL)forceDisableMetros
{
  return self->_forceDisableMetros;
}

- (void)setForceDisableMetros:(BOOL)a3
{
  self->_forceDisableMetros = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_sprAvailabilityFetcher, 0);
  objc_storeStrong((id *)&self->_tileSetStyles, 0);
  objc_storeStrong((id *)&self->_geodCrashTimer, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_tilesReceived, 0);
  objc_storeStrong((id *)&self->_tilesLoadingOrLoaded, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_preloader);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end