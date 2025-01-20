@interface MSPSharedTripIDSCapabilityFetchingQueue
- (MSPSharedTripIDSCapabilityFetchingQueue)initWithIDSService:(id)a3 capabilityType:(unint64_t)a4 delegate:(id)a5 queue:(id)a6 label:(id)a7;
- (id)_processUpdates:(id)a3;
- (void)_processPendingHandles;
- (void)_retryAfterBackoff;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
@end

@implementation MSPSharedTripIDSCapabilityFetchingQueue

- (MSPSharedTripIDSCapabilityFetchingQueue)initWithIDSService:(id)a3 capabilityType:(unint64_t)a4 delegate:(id)a5 queue:(id)a6 label:(id)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSPSharedTripIDSCapabilityFetchingQueue;
  v13 = [(MSPSharedTripCapabilityFetchingQueue *)&v17 initWithDelegate:a5 queue:a6 label:a7];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    service = v13->_service;
    v13->_service = (NSString *)v14;

    v13->_capabilityType = a4;
  }

  return v13;
}

- (void)_processPendingHandles
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MSPSharedTripIDSCapabilityFetchingQueue;
  [(MSPSharedTripCapabilityFetchingQueue *)&v23 _processPendingHandles];
  if (!self->_retryAfterBackoffTimer)
  {
    v3 = [(MSPCountedOrderedSet *)self->super._requestedHandles contents];
    v6 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v3 count];
      service = self->_service;
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = v7;
      __int16 v26 = 2114;
      v27 = service;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "requesting %lu %{public}@ handles", buf, 0x16u);
    }

    uint64_t v9 = [v3 count];
    batchIDQueryController = self->_batchIDQueryController;
    if (v9)
    {
      if (!batchIDQueryController)
      {
        v11 = MSPGetSharedTripCapabilityFetchingLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v12 = NSString;
          v13 = self;
          uint64_t v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];

          *(_DWORD *)buf = 138543362;
          uint64_t v25 = (uint64_t)v14;
          _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Creating batch ID query controller", buf, 0xCu);
        }
        v15 = (IDSBatchIDQueryController *)[objc_alloc(MEMORY[0x1E4F6AAD8]) initWithService:self->_service delegate:self queue:self->super._workQueue];
        v16 = self->_batchIDQueryController;
        self->_batchIDQueryController = v15;
      }
      [(MSPSharedTripCapabilityFetchingQueue *)self _markHandlesInflight:v3];
      objc_super v17 = self->_batchIDQueryController;
      v18 = [v3 array];
      [(IDSBatchIDQueryController *)v17 setDestinations:v18];
    }
    else
    {
      if (!batchIDQueryController) {
        goto LABEL_17;
      }
      v19 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = NSString;
        v21 = self;
        v22 = [v20 stringWithFormat:@"%@<%p>", objc_opt_class(), v21];

        *(_DWORD *)buf = 138543362;
        uint64_t v25 = (uint64_t)v22;
        _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEBUG, "[%{public}@] Releasing batch ID query controller", buf, 0xCu);
      }
      [(IDSBatchIDQueryController *)self->_batchIDQueryController setDestinations:MEMORY[0x1E4F1CBF0]];
      [(IDSBatchIDQueryController *)self->_batchIDQueryController invalidate];
      v18 = self->_batchIDQueryController;
      self->_batchIDQueryController = 0;
    }

    goto LABEL_17;
  }
  v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(GCDTimer *)self->_retryAfterBackoffTimer fireDate];
    [v4 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v5;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "fetch queue updated but still backing off, %#.1lfs to go", buf, 0xCu);
  }
LABEL_17:
}

- (id)_processUpdates:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __59__MSPSharedTripIDSCapabilityFetchingQueue__processUpdates___block_invoke;
    v15 = &unk_1E617D908;
    v16 = self;
    id v17 = v5;
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:&v12];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = objc_msgSend(v4, "allKeys", v12, v13, v14, v15, v16);
    uint64_t v9 = [v7 setWithArray:v8];
    [(MSPSharedTripCapabilityFetchingQueue *)self _updateRequestedHandlesWithAdditions:0 subtractions:v9];

    v10 = (void *)[v6 copy];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

