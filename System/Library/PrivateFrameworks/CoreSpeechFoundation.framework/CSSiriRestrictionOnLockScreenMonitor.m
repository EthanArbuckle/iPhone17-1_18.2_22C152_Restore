@interface CSSiriRestrictionOnLockScreenMonitor
+ (id)sharedInstance;
- (BOOL)_checkSiriRestrictedOnLockScreen;
- (BOOL)isRestricted;
- (CSSiriRestrictionOnLockScreenMonitor)init;
- (void)_didReceiveRestrictionChanged:(BOOL)a3;
- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation CSSiriRestrictionOnLockScreenMonitor

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = [(CSSiriRestrictionOnLockScreenMonitor *)self _checkSiriRestrictedOnLockScreen];
  self->_isRestricted = v5;
  [(CSSiriRestrictionOnLockScreenMonitor *)self _didReceiveRestrictionChanged:v5];
}

- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSSiriRestrictionOnLockScreenMonitor:self didReceiveRestrictionChanged:v4];
  }
}

- (void)_didReceiveRestrictionChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __70__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withRestricted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __77__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withRestricted:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_checkSiriRestrictedOnLockScreen
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74228] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F40]];

  BOOL v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = @"NO";
    if (v3 == 2) {
      BOOL v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri restricted on lock screen : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3 == 2;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F74228] sharedConnection];
  [v3 unregisterObserver:self];

  BOOL v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSSiriRestrictionOnLockScreenMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Setting preference change", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F74228], "sharedConnection", a3);
  [v4 registerObserver:self];

  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSSiriRestrictionOnLockScreenMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Setting preference change", (uint8_t *)&v6, 0xCu);
  }
  self->_isRestricted = [(CSSiriRestrictionOnLockScreenMonitor *)self _checkSiriRestrictedOnLockScreen];
}

- (CSSiriRestrictionOnLockScreenMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSiriRestrictionOnLockScreenMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_isRestricted = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_6429 != -1) {
      dispatch_once(&sharedInstance_onceToken_6429, &__block_literal_global_6430);
    }
    id v2 = (id)sharedInstance__sharedInstance_6431;
  }
  return v2;
}

uint64_t __54__CSSiriRestrictionOnLockScreenMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_6431 = objc_alloc_init(CSSiriRestrictionOnLockScreenMonitor);
  return MEMORY[0x1F41817F8]();
}

@end