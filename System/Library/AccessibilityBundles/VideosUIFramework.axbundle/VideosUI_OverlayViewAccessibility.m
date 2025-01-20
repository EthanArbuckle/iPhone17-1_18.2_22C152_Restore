@interface VideosUI_OverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VideosUI_OverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.OverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(VideosUI_OverlayViewAccessibility *)self safeUIViewForKey:@"accessibilityTitleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end