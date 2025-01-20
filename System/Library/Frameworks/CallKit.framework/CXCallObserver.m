@interface CXCallObserver
- (CXCallObserver)init;
- (CXCallObserver)initWithDataSource:(id)a3 concurrentQueue:(id)a4;
- (CXCallObserverDataSource)dataSource;
- (CXCallObserverDelegate)delegate;
- (NSArray)calls;
- (OS_dispatch_queue)concurrentQueue;
- (OS_dispatch_queue)delegateQueue;
- (void)_performDelegateCallback:(id)a3;
- (void)dataSource:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (void)setDelegateQueue:(id)a3;
@end

@implementation CXCallObserver

uint64_t __53__CXCallObserver_initWithDataSource_concurrentQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addDelegate:");
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6 = delegate;
  v7 = queue;
  v8 = [(CXCallObserver *)self concurrentQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CXCallObserver_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  v13 = v7;
  v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

- (NSArray)calls
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v3 = [(CXCallObserver *)self concurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__CXCallObserver_calls__block_invoke;
  v6[3] = &unk_1E5CADEA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (CXCallObserver)init
{
  v3 = objc_alloc_init(CXCallObserverXPCClient);
  id v4 = [(CXCallObserverXPCClient *)v3 concurrentQueue];
  v5 = [(CXCallObserver *)self initWithDataSource:v3 concurrentQueue:v4];

  return v5;
}

- (CXCallObserver)initWithDataSource:(id)a3 concurrentQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXCallObserver;
  uint64_t v9 = [(CXCallObserver *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concurrentQueue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    concurrentQueue = v10->_concurrentQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CXCallObserver_initWithDataSource_concurrentQueue___block_invoke;
    block[3] = &unk_1E5CADD30;
    v14 = v10;
    dispatch_barrier_async(concurrentQueue, block);
  }
  return v10;
}

void __23__CXCallObserver_calls__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dataSource];
  v2 = [v6 callUUIDToCallMap];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CXCallObserverDataSource)dataSource
{
  return self->_dataSource;
}

uint64_t __36__CXCallObserver_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  uint64_t v3 = self->_dataSource;
  uint64_t v4 = [(CXCallObserver *)self concurrentQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CXCallObserver_dealloc__block_invoke;
  block[3] = &unk_1E5CADD30;
  id v8 = v3;
  v5 = v3;
  dispatch_barrier_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)CXCallObserver;
  [(CXCallObserver *)&v6 dealloc];
}

uint64_t __25__CXCallObserver_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  uint64_t v4 = [(CXCallObserver *)self concurrentQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(CXCallObserver *)self delegate];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    id v7 = [(CXCallObserver *)self delegateQueue];

    if (v7)
    {
      id v8 = [(CXCallObserver *)self delegateQueue];
      dispatch_async(v8, block);
    }
  }
}

- (void)dataSource:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CXCallObserver_dataSource_callChanged___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(CXCallObserver *)self _performDelegateCallback:v7];
}

void __41__CXCallObserver_dataSource_callChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callObserver:*(void *)(a1 + 32) callChanged:*(void *)(a1 + 40)];
}

- (CXCallObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallObserverDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end