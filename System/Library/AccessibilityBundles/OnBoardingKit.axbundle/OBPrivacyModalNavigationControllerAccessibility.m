@interface OBPrivacyModalNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation OBPrivacyModalNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBPrivacyModalNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBPrivacyModalNavigationController", @"_doneButtonPressed", "v", 0);
  [v3 validateClass:@"OBPrivacyModalNavigationController" isKindOfClass:@"UINavigationController"];
}

- (BOOL)accessibilityPerformEscape
{
  LOBYTE(v14) = 0;
  objc_opt_class();
  id v3 = [(OBPrivacyModalNavigationControllerAccessibility *)self safeValueForKey:@"viewControllers"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 count] == 1)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __77__OBPrivacyModalNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v11 = &unk_26513F2C8;
    v12 = self;
    v13 = &v14;
    AXPerformSafeBlock();
    unsigned __int8 v5 = *((unsigned char *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OBPrivacyModalNavigationControllerAccessibility;
    unsigned __int8 v5 = [(OBPrivacyModalNavigationControllerAccessibility *)&v7 accessibilityPerformEscape];
  }

  return v5;
}

uint64_t __77__OBPrivacyModalNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _doneButtonPressed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end