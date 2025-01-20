@interface HUCAPackageIconManager
+ (id)sharedInstance;
- (HFMutablePriorityQueue)prefetchPriorityQueue;
- (HUCAPackageIconManager)init;
- (NAScheduler)prefetchScheduler;
- (NSCache)packageDataCache;
- (NSCache)packageReuseQueue;
- (id)_loadPackageWithIconDescriptor:(id)a3;
- (id)_packageDataForIconDescriptor:(id)a3;
- (id)_prefetchIcons:(id)a3;
- (id)_queueForIconDescriptorIdentifier:(id)a3;
- (id)packageForIconDescriptor:(id)a3;
- (id)prefetchIconDescriptors:(id)a3;
- (id)tryReclaimPackage:(id)a3 forIconDescriptor:(id)a4;
- (unint64_t)signpostID;
- (void)_startPrefetchIfNecessary;
- (void)prioritizeIconDescriptors:(id)a3;
- (void)returnPackageToCache:(id)a3 forIconDescriptor:(id)a4;
- (void)setPackageDataCache:(id)a3;
- (void)setPackageReuseQueue:(id)a3;
- (void)setPrefetchPriorityQueue:(id)a3;
- (void)setPrefetchScheduler:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
@end

@implementation HUCAPackageIconManager

uint64_t __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __52__HUCAPackageIconManager_prioritizeIconDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)prioritizeIconDescriptors:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory();
  unint64_t v6 = [(HUCAPackageIconManager *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      int v10 = 134217984;
      uint64_t v11 = [v4 count];
      _os_signpost_emit_with_name_impl(&dword_25275A000, v5, OS_SIGNPOST_EVENT, v7, "PackageIconManagerPrefetch", "Prioritized icon descriptors: %lu", (uint8_t *)&v10, 0xCu);
    }
  }

  v8 = [(HUCAPackageIconManager *)self prefetchPriorityQueue];
  v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_26);
  [v8 prioritizeObjects:v9];
}

- (id)_prefetchIcons:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory();
  unint64_t v6 = [(HUCAPackageIconManager *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = [v4 count];
      _os_signpost_emit_with_name_impl(&dword_25275A000, v5, OS_SIGNPOST_EVENT, v7, "PackageIconManagerPrefetch", "Number of icon descriptors prefetch requested: %lu", buf, 0xCu);
    }
  }

  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = (uint64_t)v4;
    _os_log_debug_impl(&dword_25275A000, v8, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: prefetchIconDescriptors prefetching icon descriptors: %@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__HUCAPackageIconManager__prefetchIcons___block_invoke;
  v18[3] = &unk_265381230;
  v18[4] = self;
  v9 = objc_msgSend(v4, "na_map:", v18);
  [(HUCAPackageIconManager *)self _startPrefetchIfNecessary];
  int v10 = (void *)MEMORY[0x263F58168];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__HUCAPackageIconManager__prefetchIcons___block_invoke_2;
  v15[3] = &unk_265381258;
  v15[4] = self;
  id v16 = v9;
  id v17 = v4;
  id v11 = v4;
  id v12 = v9;
  v13 = [v10 tokenWithCancelationBlock:v15];

  return v13;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)_startPrefetchIfNecessary
{
  if (!dispatch_group_wait((dispatch_group_t)self->_prefetchDispatchGroup, 0))
  {
    objc_initWeak(&location, self);
    v3 = [(HUCAPackageIconManager *)self prefetchScheduler];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__HUCAPackageIconManager__startPrefetchIfNecessary__block_invoke;
    v4[3] = &unk_265381280;
    objc_copyWeak(&v5, &location);
    [v3 performBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (NAScheduler)prefetchScheduler
{
  return self->_prefetchScheduler;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_3);
  }
  v2 = (void *)qword_26B22BA50;
  return v2;
}

void __51__HUCAPackageIconManager__startPrefetchIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_group_enter(*((dispatch_group_t *)WeakRetained + 2));
  v2 = [WeakRetained prefetchPriorityQueue];
  v3 = [v2 dequeue];

  if (v3)
  {
    do
    {
      id v4 = HFLogForCategory();
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, v3);

      unint64_t v6 = HFLogForCategory();
      os_signpost_id_t v7 = v6;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_signpost_emit_with_name_impl(&dword_25275A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PackageIconManagerPrefetch", "Loading: %@", buf, 0xCu);
      }

      v8 = [WeakRetained _loadPackageWithIconDescriptor:v3];
      if (v8)
      {
        v9 = [WeakRetained _queueForIconDescriptorIdentifier:v3];
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
        [v9 enqueue:v8];
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      }
      int v10 = HFLogForCategory();
      id v11 = v10;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_signpost_emit_with_name_impl(&dword_25275A000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PackageIconManagerPrefetch", "Loading: %@", buf, 0xCu);
      }

      id v12 = [WeakRetained prefetchPriorityQueue];
      uint64_t v13 = [v12 dequeue];

      v3 = (void *)v13;
    }
    while (v13);
  }
  dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 2));
}

