@interface HUHearingSettings
+ (id)sharedInstance;
- (BOOL)shouldStoreLocally;
- (NSArray)hearingControlCenterOrder;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (void)logMessage:(id)a3;
- (void)setHearingControlCenterOrder:(id)a3;
@end

@implementation HUHearingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_22);
  }
  v2 = (void *)sharedInstance_Settings_4;

  return v2;
}

uint64_t __35__HUHearingSettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUHearingSettings);
  uint64_t v1 = sharedInstance_Settings_4;
  sharedInstance_Settings_4 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return @"com.apple.Hearing";
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  HearingInitializeLogging();
  v4 = [NSString stringWithFormat:@"%@", v3];

  v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUHearingSettings logMessage:]", 36, v4];
  v6 = (void *)*MEMORY[0x263F472A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472A8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (NSArray)hearingControlCenterOrder
{
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26C1E59C0, &unk_26C1E59D8, &unk_26C1E59F0, &unk_26C1E5A08, &unk_26C1E5A20, &unk_26C1E5A38, 0);
  v5 = [(HCSettings *)self objectValueForKey:@"hearingControlCenterOrder" withClass:v3 andDefaultValue:v4];

  return (NSArray *)v5;
}

- (void)setHearingControlCenterOrder:(id)a3
{
}

@end