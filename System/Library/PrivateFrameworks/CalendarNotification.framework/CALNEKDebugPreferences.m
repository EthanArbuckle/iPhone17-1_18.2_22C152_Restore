@interface CALNEKDebugPreferences
+ (CALNEKDebugPreferences)sharedInstance;
- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses;
@end

@implementation CALNEKDebugPreferences

+ (CALNEKDebugPreferences)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CALNEKDebugPreferences_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_16 != -1) {
    dispatch_once(&sharedInstance_onceToken_16, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_13;
  return (CALNEKDebugPreferences *)v2;
}

uint64_t __40__CALNEKDebugPreferences_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_13 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  v2 = [MEMORY[0x263F04B80] shared];
  char v3 = [v2 forceDisplayOfNewTravelAdvisoryHypotheses];

  return v3;
}

@end