@interface VNRequestPerformingPriorityGroup2AsyncTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
+ (id)sharedCache;
+ (int64_t)maximumAllowedTasksInTheQueue;
@end

@implementation VNRequestPerformingPriorityGroup2AsyncTasksQueueCache

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 8;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.VN.VNRequestPerformingPriorityGroup2AsyncTasksQueue.%@", v3];

  return v4;
}

+ (id)sharedCache
{
  if (+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_108);
  }
  v2 = (void *)+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::cache;

  return v2;
}

uint64_t __68__VNRequestPerformingPriorityGroup2AsyncTasksQueueCache_sharedCache__block_invoke()
{
  +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::cache = objc_alloc_init(VNRequestPerformingPriorityGroup2AsyncTasksQueueCache);

  return MEMORY[0x1F41817F8]();
}

@end