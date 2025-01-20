@interface GEOMapFeatureFinder
- (BOOL)ignoreUnnamedFeatures;
- (GEOMapAccess)map;
- (GEOMapFeatureFinder)initWithMap:(id)a3 center:(id)a4;
- (id)pointHandler;
- (id)polygonHandler;
- (id)roadHandler;
- (void)cancel;
- (void)findFeatures:(id)a3 pointHandler:(id)a4 polygonHandler:(id)a5 completionHandler:(id)a6;
- (void)setIgnoreUnnamedFeatures:(BOOL)a3;
- (void)setPointHandler:(id)a3;
- (void)setPolygonHandler:(id)a3;
- (void)setRoadHandler:(id)a3;
@end

@implementation GEOMapFeatureFinder

- (GEOMapFeatureFinder)initWithMap:(id)a3 center:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapFeatureFinder;
  result = [(GEOMapRequest *)&v7 initWithManager:a3];
  if (result)
  {
    result->_coordinate.latitude = var0;
    result->_coordinate.longitude = var1;
  }
  return result;
}

- (void)cancel
{
  [(GEOMapTileFinder *)self->_tileFinder cancel];
  tileFinder = self->_tileFinder;
  self->_tileFinder = 0;

  [(GEOMapFeatureFinder *)self setRoadHandler:0];
  [(GEOMapFeatureFinder *)self setPointHandler:0];
  [(GEOMapFeatureFinder *)self setPolygonHandler:0];
  v4.receiver = self;
  v4.super_class = (Class)GEOMapFeatureFinder;
  [(GEOMapRequest *)&v4 cancel];
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findFeatures:(id)a3 pointHandler:(id)a4 polygonHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v21 = a4;
  id v20 = a5;
  [(GEOMapRequest *)self setCompletionHandler:a6];
  double latitude = self->_coordinate.latitude;
  double v12 = GEOTilePointForCoordinate(latitude, self->_coordinate.longitude, 20.0);
  uint64_t v14 = v13;
  long double v15 = GEOMapPointsPerMeterAtLatitude(latitude);
  v16 = [(GEOMapFeatureFinder *)self map];
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", v16, self->_coordinate.latitude, self->_coordinate.longitude, 1000.0);
  v17 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->_tileFinder;
  self->_tileFinder = v17;

  [(GEOMapFeatureFinder *)self setRoadHandler:v10];
  [(GEOMapFeatureFinder *)self setPointHandler:v21];
  [(GEOMapFeatureFinder *)self setPolygonHandler:v20];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__55;
  v40[4] = __Block_byref_object_dispose__55;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  int v39 = 2139095039;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  int v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 2139095039;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke;
  v25[3] = &unk_1E53E57D0;
  *(double *)&v25[16] = v12;
  v25[17] = v14;
  *(long double *)&v25[18] = v15;
  v25[4] = self;
  v25[5] = v38;
  v25[6] = v40;
  v25[7] = v37;
  v25[8] = v36;
  v25[9] = v35;
  v25[10] = v33;
  v25[11] = v31;
  v25[12] = v28;
  v25[13] = v30;
  v25[14] = v27;
  v25[15] = v26;
  v19 = (void *)MEMORY[0x18C120660](v25);
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_5;
  v22[3] = &unk_1E53E57F8;
  objc_copyWeak(&v23, &location);
  v22[5] = v40;
  v22[6] = v36;
  v22[7] = v35;
  v22[8] = v33;
  v22[9] = v38;
  v22[10] = v37;
  v22[11] = v31;
  v22[12] = v30;
  v22[13] = v28;
  v22[14] = v27;
  v22[15] = v26;
  v22[4] = self;
  [(GEOMapRequest *)self->_tileFinder setCompletionHandler:v22];
  [(GEOMapTileFinder *)self->_tileFinder findTiles:v19];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)v4 << 32;
  unint64_t v7 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) >> 4) << 52);
  *(void *)((char *)v39 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v39[0]) = v5;
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = v6;
  v38[0] = v39[0];
  v38[1] = v8 >> 56;
  double v9 = GEOMapRectForGEOTileKey((uint64_t)v38);
  double v13 = *(double *)(a1 + 136);
  float v14 = (*(double *)(a1 + 128) - v9) / v11;
  float v15 = (v12 - (v13 - v10)) / v12;
  double v16 = *(double *)(a1 + 144);
  double v17 = v11 / v16;
  v18 = *(void **)(a1 + 32);
  if (v18[8])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_2;
    v30[3] = &unk_1E53E5758;
    float v36 = v14;
    float v37 = (v12 - (v13 - v10)) / v12;
    long long v31 = *(_OWORD *)(a1 + 40);
    double v35 = v11 / v16;
    long long v32 = *(_OWORD *)(a1 + 56);
    long long v33 = *(_OWORD *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 88);
    void v30[4] = v18;
    uint64_t v34 = v19;
    [v3 forEachRoad:v30];
    v18 = *(void **)(a1 + 32);
  }
  if (v18[9])
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_3;
    v24[3] = &unk_1E53E5780;
    v24[4] = v18;
    float v28 = v14;
    float v29 = v15;
    long long v25 = *(_OWORD *)(a1 + 96);
    uint64_t v26 = *(void *)(a1 + 112);
    double v27 = v17;
    [v3 forEachPoint:v24];
    v18 = *(void **)(a1 + 32);
  }
  if (v18[10])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_4;
    v21[3] = &unk_1E53E57A8;
    float v22 = v14;
    float v23 = v15;
    uint64_t v20 = *(void *)(a1 + 120);
    v21[4] = v18;
    v21[5] = v20;
    [v3 forEachPolygon:v21];
  }
}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 feature];
  uint64_t v6 = v5;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 88) || [v5 labelCount] || objc_msgSend(v6, "shieldCount"))
  {
    for (unint64_t i = 0; i < [v4 sectionCount]; ++i)
    {
      unint64_t v14 = 0;
      long long v8 = GEOMultiSectionFeaturePoints(v4, i, &v14);
      uint64_t v13 = 0;
      int v12 = 0;
      float v9 = gm::Matrix<float,2,1>::distanceSquaredToPolyline<int,void>((float *)(a1 + 104), v14, (uint64_t)v8, &v13, (float *)&v12);
      if (v9 < *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(a1 + 96);
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = i;
        uint64_t v10 = v13;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v12;
        double v11 = (float *)&v8[v10];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = (float)((float)(0.0
                                                                                   - (float)((float)(v11[3] - v11[1])
                                                                                           * (float)(*(float *)(a1 + 104) - *v11)))
                                                                           + (float)((float)(v11[2] - *v11)
                                                                                   * (float)(*(float *)(a1 + 108)
                                                                                           - v11[1]))) > 0.0;
      }
    }
  }
}

