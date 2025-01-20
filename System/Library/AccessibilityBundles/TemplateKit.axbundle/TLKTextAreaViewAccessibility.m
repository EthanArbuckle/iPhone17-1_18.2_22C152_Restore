@interface TLKTextAreaViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKTextAreaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKTextAreaView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTextAreaView", @"titleContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTextAreaView", @"detailsFields", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTextAreaView", @"footnoteLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTitleContainerView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTitleContainerView", @"secondaryLabel", "@", 0);
}

- (id)accessibilityLabel
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(TLKTextAreaViewAccessibility *)self safeValueForKey:@"titleContainer"];
  v4 = [v3 safeValueForKey:@"secondaryLabel"];
  v5 = [(TLKTextAreaViewAccessibility *)self safeValueForKey:@"footnoteLabel"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v30 = 0;
  objc_opt_class();
  v7 = [(TLKTextAreaViewAccessibility *)self safeValueForKey:@"detailsFields"];
  v8 = __UIAccessibilityCastAsClass();

  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v14 _accessibilityViewIsVisible]) {
          [v6 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  v25 = v3;
  v15 = [v3 safeValueForKey:@"titleLabel"];
  v16 = [v15 accessibilityLabel];
  int v17 = [v4 _accessibilityViewIsVisible];
  v24 = v4;
  if (v17)
  {
    v18 = [v4 accessibilityLabel];
  }
  else
  {
    v18 = 0;
  }
  v19 = MEMORY[0x245666DB0](v6);
  v20 = v5;
  if ([v5 _accessibilityViewIsVisible])
  {
    v23 = [v5 accessibilityLabel];
    v21 = __UIAXStringForVariables();
  }
  else
  {
    v21 = __UIAXStringForVariables();
  }

  if (v17) {

  }
  return v21;
}

@end