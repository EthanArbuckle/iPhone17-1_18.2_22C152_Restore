@interface HeadphoneImageBatteryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateWithBattery:(id)a3;
@end

@implementation HeadphoneImageBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SharingViewService.HeadphoneImageBatteryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SharingViewService.HeadphoneImageBatteryView"];
  [v3 validateClass:@"SharingViewService.HeadphoneImageBatteryView" hasSwiftField:@"batteryView" withSwiftType:"LabelledBatteryView"];
  [v3 validateClass:@"SharingViewService.HeadphoneImageBatteryView" hasSwiftField:@"imageViews" withSwiftType:"Array<SFAdjustedImageView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SharingViewService.HeadphoneImageBatteryView", @"updateWithBattery:", "v", "@", 0);
}

- (void)updateWithBattery:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HeadphoneImageBatteryViewAccessibility;
  [(HeadphoneImageBatteryViewAccessibility *)&v11 updateWithBattery:v4];
  uint64_t v5 = [v4 safeIntegerForKey:@"batteryType"];
  objc_opt_class();
  v6 = [(HeadphoneImageBatteryViewAccessibility *)self safeSwiftValueForKey:@"batteryView"];
  v7 = __UIAccessibilityCastAsSafeCategory();

  v8 = [(HeadphoneImageBatteryViewAccessibility *)self safeSwiftArrayForKey:@"imageViews"];
  v9 = v8;
  if (v5 == 1)
  {
    v10 = @"battery.case";
LABEL_9:
    [v7 setAXBatteryType:v10];
    goto LABEL_10;
  }
  if ((unint64_t)[v8 count] > 1)
  {
    v10 = @"battery.combined.earbuds";
    goto LABEL_9;
  }
  if (v5 == 2)
  {
    v10 = @"battery.left.earbud";
    goto LABEL_9;
  }
  if (v5 == 3)
  {
    v10 = @"battery.right.earbud";
    goto LABEL_9;
  }
LABEL_10:
}

@end