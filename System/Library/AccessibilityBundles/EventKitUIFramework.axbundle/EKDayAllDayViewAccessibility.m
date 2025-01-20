@interface EKDayAllDayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (EKDayAllDayViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateAllDayLabel;
@end

@implementation EKDayAllDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayAllDayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayAllDayView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"EKDayAllDayView" hasInstanceVariable:@"_allDay" withType:"UILabel"];
}

- (void)_axAnnotateAllDayLabel
{
  id v2 = [(EKDayAllDayViewAccessibility *)self safeValueForKey:@"_allDay"];
  [v2 _accessibilitySetIsSpeakThisElement:0];
  [v2 setAccessibilityIdentifier:@"AllDayLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EKDayAllDayViewAccessibility;
  [(EKDayAllDayViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EKDayAllDayViewAccessibility *)self _axAnnotateAllDayLabel];
}

- (EKDayAllDayViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKDayAllDayViewAccessibility;
  objc_super v3 = -[EKDayAllDayViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(EKDayAllDayViewAccessibility *)v3 _axAnnotateAllDayLabel];
  }
  return v4;
}

@end