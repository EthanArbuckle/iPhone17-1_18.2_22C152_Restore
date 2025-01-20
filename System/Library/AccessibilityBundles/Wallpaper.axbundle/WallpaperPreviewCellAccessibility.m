@interface WallpaperPreviewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation WallpaperPreviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WallpaperPreviewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WallpaperPreviewCell", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"WallpaperPreviewCell" hasInstanceVariable:@"__homeScreenThumbnailButton" withType:"UIButton"];
  [v3 validateClass:@"WallpaperPreviewCell" hasInstanceVariable:@"__lockScreenThumbnailButton" withType:"UIButton"];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WallpaperPreviewCellAccessibility;
  [(WallpaperPreviewCellAccessibility *)&v3 layoutSubviews];
  [(WallpaperPreviewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)WallpaperPreviewCellAccessibility;
  [(WallpaperPreviewCellAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(WallpaperPreviewCellAccessibility *)self safeValueForKey:@"__homeScreenThumbnailButton"];
  v4 = [(WallpaperPreviewCellAccessibility *)self safeValueForKey:@"__lockScreenThumbnailButton"];
  v5 = accessibilityLocalizedString(@"home.screen.wallpaper.thumbnail.button");
  [v3 setAccessibilityLabel:v5];

  v6 = accessibilityLocalizedString(@"lock.screen.wallpaper.thumbnail.button");
  [v4 setAccessibilityLabel:v6];

  v7 = accessibilityLocalizedString(@"wallpaper.thumbnail.button.hint");
  [v3 setAccessibilityHint:v7];

  v8 = accessibilityLocalizedString(@"wallpaper.thumbnail.button.hint");
  [v4 setAccessibilityHint:v8];
}

@end