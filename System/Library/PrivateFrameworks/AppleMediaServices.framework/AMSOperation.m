@interface AMSOperation
- (AMSMutableBinaryPromise)promise;
- (AMSOperation)init;
- (AMSOperation)parentOperation;
- (BOOL)isCancelled;
- (BOOL)success;
- (NSError)error;
- (void)cancel;
- (void)lock;
- (void)main;
- (void)runSubOperation:(id)a3;
- (void)runSubOperation:(id)a3 onQueue:(id)a4;
- (void)setError:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setPromise:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)unlock;
@end

@implementation AMSOperation

- (AMSOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSOperation;
  v2 = [(AMSOperation *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSMutableBinaryPromise);
    promise = v2->_promise;
    v2->_promise = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    subOperations = v2->_subOperations;
    v2->_subOperations = v5;
  }
  return v2;
}

- (void)main
{
  [(AMSOperation *)self run];
  v3 = [(AMSOperation *)self error];

  promise = self->_promise;
  if (v3)
  {
    id v5 = [(AMSOperation *)self error];
    [(AMSMutableBinaryPromise *)promise finishWithError:v5];
  }
  else
  {
    [(AMSMutableBinaryPromise *)self->_promise finishWithSuccess];
    self->_success = 1;
  }
}

- (void)cancel
{
  [(AMSOperation *)self lock];
  self->_cancelled = 1;
  id v3 = (id)[(NSMutableSet *)self->_subOperations copy];
  [(AMSOperation *)self unlock];
  [v3 makeObjectsPerformSelector:sel_cancel];
}

- (BOOL)isCancelled
{
  [(AMSOperation *)self lock];
  BOOL cancelled = self->_cancelled;
  [(AMSOperation *)self unlock];
  if (cancelled) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentOperation);
  int v6 = [WeakRetained isCancelled];

  return v6;
}

- (void)runSubOperation:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28F08];
  id v5 = a3;
  id v6 = [v4 currentQueue];
  [(AMSOperation *)self runSubOperation:v5 onQueue:v6];
}

- (void)runSubOperation:(id)a3 onQueue:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(AMSOperation *)self lock];
  [(NSMutableSet *)self->_subOperations addObject:v6];
  [v6 setParentOperation:self];
  [(AMSOperation *)self unlock];
  id v8 = [MEMORY[0x1E4F28F08] currentQueue];

  if (v8 == v7)
  {
    [v6 start];
  }
  else
  {
    v10[0] = v6;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v7 addOperations:v9 waitUntilFinished:1];
  }
  [(AMSOperation *)self lock];
  [v6 setParentOperation:0];
  [(NSMutableSet *)self->_subOperations removeObject:v6];
  [(AMSOperation *)self unlock];
}

- (void)lock
{
}

- (void)unlock
{
}

- (AMSOperation)parentOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentOperation);
  return (AMSOperation *)WeakRetained;
}

- (void)setParentOperation:(id)a3
{
}

- (AMSMutableBinaryPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
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

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end