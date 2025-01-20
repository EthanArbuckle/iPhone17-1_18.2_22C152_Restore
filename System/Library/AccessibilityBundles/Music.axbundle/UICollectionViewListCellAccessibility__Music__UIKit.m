@interface UICollectionViewListCellAccessibility__Music__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsInViewControllerClass:(id)a3;
- (BOOL)_axIsListCellAccessibleInMusicApp;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UICollectionViewListCellAccessibility__Music__UIKit

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
  [v3 validateClass:@"Music.LibraryMainViewController"];
  [v3 validateClass:@"Music.NowPlayingViewController"];
  [v3 validateClass:@"Music.PlaylistEditingViewController"];
  [v3 validateClass:@"Music.LibraryMainViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"Music.NowPlayingViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"Music.PlaylistEditingViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"UICollectionViewListCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"contentView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  if ([(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsListCellAccessibleInMusicApp])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
  return [(UICollectionViewListCellAccessibility__Music__UIKit *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsListCellAccessibleInMusicApp])
  {
    id v3 = [MEMORY[0x263EFF980] array];
    char v20 = 0;
    objc_opt_class();
    objc_super v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 contentView];
    v6 = [v5 accessibilityElements];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) accessibilityLabel];
          [v3 axSafelyAddObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    v13 = MEMORY[0x245658060](v3);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
    v13 = [(UICollectionViewListCellAccessibility__Music__UIKit *)&v15 accessibilityLabel];
  }

  return v13;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
  unint64_t v3 = [(UICollectionViewListCellAccessibility__Music__UIKit *)&v8 accessibilityTraits];
  if ([(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsListCellAccessibleInMusicApp])
  {
    objc_opt_class();
    objc_super v4 = __UIAccessibilityCastAsClass();
    v3 |= *MEMORY[0x263F1CEE8];
    if ([v4 isSelected])
    {
      v5 = [v4 configurationState];
      int v6 = [v5 isEditing];

      if (v6) {
        v3 |= *MEMORY[0x263F1CF38];
      }
      else {
        v3 &= ~*MEMORY[0x263F1CF38];
      }
    }
  }
  return v3;
}

- (BOOL)_axIsListCellAccessibleInMusicApp
{
  if ([(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsInViewControllerClass:@"Music.LibraryMainViewController"]|| [(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsInViewControllerClass:@"Music.NowPlayingViewController"])
  {
    return 1;
  }

  return [(UICollectionViewListCellAccessibility__Music__UIKit *)self _axIsInViewControllerClass:@"Music.PlaylistEditingViewController"];
}

- (BOOL)_axIsInViewControllerClass:(id)a3
{
  id v4 = a3;
  v5 = [(UICollectionViewListCellAccessibility__Music__UIKit *)self _accessibilityValueForKey:@"_axIsInViewControllerClass"];
  int v6 = [v5 objectForKey:v4];
  id v7 = v6;
  if (v6)
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v9 = MEMORY[0x245658030](v4);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__UICollectionViewListCellAccessibility__Music__UIKit__axIsInViewControllerClass___block_invoke;
    v13[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
    v13[4] = v9;
    uint64_t v10 = [(UICollectionViewListCellAccessibility__Music__UIKit *)self _accessibilityFindViewAncestor:v13 startWithSelf:1];
    if (!v5)
    {
      v5 = [MEMORY[0x263EFF9A0] dictionary];
      [(UICollectionViewListCellAccessibility__Music__UIKit *)self _accessibilitySetRetainedValue:v5 forKey:@"_axIsInViewControllerClass"];
    }
    char v8 = v10 != 0;
    v11 = [NSNumber numberWithInt:v10 != 0];
    [v5 setObject:v11 forKeyedSubscript:v4];
  }
  return v8;
}

@end