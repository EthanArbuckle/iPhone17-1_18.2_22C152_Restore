@interface _TVStackCommonTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateViewSupplementaryViews;
@end

@implementation _TVStackCommonTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackCommonTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVLabel"];
  [v3 validateClass:@"_TVStackWrappingView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackWrappingView", @"headerSupplementaryViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackCommonTemplateController", @"stackWrappingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackCommonTemplateController", @"_updateViewSupplementaryViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackCommonTemplateController", @"viewControllerWithElement:layout:existingController:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKViewElement", @"elementName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)_TVStackCommonTemplateControllerAccessibility;
  [(_TVStackCommonTemplateControllerAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVStackCommonTemplateControllerAccessibility *)self safeValueForKey:@"stackWrappingView"];
  char v18 = 0;
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"headerSupplementaryViews"];
  v5 = __UIAccessibilityCastAsClass();

  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x263F1CEF8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        NSClassFromString(&cfstr_Tvseparatorvie_0.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = objc_msgSend(v12, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0, (void)v14);
          if ([v13 length])
          {
            [v12 setIsAccessibilityElement:1];
            [v12 setAccessibilityTraits:v10];
            [v12 setAccessibilityLabel:v13];
          }
          else
          {
            [v12 setIsAccessibilityElement:0];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_updateViewSupplementaryViews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackCommonTemplateControllerAccessibility;
  [(_TVStackCommonTemplateControllerAccessibility *)&v3 _updateViewSupplementaryViews];
  [(_TVStackCommonTemplateControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end