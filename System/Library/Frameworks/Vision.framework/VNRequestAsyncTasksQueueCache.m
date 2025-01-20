@interface VNRequestAsyncTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
+ (id)sharedCache;
+ (int64_t)maximumAllowedTasksInTheQueue;
@end

@implementation VNRequestAsyncTasksQueueCache

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 8;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  return @"com.apple.VN.requestAsyncTasksQueue";
}

+ (id)sharedCache
{
  if (+[VNRequestAsyncTasksQueueCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[VNRequestAsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_118);
  }
  v2 = (void *)+[VNRequestAsyncTasksQueueCache sharedCache]::cache;

  return v2;
}

uint64_t __44__VNRequestAsyncTasksQueueCache_sharedCache__block_invoke()
{
  +[VNRequestAsyncTasksQueueCache sharedCache]::cache = objc_alloc_init(VNRequestAsyncTasksQueueCache);

  return MEMORY[0x1F41817F8]();
}

@end