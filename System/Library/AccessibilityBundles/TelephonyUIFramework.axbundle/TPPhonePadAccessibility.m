@interface TPPhonePadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityScannerGroupElements;
- (id)accessibilityElements;
- (unint64_t)_accessibilityScannerGroupTraits;
@end

@implementation TPPhonePadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPPhonePad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v3 = [(TPPhonePadAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v3)
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    -[TPPhonePadAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:");
    uint64_t v4 = 0;
    uint64_t v24 = *MEMORY[0x263F1CF08] | *MEMORY[0x263F1CF28];
    uint64_t v26 = *MEMORY[0x263EFFB40];
    do
    {
      v5 = (void *)[objc_allocWithZone((Class)TPButtonAccessibilityElement) initWithAccessibilityContainer:self];
      v6 = AX_kKeyStrs[v4];
      v7 = [(TPPhonePadAccessibility *)self _buttonForKeyAtIndex:v4];
      v8 = v7;
      if (v7)
      {
        v9 = [v7 accessibilityLabel];
        if ([v9 length])
        {
          v10 = v9;

          uint64_t v11 = [v8 accessibilityTraits];
          v6 = v10;
        }
        else
        {
          uint64_t v11 = v24;
        }
      }
      else
      {
        uint64_t v11 = v24;
      }
      objc_msgSend(v5, "setAccessibilityTraits:", v11, v24);
      v12 = [MEMORY[0x263F21660] axAttributedStringWithString:v6];
      [v12 setAttribute:v26 forKey:*MEMORY[0x263F21810]];
      [v5 setAccessibilityLabel:v12];
      v13 = (void *)MEMORY[0x263F21660];
      v14 = [(__CFString *)AX_kLettersStrings[v4] lowercaseString];
      v15 = [v13 axAttributedStringWithString:v14];

      [v15 setAttribute:v26 forKey:*MEMORY[0x263F217C8]];
      [v5 setAccessibilityHint:v15];
      uint64_t v27 = 0;
      v28 = (double *)&v27;
      uint64_t v29 = 0x4010000000;
      v30 = &unk_242661CA6;
      long long v31 = 0u;
      long long v32 = 0u;
      AXPerformSafeBlock();
      double v16 = v28[4];
      double v17 = v28[5];
      double v18 = v28[6];
      double v19 = v28[7];
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v5, "setAccessibilityFrameInContainerSpace:", v16, v17, v18, v19);
      v20 = [v5 accessibilityLabel];
      uint64_t v21 = [v20 length];

      if (v21) {
        [v25 addObject:v5];
      }

      ++v4;
    }
    while (v4 != 12);
    v3 = v25;
  }
  id v22 = v3;

  return v22;
}

uint64_t __48__TPPhonePadAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rectForKey:*(int *)(a1 + 48)];
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  v18[2] = *MEMORY[0x263EF8340];
  id v16 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  v15 = [(TPPhonePadAccessibility *)self accessibilityElements];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  int v5 = 0;
  uint64_t v6 = AX_kKeyStrs;
  do
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    ++v5;
    do
    {
      if ([(__CFString *)v6[v7] length])
      {
        uint64_t v9 = 1;
      }
      else
      {
        v10 = [(TPPhonePadAccessibility *)self _buttonForKeyAtIndex:v3 + v7];
        uint64_t v11 = [v10 accessibilityLabel];
        uint64_t v9 = [v11 length] != 0;
      }
      v8 += v9;
      ++v7;
    }
    while (v7 != 3);
    v12 = objc_msgSend(v15, "subarrayWithRange:", v4, v8);
    v17[0] = @"GroupElements";
    v17[1] = @"GroupTraits";
    v18[0] = v12;
    v18[1] = &unk_26F80FC30;
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v16 addObject:v13];
    v4 += v8;

    v3 += 3;
    v6 += 3;
  }
  while (v5 != 4);

  return v16;
}

@end