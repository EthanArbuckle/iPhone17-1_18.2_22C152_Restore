@interface GEOMapBuildingFinder
- (GEOMapBuildingFinder)initWithMap:(id)a3 centerCoordinate:(id)a4 radius:(double)a5;
- (void)cancel;
- (void)findBuildingsWithHandler:(id)a3;
@end

@implementation GEOMapBuildingFinder

- (GEOMapBuildingFinder)initWithMap:(id)a3 centerCoordinate:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapBuildingFinder;
  v10 = [(GEOMapRequest *)&v15 initWithManager:v9];
  if (v10)
  {
    uint64_t v11 = +[GEOMapTileFinder buildingsTileFinderForMap:center:radius:](GEOMapTileFinder, "buildingsTileFinderForMap:center:radius:", v9, var0, var1, a5);
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v11;

    v10->_centerCoordinate.latitude = var0;
    v10->_centerCoordinate.longitude = var1;
    v10->_radius = a5;
    v13 = v10;
  }

  return v10;
}

- (void)cancel
{
  tileFinder = self->_tileFinder;
  if (tileFinder && ![(GEOMapRequest *)tileFinder isFinished]) {
    [(GEOMapTileFinder *)self->_tileFinder cancel];
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapBuildingFinder;
  [(GEOMapRequest *)&v4 cancel];
}

- (void)findBuildingsWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke;
  v9[3] = &unk_1E53DF988;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  [(GEOMapRequest *)self->_tileFinder setCompletionHandler:v9];
  tileFinder = self->_tileFinder;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke_2;
  v7[3] = &unk_1E53DF9B0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(GEOMapTileFinder *)tileFinder findTiles:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained complete];
}

void __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 totalBuildingFootprintsCount])
  {
    unint64_t v4 = 0;
    id v19 = v3;
    do
    {
      v5 = GEOBuildingFootprintFeatureAtIndex(v3, v4);
      id v6 = [[GEOMapAccessBuilding alloc] initWithBuildingFeature:v5];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v7 = [(GEOMapAccessBuilding *)v6 sections];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v20 = v5;
        uint64_t v10 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v13 = (double *)(*(void *)(a1 + 32) + 48);
            objc_msgSend(v12, "centerCoordinate", v19);
            double v16 = GEOCalculateDistanceRadius(*v13, v13[1], v14, v15, 6367000.0);
            double v17 = *(double *)(*(void *)(a1 + 32) + 64);
            [v12 radius];
            if (v16 < v17 + v18)
            {

              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              goto LABEL_13;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            continue;
          }
          break;
        }

LABEL_13:
        id v3 = v19;
        v5 = v20;
      }
      else
      {
      }
      ++v4;
    }
    while (v4 < [v3 totalBuildingFootprintsCount]);
  }
}

- (void).cxx_destruct
{
}

@end