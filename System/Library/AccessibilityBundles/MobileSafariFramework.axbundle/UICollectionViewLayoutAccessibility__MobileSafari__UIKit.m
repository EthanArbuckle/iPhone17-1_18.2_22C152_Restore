@interface UICollectionViewLayoutAccessibility__MobileSafari__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySortCollectionViewLogically;
@end

@implementation UICollectionViewLayoutAccessibility__MobileSafari__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySortCollectionViewLogically
{
  v2 = [(UICollectionViewLayoutAccessibility__MobileSafari__UIKit *)self safeValueForKey:@"collectionView"];
  v3 = [v2 _accessibilityFindViewAncestor:&__block_literal_global_4 startWithSelf:1];
  BOOL v4 = v3 == 0;

  return v4;
}

@end