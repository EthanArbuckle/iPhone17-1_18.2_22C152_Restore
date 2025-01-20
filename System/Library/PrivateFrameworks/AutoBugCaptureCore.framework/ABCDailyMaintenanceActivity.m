@interface ABCDailyMaintenanceActivity
+ (const)periodicActivityID;
+ (id)sharedInstance;
+ (int64_t)periodicActivityInterval;
@end

@implementation ABCDailyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance_sSharedActivity;

  return v2;
}

uint64_t __45__ABCDailyMaintenanceActivity_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ABCDailyMaintenanceActivity);
  uint64_t v1 = sharedInstance_sSharedActivity;
  sharedInstance_sSharedActivity = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x263EF81E8];
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.Daily";
}

@end