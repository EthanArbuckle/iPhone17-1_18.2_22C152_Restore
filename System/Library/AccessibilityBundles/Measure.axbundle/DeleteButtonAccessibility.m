@interface DeleteButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (DeleteButtonAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateActualButton;
- (void)tapDeleteFrom:(id)a3;
@end

@implementation DeleteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.DeleteButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASVRoundedButton" isKindOfClass:@"ASVButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.DeleteButton", @"deleteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.DeleteButton", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.DeleteButton", @"tapDeleteFrom:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVButton", @"button", "@", 0);
}

- (void)_axAnnotateActualButton
{
  id v3 = [(DeleteButtonAccessibility *)self safeValueForKey:@"deleteButton"];
  v2 = [v3 safeValueForKey:@"button"];
  [v2 accessibilitySetIdentification:@"AXMeasureDeleteButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)DeleteButtonAccessibility;
  [(DeleteButtonAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(DeleteButtonAccessibility *)self _axAnnotateActualButton];
}

- (DeleteButtonAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DeleteButtonAccessibility;
  objc_super v3 = -[DeleteButtonAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DeleteButtonAccessibility *)v3 _axAnnotateActualButton];
  }
  return v4;
}

- (void)tapDeleteFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DeleteButtonAccessibility;
  [(DeleteButtonAccessibility *)&v4 tapDeleteFrom:a3];
  objc_super v3 = accessibilityLocalizedString(@"DID_CLEAR_POINTS");
  AXMeasureSpeakMeasurementAnnouncement(v3);
}

@end