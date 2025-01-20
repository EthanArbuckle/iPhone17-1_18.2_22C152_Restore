@interface HUWallpaperPhotoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation HUWallpaperPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUWallpaperPhotoCell";
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
  v2 = [(HUWallpaperPhotoCellAccessibility *)self safeStringForKey:@"assetIdentifier"];
  v3 = accessibilityLabelForCustomWallpaper(v2);
  if (!v3)
  {
    v3 = accessibilityLabelForNamedWallpaper(v2);
    if (!v3)
    {
      v3 = accessibilityHomeUILocalizedString(@"wallpaper.photo");
    }
  }

  return v3;
}

@end