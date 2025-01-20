@interface StackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation StackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.StackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(StackViewAccessibility *)self safeArrayForKey:@"accessibilityNonHiddenSubviews"];
  v3 = AXLabelForElements();

  return v3;
}

@end