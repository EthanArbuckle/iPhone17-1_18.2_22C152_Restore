@interface _UIDatePickerCompactDateLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIDatePickerCompactDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerCompactDateLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerCompactDateLabel", @"textLabel", "@", 0);
  [location[0] validateClass:@"_UIDatePickerIOSCompactView" hasInstanceVariable:@"_presentation" withType:"_UIDatePickerOverlayPresentation"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerOverlayPresentation", @"activeMode", "q", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCompactDateLabelAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickerio_0.isa)];
  id v3 = (id)[location[0] safeValueForKey:@"_presentation"];
  BOOL v4 = [v3 safeIntegerForKey:@"activeMode"] != 2;

  if (v4) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 1;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = (id)[(_UIDatePickerCompactDateLabelAccessibility *)self safeUIViewForKey:@"textLabel"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

@end