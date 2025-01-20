@interface GEOMapEdgeFinder
- (BOOL)_checkEdgeForDuplicates:(const void *)a3;
- (GEOMapAccess)map;
- (GEOMapEdgeFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5;
- (id)edgeHandler;
- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7;
- (void)cancel;
- (void)findEdges:(id)a3;
- (void)setEdgeHandler:(id)a3;
@end

@implementation GEOMapEdgeFinder

- (GEOMapEdgeFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapEdgeFinder;
  v10 = [(GEOMapRequest *)&v13 initWithManager:v9];
  if (v10)
  {
    v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->_centerPoint.y = v11;
    v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
  }

  return v10;
}

- (void)cancel
{
  v3 = [(GEOMapEdgeFinder *)self map];
  v4 = [v3 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__GEOMapEdgeFinder_cancel__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(v4, block);
}

id __26__GEOMapEdgeFinder_cancel__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEdgeHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    char v4 = [v3 isFinished];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      [*(id *)(v2 + 40) cancel];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(v2 + 80);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isFinished] & 1) == 0) {
          [v9 cancel];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)GEOMapEdgeFinder;
  return objc_msgSendSuper2(&v11, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findEdges:(id)a3
{
  id v4 = a3;
  [(GEOMapEdgeFinder *)self setEdgeHandler:v4];
  id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  edgeBuilders = self->_edgeBuilders;
  self->_edgeBuilders = v5;

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke;
  v9[3] = &unk_1E53E5690;
  objc_copyWeak(&v10, &location);
  [(GEOMapRequest *)self->_tileFinder setCompletionHandler:v9];
  tileFinder = self->_tileFinder;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_2;
  v8[3] = &unk_1E53E5730;
  v8[4] = self;
  [(GEOMapTileFinder *)tileFinder findTiles:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __30__GEOMapEdgeFinder_findEdges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((void *)WeakRetained + 5);
    *((void *)WeakRetained + 5) = 0;

    if (![*((id *)WeakRetained + 10) count]) {
      [WeakRetained complete];
    }
  }
}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)v4 << 32;
  unint64_t v7 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) >> 4) << 52);
  *(void *)&v19[1] = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  v19[0] = v5;
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = v6;
  v18[0] = *(void *)v19;
  v18[1] = v8 >> 56;
  double v9 = GEOMapRectForGEOTileKey((uint64_t)v18);
  id v10 = *(double **)(a1 + 32);
  float v12 = (v10[6] - v9) / v11;
  *(float *)&double v13 = (v14 - (v10[7] - v13)) / v14;
  *(float *)uint64_t v17 = v12;
  v17[1] = LODWORD(v13);
  double v15 = v10[8] / v11;
  *(float *)&double v11 = v15;
  *(float *)&double v15 = *(float *)&v11 * *(float *)&v11;
  *(float *)v19 = v12 - *(float *)&v11;
  *(float *)&v19[4] = *(float *)&v13 - *(float *)&v11;
  *(float *)&v19[8] = v12 + *(float *)&v11;
  float v20 = *(float *)&v13 + *(float *)&v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_3;
  v16[3] = &unk_1E53E5708;
  v16[4] = v10;
  [v10 _buildersInTile:v3 localPoint:v17 localRadiusSqr:v19 localSearch:v16 handler:v15];
}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 80) addObject:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_4;
  v5[3] = &unk_1E53E56B8;
  v5[4] = *(void *)(a1 + 32);
  [v3 setCompletionHandler:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_5;
  v4[3] = &unk_1E53E56E0;
  v4[4] = *(void *)(a1 + 32);
  [v3 buildEdge:v4];
}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeObject:");
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 40) && ![*(id *)(v3 + 80) count]) {
    [*(id *)(a1 + 32) complete];
  }
}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_5(uint64_t a1, uint64_t *a2)
{
  if (([*(id *)(a1 + 32) _checkEdgeForDuplicates:a2] & 1) == 0)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v4)
    {
      uint64_t v5 = (std::__shared_weak_count *)a2[1];
      uint64_t v6 = *a2;
      unint64_t v7 = v5;
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, uint64_t *))(v4 + 16))(v4, &v6);
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
  }
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  return 0;
}

- (id)edgeHandler
{
  return self->_edgeHandler;
}

- (void)setEdgeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeBuilders, 0);
  objc_storeStrong(&self->_edgeHandler, 0);

  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end