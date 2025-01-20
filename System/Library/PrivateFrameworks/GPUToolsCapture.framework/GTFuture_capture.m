@interface GTFuture_capture
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)logPerformance;
+ (id)future;
+ (id)futureWithResult:(id)a3 error:(id)a4;
- (BOOL)BOOLResult;
- (BOOL)_waitForDependencies_REQUIRESLOCK;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (GTFuture_capture)init;
- (id)_dependencies_NOLOCK;
- (id)completionBlock;
- (id)error;
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

@implementation GTFuture_capture

- (id)_dependencies_NOLOCK
{
  [(NSCondition *)self->_condition lock];
  v3 = +[NSArray arrayWithArray:self->_inflightDependencies];
  [(NSCondition *)self->_condition unlock];
  return v3;
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

- (void)_addDependency_REQUIRESLOCK:(id)a3
{
  inflightDependencies = self->_inflightDependencies;
  if (!inflightDependencies)
  {
    inflightDependencies = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
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
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke;
      v6[3] = &unk_221348;
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
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __24__GTFuture_notifyGroup___block_invoke;
    v7[3] = &unk_222120;
    v7[4] = a3;
    [(NSMutableArray *)notifyList addObject:+[NSBlockOperation blockOperationWithBlock:v7]];
    [(NSCondition *)self->_condition unlock];
  }
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
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __34__GTFuture_notifyOnQueue_handler___block_invoke;
    v8[3] = &unk_221320;
    v8[4] = a3;
    v8[5] = a4;
    [(NSMutableArray *)notifyList addObject:+[NSBlockOperation blockOperationWithBlock:v8]];
    [(NSCondition *)self->_condition unlock];
  }
}

- (void)resolveWithFuture:(id)a3
{
  [*((id *)a3 + 2) lock];
  if (*((unsigned char *)a3 + 24))
  {
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v6 = *((void *)a3 + 5);
    [*((id *)a3 + 2) unlock];
    [(GTFuture_capture *)self _setResult:v5 error:v6 notify_NOLOCK:1];
  }
  else
  {
    id v7 = a3;
    v8 = (void *)*((void *)a3 + 6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __30__GTFuture_resolveWithFuture___block_invoke;
    v9[3] = &unk_222148;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend(v8, "addObject:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
    [*((id *)a3 + 2) unlock];
  }
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
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __31__GTFuture_timeoutAfter_label___block_invoke;
    block[3] = &unk_222120;
    block[4] = self;
    dispatch_after(v7, global_queue, block);
  }
}

- (void)setError:(id)a3
{
}

- (void)cancel
{
  [(NSCondition *)self->_condition lock];
  self->_cancelled = 1;
  v3 = (NSError *)+[GTError_capture errorWithDomain:@"DYErrorDomain" code:1027 userInfo:0];

  self->_error = v3;
  [(NSCondition *)self->_condition unlock];
  error = self->_error;

  [(GTFuture_capture *)self _setResult:0 error:error notify_NOLOCK:1];
}

- (id)error
{
  [(GTFuture_capture *)self waitUntilResolved];
  v3 = self->_error;

  return v3;
}

- (void)setResult:(id)a3
{
}

- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5
{
  [(GTFuture_capture *)self willChangeValueForKey:@"isFinished"];
  [(GTFuture_capture *)self willChangeValueForKey:@"isExecuting"];
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
    self->_result = a3;
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
    id v12 = [(NSMutableArray *)notifyList countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(notifyList);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) start];
        }
        id v13 = [(NSMutableArray *)notifyList countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  [(GTFuture_capture *)self didChangeValueForKey:@"isFinished"];
  [(GTFuture_capture *)self didChangeValueForKey:@"isExecuting"];
}

