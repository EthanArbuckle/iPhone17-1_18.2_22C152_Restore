@interface VideosUI_SideBarCollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_SideBarCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SideBarCollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(VideosUI_SideBarCollectionViewListCellAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)VideosUI_SideBarCollectionViewListCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(VideosUI_SideBarCollectionViewListCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(VideosUI_SideBarCollectionViewListCellAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end