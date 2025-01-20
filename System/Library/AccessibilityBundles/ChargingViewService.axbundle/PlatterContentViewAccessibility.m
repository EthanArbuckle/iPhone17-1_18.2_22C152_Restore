@interface PlatterContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PlatterContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PlatterContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PlatterContentView", @"deviceNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PlatterContentView", @"batteryView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PlatterContentViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"deviceNameLabel"];
}

- (id)accessibilityValue
{
  v2 = [(PlatterContentViewAccessibility *)self safeValueForKey:@"batteryView"];
  id v3 = [v2 accessibilityLabel];
  v6 = [v2 accessibilityValue];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end