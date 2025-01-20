@interface HKGraphViewTileThread
- (BOOL)_laterRenderingExists:(id)a3;
- (HKGraphView)graphView;
- (HKGraphViewTileThread)initWithGraphView:(id)a3;
- (NSLock)queueLock;
- (NSMutableArray)rendererQueue;
- (OS_dispatch_semaphore)queueSemaphore;
- (void)cancel;
- (void)main;
- (void)scheduleRedrawUsingRenderer:(id)a3;
- (void)setGraphView:(id)a3;
- (void)setRendererQueue:(id)a3;
@end

@implementation HKGraphViewTileThread

- (HKGraphViewTileThread)initWithGraphView:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKGraphViewTileThread;
  v5 = [(HKGraphViewTileThread *)&v13 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    queueLock = v5->_queueLock;
    v5->_queueLock = v6;

    [(NSLock *)v5->_queueLock setName:@"HKGraphViewTileThreadLock"];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    queueSemaphore = v5->_queueSemaphore;
    v5->_queueSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rendererQueue = v5->_rendererQueue;
    v5->_rendererQueue = v10;

    objc_storeWeak((id *)&v5->_graphView, v4);
  }

  return v5;
}

- (void)main
{
  v3 = (void *)MEMORY[0x1E4E40740](self, a2);
  if (([(HKGraphViewTileThread *)self isCancelled] & 1) == 0)
  {
    do
    {
      id v4 = (void *)MEMORY[0x1E4E40740]();
      v5 = [(HKGraphViewTileThread *)self queueSemaphore];
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

      [(NSLock *)self->_queueLock lock];
      v6 = [(HKGraphViewTileThread *)self rendererQueue];
      v7 = [v6 firstObject];

      if (v7)
      {
        dispatch_semaphore_t v8 = [(HKGraphViewTileThread *)self rendererQueue];
        [v8 removeObjectAtIndex:0];

        if (![(HKGraphViewTileThread *)self _laterRenderingExists:v7])
        {
          [(NSLock *)self->_queueLock unlock];
          v9 = [(HKGraphViewTileThread *)self graphView];
          if (v9) {
            [v7 renderTileContent];
          }

          goto LABEL_9;
        }
      }
      [(NSLock *)self->_queueLock unlock];
LABEL_9:
    }
    while (![(HKGraphViewTileThread *)self isCancelled]);
  }
}

- (BOOL)_laterRenderingExists:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HKGraphViewTileThread *)self rendererQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) sameForRendering:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)scheduleRedrawUsingRenderer:(id)a3
{
  queueLock = self->_queueLock;
  id v5 = a3;
  [(NSLock *)queueLock lock];
  uint64_t v6 = [(HKGraphViewTileThread *)self rendererQueue];
  [v6 addObject:v5];

  [(NSLock *)self->_queueLock unlock];
  uint64_t v7 = [(HKGraphViewTileThread *)self queueSemaphore];
  dispatch_semaphore_signal(v7);
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)HKGraphViewTileThread;
  [(HKGraphViewTileThread *)&v4 cancel];
  v3 = [(HKGraphViewTileThread *)self queueSemaphore];
  dispatch_semaphore_signal(v3);
}

- (NSLock)queueLock
{
  return self->_queueLock;
}

- (OS_dispatch_semaphore)queueSemaphore
{
  return self->_queueSemaphore;
}

- (NSMutableArray)rendererQueue
{
  return self->_rendererQueue;
}

- (void)setRendererQueue:(id)a3
{
}

- (HKGraphView)graphView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphView);
  return (HKGraphView *)WeakRetained;
}

- (void)setGraphView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graphView);
  objc_storeStrong((id *)&self->_rendererQueue, 0);
  objc_storeStrong((id *)&self->_queueSemaphore, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end