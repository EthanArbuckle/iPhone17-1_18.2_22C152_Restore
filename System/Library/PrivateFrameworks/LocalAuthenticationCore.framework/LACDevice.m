@interface LACDevice
+ (LACDevice)sharedInstance;
- (BOOL)isClarityBoardRunning;
- (BOOL)isDynamicIslandAvailable;
@end

@implementation LACDevice

+ (LACDevice)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return (LACDevice *)v2;
}

uint64_t __27__LACDevice_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)isClarityBoardRunning
{
  return _AXSClarityBoardEnabled() != 0;
}

- (BOOL)isDynamicIslandAvailable
{
  int v3 = SBSIsSystemApertureAvailable();
  if (v3) {
    LOBYTE(v3) = ![(LACDevice *)self isClarityBoardRunning];
  }
  return v3;
}

@end