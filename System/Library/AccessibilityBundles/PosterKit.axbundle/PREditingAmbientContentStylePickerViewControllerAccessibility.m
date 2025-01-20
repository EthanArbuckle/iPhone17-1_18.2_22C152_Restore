@interface PREditingAmbientContentStylePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didTapContentStyleItemView:(id)a3;
@end

@implementation PREditingAmbientContentStylePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingAmbientContentStylePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingAmbientContentStylePickerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingAmbientContentStylePickerViewController", @"selectedItemView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingAmbientContentStylePickerViewController", @"didTapContentStyleItemView:", "v", "@", 0);
}

- (void)didTapContentStyleItemView:(id)a3
{
  id v4 = a3;
  v5 = [(PREditingAmbientContentStylePickerViewControllerAccessibility *)self safeValueForKey:@"selectedItemView"];
  v6 = v5;
  v7 = (void *)MEMORY[0x263F1CEE8];
  if (v5) {
    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  }
  v9.receiver = self;
  v9.super_class = (Class)PREditingAmbientContentStylePickerViewControllerAccessibility;
  [(PREditingAmbientContentStylePickerViewControllerAccessibility *)&v9 didTapContentStyleItemView:v4];
  v8 = [(PREditingAmbientContentStylePickerViewControllerAccessibility *)self safeValueForKey:@"selectedItemView"];

  if (v8) {
    [v8 setAccessibilityTraits:*MEMORY[0x263F1CF38] | *v7];
  }
}

@end