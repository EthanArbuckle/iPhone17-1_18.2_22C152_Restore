@interface ImageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ImageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Diagnostics.ImageButton";
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
  v2 = [(ImageButtonAccessibility *)self safeValueForKey:@"buttonTitleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ImageButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ImageButtonAccessibility *)&v3 accessibilityTraits];
}

@end