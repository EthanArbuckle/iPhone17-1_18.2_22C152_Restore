@interface DOCProgressIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCProgressIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecentsAvocado.DOCProgressIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"progress");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 35;
}

- (id)accessibilityValue
{
  [(DOCProgressIndicatorViewAccessibility *)self safeDoubleForKey:@"fractionCompleted"];
  v2.n128_f32[0] = v2.n128_f64[0];

  return (id)MEMORY[0x270F0A108](0, v2);
}

@end