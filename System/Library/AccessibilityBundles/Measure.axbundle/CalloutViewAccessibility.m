@interface CalloutViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axInternalIsActuallyVisible;
- (BOOL)isAccessibilityElement;
- (NSString)axCalloutText;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetInternalIsActuallyVisible:(BOOL)a3;
- (void)_axSetIsActuallyVisible:(BOOL)a3;
- (void)_axSetIsNotActuallyVisible;
- (void)_axUpdateIsVisible;
- (void)axDidUpdateFromPreviousCalloutText:(id)a3;
- (void)setAlpha:(double)a3;
@end

@implementation CalloutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.CalloutView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.CalloutView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"setAlpha:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.CalloutViewSpatial", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.CalloutViewRegular", @"label", "@", 0);
}

- (NSString)axCalloutText
{
  objc_opt_class();
  id v3 = [(CalloutViewAccessibility *)self safeValueForKey:@"label"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return (NSString *)v5;
}

- (void)axDidUpdateFromPreviousCalloutText:(id)a3
{
  id v5 = a3;
  v4 = [(CalloutViewAccessibility *)self axCalloutText];
  if ([(CalloutViewAccessibility *)self _axIsActuallyVisible]
    && ([v5 isEqualToString:v4] & 1) == 0
    && [v4 length])
  {
    AXMeasureSpeakMeasurementAnnouncement(v4);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CalloutViewAccessibility;
  [(CalloutViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CalloutViewAccessibility *)self _axUpdateIsVisible];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"CALLOUT_VIEW");
}

- (BOOL)_axInternalIsActuallyVisible
{
  return MEMORY[0x270F0A438](self, &__CalloutViewAccessibility___axInternalIsActuallyVisible);
}

- (void)_axSetInternalIsActuallyVisible:(BOOL)a3
{
}

- (void)_axSetIsNotActuallyVisible
{
}

- (void)_axSetIsActuallyVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CalloutViewAccessibility *)self _axInternalIsActuallyVisible] != a3)
  {
    [(CalloutViewAccessibility *)self _axSetInternalIsActuallyVisible:v3];
    if (v3)
    {
      id v5 = [(CalloutViewAccessibility *)self axCalloutText];
      uint64_t v6 = [v5 length];

      if (v6)
      {
        v7 = [(CalloutViewAccessibility *)self axCalloutText];
        AXMeasureSpeakMeasurementAnnouncement(v7);
      }
    }
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v8, 0);
  }
}

- (void)_axUpdateIsVisible
{
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  [v3 alpha];
  double v5 = fabs(v4 + -1.0);

  if (v5 >= 2.22044605e-16)
  {
    [(CalloutViewAccessibility *)self performSelector:sel__axSetIsNotActuallyVisible withObject:0 afterDelay:0.5];
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__axSetIsNotActuallyVisible object:0];
    [(CalloutViewAccessibility *)self _axSetIsActuallyVisible:1];
  }
}

- (void)setAlpha:(double)a3
{
  char v10 = 0;
  objc_opt_class();
  double v5 = __UIAccessibilityCastAsClass();
  [v5 alpha];
  double v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)CalloutViewAccessibility;
  [(CalloutViewAccessibility *)&v9 setAlpha:a3];
  [v5 alpha];
  if (vabdd_f64(v7, v8) >= 2.22044605e-16) {
    [(CalloutViewAccessibility *)self _axUpdateIsVisible];
  }
}

@end