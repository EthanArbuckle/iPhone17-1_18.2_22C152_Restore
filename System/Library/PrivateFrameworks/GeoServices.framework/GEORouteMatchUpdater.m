@interface GEORouteMatchUpdater
@end

@implementation GEORouteMatchUpdater

void __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke_2;
  v8[3] = &unk_1E53DEE48;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v6 = v3;
  id v7 = (id)[v4 findTransitGeometryForPoint:v6 completionHandler:v8];
}

void __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke_2(uint64_t a1)
{
}

void __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 station];
  if (v3)
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke_2;
    v8[3] = &unk_1E53EA508;
    long long v7 = *(_OWORD *)(a1 + 40);
    id v5 = (id)v7;
    long long v9 = v7;
    id v6 = (id)[v4 findTransitAccessPointsForStation:v3 handler:v8 completionHandler:0];
  }
}

void __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v15 = v3;
    int v5 = [v3 isEntrance];
    v4 = v15;
    if (v5)
    {
      [v15 radiusMeters];
      double v7 = v6 == 0.0 ? 20.0 : v6;
      [*(id *)(a1 + 32) coordinate];
      double v9 = v8;
      double v11 = v10;
      [v15 coordinate];
      long double v14 = GEOCalculateDistanceRadius(v9, v11, v12, v13, 6367000.0);
      v4 = v15;
      if (v14 < v7) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
}

@end