@interface HUQuickControlSliderValueOverlayViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation HUQuickControlSliderValueOverlayViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSliderValueOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end