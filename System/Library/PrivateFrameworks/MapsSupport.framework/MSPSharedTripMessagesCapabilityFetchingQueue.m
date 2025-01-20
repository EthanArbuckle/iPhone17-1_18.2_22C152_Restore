@interface MSPSharedTripMessagesCapabilityFetchingQueue
- (MSPSharedTripMessagesCapabilityFetchingQueue)initWithDelegate:(id)a3 queue:(id)a4 label:(id)a5;
- (void)_fetchTextMessageReachability:(id)a3;
- (void)_notifyDelegateIfNeeded;
- (void)_notifyDelegateNow;
- (void)_processFetchedServiceName:(id)a3 forHandle:(id)a4 permittedServiceNames:(id)a5;
- (void)_processFetchedStatus:(id)a3 forHandle:(id)a4;
- (void)_processPendingHandles;
- (void)_resetAfterLastHandleFetched;
- (void)_resetIfNeeded;
- (void)_scheduleBatchDelayTimerWithInterval:(double)a3;
@end

@implementation MSPSharedTripMessagesCapabilityFetchingQueue

- (MSPSharedTripMessagesCapabilityFetchingQueue)initWithDelegate:(id)a3 queue:(id)a4 label:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripMessagesCapabilityFetchingQueue;
  v5 = [(MSPSharedTripCapabilityFetchingQueue *)&v9 initWithDelegate:a3 queue:a4 label:a5];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchedStatusesByHandle = v5->_fetchedStatusesByHandle;
    v5->_fetchedStatusesByHandle = v6;
  }
  return v5;
}

- (void)_processPendingHandles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripMessagesCapabilityFetchingQueue;
  [(MSPSharedTripCapabilityFetchingQueue *)&v16 _processPendingHandles];
  v3 = [(MSPSharedTripCapabilityFetchingQueue *)self _pendingHandles];
  v4 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      v5 = NSString;
      v6 = self;
      v7 = [v5 stringWithFormat:@"%@<%p>", objc_opt_class(), v6];
    }
    else
    {
      v7 = @"<nil>";
    }
    uint64_t v8 = [v3 count];
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[%{public}@] requesting %lu Text Message handles from IDS", buf, 0x16u);
  }
  if ([v3 count])
  {
    if (!self->_batchSize)
    {
      if (GEOConfigGetUInteger()) {
        unint64_t UInteger = GEOConfigGetUInteger();
      }
      else {
        unint64_t UInteger = 1;
      }
      self->_batchSize = UInteger;
      GEOConfigGetDouble();
      double v10 = 0.0;
      BOOL v12 = v11 < 0.0;
      double v13 = 0.0;
      if (!v12) {
        GEOConfigGetDouble();
      }
      self->_batchDelayInterval = v13;
      GEOConfigGetDouble();
      if (v14 >= 0.0)
      {
        GEOConfigGetDouble();
        double v10 = v15;
      }
      [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _scheduleBatchDelayTimerWithInterval:v10];
    }
    [(MSPSharedTripCapabilityFetchingQueue *)self _markHandlesInflight:v3];
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _fetchTextMessageReachability:v3];
  }
}

- (void)_fetchTextMessageReachability:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if ([v4 count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v6 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E4F6E1B0], *MEMORY[0x1E4F6E1A0], *MEMORY[0x1E4F6E198], 0);
    if (GEOConfigGetBOOL())
    {
      [v6 addObject:*MEMORY[0x1E4F6E1B8]];
      [v6 addObject:*MEMORY[0x1E4F6E1A8]];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      double v10 = v28;
      double v11 = &unk_1E617C940;
      do
      {
        uint64_t v12 = 0;
        uint64_t v25 = v8;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
          double v14 = MSPGetSharedTripCapabilityFetchingLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            double v15 = NSString;
            objc_super v16 = self;
            v17 = v10;
            uint64_t v18 = v9;
            __int16 v19 = self;
            uint64_t v20 = v6;
            uint64_t v21 = v11;
            v22 = v16;
            v23 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];

            double v11 = v21;
            v6 = v20;
            self = v19;
            uint64_t v9 = v18;
            double v10 = v17;
            uint64_t v8 = v25;
            *(_DWORD *)buf = 138543619;
            v35 = v23;
            __int16 v36 = 2113;
            uint64_t v37 = v13;
            _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[%{public}@] Will fetch best text service for %{private}@", buf, 0x16u);
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          v28[0] = __78__MSPSharedTripMessagesCapabilityFetchingQueue__fetchTextMessageReachability___block_invoke;
          v28[1] = v11;
          v28[2] = v13;
          v28[3] = self;
          id v29 = v6;
          dispatch_async(MEMORY[0x1E4F14428], block);

          ++v12;
        }
        while (v8 != v12);
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v8);
    }

    id v4 = v24;
  }
}

