@interface PSGCarrierRejectCodePaneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PSGCarrierRejectCodePaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSGCarrierRejectCodePane";
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
  v2 = [(PSGCarrierRejectCodePaneAccessibility *)self safeValueForKey:@"_rejectMessage"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end