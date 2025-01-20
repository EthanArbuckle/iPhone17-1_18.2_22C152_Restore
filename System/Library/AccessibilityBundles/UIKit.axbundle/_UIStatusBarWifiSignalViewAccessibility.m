@interface _UIStatusBarWifiSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySignalStrengthText;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
@end

@implementation _UIStatusBarWifiSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarWifiSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySignalStrengthText
{
  v4 = a1;
  if (a1)
  {
    v3.receiver = v4;
    v3.super_class = (Class)_UIStatusBarWifiSignalViewAccessibility;
    id v5 = objc_msgSendSuper2(&v3, sel_accessibilityValue);
  }
  else
  {
    id v5 = 0;
  }
  v1 = v5;

  return v1;
}

- (id)accessibilityValue
{
  v6[2] = self;
  v6[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarWifiSignalViewAccessibility;
  v6[0] = [(_UIStatusBarWifiSignalViewAccessibility *)&v5 accessibilityValue];
  id v4 = (id)[objc_alloc(MEMORY[0x263F21660]) initWithString:@"SSID"];
  [v4 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21848]];
  id v3 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (id)accessibilityIdentifier
{
  return -[_UIStatusBarWifiSignalViewAccessibility _accessibilitySignalStrengthText](self);
}

@end