void __78__MSPSharedTripMessagesCapabilityFetchingQueue__fetchTextMessageReachability___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *(void *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  id v3 = *(id *)(a1 + 48);
  IMSPICalculateSendingServiceByDestinationsAndChatGUID();
}

void __78__MSPSharedTripMessagesCapabilityFetchingQueue__fetchTextMessageReachability___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void **)(v7 + 16);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  uint64_t v20 = __78__MSPSharedTripMessagesCapabilityFetchingQueue__fetchTextMessageReachability___block_invoke_3;
  uint64_t v21 = &unk_1E617C5B0;
  uint64_t v22 = v7;
  id v9 = v5;
  uint64_t v10 = a1[5];
  double v11 = (void *)a1[6];
  id v23 = v9;
  uint64_t v24 = v10;
  id v25 = v11;
  uint64_t v12 = v8;
  uint64_t v13 = v19;
  label = dispatch_queue_get_label(v12);
  double v15 = dispatch_queue_get_label(0);
  if (label != v15
    && (label ? (v17 = v15 == 0) : (v17 = 1), v17 || (double v15 = (const char *)strcmp(label, v15), v15)))
  {
    dispatch_async(v12, v13);
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1BA9C28D0](v15, v16);
    v20((uint64_t)v13);
  }
}

uint64_t __78__MSPSharedTripMessagesCapabilityFetchingQueue__fetchTextMessageReachability___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processFetchedServiceName:*(void *)(a1 + 40) forHandle:*(void *)(a1 + 48) permittedServiceNames:*(void *)(a1 + 56)];
}

- (void)_processFetchedServiceName:(id)a3 forHandle:(id)a4 permittedServiceNames:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if ([(MSPCountedOrderedSet *)self->super._requestedHandles containsObject:v9])
  {
    double v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(MSPSharedTripCapabilityFetchingQueue *)self _updateRequestedHandlesWithAdditions:0 subtractions:v11];

    uint64_t v12 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = NSString;
      double v14 = self;
      double v15 = [v13 stringWithFormat:@"%@<%p>", objc_opt_class(), v14];

      *(_DWORD *)buf = 138543875;
      long long v32 = v15;
      __int16 v33 = 2114;
      id v34 = v8;
      __int16 v35 = 2113;
      id v36 = v9;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Fetched service %{public}@ for %{private}@", buf, 0x20u);
    }
    if ([v10 containsObject:v8])
    {
      if (v8) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 2;
      }
      if (([v8 isEqualToString:*MEMORY[0x1E4F6E1B0]] & 1) != 0
        || [v8 isEqualToString:*MEMORY[0x1E4F6E1B8]])
      {
        uint64_t v17 = 3;
      }
      else
      {
        uint64_t v17 = 2;
      }
      v26 = [MSPSharedTripFetchedCapabilityStatus alloc];
      uint64_t v27 = v17;
      id v28 = v8;
      uint64_t v29 = v16;
    }
    else
    {
      uint64_t v22 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = NSString;
        uint64_t v24 = self;
        id v25 = [v23 stringWithFormat:@"%@<%p>", objc_opt_class(), v24];

        *(_DWORD *)buf = 138543618;
        long long v32 = v25;
        __int16 v33 = 2114;
        id v34 = v8;
        _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_INFO, "[%{public}@] - %{public}@ not permitted for Share ETA", buf, 0x16u);
      }
      v26 = [MSPSharedTripFetchedCapabilityStatus alloc];
      uint64_t v27 = 2;
      id v28 = 0;
      uint64_t v29 = 2;
    }
    long long v30 = [(MSPSharedTripFetchedCapabilityStatus *)v26 initWithCapabilityType:v27 serviceName:v28 status:v29];
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _processFetchedStatus:v30 forHandle:v9];
  }
  else
  {
    uint64_t v18 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = NSString;
      uint64_t v20 = self;
      uint64_t v21 = [v19 stringWithFormat:@"%@<%p>", objc_opt_class(), v20];

      *(_DWORD *)buf = 138543875;
      long long v32 = v21;
      __int16 v33 = 2114;
      id v34 = v8;
      __int16 v35 = 2113;
      id v36 = v9;
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Fetched service %{public}@ for %{private}@, but it was no longer in fetch queue, dropping", buf, 0x20u);
    }
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _resetIfNeeded];
  }
}

