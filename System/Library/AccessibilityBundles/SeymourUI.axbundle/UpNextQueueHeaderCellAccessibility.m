@interface UpNextQueueHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UpNextQueueHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.UpNextQueueHeaderCell";
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
  v4.receiver = self;
  v4.super_class = (Class)UpNextQueueHeaderCellAccessibility;
  [(UpNextQueueHeaderCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(UpNextQueueHeaderCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end