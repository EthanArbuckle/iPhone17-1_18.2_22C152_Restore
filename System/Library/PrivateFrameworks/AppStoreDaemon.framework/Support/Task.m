@interface Task
- (BOOL)runSubTask:(id)a3 returningError:(id *)a4;
- (BOOL)runTaskReturningError:(id *)a3;
- (Task)init;
- (Task)initWithoutKeepAlive;
- (void)completeWithError:(id)a3;
- (void)completeWithSuccess;
- (void)lock;
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
    uint64_t v5 = +[KeepAlive keepAliveWithFormat:@"com.apple.appstored.%@", v4];
    keepAlive = v2->_keepAlive;
    v2->_keepAlive = (KeepAlive *)v5;

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v7;
  }
  return v2;
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

- (void)completeWithSuccess
{
  [(NSLock *)self->_lock lock];
  error = self->_error;
  self->_error = 0;

  self->_success = 1;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)lock
{
}

- (BOOL)runTaskReturningError:(id *)a3
{
  if ([(Task *)self isAsynchronous])
  {
    id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot execute asynchronous tasks inline" userInfo:0];
    objc_exception_throw(v8);
  }
  if (([(Task *)self isCancelled] & 1) == 0)
  {
    [(Task *)self main];
    sub_1003036C8(self);
  }
  if (a3)
  {
    if (self) {
      id v6 = objc_getProperty(self, v5, 32, 1);
    }
    else {
      id v6 = 0;
    }
    *a3 = v6;
  }
  return self && self->_success;
}

- (BOOL)runSubTask:(id)a3 returningError:(id *)a4
{
  uint64_t v5 = a3;
  if ([v5 isAsynchronous])
  {
    id v10 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Cannot execute asynchronous tasks inline" userInfo:0];
    objc_exception_throw(v10);
  }
  if (([v5 isCancelled] & 1) == 0)
  {
    [v5 main];
    sub_1003036C8(v5);
  }
  if (a4)
  {
    if (v5) {
      id v7 = objc_getProperty(v5, v6, 32, 1);
    }
    else {
      id v7 = 0;
    }
    *a4 = v7;
  }
  if (v5) {
    BOOL v8 = v5[24] & 1;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)unlock
{
}

@end