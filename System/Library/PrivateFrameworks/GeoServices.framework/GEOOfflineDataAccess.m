@interface GEOOfflineDataAccess
+ (id)sharedInstance;
+ (void)_setSharedInstanceUseLocalPersistence:(BOOL)a3;
- (BOOL)hasDataForKey:(id)a3 error:(id *)a4;
- (GEOOfflineDataAccess)initWithAccessor:(id)a3;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4;
- (void)_resetFullyDownloadedRegions;
- (void)dealloc;
- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getFullyDownloadedRegionsWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
@end

@implementation GEOOfflineDataAccess

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
}

+ (id)sharedInstance
{
  if (qword_1EB2A01E0 != -1) {
    dispatch_once(&qword_1EB2A01E0, &__block_literal_global_151);
  }
  v2 = (void *)qword_1EB2A01E8;

  return v2;
}

void __38__GEOOfflineDataAccess_sharedInstance__block_invoke()
{
  if (_MergedGlobals_292)
  {
    v0 = _GEOGetSharedTileDB();
    if (!v0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: diskCache != nil", v6, 2u);
    }
    v1 = [GEOOfflineLocalDataAccess alloc];
    v2 = +[GEOOfflineDataConfiguration sharedConfiguration];
    v3 = [(GEOOfflineLocalDataAccess *)v1 initWithDiskCache:v0 configuration:v2];
  }
  else
  {
    v3 = objc_alloc_init(GEOOfflineRemoteDataAccess);
  }
  v4 = [[GEOOfflineDataAccess alloc] initWithAccessor:v3];
  v5 = (void *)qword_1EB2A01E8;
  qword_1EB2A01E8 = (uint64_t)v4;
}

- (GEOOfflineDataAccess)initWithAccessor:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOOfflineDataAccess;
  v6 = [(GEOOfflineDataAccess *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessor, a3);
    uint64_t v8 = geo_isolater_create();
    isolation = v7->_isolation;
    v7->_isolation = (geo_isolater *)v8;

    objc_initWeak(&location, v7);
    v10 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
    global_queue = geo_get_global_queue();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__GEOOfflineDataAccess_initWithAccessor___block_invoke;
    v14[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch(v10, &v7->_fullyDownloadedSubscriptionsChangedToken, global_queue, v14);

    v12 = v7;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (void)_setSharedInstanceUseLocalPersistence:(BOOL)a3
{
  _MergedGlobals_292 = a3;
}

void __41__GEOOfflineDataAccess_initWithAccessor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetFullyDownloadedRegions];
}

- (void)dealloc
{
  int fullyDownloadedSubscriptionsChangedToken = self->_fullyDownloadedSubscriptionsChangedToken;
  if (fullyDownloadedSubscriptionsChangedToken != -1)
  {
    notify_cancel(fullyDownloadedSubscriptionsChangedToken);
    self->_int fullyDownloadedSubscriptionsChangedToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOOfflineDataAccess;
  [(GEOOfflineDataAccess *)&v4 dealloc];
}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  return (id)[(GEOOfflineDataAccessor *)self->_accessor dataForKey:a3 error:a4];
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  return [(GEOOfflineDataAccessor *)self->_accessor hasDataForKey:a3 error:a4];
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
}

- (void)_resetFullyDownloadedRegions
{
}

void __52__GEOOfflineDataAccess__resetFullyDownloadedRegions__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)getFullyDownloadedRegionsWithCallbackQueue:(id)a3 callback:(id)a4
{
  v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__75;
  v26 = __Block_byref_object_dispose__75;
  id v27 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke;
  v19 = &unk_1E53D89C0;
  v20 = self;
  v21 = &v22;
  geo_isolate_sync_data();
  if (v23[5])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_2;
    block[3] = &unk_1E53DBFB0;
    id v14 = v7;
    id v15 = &v22;
    dispatch_async(v6, block);
    uint64_t v8 = v14;
  }
  else
  {
    uint64_t v8 = +[GEOMapDataSubscriptionManager sharedManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_3;
    v9[3] = &unk_1E53DAA28;
    v10 = v6;
    v11 = self;
    id v12 = v7;
    [v8 _fetchFullyDownloadedSubscriptionsOfType:1024 includeOutOfDate:1 callbackQueue:v10 completionHandler:v9];
  }
  _Block_object_dispose(&v22, 8);
}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v10 = objc_msgSend(a2, "_geo_map:", &__block_literal_global_11_2);
    id v6 = v10;
    geo_isolate_sync_data();
    (*(void (**)(void, id, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, 0, v7, v8);
  }
  else
  {
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_4;
    block[3] = &unk_1E53D7C50;
    id v13 = *(id *)(a1 + 48);
    id v12 = v5;
    dispatch_async(v9, block);

    id v6 = v13;
  }
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 region];
}

void __76__GEOOfflineDataAccess_getFullyDownloadedRegionsWithCallbackQueue_callback___block_invoke_6(uint64_t a1)
{
}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  return (id)[(GEOOfflineDataAccessor *)self->_accessor offlineTileMetadataWithState:a3.var0 error:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyDownloadedRegions, 0);
  objc_storeStrong((id *)&self->_isolation, 0);

  objc_storeStrong((id *)&self->_accessor, 0);
}

@end