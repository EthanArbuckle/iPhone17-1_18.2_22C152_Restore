@interface CLFSettings_GeneratedCode
+ (CLFSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (BOOL)allowSiri;
- (BOOL)batteryMonitoringEnabled;
- (BOOL)emergencyKeypadEnabled;
- (BOOL)hasMigratedFileProtections;
- (BOOL)lockScreenClockEnabled;
- (BOOL)notificationsEnabled;
- (BOOL)shouldShowTripleClickInstructions;
- (BOOL)silentModeToggleEnabled;
- (BOOL)volumeButtonsEnabled;
- (CLFSettings_GeneratedCode)init;
- (NSArray)applicationBundleIdentifiers;
- (NSArray)overrideNonClarityApplicationBundleIdentifiers;
- (NSString)adminPasscodeRecoveryAppleID;
- (NSString)listLayout;
- (NSString)restartReason;
- (void)setAdminPasscodeRecoveryAppleID:(id)a3;
- (void)setAllowSiri:(BOOL)a3;
- (void)setApplicationBundleIdentifiers:(id)a3;
- (void)setBatteryMonitoringEnabled:(BOOL)a3;
- (void)setEmergencyKeypadEnabled:(BOOL)a3;
- (void)setHasMigratedFileProtections:(BOOL)a3;
- (void)setListLayout:(id)a3;
- (void)setLockScreenClockEnabled:(BOOL)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setOverrideNonClarityApplicationBundleIdentifiers:(id)a3;
- (void)setRestartReason:(id)a3;
- (void)setShouldShowTripleClickInstructions:(BOOL)a3;
- (void)setSilentModeToggleEnabled:(BOOL)a3;
- (void)setVolumeButtonsEnabled:(BOOL)a3;
@end

@implementation CLFSettings_GeneratedCode

+ (CLFSettings)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_SharedSettings;
  return (CLFSettings *)v2;
}

- (CLFSettings_GeneratedCode)init
{
  v33.receiver = self;
  v33.super_class = (Class)CLFSettings_GeneratedCode;
  v2 = [(CLFBaseSettings *)&v33 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_adminPasscodeRecoveryAppleID);
    [v4 setObject:@"AdminPasscodeRecoveryAppleID" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_allowSiri);
    [v6 setObject:@"AllowSiri" forKeyedSubscript:v7];

    v8 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v9 = NSStringFromSelector(sel_applicationBundleIdentifiers);
    [v8 setObject:@"ApplicationBundleIdentifiers" forKeyedSubscript:v9];

    v10 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v11 = NSStringFromSelector(sel_batteryMonitoringEnabled);
    [v10 setObject:@"BatteryMonitoringEnabled" forKeyedSubscript:v11];

    v12 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v13 = NSStringFromSelector(sel_emergencyKeypadEnabled);
    [v12 setObject:@"EmergencyKeypadEnabled" forKeyedSubscript:v13];

    v14 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v15 = NSStringFromSelector(sel_hasMigratedFileProtections);
    [v14 setObject:@"HasMigratedFileProtections" forKeyedSubscript:v15];

    v16 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v17 = NSStringFromSelector(sel_listLayout);
    [v16 setObject:@"ListLayout" forKeyedSubscript:v17];

    v18 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v19 = NSStringFromSelector(sel_lockScreenClockEnabled);
    [v18 setObject:@"LockScreenClockEnabled" forKeyedSubscript:v19];

    v20 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v21 = NSStringFromSelector(sel_notificationsEnabled);
    [v20 setObject:@"NotificationsEnabled" forKeyedSubscript:v21];

    v22 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v23 = NSStringFromSelector(sel_overrideNonClarityApplicationBundleIdentifiers);
    [v22 setObject:@"OverrideNonClarityApplicationBundleIdentifiers" forKeyedSubscript:v23];

    v24 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v25 = NSStringFromSelector(sel_restartReason);
    [v24 setObject:@"RestartReason" forKeyedSubscript:v25];

    v26 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v27 = NSStringFromSelector(sel_shouldShowTripleClickInstructions);
    [v26 setObject:@"ShouldShowTripleClickInstructions" forKeyedSubscript:v27];

    v28 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v29 = NSStringFromSelector(sel_silentModeToggleEnabled);
    [v28 setObject:@"SilentModeToggleEnabled" forKeyedSubscript:v29];

    v30 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v31 = NSStringFromSelector(sel_volumeButtonsEnabled);
    [v30 setObject:@"VolumeButtonsEnabled" forKeyedSubscript:v31];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v21[14] = *MEMORY[0x263EF8340];
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___CLFSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v20, sel_allPreferenceSelectorsAsStrings);
  v19 = NSStringFromSelector(sel_adminPasscodeRecoveryAppleID);
  v21[0] = v19;
  v18 = NSStringFromSelector(sel_allowSiri);
  v21[1] = v18;
  v17 = NSStringFromSelector(sel_applicationBundleIdentifiers);
  v21[2] = v17;
  v16 = NSStringFromSelector(sel_batteryMonitoringEnabled);
  v21[3] = v16;
  v15 = NSStringFromSelector(sel_emergencyKeypadEnabled);
  v21[4] = v15;
  v14 = NSStringFromSelector(sel_hasMigratedFileProtections);
  v21[5] = v14;
  v3 = NSStringFromSelector(sel_listLayout);
  v21[6] = v3;
  v4 = NSStringFromSelector(sel_lockScreenClockEnabled);
  v21[7] = v4;
  v5 = NSStringFromSelector(sel_notificationsEnabled);
  v21[8] = v5;
  v6 = NSStringFromSelector(sel_overrideNonClarityApplicationBundleIdentifiers);
  v21[9] = v6;
  v7 = NSStringFromSelector(sel_restartReason);
  v21[10] = v7;
  v8 = NSStringFromSelector(sel_shouldShowTripleClickInstructions);
  v21[11] = v8;
  v9 = NSStringFromSelector(sel_silentModeToggleEnabled);
  v21[12] = v9;
  v10 = NSStringFromSelector(sel_volumeButtonsEnabled);
  v21[13] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:14];
  id v13 = [v2 arrayByAddingObjectsFromArray:v11];

  return v13;
}

