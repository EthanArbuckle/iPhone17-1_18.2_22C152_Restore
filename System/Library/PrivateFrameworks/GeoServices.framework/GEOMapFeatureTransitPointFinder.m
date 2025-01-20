@interface GEOMapFeatureTransitPointFinder
- (id)_geometryTileFinder;
- (id)_tileFinder;
- (id)_transitPointForFeature:(void *)a3;
- (id)findGeometryForTransitPoint:(id)a3 completionHandler:(id)a4;
- (id)findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTransitPointsOfType:(unint64_t)a3 near:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7;
- (id)findTransitPointsWithParent:(id)a3 handler:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOMapFeatureTransitPointFinder

- (id)findTransitPointsOfType:(unint64_t)a3 near:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a6;
  id v14 = a7;
  double v15 = GEOTilePointForCoordinate(var0, var1, 20.0);
  uint64_t v17 = v16;
  long double v18 = GEOMapPointsPerMeterAtLatitude(var0);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __97__GEOMapFeatureTransitPointFinder_findTransitPointsOfType_near_radius_handler_completionHandler___block_invoke;
  v27 = &unk_1E53F5E58;
  v28 = self;
  double v30 = v15;
  uint64_t v31 = v17;
  double v32 = v18 * a5;
  unint64_t v33 = a3;
  id v19 = v13;
  id v29 = v19;
  v20 = (void *)MEMORY[0x18C120660](&v24);
  v21 = [(GEOMapFeatureTransitPointFinder *)self _tileFinder];
  v22 = objc_msgSend(v21, "findTilesAround:radius:handler:completionHandler:", v20, v14, var0, var1, a5);

  return v22;
}

void __97__GEOMapFeatureTransitPointFinder_findTransitPointsOfType_near_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  id v24 = v3;
  uint64_t v8 = [v3 tileKey];
  uint64_t v9 = *(unsigned __int8 *)(v8 + 10);
  uint64_t v10 = *(unsigned __int16 *)(v8 + 8);
  int8x8_t v11 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v10 & 0xFFFFFFFFFF00FFFFLL | (v9 << 16)) >> 2), (int32x2_t)(v9 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  *(void *)((char *)&v25 + 1) = (*(void *)v8 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v8 >> 8) & 0x3F) << 40);
  LOBYTE(v25) = *(void *)v8;
  *((void *)&v12 + 1) = BYTE4(*(void *)v8) | ((((*(void *)v8 >> 40) | (v10 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v11.u32[0] << 34) | ((unint64_t)v11.u32[1] << 48) | (v9 << 48) & 0xF0000000000000;
  *(void *)&long long v12 = *(void *)v8 << 32;
  objc_msgSend(v4, "_boundingCircleWithCenter:radius:inTile:", (void)v25, (unint64_t)(v12 >> 56), v5, v6, v7);
  if ((*(unsigned char *)(a1 + 72) & 0xE) != 0)
  {
    float v16 = v13;
    float v17 = v14;
    unint64_t v18 = 0;
    float v19 = v15 * v15;
    for (uint64_t i = 272; v18 < [v24 transitNodeCount]; i += 344)
    {
      uint64_t v21 = [v24 transitNodes];
      if (v21)
      {
        int v22 = *(unsigned __int8 *)(v21 + i);
        if (v22 == 3)
        {
          if ((*(unsigned char *)(a1 + 72) & 4) == 0) {
            goto LABEL_15;
          }
          goto LABEL_13;
        }
        if (v22 == 1)
        {
          if ((*(unsigned char *)(a1 + 72) & 8) == 0) {
            goto LABEL_15;
          }
LABEL_13:
          if ((float)((float)((float)((float)(v16 - *(float *)(v21 + i - 184))
                                     * (float)(v16 - *(float *)(v21 + i - 184)))
                             + 0.0)
                     + (float)((float)(v17 - *(float *)(v21 + i - 180)) * (float)(v17 - *(float *)(v21 + i - 180)))) < v19)
          {
            v23 = [*(id *)(a1 + 32) _transitPointForFeature:v21 + i - 272];
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          }
          goto LABEL_15;
        }
        if (!*(unsigned char *)(v21 + i) && (*(unsigned char *)(a1 + 72) & 2) != 0) {
          goto LABEL_13;
        }
      }
LABEL_15:
      ++v18;
    }
  }
}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __89__GEOMapFeatureTransitPointFinder_findTransitPointWithID_near_handler_completionHandler___block_invoke;
  uint64_t v21 = &unk_1E53F5E80;
  id v24 = v26;
  unint64_t v25 = a3;
  int v22 = self;
  id v13 = v11;
  id v23 = v13;
  float v14 = (void *)MEMORY[0x18C120660](&v18);
  float v15 = [(GEOMapFeatureTransitPointFinder *)self _tileFinder];
  float v16 = objc_msgSend(v15, "findTilesAround:radius:handler:completionHandler:", v14, v12, var0, var1, 500.0);

  _Block_object_dispose(v26, 8);

  return v16;
}

void __89__GEOMapFeatureTransitPointFinder_findTransitPointWithID_near_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = -1;
    uint64_t v4 = 40;
    while (++v3 < (unint64_t)[v9 transitNodeCount])
    {
      uint64_t v5 = [v9 transitNodes];
      uint64_t v6 = v4 + 344;
      uint64_t v7 = *(void *)(v5 + v4);
      v4 += 344;
      if (v7 == *(void *)(a1 + 56))
      {
        uint64_t v8 = [*(id *)(a1 + 32) _transitPointForFeature:v5 + v6 - 384];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

        break;
      }
    }
  }
}

