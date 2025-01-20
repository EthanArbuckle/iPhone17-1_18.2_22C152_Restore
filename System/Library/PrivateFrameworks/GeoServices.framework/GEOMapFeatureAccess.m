@interface GEOMapFeatureAccess
+ ($7E3FC3C8846FD6918BD0D88F3AA609C8)tileSetInfoForStyle:(int)a3 scale:(int)a4;
- (BOOL)allowNetworkTileLoad;
- (BOOL)allowOfflineData;
- (BOOL)allowStaleData;
- (BOOL)cachedTilesCallbackImmediately;
- (BOOL)flipNegativeTravelDirectionRoads;
- (BOOL)joinAllRoadsByMuid;
- (BOOL)preferStaleData;
- (BOOL)visitDoubleTravelDirectionRoadsTwice;
- (GEOApplicationAuditToken)auditToken;
- (GEOMapFeatureAccess)init;
- (GEOMapFeatureAccess)initWithQueue:(id)a3;
- (GEOMapFeatureAccess)initWithQueue:(id)a3 memoryCacheCountLimit:(unint64_t)a4 memoryCacheCostLimit:(unint64_t)a5;
- (double)syncTimeout;
- (id)_findChildrenOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)_findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)_findTransitPointsOfType:(unint64_t)a3 nearCoordinate:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7;
- (id)_openTileLoaderWithCompletionHandler:(id)a3;
- (id)_requestParameters;
- (id)_synchronousFindWithHandler:(id)a3;
- (id)findAllRoadsAtNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findAllRoadsAtPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7;
- (id)findRaytracingDataNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadsFromJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadsFromNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadsFromPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadsToJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadsToNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadsToPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitGeometryForPoint:(id)a3 completionHandler:(id)a4;
- (id)findTransitHallForStop:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitHallsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitHallsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStationForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitStationsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStopsForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitStopsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)roadTileKeysNear:(id)a3 radius:(double)a4;
- (id)synchronousFindRoadWithID:(unint64_t)a3;
- (id)synchronousFindRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4;
- (id)synchronousFindRoadsFromNextIntersectionOf:(id)a3;
- (id)synchronousFindRoadsFromPreviousIntersectionOf:(id)a3;
- (id)synchronousFindRoadsNear:(id)a3 radius:(double)a4;
- (id)synchronousFindRoadsToNextIntersectionOf:(id)a3;
- (id)synchronousFindRoadsToPreviousIntersectionOf:(id)a3;
- (void)_clearStandardTilesWithType:(int)a3;
- (void)_preloadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 tileSetStyle:(int)a6 tileScale:(int)a7 completionHandler:(id)a8;
- (void)clearAllTiles;
- (void)clearBuildingTiles;
- (void)clearRoadTiles;
- (void)clearRunningTrackTiles;
- (void)clearTransitTiles;
- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 preloadToDiskOnly:(BOOL)a6 completionHandler:(id)a7;
- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)setAllowNetworkTileLoad:(BOOL)a3;
- (void)setAllowOfflineData:(BOOL)a3;
- (void)setAllowStaleData:(BOOL)a3;
- (void)setAuditToken:(id)a3;
- (void)setCachedTilesCallbackImmediately:(BOOL)a3;
- (void)setFlipNegativeTravelDirectionRoads:(BOOL)a3;
- (void)setJoinAllRoadsByMuid:(BOOL)a3;
- (void)setPreferStaleData:(BOOL)a3;
- (void)setSyncTimeout:(double)a3;
- (void)setVisitDoubleTravelDirectionRoadsTwice:(BOOL)a3;
@end

@implementation GEOMapFeatureAccess

