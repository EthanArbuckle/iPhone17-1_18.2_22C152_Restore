@interface UICollectionViewAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityShouldSpeakItemReorderEvents;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers;
@end

@implementation UICollectionViewAccessibility__Music__UIKit

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
  id v3 = a3;
  [v3 validateClass:@"Music.NowPlayingViewController"];
  [v3 validateClass:@"Music.LibraryMainViewController"];
  [v3 validateClass:@"Music.PlaylistEditingViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"collectionViewLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"_accessibilitySupplementaryViewSectionHeaderIdentifiers", "@", 0);
}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  v2 = [(UICollectionViewAccessibility__Music__UIKit *)self _accessibilityFindAncestor:&__block_literal_global_6 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  [(UICollectionViewAccessibility__Music__UIKit *)&v6 _accessibilityVisibleContentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  return [(UICollectionViewAccessibility__Music__UIKit *)&v3 accessibilityScrollUpPage];
}

- (BOOL)accessibilityScrollDownPage
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  return [(UICollectionViewAccessibility__Music__UIKit *)&v3 accessibilityScrollDownPage];
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  double v2 = [(UICollectionViewAccessibility__Music__UIKit *)&v8 _accessibilitySupplementaryViewSectionHeaderIdentifiers];
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  double v4 = [v3 dataSource];
  MEMORY[0x245658030](@"Music.JSFlowcaseViewController");
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_301);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v2;
  }
  objc_super v6 = v5;

  return v6;
}

@end