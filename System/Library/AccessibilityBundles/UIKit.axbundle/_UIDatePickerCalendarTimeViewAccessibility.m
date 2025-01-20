@interface _UIDatePickerCalendarTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHideTimeLabel;
- (void)_setupViewHierarchy;
@end

@implementation _UIDatePickerCalendarTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerCalendarTimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIDatePickerCalendarTimeView";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"timeTextField", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setupViewHierarchy", "v", 0);
  objc_storeStrong(v6, obj);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"compact.picker.time");
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = (id)[(_UIDatePickerCalendarTimeViewAccessibility *)self safeValueForKey:@"timeTextField"];
  char v4 = [v3 resignFirstResponder];

  return v4 & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeViewAccessibility;
  [(_UIDatePickerCalendarTimeViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UIDatePickerCalendarTimeViewAccessibility _axHideTimeLabel](v4);
}

- (void)_axHideTimeLabel
{
  if (a1)
  {
    id v1 = (id)[a1 safeValueForKey:@"timeLabel"];
    [v1 setIsAccessibilityElement:0];
  }
}

- (void)_setupViewHierarchy
{
  char v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeViewAccessibility;
  [(_UIDatePickerCalendarTimeViewAccessibility *)&v2 _setupViewHierarchy];
  -[_UIDatePickerCalendarTimeViewAccessibility _axHideTimeLabel](v4);
}

@end