@interface MeasureUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformMagicTap;
- (int64_t)_accessibilityOrientationForCompareGeometry;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MeasureUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ViewController", @"accessibilityEditView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.EditView", @"didTapEditButton", "v", 0);
}

- (int64_t)_accessibilityOrientationForCompareGeometry
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 activeInterfaceOrientation];

  return v3;
}

- (BOOL)accessibilityPerformMagicTap
{
  int IsMeasuring = AXMeasureIsMeasuring();
  if (IsMeasuring) {
    AXPerformSafeBlock();
  }
  return IsMeasuring;
}

void __65__MeasureUIApplicationAccessibility_accessibilityPerformMagicTap__block_invoke()
{
  AXMeasureViewController();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 safeValueForKey:@"accessibilityEditView"];
  [v0 didTapEditButton];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MeasureUIApplicationAccessibility;
  [(MeasureUIApplicationAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  id v2 = AXMeasureAccessibilityStateObserver();
}

@end