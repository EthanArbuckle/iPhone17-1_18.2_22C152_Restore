@interface MTAWorldClockMapCityViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MTAWorldClockMapCityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockMapCityView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(MTAWorldClockMapCityViewAccessibility *)self safeValueForKey:@"_nameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MTAWorldClockMapCityViewAccessibility *)self safeValueForKey:@"_timeLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end