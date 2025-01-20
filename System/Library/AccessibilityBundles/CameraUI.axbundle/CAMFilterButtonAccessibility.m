@interface CAMFilterButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CAMFilterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFilterButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMFilterButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"CAMViewfinderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_effectFilterTypeForMode:", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CAMEffectFilterManager", @"displayNameForType:", "@", "q", 0);
}

- (id)accessibilityIdentifier
{
  return @"Filters";
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"filter.button");
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(@"filter.button.hint");
}

- (id)accessibilityValue
{
  v2 = [(CAMFilterButtonAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMViewfinderView", a2)];
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
  v4 = __UIAccessibilitySafeClass();

  uint64_t v5 = [v4 safeIntegerForKey:@"_currentMode"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v13 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke;
  v19 = &unk_2650A00D0;
  v21 = &v10;
  id v6 = v4;
  id v20 = v6;
  uint64_t v22 = v5;
  AXPerformSafeBlock();
  uint64_t v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v6)
  {
    accessibilityCameraKitLocalizedString(@"no.selected.filter");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__7;
    v14 = __Block_byref_object_dispose__7;
    id v15 = 0;
    AXPerformSafeBlock();
    id v8 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }

  return v8;
}

uint64_t __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _effectFilterTypeForMode:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50__CAMFilterButtonAccessibility_accessibilityValue__block_invoke_335(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)MEMORY[0x2455E18B0](@"CAMEffectFilterManager") displayNameForType:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end