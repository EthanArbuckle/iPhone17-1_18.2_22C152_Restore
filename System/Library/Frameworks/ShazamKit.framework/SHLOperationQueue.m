@interface SHLOperationQueue
+ (id)defaultQueue;
- (NSOperation)tailOperation;
- (NSOperationQueue)operationQueue;
- (id)initOperationQueue;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllOperations;
- (void)setOperationQueue:(id)a3;
- (void)setTailOperation:(id)a3;
@end

@implementation SHLOperationQueue

+ (id)defaultQueue
{
  if (qword_100090A78 != -1) {
    dispatch_once(&qword_100090A78, &stru_100075740);
  }
  v2 = (void *)qword_100090A70;

  return v2;
}

- (id)initOperationQueue
{
  v6.receiver = self;
  v6.super_class = (Class)SHLOperationQueue;
  v2 = [(SHLOperationQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.shazam.ShazamLibrary.operation-queue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)addOperation:(id)a3
{
}

- (void)addOperation:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SHLOperationQueue *)self tailOperation];
  if ([v7 isFinished])
  {
    unsigned int v8 = 0;
  }
  else
  {
    v9 = [(SHLOperationQueue *)self tailOperation];
    unsigned int v8 = [v9 isCancelled] ^ 1;
  }
  v10 = [(SHLOperationQueue *)self tailOperation];

  if (v10 && v8)
  {
    v11 = [(SHLOperationQueue *)self tailOperation];
    [v6 addDependency:v11];
  }
  [(SHLOperationQueue *)self setTailOperation:v6];
  v12 = [(SHLOperationQueue *)self operationQueue];
  id v14 = v6;
  v13 = +[NSArray arrayWithObjects:&v14 count:1];
  [v12 addOperations:v13 waitUntilFinished:v4];
}

- (void)cancelAllOperations
{
  [(SHLOperationQueue *)self setTailOperation:0];
  id v3 = [(SHLOperationQueue *)self operationQueue];
  [v3 cancelAllOperations];
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperation)tailOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tailOperation);

  return (NSOperation *)WeakRetained;
}

- (void)setTailOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tailOperation);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end