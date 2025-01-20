@interface CKUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityOpaqueElementProvider;
@end

@implementation CKUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  v3 = [(CKUICollectionViewAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXImpactEffectCollectionView"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKUICollectionViewAccessibility;
  return [(CKUICollectionViewAccessibility *)&v6 isAccessibilityOpaqueElementProvider];
}

@end