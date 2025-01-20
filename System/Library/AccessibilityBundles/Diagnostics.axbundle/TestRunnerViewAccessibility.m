@interface TestRunnerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)subviewsForStackViewElement;
@end

@implementation TestRunnerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Diagnostics.TestRunnerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)subviewsForStackViewElement
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  char v17 = 0;
  objc_opt_class();
  v4 = [(TestRunnerViewAccessibility *)self safeValueForKey:@"stackView"];
  v5 = __UIAccessibilityCastAsClass();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(v5, "arrangedSubviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) subviews];
        [v3 axSafelyAddObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v3;
}

@end