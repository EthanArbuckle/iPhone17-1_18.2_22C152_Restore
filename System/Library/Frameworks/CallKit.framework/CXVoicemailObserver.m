@interface CXVoicemailObserver
- (CXVoicemailObserver)init;
- (CXVoicemailObserver)initWithDataSource:(id)a3 queue:(id)a4;
- (CXVoicemailObserverDataSource)dataSource;
- (CXVoicemailObserverDelegate)delegate;
- (NSArray)voicemails;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (void)_performDelegateCallback:(id)a3;
- (void)dataSourceVoicemailsChanged:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
@end

@implementation CXVoicemailObserver

- (CXVoicemailObserver)init
{
  v3 = objc_alloc_init(CXVoicemailObserverXPCClient);
  v4 = [(CXVoicemailObserverXPCClient *)v3 queue];
  v5 = [(CXVoicemailObserver *)self initWithDataSource:v3 queue:v4];

  return v5;
}

- (CXVoicemailObserver)initWithDataSource:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXVoicemailObserver;
  v9 = [(CXVoicemailObserver *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    queue = v10->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CXVoicemailObserver_initWithDataSource_queue___block_invoke;
    block[3] = &unk_1E5CADD30;
    v14 = v10;
    dispatch_async(queue, block);
  }
  return v10;
}

uint64_t __48__CXVoicemailObserver_initWithDataSource_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addDelegate:");
}

- (void)dealloc
{
  v3 = self->_dataSource;
  v4 = [(CXVoicemailObserver *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CXVoicemailObserver_dealloc__block_invoke;
  block[3] = &unk_1E5CADD30;
  id v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailObserver;
  [(CXVoicemailObserver *)&v6 dealloc];
}

uint64_t __30__CXVoicemailObserver_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (NSArray)voicemails
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(CXVoicemailObserver *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CXVoicemailObserver_voicemails__block_invoke;
  v6[3] = &unk_1E5CADEA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__CXVoicemailObserver_voicemails__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dataSource];
  v2 = [v6 voicemailUUIDToVoicemailMap];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXVoicemailObserver *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CXVoicemailObserver_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __41__CXVoicemailObserver_setDelegate_queue___block_invoke(uint64_t a1)
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

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  uint64_t v4 = [(CXVoicemailObserver *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(CXVoicemailObserver *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(CXVoicemailObserver *)self delegateQueue];

    if (v7)
    {
      id v8 = [(CXVoicemailObserver *)self delegateQueue];
      dispatch_async(v8, block);
    }
  }
}

- (void)dataSourceVoicemailsChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__CXVoicemailObserver_dataSourceVoicemailsChanged___block_invoke;
  v3[3] = &unk_1E5CADD30;
  v3[4] = self;
  [(CXVoicemailObserver *)self _performDelegateCallback:v3];
}

void __51__CXVoicemailObserver_dataSourceVoicemailsChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 voicemailObserverVoicemailsChanged:*(void *)(a1 + 32)];
}

- (CXVoicemailObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXVoicemailObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXVoicemailObserverDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end