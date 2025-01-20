@interface AVOperationQueueWithFundamentalDependency
- (AVOperationQueueWithFundamentalDependency)initWithFundamentalOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)dealloc;
@end

@implementation AVOperationQueueWithFundamentalDependency

- (AVOperationQueueWithFundamentalDependency)initWithFundamentalOperation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  v4 = [(AVOperationQueueWithFundamentalDependency *)&v7 init];
  if (v4)
  {
    v4->_fundamentalOperation = (NSOperation *)a3;
    if (a3)
    {
      v6.receiver = v4;
      v6.super_class = (Class)AVOperationQueueWithFundamentalDependency;
      [(AVOperationQueueWithFundamentalDependency *)&v6 addOperation:a3];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  [(AVOperationQueueWithFundamentalDependency *)&v3 dealloc];
}

- (void)addOperation:(id)a3
{
  if (self->_fundamentalOperation) {
    objc_msgSend(a3, "addDependency:");
  }
  v5.receiver = self;
  v5.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  [(AVOperationQueueWithFundamentalDependency *)&v5 addOperation:a3];
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_fundamentalOperation)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) addDependency:self->_fundamentalOperation];
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  [(AVOperationQueueWithFundamentalDependency *)&v11 addOperations:a3 waitUntilFinished:v4];
}

@end