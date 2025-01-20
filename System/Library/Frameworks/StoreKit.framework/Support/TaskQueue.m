@interface TaskQueue
+ (id)networkQueue;
- (NSArray)tasks;
- (NSString)name;
- (TaskQueue)init;
- (int64_t)maxConcurrentOperationCount;
- (int64_t)qualityOfService;
- (void)addTask:(id)a3;
- (void)addTaskWithBlock:(id)a3;
- (void)addTasks:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)cancelAllTasks;
- (void)setMaxConcurrentOperationCount:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setUnderlyingQueue:(id)a3;
- (void)waitUntilAllTasksAreFinished;
@end

@implementation TaskQueue

+ (id)networkQueue
{
  if (qword_10039F770 != -1) {
    dispatch_once(&qword_10039F770, &stru_1003576A8);
  }
  v2 = (void *)qword_10039F768;

  return v2;
}

- (TaskQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)TaskQueue;
  v2 = [(TaskQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.storekit.TaskQueue"];
  }
  return v2;
}

- (int64_t)maxConcurrentOperationCount
{
  return [(NSOperationQueue *)self->_operationQueue maxConcurrentOperationCount];
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
}

- (void)setUnderlyingQueue:(id)a3
{
}

- (NSString)name
{
  return [(NSOperationQueue *)self->_operationQueue name];
}

- (void)setName:(id)a3
{
}

- (NSArray)tasks
{
  return [(NSOperationQueue *)self->_operationQueue operations];
}

- (int64_t)qualityOfService
{
  return [(NSOperationQueue *)self->_operationQueue qualityOfService];
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)addTask:(id)a3
{
}

- (void)addTasks:(id)a3 waitUntilFinished:(BOOL)a4
{
}

- (void)addTaskWithBlock:(id)a3
{
}

- (void)cancelAllTasks
{
}

- (void)waitUntilAllTasksAreFinished
{
}

- (void).cxx_destruct
{
}

@end