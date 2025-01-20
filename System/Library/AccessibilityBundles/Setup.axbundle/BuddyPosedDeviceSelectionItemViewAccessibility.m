@interface BuddyPosedDeviceSelectionItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation BuddyPosedDeviceSelectionItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyPosedDeviceSelectionItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(BuddyPosedDeviceSelectionItemViewAccessibility *)self safeUIViewForKey:@"accessoryView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end