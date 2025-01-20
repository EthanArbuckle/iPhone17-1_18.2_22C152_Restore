@interface SRUserUtteranceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SRUserUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRUserUtteranceView";
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
  return (id)[(SRUserUtteranceViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"text"];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"correction.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end