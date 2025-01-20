@interface HUIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation HUIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconView", @"currentIconContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUIconContentView", @"iconDescriptor", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(HUIconViewAccessibility *)self safeValueForKey:@"currentIconContentView"];
  id v3 = [v2 safeValueForKey:@"iconDescriptor"];

  objc_opt_class();
  v4 = [v3 safeValueForKey:@"identifier"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = accessibilityLabelForIconIdentifier((uint64_t)v5);
  v9 = [v3 accessibilityValue];
  v7 = __AXStringForVariables();

  return v7;
}

@end