- (NSString)adminPasscodeRecoveryAppleID
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"AdminPasscodeRecoveryAppleID" ofClass:v3 defaultValue:0];
}

- (void)setAdminPasscodeRecoveryAppleID:(id)a3
{
}

- (BOOL)allowSiri
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"AllowSiri" defaultValue:0];
}

- (void)setAllowSiri:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AllowSiri"];
}

- (NSArray)applicationBundleIdentifiers
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = MEMORY[0x263EFFA68];
  return (NSArray *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"ApplicationBundleIdentifiers" ofClass:v3 defaultValue:v4];
}

- (void)setApplicationBundleIdentifiers:(id)a3
{
}

- (BOOL)batteryMonitoringEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"BatteryMonitoringEnabled" defaultValue:0];
}

- (void)setBatteryMonitoringEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"BatteryMonitoringEnabled"];
}

- (BOOL)emergencyKeypadEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"EmergencyKeypadEnabled" defaultValue:0];
}

- (void)setEmergencyKeypadEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"EmergencyKeypadEnabled"];
}

- (BOOL)hasMigratedFileProtections
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"HasMigratedFileProtections" defaultValue:0];
}

- (void)setHasMigratedFileProtections:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"HasMigratedFileProtections"];
}

- (NSString)listLayout
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"ListLayout" ofClass:v3 defaultValue:@"grid"];
}

- (void)setListLayout:(id)a3
{
}

- (BOOL)lockScreenClockEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"LockScreenClockEnabled" defaultValue:1];
}

- (void)setLockScreenClockEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"LockScreenClockEnabled"];
}

- (BOOL)notificationsEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"NotificationsEnabled" defaultValue:1];
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"NotificationsEnabled"];
}

- (NSArray)overrideNonClarityApplicationBundleIdentifiers
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = MEMORY[0x263EFFA68];
  return (NSArray *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"OverrideNonClarityApplicationBundleIdentifiers" ofClass:v3 defaultValue:v4];
}

- (void)setOverrideNonClarityApplicationBundleIdentifiers:(id)a3
{
}

- (NSString)restartReason
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"RestartReason" ofClass:v3 defaultValue:@"unknown"];
}

- (void)setRestartReason:(id)a3
{
}

- (BOOL)shouldShowTripleClickInstructions
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"ShouldShowTripleClickInstructions" defaultValue:0];
}

- (void)setShouldShowTripleClickInstructions:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ShouldShowTripleClickInstructions"];
}

- (BOOL)silentModeToggleEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"SilentModeToggleEnabled" defaultValue:0];
}

- (void)setSilentModeToggleEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SilentModeToggleEnabled"];
}

- (BOOL)volumeButtonsEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"VolumeButtonsEnabled" defaultValue:1];
}

- (void)setVolumeButtonsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VolumeButtonsEnabled"];
}

@end