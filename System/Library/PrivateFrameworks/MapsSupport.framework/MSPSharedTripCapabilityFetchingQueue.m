@interface MSPSharedTripCapabilityFetchingQueue
- (BOOL)containsHandle:(id)a3;
- (MSPSharedTripCapabilityFetchingQueue)initWithDelegate:(id)a3 queue:(id)a4 label:(id)a5;
- (MSPSharedTripCapabilityFetchingQueueDelegate)delegate;
- (NSOrderedSet)inflightHandles;
- (NSOrderedSet)pendingHandles;
- (NSOrderedSet)requestedHandles;
- (NSString)label;
- (id)_pendingHandles;
- (id)description;
- (unint64_t)count;
- (void)_markHandleInflight:(id)a3;
- (void)_markHandlesInflight:(id)a3;
- (void)_processPendingHandles;
- (void)_updateRequestedHandlesWithAdditions:(id)a3 subtractions:(id)a4;
- (void)markHandleInflight:(id)a3;
- (void)markHandlesInflight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateRequestedHandlesWithAdditions:(id)a3 subtractions:(id)a4;
@end

@implementation MSPSharedTripCapabilityFetchingQueue

- (MSPSharedTripCapabilityFetchingQueue)initWithDelegate:(id)a3 queue:(id)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MSPSharedTripCapabilityFetchingQueue;
  v11 = [(MSPSharedTripCapabilityFetchingQueue *)&v24 init];
  if (v11)
  {
    v12 = objc_alloc_init(MSPCountedOrderedSet);
    requestedHandles = v11->_requestedHandles;
    v11->_requestedHandles = v12;

    v14 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    inflightHandles = v11->_inflightHandles;
    v11->_inflightHandles = v14;

    objc_storeWeak((id *)&v11->_delegate, v8);
    id v16 = [NSString stringWithFormat:@"com.apple.Maps.SharedTrip.CapabilityFetching.Queue.%@", v10];
    v17 = (const char *)[v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v11->_callbackQueue, a4);
    uint64_t v21 = [v10 copy];
    label = v11->_label;
    v11->_label = (NSString *)v21;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  if (self)
  {
    v4 = self;
    v5 = [v3 stringWithFormat:@"%@<%p>", objc_opt_class(), v4];
  }
  else
  {
    v5 = @"<nil>";
  }
  v6 = [(MSPSharedTripCapabilityFetchingQueue *)self label];
  v7 = [(MSPSharedTripCapabilityFetchingQueue *)self delegate];
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
  }
  else
  {
    id v8 = @"<nil>";
  }
  id v9 = [v3 stringWithFormat:@"%@ (%@) <delegate: %@, %lu pending: %@, %lu inflight: %@>", v5, v6, v8, -[MSPCountedOrderedSet count](self->_requestedHandles, "count"), self->_requestedHandles, -[NSMutableOrderedSet count](self->_inflightHandles, "count"), self->_inflightHandles];

  return v9;
}

- (void)updateRequestedHandlesWithAdditions:(id)a3 subtractions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__MSPSharedTripCapabilityFetchingQueue_updateRequestedHandlesWithAdditions_subtractions___block_invoke;
  block[3] = &unk_1E617C940;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(workQueue, block);
}

uint64_t __89__MSPSharedTripCapabilityFetchingQueue_updateRequestedHandlesWithAdditions_subtractions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRequestedHandlesWithAdditions:*(void *)(a1 + 40) subtractions:*(void *)(a1 + 48)];
}

