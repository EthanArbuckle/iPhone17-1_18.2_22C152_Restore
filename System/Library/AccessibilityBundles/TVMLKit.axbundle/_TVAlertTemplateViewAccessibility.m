@interface _TVAlertTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setViewsAbove:(id)a3;
- (void)setViewsBelow:(id)a3;
@end

@implementation _TVAlertTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVAlertTemplateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVAlertTemplateView", @"viewsAbove", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVAlertTemplateView", @"viewsBelow", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)_TVAlertTemplateViewAccessibility;
  [(_TVAlertTemplateViewAccessibility *)&v29 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(_TVAlertTemplateViewAccessibility *)self safeValueForKey:@"viewsAbove"];
  v4 = __UIAccessibilityCastAsClass();

  char v28 = 0;
  objc_opt_class();
  v5 = [(_TVAlertTemplateViewAccessibility *)self safeValueForKey:@"viewsBelow"];
  v6 = __UIAccessibilityCastAsClass();

  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
  v9 = (uint64_t *)MEMORY[0x263F1CEF8];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = *MEMORY[0x263F1CEF8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) setAccessibilityTraits:v12];
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    uint64_t v18 = *v9;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "setAccessibilityTraits:", v18, (void)v20);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)setViewsAbove:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateViewAccessibility;
  [(_TVAlertTemplateViewAccessibility *)&v4 setViewsAbove:a3];
  [(_TVAlertTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setViewsBelow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateViewAccessibility;
  [(_TVAlertTemplateViewAccessibility *)&v4 setViewsBelow:a3];
  [(_TVAlertTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end