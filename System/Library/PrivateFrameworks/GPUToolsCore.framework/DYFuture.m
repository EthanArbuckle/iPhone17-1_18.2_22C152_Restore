@interface DYFuture
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)enableAssertMainThread;
+ (BOOL)logPerformance;
+ (id)future;
+ (id)futureWithResult:(id)a3 error:(id)a4;
- (BOOL)BOOLResult;
- (BOOL)_waitForDependencies_REQUIRESLOCK;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)resolved;
- (DYFuture)init;
- (NSError)error;
- (NSError)resolvedError;
- (id)_dependencies_NOLOCK;
- (id)completionBlock;
- (id)resolvedResult;
- (id)result;
- (int)intResult;
- (int64_t)queuePriority;
- (unsigned)uint32Result;
- (void)_addDependency_REQUIRESLOCK:(id)a3;
- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5;
- (void)_start_NOLOCK;
- (void)addDependency:(id)a3;
- (void)addResultHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)notifyGroup:(id)a3;
- (void)notifyOnQueue:(id)a3 handler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestResult:(id)a3;
- (void)resolveWithFuture:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setQueuePriority:(int64_t)a3;
- (void)setResult:(id)a3;
- (void)timeoutAfter:(double)a3 label:(id)a4;
- (void)waitUntilFinished;
- (void)waitUntilResolved;
@end

@implementation DYFuture

+ (id)future
{
  objc_opt_class();
  v2 = objc_opt_new();

  return v2;
}

+ (id)futureWithResult:(id)a3 error:(id)a4
{
  v6 = (void *)[a1 future];
  [v6 setError:a4];
  [v6 setResult:a3];
  return v6;
}

