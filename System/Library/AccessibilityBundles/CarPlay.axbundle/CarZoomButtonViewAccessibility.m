@interface CarZoomButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CarZoomButtonViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CarZoomButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CarZoomButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CarZoomButtonView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"CarZoomButtonView" hasInstanceVariable:@"_zoomInButton" withType:"CarFocusableImageButton"];
  [v3 validateClass:@"CarZoomButtonView" hasInstanceVariable:@"_zoomOutButton" withType:"CarFocusableImageButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CarZoomButtonViewAccessibility;
  [(CarZoomButtonViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CarZoomButtonViewAccessibility *)self safeUIViewForKey:@"_zoomInButton"];
  [v3 setAccessibilityIdentifier:@"CarZoomButton-In"];

  v4 = [(CarZoomButtonViewAccessibility *)self safeUIViewForKey:@"_zoomOutButton"];
  [v4 setAccessibilityIdentifier:@"CarZoomButton-In"];
}

- (CarZoomButtonViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarZoomButtonViewAccessibility;
  id v3 = -[CarZoomButtonViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CarZoomButtonViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end