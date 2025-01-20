@interface EFScheduler(MessageUI)
+ (id)__mui_nextRunLoopMainThreadScheduler;
@end

@implementation EFScheduler(MessageUI)

+ (id)__mui_nextRunLoopMainThreadScheduler
{
  if (__mui_nextRunLoopMainThreadScheduler_onceToken != -1) {
    dispatch_once(&__mui_nextRunLoopMainThreadScheduler_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)__mui_nextRunLoopMainThreadScheduler_scheduler;

  return v0;
}

@end