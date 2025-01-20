@interface KeyboardControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)specifiers;
@end

@implementation KeyboardControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"KeyboardController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"KeyboardController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"KeyboardController", @"specifiers", "@", 0);
}

- (id)specifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)KeyboardControllerAccessibility;
  [(KeyboardControllerAccessibility *)&v16 specifiers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x263F60170];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "propertyForKey:", v6, (void)v12);
        int v10 = [v9 isEqualToString:@"KeyboardPeriodShortcut"];

        if (v10)
        {
          [v8 accessibilitySetIdentification:@"KeyboardPeriodShortcut"];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

@end