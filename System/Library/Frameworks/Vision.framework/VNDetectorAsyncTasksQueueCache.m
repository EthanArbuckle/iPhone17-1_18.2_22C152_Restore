@interface VNDetectorAsyncTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
+ (id)sharedCache;
+ (int64_t)maximumAllowedTasksInTheQueue;
@end

@implementation VNDetectorAsyncTasksQueueCache

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.VN.detectorAsyncTasksQueue.%@", v3];

  return v4;
}

+ (id)sharedCache
{
  if (+[VNDetectorAsyncTasksQueueCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[VNDetectorAsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_128);
  }
  v2 = (void *)+[VNDetectorAsyncTasksQueueCache sharedCache]::cache;

  return v2;
}

uint64_t __45__VNDetectorAsyncTasksQueueCache_sharedCache__block_invoke()
{
  +[VNDetectorAsyncTasksQueueCache sharedCache]::cache = objc_alloc_init(VNDetectorAsyncTasksQueueCache);

  return MEMORY[0x1F41817F8]();
}

@end