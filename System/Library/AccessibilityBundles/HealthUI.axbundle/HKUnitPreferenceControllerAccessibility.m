@interface HKUnitPreferenceControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityNameForDisplayType:(id)a3;
- (id)accessibilityNameForUnit:(id)a3;
@end

@implementation HKUnitPreferenceControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKUnitPreferenceController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityNameForUnit:(id)a3
{
  id v3 = a3;
  v4 = [v3 unitString];
  char v5 = [v4 isEqualToString:@"mi"];

  if (v5)
  {
    v6 = @"miles";
LABEL_5:
    v9 = accessibilityLocalizedString(v6);
    goto LABEL_7;
  }
  v7 = [v3 unitString];
  int v8 = [v7 isEqualToString:@"km"];

  if (v8)
  {
    v6 = @"kilometers";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)accessibilityNameForDisplayType:(id)a3
{
  id v4 = a3;
  char v17 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  id v5 = v4;
  AXPerformSafeBlock();
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  v7 = __UIAccessibilitySafeClass();

  if (v17) {
    abort();
  }
  int v8 = -[HKUnitPreferenceControllerAccessibility accessibilityNameForUnit:](self, "accessibilityNameForUnit:", v7, v10, 3221225472, __75__HKUnitPreferenceControllerAccessibility_accessibilityNameForDisplayType___block_invoke, &unk_265125E28, self);

  return v8;
}

uint64_t __75__HKUnitPreferenceControllerAccessibility_accessibilityNameForDisplayType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) unitForDisplayType:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end