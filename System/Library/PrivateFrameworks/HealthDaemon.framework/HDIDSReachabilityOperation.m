@interface HDIDSReachabilityOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (HDIDSReachabilityOperation)initWithIdentifers:(id)a3 serviceIdentifier:(id)a4 updateHandler:(id)a5;
- (IDSBatchIDQueryController)queryController;
- (uint64_t)_finish;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)cancel;
- (void)setQueryController:(id)a3;
- (void)start;
- (void)unitTest_updateOperationTimeout:(unint64_t)a3;
- (void)updateDestinations:(id)a3;
@end

@implementation HDIDSReachabilityOperation

- (HDIDSReachabilityOperation)initWithIdentifers:(id)a3 serviceIdentifier:(id)a4 updateHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDIDSReachabilityOperation;
  v12 = [(HDIDSReachabilityOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_destinationIdentifiers, a3);
    objc_storeStrong((id *)&v13->_serviceIdentifier, a4);
    uint64_t v14 = [v11 copy];
    id updateHandler = v13->_updateHandler;
    v13->_id updateHandler = (id)v14;

    v13->_queryTimeout = 60;
    v13->_finished = 0;
    v13->_executing = 0;
  }

  return v13;
}

- (void)start
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!self->_queryController)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDIDSReachabilityOperation.m", 54, @"Invalid parameter not satisfying: %@", @"_queryController != nil" object file lineNumber description];
  }
  if ([(HDIDSReachabilityOperation *)self isCancelled])
  {
    _HKInitializeLogging();
    v3 = HKLogSharing();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: We've been cancelled while in the operation queue.", buf, 0xCu);
    }
  }
  else
  {
    [(HDIDSReachabilityOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(HDIDSReachabilityOperation *)self didChangeValueForKey:@"isExecuting"];
    _HKInitializeLogging();
    v4 = HKLogSharing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v5 = [(NSArray *)self->_destinationIdentifiers count];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Starting reachability operation for %ld identifiers", buf, 0x16u);
    }

    [(IDSBatchIDQueryController *)self->_queryController setDestinations:self->_destinationIdentifiers];
    v6 = [MEMORY[0x1E4F28F08] currentQueue];
    v3 = [v6 underlyingQueue];

    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
    timer = self->_timer;
    self->_timer = v7;

    id v9 = self->_timer;
    dispatch_time_t v10 = dispatch_time(0, 1000000000 * self->_queryTimeout);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    id v11 = self->_timer;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __41__HDIDSReachabilityOperation__startTimer__block_invoke;
    v16 = &unk_1E62F6BD0;
    objc_copyWeak(v17, &location);
    dispatch_source_set_event_handler(v11, buf);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
}

- (void)updateDestinations:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  NSUInteger v5 = HKLogSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating reachability operation for %ld identifiers", (uint8_t *)&v8, 0x16u);
  }

  [(IDSBatchIDQueryController *)self->_queryController setDestinations:v4];
  timer = self->_timer;
  if (timer)
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * self->_queryTimeout);
    dispatch_source_set_timer(timer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: The reachability operation has been cancelled.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HDIDSReachabilityOperation;
  [(HDIDSReachabilityOperation *)&v4 cancel];
  -[HDIDSReachabilityOperation _finish]((uint64_t)self);
}

- (uint64_t)_finish
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 256) invalidate];
    v2 = *(NSObject **)(v1 + 288);
    if (v2) {
      dispatch_source_cancel(v2);
    }
    [(id)v1 willChangeValueForKey:@"isFinished"];
    [(id)v1 willChangeValueForKey:@"isExecuting"];
    *(unsigned char *)(v1 + 249) = 0;
    *(unsigned char *)(v1 + 248) = 1;
    [(id)v1 didChangeValueForKey:@"isExecuting"];
    return [(id)v1 didChangeValueForKey:@"isFinished"];
  }
  return result;
}

void __41__HDIDSReachabilityOperation__startTimer__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    uint64_t v1 = HKLogSharing();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: The reachability operation has timed out.", buf, 0xCu);
    }

    -[HDIDSReachabilityOperation _finish]((uint64_t)WeakRetained);
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isReady
{
  return 1;
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(HDIDSReachabilityOperation *)self isCancelled])
  {
    _HKInitializeLogging();
    uint64_t v12 = HKLogSharing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      objc_super v17 = self;
      v13 = "[summary-sharing] %{public}@: We got a reachability callback but we are already cancelled.";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
  }
  else if ([v10 isEqualToString:self->_serviceIdentifier])
  {
    uint64_t v12 = objc_msgSend(v9, "hk_map:", &__block_literal_global_233);
    (*((void (**)(void))self->_updateHandler + 2))();
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = HKLogSharing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      objc_super v17 = self;
      __int16 v18 = 2112;
      id v19 = v10;
      v13 = "[summary-sharing] %{public}@: We got a reachability callback with the incorrect service identifier %@";
      uint64_t v14 = v12;
      uint32_t v15 = 22;
      goto LABEL_8;
    }
  }
}

void __93__HDIDSReachabilityOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = a4;
  id v6 = a3;
  id v7 = (id)IDSCopyRawAddressForDestination();
  v5[2](v5, v7, v6);
}

- (void)unitTest_updateOperationTimeout:(unint64_t)a3
{
  self->_queryTimeout = a3;
}

- (IDSBatchIDQueryController)queryController
{
  return self->_queryController;
}

- (void)setQueryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifiers, 0);

  objc_storeStrong((id *)&self->_queryController, 0);
}

@end