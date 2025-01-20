@interface AMUIDateTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AMUIDateTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUIDateTimeView";
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
  v2 = [(AMUIDateTimeViewAccessibility *)self safeValueForKey:@"_dateLabel"];
  if ([v2 isHidden])
  {
    v3 = [MEMORY[0x263EFF910] date];
    v4 = AXClockTimeStringForDate();
  }
  else
  {
    v3 = [v2 accessibilityLabel];
    v5 = [MEMORY[0x263EFF910] date];
    v7 = AXClockTimeStringForDate();
    v4 = __UIAXStringForVariables();
  }

  return v4;
}

@end