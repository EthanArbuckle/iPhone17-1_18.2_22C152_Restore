@interface BLOperation
- (BLOperation)init;
- (BLOperation)parentOperation;
- (BLOperationDelegate)delegate;
- (BLOperationProgress)progress;
- (BOOL)runSubOperation:(id)a3 onQueue:(id)a4 error:(id *)a5;
- (BOOL)runSubOperation:(id)a3 returningError:(id *)a4;
- (BOOL)shouldMessageMainThread;
- (BOOL)shouldRunWithBackgroundPriority;
- (BOOL)stopRunLoop;
- (BOOL)success;
- (NSError)error;
- (NSRunLoop)operationRunLoop;
- (int)runRunLoopUntilStopped;
- (int64_t)progressWeight;
- (void)_addSubOperation:(id)a3;
- (void)_failAfterException;
- (void)_main:(BOOL)a3;
- (void)_removeSubOperation:(id)a3;
- (void)_sendErrorToDelegate:(id)a3;
- (void)_sendSuccessToDelegate;
- (void)_sendWillStartToDelegate;
- (void)cancel;
- (void)delegateDispatch:(id)a3;
- (void)dispatchCompletionBlock;
- (void)lock;
- (void)main;
- (void)run;
- (void)run:(BOOL)a3;
- (void)sendProgressToDelegate;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setOperationRunLoop:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setShouldMessageMainThread:(BOOL)a3;
- (void)setShouldRunWithBackgroundPriority:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)unlock;
@end

@implementation BLOperation

- (BLOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLOperation;
  v2 = [(BLOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (BLOperationProgress)progress
{
  [(BLOperation *)self lock];
  v3 = self->_progress;
  [(BLOperation *)self unlock];

  return v3;
}

- (int64_t)progressWeight
{
  return 1;
}

- (void)run
{
  [(BLOperation *)self setError:0];

  [(BLOperation *)self setSuccess:1];
}

- (int)runRunLoopUntilStopped
{
  v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_keepAliveTimer:" selector:0 userInfo:0 repeats:1.79769313e308];
  self->_stopped = 0;
  do
  {
    CFRunLoopRunResult v5 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10.0, 1u);
  }
  while (!self->_stopped && (v5 - 1) > 1);
  [v3 invalidate];

  return v5;
}

- (BOOL)runSubOperation:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  if (([v6 isCancelled] & 1) == 0)
  {
    [v6 setParentOperation:self];
    [(BLOperation *)self lock];
    [(BLOperation *)self _addSubOperation:v6];
    [(BLOperation *)self unlock];
    [v6 main];
    [v6 dispatchCompletionBlock];
    [v6 setParentOperation:0];
    [(BLOperation *)self lock];
    [(BLOperation *)self _removeSubOperation:v6];
    [(BLOperation *)self unlock];
  }
  if (a4)
  {
    *a4 = [v6 error];
  }
  unsigned __int8 v7 = [v6 success];

  return v7;
}

- (BOOL)runSubOperation:(id)a3 onQueue:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isCancelled] & 1) == 0)
  {
    [v8 setParentOperation:self];
    [(BLOperation *)self lock];
    [(BLOperation *)self _addSubOperation:v8];
    [(BLOperation *)self unlock];
    v10 = +[NSArray arrayWithObject:v8];
    [v9 addOperations:v10 waitUntilFinished:1];

    [v8 setParentOperation:0];
    [(BLOperation *)self lock];
    [(BLOperation *)self _removeSubOperation:v8];
    [(BLOperation *)self unlock];
  }
  if (a5)
  {
    *a5 = [v8 error];
  }
  unsigned __int8 v11 = [v8 success];

  return v11;
}

- (BOOL)stopRunLoop
{
  [(BLOperation *)self lock];
  id v3 = [(NSMutableArray *)self->_subOperations copy];
  [(BLOperation *)self unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) stopRunLoop])
        {
          BOOL v11 = 1;
          v10 = v4;
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = [(BLOperation *)self operationRunLoop];
  v10 = v9;
  BOOL v11 = v9 != 0;
  if (v9)
  {
    v12 = (__CFRunLoop *)[v9 getCFRunLoop];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009E1C;
    block[3] = &unk_1001A0FE8;
    block[4] = self;
    CFRunLoopPerformBlock(v12, kCFRunLoopDefaultMode, block);
    CFRunLoopWakeUp(v12);
    CFRunLoopStop(v12);
    BOOL v11 = 1;
  }
LABEL_12:

  return v11;
}

