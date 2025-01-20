@interface GEOMapTransitGeometryFinder
- (GEOMapTransitGeometryFinder)initWithMap:(id)a3 transitID:(unint64_t)a4 coordinate:(id)a5;
- (void)cancel;
- (void)findTransitGeometryWithHandler:(id)a3;
@end

@implementation GEOMapTransitGeometryFinder

- (GEOMapTransitGeometryFinder)initWithMap:(id)a3 transitID:(unint64_t)a4 coordinate:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapTransitGeometryFinder;
  v10 = [(GEOMapRequest *)&v15 initWithManager:v9];
  if (v10)
  {
    uint64_t v11 = +[GEOMapTileFinder transitGeometryTileFinderForMap:center:radius:](GEOMapTileFinder, "transitGeometryTileFinderForMap:center:radius:", v9, var0, var1, 50.0);
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v11;

    v10->_transitID = a4;
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
  v4.super_class = (Class)GEOMapTransitGeometryFinder;
  [(GEOMapRequest *)&v4 cancel];
}

- (void)findTransitGeometryWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke;
    v8[3] = &unk_1E53E5690;
    objc_copyWeak(&v9, &location);
    [(GEOMapRequest *)self->_tileFinder setCompletionHandler:v8];
    tileFinder = self->_tileFinder;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke_2;
    v6[3] = &unk_1E53E7388;
    v6[4] = self;
    id v7 = v4;
    [(GEOMapTileFinder *)tileFinder findTiles:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    [WeakRetained complete];
  }
}

void __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)v4 << 32;
  unint64_t v7 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) >> 4) << 52);
  *(void *)((char *)v32 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v32[0]) = v5;
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = v6;
  v31[0] = v32[0];
  v31[1] = v8 >> 56;
  double v9 = GEOMapRectForGEOTileKey((uint64_t)v31);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  for (unint64_t i = 0; i < [v3 polygonsCount]; ++i)
  {
    v17 = (void *)([v3 polygons] + (i << 7));
    if (v17[5] == *(void *)(*(void *)(a1 + 32) + 48))
    {
      v32[0] = 0;
      v18 = geo::codec::multiSectionFeaturePoints(v17, 0, v32);
      uint64_t v19 = v32[0];
      v20 = (double *)malloc_type_malloc(16 * v32[0], 0x1000040451B5BE8uLL);
      v23 = v20;
      if (v19)
      {
        v24 = v20 + 1;
        v25 = (float *)v18 + 1;
        double v26 = -1.79769313e308;
        v21.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        uint64_t v27 = v19;
        double v28 = -1.79769313e308;
        v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        do
        {
          double v29 = v9 + *(v25 - 1) * v13;
          double v30 = v11 + (float)(1.0 - *v25) * v15;
          v21.n128_f64[0] = fmin(v21.n128_f64[0], v29);
          v22.n128_f64[0] = fmin(v22.n128_f64[0], v30);
          double v28 = fmax(v28, v29);
          double v26 = fmax(v26, v30);
          *(v24 - 1) = v29;
          double *v24 = v30;
          v24 += 2;
          v25 += 2;
          --v27;
        }
        while (v27);
      }
      else
      {
        double v28 = -1.79769313e308;
        v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        double v26 = -1.79769313e308;
        v21.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      }
      (*(void (**)(__n128, __n128, double, double))(*(void *)(a1 + 40) + 16))(v21, v22, v28 - v21.n128_f64[0], v26 - v22.n128_f64[0]);
      free(v23);
    }
  }
}

- (void).cxx_destruct
{
}

@end