- (DYFuture)init
{
  v5.receiver = self;
  v5.super_class = (Class)DYFuture;
  v2 = [(DYFuture *)&v5 init];
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    v2->_condition = v3;
    [(NSCondition *)v3 lock];
    v2->_notifyList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_priority = 0;
    v2->_result = 0;
    v2->_error = 0;
    v2->_resolved = 0;
    [(NSCondition *)v2->_condition unlock];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[DYError errorWithDomain:@"DYErrorDomain" code:1028 userInfo:0];
  [(NSCondition *)self->_condition lock];
  if (!self->_resolved)
  {
    [(NSCondition *)self->_condition unlock];
    [(DYFuture *)self _setResult:0 error:v3 notify_NOLOCK:1];
    [(NSCondition *)self->_condition lock];
  }

  self->_resolved = 1;
  self->_result = 0;
  self->_error = 0;
  self->_notifyList = 0;
  condition = self->_condition;
  self->_condition = 0;
  [(NSCondition *)condition broadcast];
  [(NSCondition *)condition unlock];

  v5.receiver = self;
  v5.super_class = (Class)DYFuture;
  [(DYFuture *)&v5 dealloc];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"isFinished"] & 1) != 0
    || ([a3 isEqualToString:@"isExecuting"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___DYFuture;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)isCancelled
{
  [(NSCondition *)self->_condition lock];
  BOOL cancelled = self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return cancelled;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  [(NSCondition *)self->_condition lock];
  BOOL v3 = !self->_resolved && !self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (BOOL)isFinished
{
  [(NSCondition *)self->_condition lock];
  BOOL v3 = self->_resolved || self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (int64_t)queuePriority
{
  [(NSCondition *)self->_condition lock];
  int64_t priority = self->_priority;
  [(NSCondition *)self->_condition unlock];
  return priority;
}

- (void)setQueuePriority:(int64_t)a3
{
  [(NSCondition *)self->_condition lock];
  self->_int64_t priority = a3;
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

- (id)completionBlock
{
  [(NSCondition *)self->_condition lock];
  id v3 = (id)[self->_completion copy];
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (void)setCompletionBlock:(id)a3
{
  [(NSCondition *)self->_condition lock];
  self->_completion = (id)[a3 copy];
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

- (void)_start_NOLOCK
{
  [(DYFuture *)self willChangeValueForKey:@"isExecuting"];
  [(NSCondition *)self->_condition lock];
  if (!self->_started && !self->_cancelled && !self->_resolved) {
    self->_started = 1;
  }
  [(NSCondition *)self->_condition unlock];

  [(DYFuture *)self didChangeValueForKey:@"isExecuting"];
}

- (void)waitUntilFinished
{
  [(NSCondition *)self->_condition lock];
  while (!self->_resolved)
  {
    if (self->_cancelled) {
      break;
    }
    [(NSCondition *)self->_condition wait];
  }
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

- (void)addDependency:(id)a3
{
  [(NSCondition *)self->_condition lock];
  [(DYFuture *)self _addDependency_REQUIRESLOCK:a3];
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

+ (BOOL)logPerformance
{
  if (logPerformance_onceToken != -1) {
    dispatch_once(&logPerformance_onceToken, &__block_literal_global_3);
  }
  return logPerformance_log;
}

uint64_t __26__DYFuture_logPerformance__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"GPUDebugger.DYFuture.LogPerformance");
  logPerformance_log = result;
  return result;
}

+ (BOOL)enableAssertMainThread
{
  if (enableAssertMainThread_onceToken != -1) {
    dispatch_once(&enableAssertMainThread_onceToken, &__block_literal_global_17);
  }
  return enableAssertMainThread_log;
}

uint64_t __34__DYFuture_enableAssertMainThread__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"GPUDebugger.DYFuture.EnableAssertMainThread");
  enableAssertMainThread_log = result;
  return result;
}

- (void)waitUntilResolved
{
  if ([MEMORY[0x263F08B88] isMainThread]) {
    +[DYFuture enableAssertMainThread];
  }
  if (+[DYFuture logPerformance])
  {
    id v3 = (void *)[MEMORY[0x263EFF910] date];
    BOOL resolved = self->_resolved;
  }
  else
  {
    BOOL resolved = 0;
    id v3 = 0;
  }
  [(DYFuture *)self _start_NOLOCK];
  [(DYFuture *)self waitUntilFinished];
  if (+[DYFuture logPerformance])
  {
    [v3 timeIntervalSinceNow];
    double v6 = -v5;
    v7 = [(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"GPUDebugger.DYFuture.csv"];
    v8 = NSString;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSinceReferenceDate");
    uint64_t v10 = v9;
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "valueForKeyPath:", @"private.seqNum");
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "callStackSymbols"), "componentsJoinedByString:", @" | ");
    v13 = (void *)[v8 stringWithFormat:@"%f, %@, %@, %f, %d, %d\n", v10, v11, v12, *(void *)&v6, resolved, objc_msgSend(MEMORY[0x263F08B88], "isMainThread")];
    v14 = (void *)[MEMORY[0x263F08840] fileHandleForWritingAtPath:v7];
    if (v14)
    {
      v15 = v14;
      [v14 seekToEndOfFile];
      objc_msgSend(v15, "writeData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
      [v15 closeFile];
    }
    else
    {
      uint64_t v16 = 0;
      objc_msgSend((id)objc_msgSend(@"Timestamp, Thread, Symbol, Interval, Resolved, Main Thread\n", "stringByAppendingString:", v13), "writeToFile:atomically:encoding:error:", v7, 1, 4, &v16);
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"GPUDebugger.DYFuture.HardAssertMainThread") & 1) == 0)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"GPUDebugger.DYFuture.SoftAssertMainThread"); {
  }
    }
}

- (id)resolvedResult
{
  id v2 = self->_result;

  return v2;
}

- (NSError)resolvedError
{
  id v2 = self->_error;

  return v2;
}

- (id)result
{
  [(DYFuture *)self waitUntilResolved];
  id v3 = self->_result;

  return v3;
}

- (void)addResultHandler:(id)a3
{
  [(NSCondition *)self->_condition lock];
  if (self->_resolved)
  {
    id result = self->_result;
    error = self->_error;
    [(NSCondition *)self->_condition unlock];
    uint64_t v7 = [a3 copy];
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__DYFuture_addResultHandler___block_invoke;
    block[3] = &unk_2653366D0;
    block[5] = error;
    block[6] = v7;
    block[4] = result;
    dispatch_async(global_queue, block);
  }
  else
  {
    uint64_t v9 = [a3 copy];
    notifyList = self->_notifyList;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __29__DYFuture_addResultHandler___block_invoke_2;
    v11[3] = &unk_2653366F8;
    v11[4] = self;
    v11[5] = v9;
    -[NSMutableArray addObject:](notifyList, "addObject:", [MEMORY[0x263F086D0] blockOperationWithBlock:v11]);
    [(NSCondition *)self->_condition unlock];
  }
}

