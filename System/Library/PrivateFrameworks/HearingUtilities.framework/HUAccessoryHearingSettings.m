@interface HUAccessoryHearingSettings
+ (id)sharedInstance;
- (BOOL)activeHearingProtectionAvailableForAddress:(id)a3;
- (BOOL)activeHearingProtectionEnabledForAddress:(id)a3;
- (BOOL)shouldStoreLocally;
- (NSDictionary)activeHearingProtectionAvailable;
- (NSDictionary)activeHearingProtectionEnabled;
- (id)keysToSync;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (void)logMessage:(id)a3;
- (void)setActiveHearingProtectionAvailable:(BOOL)a3 forAddress:(id)a4;
- (void)setActiveHearingProtectionAvailable:(id)a3;
- (void)setActiveHearingProtectionEnabled:(BOOL)a3 forAddress:(id)a4;
- (void)setActiveHearingProtectionEnabled:(id)a3;
@end

@implementation HUAccessoryHearingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_Settings_0;

  return v2;
}

uint64_t __44__HUAccessoryHearingSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings_0 = objc_alloc_init(HUAccessoryHearingSettings);

  return MEMORY[0x270F9A758]();
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return @"com.apple.accessory.Hearing";
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)keysToSync
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  HCHPInitializeLogging();
  v4 = [NSString stringWithFormat:@"%@", v3];

  v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSettings logMessage:]", 41, v4];
  v6 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (NSDictionary)activeHearingProtectionEnabled
{
  uint64_t v3 = objc_opt_class();

  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"activeHearingProtectionEnabled" withClass:v3 andDefaultValue:0];
}

- (void)setActiveHearingProtectionEnabled:(id)a3
{
}

- (NSDictionary)activeHearingProtectionAvailable
{
  uint64_t v3 = objc_opt_class();

  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"activeHearingProtectionAvailable" withClass:v3 andDefaultValue:0];
}

- (void)setActiveHearingProtectionAvailable:(id)a3
{
}

- (BOOL)activeHearingProtectionEnabledForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(HUAccessoryHearingSettings *)self activeHearingProtectionEnabled];
    v6 = [v5 valueForKey:v4];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setActiveHearingProtectionEnabled:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    v6 = (void *)MEMORY[0x263EFF9A0];
    char v7 = [(HUAccessoryHearingSettings *)self activeHearingProtectionEnabled];
    v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithBool:v4];
    [v8 setValue:v9 forKey:v10];

    [(HUAccessoryHearingSettings *)self setActiveHearingProtectionEnabled:v8];
  }
}

- (BOOL)activeHearingProtectionAvailableForAddress:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(HUAccessoryHearingSettings *)self activeHearingProtectionAvailable];
    HCHPInitializeLogging();
    v6 = [NSString stringWithFormat:@"Checking available for %@ = %@", v4, v5];
    char v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUAccessoryHearingSettings activeHearingProtectionAvailableForAddress:]", 81, v6];
    v8 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      id v10 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v11 = [v5 valueForKey:v4];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v12 = [v11 BOOLValue];
    }
    else {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)setActiveHearingProtectionAvailable:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    v6 = (void *)MEMORY[0x263EFF9A0];
    char v7 = [(HUAccessoryHearingSettings *)self activeHearingProtectionAvailable];
    v8 = [v6 dictionaryWithDictionary:v7];

    id v9 = [NSNumber numberWithBool:v4];
    [v8 setValue:v9 forKey:v10];

    [(HUAccessoryHearingSettings *)self setActiveHearingProtectionAvailable:v8];
  }
}

@end