- (void)_updateRequestedHandlesWithAdditions:(id)a3 subtractions:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v8 = MSPGetSharedTripCapabilityFetchingQueueLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = NSString;
    id v10 = self;
    v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];

    id v12 = [(MSPSharedTripCapabilityFetchingQueue *)v10 label];
    *(_DWORD *)buf = 138413571;
    v28 = v11;
    __int16 v29 = 2112;
    v30 = v12;
    __int16 v31 = 2048;
    uint64_t v32 = [v6 count];
    __int16 v33 = 2113;
    id v34 = v6;
    __int16 v35 = 2048;
    uint64_t v36 = [v7 count];
    __int16 v37 = 2113;
    id v38 = v7;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "%@ (%@) add: %lu %{private}@, removed: %lu %{private}@", buf, 0x3Eu);
  }
  [(MSPCountedOrderedSet *)self->_requestedHandles unionSet:v6];
  [(MSPCountedOrderedSet *)self->_requestedHandles minusSet:v7];
  if ([v7 count])
  {
    id v13 = (void *)[(NSMutableOrderedSet *)self->_inflightHandles copy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (![(MSPCountedOrderedSet *)self->_requestedHandles containsObject:v19]) {
            [(NSMutableOrderedSet *)self->_inflightHandles removeObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
  v20 = [(MSPSharedTripCapabilityFetchingQueue *)self _pendingHandles];
  uint64_t v21 = [v20 count];

  if (v21) {
    [(MSPSharedTripCapabilityFetchingQueue *)self _processPendingHandles];
  }
}

- (void)_processPendingHandles
{
}

- (BOOL)containsHandle:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MSPSharedTripCapabilityFetchingQueue_containsHandle___block_invoke;
  block[3] = &unk_1E617C798;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __55__MSPSharedTripCapabilityFetchingQueue_containsHandle___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 32) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MSPSharedTripCapabilityFetchingQueue_count__block_invoke;
  v6[3] = &unk_1E617DAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__MSPSharedTripCapabilityFetchingQueue_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSOrderedSet)requestedHandles
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MSPSharedTripCapabilityFetchingQueue_requestedHandles__block_invoke;
  v6[3] = &unk_1E617DAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOrderedSet *)v4;
}

uint64_t __56__MSPSharedTripCapabilityFetchingQueue_requestedHandles__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) contents];

  return MEMORY[0x1F41817F8]();
}

- (NSOrderedSet)inflightHandles
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MSPSharedTripCapabilityFetchingQueue_inflightHandles__block_invoke;
  v6[3] = &unk_1E617DAE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOrderedSet *)v4;
}

uint64_t __55__MSPSharedTripCapabilityFetchingQueue_inflightHandles__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSOrderedSet)pendingHandles
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  id v14 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSPSharedTripCapabilityFetchingQueue_pendingHandles__block_invoke;
  block[3] = &unk_1E617DBD8;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(workQueue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSOrderedSet *)v4;
}

void __54__MSPSharedTripCapabilityFetchingQueue_pendingHandles__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _pendingHandles];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_pendingHandles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(MSPCountedOrderedSet *)self->_requestedHandles contents];
  id v4 = (void *)[v3 mutableCopy];

  [v4 minusOrderedSet:self->_inflightHandles];
  v5 = (void *)[v4 copy];

  return v5;
}

- (void)markHandleInflight:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSPSharedTripCapabilityFetchingQueue_markHandleInflight___block_invoke;
  block[3] = &unk_1E617C560;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripCapabilityFetchingQueue_markHandleInflight___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markHandleInflight:*(void *)(a1 + 32)];
}

- (void)_markHandleInflight:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = MSPGetSharedTripCapabilityFetchingQueueLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSString;
    id v7 = self;
    id v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];

    *(_DWORD *)buf = 138543619;
    uint64_t v10 = v8;
    __int16 v11 = 2113;
    id v12 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] mark handle inflight: %{private}@", buf, 0x16u);
  }
  [(NSMutableOrderedSet *)self->_inflightHandles addObject:v4];
}

- (void)markHandlesInflight:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MSPSharedTripCapabilityFetchingQueue_markHandlesInflight___block_invoke;
  block[3] = &unk_1E617C560;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__MSPSharedTripCapabilityFetchingQueue_markHandlesInflight___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markHandlesInflight:*(void *)(a1 + 32)];
}

- (void)_markHandlesInflight:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = MSPGetSharedTripCapabilityFetchingQueueLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSString;
    id v7 = self;
    id v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];

    *(_DWORD *)buf = 138543619;
    uint64_t v10 = v8;
    __int16 v11 = 2113;
    id v12 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] mark handles inflight: %{private}@", buf, 0x16u);
  }
  [(NSMutableOrderedSet *)self->_inflightHandles unionOrderedSet:v4];
}

- (MSPSharedTripCapabilityFetchingQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSharedTripCapabilityFetchingQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inflightHandles, 0);
  objc_storeStrong((id *)&self->_requestedHandles, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end