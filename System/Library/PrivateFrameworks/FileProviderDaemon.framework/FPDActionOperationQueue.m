@interface FPDActionOperationQueue
- (FPDActionOperationQueue)initWithMoveInfo:(id)a3;
- (id)dequeue;
- (void)cancel;
- (void)dumpStateTo:(id)a3;
- (void)enqueue:(id)a3;
- (void)finishedEnqueuing;
@end

@implementation FPDActionOperationQueue

- (FPDActionOperationQueue)initWithMoveInfo:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FPDActionOperationQueue;
  v5 = [(FPDActionOperationQueue *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)[v4 qos], 0);
    dispatch_queue_t v8 = dispatch_queue_create("FileProvider.move-queue", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    fifo = v5->_fifo;
    v5->_fifo = (NSMutableArray *)v10;

    v5->_intptr_t maxLength = 128;
    if (objc_msgSend(v4, "_t_moveQueueWidth"))
    {
      intptr_t maxLength = objc_msgSend(v4, "_t_moveQueueWidth");
      v5->_intptr_t maxLength = maxLength;
    }
    else
    {
      intptr_t maxLength = v5->_maxLength;
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(maxLength);
    enqueueSema = v5->_enqueueSema;
    v5->_enqueueSema = (OS_dispatch_semaphore *)v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    dequeueSema = v5->_dequeueSema;
    v5->_dequeueSema = (OS_dispatch_semaphore *)v15;
  }
  return v5;
}

- (void)enqueue:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FPDActionOperationQueue_enqueue___block_invoke;
  block[3] = &unk_1E6A74960;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v11 + 24))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_enqueueSema, 0xFFFFFFFFFFFFFFFFLL);
    v6 = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__FPDActionOperationQueue_enqueue___block_invoke_2;
    v7[3] = &unk_1E6A736C0;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(v6, v7);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __35__FPDActionOperationQueue_enqueue___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

void __35__FPDActionOperationQueue_enqueue___block_invoke_2(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(v1 - 1) + 40));
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__FPDActionOperationQueue_enqueue___block_invoke_2_cold_1(v1, v2);
  }
}

- (id)dequeue
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPDActionOperationQueue_dequeue__block_invoke;
  block[3] = &unk_1E6A74960;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  id v4 = 0;
  if (!*((unsigned char *)v16 + 24))
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__5;
    uint64_t v12 = __Block_byref_object_dispose__5;
    id v13 = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_dequeueSema, 0xFFFFFFFFFFFFFFFFLL);
    v5 = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__FPDActionOperationQueue_dequeue__block_invoke_2;
    v7[3] = &unk_1E6A74870;
    v7[4] = self;
    void v7[5] = &v8;
    dispatch_sync(v5, v7);
    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  _Block_object_dispose(&v15, 8);
  return v4;
}

uint64_t __34__FPDActionOperationQueue_dequeue__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

void __34__FPDActionOperationQueue_dequeue__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 48))
  {
LABEL_4:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 32));
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:0];
    uint64_t v4 = a1 + 40;
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v3;

    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __34__FPDActionOperationQueue_dequeue__block_invoke_2_cold_1(v4, v7);
    }

    return;
  }
  if ([*(id *)(v2 + 24) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_4;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)finishedEnqueuing
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FPDActionOperationQueue_finishedEnqueuing__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(queue, block);
}

intptr_t __44__FPDActionOperationQueue_finishedEnqueuing__block_invoke(intptr_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 16);
  if (v1)
  {
    intptr_t v2 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v2 + 32) + 40));
      --v1;
    }
    while (v1);
  }
  return result;
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDActionOperationQueue_cancel__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(queue, block);
}

intptr_t __33__FPDActionOperationQueue_cancel__block_invoke(intptr_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 49))
  {
    intptr_t v2 = result;
    if (*(void *)(v1 + 16))
    {
      unint64_t v3 = 0;
      do
      {
        result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 32));
        ++v3;
        uint64_t v1 = *(void *)(v2 + 32);
        unint64_t v4 = *(void *)(v1 + 16);
      }
      while (v3 < v4);
      if (v4)
      {
        do
        {
          result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v2 + 32) + 40));
          --v4;
        }
        while (v4);
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
    *(unsigned char *)(v1 + 48) = 1;
    *(unsigned char *)(*(void *)(v2 + 32) + 49) = 1;
  }
  return result;
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  [v4 write:@"+ queue\n"];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FPDActionOperationQueue_dumpStateTo___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __39__FPDActionOperationQueue_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    [*(id *)(a1 + 40) startAttributes:2];
    [*(id *)(a1 + 40) write:@"  done\n"];
    [*(id *)(a1 + 40) reset];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 49)) {
    [*(id *)(a1 + 40) write:@"  cancelled\n"];
  }
  [*(id *)(a1 + 40) write:@"  FIFO:\n"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 40) write:@"   %@\n", *(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 40) write:@"\n"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dequeueSema, 0);
  objc_storeStrong((id *)&self->_enqueueSema, 0);
  objc_storeStrong((id *)&self->_fifo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __35__FPDActionOperationQueue_enqueue___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] queue: enqueued %@", (uint8_t *)&v3, 0xCu);
}

void __34__FPDActionOperationQueue_dequeue__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] queue: dequeued %@", (uint8_t *)&v3, 0xCu);
}

@end