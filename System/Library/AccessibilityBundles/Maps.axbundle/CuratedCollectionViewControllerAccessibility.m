@interface CuratedCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CuratedCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CuratedCollectionViewController";
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
  v4.super_class = (Class)CuratedCollectionViewControllerAccessibility;
  [(CuratedCollectionViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CuratedCollectionViewControllerAccessibility *)self safeValueForKey:@"fakeHeaderView"];
  [v3 setAccessibilityElementsHidden:1];
}

@end