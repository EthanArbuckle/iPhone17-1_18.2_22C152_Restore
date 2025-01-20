@interface DKSyncUrgencyTracker
@end

@implementation DKSyncUrgencyTracker

uint64_t __39___DKSyncUrgencyTracker_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_tracker;
  sharedInstance_tracker = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end