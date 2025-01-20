@interface CSUserSessionActiveMonitor
+ (id)sharedInstance;
- (BOOL)isUserActive;
@end

@implementation CSUserSessionActiveMonitor

- (BOOL)isUserActive
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8354 != -1) {
    dispatch_once(&sharedInstance_onceToken_8354, &__block_literal_global_8355);
  }
  v2 = (void *)sharedInstance_sharedInstance_8356;
  return v2;
}

uint64_t __44__CSUserSessionActiveMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_8356 = objc_alloc_init(CSUserSessionActiveMonitor);
  return MEMORY[0x1F41817F8]();
}

@end