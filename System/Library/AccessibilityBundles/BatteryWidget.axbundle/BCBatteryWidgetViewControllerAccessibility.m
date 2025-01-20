@interface BCBatteryWidgetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateRowView:(id)a3 withDevice:(id)a4 animated:(BOOL)a5;
@end

@implementation BCBatteryWidgetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCBatteryWidgetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCBatteryWidgetViewController", @"_updateRowView:withDevice:animated:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCBatteryWidgetRowView", @"glyphImage", "@", 0);
}

- (void)_updateRowView:(id)a3 withDevice:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCBatteryWidgetViewControllerAccessibility;
  [(BCBatteryWidgetViewControllerAccessibility *)&v15 _updateRowView:v8 withDevice:v9 animated:v5];
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  uint64_t v11 = [v10 parts];
  if (v11)
  {
    if ((v11 & 3) == 1)
    {
      v12 = @"battery.center.left.airpod";
      goto LABEL_9;
    }
    if ((v11 & 3) == 2)
    {
      v12 = @"battery.center.right.airpod";
LABEL_9:
      v13 = accessibilityLocalizedString(v12);
      goto LABEL_10;
    }
    if ((v11 & 4) != 0)
    {
      v12 = @"battery.center.case.airpod";
      goto LABEL_9;
    }
  }
  v13 = 0;
LABEL_10:
  v14 = [v8 safeValueForKey:@"glyphImage"];
  [v14 setAccessibilityLabel:v13];
}

@end