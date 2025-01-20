@interface SFFluidProgressViewAccessibility
@end

@implementation SFFluidProgressViewAccessibility

void __68___SFFluidProgressViewAccessibility__finishProgressBarWithDuration___block_invoke()
{
}

uint64_t __95___SFFluidProgressViewAccessibility_fluidProgressController_updateFluidProgressBar_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"StartedFluidProgress"];
  if (result)
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2422E7000, v3, OS_LOG_TYPE_INFO, "Posting fallback finish notification in case we get no other updates", v4, 2u);
    }

    UIAccessibilityPostNotification(*MEMORY[0x263F81458], &unk_26F721190);
    return [*(id *)(a1 + 32) _accessibilitySetBoolValue:0 forKey:@"StartedFluidProgress"];
  }
  return result;
}

uint64_t __53___SFFluidProgressViewAccessibility__axCheckProgress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axCheckProgress];
}

uint64_t __99___SFFluidProgressViewAccessibility_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axCheckProgress];
}

@end