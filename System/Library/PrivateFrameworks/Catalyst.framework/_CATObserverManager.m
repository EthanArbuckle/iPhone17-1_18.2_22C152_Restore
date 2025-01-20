@interface _CATObserverManager
- (_CATObserverManager)initWithOperation:(id)a3;
- (void)addObserver:(id)a3;
- (void)notifyObserversOperationDidProgress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationDidFinish:(id)a3;
- (void)operationDidProgress:(id)a3;
- (void)operationDidStart:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation _CATObserverManager

- (_CATObserverManager)initWithOperation:(id)a3
{
  v5 = (CATOperation *)a3;
  if (!v5)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CATOperation.m", 475, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)_CATObserverManager;
  v6 = [(_CATObserverManager *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->mOperation = v5;
    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    v10 = [(CATOperation *)v5 UUID];
    v11 = [v10 UUIDString];
    id v12 = [v8 stringWithFormat:@"%@.%@", v9, v11];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    mQueue = v7->mQueue;
    v7->mQueue = (OS_dispatch_queue *)v13;

    objc_initWeak(&location, v7);
    objc_initWeak(&from, v5);
    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, (dispatch_queue_t)v7->mQueue);
    mProgressSource = v7->mProgressSource;
    v7->mProgressSource = (OS_dispatch_source *)v15;

    v17 = v7->mProgressSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __41___CATObserverManager_initWithOperation___block_invoke;
    handler[3] = &unk_2641DC098;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume((dispatch_object_t)v7->mProgressSource);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATOperation.m", 498, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  v6 = self->mOperation;
  mQueue = self->mQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35___CATObserverManager_addObserver___block_invoke;
  v13[3] = &unk_2641DBE10;
  id v14 = v5;
  dispatch_source_t v15 = self;
  v16 = v6;
  v8 = v13;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v18 = v8;
  uint64_t v9 = mQueue;
  v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  mQueue = self->mQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38___CATObserverManager_removeObserver___block_invoke;
  v9[3] = &unk_2641DC0C0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  v6 = v9;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v14 = v6;
  v7 = mQueue;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)operationDidStart:(id)a3
{
  id v5 = (CATOperation *)a3;
  if (self->mOperation != v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CATOperation.m", 556, @"%@ cannot call %@ with an operation (%@) not being observed", self, v11, v5 object file lineNumber description];
  }
  [(CATOperation *)v5 addObserver:self forKeyPath:@"completedUnitCount" options:7 context:@"_CATOperationCompletedUnitCountObservationContext"];
  mQueue = self->mQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41___CATObserverManager_operationDidStart___block_invoke;
  v12[3] = &unk_2641DC000;
  v12[4] = self;
  dispatch_queue_t v13 = v5;
  v7 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v15 = v7;
  id v8 = mQueue;
  uint64_t v9 = v5;
  dispatch_async(v8, block);
}

- (void)operationDidProgress:(id)a3
{
  if (self->mOperation != a3)
  {
    id v8 = (void *)MEMORY[0x263F08690];
    id v9 = a3;
    id v10 = [v8 currentHandler];
    id v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CATOperation.m", 586, @"%@ cannot call %@ with an operation (%@) not being observed", self, v11, v9 object file lineNumber description];
  }
  mQueue = self->mQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44___CATObserverManager_operationDidProgress___block_invoke;
  v12[3] = &unk_2641DBE60;
  v12[4] = self;
  id v5 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v14 = v5;
  v6 = mQueue;
  dispatch_async(v6, block);
}

- (void)notifyObserversOperationDidProgress:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && (self->mState - 5) >= 0xFFFFFFFE)
  {
    id v5 = [(NSMutableSet *)self->mObservers allObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 operationDidProgress:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)operationDidFinish:(id)a3
{
  id v5 = (CATOperation *)a3;
  if (self->mOperation != v5)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    long long v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CATOperation.m", 612, @"%@ cannot call %@ with an operation (%@) not being observed", self, v11, v5 object file lineNumber description];
  }
  mQueue = self->mQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42___CATObserverManager_operationDidFinish___block_invoke;
  v12[3] = &unk_2641DC000;
  v12[4] = self;
  long long v13 = v5;
  uint64_t v7 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v15 = v7;
  uint64_t v8 = mQueue;
  uint64_t v9 = v5;
  dispatch_async(v8, block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (a6 == @"_CATOperationCompletedUnitCountObservationContext")
  {
    uint64_t v12 = *MEMORY[0x263F081C8];
    id v13 = a5;
    long long v14 = [v13 objectForKeyedSubscript:v12];
    uint64_t v15 = [v14 integerValue];

    uint64_t v16 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    uint64_t v17 = [v16 integerValue];
    if (v15 == v17) {
      goto LABEL_4;
    }
    id v11 = v10;
    if (v17 < [v11 totalUnitCount]) {
      [(_CATObserverManager *)self operationDidProgress:v11];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_CATObserverManager;
    id v11 = a5;
    [(_CATObserverManager *)&v18 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }

LABEL_4:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStrongOperation, 0);
  objc_storeStrong((id *)&self->mProgressSource, 0);
  objc_storeStrong((id *)&self->mQueue, 0);

  objc_storeStrong((id *)&self->mObservers, 0);
}

@end