- (GEOMapFeatureAccess)initWithQueue:(id)a3 memoryCacheCountLimit:(unint64_t)a4 memoryCacheCostLimit:(unint64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapFeatureAccess;
  v10 = [(GEOMapFeatureAccess *)&v17 init];
  if (v10)
  {
    v11 = objc_alloc_init(GEOTileLoaderConfiguration);
    [(GEOTileLoaderConfiguration *)v11 setMemoryCacheCostLimit:a5];
    [(GEOTileLoaderConfiguration *)v11 setMemoryCacheCountLimit:a4];
    v12 = objc_alloc_init(GEOVectorTileDecoder);
    v13 = [[GEOTileLoader alloc] initWithConfiguration:v11];
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v13;

    [(GEOTileLoader *)v10->_tileLoader registerTileDecoder:v12];
    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v10->_syncTimeout = 10.0;
    v15 = v10;
  }
  return v10;
}

- (void)setAllowNetworkTileLoad:(BOOL)a3
{
  self->_allowNetworkTileLoad = a3;
}

- (GEOMapFeatureAccess)init
{
  return [(GEOMapFeatureAccess *)self initWithQueue:MEMORY[0x1E4F14428]];
}

- (GEOMapFeatureAccess)initWithQueue:(id)a3
{
  id v5 = a3;
  if (initWithQueue__onceToken != -1) {
    dispatch_once(&initWithQueue__onceToken, &__block_literal_global_4_5);
  }
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureAccess;
  v6 = [(GEOMapFeatureAccess *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    uint64_t v8 = +[GEOTileLoader modernLoader];
    tileLoader = v7->_tileLoader;
    v7->_tileLoader = (GEOTileLoader *)v8;

    v7->_syncTimeout = 10.0;
  }

  return v7;
}

void __37__GEOMapFeatureAccess_initWithQueue___block_invoke()
{
  v1 = objc_alloc_init(GEOVectorTileDecoder);
  v0 = +[GEOTileLoader modernLoader];
  [v0 registerTileDecoder:v1];
}

- (id)_openTileLoaderWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t add = atomic_fetch_add(_openTileLoaderWithCompletionHandler__counter, 1u);
  v6 = NSString;
  v7 = GEOTileLoaderClientIdentifier(self);
  uint64_t v8 = [v6 stringWithFormat:@"%@(%d)", v7, add];

  [(GEOTileLoader *)self->_tileLoader openForClient:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__GEOMapFeatureAccess__openTileLoaderWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E53E83D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v4;
  id v9 = v4;
  id v10 = v8;
  objc_super v11 = (void *)[v13 copy];

  return v11;
}

void __60__GEOMapFeatureAccess__openTileLoaderWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1[4] + 16) closeForClient:a1[5]];
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)_requestParameters
{
  uint64_t v3 = objc_alloc_init(_GEOMapFeatureAccessRequestParameters);
  [(_GEOMapFeatureAccessRequestParameters *)v3 setTileLoader:self->_tileLoader];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setQueue:self->_callbackQueue];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setAuditToken:self->_auditToken];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setAllowNetworkTileLoad:self->_allowNetworkTileLoad];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setFlipNegativeTravelDirectionRoads:self->_flipNegativeTravelDirectionRoads];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setVisitDoubleTravelDirectionRoadsTwice:self->_visitDoubleTravelDirectionRoadsTwice];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setAllowStaleData:self->_allowStaleData];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setPreferStaleData:self->_preferStaleData];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setAllowOfflineData:self->_allowOfflineData];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setJoinAllRoadsByMuid:self->_joinAllRoadsByMuid];
  [(_GEOMapFeatureAccessRequestParameters *)v3 setCachedTilesCallbackImmediately:self->_cachedTilesCallbackImmediately];

  return v3;
}

- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:v12];

    id v14 = [GEOMapFeatureRoadFinder alloc];
    id v15 = [(GEOMapFeatureAccess *)self _requestParameters];
    v16 = [(GEOMapFeatureAccessFinder *)v14 initWithRequestParameters:v15];

    objc_super v17 = -[GEOMapFeatureRoadFinder findRoadsNear:radius:handler:completionHandler:](v16, "findRoadsNear:radius:handler:completionHandler:", v11, v13, var0, var1, a4);

    id v12 = (id)v13;
  }
  else
  {
    v18 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadsNear:] requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != ((void *)0)", v20, 2u);
    }
    objc_super v17 = 0;
  }

  return v17;
}

- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:v9];

    id v11 = [GEOMapFeatureRoadFinder alloc];
    id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
    uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

    id v14 = [(GEOMapFeatureRoadFinder *)v13 findRoadWithID:a3 handler:v8 completionHandler:v10];

    id v9 = (id)v10;
  }
  else
  {
    id v15 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadWithID:] requires a handler", v17, 2u);
    }

    id v14 = 0;
  }

  return v14;
}

- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:v12];

    id v14 = [GEOMapFeatureRoadFinder alloc];
    id v15 = [(GEOMapFeatureAccess *)self _requestParameters];
    v16 = [(GEOMapFeatureAccessFinder *)v14 initWithRequestParameters:v15];

    objc_super v17 = -[GEOMapFeatureRoadFinder findRoadWithMuid:nearCoordinate:handler:completionHandler:](v16, "findRoadWithMuid:nearCoordinate:handler:completionHandler:", a3, v11, v13, var0, var1);

    id v12 = (id)v13;
  }
  else
  {
    v18 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "-[GEOMapFeatureAccess findRoadWithMuid:] requires a handler", v20, 2u);
    }

    objc_super v17 = 0;
  }

  return v17;
}

- (id)findRoadsFromPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtPreviousIntersectionOf:v9 desiredRoadDirectionality:2 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findRoadsToPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtPreviousIntersectionOf:v9 desiredRoadDirectionality:3 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findRoadsFromNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtNextIntersectionOf:v9 desiredRoadDirectionality:2 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findRoadsToNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtNextIntersectionOf:v9 desiredRoadDirectionality:3 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findAllRoadsAtPreviousIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtPreviousIntersectionOf:v9 desiredRoadDirectionality:self->_flipNegativeTravelDirectionRoads handler:v8 completionHandler:v10];

  return v14;
}

- (id)findAllRoadsAtNextIntersectionOf:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtNextIntersectionOf:v9 desiredRoadDirectionality:self->_flipNegativeTravelDirectionRoads handler:v8 completionHandler:v10];

  return v14;
}

- (id)findRoadsFromJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtJunction:v9 desiredRoadDirectionality:2 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findRoadsToJunction:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureIntersectedRoadFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureIntersectedRoadFinder *)v13 findRoadsAtJunction:v9 desiredRoadDirectionality:3 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findTransitStopsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__GEOMapFeatureAccess_findTransitStopsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E53E97B0;
  id v16 = v11;
  id v12 = v11;
  uint64_t v13 = -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 2, v15, a6, var0, var1, a4);

  return v13;
}

uint64_t __77__GEOMapFeatureAccess_findTransitStopsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitHallsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__GEOMapFeatureAccess_findTransitHallsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E53E97B0;
  id v16 = v11;
  id v12 = v11;
  uint64_t v13 = -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 4, v15, a6, var0, var1, a4);

  return v13;
}

uint64_t __77__GEOMapFeatureAccess_findTransitHallsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitStationsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__GEOMapFeatureAccess_findTransitStationsNear_radius_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E53E97B0;
  id v16 = v11;
  id v12 = v11;
  uint64_t v13 = -[GEOMapFeatureAccess _findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:](self, "_findTransitPointsOfType:nearCoordinate:radius:handler:completionHandler:", 8, v15, a6, var0, var1, a4);

  return v13;
}

uint64_t __80__GEOMapFeatureAccess_findTransitStationsNear_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  uint64_t v13 = [GEOMapFeatureTransitPointFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = -[GEOMapFeatureTransitPointFinder findTransitPointWithID:near:handler:completionHandler:](v15, "findTransitPointWithID:near:handler:completionHandler:", a3, v11, v12, var0, var1);

  return v16;
}

