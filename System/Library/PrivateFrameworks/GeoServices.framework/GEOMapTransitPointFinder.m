@interface GEOMapTransitPointFinder
- (GEOMapAccess)map;
- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 parentID:(unint64_t)a5;
- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 pointID:(unint64_t)a5;
- (GEOMapTransitPointFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5;
- (void)_validatePoint:(void *)a3 rect:(id)a4 localSearch:()Box<float validPointHandler:(2>)a5;
- (void)cancel;
- (void)findTransitPointsOfType:(unint64_t)a3 nodeHandler:(id)a4 accessPointHandler:(id)a5;
@end

@implementation GEOMapTransitPointFinder

- (GEOMapTransitPointFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapTransitPointFinder;
  v10 = [(GEOMapRequest *)&v15 initWithManager:v9];
  if (v10)
  {
    v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->_centerPoint.y = v11;
    v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
    uint64_t v12 = +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1, a5);
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v12;
  }
  return v10;
}

- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 pointID:(unint64_t)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOMapTransitPointFinder;
    v10 = [(GEOMapRequest *)&v15 initWithManager:v9];
    if (v10)
    {
      v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
      v10->_centerPoint.y = v11;
      v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * 500.0;
      uint64_t v12 = +[GEOMapTileFinder detailedTransitTileFinderForMap:v9 center:var0 radius:var1];
      tileFinder = v10->_tileFinder;
      v10->_tileFinder = (GEOMapTileFinder *)v12;

      v10->_pointID = a5;
    }
    self = v10;
    a5 = (unint64_t)self;
  }

  return (GEOMapTransitPointFinder *)a5;
}

- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 parentID:(unint64_t)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOMapTransitPointFinder;
    v10 = [(GEOMapRequest *)&v15 initWithManager:v9];
    if (v10)
    {
      v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
      v10->_centerPoint.y = v11;
      v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * 500.0;
      uint64_t v12 = +[GEOMapTileFinder detailedTransitTileFinderForMap:v9 center:var0 radius:var1];
      tileFinder = v10->_tileFinder;
      v10->_tileFinder = (GEOMapTileFinder *)v12;

      v10->_parentID = a5;
    }
    self = v10;
    a5 = (unint64_t)self;
  }

  return (GEOMapTransitPointFinder *)a5;
}

