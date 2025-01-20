@interface HeadphoneBatteryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateBatteryLevels;
@end

@implementation HeadphoneBatteryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HeadphoneProxService.HeadphoneBatteryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HeadphoneProxService.HeadphoneBatteryViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HeadphoneProxService.HeadphoneBatteryViewController", @"updateBatteryLevels", "v", 0);
  [v3 validateClass:@"HeadphoneProxService.HeadphoneBatteryViewController" hasSwiftField:@"movieBatteryView" withSwiftType:"HeadphoneMovieBatteryView"];
  [v3 validateClass:@"HeadphoneProxService.HeadphoneMovieBatteryView" hasSwiftField:@"batteryViews" withSwiftType:"Array<LabelledBatteryView>"];
}

- (void)updateBatteryLevels
{
  v9.receiver = self;
  v9.super_class = (Class)HeadphoneBatteryViewControllerAccessibility;
  [(HeadphoneBatteryViewControllerAccessibility *)&v9 updateBatteryLevels];
  id v3 = [(HeadphoneBatteryViewControllerAccessibility *)self safeSwiftValueForKey:@"movieBatteryView"];
  v4 = [v3 safeSwiftArrayForKey:@"batteryViews"];
  if ([v4 count])
  {
    objc_opt_class();
    v5 = [v4 objectAtIndexedSubscript:0];
    v6 = __UIAccessibilityCastAsSafeCategory();

    [v6 setAXBatteryType:@"battery.combined.earbuds"];
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    objc_opt_class();
    v7 = [v4 objectAtIndexedSubscript:1];
    v8 = __UIAccessibilityCastAsSafeCategory();

    [v8 setAXBatteryType:@"battery.case"];
  }
}

@end