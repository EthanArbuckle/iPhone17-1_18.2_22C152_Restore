@interface BKUIPearlCoachingDeviceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BKUIPearlCoachingDeviceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlCoachingDeviceView";
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

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlCoachingDeviceViewAccessibility;
  return *MEMORY[0x263F1CF00] | [(BKUIPearlCoachingDeviceViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"coaching.device.view.label");
}

- (CGRect)accessibilityFrame
{
  v2 = [(BKUIPearlCoachingDeviceViewAccessibility *)self safeValueForKey:@"deviceView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end