@interface UIDimmingViewAccessibility
@end

@implementation UIDimmingViewAccessibility

uint64_t __64__UIDimmingViewAccessibility__MessageUI__UIKit_passthroughViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfcomposerecip_4.isa);
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 safeValueForKey:@"firstResponder"];
    uint64_t v4 = [v3 _accessibilityIsDescendantOfElement:v2];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end