- (void)cancel
{
  tileFinder = self->_tileFinder;
  if (tileFinder && ![(GEOMapRequest *)tileFinder isFinished]) {
    [(GEOMapTileFinder *)self->_tileFinder cancel];
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapTransitPointFinder;
  [(GEOMapRequest *)&v4 cancel];
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findTransitPointsOfType:(unint64_t)a3 nodeHandler:(id)a4 accessPointHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke;
  v17[3] = &unk_1E53D87E8;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  [(GEOMapRequest *)self->_tileFinder setCompletionHandler:v17];
  tileFinder = self->_tileFinder;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_2;
  v13[3] = &unk_1E53D8838;
  v13[4] = self;
  id v11 = v9;
  id v14 = v11;
  unint64_t v16 = a3;
  id v12 = v8;
  id v15 = v12;
  [(GEOMapTileFinder *)tileFinder findTiles:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained complete];
}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)v4 << 32;
  unint64_t v7 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) >> 4) << 52);
  *(void *)((char *)v54 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v54[0]) = v5;
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = v6;
  v53[0] = v54[0];
  v53[1] = v8 >> 56;
  double v9 = GEOMapRectForGEOTileKey((uint64_t)v53);
  double v11 = v10;
  double v13 = v12;
  id v14 = *(double **)(a1 + 32);
  double v44 = v9;
  *(float *)&double v9 = (v14[6] - v9) / v10;
  double v16 = v15;
  *(float *)&double v15 = (v13 - (v14[7] - v15)) / v13;
  *(float *)&double v10 = v14[8] / v10;
  float v17 = *(float *)&v9 - *(float *)&v10;
  float v18 = *(float *)&v15 - *(float *)&v10;
  float v19 = *(float *)&v9 + *(float *)&v10;
  float v20 = *(float *)&v15 + *(float *)&v10;
  if (*(void *)(a1 + 40) && (*(unsigned char *)(a1 + 56) & 1) != 0)
  {
    uint64_t v34 = 0;
    for (unint64_t i = 0; i < [v3 transitAccessPointCount]; ++i)
    {
      uint64_t v36 = [v3 transitAccessPoints];
      uint64_t v37 = v36 + v34;
      v38 = *(void **)(a1 + 32);
      uint64_t v39 = v38[10];
      if (!v39 || *(void *)(v37 + 224) == v39)
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_3;
        v49[3] = &unk_1E53D8810;
        uint64_t v52 = v36 + v34;
        id v50 = v3;
        id v51 = *(id *)(a1 + 40);
        *(float *)&double v40 = v17;
        *(float *)&double v41 = v18;
        *(float *)&double v42 = v19;
        *(float *)&double v43 = v20;
        objc_msgSend(v38, "_validatePoint:rect:localSearch:validPointHandler:", v37, v49, v44, v16, v11, v13, v40, v41, v42, v43);
      }
      v34 += 248;
    }
  }
  if (*(void *)(a1 + 48) && (*(unsigned char *)(a1 + 56) & 0xE) != 0)
  {
    unint64_t v21 = 0;
    for (uint64_t j = 272; v21 < [v3 transitNodeCount]; j += 344)
    {
      uint64_t v23 = [v3 transitNodes];
      uint64_t v24 = v23 + j;
      v25 = *(void **)(a1 + 32);
      uint64_t v26 = v25[10];
      if (v26)
      {
        v27 = *(void **)(v24 - 16);
        if (!v27 || v26 != *v27) {
          goto LABEL_21;
        }
      }
      else if (!v23)
      {
        goto LABEL_21;
      }
      int v28 = *(unsigned __int8 *)(v23 + j);
      if (v28 == 3)
      {
        if ((*(unsigned char *)(a1 + 56) & 8) != 0) {
          goto LABEL_20;
        }
      }
      else
      {
        if (v28 == 1)
        {
          if ((*(unsigned char *)(a1 + 56) & 4) == 0) {
            goto LABEL_21;
          }
LABEL_20:
          uint64_t v29 = v24 - 272;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_4;
          v45[3] = &unk_1E53D8810;
          id v46 = v3;
          uint64_t v48 = v29;
          id v47 = *(id *)(a1 + 48);
          *(float *)&double v30 = v17;
          *(float *)&double v31 = v18;
          *(float *)&double v32 = v19;
          *(float *)&double v33 = v20;
          objc_msgSend(v25, "_validatePoint:rect:localSearch:validPointHandler:", v29, v45, v44, v16, v11, v13, v30, v31, v32, v33);

          goto LABEL_21;
        }
        if (!*(unsigned char *)(v23 + j) && (*(unsigned char *)(a1 + 56) & 2) != 0) {
          goto LABEL_20;
        }
      }
LABEL_21:
      ++v21;
    }
  }
}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_3(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = (char *)operator new(0x38uLL);
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 1) = 0;
  *(void *)uint64_t v6 = &unk_1ED518710;
  id v7 = v5;
  *(_OWORD *)(v6 + 24) = *a2;
  *((void *)v6 + 5) = v4;
  *((void *)v6 + 6) = v7;
  uint64_t v8 = a1[5];
  atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
  (*(void (**)(uint64_t))(v8 + 16))(v8);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_4(void *a1, _OWORD *a2)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  uint64_t v6 = (std::__shared_weak_count *)operator new(0x50uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED5186A0;
  uint64_t v7 = geo::MapNode::MapNode((uint64_t)&v6[1], a2, v4, *(void *)(v5 + 240));
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1ED513878;
  v6[2].__shared_weak_owners_ = v5;
  uint64_t v8 = a1[5];
  uint64_t v9 = v7;
  double v10 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  (*(void (**)(uint64_t, uint64_t *))(v8 + 16))(v8, &v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
}

- (void)_validatePoint:(void *)a3 rect:(id)a4 localSearch:()Box<float validPointHandler:(2>)a5
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v8 = a4.var0.var1;
  double v9 = a4.var0.var0;
  Box<float, 2> v21 = a5;
  double v12 = (void (**)(id, void *))a6;
  uint64_t v13 = 0;
  char v14 = 1;
  while (1)
  {
    float v15 = *((float *)a3 + v13 + 22);
    if (v15 < v21.var0._e[v13] || v15 >= v21.var1._e[v13]) {
      break;
    }
    char v16 = v14;
    char v14 = 0;
    uint64_t v13 = 1;
    if ((v16 & 1) == 0)
    {
      unint64_t pointID = self->_pointID;
      if (!pointID || *((void *)a3 + 5) == pointID)
      {
        v20[0] = GEOCoordinate2DForMapPoint(v9 + *((float *)a3 + 22) * var0, v8 + (float)(1.0 - *((float *)a3 + 23)) * var1);
        v20[1] = v18;
        v12[2](v12, v20);
        if (self->_pointID)
        {
          [(GEOMapTileFinder *)self->_tileFinder cancel];
          tileFinder = self->_tileFinder;
          self->_tileFinder = 0;

          [(GEOMapRequest *)self complete];
        }
      }
      break;
    }
  }
}

- (void).cxx_destruct
{
}

@end