@interface GEOMapRequestManager
- (GEOMapRequestManager)init;
- (void)dealloc;
- (void)requestComplete:(id)a3;
- (void)trackRequest:(id)a3;
@end

@implementation GEOMapRequestManager

- (GEOMapRequestManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOMapRequestManager;
  v2 = [(GEOMapRequestManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requests = v2->_requests;
    v2->_requests = v3;

    uint64_t v5 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __31__GEOMapRequestManager_dealloc__block_invoke;
  v7 = &unk_1E53D79D8;
  objc_super v8 = self;
  geo_isolate_sync_data();
  v3.receiver = self;
  v3.super_class = (Class)GEOMapRequestManager;
  [(GEOMapRequestManager *)&v3 dealloc];
}

void __31__GEOMapRequestManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "cancel", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)trackRequest:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __37__GEOMapRequestManager_trackRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)requestComplete:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __40__GEOMapRequestManager_requestComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

@end