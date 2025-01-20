@interface SUUIAttributedStringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLinks;
- (id)accessibilityCustomRotorItemsAtIndex:(int64_t)a3;
- (id)accessibilityCustomRotorTitles;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIAttributedStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIAttributedStringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIAttributedStringView" hasInstanceVariable:@"_layout" withType:"SUUIAttributedStringLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIAttributedStringLayout", @"attributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIAttributedStringView", @"requiredBadges", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIAttributedStringView", @"_setupTapLocatorContainer", "v", 0);
  [v3 validateClass:@"SUUIAttributedStringView" hasInstanceVariable:@"_containsLinks" withType:"B"];
  [v3 validateClass:@"SUUIAttributedStringView" hasInstanceVariable:@"_layoutManager" withType:"NSLayoutManager"];
  [v3 validateClass:@"SUUIAttributedStringView" hasInstanceVariable:@"_textContainer" withType:"NSTextContainer"];
  [v3 validateClass:@"SUUIAttributedStringView" hasInstanceVariable:@"_requiredBadges" withType:"NSArray"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SUUIAttributedStringViewAccessibility *)self accessibilityLabel];
  id v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  LOBYTE(v2) = [v4 length] != 0;
  return (char)v2;
}

- (id)accessibilityLabel
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(SUUIAttributedStringViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(SUUIAttributedStringViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    char v25 = 0;
    objc_opt_class();
    char v24 = 0;
    v5 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_layout"];
    v6 = __UIAccessibilitySafeClass();

    v7 = [v6 safeValueForKey:@"attributedString"];
    v8 = __UIAccessibilityCastAsClass();

    v4 = [v8 string];
  }
  char v25 = 0;
  objc_opt_class();
  v9 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_requiredBadges"];
  v10 = __UIAccessibilityCastAsClass();

  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v16)
        {
          v19 = [v16 accessibilityLabel];
          uint64_t v17 = __UIAXStringForVariables();

          v4 = (void *)v17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v13);
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v18 = 0;
  v14.receiver = self;
  v14.super_class = (Class)SUUIAttributedStringViewAccessibility;
  id v18 = [(SUUIAttributedStringViewAccessibility *)&v14 accessibilityTraits];
  objc_opt_class();
  char v13 = 0;
  id v3 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_layout"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"attributedString"];
  v6 = __UIAccessibilityCastAsClass();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v7 = [v6 length];
  uint64_t v8 = *MEMORY[0x263F1C238];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__SUUIAttributedStringViewAccessibility_accessibilityTraits__block_invoke;
  v11[3] = &unk_2651383A0;
  v11[4] = v12;
  v11[5] = &v15;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v11);
  unint64_t v9 = v16[3];
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__SUUIAttributedStringViewAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 lineHeight];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 20.0) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= *MEMORY[0x263F1CEF8];
  }
  return result;
}

- (id)_accessibilityLinks
{
  double v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_containsLinks"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"layout"];
    uint64_t v7 = [v6 safeValueForKey:@"attributedString"];

    uint64_t v8 = [v7 length];
    if (v8 >= 1)
    {
      uint64_t v9 = v8;
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke;
      uint64_t v27 = &unk_265138350;
      v28 = self;
      AXPerformSafeBlock();
      v10 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_layoutManager"];
      id v11 = [(SUUIAttributedStringViewAccessibility *)self safeValueForKey:@"_textContainer"];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke_2;
      id v18 = &unk_2651383C8;
      id v19 = v10;
      id v20 = v11;
      long long v21 = self;
      id v22 = v7;
      id v23 = v3;
      id v12 = v11;
      id v13 = v10;
      objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", @"SUUILinkAttributeName", 0, v9, 0, &v15);
    }
    [(SUUIAttributedStringViewAccessibility *)self _accessibilitySetRetainedValue:v3, @"kAXLinks", v15, v16, v17, v18 forKey];
  }

  return v3;
}

uint64_t __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupTapLocatorContainer];
}

void __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(void *)(a1 + 40));
    id v9 = (id)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:*(void *)(a1 + 48)];
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 56), "attributedSubstringFromRange:", a3, a4);
    uint64_t v8 = [v7 string];
    [v9 setAccessibilityLabel:v8];

    UIAccessibilityFrameForBounds();
    objc_msgSend(v9, "setAccessibilityFrame:");
    [v9 setAccessibilityTraits:*MEMORY[0x263F1CF10]];
    [*(id *)(a1 + 64) addObject:v9];
  }
}

- (id)accessibilityCustomRotors
{
  v15[1] = *MEMORY[0x263EF8340];
  double v3 = [(SUUIAttributedStringViewAccessibility *)self _accessibilityLinks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int v5 = [(SUUIAttributedStringViewAccessibility *)self _accessibilityValueForKey:@"AXCustomRotor"];
    if (!v5)
    {
      objc_initWeak(&location, self);
      id v6 = objc_alloc(MEMORY[0x263F1C398]);
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      id v11 = __66__SUUIAttributedStringViewAccessibility_accessibilityCustomRotors__block_invoke;
      id v12 = &unk_2651383F0;
      objc_copyWeak(&v13, &location);
      int v5 = (void *)[v6 initWithSystemType:1 itemSearchBlock:&v9];
      [(SUUIAttributedStringViewAccessibility *)self _accessibilitySetRetainedValue:v5, @"AXCustomRotor", v9, v10, v11, v12 forKey];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    v15[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __66__SUUIAttributedStringViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = [WeakRetained _accessibilityLinks];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v6 _accessibilityCustomRotorResultHelper:v3 array:v5];

  return v7;
}

- (id)accessibilityCustomRotorTitles
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)accessibilityCustomRotorItemsAtIndex:(int64_t)a3
{
  if (a3)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(SUUIAttributedStringViewAccessibility *)self _accessibilityLinks];
  }
  return v5;
}

@end