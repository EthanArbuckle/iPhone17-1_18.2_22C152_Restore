@interface HUGridCameraCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsActiveGridCell;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation HUGridCameraCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridCameraCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCameraCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCameraCell", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridCellAccessibility", @"_axIsActiveGridCell", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HUGridCameraCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(HUGridCameraCellAccessibility *)self safeValueForKey:@"descriptionLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __AXStringForVariables();

  return v6;
}

- (BOOL)_axIsActiveGridCell
{
  return 0;
}

@end