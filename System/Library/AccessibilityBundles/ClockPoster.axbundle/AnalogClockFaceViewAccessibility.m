@interface AnalogClockFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AnalogClockFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ClockPoster.AnalogClockFaceView";
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