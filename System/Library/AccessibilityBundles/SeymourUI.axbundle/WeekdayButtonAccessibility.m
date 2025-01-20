@interface WeekdayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation WeekdayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WeekdayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.WeekdayButton" hasSwiftField:@"item" withSwiftType:"Optional<WeekdayPickerItem>"];
  [v3 validateSwiftStruct:@"SeymourUI.WeekdayPickerItem" hasSwiftField:@"weekday" withSwiftType:"Weekday"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(WeekdayButtonAccessibility *)self safeSwiftValueForKey:@"item"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 safeSwiftValueForKey:@"weekday"];
    v6 = [v5 safeSwiftEnumCase];

    v7 = [NSString stringWithFormat:@"weekday.button.%@", v6];
    v8 = accessibilityLocalizedString(v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WeekdayButtonAccessibility;
    v8 = [(WeekdayButtonAccessibility *)&v10 accessibilityLabel];
  }

  return v8;
}

@end