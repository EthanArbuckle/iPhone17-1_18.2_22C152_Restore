@interface PBA
@end

@implementation PBA

BOOL __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Pbadeviceunloc_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    NSClassFromString(&cfstr_Pbadatarecover_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a1 + 40);
  }
  *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
LABEL_6:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }

  return v5;
}

uint64_t __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _homeButtonPressed:0];
}

uint64_t __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushPasscodeView];
}

@end