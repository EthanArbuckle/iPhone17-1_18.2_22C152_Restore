@interface VNControlledCapacityTasksQueue
+ (int64_t)tasksTimeout;
+ (void)setTasksTimeout:(int64_t)a3;
- (BOOL)currentQueueIsSynchronizationQueue;
- (BOOL)dispatchGroupWait:(id)a3 error:(id *)a4;
- (VNControlledCapacityTasksQueue)initWithDispatchQueueLabel:(id)a3 maximumTasksCount:(int64_t)a4;
- (id)description;
- (int64_t)maximumTasksCount;
- (void)dispatchGroupAsyncByPreservingQueueCapacity:(id)a3 block:(id)a4;
- (void)dispatchReportBlockCompletion;
- (void)dispatchSyncByPreservingQueueCapacity:(id)a3;
- (void)setMaximumTasksCount:(int64_t)a3;
@end

@implementation VNControlledCapacityTasksQueue

+ (void)setTasksTimeout:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_tasksTimeoutLock);
  _tasksTimeout = a3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_tasksTimeoutLock);
}

- (void)dispatchSyncByPreservingQueueCapacity:(id)a3
{
  semaphore = self->_semaphore;
  id v5 = a3;
  dispatch_semaphore_wait(semaphore, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_sync((dispatch_queue_t)self->_queue, v5);

  v6 = self->_semaphore;

  dispatch_semaphore_signal(v6);
}

- (BOOL)currentQueueIsSynchronizationQueue
{
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  +[VNError VNAssert:label != 0 log:@"Synchronization queue must be initialized"];
  v3 = dispatch_queue_get_label(0);
  if (v3) {
    LOBYTE(v3) = strcmp(label, v3) == 0;
  }
  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Controlled Capacity Tasks Queue: %@; %@",
                 self->_queue,
                 self->_semaphore);

  return v2;
}

- (int64_t)maximumTasksCount
{
  return self->_maximumTasksCount;
}

- (void)setMaximumTasksCount:(int64_t)a3
{
  if (a3 <= 0)
  {
    objc_msgSend([NSString alloc], "initWithFormat:", @"Maximum queue tasks count (%ld) must be a positive number", a3);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0);
  }
  else
  {
    self->_maximumTasksCount = a3;
    self->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
  }

  MEMORY[0x1F41817F8]();
}

- (void)dispatchReportBlockCompletion
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  VNValidatedLog(1, @"Finished processing a task from the queue: %@", v3, v4, v5, v6, v7, v8, (uint64_t)self->_queue);
}

- (BOOL)dispatchGroupWait:(id)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  int64_t v6 = +[VNControlledCapacityTasksQueue tasksTimeout];
  if (v6 < 1) {
    dispatch_time_t v7 = -1;
  }
  else {
    dispatch_time_t v7 = dispatch_time(0, v6);
  }
  intptr_t v8 = dispatch_group_wait(v5, v7);
  intptr_t v9 = v8;
  if (a4 && v8)
  {
    *a4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dispatch_group_wait completion"];
  }

  return v9 == 0;
}

- (void)dispatchGroupAsyncByPreservingQueueCapacity:(id)a3 block:(id)a4
{
  semaphore = self->_semaphore;
  id v7 = a4;
  group = a3;
  dispatch_semaphore_wait(semaphore, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_async(group, (dispatch_queue_t)self->_queue, v7);
}

- (VNControlledCapacityTasksQueue)initWithDispatchQueueLabel:(id)a3 maximumTasksCount:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNControlledCapacityTasksQueue;
  id v7 = [(VNControlledCapacityTasksQueue *)&v17 init];
  intptr_t v8 = v7;
  intptr_t v9 = 0;
  if (a4 >= 1 && v7)
  {
    v10 = (const char *)[v6 UTF8String];
    v11 = [(id)objc_opt_class() dispatchQueueAttribute];
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    v8->_maximumTasksCount = a4;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(a4);
    semaphore = v8->_semaphore;
    v8->_semaphore = (OS_dispatch_semaphore *)v14;

    intptr_t v9 = v8;
  }

  return v9;
}

+ (int64_t)tasksTimeout
{
  return _tasksTimeout;
}

@end