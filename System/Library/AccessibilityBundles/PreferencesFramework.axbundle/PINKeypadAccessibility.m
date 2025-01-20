@interface PINKeypadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityInternalChildren;
@end

@implementation PINKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PINKeypad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityInternalChildren
{
  objc_initWeak(location, self);
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  v35 = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke;
  v36 = &unk_265147278;
  objc_copyWeak(&v37, location);
  UIAccessibilityPerformBlockForOrientationChange();
  v3 = (void *)MEMORY[0x263F81490];
  id v4 = [(PINKeypadAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(PINKeypadAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
    uint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CF28];
    do
    {
      if (v5 != 9)
      {
        v7 = (void *)[objc_allocWithZone(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
        [v7 setAccessibilityTraits:v6];
        v8 = AX_kKeyStrs[v5];
        if ([(__CFString *)v8 length] == 1) {
          objc_msgSend(NSString, "localizedStringWithFormat:", @"%d", -[__CFString intValue](v8, "intValue"));
        }
        else {
        v9 = accessibilityLocalizedString(v8);
        }
        id from = 0;
        p_id from = &from;
        uint64_t v29 = 0x3032000000;
        v30 = __Block_byref_object_copy_;
        v31 = __Block_byref_object_dispose_;
        id v32 = 0;
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        v22 = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_314;
        v23 = &unk_2651472A0;
        v24 = self;
        v25 = &from;
        int v26 = v5;
        AXPerformSafeBlock();
        id v10 = p_from[5];
        _Block_object_dispose(&from, 8);

        if (v10)
        {
          v11 = [v10 accessibilityLabel];
          if ([v11 length])
          {
            id v12 = v4;
            uint64_t v13 = v6;
            id v14 = v11;

            v9 = v14;
            uint64_t v6 = v13;
            id v4 = v12;
          }
        }
        objc_initWeak(&from, self);
        [v7 setAccessibilityLabel:v9];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_2;
        v17[3] = &unk_2651472C8;
        objc_copyWeak(&v18, &from);
        v17[4] = self;
        int v19 = v5;
        [v7 _setAccessibilityFrameBlock:v17];
        [v4 addObject:v7];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&from);
      }
      ++v5;
    }
    while (v5 != 12);
  }
  id v15 = v4;

  objc_destroyWeak(&v37);
  objc_destroyWeak(location);

  return v15;
}

void __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

uint64_t __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_314(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _buttonForKeyAtIndex:*(unsigned int *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

double __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4010000000;
  v5[3] = &unk_2424640D1;
  long long v6 = 0u;
  long long v7 = 0u;
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  UIAccessibilityFrameForBounds();
  double v3 = v2;

  return v3;
}

uint64_t __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rectForKey:*(unsigned int *)(a1 + 48)];
  double v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

@end