- (void)_processFetchedStatus:(id)a3 forHandle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if (v7)
  {
    id v8 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = NSString;
      id v10 = self;
      double v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];

      *(_DWORD *)buf = 138543875;
      uint64_t v13 = v11;
      __int16 v14 = 2113;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Fetched %{private}@: %{public}@@", buf, 0x20u);
    }
    [(NSMutableDictionary *)self->_fetchedStatusesByHandle setObject:v6 forKeyedSubscript:v7];
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _notifyDelegateIfNeeded];
  }
}

- (void)_notifyDelegateIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  uint64_t v3 = [(NSMutableDictionary *)self->_fetchedStatusesByHandle count];
  if (!v3) {
    return;
  }
  unint64_t v4 = v3;
  if (![(NSMutableOrderedSet *)self->super._inflightHandles count])
  {
    uint64_t v13 = MSPGetSharedTripCapabilityFetchingLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    __int16 v14 = NSString;
    id v15 = self;
    __int16 v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];

    *(_DWORD *)buf = 138543362;
    v26 = v16;
    id v17 = "[%{public}@] Will notify delegate, no more handles in-flight";
LABEL_12:
    uint64_t v20 = v13;
    uint32_t v21 = 12;
LABEL_15:
    _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_INFO, v17, buf, v21);

    goto LABEL_16;
  }
  batchDelayTimer = self->_batchDelayTimer;
  if (!batchDelayTimer)
  {
    uint64_t v13 = MSPGetSharedTripCapabilityFetchingLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    uint64_t v18 = NSString;
    __int16 v19 = self;
    __int16 v16 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19];

    *(_DWORD *)buf = 138543362;
    v26 = v16;
    id v17 = "[%{public}@] Will notify delegate, no delay timer";
    goto LABEL_12;
  }
  if (v4 >= self->_batchSize)
  {
    uint64_t v13 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = NSString;
      id v23 = self;
      __int16 v16 = [v22 stringWithFormat:@"%@<%p>", objc_opt_class(), v23];

      unint64_t batchSize = self->_batchSize;
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      __int16 v27 = 2048;
      unint64_t v28 = batchSize;
      id v17 = "[%{public}@] Will notify delegate, batch reached %lu items";
      uint64_t v20 = v13;
      uint32_t v21 = 22;
      goto LABEL_15;
    }
LABEL_16:

    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _notifyDelegateNow];
    return;
  }
  id v6 = [(GCDTimer *)batchDelayTimer fireDate];
  [v6 timeIntervalSinceNow];
  unint64_t v8 = v7;

  id v9 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSString;
    double v11 = self;
    uint64_t v12 = [v10 stringWithFormat:@"%@<%p>", objc_opt_class(), v11];

    *(_DWORD *)buf = 138543618;
    v26 = v12;
    __int16 v27 = 2048;
    unint64_t v28 = v8;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "[%{public}@] Cannot notify delegate, %lfs remaining until permitted", buf, 0x16u);
  }
}

