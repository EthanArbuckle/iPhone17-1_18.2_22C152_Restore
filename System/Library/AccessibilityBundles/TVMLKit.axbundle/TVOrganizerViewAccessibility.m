@interface TVOrganizerViewAccessibility
@end

@implementation TVOrganizerViewAccessibility

BOOL __71___TVOrganizerViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && ([v2 isAccessibilityElement] & 1) != 0;

  return v3;
}

uint64_t __52___TVOrganizerViewAccessibility__axIsInTVWhatsNewVC__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Tvwhatsnewview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end