id __41__HUCAPackageIconManager__prefetchIcons___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 prefetchPriorityQueue];
  os_signpost_id_t v5 = [v4 enqueue:v3];

  return v5;
}

- (HFMutablePriorityQueue)prefetchPriorityQueue
{
  return self->_prefetchPriorityQueue;
}

- (id)_loadPackageWithIconDescriptor:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_signpost_id_t v5 = [(HUCAPackageIconManager *)self _packageDataForIconDescriptor:v4];
  if (v5)
  {
    [MEMORY[0x263F158F8] begin];
    unint64_t v6 = (void *)MEMORY[0x263F15838];
    os_signpost_id_t v7 = [v5 data];
    v8 = [v5 typeIdentifier];
    id v14 = 0;
    v9 = [v6 packageWithData:v7 type:v8 options:0 error:&v14];
    id v10 = v14;

    [MEMORY[0x263F158F8] commit];
    if (!v9) {
      NSLog(&cfstr_FailedToIdenti.isa, v4);
    }
    if (v10)
    {
      id v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v13;
        _os_log_error_impl(&dword_25275A000, v11, OS_LOG_TYPE_ERROR, "HUCAPackageIconManager: Failed to identify CAPackage for icon identifier: %@ due to error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_packageDataForIconDescriptor:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_signpost_id_t v5 = [(HUCAPackageIconManager *)self packageDataCache];
  unint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C318]);
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v6 = (void *)[v7 initWithName:v4 bundle:v8];

    if (v6)
    {
      v9 = [(HUCAPackageIconManager *)self packageDataCache];
      [v9 setObject:v6 forKey:v4];
    }
    else
    {
      v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_error_impl(&dword_25275A000, v9, OS_LOG_TYPE_ERROR, "HUCAPackageIconManager: Failed to load NSDataAsset for icon identifier: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  id v10 = v6;

  return v10;
}

- (NSCache)packageDataCache
{
  return self->_packageDataCache;
}

- (id)tryReclaimPackage:(id)a3 forIconDescriptor:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HUCAPackageIconManager.m", 63, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  v9 = [(HUCAPackageIconManager *)self packageReuseQueue];
  id v10 = [v8 identifier];
  id v11 = [v9 objectForKey:v10];

  os_unfair_lock_lock(&self->_queueLock);
  if (v7)
  {
    int v12 = [v11 allObjects];
    int v13 = [v12 containsObject:v7];

    if (v13)
    {
      [v11 dequeueObject:v7];
      id v14 = v7;
LABEL_8:
      v15 = v14;
      goto LABEL_10;
    }
  }
  if ([v11 count])
  {
    id v14 = [v11 dequeue];
    goto LABEL_8;
  }
  v15 = 0;
LABEL_10:
  uint64_t v16 = [v11 count];
  os_unfair_lock_unlock(&self->_queueLock);
  if (v15)
  {
    __int16 v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      v25 = v22;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      _os_log_debug_impl(&dword_25275A000, v17, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: dequeued package with identifier %@, queue now contains %lu packages", buf, 0x16u);
    }
  }
  else
  {
    v18 = [v8 identifier];
    v15 = [(HUCAPackageIconManager *)self _loadPackageWithIconDescriptor:v18];
  }
  uint64_t v19 = [v15 rootLayer];
  [v19 setGeometryFlipped:1];

  uint64_t v20 = [v15 rootLayer];
  [v20 setShouldRasterize:1];

  return v15;
}

- (id)_queueForIconDescriptorIdentifier:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(HUCAPackageIconManager *)self packageReuseQueue];
  unint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    unint64_t v6 = objc_opt_new();
    id v7 = [(HUCAPackageIconManager *)self packageReuseQueue];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (NSCache)packageReuseQueue
{
  return self->_packageReuseQueue;
}

BOOL __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  int v5 = [v4 intValue];
  if ((v5 & 0x80000000) == 0)
  {
    unint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") - 1);
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v3];
  }
  return v5 >= 0;
}