void __59__MSPSharedTripIDSCapabilityFetchingQueue__processUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = -[MSPSharedTripFetchedCapabilityStatus initWithCapabilityType:serviceName:status:]([MSPSharedTripFetchedCapabilityStatus alloc], "initWithCapabilityType:serviceName:status:", *(void *)(*(void *)(a1 + 32) + 72), 0, [a3 integerValue]);
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._workQueue);
  if (![v10 isEqualToString:self->_service]) {
    goto LABEL_32;
  }
  if (v11)
  {
    uint64_t v12 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSString;
      uint64_t v14 = self;
      v15 = [v13 stringWithFormat:@"%@<%p>", objc_opt_class(), v14];

      *(_DWORD *)buf = 138543874;
      v62 = v15;
      __int16 v63 = 2112;
      double v64 = *(double *)&v10;
      __int16 v65 = 2112;
      id v66 = v11;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] (%@) updatedDestinationsStatus error %@", buf, 0x20u);
    }
    uint64_t v16 = [v11 code];
    if (v16 == -2000 || v16 == -3000)
    {
      if (v9)
      {
LABEL_22:
        v34 = MSPGetSharedTripCapabilityFetchingLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          if (self)
          {
            v35 = NSString;
            v36 = self;
            v37 = [v35 stringWithFormat:@"%@<%p>", objc_opt_class(), v36];
          }
          else
          {
            v37 = @"<nil>";
          }
          service = self->_service;
          *(_DWORD *)buf = 138543875;
          v62 = v37;
          __int16 v63 = 2114;
          double v64 = *(double *)&service;
          __int16 v65 = 2113;
          id v66 = v9;
          _os_log_impl(&dword_1B87E5000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] idStatusUpdatedForDestinations %{public}@ service: %{private}@", buf, 0x20u);
        }
        v39 = [(MSPSharedTripIDSCapabilityFetchingQueue *)self _processUpdates:v9];
        callbackQueue = self->super._callbackQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __106__MSPSharedTripIDSCapabilityFetchingQueue_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_13;
        block[3] = &unk_1E617C510;
        block[4] = self;
        id v54 = v39;
        id v41 = v39;
        dispatch_async(callbackQueue, block);

        goto LABEL_28;
      }
      id v52 = v10;
      v24 = [v11 userInfo];
      uint64_t v25 = [v24 objectForKeyedSubscript:@"destinations"];

      __int16 v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v25, "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v27 = v25;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v56 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            v33 = [NSNumber numberWithInteger:-1];
            [v26 setObject:v33 forKeyedSubscript:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v29);
      }

      id v9 = (id)[v26 copy];
      id v10 = v52;
    }
    else if (v16 == -4000)
    {
      GEOConfigGetDouble();
      double v18 = v17;
      retryAfterBackoffTimer = self->_retryAfterBackoffTimer;
      v20 = MSPGetSharedTripCapabilityFetchingLog();
      v21 = v20;
      if (retryAfterBackoffTimer)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = [(GCDTimer *)self->_retryAfterBackoffTimer fireDate];
          [v22 timeIntervalSinceNow];
          *(_DWORD *)buf = 134217984;
          v62 = v23;
          _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_INFO, "another back-off error, but still backing off, %#.1lfs to go", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v46 = NSString;
          v47 = self;
          v48 = [v46 stringWithFormat:@"%@<%p>", objc_opt_class(), v47];

          *(_DWORD *)buf = 138543618;
          v62 = v48;
          __int16 v63 = 2048;
          double v64 = v18;
          _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] need to back off, will retry in %#.1lfs", buf, 0x16u);
        }
        workQueue = self->super._workQueue;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __106__MSPSharedTripIDSCapabilityFetchingQueue_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
        v59[3] = &unk_1E617D930;
        v59[4] = self;
        v50 = +[GCDTimer scheduledTimerWithTimeInterval:workQueue queue:0 repeating:v59 block:v18];
        v51 = self->_retryAfterBackoffTimer;
        self->_retryAfterBackoffTimer = v50;
      }
      goto LABEL_32;
    }
  }
  if (v9) {
    goto LABEL_22;
  }
LABEL_28:
  [(MSPSharedTripIDSCapabilityFetchingQueue *)self _processPendingHandles];
  if (self->_retryAfterBackoffTimer)
  {
    v42 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = NSString;
      v44 = self;
      v45 = [v43 stringWithFormat:@"%@<%p>", objc_opt_class(), v44];

      *(_DWORD *)buf = 138543362;
      v62 = v45;
      _os_log_impl(&dword_1B87E5000, v42, OS_LOG_TYPE_INFO, "[%{public}@] Got a callback while backing off, fire immediately to trigger updates for both services", buf, 0xCu);
    }
    [(GCDTimer *)self->_retryAfterBackoffTimer invalidate];
    [(MSPSharedTripIDSCapabilityFetchingQueue *)self _retryAfterBackoff];
  }
LABEL_32:
}

uint64_t __106__MSPSharedTripIDSCapabilityFetchingQueue_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryAfterBackoff];
}

void __106__MSPSharedTripIDSCapabilityFetchingQueue_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_13(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 capabilityFetchingQueue:*(void *)(a1 + 32) didFetchStatusForHandles:*(void *)(a1 + 40)];
}

- (void)_retryAfterBackoff
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];
    }
    else
    {
      id v6 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[%{public}@] retrying fetch in response to IDSBatchQueryController back-off", buf, 0xCu);
  }
  retryAfterBackoffTimer = self->_retryAfterBackoffTimer;
  self->_retryAfterBackoffTimer = 0;

  [(MSPSharedTripIDSCapabilityFetchingQueue *)self _processPendingHandles];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAfterBackoffTimer, 0);
  objc_storeStrong((id *)&self->_batchIDQueryController, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end