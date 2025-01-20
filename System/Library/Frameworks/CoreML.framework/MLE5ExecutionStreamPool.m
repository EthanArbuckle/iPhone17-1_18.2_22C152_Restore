@interface MLE5ExecutionStreamPool
- (MLE5ExecutionStreamPool)initWithModelConfiguration:(id)a3 modelSignpostId:(unint64_t)a4;
- (MLModelConfiguration)modelConfiguration;
- (NSMutableSet)allStreams;
- (NSMutableSet)pool;
- (OS_dispatch_queue)serialQueue;
- (id)takeOut;
- (unint64_t)modelSignpostId;
- (void)_emitMappingTracepointForStream:(id)a3;
- (void)enableInstrumentsTracing;
- (void)putBack:(id)a3;
@end

@implementation MLE5ExecutionStreamPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_allStreams, 0);
  objc_storeStrong((id *)&self->_pool, 0);

  objc_storeStrong((id *)&self->_modelConfiguration, 0);
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableSet)allStreams
{
  return self->_allStreams;
}

- (NSMutableSet)pool
{
  return self->_pool;
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)enableInstrumentsTracing
{
  v3 = [(MLE5ExecutionStreamPool *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MLE5ExecutionStreamPool_enableInstrumentsTracing__block_invoke;
  block[3] = &unk_1E59A5328;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __51__MLE5ExecutionStreamPool_enableInstrumentsTracing__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allStreams", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _emitMappingTracepointForStream:*(void *)(*((void *)&v6 + 1) + 8 * v5++)];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_emitMappingTracepointForStream:(id)a3
{
  id v4 = a3;
  [(MLE5ExecutionStreamPool *)self modelSignpostId];
  [v4 streamId];
  kdebug_trace();
}

- (void)putBack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MLE5ExecutionStreamPool *)self modelConfiguration];
  long long v6 = [v5 optimizationHints];

  if (v6)
  {
    long long v7 = [(MLE5ExecutionStreamPool *)self modelConfiguration];
    long long v8 = [v7 optimizationHints];
    [v8 hotHandDuration];
    double v10 = v9;
  }
  else
  {
    double v10 = 1.0;
  }
  [v4 resetAfterLingering:v10];
  uint64_t v11 = [(MLE5ExecutionStreamPool *)self serialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__MLE5ExecutionStreamPool_putBack___block_invoke;
  v13[3] = &unk_1E59A5458;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_sync(v11, v13);
}

void __35__MLE5ExecutionStreamPool_putBack___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pool];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)takeOut
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__3705;
  uint64_t v11 = __Block_byref_object_dispose__3706;
  id v12 = 0;
  uint64_t v3 = [(MLE5ExecutionStreamPool *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MLE5ExecutionStreamPool_takeOut__block_invoke;
  v6[3] = &unk_1E59A5300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  [(id)v8[5] cancelPendingReset];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__MLE5ExecutionStreamPool_takeOut__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) pool];
  uint64_t v2 = [v10 anyObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v11 = [*(id *)(a1 + 32) pool];
    [v11 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(MLE5ExecutionStream);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v12 = [*(id *)(a1 + 32) allStreams];
    [v12 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    long long v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 _emitMappingTracepointForStream:v9];
  }
}

- (MLE5ExecutionStreamPool)initWithModelConfiguration:(id)a3 modelSignpostId:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLE5ExecutionStreamPool;
  long long v8 = [(MLE5ExecutionStreamPool *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelConfiguration, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    pool = v9->_pool;
    v9->_pool = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    allStreams = v9->_allStreams;
    v9->_allStreams = (NSMutableSet *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreml.MLE5Engine.streamPoolQueue", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v14;

    v9->_modelSignpostId = a4;
  }

  return v9;
}

@end