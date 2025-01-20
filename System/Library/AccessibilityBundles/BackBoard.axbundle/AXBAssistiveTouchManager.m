@interface AXBAssistiveTouchManager
+ (void)initializeMonitor;
- (AXBAssistiveTouchManager)init;
- (void)_kickstartAssistiveTouchIfNeeded;
@end

@implementation AXBAssistiveTouchManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_12 != -1) {
    dispatch_once(&initializeMonitor_onceToken_12, &__block_literal_global_21);
  }
}

uint64_t __45__AXBAssistiveTouchManager_initializeMonitor__block_invoke()
{
  SharedManager_2 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXBAssistiveTouchManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXBAssistiveTouchManager;
  v2 = [(AXBAssistiveTouchManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(AXBAssistiveTouchManager *)v2 _kickstartAssistiveTouchIfNeeded];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__kickstartAssistiveTouchIfNeeded name:*MEMORY[0x263F8B130] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel__kickstartAssistiveTouchIfNeeded name:*MEMORY[0x263F8B138] object:0];
  }
  return v3;
}

- (void)_kickstartAssistiveTouchIfNeeded
{
  if (_AXSAssistiveTouchEnabled() || _AXSAssistiveTouchScannerEnabled())
  {
    MEMORY[0x270F905A0]();
  }
}

@end