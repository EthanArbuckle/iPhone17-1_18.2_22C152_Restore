@interface CALNEKFoundInAppsEventTracker
+ (CALNEKFoundInAppsEventTracker)sharedInstance;
- (void)trackPseudoEventInitialTimeToLeaveFired;
@end

@implementation CALNEKFoundInAppsEventTracker

+ (CALNEKFoundInAppsEventTracker)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CALNEKFoundInAppsEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_10;
  return (CALNEKFoundInAppsEventTracker *)v2;
}

uint64_t __47__CALNEKFoundInAppsEventTracker_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_10 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)trackPseudoEventInitialTimeToLeaveFired
{
}

@end