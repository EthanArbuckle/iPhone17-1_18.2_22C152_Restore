@interface Task
- (BOOL)runSubTask:(id)a3 returningError:(id *)a4;
- (BOOL)runTaskReturningError:(id *)a3;
- (BOOL)success;
- (NSError)error;
- (Task)init;
- (Task)initWithoutKeepAlive;
- (void)_dispatchCompletionBlock;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)lock;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)unlock;
@end

@implementation Task

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_keepAlive, 0);
}

- (Task)init
{
  v10.receiver = self;
  v10.super_class = (Class)Task;
  v2 = [(Task *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    uint64_t v5 = +[KeepAlive keepAliveWithFormat:@"com.apple.storekit.%@", v4];
    keepAlive = v2->_keepAlive;
    v2->_keepAlive = (KeepAlive *)v5;

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v7;
  }
  return v2;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)completeWithSuccess
{
  [(NSLock *)self->_lock lock];
  error = self->_error;
  self->_error = 0;

  self->_success = 1;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (Task)initWithoutKeepAlive
{
  v6.receiver = self;
  v6.super_class = (Class)Task;
  v2 = [(Task *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (void)completeWithError:(id)a3
{
  v4 = (NSError *)a3;
  [(NSLock *)self->_lock lock];
  error = self->_error;
  self->_error = v4;
  objc_super v6 = v4;

  self->_success = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)lock
{
}

- (BOOL)runTaskReturningError:(id *)a3
{
  if ([(Task *)self isAsynchronous])
  {
    id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot execute asynchronous tasks inline" userInfo:0];
    objc_exception_throw(v6);
  }
  if (([(Task *)self isCancelled] & 1) == 0)
  {
    [(Task *)self main];
    [(Task *)self _dispatchCompletionBlock];
  }
  if (a3)
  {
    *a3 = [(Task *)self error];
  }

  return [(Task *)self success];
}

- (BOOL)runSubTask:(id)a3 returningError:(id *)a4
{
  id v5 = a3;
  if ([v5 isAsynchronous])
  {
    id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot execute asynchronous tasks inline" userInfo:0];
    objc_exception_throw(v8);
  }
  if (([v5 isCancelled] & 1) == 0)
  {
    [v5 main];
    [v5 _dispatchCompletionBlock];
  }
  if (a4)
  {
    *a4 = [v5 error];
  }
  unsigned __int8 v6 = [v5 success];

  return v6;
}

- (void)unlock
{
}

- (void)_dispatchCompletionBlock
{
  v3 = [(Task *)self completionBlock];

  if (v3)
  {
    v4 = [(Task *)self completionBlock];
    id v5 = [v4 copy];

    unsigned __int8 v6 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025B04;
    block[3] = &unk_100357220;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  [(Task *)self setCompletionBlock:0];
}

- (void)setError:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

@end