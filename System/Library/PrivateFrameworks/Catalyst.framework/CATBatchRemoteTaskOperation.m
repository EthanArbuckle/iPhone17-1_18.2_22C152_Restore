@interface CATBatchRemoteTaskOperation
- (BOOL)isAsynchronous;
- (CATBatchRemoteTaskOperation)init;
- (CATBatchRemoteTaskOperation)initWithRemoteTaskOperations:(id)a3;
- (CATBatchRemoteTaskOperation)initWithTaskClient:(id)a3 requests:(id)a4;
- (NSArray)remoteTaskOperations;
- (void)cancel;
- (void)cancelSubOperations;
- (void)main;
- (void)remoteTaskDidFinish:(id)a3;
@end

@implementation CATBatchRemoteTaskOperation

- (CATBatchRemoteTaskOperation)initWithTaskClient:(id)a3 requests:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"CATBatchRemoteTaskOperation.m", 27, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [v7 prepareTaskOperationForRequest:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v16 = [(CATBatchRemoteTaskOperation *)self initWithRemoteTaskOperations:v9];
  return v16;
}

- (CATBatchRemoteTaskOperation)initWithRemoteTaskOperations:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CATBatchRemoteTaskOperation;
  v5 = [(CATOperation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    mQueue = v5->mQueue;
    v5->mQueue = (NSOperationQueue *)v6;

    id v8 = [NSString stringWithFormat:@"%@.%p.main", objc_opt_class(), v5];
    [(NSOperationQueue *)v5->mQueue setName:v8];

    uint64_t v9 = [v4 copy];
    mRemoteTasks = v5->mRemoteTasks;
    v5->mRemoteTasks = (NSArray *)v9;
  }
  return v5;
}

- (CATBatchRemoteTaskOperation)init
{
  return [(CATBatchRemoteTaskOperation *)self initWithRemoteTaskOperations:0];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NSArray)remoteTaskOperations
{
  v2 = (void *)[(NSArray *)self->mRemoteTasks copy];

  return (NSArray *)v2;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)CATBatchRemoteTaskOperation;
  [(CATBatchRemoteTaskOperation *)&v3 cancel];
  [(CATBatchRemoteTaskOperation *)self performSelectorOnMainThread:sel_cancelSubOperations withObject:0 waitUntilDone:0];
}

- (void)cancelSubOperations
{
}

- (void)main
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(CATOperation *)self setTotalUnitCount:[(NSArray *)self->mRemoteTasks count]];
  [(CATOperation *)self setCompletedUnitCount:0];
  if ([(NSArray *)self->mRemoteTasks count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v3 = self->mRemoteTasks;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, sel_remoteTaskDidFinish_, 6, (void)v9);
          [(NSOperationQueue *)self->mQueue addOperation:v8];
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    [(CATOperation *)self endOperationWithResultObject:0];
  }
}

- (void)remoteTaskDidFinish:(id)a3
{
  [(CATOperation *)self setCompletedUnitCount:[(CATOperation *)self completedUnitCount] + 1];
  unint64_t v4 = [(CATOperation *)self completedUnitCount];
  if (v4 >= [(NSArray *)self->mRemoteTasks count])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F088D8]) initWithTarget:self selector:sel_endOperationWithResultObject_ object:0];
    [(NSOperationQueue *)self->mQueue addOperation:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mQueue, 0);

  objc_storeStrong((id *)&self->mRemoteTasks, 0);
}

@end