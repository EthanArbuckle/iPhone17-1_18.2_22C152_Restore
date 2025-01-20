@interface AVRoutePickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVRoutePickerViewAccessibility)initWithCoder:(id)a3;
- (AVRoutePickerViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVRoutePickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVRoutePickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVRoutePickerView" hasInstanceVariable:@"_routePickerButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVRoutePickerView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVRoutePickerView", @"initWithCoder:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVRoutePickerView", @"delegate", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  [(AVRoutePickerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVRoutePickerViewAccessibility *)self safeValueForKey:@"_routePickerButton"];
  v4 = accessibilityLocalizedString(@"route.picker.button.label");
  [v3 setAccessibilityLabel:v4];
}

- (AVRoutePickerViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  id v3 = -[AVRoutePickerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVRoutePickerViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (AVRoutePickerViewAccessibility)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVRoutePickerViewAccessibility;
  id v3 = [(AVRoutePickerViewAccessibility *)&v5 initWithCoder:a3];
  [(AVRoutePickerViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end