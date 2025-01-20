@interface CSHomeAffordanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CSHomeAffordanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSHomeAffordanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF20];
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(@"home.affordance");
}

- (id)accessibilityHint
{
  return accessibilitySBLocalizedString(@"home.affordance.coversheet.hint");
}

@end