@interface _GEOTileDBWriteQueue
- (_GEOTileDBWriteQueue)init;
- (_GEOTileDBWriteQueue)initWithDB:(id)a3 maxOperations:(unint64_t)a4 maxOperationsSizeInBytes:(unint64_t)a5;
- (id)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(uint64_t)a5 isKnownNotToExist:(unsigned char *)a6;
- (void)_flushPendingOperations;
- (void)_prunePendingOperationsSupercededByOperationOnIsolationQueue:(id)a3;
- (void)addOperation:(id)a3;
- (void)dropAllPendingOperations;
- (void)flushPendingOperations:(BOOL)a3;
- (void)prunePendingOperationsSupercededByOperation:(id)a3;
@end

@implementation _GEOTileDBWriteQueue

- (void)_flushPendingOperations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke;
  block[3] = &unk_1E53D89C0;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queue, block);
  if ([(id)v11[5] count])
  {
    v4 = GEOGetTileDBLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [(id)v11[5] count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Flushing %llu pending writes to disk", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_db);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke_411;
    v8[3] = &unk_1E53D89E8;
    v8[4] = self;
    v8[5] = &v10;
    v8[6] = &buf;
    [WeakRetained _performInTransaction:v8];

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_db);
      [v7 _evictIfNecessary];
    }
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v10, 8);
}

- (id)dataForKey:(uint64_t)a3 ETag:(void *)a4 originalLoadReason:(uint64_t)a5 isKnownNotToExist:(unsigned char *)a6
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 40));
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11 = *(NSObject **)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___GEOTileDBWriteQueue_dataForKey_ETag_originalLoadReason_isKnownNotToExist___block_invoke;
  v14[3] = &unk_1E53D8A38;
  v14[4] = a1;
  v14[5] = &v25;
  v14[8] = a3;
  v14[9] = a5;
  v14[6] = &v19;
  v14[7] = &v15;
  dispatch_sync(v11, v14);
  if (a4) {
    *a4 = (id) v20[5];
  }
  if (a6) {
    *a6 = *((unsigned char *)v16 + 24);
  }
  id v12 = (id)v26[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___GEOTileDBWriteQueue_addOperation___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_prunePendingOperationsSupercededByOperationOnIsolationQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  pendingOperations = self->_pendingOperations;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __85___GEOTileDBWriteQueue__prunePendingOperationsSupercededByOperationOnIsolationQueue___block_invoke;
  uint64_t v10 = &unk_1E53D8A10;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [(NSMutableArray *)pendingOperations enumerateObjectsUsingBlock:&v7];
  if (objc_msgSend((id)v14[5], "count", v7, v8, v9, v10)) {
    [(NSMutableArray *)self->_pendingOperations removeObjectsAtIndexes:v14[5]];
  }

  _Block_object_dispose(&v13, 8);
}

- (void)flushPendingOperations:(BOOL)a3
{
  if (a3)
  {
    [(_GEOTileDBWriteQueue *)self _flushPendingOperations];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_db);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47___GEOTileDBWriteQueue_flushPendingOperations___block_invoke;
    v5[3] = &unk_1E53D79D8;
    v5[4] = self;
    [WeakRetained _performOnDBQueue:v5];
  }
}

- (_GEOTileDBWriteQueue)init
{
  result = (_GEOTileDBWriteQueue *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOTileDBWriteQueue)initWithDB:(id)a3 maxOperations:(unint64_t)a4 maxOperationsSizeInBytes:(unint64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GEOTileDBWriteQueue;
  v9 = [(_GEOTileDBWriteQueue *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_maxOperations = a4;
    v9->_maxOperationsSizeInBytes = a5;
    objc_storeWeak((id *)&v9->_db, v8);
    uint64_t v11 = geo_dispatch_queue_create_with_qos();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = v10;
  }

  return v10;
}

- (void)dropAllPendingOperations
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___GEOTileDBWriteQueue_dropAllPendingOperations__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)prunePendingOperationsSupercededByOperation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___GEOTileDBWriteQueue_prunePendingOperationsSupercededByOperation___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_db);

  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

@end