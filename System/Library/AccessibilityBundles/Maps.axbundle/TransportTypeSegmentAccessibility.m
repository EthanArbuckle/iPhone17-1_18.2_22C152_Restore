@interface TransportTypeSegmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation TransportTypeSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransportTypeSegment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  int v4 = [v2 isSelected];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end