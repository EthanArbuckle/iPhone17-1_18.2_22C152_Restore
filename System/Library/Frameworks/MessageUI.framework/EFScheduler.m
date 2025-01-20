@interface EFScheduler
@end

@implementation EFScheduler

void __62__EFScheduler_MessageUI____mui_nextRunLoopMainThreadScheduler__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F60F28];
  uint64_t v1 = MEMORY[0x1E4F14428];
  id v2 = MEMORY[0x1E4F14428];
  uint64_t v3 = [v0 dispatchQueueSchedulerWithQueue:v1];
  v4 = (void *)__mui_nextRunLoopMainThreadScheduler_scheduler;
  __mui_nextRunLoopMainThreadScheduler_scheduler = v3;

  v5 = (void *)MEMORY[0x1E4F14428];
}

@end