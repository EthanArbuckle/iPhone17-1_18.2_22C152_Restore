@interface UICollectionViewAccessibility__MusicApplication__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsShelfCollectionView;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityShouldSpeakItemReorderEvents;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers;
@end

@implementation UICollectionViewAccessibility__MusicApplication__UIKit

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
  [v3 validateClass:@"MusicApplication.ShelfCollectionViewLayout"];
  [v3 validateClass:@"MusicApplication.NowPlayingViewController"];
  [v3 validateClass:@"MusicApplication.PlaylistDetailSongsViewController"];
  [v3 validateClass:@"MusicApplication.SocialProfilesShelfCollectionViewLayout"];
  [v3 validateClass:@"MusicApplication.ShelfCollectionViewLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"collectionViewLayout", "@", 0);
  [v3 validateClass:@"MusicApplication.JSShelfViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"_accessibilitySupplementaryViewSectionHeaderIdentifiers", "@", 0);
}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  v2 = [(UICollectionViewAccessibility__MusicApplication__UIKit *)self _accessibilityFindAncestor:&__block_literal_global_10 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  if ([(UICollectionViewAccessibility__MusicApplication__UIKit *)self _accessibilityIsShelfCollectionView])
  {
    double v3 = *MEMORY[0x263F1D1C0];
    double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
    [(UICollectionViewAccessibility__MusicApplication__UIKit *)&v7 _accessibilityVisibleContentInset];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  if ([(UICollectionViewAccessibility__MusicApplication__UIKit *)self _accessibilityIsShelfCollectionView])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  return [(UICollectionViewAccessibility__MusicApplication__UIKit *)&v4 accessibilityScrollUpPage];
}

- (BOOL)accessibilityScrollDownPage
{
  if ([(UICollectionViewAccessibility__MusicApplication__UIKit *)self _accessibilityIsShelfCollectionView])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  return [(UICollectionViewAccessibility__MusicApplication__UIKit *)&v4 accessibilityScrollDownPage];
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  v2 = [(UICollectionViewAccessibility__MusicApplication__UIKit *)&v8 _accessibilitySupplementaryViewSectionHeaderIdentifiers];
  objc_opt_class();
  double v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 dataSource];
  MEMORY[0x2456584B0](@"MusicApplication.JSShelfViewController");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x2456584B0](@"MusicApplication.JSFlowcaseViewController"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_307);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v2;
  }
  double v6 = v5;

  return v6;
}

- (BOOL)_accessibilityIsShelfCollectionView
{
  v2 = [(UICollectionViewAccessibility__MusicApplication__UIKit *)self safeValueForKey:@"collectionViewLayout"];
  MEMORY[0x2456584B0](@"MusicApplication.SocialProfilesShelfCollectionViewLayout");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x2456584B0](@"MusicApplication.ShelfCollectionViewLayout");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end