- (void)_notifyDelegateNow
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_fetchedStatusesByHandle copy];
  if ([v3 count])
  {
    [(NSMutableDictionary *)self->_fetchedStatusesByHandle removeAllObjects];
    unint64_t v4 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSString;
      id v6 = self;
      unint64_t v7 = [v5 stringWithFormat:@"%@<%p>", objc_opt_class(), v6];

      *(_DWORD *)buf = 138543619;
      uint64_t v12 = v7;
      __int16 v13 = 2113;
      __int16 v14 = v3;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Notifying: %{private}@", buf, 0x16u);
    }
    callbackQueue = self->super._callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __66__MSPSharedTripMessagesCapabilityFetchingQueue__notifyDelegateNow__block_invoke;
    block[3] = &unk_1E617C510;
    block[4] = self;
    id v10 = v3;
    dispatch_async(callbackQueue, block);
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _scheduleBatchDelayTimerWithInterval:self->_batchDelayInterval];
  }
  [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _resetIfNeeded];
}

void __66__MSPSharedTripMessagesCapabilityFetchingQueue__notifyDelegateNow__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 capabilityFetchingQueue:*(void *)(a1 + 32) didFetchStatusForHandles:*(void *)(a1 + 40)];
}

- (void)_scheduleBatchDelayTimerWithInterval:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  batchDelayTimer = self->_batchDelayTimer;
  if (batchDelayTimer)
  {
    [(GCDTimer *)batchDelayTimer invalidate];
    id v6 = self->_batchDelayTimer;
    self->_batchDelayTimer = 0;
  }
  if (a3 >= 0.0)
  {
    unint64_t v7 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = NSString;
      id v9 = self;
      id v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

      *(_DWORD *)buf = 138543618;
      id v17 = v10;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Scheduling batch delay for %.3lfs", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    workQueue = self->super._workQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__MSPSharedTripMessagesCapabilityFetchingQueue__scheduleBatchDelayTimerWithInterval___block_invoke;
    v14[3] = &unk_1E617C918;
    objc_copyWeak(&v15, (id *)buf);
    v14[4] = self;
    uint64_t v12 = +[GCDTimer scheduledTimerWithTimeInterval:workQueue queue:0 repeating:v14 block:a3];
    __int16 v13 = self->_batchDelayTimer;
    self->_batchDelayTimer = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __85__MSPSharedTripMessagesCapabilityFetchingQueue__scheduleBatchDelayTimerWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unint64_t v4 = *(void **)(a1 + 32);
      if (v4)
      {
        id v5 = NSString;
        id v6 = v4;
        unint64_t v7 = [v5 stringWithFormat:@"%@<%p>", objc_opt_class(), v6];
      }
      else
      {
        unint64_t v7 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      double v11 = (const char *)v7;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Batch delay timer fired", buf, 0xCu);
    }
    id v9 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;

    [WeakRetained _notifyDelegateIfNeeded];
  }
  else
  {
    unint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v11 = "-[MSPSharedTripMessagesCapabilityFetchingQueue _scheduleBatchDelayTimerWithInterval:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 224;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

- (void)_resetIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if (![(NSMutableOrderedSet *)self->super._inflightHandles count]
    && (self->_batchSize || self->_batchDelayTimer))
  {
    uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];

      *(_DWORD *)buf = 138543362;
      unint64_t v8 = v6;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] No more in-flight handles, resetting flags and clearing batch delay timer", buf, 0xCu);
    }
    [(MSPSharedTripMessagesCapabilityFetchingQueue *)self _resetAfterLastHandleFetched];
  }
}

- (void)_resetAfterLastHandleFetched
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  self->_unint64_t batchSize = 0;
  self->_batchDelayInterval = -1.0;
  batchDelayTimer = self->_batchDelayTimer;
  self->_batchDelayTimer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchDelayTimer, 0);

  objc_storeStrong((id *)&self->_fetchedStatusesByHandle, 0);
}

@end