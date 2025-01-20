@interface NSPersistentStoreAsynchronousResult
- (BOOL)_isCancelled;
- (NSError)operationError;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStoreAsynchronousResult)initWithContext:(id)a3 andProgress:(id)a4 completetionBlock:(id)a5;
- (NSProgress)progress;
- (void)_cancelProgress;
- (void)cancel;
- (void)dealloc;
- (void)setOperationError:(id)a3;
@end

@implementation NSPersistentStoreAsynchronousResult

- (NSPersistentStoreAsynchronousResult)initWithContext:(id)a3 andProgress:(id)a4 completetionBlock:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NSPersistentStoreAsynchronousResult;
  v8 = [(NSPersistentStoreAsynchronousResult *)&v11 init];
  if (v8)
  {
    v8->_requestProgress = (NSProgress *)a4;
    v8->_requestContext = (NSManagedObjectContext *)a3;
    if (a5) {
      v9 = _Block_copy(a5);
    }
    else {
      v9 = 0;
    }
    v8->_requestCompletionBlock = v9;
    v8->_flags = 0;
  }
  return v8;
}

- (void)dealloc
{
  self->_requestProgress = 0;
  self->_requestError = 0;

  self->_requestContext = 0;
  id requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_id requestCompletionBlock = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersistentStoreAsynchronousResult;
  [(NSPersistentStoreAsynchronousResult *)&v4 dealloc];
}

- (void)cancel
{
  atomic_fetch_add(&self->_flags, 1u);
  v2 = [(NSPersistentStoreAsynchronousResult *)self progress];

  [(NSProgress *)v2 cancel];
}

- (void)_cancelProgress
{
}

- (BOOL)_isCancelled
{
  return (int)atomic_fetch_add_explicit(&self->_flags, 0, memory_order_relaxed) > 0;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)operationError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOperationError:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

@end