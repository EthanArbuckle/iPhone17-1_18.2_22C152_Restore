@interface GEOMapFeatureRoadFinder
- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5;
- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)_multiSegmentRoadFinder;
- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5;
- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
@end

@implementation GEOMapFeatureRoadFinder

- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    v13 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    char v14 = [v13 joinAllRoadsByMuid];

    if (v14)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__GEOMapFeatureRoadFinder_findRoadsNear_radius_handler_completionHandler___block_invoke;
      v19[3] = &unk_1E53E7E48;
      v19[4] = self;
      id v20 = v12;
      id v21 = v11;
      id v15 = -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:](self, "_findUnjoinedRoadsNear:radius:handler:", v19, var0, var1, a4);
      v16 = self->super._existingRequest;
    }
    else
    {
      -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:completionHandler:](self, "_findUnjoinedRoadsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
      v16 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "findRoadsNear requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

void __74__GEOMapFeatureRoadFinder_findRoadsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
  }
  else
  {
    v7 = [*(id *)(a1 + 32) _multiSegmentRoadFinder];
    id v8 = (id)[v7 findConnectedSegmentsForRoads:v9 directionality:3 handler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
  }
}

- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    $7E3FC3C8846FD6918BD0D88F3AA609C8 v10 = +[GEOMapFeatureAccess tileSetInfoForStyle:53 scale:0];
    id v11 = [GEOMapFeatureTileFinder alloc];
    id v12 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v13 = [(GEOMapFeatureTileFinder *)v11 initWithZoomLevel:HIDWORD(*(unint64_t *)&v10) tileSize:v10 tileScale:0 tileSetStyle:53 requestParameters:v12];

    uint64_t v14 = (uint64_t)[(GEOMapFeatureTileFinder *)v13 tileKeyWithX:WORD2(a3) y:WORD1(a3)];
    uint64_t v16 = v15;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __68__GEOMapFeatureRoadFinder_findRoadWithID_handler_completionHandler___block_invoke;
    v26[3] = &unk_1E53E7E70;
    $7E3FC3C8846FD6918BD0D88F3AA609C8 v30 = v10;
    unint64_t v29 = a3;
    v26[4] = self;
    id v27 = v8;
    id v17 = v9;
    id v28 = v17;
    v18 = (void *)MEMORY[0x18C120660](v26);
    uint64_t v19 = -[GEOMapFeatureTileFinder findTileWithKey:handler:completionHandler:](v13, "findTileWithKey:handler:completionHandler:", v14, v16, v18, v17);
    existingRequest = self->super._existingRequest;
    p_existingRequest = (id *)&self->super._existingRequest;
    id *p_existingRequest = (id)v19;

    id v22 = *p_existingRequest;
  }
  else
  {
    v23 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "findRoadWithID requires a handler", v25, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", v25, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

void __68__GEOMapFeatureRoadFinder_findRoadWithID_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(unsigned __int16 *)(a1 + 56);
  id v5 = [v3 lines];
  unint64_t v6 = [v5 count];

  if (v6 <= ((v4 >> 1) & 0x3FFF))
  {
    id v8 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = *(unsigned __int16 *)(a1 + 56);
      unsigned int v23 = *(_DWORD *)(a1 + 58);
      int v24 = *(_DWORD *)(a1 + 76);
      v25 = [v3 lines];
      int v29 = 67110144;
      *(_DWORD *)$7E3FC3C8846FD6918BD0D88F3AA609C8 v30 = (v22 >> 1) & 0x3FFF;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = HIWORD(v23);
      *(_WORD *)uint64_t v31 = 1024;
      *(_DWORD *)&v31[2] = (unsigned __int16)v23;
      __int16 v32 = 1024;
      int v33 = v24;
      __int16 v34 = 1024;
      int v35 = [v25 count];
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "findRoadWithID has invalid feature index (%u) for tile %u.%u.%d. Feature count: %d", (uint8_t *)&v29, 0x20u);
    }
  }
  else
  {
    v7 = [v3 lines];
    id v8 = [v7 objectAtIndexedSubscript:((unint64_t)*(unsigned __int16 *)(a1 + 56) >> 1) & 0x3FFF];

    if ([*(id *)(a1 + 32) _featureHasValidGeometry:v8])
    {
      id v9 = [[GEOMapFeatureRoad alloc] initWithFeature:v8];
      $7E3FC3C8846FD6918BD0D88F3AA609C8 v10 = v9;
      if (*(_WORD *)(a1 + 56)) {
        [(GEOMapFeatureRoad *)v9 flip];
      }
      id v11 = [*(id *)(a1 + 32) requestParameters];
      if ([v11 joinAllRoadsByMuid])
      {
        uint64_t v12 = [(GEOMapFeatureRoad *)v10 muid];

        if (v12)
        {
          v13 = *(void **)(a1 + 32);
          if (!v13[1])
          {
            uint64_t v14 = [_GEOMapFeatureAccessRequest alloc];
            uint64_t v15 = [*(id *)(a1 + 32) requestParameters];
            uint64_t v16 = [v15 tileLoader];
            uint64_t v17 = [(_GEOMapFeatureAccessRequest *)v14 initWithTileLoader:v16];
            uint64_t v18 = *(void *)(a1 + 32);
            uint64_t v19 = *(void **)(v18 + 8);
            *(void *)(v18 + 8) = v17;

            v13 = *(void **)(a1 + 32);
          }
          id v20 = [v13 _multiSegmentRoadFinder];
          id v21 = (id)[v20 findConnectedSegmentsForRoad:v10 directionality:3 handler:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];

          goto LABEL_17;
        }
      }
      else
      {
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:

      goto LABEL_18;
    }
    v26 = [[GEOMapFeatureRoad alloc] initWithFeature:v8];
    id v27 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = [(GEOMapFeatureRoad *)v26 debugDescription];
      int v29 = 138478083;
      *(void *)$7E3FC3C8846FD6918BD0D88F3AA609C8 v30 = v28;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)uint64_t v31 = [(GEOMapFeatureLine *)v26 coordinateCount];
      _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", (uint8_t *)&v29, 0x12u);
    }
  }
