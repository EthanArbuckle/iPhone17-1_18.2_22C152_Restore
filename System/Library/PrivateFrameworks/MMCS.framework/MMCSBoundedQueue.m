@interface MMCSBoundedQueue
- (BOOL)_sync_isFull;
- (BOOL)isValid;
- (MMCSBoundedQueue)initWithUpperBound:(unint64_t)a3;
- (NSMutableArray)entries;
- (dispatch_semaphore_s)boundsExceeded;
- (unint64_t)_sync_aggregateByteCount;
- (unint64_t)bytesErrorLevel;
- (unint64_t)bytesUpperBound;
- (void)addData:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeNextDataWithBlock:(id)a3;
- (void)setBoundsExceeded:(dispatch_semaphore_s *)a3;
- (void)setBytesErrorLevel:(unint64_t)a3;
- (void)setEntries:(id)a3;
@end

@implementation MMCSBoundedQueue

- (MMCSBoundedQueue)initWithUpperBound:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MMCSBoundedQueue;
  v4 = [(MMCSBoundedQueue *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    entries = v4->_entries;
    v4->_entries = (NSMutableArray *)v5;

    v4->_boundsExceeded = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
    v4->_bytesUpperBound = a3;
    v4->_isValid = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(MMCSBoundedQueue *)self invalidate];
  dispatch_release((dispatch_object_t)self->_boundsExceeded);
  v3.receiver = self;
  v3.super_class = (Class)MMCSBoundedQueue;
  [(MMCSBoundedQueue *)&v3 dealloc];
}

- (unint64_t)_sync_aggregateByteCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  entries = self->_entries;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MMCSBoundedQueue__sync_aggregateByteCount__block_invoke;
  v5[3] = &unk_1E6C33638;
  v5[4] = &v6;
  [(NSMutableArray *)entries enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MMCSBoundedQueue__sync_aggregateByteCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 length];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)_sync_isFull
{
  return [(MMCSBoundedQueue *)self _sync_aggregateByteCount] > self->_bytesUpperBound;
}

- (void)addData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isValid)
  {
    while (1)
    {
      uint64_t v5 = self->_entries;
      objc_sync_enter(v5);
      unint64_t v6 = [(MMCSBoundedQueue *)self _sync_aggregateByteCount];
      objc_sync_exit(v5);

      unint64_t bytesUpperBound = self->_bytesUpperBound;
      uint64_t v8 = [v4 length];
      unint64_t bytesErrorLevel = self->_bytesErrorLevel;
      if (bytesErrorLevel)
      {
        unint64_t v10 = v8 + v6;
        if (v8 + v6 > bytesErrorLevel)
        {
          v11 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v12 = self->_bytesErrorLevel;
            *(_DWORD *)buf = 134218240;
            unint64_t v15 = v10;
            __int16 v16 = 2048;
            unint64_t v17 = v12;
            _os_log_impl(&dword_1DC1CA000, v11, OS_LOG_TYPE_DEFAULT, "data size %llu exceeded error level %llu", buf, 0x16u);
          }
        }
      }
      if (v6 <= bytesUpperBound) {
        break;
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_boundsExceeded, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_isValid) {
        goto LABEL_11;
      }
    }
    if (self->_isValid)
    {
      v13 = self->_entries;
      objc_sync_enter(v13);
      [(NSMutableArray *)self->_entries addObject:v4];
      objc_sync_exit(v13);
    }
  }
LABEL_11:
}

- (void)removeNextDataWithBlock:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  if (!v9) {
    -[MMCSBoundedQueue removeNextDataWithBlock:]();
  }
  id v4 = self->_entries;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)self->_entries firstObject];
  objc_sync_exit(v4);

  if (v5)
  {
    v9[2](v9, v5);
    unint64_t v6 = self->_entries;
    objc_sync_enter(v6);
    if (objc_claimAutoreleasedReturnValue() ! = [(NSMutableArray *)self->_entries firstObject]; {
      __assert_rtn("-[MMCSBoundedQueue removeNextDataWithBlock:]", "MMCSBoundedQueue.m", 91, "[_entries firstObject] == firstData");
    }

    BOOL v7 = [(MMCSBoundedQueue *)self _sync_isFull];
    [(NSMutableArray *)self->_entries removeObjectAtIndex:0];
    if (v7)
    {
      BOOL v8 = [(MMCSBoundedQueue *)self _sync_isFull];
      objc_sync_exit(v6);

      if (!v8) {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_boundsExceeded);
      }
    }
    else
    {
      objc_sync_exit(v6);
    }
  }
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isValid)
  {
    obj->_isValid = 0;
    objc_sync_exit(obj);

    boundsExceeded = obj->_boundsExceeded;
    dispatch_semaphore_signal(boundsExceeded);
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (unint64_t)bytesUpperBound
{
  return self->_bytesUpperBound;
}

- (unint64_t)bytesErrorLevel
{
  return self->_bytesErrorLevel;
}

- (void)setBytesErrorLevel:(unint64_t)a3
{
  self->_unint64_t bytesErrorLevel = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (dispatch_semaphore_s)boundsExceeded
{
  return self->_boundsExceeded;
}

- (void)setBoundsExceeded:(dispatch_semaphore_s *)a3
{
  self->_boundsExceeded = a3;
}

- (void).cxx_destruct
{
}

- (void)removeNextDataWithBlock:.cold.1()
{
}

@end