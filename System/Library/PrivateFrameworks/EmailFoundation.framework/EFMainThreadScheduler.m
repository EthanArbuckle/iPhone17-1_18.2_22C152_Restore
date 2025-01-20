@interface EFMainThreadScheduler
- (BOOL)prefersImmediateExecution;
- (EFMainThreadScheduler)init;
@end

@implementation EFMainThreadScheduler

- (EFMainThreadScheduler)init
{
  v3.receiver = self;
  v3.super_class = (Class)EFMainThreadScheduler;
  return [(EFQueueScheduler *)&v3 initWithQueue:MEMORY[0x1E4F14428]];
}

- (BOOL)prefersImmediateExecution
{
  return pthread_main_np() == 1;
}

@end