@interface SGLongRunningTaskManager
+ (SGLongRunningTaskManager)sharedInstance;
- (SGLongRunningTaskManager)init;
- (id)task;
- (id)taskWithDeadline:(double)a3;
- (void)dealloc;
- (void)tellCurrentTasksToDefer;
- (void)unregister:(id)a3;
@end

@implementation SGLongRunningTaskManager

- (void).cxx_destruct
{
}

- (void)tellCurrentTasksToDefer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_tasks;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "requestDefer", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  pthread_mutex_unlock(p_lock);
}

- (void)unregister:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [(NSHashTable *)self->_tasks removeObject:v5];

  pthread_mutex_unlock(p_lock);
}

- (id)taskWithDeadline:(double)a3
{
  id v5 = [SGLongRunningTask alloc];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:a3];
  uint64_t v7 = [(SGLongRunningTask *)v5 initWithDeadline:v6 manager:self];

  pthread_mutex_lock(&self->_lock);
  [(NSHashTable *)self->_tasks addObject:v7];
  pthread_mutex_unlock(&self->_lock);
  return v7;
}

- (id)task
{
  v3 = [[SGLongRunningTask alloc] initWithDeadline:0 manager:self];
  pthread_mutex_lock(&self->_lock);
  [(NSHashTable *)self->_tasks addObject:v3];
  pthread_mutex_unlock(&self->_lock);
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGLongRunningTaskManager;
  [(SGLongRunningTaskManager *)&v3 dealloc];
}

- (SGLongRunningTaskManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGLongRunningTaskManager;
  v2 = [(SGLongRunningTaskManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    tasks = v2->_tasks;
    v2->_tasks = (NSHashTable *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

+ (SGLongRunningTaskManager)sharedInstance
{
  if (sharedInstance__pasOnceToken9 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken9, &__block_literal_global_90);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_88;
  return (SGLongRunningTaskManager *)v2;
}

void __42__SGLongRunningTaskManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_88;
  sharedInstance__pasExprOnceResult_88 = v1;
}

@end