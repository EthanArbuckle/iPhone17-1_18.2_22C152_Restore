@interface SessionHeartRateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityDidUpdateHeartRate:(BOOL)a3 lastKnownHR:(id)a4;
@end

@implementation SessionHeartRateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionHeartRateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SessionHeartRateViewAccessibility;
  [(SessionHeartRateViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = accessibilityLocalizedString(@"waiting.for.heart.rate.data");
  [(SessionHeartRateViewAccessibility *)self setAccessibilityLabel:v3];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SessionHeartRateViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(SessionHeartRateViewAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityDidUpdateHeartRate:(BOOL)a3 lastKnownHR:(id)a4
{
  BOOL v4 = a3;
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SessionHeartRateViewAccessibility;
  [(SessionHeartRateViewAccessibility *)&v14 accessibilityDidUpdateHeartRate:v4 lastKnownHR:v6];
  if (!v6)
  {
    v10 = accessibilityLocalizedString(@"waiting.for.heart.rate.data");
    goto LABEL_5;
  }
  v7 = NSString;
  v8 = accessibilityLocalizedString(@"heartrate.format");
  [v6 doubleValue];
  v10 = objc_msgSend(v7, "stringWithFormat:", v8, (int)v9);

  if (!v4)
  {
LABEL_5:
    [(SessionHeartRateViewAccessibility *)self setAccessibilityLabel:v10];
    goto LABEL_6;
  }
  v11 = accessibilityLocalizedString(@"last.known.heart.rate");
  v15[0] = v11;
  v15[1] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v13 = AXLabelForElements();

  [(SessionHeartRateViewAccessibility *)self setAccessibilityLabel:v13];
LABEL_6:
}

@end