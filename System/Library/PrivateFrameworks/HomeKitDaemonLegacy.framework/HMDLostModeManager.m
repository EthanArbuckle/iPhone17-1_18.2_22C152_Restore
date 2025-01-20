@interface HMDLostModeManager
+ (id)logCategory;
+ (id)sharedManager;
- (BOOL)isLost;
- (BOOL)isLostOrNeedsExitAuth;
- (HMDLostModeManager)init;
- (id)attributeDescriptions;
@end

@implementation HMDLostModeManager

- (BOOL)isLost
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lost;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_122774 != -1) {
    dispatch_once(&sharedManager_onceToken_122774, &__block_literal_global_122775);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDLostModeManager *)self isLost];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Lost" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_24742 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_24742, &__block_literal_global_24743);
  }
  v2 = (void *)logCategory__hmf_once_v1_24744;
  return v2;
}

uint64_t __41__HMDLostModeManager_Common__logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_24744;
  logCategory__hmf_once_v1_24744 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)isLostOrNeedsExitAuth
{
  v2 = [MEMORY[0x1E4F61A48] sharedInstance];
  if ([v2 lostModeIsActive])
  {
    char v3 = 1;
  }
  else
  {
    v4 = [MEMORY[0x1E4F61A48] sharedInstance];
    char v3 = [v4 needsLostModeExitAuth];
  }
  return v3;
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
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__HMDLostModeManagerLostModeChangeNotification, (CFStringRef)*MEMORY[0x1E4F61A58], 0, CFNotificationSuspensionBehaviorCoalesce);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)__HMDLostModeManagerExitLostModeWithAuthCompleteNotification, (CFStringRef)*MEMORY[0x1E4F61A38], 0, CFNotificationSuspensionBehaviorCoalesce);
    v6 = [MEMORY[0x1E4F61A48] sharedInstance];
    v3->_lost = [v6 lostModeIsActive];
  }
  return v3;
}

uint64_t __35__HMDLostModeManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDLostModeManager);
  uint64_t v1 = sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end