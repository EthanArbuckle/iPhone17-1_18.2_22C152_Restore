@interface GEOMapAccess
+ (BOOL)supportsBuildingMapAccess;
+ (BOOL)supportsRealisticMap;
+ (BOOL)supportsRoadMapAccess;
+ (BOOL)supportsTransitMap;
+ (BOOL)supportsTransitMapAccess;
+ (id)map;
+ (id)realisticMap;
+ (id)transitMap;
- (BOOL)_hasLoadedTilesNearCoordinate:(id)a3 radius:(double)a4 zoomLevel:(unint64_t)a5 tileStyle:(int)a6 tileSize:(int)a7 tileScale:(int)a8;
- (BOOL)allowsNetworkTileLoad;
- (BOOL)hasLoadedBuildingTilesNearCoordinate:(id)a3 radius:(double)a4;
- (BOOL)hasLoadedRoadTilesNearCoordinate:(id)a3 radius:(double)a4;
- (BOOL)hasLoadedTransitTilesNearCoordinate:(id)a3 radius:(double)a4;
- (BOOL)useMapMatchingTilesetForRoads;
- (GEOMapAccess)init;
- (GEOMapAccessRestrictions)restrictions;
- (id)_findTransitPointWithID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7;
- (id)_findTransitPointsWithin:(double)a3 of:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7;
- (id)_transitPointForTransitMapNode:(shared_ptr<geo::MapNodeTransit>)a3;
- (id)buildMapEdgeTransitFrom:(const TransitEdgePiece *)a3 edgeHandler:(id)a4;
- (id)callbackQueue;
- (id)findBuildingsWithin:(double)a3 of:(id)a4 buildingHandler:(id)a5 completionHandler:(id)a6;
- (id)findClosestNamedFeaturesAtCoordinate:(id)a3 roadHandler:(id)a4 pointHandler:(id)a5 polygonHandler:(id)a6 completionHandler:(id)a7;
- (id)findClosestRoadAtCoordinate:(id)a3 roadHandler:(id)a4 completionHandler:(id)a5;
- (id)findRoadEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6;
- (id)findRoadTilesWithin:(double)a3 of:(id)a4 tileHander:(id)a5 completionHandler:(id)a6;
- (id)findRoadsWithin:(double)a3 of:(id)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitHallWithID:(unint64_t)a3 near:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitHallsWithin:(double)a3 of:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitLinksWithin:(double)a3 of:(id)a4 linkHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitNodeWithID:(unint64_t)a3 near:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitNodesWithin:(double)a3 of:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitPointWithParentID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7;
- (id)findTransitPointsWithin:(double)a3 of:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStationWithID:(unint64_t)a3 near:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStationsWithin:(double)a3 of:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStopWithID:(unint64_t)a3 near:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6;
- (id)findTransitStopsWithin:(double)a3 of:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6;
- (id)tileErrorHandler;
- (unint64_t)buildingsZoomLevel;
- (unint64_t)roadsZoomLevel;
- (unint64_t)transitZoomLevel;
- (unsigned)maxTransitZoomLevel;
- (unsigned)maxZoomLevel;
- (unsigned)minZoomLevel;
- (unsigned)zoomLevel;
- (void)preloadBuildingTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)preloadRoadTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)preloadTransitTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5;
- (void)setCallbackQueue:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setTileErrorHandler:(id)a3;
- (void)setUseMapMatchingTilesetForRoads:(BOOL)a3;
@end

@implementation GEOMapAccess

