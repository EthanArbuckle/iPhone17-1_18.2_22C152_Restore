@interface GEOMapEdgeConnectionFinder
- (GEOMapEdgeConnectionFinder)initWithMap:(id)a3 tile:(id)a4 junction:(GeoCodecsConnectivityJunction *)a5 coordinate:(id)a6;
- (void)_findConnections:(id)a3 incoming:(BOOL)a4;
- (void)cancel;
- (void)findConnectionsIn:(id)a3;
- (void)findConnectionsOut:(id)a3;
@end

@implementation GEOMapEdgeConnectionFinder

- (GEOMapEdgeConnectionFinder)initWithMap:(id)a3 tile:(id)a4 junction:(GeoCodecsConnectivityJunction *)a5 coordinate:(id)a6
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapEdgeConnectionFinder;
  v13 = [(GEOMapRequest *)&v18 initWithManager:v11];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_map, v11);
    objc_storeStrong((id *)&v14->_tile, a4);
    v14->_junction = a5;
    v14->_coordinate.latitude = var0;
    v14->_coordinate.longitude = var1;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    builders = v14->_builders;
    v14->_builders = v15;
  }
  return v14;
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_map);
  v4 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GEOMapEdgeConnectionFinder_cancel__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(v4, block);
}

id __36__GEOMapEdgeConnectionFinder_cancel__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    char v4 = [v3 isFinished];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      [*(id *)(v2 + 48) cancel];
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = 0;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(v2 + 56);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v11 isFinished] & 1) == 0) {
          [v11 cancel];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = 0;

  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)GEOMapEdgeConnectionFinder;
  return objc_msgSendSuper2(&v15, sel_cancel);
}

- (void)findConnectionsOut:(id)a3
{
}

- (void)findConnectionsIn:(id)a3
{
}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_builders, 0);
  objc_storeStrong((id *)&self->_tileFinder, 0);

  objc_destroyWeak((id *)&self->_map);
}

@end