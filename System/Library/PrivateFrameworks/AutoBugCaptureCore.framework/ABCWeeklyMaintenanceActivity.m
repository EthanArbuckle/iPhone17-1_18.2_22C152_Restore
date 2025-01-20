@interface ABCWeeklyMaintenanceActivity
+ (const)periodicActivityID;
+ (id)sharedInstance;
+ (int64_t)periodicActivityInterval;
@end

@implementation ABCWeeklyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_71 != -1) {
    dispatch_once(&sharedInstance_onceToken_71, &__block_literal_global_73);
  }
  v2 = (void *)sharedInstance_sSharedActivity_70;

  return v2;
}

uint64_t __46__ABCWeeklyMaintenanceActivity_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ABCWeeklyMaintenanceActivity);
  uint64_t v1 = sharedInstance_sSharedActivity_70;
  sharedInstance_sSharedActivity_70 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x263EF8218];
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.Weekly";
}

@end