- (id)_findTransitPointsOfType:(unint64_t)a3 nearCoordinate:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  id v14 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a7];
  id v15 = [GEOMapFeatureTransitPointFinder alloc];
  id v16 = [(GEOMapFeatureAccess *)self _requestParameters];
  objc_super v17 = [(GEOMapFeatureAccessFinder *)v15 initWithRequestParameters:v16];

  v18 = -[GEOMapFeatureTransitPointFinder findTransitPointsOfType:near:radius:handler:completionHandler:](v17, "findTransitPointsOfType:near:radius:handler:completionHandler:", a3, v13, v14, var0, var1, a5);

  return v18;
}

- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  id v13 = [GEOMapFeatureTransitLinkFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = -[GEOMapFeatureTransitLinkFinder findTransitLinksNear:radius:handler:completionHandler:](v15, "findTransitLinksNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);

  return v16;
}

- (id)findTransitHallForStop:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__GEOMapFeatureAccess_findTransitHallForStop_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E53E97B0;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _findParentOfTransitPoint:a3 handler:v12 completionHandler:a5];

  return v10;
}

uint64_t __72__GEOMapFeatureAccess_findTransitHallForStop_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitStationForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__GEOMapFeatureAccess_findTransitStationForHall_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E53E97B0;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _findParentOfTransitPoint:a3 handler:v12 completionHandler:a5];

  return v10;
}

uint64_t __75__GEOMapFeatureAccess_findTransitStationForHall_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitStopsForHall:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__GEOMapFeatureAccess_findTransitStopsForHall_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E53E97B0;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _findChildrenOfTransitPoint:a3 handler:v12 completionHandler:a5];

  return v10;
}

uint64_t __73__GEOMapFeatureAccess_findTransitStopsForHall_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitHallsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__GEOMapFeatureAccess_findTransitHallsForStation_handler_completionHandler___block_invoke;
  v12[3] = &unk_1E53E97B0;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _findChildrenOfTransitPoint:a3 handler:v12 completionHandler:a5];

  return v10;
}

uint64_t __76__GEOMapFeatureAccess_findTransitHallsForStation_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureTransitPointFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureTransitPointFinder *)v13 findTransitAccessPointsForStation:v9 handler:v8 completionHandler:v10];

  return v14;
}

- (id)_findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureTransitPointFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureTransitPointFinder *)v13 findParentOfTransitPoint:v9 handler:v8 completionHandler:v10];

  return v14;
}

- (id)_findChildrenOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a5];
  id v11 = [GEOMapFeatureTransitPointFinder alloc];
  id v12 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v13 = [(GEOMapFeatureAccessFinder *)v11 initWithRequestParameters:v12];

  id v14 = [(GEOMapFeatureTransitPointFinder *)v13 findTransitPointsWithParent:v9 handler:v8 completionHandler:v10];

  return v14;
}

- (id)findTransitGeometryForPoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a4];
  id v8 = [GEOMapFeatureTransitPointFinder alloc];
  id v9 = [(GEOMapFeatureAccess *)self _requestParameters];
  uint64_t v10 = [(GEOMapFeatureAccessFinder *)v8 initWithRequestParameters:v9];

  id v11 = [(GEOMapFeatureTransitPointFinder *)v10 findGeometryForTransitPoint:v6 completionHandler:v7];

  return v11;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v13 = a6;
  id v14 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a7];
  id v15 = [GEOMapFeatureBuildingFinder alloc];
  id v16 = [(GEOMapFeatureAccess *)self _requestParameters];
  objc_super v17 = [(GEOMapFeatureAccessFinder *)v15 initWithRequestParameters:v16];

  v18 = -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:tileSetStyle:handler:completionHandler:](v17, "findBuildingsNear:radius:tileSetStyle:handler:completionHandler:", v8, v13, v14, var0, var1, a4);

  return v18;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  id v13 = [GEOMapFeatureBuildingFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:handler:completionHandler:](v15, "findBuildingsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);

  return v16;
}

- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  id v13 = [GEOMapFeatureRunningTrackFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = -[GEOMapFeatureRunningTrackFinder findRunningTrackFlagsNear:radius:handler:completionHandler:](v15, "findRunningTrackFlagsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);

  return v16;
}

- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  id v13 = [GEOMapFeatureRunningTrackFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = -[GEOMapFeatureRunningTrackFinder findRunningTracksNear:radius:handler:completionHandler:](v15, "findRunningTracksNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);

  return v16;
}

- (id)findRaytracingDataNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:a6];
  id v13 = [GEOMapFeatureRayTracingFinder alloc];
  id v14 = [(GEOMapFeatureAccess *)self _requestParameters];
  id v15 = [(GEOMapFeatureAccessFinder *)v13 initWithRequestParameters:v14];

  id v16 = [(GEOMapFeatureRayTracingFinder *)v15 findRaytracingDataNear:v12 radius:var0 handler:var1 completionHandler:a4];

  return v16;
}

- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__GEOMapFeatureAccess_preloadRoadTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E53E7F58;
  id v12 = v9;
  id v10 = v9;
  -[GEOMapFeatureAccess preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);
}

uint64_t __69__GEOMapFeatureAccess_preloadRoadTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__GEOMapFeatureAccess_preloadTransitTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E53E7F58;
  id v12 = v9;
  id v10 = v9;
  -[GEOMapFeatureAccess preloadTransitTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadTransitTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);
}

uint64_t __72__GEOMapFeatureAccess_preloadTransitTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__GEOMapFeatureAccess_preloadBuildingTilesNear_radius_completionHandler___block_invoke;
  v11[3] = &unk_1E53E7F58;
  id v12 = v9;
  id v10 = v9;
  -[GEOMapFeatureAccess preloadBuildingTilesNear:radius:preloadToDiskOnly:completionHandler:](self, "preloadBuildingTilesNear:radius:preloadToDiskOnly:completionHandler:", 0, v11, var0, var1, a4);
}

uint64_t __73__GEOMapFeatureAccess_preloadBuildingTilesNear_radius_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)preloadRoadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)preloadTransitTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)preloadBuildingTilesNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 preloadToDiskOnly:(BOOL)a6 completionHandler:(id)a7
{
}

- (id)roadTileKeysNear:(id)a3 radius:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v7 = +[GEOMapFeatureAccess tileSetInfoForStyle:53 scale:0];

  return GEOTileKeysForCoordinate(HIDWORD(*(unint64_t *)&v7), 53, *(void *)&v7, 0, var0, var1, a4);
}

- (void)_preloadTilesNear:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 tileSetStyle:(int)a6 tileScale:(int)a7 completionHandler:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v9 = *(void *)&a6;
  BOOL v10 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v15 = a8;
  id v16 = [(GEOMapFeatureAccess *)self _openTileLoaderWithCompletionHandler:0];
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v17 = +[GEOMapFeatureAccess tileSetInfoForStyle:v9 scale:v8];
  v18 = objc_alloc_init(_GEOMapFeatureAccessRequestParameters);
  [(_GEOMapFeatureAccessRequestParameters *)v18 setTileLoader:self->_tileLoader];
  [(_GEOMapFeatureAccessRequestParameters *)v18 setAllowNetworkTileLoad:1];
  [(_GEOMapFeatureAccessRequestParameters *)v18 setQueue:self->_callbackQueue];
  [(_GEOMapFeatureAccessRequestParameters *)v18 setAuditToken:self->_auditToken];
  v19 = [[GEOMapFeatureTileFinder alloc] initWithZoomLevel:HIDWORD(*(unint64_t *)&v17) tileSize:v17 tileScale:v8 tileSetStyle:v9 requestParameters:v18];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __107__GEOMapFeatureAccess__preloadTilesNear_radius_preloadToDiskOnly_tileSetStyle_tileScale_completionHandler___block_invoke;
  v23[3] = &unk_1E53E97D8;
  id v24 = v16;
  id v25 = v15;
  id v20 = v15;
  id v21 = v16;
  id v22 = -[GEOMapFeatureTileFinder preloadTilesAround:radius:preloadToDiskOnly:completionHandler:](v19, "preloadTilesAround:radius:preloadToDiskOnly:completionHandler:", v10, v23, var0, var1, a4);
}

