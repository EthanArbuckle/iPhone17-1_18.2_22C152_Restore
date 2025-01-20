@interface SSSCropOverlayCornerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SSSCropOverlayCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSCropOverlayCornerView";
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
  unint64_t v2 = [(SSSCropOverlayCornerViewAccessibility *)self safeIntegerForKey:@"_corner"] - 1;
  if (v2 <= 7 && ((0x8Bu >> v2) & 1) != 0)
  {
    v3 = accessibilityLocalizedString(off_26514CED0[v2]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end