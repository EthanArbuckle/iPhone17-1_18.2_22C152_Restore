@interface PKPassFooterContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPassFooterContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassFooterContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassFooterContentViewAccessibility;
  [(PKPassFooterContentViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PKPassFooterContentViewAccessibility *)self safeValueForKey:@"_infoButton"];
  v4 = accessibilityLocalizedString(@"more.button");
  [v3 setAccessibilityLabel:v4];
}

@end