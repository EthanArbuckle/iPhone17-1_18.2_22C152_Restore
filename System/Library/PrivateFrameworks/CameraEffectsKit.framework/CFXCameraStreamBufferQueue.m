@interface CFXCameraStreamBufferQueue
- (BOOL)enqueue:(id)a3;
- (CFXCameraStreamBufferQueue)initWithMaxCapacity:(unint64_t)a3;
- (NSMutableArray)outputBuffers;
- (OS_dispatch_queue)accessQueue;
- (double)headBufferTimestamp;
- (id)dequeue;
- (unint64_t)count;
- (unint64_t)maxCapacity;
- (void)setAccessQueue:(id)a3;
- (void)setMaxCapacity:(unint64_t)a3;
- (void)setOutputBuffers:(id)a3;
@end

@implementation CFXCameraStreamBufferQueue

- (CFXCameraStreamBufferQueue)initWithMaxCapacity:(unint64_t)a3
{
  self->_maxCapacity = a3;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  outputBuffers = self->_outputBuffers;
  self->_outputBuffers = v4;

  JFXCreateDispatchQueue(self, @"bufferQueueAccessQueue", 0);
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  self->_accessQueue = v6;

  return self;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(CFXCameraStreamBufferQueue *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__CFXCameraStreamBufferQueue_count__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__CFXCameraStreamBufferQueue_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outputBuffers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)dequeue
{
  if ([(CFXCameraStreamBufferQueue *)self count])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    v3 = [(CFXCameraStreamBufferQueue *)self accessQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__CFXCameraStreamBufferQueue_dequeue__block_invoke;
    v6[3] = &unk_264C09EE8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __37__CFXCameraStreamBufferQueue_dequeue__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outputBuffers];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) outputBuffers];
  [v6 removeObjectAtIndex:0];
}

- (BOOL)enqueue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CFXCameraStreamBufferQueue *)self count];
  unint64_t v6 = [(CFXCameraStreamBufferQueue *)self maxCapacity];
  if (v5 < v6)
  {
    uint64_t v7 = [(CFXCameraStreamBufferQueue *)self accessQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__CFXCameraStreamBufferQueue_enqueue___block_invoke;
    v9[3] = &unk_264C09F10;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(v7, v9);
  }
  return v5 < v6;
}

void __38__CFXCameraStreamBufferQueue_enqueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outputBuffers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (double)headBufferTimestamp
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(CFXCameraStreamBufferQueue *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CFXCameraStreamBufferQueue_headBufferTimestamp__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__CFXCameraStreamBufferQueue_headBufferTimestamp__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) outputBuffers];
  id v2 = [v4 firstObject];
  [v2 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableArray)outputBuffers
{
  return self->_outputBuffers;
}

- (void)setOutputBuffers:(id)a3
{
}

- (unint64_t)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(unint64_t)a3
{
  self->_maxCapacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end