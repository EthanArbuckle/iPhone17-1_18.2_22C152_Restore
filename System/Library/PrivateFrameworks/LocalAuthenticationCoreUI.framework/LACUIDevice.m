@interface LACUIDevice
+ (LACUIDevice)sharedInstance;
- (BOOL)isDynamicIslandAvailable;
@end

@implementation LACUIDevice

+ (LACUIDevice)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (LACUIDevice *)v2;
}

uint64_t __29__LACUIDevice_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)isDynamicIslandAvailable
{
  if (SBUIIsSystemApertureEnabled())
  {
    v2 = [MEMORY[0x263F52448] sharedInstance];
    int v3 = [v2 isClarityBoardRunning] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

@end