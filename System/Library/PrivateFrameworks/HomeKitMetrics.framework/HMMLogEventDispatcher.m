@interface HMMLogEventDispatcher
- (HMMLogEventDispatcher)init;
- (HMMLogEventDispatchingDataSource)dataSource;
- (OS_dispatch_queue)clientQueue;
- (id)_getOrCreateObserversForEventClass:(Class)a3;
- (void)_checkPendingLogEventBuffer;
- (void)addObserver:(id)a3 forEventClass:(Class)a4;
- (void)addObserver:(id)a3 forEventClasses:(id)a4;
- (void)addObserver:(id)a3 forProtocol:(id)a4;
- (void)handleMemoryPressureState:(int64_t)a3;
- (void)processAndSubmitLogEvents;
- (void)removeObserver:(id)a3;
- (void)setDataSource:(id)a3;
- (void)submitLogEvent:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
@end

@implementation HMMLogEventDispatcher

uint64_t __40__HMMLogEventDispatcher_submitLogEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processAndSubmitLogEvents];
}

void __50__HMMLogEventDispatcher_processAndSubmitLogEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 prepareForObservation];
  v4 = [*(id *)(a1 + 32) _getOrCreateObserversForEventClass:objc_opt_class()];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(v4, "allObjects", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) didReceiveEventFromDispatcher:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_getOrCreateObserversForEventClass:(Class)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = -[NSMapTable objectForKey:](self->_observersByClass, "objectForKey:");
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_observersByClass setObject:v5 forKey:a3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(NSMapTable *)self->_observersByProtocol keyEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([(objc_class *)a3 conformsToProtocol:v11])
          {
            long long v12 = [(NSMapTable *)self->_observersByProtocol objectForKey:v11];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  id v13 = v5;

  return v13;
}

- (void)processAndSubmitLogEvents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSMutableArray *)self->_pendingLogEvents copy];
  [(NSMutableArray *)self->_pendingLogEvents removeAllObjects];
  *(_WORD *)&self->_isProcessingPending = 256;
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1D944E970]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543618;
    long long v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1D4999000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to submit [%@] events", buf, 0x16u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HMMLogEventDispatcher_processAndSubmitLogEvents__block_invoke;
  v10[3] = &unk_1E69FD5E0;
  v10[4] = v6;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6 = a3;
  [v6 setError:a4];
  [(HMMLogEventDispatcher *)self submitLogEvent:v6];
}

- (void)submitLogEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 markEndTime];
  v5 = [(HMMLogEventDispatcher *)self dataSource];
  id v6 = v5;
  if (!v5 || [v5 isSubmissionEnabled])
  {
    char v7 = [v4 confirmSubmission];
    uint64_t v8 = (void *)MEMORY[0x1D944E970]();
    uint64_t v9 = self;
    long long v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v18 = v12;
        __int16 v19 = 2112;
        uint64_t v20 = objc_opt_class();
        _os_log_impl(&dword_1D4999000, v11, OS_LOG_TYPE_INFO, "%{public}@Submitting event: %@", buf, 0x16u);
      }
      os_unfair_lock_lock_with_options();
      [(NSMutableArray *)v9->_pendingLogEvents addObject:v4];
      [(HMMLogEventDispatcher *)v9 _checkPendingLogEventBuffer];
      if (v9->_isProcessingPending)
      {
        os_unfair_lock_unlock(&v9->_lock);
      }
      else
      {
        v9->_isProcessingPending = 1;
        os_unfair_lock_unlock(&v9->_lock);
        v14 = [(HMMLogEventDispatcher *)v9 clientQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__HMMLogEventDispatcher_submitLogEvent___block_invoke;
        block[3] = &unk_1E69FD5B8;
        block[4] = v9;
        dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
        dispatch_async(v14, v15);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v18 = v13;
        __int16 v19 = 2112;
        uint64_t v20 = objc_opt_class();
        _os_log_impl(&dword_1D4999000, v11, OS_LOG_TYPE_ERROR, "%{public}@Event %@ was already submitted", buf, 0x16u);
      }
    }
  }
}

- (HMMLogEventDispatchingDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMMLogEventDispatchingDataSource *)WeakRetained;
}

- (void)_checkPendingLogEventBuffer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[(NSMutableArray *)self->_pendingLogEvents count] >= 0x400 && self->_shouldFault)
  {
    id v3 = (void *)MEMORY[0x1D944E970]();
    id v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = HMFGetLogIdentifier();
      char v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_pendingLogEvents, "count"));
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D4999000, v5, OS_LOG_TYPE_FAULT, "%{public}@TOO MANY PENDING LOG EVENTS: %@", (uint8_t *)&v8, 0x16u);
    }
    self->_shouldFault = 0;
  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_observersByProtocol, 0);
  objc_storeStrong((id *)&self->_observersByClass, 0);
  objc_storeStrong((id *)&self->_pendingLogEvents, 0);
}

- (void)setDataSource:(id)a3
{
}

- (void)handleMemoryPressureState:(int64_t)a3
{
  if (a3 == 2)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(HMMLogEventDispatcher *)self _checkPendingLogEventBuffer];
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(HMMLogEventDispatcher *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HMMLogEventDispatcher_removeObserver___block_invoke;
  v7[3] = &unk_1E69FD770;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __40__HMMLogEventDispatcher_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v8];
        __int16 v10 = *(void **)(a1 + 40);

        if (v9 == v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectEnumerator", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * k) removeObject:*(void *)(a1 + 40)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)addObserver:(id)a3 forProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMLogEventDispatcher *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMMLogEventDispatcher_addObserver_forProtocol___block_invoke;
  block[3] = &unk_1E69FD798;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __49__HMMLogEventDispatcher_addObserver_forProtocol___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 32) setObject:a1[5] forKey:a1[6]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1[4] + 24), "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 conformsToProtocol:a1[6]])
        {
          uint64_t v8 = [*(id *)(a1[4] + 24) objectForKey:v7];
          [v8 addObject:a1[5]];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3 forEventClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMLogEventDispatcher *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HMMLogEventDispatcher_addObserver_forEventClasses___block_invoke;
  block[3] = &unk_1E69FD798;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __53__HMMLogEventDispatcher_addObserver_forEventClasses___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_getOrCreateObserversForEventClass:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 addObject:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3 forEventClass:(Class)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  Class v8 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v8 count:1];
  -[HMMLogEventDispatcher addObserver:forEventClasses:](self, "addObserver:forEventClasses:", v6, v7, v8, v9);
}

- (HMMLogEventDispatcher)init
{
  v15.receiver = self;
  v15.super_class = (Class)HMMLogEventDispatcher;
  id v2 = [(HMMLogEventDispatcher *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    observersByClass = v2->_observersByClass;
    v2->_observersByClass = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    observersByProtocol = v2->_observersByProtocol;
    v2->_observersByProtocol = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    pendingLogEvents = v2->_pendingLogEvents;
    v2->_pendingLogEvents = (NSMutableArray *)v7;

    v2->_shouldFault = 1;
    uint64_t v9 = (const char *)HMMDispatchQueueName(v2, @"LogEventQueue");
    long long v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v12 = dispatch_queue_create(v9, v11);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v12;
  }
  return v2;
}

@end