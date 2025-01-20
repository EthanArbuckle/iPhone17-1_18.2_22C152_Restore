@interface VehiclePickerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VehiclePickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VehiclePickerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VehiclePickerButton", @"colorView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VehiclePickerButton", @"isActive", "B", 0);
}

- (id)accessibilityLabel
{
  v2 = [(VehiclePickerButtonAccessibility *)self safeUIViewForKey:@"colorView"];
  id v3 = [v2 backgroundColor];
  v4 = AXMapsStringForVehicleColor(v3);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)VehiclePickerButtonAccessibility;
  unint64_t v3 = [(VehiclePickerButtonAccessibility *)&v7 accessibilityTraits];
  int v4 = [(VehiclePickerButtonAccessibility *)self safeBoolForKey:@"isActive"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end