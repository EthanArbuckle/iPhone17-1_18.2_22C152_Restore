@interface UICollectionViewListCellAccessibility__AppStore__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsInPageFacetsVC;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axSwitch;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UICollectionViewListCellAccessibility__AppStore__UIKit

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
}

- (BOOL)_axIsInPageFacetsVC
{
  v2 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_axSwitch
{
  if ([(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _axIsInPageFacetsVC])
  {
    BOOL v3 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _accessibilityDescendantOfType:objc_opt_class()];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)accessibilityValue
{
  BOOL v3 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _axSwitch];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    uint64_t v5 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)&v8 accessibilityValue];
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  BOOL v3 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _axSwitch];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    [(UICollectionViewListCellAccessibility__AppStore__UIKit *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _axSwitch];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityTraits];
    uint64_t v5 = _AXTraitsRemoveTrait();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    uint64_t v5 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)&v8 accessibilityTraits];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  BOOL v3 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)self _axSwitch];
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UICollectionViewListCellAccessibility__AppStore__UIKit;
    v4 = [(UICollectionViewListCellAccessibility__AppStore__UIKit *)&v6 _accessibilitySupplementaryFooterViews];
  }

  return v4;
}

@end