@interface UIDatePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation UIDatePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDatePicker";
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
  v4 = @"UIDatePicker";
  v3 = @"UIControl";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"canBecomeFocused", "B", 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_pickerView" withType:"UIView<_UIDatePickerViewComponent>"];
  objc_storeStrong(v6, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 51;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UIDatePickerAccessibility *)self safeValueForKey:@"_pickerView"];
  char v3 = [v4[0] accessibilityPerformEscape];
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (int64_t)accessibilityContainerType
{
  id v3 = (id)[(UIDatePickerAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] == 0;

  if (v4) {
    return 0;
  }
  else {
    return 4;
  }
}

- (BOOL)canBecomeFocused
{
  v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIDatePickerAccessibility;
  char v4 = [(UIDatePickerAccessibility *)&v3 canBecomeFocused];
  if ([(UIDatePickerAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])char v4 = 0; {
  return v4 & 1;
  }
}

@end