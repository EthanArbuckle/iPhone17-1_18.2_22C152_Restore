@interface BLTWristStateObserver
- (BLTWristStateObserver)init;
- (BOOL)_isWristDetectionDisabled;
- (BOOL)_wristDetectionDisabledPreference;
- (BOOL)_wristDetectionEnabledRestriction;
- (BOOL)isWristDetectDisabled;
- (void)_updateWristDetectSetting;
- (void)dealloc;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation BLTWristStateObserver

- (BLTWristStateObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLTWristStateObserver;
  v2 = [(BLTWristStateObserver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(BLTWristStateObserver *)v2 _updateWristDetectSetting];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)WristDetectSettingChanged, @"CSLDisableWristDetectionChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v5 = [MEMORY[0x263F53C50] sharedConnection];
    [v5 addObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CSLDisableWristDetectionChangedNotification", 0);
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BLTWristStateObserver;
  [(BLTWristStateObserver *)&v5 dealloc];
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_super v5 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__BLTWristStateObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __92__BLTWristStateObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWristDetectSetting];
}

- (BOOL)_wristDetectionEnabledRestriction
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53AB0]] == 1;

  return v3;
}

- (BOOL)_wristDetectionDisabledPreference
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.Carousel"];
  BOOL v3 = [v2 objectForKey:@"DisableWristDetection"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_isWristDetectionDisabled
{
  if ([(BLTWristStateObserver *)self _wristDetectionEnabledRestriction]) {
    return 0;
  }
  return [(BLTWristStateObserver *)self _wristDetectionDisabledPreference];
}

- (void)_updateWristDetectSetting
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BLTWristStateObserver *)self _isWristDetectionDisabled];
  char v4 = blt_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = "DISABLED";
    if (self->_isWristDetectDisabled) {
      v6 = "DISABLED";
    }
    else {
      v6 = "ENABLED";
    }
    if (!v3) {
      objc_super v5 = "ENABLED";
    }
    int v7 = 136315394;
    v8 = v6;
    __int16 v9 = 2080;
    v10 = v5;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_INFO, "Updating wrist detect from %s to %s", (uint8_t *)&v7, 0x16u);
  }

  self->_isWristDetectDisabled = v3;
}

- (BOOL)isWristDetectDisabled
{
  return self->_isWristDetectDisabled;
}

@end