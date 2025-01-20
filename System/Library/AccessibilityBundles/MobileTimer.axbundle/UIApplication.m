@interface UIApplication
@end

@implementation UIApplication

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pauseLapTimer];
  uint64_t result = +[AXMobileTimerGlue playStopSound];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) startLapTimer];
  uint64_t result = +[AXMobileTimerGlue playStartSound];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) resumeLapTimer];
  uint64_t result = +[AXMobileTimerGlue playStartSound];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_4(uint64_t a1)
{
  MEMORY[0x245657200](@"MTATimerViewController");
  if (objc_opt_isKindOfClass())
  {
    v2 = [*(id *)(a1 + 32) safeValueForKey:@"timerManager"];
    v3 = [v2 safeValueForKey:@"getCurrentTimerSync"];
    v4 = [v3 safeValueForKey:@"state"];
    uint64_t v5 = [v4 integerValue];

    if (v5 == 1)
    {
      [*(id *)(a1 + 32) startTimer:0];
    }
    else
    {
      if (v5 != 2)
      {
        if (v5 == 3)
        {
          [*(id *)(a1 + 32) pauseResumeTimer:0];
          +[AXMobileTimerGlue playStopSound];
        }
        goto LABEL_9;
      }
      [*(id *)(a1 + 32) pauseResumeTimer:0];
    }
    +[AXMobileTimerGlue playStartSound];
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end