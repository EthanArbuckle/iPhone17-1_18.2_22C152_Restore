@interface FIUIPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FIUIPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIPageViewController";
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
  v4.super_class = (Class)FIUIPageViewControllerAccessibility;
  [(FIUIPageViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(FIUIPageViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  [v3 setAccessibilityIdentifier:@"AXFIUIPageViewControllerCollectionView"];
}

@end