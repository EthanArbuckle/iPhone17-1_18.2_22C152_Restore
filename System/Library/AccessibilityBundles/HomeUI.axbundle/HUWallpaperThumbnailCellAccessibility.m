@interface HUWallpaperThumbnailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUWallpaperThumbnailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUWallpaperThumbnailCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(@"wallpaper.cell.name");
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"wallpaper.cell.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end