LABEL_18:
}

- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    if (!self->super._existingRequest)
    {
      v13 = [_GEOMapFeatureAccessRequest alloc];
      uint64_t v14 = [(GEOMapFeatureAccessFinder *)self requestParameters];
      uint64_t v15 = [v14 tileLoader];
      uint64_t v16 = [(_GEOMapFeatureAccessRequest *)v13 initWithTileLoader:v15];
      existingRequest = self->super._existingRequest;
      self->super._existingRequest = v16;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__GEOMapFeatureRoadFinder_findRoadWithMuid_nearCoordinate_handler_completionHandler___block_invoke;
    v22[3] = &unk_1E53E7E98;
    unint64_t v25 = a3;
    double v26 = var0;
    double v27 = var1;
    v22[4] = self;
    id v23 = v12;
    id v24 = v11;
    id v18 = -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:](self, "_findUnjoinedRoadsNear:radius:handler:", v22, var0, var1, 25.0);
    uint64_t v19 = self->super._existingRequest;
  }
  else
  {
    id v20 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "findRoadWithMuid requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

void __85__GEOMapFeatureRoadFinder_findRoadWithMuid_nearCoordinate_handler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = 0;
      uint64_t v11 = *(void *)v25;
      double v12 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "muid", (void)v24) == *(void *)(a1 + 56))
          {
            if (v10)
            {
              double v15 = *(double *)(a1 + 64);
              double v16 = *(double *)(a1 + 72);
              if (v12 == 1.79769313e308)
              {
                objc_msgSend(v10, "closestDistance2DFromCoordinate:", *(double *)(a1 + 64), *(double *)(a1 + 72), 1.79769313e308);
                double v12 = v17;
              }
              objc_msgSend(v14, "closestDistance2DFromCoordinate:", v15, v16, 1.79769313e308);
              double v19 = v18;
              if (v18 < v12)
              {
                id v20 = v14;

                id v10 = v20;
                double v12 = v19;
              }
            }
            else
            {
              id v10 = v14;
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);

      if (v10)
      {
        id v21 = [*(id *)(a1 + 32) _multiSegmentRoadFinder];
        id v22 = (id)[v21 findConnectedSegmentsForRoad:v10 directionality:3 handler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];

        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v23 = *(void *)(a1 + 40);
    if (v23) {
      (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
    }
  }
LABEL_23:
}

- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    $7E3FC3C8846FD6918BD0D88F3AA609C8 v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:53 scale:0];
    uint64_t v14 = [GEOMapFeatureTileFinder alloc];
    double v15 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    double v16 = [(GEOMapFeatureTileFinder *)v14 initWithZoomLevel:HIDWORD(*(unint64_t *)&v13) tileSize:v13 tileScale:0 tileSetStyle:53 requestParameters:v15];

    double v17 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    if ([v17 joinAllRoadsByMuid])
    {
      existingRequest = self->super._existingRequest;

      if (existingRequest)
      {
LABEL_6:
        [(GEOMapFeatureTileFinder *)v16 setExistingRequest:self->super._existingRequest];
        double v23 = GEOMapPointForCoordinate(var0, var1);
        uint64_t v25 = v24;
        long double v26 = GEOMapPointsPerMeterAtLatitude(var0);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke;
        v31[3] = &unk_1E53DA350;
        v31[4] = self;
        double v33 = v23;
        uint64_t v34 = v25;
        double v35 = v26 * a4;
        id v32 = v11;
        long long v27 = (void *)MEMORY[0x18C120660](v31);
        id v28 = -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v27, v12, var0, var1, a4);

        goto LABEL_12;
      }
      double v19 = [_GEOMapFeatureAccessRequest alloc];
      double v17 = [(GEOMapFeatureAccessFinder *)self requestParameters];
      id v20 = [v17 tileLoader];
      id v21 = [(_GEOMapFeatureAccessRequest *)v19 initWithTileLoader:v20];
      id v22 = self->super._existingRequest;
      self->super._existingRequest = v21;
    }
    goto LABEL_6;
  }
  uint64_t v29 = GEOGetGEOMapFeatureAccessLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "_findUnjoinedRoadsNear requires a handler", buf, 2u);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
  }
  id v28 = 0;
