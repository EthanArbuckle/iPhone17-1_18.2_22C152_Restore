@interface ENUILegalDocumentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ENUILegalDocumentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ENUILegalDocumentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ENUILegalDocumentViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ENUILegalDocumentViewController", @"legalTextView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)ENUILegalDocumentViewControllerAccessibility;
  [(ENUILegalDocumentViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ENUILegalDocumentViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__ENUILegalDocumentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_26511F650;
  v4[4] = self;
  [v3 _setAccessibilityElementsBlock:v4];
}

id __90__ENUILegalDocumentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFF8C0];
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"legalTextView"];
  id v3 = objc_msgSend(v1, "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

@end