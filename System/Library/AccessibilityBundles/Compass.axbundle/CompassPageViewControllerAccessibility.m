@interface CompassPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CompassPageViewControllerAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnounceDegreesIfNeeded:(double)a3;
- (void)_updateDegreesLabel:(BOOL)a3;
- (void)setCrosshairLevelForData:(id)a3;
@end

@implementation CompassPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompassPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompassPageViewController", @"setCrosshairLevelForData:", "v", "{?=ddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompassPageViewController", @"_updateDegreesLabel:", "v", "B", 0);
  [v3 validateClass:@"CompassController" hasInstanceVariable:@"_compassPageController" withType:"CompassPageViewController"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_coordinatesLabel" withType:"CompassCopyableLabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_directionLabel" withType:"UILabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_degreesLabel" withType:"UILabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_degreesSymbolLabel" withType:"UILabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_compassView" withType:"CompassView"];
  [v3 validateClass:@"CompassView" hasInstanceVariable:@"_compassBackground" withType:"CompassBackgroundView"];
  objc_opt_class();
  [v3 validateClass:@"CompassBackgroundView" hasInstanceVariable:@"_currentOffset" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_currentCompassAngle" withType:"d"];
}

- (void)_axAnnounceDegreesIfNeeded:(double)a3
{
  if (a3 >= 0.0
    && (fabs(a3 + 1.0) < 2.22044605e-16
     || vabdd_f64(*(double *)&_axAnnounceDegreesIfNeeded__LastAnnouncedLocation, a3) > 10.0
     && CFAbsoluteTimeGetCurrent() - *(double *)&_axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced > 2.0))
  {
    _axAnnounceDegreesIfNeeded__LastAnnouncedLocation = *(void *)&a3;
    _axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced = CFAbsoluteTimeGetCurrent();
    v5 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"_degreesLabel"];
    id v12 = [v5 accessibilityLabel];

    v6 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"_degreesSymbolLabel"];
    v7 = [v6 accessibilityLabel];

    v8 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"_directionLabel"];
    v9 = [v8 accessibilityLabel];

    v10 = [v12 stringByAppendingString:v7];
    v11 = __UIAXStringForVariables();
    UIAccessibilitySpeakIfNotSpeaking();
  }
}

- (CompassPageViewControllerAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)CompassPageViewControllerAccessibility;
  v2 = [(CompassPageViewControllerAccessibility *)&v4 init];
  [(CompassPageViewControllerAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CompassPageViewControllerAccessibility;
  [(CompassPageViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityIdentifier:@"compassPageView"];
}

- (void)_updateDegreesLabel:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CompassPageViewControllerAccessibility;
  [(CompassPageViewControllerAccessibility *)&v5 _updateDegreesLabel:a3];
  objc_super v4 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"_currentCompassAngle"];
  [v4 doubleValue];
  -[CompassPageViewControllerAccessibility _axAnnounceDegreesIfNeeded:](self, "_axAnnounceDegreesIfNeeded:");
}

- (void)setCrosshairLevelForData:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CompassPageViewControllerAccessibility;
  -[CompassPageViewControllerAccessibility setCrosshairLevelForData:](&v17, sel_setCrosshairLevelForData_, a3.var0, a3.var1, a3.var2);
  objc_super v4 = [(CompassPageViewControllerAccessibility *)self safeValueForKey:@"_compassView"];
  objc_super v5 = [v4 safeValueForKey:@"_compassBackground"];
  v6 = [v5 safeValueForKey:@"_currentOffset"];
  [v6 CGPointValue];
  double v8 = v7;
  double v10 = v9;

  double v11 = fabs(v8);
  double v12 = fabs(v10);
  BOOL v13 = v11 <= 2.5 && v12 <= 2.5;
  if (!v13 && (setCrosshairLevelForData__IsWithinLevelRadius & 1) != 0)
  {
    char v14 = 0;
    v15 = (id *)MEMORY[0x263F21928];
LABEL_13:
    setCrosshairLevelForData__IsWithinLevelRadius = v14;
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], *v15);
    goto LABEL_14;
  }
  BOOL v16 = v11 > 2.5 || v12 > 2.5;
  if (!v16 && (setCrosshairLevelForData__IsWithinLevelRadius & 1) == 0)
  {
    v15 = (id *)MEMORY[0x263F21920];
    char v14 = 1;
    goto LABEL_13;
  }
LABEL_14:
}

@end