- (int)intResult
{
  id v2 = [(GTFuture_capture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 intValue];
}

- (unsigned)uint32Result
{
  id v2 = [(GTFuture_capture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 unsignedIntValue];
}

- (BOOL)BOOLResult
{
  id v2 = [(GTFuture_capture *)self result];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v2 != 0;
  }

  return [v2 BOOLValue];
}

- (void)requestResult:(id)a3
{
  [(GTFuture_capture *)self addResultHandler:a3];

  [(GTFuture_capture *)self _start_NOLOCK];
}

- (void)addResultHandler:(id)a3
{
  [(NSCondition *)self->_condition lock];
  if (self->_resolved)
  {
    id result = self->_result;
    error = self->_error;
    [(NSCondition *)self->_condition unlock];
    id v7 = [a3 copy];
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __29__GTFuture_addResultHandler___block_invoke;
    block[3] = &unk_2212F8;
    void block[5] = error;
    block[6] = v7;
    block[4] = result;
    dispatch_async(global_queue, block);
  }
  else
  {
    id v9 = [a3 copy];
    notifyList = self->_notifyList;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __29__GTFuture_addResultHandler___block_invoke_2;
    v11[3] = &unk_221320;
    v11[4] = self;
    v11[5] = v9;
    [(NSMutableArray *)notifyList addObject:+[NSBlockOperation blockOperationWithBlock:v11]];
    [(NSCondition *)self->_condition unlock];
  }
}

- (id)result
{
  [(GTFuture_capture *)self waitUntilResolved];
  id v3 = self->_result;

  return v3;
}

- (void)waitUntilResolved
{
  +[NSThread isMainThread];
  if (+[GTFuture_capture logPerformance])
  {
    id v3 = +[NSDate date];
    BOOL resolved = self->_resolved;
  }
  else
  {
    BOOL resolved = 0;
    id v3 = 0;
  }
  [(GTFuture_capture *)self _start_NOLOCK];
  [(GTFuture_capture *)self waitUntilFinished];
  if (+[GTFuture_capture logPerformance])
  {
    [(NSDate *)v3 timeIntervalSinceNow];
    double v6 = -v5;
    id v7 = [(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"GPUDebugger.DYFuture.csv"];
    [+[NSDate date] timeIntervalSinceReferenceDate];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%f, %@, %@, %f, %d, %d\n", v8, [+[NSThread currentThread](NSThread, "currentThread") valueForKeyPath:@"private.seqNum"], [(NSArray *)+[NSThread callStackSymbols](NSThread, "callStackSymbols") componentsJoinedByString:@" | "], *(void *)&v6, resolved, +[NSThread isMainThread]);
    v10 = +[NSFileHandle fileHandleForWritingAtPath:v7];
    if (v10)
    {
      v11 = v10;
      [(NSFileHandle *)v10 seekToEndOfFile];
      [(NSFileHandle *)v11 writeData:[(NSString *)v9 dataUsingEncoding:4]];
      [(NSFileHandle *)v11 closeFile];
    }
    else
    {
      uint64_t v12 = 0;
      objc_msgSend(objc_msgSend(@"Timestamp, Thread, Symbol, Interval, Resolved, Main Thread\n", "stringByAppendingString:", v9), "writeToFile:atomically:encoding:error:", v7, 1, 4, &v12);
    }
    if (![+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults") BOOLForKey:@"GPUDebugger.DYFuture.HardAssertMainThread"])[+[NSUserDefaults standardUserDefaults] BOOLForKey:@"GPUDebugger.DYFuture.SoftAssertMainThread"]; {
  }
    }
}

- (void)addDependency:(id)a3
{
  [(NSCondition *)self->_condition lock];
  [(GTFuture_capture *)self _addDependency_REQUIRESLOCK:a3];
  condition = self->_condition;

  [(NSCondition *)condition unlock];
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

- (void)_start_NOLOCK
{
  [(GTFuture_capture *)self willChangeValueForKey:@"isExecuting"];
  [(NSCondition *)self->_condition lock];
  if (!self->_started && !self->_cancelled && !self->_resolved) {
    self->_started = 1;
  }
  [(NSCondition *)self->_condition unlock];

  [(GTFuture_capture *)self didChangeValueForKey:@"isExecuting"];
}

- (void)setCompletionBlock:(id)a3
{
  [(NSCondition *)self->_condition lock];
  self->_completion = [a3 copy];
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

- (id)completionBlock
{
  [(NSCondition *)self->_condition lock];
  id v3 = [self->_completion copy];
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  [(NSCondition *)self->_condition lock];
  self->_priority = a3;
  condition = self->_condition;

  [(NSCondition *)condition unlock];
}

- (int64_t)queuePriority
{
  [(NSCondition *)self->_condition lock];
  int64_t priority = self->_priority;
  [(NSCondition *)self->_condition unlock];
  return priority;
}

- (BOOL)isFinished
{
  [(NSCondition *)self->_condition lock];
  BOOL v3 = self->_resolved || self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (BOOL)isExecuting
{
  [(NSCondition *)self->_condition lock];
  BOOL v3 = !self->_resolved && !self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isCancelled
{
  [(NSCondition *)self->_condition lock];
  BOOL cancelled = self->_cancelled;
  [(NSCondition *)self->_condition unlock];
  return cancelled;
}

- (void)dealloc
{
  id v3 = +[GTError_capture errorWithDomain:@"DYErrorDomain" code:1028 userInfo:0];
  [(NSCondition *)self->_condition lock];
  if (!self->_resolved)
  {
    [(NSCondition *)self->_condition unlock];
    [(GTFuture_capture *)self _setResult:0 error:v3 notify_NOLOCK:1];
    [(NSCondition *)self->_condition lock];
  }

  self->_BOOL resolved = 1;
  self->_id result = 0;
  self->_error = 0;
  self->_notifyList = 0;
  condition = self->_condition;
  self->_condition = 0;
  [(NSCondition *)condition broadcast];
  [(NSCondition *)condition unlock];

  v5.receiver = self;
  v5.super_class = (Class)GTFuture_capture;
  [(GTFuture_capture *)&v5 dealloc];
}

- (GTFuture_capture)init
{
  v5.receiver = self;
  v5.super_class = (Class)GTFuture_capture;
  id v2 = [(GTFuture_capture *)&v5 init];
  if (v2)
  {
    id v3 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    v2->_condition = v3;
    [(NSCondition *)v3 lock];
    v2->_notifyList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_int64_t priority = 0;
    v2->_id result = 0;
    v2->_error = 0;
    v2->_BOOL resolved = 0;
    [(NSCondition *)v2->_condition unlock];
  }
  return v2;
}

+ (BOOL)logPerformance
{
  if (+[GTFuture logPerformance]::onceToken != -1) {
    dispatch_once(&+[GTFuture logPerformance]::onceToken, &__block_literal_global);
  }
  return +[GTFuture logPerformance]::log;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"isFinished"] & 1) != 0
    || ([a3 isEqualToString:@"isExecuting"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GTFuture_capture;
  return objc_msgSendSuper2(&v6, "automaticallyNotifiesObserversForKey:", a3);
}

+ (id)futureWithResult:(id)a3 error:(id)a4
{
  id v6 = [a1 future];
  [v6 setError:a4];
  [v6 setResult:a3];
  return v6;
}

+ (id)future
{
  objc_opt_class();
  id v2 = objc_opt_new();

  return v2;
}

@end