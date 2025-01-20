@interface _GEOTransitRoutePreloaderData
- (GEOTileKeyList)tilesLoadingOrLoaded;
- (GEOTileKeyList)tilesMissed;
- (GEOTileKeyList)tilesReceived;
- (NSMutableArray)preloadBatches;
- (NSMutableSet)placecardsMissed;
- (NSMutableSet)placecardsReceived;
- (_GEOTransitPreloadCamera)camera;
- (_GEOTransitRoutePreloaderData)init;
- (unint64_t)currentBatchGeneration;
- (void)setCamera:(id)a3;
- (void)setCurrentBatchGeneration:(unint64_t)a3;
- (void)setPlacecardsMissed:(id)a3;
- (void)setPlacecardsReceived:(id)a3;
- (void)setPreloadBatches:(id)a3;
- (void)setTilesLoadingOrLoaded:(id)a3;
- (void)setTilesMissed:(id)a3;
- (void)setTilesReceived:(id)a3;
@end

@implementation _GEOTransitRoutePreloaderData

- (_GEOTransitRoutePreloaderData)init
{
  v18.receiver = self;
  v18.super_class = (Class)_GEOTransitRoutePreloaderData;
  v2 = [(_GEOTransitRoutePreloaderData *)&v18 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = _TransitRoutePreloaderBatchGeneration++;
    v2->_currentBatchGeneration = v4;
    v5 = objc_alloc_init(GEOTileKeyList);
    tilesLoadingOrLoaded = v3->_tilesLoadingOrLoaded;
    v3->_tilesLoadingOrLoaded = v5;

    v7 = objc_alloc_init(GEOTileKeyList);
    tilesReceived = v3->_tilesReceived;
    v3->_tilesReceived = v7;

    v9 = objc_alloc_init(GEOTileKeyList);
    tilesMissed = v3->_tilesMissed;
    v3->_tilesMissed = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    placecardsReceived = v3->_placecardsReceived;
    v3->_placecardsReceived = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    placecardsMissed = v3->_placecardsMissed;
    v3->_placecardsMissed = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    preloadBatches = v3->_preloadBatches;
    v3->_preloadBatches = (NSMutableArray *)v15;
  }
  return v3;
}

- (GEOTileKeyList)tilesLoadingOrLoaded
{
  return self->_tilesLoadingOrLoaded;
}

- (void)setTilesLoadingOrLoaded:(id)a3
{
}

- (GEOTileKeyList)tilesReceived
{
  return self->_tilesReceived;
}

- (void)setTilesReceived:(id)a3
{
}

- (GEOTileKeyList)tilesMissed
{
  return self->_tilesMissed;
}

- (void)setTilesMissed:(id)a3
{
}

- (NSMutableSet)placecardsReceived
{
  return self->_placecardsReceived;
}

- (void)setPlacecardsReceived:(id)a3
{
}

- (NSMutableSet)placecardsMissed
{
  return self->_placecardsMissed;
}

- (void)setPlacecardsMissed:(id)a3
{
}

- (NSMutableArray)preloadBatches
{
  return self->_preloadBatches;
}

- (void)setPreloadBatches:(id)a3
{
}

- (unint64_t)currentBatchGeneration
{
  return self->_currentBatchGeneration;
}

- (void)setCurrentBatchGeneration:(unint64_t)a3
{
  self->_currentBatchGeneration = a3;
}

- (_GEOTransitPreloadCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_preloadBatches, 0);
  objc_storeStrong((id *)&self->_placecardsMissed, 0);
  objc_storeStrong((id *)&self->_placecardsReceived, 0);
  objc_storeStrong((id *)&self->_tilesMissed, 0);
  objc_storeStrong((id *)&self->_tilesReceived, 0);

  objc_storeStrong((id *)&self->_tilesLoadingOrLoaded, 0);
}

@end