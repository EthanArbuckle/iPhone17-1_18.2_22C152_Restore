@interface SSSCropOverlayGrabberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SSSCropOverlayGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSCropOverlayGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SSSCropOverlayLineView" hasInstanceVariable:@"_edge" withType:"Q"];
  [v3 validateClass:@"SSSCropOverlayGrabberView" isKindOfClass:@"SSSCropOverlayLineView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(SSSCropOverlayGrabberViewAccessibility *)self safeIntegerForKey:@"_edge"] - 1;
  if (v2 <= 7 && ((0x8Bu >> v2) & 1) != 0)
  {
    id v3 = accessibilityLocalizedString(off_26514CF88[v2]);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end