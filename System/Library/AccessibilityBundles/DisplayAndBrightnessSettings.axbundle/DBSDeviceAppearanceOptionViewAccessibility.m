@interface DBSDeviceAppearanceOptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (float)_accessibilityActivationDelay;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DBSDeviceAppearanceOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSDeviceAppearanceOptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSDeviceAppearanceOptionView", @"_label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSDeviceAppearanceOptionView", @"_checkmarkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSCheckmarkView", @"isSelected", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id v3 = [(DBSDeviceAppearanceOptionViewAccessibility *)self safeUIViewForKey:@"_checkmarkView"];
  int v4 = [v3 safeBoolForKey:@"isSelected"];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(DBSDeviceAppearanceOptionViewAccessibility *)self safeUIViewForKey:@"_label"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (float)_accessibilityActivationDelay
{
  return 0.1;
}

@end