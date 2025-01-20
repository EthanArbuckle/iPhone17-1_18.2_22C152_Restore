@interface CertUIKeyValueViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CertUIKeyValueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CertUIKeyValueView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CertUIKeyValueView", @"keyLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CertUIKeyValueView", @"valueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CertUIKeyValueView", @"verifiedLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CertUIKeyValueViewAccessibility *)self safeValueForKey:@"keyLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(CertUIKeyValueViewAccessibility *)self safeValueForKey:@"valueLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(CertUIKeyValueViewAccessibility *)self safeValueForKey:@"verifiedLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end