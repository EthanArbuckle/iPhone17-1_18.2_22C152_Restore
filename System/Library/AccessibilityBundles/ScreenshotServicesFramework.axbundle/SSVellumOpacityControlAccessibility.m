@interface SSVellumOpacityControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (SSVellumOpacityControlAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SSVellumOpacityControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSVellumOpacityControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SSVellumOpacityControl" hasInstanceVariable:@"_slider" withType:"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSVellumOpacityControl", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SSVellumOpacityControlAccessibility;
  [(SSVellumOpacityControlAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SSVellumOpacityControlAccessibility *)self safeValueForKey:@"_slider"];
  v4 = accessibilityLocalizedString(@"opacity.slider");
  [v3 setAccessibilityLabel:v4];
}

- (SSVellumOpacityControlAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSVellumOpacityControlAccessibility;
  id v3 = -[SSVellumOpacityControlAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSVellumOpacityControlAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end