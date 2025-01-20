@interface HeadphoneMovieBatteryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (CGRect)accessibilityFrame;
- (void)updateWithBatteries:(id)a3;
@end

@implementation HeadphoneMovieBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SharingViewService.HeadphoneMovieBatteryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SharingViewService.HeadphoneMovieBatteryView"];
  [v3 validateClass:@"SharingViewService.HeadphoneMovieBatteryView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SharingViewService.HeadphoneMovieBatteryView" hasSwiftField:@"batteryViews" withSwiftType:"Array<LabelledBatteryView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SharingViewService.HeadphoneMovieBatteryView", @"updateWithBatteries:", "v", "@", 0);
  [v3 validateClass:@"SFBatteryInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFBatteryInfo", @"batteryType", "q", 0);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  v7.receiver = self;
  v7.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  [(HeadphoneMovieBatteryViewAccessibility *)&v7 accessibilityFrame];
  BOOL result = 1;
  if (fabs(v3) >= 0.001 && fabs(v4) >= 0.001 && v3 > 0.0 && v4 > 0.0)
  {
    v6.receiver = self;
    v6.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
    return [(HeadphoneMovieBatteryViewAccessibility *)&v6 _accessibilityOverridesInvalidFrames];
  }
  return result;
}

- (CGRect)accessibilityFrame
{
  v21.receiver = self;
  v21.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  [(HeadphoneMovieBatteryViewAccessibility *)&v21 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  if (fabs(v2) < 0.001 || fabs(v3) < 0.001 || v2 <= 0.0 || v3 <= 0.0)
  {
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    v11 = [v10 superview];
    v12 = v11;
    if (v11)
    {
      [v11 accessibilityFrame];
      double v5 = v13;
      double v7 = v14;
      double v8 = v15;
      double v9 = v16;
    }
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v8;
  double v20 = v9;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)updateWithBatteries:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  id v4 = a3;
  [(HeadphoneMovieBatteryViewAccessibility *)&v9 updateWithBatteries:v4];
  double v5 = [(HeadphoneMovieBatteryViewAccessibility *)self safeSwiftArrayForKey:@"batteryViews"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HeadphoneMovieBatteryViewAccessibility_updateWithBatteries___block_invoke;
  v7[3] = &unk_265150580;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __62__HeadphoneMovieBatteryViewAccessibility_updateWithBatteries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 safeIntegerForKey:@"batteryType"];
  objc_opt_class();
  double v7 = [*(id *)(a1 + 32) axSafeObjectAtIndex:a3];
  id v8 = __UIAccessibilityCastAsSafeCategory();

  if (v6 == 1)
  {
    objc_super v9 = @"battery.case";
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    objc_super v9 = @"battery.combined.earbuds";
LABEL_5:
    [v8 setAXBatteryType:v9];
  }
}

@end