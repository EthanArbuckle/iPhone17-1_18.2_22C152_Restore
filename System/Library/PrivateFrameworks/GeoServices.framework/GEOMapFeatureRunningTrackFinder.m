@interface GEOMapFeatureRunningTrackFinder
- (id)_fail:(id)a3;
- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
@end

@implementation GEOMapFeatureRunningTrackFinder

- (id)_fail:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__GEOMapFeatureRunningTrackFinder__fail___block_invoke;
    block[3] = &unk_1E53DDD88;
    id v10 = v4;
    dispatch_async(v6, block);
  }
  v7 = objc_alloc_init(_InvalidRequest);

  return v7;
}

void __41__GEOMapFeatureRunningTrackFinder__fail___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:62 scale:0];
  if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
  {
    v18 = [(GEOMapFeatureRunningTrackFinder *)self _fail:v12];
  }
  else
  {
    v14 = [GEOMapFeatureTileFinder alloc];
    v15 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v16 = [(GEOMapFeatureTileFinder *)v14 initWithZoomLevel:HIDWORD(*(unint64_t *)&v13) tileSize:v13 tileScale:0 tileSetStyle:62 requestParameters:v15];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__GEOMapFeatureRunningTrackFinder_findRunningTrackFlagsNear_radius_handler_completionHandler___block_invoke;
    v20[3] = &unk_1E53E80F8;
    id v21 = v11;
    v17 = (void *)MEMORY[0x18C120660](v20);
    v18 = -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v17, v12, var0, var1, a4);
  }

  return v18;
}

void __94__GEOMapFeatureRunningTrackFinder_findRunningTrackFlagsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v10[0] = [v3 geoTileKey];
  v10[1] = v4;
  double v5 = GEOMapRectForGEOTileKey((uint64_t)v10);
  v9 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v5, v6, v7, v8);
  (*(void (**)(void, GEOMapRegion *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, [v3 runningTrackFlags]);
}

- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:62 scale:0];
  if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
  {
    v18 = [(GEOMapFeatureRunningTrackFinder *)self _fail:v12];
  }
  else
  {
    v14 = [GEOMapFeatureTileFinder alloc];
    v15 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v16 = [(GEOMapFeatureTileFinder *)v14 initWithZoomLevel:HIDWORD(*(unint64_t *)&v13) tileSize:v13 tileScale:0 tileSetStyle:62 requestParameters:v15];

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke;
    v23 = &unk_1E53E8148;
    double v25 = var0;
    double v26 = var1;
    double v27 = a4;
    id v24 = v11;
    v17 = (void *)MEMORY[0x18C120660](&v20);
    v18 = -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v17, v12, var0, var1, a4, v20, v21, v22, v23);
  }

  return v18;
}

void __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke_2;
  v3[3] = &unk_1E53E8120;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  [a2 forEachRunningTrack:v3];
}

void __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke_2(uint64_t a1, double *a2)
{
  id v4 = (void *)MEMORY[0x18C1203C0]();
  long long v5 = objc_alloc_init(GEOMapRegion);
  [(GEOMapRegion *)v5 setNorthLat:a2[5]];
  [(GEOMapRegion *)v5 setWestLng:a2[2]];
  [(GEOMapRegion *)v5 setSouthLat:a2[3]];
  [(GEOMapRegion *)v5 setEastLng:a2[4]];
  if (-[GEOMapRegion containsCoordinate:radius:](v5, "containsCoordinate:radius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56)))
  {
    uint64_t v6 = [[GEOMapFeatureRunningTrack alloc] initWithVMP4Track:a2 boundingBox:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end