- (GEOMapAccess)init
{
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccess;
  v2 = [(GEOMapRequestManager *)&v4 init];
  if (v2)
  {
    if (-[GEOMapAccess init]::onceToken != -1) {
      dispatch_once(&-[GEOMapAccess init]::onceToken, &__block_literal_global_215);
    }
    v2->_useMapMatchingTilesetForRoads = 1;
    [(GEOMapAccess *)v2 setCallbackQueue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

void __20__GEOMapAccess_init__block_invoke()
{
  v1 = objc_alloc_init(GEOVectorTileDecoder);
  v0 = +[GEOTileLoader modernLoader];
  [v0 registerTileDecoder:v1];
}

+ (BOOL)supportsRealisticMap
{
  return +[GEOMapAccess supportsRoadMapAccess];
}

+ (BOOL)supportsTransitMap
{
  return +[GEOMapAccess supportsTransitMapAccess];
}

+ (id)realisticMap
{
  if (+[GEOMapAccess supportsRoadMapAccess]) {
    v2 = objc_alloc_init(GEOMapAccess);
  }
  else {
    v2 = 0;
  }

  return v2;
}

+ (id)transitMap
{
  if (+[GEOMapAccess supportsTransitMapAccess]) {
    v2 = objc_alloc_init(GEOMapAccess);
  }
  else {
    v2 = 0;
  }

  return v2;
}

+ (id)map
{
  v2 = objc_alloc_init(GEOMapAccess);

  return v2;
}

+ (BOOL)supportsRoadMapAccess
{
  v2 = +[GEOResourceManifestManager modernManager];
  char v3 = [v2 supportsTileStyle:53 size:2 scale:0];

  return v3;
}

+ (BOOL)supportsTransitMapAccess
{
  v2 = +[GEOResourceManifestManager modernManager];
  if ([v2 supportsTileStyle:37 size:2 scale:0]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 supportsTileStyle:37 size:0 scale:0];
  }

  return v3;
}

+ (BOOL)supportsBuildingMapAccess
{
  v2 = +[GEOResourceManifestManager modernManager];
  char v3 = [v2 supportsTileStyle:11 size:2 scale:0];

  return v3;
}

- (id)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  v5 = (OS_dispatch_queue *)a3;
  if (self->_callbackQueue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_callbackQueue, a3);
    v5 = v6;
  }
}

- (unsigned)zoomLevel
{
  return [(GEOMapAccess *)self roadsZoomLevel];
}

- (unsigned)minZoomLevel
{
  return 1;
}

- (unsigned)maxZoomLevel
{
  return [(GEOMapAccess *)self roadsZoomLevel];
}

- (unsigned)maxTransitZoomLevel
{
  return [(GEOMapAccess *)self transitZoomLevel];
}

- (BOOL)allowsNetworkTileLoad
{
  v2 = [(GEOMapAccess *)self restrictions];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 allowsNetworkTileLoad];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)findClosestNamedFeaturesAtCoordinate:(id)a3 roadHandler:(id)a4 pointHandler:(id)a5 polygonHandler:(id)a6 completionHandler:(id)a7
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = -[GEOMapFeatureFinder initWithMap:center:]([GEOMapFeatureFinder alloc], "initWithMap:center:", self, var0, var1);
  [(GEOMapFeatureFinder *)v17 setIgnoreUnnamedFeatures:1];
  [(GEOMapFeatureFinder *)v17 findFeatures:v13 pointHandler:v14 polygonHandler:v15 completionHandler:v16];
  if ([(GEOMapRequest *)v17 isFinished]) {
    v18 = 0;
  }
  else {
    v18 = v17;
  }
  v19 = v18;

  return v19;
}

- (id)findClosestRoadAtCoordinate:(id)a3 roadHandler:(id)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a4;
  id v10 = a5;
  v11 = -[GEOMapFeatureFinder initWithMap:center:]([GEOMapFeatureFinder alloc], "initWithMap:center:", self, var0, var1);
  [(GEOMapFeatureFinder *)v11 findFeatures:v9 pointHandler:0 polygonHandler:0 completionHandler:v10];
  if ([(GEOMapRequest *)v11 isFinished]) {
    v12 = 0;
  }
  else {
    v12 = v11;
  }
  id v13 = v12;

  return v13;
}

