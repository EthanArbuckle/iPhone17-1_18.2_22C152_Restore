@interface _CATArbitratorRegistrationEntry
- (_CATArbitratorRegistrationEntry)initWithResource:(id)a3 maxConcurrentCount:(unint64_t)a4;
- (id)makeResourceProxyIfPossible:(BOOL)a3;
- (id)makeResourceProxyIfPossibleWithoutLocking:(BOOL)a3;
- (id)waitForResourceWithExclusive:(BOOL)a3 group:(id)a4;
- (unint64_t)currentCount;
- (void)invalidate;
- (void)pendingWaitsNeedServicing;
- (void)resourceProxyDidInvalidate:(id)a3;
- (void)servicePendingWaitTokens;
@end

@implementation _CATArbitratorRegistrationEntry

- (_CATArbitratorRegistrationEntry)initWithResource:(id)a3 maxConcurrentCount:(unint64_t)a4
{
  id v8 = a3;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"CATArbitrator.m", 354, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"CATArbitrator.m", 355, @"Invalid parameter not satisfying: %@", @"maxConcurrentCount > 0" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)_CATArbitratorRegistrationEntry;
  v9 = [(_CATArbitratorRegistrationEntry *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->mResource, a3);
    v10->mMaxConcurrentCount = a4;
    uint64_t v11 = objc_opt_new();
    mPendingWaits = v10->mPendingWaits;
    v10->mPendingWaits = (NSMutableArray *)v11;

    id v13 = [NSString stringWithFormat:@"%@.%p.pending-waits", objc_opt_class(), v10];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    mPendingWaitsQueue = v10->mPendingWaitsQueue;
    v10->mPendingWaitsQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v10);
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, (dispatch_queue_t)v10->mPendingWaitsQueue);
    mPendingWaitsSource = v10->mPendingWaitsSource;
    v10->mPendingWaitsSource = (OS_dispatch_source *)v16;

    v18 = v10->mPendingWaitsSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __71___CATArbitratorRegistrationEntry_initWithResource_maxConcurrentCount___block_invoke;
    handler[3] = &unk_2641DBCB0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume((dispatch_object_t)v10->mPendingWaitsSource);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (id)makeResourceProxyIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->mPendingWaits;
  objc_sync_enter(v5);
  if (self->_currentCount >= self->mMaxConcurrentCount)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(_CATArbitratorRegistrationEntry *)self makeResourceProxyIfPossibleWithoutLocking:v3];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)waitForResourceWithExclusive:(BOOL)a3 group:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = self->mPendingWaits;
  objc_sync_enter(v7);
  id v8 = [[_CATProxyWaitToken alloc] initWithExclusive:v4 group:v6];
  [(NSMutableArray *)self->mPendingWaits addObject:v8];
  [(_CATArbitratorRegistrationEntry *)self pendingWaitsNeedServicing];
  objc_sync_exit(v7);

  return v8;
}

- (void)invalidate
{
  BOOL v3 = self->mPendingWaits;
  objc_sync_enter(v3);
  id mResource = self->mResource;
  self->id mResource = 0;

  self->mMaxConcurrentCount = 0;
  v5 = (void *)[(NSMutableArray *)self->mPendingWaits copy];
  [(NSMutableArray *)self->mPendingWaits removeAllObjects];
  [v5 makeObjectsPerformSelector:sel_cancel];

  objc_sync_exit(v3);
  mPendingWaitsSource = self->mPendingWaitsSource;

  dispatch_source_cancel(mPendingWaitsSource);
}

- (void)resourceProxyDidInvalidate:(id)a3
{
  id v7 = a3;
  BOOL v4 = self->mPendingWaits;
  objc_sync_enter(v4);
  if ([v7 isExclusive])
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t currentCount = self->_currentCount;
    if (!currentCount) {
      goto LABEL_6;
    }
    unint64_t v5 = currentCount - 1;
  }
  self->_unint64_t currentCount = v5;
LABEL_6:
  [(_CATArbitratorRegistrationEntry *)self pendingWaitsNeedServicing];
  objc_sync_exit(v4);
}

- (void)pendingWaitsNeedServicing
{
  obj = self->mPendingWaits;
  objc_sync_enter(obj);
  if ([(NSMutableArray *)self->mPendingWaits count]) {
    dispatch_source_merge_data((dispatch_source_t)self->mPendingWaitsSource, 1uLL);
  }
  objc_sync_exit(obj);
}

- (void)servicePendingWaitTokens
{
  while (1)
  {
    BOOL v3 = self->mPendingWaits;
    objc_sync_enter(v3);
    if (![(NSMutableArray *)self->mPendingWaits count])
    {
      objc_sync_exit(v3);
      unint64_t v5 = v3;
      goto LABEL_7;
    }
    id v6 = [(NSMutableArray *)self->mPendingWaits firstObject];
    BOOL v4 = [(_CATArbitratorRegistrationEntry *)self makeResourceProxyIfPossibleWithoutLocking:[(NSMutableArray *)v6 isExclusive]];
    if (!v4) {
      break;
    }
    [(NSMutableArray *)self->mPendingWaits removeObjectAtIndex:0];
    objc_sync_exit(v3);

    [(NSMutableArray *)v6 notifyWithResourceProxy:v4];
    if (dispatch_source_testcancel((dispatch_source_t)self->mPendingWaitsSource)) {
      return;
    }
  }
  objc_sync_exit(v3);

  unint64_t v5 = v6;
LABEL_7:
}

- (id)makeResourceProxyIfPossibleWithoutLocking:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = self->mPendingWaits;
  objc_sync_enter(v5);
  unint64_t currentCount = self->_currentCount;
  if (!v3)
  {
    if (currentCount >= self->mMaxConcurrentCount) {
      goto LABEL_3;
    }
LABEL_5:
    id v7 = [[_CATArbitratorResourceProxy alloc] initWithResource:self->mResource registration:self exclusive:v3];
    if (v3) {
      mMaxConunint64_t currentCount = self->mMaxConcurrentCount;
    }
    else {
      mMaxConunint64_t currentCount = self->_currentCount + 1;
    }
    self->_unint64_t currentCount = mMaxConcurrentCount;
    goto LABEL_9;
  }
  if (!currentCount) {
    goto LABEL_5;
  }
LABEL_3:
  id v7 = 0;
LABEL_9:
  objc_sync_exit(v5);

  return v7;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPendingWaitsQueue, 0);
  objc_storeStrong((id *)&self->mPendingWaitsSource, 0);
  objc_storeStrong((id *)&self->mPendingWaits, 0);

  objc_storeStrong(&self->mResource, 0);
}

@end