void __29__DYFuture_addResultHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 48);
}

void __29__DYFuture_addResultHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 272);
  uint64_t v4 = *(void *)(v2 + 280);
  [*(id *)(v2 + 256) unlock];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__DYFuture_addResultHandler___block_invoke_3;
  block[3] = &unk_2653366D0;
  uint64_t v6 = *(void *)(a1 + 40);
  block[5] = v4;
  block[6] = v6;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void __29__DYFuture_addResultHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 48);
}

- (void)requestResult:(id)a3
{
  [(DYFuture *)self addResultHandler:a3];

  [(DYFuture *)self _start_NOLOCK];
}

- (BOOL)BOOLResult
{
  id v2 = [(DYFuture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 BOOLValue];
}

- (unsigned)uint32Result
{
  id v2 = [(DYFuture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 unsignedIntValue];
}

- (int)intResult
{
  id v2 = [(DYFuture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 intValue];
}

- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(DYFuture *)self willChangeValueForKey:@"isFinished"];
  [(DYFuture *)self willChangeValueForKey:@"isExecuting"];
  [(NSCondition *)self->_condition lock];
  if (self->_resolved) {
    goto LABEL_16;
  }
  if (a4)
  {
    error = self->_error;
    if (error != a4)
    {

      self->_error = (NSError *)a4;
    }
  }
  if (!a5)
  {
LABEL_16:
    [(NSCondition *)self->_condition unlock];
  }
  else
  {
    self->_id result = a3;
    self->_BOOL resolved = 1;
    notifyList = self->_notifyList;
    self->_notifyList = 0;
    completion = (void (**)(void))self->_completion;
    self->_completion = 0;
    [(NSCondition *)self->_condition broadcast];
    [(NSCondition *)self->_condition unlock];
    if (completion)
    {
      completion[2](completion);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = [(NSMutableArray *)notifyList countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(notifyList);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) start];
        }
        uint64_t v13 = [(NSMutableArray *)notifyList countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  [(DYFuture *)self didChangeValueForKey:@"isFinished"];
  [(DYFuture *)self didChangeValueForKey:@"isExecuting"];
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  [(DYFuture *)self waitUntilResolved];
  uint64_t v3 = self->_error;

  return v3;
}

- (void)cancel
{
  [(NSCondition *)self->_condition lock];
  self->_BOOL cancelled = 1;
  uint64_t v3 = +[DYError errorWithDomain:@"DYErrorDomain" code:1027 userInfo:0];

  self->_error = &v3->super;
  [(NSCondition *)self->_condition unlock];
  error = self->_error;

  [(DYFuture *)self _setResult:0 error:error notify_NOLOCK:1];
}

- (void)setError:(id)a3
{
}

- (void)timeoutAfter:(double)a3 label:(id)a4
{
  [(NSCondition *)self->_condition lock];
  BOOL resolved = self->_resolved;
  [(NSCondition *)self->_condition unlock];
  if (!resolved)
  {
    dispatch_time_t v7 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__DYFuture_timeoutAfter_label___block_invoke;
    block[3] = &unk_265335F98;
    block[4] = self;
    dispatch_after(v7, global_queue, block);
  }
}

uint64_t __31__DYFuture_timeoutAfter_label___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 264);
  uint64_t result = [*(id *)(v2 + 256) unlock];
  if (!v3)
  {
    double v5 = +[DYError errorWithDomain:@"DYErrorDomain" code:5 userInfo:0];
    uint64_t v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "_setResult:error:notify_NOLOCK:", 0, v5, 1);
  }
  return result;
}