- (id)findRoadEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  id v13 = -[GEOMapEdgeRoadFinder initWithMap:center:radius:]([GEOMapEdgeRoadFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  [(GEOMapRequest *)v13 setCompletionHandler:v12];
  [(GEOMapEdgeFinder *)v13 findEdges:v11];
  if ([(GEOMapRequest *)v13 isFinished]) {
    id v14 = 0;
  }
  else {
    id v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)findRoadsWithin:(double)a3 of:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__GEOMapAccess_findRoadsWithin_of_handler_completionHandler___block_invoke;
  v15[3] = &unk_1E53DAC28;
  v15[4] = self;
  id v16 = v11;
  id v12 = v11;
  id v13 = -[GEOMapAccess findRoadEdgesWithin:of:edgeHandler:completionHandler:](self, "findRoadEdgesWithin:of:edgeHandler:completionHandler:", v15, a6, a3, var0, var1);

  return v13;
}

void __61__GEOMapAccess_findRoadsWithin_of_handler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  char v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findTransitEdgesWithin:(double)a3 of:(id)a4 edgeHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  id v13 = -[GEOMapEdgeTransitFinder initWithMap:center:radius:]([GEOMapEdgeTransitFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  [(GEOMapRequest *)v13 setCompletionHandler:v12];
  [(GEOMapEdgeFinder *)v13 findEdges:v11];
  if ([(GEOMapRequest *)v13 isFinished]) {
    id v14 = 0;
  }
  else {
    id v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)findTransitLinksWithin:(double)a3 of:(id)a4 linkHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__GEOMapAccess_findTransitLinksWithin_of_linkHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E53DAC28;
  v15[4] = self;
  id v16 = v11;
  id v12 = v11;
  id v13 = -[GEOMapAccess findTransitEdgesWithin:of:edgeHandler:completionHandler:](self, "findTransitEdgesWithin:of:edgeHandler:completionHandler:", v15, a6, a3, var0, var1);

  return v13;
}

void __72__GEOMapAccess_findTransitLinksWithin_of_linkHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  char v4 = [GEOMapAccessTransitLink alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7 = [(GEOMapAccessTransitLink *)v4 initWithMap:v5 transitEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findTransitPointsWithin:(double)a3 of:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 15, v11, v12, a3, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)findTransitNodesWithin:(double)a3 of:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = -[GEOMapTransitPointFinder initWithMap:center:radius:]([GEOMapTransitPointFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
    [(GEOMapRequest *)v13 setCompletionHandler:v12];
    [(GEOMapTransitPointFinder *)v13 findTransitPointsOfType:14 nodeHandler:v11 accessPointHandler:0];
    if ([(GEOMapRequest *)v13 isFinished]) {
      id v14 = 0;
    }
    else {
      id v14 = v13;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)findTransitStationsWithin:(double)a3 of:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__GEOMapAccess_findTransitStationsWithin_of_stationHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 4, v15, v12, a3, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __78__GEOMapAccess_findTransitStationsWithin_of_stationHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitStopsWithin:(double)a3 of:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__GEOMapAccess_findTransitStopsWithin_of_stopHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 2, v15, v12, a3, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __72__GEOMapAccess_findTransitStopsWithin_of_stopHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitHallsWithin:(double)a3 of:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__GEOMapAccess_findTransitHallsWithin_of_hallHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointsWithin:of:type:pointHandler:completionHandler:](self, "_findTransitPointsWithin:of:type:pointHandler:completionHandler:", 8, v15, v12, a3, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __72__GEOMapAccess_findTransitHallsWithin_of_hallHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 pointHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 15, v11, v12, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)findTransitNodeWithID:(unint64_t)a3 near:(id)a4 nodeHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = -[GEOMapTransitPointFinder initWithMap:approxLocation:pointID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:pointID:", self, a3, var0, var1);
    [(GEOMapRequest *)v13 setCompletionHandler:v12];
    [(GEOMapTransitPointFinder *)v13 findTransitPointsOfType:14 nodeHandler:v11 accessPointHandler:0];
    if ([(GEOMapRequest *)v13 isFinished]) {
      id v14 = 0;
    }
    else {
      id v14 = v13;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)findTransitStationWithID:(unint64_t)a3 near:(id)a4 stationHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__GEOMapAccess_findTransitStationWithID_near_stationHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 4, v15, v12, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __79__GEOMapAccess_findTransitStationWithID_near_stationHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitStopWithID:(unint64_t)a3 near:(id)a4 stopHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__GEOMapAccess_findTransitStopWithID_near_stopHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 2, v15, v12, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __73__GEOMapAccess_findTransitStopWithID_near_stopHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitHallWithID:(unint64_t)a3 near:(id)a4 hallHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__GEOMapAccess_findTransitHallWithID_near_hallHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E53DABB0;
    id v16 = v11;
    id v13 = -[GEOMapAccess _findTransitPointWithID:near:type:pointHandler:completionHandler:](self, "_findTransitPointWithID:near:type:pointHandler:completionHandler:", a3, 8, v15, v12, var0, var1);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __73__GEOMapAccess_findTransitHallWithID_near_hallHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findTransitPointWithParentID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  id v14 = a7;
  if (v13)
  {
    id v15 = -[GEOMapTransitPointFinder initWithMap:approxLocation:parentID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:parentID:", self, a3, var0, var1);
    [(GEOMapRequest *)v15 setCompletionHandler:v14];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke;
    v25[3] = &unk_1E53F6F20;
    v25[4] = self;
    id v26 = v13;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke_2;
    v22 = &unk_1E53F6F48;
    v23 = self;
    id v24 = v26;
    [(GEOMapTransitPointFinder *)v15 findTransitPointsOfType:a5 nodeHandler:v25 accessPointHandler:&v19];
    if ([(GEOMapRequest *)v15 isFinished]) {
      id v16 = 0;
    }
    else {
      id v16 = v15;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v7 = *a2;
  uint64_t v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v6 = [v2 _transitPointForTransitMapNode:&v7];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void __86__GEOMapAccess_findTransitPointWithParentID_near_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = [GEOMapAccessTransitAccessPoint alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = [(GEOMapAccessTransitAccessPoint *)v4 initWithMap:v5 accessPoint:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findBuildingsWithin:(double)a3 of:(id)a4 buildingHandler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    id v13 = -[GEOMapBuildingFinder initWithMap:centerCoordinate:radius:]([GEOMapBuildingFinder alloc], "initWithMap:centerCoordinate:radius:", self, var0, var1, a3);
    [(GEOMapRequest *)v13 setCompletionHandler:v12];
    [(GEOMapBuildingFinder *)v13 findBuildingsWithHandler:v11];
    if ([(GEOMapRequest *)v13 isFinished]) {
      id v14 = 0;
    }
    else {
      id v14 = v13;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)preloadRoadTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a5;
  id v9 = +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", self, var0, var1, a4);
  [v9 setCompletionHandler:v10];
  [v9 findTiles:0];
}

- (void)preloadTransitTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a5;
  id v9 = +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", self, var0, var1, a4);
  [v9 setCompletionHandler:v10];
  [v9 findTiles:0];
}

- (void)preloadBuildingTilesNearCoordinate:(id)a3 radius:(double)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a5;
  id v9 = +[GEOMapTileFinder buildingsTileFinderForMap:center:radius:](GEOMapTileFinder, "buildingsTileFinderForMap:center:radius:", self, var0, var1, a4);
  [v9 setCompletionHandler:v10];
  [v9 findTiles:0];
}

- (BOOL)_hasLoadedTilesNearCoordinate:(id)a3 radius:(double)a4 zoomLevel:(unint64_t)a5 tileStyle:(int)a6 tileSize:(int)a7 tileScale:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  char v9 = a7;
  char v11 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v15 = +[GEOTileLoader modernLoader];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__GEOMapAccess__hasLoadedTilesNearCoordinate_radius_zoomLevel_tileStyle_tileSize_tileScale___block_invoke;
  v20[3] = &unk_1E53F6F70;
  v22 = &v28;
  id v16 = v15;
  id v21 = v16;
  v23 = &v24;
  v17 = (void *)MEMORY[0x18C120660](v20);
  GEOTileKeysForCoordinate(v11, a6, v9, v8, v17, var0, var1, a4);
  if (v29[3]) {
    BOOL v18 = *((unsigned char *)v25 + 24) != 0;
  }
  else {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __92__GEOMapAccess__hasLoadedTilesNearCoordinate_radius_zoomLevel_tileStyle_tileSize_tileScale___block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = [*(id *)(a1 + 32) cachedTileForKey:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v3) {
    BOOL v5 = *(unsigned char *)(v4 + 24) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 24) = v6;
}

- (BOOL)hasLoadedRoadTilesNearCoordinate:(id)a3 radius:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(GEOMapAccess *)self useMapMatchingTilesetForRoads]) {
    uint64_t v8 = 53;
  }
  else {
    uint64_t v8 = 18;
  }
  unint64_t v9 = [(GEOMapAccess *)self roadsZoomLevel];

  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", v9, v8, 2, 0, var0, var1, a4);
}

- (BOOL)hasLoadedTransitTilesNearCoordinate:(id)a3 radius:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v8 = [(GEOMapAccess *)self transitZoomLevel];

  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", v8, 37, 2, 0, var0, var1, a4);
}

- (BOOL)hasLoadedBuildingTilesNearCoordinate:(id)a3 radius:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v8 = [(GEOMapAccess *)self buildingsZoomLevel];

  return -[GEOMapAccess _hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:](self, "_hasLoadedTilesNearCoordinate:radius:zoomLevel:tileStyle:tileSize:tileScale:", v8, 11, 2, 0, var0, var1, a4);
}

- (id)findRoadTilesWithin:(double)a3 of:(id)a4 tileHander:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", self, var0, var1, a3);
  [v13 setCompletionHandler:v12];
  [v13 findTiles:v11];
  if ([v13 isFinished]) {
    id v14 = 0;
  }
  else {
    id v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)buildMapEdgeTransitFrom:(const TransitEdgePiece *)a3 edgeHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [[GEOMapEdgeTransitBuilder alloc] initWithMap:self firstPiece:a3];
  [(GEOMapEdgeBuilder *)v7 buildEdge:v6];
  if ([(GEOMapRequest *)v7 isFinished]) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }
  unint64_t v9 = v8;

  return v9;
}

