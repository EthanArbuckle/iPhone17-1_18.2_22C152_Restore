@interface CPSPromise
+ (id)promise;
- (BOOL)_isFinished;
- (CPSPromise)init;
- (void)_finishWithResult:(id)a3 error:(id)a4;
- (void)_flushCompletionBlocks;
- (void)addCompletionBlock:(id)a3;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
@end

@implementation CPSPromise

+ (id)promise
{
  v2 = objc_alloc_init(CPSPromise);

  return v2;
}

- (CPSPromise)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPSPromise;
  v2 = [(CPSPromise *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;
  }
  return v2;
}

- (void)addCompletionBlock:(id)a3
{
  v6 = (void (**)(id, id, NSError *))a3;
  [(NSConditionLock *)self->_stateLock lock];
  if ([(CPSPromise *)self _isFinished])
  {
    [(NSConditionLock *)self->_stateLock unlock];
    v6[2](v6, self->_result, self->_error);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    v5 = (void *)MEMORY[0x2166BE5C0](v6);
    [(NSMutableArray *)completionBlocks addObject:v5];

    [(NSConditionLock *)self->_stateLock unlock];
  }
}

- (void)finish
{
}

- (void)finishWithError:(id)a3
{
}

- (void)finishWithResult:(id)a3
{
}

- (BOOL)_isFinished
{
  return [(NSConditionLock *)self->_stateLock condition] == 1;
}

- (void)_finishWithResult:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  [(NSConditionLock *)self->_stateLock lock];
  if ([(CPSPromise *)self _isFinished])
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    objc_storeStrong((id *)&self->_error, a4);
    [(NSConditionLock *)self->_stateLock unlockWithCondition:1];
    [(CPSPromise *)self _flushCompletionBlocks];
  }
}

- (void)_flushCompletionBlocks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSConditionLock *)self->_stateLock lock];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  [(NSConditionLock *)self->_stateLock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end