- (void)resolveWithFuture:(id)a3
{
  [*((id *)a3 + 32) lock];
  if (*((unsigned char *)a3 + 264))
  {
    uint64_t v5 = *((void *)a3 + 34);
    uint64_t v6 = *((void *)a3 + 35);
    [*((id *)a3 + 32) unlock];
    [(DYFuture *)self _setResult:v5 error:v6 notify_NOLOCK:1];
  }
  else
  {
    id v7 = a3;
    v8 = (void *)*((void *)a3 + 36);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__DYFuture_resolveWithFuture___block_invoke;
    v9[3] = &unk_265335F20;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x263F086D0], "blockOperationWithBlock:", v9));
    [*((id *)a3 + 32) unlock];
  }
}

void __30__DYFuture_resolveWithFuture___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 272);
  uint64_t v4 = *(void *)(v2 + 280);
  [*(id *)(v2 + 256) unlock];
  objc_msgSend(*(id *)(a1 + 40), "_setResult:error:notify_NOLOCK:", v3, v4, 1);
  uint64_t v5 = *(void **)(a1 + 32);
}

- (void)notifyOnQueue:(id)a3 handler:(id)a4
{
  [(NSCondition *)self->_condition lock];
  if (self->_resolved)
  {
    [(NSCondition *)self->_condition unlock];
    dispatch_async((dispatch_queue_t)a3, a4);
  }
  else
  {
    dispatch_retain((dispatch_object_t)a3);
    notifyList = self->_notifyList;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__DYFuture_notifyOnQueue_handler___block_invoke;
    v8[3] = &unk_2653366F8;
    v8[4] = a3;
    v8[5] = a4;
    -[NSMutableArray addObject:](notifyList, "addObject:", [MEMORY[0x263F086D0] blockOperationWithBlock:v8]);
    [(NSCondition *)self->_condition unlock];
  }
}

void __34__DYFuture_notifyOnQueue_handler___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (void)notifyGroup:(id)a3
{
  [(NSCondition *)self->_condition lock];
  if (self->_resolved)
  {
    condition = self->_condition;
    [(NSCondition *)condition unlock];
  }
  else
  {
    dispatch_retain((dispatch_object_t)a3);
    dispatch_group_enter((dispatch_group_t)a3);
    notifyList = self->_notifyList;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __24__DYFuture_notifyGroup___block_invoke;
    v7[3] = &unk_265335F98;
    v7[4] = a3;
    -[NSMutableArray addObject:](notifyList, "addObject:", [MEMORY[0x263F086D0] blockOperationWithBlock:v7]);
    [(NSCondition *)self->_condition unlock];
  }
}

void __24__DYFuture_notifyGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (void)_addDependency_REQUIRESLOCK:(id)a3
{
  inflightDependencies = self->_inflightDependencies;
  if (!inflightDependencies)
  {
    inflightDependencies = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_inflightDependencies = inflightDependencies;
  }
  if (([(NSMutableArray *)inflightDependencies containsObject:a3] & 1) == 0)
  {
    if (([a3 isFinished] & 1) == 0) {
      [(NSMutableArray *)self->_inflightDependencies addObject:a3];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __40__DYFuture__addDependency_REQUIRESLOCK___block_invoke;
      v6[3] = &unk_265336720;
      v6[4] = self;
      v6[5] = a3;
      [a3 addResultHandler:v6];
    }
    else
    {
      [a3 addObserver:self forKeyPath:@"isFinished" options:1 context:0];
    }
  }
}

uint64_t __40__DYFuture__addDependency_REQUIRESLOCK___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) lock];
  [*(id *)(*(void *)(a1 + 32) + 296) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 256) broadcast];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 256);

  return [v2 unlock];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NSCondition *)self->_condition lock];
    [(NSMutableArray *)self->_inflightDependencies removeObject:a4];
    [(NSCondition *)self->_condition broadcast];
    condition = self->_condition;
    [(NSCondition *)condition unlock];
  }
}

- (BOOL)_waitForDependencies_REQUIRESLOCK
{
  while ([(NSMutableArray *)self->_inflightDependencies count])
  {
    if (self->_cancelled) {
      break;
    }
    [(NSCondition *)self->_condition wait];
  }
  return !self->_cancelled;
}

- (id)_dependencies_NOLOCK
{
  [(NSCondition *)self->_condition lock];
  uint64_t v3 = (void *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_inflightDependencies];
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (BOOL)resolved
{
  return self->_resolved;
}

@end