- (id)_findTransitPointsWithin:(double)a3 of:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  id v14 = a7;
  id v15 = -[GEOMapTransitPointFinder initWithMap:center:radius:]([GEOMapTransitPointFinder alloc], "initWithMap:center:radius:", self, var0, var1, a3);
  [(GEOMapRequest *)v15 setCompletionHandler:v14];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke;
  v26[3] = &unk_1E53F6F20;
  v26[4] = self;
  id v27 = v13;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke_2;
  v23 = &unk_1E53F6F48;
  uint64_t v24 = self;
  id v16 = v27;
  id v25 = v16;
  [(GEOMapTransitPointFinder *)v15 findTransitPointsOfType:a5 nodeHandler:v26 accessPointHandler:&v20];
  if ([(GEOMapRequest *)v15 isFinished]) {
    v17 = 0;
  }
  else {
    v17 = v15;
  }
  BOOL v18 = v17;

  return v18;
}

void __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  BOOL v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v7 = *a2;
  unint64_t v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v6 = [v2 _transitPointForTransitMapNode:&v7];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void __80__GEOMapAccess__findTransitPointsWithin_of_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = [GEOMapAccessTransitAccessPoint alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  unint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = [(GEOMapAccessTransitAccessPoint *)v4 initWithMap:v5 accessPoint:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)_findTransitPointWithID:(unint64_t)a3 near:(id)a4 type:(unint64_t)a5 pointHandler:(id)a6 completionHandler:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  id v14 = a7;
  if (v13)
  {
    id v15 = -[GEOMapTransitPointFinder initWithMap:approxLocation:pointID:]([GEOMapTransitPointFinder alloc], "initWithMap:approxLocation:pointID:", self, a3, var0, var1);
    [(GEOMapRequest *)v15 setCompletionHandler:v14];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke;
    v25[3] = &unk_1E53F6F20;
    v25[4] = self;
    id v26 = v13;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke_2;
    v22 = &unk_1E53F6F48;
    v23 = self;
    id v24 = v26;
    [(GEOMapTransitPointFinder *)v15 findTransitPointsOfType:a5 nodeHandler:v25 accessPointHandler:&v19];
    if ([(GEOMapRequest *)v15 isFinished]) {
      id v16 = 0;
    }
    else {
      id v16 = v15;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v7 = *a2;
  uint64_t v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v6 = [v2 _transitPointForTransitMapNode:&v7];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void __81__GEOMapAccess__findTransitPointWithID_near_type_pointHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = [GEOMapAccessTransitAccessPoint alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  unint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = [(GEOMapAccessTransitAccessPoint *)v4 initWithMap:v5 accessPoint:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)_transitPointForTransitMapNode:(shared_ptr<geo::MapNodeTransit>)a3
{
  if (!*(void *)a3.__ptr_) {
    goto LABEL_9;
  }
  uint64_t v3 = *(void *)(*(void *)a3.__ptr_ + 40);
  if (!v3) {
    goto LABEL_9;
  }
  ptr = a3.__ptr_;
  int v6 = *(char *)(v3 + 272);
  if (v6 != 1)
  {
    if (!v6)
    {
      uint64_t v7 = [GEOMapAccessTransitStop alloc];
      uint64_t v8 = (std::__shared_weak_count *)*((void *)ptr + 1);
      uint64_t v16 = *(void *)ptr;
      v17 = v8;
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v9 = [(GEOMapAccessTransitNodeBase *)v7 initWithMap:self node:&v16];
      id v10 = v17;
      if (!v17) {
        goto LABEL_10;
      }
LABEL_16:
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v9 = 0;
    goto LABEL_10;
  }
  id v12 = [GEOMapAccessTransitStation alloc];
  id v13 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v14 = *(void *)ptr;
  id v15 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v9 = [(GEOMapAccessTransitNodeBase *)v12 initWithMap:self node:&v14];
  id v10 = v15;
  if (v15) {
    goto LABEL_16;
  }
LABEL_10:

  return v9;
}

- (unint64_t)roadsZoomLevel
{
  v2 = +[GEOResourceManifestManager modernManager];
  unint64_t v3 = [v2 mapMatchingZoomLevel];

  return v3;
}

- (unint64_t)transitZoomLevel
{
  v2 = +[GEOResourceManifestManager modernManager];
  unint64_t v3 = [v2 activeTileGroup];

  uint64_t v4 = [v3 activeTileSetForTileType:37 scale:0];
  unint64_t v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (unint64_t)buildingsZoomLevel
{
  v2 = +[GEOResourceManifestManager modernManager];
  unint64_t v3 = [v2 activeTileGroup];

  uint64_t v4 = [v3 activeTileSetForTileType:11 scale:0];
  unint64_t v5 = objc_msgSend(v4, "maximumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);

  return v5;
}

- (GEOMapAccessRestrictions)restrictions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restrictions);

  return (GEOMapAccessRestrictions *)WeakRetained;
}

- (void)setRestrictions:(id)a3
{
}

- (id)tileErrorHandler
{
  return self->_tileErrorHandler;
}

- (void)setTileErrorHandler:(id)a3
{
}

- (BOOL)useMapMatchingTilesetForRoads
{
  return self->_useMapMatchingTilesetForRoads;
}

- (void)setUseMapMatchingTilesetForRoads:(BOOL)a3
{
  self->_useMapMatchingTilesetForRoads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tileErrorHandler, 0);
  objc_destroyWeak((id *)&self->_restrictions);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end