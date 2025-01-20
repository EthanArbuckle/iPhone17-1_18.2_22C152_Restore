@interface _DKSyncSerializer
+ (id)operationQueue;
+ (id)sharedInstance;
+ (id)underlyingQueue;
+ (void)addDependentOperation:(id)a3;
+ (void)addDependentOperationWithBlock:(id)a3;
+ (void)addOperation:(id)a3;
+ (void)addOperationWithBlock:(id)a3;
+ (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
+ (void)performAfter:(double)a3 block:(id)a4;
+ (void)performAsyncBlock:(id)a3;
+ (void)performSyncBlock:(id)a3;
- (_DKSyncSerializer)init;
- (id)debugDescription;
- (id)description;
- (void)addDependentOperation:(void *)a1;
- (void)addDependentOperationWithBlock:(void *)a1;
- (void)addOperation:(void *)a1;
- (void)addOperationWithBlock:(void *)a1;
- (void)addOperations:(uint64_t)a3 waitUntilFinished:;
- (void)performAfter:(double)a3 block:;
- (void)performAsyncBlock:(void *)a1;
- (void)performSyncBlock:(void *)a1;
@end

@implementation _DKSyncSerializer

+ (id)sharedInstance
{
  self;
  if (sharedInstance_initialized_3 != -1) {
    dispatch_once(&sharedInstance_initialized_3, &__block_literal_global_69);
  }
  v0 = (void *)sharedInstance_dispatcher;
  return v0;
}

+ (void)performAsyncBlock:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performAsyncBlock:](v4, v3);
}

- (void)performAsyncBlock:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 16, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39___DKSyncSerializer_performAsyncBlock___block_invoke;
    block[3] = &unk_1E560D950;
    id v7 = v4;
    dispatch_async(Property, block);
  }
}

+ (void)performSyncBlock:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performSyncBlock:](v4, v3);
}

- (void)performSyncBlock:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 16, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38___DKSyncSerializer_performSyncBlock___block_invoke;
    block[3] = &unk_1E560D950;
    id v7 = v4;
    dispatch_sync(Property, block);
  }
}

+ (void)performAfter:(double)a3 block:(id)a4
{
  id v5 = a4;
  +[_DKSyncSerializer sharedInstance]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performAfter:block:](v6, v5, a3);
}

- (void)performAfter:(double)a3 block:
{
  id v5 = a2;
  if (a1)
  {
    dispatch_time_t v6 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    Property = objc_getProperty(a1, v7, 16, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40___DKSyncSerializer_performAfter_block___block_invoke;
    block[3] = &unk_1E560D950;
    id v10 = v5;
    dispatch_after(v6, Property, block);
  }
}

+ (void)addOperation:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperation:](v4, v3);
}

- (void)addOperation:(void *)a1
{
  if (a1)
  {
    id v4 = a2;
    objc_msgSend(objc_getProperty(a1, v3, 8, 1), "addOperation:", v4);
  }
}

+ (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperations:waitUntilFinished:](v6, v5, v4);
}

- (void)addOperations:(uint64_t)a3 waitUntilFinished:
{
  if (a1)
  {
    id v6 = a2;
    objc_msgSend(objc_getProperty(a1, v5, 8, 1), "addOperations:waitUntilFinished:", v6, a3);
  }
}

+ (void)addOperationWithBlock:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperationWithBlock:](v4, (uint64_t)v3);
}

- (void)addOperationWithBlock:(void *)a1
{
  if (a1)
  {
    id v3 = +[_DKSyncBlockOperation blockOperationWithBlock:a2];
    -[_DKSyncSerializer addOperation:](a1, v3);
  }
}

+ (void)addDependentOperation:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addDependentOperation:](v4, v3);
}

- (void)addDependentOperation:(void *)a1
{
  id obj = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained) {
      [obj addDependency:WeakRetained];
    }
    objc_storeWeak(v3 + 3, obj);

    objc_sync_exit(v3);
    objc_msgSend(objc_getProperty(v3, v5, 8, 1), "addOperation:", obj);
  }
}

+ (void)addDependentOperationWithBlock:(id)a3
{
  id v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addDependentOperationWithBlock:](v4, (uint64_t)v3);
}

- (void)addDependentOperationWithBlock:(void *)a1
{
  if (a1)
  {
    id v3 = +[_DKSyncBlockOperation blockOperationWithBlock:a2];
    -[_DKSyncSerializer addDependentOperation:](a1, v3);
  }
}

+ (id)operationQueue
{
  Property = +[_DKSyncSerializer sharedInstance]();
  id v4 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v3, 8, 1);
  }
  id v5 = Property;

  return v5;
}

+ (id)underlyingQueue
{
  Property = +[_DKSyncSerializer sharedInstance]();
  id v4 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v3, 16, 1);
  }
  id v5 = Property;

  return v5;
}

- (_DKSyncSerializer)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DKSyncSerializer;
  v2 = [(_DKSyncSerializer *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("_DKSyncDispatcher Queue", 0);
    underlyingQueue = v2->_underlyingQueue;
    v2->_underlyingQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v5;

    [(NSOperationQueue *)v2->_operationQueue setName:@"_DKSyncDispatcher Operation Queue"];
    [(NSOperationQueue *)v2->_operationQueue setUnderlyingQueue:v2->_underlyingQueue];
  }
  return v2;
}

- (id)description
{
  dispatch_queue_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return v6;
}

- (id)debugDescription
{
  dispatch_queue_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 8, 1);
  }
  else {
    id Property = 0;
  }
  v9 = [Property debugDescription];
  if (self) {
    id v10 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v10 = 0;
  }
  v11 = [v10 debugDescription];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousOperation);
  v13 = [v3 stringWithFormat:@"<%@ %p: operationQueue=%@, underlyingQueue=%@, previousOperation=%@>", v6, self, v9, v11, WeakRetained];

  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousOperation);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end