@interface UICollectionViewListCellAccessibility__MusicUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsInViewControllerClass:(id)a3;
- (BOOL)_axIsListCellAccessibleInMusicApp;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UICollectionViewListCellAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.ArtistListViewController"];
  [v3 validateClass:@"MusicApplication.SidebarMenuViewController"];
  [v3 validateClass:@"MusicApplication.ArtistListViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MusicApplication.SidebarMenuViewController" isKindOfClass:@"UIViewController"];
}

- (BOOL)isAccessibilityElement
{
  if ([(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _axIsListCellAccessibleInMusicApp])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
  return [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  if ([(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _axIsListCellAccessibleInMusicApp]&& ([(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _accessibilityDescendantOfType:objc_opt_class()], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v4 = v3;
    v5 = [v3 text];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
    v5 = [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)&v7 accessibilityLabel];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
  unint64_t v3 = [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)&v7 accessibilityTraits];
  BOOL v4 = [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _axIsListCellAccessibleInMusicApp];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_axIsListCellAccessibleInMusicApp
{
  if ([(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _axIsInViewControllerClass:@"MusicApplication.ArtistListViewController"])
  {
    return 1;
  }

  return [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _axIsInViewControllerClass:@"MusicApplication.SidebarMenuViewController"];
}

- (BOOL)_axIsInViewControllerClass:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__UICollectionViewListCellAccessibility__MusicUI__UIKit__axIsInViewControllerClass___block_invoke;
  v8[3] = &unk_26513CC80;
  id v9 = v4;
  id v5 = v4;
  v6 = [(UICollectionViewListCellAccessibility__MusicUI__UIKit *)self _accessibilityFindViewAncestor:v8 startWithSelf:1];
  LOBYTE(self) = v6 != 0;

  return (char)self;
}

@end