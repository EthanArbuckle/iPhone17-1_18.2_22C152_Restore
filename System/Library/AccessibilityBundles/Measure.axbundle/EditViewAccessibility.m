@interface EditViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didTapEditButton;
- (void)setAlpha:(double)a3;
@end

@implementation EditViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.EditView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.EditView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.EditView", @"didTapEditButton", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"setAlpha:", "v", "d", 0);
}

- (void)setAlpha:(double)a3
{
  char v10 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  [v5 alpha];
  double v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)EditViewAccessibility;
  [(EditViewAccessibility *)&v9 setAlpha:a3];
  [v5 alpha];
  if (vabdd_f64(v7, v8) >= 2.22044605e-16) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)didTapEditButton
{
  id v3 = AXMeasureAccessibilityStateObserver();
  [v3 axHasConfirmedRectangle];

  v5.receiver = self;
  v5.super_class = (Class)EditViewAccessibility;
  [(EditViewAccessibility *)&v5 didTapEditButton];
  v4 = accessibilityLocalizedString(@"DID_ADD_FIRST_POINT");
  AXMeasureAnnounceUpdatedMeasurement(v4, 0);
}

@end