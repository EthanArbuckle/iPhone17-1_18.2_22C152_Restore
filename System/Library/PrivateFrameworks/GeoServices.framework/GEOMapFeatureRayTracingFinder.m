@interface GEOMapFeatureRayTracingFinder
- (id)_fail:(id)a3;
- (id)findRaytracingDataNear:(void *)a3 radius:(double)a4 handler:(double)a5 completionHandler:(double)a6;
@end

@implementation GEOMapFeatureRayTracingFinder

- (id)_fail:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__GEOMapFeatureRayTracingFinder__fail___block_invoke;
    block[3] = &unk_1E53DDD88;
    id v10 = v4;
    dispatch_async(v6, block);
  }
  v7 = objc_alloc_init(_InvalidRayTracingTileRequest);

  return v7;
}

void __39__GEOMapFeatureRayTracingFinder__fail___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)findRaytracingDataNear:(void *)a3 radius:(double)a4 handler:(double)a5 completionHandler:(double)a6
{
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    $7E3FC3C8846FD6918BD0D88F3AA609C8 v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:89 scale:0];
    if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
    {
      v18 = [a1 _fail:v12];
    }
    else
    {
      v14 = [GEOMapFeatureTileFinder alloc];
      v15 = [a1 requestParameters];
      v16 = [(GEOMapFeatureTileFinder *)v14 initWithZoomLevel:HIDWORD(*(unint64_t *)&v13) tileSize:v13 tileScale:0 tileSetStyle:89 requestParameters:v15];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __89__GEOMapFeatureRayTracingFinder_findRaytracingDataNear_radius_handler_completionHandler___block_invoke;
      v20[3] = &unk_1E53E4F28;
      id v21 = v11;
      v17 = (void *)MEMORY[0x18C120660](v20);
      v18 = -[GEOMapFeatureTileFinder findTileDataAround:radius:handler:completionHandler:](v16, "findTileDataAround:radius:handler:completionHandler:", v17, v12, a4, a5, a6);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __89__GEOMapFeatureRayTracingFinder_findRaytracingDataNear_radius_handler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v5 = [[GEOMapFeatureRayTracingTile alloc] initWithTileKey:a2 tileData:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end