@interface HearingManager
+ (id)sharedInstance;
- (void)startMonitoring;
@end

@implementation HearingManager

- (void)startMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, (CFStringRef)*MEMORY[0x263F8B1F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263F8B1F0];

  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_SharedInstance;

  return v2;
}

uint64_t __32__HearingManager_sharedInstance__block_invoke()
{
  sharedInstance_SharedInstance = objc_alloc_init(HearingManager);

  return MEMORY[0x270F9A758]();
}

@end