- (id)findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = [v8 feature];
  id v12 = *(uint64_t **)(v11 + 256);
  if (v12)
  {
    if (*(void *)(v11 + 248))
    {
      id v13 = -[GEOMapFeatureTransitPointFinder _transitPointForFeature:](self, "_transitPointForFeature:");
      v9[2](v9, v13);
      if (v10) {
        v10[2](v10, 0);
      }
      float v14 = objc_alloc_init(_GEOMapFeatureAccessRequest);
    }
    else
    {
      uint64_t v15 = *v12;
      [v8 coordinate];
      double v17 = v16;
      double v19 = v18;
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x2020000000;
      char v32 = 0;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      unint64_t v25 = __86__GEOMapFeatureTransitPointFinder_findParentOfTransitPoint_handler_completionHandler___block_invoke;
      v26 = &unk_1E53F5E80;
      id v29 = v31;
      uint64_t v30 = v15;
      char v27 = self;
      v28 = v9;
      v20 = (void *)MEMORY[0x18C120660](&v23);
      uint64_t v21 = [(GEOMapFeatureTransitPointFinder *)self _tileFinder];
      objc_msgSend(v21, "findTilesAround:radius:handler:completionHandler:", v20, v10, v17, v19, 500.0);
      float v14 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v31, 8);
    }
  }
  else
  {
    if (v10) {
      v10[2](v10, 0);
    }
    float v14 = objc_alloc_init(_GEOMapFeatureAccessRequest);
  }

  return v14;
}

void __86__GEOMapFeatureTransitPointFinder_findParentOfTransitPoint_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = -1;
    uint64_t v4 = 40;
    while (++v3 < (unint64_t)[v9 transitNodeCount])
    {
      uint64_t v5 = [v9 transitNodes];
      uint64_t v6 = v4 + 344;
      uint64_t v7 = *(void *)(v5 + v4);
      v4 += 344;
      if (v7 == *(void *)(a1 + 56))
      {
        id v8 = [*(id *)(a1 + 32) _transitPointForFeature:v5 + v6 - 384];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

        break;
      }
    }
  }
}

- (id)findTransitPointsWithParent:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 transitID];
  [v8 coordinate];
  double v13 = v12;
  double v15 = v14;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__GEOMapFeatureTransitPointFinder_findTransitPointsWithParent_handler_completionHandler___block_invoke;
  v21[3] = &unk_1E53F5EA8;
  uint64_t v23 = v11;
  v21[4] = self;
  id v16 = v9;
  id v22 = v16;
  double v17 = (void *)MEMORY[0x18C120660](v21);
  double v18 = [(GEOMapFeatureTransitPointFinder *)self _tileFinder];
  double v19 = objc_msgSend(v18, "findTilesAround:radius:handler:completionHandler:", v17, v10, v13, v15, 500.0);

  return v19;
}

