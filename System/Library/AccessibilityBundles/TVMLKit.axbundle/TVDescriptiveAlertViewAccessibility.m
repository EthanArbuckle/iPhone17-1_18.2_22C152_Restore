@interface TVDescriptiveAlertViewAccessibility
@end

@implementation TVDescriptiveAlertViewAccessibility

uint64_t __59___TVDescriptiveAlertViewAccessibility__axIsInTVWhatsNewVC__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Tvwhatsnewview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end