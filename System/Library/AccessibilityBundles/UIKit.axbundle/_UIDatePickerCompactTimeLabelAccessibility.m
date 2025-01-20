@interface _UIDatePickerCompactTimeLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIDatePickerCompactTimeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerCompactTimeLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIDatePickerIOSCompactView";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerCompactTimeLabel", @"label", "@", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_presentation" withType:"_UIDatePickerOverlayPresentation"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerOverlayPresentation", @"activeMode", "q", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3 = (id)[(_UIDatePickerCompactTimeLabelAccessibility *)self safeUIViewForKey:@"label"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

- (int64_t)_accessibilityExpandedStatus
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIDatePickerCompactTimeLabelAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickerio_0.isa)];
  id v3 = (id)[location[0] safeValueForKey:@"_presentation"];
  BOOL v4 = [v3 safeIntegerForKey:@"activeMode"] != 1;

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

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v9[2] = self;
  v9[1] = (id)a2;
  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  [v6 bounds];
  UIAccessibilityConvertFrameToScreenCoordinates(v13, (UIView *)v9[0]);
  AX_CGRectGetCenter();
  double v10 = v2;
  double v11 = v3;
  objc_storeStrong(v9, 0);
  double v4 = v10;
  double v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

@end