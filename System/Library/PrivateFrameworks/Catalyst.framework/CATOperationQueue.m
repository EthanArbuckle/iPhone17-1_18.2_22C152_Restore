@interface CATOperationQueue
+ (id)backgroundQueue;
+ (id)currentQueue;
+ (id)mainQueue;
- (CATOperationQueueDelegate)delegate;
- (id)description;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)delegateOperationDidFinish:(id)a3;
- (void)delegateWillAddOperation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setUnderlyingQueue:(id)a3;
- (void)startObserving:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation CATOperationQueue

- (void)setUnderlyingQueue:(id)a3
{
  id v5 = a3;
  v6 = +[CATOperationQueue backgroundQueue];

  if (v6 == self)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CATOperationQueue.m", 32, @"%@ cannot call %@ for backgroundQueue", self, v8 object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)CATOperationQueue;
  [(CATOperationQueue *)&v9 setUnderlyingQueue:v5];
}

+ (id)backgroundQueue
{
  if (backgroundQueue_onceToken != -1) {
    dispatch_once(&backgroundQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)backgroundQueue_backgroundQueue;

  return v2;
}

uint64_t __36__CATOperationQueue_backgroundQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)backgroundQueue_backgroundQueue;
  backgroundQueue_backgroundQueue = v0;

  v2 = (void *)backgroundQueue_backgroundQueue;

  return [v2 setName:@"Global Background Queue"];
}

+ (id)currentQueue
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"CATOperationQueue.m", 59, @"%@ cannot use +currentQueue, call +[NSOperationQueue currentQueue] instead.", a1 object file lineNumber description];

  return 0;
}

+ (id)mainQueue
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"CATOperationQueue.m", 66, @"%@ cannot use +mainQueue, call +[NSOperationQueue mainQueue] instead.", a1 object file lineNumber description];

  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CATOperationQueue *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p { name = '%@', suspended = %d, operationCount = %lu, maxConcurrentOperationCount = %ld }>", v4, self, v5, -[CATOperationQueue isSuspended](self, "isSuspended"), -[CATOperationQueue operationCount](self, "operationCount"), -[CATOperationQueue maxConcurrentOperationCount](self, "maxConcurrentOperationCount")];

  return v6;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  [(CATOperationQueue *)self startObserving:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 operationWillEnqueueOntoOperationQueue:self];
  }
  [(CATOperationQueue *)self delegateWillAddOperation:v4];
  v5.receiver = self;
  v5.super_class = (Class)CATOperationQueue;
  [(CATOperationQueue *)&v5 addOperation:v4];
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CATOperationQueue *)self addOperation:*(void *)(*((void *)&v20 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "waitUntilFinished", (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (a6 == @"_CATOperationQueueIsFinishedObservationContext")
  {
    uint64_t v12 = *MEMORY[0x263F081C8];
    id v13 = a5;
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];
    char v15 = [v14 BOOLValue];

    long long v16 = [v13 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    int v17 = [v16 BOOLValue];
    if ((v15 & 1) == 0 && v17)
    {
      [(CATOperationQueue *)self delegateOperationDidFinish:v10];
      [(CATOperationQueue *)self stopObserving:v10];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CATOperationQueue;
    id v11 = a5;
    [(CATOperationQueue *)&v18 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }
}

- (void)delegateOperationDidFinish:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(CATOperationQueue *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 operationQueue:self operationDidFinish:v5];
  }
}

- (void)delegateWillAddOperation:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(CATOperationQueue *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 operationQueue:self willAddOperation:v5];
  }
}

- (void)startObserving:(id)a3
{
}

- (void)stopObserving:(id)a3
{
}

- (CATOperationQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATOperationQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end