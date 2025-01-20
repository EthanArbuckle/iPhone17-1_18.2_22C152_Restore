@interface _DKSyncOperation
+ (BOOL)_removesDependenciesAfterFinish;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_DKSyncOperation)init;
- (void)dealloc;
- (void)endOperation;
- (void)start;
- (void)startOperation;
@end

@implementation _DKSyncOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (BOOL)isExecuting
{
  int v2 = atomic_load(&self->_state);
  return v2 == 1;
}

- (BOOL)isFinished
{
  int v2 = atomic_load(&self->_state);
  if (v2 == 2) {
    return 1;
  }
  else {
    return [(_DKSyncOperation *)self isCancelled];
  }
}

- (_DKSyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncOperation;
  result = [(_DKSyncOperation *)&v3 init];
  if (result) {
    atomic_store(0, &result->_state);
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_DKSyncOperation;
  [(_DKSyncOperation *)&v2 dealloc];
}

- (void)start
{
  objc_super v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  if (([(_DKSyncOperation *)self isCancelled] & 1) != 0
    || ([(_DKSyncOperation *)self startOperation],
        [(_DKSyncOperation *)self main],
        ([(_DKSyncOperation *)self isAsynchronous] & 1) == 0))
  {
    [(_DKSyncOperation *)self endOperation];
  }
}

- (void)startOperation
{
  [(_DKSyncOperation *)self willChangeValueForKey:@"isExecuting"];
  atomic_store(1u, &self->_state);
  [(_DKSyncOperation *)self didChangeValueForKey:@"isExecuting"];
  id v3 = +[_CDObservationCenter sharedInstance];
  [v3 postNotificationName:@"_DKSyncOperationStateDidChangeNotification" userInfo:0 sender:self];
}

- (void)endOperation
{
  [(_DKSyncOperation *)self willChangeValueForKey:@"isExecuting"];
  [(_DKSyncOperation *)self willChangeValueForKey:@"isFinished"];
  atomic_store(2u, &self->_state);
  [(_DKSyncOperation *)self didChangeValueForKey:@"isFinished"];
  [(_DKSyncOperation *)self didChangeValueForKey:@"isExecuting"];
  id v3 = +[_CDObservationCenter sharedInstance];
  [v3 postNotificationName:@"_DKSyncOperationStateDidChangeNotification" userInfo:0 sender:self];
}

@end