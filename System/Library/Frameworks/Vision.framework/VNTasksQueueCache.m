@interface VNTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
- (VNTasksQueueCache)init;
- (id)_queueWithUniqueAppendix:(id)a3 queueClass:(Class)a4;
- (id)queueWithUniqueAppendix:(id)a3;
- (int64_t)maximumTasksCount;
- (void)releaseAllQueues;
- (void)releaseQueueWithUniqueAppendix:(id)a3;
- (void)setMaximumTasksCount:(int64_t)a3;
@end

@implementation VNTasksQueueCache

- (id)_queueWithUniqueAppendix:(id)a3 queueClass:(Class)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  v7 = [(id)objc_opt_class() queueLabelWithUniqueAppendix:v6];
  v8 = [(NSMutableDictionary *)self->_queueNameToTasksQueueDictionary objectForKey:v7];
  if (!v8)
  {
    v8 = objc_msgSend([a4 alloc], "initWithDispatchQueueLabel:maximumTasksCount:", v7, objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue"));
    [(NSMutableDictionary *)self->_queueNameToTasksQueueDictionary setObject:v8 forKeyedSubscript:v7];
    VNValidatedLog(1, @"Created new tasks queue: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }

  os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);

  return v8;
}

- (void).cxx_destruct
{
}

- (void)releaseAllQueues
{
  p_queueNameToTasksQueueDictionaryLock = &self->_queueNameToTasksQueueDictionaryLock;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  queueNameToTasksQueueDictionary = self->_queueNameToTasksQueueDictionary;
  self->_queueNameToTasksQueueDictionary = v4;

  os_unfair_lock_unlock(p_queueNameToTasksQueueDictionaryLock);
}

- (void)releaseQueueWithUniqueAppendix:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  v4 = [(id)objc_opt_class() queueLabelWithUniqueAppendix:v5];
  [(NSMutableDictionary *)self->_queueNameToTasksQueueDictionary removeObjectForKey:v4];

  os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);
}

- (int64_t)maximumTasksCount
{
  return self->_maximumTasksCount;
}

- (void)setMaximumTasksCount:(int64_t)a3
{
  if (a3 >= 1 && [(id)objc_opt_class() maximumAllowedTasksInTheQueue] >= a3)
  {
    os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
    self->_maximumTasksCount = a3;
    queueNameToTasksQueueDictionary = self->_queueNameToTasksQueueDictionary;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__VNTasksQueueCache_setMaximumTasksCount___block_invoke;
    v7[3] = &unk_1E5B1C8B8;
    v7[4] = self;
    [(NSMutableDictionary *)queueNameToTasksQueueDictionary enumerateKeysAndObjectsUsingBlock:v7];
    os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);
  }
  else
  {
    id v6 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Maximum queue tasks count (%ld) is outside of the allowed range [1; %ld]",
               a3,
               [(id)objc_opt_class() maximumAllowedTasksInTheQueue]);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0);
  }
}

uint64_t __42__VNTasksQueueCache_setMaximumTasksCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setMaximumTasksCount:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (id)queueWithUniqueAppendix:(id)a3
{
  return 0;
}

- (VNTasksQueueCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)VNTasksQueueCache;
  v2 = [(VNTasksQueueCache *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queueNameToTasksQueueDictionary = v2->_queueNameToTasksQueueDictionary;
    v2->_queueNameToTasksQueueDictionary = v3;

    v2->_queueNameToTasksQueueDictionaryLock._os_unfair_lock_opaque = 0;
    v2->_maximumTasksCount = [(id)objc_opt_class() maximumAllowedTasksInTheQueue];
    id v5 = v2;
  }

  return v2;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  return 0;
}

@end