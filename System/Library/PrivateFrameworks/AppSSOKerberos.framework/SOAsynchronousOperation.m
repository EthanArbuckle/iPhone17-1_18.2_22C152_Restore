@interface SOAsynchronousOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (SOAsynchronousOperation)init;
- (unint64_t)state;
- (void)finish;
- (void)setState:(unint64_t)a3;
- (void)start;
@end

@implementation SOAsynchronousOperation

- (SOAsynchronousOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)SOAsynchronousOperation;
  v2 = [(SOAsynchronousOperation *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SOAsynchronousOperation *)v2 setState:0];
  }
  return v3;
}

- (BOOL)isFinished
{
  return [(SOAsynchronousOperation *)self state] == 2;
}

- (BOOL)isReady
{
  v5.receiver = self;
  v5.super_class = (Class)SOAsynchronousOperation;
  BOOL v3 = [(SOAsynchronousOperation *)&v5 isReady];
  if (v3) {
    LOBYTE(v3) = [(SOAsynchronousOperation *)self state] == 0;
  }
  return v3;
}

- (BOOL)isExecuting
{
  return [(SOAsynchronousOperation *)self state] == 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if ([(SOAsynchronousOperation *)self isCancelled])
  {
    [(SOAsynchronousOperation *)self finish];
  }
  else
  {
    [(SOAsynchronousOperation *)self willChangeValueForKey:@"isExecuting"];
    [(SOAsynchronousOperation *)self setState:1];
    [(SOAsynchronousOperation *)self didChangeValueForKey:@"isExecuting"];
    [(SOAsynchronousOperation *)self main];
  }
}

- (void)finish
{
  [(SOAsynchronousOperation *)self willChangeValueForKey:@"isFinished"];
  [(SOAsynchronousOperation *)self setState:2];
  [(SOAsynchronousOperation *)self didChangeValueForKey:@"isFinished"];
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end