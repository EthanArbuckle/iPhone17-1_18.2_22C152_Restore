@interface HomeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HomeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HomeViewController";
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
  v5.super_class = (Class)HomeViewControllerAccessibility;
  [(HomeViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(HomeViewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
  v4 = AXMapsLocString(@"collection.locations.label");
  [v3 setAccessibilityLabel:v4];
}

@end