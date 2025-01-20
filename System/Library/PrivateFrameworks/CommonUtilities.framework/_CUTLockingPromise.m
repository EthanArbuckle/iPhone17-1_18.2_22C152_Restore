@interface _CUTLockingPromise
- (BOOL)done;
- (CUTResult)result;
- (NSMutableArray)resultBlocks;
- (NSRecursiveLock)lock;
- (_CUTLockingPromise)init;
- (void)_fulfillWithResult:(id)a3;
- (void)registerResultBlock:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultBlocks:(id)a3;
@end

@implementation _CUTLockingPromise

- (_CUTLockingPromise)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CUTLockingPromise;
  v2 = [(CUTUnsafePromise *)&v9 _init];
  v3 = v2;
  if (v2)
  {
    v2->_done = 0;
    v4 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v3->_lock;
    v3->_lock = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resultBlocks = v3->_resultBlocks;
    v3->_resultBlocks = v6;
  }
  return v3;
}

- (void)_fulfillWithResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  if ([(_CUTLockingPromise *)self done])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_CUTPromise.m", 83, @"Invalid parameter not satisfying: %@", @"!self.done" object file lineNumber description];
  }
  [(_CUTLockingPromise *)self setDone:1];
  [(_CUTLockingPromise *)self setResult:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_resultBlocks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  resultBlocks = self->_resultBlocks;
  self->_resultBlocks = 0;

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)registerResultBlock:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  [(NSRecursiveLock *)self->_lock lock];
  if ([(_CUTLockingPromise *)self done])
  {
    v4 = [(_CUTLockingPromise *)self result];
    v6[2](v6, v4);
  }
  else
  {
    resultBlocks = self->_resultBlocks;
    v4 = (void *)MEMORY[0x1A6249D30](v6);
    [(NSMutableArray *)resultBlocks addObject:v4];
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableArray)resultBlocks
{
  return self->_resultBlocks;
}

- (void)setResultBlocks:(id)a3
{
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBlocks, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end