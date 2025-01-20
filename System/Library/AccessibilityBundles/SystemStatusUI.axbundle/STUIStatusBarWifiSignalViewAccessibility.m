@interface STUIStatusBarWifiSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySignalStrengthText;
- (id)accessibilityValue;
@end

@implementation STUIStatusBarWifiSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarWifiSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarWifiSignalViewAccessibility;
  v2 = [(STUIStatusBarWifiSignalViewAccessibility *)&v6 accessibilityValue];
  v3 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:@"SSID"];
  [v3 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21848]];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilitySignalStrengthText
{
  if (a1)
  {
    v3.receiver = a1;
    v3.super_class = (Class)STUIStatusBarWifiSignalViewAccessibility;
    a1 = objc_msgSendSuper2(&v3, sel_accessibilityValue);
    uint64_t v1 = vars8;
  }
  return a1;
}

@end