uint64_t __107__GEOMapFeatureAccess__preloadTilesNear_radius_preloadToDiskOnly_tileSetStyle_tileScale_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v9);
  }

  return MEMORY[0x1F4181820](v7);
}

- (void)clearAllTiles
{
}

- (void)_clearStandardTilesWithType:(int)a3
{
  tileLoader = self->_tileLoader;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__GEOMapFeatureAccess__clearStandardTilesWithType___block_invoke;
  v4[3] = &__block_descriptor_36_e720_B16__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8l;
  int v5 = a3;
  [(GEOTileLoader *)tileLoader clearCachedTilesMatchingBlock:v4];
}

BOOL __51__GEOMapFeatureAccess__clearStandardTilesWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(unsigned char *)a2 & 0x7F) == 2 && *(unsigned __int16 *)(a2 + 13) >> 2 == *(_DWORD *)(a1 + 32);
}

- (void)clearRoadTiles
{
}

- (void)clearTransitTiles
{
  [(GEOMapFeatureAccess *)self _clearStandardTilesWithType:37];

  [(GEOMapFeatureAccess *)self _clearStandardTilesWithType:1];
}

- (void)clearBuildingTiles
{
  [(GEOMapFeatureAccess *)self _clearStandardTilesWithType:11];

  [(GEOMapFeatureAccess *)self _clearStandardTilesWithType:73];
}

- (void)clearRunningTrackTiles
{
}

- (void)setJoinAllRoadsByMuid:(BOOL)a3
{
  if (a3 && self->_cachedTilesCallbackImmediately)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: (joinAllRoadsByMuid && _cachedTilesCallbackImmediately) == NO", buf, 2u);
    }
    uint64_t v3 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "joinAllRoadsByMuid and cachdTilesCallbackImmediately cannot both be set", v4, 2u);
    }
  }
  else
  {
    self->_joinAllRoadsByMuid = a3;
  }
}

- (void)setCachedTilesCallbackImmediately:(BOOL)a3
{
  if (a3 && self->_joinAllRoadsByMuid)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: (cachedTilesCallbackImmediately && _joinAllRoadsByMuid) == NO", buf, 2u);
    }
    uint64_t v3 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "joinAllRoadsByMuid and cachdTilesCallbackImmediately cannot both be set", v4, 2u);
    }
  }
  else
  {
    self->_cachedTilesCallbackImmediately = a3;
  }
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)allowNetworkTileLoad
{
  return self->_allowNetworkTileLoad;
}

- (BOOL)flipNegativeTravelDirectionRoads
{
  return self->_flipNegativeTravelDirectionRoads;
}

- (void)setFlipNegativeTravelDirectionRoads:(BOOL)a3
{
  self->_flipNegativeTravelDirectionRoads = a3;
}

- (BOOL)visitDoubleTravelDirectionRoadsTwice
{
  return self->_visitDoubleTravelDirectionRoadsTwice;
}

- (void)setVisitDoubleTravelDirectionRoadsTwice:(BOOL)a3
{
  self->_visitDoubleTravelDirectionRoadsTwice = a3;
}

- (BOOL)allowStaleData
{
  return self->_allowStaleData;
}

- (void)setAllowStaleData:(BOOL)a3
{
  self->_allowStaleData = a3;
}

