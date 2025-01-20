@interface HMDLostModeManager
+ (id)logCategory;
+ (id)sharedManager;
- (BOOL)isLost;
- (BOOL)isLostOrNeedsExitAuth;
- (HMDLostModeManager)init;
- (id)attributeDescriptions;
@end

@implementation HMDLostModeManager

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDLostModeManager *)self isLost];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Lost" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_33408 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_33408, &__block_literal_global_33409);
  }
  v2 = (void *)logCategory__hmf_once_v1_33410;
  return v2;
}

void __41__HMDLostModeManager_Common__logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_33410;
  logCategory__hmf_once_v1_33410 = v0;
}

- (BOOL)isLostOrNeedsExitAuth
{
  v2 = [MEMORY[0x263F3CC60] sharedInstance];
  if ([v2 lostModeIsActive])
  {
    char v3 = 1;
  }
  else
  {
    v4 = [MEMORY[0x263F3CC60] sharedInstance];
    char v3 = [v4 needsLostModeExitAuth];
  }
  return v3;
}

- (BOOL)isLost
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lost;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (HMDLostModeManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDLostModeManager;
  v2 = [(HMDLostModeManager *)&v8 init];
  char v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__HMDLostModeManagerLostModeChangeNotification, (CFStringRef)*MEMORY[0x263F3CC88], 0, CFNotificationSuspensionBehaviorCoalesce);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)__HMDLostModeManagerExitLostModeWithAuthCompleteNotification, (CFStringRef)*MEMORY[0x263F3CC58], 0, CFNotificationSuspensionBehaviorCoalesce);
    v6 = [MEMORY[0x263F3CC60] sharedInstance];
    v3->_lost = [v6 lostModeIsActive];
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_177589 != -1) {
    dispatch_once(&sharedManager_onceToken_177589, &__block_literal_global_177590);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __35__HMDLostModeManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDLostModeManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

@end