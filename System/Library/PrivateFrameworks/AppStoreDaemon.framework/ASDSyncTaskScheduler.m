@interface ASDSyncTaskScheduler
+ (id)sharedInstance;
- (void)scheduleBlock:(id)a3;
@end

@implementation ASDSyncTaskScheduler

+ (id)sharedInstance
{
  self;
  if (_MergedGlobals_22 != -1) {
    dispatch_once(&_MergedGlobals_22, &__block_literal_global);
  }
  v0 = (void *)qword_1EB4D63F0;
  return v0;
}

uint64_t __38__ASDSyncTaskScheduler_sharedInstance__block_invoke()
{
  qword_1EB4D63F0 = objc_alloc_init(ASDSyncTaskScheduler);
  return MEMORY[0x1F41817F8]();
}

- (void)scheduleBlock:(id)a3
{
}

@end