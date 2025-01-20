@interface AsyncTask
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation AsyncTask

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    [(AsyncTask *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = a3;
    [(AsyncTask *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)completeWithSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)AsyncTask;
  [(Task *)&v3 completeWithSuccess];
  [(AsyncTask *)self setExecuting:0];
  [(AsyncTask *)self setFinished:1];
}

- (void)start
{
  [(AsyncTask *)self setExecuting:1];

  [(AsyncTask *)self main];
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(AsyncTask *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(AsyncTask *)self didChangeValueForKey:@"isFinished"];
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)completeWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AsyncTask;
  [(Task *)&v4 completeWithError:a3];
  [(AsyncTask *)self setExecuting:0];
  [(AsyncTask *)self setFinished:1];
}

@end