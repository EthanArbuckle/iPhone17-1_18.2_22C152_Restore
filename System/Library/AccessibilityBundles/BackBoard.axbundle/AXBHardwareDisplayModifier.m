@interface AXBHardwareDisplayModifier
- (AXBHardwareDisplayModifier)init;
- (void)_updateGrayScaleSettings;
- (void)dealloc;
@end

@implementation AXBHardwareDisplayModifier

- (AXBHardwareDisplayModifier)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXBHardwareDisplayModifier;
  v2 = [(AXBHardwareDisplayModifier *)&v13 init];
  if (v2)
  {
    int v3 = AXIsInternalInstall();
    v4 = (void *)MEMORY[0x263F8B1C8];
    if (v3)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v6 = [NSString stringWithFormat:@"%@-toggle-testing", *MEMORY[0x263F8B2C8]];
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_toggleAXSetting_0, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      v7 = CFNotificationCenterGetDarwinNotifyCenter();
      v8 = [NSString stringWithFormat:@"%@-toggle-testing", *v4];
      CFNotificationCenterAddObserver(v7, 0, (CFNotificationCallback)_toggleAXSetting_0, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__updateGrayScaleSettings name:*v4 object:0];

    v12 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    v10 = v12;
  }
  return v2;
}

uint64_t __34__AXBHardwareDisplayModifier_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGrayScaleSettings];
}

- (void)_updateGrayScaleSettings
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F15920], "serverIfRunning", 0);
  int v3 = [v2 displays];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setGrayscale:_AXSGrayscaleEnabled() != 0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXBHardwareDisplayModifier;
  [(AXBHardwareDisplayModifier *)&v4 dealloc];
}

@end