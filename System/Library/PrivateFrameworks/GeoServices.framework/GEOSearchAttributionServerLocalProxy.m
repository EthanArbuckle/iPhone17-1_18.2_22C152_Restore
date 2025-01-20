@interface GEOSearchAttributionServerLocalProxy
- (GEOSearchAttributionServerLocalProxy)init;
- (id)_attributionManifest;
- (void)_loadAttributionInfoForListener:(id)a3;
- (void)_sendError:(id)a3 toListener:(id)a4;
- (void)_sendInfo:(id)a3 toListener:(id)a4;
- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
@end

@implementation GEOSearchAttributionServerLocalProxy

- (GEOSearchAttributionServerLocalProxy)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEOSearchAttributionServerLocalProxy;
  v2 = [(GEOSearchAttributionServerLocalProxy *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_attributionManifestLock._os_unfair_lock_opaque = 0;
    v2->_listenersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = geo_isolater_create();
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    v6 = +[GEOResourceManifestManager modernManager];
    global_workloop = (void *)geo_get_global_workloop();
    [v6 addTileGroupObserver:v3 queue:global_workloop];

    v8 = v3;
  }

  return v3;
}

- (id)_attributionManifest
{
  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock(&self->_attributionManifestLock);
  attributionManifest = self->_attributionManifest;
  if (!attributionManifest)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v6 = +[GEOFilePaths pathFor:30];
    v7 = (void *)[v5 initWithContentsOfFile:v6];

    v8 = [[GEOSearchAttributionManifest alloc] initWithData:v7];
    v9 = self->_attributionManifest;
    self->_attributionManifest = v8;

    attributionManifest = self->_attributionManifest;
  }
  objc_super v10 = attributionManifest;
  os_unfair_lock_unlock(p_attributionManifestLock);

  return v10;
}

- (void)_sendInfo:(id)a3 toListener:(id)a4
{
  p_listenersLock = &self->_listenersLock;
  id v7 = a4;
  id v10 = a3;
  os_unfair_lock_lock_with_options();
  listeners = self->_listeners;
  v9 = [v7 identifier];
  [(NSMapTable *)listeners removeObjectForKey:v9];

  os_unfair_lock_unlock(p_listenersLock);
  [v7 handleInfo:v10];
}

- (void)_sendError:(id)a3 toListener:(id)a4
{
  p_listenersLock = &self->_listenersLock;
  id v7 = a4;
  id v10 = a3;
  os_unfair_lock_lock_with_options();
  listeners = self->_listeners;
  v9 = [v7 identifier];
  [(NSMapTable *)listeners removeObjectForKey:v9];

  os_unfair_lock_unlock(p_listenersLock);
  [v7 handleError:v10];
}

- (void)_loadAttributionInfoForListener:(id)a3
{
  id v4 = a3;
  id v5 = [GEOSearchAttributionLoader alloc];
  v6 = [(GEOSearchAttributionServerLocalProxy *)self _attributionManifest];
  id v7 = [(GEOSearchAttributionLoader *)v5 initWithAttributionManifest:v6];

  v8 = [v4 identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__GEOSearchAttributionServerLocalProxy__loadAttributionInfoForListener___block_invoke;
  v10[3] = &unk_1E53EA640;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(GEOSearchAttributionLoader *)v7 loadAttributionInfoForIdentifier:v8 allowNetwork:1 completionHandler:v10];
}

uint64_t __72__GEOSearchAttributionServerLocalProxy__loadAttributionInfoForListener___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2) {
    return [v4 _sendInfo:a2 toListener:v5];
  }
  else {
    return [v4 _sendError:a3 toListener:v5];
  }
}

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  id v7 = dispatch_group_create();
  v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v27 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
        v37[3] = &unk_1E53EA668;
        v37[4] = self;
        id v38 = v28;
        uint64_t v39 = v11;
        v12 = v7;
        v40 = v12;
        v13 = (void *)MEMORY[0x18C120660](v37);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3;
        v33[3] = &unk_1E53DA0F8;
        v33[4] = self;
        id v34 = v27;
        uint64_t v35 = v11;
        v36 = v12;
        v14 = (void *)MEMORY[0x18C120660](v33);
        os_unfair_lock_lock(&self->_listenersLock);
        v15 = [(NSMapTable *)self->_listeners objectForKey:v11];
        if (v15)
        {
          v16 = v15;
          [(_GEOSearchAttributionListener *)v15 addCompletionHandler:v13 errorHandler:v14];
          os_unfair_lock_unlock(&self->_listenersLock);
        }
        else
        {
          if (!self->_listeners)
          {
            v17 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:512 capacity:5];
            listeners = self->_listeners;
            self->_listeners = v17;
          }
          v16 = [[_GEOSearchAttributionListener alloc] initWithIdentifier:v11];
          [(NSMapTable *)self->_listeners setObject:v16 forKey:v11];
          [(_GEOSearchAttributionListener *)v16 addCompletionHandler:v13 errorHandler:v14];
          os_unfair_lock_unlock(&self->_listenersLock);
          [(GEOSearchAttributionServerLocalProxy *)self _loadAttributionInfoForListener:v16];
        }

        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v9);
  }

  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_5;
  block[3] = &unk_1E53D95B8;
  id v30 = v28;
  id v31 = v27;
  id v32 = v24;
  id v20 = v27;
  id v21 = v28;
  id v22 = v24;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_group_notify(v7, global_queue, v23);
}

void __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

void __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock_with_options();
  attributionManifest = self->_attributionManifest;
  self->_attributionManifest = 0;

  os_unfair_lock_unlock(p_attributionManifestLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_attributionManifest, 0);
  objc_storeStrong((id *)&self->_updateManifestErrorHandlers, 0);
  objc_storeStrong((id *)&self->_updateManifestCompletionHandlers, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

@end