LABEL_12:

  return v28;
}

void __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(unsigned __int8 *)(v4 + 10);
  uint64_t v6 = *(unsigned __int16 *)(v4 + 8);
  uint64_t v7 = *(void *)v4;
  uint64_t v8 = *(void *)v4 << 32;
  int8x8_t v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  unint64_t v10 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(void *)((char *)v21 + 1) = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v21[0]) = v7;
  *((void *)&v11 + 1) = v10;
  *(void *)&long long v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", v21[0], (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke_2;
  v16[3] = &unk_1E53E7EC0;
  id v12 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  int v18 = v13;
  int v19 = v14;
  int v20 = v15;
  id v17 = v12;
  [v3 forEachRoad:v16];
}

void __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _featureHasValidGeometry:v3])
  {
    if ([*(id *)(a1 + 32) _boundingCircle:a1 + 48 intersectsFeature:v3])
    {
      uint64_t v4 = [[GEOMapFeatureRoad alloc] initWithFeature:v3];
      uint64_t v5 = [*(id *)(a1 + 32) requestParameters];
      if ([v5 flipNegativeTravelDirectionRoads])
      {
        int v6 = [(GEOMapFeatureRoad *)v4 travelDirection];

        if (v6 == 2) {
          [(GEOMapFeatureRoad *)v4 flip];
        }
      }
      else
      {
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      unint64_t v10 = [*(id *)(a1 + 32) requestParameters];
      int v11 = [v10 visitDoubleTravelDirectionRoadsTwice];

      if (v11)
      {
        int v12 = [(GEOMapFeatureRoad *)v4 travelDirection];
        if (!v12 || v12 == 6)
        {
          int v13 = [[GEOMapFeatureRoad alloc] initWithFeature:v3];
          [(GEOMapFeatureRoad *)v13 flip];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
    }
  }
  else
  {
    uint64_t v7 = [[GEOMapFeatureRoad alloc] initWithFeature:v3];
    uint64_t v8 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int8x8_t v9 = [(GEOMapFeatureRoad *)v7 debugDescription];
      int v14 = 138478083;
      int v15 = v9;
      __int16 v16 = 1024;
      int v17 = [(GEOMapFeatureLine *)v7 coordinateCount];
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", (uint8_t *)&v14, 0x12u);
    }
  }
}

- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  unint64_t v10 = v9;
  if (v9)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__62;
    v17[4] = __Block_byref_object_dispose__62;
    id v18 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke;
    v16[3] = &unk_1E53DED30;
    v16[4] = v17;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke_2;
    v13[3] = &unk_1E53E7EE8;
    id v14 = v9;
    int v15 = v17;
    int v11 = -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:completionHandler:](self, "_findUnjoinedRoadsNear:radius:handler:completionHandler:", v16, v13, var0, var1, a4);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

void __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v3 = v8;
  }
  [v4 addObject:v3];
}

uint64_t __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (id)_multiSegmentRoadFinder
{
  multiSegmentRoadFinder = self->_multiSegmentRoadFinder;
  if (!multiSegmentRoadFinder)
  {
    uint64_t v4 = [GEOMapFeatureMultiSegmentRoadFinder alloc];
    uint64_t v5 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    uint64_t v6 = [(GEOMapFeatureAccessFinder *)v4 initWithRequestParameters:v5];
    uint64_t v7 = self->_multiSegmentRoadFinder;
    self->_multiSegmentRoadFinder = v6;

    [(GEOMapFeatureAccessFinder *)self->_multiSegmentRoadFinder setExistingRequest:self->super._existingRequest];
    multiSegmentRoadFinder = self->_multiSegmentRoadFinder;
  }

  return multiSegmentRoadFinder;
}

- (void).cxx_destruct
{
}

@end