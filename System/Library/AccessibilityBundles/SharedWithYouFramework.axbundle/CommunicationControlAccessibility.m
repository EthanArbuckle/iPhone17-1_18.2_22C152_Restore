@interface CommunicationControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CommunicationControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SharedWithYou.CommunicationControl";
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

- (id)accessibilityLabel
{
  v2 = [(CommunicationControlAccessibility *)self safeValueForKey:@"label"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  int v3 = [v2 isEnabled];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 | *MEMORY[0x263F1CEE8];

  return v5;
}

@end