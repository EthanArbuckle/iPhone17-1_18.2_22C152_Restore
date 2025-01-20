@interface COSPasskeyEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (COSPasskeyEntryViewControllerAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)textDidChange:(id)a3;
@end

@implementation COSPasskeyEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSPasskeyEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSPasskeyEntryViewController", @"init", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSPasskeyEntryViewController", @"textDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSPasskeyEntryViewController", @"passkeyField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSPasskeyEntryViewController", @"pinKeyView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  [(COSPasskeyEntryViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(COSPasskeyEntryViewControllerAccessibility *)self safeValueForKey:@"passkeyField"];
  [v3 setIsAccessibilityElement:0];
  v4 = [(COSPasskeyEntryViewControllerAccessibility *)self safeValueForKey:@"pinKeyView"];
  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"no.pin.entered");
  [v4 setAccessibilityLabel:v5];
}

- (COSPasskeyEntryViewControllerAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  v2 = [(COSPasskeyEntryViewControllerAccessibility *)&v4 init];
  [(COSPasskeyEntryViewControllerAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  return v2;
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  [(COSPasskeyEntryViewControllerAccessibility *)&v13 textDidChange:v4];
  objc_opt_class();
  v5 = [(COSPasskeyEntryViewControllerAccessibility *)self safeValueForKey:@"passkeyField"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 text];
  if ([v7 length])
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v7 length])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = objc_msgSend(NSString, "stringWithFormat:", @"%C", objc_msgSend(v7, "characterAtIndex:", v9));
        [v8 addObject:v10];

        ++v9;
      }
      while ([v7 length] > v9);
    }
    v11 = [(COSPasskeyEntryViewControllerAccessibility *)self safeValueForKey:@"pinKeyView"];
    v12 = [v8 componentsJoinedByString:@" "];
    [v11 setAccessibilityLabel:v12];
  }
  else
  {
    id v8 = [(COSPasskeyEntryViewControllerAccessibility *)self safeValueForKey:@"pinKeyView"];
    v11 = accessibilityLocalizedString(@"no.pin.entered");
    [v8 setAccessibilityLabel:v11];
  }
}

@end