- (BOOL)preferStaleData
{
  return self->_preferStaleData;
}

- (void)setPreferStaleData:(BOOL)a3
{
  self->_preferStaleData = a3;
}

- (BOOL)allowOfflineData
{
  return self->_allowOfflineData;
}

- (void)setAllowOfflineData:(BOOL)a3
{
  self->_allowOfflineData = a3;
}

- (BOOL)joinAllRoadsByMuid
{
  return self->_joinAllRoadsByMuid;
}

- (BOOL)cachedTilesCallbackImmediately
{
  return self->_cachedTilesCallbackImmediately;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (double)syncTimeout
{
  return self->_syncTimeout;
}

- (void)setSyncTimeout:(double)a3
{
  if (a3 <= 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: syncTimeout > 0", buf, 2u);
    }
    uint64_t v3 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "syncTimeout must be greater than 0", v4, 2u);
    }
  }
  else
  {
    self->_syncTimeout = a3;
  }
}

- (id)synchronousFindRoadsNear:(id)a3 radius:(double)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__GEOMapFeatureAccess_Sync__synchronousFindRoadsNear_radius___block_invoke;
  v8[3] = &unk_1E53E9820;
  v8[4] = self;
  $F24F406B2B787EFB06265DBA3D28CBD5 v9 = a3;
  double v10 = a4;
  int v5 = (void *)MEMORY[0x18C120660](v8, a2);
  uint64_t v6 = [(GEOMapFeatureAccess *)self _synchronousFindWithHandler:v5];

  return v6;
}

uint64_t __61__GEOMapFeatureAccess_Sync__synchronousFindRoadsNear_radius___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadsNear:radius:handler:completionHandler:", a2, a3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)synchronousFindRoadWithID:(unint64_t)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__GEOMapFeatureAccess_Sync__synchronousFindRoadWithID___block_invoke;
  v8[3] = &unk_1E53E9848;
  v8[4] = self;
  void v8[5] = a3;
  id v4 = (void *)MEMORY[0x18C120660](v8, a2);
  int v5 = [(GEOMapFeatureAccess *)self _synchronousFindWithHandler:v4];
  uint64_t v6 = [v5 firstObject];

  return v6;
}

uint64_t __55__GEOMapFeatureAccess_Sync__synchronousFindRoadWithID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) findRoadWithID:*(void *)(a1 + 40) handler:a2 completionHandler:a3];
}

- (id)synchronousFindRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__GEOMapFeatureAccess_Sync__synchronousFindRoadWithMuid_nearCoordinate___block_invoke;
  v9[3] = &unk_1E53E9820;
  v9[4] = self;
  v9[5] = a3;
  $F24F406B2B787EFB06265DBA3D28CBD5 v10 = a4;
  int v5 = (void *)MEMORY[0x18C120660](v9, a2);
  uint64_t v6 = [(GEOMapFeatureAccess *)self _synchronousFindWithHandler:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

uint64_t __72__GEOMapFeatureAccess_Sync__synchronousFindRoadWithMuid_nearCoordinate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "findRoadWithMuid:nearCoordinate:handler:completionHandler:", *(void *)(a1 + 40), a2, a3, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)synchronousFindRoadsFromPreviousIntersectionOf:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __76__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromPreviousIntersectionOf___block_invoke;
  id v12 = &unk_1E53E9870;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x18C120660](&v9);
  uint64_t v7 = -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);

  return v7;
}

uint64_t __76__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromPreviousIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) findRoadsFromPreviousIntersectionOf:*(void *)(a1 + 40) handler:a2 completionHandler:a3];
}

- (id)synchronousFindRoadsToPreviousIntersectionOf:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __74__GEOMapFeatureAccess_Sync__synchronousFindRoadsToPreviousIntersectionOf___block_invoke;
  id v12 = &unk_1E53E9870;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x18C120660](&v9);
  uint64_t v7 = -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);

  return v7;
}

