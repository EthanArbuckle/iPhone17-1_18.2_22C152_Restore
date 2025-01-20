@interface DrainOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isPaused;
- (NSCondition)pauseLock;
- (void)cancel;
- (void)finish;
- (void)pause;
- (void)resume;
- (void)setIsPaused:(BOOL)a3;
- (void)setPauseLock:(id)a3;
- (void)start;
- (void)waitIfPaused;
@end

@implementation DrainOperation

- (void)start
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000CF24();
  }

  if (([(DrainOperation *)self isCancelled] & 1) == 0)
  {
    [(DrainOperation *)self willChangeValueForKey:@"isFinished"];
    [(DrainOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_finished = 0;
    self->_executing = 1;
    v4 = (NSCondition *)objc_opt_new();
    pauseLock = self->_pauseLock;
    self->_pauseLock = v4;

    self->_isPaused = 0;
    [(DrainOperation *)self didChangeValueForKey:@"isFinished"];
    [(DrainOperation *)self didChangeValueForKey:@"isExecuting"];
    if (([(DrainOperation *)self isCancelled] & 1) == 0) {
      [(DrainOperation *)self main];
    }
  }
}

- (void)cancel
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000CFAC();
  }

  [(DrainOperation *)self finish];
}

- (void)finish
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000D034();
  }

  [(DrainOperation *)self willChangeValueForKey:@"isFinished"];
  [(DrainOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_finished = 1;
  self->_executing = 0;
  [(DrainOperation *)self didChangeValueForKey:@"isFinished"];
  [(DrainOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)pause
{
  v3 = [(DrainOperation *)self pauseLock];
  [v3 lock];

  [(DrainOperation *)self setIsPaused:1];
  id v4 = [(DrainOperation *)self pauseLock];
  [v4 unlock];
}

- (void)resume
{
  v3 = [(DrainOperation *)self pauseLock];
  [v3 lock];

  [(DrainOperation *)self setIsPaused:0];
  id v4 = [(DrainOperation *)self pauseLock];
  [v4 signal];

  id v5 = [(DrainOperation *)self pauseLock];
  [v5 unlock];
}

- (void)waitIfPaused
{
  v3 = [(DrainOperation *)self pauseLock];
  [v3 lock];

  if ([(DrainOperation *)self isPaused])
  {
    do
    {
      id v4 = [(DrainOperation *)self pauseLock];
      [v4 wait];
    }
    while ([(DrainOperation *)self isPaused]);
  }
  id v5 = [(DrainOperation *)self pauseLock];
  [v5 unlock];
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSCondition)pauseLock
{
  return (NSCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPauseLock:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void).cxx_destruct
{
}

@end