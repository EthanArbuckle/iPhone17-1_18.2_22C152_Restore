@interface VideosUI_SideBarCollectionViewListHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_SideBarCollectionViewListHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SideBarCollectionViewListHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_SideBarCollectionViewListHeaderAccessibility;
  return *MEMORY[0x263F1CEF8] | [(VideosUI_SideBarCollectionViewListHeaderAccessibility *)&v3 accessibilityTraits];
}

@end