uint64_t __74__GEOMapFeatureAccess_Sync__synchronousFindRoadsToPreviousIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) findRoadsToPreviousIntersectionOf:*(void *)(a1 + 40) handler:a2 completionHandler:a3];
}

- (id)synchronousFindRoadsFromNextIntersectionOf:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __72__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromNextIntersectionOf___block_invoke;
  id v12 = &unk_1E53E9870;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x18C120660](&v9);
  uint64_t v7 = -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);

  return v7;
}

uint64_t __72__GEOMapFeatureAccess_Sync__synchronousFindRoadsFromNextIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) findRoadsFromNextIntersectionOf:*(void *)(a1 + 40) handler:a2 completionHandler:a3];
}

- (id)synchronousFindRoadsToNextIntersectionOf:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __70__GEOMapFeatureAccess_Sync__synchronousFindRoadsToNextIntersectionOf___block_invoke;
  id v12 = &unk_1E53E9870;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x18C120660](&v9);
  uint64_t v7 = -[GEOMapFeatureAccess _synchronousFindWithHandler:](self, "_synchronousFindWithHandler:", v6, v9, v10, v11, v12, v13);

  return v7;
}

uint64_t __70__GEOMapFeatureAccess_Sync__synchronousFindRoadsToNextIntersectionOf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) findRoadsToNextIntersectionOf:*(void *)(a1 + 40) handler:a2 completionHandler:a3];
}

- (id)_synchronousFindWithHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *, void *))a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_callbackQueue);
  id v5 = (void *)geo_isolater_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__70;
  v25[4] = __Block_byref_object_dispose__70;
  id v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke;
  v22[3] = &unk_1E53E9898;
  id v6 = v5;
  id v23 = v6;
  id v24 = v25;
  uint64_t v7 = (void *)MEMORY[0x18C120660](v22);
  BOOL cachedTilesCallbackImmediately = self->_cachedTilesCallbackImmediately;
  if (self->_cachedTilesCallbackImmediately)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_3;
    v20[3] = &unk_1E53D9070;
    uint64_t v9 = v11;
    id v21 = v9;
    uint64_t v10 = (void *)MEMORY[0x18C120660](v20);
  }
  id v12 = (id)v4[2](v4, v7, v10);
  if (!cachedTilesCallbackImmediately)
  {
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(self->_syncTimeout * 1000000000.0));
    if (dispatch_semaphore_wait(v9, v13))
    {
      id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = GEOGetGEOMapFeatureAccessLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v16 = [v14 count];
        if (v16 < 2)
        {
          $7E3FC3C8846FD6918BD0D88F3AA609C8 v17 = 0;
        }
        else
        {
          $7E3FC3C8846FD6918BD0D88F3AA609C8 v17 = [v14 objectAtIndexedSubscript:1];
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Synchronous call to GEOMapFeatureAccess timed out. Caller:\n    %@", (uint8_t *)&buf, 0xCu);
        if (v16 >= 2) {
      }
        }
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__70;
  v30 = __Block_byref_object_dispose__70;
  id v31 = 0;
  geo_isolate_sync();
  id v18 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v25, 8);

  return v18;
}

void __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  geo_isolate_sync();
}

uint64_t __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 32);

  return [v2 addObject:v6];
}

intptr_t __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__GEOMapFeatureAccess_Sync___synchronousFindWithHandler___block_invoke_153(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ ($7E3FC3C8846FD6918BD0D88F3AA609C8)tileSetInfoForStyle:(int)a3 scale:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  unsigned int v9 = 2;
  uint64_t v6 = +[GEOResourceManifestManager modernManager];
  uint64_t v7 = objc_msgSend(v6, "_fromgeod_maximumZoomLevelForStyle:scale:outSize:", v5, v4, &v9);

  return ($7E3FC3C8846FD6918BD0D88F3AA609C8)(v9 | (unint64_t)(v7 << 32));
}

@end