@interface Calculator_UIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityActiveKeyboard;
@end

@implementation Calculator_UIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)_accessibilityActiveKeyboard
{
  v2 = [(Calculator_UIApplicationAccessibility *)self _accessibilityWindow];
  v3 = [v2 accessibilityViewWithIdentifier:@"CalculatorKeypadView"];

  return v3;
}

@end