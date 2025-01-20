@interface PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBUIPosterWallpaperRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility;
  [(PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility *)&v4 viewDidAppear:a3];
  [(PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PBUIPosterWallpaperRemoteViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end