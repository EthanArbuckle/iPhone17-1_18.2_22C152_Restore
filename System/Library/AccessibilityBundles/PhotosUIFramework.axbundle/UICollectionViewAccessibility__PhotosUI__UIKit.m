@interface UICollectionViewAccessibility__PhotosUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
@end

@implementation UICollectionViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  v3 = [(UICollectionViewAccessibility__PhotosUI__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"photoSharingCollectionView"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__PhotosUI__UIKit;
  return [(UICollectionViewAccessibility__PhotosUI__UIKit *)&v6 _accessibilityOpaqueElementScrollsContentIntoView];
}

@end