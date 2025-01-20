@interface ABCSemiDailyMaintenanceActivity
+ (const)periodicActivityID;
+ (id)sharedInstance;
+ (int64_t)periodicActivityInterval;
@end

@implementation ABCSemiDailyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_61 != -1) {
    dispatch_once(&sharedInstance_onceToken_61, &__block_literal_global_63);
  }
  v2 = (void *)sharedInstance_sSharedActivity_60;

  return v2;
}

uint64_t __49__ABCSemiDailyMaintenanceActivity_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ABCSemiDailyMaintenanceActivity);
  uint64_t v1 = sharedInstance_sSharedActivity_60;
  sharedInstance_sSharedActivity_60 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x263EF81E8] / 2;
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.SemiDaily";
}

@end