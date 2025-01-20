@interface WFBackgroundFadingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
@end

@implementation WFBackgroundFadingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFBackgroundFadingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFBackgroundFadingButton", @"backgroundColorsByState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFBackgroundFadingButton", @"setBackgroundColor:forState:", "v", "@", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)WFBackgroundFadingButtonAccessibility;
  [(WFBackgroundFadingButtonAccessibility *)&v30 _accessibilityLoadAccessibilityInformation];
  char v29 = 0;
  objc_opt_class();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __83__WFBackgroundFadingButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v20 = &unk_265169948;
  v21 = self;
  v22 = &v23;
  AXPerformSafeBlock();
  id v3 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  v4 = __UIAccessibilityCastAsClass();

  if (v29) {
    abort();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v4 objectForKey:v9];
        uint64_t v11 = [v9 unsignedIntegerValue];
        v12 = [NSNumber numberWithUnsignedInteger:v11 | 8];
        [v4 setObject:v10 forKey:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v31 count:16];
    }
    while (v6);
  }
}

uint64_t __83__WFBackgroundFadingButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) backgroundColorsByState];

  return MEMORY[0x270F9A758]();
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFBackgroundFadingButtonAccessibility;
  [(WFBackgroundFadingButtonAccessibility *)&v5 setBackgroundColor:a3 forState:a4];
  [(WFBackgroundFadingButtonAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end