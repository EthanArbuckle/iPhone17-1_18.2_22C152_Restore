@interface VideosPlaybackViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosPlaybackViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosPlaybackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosPlaybackViewControllerInvertColorsAccessibility;
  [(VideosPlaybackViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(VideosPlaybackViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(VideosPlaybackViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end