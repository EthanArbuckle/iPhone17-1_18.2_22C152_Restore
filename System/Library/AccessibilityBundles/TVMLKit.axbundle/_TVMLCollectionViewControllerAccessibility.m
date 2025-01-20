@interface _TVMLCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateHeaderView;
@end

@implementation _TVMLCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVMLCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVCollectionWrappingView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVCollectionWrappingView", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMLCollectionViewController", @"collectionWrappingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMLCollectionViewController", @"_updateHeaderView", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewControllerAccessibility;
  [(_TVMLCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVMLCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionWrappingView"];
  v4 = [v3 safeValueForKey:@"headerView"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)_updateHeaderView
{
  v3.receiver = self;
  v3.super_class = (Class)_TVMLCollectionViewControllerAccessibility;
  [(_TVMLCollectionViewControllerAccessibility *)&v3 _updateHeaderView];
  [(_TVMLCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end