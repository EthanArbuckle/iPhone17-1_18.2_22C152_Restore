@interface BLOperationQueue
- (BLOperationQueue)init;
- (id)name;
- (id)operations;
- (int64_t)maxConcurrentOperationCount;
- (int64_t)operationCount;
- (int64_t)qualityOfService;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMaxConcurrentOperationCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation BLOperationQueue

- (BLOperationQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLOperationQueue;
  v2 = [(BLOperationQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v2->_queue addObserver:v2 forKeyPath:@"operationCount" options:0 context:off_1001C75D0];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_queue removeObserver:self forKeyPath:@"operationCount" context:off_1001C75D0];
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)BLOperationQueue;
  [(BLOperationQueue *)&v3 dealloc];
}

- (void)addOperation:(id)a3
{
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
}

- (void)cancelAllOperations
{
}

- (int64_t)operationCount
{
  return [(NSOperationQueue *)self->_queue operationCount];
}

- (int64_t)maxConcurrentOperationCount
{
  return [(NSOperationQueue *)self->_queue maxConcurrentOperationCount];
}

- (id)name
{
  return [(NSOperationQueue *)self->_queue name];
}

- (id)operations
{
  return [(NSOperationQueue *)self->_queue operations];
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setSuspended:(BOOL)a3
{
}

- (int64_t)qualityOfService
{
  return [(NSOperationQueue *)self->_queue qualityOfService];
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NSOperationQueue *)a4;
  id v12 = a5;
  if (off_1001C75D0 == a6)
  {
    if (self->_queue == v11 && [v10 isEqualToString:@"operationCount"])
    {
      v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"BLOperationQueueOperationCountChangedNotification" object:self];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BLOperationQueue;
    [(BLOperationQueue *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void).cxx_destruct
{
}

@end