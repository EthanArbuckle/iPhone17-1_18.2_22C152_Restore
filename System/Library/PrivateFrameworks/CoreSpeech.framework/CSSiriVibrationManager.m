@interface CSSiriVibrationManager
+ (id)sharedManager;
- (BOOL)_ringVibrationValue;
- (BOOL)_silentVibrationValue;
- (BOOL)vibratesForDeviceRingerSwitchState:(int64_t)a3;
- (CSSiriVibrationManager)init;
- (void)_fetchRingVibrationValue;
- (void)_fetchSilentVibrationValue;
- (void)dealloc;
- (void)handleRingVibrationValueChange;
- (void)handleSilentVibrationValueChange;
@end

@implementation CSSiriVibrationManager

- (void).cxx_destruct
{
}

- (void)handleSilentVibrationValueChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriVibrationManager handleSilentVibrationValueChange]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSSiriVibrationManager_handleSilentVibrationValueChange__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__CSSiriVibrationManager_handleSilentVibrationValueChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSilentVibrationValue];
}

- (void)handleRingVibrationValueChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriVibrationManager handleRingVibrationValueChange]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSSiriVibrationManager_handleRingVibrationValueChange__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __56__CSSiriVibrationManager_handleRingVibrationValueChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRingVibrationValue];
}

- (void)_fetchSilentVibrationValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E368];
  v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[CSSiriVibrationManager _fetchSilentVibrationValue]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  int64_t VibrationState = _fetchVibrationState(@"silent-vibrate");
  self->_silentint64_t VibrationState = VibrationState;
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v7 = @"Off";
    if (VibrationState == 2) {
      v7 = @"On";
    }
    int v8 = 136315394;
    v9 = "-[CSSiriVibrationManager _fetchSilentVibrationValue]";
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_fetchRingVibrationValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E368];
  v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[CSSiriVibrationManager _fetchRingVibrationValue]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  int64_t VibrationState = _fetchVibrationState(@"ring-vibrate");
  self->_ringint64_t VibrationState = VibrationState;
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v7 = @"Off";
    if (VibrationState == 2) {
      v7 = @"On";
    }
    int v8 = 136315394;
    v9 = "-[CSSiriVibrationManager _fetchRingVibrationValue]";
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)_silentVibrationValue
{
  silentint64_t VibrationState = self->_silentVibrationState;
  if (!silentVibrationState)
  {
    [(CSSiriVibrationManager *)self _fetchSilentVibrationValue];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver, (CFNotificationCallback)_silentVibrationPreferenceDidChangeCallback, @"com.apple.springboard.silent-vibrate.changed", 0, CFNotificationSuspensionBehaviorCoalesce);
    silentint64_t VibrationState = self->_silentVibrationState;
  }
  return silentVibrationState == 2;
}

- (BOOL)_ringVibrationValue
{
  ringint64_t VibrationState = self->_ringVibrationState;
  if (!ringVibrationState)
  {
    [(CSSiriVibrationManager *)self _fetchRingVibrationValue];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver, (CFNotificationCallback)_ringVibrationPreferenceDidChangeCallback, @"com.apple.springboard.ring-vibrate.changed", 0, CFNotificationSuspensionBehaviorCoalesce);
    ringint64_t VibrationState = self->_ringVibrationState;
  }
  return ringVibrationState == 2;
}

- (BOOL)vibratesForDeviceRingerSwitchState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)dealloc
{
  if (self->_ringVibrationState || self->_silentVibrationState)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSiriVibrationManager;
  [(CSSiriVibrationManager *)&v4 dealloc];
}

- (CSSiriVibrationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSSiriVibrationManager;
  v2 = [(CSSiriVibrationManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.assistant.vibration-manager", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__CSSiriVibrationManager_init__block_invoke;
    block[3] = &unk_1E658D4D8;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

uint64_t __30__CSSiriVibrationManager_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _silentVibrationValue];
  v2 = *(void **)(a1 + 32);
  return [v2 _ringVibrationValue];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_16706 != -1) {
    dispatch_once(&sharedManager_onceToken_16706, &__block_literal_global_16707);
  }
  v2 = (void *)sharedManager_sharedManager_16708;
  return v2;
}

void __39__CSSiriVibrationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(CSSiriVibrationManager);
  v1 = (void *)sharedManager_sharedManager_16708;
  sharedManager_sharedManager_16708 = (uint64_t)v0;
}

@end