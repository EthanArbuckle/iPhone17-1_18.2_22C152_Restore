@interface RollingClockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation RollingClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ClockPoster.RollingClockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263EFF910] date];
  v3 = AXClockTimeStringForDate();

  return v3;
}

@end