@interface MedicationsCategoryRoomTipViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MedicationsCategoryRoomTipViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.MedicationsCategoryRoomTipView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)MedicationsCategoryRoomTipViewAccessibility;
  [(MedicationsCategoryRoomTipViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(MedicationsCategoryRoomTipViewAccessibility *)self safeUIViewForKey:@"dismissButton"];
  v4 = accessibilityLocalizedString(@"close");
  [v3 setAccessibilityLabel:v4];
}

@end