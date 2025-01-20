@interface FitnessUI_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
@end

@implementation FitnessUI_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  v3 = [(FitnessUI_UICollectionViewAccessibility *)self accessibilityIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"AXFIUIPageViewControllerCollectionView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FitnessUI_UICollectionViewAccessibility;
  return [(FitnessUI_UICollectionViewAccessibility *)&v6 accessibilityCollectionViewBehavesLikeUIViewAccessibility];
}

@end