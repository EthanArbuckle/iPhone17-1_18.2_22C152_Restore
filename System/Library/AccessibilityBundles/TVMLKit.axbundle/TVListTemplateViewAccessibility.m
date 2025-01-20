@interface TVListTemplateViewAccessibility
@end

@implementation TVListTemplateViewAccessibility

uint64_t __78___TVListTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __78___TVListTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canBecomeFocused];
}

uint64_t __78___TVListTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end