id __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 integerValue];

  v9 = [v6 objectForKeyedSubscript:v5];

  if (!v9)
  {
    id v10 = [*(id *)(a1 + 32) packageReuseQueue];
    id v11 = [v10 objectForKey:v5];

    if (v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
      uint64_t v8 = -[v11 count];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    }
  }
  int v12 = [NSNumber numberWithInteger:v8 + 1];
  [v6 setObject:v12 forKeyedSubscript:v5];

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v15 = v8 >= 0 || *(unsigned char *)(v13 + 24) != 0;
  *(unsigned char *)(v13 + 24) = v15;

  return v6;
}

- (id)prefetchIconDescriptors:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F47B48] isSpringBoard])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_19);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_2;
    v20[3] = &unk_2653811E0;
    v20[4] = self;
    v20[5] = &v21;
    uint64_t v8 = objc_msgSend(v6, "na_reduceWithInitialValue:reducer:", v7, v20);

    if (*((unsigned char *)v22 + 24))
    {
      v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v26 = v6;
        _os_log_debug_impl(&dword_25275A000, v9, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: prefetchIconDescriptors called with icon descriptors: %@", buf, 0xCu);
      }

      id v10 = (void *)[v8 mutableCopy];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_23;
      __int16 v17 = &unk_265381208;
      id v18 = v8;
      id v11 = v10;
      id v19 = v11;
      int v12 = objc_msgSend(v6, "na_filter:", &v14);
      id v5 = -[HUCAPackageIconManager _prefetchIcons:](self, "_prefetchIcons:", v12, v14, v15, v16, v17);
    }
    else
    {
      id v5 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }

  return v5;
}

void __41__HUCAPackageIconManager__prefetchIcons___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) prefetchPriorityQueue];
  [v2 removeObjectsWithEntries:*(void *)(a1 + 40)];

  id v3 = HFLogForCategory();
  uint64_t v4 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      uint64_t v6 = [*(id *)(a1 + 48) count];
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_signpost_emit_with_name_impl(&dword_25275A000, v3, OS_SIGNPOST_EVENT, v5, "PackageIconManagerPrefetch", "Cancel Sent for %lu icon descriptors", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __40__HUCAPackageIconManager_sharedInstance__block_invoke_2()
{
  qword_26B22BA50 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (HUCAPackageIconManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)HUCAPackageIconManager;
  v2 = [(HUCAPackageIconManager *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [(HUCAPackageIconManager *)v2 setPackageDataCache:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [(HUCAPackageIconManager *)v2 setPackageReuseQueue:v4];

    os_signpost_id_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("HUCAPackageIconManagerScheduler", v5);

    int v7 = [MEMORY[0x263F581B8] schedulerWithDispatchQueue:v6];
    [(HUCAPackageIconManager *)v2 setPrefetchScheduler:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F47BB8]);
    [(HUCAPackageIconManager *)v2 setPrefetchPriorityQueue:v8];

    dispatch_group_t v9 = dispatch_group_create();
    prefetchDispatchGroup = v2->_prefetchDispatchGroup;
    v2->_prefetchDispatchGroup = (OS_dispatch_group *)v9;

    id v11 = HFLogForCategory();
    v2->_signpostID = os_signpost_id_make_with_pointer(v11, v2);
  }
  return v2;
}

- (void)setPrefetchScheduler:(id)a3
{
}

- (void)setPrefetchPriorityQueue:(id)a3
{
}

- (void)setPackageReuseQueue:(id)a3
{
}

- (void)setPackageDataCache:(id)a3
{
}

- (id)packageForIconDescriptor:(id)a3
{
  return [(HUCAPackageIconManager *)self tryReclaimPackage:0 forIconDescriptor:a3];
}

- (void)returnPackageToCache:(id)a3 forIconDescriptor:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUCAPackageIconManager.m", 91, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (!v7) {
      goto LABEL_6;
    }
  }
  dispatch_group_t v9 = [v8 identifier];
  id v10 = [(HUCAPackageIconManager *)self _queueForIconDescriptorIdentifier:v9];

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(p_queueLock);
  [v10 enqueue:v7];
  os_unfair_lock_unlock(p_queueLock);
  int v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_super v13 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2048;
    uint64_t v18 = [v10 count];
    _os_log_debug_impl(&dword_25275A000, v12, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: reclaimed package with identifier %@, queue now contains %lu packages", buf, 0x16u);
  }
LABEL_6:
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchPriorityQueue, 0);
  objc_storeStrong((id *)&self->_prefetchScheduler, 0);
  objc_storeStrong((id *)&self->_packageReuseQueue, 0);
  objc_storeStrong((id *)&self->_packageDataCache, 0);
  objc_storeStrong((id *)&self->_prefetchDispatchGroup, 0);
}

@end