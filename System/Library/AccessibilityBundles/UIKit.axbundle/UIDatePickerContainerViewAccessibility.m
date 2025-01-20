@interface UIDatePickerContainerViewAccessibility
@end

@implementation UIDatePickerContainerViewAccessibility

uint64_t __69___UIDatePickerContainerViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissPresentationAnimated:", 1, a1, a1);
}

double __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v4 = v1;

  return v4;
}

double __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) accessibilityFrame];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained accessibilityActivationPoint];
  CGPointMake_0();
  double v5 = v1;

  return v5;
}

uint64_t __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained accessibilityPerformEscape];

  return v3 & 1;
}

@end