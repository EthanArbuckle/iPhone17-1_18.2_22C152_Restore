@interface CAMZoomSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsVerticalAdjustableElement;
- (id)accessibilityLabel;
- (void)_hideZoomSlider:(id)a3;
@end

@implementation CAMZoomSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMZoomSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_hideZoomSlider:(id)a3
{
  id v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMZoomSliderAccessibility;
    [(CAMZoomSliderAccessibility *)&v5 _hideZoomSlider:v4];
  }
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"zoom.slider.text");
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return 1;
}

@end