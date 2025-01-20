@interface CADSyntheticRouteHypothesizerCache
+ (CADSyntheticRouteHypothesizerCache)sharedInstance;
- (NSMutableDictionary)eventExternalURLToSyntheticRouteHypothesizerMap;
- (OS_dispatch_queue)workQueue;
- (id)_init;
- (id)syntheticRouteHypothesizerForEventExternalURL:(id)a3;
- (void)addSyntheticRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4;
- (void)removeSyntheticRouteHypothesizerForEventExternalURL:(id)a3;
@end

@implementation CADSyntheticRouteHypothesizerCache

+ (CADSyntheticRouteHypothesizerCache)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CADSyntheticRouteHypothesizerCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (CADSyntheticRouteHypothesizerCache *)v2;
}

uint64_t __52__CADSyntheticRouteHypothesizerCache_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  sharedInstance_sharedInstance = v1;
  return MEMORY[0x1F41817F8](v1);
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CADSyntheticRouteHypothesizerCache;
  v2 = [(CADSyntheticRouteHypothesizerCache *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendar.daemon.syntheticRouteHypothesizerCache", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    eventExternalURLToSyntheticRouteHypothesizerMap = v2->_eventExternalURLToSyntheticRouteHypothesizerMap;
    v2->_eventExternalURLToSyntheticRouteHypothesizerMap = v6;
  }
  return v2;
}

- (id)syntheticRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v5 = [(CADSyntheticRouteHypothesizerCache *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CADSyntheticRouteHypothesizerCache_syntheticRouteHypothesizerForEventExternalURL___block_invoke;
  block[3] = &unk_1E624F558;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __84__CADSyntheticRouteHypothesizerCache_syntheticRouteHypothesizerForEventExternalURL___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) eventExternalURLToSyntheticRouteHypothesizerMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addSyntheticRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CADSyntheticRouteHypothesizerCache *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__CADSyntheticRouteHypothesizerCache_addSyntheticRouteHypothesizer_forEventExternalURL___block_invoke;
  block[3] = &unk_1E624E9B0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __88__CADSyntheticRouteHypothesizerCache_addSyntheticRouteHypothesizer_forEventExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) eventExternalURLToSyntheticRouteHypothesizerMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)removeSyntheticRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CADSyntheticRouteHypothesizerCache *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__CADSyntheticRouteHypothesizerCache_removeSyntheticRouteHypothesizerForEventExternalURL___block_invoke;
  v7[3] = &unk_1E624E580;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __90__CADSyntheticRouteHypothesizerCache_removeSyntheticRouteHypothesizerForEventExternalURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventExternalURLToSyntheticRouteHypothesizerMap];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)eventExternalURLToSyntheticRouteHypothesizerMap
{
  return self->_eventExternalURLToSyntheticRouteHypothesizerMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventExternalURLToSyntheticRouteHypothesizerMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end