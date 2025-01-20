@interface VNDetectorSyncTasksQueueCache
+ (id)queueLabelWithUniqueAppendix:(id)a3;
+ (id)sharedCache;
+ (int64_t)maximumAllowedTasksInTheQueue;
@end

@implementation VNDetectorSyncTasksQueueCache

+ (id)sharedCache
{
  if (+[VNDetectorSyncTasksQueueCache sharedCache]::onceToken != -1) {
    dispatch_once(&+[VNDetectorSyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_138);
  }
  v2 = (void *)+[VNDetectorSyncTasksQueueCache sharedCache]::cache;

  return v2;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3 = a3;
  v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.VN.detectorSyncTasksQueue.%@", v3];

  return v4;
}

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

uint64_t __44__VNDetectorSyncTasksQueueCache_sharedCache__block_invoke()
{
  +[VNDetectorSyncTasksQueueCache sharedCache]::cache = objc_alloc_init(VNDetectorSyncTasksQueueCache);

  return MEMORY[0x1F41817F8]();
}

@end