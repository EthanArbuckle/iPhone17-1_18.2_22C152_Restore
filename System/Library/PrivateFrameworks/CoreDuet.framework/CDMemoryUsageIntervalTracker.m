@interface CDMemoryUsageIntervalTracker
@end

@implementation CDMemoryUsageIntervalTracker

void __47___CDMemoryUsageIntervalTracker_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = [v0 processName];

  if (([v3 isEqual:@"coreduetd"] & 1) != 0
    || ([v3 isEqual:@"knowledge-agent"] & 1) != 0
    || ([v3 isEqual:@"contextstored"] & 1) != 0
    || [v3 isEqual:@"ContextStoreAgent"])
  {
    v1 = objc_alloc_init(_CDMemoryUsageIntervalTracker);
    v2 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v1;
  }
}

@end