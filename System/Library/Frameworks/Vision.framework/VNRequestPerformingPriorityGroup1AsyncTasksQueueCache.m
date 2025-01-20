@interface VNRequestPerformingPriorityGroup1AsyncTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
+ (id)sharedCache;
+ (int64_t)maximumAllowedTasksInTheQueue;
@end

@implementation VNRequestPerformingPriorityGroup1AsyncTasksQueueCache

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.VN.VNRequestPerformingPriorityGroup1AsyncTasksQueue.%@", v3];

  return v4;
}

+ (id)sharedCache
{
  if (+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_6063);
  }
  v2 = (void *)+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::cache;

  return v2;
}

uint64_t __68__VNRequestPerformingPriorityGroup1AsyncTasksQueueCache_sharedCache__block_invoke()
{
  +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::cache = objc_alloc_init(VNRequestPerformingPriorityGroup1AsyncTasksQueueCache);

  return MEMORY[0x1F41817F8]();
}

@end