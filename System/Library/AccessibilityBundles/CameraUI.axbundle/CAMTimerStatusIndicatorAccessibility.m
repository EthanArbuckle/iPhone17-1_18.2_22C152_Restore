@interface CAMTimerStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMTimerStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMTimerStatusIndicator";
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
  return accessibilityCameraKitLocalizedString(@"timer.button");
}

- (id)accessibilityValue
{
  uint64_t v2 = [(CAMTimerStatusIndicatorAccessibility *)self safeIntegerForKey:@"timerDuration"];

  return accessibilityStringForTimeDuration(v2, v3);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMTimerStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMTimerStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end