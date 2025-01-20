@interface SUUIScrollingTabBarContentCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (id)_accessibilityScrollStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIScrollingTabBarContentCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIScrollingTabBarContentCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIScrollingTabBarContentCollectionView" isKindOfClass:@"UIScrollView"];
  [v3 validateClass:@"SUUIScrollingTabBarContentCollectionView" isKindOfClass:@"UICollectionView"];
  [v3 validateClass:@"SUUIScrollingTabBarController" hasInstanceVariable:@"_focusedViewController" withType:"UIViewController"];
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 delegate];

  objc_opt_class();
  v4 = [v3 safeValueForKey:@"_focusedViewController"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 tabBarItem];
  v7 = [v6 title];

  return v7;
}

@end