- (BLOperationDelegate)delegate
{
  [(BLOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(BLOperation *)self unlock];

  return (BLOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  [(BLOperation *)self lock];
  objc_storeWeak((id *)&self->_delegate, v4);

  [(BLOperation *)self unlock];
}

- (void)setShouldMessageMainThread:(BOOL)a3
{
  [(BLOperation *)self lock];
  self->_shouldMessageMainThread = a3;

  [(BLOperation *)self unlock];
}

- (BOOL)shouldMessageMainThread
{
  [(BLOperation *)self lock];
  BOOL shouldMessageMainThread = self->_shouldMessageMainThread;
  [(BLOperation *)self unlock];
  return shouldMessageMainThread;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)BLOperation;
  [(BLOperation *)&v4 cancel];
  [(BLOperation *)self lock];
  id v3 = [(NSMutableArray *)self->_subOperations copy];
  [(BLOperation *)self unlock];
  [v3 makeObjectsPerformSelector:"cancel"];
  [(BLOperation *)self stopRunLoop];
}

- (void)main
{
  if ([(BLOperation *)self shouldRunWithBackgroundPriority])
  {
    *__error() = 0;
    int v3 = getpriority(3, 0);
    BOOL v4 = 0;
    if (!*__error())
    {
      BOOL v4 = 0;
      if (!setpriority(3, 0, 4096))
      {
        id v5 = BLServiceLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          id v6 = objc_opt_class();
          id v7 = v6;
          id v8 = +[NSThread currentThread];
          int v12 = 138412546;
          id v13 = v6;
          __int16 v14 = 2048;
          long long v15 = v8;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: Running with background priority for thread: %p", (uint8_t *)&v12, 0x16u);
        }
        BOOL v4 = v3 == 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  [(BLOperation *)self _main:0];
  if (v4)
  {
    id v9 = BLServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = (id)objc_opt_class();
      BOOL v11 = +[NSThread currentThread];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2048;
      long long v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: Restoring normal priority for thread: %p", (uint8_t *)&v12, 0x16u);
    }
    setpriority(3, 0, 0);
  }
}

- (void)delegateDispatch:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if ([(BLOperation *)self shouldMessageMainThread])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A448;
    block[3] = &unk_1001A1180;
    id v6 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v4[2](v4);
  }
}

- (void)dispatchCompletionBlock
{
  int v3 = [(BLOperation *)self completionBlock];

  if (v3)
  {
    BOOL v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A4FC;
    block[3] = &unk_1001A0FE8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)lock
{
}

- (void)run:(BOOL)a3
{
  if (!a3) {
    [(BLOperation *)self run];
  }
}

- (void)sendProgressToDelegate
{
  int v3 = [(BLOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(BLOperation *)self lock];
    id v4 = [(BLOperationProgress *)self->_progress copy];
    [(BLOperation *)self unlock];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A654;
    v6[3] = &unk_1001A10C8;
    id v7 = v3;
    id v8 = self;
    id v9 = v4;
    id v5 = v4;
    [(BLOperation *)self delegateDispatch:v6];
  }
}

- (void)unlock
{
}

- (void)_addSubOperation:(id)a3
{
  id v4 = a3;
  subOperations = self->_subOperations;
  id v8 = v4;
  if (!subOperations)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_subOperations;
    self->_subOperations = v6;

    id v4 = v8;
    subOperations = self->_subOperations;
  }
  [(NSMutableArray *)subOperations addObject:v4];
}

- (void)_failAfterException
{
  uint64_t v3 = [(BLOperation *)self error];
  if (!v3)
  {
    sub_10004B6AC(0, 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(BLOperation *)self setError:v4];
    uint64_t v3 = (uint64_t)v4;
  }
  id v5 = (id)v3;
  [(BLOperation *)self _sendErrorToDelegate:v3];
}

- (void)_main:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSRunLoop currentRunLoop];
  [(BLOperation *)self setOperationRunLoop:v5];

  id v6 = [(BLOperation *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    [(BLOperation *)self lock];
    id v8 = objc_alloc_init(BLOperationProgress);
    progress = self->_progress;
    self->_progress = v8;

    [(BLOperationProgress *)self->_progress setMaxValue:1];
    [(BLOperation *)self unlock];
    [(BLOperation *)self sendProgressToDelegate];
  }
  [(BLOperation *)self _sendWillStartToDelegate];
  [(BLOperation *)self run:v3];
  if ([(BLOperation *)self success])
  {
    if (v7)
    {
      [(BLOperation *)self lock];
      [(BLOperationProgress *)self->_progress setCurrentValue:[(BLOperationProgress *)self->_progress maxValue]];
      [(BLOperationProgress *)self->_progress setEstimatedTimeRemaining:-1.0];
      [(BLOperation *)self unlock];
      [(BLOperation *)self sendProgressToDelegate];
    }
    [(BLOperation *)self _sendSuccessToDelegate];
  }
  else
  {
    id v10 = [(BLOperation *)self error];
    [(BLOperation *)self _sendErrorToDelegate:v10];
  }
  [(BLOperation *)self lock];
  BOOL v11 = self->_progress;
  self->_progress = 0;

  [(BLOperation *)self unlock];

  [(BLOperation *)self setOperationRunLoop:0];
}

- (void)_removeSubOperation:(id)a3
{
}

- (void)_sendErrorToDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BLOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A9E0;
    v6[3] = &unk_1001A10C8;
    id v7 = v5;
    id v8 = self;
    id v9 = v4;
    [(BLOperation *)self delegateDispatch:v6];
  }
}

- (void)_sendSuccessToDelegate
{
  BOOL v3 = [(BLOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000AA98;
    v4[3] = &unk_1001A11A8;
    id v5 = v3;
    id v6 = self;
    [(BLOperation *)self delegateDispatch:v4];
  }
}

- (void)_sendWillStartToDelegate
{
  BOOL v3 = [(BLOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000AB4C;
    v4[3] = &unk_1001A11A8;
    id v5 = v3;
    id v6 = self;
    [(BLOperation *)self delegateDispatch:v4];
  }
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSRunLoop)operationRunLoop
{
  return (NSRunLoop *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationRunLoop:(id)a3
{
}

- (BLOperation)parentOperation
{
  return (BLOperation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setParentOperation:(id)a3
{
}

- (BOOL)shouldRunWithBackgroundPriority
{
  return self->_shouldRunWithBackgroundPriority;
}

- (void)setShouldRunWithBackgroundPriority:(BOOL)a3
{
  self->_shouldRunWithBackgroundPriority = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parentOperation, 0);
  objc_storeStrong((id *)&self->_operationRunLoop, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end