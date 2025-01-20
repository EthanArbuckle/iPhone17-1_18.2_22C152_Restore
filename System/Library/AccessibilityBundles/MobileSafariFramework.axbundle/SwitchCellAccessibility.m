@interface SwitchCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityElement;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SwitchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFBrowsingAssistantSwitchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFBrowsingAssistantSwitchCell" hasSwiftField:@"switch" withSwiftType:"UISwitch"];
  [v3 validateClass:@"UISwitch" hasInstanceVariable:@"_on" withType:"BOOL"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SwitchCellAccessibility;
  [(SwitchCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SwitchCellAccessibility *)self safeSwiftValueForKey:@"switch"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)accessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v7.receiver = self;
  v7.super_class = (Class)SwitchCellAccessibility;
  [(SwitchCellAccessibility *)&v7 accessibilityActivate];
  id v3 = [(SwitchCellAccessibility *)self safeSwiftValueForKey:@"switch"];
  objc_super v4 = [v3 safeValueForKey:@"_on"];
  int v5 = [v4 BOOLValue];

  [v3 setOn:v5 ^ 1u animated:1];
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(SwitchCellAccessibility *)self safeSwiftValueForKey:@"switch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

@end