void __89__GEOMapFeatureTransitPointFinder_findTransitPointsWithParent_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = 0;
  for (unint64_t i = 0; i < [v7 transitNodeCount]; ++i)
  {
    uint64_t v5 = *(void **)([v7 transitNodes] + v3 + 256);
    if (v5)
    {
      if (*v5 == *(void *)(a1 + 48))
      {
        uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_transitPointForFeature:");
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    v3 += 344;
  }
}

- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 transitID];
  [v8 coordinate];
  double v13 = v12;
  double v15 = v14;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __95__GEOMapFeatureTransitPointFinder_findTransitAccessPointsForStation_handler_completionHandler___block_invoke;
  uint64_t v24 = &unk_1E53DEE20;
  uint64_t v26 = v11;
  id v16 = v9;
  id v25 = v16;
  double v17 = (void *)MEMORY[0x18C120660](&v21);
  double v18 = [(GEOMapFeatureTransitPointFinder *)self _tileFinder];
  double v19 = objc_msgSend(v18, "findTilesAround:radius:handler:completionHandler:", v17, v10, v13, v15, 500.0);

  return v19;
}

void __95__GEOMapFeatureTransitPointFinder_findTransitAccessPointsForStation_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = 0;
  for (unint64_t i = 0; i < [v7 transitAccessPointCount]; ++i)
  {
    uint64_t v5 = [v7 transitAccessPoints] + v3;
    if (*(void *)(v5 + 224) == *(void *)(a1 + 40))
    {
      uint64_t v6 = [[GEOMapFeatureTransitAccessPoint alloc] initWithFeature:v5];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    v3 += 248;
  }
}

- (id)findGeometryForTransitPoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 transitID];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __81__GEOMapFeatureTransitPointFinder_findGeometryForTransitPoint_completionHandler___block_invoke;
  double v17 = &unk_1E53F5ED0;
  uint64_t v19 = v8;
  id v9 = v6;
  id v18 = v9;
  id v10 = (void *)MEMORY[0x18C120660](&v14);
  uint64_t v11 = [(GEOMapFeatureTransitPointFinder *)self _geometryTileFinder];
  [v9 coordinate];
  double v12 = objc_msgSend(v11, "findTilesAround:radius:handler:completionHandler:", v10, v7);

  return v12;
}

void __81__GEOMapFeatureTransitPointFinder_findGeometryForTransitPoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = 0;
  for (unint64_t i = 0; i < [v5 polygonsCount]; ++i)
  {
    if (*(void *)([v5 polygons] + v3 + 40) == *(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "updateWithGeometryFeature:");
    }
    v3 += 128;
  }
}

- (id)_tileFinder
{
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v3 = +[GEOMapFeatureAccess tileSetInfoForStyle:37 scale:0];
  uint64_t v4 = [GEOMapFeatureTileFinder alloc];
  id v5 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  id v6 = [(GEOMapFeatureTileFinder *)v4 initWithZoomLevel:HIDWORD(*(unint64_t *)&v3) tileSize:v3 tileScale:0 tileSetStyle:37 requestParameters:v5];

  return v6;
}

- (id)_geometryTileFinder
{
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v3 = +[GEOMapFeatureAccess tileSetInfoForStyle:1 scale:0];
  uint64_t v4 = [GEOMapFeatureTileFinder alloc];
  id v5 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  id v6 = [(GEOMapFeatureTileFinder *)v4 initWithZoomLevel:HIDWORD(*(unint64_t *)&v3) tileSize:v3 tileScale:0 tileSetStyle:1 requestParameters:v5];

  return v6;
}

- (id)_transitPointForFeature:(void *)a3
{
  int v3 = *((char *)a3 + 272);
  if (!*((unsigned char *)a3 + 272))
  {
    uint64_t v4 = off_1E53D47F0;
    goto LABEL_7;
  }
  if (v3 == 1)
  {
    uint64_t v4 = off_1E53D47E8;
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    uint64_t v4 = off_1E53D47D8;
LABEL_7:
    id v5 = (void *)[objc_alloc(*v4) initWithFeature:a3];
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

@end