double __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, double result)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 88) || *(unsigned char *)(a2 + 73))
  {
    float v3 = *(float *)(a2 + 88) - *(float *)(a1 + 72);
    *(float *)&result = (float)((float)(v3 * v3) + 0.0)
                      + (float)((float)(*(float *)(a2 + 92) - *(float *)(a1 + 76))
                              * (float)(*(float *)(a2 + 92) - *(float *)(a1 + 76)));
    if (*(float *)&result < *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = LODWORD(result);
      result = *(double *)(a1 + 64);
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (!*(unsigned char *)(*(void *)(result + 32) + 88) || *(unsigned char *)(a2 + 73))
  {
    result = GEOPolygonFeatureContains((float *)a2, *(float *)(result + 48), *(float *)(result + 52));
    if (result) {
      *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = a2;
    }
  }
  return result;
}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[8])
    {
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v4)
      {
        uint64_t v39 = 0;
        uint64_t v5 = (float *)GEOMultiSectionFeaturePoints(v4, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &v39);
        if (v39 == 1)
        {
          float v17 = NAN;
        }
        else
        {
          unint64_t v7 = 0;
          unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          float v9 = *v5;
          float v10 = v5[1];
          double v11 = v5 + 3;
          double v6 = 0.0;
          float v12 = 0.0;
          float v13 = 0.0;
          do
          {
            float v14 = v9;
            float v15 = v10;
            float v9 = *(v11 - 1);
            float v10 = *v11;
            float v16 = sqrtf((float)((float)((float)(v14 - v9) * (float)(v14 - v9)) + 0.0)+ (float)((float)(v15 - *v11) * (float)(v15 - *v11)));
            if (v7 >= v8)
            {
              if (v8 == v7) {
                float v13 = v13 + (float)(v16 * *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
              }
            }
            else
            {
              float v13 = v13 + v16;
            }
            ++v7;
            float v12 = v12 + v16;
            v11 += 2;
          }
          while (v39 - 1 != v7);
          float v17 = v13 / v12;
        }
        uint64_t v18 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "getRoad", v6);
        uint64_t v19 = (std::__shared_weak_count *)operator new(0x50uLL);
        v19->__shared_owners_ = 0;
        v19->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED5186D8;
        v19[1].__shared_weak_owners_ = 0;
        v19[2].__vftable = 0;
        v19[1].__shared_owners_ = v18;
        v19->__shared_weak_owners_ = 0;
        v19[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED513938;
        LOBYTE(v19[3].__vftable) = 0;
        v19[2].__shared_owners_ = 0;
        v19[2].__shared_weak_owners_ = 0;
        uint64_t v20 = *(void *)(a1 + 64);
        uint64_t v21 = *(void *)(a1 + 88);
        *(double *)&v19[1].__shared_weak_owners_ = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
                                                 * sqrtf(*(float *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
        int v22 = *(_DWORD *)(*(void *)(v20 + 8) + 24);
        uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        LOBYTE(v21) = *(unsigned char *)(*(void *)(v21 + 8) + 24);
        v19[2].__vftable = *(std::__shared_weak_count_vtbl **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        v19[2].__shared_owners_ = v23;
        LODWORD(v19[2].__shared_weak_owners_) = v22;
        *((float *)&v19[2].__shared_weak_owners_ + 1) = v17;
        LOBYTE(v19[3].__vftable) = v21;
        uint64_t v24 = v3[8];
        float v37 = v19 + 1;
        v38 = v19;
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        (*(void (**)(void))(v24 + 16))();
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v38);
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
    }
    uint64_t v25 = v3[9];
    if (v25)
    {
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      if (v26)
      {
        double v27 = (std::__shared_weak_count *)operator new(0x30uLL);
        v27->__shared_owners_ = 0;
        v27->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED518748;
        v27[1].__shared_owners_ = v26;
        v27[1].__shared_weak_owners_ = 0;
        v27->__shared_weak_owners_ = 0;
        v27[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED513990;
        *(double *)&v27[1].__shared_weak_owners_ = *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)
                                                 * sqrtf(*(float *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
        double v35 = v27 + 1;
        float v36 = v27;
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
        (*(void (**)(uint64_t, std::__shared_weak_count **))(v25 + 16))(v25, &v35);
        if (v36) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
    }
    uint64_t v28 = v3[10];
    if (v28)
    {
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      if (v29)
      {
        v30 = (std::__shared_weak_count *)operator new(0x30uLL);
        v30->__shared_owners_ = 0;
        v30->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED518780;
        v30[1].__shared_owners_ = v29;
        v30[1].__shared_weak_owners_ = 0;
        v30->__shared_weak_owners_ = 0;
        v30[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED5139C0;
        long long v33 = v30 + 1;
        uint64_t v34 = v30;
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
        (*(void (**)(uint64_t, std::__shared_weak_count **))(v28 + 16))(v28, &v33);
        if (v34) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v34);
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v30);
      }
    }
    uint64_t v31 = *(void *)(a1 + 32);
    long long v32 = *(void **)(v31 + 56);
    *(void *)(v31 + 56) = 0;

    [v3 complete];
  }
}

- (id)roadHandler
{
  return self->_roadHandler;
}

- (void)setRoadHandler:(id)a3
{
}

- (id)pointHandler
{
  return self->_pointHandler;
}

- (void)setPointHandler:(id)a3
{
}

- (id)polygonHandler
{
  return self->_polygonHandler;
}

- (void)setPolygonHandler:(id)a3
{
}

- (BOOL)ignoreUnnamedFeatures
{
  return self->_ignoreUnnamedFeatures;
}

- (void)setIgnoreUnnamedFeatures:(BOOL)a3
{
  self->_ignoreUnnamedFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_polygonHandler, 0);
  objc_storeStrong(&self->_pointHandler, 0);
  objc_storeStrong(&self->_roadHandler, 0);

  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end