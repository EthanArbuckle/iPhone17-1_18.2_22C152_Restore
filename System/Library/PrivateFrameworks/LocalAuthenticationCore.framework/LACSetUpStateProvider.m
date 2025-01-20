@interface LACSetUpStateProvider
+ (LACSetUpStateProvider)sharedInstance;
- (BOOL)hasCompletedSetup;
- (void)hasCompletedSetup;
@end

@implementation LACSetUpStateProvider

+ (LACSetUpStateProvider)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_sharedInstance_9;
  return (LACSetUpStateProvider *)v2;
}

uint64_t __39__LACSetUpStateProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_9 = objc_alloc_init(LACSetUpStateProvider);
  return MEMORY[0x270F9A758]();
}

- (BOOL)hasCompletedSetup
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (SetupAssistantLibraryCore() && SetupAssistantLibraryCore() && getBYSetupAssistantNeedsToRunSymbolLoc())
  {
    BYSetupAssistantNeedsToRunSymbolLoc = (unsigned int (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc();
    if (!BYSetupAssistantNeedsToRunSymbolLoc) {
      soft_CRIsSelfRepairedComponent_cold_1();
    }
    uint64_t v3 = BYSetupAssistantNeedsToRunSymbolLoc() ^ 1;
    v4 = LACLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [NSNumber numberWithBool:v3];
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "hasCompletedSetup: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v4 = LACLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[LACSetUpStateProvider hasCompletedSetup](v4);
    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)hasCompletedSetup
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "Setup checks are not available due to missing dependencies", v1, 2u);
}

@end