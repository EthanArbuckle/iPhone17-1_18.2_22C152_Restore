@interface AMAmbientDefaults
- (AMAmbientDefaults)init;
- (BOOL)hasMigratedClockCityWidget;
- (void)_bindAndRegisterDefaults;
- (void)setMigratedClockCityWidget:(BOOL)a3;
@end

@implementation AMAmbientDefaults

- (AMAmbientDefaults)init
{
  return (AMAmbientDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.ambient"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"enableAmbientMode"];
  uint64_t v4 = MEMORY[0x263EFFA88];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"AMEnableAmbientMode" toDefaultValue:MEMORY[0x263EFFA88] options:1];

  v5 = [NSString stringWithUTF8String:"alwaysOnMode"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"AMAlwaysOnEnabled" toDefaultValue:&unk_26FBC9098 options:1];

  v6 = [NSString stringWithUTF8String:"nightModeEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"AMNightModeEnabled" toDefaultValue:v4 options:1];

  v7 = [NSString stringWithUTF8String:"motionToWakeEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"AMMotionToWakeEnabled" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"bumpToWakeEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"AMBumpToWakeEnabled" toDefaultValue:v4 options:1];

  v9 = [NSString stringWithUTF8String:"notificationsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"AMNotificationsEnabled" toDefaultValue:v4 options:1];

  v10 = [NSString stringWithUTF8String:"notificationsPreviewOnTapOnlyEnabled"];
  uint64_t v11 = MEMORY[0x263EFFA80];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"AMNotificationsPreviewOnTapOnlyEnabled" toDefaultValue:MEMORY[0x263EFFA80] options:1];

  v12 = [NSString stringWithUTF8String:"firstPresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"AMAmbientFirstPresentation" toDefaultValue:v4 options:1];

  v13 = [NSString stringWithUTF8String:"lastSelectedConfigurations"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"AMLastSelectedConfigurations" toDefaultValue:0 options:1];

  v14 = [NSString stringWithUTF8String:"ignoreBatteryChargingForPresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"AMAmbientIgnoreBatteryCharging" toDefaultValue:v11 options:1];

  v15 = [NSString stringWithUTF8String:"alwaysUpdateIconModelOnAmbientWidgetLayoutChange"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"AMAlwaysUpdateIconModelOnAmbientWidgetLayoutChange" toDefaultValue:v11 options:1];

  v16 = [NSString stringWithUTF8String:"lifetimePresentationCounter"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"AMLifetimePresentationCounter" toDefaultValue:0 options:1];

  v17 = [NSString stringWithUTF8String:"migratedClockCityWidget"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"AMMigratedClockCityWidget" toDefaultValue:v11 options:1];

  id v18 = [NSString stringWithUTF8String:"alwaysOnEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"AMAlwaysOnEnabled" toDefaultValue:v4 options:1];
}

- (BOOL)hasMigratedClockCityWidget
{
  return self->_migratedClockCityWidget;
}

- (void)setMigratedClockCityWidget:(BOOL)a3
{
  self->_migratedClockCityWidget = a3;
}

@end