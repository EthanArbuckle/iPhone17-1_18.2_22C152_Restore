@interface HUColorPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setSelectedColor:(id)a3;
@end

@implementation HUColorPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUColorPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorPickerView", @"setSelectedColor:", "v", "{?=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorPickerView", @"magnifierView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlMagnifierView", @"selectedColor", "@", 0);
}

- (void)setSelectedColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUColorPickerViewAccessibility;
  -[HUColorPickerViewAccessibility setSelectedColor:](&v8, sel_setSelectedColor_, a3.var0, a3.var1, a3.var2, a3.var3);
  if (CFAbsoluteTimeGetCurrent() - *(double *)&setSelectedColor__LastTime > 1.0)
  {
    objc_opt_class();
    v4 = [(HUColorPickerViewAccessibility *)self safeValueForKey:@"magnifierView"];
    v5 = [v4 safeValueForKey:@"selectedColor"];
    v6 = __UIAccessibilityCastAsClass();

    v7 = AXColorStringForColor();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
    setSelectedColor__LastTime = CFAbsoluteTimeGetCurrent();
  }
}

@end