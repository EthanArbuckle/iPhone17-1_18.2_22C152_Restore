@interface CAMElapsedTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CAMElapsedTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMElapsedTimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMElapsedTimeView", @"_startTime", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMElapsedTimeView", @"_timeLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(CAMElapsedTimeViewAccessibility *)self safeValueForKey:@"_startTime"];
  v4 = __UIAccessibilityCastAsClass();

  if (UIAccessibilityIsVoiceOverRunning())
  {
    [v4 timeIntervalSinceNow];
    v6 = MEMORY[0x2455E17C0](1, 0.0 - v5);
  }
  else
  {
    v7 = [(CAMElapsedTimeViewAccessibility *)self safeValueForKey:@"_timeLabel"];
    v6 = [v7 accessibilityLabel];
  }

  return v6;
}

@end