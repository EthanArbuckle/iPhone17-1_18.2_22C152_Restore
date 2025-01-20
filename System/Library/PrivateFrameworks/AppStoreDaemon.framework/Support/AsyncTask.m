@interface AsyncTask
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)main;
- (void)mainWithCompletionHandler:(id)a3;
- (void)start;
@end

@implementation AsyncTask

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  [(Task *)self lock];
  BOOL executing = self->_executing;
  [(Task *)self unlock];
  return executing;
}

- (BOOL)isFinished
{
  [(Task *)self lock];
  BOOL finished = self->_finished;
  [(Task *)self unlock];
  return finished;
}

- (void)start
{
  if (self && ![(AsyncTask *)self isExecuting])
  {
    [(AsyncTask *)self willChangeValueForKey:@"isExecuting"];
    [(Task *)self lock];
    self->_BOOL executing = 1;
    [(Task *)self unlock];
    [(AsyncTask *)self didChangeValueForKey:@"isExecuting"];
  }
  [(AsyncTask *)self main];
}

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100269BC8;
  v2[3] = &unk_100521910;
  v2[4] = self;
  [(AsyncTask *)self mainWithCompletionHandler:v2];
}

- (void)mainWithCompletionHandler:(id)a3
{
}

- (void)completeWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AsyncTask;
  [(Task *)&v4 completeWithError:a3];
  sub_100269C38(self);
}

- (void)completeWithSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)AsyncTask;
  [(Task *)&v3 completeWithSuccess];
  sub_100269C38(self);
}

@end